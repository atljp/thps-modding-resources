
SCRIPT SetSkaterGroundTricks 
	IF inNetGame 
		IF NOT GetGlobalFlag flag = FLAG_G_EXPERT_MODE_NO_WALKING 
			IF NOT GetGlobalFlag flag = FLAG_EXPERT_MODE_NO_WALKING 
				IF ( UNDERGROUNDPLUS_CONTROLS = CONTROL_SCHEME_PS2 ) 
					SetQueueTricks Jumptricks GroundTricks SkateToWalkTricks 
				ELSE 
					SetQueueTricks Jumptricks GroundTricks_XBOX SkateToWalkTricks_XBOX 
				ENDIF 
			ELSE 
				IF ( UNDERGROUNDPLUS_CONTROLS = CONTROL_SCHEME_PS2 ) 
					SetQueueTricks Jumptricks GroundTricks 
				ELSE 
					SetQueueTricks Jumptricks GroundTricks_XBOX 
				ENDIF 
			ENDIF 
		ELSE 
			IF ( UNDERGROUNDPLUS_CONTROLS = CONTROL_SCHEME_PS2 ) 
				SetQueueTricks Jumptricks GroundTricks 
			ELSE 
				SetQueueTricks Jumptricks GroundTricks_XBOX 
			ENDIF 
		ENDIF 
	ELSE 
		IF NOT GetGlobalFlag flag = FLAG_EXPERT_MODE_NO_WALKING 
			IF ( UNDERGROUNDPLUS_CONTROLS = CONTROL_SCHEME_PS2 ) 
				SetQueueTricks Jumptricks GroundTricks SkateToWalkTricks 
			ELSE 
				SetQueueTricks Jumptricks GroundTricks_XBOX SkateToWalkTricks_XBOX 
			ENDIF 
		ELSE 
			IF ( UNDERGROUNDPLUS_CONTROLS = CONTROL_SCHEME_PS2 ) 
				SetQueueTricks Jumptricks GroundTricks 
			ELSE 
				SetQueueTricks Jumptricks GroundTricks_XBOX 
			ENDIF 
		ENDIF 
	ENDIF 
	SetExtraGrindTricks special = SpecialGrindTricks GrindTricks 
	IF NOT GetGlobalFlag flag = FLAG_EXPERT_MODE_NO_MANUALS 
		IF NOT ( ( inNetGame ) & ( GetGlobalFlag flag = FLAG_G_EXPERT_MODE_NO_MANUALS ) ) 
			SetManualTricks special = SpecialManualTricks GroundManualTricks 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT SetSkaterAirTricks 
	IF InPressure 
		IF NOT GotParam NoSkateToWalkTricks 
			IF ( ( GetGlobalFlag flag = FLAG_EXPERT_MODE_NO_WALKING ) | ( ( inNetGame ) & ( GetGlobalFlag flag = FLAG_G_EXPERT_MODE_NO_WALKING ) ) ) 
				IF NOT GotParam AllowWallplantOllie 
					SetQueueTricks special = SpecialTricks PressureTricks2 AirTricks 
				ELSE 
					SetQueueTricks special = SpecialTricks PressureTricks2 AirTricks WallplantOllie 
				ENDIF 
			ELSE 
				IF NOT GotParam AllowWallplantOllie 
					IF ( UNDERGROUNDPLUS_CONTROLS = CONTROL_SCHEME_PS2 ) 
						SetQueueTricks special = SpecialTricks PressureTricks2 AirTricks SkateToWalkTricks 
					ELSE 
						SetQueueTricks special = SpecialTricks PressureTricks2 AirTricks SkateToWalkTricks_XBOX 
					ENDIF 
				ELSE 
					IF ( UNDERGROUNDPLUS_CONTROLS = CONTROL_SCHEME_PS2 ) 
						SetQueueTricks special = SpecialTricks PressureTricks2 AirTricks SkateToWalkTricks WallplantOllie 
					ELSE 
						SetQueueTricks special = SpecialTricks PressureTricks2 AirTricks SkateToWalkTricks_XBOX WallplantOllie 
					ENDIF 
				ENDIF 
			ENDIF 
		ELSE 
			IF NOT GotParam AllowWallplantOllie 
				SetQueueTricks special = SpecialTricks PressureTricks2 AirTricks 
			ELSE 
				SetQueueTricks special = SpecialTricks PressureTricks2 AirTricks WallplantOllie 
			ENDIF 
		ENDIF 
	ELSE 
		IF NOT GotParam NoSkateToWalkTricks 
			IF ( ( GetGlobalFlag flag = FLAG_EXPERT_MODE_NO_WALKING ) | ( ( inNetGame ) & ( GetGlobalFlag flag = FLAG_G_EXPERT_MODE_NO_WALKING ) ) ) 
				IF NOT GotParam AllowWallplantOllie 
					SetQueueTricks special = SpecialTricks AirTricks 
				ELSE 
					SetQueueTricks special = SpecialTricks AirTricks WallplantOllie 
				ENDIF 
			ELSE 
				IF NOT GotParam AllowWallplantOllie 
					IF ( UNDERGROUNDPLUS_CONTROLS = CONTROL_SCHEME_PS2 ) 
						SetQueueTricks special = SpecialTricks AirTricks SkateToWalkTricks 
					ELSE 
						SetQueueTricks special = SpecialTricks AirTricks SkateToWalkTricks_XBOX 
					ENDIF 
				ELSE 
					IF ( UNDERGROUNDPLUS_CONTROLS = CONTROL_SCHEME_PS2 ) 
						SetQueueTricks special = SpecialTricks AirTricks SkateToWalkTricks WallplantOllie 
					ELSE 
						SetQueueTricks special = SpecialTricks AirTricks SkateToWalkTricks_XBOX WallplantOllie 
					ENDIF 
				ENDIF 
			ENDIF 
		ELSE 
			IF NOT GotParam AllowWallplantOllie 
				SetQueueTricks special = SpecialTricks AirTricks 
			ELSE 
				SetQueueTricks special = SpecialTricks AirTricks WallplantOllie 
			ENDIF 
		ENDIF 
	ENDIF 
	SetExtraGrindTricks special = SpecialGrindTricks GrindTricks 
	SetSkaterAirManualTricks 
