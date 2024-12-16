
ped_low_priority_waypoint_probability = 0.20000000298 
ped_min_distance_to_path = 2 
ped_max_distance_to_path = 48 
ped_min_bias = 0.00000100000 
ped_avoid_ped_range = 60 
ped_avoid_ped_bias = 0.50000000000 
ped_whisker_decay_factor = 0.80000001192 
ped_head_on_range = 0.17499999702 
ped_target_node_bias = 0.80000001192 
ped_max_angle_to_heading = 0.17499999702 
ped_branching_path_min_angle = 90 
ped_fade_target_bias_max_distance_square = 4225 
ped_fade_target_bias_min_distance_square = 36 
ped_min_inner_path_angle = 80 
ped_turn_frames = 30 
ped_passing_room_right = 100 
ped_passing_room_rear = 60 
ped_passing_room_front = 36 
ped_passing_room_front_buffer_percent = 20 
ped_max_y_distance_to_ignore = 36 
ped_walker_min_square_distance_to_dead_end = 1000 
ped_min_notice_TrickScore = 5000 
ped_skater_min_square_distance_to_waypoint = 3 
ped_skater_min_square_distance_to_skater = 576 
ped_skater_min_square_distance_to_crouch_for_jump = 14400 
ped_skater_fade_target_bias_max_distance_square = 7056 
ped_skater_stick_dist_below = 24.00000000000 
ped_skater_stick_dist_above = 18.00000000000 
ped_skater_jump_col_dist_above = 12 
ped_skater_jump_col_dist_below = 12 
ped_skater_vert_jump_speed_slop = 1 
ped_skater_deltaV = 100 
ped_skater_bail_deceleration = 9 
ped_skater_stop_deceleration = 10 
ped_skater_min_180_spin_time = 0.30000001192 
ped_skater_vert_rotation_time_slop = 1.10000002384 
ped_skater_spine_rotation_slop = 60 
ped_skater_jump_to_next_node_height_slop = 12 
ped_skater_jump_speed = 280 
ped_skater_jump_gravity = -700 
ped_skater_grind_tricks = [ 
	{ TrickScript = Trick_Boardslide_BS } 
	{ TrickScript = Trick_5050_BS } 
	{ TrickScript = Trick_Crooked_FS } 
	{ TrickScript = Trick_NGCRook_FS } 
	{ TrickScript = Trick_Smith_FS } 
	{ TrickScript = Trick_Smith_BS } 
	{ TrickScript = Trick_Feeble_FS } 
	{ TrickScript = Trick_NoseGrind_FS } 
	{ TrickScript = Trick_5_0_FS } 
] 
ped_skater_brake_idle_anims = [ 
	NewBrakeIdle 
	NewBrakeIdle 
	NewBrakeIdle 
	NewBrakeIdle 
	NewBrakeIdle 
	NewBrakeIdle 
	NewBrakeIdle 
	NewBrakeIdle2 
	NewBrakeIdle3 
	NewBrakeIdle4 
	NewBrakeIdle5 
	NewBrakeIdle6 
	NewBrakeIdle7 
	NewBrakeIdle8 
] 
default_m_walk_anims = [ 
	Ped_M_Walk1 
	Ped_M_Walk1 
	Ped_M_WalkTired 
	Ped_M_WalkTired 
	Ped_M_Walk2 
	Ped_M_Walk2 
	Ped_M_Walk3 
	Ped_M_Walk3 
	Ped_M_Walk4 
	Ped_M_Walk4 
] 
default_m_run_anims = [ 
	Ped_M_Run1 
	Ped_M_Run2 
] 
default_m_idle_anims = [ 
	Ped_M_Idle1 
] 
default_m_stand_anims = [ 
	Ped_M_Idle1 
	Ped_M_Wave 
	Ped_M_LookAround 
	Ped_M_ScratchChin 
	Ped_M_LookLeftRight 
	Ped_M_Talk_Dull 
] 
default_m_disgust_anims = [ 
	Ped_M_Disgust 
	Ped_M_ShakeFist 
] 
default_m_knockdown_reaction_anims = [ 
	Ped_M_Disgust 
	Ped_M_ShakeFist 
] 
default_m_bored_anims = [ 
	Ped_M_LookAtWatch 
	Ped_M_ScratchChin 
	Ped_M_Talk_Shrug 
	Ped_M_Talk_WhoKnows 
] 
default_m_impressed_anims = [ 
	Ped_M_Clap 
	Ped_M_Cheering 
	Ped_M_CheerIdle1 
	Ped_M_CheerIdle2 
	Ped_M_CheerIdle3 
	Ped_M_CheerIdle4 
	Ped_M_CheerIdle5 
	Ped_M_CheerIdle6 
	Ped_M_ThumbUp 
] 
default_m_get_attention_anims = [ 
	Ped_M_PlayerWave 
] 
default_m_falldown_anims = [ 
	Ped_M_FalldownA 
	Ped_M_FalldownB 
	Ped_M_FalldownC 
	Ped_M_FalldownD 
	Ped_M_FalldownE 
] 
default_m_layidle_anims = [ 
	Ped_M_LayIdleA 
	Ped_M_LayIdleB 
	Ped_M_LayIdleC 
	Ped_M_LayIdleD 
	Ped_M_LayIdleE 
] 
default_m_getup_anims = [ 
	Ped_M_GetUpA 
	Ped_M_GetUpB 
	Ped_M_GetUpC 
	Ped_M_GetUpD 
	Ped_M_GetUpE 
] 
default_m_attack_anims = [ 
	Ped_M_Punch 
	Ped_M_Push 
] 
default_M_anim_assets = { 
	Anim_Types = { 
		Idle = Ped_M_Idle1 
		Idle2 = Ped_M_Idle2 
		Idle3 = Ped_M_Idle3 
		IdleToIdle2 = Ped_M_Idle1ToIdle2 
		Idle2ToIdle = Ped_M_Idle2ToIdle1 
		IdleToIdle3 = Ped_M_Idle1ToIdle3 
		Idle3ToIdle = Ped_M_Idle3ToIdle1 
		RotateFromIdle1 = Ped_M_RotateLFromIdle1 
		Wave = Ped_M_PlayerWave 
		WalkingWave = Ped_M_WalkingWave 
		IdleToWalk = Ped_M_Walk1FromIdle 
		WalkToIdle = Ped_M_Walk1ToIdle 
		TurnAnims = Ped_M_RotateLFromIdle1 
		WalkAnims = default_m_walk_anims 
		RunAnims = default_m_run_anims 
		AvoidAnims = { 
			JumpForward = Ped_M_JumpForward 
			JumpBack = Ped_M_JumpBack 
			JumpLeft = Ped_M_JumpLeft 
			DistForward = 50.00000000000 
			DistBack = 50.00000000000 
			DistLeft = 70.00000000000 
			DistRight = 70.00000000000 
			Idle = Ped_M_Idle1 
		} 
		IdleAnims = default_m_idle_anims 
		StandAnims = default_m_stand_anims 
		DisgustAnims = default_m_disgust_anims 
		KnockdownReactionAnims = default_m_knockdown_reaction_anims 
		BoredAnims = default_m_bored_anims 
		ImpressedAnims = default_m_impressed_anims 
		GetAttentionAnims = default_m_get_attention_anims 
		FallDownAnims = default_m_falldown_anims 
		LayIdleAnims = default_m_layidle_anims 
		GetupAnims = default_m_getup_anims 
		AttackAnims = default_m_attack_anims 
	} 
} 
default_F_WalkAnims = [ 
	Ped_F_Walk 
] 
default_F_RunAnims = [ 
	Ped_F_Walk 
] 
default_F_IdleAnims = [ 
	Ped_F_Idle1 
] 
default_F_StandAnims = [ 
	Ped_F_Idle1 
] 
default_F_DisgustAnims = [ 
	Ped_F_Angry 
] 
default_F_KnockdownReactionAnims = [ 
	Ped_F_Angry 
] 
default_F_BoredAnims = [ 
	Ped_F_Angry 
] 
default_F_ImpressedAnims = [ 
	Ped_F_Wave 
] 
default_F_GetAttentionAnims = [ 
	Ped_F_Wave 
] 
default_F_FallDownAnims = [ 
	Ped_Bitches_Knockdown 
] 
default_F_LayIdleAnims = [ 
	Ped_Bitches_LyingIdle 
] 
default_F_GetupAnims = [ 
	Ped_Bitches_GetUp 
] 
default_F_AttackAnims = [ 
	Ped_F_Push 
] 
default_F_anim_assets = { 
	Anim_Types = { 
		Idle = Ped_F_Idle1 
		Idle2 = Ped_F_Idle2 
		Idle3 = Ped_F_Idle3 
		IdleToIdle2 = Ped_F_Idle1ToIdle2 
		Idle2ToIdle = Ped_F_Idle2ToIdle1 
		IdleToIdle3 = Ped_F_Idle1ToIdle3 
		Idle3ToIdle = Ped_F_Idle3ToIdle1 
		RotateFromIdle1 = Ped_F_RotateLFromIdle1 
		RotateFromIdle2 = Ped_F_RotateLFromIdle2 
		RotateFromIdle3 = Ped_F_RotateLFromIdle3 
		Wave = Ped_F_Wave 
		WalkingWave = Ped_F_WalkingWave 
		IdleToWalk = Ped_F_WalkFromIdle1 
		WalkToIdle = Ped_F_WalkToIdle1 
		TurnAnims = Ped_F_RotateLFromIdle1 
		WalkAnims = default_F_WalkAnims 
		RunAnims = default_F_RunAnims 
		AvoidAnims = { 
			JumpForward = Ped_F_JumpForward 
			JumpBack = Ped_F_JumpBack 
			JumpRight = Ped_F_JumpRight 
			DistForward = 25.00000000000 
			DistBack = 20.00000000000 
			DistLeft = 25.00000000000 
			DistRight = 25.00000000000 
		} 
		IdleAnims = default_F_IdleAnims 
		StandAnims = default_F_StandAnims 
		DisgustAnims = default_F_DisgustAnims 
		KnockdownReactionAnims = default_F_KnockdownReactionAnims 
		BoredAnims = default_F_BoredAnims 
		ImpressedAnims = default_F_ImpressedAnims 
		GetAttentionAnims = default_F_GetAttentionAnims 
		FallDownAnims = default_F_FallDownAnims 
		LayIdleAnims = default_F_LayIdleAnims 
		GetupAnims = default_F_GetupAnims 
		AttackAnims = default_F_AttackAnims 
	} 
} 
default_M_skater_LandAnims = [ 
	Land 
] 
default_M_skater_CrouchedLandAnims = [ 
	CrouchedLandTurn4 
	CrouchedLandTurn5 
] 
default_M_skater_TurnAnims = [ 
	StandTurnLeft 
	StandTurnRight 
] 
default_M_skater_WalkAnims = [ 
	WalkFast 
	WalkSlow 
	WWalk 
] 
default_M_skater_IdleAnims = [ 
	WStand 
	WStandIdle1 
	WStandIdle2 
	WStandIdle3 
	WStandIdle4 
	WStandIdle5 
	WStandIdle6 
] 
default_M_skater_DisgustAnims = [ 
	Ped_M_Disgust 
	Ped_M_ShakeFist 
] 
default_M_skater_KnockdownReactionAnims = [ 
	Ped_M_Disgust 
	Ped_M_ShakeFist 
] 
default_M_skater_BoredAnims = [ 
	WStandIdle5 
	WStandIdle6 
] 
default_M_skater_ImpressedAnims = [ 
	Ped_M_PlayerWave 
	Ped_M_Clap 
	Ped_M_Cheering 
	Ped_M_CheerIdle1 
	Ped_M_CheerIdle2 
	Ped_M_CheerIdle3 
	Ped_M_CheerIdle4 
	Ped_M_CheerIdle5 
	Ped_M_CheerIdle6 
] 
default_M_skater_FallDownAnims = [ 
	Ped_M_FalldownA 
	Ped_M_FalldownB 
	Ped_M_FalldownC 
	Ped_M_FalldownD 
	Ped_M_FalldownE 
] 
default_M_skater_LayIdleAnims = [ 
	Ped_M_LayIdleA 
	Ped_M_LayIdleB 
	Ped_M_LayIdleC 
	Ped_M_LayIdleD 
	Ped_M_LayIdleE 
] 
default_M_skater_GetupAnims = [ 
	Ped_M_GetUpA 
	Ped_M_GetUpB 
	Ped_M_GetUpC 
	Ped_M_GetUpD 
	Ped_M_GetUpE 
] 
default_M_skater_AttackAnims = [ 
	Ped_M_Punch 
	Ped_M_Push 
] 
default_M_skater_anim_assets = { 
	Anim_Types = { 
		LandAnims = default_M_skater_LandAnims 
		CrouchedLandAnims = default_M_skater_CrouchedLandAnims 
		Idle = WStand 
		RotateFromIdle3 = Ped_M_RotateLFromIdle3 
		Wave = Ped_M_PlayerWave 
		WalkingWave = Ped_M_WalkingWave 
		IdleToWalk = WStandToWalk 
		WalkToIdle = WWalkToStand 
		TurnAnims = default_M_skater_TurnAnims 
		WalkAnims = default_M_skater_WalkAnims 
		AvoidAnims = { 
			JumpForward = Ped_M_JumpForward 
			JumpBack = Ped_M_JumpBack 
			JumpLeft = Ped_M_JumpLeft 
			DistForward = 50.00000000000 
			DistBack = 50.00000000000 
			DistLeft = 70.00000000000 
			DistRight = 70.00000000000 
			Idle = WStand 
		} 
		IdleAnims = default_M_skater_IdleAnims 
		DisgustAnims = default_M_skater_DisgustAnims 
		KnockdownReactionAnims = default_M_skater_KnockdownReactionAnims 
		BoredAnims = default_M_skater_BoredAnims 
		ImpressedAnims = default_M_skater_ImpressedAnims 
		FallDownAnims = default_M_skater_FallDownAnims 
		LayIdleAnims = default_M_skater_LayIdleAnims 
		GetupAnims = default_M_skater_GetupAnims 
		AttackAnims = default_M_skater_AttackAnims 
	} 
} 
default_Fat_WalkAnims = [ 
	Ped_FatGuy_Walk 
] 
default_Fat_RunAnims = [ 
	Ped_FatGuy_Run 
] 
default_Fat_IdleAnims = [ 
	Ped_FatGuy_idle1 
] 
default_Fat_StandAnims = [ 
	Ped_FatGuy_idle1 
	Ped_FatGuy_Idle1toWipeHead 
] 
default_Fat_DisgustAnims = [ 
	Ped_M_Disgust 
	Ped_M_ShakeFist 
] 
default_Fat_KnockdownReactionAnims = [ 
	Ped_M_Disgust 
	Ped_M_ShakeFist 
] 
default_Fat_BoredAnims = [ 
	Ped_FatGuy_ScratchButt 
] 
default_Fat_ImpressedAnims = [ 
	Ped_M_PlayerWave 
	Ped_M_Clap 
	Ped_M_Cheering 
	Ped_M_CheerIdle1 
	Ped_M_CheerIdle2 
	Ped_M_CheerIdle3 
	Ped_M_CheerIdle4 
	Ped_M_CheerIdle5 
	Ped_M_CheerIdle6 
] 
default_Fat_GetAttentionAnims = [ 
	Ped_FatGuy_GetAttention01 
	Ped_FatGuy_GetAttention02 
] 
default_Fat_FallDownAnims = [ 
	Ped_FatGuy_IdletoKnockdown 
] 
default_Fat_LayIdleAnims = [ 
	Ped_FatGuy_KnockdownIdle 
] 
default_Fat_GetupAnims = [ 
	Ped_FatGuy_KnockdowntoIdle 
] 
default_Fat_AttackAnims = [ 
	Ped_FatGuy_Push 
] 
default_Fat_anim_assets = { 
	Anim_Types = { 
		Idle = Ped_FatGuy_idle1 
		Idle2 = Ped_FatGuy_HandsWaistIdle 
		Idle3 = Ped_FatGuy_HandsWaistIdle 
		IdleToIdle2 = Ped_FatGuy_Idle1toHandsWaist 
		Idle2ToIdle = Ped_FatGuy_HandsWaist2Idle 
		IdleToIdle3 = Ped_FatGuy_Idle1toHandsWaist 
		Idle3ToIdle = Ped_FatGuy_HandsWaist2Idle 
		RotateFromIdle1 = Ped_FatGuy_idle1 
		Wave = Ped_FatGuy_GetAttention01 
		WalkingWave = Ped_M_WalkingWave 
		IdleToWalk = Ped_FatGuy_IdletoWalk 
		WalkToIdle = Ped_FatGuy_WalktoIdle 
		TurnAnims = Ped_FatGuy_idle1 
		WalkAnims = default_Fat_WalkAnims 
		RunAnims = default_Fat_RunAnims 
		AvoidAnims = { 
			JumpForward = Ped_FatGuy_Avoid 
			JumpBack = Ped_FatGuy_Avoid 
			JumpLeft = Ped_FatGuy_Avoid 
			DistForward = 50.00000000000 
			DistBack = 50.00000000000 
			DistLeft = 70.00000000000 
			DistRight = 70.00000000000 
			Idle = Ped_FatGuy_idle1 
		} 
		IdleAnims = default_Fat_IdleAnims 
		StandAnims = default_Fat_StandAnims 
		DisgustAnims = default_Fat_DisgustAnims 
		KnockdownReactionAnims = default_Fat_KnockdownReactionAnims 
		BoredAnims = default_Fat_BoredAnims 
		ImpressedAnims = default_Fat_ImpressedAnims 
		GetAttentionAnims = default_Fat_GetAttentionAnims 
		FallDownAnims = default_Fat_FallDownAnims 
		LayIdleAnims = default_Fat_LayIdleAnims 
		GetupAnims = default_Fat_GetupAnims 
		AttackAnims = default_Fat_AttackAnims 
	} 
} 
Default_blocker_IdleAnims = [ 
	Ped_Blocker_BlockA_idle 
	Ped_Blocker_BlockB_idle 
] 
Default_blocker_anim_assets = { 
	Anim_Types = { 
		ShuffleLeft = Ped_Blocker_ShuffleBlockLeft 
		ShuffleRight = Ped_Blocker_ShuffleBlockRight 
		IdleAnims = Default_blocker_IdleAnims 
	} 
} 
Default_jester_StandAnims = [ 
	Ped_Jester_dance01 
	Ped_Jester_dance02 
] 
Default_jester_anim_assets = { 
	Anim_Types = { 
		StandAnims = Default_jester_StandAnims 
	} 
} 
Default_GermanDrunk_WalkAnims = [ 
	Ped_GermanDrunk_Walk 
] 
Default_GermanDrunk_IdleAnims = [ 
	Ped_GermanDrunk_idle 
] 
Default_GermanDrunk_anim_assets = { 
	Anim_Types = { 
		IdleToWalk = Ped_GermanDrunk_Idle2Walk 
		WalkToIdle = Ped_GermanDrunk_Walk2Idle 
		RotateFromIdle1 = Ped_GermanDrunk_idle 
		RotateFromIdle2 = Ped_GermanDrunk_idle 
		RotateFromIdle3 = Ped_GermanDrunk_idle 
		TurnAnims = Ped_M_RotateLFromIdle1 
		WalkAnims = Default_GermanDrunk_WalkAnims 
		IdleAnims = Default_GermanDrunk_IdleAnims 
	} 
} 
Default_Drunk_WalkAnims = [ 
	Ped_Drunk_Walk 
] 
Default_Drunk_IdleAnims = [ 
	Ped_Drunk_Idle 
	Ped_Drunk_Talk1 
	Ped_Drunk_Talk2 
] 
Default_Drunk_anim_assets = { 
	Anim_Types = { 
		IdleToWalk = Ped_Drunk_WalkFromIdle 
		WalkToIdle = Ped_Drunk_WalkToIdle 
		WalkAnims = Default_Drunk_WalkAnims 
		IdleAnims = Default_Drunk_IdleAnims 
	} 
} 
Default_MetalDetector_WalkAnims = [ 
	Ped_MetalDetect_WalkCyle 
] 
Default_MetalDetector_IdleAnims = [ 
	Ped_MetalDetect_Idle01 
	Ped_MetalDetect_PicksUpCoin 
] 
Default_MetalDetector_anim_assets = { 
	Anim_Types = { 
		IdleToWalk = Ped_MetalDetect_WalkCyleStop 
		WalkToIdle = Ped_MetalDetect_StartWalkCycle 
		Walk = Ped_MetalDetect_WalkCyle 
		RotateFromIdle1 = Ped_MetalDetect_Idle01 
		RotateFromIdle2 = Ped_MetalDetect_Idle01 
		RotateFromIdle3 = Ped_MetalDetect_Idle01 
		WalkAnims = Default_MetalDetector_WalkAnims 
		IdleAnims = Default_MetalDetector_IdleAnims 
	} 
} 
Default_ZombieMale_WalkAnims = [ 
	Ped_M_Zombie_WalkCycle 
] 
Default_ZombieMale_IdleAnims = [ 
	Ped_M_Zombie_Idle 
] 
Default_ZombieMale_anim_assets = { 
	Anim_Types = { 
		IdleToWalk = Ped_M_Zombie_StartWalk 
		WalkToIdle = Ped_M_Zombie_StopWalk 
		Walk = Ped_M_Zombie_WalkCycle 
		RotateFromIdle1 = Ped_M_Zombie_Idle 
		RotateFromIdle2 = Ped_M_Zombie_Idle 
		RotateFromIdle3 = Ped_M_Zombie_Idle 
		WalkAnims = Default_ZombieMale_WalkAnims 
		IdleAnims = Default_ZombieMale_IdleAnims 
	} 
} 
Default_ZombieFeMale_WalkAnims = [ 
	Ped_F_Zombie_WalkCycle 
] 
Default_ZombieFeMale_IdleAnims = [ 
	Ped_F_Zombie_Idle 
] 
Default_ZombieFeMale_anim_assets = { 
	Anim_Types = { 
		IdleToWalk = Ped_F_Zombie_StartWalk 
		WalkToIdle = Ped_F_Zombie_StopWalk 
		Walk = Ped_F_Zombie_WalkCycle 
		RotateFromIdle1 = Ped_F_Zombie_Idle 
		RotateFromIdle2 = Ped_F_Zombie_Idle 
		RotateFromIdle3 = Ped_F_Zombie_Idle 
		WalkAnims = Default_ZombieFeMale_WalkAnims 
		IdleAnims = Default_ZombieFeMale_IdleAnims 
	} 
} 
Default_Imp_WalkAnims = [ 
	PED_Imp_Fly 
] 
Default_Imp_IdleAnims = [ 
	PED_Imp_idle 
] 
Default_Imp_StandAnims = [ 
	PED_Imp_idle 
] 
Default_Imp_anim_assets = { 
	Anim_Types = { 
		IdleToWalk = PED_Imp_Idle2Fly 
		WalkToIdle = PED_Imp_Fly2Idle 
		Walk = PED_Imp 
		RotateFromIdle1 = PED_Imp_Fly 
		RotateFromIdle2 = PED_Imp_Fly 
		RotateFromIdle3 = PED_Imp_Fly 
		WalkAnims = Default_Imp_WalkAnims 
		IdleAnims = Default_Imp_IdleAnims 
		StandAnims = Default_Imp_StandAnims 
	} 
} 
Default_LostSoul_IdleAnims = [ 
	Ped_LostSoul_idle1 
	Ped_LostSoul_idle2 
] 
Default_LostSoul_StandAnims = [ 
	Ped_LostSoul_idle1 
	Ped_LostSoul_idle2 
] 
Default_LostSoul_WalkAnims = [ 
	Ped_M_WalkTired 
] 
Default_LostSoul_GetAttentionAnims = [ 
	Ped_LostSoul_idle2 
] 
Default_LostSoul_DisgustAnims = [ 
	Ped_LostSoul_idle2 
] 
Default_LostSoul_KnockdownReactionAnims = [ 
	Ped_LostSoul_idle2 
] 
Default_LostSoul_anim_assets = { 
	Anim_Types = { 
		IdleToWalk = Ped_M_WalkTiredToIdle 
		WalkToIdle = Ped_M_WalkTiredFromIdle 
		Walk = Ped_M_WalkTired 
		RotateFromIdle1 = Ped_LostSoul_idle1 
		RotateFromIdle2 = Ped_LostSoul_idle1 
		RotateFromIdle3 = Ped_LostSoul_idle1 
		IdleAnims = Default_LostSoul_IdleAnims 
		StandAnims = Default_LostSoul_StandAnims 
		WalkAnims = Default_LostSoul_WalkAnims 
		GetAttentionAnims = Default_LostSoul_GetAttentionAnims 
		DisgustAnims = Default_LostSoul_DisgustAnims 
		KnockdownReactionAnims = Default_LostSoul_KnockdownReactionAnims 
	} 
} 
SkatopiaCat_IdleAnims = [ 
	Idle 
] 
SkatopiaCat_WalkAnims = [ 
	Walk 
] 
SkatopiaCat_RunAnims = [ 
	Run 
] 
SkatopiaCat_anim_assets = { 
	Anim_Types = { 
		IdleAnims = SkatopiaCat_IdleAnims 
		WalkAnims = SkatopiaCat_WalkAnims 
		RunAnims = SkatopiaCat_RunAnims 
	} 
} 
default_M_audio_assets = { 
	VO_Types = { 
		GetAttention = [ 
			HintPed_BO_Statue_Far01 
			HintPed_BO_Statue_Far02 
			HintPed_BO_Statue_Far03 
			HintPed_BO_Statue_Far04 
			HintPed_BO_Statue_Far05 
		] 
	} 
} 
Bo_hintped_01_audio_assets = { 
	VO_Types = { 
		GetAttention = [ 
			HintPed_BO_BarGuy_Far01 
			HintPed_BO_BarGuy_Far02 
			HintPed_BO_BarGuy_Far03 
		] 
	} 
} 
thps3_ped_m_audio_assets = { 
	VO_Types = { 
		GetAttention = [ 
			la_vo_entice1_cr 
			la_vo_entice2_cr 
			la_vo_entice3_cr 
			la_vo_entice4_cr 
		] 
		Avoid = [ 
			la2_vo_approach1_cr 
			la2_vo_approach2_cr 
			la2_vo_approach3_cr 
			la2_vo_approach4_cr 
		] 
		TrickBail = [ 
			la_vo_under1_cr 
			la_vo_under3_cr 
			la_vo_under4_cr 
			la_vo_under5_cr 
		] 
		TrickPositive = [ 
			la_vo_thresh1_1_cr 
			la_vo_thresh1_2_cr 
			la_vo_thresh1_3_cr 
			la_vo_thresh1_4_cr 
			la_vo_thresh1_4_cr 
			la_vo_thresh2_1_cr 
			la_vo_thresh2_2_cr 
			la_vo_thresh2_3_cr 
			la_vo_thresh2_4_cr 
			la_vo_thresh2_4_cr 
		] 
	} 
} 
thps3_constr_audio_assets = { 
	VO_Types = { 
		GetAttention = [ 
			SHP_PowerGuy_Fixing01 
			SHP_PowerGuy_Fixing02 
			SHP_PowerGuy_Fixing03 
			SHP_PowerGuy_Fixing04 
		] 
		Avoid = [ 
			SHP_PowerGuy_Hit01 
			SHP_PowerGuy_Hit02 
			SHP_PowerGuy_Hit03 
			SHP_PowerGuy_Hit04 
			SHP_PowerGuy_Upset01 
			SHP_PowerGuy_Upset02 
			SHP_PowerGuy_Upset04 
			SHP_PowerGuy_Upset03 
			SHP_PowerGuy_Upset05 
		] 
	} 
} 
thps3_WELDER_audio_assets = { 
	VO_Types = { 
		Avoid = [ 
			Foun_Valve_01 
			Foun_Valve_02 
			Foun_Valve_03 
			Foun_Valve_04 
			Foun_Valve_05 
		] 
	} 
} 
ped_NS_Chick_audio_assets = { 
	VO_Types = { 
		GetAttention = [ 
			Shp_Chickns_new_01 
			Shp_Chickns_new_03 
			Shp_Chickns_new_04 
			Shp_Chickns_new_05 
			Shp_Chickns_new_19 
			shp_chickns_entice01 
			shp_chickns_entice02 
			shp_chickns_entice03 
			Shp_Chickns_new_01 
			shp_chickns_new_02 
			Shp_Chickns_new_03 
			Shp_Chickns_new_04 
			Shp_Chickns_new_05 
			shp_chickns_new_06a 
		] 
		Avoid = [ 
			Shp_bikini_new_18a 
			Shp_bikini_new_19 
			Shp_bikini_new_21a 
			Shp_bikini_new_22a 
			Shp_bikini_new_23 
			Shp_bikini_new_24a 
			Shp_bikini_new_29 
			Shp_bikini_new_33 
			Shp_bikini_new_35 
			Shp_bikini_new_36 
			Shp_bikini_new_38 
			Shp_bikini_new_39 
			Shp_bikini_new_07 
			Shp_bikini_new_08a 
		] 
		TrickBail = [ 
			Shp_bikini_new_05 
			Shp_bikini_new_08a 
			Shp_bikini_new_09a 
			Shp_bikini_new_32a 
			Shp_bikini_new_38 
			Shp_bikini_new_39 
		] 
		TrickPositive = [ 
			Shp_bikini_new_10 
			Shp_bikini_new_13 
			Shp_bikini_new_14 
			Shp_bikini_new_16 
			Shp_bikini_new_17a 
			shp_chickns_impressed05 
			shp_chickns_new_23a 
			shp_chickns_new_24 
			shp_chickns_new_26 
			shp_chickns_new_27a 
			shp_chickns_new_28 
			shp_chickns_new_27a 
			shp_chickns_new_26 
			shp_chickns_new_24 
		] 
		TrickWeak = [ ] 
		Warning = [ 
			Shp_bikini_new_18a 
			Shp_bikini_new_19 
			Shp_bikini_new_21a 
			Shp_bikini_new_22a 
			Shp_bikini_new_23 
			Shp_bikini_new_24a 
			Shp_bikini_new_29 
			Shp_bikini_new_33 
			Shp_bikini_new_35 
			Shp_bikini_new_36 
			Shp_bikini_new_38 
			Shp_bikini_new_39 
			Shp_bikini_new_07 
			Shp_bikini_new_08a 
		] 
	} 
} 
SCRIPT CUTSCENE_Ped_Stand_idles 
	IF gotparam snapToground 
		obj_sticktoground distabove = 3 distbelow = 6 
	ENDIF 
	GetRandomValue name = FromTime a = 0 b = 60 resolution = 60 Integer 
	BEGIN 
		RANDOM(1, 1, 1, 1, 1, 1, 1) 
			RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Ped_M_SkateIdle1 from = <FromTime> 
			RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Ped_M_SkateIdle2 from = <FromTime> 
			RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Ped_M_SkateIdle3 from = <FromTime> 
			RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Ped_M_SkateIdle4 from = <FromTime> 
			RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Ped_M_SkateIdle5 from = <FromTime> 
			RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Ped_M_SkateIdle6 from = <FromTime> 
			RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Ped_M_SkateIdle7 from = <FromTime> 
		RANDOMEND 
		obj_waitanimfinished 
		FromTime = 0 
	REPEAT 
