
SCRIPT car_add_components 
	IF GotParam skeletonName 
		CreateComponentFromStructure component = skeleton skeleton = <skeletonName> 
	ENDIF 
	CreateComponentFromStructure component = model <...> 
	IF GotParam skeletonName 
	ENDIF 
	IF NOT GotParam NoCollision 
		CreateComponentFromStructure component = collision collisionMode = geometry 
	ENDIF 
	CreateComponentFromStructure component = nodearray <...> 
	IF NOT GotParam NoRail 
		CreateComponentFromStructure component = railmanager <...> 
	ENDIF 
	IF NOT GotParam NoSkitch 
		CreateComponentFromStructure component = objecthookmanager <...> 
		CreateComponentFromStructure component = skitch <...> 
	ENDIF 
ENDSCRIPT

SCRIPT gameobj_add_components 
	IF GotParam skeletonName 
		CreateComponentFromStructure component = animblender <...> 
		CreateComponentFromStructure component = skeleton <...> skeleton = <skeletonName> 
	ENDIF 
	<is_level_obj> = 0 
	IF GotParam class 
		IF ChecksumEquals a = <class> b = LevelObject 
			<is_level_obj> = 1 
		ENDIF 
	ENDIF 
	IF ( <is_level_obj> = 1 ) 
		CreateComponentFromStructure component = model <...> 
	ELSE 
		IF GotParam model 
			IF NOT StringEquals a = <model> b = "none" 
				CreateComponentFromStructure component = model <...> 
			ENDIF 
		ENDIF 
	ENDIF 
	IF GotParam SupportStreams 
		IF ContainsComponent name = stream 
			script_assert "object already has a stream component" 
		ELSE 
			CreateComponentFromStructure component = stream 
		ENDIF 
	ENDIF 
	IF GotParam collisionMode 
		IF NOT ( collisionMode = none ) 
			CreateComponentFromStructure component = collision <...> 
		ENDIF 
	ENDIF 
	IF GotParam target 
		CreateComponentFromStructure component = projectileproximity 
	ENDIF 
ENDSCRIPT

SCRIPT CreateObjLabel 
	Obj_GetID 
	SpawnScript MaintainObjLabel params = { objID = <objID> } 
ENDSCRIPT

SCRIPT MaintainObjLabel 
	<Id> = ( <objID> + 5 ) 
	BEGIN 
		IF CompositeObjectExists name = <objID> 
			<objID> : Obj_GetPosition 
			FormatText TextName = text "%a" a = <objID> nowarning 
			IF ObjectExists Id = <Id> 
				SetScreenElementProps Id = <Id> text = <text> pos3D = ( <pos> + VECTOR(0.00000000000, 80.00000000000, 0.00000000000) ) rgba = [ 100 0 0 128 ] 
			ELSE 
				create_object_label Id = <Id> text = <text> pos3D = ( <pos> + VECTOR(0.00000000000, 80.00000000000, 0.00000000000) ) rgba = [ 100 0 0 128 ] 
			ENDIF 
		ELSE 
			IF ScreenElementExists Id = <Id> 
				DestroyScreenElement Id = <Id> 
			ENDIF 
			BREAK 
		ENDIF 
		wait 1 frame 
	REPEAT 
ENDSCRIPT

