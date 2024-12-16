SCRIPT edmsg2 
ENDSCRIPT

SCRIPT EDITOR_ADD_TEST_VEHICLE_NODE 
	edmsg2 "EDITOR_ADD_TEST_VEHICLE_NODE" 
	_structure_params = ( EDITOR_PIECES [ EDITOR_PEICE_INDEX ] ) 
	IF NOT GotParam pos 
		LevelEditor_Cursor : Obj_GetPosition 
		_pos = <pos> 
	ELSE 
		_pos = <pos> 
	ENDIF 
	IF NOT GotParam dir 
		RemoveParameter x 
		RemoveParameter y 
		RemoveParameter z 
		LevelEditor_Cursor : Obj_GetOrientation 
		_dir = ( VECTOR(1.00000000000, 0.00000000000, 0.00000000000) * <x> + VECTOR(0.00000000000, 1.00000000000, 0.00000000000) * <y> + VECTOR(0.00000000000, 0.00000000000, 1.00000000000) * <z> ) 
	ELSE 
		_dir = <dir> 
	ENDIF 
	IF StructureContains structure = ( <_structure_params> ) _name 
		_name = ( <_structure_params> . _name ) 
	ELSE 
		RETURN 
	ENDIF 
	IF NOT ObjectExists id = <_name> 
		IF StructureContains structure = ( <_structure_params> ) model 
			model = ( <_structure_params> . model ) 
		ELSE 
			model = "gameobjects\\skate\\letter_e\\letter_e.mdl" 
		ENDIF 
		CreateFromStructure { 
			name = <_name> 
			pos = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
			Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
			Class = Vehicle 
			skeletonName = car 
			CollisionMode = none 
			CreatedAtStart 
			model = <model> 
		} 
		<_name> : Obj_SetOrientation dir = <_dir> 
		change ED_RAIL_TOTAL_NODES = 0 
		change ED_RAIL_INDEX = 0 
		change ED_RAILCLUSTER_INDEX = 0 
		change ED_RAIL_INDEX_ZERO = 1 
	ELSE 
		<_name> : Obj_SetPosition Position = <_pos> 
		<_name> : Obj_SetOrientation dir = <_dir> 
		RETURN 
	ENDIF 
ENDSCRIPT

_GEN_RESTART_INDEX = 0 
_GEN_CROW_INDEX = 0 
_GEN_GEN_INDEX = 0 
SCRIPT EDITOR_ADD_MULTIPLAYER_NODE 
	edmsg2 "EDITOR_ADD_MULTIPLAYER_NODE" 
	IF GotParam extra_object 
		edmsg2 "extra_object" 
		_structure_params = ( EDITOR_PIECES [ EDITOR_PEICE_INDEX ] . extra_object ) 
	ELSE 
		_structure_params = ( EDITOR_PIECES [ EDITOR_PEICE_INDEX ] ) 
	ENDIF 
	IF NOT GotParam pos 
		LevelEditor_Cursor : Obj_GetPosition 
		_pos = <pos> 
	ELSE 
		_pos = <pos> 
	ENDIF 
	IF NOT GotParam dir 
		RemoveParameter x 
		RemoveParameter y 
		RemoveParameter z 
		LevelEditor_Cursor : Obj_GetOrientation 
		_dir = ( VECTOR(1.00000000000, 0.00000000000, 0.00000000000) * <x> + VECTOR(0.00000000000, 1.00000000000, 0.00000000000) * <y> + VECTOR(0.00000000000, 0.00000000000, 1.00000000000) * <z> ) 
	ELSE 
		_dir = <dir> 
	ENDIF 
	IF StructureContains structure = ( <_structure_params> ) node_type 
		node_type = ( <_structure_params> . node_type ) 
	ENDIF 
	edmsg2 "node_type = %a" a = <node_type> 
	SWITCH <node_type> 
		CASE restart 
			MAYBE_ADD_RESTART_NODE _structure_params = <_structure_params> <...> 
		CASE pickup 
			MAYBE_ADD_PICKUP_NODE _structure_params = <_structure_params> <...> 
		CASE output_node_data 
			MAYBE_OUTPUT_NODE_DATA <...> 
		CASE dump_trigger_scripts 
			edmsg2 "test" 
		DEFAULT 
	ENDSWITCH 
	IF StructureContains structure = ( <_structure_params> ) extra_object 
		EDITOR_ADD_MULTIPLAYER_NODE extra_object 
	ENDIF 
ENDSCRIPT

