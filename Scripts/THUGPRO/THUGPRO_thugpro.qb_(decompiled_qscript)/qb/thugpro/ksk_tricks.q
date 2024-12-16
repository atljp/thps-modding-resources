Ksk_OffBoard_Trigger = { Trigger = { PressTwoAnyOrder , Black , White , 200 } } 
Walking_Air_ExtraTricks = 
{ 
	{ Trigger = { InOrder , a = White , b = White , 300 } Scr = KskAirBackflipState } 
	{ Trigger = { InOrder , a = Black , b = Black , 300 } Scr = KskAirFrontflipState } 
} 
SCRIPT ToTail 
	IF %"!" InVertAir 
		RestoreEvents UsedBy = Regular Duration = 200 
		Goto Airborne 
	ENDIF 
	OnExitRun ToTail_Cleanup 
	NoRailTricks 
	PlayAnim Anim = ToTail_In Speed = 1.25000000000 
	NoSpin 
	BEGIN 
		IF Released Triangle 
			IF AnimEquals ToTail_Idle 
				PlayAnim Anim = ToTail_Out 
			ELSE 
				PlayAnim Anim = ToTail_In From = Current To = Start 
			ENDIF 
			BREAK 
		ELSE 
			IF AnimEquals ToTail_In 
				IF AnimFinished 
					PlayAnim Anim = ToTail_Idle Cycle 
				ENDIF 
			ENDIF 
		ENDIF 
		DoNextTrick 
		Wait 1 game frame 
	REPEAT 
	WaitAnimWhilstChecking 
	Goto Airborne 
ENDSCRIPT

SCRIPT ToTail_Cleanup 
	Printf "Cleanup" 
	AllowRailTricks 
	CanSpin 
ENDSCRIPT

SCRIPT Ksk_StartSkating 
	RestartSkaterExceptions 
	SetRollingFriction default 
	DisablePlayerInput AllowCameraControl 
	SetRollingFriction 10000 
	PlayAnim Anim = MullenStart BlendPeriod = 0.20000000298 
	WaitAnim 40 Percent 
	Playsound boneless09 pitch = 110 
	PlayBonkSound 
	BlendPeriodOut 0 
	WaitAnim 60 Percent 
	SetRollingFriction default 
	ClearSkaterCamOverride 
	EnablePlayerInput 
	OnGroundExceptions 
	waitanimfinished 
	Goto OnGroundAi 
ENDSCRIPT

SCRIPT Ksk_StartSkating2 
	RestartSkaterExceptions 
	SetRollingFriction default 
	DisablePlayerInput AllowCameraControl 
	IF %"!" Flipped 
		flip 
	ENDIF 
	IF NOT IsTrue GLOBAL_AutoKickOn 
		IF ShouldMongo 
			PlayAnim Anim = MongoBrakeIdle 
		ELSE 
			PlayAnim Anim = BrakeIdle 
		ENDIF 
	ELSE 
		PlayAnim Anim = StartSkatingPush BlendPeriod = 0.20000000298 
		WaitAnim 75 Percent 
	ENDIF 
	ClearSkaterCamOverride 
	EnablePlayerInput 
	OnGroundExceptions 
	waitanimfinished 
	Goto OnGroundAi 
ENDSCRIPT

ksk_board_count = 0 
SCRIPT CreateExitBoard vel = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) rotvel = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) object_vel_factor = 1 
	Change ksk_board_count = ( ksk_board_count + 1 ) 
	Ksk_DebugValue value_name = "board count" value_value = ksk_board_count 
	Obj_GetId 
	MangleChecksums a = ExitBoard b = <ObjId> 
	Skeleton_SpawnCompositeObject <...> offset = VECTOR(0.00000000000, 3.00000000000, 2.00000000000) bone = Bone_Board_Root components = BailBoardComponents Params = { name = <mangled_id> cloneFrom = <ObjId> geoms = [ Board ] } 
	<mangled_id> : RigidBody_IgnoreSkater 15 frames 
	<mangled_id> : RigidBody_Wake 
	IF GotParam DontMatchSpeed 
	ELSE 
		<mangled_id> : Rigidbody_MatchVelocityTo skater 
	ENDIF 
	Wait 35 frames 
	RunScriptOnObject Id = <mangled_id> ksk_exit_board_ex 
ENDSCRIPT

SCRIPT ksk_exit_board_ex 
	ClearExceptions 
	Obj_SetInnerRadius 4 
	Obj_SetOuterRadius 4000 
	SetException Ex = ObjectInRadius Scr = ksk_exit_board_handler 
	SetException Ex = ObjectOutOfRadius Scr = ksk_exit_board_toofar 
ENDSCRIPT

SCRIPT ksk_exit_board_toofar 
	IF NOT <colObjId> : IsLocalSkater 
		RETURN 
	ENDIF 
	Die 
ENDSCRIPT

