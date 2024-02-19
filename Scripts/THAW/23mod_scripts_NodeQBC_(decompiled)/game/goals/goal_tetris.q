goal_tetris_faded_trick_alpha = 0.4000
goal_tetris_unfaded_trick_alpha = 1.0
goal_tetris_genericParams = {
    goal_text = 'Triki'
    view_goals_text = 'Triki'
    time = 120
    init = goal_tetris_init
    uninit = goal_uninit
    activate = goal_tetris_activate
    success = goal_tetris_success
    fail = goal_tetris_fail
    deactivate = goal_tetris_deactivate
    expire = goal_tetris_expire
    trigger_obj_id = 'TRG_G_TETRIS_Pro'
    start_pad_id = 'G_TETRIS_StartPad'
    restart_node = 'TRG_G_TETRIS_RestartNode'
    trick_time = 3000
    max_tricks = 15
    acceleration_interval = 5
    acceleration_percent = 0.1000
    time_to_stop_adding_tricks = 5
    tetris
    goal_type_checksum = tetris
    record_type = Score
}

script AddGoal_Tetris 
    if GotParam version
        FormatText textname = goal_type 'TEtris%v' v = <version>
        if NOT GotParam trigger_obj_id
            FormatText checksumname = trigger_obj_id '%z_TRG_G_TETRIS%v_Pro' z = <zone> v = <version>
        endif
        if NOT GotParam restart_node
            FormatText checksumname = restart_node '%z_TRG_G_TETRIS%v_RestartNode' z = <zone> v = <version>
        endif
    else
        <goal_type> = 'TEtris'
        if NOT GotParam trigger_obj_id
            FormatText checksumname = trigger_obj_id '%z_TRG_G_TETRIS_Pro' z = <zone>
        endif
        if NOT GotParam restart_node
            FormatText checksumname = restart_node '%z_TRG_G_TETRIS_RestartNode' z = <zone>
        endif
    endif
    if GotParam classic_mode_goal
        <classic_mode_goal> = classic_mode_goal
    endif
    GoalManager_CreateGoalName goal_type = <goal_type> zone = <zone> classic_mode_goal = <classic_mode_goal>
    GoalManager_AddGoal name = <goal_id> {
        params = {
            goal_text = 'Triki'
            view_goals_text = 'Triki'
            time = 120
            trick_time = 3000
            max_tricks = 15
            acceleration_interval = 5
            acceleration_percent = 0.1000
            time_to_stop_adding_tricks = 5
            record_type = Score
            init = goal_tetris_init
            uninit = goal_uninit
            activate = goal_tetris_activate
            success = goal_tetris_success
            fail = goal_tetris_fail
            deactivate = goal_tetris_deactivate
            expire = goal_tetris_expire
            <...> 
            tetris
            goal_type_checksum = tetris
        }
    }
endscript

script goal_tetris_init 
    goal_init goal_id = <goal_id>
endscript

script goal_tetris_activate 
    if NOT GotParam \{ quick_start }
        GoalManager_EditGoal name = <goal_id> params = { wait_to_add_tricks = 1 }
        SpawnScriptLater goal_tetris_wait_and_add_tricks params = <...> 
    endif
    goal_start goal_id = <goal_id>
    if GotParam \{ single_combo }
        SetScoreAccumulation \{ 0 }
    endif
    create_tetris_menu
endscript

script goal_tetris_wait_and_add_tricks 
    Block \{ type = goal_cam_anim_post_start_done }
    if NOT GoalManager_GoalIsActive name = <goal_id>
        return 
    endif
    GoalManager_EditGoal name = <goal_id> params = { wait_to_add_tricks = 0 }
endscript

script goal_tetris_success 
    goal_success goal_id = <goal_id>
endscript

script goal_tetris_fail 
    goal_fail goal_id = <goal_id>
endscript

script goal_tetris_deactivate 
    goal_deactivate goal_id = <goal_id>
    GoalManager_ResetGoalTrigger name = <goal_id>
    if ObjectExists \{ id = tetris_menu_anchor }
        RunScriptOnScreenElement \{id = tetris_menu_anchor menu_offscreen params = { menu_id = tetris_menu_anchor }}
    endif
