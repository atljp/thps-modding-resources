
SCRIPT PED_DEBUGEVENT 
	IF ( DEBUG_PEDLOGIC = 1 ) 
		Obj_GetID 
		IF ( DEBUG_PED_OBJID = 0 | DEBUG_PED_OBJID = <objID> ) 
			
			
			IF GotParam params 
				
				
			ENDIF 
			
		ENDIF 
	ENDIF 
ENDSCRIPT

Ped_StateLogic_UpdateTypes = { 
	no_move_update 
	generic_move_update 
	skater_move_update 
	lip_trick_update 
	blocker_move_update 
	chase_move_update 
	gohome_move_update 
} 
Ped_StateLogic_ExitActions = { 
	wait_anim_finished 
} 
Ped_StateLogic_DefaultStates = [ 
	{ Tag = Sitting State = STATE_Sitting Table = Ped_StateLogic_Table } 
	{ Tag = Vending State = STATE_Vending Table = Ped_StateLogic_Table } 
	{ Tag = Corner State = STATE_Corner Table = Ped_StateLogic_Table } 
	{ Tag = Arcade State = STATE_Arcade Table = Ped_StateLogic_Table } 
	{ Tag = LookAt State = STATE_LookAt Table = Ped_StateLogic_Table } 
	{ Tag = Wait State = STATE_Wait Table = Ped_StateLogic_Table } 
	{ Tag = Talk State = STATE_Talk Table = Ped_StateLogic_Table } 
	{ Tag = Chick State = STATE_Chick Table = Ped_StateLogic_Table } 
	{ Tag = skater State = STATE_skating Table = SkaterPed_StateTable } 
	{ Tag = stand State = STATE_standing Table = Ped_StateLogic_Table } 
] 
Ped_StateLogic_CollisionTypes = [ 
	{ Tag = avoid Set_mode = avoid } 
	{ Tag = fall Set_mode = fall } 
	{ Tag = shot Set_mode = shot } 
	{ Tag = knock Set_mode = knock } 
	{ Tag = bump Set_mode = bump } 
	{ Tag = ignore Set_mode = ignore } 
] 
Ped_StateLogic_EventHandlers = [ 
	{ Tag = GetAttention Hook_event = ObjectInAttentionRadius State = STATE_getattention Scr = Ped_Utils_EventHandler } 
	{ Tag = Blocker Hook_event = ObjectInAttentionRadius State = STATE_blockerwait Scr = Ped_Utils_EventHandler } 
	{ Tag = Blocker Hook_event = BlockerStand State = STATE_blockerstand Scr = Ped_Utils_EventHandler } 
	{ Tag = Blocker Hook_event = BlockerShuffle State = STATE_blockershuffle Scr = Ped_Utils_EventHandler } 
	{ Tag = Blocker Hook_event = BlockerRun State = STATE_blockerrun Scr = Ped_Utils_EventHandler } 
	{ Tag = Blocker Hook_event = BlockerBumpPlayer State = STATE_blockerbump Scr = Ped_Utils_EventHandler } 
] 
Ped_StateLogic_Table = { 
	STATE_DEFAULT = { 
		script_ped_state = Ped_StateLogic_SetDefaultState 
	} 
	STATE_RESET_EVENTS = { 
		script_ped_state = ped_return_to_precollision_state 
	} 
	STATE_DELAY_waitanim = { 
		script_ped_state = STATECONTROL_DELAY_waitanim 
	} 
	STATE_walking = { 
		ped_update_type = generic_move_update 
		script_ped_state = STATECONTROL_walking 
	} 
	STATE_standing = { 
		ped_update_type = no_move_update 
		script_ped_state = STATECONTROL_standidle 
	} 
	STATE_Chick = { 
		ped_update_type = no_move_update 
		script_ped_state = STATECONTROL_chick 
	} 
	STATE_shot = { 
		high_priority 
		hide_boardgeom 
		script_ped_state = STATECONTROL_shot 
	} 
	STATE_fall = { 
		high_priority 
		hide_boardgeom 
		script_ped_state = STATECONTROL_fall 
	} 
	STATE_getup = { 
		hide_boardgeom 
		script_ped_state = STATECONTROL_getup 
	} 
	STATE_disgust = { 
		hide_boardgeom 
		script_ped_state = STATECONTROL_disgust 
	} 
	STATE_knockdown = { 
		hide_boardgeom 
		script_ped_state = STATECONTROL_knockdown 
	} 
	STATE_avoidstop = { 
		high_priority 
		hide_boardgeom 
		script_ped_state = STATECONTROL_avoidstop 
	} 
	STATE_avoidinit = { 
		high_priority 
		hide_boardgeom 
		script_ped_state = STATECONTROL_avoidinit 
	} 
	STATE_avoidjump = { 
		high_priority 
		hide_boardgeom 
		script_ped_state = STATECONTROL_avoidjump 
	} 
	STATE_avoidland = { 
		high_priority 
		hide_boardgeom 
		script_ped_state = STATECONTROL_avoidland 
	} 
	STATE_avoidknockdown = { 
		high_priority 
		hide_boardgeom 
		script_ped_state = STATECONTROL_avoidknockdown 
	} 
	STATE_trickpositive = { 
		script_ped_state = STATECONTROL_trickpositive 
	} 
	STATE_trickbail = { 
		script_ped_state = STATECONTROL_trickbail 
	} 
	STATE_getattention = { 
		script_ped_state = STATECONTROL_getattention 
		exit_state_action = wait_anim_finished 
	} 
	STATE_blockerwait = { 
		ped_update_type = blocker_move_update 
		script_ped_state = STATECONTROL_blockerwait 
	} 
	STATE_blockerstand = { 
		ped_update_type = blocker_move_update 
		script_ped_state = STATECONTROL_blockerstand 
	} 
	STATE_blockershuffle = { 
		ped_update_type = blocker_move_update 
		script_ped_state = STATECONTROL_blockershuffle 
	} 
	STATE_blockerrun = { 
		ped_update_type = blocker_move_update 
		script_ped_state = STATECONTROL_blockerrun 
	} 
	STATE_blockerbump = { 
		script_ped_state = STATECONTROL_blockerbump 
	} 
	STATE_chase = { 
		ped_update_type = chase_move_update 
		script_ped_state = STATECONTROL_chase 
	} 
	STATE_chasepause = { 
		ped_update_type = chase_move_update 
		script_ped_state = STATECONTROL_chasepause 
	} 
	STATE_chasecatch = { 
		script_ped_state = STATECONTROL_chasecatch 
	} 
	STATE_gohome = { 
		ped_update_type = gohome_move_update 
		script_ped_state = STATECONTROL_gohome 
	} 
	STATE_Sitting = { 
		ped_update_type = no_move_update 
		script_ped_state = STATECONTROL_Sitting 
	} 
	STATE_Vending = { 
		ped_update_type = no_move_update 
		script_ped_state = STATECONTROL_Vending 
	} 
	STATE_Corner = { 
		ped_update_type = no_move_update 
		script_ped_state = STATECONTROL_Corner 
	} 
	STATE_Arcade = { 
		ped_update_type = no_move_update 
		script_ped_state = STATECONTROL_Arcade 
	} 
	STATE_LookAt = { 
		ped_update_type = no_move_update 
		script_ped_state = STATECONTROL_LookAt 
	} 
	STATE_Wait = { 
		ped_update_type = no_move_update 
		script_ped_state = STATECONTROL_Wait 
	} 
	STATE_Talk = { 
		ped_update_type = no_move_update 
		script_ped_state = STATECONTROL_Talk 
	} 
	STATE_Explode = { 
		script_ped_state = STATECONTROL_Explode 
	} 
} 
SCRIPT Ped_StateLogic_SetDefaultState 
	GetTags 
	IF GotParam TempDefaultState 
		Ped_SetLogicState <TempDefaultState> Table = <TempDefaultTable> 
		RETURN 
	ENDIF 
	GetArraySize ( Ped_UniqueStateLogic_DefaultStates ) 
	<index> = 0 
	BEGIN 
		IF GotParam ( Ped_UniqueStateLogic_DefaultStates [ <index> ] . Tag ) 
			<State> = ( Ped_UniqueStateLogic_DefaultStates [ <index> ] . State ) 
			<Table> = ( Ped_UniqueStateLogic_DefaultStates [ <index> ] . Table ) 
			SetTags UniqueStateTable = <Table> 
			Ped_SetLogicState <State> Table = <Table> 
			RETURN 
		ENDIF 
		<index> = ( <index> + 1 ) 
	REPEAT <array_size> 
	GetArraySize ( Ped_StateLogic_DefaultStates ) 
	<index> = 0 
	BEGIN 
		IF GotParam ( Ped_StateLogic_DefaultStates [ <index> ] . Tag ) 
			<State> = ( Ped_StateLogic_DefaultStates [ <index> ] . State ) 
			<Table> = ( Ped_StateLogic_DefaultStates [ <index> ] . Table ) 
			Ped_SetLogicState <State> Table = <Table> 
			RETURN 
		ENDIF 
		<index> = ( <index> + 1 ) 
	REPEAT <array_size> 
	Ped_SetLogicState STATE_walking Table = Ped_StateLogic_Table 
