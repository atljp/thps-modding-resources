Goal_SkateLetters_genericParams = {
    goal_text = 'Sammle S-K-A-T-E'
    view_goals_text = 'Sammle S-K-A-T-E'
    goal_flags = [
        got_S
        got_K
        got_A
        got_T
        got_E
    ]
    init = SkateLetters_Init
    uninit = goal_uninit
    active = SkateLetters_Active
    activate = SkateLetters_Activate
    deactivate = SkateLetters_Deactivate
    fail = SkateLetters_Fail
    success = SkateLetters_Win
    expire = SkateLetters_Expire
    trigger_obj_id = 'TRG_G_SKATE_Pro'
    restart_node = 'TRG_G_SKATE_RestartNode'
    start_pad_id = 'G_SKATE_StartPad'
    S_obj_id = 'TRG_Goal_Letter_S'
    K_obj_id = 'TRG_Goal_Letter_K'
    A_obj_id = 'TRG_Goal_Letter_A'
    T_obj_id = 'TRG_Goal_Letter_T'
    E_obj_id = 'TRG_Goal_Letter_E'
    time = 120
    record_type = Score
}

script AddGoal_Skate 
    if GotParam version
        FormatText textname = goal_type 'Skate%v' v = <version>
        if NOT GotParam trigger_obj_id
            FormatText checksumname = trigger_obj_id '%z_TRG_G_SKATE%v_Pro' z = <zone> v = <version>
        endif
        if NOT GotParam restart_node
            FormatText checksumname = restart_node '%z_TRG_G_SKATE%v_RestartNode' z = <zone> v = <version>
        endif
        if NOT GotParam start_pad_id
            FormatText checksumname = start_pad_id '%z_G_SKATE%v_StartPad' z = <zone> v = <version>
        endif
        if NOT GotParam S_obj_id
            FormatText checksumname = S_obj_id '%z_TRG_Goal_Letter_S%v' z = <zone> v = <version>
        endif
        if NOT GotParam K_obj_id
            FormatText checksumname = K_obj_id '%z_TRG_Goal_Letter_K%v' z = <zone> v = <version>
        endif
        if NOT GotParam A_obj_id
            FormatText checksumname = A_obj_id '%z_TRG_Goal_Letter_A%v' z = <zone> v = <version>
        endif
        if NOT GotParam T_obj_id
            FormatText checksumname = T_obj_id '%z_TRG_Goal_Letter_T%v' z = <zone> v = <version>
        endif
        if NOT GotParam E_obj_id
            FormatText checksumname = E_obj_id '%z_TRG_Goal_Letter_E%v' z = <zone> v = <version>
        endif
    else
        <goal_type> = 'Skate'
        if NOT GotParam trigger_obj_id
            FormatText checksumname = trigger_obj_id '%z_%s' z = <zone> s = (Goal_SkateLetters_genericParams.trigger_obj_id)
        endif
        if NOT GotParam restart_node
            FormatText checksumname = restart_node '%z_%s' z = <zone> s = (Goal_SkateLetters_genericParams.restart_node)
        endif
        if NOT GotParam start_pad_id
            FormatText checksumname = start_pad_id '%z_%s' z = <zone> s = (Goal_SkateLetters_genericParams.start_pad_id)
        endif
        if NOT GotParam S_obj_id
            FormatText checksumname = S_obj_id '%z_%s' z = <zone> s = (Goal_SkateLetters_genericParams.S_obj_id)
        endif
        if NOT GotParam K_obj_id
            FormatText checksumname = K_obj_id '%z_%s' z = <zone> s = (Goal_SkateLetters_genericParams.K_obj_id)
        endif
        if NOT GotParam A_obj_id
            FormatText checksumname = A_obj_id '%z_%s' z = <zone> s = (Goal_SkateLetters_genericParams.A_obj_id)
        endif
        if NOT GotParam T_obj_id
            FormatText checksumname = T_obj_id '%z_%s' z = <zone> s = (Goal_SkateLetters_genericParams.T_obj_id)
        endif
        if NOT GotParam E_obj_id
            FormatText checksumname = E_obj_id '%z_%s' z = <zone> s = (Goal_SkateLetters_genericParams.E_obj_id)
        endif
    endif
    if GotParam classic_mode_goal
        <classic_mode_goal> = classic_mode_goal
    endif
    GoalManager_CreateGoalName goal_type = <goal_type> zone = <zone> classic_mode_goal = <classic_mode_goal>
    if NOT GotParam goal_text
        <goal_text> = (Goal_SkateLetters_genericParams.goal_text)
    endif
    if NOT GotParam view_goals_text
        <view_goals_text> = (Goal_SkateLetters_genericParams.view_goals_text)
    endif
    if NOT GotParam time
        <time> = (Goal_SkateLetters_genericParams.time)
    endif
    if NOT GotParam record_type
        <record_type> = (Goal_SkateLetters_genericParams.record_type)
    endif
    if NOT GotParam goal_flags
        <goal_flags> = (Goal_SkateLetters_genericParams.goal_flags)
    endif
    GoalManager_AddGoal name = <goal_id> {
        params = {
            init = (Goal_SkateLetters_genericParams.init)
            uninit = (Goal_SkateLetters_genericParams.uninit)
            activate = (Goal_SkateLetters_genericParams.activate)
            active = (Goal_SkateLetters_genericParams.active)
            deactivate = (Goal_SkateLetters_genericParams.deactivate)
            expire = (Goal_SkateLetters_genericParams.expire)
            success = (Goal_SkateLetters_genericParams.success)
            fail = (Goal_SkateLetters_genericParams.fail)
            <...> 
        }
    }
