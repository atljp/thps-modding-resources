
SCRIPT Vehicle_Start 
	skater : RemoveTags tags = [ gurney_params shoppingcart_params segway_params luge_params slalom_params tricycle_params wheelchair_params minikart_params mechbull_params chainsaw_params ] 
	skater : SetTags { <params> InAirTrick = 0 } 
	MakeSkaterGoto Vehicle_Start2 
ENDSCRIPT

Vehicle_Start2_ExceptionTable = [ 
	{ Exception Ex = GroundGone Scr = Vehicle_Airborne } 
	{ Exception Ex = FlailHitWall Scr = Vehicle_Flail } 
	{ Exception Ex = FlailLeft Scr = Vehicle_Flail } 
	{ Exception Ex = FlailRight Scr = Vehicle_Flail } 
	{ Exception Ex = RunHasEnded Scr = EndOfRun } 
	{ Exception Ex = GoalHasEnded Scr = Goal_EndOfRun } 
] 
SCRIPT Vehicle_Start2 start_script = vehicle_default_start_script 
	GetTags 
	IF gotparam grind_sound 
		skater : Obj_StopSound <grind_sound> 
	ENDIF 
	SetCurrentBailEndpose 
	OnExceptionRun 
	ResetEventHandlersFromTable Vehicle_Start2_ExceptionTable 
	SkaterVehicleOn 
	SetSkaterVehicle <racemode> 
	orient_vehicle 
	IF gotparam wheel_anim 
		remove_all_anim_subsets not_wheels 
	ELSE 
		remove_all_anim_subsets 
	ENDIF 
	IF walking 
		SwitchToSkatingPhysics 
	ENDIF 
	IF gotparam blend_turn_anims 
		IF NOT Obj_AnimSubsetExists SubsetId = Second 
			Obj_AddAnimSubset SubsetId = Second 
		ENDIF 
		Obj_SetAnimSubsetWeight SubsetId = Second BlendWeight = 0.00000000000 
	ENDIF 
	IF ( <canbrake> = 1 ) 
		CanBrakeOn 
	ELSE 
		CanBrakeOff 
	ENDIF 
	IF ( <autokick> = 1 ) 
		ForceAutokickOn 
	ELSE 
		ForceAutokickOff 
	ENDIF 
	IF ( <board> = 1 ) 
		SwitchOnBoard 
	ELSE 
		SwitchOffBoard 
	ENDIF 
	IF ( <cangrind> = 1 ) 
		AllowRailTricks 
	ELSE 
		NoRailTricks 
	ENDIF 
	IF gotparam soundstruct 
		SetSkaterVehicleSounds <soundstruct> 
	ELSE 
		NoSkaterVehicleSounds 
	ENDIF 
	IF BoardIsRotated 
		boardrotate 
	ENDIF 
	VibrateOff 
	Obj_KillSpawnedScript name = BailBoardControl 
	ClearEventBuffer 
	EnablePlayerInput 
	BailOff 
	BashOff 
	SetRollingFriction 0 
	SetSpeed <startspeed> 
	Blendperiodout 0 
	skater : SkaterLoopingSound_TurnOff 
	IF gotparam sound 
		GetTags 
		IF ( <racemode> = gurney ) 
			skater : Obj_StopSound ShoppingCartLoop 
			skater : Obj_PlaySound ShoppingCartLoop 
		ELSE 
			skater : Obj_StopSound <sound> 
			skater : Obj_PlaySound <sound> 
		ENDIF 
	ENDIF 
	UnpauseSkaters 
	IF gotparam start_script 
		<start_script> 
	ENDIF 
	Goto Vehicle_OnGround 
ENDSCRIPT

SCRIPT Vehicle_OnGround 
	GetTags 
	IF gotparam grind_sound 
		skater : Obj_StopSound <grind_sound> 
	ENDIF 
	IF gotparam land_manual 
		ClearPanel_Landed 
	ENDIF 
	SetException Ex = RunHasEnded Scr = EndOfRun 
	SetException Ex = GoalHasEnded Scr = Goal_EndOfRun 
	StopBalanceTrick 
	Vibrate Actuator = 0 Percent = 0 
	SetTags veh_backwardsgrind = 0 
	SetException Ex = Ollied Scr = Vehicle_Ollie 
	ResetLandedFromVert 
	IF NOT OnGround 
		SetState Ground 
	ENDIF 
	IF gotparam canmanual 
		SetManualTricks VehicleManualTricks 
	ELSE 
		SetManualTricks NoTricks 
	ENDIF 
	orient_vehicle 
	PlayAnim Anim = <idle_anim> Cycle NoRestart 
	vehicle_onground_loop 
ENDSCRIPT

SCRIPT vehicle_onground_loop 
	GetTags 
	IF gotparam grind_sound 
		skater : Obj_StopSound <grind_sound> 
	ENDIF 
	IF gotparam sound 
		IF ( <racemode> = gurney ) 
			skater : Obj_StopSound ShoppingCartLoop 
			skater : Obj_PlaySound ShoppingCartLoop 
		ELSE 
			skater : Obj_StopSound <sound> 
			skater : Obj_PlaySound <sound> 
		ENDIF 
	ENDIF 
	BEGIN 
		IF NOT IsSkaterOnVehicle 
			MakeSkaterGoto OnGroundAI 
		ENDIF 
		IF gotparam canmanual 
			DoNextManualTrick 
		ENDIF 
		IF ( <racemode> = gurney ) 
			IF SkaterSpeedGreaterThan 0 
				IF NOT IsSoundPlaying ShoppingCartLoop 
					IF ( LevelIs load_bo ) 
						
						skater : Obj_StopSound ShoppingCartLoop 
						skater : Obj_PlaySound ShoppingCartLoop 
						SetSoundParams ShoppingCartLoop vol = 0 pitch = 0 
					ENDIF 
				ENDIF 
			ELSE 
				IF ( LevelIs load_bo ) 
					IF IsSoundPlaying ShoppingCartLoop 
						skater : Obj_StopSound ShoppingCartLoop 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
		orient_vehicle 
		<onground_script> 
		wait 1 gameframe 
	REPEAT 
ENDSCRIPT

SCRIPT vehicle_accel_ground_sound_loop 
	GetTags 
	IF gotparam grind_sound 
		skater : Obj_StopSound <grind_sound> 
	ENDIF 
	BEGIN 
		IF ( <racemode> = gurney ) 
			IF SkaterSpeedGreaterThan 0 
				IF NOT IsSoundPlaying ShoppingCartLoop 
					IF ( LevelIs load_bo ) 
						
						skater : Obj_StopSound ShoppingCartLoop 
						skater : Obj_PlaySound ShoppingCartLoop 
						SetSoundParams ShoppingCartLoop vol = 0 pitch = 0 
					ENDIF 
				ENDIF 
			ELSE 
				IF IsSoundPlaying ShoppingCartLoop 
					skater : Obj_StopSound ShoppingCartLoop 
				ENDIF 
			ENDIF 
		ENDIF 
		wait 1 gameframe 
	REPEAT 2 
ENDSCRIPT

SCRIPT orient_vehicle 
	IF flipped 
		Flip 
	ENDIF 
	IF BoardIsRotated 
		boardrotate 
	ENDIF 
ENDSCRIPT

