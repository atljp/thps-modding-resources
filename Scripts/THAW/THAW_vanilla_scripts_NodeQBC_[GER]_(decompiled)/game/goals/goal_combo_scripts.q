Goal_amateurCOMBOline_genericParams = {
    goal_text = 'Sammle C-O-M-B-O'
    view_goals_text = 'Sammle C-O-M-B-O'
    goal_flags = [
        got_C
        got_O
        got_M
        got_B
        got_O2
    ]
    init = ComboLetters_Init
    uninit = goal_uninit
    activate = ComboLetters_Activate
    fail = ComboLetters_Fail
    success = ComboLetters_Win
    expire = ComboLetters_Expire
    deactivate = ComboLetters_Deactivate
    letter_info = [
        { obj_id = TRG_Goal_COMBO_C text = 'C' }
        { obj_id = TRG_Goal_COMBO_O text = 'O' }
        { obj_id = TRG_Goal_COMBO_M text = 'M' }
        { obj_id = TRG_Goal_COMBO_B text = 'B' }
        { obj_id = TRG_Goal_COMBO_O2 text = 'O' }
    ]
    trigger_obj_id = 'TRG_G_COMBO_Pro'
    restart_node = 'TRG_G_COMBO_RestartNode'
    start_pad_id = 'G_COMBO_StartPad'
    got_first_letter = 0
    record_type = Score
}

script AddGoal_Combo 
    if GotParam version
        FormatText textname = goal_type 'Combo%v' v = <version>
        if NOT GotParam letter_info
            FormatText checksumname = c_obj_id '%z_TRG_Goal_COMBO_C%v' z = <zone> v = <version>
            FormatText checksumname = o_obj_id '%z_TRG_Goal_COMBO_O%v' z = <zone> v = <version>
            FormatText checksumname = m_obj_id '%z_TRG_Goal_COMBO_M%v' z = <zone> v = <version>
            FormatText checksumname = b_obj_id '%z_TRG_Goal_COMBO_B%v' z = <zone> v = <version>
            FormatText checksumname = o2_obj_id '%z_TRG_Goal_COMBO_O2%v' z = <zone> v = <version>
            <letter_info> = [
                {obj_id = <c_obj_id> text = 'C'}
                {obj_id = <o_obj_id> text = 'O'}
                {obj_id = <m_obj_id> text = 'M'}
                {obj_id = <b_obj_id> text = 'B'}
                {obj_id = <o2_obj_id> text = 'O'}
            ]
        endif
        if NOT GotParam trigger_obj_id
            FormatText checksumname = trigger_obj_id '%z_TRG_G_COMBO%v_Pro' z = <zone> v = <version>
        endif
        if NOT GotParam restart_node
            FormatText checksumname = restart_node '%z_TRG_G_COMBO%v_RestartNode' z = <zone> v = <version>
        endif
        if NOT GotParam start_pad_id
            FormatText checksumname = start_pad_id '%z_G_COMBO%v_StartPad' z = <zone> v = <version>
        endif
    else
        <goal_type> = 'Combo'
        if NOT GotParam letter_info
            FormatText checksumname = c_obj_id '%z_TRG_Goal_COMBO_C' z = <zone>
            FormatText checksumname = o_obj_id '%z_TRG_Goal_COMBO_O' z = <zone>
            FormatText checksumname = m_obj_id '%z_TRG_Goal_COMBO_M' z = <zone>
            FormatText checksumname = b_obj_id '%z_TRG_Goal_COMBO_B' z = <zone>
            FormatText checksumname = o2_obj_id '%z_TRG_Goal_COMBO_O2' z = <zone>
            <letter_info> = [
                {obj_id = <c_obj_id> text = 'C'}
                {obj_id = <o_obj_id> text = 'O'}
                {obj_id = <m_obj_id> text = 'M'}
                {obj_id = <b_obj_id> text = 'B'}
                {obj_id = <o2_obj_id> text = 'O'}
            ]
        endif
        if NOT GotParam trigger_obj_id
            FormatText checksumname = trigger_obj_id '%z_%s' z = <zone> s = (Goal_amateurCOMBOline_genericParams.trigger_obj_id)
        endif
        if NOT GotParam restart_node
            FormatText checksumname = restart_node '%z_%s' z = <zone> s = (Goal_amateurCOMBOline_genericParams.restart_node)
        endif
        if NOT GotParam start_pad_id
            FormatText checksumname = start_pad_id '%z_%s' z = <zone> s = (Goal_amateurCOMBOline_genericParams.start_pad_id)
        endif
    endif
    if GotParam classic_mode_goal
        <classic_mode_goal> = classic_mode_goal
    endif
    GoalManager_CreateGoalName goal_type = <goal_type> zone = <zone> classic_mode_goal = <classic_mode_goal>
    if NOT GotParam goal_text
        <goal_text> = (Goal_amateurCOMBOline_genericParams.goal_text)
    endif
    if NOT GotParam view_goals_text
        <view_goals_text> = (Goal_amateurCOMBOline_genericParams.view_goals_text)
    endif
    if NOT GotParam goal_flags
        <goal_flags> = (Goal_amateurCOMBOline_genericParams.goal_flags)
    endif
    if NOT GotParam got_first_letter
        <got_first_letter> = (Goal_amateurCOMBOline_genericParams.got_first_letter)
    endif
    if NOT GotParam record_type
        <record_type> = (Goal_amateurCOMBOline_genericParams.record_type)
    endif
    if NOT GotParam skater_id
        <skater_id> = (Goal_amateurCOMBOline_genericParams.skater_id)
    endif
    GoalManager_AddGoal name = <goal_id> {
        params = {
            init = (Goal_amateurCOMBOline_genericParams.init)
            uninit = (Goal_amateurCOMBOline_genericParams.uninit)
            activate = (Goal_amateurCOMBOline_genericParams.activate)
            deactivate = (Goal_amateurCOMBOline_genericParams.deactivate)
            expire = (Goal_amateurCOMBOline_genericParams.expire)
            success = (Goal_amateurCOMBOline_genericParams.success)
            fail = (Goal_amateurCOMBOline_genericParams.fail)
            <...> 
        }
    }
