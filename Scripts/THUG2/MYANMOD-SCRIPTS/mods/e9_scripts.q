
E9_ENABLE_MINIMAL_UI = 1 
E9_ENABLE_MYAN_HOP = 1 
E9_ENABLE_NOKILLSCRIPTS = 1 
e9_nonnaturalstate = 0 
e9_skatershouldoffboardgrind = 0 
SCRIPT e9_inair_ex 
	change BSCount = 0 
	change Wall_Non_Skatable_Angle = 4 
	IF IsTrue e9_nonnaturalstate 
		restorephysics 
	ENDIF 
ENDSCRIPT

SCRIPT e9_walk_inair_ex 
	change skaterinaciddrop = 0 
	change skatercanskiprevert = 0 
	change Wall_Non_Skatable_Angle = 4 
ENDSCRIPT

SCRIPT e9_onground_ex 
	change BSCount = 0 
	change skaterinaciddrop = 0 
	change skatercanskiprevert = 0 
	change protectskaterfromjankdrop = 0 
	IF ( e9_skatershouldoffboardgrind = 1 ) 
		change e9_skatershouldoffboardgrind = 0 
		e9_debug_panel value_name = "CRB set" value_value = 0 
	ENDIF 
	change Wall_Non_Skatable_Angle = 1 
	change e9_physics_soup = 0 
ENDSCRIPT

SCRIPT e9_Luge 
	SetQueueTricks NoTricks 
	ClearTrickQueues 
	NollieOff 
	PressureOff 
	PlayAnim Anim = CoffinGrind_Init BlendPeriod = 0.30000001192 
	Obj_WaitAnimFinished 
	SetTrickName "Luge" 
	SetTrickScore 50 
	Display 
	PlayAnim Anim = CoffinGrind_Range wobble 
	BEGIN 
		IF NOT Held circle 
			BREAK 
		ENDIF 
		IF AnimFinished 
			PlayAnim Anim = CoffinGrind_Range wobble NoRestart 
		ENDIF 
		GetSpeed 
		IF ( <speed> < 675.00000000000 ) 
			SetSpeed 675 
		ENDIF 
		OverrideLimits max = 1750 Friction = 0 time = 5 gravity = 0 
		DoNextTrick 
		TweakTrick 10 
		wait 1 GameFrame 
	REPEAT 
	ClearTrickQueue 
	ClearEventBuffer 
	PlayAnim Anim = CoffinGrind_Out BlendPeriod = 0.30000001192 
	Obj_WaitAnimFinished 
	OnGroundExceptions 
	LandSkaterTricks 
	Goto OnGroundAi 
ENDSCRIPT

stickerwaslast = 0 
SCRIPT e9_Extra_WallPlant 
	ClearTrickQueue 
	InAirExceptions 
	Vibrate Actuator = 1 Percent = 50 Duration = 0.10000000149 
	IF IsTrue stickerwaslast 
		PlayAnim Anim = Beanplant BlendPeriod = 0.20000000298 
		SetTrickName #"SlapWallie" 
	ELSE 
		PlayAnim Anim = NoComply BlendPeriod = 0.20000000298 
		SetTrickName #"PlantWallie" 
	ENDIF 
	SetTrickScore 500 
	Display 
	DoNextTrick 
	IF IsTrue stickerwaslast 
		Jump BonelessHeight 
	ELSE 
		Jump 
	ENDIF 
	GetSpeed 
	new_speed = ( <speed> + 100.00000000000 ) 
	SetSpeed <new_speed> 
	WaitAnimWhilstChecking 
	Goto Airborne BlendPeriod = 0 
ENDSCRIPT

