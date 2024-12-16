
ExcludeFromScriptDebug = 
[ 
	waitonegameframe 
	Obj_WaitAnimFinished 
	waitanimwhilstchecking 
	WaitWhilstChecking 
	just_coasting 
	DoCrouch_slope 
	PlayBrakeAnim 
	CessBrake 
	CheckforSwitchVehicles 
	cheese_jump 
	PlayTurnAnimOrTurnIdle 
	SetException 
	SetEventHandler 
	ClearException 
	ClearExceptionGroup 
	WaitWalking 
	WaitAnimWalking 
	WaitWalkingFrame 
	WaitAnimWalkingFrame 
	PlaySpeedChosenAnim 
	RunSpeedChosenAnim 
	CycleSpeedChosenAnim 
	hide_run_timer_piece 
	SetExceptionHandler 
	PlayWalkAnim 
	CheckForNetBrake 
	get_projectile_controls 
	TantrumOff 
] 
CrouchIdles = [ CrouchIdle CrouchIdle CrouchIdle2 CrouchIdle2 CrouchIdle4 CrouchIdle4 CrouchLookDown CrouchLookLeft CrouchLookRight CrouchShiftFoot CrouchIdleAdjustFeet ] 
CrouchIdlesCrappy = [ CrouchIdle_Crappy ] 
CrouchIdlesCool = [ CrouchIdle_Cool ] 
CrouchTurnLeftAnims = [ CrouchTurnLeft CrouchTurnLeft2 ] 
CrouchTurnLeftAnimsCrappy = [ CrouchTurnLeft_Crappy ] 
CrouchTurnLeftAnimsCool = [ CrouchTurnLeft_Cool ] 
CrouchTurnLeftIdles = [ CrouchTurnLeftIdle CrouchTurnLeftIdle2 ] 
CrouchTurnLeftIdlesCrappy = [ CrouchTurnLeftIdle_Crappy ] 
CrouchTurnLeftIdlesCool = [ CrouchTurnLeftIdle_Cool ] 
CrouchTurnRightAnims = [ CrouchTurnRight CrouchTurnRight2 ] 
CrouchTurnRightAnimsCrappy = [ CrouchTurnRight_Crappy ] 
CrouchTurnRightAnimsCool = [ CrouchTurnRight_Cool ] 
CrouchTurnRightIdles = [ CrouchTurnRightIdle CrouchTurnRightIdle2 ] 
CrouchTurnRightIdlesCrappy = [ CrouchTurnRightIdle_Crappy ] 
CrouchTurnRightIdlesCool = [ CrouchTurnRightIdle_Cool ] 
TurnRightIdles = [ TurnRightIdle ] 
TurnRightIdlesCrappy = [ TurnRightIdle_Crappy ] 
TurnRightIdlesCool = [ TurnRightIdle_Cool ] 
TurnLeftIdles = [ TurnLeftIdle ] 
TurnLeftIdlesCrappy = [ TurnLeftIdle_Crappy ] 
TurnLeftIdlesCool = [ TurnLeftIdle_Cool ] 
TurnRightAnims = [ TurnRight ] 
TurnRightAnimsCrappy = [ TurnRight_Crappy ] 
TurnRightAnimsCool = [ TurnRight_Cool ] 
TurnLeftAnims = [ TurnLeft ] 
TurnLeftAnimsCrappy = [ TurnLeft_Crappy ] 
TurnLeftAnimsCool = [ TurnLeft_Cool ] 
EXPERT_MODE_NO_REVERTS = 0 
EXPERT_MODE_NO_WALKING = 0 
EXPERT_MODE_NO_MANUALS = 0 
perfect_landing_slop = 5 
SCRIPT DumpSkaterEventHandlerTable 
	PrintEventHandlerTable 
ENDSCRIPT

SCRIPT KillingSkater 
	ClearExceptions 
	ClearExceptionGroup Group = RunTimerEvents 
	ClearExceptionGroup Group = WalkingEndRunEvents 
ENDSCRIPT

bigboard = 0 
SCRIPT SkaterInit 
	ClearAllExceptionGroups 
	IF NOT GotParam no_board 
		SwitchOnBoard 
	ELSE 
		SwitchOffBoard 
	ENDIF 
	Obj_StopStream 
	Unhide 
	UnpausePhysics 
	NotInBail 
	BashOff 
	ExitTantrum 
	TantrumOff 
	NollieOff 
	PressureOff 
	NotifyBailDone 
	Obj_KillSpawnedScript name = BailBoardControl 
	Obj_KillSpawnedScript name = TantrumCheck 
	ClearLipCombos 
	AllowRailTricks 
	Obj_KillSpawnedScript name = SetUpLipCombo 
	ClearTrickQueues 
	SetCurrentBailEndpose 
	Obj_KillSpawnedScript name = GetBonus_exit 
	reset_gurney 
	ProjectilesOn 
	UnsetThrowingProjectile 
	StatsManager_Reset 
	ResetLandedFromVert 
	BlendperiodOut 0 
	SetTags AcidDropCheese = 0 in_manual_land = 0 
	PressureOff 
	UnSetForceWalk 
	ResetIsFlipping 
	InitializeStateChangeEvent 
	SetTags racemode = none 
	IF NOT GotParam NoEndRun 
		SetException Ex = RunHasEnded Scr = EndOfRun 
		SetException Ex = GoalHasEnded Scr = Goal_EndOfRun 
	ENDIF 
	StopBalanceTrick 
	IF Skitching 
		StopSkitch 
		setstate ground 
	ENDIF 
	SetEventHandler Ex = KillingSkater Scr = KillingSkater Group = KillingSkaterGroup 
	SetEventHandler Ex = DumpSkaterEventHandlerTable Scr = DumpSkaterEventHandlerTable Group = DebugSkaterGroup 
	VibrateOff 
	ClearSkaterFlags 
	IF NOT GotParam NoAnims 
		IF NOT ( in_cinematic_sequence = 1 ) 
			PlayStyleAnim anim = idle 
		ENDIF 
	ENDIF 
	Obj_KillSpawnedScript name = BloodSmall 
	Obj_KillSpawnedScript name = BloodSplat 
	Obj_KillSpawnedScript name = SkaterBloodOn 
	RunTimerController_Reset 
	ResetSkaterParticleSystems 
	LockVelocityDirection Off 
	CanBrakeOn 
	RestoreAutoKick 
	OverrideLimits End 
	SetSlomo 1 
	kill_blur 
	KillExtraTricks 
	created_trick_cleanup 
	ClearSkaterCamOverride 
	LandSkaterTricks 
	set_skater_anim_handlers 
	set_skater_particle_handlers 
	EnableInputEvents 
	IF GotParam ReturnControl 
		RETURN 
	ENDIF 
	IF IsBoardMissing 
		Walk = 1 
	ENDIF 
	IF IsSkaterOnVehicle 
		GetSingleTag struct 
		Vehicle_Start Params = <struct> 
	ENDIF 
	IF NOT GotParam Walk 
		Goto Switch_OnGroundAi Params = { NewScript = OnGroundAi Restart } 
	ELSE 
		Goto Switch_OnGroundAi Params = { NewScript = Walking_OnGroundAi Restart } 
	ENDIF 
ENDSCRIPT

SCRIPT ClientSkaterInit 
	SwitchOffAtomic special_item 
ENDSCRIPT

OnGroundExceptionTable = [ 
	{ Exception Ex = GroundGone Scr = GroundGone } 
	{ Exception Ex = Ollied Scr = Ollie } 
	{ Exception Ex = FlailHitWall Scr = FlailHitWall } 
	{ Exception Ex = FlailLeft Scr = FlailLeft } 
	{ Exception Ex = FlailRight Scr = FlailRight } 
	{ Exception Ex = Carplant Scr = Carplant } 
	{ Exception Ex = CarBail Scr = CarBail } 
	{ Exception Ex = SkaterCollideBail Scr = SkaterCollideBail } 
	{ Exception Ex = Skitched Scr = Skitch } 
	{ Exception Ex = MadeOtherSkaterBail Scr = MadeOtherSkaterBail } 
	{ Exception Ex = WallPush Scr = Ground_WallPush } 
] 
SCRIPT OnGroundExceptions 
	OnExceptionRun 
	ResetEventHandlersFromTable OnGroundExceptionTable 
	EnableInputEvents 
	IF NOT GotParam NoEndRun 
		SetException Ex = RunHasEnded Scr = EndOfRun 
		SetException Ex = GoalHasEnded Scr = Goal_EndOfRun 
		IF GoalManager_GoalShouldExpire 
			ClearException Ollied 
			ClearException GroundGone 
			ClearException WallPush 
		ENDIF 
	ENDIF 
	SetSkaterGroundTricks 
	LaunchStateChangeEvent State = Skater_OnGround 
	VibrateOff 
	SwitchOnBoard 
	EnablePlayerInput 
	BailOff 
	BashOff 
	SetRollingFriction default 
	CanSpin 
	AllowRailTricks 
	Obj_ClearFlag FLAG_SKATER_MANUALCHEESE 
	BloodParticlesOff 
	IF NOT GotParam NoEndRun 
		ResetLandedFromVert 
	ENDIF 
ENDSCRIPT

SCRIPT SetSkaterGroundTricks 
	IF inNetGame 
		IF NOT GetGlobalFlag flag = FLAG_G_EXPERT_MODE_NO_WALKING 
			IF NOT GetGlobalFlag flag = FLAG_EXPERT_MODE_NO_WALKING 
				SetQueueTricks Jumptricks GroundTricks SkateToWalkTricks 
			ELSE 
				SetQueueTricks Jumptricks GroundTricks 
			ENDIF 
		ELSE 
			SetQueueTricks Jumptricks GroundTricks 
		ENDIF 
	ELSE 
		IF NOT GetGlobalFlag flag = FLAG_EXPERT_MODE_NO_WALKING 
			SetQueueTricks Jumptricks GroundTricks SkateToWalkTricks 
		ELSE 
			IF IsOnMotoSkateboard 
				SetQueueTricks NoTricks 
			ELSE 
				SetQueueTricks Jumptricks GroundTricks 
			ENDIF 
		ENDIF 
	ENDIF 
	SetExtraGrindTricks special = SpecialGrindTricks GrindTricks 
	IF NOT GetGlobalFlag flag = FLAG_EXPERT_MODE_NO_MANUALS 
		IF NOT ( ( inNetGame ) & ( GetGlobalFlag flag = FLAG_G_EXPERT_MODE_NO_MANUALS ) ) 
			IF IsOnMotoSkateboard 
				SetManualTricks VehicleManualTricks 
			ELSE 
				SetManualTricks special = SpecialManualTricks GroundManualTricks 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

InAirExceptionTable = [ 
	{ Exception Ex = Landed Scr = Land } 
	{ Exception Ex = WallRideLeft Scr = WallRide Params = { Left } } 
	{ Exception Ex = WallRideRight Scr = WallRide Params = { Right } } 
	{ Exception Ex = WallPlant Scr = Air_WallPlant } 
	{ Exception Ex = Vert_WallPlant Scr = Vert_WallPlant } 
	{ Exception Ex = PointRail Scr = PointRail } 
	{ Exception Ex = PointRailSpin Scr = PointRailSpin } 
	{ Exception Ex = CarBail Scr = CarBail } 
	{ Exception Ex = SkaterCollideBail Scr = SkaterCollideBail } 
	{ Event Ex = Carplant Scr = Carplant } 
	{ Event Ex = MadeOtherSkaterBail Scr = MadeOtherSkaterBailAir } 
] 
SCRIPT InAirExceptions 
	OnExceptionRun 
	ResetEventHandlersFromTable InAirExceptionTable 
	SetSkaterAirTricks 
	LaunchStateChangeEvent State = Skater_InAir 
	IF NOT GotParam AllowVibration 
		VibrateOff 
	ENDIF 
	EnablePlayerInput 
	BailOff 
	BashOff 
	SetRollingFriction default 
	setstate Air 
	CanSpin 
	OverrideCancelGround Off 
