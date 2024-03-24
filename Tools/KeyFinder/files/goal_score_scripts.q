
Goal_GenericScore_genericParams = {
    goal_text = 'Get a High Score: 15,000 Points'
    view_goals_text = 'High score'
    init = Score_init
    uninit = goal_uninit
    activate = Score_activate
    deactivate = Score_Deactivate
    expire = Score_expire
    fail = Score_fail
    success = Score_success
    trigger_obj_id = TRG_G_GS_Pro
    restart_node = TRG_G_GS_RestartNode
    start_pad_id = G_GS_StartPad
    Score = 15000
    time = 120
    already_displayed_win_message = 0
    win_message_text = 'High Score: Complete!'
    record_type = time
    score_goal
}
Goal_HighScore_genericParams = {
    goal_text = 'Get a High Score: 15,000 Points'
    view_goals_text = 'High score'
    init = Score_init
    uninit = goal_uninit
    activate = Score_activate
    deactivate = Score_Deactivate
    expire = Score_expire
    fail = Score_fail
    success = Score_success
    trigger_obj_id = TRG_G_HS_Pro
    restart_node = TRG_G_HS_RestartNode
    start_pad_id = G_HS_StartPad
    Score = 15000
    time = 120
    already_displayed_win_message = 0
    win_message_text = 'High Score: Complete!'
    record_type = time
    score_goal
}
Goal_ProScore_GenericParams = {
    goal_text = 'Get a Pro Score: 20,000 Points'
    view_goals_text = 'Pro score'
    init = Score_init
    uninit = goal_uninit
    activate = Score_activate
    deactivate = Score_Deactivate
    expire = Score_expire
    fail = Score_fail
    success = Score_success
    trigger_obj_id = TRG_G_PS_Pro
    restart_node = TRG_G_PS_RestartNode
    start_pad_id = G_PS_StartPad
    Score = 20000
    time = 120
    already_displayed_win_message = 0
    win_message_text = 'Pro Score: Complete!'
    record_type = time
    score_goal
}
Goal_SickScore_GenericParams = {
    goal_text = 'Get a Sick Score: 30,000 Points'
    view_goals_text = 'Sick score'
    init = Score_init
    uninit = goal_uninit
    activate = Score_activate
    deactivate = Score_Deactivate
    expire = Score_expire
    fail = Score_fail
    success = Score_success
    trigger_obj_id = TRG_G_SS_Pro
    restart_node = TRG_G_SS_RestartNode
    start_pad_id = G_SS_StartPad
    Score = 30000
    time = 120
    already_displayed_win_message = 0
    win_message_text = 'Sick Score: Complete!'
    record_type = time
    score_goal
}

script Score_init 
    goal_init goal_id = <goal_id>
endscript


script Score_activate 
    if ((GameModeEquals is_creategoals)|| (GameModeEquals is_goal_attack))
        SetScoreAccumulation 1
        SetScoreDegradation 1
        ResetScore
    endif
    goal_start goal_id = <goal_id>
endscript


script Score_success 
    goal_success goal_id = <goal_id>
    if GotParam winning_score
        FormatText textname = text 'Score: %i' i = <winning_score>
        create_panel_message {
            id = goal_current_reward
            text = <text>
            style = goal_message_got_trickslot
        }
    endif
endscript


script Score_Deactivate 
    GoalManager_ResetGoalTrigger name = <goal_id>
    goal_deactivate goal_id = <goal_id>
    GoalManager_EditGoal name = <goal_id> params = { already_displayed_win_message = 0 }
    if NOT GameModeEquals is_classic
        if NOT InNetGame
            SpawnScript goal_score_wait_and_reset_score
        endif
    endif
    if GameModeEquals is_creategoals
        SetScoreAccumulation 0
        SetScoreDegradation 0
    else
        if GameModeEquals is_goal_attack
            GetGoalsMode
            if NOT (<goals> = goals_classic)
                SetScoreDegradation 0
                SetScoreAccumulation 0
            endif
        endif
    endif
endscript


script goal_score_wait_and_reset_score 
    wait 1 frame
    ResetScore
endscript


script Score_expire 
    goal_expire goal_id = <goal_id>
    GoalManager_LoseGoal name = <goal_id>
endscript


script Score_fail 
    goal_fail goal_id = <goal_id>
endscript