ENDSCRIPT

SCRIPT Ped_StateLogic_RegisterTempDefaultState 
	IF NOT GotParam State 
		script_assert "Missing <State> param" 
	ENDIF 
	IF NOT GotParam Table 
		script_assert "Missing <Table> param" 
	ENDIF 
	SetTags TempDefaultState = <State> TempDefaultTable = <Table> 
ENDSCRIPT

SCRIPT Ped_StateLogic_UnregisterTempDefaultState 
	RemoveTags Tags = [ TempDefaultState TempDefaultTable ] 
ENDSCRIPT

SCRIPT STATECONTROL_null 
ENDSCRIPT

SCRIPT STATECONTROL_DELAY_waitanim 
	Obj_SetAnimCycleMode off 
	Obj_WaitAnimFinished 
	IF GetSingleTag DelayedState 
		GetSingleTag DelayedTable 
		Ped_SetLogicState <DelayedState> Table = <DelayedTable> 
		RemoveTags Tags = [ DelayedState DelayedTable ] 
		RETURN 
	ENDIF 
	Ped_StateLogic_SetDefaultState 
ENDSCRIPT

SCRIPT STATECONTROL_walking 
	ped_initialize_collision_exceptions 
	Ped_Utils_GetAnimName Type = IdleToWalk 
	PlayAnimWithPartialAnimIfExists Anim = <AnimName> 
	Obj_WaitAnimFinished 
	Ped_Utils_GetAnimName Type = WalkAnims 
	PlayAnimWithPartialAnimIfExists Anim = <AnimName> Cycle UseAnimTags 
	IF GetSingleTag animTags 
		ped_adjust_speed_to_match_anim <animTags> 
	ENDIF 
ENDSCRIPT

SCRIPT STATECONTROL_standidle 
	
	IF AnimEquals [ Ped_M_FalldownA Ped_M_FalldownB Ped_M_FalldownC Ped_M_FalldownD Ped_M_FalldownE ] 
		
		Obj_WaitAnimFinished 
		IF AnimEquals Ped_M_FalldownA 
			PlayAnimWithPartialAnimIfExists Anim = Ped_M_GetUpA 
		ELSE 
			IF AnimEquals Ped_M_FalldownB 
				PlayAnimWithPartialAnimIfExists Anim = Ped_M_GetUpB 
			ELSE 
				IF AnimEquals Ped_M_FalldownC 
					PlayAnimWithPartialAnimIfExists Anim = Ped_M_GetUpC 
				ELSE 
					IF AnimEquals Ped_M_FalldownD 
						PlayAnimWithPartialAnimIfExists Anim = Ped_M_GetUpD 
					ELSE 
						PlayAnimWithPartialAnimIfExists Anim = Ped_M_GetUpE 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
		Obj_WaitAnimFinished 
	ENDIF 
	IF AnimEquals [ Ped_M_LayIdleA Ped_M_LayIdleB Ped_M_LayIdleC Ped_M_LayIdleD Ped_M_LayIdleE ] 
		
		IF AnimEquals Ped_M_LayIdleA 
			PlayAnimWithPartialAnimIfExists Anim = Ped_M_GetUpA 
		ELSE 
			IF AnimEquals Ped_M_LayIdleB 
				PlayAnimWithPartialAnimIfExists Anim = Ped_M_GetUpB 
			ELSE 
				IF AnimEquals Ped_M_LayIdleC 
					PlayAnimWithPartialAnimIfExists Anim = Ped_M_GetUpC 
				ELSE 
					IF AnimEquals Ped_M_LayIdleD 
						PlayAnimWithPartialAnimIfExists Anim = Ped_M_GetUpD 
					ELSE 
						PlayAnimWithPartialAnimIfExists Anim = Ped_M_GetUpE 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
		Obj_WaitAnimFinished 
	ENDIF 
	IF NOT GetSingleTag should_look_at_skater 
		<should_look_at_skater> = 0 
	ENDIF 
	IF ( <should_look_at_skater> = 1 ) 
		ped_standing_look_at_skater 
	ENDIF 
	BEGIN 
		GetRandomValue { name = speed resolution = 0.10000000149 a = 0.75000000000 b = 1.25000000000 } 
		Ped_Utils_GetAnimName Type = StandAnims 
		PlayAnimWithPartialAnimIfExists Anim = <AnimName> speed = <speed> 
		Obj_WaitAnimFinished 
		Ped_Utils_GetAnimName Type = StandAnims index = 0 
		PlayAnimWithPartialAnimIfExists Anim = <AnimName> Cycle 
		Wait RANDOM_RANGE PAIR(3.00000000000, 6.00000000000) seconds 
		Obj_SetAnimCycleMode off 
		Obj_WaitAnimFinished 
	REPEAT 
