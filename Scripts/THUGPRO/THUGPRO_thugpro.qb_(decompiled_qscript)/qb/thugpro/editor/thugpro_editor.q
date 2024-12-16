
MODEL_INVISIBLE = "none" 
MODEL_CUBE = "none" 
MODEL_CUBE_WIREFRAME_RED = "none" 
MODEL_CUBE_WIREFRAME_GREEN = "none" 
MODEL_CUBE_WIREFRAME_BLUE = "none" 
MODEL_NODE_RED = "none" 
MODEL_NODE_GREEN = "none" 
MODEL_NODE_BLUE = "none" 
MODEL_NODE_YELLOW = "none" 
MODEL_NODE_PINK = "none" 
SCRIPT PROXIM_InitTriggerScript 
	Obj_GetId 
	<objID> : GetSingleTag _RADIUS 
	<objID> : Obj_SetInnerRadius <_RADIUS> 
	<objID> : Obj_SetOuterRadius <_RADIUS> 
	<objID> : Obj_ClearExceptions 
	ClearEventHandler AnyObjectInRadius 
	ClearEventHandler ObjectOutofaRadius 
	ClearEventHandler SkaterEnterRail 
	<objID> : PROXIM_UpdateModels 
	SetEventHandler ex = AnyObjectInRadius scr = PROXIM_InTriggerRadius params = { id = <objID> } 
ENDSCRIPT

SCRIPT PROXIM_InTriggerRadius 
	Obj_GetId 
	<objID> : Obj_InitModel model = ( MODEL_CUBE_WIREFRAME_GREEN ) 
	ClearEventHandler AnyObjectInRadius 
	ClearEventHandler ObjectOutofRadius 
	<objID> : GetSingleTag _TRIGGERED 
	<objID> : GetSingleTag _SKATER_STATE 
	IF ( <_TRIGGERED> = 0 ) 
		<colObjId> : GetSingleTag state 
		SWITCH <_SKATER_STATE> 
			CASE STATE_RAIL 
				IF ( <state> = Skater_OnRail ) 
					<objID> : Obj_SpawnScript PROXIM_NodeTrigger 
				ELSE 
					SetException ex = SkaterEnterRail scr = PROXIM_NodeTrigger 
				ENDIF 
			CASE STATE_MANUAL 
				IF ( <state> = Skater_InManual ) 
					<objID> : Obj_SpawnScript PROXIM_NodeTrigger 
				ELSE 
					SetException ex = SkaterEnterManual scr = PROXIM_NodeTrigger 
				ENDIF 
			CASE STATE_AIR 
				IF ( <state> = Skater_InAir ) 
					<objID> : Obj_SpawnScript PROXIM_NodeTrigger 
				ELSE 
					SetException ex = SkaterEnterAir scr = PROXIM_NodeTrigger 
					SetException ex = SkaterExitAir scr = PROXIM_NodeTrigger 
				ENDIF 
			CASE STATE_VERT_AIR 
				IF <colObjId> : InVertAir 
					<objID> : Obj_SpawnScript PROXIM_NodeTrigger 
				ELSE 
					SetException ex = SkaterEnterVertAir scr = PROXIM_NodeTrigger 
					SetException ex = SkaterExitVertAir scr = PROXIM_NodeTrigger 
				ENDIF 
			CASE STATE_TRANSFER 
				IF ( <state> = Transfer ) 
					<objID> : Obj_SpawnScript PROXIM_NodeTrigger 
				ELSE 
					SetException ex = SkaterEnterTransfer scr = PROXIM_NodeTrigger 
					SetException ex = SkaterExitTransfer scr = PROXIM_NodeTrigger 
				ENDIF 
			CASE STATE_ACID 
				IF ( <state> = AcidDrop ) 
					<objID> : Obj_SpawnScript PROXIM_NodeTrigger 
				ELSE 
					SetException ex = SkaterEnterAcidDrop scr = PROXIM_NodeTrigger 
					SetException ex = SkaterExitAcidDrop scr = PROXIM_NodeTrigger 
				ENDIF 
			CASE STATE_LIP 
				IF ( <state> = Skater_OnLip ) 
					<objID> : Obj_SpawnScript PROXIM_NodeTrigger 
				ELSE 
					SetException ex = SkaterEnterLip scr = PROXIM_NodeTrigger 
				ENDIF 
			CASE STATE_WALLPLANT 
				IF ( <state> = Skater_InWallplant ) 
					<objID> : Obj_SpawnScript PROXIM_NodeTrigger 
				ELSE 
					SetException ex = SkaterEnterWallplant scr = PROXIM_NodeTrigger 
				ENDIF 
			CASE STATE_WALLRIDE 
				IF ( <state> = Skater_OnWall ) 
					<objID> : Obj_SpawnScript PROXIM_NodeTrigger 
				ELSE 
					SetException ex = SkaterEnterWall scr = PROXIM_NodeTrigger 
					SetException ex = SkaterExitWall scr = PROXIM_NodeTrigger 
				ENDIF 
			CASE STATE_NORMAL 
				IF ( <state> = Skater_OnGround ) 
					<objID> : Obj_SpawnScript PROXIM_NodeTrigger 
				ELSE 
					SetException ex = SkaterEnterGround scr = PROXIM_NodeTrigger 
					SetException ex = SkaterExitGround scr = PROXIM_NodeTrigger 
				ENDIF 
		ENDSWITCH 
	ENDIF 
	SetEventHandler ex = ObjectOutofRadius scr = PROXIM_InitTriggerScript 
ENDSCRIPT

SCRIPT PROXIM_NodeTrigger 
	Obj_GetId 
	<objID> : GetSingleTag _TRIGGERED 
	<objID> : GetSingleTag _SKATER_STATE 
	<objID> : GetSingleTag __REQURED_TRICK 
	<objID> : GetSingleTag __REQURED_GAP 
	IF ( <_TRIGGERED> = 0 ) 
		<objID> : SetTags _TRIGGERED = 1 
		<objID> : Obj_PlaySound GapSound_11 
		IF GotParam __REQURED_TRICK 
			GetNumberOfTrickOccurrences_SUB TrickText = <__REQURED_TRICK> 
			IF ( <num_occurrences> > 0 ) 
				<objID> : SetTags _TRIGGERED_TRICK = 1 
			ENDIF 
		ENDIF 
		wait 20 frames 
		LaunchEvent Broadcast Type = Event_NodeInstantTrigger 
	ENDIF 
ENDSCRIPT

SCRIPT PROXIM_RootTriggerScript 
	Obj_GetId 
	<objID> : GetSingleTag items 
	<objID> : GetSingleTag __CONDITION_1 
	SWITCH <__CONDITION_1> 
		CASE NO_MANUAL 
			ClearEventHandler SkaterEnterManual 
			ClearEventHandler SkaterEnterWalking 
			SetException ex = SkaterEnterManual scr = PROXIM_RootResetTriggerAndEvents params = { objID = <objID> items = <items> } 
			SetException ex = SkaterEnterWalking scr = PROXIM_RootResetTriggerAndEvents params = { objID = <objID> items = <items> } 
		CASE NO_WALKING 
			ClearEventHandler SkaterEnterWalking 
			SetException ex = SkaterEnterWalking scr = PROXIM_RootResetTriggerAndEvents params = { objID = <objID> items = <items> } 
		CASE NO_RAIL 
			ClearEventHandler SkaterPointRail 
			ClearEventHandler SkaterEnterRail 
			ClearEventHandler SkaterEnterLip 
			SetException ex = SkaterEnterRail scr = PROXIM_RootResetTriggerAndEvents params = { objID = <objID> items = <items> } 
			SetException ex = SkaterPointRail scr = PROXIM_RootResetTriggerAndEvents params = { objID = <objID> items = <items> } 
			SetException ex = SkaterEnterLip scr = PROXIM_RootResetTriggerAndEvents params = { objID = <objID> items = <items> } 
		CASE MANUAL_ONLY 
			ClearEventHandler SkaterEnterWalking 
			ClearEventHandler SkaterEnterLip 
			ClearEventHandler SkaterEnterSkitch 
			ClearEventHandler SkaterEnterRail 
			ClearEventHandler SkaterPointRail 
			SetException ex = SkaterEnterWalking scr = PROXIM_RootResetTriggerAndEvents params = { objID = <objID> items = <items> } 
			SetException ex = SkaterEnterLip scr = PROXIM_RootResetTriggerAndEvents params = { objID = <objID> items = <items> } 
			SetException ex = SkaterEnterSkitch scr = PROXIM_RootResetTriggerAndEvents params = { objID = <objID> items = <items> } 
			SetException ex = SkaterEnterRail scr = PROXIM_RootResetTriggerAndEvents params = { objID = <objID> items = <items> } 
			SetException ex = SkaterPointRail scr = PROXIM_RootResetTriggerAndEvents params = { objID = <objID> items = <items> } 
		CASE RAIL_ONLY 
			ClearEventHandler SkaterEnterWalking 
			ClearEventHandler SkaterEnterManual 
			ClearEventHandler SkaterEnterSkitch 
			SetException ex = SkaterEnterWalking scr = PROXIM_RootResetTriggerAndEvents params = { objID = <objID> items = <items> } 
			SetException ex = SkaterEnterSkitch scr = PROXIM_RootResetTriggerAndEvents params = { objID = <objID> items = <items> } 
			SetException ex = SkaterEnterManual scr = PROXIM_RootResetTriggerAndEvents params = { objID = <objID> items = <items> } 
		DEFAULT 
	ENDSWITCH 
	ClearEventHandler SkaterLanded 
	ClearEventHandler SkaterBailed 
	ClearEventHandler Event_NodeInstantTrigger 
	SetException ex = SkaterLanded scr = PROXIM_RootSkaterLanded params = { objID = <objID> items = <items> } 
	SetException ex = SkaterBailed scr = PROXIM_RootSkaterBailed params = { objID = <objID> items = <items> } 
	SetException ex = Event_NodeInstantTrigger scr = PROXIM_RootSkaterLanded params = { objID = <objID> items = <items> __INSTANT } 
ENDSCRIPT

