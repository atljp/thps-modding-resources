
SCRIPT ped_initialize_collision_exceptions 
	GetTags 
	SWITCH <collision_mode> 
		CASE fall 
			Obj_SetInnerAvoidRadius 4 
			SetEventHandler { 
				ex = ObjectInAvoidRadius 
				scr = Ped_Utils_EventHandler params = { SetState = STATE_fall event = ObjectInAvoidRadius } 
			} 
		CASE knock 
			Obj_SetInnerAvoidRadius 2 
			SetEventHandler { 
				ex = ObjectInAvoidRadius 
				scr = Ped_Utils_EventHandler params = { SetState = STATE_knockdown event = ObjectInAvoidRadius } 
			} 
		CASE avoid 
			Obj_SetInnerAvoidRadius 8 
			SetEventHandler { 
				ex = ObjectInAvoidRadius 
				scr = Ped_Utils_EventHandler params = { SetState = STATE_avoidstop event = ObjectInAvoidRadius } 
			} 
		CASE bump 
			Obj_SetInnerAvoidRadius 2 
			Obj_SetException { 
				ex = ObjectInAvoidRadius 
				scr = goal_pro_bounce_skater 
			} 
		CASE ignore 
			Obj_ClearException ObjectInAvoidRadius 
		CASE shot 
			Obj_SetInnerAvoidRadius 8 
			SetEventHandler { 
				ex = ObjectInAvoidRadius 
				scr = Ped_Utils_EventHandler params = { SetState = STATE_shot event = ObjectInAvoidRadius } 
			} 
		CASE Explode 
			Obj_SetInnerAvoidRadius 4 
			SetEventHandler { 
				ex = ObjectInAvoidRadius 
				scr = Ped_Utils_EventHandler params = { SetState = STATE_Explode event = ObjectInAvoidRadius } 
			} 
	ENDSWITCH 
	ped_initialize_projectile_exceptions 
ENDSCRIPT

SCRIPT ped_initialize_projectile_exceptions 
	GetTags 
	IF NOT GotParam skater 
		SetEventHandler { 
			ex = ProjectileInAvoidRadius 
			scr = Ped_Utils_EventHandler params = { SetState = STATE_shot event = ProjectileInAvoidRadius } 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT ped_return_to_precollision_state 
	SetTags pissed = 0 
	Ped_Utils_SetMiscEventHandlers 
	ped_initialize_collision_exceptions 
	IF GetSingleTag collision_exception_return_state 
		goto <collision_exception_return_state> 
	ELSE 
		Ped_StateLogic_SetDefaultState 
	ENDIF 
ENDSCRIPT


