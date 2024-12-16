
WallRideExceptionTable = [ 
	{ Exception Ex = Landed Scr = Land Params = { NoBlend IgnoreAirTime } } 
	{ Exception Ex = Ollied Scr = Wallie } 
	{ Exception Ex = GroundGone Scr = WallrideEnd } 
	{ Exception Ex = PointRail Scr = PointRail } 
	{ Exception Ex = PointRailSpin Scr = PointRailSpin } 
	{ Exception Ex = SkaterCollideBail Scr = SkaterCollideBail } 
] 
SCRIPT WallRide 
	OnExceptionRun 
	ResetEventHandlersFromTable WallRideExceptionTable 
	CancelRotateDisplay 
	LaunchStateChangeEvent State = Skater_OnWall 
	Vibrate Actuator = 1 Percent = 40 
	Obj_ClearFlag FLAG_SKATER_MANUALCHEESE 
	IF GotParam Left 
		move x = 36 
	ELSE 
		move x = -36 
	ENDIF 
	IF BailIsOn 
		SetState Air 
		
		Goto Bailsmack Params = { smackAnim = Bail_Wall_FWD_Regular SmackFriction = 75 } 
	ENDIF 
	BailOff 
	ClearTrickQueue 
	SetQueueTricks WallRideTricks 
	NollieOff 
	PressureOff 
	SetTrickScore 200 
	PlayCessSound 
	IF GotParam Left 
		IF Flipped 
			IF NOT IsFlipAfterSet 
				BS_Wallride = 1 
			ENDIF 
		ELSE 
			IF IsFlipAfterSet 
				BS_Wallride = 1 
			ENDIF 
		ENDIF 
	ELSE 
		IF NOT Flipped 
			IF NOT IsFlipAfterSet 
				BS_Wallride = 1 
			ENDIF 
		ELSE 
			IF IsFlipAfterSet 
				BS_Wallride = 1 
			ENDIF 
		ENDIF 
	ENDIF 
	IF GotParam BS_Wallride 
		SetTrickName #"BS Wallride" 
		PlayAnim Anim = WallRideBackTrans BlendPeriod = 0.00000000000 
	ELSE 
		SetTrickName #"FS Wallride" 
		PlayAnim Anim = WallRideFrontTrans BlendPeriod = 0.00000000000 
	ENDIF 
	IF BoardIsRotated 
		BoardRotate Normal 
	ENDIF 
	BEGIN 
		IF AnimFinished 
			BREAK 
		ENDIF 
		WallrideTrail 
		wait 1 frame 
	REPEAT 
	IF GotParam BS_Wallride 
		PlayAnim Anim = WallRideBackLoop BlendPeriod = 0.10000000149 Cycle 
	ELSE 
		PlayAnim Anim = WallRideFrontLoop BlendPeriod = 0.10000000149 Cycle 
	ENDIF 
	Display 
	BEGIN 
		TweakTrick 25 
		WallrideTrail 
		wait 1 frame 
		DoNextTrick 
	REPEAT 
ENDSCRIPT

SCRIPT WallrideTrail 
	IF IsXbox 
		name = skidtrail 
	ELSE 
		name = skidtrail_ps2 
	ENDIF 
	TextureSplat size = 6 radius = 0 bone = Bone_Board_Tail name = <name> trail lifetime = 15 
	TextureSplat size = 6 radius = 0 bone = Bone_Board_Nose name = <name> trail lifetime = 15 
ENDSCRIPT

SCRIPT WallrideEnd 
	BlendPeriodOut 0 
	SetException Ex = Landed Scr = Land 
	ClearExceptions 
	IF Inair 
		Goto Airborne 
	ENDIF 
ENDSCRIPT

SCRIPT Wallie 
	DoNextTrick 
	Vibrate Actuator = 1 Percent = 50 Duration = 0.10000000149 
	PlayAnim Anim = Ollie BlendPeriod = 0.00000000000 
	SetTrickName #"Wallie" 
	SetTrickScore 250 
	InAirExceptions 
	Display 
	Jump 
	WaitAnimWhilstChecking 
	Goto Airborne BlendPeriod = 0 
ENDSCRIPT

WallRideTricks = 
[ { Trigger = { PressAndRelease , Up , x , 500 } Scr = Trick_WallPlant } ] 
SCRIPT Trick_WallPlant 
	ClearTrickQueue 
	InAirExceptions 
	Vibrate Actuator = 1 Percent = 50 Duration = 0.10000000149 
	PlayAnim Anim = Boneless BlendPeriod = 0.00000000000 
	SetTrickName #"WalliePlant" 
	SetTrickScore 500 
	Display 
	Jump BonelessHeight 
	WaitAnimWhilstChecking 
	Goto Airborne BlendPeriod = 0 
ENDSCRIPT