ENDSCRIPT

SCRIPT STATECONTROL_chick 
	BEGIN 
		GetRandomValue { name = speed resolution = 0.10000000149 a = 0.75000000000 b = 1.25000000000 } 
		PlayAnimWithPartialAnimIfExists Anim = Ped_F_Idle1 speed = <speed> 
		Obj_WaitAnimFinished 
		RANDOM(1, 1, 1) 
			RANDOMCASE printf "Idle" 
			PlayAnimWithPartialAnimIfExists Anim = Ped_F_Idle1 speed = <speed> 
			RANDOMCASE printf "Idle2" 
			PlayAnimWithPartialAnimIfExists Anim = Ped_F_Idle1ToIdle2 speed = <speed> 
			Obj_WaitAnimFinished 
			GetRandomValue name = RepeatCount a = 1 b = 4 resolution = 4 Integer 
			BEGIN 
				PlayAnimWithPartialAnimIfExists Anim = Ped_F_Idle2 speed = <speed> 
				Obj_WaitAnimFinished 
			REPEAT <RepeatCount> 
			PlayAnimWithPartialAnimIfExists Anim = Ped_F_Idle2ToIdle1 speed = <speed> 
			RANDOMCASE printf "Idle3" 
			PlayAnimWithPartialAnimIfExists Anim = Ped_F_Idle1ToIdle3 speed = <speed> 
			Obj_WaitAnimFinished 
			GetRandomValue name = RepeatCount a = 1 b = 4 resolution = 4 Integer 
			BEGIN 
				PlayAnimWithPartialAnimIfExists Anim = Ped_F_Idle3 speed = <speed> 
				Obj_WaitAnimFinished 
			REPEAT <RepeatCount> 
			PlayAnimWithPartialAnimIfExists Anim = Ped_F_Idle1ToIdle3 speed = <speed> backwards 
		RANDOMEND 
		Obj_WaitAnimFinished 
	REPEAT 
ENDSCRIPT

SCRIPT STATECONTROL_shot 
	ped_play_falldown_anim 
	Obj_SetOuterAvoidRadius 10 
	SetEventHandler { 
		ex = ObjectOutofAvoidRadius 
		Scr = Ped_Utils_EventHandler params = { SetState = STATE_getup event = ObjectOutofAvoidRadius } 
	} 
	BEGIN 
		Wait RANDOM(1, 1, 1) RANDOMCASE 10 RANDOMCASE 60 RANDOMCASE 90 RANDOMEND frames 
		ped_play_layidle_anim 
	REPEAT 
ENDSCRIPT

SCRIPT STATECONTROL_fall 
	IF SkaterSpeedLessThan 1 
		BEGIN 
			RANDOM(3, 1) 
				RANDOMCASE ped_play_idle_anim 
				RANDOMCASE ped_play_disgust_anim no_block 
			RANDOMEND 
			Obj_WaitAnimFinished 
			Obj_GetDistanceToObject skater 
			IF ( <objectDistance> < 3.00000000000 ) 
				BREAK 
			ENDIF 
			IF ( <objectDistance> > 4.00000000000 ) 
				goto ped_return_to_precollision_state 
			ENDIF 
		REPEAT 
	ENDIF 
	IF GotParam colObjId 
		<colObjId> : Obj_GetType 
		IF ( <ObjType> = OBJECT_TYPE_SKATER ) 
			<colObjId> : Vibrate port = 0 actuator = 1 percent = 100 duration = 0.15000000596 
		ENDIF 
	ENDIF 
	GetSingleTag pissed 
	<pissed> = ( <pissed> + 1 ) 
	IF ( <pissed> > 3 ) 
		SetTags pissed = <pissed> 
		Ped_SetLogicState STATE_knockdown Table = Ped_StateLogic_Table 
	ENDIF 
	Temp_Ped_Fall_Sound 
	Ped_Utils_PlayStream Type = avoid 
	ped_play_falldown_anim 
	Obj_SetOuterAvoidRadius 10 
	SetEventHandler { 
		ex = ObjectOutofAvoidRadius 
		Scr = Ped_Utils_EventHandler params = { SetState = STATE_getup event = ObjectOutofAvoidRadius } 
	} 
	BEGIN 
		Wait RANDOM(1, 1, 1) RANDOMCASE 10 RANDOMCASE 60 RANDOMCASE 90 RANDOMEND frames 
		ped_play_layidle_anim 
	REPEAT 
ENDSCRIPT

SCRIPT STATECONTROL_getup 
	
	ped_play_getup_anim 
	Ped_SetLogicState STATE_disgust Table = Ped_StateLogic_Table 
ENDSCRIPT

SCRIPT STATECONTROL_disgust 
	ped_initialize_projectile_exceptions 
	GetSingleTag should_look_at_skater 
	IF ( <should_look_at_skater> = 1 ) 
		ped_rotate_to_skater_from_idle 
	ENDIF 
	ped_play_disgust_anim 
	ped_initialize_movement 
	goto ped_return_to_precollision_state 
ENDSCRIPT

SCRIPT STATECONTROL_knockdown 
	Obj_LookAtObject Type = skater time = 0.05000000075 
	ped_play_attack_anim no_block 
	Wait 10 gameframes 
	IF GoalManager_CanStartGoal 
		Ped_Utils_GetVectorToPlayer 
		MakeSkaterGoto PedKnockDown params = { SetVelDir = <VecToPlayer> SetVelSpeed = 350 } 
	ENDIF 
	Obj_WaitAnimFinished 
	ped_rotate_to_skater_from_idle 
	Ped_SetLogicState STATE_disgust Table = Ped_StateLogic_Table 
ENDSCRIPT

