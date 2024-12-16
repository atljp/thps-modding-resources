
SCRIPT SK3_KillSkater 
	IF Obj_FlagNotSet FLAG_SKATER_KILLING 
		Obj_SetFlag FLAG_SKATER_KILLING 
		InBail 
		IF GotParam DeathSound 
			PlaySound <DeathSound> 
		ELSE 
			PlaySound BailBodyPunch01_11 
			PlaySound BailSlap01 
			PlaySound BailBodyFall01 
		ENDIF 
		IF NOT GotParam NoMessage 
			IF NOT GetGlobalFlag flag = NO_DISPLAY_HUD 
				IF NOT InSplitScreenGame 
					IF GotParam Message1 
						Create_Panel_Message { 
							style = panel_message_death 
							id = death_message 
							text = RANDOM(1, 1, 1, 1) 
								RANDOMCASE <Message1> 
								RANDOMCASE <message2> 
								RANDOMCASE <message3> 
								RANDOMCASE <message4> 
							RANDOMEND 
						} 
					ELSE 
						IF Driving 
							Create_Panel_Message { 
								style = panel_message_death 
								id = death_message 
								text = RANDOM(1, 1, 2) 
									RANDOMCASE "Don\'t drink and drive!" 
									RANDOMCASE "Learn to drive!" 
									RANDOMCASE "Out of bounds!" 
								RANDOMEND 
							} 
						ELSE 
							Create_Panel_Message { 
								style = panel_message_death 
								id = death_message 
								text = RANDOM(1, 1, 1, 1, 1, 1, 1, 1, 1, 4) 
									RANDOMCASE "You suck!" 
									RANDOMCASE "Don\'t do drugs!" 
									RANDOMCASE "Stay in school!" 
									RANDOMCASE "This is your brain on drugs!" 
									RANDOMCASE "Nice one!" 
									RANDOMCASE "Good one!" 
									RANDOMCASE "Hmmmmm..." 
									RANDOMCASE "Loser!" 
									RANDOMCASE "Who loaned you that board?" 
									RANDOMCASE "Out of bounds!" 
								RANDOMEND 
							} 
						ENDIF 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
		SK3_Killskater_Finish <...> 
	ENDIF 
ENDSCRIPT

SCRIPT SK3_KillSkater_Water 
	IF Obj_FlagNotSet FLAG_SKATER_KILLING 
		Obj_SetFlag FLAG_SKATER_KILLING 
		IF GotParam DeathSound 
			PlaySound <DeathSound> 
		ELSE 
			PlaySound FallWater 
		ENDIF 
		IF NOT InSplitScreenGame 
			IF NOT GetGlobalFlag flag = NO_DISPLAY_HUD 
				IF GotParam Message1 
					Create_Panel_Message { 
						style = panel_message_death 
						id = death_message 
						text = RANDOM(1, 1, 1, 1) 
							RANDOMCASE <Message1> 
							RANDOMCASE <message2> 
							RANDOMCASE <message3> 
							RANDOMCASE <message4> 
						RANDOMEND 
					} 
				ELSE 
					Create_Panel_Message { 
						style = panel_message_death 
						id = death_message 
						text = RANDOM(1, 1, 1, 1, 1, 1) 
							RANDOMCASE "All wet" 
							RANDOMCASE "You big drip!" 
							RANDOMCASE "WATER... BAAAD!" 
							RANDOMCASE "No swimming" 
							RANDOMCASE "You\'re drowning!" 
							RANDOMCASE "You\'re hosed!" 
						RANDOMEND 
					} 
				ENDIF 
			ENDIF 
		ENDIF 
		SK3_Killskater_Finish water r = 100 g = 100 b = 200 <...> 
	ENDIF 
ENDSCRIPT

SCRIPT SK3_KillSkater_Pungee 
	IF Obj_FlagNotSet FLAG_SKATER_KILLING 
		Obj_SetFlag FLAG_SKATER_KILLING 
		PlaySound FallPungee_11 
		IF NOT InSplitScreenGame 
			IF NOT GetGlobalFlag flag = NO_DISPLAY_HUD 
				IF NOT GotParam Lava 
					Create_Panel_Message { 
						style = panel_message_death 
						id = death_message 
						text = RANDOM(1, 1, 1, 1, 1) 
							RANDOMCASE "You got shafted" 
							RANDOMCASE "Who built that?!" 
							RANDOMCASE "Serve, set, spike!" 
							RANDOMCASE "Shish kabob?" 
							RANDOMCASE "Don\'t build this at home!" 
						RANDOMEND 
					} 
				ELSE 
					Create_Panel_Message { 
						style = panel_message_death 
						id = death_message 
						text = RANDOM(1, 1, 1, 1, 1) 
							RANDOMCASE "Toasted toes!" 
							RANDOMCASE "Burnt to a crisp!" 
							RANDOMCASE "Grilled to perfection!" 
							RANDOMCASE "Ouch!" 
							RANDOMCASE "Death by hot lava!" 
						RANDOMEND 
					} 
				ENDIF 
			ENDIF 
		ENDIF 
		SK3_Killskater_Finish r = 150 g = 50 b = 50 <...> 
	ENDIF 
ENDSCRIPT

SCRIPT SK4_Hide_Death_Message 
	IF ObjectExists id = death_message 
		SetScreenElementProps id = death_message rgba = [ 0 0 0 0 ] 
	ENDIF 
ENDSCRIPT

SCRIPT SK3_Killskater_Finish r = 255 g = 255 b = 255 
	IF NOT Driving 
		Obj_GetID 
		LaunchEvent type = KillingSkater target = <objId> 
	ENDIF 
	DisablePlayerInput 
	IF GotParam Bail 
		IF Skating 
			MakeSkaterGoto Killskater_Bail 
		ENDIF 
	ENDIF 
	pulse_blur start = 0 end = 255 speed = 4 
	IF GotParam nodename 
		change kill_skater_nodename = <nodename> 
	ENDIF 
	OnExitRun SK3_Killskater_Finish2 
	IF GotParam water 
		SkaterSplashOn 
		PausePhysics 
		Hide 
		IF ObjectExists id = PlayerVehicle 
			PlayerVehicle : Hide 
		ENDIF 
		wait 0.50000000000 seconds 
	ELSE 
		wait 0.25000000000 seconds 
	ENDIF 
	OnExitRun 
	SK3_Killskater_Finish3 <...> 
ENDSCRIPT

kill_skater_nodename = 0 
SCRIPT SK3_Killskater_Finish2 
	IF InSplitScreenGame 
		Obj_GetID 
		IF ObjectExists <objId> 
			MakeSkaterGoto SK3_Killskater_Finish3 params = { nodename = ( kill_skater_nodename ) } 
		ENDIF 
	ELSE 
		MakeSkaterGoto SK3_Killskater_Finish3 params = { nodename = ( kill_skater_nodename ) } 
	ENDIF 
ENDSCRIPT

