
Goal_TimedScoreRun_GenericParams = {
    goal_text = 'Timed Score Run'
    view_goals_text = 'Generic timed score run text'
    time = 120
    init = goal_timed_score_run_init
    uninit = goal_uninit
    activate = goal_timed_score_run_activate
    deactivate = goal_timed_score_run_deactivate
    expire = goal_timed_score_run_expire
    fail = goal_timed_score_run_fail
    success = goal_timed_score_run_success
    restart_node = TRG_G_TIMEDSCORERUN_RestartNode
    trigger_obj_id = TRG_G_TIMEDSCORERUN_Pro
    record_type = Score
    reset_score
    dont_bounce_skater
    TimedScoreRun
}

script goal_timed_score_run_init 
    goal_init <...> 
endscript


script goal_timed_score_run_activate 
    if GameModeEquals is_classic
        GoalManager_SetEndRunType name = <goal_id> EndOfRun
        skater ::runstarted
    endif
    if GameModeEquals is_career
        arcade_machine_setup_goal goal_id = <goal_id>
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
    SetScoreAccumulation 0
    SetScoreDegradation 0
    if GameModeEquals is_career
        arcade_machine_cleanup_goal <...> 
    endif
    GoalManager_ResetGoalTrigger <...> 
    goal_deactivate <...> 
endscript


script goal_timed_score_run_expire 
    GetGameMode
    switch <gamemode>
        case classic
        classic_mode_end_run
        case career
        GoalManager_GetGoalParams name = <goal_id>
        FormatText textname = text 'Score: %i' i = <arcade_current_score_total>
        create_panel_message {
            id = goal_current_reward
            text = <text>
            style = goal_message_got_trickslot
        }
        arcade_machine_check_for_scores goal_id = <goal_id> totalscore = <arcade_current_score_total>
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
        display_name = 'Play High Score Game'
        activation_script = goal_timed_score_run_accept
        activation_script_params = { goal_id = <goal_id> }
    }
endscript


script goal_timed_score_run_accept 
    GoalManager_DeactivateAllGoals
    GoalManager_ActivateGoal name = <goal_id>
endscript