SCRIPT ksk_exit_board_handler 
	IF NOT <colObjId> : IsLocalSkater 
		RETURN 
	ENDIF 
	ClearExceptions 
	IF skater : IsBoardMissing 
		Obj_GetOrientationToObject skater 
		Ksk_DebugValue value_name = "orientation" value_value = <dotProd> 
		skater : ReturnBoardToSkater 
		skater : SwitchToSkatingPhysics 
		IF skater : InAir 
			MakeSkaterGoto WalkingToRailTrick 
		ENDIF 
		IF skater : OnGround 
			MakeSkaterGoto WalkingRunToSkating 
		ENDIF 
		Die 
	ELSE 
		IF ControllerPressed Triangle 
			IF skater : InAir 
				BroadcastEvent Type = SkaterPointRail 
				skater : DoCarPlantBoost 
				Obj_Playsound OllieWood 
				MakeSkaterGoto PointRail 
			ENDIF 
		ENDIF 
	ENDIF 
	Wait 30 gameframes 
	SetException Ex = SkaterInRadius Scr = ksk_exit_board_handler 
ENDSCRIPT

SCRIPT kskOffBoard_FromAir 
	TakeBoardFromSkater 
	CreateExitBoard vel = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) rotvel = VECTOR(5.00000000000, 2.00000000000, 7.00000000000) object_vel_factor = 0.10000000149 
	Goto kskOffBoard_Air 
ENDSCRIPT

SCRIPT kskOffBoard_FromGround 
	ClearTrickQueue 
	ClearEventBuffer Buttons = Dpad OlderThan = TRICK_PRELOAD_TIME 
	ClearEventBuffer Buttons = [ x ] OlderThan = 0 
	ClearExceptions 
	LaunchStateChangeEvent State = Skater_InAir 
	SetExtraTricks NoTricks 
	SetQueueTricks NoTricks 
	TakeBoardFromSkater 
	CreateExitBoard vel = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) rotvel = VECTOR(10.00000000000, 0.00000000000, 2.00000000000) object_vel_factor = 0 
	Jump BonelessHeight 
	PlayAnim Anim = Ollie BlendPeriod = 0.20000000298 NoRestart 
	Goto kskOffBoard_Air 
ENDSCRIPT

SCRIPT kskOffBoard_Air BlendPeriod = 0.30000001192 
	ClearExceptions 
	KillExtraTricks 
	SetQueueTricks NoTricks 
	SetExtraTricks FlipRoll_WithWalking 
	NoRailTricks 
	SetException Ex = Wallplant Scr = kskOffBoard_Wallplant 
	SetException Ex = Landed Scr = kskOffBoard_Land 
	SetException Ex = FlailHitWall Scr = BailSmack Params = { } 
	SetException Ex = FlailLeft Scr = BailSmack Params = { } 
	SetException Ex = FlailRight Scr = BailSmack Params = { } 
	PlayWalkAnim Anim = JumpAirToAirIdle Cycle BlendPeriod = <BlendPeriod> NoRestart 
	BEGIN 
		BEGIN 
			DoNextTrick 
			GetAirTimeLeft 
			GetAirtime 
			IF ( <AirTimeLeft> < 0.40000000596 ) 
				IF AirTimeGreaterThan 1 Seconds 
					IF Released x 
						Goto kskOffBoard_Air_FlailingFall 
					ENDIF 
				ENDIF 
				BREAK 
			ENDIF 
			waitonegameframe 
		REPEAT 
		WaitAnimWhilstChecking 
		DoNextTrick 
		waitonegameframe 
	REPEAT 
ENDSCRIPT

SCRIPT kskOffBoard_Land 
	SetSkaterCamLerpReductionTimer time = 0 
	GetSpeed 
	IF SpeedGreaterThan 500 
		IF YawBetween PAIR(80.00000000000, 100.00000000000) 
			ClearComboBonusPot 
			Goto YawBail 
		ENDIF 
		IF YawBetween PAIR(60.00000000000, 120.00000000000) 
			ClearComboBonusPot 
			Goto YawBail 
		ENDIF 
	ENDIF 
	IF AbsolutePitchGreaterThan 60 
		IF PitchGreaterThan 60 
			ClearComboBonusPot 
			Goto PitchBail 
		ENDIF 
	ENDIF 
	IF LandedFromSpine 
		GetMatrixNormal 
		IF ( <y> > 0.94999998808 ) 
			Printf "Bailing due to landing from spine onto flat ground" 
			ClearComboBonusPot 
			Goto PitchBail 
		ENDIF 
	ENDIF 
	IF RollGreaterThan 50 
		ClearComboBonusPot 
		Goto DoingTrickBail 
	ENDIF 
	IF DoingTrick 
		ClearComboBonusPot 
		Goto DoingTrickBail 
	ENDIF 
	DoPerfectCheck 
	NollieOff 
	PressureOff 
	ClearLipCombos 
	IF LandedFromVert 
		OverrideCancelGround 
		Obj_ClearFlag FLAG_SKATER_MANUALCHEESE 
		GetSpeed 
	ENDIF 
	Vibrate Actuator = 1 Percent = 80 Duration = 0.10000000149 
	GetAirtime 
	SpawnClothingLandScript 
	IF Backwards 
		FlipAndRotate 
		BoardRotate 
	ENDIF 
	ClearTrickQueue 
	OnGroundExceptions NoEndRun 
	OnExceptionRun LandSkaterTricks 
	IF GoalManager_GoalShouldExpire 
		ClearException Ollied 
		ClearException GroundGone 
		ClearException WallPush 
	ENDIF 
	LandSkaterTricks 
	ClearComboBonusPot 
	CheckForNetBrake 
	IF AirTimeLessThan 1 Seconds 
		IF SpeedGreaterThan 300 
			PlayAnim Anim = JumpLandToWalk 
		ELSE 
			PlayAnim Anim = JumpLandToStand 
		ENDIF 
	ELSE 
		IF SpeedGreaterThan 300 
			PlayAnim Anim = RunJumpLand 
		ELSE 
			PlayAnim Anim = BigJumpLandToWalk 
		ENDIF 
	ENDIF 
	SetRollingFriction 20 
	SwitchToWalkingPhysics 
	WaitAnimWhilstChecking 
	Goto StandState 