SCRIPT SK3_Killskater_Finish3 
	ClearTrickQueues 
	wait 1 gameframe 
	BlendPeriodOut 0 
	ClearEventBuffer 
	BailSkaterTricks 
	IF NOT Driving 
		IF GotParam nodename 
			KillSkater node = <nodename> 
		ELSE 
			KillSkater 
		ENDIF 
	ELSE 
		PlayerVehicle : Vehicle_MoveToRestart <nodename> 
		PlayerVehicleCamera : VehicleCamera_Reset 
		PlayerVehicle : Unhide 
		IF PlayerVehicle : Vehicle_IsSkaterVisible 
			Unhide 
		ENDIF 
	ENDIF 
	IF InNetGame 
		IF GameModeEquals is_goal_attack 
			IF NOT GameIsOver 
				speech_box_exit 
			ENDIF 
		ENDIF 
	ELSE 
		speech_box_exit 
	ENDIF 
	Obj_KillSpawnedScript name = ForceToWalk 
	IF IsForceWalkOn 
		KillForceToWalk 
	ENDIF 
	ResetSkaterParticleSystems 
	pulse_blur start = 255 end = 0 speed = 4 
	wait 0.75000000000 seconds 
	NotInBail 
	Obj_ClearFlag FLAG_SKATER_KILLING 
	IF GoalManager_HasActiveGoals 
		IF GoalManager_GetActiveGoalId 
			GoalManager_GetGoalParams name = <goal_id> 
			IF GotParam horse 
				GoalManager_LoseGoal name = <goal_id> 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT panel_message_death 
	off_set = PAIR(0.00000000000, 20.00000000000) 
	Domorph time = 0 scale = 1.10000002384 pos = ( PAIR(320.00000000000, 100.00000000000) + <off_set> ) alpha = 1 
	Domorph pos = ( PAIR(323.00000000000, 103.00000000000) + <off_set> ) time = 0.05000000075 
	Domorph pos = ( PAIR(317.00000000000, 97.00000000000) + <off_set> ) time = 0.05000000075 
	Domorph pos = ( PAIR(323.00000000000, 103.00000000000) + <off_set> ) time = 0.05000000075 
	Domorph pos = ( PAIR(317.00000000000, 97.00000000000) + <off_set> ) time = 0.05000000075 
	Domorph pos = ( PAIR(323.00000000000, 103.00000000000) + <off_set> ) time = 0.05000000075 
	Domorph pos = ( PAIR(317.00000000000, 97.00000000000) + <off_set> ) time = 0.05000000075 
	Domorph pos = ( PAIR(323.00000000000, 103.00000000000) + <off_set> ) time = 0.05000000075 
	Domorph pos = ( PAIR(317.00000000000, 97.00000000000) + <off_set> ) time = 0.05000000075 
	Domorph pos = ( PAIR(323.00000000000, 103.00000000000) + <off_set> ) time = 0.05000000075 
	Domorph pos = ( PAIR(317.00000000000, 97.00000000000) + <off_set> ) time = 0.05000000075 
	Domorph pos = ( PAIR(323.00000000000, 103.00000000000) + <off_set> ) time = 0.05000000075 
	Domorph pos = ( PAIR(317.00000000000, 97.00000000000) + <off_set> ) time = 0.05000000075 
	Domorph pos = ( PAIR(323.00000000000, 103.00000000000) + <off_set> ) time = 0.05000000075 
	Domorph pos = ( PAIR(317.00000000000, 97.00000000000) + <off_set> ) time = 0.05000000075 
	Domorph pos = ( PAIR(323.00000000000, 103.00000000000) + <off_set> ) time = 0.05000000075 
	Domorph pos = ( PAIR(317.00000000000, 97.00000000000) + <off_set> ) time = 0.05000000075 
	Domorph pos = ( PAIR(323.00000000000, 103.00000000000) + <off_set> ) time = 0.05000000075 
	Domorph pos = ( PAIR(317.00000000000, 97.00000000000) + <off_set> ) time = 0.05000000075 
	Domorph pos = ( PAIR(323.00000000000, 103.00000000000) + <off_set> ) time = 0.05000000075 
	Domorph pos = ( PAIR(317.00000000000, 97.00000000000) + <off_set> ) time = 0.05000000075 
	Domorph pos = ( PAIR(323.00000000000, 103.00000000000) + <off_set> ) time = 0.05000000075 
	Domorph pos = ( PAIR(317.00000000000, 97.00000000000) + <off_set> ) time = 0.05000000075 
	Domorph pos = ( PAIR(323.00000000000, 103.00000000000) + <off_set> ) time = 0.05000000075 
	Domorph pos = ( PAIR(317.00000000000, 97.00000000000) + <off_set> ) time = 0.05000000075 
	Domorph pos = ( PAIR(323.00000000000, 103.00000000000) + <off_set> ) time = 0.05000000075 
	Domorph pos = ( PAIR(317.00000000000, 97.00000000000) + <off_set> ) time = 0.05000000075 
	Domorph pos = ( PAIR(323.00000000000, 103.00000000000) + <off_set> ) time = 0.05000000075 
	Domorph pos = ( PAIR(317.00000000000, 97.00000000000) + <off_set> ) time = 0.05000000075 
	Domorph pos = ( PAIR(323.00000000000, 103.00000000000) + <off_set> ) time = 0.05000000075 
	Domorph pos = ( PAIR(317.00000000000, 97.00000000000) + <off_set> ) time = 0.05000000075 
	Domorph pos = ( PAIR(323.00000000000, 103.00000000000) + <off_set> ) time = 0.05000000075 
	Domorph pos = ( PAIR(317.00000000000, 97.00000000000) + <off_set> ) time = 0.05000000075 rot_angle = 0 scale = 1 
	Domorph pos = ( PAIR(317.00000000000, 97.00000000000) + <off_set> ) time = 0.05000000075 rot_angle = 0 scale = 1.29999995232 alpha = 1 
	Domorph time = 0.12999999523 pos = ( PAIR(320.00000000000, 140.00000000000) + <off_set> ) rot_angle = -10 
	Domorph alpha = 0 time = 0.17000000179 pos = ( PAIR(320.00000000000, 260.00000000000) + <off_set> ) rot_angle = -45 
	Die 
ENDSCRIPT

SCRIPT Killskater_Bail 
	PlayAnim Anim = Bail_Spin_FWD_Regular BlendPeriod = 0.30000001192 
ENDSCRIPT

SCRIPT SK3_TeleportToNode 
	TeleportSkaterToNode <...> 
ENDSCRIPT

SCRIPT TeleportSkaterToNode r = 255 g = 255 b = 255 
	IF GotParam Message1 
		LaunchPanelMessage properties = panel_message_death RANDOM(1) 
		RANDOMCASE RANDOMEND <Message1> 
	ELSE 
		LaunchPanelMessage properties = panel_message_death "On the Move!" 
	ENDIF 
	IF GotParam vertair 
	ENDIF 
	IF GotParam nodename 
		printf "Got the nodename ...................." 
		IF Skating 
			IF OnRail 
				ClearEventBuffer 
				ClearTrickQueue 
				KillExtraTricks 
				ClearExtraGrindTrick 
				StopBalanceTrick 
				MakeSkaterGoto GroundGone 
			ENDIF 
		ENDIF 
		pulse_blur start = 255 speed = 5 
		Obj_MoveToNode name = <nodename> Orient NoReset 
	ELSE 
		LaunchPanelMessage properties = panel_message_death "ERROR! Please pass in nodename=" 
	ENDIF 
	IF Walking 
		GetCameraId 
		<CameraId> : WalkCamera_Reset 
		IF Walk_Hang 
			Walk_ForceToAirFromHang 
		ENDIF 
		Walk_SetForwardControlLock On 
		wait 0.30000001192 seconds 
		Walk_SetForwardControlLock Off 
	ENDIF 
ENDSCRIPT

SCRIPT PrepareSkaterForMove 
	IF Skating 
		SetState AIR 
		CleanUpSpecialItems 
		StopBalanceTrick 
		MakeSkaterGoto GroundGone 
		LandSkaterTricks 
		ClearEventBuffer 
	ENDIF 
ENDSCRIPT

FLAG_TRAFFICLIGHT_GREEN = 0 
FLAG_TRAFFICLIGHT_YELLOW = 1 
FLAG_TRAFFICLIGHT_RED = 2 
FLAG_CAR_GENERIC_STOPPED = 3 
FLAG_CAR_GENERIC_NOSOUND = 4 
FLAG_CAR_SOUND_FRANTICSTOP = 5 
FLAG_CAR_SKITCH = 7 
FLAG_CAR_TYPE_BUS = 30 
FLAG_CAR_TYPE_HPRV = 31 
FLAG_CAR_GENERIC_STOPPED_SKATER = 8 
SCRIPT Car_Generic01 { 
		TurnDist = 20 
		DefaultSpeed = 40 
		SkitchSpeed = 60 
		CarLoopSFX = CarLoop 
		SkaterCheckOffset = VECTOR(0.00000000000, 0.00000000000, 5.50000000000) 
		SkaterCheckWidth = 15 
		SkaterCheckHeight = 25 
	} 
	Obj_GetID 
	SetTags DefaultSpeed = <DefaultSpeed> Tag_TurnDist = <TurnDist> CarLoopSFX = <CarLoopSFX> 
	GetTags 
	Obj_SetPathTurnDist <Tag_TurnDist> 
	Obj_FollowPathLinked 
	Obj_SetPathAcceleration 10 mphps 
	Obj_SetPathDeceleration 10 mphps 
	Obj_SetPathMinStopVel 5 
	Obj_SetPathVelocity <DefaultSpeed> mph 
	IF NOT GotParam AllowSlow 
		IF ( <DefaultSpeed> < 20 ) 
			printf "### CAR SPEED TOO SLOW! CHANGING TO 20mph ###" 
			printstruct <DefaultSpeed> 
			<DefaultSpeed> = 20 
			printstruct <DefaultSpeed> 
		ENDIF 
	ENDIF 
	IF GotParam Bus 
		Obj_SetFlag FLAG_CAR_TYPE_BUS 
	ENDIF 
	IF GotParam HPRV 
		Obj_SetFlag FLAG_CAR_TYPE_HPRV 
	ENDIF 
	IF GotParam SkaterDebugBox 
		<SkaterDebugBox> = debug 
	ENDIF 
	IF GotParam CarDebugBox 
		<CarDebugBox> = debug 
	ENDIF 
	IF GotParam NoSound 
		Obj_SetFlag FLAG_CAR_GENERIC_NOSOUND 
	ELSE 
		Obj_PlaySound <CarLoopSFX> dropoff_function = exponential 
	ENDIF 
	IF GotParam StickToGround 
		Obj_StickToGround On DistAbove = 2 DistBelow = 2 
	ENDIF 
	IF GotParam NoSkater 
	ELSE 
		Obj_SpawnScript Car_CheckForSkater01 params = <...> 
	ENDIF 
	IF GotParam skitch 
		Obj_SetException ex = Skitched scr = <skitch> 
	ENDIF 
	Obj_SpawnScript Car_CheckForOtherCar01 params = <...> 
ENDSCRIPT

