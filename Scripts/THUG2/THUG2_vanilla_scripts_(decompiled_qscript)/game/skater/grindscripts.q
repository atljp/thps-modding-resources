
SCRIPT GetBoardGrindBone objId = skater 
	<objId> : GetSparksPos 
	SWITCH <SparksPos> 
		CASE front 
			IF <objId> : BoardIsRotated 
				<Bone> = Bone_Board_Tail 
			ELSE 
				<Bone> = Bone_Board_Nose 
			ENDIF 
		CASE rear 
			IF <objId> : BoardIsRotated 
				<Bone> = Bone_Board_Nose 
			ELSE 
				<Bone> = Bone_Board_Tail 
			ENDIF 
		DEFAULT 
			<Bone> = Bone_Board_Root 
	ENDSWITCH 
	RETURN Bone = <Bone> 
ENDSCRIPT

SCRIPT SkateInOrBail moveleft = 1 moveright = -1 movey = -5 
	GetTags 
	IF IsSkaterOnVehicle 
		OutAnim = <grind_out_anim> 
		GrindBail = vehicle_bail 
	ENDIF 
	NoRailTricks 
	StopBalanceTrick 
	KillExtraTricks 
	SetExtraTricks NoTricks 
	IF NOT IsSkaterOnVehicle 
		OnGroundExceptions NoEndRun 
	ENDIF 
	IF NOT ( <GrindBail> = Airborne ) 
		OnExceptionRun SkateInOrBail_Out 
	ENDIF 
	SetQueueTricks NoTricks 
	ClearManualTrick 
	IF GotParam Fallingright 
		Goto SkateIn_Right Params = { <...> } 
	ENDIF 
	IF GotParam FallingLeft 
		Goto SkateIn_Left Params = { <...> } 
	ENDIF 
	IF GotParam GrindRelease 
		TriggerGrindOff 
		IF Held Right 
			Goto SkateIn_Right Params = { <...> } 
		ENDIF 
		IF Held Left 
			Goto SkateIn_Left Params = { <...> } 
		ENDIF 
		IF SkateInAble Left 
			Goto SkateIn_Left Params = { <...> } 
		ELSE 
			Goto SkateIn_Right Params = { <...> } 
		ENDIF 
	ENDIF 
	printf "Missing a FallingLeft or FallingRight ?" 
	IF GotParam GrindBail 
		Goto <GrindBail> 
	ELSE 
		Goto FiftyFiftyFall 
	ENDIF 
ENDSCRIPT

SCRIPT OnGroundExceptions_NoOllieAfterEndofRun 
	OnGroundExceptions NoEndRun 
	IF GoalManager_GoalShouldExpire 
		ClearException Ollied 
		ClearException GroundGone 
		ClearException WallPush 
	ENDIF 
ENDSCRIPT

SCRIPT SkateIn_Right 
	IF SkateInAble Right 
		skatein = 1 
	ELSE 
		IF NearGround Right 
			skatein = 1 
			Params = { no_land_anim = 1 } 
		ENDIF 
	ENDIF 
	IF GotParam skatein 
		printf "SkateInable RIGHT >>>>>>>>>>>>>>>>>>>>>>>>" 
		SetLandedFromVert 
		SetState ground 
		Move y = -5 
		Move x = -1 
		OrientToNormal 
		Rotate y = -30 Duration = 0.20000000298 seconds 
		IF NOT IsSkaterOnVehicle 
			OnGroundExceptions_NoOllieAfterEndofRun 
		ENDIF 
		OnExceptionRun SkateInOrBail_Out 
		SetQueueTricks NoTricks 
		SetManualTricks NoTricks 
		SetExtraTricks_Reverts 
		IF IsSkaterOnVehicle 
			Goto vehicle_rail_exit Params = { callback = vehicle_land } 
		ELSE 
			IF GotParam OutAnim 
				PlayAnim Anim = <OutAnim> BlendPeriod = 0.30000001192 
			ELSE 
				PlayAnim Anim = <initanim> Backwards BlendPeriod = 0.30000001192 
			ENDIF 
			WaitAnimWhilstChecking 
			Goto SkateInLand Params = <Params> 
		ENDIF 
	ELSE 
		Move y = <movey> 
		Move x = <moveright> 
		IF IsSkaterOnVehicle 
			vehicle_rail_exit Params = { callback = vehicle_bail } 
		ELSE 
			SkateIn_Bail <...> dir = Right 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT SkateIn_Left 
	IF SkateInAble Left 
		skatein = 1 
	ELSE 
		IF NearGround Left 
			skatein = 1 
			Params = { no_land_anim = 1 } 
		ENDIF 
	ENDIF 
	IF GotParam skatein 
		SetLandedFromVert 
		printf "SkateInable LEFT >>>>>>>>>>>>>>>>>>>>>>>>" 
		SetState ground 
		Move x = 1 
		Move y = -5 
		OrientToNormal 
		Rotate y = 30 Duration = 0.20000000298 seconds 
		SetState ground 
		IF NOT IsSkaterOnVehicle 
			OnGroundExceptions_NoOllieAfterEndofRun 
		ENDIF 
		OnExceptionRun SkateInOrBail_Out 
		SetQueueTricks NoTricks 
		SetManualTricks NoTricks 
		SetExtraTricks_Reverts 
		IF IsSkaterOnVehicle 
			Goto vehicle_rail_exit Params = { callback = vehicle_land } 
		ELSE 
			IF GotParam OutAnim 
				PlayAnim Anim = <OutAnim> BlendPeriod = 0.30000001192 
			ELSE 
				PlayAnim Anim = <initanim> Backwards BlendPeriod = 0.30000001192 
			ENDIF 
			WaitAnimWhilstChecking 
			Goto SkateInLand Params = <Params> 
		ENDIF 
	ELSE 
		printf "Not skateinable left >>>>>>>>>>>>>>>>>>>>>>>>" 
		Move y = <movey> 
		Move x = <moveright> 
		IF IsSkaterOnVehicle 
			vehicle_rail_exit Params = { callback = vehicle_bail } 
		ELSE 
			SkateIn_Bail <...> dir = Left 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT SkateIn_Bail 
	IF Flipped 
		IF ( <dir> = Left ) 
			dir = backward 
		ELSE 
			dir = forward 
		ENDIF 
	ELSE 
		IF ( <dir> = Left ) 
			dir = forward 
		ELSE 
			dir = backward 
		ENDIF 
	ENDIF 
	IF GotParam GrindBail 
		Goto <GrindBail> Params = { dir = <dir> } 
	ELSE 
		Goto FiftyFiftyFall Params = { dir = <dir> } 
	ENDIF 
ENDSCRIPT

SCRIPT SkateInLand 
	OnExceptionRun SkateInLandOut 
	NollieOff 
	PressureOff 
	Vibrate Actuator = 1 Percent = 80 Duration = 0.10000000149 
	IF NOT GotParam no_land_anim 
		IF Crouched 
			PlayAnim Anim = CrouchedLand BlendPeriod = 0.10000000149 
		ELSE 
			PlayAnim Anim = Land BlendPeriod = 0.10000000149 
		ENDIF 
	ENDIF 
	OnExceptionRun SkateInLandOut 
	OnGroundExceptions_NoOllieAfterEndofRun 
	SetManualTricks NoTricks 
	IF NOT GotParam no_land_anim 
		WaitAnim 10 Percent 
	ENDIF 
	LandSkaterTricks 
	OnGroundExceptions 
	CheckforNetBrake 
	AllowRailtricks 
	IF NOT GotParam no_land_anim 
		WaitAnimWhilstChecking AndManuals 
	ENDIF 
	Goto OnGroundAI 
ENDSCRIPT

SCRIPT SkateInLandOut 
	AllowRailtricks 
	LandSkaterTricks 
ENDSCRIPT

SCRIPT SkateInOrBail_Out 
	KillExtraTricks 
	IF NOT InAir 
		printf " =================================== LAND ==================================" 
		LandSkaterTricks 
	ENDIF 
	ResetLandedFromVert 
	printf " =================================== NO VERT ==================================" 
ENDSCRIPT