ENDSCRIPT

SCRIPT kskOffBoard_Wallplant 
	PressureOff 
	NollieOff 
	ClearException Ollied 
	LaunchStateChangeEvent State = Skater_InWallplant 
	Vibrate Actuator = 1 Percent = 100 Duration = 0.10000000149 
	SetTrickName "" 
	SetTrickScore 0 
	Display Blockspin 
	PlayAnim Anim = Wallplant_Ollie BlendPeriod = 0 
	SetTrickName #"Wallplant" 
	SetTrickScore 750 
	Display 
	GetStartTime 
	BEGIN 
		GetElapsedTime StartTime = <StartTime> 
		IF ( <ElapsedTime> > Post_Wallplant_No_Ollie_Window ) 
			BREAK 
		ENDIF 
		DoNextTrick 
		Wait 1 GameFrame 
	REPEAT 
	ClearEventBuffer Buttons = [ x ] OlderThan = 0 
	SetSkaterAirTricks AllowWallplantOllie 
	GetStartTime 
	BEGIN 
		GetElapsedTime StartTime = <StartTime> 
		IF ( <ElapsedTime> > Post_Wallplant_Allow_Ollie_Window ) 
			BREAK 
		ENDIF 
		DoNextTrick 
		Wait 1 GameFrame 
	REPEAT 
	WaitAnimWhilstChecking 
	Goto kskOffBoard_Air 
ENDSCRIPT

SCRIPT kskOffBoard_Air_FlailingFall 
	PlayAnim Anim = FlailingFall PingPong From = End To = 5 Speed = 1.20000004768 BlendPeriod = 0.10000000149 
	ClearExceptions 
	SetException Ex = Landed Scr = kskOffBoard_Air_BailLand 
ENDSCRIPT

SCRIPT kskOffBoard_Air_BailLand 
	Goto kskOffBoard_GeneralBail Params = { Anim1 = RollingBail Anim2 = RollingGetup } 
ENDSCRIPT

SCRIPT kskOffBoard_GeneralBail Friction = 18 Friction2 = 20 HeavyFriction = 100 
	Obj_SetBoundingSphere 100 
	ClearEventBuffer Buttons = [ x ] 
	NollieOff 
	PressureOff 
	KillSpecial 
	created_trick_cleanup 
	SetSkaterCamLerpReductionTimer time = 0 
	InBail 
	LaunchStateChangeEvent State = Skater_InBail 
	SetExtraPush radius = 48 Speed = 100 Rotate = 6 
	TurnToFaceVelocity 
	SparksOff 
	VibrateOff 
	ClearExceptions 
	DisablePlayerInput AllowCameraControl 
	BailSkaterTricks 
	StopBalanceTrick 
	IF GotParam GroundGoneBail 
		SetException Ex = GroundGone Scr = <GroundGoneBail> Params = { <...> } 
	ENDIF 
	IF GotParam SmackAnim 
		SetException Ex = FlailHitWall Scr = BailSmack Params = { SmackAnim = <SmackAnim> } 
		SetException Ex = FlailLeft Scr = BailSmack Params = { SmackAnim = <SmackAnim> } 
		SetException Ex = FlailRight Scr = BailSmack Params = { SmackAnim = <SmackAnim> } 
	ENDIF 
	IF InSlapGame 
		SetException Ex = SkaterCollideBail Scr = SkaterCollideBail 
	ELSE 
		IF GameModeEquals is_firefight 
			SetEventHandler Ex = SkaterCollideBail Scr = Bail_FireFight_SkaterCollideBail 
		ENDIF 
	ENDIF 
	IF GotParam Sound 
	ELSE 
		PlayBonkSound 
	ENDIF 
	IF GotParam NoBlending 
		PlayAnim Anim = <Anim1> NoRestart BlendPeriod = 0 
	ELSE 
		PlayAnim Anim = <Anim1> NoRestart BlendPeriod = 0.30000001192 
	ENDIF 
	IF GotParam BashOff 
	ELSE 
		BashOn 
	ENDIF 
	WaitOnGround 
	IF %"!" GotParam NoScuff 
		IF %"!" GetGlobalFlag flag = BLOOD_OFF 
			Scuff_skater 
		ENDIF 
	ENDIF 
	IF %"!" GetGlobalFlag flag = BLOOD_OFF 
		IF GotParam Bloodframe 
			WaitAnim frame <Bloodframe> 
			Obj_SpawnScript BloodSmall 
			Playsound RANDOM(1, 1, 1) RANDOMCASE hitblood01 RANDOMCASE hitblood02 RANDOMCASE hitblood03 RANDOMEND 
		ENDIF 
	ENDIF 
	Vibrate Actuator = 1 Percent = 100 Duration = 0.20000000298 
	SetRollingFriction <HeavyFriction> 
	Wait 3 frames 
	SetRollingFriction <Friction> 
	WaitAnim 30 Percent 
	SpeedCheckStop 
	SetRollingFriction <Friction2> 
	WaitAnim 50 Percent 
	SpeedCheckStop 
	BashOn 
	WaitAnim 75 Percent 
	SpeedCheckStop 
	waitanimfinished 
	IF GotParam SpeedBasedAnim1 
		IF SpeedGreaterThan <Speed> 
			PlayAnim Anim = <SpeedBasedAnim2> 
		ELSE 
			PlayAnim Anim = <SpeedBasedAnim1> 
		ENDIF 
		Vibrate Actuator = 1 Percent = 100 Duration = 0.20000000298 
		Obj_SpawnScript BloodSmall 
		SetRollingFriction 20 
		waitanimfinished 
	ENDIF 
	SpeedCheckStop 
	IF GotParam Anim2 
		PlayAnim Anim = <Anim2> BlendPeriod = 0 
	ENDIF 
	SetRollingFriction 20 
	SpeedCheckStop 
	VibrateOff 
	WaitAnim 20 frames fromend 
	waitanimfinished 
	EnablePlayerInput 
	SwitchToWalkingPhysics 
	Goto JustStoppedSkatingState 
