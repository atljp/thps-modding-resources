goal_highcombo_genericParams = {
    goal_text = 'standardowy tekst trybu rekordowe combo'
    view_goals_text = 'Wysokie Kombo'
    time = 120
    init = goal_highcombo_init
    uninit = goal_uninit
    activate = goal_highcombo_activate
    success = goal_highcombo_success
    fail = goal_highcombo_fail
    deactivate = goal_highcombo_deactivate
    expire = goal_highcombo_expire
    trigger_obj_id = 'TRG_G_HIGHCOMBO_Pro'
    restart_node = 'TRG_G_HIGHCOMBO_RestartNode'
    start_pad_id = 'G_HIGHCOMBO_StartPad'
    exception_set = 0
    Score = 10000
    record_type = Score
    high_combo
}

script AddGoal_HighCombo 
    if GotParam version
        FormatText textname = goal_type 'HIghCombo%v' v = <version>
        if NOT GotParam trigger_obj_id
            FormatText checksumname = trigger_obj_id '%z_TRG_G_HIGHCOMBO%v_Pro' z = <zone> v = <version>
        endif
        if NOT GotParam restart_node
            FormatText checksumname = restart_node '%z_TRG_G_HIGHCOMBO%v_RestartNode' z = <zone> v = <version>
        endif
    else
        <goal_type> = 'HIghCombo'
        if NOT GotParam trigger_obj_id
            FormatText checksumname = trigger_obj_id '%z_TRG_G_HIGHCOMBO_Pro' z = <zone>
        endif
        if NOT GotParam restart_node
            FormatText checksumname = restart_node '%z_TRG_G_HIGHCOMBO_RestartNode' z = <zone>
        endif
    endif
    if GotParam classic_mode_goal
        <classic_mode_goal> = classic_mode_goal
    endif
    GoalManager_CreateGoalName goal_type = <goal_type> zone = <zone> classic_mode_goal = <classic_mode_goal>
    if GameModeEquals is_coop
        Score = (2 * <Score>)
    endif
    GoalManager_AddGoal name = <goal_id> {
        params = {
            goal_text = 'standardowy tekst trybu rekordowe combo'
            view_goals_text = 'Wysokie combo'
            time = 120
            record_type = Score
            exception_set = 0
            Score = 10000
            init = goal_highcombo_init
            uninit = goal_uninit
            activate = goal_highcombo_activate
            success = goal_highcombo_success
            fail = goal_highcombo_fail
            deactivate = goal_highcombo_deactivate
            expire = goal_highcombo_expire
            <...> 
            high_combo
        }
    }
endscript

script goal_highcombo_init 
    goal_init goal_id = <goal_id>
endscript

script goal_highcombo_activate 
    goal_start goal_id = <goal_id>
endscript

script goal_highcombo_check_score 
    SpawnScriptLater goal_highcombo_wait_check_score params = {goal_id = <goal_id> last_score_landed = <last_score_landed>}
endscript

script goal_highcombo_wait_check_score 
    wait \{ 2 gameframes }
    if GoalManager_GoalIsActive name = <goal_id>
        GoalManager_GetGoalParams name = <goal_id>
        if GameModeEquals \{ is_coop }
            Score = (2 * <Score>)
        endif
        if NOT (<last_score_landed> < <Score>)
            GoalManager_WinGoal name = <goal_id>
        endif
    endif
endscript

script goal_highcombo_success 
    goal_success goal_id = <goal_id>
endscript

script goal_highcombo_deactivate 
    GoalManager_ResetGoalTrigger name = <goal_id>
    goal_deactivate goal_id = <goal_id>
endscript

script goal_highcombo_fail 
    goal_fail goal_id = <goal_id>
endscript

script goal_highcombo_expire 
    goal_expire goal_id = <goal_id>
    GoalManager_LoseGoal name = <goal_id>
endscript

script goal_highcombo_enter_area 
    if NOT GoalManager_GoalExists name = <goal_id>
        return 
    endif
    if GoalManager_GoalIsActive name = <goal_id>
        return 
    endif
    if GoalManager_GoalIsLocked name = <goal_id>
        return 
    endif
    if GoalManager_HasWonGoal name = <goal_id>
        return 
    endif
    KillSpawnedScript \{ name = goal_highcombo_wait_and_activate }
    if SkaterCurrentScorePotGreaterThan \{ 0 }
        SpawnScriptLater goal_highcombo_wait_and_activate params = { goal_id = <goal_id> }
    else
        goal_highcombo_combo_started goal_id = <goal_id>
    endif
endscript

script goal_highcombo_combo_started 
    GoalManager_ActivateGoal name = <goal_id>
endscript

script goal_highcombo_wait_and_activate 
    SetException Ex = SkaterEnterCombo scr = goal_highcombo_combo_started params = { goal_id = <goal_id> }
    Block
endscript

script goal_highcombo_leave_area 
    if NOT GoalManager_GoalExists name = <goal_id>
        return 
    endif
    if GoalManager_GoalIsLocked name = <goal_id>
        return 
    endif
    KillSpawnedScript \{ name = goal_highcombo_wait_and_activate }
    if GoalManager_GoalIsActive name = <goal_id>
        GoalManager_DeactivateGoal name = <goal_id>
    endif
endscript