SCRIPT PROXIM_RootResetTriggerAndEvents 
	<objID> : SetTags __NUM_ITEMS_TRIGGERED = 0 
	ForEachIn <items> Do = PROXIM_CheckForCompleted params = { objID = <objID> } 
	<objID> : GetSingleTag __NUM_ITEMS_TRIGGERED 
	<objID> : GetSingleTag __NUM_ITEMS 
	<objID> : GetSingleTag __CONDITION_1 
	<objID> : GetSingleTag __CONDITION_2 
	<objID> : GetSingleTag _NO_GOAL 
	IF GotParam _NO_GOAL 
		<objID> : GetSingleTag goal_text 
	ENDIF 
	IF ( <__NUM_ITEMS_TRIGGERED> > 0 ) 
		IF IntegerEquals a = <__NUM_ITEMS_TRIGGERED> b = <__NUM_ITEMS> 
			SWITCH <__CONDITION_1> 
				CASE RAIL_ONLY 
					ClearEventHandler SkaterEnterWalking 
					ClearEventHandler SkaterEnterManual 
					ClearEventHandler SkaterEnterSkitch 
				CASE NO_RAIL 
					ClearEventHandler SkaterEnterRail 
					ClearEventHandler SkaterPointRail 
					ClearEventHandler SkaterEnterLip 
				CASE MANUAL_ONLY 
					ClearEventHandler SkaterEnterWalking 
					ClearEventHandler SkaterEnterLip 
					ClearEventHandler SkaterEnterSkitch 
					ClearEventHandler SkaterEnterRail 
					ClearEventHandler SkaterPointRail 
				CASE NO_MANUAL 
					ClearEventHandler SkaterEnterManual 
					ClearEventHandler SkaterEnterWalking 
				CASE NO_WALKING 
					ClearEventHandler SkaterEnterWalking 
				DEFAULT 
					IF NOT GotParam _NO_GOAL 
						FormatText TextName = _message_string "\'%a\' - Reset!" a = <goal_text> 
						Create_Panel_Message text = <_message_string> id = _msg_goal_failed style = sloppy_style 
						PlaySound GUI_buzzer01 
					ENDIF 
					<objID> : SetTags __NUM_ITEMS_TRIGGERED = 0 
					ForEachIn <items> Do = PROXIM_ResetCompleted params = { objID = <objID> } 
			ENDSWITCH 
		ELSE 
			IF NOT GotParam _NO_GOAL 
				FormatText TextName = _message_string "\'%a\' - Reset!" a = <goal_text> 
				Create_Panel_Message text = <_message_string> id = _msg_goal_failed style = sloppy_style 
				PlaySound GUI_buzzer01 
			ENDIF 
			<objID> : SetTags __NUM_ITEMS_TRIGGERED = 0 
			ForEachIn <items> Do = PROXIM_ResetCompleted params = { objID = <objID> } 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT PROXIM_CheckForCompleted 
	<objID> : GetSingleTag __NUM_ITEMS_TRIGGERED 
	<objID> : GetSingleTag __NAME_STRING 
	<objID> : GetSingleTag __CONDITION_1 
	<objID> : GetSingleTag __CONDITION_2 
	FormatText ChecksumName = _name "%a_proxim_%i" a = <__NAME_STRING> i = <index> 
	<_name> : GetSingleTag _TRIGGERED 
	IF ( <_TRIGGERED> = 1 ) 
		<objID> : SetTags __NUM_ITEMS_TRIGGERED = ( <__NUM_ITEMS_TRIGGERED> + 1 ) 
	ELSE 
	ENDIF 
ENDSCRIPT

SCRIPT GetNumberOfTrickOccurrences_SUB 
	GetNumberOfTrickOccurrences TrickText = <TrickText> 
	IF ( <number_of_occurrences> > 0 ) 
		RETURN num_occurrences = <number_of_occurrences> 
	ENDIF 
	FormatText TextName = FS_String "FS %a" a = <TrickText> 
	GetNumberOfTrickOccurrences TrickText = <FS_String> 
	IF ( <number_of_occurrences> > 0 ) 
		RETURN num_occurrences = <number_of_occurrences> 
	ENDIF 
	FormatText TextName = BS_String "BS %a" a = <TrickText> 
	GetNumberOfTrickOccurrences TrickText = <BS_String> 
	RETURN num_occurrences = <number_of_occurrences> 
ENDSCRIPT

SCRIPT PROXIM_RootSkaterBailed 
	<objID> : SetTags __NUM_ITEMS_TRIGGERED = 0 
	ForEachIn <items> Do = PROXIM_CheckForCompleted params = { objID = <objID> } 
	<objID> : GetSingleTag __NUM_ITEMS_TRIGGERED 
	<objID> : GetSingleTag _NO_GOAL 
	IF NOT GotParam _NO_GOAL 
		<objID> : GetSingleTag goal_text 
		IF ( <__NUM_ITEMS_TRIGGERED> > 0 ) 
			PlaySound GUI_buzzer01 
			FormatText TextName = _message_string "\'%a\' - Bailed!" a = <goal_text> 
			Create_Panel_Message text = <_message_string> id = _msg_goal_failed style = sloppy_style 
		ENDIF 
	ENDIF 
	<objID> : SetTags __NUM_ITEMS_TRIGGERED = 0 
	ForEachIn <items> Do = PROXIM_ResetCompleted params = { objID = <objID> } 
ENDSCRIPT

SCRIPT PROXIM_RootSkaterLanded 
	FAILED = 0 
	<objID> : GetSingleTag __CONDITION_1 
	<objID> : GetSingleTag __CONDITION_2 
	<objID> : GetSingleTag __TRIGGER_SCRIPT 
	<objID> : GetSingleTag _NO_GOAL 
	<objID> : GetSingleTag __REQURED_TRICK 
	<objID> : GetSingleTag __REQURED_GAP 
	<objID> : GetSingleTag __NAME_STRING 
	IF GotParam __INSTANT 
		IF NOT ( <__CONDITION_2> = INSTANT_TRIGGER ) 
			RETURN 
		ENDIF 
	ENDIF 
	IF GotParam __REQURED_TRICK 
		%"WasTrickDoneMoreThanOnce?" items = <items> __NAME_STRING = <__NAME_STRING> 
		IF GotParam No 
			FORCE_FAILED = 1 
		ENDIF 
	ENDIF 
	<objID> : SetTags __NUM_ITEMS_TRIGGERED = 0 
	ForEachIn <items> Do = PROXIM_CheckForCompleted params = { objID = <objID> } 
	<objID> : GetSingleTag __NUM_ITEMS_TRIGGERED 
	<objID> : GetSingleTag __NUM_ITEMS 
	IF NOT GotParam _NO_GOAL 
		<objID> : GetSingleTag __GOAL_FLAG 
		<objID> : GetSingleTag goal_id 
		<objID> : GetSingleTag goal_text 
	ENDIF 
	SWITCH <__CONDITION_2> 
		CASE TRIGGER_ONE 
			IF NOT GotParam FORCE_FAILED 
				IF ( <__NUM_ITEMS_TRIGGERED> > 0 ) 
					FAILED = 0 
				ELSE 
					FAILED = 1 
				ENDIF 
			ELSE 
				FAILED = 1 
			ENDIF 
		CASE INSTANT_TRIGGER 
			IF NOT GotParam FORCE_FAILED 
				IF IntegerEquals a = <__NUM_ITEMS_TRIGGERED> b = <__NUM_ITEMS> 
					FAILED = 0 
				ELSE 
					FAILED = 1 
				ENDIF 
			ELSE 
				FAILED = 1 
			ENDIF 
		DEFAULT 
			IF NOT GotParam FORCE_FAILED 
				IF IntegerEquals a = <__NUM_ITEMS_TRIGGERED> b = <__NUM_ITEMS> 
					FAILED = 0 
				ELSE 
					FAILED = 1 
				ENDIF 
			ELSE 
				FAILED = 1 
			ENDIF 
	ENDSWITCH 
	IF ( <FAILED> = 0 ) 
		<objID> : SetTags COMPLETED = 1 
		IF NOT GotParam _NO_GOAL 
			FormatText TextName = _message_string "\'%a\' - Completed!" a = <goal_text> 
			Create_Panel_Message text = <_message_string> id = _msg_goal_completed style = perfect_style rgba = [ 50 150 50 128 ] 
			IF GoalManager_GoalExists Name = <goal_id> 
				GoalManager_SetGoalFlag Name = <goal_id> ( <__GOAL_FLAG> ) 1 
			ENDIF 
		ENDIF 
		IF GotParam __TRIGGER_SCRIPT 
			edmsg2 "calling __TRIGGER_SCRIPT %a" a = <__TRIGGER_SCRIPT> 
			<__TRIGGER_SCRIPT> 
		ENDIF 
		ClearEventHandler SkaterLanded 
		ClearEventHandler SkaterBailed 
		ClearEventHandler Event_NodeInstantTrigger 
		SWITCH <__CONDITION_1> 
			CASE RAIL_ONLY 
				ClearEventHandler SkaterEnterWalking 
				ClearEventHandler SkaterEnterManual 
			CASE NO_RAIL 
				ClearEventHandler SkaterEnterRail 
				ClearEventHandler SkaterPointRail 
				ClearEventHandler SkaterEnterLip 
			CASE MANUAL_ONLY 
				ClearEventHandler SkaterEnterWalking 
				ClearEventHandler SkaterEnterLip 
				ClearEventHandler SkaterEnterSkitch 
				ClearEventHandler SkaterEnterRail 
				ClearEventHandler SkaterPointRail 
			CASE NO_MANUAL 
				ClearEventHandler SkaterEnterManual 
				ClearEventHandler SkaterEnterWalking 
			CASE NO_WALKING 
				ClearEventHandler SkaterEnterWalking 
			DEFAULT 
				ClearEventHandler SkaterEnterManual 
				ClearEventHandler SkaterEnterWalking 
		ENDSWITCH 
	ELSE 
		IF NOT GotParam _NO_GOAL 
			IF ( <__NUM_ITEMS_TRIGGERED> > 0 ) 
				PlaySound GUI_buzzer01 
				FormatText TextName = _message_string "\'%a\' - Failed!" a = <goal_text> 
				Create_Panel_Message text = <_message_string> id = _msg_goal_failed style = sloppy_style 
			ENDIF 
		ENDIF 
		<objID> : SetTags __NUM_ITEMS_TRIGGERED = 0 
		ForEachIn <items> Do = PROXIM_ResetCompleted params = { objID = <objID> } 
	ENDIF 
ENDSCRIPT

