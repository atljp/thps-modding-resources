
SCRIPT thugpro_init_dynamic_level_changes 
	GetLevelStructureName 
	FormatText ChecksumName = NodeArray "%i_NodeArray" i = ( <level_structure_name> . level ) 
	FormatText ChecksumName = LevelArray "%i_LevelChanges" i = ( <level_structure_name> . level ) 
	IF GlobalExists name = <LevelArray> type = array 
		ForEachIn <LevelArray> Do = thugpro_levelchanges_handle_objects params = { <...> } 
	ENDIF 
ENDSCRIPT

SCRIPT THUGProPreloadModels 
	GetLevelStructureName 
	FormatText ChecksumName = LevelArray "%i_LevelChanges" i = ( <level_structure_name> . level ) 
	IF GlobalExists name = <LevelArray> type = array 
		PushMemProfile "PreLoadModels" 
		ForEachIn <LevelArray> Do = thugpro_maybe_preloadmodel params = { <...> } 
		PopMemProfile 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_maybe_preloadmodel 
	IF GotParam model 
		PreloadModel name = <model> 
	ENDIF 
	IF GotParam LoadAsset 
		LoadAsset <tex> 
		FormatText ChecksumName = tex_checksum "%a" a = <tex> 
		LoadAsset <mdl> nocollision = 1 parent = <tex_checksum> 
	ENDIF 
ENDSCRIPT

