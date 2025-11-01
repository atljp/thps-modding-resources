
Walking_Air_ExtraTricks = 
{ 
	{ Trigger = { InOrder , a = White , b = White , 300 } Scr = KskAirBackflipState } 
	{ Trigger = { InOrder , a = black , b = black , 300 } Scr = KskAirFrontflipState } 
} 
SCRIPT ToTail 
	IF NOT InVertAir 
		RestoreEvents UsedBy = regular Duration = 200 
		Goto Airborne 
	ENDIF 
	OnExitRun ToTail_Cleanup 
	NoRailTricks 
	PlayAnim Anim = NoseGrab speed = 1.25000000000 
	NoSpin 
	BEGIN 
		IF Released triangle 
			PlayAnim Anim = NoseGrab From = current To = start 
			BREAK 
		ELSE 
			IF AnimEquals NoseGrab 
				IF AnimFinished 
					PlayAnim Anim = NoseGrab_Idle Cycle 
				ENDIF 
			ENDIF 
		ENDIF 
		DoNextTrick 
		wait 1 game frame 
	REPEAT 
	WaitAnimWhilstChecking 
	Goto Airborne 
ENDSCRIPT

SCRIPT ToTail_Cleanup 
	printf "Cleanup" 
	AllowRailTricks 
	CanSpin 
ENDSCRIPT

SCRIPT KskBigBrake 
	ClearExceptions 
	WaitOnGround 
	SetRollingFriction 16 
	StopSkitch 
	StopBalanceTrick 
	ClearEventBuffer 
	IF NOT SpeedGreaterThan 300 
		Goto HandBrake 
	ENDIF 
	DisablePlayerInput AllowCameraControl 
	PlayAnim Anim = fs_powerslide_init 
	Obj_WaitAnimFinished 
	SetTrickName "Big Brake" 
	SetTrickScore 50 
	Display 
	PlayCessSound 
	BEGIN 
		IF NOT SpeedGreaterThan 100 
			BREAK 
		ENDIF 
		PlayAnim Anim = fs_powerslide_idle 
		DoNextTrick 
		TweakTrick 100 
		wait 1 GameFrame 
	REPEAT 
	Obj_WaitAnimFinished 
	LandSkaterTricks 
	EnablePlayerInput 
	Goto OnGroundAi 
ENDSCRIPT

SCRIPT Ksk_StartSkating 
	RestartSkaterExceptions 
	SetRollingFriction Default 
	DisablePlayerInput AllowCameraControl 
	SetRollingFriction 10000 
	PlayAnim Anim = MullenStart BlendPeriod = 0.20000000298 
	WaitAnim 40 Percent 
	PlaySound boneless09 pitch = 110 
	PlayBonkSound 
	BlendPeriodOut 0 
	WaitAnim 60 Percent 
	SetRollingFriction Default 
	ClearSkaterCamOverride 
	EnablePlayerInput 
	OnGroundExceptions 
	Obj_WaitAnimFinished 
	Goto OnGroundAi 
ENDSCRIPT

SCRIPT Ksk_StartSkating2 
	RestartSkaterExceptions 
	SetRollingFriction Default 
	DisablePlayerInput AllowCameraControl 
	IF NOT Flipped 
		Flip 
	ENDIF 
	PlayAnim Anim = StartSkatingPush BlendPeriod = 0.20000000298 
	WaitAnim 75 Percent 
	ClearSkaterCamOverride 
	EnablePlayerInput 
	OnGroundExceptions 
	Obj_WaitAnimFinished 
	Goto OnGroundAi 
ENDSCRIPT