endscript
Goal_ProCOMBOline_genericParams = {
    goal_text = 'Sammle C-O-M-B-O'
    view_goals_text = 'C-O-M-B-O-Buchstaben (Profi)'
    goal_flags = [
        got_C
        got_O
        got_M
        got_B
        got_O2
    ]
    init = ComboLetters_Init
    uninit = goal_uninit
    activate = ComboLetters_Activate
    expire = ComboLetters_Expire
    fail = ComboLetters_Fail
    success = ComboLetters_Win
    deactivate = ComboLetters_Deactivate
    letter_info = [
        { obj_id = TRG_Goal_COMBO_C text = 'C' }
        { obj_id = TRG_Goal_COMBO_O text = 'O' }
        { obj_id = TRG_Goal_COMBO_M text = 'M' }
        { obj_id = TRG_Goal_COMBO_B text = 'B' }
        { obj_id = TRG_Goal_COMBO_O2 text = 'O' }
    ]
    time = 120
    trigger_obj_id = TRG_G_PROLINE_Pro
    restart_node = TRG_G_PROLINE_RestartNode
    start_pad_id = G_PROLINE_StartPad
    got_first_letter = 0
    record_type = Score
}
Goal_MedCOMBOline_genericParams = {
    goal_text = 'Sammle C-O-M-B-O'
    view_goals_text = 'C-O-M-B-O-Buchstaben (Profi)'
    goal_flags = [
        got_C
        got_O
        got_M
        got_B
        got_O2
    ]
    init = ComboLetters_Init
    uninit = goal_uninit
    activate = ComboLetters_Activate
    expire = ComboLetters_Expire
    fail = ComboLetters_Fail
    success = ComboLetters_Win
    deactivate = ComboLetters_Deactivate
    letter_info = [
        { obj_id = TRG_Goal_COMBO_C text = 'C' }
        { obj_id = TRG_Goal_COMBO_O text = 'O' }
        { obj_id = TRG_Goal_COMBO_M text = 'M' }
        { obj_id = TRG_Goal_COMBO_B text = 'B' }
        { obj_id = TRG_Goal_COMBO_O2 text = 'O' }
    ]
    time = 120
    trigger_obj_id = TRG_G_MedCOMBO_Pro
    restart_node = TRG_G_MedCOMBO_RestartNode
    start_pad_id = G_MedCOMBO_StartPad
    got_first_letter = 0
    record_type = Score
}

script ComboLetters_Init 
    goal_init goal_id = <goal_id>
endscript