Car_CheckForSkater_Pause = 1 
SCRIPT Car_CheckForSkater01 
	p1 = { 
		dist = ( <DefaultSpeed> * 1.50000000000 ) 
		width = <SkaterCheckWidth> 
		height = <SkaterCheckHeight> 
		type = skater 
		offset = <SkaterCheckOffset> 
		<SkaterDebugBox> 
	} 
	change Car_CheckForSkater_Pause = ( Car_CheckForSkater_Pause + 1 ) 
	IF ( Car_CheckForSkater_Pause > 10 ) 
		change Car_CheckForSkater_Pause = 1 
	ENDIF 
	wait Car_CheckForSkater_Pause gameframes 
	BEGIN 
		wait 10 gameframes 
		IF LocalSkaterExists 
			IF Obj_FlagNotSet FLAG_CAR_GENERIC_STOPPED 
				IF Obj_ObjectInRect <p1> 
					KillSpawnedScript id = CarAccelSound 
					Obj_AdjustSound { 
						<CarLoopSFX> 
						volumePercent = 50 
						volumeStep = 1.50000000000 
						pitchPercent = 40 
						pitchStep = 1.50000000000 
					} 
					Car_Sound_FranticStop01 
					Obj_StopAlongPath 8 
					Obj_SetFlag FLAG_CAR_GENERIC_STOPPED_SKATER 
					BEGIN 
						wait 90 gameframes 
						IF Obj_ObjectInRect <p1> 
							KillSpawnedScript id = CarAccelSound 
							wait 60 gameframes 
							Car_Sound_RandomHonk01 
						ELSE 
							SpawnSound Car_Sound_Accel01 id = CarAccelSound 
							Obj_StartAlongPath 
							Obj_ClearFlag FLAG_CAR_GENERIC_STOPPED_SKATER 
							BREAK 
						ENDIF 
					REPEAT 
				ELSE 
					IF skater : Skitching 
						Obj_GetSpeed 
						IF Obj_FlagNotSet FLAG_CAR_SKITCH 
							Obj_SetFlag FLAG_CAR_SKITCH 
							IF Obj_FlagNotSet FLAG_CAR_GENERIC_NOSOUND 
								SpawnSound Auto_SFX_Car_Tire_Squeal 
							ENDIF 
							Obj_SetPathVelocity <SkitchSpeed> mph 
						ENDIF 
					ELSE 
						IF Obj_FlagSet FLAG_CAR_SKITCH 
							Obj_ClearFlag FLAG_CAR_SKITCH 
							IF NOT GotParam NoSkitchStop 
								Obj_SetFlag FLAG_CAR_GENERIC_STOPPED 
								Obj_StopAlongPath 15 feet 
								wait 1 second 
								Obj_ClearFlag FLAG_CAR_GENERIC_STOPPED 
								Obj_StartAlongPath 
							ENDIF 
							Obj_SetPathVelocity <DefaultSpeed> mph 
						ENDIF 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
	REPEAT 
ENDSCRIPT

Car_CheckForOtherCar_Pause = 1 
SCRIPT Car_CheckForOtherCar01 
	p1 = { 
		dist = ( <DefaultSpeed> * 1.50000000000 ) 
		width = 20 
		height = 20 
		offset = VECTOR(0.00000000000, 0.00000000000, 5.00000000000) 
		<CarDebugBox> 
	} 
	p2 = { 
		dist = <DefaultSpeed> 
		width = 20 
		height = 20 
		offset = VECTOR(0.00000000000, 0.00000000000, 5.00000000000) 
		<CarDebugBox> 
	} 
	change Car_CheckForOtherCar_Pause = ( Car_CheckForOtherCar_Pause + 1 ) 
	IF ( Car_CheckForOtherCar_Pause > 10 ) 
		change Car_CheckForOtherCar_Pause = 1 
	ENDIF 
	wait Car_CheckForOtherCar_Pause gameframes 
	BEGIN 
		wait 10 gameframes 
		IF Obj_FlagNotSet FLAG_CAR_GENERIC_STOPPED 
			CarGeneric_GetNextObjOnPath_Decel <...> 
			GetTags 
			Obj_GetNextObjOnPath Range = <LookAheadCheckDist_Decel> 
			IF GotParam Ob 
				Obj_SpawnScript Car_DecelForOtherCar01 params = <...> 
				IF IsAlive name = <Ob> 
					CarGeneric_GetNextObjOnPath_Stop <...> 
					GetTags 
					Obj_GetNextObjOnPath Range = <LookAheadCheckDist> 
				ENDIF 
				IF GotParam Ob 
					Car_StopForOtherCar01 <...> 
				ENDIF 
			ENDIF 
		ENDIF 
	REPEAT 
ENDSCRIPT

SCRIPT Car_StopForOtherCar01 
	KillSpawnedScript id = CarAccelSound 
	Obj_SetFlag FLAG_CAR_GENERIC_STOPPED 
	Obj_StopAlongPath 7 
	GetTags 
	IF Obj_FlagSet FLAG_CAR_TYPE_BUS 
		printf "### distance ahead bus looked before stopping = %d" d = <LookAheadCheckDist> 
	ENDIF 
	IF Obj_FlagSet FLAG_CAR_TYPE_HPRV 
		printf "### distance ahead HPRV looked before stopping = %d" d = <LookAheadCheckDist> 
	ENDIF 
	Car_Sound_Stop01 
	BEGIN 
		Car_Sound_RandomHonk01 
		IF IsAlive name = <Ob> 
			CarGeneric_GetNextObjOnPath_Stop <...> 
			GetTags 
			Obj_GetNextObjOnPath Range = <LookAheadCheckDist> 
		ENDIF 
		IF NOT GotParam Ob 
			IF Obj_FlagNotSet FLAG_CAR_GENERIC_STOPPED_SKATER 
				Car_StartForOtherCar01 <...> 
				BREAK 
			ENDIF 
		ENDIF 
		wait 60 gameframes 
	REPEAT 
ENDSCRIPT

SCRIPT Car_StartForOtherCar01 
	SpawnSound Car_Sound_Accel01 id = CarAccelSound 
	Obj_ClearFlag FLAG_CAR_GENERIC_STOPPED 
	wait 20 gameframes 
	IF Obj_FlagNotSet FLAG_CAR_GENERIC_STOPPED_SKATER 
		Obj_SetPathVelocity 30 mph 
		Obj_StartAlongPath 
	ENDIF 
ENDSCRIPT

SCRIPT CarGeneric_GetNextObjOnPath_Decel 
	LookAheadCheckDist_Decel = 45 
	IF GotParam Bus 
		LookAheadCheckDist_Decel = ( <LookAheadCheckDist_Decel> + 20 ) 
	ELSE 
		IF GotParam HPRV 
			LookAheadCheckDist_Decel = ( <LookAheadCheckDist_Decel> + 20 ) 
		ELSE 
			IF GotParam scooter 
				LookAheadCheckDist_Decel = ( <LookAheadCheckDist_Decel> - 20 ) 
			ELSE 
				IF GotParam truck 
					LookAheadCheckDist_Decel = ( <LookAheadCheckDist_Decel> + 10 ) 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	SetTags LookAheadCheckDist_Decel = <LookAheadCheckDist_Decel> 
ENDSCRIPT

SCRIPT CarGeneric_GetNextObjOnPath_Stop 
	LookAheadCheckDist = 37 
	IF GotParam Bus 
		LookAheadCheckDist = ( <LookAheadCheckDist> + 20 ) 
	ELSE 
		IF GotParam HPRV 
			LookAheadCheckDist = ( <LookAheadCheckDist> + 20 ) 
		ELSE 
			IF GotParam scooter 
				LookAheadCheckDist_Decel = ( <LookAheadCheckDist_Decel> - 20 ) 
			ELSE 
				IF GotParam truck 
					LookAheadCheckDist_Decel = ( <LookAheadCheckDist_Decel> + 10 ) 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	IF Queryflag name = <Ob> FLAG_CAR_TYPE_BUS 
		LookAheadCheckDist = ( <LookAheadCheckDist> + 10 ) 
	ENDIF 
	IF Queryflag name = <Ob> FLAG_CAR_TYPE_HPRV 
		printf "#### vehicle ahead of me %o is a HPRV ####" o = <objId> 
		LookAheadCheckDist = ( <LookAheadCheckDist> + 50 ) 
	ENDIF 
	SetTags LookAheadCheckDist = <LookAheadCheckDist> 
ENDSCRIPT

