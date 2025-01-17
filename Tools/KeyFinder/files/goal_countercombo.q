
goal_countercombo_genericParams = {
    goal_text = 'Countercombo the spot generic text'
    view_goals_text = 'CounterCombo goal'
    time = 120
    init = goal_countercombo_init
    uninit = goal_uninit
    activate = goal_countercombo_activate
    active = goal_countercombo_active
    success = goal_countercombo_success
    fail = goal_countercombo_fail
    deactivate = goal_countercombo_deactivate
    expire = goal_countercombo_expire
    trigger_obj_id = TRG_G_COUNTERCOMBO_Pro
    start_pad_id = G_COUNTERCOMBO_StartPad
    restart_node = TRG_G_COUNTERCOMBO_RestartNode
    number = 10
    got_first_object = 0
    countercombo_objects = [{ id = Sch_CountercomboSpot01 }
        { id = Sch_CountercomboSpot02 }
    ]
    goal_countercombo_object_init_script = goal_countercombo_init_object
    goal_countercombo_got_object_script = goal_countercombo_got_object
    number_collected = 0
    record_type = Score
    exceptions_set = 0
}

script goal_countercombo_init 
    goal_init goal_id = <goal_id>
endscript


script goal_countercombo_activate 
    goal_start goal_id = <goal_id>
    ForEachIn <countercombo_objects> do = goal_countercombo_run_init_object_script params = <...> 
endscript


script goal_countercombo_run_init_object_script 
    RunScriptOnObject id = <id> <goal_countercombo_object_init_script> params = <...> 
endscript


script goal_countercombo_init_object 
    GoalManager_GetGoalParams name = <goal_id>
    RunScriptOnObject id = <id> goal_countercombo_init_object2 params = <...> 
endscript


script goal_countercombo_init_object2 
    Obj_ClearExceptions
    Obj_SetException Ex = objectinradius scr = <goal_countercombo_got_object_script> params = {goal_id = <goal_id> id = <id>}
endscript


script goal_countercombo_got_object 
    printf 'why are you here?'
    if SkaterCurrentScorePotGreaterThan 0
        GoalManager_GetGoalParams name = <goal_id>
        if NOT IntegerEquals a = <got_first_object> b = 1
            GoalManager_EditGoal name = <goal_id> params = { got_first_object = 1 }
            RunScriptOnObject id = <trigger_obj_id> goal_countercombo_set_bailed_exception params = { goal_id = <goal_id> }
        endif
        GoalManager_EditGoal name = <goal_id> params = { number_collected = <number_collected> }
        FormatText textname = goal_countercombo_update 'You\'ve collected %i' i = <number_collected>
        printstruct <...> 
        create_panel_message id = goal_countercombo_update text = <goal_countercombo_update> style = goal_countercombo_update
        obj_setouterradius 10
        Obj_SetException Ex = objectoutofradius scr = goal_countercombo_init_object params = {goal_id = <goal_id> id = <id>}
    endif
endscript


script goal_countercombo_set_bailed_exception 
    Obj_SetException Ex = SkaterBailed scr = goal_countercombo_lost params = { goal_id = <goal_id> }
    Obj_SetException Ex = SkaterLanded scr = goal_countercombo_lost params = { goal_id = <goal_id> }
endscript


script goal_countercombo_lost 
    printf 'goal_countercombo_lost'
    Obj_ClearExceptions
    GoalManager_EditGoal name = <goal_id> params = { number_collected = 0 }
    GoalManager_EditGoal name = <goal_id> params = { exceptions_set = 0 }
    goal_update_counter goal_id = <goal_id>
endscript


script goal_countercombo_set_goal_done_exception 
    Obj_ClearException SkaterLanded
    Obj_SetException Ex = SkaterLanded scr = goal_countercombo_done params = { goal_id = <goal_id> }
endscript


script goal_countercombo_done 
    Obj_ClearException SkaterLanded
    GoalManager_WinGoal name = <goal_id>
endscript


script goal_countercombo_active 
    if (<exceptions_set> = 0)
        if (<number_collected> > 0)
            GoalManager_EditGoal name = <goal_id> params = { exceptions_set = 1 }
            RunScriptOnObject id = <trigger_obj_id> goal_countercombo_set_bailed_exception params = { goal_id = <goal_id> }
        endif
    endif
    if GoalManager_CounterGoalDone name = <goal_id>
        RunScriptOnObject id = <trigger_obj_id> goal_countercombo_set_goal_done_exception params = { goal_id = <goal_id> }
    endif
endscript


script goal_countercombo_success 
    goal_success goal_id = <goal_id>
endscript


script goal_countercombo_deactivate 
    GoalManager_EditGoal name = <goal_id> params = { number_collected = 0 }
    GoalManager_EditGoal name = <goal_id> params = { exceptions_set = 0 }
    GoalManager_ResetGoalTrigger name = <goal_id>
    goal_deactivate goal_id = <goal_id>
endscript


script goal_countercombo_expire 
    goal_expire goal_id = <goal_id>
endscript


script goal_countercombo_update 
    DoMorph time = 0 Pos = (320.0, 50.0) Scale = 1 rgba = [ 128 128 128 128 ]
    wait 1 second
    Die
endscript

