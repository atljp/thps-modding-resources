
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
	Vel = ( <MaxVel> * RANDOM_RANGE PAIR(-1.10000002384, 1.10000002384) * VECTOR(1.00000000000, 0.00000000000, 0.00000000000) 
	+ <MaxVel> * RANDOM_RANGE PAIR(0.00000000000, 1.10000002384) * VECTOR(0.00000000000, 1.00000000000, 0.00000000000) 
	+ <MaxVel> * RANDOM_RANGE PAIR(-1.10000002384, 1.10000002384) * VECTOR(0.00000000000, 0.00000000000, 1.00000000000) 
	) 
	RotVel = ( <MaxRotVel> * RANDOM_RANGE PAIR(-1.10000002384, 1.10000002384) * VECTOR(1.00000000000, 0.00000000000, 0.00000000000) 
	+ <MaxRotVel> * RANDOM_RANGE PAIR(-1.10000002384, 1.10000002384) * VECTOR(0.00000000000, 1.00000000000, 0.00000000000) 
	+ <MaxRotVel> * RANDOM_RANGE PAIR(-1.10000002384, 1.10000002384) * VECTOR(0.00000000000, 0.00000000000, 1.00000000000) 
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
SCRIPT make_skater_explode frames = 5 
	GetCurrentSkaterProfileIndex 
	GetSkaterNumber 
	stored_scales = [ 
		{ group = head_bone_group X = 100 Y = 100 Z = 100 } 
		{ group = headtop_bone_group X = 100 Y = 100 Z = 100 } 
		{ group = Nose_bone_group X = 100 Y = 100 Z = 100 } 
		{ group = Jaw_bone_group X = 100 Y = 100 Z = 100 } 
		{ group = stomach_bone_group X = 100 Y = 100 Z = 100 } 
		{ group = torso_bone_group X = 100 Y = 100 Z = 100 } 
		{ group = upper_arm_bone_group X = 100 Y = 100 Z = 100 } 
		{ group = lower_arm_bone_group X = 100 Y = 100 Z = 100 } 
		{ group = hands_bone_group X = 100 Y = 100 Z = 100 } 
		{ group = upper_leg_bone_group X = 100 Y = 100 Z = 100 } 
		{ group = lower_leg_bone_group X = 100 Y = 100 Z = 100 } 
		{ group = feet_bone_group X = 100 Y = 100 Z = 100 } 
		{ group = board_bone_group X = 100 Y = 100 Z = 100 } 
	] 
	GetArraySize <stored_scales> 
	index = 0 
	BEGIN 
		scalingmenu_get_xyz part = ( <stored_scales> [ <index> ] . group ) 
		SetArrayElement ArrayName = stored_scales index = <index> newvalue = { group = ( <stored_scales> [ <index> ] . group ) X = <X> Y = <Y> Z = <Z> } 
		index = ( <index> + 1 ) 
	REPEAT <array_size> 
	OnExitRun make_skater_explode_exit 
	Obj_SpawnScript make_skater_explode_cleanup Params = <...> 
	Dismember Bone = Bone_head 
	Dismember Bone = bone_bicep_R 
	Dismember Bone = bone_bicep_L 
	Dismember Bone = Bone_Thigh_R 
	Dismember Bone = Bone_Thigh_L 
	wait <frames> gameframes 
	Dismember Bone = bone_pelvis 
	wait 2 seconds 
ENDSCRIPT

SCRIPT make_skater_explode_exit 
	Obj_GetId 
	FireEvent type = CleanupSkaterExplode target = <ObjId> 
ENDSCRIPT

SCRIPT make_skater_explode_cleanup 
	WaitForEvent type = CleanupSkaterExplode 
	index = 0 
	BEGIN 
		SetPlayerAppearanceScale { 
			player = <currentSkaterProfileIndex> 
			part = ( <stored_scales> [ <index> ] . group ) 
			X = ( ( <stored_scales> [ <index> ] ) . X ) 
			Y = ( ( <stored_scales> [ <index> ] ) . Y ) 
			Z = ( ( <stored_scales> [ <index> ] ) . Z ) 
		} 
		index = ( <index> + 1 ) 
	REPEAT <array_size> 
	RefreshSkaterScale skater = <skaternumber> profile = <currentSkaterProfileIndex> 
ENDSCRIPT

SCRIPT make_skater_explode_cleanup_all_parts 
	Obj_GetId 
	bones = [ Bone_head , bone_pelvis , Bone_Thigh_R , Bone_Thigh_L , bone_bicep_R , bone_bicep_L ] 
	GetArraySize <bones> 
	index = 0 
	BEGIN 
		BodyChunkName = ( ( <bones> [ <index> ] ) + <ObjId> ) 
		IF ObjectExists id = <BodyChunkName> 
			<BodyChunkName> : Die 
		ENDIF 
		index = ( <index> + 1 ) 
	REPEAT <array_size> 
ENDSCRIPT

SCRIPT make_skater_lose_head 
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
	OnExitRun make_skater_lose_head_exit 
	Obj_SpawnScript make_skater_lose_head_cleanup Params = <...> 
	Dismember Bone = Bone_head 
	Obj_WaitAnimFinished 
	FireEvent type = SkaterLoseHeadCleanup 
	OnExitRun 
	PlayAnim anim = WStandIdle3 speed = 2.00000000000 
ENDSCRIPT

SCRIPT make_skater_lose_head_exit 
	Obj_GetId 
	FireEvent type = SkaterLoseHeadCleanup target = <ObjId> 
ENDSCRIPT

SCRIPT make_skater_lose_head_cleanup 
	WaitForEvent type = SkaterLoseHeadCleanup 
	scale = 0.00000000000 
	BEGIN 
		scale = ( <scale> + 0.01999999955 ) 
		IF ( <scale> > 1.00000000000 ) 
			scale = 1.00000000000 
		ENDIF 
		index = 0 
		BEGIN 
			SetPlayerAppearanceScale { 
				player = <currentSkaterProfileIndex> 
				part = ( <stored_scales> [ <index> ] . group ) 
				X = ( <scale> * ( ( <stored_scales> [ <index> ] ) . X ) ) 
				Y = ( <scale> * ( ( <stored_scales> [ <index> ] ) . Y ) ) 
				Z = ( <scale> * ( ( <stored_scales> [ <index> ] ) . Z ) ) 
			} 
			index = ( <index> + 1 ) 
		REPEAT <array_size> 
		RefreshSkaterScale skater = <skaternumber> profile = <currentSkaterProfileIndex> 
		IF ( <scale> = 1.00000000000 ) 
			BREAK 
		ENDIF 
		wait 1 gameframes 
	REPEAT 
	Obj_WaitAnimFinished 
ENDSCRIPT