SCRIPT ShoppingCart_OnGround_Loop 
	GetTags 
	IF held left 
		PlayAnim Anim = Trolley_IdleToLeanLeft NoRestart 
	ELSE 
		IF held right 
			PlayAnim Anim = Trolley_IdleToLeanRight NoRestart 
		ELSE 
			IF AnimFinished 
				PlayAnim Anim = RANDOM(1, 1, 1, 1, 1, 1, 1, 1, 1) RANDOMCASE Trolley_Idle RANDOMCASE Trolley_Idle RANDOMCASE Trolley_Idle RANDOMCASE Trolley_Idle RANDOMCASE Trolley_Idle RANDOMCASE Trolley_Idle RANDOMCASE Trolley_Idle RANDOMCASE Trolley_LookLeft RANDOMCASE Trolley_LookRight RANDOMEND 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT veh_OnGroundAI Coasting = 0 Pushes = 0 PressureTimer = 0 
	GetTags 
	IF gotparam blend_turn_anims 
		Obj_SetAnimSubsetWeight BlendWeight = 1.00000000000 BlendDuration = 0.10000000149 
		Obj_SetAnimSubsetWeight SubsetId = Second BlendWeight = 0.00000000000 BlendDuration = 0.10000000149 
	ENDIF 
	IF LeftPressed 
		IF Crouched 
			PlayVehSingleTurnAnimOrTurnIdle TurnIdle = <crouch_leftidle_anim> TurnAnim = <crouch_left_anim> dir = left 
		ELSE 
			PlayVehSingleTurnAnimOrTurnIdle TurnIdle = <leftidle_anim> TurnAnim = <left_anim> dir = left 
		ENDIF 
	ELSE 
		IF RightPressed 
			IF Crouched 
				PlayVehSingleTurnAnimOrTurnIdle TurnIdle = <crouch_rightidle_anim> TurnAnim = <crouch_right_anim> dir = right 
			ELSE 
				PlayVehSingleTurnAnimOrTurnIdle TurnIdle = <rightidle_anim> TurnAnim = <right_anim> dir = right 
			ENDIF 
		ELSE 
			IF Braking 
				GetSpeed 
				IF ( <speed> > 50 ) 
					PlayAnim Anim = <brake_anim> NoRestart 
				ELSE 
					IF HeldLongerThan Button = down 2 Second 
						Goto veh_handbrake 
					ELSE 
						PlayAnim Anim = <idle_anim> Cycle NoRestart 
					ENDIF 
				ENDIF 
			ELSE 
				IF Crouched 
					IF SpeedLessThan 300 
						SpawnSound vehicle_accel_ground_sound_loop 
						PlayAnim Anim = <accel_anim> NoRestart 
						Obj_WaitAnimFinished 
					ELSE 
						PlayAnim Anim = <crouch_anim> Cycle NoRestart 
					ENDIF 
				ELSE 
					IF gotparam only_idle_when_stopped 
						GetSpeed 
						IF ( <speed> > 50 ) 
							PlayAnim Anim = <crouch_anim> Cycle NoRestart speed = 0.69999998808 
						ELSE 
							PlayAnim Anim = <idle_anim> Cycle NoRestart 
						ENDIF 
					ELSE 
						PlayAnim Anim = <idle_anim> Cycle NoRestart 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT PlayVehSingleTurnAnimOrTurnIdle 
	GetTags 
	IF gotparam blend_turn_anims 
		veh_blendturnanims <...> 
		RETURN 
	ENDIF 
	IF NOT AnimEquals <TurnIdle> 
		IF NOT AnimEquals <TurnAnim> 
			IF ( <TurnAnim> = <TurnIdle> ) 
				PlayAnim Anim = <TurnIdle> Cycle NoRestart 
			ELSE 
				PlayAnim Anim = <TurnAnim> NoRestart 
			ENDIF 
		ENDIF 
		IF AnimFinished 
			PlayAnim Anim = <TurnIdle> Cycle NoRestart 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT veh_blendturnanims 
	GetTags 
	IF NOT Obj_AnimSubsetExists SubsetId = Second 
		Obj_AddAnimSubset SubsetId = Second 
		Obj_SetAnimSubsetWeight SubsetId = Second BlendWeight = 0.00000000000 
	ENDIF 
	runanim = <crouch_anim> 
	PlayAnim Anim = <runanim> Cycle SyncToPreviousAnim 
	PlayAnim SubsetId = Second Anim = <TurnAnim> Cycle SyncToPreviousAnim 
	Obj_SetAnimSubsetWeight BlendWeight = 0.20000000298 BlendDuration = 1.00000000000 
	Obj_SetAnimSubsetWeight SubsetId = Second BlendWeight = 0.80000001192 BlendDuration = 1.00000000000 
	wait 1 gameframe 
	IF ( <dir> = right ) 
		downdir = downright 
		updir = upright 
	ELSE 
		downdir = downleft 
		updir = upleft 
	ENDIF 
	BEGIN 
		IF held <dir> 
		ELSE 
			IF held <downdir> 
			ELSE 
				IF held <updir> 
				ELSE 
					BREAK 
				ENDIF 
			ENDIF 
		ENDIF 
		wait 1 gameframe 
	REPEAT 
	out_time = 0.10000000149 
	Obj_SetAnimSubsetWeight BlendWeight = 1.00000000000 BlendDuration = <out_time> 
	Obj_SetAnimSubsetWeight SubsetId = Second BlendWeight = 0.00000000000 BlendDuration = <out_time> 
	wait <out_time> seconds 
	Goto vehicle_onground_loop 
ENDSCRIPT

SCRIPT veh_blenturnanims_exit 
	IF Obj_AnimSubsetExists SubsetId = Second 
		Obj_RemoveAnimSubset SubsetId = Second 
	ENDIF 
ENDSCRIPT

SCRIPT vehicle_animate_wheels 
	GetTags 
	OnExitRun vehicle_animate_wheels_exit 
	last_speed = -99 
	BEGIN 
		IF NOT IsSkaterOnVehicle 
			BREAK 
		ENDIF 
		IF NOT Obj_AnimSubsetExists SubsetId = Wheels 
			setup_wheels_subset 
			wait 1 gameframe 
		ELSE 
			GetSpeed 
			animate = 0 
			IF ( <speed> > 0 ) 
				animate = 1 
			ENDIF 
			IF NOT OnGround 
				animate = 0 
			ENDIF 
			IF ( <animate> = 1 ) 
				IF ( <speed> > 50 ) 
					wheel_speed = 1 
				ELSE 
					wheel_speed = ( <speed> / 50 ) 
				ENDIF 
				IF NOT ( <wheel_speed> = <last_speed> ) 
					PlayAnim SubsetId = Wheels Anim = <wheel_anim> speed = <wheel_speed> Cycle 
					last_speed = <wheel_speed> 
				ENDIF 
			ELSE 
				IF NOT ( <last_speed> = 0 ) 
					PlayAnim SubsetId = Wheels Anim = <wheel_anim> speed = 0 from = current 
					last_speed = 0 
				ENDIF 
			ENDIF 
			wait 10 gameframe 
		ENDIF 
	REPEAT 
ENDSCRIPT

SCRIPT setup_wheels_subset 
	Obj_AddAnimSubset SubsetId = Wheels Stage = 1 
	Obj_SetAnimSubsetWeight SubsetId = Wheels BlendWeight = 1 
	IF Obj_AnimationFlipped 
		Obj_Flip SubsetId = Wheels 
	ENDIF 
ENDSCRIPT

SCRIPT vehicle_animate_wheels_exit 
	IF Obj_AnimSubsetExists SubsetId = Wheels 
		Obj_RemoveAnimSubset SubsetId = Wheels 
	ENDIF 
ENDSCRIPT

SCRIPT CarMode_OnGround_Loop 
	GetTags 
	IF held left 
		SetRollingFriction <turn_friction> 
		PlayAnim Anim = <left_anim> NoRestart 
	ELSE 
		IF held right 
			SetRollingFriction <turn_friction> 
			PlayAnim Anim = <right_anim> NoRestart 
		ELSE 
			IF held down 
				IF gotparam brake_anim 
					PlayAnim Anim = <brake_anim> NoRestart 
				ENDIF 
			ELSE 
				PlayAnim Anim = <idle_anim> Cycle NoRestart 
				SetRollingFriction 0 
				GetSpeed 
				IF ( <speed> < <accelerate_to> ) 
					speed = ( <speed> + <acceleration> ) 
				ENDIF 
				SetSpeed <speed> 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT veh_handbrake 
	GetTags 
	ClearEventBuffer 
	OnExceptionRun BrakeDone 
	SetRollingFriction 100 
	ClearTricksFrom GroundTricks 
	PlayAnim Anim = <idle_anim> NoRestart Cycle 
	BEGIN 
		wait 1 gameframe 
		IF held up 
			BREAK 
		ENDIF 
		IF Crouched 
			BREAK 
		ENDIF 
	REPEAT 
	SetRollingFriction default 
	Goto vehicle_onground_loop 
ENDSCRIPT

SCRIPT Vehicle_Bail_Cleanup 
	
	Obj_RestoreBoundingSphere 
ENDSCRIPT

SCRIPT Vehicle_Bail 
	GetTags 
	IF gotparam dont_bail 
		SetState Ground 
		ClearPanel_Landed 
		BailOff 
		IF LandedFromSpine 
			SetSpeed 0 
		ENDIF 
		Goto Vehicle_OnGround 
	ENDIF 
	Obj_SetBoundingSphere 10000 
	OnExitRun Vehicle_Bail_Cleanup 
	IF gotparam blend_turn_anims 
		Obj_SetAnimSubsetWeight BlendWeight = 1.00000000000 
		Obj_SetAnimSubsetWeight SubsetId = Second BlendWeight = 0.00000000000 
	ENDIF 
	PlaySkaterStream type = "bail" 
	InBail 
	LaunchStateChangeEvent State = Skater_InBail 
	skater : Obj_StopSound <sound> 
	skater : SkaterLoopingSound_TurnOn 
	ClearExceptions 
	ClearTrickQueue 
	DisablePlayerInput AllowCameraControl 
	NoRailTricks 
	SetExtraTricks NoTricks 
	BailSkaterTricks 
	StopBalanceTrick 
	IF NOT LandedFromVert 
		SetRollingFriction 20 
		IF ( <allow_vert> = 0 ) 
			Jump BonelessHeight 
		ENDIF 
	ELSE 
		SetRollingFriction 1000 
	ENDIF 
	CanBrakeOn 
	overridelimits max = 10000 friction = 0 time = 0 
	RestoreAutoKick 
	ClearSkaterCamOverride 
	IF gotparam BigAir 
	ENDIF 
	GetTags 
	IF gotparam bail_sound 
		skater : Obj_PlaySound <bail_sound> vol = 200 pitch = RANDOM(1, 1, 1) RANDOMCASE 90 RANDOMCASE 100 RANDOMCASE 110 RANDOMEND 
	ENDIF 
	IF OnRail 
		Obj_SpawnScript FallOffRail params = { xmove = <xmove> moveframes = <moveframes> } 
		ClearException GroundGone 
		Vibrate Actuator = 1 Percent = 100 Duration = 0.20000000298 
		SetState Air 
		move y = 2.00000000000 
		Rotate y = RANDOM_RANGE PAIR(1.00000000000, 20.00000000000) 
	ENDIF 
	IF gotparam bail_script 
		<bail_script> <manual> 
	ELSE 
		ManualBail 
	ENDIF 
	NotInBail 
ENDSCRIPT

