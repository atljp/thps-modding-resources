
SCRIPT Airborne Blendperiod = 0.30000001192 
	SetExtraTricks FlipRoll Duration = 30 
	BEGIN 
		IF Obj_FlagSet FLAG_SKATER_INLOOP 
			Goto LoopGapStart 
		ENDIF 
		InAirExceptions <...> 
		BEGIN 
			DoNextTrick 
			GetAirTimeLeft 
			GetAirtime 
			IF ( <AirTimeLeft> < 0.40000000596 ) 
				PlayAnim Anim = StretchLegsInit Blendperiod = <Blendperiod> NoRestart 
				BREAK 
			ELSE 
				IF LeftPressed 
					IF Flipped 
						PlayAnim Anim = AirTurnRight AirAnimParams 
					ELSE 
						PlayAnim Anim = AirTurnLeft AirAnimParams 
					ENDIF 
				ELSE 
					IF RightPressed 
						IF Flipped 
							PlayAnim Anim = AirTurnLeft AirAnimParams 
						ELSE 
							PlayAnim Anim = AirTurnRight AirAnimParams 
						ENDIF 
					ELSE 
						IF Held R1 
							IF Flipped 
								PlayAnim Anim = AirTurnRight AirAnimParams 
							ELSE 
								PlayAnim Anim = AirTurnLeft AirAnimParams 
							ENDIF 
						ELSE 
							IF Held L1 
								IF Flipped 
									PlayAnim Anim = AirTurnLeft AirAnimParams 
								ELSE 
									PlayAnim Anim = AirTurnRight AirAnimParams 
								ENDIF 
							ELSE 
								IF Held R2 
									PlayAnim Anim = SpineTransfer Blendperiod = 0.30000001192 NoRestart 
								ELSE 
									IF Held L2 
										PlayAnim Anim = SpineTransfer Blendperiod = 0.30000001192 NoRestart 
									ELSE 
										PlayAnim Anim = AirIdle Cycle Blendperiod = <Blendperiod> NoRestart 
									ENDIF 
								ENDIF 
							ENDIF 
						ENDIF 
					ENDIF 
				ENDIF 
			ENDIF 
			waitonegameframe 
		REPEAT 
		waitanimwhilstchecking 
		DoNextTrick 
		waitonegameframe 
	REPEAT 
ENDSCRIPT