SCRIPT %"WasTrickDoneMoreThanOnce?" 
	GetArraySize <items> 
	i = 0 
	IF ( <array_size> > 0 ) 
		BEGIN 
			FormatText ChecksumName = _name "%a_proxim_%i" a = <__NAME_STRING> i = <i> 
			<_name> : GetSingleTag _TRIGGERED_TRICK 
			IF ( <_TRIGGERED_TRICK> = 1 ) 
				RETURN Yes = 1 
			ENDIF 
			<i> = ( <i> + 1 ) 
		REPEAT <array_size> 
	ENDIF 
	RETURN No = 1 
ENDSCRIPT

SCRIPT %"WasGapDoneMoreThanOnce?" 
	GetArraySize <items> 
	i = 0 
	IF ( <array_size> > 0 ) 
		BEGIN 
			FormatText ChecksumName = _name "%a_proxim_%i" a = <__NAME_STRING> i = <i> 
			<_name> : GetSingleTag _TRIGGERED_GAP 
			IF ( <_TRIGGERED_GAP> = 1 ) 
				RETURN Yes = 1 
			ENDIF 
			<i> = ( <i> + 1 ) 
		REPEAT <array_size> 
	ENDIF 
	RETURN No = 1 
ENDSCRIPT

SCRIPT PROXIM_UpdateModels 
	Obj_GetId 
	<objID> : GetSingleTag _TRIGGERED 
	IF GotParam _TRIGGERED 
		IF ( <_TRIGGERED> = 1 ) 
			<objID> : Obj_InitModel model = ( MODEL_CUBE_WIREFRAME_GREEN ) 
		ELSE 
			<objID> : Obj_InitModel model = ( MODEL_CUBE_WIREFRAME_RED ) 
		ENDIF 
	ELSE 
		<objID> : Obj_InitModel model = ( MODEL_CUBE_WIREFRAME_RED ) 
	ENDIF 
ENDSCRIPT

SCRIPT PROXIM_ResetCompleted 
	<objID> : GetSingleTag __NAME_STRING 
	FormatText ChecksumName = _name "%a_proxim_%i" a = <__NAME_STRING> i = <index> 
	<_name> : SetTags _TRIGGERED = 0 
	<_name> : SetTags _TRIGGERED_TRICK = 0 
	<_name> : SetTags _TRIGGERED_GAP = 0 
	<_name> : PROXIM_UpdateModels 
ENDSCRIPT

SCRIPT PROXIM_Delete 
	<objID> : GetSingleTag __NAME_STRING 
	FormatText ChecksumName = _name "%a_proxim_%i" a = <__NAME_STRING> i = <index> 
	FormatText ChecksumName = _checksum "%a_proxim_%i_string" a = <__NAME_STRING> i = <index> 
	FormatText ChecksumName = _rootChecksum "%a_string" a = <__NAME_STRING> 
	IF ObjectExists id = <_name> 
		<_name> : Die 
	ENDIF 
	DestroyIfObjectExist id = <_checksum> 
	DestroyIfObjectExist id = <_rootChecksum> 
ENDSCRIPT

SCRIPT PROXIM_HighlightGeometry 
	printf "Natas Spin Flash Called" 
	SetLightGroup Name = <ObjName> light_group = goal_skate_the_line_colors 
	BEGIN 
		<parent> : GetSingleTag COMPLETED 
		IF NOT ObjectExists id = <parent> 
			BREAK 
		ENDIF 
		IF ( <COMPLETED> = 1 ) 
			BREAK 
		ENDIF 
		SetObjectColor color = -8388608 Name = <ObjName> 
		wait 0.50000000000 seconds 
		SetObjectColor color = -16744448 Name = <ObjName> 
		wait 0.50000000000 seconds 
	REPEAT 
	SetLightGroup Name = <ObjName> light_group = outdoor 
	goto PROXIM_HighlightGeometry_Kill params = { ObjName = <ObjName> } 
ENDSCRIPT

SCRIPT PROXIM_HighlightGeometry_Kill 
	SetLightGroup light_group = outdoor Name = <Name> 
	SetObjectColor_CurrentTOD Name = <ObjName> 
ENDSCRIPT

SCRIPT MaybeResetHighlightGeometry 
	SetLightGroup light_group = outdoor Name = <Name> 
	SetObjectColor_CurrentTOD Name = <Name> 
ENDSCRIPT

SCRIPT MaybeCreateProximNodes 
	FormatText ChecksumName = _name "%a_proxim_%i" a = <parent_name> i = <index> 
	IF GotParam __SCALE 
		_scale_x = <__SCALE> 
		_scale_y = <__SCALE> 
		_scale_z = <__SCALE> 
		_RADIUS = ( 8.00000000000 * <__SCALE> ) 
	ELSE 
		_scale_x = 1.00000000000 
		_scale_y = 1.00000000000 
		_scale_z = 1.00000000000 
		_RADIUS = 8.00000000000 
	ENDIF 
	CreateFromStructure { 
		Name = <_name> 
		Pos = <__POS> 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		Class = GameObject 
		CreatedAtStart 
		TriggerScript = PROXIM_InitTriggerScript 
		x = <_scale_x> 
		y = <_scale_y> 
		z = <_scale_z> 
		model = ( MODEL_CUBE_WIREFRAME_RED ) 
	} 
	<_name> : SetTags _TRIGGERED = 0 
	<_name> : SetTags _TRIGGERED_TRICK = 0 
	<_name> : SetTags _TRIGGERED_GAP = 0 
	<_name> : SetTags _RADIUS = <_RADIUS> 
	<_name> : SetTags _ALT_DONE = 0 
	IF NOT StringEquals a = "no trick" b = <__REQURED_TRICK> 
		<_name> : SetTags __REQURED_TRICK = <__REQURED_TRICK> 
	ENDIF 
	IF NOT StringEquals a = "no gap" b = <__REQURED_GAP> 
		<_name> : SetTags __REQURED_GAP = <__REQURED_GAP> 
	ENDIF 
	IF GotParam SKATER_STATE 
		<_name> : SetTags _SKATER_STATE = <SKATER_STATE> 
		FormatText ChecksumName = _checksum "%a_proxim_%i_string" a = <parent_name> i = <index> 
		FormatText TextName = _string "proxim %a" a = <SKATER_STATE> 
		CreateScreenElement { 
			id = <_checksum> 
			Type = textElement 
			parent = root_window 
			font = small 
			text = <_string> 
			scale = 1.00000000000 
			just = [ center center ] 
			pos3D = <__POS> 
			rgba = [ 128 128 128 128 ] 
			shadow 
			shadow_rgba = [ 0 0 0 128 ] 
			shadow_offs = PAIR(0.50000000000, 0.50000000000) 
		} 
	ELSE 
		<_name> : SetTags _SKATER_STATE = STATE_NORMAL 
	ENDIF 
ENDSCRIPT

SCRIPT MaybeDeleteProximRootNodes 
	FormatText ChecksumName = _name "%a" a = <Name> 
	<_name> : SetTags __NUM_ITEMS_TRIGGERED = 0 
	ForEachIn <items> Do = PROXIM_ResetCompleted params = { objID = <_name> } 
	ForEachIn <items> Do = PROXIM_Delete params = { objID = <_name> } 
	IF GotParam highlight_nodes 
		GetArraySize <highlight_nodes> 
		i = 0 
		IF ( <array_size> > 0 ) 
			BEGIN 
				MaybeResetHighlightGeometry Name = ( <highlight_nodes> [ <i> ] ) 
				<i> = ( <i> + 1 ) 
			REPEAT <array_size> 
		ENDIF 
	ENDIF 
	IF ObjectExists id = <_name> 
		<_name> : Die 
	ENDIF 
ENDSCRIPT

SCRIPT MaybeResetProximRootNodes 
	FormatText ChecksumName = _name "%a" a = <Name> 
	<_name> : Obj_SpawnScript PROXIM_RootTriggerScript 
	<_name> : SetTags EXIT = 0 
	<_name> : SetTags items = <items> 
	<_name> : SetTags __NAME_STRING = <Name> 
	<_name> : SetTags __NUM_ITEMS = <__NUM_ITEMS> 
	<_name> : SetTags __NUM_ITEMS_TRIGGERED = 0 
	<_name> : SetTags _ALT_DONE = 0 
	ForEachIn <items> Do = PROXIM_ResetCompleted params = { objID = <_name> } 
ENDSCRIPT

SCRIPT MaybeCreateProximRootNode 
	FormatText ChecksumName = _name "%a" a = <Name> 
	CreateFromStructure { 
		Name = <_name> 
		Pos = <__POS> 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		Class = GameObject 
		CreatedAtStart 
		TriggerScript = PROXIM_RootTriggerScript 
		model = ( MODEL_CUBE ) 
	} 
	GetArraySize <items> 
	<_name> : SetTags EXIT = 0 
	<_name> : SetTags items = <items> 
	<_name> : SetTags __NAME_STRING = <Name> 
	<_name> : SetTags __NUM_ITEMS = <array_size> 
	RemoveParameter array_size 
	<_name> : SetTags __NUM_ITEMS_TRIGGERED = 0 
	<_name> : SetTags _ALT_DONE = 0 
	<_name> : SetTags __CONDITION_1 = <__CONDITION_1> 
	<_name> : SetTags __CONDITION_2 = <__CONDITION_2> 
	IF GotParam _NO_GOAL 
		<_name> : SetTags _NO_GOAL = 1 
	ENDIF 
	IF GotParam __TRIGGER_SCRIPT 
		<_name> : SetTags __TRIGGER_SCRIPT = <__TRIGGER_SCRIPT> 
	ENDIF 
	IF NOT GotParam _NO_GOAL 
		<_name> : SetTags __GOAL_FLAG = <__GOAL_FLAG> 
		<_name> : SetTags goal_text = <goal_text> 
		<_name> : SetTags goal_id = <goal_id> 
	ENDIF 
	<_name> : SetTags COMPLETED = 0 
	IF GotParam __REQURED_TRICK 
		<_name> : SetTags __REQURED_TRICK = <__REQURED_TRICK> 
	ELSE 
		<__REQURED_TRICK> = "no trick" 
	ENDIF 
	IF GotParam __REQURED_GAP 
		<_name> : SetTags __REQURED_GAP = <__REQURED_GAP> 
	ELSE 
		<__REQURED_GAP> = "no gap" 
	ENDIF 
	ForEachIn <items> Do = MaybeCreateProximNodes params = { parent = <_name> parent_name = <Name> __REQURED_TRICK = <__REQURED_TRICK> __REQURED_GAP = <__REQURED_GAP> } 
	IF GotParam highlight_nodes 
		GetArraySize <highlight_nodes> 
		i = 0 
		IF ( <array_size> > 0 ) 
			BEGIN 
				SpawnScript PROXIM_HighlightGeometry id = GOAL_BLINK_TEST params = { parent = <_name> parent_name = <Name> ObjName = ( <highlight_nodes> [ <i> ] ) } 
				<i> = ( <i> + 1 ) 
			REPEAT <array_size> 
		ENDIF 
	ENDIF 
	FormatText ChecksumName = _checksum "%a_string" a = <Name> 
	FormatText TextName = _string "%a" a = <__CONDITION_1> 
	CreateScreenElement { 
		id = <_checksum> 
		Type = textElement 
		parent = root_window 
		font = small 
		text = <_string> 
		scale = 0.60000002384 
		just = [ center center ] 
		pos3D = ( <__POS> + VECTOR(0.00000000000, 60.00000000000, 0.00000000000) ) 
		rgba = [ 128 128 128 128 ] 
		shadow 
		shadow_rgba = [ 0 0 0 128 ] 
		shadow_offs = PAIR(0.50000000000, 0.50000000000) 
	} 
