
EXITWPLOOP = 0 
ACTIVEWPLOOP = 0 
STICKERON = 0 
SCRIPT wallplant_setup_handler 
	IF ( E9_WALLPLANT_TYPE = 0 ) 
		IF NOT IsTrue ACTIVEWPLOOP 
			IF NOT IsTrue STICKERON 
				change STICKERON = 1 
			ENDIF 
			change EXITWPLOOP = 1 
			Obj_KillSpawnedScript name = wallplant_check_handler 
			Obj_SpawnScript wallplant_check_handler 
		ENDIF 
	ELSE 
		IF ( E9_WALLPLANT_TYPE = 1 ) 
			change STICKERON = 1 
			change Physics_Wallplant_Min_Approach_Angle = 5 
			change Physics_Wallplant_Speed_Loss = 125 
		ENDIF 
		IF ( E9_WALLPLANT_TYPE = 2 ) 
			change STICKERON = 0 
			change Physics_Wallplant_Min_Approach_Angle = 2 
			change Physics_Wallplant_Speed_Loss = 225 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT wallplant_check_handler 
	change EXITWPLOOP = 0 
	<_downPressed> = 0 
	<_xPressed> = 0 
	GetSkaterId 
	BEGIN 
		<ObjId> : GetSingleTag State 
		IF NOT ( <State> = Skater_InWallplant ) 
			IF IsTrue EXITWPLOOP 
				BREAK 
			ENDIF 
		ENDIF 
		IF InVertAir 
			BREAK 
		ENDIF 
		IF OnGround 
			BREAK 
		ENDIF 
		IF ControllerPressed Down 
			IF ( <_downPressed> = 0 ) 
				change ACTIVEWPLOOP = 1 
				<_downPressed> = 1 
				BEGIN 
					IF ControllerPressed X 
						IF IsTrue STICKERON 
							change STICKERON = 0 
						ENDIF 
						change Physics_Wallplant_Min_Approach_Angle = 2 
						change Physics_Wallplant_Speed_Loss = 225 
						change EXITWPLOOP = 1 
						BREAK 
					ELSE 
						IF Released Down 
							change Physics_Wallplant_Min_Approach_Angle = 5 
							change Physics_Wallplant_Speed_Loss = 125 
							IF NOT IsTrue STICKERON 
								change STICKERON = 1 
							ENDIF 
							BREAK 
						ENDIF 
					ENDIF 
					waitonegameframe 
				REPEAT WALLPLANT_WINDOW_UG 
				<_downPressed> = 0 
				change ACTIVEWPLOOP = 0 
			ENDIF 
		ELSE 
			IF ControllerPressed X 
				change Physics_Wallplant_Min_Approach_Angle = 5 
				change Physics_Wallplant_Speed_Loss = 125 
				change STICKERON = 1 
				IF ( <_xPressed> = 0 ) 
					<_xPressed> = 1 
					change ACTIVEWPLOOP = 1 
					BEGIN 
						IF ControllerPressed Down 
							IF IsTrue STICKERON 
								change STICKERON = 0 
							ENDIF 
							change Physics_Wallplant_Min_Approach_Angle = 2 
							change Physics_Wallplant_Speed_Loss = 225 
							change EXITWPLOOP = 1 
							BREAK 
						ELSE 
							IF Released Down 
								change Physics_Wallplant_Min_Approach_Angle = 5 
								change Physics_Wallplant_Speed_Loss = 125 
								IF NOT IsTrue STICKERON 
									change STICKERON = 1 
								ENDIF 
								BREAK 
							ENDIF 
						ENDIF 
						waitonegameframe 
					REPEAT WALLPLANT_WINDOW 
					<_xPressed> = 0 
					change ACTIVEWPLOOP = 0 
				ENDIF 
			ENDIF 
		ENDIF 
		wait 1 gameframes 
	REPEAT 
	<_downPressed> = 0 
	<_xPressed> = 0 
	change ACTIVEWPLOOP = 0 
ENDSCRIPT


