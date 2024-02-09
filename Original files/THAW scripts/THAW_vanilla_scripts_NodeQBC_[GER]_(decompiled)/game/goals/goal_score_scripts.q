Goal_GenericScore_genericParams = {
    goal_text = 'Schaff einen Highscore: 15.000 Punkte'
    view_goals_text = 'Highscore'
    init = Score_init
    uninit = goal_uninit
    activate = Score_activate
    deactivate = Score_Deactivate
    expire = Score_expire
    fail = Score_fail
    success = Score_success
    trigger_obj_id = 'TRG_G_GS_Pro'
    restart_node = 'TRG_G_GS_RestartNode'
    start_pad_id = 'G_GS_StartPad'
    Score = 15000
    time = 120
    already_displayed_win_message = 0
    win_message_text = 'Highscore: Geschafft!'
    record_type = time
    score_goal
}
Goal_HighScore_genericParams = {
    goal_text = 'Schaff einen Highscore: 15.000 Punkte'
    view_goals_text = 'Highscore'
    init = Score_init
    uninit = goal_uninit
    activate = Score_activate
    deactivate = Score_Deactivate
    expire = Score_expire
    fail = Score_fail
    success = Score_success
    trigger_obj_id = 'TRG_G_HS_Pro'
    restart_node = 'TRG_G_HS_RestartNode'
    start_pad_id = 'G_HS_StartPad'
    Score = 15000
    time = 120
    already_displayed_win_message = 0
    win_message_text = 'Highscore: Geschafft!'
    record_type = time
    score_goal
}

script AddGoal_HighScore 
    FormatText checksumname = trigger_obj_id '%z_%s' z = <zone> s = (Goal_HighScore_genericParams.trigger_obj_id)
    FormatText checksumname = restart_node '%z_%s' z = <zone> s = (Goal_HighScore_genericParams.restart_node)
    FormatText checksumname = start_pad_id '%z_%s' z = <zone> s = (Goal_HighScore_genericParams.start_pad_id)
    if GotParam classic_mode_goal
        <classic_mode_goal> = classic_mode_goal
    endif
    GoalManager_CreateGoalName goal_type = 'HighScore' zone = <zone> classic_mode_goal = <classic_mode_goal>
    if NOT GotParam goal_text
        <goal_text> = (Goal_HighScore_genericParams.goal_text)
    endif
    if NOT GotParam view_goals_text
        <view_goals_text> = (Goal_HighScore_genericParams.view_goals_text)
    endif
    if NOT GotParam Score
        <Score> = (Goal_HighScore_genericParams.Score)
    endif
    if NOT GotParam time
        <time> = (Goal_HighScore_genericParams.time)
    endif
    if NOT GotParam already_displayed_win_message
        <already_displayed_win_message> = (Goal_HighScore_genericParams.already_displayed_win_message)
    endif
    if NOT GotParam win_message_text
        <win_message_text> = (Goal_HighScore_genericParams.win_message_text)
    endif
    if NOT GotParam record_type
        <record_type> = (Goal_HighScore_genericParams.record_type)
    endif
    if GameModeEquals is_coop
        Score = (2 * <Score>)
    endif
    GoalManager_AddGoal name = <goal_id> {
        params = {
            init = (Goal_HighScore_genericParams.init)
            uninit = (Goal_HighScore_genericParams.uninit)
            activate = (Goal_HighScore_genericParams.activate)
            deactivate = (Goal_HighScore_genericParams.deactivate)
            expire = (Goal_HighScore_genericParams.expire)
            success = (Goal_HighScore_genericParams.success)
            fail = (Goal_HighScore_genericParams.fail)
            <...> 
            score_goal
        }
    }
endscript
Goal_ProScore_GenericParams = {
    goal_text = 'Schaff einen Profi-Score: 20.000 Punkte'
    view_goals_text = 'Profi-Score'
    init = Score_init
    uninit = goal_uninit
    activate = Score_activate
    deactivate = Score_Deactivate
    expire = Score_expire
    fail = Score_fail
    success = Score_success
    trigger_obj_id = 'TRG_G_PS_Pro'
    restart_node = 'TRG_G_PS_RestartNode'
    start_pad_id = 'G_PS_StartPad'
    Score = 20000
    time = 120
    already_displayed_win_message = 0
    win_message_text = 'Profi-Score: Geschafft!'
    record_type = time
    score_goal
}