ENDSCRIPT

SCRIPT CUTSCENE_Ped_Cheer_idles 
	IF gotparam snapToground 
		obj_sticktoground distabove = 3 distbelow = 6 
	ENDIF 
	GetRandomValue name = FromTime a = 0 b = 60 resolution = 60 Integer 
	BEGIN 
		RANDOM(1, 1, 1, 1, 1, 1) 
			RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Ped_M_CheerIdle1 from = <FromTime> 
			RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Ped_M_CheerIdle2 from = <FromTime> 
			RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Ped_M_CheerIdle3 from = <FromTime> 
			RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Ped_M_CheerIdle4 from = <FromTime> 
			RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Ped_M_CheerIdle5 from = <FromTime> 
			RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Ped_M_CheerIdle6 from = <FromTime> 
		RANDOMEND 
		obj_waitanimfinished 
		FromTime = 0 
	REPEAT 
ENDSCRIPT

SCRIPT CUTSCENE_Ped_Cheering 
	IF gotparam snapToground 
		obj_sticktoground distabove = 3 distbelow = 6 
	ENDIF 
	GetRandomValue name = FromTime a = 0 b = 60 resolution = 60 Integer 
	BEGIN 
		RANDOM(1, 1, 1, 1, 1, 1, 1) 
			RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Ped_M_Clap from = <FromTime> 
			RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Ped_M_ThumbUp from = <FromTime> 
			RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Ped_M_Cheering from = <FromTime> 
			RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Ped_M_Cheer1 from = <FromTime> 
			RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Ped_M_Cheer5 from = <FromTime> 
			RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Ped_M_Cheer6 from = <FromTime> 
			RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Ped_M_Cheer7 from = <FromTime> 
		RANDOMEND 
		obj_waitanimfinished 
		FromTime = 0 
	REPEAT 
