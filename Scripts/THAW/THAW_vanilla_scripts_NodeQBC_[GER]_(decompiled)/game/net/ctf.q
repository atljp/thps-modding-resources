goal_ctf_genericParams = {
    goal_text = 'Erobere die Flagge des anderen Teams, bring sie zum Basis!'
    time = 30
    Score = 1
    net
    goal_type_checksum = net
    init = goal_ctf_init
    activate = goal_ctf_activate
    deactivate = goal_ctf_deactivate
    active = goal_ctf_active
    goal_description = 'Capture the Flag!'
}

script goal_ctf_init 
endscript

script goal_ctf_activate 
    GetNumTeams
    create_team_flags <...> 
    printstruct <...> 
    if (<unlimited_time> = 1)
        if (<Score> = 1)
            FormatText textname = msg_text '\c3Capture the Flag:\n\c0Wer die Flagge zuerst %s Mal erobert siegt.' s = <Score>
        else
            FormatText textname = msg_text '\c3Capture the Flag:\n\c0Wer die Flagge zuerst %s Mal erobert siegt.' s = <Score>
        endif
    else
        FormatText textname = msg_text '\c3Capture the Flag:\n\c0Sieg bei meisten Flaggen'
    endif
    DisplayGameDescription description = <msg_text>
    ResetScore
    if (<unlimited_time> = 0)
        RunScriptOnScreenElement id = the_time clock_morph
    endif
    StartCTFGame
endscript

script goal_ctf_active 
    if (<unlimited_time> = 1)
        if AnySkaterTotalScoreAtLeast <Score>
            if OnServer
                if CalculateFinalScores
                    GoalManager_DeactivateGoal name = <goal_id>
                endif
            else
                GoalManager_DeactivateGoal name = <goal_id>
            endif
        endif
    endif
endscript

script goal_ctf_deactivate 
    printf \{ '*************** goal_ctf_deactivate' }
    if ObjectExists \{ id = mp_goal_text }
        DestroyScreenElement \{ id = mp_goal_text }
    endif
    destroy_ctf_panel_message
    hide_ctf_arrow
    kill_team_flags
    EndCTFGame
    report_stats \{ final }
    if NOT (is_changing_levels = 1)
        create_rankings \{ score_title_text = 'EROBERUNGEN' }
    endif
endscript

script ctf_done 
    dialog_box_exit
    do_backend_retry
endscript

script Addgoal_ctf 
    GoalManager_AddGoal name = CTF {
        params = { goal_ctf_genericParams
        <...> 
         }
    }
endscript

script show_ctf_arrow 
    if IsObserving
        return 
    endif
    if GoalManager_GoalIsActive name = CTF
        printf '***** SHOWING CTF ARROW'
        if ObjectExists id = ctf_arrow
            printf '***** HIDING IT FIRST'
            hide_ctf_arrow
        endif
        if NOT GetCurrentZoneName
            script_assert 'Create_Team_Flags called before zone map created'
        endif
        switch <team>
            case 0
            printf '***** target is red'
            FormatText checksumname = target '%z_TRG_CTF_Red' z = <zone_name>
            case 1
            printf '***** target is blue'
            FormatText checksumname = target '%z_TRG_CTF_Blue' z = <zone_name>
            case 2
            printf '***** target is green'
            FormatText checksumname = target '%z_TRG_CTF_Green' z = <zone_name>
            case 3
            printf '***** target is yellow'
            FormatText checksumname = target '%z_TRG_CTF_Yellow' z = <zone_name>
        endswitch
        printf '***** creating....'
        Create3dArrowPointer id = ctf_arrow name = <target>
    endif
endscript

script hide_ctf_arrow 
    if ObjectExists \{ id = ctf_arrow }
        DestroyScreenElement \{ id = ctf_arrow }
    endif
endscript

script Startgoal_ctf 
    GoalManager_EditGoal name = CTF params = <...> 
    GoalManager_ActivateGoal \{ name = CTF }
endscript

script took_flag_other 
    printf \{ '******* took flag other' }
    FormatText textname = msg_text '%s hat die Flagge von Team %w genommen.' s = <string0> w = <string1>
    create_net_panel_message text = <msg_text> style = net_team_panel_message
endscript

