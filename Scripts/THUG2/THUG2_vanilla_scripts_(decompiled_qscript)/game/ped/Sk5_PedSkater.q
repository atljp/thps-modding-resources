
SkaterPed_StateTable = { 
	STATE_skating = { 
		ped_update_type = skater_move_update 
		script_ped_state = ped_skater_idle 
	} 
	STATE_stop = { 
		script_ped_state = ped_skater_stop 
	} 
	STATE_bail = { 
		ped_update_type = bail_move_update 
		script_ped_state = ped_skater_generic_bail 
	} 
	STATE_bailgrind = { 
		ped_update_type = bail_move_update 
		script_ped_state = ped_skater_grind_bail 
	} 
	STATE_tricklip = { 
		ped_update_type = lip_trick_update 
		script_ped_state = ped_skater_lip_trick 
	} 
	STATE_trickgrab = { 
		ped_update_type = skater_move_update 
		script_ped_state = ped_skater_grab_trick 
	} 
	STATE_trickflip = { 
		script_ped_state = ped_skater_flip_trick 
	} 
	STATE_grind = { 
		ped_update_type = skater_move_update 
		script_ped_state = ped_skater_grind 
	} 
	STATE_grindoff = { 
		ped_update_type = skater_move_update 
		script_ped_state = ped_skater_grind_off 
	} 
	STATE_land = { 
		ped_update_type = skater_move_update 
		script_ped_state = ped_skater_land 
	} 
	STATE_manual = { 
		ped_update_type = skater_move_update 
		script_ped_state = ped_skater_manual 
	} 
	STATE_manualdown = { 
		ped_update_type = skater_move_update 
		script_ped_state = ped_skater_manual_down 
	} 
	STATE_jump = { 
		ped_update_type = skater_move_update 
		script_ped_state = ped_skater_jump 
	} 
	STATE_jumpvert = { 
		ped_update_type = skater_move_update 
		script_ped_state = ped_skater_vert_jump 
	} 
	STATE_jumpcrouch = { 
		ped_update_type = skater_move_update 
		script_ped_state = ped_skater_crouch_for_jump 
	} 
	STATE_rolloff = { 
		script_ped_state = ped_skater_roll_off 
	} 
} 
SCRIPT ped_skater_grind 
	Obj_ShadowOff 
	Ped_ApplySpeedBoost percent = 135 
	GetRandomArrayElement ped_skater_grind_tricks 
	goto ( <element> . TrickScript ) 
ENDSCRIPT

SCRIPT Ped_Skater_BeginGrind 
	<init_anim> = <initanim> 
	<range_anim> = <anim> 
	<out_anim> = <outanim> 
	<bail_script> = <grindbail> 
	SetTags { 
		grind_init_anim = <init_anim> 
		grind_range_anim = <range_anim> 
		grind_out_anim = <out_anim> 
		bail_script = <bail_script> 
	} 
	Obj_PlayAnim anim = <init_anim> 
	Obj_WaitAnimFinished 
	<wobble_to> = RANDOM(1, 1) RANDOMCASE Start RANDOMCASE End RANDOMEND 
	Obj_PlayAnim anim = <range_anim> PingPong From = Current To = <wobble_to> Speed = 0.89999997616 BlendPeriod = 0.40000000596 
ENDSCRIPT

SCRIPT ped_skater_grind_off 
	IF GetSingleTag grind_out_anim 
		Obj_PlayAnim anim = <grind_out_anim> 
	ELSE 
		GetSingleTag grind_init_anim 
		Obj_PlayAnim anim = <grind_init_anim> backwards 
	ENDIF 
	Ped_SetLogicState STATE_rolloff Table = SkaterPed_StateTable 
ENDSCRIPT

SCRIPT ped_skater_grind_bail 
	SpawnSound Ped_Skater_Grind_Bail_Sound 
	IF GetSingleTag bail_script 
		SetTags BailType = grind 
		goto <bail_script> 
	ENDIF 
ENDSCRIPT