SCRIPT Vehicle_Flail speed = 0 bailspeed = 999 
	GetTags 
	GetSpeed 
	IF ( <speed> > <bailspeed> ) 
		Goto Vehicle_Bail 
	ELSE 
		IF gotparam flail_anim 
			PlayAnim Anim = <flail_anim> 
			Obj_WaitAnimFinished 
		ENDIF 
		Goto Vehicle_OnGround 
	ENDIF 
ENDSCRIPT

SCRIPT Vehicle_Ollie 
	ClearException Ollied 
	GetTags 
	PlayAnim Anim = <ollie_anim> 
	SetTrickName <jump_name> 
	SettrickScore <jump_score> 
	Display 
	IF gotparam jumpheight 
		Jump no_sound speed = <jumpheight> 
	ELSE 
		IF gotparam BonelessHeight 
			Jump BonelessHeight no_sound 
		ELSE 
			Jump no_sound 
		ENDIF 
	ENDIF 
	GetTags 
	IF gotparam ollie_sound 
		
		PlaySound <ollie_sound> pitch = RANDOM(1, 1, 1, 1, 1) RANDOMCASE 95 RANDOMCASE 98 RANDOMCASE 100 RANDOMCASE 103 RANDOMCASE 105 RANDOMEND vol = 150 
	ENDIF 
	Goto Vehicle_Airborne 
ENDSCRIPT

SCRIPT Vehicle_Airborne 
	GetTags 
	SetState Air 
	LaunchStateChangeEvent State = Skater_InAir 
	GetTags 
	
	IF ( <racemode> = gurney ) 
		
		
		skater : Obj_StopSound ShoppingCartLoop 
		
		skater : Obj_StopSound ShoppingCartLoop 
		
	ENDIF 
	SetException Ex = Landed Scr = Vehicle_Land 
	IF gotparam canwallplant 
		SetException Ex = WallPlant Scr = Air_WallPlant 
	ENDIF 
	SetException Ex = PointRailSpin Scr = vehicle_PointRailSpin 
	skater : Obj_StopSound <sound> 
	IF Obj_AnimSubsetExists SubsetId = Second 
		Obj_SetAnimSubsetWeight SubsetId = Second BlendWeight = 0.00000000000 
	ENDIF 
	IF gotparam canmanual 
		SetManualTricks VehicleManualTricks 
	ELSE 
		SetManualTricks NoTricks 
	ENDIF 
	IF AnimEquals <ollie_anim> 
		WaitAnimFinishedOrVehicleTrick 
	ENDIF 
	PlayAnim Anim = <air_idle_anim> 
	IF ( <racemode> = slalom ) 
		BEGIN 
			IF AirTimeGreaterThan 1.25000000000 seconds 
				PlayAnim Anim = FlailingFall Blendperiod = 0.30000001192 Cycle 
				SetException Ex = Landed Scr = Vehicle_Bail params = { BigAir } 
				BREAK 
			ENDIF 
			wait 1 gameframe 
		REPEAT 
	ELSE 
		BEGIN 
			IF held circle 
				IF gotparam air_trick_init 
					Goto vehicle_grab_trick 
				ENDIF 
			ENDIF 
			IF held square 
				IF gotparam air_trick2 
					Goto vehicle_flip_trick 
				ENDIF 
			ENDIF 
			IF gotparam canmanual 
				DoNextManualTrick 
			ENDIF 
			wait 1 gameframe 
		REPEAT 
	ENDIF 
ENDSCRIPT

SCRIPT WaitAnimFinishedOrVehicleTrick 
	GetTags 
	BEGIN 
		IF AnimFinished 
			BREAK 
		ENDIF 
		IF held circle 
			IF gotparam air_trick_init 
				Goto vehicle_grab_trick 
			ENDIF 
		ENDIF 
		IF held square 
			IF gotparam air_trick2 
				Goto vehicle_flip_trick 
			ENDIF 
		ENDIF 
		IF gotparam canmanual 
			DoNextManualTrick 
		ENDIF 
		wait 1 gameframe 
	REPEAT 
ENDSCRIPT

SCRIPT vehicle_grab_trick 
	GetTags 
	SetTags InAirTrick = 1 
	LaunchStateChangeEvent State = Skater_InAir 
	LaunchSubStateEntryEvent SubState = Grab 
	OnExitRun veh_ExitGrabTrick 
	PlayAnim Anim = <air_trick_init> speed = <grab_trick_speed> 
	Obj_WaitAnimFinished 
	SetTrickName <trick_name> 
	SettrickScore <trick_score> 
	Display 
	IF held circle 
		PlayAnim Anim = <air_trick_idle> Cycle NoRestart 
		BEGIN 
			IF NOT held circle 
				BREAK 
			ENDIF 
			GetSingleTag State 
			IF ( <State> = Ground ) 
				BREAK 
			ENDIF 
			wait 1 gameframe 
		REPEAT 
	ENDIF 
	IF gotparam air_trick_out 
		PlayAnim Anim = <air_trick_out> speed = <grab_trick_speed> 
	ELSE 
		PlayAnim Anim = <air_trick_init> backwards speed = <grab_trick_speed> 
	ENDIF 
	WaitAnim 50 Percent 
	SetTags InAirTrick = 0 
	Obj_WaitAnimFinished 
	Goto Vehicle_Airborne 
ENDSCRIPT

SCRIPT veh_ExitGrabTrick 
	LaunchSubStateExitEvent SubState = Grab 
ENDSCRIPT

SCRIPT vehicle_flip_trick 
	GetTags 
	SetTags InAirTrick = 1 
	LaunchStateChangeEvent State = Skater_InAir 
	LaunchSubStateEntryEvent SubState = Flip 
	OnExitRun veh_ExitFlipTrick 
	PlayAnim Anim = <air_trick2> speed = <air_trick2_speed> 
	wait 10 frames 
	SetTrickName <trick_name2> 
	SettrickScore <trick_score2> 
	Display 
	WaitAnim 50 Percent 
	SetTags InAirTrick = 0 
	Obj_WaitAnimFinished 
	Goto Vehicle_Airborne 
ENDSCRIPT

SCRIPT veh_ExitFlipTrick 
	LaunchSubStateExitEvent SubState = Flip 
ENDSCRIPT

SCRIPT Vehicle_Land 
	GetTags 
	SetState Ground 
	SetTags InAirTrick = 0 
	LaunchStateChangeEvent State = Skater_OnGround 
	IF NOT gotparam yaw_angles 
		yaw_angles = PAIR(45.00000000000, 155.00000000000) 
	ENDIF 
	IF ( <InAirTrick> = 1 ) 
		SetTags InAirTrick = 0 
		Goto Vehicle_Bail 
	ENDIF 
	IF PitchGreaterThan 60 
		Goto Vehicle_Bail 
	ENDIF 
	IF RollGreaterThan 50 
		Goto Vehicle_Bail 
	ENDIF 
	IF NOT gotparam auto_correct_direction 
		GetSpeed 
		IF ( <speed> > 0 ) 
			IF YawBetween <yaw_angles> 
				Goto Vehicle_Bail 
			ENDIF 
			IF backwards 
				IF LandedFromVert 
					manual_turnaround 
				ENDIF 
				IF ( <allow_backwards> = 0 ) 
				ELSE 
				ENDIF 
			ENDIF 
		ENDIF 
	ELSE 
	ENDIF 
	GotoPreserveParams vehicle_land2 
ENDSCRIPT

SCRIPT vehicle_land2 RevertTime = 5 
	IF LandedFromVert 
		IF ( <allow_vert> = 0 ) 
			Goto Vehicle_Bail 
		ENDIF 
		OverrideCancelGround 
		Obj_ClearFlag FLAG_SKATER_MANUALCHEESE 
		IF gotparam revert_trick 
			GetSpeed 
			IF ( <speed> > 250 ) 
				SetExtraTricks_Reverts Duration = <RevertTime> 
			ENDIF 
		ENDIF 
	ELSE 
		IF gotparam canmanual 
			DoNextManualTrick 
		ENDIF 
	ENDIF 
	OnExceptionRun LandSkaterTricks 
	SetException Ex = Ollied Scr = Vehicle_Ollie 
	SetException Ex = RunHasEnded Scr = EndOfRun 
	SetException Ex = GoalHasEnded Scr = Goal_EndOfRun 
	GetTags 
	IF gotparam land_sound 
		PlaySound <land_sound> vol = 150 pitch = RANDOM(1, 1, 1, 1, 1) RANDOMCASE 95 RANDOMCASE 98 RANDOMCASE 100 RANDOMCASE 103 RANDOMCASE 105 RANDOMEND 
	ENDIF 
	IF gotparam soft_land_anim 
		IF AirTimeGreaterThan 1 seconds 
			PlayAnim Anim = <land_anim> Blendperiod = 0.10000000149 
		ELSE 
			IF AirTimeGreaterThan 0.10000000149 seconds 
				PlayAnim Anim = <soft_land_anim> Blendperiod = 0.10000000149 
			ENDIF 
		ENDIF 
	ELSE 
		PlayAnim Anim = <land_anim> Blendperiod = 0.10000000149 
	ENDIF 
	GetTags 
	IF ( <racemode> = gurney ) 
		IF SkaterSpeedGreaterThan 0 
			IF NOT IsSoundPlaying ShoppingCartLoop 
				IF ( LevelIs load_bo ) 
					
					skater : Obj_StopSound ShoppingCartLoop 
					skater : Obj_PlaySound ShoppingCartLoop 
					SetSoundParams ShoppingCartLoop vol = 0 pitch = 0 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	IF gotparam spin_time 
		wait <spin_time> seconds 
		CancelRotateDisplay 
	ENDIF 
	IF gotparam revert_trick 
		IF LandedFromVert 
			ResetLandedFromVert 
			BEGIN 
				wait 1 gameframe 
			REPEAT <RevertTime> 
		ELSE 
			BEGIN 
				DoNextManualTrick FromAir 
				wait 1 gameframe 
			REPEAT 10 
		ENDIF 
	ENDIF 
	LandSkaterTricks 
	IF ( <racemode> = Wheelchair ) 
		Paulie_TalkShit 
	ENDIF 
	Obj_WaitAnimFinished 
	Goto Vehicle_OnGround 