skateshop_LevelChanges = [ 
	{ 
		moveto 
		node = ts_soda01 
		pos = VECTOR(20.00000000000, 0.00000000000, 0.00000000000) relative 
	} 
	{ 
		moveto 
		node = ts_soda02 
		pos = VECTOR(20.00000000000, 0.00000000000, 0.00000000000) relative 
	} 
	{ 
		model = "leveleditor\\exported\\tp_geo_Arcade_THPS.mdl" 
		pos = VECTOR(-3240.89111328125, 20.00000000000, 492.61199951172) angle = 180.00000000000 scale = 0.83999997377 static 
	} 
	{ 
		model = "leveleditor\\exported\\tp_geo_Arcade_THPS.mdl" 
		pos = VECTOR(-3240.89111328125, 20.00000000000, 492.61199951172) angle = 180.00000000000 x_scale = -0.83999997377 z_scale = 0.83999997377 y_scale = -0.83999997377 static 
	} 
	{ 
		kill 
		node = banner_1 
	} 
	{ 
		kill 
		node = banner_shadow01 
	} 
	{ 
		kill 
		node = banner_shadow 
	} 
	{ 
		moveto 
		node = banner_2 
		pos = VECTOR(0.00000000000, 0.00000000000, 150.00000000000) relative 
	} 
	{ 
		model = "levels\\dynamic\\tpBanner_Long.mdl" 
		_type = banner special 
		name = __thugpro_banner 
		pos = VECTOR(-3273.10400390625, 148.59700012207, 620.31500244141) angle = 90.00000000000 static y_scale = 0.40000000596 x_scale = 0.51999998093 replace_texture 
	} 
	{ 
		model = "levels\\dynamic\\tpBanner_Square.mdl" 
		_type = billboard special 
		name = thugpro_squarebanner 
		pos = VECTOR(-3182.42089843750, 48.33100128174, 774.18402099609) angle = 90.00000000000 static scale = 0.20000000298 replace_texture 
	} 
	{ 
		create 
		nodes = [ 
			TRG_PedController 
			TRG_prop_pumpkin_1 
			TRG_prop_pumpkin_2 
			TRG_prop_pumpkin_3 
			TRG_prop_pumpkin_small 
			TRG_prop_pumpkin_huge 
			TRG_prop_pumpkin_counter_1 
			TRG_prop_pumpkin_counter_2 
			TRG_prop_pumpkin_bench 
			TRG_prop_candle_cluster_big 
			TRG_prop_candle_cluster_big_2 
			TRG_G_SkPro_HellPortalDoor01 
		] 
		date 
		day_from = ( global_day_from ) 
		day_to = ( global_day_to ) 
		month_from = ( global_month_from ) 
		month_to = ( global_month_to ) 
	} 
	{ 
		kill 
		nodes = [ shirt_stand_03 glasses_shelf sunglasses_5 ] 
		date 
		day_from = ( global_day_from ) 
		day_to = ( global_day_to ) 
		month_from = ( global_month_from ) 
		month_to = ( global_month_to ) 
	} 
] 
ca_LevelChanges = [ 
	{ 
		replace_script 
		node = TRG_Conc_Park_Rail891 
		TriggerScript = TRG_Conc_Park_Rail891Script_thugpro 
	} 
] 
SCRIPT TRG_Conc_Park_Rail891Script_thugpro 
	IF ObjectExists id = TRG_PeeingKid01 
		CA_Peeing_Lip 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_handleAdditionalNodeData 
	IF ChecksumEquals a = <class> b = ParticleObject 
		IF GotParam BoxRGBAs 
			<_StartRGB> = [ 128 , 128 , 128 ] 
			<_StartAlpha> = 128 
			GetColorFromRGBA rgba = ( <BoxRGBAs> [ 0 ] ) 
			IF GotParam r 
				SetArrayElement arrayname = _StartRGB index = 0 newvalue = <r> 
			ENDIF 
			IF GotParam g 
				SetArrayElement arrayname = _StartRGB index = 1 newvalue = <g> 
			ENDIF 
			IF GotParam b 
				SetArrayElement arrayname = _StartRGB index = 2 newvalue = <b> 
			ENDIF 
			IF GotParam a 
				_StartAlpha = <a> 
			ENDIF 
			<_MidRGB> = [ 128 , 128 , 128 ] 
			<_MidAlpha> = 128 
			GetColorFromRGBA rgba = ( <BoxRGBAs> [ 1 ] ) 
			IF GotParam r 
				SetArrayElement arrayname = _MidRGB index = 0 newvalue = <r> 
			ENDIF 
			IF GotParam g 
				SetArrayElement arrayname = _MidRGB index = 1 newvalue = <g> 
			ENDIF 
			IF GotParam b 
				SetArrayElement arrayname = _MidRGB index = 2 newvalue = <b> 
			ENDIF 
			IF GotParam a 
				_MidAlpha = <a> 
			ENDIF 
			<_EndRGB> = [ 128 , 128 , 128 ] 
			<_EndAlpha> = 128 
			GetColorFromRGBA rgba = ( <BoxRGBAs> [ 2 ] ) 
			IF GotParam r 
				SetArrayElement arrayname = _EndRGB index = 0 newvalue = <r> 
			ENDIF 
			IF GotParam g 
				SetArrayElement arrayname = _EndRGB index = 1 newvalue = <g> 
			ENDIF 
			IF GotParam b 
				SetArrayElement arrayname = _EndRGB index = 2 newvalue = <b> 
			ENDIF 
			IF GotParam a 
				_EndAlpha = <a> 
			ENDIF 
			AppendNodeParams node = <name> params = { StartRGB = <_StartRGB> StartAlpha = <_StartAlpha> MidRGB = <_MidRGB> MidAlpha = <_MidAlpha> EndRGB = <_EndRGB> EndAlpha = <_EndAlpha> 
			} 
			__RefreshParticles = 1 
			RemoveParameter BoxRGBAs 
			RemoveParameter r 
			RemoveParameter g 
			RemoveParameter b 
			RemoveParameter a 
		ENDIF 
		IF GotParam BoxDims 
			_BoxDimsStart = ( <BoxDims> [ 0 ] ) 
			_BoxDimsMid = ( <BoxDims> [ 1 ] ) 
			_BoxDimsEnd = ( <BoxDims> [ 2 ] ) 
			AppendNodeParams node = <name> params = { BoxDimsStart = <_BoxDimsStart> BoxDimsMid = <_BoxDimsMid> BoxDimsEnd = <_BoxDimsEnd> 
			} 
			__RefreshParticles = 1 
			RemoveParameter BoxDims 
		ENDIF 
		IF GotParam BoxPositions 
			_StartPosition = ( <BoxPositions> [ 0 ] ) 
			_MidPosition = ( <BoxPositions> [ 1 ] ) 
			_EndPosition = ( <BoxPositions> [ 2 ] ) 
			AppendNodeParams node = <name> params = { StartPosition = <_StartPosition> MidPosition = <_MidPosition> EndPosition = <_EndPosition> 
			} 
			__RefreshParticles = 1 
			RemoveParameter BoxPositions 
		ENDIF 
		IF GotParam __RefreshParticles 
			IF IsAlive name = <name> 
				THUGPRO_SafeKill name = <name> 
				THUGPRO_ForceCreate name = <name> 
			ENDIF 
		ENDIF 
	ENDIF 
	IF GotParam CreatedFromVariable 
		IF IsTrue <CreatedFromVariable> 
			IF NOT GotParam CreatedAtStart 
				AppendNodeParams node = <name> params = { CreatedAtStart } 
			ENDIF 
			IF NOT GotParam CreatedFromTOD 
				THUGPRO_ForceCreate name = <name> 
			ENDIF 
		ENDIF 
	ENDIF 
	IF GotParam class 
		IF ChecksumEquals a = <class> b = levelgeometry 
			IF GotParam UVWibble 
				IF NOT GotParam UVWibble_UVel 
					UVWibble_UVel = 0.00000000000 
				ENDIF 
				IF NOT GotParam UVWibble_VVel 
					UVWibble_VVel = 0.00000000000 
				ENDIF 
				IF NOT GotParam UVWibble_Freq 
					UVWibble_Freq = 0.00000000000 
				ENDIF 
				IF NOT GotParam UVWibble_UAmp 
					UVWibble_UAmp = 0.00000000000 
				ENDIF 
				IF NOT GotParam UVWibble_VAmp 
					UVWibble_VAmp = 0.00000000000 
				ENDIF 
				IF NOT GotParam UVWibble_Phase 
					UVWibble_Phase = 0.00000000000 
				ENDIF 
				EnableExplicitUVWibble { 
					sector = <name> 
				} 
				SetUVWibbleParams { 
					sector = <name> 
					u_vel = <UVWibble_UVel> 
					v_vel = <UVWibble_VVel> 
					u_amp = <UVWibble_UAmp> 
					v_amp = <UVWibble_VAmp> 
					u_freq = <UVWibble_Freq> 
					v_freq = <UVWibble_Freq> 
					u_phase = <UVWibble_Phase> 
					v_phase = <UVWibble_Phase> 
				} 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_UVWibble 
	EnableExplicitUVWibble { 
		sector = <node> 
	} 
	SetUVWibbleParams { 
		sector = <node> 
		u_vel = <UVWibble_UVel> 
		v_vel = <UVWibble_VVel> 
		u_amp = <UVWibble_UAmp> 
		v_amp = <UVWibble_VAmp> 
		u_freq = <UVWibble_Freq> 
		v_freq = <UVWibble_Freq> 
		u_phase = <UVWibble_Phase> 
		v_phase = <UVWibble_Phase> 
	} 