SCRIPT Ped_Skater_BeginBail 
	<CrntBailAnim> = <Anim1> 
	<CrntGetUpAnim> = <Endpose> 
	Ped_SetIsBailing 1 
	IF GetSingleTag BailType 
		IF ( <BailType> = grind ) 
			Ped_SetIsBailing grind 1 
		ENDIF 
	ENDIF 
	Ped_HideBoard 1 
	Ped_StoreMaxVelocity 
	Obj_SetPathDeceleration ped_skater_bail_deceleration 
	Obj_SetPathVelocity 0 
	Obj_PlayAnim anim = <CrntBailAnim> NoRestart BlendPeriod = 0.30000001192 
	Obj_WaitAnimFinished 
	Obj_PlayAnim anim = Ped_M_LayIdleE cycle 
	BEGIN 
		IF NOT Obj_ObjectInRadius type = skater radius = 3 
			BREAK 
		ENDIF 
		Wait 1 second 
	REPEAT 
	Obj_PlayAnim anim = <CrntGetUpAnim> BlendPeriod = 0.40000000596 
	Obj_WaitAnimFinished 
	Ped_GetOriginalMaxVelocity 
	Obj_SetPathVelocity <original_max_velocity> ips 
	Ped_SetIsBailing 0 
	IF GotParam BailType 
		IF ( <BailType> = grind ) 
			Ped_SetIsBailing grind 0 
			Ped_SetIsGrinding 1 
		ENDIF 
	ENDIF 
	Ped_HideBoard 0 
	Obj_SetPathDeceleration 0 
	Ped_SetLogicState STATE_skating Table = SkaterPed_StateTable 
ENDSCRIPT

SCRIPT ped_skater_crouch_for_jump 
	Obj_PlayAnim anim = Crouch 
	Obj_WaitAnimFinished 
	Obj_PlayAnim anim = CrouchIdle cycle 
ENDSCRIPT

SCRIPT ped_skater_jump 
	Obj_ShadowOff 
	IF NOT GotParam jumpSpeed 
		<jumpSpeed> = ped_skater_jump_speed 
	ENDIF 
	Ped_PlayJumpSound 
	IF GotParam land_height 
		Obj_Jump { Speed = <jumpSpeed> 
			gravity = ped_skater_jump_gravity 
			heading = <heading> 
			land_height = <land_height> 
		} 
	ELSE 
		Obj_Jump { 
			Speed = <jumpSpeed> 
			gravity = ped_skater_jump_gravity 
		} 
	ENDIF 
	Ped_ActivateAuxScript name = ped_skater_play_midair_anim params = { anim = Ollie } 
	Obj_WaitJumpFinished 
	Ped_DeactivateAuxScript 
	Ped_PlayLandSound 
	Ped_RemoveSpeedBoost 
	IF GotParam land_height 
		IF GotParam should_land 
			Ped_SetLogicState STATE_land Table = SkaterPed_StateTable 
		ENDIF 
		Ped_StartMoving 
		Ped_HitWaypoint 
	ELSE 
		Ped_SetLogicState STATE_land Table = SkaterPed_StateTable 
	ENDIF 
ENDSCRIPT

SCRIPT ped_skater_vert_jump 
	Obj_ShadowOff 
	Ped_StopMoving 
	IF NOT GotParam jumpSpeed 
		<jumpSpeed> = ped_skater_jump_speed 
	ENDIF 
	Obj_PlayAnim anim = Ollie 
	Ped_PlayJumpSound 
	Obj_Jump heading = <heading> Speed = ( <jumpSpeed> * ped_skater_vert_jump_speed_slop ) gravity = ped_skater_jump_gravity 
	Obj_WaitAnimFinished 
	Obj_PlayAnim anim = AirIdle cycle 
	Obj_WaitJumpFinished 
	Ped_PlayLandSound 
	IF GotParam should_flip 
		Obj_Flip 
	ENDIF 
	Ped_StartMoving 
	Ped_Utils_GetAnimName type = CrouchedLandAnims 
	Ped_SetLogicState STATE_land Table = SkaterPed_StateTable StateParams = { anim = <AnimName> } 
ENDSCRIPT

SCRIPT ped_skater_roll_off 
	Obj_ShadowOff 
	Ped_StopMoving 
	Ped_GetCurrentVelocity 
	Obj_Jump use_current_heading Speed = <velocity> gravity = ped_skater_jump_gravity 
	Obj_WaitJumpFinished 
	Ped_PlayLandSound 
	Ped_StartMoving 
	Ped_SetLogicState STATE_land Table = SkaterPed_StateTable 
