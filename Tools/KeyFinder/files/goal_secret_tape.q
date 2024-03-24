
Goal_SecretTape_GenericParams = {
    goal_text = 'Get the secret tape!'
    view_goals_text = 'Generic secret tape text'
    time = 120
    unlimited_time
    init = goal_secret_tape_init
    uninit = goal_uninit
    activate = goal_secret_tape_activate
    deactivate = goal_secret_tape_deactivate
    success = goal_secret_tape_success
    SecretTape
}

script goal_secret_tape_init 
    goal_init <...> 
endscript


script goal_secret_tape_activate 
    if GoalManager_HasWonGoal name = <goal_id>
        if IsAlive name = <secret_tape_id>
            <secret_tape_id> ::Obj_ClearExceptions
        endif
    else
        if NOT IsAlive name = <secret_tape_id>
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
    Obj_SetException {
        Ex = objectinradius
        scr = goal_secret_tape_got
        params = { goal_id = <goal_id> }
    }
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