SCRIPT Car_Sound_Accel01 
	GetTags 
	IF Obj_FlagNotSet FLAG_CAR_GENERIC_NOSOUND 
		Obj_AdjustSound { 
			<CarLoopSFX> 
			volumePercent = 40 
			volumeStep = 0.75000000000 
			pitchPercent = RANDOM_RANGE PAIR(83.00000000000, 87.00000000000) 
			pitchStep = RANDOM_RANGE PAIR(0.60000002384, 0.89999997616) 
		} 
		wait RANDOM_RANGE PAIR(0.89999997616, 1.50000000000) seconds 
		Obj_AdjustSound { 
			<CarLoopSFX> 
			volumePercent = 30 
			volumeStep = 3 
			pitchPercent = RANDOM_RANGE PAIR(48.00000000000, 52.00000000000) 
			pitchStep = RANDOM_RANGE PAIR(4.00000000000, 5.50000000000) 
		} 
		wait RANDOM_RANGE PAIR(0.15000000596, 0.40000000596) seconds 
		GetTags 
		IF Obj_FlagNotSet FLAG_CAR_GENERIC_STOPPED 
			Obj_AdjustSound { 
				<CarLoopSFX> 
				volumePercent = 40 
				volumeStep = 0.50000000000 
				pitchPercent = RANDOM_RANGE PAIR(77.00000000000, 81.00000000000) 
				pitchStep = RANDOM_RANGE PAIR(0.40000000596, 0.60000002384) 
			} 
			wait RANDOM_RANGE PAIR(1.20000004768, 1.89999997616) seconds 
			Obj_AdjustSound { 
				<CarLoopSFX> 
				volumePercent = 27 
				volumeStep = 4 
				pitchPercent = RANDOM_RANGE PAIR(42.00000000000, 47.00000000000) 
				pitchStep = RANDOM_RANGE PAIR(0.40000000596, 0.50000000000) 
			} 
			wait RANDOM_RANGE PAIR(0.15000000596, 0.40000000596) seconds 
		ENDIF 
		GetTags 
		IF Obj_FlagNotSet FLAG_CAR_GENERIC_STOPPED 
			Obj_AdjustSound { 
				<CarLoopSFX> 
				volumePercent = 40 
				volumeStep = 0.40000000596 
				pitchPercent = 73 
				pitchStep = 0.40000000596 
			} 
			wait 2.00000000000 seconds 
			Obj_AdjustSound { 
				<CarLoopSFX> 
				volumePercent = 25 
				volumeStep = 5 
				pitchPercent = 45 
				pitchStep = 5 
			} 
			wait RANDOM_RANGE PAIR(0.15000000596, 0.40000000596) seconds 
		ENDIF 
		GetTags 
		IF Obj_FlagNotSet FLAG_CAR_GENERIC_STOPPED 
			Obj_AdjustSound { 
				<CarLoopSFX> 
				volumePercent = 40 
				volumeStep = 0.30000001192 
				pitchPercent = 60 
				pitchStep = 0.30000001192 
			} 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT Car_Sound_Decel01 
	KillSpawnedScript id = CarAccelSound 
	GetTags 
	IF Obj_FlagNotSet FLAG_CAR_GENERIC_NOSOUND 
		Obj_AdjustSound { 
			<CarLoopSFX> 
			volumePercent = 40 
			volumeStep = 2 
			pitchPercent = RANDOM_RANGE PAIR(40.00000000000, 50.00000000000) 
			pitchStep = 1 
		} 
		wait 1 second 
		SpawnSound Auto_SFX_CarBrakeSqueal 
	ENDIF 
ENDSCRIPT

SCRIPT Car_Sound_Stop01 
	KillSpawnedScript id = CarAccelSound 
	GetTags 
	IF Obj_FlagNotSet FLAG_CAR_GENERIC_NOSOUND 
		Obj_AdjustSound { 
			<CarLoopSFX> 
			volumePercent = 25 
			volumeStep = 1.50000000000 
			pitchPercent = 30 
			pitchStep = 1.50000000000 
		} 
		SpawnSound Auto_SFX_CarBrakeSqueal 
	ENDIF 
ENDSCRIPT

SCRIPT Car_Sound_FranticStop01 
	KillSpawnedScript id = CarAccelSound 
	GetTags 
	IF Obj_FlagNotSet FLAG_CAR_GENERIC_NOSOUND 
		IF Obj_FlagNotSet FLAG_CAR_SOUND_FRANTICSTOP 
			SpawnSound Auto_SFX_Car_Tire_Squeal 
			RANDOM(1, 1, 1, 1) RANDOMCASE RANDOMCASE RANDOMCASE 
			RANDOMCASE SpawnSound Auto_SFX_Car_Horn_Stream RANDOMEND 
		ENDIF 
	ENDIF 
	Obj_SpawnScript Car_Counter_FranticStop01 
ENDSCRIPT

SCRIPT Car_Counter_FranticStop01 
	Obj_SetFlag FLAG_CAR_SOUND_FRANTICSTOP 
	KillSpawnedScript id = CarAccelSound 
	wait 120 gameframes 
	Obj_ClearFlag FLAG_CAR_SOUND_FRANTICSTOP 
ENDSCRIPT

SCRIPT Car_Sound_RandomHonk01 
	IF Obj_FlagNotSet FLAG_CAR_GENERIC_NOSOUND 
		RANDOM(20, 1) RANDOMCASE 
		RANDOMCASE SpawnSound Auto_SFX_Car_Horn_Stream RANDOMEND 
	ENDIF 
ENDSCRIPT

SCRIPT Car_Accel01 
	IF Obj_FlagSet FLAG_CAR_SKITCH 
	ELSE 
		GetTags 
		GetRandomValue name = AccelSpeed a = ( <DefaultSpeed> * 0.89999997616 ) b = ( <DefaultSpeed> * 1.20000004768 ) 
		Obj_SetPathVelocity <AccelSpeed> mph 
		SpawnSound Car_Sound_Accel01 id = CarAccelSound 
		IF GotParam printstruct 
			printf "##### ACCEL #####" 
			printstruct <...> 
		ENDIF 
	ENDIF 
	IF GotParam StickToGround 
		Obj_StickToGround On DistAbove = 2 DistBelow = 2 
	ELSE 
		IF GotParam NoStickToGround 
			Obj_StickToGround Off 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT Car_AccelAfterDecelForCar01 
	IF Obj_FlagSet FLAG_CAR_SKITCH 
	ELSE 
		GetTags 
		GetRandomValue name = AccelSpeed a = ( <DefaultSpeed> * 0.89999997616 ) b = ( <DefaultSpeed> * 1.20000004768 ) 
		Obj_SetPathVelocity <AccelSpeed> mph 
		SpawnSound Car_Sound_Accel01 id = CarAccelSound 
	ENDIF 
ENDSCRIPT

SCRIPT Car_Decel01 
	IF Obj_FlagSet FLAG_CAR_SKITCH 
	ELSE 
		KillSpawnedScript id = CarAccelSound 
		GetTags 
		GetRandomValue name = DecelSpeed a = ( <DefaultSpeed> * 0.60000002384 ) b = ( <DefaultSpeed> * 0.69999998808 ) 
		Obj_SetPathVelocity <DecelSpeed> mph 
		IF GotParam printstruct 
			printf "##### DECEL #####" 
			printstruct <...> 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT Car_DecelForTurn01 
	IF Obj_FlagSet FLAG_CAR_SKITCH 
	ELSE 
		KillSpawnedScript id = CarAccelSound 
		SetTags Tag_TurnDist = <TurnDist> 
		GetTags 
		GetRandomValue name = DecelSpeed a = ( <DefaultSpeed> * 0.60000002384 ) b = ( <DefaultSpeed> * 0.69999998808 ) 
		IF ( <DecelSpeed> < 20 ) 
			<DecelSpeed> = 20 
		ENDIF 
		Obj_SetPathVelocity <DecelSpeed> mph 
		Obj_SetPathTurnDist <Tag_TurnDist> 
		Car_Sound_Decel01 
		IF GotParam printstruct 
			printf "##### DECEL FOR TURN #####" 
			printstruct <...> 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT Car_DecelForOtherCar01 
	KillSpawnedScript id = CarAccelSound 
	Car_Decel01 <...> 
	wait 120 gameframes 
	Car_AccelAfterDecelForCar01 <...> 
ENDSCRIPT

SCRIPT Car_Start01 
	wait RANDOM_RANGE PAIR(800.00000000000, 1200.00000000000) 
	Obj_ClearFlag FLAG_CAR_GENERIC_STOPPED 
	Obj_StartAlongPath 
	SpawnSound Car_Sound_Accel01 id = CarAccelSound 
ENDSCRIPT

SCRIPT Ped_StopAtNode01 
	Obj_SetAnimCycleMode Off 
	Obj_WaitAnimFinished 
	PlayAnimWithPartialAnimIfExists Anim = WalkToIdle 
	wait 2 gameframes 
	Obj_StopAlongPath 
	Obj_WaitAnimFinished 
ENDSCRIPT

SCRIPT Ped_WalkToNextNode01 
	RANDOM(1, 1) 
		RANDOMCASE Obj_SetPathVelocity 4 
		Obj_StartAlongPath 
		Obj_CycleAnim Anim = IdleToWalk 
		PlayAnimWithPartialAnimIfExists Anim = Walk1 cycle 
		RANDOMCASE Obj_SetPathVelocity 4 
		Obj_StartAlongPath 
		Obj_CycleAnim Anim = IdleToWalk 
		PlayAnimWithPartialAnimIfExists Anim = Walk2 cycle 
	RANDOMEND 
ENDSCRIPT

SCRIPT Ped_RandomWaitAtNode01 
	Ped_StopAtNode01 
	Obj_CycleAnim Anim = Idle 
	BEGIN 
		RANDOM(1, 1) 
			RANDOMCASE Ped_Idle01 
			RANDOMCASE goto Ped_WalkToNextNode01 
		RANDOMEND 
	REPEAT 
ENDSCRIPT

