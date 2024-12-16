
TRICK_PRELOAD_TIME = 160 
Jumptricks0 = [ 
	{ Trigger = { PressAndRelease , Up , X , 300 } Trick_NoComply } 
] 
Jumptricks = [ 
	{ Trigger = { TapTwiceRelease , Up , X , 500 } TrickSlot = JumpSlot } 
] 
Trick_NoComply = { 
	Scr = NoComply 
	Params = { 
		Name = #"No Comply" 
		Score = 100 
	} 
} 
Trick_Boneless = { 
	Scr = Boneless 
	Params = { 
		Name = #"Boneless" 
		Anim = Boneless 
		Score = 250 
	} 
} 
Trick_Fastplant = { 
	Scr = Boneless 
	Params = { 
		Name = #"Fastplant" 
		Anim = Fastplant 
		Score = 250 
	} 
} 
Trick_Beanplant = { 
	Scr = Boneless 
	Params = { 
		Name = #"Beanplant" 
		Anim = Beanplant 
		Score = 250 
	} 
} 
Trick_MikeVBoneless = { 
	Scr = Boneless 
	Params = { 
		Name = #"MikeVplant" 
		Anim = _540Boneless 
		Score = 250 
	} 
} 
GroundTricks = 
[ 
	{ 
		Trigger = { TripleInOrder , a = Down , b = Down , R2 , 400 } 
		Scr = ToggleSwitchRegular 
		Params = { PowerSlide } 
	} 
	{ 
		Trigger = { PressAndRelease , Up , X , 300 } 
		Trick_NoComply 
	} 
	{ } 
	{ } 
	{ 
		Trigger = { Press , R2 , 20 } 
		Scr = ToggleSwitchRegular 
	} 
] 
WalkToSkateTransition_GroundTricks = 
[ 
	{ Trigger = { PressAndRelease , Up , X , 300 } Trick_NoComply } 
] 
NoTricks = [ ] 
Reverts = 
[ 
	{ Trigger = { Press , R2 , 200 } Scr = Revert } 
	{ Trigger = { Press , L2 , 200 } Scr = Revert } 
] 
LandPivot = 
[ 
	{ Trigger = { Press , R2 , 200 } Scr = Revert Params = { LandPivot } } 
] 
SCRIPT SetExtraTricks_Reverts duration = 40 
	IF ( ( GetGlobalFlag Flag = FLAG_EXPERT_MODE_NO_REVERTS ) | ( GetGlobalFlag Flag = FLAG_G_EXPERT_MODE_NO_REVERTS ) ) 
	ELSE 
		SetExtraTricks tricks = Reverts duration = <duration> 
	ENDIF 
ENDSCRIPT

