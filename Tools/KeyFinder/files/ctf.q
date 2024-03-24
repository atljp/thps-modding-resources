
goal_ctf_genericParams = {
    goal_text = 'Capture the other team\'s flag and return it to your base!'
    time = 30
    Score = 1
    net
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
    
    if (<unlimited_time> = 1)
        if (<Score> = 1)
            FormatText textname = msg_text '\c3Capture the Flag:\n\c0First to %s capture wins' s = <Score>
        else
            FormatText textname = msg_text '\c3Capture the Flag:\n\c0First to %s captures wins' s = <Score>
        endif
    else
        FormatText textname = msg_text '\c3Capture the Flag:\n\c0Most captures wins'
    endif
    if InNetGame
        create_panel_block id = mp_goal_text parent = root_window text = <msg_text> style = panel_message_goal
    endif
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
    
    if ObjectExists id = mp_goal_text
        DestroyScreenElement id = mp_goal_text
    endif
    destroy_ctf_panel_message
    hide_ctf_arrow
    kill_team_flags
    EndCTFGame
    if OnServer
        if InInternetMode
            ReportStats final
        endif
    endif
    if NOT (is_changing_levels = 1)
        create_rankings score_title_text = 'CAPTURES'
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
        
        if ObjectExists id = ctf_arrow
            
            hide_ctf_arrow
        endif
        switch <team>
            case 0
            
            target = TRG_CTF_Red
            case 1
            
            target = TRG_CTF_Blue
            case 2
            
            target = TRG_CTF_Green
            case 3
            
            target = TRG_CTF_Yellow
        endswitch
        
        Create3dArrowPointer id = ctf_arrow name = <target> Model = 'HUD_Arrow'
    endif
endscript


script hide_ctf_arrow 
    if ObjectExists id = ctf_arrow
        DestroyScreenElement id = ctf_arrow
    endif
endscript


script Startgoal_ctf 
    GoalManager_EditGoal name = CTF params = <...> 
    GoalManager_ActivateGoal name = CTF
endscript


script took_flag_other 
    
    FormatText textname = msg_text '%s has taken the %w flag.' s = <string0> w = <string1>
    create_net_panel_message text = <msg_text> style = net_team_panel_message
endscript


script took_flag_you 
    
    create_ctf_panel_message msg_text = 'Return the flag to your base!'
    FormatText textname = msg_text 'You have taken the %s flag. Return it to your base!' s = <string0>
    create_net_panel_message text = <msg_text> style = net_team_panel_message
endscript


script took_flag_yours 
    
    FormatText textname = msg_text '%s has taken your flag! Hunt him down!' s = <string0>
    create_net_panel_message text = <msg_text> style = net_team_panel_message
endscript


script stole_flag_other 
    
    FormatText textname = msg_text '%s has stolen the %w flag.' s = <string0> w = <string1>
    create_net_panel_message text = <msg_text> style = net_team_panel_message
endscript


script stole_flag_you 
    
    FormatText textname = msg_text 'You have stolen the %s flag. Return it to your base!' s = <string0>
    create_net_panel_message text = <msg_text> style = net_team_panel_message
endscript


script stole_flag_from_you 
    
    destroy_ctf_panel_message
    FormatText textname = msg_text '%s has stolen the %w flag from you!' s = <string0> w = <string1>
    create_net_panel_message text = <msg_text> style = net_team_panel_message
endscript


script relocate_flag 
    switch <team>
        case 0
        flag_name = TRG_CTF_Red
        case 1
        flag_name = TRG_CTF_Blue
        case 2
        flag_name = TRG_CTF_Green
        case 3
        flag_name = TRG_CTF_Yellow
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
    
    FormatText textname = msg_text '%s has captured your flag.!' s = <string0>
    create_net_panel_message text = <msg_text> style = net_team_panel_message
    relocate_flag <...> 
endscript


script captured_flag_other 
    
    FormatText textname = msg_text '%s has captured the %w flag.' s = <string0> w = <string1>
    create_net_panel_message text = <msg_text> style = net_team_panel_message
    relocate_flag <...> 
endscript


script captured_flag_you 
    
    destroy_ctf_panel_message
    FormatText textname = msg_text 'You have captured the %s flag.' s = <string0>
    create_net_panel_message text = <msg_text> style = net_team_panel_message
    relocate_flag <...> 
endscript


script retrieved_flag_you 
    
    FormatText textname = msg_text 'You retrieved the %s flag!' s = <string0>
    create_net_panel_message text = <msg_text> style = net_team_panel_message
    relocate_flag <...> 
endscript


script retrieved_flag_other 
    
    FormatText textname = msg_text '%s retrieved the %w flag.' s = <string0> w = <string1>
    create_net_panel_message text = <msg_text> style = net_team_panel_message
    relocate_flag <...> 
endscript


script flag_returned 
    
    FormatText textname = msg_text 'The %s has returned to its base.' s = <string0>
    create_net_panel_message text = <msg_text> style = net_team_panel_message
    relocate_flag <...> 
endscript


script create_ctf_panel_message 
    create_panel_block id = current_ctf_message parent = root_window text = <msg_text> style = panel_message_goal final_pos = (620.0, 80.0) dont_animate
endscript


script destroy_ctf_panel_message 
    if ObjectExists id = current_ctf_message
        DestroyScreenElement id = current_ctf_message
    endif
endscript