endscript

script goal_tetris_expire 
    goal_expire goal_id = <goal_id>
    GoalManager_LoseGoal name = <goal_id>
endscript

script create_tetris_menu 
    SetScreenElementLock id = root_window Off
    CreateScreenElement {
        type = ContainerElement
        parent = root_window
        id = tetris_menu_anchor
        font = small
        Pos = (320.0, 218.0)
        just = [ center center ]
        Scale = 1
        dims = (640.0, 480.0)
    }
    CreateScreenElement {
        type = vmenu
        parent = tetris_menu_anchor
        id = tetris_tricks_menu
        font = small
        padding_scale = 0.9500
        just = [ RIGHT bottom ]
        Pos = (615.0, 370.0)
        internal_just = [ RIGHT center ]
        Scale = 1
    }
endscript

script goal_tetris_remove_trick 
    gettags
    DoMorph \{ time = 0 Scale = 0.7000 }
    SetScreenElementProps {
        id = {<id> child = 0}
        rgba = [ 144 32 32 85 ]
    }
    if NOT GotParam \{ tricktris }
        DoMorph \{ Scale = 0 time = 0.5000 Scale = 0 }
    endif
    Die
endscript

script goal_tetris_add_trick 
    gettags
    goal_tetris_move_button_text <...> 
    DoMorph \{ time = 0 Scale = 0 }
    SetScreenElementProps {
        id = {<id> child = 0}
        rgba = [ 127 102 0 75 ]
    }
    DoMorph \{ time = 0.3000 Scale = 0.8000 }
    DoMorph \{ time = 0.2000 Scale = 0.6000 }
    DoMorph \{ time = 0.1000 Scale = 0.7000 }
    setprops \{rgba = [ 128 128 128 75 ]}
endscript

script goal_tetris_add_red_trick 
    gettags
    goal_tetris_move_button_text <...> 
    DoMorph \{ time = 0 Scale = 0 }
    SetScreenElementProps {
        id = {<id> child = 0}
        rgba = [ 144 32 32 75 ]
    }
    DoMorph \{ time = 0.3000 Scale = 0.8000 }
    DoMorph \{ time = 0.2000 Scale = 0.6000 }
    DoMorph \{ time = 0.1000 Scale = 0.7000 }
endscript

script goal_tetris_move_button_text 
    gettags
    SetScreenElementProps {
        id = {<id> child = 0}
        just = [ RIGHT top ]
    }
    SetScreenElementProps {
        id = {<id> child = 0}
        Pos = (100.0, 0.0)
    }
    if NOT GotParam no_key_combo
        GetScreenElementPosition id = {<id> child = 0}
        SetScreenElementProps {
            id = {<id> child = 1}
            just = [ RIGHT top ]
        }
        SetScreenElementProps {
            id = {<id> child = 1}
            Pos = (<screenelementpos> - (10.0, 0.0))
        }
    endif
endscript

script goal_tetris_turn_trick_red 
    gettags
    SetScreenElementProps {
        id = {<id> child = 0}
        rgba = [ 144 32 32 85 ]
    }
endscript

script goal_tetris_turn_trick_white 
    gettags
    SetScreenElementProps {
        id = {<id> child = 0}
        rgba = [ 127 102 0 75 ]
    }
endscript

script goal_tetris_reset_trick_container 
    TerminateObjectsScripts id = <id>
    SetScreenElementProps {
        id = {<id> child = 0}
        rgba = [ 127 102 0 75 ]
    }
    DoScreenElementMorph {
        id = <id>
        Scale = 0.7000
    }
endscript

script goal_tetris_play_trick_removed_sound 
    wait \{ 0.1000 seconds }