canskatermyanhop = 0 
SCRIPT e9_Myan_Hop 
	GetSpeed 
	IF ( <speed> < 500.00000000000 ) 
		change canskatermyanhop = 0 
	ENDIF 
	IF ( canskatermyanhop = 1 ) 
		new_speed = ( <speed> * -1.00000000000 ) 
		SetSpeed <new_speed> 
		SetTrickName #"" 
		SetTrickScore 500 
		Display Blockspin NoDegrade 
		IF NOT InSplitscreenGame 
			Create_Panel_Message text = "Myan Hop" id = perfect rgba = [ 50 120 200 128 ] pos = PAIR(110.00000000000, 340.00000000000) Style = perfect_style 
			Create_Panel_Message text = "+500 Points" id = perfect2 rgba = [ 50 120 200 100 ] pos = PAIR(110.00000000000, 360.00000000000) Style = perfect_style 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT e9_Bomb_Drop 
	IF IsSkaterOnVehicle 
		Goto e9_Bomb_Drop_End 
	ENDIF 
	BEGIN 
		IF IsInBail 
			Goto e9_Bomb_Drop_End 
		ENDIF 
		IF Onrail 
			Goto e9_Bomb_Drop_End 
		ENDIF 
		IF Walking 
			Goto e9_Bomb_Drop_End 
		ENDIF 
		IF OnGround 
			OverrideLimits max = 2000 Friction = 0 time = 20 gravity = 0 
			GetSpeed 
			new_speed = ( <speed> * 1.50000000000 ) 
			SetSpeed <new_speed> 
			BREAK 
		ENDIF 
		wait 1 GameFrame 
	REPEAT 
	Goto e9_Bomb_Drop_End 
ENDSCRIPT

SCRIPT e9_Bomb_Drop_End 
	KillSpawnedScript name = e9_Bomb_Drop 
ENDSCRIPT

SCRIPT e9_jankdrop 
	SetTrickName #"Janky" 
	SetTrickScore 100 
	Display Blockspin NoDegrade 
	IF RollGreaterThan 50 
		Goto DoingTrickBail 
	ENDIF 
	IF DoingTrick 
		printf "DOING A TRICK" 
		Goto DoingTrickBail 
	ENDIF 
	IF DoingFlip 
		printf "DOING A FLIP" 
		Goto PitchBail 
	ENDIF 
	GotoPreserveParams Land2 
ENDSCRIPT

NoBoardWalkGroundTricks = 
[ 
	{ Trigger = { Press , Square , 20 } Scr = e9_onboard params = { OnGround } } 
	{ Trigger = { Press , circle , 20 } Scr = e9_onboard params = { OnGround } } 
] 
NoBoardWalkAirTricks = 
[ 
	{ Trigger = { Press , Square , 20 } Scr = e9_onboard params = { Inair } } 
	{ Trigger = { Press , circle , 20 } Scr = e9_onboard params = { Inair } } 
] 
NoBoardAirTricks = 
[ 
	{ Trigger = { Press , Square , 20 } Scr = e9_onboard params = { Inair } } 
	{ Trigger = { Press , circle , 20 } Scr = e9_onboard params = { Inair } } 
	{ Trigger = { PressTwoAnyOrder , black , White , 400 } Scr = e9_offboard_flailingfall } 
] 
ExtraWalkAirTricks = 
[ 
	{ Trigger = { InOrder , a = L2 , b = L2 , 300 } Scr = KskAirBackflipState } 
	{ Trigger = { InOrder , a = R2 , b = R2 , 300 } Scr = KskAirFrontflipState } 
] 
SCRIPT CreateE9Board vel = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) rotVel = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) object_vel_factor = 1 
	Obj_GetId 
	MangleChecksums a = BailBoard b = <ObjId> 
	Skeleton_SpawnCompositeObject <...> offset = VECTOR(0.00000000000, -3.00000000000, 2.00000000000) bone = Bone_Board_Root Components = BailBoardComponents params = { name = <mangled_id> CloneFrom = <ObjId> geoms = [ board ] } 
	IF NOT ObjectExists id = <mangled_id> 
		RETURN 
	ENDIF 
	<mangled_id> : RigidBody_IgnoreSkater 15 frames 
	<mangled_id> : RigidBody_Wake 
	<mangled_id> : Rigidbody_MatchVelocityTo skater 
ENDSCRIPT

SCRIPT e9_offboard_fromground 
	IF ( E9_ENABLE_KSK_OFFBOARD = 0 ) 
		Goto OnGroundAi 
	ENDIF 
	ClearTrickQueue 
	ClearEventBuffer Buttons = Dpad OlderThan = TRICK_PRELOAD_TIME 
	ClearEventBuffer Buttons = [ X ] OlderThan = 0 
	ClearExceptions 
	LaunchStateChangeEvent State = Skater_InAir 
	SetExtraTricks NoTricks 
	SetQueueTricks NoTricks 
	SwitchOffBoard 
	CreateE9Board vel = VECTOR(0.00000000000, 3.00000000000, 0.00000000000) rotVel = VECTOR(10.00000000000, 0.00000000000, 2.00000000000) object_vel_factor = 0 
	Jump BonelessHeight 
	PlayAnim Anim = Ollie BlendPeriod = 0.20000000298 NoRestart 
	SetTrickName #"KSK Off Board" 
	SetTrickScore 750 
	Display 
	Goto e9_offboard_air 