SCRIPT Revert { 
		FSName = #"FS Revert" 
		BSName = #"BS Revert" 
		FSAnim = RevertFS 
		BSAnim = RevertBS 
	} 
	IF IsSkaterOnVehicle 
		goto vehicle_revert 
	ENDIF 
	IF IsOnMotoSkateboard 
		FSAnim = RevertFS 
		BSAnim = RevertBS 
	ENDIF 
	OnExitRun ExitRevert 
	InRevert 
	ClearLipCombos 
	KillExtraTricks 
	SetTrickScore 100 
	OnGroundExceptions NoEndRun 
	LaunchStateChangeEvent State = Skater_InRevert 
	ClearException Ollied 
	IF NOT GetGlobalFlag Flag = SERVER_CHEAT_NO_REVERT_SPEED_LOSS 
		SetSpecialFriction [ 0 , 0 , 5 , 10 , 15 , 25 ] duration = 0.66699999571 
	ENDIF 
	CanKickOff 
	SetQueueTricks SkateToWalkTricks 
	NollieOff 
	PressureOff 
	IF gotparam LandPivot 
		GetBoardTypeAndRevert type = manuallink 
		PlayAnim Anim = Gturn 
		IF Inair 
			SetTrickName #"Bunny Hop Revert" 
		ELSE 
			SetTrickName #"Land Pivot" 
		ENDIF 
		Obj_SetFlag FLAG_SKATER_IN_LAND_PIVOT 
	ELSE 
		GetBoardTypeAndRevert type = Revert 
		IF Inair 
			FSName = #"Bunny Hop Revert" 
			BSName = #"Bunny Hop Revert" 
		ENDIF 
		IF Obj_FlagSet FLAG_SKATER_REVERTFS 
			Obj_ClearFlag FLAG_SKATER_REVERTFS 
			PlayAnim Anim = <FSAnim> 
			SetTrickName <FSName> 
		ELSE 
			IF Obj_FlagSet FLAG_SKATER_REVERTBS 
				Obj_ClearFlag FLAG_SKATER_REVERTBS 
				PlayAnim Anim = <BSAnim> 
				SetTrickName <BSName> 
			ELSE 
				IF LastSpinWas Frontside 
					PlayAnim Anim = <FSAnim> 
					SetTrickName <FSName> 
				ELSE 
					PlayAnim Anim = <BSAnim> 
					SetTrickName <BSName> 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	SetSkaterAirManualTricks 
	display Blockspin 
	IF NOT IsOnMotoSkateboard 
		FlipAfter 
		BoardRotateafter 
	ENDIF 
	wait 0.10000000149 seconds 
	SetException Ex = Ollied Scr = Ollie 
	IF NOT gotparam LandPivot 
		ResetLandedFromVert 
	ENDIF 
	WaitAnim 100 Percent 
	CanKickOn 
	IF gotparam LandPivot 
		PlayAnim Anim = manual_range From = middle BlendPeriod = 0.00000000000 
		DoNextManualTrick SkipInitAnim LandPivotManual 
	ELSE 
		DoNextManualTrick FromAir 
	ENDIF 
	DoNextTrick 
	OnGroundExceptions 
	LandSkaterTricks 
	ClearEventBuffer 
	IF gotparam LandPivot 
		PlayAnim Anim = PutDownManual BlendPeriod = 0.30000001192 speed = 2.50000000000 
		Obj_ClearFlag FLAG_SKATER_IN_LAND_PIVOT 
	ELSE 
		IF NOT Held X 
			PlayAnim Anim = CrouchIdleToIdle BlendPeriod = 0.00000000000 speed = 0.69999998808 
		ELSE 
			PlayAnim Anim = crouchidle BlendPeriod = 0.00000000000 From = 0 To = 0.30000001192 seconds 
			BlendPeriodOut 0.30000001192 
		ENDIF 
	ENDIF 
	WaitAnimWhilstChecking AndManuals 
	goto OnGroundAI 
ENDSCRIPT

SCRIPT ExitRevert 
	OutRevert 
	CanKickOn 
	IF IsTrue AlreadyEndedRun 
		goto SlowSkaterToStop 
	ENDIF 
ENDSCRIPT

