
le_active = 0 
LE_MODE_MODEL = 0 
LE_MODE_GEOM = 1 
LE_MODE_RAIL = 2 
LE_MODE_RAIL_PLACE = 32 
LE_MODE_LIGHT = 3 
LE_MODE_PED = 4 
le_current_mode = LE_MODE_MODEL 
LE_CURSOR_MODE_COLLISION = 0 
LE_CURSOR_MODE_FREE = 1 
le_cursor_mode = LE_CURSOR_MODE_COLLISION 
le_nodes = [ 
] 
le_node_counter = 0 
node_array_size = 0 
SCRIPT SaveLevelData 
	SetPreference prefs = splitscreen field = NodeArray Params = { TestValue = ( NodeArray ) } 
ENDSCRIPT

SCRIPT LoadLevelData 
ENDSCRIPT

SCRIPT CreateLevelEditor 
	IF ObjectExists id = leveleditor 
		leveleditor : die 
	ENDIF 
	IF ObjectExists id = leveleditor_cursor 
		leveleditor_cursor : die 
	ENDIF 
	PauseSkaters 
	CreateCompositeObject { 
		Components = 
		[ 
			{ component = camera } 
			{ component = input controller = 0 } 
			{ component = editorcamera min_height = 0 max_height = 30000 min_radius = 10 max_radius = 6000 SimpleCollision } 
			{ component = raileditor } 
		] 
		Params = { Name = leveleditor } 
	} 
	CreateCompositeObject { 
		Components = 
		[ 
			{ 
				component = model 
				UseModelLights 
			} 
			{ 
				component = modellightupdate 
			} 
			{ component = motion } 
		] 
		Params = { Name = leveleditor_cursor } 
	} 
	leveleditor : Hide 
	leveleditor : Suspend 
	Change le_active = 1 
ENDSCRIPT

SCRIPT SwitchOnLevelEditor position = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
	leveleditor : SetEditingMode Mode = FreeRoaming 
	ControllerDebounce X time = 0.20000000298 clear = 1 
	leveleditor : Unsuspend 
	leveleditor : Unhide 
	Skater : Obj_GetPosition 
	leveleditor : EditorCam_Initialise position = <pos> cursor_height = 0 
	SetActiveCamera id = leveleditor 
	leveleditor_cursor : Unhide 
	leveleditor_hud_create 
	LevelEditor_InitMode 
	GetArraySize NodeArray 
	Change node_array_size = <array_size> 
	SetScreenElementProps { 
		id = leveleditor_desc 
		text = node_array_size 
	} 
	wait 0.20000000298 seconds 
	leveleditor : Obj_SpawnScript LevelEditor_HandleInput Params = { } 
ENDSCRIPT

SCRIPT ResumeLevelEditor 
	leveleditor : Unsuspend 
	SetActiveCamera id = leveleditor 
ENDSCRIPT

SCRIPT LevelEditor_SetCursorModel model_name = "none" 
	leveleditor_cursor : Obj_InitModel model = <model_name> 
ENDSCRIPT

SCRIPT LevelEditor_InitMode 
	SWITCH le_current_mode 
		CASE LE_MODE_MODEL 
			LevelEditor_Model_Init 
		CASE LE_MODE_GEOM 
			LevelEditor_Geom_Init 
		CASE LE_MODE_RAIL 
			LevelEditor_Rail_Init 
		CASE LE_MODE_LIGHT 
			LevelEditor_Light_Init 
		CASE LE_MODE_PED 
			LevelEditor_Ped_Init 
	ENDSWITCH 
ENDSCRIPT

SCRIPT LevelEditor_SwapMode 
	SWITCH le_current_mode 
		CASE LE_MODE_MODEL 
			LevelEditor_Model_Close 
			Change le_current_mode = LE_MODE_GEOM 
		CASE LE_MODE_GEOM 
			LevelEditor_Geom_Close 
			Change le_current_mode = LE_MODE_RAIL 
		CASE LE_MODE_RAIL 
			LevelEditor_Rail_Close 
			Change le_current_mode = LE_MODE_LIGHT 
		CASE LE_MODE_LIGHT 
			LevelEditor_Light_Close 
			Change le_current_mode = LE_MODE_MODEL 
		CASE LE_MODE_PED 
			LevelEditor_Ped_CLose 
			Change le_current_mode = LE_MODE_MODEL 
	ENDSWITCH 
	LevelEditor_InitMode 