ENDSCRIPT

SCRIPT vehicle_play_land_sound 
	GetTags 
	IF gotparam land_sound 
		PlaySound <land_sound> vol = 150 pitch = RANDOM(1, 1, 1, 1, 1) RANDOMCASE 95 RANDOMCASE 98 RANDOMCASE 100 RANDOMCASE 103 RANDOMCASE 105 RANDOMEND 
	ENDIF 
ENDSCRIPT

SCRIPT GetReducedSpin 
	GetActualSpin 
	IF NOT LandedFromSpine 
		IF LandedFromVert 
			spin = ( <spin> + 180 ) 
		ENDIF 
	ENDIF 
	BEGIN 
		IF ( 360 > <spin> ) 
			BREAK 
		ELSE 
			spin = ( <spin> - 360 ) 
		ENDIF 
	REPEAT 
	RETURN spin = <spin> 
ENDSCRIPT

vehicle_grind_ExceptionTable = [ 
	{ Exception Ex = Ollied Scr = vehicle_rail_exit params = { callback = Vehicle_Ollie } } 
	{ Exception Ex = OffRail Scr = vehicle_OffRail } 
	{ Exception Ex = Landed Scr = vehicle_rail_exit params = { callback = Vehicle_Land } } 
	{ Exception Ex = OffMeterTop Scr = vehicle_rail_exit params = { callback = Vehicle_Bail } } 
	{ Exception Ex = OffMeterBottom Scr = vehicle_rail_exit params = { callback = Vehicle_Bail } } 
	{ Exception Ex = SkaterCollideBail Scr = vehicle_rail_exit params = { callback = Vehicle_Bail } } 
	{ Event Ex = MadeOtherSkaterBail Scr = MadeOtherSkaterBail_Called } 
] 
SCRIPT vehicle_grind 
	GetTags 
	IF ( <InAirTrick> = 1 ) 
		SetTags InAirTrick = 0 
		Goto Vehicle_Bail 
	ENDIF 
	IF backwards 
		SetTags veh_backwardsgrind = 1 
		RotateNoFlip 
	ELSE 
		GetReducedSpin 
		IF ( ( <spin> > 90 ) & ( 270 > <spin> ) ) 
			IF ( <veh_backwardsgrind> = 0 ) 
				SetTags veh_backwardsgrind = 1 
				RotateNoFlip 
			ELSE 
				SetTags veh_backwardsgrind = 0 
			ENDIF 
		ELSE 
			IF ( <veh_backwardsgrind> = 1 ) 
				RotateNoFlip 
			ENDIF 
		ENDIF 
	ENDIF 
	IF BailIsOn 
		SetState Air 
		Goto Vehicle_Bail 
	ENDIF 
	BailOff 
	CancelRotateDisplay 
	GetTags 
	IF gotparam land_sound 
		PlaySound <land_sound> vol = 120 pitch = RANDOM(1, 1, 1, 1, 1) RANDOMCASE 110 RANDOMCASE 113 RANDOMCASE 115 RANDOMCASE 118 RANDOMCASE 120 RANDOMEND 
	ENDIF 
	IF gotparam grind_sound 
		skater : Obj_StopSound <grind_sound> 
		skater : Obj_PlaySound <grind_sound> vol = 150 
	ENDIF 
	LaunchStateChangeEvent State = Skater_OnRail 
	KillExtraTricks 
	SetTrickName "" 
	SettrickScore 0 
	Display Blockspin 
	Obj_ClearFlag FLAG_SKATER_MANUALCHEESE 
	Obj_ClearFlag FLAG_SKATER_REVERTCHEESE 
	Vibrate Actuator = 1 Percent = 50 Duration = 0.25000000000 
	Vibrate Actuator = 0 Percent = 50 
	ResetEventHandlersFromTable vehicle_grind_ExceptionTable 
	OnExceptionRun Grind_Kissed 
	ClearTrickQueue 
	ClearManualTrick 
	ClearExtraGrindTrick 
	SetQueueTricks NoTricks 
	SetManualTricks NoTricks 
	SetRailSound Grind 
	SetGrindTweak 10 
	IF gotparam grind_init_anim 
		PlayAnim Anim = <grind_init_anim> Blendperiod = 0 
	ENDIF 
	DoBalanceTrick ButtonA = right ButtonB = left type = Grind DoFlipCheck 
	orient_vehicle 
	wait 15 frames 
	IF IsPs2 
		SetExtraTricks GrindRelease 
	ENDIF 
	wait 1 frame 
	OnExceptionRun Normal_Grind 
	SetTrickName <grind_trick> 
	SettrickScore <grind_score> 
	Display Blockspin 
	Obj_WaitAnimFinished 
	IF gotparam grind_idle_anim 
		PlayAnim Anim = <grind_idle_anim> Wobble wobbleparams = grindwobble_params 
	ENDIF 
	BEGIN 
		DoNextTrick 
		orient_vehicle 
		wait 1 gameframe 
	REPEAT 
ENDSCRIPT

SCRIPT vehicle_OffRail 
	GetTags 
	IF gotparam grind_sound 
		skater : Obj_StopSound <grind_sound> 
	ENDIF 
	IF gotparam KissedRail 
		SettrickScore 50 
		SetTrickName "Kissed the Rail" 
		Display Blockspin NoMult 
	ENDIF 
	StopBalanceTrick 
	KillExtraTricks 
	Vibrate Actuator = 0 Percent = 0 
	SetState Air 
	SetException Ex = Landed Scr = Vehicle_Land 
	IF gotparam canwallplant 
		SetException Ex = WallPlant Scr = Air_WallPlant 
	ENDIF 
	DoNextTrick 
	IF gotparam grind_Out_Anim 
		PlayAnim Anim = <grind_Out_Anim> Blendperiod = 0.10000000149 
	ELSE 
		IF gotparam grind_init_anim 
			PlayAnim Anim = <grind_init_anim> Blendperiod = 0.10000000149 backwards 
		ENDIF 
	ENDIF 
	IF gotparam canmanual 
		DoNextManualTrick 
	ENDIF 
	Obj_WaitAnimFinished 
	Goto Vehicle_Airborne 
ENDSCRIPT

SCRIPT vehicle_rail_exit 
	StopBalanceTrick 
	KillExtraTricks 
	Vibrate Actuator = 0 Percent = 0 
	SetState Air 
	AllowRailTricks 
	IF gotparam grind_sound 
		skater : Obj_StopSound <grind_sound> 
	ENDIF 
	IF NOT gotparam callback 
		RETURN 
	ELSE 
		Goto <callback> 
	ENDIF 
ENDSCRIPT

SCRIPT vehicle_PointRailSpin 
	GetTags 
	SetException Ex = Ollied Scr = vehicle_ExitPointRailSpin 
	SetException Ex = OffMeterTop Scr = vehicle_PointRailSpinBail 
	SetException Ex = OffMeterBottom Scr = vehicle_PointRailSpinBail 
	SetRailSound slide 
	DoBalanceTrick ButtonA = right ButtonB = left type = Grind 
	PlayAnim Anim = <idle_anim> Wobble 
	SetTrickName "" 
	SettrickScore 0 
	Display Blockspin 
	SetTrickName #"Spin" 
	SettrickScore 50 
	Display natas 
ENDSCRIPT

SCRIPT vehicle_ExitPointRailSpin 
	skater : SetSpeed 300 
	Vehicle_Ollie 
ENDSCRIPT

SCRIPT vehicle_PointRailSpinBail 
	StopBalanceTrick 
	SetSpeed 200 
	Vehicle_Bail 
ENDSCRIPT