ENDSCRIPT

SCRIPT SetSkaterAirManualTricks 
	IF NOT GetGlobalFlag flag = FLAG_EXPERT_MODE_NO_MANUALS 
		IF NOT ( ( inNetGame ) & ( GetGlobalFlag flag = FLAG_G_EXPERT_MODE_NO_MANUALS ) ) 
			IF IsOnMotoSkateboard 
				SetManualTricks VehicleManualTricks 
			ELSE 
				SetManualTricks special = SpecialManualTricks Manualtricks 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT SetSkaterAirTricks 
	IF IsOnMotoSkateboard 
		SetQueueTricks Motoskateboard_AirTricks 
	ELSE 
		IF InPressure 
			IF NOT GotParam NoSkateToWalkTricks 
				IF ( ( GetGlobalFlag flag = FLAG_EXPERT_MODE_NO_WALKING ) | ( ( inNetGame ) & ( GetGlobalFlag flag = FLAG_G_EXPERT_MODE_NO_WALKING ) ) ) 
					IF NOT GotParam AllowWallplantOllie 
						SetQueueTricks special = SpecialTricks PressureTricks2 AirTricks 
					ELSE 
						SetQueueTricks special = SpecialTricks PressureTricks2 AirTricks WallplantOllie 
					ENDIF 
				ELSE 
					IF NOT GotParam AllowWallplantOllie 
						SetQueueTricks special = SpecialTricks PressureTricks2 AirTricks SkateToWalkTricks 
					ELSE 
						SetQueueTricks special = SpecialTricks PressureTricks2 AirTricks SkateToWalkTricks WallplantOllie 
					ENDIF 
				ENDIF 
			ELSE 
				IF NOT GotParam AllowWallplantOllie 
					SetQueueTricks special = SpecialTricks PressureTricks2 AirTricks 
				ELSE 
					SetQueueTricks special = SpecialTricks PressureTricks2 AirTricks WallplantOllie 
				ENDIF 
			ENDIF 
		ELSE 
			IF NOT GotParam NoSkateToWalkTricks 
				IF ( ( GetGlobalFlag flag = FLAG_EXPERT_MODE_NO_WALKING ) | ( ( inNetGame ) & ( GetGlobalFlag flag = FLAG_G_EXPERT_MODE_NO_WALKING ) ) ) 
					IF NOT GotParam AllowWallplantOllie 
						SetQueueTricks special = SpecialTricks AirTricks 
					ELSE 
						SetQueueTricks special = SpecialTricks AirTricks WallplantOllie 
					ENDIF 
				ELSE 
					IF NOT GotParam AllowWallplantOllie 
						SetQueueTricks special = SpecialTricks AirTricks SkateToWalkTricks 
					ELSE 
						SetQueueTricks special = SpecialTricks AirTricks SkateToWalkTricks WallplantOllie 
					ENDIF 
				ENDIF 
			ELSE 
				IF NOT GotParam AllowWallplantOllie 
					SetQueueTricks special = SpecialTricks AirTricks 
				ELSE 
					SetQueueTricks special = SpecialTricks AirTricks WallplantOllie 
				ENDIF 
			ENDIF 
		ENDIF 
		SetExtraGrindTricks special = SpecialGrindTricks GrindTricks 
		SetSkaterAirManualTricks 
	ENDIF 
ENDSCRIPT

SCRIPT ClearTrickQueues 
	ClearTrickQueue 
	ClearManualTrick 
	ClearExtraGrindTrick 
ENDSCRIPT

SCRIPT OnGroundAi Coasting = 0 Pushes = 0 PressureTimer = 0 
	IF NOT OnGround 
		setstate ground 
	ENDIF 
	OnGroundExceptions 
	OnExitRun kill_cloth_anims 
	NollieOff 
	BEGIN 
		IF NOT Obj_AnimSubsetExists SubsetId = Cloth 
			Obj_KillSpawnedScript name = on_ground_cloth_anims 
			Obj_SpawnScript on_ground_cloth_anims 
		ENDIF 
		GetSlope 
		IF LeftPressed 
			IF Crouched 
				IF Flipped 
					PlayTurnAnimOrTurnIdle TurnAnims = CrouchTurnRight 
				ELSE 
					PlayTurnAnimOrTurnIdle TurnAnims = CrouchTurnLeft 
				ENDIF 
			ELSE 
				IF Flipped 
					PlayTurnAnimOrTurnIdle TurnAnims = TurnRight 
				ELSE 
					PlayTurnAnimOrTurnIdle TurnAnims = TurnLeft 
				ENDIF 
			ENDIF 
		ELSE 
			IF RightPressed 
				IF Crouched 
					IF Flipped 
						PlayTurnAnimOrTurnIdle TurnAnims = CrouchTurnLeft 
					ELSE 
						PlayTurnAnimOrTurnIdle TurnAnims = CrouchTurnRight 
					ENDIF 
				ELSE 
					IF Flipped 
						PlayTurnAnimOrTurnIdle TurnAnims = TurnLeft 
					ELSE 
						PlayTurnAnimOrTurnIdle TurnAnims = TurnRight 
					ENDIF 
				ENDIF 
			ELSE 
				IF Crouched 
					DoCrouch_slope Slope = <Slope> ChangeInSlope = <ChangeInSlope> 
				ELSE 
					IF Braking 
						IF SpeedLessThan 1 
							PlayBrakeAnim 
							IF HeldLongerThan Button = down 2 second 
								IF NOT IsInBail 
									Goto HandBrake 
								ENDIF 
							ENDIF 
						ELSE 
							IF HeldLongerThan Button = down 0.20000000298 second 
								CessBrake 
							ELSE 
								PlayBrakeAnim 
							ENDIF 
						ENDIF 
					ELSE 
						IF ( <Slope> > PUSH_IF_SLOPE ) 
							IF AutoKickIsOff 
								OnGround_AutoKickOff_UpHill 
							ELSE 
								DoAPush 
							ENDIF 
						ELSE 
							IF AutoKickIsOff 
								OnGround_AutoKickOff_Flat 
							ELSE 
								just_coasting 
							ENDIF 
						ENDIF 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
		DoNextTrick 
		DoNextManualTrick 
		waitonegameframe 
		IF inNetGame 
			CheckForNetBrake 
		ENDIF 
	REPEAT 
ENDSCRIPT

SCRIPT on_ground_cloth_anims 
	IF IsThrowingProjectile 
		IF Obj_AnimSubsetExists SubsetId = Cloth 
			Obj_RemoveAnimSubset SubsetId = Cloth 
		ENDIF 
		RETURN 
	ENDIF 
	IF NOT Obj_AnimSubsetExists SubsetId = Cloth 
		Obj_AddAnimSubset SubsetId = Cloth EnableBlending 
		IF Obj_AnimationFlipped 
			Obj_Flip SubsetId = Cloth 
		ENDIF 
	ENDIF 
	IF SpeedGreaterThan 100 
		Obj_SetAnimSubsetWeight SubsetId = Cloth BlendWeight = 1 BlendDuration = 0.10000000149 
		PlayAnim SubsetId = Cloth anim = Cloth_Airflow_Partial speed = 1 
		IF Obj_AnimSubsetExists SubsetId = Cloth 
			Obj_WaitAnimFinished SubsetId = Cloth 
		ENDIF 
	ENDIF 
	IF Obj_AnimSubsetExists SubsetId = Cloth 
		Obj_RemoveAnimSubset SubsetId = Cloth 
	ENDIF 
ENDSCRIPT

SCRIPT kill_cloth_anims 
	Obj_KillSpawnedScript name = on_ground_cloth_anims 
ENDSCRIPT

crouch_wobble_params = { 
	WobbleAmpA = { PAIR(10.10000038147, 10.10000038147) STATS_RAILBALANCE } 
	WobbleAmpB = { PAIR(10.10000038147, 10.10000038147) STATS_RAILBALANCE } 
	WobbleK1 = { PAIR(20.00000000000, 20.00000000000) STATS_RAILBALANCE } 
	WobbleK2 = { PAIR(10.00000000000, 10.00000000000) STATS_RAILBALANCE } 
	SpazFactor = { PAIR(1.00000000000, 1.00000000000) STATS_RAILBALANCE } 
} 
SCRIPT PlayTurnAnimOrTurnIdle 
	GetTurnAnimArrays TurnAnims = <TurnAnims> 
	IF NOT AnimEquals <TurnIdles> 
		IF NOT AnimEquals <TurnAnims> 
			GetRandomArrayElement <TurnAnims> 
			PlayAnim anim = <Element> NoRestart 
			SetTags TurnAnimIndex = <index> 
			IF NOT IsThrowingProjectile 
				Obj_SpawnScript handle_cloth_subset Params = { anim = ( <TurnAnims> [ <index> ] ) idle = ( <TurnIdles> [ <index> ] ) } 
				IF NOT Obj_AnimSubsetExists SubsetId = Cloth 
					Obj_AddAnimSubset SubsetId = Cloth EnableBlending 
					IF Obj_AnimationFlipped 
						Obj_Flip SubsetId = Cloth 
					ENDIF 
				ENDIF 
				Obj_SetAnimSubsetWeight SubsetId = Cloth BlendWeight = 1 BlendDuration = 0.10000000149 
				PlayAnim SubsetId = Cloth anim = Cloth_Airflow_Partial speed = 1 cycle 
			ELSE 
				IF Obj_AnimSubsetExists SubsetId = Cloth 
					Obj_RemoveAnimSubset SubsetId = Cloth 
				ENDIF 
			ENDIF 
		ENDIF 
		IF AnimFinished 
			GetSingleTag TurnAnimIndex 
			index = <TurnAnimIndex> 
			PlayStyleAnim anim = ( <TurnIdles> [ <index> ] ) cycle NoRestart 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT handle_cloth_subset 
	BEGIN 
		IF NOT AnimEquals <anim> 
			IF NOT AnimEquals <idle> 
				IF Obj_AnimSubsetExists SubsetId = Cloth 
					Obj_RemoveAnimSubset SubsetId = Cloth 
				ENDIF 
				BREAK 
			ENDIF 
		ENDIF 
		wait 1 gameframe 
	REPEAT 
ENDSCRIPT

