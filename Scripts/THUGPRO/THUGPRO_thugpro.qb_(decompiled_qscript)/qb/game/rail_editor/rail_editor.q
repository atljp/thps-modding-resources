
SCRIPT CreateRailEditor 
	CreateCompositeObject { 
		Components = 
		[ 
			{ component = camera } 
			{ component = input controller = 0 } 
			{ component = editorcamera min_height = 0 min_radius = 10 max_radius = 1000 SimpleCollision } 
			{ component = raileditor } 
		] 
		Params = { Name = raileditor permanent } 
	} 
	raileditor : Hide 
	raileditor : Suspend 
ENDSCRIPT

SCRIPT SwitchOnRailEditor 
	raileditor : SetEditingMode Mode = FreeRoaming 
	Debounce X time = 0.20000000298 clear = 1 
	raileditor : Unsuspend 
	raileditor : Unhide 
	GetParkEditorCursorPos 
	raileditor : EditorCam_Initialise position = <pos> cursor_height = 20 
	SetActiveCamera id = raileditor 
	IF ( THUGPRO_PS2ButtonsOn = 1 ) 
		THUGPRO_PatchTogglePS2Buttons off 
	ENDIF 
ENDSCRIPT

SCRIPT SwitchOffRailEditor 
	IF raileditor : GetEditedRailInfo CurrentRail 
		IF ( <num_points> < 2 ) 
			raileditor : DeleteRail rail_id = <rail_id> 
		ENDIF 
	ENDIF 
	raileditor : Hide 
	raileditor : Suspend 
	SetActiveCamera id = parked_cam 
	IF ( THUGPRO_PS2ButtonsOn = 1 ) 
		THUGPRO_PatchTogglePS2Buttons on 
	ENDIF 
ENDSCRIPT

RailEditor_HasPost = 1 
RailEditor_Grid = 0 
SCRIPT RailEditor_TogglePost 
	IF IsTrue RailEditor_HasPost 
		Change RailEditor_HasPost = 0 
	ELSE 
		Change RailEditor_HasPost = 1 
	ENDIF 
	PlaySound GUI_click06 
ENDSCRIPT

SCRIPT RailEditor_ToggleGrid 
	IF IsTrue RailEditor_Grid 
		Change RailEditor_Grid = 0 
	ELSE 
		Change RailEditor_Grid = 1 
	ENDIF 
	PlaySound GUI_click06 
ENDSCRIPT

SCRIPT _RailEditorEveryFrame 
	IF ( ( LevelIs load_sk5ed ) | ( LevelIs load_sk5ed_gameplay ) ) 
		UnHighlightAllRails 
		GetEditingMode 
		SkProRailTool_GetCursorPosition 
		IF ObjectExists id = RailEditorCursor 
			RailEditorCursor : Obj_SetPosition position = <pos> 
			RailEditorCursor : Obj_SetOrientation y = <angle> 
		ENDIF 
		SWITCH <Mode> 
			CASE FreeRoaming 
				IF FindNearestRailPoint pos = <pos> 
					HighlightRailPoint rail_id = <rail_id> rail_point_index = <rail_point_index> Flash IncludeEndPosts 
				ENDIF 
			CASE RailLayout 
				DrawDottedLine pos = <pos> 
			CASE Grab 
				GetTags 
				UpdateRailPointPosition rail_id = <rail_id> rail_point_index = <rail_point_index> pos = <pos> 
				HighlightRailPoint rail_id = <rail_id> rail_point_index = <rail_point_index> 
		ENDSWITCH 
	ENDIF 
ENDSCRIPT