SCRIPT Ped_Idle01 
	RANDOM(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1) 
		RANDOMCASE Obj_CycleAnim Anim = ScratchChin 
		RANDOMCASE Obj_CycleAnim Anim = LookAtWatch 
		RANDOMCASE Obj_CycleAnim Anim = LookLeftRight 
		RANDOMCASE Obj_CycleAnim Anim = LookRight 
		RANDOMCASE Obj_CycleAnim Anim = LookLeftDown 
		RANDOMCASE Obj_CycleAnim Anim = Talk 
		RANDOMCASE Obj_CycleAnim Anim = Talk2 
		RANDOMCASE Obj_CycleAnim Anim = Idle 
		RANDOMCASE Obj_CycleAnim Anim = Idle 
		RANDOMCASE Obj_CycleAnim Anim = Idle 
		RANDOMCASE Obj_CycleAnim Anim = Idle 
		RANDOMCASE Obj_CycleAnim Anim = IdleToIdle2 
		Obj_CycleAnim Anim = Idle2 
		Obj_CycleAnim Anim = Idle2ToIdle 
		RANDOMCASE Obj_CycleAnim Anim = IdleToIdle3 
		Obj_CycleAnim Anim = Idle3 
		Obj_CycleAnim Anim = Idle3ToIdle 
	RANDOMEND 
ENDSCRIPT

SCRIPT Team_Flag 
	Obj_SetInnerRadius 10 
	IF GameModeEquals is_lobby 
		printf "Creating team flag" 
		Obj_SetException ex = ObjectInRadius scr = Team_Flag_Trigger params = { <...> } 
	ELSE 
		IF GameModeEquals is_ctf 
			printf "Creating CTF flag" 
			IF OnServer 
				printf "Setting CTF flag exception : AnyObjectInRadius" 
				Obj_SetException ex = AnyObjectInRadius scr = CTF_Team_Flag_Trigger params = { <...> } 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT Team_Flag_Trigger 
	GetNumTeams 
	IF GotParam blue 
		JoinTeam blue 
		kill name = TRG_Flag_Red 
		kill name = TRG_Flag_Green 
		kill name = TRG_Flag_Yellow 
		create name = TRG_Flag_Red 
		SWITCH <num_teams> 
			CASE 3 
				create name = TRG_Flag_Green 
			CASE 4 
				create name = TRG_Flag_Green 
				create name = TRG_Flag_Yellow 
		ENDSWITCH 
		Die 
	ENDIF 
	IF GotParam red 
		JoinTeam red 
		kill name = TRG_Flag_Blue 
		kill name = TRG_Flag_Green 
		kill name = TRG_Flag_Yellow 
		create name = TRG_Flag_Blue 
		SWITCH <num_teams> 
			CASE 3 
				create name = TRG_Flag_Green 
			CASE 4 
				create name = TRG_Flag_Green 
				create name = TRG_Flag_Yellow 
		ENDSWITCH 
		Die 
	ENDIF 
	IF GotParam green 
		JoinTeam green 
		kill name = TRG_Flag_Blue 
		kill name = TRG_Flag_Red 
		kill name = TRG_Flag_Yellow 
		create name = TRG_Flag_Blue 
		create name = TRG_Flag_Red 
		SWITCH <num_teams> 
			CASE 4 
				create name = TRG_Flag_Yellow 
		ENDSWITCH 
		Die 
	ENDIF 
	IF GotParam yellow 
		JoinTeam yellow 
		kill name = TRG_Flag_Blue 
		kill name = TRG_Flag_Red 
		kill name = TRG_Flag_Green 
		create name = TRG_Flag_Blue 
		create name = TRG_Flag_Red 
		create name = TRG_Flag_Green 
		Die 
	ENDIF 
ENDSCRIPT

SCRIPT CTF_Team_Base_Trigger 
	IF GotParam red 
		GetCollidingPlayerAndTeam exclude_team = 0 radius = 10 
		IF ( <player> = -1 ) 
		ELSE 
			IF ( <team> = 0 ) 
				IF PlayerHasFlag <...> 
					IF TeamFlagTaken <...> 
						DisplayFlagBaseWarning 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	IF GotParam blue 
		GetCollidingPlayerAndTeam exclude_team = 1 radius = 10 
		IF ( <player> = -1 ) 
		ELSE 
			IF ( <team> = 1 ) 
				IF PlayerHasFlag <...> 
					IF TeamFlagTaken <...> 
						DisplayFlagBaseWarning 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	IF GotParam green 
		GetCollidingPlayerAndTeam exclude_team = 2 radius = 10 
		IF ( <player> = -1 ) 
		ELSE 
			IF ( <team> = 2 ) 
				IF PlayerHasFlag <...> 
					IF TeamFlagTaken <...> 
						DisplayFlagBaseWarning 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	IF GotParam yellow 
		GetCollidingPlayerAndTeam exclude_team = 3 radius = 10 
		IF ( <player> = -1 ) 
		ELSE 
			IF ( <team> = 3 ) 
				IF PlayerHasFlag <...> 
					IF TeamFlagTaken <...> 
						DisplayFlagBaseWarning 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT display_flag_base_warning 
	create_net_panel_message msg_time = 2000 text = net_message_flag_base_warning 
ENDSCRIPT

SCRIPT CTF_Team_Flag_Trigger 
	printf "*** In Exception Handler CTF_Team_Flag_Trigger" 
	wait 1 gameframe 
	IF JustStartedNetGame 
		printf "*** Leaving Exception Handler CTF_Team_Flag_Trigger because the game just started" 
		RETURN 
	ENDIF 
	printf "*** Processing Exception Handler CTF_Team_Flag_Trigger" 
	IF GotParam red 
		GetCollidingPlayerAndTeam exclude_team = 0 radius = 10 
		IF ( <player> = -1 ) 
		ELSE 
			IF ( <team> = 0 ) 
				PlayerCapturedFlag flag_team = 0 <...> 
			ELSE 
				PlayerTookFlag flag_team = 0 <...> 
				Obj_ClearExceptions 
			ENDIF 
		ENDIF 
	ENDIF 
	IF GotParam blue 
		GetCollidingPlayerAndTeam exclude_team = 1 radius = 10 
		IF ( <player> = -1 ) 
		ELSE 
			IF ( <team> = 1 ) 
				PlayerCapturedFlag flag_team = 1 <...> 
			ELSE 
				PlayerTookFlag flag_team = 1 <...> 
				Obj_ClearExceptions 
			ENDIF 
		ENDIF 
	ENDIF 
	IF GotParam green 
		GetCollidingPlayerAndTeam exclude_team = 2 radius = 10 
		IF ( <player> = -1 ) 
		ELSE 
			IF ( <team> = 2 ) 
				PlayerCapturedFlag flag_team = 2 <...> 
			ELSE 
				PlayerTookFlag flag_team = 2 <...> 
				Obj_ClearExceptions 
			ENDIF 
		ENDIF 
	ENDIF 
	IF GotParam yellow 
		GetCollidingPlayerAndTeam exclude_team = 3 radius = 10 
		IF ( <player> = -1 ) 
		ELSE 
			IF ( <team> = 3 ) 
				PlayerCapturedFlag flag_team = 3 <...> 
			ELSE 
				PlayerTookFlag flag_team = 3 <...> 
				Obj_ClearExceptions 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT Kill_Team_Flags 
	IF NodeExists TRG_Flag_Red 
		kill name = TRG_Flag_Red 
	ENDIF 
	IF NodeExists TRG_Flag_Blue 
		kill name = TRG_Flag_Blue 
	ENDIF 
	IF NodeExists TRG_Flag_Green 
		kill name = TRG_Flag_Green 
	ENDIF 
	IF NodeExists TRG_Flag_Yellow 
		kill name = TRG_Flag_Yellow 
	ENDIF 
	IF NodeExists TRG_Flag_Red_Base 
		kill name = TRG_Flag_Red_Base 
	ENDIF 
	IF NodeExists TRG_Flag_Blue_Base 
		kill name = TRG_Flag_Blue_Base 
	ENDIF 
	IF NodeExists TRG_Flag_Green_Base 
		kill name = TRG_Flag_Green_Base 
	ENDIF 
	IF NodeExists TRG_Flag_Yellow_Base 
		kill name = TRG_Flag_Yellow_Base 
	ENDIF 
	IF NodeExists TRG_CTF_Red 
		kill name = TRG_CTF_Red 
	ENDIF 
	IF NodeExists TRG_CTF_Red_Base 
		kill name = TRG_CTF_Red_Base 
	ENDIF 
	IF NodeExists TRG_CTF_Blue 
		kill name = TRG_CTF_Blue 
	ENDIF 
	IF NodeExists TRG_CTF_Blue_Base 
		kill name = TRG_CTF_Blue_Base 
	ENDIF 
	IF NodeExists TRG_CTF_Green 
		kill name = TRG_CTF_Green 
	ENDIF 
	IF NodeExists TRG_CTF_Green_Base 
		kill name = TRG_CTF_Green_Base 
	ENDIF 
	IF NodeExists TRG_CTF_Yellow 
		kill name = TRG_CTF_Yellow 
	ENDIF 
	IF NodeExists TRG_CTF_Yellow_Base 
		kill name = TRG_CTF_Yellow_Base 
	ENDIF 
ENDSCRIPT