ENDSCRIPT

SCRIPT GroundGone 
	InAirExceptions 
	StopBalanceTrick 
	SetException Ex = Ollied Scr = Ollie 
	ClearTricksFrom GroundTricks 
	IF GotParam NoBoneless 
		SetSkaterAirTricks 
	ELSE 
		IF ( ( GetGlobalFlag flag = FLAG_EXPERT_MODE_NO_WALKING ) | ( ( inNetGame ) & ( GetGlobalFlag flag = FLAG_G_EXPERT_MODE_NO_WALKING ) ) ) 
			SetQueueTricks special = SpecialTricks AirTricks Jumptricks JumpTricks0 
		ELSE 
			IF ( UNDERGROUNDPLUS_CONTROLS = CONTROL_SCHEME_PS2 ) 
				SetQueueTricks special = SpecialTricks AirTricks Jumptricks JumpTricks0 SkateToWalkTricks 
			ELSE 
				SetQueueTricks special = SpecialTricks AirTricks Jumptricks JumpTricks0 SkateToWalkTricks_XBOX 
			ENDIF 
		ENDIF 
	ENDIF 
	IF Crouched 
		PlayAnim Anim = Crouch2InAir 
	ELSE 
		PlayAnim Anim = Idle2InAir 
	ENDIF 
	WaitAnimWhilstCheckingLateOllie 
	SetSkaterAirTricks 
	ClearException Ollied 
	Goto Airborne 
ENDSCRIPT