SCRIPT STATECONTROL_avoidstop 
	Obj_SetInnerAvoidRadius 4 
	SetEventHandler { 
		ex = ObjectInAvoidRadius 
		Scr = Ped_Utils_EventHandler params = { SetState = STATE_avoidinit event = ObjectInAvoidRadius } 
	} 
	Ped_Utils_GetAnimName Type = StandAnims 
	PlayAnimWithPartialAnimIfExists Anim = <AnimName> Cycle 
	Wait 1 gameframe 
	GetSingleTag should_look_at_skater 
	IF ( <should_look_at_skater> = 0 ) 
		Ped_StateLogic_SetDefaultState 
		RETURN 
	ENDIF 
	BEGIN 
		ped_rotate_to_skater_from_idle 
		RANDOM(1, 1, 1, 1) 
			RANDOMCASE ped_play_idle_anim 
			RANDOMCASE ped_play_idle_anim 
			RANDOMCASE ped_play_idle_anim 
			RANDOMCASE ped_play_wave_anim 
		RANDOMEND 
		Obj_WaitAnimFinished 
		Obj_GetDistanceToObject skater 
		IF ( <objectDistance> > 12.00000000000 ) 
			ped_initialize_movement 
			goto ped_return_to_precollision_state 
		ENDIF 
	REPEAT 
ENDSCRIPT

SCRIPT STATECONTROL_avoidinit 
	ClearEventHandler ObjectInAttentionRadius 
	SetTags pissed = 0 
	Ped_RememberNextWaypoint 
	Ped_RememberCurrentPosition 
	Obj_StorePos 
	Ped_RememberStickToGround 
	Ped_SetLogicState STATE_avoidjump 
ENDSCRIPT

SCRIPT STATECONTROL_avoidjump 
	GetSingleTag pissed 
	SetTags pissed = ( <pissed> + 1 ) 
	Ped_Utils_GetAnimName Type = AvoidAnims 
	IF NOT Ped_SelectAvoidPoint <AnimName> 
		GetSingleTag move_type 
		IF NOT ( move_type = stand ) 
			Ped_SetLogicState STATE_avoidknockdown Table = Ped_StateLogic_Table 
		ENDIF 
	ENDIF 
	Ped_Utils_PlayStream Type = avoid 
	BEGIN 
		Ped_MoveTowardsAvoidPoint 
		Obj_StickToGround 
		IF Ped_AvoidPointReached 
			BREAK 
		ENDIF 
		Wait 1 gameframe 
	REPEAT 
	Ped_SetLogicState STATE_avoidland 
ENDSCRIPT

SCRIPT STATECONTROL_avoidland 
	<maxPissedCount> = RANDOM_RANGE PAIR(2.00000000000, 4.00000000000) 
	GetSingleTag pissed 
	IF ( <pissed> > <maxPissedCount> ) 
		Obj_SetInnerAvoidRadius 4 
		SetEventHandler { 
			ex = ObjectInAvoidRadius 
			Scr = Ped_Utils_EventHandler params = { SetState = STATE_avoidknockdown event = ObjectInAvoidRadius } 
		} 
	ELSE 
		Obj_SetInnerAvoidRadius 4 
		SetEventHandler { 
			ex = ObjectInAvoidRadius 
			Scr = Ped_Utils_EventHandler params = { SetState = STATE_avoidjump event = ObjectInAvoidRadius } 
		} 
	ENDIF 
	IF SkaterSpeedLessThan 1 
		<stopped> = 1 
	ELSE 
		<stopped> = 0 
	ENDIF 
	GetSingleTag move_type 
	BEGIN 
		Obj_GetDistanceToObject skater 
		IF ( <objectDistance> > 6.00000000000 ) 
			<stopped> = 0 
		ENDIF 
		IF ( <stopped> = 1 ) 
			ped_rotate_to_skater_from_idle 
			RANDOM(1, 1, 1) 
				RANDOMCASE ped_play_disgust_anim 
				RANDOMCASE ped_play_idle_anim 
				RANDOMCASE ped_play_idle_anim 
			RANDOMEND 
		ELSE 
			IF NOT ( <move_type> = stand ) 
				ped_rotate_to_node_from_idle 
			ENDIF 
			BREAK 
		ENDIF 
	REPEAT 
	BEGIN 
		Obj_GetDistanceToObject skater 
		IF ( <objectDistance> > 20.00000000000 ) 
			
			BREAK 
		ENDIF 
		Wait 1 gameframe 
	REPEAT 
	ped_initialize_movement 
	Ped_RestoreStickToGround 
	goto ped_return_to_precollision_state 
ENDSCRIPT

SCRIPT STATECONTROL_avoidknockdown 
	ped_rotate_to_skater_from_idle 
	ped_play_attack_anim no_block 
	Wait 10 gameframes 
	Obj_GetOrientationToObject skater 
	IF ( <dotProd> < 0.50000000000 ) 
		IF ( <dotProd> > -0.50000000000 ) 
			Obj_GetDistanceToObject skater 
			IF ( <objectDistance> < 6.00000000000 ) 
				Ped_Utils_GetVectorToPlayer 
				MakeSkaterGoto PedKnockDown params = { SetVelDir = <VecToPlayer> SetVelSpeed = 350 } 
				Obj_WaitAnimFinished 
			ENDIF 
		ENDIF 
	ENDIF 
	ped_initialize_movement 
	Ped_RestoreStickToGround 
	goto ped_return_to_precollision_state 
ENDSCRIPT

SCRIPT STATECONTROL_getattention 
	
	IF AnimEquals [ Ped_M_FalldownA Ped_M_FalldownB Ped_M_FalldownC Ped_M_FalldownD Ped_M_FalldownE ] 
		
		Obj_WaitAnimFinished 
		IF AnimEquals Ped_M_FalldownA 
			PlayAnimWithPartialAnimIfExists Anim = Ped_M_GetUpA 
		ELSE 
			IF AnimEquals Ped_M_FalldownB 
				PlayAnimWithPartialAnimIfExists Anim = Ped_M_GetUpB 
			ELSE 
				IF AnimEquals Ped_M_FalldownC 
					PlayAnimWithPartialAnimIfExists Anim = Ped_M_GetUpC 
				ELSE 
					IF AnimEquals Ped_M_FalldownD 
						PlayAnimWithPartialAnimIfExists Anim = Ped_M_GetUpD 
					ELSE 
						PlayAnimWithPartialAnimIfExists Anim = Ped_M_GetUpE 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
		Obj_WaitAnimFinished 
	ENDIF 
	IF AnimEquals [ Ped_M_LayIdleA Ped_M_LayIdleB Ped_M_LayIdleC Ped_M_LayIdleD Ped_M_LayIdleE ] 
		
		IF AnimEquals Ped_M_LayIdleA 
			PlayAnimWithPartialAnimIfExists Anim = Ped_M_GetUpA 
		ELSE 
			IF AnimEquals Ped_M_LayIdleB 
				PlayAnimWithPartialAnimIfExists Anim = Ped_M_GetUpB 
			ELSE 
				IF AnimEquals Ped_M_LayIdleC 
					PlayAnimWithPartialAnimIfExists Anim = Ped_M_GetUpC 
				ELSE 
					IF AnimEquals Ped_M_LayIdleD 
						PlayAnimWithPartialAnimIfExists Anim = Ped_M_GetUpD 
					ELSE 
						PlayAnimWithPartialAnimIfExists Anim = Ped_M_GetUpE 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
		Obj_WaitAnimFinished 
	ENDIF 
	SetEventHandler { 
		ex = SkaterLanded 
		Scr = Ped_TrickPos_EventHandler 
	} 
	SetEventHandler { 
		ex = SkaterBailed 
		Scr = Ped_TrickBail_EventHandler 
	} 
	BEGIN 
		IF NOT Obj_ObjectInAttentionRadius 
			Ped_Utils_SetMiscEventHandlers 
			Ped_StateLogic_SetDefaultState 
			RETURN 
		ENDIF 
		GetSingleTag should_look_at_skater 
		IF NOT ( <should_look_at_skater> = 0 ) 
			Obj_LookAtObject Type = skater time = 0.30000001192 
		ENDIF 
		Ped_Utils_PlayStream Type = Far 
		Ped_Utils_GetAnimName Type = GetAttentionAnims 
		PlayAnimWithPartialAnimIfExists Anim = <AnimName> 
		Obj_WaitAnimFinished 
		BEGIN 
			Ped_Utils_GetAnimName Type = IdleAnims 
			PlayAnimWithPartialAnimIfExists Anim = <AnimName> 
			Obj_WaitAnimFinished 
		REPEAT RANDOM_RANGE PAIR(1.00000000000, 3.00000000000) 
	REPEAT 