ENDSCRIPT

SCRIPT CUTSCENE_Ped_Sitting_idles 
	IF gotparam snapToground 
		obj_sticktoground distabove = 3 distbelow = 6 
	ENDIF 
	GetRandomValue name = FromTime a = 0 b = 60 resolution = 60 Integer 
	BEGIN 
		RANDOM(1, 1, 1) 
			RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Ped_M_Cheer_SittingIdle from = <FromTime> 
			RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Ped_M_Cheer_SittingIdle2 from = <FromTime> 
			RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Ped_M_Cheer_SittingIdle3 from = <FromTime> 
		RANDOMEND 
		obj_waitanimfinished 
		FromTime = 0 
	REPEAT 
ENDSCRIPT

SCRIPT CUTSCENE_Ped_Sitting_Cheers 
	IF gotparam snapToground 
		obj_sticktoground distabove = 3 distbelow = 6 
	ENDIF 
	GetRandomValue name = FromTime a = 0 b = 60 resolution = 60 Integer 
	BEGIN 
		RANDOM(1, 1, 1, 1, 1) 
			RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Ped_M_Cheer_Sitting1 from = <FromTime> 
			RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Ped_M_Cheer_Sitting2 from = <FromTime> 
			RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Ped_M_Cheer_Sitting3 from = <FromTime> 
			RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Ped_M_Cheer_Sitting4 from = <FromTime> 
			RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Ped_M_Cheer_Sitting5 from = <FromTime> 
		RANDOMEND 
		obj_waitanimfinished 
		FromTime = 0 
	REPEAT 