ENDSCRIPT

SCRIPT thugpro_MoveNode 
	<node> : Obj_GetType 
	SWITCH <ObjType> 
		CASE OBJECT_TYPE_PED 
			<node> : Obj_SetPosition position = <pos> 
		CASE OBJECT_TYPE_CAR 
			<node> : Obj_SetPosition position = <pos> 
		CASE OBJECT_TYPE_GAME_OBJ 
			<node> : Obj_SetPosition position = <pos> 
		CASE OBJECT_TYPE_UNDEFINED 
			MoveNode name = <node> position = <pos> 
	ENDSWITCH 
ENDSCRIPT

SCRIPT thugpro_MoveNodeTo 
	IF GotParam relative 
		<new_pos> = <pos> 
	ELSE 
		<new_pos> = ( ( <pos> ) - ( <spos> ) ) 
	ENDIF 
	IF NOT GotParam clone 
		THUGPRO_SafeKill name = <node> 
	ENDIF 
	CreateFromStructure { 
		pos = <new_pos> 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		name = <node> 
		class = LevelObject 
		CreatedAtStart 
		CollisionMode = Geometry 
	} 
ENDSCRIPT

SCRIPT thugpro_levelchanges_remove_trigger 
	IF GotParam node 
		IF NodeExists <node> 
			AppendNodeParams node = <node> params = { TriggerScript = nullscript } 
			IF IsAlive name = <node> 
				kill name = <node> 
			ENDIF 
			create name = <node> 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_levelchanges_replace_trigger 
	IF GotParam node 
		IF NodeExists <node> 
			AppendNodeParams node = <node> params = { TriggerScript = <TriggerScript> } 
			IF IsAlive name = <node> 
				kill name = <node> 
			ENDIF 
			create name = <node> 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_levelchanges_replace_params 
	IF GotParam node 
		IF NodeExists <node> 
			<tempNode> = <node> 
			RemoveParameter replace_test 
			RemoveParameter node 
			AppendNodeParams node = <tempNode> params = { <...> } 
			IF IsAlive name = <tempNode> 
				kill name = <tempNode> 
			ENDIF 
			create name = <tempNode> 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_levelchanges_add_static_model 
	IF GotParam replace_texture 
		RETURN 
	ENDIF 
	IF NOT GotParam scale 
		<scale> = 1.00000000000 
	ENDIF 
	IF NOT GotParam x_scale 
		<x_scale> = <scale> 
	ENDIF 
	IF NOT GotParam y_scale 
		<y_scale> = <scale> 
	ENDIF 
	IF NOT GotParam z_scale 
		<z_scale> = <scale> 
	ENDIF 
	IF NOT GotParam CollisionMode 
		CollisionMode = None 
	ENDIF 
	GetUniqueCompositeObjectID preferredID = <name> 
	IF GotParam TriggerScript 
		CreateFromStructure { 
			pos = <pos> 
			Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
			name = <UniqueID> 
			class = GameObject 
			CreatedAtStart 
			CollisionMode = <CollisionMode> 
			model = <model> 
			x = <x_scale> 
			y = <y_scale> 
			z = <z_scale> 
			z = <z_scale> 
			TriggerScript = <TriggerScript> 
		} 
	ELSE 
		CreateFromStructure { 
			pos = <pos> 
			Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
			name = <UniqueID> 
			class = GameObject 
			CreatedAtStart 
			CollisionMode = <CollisionMode> 
			model = <model> 
			x = <x_scale> 
			y = <y_scale> 
			z = <z_scale> 
		} 
	ENDIF 
	IF GotParam angle 
		<UniqueID> : Obj_SetOrientation y = <angle> 
	ENDIF 
	IF GotParam dir 
		<UniqueID> : Obj_SetOrientation dir = <dir> 
	ENDIF 
	IF GotParam replace_texture 
		<UniqueID> : thugpro_replace_textures <...> id = <UniqueID> 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_levelchanges_create_soundemitter 
	IF NOT GotParam SoundName 
		IF NOT GotParam StreamName 
			RETURN 
		ENDIF 
	ENDIF 
	GetUniqueCompositeObjectID preferredID = <name> 
	IF NOT GotParam Vol 
		Vol = 100 
	ENDIF 
	IF NOT GotParam Pitch 
		Pitch = 100 
	ENDIF 
	IF NOT GotParam DropOff 
		DropOff = 100 
	ENDIF 
	CreateFromStructure { 
		pos = <pos> 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		name = <UniqueID> 
		class = GameObject 
		CreatedAtStart 
		model = "none" 
		TriggerScript = THUGPRO_Emitter_PlaySound 
		NeverSuspend 
		SuspendDistance = 0 
	} 
	IF GotParam StreamName 
		<UniqueID> : SetTags _StreamName = <StreamName> 
	ELSE 
		<UniqueID> : SetTags _SoundName = <SoundName> 
	ENDIF 
	<UniqueID> : SetTags _Vol = <Vol> 
	<UniqueID> : SetTags _Pitch = <Pitch> 
	<UniqueID> : SetTags _DropOff = <DropOff> 