ENDSCRIPT

SCRIPT STATECONTROL_trickpositive 
	IF Obj_ObjectInAttentionRadius 
		Ped_Utils_PlayStream Type = trickpositive 
		ped_rotate_to_skater_from_idle 
		GetRandomValue name = RepeatCount a = 4 b = 10 Integer 
		BEGIN 
			Obj_LookAtObject Type = skater time = 0.30000001192 
			Obj_WaitRotate 
			Ped_Utils_GetAnimName Type = ImpressedAnims 
			PlayAnimWithPartialAnimIfExists Anim = <AnimName> 
			Obj_WaitAnimFinished 
		REPEAT <RepeatCount> 
	ENDIF 
	Ped_Utils_SetMiscEventHandlers 
	Ped_StateLogic_SetDefaultState 
ENDSCRIPT

SCRIPT STATECONTROL_trickbail 
	IF Obj_ObjectInAttentionRadius 
		Ped_Utils_PlayStream Type = trickbail 
		ped_rotate_to_skater_from_idle 
		Ped_Utils_GetAnimName Type = DisgustAnims 
		PlayAnimWithPartialAnimIfExists Anim = <AnimName> 
		Obj_WaitAnimFinished 
	ENDIF 
	Ped_Utils_SetMiscEventHandlers 
	Ped_StateLogic_SetDefaultState 
ENDSCRIPT

SCRIPT Ped_TrickPos_EventHandler 
	IF SkaterLastScoreLandedGreaterThan ped_min_notice_TrickScore 
		IF ( RANDOM_RANGE PAIR(0.00000000000, 100.00000000000) > -1 ) 
			Ped_SetLogicState STATE_trickpositive 
			RETURN 
		ENDIF 
	ENDIF 
	SetEventHandler { 
		ex = SkaterLanded 
		Scr = Ped_TrickPos_EventHandler 
	} 
ENDSCRIPT

SCRIPT Ped_TrickBail_EventHandler 
	IF ( RANDOM_RANGE PAIR(0.00000000000, 100.00000000000) > -1 ) 
		Ped_SetLogicState STATE_trickbail 
		RETURN 
	ENDIF 
	SetEventHandler { 
		ex = SkaterBailed 
		Scr = Ped_TrickBail_EventHandler 
	} 
ENDSCRIPT

SCRIPT STATECONTROL_blockerwait 
	OBJ_EnableAnimBlending enabled = 1 
	IF LevelIs load_bo 
		<stream> = RANDOM(1, 1, 1, 1, 1, 1, 1) 
			RANDOMCASE Ped_Attendant_Gap7_Block01 
			RANDOMCASE Ped_Attendant_Gap7_Block02 
			RANDOMCASE Ped_Attendant_Gap7_Block03 
			RANDOMCASE Ped_Attendant_Gap7_Block04 
			RANDOMCASE Ped_Attendant_Gap7_Block05 
			RANDOMCASE Ped_Attendant_Gap7_Block06 
			RANDOMCASE Ped_Attendant_Gap7_Block07 
		RANDOMEND 
		IF NOT IsStreamPlaying BostonDoctorStream 
			Obj_PlayStream <stream> vol = 200 dropoff = 160 priority = StreamPriorityHigh id = BostonDoctorStream 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT STATECONTROL_blockerstand 
	Wait 10 gameframes 
	Obj_SetAnimCycleMode off 
	Obj_WaitAnimFinished 
	Ped_Utils_SetMiscEventHandlers 
	ClearEventHandler BlockerStand 
	ClearEventHandler ObjectInAttentionRadius 
	PlayAnimWithPartialAnimIfExists Anim = Ped_Blocker_BlockA_idle Cycle BlendPeriod = 0.00999999978 
	<count> = 60 
	<toggle> = 0 
	BEGIN 
		IF NOT Obj_ObjectInAttentionRadius 
			Ped_Utils_SetMiscEventHandlers 
			Ped_StateLogic_SetDefaultState 
			RETURN 
		ENDIF 
		<count> = ( <count> - 1 ) 
		IF ( <count> = 0 ) 
			<toggle> = ( 1 - <toggle> ) 
			IF ( <toggle> = 0 ) 
				<count> = ( RANDOM_RANGE PAIR(3.00000000000, 6.00000000000) * 60 ) 
				PlayAnimWithPartialAnimIfExists Anim = Ped_Blocker_BlockA_idle Cycle 
			ELSE 
				<count> = ( 2 * 60 ) 
				PlayAnimWithPartialAnimIfExists Anim = Ped_Blocker_BlockB_idle Cycle 
			ENDIF 
		ENDIF 
		Wait 1 gameframe 
	REPEAT 
ENDSCRIPT

