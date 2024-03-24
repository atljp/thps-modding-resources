
goal_king_genericParams = {
    goal_text = 'Capture the crown and keep it away from others!'
    unlimited_time = 1
    Score = 10000
    net
    init = goal_king_init
    activate = goal_king_activate
    deactivate = goal_king_deactivate
    active = goal_king_active
    goal_description = 'King of the Hill!'
}

script goal_king_init 
endscript


script goal_king_activate 
    if InSplitScreenGame
        MakeSkaterGosub add_skater_to_world skater = 0
        MakeSkaterGosub add_skater_to_world skater = 1
        ScriptGetScreenMode
        switch <screen_mode>
            case split_vertical
            msg_pos = (350.0, 42.0)
            case split_horizontal
            msg_pos = (620.0, 27.0)
        endswitch
    else
        msg_pos = (620.0, 27.0)
    endif
    if InNetGame
        switch <Score>
            case 30000
            time_string = '30 seconds'
            case 60000
            time_string = '1 minute'
            case 120000
            time_string = '2 minutes'
            case 300000
            time_string = '5 minutes'
            case 600000
            time_string = '10 minutes'
        endswitch
        if InTeamGame
            FormatText textname = msg_text '\c3King of the Hill:\n\c0Hold the crown for \n%s to win.' s = <time_string>
        else
            FormatText textname = msg_text '\c3King of the Hill:\n\c0Hold the crown for \n%s to win.' s = <time_string>
        endif
        create_panel_block id = mp_goal_text parent = root_window text = <msg_text> style = panel_message_goal final_pos = <msg_pos>
    endif
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
    if ObjectExists id = mp_goal_text
        DestroyScreenElement id = mp_goal_text
    endif
    hide_crown_arrow player_1 player_2
    
    if OnServer
        if InInternetMode
            ReportStats final
        endif
    endif
    create_rankings score_title_text = 'TIME'
endscript


script goal_king_deactivate 
    if ObjectExists id = mp_goal_text
        DestroyScreenElement id = mp_goal_text
    endif
    hide_crown_arrow player_1 player_2
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
                    Create3dArrowPointer id = crown_arrow name = crown_object Pos = (395.0, 50.0) Scale = 0.02000 Model = 'HUD_Arrow'
                endif
            endif
            if GotParam player_2
                if NOT ObjectExists id = crown_arrow_2
                    Create3dArrowPointer id = crown_arrow_2 name = crown_object Pos = (395.0, 50.0) Scale = 0.02000 active_viewport = 1 Model = 'HUD_Arrow'
                endif
            endif
            case split_horizontal
            if GotParam player_1
                if NOT ObjectExists id = crown_arrow
                    Create3dArrowPointer id = crown_arrow name = crown_object Pos = (320.0, 140.0) Scale = 0.02000 Model = 'HUD_Arrow'
                endif
            endif
            if GotParam player_2
                if NOT ObjectExists id = crown_arrow_2
                    Create3dArrowPointer id = crown_arrow_2 name = crown_object Pos = (320.0, 140.0) Scale = 0.02000 active_viewport = 1 Model = 'HUD_Arrow'
                endif
            endif
        endswitch
    else
        if GotParam player_1
            if NOT ObjectExists id = crown_arrow
                Create3dArrowPointer id = crown_arrow name = crown_object Model = 'HUD_Arrow'
            endif
        endif
    endif
endscript


script hide_crown_arrow 
    if GotParam player_1
        if ObjectExists id = crown_arrow
            DestroyScreenElement id = crown_arrow
        endif
    endif
    if GotParam player_2
        if ObjectExists id = crown_arrow_2
            DestroyScreenElement id = crown_arrow_2
        endif
    endif
endscript


script StartGoal_King 
    if InSplitScreenGame
        SetScreenModeFromGameMode
    endif
    GoalManager_EditGoal name = king params = <...> 
    GoalManager_ActivateGoal name = king
endscript