ENDSCRIPT

SCRIPT GibbonHangState 
	ClearExceptionGroup WalkingStateExceptions 
	SetException Ex = HangMoveLeft Scr = GibbonSwingLeftState Group = WalkingStateExceptions 
	SetException Ex = HangMoveRight Scr = GibbonSwingRightState Group = WalkingStateExceptions 
	SetException Ex = AIR Scr = GibbonToAirState Group = WalkingStateExceptions 
	SetException Ex = Jump Scr = GibbonToAirState Group = WalkingStateExceptions 
	SetException Ex = PullUpFromHang Scr = PullUpFromHangState Group = WalkingStateExceptions 
	SetEventHandler Ex = JumpRequested Scr = JumpRequestedEvent Group = WalkingEvents 
	SetWalkingTrickState NewWalkingTrickState = Off 
	LaunchStateChangeEvent State = Skater_InHang 
	Walk_ScaleAnimSpeed Off 
	IF AnimEquals { JumpToSwingHang JumpToWallHang JumpToGibbonIdle } 
		WaitAnimWalking 
	ENDIF 
	PlayWalkAnim Anim = GibbonIdle Cycle NoRestart BlendPeriod = 0.30000001192 
	WaitWalking 
ENDSCRIPT

SCRIPT AirToGibbonState 
	Rotate y = 90 
	ClearExceptionGroup WalkingStateExceptions 
	SetException Ex = HangMoveLeft Scr = GibbonSwingLeftState Group = WalkingStateExceptions 
	SetException Ex = HangMoveRight Scr = GibbonSwingRightState Group = WalkingStateExceptions 
	SetException Ex = AIR Scr = GibbonToAirState Group = WalkingStateExceptions 
	SetException Ex = Jump Scr = GibbonToAirState Group = WalkingStateExceptions 
	SetException Ex = PullUpFromHang Scr = PullUpFromHangState Group = WalkingStateExceptions 
	SetEventHandler Ex = JumpRequested Scr = JumpRequestedEvent Group = WalkingEvents 
	SetWalkingTrickState NewWalkingTrickState = Off 
	LaunchStateChangeEvent State = Skater_InHang 
	Walk_ScaleAnimSpeed Off 
	Walk_GetHangInitAnimType 
	SWITCH <HangInitAnimType> 
		CASE SWING 
			PlayWalkAnim Anim = GibbonSwingToGibbonIdle BlendPeriod = 0 
		CASE WALL 
			PlayWalkAnim Anim = JumpToGibbonIdle BlendPeriod = 0 
	ENDSWITCH 
	WaitAnimWalking 
	Goto GibbonHangState 
ENDSCRIPT

SCRIPT GibbonSwingLeftState 
	ClearExceptionGroup WalkingStateExceptions 
	SetException Ex = Hang Scr = GibbonHangState Group = WalkingStateExceptions 
	SetException Ex = HangMoveRight Scr = GibbonSwingRightState Group = WalkingStateExceptions 
	SetException Ex = AIR Scr = HangToAirState Group = WalkingStateExceptions 
	SetException Ex = Jump Scr = HangToAirState Group = WalkingStateExceptions 
	SetException Ex = PullUpFromHang Scr = PullUpFromHangState Group = WalkingStateExceptions 
	SetEventHandler Ex = JumpRequested Scr = JumpRequestedEvent Group = WalkingEvents 
	SetWalkingTrickState NewWalkingTrickState = Off 
	Walk_ScaleAnimSpeed HangMove 
	PlayGibbonMoveAnimCycle HangAnim = GibbonSwing 
ENDSCRIPT