ENDSCRIPT

__ANIM_IS_PLAYING = 0 
_ShowFocusNodes = 0 
editor_cam_anim_helper_composite_structure = 
[ 
	{ component = motion } 
	{ component = model } 
] 
SCRIPT play_thugpro_cutscene_anim 
	IF NOT ObjectExists id = <Name> 
		RETURN 
	ENDIF 
	GetStartTime 
	edmsg2 "\\c4play_thugpro_cutscene_anim (%a)" a = <Name> 
	IF ScreenElementExists id = CAMERA_BUTTON_EVENT_HANDLER 
		DestroyScreenElement id = CAMERA_BUTTON_EVENT_HANDLER 
	ENDIF 
	CreateScreenElement { 
		id = CAMERA_BUTTON_EVENT_HANDLER 
		parent = root_window 
		Type = ContainerElement 
		event_handlers = [ ] 
	} 
	FireEvent Type = focus target = CAMERA_BUTTON_EVENT_HANDLER 
	thugpro_cutscene_fake_letterboxing 
	hide_all_hud_items dont_disable_screen_effects 
	IF GotParam speed 
		Editor_PlayCameraAnim Name = <Name> speed = <speed> <fade> 
	ELSE 
		Editor_PlayCameraAnim Name = <Name> <fade> 
	ENDIF 
	thugpro_cutscene_fake_letterboxing remove 
	show_all_hud_items 
	GetElapsedTime StartTime = <StartTime> 
	IF GotParam callback_script 
		SpawnScript { 
			<callback_script> 
			params = { 
				Name = <Name> 
				ElapsedTime = <ElapsedTime> 
			} 
		} 
	ENDIF 
	wait 1 seconds 
	Editor_CleanupCameraAnim Name = <Name> 
	IF ScreenElementExists id = CAMERA_BUTTON_EVENT_HANDLER 
		DestroyScreenElement id = CAMERA_BUTTON_EVENT_HANDLER 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_cutscene_fake_letterboxing 
	IF ScreenElementExists id = letterbox_anchor 
		DestroyScreenElement id = letterbox_anchor 
	ENDIF 
	IF GotParam remove 
		RETURN 
	ENDIF 
	SetScreenElementLock id = root_window off 
	CreateScreenElement { 
		Type = ContainerElement 
		id = letterbox_anchor 
		parent = root_window 
		z_priority = 999 
		just = [ center center ] 
		internal_just = [ left top ] 
	} 
	CreateScreenElement { 
		Type = SpriteElement 
		parent = letterbox_anchor 
		texture = white2 
		scale = PAIR(100.00000000000, 9.50000000000) 
		Pos = PAIR(0.00000000000, -20.00000000000) 
		rgba = [ 0 0 0 128 ] 
		just = [ left top ] 
		z_priority = 15 
	} 
	CreateScreenElement { 
		Type = SpriteElement 
		parent = letterbox_anchor 
		texture = white2 
		scale = PAIR(100.00000000000, 12.00000000000) 
		Pos = PAIR(0.00000000000, 392.00000000000) 
		rgba = [ 0 0 0 128 ] 
		just = [ left top ] 
		z_priority = 15 
	} 
ENDSCRIPT

SCRIPT Editor_GoToNextCameraAnimFrame 
	printf "Editor_GoToNextCameraAnimFrame" 
	IF NOT ObjectExists id = <Name> 
		RETURN 
	ENDIF 
	<Name> : GetSingleTag __CURRENT_FRAME_INDEX 
	<index> = <__CURRENT_FRAME_INDEX> 
	BEGIN 
		RemoveParameter _node_name 
		FormatText ChecksumName = _node_name "%a_%b_a" a = <Name> b = <index> 
		IF ObjectExists id = <_node_name> 
			RemoveParameter __CHECKPOINT 
			<_node_name> : GetSingleTag __CHECKPOINT 
			IF GotParam __CHECKPOINT 
				<Name> : SetTags __SKIP_TO_FRAME = 1 
				<Name> : SetTags __SKIP_FRAME_INDEX = <index> 
				editor_cam_parent : Obj_StopMoving 
				BREAK 
			ENDIF 
		ELSE 
			BREAK 
		ENDIF 
		<index> = ( <index> + 1 ) 
	REPEAT 
ENDSCRIPT

SCRIPT CleanupSkaterFollowCameraAnim 
	IF IsTrue __ANIM_IS_PLAYING 
		Change __ANIM_IS_PLAYING = 0 
		PlaySkaterCamAnim Stop 
		KillSkaterCamAnim All 
		restore_skater_camera 
	ENDIF 
	IF ObjectExists id = editor_cam_parent 
		editor_cam_parent : Obj_StopMoving 
	ENDIF 
	IF ObjectExists id = editor_cam 
		editor_cam : Obj_KillSpawnedScript Name = _CameraFollowSkater 
	ENDIF 
	IF ObjectExists id = editor_cam_parent 
		editor_cam_parent : Die 
	ENDIF 
	IF ObjectExists id = editor_cam_target 
		editor_cam_target : Die 
	ENDIF 
ENDSCRIPT

SCRIPT PlaySkaterFollowCameraAnim 
	IF IsTrue __ANIM_IS_PLAYING 
		PlaySkaterCamAnim Stop 
		KillSkaterCamAnim All 
		restore_skater_camera 
		RETURN 
	ENDIF 
	Change __ANIM_IS_PLAYING = 1 
	IF NOT GotParam fov 
		<fov> = 70 
	ENDIF 
	Skater : Obj_GetPosition 
	<new_target_pos> = <Pos> 
	IF NOT ObjectExists id = editor_cam_parent 
		CreateCompositeObject { 
			Components = editor_cam_anim_helper_composite_structure 
			params = { 
				Name = editor_cam_parent 
				model = ( MODEL_NODE_RED ) 
				x = 0.10000000149 y = 0.10000000149 z = 0.10000000149 
			} 
		} 
	ENDIF 
	editor_cam_parent : Obj_SetPosition position = <start_position> 
	IF NOT ObjectExists id = editor_cam_target 
		CreateCompositeObject { 
			Components = editor_cam_anim_helper_composite_structure 
			params = { 
				Name = editor_cam_target 
				model = ( MODEL_NODE_GREEN ) 
				x = 0.05000000075 y = 2.50000000000 z = 0.05000000075 
			} 
		} 
	ENDIF 
	editor_cam_target : Obj_SetPosition position = <new_target_pos> 
	PlaySkaterCamAnim Stop 
	KillSkaterCamAnim All 
	PlaySkaterCamAnim { 
		Skater = 0 
		targetid = editor_cam_target 
		Name = editor_cam 
		positionOffset = ( <start_position> - <new_target_pos> ) 
		play_hold 
		fov = <fov> 
		virtual_cam 
	} 
	SetActiveCamera id = editor_cam 
	editor_cam_parent : Obj_MoveToPos <end_position> time = <time> 
	editor_cam : Obj_SpawnScript _CameraFollowSkater params = { fov = <fov> start_position = <start_position> end_position = <end_position> } 
	wait <time> seconds 
	IF GotParam fade 
		EditorCamera_DoFade out time = 0.50000000000 
		EditorCamera_DoFade time = 1.00000000000 wait 
	ENDIF 
	Change __ANIM_IS_PLAYING = 0 
	PlaySkaterCamAnim Stop 
	KillSkaterCamAnim All 
	restore_skater_camera 
	editor_cam_parent : Obj_StopMoving 
	IF GotParam fade 
		EditorCamera_DoFade time = 1.00000000000 wait 
		EditorCamera_DoFade kill 
	ENDIF 
	IF ObjectExists id = editor_cam 
		editor_cam : Obj_KillSpawnedScript Name = _CameraFollowSkater 
	ENDIF 
	IF CompositeObjectExists Name = editor_cam_parent 
		editor_cam_parent : Die 
	ENDIF 
	IF CompositeObjectExists Name = editor_cam_target 
		editor_cam_target : Die 
	ENDIF 
ENDSCRIPT

SCRIPT _CameraFollowSkater 
	printf "_CameraFollowSkater" 
	BEGIN 
		IF NOT IsTrue __ANIM_IS_PLAYING 
			PlaySkaterCamAnim Stop 
			KillSkaterCamAnim All 
			BREAK 
		ENDIF 
		Skater : Obj_GetPosition 
		<new_target_pos> = <Pos> 
		RemoveParameter Pos 
		editor_cam_target : Obj_SetPosition position = <new_target_pos> 
		editor_cam_parent : Obj_GetPosition 
		<new_parent_pos> = <Pos> 
		RemoveParameter Pos 
		PlaySkaterCamAnim Stop 
		KillSkaterCamAnim All 
		PlaySkaterCamAnim { 
			Skater = 0 
			targetid = editor_cam_target 
			Name = editor_cam 
			positionOffset = ( <new_parent_pos> - <new_target_pos> ) 
			play_hold 
			fov = <fov> 
			virtual_cam 
		} 
		wait 1 frame 
	REPEAT 
ENDSCRIPT