SCRIPT KskBailState BoardOffFrame = 1 BoardVel = VECTOR(20.00000000000, 70.00000000000, -200.00000000000) BoardRotVel = VECTOR(2.00000000000, 5.00000000000, 1.00000000000) BoardSkaterVel = 0 
	ClearExceptionGroup WalkingStateExceptions 
	BailSkaterTricks 
	DisablePlayerInput AllowCameraControl 
	skater : AtomicIsHidden board 
	InBail 
	BashOn 
	IF ( <hidden> = 0 ) 
		Obj_SpawnScript BailBoardControl params = { BoardOffFrame = 10 BoardVel = VECTOR(0.00000000000, 0.00000000000, 200.00000000000) BoardRotVel = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) BoardSkaterVel = 1 } 
	ENDIF 
	Walk_ScaleAnimSpeed Off 
	PlayWalkAnim Anim = WalkingBail 
	Obj_WaitAnimFinished 
	PlayWalkAnim Anim = WalkingBail PingPong From = End To = 100 speed = 0.80000001192 BlendPeriod = 0.10000000149 
	WaitForEvent Type = Stand 
	PlayWalkAnim Anim = WalkingBailGetUp 
	Obj_WaitAnimFinished 
	SwitchOnBoard 
	BailDone 
	Goto Switch_OnGroundAi params = { NewScript = OnGroundAi Restart } 
ENDSCRIPT

SCRIPT KskAirBackflipState 
	ClearExceptionGroup WalkingStateExceptions 
	SetException Ex = Land Scr = KskBailState Group = WalkingStateExceptions 
	SetException Ex = Hang Scr = AirToHangState Group = WalkingStateExceptions 
	SetException Ex = Ladder Scr = LadderMoveUpState Group = WalkingStateExceptions 
	SetException Ex = Jump Scr = RunJumpState Group = WalkingStateExceptions 
	SetException Ex = Wallplant Scr = WallplantState Group = WalkingStateExceptions 
	SetWalkingTrickState NewWalkingTrickState = Air 
	Walk_ScaleAnimSpeed Off 
	PlayWalkAnim Anim = RunToJump BlendPeriod = 0.10000000149 
	RotateDisplay X Duration = 0.50000000000 seconds StartAngle = 0.00000000000 EndAngle = -360.00000000000 SinePower = 0 RotationOffset = VECTOR(0.00000000000, 45.00000000000, 0.00000000000) 
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
	SetWalkingTrickState NewWalkingTrickState = Air 
	Walk_ScaleAnimSpeed Off 
	PlayWalkAnim Anim = RunToJump BlendPeriod = 0.10000000149 
	RotateDisplay X Duration = 0.50000000000 seconds StartAngle = 0.00000000000 EndAngle = 360.00000000000 SinePower = 0 RotationOffset = VECTOR(0.00000000000, 45.00000000000, 0.00000000000) 
	SetTrickName "Frontflip" 
	SetTrickScore 500 
	Display 
	WaitAnimWalking 
	Goto AirState 
ENDSCRIPT

HANG_SPINOUT_SPEED = 450 
SPIN_OUT_MAX_SPEED = 2800 
SPIN_OUT_STOP_SPEED = 450 
spin_out_speed = 0.00000000000 
spin_out_speed2 = 0.00000000000 
spin_out_angle = 0.00000000000 
spin_out_angle2 = 0.00000000000 
SPIN_OUT_ANGLE_STEP = -45.00000000000 
spin_out_time = 0.80000001192 
spin_out_speed_multi = 0.75000000000 
spin_out_first = 1 
SCRIPT e9_togglehangcontrols 
ENDSCRIPT

SCRIPT PreventRailSpinMove Position = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
	BEGIN 
		skater : Obj_SetPosition Position = <pos> 
		wait 1 frames 
	REPEAT 
ENDSCRIPT

