Goal_TrickBeat_GenericParams = {
    goal_text = 'Wykonuj triki do rytmu!'
    view_goals_text = 'Ogólny tekst o triku do rytmu'
    time = 120
    init = goal_trick_beat_init
    uninit = goal_uninit
    activate = goal_trick_beat_activate
    deactivate = goal_trick_beat_deactivate
    expire = goal_trick_beat_expire
    fail = goal_trick_beat_fail
    success = goal_trick_beat_success
    restart_node = TRG_G_TRICKBEAT_RestartNode
    trigger_obj_id = TRG_G_TRICKBEAT_Pro
    record_type = Score
    TrickBeat
    goal_type_checksum = TrickBeat
}
goal_trick_beat_faded_trick_alpha = 0.4000
goal_trick_beat_unfaded_trick_alpha = 1.0

script goal_trick_beat_init 
    goal_init <...> 
endscript

script goal_trick_beat_activate 
    if NOT GotParam \{ quick_start }
        GoalManager_EditGoal name = <goal_id> params = { wait_to_add_tricks = 1 }
        SpawnScriptLater goal_trick_beat_wait_and_add_tricks params = <...> 
    endif
    if GotParam \{ no_cam_anim }
        goal_passive_start goal_id = <goal_id>
        SpawnScriptLater \{ goal_trick_beat_fade_out_music }
    else
        if GotParam \{ quick_start }
            SpawnScriptLater \{ goal_trick_beat_fade_out_music }
        else
            goal_start goal_id = <goal_id>
            SpawnScriptLater \{ goal_trick_beat_wait_and_fade_music }
        endif
    endif
    create_trick_beat_menu
endscript

script goal_trick_beat_wait_and_add_tricks 
    Block \{ untilevent = goal_cam_anim_post_start_done }
    GoalManager_ResetTrickBeatTimer name = <goal_id>
    GoalManager_EditGoal name = <goal_id> params = { wait_to_add_tricks = 0 }
endscript

script goal_trick_beat_deactivate 
    goal_deactivate <...> 
    if ScreenElementExists \{ id = trick_beat_menu_anchor }
        RunScriptOnScreenElement \{id = trick_beat_menu_anchor menu_offscreen params = { menu_id = trick_beat_menu_anchor }}
    endif
    if NOT GotParam \{ quick_start }
        SpawnScriptLater \{ goal_trick_beat_fade_in_music }
    endif
endscript

script goal_trick_beat_expire 
    goal_expire <...> 
    GoalManager_LoseGoal name = <goal_id>
endscript

script goal_trick_beat_fail 
    goal_fail <...> 
endscript

script goal_trick_beat_success 
    goal_success <...> 
endscript

script goal_trick_beat_wait_and_fade_music 
    WaitForEvent \{ type = goal_cam_anim_post_start_done }
    SpawnScriptLater \{ goal_trick_beat_fade_out_music }
endscript

script create_trick_beat_menu 
    SetScreenElementLock id = root_window Off
    CreateScreenElement {
        type = ContainerElement
        parent = root_window
        id = trick_beat_menu_anchor
        font = small
        Pos = (320.0, 218.0)
        just = [ center center ]
        Scale = 1
        dims = (640.0, 480.0)
    }
    CreateScreenElement {
        type = vmenu
        parent = trick_beat_menu_anchor
        id = trick_beat_tricks_menu
        font = small
        padding_scale = 0.9500
        just = [ RIGHT bottom ]
        Pos = (615.0, 370.0)
        internal_just = [ RIGHT center ]
        Scale = 1
    }
    CreateScreenElement {
        type = SpriteElement
        parent = trick_beat_menu_anchor
        local_id = the_stereo
        texture = kyron
        just = [ center center ]
        Pos = (560.0, 410.0)
    }
endscript

script goal_trick_beat_remove_trick 
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

script goal_trick_beat_add_trick 
    gettags
    goal_trick_beat_move_button_text <...> 
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

script goal_trick_beat_move_button_text 
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

script goal_trick_beat_pulse_trick 
    goal_trick_beat_turn_trick_red
    wait <wait_time>
    goal_trick_beat_turn_trick_white
endscript

script goal_trick_beat_turn_trick_red 
    gettags
    SetScreenElementProps {
        id = {<id> child = 0}
        rgba = [ 144 32 32 85 ]
    }
    DoScreenElementMorph \{id = { trick_beat_menu_anchor child = the_stereo }rgba = [ 144 32 32 85 ] Scale = 1.300}
endscript

script goal_trick_beat_turn_trick_white 
    gettags
    SetScreenElementProps {
        id = {<id> child = 0}
        rgba = [ 127 102 0 75 ]
    }
    DoScreenElementMorph \{id = { trick_beat_menu_anchor child = the_stereo }rgba = [ 128 128 128 90 ] Scale = 1}
endscript

script goal_trick_beat_reset_trick_container 
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

script goal_trick_beat_play_trick_removed_sound 
    wait \{ 0.1000 seconds }
endscript

script goal_trick_beat_fade_out_music 
    SpawnScriptLater \{ SK6_Music_Fade_Out }
    wait \{ 1 gameframe }
    change \{ DontAdjustMusicViaProximNode = 1 }
endscript

script goal_trick_beat_fade_in_music 
    change \{ DontAdjustMusicViaProximNode = 0 }
    if NOT ((in_create_a_goal))
        SpawnScriptLater \{ SK6_Music_Fade_In }
    else
        KillSpawnedScript \{ name = SK6_Music_Fade_Out }
        change \{ music_was_paused = 0 }
        SetMusicVolume \{ MusicVolOutsideBox }
    endif
endscript