ENDSCRIPT

SCRIPT e9_offboard_fromair 
	SwitchOffBoard 
	CreateE9Board vel = VECTOR(0.00000000000, 3.00000000000, 0.00000000000) rotVel = VECTOR(10.00000000000, 0.00000000000, 2.00000000000) object_vel_factor = 0 
	SetTrickName "" 
	SetTrickScore 0 
	Display Blockspin 
	SetTrickName #"KSK Off Board Air" 
	SetTrickScore 750 
	Display 
	Goto e9_offboard_air 
ENDSCRIPT

SCRIPT e9_offboard_air 
	ClearExceptions 
	LaunchStateChangeEvent State = Skater_InAir 
	SwitchOffBoard 
	KillExtraTricks 
	SetQueueTricks NoTricks 
	SetExtraTricks NoBoardAirTricks 
	setoffboardphysics 
	Obj_KillSpawnedScript name = AcidParticlesOn 
	SetException Ex = Wallplant Scr = e9_offboard_wallplant 
	SetException Ex = WallRideLeft Scr = e9_offboard_wallride params = { Left } 
	SetException Ex = WallRideRight Scr = e9_offboard_wallride params = { right } 
	SetException Ex = Landed Scr = e9_offboard_land 
	SetException Ex = FlailHitWall Scr = Bailsmack params = { } 
	SetException Ex = FlailLeft Scr = Bailsmack params = { } 
	SetException Ex = FlailRight Scr = Bailsmack params = { } 
	SetException Ex = PointRailSpin Scr = PointRailSpin 
	SetException Ex = PointRail Scr = PointRail 
	BEGIN 
		DoNextTrick 
		PlayWalkAnim Anim = AirIdleToJumpAir From = 50 To = End BlendPeriod = <BlendPeriod> NoRestart 
		waitonegameframe 
	REPEAT 
	WaitAnimWhilstChecking 
	BEGIN 
		DoNextTrick 
		waitonegameframe 
	REPEAT 
ENDSCRIPT

SCRIPT e9_onboard 
	SwitchOnBoard 
	IF GotParam OnGround 
		Goto WalkingRunToSkating 
	ENDIF 
	CleanUp_WalkingtoSkating 
	ClearTrickQueues 
	SetQueueTricks NoTricks 
	SetTrickName #"KSK Off Board Caveman" 
	SetTrickScore 750 
	Display 
	PlayAnim Anim = JumpAirTo5050 From = 0 To = 0.30000001192 seconds NoRestart 
	ClearExceptions 
	change e9_skatershouldoffboardgrind = 0 
	e9_debug_panel value_name = "CRB set" value_value = 0 
	SetException Ex = PointRailSpin Scr = PointRailSpin 
	SetException Ex = PointRail Scr = PointRail 
	SetException Ex = Landed Scr = DoingTrickBail 
	WaitAnimWhilstChecking 
	ClearException Landed 
	SetException Ex = Landed Scr = Land2 
ENDSCRIPT

e9_physics_soup = 0 
SCRIPT e9_dummy_point 
	NoRailTricks 
	Jump BonelessHeight 
	DoCarPlantBoost 
	SwitchOnBoard 
	ClearTrickQueues 
	KillExtraTricks 
	SetQueueTricks NoTricks 
	SetExtraTricks NoTricks 
	SparksOff 
	PressureOff 
	NollieOff 
	Vibrate Actuator = 0 Percent = 50 Duration = 0.10000000149 
	Obj_SpawnScript PointRailSparks 
	SetTrickName #"KSK Rail Caveman" 
	SetTrickScore 750 
	Display 
	ClearExceptions 
	IF GotParam PlayAnim 
		PlayAnim Anim = JumpAirTo5050 From = 0 To = 0.30000001192 seconds NoRestart 
	ENDIF 
	rotate X = -20 Duration = 0.10000000149 
	SetSkaterAirManualTricks 
	change e9_skatershouldoffboardgrind = 0 
	change e9_physics_soup = 1 
	e9_debug_panel value_name = "CRB fire" value_value = 0 
	SetException Ex = Landed Scr = DoingTrickBail 
	wait 37 frames 
	AllowRailTricks 
	WaitAnimWhilstChecking 
	ClearException Landed 
	SetException Ex = Landed Scr = Land2 
	SetException Ex = PointRailSpin Scr = PointRailSpin 
	SetException Ex = PointRail Scr = PointRail 
	SetException Ex = Ollied Scr = Ollie 
