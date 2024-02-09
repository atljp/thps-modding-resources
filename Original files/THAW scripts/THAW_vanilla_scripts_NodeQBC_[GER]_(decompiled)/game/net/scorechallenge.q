goal_scorechallenge_genericParams = {
    goal_text = 'Für einen Sieg brauchst du die meisten Punkte!'
    unlimited_time = 1
    Score = 1000000
    net
    goal_type_checksum = net
    init = goal_scorechallenge_init
    activate = goal_scorechallenge_activate
    active = goal_scorechallenge_active
    deactivate = goal_scorechallenge_deactivate
    goal_description = 'Punkte-Challenge!'
}

script goal_scorechallenge_init 
endscript

script DisplayGameDescription \{ description = 'Spielbeschreibung' }
    if InSplitScreenGame
        ScriptGetScreenMode
        switch <screen_mode>
            case split_vertical
            msg_pos = (425.0, 69.0)
            case split_horizontal
            msg_pos = (620.0, 27.0)
        endswitch
    else
        msg_pos = (620.0, 27.0)
    endif
    if NOT IsObserving
        create_panel_block id = mp_goal_text parent = root_window text = <description> style = panel_message_goal final_pos = <msg_pos> font_face = dialog
    endif
endscript

script InitializeTagScoring \{ accumulate_score = 1 track_trick_score = 1 degrade_score = 1 should_modulate_color = 1 }
    printf \{ 'script InitializeTagScoring' }
    GetScoreModeSettings
    printf <score_mode>
    if (<score_mode> = tag_scoring)
        SetScoreAccumulation <accumulate_score>
        SetTrickScoreTracking <track_trick_score>
        SetScoreDegradation <degrade_score>
        SetModulateColors <should_modulate_color>
        printf <target_tags>
    else
        printf \{ 'not in a tag scoring mode' }
    endif
endscript

script display_tags_or_points 
    GetScoreModeSettings
    switch <score_mode>
        case tag_scoring
        switch <target_tags>
            case tags_10
            score_string = '10 Tags'
            case tags_20
            score_string = '20 Tags'
            case tags_30
            score_string = '30 Tags'
            case tags_40
            score_string = '40 Tags'
            case tags_50
            score_string = '50 Tags'
        endswitch
        case point_scoring
        GetPreferenceChecksum pref_type = network target_score
        printf <Score>
        switch <Score>
            case 100000
            score_string = '100.000 Pkte'
            case 250000
            score_string = '250.000 Pkte'
            case 500000
            score_string = '500.000 Pkte'
            case 1000000
            score_string = '1.000.000 Pkte'
            case 2000000
            score_string = '2.000.000 Pkte'
            case 5000000
            score_string = '5.000.000 Pkte'
            case 10000000
            score_string = '10.000.000 Pkte'
            case 50000000
            score_string = '50.000.000 Pkte'
            case 100000000
            score_string = '100.000.000 Pkte'
        endswitch
    endswitch
    FormatText textname = msg_text '\c3Punkte-\n\c3Challenge:\n\c0Mach %s,\num zu gewinnen.' s = <score_string>
    DisplayGameDescription description = <msg_text>
endscript

script goal_scorechallenge_activate 
    InitializeTagScoring
    if InSplitScreenGame
        MakeSkaterGosub \{ add_skater_to_world skater = 0 }
        MakeSkaterGosub \{ add_skater_to_world skater = 1 }
    endif
    display_tags_or_points msg_pos <...> 
    printf \{ '************** ACTIVATING SCORECHALLENGE **********************' }
    ResetScore
endscript

script goal_scorechallenge_active 
    GetScoreModeSettings
    if (<score_mode> = tag_scoring)
        switch <target_tags>
            case tags_10
            tags = 10
            case tags_20
            tags = 20
            case tags_30
            tags = 30
            case tags_40
            tags = 40
            case tags_50
            tags = 50
        endswitch
        <Score> = <tags>
    endif
    if AnySkaterTotalScoreAtLeast <Score>
        if OnServer
            if CalculateFinalScores
                GoalManager_DeactivateGoal name = <goal_id>
                goal_scorechallenge_finished
            endif
        else
            GoalManager_DeactivateGoal name = <goal_id>
            goal_scorechallenge_finished
        endif
    endif
endscript

script goal_scorechallenge_deactivate 
    destroy_goal_panel_messages
    if ObjectExists \{ id = mp_goal_text }
        DestroyScreenElement \{ id = mp_goal_text }
    endif
endscript

script goal_scorechallenge_finished 
    destroy_goal_panel_messages
    if ObjectExists \{ id = mp_goal_text }
        DestroyScreenElement \{ id = mp_goal_text }
    endif
    printf \{ 'goal_scorechallenge_deactivate' }
    ResetScorePot
    report_stats \{ final }
    create_rankings
endscript

script AddGoal_ScoreChallenge 
    GoalManager_AddGoal \{name = scorechallenge params = { goal_scorechallenge_genericParams }}
endscript

script StartGoal_ScoreChallenge 
    if InSplitScreenGame
        SetScreenModeFromGameMode
    endif
    GoalManager_EditGoal name = scorechallenge params = <...> 
    GoalManager_ActivateGoal \{ name = scorechallenge }
endscript