backside = 0 
SCRIPT ToggleSwitchRegular 
	IF IsOnMotoSkateboard 
		goto OnGroundAI 
	ENDIF 
	LandSkaterTricks DontKillFocus 
	OnGroundExceptions 
	SetQueueTricks NoTricks 
	ClearTrickQueues 
	IF NOT GoalManager_GoalShouldExpire 
		SetException Ex = Ollied Scr = Ollie Params = { NoDoNextTrick } 
	ENDIF 
	NollieOff 
	IF gotparam PowerSlide 
		GetBoardTypeAndRevert type = ToggleSwitchRegular 
		IF gotparam Fancy 
			IF LeftPressed 
				Rotate y = 180 duration = 0.30000001192 seconds 
				IF Flipped 
					PlayAnim Anim = FSPowerslide 
				ELSE 
					PlayAnim Anim = BSPowerslide 
				ENDIF 
			ELSE 
				IF RightPressed 
					Rotate y = -180 duration = 0.30000001192 seconds 
					IF Flipped 
						PlayAnim Anim = BSPowerslide 
					ELSE 
						PlayAnim Anim = FSPowerslide 
					ENDIF 
				ELSE 
					RETURN 
				ENDIF 
			ENDIF 
		ELSE 
			Rotate y = 180 duration = 0.30000001192 seconds 
			PlayAnim Anim = FSPowerslide 
			IF LeftPressed 
				IF Flipped 
					PlayAnim Anim = FSPowerslide 
				ELSE 
					PlayAnim Anim = BSPowerslide 
				ENDIF 
			ELSE 
				IF RightPressed 
					IF Flipped 
						PlayAnim Anim = BSPowerslide 
					ELSE 
						PlayAnim Anim = FSPowerslide 
					ENDIF 
				ELSE 
					PlayAnim Anim = FSPowerslide 
				ENDIF 
			ENDIF 
		ENDIF 
	ELSE 
		IF LeftPressed 
			IF Flipped 
				IF NOT crouched 
					PlayAnim RANDOM(1, 1) RANDOMCASE Anim = CessSlide180_FS RANDOMCASE Anim = CessSlide180_FS2 RANDOMEND 
				ELSE 
					PlayAnim Anim = CrouchCessSlide180_FS 
				ENDIF 
			ELSE 
				IF NOT crouched 
					PlayAnim Anim = CessSlide180_BS 
				ELSE 
					backside = 1 
					PlayAnim Anim = CrouchCessSlide180_BS 
				ENDIF 
			ENDIF 
		ELSE 
			IF RightPressed 
				IF Flipped 
					IF NOT crouched 
						PlayAnim Anim = CessSlide180_BS 
					ELSE 
						backside = 1 
						PlayAnim Anim = CrouchCessSlide180_BS 
					ENDIF 
				ELSE 
					IF NOT crouched 
						PlayAnim RANDOM(1, 1) RANDOMCASE Anim = CessSlide180_FS RANDOMCASE Anim = CessSlide180_FS2 RANDOMEND 
					ELSE 
						PlayAnim Anim = CrouchCessSlide180_FS 
					ENDIF 
				ENDIF 
			ELSE 
				IF NOT crouched 
					PlayAnim RANDOM(1, 1) RANDOMCASE Anim = CessSlide180_FS RANDOMCASE Anim = CessSlide180_FS2 RANDOMEND 
				ELSE 
					PlayAnim Anim = CrouchCessSlide180_FS 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	SetSkaterGroundTricks 
	IF NOT gotparam PowerSlide 
		GetSpeed 
		IF ( <speed> > 300 ) 
			GetBoardTypeAndRevert type = ToggleSwitchRegular 
			WaitAnim 30 Percent 
			IF crouched 
				IF Held R2 
					GetSpeed 
					SkipIdleAnim = 1 
					start_speed = <speed> 
					IF gotparam backside 
						init = bs_powerslide_init 
						idle = bs_powerslide_idle 
						out = bs_powerslide_out 
						out2 = bs_powerslide_180_out 
					ELSE 
						init = fs_powerslide_init 
						idle = fs_powerslide_idle 
						out = fs_powerslide_out 
						out2 = fs_powerslide_180_out 
					ENDIF 
					PlayAnim Anim = <init> 
					LockVelocityDirection On 
					EnterPowerslide 
					OnExitRun UnLockVelocityDirection 
					count = 0 
					IF NOT ( <start_speed> < 100 ) 
						BEGIN 
							IF NOT Released R2 
								wait 1 frame 
								GetSpeed 
								IF AnimFinished 
									SetRollingFriction 25 
									PlayAnim Anim = <idle> cycle 
								ENDIF 
								IF NOT gotparam is_using_hoverboard 
									IF NOT ( <speed> = 0 ) 
										CessTrail repeat_times = 1 
									ENDIF 
								ENDIF 
								IF ( <speed> < 100 ) 
									BREAK 
								ENDIF 
								<count> = ( <count> + 1 ) 
							ELSE 
								wait 3 frame 
								BREAK 
							ENDIF 
						REPEAT 
					ENDIF 
					ExitPowerslide 
					Obj_StopSound RevertConc 
					IF ( <count> > 15 ) 
						PlayAnim Anim = <out> blend = 0.10000000149 
						Obj_WaitanimFinished 
						goto OnGroundAI 
					ELSE 
						UnLockVelocityDirection 
						PlayAnim Anim = <out2> 
					ENDIF 
				ENDIF 
				SkipIdleAnim = 1 
			ENDIF 
		ELSE 
			IF ( <speed> < 300 ) 
				PlayAnim Anim = FiftyFiftySwitcheroo_Idle To = 25 
				HopSwitch = 1 
				SkipIdleAnim = 1 
			ENDIF 
		ENDIF 
	ENDIF 
	SetSkaterGroundTricks 
	FlipAfter 
	IF NOT gotparam HopSwitch 
		BoardRotateafter 
		BlendPeriodOut 0.00000000000 
	ENDIF 
	WaitAnim 90 Percent 
	WaitAnimWhilstChecking AndManuals 
	IF NOT gotparam PowerSlide 
		IF CanKick 
		ELSE 
			IF AnimFinished 
				IF NOT gotparam SkipIdleAnim 
					PlayAnim Anim = idle BlendPeriod = 0.00000000000 From = 0 To = 1 
					Obj_WaitanimFinished 
					IF Held X 
						PlayAnim Anim = crouch 
						Obj_WaitanimFinished 
					ENDIF 
				ELSE 
					IF crouched 
						PlayAnim Anim = crouchidle BlendPeriod = 0.20000000298 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
	ELSE 
		PlayAnim Anim = crouchidle BlendPeriod = 0.00000000000 
	ENDIF 
	ClearTrickQueue 
	goto OnGroundAI 
