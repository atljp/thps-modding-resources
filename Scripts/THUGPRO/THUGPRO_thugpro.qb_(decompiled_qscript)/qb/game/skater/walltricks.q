
StickerSlapDisabled = 0 
WALLPLANT_ALLOW_OLLIE = 0 
ENABLE_WRB_MESSAGE = 0 
ENABLE_WALLRIDE_BOOSTPLANT = 0 
ENABLE_BPCOUNTER = 0 
ENABLE_WALLRIDEPLANT = 0 
ENABLE_WALLRIDE_SPINS = 0 
WALLPLANT_TRICK_OPTION = 0 
WallRideExceptionTable = [ 
	{ Exception Ex = Landed Scr = Land Params = { NoBlend IgnoreAirTime } } 
	{ Exception Ex = Ollied Scr = Wallie } 
	{ Exception Ex = GroundGone Scr = WallrideEnd } 
	{ Exception Ex = PointRail Scr = PointRail } 
	{ Exception Ex = PointRailSpin Scr = PointRailSpin } 
	{ Exception Ex = SkaterCollideBail Scr = SkaterCollideBail } 
	{ Event Ex = WallrideBounce Scr = AwardWallrideBounce } 
] 
SCRIPT WallRide 
	ResetAirStateCounters 
	change wall_ride_jump_out_speed = 40 
	ClearExceptions 
	ResetEventHandlersFromTable WallRideExceptionTable 
	IF NOT IsTrue ENABLE_WALLRIDE_SPINS 
		CancelRotateDisplay 
	ENDIF 
	LaunchStateChangeEvent State = Skater_OnWall 
	Vibrate Actuator = 1 Percent = 40 
	Obj_ClearFlag FLAG_SKATER_MANUALCHEESE 
	IF GotParam Left 
		move x = 36.00000000000 
	ELSE 
		move x = -36.00000000000 
	ENDIF 
	IF BailIsOn 
		SetState Air 
	ENDIF 
	BailOff 
	IF GetGlobalFlag flag = SERVER_CHEAT_DISABLE_BOOSTPLANT 
		ClearTrickQueue 
	ELSE 
		IF ( ENABLE_WALLRIDE_BOOSTPLANT = 0 ) 
			ClearTrickQueue 
		ENDIF 
	ENDIF 
	IF ( WALLIEPLANT_INPUT_MODE = 0 ) 
		<WallRideTricks> = WallRideTricks_SingleTap 
	ELSE 
		<WallRideTricks> = WallRideTricks_DoubleTap 
	ENDIF 
	IF IsTrue ENABLE_WALLRIDEPLANT 
		IF GotParam Left 
			SetQueueTricks <WallRideTricks> WallridePlantRight 
		ELSE 
			IF GotParam Right 
				SetQueueTricks <WallRideTricks> WallridePlantLeft 
			ENDIF 
		ENDIF 
	ELSE 
		SetQueueTricks <WallRideTricks> 
	ENDIF 
	NollieOff 
	PressureOff 
	SetTrickScore 200 
	GetBoardTypeAndRevert Type = WallRide 
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
	TextureSplat size = 6 radius = 0 bone = Bone_Board_Tail name = skidtrail trail lifetime = 15 
	TextureSplat size = 6 radius = 0 bone = Bone_Board_Nose name = skidtrail trail lifetime = 15 
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

WallRideTricks_SingleTap = [ { Trigger = { PressAndRelease , Up , x , 500 } Scr = Trick_WallPlant Params = { SingleTap } } ] 
WallRideTricks_DoubleTap = [ { Trigger = { TapTwiceRelease , Up , x , 500 } Scr = Trick_WallPlant Params = { DoubleTap } } ] 
WallridePlantLeft = [ { Trigger = { PressAndRelease , Left , x , 500 } Scr = Trick_WallridePlant } ] 
WallridePlantRight = [ { Trigger = { PressAndRelease , Right , x , 500 } Scr = Trick_WallridePlant } ] 
SCRIPT Trick_WallBoostPlant 
ENDSCRIPT

SCRIPT Trick_ManualBoostPlant 
ENDSCRIPT