SCRIPT PlaySingleTurnAnimOrTurnIdle 
	IF NOT AnimEquals <TurnIdle> 
		IF NOT AnimEquals <turnanim> 
			PlayStyleAnim anim = <turnanim> NoRestart 
		ENDIF 
		IF AnimFinished 
			PlayStyleAnim anim = <TurnIdle> cycle NoRestart 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT DoCrouch_slope 
	IF ( ( <ChangeInSlope> > 5 ) | ( <ChangeInSlope> < -5 ) ) 
		IF AnimEquals [ CrouchBumpUp CrouchBumpDown CrouchBumpUp_Crappy CrouchBumpDown_Crappy CrouchBumpUp_Cool CrouchBumpDown_Cool ] 
			IF AnimFinished 
				IF ( <ChangeInSlope> > 5 ) 
					PlayStyleAnim anim = CrouchBumpUp Blendperiod = 0.30000001192 
				ELSE 
					PlayStyleAnim anim = CrouchBumpDown Blendperiod = 0.30000001192 
				ENDIF 
			ENDIF 
		ELSE 
			IF ( <ChangeInSlope> > 5 ) 
				PlayStyleAnim anim = CrouchBumpUp Blendperiod = 0.30000001192 
			ELSE 
				PlayStyleAnim anim = CrouchBumpDown Blendperiod = 0.30000001192 
			ENDIF 
		ENDIF 
	ELSE 
		IF SpeedLessThan 100 
			IF Released down 
				IF NOT AutoKickIsOff 
					PlayAnim anim = CrouchPush1 NoRestart 
				ENDIF 
			ENDIF 
		ENDIF 
		IF AutoKickIsOff 
			IF SpeedLessThan 600 
				IF Held Square 
					PlayAnim anim = CrouchPush1 NoRestart 
				ENDIF 
			ENDIF 
		ENDIF 
		IF NOT AnimEquals CrouchIdles CrouchPush1 CrouchBumpUp CrouchBumpDown CrouchBumpUp_Crappy CrouchBumpDown_Crappy CrouchBumpUp_Cool CrouchBumpDown_Cool 
			GetCrouchIdle 
			IF AnimEquals idle 
				PlayAnim anim = CrouchIdleFromIdle NoRestart Blendperiod = 0 
			ENDIF 
			PlayAnim anim = <Element> NoRestart cycle 
		ELSE 
			IF AnimFinished 
				GetCrouchIdle 
				PlayAnim anim = <Element> NoRestart cycle 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SLOPE_CUTOFF = 40 
PUSH_IF_SLOPE = 2 
SCRIPT just_coasting 
	IF SpeedLessThan 100 
		IF NOT IsOnMotoSkateboard 
			DoApushFromBrake 
		ENDIF 
	ENDIF 
	IF AnimEquals [ MongoPushCycle PushCycle PushCycleArms1 PushCycleArms2 PushCycleArms3 PushCycleArms4 PushCycleArms5 ] 
		IF ShouldMongo 
			PlayAnim anim = MongoPush Backwards 
		ELSE 
			PlayAnim anim = Push Backwards 
		ENDIF 
		Obj_WaitAnimFinished 
		PlayStyleAnim anim = idle NoRestart cycle 
	ELSE 
		IF AnimEquals idle 
			IF AnimFinished 
				RandomPush = RANDOM_RANGE PAIR(1.00000000000, 3.00000000000) 
				IF ( <RandomPush> < 2 ) 
					DoAPush 
				ELSE 
					PlayStyleAnim anim = idle 
				ENDIF 
			ENDIF 
		ELSE 
			PlayStyleAnim anim = idle NoRestart cycle 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT DoAPush 
	IF IsOnMotoSkateboard 
		RETURN 
	ENDIF 
	IF NOT AnimFinished 
		IF NOT AnimEquals [ SlowDownBrake SlowDownBrake_Mongo ] 
			RETURN 
		ENDIF 
	ENDIF 
	IF ShouldMongo 
		IF AnimEquals MongoPushCycle 
			PlayAnim anim = MongoPushCycle NoRestart 
			waitanimwhilstchecking 
		ELSE 
			PlayAnim anim = MongoPush NoRestart 
			waitanimwhilstchecking 
			BEGIN 
				PlayAnim anim = MongoPushCycle 
				waitanimwhilstchecking 
			REPEAT 2 
		ENDIF 
	ELSE 
		IF AnimEquals [ PushCycle PushCycleArms1 PushCycleArms2 PushCycleArms3 PushCycleArms4 PushCycleArms5 ] 
			PlayAnim RANDOM(1, 1, 1, 1, 1, 1) RANDOMCASE anim = PushCycle RANDOMCASE anim = PushCycleArms1 RANDOMCASE anim = PushCycleArms2 RANDOMCASE anim = PushCycleArms3 RANDOMCASE anim = PushCycleArms4 RANDOMCASE anim = PushCycleArms5 RANDOMEND NoRestart 
			waitanimwhilstchecking 
		ELSE 
			PlayAnim anim = Push NoRestart 
			Obj_WaitAnimFinished 
			BEGIN 
				PlayAnim RANDOM(1, 1, 1, 1, 1, 1) RANDOMCASE anim = PushCycle RANDOMCASE anim = PushCycleArms1 RANDOMCASE anim = PushCycleArms2 RANDOMCASE anim = PushCycleArms3 RANDOMCASE anim = PushCycleArms4 RANDOMCASE anim = PushCycleArms5 RANDOMEND NoRestart 
				waitanimwhilstchecking 
			REPEAT 2 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT DoApushFromBrake 
	SetRollingFriction 10 
	IF ShouldMongo 
		PlayAnim anim = BrakeIdle_Start_Mongo NoRestart 
		wait 18 frames 
	ELSE 
		PlayAnim anim = BrakeIdle_Start NoRestart 
		wait 18 frames 
	ENDIF 
	SetRollingFriction default 
	waitanimwhilstchecking 
ENDSCRIPT

SCRIPT CheckForNetBrake 
	IF inNetGame 
		GetPreferenceChecksum pref_type = network auto_brake 
		IF ( <checksum> = boolean_true ) 
			IF ScreenElementExists id = current_menu_anchor 
				Goto NetBrake 
			ENDIF 
			IF ScreenElementExists id = dialog_box_anchor 
				Goto NetBrake 
			ENDIF 
			IF ScreenElementExists id = quit_dialog_anchor 
				Goto NetBrake 
			ENDIF 
			IF ScreenElementExists id = controller_unplugged_dialog_anchor 
				Goto NetBrake 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT PlayBrakeAnim 
	IF ShouldMongo 
		PlayAnim anim = SlowDownBrake_Mongo NoRestart 
	ELSE 
		PlayAnim anim = SlowDownBrake NoRestart 
	ENDIF 
ENDSCRIPT

SCRIPT CessBrake 
	ClearEventBuffer 
	IF SpeedGreaterThan 300 
		PlayAnim anim = CessSlide180_FS From = Start To = 28 speed = 1.20000004768 
		WaitAnim Frame 5 
		PlayCessSound 
		WaitAnim Frame 25 
		PlayAnim anim = CessSlide180_FS From = 27 To = Start speed = 1.20000004768 
		Obj_WaitAnimFinished 
	ENDIF 
	PlayBrakeAnim 
ENDSCRIPT

SCRIPT OnGround_AutoKickOff_UpHill 
	IF ShouldMongo 
		IF Held Square 
			PlayAnim anim = MongoPush NoRestart 
			Obj_WaitAnimFinished 
			PlayAnim anim = MongoPushCycle NoRestart 
			Obj_WaitAnimFinished 
		ENDIF 
		PlayStyleAnim anim = idle cycle NoRestart 
	ELSE 
		IF Held Square 
			PlayAnim RANDOM(1, 1, 1, 1, 1, 1) RANDOMCASE anim = PushCycle RANDOMCASE anim = PushCycleArms1 RANDOMCASE anim = PushCycleArms2 RANDOMCASE anim = PushCycleArms3 RANDOMCASE anim = PushCycleArms4 RANDOMCASE anim = PushCycleArms5 RANDOMEND NoRestart 
			Obj_WaitAnimFinished 
		ENDIF 
		PlayStyleAnim anim = idle cycle NoRestart 
	ENDIF 
ENDSCRIPT

SCRIPT OnGround_AutoKickOff_Flat 
	IF Held Square 
		IF ShouldMongo 
			PlayAnim anim = MongoPushCycle cycle NoRestart 
		ELSE 
			PlayAnim RANDOM(1, 1, 1, 1, 1, 1) RANDOMCASE anim = PushCycle RANDOMCASE anim = PushCycleArms1 RANDOMCASE anim = PushCycleArms2 RANDOMCASE anim = PushCycleArms3 RANDOMCASE anim = PushCycleArms4 RANDOMCASE anim = PushCycleArms5 RANDOMEND NoRestart 
			Obj_WaitAnimFinished 
			PlayStyleAnim anim = idle cycle NoRestart 
		ENDIF 
	ELSE 
		IF AnimEquals [ PushCycle MongoPushCycle MongoPush ] 
		ELSE 
			PlayStyleAnim anim = idle cycle NoRestart 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT NetBrake 
	SetRollingFriction 20 
	OnExceptionRun NetBrake_out 
	CessBrake 
	BEGIN 
		IF SpeedLessThan 5 
			HandBrake 
			IF ShouldMongo 
				PlayAnim anim = MongoBrakeIdle cycle NoRestart 
			ELSE 
				PlayAnim anim = BrakeIdle cycle NoRestart 
			ENDIF 
		ENDIF 
		IF ObjectExists id = current_menu_anchor 
			waitonegameframe 
		ELSE 
			IF ObjectExists id = dialog_box_anchor 
				waitonegameframe 
			ELSE 
				IF ObjectExists id = controller_unplugged_dialog_anchor 
					waitonegameframe 
				ELSE 
					BREAK 
				ENDIF 
			ENDIF 
		ENDIF 
	REPEAT 
	SetRollingFriction default 
	IF SpeedLessThan 5 
		Goto HandBrake 
	ELSE 
		IF InNollie 
			Goto OnGroundNollieAI 
		ELSE 
			Goto OnGroundAi 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT NetBrake_out 
	SetRollingFriction default 
ENDSCRIPT

SCRIPT HandBrake 
	ClearEventBuffer 
	OnExceptionRun BrakeDone 
	SetRollingFriction 100 
	ClearTricksFrom GroundTricks 
	IF NOT GotParam gotoBrake 
		IF ShouldMongo 
			PlayAnim anim = NewBrake_Mongo 
		ELSE 
			PlayStyleBrakeAnim anim = NewBrake 
		ENDIF 
	ENDIF 
	BEGIN 
		DoNextTrick 
		IF AnimFinished 
			BREAK 
		ENDIF 
		IF Crouched 
			BREAK 
		ENDIF 
		wait 1 game Frame 
	REPEAT 
	IF ShouldMongo 
		flip 
		BlendperiodOut 0.20000000298 
	ENDIF 
	BEGIN 
		IF AutoKickIsOff 
			IF Held Square 
				waitonegameframe 
				BREAK 
			ENDIF 
		ELSE 
			IF Held up 
				BREAK 
			ENDIF 
			IF Crouched 
				BREAK 
			ENDIF 
		ENDIF 
		IF RightPressed 
			IF Flipped 
				PlayAnim anim = NewBrakeTurnLeft cycle NoRestart 
			ELSE 
				PlayAnim anim = NewBrakeTurnRight cycle NoRestart 
			ENDIF 
		ELSE 
			IF LeftPressed 
				IF Flipped 
					PlayAnim anim = NewBrakeTurnRight cycle NoRestart 
				ELSE 
					PlayAnim anim = NewBrakeTurnLeft cycle NoRestart 
				ENDIF 
			ELSE 
				<inbrakeidle> = 0 
				IF AnimEquals [ 
						NewBrakeIdle NewBrakeIdle3 NewBrakeIdle6 NewBrakeIdle7 NewBrakeIdle8 
						NewBrakeIdle_Female NewBrakeIdle2_Female NewBrakeIdle3_Female NewBrakeIdle4_Female NewBrakeIdle5_Female NewBrakeIdle6_Female NewBrakeIdle7_Female NewBrakeIdle8_Female 
						NewBrakeIdle_Fat NewBrakeIdle2_Fat NewBrakeIdle3_Fat NewBrakeIdle4_Fat NewBrakeIdle5_Fat NewBrakeIdle6_Fat NewBrakeIdle7_Fat NewBrakeIdle8_Fat 
					] 
					<inbrakeidle> = 1 
				ENDIF 
				IF ( <inbrakeidle> = 1 ) 
					IF AnimFinished 
						PlayBrakeIdle 
					ENDIF 
				ELSE 
					PlayBrakeIdle 
				ENDIF 
			ENDIF 
		ENDIF 
		waitonegameframe 
		DoNextTrick 
		DoNextManualTrick 
	REPEAT 
	PlayAnim anim = NewBrakeIdleToIdle 
	wait 0.25000000000 seconds 
	SetRollingFriction default 
	waitanimwhilstchecking 
	IF InNollie 
		Goto OnGroundNollieAI 
	ELSE 
		Goto OnGroundAi 
	ENDIF 