SCRIPT Create_Team_Flags 
	IF GameModeEquals is_lobby 
		SWITCH <num_teams> 
			CASE 1 
				IF NodeExists TRG_Flag_Red 
					create name = TRG_Flag_Red 
				ENDIF 
				IF NodeExists TRG_Flag_Red_Base 
					create name = TRG_Flag_Red_Base 
				ENDIF 
			CASE 2 
				IF NodeExists TRG_Flag_Red 
					create name = TRG_Flag_Red 
				ENDIF 
				IF NodeExists TRG_Flag_Blue 
					create name = TRG_Flag_Blue 
				ENDIF 
				IF NodeExists TRG_Flag_Red_Base 
					create name = TRG_Flag_Red_Base 
				ENDIF 
				IF NodeExists TRG_Flag_Blue_Base 
					create name = TRG_Flag_Blue_Base 
				ENDIF 
			CASE 3 
				IF NodeExists TRG_Flag_Red 
					create name = TRG_Flag_Red 
				ENDIF 
				IF NodeExists TRG_Flag_Blue 
					create name = TRG_Flag_Blue 
				ENDIF 
				IF NodeExists TRG_Flag_Green 
					create name = TRG_Flag_Green 
				ENDIF 
				IF NodeExists TRG_Flag_Red_Base 
					create name = TRG_Flag_Red_Base 
				ENDIF 
				IF NodeExists TRG_Flag_Blue_Base 
					create name = TRG_Flag_Blue_Base 
				ENDIF 
				IF NodeExists TRG_Flag_Green_Base 
					create name = TRG_Flag_Green_Base 
				ENDIF 
			CASE 4 
				IF NodeExists TRG_Flag_Red 
					create name = TRG_Flag_Red 
				ENDIF 
				IF NodeExists TRG_Flag_Blue 
					create name = TRG_Flag_Blue 
				ENDIF 
				IF NodeExists TRG_Flag_Green 
					create name = TRG_Flag_Green 
				ENDIF 
				IF NodeExists TRG_Flag_Yellow 
					create name = TRG_Flag_Yellow 
				ENDIF 
				IF NodeExists TRG_Flag_Red_Base 
					create name = TRG_Flag_Red_Base 
				ENDIF 
				IF NodeExists TRG_Flag_Blue_Base 
					create name = TRG_Flag_Blue_Base 
				ENDIF 
				IF NodeExists TRG_Flag_Green_Base 
					create name = TRG_Flag_Green_Base 
				ENDIF 
				IF NodeExists TRG_Flag_Yellow_Base 
					create name = TRG_Flag_Yellow_Base 
				ENDIF 
		ENDSWITCH 
	ELSE 
		GetNumPlayersOnTeam team = 0 
		IF ( <num_members> = 0 ) 
		ELSE 
			IF NodeExists TRG_CTF_Red 
				create name = TRG_CTF_Red 
			ENDIF 
			IF NodeExists TRG_CTF_Red_Base 
				create name = TRG_CTF_Red_Base 
			ENDIF 
		ENDIF 
		GetNumPlayersOnTeam team = 1 
		IF ( <num_members> = 0 ) 
		ELSE 
			IF NodeExists TRG_CTF_Blue 
				create name = TRG_CTF_Blue 
			ENDIF 
			IF NodeExists TRG_CTF_Blue_Base 
				create name = TRG_CTF_Blue_Base 
			ENDIF 
		ENDIF 
		GetNumPlayersOnTeam team = 2 
		IF ( <num_members> = 0 ) 
		ELSE 
			IF NodeExists TRG_CTF_Green 
				create name = TRG_CTF_Green 
			ENDIF 
			IF NodeExists TRG_CTF_Green_Base 
				create name = TRG_CTF_Green_Base 
			ENDIF 
		ENDIF 
		GetNumPlayersOnTeam team = 3 
		IF ( <num_members> = 0 ) 
		ELSE 
			IF NodeExists TRG_CTF_Yellow 
				create name = TRG_CTF_Yellow 
			ENDIF 
			IF NodeExists TRG_CTF_Yellow_Base 
				create name = TRG_CTF_Yellow_Base 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT Team_Flag_Base 
	Obj_SetInnerRadius 10 
	Obj_SetException ex = ObjectInRadius scr = CTF_Team_Base_Trigger params = { <...> } 
ENDSCRIPT

SCRIPT BouncyShadow_Kill 
	FormatText TextName = ShadowName "%o_shadow" o = <ObjectName> 
	printf <ShadowName> 
	kill prefix = <ShadowName> 
ENDSCRIPT

SCRIPT Pigeon_Generic 
	Obj_ShadowOff 
	IF GotParam perched 
		Pigeon_Generic_Idle_Perched 
	ELSE 
		Pigeon_Generic_Idle 
	ENDIF 
ENDSCRIPT

SCRIPT Pigeon_Generic_Idle_Perched 
	Obj_ClearExceptions 
	Obj_SetInnerRadius 15 
	Obj_SetException ex = ObjectInRadius scr = Pigeon_Generic_SkaterNear_Perched 
	SpawnSound NY_SFX_PigeonIdle 
	BEGIN 
		Obj_CycleAnim Anim = Idle NumCycles = RANDOM_RANGE PAIR(1.00000000000, 3.00000000000) 
		Obj_CycleAnim Anim = preen 
	REPEAT 
ENDSCRIPT

SCRIPT Pigeon_Generic_SkaterNear_Perched 
	Obj_ClearExceptions 
	SpawnSound NY_SFX_PigeonFlyUp 
	Obj_CycleAnim Anim = FlyHop 
	goto Pigeon_Generic_Idle_Perched 
ENDSCRIPT

SCRIPT Pigeon_Generic_Idle 
	Obj_ClearExceptions 
	Obj_SetInnerRadius 15 
	Obj_SetException ex = ObjectInRadius scr = Pigeon_Generic_SkaterNear 
	SpawnSound NY_SFX_PigeonIdle 
	BEGIN 
		Obj_CycleAnim Anim = Idle NumCycles = RANDOM_RANGE PAIR(1.00000000000, 3.00000000000) 
		Obj_CycleAnim Anim = peckfromidle 
		BEGIN 
			Obj_RotY speed = 25 
			Obj_CycleAnim Anim = peck 
			Obj_StopRotating 
		REPEAT NumCycles RANDOM_RANGE PAIR(1.00000000000, 5.00000000000) 
		Obj_CycleAnim Anim = pecktoidle 
		Obj_CycleAnim Anim = Idle 
		Obj_CycleAnim Anim = preen 
	REPEAT 
ENDSCRIPT

SCRIPT Pigeon_Generic_SkaterNear 
	Obj_ClearExceptions 
	Obj_GetRandomLink 
	Obj_MoveToLink speed = 8 LinkNum = <link> 
	Obj_LookAtNodeLinked time = 0.20000000298 LinkNum = <link> 
	Obj_SetInnerRadius 5 
	Obj_SetException ex = ObjectInRadius scr = Pigeon_Generic_SkaterReallyNear 
	PlayAnimWithPartialAnimIfExists Anim = run cycle 
	Obj_WaitMove 
	Obj_SetAnimCycleMode Off 
	Obj_WaitAnimFinished 
	Obj_CycleAnim Anim = runtoidle 
	Obj_SetInnerRadius 15 
	Obj_SetException ex = ObjectInRadius scr = Pigeon_Generic_SkaterNear 
	goto Pigeon_Generic_Idle 
ENDSCRIPT

SCRIPT Pigeon_Generic_SkaterReallyNear 
	Obj_ClearExceptions 
	SpawnSound NY_SFX_PigeonFlyUp 
	Obj_CycleAnim Anim = FlyHop 
	Obj_WaitMove 
	Obj_SetInnerRadius 15 
	Obj_SetException ex = ObjectInRadius scr = Pigeon_Generic_SkaterNear 
	goto Pigeon_Generic_Idle 
ENDSCRIPT

SCRIPT Gap_Gen_Rail2Rail 
	Gap_Gen_RailHop <...> 
ENDSCRIPT

SCRIPT Gap_Gen_Ledge2Ledge 
	Gap_Gen_LedgeHop <...> 
ENDSCRIPT

SCRIPT Gap_Gen_Rail2Ledge 
	IF GotParam start 
		Gap_Gen_Rail <...> 
	ELSE 
		Gap_Gen_End GapID = <GapID> text = "Rail 2 Ledge" score = 50 <...> 
	ENDIF 
ENDSCRIPT

SCRIPT Gap_Gen_Rail2Bench 
	IF GotParam start 
		Gap_Gen_Rail <...> 
	ELSE 
		Gap_Gen_End GapID = <GapID> text = "Rail 2 Bench" score = 50 <...> 
	ENDIF 
ENDSCRIPT

SCRIPT Gap_Gen_Ledge2Rail 
	IF GotParam start 
		Gap_Gen_Rail <...> 
	ELSE 
		Gap_Gen_End GapID = <GapID> text = "Ledge 2 Rail" score = 50 <...> 
	ENDIF 
ENDSCRIPT

SCRIPT Gap_Gen_Ledge2Bench 
	IF GotParam start 
		Gap_Gen_Rail <...> 
	ELSE 
		Gap_Gen_End GapID = <GapID> text = "Ledge 2 Bench" score = 50 <...> 
	ENDIF 
ENDSCRIPT

SCRIPT Gap_Gen_Wire2Ledge 
	IF GotParam start 
		Gap_Gen_Rail <...> 
	ELSE 
		Gap_Gen_End GapID = <GapID> text = "Wire 2 Ledge" score = 50 <...> 
	ENDIF 
ENDSCRIPT