SCRIPT GibbonSwingRightState 
	ClearExceptionGroup WalkingStateExceptions 
	SetException Ex = Hang Scr = GibbonHangState Group = WalkingStateExceptions 
	SetException Ex = HangMoveLeft Scr = GibbonSwingLeftState Group = WalkingStateExceptions 
	SetException Ex = AIR Scr = HangToAirState Group = WalkingStateExceptions 
	SetException Ex = Jump Scr = HangToAirState Group = WalkingStateExceptions 
	SetException Ex = PullUpFromHang Scr = PullUpFromHangState Group = WalkingStateExceptions 
	SetEventHandler Ex = JumpRequested Scr = JumpRequestedEvent Group = WalkingEvents 
	SetWalkingTrickState NewWalkingTrickState = Off 
	Walk_ScaleAnimSpeed HangMove 
	PlayWalkAnim Anim = GibbonTurn BlendPeriod = 0.30000001192 
	waitanimfinished 
	Rotate y = -180 
	PlayGibbonMoveAnimCycle HangAnim = GibbonSwing 
ENDSCRIPT

SCRIPT GibbonToAirState 
	ClearExceptionGroup WalkingStateExceptions 
	SetException Ex = Land Scr = LandState Group = WalkingStateExceptions 
	SetException Ex = Hang Scr = AirToGibbonState Group = WalkingStateExceptions 
	SetException Ex = Ladder Scr = LadderMoveUpState Group = WalkingStateExceptions 
	SetException Ex = Wallplant Scr = WallplantState Group = WalkingStateExceptions 
	ClearException JumpRequested 
	SetWalkingTrickState NewWalkingTrickState = AIR 
	Walk_ScaleAnimSpeed Off 
	PlayWalkAnim Anim = GibbonIdleToDrop BlendPeriod = 0.05000000075 
	WaitAnimWalking 
	Goto AirState 
ENDSCRIPT

SCRIPT PlayGibbonMoveAnimCycle 
	BlendPeriodOut 0.30000001192 
	PreviousPartialAnimOverlay = UndeterminedOverlay 
	BEGIN 
		IF %"!" ( <PreviousPartialAnimOverlay> = <PartialAnimOverlay> ) 
			IF ( <PartialAnimOverlay> = NoOverlay ) 
				PlayAnim Anim = <HangAnim> Cycle <SyncToPreviousAnim> BlendPeriod = 0.10000000149 
			ELSE 
				PlayAnim Anim = <HangAnim> PartialAnimOverlay = <PartialAnimOverlay> Cycle <SyncToPreviousAnim> BlendPeriod = 0.10000000149 
			ENDIF 
		ENDIF 
		PreviousPartialAnimOverlay = <PartialAnimOverlay> 
		SyncToPreviousAnim = SyncToPreviousAnim 
		DoNextManualTrick ScriptToRunFirst = BeginWalkingManualTrick FromWalk 
		DoNextTrick ScriptToRunFirst = BeginWalkingGenericTrick 
		Wait 1 GameFrame 
	REPEAT 
ENDSCRIPT

SCRIPT KskGroundPunchState 
	ClearExceptionGroup WalkingStateExceptions 
	SetException Ex = LadderOntoBottom Scr = LadderOntoBottomState Group = WalkingStateExceptions 
	SetException Ex = LadderOntoTop Scr = LadderOntoTopState Group = WalkingStateExceptions 
	SetException Ex = Jump Scr = RunJumpState Group = WalkingStateExceptions 
	SetException Ex = WalkOffEdge Scr = AirState Group = WalkingStateExceptions 
	SetException Ex = DropToHang Scr = DropToHangState Group = WalkingStateExceptions 
	SetException Ex = Ride Scr = StandToRideState Group = WalkingStateExceptions 
	SetEventHandler Ex = JumpRequested Scr = JumpRequestedEvent Group = WalkingEvents 
	SetWalkingTrickState NewWalkingTrickState = GROUND 
	Walk_ScaleAnimSpeed Off 
	PlayWalkAnim Anim = WalkingSlap BlendPeriod = 0.10000000149 
	WaitAnimWalking 
	Goto StandState 
ENDSCRIPT

SCRIPT KskAirPunchState 
	ClearExceptionGroup WalkingStateExceptions 
	SetException Ex = Land Scr = LandState Group = WalkingStateExceptions 
	SetException Ex = Hang Scr = AirToHangState Group = WalkingStateExceptions 
	SetException Ex = Ladder Scr = LadderMoveUpState Group = WalkingStateExceptions 
	SetException Ex = Jump Scr = RunJumpState Group = WalkingStateExceptions 
	SetException Ex = Wallplant Scr = WallplantState Group = WalkingStateExceptions 
	SetWalkingTrickState NewWalkingTrickState = AIR 
	Walk_ScaleAnimSpeed Off 
	PlayWalkAnim Anim = WalkingSlap BlendPeriod = 0.10000000149 
	WaitAnimWalking 
	Goto AirState 
ENDSCRIPT

SCRIPT KskBailState BoardOffFrame = 1 BoardVel = VECTOR(20.00000000000, 70.00000000000, -200.00000000000) BoardRotVel = VECTOR(2.00000000000, 5.00000000000, 1.00000000000) BoardSkaterVel = 0 
	ClearExceptionGroup WalkingStateExceptions 
	BailSkaterTricks 
	DisablePlayerInput AllowCameraControl 
	Obj_SpawnScript BailBoardControl Params = { BoardOffFrame = <BoardOffFrame> BoardVel = <BoardVel> BoardRotVel = <BoardRotVel> BoardSkaterVel = <BoardSkaterVel> NoBailBoard = 1 } 
	Walk_ScaleAnimSpeed Off 
	PlayWalkAnim Anim = WalkingBail BlendPeriod = 0.10000000149 
	waitanimfinished 
	PlayWalkAnim Anim = WalkingBailGetUp BlendPeriod = 0.10000000149 
	waitanimfinished 
	EnablePlayerInput 
	Goto StandState 