ENDSCRIPT

SCRIPT ped_skater_grab_trick 
	Obj_ShadowOff 
	IF NOT GotParam jumpSpeed 
		<jumpSpeed> = ped_skater_jump_speed 
	ENDIF 
	IF GotParam is_vert 
		Ped_StopMoving 
	ENDIF 
	IF NOT GotParam anim 
		GetConfigurableTricksFromType type = GrabTrick 
		GetRandomArrayElement <ConfigurableTricks> 
		<trick_params> = ( <element> . params ) 
		<anim> = ( <trick_params> . anim ) 
		<idle_anim> = ( <trick_params> . Idle ) 
		IF StructureContains structure = <trick_params> outanim 
			<out_anim> = ( <trick_params> . outanim ) 
		ENDIF 
	ENDIF 
	Ped_PlayJumpSound 
	IF GotParam is_vert 
		Obj_Jump heading = <heading> Speed = <jumpSpeed> gravity = ped_skater_jump_gravity 
	ELSE 
		IF ( <is_jumping> = 0 ) 
			Obj_Jump Speed = <jumpSpeed> gravity = ped_skater_jump_gravity 
		ENDIF 
	ENDIF 
	Obj_PlayAnim anim = <anim> 
	Ped_ActivateAuxScript name = ped_skater_wait_and_stop_grab_anim params = <...> 
	Obj_WaitJumpFinished 
	Ped_PlayLandSound 
	Ped_DeactivateAuxScript 
	IF GotParam is_vert 
		IF GotParam should_flip 
			Obj_Flip 
		ENDIF 
		Ped_StartMoving 
		Ped_Utils_GetAnimName type = CrouchedLandAnims 
	ELSE 
		Ped_Utils_GetAnimName type = LandAnims 
	ENDIF 
	Ped_SetLogicState STATE_land Table = SkaterPed_StateTable StateParams = { anim = <AnimName> } 
ENDSCRIPT

SCRIPT ped_skater_stop 
	Ped_StoreMaxVelocity 
	IF NOT GotParam deceleration 
		<deceleration> = ped_skater_stop_deceleration 
	ENDIF 
	Obj_SetPathDeceleration <deceleration> 
	Obj_SetPathVelocity 0 
	BEGIN 
		Ped_GetCurrentVelocity 
		IF ( <velocity> = 0 ) 
			Ped_StopMoving 
			BREAK 
		ENDIF 
		Wait 1 frame 
	REPEAT 
	Obj_PlayAnim anim = NewBrake 
	Obj_WaitAnimFinished 
	IF GotParam RandomStopTime 
		<StopTime> = RANDOM_RANGE PAIR(1.00000000000, 30.00000000000) 
	ENDIF 
	IF GotParam StopTime 
		IF ( <StopTime> > 0 ) 
			Ped_ActivateAuxScript name = ped_skater_wait_and_start_moving params = { StopTime = <StopTime> } 
		ENDIF 
	ENDIF 
	GetSingleTag brake_idle_anims 
	IF NOT GotParam brake_idle_anims 
		<brake_idle_anims> = ped_skater_brake_idle_anims 
	ENDIF 
	BEGIN 
		GetRandomArrayElement <brake_idle_anims> 
		Obj_PlayAnim anim = <element> 
		Obj_WaitAnimFinished 
	REPEAT 
ENDSCRIPT

SCRIPT ped_skater_manual 
	Obj_ShadowOn 
	SWITCH <ManualType> 
		CASE Manual 
			SetTags manual_out_anim = PutDownManual 
			init_anim = Manual 
			range_anim = Manual_range 
		CASE Handstand 
			SetTags manual_out_anim = RustySlide_Out 
			init_anim = RustySlide_Init 
			range_anim = Primo_Range 
		DEFAULT 
			SetTags manual_out_anim = PutDownManual 
			init_anim = Manual 
			range_anim = Manual_range 
	ENDSWITCH 
	Obj_PlayAnim anim = <init_anim> 
	Obj_WaitAnimFinished 
	Obj_PlayAnim anim = <range_anim> PingPong From = Start To = End Speed = 1.10000002384 BlendPeriod = 0.40000000596 
ENDSCRIPT