SCRIPT MAYBE_ADD_PICKUP_NODE 
	IF StructureContains structure = ( <_structure_params> ) _name 
		_name = ( <_structure_params> . _name ) 
	ELSE 
		IF StructureContains structure = ( <_structure_params> ) crown 
			FormatText ChecksumName = _name "ED_Crown_%a" a = ( _GEN_CROW_INDEX ) 
			FormatText TextName = _nodeName "TRG_Crown_%a" a = ( _GEN_CROW_INDEX ) 
			change _GEN_CROW_INDEX = ( ( _GEN_CROW_INDEX ) + 1 ) 
		ELSE 
			FormatText ChecksumName = _name "ED_GameObject_%a" a = ( _GEN_GEN_INDEX ) 
			FormatText TextName = _nodeName "TRG_GameObject_%a" a = ( _GEN_GEN_INDEX ) 
			change _GEN_GEN_INDEX = ( ( _GEN_GEN_INDEX ) + 1 ) 
		ENDIF 
	ENDIF 
	IF NOT ObjectExists id = <_name> 
		IF StructureContains structure = ( <_structure_params> ) model 
			model = ( <_structure_params> . model ) 
		ELSE 
			model = "gameobjects\\skate\\letter_e\\letter_e.mdl" 
		ENDIF 
		CreateFromStructure { 
			name = <_name> 
			pos = <_pos> 
			Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
			Class = GameObject 
			CreatedAtStart 
			model = <model> 
		} 
		<_name> : Obj_SetOrientation dir = <_dir> 
	ELSE 
		<_name> : Obj_SetPosition Position = <_pos> 
		<_name> : Obj_SetOrientation dir = <_dir> 
		RETURN 
	ENDIF 
	IF NOT StructureContains structure = ( <_structure_params> ) no_model 
		IF GotParam model 
			edmsg2 "\\c6has model" 
			<_name> : SetTags _nodeModel = <model> 
		ENDIF 
	ENDIF 
	IF StructureContains structure = ( <_structure_params> ) tags 
		edmsg2 "has tags" 
		<tags> = ( <_structure_params> . tags ) 
		IF StructureContains structure = <tags> _nodeName 
			_nodeName = ( <tags> . _nodeName ) 
		ENDIF 
		IF StructureContains structure = <tags> _nodeClass 
			<_name> : SetTags _nodeClass = ( <tags> . _nodeClass ) 
		ENDIF 
		IF StructureContains structure = <tags> _nodeType 
			<_name> : SetTags _nodeType = ( <tags> . _nodeType ) 
		ENDIF 
		IF StructureContains structure = <tags> _nodeTriggerScript 
			<_name> : SetTags _nodeTriggerScript = ( <tags> . _nodeTriggerScript ) 
		ENDIF 
		IF StructureContains structure = <tags> _CreatedAtStart 
			<_name> : SetTags _CreatedAtStart = ( <tags> . _CreatedAtStart ) 
		ENDIF 
		IF StructureContains structure = <tags> _SuspendDistance 
			<_name> : SetTags _SuspendDistance = ( <tags> . _SuspendDistance ) 
		ENDIF 
		IF StructureContains structure = <tags> _lod_dist1 
			<_name> : SetTags _lod_dist1 = ( <tags> . _lod_dist1 ) 
		ENDIF 
		IF StructureContains structure = <tags> _lod_dist2 
			<_name> : SetTags _lod_dist2 = ( <tags> . _lod_dist2 ) 
		ENDIF 
	ENDIF 
	<_name> : SetTags _nodeName = <_nodeName> 
ENDSCRIPT