ENDSCRIPT

SCRIPT UnLockVelocityDirection 
	LockVelocityDirection off 
	ExitPowerslide 
	SetRollingFriction default 
ENDSCRIPT

SCRIPT CessTrail repeat_times = 20 
	IF SpeedGreaterThan 200 
		IF gotparam delay 
			wait <delay> frames 
		ENDIF 
		BEGIN 
			IF NOT onground 
				BREAK 
			ELSE 
				IF IsXbox 
					TextureSplat size = 6 radius = 0 bone = Bone_Board_Tail Name = skidtrail trail lifetime = 15 
					TextureSplat size = 6 radius = 0 bone = Bone_Board_Nose Name = skidtrail trail lifetime = 15 
				ELSE 
					TextureSplat size = 6 radius = 0 bone = Bone_Board_Tail Name = skidtrail_ps2 trail lifetime = 15 
					TextureSplat size = 6 radius = 0 bone = Bone_Board_Nose Name = skidtrail_ps2 trail lifetime = 15 
				ENDIF 
			ENDIF 
			wait 1 game frame 
		REPEAT <repeat_times> 
	ENDIF 
ENDSCRIPT

SCRIPT ToggleNollieRegular 
	OnGroundExceptions 
	ClearTrickQueues 
	ApplyStanceToggle nollie = <nollie> 
	IF NOT InNollie 
		IF NOT InPressure 
			IF NOT GoalManager_GoalShouldExpire 
				SetException Ex = Ollied Scr = Ollie 
			ENDIF 
			IF crouched 
				PlayAnim Anim = CrouchToNollie BlendPeriod = 0.10000000149 Backwards 
			ELSE 
				PlayAnim Anim = SkatingToNollie BlendPeriod = 0.10000000149 Backwards 
			ENDIF 
		ELSE 
			IF NOT GoalManager_GoalShouldExpire 
				SetException Ex = Ollied Scr = Ollie 
			ENDIF 
			IF crouched 
				PlayAnim Anim = CrouchToPressure BlendPeriod = 0.10000000149 
			ELSE 
				PlayAnim Anim = SkateToPressure BlendPeriod = 0.10000000149 
			ENDIF 
		ENDIF 
	ELSE 
		IF NOT GoalManager_GoalShouldExpire 
			SetException Ex = Ollied Scr = nollie 
		ENDIF 
		IF crouched 
			PlayAnim Anim = CrouchToNollie BlendPeriod = 0.10000000149 
		ELSE 
			PlayAnim Anim = SkatingToNollie BlendPeriod = 0.10000000149 
		ENDIF 
	ENDIF 
	WaitAnimWhilstChecking AndManuals 
	IF InNollie 
		goto OnGroundNollieAI 
	ELSE 
		goto OnGroundAI 
	ENDIF 
ENDSCRIPT

