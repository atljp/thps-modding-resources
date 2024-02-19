goal_graffiti_genericParams = {
    goal_text = 'Musisz zrobiæ wiêcej tagów, by wygraæ!'
    time = 10
    net
    goal_type_checksum = net
    init = goal_graffiti_init
    activate = goal_graffiti_activate
    deactivate = goal_graffiti_deactivate
    expire = goal_graffiti_expire
    goal_description = 'Graffitti!'
}

script goal_graffiti_init 
endscript

script goal_graffiti_activate 
    if InTeamGame
        FormatText textname = msg_text '\c4Graffiti:\n\c0Wygrywa dru¿yna, która zrobi wiêcej tagów.'
    else
        FormatText textname = msg_text '\c4Graffitti:\n\c0Gracz, który zrobi najwiêcej tagów, wygrywa.'
    endif
    if InSplitScreenGame
        MakeSkaterGosub add_skater_to_world skater = 0
        MakeSkaterGosub add_skater_to_world skater = 1
    endif
    DisplayGameDescription description = <msg_text>
    RunScriptOnScreenElement id = the_time clock_morph
    ResetScore
endscript

script goal_graffiti_deactivate 
    if ObjectExists \{ id = mp_goal_text }
        DestroyScreenElement \{ id = mp_goal_text }
    endif
endscript

script graffiti_done 
    dialog_box_exit
    do_backend_retry
endscript

script goal_graffiti_expire 
    if ObjectExists \{ id = mp_goal_text }
        DestroyScreenElement \{ id = mp_goal_text }
    endif
    if ObjectExists \{ id = goal_message }
        DestroyScreenElement \{ id = goal_message }
    endif
    printf \{ 'goal_graffiti_expire' }
    if OnServer
        SpawnScriptLater \{wait_then_create_rankings params = { score_title_text = 'WRZUTY' }}
    else
        create_rankings \{ score_title_text = 'WRZUTY' }
    endif
endscript

script AddGoal_Graffiti 
    GoalManager_AddGoal name = graffiti {
        params = { goal_graffiti_genericParams
        <...> 
         }
    }
endscript

script StartGoal_Graffiti 
    if InSplitScreenGame
        SetScreenModeFromGameMode
    endif
    GoalManager_EditGoal name = graffiti params = <...> 
    GoalManager_ActivateGoal \{ name = graffiti }
endscript