SCRIPT HangSpinOutState 
	printf "KSK RAIL SPIN THINGY" 
	change spin_out_first = 1 
	change spin_out_angle = 0 
	change spin_out_angle2 = 0 
	printf "SPEED: %s" s = <exit_speed> 
	IF ( <exit_speed> > SPIN_OUT_MAX_SPEED ) 
		change spin_out_speed = SPIN_OUT_MAX_SPEED 
	ELSE 
		change spin_out_speed = <exit_speed> 
	ENDIF 
	change spin_out_speed2 = spin_out_speed 
	e9_togglehangcontrols Off 
	ClearExceptionGroup WalkingStateExceptions 
	SetException Ex = Air Scr = HangSpinAirState params = { drop_speed = <exit_speed> } Group = WalkingStateExceptions 
	SetEventHandler Ex = JumpRequested Scr = HangSpinJumpState params = { jump_angle = spin_out_angle jump_speed = spin_out_speed } Group = WalkingEvents 
	SetWalkingTrickState NewWalkingTrickState = Off 
	Walk_ScaleAnimSpeed Off 
	PlayWalkAnim Anim = JumpToSwingHang NoRestart BlendPeriod = 0.30000001192 
	SetTrickName #"KSK Wire Spin" 
	SetTrickScore 300 
	Display Blockspin NoDegrade 
	skater : Obj_GetPosition 
	spawnscript PreventRailSpinMove params = { Position = <pos> } 
	BEGIN 
		IF ( spin_out_speed < SPIN_OUT_STOP_SPEED ) 
			RotateDisplay X Duration = ( spin_out_time / 1.50000000000 ) seconds StartAngle = spin_out_angle EndAngle = -99.00000000000 SinePower = 0 RotationOffset = VECTOR(0.00000000000, 90.00000000000, 0.00000000000) 
			wait ( spin_out_time / 1.50000000000 ) seconds 
			change spin_out_speed = ( spin_out_speed2 / 2.00000000000 ) 
			change spin_out_speed2 = spin_out_speed 
			RotateDisplay X Duration = spin_out_time seconds StartAngle = -99.00000000000 EndAngle = 40.00000000000 SinePower = 0 RotationOffset = VECTOR(0.00000000000, 90.00000000000, 0.00000000000) 
			wait spin_out_time seconds 
			change spin_out_speed = ( spin_out_speed2 / 4.00000000000 ) 
			change spin_out_speed2 = spin_out_speed 
			RotateDisplay X Duration = spin_out_time seconds StartAngle = 40.00000000000 EndAngle = -5.00000000000 SinePower = 0 RotationOffset = VECTOR(0.00000000000, 90.00000000000, 0.00000000000) 
			wait spin_out_time seconds 
			e9_togglehangcontrols on 
			BREAK 
		ENDIF 
		RotateDisplay X Duration = ( spin_out_time - ( spin_out_speed / 10000.00000000000 ) ) seconds StartAngle = 0.00000000000 EndAngle = -360.00000000000 SinePower = 0 RotationOffset = VECTOR(0.00000000000, 90.00000000000, 0.00000000000) 
		BEGIN 
			IF ( spin_out_angle = -90.00000000000 ) 
				IF ( spin_out_first = 0 ) 
					change spin_out_speed = ( spin_out_speed2 - 125.00000000000 ) 
					change spin_out_speed2 = spin_out_speed 
				ENDIF 
			ENDIF 
			IF ( spin_out_angle = -360.00000000000 ) 
				change spin_out_angle = 0.00000000000 
				change spin_out_angle2 = spin_out_angle 
				BREAK 
			ENDIF 
			wait ( ( spin_out_time - ( spin_out_speed / 10000.00000000000 ) ) / 8.00000000000 ) seconds 
			change spin_out_angle = ( spin_out_angle2 + SPIN_OUT_ANGLE_STEP ) 
			change spin_out_angle2 = spin_out_angle 
			TweakTrick 100 
		REPEAT 
		change spin_out_first = 0 
	REPEAT 
	KillSpawnedScript PreventRailSpinMove 
	Display 
	Goto HangState 
ENDSCRIPT