script took_flag_you 
    printf \{ '******* took flag you' }
    create_ctf_panel_message \{ msg_text = 'Bring die Flagge zum Basis!' }
    FormatText textname = msg_text 'Du hast die Flagge von Team %s. Bring sie zum Basis!' s = <string0>
    create_net_panel_message text = <msg_text> style = net_team_panel_message
endscript

script took_flag_yours 
    printf \{ '******* took flag yours' }
    FormatText textname = msg_text '%s hat deine Flagge genommen! Schnapp sie dir!' s = <string0>
    create_net_panel_message text = <msg_text> style = net_team_panel_message
endscript

script stole_flag_other 
    printf \{ '******* stole flag other' }
    FormatText textname = msg_text '%s hat die Flagge von Team %w geklaut.' s = <string0> w = <string1>
    create_net_panel_message text = <msg_text> style = net_team_panel_message
endscript

script stole_flag_you 
    printf \{ '******* stole flag you' }
    FormatText textname = msg_text 'Du hast die Flagge von Team %s. Bring sie zum Basis!' s = <string0>
    create_net_panel_message text = <msg_text> style = net_team_panel_message
endscript

script stole_flag_from_you 
    printf \{ '******* stole flag from you' }
    destroy_ctf_panel_message
    FormatText textname = msg_text '%s hat dir die Flagge von Team %w geklaut!' s = <string0> w = <string1>
    create_net_panel_message text = <msg_text> style = net_team_panel_message
endscript

script relocate_flag 
    if NOT GetCurrentZoneName
        script_assert 'Create_Team_Flags called before zone map created'
    endif
    switch <team>
        case 0
        FormatText checksumname = flag_name '%z_TRG_CTF_Red' z = <zone_name>
        case 1
        FormatText checksumname = flag_name '%z_TRG_CTF_Blue' z = <zone_name>
        case 2
        FormatText checksumname = flag_name '%z_TRG_CTF_Green' z = <zone_name>
        case 3
        FormatText checksumname = flag_name '%z_TRG_CTF_Yellow' z = <zone_name>
    endswitch
    if NodeExists <flag_name>
        if IsAlive name = <flag_name>
            <flag_name> ::Die
        endif
    endif
    Create name = <flag_name>
    if OnServer
        <flag_name> ::Obj_SetException Ex = anyobjectinradius scr = CTF_Team_Flag_Trigger params = { <...>  }
    endif
endscript

script captured_your_flag 
    printf \{ '******* captured your flag' }
    FormatText textname = msg_text '%s hat deine Flagge erobert!' s = <string0>
    create_net_panel_message text = <msg_text> style = net_team_panel_message
    relocate_flag <...> 
endscript

script captured_flag_other 
    printf \{ '******* captured flag other' }
    FormatText textname = msg_text '%s hat die Flagge von Team %w erobert!' s = <string0> w = <string1>
    create_net_panel_message text = <msg_text> style = net_team_panel_message
    relocate_flag <...> 
endscript

script captured_flag_you 
    printf \{ '******* captured flag you' }
    destroy_ctf_panel_message
    FormatText textname = msg_text 'Du hast die Flagge von Team %s erobert!' s = <string0>
    create_net_panel_message text = <msg_text> style = net_team_panel_message
    relocate_flag <...> 
endscript

script retrieved_flag_you 
    printf \{ '******* retrieved flag you' }
    FormatText textname = msg_text 'Du hast die Flagge von %s wiedererlangt!' s = <string0>
    create_net_panel_message text = <msg_text> style = net_team_panel_message
    relocate_flag <...> 
endscript

script retrieved_flag_other 
    printf \{ '******* retrieved flag other' }
    FormatText textname = msg_text '%s hat die Flagge von Team %w wiedererlangt.' s = <string0> w = <string1>
    create_net_panel_message text = <msg_text> style = net_team_panel_message
    relocate_flag <...> 
endscript

script flag_returned 
    printf \{ '******* flag returned' }
    FormatText textname = msg_text 'Die %s wurde zu ihrer Basis zurückgebracht.' s = <string0>
    create_net_panel_message text = <msg_text> style = net_team_panel_message
    relocate_flag <...> 
endscript

script create_ctf_panel_message 
    create_panel_block id = current_ctf_message parent = root_window text = <msg_text> style = panel_message_goal final_pos = (620.0, 80.0) dont_animate
endscript

script destroy_ctf_panel_message 
    if ObjectExists \{ id = current_ctf_message }
        DestroyScreenElement \{ id = current_ctf_message }
    endif
endscript