SCRIPT MAYBE_ADD_RESTART_NODE 
	edmsg2 "MAYBE_ADD_RESTART_NODE" 
	IF StructureContains structure = ( <_structure_params> ) _name 
		edmsg2 "has _name" 
		_name = ( <_structure_params> . _name ) 
	ELSE 
		FormatText ChecksumName = _name "ED_Restart%a" a = ( _GEN_RESTART_INDEX ) 
		change _GEN_RESTART_INDEX = ( _GEN_RESTART_INDEX + 1 ) 
		edmsg2 "generate _name \'%a\'" a = <_name> 
	ENDIF 
	IF NOT ObjectExists id = <_name> 
		IF StructureContains structure = ( <_structure_params> ) model 
			model = ( <_structure_params> . model ) 
		ELSE 
			model = "gameobjects\\skate\\letter_e\\letter_e.mdl" 
		ENDIF 
		CreateFromStructure { 
			name = <_name> 
			pos = <_pos> 
			Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
			Class = GameObject 
			CreatedAtStart 
			model = <model> 
		} 
		<_name> : Obj_SetOrientation dir = <_dir> 
	ELSE 
		<_name> : Obj_SetPosition Position = <_pos> 
		<_name> : Obj_SetOrientation dir = <_dir> 
		RETURN 
	ENDIF 
	IF StructureContains structure = ( <_structure_params> ) tags 
		edmsg2 "has tags" 
		<tags> = ( <_structure_params> . tags ) 
		IF StructureContains structure = <tags> _nodeName 
			<_name> : SetTags _nodeName = ( <tags> . _nodeName ) 
		ENDIF 
		IF StructureContains structure = <tags> _nodeClass 
			<_name> : SetTags _nodeClass = ( <tags> . _nodeClass ) 
		ENDIF 
		IF StructureContains structure = <tags> _nodeType 
			<_name> : SetTags _nodeType = ( <tags> . _nodeType ) 
		ENDIF 
		IF StructureContains structure = <tags> _nodeRestartName 
			<_name> : SetTags _nodeRestartName = ( <tags> . _nodeRestartName ) 
		ENDIF 
		IF StructureContains structure = <tags> _nodeRestart_Types 
			<_name> : SetTags _nodeRestart_Types = ( <tags> . _nodeRestart_Types ) 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT ForEachObject 
	GetArraySize <objects> 
	index = -1 
	BEGIN 
		IF GetNextArrayElement <objects> index = <index> 
			IF ObjectExists id = <element> 
				<element> : Obj_SpawnScript ( <Do> ) 
				wait 2 gameframe 
				edmsg2 "\\c4found %a" a = <element> 
			ELSE 
				edmsg2 "cant find object %a" a = <element> 
			ENDIF 
		ENDIF 
	REPEAT <array_size> 
ENDSCRIPT

SCRIPT FindEachObject 
	index = 0 
	BEGIN 
		FormatText ChecksumName = _name <prefix> i = <index> 
		IF ObjectExists id = <_name> 
			<_name> : Obj_SpawnScript ( <Do> ) 
			wait 2 gameframe 
		ELSE 
			edmsg2 "cant find object %a" a = <_name> 
		ENDIF 
		<index> = ( <index> + 1 ) 
	REPEAT 32 
ENDSCRIPT

SCRIPT MAYBE_OUTPUT_NODE_DATA 
	edmsg2 "MAYBE_OUTPUT_NODE_DATA" 
	_PICKUP_NODES = [ ED_Flag_Red ED_Flag_Green ED_Flag_Blue ED_Flag_Yellow ED_CTF_Red ED_CTF_Green ED_CTF_Blue ED_CTF_Yellow ED_CTF_Red_Base ED_CTF_Green_Base ED_CTF_Blue_Base ED_CTF_Yellow_Base ] 
	_RESTART_NODES = [ ED_Flag_Restart ED_CTF_Restart_Red ED_CTF_Restart_Green ED_CTF_Restart_Blue ED_CTF_Restart_Yellow ] 
	Output "[" 
	Output "// ..." 
	ForEachObject objects = <_RESTART_NODES> Do = DUMP_DEFAULT_NODE_DATA params = { } 
	wait 6 gameframe 
	ForEachObject objects = <_PICKUP_NODES> Do = DUMP_DEFAULT_NODE_DATA params = { } 
	wait 6 gameframe 
	FindEachObject prefix = "ED_Crown_%i" Do = DUMP_DEFAULT_NODE_DATA params = { } 
	wait 6 gameframe 
	FindEachObject prefix = "ED_GameObject_%i" Do = DUMP_DEFAULT_NODE_DATA params = { } 
	wait 6 gameframe 
	Output "]" 
	ForEachObject objects = <_RESTART_NODES> Do = DUMP_DEFAULT_TRIGGER_DATA params = { } 
	wait 6 gameframe 
	ForEachObject objects = <_PICKUP_NODES> Do = DUMP_DEFAULT_TRIGGER_DATA params = { } 
	wait 6 gameframe 
ENDSCRIPT