SCRIPT ApplyStanceToggle 
	IF ( PressureStanceMode = 1 ) 
		IF InNollie 
			IF gotparam nollie 
				PressureOff 
				NollieOff 
			ENDIF 
		ELSE 
			IF gotparam nollie 
				PressureOff 
				NollieOn 
			ELSE 
				NollieOff 
				PressureOn 
			ENDIF 
		ENDIF 
	ELSE 
		IF InNollie 
			PressureOff 
			NollieOff 
		ELSE 
			IF InPressure 
				PressureOff 
				NollieOn 
			ELSE 
				NollieOff 
				PressureOn 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT nollie 
	IF gotparam NoDoNextTrick 
	ELSE 
		DoNextTrick 
	ENDIF 
	ClearTrickQueue 
	ClearEventBuffer Buttons = Dpad OlderThan = TRICK_PRELOAD_TIME 
	Jump 
	InAirExceptions 
	Vibrate Actuator = 1 Percent = 50 duration = 0.05000000075 
	NollieOn 
	PlayAnim Anim = nollie BlendPeriod = 0.10000000149 
	IF ProfileEquals stance = regular 
		IF Flipped 
			SetTrickName #"Nollie" 
			SetTrickScore 200 
		ELSE 
			SetTrickName #"Fakie Ollie" 
			SetTrickScore 200 
		ENDIF 
	ELSE 
		IF Flipped 
			SetTrickName #"Fakie Ollie" 
			SetTrickScore 200 
		ELSE 
			SetTrickName #"Nollie" 
			SetTrickScore 200 
		ENDIF 
	ENDIF 
	display 
	HighOllieCheck 
	BailOff 
	WaitAnimWhilstChecking 
	goto AirBorne 
ENDSCRIPT

SCRIPT NollieNoDisplay OutSpeed = 1 
	StopBalanceTrick 
	ClearTrickQueue 
	ClearEventBuffer Buttons = Dpad OlderThan = TRICK_PRELOAD_TIME 
	SetTrickName #"Nollie" 
	SetTrickScore 100 
	display Deferred 
	Jump 
	InAirExceptions 
	Vibrate Actuator = 1 Percent = 80 duration = 0.05000000075 
	NollieOn 
	IF gotparam OutAnim 
		PlayAnim Anim = <OutAnim> BlendPeriod = 0.30000001192 speed = <OutSpeed> 
	ELSE 
		PlayAnim Anim = nollie BlendPeriod = 0.10000000149 
	ENDIF 
	IF gotparam BoardRotate 
		BlendPeriodOut 0 
		BoardRotateafter 
	ENDIF 
	HighOllieCheck 
	BailOff 
	WaitAnimWhilstChecking 
	goto AirBorne 
ENDSCRIPT

