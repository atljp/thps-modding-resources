NotifiedLastPlacePlayer = 0
NotifiedSecondToLastPlacePlayer = 0
ResetElimiskateScores = 1
goal_elimiskate_genericParams = {
    goal_text = 'Uniknij eliminacji nie pozostaj¹c na ostatnim miejscu!'
    time = 10
    net
    goal_type_checksum = net
    game_continues_after_expiration
    init = goal_elimiskate_init
    active = goal_elimiskate_active
    activate = goal_elimiskate_activate
    deactivate = goal_elimiskate_deactivate
    expire = goal_elimiskate_expire
    goal_description = 'Eliminacja!'
}
goal_elimiskate_break_period_genericParams = {
    goal_text = 'Rozpoczynamy nastêpn¹ rundê...'
    time = 5
    net
    goal_type_checksum = net
    game_continues_after_expiration
    init = goal_elimiskate_break_period_init
    activate = goal_elimiskate_break_period_activate
    deactivate = goal_elimiskate_break_period_deactivate
    expire = goal_elimiskate_break_period_expire
    goal_description = 'Eliminacja!'
}
goal_elimiskate_interval_genericParams = {
    goal_text = ''
    time = 5
    net
    goal_type_checksum = net
    init = goal_elimiskate_interval_init
    activate = goal_elimiskate_interval_activate
    deactivate = goal_elimiskate_interval_deactivate
    expire = goal_elimiskate_interval_expire
    game_continues_after_expiration
    goal_description = ''
}

script goal_elimiskate_init 
endscript

script goal_elimiskate_active 
    GoalManager_GetTimeLeftInNetGame
    if GotParam time_left
        if (<time_left> < 5000)
            if InLastPlace
                if NOT IsTrue NotifiedLastPlacePlayer
                    change NotifiedLastPlacePlayer = 1
                    if (<points> = 0)
                        FormatText textname = msg_text '\c2Remisujesz o ostatnie miejsce!'
                    else
                        FormatText textname = msg_text '\c2Przedostatni wyprzedza ciê o %s punktów!' s = <points>
                    endif
                    create_net_panel_message text = <msg_text> msg_time = 3000
                endif
            else
                if InSecondToLastPlace
                    if NOT IsTrue NotifiedSecondToLastPlacePlayer
                        change NotifiedSecondToLastPlacePlayer = 1
                        FormatText textname = msg_text '\c2Od ostatniego miejsca dzieli ciê tylko %s punktów!' s = <points>
                        create_net_panel_message text = <msg_text> msg_time = 3000
                    endif
                endif
            endif
        endif
    endif
endscript

script goal_elimiskate_activate 
    printf 'script goal_elimiskate_activate'
    if GotParam score_mode
        if (<score_mode> = tag_scoring)
            SetModulateColors 1
        endif
    endif
    RoundIncrement
    SetTrickScoreTracking 1
    change NotifiedLastPlacePlayer = 0
    change NotifiedSecondToLastPlacePlayer = 0
    if InTeamGame
        FormatText textname = msg_text '\c2Eliminacja:\c0\nNie daj siê wyeliminowaæ!'
    else
        FormatText textname = msg_text '\c2Eliminacja:\c0\nNie daj siê wyeliminowaæ!'
    endif
    DisplayGameDescription description = <msg_text>
    if ScreenElementExists id = the_time
        SetScreenElementProps {
            id = the_time
            unhide
        }
    endif
    RunScriptOnScreenElement id = the_time clock_morph
    if GameModeEquals should_reset_scores
        ResetScore reset_all
        ResetComboRecords
        if GotParam score_mode
            if (<score_mode> = tag_scoring)
                ClearTrickObjects
            endif
        endif
    endif
endscript

script goal_elimiskate_deactivate 
    if NOT GoalManager_GoalIsActive \{ name = elimiskate_break_period }
        if NOT GoalManager_GoalIsActive \{ name = elimiskate_interval }
            if ObjectExists \{ id = mp_goal_text }
                DestroyScreenElement \{ id = mp_goal_text }
            endif
        endif
    endif