SCRIPT _RailEditorX 
	GetEditingMode 
	SkProRailTool_GetCursorPosition 
	IF IsTrue RailEditor_HasPost 
		<AddPost> = AddPost 
	ENDIF 
	IF IsTrue RailEditor_Grid 
		RailEditorCursor : Obj_GetPosition 
	ENDIF 
	SWITCH <Mode> 
		CASE FreeRoaming 
			IF NewRail 
				IF AddNewPosition pos = <pos> <AddPost> 
					SetEditingMode Mode = RailLayout 
					rail_editor_create_cursor 
				ELSE 
					IF GetEditedRailInfo CurrentRail 
						IF ( <num_points> < 2 ) 
							DeleteRail rail_id = <rail_id> 
						ENDIF 
					ENDIF 
				ENDIF 
			ENDIF 
		CASE RailLayout 
			IF NOT AddNewPosition pos = <pos> <AddPost> 
				IF GetEditedRailInfo CurrentRail 
					IF ( <num_points> < 2 ) 
						DeleteRail rail_id = <rail_id> 
					ENDIF 
				ENDIF 
				DeleteDottedLine 
				SetEditingMode Mode = FreeRoaming 
				rail_editor_create_cursor 
			ENDIF 
		CASE Grab 
			GetTags 
			IF NOT UpdateRailPointPosition rail_id = <rail_id> rail_point_index = <rail_point_index> pos = <pos> UpdateSuperSectors 
			ELSE 
				SetEditingMode Mode = FreeRoaming 
				rail_editor_create_cursor 
			ENDIF 
		DEFAULT 
	ENDSWITCH 
ENDSCRIPT

SCRIPT _RailEditorCircle 
	GetEditingMode 
	SkProRailTool_GetCursorPosition 
	SWITCH <Mode> 
		CASE FreeRoaming 
			IF FindNearestRailPoint pos = <pos> 
				SetTags rail_id = <rail_id> rail_point_index = <rail_point_index> OriginalPos = <NearestPos> 
				EditorCam_SetCursorPos position = <NearestPos> 
				SetEditingMode Mode = Grab 
				rail_editor_create_cursor 
			ENDIF 
		DEFAULT 
	ENDSWITCH 
ENDSCRIPT

SCRIPT _RailEditorTriangle 
	GetEditingMode 
	SkProRailTool_GetCursorPosition 
	SWITCH <Mode> 
		CASE FreeRoaming 
			IF FindNearestRailPoint pos = <pos> 
				DeleteRailPoint rail_id = <rail_id> rail_point_index = <rail_point_index> 
			ENDIF 
		CASE RailLayout 
			IF GetEditedRailInfo CurrentRail 
				IF ( <num_points> < 2 ) 
					DeleteRail rail_id = <rail_id> 
				ENDIF 
			ENDIF 
			DeleteDottedLine 
			SetEditingMode Mode = FreeRoaming 
			rail_editor_create_cursor 
		CASE Grab 
			GetTags 
			UpdateRailPointPosition rail_id = <rail_id> rail_point_index = <rail_point_index> pos = <OriginalPos> UpdateSuperSectors 
			EditorCam_SetCursorPos position = <OriginalPos> 
			SetEditingMode Mode = FreeRoaming 
			rail_editor_create_cursor 
		DEFAULT 
	ENDSWITCH 
ENDSCRIPT

SCRIPT _RailEditorSquare 
	GetEditingMode 
	SkProRailTool_GetCursorPosition 
	SWITCH <Mode> 
		CASE FreeRoaming 
			IF FindNearestRailPoint pos = <pos> CheckLevelGeometry 
				Change RailEditor_Grid = 0 
				EditorCam_SetCursorPos position = <NearestPos> 
			ELSE 
			ENDIF 
		CASE RailLayout 
			IF FindNearestRailPoint pos = <pos> CheckLevelGeometry 
				Change RailEditor_Grid = 0 
				EditorCam_SetCursorPos position = <NearestPos> 
			ELSE 
			ENDIF 
		CASE Grab 
			GetTags 
			IF FindNearestRailPoint { 
					pos = <pos> 
					CheckLevelGeometry 
					IgnoreRailId = <rail_id> 
					IgnoreRailPointIndex = <rail_point_index> 
				} 
				Change RailEditor_Grid = 0 
				EditorCam_SetCursorPos position = <NearestPos> 
			ELSE 
			ENDIF 
		DEFAULT 
	ENDSWITCH 
ENDSCRIPT