vehicle_manual_ExceptionTable = [ 
	{ Exception Ex = Ollied Scr = Vehicle_Ollie } 
	{ Exception Ex = OffMeterBottom Scr = Vehicle_OnGround params = { land_manual = land_manual } } 
	{ Exception Ex = OffMeterTop Scr = Vehicle_Bail params = { manual = manual } } 
	{ Exception Ex = GroundGone Scr = Vehicle_Airborne } 
] 
SCRIPT vehicle_manual 
	IF NOT OnGround 
		SetException Ex = Landed Scr = manual params = { <...> } 
		RETURN 
	ENDIF 
	GetTags 
	IF gotparam grind_sound 
		skater : Obj_StopSound <grind_sound> 
	ENDIF 
	KillExtraTricks 
	SetTrickName "" 
	SettrickScore 0 
	Display Blockspin 
	IF LandedFromVert 
		Goto Vehicle_Land 
	ENDIF 
	ClearLipCombos 
	ResetLandedFromVert 
	NollieOff 
	ResetEventHandlersFromTable vehicle_manual_ExceptionTable 
	OnExceptionRun vehicle_CheckForNewTrick_ManualOut 
	LaunchStateChangeEvent State = Skater_InManual 
	ClearTrickQueue 
	SetQueueTricks NoTricks 
	SetManualTricks NoTricks 
	StartBalanceTrick 
	IF NOT IsNGC 
		Vibrate Actuator = 1 Percent = 25 
		OnExitRun KillManualVibration 
	ENDIF 
	SetRollingFriction default 
	DoBalanceTrick ButtonA = up ButtonB = down type = manual Tweak = 1 
	IF gotparam manual_init_anim 
		PlayAnim Anim = <manual_init_anim> Blendperiod = 0.30000001192 
	ENDIF 
	IF Obj_FlagSet FLAG_SKATER_MANUALCHEESE 
		IF gotparam CheckCheese 
			GetManualCheese 
			ManualCheese = ( <ManualCheese> + 1 ) 
			SetTags ManualCheese = <ManualCheese> 
			IF ( <ManualCheese> > 1 ) 
				AdjustBalance TimeAdd = 2 SpeedMult = 2 LeanMult = 1.20000004768 
			ENDIF 
		ENDIF 
	ELSE 
		Obj_SetFlag FLAG_SKATER_MANUALCHEESE 
		SetTags ManualCheese = 0 
	ENDIF 
	SetTrickName <manual_trick> 
	SettrickScore <manual_Score> 
	Display Blockspin 
	Obj_WaitAnimFinished 
	vehicle_manual2 
ENDSCRIPT

SCRIPT vehicle_CheckForNewTrick_ManualOut 
	
	RestoreEvents UsedBy = Extra Duration = 100 
	ManualOut 
	StopBalanceTrick 
ENDSCRIPT

SCRIPT vehicle_manual2 
	GetTags 
	IF gotparam grind_sound 
		skater : Obj_StopSound <grind_sound> 
	ENDIF 
	IF gotparam manual_balance_anim 
		PlayAnim Anim = <manual_balance_anim> Wobble wobbleparams = Manual_wobble_params 
	ENDIF 
	was_held = 0 
	BEGIN 
		IF gotparam extra_manual_trick 
			IF ( <was_held> = 1 ) 
				IF released r2 
					Goto vehicle_manual_trick 
				ENDIF 
			ELSE 
				IF held r2 
					was_held = 1 
				ENDIF 
			ENDIF 
		ENDIF 
		DoNextTrick 
		wait 1 gameframe 
	REPEAT 
ENDSCRIPT

SCRIPT vehicle_manual_trick 
	GetTags 
	IF gotparam grind_sound 
		skater : Obj_StopSound <grind_sound> 
	ENDIF 
	PlayAnim Anim = <revert_anim> 
	Obj_WaitAnimFinished 
	SetTrickName <extra_manual_trick> 
	SettrickScore <extra_manual_score> 
	Display 
	Goto vehicle_manual2 
ENDSCRIPT

SCRIPT vehicle_revert 
	GetTags 
	IF gotparam grind_sound 
		skater : Obj_StopSound <grind_sound> 
	ENDIF 
	IF NOT gotparam revert_anim 
		Goto Vehicle_Land 
	ENDIF 
	OnExitRun vehicle_exit_revert 
	InRevert 
	GetTags 
	ClearLipCombos 
	KillExtraTricks 
	SettrickScore 100 
	LaunchStateChangeEvent State = Skater_InRevert 
	IF NOT GetGlobalFlag flag = CHEAT_HOVERBOARD 
		Obj_SpawnScript CessTrail params = { repeat_times = 10 } 
		PlayCessSound 
		Vibrate Actuator = 0 Percent = 80 Duration = 0.50000000000 
		Vibrate Actuator = 1 Percent = 80 Duration = 0.10000000149 
	ENDIF 
	ClearException Ollied 
	SetSpecialFriction [ 0 , 0 , 5 , 10 , 15 , 25 ] Duration = 0.66699999571 
	SetQueueTricks NoTricks 
	NollieOff 
	PressureOff 
	PlayAnim Anim = <revert_anim> 
	SetTrickName <revert_trick> 
	Display Blockspin 
	Blendperiodout 0.00000000000 
	wait 0.10000000149 seconds 
	SetException Ex = Ollied Scr = Vehicle_Ollie 
	ResetLandedFromVert 
	Obj_WaitAnimFinished 
	IF gotparam canmanual 
		DoNextManualTrick 
	ENDIF 
	LandSkaterTricks 
	ClearEventBuffer 
	Goto veh_OnGroundAI 
ENDSCRIPT

SCRIPT vehicle_exit_revert 
	OutRevert 
	SetTrickName #"" 
	SettrickScore 0 
	Display Blockspin 
ENDSCRIPT

SCRIPT vehicle_wallplant 
	GetTags 
	IF gotparam grind_sound 
		skater : Obj_StopSound <grind_sound> 
	ENDIF 
	IF NOT gotparam canwallplant 
		RETURN 
	ENDIF 
	PressureOff 
	NollieOff 
	ClearException Ollied 
	LaunchStateChangeEvent State = Skater_InWallplant 
	Vibrate Actuator = 1 Percent = 100 Duration = 0.10000000149 
	SetTrickName "" 
	SettrickScore 0 
	Display Blockspin 
	PlayAnim Anim = <wallplant_anim> Blendperiod = 0 
	Blendperiodout 0 
	BoardRotateAfter 
	SetTrickName #"Sticker Slap" 
	SettrickScore 750 
	Display 
	skater : Obj_PlaySound SK6_StickerSlap_01 vol = 150 pitch = RANDOM_RANGE PAIR(98.00000000000, 105.00000000000) 
	GetStartTime 
	BEGIN 
		GetElapsedTime StartTime = <StartTime> 
		IF ( <ElapsedTime> > Post_Wallplant_No_Ollie_Window ) 
			BREAK 
		ENDIF 
		wait 1 gameframe 
	REPEAT 
	ClearEventBuffer Buttons = [ X ] OlderThan = 0 
	GetStartTime 
	BEGIN 
		GetElapsedTime StartTime = <StartTime> 
		IF ( <ElapsedTime> > Post_Wallplant_Allow_Ollie_Window ) 
			BREAK 
		ENDIF 
		wait 1 gameframe 
	REPEAT 
	Obj_WaitAnimFinished 
	boardrotate 
	Goto Vehicle_Airborne 
ENDSCRIPT

SCRIPT remove_all_anim_subsets 
	Obj_SetAnimSubsetWeight BlendWeight = 1.00000000000 
	IF Obj_AnimSubsetExists SubsetId = cloth 
		Obj_RemoveAnimSubset SubsetId = cloth 
	ENDIF 
	IF Obj_AnimSubsetExists SubsetId = throw 
		Obj_RemoveAnimSubset SubsetId = throw 
	ENDIF 
	IF Obj_AnimSubsetExists SubsetId = Second 
		Obj_RemoveAnimSubset SubsetId = Second 
	ENDIF 
	IF NOT gotparam not_wheels 
		IF Obj_AnimSubsetExists SubsetId = Wheels 
			Obj_RemoveAnimSubset SubsetId = Wheels 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT vehicle_default_start_script 
	ClearSkaterCamOverride 
	Obj_SetFlag FLAG_SKATER_CARMODE 
ENDSCRIPT

gurney_params = { 
	struct = gurney_params 
	racemode = gurney 
	startspeed = 0 
	turn_friction = 4 
	canbrake = 1 
	autokick = 1 
	board = 0 
	trick_score = 100 
	allow_vert = 0 
	allow_backwards = 0 
	BonelessHeight = 1 
	cangrind = 1 
	only_idle_when_stopped = 1 
	bailspeed = 100 
	blend_turn_anims = 1 
	trick_name = #"Gurney Air" 
	trick_score = 100 
	start_script = gurney_start_script 
	onground_script = veh_OnGroundAI 
	bail_script = gurney_bail_script 
	idle_anim = Gurney_stand_idle 
	crouch_anim = Gurney_Run 
	left_anim = Gurney_Run_TurnLeft 
	right_anim = Gurney_Run_TurnRight 
	leftidle_anim = Gurney_Run_TurnLeft 
	rightidle_anim = Gurney_Run_TurnRight 
	crouch_left_anim = Gurney_Run_TurnLeft 
	crouch_right_anim = Gurney_Run_TurnRight 
	crouch_leftidle_anim = Gurney_Run_TurnLeft 
	crouch_rightidle_anim = Gurney_Run_TurnRight 
	flail_anim = Gurney_Bump 
	ollie_anim = Gurney_Ollie 
	air_idle_anim = Gurney_AirIdle 
	land_anim = Gurney_Land 
	grind_init_anim = gurney_grind_init 
	grind_idle_anim = gurney_grind_range 
	grind_Out_Anim = gurney_grind_out 
	accel_anim = Gurney_Stand_To_Run 
	brake_anim = Gurney_stop 
	air_trick_init = Segway_Trick1_Init 
	air_trick_idle = Segway_Trick1_Idle 
	air_trick_out = Segway_Trick1_Out 
	soundstruct = BO_Gurney 
	bail_sound = ShoppingCartBail 
	land_sound = ShoppingCartLand 
} 
gurney_anims = [ { skater = Gurney_Run object = Gurney_Run_rider } 
	{ skater = Gurney_Run_1 object = Gurney_Run_1_rider } 
	{ skater = Gurney_stand_idle object = Gurney_stand_idle_rider } 
	{ skater = Gurney_Run_TurnLeft object = Gurney_Run_TurnLeft_rider } 
	{ skater = Gurney_Run_TurnRight object = Gurney_Run_TurnRight_rider } 
	{ skater = Gurney_Bump object = Gurney_Bump_rider } 
	{ skater = Gurney_Stand_To_Run object = Gurney_Stand_To_Run_rider } 
	{ skater = Gurney_Ollie object = Gurney_Ollie_rider } 
	{ skater = Gurney_AirIdle object = Gurney_AirIdle_rider } 
	{ skater = Gurney_Land object = Gurney_Land_rider } 
	{ skater = Gurney_stop object = Gurney_Stop_rider } 
	{ skater = gurney_grind_init object = gurney_grind_init_rider } 
	{ skater = gurney_grind_range object = gurney_grind_range_rider } 
	{ skater = gurney_grind_out object = gurney_grind_out_rider } 
] 
SCRIPT gurney_start_script 
	kill name = gurney 
	BO_AllParticlesOff 
	skater : AddGeom name = vehicle model = "models\\veh\\veh_gurney\\veh_gurney.skin" 
	skater : SwitchOffAtomic board 
	kill name = TRG_Ped_Sick_Kid 
	kill name = TRG_Gurney_Ghost 
	create name = TRG_Ped_Sick_Kid 
	TRG_Ped_Sick_Kid : Obj_LockToObject ObjectName = skater VECTOR(0.00000000000, 7.00000000000, 5.00000000000) 
	spawnscript gurney_play_appropriate_sick_kid_anims 
	TRG_Ped_Sick_Kid : SwitchOffBoard 