SCRIPT Trick_WallPlant 
	hide_balance_meter 
	IF GetGlobalFlag flag = SERVER_CHEAT_DISABLE_BOOSTPLANT 
		ClearTrickQueue 
	ELSE 
		IF ( ENABLE_WALLRIDE_BOOSTPLANT = 0 ) 
			ClearTrickQueue 
		ENDIF 
	ENDIF 
	GetSingleTag boostplant_count 
	SetTags boostplant_count = ( <boostplant_count> + 1 ) 
	InAirExceptions 
	Vibrate Actuator = 1 Percent = 50 Duration = 0.10000000149 
	PlayAnim Anim = Boneless BlendPeriod = 0.00000000000 
	IF ( <boostplant_count> > 0 ) 
		IF ( <boostplant_count> < 2 ) 
			SetTrickName #"BoostPlant" 
			Display 
		ENDIF 
		IF Obj_FlagSet FLAG_SKATER_IN_THUG_BOOSTPLANT 
			IF GotParam SingleTap 
				Jump speed = 225 
			ELSE 
				Jump speed = 500 
			ENDIF 
		ELSE 
			IF GotParam SingleTap 
				Jump speed = 425 
			ELSE 
				Jump speed = 525 
			ENDIF 
		ENDIF 
	ELSE 
		SetTrickName #"WalliePlant" 
		SetTrickScore 500 
		Display 
		Jump BonelessHeight 
	ENDIF 
	WaitAnimWhilstChecking 
	Goto Airborne BlendPeriod = 0 
ENDSCRIPT

SCRIPT Trick_WallridePlant 
	change wall_ride_jump_out_speed = 256 
	ClearTrickQueue 
	InAirExceptions 
	Vibrate Actuator = 1 Percent = 50 Duration = 0.10000000149 
	PlayAnim Anim = Ollie BlendPeriod = 0.00000000000 
	SetTrickName #"WallridePlant" 
	SetTrickScore 500 
	Display 
	Jump 
	WaitAnimWhilstChecking 
	Goto Airborne BlendPeriod = 0 
ENDSCRIPT

