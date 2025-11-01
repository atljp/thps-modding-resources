
node_array_index = 0 
search_array_index = 0 
geom_last_node = 0 
SCRIPT LevelEditor_Geom_ShowMenu 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	pause_menu_gradient off 
	make_new_menu { 
		menu_id = leveleditor_menu 
		vmenu_id = leveleditor_vmenu 
		menu_title = "GEOMETRY" 
		type = VScrollingMenu 
		dims = PAIR(200.00000000000, 350.00000000000) 
		padding_scale = 0.94999998808 
		Pos = PAIR(108.00000000000, 42.00000000000) 
	} 
	SetScreenElementProps { id = leveleditor_menu 
		event_handlers = [ 
			{ pad_back generic_menu_pad_back Params = { callback = exit_pause_menu } } 
		] 
	} 
	set_theme_icons 
	make_text_sub_menu_item text = "Clone" id = menu_timeofday pad_choose_script = LevelEditor_Geom_CloneObj pad_choose_params = { Name = geom_last_node } 
	make_text_sub_menu_item text = "Delete" id = menu_lighting pad_choose_script = LevelEditor_Geom_KillObject pad_choose_params = { } 
	make_text_sub_menu_item text = "Invisible" id = menu_set_pro_skater pad_choose_script = LevelEditor_Geom_HideObject pad_choose_params = { } 
	make_text_sub_menu_item text = "Continue" id = menu_done pad_choose_script = leveleditor_menu_resume 
	RunScriptOnScreenElement id = current_menu_anchor animate_in Params = { final_pos = PAIR(320.00000000000, 134.00000000000) } 
ENDSCRIPT

SCRIPT LevelEditor_Geom_Init 
	leveleditor_cursor : unhide 
	leveleditor_cursor : Obj_InitModel model = "Super_Pro_Arrow\\Super_Pro_Arrow.mdl" 
	SetScreenElementProps { 
		id = leveleditor_menu_title 
		text = "Level Editor - Level Geometry" 
	} 
	SetScreenElementProps { id = leveleditor_piece_label text = "Object:" } 
	SetScreenElementProps { id = leveleditor_desc_label text = "" } 
	LevelEditor_Geom_NextLevelObject 
ENDSCRIPT

SCRIPT LevelEditor_Geom_Close 
	LevelEditor_Geom_RemoveHighlight 
	leveleditor_cursor : Hide 
ENDSCRIPT

SCRIPT LevelEditor_Geom_EveryFrame 
	leveleditor : GetCursorPosition 
	leveleditor_cursor : Obj_SetPosition position = <Pos> 
	leveleditor_cursor : Obj_Rotate absolute = ( <Angle> * VECTOR(0.00000000000, 1.00000000000, 0.00000000000) ) 
ENDSCRIPT

SCRIPT LevelEditor_Geom_UpdateCursor 
	leveleditor_cursor : die 
	CreateCompositeObject { 
		Components = [ 
			{ component = suspend } 
			{ component = motion } 
			{ component = skaterproximity } 
			{ component = sound } 
			{ component = model model = "none" } 
		] 
		Params = { Name = leveleditor_cursor Pos = VECTOR(0.00000000000, 200.00000000000, 0.00000000000) cloneFrom = floor } 
	} 
ENDSCRIPT

SCRIPT LevelEditor_Geom_MoveCursor Pos = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
	leveleditor : EditorCam_SetCursorPos position = <Pos> 
ENDSCRIPT