ENDSCRIPT

SCRIPT CUTSCENE_Ped_Kneeling_idles 
	IF gotparam snapToground 
		obj_sticktoground distabove = 3 distbelow = 6 
	ENDIF 
	GetRandomValue name = FromTime a = 0 b = 60 resolution = 60 Integer 
	BEGIN 
		RANDOM(1, 1) 
			RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Ped_M_Cheer_KneelingIdle from = <FromTime> 
			RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Ped_M_Cheer_KneelingIdle2 from = <FromTime> 
		RANDOMEND 
		obj_waitanimfinished 
		FromTime = 0 
	REPEAT 
ENDSCRIPT

SCRIPT CUTSCENE_Ped_Kneeling_Cheers 
	IF gotparam snapToground 
		obj_sticktoground distabove = 3 distbelow = 6 
	ENDIF 
	GetRandomValue name = FromTime a = 0 b = 60 resolution = 60 Integer 
	BEGIN 
		RANDOM(1, 1, 1) 
			RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Ped_M_Cheer_Kneeling1 fom = <FromTime> 
			RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Ped_M_Cheer_Kneeling2 from = <FromTime> 
			RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Ped_M_Cheer_Kneeling3 from = <FromTime> 
		RANDOMEND 
		obj_waitanimfinished 
		FromTime = 0 
	REPEAT 
