
SCRIPT UndergroundPlus_IfPressedRailSwing 
	IF ( UNDERGROUNDPLUS_CONTROLS = CONTROL_SCHEME_PS2 ) 
		IF Held Black 
			RETURN ksk_is_held = 1 
		ENDIF 
		RETURN ksk_is_held = 0 
	ENDIF 
	IF Held R1 
		IF Held L1 
			RETURN ksk_is_held = 1 
		ENDIF 
	ENDIF 
	RETURN ksk_is_held = 0 
ENDSCRIPT

SCRIPT UndergroundPlus_IfPressedExitBoard 
	IF ( UNDERGROUNDPLUS_ENABLE_EXITBOARD = UNDERGROUNDPLUS_OPTION_OFF ) 
		RETURN ksk_is_held = 0 
	ENDIF 
	IF ( UNDERGROUNDPLUS_CONTROLS = CONTROL_SCHEME_PS2 ) 
		IF Held White 
			IF Held Black 
				RETURN ksk_is_held = 1 
			ENDIF 
		ENDIF 
		RETURN ksk_is_held = 0 
	ENDIF 
	RETURN ksk_is_held = 0 
ENDSCRIPT

SCRIPT UndergroundPlus_IfPressedRailStall 
	IF ( UNDERGROUNDPLUS_CONTROLS = CONTROL_SCHEME_PS2 ) 
		IF Held White 
			RETURN ksk_is_held = 1 
		ENDIF 
		RETURN ksk_is_held = 0 
	ENDIF 
	IF Held R1 
		IF Held L1 
			RETURN ksk_is_held = 1 
		ENDIF 
	ENDIF 
	RETURN ksk_is_held = 0 
ENDSCRIPT

SCRIPT UndergroundPlus_IfPressedReturnBoard 
	IF ( UNDERGROUNDPLUS_CONTROLS = CONTROL_SCHEME_PS2 ) 
		IF Held Black 
			IF Held White 
				RETURN ksk_is_held = 1 
			ELSE 
				RETURN ksk_is_held = 2 
			ENDIF 
		ELSE 
			IF Held White 
				RETURN ksk_is_held = 3 
			ENDIF 
		ENDIF 
		RETURN ksk_is_held = 0 
	ENDIF 
	IF Held R1 
		IF Held L1 
			RETURN ksk_is_held = 1 
		ELSE 
			RETURN ksk_is_held = 2 
		ENDIF 
	ELSE 
		IF Held L1 
			RETURN ksk_is_held = 3 
		ENDIF 
	ENDIF 
	RETURN ksk_is_held = 0 
ENDSCRIPT