SCRIPT Gap_Gen_Bench2Rail 
	IF GotParam start 
		Gap_Gen_Rail <...> 
	ELSE 
		Gap_Gen_End GapID = <GapID> text = "Bench 2 Rail" score = 50 <...> 
	ENDIF 
ENDSCRIPT

SCRIPT Gap_Gen_Bench2Ledge 
	IF GotParam start 
		Gap_Gen_Rail <...> 
	ELSE 
		Gap_Gen_End GapID = <GapID> text = "Bench 2 Ledge" score = 50 <...> 
	ENDIF 
ENDSCRIPT

SCRIPT Gap_Gen_WireHop 
	IF GotParam start 
		Gap_Gen_Rail <...> 
	ELSE 
		Gap_Gen_End GapID = <GapID> text = "Wire hop" score = 25 <...> 
	ENDIF 
ENDSCRIPT

SCRIPT Gap_Gen_BenchHop 
	IF GotParam start 
		Gap_Gen_Rail <...> 
	ELSE 
		Gap_Gen_End GapID = <GapID> text = "Bench hop" score = 25 <...> 
	ENDIF 
ENDSCRIPT

SCRIPT Gap_Gen_RailHop 
	IF GotParam start 
		Gap_Gen_Rail <...> 
	ELSE 
		Gap_Gen_End GapID = <GapID> text = "Rail hop" score = 25 <...> 
	ENDIF 
ENDSCRIPT

SCRIPT Gap_Gen_LedgeHop 
	IF GotParam start 
		Gap_Gen_Rail <...> 
	ELSE 
		Gap_Gen_End GapID = <GapID> text = "Ledge hop" score = 25 <...> 
	ENDIF 
ENDSCRIPT

SCRIPT Gap_Gen_AcrossTheStreet 
	IF GotParam start 
		Gap_Gen_Rail <...> 
	ELSE 
		Gap_Gen_End GapID = <GapID> text = "Across the street" score = 50 <...> 
	ENDIF 
ENDSCRIPT

SCRIPT Gap_Gen_HighLip 
	IF GotParam start 
		StartGap { 
			GapID = <GapID> 
			flags = [ 
				REQUIRE_LIP 
				CANCEL_GROUND 
				CANCEL_WALL 
				CANCEL_MANUAL 
				CANCEL_RAIL 
				CANCEL_WALLPLANT 
				CANCEL_HANG 
				CANCEL_LADDER 
			] 
			<...> 
		} 
	ELSE 
		wait 1 frame 
		Gap_Gen_End GapID = <GapID> text = "High lip" score = 100 <...> 
	ENDIF 
ENDSCRIPT

SCRIPT Gap_Gen_RampTransfer 
	IF GotParam start 
		StartGap { 
			GapID = <GapID> 
			flags = PURE_AIR 
		<...> } 
	ELSE 
		Gap_Gen_End GapID = <GapID> text = "Ramp Transfer" score = 100 <...> 
	ENDIF 
ENDSCRIPT

SCRIPT Gap_Gen_Rail 
	IF GotParam start 
		StartGap { 
			GapID = <GapID> 
			flags = [ 
				CANCEL_GROUND 
				CANCEL_MANUAL 
				CANCEL_WALL 
				CANCEL_LIP 
				CANCEL_WALLPLANT 
				CANCEL_HANG 
				CANCEL_LADDER 
			] 
			<...> 
		} 
	ELSE 
		IF GotParam end 
			Gap_Gen_End GapID = <GapID> text = <text> score = <score> <...> 
		ELSE 
			printf "### NO GAP TYPE SET FOR ID %g.  MUST BE START OR END ###" g = <GapID> 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT Gap_Gen_Lip 
	IF GotParam start 
		StartGap { 
			GapID = <GapID> 
			flags = [ 
				REQUIRE_LIP 
				CANCEL_GROUND 
				CANCEL_WALL 
				CANCEL_MANUAL 
				CANCEL_RAIL 
				CANCEL_WALLPLANT 
				CANCEL_HANG 
				CANCEL_LADDER 
			] 
			<...> 
		} 
	ELSE 
		IF GotParam end 
			wait 1 frame 
			EndGap { 
				GapID = <GapID> 
				text = <text> 
				score = <score> 
			} 
		ELSE 
			printf "### NO GAP TYPE SET FOR ID %g.  MUST BE START OR END ###" g = <GapID> 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT Gap_Gen_Transfer 
	IF GotParam start 
		StartGap { 
			GapID = <GapID> 
			flags = PURE_AIR 
			<...> 
		} 
	ELSE 
		IF GotParam end 
			Gap_Gen_End GapID = <GapID> text = <text> score = <score> <...> 
		ELSE 
			printf "### NO GAP TYPE SET FOR ID %g.  MUST BE START OR END ###" g = <GapID> 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT Gap_Gen_PureAir 
	IF GotParam start 
		StartGap { 
			GapID = <GapID> 
			flags = PURE_AIR 
			<...> 
		} 
	ELSE 
		IF GotParam end 
			Gap_Gen_End GapID = <GapID> text = <text> score = <score> <...> 
		ELSE 
			printf "### NO GAP TYPE SET FOR ID %g.  MUST BE START OR END ###" g = <GapID> 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT Gap_Gen_Manual 
	IF GotParam start 
		StartGap { 
			GapID = <GapID> 
			flags = PURE_MANUAL 
			<...> 
		} 
	ELSE 
		IF GotParam end 
			Gap_Gen_End GapID = <GapID> text = <text> score = <score> <...> 
		ELSE 
			printf "### NO GAP TYPE SET FOR ID %g.  MUST BE START OR END ###" g = <GapID> 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT Gap_Gen_End 
	IF GotParam end 
		EndGap { 
			GapID = <GapID> 
			text = <text> 
			score = <score> 
			<...> 
		} 
	ELSE 
		printf "### NO GAP TYPE SET FOR ID %g.  MUST BE START OR END ###" g = <GapID> 
	ENDIF 
ENDSCRIPT

SCRIPT Gap_CarHop gapscript = CarHopGapScript 
	StartGap { GapID = <StartGapID> flags = PURE_AIR } 
	EndGap { GapID = <EndGapID> text = "Car hop" score = 100 gapscript = <gapscript> } 
ENDSCRIPT

SCRIPT CarHopGapScript 
	BroadcastEvent type = SkaterCarHop 
ENDSCRIPT

SCRIPT Collect_Hover 
	Obj_RotY speed = 150 
	Obj_Hover Amp = 10 Freq = 1 
ENDSCRIPT

SCRIPT ShatterAndDie { area = 1000 
		variance = 4.59999990463 
		vel_x = RANDOM(1, 1, 1) RANDOMCASE 0.00000000000 RANDOMCASE 30 RANDOMCASE -30 RANDOMEND 
		vel_y = RANDOM(1, 1, 1) RANDOMCASE 10 RANDOMCASE 30 RANDOMCASE 50 RANDOMEND 
		vel_z = RANDOM(1, 1, 1) RANDOMCASE 0 RANDOMCASE 30 RANDOMCASE -30 RANDOMEND 
		spread = 1.00000000000 
		texture_swap = BA_APM_brokenglass01 
	} 
	kill name = <name> 
	IF GotParam OldStyle 
		Shatter { 
			name = <name> 
			area = <area> 
			variance = <variance> 
			vel_x = <vel_x> 
			vel_y = <vel_y> 
			vel_z = <vel_z> 
			spread = <spread> 
			<...> 
		} 
	ELSE 
		Shatter { 
			name = <name> 
			texture_swap = <texture_swap> 
			area = <area> 
			variance = <variance> 
			vel_x = <vel_x> 
			vel_y = <vel_y> 
			vel_z = <vel_z> 
			spread = <spread> 
			<...> 
		} 
	ENDIF 
	IF GotParam Vibrate 
		GetSingleTag state 
		IF NOT ( ( <state> = Skater_OnRail ) | ( <state> = Skater_InManual ) ) 
			Vibrate actuator = 0 percent = 100 
			wait 5 gameframes 
			Vibrate Off 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT CarTOD_TurnOffHeadlights 
	printf "### turning off headlights" 
	RunScriptOnComponentType { 
		component = model 
		target = Obj_ReplaceTexture 
		params = { 
			src = "JKU_LightCircle_Transparent.png" dest = "textures/cars/JKU_LightCircle_Transparent" 
		} 
	} 
	RunScriptOnComponentType { 
		component = model 
		target = Obj_ReplaceTexture 
		params = { 
			src = "JKU_HeadlightGlow_Transparent.png" dest = "textures/cars/JKU_HeadlightGlow_Transparent" 
		} 
	} 
ENDSCRIPT

SCRIPT CarTOD_TurnOnHeadlights 
	printf "### turning on headlights" 
	RunScriptOnComponentType { 
		component = model 
		target = Obj_ReplaceTexture 
		params = { 
			src = "JKU_LightCircle_Transparent.png" dest = "textures/cars/JKU_LightCircle" 
		} 
	} 
	RunScriptOnComponentType { 
		component = model 
		target = Obj_ReplaceTexture 
		params = { 
			src = "JKU_HeadlightGlow_Transparent.png" dest = "textures/cars/JKU_HeadlightGlow" 
		} 
	} 
ENDSCRIPT