SCRIPT HangSpinJumpState jump_angle = 0.00000000000 jump_speed = 0.00000000000 
	CancelRotateDisplay 
	SWITCH <jump_angle> 
		CASE -360.00000000000 
			Walk_Jump 
			LaunchEvent Type = Jump 
			Goto HangSpinAirState 
		CASE 0 
			SwitchToSkatingPhysics 
			SetSpeed ( <jump_speed> * spin_out_speed_multi ) 
			Jump BonelessHeight no_sound 
			DoCarPlantBoost 
		CASE -45.00000000000 
			SwitchToSkatingPhysics 
			SetSpeed ( <jump_speed> * spin_out_speed_multi ) 
			Jump BonelessHeight no_sound 
			DoCarPlantBoost 
		CASE -90.00000000000 
			SwitchToSkatingPhysics 
			SetSpeed ( <jump_speed> * spin_out_speed_multi ) 
			Jump BonelessHeight no_sound 
			DoCarPlantBoost 
		CASE -135.00000000000 
			SwitchToSkatingPhysics 
			SetSpeed ( <jump_speed> * 0.20000000298 ) 
			DoCarPlantBoost 
			Jump BonelessHeight no_sound 
			IF ( <jump_speed> > 1200 ) 
				Jump BonelessHeight no_sound 
				RotateDisplay X Duration = 1.20000004768 seconds StartAngle = -135.00000000000 EndAngle = -1080.00000000000 SinePower = 0 RotationOffset = VECTOR(0.00000000000, 45.00000000000, 0.00000000000) 
			ELSE 
				IF ( <jump_speed> > 750.00000000000 ) 
					Jump BonelessHeight no_sound 
					RotateDisplay X Duration = 0.89999997616 seconds StartAngle = -135.00000000000 EndAngle = -720.00000000000 SinePower = 0 RotationOffset = VECTOR(0.00000000000, 45.00000000000, 0.00000000000) 
				ELSE 
					RotateDisplay X Duration = 0.69999998808 seconds StartAngle = -135.00000000000 EndAngle = -360.00000000000 SinePower = 0 RotationOffset = VECTOR(0.00000000000, 45.00000000000, 0.00000000000) 
				ENDIF 
			ENDIF 
		CASE -180.00000000000 
			SwitchToSkatingPhysics 
			SetSpeed 15 
			Jump BonelessHeight no_sound 
			IF ( <jump_speed> > 1200.00000000000 ) 
				Jump BonelessHeight no_sound 
				Jump BonelessHeight no_sound 
				RotateDisplay X Duration = 1.00000000000 seconds StartAngle = -180.00000000000 EndAngle = -1080.00000000000 SinePower = 0 RotationOffset = VECTOR(0.00000000000, 45.00000000000, 0.00000000000) 
			ELSE 
				IF ( <jump_speed> > 750 ) 
					Jump BonelessHeight no_sound 
					RotateDisplay X Duration = 0.69999998808 seconds StartAngle = -180.00000000000 EndAngle = -720.00000000000 SinePower = 0 RotationOffset = VECTOR(0.00000000000, 45.00000000000, 0.00000000000) 
				ELSE 
					RotateDisplay X Duration = 0.69999998808 seconds StartAngle = -180.00000000000 EndAngle = -360.00000000000 SinePower = 0 RotationOffset = VECTOR(0.00000000000, 45.00000000000, 0.00000000000) 
				ENDIF 
			ENDIF 
		CASE -225.00000000000 
			SwitchToSkatingPhysics 
			SetSpeed ( <jump_speed> * -0.20000000298 ) 
			DoCarPlantBoost 
			Jump BonelessHeight no_sound 
			IF ( <jump_speed> > 1200 ) 
				Jump BonelessHeight no_sound 
				RotateDisplay X Duration = 1.20000004768 seconds StartAngle = -225.00000000000 EndAngle = -1080.00000000000 SinePower = 0 RotationOffset = VECTOR(0.00000000000, 45.00000000000, 0.00000000000) 
			ELSE 
				IF ( <jump_speed> > 750 ) 
					Jump BonelessHeight no_sound 
					RotateDisplay X Duration = 0.89999997616 seconds StartAngle = -225.00000000000 EndAngle = -720.00000000000 SinePower = 0 RotationOffset = VECTOR(0.00000000000, 45.00000000000, 0.00000000000) 
				ELSE 
					RotateDisplay X Duration = 0.69999998808 seconds StartAngle = -225.00000000000 EndAngle = -360.00000000000 SinePower = 0 RotationOffset = VECTOR(0.00000000000, 45.00000000000, 0.00000000000) 
				ENDIF 
			ENDIF 
		CASE -270.00000000000 
			SwitchToSkatingPhysics 
			SetSpeed ( ( <jump_speed> * spin_out_speed_multi ) * -1.00000000000 ) 
			Jump BonelessHeight no_sound 
			DoCarPlantBoost 
		CASE -315.00000000000 
			Walk_Jump 
			LaunchEvent Type = Jump 
			Goto HangSpinAirState 
	ENDSWITCH 
	printf "EXITING RAIL SPIN THINGY!" 
	SwitchOnBoard 
	CleanUp_WalkingtoSkating 
	SetEventHandler Ex = Release_X Scr = JumpButton Group = WalkingEvents 
	Goto Airborne 