Extra_FS_Grinds = 
[ 
	{ Trigger = { InOrder , a = Triangle , b = Triangle , 300 } Scr = Trick_5050_FS Params = { Name = #"FS 50-50" IsExtra = yes } } 
	{ Trigger = { InOrder , Triangle , Square , 300 } Scr = Trick_NoseSlide_FS Params = { Name = #"FS Noseslide" IsExtra = yes } } 
	{ Trigger = { InOrder , Triangle , Circle , 300 } Scr = Trick_Nosegrind_FS Params = { Name = #"FS Nosegrind" IsExtra = yes } } 
	{ Trigger = { InOrder , a = Circle , b = Circle , 300 } Scr = Trick_Crooked_FS Params = { Name = #"FS Crooked" IsExtra = yes } } 
	{ Trigger = { InOrder , Circle , Square , 300 } Scr = Trick_Bluntslide_FS Params = { Name = #"FS Bluntslide" IsExtra = yes } } 
	{ Trigger = { InOrder , Circle , Triangle , 300 } Scr = Trick_NoseBluntSlide_FS Params = { Name = #"FS Nosebluntslide" IsExtra = yes } } 
	{ Trigger = { InOrder , a = Square , b = Square , 300 } Scr = Trick_Smith_FS Params = { Name = #"FS Smith" IsExtra = yes } } 
	{ Trigger = { InOrder , Square , Circle , 300 } Scr = Trick_5_0_FS Params = { Name = #"FS 5-0" IsExtra = yes } } 
	{ Trigger = { InOrder , Square , Triangle , 300 } Scr = Trick_Tailslide_FS Params = { Name = #"FS Tailslide" IsExtra = yes } } 
] 
Extra_BS_Grinds = 
[ 
	{ Trigger = { InOrder , a = Triangle , b = Triangle , 300 } Scr = Trick_5050_BS Params = { Name = #"BS 50-50" IsExtra = yes } } 
	{ Trigger = { InOrder , Triangle , Square , 300 } Scr = Trick_NoseSlide_BS Params = { Name = #"BS Noseslide" IsExtra = yes } } 
	{ Trigger = { InOrder , Triangle , Circle , 300 } Scr = Trick_Nosegrind_BS Params = { Name = #"BS Nosegrind" IsExtra = yes } } 
	{ Trigger = { InOrder , a = Circle , b = Circle , 300 } Scr = Trick_Crooked_BS Params = { Name = #"BS Crooked" IsExtra = yes } } 
	{ Trigger = { InOrder , Circle , Square , 300 } Scr = Trick_Bluntslide_BS Params = { Name = #"BS Bluntslide" IsExtra = yes } } 
	{ Trigger = { InOrder , Circle , Triangle , 300 } Scr = Trick_NoseBluntSlide_BS Params = { Name = #"BS Nosebluntslide" IsExtra = yes } } 
	{ Trigger = { InOrder , Square , Triangle , 300 } Scr = Trick_Tailslide_BS Params = { Name = #"BS Tailslide" IsExtra = yes } } 
	{ Trigger = { InOrder , a = Square , b = Square , 300 } Scr = Trick_Smith_BS Params = { Name = #"BS Smith" IsExtra = yes } } 
	{ Trigger = { InOrder , Square , Circle , 300 } Scr = Trick_5_0_BS Params = { Name = #"BS 5-0" IsExtra = yes } } 
] 
GrindRelease = 
[ 
	{ Trigger = { Press , R2 , 100 } Scr = SkateInOrBail NGC_Trigger = { Press , R1 , 100 } Xbox_Trigger = { AirTrickLogic , L2 , R2 , 200 } Params = { GrindRelease GrindBail = Airborne moveright = -5 movey = 5 } } 
] 
SPECIALGRIND_SCORE = 1250 
GRINDTAP_TIME = 1000 
GRINDTAP_SCORE = 400 
GRINDTAP_TWEAK = 25 
GrindTaps_FS = [ 
	{ Trigger = { TripleInOrderSloppy , UpRight , b = Triangle , c = Triangle , GRINDTAP_TIME } Scr = Trick_CrailSlide_FS Params = { IsExtra = 1 } } 
	{ Trigger = { TripleInOrderSloppy , DownRight , b = Triangle , c = Triangle , GRINDTAP_TIME } Scr = Trick_Darkslide_FS Params = { IsExtra = 1 } } 
	{ Trigger = { TripleInOrderSloppy , DownLeft , b = Triangle , c = Triangle , GRINDTAP_TIME } Scr = Trick_DoubleBluntSlide2 Params = { IsExtra = 1 } } 
	{ Trigger = { TripleInOrderSloppy , UpLeft , b = Triangle , c = Triangle , GRINDTAP_TIME } Scr = Trick_HangTenNoseGrind_FS Params = { IsExtra = 1 } } 
	{ Trigger = { TripleInOrderSloppy , Up , b = Triangle , c = Triangle , GRINDTAP_TIME } Scr = Trick_NosegrindPivot_FS Params = { IsExtra = 1 } } 
	{ Trigger = { TripleInOrderSloppy , Right , b = Triangle , c = Triangle , GRINDTAP_TIME } Scr = Trick_Salad_FS Params = { IsExtra = 1 } } 
	{ Trigger = { TripleInOrderSloppy , Left , b = Triangle , c = Triangle , GRINDTAP_TIME } Scr = Trick_Hurricane_FS Params = { IsExtra = 1 } } 
	{ Trigger = { TripleInOrderSloppy , Down , b = Triangle , c = Triangle , GRINDTAP_TIME } Scr = Trick_GrindOverturn_FS Params = { IsExtra = 1 } } 
] 
GrindTaps_BS = [ 
	{ Trigger = { TripleInOrderSloppy , UpRight , b = Triangle , c = Triangle , GRINDTAP_TIME } Scr = Trick_CrailSlide_BS Params = { IsExtra = 1 } } 
	{ Trigger = { TripleInOrderSloppy , DownRight , b = Triangle , c = Triangle , GRINDTAP_TIME } Scr = Trick_Darkslide_BS Params = { IsExtra = 1 } } 
	{ Trigger = { TripleInOrderSloppy , DownLeft , b = Triangle , c = Triangle , GRINDTAP_TIME } Scr = Trick_DoubleBluntSlide2 Params = { IsExtra = 1 } } 
	{ Trigger = { TripleInOrderSloppy , UpLeft , b = Triangle , c = Triangle , GRINDTAP_TIME } Scr = Trick_HangTenNoseGrind_BS Params = { IsExtra = 1 } } 
	{ Trigger = { TripleInOrderSloppy , Up , b = Triangle , c = Triangle , GRINDTAP_TIME } Scr = Trick_NosegrindPivot_BS Params = { IsExtra = 1 } } 
	{ Trigger = { TripleInOrderSloppy , Right , b = Triangle , c = Triangle , GRINDTAP_TIME } Scr = Trick_Salad_BS Params = { IsExtra = 1 } } 
	{ Trigger = { TripleInOrderSloppy , Down , b = Triangle , c = Triangle , GRINDTAP_TIME } Scr = Trick_GrindOverturn_BS Params = { IsExtra = 1 } } 
	{ Trigger = { TripleInOrderSloppy , Left , b = Triangle , c = Triangle , GRINDTAP_TIME } Scr = Trick_Hurricane_BS Params = { IsExtra = 1 } } 
] 
SCRIPT Grind GrindTweak = 7 boardscuff = 0 InitSpeed = 1.00000000000 SparksPos = rear 
	Obj_GetType 
	IF ( <ObjType> = OBJECT_TYPE_PED ) 
		Goto Ped_Skater_BeginGrind Params = <...> 
		RETURN 
	ENDIF 
	KillExtraTricks 
	IF IsSkaterOnVehicle 
		Goto vehicle_grind 
	ENDIF 
	IF IsOnMotoskateboard 
		IF NOT GotParam motoskateboard_grind 
			Goto Trick_Motoskateboard_Grind 
		ENDIF 
		NoSpecial = NoSpecial 
	ENDIF 
	IF BailIsOn 
		SetState Air 
		Goto DoingTrickBail 
	ENDIF 
	IF InNetGame 
		IF BailIsOn 
			SetState Air 
			Goto DoingTrickBail 
		ENDIF 
	ENDIF 
	BailOff 
	CancelRotateDisplay 
	TurnOffSpecialItem 
	LaunchStateChangeEvent State = Skater_OnRail 
	ResetProjectileInput 
	IF NOT GotParam IsATap 
		IF NOT GotParam IsExtra 
			IF ChecksumEquals a = <Extratricks> b = Extra_BS_Grinds 
				SetExtraTricks GrindTaps_BS 
			ELSE 
				SetExtraTricks GrindTaps_FS 
			ENDIF 
		ENDIF 
	ENDIF 
	SetTags OutAnim = <OutAnim> initanim = <initanim> InitSpeed = <InitSpeed> Anim = <Anim> 
	SetTrickName "" 
	SetTrickScore 0 
	Display Blockspin 
	Obj_ClearFlag FLAG_SKATER_MANUALCHEESE 
	Obj_ClearFlag FLAG_SKATER_REVERTCHEESE 
	IF GotParam SpecialItem_details 
		TurnOnSpecialItem SpecialItem_details = <SpecialItem_details> 
	ENDIF 
	IF GotParam SwitchBoardOff 
		SwitchoffBoard 
	ENDIF 
	IF GotParam IsSpecial 
		BroadcastEvent type = SkaterEnterSpecialTrick 
		OnExitRun Exit_Special_Grind 
	ELSE 
		OnExitRun Exit_Grind 
	ENDIF 
	IF GotParam SpecialSounds 
		Obj_SpawnScript <SpecialSounds> 
	ENDIF 
	Vibrate Actuator = 1 Percent = 50 Duration = 0.25000000000 
	Vibrate Actuator = 0 Percent = 50 
	ClearExceptions 
	IF GotParam Nollie 
		SetException Ex = Ollied Scr = NollieNoDisplay 
		NollieOn 
	ELSE 
		IF GotParam OutAnimOnOllie 
			SetException Ex = Ollied Scr = Ollie Params = { <...> } 
		ELSE 
			SetException Ex = Ollied Scr = Ollie 
		ENDIF 
		NollieOff 
	ENDIF 
	PressureOff 
	<is_grind> = 0 
	IF GotParam type 
		IF ( <type> = Grind ) 
			<is_grind> = 1 
		ENDIF 
	ELSE 
		script_assert "No type specified on grind trick" 
	ENDIF 
	SetSparksPos <SparksPos> 
	IF ( <is_grind> = 1 ) 
		SparksOn 
	ELSE 
		GetBoardScuff 
		<boardscuff> = ( <boardscuff> + 1 ) 
		SetTags boardscuff = <boardscuff> 
		DoBoardScuff boardscuff = <boardscuff> 
		SparksOff 
		SparksOn type = slide 
	ENDIF 
	SetException Ex = OffRail Scr = OffRail Params = { KissedRail initanim = <initanim> InitSpeed = <InitSpeed> OutAnim = <OutAnim> BoardRotate = <BoardRotate> OutAnimBackwards = <OutAnimBackwards> } 
	SetException Ex = Landed Scr = Grind_to_Land 
	SetException Ex = OffMeterTop Scr = SkateInOrBail Params = { <...> FallingLeft } 
	SetException Ex = OffMeterBottom Scr = SkateInOrBail Params = { <...> Fallingright } 
	SetException Ex = SkaterCollideBail Scr = SkaterCollideBail 
	SetEventHandler Ex = MadeOtherSkaterBail Scr = MadeOtherSkaterBail_Called 
	OnExceptionRun Grind_Kissed 
	ClearTrickQueue 
	ClearManualTrick 
	ClearExtraGrindTrick 
	SetQueueTricks NoTricks 
	SetManualTricks NoTricks 
	SetRailSound <type> 
	IF GotParam IsSpecial 
		SetGrindTweak 36 
		<score> = SPECIALGRIND_SCORE 
	ELSE 
		IF GotParam IsATap 
			SetGrindTweak GRINDTAP_TWEAK 
			<score> = GRINDTAP_SCORE 
		ELSE 
			SetGrindTweak <GrindTweak> 
		ENDIF 
	ENDIF 
	IF GotParam IsExtra 
		LaunchExtraMessage 
	ENDIF 
	IF GotParam Profile 
		IF ProfileEquals is_named = <Profile> 
			SwitchOnAtomic special_item 
			SwitchOffAtomic special_item_2 
		ENDIF 
	ENDIF 
	IF GotParam FullScreenEffect 
		<FullScreenEffect> 
		OnExitRun Exit_FullScreenEffect 
	ENDIF 
	IF NOT AnimEquals JumpAirTo5050 
		IF GotParam NoBlend 
			PlayAnim Anim = <initanim> BlendPeriod = 0.00000000000 Speed = <InitSpeed> 
		ELSE 
			PlayAnim Anim = <initanim> BlendPeriod = 0.30000001192 Speed = <InitSpeed> 
		ENDIF 
	ENDIF 
	IF GotParam IsATap 
		DoBalanceTrick ButtonA = Right ButtonB = Left type = <type> DoFlipCheck ClearCheese IsATap = 1 
	ELSE 
		IF GotParam IsExtra 
			DoBalanceTrick ButtonA = Right ButtonB = Left type = <type> DoFlipCheck ClearCheese IsATap = 1 
		ELSE 
			DoBalanceTrick ButtonA = Right ButtonB = Left type = <type> DoFlipCheck 
		ENDIF 
	ENDIF 
	GetSingleTag AcidDropCheese 
	IF GotParam AcidDropCheese 
		IF ( <AcidDropCheese> > 0 ) 
			printf "ACID DROP CHEESE ================== %i" i = <AcidDropCheese> 
			AdjustBalance TimeAdd = 0 SpeedMult = 2 LeanMult = 3.20000004768 
			RemoveTags tags = [ AcidDropCheese ] 
		ENDIF 
	ENDIF 
	Wait 15 frames 
	SetExtraTricks GrindRelease 
	Wait 1 frame 
	IF GotParam Stream 
		IF NOT IsStreamPlaying SFXSpecialStream 
			PlayStream <Stream> vol = 200 priority = StreamPriorityHigh id = SFXSpecialStream 
		ENDIF 
	ENDIF 
	IF GotParam IsSpecial 
		LaunchSpecialMessage text = "Special Grind" 
	ENDIF 
	SetException Ex = OffRail Scr = OffRail Params = { initanim = <initanim> InitSpeed = <InitSpeed> OutAnim = <OutAnim> BoardRotate = <BoardRotate> OutAnimBackwards = <OutAnimBackwards> } 
	OnExceptionRun Normal_Grind 
	SetTrickName <Name> 
	printf "++++++++++++++++++++++++++++++++++++++++++ BASE SCORE FOR THIS GRIND = %s" s = <score> 
	SetTrickScore <score> 
	Display Blockspin NoSpecial = <NoSpecial> 
	IF AnimEquals JumpAirTo5050 
		Obj_WaitAnimFinished 
		PlayAnim Anim = <initanim> BlendPeriod = 0.30000001192 Speed = <InitSpeed> 
	ENDIF 
	Obj_WaitAnimFinished 
	IF GotParam FlipAfterInit 
		Flip 
		PlayBonkSound 
		BoardRotate 
		BlendperiodOut 0 
	ENDIF 
	IF GotParam Idle 
		PlayAnim Anim = <Anim> Cycle NoRestart 
	ELSE 
		IF GotParam Anim3 
			IF GotParam Anim2 
				PlayAnim RANDOM(1, 1, 1) RANDOMCASE Anim = <Anim> RANDOMCASE Anim = <Anim2> RANDOMCASE Anim = <Anim3> RANDOMEND wobble wobbleparams = grindwobble_params 
			ELSE 
				ScriptAssert "Script Assert: Added Anim3 to a grind without a valid anim2...check grindscripts.q Problem Anim = %a" a = <Anim> 
			ENDIF 
		ELSE 
			IF GotParam Anim2 
				PlayAnim RANDOM(1, 1) RANDOMCASE Anim = <Anim> RANDOMCASE Anim = <Anim2> RANDOMEND wobble wobbleparams = grindwobble_params 
			ELSE 
				PlayAnim Anim = <Anim> wobble wobbleparams = grindwobble_params 
			ENDIF 
		ENDIF 
	ENDIF 
	IF GotParam FlipBeforeOutAnim 
		BlendperiodOut 0.00000000000 
		FlipAfter 
	ENDIF 
	IF AnimEquals [ FiftyFifty_Range NoseGrind_Range TailGrind_Range ] 
		Wait 0.25000000000 seconds 
	ENDIF 
	IF NOT IsOnMotoskateboard 
		IF GotParam Extratricks 
			SetExtraTricks <Extratricks> ignore = <Name> GrindRelease 
		ELSE 
			SetExtraTricks GrindRelease 
		ENDIF 
	ENDIF 
	IF GotParam ScreenShake 
		Grind_ScreenShake ScreenShake = <ScreenShake> 
	ENDIF 
	IF GotParam specialtrick_particles 
		printf "Going to emit particles ........................." 
		Emit_SpecialTrickParticles specialitem_particles = <specialitem_particles> 
	ENDIF 
	WaitWhilstChecking_ForPressure <...> 
ENDSCRIPT

SCRIPT Grind_to_Land 
	StopBalanceTrick 
	Goto Land 
ENDSCRIPT

SCRIPT Exit_FullScreenEffect 
	<skaterlights_target> = ( tod_skaterlights ) 
	SetFogColor r = fog_red b = fog_blue g = fog_green a = fog_alpha 
	SetFogDistance distance = fog_dist 
	KillManualVibration 
	Exit_Grind 
ENDSCRIPT

SCRIPT Exit_FullScreenEffect_and_Special 
	BroadcastEvent type = SkaterExitSpecialTrick 
	Exit_FullScreenEffect 
ENDSCRIPT

SCRIPT Exit_Grind 
	SwitchOnBoard 
	CleanUp_SpecialTrickParticles 
ENDSCRIPT

SCRIPT Exit_Special_Grind 
	Exit_Special 
	Exit_Grind 
ENDSCRIPT

SCRIPT Exit_Special 
	BroadcastEvent type = SkaterExitSpecialTrick 
ENDSCRIPT

SCRIPT GetBoardScuff ManualName = #"none" 
	GetTags 
	RETURN boardscuff = <boardscuff> 
ENDSCRIPT

SCRIPT Grind_ScreenShake ScreenShake = 60 
	IF AnimEquals [ ElbowSmash_Idle FlipKickDad ] 
		BEGIN 
			Wait 1 frame 
			IF FrameIs <ScreenShake> 
				printf " THIS IS THE RIGHT SPOT" 
				BloodSplat 
				PlaySound BailSlap03 
				ShakeCamera { 
					Duration = 0.50000000000 
					vert_amp = 9.00000000000 
					horiz_amp = 3.00000000000 
					vert_vel = 10.27000045776 
					horiz_vel = 5.92000007629 
				} 
			ENDIF 
		REPEAT 
	ENDIF 
ENDSCRIPT

grindwobble_params = { 
	WobbleAmpA = { PAIR(0.10000000149, 0.10000000149) STATS_RAILBALANCE } 
	WobbleAmpB = { PAIR(0.03999999911, 0.03999999911) STATS_RAILBALANCE } 
	WobbleK1 = { PAIR(0.00219999999, 0.00219999999) STATS_RAILBALANCE } 
	WobbleK2 = { PAIR(0.00170000002, 0.00170000002) STATS_RAILBALANCE } 
	SpazFactor = { PAIR(1.50000000000, 1.50000000000) STATS_RAILBALANCE } 
} 
SCRIPT Grind_Kissed 
	IF GotParam MadeOtherSkaterBail 
	ELSE 
		KillExtraTricks 
	ENDIF 
	SetTrickName "" 
	SetTrickScore 0 
	Display Blockspin 
	Obj_KillSpawnedScript Name = CheckForShuffle 
	Obj_SpawnScript CheckForShuffle 
ENDSCRIPT

SCRIPT CheckForShuffle 
	SetException Ex = SkaterEnterRail Scr = Awardshuffle 
	Wait 15 frames 
ENDSCRIPT

SCRIPT Awardshuffle 
	SetTrickName #"" 
	SetTrickScore 100 
	Display Blockspin NoDegrade 
	IF NOT InSplitscreenGame 
		Create_Panel_Message text = "Shuffle Bonus" id = perfect rgba = [ 50 120 200 128 ] pos = PAIR(110.00000000000, 340.00000000000) style = perfect_style 
		Create_Panel_Message text = "+100 Points" id = perfect2 rgba = [ 50 120 200 100 ] pos = PAIR(110.00000000000, 360.00000000000) style = perfect_style 
	ELSE 
		PerfectSloppy_2p text = "Shuffle!" rgb = [ 50 120 50 128 ] 
	ENDIF 
ENDSCRIPT

SCRIPT Normal_Grind 
	IF GotParam MadeOtherSkaterBail 
	ELSE 
		KillExtraTricks 
	ENDIF 
	SwitchOffAtomic special_item 
	SwitchOnAtomic special_item_2 
ENDSCRIPT

SCRIPT OffRail InitSpeed = 1.00000000000 
	IF GotParam KissedRail 
		SetTrickScore 50 
		SetTrickName "Kissed the Rail" 
		Display Blockspin NoMult 
	ENDIF 
	StopBalanceTrick 
	KillExtraTricks 
	Vibrate Actuator = 0 Percent = 0 
	SetState Air 
	SetException Ex = Landed Scr = Land 
	SetException Ex = WallRideLeft Scr = WallRide Params = { Left } 
	SetException Ex = WallRideRight Scr = WallRide Params = { Right } 
	SetException Ex = WallPlant Scr = Air_WallPlant 
	DoNextTrick 
	IF GotParam EarlyOut 
		PlayAnim Anim = <EarlyOut> BlendPeriod = 0.10000000149 Backwards 
	ELSE 
		IF GotParam OutAnim 
			IF GotParam OutAnimBackwards 
				printf "Playing OutAnim Backwards" 
				PlayAnim Anim = <OutAnim> Backwards BlendPeriod = 0.10000000149 Speed = <InitSpeed> 
			ELSE 
				PlayAnim Anim = <OutAnim> BlendPeriod = 0.10000000149 Speed = <InitSpeed> 
			ENDIF 
		ELSE 
			PlayAnim Anim = <initanim> BlendPeriod = 0.10000000149 Backwards Speed = <InitSpeed> 
		ENDIF 
	ENDIF 
	IF GotParam BoardRotate 
		printf "Setting blendperiod out.................." 
		BlendperiodOut 0 
		BoardRotateAfter 
	ENDIF 
	IF GotParam FlipAfter 
		printf "flipping.................." 
		FlipAfter 
	ENDIF 
	Obj_WaitAnimFinished 
	Goto Airborne 
ENDSCRIPT

SCRIPT Trick_5050_BS Name = #"BS 50-50" 
	Grind { Name = <Name> score = 100 initanim = Init_FiftyFifty Anim = FiftyFifty2_range Anim2 = FiftyFifty_Range Anim3 = FiftyFifty3_range type = Grind NoBlend = <NoBlend> 
		GrindBail = FiftyFiftyFall Extratricks = Extra_BS_Grinds IsExtra = <IsExtra> 
	SparkPos = rear } 
ENDSCRIPT

SCRIPT Trick_5050_FS Name = #"FS 50-50" 
	Grind { Name = <Name> score = 100 initanim = Init_FiftyFifty Anim = FiftyFifty2_range Anim2 = FiftyFifty_Range Anim3 = FiftyFifty3_range type = Grind NoBlend = <NoBlend> 
	GrindBail = FiftyFiftyFall Extratricks = Extra_FS_Grinds IsExtra = <IsExtra> } 
ENDSCRIPT

SCRIPT Trick_5050_BS_180 
	FlipAndRotate 
	BoardRotateAfter 
	Goto Trick_5050_BS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_5050_FS_180 
	FlipAndRotate 
	BoardRotateAfter 
	Goto Trick_5050_FS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_Boardslide_FS Name = #"FS Boardslide" 
	Rotate 
	Grind { Name = <Name> score = 200 GrindTweak = 14 initanim = Init_FSBoardslide Anim = FSBoardslide_range OutAnim = FSBoardslide_Out NoBlend = yes 
		GrindBail = BackwardsGrindBails Extratricks = Extra_FS_Grinds IsExtra = <IsExtra> 
	type = slide SparkPos = front } 
ENDSCRIPT

SCRIPT Trick_Boardslide_BS Name = #"BS Boardslide" 
	Grind { Name = <Name> score = 200 GrindTweak = 14 initanim = Init_BSBoardslide Anim = BSBoardslide_range OutAnim = BSBoardslide_Out NoBlend = yes 
		GrindBail = GrindFallLR Extratricks = Extra_BS_Grinds IsExtra = <IsExtra> 
	type = slide SparkPos = rear } 
ENDSCRIPT

SCRIPT Trick_Lipslide_FS Name = #"FS Lipslide" 
	Grind { Name = <Name> score = 200 GrindTweak = 14 initanim = Init_FSLipslide Anim = BSBoardslide_range OutAnim = BSBoardslide_Out NoBlend = yes 
		GrindBail = GrindFallLR Extratricks = Extra_FS_Grinds IsExtra = <IsExtra> 
	type = slide SparkPos = front } 
ENDSCRIPT

SCRIPT Trick_Lipslide_BS Name = #"BS Lipslide" 
	Rotate 
	Grind { Name = <Name> score = 200 GrindTweak = 14 initanim = Init_BSLipslide Anim = FSBoardslide_range OutAnim = FSBoardslide_Out NoBlend = yes 
		GrindBail = BackwardsGrindBails Extratricks = Extra_BS_Grinds IsExtra = <IsExtra> 
	type = slide SparkPos = rear } 
ENDSCRIPT

SCRIPT Trick_Tailslide_FS 
	IF BadLedge 
		Goto Trick_NoseSlide_BS_ok Params = { IsExtra = <IsExtra> NoBlend = <NoBlend> } 
	ELSE 
		Goto Trick_Tailslide_FS_ok Params = { IsExtra = <IsExtra> NoBlend = <NoBlend> } 
	ENDIF 
ENDSCRIPT

SCRIPT Trick_Tailslide_FS_ok Name = #"FS Tailslide" 
	Grind { Name = <Name> score = 150 GrindTweak = 11 initanim = Init_FSTailslide InitSpeed = 1.50000000000 Anim = FSTailslide_range OutAnim = FSTailslide_Out type = slide NoBlend = <NoBlend> 
	GrindBail = GrindFallLR Extratricks = Extra_FS_Grinds IsExtra = <IsExtra> } 
ENDSCRIPT

SCRIPT Trick_Tailslide_BS 
	IF BadLedge 
		Goto Trick_NoseSlide_FS_ok Params = { IsExtra = <IsExtra> NoBlend = <NoBlend> } 
	ELSE 
		Goto Trick_Tailslide_BS_ok Params = { IsExtra = <IsExtra> NoBlend = <NoBlend> } 
	ENDIF 
ENDSCRIPT

SCRIPT Trick_Tailslide_BS_ok Name = #"BS Tailslide" 
	Grind { Name = <Name> score = 150 GrindTweak = 11 initanim = Init_Tailslide InitSpeed = 1.50000000000 Anim = Tailslide_range OutAnim = BSTailslide_Out type = slide NoBlend = <NoBlend> 
	GrindBail = BackwardsGrindBails Extratricks = Extra_BS_Grinds IsExtra = <IsExtra> } 
ENDSCRIPT

SCRIPT Trick_Tailslide_FS_180 
	FlipAndRotate 
	BoardRotateAfter 
	Goto Trick_Tailslide_BS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_Tailslide_BS_180 
	FlipAndRotate 
	BoardRotateAfter 
	Goto Trick_Tailslide_FS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_NoseSlide_FS 
	IF BadLedge 
		Goto Trick_Tailslide_BS_ok Params = { IsExtra = <IsExtra> NoBlend = <NoBlend> } 
	ELSE 
		Goto Trick_NoseSlide_FS_ok Params = { IsExtra = <IsExtra> NoBlend = <NoBlend> } 
	ENDIF 
ENDSCRIPT

SCRIPT Trick_NoseSlide_FS_ok Name = #"FS Noseslide" 
	Grind { Name = <Name> score = 150 GrindTweak = 11 initanim = Init_FSNoseslide InitSpeed = 1.50000000000 Anim = FSNoseslide_range type = slide Nollie = yes OutAnim = FSNoseSlide_Out NoBlend = <NoBlend> 
	GrindBail = BackwardsGrindBails Extratricks = Extra_FS_Grinds IsExtra = <IsExtra> } 
ENDSCRIPT

SCRIPT Trick_NoseSlide_BS 
	IF BadLedge 
		Goto Trick_Tailslide_FS_ok Params = { IsExtra = <IsExtra> NoBlend = <NoBlend> } 
	ELSE 
		Goto Trick_NoseSlide_BS_ok Params = { IsExtra = <IsExtra> NoBlend = <NoBlend> } 
	ENDIF 
ENDSCRIPT

SCRIPT Trick_NoseSlide_BS_ok Name = #"BS Noseslide" 
	Grind { Name = <Name> score = 150 GrindTweak = 11 initanim = Init_Noseslide InitSpeed = 1.50000000000 Anim = Noseslide_range OutAnim = BSNoseslide_Out type = slide Nollie = yes NoBlend = <NoBlend> 
	GrindBail = GrindFallLR Extratricks = Extra_BS_Grinds IsExtra = <IsExtra> } 
ENDSCRIPT

SCRIPT Trick_Noseslide_FS_180 
	FlipAndRotate 
	BoardRotateAfter 
	Goto Trick_NoseSlide_BS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_Noseslide_BS_180 
	FlipAndRotate 
	BoardRotateAfter 
	Goto Trick_NoseSlide_FS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_Nosegrind_FS Name = #"FS Nosegrind" 
	Grind { Name = <Name> score = 100 initanim = Init_Nosegrind InitSpeed = 1.50000000000 Anim = NoseGrind_Range type = Grind Nollie = yes NoBlend = <NoBlend> 
		GrindBail = FiftyFiftyFall Extratricks = Extra_FS_Grinds IsExtra = <IsExtra> 
	SparksPos = front } 
ENDSCRIPT

SCRIPT Trick_Nosegrind_BS Name = #"BS Nosegrind" 
	Grind { Name = <Name> score = 100 initanim = Init_Nosegrind InitSpeed = 1.50000000000 Anim = NoseGrind_Range type = Grind Nollie = yes NoBlend = <NoBlend> 
		GrindBail = FiftyFiftyFall Extratricks = Extra_BS_Grinds IsExtra = <IsExtra> 
	SparksPos = front } 
ENDSCRIPT

SCRIPT Trick_NoseGrind_BS_180 
	FlipAndRotate 
	BoardRotateAfter 
	Goto Trick_5_0_FS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_NoseGrind_FS_180 
	FlipAndRotate 
	BoardRotateAfter 
	Goto Trick_5_0_BS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_5_0_FS Name = #"FS 5-0" 
	Grind { Name = <Name> score = 100 initanim = Init_Tailgrind InitSpeed = 1.50000000000 Anim = TailGrind_Range type = Grind NoBlend = <NoBlend> 
	GrindBail = FiftyFiftyFall Extratricks = Extra_FS_Grinds IsExtra = <IsExtra> } 
ENDSCRIPT

SCRIPT Trick_5_0_BS Name = #"BS 5-0" 
	Grind { Name = <Name> score = 100 initanim = Init_Tailgrind InitSpeed = 1.50000000000 Anim = TailGrind_Range type = Grind NoBlend = <NoBlend> 
	GrindBail = FiftyFiftyFall Extratricks = Extra_BS_Grinds IsExtra = <IsExtra> } 
ENDSCRIPT

SCRIPT Trick_5_0_FS_180 
	FlipAndRotate 
	BoardRotateAfter 
	Goto Trick_Nosegrind_BS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_5_0_BS_180 
	FlipAndRotate 
	BoardRotateAfter 
	Goto Trick_Nosegrind_BS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_Crooked_FS Name = #"FS Crooked" 
	Grind { Name = <Name> score = 125 GrindTweak = 9 initanim = Init_FSCrooked InitSpeed = 1.50000000000 Anim = FSCrooked_range Nollie = yes NoBlend = <NoBlend> 
		GrindBail = FiftyFiftyFall Extratricks = Extra_FS_Grinds IsExtra = <IsExtra> 
	type = Grind SparksPos = front } 
ENDSCRIPT

SCRIPT Trick_Crooked_FS_rot 
	Rotate 
	Goto Trick_Crooked_FS 
ENDSCRIPT

SCRIPT Trick_Crooked_BS Name = #"BS Crooked" 
	Grind { Name = <Name> score = 125 GrindTweak = 9 initanim = Init_BSCrooked InitSpeed = 1.50000000000 Anim = BSCrooked_range Nollie = yes NoBlend = <NoBlend> 
		GrindBail = FiftyFiftyFall Extratricks = Extra_BS_Grinds IsExtra = <IsExtra> 
	type = Grind SparksPos = front } 
ENDSCRIPT

SCRIPT Trick_Crooked_FS_180 
	IF Backwards 
		printf "I\'m backwards............" 
	ENDIF 
	FlipAndRotate 
	BoardRotateAfter 
	Goto Trick_Crooked_BS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_Crooked_BS_180 
	FlipAndRotate 
	BoardRotateAfter 
	Goto Trick_Crooked_FS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_NGCRook_FS_rot 
	Rotate 
	printf "fixed it bitches................................" 
	Goto Trick_NGCRook_FS 
ENDSCRIPT

SCRIPT Trick_NGCRook_FS Name = #"FS Overcrook" 
	Grind { Name = <Name> score = 125 GrindTweak = 9 initanim = Init_FSOvercrook InitSpeed = 1.50000000000 Anim = FSOvercrook_range type = Grind Nollie = yes NoBlend = <NoBlend> 
		GrindBail = FiftyFiftyFall Extratricks = Extra_FS_Grinds IsExtra = <IsExtra> 
	SparksPos = front } 
ENDSCRIPT

SCRIPT Trick_NGCrook_BS Name = #"BS Overcrook" 
	Grind { Name = <Name> score = 125 GrindTweak = 9 initanim = Init_BSOvercrook InitSpeed = 1.50000000000 Anim = BSOvercrook_range type = Grind Nollie = yes NoBlend = <NoBlend> 
		GrindBail = FiftyFiftyFall Extratricks = Extra_BS_Grinds IsExtra = <IsExtra> 
	SparksPos = front } 
ENDSCRIPT

SCRIPT Trick_NGCRook_FS_180 
	FlipAndRotate 
	Goto Trick_NGCrook_BS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_NGCrook_BS_180 
	FlipAndRotate 
	Goto Trick_NGCRook_FS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_Smith_FS Name = #"FS Smith" 
	Grind { Name = <Name> score = 125 GrindTweak = 9 initanim = Init_FSSmith InitSpeed = 1.50000000000 Anim = FSSmith_range type = Grind NoBlend = <NoBlend> 
		GrindBail = FiftyFiftyFall Extratricks = Extra_FS_Grinds IsExtra = <IsExtra> 
	SparksPos = front } 
ENDSCRIPT

SCRIPT Trick_Smith_FS_rot 
	Rotate 
	Goto Trick_Smith_FS 
ENDSCRIPT

SCRIPT Trick_Smith_BS Name = #"BS Smith" 
	Grind { Name = <Name> score = 125 GrindTweak = 9 initanim = Init_BSSmith InitSpeed = 1.50000000000 Anim = BSSmith_range type = Grind NoBlend = <NoBlend> 
		GrindBail = FiftyFiftyFall Extratricks = Extra_BS_Grinds IsExtra = <IsExtra> 
	SparksPos = front } 
ENDSCRIPT

SCRIPT Trick_Smith_FS_180 
	FlipAndRotate 
	Goto Trick_Smith_BS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_Smith_BS_180 
	FlipAndRotate 
	Goto Trick_Smith_FS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_Feeble_FS Name = #"FS Feeble" 
	Grind { Name = <Name> score = 125 GrindTweak = 9 initanim = Init_FSFeeble InitSpeed = 1.50000000000 Anim = FSFeeble_range type = Grind NoBlend = <NoBlend> 
		GrindBail = FiftyFiftyFall Extratricks = Extra_FS_Grinds IsExtra = <IsExtra> 
	SparksPos = front } 
ENDSCRIPT

SCRIPT Trick_Feeble_FS_rot 
	Rotate 
	Goto Trick_Feeble_FS 
ENDSCRIPT

SCRIPT Trick_Feeble_BS Name = #"BS Feeble" 
	Grind { Name = <Name> score = 125 GrindTweak = 9 initanim = Init_BSFeeble InitSpeed = 1.50000000000 Anim = BSFeeble_range type = Grind NoBlend = <NoBlend> 
		GrindBail = FiftyFiftyFall Extratricks = Extra_BS_Grinds IsExtra = <IsExtra> 
	SparksPos = rear } 
ENDSCRIPT

SCRIPT Trick_Feeble_FS_180 
	FlipAndRotate 
	Goto Trick_Feeble_BS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_Feeble_BS_180 
	FlipAndRotate 
	Goto Trick_Feeble_FS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_Bluntslide_BS Name = #"BS Bluntslide" 
	Grind { Name = <Name> score = 250 GrindTweak = 18 initanim = Init_BSBluntSlide InitSpeed = 1.50000000000 Anim = BSBluntSlide_range type = slide NoBlend = <NoBlend> 
		GrindBail = GrindFallLR Extratricks = Extra_BS_Grinds IsExtra = <IsExtra> 
	SparksPos = rear } 
ENDSCRIPT

SCRIPT Trick_Bluntslide_FS Name = #"FS Bluntslide" 
	Grind { Name = <Name> score = 250 GrindTweak = 18 initanim = Init_FSBluntSlide InitSpeed = 1.50000000000 Anim = FSBluntSlide_range type = slide NoBlend = <NoBlend> 
		GrindBail = BackwardsGrindBails Extratricks = Extra_FS_Grinds IsExtra = <IsExtra> 
	SparksPos = front } 
ENDSCRIPT

SCRIPT Trick_NoseBluntSlide_BS Name = #"BS Nosebluntslide" 
	Grind { Name = <Name> score = 250 GrindTweak = 18 initanim = Init_BSNoseblunt InitSpeed = 1.50000000000 Anim = BSNoseblunt_range type = slide NoBlend = <NoBlend> 
		GrindBail = BackwardsGrindBails Extratricks = Extra_BS_Grinds IsExtra = <IsExtra> Nollie = yes 
	SparksPos = rear } 
ENDSCRIPT

SCRIPT Trick_NoseBluntSlide_FS Name = #"FS Nosebluntslide" 
	Grind { Name = <Name> score = 250 GrindTweak = 18 initanim = Init_FSNoseblunt InitSpeed = 1.50000000000 Anim = FSNoseblunt_range type = slide NoBlend = <NoBlend> 
		GrindBail = GrindFallLR Nollie = yes IsExtra = <IsExtra> Extratricks = Extra_FS_Grinds 
	SparksPos = front } 
ENDSCRIPT

SCRIPT Trick_Bluntslide_BS_180 
	FlipAndRotate 
	BoardRotateAfter 
	Goto Trick_Bluntslide_BS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_Bluntslide_FS_180 
	Rotate 
	BoardRotateAfter 
	Goto Trick_Bluntslide_FS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_Nosebluntslide_BS_180 
	Rotate 
	BoardRotateAfter 
	Goto Trick_NoseBluntSlide_BS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_Nosebluntslide_FS_180 
	Rotate 
	BoardRotateAfter 
	Goto Trick_NoseBluntSlide_FS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_DoubleBluntSlide2 
	Grind { Name = #"Double Blunt Slide" score = GRINDTAP_SCORE initanim = DoubleBlunt_Init InitSpeed = 1.50000000000 Anim = DoubleBlunt_Idle Idle type = slide NoBlend = <NoBlend> 
	GrindBail = BackwardsGrindBails Extratricks = Extra_FS_Grinds IsATap IsExtra = <IsExtra> } 
ENDSCRIPT

SCRIPT Trick_DoubleBluntSlide2_180 
	BackwardsGrind Grind = Trick_DoubleBluntSlide2 
ENDSCRIPT

SCRIPT Trick_Salad_FS Name = #"FS Salad" 
	Grind { Name = <Name> initanim = FSSaladGrind_Init InitSpeed = 1.50000000000 Anim = FSSaladGrind_range type = Grind NoBlend = <NoBlend> 
	GrindBail = BackwardsGrindBails Extratricks = Extra_FS_Grinds IsATap IsExtra = <IsExtra> } 
ENDSCRIPT

SCRIPT Trick_Salad_BS Name = #"BS Salad" 
	Grind { Name = <Name> initanim = BSSaladGrind_Init InitSpeed = 1.50000000000 Anim = BSSaladGrind_range type = Grind NoBlend = <NoBlend> 
	GrindBail = GrindFallLR Extratricks = Extra_BS_Grinds IsATap IsExtra = <IsExtra> } 
ENDSCRIPT

SCRIPT Trick_Salad_FS_180 
	FlipAndRotate 
	Goto Trick_Salad_BS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_Salad_BS_180 
	FlipAndRotate 
	Goto Trick_Salad_FS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_Hurricane_BS 
	Grind { Name = #"BS Hurricane" initanim = BSHurricaneGrind_Init InitSpeed = 1.50000000000 Anim = BSHurricaneGrind_Range OutAnim = Init_Tailgrind OutAnimBackwards = 1 NoBlend = <NoBlend> 
		GrindBail = GrindFallLR Nollie = yes FlipBeforeOutAnim OutAnimOnOllie Extratricks = Extra_BS_Grinds IsATap IsExtra = <IsExtra> 
	type = Grind SparksPos = rear } 
ENDSCRIPT

SCRIPT Trick_Hurricane_FS 
	Grind { Name = #"FS Hurricane" initanim = FSHurricaneGrind_Init InitSpeed = 1.50000000000 Anim = FSHurricaneGrind_Range OutAnim = Nollie type = Grind NoBlend = NoBlend 
	GrindBail = BackwardsGrindBails FlipBeforeOutAnim OutAnimOnOllie Extratricks = Extra_BS_Grinds IsATap IsExtra = <IsExtra> } 
ENDSCRIPT

SCRIPT Trick_Hurricane_BS_180 
	Rotate 
	BoardRotateAfter 
	Goto Trick_Hurricane_BS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_Hurricane_FS_180 
	Rotate 
	BoardRotateAfter 
	Goto Trick_Hurricane_FS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_Darkslide_BS 
	Grind { Name = #"BS Darkslide" initanim = Darkslide_Init InitSpeed = 1.50000000000 Anim = Darkslide_Range OutAnim = Darkslide_Out type = slide NoBlend = <NoBlend> 
	GrindBail = BackwardsGrindBails OutAnimOnOllie BoardRotate = yes Extratricks = Extra_BS_Grinds IsATap IsExtra = <IsExtra> } 
ENDSCRIPT

SCRIPT Trick_Darkslide_FS 
	Grind { Name = #"FS Darkslide" initanim = FSDarkSlide_Init InitSpeed = 1.50000000000 Anim = FSDarkSlide_Range OutAnim = FSDarkSlide_Out type = slide NoBlend = <NoBlend> 
	GrindBail = BackwardsGrindBails OutAnimOnOllie BoardRotate = yes Extratricks = Extra_BS_Grinds IsATap IsExtra = <IsExtra> } 
ENDSCRIPT

SCRIPT Trick_Darkslide_BS_180 
	Rotate 
	BoardRotateAfter 
	Goto Trick_Darkslide_BS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_Darkslide_FS_180 
	Rotate 
	BoardRotateAfter 
	Goto Trick_Darkslide_FS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_CrailSlide_BS 
	Grind { Name = #"BS Crail Slide" initanim = CrailSlide_Init Anim = CrailSlide_Range OutAnim = CrailSlide_Out type = Grind NoBlend = <NoBlend> 
	GrindBail = FiftyFiftyFall Extratricks = Extra_BS_Grinds OutAnimOnOllie Extratricks = Extra_BS_Grinds IsATap IsExtra = <IsExtra> } 
ENDSCRIPT

SCRIPT Trick_CrailSlide_FS 
	Grind { Name = #"FS Crail Slide" initanim = CrailSlide_Init Anim = CrailSlide_Range OutAnim = CrailSlide_Out type = Grind NoBlend = <NoBlend> 
	GrindBail = FiftyFiftyFall Extratricks = Extra_FS_Grinds OutAnimOnOllie Extratricks = Extra_BS_Grinds IsATap IsExtra = <IsExtra> } 
ENDSCRIPT

SCRIPT Trick_CrailSlide_BS_180 
	Rotate 
	BoardRotateAfter 
	Goto Trick_CrailSlide_BS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_CrailSlide_FS_180 
	Rotate 
	BoardRotateAfter 
	Goto Trick_CrailSlide_FS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_GrindOverturn_BS 
	Grind { Name = #"BS 5-0 Overturn" initanim = GrindOverturn_Init Anim = GrindOverturn_Range OutAnim = Init_Nosegrind OutAnimBackwards = 1 NoBlend = <NoBlend> 
		GrindBail = FiftyFiftyFall FlipBeforeOutAnim Extratricks = Extra_BS_Grinds Nollie = 1 Extratricks = Extra_BS_Grinds IsATap IsExtra = <IsExtra> 
	type = Grind SparksPos = rear } 
ENDSCRIPT

SCRIPT Trick_GrindOverturn_FS 
	Grind { Name = #"FS 5-0 Overturn" initanim = GrindOverturn_Init Anim = GrindOverturn_Range OutAnim = Init_Nosegrind OutAnimBackwards = 1 NoBlend = <NoBlend> 
		GrindBail = FiftyFiftyFall FlipBeforeOutAnim Extratricks = Extra_FS_Grinds Nollie = 1 Extratricks = Extra_BS_Grinds IsATap IsExtra = <IsExtra> 
	type = Grind SparksPos = rear } 
ENDSCRIPT

SCRIPT Trick_GrindOverturn_BS_180 
	Rotate 
	BoardRotateAfter 
	Goto Trick_GrindOverturn_BS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_GrindOverturn_FS_180 
	Rotate 
	BoardRotateAfter 
	Goto Trick_GrindOverturn_FS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_HangTenNoseGrind_BS 
	Grind { Name = #"Hang Ten Nosegrind" initanim = HangTenNoseGrind_Init InitSpeed = 1.50000000000 Anim = HangTenNoseGrind_Range OutAnim = HangTenNoseGrind_Out type = Grind NoBlend = <NoBlend> 
	GrindBail = FiftyFiftyFall Extratricks = Extra_BS_Grinds Nollie Extratricks = Extra_BS_Grinds IsATap IsExtra = <IsExtra> } 
ENDSCRIPT

SCRIPT Trick_HangTenNoseGrind_FS 
	Grind { Name = #"Hang Ten Nosegrind" initanim = HangTenNoseGrind_Init InitSpeed = 1.50000000000 Anim = HangTenNoseGrind_Range OutAnim = HangTenNoseGrind_Out type = Grind NoBlend = <NoBlend> 
	GrindBail = FiftyFiftyFall Extratricks = Extra_FS_Grinds Nollie Extratricks = Extra_BS_Grinds IsATap IsExtra = <IsExtra> } 
ENDSCRIPT

SCRIPT Trick_HangTenNoseGrind_BS_180 
	Rotate 
	BoardRotateAfter 
	Goto Trick_HangTenNoseGrind_BS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_HangTenNoseGrind_FS_180 
	Rotate 
	BoardRotateAfter 
	Goto Trick_HangTenNoseGrind_FS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_NosegrindPivot_BS 
	Grind { Name = #"Nosegrind to Pivot" initanim = NosegrindPivot_Init InitSpeed = 1.75000000000 Anim = NosegrindPivot_Range OutAnim = Init_Tailgrind OutAnimBackwards = 1 NoBlend = NoBlend 
		GrindBail = FiftyFiftyFall BoardRotate = yes FlipBeforeOutAnim EarlyOut = Init_Tailgrind Extratricks = Extra_BS_Grinds IsATap IsExtra = <IsExtra> 
	type = Grind SparksPos = front } 
ENDSCRIPT

SCRIPT Trick_NosegrindPivot_FS 
	Goto Trick_NosegrindPivot_BS Params = { IsExtra = IsExtra } 
ENDSCRIPT

SCRIPT Trick_NosegrindPivot_BS_180 
	Rotate 
	BoardRotateAfter 
	Goto Trick_NosegrindPivot_BS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_NosegrindPivot_FS_180 
	Goto Trick_NosegrindPivot_BS_180 
ENDSCRIPT

SCRIPT Trick_Muska_Burn_BS Name = #"BS Muska 5-0 Flames" 
	Grind { Name = <Name> score = 600 initanim = Special_Muska_Burn_init Anim = Special_Muska_Burn_range OutAnim = Special_Muska_Burn_out type = Grind NoBlend = <NoBlend> 
		GrindBail = FiftyFiftyFall IsSpecial Extratricks = Extra_BS_Grinds IsExtra = <IsExtra> 
	SparkPos = rear Stream = Spec_Muska01 } 
ENDSCRIPT

SCRIPT Trick_Muska_Burn_FS Name = #"FS Muska 5-0 Flames" 
	Grind { Name = <Name> score = 600 initanim = Special_Muska_Burn_init Anim = Special_Muska_Burn_range OutAnim = Special_Muska_Burn_out type = Grind NoBlend = <NoBlend> 
	GrindBail = FiftyFiftyFall IsSpecial Extratricks = Extra_FS_Grinds IsExtra = <IsExtra> Stream = Spec_Muska01 } 
ENDSCRIPT

SCRIPT Trick_Muska_Burn_BS_180 
	FlipAndRotate 
	BoardRotateAfter 
	Goto Trick_Muska_Burn_BS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_Muska_Burn_FS_180 
	FlipAndRotate 
	BoardRotateAfter 
	Goto Trick_Muska_Burn_FS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_Worm_BS Name = #"BS Worm" 
	Grind { Name = <Name> score = 600 initanim = Special_Muska_Worm_Init Anim = Special_Muska_Worm_idle Idle OutAnim = Special_Muska_Worm_out type = Grind NoBlend = <NoBlend> 
		GrindBail = FiftyFiftyFall IsSpecial Extratricks = Extra_BS_Grinds IsExtra = <IsExtra> 
	SparkPos = rear Stream = Spec_Muska02 } 
ENDSCRIPT

SCRIPT Trick_Worm_FS Name = #"FS Worm" 
	Grind { Name = <Name> score = 600 initanim = Special_Muska_Worm_Init Anim = Special_Muska_Worm_idle Idle OutAnim = Special_Muska_Worm_out type = Grind NoBlend = <NoBlend> 
	GrindBail = FiftyFiftyFall IsSpecial Extratricks = Extra_FS_Grinds IsExtra = <IsExtra> Stream = Spec_Muska02 } 
ENDSCRIPT

SCRIPT Trick_Worm_BS_180 
	FlipAndRotate 
	BoardRotateAfter 
	Goto Trick_Worm_BS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_Worm_FS_180 
	FlipAndRotate 
	BoardRotateAfter 
	Goto Trick_Worm_FS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_TheBird_BS Name = #"BS TheBird" 
	Grind { Name = <Name> score = 600 initanim = Special_Hand_TheBird_Init Anim = Special_Hand_TheBird_Range OutAnim = Special_Hand_TheBird_Out type = Grind NoBlend = <NoBlend> 
		GrindBail = FiftyFiftyFall IsSpecial Extratricks = Extra_BS_Grinds IsExtra = <IsExtra> 
	SparkPos = rear Stream = Spec_TheHand01 } 
ENDSCRIPT

SCRIPT Trick_TheBird_FS Name = #"FS TheBird" 
	Grind { Name = <Name> score = 600 initanim = Special_Hand_TheBird_Init Anim = Special_Hand_TheBird_Range OutAnim = Special_Hand_TheBird_Out type = Grind NoBlend = <NoBlend> 
	GrindBail = FiftyFiftyFall IsSpecial Extratricks = Extra_FS_Grinds IsExtra = <IsExtra> Stream = Spec_TheHand01 } 
ENDSCRIPT

SCRIPT Trick_TheBird_BS_180 
	FlipAndRotate 
	BoardRotateAfter 
	Goto Trick_TheBird_BS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_TheBird_FS_180 
	FlipAndRotate 
	BoardRotateAfter 
	Goto Trick_TheBird_FS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_BullF_Sword_BS Name = #"BS Espana Sword Slide" 
	Grind { Name = <Name> score = 600 initanim = Special_BullF_Sword_Init Anim = Special_BullF_Sword_Idle Idle OutAnim = Special_BullF_Sword_Out type = Grind NoBlend = <NoBlend> 
	GrindBail = FiftyFiftyFall IsSpecial Extratricks = Extra_BS_Grinds IsExtra = <IsExtra> SparkPos = rear SpecialItem_details = Sword_details Stream = Spec_Toreador01 } 
ENDSCRIPT

SCRIPT Trick_BullF_Sword_FS Name = #"FS Espana Sword Slide" 
	Grind { Name = <Name> score = 600 initanim = Special_BullF_Sword_Init Anim = Special_BullF_Sword_Idle Idle OutAnim = Special_BullF_Sword_Out type = Grind NoBlend = <NoBlend> 
	GrindBail = FiftyFiftyFall IsSpecial Extratricks = Extra_FS_Grinds IsExtra = <IsExtra> SpecialItem_details = Sword_details Stream = Spec_Toreador01 } 
ENDSCRIPT

SCRIPT Trick_BullF_Sword_BS_180 
	FlipAndRotate 
	BoardRotateAfter 
	Goto Trick_BullF_Sword_BS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_BullF_Sword_FS_180 
	FlipAndRotate 
	BoardRotateAfter 
	Goto Trick_BullF_Sword_FS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_Bam_Chainsaw_BS Name = #"BS Chainsaw Rocker" 
	Grind { Name = <Name> score = 600 initanim = Special_Bam_Chainsaw_Init Anim = Special_Bam_Chainsaw_Idle Idle OutAnim = Special_Bam_Chainsaw_Out type = slide NoBlend = <NoBlend> 
	GrindBail = GrindFallLR IsSpecial Extratricks = Extra_BS_Grinds IsExtra = <IsExtra> SparkPos = rear SpecialItem_details = Chainsaw_details Stream = Spec_Margera02 } 
ENDSCRIPT

SCRIPT Trick_Bam_Chainsaw_FS Name = #"FS Chainsaw Rocker" 
	Grind { Name = <Name> score = 600 initanim = Special_Bam_Chainsaw_Init Anim = Special_Bam_Chainsaw_Idle Idle OutAnim = Special_Bam_Chainsaw_Out type = slide NoBlend = <NoBlend> 
	GrindBail = GrindFallLR IsSpecial Extratricks = Extra_FS_Grinds IsExtra = <IsExtra> SpecialItem_details = Chainsaw_details Stream = Spec_Margera02 } 
ENDSCRIPT

SCRIPT Trick_Bam_Chainsaw_BS_180 
	FlipAndRotate 
	BoardRotateAfter 
	Goto Trick_Bam_Chainsaw_BS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_Bam_Chainsaw_FS_180 
	FlipAndRotate 
	BoardRotateAfter 
	Goto Trick_Bam_Chainsaw_FS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_ShecklerPrimo_BS Name = #"BS Shark" 
	Grind { Name = <Name> score = 600 initanim = Special_Sheckler_Primo_Init Anim = Special_Sheckler_Primo_Range OutAnim = Special_Sheckler_Primo_Out type = Grind NoBlend = <NoBlend> 
	GrindBail = FiftyFiftyFall IsSpecial Extratricks = Extra_BS_Grinds IsExtra = <IsExtra> SparkPos = rear SpecialItem_details = Shark_details Stream = Spec_Sheckler02 } 
ENDSCRIPT

SCRIPT Trick_ShecklerPrimo_FS Name = #"FS Shark" 
	Grind { Name = <Name> score = 600 initanim = Special_Sheckler_Primo_Init Anim = Special_Sheckler_Primo_Range OutAnim = Special_Sheckler_Primo_Out type = Grind NoBlend = <NoBlend> 
	GrindBail = FiftyFiftyFall IsSpecial Extratricks = Extra_FS_Grinds IsExtra = <IsExtra> SpecialItem_details = Shark_details Stream = Spec_Sheckler02 } 
ENDSCRIPT

SCRIPT Trick_ShecklerPrimo_BS_180 
	FlipAndRotate 
	BoardRotateAfter 
	Goto Trick_ShecklerPrimo_BS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_ShecklerPrimo_FS_180 
	FlipAndRotate 
	BoardRotateAfter 
	Goto Trick_ShecklerPrimo_FS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_Waxslide_BS Name = #"BS Waxslide" 
	Grind { Name = <Name> score = 600 initanim = Special_Shrek_Waxslide_Init Anim = Special_Shrek_Waxslide_Range OutAnim = Special_Shrek_Waxslide_Out type = slide NoBlend = <NoBlend> 
	GrindBail = GrindFallLR IsSpecial Extratricks = Extra_BS_Grinds IsExtra = <IsExtra> SparkPos = rear Stream = Spec_Shrek02 } 
ENDSCRIPT

SCRIPT Trick_Waxslide_FS Name = #"FS Waxslide" 
	Grind { Name = <Name> score = 600 initanim = Special_Shrek_Waxslide_Init Anim = Special_Shrek_Waxslide_Range OutAnim = Special_Shrek_Waxslide_Out type = slide NoBlend = <NoBlend> 
	GrindBail = GrindFallLR IsSpecial Extratricks = Extra_FS_Grinds IsExtra = <IsExtra> Stream = Spec_Shrek02 } 
ENDSCRIPT

SCRIPT Trick_Waxslide_BS_180 
	FlipAndRotate 
	BoardRotateAfter 
	Goto Trick_Waxslide_BS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_Waxslide_FS_180 
	FlipAndRotate 
	BoardRotateAfter 
	Goto Trick_Waxslide_FS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_Hero_BS Name = #"BS Hero" 
	Grind { Name = <Name> score = 600 initanim = Special_Soldier_AmerHero2_Init Anim = Special_Soldier_AmerHero2_Idle Idle OutAnim = Special_Soldier_AmerHero2_Out type = Grind NoBlend = <NoBlend> 
	GrindBail = FiftyFiftyFall IsSpecial Extratricks = Extra_BS_Grinds IsExtra = <IsExtra> SparkPos = rear SpecialItem_details = Flag_details Stream = Spec_CallofDuty02 } 
ENDSCRIPT

SCRIPT Trick_Hero_FS Name = #"FS Hero" 
	Grind { Name = <Name> score = 600 initanim = Special_Soldier_AmerHero2_Init Anim = Special_Soldier_AmerHero2_Idle Idle OutAnim = Special_Soldier_AmerHero2_Out type = Grind NoBlend = <NoBlend> 
	GrindBail = FiftyFiftyFall IsSpecial Extratricks = Extra_FS_Grinds IsExtra = <IsExtra> SpecialItem_details = Flag_details Stream = Spec_CallofDuty02 } 
ENDSCRIPT

SCRIPT Trick_Hero_BS_180 
	FlipAndRotate 
	BoardRotateAfter 
	Goto Trick_Hero_BS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_Hero_FS_180 
	FlipAndRotate 
	BoardRotateAfter 
	Goto Trick_Hero_FS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_RockNRollSwitch_BS Name = #"BS Lip Bodyvarial" 
	Grind { Name = <Name> score = 600 initanim = Special_Bob_RockNRollSwitch_Init Anim = Special_Bob_RockNRollSwitch_Idle Idle OutAnim = Special_Bob_RockNRollSwitch_Out type = slide NoBlend = <NoBlend> 
	GrindBail = GrindFallLR IsSpecial Extratricks = Extra_BS_Grinds IsExtra = <IsExtra> SparkPos = rear Stream = Spec_Burnquist02 } 
ENDSCRIPT

SCRIPT Trick_RockNRollSwitch_FS Name = #"FS Board Bodyvarial" 
	Grind { Name = <Name> score = 600 initanim = Special_Bob_RockNRollSwitch_Init Anim = Special_Bob_RockNRollSwitch_Idle Idle OutAnim = Special_Bob_RockNRollSwitch_Out type = slide NoBlend = <NoBlend> 
	GrindBail = GrindFallLR IsSpecial Extratricks = Extra_FS_Grinds IsExtra = <IsExtra> Stream = Spec_Burnquist02 } 
ENDSCRIPT

SCRIPT Trick_RockNRollSwitch_BS_180 
	FlipAndRotate 
	BoardRotateAfter 
	Goto Trick_RockNRollSwitch_BS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_RockNRollSwitch_FS_180 
	FlipAndRotate 
	BoardRotateAfter 
	Goto Trick_RockNRollSwitch_FS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_BiteBoard_BS Name = #"Bite Board" 
	IF BoardIsRotated 
		BoardRotate 
	ENDIF 
	Grind { Name = <Name> score = 600 initanim = Special_SteveO_BiteBoard Anim = FiftyFifty2_range OutAnim = Init_FiftyFifty OutAnimBackwards = 1 type = Grind NoBlend = <NoBlend> 
	GrindBail = FiftyFiftyFall IsSpecial Extratricks = Extra_BS_Grinds IsExtra = <IsExtra> SparkPos = rear Stream = Spec_SteveO01 } 
ENDSCRIPT

SCRIPT Trick_BiteBoard_FS Name = #"Bite Board" 
	IF BoardIsRotated 
		BoardRotate 
	ENDIF 
	Grind { Name = <Name> score = 600 initanim = Special_SteveO_BiteBoard Anim = FiftyFifty2_range OutAnim = Init_FiftyFifty OutAnimBackwards = 1 type = Grind NoBlend = <NoBlend> 
	GrindBail = FiftyFiftyFall IsSpecial Extratricks = Extra_FS_Grinds IsExtra = <IsExtra> Stream = Spec_SteveO01 } 
ENDSCRIPT

SCRIPT Trick_BiteBoard_BS_180 
	FlipAndRotate 
	BoardRotateAfter 
	Goto Trick_BiteBoard_BS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_BiteBoard_FS_180 
	FlipAndRotate 
	BoardRotateAfter 
	Goto Trick_BiteBoard_FS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_Franklin_Grind2 
	SpawnScript Franklin_Grind_SFX 
	Grind { Name = #"Franklin Grind!!!" score = 600 initanim = Special_FranklinGrind_Init Anim = Special_FranklinGrind_Idle Idle OutAnim = Special_FranklinGrind_Out type = slide NoBlend = yes 
	GrindBail = GrindFallLR IsSpecial OutAnimOnOllie Nollie = no Extratricks = Extra_BS_Grinds SpecialItem_details = FranklinKite_details IsExtra = <IsExtra> } 
ENDSCRIPT

SCRIPT Trick_Franklin_Grind2_180 
	Rotate 
	BoardRotateAfter 
	Goto Trick_Franklin_Grind2 Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_Shortbus2 
	Grind { Name = #"Stupid Grind" score = 500 initanim = Shortbus_Init Anim = Shortbus_idle Idle OutAnim = Shortbus_Out type = Grind NoBlend = <NoBlend> 
	GrindBail = FiftyFiftyFall Nollie = yes IsSpecial OutAnimOnOllie Extratricks = Extra_BS_Grinds Extratricks = Extra_BS_Grinds IsExtra = <IsExtra> } 
ENDSCRIPT

SCRIPT Trick_Shortbus2_180 
	Rotate 
	BoardRotateAfter 
	Goto Trick_Shortbus2 Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_RodneyGrind2 
	Grind { Name = #"Rodney Primo" score = 500 initanim = RodneyGrind_Init Anim = RodneyGrind_range OutAnim = RodneyGrind_Out type = Grind BoardRotate = yes 
	GrindBail = FiftyFiftyFall Nollie = yes IsSpecial InitSpeed = 0.69999998808 OutAnimOnOllie Extratricks = Extra_BS_Grinds IsExtra = <IsExtra> } 
ENDSCRIPT

SCRIPT Trick_GrindNBarf2 
	Grind { Name = #"Grind N Barf" InitSpeed = 1.50000000000 score = 500 initanim = GrindNBarf_Init Anim = GrindNBarf_range OutAnim = GrindNBarf_Out type = Grind BoardRotate = yes 
	GrindBail = FiftyFiftyFall Nollie = yes IsSpecial OutAnimOnOllie Stream = DryHeaveSpecial Extratricks = Extra_BS_Grinds IsExtra = <IsExtra> } 
ENDSCRIPT

SCRIPT Trick_RowleyDarkSlideHandStand2 
	Grind { Name = #"Darkslide Handstand" score = 700 initanim = RowleyDarkSlideHandStand_Init Anim = RowleyDarkSlideHandStand_range OutAnim = RowleyDarkSlideHandStand_Out type = slide NoBlend = yes 
	GrindBail = FiftyFiftyFall IsSpecial OutAnimOnOllie Extratricks = Extra_BS_Grinds IsExtra = <IsExtra> } 
ENDSCRIPT

SCRIPT Trick_RowleyDarkSlideHandStand2_180 
	Rotate 
	BoardRotateAfter 
	Goto Trick_RowleyDarkSlideHandStand2 Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_PrimoHandStand2 
	Grind { Name = #"Primo Handstand" score = 700 initanim = PrimoHandStand_Init Anim = PrimoHandStand_range OutAnim = PrimoHandStand_Out type = slide NoBlend = yes 
	GrindBail = FiftyFiftyFall IsSpecial OutAnimOnOllie IsSpecial Stream = nj_pipeignite Extratricks = Extra_BS_Grinds IsExtra = <IsExtra> } 
ENDSCRIPT

SCRIPT Trick_PrimoHandStand2_180 
	Rotate 
	BoardRotateAfter 
	Goto Trick_PrimoHandStand2 Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_OneFootDarkSlide2 
	Grind { Name = #"One Foot Darkslide" score = 600 initanim = OneFootDarkSlide_Init Anim = OneFootDarkSlide_range OutAnim = OneFootDarkSlide_Out type = slide NoBlend = yes 
	GrindBail = GrindFallLR IsSpecial OutAnimOnOllie Extratricks = Extra_BS_Grinds IsExtra = <IsExtra> } 
ENDSCRIPT

SCRIPT Trick_OneFootDarkslide2_180 
	Rotate 
	BoardRotateAfter 
	Goto Trick_OneFootDarkSlide2 Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_FiftyFiftySwitcheroo2 
	Grind { Name = #"5050 Switcheroo" score = 600 initanim = FiftyFiftySwitcheroo_Init Anim = FiftyFiftySwitcheroo_Idle Idle type = Grind 
	GrindBail = FiftyFiftyFall IsSpecial Speed = 3 Extratricks = Extra_BS_Grinds IsExtra = <IsExtra> } 
ENDSCRIPT

SCRIPT Trick_HCNHDF2 
	Grind { Name = #"Crooks DarkSlide" score = 700 initanim = HCNHDF_Init Anim = HCNHDF_range OutAnim = HCNHDF_Out InitSpeed = 1.50000000000 type = slide NoBlend = yes 
	GrindBail = BackwardsGrindBails IsSpecial OutAnimOnOllie Extratricks = Extra_BS_Grinds IsExtra = <IsExtra> } 
ENDSCRIPT

SCRIPT Trick_HCNHDF2_180 
	Rotate 
	BoardRotateAfter 
	Goto Trick_HCNHDF2 Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_FSNollie360FlipCrook2 
	Grind { Name = #"Nollie 360flip Crook" score = 600 initanim = FSNollie360FlipCrook_Init Anim = FSNollie360FlipCrook_range OutAnim = FSNollie360FlipCrook_Out type = Grind NoBlend = yes 
	GrindBail = FiftyFiftyFall IsSpecial OutAnimOnOllie Extratricks = Extra_BS_Grinds IsExtra = <IsExtra> } 
ENDSCRIPT

SCRIPT Trick_FSNollie360FlipCrook2_180 
	Rotate 
	BoardRotateAfter 
	Goto Trick_FSNollie360FlipCrook2 Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_MoonwalkGrind2 
	Grind { Name = #"Moonwalk Five-O" score = 600 initanim = Moonwalkgrind_Init Anim = Moonwalkgrind_idle Idle OutAnim = Moonwalkgrind_Out type = Grind NoBlend = yes 
	GrindBail = BackwardsGrindBails IsSpecial OutAnimOnOllie Extratricks = Extra_BS_Grinds IsExtra = <IsExtra> } 
ENDSCRIPT

SCRIPT Trick_MoonwalkGrind2_180 
	Rotate 
	BoardRotateAfter 
	Goto Trick_MoonwalkGrind2 Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_360ShovitNoseGrind2 
	Grind { Name = #"360 Shove-It NoseGrind" score = 600 initanim = _360ShovitNoseGrind_Init Anim = _360ShovitNoseGrind_range InitSpeed = 2.00000000000 OutAnim = _360ShovitNoseGrind_Out type = Grind NoBlend = yes 
	GrindBail = FiftyFiftyFall IsSpecial OutAnimOnOllie Extratricks = Extra_BS_Grinds IsExtra = <IsExtra> } 
ENDSCRIPT

SCRIPT Trick_360ShovitNoseGrind2_180 
	Rotate 
	BoardRotateAfter 
	Goto Trick_360ShovitNoseGrind2 Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_Coffin_BS 
	Grind { Name = #"BS Coffin" score = 500 initanim = CoffinGrind_Init Anim = CoffinGrind_Range OutAnim = CoffinGrind_Out type = Grind NoBlend = <NoBlend> 
	GrindBail = FiftyFiftyFall IsSpecial OutAnimOnOllie Extratricks = Extra_BS_Grinds IsExtra = <IsExtra> } 
ENDSCRIPT

SCRIPT Trick_Coffin_FS 
	Grind { Name = #"FS Coffin" score = 500 initanim = CoffinGrind_Init Anim = CoffinGrind_Range OutAnim = CoffinGrind_Out type = Grind NoBlend = <NoBlend> 
	GrindBail = FiftyFiftyFall IsSpecial OutAnimOnOllie Extratricks = Extra_BS_Grinds IsExtra = <IsExtra> } 
ENDSCRIPT

SCRIPT Trick_Coffin_BS_180 
	Rotate 
	BoardRotateAfter 
	Goto Trick_Coffin_BS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_Coffin_FS_180 
	Rotate 
	BoardRotateAfter 
	Goto Trick_Coffin_FS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_fandangle_BS 
	Grind { Name = #"BS Fandangle" score = 500 initanim = fandangle_Init Anim = fandangle_Range OutAnim = Fandangle_Out type = Grind NoBlend = <NoBlend> 
	GrindBail = FiftyFiftyFall IsSpecial Extratricks = Extra_BS_Grinds OutAnimOnOllie BoardRotate = yes Extratricks = Extra_FS_Grinds IsExtra = <IsExtra> } 
ENDSCRIPT

SCRIPT Trick_fandangle_FS 
	Grind { Name = #"FS Fandangle" score = 500 initanim = fandangle_Init Anim = fandangle_Range OutAnim = Fandangle_Out type = Grind NoBlend = <NoBlend> 
	GrindBail = FiftyFiftyFall IsSpecial Extratricks = Extra_FS_Grinds OutAnimOnOllie BoardRotate = yes Extratricks = Extra_FS_Grinds IsExtra = <IsExtra> } 
ENDSCRIPT

SCRIPT Trick_fandangle_BS_180 
	Rotate 
	BoardRotateAfter 
	Goto Trick_fandangle_BS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_fandangle_FS_180 
	Rotate 
	BoardRotateAfter 
	Goto Trick_fandangle_FS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_BigHitter_BS Extratricks = Extra_BS_Grinds 
	Grind { Name = #"Big Hitter II" score = 500 initanim = BigHitter_Init Anim = BigHitter_Range OutAnim = BigHitter_out type = slide NoBlend = <NoBlend> 
	GrindBail = GrindFallLR IsSpecial Extratricks = <Extratricks> OutAnimOnOllie } 
ENDSCRIPT

SCRIPT Trick_BigHitter_FS 
	Goto Trick_BigHitter_BS Params = { Extratricks = Extra_FS_Grinds } 
ENDSCRIPT

SCRIPT Trick_BigHitter_BS_180 
	Rotate 
	BoardRotateAfter 
	Goto Trick_BigHitter_BS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_BigHitter_FS_180 
	Goto Trick_BigHitter_BS_180 
ENDSCRIPT

SCRIPT Trick_TailblockSlide_BS 
	Grind { Name = #"Tailblock Slide" score = 500 initanim = TailblockSlide_Init Anim = TailblockSlide_Range OutAnim = TailblockSlide_Init type = slide NoBlend = <NoBlend> 
	GrindBail = FiftyFiftyFall Extratricks = <Extratricks> IsSpecial Extratricks = Extra_BS_Grinds } 
ENDSCRIPT

SCRIPT Trick_TailblockSlide_FS 
	Goto Trick_TailblockSlide_BS Params = { Extratricks = Extra_FS_Grinds } 
ENDSCRIPT

SCRIPT Trick_TailblockSlide_BS_180 
	Rotate 
	BoardRotateAfter 
	Goto Trick_TailblockSlide_BS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_TailblockSlide_FS_180 
	Goto Trick_TailblockSlide_BS_180 
ENDSCRIPT

SCRIPT Trick_DrunkGrind_BS 
	Grind { Name = #"S.U.I Grind" score = 500 initanim = DrunkGrind_Init Anim = DrunkGrind_Idle type = Grind NoBlend = <NoBlend> 
	GrindBail = FiftyFiftyFall IsSpecial OutAnimOnOllie Extratricks = Extra_FS_Grinds IsExtra = <IsExtra> } 
ENDSCRIPT

SCRIPT Trick_NoseSlideLipSlide_FS 
	IF BadLedge 
		Goto Trick_NoseSlideLipSlide_BS_ok 
	ELSE 
		Goto Trick_NoseSlideLipSlide_FS_ok 
	ENDIF 
ENDSCRIPT

SCRIPT Trick_NoseSlideLipSlide_FS_ok Name = #"FS Noseslide LipSlide" 
	Grind { Name = <Name> score = 500 initanim = FSNoseSlideLipSlide Anim = BSBoardslide_range Nollie = yes NoBlend = <NoBlend> 
		GrindBail = FiftyFiftyFall Extratricks = Extra_FS_Grinds IsSpecial IsExtra = <IsExtra> 
	type = slide SparkPos = front } 
ENDSCRIPT

SCRIPT Trick_NoseSlideLipSlide_BS 
	IF BadLedge 
		Goto Trick_NoseSlideLipSlide_FS_ok 
	ELSE 
		Goto Trick_NoseSlideLipSlide_BS_ok 
	ENDIF 
ENDSCRIPT

SCRIPT Trick_NoseSlideLipSlide_BS_ok Name = #"BS NoseSlide LipSlide" 
	Grind { Name = <Name> score = 500 initanim = BSNoseSlideLipSlide Anim = FSBoardslide_range Nollie = yes NoBlend = <NoBlend> 
		GrindBail = FiftyFiftyFall Extratricks = Extra_BS_Grinds IsSpecial IsExtra = <IsExtra> 
	type = slide SparkPos = rear } 
ENDSCRIPT

SCRIPT Trick_NoseSlideLipSlide_FS_180 
	FlipAndRotate 
	BoardRotateAfter 
	Goto Trick_NoseSlideLipSlide_BS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_NoseSlideLipSlide_BS_180 
	FlipAndRotate 
	BoardRotateAfter 
	Goto Trick_NoseSlideLipSlide_FS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_CrookedBigSpin_BS 
	Grind { Name = #"Crook BigSpinFlip Switch FS Crook" score = 500 special_item initanim = CrookBigSpinFlipCrook Anim = FSCrooked_range OutAnim = Init_FSCrooked OutAnimBackwards type = Grind NoBlend = <NoBlend> 
	GrindBail = BackwardsGrindBails IsSpecial FlipAfterInit Extratricks = Extra_FS_Grinds IsExtra = <IsExtra> } 
ENDSCRIPT

SCRIPT Trick_CrookedBigSpin_FS 
	Goto Trick_CrookedBigSpin_BS Params = { NoBlend = yes Name = #"Overcrook BigSpinFlip Overcrook" } 
ENDSCRIPT

SCRIPT Trick_CrookedBigSpin_BS_180 
	Rotate 
	BoardRotateAfter 
	Goto Trick_CrookedBigSpin_BS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_CrookedBigSpin_FS_180 
	Goto Trick_CrookedBigSpin_BS_180 
ENDSCRIPT

SCRIPT Trick_50Fingerflip2 
	Grind { Name = #"5-0 Fingerflip Nosegrind" score = 500 initanim = TailGrindFingerFlip Anim = NoseGrind_Range type = Grind NoBlend = <NoBlend> 
	GrindBail = FiftyFiftyFall IsSpecial Extratricks = Extra_BS_Grinds } 
ENDSCRIPT

SCRIPT Trick_50Fingerflip2_180 
	BackwardsGrind Grind = Trick_50Fingerflip2 
ENDSCRIPT

SCRIPT Trick_DaffyBrokenGrind2 
	Grind { Name = #"Daffy Grind" score = 500 initanim = DaffyBroken_Init Anim = DaffyBroken_Range type = Grind NoBlend = <NoBlend> 
	GrindBail = FiftyFiftyFall IsSpecial Extratricks = Extra_FS_Grinds SpecialItem_details = bustedboard_details } 
ENDSCRIPT

SCRIPT Trick_DaffyBrokenGrind2_180 
	BackwardsGrind Grind = Trick_DaffyBrokenGrind2 
ENDSCRIPT

SCRIPT Trick_BballSlide2_180 
	BackwardsGrind Grind = Trick_BballSlide2 
ENDSCRIPT

SCRIPT Trick_ElbowSmash2 
	Grind { Name = #"Elbow Smash" score = 500 initanim = ElbowSmash_Init Anim = ElbowSmash_Idle Idle OutAnim = Elbowsmash_out OutAnimOnOllie type = slide NoBlend = <NoBlend> Idle 
	GrindBail = FiftyFiftyFall ScreenShake = 60 IsSpecial } 
ENDSCRIPT

SCRIPT Trick_ElbowSmash2_180 
	Rotate 
	BoardRotateAfter 
	Goto Trick_ElbowSmash2 Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_OneFootSmith_FS Name = #"FS One Foot Smith" 
	Grind { Name = <Name> score = 500 initanim = SmithFS_Init Anim = SmithFS_Range type = slide NoBlend = <NoBlend> 
	GrindBail = GrindFallLR Extratricks = Extra_FS_Grinds IsSpecial IsExtra = <IsExtra> } 
ENDSCRIPT

SCRIPT Trick_OneFootSmith_BS Name = #"BS One Foot Smith" 
	Grind { Name = <Name> score = 500 initanim = Smith_Init Anim = Smith_Range type = Grind NoBlend = <NoBlend> 
	GrindBail = FiftyFiftyFall Extratricks = Extra_BS_Grinds IsSpecial IsExtra = <IsExtra> } 
ENDSCRIPT

SCRIPT Trick_OneFootSmith_FS_180 
	FlipAndRotate 
	Goto Trick_OneFootSmith_BS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT Trick_OneFootSmith_BS_180 
	FlipAndRotate 
	Goto Trick_OneFootSmith_FS Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT BackwardsGrind 
	Rotate 
	BoardRotateAfter 
	Goto <Grind> Params = { NoBlend = yes } 
ENDSCRIPT

SCRIPT PointRail 
	Vibrate Actuator = 0 Percent = 50 Duration = 0.10000000149 
	Obj_SpawnScript PointRailSparks 
	BroadcastEvent type = SkaterPointRail 
	SetTrickName #"Kissed the Rail" 
	SetTrickScore 50 
	Display NoMult 
	Goto Airborne Params = { AllowVibration } 
ENDSCRIPT

SCRIPT PointRailSpin init_anim = natas_spin_init range_anim = natas_spin_range 
	SetException Ex = Ollied Scr = ExitPointRailSpin 
	SetException Ex = OffMeterTop Scr = PointRailSpinBail 
	SetException Ex = OffMeterBottom Scr = PointRailSpinBail 
	SetException Ex = SkaterCollideBail Scr = SkaterCollideBail 
	SetRailSound slide 
	SetQueueTricks NoTricks 
	IF SkaterIsNamed natas 
		init_anim = special_natas_spin_init 
		range_anim = special_natas_spin_range 
	ENDIF 
	PlayAnim Anim = <init_anim> 
	Obj_WaitAnimFinished 
	DoBalanceTrick ButtonA = Right ButtonB = Left type = Grind 
	PlayAnim Anim = <range_anim> wobble 
	SetTrickName #"" 
	SetTrickScore 0 
	Display Blockspin 
	SetTrickName #"Natas Spin" 
	SetTrickScore 50 
	Display natas 
	Vibrate Actuator = 1 Percent = 50 Duration = 0.25000000000 
	Vibrate Actuator = 0 Percent = 50 
	OnExitRun Natas_Exit 
	Block 
ENDSCRIPT

SCRIPT Natas_Exit 
	Vibrate Actuator = 0 Percent = 0 
	SetTrickName #"" 
	SetTrickScore 0 
	Display Blockspin 
ENDSCRIPT

natas_exit_speed = 300 
SCRIPT ExitPointRailSpin 
	StopBalanceTrick 
	NoRailTricks 
	Obj_KillSpawnedScript Name = turn_on_rail_tricks 
	Obj_SpawnScript turn_on_rail_tricks 
	IF UpPressed 
		IF RightPressed 
			CheckNatasExitDirection dir = UpRight 
		ELSE 
			IF LeftPressed 
				CheckNatasExitDirection dir = UpLeft 
			ELSE 
				CheckNatasExitDirection dir = Up 
			ENDIF 
		ENDIF 
	ELSE 
		IF DownPressed 
			IF RightPressed 
				CheckNatasExitDirection dir = DownRight 
			ELSE 
				IF LeftPressed 
					CheckNatasExitDirection dir = DownLeft 
				ELSE 
					CheckNatasExitDirection dir = Down 
				ENDIF 
			ENDIF 
		ELSE 
			IF RightPressed 
				CheckNatasExitDirection dir = Right 
			ELSE 
				IF LeftPressed 
					CheckNatasExitDirection dir = Left 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	SetSpeed natas_exit_speed 
	Jump 
	DoNextTrick 
	Ollie OutAnim = Natas_spin_out JumpSpeed = 0 
ENDSCRIPT

SCRIPT turn_on_rail_tricks time = 10 
	Wait <time> frames 
	AllowRailtricks 
ENDSCRIPT

SCRIPT PointRailSpinBail 
	SetSpeed 200 
	PitchBail 
ENDSCRIPT

SCRIPT PointRailSparks 
	SetSparksPos rear 
	SparksOn RailNotRequired 
	Wait 0.20000000298 seconds 
	SparksOff 
ENDSCRIPT


