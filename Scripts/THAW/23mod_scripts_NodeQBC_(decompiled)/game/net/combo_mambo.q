goal_combomambo_genericParams = {
    goal_text = 'Musisz zdobyæ najwiêcej punktów by zwyciê¿yæ!'
    time = 10
    net
    goal_type_checksum = net
    init = goal_combomambo_init
    deactivate = goal_combomambo_deactivate
    expire = goal_combomambo_expire
    activate = goal_combomambo_activate
    goal_description = 'Combo Mambo!'
}

script goal_combomambo_init 
endscript

script goal_combomambo_activate 
    if InTeamGame
        FormatText textname = msg_text '\c4Combo Mambo:\n\c0Najwiêksze combo wygrywa.'
    else
        FormatText textname = msg_text '\c4Combo Mambo:\n\c0Najwiêksze combo wygrywa.'
    endif
    if InSplitScreenGame
        MakeSkaterGosub add_skater_to_world skater = 0
        MakeSkaterGosub add_skater_to_world skater = 1
    endif
    InitializeTagScoring
    DisplayGameDescription description = <msg_text>
    RunScriptOnScreenElement id = the_time clock_morph
    ResetScore
    ResetComboRecords
endscript

script goal_combomambo_deactivate 
    if ObjectExists \{ id = mp_goal_text }
        DestroyScreenElement \{ id = mp_goal_text }
    endif
endscript

script combomambo_done 
    dialog_box_exit
    do_backend_retry
endscript

script goal_combomambo_expire 
    if ObjectExists \{ id = mp_goal_text }
        DestroyScreenElement \{ id = mp_goal_text }
    endif
    printf \{ 'goal_combomambo_expire' }
    if GameModeEquals \{ is_singlesession }
        UpdateRecords
        high_scores_menu_create
        ResetComboRecords
    else
        if OnServer
            SpawnScriptLater \{wait_then_create_rankings params = { score_title_text = 'NAJLEPSZE COMBO' }}
        else
            create_rankings \{ score_title_text = 'NAJLEPSZE COMBO' }
        endif
    endif
endscript

script AddGoal_combomambo 
    GoalManager_AddGoal \{name = combomambo params = { goal_combomambo_genericParams }}
endscript

script StartGoal_combomambo 
    if InSplitScreenGame
        SetScreenModeFromGameMode
    endif
    GoalManager_EditGoal name = combomambo params = <...> 
    GoalManager_ActivateGoal \{ name = combomambo }
endscript
