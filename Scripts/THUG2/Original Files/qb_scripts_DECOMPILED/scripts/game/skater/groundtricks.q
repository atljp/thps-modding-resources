
TRICK_PRELOAD_TIME = 160 
Jumptricks0 = 
[ { Trigger = { PressAndRelease , Up , X , 300 } Scr = NoComply Params = { Name = #"No Comply" Score = 100 } } ] 
Jumptricks = 
[ { Trigger = { TapTwiceRelease , Up , X , 500 } TrickSlot = JumpSlot } ] 
Trick_Boneless = { Scr = Boneless Params = { Name = #"Boneless" Anim = Boneless Score = 250 } } 
Trick_Fastplant = { Scr = Boneless Params = { Name = #"Fastplant" Anim = Fastplant Score = 250 } } 
Trick_Beanplant = { Scr = Boneless Params = { Name = #"Beanplant" Anim = Beanplant Score = 250 } } 
GroundTricks = 
[ 
	{ Trigger = { TripleInOrder , a = Down , b = Down , R1 , 500 } Scr = ToggleSwitchRegular Params = { PowerSlide } } 
	{ Trigger = { PressAndRelease , Up , X , 300 } Scr = NoComply Params = { Name = #"No Comply" Score = 100 } } 
	{ Trigger = { TripleInOrder , a = L1 , b = L1 , Triangle , 500 } Scr = Props Params = { string_id = props_string } } 
	{ Trigger = { TripleInOrder , a = L1 , b = L1 , Square , 500 } Scr = Taunt Params = { Anim = Taunt1 string_id = your_daddy_string } } 
	{ Trigger = { TripleInOrder , a = L1 , b = L1 , Circle , 500 } Scr = Taunt Params = { Anim = Taunt2 string_id = no_way_string } } 
	{ Trigger = { TripleInOrder , a = L1 , b = L1 , X , 500 } Scr = Taunt Params = { Anim = Taunt3 string_id = get_some_string } } 
	{ Trigger = { Press , L2 , 20 } Scr = ToggleNollieRegular NGC_Trigger = { TripleInOrderSloppy , a = left , b = right , R1 , 400 } } 
	{ Trigger = { Release , L2 , 20 } Scr = ToggleNollieRegular NGC_Trigger = { TripleInOrderSloppy , a = Up , b = Up , R1 , 400 } Params = { Nollie = 1 } } 
	{ Trigger = { Press , R2 , 20 } Scr = ToggleSwitchRegular NGC_Trigger = { Press , R1 , 20 } } 
] 
WalkToSkateTransition_GroundTricks = 
[ 
	{ Trigger = { PressAndRelease , Up , X , 300 } Scr = NoComply Params = { Name = #"No Comply" Score = 100 } } 
] 
NoTricks = 
[ 
] 
Reverts = 
[ 
	{ Trigger = { Press , R2 , 200 } TrickSlot = ExtraSlot1 NGC_Trigger = { Press , R1 , 200 } } 
	{ Trigger = { Press , L2 , 200 } TrickSlot = ExtraSlot2 NGC_Trigger = { Press , L1 , 200 } } 
] 
SCRIPT SetExtraTricks_Reverts duration = 20 
	IF NOT GetGlobalFlag flag = FLAG_EXPERT_MODE_NO_REVERTS 
		IF NOT ( ( inNetGame ) & ( GetGlobalFlag flag = FLAG_G_EXPERT_MODE_NO_REVERTS ) ) 
			SetExtraTricks tricks = Reverts duration = <duration> 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT Revert FSName = #"FS Revert" BSName = #"BS Revert" FSAnim = RevertFS BSAnim = RevertBS 
	IF IsSkaterOnVehicle 
		Goto vehicle_revert 
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
	IF NOT GetGlobalFlag flag = CHEAT_HOVERBOARD 
		Obj_SpawnScript CessTrail Params = { repeat_times = 10 } 
		PlayCessSound 
		Vibrate Actuator = 0 Percent = 80 duration = 0.50000000000 
		Vibrate Actuator = 1 Percent = 80 duration = 0.10000000149 
	ENDIF 
	ClearException Ollied 
	SetSpecialFriction [ 0 , 0 , 5 , 10 , 15 , 25 ] duration = 0.66699999571 
	CanKickOff 
	SetQueueTricks SkateToWalkTricks 
	SetSkaterAirManualTricks 
	NollieOff 
	PressureOff 
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
	Display Blockspin 
	IF NOT IsOnMotoSkateboard 
		FlipAfter 
		BoardRotateAfter 
	ENDIF 
	BlendPeriodOut 0.00000000000 
	Wait 0.10000000149 seconds 
	SetException Ex = Ollied Scr = Ollie 
	ResetLandedFromVert 
	Obj_WaitAnimFinished 
	CanKickOn 
	DoNextManualTrick FromAir 
	DoNextTrick 
	OnGroundExceptions 
	LandSkaterTricks 
	ClearEventBuffer 
	PlayAnim Anim = CrouchIdle BlendPeriod = 0.30000001192 
	WaitAnimWhilstChecking AndManuals 
	Goto OnGroundAI 
ENDSCRIPT

SCRIPT ExitRevert 
	OutRevert 
	CanKickOn 
	SetTrickName #"" 
	SetTrickScore 0 
	Display Blockspin 
ENDSCRIPT

SCRIPT ToggleSwitchRegular 
	IF IsOnMotoSkateboard 
		Goto OnGroundAI 
	ENDIF 
	OnGroundExceptions 
	SetQueueTricks NoTricks 
	ClearTrickQueues 
	GetSpeed 
	start_speed = <speed> 
	IF NOT GoalManager_GoalShouldExpire 
		SetException Ex = Ollied Scr = Ollie Params = { NoDoNextTrick } 
	ENDIF 
	PressureOff 
	NollieOff 
	IF NOT GetGlobalFlag flag = CHEAT_HOVERBOARD 
		Obj_SpawnScript CessTrail Params = { delay = 3 } 
		Vibrate Actuator = 0 Percent = 80 duration = 0.50000000000 
		Vibrate Actuator = 1 Percent = 80 duration = 0.10000000149 
	ENDIF 
	LandSkaterTricks DontKillFocus 
	IF GotParam PowerSlide 
		Rotate y = 180 duration = 0.30000001192 seconds 
		IF LeftPressed 
			IF Flipped 
				slide_anim = FSPowerslide 
			ELSE 
				slide_anim = BSPowerslide 
			ENDIF 
		ELSE 
			IF RightPressed 
				IF Flipped 
					slide_anim = BSPowerslide 
				ELSE 
					slide_anim = FSPowerslide 
				ENDIF 
			ELSE 
				slide_anim = FSPowerslide 
			ENDIF 
		ENDIF 
	ELSE 
		IF LeftPressed 
			IF Flipped 
				IF NOT crouched 
					slide_anim = RANDOM(1, 1) RANDOMCASE CessSlide180_FS RANDOMCASE CessSlide180_FS2 RANDOMEND 
				ENDIF 
			ELSE 
				backside = 1 
				IF NOT crouched 
					slide_anim = CessSlide180_BS 
				ENDIF 
			ENDIF 
		ELSE 
			IF RightPressed 
				IF Flipped 
					backside = 1 
					IF NOT crouched 
						slide_anim = CessSlide180_BS 
					ENDIF 
				ELSE 
					IF NOT crouched 
						slide_anim = RANDOM(1, 1) RANDOMCASE CessSlide180_FS RANDOMCASE CessSlide180_FS2 RANDOMEND 
					ENDIF 
				ENDIF 
			ELSE 
				IF NOT crouched 
					slide_anim = RANDOM(1, 1) RANDOMCASE CessSlide180_FS RANDOMCASE CessSlide180_FS2 RANDOMEND 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	IF NOT GotParam slide_anim 
		IF GotParam backside 
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
	ENDIF 
	IF GotParam PowerSlide 
		PlayAnim Anim = <slide_anim> 
	ELSE 
		IF NOT crouched 
			PlayAnim Anim = <slide_anim> 
		ELSE 
			PlayAnim Anim = <init> 
			LockVelocityDirection On 
			EnterPowerslide 
			OnExitRun UnLockVelocityDirection 
			count = 0 
			IF NOT ( <start_speed> < 100 ) 
				BEGIN 
					button_held = 0 
					IF isNGC 
						IF Held R1 
							button_held = 1 
						ENDIF 
					ELSE 
						IF Held R2 
							button_held = 1 
						ENDIF 
					ENDIF 
					IF ( <button_held> = 1 ) 
						Wait 1 frame 
						GetSpeed 
						IF AnimFinished 
							SetRollingFriction 25 
							PlayAnim Anim = <idle> cycle 
						ENDIF 
						IF NOT ( <speed> = 0 ) 
							CessTrail repeat_times = 1 
						ENDIF 
						IF ( <speed> < 100 ) 
							BREAK 
						ENDIF 
						count = ( <count> + 1 ) 
					ELSE 
						BREAK 
					ENDIF 
				REPEAT 
			ENDIF 
			ExitPowerslide 
			Obj_StopSound RevertConc 
			Obj_StopSound RevertConc 
			IF ( <count> > 15 ) 
				PlayAnim Anim = <out> blend = 0.10000000149 
				Obj_WaitAnimFinished 
				Goto OnGroundAI 
			ELSE 
				UnLockVelocityDirection 
				PlayAnim Anim = <out2> 
			ENDIF 
		ENDIF 
	ENDIF 
	WaitAnim 30 Percent 
	IF NOT GetGlobalFlag flag = CHEAT_HOVERBOARD 
		PlayCessSound 
	ENDIF 
	WaitAnim 35 Percent 
	SetSkaterGroundTricks 
	FlipAfter 
	BoardRotateAfter 
	BlendPeriodOut 0.00000000000 
	WaitAnimWhilstChecking AndManuals 
	IF NOT GotParam PowerSlide 
		IF CanKick 
			PlayAnim Anim = PushCycle cycle BlendPeriod = 0.00000000000 
		ELSE 
			IF AnimFinished 
				IF NOT crouched 
					PlayAnim Anim = idle cycle BlendPeriod = 0.00000000000 
				ELSE 
					IF NOT AnimEquals [ CrouchCessSlide180_FS CrouchCessSlide180_BS ] 
						PlayAnim Anim = CrouchIdle cycle BlendPeriod = 0.20000000298 
					ELSE 
						PlayAnim Anim = CrouchIdle cycle BlendPeriod = 0.00000000000 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
	ELSE 
		PlayAnim Anim = CrouchIdle cycle BlendPeriod = 0.00000000000 
	ENDIF 
	ClearTrickQueue 
	Goto OnGroundAI 
ENDSCRIPT

SCRIPT UnLockVelocityDirection 
	LockVelocityDirection off 
	ExitPowerslide 
	SetRollingFriction default 
ENDSCRIPT

SCRIPT CessTrail repeat_times = 20 
	IF SpeedGreaterThan 200 
		IF GotParam delay 
			Wait <delay> frames 
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
			Wait 1 game frame 
		REPEAT <repeat_times> 
	ENDIF 
ENDSCRIPT

SCRIPT ToggleNollieRegular 
	OnGroundExceptions 
	ClearTrickQueues 
	ApplyStanceToggle Nollie = <Nollie> 
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
			SetException Ex = Ollied Scr = Nollie 
		ENDIF 
		IF crouched 
			PlayAnim Anim = CrouchToNollie BlendPeriod = 0.10000000149 
		ELSE 
			PlayAnim Anim = SkatingToNollie BlendPeriod = 0.10000000149 
		ENDIF 
	ENDIF 
	WaitAnimWhilstChecking AndManuals 
	IF InNollie 
		Goto OnGroundNollieAI 
	ELSE 
		Goto OnGroundAI 
	ENDIF 
ENDSCRIPT

SCRIPT ApplyStanceToggle 
	IF isNGC 
		IF GotParam Nollie 
			IF InNollie 
				NollieOff 
				PressureOff 
			ELSE 
				NollieOn 
				PressureOff 
			ENDIF 
		ELSE 
			IF InPressure 
				PressureOff 
				NollieOff 
			ELSE 
				PressureOn 
				NollieOff 
			ENDIF 
		ENDIF 
	ELSE 
		IF InNollie 
			IF GotParam Nollie 
				PressureOff 
				NollieOff 
			ENDIF 
		ELSE 
			IF GotParam Nollie 
				PressureOff 
				NollieOn 
			ELSE 
				NollieOff 
				PressureOn 
			ENDIF 
		ENDIF 
	ENDIF 
	IF onground 
		IF CurrentScorePotGreaterThan 0 
			LandSkaterTricks 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT Nollie 
	IF GotParam NoDoNextTrick 
	ELSE 
		DoNextTrick 
	ENDIF 
	ClearTrickQueue 
	ClearEventBuffer Buttons = Dpad OlderThan = TRICK_PRELOAD_TIME 
	Jump 
	InAirExceptions 
	Vibrate Actuator = 1 Percent = 50 duration = 0.05000000075 
	NollieOn 
	PlayAnim Anim = Nollie BlendPeriod = 0.10000000149 
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
	Display 
	BailOff 
	WaitAnimWhilstChecking 
	Goto Airborne 
ENDSCRIPT

SCRIPT NollieNoDisplay OutSpeed = 1 
	StopBalanceTrick 
	ClearTrickQueue 
	ClearEventBuffer Buttons = Dpad OlderThan = TRICK_PRELOAD_TIME 
	SetTrickName #"Nollie" 
	SetTrickScore 100 
	Display Deferred 
	Jump 
	InAirExceptions 
	Vibrate Actuator = 1 Percent = 80 duration = 0.05000000075 
	NollieOn 
	IF GotParam OutAnim 
		PlayAnim Anim = <OutAnim> BlendPeriod = 0.30000001192 speed = <OutSpeed> 
	ELSE 
		PlayAnim Anim = Nollie BlendPeriod = 0.10000000149 
	ENDIF 
	IF GotParam BoardRotate 
		BlendPeriodOut 0 
		BoardRotateAfter 
	ENDIF 
	BailOff 
	WaitAnimWhilstChecking 
	Goto Airborne 
ENDSCRIPT

Dpad = [ Up Down left right Upright UpLeft DownRight DownLeft ] 
SCRIPT Ollie OutSpeed = 1 
	StopBalanceTrick 
	StopSkitch 
	IF GotParam NoDoNextTrick 
	ELSE 
		DoNextTrick 
	ENDIF 
	ClearTrickQueue 
	ClearEventBuffer Buttons = Dpad OlderThan = TRICK_PRELOAD_TIME 
	ClearEventBuffer Buttons = [ X ] OlderThan = 0 
	IF NOT GotParam JumpSpeed 
		Jump 
	ELSE 
		Jump speed = <JumpSpeed> 
	ENDIF 
	InAirExceptions 
	IF InPressure 
		SetTrickName #"Pressure" 
		SetTrickScore 200 
		Display 
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
		Display 
	ELSE 
		SetTrickName #"Ollie" 
		SetTrickScore 75 
		Display Deferred 
	ENDIF 
	Vibrate Actuator = 1 Percent = 50 duration = 0.05000000075 
	IF GotParam FromLip 
		
		PlayAnim Anim = <OutAnim> BlendPeriod = 0.00000000000 
		BlendPeriodOut 0 
	ELSE 
		IF GotParam OutAnim 
			IF GotParam SyncOutAnimToPreviousAnim 
				PlayAnim Anim = <OutAnim> BlendPeriod = 0.30000001192 speed = <OutSpeed> SyncToPreviousAnim 
			ELSE 
				IF GotParam NoBlend 
					PlayAnim Anim = <OutAnim> BlendPeriod = 0.00000000000 speed = <OutSpeed> 
				ELSE 
					PlayAnim Anim = <OutAnim> BlendPeriod = 0.30000001192 speed = <OutSpeed> 
				ENDIF 
			ENDIF 
		ELSE 
			IF InNollie 
				PlayAnim Anim = Nollie BlendPeriod = 0.10000000149 
			ELSE 
				PlayAnim Anim = Ollie BlendPeriod = 0.00000000000 NoRestart 
			ENDIF 
		ENDIF 
	ENDIF 
	IF GotParam BoardRotate 
		BlendPeriodOut 0 
		BoardRotateAfter 
	ENDIF 
	IF GotParam RotateAfter 
		RotateAfter 
	ENDIF 
	IF GotParam FlipAfter 
		
		FlipAfter 
	ENDIF 
	IF GotParam NoBlend 
		BlendPeriodOut 0 
	ENDIF 
	IF GotParam WaitOnOlliePercent 
		BailOn 
		WaitAnim <WaitOnOlliePercent> Percent 
	ENDIF 
	BailOff 
	WaitAnimWhilstChecking 
	Goto Airborne 
ENDSCRIPT

SCRIPT NoComply 
	ClearTrickQueue 
	ClearEventBuffer Buttons = Dpad OlderThan = TRICK_PRELOAD_TIME 
	Jump 
	NollieOff 
	PressureOff 
	InAirExceptions 
	Vibrate Actuator = 1 Percent = 80 duration = 0.05000000075 
	SetTrickName <Name> 
	SetTrickScore <Score> 
	Display 
	BailOff 
	PlayAnim Anim = NoComply BlendPeriod = 0.20000000298 
	WaitAnimWhilstChecking 
	Goto Airborne 
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
	Display 
	PlayAnim Anim = Beanplant BlendPeriod = 0.20000000298 
	WaitAnimWhilstChecking 
	Goto Airborne 
ENDSCRIPT

SCRIPT Fastplant 
	ClearTrickQueue 
	ClearEventBuffer Buttons = Dpad OlderThan = TRICK_PRELOAD_TIME 
	Jump BonelessHeight 
	InAirExceptions 
	Vibrate Actuator = 1 Percent = 80 duration = 0.10000000149 
	SetTrickName <Name> 
	SetTrickScore <Score> 
	Display 
	PlayAnim Anim = Fastplant BlendPeriod = 0.20000000298 
	BailOff 
	WaitAnimWhilstChecking 
	Goto Airborne 
ENDSCRIPT

SCRIPT Boneless Anim = Boneless Name = #"Boneless" Score = 250 
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
	IF NOT SkaterIsNamed vallely 
		PlayAnim Anim = <Anim> BlendPeriod = 0.20000000298 
	ELSE 
		PlayAnim Anim = _540Boneless BlendPeriod = 0.10000000149 speed = 1.25000000000 from = 10 
		SetTrickScore 300 
		SetTrickName "MikeV Boneless" 
		FlipAfter 
	ENDIF 
	Display 
	BailOff 
	WaitAnimWhilstChecking 
	Goto Airborne 
ENDSCRIPT

SCRIPT SendTauntMessage 
	GetPreferenceString pref_type = Taunt <string_id> 
	SendChatMessage string = <ui_string> 
ENDSCRIPT

SCRIPT Taunt 
	LandSkaterTricks 
	ClearException Ollied 
	PlayAnim Anim = <Anim> BlendPeriod = 0.30000001192 
	GetPreferenceString pref_type = Taunt <string_id> 
	IF inNetGame 
		SendChatMessage string = <ui_string> 
	ENDIF 
	Wait 10 game frame 
	OnGroundExceptions 
	IF SpeedLessThan 1 
		SetRollingFriction 100 
		WaitAnimWhilstChecking AndManuals 
		Goto Handbrake 
	ELSE 
		WaitAnimWhilstChecking AndManuals 
		Goto OnGroundAI 
	ENDIF 
ENDSCRIPT

SCRIPT Props 
	LandSkaterTricks 
	OnGroundExceptions 
	PlayAnim RANDOM(1, 1) RANDOMCASE Anim = Prop RANDOMCASE Anim = Cheer1 RANDOMEND BlendPeriod = 0.30000001192 
	GetPreferenceString pref_type = Taunt <string_id> 
	IF inNetGame 
		SendChatMessage string = <ui_string> 
	ENDIF 
	IF SpeedLessThan 1 
		SetRollingFriction 100 
		WaitAnimWhilstChecking AndManuals 
		Goto Handbrake 
	ELSE 
		WaitAnimWhilstChecking AndManuals 
		Goto OnGroundAI 
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
	Obj_WaitAnimFinished 
	change flip_backwards_dont_blend = 0 
	PlaySound Hud_jumpgap 
	SetTrickName "\\c2Skitchin\\C0" 
	SetTrickScore 500 
	Display Blockspin 
	DoBalanceTrick ButtonA = right ButtonB = left Type = Skitch Tweak = 5 
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
			Goto SkitchOut 
		ENDIF 
		Waitonegameframe 
	REPEAT 
ENDSCRIPT

SCRIPT SkitchAnimLeft 
	PlayAnim Anim = SkitchMoveLeft from = 20 NoRestart speed = 2 BlendPeriod = 0.10000000149 
ENDSCRIPT

SCRIPT SkitchAnimRight 
	PlayAnim Anim = SkitchMoveRight from = 20 NoRestart speed = 2 BlendPeriod = 0.10000000149 
ENDSCRIPT

SCRIPT SkitchOut 
	StopSkitch 
	StopBalanceTrick 
	PlayAnim Anim = SkitchInit Backwards 
	OnGroundExceptions 
	ClearException Skitched 
	LandSkaterTricks 
	Obj_WaitAnimFinished 
	Goto OnGroundAI 
ENDSCRIPT

SCRIPT NoBrake_Timer 
	CanBrakeOff 
	Wait 0.50000000000 seconds 
	CanBrakeOn 
ENDSCRIPT