Dpad = [ Up Down left right Upright UpLeft DownRight DownLeft ] 
SCRIPT Ollie OutSpeed = 1 
	StopBalanceTrick 
	StopSkitch 
	IF gotparam NoDoNextTrick 
	ELSE 
		DoNextTrick 
	ENDIF 
	ClearTrickQueue 
	ClearEventBuffer Buttons = Dpad OlderThan = TRICK_PRELOAD_TIME 
	ClearEventBuffer Buttons = [ X ] OlderThan = 0 
	IF NOT gotparam JumpSpeed 
		Jump 
	ELSE 
		IF gotparam FromWallplant 
			Jump no_sound speed = <JumpSpeed> 
			IF ( ( GLOBAL_TP_GroundTerrainSFX ) = Classic ) 
				Obj_Playsound OllieConc19 
			ELSE 
				Obj_Playsound OllieConc19_THAW 
			ENDIF 
		ELSE 
			Jump speed = <JumpSpeed> 
		ENDIF 
	ENDIF 
	InAirExceptions 
	IF InPressure 
		SetTrickName #"Pressure" 
		SetTrickScore 200 
		display 
	ENDIF 
	IF InNollie 
		IF ProfileEquals stance = regular 
			IF Flipped 
				SetTrickName #"Nollie" 
				SetTrickScore 200 
			ELSE 
				SetTrickName #"Fakie Ollie" 
				SetTrickScore 200 
			ENDIF 
		ELSE 
			IF Flipped 
				SetTrickName #"Fakie Ollie" 
				SetTrickScore 200 
			ELSE 
				SetTrickName #"Nollie" 
				SetTrickScore 200 
			ENDIF 
		ENDIF 
		display 
	ELSE 
		IF NOT gotparam FromWallplant 
			SetTrickName #"Ollie" 
			SetTrickScore 75 
			display Deferred 
		ENDIF 
	ENDIF 
	Vibrate Actuator = 1 Percent = 50 duration = 0.05000000075 
	IF gotparam FromLip 
		printf "came from lip==================" 
		PlayAnim Anim = <OutAnim> BlendPeriod = 0.00000000000 
		BlendPeriodOut 0 
	ELSE 
		IF gotparam OutAnim 
			IF gotparam SyncOutAnimToPreviousAnim 
				PlayAnim Anim = <OutAnim> BlendPeriod = 0.30000001192 speed = <OutSpeed> SyncToPreviousAnim 
			ELSE 
				IF gotparam NoBlend 
					PlayAnim Anim = <OutAnim> BlendPeriod = 0.00000000000 speed = <OutSpeed> 
				ELSE 
					PlayAnim Anim = <OutAnim> BlendPeriod = 0.30000001192 speed = <OutSpeed> 
				ENDIF 
			ENDIF 
		ELSE 
			IF InNollie 
				PlayAnim Anim = nollie BlendPeriod = 0.10000000149 
			ELSE 
				PlayAnim Anim = Ollie BlendPeriod = 0.00000000000 NoRestart 
			ENDIF 
		ENDIF 
	ENDIF 
	IF gotparam BoardRotate 
		BlendPeriodOut 0 
		BoardRotateafter 
	ENDIF 
	IF gotparam RotateAfter 
		RotateAfter 
	ENDIF 
	IF gotparam FlipAfter 
		printf "=========flipping the skater in Ollie" 
		FlipAfter 
	ENDIF 
	IF gotparam NoBlend 
		BlendPeriodOut 0 
	ENDIF 
	IF gotparam WaitOnOlliePercent 
		BailOn 
		WaitAnim <WaitOnOlliePercent> Percent 
	ENDIF 
	HighOllieCheck 
	BailOff 
	WaitAnimWhilstChecking 
	goto AirBorne 
ENDSCRIPT

SCRIPT HighOllieCheck 
	IF GetGlobalFlag Flag = SERVER_CHEAT_DISABLE_HIGH_OLLIE 
		RETURN 
	ENDIF 
	IF ( enable_high_ollies = 0 ) 
		RETURN 
	ENDIF 
	GetTags 
	IF ( <InHighOllie> = 1 ) 
		RETURN 
	ENDIF 
	SetException Ex = HighOllie Scr = HighOllie 
	HighOllieCheckSetFrames frames = 10 
ENDSCRIPT

SCRIPT EnterHighOllie 
	SetTags InHighOllie = 1 
	ClearException HighOllie 
ENDSCRIPT

SCRIPT ExitHighOllie 
	SetTags InHighOllie = 0 
	ClearException HighOllie 
	RemoveTags Tags = [ InHighOllie ] 
ENDSCRIPT

SCRIPT HighOllie 
	LaunchStateChangeEvent State = Skater_InAir 
	InAirExceptions 
	EnterHighOllie 
	OnExitRun ExitHighOllie 
	Jump no_sound speed = 100 
	PlayAnim Anim = THPS7_OllieEx_Out speed = 1.50000000000 Backwards 
	Obj_WaitanimFinished 
	SetTrickName "Boned Ollie" 
	SetTrickScore 50 
	display 
	BEGIN 
		IF NOT Held X 
			BREAK 
		ENDIF 
		PlayAnim Anim = THPS7_OllieEx_Idle cycle NoRestart 
		DoNextTrick 
		TweakTrick 10 
		wait 1 GameFrame 
	REPEAT 
	ExitHighOllie 
	OnExitRun 
	PlayAnim Anim = THPS7_OllieEx_Out speed = 1.50000000000 
	WaitAnimWhilstChecking 
	goto AirBorne 