script ComboLetters_Activate 
    goal_start goal_id = <goal_id> dont_reset_special
    Create_Combo goal_id = <goal_id>
    GoalManager_EditGoal name = <goal_id> params = { got_first_letter = 0 }
    GetArraySize <goal_flags>
    <index> = 0
    begin 
    RunScriptOnObject id = ((<letter_info> [ <index> ]).obj_id)ComboLetter_InitLetter params = {goal_id = <goal_id> flag = (<goal_flags> [ <index> ])id = ((<letter_info> [ <index> ]).obj_id)}
    <index> = (<index> + 1)
    repeat <array_size>
endscript

script ComboLetters_Deactivate 
    KillSpawnedScript name = ComboLetter_GetLetter
    KillSpawnedScript name = ComboLetter_GotLetter
    FormatText checksumname = gotletter2_script_id '%s_ComboLetter_GotLetter2' s = <goal_name>
    KillSpawnedScript id = <gotletter2_script_id>
    FormatText checksumname = startCombo_script_id '%s_ComboLetter_StartCombo' s = <goal_name>
    KillSpawnedScript id = <startCombo_script_id>
    goal_deactivate goal_id = <goal_id>
    GoalManager_ResetGoalTrigger name = <goal_id>
    goal_combo_kill_letters goal_id = <goal_id>
    kill_combo_messages <...> 
    GoalManager_EditGoal name = <goal_id> params = { got_first_letter = 0 }
endscript

script ComboLetter_InitLetter 
    GoalManager_GetGoalParams name = <goal_id>
    Obj_ClearExceptions
    obj_roty \{ Speed = 200 }
    obj_setinnerradius \{ 8 }
    if GameModeEquals \{ is_coop }
        Obj_SetException Ex = anyobjectinradius scr = ComboLetter_GotLetter params = {goal_id = <goal_id> flag = <flag> id = <id>}
    else
        Obj_SetException Ex = objectinradius scr = ComboLetter_GotLetter params = {goal_id = <goal_id> flag = <flag> id = <id>}
    endif
endscript

script ComboLetter_HUDLetter 
    GetArraySize <letter_info>
    <index> = 0
    begin 
    if ((<goal_flags> [ <index> ])= <flag>)
        <text> = ((<letter_info> [ <index> ]).text)
        <y_pos> = (150 + (30 * <index>))
        break 
    endif
    <index> = (<index> + 1)
    repeat <array_size>
    if GotParam text
        create_panel_message {
            id = <flag>
            text = <text>
            style = combo_letter_panel_message
            params = { y_pos = <y_pos> }
        }
    else
        script_assert 'couldn\'t find combo letter text'
    endif
endscript

script hide_combo_letters 
    if ObjectExists id = got_C
        DoScreenElementMorph id = got_C time = 0 alpha = 0
    endif
    if ObjectExists id = got_O
        DoScreenElementMorph id = got_O time = 0 alpha = 0
    endif
    if ObjectExists id = got_M
        DoScreenElementMorph id = got_M time = 0 alpha = 0
    endif
    if ObjectExists id = got_B
        DoScreenElementMorph id = got_B time = 0 alpha = 0
    endif
    if ObjectExists id = got_O2
        DoScreenElementMorph id = got_O2 time = 0 alpha = 0
    endif
endscript

script unhide_combo_letters 
    if ObjectExists id = got_C
        DoScreenElementMorph id = got_C time = 0 alpha = 1
    endif
    if ObjectExists id = got_O
        DoScreenElementMorph id = got_O time = 0 alpha = 1
    endif
    if ObjectExists id = got_M
        DoScreenElementMorph id = got_M time = 0 alpha = 1
    endif
    if ObjectExists id = got_B
        DoScreenElementMorph id = got_B time = 0 alpha = 1
    endif
    if ObjectExists id = got_O2
        DoScreenElementMorph id = got_O2 time = 0 alpha = 1
    endif
endscript

script ComboLetter_GotLetter 
    GoalManager_GetGoalParams name = <goal_id>
    FormatText checksumname = gotletter2_script_id '%s_ComboLetter_GotLetter2' s = <goal_name>
    <colobjid> ::obj_spawnscriptlater {
        ComboLetter_GotLetter2
        id = <gotletter2_script_id>
        params = {goal_id = <goal_id> id = <id> flag = <flag> obj_id = <colobjid>}
    }
endscript

script ComboLetter_GotLetter2 
    if IsLocalSkater
        if IsInBail
            return 
        endif
    endif
    if currentscorepotgreaterthan \{ 0 }
        ComboLetter_GetLetter <...> 
    else
        if skating
            if NOT OnGround
                ComboLetter_GetLetter <...> 
            endif
        else
            if walking
                if Walk_Air
                    ComboLetter_GetLetter <...> 
                endif
            endif
        endif
    endif
