
SCRIPT Dismember Bone = Bone_head MaxVel = 200 MaxRotVel = 4 
	Obj_GetId 
	BodyChunkName = ( <Bone> + <ObjId> ) 
	IF CompositeObjectExists name = <BodyChunkName> 
		<BodyChunkName> : Die 
	ENDIF 
	Obj_GetPosition 
	Obj_GetBonePosition Bone = <Bone> 
	ModelOffset = ( <Pos> - <X> * VECTOR(1.00000000000, 0.00000000000, 0.00000000000) - <Y> * VECTOR(0.00000000000, 1.00000000000, 0.00000000000) - <Z> * VECTOR(0.00000000000, 0.00000000000, 1.00000000000) ) 
	Obj_GetQuat 
	CreateCompositeObject Components = BodyChunkComponents Params = { 
		name = <BodyChunkName> 
		Pos = <Pos> 
		Orientation = <Quat> 
		CloneFrom = <ObjId> 
		CopySkeletonFrom = <ObjId> 
		model_offset = <ModelOffset> 
	} 
	Vel = ( <MaxVel> * PAIR(-1.10000002384, 1.10000002384) * VECTOR(1.00000000000, 0.00000000000, 0.00000000000) 
	+ <MaxVel> * PAIR(0.00000000000, 1.10000002384) * VECTOR(0.00000000000, 1.00000000000, 0.00000000000) 
	+ <MaxVel> * PAIR(-1.10000002384, 1.10000002384) * VECTOR(0.00000000000, 0.00000000000, 1.00000000000) 
	) 
	RotVel = ( <MaxRotVel> * PAIR(-1.10000002384, 1.10000002384) * VECTOR(1.00000000000, 0.00000000000, 0.00000000000) 
	+ <MaxRotVel> * PAIR(-1.10000002384, 1.10000002384) * VECTOR(0.00000000000, 1.00000000000, 0.00000000000) 
	+ <MaxRotVel> * PAIR(-1.10000002384, 1.10000002384) * VECTOR(0.00000000000, 0.00000000000, 1.00000000000) 
	) 
	<BodyChunkName> : RigidBody_Kick Vel = <Vel> RotVel = <RotVel> 
	<BodyChunkName> : Obj_SetBoneScale Bone = <Bone> scale = 0.00000000000 propagate_reverse force_update 
	Obj_SetBoneScale Bone = <Bone> scale = 0.00000000000 propagate 
	<BodyChunkName> : Obj_UpdateModel 
ENDSCRIPT

BodyChunkComponents = [ 
	{ 
		Component = Suspend 
	} 
	{ 
		Component = WaitAndDie 
		Lifetime = 3 
	} 
	{ 
		Component = RigidBody 
		Box 
		Dimensions = VECTOR(20.00000000000, 20.00000000000, 20.00000000000) 
	} 
	{ 
		Component = Skeleton 
	} 
	{ 
		Component = Model 
	} 
] 
SCRIPT make_skater_explode 
	GetCurrentSkaterProfileIndex 
	GetSkaterNumber 
	stored_scales = [ 
		{ group = torso_bone_group X = 100 Y = 100 Z = 100 } 
	] 
	GetArraySize <stored_scales> 
	index = 0 
	BEGIN 
		scalingmenu_get_xyz part = ( <stored_scales> [ <index> ] . group ) 
		SetArrayElement ArrayName = stored_scales index = <index> newvalue = { group = ( <stored_scales> [ <index> ] . group ) X = <X> Y = <Y> Z = <Z> } 
		index = ( <index> + 1 ) 
	REPEAT <array_size> 
	Dismember Bone = Bone_Collar_L 
	Dismember Bone = Bone_Collar_R 
	Dismember Bone = Bone_chest 
	Dismember Bone = Cloth_breast 
ENDSCRIPT

SCRIPT make_skater_lose_head 
	Dismember Bone = Bone_head 
ENDSCRIPT

SCRIPT make_skater_lol 
	GetCurrentSkaterProfileIndex 
	GetSkaterNumber 
	stored_scales = [ 
		{ group = head_bone_group X = 100 Y = 100 Z = 100 } 
		{ group = headtop_bone_group X = 100 Y = 100 Z = 100 } 
		{ group = Nose_bone_group X = 100 Y = 100 Z = 100 } 
		{ group = Jaw_bone_group X = 100 Y = 100 Z = 100 } 
	] 
	GetArraySize <stored_scales> 
	index = 0 
	BEGIN 
		scalingmenu_get_xyz part = ( <stored_scales> [ <index> ] . group ) 
		SetArrayElement ArrayName = stored_scales index = <index> newvalue = { group = ( <stored_scales> [ <index> ] . group ) X = <X> Y = <Y> Z = <Z> } 
		index = ( <index> + 1 ) 
	REPEAT <array_size> 
	Dismember Bone = Bone_head 
	Obj_WaitAnimFinished 
	PlayAnim anim = WStandIdle3 speed = 2.00000000000 
ENDSCRIPT