endscript

script SkateLetters_Init 
    goal_init goal_id = <goal_id>
endscript

script SkateLetters_Activate 
    goal_start goal_id = <goal_id>
    create_skate <...> 
endscript

script SkateLetter_InitLetter 
    <id> ::obj_visible
    Obj_ClearExceptions
    obj_roty Speed = 200
    obj_setinnerradius 8
    if GameModeEquals is_coop
        Obj_SetException {
            Ex = anyobjectinradius
            scr = SkateLetter_GotLetter
            params = {id = <id> goal_id = <goal_id> flag = <flag>}
        }
    else
        Obj_SetException {
            Ex = objectinradius
            scr = SkateLetter_GotLetter
            params = {id = <id> goal_id = <goal_id> flag = <flag>}
        }
    endif
endscript

script SkateLetter_GotLetter 
    skater ::obj_spawnscriptlater {
        SkateLetter_GotLetter2
        params = {goal_id = <goal_id> flag = <flag> id = <id>}
    }
endscript

script SkateLetter_GotLetter2 
    if NOT IsInBail
        <id> ::Obj_ClearExceptions
        playsound \{ goaldone vol = 150 }
        Kill name = <id>
        GoalManager_SetGoalFlag name = <goal_id> <flag> 1
        SkateLetter_HUDLetter flag = <flag>
    endif
endscript

script SkateLetters_Fail 
    kill_skate_messages
    goal_fail goal_id = <goal_id>
endscript

script SkateLetters_Deactivate 
    GoalManager_ResetGoalTrigger name = <goal_id>
    goal_deactivate goal_id = <goal_id>
    goal_skate_kill_letters <...> 
    kill_skate_messages
endscript

script SkateLetters_Expire 
    goal_expire goal_id = <goal_id>
    GoalManager_LoseGoal name = <goal_id>
endscript

script SkateLetters_Win 
    goal_success goal_id = <goal_id>
    kill_skate_messages
endscript

script SkateLetter_HUDLetter 
    switch <flag>
        case got_S
        id = skate_letter_s
        Offset = 0
        text = 'S'
        case got_K
        id = skate_letter_k
        Offset = 30
        text = 'K'
        case got_A
        id = skate_letter_a
        Offset = 60
        text = 'A'
        case got_T
        id = skate_letter_t
        Offset = 90
        text = 'T'
        case got_E
        id = skate_letter_e
        Offset = 120
        text = 'E'
        default 
        script_assert 'Unbekannter Buchstabe'
    endswitch
    create_panel_message {
        id = <id>
        text = <text>
        style = goal_skate_panel_message
        Offset = <Offset>
    }
endscript

