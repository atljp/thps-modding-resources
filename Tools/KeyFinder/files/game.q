

script PauseMusicAndStreams 
    PauseMusic 1
    PauseStream 1
endscript


script UnpauseMusicAndStreams 
    PauseMusic 0
    PauseStream 0
endscript


script do_backend_retry 
    if NOT IsObserving
        skater ::KillSpecial
    endif
    GoalManager_UninitializeAllGoals
    if InNetGame
        if NOT IsObserving
            ExitSurveyorMode
            skater ::add_skater_to_world
        endif
        ResetProSetFlags
        if NOT IsObserving
            skater ::runstarted
        endif
        ClearPowerups
    endif
    SpawnScript do_screen_freeze
endscript


script do_screen_freeze 
    kill_net_panel_messages
    pausegame
    if InNetGame
        exit_pause_menu menu_id = Pause_Menu
        force_close_rankings
        destroy_onscreen_keyboard
        StartNetworkLobby
    else
        exit_pause_menu menu_id = Pause_Menu
        force_close_rankings
        SetGameType freeskate2p
        SetCurrentGameType
    endif
    wait 2 gameframe
    UnPauseGame
    retry
endscript


script entered_chat_message 
    GetTextElementString id = keyboard_current_string
    SendChatMessage string = <string>
    destroy_onscreen_keyboard
endscript


script menu_entered_chat_message 
    entered_chat_message
    create_pause_menu
endscript


script cancel_chat_menu 
    destroy_onscreen_keyboard
    create_pause_menu
endscript


script launch_chat_keyboard 
    hide_current_goal
    DestroyScreenElement id = current_menu_anchor
    create_onscreen_keyboard allow_cancel icon = <icon> keyboard_cancel_script = cancel_chat_menu keyboard_done_script = menu_entered_chat_message keyboard_title = 'ENTER MESSAGE' min_length = 0 max_length = 127 text = ''
endscript


script enter_kb_chat 
    create_onscreen_keyboard allow_cancel no_buttons Pos = (320.0, 260.0) keyboard_done_script = entered_chat_message display_text = 'ENTER MESSAGE: ' keyboard_title = 'ENTER MESSAGE' min_length = 1 max_length = 127 display_text_scale = 0.5000
endscript


script prerunqueuedscripts 
    setslomo 100.0
endscript


script postrunqueuedscripts 
    setslomo 1
endscript