ENDSCRIPT

SCRIPT THUGPRO_Emitter_PlaySound 
	GetSingleTag _StreamName 
	GetSingleTag _SoundName 
	GetSingleTag _Vol 
	GetSingleTag _Pitch 
	GetSingleTag _DropOff 
	IF GotParam _SoundName 
		Obj_PlaySound { 
			<_SoundName> 
			Vol = <_Vol> 
			Pitch = <_Pitch> 
			DropOff = <_DropOff> 
		} 
	ELSE 
		Obj_PlayStream { 
			<_StreamName> 
			Vol = <_Vol> 
			Pitch = <_Pitch> 
			DropOff = <_DropOff> 
			dropoff_function = inv_exponential 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_levelchanges_create_proximobject 
	CreateFromStructure { 
		pos = <pos> 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		name = <name> 
		class = GameObject 
		CreatedAtStart 
		model = "none" 
		TriggerScript = thugpro_proximobjectScript 
	} 
	<name> : SetTags proxim_TriggerScript = <TriggerScript> 
	<name> : SetTags proxim_radius = <radius> 
ENDSCRIPT

SCRIPT thugpro_proximobjectScript proxim_radius = 10 
	Obj_GetID 
	<objID> : GetSingleTag proxim_radius 
	<objID> : Obj_ClearExceptions 
	<objID> : Obj_SetInnerRadius <proxim_radius> 
	<objID> : Obj_SetOuterRadius <proxim_radius> 
	<objID> : ClearEventHandler AnyObjectInRadius 
	<objID> : ClearEventHandler ObjectOutofRadius 
	<objID> : GetSingleTag proxim_TriggerScript 
	SetEventHandler ex = AnyObjectInRadius scr = <proxim_TriggerScript> params = { } 
ENDSCRIPT

SCRIPT thugpro_levelchanges_add_ammopickup ammo_type = beerbottle ammo_text = "" name = TRG_TP_Ammo_Node 
	CreateFromStructure { 
		pos = <pos> 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		name = <name> 
		class = GameObject 
		CreatedAtStart 
		model = "none" 
		TriggerScript = thugpro_setup_ammobox 
	} 
	<name> : SetTags pickup_ammo_type = <ammo_type> 
	<name> : SetTags pickup_ammo_text = <ammo_text> 
ENDSCRIPT

SCRIPT thugpro_setup_ammobox 
	Obj_GetID 
	<objID> : GetSingleTag pickup_ammo_type 
	<objID> : Obj_ClearExceptions 
	<inner_radius> = 7 
	<outer_radius> = 15 
	<accept_text> = "Press \\m5 to pick up Ammo" 
	<activation_script> = thugpro_get_ammo 
	<activation_script_params> = { type = <pickup_ammo_type> num = 5 } 
	<objID> : Obj_SetInnerRadius <inner_radius> 
	ClearEventHandler AnyObjectInRadius 
	ClearEventHandler ObjectOutofRadius 
	SetEventHandler ex = AnyObjectInRadius scr = ped_speech_got_trigger params = { ammo_pickup <...> ped_id = <objID> activation_script_params = <...> } 
ENDSCRIPT

SCRIPT thugpro_setup_ammobox_beerbottle 
	thugpro_setup_ammobox type = beerbottle 
ENDSCRIPT

SCRIPT thugpro_setup_ammobox_apple 
	thugpro_setup_ammobox type = apple 
ENDSCRIPT

SCRIPT thugpro_setup_ammobox_Tomato 
	thugpro_setup_ammobox type = tomato 
ENDSCRIPT

SCRIPT thugpro_setup_ammobox_PaintCan 
	thugpro_setup_ammobox type = PaintCan 
ENDSCRIPT

SCRIPT thugpro_get_ammo 
	Skater : give_skater_ammo type = <type> num = <num> 
	IF ObjectExists id = ped_speech_dialog 
		DestroyScreenElement id = ped_speech_dialog 
	ENDIF 
	UnPauseSkaters 
ENDSCRIPT

SCRIPT thugpro_levelchanges_destroy_object 
	IF GotParam node 
		IF NodeExists <node> 
			IF IsAlive name = <node> 
				kill name = <node> 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_levelchanges_handle_objects 
	IF InNetGame 
		IF GotParam FLAG 
			IF NOT GetGlobalFlag FLAG = <FLAG> 
				RETURN 
			ENDIF 
		ENDIF 
	ENDIF 
	IF GotParam net_only 
		IF NOT InNetGame 
			RETURN 
		ENDIF 
	ENDIF 
	IF GotParam freeskate_only 
		IF InNetGame 
			RETURN 
		ENDIF 
	ENDIF 
	IF GotParam date 
		IF NOT GotParam day_to 
			day_to = <day_from> 
		ENDIF 
		IF NOT GotParam month_to 
			month_to = <month_from> 
		ENDIF 
		IF NOT DateEquals month_from = <month_from> month_to = <month_to> day_from = <day_from> day_to = <day_to> 
			RETURN 
		ENDIF 
	ENDIF 
	IF GotParam not_in_ctf_or_koth 
		IF InNetGame 
			GetGameMode 
			IF ( ( <gamemode> = netking ) | ( <gamemode> = netctf ) ) 
				RETURN 
			ENDIF 
		ENDIF 
	ENDIF 
	IF GotParam ProximObject 
		PushMemProfile "Game Objects" 
		thugpro_levelchanges_create_proximobject <...> 
		PopMemProfile 
		RETURN 
	ENDIF 
	IF GotParam ProximNodeObject 
		PushMemProfile "Game Objects" 
		ForEachIn <node_objects> Do = MaybeCreateProximRootNode params = { goal_id = dummy_goal goal_text = "test" } 
		PopMemProfile 
		RETURN 
	ENDIF 
	IF GotParam InitModelFromProfile 
		IF GotParam node 
			IF ObjectExists id = <node> 
				<node> : Obj_InitModelFromProfile { 
					struct = <profile> 
					use_asset_manager = 1 
					texDictOffset = 0 
				} 
			ENDIF 
		ENDIF 
		RETURN 
	ENDIF 
	IF GotParam SoundEmitter 
		thugpro_levelchanges_create_soundemitter <...> 
		RETURN 
	ENDIF 
	IF GotParam RunScript 
		<script> 
		RETURN 
	ENDIF 
	IF GotParam remove_script 
		thugpro_levelchanges_remove_trigger <...> 
		RETURN 
	ENDIF 
	IF GotParam replace_script 
		thugpro_levelchanges_replace_trigger <...> 
		RETURN 
	ENDIF 
	IF GotParam replace_test 
		thugpro_levelchanges_replace_params <...> 
		RETURN 
	ENDIF 
	IF GotParam ammo_pickup 
		PushMemProfile "Game Objects" 
		thugpro_levelchanges_add_ammopickup <...> 
		PopMemProfile 
		RETURN 
	ENDIF 
	IF GotParam static 
		thugpro_levelchanges_add_static_model <...> 
		RETURN 
	ENDIF 
	IF GotParam create_prefix_netonly 
		IF InNetGame 
			GetArraySize <nodes> 
			i = 0 
			BEGIN 
				create prefix = ( <nodes> [ <i> ] ) 
				<i> = ( <i> + 1 ) 
			REPEAT <array_size> 
			RETURN 
		ENDIF 
	ENDIF 
	IF GotParam create 
		IF GotParam nodes 
			GetArraySize <nodes> 
			i = 0 
			BEGIN 
				create name = ( ( <nodes> ) [ <i> ] ) 
				<i> = ( <i> + 1 ) 
			REPEAT <array_size> 
		ELSE 
			create name = ( <node> ) 
		ENDIF 
		RETURN 
	ENDIF 
	IF GotParam kill 
		IF GotParam nodes 
			GetArraySize <nodes> 
			i = 0 
			BEGIN 
				IF IsAlive name = ( <nodes> [ <i> ] ) 
					kill name = ( <nodes> [ <i> ] ) 
				ENDIF 
				<i> = ( <i> + 1 ) 
			REPEAT <array_size> 
		ELSE 
			thugpro_levelchanges_destroy_object <...> 
		ENDIF 
		RETURN 
	ENDIF 
	IF GotParam moveto 
		PushMemProfile "LevelObjects" 
		thugpro_MoveNodeTo <...> 
		PopMemProfile 
		RETURN 
	ENDIF 
	IF GotParam MoveNode 
		thugpro_MoveNode <...> 
		RETURN 
	ENDIF 
	IF GotParam UVWibble 
		thugpro_UVWibble <...> 
		RETURN 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_levelchanges_replace_objects 
	GetArraySize <nodes> 
	i = 0 
	BEGIN 
		Invisible name = ( <nodes> [ <i> ] ) 
		<i> = ( <i> + 1 ) 
	REPEAT <array_size> 
	GetUniqueCompositeObjectID preferredID = ( <nodes> [ 0 ] ) 
	IF NOT GotParam pos 
		GetIndexOfItemContaining { 
			array = <NodeArray> 
			index = 0 
			name = name 
			value = ( <nodes> [ 0 ] ) 
		} 
		<pos> = ( ( <NodeArray> ) [ <index> ] . pos ) 
	ENDIF 
	CreateFromStructure { 
		pos = <pos> 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		name = <UniqueID> 
		class = GameObject 
		CreatedAtStart 
		CollisionMode = None 
		model = <model> 
	} 
	IF GotParam angle 
		<UniqueID> : Obj_SetOrientation y = <angle> 
	ENDIF 
	<UniqueID> : thugpro_replace_textures <...> 
ENDSCRIPT

SCRIPT thugpro_levelchanges_replace_object 
	Invisible name = <node> 
	GetUniqueCompositeObjectID preferredID = <node> 
	IF NOT GotParam pos 
		GetIndexOfItemContaining { 
			array = <NodeArray> 
			index = 0 
			name = name 
			value = ( <node> ) 
		} 
		<pos> = ( ( <NodeArray> ) [ <index> ] . pos ) 
	ENDIF 
	CreateFromStructure { 
		pos = <pos> 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		name = <UniqueID> 
		class = GameObject 
		CreatedAtStart 
		CollisionMode = None 
		model = <model> 
	} 
	IF GotParam angle 
		<UniqueID> : Obj_SetOrientation y = <angle> 
	ENDIF 
	<UniqueID> : thugpro_replace_textures <...> 
ENDSCRIPT

SCRIPT thugpro_get_random_textures 
ENDSCRIPT

SCRIPT thugpro_replace_textures 
ENDSCRIPT

global_day_from = 1 
global_day_to = 31 
global_month_from = 10 
global_month_to = 10 
__NJ_pumpkin_collected = 0 
__alc_pumpkin_collected = 0 
__ware_pumpkin_collected = 0 
__sf2_pumpkin_collected = 0 
__kyoto_pumpkin_collected = 0 
__au_pumpkin_collected = 0 
__bo_pumpkin_collected = 0 
SCRIPT pumpkin_swap_model 
	Obj_InitModel model = "props\\prop_pumpkin_smashed.mdl" 
ENDSCRIPT

SCRIPT pumpkin_smash_test 
	Obj_GetID 
	IF THUGPRO_GetCollectedAllObjects is_halloween 
		<objID> : pumpkin_swap_model 
		RETURN 
	ENDIF 
	SWITCH <objID> 
		CASE __nj_pumpkin 
			IF IsTrue __NJ_pumpkin_collected 
				<objID> : pumpkin_swap_model 
				RETURN 
			ENDIF 
		CASE __alc_pumpkin 
			IF IsTrue __alc_pumpkin_collected 
				<objID> : pumpkin_swap_model 
				RETURN 
			ENDIF 
		CASE __ware_pumpkin 
			IF IsTrue __ware_pumpkin_collected 
				<objID> : pumpkin_swap_model 
				RETURN 
			ENDIF 
		CASE __sf2_pumpkin 
			IF IsTrue __sf2_pumpkin_collected 
				<objID> : pumpkin_swap_model 
				RETURN 
			ENDIF 
		CASE __kyoto_pumpkin 
			IF IsTrue __kyoto_pumpkin_collected 
				<objID> : pumpkin_swap_model 
				RETURN 
			ENDIF 
		CASE __au_pumpkin 
			IF IsTrue __au_pumpkin_collected 
				<objID> : pumpkin_swap_model 
				RETURN 
			ENDIF 
		CASE __bo_pumpkin 
			IF IsTrue __bo_pumpkin_collected 
				<objID> : pumpkin_swap_model 
				RETURN 
			ENDIF 
	ENDSWITCH 
	<objID> : Obj_ClearExceptions 
	<objID> : Obj_SetInnerRadius 4 
	<objID> : Obj_SetOuterRadius 4 
	<objID> : ClearEventHandler AnyObjectInRadius 
	<objID> : ClearEventHandler ObjectOutofRadius 
	SetEventHandler ex = AnyObjectInRadius scr = _SmashPumpkin params = { id = <objID> } 
ENDSCRIPT

SCRIPT _SmashPumpkin 
	IF NOT <colObjId> : IsLocalSkater 
		RETURN 
	ENDIF 
	Obj_GetID 
	<objID> : Obj_ClearExceptions 
	<objID> : ClearEventHandler AnyObjectInRadius 
	<objID> : ClearEventHandler ObjectOutofRadius 
	<objID> : Obj_PlaySound SmashCake 
	<objID> : pumpkin_swap_model 
	create_panel_message id = pumpkin_smash_message style = perfect_style rgba = [ 128 80 0 128 ] text = RANDOM(1, 1, 1, 1) RANDOMCASE "WE MAKE THE GOOD STUFF!" RANDOMCASE "TRICK OR TREAT!" RANDOMCASE "NICE COSTUME!" RANDOMCASE "HAPPY HALLOWEEN!" RANDOMEND 
	SWITCH <objID> 
		CASE __nj_pumpkin 
			Change __NJ_pumpkin_collected = 1 
		CASE __alc_pumpkin 
			Change __alc_pumpkin_collected = 1 
		CASE __ware_pumpkin 
			Change __ware_pumpkin_collected = 1 
		CASE __sf2_pumpkin 
			Change __sf2_pumpkin_collected = 1 
		CASE __kyoto_pumpkin 
			Change __kyoto_pumpkin_collected = 1 
		CASE __au_pumpkin 
			Change __au_pumpkin_collected = 1 
		CASE __bo_pumpkin 
			Change __bo_pumpkin_collected = 1 
	ENDSWITCH 
	_pumpkinSmashCheckState 
ENDSCRIPT

SCRIPT _pumpkinSmashCheckState 
	count = 0 
	IF IsTrue __NJ_pumpkin_collected 
		<count> = ( <count> + 1 ) 
	ENDIF 
	IF IsTrue __alc_pumpkin_collected 
		<count> = ( <count> + 1 ) 
	ENDIF 
	IF IsTrue __ware_pumpkin_collected 
		<count> = ( <count> + 1 ) 
	ENDIF 
	IF IsTrue __sf2_pumpkin_collected 
		<count> = ( <count> + 1 ) 
	ENDIF 
	IF IsTrue __kyoto_pumpkin_collected 
		<count> = ( <count> + 1 ) 
	ENDIF 
	IF IsTrue __au_pumpkin_collected 
		<count> = ( <count> + 1 ) 
	ENDIF 
	IF IsTrue __bo_pumpkin_collected 
		<count> = ( <count> + 1 ) 
	ENDIF 
	IF ( <count> = 7 ) 
		create_panel_message id = pumpkin_smash_message style = perfect_style rgba = [ 0 128 0 128 ] text = "You Unlocked: Pumpkin Head!" 
		THUGPRO_SetCollectedAllObjects is_halloween 
	ENDIF 
ENDSCRIPT

apm_flames01_particle_params = { 
	emitScript = emit_apm_flames01_particle 
	emitterIndependent = 1 
	max = 40 
	type = Shaded 
	Texture = apm_flameQUAD_01 
	blendMode = Add 
	UseRandomUVQuadrants 
} 
SCRIPT emit_apm_flames01_particle 
	setEmitRange width = 0.50000000000 height = 0.50000000000 
	setCircularEmit circular = 1 
	setLife min = 0.20000000298 max = 0.75000000000 
	setAngleSpread spread = 0.12222199887 
	setSpeedRange min = 1.00000000000 max = 1.29999995232 
	setEmitTarget x = 0.00000000000 y = 1.00000000000 z = 0.00000000000 
	setForce x = 0.00000000000 y = 0.03599999845 z = 0.00000000000 
	setParticleSize sw = 11.19999980927 ew = 1.82000005245 
	setColor sr = 255 sg = 94 sb = 50 sa = 187 mr = 240 mg = 98 mb = 48 ma = 255 er = 154 eg = 47 eb = 31 ea = 0 midTime = 0.50000000000 
	emitRate rate = 120.00000000000 
ENDSCRIPT

SCRIPT Barrelfire_01Script 
	CreateflexibleParticleSystem name = TrashFire01 params_script = apm_flames01_particle_params 
ENDSCRIPT


