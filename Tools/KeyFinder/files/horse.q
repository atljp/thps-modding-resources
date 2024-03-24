

script PlayYouTieScoreSound 
    playsound copinghit3_11
endscript


script PlayYouBeatScoreSound 
    playsound GotStat04
endscript


script PlayYouGetLetterSound 
    playsound HUDtrickslopC
endscript


script PlayYouLoseSound 
    playsound GoalFail
endscript


script PlayNoScoreSetSound 
    playsound GUI_Buzzer01
endscript


script play_appropriate_horse_sound 
    if HorseEnded
        PlayYouLoseSound
    endif
    if HorseStatusEquals GotLetter
        PlayYouGetLetterSound
    endif
    if HorseStatusEquals TieScore
        PlayYouTieScoreSound
    endif
    if HorseStatusEquals BeatScore
        PlayYouBeatScoreSound
    endif
    if HorseStatusEquals NoScoreSet
        PlayNoScoreSetSound
    endif
endscript


script WaitForPanelDone 
    begin 
    if ControllerPressed x
        kill_horse_panel_messages
        break 
    endif
    if ObjectExists id = top
        wait 1 gameframe
    else
        if ObjectExists id = bottom
            wait 1 gameframe
        else
            if ObjectExists id = TopFinal
                wait 1 gameframe
            else
                if ObjectExists id = BottomFinal
                    wait 1 gameframe
                else
                    break 
                endif
            endif
        endif
    endif
    repeat 
endscript


script launch_panel_message 
    LaunchPanelMessage <...> 
endscript

player1_horsecolor = [
    { (128.0, 32.0, 32.0) alpha = 128 }
]
player2_horsecolor = [
    { (32.0, 32.0, 128.0) alpha = 128 }
]
horse_top_key_points = [
    {Pos = (320.0, 204.0) alpha = 0 Scale = 1.0 time = 0}
    {alpha = 128 time = 2.0}
]
horse_middle_key_points = [
    {Pos = (320.0, 224.0) alpha = 0 Scale = 1.0 time = 0}
    {alpha = 128 time = 2.0}
]
horse_bottom_key_points = [
    {Pos = (320.0, 244.0) alpha = 0 Scale = 1.0 time = 0}
    {alpha = 128 time = 2.0}
]
horse_bottomfinal_key_points = [
    {Pos = (340.0, 300.0) alpha = 0 Scale = 2.0 time = 0}
    {alpha = 128 time = 5.0}
]
horse_topfinal_key_points = [
    {Pos = (320.0, 204.0) alpha = 0 Scale = 1.0 time = 0}
    {alpha = 128 time = 5.0}
]
player1_default_horseprop = {
    font = 'title.fnt'
    just = (0.0, 0.0)
    dims = (320.0, 112.0)
    colors = player1_horsecolor
    key_points = horse_middle_key_points
}
player2_default_horseprop = {
    font = 'title.fnt'
    just = (0.0, 0.0)
    dims = (320.0, 112.0)
    colors = player2_horsecolor
    key_points = horse_middle_key_points
}
player1_top_horseprop = {
    player1_default_horseprop
    key_points = horse_top_key_points
}
player2_top_horseprop = {
    player2_default_horseprop
    key_points = horse_top_key_points
}
player1_bottom_horseprop = {
    player1_default_horseprop
    key_points = horse_bottom_key_points
}
player2_bottom_horseprop = {
    player2_default_horseprop
    key_points = horse_bottom_key_points
}
player1_topfinal_horseprop = {
    player1_default_horseprop
    key_points = horse_topfinal_key_points
}
player2_topfinal_horseprop = {
    player2_default_horseprop
    key_points = horse_topfinal_key_points
}
player1_bottomfinal_horseprop = {
    player1_default_horseprop
    key_points = horse_bottomfinal_key_points
}
player2_bottomfinal_horseprop = {
    player2_default_horseprop
    key_points = horse_bottomfinal_key_points
}
horse_final_prop_default = {
    font = 'title.fnt'
    just = (0.0, 0.0)
    dims = (320.0, 112.0)
    colors = [
        { (128.0, 128.0, 128.0) alpha = 128 }
        { (255.0, 245.0, 0.0) alpha = 128 }
        { (195.0, 20.0, 20.0) alpha = 128 }
    ]
    key_points = [
        {Pos = (320.0, 224.0) alpha = 0 Scale = 1.0 time = 0}
        {alpha = 128 time = 5.0}
    ]
}