SCRIPT FirstSwap_VO 
	Get_Current_Skater_name 
	SWITCH <name> 
		CASE BenFranklin 
			printf "Benfranklin" 
			TRG_Ped_BenFranklin_Intro : Obj_PlayFam Ped_BenFranklin_FirstSwap_Lip vol = ( GlobalHintVOVol ) priority = StreamPriorityHighest 
		CASE Bullfighter 
			printf "Bullfighter" 
			TRG_Ped_Bullfighter_Intro : Obj_PlayFam Ped_Bullfighter_FirstSwap_Lip vol = ( GlobalHintVOVol ) priority = StreamPriorityHighest 
		CASE Burnquist 
			printf "Burnquist" 
			TRG_Ped_TeammateIntroPro : Obj_PlayFam Burnquist_FirstSwap_Lip vol = ( GlobalHintVOVol ) priority = StreamPriorityHighest 
		CASE chainsawskater 
			printf "chainsawskater" 
			TRG_Ped_Bigfoot_Intro : Obj_PlayFam Ped_Bigfoot_FirstSwap_Lip vol = ( GlobalHintVOVol ) priority = StreamPriorityHighest 
		CASE graffititagger 
			printf "graffititagger" 
			TRG_Ped_Tagger_Intro : Obj_PlayFam Ped_GraffitiSkater_FirstSwap_Lip vol = ( GlobalHintVOVol ) priority = StreamPriorityHighest 
		CASE Hawk 
			printf "Hawk" 
			TRG_Ped_TeammateIntroPro : Obj_PlayFam Hawk_FirstSwap_Lip vol = ( GlobalHintVOVol ) priority = StreamPriorityHighest 
		CASE Jester 
			printf "Jester" 
			TRG_Ped_Jester_Intro : Obj_PlayFam Ped_Jester_FirstSwap_Lip vol = ( GlobalHintVOVol ) priority = StreamPriorityHighest 
		CASE Margera 
			printf "Margera" 
			TRG_Ped_TeammateIntroPro : Obj_PlayFam Margera_FirstSwap_Lip vol = ( GlobalHintVOVol ) priority = StreamPriorityHighest 
		CASE mechbullrider 
			printf "mechbullrider" 
			TRG_Ped_SteveO_Intro : Obj_PlayFam SteveO_FirstSwap_Lip vol = ( GlobalHintVOVol ) priority = StreamPriorityHighest 
		CASE MinikartDriver 
			printf "MinikartDriver" 
			TRG_Ped_MiniKart_Intro : Obj_PlayFam Minikartguy_FirstSwap_Lip vol = ( GlobalHintVOVol ) priority = StreamPriorityHighest 
		CASE Mullen 
			printf "Mullen" 
			TRG_Ped_TeammateIntroPro : Obj_PlayFam Mullen_FirstSwap_Lip vol = ( GlobalHintVOVol ) priority = StreamPriorityHighest 
		CASE Muska 
			printf "Muska" 
			TRG_Ped_TeammateIntroPro : Obj_PlayFam Muska_FirstSwap_Lip vol = ( GlobalHintVOVol ) priority = StreamPriorityHighest 
		CASE Paulie 
			printf "Paulie" 
			PlayStream Paulie_FirstSwap_Lip vol = ( GlobalHintVOVol ) priority = StreamPriorityHighest 
		CASE Sheckler 
			printf "Sheckler" 
			TRG_Ped_Sheckler_Intro : Obj_PlayFam Sheckler_FirstSwap_Lip vol = ( GlobalHintVOVol ) priority = StreamPriorityHighest 
		CASE segwayrider 
			printf "segwayrider" 
			TRG_Ped_Segway_Intro : Obj_PlayFam Ped_JesseJames_FirstSwap_Lip vol = ( GlobalHintVOVol ) priority = StreamPriorityHighest 
		CASE shrimpvendor 
			printf "shrimpvendor" 
			TRG_Ped_ShrimpVendor_Intro : Obj_PlayFam Ped_ShrimpVendor_FirstSwap_Lip vol = ( GlobalHintVOVol ) priority = StreamPriorityHighest 
		CASE Vallely 
			printf "Vallely" 
			TRG_Ped_TeammateIntroPro : Obj_PlayFam Vallely_FirstSwap_Lip vol = ( GlobalHintVOVol ) priority = StreamPriorityHighest 
		CASE Voodoo 
			printf "Voodoo" 
			TRG_Ped_Voodoo_Intro : Obj_PlayFam Ped_WitchDoctor_FirstSwap_Lip vol = ( GlobalHintVOVol ) priority = StreamPriorityHighest 
	ENDSWITCH 
ENDSCRIPT

SCRIPT Takeover_VO 
	view_goals_reminder_create 
	Get_Current_Skater_name 
	printf "!!!!!!!!!!!!!!!!!!!!!!!!%n" n = <name> 
	SWITCH <name> 
		CASE BenFranklin 
			printf "Benfranklin" 
			TakeOverVoicePrefix = "Franklin" 
		CASE Bullfighter 
			printf "Bullfighter" 
			TakeOverVoicePrefix = "Fighter" 
		CASE Burnquist 
			printf "Burnquist" 
			TakeOverVoicePrefix = "Burnquist" 
		CASE chainsawskater 
			printf "Chainsawskater" 
			TakeOverVoicePrefix = "Bigfoot" 
		CASE custom 
			printf "custom" 
			TakeOverVoicePrefix = "customm1" 
		CASE Hawk 
			printf "Hawk" 
			TakeOverVoicePrefix = "Hawk" 
		CASE Jester 
			printf "jester" 
			TakeOverVoicePrefix = "Jester" 
		CASE Margera 
			printf "Margera" 
			TakeOverVoicePrefix = "Margera" 
		CASE mechbullrider 
			printf "Mechbullrider" 
			TakeOverVoicePrefix = "Bullrider" 
		CASE MinikartDriver 
			printf "Minikartdriver" 
			TakeOverVoicePrefix = "Minikartguy" 
		CASE Mullen 
			printf "Mullen" 
			TakeOverVoicePrefix = "Mullen" 
		CASE Muska 
			printf "Muska" 
			TakeOverVoicePrefix = "Muska" 
		CASE Paulie 
			printf "Paulie" 
			TakeOverVoicePrefix = "Paulie" 
		CASE Sheckler 
			printf "Sheckler" 
			TakeOverVoicePrefix = "Sheckler" 
		CASE segwayrider 
			printf "segwayrider" 
			TakeOverVoicePrefix = "JesseJames" 
		CASE shrimpvendor 
			printf "shrimpvendor" 
			TakeOverVoicePrefix = "shrimpvendor" 
		CASE Vallely 
			printf "Vallely" 
			TakeOverVoicePrefix = "Vallely" 
		CASE Voodoo 
			printf "Voodoo" 
			TakeOverVoicePrefix = "Witchdoctor" 
		CASE graffititagger 
			printf "Tagger" 
			TakeOverVoicePrefix = "GraffitiSkater" 
	ENDSWITCH 
	BEGIN 
		<TakeOverNumber> = RANDOM_PERMUTE(1, 1, 1, 1, 1, 1, 1, 1, 1) RANDOMCASE 1 RANDOMCASE 2 RANDOMCASE 3 RANDOMCASE 4 RANDOMCASE 5 RANDOMCASE 6 RANDOMCASE 7 RANDOMCASE 8 RANDOMCASE 9 RANDOMEND 
		FormatText checksumname = TakeOverStream "%t_TakeOver0%n" t = <TakeOverVoicePrefix> n = <TakeOverNumber> 
		IF NOT StreamExists <TakeOverStream> 
			IF ( CheckForPedStreamExistence = 1 ) 
				printf "Stream doesn\'t exist...going to look for another" 
			ENDIF 
		ELSE 
			BREAK 
		ENDIF 
		wait 0.00100000005 seconds 
	REPEAT 9 
	IF ( <TakeOverVoicePrefix> = "customm1" ) 
		PlaySkaterStream type = "takeover" 
	ELSE 
		IF NOT StreamExists <TakeOverStream> 
			printf "" 
			printf "############################################" 
			printf "##  Trying to play a takeover stream...   ##" 
			printf "##                                        ##" 
			printf "##                                        ##" 
			printf "##  ...BUT IT DOESN\'T EXIST!!!!           ##" 
			printf "##                                        ##" 
			printf "##  CHECK THE PROFILE!!!!!                ##" 
			printf "##  CHECK THE PROFILE!!!!!                ##" 
			printf "##         ...NOW PLAYING ANNOYING SOUND  ##" 
			printf "##                                        ##" 
			printf "############################################" 
			printf "" 
			IF ( CheckForPedStreamExistence = 1 ) 
				BEGIN 
					PlaySound GUI_buzzer01 vol = 200 
					wait 0.20000000298 seconds 
				REPEAT 10 
			ENDIF 
		ELSE 
			IF ( CheckForPedStreamExistence = 1 ) 
				printf "######  Good, the ped\'s TakeOver" 
				printf "######  stream is there." 
			ENDIF 
			IF NOT IsStreamPlaying ProSwitch 
				PlayStream <TakeOverStream> id = ProSwitch vol = 200 priority = StreamPriorityHigh 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT CAG_Boundary 
ENDSCRIPT