SCRIPT Land 
	SetSkaterCamLerpReductionTimer time = 0 
	GetSpeed 
	IF AirTimeGreaterThan 1.50000000000 seconds 
		ShakeCamera { 
			Duration = 0.50000000000 
			vert_amp = ( 0.00999999978 * <Speed> ) 
			horiz_amp = ( 0.00499999989 * <Speed> ) 
			vert_vel = 10.27000045776 
			horiz_vel = 5.92000007629 
		} 
	ENDIF 
	easy_no_bail = 0 
	IF GetGlobalFlag flag = DIFFICULTY_MODE_TOO_EASY 
		IF NOT inNetGame 
			<easy_no_bail> = 1 
		ENDIF 
	ENDIF 
	IF ( <easy_no_bail> = 1 ) 
		ClearTrickQueue 
		KillExtraTricks 
	ELSE 
		GoalManager_GetDifficultyLevel 
		IF ( <difficulty_level> = 0 ) 
			IF SpeedGreaterThan 500 
				IF YawBetween PAIR(80.00000000000, 100.00000000000) 
					ClearComboBonusPot 
					Goto YawBail 
				ENDIF 
			ENDIF 
		ELSE 
			IF SpeedGreaterThan 500 
				IF YawBetween PAIR(60.00000000000, 120.00000000000) 
					ClearComboBonusPot 
					Goto YawBail 
				ENDIF 
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
			Printf "DOING A TRICK" 
			ClearComboBonusPot 
			Goto DoingTrickBail 
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
	DoPerfectCheck 
	AllowRailTricks 
	NollieOff 
	PressureOff 
	ClearLipCombos 
	IF LandedFromVert 
		OverrideCancelGround 
		Obj_ClearFlag FLAG_SKATER_MANUALCHEESE 
		GetSpeed 
		IF ( <Speed> > 250 ) 
			SetExtraTricks_Reverts Duration = <RevertTime> 
		ENDIF 
		IF AnimEquals [ ToTail_In ToTail_Idle ToTail_Out ] 
			IF Backwards 
				Goto ToTail_Bail Params = { Anim1 = ManualBack Anim2 = ManualGetup IntoAirFrame = 30 Friction = 5 SmackAnim = SmackWallFeet Sound = Bail04 
					BoardOffFrame = 10 BoardVel = VECTOR(0.00000000000, 500.00000000000, 70.00000000000) BoardRotVel = VECTOR(20.00000000000, 0.00000000000, 0.00000000000) BoardSkaterVel = 1 
				GroundGoneBail = GroundGoneBail AnimFall1 = HeadFirstFallBack AnimFall2 = BigDrop AnimFall3 = GetUpFacing } 
			ENDIF 
			SetTrickName "To Tail" 
			SetTrickScore 500 
			Display 
			CopingHit Terrain = 3 
			Obj_Spawnscript CessTrail Params = { repeat_times = 20 } 
		ENDIF 
	ELSE 
		DoNextManualTrick FromAir 
	ENDIF 
	Vibrate Actuator = 1 Percent = 80 Duration = 0.10000000149 
	GetAirtime 
	SpawnClothingLandScript 
	IF Crouched 
		IF GotParam LittleAir 
			PlayAnim Anim = CrouchBumpDown 
		ELSE 
			IF Backwards 
				FlipAndRotate 
				PlayAnim RANDOM_NO_REPEAT(1, 1, 1, 1, 1) RANDOMCASE Anim = CrouchedLandTurn RANDOMCASE Anim = CrouchedLandTurn1 RANDOMCASE Anim = CrouchedLandTurn2 RANDOMCASE Anim = CrouchedLandTurn3 RANDOMCASE Anim = StretchLegsLand RANDOMEND Blendperiod = 0.00000000000 
				BoardRotate 
			ELSE 
				IF YawBetween PAIR(45.00000000000, 60.00000000000) 
					IF AirTimeGreaterThan 0.75000000000 second 
						PlayAnim RANDOM(1, 1) RANDOMCASE Anim = SketchyCrouchLand RANDOMCASE Anim = SketchyLand1 RANDOMEND Blendperiod = 0.10000000149 
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
			PlayAnim Anim = IdleBump 
		ELSE 
			IF Backwards 
				FlipAndRotate 
				PlayAnim RANDOM(1, 1, 1, 1) RANDOMCASE Anim = CrouchedLandTurn RANDOMCASE Anim = CrouchedLandTurn1 RANDOMCASE Anim = CrouchedLandTurn2 RANDOMCASE Anim = CrouchedLandTurn3 RANDOMEND Blendperiod = 0 
				BoardRotate 
			ELSE 
				IF YawBetween PAIR(45.00000000000, 60.00000000000) 
					IF AirTimeGreaterThan 0.50000000000 second 
						PlayAnim RANDOM(1, 1) RANDOMCASE Anim = SketchyLand RANDOMCASE Anim = SketchyLand1 RANDOMEND Blendperiod = 0.10000000149 
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
		ClearException Ollied 
		ClearException GroundGone 
		ClearException WallPush 
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
	LandSkaterTricks 
	ClearComboBonusPot 
	OnGroundExceptions 
	CheckForNetBrake 
	waitanimwhilstchecking AndManuals 
	Goto OnGroundAi 
ENDSCRIPT