SCRIPT ped_skater_manual_down 
	Obj_ShadowOn 
	IF NOT GetSingleTag manual_out_anim 
		<manual_out_anim> = PutDownManual 
	ENDIF 
	Obj_PlayAnim anim = <manual_out_anim> 
	Obj_WaitAnimFinished 
	Ped_SetLogicState STATE_skating Table = SkaterPed_StateTable 
ENDSCRIPT

SCRIPT ped_skater_lip_trick 
	Obj_ShadowOff 
	Ped_StopMoving 
	IF NOT GotParam anim 
		GetConfigurableTricksFromType type = LipMacro2 
		GetRandomArrayElement <ConfigurableTricks> 
		<trick_params> = ( <element> . params ) 
		<init_anim> = ( <trick_params> . initanim ) 
		<anim> = ( <trick_params> . anim ) 
		<out_anim> = ( <trick_params> . outanim ) 
	ENDIF 
	Obj_PlayAnim anim = <init_anim> BlendPeriod = 0.40000000596 
	Obj_WaitAnimFinished 
	IF NOT GotParam HoldLipTime 
		<HoldLipTime> = RANDOM_RANGE PAIR(1.00000000000, 3.00000000000) 
	ENDIF 
	Obj_PlayAnim anim = <anim> PingPong From = Current To = Start Speed = 0.89999997616 BlendPeriod = 0.40000000596 
	Wait <HoldLipTime> seconds 
	Obj_PlayAnim anim = <out_anim> BlendPeriod = 0.40000000596 
	IF NOT StructureContains structure = <trick_params> FlipAfter 
		Obj_Flip 
	ENDIF 
	Obj_WaitAnimFinished 
	Ped_StartMoving 
	Ped_SetLogicState STATE_land Table = SkaterPed_StateTable 
ENDSCRIPT

SCRIPT ped_skater_flip_trick 
	Obj_ShadowOff 
	IF GotParam is_vert 
		Ped_StopMoving 
	ENDIF 
	IF ( <is_jumping> = 0 ) 
		Obj_PlayAnim anim = Ollie 
		IF GotParam is_vert 
			<jumpSpeed> = ( <jumpSpeed> * ped_skater_vert_jump_speed_slop ) 
		ENDIF 
		Ped_PlayJumpSound 
		IF GotParam land_height 
			Obj_Jump { Speed = <jumpSpeed> 
				gravity = ped_skater_jump_gravity 
				heading = <heading> 
				land_height = <land_height> 
			} 
		ELSE 
			Obj_Jump { 
				Speed = <jumpSpeed> 
				heading = <heading> 
				gravity = ped_skater_jump_gravity 
			} 
		ENDIF 
		Wait 8 frame 
	ENDIF 
	IF NOT GotParam anim 
		GetConfigurableTricksFromType type = FlipTrick 
		GetRandomArrayElement <ConfigurableTricks> 
		<trick_params> = ( <element> . params ) 
		<anim> = ( <trick_params> . anim ) 
	ENDIF 
	Ped_ActivateAuxScript name = ped_skater_play_midair_anim params = { anim = <anim> } 
	Obj_WaitJumpFinished 
	Ped_DeactivateAuxScript 
	Ped_PlayLandSound 
	IF GotParam is_vert 
		Ped_StartMoving 
		Ped_Utils_GetAnimName type = CrouchedLandAnims 
	ELSE 
		Ped_Utils_GetAnimName type = LandAnims 
	ENDIF 
	IF GotParam land_height 
		Ped_HitWaypoint 
	ENDIF 
	Ped_SetLogicState STATE_land Table = SkaterPed_StateTable StateParams = { anim = <AnimName> } 
ENDSCRIPT

SCRIPT ped_skater_land 
	Obj_ShadowOn 
	IF NOT GotParam anim 
		<anim> = Land 
	ENDIF 
	Obj_PlayAnim anim = <anim> 
	Obj_WaitAnimFinished 
	Ped_SetLogicState STATE_skating Table = SkaterPed_StateTable 
ENDSCRIPT