script AddGoal_ProScore 
    FormatText checksumname = trigger_obj_id '%z_%s' z = <zone> s = (Goal_ProScore_GenericParams.trigger_obj_id)
    FormatText checksumname = restart_node '%z_%s' z = <zone> s = (Goal_ProScore_GenericParams.restart_node)
    FormatText checksumname = start_pad_id '%z_%s' z = <zone> s = (Goal_ProScore_GenericParams.start_pad_id)
    if GotParam classic_mode_goal
        <classic_mode_goal> = classic_mode_goal
    endif
    GoalManager_CreateGoalName goal_type = 'ProScore' zone = <zone> classic_mode_goal = <classic_mode_goal>
    if NOT GotParam goal_text
        <goal_text> = (Goal_ProScore_GenericParams.goal_text)
    endif
    if NOT GotParam view_goals_text
        <view_goals_text> = (Goal_ProScore_GenericParams.view_goals_text)
    endif
    if NOT GotParam Score
        <Score> = (Goal_ProScore_GenericParams.Score)
    endif
    if NOT GotParam time
        <time> = (Goal_ProScore_GenericParams.time)
    endif
    if NOT GotParam already_displayed_win_message
        <already_displayed_win_message> = (Goal_ProScore_GenericParams.already_displayed_win_message)
    endif
    if NOT GotParam win_message_text
        <win_message_text> = (Goal_ProScore_GenericParams.win_message_text)
    endif
    if NOT GotParam record_type
        <record_type> = (Goal_ProScore_GenericParams.record_type)
    endif
    if GameModeEquals is_coop
        Score = (2 * <Score>)
    endif
    GoalManager_AddGoal name = <goal_id> {
        params = {
            init = (Goal_ProScore_GenericParams.init)
            uninit = (Goal_ProScore_GenericParams.uninit)
            activate = (Goal_ProScore_GenericParams.activate)
            deactivate = (Goal_ProScore_GenericParams.deactivate)
            expire = (Goal_ProScore_GenericParams.expire)
            success = (Goal_ProScore_GenericParams.success)
            fail = (Goal_ProScore_GenericParams.fail)
            <...> 
            score_goal
        }
    }
endscript
Goal_SickScore_GenericParams = {
    goal_text = 'Hol einen Hammer-Score: 30.000 Punkte'
    view_goals_text = 'Hammer-Score'
    init = Score_init
    uninit = goal_uninit
    activate = Score_activate
    deactivate = Score_Deactivate
    expire = Score_expire
    fail = Score_fail
    success = Score_success
    trigger_obj_id = 'TRG_G_SS_Pro'
    restart_node = 'TRG_G_SS_RestartNode'
    start_pad_id = 'G_SS_StartPad'
    Score = 30000
    time = 120
    already_displayed_win_message = 0
    win_message_text = 'Hammer-Score: Geschafft!'
    record_type = time
    score_goal
}

script AddGoal_SickScore 
    FormatText checksumname = trigger_obj_id '%z_%s' z = <zone> s = (Goal_SickScore_GenericParams.trigger_obj_id)
    FormatText checksumname = restart_node '%z_%s' z = <zone> s = (Goal_SickScore_GenericParams.restart_node)
    FormatText checksumname = start_pad_id '%z_%s' z = <zone> s = (Goal_SickScore_GenericParams.start_pad_id)
    if GotParam classic_mode_goal
        <classic_mode_goal> = classic_mode_goal
    endif
    GoalManager_CreateGoalName goal_type = 'SickScore' zone = <zone> classic_mode_goal = <classic_mode_goal>
    if NOT GotParam goal_text
        <goal_text> = (Goal_SickScore_GenericParams.goal_text)
    endif
    if NOT GotParam view_goals_text
        <view_goals_text> = (Goal_SickScore_GenericParams.view_goals_text)
    endif
    if NOT GotParam Score
        <Score> = (Goal_SickScore_GenericParams.Score)
    endif
    if NOT GotParam time
        <time> = (Goal_SickScore_GenericParams.time)
    endif
    if NOT GotParam already_displayed_win_message
        <already_displayed_win_message> = (Goal_SickScore_GenericParams.already_displayed_win_message)
    endif
    if NOT GotParam win_message_text
        <win_message_text> = (Goal_SickScore_GenericParams.win_message_text)
    endif
    if NOT GotParam record_type
        <record_type> = (Goal_SickScore_GenericParams.record_type)
    endif
    if GameModeEquals is_coop
        Score = (2 * <Score>)
    endif
    GoalManager_AddGoal name = <goal_id> {
        params = {
            init = (Goal_SickScore_GenericParams.init)
            uninit = (Goal_SickScore_GenericParams.uninit)
            activate = (Goal_SickScore_GenericParams.activate)
            deactivate = (Goal_SickScore_GenericParams.deactivate)
            expire = (Goal_SickScore_GenericParams.expire)
            success = (Goal_SickScore_GenericParams.success)
            fail = (Goal_SickScore_GenericParams.fail)
            <...> 
            score_goal
        }
    }