ENDSCRIPT

SCRIPT gurney_bail_script 
	SkaterVehicleOff 
	kill name = TRG_Ped_Sick_Kid 
	kill name = TRG_Tony_Ghost 
	IF CompositeObjectExists name = skater 
		skater : ClearGeom vehicle 
	ENDIF 
	IF CompositeObjectExists name = skater2 
		skater2 : ClearGeom vehicle 
	ENDIF 
	KillSpawnedScript name = gurney_play_appropriate_sick_kid_anims 
	NoSkaterVehicleSounds 
	spawnscript BO_Kill_Paramedics 
	spawnscript gurney_rider_bail 
	remove_all_anim_subsets 
	GurneyBail 
	SkaterLoopingSound_TurnOn 
ENDSCRIPT

SCRIPT gurney_rider_bail 
	BEGIN 
		IF ObjectExists id = BailGurney 
			IF ObjectExists id = gurney 
				kill name = gurney 
			ENDIF 
			create name = gurney 
			gurney : Obj_LockToObject bone = Bone_Board_Root ObjectName = BailGurney VECTOR(0.00000000000, 13.00000000000, 24.00000000000) 
			BailGurney : Obj_PlayAnim Anim = Gurney_Run Cycle 
			IF ObjectExists id = TRG_Ped_Sick_Kid 
				kill name = TRG_Ped_Sick_Kid 
			ENDIF 
			create name = TRG_Ped_Sick_Kid 
			TRG_Ped_Sick_Kid : Obj_LockToObject ObjectName = gurney VECTOR(0.00000000000, -12.00000000000, -25.00000000000) 
			TRG_Ped_Sick_Kid : Obj_PlayAnim Anim = Gurney_Run_rider Cycle 
			BREAK 
		ENDIF 
		wait 1 gameframe 
	REPEAT 
	wait 1 Second 
	IF ObjectExists id = BailGurney 
		BailGurney : die 
	ENDIF 
	IF ObjectExists id = TRG_Ped_Sick_Kid 
		kill name = TRG_Ped_Sick_Kid 
	ENDIF 
	IF ObjectExists id = gurney 
		kill name = gurney 
	ENDIF 
	skater : veh_blenturnanims_exit 
	create name = gurney 
	create name = TRG_Ped_Sick_Kid 
ENDSCRIPT

SCRIPT gurney_play_appropriate_sick_kid_anims 
	TRG_Ped_Sick_Kid : gurney_play_appropriate_sick_kid_anims2 array = gurney_anims 
ENDSCRIPT

SCRIPT gurney_play_appropriate_sick_kid_anims2 blend = 0.89999997616 
	GetTags 
	GetArraySize <array> 
	Obj_EnableAnimBlending enabled = 1 
	IF NOT gotparam parentID 
		<parentID> = skater 
	ENDIF 
	BEGIN 
		index = 0 
		BEGIN 
			SkaterAnim = ( ( <array> [ <index> ] ) . skater ) 
			ObjectAnim = ( ( <array> [ <index> ] ) . object ) 
			IF <parentID> : AnimEquals <SkaterAnim> 
				IF NOT AnimEquals <ObjectAnim> 
					IF gotparam Wobble 
						<parentID> : Obj_GetAnimSpeed <SkaterAnim> 
						Obj_PlayAnim Anim = <ObjectAnim> Wobble wobbleparams = grindwobble_params speed = <speed> blend = <blend> 
						BREAK 
					ELSE 
						<parentID> : Obj_GetAnimSpeed <SkaterAnim> 
						Obj_PlayAnim Anim = <ObjectAnim> NoRestart speed = <speed> blend = <blend> Cycle 
						BREAK 
					ENDIF 
				ENDIF 
			ENDIF 
			index = ( <index> + 1 ) 
		REPEAT <array_size> 
		wait 1 gameframe 
	REPEAT 
ENDSCRIPT

shoppingcart_params = { 
	struct = shoppingcart_params 
	racemode = shoppingcart 
	startspeed = 600 
	turn_friction = 4 
	canbrake = 0 
	autokick = 0 
	board = 1 
	allow_vert = 0 
	allow_backwards = 0 
	BonelessHeight = 1 
	cangrind = 1 
	canmanual = 1 
	trick_name = #"Cart Air" 
	trick_score = 100 
	start_script = shoppingcart_start_script 
	onground_script = ShoppingCart_OnGround_Loop 
	bail_script = shoppingcart_bail_script 
	idle_anim = Trolley_Idle 
	ollie_anim = Trolley_Ollie 
	air_idle_anim = Trolley_AirIdle 
	land_anim = Trolley_land 
	soft_land_anim = Trolley_SmallLand 
	sound = ShoppingCartLoop 
	bail_sound = ShoppingCartBail 
	ollie_sound = ShoppingCartOllie 
	land_sound = ShoppingCartLand 
} 
SCRIPT shoppingcart_start_script 
	IF ObjectExists id = ago_ShoppingCart 
		kill name = ago_ShoppingCart 
		create name = ago_ShoppingCart 
		ago_ShoppingCart : Obj_LockToObject ObjectName = skater VECTOR(2.00000000000, 4.00000000000, 0.00000000000) 
	ENDIF 
	SetSkaterCamOverride heading = 2 tilt = -0.20000000298 time = 0.00000100000 
	PlayAnim Anim = Trolley_PushFromStand Blendperiod = 0 
	Obj_WaitAnimFinished 
	ClearSkaterCamOverride 
	PlayAnim Anim = Trolley_Push Blendperiod = 0 
	Obj_WaitAnimFinished 
	PlayAnim Anim = Trolley_JumpIn Blendperiod = 0 
	Obj_WaitAnimFinished 
ENDSCRIPT

SCRIPT shoppingcart_bail_script 
	IF ObjectExists id = ago_ShoppingCart 
		kill name = ago_ShoppingCart 
	ENDIF 
	Trolley_BailB 
ENDSCRIPT

luge_params = { 
	struct = luge_params 
	racemode = luge 
	startspeed = 600 
	turn_friction = 4 
	accelerate_to = 800 
	acceleration = 10.00000000000 
	canbrake = 1 
	autokick = 1 
	board = 1 
	allow_vert = 0 
	allow_backwards = 0 
	BonelessHeight = 1 
	cangrind = 0 
	trick_name = #"Luge Hop" 
	trick_score = 100 
	start_script = luge_start_script 
	onground_script = CarMode_OnGround_Loop 
	idle_anim = luge_idle 
	brake_anim = Luge_Brake 
	left_anim = luge_IdleToLeanLeft 
	right_anim = luge_IdleToLeanRight 
	flail_anim = luge_Flail 
	ollie_anim = luge_ollie 
	air_idle_anim = Luge_AirIdle 
	land_anim = luge_land 
} 
SCRIPT luge_start_script 
	PlayAnim Anim = Luge_Push 
	Obj_WaitAnimFinished 
ENDSCRIPT

slalom_params = { 
	struct = slalom_params 
	racemode = slalom 
	startspeed = 600 
	turn_friction = 4 
	accelerate_to = 800 
	acceleration = 10.00000000000 
	canbrake = 1 
	autokick = 1 
	board = 1 
	allow_vert = 1 
	allow_backwards = 1 
	cangrind = 0 
	trick_name = #"Old School Ollie" 
	trick_score = 100 
	start_script = slalom_start_script 
	onground_script = CarMode_OnGround_Loop 
	bail_script = slalom_bail_script 
	idle_anim = slalom_idle 
	left_anim = Slalom_IdleToLeanLeft 
	right_anim = Slalom_IdleToLeanRight 
	flail_anim = Slalom_Flail 
	ollie_anim = slalom_ollie 
	air_idle_anim = slalom_AirIdle 
	land_anim = Slalom_land 
} 
SCRIPT slalom_start_script 
	PlayAnim Anim = Slalom_Push 
	Obj_WaitAnimFinished 
ENDSCRIPT

SCRIPT slalom_bail_script 
	NoseManualBail 
ENDSCRIPT

