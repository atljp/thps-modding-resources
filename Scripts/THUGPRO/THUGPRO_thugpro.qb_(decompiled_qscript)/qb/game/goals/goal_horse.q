
goal_horse_mp_genericParams = { 
	goal_text = "Complete the other players\' tricks!" 
	time = 10 
	net 
	init = goal_horse_mp_init 
	activate = goal_horse_mp_activate 
	deactivate = goal_horse_mp_deactivate 
	expire = goal_horse_mp_expire 
	goal_description = "Horse!" 
} 
SCRIPT goal_horse_mp_init 
ENDSCRIPT

SCRIPT goal_horse_mp_activate 
	KillSpawnedScript name = clock_morph 
	RunScriptOnScreenElement id = the_time clock_morph 
	ResetScore 
ENDSCRIPT

SCRIPT goal_horse_mp_deactivate 
	IF ObjectExists id = horse_score_menu 
		DestroyScreenElement id = horse_score_menu 
	ENDIF 
	printf "DEACTIVATE HORSE" 
ENDSCRIPT

SCRIPT horse_mp_done 
	dialog_box_exit 
	do_backend_retry 
ENDSCRIPT

SCRIPT goal_horse_mp_expire 
	printf "EXPIRE HORSE" 
	IF ObjectExists id = goal_message 
		DestroyScreenElement id = goal_message 
	ENDIF 
	printf "goal_horse_mp_expire" 
ENDSCRIPT

SCRIPT AddGoal_Horse_Mp 
	GoalManager_AddGoal name = horse_mp { 
		params = { goal_horse_mp_genericParams } 
	} 
ENDSCRIPT

SCRIPT StartGoal_Horse_Mp 
	GoalManager_EditGoal name = horse_mp params = <...> 
	GoalManager_ActivateGoal name = horse_mp 
	create_horse_score_menu 
ENDSCRIPT

SCRIPT EndGoal_Horse_Mp 
	GoalManager_DeactivateGoal name = horse_mp 
ENDSCRIPT

SCRIPT create_horse_score_menu 
	IF NOT ObjectExists id = horse_score_menu 
		SetScreenElementLock id = root_window off 
		CreateScreenElement { 
			type = ContainerElement 
			parent = root_window 
			id = horse_score_menu 
			font = dialog 
			pos = PAIR(0.00000000000, 30.00000000000) 
			just = [ left top ] 
			scale = 0 
			dims = PAIR(640.00000000000, 480.00000000000) 
		} 
		CreateScreenElement { 
			type = VMenu 
			parent = horse_score_menu 
			id = horse_score_vmenu 
			font = dialog 
			just = [ left top ] 
			pos = PAIR(45.00000000000, 60.00000000000) 
			scale = 0.89999997616 
			padding_scale = 0.69999998808 
			internal_scale = 1 
			internal_just = [ left top ] 
		} 
		<index> = 1 
		BEGIN 
			FormatText ChecksumName = current_id "horse_score_%i" i = <index> 
			CreateScreenElement { 
				type = TextElement 
				parent = horse_score_vmenu 
				id = <current_id> 
				font = dialog 
				text = "" 
				scale = 0.89999997616 
				rgba = [ 108 112 120 128 ] 
				not_focusable 
				z_priority = -5 
			} 
			<index> = ( <index> + 1 ) 
		REPEAT 3 
		RunScriptOnScreenElement id = horse_score_menu menu_onscreen params = { preserve_menu_state } 
	ENDIF 
ENDSCRIPT

SCRIPT update_horse_score 
	IF ObjectExists id = horse_score_menu 
		SetScreenElementProps { 
			id = <id> 
			text = <text> 
		} 
	ENDIF 
ENDSCRIPT