endscript

script Score_init 
    goal_init goal_id = <goal_id>
endscript

script Score_activate 
    if ((GameModeEquals is_goal_attack))
        SetScoreAccumulation \{ 1 }
        SetScoreDegradation \{ 1 }
        ResetScore
    endif
    goal_start goal_id = <goal_id>
endscript

script Score_success 
    goal_success goal_id = <goal_id>
    if GotParam \{ winning_score }
        FormatText textname = text 'Punkte: %i' i = <winning_score>
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
    if NOT GameModeEquals \{ is_classic }
        if NOT InNetGame
            SpawnScriptLater \{ goal_score_wait_and_reset_score }
        endif
    endif
    if GameModeEquals \{ is_goal_attack }
    endif
endscript

script goal_score_wait_and_reset_score 
    wait \{ 1 frame }
    ResetScore
endscript

script Score_expire 
    goal_expire goal_id = <goal_id>
    GoalManager_LoseGoal name = <goal_id>
endscript

script Score_fail 
    goal_fail goal_id = <goal_id>
endscript

script get_high_combo_text 
    if NOT GameModeEquals \{ is_coop }
        FormatText usecommas textname = new_text classic_high_combo_format i = <value>
    else
        FormatText usecommas textname = new_text classic_high_combo_format i = (2 * <value>)
    endif
    return high_combo_text = <new_text>
endscript

script get_high_combo_easy_text 
    if NOT GameModeEquals \{ is_coop }
        FormatText usecommas textname = new_text classic_high_combo_format i = <value>
    else
        FormatText usecommas textname = new_text classic_high_combo_format i = (2 * <value>)
    endif
    return high_combo_easy_text = <new_text>
endscript

script get_high_score_text 
    if NOT GameModeEquals \{ is_coop }
        FormatText usecommas textname = new_text classic_high_score_format i = <value>
    else
        FormatText usecommas textname = new_text classic_high_score_format i = (2 * <value>)
    endif
    return high_score_text = <new_text>
endscript

script get_high_score_easy_text 
    if NOT GameModeEquals \{ is_coop }
        FormatText usecommas textname = new_text classic_high_score_format i = <value>
    else
        FormatText usecommas textname = new_text classic_high_score_format i = (2 * <value>)
    endif
    return high_score_easy_text = <new_text>
endscript

script get_pro_score_text 
    if NOT GameModeEquals \{ is_coop }
        FormatText usecommas textname = new_text classic_pro_score_format i = <value>
    else
        FormatText usecommas textname = new_text classic_pro_score_format i = (2 * <value>)
    endif
    return pro_score_text = <new_text>
endscript

script get_pro_score_easy_text 
    if NOT GameModeEquals \{ is_coop }
        FormatText usecommas textname = new_text classic_pro_score_format i = <value>
    else
        FormatText usecommas textname = new_text classic_pro_score_format i = (2 * <value>)
    endif
    return pro_score_easy_text = <new_text>
endscript

script get_sick_score_text 
    if NOT GameModeEquals \{ is_coop }
        FormatText usecommas textname = new_text classic_sick_score_format i = <value>
    else
        FormatText usecommas textname = new_text classic_sick_score_format i = (2 * <value>)
    endif
    return sick_score_text = <new_text>
endscript

script get_sick_score_easy_text 
    if NOT GameModeEquals \{ is_coop }
        FormatText usecommas textname = new_text classic_sick_score_format i = <value>
    else
        FormatText usecommas textname = new_text classic_sick_score_format i = (2 * <value>)
    endif
    return sick_score_easy_text = <new_text>
endscript