SCRIPT DUMP_DEFAULT_NODE_DATA 
	Obj_GetId 
	wait 2 gameframe 
	<objID> : GetSingleTag _nodeName 
	<objID> : GetSingleTag _nodeClass 
	<objID> : GetSingleTag _nodeRestartName 
	<objID> : GetSingleTag _nodeType 
	<objID> : GetSingleTag _nodeRestart_Types 
	<objID> : GetSingleTag _nodeTriggerScript 
	<objID> : GetSingleTag _nodeModel 
	<objID> : GetSingleTag _lod_dist1 
	<objID> : GetSingleTag _lod_dist2 
	<objID> : GetSingleTag _CreatedAtStart 
	<objID> : Obj_GetPosition 
	_pos = <pos> 
	RemoveParameter x 
	RemoveParameter y 
	RemoveParameter z 
	<objID> : Obj_GetOrientation 
	_dir = ( VECTOR(1.00000000000, 0.00000000000, 0.00000000000) * <x> + VECTOR(0.00000000000, 1.00000000000, 0.00000000000) * <y> + VECTOR(0.00000000000, 0.00000000000, 1.00000000000) * <z> ) 
	Output "\t{" 
	Output "\t\tPos = %p" p = <_pos> 
	Output "\t\tAngles = (0.0, %y, 0.0)" y = <x> 
	IF GotParam _nodeName 
		edmsg2 "\\c3nodename=%a" a = <_nodeName> 
		Output "\t\tName = %a" a = <_nodeName> 
	ENDIF 
	IF GotParam _nodeClass 
		Output "\t\tClass = %a" a = <_nodeClass> 
	ENDIF 
	IF GotParam _nodeType 
		Output "\t\tType = %a" a = <_nodeType> 
	ENDIF 
	IF GotParam _nodeModel 
		Output "\t\t// Model = %s" a = <_nodeModel> 
	ENDIF 
	IF GotParam _nodeRestartName 
		Output "\t\t// RestartName = %a" a = <_nodeRestartName> 
	ENDIF 
	IF GotParam _nodeRestart_Types 
		Output "\t\tRestart_Types = [" 
		GetArraySize <_nodeRestart_Types> 
		index = -1 
		BEGIN 
			IF GetNextArrayElement <_nodeRestart_Types> index = <index> 
				Output "\t\t\t%a" a = <element> 
			ENDIF 
		REPEAT <array_size> 
		Output "\t\t]" 
	ENDIF 
	IF GotParam _CreatedAtStart 
		Output "\t\tCreatedAtStart" 
	ENDIF 
	IF GotParam _SuspendDistance 
		Output "\t\tSuspendDistance = %a" a = <_SuspendDistance> 
	ENDIF 
	IF GotParam _lod_dist1 
		Output "\t\tlod_dist1 = %a" a = <_lod_dist1> 
	ENDIF 
	IF GotParam _lod_dist2 
		Output "\t\tlod_dist2 = %a" a = <_lod_dist2> 
	ENDIF 
	IF GotParam _nodeTriggerScript 
		Output "\t\tTriggerScript = %a" a = <_nodeTriggerScript> 
	ENDIF 
	Output "\t}" 
ENDSCRIPT

SCRIPT DUMP_DEFAULT_TRIGGER_DATA 
	Obj_GetId 
	<objID> : GetSingleTag _nodeTriggerScript 
	IF GotParam _nodeTriggerScript 
		SWITCH <_nodeTriggerScript> 
			CASE TRG_Flag_RedScript 
				Output "script TRG_Flag_RedScript" 
				Output "\tTeam_Flag red" 
				Output "endscript" 
			CASE TRG_Flag_GreenScript 
				Output "script TRG_Flag_GreenScript" 
				Output "\tTeam_Flag green" 
				Output "endscript" 
			CASE TRG_Flag_BlueScript 
				Output "script TRG_Flag_BlueScript" 
				Output "\tTeam_Flag blue" 
				Output "endscript" 
			CASE TRG_Flag_YellowScript 
				Output "script TRG_Flag_YellowScript" 
				Output "\tTeam_Flag yellow" 
				Output "endscript" 
			CASE TRG_CTF_RedScript 
				Output "script TRG_CTF_RedScript" 
				Output "\tTeam_Flag red" 
				Output "endscript" 
			CASE TRG_CTF_GreenScript 
				Output "script TRG_CTF_GreenScript" 
				Output "\tTeam_Flag green" 
				Output "endscript" 
			CASE TRG_CTF_BlueScript 
				Output "script TRG_CTF_BlueScript" 
				Output "\tTeam_Flag blue" 
				Output "endscript" 
			CASE TRG_CTF_YellowScript 
				Output "script TRG_CTF_YellowScript" 
				Output "\tTeam_Flag yellow" 
				Output "endscript" 
			DEFAULT 
				Output "script %aScript" a = <_nodeName> 
				Output "endscript" 
		ENDSWITCH 
	ENDIF 
ENDSCRIPT