endscript

script ComboLetter_GetLetter 
    GoalManager_GetGoalParams name = <goal_id>
    if GotParam skater_id
        if (<skater_id> = <obj_id>)
            correct_skater = 1
        endif
    endif
    if (<got_first_letter> = 0)
        Kill name = <id>
    else
        if GotParam correct_skater
            Kill name = <id>
        else
            return 
        endif
    endif
    GoalManager_SetGoalFlag name = <goal_id> <flag> 1
    if GoalManager_AllFlagsSet name = <goal_id>
        broadcastevent type = ComboLetter_GotLastLetter
    endif
    if (<got_first_letter> = 0)
        Kill name = <id>
        GoalManager_EditGoal name = <goal_id> params = {got_first_letter = 1 skater_id = <obj_id>}
        FormatText checksumname = startCombo_script_id '%s_ComboLetter_StartCombo' s = <goal_name>
        SpawnScriptLater {
            ComboLetter_StartCombo
            id = <startCombo_script_id>
            params = { goal_id = <goal_id> }
        }
    endif
    playsound GapSound_11 vol = 100
    ComboLetter_HUDLetter letter_info = <letter_info> goal_flags = <goal_flags> flag = <flag>
endscript

script ComboLetter_StartCombo 
    ClearExceptions
    GoalManager_GetGoalParams name = <goal_id>
    <skater_id> ::Obj_SetException Ex = SkaterLanded scr = ComboLetters_ComboLanded params = { goal_id = <goal_id> }
    <skater_id> ::Obj_SetException Ex = SkaterBailed scr = ComboLetters_ComboLost params = { goal_id = <goal_id> }
    <skater_id> ::Obj_SetException Ex = ComboLetter_GotLastLetter scr = ComboLetter_GotLastLetter params = { goal_id = <goal_id> }
    if NOT <skater_id> ::currentscorepotgreaterthan 0
        <skater_id> ::Obj_SetException Ex = SkaterEnterGround scr = ComboLetters_HandleEnterGround params = { goal_id = <goal_id> }
        <skater_id> ::Obj_SetException Ex = SkaterEnterLadder scr = ComboLetters_ComboLanded params = { goal_id = <goal_id> }
        <skater_id> ::Obj_SetException Ex = SkaterEnterHang scr = ComboLetters_ComboLanded params = { goal_id = <goal_id> }
        WaitForEvent type = SkaterEnterCombo
        ClearException SkaterEnterGround
        ClearException SkaterEnterLadder
        ClearException SkaterEnterHang
    endif
    Block
endscript

script ComboLetter_GotLastLetter 
    ClearExceptions
    GoalManager_GetGoalParams name = <goal_id>
    if NOT <skater_id> ::currentscorepotgreaterthan 0
        <skater_id> ::Obj_SetException Ex = SkaterEnterGround scr = ComboLetters_WinGoal params = { goal_id = <goal_id> }
        <skater_id> ::Obj_SetException Ex = SkaterEnterLadder scr = ComboLetters_WinGoal params = { goal_id = <goal_id> }
        <skater_id> ::Obj_SetException Ex = SkaterEnterHang scr = ComboLetters_WinGoal params = { goal_id = <goal_id> }
    endif
    <skater_id> ::Obj_SetException Ex = SkaterBailed scr = ComboLetters_ComboLost params = { goal_id = <goal_id> }
    <skater_id> ::Obj_SetException Ex = SkaterLanded scr = ComboLetters_WinGoal params = { goal_id = <goal_id> }
    wait 60 seconds
    Block
endscript

script ComboLetters_WinGoal 
    GoalManager_GetGoalParams name = <goal_id>
    if NOT (<fired_by_id> = <skater_id>)
        SpawnScriptLater ComboLetter_StartCombo params = <...> 
        return 
    endif
    ClearExceptions
    GoalManager_EditGoal name = <goal_id> params = { got_first_letter = 0 }
    GoalManager_WinGoal name = <goal_id>
endscript

script ComboLetters_ComboLost 
    GoalManager_GetGoalParams name = <goal_id>
    if NOT (<fired_by_id> = <skater_id>)
        SpawnScriptLater ComboLetter_StartCombo params = <...> 
        return 
    endif
    ClearExceptions
    SpawnScriptLater ComboLetters_ComboLost2 params = <...> 
endscript

