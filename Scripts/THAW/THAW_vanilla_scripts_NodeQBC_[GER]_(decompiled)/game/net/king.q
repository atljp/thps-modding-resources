crown_object_components = [
    { Component = Crown }
    { Component = motion }
    { Component = Model Model = 'crown\crown.mdl' }
]
goal_king_genericParams = {
    goal_text = 'Hol dir die Krone und halte sie von den anderen fern!'
    unlimited_time = 1
    Score = 10000
    net
    goal_type_checksum = net
    init = goal_king_init
    activate = goal_king_activate
    deactivate = goal_king_deactivate
    active = goal_king_active
    goal_description = 'Lord of the Board!'
}

script goal_king_init 
endscript

script goal_king_activate 
    printf 'script goal_king_activate'
    if InSplitScreenGame
        MakeSkaterGosub add_skater_to_world skater = 0
        MakeSkaterGosub add_skater_to_world skater = 1
    endif
    switch <Score>
        case 30000
        time_string = '30 Sekunden'
        case 60000
        time_string = '1 Minute'
        case 120000
        time_string = '2 Minuten'
        case 300000
        time_string = '5 Minuten'
        case 600000
        time_string = '10 Minuten'
    endswitch
    if InTeamGame
        FormatText textname = msg_text '\c3Lord of the Board:\n\c0Halte die Krone \n%s lang, um zu gewinnen.' s = <time_string>
    else
        FormatText textname = msg_text '\c3Lord of the Board:\n\c0Halte die Krone \n%s lang, um zu gewinnen.' s = <time_string>
    endif
    DisplayGameDescription description = <msg_text>
    SpawnCrown
    show_crown_arrow player_1 player_2 force_show
    ResetScore
endscript

script goal_king_active 
    if AnySkaterTotalScoreAtLeast <Score>
        if OnServer
            if CalculateFinalScores
                GoalManager_DeactivateGoal name = <goal_id>
                goal_king_finished
            endif
        else
            GoalManager_DeactivateGoal name = <goal_id>
            goal_king_finished
        endif
    endif
endscript

script goal_king_finished 
    if ObjectExists \{ id = mp_goal_text }
        DestroyScreenElement \{ id = mp_goal_text }
    endif
    hide_crown_arrow \{ player_1 player_2 }
    printf \{ 'goal_king_deactivate' }
    report_stats \{ final }
    create_rankings \{ score_title_text = 'ZEIT' }
endscript

script goal_king_deactivate 
    if ObjectExists \{ id = mp_goal_text }
        DestroyScreenElement \{ id = mp_goal_text }
    endif
    hide_crown_arrow \{ player_1 player_2 }
endscript

script king_done 
    dialog_box_exit
    do_backend_retry
endscript

script AddGoal_King 
    GoalManager_AddGoal name = king {
        params = { goal_king_genericParams
        <...> 
         }
    }
endscript

script show_crown_arrow 
    if NOT GotParam force_show
        if NOT GoalManager_GoalIsActive name = king
            return 
        endif
    endif
    if InSplitScreenGame
        ScriptGetScreenMode
        switch <screen_mode>
            case split_vertical
            if GotParam player_1
                if NOT ObjectExists id = crown_arrow
                    Create3dArrowPointer id = crown_arrow name = crown_object Pos = (395.0, 50.0) Scale = 0.02000
                endif
            endif
            if GotParam player_2
                if NOT ObjectExists id = crown_arrow_2
                    Create3dArrowPointer id = crown_arrow_2 name = crown_object Pos = (395.0, 50.0) Scale = 0.02000 active_viewport = 1
                endif
            endif
            case split_horizontal
            if GotParam player_1
                if NOT ObjectExists id = crown_arrow
                    Create3dArrowPointer id = crown_arrow name = crown_object Pos = (320.0, 140.0) Scale = 0.02000
                endif
            endif
            if GotParam player_2
                if NOT ObjectExists id = crown_arrow_2
                    Create3dArrowPointer id = crown_arrow_2 name = crown_object Pos = (320.0, 140.0) Scale = 0.02000 active_viewport = 1
                endif
            endif
        endswitch
    else
        if GotParam player_1
            if NOT ObjectExists id = crown_arrow
                Create3dArrowPointer id = crown_arrow name = crown_object
            endif
        endif
    endif
endscript

script hide_crown_arrow 
    if GotParam \{ player_1 }
        if ObjectExists \{ id = crown_arrow }
            DestroyScreenElement \{ id = crown_arrow }
        endif
    endif
    if GotParam \{ player_2 }
        if ObjectExists \{ id = crown_arrow_2 }
            DestroyScreenElement \{ id = crown_arrow_2 }
        endif
    endif
endscript

script StartGoal_King 
    printf \{ 'StartGoal_Gold' }
    if InSplitScreenGame
        SetScreenModeFromGameMode
    endif
    GoalManager_EditGoal name = king params = <...> 
    GoalManager_ActivateGoal name = king <...> 
endscript
