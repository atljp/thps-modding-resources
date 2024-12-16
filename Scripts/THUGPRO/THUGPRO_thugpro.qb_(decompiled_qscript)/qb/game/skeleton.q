
SCRIPT skeletonload_all 
	LoadSkeleton name = "skeletons/Head_Cas_Male01.ske" Head_Cas_Male01 
	LoadSkeleton name = "skeletons/THPS6_human.ske" THPS6_human 
	LoadSkeleton name = "skeletons/Ped_Female.ske" Ped_Female 
	LoadSkeleton name = "skeletons/anl_bull.ske" anl_bull 
	LoadSkeleton name = "skeletons/anl_dog.ske" anl_dog 
	LoadSkeleton name = "skeletons/anl_pigeon.ske" anl_pigeon 
	LoadSkeleton name = "skeletons/anl_seagull.ske" anl_seagull 
	LoadSkeleton name = "skeletons/anl_shark.ske" anl_shark 
	LoadSkeleton name = "skeletons/anl_cat.ske" anl_Cat 
	LoadSkeleton name = "skeletons/car.ske" car 
	LoadSkeleton name = "skeletons/SI_Boombox.ske" SI_Boombox 
	LoadSkeleton name = "skeletons/si_Prop_1.ske" si_prop_1 
	LoadSkeleton name = "skeletons/si_Prop2.ske" si_prop2 
	LoadSkeleton name = "skeletons/si_Prop_3.ske" si_prop_3 
	LoadSkeleton name = "skeletons/si_pizza.ske" pizzabox 
	LoadSkeleton name = "skeletons/si_generic.ske" si_generic 
	LoadSkeleton name = "skeletons/si_Flag.ske" SI_flag 
	LoadSkeleton name = "skeletons/si_bustedboard.ske" bustedboard 
	LoadSkeleton name = "skeletons/si_extraboard.ske" si_extraboard 
	LoadSkeleton name = "skeletons/SI_FanklinKite.ske" si_franklinKite 
	LoadSkeleton name = "skeletons/car_6.ske" car_6 
	LoadSkeleton name = "skeletons/SI_tongue.ske" SI_tongue 
	LoadSkeleton name = "skeletons/SI_skull.ske" SI_Skull 
ENDSCRIPT

DoNotAssertOnMissingAnims = 1 
skater_asset_info = { 
	skater_skeleton = THPS6_human 
} 
BoneSkipLODInfo = 
{ 
	THPS6_human = 
	[ 
		{ 
			LODDistance = 0.00000000000 
		} 
		{ 
			LODDistance = 30.00000000000 
			SkipBones = 
			[ 
				Cloth_Breast 
				Cloth_Shirt_L 
				Cloth_Shirt_C 
				Cloth_Shirt_R 
				Bone_Head_Top_Scale 
				Bone_Nose_Scale 
				Bone_Chin_Scale 
				Bone_Thumb_L 
				Bone_Thumb_R 
				Bone_PonyTail_1 
				Bone_Toe_L 
				Bone_Toe_R 
			] 
		} 
		{ 
			LODDistance = 50.00000000000 
			SkipBones = 
			[ 
				Bone_Forefinger_Base_L 
				Bone_Forefinger_Base_R 
				Bone_Fingers_Base_L 
				Bone_Fingers_Base_R 
				Bone_Forefinger_Tip_L 
				Bone_Forefinger_Tip_R 
				Bone_Fingers_Tip_L 
				Bone_Fingers_Tip_R 
				Bone_Palm_L 
				Bone_Palm_R 
				Bone_Wrist_L 
				Bone_Wrist_R 
				Bone_Ankle_L 
				Bone_Ankle_R 
			] 
		} 
		{ 
			LODDistance = 150.00000000000 
			SkipBones = 
			[ 
				Bone_Head 
				Bone_Neck 
			] 
		} 
		{ 
			LODDistance = 1000.00000000000 
			SkipBones = 
			[ 
			] 
		} 
	] 
	Ped_Female = 
	[ 
		{ 
			LODDistance = 0.00000000000 
		} 
		{ 
			LODDistance = 30.00000000000 
			SkipBones = 
			[ 
				Cloth_Shirt_L 
				Cloth_Shirt_C 
				Cloth_Shirt_R 
				Bone_Jaw 
				Bone_Brow 
				Bone_PonyTail_1 
				Bone_PonyTail_2 
				Bone_Thumb_L 
				Bone_Thumb_R 
				Bone_Forefinger_Tip_L 
				Bone_Forefinger_Tip_R 
				Bone_Fingers_Tip_L 
				Bone_Fingers_Tip_R 
				Bone_Forefinger_Base_L 
				Bone_Forefinger_Base_R 
				Bone_Fingers_Base_L 
				Bone_Fingers_Base_R 
				Bone_Toe_L 
				Bone_Toe_R 
				Bone_Shoulder_L 
				Bone_Shoulder_R 
			] 
		} 
		{ 
			LODDistance = 50.00000000000 
			SkipBones = 
			[ 
				Bone_Palm_L 
				Bone_Palm_R 
				Bone_Wrist_L 
				Bone_Wrist_R 
				Bone_Ankle_L 
				Bone_Ankle_R 
			] 
		} 
		{ 
			LODDistance = 150.00000000000 
			SkipBones = 
			[ 
				Cloth_Breast 
				Bone_Head 
				Bone_Neck 
			] 
		} 
		{ 
			LODDistance = 1000.00000000000 
			SkipBones = 
			[ 
			] 
		} 
	] 
} 