SCRIPT Editor_GoToCameraAnimFrame 
	printf "Editor_GoToCameraAnimFrame" 
	IF NOT ObjectExists id = <Name> 
		RETURN 
	ENDIF 
	IF NOT GotParam frame 
		RETURN 
	ENDIF 
	<index> = 0 
	BEGIN 
		RemoveParameter _node_name 
		FormatText ChecksumName = _node_name "%a_%b_a" a = <Name> b = <index> 
		IF ObjectExists id = <_node_name> 
			RemoveParameter __FRAME_NAME 
			<_node_name> : GetSingleTag __FRAME_NAME 
			IF GotParam __FRAME_NAME 
				IF ChecksumEquals a = <__FRAME_NAME> b = <frame> / / 
					edmsg2 "ChecksumEquals %a == %b" a = <__FRAME_NAME> b = <frame> / / 
					edmsg2 "index %i" i = <index> 
					<Name> : SetTags __SKIP_TO_FRAME = 1 
					<Name> : SetTags __SKIP_FRAME_INDEX = <index> 
					editor_cam_parent : Obj_StopMoving 
					BREAK 
				ENDIF 
			ENDIF 
		ELSE 
			BREAK 
		ENDIF 
		<index> = ( <index> + 1 ) 
	REPEAT 
ENDSCRIPT

SCRIPT Editor_ClenupCameraAnim 
	Editor_CleanupCameraAnim <...> 
ENDSCRIPT

SCRIPT Editor_CleanupCameraAnim 
	edmsg2 "\\c5Editor_CleanupCameraAnim(%a)" a = <Name> 
	wait 0.20000000298 seconds 
	IF NOT ObjectExists id = <Name> 
		RETURN 
	ENDIF 
	Change __ANIM_IS_PLAYING = 0 
	<parent_node_name> = <Name> 
	RemoveParameter Name 
	IF CompositeObjectExists Name = editor_cam_target 
		editor_cam_target : Obj_KillSpawnedScript Name = _hideeditormodels 
		editor_cam_target : Die 
	ENDIF 
	IF CompositeObjectExists Name = editor_cam_parent 
		editor_cam_parent : Obj_KillSpawnedScript Name = _hideeditormodels 
		editor_cam_parent : Die 
	ENDIF 
	IF ObjectExists id = editor_cam 
		editor_cam : Obj_KillSpawnedScript Name = _CameraFollowObject 
	ENDIF 
	index = 0 
	BEGIN 
		RemoveParameter _node_name 
		FormatText ChecksumName = _node_name "%a_%b_a" a = <parent_node_name> b = <index> 
		IF CompositeObjectExists Name = <_node_name> 
			<_node_name> : GetSingleTag __TARGET_NAME 
			IF GotParam __TARGET_NAME 
				IF CompositeObjectExists Name = <__TARGET_NAME> 
					<__TARGET_NAME> : Obj_KillSpawnedScript Name = _FocusNode 
					<__TARGET_NAME> : Obj_KillSpawnedScript Name = _hideeditormodels 
					<__TARGET_NAME> : Die 
				ENDIF 
			ENDIF 
			<_node_name> : Obj_KillSpawnedScript Name = _hideeditormodels 
			<_node_name> : Die 
		ELSE 
			BREAK 
		ENDIF 
		<index> = ( <index> + 1 ) 
	REPEAT 
	IF CompositeObjectExists Name = <parent_node_name> 
		<parent_node_name> : Die 
	ENDIF 
	PlaySkaterCamAnim Stop 
	KillSkaterCamAnim All 
ENDSCRIPT

SCRIPT Editor_PlayCameraAnim 
	printf "Editor_PlayCameraAnim" 
	IF NOT ObjectExists id = <Name> 
		RETURN 
	ENDIF 
	IF GotParam fade 
		EditorCamera_DoFade instant wait time = 1.50000000000 
	ENDIF 
	IF NOT GotParam debug 
	ENDIF 
	<parent_node_name> = <Name> 
	RemoveParameter Name 
	IF NOT ObjectExists id = editor_cam_target 
		CreateCompositeObject { 
			Components = editor_cam_anim_helper_composite_structure 
			params = { 
				Name = editor_cam_target 
				model = ( MODEL_NODE_GREEN ) 
				x = 0.05000000075 y = 2.50000000000 z = 0.05000000075 
			} 
		} 
	ENDIF 
	IF NOT ObjectExists id = editor_cam_parent 
		CreateCompositeObject { 
			Components = editor_cam_anim_helper_composite_structure 
			params = { 
				Name = editor_cam_parent 
				model = ( MODEL_NODE_RED ) 
				x = 0.10000000149 y = 0.10000000149 z = 0.10000000149 
			} 
		} 
	ENDIF 
	<new_target_pos> = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
	<parent_node_name> : GetSingleTag __FIRST_NODE 
	IF GotParam __FIRST_NODE 
		<__FIRST_NODE> : Obj_GetPosition 
		<first_node_pos> = <Pos> 
		RemoveParameter Pos 
		editor_cam_parent : Obj_SetPosition position = <first_node_pos> 
		<__FIRST_NODE> : GetSingleTag __TARGET_NAME 
		IF GotParam __TARGET_NAME 
			IF ObjectExists id = <__TARGET_NAME> 
				__TARGET_NAME : Obj_GetPosition 
				<new_target_pos> = <Pos> 
				RemoveParameter Pos 
				editor_cam_target : Obj_SetPosition position = <new_target_pos> 
			ENDIF 
		ENDIF 
	ENDIF 
	PlaySkaterCamAnim Stop 
	KillSkaterCamAnim All 
	PlaySkaterCamAnim { 
		Skater = 0 
		targetid = editor_cam_target 
		Name = editor_cam 
		positionOffset = ( <first_node_pos> - <new_target_pos> ) 
		play_hold 
		fov = 70 
		virtual_cam 
	} 
	SetActiveCamera id = editor_cam 
	editor_cam : Obj_SpawnScript _CameraFollowObject params = { ObjectName = editor_cam_parent ParentName = <parent_node_name> <dynamic_fov> } 
	editor_cam_parent : Obj_SpawnScript _hideeditormodels params = { model = ( MODEL_NODE_RED ) } 
	editor_cam_target : Obj_SpawnScript _hideeditormodels params = { model = ( MODEL_NODE_GREEN ) } 
	Change __ANIM_IS_PLAYING = 1 
	<index> = 0 
	<parent_node_name> : SetTags __CURRENT_FRAME_INDEX = 0 
	BEGIN 
		<parent_node_name> : SetTags __CURRENT_FRAME_INDEX = <index> 
		RemoveParameter __SKIP_TO_FRAME 
		<parent_node_name> : GetSingleTag __SKIP_TO_FRAME 
		RemoveParameter __SKIP_FRAME_INDEX 
		<parent_node_name> : GetSingleTag __SKIP_FRAME_INDEX 
		IF NOT IsTrue __ANIM_IS_PLAYING 
			PlaySkaterCamAnim Stop 
			KillSkaterCamAnim All 
			BREAK 
		ENDIF 
		<__HOLDTIME> = 3 
		IF ( <__SKIP_TO_FRAME> = 1 ) 
			edmsg2 "__SKIP_TO_FRAME %i %a" i = <__SKIP_TO_FRAME> a = <__SKIP_FRAME_INDEX> 
			<index> = <__SKIP_FRAME_INDEX> 
			<parent_node_name> : SetTags __SKIP_TO_FRAME = 0 
			<parent_node_name> : SetTags __SKIP_FRAME_INDEX = 0 
		ENDIF 
		RemoveParameter _node_name 
		FormatText ChecksumName = _node_name "%a_%b_a" a = <parent_node_name> b = <index> 
		IF ObjectExists id = <_node_name> 
			IF ( <__SKIP_TO_FRAME> = 1 ) 
				<__HOLDTIME> = 0 
			ELSE 
				<_node_name> : GetSingleTag __HOLDTIME 
			ENDIF 
			RemoveParameter __TRIGGER_SCRIPT 
			<_node_name> : GetSingleTag __TRIGGER_SCRIPT 
			RemoveParameter __FLAG 
			<_node_name> : GetSingleTag __FLAG 
			RemoveParameter __FLAG_AFTER 
			<_node_name> : GetSingleTag __FLAG_AFTER 
			RemoveParameter __FRAME_NAME 
			<_node_name> : GetSingleTag __FRAME_NAME 
			IF GotParam __FRAME_NAME 
				FormatText TextName = panel_message_string "frame - %a" a = <__FRAME_NAME> 
				Create_Panel_Message text = <panel_message_string> id = __camera_message style = focustimelimit_style 
			ENDIF 
			IF GotParam __TRIGGER_SCRIPT 
				SpawnScript <__TRIGGER_SCRIPT> 
			ENDIF 
			IF NOT GotParam __FLAG_AFTER 
				IF GotParam __FLAG 
					SetFlag flag = <__FLAG> 
				ENDIF 
			ENDIF 
			<_node_name> : Obj_GetPosition 
			<node_pos> = <Pos> 
			RemoveParameter Pos 
			IF GotParam speed 
				IF ( <__HOLDTIME> > 0 ) 
					editor_cam_parent : Obj_GetDistanceToObject <_node_name> 
					IF ( <objectDistance> < 40.00000000000 ) 
						edmsg2 "\\c2node too close" 
						RemoveParameter __TARGET_NAME 
						<_node_name> : GetSingleTag __TARGET_NAME 
						IF GotParam __TARGET_NAME 
							editor_cam_target : Obj_GetDistanceToObject <__TARGET_NAME> 
							IF ( <objectDistance> < 30.00000000000 ) 
								<_node_name> : Obj_GetDistanceToObject <__TARGET_NAME> 
								edmsg2 "\\c3using target to node" a = <__TARGET_NAME> 
							ELSE 
								edmsg2 "\\c4using target" a = <__TARGET_NAME> 
							ENDIF 
						ENDIF 
					ENDIF 
					<__HOLDTIME_NEW> = ( <objectDistance> / 10.00000000000 ) 
					<__HOLDTIME_NEW> = ( <__HOLDTIME_NEW> / <speed> ) 
				ENDIF 
			ENDIF 
			IF GotParam speed 
				IF ( <__HOLDTIME> > 0 ) 
					editor_cam_parent : Obj_MoveToPos <node_pos> time = <__HOLDTIME_NEW> 
				ELSE 
					editor_cam_parent : Obj_MoveToPos <node_pos> time = <__HOLDTIME> 
				ENDIF 
			ELSE 
				editor_cam_parent : Obj_MoveToPos <node_pos> time = <__HOLDTIME> 
			ENDIF 
			<parent_node_name> : SetTags __CURRENT_NODE = <_node_name> 
			IF ( <index> = 0 ) 
				IF GotParam fade 
					EditorCamera_DoFade in time = 1.00000000000 
				ENDIF 
			ENDIF 
		ELSE 
			IF GotParam loop 
				<index> = 0 
				RemoveParameter _node_name 
				FormatText ChecksumName = _node_name "%a_%b_a" a = <parent_node_name> b = <index> 
				IF ObjectExists id = <_node_name> 
					<_node_name> : GetSingleTag __HOLDTIME 
					<_node_name> : Obj_GetPosition 
					<node_pos> = <Pos> 
					RemoveParameter Pos 
					IF GotParam speed 
						IF ( <__HOLDTIME> > 0 ) 
							editor_cam_parent : Obj_MoveToPos <node_pos> time = <__HOLDTIME_NEW> 
						ELSE 
							editor_cam_parent : Obj_MoveToPos <node_pos> time = <__HOLDTIME> 
						ENDIF 
					ELSE 
						editor_cam_parent : Obj_MoveToPos <node_pos> time = <__HOLDTIME> 
					ENDIF 
					<parent_node_name> : SetTags __CURRENT_NODE = <_node_name> 
				ELSE 
					BREAK 
				ENDIF 
			ELSE 
				BREAK 
			ENDIF 
		ENDIF 
		RemoveParameter __TARGET_NAME 
		<_node_name> : GetSingleTag __TARGET_NAME 
		IF GotParam __TARGET_NAME 
			IF ObjectExists id = <__TARGET_NAME> 
				<__TARGET_NAME> : Obj_GetPosition 
				<target_pos> = <Pos> 
				RemoveParameter Pos 
				IF GotParam speed 
					IF ( <__HOLDTIME> > 0 ) 
						editor_cam_target : Obj_MoveToPos <target_pos> time = <__HOLDTIME_NEW> 
						editor_cam_parent : Obj_LookAtObject Name = editor_cam_target time = <__HOLDTIME_NEW> 
						IF IsTrue _ShowFocusNodes 
							<__TARGET_NAME> : Obj_SpawnScript _FocusNode params = { waitfor holdtime = <__HOLDTIME_NEW> } 
						ENDIF 
						<__HOLDTIME> = <__HOLDTIME_NEW> 
					ELSE 
						editor_cam_target : Obj_MoveToPos <target_pos> time = <__HOLDTIME> 
						editor_cam_parent : Obj_LookAtObject Name = editor_cam_target time = <__HOLDTIME> 
						IF IsTrue _ShowFocusNodes 
							<__TARGET_NAME> : Obj_SpawnScript _FocusNode params = { holdtime = <__HOLDTIME> } 
						ENDIF 
					ENDIF 
				ELSE 
					editor_cam_target : Obj_MoveToPos <target_pos> time = <__HOLDTIME> 
					editor_cam_parent : Obj_LookAtObject Name = editor_cam_target time = <__HOLDTIME> 
					IF IsTrue _ShowFocusNodes 
						<__TARGET_NAME> : Obj_SpawnScript _FocusNode params = { holdtime = <__HOLDTIME> } 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
		IF GotParam speed 
			BEGIN 
				wait ( <__HOLDTIME> / 60 ) seconds 
				IF editor_cam_parent : Obj_IsMoving 
				ELSE 
					BREAK 
				ENDIF 
			REPEAT ( <__HOLDTIME> * 60 ) 
		ELSE 
			wait <__HOLDTIME> seconds 
		ENDIF 
		IF GotParam __FLAG_AFTER 
			IF GotParam __FLAG 
				SetFlag flag = <__FLAG> 
			ENDIF 
		ENDIF 
		<index> = ( <index> + 1 ) 
	REPEAT 
	IF NOT IsTrue __ANIM_IS_PLAYING 
		PlaySkaterCamAnim Stop 
		KillSkaterCamAnim All 
		restore_skater_camera 
		RETURN 
	ENDIF 
	IF GotParam fade 
		EditorCamera_DoFade out time = 0.50000000000 
		EditorCamera_DoFade time = 1.00000000000 wait 
	ENDIF 
	Change __ANIM_IS_PLAYING = 0 
	PlaySkaterCamAnim Stop 
	KillSkaterCamAnim All 
	restore_skater_camera 
	IF GotParam fade 
		EditorCamera_DoFade time = 1.00000000000 wait 
		EditorCamera_DoFade kill 
	ENDIF 