ENDSCRIPT

SCRIPT e9_offboard_land 
	DestroyAllSpecialItems 
	KillSpawnedScript name = AcidParticlesOn 
	IF AbsolutePitchGreaterThan 60 
		IF PitchGreaterThan 60 
			ClearComboBonusPot 
			Goto PitchBail 
		ENDIF 
	ENDIF 
	IF LandedFromSpine 
		GetMatrixNormal 
		IF ( <y> > 0.94999998808 ) 
			ClearComboBonusPot 
			Goto PitchBail 
		ENDIF 
	ENDIF 
	IF DoingFlip 
		ClearComboBonusPot 
		Goto PitchBail 
	ENDIF 
	PressureOff 
	NollieOff 
	SpawnClothingLandScript 
	IF Backwards 
		FlipAndRotate 
		BoardRotate 
	ENDIF 
	SetRollingFriction 20 
	SwitchToWalkingPhysics 
	NoRailTricks 
	ResetEventHandlersFromTable JustStoppedSkatingState_Restart_ExceptionTable Group = WalkingStateExceptions 
	SetEventHandler Ex = Trigger_L2 Scr = CameraFlushButton Group = WalkingEvents 
	SetEventHandler Ex = Release_X Scr = JumpButton Group = WalkingEvents 
	SetEventHandler Ex = MadeOtherSkaterBail Scr = MadeOtherSkaterBailWalk Group = WalkingCollideEvents 
	SetException Ex = SkaterCollideBail Scr = SkaterCollideBail Group = WalkingCollideEvents 
	SetTags WalkingGroundTricksInactive 
	Obj_SpawnScript ActivateGroundTricksDelay id = ActivateGroundTricksDelay 
	SetWalkingTrickState NewWalkingTrickState = UNSET 
	IF CurrentScorePotGreaterThan 0 
		Obj_SpawnScript ComboRunOutTrickDisplayDelay id = ComboRunOutTrickDisplayDelay 
	ENDIF 
	RunSpeedChosenAnim Anims = [ JumpLandToWalk JumpLandToWalk JumpLandToRun JumpLandToRun ] Speeds = [ 1.50000000000 1.50000000000 1.75000000000 1.75000000000 ] BlendPeriod = 0.10000000149 NoSpeedUpdate 
	BlendPeriodOut 0.30000001192 
	WaitAnimWalking 
	Goto StandState 
ENDSCRIPT

SCRIPT e9_offboard_wallplant 
	ClearException Ollied 
	LaunchStateChangeEvent State = Skater_InWallplant 
	Vibrate Actuator = 1 Percent = 100 Duration = 0.10000000149 
	SetTrickName "" 
	SetTrickScore 0 
	Display Blockspin 
	PlayAnim Anim = WallPlant_Ollie3 speed = 1.10000002384 From = 0 To = 0.28000000119 seconds BlendPeriod = 0.00000000000 
	SetTrickName #"KSK Off Board Wallplant" 
	SetTrickScore 750 
	Display 
	WaitAnimWhilstChecking 
	TurnOffSpecialItem 
	Goto e9_offboard_air 
ENDSCRIPT

SCRIPT e9_offboard_flailingfall 
	PlayAnim Anim = RunOut_Drop_Idle Cycle From = 17 To = 72 
	ClearExceptions 
	SetExtraTricks NoTricks 
	SetException Ex = Landed Scr = Bailsmack params = { } 
	SetException Ex = Wallplant Scr = Bailsmack params = { } 
	SetException Ex = WallRideLeft Scr = Bailsmack params = { } 
	SetException Ex = WallRideRight Scr = Bailsmack params = { } 
ENDSCRIPT

SCRIPT e9_offboardair_ex 
	skater : AtomicIsHidden board 
	IF ( <hidden> = 1 ) 
		Goto e9_offboard_air 
	ENDIF 
ENDSCRIPT