SCRIPT STATECONTROL_blockershuffle 
	Ped_Utils_SetMiscEventHandlers 
	ClearEventHandler BlockerShuffle 
	ClearEventHandler ObjectInAttentionRadius 
	IF ( <Dir> = left ) 
		IF Obj_AnimEquals name = Ped_Blocker_ShuffleBlockLeft 
			Obj_SetAnimCycleMode on 
		ELSE 
			PlayAnimWithPartialAnimIfExists Anim = Ped_Blocker_ShuffleBlockLeft Cycle BlendPeriod = 0.00999999978 speed = 1.39999997616 
		ENDIF 
	ELSE 
		IF Obj_AnimEquals name = Ped_Blocker_ShuffleBlockRight 
			Obj_SetAnimCycleMode on 
		ELSE 
			PlayAnimWithPartialAnimIfExists Anim = Ped_Blocker_ShuffleBlockRight Cycle BlendPeriod = 0.00999999978 speed = 1.39999997616 
		ENDIF 
	ENDIF 
	BEGIN 
		IF NOT Obj_ObjectInAttentionRadius 
			Ped_Utils_SetMiscEventHandlers 
			Ped_StateLogic_SetDefaultState 
			RETURN 
		ENDIF 
		Wait 1 gameframe 
	REPEAT 
ENDSCRIPT

SCRIPT STATECONTROL_blockerrun 
	Ped_Utils_SetMiscEventHandlers 
	ClearEventHandler BlockerRun 
	ClearEventHandler ObjectInAttentionRadius 
	Ped_Utils_GetAnimName Type = RunAnims 
	PlayAnimWithPartialAnimIfExists Anim = <AnimName> Cycle BlendPeriod = 0.20000000298 
	BEGIN 
		IF NOT Obj_ObjectInAttentionRadius 
			Ped_Utils_SetMiscEventHandlers 
			Ped_StateLogic_SetDefaultState 
			RETURN 
		ENDIF 
		Wait 1 gameframe 
	REPEAT 
ENDSCRIPT

SCRIPT STATECONTROL_blockerbump 
	ped_play_attack_anim no_block 
	MakeSkaterGoto PedKnockDown params = { SetVelDir = <VelDir> SetVelSpeed = 700 } 
	Obj_WaitAnimFinished 
	Ped_Utils_SetMiscEventHandlers 
	Ped_SetLogicState STATE_blockerstand 
ENDSCRIPT

SCRIPT STATECONTROL_chase 
	Ped_Utils_GetAnimName Type = RunAnims 
	PlayAnimWithPartialAnimIfExists Anim = <AnimName> Cycle 
ENDSCRIPT

SCRIPT STATECONTROL_chasepause 
	BEGIN 
		Ped_Utils_GetAnimName Type = StandAnims index = 0 
		GetRandomValue name = RepeatCount a = 1 b = 3 Integer 
		BEGIN 
			ped_rotate_to_skater_from_idle 
			PlayAnimWithPartialAnimIfExists Anim = <AnimName> 
			Obj_WaitAnimFinished 
		REPEAT <RepeatCount> 
		ped_rotate_to_skater_from_idle 
		Ped_Utils_GetAnimName Type = DisgustAnims 
		PlayAnimWithPartialAnimIfExists Anim = <AnimName> 
		Obj_WaitAnimFinished 
	REPEAT 
ENDSCRIPT

SCRIPT STATECONTROL_chasecatch 
	ped_play_attack_anim no_block 
	
	IF GetSingleTag CatchScript 
		goto <CatchScript> 
	ELSE 
		Wait 3 seconds 
		Ped_SetLogicState STATE_chase 
	ENDIF 
ENDSCRIPT

SCRIPT STATECONTROL_gohome 
	Ped_StateLogic_RegisterTempDefaultState { State = STATE_gohome Table = Ped_StateLogic_Table } 
	Ped_Utils_GetAnimName Type = WalkAnims 
	PlayAnimWithPartialAnimIfExists Anim = <AnimName> Cycle UseAnimTags 
ENDSCRIPT

SCRIPT PEDAI_Sitting_StopWayPoint 
	Ped_StopMoving 
	Ped_GetCurrentNodeNames 
	Obj_MoveToNode name = <node_from> speed = 5 mph 
	Obj_WaitMove 
	Ped_StartMoving 
	Ped_SetLogicState STATE_Sitting Table = Ped_StateLogic_Table 
ENDSCRIPT

SCRIPT STATECONTROL_Sitting 
	
	Ped_TurnToCurrentWaypointOrientation time = 0.75000000000 
	Ped_Utils_GetAnimName Type = TurnAnims 
	PlayAnimWithPartialAnimIfExists Anim = <AnimName> Cycle 
	Obj_WaitRotate 
	PlayAnimWithPartialAnimIfExists Anim = Ped_STND2SIT 
	Obj_WaitAnimFinished 
	BEGIN 
		GetRandomValue name = RepeatCount a = 5 b = 15 resolution = 10 Integer 
		RANDOM(1, 1, 1, 1, 1) 
			RANDOMCASE GetRandomValue name = RepeatIdle a = 5 b = 50 resolution = 45 Integer 
			OBJ_cycleanim Anim = Ped_SIT_Idle NumCycles = <ReapeatIdle> 
			RANDOMCASE PlayAnimWithPartialAnimIfExists Anim = PED_SIT_Tap 
			RANDOMCASE PlayAnimWithPartialAnimIfExists Anim = PED_SIT_LookR 
			RANDOMCASE PlayAnimWithPartialAnimIfExists Anim = PED_SIT_LookL 
			RANDOMCASE PlayAnimWithPartialAnimIfExists Anim = Ped_SIt2SITB 
			Obj_WaitAnimFinished 
			BEGIN 
				RANDOM(1, 1, 1) 
					RANDOMCASE GetRandomValue name = RepeatIdleB a = 2 b = 10 resolution = 8 Integer 
					OBJ_cycleanim Anim = Ped_sitB_idle NumCycles = <ReapeatIdleB> 
					RANDOMCASE PlayAnimWithPartialAnimIfExists Anim = Ped_sitB_lookL 
					RANDOMCASE PlayAnimWithPartialAnimIfExists Anim = Ped_sitB_LookR 
				RANDOMEND 
				Obj_WaitAnimFinished 
			REPEAT 5 
			PlayAnimWithPartialAnimIfExists Anim = Ped_SItB2SITBL 
			Obj_WaitAnimFinished 
			BEGIN 
				RANDOM(1, 1, 1, 1, 1) 
					RANDOMCASE GetRandomValue name = RepeatIdleBL a = 2 b = 10 resolution = 8 Integer 
					OBJ_cycleanim Anim = Ped_sitBL_idle NumCycles = <ReapeatIdleBL> 
					RANDOMCASE PlayAnimWithPartialAnimIfExists Anim = Ped_sitBL_lookL 
					RANDOMCASE PlayAnimWithPartialAnimIfExists Anim = Ped_sitBL_Shake 
					RANDOMCASE PlayAnimWithPartialAnimIfExists Anim = Ped_sitBL_Shake 
					RANDOMCASE PlayAnimWithPartialAnimIfExists Anim = Ped_sitBL_Tap 
				RANDOMEND 
				Obj_WaitAnimFinished 
			REPEAT 5 
			PlayAnimWithPartialAnimIfExists Anim = Ped_SITBL2SIT 
		RANDOMEND 
		Obj_WaitAnimFinished 
	REPEAT <RepeatCount> 
	PlayAnimWithPartialAnimIfExists Anim = Ped_SIT2STND 
	Obj_WaitAnimFinished 
	Ped_StateLogic_SetDefaultState 
