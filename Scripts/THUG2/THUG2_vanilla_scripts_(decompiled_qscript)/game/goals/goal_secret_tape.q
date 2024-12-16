
Goal_SecretTape_GenericParams = { 
	goal_text = "Get the secret tape!" 
	view_goals_text = "Generic secret tape text" 
	time = 120 
	unlimited_time 
	init = goal_secret_tape_init 
	uninit = goal_uninit 
	activate = goal_secret_tape_activate 
	deactivate = goal_secret_tape_deactivate 
	success = goal_secret_tape_success 
	SecretTape 
} 
SCRIPT goal_secret_tape_init 
	goal_init <...> 
ENDSCRIPT

SCRIPT goal_secret_tape_activate 
	IF GoalManager_HasWonGoal name = <goal_id> 
		IF IsAlive name = <secret_tape_id> 
			<secret_tape_id> : Obj_ClearExceptions 
		ENDIF 
	ELSE 
		IF NOT IsAlive name = <secret_tape_id> 
			create name = <secret_tape_id> 
		ENDIF 
		<secret_tape_id> : Obj_ClearExceptions 
		<secret_tape_id> : Obj_SetInnerRadius 10 
		<secret_tape_id> : Obj_RotY speed = 250 
		<secret_tape_id> : Obj_Hover Amp = 10 Freq = 1 
		RunScriptOnObject id = <secret_tape_id> goal_secret_tape_set_exceptions params = { goal_id = <goal_id> } 
	ENDIF 
ENDSCRIPT

SCRIPT goal_secret_tape_set_exceptions 
	Obj_SetException { 
		ex = ObjectInRadius 
		scr = goal_secret_tape_got 
		params = { goal_id = <goal_id> } 
	} 
	Block 
ENDSCRIPT

SCRIPT goal_secret_tape_got 
	Obj_ClearExceptions 
	Hide 
	GoalManager_WinGoal name = <goal_id> 
ENDSCRIPT

SCRIPT goal_secret_tape_deactivate 
	<secret_tape_id> : Obj_ClearExceptions 
	goal_deactivate <...> 
ENDSCRIPT

SCRIPT goal_secret_tape_success 
	goal_success <...> 
ENDSCRIPT