e9_OffBoardWallRideExceptionTable = [ 
	{ Exception Ex = Landed Scr = e9_offboard_land } 
	{ Exception Ex = Ollied Scr = e9_offboard_wallie } 
	{ Exception Ex = GroundGone Scr = e9_offboard_wallend } 
] 
SCRIPT e9_offboard_wallride 
	OnExceptionRun 
	ResetEventHandlersFromTable e9_OffBoardWallRideExceptionTable 
	CancelRotateDisplay 
	LaunchStateChangeEvent State = Skater_OnWall 
	Vibrate Actuator = 1 Percent = 40 
	Obj_ClearFlag FLAG_SKATER_MANUALCHEESE 
	IF GotParam Left 
		move X = 36 
	ELSE 
		move X = -36 
	ENDIF 
	IF BailIsOn 
		SetState Air 
		printf "WallRide Bail" 
		Goto Bailsmack params = { smackAnim = Bail_Wall_FWD_Regular SmackFriction = 75 } 
	ENDIF 
	BailOff 
	ClearTrickQueue 
	NollieOff 
	PressureOff 
	SetTrickScore 200 
	SetTrickName #"Off Board Wallrun" 
	PlayWalkAnim Anim = Run BlendPeriod = 0.10000000149 speed = 1.50000000000 Cycle 
	Display 
	BEGIN 
		TweakTrick 25 
		wait 1 frame 
		DoNextTrick 
	REPEAT 
ENDSCRIPT

SCRIPT e9_offboard_wallend 
	BlendPeriodOut 0 
	SetException Ex = Landed Scr = e9_offboard_land 
	ClearExceptions 
	IF Inair 
		Goto e9_offboard_air 
	ENDIF 
ENDSCRIPT

SCRIPT e9_offboard_wallie 
	DoNextTrick 
	Vibrate Actuator = 1 Percent = 50 Duration = 0.10000000149 
	PlayWalkAnim Anim = AirIdleToJumpAir From = 50 To = End BlendPeriod = 0.30000001192 NoRestart 
	SetTrickName #"Off Board Wallie" 
	SetTrickScore 250 
	Display 
	Jump 
	WaitAnimWhilstChecking 
	Goto e9_offboard_air 
ENDSCRIPT

SCRIPT setoffboardphysics 
	change e9_nonnaturalstate = 1 
	change e9_skatershouldoffboardgrind = 1 
	e9_debug_panel value_name = "CRB set" value_value = 1 
	change Wall_Ride_Delay = 0.89999997616 
	change skater_physics = { 
		skater_autoturn_speed = 3.00000000000 
		skater_autoturn_cancel_time = 300 
		skater_autoturn_vert_angle = 5 
		Physics_Standing_Air_Friction = 0.00001000000 
		Physics_Crouched_Air_Friction = 0.00000200000 
		Physics_Rolling_Friction = 0.00000100000 
		Skater_Max_Standing_Kick_Speed_Stat = { PAIR(394.00000000000, 496.00000000000) limit = 900 STATS_SPEED switch = PAIR(0.80000001192, 1.00000000000) } 
		Skater_Max_Crouched_Kick_Speed_Stat = { PAIR(532.00000000000, 675.00000000000) limit = 900 STATS_SPEED switch = PAIR(0.80000001192, 1.00000000000) } 
		Physics_Standing_Acceleration_Stat = { PAIR(629.00000000000, 700.00000000000) STATS_SPEED switch = standard_switch } 
		Physics_Crouching_Acceleration_stat = { PAIR(1057.00000000000, 1200.00000000000) STATS_SPEED switch = standard_switch } 
		Skater_Max_Speed_Stat = { PAIR(757.00000000000, 900.00000000000) STATS_SPEED switch = no_switch } 
		Skater_Max_Max_Speed_Stat = { PAIR(957.00000000000, 1100.00000000000) STATS_SPEED switch = no_switch } 
		Skater_default_head_height = 77 
		Physics_Ground_Snap_Up = 13 
		Physics_Air_Snap_Up = 15 
		Physics_Ground_Snap_Down = 8.19999980927 
		Skater_First_Forward_Collision_Height = 8.10000038147 
		Skater_First_Forward_Collision_Length = 10 
		Skater_Min_Distance_To_Wall = 8.00000000000 
		Physics_Ground_Rotation = 1.79999995232 
		Physics_Ground_Sharp_Rotation = 3.59999990463 
		Physics_Air_No_Rotate_Time = 100 
		Physics_Air_Ramp_Rotate_Time = 50 
		spin_count_slop = 60 
		Physics_Air_Gravity = -1350 
		Physics_Ground_Gravity = -1000 
		Physics_Rail_Gravity = -2000 
		Wall_Ride_Gravity = 0 
		Ground_stick_angle = 30 
		Ground_stick_angle_forward = 30 
		Physics_Brake_Acceleration = 900.00000000000 
		Physics_Air_Lean_stat = { PAIR(1.00000000000, 1.00000000000) STATS_SPIN switch = standard_switch } 
		Physics_Air_Rotation_stat = { PAIR(6.84999990463, 7.75000000000) STATS_SPIN switch = standard_switch } 
		Physics_air_tap_turn_speed_stat = { PAIR(6.84999990463, 7.75000000000) STATS_SPIN switch = standard_switch } 
		Physics_Acid_Drop_Pop_Speed = 200 
		Physics_Acid_Drop_Speed_Limit_Override_Duration = 5 
		Physics_Transfer_Speed_Limit_Override_Drop_Rate = 0.50000000000 
		Physics_Transfer_Speed_Limit_Override_Max = 72.00000000000 
	} 