endscript
goal_tetris_trick_text = {
    Air_CircleD = '\b4 + \b2'
    Air_CircleDL = '\bc + \b2'
    Air_CircleDR = '\ba + \b2'
    Air_CircleL = '\b6 + \b2'
    Air_CircleR = '\b5 + \b2'
    Air_CircleU = '\b7 + \b2'
    Air_CircleUL = '\bb + \b2'
    Air_CircleUR = '\bd + \b2'
    Air_D_D_Circle = '\b4 \b4 + \b2'
    Air_D_D_Square = '\b4 \b4 + \b1'
    Air_L_L_Circle = '\b6 \b6 + \b2'
    Air_L_L_Square = '\b6 \b6 + \b1'
    Air_R_R_Circle = '\b5 \b5 + \b2'
    Air_R_R_Square = '\b5 \b5 + \b1'
    Air_SquareD = '\b4 + \b1'
    Air_SquareDL = '\bc + \b1'
    Air_SquareDR = '\ba + \b1'
    Air_SquareL = '\b6 + \b1'
    Air_SquareR = '\b5 + \b1'
    Air_SquareU = '\b7 + \b1'
    Air_SquareUL = '\bb + \b1'
    Air_SquareUR = '\bd + \b1'
    Air_U_U_Circle = '\b7 \b7 + \b2'
    Air_U_U_Square = '\b7 \b7 + \b1'
    Lip_TriangleD = '\b4 + \b0'
    Lip_TriangleDL = '\bc + \b0'
    Lip_TriangleDR = '\ba + \b0'
    Lip_TriangleL = '\b6 + \b0'
    Lip_TriangleR = '\b5 + \b0'
    Lip_TriangleU = '\b7 + \b0'
    Lip_TriangleUL = '\bb + \b0'
    Lip_TriangleUR = '\bd + \b0'
    SpAir_D_L_Circle = '\b4 \b6 + \b2'
    SpAir_D_L_Square = '\b4 \b6 + \b1'
    SpAir_D_R_Circle = '\b4 \b5 + \b2'
    SpAir_D_R_Square = '\b4 \b5 + \b1'
    SpAir_D_U_Circle = '\b4 \b7 + \b2'
    SpAir_D_U_Square = '\b4 \b7 + \b1'
    SpAir_L_D_Circle = '\b6 \b4 + \b2'
    SpAir_L_D_Square = '\b6 \b4 + \b1'
    SpAir_L_R_Circle = '\b6 \b5 + \b2'
    SpAir_L_R_Square = '\b6 \b5 + \b1'
    SpAir_L_U_Circle = '\b6 \b7 + \b2'
    SpAir_L_U_Square = '\b6 \b7 + \b1'
    SpAir_R_D_Circle = '\b5 \b4 + \b2'
    SpAir_R_D_Square = '\b5 \b4 + \b1'
    SpAir_R_L_Circle = '\b5 \b6 + \b2'
    SpAir_R_L_Square = '\b5 \b6 + \b1'
    SpAir_R_U_Circle = '\b5 \b7 + \b2'
    SpAir_R_U_Square = '\b5 \b7 + \b1'
    SpAir_U_D_Circle = '\b7 \b4 + \b2'
    SpAir_U_D_Square = '\b7 \b4 + \b1'
    SpAir_U_L_Circle = '\b7 \b6 + \b2'
    SpAir_U_L_Square = '\b7 \b6 + \b1'
    SpAir_U_R_Circle = '\b7 \b5 + \b2'
    SpAir_U_R_Square = '\b7 \b5 + \b1'
    SpGrind_D_L_Triangle = '\b4 \b6 + \b0'
    SpGrind_D_R_Triangle = '\b4 \b5 + \b0'
    SpGrind_D_U_Triangle = '\b4 \b7 + \b0'
    SpGrind_L_D_Triangle = '\b6 \b4 + \b0'
    SpGrind_L_R_Triangle = '\b6 \b5 + \b0'
    SpGrind_L_U_Triangle = '\b6 \b7 + \b0'
    SpGrind_R_D_Triangle = '\b5 \b4 + \b0'
    SpGrind_R_L_Triangle = '\b5 \b6 + \b0'
    SpGrind_R_U_Triangle = '\b5 \b7 + \b0'
    SpGrind_U_D_Triangle = '\b7 \b4 + \b0'
    SpGrind_U_L_Triangle = '\b7 \b6 + \b0'
    SpGrind_U_R_Triangle = '\b7 \b5 + \b0'
    SpLip_D_L_Triangle = '\b4 \b6 + \b0'
    SpLip_D_R_Triangle = '\b4 \b5 + \b0'
    SpLip_D_U_Triangle = '\b4 \b7 + \b0'
    SpLip_L_D_Triangle = '\b6 \b4 + \b0'
    SpLip_L_R_Triangle = '\b6 \b5 + \b0'
    SpLip_L_U_Triangle = '\b6 \b7 + \b0'
    SpLip_R_D_Triangle = '\b5 \b4 + \b0'
    SpLip_R_L_Triangle = '\b5 \b6 + \b0'
    SpLip_R_U_Triangle = '\b5 \b7 + \b0'
    SpLip_U_D_Triangle = '\b7 \b4 + \b0'
    SpLip_U_L_Triangle = '\b7 \b6 + \b0'
    SpLip_U_R_Triangle = '\b7 \b5 + \b0'
    SpLip_U_U_Triangle = '\b7 \b7 + \b0'
    SpMan_D_L_Triangle = '\b4 \b6 + \b0'
    SpMan_D_R_Triangle = '\b4 \b5 + \b0'
    SpMan_D_U_Triangle = '\b4 \b7 + \b0'
    SpMan_L_D_Triangle = '\b6 \b4 + \b0'
    SpMan_L_R_Triangle = '\b6 \b5 + \b0'
    SpMan_L_U_Triangle = '\b6 \b7 + \b0'
    SpMan_R_D_Triangle = '\b5 \b4 + \b0'
    SpMan_R_L_Triangle = '\b5 \b6 + \b0'
    SpMan_R_U_Triangle = '\b5 \b7 + \b0'
    SpMan_U_D_Triangle = '\b7 \b4 + \b0'
    SpMan_U_L_Triangle = '\b7 \b6 + \b0'
    SpMan_U_R_Triangle = '\b7 \b5 + \b0'
    Extra_SquareSquareL = '\b6 + \b1 + \b1'
}
goal_tetris_trick_text_double_tap = {
    Air_CircleD = '\b4 + \b2 + \b2'
    Air_CircleDL = '\bc + \b2 + \b2'
    Air_CircleDR = '\ba + \b2 + \b2'
    Air_CircleL = '\b6 + \b2 + \b2'
    Air_CircleR = '\b5 + \b2 + \b2'
    Air_CircleU = '\b7 + \b2 + \b2'
    Air_CircleUL = '\bb + \b2 + \b2'
    Air_CircleUR = '\bd + \b2 + \b2'
    Air_SquareD = '\b4 + \b1 + \b1'
    Air_SquareDL = '\bc + \b1 + \b1'
    Air_SquareDR = '\ba + \b1 + \b1'
    Air_SquareL = '\b6 + \b1 + \b1'
    Air_SquareR = '\b5 + \b1 + \b1'
    Air_SquareU = '\b7 + \b1 + \b1'
    Air_SquareUL = '\bb + \b1 + \b1'
    Air_SquareUR = '\bd + \b1 + \b1'
}
goal_tetris_trick_text_tripple_tap = {
    Air_CircleD = '\b4 + \b2 + \b2 + \b2'
    Air_CircleDL = '\bc + \b2 + \b2 + \b2'
    Air_CircleDR = '\ba + \b2 + \b2 + \b2'
    Air_CircleL = '\b6 + \b2 + \b2 + \b2'
    Air_CircleR = '\b5 + \b2 + \b2 + \b2'
    Air_CircleU = '\b7 + \b2 + \b2 + \b2'
    Air_CircleUL = '\bb + \b2 + \b2 + \b2'
    Air_CircleUR = '\bd + \b2 + \b2 + \b2'
    Air_SquareD = '\b4 + \b1 + \b1 + \b1'
    Air_SquareDL = '\bc + \b1 + \b1 + \b1'
    Air_SquareDR = '\ba + \b1 + \b1 + \b1'
    Air_SquareL = '\b6 + \b1 + \b1 + \b1'
    Air_SquareR = '\b5 + \b1 + \b1 + \b1'
    Air_SquareU = '\b7 + \b1 + \b1 + \b1'
    Air_SquareUL = '\bb + \b1 + \b1 + \b1'
    Air_SquareUR = '\bd + \b1 + \b1 + \b1'
}