ENDSCRIPT

SCRIPT KskAirBackflipState 
	ClearExceptionGroup WalkingStateExceptions 
	SetException Ex = Land Scr = KskBailState Group = WalkingStateExceptions 
	SetException Ex = Hang Scr = AirToHangState Group = WalkingStateExceptions 
	SetException Ex = Ladder Scr = LadderMoveUpState Group = WalkingStateExceptions 
	SetException Ex = Jump Scr = RunJumpState Group = WalkingStateExceptions 
	SetException Ex = Wallplant Scr = WallplantState Group = WalkingStateExceptions 
	SetWalkingTrickState NewWalkingTrickState = AIR 
	Walk_ScaleAnimSpeed Off 
	PlayWalkAnim Anim = RunToJump BlendPeriod = 0.10000000149 
	RotateDisplay x Duration = 0.59999996424 Seconds StartAngle = 0 EndAngle = -360 SinePower = 0 RotationOffset = VECTOR(0.00000000000, 45.00000000000, 0.00000000000) 
	SetTrickName "Backflip" 
	SetTrickScore 500 
	Display 
	WaitAnimWalking 
	Goto AirState 
ENDSCRIPT

SCRIPT KskAirFrontflipState 
	ClearExceptionGroup WalkingStateExceptions 
	SetException Ex = Land Scr = KskBailState Group = WalkingStateExceptions 
	SetException Ex = Hang Scr = AirToHangState Group = WalkingStateExceptions 
	SetException Ex = Ladder Scr = LadderMoveUpState Group = WalkingStateExceptions 
	SetException Ex = Jump Scr = RunJumpState Group = WalkingStateExceptions 
	SetException Ex = Wallplant Scr = WallplantState Group = WalkingStateExceptions 
	SetWalkingTrickState NewWalkingTrickState = AIR 
	Walk_ScaleAnimSpeed Off 
	PlayWalkAnim Anim = RunToJump BlendPeriod = 0.10000000149 
	RotateDisplay x Duration = 0.59999996424 Seconds StartAngle = 0 EndAngle = 360 SinePower = 0 RotationOffset = VECTOR(0.00000000000, 45.00000000000, 0.00000000000) 
	SetTrickName "Frontflip" 
	SetTrickScore 500 
	Display 
	WaitAnimWalking 
	Goto AirState 
ENDSCRIPT

ksk_speed = 0 
HANG_SPINOUT_SPEED = 450 
SPIN_OUT_MAX_SPEED = 1800 
SPIN_OUT_STOP_SPEED = 450 
spin_out_speed = 0 
spin_out_speed2 = 0 
spin_out_angle = 0 
spin_out_angle2 = 0 
SPIN_OUT_ANGLE_STEP = -45 
spin_out_time = 0.80000001192 
spin_out_speed_multi = 0.75000000000 
spin_out_first = 1 
SCRIPT HangSpinOutState 
	Printf "KSK RAIL SPIN THINGY" 
	Change spin_out_first = 1 
	Change spin_out_angle = 0 
	Change spin_out_angle2 = 0 
	Printf "SPEED: %s" s = <exit_speed> 
	IF ( <exit_speed> > SPIN_OUT_MAX_SPEED ) 
		Change spin_out_speed = SPIN_OUT_MAX_SPEED 
	ELSE 
		Change spin_out_speed = <exit_speed> 
	ENDIF 
	Change spin_out_speed2 = spin_out_speed 
	THUGPRO_ToggleHangControls Off 
	ClearExceptionGroup WalkingStateExceptions 
	SetException Ex = AIR Scr = HangSpinAirState Params = { drop_speed = <exit_speed> } Group = WalkingStateExceptions 
	SetEventHandler Ex = JumpRequested Scr = HangSpinJumpState Params = { jump_angle = spin_out_angle jump_speed = spin_out_speed } Group = WalkingEvents 
	SetWalkingTrickState NewWalkingTrickState = Off 
	Walk_ScaleAnimSpeed Off 
	PlayWalkAnim Anim = HangIdle Cycle NoRestart BlendPeriod = 0.30000001192 
	BEGIN 
		IF ( spin_out_speed < SPIN_OUT_STOP_SPEED ) 
			RotateDisplay x Duration = ( spin_out_time / 1.50000000000 ) Seconds StartAngle = spin_out_angle EndAngle = -99 SinePower = 0 RotationOffset = VECTOR(0.00000000000, 90.00000000000, 0.00000000000) 
			Wait ( spin_out_time / 1.50000000000 ) Seconds 
			Change spin_out_speed = ( spin_out_speed2 / 2 ) 
			Change spin_out_speed2 = spin_out_speed 
			RotateDisplay x Duration = spin_out_time Seconds StartAngle = -99 EndAngle = 40 SinePower = 0 RotationOffset = VECTOR(0.00000000000, 90.00000000000, 0.00000000000) 
			Wait spin_out_time Seconds 
			Change spin_out_speed = ( spin_out_speed2 / 4 ) 
			Change spin_out_speed2 = spin_out_speed 
			RotateDisplay x Duration = spin_out_time Seconds StartAngle = 40 EndAngle = -5 SinePower = 0 RotationOffset = VECTOR(0.00000000000, 90.00000000000, 0.00000000000) 
			Wait spin_out_time Seconds 
			THUGPRO_ToggleHangControls on 
			BREAK 
		ENDIF 
		RotateDisplay x Duration = ( spin_out_time - ( spin_out_speed / 10000 ) ) Seconds StartAngle = 0 EndAngle = -360 SinePower = 0 RotationOffset = VECTOR(0.00000000000, 90.00000000000, 0.00000000000) 
		BEGIN 
			IF ( spin_out_angle = -90 ) 
				IF ( spin_out_first = 0 ) 
					Change spin_out_speed = ( spin_out_speed2 - 125 ) 
					Change spin_out_speed2 = spin_out_speed 
				ENDIF 
			ENDIF 
			IF ( spin_out_angle = -360 ) 
				Change spin_out_angle = 0 
				Change spin_out_angle2 = spin_out_angle 
				BREAK 
			ENDIF 
			Wait ( ( spin_out_time - ( spin_out_speed / 10000 ) ) / 8 ) Seconds 
			Change spin_out_angle = ( spin_out_angle2 + SPIN_OUT_ANGLE_STEP ) 
			Change spin_out_angle2 = spin_out_angle 
		REPEAT 
		Change spin_out_first = 0 
	REPEAT 
	FormatText TextName = MessageText "%s Rail spin" s = spin_out_angle 
	SetTrickName <MessageText> 
	SetTrickScore 300 
	Display 
	Goto HangState 