ENDSCRIPT

SCRIPT NoComply { 
		Anim = NoComply 
	} 
	ClearTrickQueue 
	ClearEventBuffer Buttons = Dpad OlderThan = TRICK_PRELOAD_TIME 
	Jump 
	NollieOff 
	PressureOff 
	InAirExceptions 
	Vibrate Actuator = 1 Percent = 80 duration = 0.05000000075 
	SetTrickName <Name> 
	SetTrickScore <Score> 
	display 
	BailOff 
	PlayAnim Anim = <Anim> BlendPeriod = 0.20000000298 
	WaitAnimWhilstChecking 
	goto AirBorne 
ENDSCRIPT

SCRIPT Beanplant 
	ClearTrickQueue 
	ClearEventBuffer Buttons = Dpad OlderThan = TRICK_PRELOAD_TIME 
	Jump BonelessHeight 
	InAirExceptions 
	Vibrate Actuator = 1 Percent = 80 duration = 0.10000000149 
	PlaySound boneless09 pitch = 85 
	SetTrickName <Name> 
	SetTrickScore <Score> 
	display 
	PlayAnim Anim = Beanplant BlendPeriod = 0.20000000298 
	WaitAnimWhilstChecking 
	goto AirBorne 
ENDSCRIPT

SCRIPT Fastplant 
	ClearTrickQueue 
	ClearEventBuffer Buttons = Dpad OlderThan = TRICK_PRELOAD_TIME 
	Jump BonelessHeight 
	InAirExceptions 
	Vibrate Actuator = 1 Percent = 80 duration = 0.10000000149 
	SetTrickName <Name> 
	SetTrickScore <Score> 
	display 
	PlayAnim Anim = Fastplant BlendPeriod = 0.20000000298 
	BailOff 
	WaitAnimWhilstChecking 
	goto AirBorne 
ENDSCRIPT

SCRIPT Boneless Anim = Boneless Name = "Boneless" Score = 250 
	ClearTrickQueue 
	ClearEventBuffer Buttons = Dpad OlderThan = TRICK_PRELOAD_TIME 
	Jump BonelessHeight 
	NollieOff 
	PressureOff 
	InAirExceptions 
	Vibrate Actuator = 1 Percent = 80 duration = 0.10000000149 
	PlaySound boneless09 pitch = 85 
	SetTrickName <Name> 
	SetTrickScore <Score> 
	IF NOT ( <Anim> = _540Boneless ) 
		PlayAnim Anim = <Anim> BlendPeriod = 0.20000000298 
	ELSE 
		PlayAnim Anim = _540Boneless BlendPeriod = 0.10000000149 speed = 1.25000000000 From = 10 
		SetTrickScore 300 
		SetTrickName "MikeV Boneless" 
		FlipAfter 
	ENDIF 
	display 
	BailOff 
	WaitAnimWhilstChecking 
	goto AirBorne 
ENDSCRIPT

SCRIPT SendTauntMessage 
	SWITCH <string_id> 
		CASE no_way_string 
			IF NOT GetRegKeyValue { key = "Taunt1" type = String } 
				RETURN 
			ENDIF 
		CASE your_daddy_string 
			IF NOT GetRegKeyValue { key = "Taunt2" type = String } 
				RETURN 
			ENDIF 
		CASE props_string 
			IF NOT GetRegKeyValue { key = "Taunt3" type = String } 
				RETURN 
			ENDIF 
		CASE get_some_string 
			IF NOT GetRegKeyValue { key = "Taunt4" type = String } 
				RETURN 
			ENDIF 
		DEFAULT 
			printf "dafuq? no taunt?" 
			RETURN 
	ENDSWITCH 
	THUGPRO_StrLen String = <value> 
	IF ( ( <length> ) < 76 ) 
		SendChatMessage String = <value> 
	ENDIF 
ENDSCRIPT