ENDSCRIPT

SCRIPT EditorCamera_DoFade 
	printf "EditorCamera_DoFade" 
	IF GotParam instant 
		FadeToBlack on time = 0.00000000000 alpha = 1.00000000000 
	ENDIF 
	IF GotParam kill 
		FadeToBlack off time = 0.00000000000 alpha = 0.00000000000 
	ENDIF 
	IF GotParam in 
		FadeToBlack off time = <time> alpha = 0.00000000000 
	ENDIF 
	IF GotParam out 
		FadeToBlack on time = <time> alpha = 1.00000000000 
	ENDIF 
	IF GotParam wait 
		wait <time> seconds 
	ENDIF 
ENDSCRIPT

SCRIPT _hideeditormodels 
ENDSCRIPT

SCRIPT _CameraFollowObject 
	printf "_CameraFollowObject" 
	BEGIN 
		IF NOT IsTrue __ANIM_IS_PLAYING 
			PlaySkaterCamAnim Stop 
			KillSkaterCamAnim All 
			BREAK 
		ENDIF 
		<ObjectName> : Obj_GetPosition 
		<new_cam_pos> = <Pos> 
		RemoveParameter Pos 
		editor_cam_target : Obj_GetPosition 
		<new_target_pos> = <Pos> 
		RemoveParameter Pos 
		IF NOT GotParam fov 
			<fov> = 70 
		ENDIF 
		IF GotParam dynamic_fov 
			<ObjectName> : Obj_GetDistanceToObject editor_cam_target 
			<objectDistance> = ( <objectDistance> * 12.00000000000 ) 
			IF ( <objectDistance> < 500.00000000000 ) 
				<fov> = ( 130.00000000000 - ( <objectDistance> / 10 ) ) 
			ENDIF 
		ENDIF 
		PlaySkaterCamAnim Stop 
		KillSkaterCamAnim All 
		PlaySkaterCamAnim { 
			Skater = 0 
			targetid = editor_cam_target 
			Name = editor_cam 
			positionOffset = ( <new_cam_pos> - <new_target_pos> ) 
			play_hold 
			fov = <fov> 
			virtual_cam 
		} 
		wait 1 frame 
	REPEAT 
ENDSCRIPT

SCRIPT _FocusNode 
	printf "_FocusNode" 
	IF IsTrue _ShowFocusNodes 
		Obj_InitModel model = ( MODEL_NODE_YELLOW ) 
		IF GotParam waitfor 
			BEGIN 
				wait ( <__HOLDTIME> / 60 ) seconds 
				IF editor_cam_parent : Obj_IsMoving 
				ELSE 
					BREAK 
				ENDIF 
			REPEAT ( <holdtime> * 60 ) 
		ELSE 
			wait <holdtime> seconds 
		ENDIF 
		Obj_InitModel model = ( MODEL_NODE_PINK ) 
	ENDIF 
ENDSCRIPT

SCRIPT Editor_LoadCameraAnimParams 
	printf "Editor_LoadCameraAnimParams" 
	edmsg2 "Editor_LoadCameraAnimParams (%a)" a = <Name> 
	FormatText ChecksumName = _name "%a" a = <Name> 
	CreateFromStructure { 
		Name = <_name> 
		Pos = ( <params> . __POS ) 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		Class = GameObject 
		CreatedAtStart 
		model = ( MODEL_CUBE ) 
	} 
	<_name> : SetTags __CURRENT_FRAME_INDEX = 0 
	<_name> : SetTags __SKIP_TO_FRAME = 0 
	<_name> : SetTags __SKIP_FRAME_INDEX = 0 
	ForEachIn ( <params> . nodes ) Do = MaybeCreateCameraNodes params = { parent = <_name> } 
ENDSCRIPT

SCRIPT MaybeCreateCameraNodes 
	printf "MaybeCreateCameraNodes" 
	<parent> : GetSingleTag __NUM_NODES 
	IF NOT GotParam __NUM_NODES 
		<parent> : SetTags __NUM_NODES = 0 
		<__NUM_NODES> = 0 
	ENDIF 
	IF GotParam __POS 
		RemoveParameter _node_name 
		FormatText ChecksumName = _node_name "%a_%b_a" a = <parent> b = <__NUM_NODES> 
		CreateFromStructure { 
			Name = <_node_name> 
			Pos = <__POS> 
			Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
			Class = GameObject 
			CreatedAtStart 
			model = ( MODEL_NODE_BLUE ) 
			x = 0.30000001192 
			y = 0.30000001192 
			z = 0.30000001192 
		} 
		<_node_name> : Obj_SpawnScript _hideeditormodels params = { model = ( MODEL_NODE_BLUE ) } 
		<_node_name> : SetTags __PARENT = <parent> 
		<parent> : SetTags __FIRST_NODE = <_node_name> 
	ENDIF 
	IF GotParam __CHECKPOINT 
		<_node_name> : SetTags __CHECKPOINT = 1 
	ENDIF 
	IF GotParam __FRAME_NAME 
		<_node_name> : SetTags __FRAME_NAME = <__FRAME_NAME> 
		<_node_name> : SetTags __CHECKPOINT = 1 
	ENDIF 
	IF GotParam __TARGET 
		RemoveParameter _target_name 
		FormatText ChecksumName = _target_name "%a_%b_b" a = <parent> b = <__NUM_NODES> 
		CreateFromStructure { 
			Name = <_target_name> 
			Pos = <__TARGET> 
			Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
			Class = GameObject 
			CreatedAtStart 
			model = ( MODEL_NODE_PINK ) 
			x = 0.20000000298 
			y = 0.20000000298 
			z = 0.20000000298 
		} 
		<_target_name> : Obj_SpawnScript _hideeditormodels params = { model = ( MODEL_NODE_PINK ) } 
		<_node_name> : SetTags __TARGET_NAME = <_target_name> 
		<_target_name> : SetTags __PARENT = <_node_name> 
	ENDIF 
	IF GotParam __HOLDTIME 
		<_node_name> : SetTags __HOLDTIME = <__HOLDTIME> 
		IF ObjectExists id = <_target_name> 
			<_target_name> : SetTags __HOLDTIME = <__HOLDTIME> 
		ENDIF 
	ENDIF 
	IF GotParam __FLAG 
		<_node_name> : SetTags __FLAG = <__FLAG> 
		IF GotParam __FLAG_AFTER 
			<_node_name> : SetTags __FLAG_AFTER = 1 
		ENDIF 
		IF ObjectExists id = <_target_name> 
			<_target_name> : SetTags __FLAG = <__FLAG> 
		ENDIF 
	ENDIF 
	IF GotParam fov 
		<_node_name> : SetTags __FOV = <fov> 
	ENDIF 
	IF GotParam __TRIGGER_SCRIPT 
		<_node_name> : SetTags __TRIGGER_SCRIPT = <__TRIGGER_SCRIPT> 
		<_node_name> : SetTags __TRIGGER_SCRIPT_TRIGGERD = 0 
	ENDIF 
	<parent> : SetTags __NUM_NODES = ( <__NUM_NODES> + 1 ) 
	<__NUM_NODES> = ( <__NUM_NODES> + 1 ) 