SCRIPT LevelEditor_Geom_NextLevelObject flag = class 
	tmp_na_index = node_array_index 
	BEGIN 
		change node_array_index = ( <tmp_na_index> + 1 ) 
		IF GetElement NodeArray Index = node_array_index 
			IF StructureContains structure = <Element> <flag> 
				geom_cur_node = ( <Element> . class ) 
				geom_cur_pos = ( <Element> . Pos ) 
				geom_cur_name = ( <Element> . Name ) 
				IF ( <geom_cur_node> = LevelGeometry ) 
					IF StructureContains structure = <Element> TriggerScript 
					ELSE 
						IF StructureContains structure = <Element> TrickObject 
							LevelEditor_Geom_MoveCursor Pos = <geom_cur_pos> 
							change geom_last_node = <geom_cur_name> 
							FormatText ChecksumName = cloned_node_name "%i" i = <geom_cur_name> 
							SetScreenElementProps { 
								id = leveleditor_piece 
								text = ( <cloned_node_name> ) 
							} 
							SpawnScript LevelEditor_Geom_HighlightObject Params = { Name = <geom_cur_name> } 
							BREAK 
						ENDIF 
					ENDIF 
				ENDIF 
			ENDIF 
		ELSE 
			change node_array_index = 0 
			BREAK 
		ENDIF 
	REPEAT 
ENDSCRIPT

SCRIPT LevelEditor_Geom_PrevLevelObject flag = class 
	tmp_na_index = node_array_index 
	BEGIN 
		change node_array_index = ( <tmp_na_index> - 1 ) 
		IF GetElement NodeArray Index = node_array_index 
			IF StructureContains structure = <Element> <flag> 
				geom_cur_node = ( <Element> . class ) 
				geom_cur_pos = ( <Element> . Pos ) 
				geom_cur_name = ( <Element> . Name ) 
				IF ( <geom_cur_node> = LevelGeometry ) 
					IF StructureContains structure = <Element> TriggerScript 
					ELSE 
						IF StructureContains structure = <Element> TrickObject 
							LevelEditor_Geom_MoveCursor Pos = <geom_cur_pos> 
							change geom_last_node = <geom_cur_name> 
							FormatText ChecksumName = cloned_node_name "%i" i = <geom_cur_name> 
							SetScreenElementProps { 
								id = leveleditor_piece 
								text = <cloned_node_name> 
							} 
							SpawnScript LevelEditor_Geom_HighlightObject Params = { Name = <geom_cur_name> } 
							BREAK 
						ENDIF 
					ENDIF 
				ENDIF 
			ENDIF 
		ELSE 
			change node_array_index = 0 
			BREAK 
		ENDIF 
	REPEAT 
ENDSCRIPT

SCRIPT LevelEditor_Geom_HighlightObject 
	IF GotParam Name 
		BEGIN 
			Invisible Name = <Name> 
			wait 10 frames 
			Visible Name = <Name> 
			wait 10 frames 
		REPEAT 
	ELSE 
	ENDIF 
ENDSCRIPT

SCRIPT LevelEditor_Geom_RemoveHighlight 
	KillSpawnedScript Name = LevelEditor_Geom_HighlightObject 
	IF GetElement NodeArray Index = node_array_index 
		IF StructureContains structure = <Element> class 
			geom_cur_name = ( <Element> . Name ) 
			Visible Name = <geom_cur_name> 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT LevelEditor_Geom_CloneObj 
	IF GotParam Name 
		LevelEditor_Geom_GetNode nodename = <Name> 
		node_origin = ( <node> . Pos ) 
		node_name = ( <node> . Name ) 
		node_angle = ( <node> . angles ) 
		leveleditor : GetCursorPosition 
		new_node_pos = ( <Pos> - <node_origin> ) 
		new_node_angles = ( VECTOR(0.00000000000, 1.00000000000, 0.00000000000) * <Angle> ) 
		new_node_angles_rad = ( VECTOR(0.00000000000, 1.00000000000, 0.00000000000) * ( <Angle> * ( 3.14159274101 / 180.00000000000 ) ) ) 
		RotateVector X = ( <new_node_pos> . VECTOR(1.00000000000, 0.00000000000, 0.00000000000) ) y = ( <new_node_pos> . VECTOR(0.00000000000, 1.00000000000, 0.00000000000) ) z = ( <new_node_pos> . VECTOR(0.00000000000, 0.00000000000, 1.00000000000) ) rx = ( 0.00000000000 ) ry = ( <new_node_angles> . VECTOR(0.00000000000, 1.00000000000, 0.00000000000) ) rz = ( 0.00000000000 ) 
		new_node_x = ( VECTOR(1.00000000000, 0.00000000000, 0.00000000000) * <X> ) 
		new_node_y = ( VECTOR(0.00000000000, 1.00000000000, 0.00000000000) * <y> ) 
		new_node_z = ( VECTOR(0.00000000000, 0.00000000000, 1.00000000000) * <z> ) 
		new_node_pos_final = ( <new_node_x> + <new_node_y> + <new_node_z> ) 
		clone_obj_node = { 
			Pos = <new_node_pos> 
			angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
			Name = <node_name> 
			class = LevelObject 
			CreatedAtStart 
			CollisionMode = Geometry 
		} 
		CreateFromStructure <clone_obj_node> 
		Ksk_DebugValue value_name = "Position" value_value = <new_node_pos> 
		Ksk_DebugValue value_name = "Angles" value_value = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		Ksk_DebugValue value_name = "Name" value_value = <node_name> 
	ELSE 
	ENDIF 
	exit_pause_menu 