SCRIPT ToTail_Bail Friction = 8 Friction2 = 10 HeavyFriction = 70 
	Obj_SetBoundingSphere 100 
	IF GotParam UnrotateBoardFirst 
		IF BoardIsRotated 
			BoardRotate 
		ENDIF 
	ENDIF 
	IF GotParam NoBailBoard 
		NoBailBoard = 1 
	ENDIF 
	NollieOff 
	PressureOff 
	KillSpecial 
	created_trick_cleanup 
	SpawnClothingLandScript 
	IF NOT GotParam NoScuff 
		PlaySkaterStream type = "bail" 
	ENDIF 
	SetSkaterCamLerpReductionTimer time = 0 
	InBail 
	LaunchStateChangeEvent State = Skater_InBail 
	SetExtraPush radius = 48 Speed = 100 Rotate = 6 
	Obj_Spawnscript BailBoardControl Params = { BoardOffFrame = <BoardOffFrame> BoardVel = <BoardVel> BoardRotVel = <BoardRotVel> BoardSkaterVel = <BoardSkaterVel> NoBailBoard = <NoBailBoard> } 
	SparksOff 
	VibrateOff 
	ClearExceptions 
	DisablePlayerInput AllowCameraControl 
	BailSkaterTricks 
	StopBalanceTrick 
	SetException Ex = CarBail Scr = CarBail 
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
		PlayAnim Anim = <Anim1> NoRestart Blendperiod = 0.00000000000 
	ELSE 
		PlayAnim Anim = <Anim1> NoRestart Blendperiod = 0.30000001192 
	ENDIF 
	IF GotParam BashOff 
	ELSE 
		BashOn 
	ENDIF 
	WaitOnGround 
	IF NOT GotParam NoScuff 
		IF NOT GetGlobalFlag flag = BLOOD_OFF 
			Scuff_skater 
		ENDIF 
	ENDIF 
	IF NOT GetGlobalFlag flag = BLOOD_OFF 
		IF GotParam Bloodframe 
			WaitAnim frame <Bloodframe> 
			Obj_Spawnscript BloodSmall 
			Playsound RANDOM(1, 1, 1) RANDOMCASE hitblood01 RANDOMCASE hitblood02 RANDOMCASE hitblood03 RANDOMEND 
		ENDIF 
	ENDIF 
	Vibrate Actuator = 1 Percent = 100 Duration = 0.20000000298 
	SetRollingFriction <HeavyFriction> 
	IF GotParam HitBody 
		Spawnscript HitBody Params = { <...> } 
	ENDIF 
	wait 3 frames 
	SetRollingFriction <Friction> 
	WaitAnim 30 Percent 
	SpeedCheckStop 
	SetRollingFriction <Friction2> 
	WaitAnim 50 Percent 
	SpeedCheckStop 
	BashOn 
	IF GotParam BoardEarlyOn 
		BoardRotate normal 
		SwitchOnBoard 
	ENDIF 
	WaitAnim 75 Percent 
	SpeedCheckStop 
	IF GotParam FoleySound 
	ENDIF 
	WaitAnimFinished 
	IF GotParam SpeedBasedAnim1 
		IF SpeedGreaterThan <Speed> 
			PlayAnim Anim = <SpeedBasedAnim2> 
		ELSE 
			PlayAnim Anim = <SpeedBasedAnim1> 
		ENDIF 
		Vibrate Actuator = 1 Percent = 100 Duration = 0.20000000298 
		Obj_Spawnscript BloodSmall 
		SetRollingFriction 20 
		WaitAnimFinished 
	ENDIF 
	SpeedCheckStop 
	IF GotParam Anim2 
		PlayAnim Anim = <Anim2> Blendperiod = 0.00000000000 
	ENDIF 
	SetRollingFriction 20 
	SpeedCheckStop 
	VibrateOff 
	WaitAnim 20 frames fromend 
	SwitchOnBoard 
	IF GotParam BoardAlwaysOn 
	ELSE 
		BoardRotate normal 
	ENDIF 
	WaitAnimFinished 
	Goto Baildone 
ENDSCRIPT

perfect_bonus = 0 
SCRIPT ClearComboBonusPot 
	Change perfect_bonus = 0 
ENDSCRIPT