ENDSCRIPT

SCRIPT PlayBrakeIdle 
	IF ProfileEquals style = fat 
		anim = RANDOM_NO_REPEAT(1, 1, 1, 1, 1, 1, 1, 1) RANDOMCASE NewBrakeIdle_Fat 
			RANDOMCASE NewBrakeIdle2_Fat 
			RANDOMCASE NewBrakeIdle3_Fat 
			RANDOMCASE NewBrakeIdle4_Fat 
			RANDOMCASE NewBrakeIdle5_Fat 
			RANDOMCASE NewBrakeIdle6_Fat 
			RANDOMCASE NewBrakeIdle7_Fat 
			RANDOMCASE NewBrakeIdle8_Fat 
		RANDOMEND 
	ENDIF 
	IF NOT GotParam anim 
		IF ProfileEquals is_female 
			anim = RANDOM_NO_REPEAT(1, 1, 1, 1, 1, 1, 1) RANDOMCASE NewBrakeIdle_Female 
				RANDOMCASE NewBrakeIdle2_Female 
				RANDOMCASE NewBrakeIdle3_Female 
				RANDOMCASE NewBrakeIdle4_Female 
				RANDOMCASE NewBrakeIdle6_Female 
				RANDOMCASE NewBrakeIdle7_Female 
				RANDOMCASE NewBrakeIdle8_Female 
			RANDOMEND 
		ENDIF 
	ENDIF 
	IF NOT GotParam anim 
		anim = RANDOM_NO_REPEAT(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1) RANDOMCASE NewBrakeIdle 
			RANDOMCASE NewBrakeIdle 
			RANDOMCASE NewBrakeIdle 
			RANDOMCASE NewBrakeIdle 
			RANDOMCASE NewBrakeIdle2 
			RANDOMCASE NewBrakeIdle 
			RANDOMCASE NewBrakeIdle3 
			RANDOMCASE NewBrakeIdle 
			RANDOMCASE NewBrakeIdle4 
			RANDOMCASE NewBrakeIdle 
			RANDOMCASE NewBrakeIdle 
			RANDOMCASE NewBrakeIdle 
			RANDOMCASE NewBrakeIdle 
			RANDOMCASE NewBrakeIdle 
			RANDOMCASE NewBrakeIdle6 
			RANDOMCASE NewBrakeIdle7 
			RANDOMCASE NewBrakeIdle8 
			RANDOMCASE NewBrakeIdle 
			RANDOMCASE NewBrakeIdle 
		RANDOMEND 
	ENDIF 
	PlayAnim anim = <anim> 
ENDSCRIPT

SCRIPT BrakeDone 
	SetRollingFriction default 
ENDSCRIPT

SCRIPT OnGroundNollieAI 
	setstate ground 
	OnGroundExceptions 
	IF NOT GoalManager_GoalShouldExpire 
		SetException Ex = Ollied Scr = Nollie 
	ENDIF 
	NollieOn 
	BEGIN 
		IF LeftPressed 
			IF Crouched 
				IF Flipped 
					PlayAnim anim = NollieCrouchTurnRight NoRestart 
				ELSE 
					PlayAnim anim = NollieCrouchTurnLeft NoRestart 
				ENDIF 
			ELSE 
				IF Flipped 
					PlayAnim anim = NollieSkatingTurnRight NoRestart 
				ELSE 
					PlayAnim anim = NollieSkatingTurnLeft NoRestart 
				ENDIF 
			ENDIF 
		ELSE 
			IF RightPressed 
				IF Crouched 
					IF Flipped 
						PlayAnim anim = NollieCrouchTurnLeft NoRestart 
					ELSE 
						PlayAnim anim = NollieCrouchTurnRight NoRestart 
					ENDIF 
				ELSE 
					IF Flipped 
						PlayAnim anim = NollieSkatingTurnLeft NoRestart 
					ELSE 
						PlayAnim anim = NollieSkatingTurnRight NoRestart 
					ENDIF 
				ENDIF 
			ELSE 
				IF Crouched 
					PlayAnim anim = NollieCrouchIdle cycle NoRestart 
				ELSE 
					IF Braking 
						IF SpeedLessThan 1 
							PlayAnim anim = NollieSkatingIdle NoRestart 
							IF HeldLongerThan Button = down 2 second 
								IF NOT IsInBail 
									Goto HandBrake 
								ENDIF 
							ENDIF 
						ELSE 
							IF HeldLongerThan Button = down 0.20000000298 second 
								CessBrake 
							ELSE 
								PlayBrakeAnim 
							ENDIF 
						ENDIF 
					ELSE 
						IF CanKick 
							IF AutoKickIsOff 
								IF ShouldMongo 
									IF AnimEquals MongoPushCycle 
										PlayAnim anim = MongoPushCycle NoRestart 
									ELSE 
										PlayAnim anim = MongoPush NoRestart 
										Obj_WaitAnimFinished 
										PlayAnim anim = MongoPushCycle NoRestart 
									ENDIF 
								ELSE 
									PlayAnim anim = PushCycle NoRestart 
								ENDIF 
							ELSE 
								IF ShouldMongo 
									IF AnimEquals MongoPushCycle 
										PlayAnim anim = MongoPushCycle cycle NoRestart 
									ELSE 
										PlayAnim anim = MongoPush NoRestart 
										Obj_WaitAnimFinished 
										PlayAnim anim = MongoPushCycle cycle NoRestart 
									ENDIF 
								ELSE 
									PlayAnim anim = PushCycle cycle NoRestart 
								ENDIF 
							ENDIF 
						ELSE 
							IF AnimFinished 
								PlayAnim anim = NollieSkatingIdle cycle NoRestart 
							ENDIF 
						ENDIF 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
		DoNextTrick 
		DoNextManualTrick 
		CheckForNetBrake 
		waitonegameframe 
	REPEAT 
ENDSCRIPT

SCRIPT FlailExceptions 
	SetException Ex = CarBail Scr = CarBail 
	SetException Ex = SkaterCollideBail Scr = SkaterCollideBail 
	SetException Ex = RunHasEnded Scr = EndOfRun 
	SetException Ex = GoalHasEnded Scr = Goal_EndOfRun 
	IF GoalManager_GoalShouldExpire 
		ClearException Ollied 
		ClearException GroundGone 
		ClearException WallPush 
	ENDIF 
	ClearTrickQueue 
	ClearManualTrick 
	ClearEventBuffer 
	LandSkaterTricks 
ENDSCRIPT

SCRIPT FlailHitWall 
	BailDone 
	Goto FlailLeft 
ENDSCRIPT

SCRIPT FlailLeft 
	StopBalanceTrick 
	FlailExceptions 
	FlailVibrate 
	IF CancelRotateDisplayandUpdateMatrix 
		change flip_backwards_dont_blend = 1 
	ENDIF 
	IF Crouched 
		IF SpeedGreaterThan 400 
			PlayAnim RANDOM(1, 1) RANDOMCASE anim = FlailLeftCrouched_small RANDOMCASE anim = FlailLeftCrouched2 RANDOMEND Blendperiod = 0.02999999933 
		ELSE 
			PlayAnim RANDOM(1, 1) RANDOMCASE anim = FlailLeftCrouched2 RANDOMCASE anim = FlailLeftCrouched3 RANDOMEND Blendperiod = 0.02999999933 
		ENDIF 
	ELSE 
		PlayAnim RANDOM(1, 1) RANDOMCASE anim = FlailLeft RANDOMCASE anim = FlailLeft2 RANDOMEND Blendperiod = 0.02999999933 
	ENDIF 
	waitanimwhilstchecking 
	change flip_backwards_dont_blend = 0 
	IF InNollie 
		Goto OnGroundNollieAI 
	ELSE 
		Goto OnGroundAi 
	ENDIF 
ENDSCRIPT

SCRIPT FlailRight 
	StopBalanceTrick 
	FlailExceptions 
	FlailVibrate 
	IF CancelRotateDisplayandUpdateMatrix 
		change flip_backwards_dont_blend = 1 
	ENDIF 
	IF Crouched 
		IF SpeedGreaterThan 400 
			PlayAnim RANDOM(1, 1) RANDOMCASE anim = FlailRightCrouched_small RANDOMCASE anim = FlailRightCrouched2 RANDOMEND Blendperiod = 0.02999999933 
		ELSE 
			PlayAnim RANDOM(1, 1) RANDOMCASE anim = FlailRightCrouched2 RANDOMCASE anim = FlailRightCrouched3 RANDOMEND Blendperiod = 0.02999999933 
		ENDIF 
	ELSE 
		PlayAnim RANDOM(1, 1) RANDOMCASE anim = FlailRight RANDOMCASE anim = FlailRight2 RANDOMEND Blendperiod = 0.02999999933 
	ENDIF 
	waitanimwhilstchecking 
	change flip_backwards_dont_blend = 0 
	IF InNollie 
		Goto OnGroundNollieAI 
	ELSE 
		Goto OnGroundAi 
	ENDIF 
ENDSCRIPT

SCRIPT FlailVibrate 
	IF SpeedGreaterThan 600 
		Vibrate Actuator = 1 Percent = 80 Duration = 0.25000000000 
	ELSE 
		Vibrate Actuator = 1 Percent = 50 Duration = 0.15000000596 
	ENDIF 
ENDSCRIPT

SCRIPT BailGroundGone 
	BailDone 
	GroundGone 
ENDSCRIPT

SCRIPT GroundGone 
	InAirExceptions 
	StopBalanceTrick 
	SetException Ex = Ollied Scr = Ollie 
	ClearTricksFrom GroundTricks 
	IF IsOnMotoSkateboard 
		SetQueueTricks Motoskateboard_AirTricks 
	ELSE 
		IF GotParam NoBoneless 
			SetSkaterAirTricks 
		ELSE 
			IF ( ( GetGlobalFlag flag = FLAG_EXPERT_MODE_NO_WALKING ) | ( ( inNetGame ) & ( GetGlobalFlag flag = FLAG_G_EXPERT_MODE_NO_WALKING ) ) ) 
				SetQueueTricks special = SpecialTricks AirTricks Jumptricks JumpTricks0 
			ELSE 
				SetQueueTricks special = SpecialTricks AirTricks Jumptricks JumpTricks0 SkateToWalkTricks 
			ENDIF 
		ENDIF 
	ENDIF 
	IF Crouched 
		PlayAnim anim = Crouch2InAir 
	ELSE 
		PlayAnim anim = Idle2InAir 
	ENDIF 
	WaitAnimWhilstCheckingLateOllie 
	SetSkaterAirTricks 
	ClearException Ollied 
	Goto Airborne 
ENDSCRIPT

SCRIPT WaitAnimWhilstCheckingLateOllie 
	BEGIN 
		IF AirTimeGreaterThan Skater_Late_Jump_Slop 
			RETURN 
		ENDIF 
		DoNextTrick TrickParams = { FromGroundGone } 
		IF AnimFinished 
			RETURN 
		ENDIF 
		wait 1 gameframe 
	REPEAT 
ENDSCRIPT

