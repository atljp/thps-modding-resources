Goal_SecretTape_GenericParams = {
    goal_text = 'Finde das geheime Tape!'
    view_goals_text = 'Finde das geheime Tape!'
    time = 120
    unlimited_time
    init = goal_secret_tape_init
    uninit = goal_uninit
    activate = goal_secret_tape_activate
    deactivate = goal_secret_tape_deactivate
    success = goal_secret_tape_success
    SecretTape
}

script AddGoal_SecretTape 
    if GotParam version
        FormatText textname = goal_type 'SecretTape%v' v = <version>
        if NOT GotParam secret_tape_id
            FormatText checksumname = secret_tape_id '%z_TRG_G_SECRETTAPE%v' z = <zone> v = <version>
        endif
    else
        <goal_type> = 'SecretTape'
        if NOT GotParam secret_tape_id
            FormatText checksumname = secret_tape_id '%z_TRG_G_SECRETTAPE' z = <zone>
        endif
    endif
    if GotParam classic_mode_goal
        <classic_mode_goal> = classic_mode_goal
    endif
    GoalManager_CreateGoalName goal_type = <goal_type> zone = <zone> classic_mode_goal = <classic_mode_goal>
    if NOT GotParam goal_text
        <goal_text> = (Goal_SecretTape_GenericParams.goal_text)
    endif
    if NOT GotParam view_goals_text
        <view_goals_text> = (Goal_SecretTape_GenericParams.view_goals_text)
    endif
    if NOT GotParam time
        <time> = (Goal_SecretTape_GenericParams.time)
    endif
    GoalManager_AddGoal name = <goal_id> {
        params = {
            init = (Goal_SecretTape_GenericParams.init)
            uninit = (Goal_SecretTape_GenericParams.uninit)
            activate = (Goal_SecretTape_GenericParams.activate)
            deactivate = (Goal_SecretTape_GenericParams.deactivate)
            success = (Goal_SecretTape_GenericParams.success)
            <...> 
            unlimited_time
            SecretTape
        }
    }
endscript

script goal_secret_tape_init 
    goal_init <...> 
endscript

script goal_secret_tape_activate 
    if GoalManager_HasWonGoal name = <goal_id>
        if IsCreated <secret_tape_id>
            <secret_tape_id> ::Obj_ClearExceptions
        endif
    else
        if NOT IsCreated <secret_tape_id>
            Create name = <secret_tape_id>
        endif
        <secret_tape_id> ::Obj_ClearExceptions
        <secret_tape_id> ::obj_setinnerradius 10
        <secret_tape_id> ::obj_roty Speed = 250
        <secret_tape_id> ::obj_hover amp = 10 freq = 1
        RunScriptOnObject id = <secret_tape_id> goal_secret_tape_set_exceptions params = { goal_id = <goal_id> }
    endif
endscript

script goal_secret_tape_set_exceptions 
    if GameModeEquals \{ is_coop }
        Obj_SetException {
            Ex = anyobjectinradius
            scr = goal_secret_tape_got
            params = { goal_id = <goal_id> }
        }
    else
        Obj_SetException {
            Ex = objectinradius
            scr = goal_secret_tape_got
            params = { goal_id = <goal_id> }
        }
    endif
    Block
endscript

script goal_secret_tape_got 
    Obj_ClearExceptions
    hide
    GoalManager_WinGoal name = <goal_id>
endscript

script goal_secret_tape_deactivate 
    <secret_tape_id> ::Obj_ClearExceptions
    goal_deactivate <...> 
endscript

script goal_secret_tape_success 
    goal_success <...> 
endscript