endscript

script goal_elimiskate_expire 
    SetTrickScoreTracking \{ 0 }
    StartGoal_ElimiSkate_Interval
endscript

script goal_elimiskate_finished 
    if ObjectExists \{ id = mp_goal_text }
        DestroyScreenElement \{ id = mp_goal_text }
    endif
    SpawnScriptLater \{ wait_then_create_rankings }
endscript

script AddGoal_Elimiskate 
    GoalManager_AddGoal \{name = elimiskate params = { goal_elimiskate_genericParams }}
endscript

script StartGoal_ElimiSkate 
    GoalManager_EditGoal name = elimiskate params = <...> 
    GoalManager_ActivateGoal \{ name = elimiskate }
    GoalManager_SetGoalTimer \{ name = elimiskate }
endscript

script goal_elimiskate_break_period_init 
endscript

script goal_elimiskate_break_period_activate 
    if ScreenElementExists \{ id = the_time }
        SetScreenElementProps \{ id = the_time unhide }
    endif
    RunScriptOnScreenElement \{ id = the_time clock_morph }
    SetTrickScoreTracking \{ 0 }
    create_net_panel_message \{ text = 'Przygotowania do rozpoczêcia nastêpnej rundy. Liczenie punktów rozpocznie siê wraz z rund¹.' }
endscript

script goal_elimiskate_break_period_deactivate 
endscript

script goal_elimiskate_break_period_expire 
    StartGoal_ElimiSkate
endscript

script AddGoal_Elimiskate_Break_Period 
    GoalManager_AddGoal \{name = elimiskate_break_period params = { goal_elimiskate_break_period_genericParams }}
endscript

script StartGoal_ElimiSkate_Break_Period 
    GoalManager_EditGoal name = elimiskate_break_period params = <...> 
    GoalManager_ActivateGoal \{ name = elimiskate_break_period }
endscript

script goal_elimiskate_interval_init 
endscript

script goal_elimiskate_interval_activate 
    SetTrickScoreTracking \{ 0 }
    if ScreenElementExists \{ id = the_time }
        SetScreenElementProps \{ id = the_time hide }
    endif
    create_net_panel_message \{ text = 'Obliczanie wyników koñcowych. Punkty zdobyte w tym czasie nie zostan¹ zaliczone.' }
    if OnServer
        SpawnScriptLater \{ wait_and_eliminate }
    endif
    if GameModeEquals \{ should_reset_scores }
        SpawnScriptLater \{ wait_and_accumulate }
    endif
endscript

script wait_and_eliminate 
    wait \{ 2 seconds }
    EliminateLastPlacePlayer
endscript

script wait_and_accumulate 
    AccumulateScores
endscript

script goal_elimiskate_interval_deactivate 
    if ScreenElementExists \{ id = the_time }
        SetScreenElementProps \{ id = the_time unhide }
    endif
endscript

script goal_elimiskate_interval_expire 
    if OnlyOnePlayerLeft
        goal_elimiskate_finished
    else
        StartGoal_ElimiSkate_Break_Period
    endif
endscript

script AddGoal_Elimiskate_Interval 
    GoalManager_AddGoal \{name = elimiskate_interval params = { goal_elimiskate_interval_genericParams }}
endscript

script StartGoal_ElimiSkate_Interval 
    GoalManager_ActivateGoal \{ name = elimiskate_interval }
endscript

script CheckForElimiskateGameOver 
    if OnlyOnePlayerLeft
        GoalManager_DeactivateGoal \{ name = elimiskate }
        GoalManager_DeactivateGoal \{ name = elimiskate_break_period }
        GoalManager_DeactivateGoal \{ name = elimiskate_interval }
        goal_elimiskate_finished
    endif
endscript
