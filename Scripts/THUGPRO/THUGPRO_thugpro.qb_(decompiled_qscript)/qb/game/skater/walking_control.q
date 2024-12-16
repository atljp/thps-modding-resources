
ENABLE_WALKING_180FLIP_SKATER = 1 
SCRIPT SwitchToWalkingPhysics 
	IF ( ENABLE_WALKING_180FLIP_SKATER = 1 ) 
		flip_skater_if_180_off 
	ENDIF 
	BroadcastEvent Type = SkaterExitSkating 
	ClearTrickQueues 
	SkaterPhysicsControl_SwitchSkatingToWalking 
	SkaterLoopingSound_TurnOff 
	EnableInputEvents 
	BroadcastEvent Type = SkaterEnterWalking 
	KillExtraTricks 
	PressureOff 
	NollieOff 
	Obj_SpawnScript ClearLipLock 
	SetTrickName #"" 
	SetTrickScore 0 
	Display Blockspin 
ENDSCRIPT

SCRIPT ClearLipLock 
	ClearAllowLipNoGrind 
	wait 15 frames 
	ClearAllowLipNoGrind 
ENDSCRIPT

SCRIPT SwitchToSkatingPhysics 
	BroadcastEvent Type = SkaterExitWalking 
	ClearAllWalkingExceptions 
	ClearTrickQueue 
	Obj_KillSpawnedScript Id = ComboRunOutTrickDisplayDelay 
	Obj_KillSpawnedScript Id = ActivateGroundTricksDelay 
	SetProps remove_tags = [ WalkingGroundTricksInactive ] 
	SetTrickName #"" 
	SetTrickScore 0 
	Display Blockspin 
	RunTimer_Pause 
	SkaterPhysicsControl_SwitchWalkingToSkating 
	BroadcastEvent Type = SkaterEnterSkating 
ENDSCRIPT

WalkGroundTricks = [ 
	{ SwitchControl_Trigger Scr = WalkingRunToSkating } 
] 
WalkAirTricks_NO_AS = [ 
	{ SwitchControl_Trigger Scr = WalkingAirToSkating } 
] 
WalkAirTricks_AS = [ 
	{ SwitchControl_Trigger Scr = WalkingAirToSkating } 
	{ trigger = { TapTwiceRelease , up , X , 400 } Scr = Air_Shuffle params = { nose } } 
] 
WalkAirTricks = [ 
	{ SwitchControl_Trigger Scr = WalkingAirToSkating } 
	{ trigger = { TapTwiceRelease , up , X , 400 } Scr = Air_Shuffle params = { nose } } 
] 
SCRIPT BeginWalkingGenericTrick 
	CleanUp_WalkingtoSkating 
	IF NOT OnGround 
		PerhapsAwardCaveman 
	ENDIF 
ENDSCRIPT

SCRIPT BeginWalkingManualTrick 
	Walk_ScaleAnimSpeed Off 
	CleanUp_WalkingtoSkating 
	PerhapsAwardCaveman 
ENDSCRIPT

SCRIPT WalkingToRailTrick 
	Walk_ScaleAnimSpeed Off 
	PlayAnim Anim = JumpAirTo5050 From = 0 To = 0.30000001192 Seconds 
	SetException Ex = PointRailSpin Scr = PointRailSpin 
	PerhapsAwardCaveman HaveNotSwitchedPhysicsStatesYet 
	SetTrickName #"" 
	SetTrickScore 0 
	Display Blockspin 
	CleanUp_WalkingtoSkating 
ENDSCRIPT

SCRIPT WalkingAirToTransitionTrick 
	Walk_ScaleAnimSpeed Off 
	PlayAnim Anim = JumpAirToAirIdle 
	CleanUp_WalkingtoSkating 
	WaitAnimWhilstChecking 
	Goto Airborne params = { NoSkateToWalkTricks } 
ENDSCRIPT

SCRIPT WalkingRunToSkating 
	SkaterLoopingSound_TurnOff 
	IF ( ( GetGlobalFlag flag = FLAG_EXPERT_MODE_NO_WALKING ) | ( GetGlobalFlag flag = FLAG_G_EXPERT_MODE_NO_WALKING ) ) 
		SetQueueTricks Jumptricks WalkToSkateTransition_GroundTricks 
	ELSE 
		SetQueueTricks Jumptricks WalkToSkateTransition_GroundTricks SkateToWalkTricks 
	ENDIF 
	IF AnimEquals [ SkateToWalk WSkateToRun SlowSkateToStand BrakeToStand ] 
		PlayAnim Anim = WRunToSkate SyncToReversePreviousAnim EffectivePreviousAnimDuration = 0.50000000000 
	ELSE 
		PlayAnim Anim = WRunToSkate 
	ENDIF 
	SetEventHandler Ex = FlailHitWall Scr = FlailVibrate 
	SetEventHandler Ex = FlailLeft Scr = FlailVibrate 
	SetEventHandler Ex = FlailRight Scr = FlailVibrate 
	ClearException RunHasEnded 
	ClearException GoalHasEnded 
	ClearException Ollied 
	wait CavemanBailDuration Seconds 
	SetException Ex = Ollied Scr = Ollie params = { OutAnim = JumpAirToAirIdle SyncOutAnimToPreviousAnim } 
	WaitAnimWhilstChecking AndManuals 
	LandSkaterTricks 
	Goto OnGroundAi 
ENDSCRIPT

SCRIPT WalkToSkateTransition_ToggleStance 
	ApplyStanceToggle 
	WaitAnimWhilstChecking AndManuals 
	LandSkaterTricks 
	Goto OnGroundAi 
ENDSCRIPT

SCRIPT WalkingAirToSkating 
	SkaterLoopingSound_TurnOff 
	Walk_ScaleAnimSpeed Off 
	PlayAnim Anim = JumpAirToAirIdle 
	wait CavemanBailDuration Seconds 
	WaitAnimWhilstChecking 
	Goto Airborne params = { NoSkateToWalkTricks } 
ENDSCRIPT

SCRIPT ComboRunOutTrickDisplayDelay 
	Obj_GetId 
	SetEventHandler Ex = SkaterExitCombo Scr = FilterSkaterExitComboEvent params = { ThisSkaterId = <ObjId> } 
	wait RunoutTrickDelay Seconds 
	SetTrickName #"Combo Run Out" 
	SetTrickScore COMBO_RUNOUT_SCORE 
	Display Blockspin 
ENDSCRIPT

SCRIPT FilterSkaterExitComboEvent 
	IF ( <SkaterId> = <ThisSkaterId> ) 
		Goto NullScript 
	ENDIF 
ENDSCRIPT

SCRIPT PerhapsAwardCaveman 
	IF NOT GotParam HaveNotSwitchedPhysicsStatesYet 
		GetPreviousPhysicsStateDuration 
		IF ( <PreviousPhysicsStateDuration> > RunoutTrickDelay ) 
			SetTrickName #"Caveman" 
			SetTrickScore CAVEMAN_SCORE 
			Display 
		ENDIF 
	ELSE 
		GetTimeSincePhysicsSwitch 
		IF ( <TimeSincePhysicsSwitch> > RunoutTrickDelay ) 
			SetTrickName #"Caveman" 
			SetTrickScore CAVEMAN_SCORE 
			Display 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT ActivateGroundTricksDelay 
	wait CavemanBailDuration Seconds 
	SetProps remove_tags = [ WalkingGroundTricksInactive ] 
	IF Walk_Ground 
		SetWalkingGroundTricks 
	ENDIF 
ENDSCRIPT

SCRIPT SetWalkingGroundTricks 
	IF NOT IsBoardMissing 
		GetTags 
		IF NOT GotParam WalkingGroundTricksInactive 
			SetQueueTricks WalkGroundTricks 
		ELSE 
			SetQueueTricks NoTricks 
		ENDIF 
	ELSE 
		SetQueueTricks NoTricks 
	ENDIF 
	SetExtraGrindTricks NoTricks 
	SetManualTricks NoTricks 
ENDSCRIPT

SCRIPT SetWalkingAirTricks 
	IF NOT IsBoardMissing 
		IF GetGlobalFlag flag = SERVER_CHEAT_DISABLE_AIRSHUFFLE 
			SetQueueTricks special = SpecialTricks AirTricks WalkAirTricks_NO_AS 
		ELSE 
			IF ( enable_air_shuffle = 1 ) 
				SetQueueTricks special = SpecialTricks AirTricks WalkAirTricks_AS 
			ELSE 
				SetQueueTricks special = SpecialTricks AirTricks WalkAirTricks_NO_AS 
			ENDIF 
		ENDIF 
		SetExtraGrindTricks special = SpecialGrindTricks GrindTricks 
		IF ( ( GetGlobalFlag flag = FLAG_EXPERT_MODE_NO_MANUALS ) | ( GetGlobalFlag flag = FLAG_G_EXPERT_MODE_NO_MANUALS ) ) 
			SetManualTricks NoTricks 
		ELSE 
			SetManualTricks special = SpecialManualTricks GroundManualTricks 
		ENDIF 
	ELSE 
		SetQueueTricks NoTricks 
		SetExtraGrindTricks NoTricks 
		SetManualTricks NoTricks 
	ENDIF 