ENDSCRIPT

SCRIPT HangSpinJumpState jump_angle = 0 jump_speed = 0 
	CancelRotateDisplay 
	SWITCH <jump_angle> 
		CASE -360 
			Walk_Jump 
			LaunchEvent Type = Jump 
			Goto HangSpinAirState 
		CASE 0 
			SwitchToSkatingPhysics 
			SetSpeed ( <jump_speed> * spin_out_speed_multi ) 
			Jump BonelessHeight no_sound 
			DoCarPlantBoost 
		CASE -45 
			SwitchToSkatingPhysics 
			SetSpeed ( <jump_speed> * spin_out_speed_multi ) 
			Jump BonelessHeight no_sound 
			DoCarPlantBoost 
		CASE -90 
			SwitchToSkatingPhysics 
			SetSpeed ( <jump_speed> * spin_out_speed_multi ) 
			Jump BonelessHeight no_sound 
			DoCarPlantBoost 
		CASE -135 
			SwitchToSkatingPhysics 
			SetSpeed ( <jump_speed> * 0.20000000298 ) 
			DoCarPlantBoost 
			Jump BonelessHeight no_sound 
			IF ( <jump_speed> > 1200 ) 
				Jump BonelessHeight no_sound 
				RotateDisplay x Duration = 1.20000004768 Seconds StartAngle = -135 EndAngle = -1080 SinePower = 0 RotationOffset = VECTOR(0.00000000000, 45.00000000000, 0.00000000000) 
			ELSE 
				IF ( <jump_speed> > 750 ) 
					Jump BonelessHeight no_sound 
					RotateDisplay x Duration = 0.89999997616 Seconds StartAngle = -135 EndAngle = -720 SinePower = 0 RotationOffset = VECTOR(0.00000000000, 45.00000000000, 0.00000000000) 
				ELSE 
					RotateDisplay x Duration = 0.69999998808 Seconds StartAngle = -135 EndAngle = -360 SinePower = 0 RotationOffset = VECTOR(0.00000000000, 45.00000000000, 0.00000000000) 
				ENDIF 
			ENDIF 
		CASE -180 
			SwitchToSkatingPhysics 
			SetSpeed 15 
			Jump BonelessHeight no_sound 
			IF ( <jump_speed> > 1200 ) 
				Jump BonelessHeight no_sound 
				Jump BonelessHeight no_sound 
				RotateDisplay x Duration = 1 Seconds StartAngle = -180 EndAngle = -1080 SinePower = 0 RotationOffset = VECTOR(0.00000000000, 45.00000000000, 0.00000000000) 
			ELSE 
				IF ( <jump_speed> > 750 ) 
					Jump BonelessHeight no_sound 
					RotateDisplay x Duration = 0.69999998808 Seconds StartAngle = -180 EndAngle = -720 SinePower = 0 RotationOffset = VECTOR(0.00000000000, 45.00000000000, 0.00000000000) 
				ELSE 
					RotateDisplay x Duration = 0.69999998808 Seconds StartAngle = -180 EndAngle = -360 SinePower = 0 RotationOffset = VECTOR(0.00000000000, 45.00000000000, 0.00000000000) 
				ENDIF 
			ENDIF 
		CASE -225 
			SwitchToSkatingPhysics 
			SetSpeed ( <jump_speed> * -0.20000000298 ) 
			DoCarPlantBoost 
			Jump BonelessHeight no_sound 
			IF ( <jump_speed> > 1200 ) 
				Jump BonelessHeight no_sound 
				RotateDisplay x Duration = 1.20000004768 Seconds StartAngle = -225 EndAngle = -1080 SinePower = 0 RotationOffset = VECTOR(0.00000000000, 45.00000000000, 0.00000000000) 
			ELSE 
				IF ( <jump_speed> > 750 ) 
					Jump BonelessHeight no_sound 
					RotateDisplay x Duration = 0.89999997616 Seconds StartAngle = -225 EndAngle = -720 SinePower = 0 RotationOffset = VECTOR(0.00000000000, 45.00000000000, 0.00000000000) 
				ELSE 
					RotateDisplay x Duration = 0.69999998808 Seconds StartAngle = -225 EndAngle = -360 SinePower = 0 RotationOffset = VECTOR(0.00000000000, 45.00000000000, 0.00000000000) 
				ENDIF 
			ENDIF 
		CASE -270 
			SwitchToSkatingPhysics 
			SetSpeed ( ( <jump_speed> * spin_out_speed_multi ) * -1 ) 
			Jump BonelessHeight no_sound 
			DoCarPlantBoost 
		CASE -315 
			Walk_Jump 
			LaunchEvent Type = Jump 
			Goto HangSpinAirState 
	ENDSWITCH 
	IF IsBoardMissing 
		Printf "Goto kskOffBoard_Air" 
	ENDIF 
	IF Held L2 
		Printf "Goto kskOffBoard_FromAir" 
	ENDIF 
	Printf "EXITING RAIL SPIN THINGY!" 
	SwitchToWalkingPhysics 
	SetEventHandler Ex = Trigger_L2 Scr = CameraFlushButton Group = WalkingEvents 
	SetEventHandler Ex = Release_X Scr = JumpButton Group = WalkingEvents 
	Goto HangToAirState 