script remove_skater_from_world 
    
    RemoveSkaterFromWorld
endscript


script add_skater_to_world 
    
    AddSkaterToWorld
    ResetLookAround
endscript


script print_horse_string 
    if IsCurrentHorseSkater 0
        if GotParam top
            ApplyToHorsePanelString {
                whichString = <whichString>
                callback = LaunchPanelMessage
                properties = player1_top_horseprop
                id = top
            }
        else
            if GotParam bottom
                ApplyToHorsePanelString {
                    whichString = <whichString>
                    callback = LaunchPanelMessage
                    properties = player1_bottom_horseprop
                    id = bottom
                }
            else
                if GotParam TopFinal
                    ApplyToHorsePanelString {
                        whichString = <whichString>
                        callback = LaunchPanelMessage
                        properties = player1_topfinal_horseprop
                        id = TopFinal
                    }
                else
                    if GotParam BottomFinal
                        ApplyToHorsePanelString {
                            whichString = <whichString>
                            callback = LaunchPanelMessage
                            properties = player1_bottomfinal_horseprop
                            id = BottomFinal
                        }
                    else
                        ApplyToHorsePanelString {
                            whichString = <whichString>
                            callback = LaunchPanelMessage
                            properties = player1_default_horseprop
                            id = top
                        }
                    endif
                endif
            endif
        endif
    else
        if GotParam top
            ApplyToHorsePanelString {
                whichString = <whichString>
                callback = LaunchPanelMessage
                properties = player2_top_horseprop
                id = top
            }
        else
            if GotParam bottom
                ApplyToHorsePanelString {
                    whichString = <whichString>
                    callback = LaunchPanelMessage
                    properties = player2_bottom_horseprop
                    id = bottom
                }
            else
                if GotParam TopFinal
                    ApplyToHorsePanelString {
                        whichString = <whichString>
                        callback = LaunchPanelMessage
                        properties = player2_topfinal_horseprop
                        id = TopFinal
                    }
                else
                    if GotParam BottomFinal
                        ApplyToHorsePanelString {
                            whichString = <whichString>
                            callback = LaunchPanelMessage
                            properties = player2_bottomfinal_horseprop
                            id = BottomFinal
                        }
                    else
                        ApplyToHorsePanelString {
                            whichString = <whichString>
                            callback = LaunchPanelMessage
                            properties = player2_default_horseprop
                            id = top
                        }
                    endif
                endif
            endif
        endif
    endif
endscript


script horse_start_run 
    kill_start_key_binding
    StartHorseRun
    ShowClock
    disable_inactive_horse_player
    wait 1 gameframe
    WaitForPanelDone
    
    exit_pause_menu
    kill_start_key_binding
    pausegame
    print_horse_string { whichString = playername top }
    print_horse_string { whichString = horseprerun bottom }
    WaitForPanelDone
    GetPreferenceChecksum pref_type = splitscreen horse_time_limit
    switch <checksum>
        case horse_time_10
        horse_time = 10
        case horse_time_20
        horse_time = 20
        case horse_time_30
        horse_time = 30
    endswitch
    StartGoal_Horse_Mp time = <horse_time>
    
    if IsCurrentHorseSkater 0
        skater ::ResetLookAround
        skater ::runstarted
    else
        skater2 ::ResetLookAround
        skater2 ::runstarted
    endif
    horse_check_for_controller_unplugged_dialog
    UnPauseGame
    restore_start_key_binding
    GetHorseString whichString = panelString1
    update_horse_score id = horse_score_1 <...> 
    GetHorseString whichString = panelString2
    update_horse_score id = horse_score_2 <...> 
    GetHorseString whichString = horseprerun
    update_horse_score id = horse_score_3 <...> 
    wait 1 gameframe
endscript