ENDSCRIPT

SCRIPT SetWalkingOffTricks 
	SetQueueTricks NoTricks 
	SetExtraGrindTricks NoTricks 
	SetManualTricks NoTricks 
ENDSCRIPT

SCRIPT SetWalkingTrickState NewWalkingTrickState = GROUND WalkingTricksState = UNSET 
	GetTags 
	IF NOT ( <NewWalkingTrickState> = <WalkingTricksState> ) 
		ClearTrickQueues 
		SWITCH <NewWalkingTrickState> 
			CASE GROUND 
				ClearExceptionGroup WalkingTransitionTrickExceptions 
				SetException Ex = BankDrop Scr = WalkingAirToTransitionTrick Group = WalkingTransitionTrickExceptions 
				SetException Ex = AcidDrop Scr = WalkingAirToTransitionTrick Group = WalkingTransitionTrickExceptions 
				SetException Ex = Rail Scr = WalkingToRailTrick Group = WalkingTransitionTrickExceptions 
				RunTimer_Unpause 
				SetEventHandler Ex = RunTimerUp Scr = Walk_LandSkaterTricks Group = RunTimerEvents 
				SetEventHandler Ex = RunHasEnded Scr = EndOfRun_WalkingEvent Group = WalkingEndRunEvents 
				SetEventHandler Ex = GoalHasEnded Scr = Goal_EndOfRun_WalkingEvent Group = WalkingEndRunEvents 
				ResetLandedFromVert 
				ResetLandingFromBankDrop 
				LaunchStateChangeEvent State = Skater_OnGround 
				SetWalkingGroundTricks 
			CASE AIR 
				ClearEventBuffer Buttons = [ up DOWN ] OlderThan = 0 
				ClearExceptionGroup WalkingTransitionTrickExceptions 
				SetException Ex = BankDrop Scr = WalkingAirToTransitionTrick Group = WalkingTransitionTrickExceptions 
				SetException Ex = AcidDrop Scr = WalkingAirToTransitionTrick Group = WalkingTransitionTrickExceptions 
				SetException Ex = Rail Scr = WalkingToRailTrick Group = WalkingTransitionTrickExceptions 
				ClearExceptionGroup WalkingEndRunEvents 
				ClearExceptionGroup RunTimerEvents 
				LaunchStateChangeEvent State = Skater_InAir 
				SetWalkingAirTricks 
			CASE Off 
				ClearExceptionGroup WalkingTransitionTrickExceptions 
				RunTimer_Unpause 
				SetEventHandler Ex = RunTimerUp Scr = Walk_LandSkaterTricks Group = RunTimerEvents 
				SetEventHandler Ex = RunHasEnded Scr = EndOfRun_WalkingEvent Group = WalkingEndRunEvents 
				SetEventHandler Ex = GoalHasEnded Scr = Goal_EndOfRun_WalkingEvent Group = WalkingEndRunEvents 
				ResetLandedFromVert 
				ResetLandingFromBankDrop 
				SetWalkingOffTricks 
		ENDSWITCH 
		SetTags WalkingTricksState = <NewWalkingTrickState> 
	ENDIF 
ENDSCRIPT

SCRIPT Walk_LandSkaterTricks 
	LandSkaterTricks 
	Obj_KillSpawnedScript Id = ComboRunOutTrickDisplayDelay 
ENDSCRIPT

SCRIPT WaitAnimWalking 
	BEGIN 
		DoNextManualTrick ScriptToRunFirst = BeginWalkingManualTrick FromWalk 
		DoNextTrick ScriptToRunFirst = BeginWalkingGenericTrick 
		IF AnimFinished 
			BREAK 
		ENDIF 
		wait 1 GameFrame 
	REPEAT 
ENDSCRIPT

SCRIPT WaitWalking 
	BEGIN 
		DoNextManualTrick ScriptToRunFirst = BeginWalkingManualTrick FromWalk 
		DoNextTrick ScriptToRunFirst = BeginWalkingGenericTrick 
		wait 1 GameFrame 
	REPEAT 
ENDSCRIPT

SCRIPT PlayWalkAnim 
	IF NOT IsBoardMissing 
		PlayAnim <...> 
	ELSE 
		IF IsForceWalkOn 
			PlayAnim <...> 
		ELSE 
			AppendSuffixToChecksum Base = <Anim> SuffixString = "_Partial" 
			IF AnimExists <appended_id> 
				IF NOT Obj_AnimSubsetExists SubsetId = WalkOnly 
					Obj_AddAnimSubset SubsetId = WalkOnly 
					Obj_SetAnimSubsetWeight SubsetId = WalkOnly BlendWeight = 1 
					IF Obj_AnimationFlipped 
						Obj_Flip SubsetId = WalkOnly 
					ENDIF 
				ENDIF 
				PlayAnim <...> 
				PlayAnim <...> Anim = <appended_id> SubsetId = WalkOnly 
			ELSE 
				PlayAnim <...> 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT PlaySpeedChosenAnim 
	Walk_GetSpeedScale 
	IF NOT GotParam NoSpeedUpdate 
		SWITCH <SpeedScale> 
			CASE WALK_SLOW 
				Walk_ScaleAnimSpeed Run StandardSpeed = ( <Speeds> [ 0 ] ) 
				PlayWalkAnim Anim = ( <Anims> [ 0 ] ) <...> 
			CASE WALK_FAST 
				Walk_ScaleAnimSpeed Run StandardSpeed = ( <Speeds> [ 1 ] ) 
				PlayWalkAnim Anim = ( <Anims> [ 1 ] ) <...> 
			CASE RUN_SLOW 
				Walk_ScaleAnimSpeed Run StandardSpeed = ( <Speeds> [ 2 ] ) 
				PlayWalkAnim Anim = ( <Anims> [ 2 ] ) <...> 
			CASE RUN_FAST 
				Walk_ScaleAnimSpeed Run StandardSpeed = ( <Speeds> [ 3 ] ) 
				PlayWalkAnim Anim = ( <Anims> [ 3 ] ) <...> 
		ENDSWITCH 
	ELSE 
		Walk_ScaleAnimSpeed Off 
		SWITCH <SpeedScale> 
			CASE WALK_SLOW 
				PlayWalkAnim Anim = ( <Anims> [ 0 ] ) Speed = ( <Speeds> [ 0 ] ) <...> 
			CASE WALK_FAST 
				PlayWalkAnim Anim = ( <Anims> [ 1 ] ) Speed = ( <Speeds> [ 1 ] ) <...> 
			CASE RUN_SLOW 
				PlayWalkAnim Anim = ( <Anims> [ 2 ] ) Speed = ( <Speeds> [ 2 ] ) <...> 
			CASE RUN_FAST 
				PlayWalkAnim Anim = ( <Anims> [ 3 ] ) Speed = ( <Speeds> [ 3 ] ) <...> 
		ENDSWITCH 
	ENDIF 
ENDSCRIPT

SCRIPT RunSpeedChosenAnim 
	PlaySpeedChosenAnim NoRestart <...> 
	BEGIN 
		WaitAnimWalkingFrame 
		IF AnimFinished 
			BREAK 
		ENDIF 
		WaitAnimWalkingFrame 
		IF AnimFinished 
			BREAK 
		ENDIF 
		WaitAnimWalkingFrame 
		IF AnimFinished 
			BREAK 
		ENDIF 
		WaitAnimWalkingFrame 
		IF AnimFinished 
			BREAK 
		ENDIF 
		PlaySpeedChosenAnim SyncToPreviousAnim NoRestart <...> 
	REPEAT 
ENDSCRIPT

SCRIPT CycleSpeedChosenAnim 
	PlaySpeedChosenAnim Cycle NoRestart <...> 
	BEGIN 
		WaitWalkingFrame 
		WaitWalkingFrame 
		WaitWalkingFrame 
		WaitWalkingFrame 
		PlaySpeedChosenAnim Cycle SyncToPreviousAnim NoRestart <...> 
	REPEAT 
ENDSCRIPT

SCRIPT WaitWalkingFrame 
	DoNextManualTrick ScriptToRunFirst = BeginWalkingManualTrick FromWalk 
	DoNextTrick ScriptToRunFirst = BeginWalkingGenericTrick 
	wait 1 GameFrame 
ENDSCRIPT

SCRIPT WaitAnimWalkingFrame 
	DoNextManualTrick ScriptToRunFirst = BeginWalkingManualTrick FromWalk 
	DoNextTrick ScriptToRunFirst = BeginWalkingGenericTrick 
	IF AnimFinished 
		RETURN 
	ENDIF 
	wait 1 GameFrame 