script goal_skate_hide_letters 
    if ObjectExists id = skate_letter_s
        DoScreenElementMorph id = skate_letter_s time = 0 alpha = 0
    endif
    if ObjectExists id = skate_letter_k
        DoScreenElementMorph id = skate_letter_k time = 0 alpha = 0
    endif
    if ObjectExists id = skate_letter_a
        DoScreenElementMorph id = skate_letter_a time = 0 alpha = 0
    endif
    if ObjectExists id = skate_letter_t
        DoScreenElementMorph id = skate_letter_t time = 0 alpha = 0
    endif
    if ObjectExists id = skate_letter_e
        DoScreenElementMorph id = skate_letter_e time = 0 alpha = 0
    endif
endscript

script goal_skate_unhide_letters 
    if ObjectExists id = skate_letter_s
        DoScreenElementMorph id = skate_letter_s time = 0 alpha = 1
    endif
    if ObjectExists id = skate_letter_k
        DoScreenElementMorph id = skate_letter_k time = 0 alpha = 1
    endif
    if ObjectExists id = skate_letter_a
        DoScreenElementMorph id = skate_letter_a time = 0 alpha = 1
    endif
    if ObjectExists id = skate_letter_t
        DoScreenElementMorph id = skate_letter_t time = 0 alpha = 1
    endif
    if ObjectExists id = skate_letter_e
        DoScreenElementMorph id = skate_letter_e time = 0 alpha = 1
    endif
endscript

script create_skate 
    goal_skate_create_letter goal_id = <goal_id> flag = got_S id = <S_obj_id>
    goal_skate_create_letter goal_id = <goal_id> flag = got_K id = <K_obj_id>
    goal_skate_create_letter goal_id = <goal_id> flag = got_A id = <A_obj_id>
    goal_skate_create_letter goal_id = <goal_id> flag = got_T id = <T_obj_id>
    goal_skate_create_letter goal_id = <goal_id> flag = got_E id = <E_obj_id>
endscript

script goal_skate_create_letter 
    if NOT GoalManager_GoalFlagSet name = <goal_id> flag = <flag>
        Create name = <id>
        RunScriptOnObject id = <id> bounce_skate_letter
        RunScriptOnObject {
            id = <id>
            SkateLetter_InitLetter
            params = {goal_id = <goal_id> flag = <flag> id = <id>}
        }
    endif
endscript

script goal_skate_kill_letters 
    Kill name = <S_obj_id>
    Kill name = <K_obj_id>
    Kill name = <A_obj_id>
    Kill name = <T_obj_id>
    Kill name = <E_obj_id>
endscript

script kill_skate_messages 
    if ObjectExists \{ id = skate_letter_s }
        RunScriptOnScreenElement \{ id = skate_letter_s kill_panel_message }
    endif
    if ObjectExists \{ id = skate_letter_k }
        RunScriptOnScreenElement \{ id = skate_letter_k kill_panel_message }
    endif
    if ObjectExists \{ id = skate_letter_a }
        RunScriptOnScreenElement \{ id = skate_letter_a kill_panel_message }
    endif
    if ObjectExists \{ id = skate_letter_t }
        RunScriptOnScreenElement \{ id = skate_letter_t kill_panel_message }
    endif
    if ObjectExists \{ id = skate_letter_e }
        RunScriptOnScreenElement \{ id = skate_letter_e kill_panel_message }
    endif
endscript

script bounce_skate_letter 
    obj_hover \{ amp = 6 freq = 2 }
endscript

script goal_skate_panel_message Offset = 0
    setprops font = small just = [ center center ] rgba = [ 127 102 0 95 ]
    DoMorph time = 0.08000 Scale = 0.3000 Pos = ((695.0, 150.0) + ((0.0, 1.0) * <Offset>))
    DoMorph time = 0.1200 Scale = 3.500 Pos = ((610.0, 150.0) + ((0.0, 1.0) * <Offset>))
    DoMorph time = 0.1400 Scale = 0.6000
    DoMorph time = 0.1600 Scale = 1.800
    DoMorph time = 0.1800 Scale = 0.8000
    DoMorph time = 0.2000 Scale = 1.200
endscript