ENDSCRIPT

SPIN_OUT_DROP_SPEED = 590 
SCRIPT HangSpinAirState 
	SetTags ksk_speed = SPIN_OUT_DROP_SPEED 
	ClearExceptionGroup WalkingStateExceptions 
	SetException Ex = Land Scr = KskBailState Group = WalkingStateExceptions 
	SetException Ex = Hang Scr = AirToHangState Group = WalkingStateExceptions 
	SetException Ex = Ladder Scr = LadderMoveUpState Group = WalkingStateExceptions 
	SetException Ex = Jump Scr = RunJumpState Group = WalkingStateExceptions 
	SetException Ex = Wallplant Scr = WallplantState Group = WalkingStateExceptions 
	SetEventHandler Ex = JumpRequested Scr = JumpRequestedEvent Group = WalkingEvents 
	SetWalkingTrickState NewWalkingTrickState = AIR 
	Walk_ScaleAnimSpeed Off 
	PlayWalkAnim Anim = HangIdle NoRestart BlendPeriod = 0.30000001192 
	WaitAnimWalking 
	SwitchToWalkingPhysics 
	SetEventHandler Ex = Trigger_L2 Scr = CameraFlushButton Group = WalkingEvents 
	SetEventHandler Ex = Release_X Scr = JumpButton Group = WalkingEvents 
	Goto HangToAirState 
ENDSCRIPT

SCRIPT KskRailStallOllie jump_speed = 1100 
	Ksk_DebugValue value_name = "Rail Stall Speed" value_value = <jump_speed> 
	StopBalanceTrick 
	DoNextTrick 
	ClearTrickQueue 
	ClearEventBuffer Buttons = Dpad OlderThan = TRICK_PRELOAD_TIME 
	ClearEventBuffer Buttons = [ x ] OlderThan = 0 
	IF SpeedGreaterThan 100 
	ELSE 
		IF Held Down 
			SetSpeed ( <jump_speed> * -0.69999998808 ) 
		ELSE 
			IF Held DownLeft 
				SetSpeed ( <jump_speed> * -0.69999998808 ) 
				Change Rail_Jump_Angle = -60 
			ELSE 
				IF Held DownRight 
					SetSpeed ( <jump_speed> * -0.69999998808 ) 
					Change Rail_Jump_Angle = -60 
				ELSE 
					SetSpeed ( <jump_speed> * 0.69999998808 ) 
					IF Held Right 
						Change Rail_Jump_Angle = 90 
					ELSE 
						IF Held Left 
							Change Rail_Jump_Angle = 90 
						ELSE 
							Change Rail_Jump_Angle = 60 
						ENDIF 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	waitonegameframe 
	IF SpeedLessThan 250 
		SetSpeed 250 
	ENDIF 
	Jump 
	Change Rail_Jump_Angle = 15 
	InAirExceptions 
	IF InPressure 
		SetTrickName #"Pressure" 
		SetTrickScore 200 
		Display 
	ENDIF 
	Vibrate Actuator = 1 Percent = 50 Duration = 0.05000000075 
	IF InNollie 
		PlayAnim Anim = Nollie BlendPeriod = 0.10000000149 
	ELSE 
		PlayAnim Anim = Ollie BlendPeriod = 0 NoRestart 
	ENDIF 
	Bailoff 
	WaitAnimWhilstChecking 
	Goto Airborne 
ENDSCRIPT

SCRIPT Ksk_DebugValue value_name = "null" value_value = 108 
	FormatText TextName = MessageText "%n: %s" n = <value_name> s = <value_value> 
	create_console_message text = <MessageText> 
ENDSCRIPT