ENDSCRIPT

SCRIPT ClearAllWalkingExceptions 
	ClearExceptionGroup WalkingStateExceptions 
	ClearExceptionGroup WalkingEvents 
	ClearExceptionGroup WalkingEndRunEvents 
	ClearExceptionGroup WalkingTransitionTrickExceptions 
	ClearExceptionGroup WalkingCollideEvents 
	ClearExceptionGroup RunTimerEvents 
ENDSCRIPT

JustStoppedSkatingState_ExceptionTable = [ 
	{ Exception Ex = Run Scr = SkateToRunState } 
	{ Exception Ex = Stand Scr = SkateToStandState } 
	{ Exception Ex = Skid Scr = SkateToStandState } 
	{ Exception Ex = LadderOntoBottom Scr = LadderOntoBottomState } 
	{ Exception Ex = LadderOntoTop Scr = LadderOntoTopState } 
	{ Exception Ex = Land Scr = LandState } 
	{ Exception Ex = Hang Scr = AirToHangState } 
	{ Exception Ex = Ladder Scr = LadderMoveUpState } 
	{ Exception Ex = AIR Scr = SkateToAirState } 
	{ Exception Ex = Jump Scr = SkateToAirState } 
	{ Exception Ex = WalkOffEdge Scr = SkateToAirState } 
	{ Exception Ex = DropToHang Scr = DropToHangState } 
	{ Exception Ex = Rail Scr = WalkingToRailTrick } 
	{ Exception Ex = Wallplant Scr = WallplantState } 
] 
JustStoppedSkatingState_Restart_ExceptionTable = [ 
	{ Exception Ex = Run Scr = StandState } 
	{ Exception Ex = Stand Scr = StandState } 
	{ Exception Ex = Skid Scr = StandState } 
	{ Exception Ex = Land Scr = StandState } 
	{ Exception Ex = LadderOntoBottom Scr = LadderOntoBottomState } 
	{ Exception Ex = LadderOntoTop Scr = LadderOntoTopState } 
	{ Exception Ex = Hang Scr = HangState } 
	{ Exception Ex = Ladder Scr = LadderMoveUpState } 
	{ Exception Ex = AIR Scr = AirState } 
	{ Exception Ex = Jump Scr = AirState } 
	{ Exception Ex = WalkOffEdge Scr = AirState } 
	{ Exception Ex = DropToHang Scr = DropToHangState } 
	{ Exception Ex = Rail Scr = WalkingToRailTrick } 
	{ Exception Ex = Wallplant Scr = WallplantState } 
] 
SCRIPT JustStoppedSkatingState 
	IF istrue doublefistin_doublecanon = 1 
		HandleDoubleCanOff 
	ENDIF 
	IF NOT GotParam Restart 
		ResetEventHandlersFromTable JustStoppedSkatingState_ExceptionTable Group = WalkingStateExceptions 
		SetException Ex = BankDrop Scr = WalkingAirToTransitionTrick Group = WalkingTransitionTrickExceptions 
		SetException Ex = AcidDrop Scr = WalkingAirToTransitionTrick Group = WalkingTransitionTrickExceptions 
	ELSE 
		ResetEventHandlersFromTable JustStoppedSkatingState_Restart_ExceptionTable Group = WalkingStateExceptions 
		SetException Ex = BankDrop Scr = WalkingAirToTransitionTrick Group = WalkingTransitionTrickExceptions 
		SetException Ex = AcidDrop Scr = WalkingAirToTransitionTrick Group = WalkingTransitionTrickExceptions 
		PlayWalkAnim Anim = WStand BlendPeriod = 0 
		BlendPeriodOut 0 
		GetCameraId 
		<CameraId> : WalkCamera_Reset 
	ENDIF 
	SetEventHandler Ex = Trigger_L2 Scr = CameraFlushButton Group = WalkingEvents 
	SetEventHandler Ex = Release_X Scr = JumpButton Group = WalkingEvents 
	SetEventHandler Ex = MadeOtherSkaterBail Scr = MadeOtherSkaterBailWalk Group = WalkingCollideEvents 
	SetException Ex = SkaterCollideBail Scr = SkaterCollideBail Group = WalkingCollideEvents 
	SetTags WalkingGroundTricksInactive 
	Obj_SpawnScript ActivateGroundTricksDelay Id = ActivateGroundTricksDelay 
	SetWalkingTrickState NewWalkingTrickState = UNSET 
	IF CurrentScorePotGreaterThan 0 
		Obj_SpawnScript ComboRunOutTrickDisplayDelay Id = ComboRunOutTrickDisplayDelay 
	ENDIF 
	WaitWalking 
ENDSCRIPT

SkateToRunState_ExceptionTable = [ 
	{ Exception Ex = Stand Scr = SkateToStandState params = { SyncToPreviousAnim } } 
	{ Exception Ex = Skid Scr = SkateToStandState params = { SyncToPreviousAnim } } 
	{ Exception Ex = LadderOntoBottom Scr = LadderOntoBottomState } 
	{ Exception Ex = LadderOntoTop Scr = LadderOntoTopState } 
	{ Exception Ex = Jump Scr = RunJumpState } 
	{ Exception Ex = WalkOffEdge Scr = AirState } 
	{ Exception Ex = DropToHang Scr = DropToHangState } 
] 
SCRIPT SkateToRunState 
	ResetEventHandlersFromTable SkateToRunState_ExceptionTable Group = WalkingStateExceptions 
	SetEventHandler Ex = JumpRequested Scr = JumpRequestedEvent Group = WalkingEvents 
	SetWalkingTrickState NewWalkingTrickState = GROUND 
	Walk_ScaleAnimSpeed Off 
	IF AnimEquals WRunToSkate 
		RunSpeedChosenAnim Anims = [ SkateToWalk SkateToWalk WSkateToRun WSkateToRun ] Speeds = [ 1 1 1.29999995232 1.29999995232 ] BlendPeriod = 0.30000001192 SyncToReversePreviousAnim NoSpeedUpdate <...> 
	ELSE 
		RunSpeedChosenAnim Anims = [ SkateToWalk SkateToWalk WSkateToRun WSkateToRun ] Speeds = [ 1 1 1.29999995232 1.29999995232 ] BlendPeriod = 0.10000000149 NoSpeedUpdate <...> 
	ENDIF 
	Goto RunState 
ENDSCRIPT

SkateToStandState_ExceptionTable = [ 
	{ Exception Ex = Run Scr = SkateToRunState params = { SyncToPreviousAnim } } 
	{ Exception Ex = LadderOntoBottom Scr = LadderOntoBottomState } 
	{ Exception Ex = LadderOntoTop Scr = LadderOntoTopState } 
	{ Exception Ex = Jump Scr = RunJumpState } 
	{ Exception Ex = WalkOffEdge Scr = AirState } 
	{ Exception Ex = DropToHang Scr = DropToHangState } 
] 
SCRIPT SkateToStandState 
	ResetEventHandlersFromTable SkateToStandState_ExceptionTable Group = WalkingStateExceptions 
	SetEventHandler Ex = JumpRequested Scr = JumpRequestedEvent Group = WalkingEvents 
	SetWalkingTrickState NewWalkingTrickState = GROUND 
	Walk_ScaleAnimSpeed Off 
	IF AnimEquals [ SlowDownBrake NewBrakeIdle NewBrakeIdle3 NewBrakeIdle6 NewBrakeIdle7 NewBrakeIdle8 ] 
		PlayAnim Anim = BrakeToStand BlendPeriod = 0.30000001192 
	ELSE 
		IF AnimEquals WRunToSkate 
			PlayAnim Anim = SlowSkateToStand BlendPeriod = 0.30000001192 SyncToReversePreviousAnim EffectivePreviousAnimDuration = 0.50000000000 <...> 
		ELSE 
			PlayAnim Anim = SlowSkateToStand BlendPeriod = 0.10000000149 <...> 
		ENDIF 
	ENDIF 
	WaitAnimWalking 
	Goto StandState 
ENDSCRIPT