ENDSCRIPT

SCRIPT PEDAI_Vending_StopWayPoint 
	Ped_StopMoving 
	Ped_GetCurrentNodeNames 
	Obj_MoveToNode name = <node_from> speed = 5 mph 
	Obj_WaitMove 
	Ped_StartMoving 
	Ped_SetLogicState STATE_Vending Table = Ped_StateLogic_Table 
ENDSCRIPT

SCRIPT STATECONTROL_Vending 
	Ped_GetGender 
	Ped_TurnToCurrentWaypointOrientation time = 0.75000000000 
	IF ( <Gender> = male ) 
		PlayAnimWithPartialAnimIfExists Anim = Ped_M_Walk1ToIdle 
		Obj_WaitAnimFinished 
		PlayAnimWithPartialAnimIfExists Anim = Ped_M_IdletoATM 
		Obj_WaitAnimFinished 
		BEGIN 
			RANDOM(1, 1) 
				RANDOMCASE PlayAnimWithPartialAnimIfExists Anim = Ped_M_ATM1 
				RANDOMCASE PlayAnimWithPartialAnimIfExists Anim = Ped_M_ATM2 
			RANDOMEND 
			Obj_WaitAnimFinished 
		REPEAT 5 
		PlayAnimWithPartialAnimIfExists Anim = Ped_M_ATMtoIdle 
		Obj_WaitAnimFinished 
		PlayAnimWithPartialAnimIfExists Anim = Ped_M_Walk1FromIdle 
		Obj_WaitAnimFinished 
	ELSE 
		PEDAI_Female_StopWayPoint 
	ENDIF 
	Ped_StateLogic_SetDefaultState 
ENDSCRIPT

SCRIPT PEDAI_Corner_StopWayPoint 
	Ped_StopMoving 
	Ped_GetCurrentNodeNames 
	Obj_MoveToNode name = <node_from> speed = 5 mph 
	Obj_WaitMove 
	Ped_StartMoving 
	Ped_SetLogicState STATE_Corner Table = Ped_StateLogic_Table 
ENDSCRIPT

SCRIPT STATECONTROL_Corner 
	Ped_TurnToCurrentWaypointOrientation time = 0.75000000000 
	Ped_GetGender 
	IF ( <Gender> = male ) 
		BEGIN 
			PlayAnimWithPartialAnimIfExists Anim = Ped_M_LookLeftDown 
			Obj_WaitAnimFinished 
			PlayAnimWithPartialAnimIfExists Anim = Ped_M_Lookright 
			Obj_WaitAnimFinished 
		REPEAT 2 
	ELSE 
		PEDAI_Female_StopWayPoint 
	ENDIF 
	Ped_StateLogic_SetDefaultState 
ENDSCRIPT

SCRIPT PEDAI_Arcade_StopWayPoint 
	Ped_StopMoving 
	Ped_GetCurrentNodeNames 
	Obj_MoveToNode name = <node_from> speed = 5 mph 
	Obj_WaitMove 
	Ped_StartMoving 
	Ped_SetLogicState STATE_Arcade Table = Ped_StateLogic_Table 
ENDSCRIPT

SCRIPT STATECONTROL_Arcade 
	Ped_GetGender 
	Ped_TurnToCurrentWaypointOrientation time = 0.75000000000 
	IF ( <Gender> = male ) 
		PlayAnimWithPartialAnimIfExists Anim = Ped_M_Walk1ToIdle 
		Obj_WaitAnimFinished 
		PlayAnimWithPartialAnimIfExists Anim = Ped_M_Idle1toArcade 
		Obj_WaitAnimFinished 
		BEGIN 
			RANDOM(1, 1, 1) 
				RANDOMCASE PlayAnimWithPartialAnimIfExists Anim = Ped_M_ArcadeIdle 
				RANDOMCASE PlayAnimWithPartialAnimIfExists Anim = Ped_M_Arcade1 
				RANDOMCASE PlayAnimWithPartialAnimIfExists Anim = Ped_M_Arcade2 
			RANDOMEND 
			Obj_WaitAnimFinished 
		REPEAT 5 
		PlayAnimWithPartialAnimIfExists Anim = Ped_M_ArcadetoIdle 
		Obj_WaitAnimFinished 
		PlayAnimWithPartialAnimIfExists Anim = Ped_M_Walk1FromIdle 
		Obj_WaitAnimFinished 
		Ped_StateLogic_SetDefaultState 
	ELSE 
		PEDAI_Female_StopWayPoint 
	ENDIF 
ENDSCRIPT

SCRIPT PEDAI_LookAt_StopWayPoint 
	Ped_StopMoving 
	Ped_GetCurrentNodeNames 
	Obj_MoveToNode name = <node_from> speed = 5 mph 
	Obj_WaitMove 
	Ped_StartMoving 
	Ped_SetLogicState STATE_LookAt Table = Ped_StateLogic_Table 
ENDSCRIPT

SCRIPT STATECONTROL_LookAt 
	Ped_GetGender 
	Ped_TurnToCurrentWaypointOrientation time = 0.75000000000 
	IF ( <Gender> = male ) 
		PlayAnimWithPartialAnimIfExists Anim = Ped_M_Walk1ToIdle 
		Obj_WaitAnimFinished 
		PlayAnimWithPartialAnimIfExists Anim = Ped_M_IdletoObserve 
		Obj_WaitAnimFinished 
		BEGIN 
			RANDOM(1, 1, 1, 1) 
				RANDOMCASE PlayAnimWithPartialAnimIfExists Anim = Ped_M_ObserveIdle 
				RANDOMCASE PlayAnimWithPartialAnimIfExists Anim = Ped_M_ObserveScratch 
				RANDOMCASE PlayAnimWithPartialAnimIfExists Anim = Ped_M_ObserveWipe 
				RANDOMCASE PlayAnimWithPartialAnimIfExists Anim = Ped_M_Observe02 
			RANDOMEND 
			Obj_WaitAnimFinished 
		REPEAT 5 
		PlayAnimWithPartialAnimIfExists Anim = Ped_M_ObservetoIdle 
		Obj_WaitAnimFinished 
		PlayAnimWithPartialAnimIfExists Anim = Ped_M_Walk1FromIdle 
		Obj_WaitAnimFinished 
	ELSE 
		PEDAI_Female_StopWayPoint 
	ENDIF 
	Ped_StateLogic_SetDefaultState 