segway_params = { 
	struct = segway_params 
	racemode = segway 
	startspeed = 0 
	turn_friction = 0 
	canbrake = 1 
	autokick = 1 
	board = 1 
	allow_vert = 1 
	allow_backwards = 1 
	auto_correct_direction = 1 
	cangrind = 1 
	BonelessHeight = 1 
	dont_bail = 1 
	jump_name = #"Jump It" 
	jump_score = 100 
	grind_trick = "Grind It" 
	grind_score = 50 
	trick_name = #"One Footer" 
	trick_score = 100 
	trick_name2 = #"BarSpin" 
	trick_score2 = 50 
	start_script = segway_start_script 
	onground_script = veh_OnGroundAI 
	bail_script = segway_bail_script 
	idle_anim = segway_idle 
	crouch_anim = segway_crouch 
	left_anim = segway_IdleToLeanRight 
	right_anim = segway_IdleToLeanLeft 
	leftidle_anim = segway_LeanRight 
	rightidle_anim = segway_LeanLeft 
	crouch_left_anim = segway_crouchToLeanRight 
	crouch_right_anim = segway_crouchToLeanLeft 
	crouch_leftidle_anim = segway_crouch_LeanRight 
	crouch_rightidle_anim = segway_crouch_LeanLeft 
	flail_anim = segway_idle 
	ollie_anim = segway_ollie 
	air_idle_anim = segway_AirIdle 
	land_anim = segway_land 
	grind_init_anim = segway_grind_init 
	grind_idle_anim = segway_grind_range 
	grind_Out_Anim = segway_grind_out 
	accel_anim = segway_accel 
	brake_anim = segway_stop 
	air_trick_init = Segway_Trick1_Init 
	air_trick_idle = Segway_Trick1_Idle 
	air_trick_out = Segway_Trick1_Out 
	air_trick2 = Segway_FlipTrick1 
	wheel_anim = Segway_wheels_partial 
	soundstruct = BO_Segway 
	ollie_sound = SK6_BO_JesseRide_Jump 
	land_sound = SK6_BO_JesseRide_Land 
	grind_sound = SK6_BO_JesseRide_Grind 
} 
SCRIPT segway_start_script 
	Obj_SpawnScript vehicle_animate_wheels 
ENDSCRIPT

SCRIPT segway_bail_script 
	NoseManualBail 
ENDSCRIPT

SCRIPT segway_reenable_gurney 
	GetTags 
	IF ( <racemode> = segway ) 
		IF NOT GoalManager_HasWonGoal name = BO_Goal_Gaps7 
			IF NOT IsAlive name = TRG_Gurney_Ghost 
				create name = TRG_Gurney_Ghost 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

tricycle_params = { 
	struct = tricycle_params 
	racemode = tricycle 
	startspeed = 0 
	turn_friction = 0 
	canbrake = 1 
	autokick = 1 
	board = 1 
	allow_vert = 1 
	allow_backwards = 0 
	cangrind = 1 
	canmanual = 1 
	canwallplant = 1 
	BonelessHeight = 1 
	only_idle_when_stopped = 1 
	yaw_angles = PAIR(60.00000000000, 120.00000000000) 
	blend_turn_anims = 1 
	acceleration = 500 
	accelerate_to = 2000 
	jump_name = #"Jump" 
	jump_score = 100 
	grind_trick = "Grind" 
	grind_score = 50 
	trick_name = #"Superman Seatgrab" 
	trick_score = 100 
	grab_trick_speed = 1.50000000000 
	trick_name2 = #"BarSpin" 
	trick_score2 = 50 
	air_trick2_speed = 2.00000000000 
	revert_trick = #"Revert" 
	manual_trick = #"Wheelie" 
	manual_Score = 50 
	start_script = tricycle_start_script 
	onground_script = veh_OnGroundAI 
	bail_script = tricycle_bail 
	idle_anim = tricycle_stand 
	crouch_anim = tricycle_idle 
	left_anim = tricycle_turn_left 
	right_anim = tricycle_turn_right 
	leftidle_anim = tricycle_idle 
	rightidle_anim = tricycle_idle 
	crouch_left_anim = tricycle_turn_left 
	crouch_right_anim = tricycle_turn_right 
	crouch_leftidle_anim = tricycle_idle 
	crouch_rightidle_anim = tricycle_idle 
	flail_anim = tricycle_idle 
	ollie_anim = tricycle_ollie 
	air_idle_anim = tricycle_air_idle 
	land_anim = tricycle_land 
	grind_init_anim = tricycle_grind_init 
	grind_idle_anim = tricycle_grind_range 
	grind_Out_Anim = tricycle_grind_out 
	accel_anim = tricycle_start 
	brake_anim = tricycle_stop 
	manual_init_anim = tricycle_manual 
	manual_balance_anim = tricycle_manual_range 
	air_trick_init = tricycle_grabtrick_init 
	air_trick_idle = tricycle_grabtrick_idle 
	air_trick_out = tricycle_grabtrick_out 
	air_trick2 = tricycle_fliptrick 
	wheel_anim = tricycle_wheels 
	wallplant_anim = tricycle_wallplant 
	getup_anim = tricycle_getup 
	revert_anim = tricycle_revert 
	soundstruct = NO_Trike 
	ollie_sound = SK6_NO_TrikeJump 
	land_sound = SK6_NO_TrikeLand 
	grind_sound = SK6_NO_Trike_Grind 
} 
SCRIPT tricycle_start_script 
	Obj_GetId 
	TerminateObjectsScripts id = <Objid> script_name = vehicle_animate_wheels 
	Obj_SpawnScript vehicle_animate_wheels 
ENDSCRIPT

SCRIPT tricycle_bail 
	GetTags 
	ForceAutokickOff 
	IF ( <racemode> = mechbull ) 
		manual = 1 
	ENDIF 
	IF gotparam manual 
		PlayAnim Anim = Bail_Manual_BK 
	ELSE 
		PlayAnim Anim = Bail_Manual_FT 
	ENDIF 
	KillSpecial 
	ClearExceptions 
	BailSkaterTricks 
	StopBalanceTrick 
	Obj_WaitAnimFinished 
	IF gotparam getup_anim 
		PlayAnim Anim = <getup_anim> 
		Obj_WaitAnimFinished 
	ENDIF 
	NotInBail 
	Vehicle_Start params = <struct> 
ENDSCRIPT

wheelchair_params = { 
	struct = wheelchair_params 
	racemode = Wheelchair 
	startspeed = 0 
	turn_friction = 0 
	canbrake = 1 
	autokick = 1 
	board = 1 
	allow_vert = 1 
	allow_backwards = 0 
	cangrind = 1 
	canmanual = 1 
	canwallplant = 1 
	BonelessHeight = 1 
	yaw_angles = PAIR(60.00000000000, 120.00000000000) 
	jump_name = #"Chair Hop" 
	jump_score = 100 
	grind_trick = "Chair Grind" 
	grind_score = 50 
	trick_name = #"One Hander" 
	trick_score = 100 
	trick_name2 = #"Sit Flip" 
	trick_score2 = 50 
	air_trick2_speed = 1.50000000000 
	manual_trick = #"Wheelie" 
	manual_Score = 50 
	revert_trick = #"Spin-In" 
	extra_manual_trick = #"Weeeee!" 
	extra_manual_score = 50 
	start_script = turnwheels_start_script 
	onground_script = veh_OnGroundAI 
	bail_script = tricycle_bail 
	idle_anim = wheelchair_idle 
	crouch_anim = wheelchair_movingidle 
	left_anim = wheelchair_turnright 
	right_anim = wheelchair_turnleft 
	leftidle_anim = wheelchair_turnright_idle 
	rightidle_anim = wheelchair_turnleft_idle 
	crouch_left_anim = wheelchair_turnright 
	crouch_right_anim = wheelchair_turnleft 
	crouch_leftidle_anim = wheelchair_turnright_idle 
	crouch_rightidle_anim = wheelchair_turnleft_idle 
	flail_anim = wheelchair_idle 
	ollie_anim = wheelchair_ollie 
	air_idle_anim = wheelchair_airidle 
	land_anim = wheelchair_land 
	grind_init_anim = wheelchair_grind_init 
	grind_idle_anim = wheelchair_grind_range 
	grind_Out_Anim = wheelchair_grind_out 
	accel_anim = wheelchair_accel 
	brake_anim = wheelchair_brake 
	manual_init_anim = wheelchair_manual 
	manual_balance_anim = wheelchair_manual_range 
	air_trick_init = wheelchair_airtrick_init 
	air_trick_idle = wheelchair_airtrick_idle 
	air_trick_out = wheelchair_airtrick_out 
	air_trick2 = wheelchair_FlipTrick 
	wheel_anim = WheelChair_Wheels_Partial 
	revert_anim = wheelchair_revert 
	wallplant_anim = wheelchair_wallplant 
	getup_anim = wheelchair_getup 
	soundstruct = BE_PaulieWheelchair 
	ollie_sound = SK6_BE_Paulie_Jump 
	land_sound = SK6_BE_Paulie_Land 
	grind_sound = SK6_BE_Paulie_Grind 
} 
SCRIPT turnwheels_start_script 
	Obj_GetId 
	TerminateObjectsScripts id = <Objid> script_name = vehicle_animate_wheels 
	Obj_SpawnScript vehicle_animate_wheels 
ENDSCRIPT