ENDSCRIPT

SCRIPT THUGPRO_CreateParticleNode 
	IF IsTrue THUGRPO_ParticlesEnabled 
		THUGPRO_ForceCreate Name = <nodename> 
	ENDIF 
ENDSCRIPT

SCRIPT THUGPRO_KillParticleNode 
	IF IsTrue THUGRPO_ParticlesEnabled 
		FormatText ChecksumName = _name "%a_fast_particle" a = <nodename> 
		DestroyFastParticleSystem Name = <_name> 
		THUGPRO_SafeKill Name = <nodename> 
	ENDIF 
ENDSCRIPT

SCRIPT GLOBAL_TP_Particle_SteamScript 
	THUGPRO_SpawnNodeParticles Type = steam 
ENDSCRIPT

THUGRPO_ParticlesEnabled = 1 
SCRIPT THUGPRO_SpawnNodeParticles 
	IF IsTrue THUGRPO_ParticlesEnabled 
		IF GotParam ParkEditor 
			Obj_GetId 
			nodename = <objID> 
			IF ChecksumEquals a = <objID> b = %0x0% 
				edmsg2 "\\c2ERROR: INVALID OBJID" 
				RETURN 
			ENDIF 
		ELSE 
			GetNodeName 
		ENDIF 
		FormatText ChecksumName = _name "%a_fast_particle" a = <nodename> 
		IF NOT GotParam ParkEditor 
			Obj_GetId 
			<objID> : Obj_GetPosition 
		ELSE 
			DestroyFastParticleSystem Name = <_name> 
		ENDIF 
		SWITCH <Type> 
			CASE steam 
				particle_params = apm_tp_steam01_fast_particle_params 
			CASE steam02 
				particle_params = apm_tp_steam02_fast_particle_params 
			CASE BigSteam 
				particle_params = apm_tp_BigSteam_fast_particle_params 
			CASE smoke 
				particle_params = apm_tp_smoke01_fast_particle_params 
			CASE smoke02 
				particle_params = apm_tp_smoke02_fast_particle_params 
			CASE bigsmoke 
				particle_params = apm_tp_bigsmoke_fast_particle_params 
			CASE sparks 
				particle_params = apm_tp_spark01_fast_particle_params 
			CASE sprinkler 
				particle_params = apm_tp_sprinkler01_fast_particle_params 
			CASE sprinkler02 
				particle_params = apm_tp_sprinkler02_fast_particle_params 
			CASE fire 
				particle_params = apm_tp_fire_fast_particle_params 
		ENDSWITCH 
		IF NOT GotParam ParkEditor 
			CreateFastParticleSystem Name = <_name> params_script = <particle_params> 
			<_name> : Obj_SetPosition position = <Pos> 
		ELSE 
			CreateFastParticleSystem Name = <_name> params_script = <particle_params> attachObjID = <objID> 
		ENDIF 
	ENDIF 
ENDSCRIPT