ENDSCRIPT

SCRIPT LevelEditor_EveryFrame 
	leveleditor : GetCursorPosition 
	FormatText TextName = le_pos_text "%i" i = <pos> 
	SetScreenElementProps { 
		id = leveleditor_cursor_pos 
		text = <le_pos_text> 
	} 
ENDSCRIPT

SCRIPT LevelEditor_HandleInput 
	BEGIN 
		LevelEditor_EveryFrame 
		SWITCH le_current_mode 
			CASE LE_MODE_MODEL 
				LevelEditor_Model_EveryFrame 
			CASE LE_MODE_GEOM 
				LevelEditor_Geom_EveryFrame 
			CASE LE_MODE_RAIL 
				LevelEditor_Rail_EveryFrame 
			CASE LE_MODE_LIGHT 
				LevelEditor_Light_EveryFrame 
			CASE LE_MODE_PED 
				LevelEditor_Ped_EveryFrame 
		ENDSWITCH 
		IF ControllerPressed Black 
			IF ControllerPressed White 
				LevelEditor_SwapMode 
				ControllerDebounce Black time = 0.20000000298 clear = 1 
				ControllerDebounce White time = 0.20000000298 clear = 1 
			ELSE 
				IF ControllerPressed triangle 
					BREAK 
				ENDIF 
			ENDIF 
		ENDIF 
		IF ControllerPressed X 
			SWITCH le_current_mode 
				CASE LE_MODE_MODEL 
					LevelEditor_Model_X 
				CASE LE_MODE_GEOM 
					LevelEditor_Geom_X 
				CASE LE_MODE_RAIL 
					LevelEditor_Rail_X 
				CASE LE_MODE_LIGHT 
					LevelEditor_Light_X 
				CASE LE_MODE_PED 
					LevelEditor_Ped_X 
			ENDSWITCH 
		ENDIF 
		IF ( LAUNCHER_SETTING_OBSHACK = 1 ) 
			IF ControllerPressed Black 
				SWITCH le_current_mode 
					CASE LE_MODE_MODEL 
						LevelEditor_Model_Square 
					CASE LE_MODE_GEOM 
						LevelEditor_Geom_Square 
					CASE LE_MODE_RAIL 
						LevelEditor_Rail_Square 
					CASE LE_MODE_LIGHT 
						LevelEditor_Light_Square 
					CASE LE_MODE_PED 
						LevelEditor_Ped_Square 
				ENDSWITCH 
			ENDIF 
		ELSE 
			IF ControllerPressed Square 
				SWITCH le_current_mode 
					CASE LE_MODE_MODEL 
						LevelEditor_Model_Square 
					CASE LE_MODE_GEOM 
						LevelEditor_Geom_Square 
					CASE LE_MODE_RAIL 
						LevelEditor_Rail_Square 
					CASE LE_MODE_LIGHT 
						LevelEditor_Light_Square 
					CASE LE_MODE_PED 
						LevelEditor_Ped_Square 
				ENDSWITCH 
			ENDIF 
		ENDIF 
		IF ControllerPressed Circle 
			SWITCH le_current_mode 
				CASE LE_MODE_MODEL 
					LevelEditor_Model_Circle 
				CASE LE_MODE_GEOM 
					LevelEditor_Geom_Circle 
				CASE LE_MODE_RAIL 
					LevelEditor_Rail_Circle 
				CASE LE_MODE_LIGHT 
					LevelEditor_Light_Circle 
				CASE LE_MODE_PED 
					LevelEditor_Ped_Circle 
			ENDSWITCH 
		ENDIF 
		IF ControllerPressed triangle 
			SWITCH le_current_mode 
				CASE LE_MODE_MODEL 
					LevelEditor_Model_Triangle 
				CASE LE_MODE_GEOM 
					LevelEditor_Geom_Triangle 
				CASE LE_MODE_RAIL 
				CASE LE_MODE_LIGHT 
				CASE LE_MODE_PED 
			ENDSWITCH 
		ENDIF 
		IF ControllerPressed L1 
			IF ControllerPressed R1 
				SWITCH le_cursor_mode 
					CASE LE_CURSOR_MODE_COLLISION 
						Change le_cursor_mode = LE_CURSOR_MODE_FREE 
						create_console_message text = "Grid mode" 
					CASE LE_CURSOR_MODE_FREE 
						Change le_cursor_mode = LE_CURSOR_MODE_COLLISION 
						create_console_message text = "Free-roaming mode" 
				ENDSWITCH 
				ControllerDebounce L1 time = 0.20000000298 clear = 1 
				ControllerDebounce R1 time = 0.20000000298 clear = 1 
			ENDIF 
		ENDIF 
		IF ( le_cursor_mode = LE_CURSOR_MODE_FREE ) 
			leveleditor : GetCursorPosition 
			IF ControllerPressed left 
				leveleditor : EditorCam_SetCursorPos position = ( <pos> + VECTOR(50.00000000000, 0.00000000000, 0.00000000000) ) 
				ControllerDebounce left time = 0.40000000596 clear = 1 
			ENDIF 
			IF ControllerPressed Right 
				leveleditor : EditorCam_Initialise position = ( <pos> - VECTOR(50.00000000000, 0.00000000000, 0.00000000000) ) 
				ControllerDebounce Right time = 0.40000000596 clear = 1 
			ENDIF 
			IF ControllerPressed Up 
				leveleditor : EditorCam_Initialise position = ( <pos> + VECTOR(0.00000000000, 0.00000000000, 50.00000000000) ) 
				ControllerDebounce Up time = 0.40000000596 clear = 1 
			ENDIF 
			IF ControllerPressed Down 
				leveleditor : EditorCam_SetCursorPos position = ( <pos> - VECTOR(0.00000000000, 0.00000000000, 50.00000000000) ) 
				ControllerDebounce Down time = 0.40000000596 clear = 1 
			ENDIF 
			IF ControllerPressed R1 
				leveleditor : EditorCam_SetCursorPos position = ( <pos> + VECTOR(0.00000000000, 50.00000000000, 0.00000000000) ) 
				ControllerDebounce R1 time = 0.40000000596 clear = 1 
			ENDIF 
			IF ControllerPressed L1 
				leveleditor : EditorCam_SetCursorPos position = ( <pos> - VECTOR(0.00000000000, 50.00000000000, 0.00000000000) ) 
				ControllerDebounce L1 time = 0.40000000596 clear = 1 
			ENDIF 
		ENDIF 
		wait 1 gameframe 
	REPEAT 
	SwitchOffLevelEditor 
ENDSCRIPT

SCRIPT SwitchOffLevelEditor 
	IF NOT ObjectExists id = leveleditor 
		RETURN 
	ENDIF 
	IF NOT ObjectExists id = leveleditor_cursor 
		RETURN 
	ENDIF 
	SWITCH le_current_mode 
		CASE LE_MODE_MODEL 
			LevelEditor_Model_Close 
		CASE LE_MODE_GEOM 
			LevelEditor_Geom_Close 
		CASE LE_MODE_RAIL 
			LevelEditor_Rail_Close 
		CASE LE_MODE_LIGHT 
			LevelEditor_Light_Close 
		CASE LE_MODE_PED 
			LevelEditor_Ped_CLose 
	ENDSWITCH 
	le_active = 0 
	SetActiveCamera id = skatercam0 
	UnPauseSkaters 
	leveleditor_hud_destroy 
	leveleditor : Hide 
	leveleditor : Suspend 
	leveleditor : die 
	leveleditor_cursor : Hide 
	leveleditor_cursor : Suspend 
	leveleditor_cursor : die 
ENDSCRIPT