SCRIPT AwardPerfect 
	GetSpin 
	SkaterGetScoreInfo 
	base_perfect_score = ( <spin> * 1.50000000000 ) 
	bonus_perfect_score = ( perfect_bonus * 0.01999999955 ) 
	CastToInteger bonus_perfect_score 
	CastToInteger base_perfect_score 
	total_bonus = ( <base_perfect_score> + <bonus_perfect_score> ) 
	Change perfect_bonus = ( perfect_bonus + <total_bonus> ) 
	IF ( <spin> > 359.00000000000 ) 
		IF NOT InSplitScreenGame 
			IF NOT GetGlobalFlag flag = NO_DISPLAY_BASESCORE 
				FormatText TextName = ScoreText "+%s Points" s = <total_bonus> 
				Create_Panel_Message text = "Perfect Landing!" id = perfect rgba = [ 50 150 50 128 ] pos = PAIR(110.00000000000, 340.00000000000) style = perfect_style 
				Create_Panel_Message text = <ScoreText> id = perfect2 rgba = [ 40 140 40 100 ] pos = PAIR(110.00000000000, 360.00000000000) style = perfect_style 
			ENDIF 
		ELSE 
			IF NOT GetGlobalFlag flag = NO_DISPLAY_BASESCORE 
				PerfectSloppy_2p text = "Perfect!" rgb = [ 50 150 50 128 ] 
			ENDIF 
		ENDIF 
		Ksk_DebugValue value_name = "total_bonus" value_value = <total_bonus> 
		SetTrickName #"" 
		SetTrickScore <total_bonus> 
		Display Blockspin NoDegrade 
		IF NOT GetGlobalFlag flag = SOUNDS_SPECIALSOUNDS_OFF 
			Obj_Spawnscript PlayPerfectSound Params = { Sound = PerfectLanding wait = 0.20000000298 pitch = 80 } 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT AwardSloppy 
	GetSpin 
	SkaterGetScoreInfo 
	bonus_score = ( <ScorePot> * -0.00999999978 ) 
	CastToInteger bonus_score 
	IF ( <spin> > 359.00000000000 ) 
		IF NOT InSplitScreenGame 
			IF NOT GetGlobalFlag flag = NO_DISPLAY_BASESCORE 
				FormatText TextName = ScoreText "%s Points" s = <bonus_score> 
				Create_Panel_Message text = "Sloppy Landing" id = perfect rgba = [ 200 50 50 128 ] pos = PAIR(110.00000000000, 340.00000000000) style = sloppy_style 
				Create_Panel_Message text = <ScoreText> id = perfect2 rgba = [ 107 51 27 100 ] pos = PAIR(110.00000000000, 360.00000000000) style = sloppy_style 
			ENDIF 
		ELSE 
			IF NOT GetGlobalFlag flag = NO_DISPLAY_BASESCORE 
				PerfectSloppy_2p text = "Sloppy!" rgb = [ 200 50 50 128 ] 
			ENDIF 
		ENDIF 
		Ksk_DebugValue value_name = "bonus_score" value_value = <bonus_score> 
		SetTrickName #"" 
		SetTrickScore <bonus_score> 
		Display Blockspin NoDegrade 
		IF NOT GetGlobalFlag flag = SOUNDS_SPECIALSOUNDS_OFF 
			Obj_Spawnscript PlayPerfectSound Params = { Sound = HUDtrickslopC pitch = 150 wait = 0.11999999732 } 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT FlyAi Move = 8 
	ClearExceptions 
	SetQueueTricks NoTricks 
	SetSpeed 0 
	setstate Air 
	SetRollingFriction 1000 
	NoRailTricks 
	BEGIN 
		IF Held White 
			BREAK 
		ENDIF 
		IF Held R2 
			Move y = 1 
		ENDIF 
		IF Held L2 
			Move y = -1 
		ENDIF 
		IF Held Square 
			Move X = 1 
		ENDIF 
		IF Held Circle 
			Move X = -1 
		ENDIF 
		IF Held Triangle 
			Move z = 1 
		ENDIF 
		IF Held X 
			Move z = -1 
		ENDIF 
		waitonegameframe 
	REPEAT 
	AllowRailTricks 
	MakeSkaterGoto OnGroundAi 
ENDSCRIPT