ENDSCRIPT

SCRIPT restorephysics 
	change e9_nonnaturalstate = 0 
	change Wall_Ride_Delay = 0.11999999732 
	change skater_physics = { 
		skater_autoturn_speed = 3.00000000000 
		skater_autoturn_cancel_time = 300 
		skater_autoturn_vert_angle = 5 
		Physics_Standing_Air_Friction = 0.00001000000 
		Physics_Crouched_Air_Friction = 0.00000200000 
		Physics_Rolling_Friction = 0.00000100000 
		Skater_Max_Standing_Kick_Speed_Stat = { PAIR(394.00000000000, 496.00000000000) limit = 900 STATS_SPEED switch = PAIR(0.80000001192, 1.00000000000) } 
		Skater_Max_Crouched_Kick_Speed_Stat = { PAIR(532.00000000000, 675.00000000000) limit = 900 STATS_SPEED switch = PAIR(0.80000001192, 1.00000000000) } 
		Physics_Standing_Acceleration_Stat = { PAIR(629.00000000000, 700.00000000000) STATS_SPEED switch = standard_switch } 
		Physics_Crouching_Acceleration_stat = { PAIR(1057.00000000000, 1200.00000000000) STATS_SPEED switch = standard_switch } 
		Skater_Max_Speed_Stat = { PAIR(757.00000000000, 900.00000000000) STATS_SPEED switch = no_switch } 
		Skater_Max_Max_Speed_Stat = { PAIR(957.00000000000, 1100.00000000000) STATS_SPEED switch = no_switch } 
		Skater_default_head_height = 77 
		Physics_Ground_Snap_Up = 13 
		Physics_Air_Snap_Up = 15 
		Physics_Ground_Snap_Down = 8.19999980927 
		Skater_First_Forward_Collision_Height = 8.10000038147 
		Skater_First_Forward_Collision_Length = 10 
		Skater_Min_Distance_To_Wall = 8.00000000000 
		Physics_Ground_Rotation = 1.79999995232 
		Physics_Ground_Sharp_Rotation = 3.59999990463 
		Physics_Air_No_Rotate_Time = 100 
		Physics_Air_Ramp_Rotate_Time = 50 
		spin_count_slop = 60 
		Physics_Air_Gravity = -1350 
		Physics_Ground_Gravity = -1000 
		Physics_Rail_Gravity = -2000 
		Wall_Ride_Gravity = -969 
		Ground_stick_angle = 30 
		Ground_stick_angle_forward = 30 
		Physics_Brake_Acceleration = 900.00000000000 
		Physics_Air_Lean_stat = { PAIR(1.00000000000, 1.00000000000) STATS_SPIN switch = standard_switch } 
		Physics_Air_Rotation_stat = { PAIR(6.84999990463, 7.75000000000) STATS_SPIN switch = standard_switch } 
		Physics_air_tap_turn_speed_stat = { PAIR(6.84999990463, 7.75000000000) STATS_SPIN switch = standard_switch } 
		Physics_Acid_Drop_Pop_Speed = 200 
		Physics_Acid_Drop_Speed_Limit_Override_Duration = 5 
		Physics_Transfer_Speed_Limit_Override_Drop_Rate = 0.50000000000 
		Physics_Transfer_Speed_Limit_Override_Max = 72.00000000000 
	} 
ENDSCRIPT

SCRIPT e9_debug_panel value_name = "null" value_value = 108 
    IF ( MOD_DEV_MODE = 1 )
        FormatText textname = MessageText "%n: %s" n = <value_name> s = <value_value> 
        Create_Panel_Message text = <MessageText> id = debug rgba = [ 72 0 255 128 ] pos = PAIR(100.00000000000, 440.00000000000) Style = perfect_style 
    ENDIF
ENDSCRIPT