SCRIPT WaitFramesLateOllie 
	BEGIN 
		IF ( <frames> = 0 ) 
			RETURN frames = 0 
		ENDIF 
		IF AirTimeGreaterThan Skater_Late_Jump_Slop 
			RETURN frames = <frames> 
		ENDIF 
		frames = ( <frames> - 1 ) 
		wait 1 gameframe 
	REPEAT 
ENDSCRIPT

SCRIPT TrickOllie 
	Jump 
ENDSCRIPT

AirAnimParams = { Hold Blendperiod = 0.30000001192 NoRestart } 
SCRIPT Airborne Blendperiod = 0.30000001192 
	IF Obj_FlagSet FLAG_SKATER_INLOOP 
		Goto LoopGapStart 
	ENDIF 
	InAirExceptions <...> 
	BEGIN 
		DoNextTrick 
		GetAirTimeLeft 
		IF ( <AirTimeLeft> < 0.40000000596 ) 
			PlayAnim anim = StretchLegsInit Blendperiod = <Blendperiod> NoRestart 
			BREAK 
		ELSE 
			IF LeftPressed 
				IF Flipped 
					PlayAnim anim = AirTurnRight AirAnimParams 
				ELSE 
					PlayAnim anim = AirTurnLeft AirAnimParams 
				ENDIF 
			ELSE 
				IF RightPressed 
					IF Flipped 
						PlayAnim anim = AirTurnLeft AirAnimParams 
					ELSE 
						PlayAnim anim = AirTurnRight AirAnimParams 
					ENDIF 
				ELSE 
					IF Held R2 
						PlayAnim anim = SpineTransfer Blendperiod = 0.30000001192 NoRestart 
					ELSE 
						IF Held L2 
							PlayAnim anim = SpineTransfer Blendperiod = 0.30000001192 NoRestart 
						ELSE 
							PlayAnim anim = AirIdle cycle Blendperiod = <Blendperiod> NoRestart 
						ENDIF 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
		waitonegameframe 
	REPEAT 
	waitanimwhilstchecking 
	BEGIN 
		DoNextTrick 
		waitonegameframe 
	REPEAT 
ENDSCRIPT

SCRIPT Land 
	easy_no_bail = 0 
	IF ( <easy_no_bail> = 1 ) 
		ClearTrickQueue 
		KillExtraTricks 
	ELSE 
		GoalManager_GetDifficultyLevel 
		IF GameModeEquals is_classic 
			difficulty_level = ( <difficulty_level> + 1 ) 
		ENDIF 
		IF ( <difficulty_level> = 0 ) 
			IF SpeedGreaterThan 500 
				IF YawBetween PAIR(80.00000000000, 100.00000000000) 
					Goto YawBail 
				ENDIF 
			ENDIF 
		ELSE 
			IF SpeedGreaterThan 500 
				IF YawBetween PAIR(60.00000000000, 120.00000000000) 
					Goto YawBail 
				ENDIF 
			ENDIF 
		ENDIF 
		IF AbsolutePitchGreaterThan 60 
			IF PitchGreaterThan 60 
				Goto PitchBail 
			ENDIF 
		ENDIF 
		IF LandedFromSpine 
			GetMatrixNormal 
			IF ( <y> > 0.94999998808 ) 
				
				Goto PitchBail 
			ENDIF 
		ENDIF 
		IF RollGreaterThan 50 
			Goto DoingTrickBail 
		ENDIF 
		IF DoingTrick 
			
			Goto DoingTrickBail 
		ENDIF 
		IF DoingFlip 
			
			Goto PitchBail 
		ENDIF 
	ENDIF 
	IF GotParam NoBlend 
		BlendperiodOut 0 
	ENDIF 
	IF GotParam ReturnBacktoLipLand 
	ELSE 
		IF GotParam IgnoreAirTime 
			Goto Land2 Params = { IgnoreAirTime } 
		ELSE 
			IF AirTimeLessThan 0.20000000298 seconds 
				Goto Land2 Params = { LittleAir } 
			ELSE 
				GotoPreserveParams Land2 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT Land2 RevertTime = 5 
	IF NOT SkaterIsFlipping 
		DoPerfectCheck 
	ENDIF 
	AllowRailTricks 
	NollieOff 
	PressureOff 
	ClearLipCombos 
	IF LandedFromVert 
		OverrideCancelGround 
		Obj_ClearFlag FLAG_SKATER_MANUALCHEESE 
		GetSpeed 
		IF ( <speed> > 250 ) 
			SetExtraTricks_Reverts Duration = <RevertTime> 
		ENDIF 
		IF AnimEquals [ ToTail_In ToTail_Idle ToTail_Out ] 
			SetTrickName "To Tail" 
			SetTrickScore 500 
			Display 
			CopingHit Terrain = 3 
		ENDIF 
	ELSE 
		DoNextManualTrick FromAir 
	ENDIF 
	Vibrate Actuator = 1 Percent = 80 Duration = 0.10000000149 
	GetAirtime 
	IF Crouched 
		IF GotParam LittleAir 
			PlayAnim anim = CrouchedLand_Tiny Blendperiod = 0.10000000149 
		ELSE 
			IF Backwards 
				IF IsOnMotoSkateboard 
					IF LandedFromVert 
						manual_turnaround 
						PlayAnim RANDOM(1, 1) RANDOMCASE anim = SketchyCrouchLand RANDOMCASE anim = SketchyLand1 RANDOMEND Blendperiod = 0.10000000149 
					ELSE 
						PlayAnim anim = RevertFS Backwards Blendperiod = 0 speed = 2.00000000000 
						FlipAfter 
					ENDIF 
				ELSE 
					FlipAndRotate 
					PlayAnim RANDOM_NO_REPEAT(1, 1) RANDOMCASE anim = CrouchedLandTurn4 RANDOMCASE anim = CrouchedLandTurn5 RANDOMEND Blendperiod = 0.00000000000 
					BoardRotate 
				ENDIF 
			ELSE 
				IF YawBetween PAIR(45.00000000000, 60.00000000000) 
					IF AirTimeGreaterThan 0.75000000000 second 
						PlayAnim RANDOM(1, 1) RANDOMCASE anim = SketchyCrouchLand RANDOMCASE anim = SketchyLand1 RANDOMEND Blendperiod = 0.10000000149 
						IF InSplitScreenGame 
						ELSE 
							LaunchPanelMessage "&C1Sketchy" properties = panelcombo 
						ENDIF 
					ELSE 
						PlayLandAnim <...> 
					ENDIF 
				ELSE 
					PlayLandAnim <...> 
				ENDIF 
			ENDIF 
		ENDIF 
	ELSE 
		IF GotParam LittleAir 
			PlayAnim anim = StandingLand_Tiny Blendperiod = 0.10000000149 
		ELSE 
			IF Backwards 
				IF IsOnMotoSkateboard 
					IF LandedFromVert 
						manual_turnaround 
						PlayAnim RANDOM(1, 1) RANDOMCASE anim = SketchyLand RANDOMCASE anim = SketchyLand1 RANDOMEND Blendperiod = 0.10000000149 
					ELSE 
						PlayAnim anim = RevertFS Backwards Blendperiod = 0 speed = 2.00000000000 
						FlipAfter 
					ENDIF 
				ELSE 
					FlipAndRotate 
					PlayAnim RANDOM(1, 1) RANDOMCASE anim = StandingLandTurn RANDOMCASE anim = StandingLandTurn1 RANDOMEND Blendperiod = 0 
					BoardRotate 
				ENDIF 
			ELSE 
				IF YawBetween PAIR(45.00000000000, 60.00000000000) 
					IF AirTimeGreaterThan 0.50000000000 second 
						
						PlayAnim RANDOM(1, 1) RANDOMCASE anim = SketchyLand RANDOMCASE anim = SketchyLand1 RANDOMEND Blendperiod = 0.10000000149 
						IF InSplitScreenGame 
						ELSE 
							LaunchPanelMessage "&C1Sketchy" properties = panelcombo 
						ENDIF 
					ELSE 
						PlayLandAnim <...> 
					ENDIF 
				ELSE 
					PlayLandAnim <...> 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	ClearTrickQueue 
	ClearEventBuffer buttons = [ X ] 
	SetSkaterAirManualTricks 
	OnGroundExceptions NoEndRun 
	OnExceptionRun LandSkaterTricks 
	IF GoalManager_GoalShouldExpire 
		no_ollies = 1 
	ENDIF 
	IF GotParam no_ollies 
		ClearException Ollied 
		ClearException GroundGone 
		ClearException WallPush 
		SetQueueTricks NoTricks 
	ENDIF 
	IF GotParam NoReverts 
	ELSE 
		IF LandedFromVert 
			ResetLandedFromVert 
			BEGIN 
				wait 1 
			REPEAT <RevertTime> 
		ELSE 
			BEGIN 
				DoNextManualTrick FromAir 
				wait 1 
			REPEAT 10 
		ENDIF 
	ENDIF 
	KillExtraTricks 
	LandSkaterTricks 
	OnExceptionRun 
	OnGroundExceptions 
	CheckForNetBrake 
	waitanimwhilstchecking AndManuals 
	Goto OnGroundAi 
ENDSCRIPT

SCRIPT DoAirToFakieCheck 
	IF LandedFromVert 
		IF CurrentScorePotGreaterThan 0 
			GetSpin 
			IF ( <spin> = 0 ) 
				SetTrickName #"to Fakie" 
				SetTrickScore 0 
				Display 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT PlayLandAnim 
	IF GotParam IgnoreAirTime 
		PlayAnim RANDOM_NO_REPEAT(1, 1, 1) RANDOMCASE anim = CrouchedLand4 RANDOMCASE anim = CrouchedLand5 RANDOMCASE anim = CrouchedLand6 RANDOMEND Blendperiod = 0.10000000149 
	ELSE 
		IF AirTimeLessThan 0.50000000000 seconds 
			PlayAnim anim = CrouchedLand_Tiny Blendperiod = 0.10000000149 
		ELSE 
			IF AirTimeLessThan 0.75000000000 seconds 
				PlayAnim RANDOM_NO_REPEAT(1, 1) RANDOMCASE anim = CrouchedLand4_small RANDOMCASE anim = CrouchedLand5_small RANDOMEND Blendperiod = 0.10000000149 
			ELSE 
				PlayAnim RANDOM_NO_REPEAT(1, 1, 1) RANDOMCASE anim = CrouchedLand4 RANDOMCASE anim = CrouchedLand5 RANDOMCASE anim = CrouchedLand6 RANDOMEND Blendperiod = 0.10000000149 
			ENDIF 
		ENDIF 
	ENDIF 
	IF NOT IsThrowingProjectile 
		IF NOT Obj_AnimSubsetExists SubsetId = Cloth 
			Obj_AddAnimSubset SubsetId = Cloth EnableBlending 
			IF Obj_AnimationFlipped 
				Obj_Flip SubsetId = Cloth 
			ENDIF 
		ENDIF 
		Obj_SetAnimSubsetWeight SubsetId = Cloth BlendWeight = 1 BlendDuration = 0.10000000149 
		PlayAnim SubsetId = Cloth anim = Cloth_Land_Partial speed = 1 
		Obj_SpawnScript handle_cloth_subset2 
	ELSE 
		IF Obj_AnimSubsetExists SubsetId = Cloth 
			Obj_RemoveAnimSubset SubsetId = Cloth 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT handle_cloth_subset2 
	IF Obj_AnimSubsetExists SubsetId = Cloth 
		Obj_WaitAnimFinished SubsetId = Cloth 
	ENDIF 
	IF Obj_AnimSubsetExists SubsetId = Cloth 
		Obj_RemoveAnimSubset SubsetId = Cloth 
	ENDIF 