ENDSCRIPT

SPIN_OUT_DROP_SPEED = 590 
SCRIPT HangSpinAirState 
	ClearExceptionGroup WalkingStateExceptions 
	SetException Ex = Land Scr = KskBailState Group = WalkingStateExceptions 
	SetException Ex = Hang Scr = AirToHangState params = { ksk_speed = SPIN_OUT_DROP_SPEED } Group = WalkingStateExceptions 
	SetException Ex = Ladder Scr = LadderMoveUpState Group = WalkingStateExceptions 
	SetException Ex = Jump Scr = RunJumpState Group = WalkingStateExceptions 
	SetException Ex = Wallplant Scr = WallplantState Group = WalkingStateExceptions 
	SetEventHandler Ex = JumpRequested Scr = JumpRequestedEvent Group = WalkingEvents 
	SetWalkingTrickState NewWalkingTrickState = Air 
	Walk_ScaleAnimSpeed Off 
	PlayWalkAnim Anim = HangIdleToDrop NoRestart BlendPeriod = 0.30000001192 
	WaitAnimWalking 
	Goto AirState 
ENDSCRIPT

SCRIPT KskRailStallOllie jump_speed = 1100 
	StopBalanceTrick 
	DoNextTrick 
	ClearTrickQueue 
	ClearEventBuffer Buttons = Dpad OlderThan = TRICK_PRELOAD_TIME 
	ClearEventBuffer Buttons = [ X ] OlderThan = 0 
	IF ( <jump_speed> > 1100 ) 
		OverrideLimits max = <jump_speed> Friction = 0 time = 5 gravity = 0 
	ENDIF 
	IF SpeedGreaterThan 100 
	ELSE 
		IF Held Down 
			SetSpeed ( <jump_speed> * -0.69999998808 ) 
		ELSE 
			IF Held downleft 
				SetSpeed ( <jump_speed> * -0.69999998808 ) 
				change Rail_Jump_Angle = -60 
			ELSE 
				IF Held downright 
					SetSpeed ( <jump_speed> * -0.69999998808 ) 
					change Rail_Jump_Angle = -60 
				ELSE 
					SetSpeed ( <jump_speed> * 0.69999998808 ) 
					IF Held right 
						change Rail_Jump_Angle = 90 
					ELSE 
						IF Held Left 
							change Rail_Jump_Angle = 90 
						ELSE 
							change Rail_Jump_Angle = 60 
						ENDIF 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	waitonegameframe 
	IF SpeedLessThan 250 
		SetSpeed 250.00000000000 
	ENDIF 
	Jump 
	change Rail_Jump_Angle = 15 
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
	BailOff 
	WaitAnimWhilstChecking 
	Goto Airborne 
ENDSCRIPT

SCRIPT Ksk_DebugValue value_name = "null" value_value = 108 
	FormatText textname = MessageText "%n: %s" n = <value_name> s = <value_value> 
	create_console_message text = <MessageText> 
ENDSCRIPT