ENDSCRIPT

SCRIPT CUTSCENE_SkaterPed_BoardStand_ildes 
	IF gotparam snapToground 
		obj_sticktoground distabove = 3 distbelow = 6 
	ENDIF 
	GetRandomValue name = FromTime a = 0 b = 60 resolution = 60 Integer 
	BEGIN 
		RANDOM(1, 1, 1, 1) 
			RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Ped_M_SkateIdleA from = <FromTime> 
			RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Ped_M_SkateIdleB from = <FromTime> 
			RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Ped_M_SkateIdleC from = <FromTime> 
			RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Ped_M_SkateIdleD from = <FromTime> 
		RANDOMEND 
		obj_waitanimfinished 
		FromTime = 0 
	REPEAT 
ENDSCRIPT

SCRIPT CUTSCENE_Ped_NO_Sit_idles 
	IF gotparam snapToground 
		obj_sticktoground distabove = 3 distbelow = 6 
	ENDIF 
	GetRandomValue name = FromTime a = 0 b = 60 resolution = 60 Integer 
	BEGIN 
		RANDOM(1, 1, 1) 
			RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Ped_M_Sit_Idle_A from = <FromTime> speed = 0.25000000000 
			RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Ped_M_Sit_Idle_B from = <FromTime> speed = 0.25000000000 
			RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Ped_M_Sit_Idle_C from = <FromTime> speed = 0.25000000000 
		RANDOMEND 
		obj_waitanimfinished 
		FromTime = 0 
	REPEAT 
ENDSCRIPT