SkateToRotateState_ExceptionTable = [ 
	{ Exception Ex = Run Scr = SkateToRunState params = { SyncToPreviousAnim } } 
	{ Exception Ex = Stand Scr = SkateToStandState params = { SyncToPreviousAnim } } 
	{ Exception Ex = Skid Scr = SkateToStandState params = { SyncToPreviousAnim } } 
	{ Exception Ex = LadderOntoBottom Scr = LadderOntoBottomState } 
	{ Exception Ex = LadderOntoTop Scr = LadderOntoTopState } 
	{ Exception Ex = Jump Scr = RunJumpState } 
	{ Exception Ex = WalkOffEdge Scr = AirState } 
	{ Exception Ex = DropToHang Scr = DropToHangState } 
] 
SCRIPT SkateToRotateState 
	ResetEventHandlersFromTable SkateToRotateState_ExceptionTable Group = WalkingStateExceptions 
	SetEventHandler Ex = JumpRequested Scr = JumpRequestedEvent Group = WalkingEvents 
	SetWalkingTrickState NewWalkingTrickState = GROUND 
	Walk_ScaleAnimSpeed Off 
	IF AnimEquals WRunToSkate 
		PlayAnim Anim = SkateToWalk BlendPeriod = 0.30000001192 SyncToReversePreviousAnim <...> 
	ELSE 
		IF AnimEquals SkateToRun 
			PlayAnim Anim = SkateToRun BlendPeriod = 0.10000000149 <...> 
		ELSE 
			PlayAnim Anim = SkateToWalk BlendPeriod = 0.10000000149 <...> 
		ENDIF 
	ENDIF 
	WaitAnimWalking 
	Goto RunState 
ENDSCRIPT

SkateToAirState_ExceptionTable = [ 
	{ Exception Ex = Land Scr = LandState } 
	{ Exception Ex = Hang Scr = AirToHangState } 
	{ Exception Ex = Ladder Scr = LadderMoveUpState } 
	{ Exception Ex = Wallplant Scr = WallplantState } 
	{ Exception Ex = Wallplant Scr = WallplantState } 
] 
SCRIPT SkateToAirState 
	GetSpeed 
	SetTags ksk_speed = <Speed> 
	ResetEventHandlersFromTable SkateToAirState_ExceptionTable Group = WalkingStateExceptions 
	SetWalkingTrickState NewWalkingTrickState = AIR 
	Walk_ScaleAnimSpeed Off 
	PlayAnim Anim = AirIdleToJumpAir BlendPeriod = 0.30000001192 
	WaitAnimWalking 
	Goto AirState 
ENDSCRIPT

RunState_ExceptionTable = [ 
	{ Exception Ex = Stand Scr = StandState } 
	{ Exception Ex = LadderOntoBottom Scr = LadderOntoBottomState } 
	{ Exception Ex = LadderOntoTop Scr = LadderOntoTopState } 
	{ Exception Ex = Jump Scr = RunJumpState } 
	{ Exception Ex = WalkOffEdge Scr = AirState } 
	{ Exception Ex = DropToHang Scr = DropToHangState } 
	{ Exception Ex = Ride Scr = StandToRideState } 
] 
SCRIPT RunState 
	ResetEventHandlersFromTable RunState_ExceptionTable Group = WalkingStateExceptions 
	IF GotParam NoSkid 
		SetException Ex = Skid Scr = StandState Group = WalkingStateExceptions 
	ELSE 
		SetException Ex = Skid Scr = SkidState Group = WalkingStateExceptions 
	ENDIF 
	SetEventHandler Ex = JumpRequested Scr = JumpRequestedEvent Group = WalkingEvents 
	SetWalkingTrickState NewWalkingTrickState = GROUND 
	CycleSpeedChosenAnim Anims = [ WalkSlow WalkFast WRun FastRun ] Speeds = [ 63.88000106812 130.44000244141 350 520 ] BlendPeriod = 0.10000000149 
ENDSCRIPT