ENDSCRIPT

SCRIPT LevelEditor_Geom_GetNode 
	change search_array_index = 0 
	IF GotParam nodename 
		tmp_na_index = search_array_index 
		BEGIN 
			change search_array_index = ( <tmp_na_index> + 1 ) 
			IF GetElement NodeArray Index = search_array_index 
				IF StructureContains structure = <Element> class 
					geom_cur_name = ( <Element> . Name ) 
					IF ( <geom_cur_name> = <nodename> ) 
						RETURN node = <Element> 
					ENDIF 
				ENDIF 
			ENDIF 
		REPEAT 
	ELSE 
		create_console_message text = "No object name" 
	ENDIF 
ENDSCRIPT

SCRIPT LevelEditor_Geom_HideObject 
	KillSpawnedScript Name = LevelEditor_Geom_HighlightObject 
	IF GetElement NodeArray Index = node_array_index 
		IF StructureContains structure = <Element> class 
			geom_cur_name = ( <Element> . Name ) 
			Invisible Name = <geom_cur_name> 
		ENDIF 
	ENDIF 
	exit_pause_menu 
ENDSCRIPT

SCRIPT LevelEditor_Geom_KillObject 
	KillSpawnedScript Name = LevelEditor_Geom_HighlightObject 
	IF GetElement NodeArray Index = node_array_index 
		IF StructureContains structure = <Element> class 
			geom_cur_name = ( <Element> . Name ) 
			kill Name = <geom_cur_name> 
		ENDIF 
	ENDIF 
	exit_pause_menu 
ENDSCRIPT

SCRIPT LevelEditor_Geom_X 
	LevelEditor_Geom_GetNode nodename = geom_last_node 
	node_name = ( <node> . Name ) 
	node_pos = ( <node> . Pos ) 
	leveleditor : GetCursorPosition 
	last_position = <Pos> 
	BEGIN 
		wait 5 frames 
		leveleditor : GetCursorPosition 
		MoveNode Name = <node_name> position = ( <Pos> - <node_pos> ) 
		IF ControllerPressed X 
			BREAK 
		ENDIF 
		IF ControllerPressed Circle 
			MoveNode Name = <node_name> position = <last_position> 
			BREAK 
		ENDIF 
	REPEAT 
	ControllerDebounce X time = 0.89999997616 clear = 1 
ENDSCRIPT

SCRIPT LevelEditor_Geom_Square 
	LevelEditor_Geom_RemoveHighlight 
	LevelEditor_Geom_NextLevelObject 
	IF ( LAUNCHER_SETTING_OBSHACK = 1 ) 
		ControllerDebounce Black time = 0.20000000298 clear = 1 
	ELSE 
		ControllerDebounce Square time = 0.20000000298 clear = 1 
	ENDIF 
ENDSCRIPT

SCRIPT LevelEditor_Geom_Circle 
	LevelEditor_Geom_RemoveHighlight 
	LevelEditor_Geom_PrevLevelObject 
	ControllerDebounce Circle time = 0.20000000298 clear = 1 
ENDSCRIPT

SCRIPT LevelEditor_Geom_Triangle 
	LevelEditor_Geom_ShowMenu 
	ControllerDebounce Triangle time = 0.89999997616 clear = 1 
ENDSCRIPT