WALLPLANT_WINDOW_UG = 450 
WALLPLANT_WINDOW = 280 
Wallplant_Trick = 
[ 
] 
Wallplant_Trick2 = 
[ 
] 
Wallplant_Trick_TP = 
[ 
	{ Press , x , WALLPLANT_WINDOW } 
	{ InOrder , x , Down , WALLPLANT_WINDOW_UG } 
	{ InOrder , x , DownLeft , WALLPLANT_WINDOW_UG } 
	{ InOrder , x , DownRight , WALLPLANT_WINDOW_UG } 
	{ InOrder , Down , x , WALLPLANT_WINDOW_UG } 
	{ InOrder , DownLeft , x , WALLPLANT_WINDOW_UG } 
	{ InOrder , DownRight , x , WALLPLANT_WINDOW_UG } 
] 
Wallplant_Trick_UG = [ 
	{ InOrder , x , Down , WALLPLANT_WINDOW_UG } 
	{ InOrder , x , DownLeft , WALLPLANT_WINDOW_UG } 
	{ InOrder , x , DownRight , WALLPLANT_WINDOW_UG } 
	{ InOrder , Down , x , WALLPLANT_WINDOW_UG } 
	{ InOrder , DownLeft , x , WALLPLANT_WINDOW_UG } 
	{ InOrder , DownRight , x , WALLPLANT_WINDOW_UG } 
] 
Post_Wallplant_No_Ollie_Window = 100 
Post_Wallplant_Allow_Ollie_Window = 250 
WallplantOllie = 
[ 
	{ Trigger = { Tap , x , Post_Wallplant_Allow_Ollie_Window } Scr = Ollie Params = { JumpSpeed = 200 FromWallplant } } 
] 
SCRIPT Air_Wallplant 
	ResetAirStateCounters 
	change garbage_wp_checker_exit = 1 
	IF StickerOn 
		<StickerSlap> = StickerSlap 
	ENDIF 
	IF IsSkaterOnVehicle 
		Goto vehicle_wallplant 
	ENDIF 
	IF GetSingleTag InWalkingWallplant 
		name = "Walking Wallplant" 
		Score = 750 
		Anim = WallPlant_Ollie3 
		RemoveTags Tags = [ InWalkingWallplant ] 
	ELSE 
		IF StickerOn 
			name = "Sticker Slap" 
			Score = 750 
			Anim = Wallplant_Sticker 
		ELSE 
			name = "Wallplant" 
			Score = 750 
			Anim = WallPlant_Ollie3 
		ENDIF 
	ENDIF 
	IF BailIsOn 
		Obj_SetFlag FLAG_SKATER_IN_NEUROPLANT 
		name = "Neuro Plant" 
		SetState Air 
		printf "WallPlant Bail" 
		SetRollingFriction 100 
		SetTrickName <name> 
		Display 
		Goto Bailsmack Params = { smackAnim = Bail_Wall_FWD_Regular SmackFriction = 75 } 
	ENDIF 
	Obj_ClearFlag FLAG_SKATER_MANUALCHEESE 
	PressureOff 
	NollieOff 
	InAirExceptions 
	ClearException Ollied 
	LaunchStateChangeEvent State = Skater_InWallplant 
	Vibrate Actuator = 1 Percent = 100 Duration = 0.10000000149 
	IF GotParam StickerSlap 
		Flip 
	ENDIF 
	PlayAnim Anim = <Anim> BlendPeriod = 0 
	BlendPeriodOut 0 
	IF GotParam StickerSlap 
		BoardRotateAfter 
	ENDIF 
	SetTrickName #"" 
	SetTrickScore 0 
	Display Blockspin 
	SetTrickName <name> 
	SetTrickScore <Score> 
	Display 
	IF GotParam StickerSlap 
		Obj_PlaySound SK6_StickerSlap_01 vol = 150 pitch = PAIR(98.00000000000, 105.00000000000) 
	ENDIF 
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
	IF ( WALLPLANT_ALLOW_OLLIE = 1 ) 
		SetSkaterAirTricks AllowWallplantOllie 
	ENDIF 
	GetStartTime 
	BEGIN 
		GetElapsedTime StartTime = <StartTime> 
		IF ( <ElapsedTime> > Post_Wallplant_Allow_Ollie_Window ) 
			BREAK 
		ENDIF 
		DoNextTrick 
		wait 1 GameFrame 
	REPEAT 
	SetSkaterAirTricks 
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
	SetTrickName #"Vert Sticker Slap" 
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
	IF StickerOn 
		wait 0.30000001192 seconds 
		Obj_PlaySound SK6_StickerSlap_01 vol = 150 pitch = PAIR(98.00000000000, 105.00000000000) 
	ENDIF 
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

SCRIPT AwardWallrideBounce 
	SetTrickName #"" 
	SetTrickScore 1000 
	Display Blockspin NoDegrade 
	IF ( ( IsTrue ENABLE_WRB_MESSAGE ) & ( IsTrue ENABLE_PANEL_MESSAGES ) ) 
		create_panel_message { 
			text = "Wallride bounce!" 
			id = perfect 
			font_face = ( ( THUGPRO_GlobalThemeInfo ) . PANEL_MESSAGE_FONT ) 
			scale = ( ( THUGPRO_GlobalThemeInfo ) . PANEL_MESSAGE_SCALE ) 
			style = perfect_style 
			rgba = [ 50 120 200 100 ] 
			pos = ( panel_message_perfect_line1_pos ) 
			( ( THUGPRO_GlobalThemeInfo ) . PANEL_MESSAGE_SHADOW ) 
		} 
		FormatText TextName = text "+1000 Points" 
		create_panel_message { 
			text = <text> 
			id = perfect2 
			font_face = ( ( THUGPRO_GlobalThemeInfo ) . PANEL_MESSAGE_FONT ) 
			scale = ( ( THUGPRO_GlobalThemeInfo ) . PANEL_MESSAGE_SCALE ) 
			style = perfect_style 
			rgba = [ 50 120 200 100 ] 
			pos = ( panel_message_perfect_line2_pos ) 
			( ( THUGPRO_GlobalThemeInfo ) . PANEL_MESSAGE_SHADOW ) 
		} 
	ENDIF 
ENDSCRIPT


