
SCRIPT pedanim_init 
	SetTags <...> 
ENDSCRIPT

SCRIPT ped_play_wave_anim 
	Ped_Utils_GetAnimName Type = Idle 
	IF Obj_AnimEquals <AnimName> 
		Ped_Utils_GetAnimName Type = wave 
		PlayAnimWithPartialAnimIfExists Anim = <AnimName> 
		IF NOT gotparam no_block 
			Obj_WaitAnimFinished 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT ped_play_idle_anim 
	Ped_Utils_GetAnimName Type = IdleAnims 
	PlayAnimWithPartialAnimIfExists Anim = <AnimName> 
	IF NOT gotparam no_block 
		Obj_WaitAnimFinished 
	ENDIF 
ENDSCRIPT

SCRIPT ped_play_disgust_anim 
	Ped_Utils_GetAnimName Type = disgustAnims 
	PlayAnimWithPartialAnimIfExists Anim = <AnimName> 
	IF NOT gotparam no_block 
		Obj_WaitAnimFinished 
	ENDIF 
ENDSCRIPT

SCRIPT ped_play_attack_anim 
	Ped_Utils_GetAnimName Type = attackAnims 
	PlayAnimWithPartialAnimIfExists Anim = <AnimName> 
	IF NOT gotparam no_block 
		Obj_WaitAnimFinished 
	ENDIF 
ENDSCRIPT

SCRIPT ped_play_falldown_anim 
	Ped_Utils_GetAnimName Type = fallDownAnims 
	PlayAnimWithPartialAnimIfExists Anim = <AnimName> 
	IF gotparam index 
		SetTags fallDownAnimIndex = <index> 
	ENDIF 
	IF NOT gotparam no_block 
		Obj_WaitAnimFinished 
	ENDIF 
ENDSCRIPT

SCRIPT ped_play_layidle_anim 
	IF GetSingleTag fallDownAnimIndex 
		Ped_Utils_GetAnimName Type = layIdleAnims index = <fallDownAnimIndex> 
	ELSE 
		Ped_Utils_GetAnimName Type = layIdleAnims 
	ENDIF 
	PlayAnimWithPartialAnimIfExists Anim = <AnimName> 
	IF NOT gotparam no_block 
		Obj_WaitAnimFinished 
	ENDIF 
ENDSCRIPT

SCRIPT ped_play_getup_anim 
	IF GetSingleTag fallDownAnimIndex 
		Ped_Utils_GetAnimName Type = getupAnims index = <fallDownAnimIndex> 
	ELSE 
		Ped_Utils_GetAnimName Type = getupAnims 
	ENDIF 
	PlayAnimWithPartialAnimIfExists Anim = <AnimName> 
	IF NOT gotparam no_block 
		Obj_WaitAnimFinished 
	ENDIF 
ENDSCRIPT

SCRIPT ped_play_walking_wave_anim 
	ped_in_front_of_skater 
	IF ( <in_front> ) 
		RANDOM(1, 4) 
			RANDOMCASE 
			Ped_Utils_GetAnimName Type = WalkingWave 
			PlayAnimWithPartialAnimIfExists Anim = <AnimName> 
			RANDOMCASE 
			Ped_Utils_GetAnimName Type = WalkAnims 
			PlayAnimWithPartialAnimIfExists Anim = <AnimName> 
		RANDOMEND 
	ELSE 
		Ped_Utils_GetAnimName Type = WalkAnims 
		PlayAnimWithPartialAnimIfExists Anim = <AnimName> 
	ENDIF 
	Obj_WaitAnimFinished 
ENDSCRIPT

SCRIPT ped_mode_play_wave_anim 
	ped_rotate_to_skater_from_idle 
	SWITCH <talking_mode> 
		CASE friendly 
			Ped_Utils_GetAnimName Type = WalkAnims 
			PlayAnimWithPartialAnimIfExists Anim = <AnimName> 
			Obj_WaitAnimFinished 
		CASE mean 
			ped_play_disgust_anim 
	ENDSWITCH 
ENDSCRIPT

SCRIPT ped_start_movement 
	GetSingleTag move_type 
	IF ( <move_type> = stand ) 
		Ped_Utils_GetAnimName Type = Idle 
		PlayAnimWithPartialAnimIfExists Anim = <AnimName> Cycle 
	ELSE 
		Ped_Utils_GetAnimName Type = WalkAnims index = 0 
		IF NOT Obj_AnimEquals <AnimName> 
			Obj_SetAnimCycleMode off 
			Obj_WaitAnimFinished 
			ped_rotate_to_node_from_idle 
			Obj_SetAnimCycleMode off 
			Ped_Utils_GetAnimName Type = IdleToWalk 
			PlayAnimWithPartialAnimIfExists Anim = <AnimName> 
			Obj_WaitAnimFinished 
		ELSE 
		ENDIF 
		Ped_Utils_GetAnimName Type = WalkAnims 
		PlayAnimWithPartialAnimIfExists Anim = <AnimName> Cycle 
	ENDIF 
ENDSCRIPT

SCRIPT ped_stop_movement 
	<playing_walk_anim> = 0 
	Ped_Utils_GetAnimName Type = WalkAnims index = 0 
	IF Obj_AnimEquals <AnimName> 
		<playing_walk_anim> = 1 
	ENDIF 
	Ped_Utils_GetAnimName Type = WalkingWave 
	IF Obj_AnimEquals <AnimName> 
		<playing_walk_anim> = 1 
	ENDIF 
	IF ( <playing_walk_anim> = 1 ) 
		Obj_SetAnimCycleMode off 
		Obj_WaitAnimFinished 
		Ped_Utils_GetAnimName Type = WalkToIdle 
		PlayAnimWithPartialAnimIfExists Anim = <AnimName> 
		Obj_WaitAnimFinished 
	ENDIF 
ENDSCRIPT

SCRIPT ped_rotate_to_skater_from_idle time = 0.30000001192 
	IF Obj_AngleToNearestSkaterGreaterThan 15 
		IF Obj_LookAtObject Type = skater time = <time> 
			Ped_Utils_GetAnimName Type = RotateFromIdle1 
			PlayAnimWithPartialAnimIfExists Anim = <AnimName> 
			Obj_WaitRotate 
			Obj_SetAnimCycleMode off 
			Obj_WaitAnimFinished 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT ped_rotate_to_node_from_idle time = 0.30000001192 
	IF Obj_LookAtNodeLinked time = <time> 
		Ped_Utils_GetAnimName Type = RotateFromIdle1 
		PlayAnimWithPartialAnimIfExists Anim = <AnimName> 
		Obj_WaitRotate 
		Obj_SetAnimCycleMode off 
		Obj_WaitAnimFinished 
	ENDIF 
ENDSCRIPT

SCRIPT ped_in_front_of_skater 
	<retVal> = 0 
	Obj_GetOrientationToObject skater 
	IF ( <dotProd> < 0.50000000000 ) 
		IF ( <dotProd> > -0.50000000000 ) 
			<retVal> = 1 
		ENDIF 
	ENDIF 
	RETURN in_front = <retVal> 
ENDSCRIPT