SCRIPT ped_add_components 
	IF IsNGC 
		MemPushContext VMHeapBottomUp 
	ENDIF 
	IF NOT GotParam NoPedLogic 
		CreateComponentFromStructure component = avoid 
		CreateComponentFromStructure component = pedlogic <...> 
		CreateComponentFromStructure component = fam <...> 
	ENDIF 
	IF GotParam IsSkaterPed 
		CreateComponentFromStructure component = SkaterLoopingSound <...> volume_mult = 0.20000000298 
		CreateComponentFromStructure component = SkaterSound <...> volume_mult = 0.20000000298 
	ENDIF 
	IF GotParam skeletonName 
		SWITCH <skeletonName> 
			CASE shark 
				skeletonName = anl_shark 
		ENDSWITCH 
	ENDIF 
	IF ( ( InNetGame ) | ( LevelIs load_sk5ed ) | ( LevelIs load_sk5ed_gameplay ) ) 
		IF ( <skeletonName> = anl_pigeon ) 
			CreateComponentFromStructure { 
				component = animblender 
				<...> 
				animName = animload_anl_pigeon 
			} 
			CreateComponentFromStructure component = skeleton <...> skeletonName = anl_pigeon 
		ELSE 
			GetAnimEventTableName animType = thps6_human 
			CreateComponentFromStructure { 
				component = animblender 
				<...> 
				animName = animload_thps6_human 
				animEventTableName = <animEventTableName> 
			} 
			CreateComponentFromStructure component = skeleton <...> skeletonName = thps6_human 
		ENDIF 
	ELSE 
		IF GotParam animName 
			IF NOT GotParam animEventTableName 
				GetAnimEventTableName animType = <Type> 
			ENDIF 
			IF NOT GotParam defaultAnimName 
				IF ChecksumEquals a = <skeletonName> b = thps6_human 
					<defaultAnimName> = WStandIdle1 
				ENDIF 
				IF NOT ( have_loaded_net ) 
					IF ChecksumEquals a = <skeletonName> b = Ped_Female 
						<defaultAnimName> = Ped_F_Idle1 
					ENDIF 
				ENDIF 
			ENDIF 
			CreateComponentFromStructure component = animblender animEventTableName = <animEventTableName> <...> 
		ENDIF 
		IF GotParam skeletonName 
			PushMemProfile "Pedestrian Skeletons" 
			CreateComponentFromStructure component = skeleton <...> skeleton = <skeletonName> 
			PopMemProfile 
		ENDIF 
	ENDIF 
	IF IsNGC 
		MemPopContext 
	ENDIF 
	CreateComponentFromStructure component = model <...> 
	IF GotParam DoLightCollision 
		CreateComponentFromStructure component = modellightupdate <...> 
	ENDIF 
	IF NOT GotParam dont_target 
		CreateComponentFromStructure component = projectileproximity 
	ENDIF 
	IF NOT GotParam ShadowOff 
		CreateComponentFromStructure component = shadow <...> ShadowType = simple 
	ENDIF 
ENDSCRIPT

SCRIPT ped_init_model 
	IF InNetGame 
		IF GotParam skeletonName 
			SWITCH <skeletonName> 
				CASE shark 
					skeletonName = anl_shark 
			ENDSWITCH 
		ENDIF 
		IF ( <skeletonName> = anl_pigeon ) 
			IF NOT GotParam model 
				script_assert "no model specified" 
			ENDIF 
			Obj_InitModel model = <model> use_asset_manager = 1 
		ELSE 
			Obj_InitModel model = "Peds/Ped_Judge/Ped_Judge.skin" use_asset_manager = 1 
		ENDIF 
		RETURN 
	ENDIF 
	IF ( ( LevelIs load_sk5ed ) | ( LevelIs load_sk5ed_gameplay ) ) 
		ChooseRandomCreatedGoalPedModel 
		RETURN 
	ENDIF 
	IF GotParam profile 
		Obj_InitModelFromProfile struct = <profile> use_asset_manager = 1 buildscript = create_ped_model_from_appearance 
	ELSE 
		IF NOT GotParam model 
			script_assert "no model name!" 
		ENDIF 
		Obj_InitModel model = <model> <...> use_asset_manager = 1 
	ENDIF 
	Obj_GetID 
	RunScriptOnObject Id = <objID> set_ped_anim_handlers 
ENDSCRIPT

SCRIPT ped_disable_bones 
	Obj_SetBoneActive bone = Cloth_Shirt_L active = 0 
	Obj_SetBoneActive bone = Cloth_Shirt_C active = 0 
	Obj_SetBoneActive bone = Cloth_Shirt_R active = 0 
ENDSCRIPT

SCRIPT ped_enable_bones 
	Obj_SetBoneActive bone = Cloth_Shirt_L active = 1 
	Obj_SetBoneActive bone = Cloth_Shirt_C active = 1 
	Obj_SetBoneActive bone = Cloth_Shirt_R active = 1 
ENDSCRIPT