script disable_inactive_horse_player 
    if IsCurrentHorseSkater 0
        
        SetScreenMode horse1
        MakeSkaterGosub add_skater_to_world skater = 0
        DoScreenElementMorph {id = player1_panel_container alpha = 1}
        
        MakeSkaterGosub remove_skater_from_world skater = 1
        DoScreenElementMorph {id = player2_panel_container alpha = 0}
        
        
        skater2 ::disableplayerinput
        skater2 ::PausePhysics
        skater ::enableplayerinput
        skater ::UnPausePhysics
    else
        if IsCurrentHorseSkater 1
            
            SetScreenMode horse2
            MakeSkaterGosub add_skater_to_world skater = 1
            DoScreenElementMorph {id = player2_panel_container alpha = 1}
            
            MakeSkaterGosub remove_skater_from_world skater = 0
            DoScreenElementMorph {id = player1_panel_container alpha = 0}
            
            
            skater ::disableplayerinput
            skater ::PausePhysics
            skater2 ::enableplayerinput
            skater2 ::UnPausePhysics
        endif
    endif
    SetActiveCamera id = skatercam0 viewport = 0
    SetActiveCamera id = skatercam1 viewport = 1
endscript


script horse_end_run 
    kill_start_key_binding
    
    EndHorseRun
    EndGoal_Horse_Mp
    WaitForPanelDone
    
    exit_pause_menu
    kill_start_key_binding
    pausegame
    play_appropriate_horse_sound
    if HorseEnded
        
        print_horse_string { whichString = youarea TopFinal }
        print_horse_string { whichString = finalword BottomFinal }
        wait 120 gameframes
        if ObjectExists id = horse_score_menu
            DestroyScreenElement id = horse_score_menu
        endif
    else
        print_horse_string { whichString = playername top }
        print_horse_string { whichString = horsepostrun bottom }
    endif
    WaitForPanelDone
    SwitchHorsePlayers
    
    wait 1 gameframe
    
    if HorseEnded
        restore_start_key_binding
        create_end_run_menu
    else
        horse_check_for_controller_unplugged_dialog
        UnPauseGame
    endif
endscript


script horse_uninit 
endscript


script kill_horse_panel_messages 
    if ObjectExists id = top
        DestroyScreenElement id = top
    endif
    if ObjectExists id = bottom
        DestroyScreenElement id = bottom
    endif
    if ObjectExists id = TopFinal
        DestroyScreenElement id = TopFinal
    endif
    if ObjectExists id = BottomFinal
        DestroyScreenElement id = BottomFinal
    endif
endscript


script horse_check_for_controller_unplugged_dialog 
    begin 
    if NOT ScreenElementExists id = controller_unplugged_dialog_anchor
        root_window ::gettags
        if GotParam menu_state
            if (<menu_state> = Off)
                break 
            endif
        else
            break 
        endif
    endif
    wait 1 gameframe
    repeat 
endscript


script create_horse_panel_message 
    
    
    Theme_GetHighlightedTextColor return_value = text_rgba
    chaos1 = Random (@ 1 @ 2)
    chaos2 = Random (@ 3 @ 4)
    switch <id>
        case top
        message_pos = (320.0, 150.0)
        message_color = <text_rgba>
        <style> = play_horse_animation
        case bottom
        message_pos = (320.0, 180.0)
        message_color = [ 108 112 120 128 ]
        <style> = play_horse_animation2
        case TopFinal
        message_pos = (320.0, 150.0)
        message_color = <text_rgba>
        <style> = play_horse_animation_final_1
        case BottomFinal
        message_pos = (320.0, 180.0)
        message_color = <text_rgba>
        <style> = play_horse_animation_final_2
        default 
    endswitch
    create_panel_block <...> style = <style> parent = root_window Pos = <message_pos> rgba = <message_color> dims = (450.0, 0.0) z_priority = 10
endscript