StandState_ExceptionTable = [ 
	{ Exception Ex = Run Scr = StandToRunState } 
	{ Exception Ex = LadderOntoBottom Scr = LadderOntoBottomState } 
	{ Exception Ex = LadderOntoTop Scr = LadderOntoTopState } 
	{ Exception Ex = Jump Scr = StandJumpState } 
	{ Exception Ex = WalkOffEdge Scr = AirState } 
	{ Exception Ex = DropToHang Scr = DropToHangState } 
	{ Exception Ex = Ride Scr = StandToRideState } 
] 
SCRIPT PlayWalkStandAnim 
	BEGIN 
		PlayWalkAnim BlendPeriod = 0.10000000149 Anim = RANDOM(3, 1) RANDOMCASE WStand RANDOMCASE RANDOM_NO_REPEAT(1, 1, 1, 1, 1, 1) RANDOMCASE WStandIdle1 RANDOMCASE WStandIdle2 RANDOMCASE WStandIdle3 RANDOMCASE WStandIdle4 RANDOMCASE WStandIdle5 RANDOMCASE WStandIdle6 RANDOMEND 
			WaitAnimWalking 
		REPEAT 
	ENDSCRIPT

	SCRIPT StandState 
		ResetEventHandlersFromTable StandState_ExceptionTable Group = WalkingStateExceptions 
		SetEventHandler Ex = JumpRequested Scr = JumpRequestedEvent Group = WalkingEvents 
		SetWalkingTrickState NewWalkingTrickState = GROUND 
		IF THUGPRO_THUGWalkingPhysicsOn 
			Walk_ScaleAnimSpeed Off 
			IF SpeedGreaterThan ( walk_parameters . max_fast_walk_speed ) 
				PlayWalkAnim Anim = _180RunSkid NoRestart From = 75 BlendPeriod = 0.50000000000 
				WaitAnim 40 Percent 
			ENDIF 
			PlayWalkAnim Anim = WStand NoRestart BlendPeriod = 0.30000001192 
			WaitAnimWalking 
		ELSE 
			GetSpeed 
			SetSpeed ( 0.44999998808 * <Speed> ) 
			Walk_ScaleAnimSpeed Off 
			IF AnimEquals [ _180RunSkid SkateToSkid ] 
				PlayWalkAnim Anim = WStand NoRestart BlendPeriod = 0.30000001192 
			ELSE 
				PlayWalkAnim Anim = WStand NoRestart BlendPeriod = 0.10000000149 
			ENDIF 
		ENDIF 
		WaitAnimWalking 
		PlayWalkStandAnim 
	ENDSCRIPT

	StandToRunState_ExceptionTable = [ 
		{ Exception Ex = Stand Scr = StandState } 
		{ Exception Ex = Skid Scr = StandState } 
		{ Exception Ex = LadderOntoBottom Scr = LadderOntoBottomState } 
		{ Exception Ex = LadderOntoTop Scr = LadderOntoTopState } 
		{ Exception Ex = Jump Scr = RunJumpState } 
		{ Exception Ex = WalkOffEdge Scr = AirState } 
		{ Exception Ex = DropToHang Scr = DropToHangState } 
		{ Exception Ex = Ride Scr = StandToRideState } 
	] 
	SCRIPT StandToRunState 
		ResetEventHandlersFromTable StandToRunState_ExceptionTable Group = WalkingStateExceptions 
		SetEventHandler Ex = JumpRequested Scr = JumpRequestedEvent Group = WalkingEvents 
		SetWalkingTrickState NewWalkingTrickState = GROUND 
		RunSpeedChosenAnim Anims = [ WStandToWalk WStandToWalk WStandToRun WStandToRun ] Speeds = [ 100 100 370 370 ] BlendPeriod = 0.10000000149 
		Goto RunState 
	ENDSCRIPT

	SkidState_ExceptionTable = [ 
		{ Exception Ex = Stand Scr = StandState } 
		{ Exception Ex = Run Scr = RunState } 
		{ Exception Ex = LadderOntoBottom Scr = LadderOntoBottomState } 
		{ Exception Ex = LadderOntoTop Scr = LadderOntoTopState } 
		{ Exception Ex = Jump Scr = RunJumpState } 
		{ Exception Ex = WalkOffEdge Scr = AirState } 
		{ Exception Ex = DropToHang Scr = DropToHangState } 
		{ Exception Ex = Ride Scr = StandToRideState } 
	] 
	SCRIPT SkidState 
		ResetEventHandlersFromTable SkidState_ExceptionTable Group = WalkingStateExceptions 
		SetEventHandler Ex = JumpRequested Scr = JumpRequestedEvent Group = WalkingEvents 
		SetWalkingTrickState NewWalkingTrickState = GROUND 
		Walk_ScaleAnimSpeed Off 
		PlayWalkAnim Anim = _180RunSkid NoRestart BlendPeriod = 0.10000000149 
		WaitAnimWalking 
		Goto StandState 
	ENDSCRIPT

	GroundPunchState_ExceptionTable = [ 
		{ Exception Ex = LadderOntoBottom Scr = LadderOntoBottomState } 
		{ Exception Ex = LadderOntoTop Scr = LadderOntoTopState } 
		{ Exception Ex = Jump Scr = RunJumpState } 
		{ Exception Ex = WalkOffEdge Scr = AirState } 
		{ Exception Ex = DropToHang Scr = DropToHangState } 
		{ Exception Ex = Ride Scr = StandToRideState } 
	] 
	SCRIPT GroundPunchState 
		ResetEventHandlersFromTable GroundPunchState_ExceptionTable Group = WalkingStateExceptions 
		SetEventHandler Ex = JumpRequested Scr = JumpRequestedEvent Group = WalkingEvents 
		SetWalkingTrickState NewWalkingTrickState = GROUND 
		Walk_ScaleAnimSpeed Off 
		PlayWalkAnim Anim = WalkingSlap BlendPeriod = 0.10000000149 To = 25 
		WaitAnimWalking 
		Goto GroundOrAirWaitState 
	ENDSCRIPT

	AirPunchState_ExceptionTable = [ 
		{ Exception Ex = Land Scr = LandState } 
		{ Exception Ex = Hang Scr = AirToHangState } 
		{ Exception Ex = Ladder Scr = LadderMoveUpState } 
		{ Exception Ex = Jump Scr = RunJumpState } 
		{ Exception Ex = Wallplant Scr = WallplantState } 
	] 
	SCRIPT AirPunchState 
		ResetEventHandlersFromTable AirPunchState_ExceptionTable Group = WalkingStateExceptions 
		SetWalkingTrickState NewWalkingTrickState = AIR 
		Walk_ScaleAnimSpeed Off 
		PlayWalkAnim Anim = WalkingSlap BlendPeriod = 0.10000000149 To = 25 
		WaitAnimWalking 
		Goto GroundOrAirWaitState 
	ENDSCRIPT

	RunJumpState_ExceptionTable = [ 
		{ Exception Ex = Land Scr = LandState } 
		{ Exception Ex = Hang Scr = AirToHangState } 
		{ Exception Ex = Ladder Scr = LadderMoveUpState } 
		{ Exception Ex = Wallplant Scr = WallplantState } 
	] 
	SCRIPT RunJumpState 
		ResetEventHandlersFromTable RunJumpState_ExceptionTable Group = WalkingStateExceptions 
		SetWalkingTrickState NewWalkingTrickState = AIR 
		Walk_ScaleAnimSpeed Off 
		PlayWalkAnim Anim = RunToJump BlendPeriod = 0.10000000149 
		WaitAnimWalking 
		Goto AirState 
	ENDSCRIPT

	StandJumpState_ExceptionTable = [ 
		{ Exception Ex = Land Scr = LandState } 
		{ Exception Ex = Hang Scr = AirToHangState } 
		{ Exception Ex = Ladder Scr = LadderMoveUpState } 
		{ Exception Ex = Wallplant Scr = WallplantState } 
	] 
	SCRIPT StandJumpState 
		ResetEventHandlersFromTable StandJumpState_ExceptionTable Group = WalkingStateExceptions 
		SetWalkingTrickState NewWalkingTrickState = AIR 
		Walk_ScaleAnimSpeed Off 
		PlayWalkAnim Anim = StandToJump BlendPeriod = 0.10000000149 
		WaitAnimWalking 
		Goto AirState 
	ENDSCRIPT

	WallplantState_ExceptionTable = [ 
		{ Exception Ex = Land Scr = LandState } 
		{ Exception Ex = Hang Scr = AirToHangState } 
		{ Exception Ex = Ladder Scr = LadderMoveUpState } 
		{ Exception Ex = Wallplant Scr = WallplantState } 
	] 
	SCRIPT WallplantState 
		ResetEventHandlersFromTable WallplantState_ExceptionTable Group = WalkingStateExceptions 
		SetWalkingTrickState NewWalkingTrickState = AIR 
		BroadcastEvent Type = SkaterWallplant 
		IF CurrentScorePotGreaterThan 0 
			SetTrickName #"Wall Jump" 
			SetTrickScore 100 
			Display 
		ENDIF 
		Walk_ScaleAnimSpeed Off 
		PlayWalkAnim Anim = Jump_DoubleJump BlendPeriod = 0.01999999955 
		WaitAnimWalking 
		Goto AirState 
	ENDSCRIPT

	AirState_ExceptionTable = [ 
		{ Exception Ex = Land Scr = LandState } 
		{ Exception Ex = Hang Scr = AirToHangState } 
		{ Exception Ex = Ladder Scr = LadderMoveUpState } 
		{ Exception Ex = Jump Scr = RunJumpState } 
		{ Exception Ex = Wallplant Scr = WallplantState } 
	] 
	SCRIPT AirState 
		GetSpeed 
		SetTags ksk_speed = <Speed> 
		ResetEventHandlersFromTable AirState_ExceptionTable Group = WalkingStateExceptions 
		SetWalkingTrickState NewWalkingTrickState = AIR 
		BlockTaggingOff 
		Walk_ScaleAnimSpeed Off 
		PlayWalkAnim Anim = JumpAir Cycle NoRestart BlendPeriod = 0.10000000149 
		WaitWalking 
	ENDSCRIPT

	LandState_ExceptionTable = [ 
		{ Exception Ex = Stand Scr = StandLandState } 
		{ Exception Ex = Run Scr = RunLandState } 
		{ Exception Ex = Skid Scr = SkidState } 
		{ Exception Ex = LadderOntoBottom Scr = LadderOntoBottomState } 
		{ Exception Ex = LadderOntoTop Scr = LadderOntoTopState } 
		{ Exception Ex = Jump Scr = RunJumpState } 
		{ Exception Ex = WalkOffEdge Scr = AirState } 
		{ Exception Ex = DropToHang Scr = DropToHangState } 
	] 
	SCRIPT LandState 
		ResetEventHandlersFromTable LandState_ExceptionTable Group = WalkingStateExceptions 
		SetWalkingTrickState NewWalkingTrickState = GROUND 
		SetEventHandler Ex = JumpRequested Scr = JumpRequestedEvent Group = WalkingEvents 
		WaitWalking 
	ENDSCRIPT

	StandLandState_ExceptionTable = [ 
		{ Exception Ex = Run Scr = RunState } 
		{ Exception Ex = Skid Scr = SkidState } 
		{ Exception Ex = LadderOntoBottom Scr = LadderOntoBottomState } 
		{ Exception Ex = LadderOntoTop Scr = LadderOntoTopState } 
		{ Exception Ex = Jump Scr = StandJumpState } 
		{ Exception Ex = WalkOffEdge Scr = AirState } 
		{ Exception Ex = DropToHang Scr = DropToHangState } 
	] 
	SCRIPT StandLandState 
		ResetEventHandlersFromTable StandLandState_ExceptionTable Group = WalkingStateExceptions 
		SetWalkingTrickState NewWalkingTrickState = GROUND 
		Walk_ScaleAnimSpeed Off 
		IF THUGPRO_THUGWalkingPhysicsOn 
			IF SpeedGreaterThan ( walk_parameters . max_fast_walk_speed ) 
				PlayWalkAnim Anim = _180RunSkid NoRestart To = 10 BlendPeriod = 0.00000000000 
			ELSE 
				PlayWalkAnim Anim = JumpLandToStand BlendPeriod = 0.05000000075 
			ENDIF 
		ELSE 
			PlayWalkAnim Anim = JumpLandToStand BlendPeriod = 0.05000000075 
		ENDIF 
		WaitAnimWalking 
		Goto StandState 
	ENDSCRIPT

	RunLandState_ExceptionTable = [ 
		{ Exception Ex = Stand Scr = StandState } 
		{ Exception Ex = Skid Scr = SkidState } 
		{ Exception Ex = LadderOntoBottom Scr = LadderOntoBottomState } 
		{ Exception Ex = LadderOntoTop Scr = LadderOntoTopState } 
		{ Exception Ex = Jump Scr = RunJumpState } 
		{ Exception Ex = WalkOffEdge Scr = AirState } 
		{ Exception Ex = DropToHang Scr = DropToHangState } 
	] 
	SCRIPT RunLandState 
		ResetEventHandlersFromTable RunLandState_ExceptionTable Group = WalkingStateExceptions 
		SetWalkingTrickState NewWalkingTrickState = GROUND 
		RunSpeedChosenAnim Anims = [ JumpLandToWalk JumpLandToWalk JumpLandToRun JumpLandToRun ] Speeds = [ 1.50000000000 1.50000000000 1.75000000000 1.75000000000 ] BlendPeriod = 0.10000000149 NoSpeedUpdate 
		BlendPeriodOut 0.30000001192 
		WaitAnimWalking 
		Goto RunState 
	ENDSCRIPT

	HangState_ExceptionTable = [ 
		{ Exception Ex = HangMoveLeft Scr = HangMoveLeftState } 
		{ Exception Ex = HangMoveRight Scr = HangMoveRightState } 
		{ Exception Ex = AIR Scr = HangToAirState } 
		{ Exception Ex = Jump Scr = HangToAirState } 
		{ Exception Ex = PullUpFromHang Scr = PullUpFromHangState } 
	] 
	SCRIPT HangState 
		THUGPRO_ToggleHangControls on 
		ResetEventHandlersFromTable HangState_ExceptionTable Group = WalkingStateExceptions 
		SetEventHandler Ex = JumpRequested Scr = JumpRequestedEvent Group = WalkingEvents 
		SetWalkingTrickState NewWalkingTrickState = Off 
		LaunchStateChangeEvent State = Skater_InHang 
		Walk_ScaleAnimSpeed Off 
		IF AnimEquals [ JumpToSwingHang JumpToWallHang ] 
			WaitAnimWalking 
		ENDIF 
		PlayWalkAnim Anim = HangIdle Cycle NoRestart BlendPeriod = 0.30000001192 
		WaitWalking 
	ENDSCRIPT

	AirToHangState_ExceptionTable = [ 
		{ Exception Ex = HangMoveLeft Scr = HangMoveLeftState } 
		{ Exception Ex = HangMoveRight Scr = HangMoveRightState } 
		{ Exception Ex = AIR Scr = HangToAirState } 
		{ Exception Ex = Jump Scr = HangToAirState } 
		{ Exception Ex = PullUpFromHang Scr = PullUpFromHangState } 
	] 
	SCRIPT AirToHangState 
		THUGPRO_ToggleHangControls on 
		ResetEventHandlersFromTable AirToHangState_ExceptionTable Group = WalkingStateExceptions 
		SetEventHandler Ex = JumpRequested Scr = JumpRequestedEvent Group = WalkingEvents 
		SetWalkingTrickState NewWalkingTrickState = Off 
		LaunchStateChangeEvent State = Skater_InHang 
		Walk_ScaleAnimSpeed Off 
		Walk_GetHangInitAnimType 
		GetSingleTag ksk_speed 
		SWITCH <HangInitAnimType> 
			CASE SWING 
				PlayWalkAnim Anim = JumpToSwingHang BlendPeriod = 0 
			CASE WALL 
				PlayWalkAnim Anim = JumpToWallHang BlendPeriod = 0 
		ENDSWITCH 
		WaitAnimWalking 
		Goto HangState 
	ENDSCRIPT

	SCRIPT PlayHangMoveAnimCycle 
		BlendPeriodOut 0.30000001192 
		PreviousPartialAnim = UndeterminedOverlay 
		OnExitRun PlayHangMoveAnimCycle_cleanup 
		BEGIN 
			Walk_GetHangAngle 
			IF GotParam ReverseAngle 
				HangAngle = ( 0 - <HangAngle> ) 
			ENDIF 
			IF ( ( <HangAngle> < 5 ) & ( <HangAngle> > -5 ) ) 
				PartialAnim = NoOverlay 
			ELSE 
				IF ( <HangAngle> > 0 ) 
					IF ( <HangAngle> < 15 ) 
						AppendSuffixToChecksum Base = <HangAnim> SuffixString = "10_Partial" 
						PartialAnim = <appended_id> 
					ELSE 
						IF ( <HangAngle> < 25 ) 
							AppendSuffixToChecksum Base = <HangAnim> SuffixString = "20_Partial" 
							PartialAnim = <appended_id> 
						ELSE 
							IF ( <HangAngle> < 35 ) 
								AppendSuffixToChecksum Base = <HangAnim> SuffixString = "30_Partial" 
								PartialAnim = <appended_id> 
							ELSE 
								AppendSuffixToChecksum Base = <HangAnim> SuffixString = "40_Partial" 
								PartialAnim = <appended_id> 
							ENDIF 
						ENDIF 
					ENDIF 
				ELSE 
					IF ( <HangAngle> > -15 ) 
						AppendSuffixToChecksum Base = <HangAnim> SuffixString = "10_PartialUp" 
						PartialAnim = <appended_id> 
					ELSE 
						IF ( <HangAngle> > -25 ) 
							AppendSuffixToChecksum Base = <HangAnim> SuffixString = "20_PartialUp" 
							PartialAnim = <appended_id> 
						ELSE 
							IF ( <HangAngle> > -35 ) 
								AppendSuffixToChecksum Base = <HangAnim> SuffixString = "30_PartialUp" 
								PartialAnim = <appended_id> 
							ELSE 
								AppendSuffixToChecksum Base = <HangAnim> SuffixString = "40_PartialUp" 
								PartialAnim = <appended_id> 
							ENDIF 
						ENDIF 
					ENDIF 
				ENDIF 
			ENDIF 
			IF NOT ( <PreviousPartialAnim> = <PartialAnim> ) 
				PlayAnim Anim = <HangAnim> Cycle <SyncToPreviousAnim> BlendPeriod = 0.10000000149 
				IF ( <PartialAnim> = NoOverlay ) 
					IF Obj_AnimSubsetExists SubsetId = Hanging 
						Obj_SetAnimSubsetWeight SubsetId = Hanging BlendWeight = 0.00000000000 
						Obj_SetAnimSubsetWeight BlendWeight = 1.00000000000 
					ENDIF 
				ELSE 
					IF NOT Obj_AnimSubsetExists SubsetId = Hanging 
						Obj_AddAnimSubset SubsetId = Hanging 
						IF Obj_AnimationFlipped 
							Obj_Flip SubsetId = Hanging 
						ENDIF 
					ENDIF 
					Obj_SetAnimSubsetWeight SubsetId = Hanging BlendWeight = 0.50000000000 
					PlayAnim SubsetId = Hanging Anim = <PartialAnim> Cycle <SyncToPreviousAnim> BlendPeriod = 0.10000000149 
				ENDIF 
			ENDIF 
			PreviousPartialAnim = <PartialAnim> 
			SyncToPreviousAnim = SyncToPreviousAnim 
			DoNextManualTrick ScriptToRunFirst = BeginWalkingManualTrick FromWalk 
			DoNextTrick ScriptToRunFirst = BeginWalkingGenericTrick 
			wait 1 GameFrame 
		REPEAT 
	ENDSCRIPT

	SCRIPT PlayHangMoveAnimCycle_cleanup 
		IF Obj_AnimSubsetExists SubsetId = Hanging 
			Obj_RemoveAnimSubset SubsetId = Hanging 
		ENDIF 
	ENDSCRIPT

	HangMoveLeftState_ExceptionTable = [ 
		{ Exception Ex = Hang Scr = HangState } 
		{ Exception Ex = HangMoveRight Scr = HangMoveRightState } 
		{ Exception Ex = AIR Scr = HangToAirState } 
		{ Exception Ex = Jump Scr = HangToAirState } 
		{ Exception Ex = PullUpFromHang Scr = PullUpFromHangState } 
	] 
	SCRIPT HangMoveLeftState 
		ResetEventHandlersFromTable HangMoveLeftState_ExceptionTable Group = WalkingStateExceptions 
		SetEventHandler Ex = JumpRequested Scr = JumpRequestedEvent Group = WalkingEvents 
		SetWalkingTrickState NewWalkingTrickState = Off 
		LaunchStateChangeEvent State = Skater_InHang 
		Walk_ScaleAnimSpeed HangMove 
		IF Flipped 
			PlayHangMoveAnimCycle HangAnim = HangLeft ReverseAngle 
		ELSE 
			PlayHangMoveAnimCycle HangAnim = HangRight ReverseAngle 
		ENDIF 
	ENDSCRIPT

	HangMoveRightState_ExceptionTable = [ 
		{ Exception Ex = Hang Scr = HangState } 
		{ Exception Ex = HangMoveLeft Scr = HangMoveLeftState } 
		{ Exception Ex = AIR Scr = HangToAirState } 
		{ Exception Ex = Jump Scr = HangToAirState } 
		{ Exception Ex = PullUpFromHang Scr = PullUpFromHangState } 
	] 
	SCRIPT HangMoveRightState 
		ResetEventHandlersFromTable HangMoveRightState_ExceptionTable Group = WalkingStateExceptions 
		SetEventHandler Ex = JumpRequested Scr = JumpRequestedEvent Group = WalkingEvents 
		SetWalkingTrickState NewWalkingTrickState = Off 
		LaunchStateChangeEvent State = Skater_InHang 
		Walk_ScaleAnimSpeed HangMove 
		IF Flipped 
			PlayHangMoveAnimCycle HangAnim = HangRight 
		ELSE 
			PlayHangMoveAnimCycle HangAnim = HangLeft 
		ENDIF 
	ENDSCRIPT

	HangToAirState_ExceptionTable = [ 
		{ Exception Ex = Land Scr = LandState } 
		{ Exception Ex = Hang Scr = AirToHangState } 
		{ Exception Ex = Ladder Scr = LadderMoveUpState } 
		{ Exception Ex = Wallplant Scr = WallplantState } 
	] 
	SCRIPT HangToAirState 
		ResetEventHandlersFromTable HangToAirState_ExceptionTable Group = WalkingStateExceptions 
		ClearException JumpRequested 
		SetWalkingTrickState NewWalkingTrickState = AIR 
		Walk_ScaleAnimSpeed Off 
		PlayWalkAnim Anim = HangIdleToDrop BlendPeriod = 0.05000000075 
		WaitAnimWalking 
		Goto AirState 
	ENDSCRIPT

	PullUpFromHangState_ExceptionTable = [ 
		{ Exception Ex = Jump Scr = AirState } 
	] 
	SCRIPT PullUpFromHangState 
		ResetEventHandlersFromTable PullUpFromHangState_ExceptionTable Group = WalkingStateExceptions 
		SetWalkingTrickState NewWalkingTrickState = Off 
		LaunchStateChangeEvent State = Skater_InHang 
		Walk_ScaleAnimSpeed Off 
		PlayWalkAnim Anim = HangOnToTheTop BlendPeriod = 0.05000000075 Speed = ( walk_parameters . hang_anim_wait_speed ) 
		WaitAnimWalking 
		Walk_AnimWaitComplete 
		PlayWalkAnim Anim = WStand Cycle BlendPeriod = 0.30000001192 
		Goto GroundOrAirWaitState 
	ENDSCRIPT

	DropToHangState_ExceptionTable = [ 
		{ Exception Ex = Jump Scr = AirState } 
	] 
	SCRIPT DropToHangState 
		THUGPRO_ToggleHangControls on 
		ResetEventHandlersFromTable DropToHangState_ExceptionTable Group = WalkingStateExceptions 
		SetWalkingTrickState NewWalkingTrickState = Off 
		LaunchStateChangeEvent State = Skater_InHang 
		Walk_ScaleAnimSpeed Off 
		PlayWalkAnim Anim = StandToHang BlendPeriod = 0.30000001192 Speed = ( walk_parameters . hang_anim_wait_speed ) 
		WaitAnimWalking 
		Walk_AnimWaitComplete 
		Goto HangState 
	ENDSCRIPT

	LadderOntoBottomState_ExceptionTable = [ 
		{ Exception Ex = Jump Scr = AirState } 
	] 
	SCRIPT LadderOntoBottomState 
		ResetEventHandlersFromTable LadderOntoBottomState_ExceptionTable Group = WalkingStateExceptions 
		SetWalkingTrickState NewWalkingTrickState = Off 
		LaunchStateChangeEvent State = Skater_OnLadder 
		Walk_ScaleAnimSpeed Off 
		PlayWalkAnim Anim = LadderClimbFromStandIdle BlendPeriod = 0.30000001192 Speed = ( walk_parameters . ladder_anim_wait_speed ) 
		WaitAnimWalking 
		Walk_AnimWaitComplete 
		Goto LadderMoveUpState 
	ENDSCRIPT

	LadderOntoTopState_ExceptionTable = [ 
		{ Exception Ex = Jump Scr = AirState } 
	] 
	SCRIPT LadderOntoTopState 
		ResetEventHandlersFromTable LadderOntoTopState_ExceptionTable Group = WalkingStateExceptions 
		SetWalkingTrickState NewWalkingTrickState = Off 
		LaunchStateChangeEvent State = Skater_OnLadder 
		Walk_ScaleAnimSpeed Off 
		PlayWalkAnim Anim = LadderOntoTheTop Backwards BlendPeriod = 0.30000001192 Speed = ( walk_parameters . ladder_anim_wait_speed ) 
		WaitAnimWalking 
		Walk_AnimWaitComplete 
		Goto LadderMoveDownState 
	ENDSCRIPT

	LadderMoveUpState_ExceptionTable = [ 
		{ Exception Ex = LadderMoveDown Scr = LadderMoveDownState params = { SyncToPreviousAnim } } 
		{ Exception Ex = LadderOffBottom Scr = LadderOffBottomState } 
		{ Exception Ex = LadderOffTop Scr = LadderOffTopState } 
		{ Exception Ex = Jump Scr = AirState } 
	] 
	SCRIPT LadderMoveUpState 
		ResetEventHandlersFromTable LadderMoveUpState_ExceptionTable Group = WalkingStateExceptions 
		SetEventHandler Ex = JumpRequested Scr = JumpRequestedEvent Group = WalkingEvents 
		SetWalkingTrickState NewWalkingTrickState = Off 
		LaunchStateChangeEvent State = Skater_OnLadder 
		Walk_ScaleAnimSpeed LadderMove 
		PlayWalkAnim Anim = LadderFastClimb Cycle BlendPeriod = 0.30000001192 <...> 
		WaitAnimWalking 
	ENDSCRIPT

	LadderMoveDownState_ExceptionTable = [ 
		{ Exception Ex = LadderMoveUp Scr = LadderMoveUpState params = { SyncToPreviousAnim } } 
		{ Exception Ex = LadderOffBottom Scr = LadderOffBottomState } 
		{ Exception Ex = LadderOffTop Scr = LadderOffTopState } 
		{ Exception Ex = Jump Scr = AirState } 
	] 
	SCRIPT LadderMoveDownState 
		ResetEventHandlersFromTable LadderMoveDownState_ExceptionTable Group = WalkingStateExceptions 
		SetEventHandler Ex = JumpRequested Scr = JumpRequestedEvent Group = WalkingEvents 
		SetWalkingTrickState NewWalkingTrickState = Off 
		LaunchStateChangeEvent State = Skater_OnLadder 
		Walk_ScaleAnimSpeed LadderMove 
		PlayWalkAnim Anim = LadderFastClimb Cycle Backwards BlendPeriod = 0.30000001192 <...> 
		WaitAnimWalking 
	ENDSCRIPT

	LadderOffBottomState_ExceptionTable = [ 
		{ Exception Ex = Jump Scr = AirState } 
	] 
	SCRIPT LadderOffBottomState 
		ResetEventHandlersFromTable LadderOffBottomState_ExceptionTable Group = WalkingStateExceptions 
		SetWalkingTrickState NewWalkingTrickState = Off 
		LaunchStateChangeEvent State = Skater_OnLadder 
		Walk_ScaleAnimSpeed Off 
		PlayWalkAnim Anim = LadderClimbFromStandIdle Backwards BlendPeriod = 0.30000001192 Speed = ( walk_parameters . ladder_anim_wait_speed ) 
		WaitAnimWalking 
		Walk_AnimWaitComplete 
		PlayWalkAnim Anim = WStand Cycle BlendPeriod = 0.30000001192 
		Goto GroundOrAirWaitState 
	ENDSCRIPT

	LadderOffTopState_ExceptionTable = [ 
		{ Exception Ex = Jump Scr = AirState } 
	] 
	SCRIPT LadderOffTopState 
		ResetEventHandlersFromTable LadderOffTopState_ExceptionTable Group = WalkingStateExceptions 
		SetWalkingTrickState NewWalkingTrickState = Off 
		LaunchStateChangeEvent State = Skater_OnLadder 
		Walk_ScaleAnimSpeed Off 
		PlayWalkAnim Anim = LadderOntoTheTop BlendPeriod = 0.30000001192 Speed = ( walk_parameters . ladder_anim_wait_speed ) 
		WaitAnimWalking 
		Walk_AnimWaitComplete 
		PlayWalkAnim Anim = WStand Cycle BlendPeriod = 0.30000001192 
		Goto GroundOrAirWaitState 
	ENDSCRIPT

	SCRIPT WalkBailState 
		ClearExceptionGroup WalkingStateExceptions 
		BailSkaterTricks 
		DisablePlayerInput AllowCameraControl 
		InBail 
		BashOn 
		Obj_SpawnScript BailBoardControl params = { BoardOffFrame = 10 BoardVel = VECTOR(0.00000000000, 0.00000000000, 200.00000000000) BoardRotVel = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) BoardSkaterVel = 1 } 
		Walk_ScaleAnimSpeed Off 
		PlayWalkAnim Anim = WalkingBail 
		Obj_WaitAnimFinished 
		PlayWalkAnim Anim = WalkingBail PingPong From = End To = 100 Speed = 0.80000001192 BlendPeriod = 0.10000000149 
		WaitForEvent Type = Stand 
		PlayWalkAnim Anim = WalkingBailGetUp 
		Obj_WaitAnimFinished 
		SwitchOnBoard 
		BailDone 
		Goto StandState 
	ENDSCRIPT

	GroundOrAirWaitState_ExceptionTable = [ 
		{ Exception Ex = Run Scr = RunState } 
		{ Exception Ex = Stand Scr = StandState } 
		{ Exception Ex = Skid Scr = SkidState } 
		{ Exception Ex = Hang Scr = AirToHangState } 
		{ Exception Ex = Ladder Scr = LadderMoveUpState } 
		{ Exception Ex = LadderOntoBottom Scr = LadderOntoBottomState } 
		{ Exception Ex = LadderOntoTop Scr = LadderOntoTopState } 
		{ Exception Ex = Land Scr = LandState } 
		{ Exception Ex = AIR Scr = AirState } 
		{ Exception Ex = Jump Scr = StandJumpState } 
		{ Exception Ex = WalkOffEdge Scr = AirState } 
		{ Exception Ex = DropToHang Scr = DropToHangState } 
		{ Exception Ex = Rail Scr = WalkingToRailTrick } 
		{ Exception Ex = Wallplant Scr = WallplantState } 
	] 
	SCRIPT GroundOrAirWaitState 
		ResetEventHandlersFromTable GroundOrAirWaitState_ExceptionTable Group = WalkingStateExceptions 
		SetException Ex = BankDrop Scr = WalkingAirToTransitionTrick Group = WalkingTransitionTrickExceptions 
		SetException Ex = AcidDrop Scr = WalkingAirToTransitionTrick Group = WalkingTransitionTrickExceptions 
		WaitWalking 
	ENDSCRIPT

	SCRIPT StandToRideState 
		ClearAllWalkingExceptions 
		Goto RideState 
	ENDSCRIPT

	SCRIPT RideState 
		ClearExceptionGroup WalkingStateExceptions 
		SetException Ex = Stand Scr = RideToStandState Group = WalkingStateExceptions 
		BEGIN 
			wait 1 GameFrame 
		REPEAT 
	ENDSCRIPT

	SCRIPT RideToStandState 
		ClearExceptionGroup WalkingStateExceptions 
		Goto StandState 
	ENDSCRIPT

	SCRIPT CameraFlushButton 
		GetCameraId 
		<CameraId> : WalkCamera_FlushRequest 
	ENDSCRIPT

	SCRIPT JumpButton 
		LaunchEvent Type = JumpRequested 
	ENDSCRIPT

	SCRIPT JumpRequestedEvent 
		ClearEventHandler JumpRequested 
		IF NOT Walking 
			RETURN 
		ENDIF 
		Walk_GetState 
		SWITCH <State> 
			CASE WALKING_GROUND 
				Walk_Jump 
				LaunchEvent Type = Jump 
			CASE WALKING_AIR 
				Walk_GetStateTime 
				IF ( <StateTime> < Skater_Late_Jump_Slop ) 
					Walk_Jump 
					LaunchEvent Type = Jump 
				ENDIF 
			CASE WALKING_HANG 
				Walk_GetStateDuration 
				IF ( <StateDuration> > 0.50000000000 ) 
					Walk_Jump 
					LaunchEvent Type = Jump 
				ELSE 
					Walk_GetPreviousState 
					IF NOT ( <PreviousState> = WALKING_AIR ) 
						Walk_Jump 
						LaunchEvent Type = Jump 
					ELSE 
						SetEventHandler Ex = JumpRequested Scr = JumpRequestedEvent Group = WalkingEvents 
					ENDIF 
				ENDIF 
			CASE WALKING_LADDER 
				Walk_Jump 
				LaunchEvent Type = Jump 
			CASE WALKING_ANIMWAIT 
				Walk_Jump 
				LaunchEvent Type = Jump 
		ENDSWITCH 
	ENDSCRIPT

	SCRIPT TakeBoardFromSkater 
		SetBoardMissing 
		SwitchOffBoard 
	ENDSCRIPT

	SCRIPT ReturnBoardToSkater 
		UnsetBoardMissing 
		IF Walking 
			GetTags 
			SWITCH <WalkingTricksState> 
				CASE GROUND 
					SetWalkingGroundTricks 
				CASE AIR 
					SetWalkingAirTricks 
				CASE Off 
					SetWalkingOffTricks 
			ENDSWITCH 
		ENDIF 
		SwitchOnBoard 
		IF Obj_AnimSubsetExists SubsetId = WalkOnly 
			Obj_RemoveAnimSubset SubsetId = WalkOnly 
		ENDIF 
	ENDSCRIPT

	SCRIPT flip_skater_if_180_off 
		IF InVertAir 
			RETURN 
		ENDIF 
		GetActualSpin 
		BEGIN 
			IF ( ( <spin> > 360 ) | ( <spin> = 360 ) ) 
				spin = ( <spin> - 360 ) 
			ELSE 
				BREAK 
			ENDIF 
		REPEAT 
		IF ( <spin> < 270 ) 
			IF ( <spin> > 90 ) 
				FlipAfter 
				RotateAfter 
				BlendPeriodOut 0 
			ENDIF 
		ENDIF 
	ENDSCRIPT

	max_sticker_streak_angle = 60.00000000000 
	max_graffiti_streak_angle = 60.00000000000 
	SCRIPT tag_wall_standing 
		MakeSkaterGoto spawned_wall_tag 
	ENDSCRIPT

	SCRIPT tag_wall_hanging 
		MakeSkaterGoto spawned_wall_tag params = { Anim = hanging_tag is_hanging } 
	ENDSCRIPT

	SCRIPT spawned_wall_tag Anim = standing_tag2 
		OnExitRun TagClearFlagsScript 
		ProjectilesOff 
		EnterTagging 
		ClearExceptionGroup WalkingStateExceptions 
		DisablePlayerInput AllowCameraControl 
		SetException Ex = SkaterCollideBail Scr = SkaterCollideBail 
		Walk_ScaleAnimSpeed Off 
		IF SkaterIsNamed skater_shrek 
			IF GotParam is_hanging 
				Anim = Shrek_BurpHangingTag 
			ELSE 
				Anim = Shrek_BurpTag 
			ENDIF 
		ELSE 
			IF ( Graffiti_Tag_style = 1 ) 
				IF GotParam is_hanging 
					Anim = Shrek_BurpHangingTag 
				ELSE 
					Anim = Shrek_BurpTag 
				ENDIF 
			ELSE 
				Obj_SpawnScript THUG2_SFX_Tag_Spray_Wallplant 
				TurnOnSpecialItem specialitem_details = spraycan_details 
			ENDIF 
		ENDIF 
		PlayAnim Anim = <Anim> BlendPeriod = 0.40000000596 
		BEGIN 
			IF Released Triangle 
				IF NOT SkaterIsNamed skater_shrek 
					StopSound SK6_Walk_Spray_Tag_01 
				ENDIF 
				BREAK 
			ENDIF 
			IF AnimFinished 
				IF held Triangle 
					wait 0.05000000075 Second 
				ENDIF 
				BREAK 
			ENDIF 
			waitonegameframe 
		REPEAT 
		EnablePlayerInput 
		IF GotParam is_hanging 
			Goto HangState 
		ELSE 
			Goto GroundOrAirWaitState 
		ENDIF 
	ENDSCRIPT

	SCRIPT TagClearFlagsScript 
		ProjectilesOn 
		ExitTagging 
		TagClearFlags 
		TurnOffSpecialItem 
		SprayPaintOff 
	ENDSCRIPT

	SCRIPT GraffitiTagTrick 
		printf "graffiti tag" 
		IF GotParam tag_size 
			SetTrickScore ( <tag_size> * 10 ) 
		ELSE 
			SetTrickScore 100 
		ENDIF 
		SetTrickName "Graffiti Tag" 
		Display 
	ENDSCRIPT

	SCRIPT walking_wallplant_switch 
		SetTags InWalkingWallplant = 1 
		MakeSkaterGoto walking_wallplant_switch2 
	ENDSCRIPT

	SCRIPT walking_wallplant_switch2 
		Walk_ScaleAnimSpeed Off 
		PlayAnim Anim = JumpAirToAirIdle Speed = 3.00000000000 
		CleanUp_WalkingtoSkating 
		WaitAnimWhilstChecking 
		rotate y angle = 180 
		WalkingWallplant 
		Goto Airborne params = { NoSkateToWalkTricks } 
	ENDSCRIPT

	StanceToggleRunning_ExceptionTable = [ 
		{ Exception Ex = Stand Scr = StanceToggleStanding params = { SyncToPreviousAnim } } 
		{ Exception Ex = Skid Scr = StanceToggleStanding params = { SyncToPreviousAnim } } 
		{ Exception Ex = WalkOffEdge Scr = AirState } 
	] 
	StanceToggleStanding_ExceptionTable = [ 
		{ Exception Ex = Run Scr = StanceToggleRunning params = { SyncToPreviousAnim } } 
		{ Exception Ex = WalkOffEdge Scr = AirState } 
	] 
	SCRIPT Walking_Stance_Toggle 
		ClearTrickQueues 
		SetQueueTricks NoTricks 
		SwitchToWalkingPhysics 
		SetEventHandler Ex = Trigger_L2 Scr = CameraFlushButton Group = WalkingEvents 
		SetEventHandler Ex = Release_X Scr = JumpButton Group = WalkingEvents 
		SetEventHandler Ex = MadeOtherSkaterBail Scr = MadeOtherSkaterBailWalk Group = WalkingCollideEvents 
		SetException Ex = SkaterCollideBail Scr = SkaterCollideBail Group = WalkingCollideEvents 
		GetSpeed 
		IF ( <Speed> > 10 ) 
			MakeSkaterGoto StanceToggleRunning params = { BlendPeriod = 0 } 
		ELSE 
			MakeSkaterGoto StanceToggleStanding params = { BlendPeriod = 0 } 
		ENDIF 
	ENDSCRIPT

	