ENDSCRIPT

SCRIPT PEDAI_Wait_StopWayPoint 
	Ped_StopMoving 
	Ped_GetCurrentNodeNames 
	Obj_MoveToNode name = <node_from> speed = 5 mph 
	Obj_WaitMove 
	Ped_StartMoving 
	Ped_SetLogicState STATE_Wait Table = Ped_StateLogic_Table 
ENDSCRIPT

SCRIPT STATECONTROL_Wait 
	Ped_GetGender 
	Ped_TurnToCurrentWaypointOrientation time = 0.75000000000 
	IF ( <Gender> = male ) 
		PlayAnimWithPartialAnimIfExists Anim = Ped_M_Walk1ToIdle 
		Obj_WaitAnimFinished 
		BEGIN 
			RANDOM(1, 1) 
				RANDOMCASE PlayAnimWithPartialAnimIfExists Anim = Ped_M_LookAtWatch 
				RANDOMCASE PlayAnimWithPartialAnimIfExists Anim = Ped_M_LookAtWatch2 
			RANDOMEND 
			Obj_WaitAnimFinished 
		REPEAT 5 
		PlayAnimWithPartialAnimIfExists Anim = Ped_M_Walk1FromIdle 
		Obj_WaitAnimFinished 
	ELSE 
		PEDAI_Female_StopWayPoint 
	ENDIF 
	Ped_StateLogic_SetDefaultState 
ENDSCRIPT

SCRIPT PEDAI_TALK_StopWayPoint 
	Ped_StopMoving 
	Ped_GetCurrentNodeNames 
	Obj_MoveToNode name = <node_from> speed = 5 mph 
	Obj_WaitMove 
	Ped_StartMoving 
	Ped_SetLogicState STATE_Talk Table = Ped_StateLogic_Table 
ENDSCRIPT

SCRIPT STATECONTROL_Talk 
	
	Ped_TurnToCurrentWaypointOrientation time = 0.75000000000 
	BEGIN 
		RANDOM(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1) 
			RANDOMCASE PlayAnimWithPartialAnimIfExists Anim = Ped_M_Talk2_Idle 
			RANDOMCASE PlayAnimWithPartialAnimIfExists Anim = Ped_M_Talk2_Idle2 
			RANDOMCASE PlayAnimWithPartialAnimIfExists Anim = Ped_M_Talk2_RightHere 
			RANDOMCASE PlayAnimWithPartialAnimIfExists Anim = Ped_M_Talk2_MixIt 
			RANDOMCASE PlayAnimWithPartialAnimIfExists Anim = Ped_M_Talk2_SureThing 
			RANDOMCASE PlayAnimWithPartialAnimIfExists Anim = Ped_M_Talk2_Maybe 
			RANDOMCASE PlayAnimWithPartialAnimIfExists Anim = Ped_M_Talk2_WhatDoYouThink 
			RANDOMCASE PlayAnimWithPartialAnimIfExists Anim = Ped_M_Talk2_OfCourse 
			RANDOMCASE PlayAnimWithPartialAnimIfExists Anim = Ped_M_Talk2_BackThere 
			RANDOMCASE PlayAnimWithPartialAnimIfExists Anim = Ped_M_Talk2_RoundAndRound 
			RANDOMCASE PlayAnimWithPartialAnimIfExists Anim = Ped_M_Talk2_UpAbove 
			RANDOMCASE PlayAnimWithPartialAnimIfExists Anim = Ped_M_Talk2_KnowWhatIMean 
			RANDOMCASE PlayAnimWithPartialAnimIfExists Anim = Ped_M_Talk2_GoAhead 
			RANDOMCASE PlayAnimWithPartialAnimIfExists Anim = Ped_M_Talk2_TheyllTellYou 
		RANDOMEND 
		Obj_WaitAnimFinished 
	REPEAT 
ENDSCRIPT

SCRIPT PEDAI_Female_StopWayPoint 
	PlayAnimWithPartialAnimIfExists Anim = Ped_F_WalkToIdle1 
	Obj_WaitAnimFinished 
	BEGIN 
		RANDOM(1, 1) 
			RANDOMCASE PlayAnimWithPartialAnimIfExists Anim = Ped_F_Idle1 
			RANDOMCASE PlayAnimWithPartialAnimIfExists Anim = Ped_F_Idle1ToIdle2 
			Obj_WaitAnimFinished 
			BEGIN 
				PlayAnimWithPartialAnimIfExists Anim = Ped_F_Idle2 
				Obj_WaitAnimFinished 
			REPEAT 3 
			PlayAnimWithPartialAnimIfExists Anim = Ped_F_Idle2ToIdle1 
		RANDOMEND 
		Obj_WaitAnimFinished 
	REPEAT 5 
	PlayAnimWithPartialAnimIfExists Anim = Ped_F_WalkFromIdle1 
	Obj_WaitAnimFinished 
	Ped_StateLogic_SetDefaultState 
ENDSCRIPT

SCRIPT STATECONTROL_Explode 
	IF LevelIs load_no 
		Zombie_SFX_Die 
	ENDIF 
	BroadcastEvent Type = Zombie_Explode 
	PlayAnimWithPartialAnimIfExists Anim = default 
	dismember bone = bone_head MaxVel = 50 MaxRotVel = 2 
	CreateFlexibleParticleSystem name = ZombieFlareUp params_script = JEG_Zombie_FlareUp_particle_params 
	CreateFlexibleParticleSystem name = ZombieBurst params_script = JEG_Zombie_burst_particle_params 
	Wait 2 gameframes 
	dismember bone = Bone_Knee_R MaxVel = 40 MaxRotVel = 6 
	dismember bone = Bone_Knee_L MaxVel = 50 MaxRotVel = 5 
	dismember bone = Bone_Forearm_R MaxVel = 30 MaxRotVel = 4 
	dismember bone = Bone_Forearm_L MaxVel = 50 MaxRotVel = 3 
	Wait 1 gameframes 
	dismember bone = bone_bicep_R MaxVel = 40 MaxRotVel = 6 
	dismember bone = bone_bicep_L MaxVel = 50 MaxRotVel = 5 
	dismember bone = Bone_Thigh_R MaxVel = 30 MaxRotVel = 4 
	dismember bone = Bone_Thigh_L MaxVel = 50 MaxRotVel = 3 
	Wait 1 gameframes 
	dismember bone = bone_pelvis 
	Wait 180 gameframes 
	DestroyFlexibleParticleSystem name = ZombieFlareUp 
	DestroyFlexibleParticleSystem name = ZombieBurst 
	Obj_GetID 
	<objID> : Die 
ENDSCRIPT


