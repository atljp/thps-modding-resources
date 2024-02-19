goal_trickattack_genericParams = {
    goal_text = 'Musisz zdobyæ najwiêcej punktów by zwyciê¿yæ!'
    time = 10
    net
    goal_type_checksum = net
    init = goal_trickattack_init
    activate = goal_trickattack_activate
    deactivate = goal_trickattack_deactivate
    expire = goal_trickattack_expire
    goal_description = 'Atak trików!'
    restart_node = TRG_G_TrickAttack_RestartNode
}

script goal_trickattack_init 
endscript

script goal_trickattack_activate 
    change goal_utility_last_goal_activated = trickattack
    ResetComboRecords
    if InTeamGame
        FormatText textname = msg_text '\c2Walka na triki:\c0\nWygrywa ten, kto uzyska najwiêcej punktów'
    else
        if GameModeEquals is_singlesession
            msg_text = ' '
        else
            FormatText textname = msg_text '\c2Walka na triki:\c0\nWygrywa ten, kto uzyska najwiêcej punktów'
        endif
    endif
    if InSplitScreenGame
        MakeSkaterGosub add_skater_to_world skater = 0
        MakeSkaterGosub add_skater_to_world skater = 1
    endif
    DisplayGameDescription description = <msg_text>
    if ((GameModeEquals is_singlesession)|| (GameModeEquals is_classic))
        skater ::runstarted
        SetScoreAccumulation 1
        SetScoreDegradation 1
    endif
    ResetScore
endscript

script goal_trickattack_deactivate 
    if ObjectExists id = mp_goal_text
        DestroyScreenElement id = mp_goal_text
    endif
    if ((GameModeEquals is_singlesession)|| (GameModeEquals is_classic))
        GoalManager_SetGoalTimer name = <goal_id>
        SetScoreAccumulation 0
        SetScoreDegradation 0
        if NOT ObjectExists id = dialog_bg_anchor
            if NOT GotParam quick_start
                pausegame
                root_window ::settags menu_state = on
                SpawnScriptLater goal_trick_attack_high_score_menu params = { restart_node = <restart_node> }
            else
                ResetSkaters node = <restart_node>
            endif
        else
            ResetSkaters node = <restart_node>
        endif
    endif
endscript

script goal_trick_attack_high_score_menu 
    printf '======= goal_trick_attack_high_score_menu'
    if IsTrue is_changing_levels
        return 
    endif
    kill_start_key_binding
    pausegame
    pause_trick_text
    if ScreenElementExists id = goal_start_dialog
        DestroyScreenElement id = goal_start_dialog
    endif
    TantrumMessageKill
    kill_speech_boxes
    UpdateRecords
    if NewRecord
        high_scores_menu_enter_initials restart_node = <restart_node>
        FireEvent type = focus target = keyboard_vmenu
    else
        high_scores_menu_create restart_node = <restart_node>
    endif
    ResetComboRecords
endscript

script goal_trickattack_expire 
    if ObjectExists \{ id = mp_goal_text }
        DestroyScreenElement \{ id = mp_goal_text }
    endif
    if NOT GameModeEquals \{ is_singlesession }
        if NOT GameModeEquals \{ is_classic }
            if InSplitScreenGame
                create_rankings
            else
                if OnServer
                    SpawnScriptLater \{ wait_then_create_rankings }
                else
                    create_rankings
                endif
            endif
        endif
    endif
endscript

script AddGoal_TrickAttack 
    GetLevelStructureName
    <zone_name> = (<level_structure_name>.level)
    if InMultiPlayerGame
        ReformatNetZoneStringName zone_string_name = <zone_name>
    endif
    FormatText checksumname = restart_node '%s_TRG_G_TrickAttack_RestartNode' s = <zone_name>
    GoalManager_AddGoal name = trickattack {
        params = {
            goal_text = (goal_trickattack_genericParams.goal_text)
            time = (goal_trickattack_genericParams.time)
            init = (goal_trickattack_genericParams.init)
            activate = (goal_trickattack_genericParams.activate)
            deactivate = (goal_trickattack_genericParams.deactivate)
            expire = (goal_trickattack_genericParams.expire)
            goal_description = (goal_trickattack_genericParams.goal_description)
            restart_node = <restart_node>
            net
            goal_type_checksum = net
            dont_allow_skater_exit_bike
        }
    }
endscript

script StartGoal_TrickAttack 
    if InSplitScreenGame
        SetScreenModeFromGameMode
    endif
    GoalManager_EditGoal name = trickattack params = <...> 
    GoalManager_ActivateGoal \{ name = trickattack }
endscript

script TrickAttack_MenuStartRun 
    GoalManager_EditGoal \{name = trickattack params = { can_retry_goal cross_zone }}
    GoalManager_ActivateGoal \{ name = trickattack }
    exit_pause_menu
endscript

script end_high_score_run 
    change \{ check_for_unplugged_controllers = 0 }
    exit_pause_menu
    GoalManager_DeactivateGoal \{ name = trickattack }
    change \{ check_for_unplugged_controllers = 1 }
endscript
