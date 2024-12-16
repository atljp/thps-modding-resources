
SCRIPT TwoWayLoopCheck 
	IF NOT InAir 
		IF Obj_FlagSet FLAG_SKATER_INLOOP 
			printf "In the loop and so making you land" 
			Obj_ClearFlag FLAG_SKATER_INLOOP 
			SetRollingFriction default 
			LockVelocityDirection Off 
			IF DoingTrick 
				SetSlomo 1 
				kill_blur 
				MakeSkaterGoto Facesmash 
			ELSE 
				SetlandedFromVert 
				SetSlomo 1 
				kill_blur 
				MakeSkaterGoto Land 
			ENDIF 
		ELSE 
			Obj_SetFlag FLAG_SKATER_INLOOP 
			MakeSkaterGoto LoopGapStart 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT LoopGapStart 
	OnGroundExceptions 
	SetException Ex = Ollied Scr = LoopGapOllie 
	SetException Ex = Landed Scr = Land 
	OnExceptionRun LoopGapOut 
	LockVelocityDirection On 
	SetQueueTricks special = SpecialTricks AirTricks 
	SetExtraGrindTricks special = SpecialGrindTricks GrindTricks 
	SetManualTricks special = SpecialManualTricks ManualTricks 
	PlayAnim Anim = AirIdle Cycle NoRestart 
	BEGIN 
		DoNextTrick 
		Obj_GetSpeed 
		IF ( <speed> < 25 ) 
			setstate air 
			LockVelocityDirection Off 
			create_panel_message text = "Going too slow!!!" pos = PAIR(320.00000000000, 200.00000000000) 
			Obj_ClearFlag FLAG_SKATER_INLOOP 
			IF NOT DoingTrick 
				Goto Airborne 
			ENDIF 
		ENDIF 
		Wait 1 game frame 
	REPEAT 
ENDSCRIPT

SCRIPT LoopGapOllie 
	playJumpsound 
	PlayAnim Anim = Ollie 
	Goto LoopGapStart 
ENDSCRIPT

SCRIPT LoopGapOut 
	LockVelocityDirection Off 
ENDSCRIPT

SCRIPT Loop Name = #"Loop Balance" Score = 5000 InitAnim = CrouchIdle FromAirAnim = ManualFromAir BalanceAnim = CrouchIdle OffMeterTop = ManualBail OffMeterBottom = ManualBail 
	ClearExceptions 
	IF InAir 
		Goto LoopOllie 
	ENDIF 
	Obj_SetFlag FLAG_SKATER_INLOOP 
	OnExceptionRun LoopException 
	SetException Ex = Ollied Scr = LoopOllie 
	ClearLipCombos 
	SetException Ex = GroundGone Scr = LoopOllie 
	SetException Ex = MadeOtherSkaterBail Scr = MadeOtherSkaterBail_Called 
	SetException Ex = OffMeterTop Scr = NoseManualBail 
	SetException Ex = OffMeterBottom Scr = ManualBail 
	SetException Ex = SkaterCollideBail Scr = SkaterCollideBail 
	SetException Ex = RunHasEnded Scr = EndOfRun 
	SetException Ex = GoalHasEnded Scr = Goal_EndOfRun 
	SetQueueTricks NoTricks 
	SetManualTricks NoTricks 
	StartBalanceTrick 
	Vibrate Actuator = 1 Percent = 25 
	SetRollingFriction 2 
	PlayAnim Anim = CrouchBumpUp_Crappy 
	SetTrickName <Name> 
	SetTrickScore 5000 
	Display Blockspin 
	BEGIN 
		Obj_GetSpeed 
		IF ( <speed> < 20 ) 
			Obj_ClearFlag FLAG_SKATER_INLOOP 
			IF InSplitScreenGame 
			ELSE 
				create_panel_message text = "Not Enough Speed" id = perfect rgba = [ 200 50 50 128 ] PAIR(320.00000000000, 150.00000000000) style = sloppy_style 
			ENDIF 
			Goto LoopOllie 
		ENDIF 
		WaitOneGameFrame 
	REPEAT 
ENDSCRIPT

SCRIPT LoopException 
	Obj_ClearFlag FLAG_SKATER_INLOOP 
ENDSCRIPT

SCRIPT LoopOllie 
	StopBalanceTrick 
	Obj_ClearFlag FLAG_SKATER_INLOOP 
	SetTags LoopBailTriggerd = 1 
	SetTags NoLoopLandBail = 0 
	IF AbsolutePitchGreaterThan 80 
		Move y = 13 
		SetSpeed 0 
	ENDIF 
	IF AbsolutePitchGreaterThan 40 
		SetSpeed 1 
	ENDIF 
	IF Walking 
		Goto WalkBailState 
	ELSE 
		Goto NoseManualBailSlow 
	ENDIF 
ENDSCRIPT

SCRIPT LoopLand 
	GetSingleTag LoopBailTriggerd 
	GetSingleTag NoLoopLandBail 
	IF Obj_FlagSet FLAG_SKATER_INLOOP 
		StopBalanceTrick 
		IF InSplitScreenGame 
		ELSE 
			GetNumberOfTrickOccurrences TrickText = #"Loop Balance" 
			IF ( <number_of_occurrences> > 1 ) 
				FormatText TextName = loop_count_string "Loop Combo x %a !" a = <number_of_occurrences> 
				create_panel_message text = <loop_count_string> id = perfect rgba = [ 50 120 200 128 ] pos = PAIR(110.00000000000, 340.00000000000) style = perfect_style 
			ENDIF 
		ENDIF 
		SetlandedFromVert 
		Goto Land Params = { RevertTime = 30 } 
	ELSE 
		IF GotParam NoLoopLandBail 
			IF ( <NoLoopLandBail> = 1 ) 
				Goto OnGroundAI 
			ENDIF 
		ENDIF 
		Obj_SpawnScript LoopOllie 
	ENDIF 
ENDSCRIPT


