goal_firefight_genericParams = {
    goal_text = 'Du musst alle anderen Spieler ausschalten!'
    unlimited_time = 1
    net
    goal_type_checksum = net
    init = goal_firefight_init
    activate = goal_firefight_activate
    active = goal_firefight_active
    deactivate = goal_firefight_deactivate
    expire = goal_firefight_expire
    goal_description = 'Feuergefecht!'
}

script goal_firefight_init 
endscript

script goal_firefight_activate 
    if InTeamGame
        FormatText textname = msg_text '\c2Feuergefecht! \n\c0Das Team, das übrig bleibt, gewinnt.\n\b1\b7 oder \b1\b4\nzum Schießen'
    else
        FormatText textname = msg_text '\c2Feuergefecht! \n\c0Der Spieler, der übrig bleibt, gewinnt.\n\b1\b7 oder \b1\b4\nzum Schießen'
    endif
    if NOT IsObserving
        skater ::pickeduppowerup fireball
        bind_fireball_tricks
    endif
    if InSplitScreenGame
        skater2 ::pickeduppowerup fireball
        bind_fireball_tricks_player_2
        MakeSkaterGosub add_skater_to_world skater = 0
        MakeSkaterGosub add_skater_to_world skater = 1
    endif
    DisplayGameDescription description = <msg_text>
    ResetScore
endscript

script goal_firefight_active 
    if OnlyOneSkaterLeft
        if OnServer
            if CalculateFinalScores
                GoalManager_DeactivateGoal name = <goal_id>
                goal_firefight_finished
            endif
        else
            GoalManager_DeactivateGoal name = <goal_id>
            goal_firefight_finished
        endif
    endif
endscript

script goal_firefight_finished 
    ClearPowerups
    if NOT IsObserving
        unbind_fireball_tricks
    endif
    if InSplitScreenGame
        unbind_fireball_tricks_player_2
    endif
    if ObjectExists \{ id = mp_goal_text }
        DestroyScreenElement \{ id = mp_goal_text }
    endif
    printf \{ 'goal_firefight_deactivate' }
    report_stats \{ final }
    create_rankings \{ score_title_text = 'GESUNDHEIT' }
endscript

script goal_firefight_deactivate 
    ClearPowerups
    if NOT IsObserving
        unbind_fireball_tricks
    endif
    if InSplitScreenGame
        unbind_fireball_tricks_player_2
    endif
    if ObjectExists \{ id = mp_goal_text }
        DestroyScreenElement \{ id = mp_goal_text }
    endif
endscript

script firefight_done 
    dialog_box_exit
    do_backend_retry
endscript

script goal_firefight_expire 
    if ObjectExists \{ id = mp_goal_text }
        DestroyScreenElement \{ id = mp_goal_text }
    endif
    printf \{ 'goal_firefight_expire' }
    if OnServer
        SpawnScriptLater \{wait_then_create_rankings params = { score_title_text = 'Gesundheit' }}
    else
        create_rankings \{ score_title_text = 'Gesundheit' }
    endif
endscript

script AddGoal_firefight 
    GoalManager_AddGoal name = firefight {
        params = { goal_firefight_genericParams
        <...> 
         }
    }
endscript

script StartGoal_firefight 
    if InSplitScreenGame
        SetScreenModeFromGameMode
    endif
    GoalManager_EditGoal name = firefight params = <...> 
    GoalManager_ActivateGoal \{ name = firefight }
endscript

script announce_elimination 
    printf \{ 'announcing elimination!!!!' }
    FormatText textname = msg_text '%s wurde ausgeschaltet!' s = <name>
    create_net_panel_message msg_time = 2000 text = <msg_text>
endscript

script bind_fireball_tricks 
    GetTrickFromKeyCombo key_combo = Air_SquareU
    if GotParam cat_num
        skater ::settags old_fireballf_checksum = <cat_num>
    else
        skater ::settags old_fireballf_checksum = <trick_checksum>
    endif
    BindTrickToKeyCombo {
        key_combo = Air_SquareU
        Trick = FireballF
        update_mappings = 1
    }
    UpdateTrickMappings skater = 0
    RemoveParameter cat_num
    GetTrickFromKeyCombo key_combo = Air_SquareD
    if GotParam cat_num
        skater ::settags old_fireballb_checksum = <cat_num>
    else
        skater ::settags old_fireballb_checksum = <trick_checksum>
    endif
    BindTrickToKeyCombo {
        key_combo = Air_SquareD
        Trick = FireballB
        update_mappings = 1
    }
    UpdateTrickMappings skater = 0
endscript

script bind_fireball_tricks_player_2 
    SetCurrentSkaterProfile 1
    GetTrickFromKeyCombo key_combo = Air_SquareU
    if GotParam cat_num
        skater2 ::settags old_fireballf_checksum = <cat_num>
    else
        skater2 ::settags old_fireballf_checksum = <trick_checksum>
    endif
    BindTrickToKeyCombo {
        key_combo = Air_SquareU
        Trick = FireballF
        update_mappings = 1
    }
    UpdateTrickMappings skater = 1
    RemoveParameter cat_num
    GetTrickFromKeyCombo key_combo = Air_SquareD
    if GotParam cat_num
        skater2 ::settags old_fireballb_checksum = <cat_num>
    else
        skater2 ::settags old_fireballb_checksum = <trick_checksum>
    endif
    BindTrickToKeyCombo {
        key_combo = Air_SquareD
        Trick = FireballB
        update_mappings = 1
    }
    UpdateTrickMappings skater = 1
    SetCurrentSkaterProfile 0
endscript

script unbind_fireball_tricks 
    skater ::gettags
    if GotParam \{ old_fireballf_checksum }
        BindTrickToKeyCombo {
            key_combo = Air_SquareU
            Trick = <old_fireballf_checksum>
            update_mappings = 1
        }
    endif
    UpdateTrickMappings \{ skater = 0 }
    if GotParam \{ old_fireballb_checksum }
        BindTrickToKeyCombo {
            key_combo = Air_SquareD
            Trick = <old_fireballb_checksum>
            update_mappings = 1
        }
    endif
    UpdateTrickMappings \{ skater = 0 }
endscript

script unbind_fireball_tricks_player_2 
    SetCurrentSkaterProfile \{ 1 }
    skater2 ::gettags
    if GotParam \{ old_fireballf_checksum }
        BindTrickToKeyCombo {
            key_combo = Air_SquareU
            Trick = <old_fireballf_checksum>
            update_mappings = 2
        }
    endif
    UpdateTrickMappings \{ skater = 1 }
    if GotParam \{ old_fireballb_checksum }
        BindTrickToKeyCombo {
            key_combo = Air_SquareD
            Trick = <old_fireballb_checksum>
            update_mappings = 2
        }
    endif
    UpdateTrickMappings \{ skater = 1 }
    SetCurrentSkaterProfile \{ 0 }
endscript