apm_tp_fire_fast_particle_params = { 
	Class = ParticleObject 
	Type = Default 
	BoxDimsStart = VECTOR(20.00000000000, 20.00000000000, 20.00000000000) 
	Pos = VECTOR(0.00000000000, 20.00000000000, 0.00000000000) 
	MidPosition = VECTOR(0.00000000000, 100.00000000000, 0.00000000000) 
	EndPosition = VECTOR(0.00000000000, 200.00000000000, 0.00000000000) 
	BoxDimsMid = VECTOR(20.00000000000, 20.00000000000, 20.00000000000) 
	BoxDimsEnd = VECTOR(20.00000000000, 20.00000000000, 20.00000000000) 
	texture = dt_flametest01 
	AbsentInNetGames 
	UseMidPoint 
	UseColorMidTime 
	Type = NEWFLAT 
	BlendMode = Add 
	FixedAlpha = 128 
	AlphaCutoff = 0 
	MaxStreams = 2 
	SuspendDistance = 10 
	lod_dist1 = 400 
	lod_dist2 = 401 
	EmitRate = 70.00000000000 
	Lifetime = 1.50000000000 
	MidPointPCT = 50 
	StartRadius = 20.00000000000 
	MidRadius = 12.00000000000 
	EndRadius = 9.00000000000 
	StartRadiusSpread = 5.00000000000 
	MidRadiusSpread = 5.00000000000 
	EndRadiusSpread = 5.00000000000 
	StartRGB = [ 139 , 112 , 80 ] 
	StartAlpha = 99 
	ColorMidTime = 50 
	MidRGB = [ 95 , 40 , 0 ] 
	MidAlpha = 128 
	EndRGB = [ 23 , 22 , 21 ] 
	EndAlpha = 0 
} 
apm_tp_steam01_fast_particle_params = { 
	Class = ParticleObject 
	Type = Default 
	LocalSpace 
	MidPosition = VECTOR(2.89800000191, 41.44599914551, -0.39300000668) 
	EndPosition = VECTOR(-32.06700134277, 163.89300537109, -2.72499990463) 
	BoxDimsStart = VECTOR(28.96347045898, 15.37523937225, 28.96347045898) 
	BoxDimsMid = VECTOR(59.50305175781, 37.19781875610, 59.50305175781) 
	BoxDimsEnd = VECTOR(181.99858093262, 105.53264617920, 181.99858093262) 
	Pos = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
	texture = apm_spray_01 
	CreatedAtStart 
	AbsentInNetGames 
	UseMidPoint 
	UseColorMidTime 
	Type = NEWFLAT 
	BlendMode = Blend 
	FixedAlpha = 128 
	AlphaCutoff = 0 
	MaxStreams = 1 
	SuspendDistance = 800 
	lod_dist1 = 400 
	lod_dist2 = 800 
	EmitRate = 4.00000000000 
	Lifetime = 5.00000000000 
	MidPointPCT = 50 
	StartRadius = 35.00000000000 
	MidRadius = 75.00000000000 
	EndRadius = 150.00000000000 
	StartRadiusSpread = 50.00000000000 
	MidRadiusSpread = 0.00000000000 
	EndRadiusSpread = 30.00000000000 
	StartRGB = [ 152 , 152 , 168 ] 
	StartAlpha = 7 
	ColorMidTime = 21 
	MidRGB = [ 105 , 110 , 121 ] 
	MidAlpha = 20 
	EndRGB = [ 51 , 53 , 58 ] 
	EndAlpha = 0 
} 
apm_tp_steam02_fast_particle_params = { 
	Class = ParticleObject 
	Type = Default 
	LocalSpace 
	MidPosition = VECTOR(2.89800000191, 41.44599914551, -0.39300000668) 
	EndPosition = VECTOR(-32.06700134277, 163.89300537109, -2.72499990463) 
	BoxDimsStart = VECTOR(28.96347045898, 15.37523937225, 28.96347045898) 
	BoxDimsMid = VECTOR(59.50305175781, 37.19781875610, 59.50305175781) 
	BoxDimsEnd = VECTOR(181.99858093262, 105.53264617920, 181.99858093262) 
	Pos = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
	texture = apm_spray_01 
	CreatedAtStart 
	AbsentInNetGames 
	UseMidPoint 
	UseColorMidTime 
	Type = NEWFLAT 
	BlendMode = Blend 
	FixedAlpha = 128 
	AlphaCutoff = 0 
	MaxStreams = 1 
	SuspendDistance = 800 
	lod_dist1 = 400 
	lod_dist2 = 800 
	EmitRate = 4.00000000000 
	Lifetime = 5.00000000000 
	MidPointPCT = 50 
	StartRadius = 35.00000000000 
	MidRadius = 75.00000000000 
	EndRadius = 150.00000000000 
	StartRadiusSpread = 50.00000000000 
	MidRadiusSpread = 0.00000000000 
	EndRadiusSpread = 30.00000000000 
	StartRGB = [ 255 , 255 , 50 ] 
	StartAlpha = 7 
	ColorMidTime = 21 
	MidRGB = [ 255 , 153 , 51 ] 
	MidAlpha = 20 
	EndRGB = [ 151 , 53 , 58 ] 
	EndAlpha = 0 
} 
apm_tp_BigSteam_fast_particle_params = { 
	Class = ParticleObject 
	Type = Default 
	LocalSpace 
	MidPosition = VECTOR(2.89800000191, 41.44599914551, -0.39300000668) 
	EndPosition = VECTOR(-32.06700134277, 163.89300537109, -2.72499990463) 
	BoxDimsStart = VECTOR(28.96347045898, 15.37523937225, 28.96347045898) 
	BoxDimsMid = VECTOR(59.50305175781, 37.19781875610, 59.50305175781) 
	BoxDimsEnd = VECTOR(181.99858093262, 105.53264617920, 181.99858093262) 
	Pos = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
	texture = apm_spray_01 
	CreatedAtStart 
	AbsentInNetGames 
	UseMidPoint 
	UseColorMidTime 
	Type = NEWFLAT 
	BlendMode = Blend 
	FixedAlpha = 128 
	AlphaCutoff = 0 
	MaxStreams = 1 
	SuspendDistance = 800 
	lod_dist1 = 400 
	lod_dist2 = 800 
	EmitRate = 4.00000000000 
	Lifetime = 5.00000000000 
	MidPointPCT = 50 
	StartRadius = 200.00000000000 
	MidRadius = 300.00000000000 
	EndRadius = 400.00000000000 
	StartRadiusSpread = 50.00000000000 
	MidRadiusSpread = 40.00000000000 
	EndRadiusSpread = 30.00000000000 
	StartRGB = [ 152 , 152 , 168 ] 
	StartAlpha = 7 
	ColorMidTime = 21 
	MidRGB = [ 105 , 110 , 121 ] 
	MidAlpha = 20 
	EndRGB = [ 51 , 53 , 58 ] 
	EndAlpha = 0 
} 
apm_tp_smoke01_fast_particle_params = { 
	Class = ParticleObject 
	Type = Default 
	LocalSpace 
	MidPosition = VECTOR(11.47900009155, 71.98699951172, 0.63899999857) 
	EndPosition = VECTOR(27.13699913025, 247.66900634766, 0.40700000525) 
	BoxDimsStart = VECTOR(25.41799926758, 25.41799926758, 25.41799926758) 
	BoxDimsMid = VECTOR(39.35069274902, 39.35069274902, 39.35069274902) 
	BoxDimsEnd = VECTOR(77.16815185547, 77.16815185547, 77.16815185547) 
	Pos = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
	texture = ru_tb_puff_01 
	CreatedAtStart 
	AbsentInNetGames 
	UseMidPoint 
	UseColorMidTime 
	Type = NEWFLAT 
	BlendMode = Blend 
	FixedAlpha = 128 
	AlphaCutoff = 1 
	MaxStreams = 2 
	SuspendDistance = 0 
	lod_dist1 = 400 
	lod_dist2 = 401 
	EmitRate = 6.00000000000 
	Lifetime = 20.00000000000 
	MidPointPCT = 50 
	StartRadius = 30.00000000000 
	MidRadius = 40.00000000000 
	EndRadius = 50.00000000000 
	StartRadiusSpread = 0.00000000000 
	MidRadiusSpread = 0.00000000000 
	EndRadiusSpread = 0.00000000000 
	StartRGB = [ 65 , 65 , 65 ] 
	StartAlpha = 0 
	ColorMidTime = 13 
	MidRGB = [ 65 , 65 , 65 ] 
	MidAlpha = 71 
	EndRGB = [ 55 , 55 , 55 ] 
	EndAlpha = 0 
} 
apm_tp_smoke02_fast_particle_params = { 
	Class = ParticleObject 
	Type = Default 
	LocalSpace 
	MidPosition = VECTOR(11.47900009155, 71.98699951172, 0.63899999857) 
	EndPosition = VECTOR(27.13699913025, 127.66899871826, 0.40700000525) 
	BoxDimsStart = VECTOR(25.41799926758, 25.41799926758, 25.41799926758) 
	BoxDimsMid = VECTOR(39.35069274902, 39.35069274902, 39.35069274902) 
	BoxDimsEnd = VECTOR(77.16815185547, 77.16815185547, 77.16815185547) 
	Pos = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
	texture = ru_tb_puff_01 
	CreatedAtStart 
	AbsentInNetGames 
	UseMidPoint 
	UseColorMidTime 
	Type = NEWFLAT 
	BlendMode = Blend 
	FixedAlpha = 128 
	AlphaCutoff = 1 
	MaxStreams = 2 
	SuspendDistance = 0 
	lod_dist1 = 400 
	lod_dist2 = 401 
	EmitRate = 4.00000000000 
	Lifetime = 10.00000000000 
	MidPointPCT = 30 
	StartRadius = 10.00000000000 
	MidRadius = 20.00000000000 
	EndRadius = 30.00000000000 
	StartRadiusSpread = 0.00000000000 
	MidRadiusSpread = 0.00000000000 
	EndRadiusSpread = 0.00000000000 
	StartRGB = [ 65 , 65 , 65 ] 
	StartAlpha = 0 
	ColorMidTime = 13 
	MidRGB = [ 65 , 65 , 65 ] 
	MidAlpha = 71 
	EndRGB = [ 55 , 55 , 55 ] 
	EndAlpha = 0 
} 
apm_tp_bigsmoke_fast_particle_params = { 
	Class = ParticleObject 
	Type = Default 
	LocalSpace 
	MidPosition = VECTOR(2.89800000191, 41.44599914551, -0.39300000668) 
	EndPosition = VECTOR(-32.06700134277, 163.89300537109, -2.72499990463) 
	BoxDimsStart = VECTOR(28.96347045898, 15.37523937225, 28.96347045898) 
	BoxDimsMid = VECTOR(59.50305175781, 37.19781875610, 59.50305175781) 
	BoxDimsEnd = VECTOR(181.99858093262, 105.53264617920, 181.99858093262) 
	Pos = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
	texture = apm_spray_01 
	CreatedAtStart 
	AbsentInNetGames 
	UseMidPoint 
	UseColorMidTime 
	Type = NEWFLAT 
	BlendMode = Blend 
	FixedAlpha = 128 
	AlphaCutoff = 0 
	MaxStreams = 1 
	SuspendDistance = 800 
	lod_dist1 = 400 
	lod_dist2 = 800 
	EmitRate = 8.00000000000 
	Lifetime = 5.00000000000 
	MidPointPCT = 50 
	StartRadius = 500.00000000000 
	MidRadius = 500.00000000000 
	EndRadius = 500.00000000000 
	StartRadiusSpread = 50.00000000000 
	MidRadiusSpread = 0.00000000000 
	EndRadiusSpread = 30.00000000000 
	StartRGB = [ 65 , 65 , 65 ] 
	StartAlpha = 90 
	ColorMidTime = 13 
	MidRGB = [ 65 , 65 , 65 ] 
	MidAlpha = 71 
	EndRGB = [ 55 , 55 , 55 ] 
	EndAlpha = 0 
} 
apm_tp_spark01_fast_particle_params = { 
	Class = ParticleObject 
	LocalSpace 
	MidPosition = VECTOR(11.56299972534, -0.49399998784, 2.81500005722) 
	EndPosition = VECTOR(17.27000045776, -6.71799993515, -5.31799983978) 
	BoxDimsStart = VECTOR(7.60034990311, 2.05353999138, 10.92683219910) 
	BoxDimsMid = VECTOR(34.32083511353, 34.32083511353, 34.32083511353) 
	BoxDimsEnd = VECTOR(30.04693031311, 30.04693031311, 30.04693031311) 
	Pos = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
	texture = apm_spark_01 
	CreatedAtStart 
	AbsentInNetGames 
	UseMidPoint 
	Type = NEWFLAT 
	BlendMode = Add 
	FixedAlpha = 128 
	AlphaCutoff = 1 
	MaxStreams = 2 
	SuspendDistance = 0 
	lod_dist1 = 400 
	lod_dist2 = 401 
	EmitRate = 12.00000000000 
	Lifetime = 0.25000000000 
	MidPointPCT = 50 
	StartRadius = 20.00000000000 
	MidRadius = 10.00000000000 
	EndRadius = 1.00000000000 
	StartRadiusSpread = 5.00000000000 
	MidRadiusSpread = 5.00000000000 
	EndRadiusSpread = 5.00000000000 
	StartRGB = [ 191 , 250 , 255 ] 
	StartAlpha = 95 
	EndRGB = [ 103 , 139 , 255 ] 
	EndAlpha = 0 
} 
apm_tp_sprinkler01_fast_particle_params = { 
	Class = ParticleObject 
	LocalSpace 
	BoxDimsStart = VECTOR(12.50808715820, 3.37956190109, 12.58458900452) 
	BoxDimsEnd = VECTOR(446.79043579102, 14.38129520416, 446.79043579102) 
	BoxDimsMid = VECTOR(320.51300048828, 26.00778388977, 320.51300048828) 
	MidPosition = VECTOR(2.57800006866, 101.66600036621, 4.19899988174) 
	EndPosition = VECTOR(0.58700001240, -37.69400024414, 2.19400000572) 
	Pos = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
	texture = water_spray 
	CreatedAtStart 
	AbsentInNetGames 
	UseMidPoint 
	Type = NEWFLAT 
	BlendMode = Add 
	FixedAlpha = 128 
	AlphaCutoff = 1 
	MaxStreams = 2 
	SuspendDistance = 0 
	lod_dist1 = 400 
	lod_dist2 = 401 
	EmitRate = 200.00000000000 
	Lifetime = 1.00000000000 
	MidPointPCT = 50 
	StartRadius = 3.00000000000 
	MidRadius = 5.00000000000 
	EndRadius = 7.00000000000 
	StartRadiusSpread = 2.00000000000 
	MidRadiusSpread = 5.00000000000 
	EndRadiusSpread = 5.00000000000 
	StartRGB = [ 191 , 247 , 255 ] 
	StartAlpha = 58 
	EndRGB = [ 103 , 139 , 255 ] 
	EndAlpha = 0 
} 
apm_tp_sprinkler02_fast_particle_params = { 
	Class = ParticleObject 
	LocalSpace 
	BoxDimsStart = VECTOR(12.50808715820, 3.37956190109, 12.58458900452) 
	BoxDimsEnd = VECTOR(446.79043579102, 14.38129520416, 446.79043579102) 
	BoxDimsMid = VECTOR(320.51300048828, 26.00778388977, 320.51300048828) 
	MidPosition = VECTOR(2.57800006866, 101.66600036621, 4.19899988174) 
	EndPosition = VECTOR(0.58700001240, -37.69400024414, 2.19400000572) 
	Pos = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
	texture = water_spray 
	CreatedAtStart 
	AbsentInNetGames 
	UseMidPoint 
	Type = NEWFLAT 
	BlendMode = Add 
	FixedAlpha = 128 
	AlphaCutoff = 1 
	MaxStreams = 2 
	SuspendDistance = 0 
	lod_dist1 = 400 
	lod_dist2 = 401 
	EmitRate = 200.00000000000 
	Lifetime = 1.00000000000 
	MidPointPCT = 50 
	StartRadius = 2.00000000000 
	MidRadius = 4.00000000000 
	EndRadius = 5.00000000000 
	StartRadiusSpread = 1.00000000000 
	MidRadiusSpread = 3.00000000000 
	EndRadiusSpread = 3.00000000000 
	StartRGB = [ 191 , 247 , 255 ] 
	StartAlpha = 58 
	EndRGB = [ 103 , 139 , 255 ] 
	EndAlpha = 0 
} 