WALLPLANT_WINDOW = 280 
Wallplant_Trick = 
[ 
	{ Press , x , WALLPLANT_WINDOW } 
] 
Wallplant_Trick2 = 
[ { InOrder , x , Down , WALLPLANT_WINDOW } ] 
Post_Wallplant_No_Ollie_Window = 100 
Post_Wallplant_Allow_Ollie_Window = 250 
WallplantOllie = 
[ 
	{ Trigger = { Tap , x , Post_Wallplant_Allow_Ollie_Window } Scr = Ollie Params = { JumpSpeed = 200 } } 
] 
SCRIPT Air_Wallplant 
	IF BailIsOn 
		SetState Air 
		
		SetRollingFriction 100 
		Goto Bailsmack Params = { smackAnim = Bail_Wall_FWD_Regular SmackFriction = 75 } 
	ENDIF 
	Obj_ClearFlag FLAG_SKATER_MANUALCHEESE 
	IF IsSkaterOnVehicle 
		Goto vehicle_wallplant 
	ENDIF 
	PressureOff 
	NollieOff 
	InAirExceptions 
	ClearException Ollied 
	LaunchStateChangeEvent State = Skater_InWallplant 
	Vibrate Actuator = 1 Percent = 100 Duration = 0.10000000149 
	SetTrickName "" 
	SetTrickScore 0 
	Display Blockspin 
	Flip 
	PlayAnim Anim = Wallplant_Sticker BlendPeriod = 0 
	BlendPeriodOut 0 
	BoardRotateAfter 
	SetTrickName #"Sticker Slap" 
	SetTrickScore 750 
	Display 
	Obj_PlaySound SK6_StickerSlap_01 vol = 150 pitch = RANDOM_RANGE PAIR(98.00000000000, 105.00000000000) 
	GetStartTime 
	BEGIN 
		GetElapsedTime StartTime = <StartTime> 
		IF ( <ElapsedTime> > Post_Wallplant_No_Ollie_Window ) 
			BREAK 
		ENDIF 
		DoNextTrick 
		wait 1 GameFrame 
	REPEAT 
	ClearEventBuffer Buttons = [ x ] OlderThan = 0 
	SetSkaterAirTricks AllowWallplantOllie 
	SetSkaterAirTricks 
	WaitAnim 25 Percent 
	WaitAnimWhilstChecking 
	TurnOffSpecialItem 
	Goto Airborne 
ENDSCRIPT

SCRIPT Vert_Wallplant 
	LaunchStateChangeEvent State = Skater_InWallplant 
	Vibrate Actuator = 1 Percent = 100 Duration = 0.10000000149 
	SetTrickName "" 
	SetTrickScore 0 
	Display Blockspin 
	PlayAnim Anim = VertPlant BlendPeriod = 0.00000000000 speed = 1.00000000000 
	OnExitRun TagClearFlagsScript 
	SetTrickName #"Vert Wallplant" 
	SetTrickScore 750 
	Display 
	Obj_SpawnScript SFX_Vert_Wallplant_with_wait 
	GetStartTime 
	BEGIN 
		GetElapsedTime StartTime = <StartTime> 
		IF ( <ElapsedTime> > Post_Wallplant_No_Ollie_Window ) 
			BREAK 
		ENDIF 
		DoNextTrick 
		wait 1 GameFrame 
	REPEAT 
	ClearEventBuffer Buttons = [ x ] OlderThan = 0 
	WaitAnim 60 Percent 
	Goto Airborne 
ENDSCRIPT

SCRIPT SFX_Vert_Wallplant_with_wait 
	wait 0.30000001192 seconds 
	Obj_PlaySound SK6_StickerSlap_01 vol = 150 pitch = RANDOM_RANGE PAIR(98.00000000000, 105.00000000000) 
ENDSCRIPT

SCRIPT Ground_Wallpush 
	Init_Wallpush 
	IF Crouched 
		PlayAnim Anim = Wallplant_Crouched BlendPeriod = 0 
	ELSE 
		PlayAnim Anim = Wallplant_Standing BlendPeriod = 0 
	ENDIF 
	BlendPeriodOut 0 
	BoardRotateAfter 
	FlipAfter 
	SetTrickName #"Wallpush" 
	SetTrickScore 10 
	Display Blockspin 
	WaitWhilstChecking AndManuals Duration = Physics_Disallow_Rewallpush_Duration 
	LandSkaterTricks 
	WaitAnimWhilstChecking AndManuals 
	IF AnimEquals Wallplant_Standing 
		IF Crouched 
			PlayAnim Anim = Idle 
			DoNextTrick 
			DoNextManualTrick 
			wait 1 GameFrame 
		ENDIF 
	ENDIF 
	Goto OnGroundAi 
ENDSCRIPT

SCRIPT Manual_CancelWallpushEvent 
	CancelWallpush 
ENDSCRIPT

Wallpush_Trick = { name = #"Wallpush" Score = 10 NoBlend FlipAfter Anim = Wallplant_NoseManual BalanceAnim = Manual_Range BalanceAnim2 = Manual_Range2 BalanceAnim3 = Manual_Range3 OffMeterTop = ManualBail OffMeterBottom = ManualLand ExtraTricks2 = ManualBranches ExtraTricks = FlatlandBranches AllowWallpush } 
NoseWallpush_Trick = { name = #"Wallpush" Score = 10 NoBlend FlipAfter Anim = Wallplant_Manual BalanceAnim = NoseManual_Range BalanceAnim2 = NoseManual_Range Nollie OffMeterTop = ManualLand OffMeterBottom = NoseManualBail ExtraTricks2 = NoseManualBranches ExtraTricks = FlatlandBranches AllowWallpush } 
SCRIPT Manual_Wallpush 
	GetSingleTag in_manual_land 
	IF GotParam in_manual_land 
		IF ( <in_manual_land> = 1 ) 
			Ground_Wallpush 
			RETURN 
		ENDIF 
	ENDIF 
	Init_Wallpush 
	BlendPeriodOut 0 
	IF GotParam ToNoseManual 
		Goto ManualLink Params = { NoseWallpush_Trick } 
	ELSE 
		Goto ManualLink Params = { Wallpush_Trick } 
	ENDIF 
ENDSCRIPT

SCRIPT Init_Wallpush 
	BroadcastEvent Type = SkaterWallpush 
	Vibrate Actuator = 1 Percent = 50 Duration = 0.15000000596 
ENDSCRIPT