minikart_params = { 
	struct = minikart_params 
	racemode = minikart 
	startspeed = 0 
	turn_friction = 0 
	canbrake = 1 
	autokick = 1 
	board = 1 
	allow_vert = 1 
	allow_backwards = 0 
	cangrind = 1 
	canmanual = 1 
	canwallplant = 1 
	jumpheight = 600 
	yaw_angles = PAIR(60.00000000000, 120.00000000000) 
	jump_name = #"Jump" 
	jump_score = 100 
	grind_trick = "Grind" 
	grind_score = 50 
	trick_name = #"Toe Hang" 
	trick_score = 100 
	trick_name2 = #"Flip" 
	trick_score2 = 50 
	manual_trick = #"Wheelie" 
	manual_Score = 50 
	revert_trick = #"Spin-In" 
	start_script = turnwheels_start_script 
	onground_script = veh_OnGroundAI 
	bail_script = tricycle_bail 
	idle_anim = veh_minikart_idle 
	crouch_anim = veh_minikart_idlemoving 
	left_anim = veh_minikart_turnleft 
	right_anim = veh_minikart_turnright 
	leftidle_anim = veh_minikart_turnleft_idle 
	rightidle_anim = veh_minikart_turnright_idle 
	crouch_left_anim = veh_minikart_turnleft 
	crouch_right_anim = veh_minikart_turnright 
	crouch_leftidle_anim = veh_minikart_turnleft_idle 
	crouch_rightidle_anim = veh_minikart_turnright_idle 
	flail_anim = veh_minikart_bump 
	ollie_anim = veh_minikart_ollie 
	air_idle_anim = veh_minikart_AirIdle 
	land_anim = veh_minikart_land 
	grind_init_anim = veh_minikart_grind_init 
	grind_idle_anim = veh_minikart_grind_range 
	grind_Out_Anim = veh_minikart_grind_out 
	accel_anim = veh_minikart_accel 
	brake_anim = veh_minikart_brake 
	air_trick_init = veh_minikart_grabtrick_Init 
	air_trick_idle = veh_minikart_grabtrick_Idle 
	air_trick_out = veh_minikart_grabtrick_Out 
	wheel_anim = veh_minikart_wheels 
	manual_init_anim = veh_minikart_wheelie_init 
	manual_balance_anim = veh_minikart_wheelie_range 
	air_trick2 = veh_minikart_FlipTrick 
	revert_anim = veh_minikart_revert 
	wallplant_anim = veh_minikart_wallplant 
	getup_anim = veh_minikart_getup 
	soundstruct = AU_AborigineCart 
	ollie_sound = AU_KartJump 
	land_sound = AU_KartLand 
	grind_sound = AU_KartGrind 
} 
mechbull_params = { 
	struct = mechbull_params 
	racemode = mechbull 
	startspeed = 0 
	turn_friction = 0 
	canbrake = 1 
	autokick = 1 
	board = 1 
	allow_vert = 1 
	allow_backwards = 0 
	cangrind = 1 
	canmanual = 1 
	canwallplant = 1 
	BonelessHeight = 1 
	yaw_angles = PAIR(60.00000000000, 120.00000000000) 
	blend_turn_anims = 1 
	jump_name = #"Jump" 
	jump_score = 100 
	grind_trick = "Grind" 
	grind_score = 50 
	trick_name = #"Yee Haw!" 
	trick_score = 100 
	trick_name2 = #"Bull flip" 
	trick_score2 = 50 
	air_trick2_speed = 2.00000000000 
	revert_trick = #"Revert" 
	manual_trick = #"Wheelie" 
	manual_Score = 50 
	start_script = turnwheels_start_script 
	onground_script = veh_OnGroundAI 
	bail_script = tricycle_bail 
	idle_anim = veh_bull_idle 
	crouch_anim = veh_bull_idlemoving 
	left_anim = veh_bull_turnleft 
	right_anim = veh_bull_turnright 
	leftidle_anim = veh_bull_turnleft_idle 
	rightidle_anim = veh_bull_turnright_idle 
	crouch_left_anim = veh_bull_turnleft 
	crouch_right_anim = veh_bull_turnright 
	crouch_leftidle_anim = veh_bull_turnleft_idle 
	crouch_rightidle_anim = veh_bull_turnright_idle 
	flail_anim = veh_bull_bump 
	ollie_anim = veh_bull_ollie 
	air_idle_anim = veh_bull_AirIdle 
	land_anim = veh_bull_land 
	grind_init_anim = veh_bull_grind_init 
	grind_idle_anim = veh_bull_grind_range 
	grind_Out_Anim = veh_bull_grind_out 
	accel_anim = veh_bull_accel 
	brake_anim = veh_bull_brake 
	air_trick_init = veh_bull_GrabTrick_Init 
	air_trick_idle = veh_bull_GrabTrick_Idle 
	air_trick_out = veh_bull_GrabTrick_Out 
	air_trick2 = veh_bull_fliptrick 
	manual_init_anim = veh_bull_wheelie_init 
	manual_balance_anim = veh_bull_wheelie_range 
	wheel_anim = veh_bull_wheels 
	wallplant_anim = veh_bull_wallplant 
	revert_anim = veh_bull_revert 
	getup_anim = veh_bull_getup 
	soundstruct = BA_SteveOBull 
	ollie_sound = SK6_BA_Steveo_Buck_11 
	land_sound = SK6_BA_Steveo_Buck02_11 
	bail_sound = SK6_BA_Steveo_Jump 
	grind_sound = SK6_BA_SteveO_Grind 
} 
chainsaw_params = { 
	struct = chainsaw_params 
	racemode = chainsaw 
	startspeed = 0 
	turn_friction = 0 
	canbrake = 1 
	autokick = 1 
	board = 1 
	allow_vert = 1 
	allow_backwards = 0 
	cangrind = 0 
	canwallplant = 1 
	BonelessHeight = 1 
	jump_name = #"Ollie" 
	jump_score = 100 
	grind_trick = "Grind" 
	grind_score = 50 
	trick_name = #"Grab Trick" 
	trick_score = 100 
	trick_name2 = #"Fliptrick" 
	trick_score2 = 50 
	revert_trick = #"Revert" 
	onground_script = veh_OnGroundAI 
	bail_script = tricycle_bail 
	idle_anim = MotoSkateboard_stationaryidle 
	crouch_anim = MotoSkateboard_movingidle 
	left_anim = MotoSkateboard_turnleft 
	right_anim = MotoSkateboard_turnright 
	leftidle_anim = MotoSkateboard_turnleftidle 
	rightidle_anim = MotoSkateboard_turnrightidle 
	crouch_left_anim = MotoSkateboard_turnleft 
	crouch_right_anim = MotoSkateboard_turnright 
	crouch_leftidle_anim = MotoSkateboard_turnleftidle 
	crouch_rightidle_anim = MotoSkateboard_turnrightidle 
	flail_anim = MotoSkateboard_bump 
	ollie_anim = MotoSkateboard_ollie 
	air_idle_anim = MotoSkateboard_AirIdle 
	land_anim = MotoSkateboard_land 
	accel_anim = MotoSkateboard_accel 
	brake_anim = MotoSkateboard_brake 
	air_trick_init = MotoSkateboard_GrabTrick_Init 
	air_trick_idle = MotoSkateboard_GrabTrick_Idle 
	air_trick2 = MotoSkateboard_fliptrick 
	wallplant_anim = MotoSkateboard_wallplant 
	revert_anim = MotoSkateboard_revert 
	getup_anim = MotoSkateboard_getup 
} 
SCRIPT kill_all_vehicles 
	IF NOT InNetGame 
		IF IsSkaterOnVehicle 
			SkaterVehicleOff 
			remove_all_anim_subsets 
			GetTags 
			SWITCH <racemode> 
				CASE gurney 
					reset_gurney 
				CASE default 
			ENDSWITCH 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT reset_gurney 
	IF IsSkaterOnVehicle 
		GetTags 
		IF ( <racemode> = gurney ) 
			SkaterVehicleOff 
			kill name = TRG_Ped_Sick_Kid 
			KillSpawnedScript name = gurney_play_appropriate_sick_kid_anims 
			skater : Obj_StopSound <sound> 
			ClearGeom vehicle 
			IF ObjectExists id = gurney 
				kill name = gurney 
			ENDIF 
			IF gotparam show_gurney 
				create name = gurney 
				create name = TRG_Ped_Sick_Kid 
			ENDIF 
			IF NOT gotparam no_ai 
				MakeSkaterGoto OnGroundAI 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT vehicle_ped_script 
	Obj_PlayAnim Anim = ( <params> . idle_anim ) 
ENDSCRIPT

SCRIPT motoskateboard_bail 
	MakeSkaterGoto YawBail 
ENDSCRIPT

SCRIPT Trick_Motoskateboard_Grind 
	Grind { name = #"Chainsaw Grind" Score = 100 InitAnim = Init_FiftyFifty Anim = FiftyFifty2_range Anim2 = FiftyFifty_range Anim3 = FiftyFifty3_range type = Grind NoBlend = <NoBlend> 
	GrindBail = FiftyFiftyFall motoskateboard_grind } 
ENDSCRIPT

Motoskateboard_AirTricks = 
[ 
	{ Trigger = { Press , circle , 500 } Scr = GrabTrick params = { name = #"Hairy Foot Grab" Score = 400 Anim = Method Idle = Method_Idle speed = 1.20000004768 } } 
	{ Trigger = { Press , square , 500 } Scr = FlipTrick params = { name = #"Bigfoot Flip" Score = 100 Anim = Kickflip Nollie = NollieKickflip xExtraTricks = DoubleKickflip } } 
] 

