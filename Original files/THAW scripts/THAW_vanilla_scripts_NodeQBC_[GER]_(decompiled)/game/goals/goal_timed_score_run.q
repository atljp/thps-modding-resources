Goal_TimedScoreRun_GenericParams = {
    goal_text = 'Getimter Punktelauf'
    view_goals_text = 'Generic timed score run text'
    init = goal_timed_score_run_init
    uninit = goal_uninit
    activate = goal_timed_score_run_activate
    deactivate = goal_timed_score_run_deactivate
    expire = goal_timed_score_run_expire
    fail = goal_timed_score_run_fail
    success = goal_timed_score_run_success
    trigger_obj_id = 'TRG_G_TIMEDSCORERUN_Pro'
    restart_node = 'TRG_G_TIMEDSCORERUN_RestartNode'
    time = 120
    record_type = Score
    reset_score
    dont_bounce_skater
    TimedScoreRun
    goal_type_checksum = TimedScoreRun
}

script AddGoal_TimedScoreRun 
    if GotParam version
        FormatText textname = goal_type 'TimedScoreRun%v' v = <version>
        if NOT GotParam trigger_obj_id
            FormatText checksumname = trigger_obj_id '%z_TRG_G_TIMEDSCORERUN%v_Pro' z = <zone> v = <version>
        endif
        if NOT GotParam restart_node
            FormatText checksumname = restart_node '%z_TRG_G_TIMEDSCORERUN%v_RestartNode' z = <zone> v = <version>
        endif
    else
        <goal_type> = 'TimedScoreRun'
        if NOT GotParam trigger_obj_id
            FormatText checksumname = trigger_obj_id '%z_%s' z = <zone> s = (Goal_TimedScoreRun_GenericParams.trigger_obj_id)
        endif
        if NOT GotParam restart_node
            FormatText checksumname = restart_node '%z_%s' z = <zone> s = (Goal_TimedScoreRun_GenericParams.restart_node)
        endif
    endif
    if GotParam classic_mode_goal
        <classic_mode_goal> = classic_mode_goal
    endif
    GoalManager_CreateGoalName goal_type = <goal_type> zone = <zone> classic_mode_goal = <classic_mode_goal>
    GoalManager_AddGoal name = <goal_id> {
        params = {
            time = 120
            record_type = Score
            goal_text = 'Getimter Punktelauf'
            view_goals_text = 'Generic timed score run text'
            init = goal_timed_score_run_init
            uninit = goal_uninit
            activate = goal_timed_score_run_activate
            deactivate = goal_timed_score_run_deactivate
            expire = goal_timed_score_run_expire
            fail = goal_timed_score_run_fail
            success = goal_timed_score_run_success
            <...> 
            reset_score
            dont_bounce_skater
            TimedScoreRun
            goal_type_checksum = TimedScoreRun
        }
    }
endscript

script goal_timed_score_run_init 
    goal_init <...> 
endscript

script goal_timed_score_run_activate 
    if GameModeEquals is_classic
        GoalManager_SetEndRunType name = <goal_id> EndOfRun
        skater ::runstarted
        if InSplitScreenGame
            skater2 ::runstarted
        endif
    endif
    if GameModeEquals is_career
        scriptassert 'Timed score run activated in career mode?'
    endif
    GoalManager_SetShouldDeactivateOnExpire name = <goal_id> 0
    SetScoreAccumulation 1
    SetScoreDegradation 1
    if GotParam no_cam_anim
        goal_passive_start goal_id = <goal_id>
    else
        goal_start goal_id = <goal_id>
    endif
endscript

script goal_timed_score_run_deactivate 
    SetScoreAccumulation \{ 0 }
    SetScoreDegradation \{ 0 }
    if GameModeEquals \{ is_career }
        scriptassert \{ 'Timed score run deactivated in career mode?' }
    endif
    GoalManager_ResetGoalTrigger <...> 
    if GameModeEquals \{ is_classic }
        goal_deactivate <...> silent_deactivation
    else
        goal_deactivate <...> 
    endif
endscript

script goal_timed_score_run_expire 
    GetGameMode
    switch <gamemode>
        case classic
        classic_mode_end_run
        case career
        scriptassert \{ 'Timed score run expired in career mode?' }
        case singlesession
        UpdateRecords
    endswitch
    GoalManager_DeactivateGoal name = <goal_id>
endscript

script goal_timed_score_run_fail 
    goal_fail <...> 
endscript

script goal_timed_score_run_success 
    goal_success <...> 
endscript

script goal_timed_score_run_trigger 
    setup_ped_speech {
        ped_id = <trigger_obj_id>
        display_name = 'Highscore-Spiel spielen'
        activation_script = goal_timed_score_run_accept
        activation_script_params = { goal_id = <goal_id> }
    }
endscript

script goal_timed_score_run_accept 
    GoalManager_DeactivateAllGoals \{ force_all }
    GoalManager_ActivateGoal name = <goal_id>
endscript