ENDSCRIPT

SCRIPT LandSkaterTricks 
	GetSkaterNumber 
	GetBonusValue skater = <skaternumber> 
	IF GotParam bonus 
		IF ( <bonus> > 0 ) 
			SetTrickName #"" 
			SetTrickScore <bonus> 
			Display Blockspin NoDegrade NoSwitch 
		ENDIF 
	ENDIF 
	IF CurrentScorePotGreaterThan 1500 
		SpawnScript LandPointsSound 
	ENDIF 
	CheckGapTricks 
	ClearGapTricks NotInSameFrame 
	ClearPanel_Landed 
	ClearManualTrick 
	OverrideCancelGround Off 
	ResetSpin 
	Obj_ClearFlag FLAG_SKATER_REVERTCHEESE 
	IF NOT GotParam DontKillFocus 
		KillSpecial 
	ENDIF 
ENDSCRIPT

SCRIPT BailSkaterTricks 
	ClearGapTricks 
	ClearPanel_Bailed 
ENDSCRIPT

SCRIPT DoPerfectCheck 
	DoPerfectCheck2 
	SWITCH <perfect> 
		CASE 1 
			AwardPerfect 
		CASE 2 
			AwardSloppy 
		DEFAULT 
	ENDSWITCH 
ENDSCRIPT

SCRIPT DoPerfectCheck2 
	perfect = 0 
	IF CurrentScorePotGreaterThan 1 
		GoalManager_GetDifficultyLevel 
		IF GameModeEquals is_classic 
			difficulty_level = ( <difficulty_level> + 1 ) 
		ENDIF 
		value1 = [ PAIR(0.00000000000, 11.00000000000) PAIR(0.00000000000, 8.00000000000) PAIR(0.00000000000, 5.00000000000) ] 
		value2 = [ PAIR(169.00000000000, 180.00000000000) PAIR(172.00000000000, 180.00000000000) PAIR(175.00000000000, 180.00000000000) ] 
		IF YawBetween ( <value1> [ <difficulty_level> ] ) 
			perfect = 1 
		ELSE 
			IF YawBetween ( <value2> [ <difficulty_level> ] ) 
				perfect = 1 
			ELSE 
				IF YawBetween PAIR(45.00000000000, 60.00000000000) 
					perfect = 2 
				ELSE 
					IF YawBetween PAIR(120.00000000000, 135.00000000000) 
						perfect = 2 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	RETURN perfect = <perfect> 
ENDSCRIPT

SCRIPT AwardPerfect 
	GetSpin 
	IF LandedFromVert 
		IF ( <spin> > 359.00000000000 ) 
			AwardPerfect2 
		ENDIF 
	ELSE 
		IF ( <spin> > 179.00000000000 ) 
			AwardPerfect2 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT AwardPerfect2 
	IF NOT InSplitScreenGame 
		Create_Panel_Message text = "Clean!" id = perfect rgba = [ 50 150 50 128 ] pos = PAIR(110.00000000000, 340.00000000000) style = perfect_style 
		Create_Panel_Message text = "+1000 Points" id = perfect2 rgba = [ 40 140 40 100 ] pos = PAIR(110.00000000000, 360.00000000000) style = perfect_style 
	ELSE 
		PerfectSloppy_2p text = "Clean!" rgb = [ 50 150 50 128 ] 
	ENDIF 
	BroadcastEvent type = SkaterLandedClean 
	SetTrickName #"" 
	SetTrickScore 1000 
	Display Blockspin NoDegrade 
	Obj_SpawnScript PlayPerfectSound Params = { sound = PerfectLanding_11 wait = 0.20000000298 pitch = 80 } 
ENDSCRIPT

SCRIPT AwardSloppy 
	IF CurrentScorePotGreaterThan 750 
		GetSpin 
		IF ( <spin> > 359.00000000000 ) 
			IF NOT InSplitScreenGame 
				Create_Panel_Message text = "Sloppy Landing" id = perfect rgba = [ 200 50 50 128 ] pos = PAIR(110.00000000000, 340.00000000000) style = sloppy_style 
				Create_Panel_Message text = "-500 Points" id = perfect2 rgba = [ 107 51 27 100 ] pos = PAIR(110.00000000000, 360.00000000000) style = sloppy_style 
			ELSE 
				PerfectSloppy_2p text = "Sloppy!" rgb = [ 200 50 50 128 ] 
			ENDIF 
			SetTrickName #"" 
			SetTrickScore -500 
			Display Blockspin NoDegrade 
			Obj_SpawnScript PlayPerfectSound Params = { sound = HUDtrickslopC pitch = 150 wait = 0.11999999732 } 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT GetBonus score = 100 text = "Bonus!" rgba = [ 50 150 50 128 ] 
	IF NOT InSplitScreenGame 
		Create_Panel_Message text = <text> id = perfect rgba = <rgba> pos = PAIR(110.00000000000, 340.00000000000) style = perfect_style 
		FormatText textname = text2 "%i Points" i = <score> 
		Create_Panel_Message text = <text2> id = perfect2 rgba = <rgba> pos = PAIR(110.00000000000, 360.00000000000) style = perfect_style 
	ELSE 
		PerfectSloppy_2p text = <text> rgba = <rgba> 
	ENDIF 
	GetSkaterNumber 
	AddBonus <score> skater = <skaternumber> 
	Obj_SpawnScript GetBonus_exit Params = { <...> } 
ENDSCRIPT

SCRIPT GetBonus_exit 
	IF OnGround 
		IF NOT DoingBalanceTrick 
			IF NOT CurrentScorePotGreaterThan 0 
				SetTrickName <text> 
				SetTrickScore <score> 
				Display Blockspin NoDegrade NoSwitch 
				ClearPanel_Landed 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT PlayPerfectSound 
	wait <wait> seconds 
	Playsound <sound> pitch = <pitch> 
ENDSCRIPT

SCRIPT PerfectSloppy_2p style = perfect_style 
	ScriptGetScreenMode 
	GetSkaterNumber 
	SWITCH <screen_mode> 
		CASE split_vertical 
			SWITCH <skaternumber> 
				CASE 0 
					Create_Panel_Message text = <text> id = perfect rgba = <rgb> pos = PAIR(70.00000000000, 340.00000000000) style = <style> 
				CASE 1 
					Create_Panel_Message text = <text> id = perfect_p2 rgba = <rgb> pos = PAIR(370.00000000000, 340.00000000000) style = <style> 
			ENDSWITCH 
		CASE split_horizontal 
			SWITCH <skaternumber> 
				CASE 0 
					Create_Panel_Message text = <text> id = perfect rgba = <rgb> pos = PAIR(70.00000000000, 154.00000000000) style = <style> 
				CASE 1 
					Create_Panel_Message text = <text> id = perfect_p2 rgba = <rgb> pos = PAIR(70.00000000000, 375.00000000000) style = <style> 
			ENDSWITCH 
	ENDSWITCH 
ENDSCRIPT

SCRIPT perfect_style 
	DoMorph time = 0 scale = PAIR(0.00000000000, 0.00000000000) 
	DoMorph time = 0.10000000149 scale = PAIR(0.94999998808, 0.94999998808) 
	DoMorph time = 0.10000000149 scale = PAIR(0.75000000000, 0.75000000000) 
	DoMorph time = 0.10000000149 scale = PAIR(0.80000001192, 0.80000001192) 
	DoMorph time = 0.05000000075 alpha = 0 
	DoMorph time = 0.05000000075 alpha = 1 
	DoMorph time = 0.05000000075 alpha = 0 
	DoMorph time = 0.05000000075 alpha = 1 
	DoMorph time = 0.05000000075 alpha = 0 
	DoMorph time = 0.05000000075 alpha = 1 
	DoMorph time = 1.20000004768 alpha = 0 
	die 
ENDSCRIPT

SCRIPT sloppy_style 
	DoMorph time = 0 scale = PAIR(0.00000000000, 0.00000000000) 
	DoMorph time = 0.10000000149 scale = PAIR(0.80000001192, 0.80000001192) 
	DoMorph time = 0.01999999955 alpha = 0 
	DoMorph time = 0.05000000075 alpha = 1 
	DoMorph time = 0.05000000075 alpha = 0 
	DoMorph time = 0.02999999933 alpha = 1 
	DoMorph time = 0.05000000075 alpha = 0 
	DoMorph time = 0.05000000075 alpha = 1 
	DoMorph time = 0.03999999911 alpha = 0 
	DoMorph time = 0.05000000075 alpha = 1 
	DoMorph time = 0.05000000075 alpha = 0 
	DoMorph time = 0.01999999955 alpha = 1 
	DoMorph time = 1 alpha = 0 
	die 
ENDSCRIPT

SCRIPT focustimelimit_style 
	SetProps rgba = [ 50 128 50 128 ] 
	DoMorph time = 0 pos = PAIR(320.00000000000, 150.00000000000) scale = PAIR(0.00000000000, 0.00000000000) 
	DoMorph time = 0.10000000149 scale = PAIR(1.20000004768, 1.00000000000) 
	DoMorph time = 0.01999999955 alpha = 0 
	DoMorph time = 0.05000000075 alpha = 1 
	DoMorph time = 0.05000000075 alpha = 0 
	DoMorph time = 0.02999999933 alpha = 1 
	DoMorph time = 0.05000000075 alpha = 0 
	DoMorph time = 0.05000000075 alpha = 1 
	DoMorph time = 0.03999999911 alpha = 0 
	DoMorph time = 0.05000000075 alpha = 1 
	DoMorph time = 0.05000000075 alpha = 0 
	DoMorph time = 0.02999999933 alpha = 1 
	DoMorph time = 0.05000000075 alpha = 0 
	DoMorph time = 0.05000000075 alpha = 1 
	DoMorph time = 0.03999999911 alpha = 0 
	DoMorph time = 0.05000000075 alpha = 1 
	DoMorph time = 0.05000000075 alpha = 0 
	DoMorph time = 0.01999999955 alpha = 1 
	DoMorph time = 1 alpha = 0 
	die 
ENDSCRIPT

SCRIPT WaitOnGround 
	BEGIN 
		IF OnGround 
			BREAK 
		ENDIF 
		waitonegameframe 
	REPEAT 
ENDSCRIPT

SCRIPT VibrateOff 
	Vibrate Off 
ENDSCRIPT

SCRIPT EndOfRun_WalkingEvent 
	IF CurrentScorePotGreaterThan 0 
		RETURN 
	ENDIF 
	MakeSkaterGoto EndOfRun 
ENDSCRIPT

SCRIPT Goal_EndOfRun_WalkingEvent 
	IF CurrentScorePotGreaterThan 0 
		RETURN 
	ENDIF 
	Goal_EndOfRun 
ENDSCRIPT

SCRIPT SlowSkaterToStop 
	MakeSkaterGoto EndOfRun 
	WaitForEvent type = EndofRunDone 
ENDSCRIPT