script ComboLetters_ComboLost2 
    if NOT GoalManager_GoalExists name = <goal_id>
        return 
    endif
    GoalManager_GetGoalParams name = <goal_id>
    if GoalManager_GoalIsActive name = <goal_id>
        GoalManager_ResetGoalTrigger name = <goal_id>
        GoalManager_LoseGoal name = <goal_id>
        ComboLetters_FailedMessage <...> 
    endif
endscript

script ComboLetters_ComboLanded 
    GoalManager_GetGoalParams name = <goal_id>
    if NOT (<fired_by_id> = <skater_id>)
        SpawnScriptLater ComboLetter_StartCombo params = <...> 
        return 
    endif
    ClearExceptions
    if NOT GoalManager_GoalIsActive name = <goal_id>
        return 
    endif
    if GoalManager_AllFlagsSet name = <goal_id>
        ComboLetters_WinGoal <...> 
        return 
    endif
    SpawnScriptLater ComboLetters_ComboLanded2 params = <...> 
endscript

script ComboLetters_ComboLanded2 
    GoalManager_GetGoalParams name = <goal_id>
    GoalManager_LoseGoal name = <goal_id>
    ComboLetters_FailedMessage <...> 
endscript

script ComboLetters_FailedMessage 
    if NOT GameModeEquals is_coop
        create_panel_message id = new_goal_message text = 'Du hast deine Kombo verloren!' style = panel_message_generic_loss
    else
        MangleChecksums a = 0 b = 0
        if (<skater_id> = <mangled_id>)
            create_panel_message id = new_goal_message text = 'Du hast deine Kombo verloren!' style = panel_message_generic_loss0
        else
            create_panel_message id = new_goal_message text = 'Du hast deine Kombo verloren!' style = panel_message_generic_loss1
        endif
    endif
endscript

script ComboLetters_HandleEnterGround 
    GoalManager_GetGoalParams name = <goal_id>
    if NOT (<fired_by_id> = <skater_id>)
        SpawnScriptLater ComboLetter_StartCombo params = <...> 
        return 
    endif
    ClearExceptions
    GoalManager_GetGoalParams name = <goal_id>
    if <skater_id> ::walking
        if NOT <skater_id> ::currentscorepotgreaterthan 0
            SpawnScriptLater ComboLetters_ComboLanded2 params = <...> 
            return 
        endif
    endif
    SpawnScriptLater ComboLetter_StartCombo params = <...> 
endscript

script ComboLetters_Expire 
    goal_expire goal_id = <goal_id>
    GoalManager_LoseGoal name = <goal_id>
endscript

script ComboLetters_Fail 
    GoalManager_EditGoal name = <goal_id> params = { got_first_letter = 0 }
    goal_fail goal_id = <goal_id>
endscript

script ComboLetters_Win 
    goal_success goal_id = <goal_id>
endscript

script kill_combo_messages 
    GetArraySize <goal_flags>
    <index> = 0
    begin 
    if ScreenElementExists id = (<goal_flags> [ <index> ])
        RunScriptOnScreenElement id = (<goal_flags> [ <index> ])kill_panel_message
    endif
    <index> = (<index> + 1)
    repeat <array_size>
endscript

script Create_Combo 
    GoalManager_GetGoalParams name = <goal_id>
    GetArraySize <letter_info>
    <index> = 0
    begin 
    Create name = ((<letter_info> [ <index> ]).obj_id)
    RunScriptOnObject id = ((<letter_info> [ <index> ]).obj_id)bounce_combo_letter
    <index> = (<index> + 1)
    repeat <array_size>
endscript

script goal_combo_kill_letters 
    GoalManager_GetGoalParams name = <goal_id>
    GetArraySize <letter_info>
    <index> = 0
    begin 
    Kill name = ((<letter_info> [ <index> ]).obj_id)
    <index> = (<index> + 1)
    repeat <array_size>
endscript

script bounce_combo_letter 
    obj_hover \{ amp = 6 freq = 2 }
endscript

script combo_letter_panel_message 
    setprops font = small just = [ center center ] rgba = [ 10 225 10 115 ]
    DoMorph time = 0.08000 Scale = 0.3000 Pos = ((665.0, 0.0) + ((0.0, 1.0) * <y_pos>))
    DoMorph time = 0.1200 Scale = 3.500 Pos = ((580.0, 0.0) + ((0.0, 1.0) * <y_pos>))
    DoMorph time = 0.1400 Scale = 0.6000
    DoMorph time = 0.1600 Scale = 1.800
    DoMorph time = 0.1800 Scale = 0.8000
    DoMorph time = 0.2000 Scale = 1.200
endscript
