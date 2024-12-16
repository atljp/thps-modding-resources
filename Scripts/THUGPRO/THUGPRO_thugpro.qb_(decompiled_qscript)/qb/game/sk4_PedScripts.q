
SCRIPT Ped_SetDefaults 
	RemoveTags 
	ClearEventHandler ObjectInAttentionRadius 
	SetTags collision_mode = ignore 
	SetTags talking_mode = friendly 
	SetTags move_type = walk 
	SetTags is_goal_ped = 0 
	SetTags talking_radius = 30 
	SetTags collision_exception_return_state = Ped_StateLogic_SetDefaultState 
	SetTags pissed = 0 
	SetTags should_look_at_skater = 1 
	SetTags ped_init = 1 
	IF NOT InNetGame 
		IF GotParam NameCheck 
			IF Skater : SkaterIsNamed <PedName> 
				Obj_GetId 
				<objID> : Obj_InitModelFromProfile { 
					struct = Ped_Skateboard_A 
					use_asset_manager = 1 
					texDictOffset = 0 
				} 
			ENDIF 
		ENDIF 
	ENDIF 
	IF GotParam Skater 
		SetTags { move_type = skate } 
		Ped_SetIsSkater 1 
	ELSE 
		IF GotParam stand 
			SetTags { move_type = stand } 
			IF GotParam standing_anims 
				SetTags { standing_anims = <standing_anims> } 
			ENDIF 
		ELSE 
			SetTags move_type = walk 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT Ped_InitAI 
	SK4_PedScript <...> 
ENDSCRIPT

SCRIPT SK4_PedScript 
	Ped_SetDefaults <...> 
	SetTags <...> 
	IF GotParam Avoid 
		SetTags collision_mode = Avoid 
	ENDIF 
	IF GotParam Fall 
		SetTags collision_mode = Fall 
	ENDIF 
	IF GotParam shot 
		SetTags collision_mode = shot 
	ENDIF 
	IF GotParam Knock 
		SetTags collision_mode = Knock 
	ENDIF 
	IF GotParam bump 
		SetTags collision_mode = bump 
	ENDIF 
	IF GotParam ignore 
		SetTags collision_mode = ignore 
	ENDIF 
	IF GotParam friendly 
		SetTags talking_mode = friendly 
	ENDIF 
	IF GotParam Mean 
		SetTags talking_mode = Mean 
	ENDIF 
	IF GotParam Explode 
		SetTags collision_mode = Explode 
	ENDIF 
	IF GotParam GoalPed 
		SetTags is_goal_ped = 1 
	ENDIF 
	IF GotParam oldschool 
		IF NOT GotParam stand 
			Ped_InitPath 
		ENDIF 
		IF GotParam Skater 
			Ped_SetIsSkater 1 
			Ped_SetLogicState generic_skater 
		ELSE 
			IF GotParam stand 
				Ped_SetLogicState generic_standing 
				ped_standing_idle 
			ELSE 
				Ped_SetLogicState generic 
				goto Ped_IdleState 
			ENDIF 
		ENDIF 
	ELSE 
		ped_initialize_collision_exceptions 
		Obj_StickToGround distAbove = 3 distBelow = 6 
		Obj_StickToGround off 
		ped_initialize_movement <...> 
		IF NOT GotParam stand 
			Ped_InitPath 
		ENDIF 
		Ped_Utils_SetMiscEventHandlers 
		Ped_StateLogic_SetDefaultState 
	ENDIF 
ENDSCRIPT

SCRIPT ped_initialize_movement 
	IF GetSingleTag move_type 
		IF NOT ( <move_type> = stand ) 
			Obj_SetPathTurnDist 2.50000000000 feet 
			GetSingleTag speed 
			IF ( <move_type> = skate ) 
				IF NOT GotParam speed 
					speed = 25 
				ENDIF 
			ELSE 
				IF NOT GotParam speed 
					speed = RANDOM_RANGE PAIR(5.00000000000, 10.00000000000) 
				ENDIF 
			ENDIF 
			Obj_SetPathVelocity <speed> fps 
		ENDIF 
	ENDIF 
ENDSCRIPT