SCRIPT ped_skater_idle 
	Obj_EnableAnimBlending enabled = 1 
	GetSingleTag skater_override_anim 
	IF GotParam skater_override_anim 
		Obj_PlayAnim anim = <skater_override_anim> cycle DontInterrupt 
	ENDIF 
	BEGIN 
		IF Ped_NearVertNode 
			<anim_struct> = RANDOM(10, 1) RANDOMCASE { anim = Idle } RANDOMCASE { init_anim = Crouch anim = CrouchIdle out_anim = CrouchIdleToIdle cycle = 10 } RANDOMEND 
		ELSE 
			<anim_struct> = RANDOM(5, 10, 1) RANDOMCASE { anim = Idle } RANDOMCASE { anim = PushIdle } RANDOMCASE { init_anim = Crouch anim = CrouchIdle out_anim = CrouchIdleToIdle cycle = 10 } RANDOMEND 
		ENDIF 
		RemoveParameter init_anim 
		RemoveParameter anim 
		RemoveParameter cycle 
		RemoveParameter out_anim 
		IF StructureContains structure = <anim_struct> init_anim 
			<init_anim> = ( <anim_struct> . init_anim ) 
		ENDIF 
		<anim> = ( <anim_struct> . anim ) 
		IF StructureContains structure = <anim_struct> cycle 
			<cycle> = ( <anim_struct> . cycle ) 
		ELSE 
			<cycle> = 1 
		ENDIF 
		IF StructureContains structure = <anim_struct> out_anim 
			<out_anim> = ( <anim_struct> . out_anim ) 
		ENDIF 
		IF ( GotParam init_anim ) 
			Obj_PlayAnim anim = <init_anim> 
			Obj_WaitAnimFinished 
		ENDIF 
		BEGIN 
			Obj_PlayAnim anim = <anim> 
			Obj_WaitAnimFinished 
		REPEAT <cycle> 
		IF GotParam out_anim 
			Obj_PlayAnim anim = <out_anim> 
			Obj_WaitAnimFinished 
		ENDIF 
	REPEAT 
ENDSCRIPT

SCRIPT ped_skater_generic_bail 
	GetSingleTag grind_bail_anim 
	IF NOT GotParam grind_bail_anim 
		<grind_bail_anim> = FaceFall 
		<grind_get_up_anim> = GetUpFaceSmash 
	ELSE 
		GetSingleTag grind_get_up_anim 
	ENDIF 
	Ped_SetIsBailing 1 
	Ped_StoreMaxVelocity 
	Obj_SetPathDeceleration ped_skater_bail_deceleration 
	Obj_SetPathVelocity 0 
	Obj_PlayAnim anim = <grind_bail_anim> NoRestart BlendPeriod = 0.30000001192 
	Obj_WaitAnimFinished 
	Obj_PlayAnim anim = <grind_get_up_anim> BlendPeriod = 0.10000000149 
	Obj_WaitAnimFinished 
	Ped_GetOriginalMaxVelocity 
	Obj_SetPathVelocity <original_max_velocity> ips 
	Ped_SetIsBailing 0 
	Ped_SetLogicState STATE_skating Table = SkaterPed_StateTable 
ENDSCRIPT

SCRIPT ped_skater_start_moving 
	GetSingleTag ped_skater_acceleration 
	IF GotParam ped_skater_acceleration 
		Obj_SetPathAcceleration <ped_skater_acceleration> 
	ENDIF 
	Ped_GetOriginalMaxVelocity 
	Obj_SetPathVelocity <original_max_velocity> ips 
	Obj_PlayAnim anim = NewBrakeIdleToIdle 
	Obj_WaitAnimFinished 
ENDSCRIPT

SCRIPT ped_skater_play_midair_anim 
	Obj_PlayAnim anim = <anim> 
	Obj_WaitAnimFinished 
	Obj_PlayAnim anim = AirIdle cycle 
ENDSCRIPT

SCRIPT ped_skater_wait_and_stop_grab_anim 
	IF GotParam jumpTime 
		Wait ( <jumpTime> * 0.50000000000 ) seconds 
		IF GotParam out_anim 
			Obj_PlayAnim anim = <out_anim> 
			Obj_WaitAnimFinished 
		ELSE 
			Obj_PlayAnim anim = <anim> backwards 
			Obj_WaitAnimFinished 
		ENDIF 
		Obj_PlayAnim anim = AirIdle cycle 
	ENDIF 
ENDSCRIPT

SCRIPT ped_skater_wait_and_start_moving 
	Wait <StopTime> seconds 
	Ped_SetLogicState STATE_skating Table = SkaterPed_StateTable 
ENDSCRIPT


