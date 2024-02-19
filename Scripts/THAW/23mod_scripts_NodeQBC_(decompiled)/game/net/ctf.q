goal_ctf_genericParams = {
    goal_text = 'Zdob¹d flagê drugiej dru¿yny i odwie j¹ do waszej bazy!'
    time = 30
    Score = 1
    net
    goal_type_checksum = net
    init = goal_ctf_init
    activate = goal_ctf_activate
    deactivate = goal_ctf_deactivate
    active = goal_ctf_active
    goal_description = 'Zdob¹d flagê!'
}

script goal_ctf_init 
endscript

script goal_ctf_activate 
    GetNumTeams
    create_team_flags <...> 
    printstruct <...> 
    if (<unlimited_time> = 1)
        if (<Score> = 1)
            FormatText textname = msg_text '\c3Zdob¹d flagê:\n\c0Pierwsi, którzy zdobêd¹ %s wygrywaj¹.' s = <Score>
        else
            FormatText textname = msg_text '\c3Zdob¹d flagê:\n\c0Pierwszy, który zdobêdzie flagê %s razy, wygrywa' s = <Score>
        endif
    else
        FormatText textname = msg_text '\c3Zdob¹d flagê:\n\c0Ten, kto zdobêdzie flagê najwiêcej razy, wygrywa'
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
        create_rankings \{ score_title_text = 'PRZEJÊCIA' }
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
            script_assert 'Create_Team_Flags zg³osi³o siê, zanim stworzono mapê strefy'
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
    FormatText textname = msg_text '%s zabra³ flagê %w.' s = <string0> w = <string1>
    create_net_panel_message text = <msg_text> style = net_team_panel_message
endscript

script took_flag_you 
    printf \{ '******* took flag you' }
    create_ctf_panel_message \{ msg_text = 'Wróæ z flag¹ do swojej bazy!' }
    FormatText textname = msg_text 'Zabra³e flagê %s. Zanie j¹ do swojej bazy!' s = <string0>
    create_net_panel_message text = <msg_text> style = net_team_panel_message
endscript

script took_flag_yours 
    printf \{ '******* took flag yours' }
    FormatText textname = msg_text '%s zabra³ twoj¹ flagê! Dorwij go!' s = <string0>
    create_net_panel_message text = <msg_text> style = net_team_panel_message
endscript

script stole_flag_other 
    printf \{ '******* stole flag other' }
    FormatText textname = msg_text '%s ukrad³ flagê %w.' s = <string0> w = <string1>
    create_net_panel_message text = <msg_text> style = net_team_panel_message
endscript

script stole_flag_you 
    printf \{ '******* stole flag you' }
    FormatText textname = msg_text 'Ukrad³e flagê %s. Zanie j¹ do swojej bazy!' s = <string0>
    create_net_panel_message text = <msg_text> style = net_team_panel_message
endscript

script stole_flag_from_you 
    printf \{ '******* stole flag from you' }
    destroy_ctf_panel_message
    FormatText textname = msg_text '%s has stolen the %w flag from you!' s = <string0> w = <string1>
    create_net_panel_message text = <msg_text> style = net_team_panel_message
endscript

script relocate_flag 
    if NOT GetCurrentZoneName
        script_assert 'Create_Team_Flags zg³osi³o siê, zanim stworzono mapê strefy'
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
    FormatText textname = msg_text '%s zdoby³ twoj¹ flagê!' s = <string0>
    create_net_panel_message text = <msg_text> style = net_team_panel_message
    relocate_flag <...> 
endscript

script captured_flag_other 
    printf \{ '******* captured flag other' }
    FormatText textname = msg_text '%s zdoby³ flagê %w!' s = <string0> w = <string1>
    create_net_panel_message text = <msg_text> style = net_team_panel_message
    relocate_flag <...> 
endscript

script captured_flag_you 
    printf \{ '******* captured flag you' }
    destroy_ctf_panel_message
    FormatText textname = msg_text 'Odebrano flagê nale¿¹c¹ do: %s' s = <string0>
    create_net_panel_message text = <msg_text> style = net_team_panel_message
    relocate_flag <...> 
endscript

script retrieved_flag_you 
    printf \{ '******* retrieved flag you' }
    FormatText textname = msg_text 'Odzyska³e flagê %s!' s = <string0>
    create_net_panel_message text = <msg_text> style = net_team_panel_message
    relocate_flag <...> 
endscript

script retrieved_flag_other 
    printf \{ '******* retrieved flag other' }
    FormatText textname = msg_text '%s odzyska³ flagê %w!' s = <string0> w = <string1>
    create_net_panel_message text = <msg_text> style = net_team_panel_message
    relocate_flag <...> 
endscript

script flag_returned 
    printf \{ '******* flag returned' }
    FormatText textname = msg_text '%s wróci³o do bazy.' s = <string0>
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
