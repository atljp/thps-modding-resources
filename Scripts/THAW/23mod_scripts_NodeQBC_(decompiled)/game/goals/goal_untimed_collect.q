Goal_UntimedCollect_GenericParams = {
    goal_text = 'Znajd X rzeczy!'
    view_goals_text = 'Standardowy tekst \'znajd przedmioty\''
    init = goal_untimed_collect_init
    uninit = goal_uninit
    activate = goal_untimed_collect_activate
    deactivate = goal_untimed_collect_deactivate
    expire = goal_untimed_collect_expire
    fail = goal_untimed_collect_fail
    success = goal_untimed_collect_success
    restart_node = TRG_G_UNTIMEDCOLLECT_RestartNode
    trigger_obj_id = TRG_G_UNTIMEDCOLLECT_Pro
    record_type = None
    unlimited_time = 1
    no_restart
    UntimedCollect
    goal_type_checksum = UntimedCollect
}

script goal_untimed_collect_init 
    if GotParam goal_collect_objects
        GetArraySize <goal_collect_objects>
        <index> = 0
        GoalManager_EditGoal name = <goal_id> params = { num_to_collect = <array_size> }
        begin 
        goal_untimed_collect_init_object {
            goal_id = <goal_id>
            (<goal_collect_objects> [ <index> ])
            inner_radius = <collect_object_radius>
        }
        <index> = (<index> + 1)
        repeat <array_size>
    else
        script_assert 'No goal_collect_objects array defined for %s.' s = <goal_id>
    endif
    goal_init goal_id = <goal_id>
endscript

script goal_untimed_collect_init_object 
    if NOT GotParam \{ inner_radius }
        <inner_radius> = 5
    endif
    Create name = <id>
    <id> ::obj_setinnerradius <inner_radius>
    <id> ::Obj_SetException Ex = objectinradius scr = goal_untimed_collect_got_object params = { goal_id = <goal_id> }
endscript

script goal_untimed_collect_activate 
    if NOT GotParam \{ num_objects_collected }
        <num_objects_collected> = 0
    endif
    if (<num_objects_collected> > (<num_to_collect> - 1))
        <trigger_obj_id> ::Obj_ClearExceptions
        speech_box_exit \{ anchor_id = goal_start_dialog }
        SpawnScriptLater goal_untimed_collect_wait_and_win params = { goal_id = <goal_id> }
    else
        SpawnScriptLater goal_untimed_collect_wait_and_deactivate params = { goal_id = <goal_id> }
        goal_start goal_id = <goal_id>
    endif
endscript

script goal_untimed_collect_wait_and_deactivate 
    Block \{ type = goal_cam_anim_post_start_done }
    GoalManager_DeactivateGoal name = <goal_id>
endscript

script goal_untimed_collect_deactivate 
    GoalManager_ResetGoalTrigger name = <goal_id>
    goal_deactivate goal_id = <goal_id>
endscript

script goal_untimed_collect_expire 
    goal_expire goal_id = <goal_id>
endscript

script goal_untimed_collect_fail 
    goal_fail goal_id = <goal_id>
endscript

script goal_untimed_collect_success 
    goal_success goal_id = <goal_id>
endscript

script goal_untimed_collect_wait_and_win 
    wait \{ 1 frame }
    GoalManager_WinGoal name = <goal_id>
endscript

script goal_untimed_collect_got_object 
    Obj_ClearExceptions
    GoalManager_GetGoalParams name = <goal_id>
    if NOT GotParam \{ num_objects_collected }
        <num_objects_collected> = 1
    else
        <num_objects_collected> = (<num_objects_collected> + 1)
        if (<num_objects_collected> > (<num_to_collect> - 1))
            create_panel_message \{ text = 'Zebra³e wszystko!' }
        endif
    endif
    GoalManager_EditGoal name = <goal_id> params = { num_objects_collected = <num_objects_collected> }
    Die
endscript