SCRIPT EndOfRun 
	ClearExceptions 
	IF Walking 
		ClearAllWalkingExceptions 
	ENDIF 
	OnExitRun script_ClearEndofRunStarted 
	EndOfRunStarted 
	CleanUpSpecialItems 
	StopBalanceTrick 
	LandSkaterTricks 
	ClearEventBuffer 
	LaunchStateChangeEvent State = Skater_EndOfRun 
	SetException Ex = LostGame Scr = LostGame 
	DisablePlayerInput AllowCameraControl 
	ProjectilesOff 
	IF inNetGame 
		SetException Ex = WonGame Scr = WonGame 
		SetException Ex = LostGame Scr = LostGame 
	ENDIF 
	IF Skating 
		setstate ground 
		IF NOT GotParam NoBrake 
			SetException Ex = SkaterCollideBail Scr = EndBail 
			WaitOnGround 
			SetRollingFriction 19 
			wait 10 frames 
			WaitOnGround 
			IF SpeedGreaterThan 250 
				PlayCessSound 
				PlayAnim anim = CessSlide180_FS 
				WaitAnim 50 Percent 
				PlayAnim anim = CessSlide180_FS From = Current To = 0 
				Obj_WaitAnimFinished 
			ELSE 
				PlayAnim anim = brake Blendperiod = 0.30000001192 
				Obj_WaitAnimFinished 
			ENDIF 
			PlayAnim anim = BrakeIdle Blendperiod = 0.30000001192 cycle 
			BEGIN 
				SetRollingFriction 19 
				IF SpeedLessThan 40 
					IF OnGround 
						BREAK 
					ENDIF 
				ENDIF 
				waitonegameframe 
			REPEAT 
		ENDIF 
	ELSE 
		IF Walking 
			IF NOT GotParam NoBrake 
				IF Walk_Ground 
					Walk_ScaleAnimSpeed Off 
					IF SpeedGreaterThan ( walk_parameters . max_slow_walk_speed ) 
						PlayAnim anim = _180RunSkid NoRestart Blendperiod = 0.00000000000 
						Obj_WaitAnimFinished 
					ENDIF 
					PlayAnim anim = WStand NoRestart cycle Blendperiod = 0.30000001192 
				ELSE 
					IF Walk_Air 
						PlayAnim anim = JumpLandToStand NoRestart Blendperiod = 0.30000001192 
						Obj_WaitAnimFinished 
						PlayAnim anim = WStand cycle Blendperiod = 0.30000001192 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	wait 1 seconds 
	FireEvent type = EndofRunDone 
	IF NOT GotParam FromTaxiGuy 
		OnExitRun 
		EndofRunDone 
	ENDIF 
	IF inNetGame 
		IF NOT GameIsOver 
			IF NOT GameModeEquals is_king 
				IF NOT GameModeEquals is_score_challenge 
					IF NOT GotParam FromTaxiGuy 
						IF NOT GameModeEquals is_goal_attack 
							wait 1 seconds 
							IF GameModeEquals is_firefight 
								IF NOT IsObserving 
									skater : remove_skater_from_world 
								ENDIF 
								EliminatedYou 
							ELSE 
								wait 1 seconds 
								Create_Panel_Message id = goal_message text = "Waiting for others to finish. Press \\m0 to observe" style = panel_message_generic_loss time = 2000 
								IF NOT IsObserving 
									EnterSurveyorMode 
								ENDIF 
							ENDIF 
						ENDIF 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT script_ClearEndofRunStarted 
	ClearEndofRunStarted 
ENDSCRIPT

SCRIPT Goal_EndOfRun 
	ClearExceptions 
	ClearExceptionGroup WalkingEndRunEvents 
	Goal_EndOfRunStarted 
	CleanUpSpecialItems 
	StopBalanceTrick 
	LandSkaterTricks 
	ClearEventBuffer 
	FireEvent type = EndofRunDone 
	IF NOT GotParam FromTaxiGuy 
		Goal_EndOfRunDone 
	ENDIF 
	IF inNetGame 
		IF GameIsOver 
		ELSE 
			IF GameModeEquals is_king 
			ELSE 
				IF NOT GotParam FromTaxiGuy 
					IF NOT GameModeEquals is_goal_attack 
						Create_Panel_Message id = goal_message text = "Waiting for other players to finish their runs..." style = panel_message_generic_loss 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT ForceEndOfRun 
	VibrateOff 
	MakeSkaterGoto EndOfRun 
ENDSCRIPT

SCRIPT WonGame 
	IF Skating 
		PlayAnim RANDOM(1, 1) RANDOMCASE anim = Prop RANDOMCASE anim = Cheer1 RANDOMEND Blendperiod = 0.30000001192 
		EndofRunDone 
		Obj_WaitAnimFinished 
		IF ShouldMongo 
			PlayAnim anim = MongoBrakeIdle cycle 
		ELSE 
			PlayAnim anim = BrakeIdle cycle 
		ENDIF 
	ELSE 
		EndofRunDone 
	ENDIF 
ENDSCRIPT

SCRIPT LostGame 
	IF Skating 
		PlayAnim anim = BrakeDefeat 
		Obj_WaitAnimFinished 
		EndofRunDone 
		IF ShouldMongo 
			PlayAnim anim = MongoBrakeIdle cycle 
		ELSE 
			PlayAnim anim = BrakeIdle cycle 
		ENDIF 
		Obj_WaitAnimFinished 
	ELSE 
		EndofRunDone 
	ENDIF 
ENDSCRIPT

SCRIPT EndBail 
	EndofRunDone 
	ClearExceptions 
	InBail 
	TurnToFaceVelocity 
	VibrateOff 
	PlayAnim anim = Bail_Spin_FWD_Regular NoRestart Blendperiod = 0.30000001192 
	wait 10 frames 
	SwitchOffBoard 
	wait 10 Frame 
	wait 10 frames 
	SetRollingFriction 18 
	Vibrate Actuator = 1 Percent = 100 Duration = 0.20000000298 
	IF NOT GetGlobalFlag flag = BLOOD_OFF 
		Obj_SpawnScript BloodSmall 
	ENDIF 
	WaitAnim 25 Percent fromend 
	Obj_WaitAnimFinished 
	PlayAnim anim = GetUp_Sit_FT Blendperiod = 0.10000000149 
	SetRollingFriction 20 
	wait 50 frames 
	SwitchOnBoard 
	BoardRotate normal 
	Obj_WaitAnimFinished 
	NotifyBailDone 
	NotInBail 
	Goto EndOfRun 
ENDSCRIPT

SCRIPT Carplant 
	StopBalanceTrick 
	ClearExceptions 
	InAirExceptions 
	ClearException Carplant 
	Playsound GrindMetalOn RANDOM(1, 1, 1) RANDOMCASE pitch = 80 RANDOMCASE pitch = 90 RANDOMCASE pitch = 85 RANDOMEND 
	Obj_SpawnScript CarSparks 
	DoCarPlantBoost 
	SetTrickName "Car Plant" 
	SetTrickScore 400 
	Display 
	IF DoingTrick 
	ELSE 
		PlayAnim anim = Beanplant Blendperiod = 0.30000001192 
		waitanimwhilstchecking 
		Goto Airborne 
	ENDIF 
ENDSCRIPT

SCRIPT CarSparks 
	SetSparksTruckFromNollie 
	SparksOn 
	wait 0.33300000429 seconds 
	SetException Ex = Carplant Scr = Carplant 
	wait 3 seconds 
	SparksOff 
ENDSCRIPT

SCRIPT FreezeSkater 
	SwitchOnBoard 
	ClearExceptions 
	SetQueueTricks NoTricks 
	DisablePlayerInput 
	SetRollingFriction 10000 
	PlayAnim anim = Current From = 0 To = 1 
ENDSCRIPT

SCRIPT CarBail 
	StopBalanceTrick 
	InBail 
	Obj_SpawnScript BloodCar 
	Playsound BonkMetal_11 
	Playsound RANDOM(1, 1, 1) RANDOMCASE hitblood01 RANDOMCASE hitblood02 RANDOMCASE hitblood03 RANDOMEND 
	Goto NoseManualBail 
ENDSCRIPT

SCRIPT FlailingFall 
	InBail 
	ClearExceptions 
	SetQueueTricks NoTricks 
	DisablePlayerInput AllowCameraControl 
	PlayAnim anim = StretchtoFlailingFall Blendperiod = 0.30000001192 
	BailSkaterTricks 
	WaitAnim 90 Percent 
	SwitchOffBoard 
	Obj_WaitAnimFinished 
	PlayAnim anim = FlailingFall cycle 
ENDSCRIPT

SCRIPT DropIn DropInAnim = DropIn 
	
	IF GameModeEquals is_horse 
		
		GetCurrentSkaterID 
		KenTest1 
		
		IF NOT IsCurrentHorseSkater <objId> 
			
			RETURN 
		ENDIF 
	ENDIF 
	ResetSkaterParticleSystems 
	PausePhysics 
	RestartSkaterExceptions 
	SetSkaterCamOverride heading = 0 tilt = -0.75000000000 time = 0.00000100000 zoom = 5 
	OnExitRun DropIn_Cleanup 
	SetRollingFriction 10000 
	DisablePlayerInput 
	PlayAnim anim = <DropInAnim> Blendperiod = 0.00000000000 
	WaitAnim 60 Percent 
	ClearSkaterCamOverride 
	WaitAnim 85 Percent 
	UnpausePhysics 
	setstate ground 
	SetRollingFriction 0 
	Obj_WaitAnimFinished 
	EnablePlayerInput 
	OnGroundExceptions 
	waitonegameframe 
	SetLandedFromVert 
	Goto Land 
ENDSCRIPT

SCRIPT DropIn_Cleanup 
	ClearSkaterCamOverride 
	EnablePlayerInput 
	SetRollingFriction default 
ENDSCRIPT

SCRIPT StartSkating1 
	RestartSkaterExceptions 
	SetRollingFriction default 
	DisablePlayerInput AllowCameraControl 
	IF ProfileEquals is_named = mullen 
		SetRollingFriction 10000 
		PlayAnim anim = MullenStart Blendperiod = 0.00000000000 
		WaitAnim 40 Percent 
		Playsound boneless09 pitch = 110 
		PlayBonkSound 
		BlendperiodOut 0 
		WaitAnim 60 Percent 
		SetRollingFriction default 
	ELSE 
		IF NOT Flipped 
			flip 
		ENDIF 
		IF AutoKickIsOff 
			IF ShouldMongo 
				PlayAnim anim = MongoBrakeIdle 
			ELSE 
				PlayAnim anim = BrakeIdle 
			ENDIF 
		ELSE 
			PlayAnim anim = StartSkating1 Blendperiod = 0.00000000000 
			WaitAnim 75 Percent 
		ENDIF 
	ENDIF 
	ClearSkaterCamOverride 
	EnablePlayerInput 
	OnGroundExceptions 
	Obj_WaitAnimFinished 
	Goto OnGroundAi 
ENDSCRIPT

SCRIPT RestartSkaterExceptions 
	AllowRailTricks 
	BoardRotate normal 
	ClearExceptions 
	ClearTrickQueue 
	SetQueueTricks NoTricks 
	ClearManualTrick 
	ClearEventBuffer 
	SwitchOnBoard 
ENDSCRIPT

SCRIPT LaunchSpecialMessage text = "Special Trick" vol = 100 pitch = 100 
	IF InMultiplayergame 
		IF NOT GetGlobalFlag flag = SOUNDS_SPECIALSOUNDS_OFF 
			Playsound HUD_specialtrickAA vol = <vol> pitch = <pitch> 
		ENDIF 
	ELSE 
		IF ( GetGlobalFlag flag = CHEAT_COOL_SPECIAL_TRICKS ) 
			IF GotParam Cool 
				SetSlomo 0.60000002384 
				pulse_blur Start = 0 End = 150 speed = 10 
				IF NOT GetGlobalFlag flag = SOUNDS_SPECIALSOUNDS_OFF 
					Playsound HUD_specialtrickAA vol = 200 pitch = 75 
				ENDIF 
				OnExceptionRun KillSpecial 
			ELSE 
				IF NOT GetGlobalFlag flag = SOUNDS_SPECIALSOUNDS_OFF 
					Playsound HUD_specialtrickAA vol = <vol> pitch = <pitch> 
				ENDIF 
			ENDIF 
		ELSE 
			IF NOT GetGlobalFlag flag = SOUNDS_SPECIALSOUNDS_OFF 
				Playsound HUD_specialtrickAA vol = <vol> pitch = <pitch> 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT EndSpecial 
	BroadcastEvent type = SkaterExitSpecialTrick 
	IF ( GetGlobalFlag flag = CHEAT_COOL_SPECIAL_TRICKS ) 
		pulse_blur Start = 150 End = 0 time = 10 
		SetSlomo 1 
	ENDIF 