script play_horse_animation 
    switch <chaos1>
        case 1
        DoMorph time = 0 Scale = 0 alpha = 0 Pos = (320.0, 0.0)
        DoMorph time = 0.3000 Scale = 1.200 alpha = 1 Pos = (320.0, 130.0)
        DoMorph time = 0.1000 Pos = (321.0, 133.0)
        DoMorph time = 0.1000 Pos = (319.0, 129.0)
        DoMorph time = 0.1000 Pos = (322.0, 131.0)
        DoMorph time = 0.1000 Pos = (318.0, 127.0)
        DoMorph time = 0.1000 Pos = (321.0, 131.0)
        DoMorph time = 0.1000 Pos = (317.0, 129.0)
        DoMorph time = 0.1000 Pos = (323.0, 130.0)
        DoMorph time = 0.1000 Pos = (319.0, 129.0)
        DoMorph time = 0.1000 Pos = (319.0, 129.0)
        DoMorph time = 0.1000 Pos = (322.0, 131.0)
        DoMorph time = 0.1000 Pos = (318.0, 127.0)
        DoMorph time = 0.1000 Pos = (321.0, 131.0)
        DoMorph time = 0.1000 Pos = (317.0, 129.0)
        DoMorph time = 0.1000 Pos = (323.0, 130.0)
        DoMorph time = 0.1000 Pos = (319.0, 129.0)
        DoMorph time = 0.1500 Scale = 0 alpha = 0
        Die
        case 2
        DoMorph time = 0 Scale = 0 alpha = 0 Pos = (320.0, 500.0)
        DoMorph time = 0.2000
        DoMorph time = 0.3000 Scale = 1.200 alpha = 1 Pos = (320.0, 130.0)
        DoMorph time = 0.1000 Pos = (321.0, 133.0)
        DoMorph time = 0.1000 Pos = (319.0, 129.0)
        DoMorph time = 0.1000 Pos = (322.0, 131.0)
        DoMorph time = 0.1000 Pos = (318.0, 127.0)
        DoMorph time = 0.1000 Pos = (321.0, 131.0)
        DoMorph time = 0.1000 Pos = (317.0, 129.0)
        DoMorph time = 0.1000 Pos = (323.0, 130.0)
        DoMorph time = 0.1000 Pos = (319.0, 129.0)
        DoMorph time = 0.1000 Pos = (319.0, 129.0)
        DoMorph time = 0.1000 Pos = (322.0, 131.0)
        DoMorph time = 0.1000 Pos = (318.0, 127.0)
        DoMorph time = 0.1000 Pos = (321.0, 131.0)
        DoMorph time = 0.1000 Pos = (317.0, 129.0)
        DoMorph time = 0.1000 Pos = (323.0, 130.0)
        DoMorph time = 0.1000 Pos = (319.0, 129.0)
        DoMorph time = 0.1500 Scale = 4 alpha = 0
        Die
    endswitch
endscript


script play_horse_animation2 
    switch <chaos2>
        case 3
        DoMorph time = 0 Scale = 0 alpha = 0 Pos = (0.0, 150.0)
        DoMorph time = 0.3000
        DoMorph time = 0.1000 Scale = 1 alpha = 1 Pos = (320.0, 150.0)
        DoMorph time = 0.1000 Pos = (321.0, 153.0)
        DoMorph time = 0.1000 Pos = (319.0, 149.0)
        DoMorph time = 0.1000 Pos = (322.0, 151.0)
        DoMorph time = 0.1000 Pos = (318.0, 147.0)
        DoMorph time = 0.1000 Pos = (321.0, 151.0)
        DoMorph time = 0.1000 Pos = (317.0, 149.0)
        DoMorph time = 0.1000 Pos = (323.0, 150.0)
        DoMorph time = 0.1000 Pos = (319.0, 149.0)
        DoMorph time = 0.1000 Pos = (321.0, 153.0)
        DoMorph time = 0.1000 Pos = (319.0, 149.0)
        DoMorph time = 0.1000 Pos = (322.0, 151.0)
        DoMorph time = 0.1000 Pos = (318.0, 147.0)
        DoMorph time = 0.1000 Pos = (321.0, 151.0)
        DoMorph time = 0.1000 Pos = (317.0, 149.0)
        DoMorph time = 0.1000 Pos = (323.0, 150.0)
        DoMorph time = 0.1000 Pos = (319.0, 149.0)
        DoMorph time = 0.1500 Pos = (640.0, 150.0) alpha = 0
        Die
        case 4
        DoMorph time = 0 Scale = 0 alpha = 0 Pos = (700.0, 150.0)
        DoMorph time = 0.3000
        DoMorph time = 0.1000 Scale = 1 alpha = 1 Pos = (320.0, 150.0)
        DoMorph time = 0.1000 Pos = (321.0, 153.0)
        DoMorph time = 0.1000 Pos = (319.0, 149.0)
        DoMorph time = 0.1000 Pos = (322.0, 151.0)
        DoMorph time = 0.1000 Pos = (318.0, 147.0)
        DoMorph time = 0.1000 Pos = (321.0, 151.0)
        DoMorph time = 0.1000 Pos = (317.0, 149.0)
        DoMorph time = 0.1000 Pos = (323.0, 150.0)
        DoMorph time = 0.1000 Pos = (319.0, 149.0)
        DoMorph time = 0.1000 Pos = (321.0, 153.0)
        DoMorph time = 0.1000 Pos = (319.0, 149.0)
        DoMorph time = 0.1000 Pos = (322.0, 151.0)
        DoMorph time = 0.1000 Pos = (318.0, 147.0)
        DoMorph time = 0.1000 Pos = (321.0, 151.0)
        DoMorph time = 0.1000 Pos = (317.0, 149.0)
        DoMorph time = 0.1000 Pos = (323.0, 150.0)
        DoMorph time = 0.1000 Pos = (319.0, 149.0)
        DoMorph time = 0.1500 Scale = 4 alpha = 0
        Die
    endswitch