SCRIPT Taunt 
	LandSkaterTricks 
	ClearException Ollied 
	PlayAnim Anim = <Anim> BlendPeriod = 0.30000001192 
	IF inNetGame 
		SendTauntMessage string_id = <string_id> 
	ENDIF 
	wait 10 game frame 
	OnGroundExceptions 
	IF SpeedLessThan 1 
		SetRollingFriction 100 
		WaitAnimWhilstChecking AndManuals 
		goto Handbrake 
	ELSE 
		WaitAnimWhilstChecking AndManuals 
		goto OnGroundAI 
	ENDIF 
ENDSCRIPT

SCRIPT Props 
	LandSkaterTricks 
	OnGroundExceptions 
	PlayAnim RANDOM(1, 1) RANDOMCASE Anim = Prop RANDOMCASE Anim = Cheer1 RANDOMEND BlendPeriod = 0.30000001192 
	IF inNetGame 
		SendTauntMessage string_id = <string_id> 
	ENDIF 
	IF SpeedLessThan 1 
		SetRollingFriction 100 
		WaitAnimWhilstChecking AndManuals 
		goto Handbrake 
	ELSE 
		WaitAnimWhilstChecking AndManuals 
		goto OnGroundAI 
	ENDIF 
ENDSCRIPT

SkitchExceptionTable = [ 
	{ Event Ex = MadeOtherSkaterBail Scr = MadeOtherSkaterBail_Called } 
	{ Exception Ex = OffMeterTop Scr = SkitchOut } 
	{ Exception Ex = OffMeterBottom Scr = SkitchOut } 
	{ Exception Ex = CarBail Scr = CarBail } 
	{ Exception Ex = SkaterCollideBail Scr = SkaterCollideBail } 
] 
SCRIPT Skitch 
	StopBalanceTrick 
	ResetLandedFromVert 
	ResetLandingFromBankDrop 
	KillExtraTricks 
	IF CancelRotateDisplayandUpdateMatrix 
		change flip_backwards_dont_blend = 1 
	ENDIF 
	OnExceptionRun 
	ResetEventHandlersFromTable SkitchExceptionTable 
	SetException Ex = Ollied Scr = Ollie Params = { <...> } 
	LaunchStateChangeEvent State = Skater_Skitching 
	ClearTrickQueue 
	SetQueueTricks NoTricks 
	ClearManualTrick 
	SetManualTricks NoTricks 
	StartSkitch 
	StartBalanceTrick 
	PlayAnim Anim = SkitchInit 
	Obj_WaitanimFinished 
	change flip_backwards_dont_blend = 0 
	PlaySound Hud_jumpgap 
	SetTrickName "\\ceSkitchin\\C0" 
	SetTrickScore 500 
	display Blockspin 
	DoBalanceTrick ButtonA = right ButtonB = left type = Skitch Tweak = 5 
	PlayAnim Anim = SkitchRange wobble 
	SetEventHandler Ex = SkitchLeft Scr = SkitchAnimLeft 
	SetEventHandler Ex = SkitchRight Scr = SkitchAnimRight 
	BEGIN 
		overridelimits max = 1750 friction = 0 time = 5 gravity = 0 
		IF AnimFinished 
			PlayAnim Anim = SkitchRange wobble NoRestart 
		ENDIF 
		IF Held Down 
			Obj_SpawnScript NoBrake_Timer 
			goto SkitchOut 
		ENDIF 
		Waitonegameframe 
	REPEAT 
ENDSCRIPT

SCRIPT SkitchAnimLeft 
	PlayAnim Anim = SkitchMoveLeft From = 20 NoRestart speed = 2 BlendPeriod = 0.10000000149 
ENDSCRIPT

SCRIPT SkitchAnimRight 
	PlayAnim Anim = SkitchMoveRight From = 20 NoRestart speed = 2 BlendPeriod = 0.10000000149 
ENDSCRIPT

SCRIPT SkitchOut 
	StopSkitch 
	StopBalanceTrick 
	PlayAnim Anim = SkitchInit Backwards 
	OnGroundExceptions 
	ClearException Skitched 
	LandSkaterTricks 
	Obj_WaitanimFinished 
	goto OnGroundAI 
ENDSCRIPT

SCRIPT NoBrake_Timer 
	CanBrakeOff 
	wait 0.50000000000 seconds 
	CanBrakeOn 
ENDSCRIPT


