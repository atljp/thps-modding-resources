
controller_unplugged_frame_count = 45

script controller_unplugged 
    GetSkaterId
    if NOT LevelIs load_mainmenu
        if NOT ScreenElementExists id = view_goals_root
            if NOT SkaterCamAnimFinished skater = <ObjID>
                return 
            endif
        endif
    endif
    if GotParam leaving_net_game
        pausegame
        PauseMusicAndStreams
    endif
    KillSpawnedScript name = wait_and_check_for_unplugged_controllers
    change check_for_unplugged_controllers = 0
    SpawnScript create_controller_unplugged_dialog params = <...> 
endscript


script create_controller_unplugged_dialog pad_choose_script = controller_refresh
    <front_end_paused> = 0
    if GameIsPaused
        <front_end_paused> = 1
    endif
    if NOT GotParam leaving_net_game
        if LevelIs load_mainmenu
            GoalManager_DeactivateAllGoals
            GoalManager_UninitializeAllGoals
            pausegame
            PauseMusicAndStreams 1
        else
            GoalManager_PauseAllGoals
            pausegame
            PauseMusicAndStreams 1
        endif
    endif
    wait 1 frame
    SetScreenElementLock id = root_window Off
    CreateScreenElement {
        type = ContainerElement
        parent = root_window
        id = controller_unplugged_dialog_anchor
        Pos = (320.0, 240.0)
        dims = (640.0, 480.0)
        priority = 10000
        z_priority = 10000
        event_handlers = [
            {pad_choose <pad_choose_script> params = {front_end_paused = <front_end_paused> original_device_num = <device_num>}}
            {pad_start <pad_choose_script> params = {front_end_paused = <front_end_paused> original_device_num = <device_num>}}
        ]
    }
    <anchor_id> = <id>
    CreateScreenElement {
        type = SpriteElement
        parent = <anchor_id>
        texture = white2
        Pos = (320.0, 240.0)
        just = [ center center ]
        rgba = [ 40 40 90 128 ]
        Scale = (40.0, 15.0)
        z_priority = 9999
    }
    if GotParam leaving_net_game
        FormatText textname = text 'Controller disconnected. Please reconnect the controller to port %i and press \b8 to return to the main menu.' i = (<device_num> + 1)
        root_window ::settags leaving_net_game
    else
        if IsNGC
            FormatText textname = text 'Please reconnect the controller to Controller Socket %i and press \b8 to continue.' i = (<device_num> + 1)
        else
            if IsPs2
                FormatText textname = text 'Please insert a controller into controller port %i and press \b8 to continue.' i = (<device_num> + 1)
            else
                FormatText textname = text 'Please reconnect the controller to port %i and press \b8 to continue.' i = (<device_num> + 1)
            endif
        endif
    endif
    <text_block_pos> = (320.0, 200.0)
    CreateScreenElement {
        type = TextBlockElement
        parent = <anchor_id>
        Pos = <text_block_pos>
        dims = (300.0, 0.0)
        allow_expansion
        just = [ center center ]
        font = small
        text = <text>
        z_priority = 10000
    }
    GetScreenElementDims id = <id>
    <button_pos> = (<text_block_pos> + (<height> * (0.0, 1.0)))
    CreateScreenElement {
        parent = <anchor_id>
        type = TextElement
        font = small
        text = 'OK'
        Pos = <button_pos>
        just = [ center top ]
        rgba = [ 128 128 128 128 ]
        z_priority = 10000
        event_handlers = [
            { focus do_scale_up }
            { unfocus do_scale_down }
        ]
    }
    FireEvent type = focus target = <id>
    FireEvent type = focus target = <anchor_id>
endscript


script controller_refresh 
    if (<original_device_num> = <device_num>)
        controller_reconnected <...> 
        if CustomParkMode editing
            if NOT IsTrue in_create_a_goal
                if NOT ScreenElementExists id = dialog_box_anchor
                    if NOT ScreenElementExists id = files_menu
                        if NOT ScreenElementExists id = keyboard_anchor
                            if NOT ObjectExists id = park_resize_cam
                                parked_continue_editing
                                ResetAbortAndDoneScripts
                            endif
                        endif
                    endif
                endif
            endif
        else
            if NOT (AbortScript = DefaultAbortScript)
                goto reload_anims_then_run_abort_script
            endif
        endif
    endif
endscript


script controller_reconnected 
    if NOT GotParam leaving_net_game
        if NOT LevelIs load_mainmenu
            if NOT ScreenElementExists id = view_goals_root
                if NOT IsTrue in_create_a_goal
                    if NOT CustomParkMode editing
                        if NOT ScreenElementExists id = timeline_vmenu
                            restore_skater_camera
                        endif
                    endif
                endif
            endif
        endif
    endif
    if NOT GotParam leaving_net_game
        if ScreenElementExists id = pre_cat_menu_is_up
            UnPauseGame
            if LevelIs load_nj
                skater ::obj_movetonode name = TRG_G_CAT_RestartNode orient NoReset
            endif
            pausegame
            create_pre_cat_menu
        else
            if IsTrue in_create_a_goal
                if IsTrue goal_editor_placement_mode
                    Debounce x time = 0.2000 Clear = 1
                    GoalEditor ::UnPause
                    if ObjectExists id = GoalEditorCursor
                        GoalEditorCursor ::UnPause
                    endif
                endif
            else
                root_window ::gettags
                if (<front_end_paused> = 0)
                    UnPauseGame
                    UnpauseMusicAndStreams
                endif
                if NOT LevelIs load_mainmenu
                    if NOT CustomParkMode editing
                        if (<menu_state> = Off)
                            FireEvent {
                                type = pad_start
                                target = root_window
                                Data = { device_num = <device_num> }
                            }
                        endif
                    endif
                endif
            endif
        endif
    endif
    if ScreenElementExists id = controller_unplugged_dialog_anchor
        DestroyScreenElement id = controller_unplugged_dialog_anchor
    endif
    if GotParam leaving_net_game
        
        UnPauseGame
        quit_network_game
    else
        SpawnScript wait_and_check_for_unplugged_controllers
    endif
endscript


script wait_and_check_for_unplugged_controllers time = 50
    wait <time>
    change check_for_unplugged_controllers = 1
endscript