endscript


script play_horse_animation_final_1 
    DoMorph time = 0 Scale = 0 alpha = 0 Pos = (320.0, 130.0)
    DoMorph time = 0.3000 Scale = 1.200 alpha = 1 Pos = (320.0, 130.0)
    DoMorph time = 0.1000 Pos = (321.0, 133.0)
    DoMorph time = 0.1000 Pos = (319.0, 129.0)
    DoMorph time = 0.1000 Pos = (322.0, 131.0)
    DoMorph time = 0.1000 Pos = (318.0, 127.0)
    DoMorph time = 0.1000 Pos = (321.0, 131.0)
    DoMorph time = 0.1000 Pos = (317.0, 129.0)
    DoMorph time = 0.1000 Pos = (323.0, 130.0)
    DoMorph time = 0.1000 Pos = (319.0, 129.0)
    DoMorph time = 0.1000 Pos = (322.0, 131.0)
    DoMorph time = 0.1000 Pos = (318.0, 127.0)
    DoMorph time = 0.1000 Pos = (321.0, 131.0)
    DoMorph time = 0.1000 Pos = (317.0, 129.0)
    DoMorph time = 0.1000 Pos = (323.0, 130.0)
    DoMorph time = 0.1000 Pos = (319.0, 129.0)
    DoMorph time = 0.2000 Scale = 0 alpha = 0 Pos = (319.0, 500.0)
    Die
endscript


script play_horse_animation_final_2 
    DoMorph time = 0 Scale = 0 alpha = 0 Pos = (320.0, 170.0)
    DoMorph time = 0.2000 Scale = 1.900 alpha = 1 Pos = (320.0, 150.0)
    DoMorph time = 0.2200 Scale = 1.200
    DoMorph time = 0.2300 Scale = 1.500
    DoMorph time = 0.3200 Scale = 1.300
    DoMorph time = 0.1000 Pos = (321.0, 153.0)
    DoMorph time = 0.1000 Pos = (319.0, 149.0)
    DoMorph time = 0.1000 Pos = (322.0, 151.0)
    DoMorph time = 0.1000 Pos = (318.0, 147.0)
    DoMorph time = 0.1000 Pos = (321.0, 151.0)
    DoMorph time = 0.1000 Pos = (317.0, 149.0)
    DoMorph time = 0.1000 Pos = (323.0, 150.0)
    DoMorph time = 0.1000 Pos = (319.0, 149.0)
    DoMorph time = 0.1000 Pos = (322.0, 151.0)
    DoMorph time = 0.1000 Pos = (318.0, 147.0)
    setprops blur_effect
    do_blur_effect
    setprops no_blur_effect
    DoMorph time = 0.4000 Scale = 6 alpha = 0 Pos = (320.0, 150.0)
    Die
endscript