ENDSCRIPT

SCRIPT KillSpecial 
	SetGlobalPitchModulation 1.00000000000 
	IF IsSkaterFocused 
		turn_off = 1 
	ELSE 
		IF GotParam force 
			turn_off = 1 
		ENDIF 
	ENDIF 
	IF GotParam turn_off 
		KillSpawnedScript id = SFX_SlowMo 
		SpawnScript SK6_SFX_BulletTime_Out id = SFX_SlowMo_Return 
		IF NOT GotParam keep_decreasespecial 
			KillSpawnedScript name = bullettimedecreasespecial 
		ENDIF 
		BroadcastEvent type = SkaterExitFocus 
		FocusOff 
		SpawnScript EndBloom 
		IF GotParam timelimit 
			IF NOT GetGlobalFlag flag = NO_DISPLAY_HUD 
				Create_Panel_Message text = "Maximum focus time reached!" id = maxfocus style = focustimelimit_style 
			ENDIF 
			
		ENDIF 
	ENDIF 
	kill_blur 
	SetSlomo 1 
	ClearSkaterCamOverride 
ENDSCRIPT

SCRIPT LaunchExtraMessage text = "Hidden Combo!" 
	IF NOT GetGlobalFlag flag = SOUNDS_SPECIALSOUNDS_OFF 
		Playsound extratrick vol = 70 
	ENDIF 
ENDSCRIPT

SCRIPT toggle_bullettime 
	IF NOT inNetGame 
		IF NOT InMultiplayergame 
			skater : Bullettime_test 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT Bullettime_test slomo = 0.50000000000 
	IF IsSkaterFocused 
		IF NOT GotParam leveltrigger 
			KillSpecial 
			RETURN 
		ENDIF 
	ENDIF 
	IF NOT GotSpecial 
		RETURN 
	ENDIF 
	GetFocusTimeLeft 
	IF ( 0 > <focus_time> ) 
		RETURN 
	ENDIF 
	GetFocusTimesAllowed 
	IF ( <focus_allowed> > 0 ) 
		SetFocusTimesAllowed ( <focus_allowed> - 1 ) 
	ELSE 
		RETURN 
	ENDIF 
	FocusOn 
	BroadcastEvent type = SkaterEnterFocus 
	PulseBloom 
	SetSlomo <slomo> 
	
	SetGlobalPitchModulation <slomo> 
	pulse_blur Start = 0 End = 100 speed = 10 
	KillSpawnedScript id = SFX_SlowMo_Return 
	SpawnScript SK6_SFX_BulletTime_In id = SFX_SlowMo 
	SpawnScript bullettimedecreasespecial 
	IF GotParam leveltrigger 
		RETURN 
	ENDIF 
	Exit_BulletTime 
ENDSCRIPT

SCRIPT bullettimedecreasespecial 
	BEGIN 
		skater : GetSpecialValue 
		value = ( <value> - 10 ) 
		skater : SetSpecialValue value = <value> 
		IF ( <value> < 1 ) 
			BREAK 
		ENDIF 
		wait 1 gameframe 
	REPEAT 
	skater : KillSpecial keep_decreasespecial 
ENDSCRIPT

SCRIPT Exit_BulletTime 
	IF Inair 
		SetSkaterCamOverride heading = 0 tilt = 0 time = 0.00999999978 zoom = 0.75000000000 
	ELSE 
		SetSkaterCamOverride heading = 0 tilt = 0 time = 0.00999999978 zoom = 0.40000000596 
		IF OnGround 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT PedKnockDown 
	IF ObjectExists id = speech_box_anchor 
		DestroyScreenElement id = speech_box_anchor 
	ENDIF 
	IF ObjectExists id = goal_start_dialog 
		DestroyScreenElement id = goal_start_dialog 
	ENDIF 
	Obj_SpawnScript BloodSmall 
	IF GotParam SetVelDir 
		SetSkaterVelocity vel_x = ( <SetVelDir> . VECTOR(1.00000000000, 0.00000000000, 0.00000000000) ) vel_y = 0 vel_z = ( <SetVelDir> . VECTOR(0.00000000000, 0.00000000000, 1.00000000000) ) 
		TurnToFaceVelocity 
	ENDIF 
	IF GotParam SetVelSpeed 
		skater : SetSpeed <SetVelSpeed> 
	ENDIF 
	IF Skating 
		SetRollingFriction 0 
		StopBalanceTrick 
		IF OnLip 
			StopBalanceTrick 
			setstate Air 
			Move z = 1 
			Move y = 1 
		ENDIF 
		IF GotParam Jump 
			SetSpeed -150 
			wait 1 game Frame 
			Jump 
			FlipAndRotate 
			GotoRandomScript [ YawBail ] 
		ENDIF 
		IF IsSkaterOnVehicle 
			Goto vehicle_bail 
		ELSE 
			IF Onrail 
				Goto FiftyFiftyFall 
			ELSE 
				GotoRandomScript [ ManualBailSlow ManualBailFast NoseManualBailSlow NoseManualBailFast ] 
			ENDIF 
		ENDIF 
	ELSE 
		Goto WalkBailState 
	ENDIF 
ENDSCRIPT

SCRIPT SkaterAvoidGoalPed 
	IF GotParam heading 
		Rotate y = <heading> 
	ENDIF 
	IF NOT SpeedGreaterThan 100 
		SetSpeed <speed> 
	ENDIF 
	SetException Ex = CarBail Scr = CarBail 
	SetException Ex = SkaterCollideBail Scr = SkaterCollideBail 
	FlailVibrate 
	NollieOff 
	StopBalanceTrick 
	Obj_PlaySound RANDOM(1) RANDOMCASE RANDOMEND BailSlap03 
	IF NOT Walking 
		MakeSkaterGoto FlailHitWall 
	ENDIF 
ENDSCRIPT

TRANSFER_POINTS = 250 
ACID_DROP_POINTS = 250 
ACID_BOMB_POINTS = 350 
SCRIPT SkaterAwardTransfer name = "Spine Transfer" 
	SetTrickName <name> 
	SetTrickScore TRANSFER_POINTS 
	Display NoDegrade 
	LaunchSubStateEntryEvent SubState = Transfer 
	IF NOT DoingTrick 
		GetTags 
		IF ( <racemode> = none ) 
			setstate Air 
			InAirExceptions 
			PlayAnim anim = SpineTransfer 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT SkaterAwardHipTransfer 
	SkaterAwardTransfer name = "Hip Transfer" 
ENDSCRIPT

SCRIPT SkaterAcidDropTriggered 
	LaunchSubStateEntryEvent SubState = AcidDrop 
	SetTrickName #"Acid Drop" 
	IF ( <DropHeight> < 350 ) 
		SetTrickScore ACID_DROP_POINTS 
	ELSE 
		SetTrickScore ACID_BOMB_POINTS 
	ENDIF 
	Display NoDegrade 
	Obj_SpawnScript AcidParticlesOn 
	Obj_KillSpawnedScript name = HandleAcidDropCheese 
	Obj_SpawnScript HandleAcidDropCheese 
ENDSCRIPT

SCRIPT HandleAcidDropCheese 
	SetTags AcidDropCheese = 1 
	wait 1 second 
	SetTags AcidDropCheese = 0 
ENDSCRIPT

SCRIPT get_style_anim 
	IF NOT GotParam anim 
		
	ENDIF 
	IF NOT GotParam brakeanim 
		IF ProfileEquals style = crappy 
			style_suffix = "_crappy" 
		ELSE 
			IF ProfileEquals style = Cool 
				style_suffix = "_cool" 
			ENDIF 
		ENDIF 
	ELSE 
		IF ProfileEquals style = fat 
			style_suffix = "_fat" 
		ELSE 
			IF ProfileEquals is_female 
				style_suffix = "_female" 
			ENDIF 
		ENDIF 
	ENDIF 
	IF GotParam style_suffix 
		AppendSuffixToChecksum base = <anim> SuffixString = <style_suffix> 
		IF AnimExists <appended_id> 
			RETURN anim = <appended_id> 
		ENDIF 
	ENDIF 
	RETURN anim = <anim> 
ENDSCRIPT

SCRIPT PlayStyleAnim 
	get_style_anim anim = <anim> 
	PlayAnim <...> 
ENDSCRIPT

SCRIPT PlayStyleBrakeAnim 
	get_style_anim anim = <anim> brakeanim 
	PlayAnim <...> 
ENDSCRIPT

SCRIPT GetCrouchIdle 
	IF ProfileEquals style = crappy 
		GetRandomArrayElement CrouchIdlesCrappy 
	ELSE 
		IF ProfileEquals style = Cool 
			GetRandomArrayElement CrouchIdlesCool 
		ELSE 
			GetRandomArrayElement CrouchIdles 
		ENDIF 
	ENDIF 
	RETURN Element = <Element> 
ENDSCRIPT

SCRIPT GetTurnAnimArrays 
	IF ProfileEquals style = crappy 
		SWITCH <TurnAnims> 
			CASE CrouchTurnRight 
				new_turnanims = CrouchTurnRightAnimsCrappy 
				new_turnidles = CrouchTurnRightIdlesCrappy 
			CASE CrouchTurnLeft 
				new_turnanims = CrouchTurnLeftAnimsCrappy 
				new_turnidles = CrouchTurnLeftIdlesCrappy 
			CASE TurnLeft 
				new_turnanims = TurnLeftAnimsCrappy 
				new_turnidles = TurnLeftIdlesCrappy 
			CASE TurnRight 
				new_turnanims = TurnRightAnimsCrappy 
				new_turnidles = TurnRightIdlesCrappy 
		ENDSWITCH 
	ELSE 
		IF ProfileEquals style = Cool 
			SWITCH <TurnAnims> 
				CASE CrouchTurnRight 
					new_turnanims = CrouchTurnRightAnimsCool 
					new_turnidles = CrouchTurnRightIdlesCool 
				CASE CrouchTurnLeft 
					new_turnanims = CrouchTurnLeftAnimsCool 
					new_turnidles = CrouchTurnLeftIdlesCool 
				CASE TurnLeft 
					new_turnanims = TurnLeftAnimsCool 
					new_turnidles = TurnLeftIdlesCool 
				CASE TurnRight 
					new_turnanims = TurnRightAnimsCool 
					new_turnidles = TurnRightIdlesCool 
			ENDSWITCH 
		ELSE 
			SWITCH <TurnAnims> 
				CASE CrouchTurnRight 
					new_turnanims = CrouchTurnRightAnims 
					new_turnidles = CrouchTurnRightIdles 
				CASE CrouchTurnLeft 
					new_turnanims = CrouchTurnLeftAnims 
					new_turnidles = CrouchTurnLeftIdles 
				CASE TurnLeft 
					new_turnanims = TurnLeftAnims 
					new_turnidles = TurnLeftIdles 
				CASE TurnRight 
					new_turnanims = TurnRightAnims 
					new_turnidles = TurnRightIdles 
			ENDSWITCH 
		ENDIF 
	ENDIF 
	RETURN TurnAnims = <new_turnanims> TurnIdles = <new_turnidles> 
ENDSCRIPT


