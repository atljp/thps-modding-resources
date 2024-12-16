
SCRIPT ped_walker_hit_dead_end 
	Ped_StopMoving 
	PlayAnimWithPartialAnimIfExists anim = Ped_M_LookAtWatch 
	Obj_WaitAnimFinished 
	Ped_GetCurrentNodeNames 
	ped_standing_look_at_skater node_name = <node_to> 
	Ped_Utils_GetAnimName Type = WalkAnims 
	PlayAnimWithPartialAnimIfExists anim = <AnimName> Cycle UseAnimTags 
	GetSingleTag animTags 
	IF GotParam animTags 
		ped_adjust_speed_to_match_anim <animTags> 
	ENDIF 
	Ped_StartMoving 
ENDSCRIPT

SCRIPT ped_standing_idle 
	GetSingleTag should_look_at_skater 
	GetSingleTag standing_anims 
	IF NOT GotParam standing_anims 
		Ped_GetGender 
		IF ( <Gender> = female ) 
			<standing_anims> = female_goal_wait 
		ELSE 
			<standing_anims> = generic_ped_anims_wait 
		ENDIF 
	ENDIF 
	BEGIN 
		IF GotParam standing_anims 
			GetArraySize <standing_anims> 
			CreateIndexArray <array_size> 
			PermuteArray NewArrayName = random_index_array Array = <index_array> 
			BEGIN 
				IF GetNextArrayElement <random_index_array> index = <index> 
					IF NOT ( <should_look_at_skater> = 0 ) 
						ped_standing_look_at_skater 
					ENDIF 
					ped_standing_play_anim_set ( <standing_anims> [ <element> ] ) 
				ELSE 
					RemoveParameter index 
					BREAK 
				ENDIF 
				wait 1 frame 
			REPEAT 
			wait 30 frame 
		ENDIF 
	REPEAT 
ENDSCRIPT

SCRIPT ped_standing_look_at_skater 
	<time_to_rotate> = 1 
	GetTags 
	Obj_StopRotating 
	IF NOT ObjectExists id = skater 
		RETURN 
	ENDIF 
	IF Obj_AngleToNearestSkaterGreaterThan 15 
		IF GotParam turning_anims 
			IF StructureContains structure = <turning_anims> pre_rotate 
				<pre_rotate> = ( <turning_anims> . pre_rotate ) 
			ENDIF 
			IF StructureContains structure = <turning_anims> rotate_anim 
				<rotate_anim> = ( <turning_anims> . rotate_anim ) 
			ENDIF 
			IF StructureContains structure = <turning_anims> post_rotate 
				<post_rotate> = ( <turning_anims> . post_rotate ) 
			ENDIF 
		ENDIF 
		IF NOT GotParam rotate_anim 
			Ped_Utils_GetAnimName Type = TurnAnims 
			<rotate_anim> = <AnimName> 
		ENDIF 
		IF GotParam pre_rotate 
			PlayAnimWithPartialAnimIfExists anim = <pre_rotate> 
			Obj_WaitAnimFinished 
		ENDIF 
		Obj_LookAtObject Type = skater time = <time_to_rotate> 
		PlayAnimWithPartialAnimIfExists anim = <rotate_anim> 
		wait <time_to_rotate> seconds 
		IF GotParam post_rotate 
			PlayAnimWithPartialAnimIfExists anim = <post_rotate> 
			Obj_WaitAnimFinished 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT ped_standing_play_anim_set 
	BEGIN 
		IF GetNextArrayElement <anims> index = <index> 
			IF StructureContains structure = <element> ped_speed 
				Obj_SetPathVelocity ( <element> . ped_speed ) fps 
			ENDIF 
			IF StructureContains structure = <element> speed 
				<speed> = ( <element> . speed ) 
			ELSE 
				IF StructureContains structure = <element> random_speed_high 
					IF StructureContains structure = <element> random_speed_low 
						GetRandomValue { 
							name = speed 
							resolution = 0.10000000149 
							a = ( <element> . random_speed_low ) 
							b = ( <element> . random_speed_high ) 
						} 
					ENDIF 
				ENDIF 
			ENDIF 
			IF StructureContains structure = <element> flip 
				Obj_flip 
			ENDIF 
			IF StructureContains structure = <element> anim 
				PlayAnimWithPartialAnimIfExists <element> speed = <speed> UseAnimTags 
				GetTags 
				IF GotParam animTags 
					ped_adjust_speed_to_match_anim <animTags> 
				ENDIF 
				IF StructureContains structure = <element> script_name 
					ped_run_script <element> 
				ENDIF 
			ELSE 
				IF StructureContains structure = <element> script_name 
					ped_run_script <element> 
				ELSE 
					PlayAnimWithPartialAnimIfExists anim = <element> speed = <speed> UseAnimTags 
					GetTags 
					IF GotParam animTags 
						ped_adjust_speed_to_match_anim <animTags> 
					ENDIF 
				ENDIF 
			ENDIF 
			Obj_WaitAnimFinished 
		ELSE 
			RETURN 
		ENDIF 
		wait 1 frame 
	REPEAT 
ENDSCRIPT

SCRIPT ped_run_script 
	<script_name> <script_params> 
ENDSCRIPT

SCRIPT ped_adjust_speed_to_match_anim 
	IF GotParam movementSpeed 
		Obj_SetPathVelocity <movementSpeed> ips 
	ENDIF 
ENDSCRIPT


