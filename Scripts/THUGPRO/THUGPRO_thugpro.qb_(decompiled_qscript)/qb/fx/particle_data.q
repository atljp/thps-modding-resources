
SCRIPT load_permanent_particle_textures 
	LoadParticleTexture "particles\\apm_debis_01" perm 
	LoadParticleTexture "particles\\apm_debis_quad01" perm 
	LoadParticleTexture "particles\\apm_fallingwater_01" perm 
	LoadParticleTexture "particles\\apm_flamequad_01" perm 
	LoadParticleTexture "particles\\apm_grass01" perm 
	LoadParticleTexture "particles\\apm_ring_01" perm 
	LoadParticleTexture "particles\\apm_ring_02" perm 
	LoadParticleTexture "particles\\apm_spark_01" perm 
	LoadParticleTexture "particles\\apm_splinters_01" perm 
	LoadParticleTexture "particles\\apm_spray_01" perm 
	LoadParticleTexture "particles\\apm_water_splash01" perm 
	LoadParticleTexture "particles\\ba_apm_softsgrade01" perm 
	LoadParticleTexture "particles\\apm_lightning01" perm 
ENDSCRIPT

APM_dirttrail02_particle_params = { 
	boneOffset = VECTOR(0.00000000000, 44.00000000000, 0.00000000000) 
	EnableRotate 
	emitScript = emit_APM_dirttrail02_particle 
	emitterIndependent = 1 
	max = 32 
	type = Flat 
	texture = apm_fallingwater_01 
	blendMode = Blend 
	useGlobalColorModulation 
	priority = 0 
	SuspendDistance = Default_Particle_Suspend_Dist 
} 
SCRIPT emit_APM_dirttrail02_particle 
	setEmitRange width = 5.00000000000 height = 5.00000000000 depth = 0.00000000000 
	setLife min = 0.50000000000 max = 0.50000000000 
	setAngleSpread spread = 0.31000000238 
	setSpeedRange min = 0.10000000149 max = 1.00000000000 
	setEmitAngle x = 270.00000000000 y = 0.00000000000 z = 0.00000000000 
	setForce x = 0.00000000000 y = -0.05000000075 z = 0.00000000000 
	setParticleSize sw = 22.00000000000 ew = 5.00000000000 sh = 22.00000000000 eh = 5.00000000000 
	setColor corner = 0 sr = 20 sg = 18 sb = 15 sa = 0 mr = 66 mg = 52 mb = 35 ma = 255 er = 110 eg = 87 eb = 54 ea = 0 midTime = 0.61000001431 
	emitRate rate = 64.00000000000 
	wait 0.03999999911 seconds 
	emitRate rate = 0 
	destroy ifEmpty = 1 
ENDSCRIPT

APM_dirttrail03_particle_params = { 
	boneOffset = VECTOR(0.00000000000, 118.00000000000, 0.00000000000) 
	EnableRotate 
	emitScript = emit_APM_dirttrail03_particle 
	emitterIndependent = 1 
	max = 32 
	type = Flat 
	texture = apm_fallingwater_01 
	blendMode = Blend 
	useGlobalColorModulation 
	priority = 0 
	SuspendDistance = Default_Particle_Suspend_Dist 
} 
SCRIPT emit_APM_dirttrail03_particle 
	setEmitRange width = 5.00000000000 height = 5.00000000000 depth = 0.00000000000 
	setLife min = 0.50000000000 max = 0.50000000000 
	setAngleSpread spread = 0.31000000238 
	setSpeedRange min = 0.10000000149 max = 1.00000000000 
	setEmitAngle x = 270.00000000000 y = 0.00000000000 z = 0.00000000000 
	setForce x = 0.00000000000 y = -0.05000000075 z = 0.00000000000 
	setParticleSize sw = 22.00000000000 ew = 5.00000000000 sh = 22.00000000000 eh = 5.00000000000 
	setColor corner = 0 sr = 20 sg = 18 sb = 15 sa = 0 mr = 66 mg = 52 mb = 35 ma = 255 er = 110 eg = 87 eb = 54 ea = 0 midTime = 0.61000001431 
	emitRate rate = 64.00000000000 
	wait 0.03999999911 seconds 
	emitRate rate = 0 
	destroy ifEmpty = 1 
ENDSCRIPT

APM_marker01_particle_params = { 
	boneOffset = VECTOR(0.00000000000, -20.00000000000, 32.00000000000) 
	emitScript = emit_APM_marker01_particle 
	emitterIndependent = 1 
	FillPath 
	max = 250 
	type = Ribbon 
	texture = apm_spray_01 
	NoVisibilityTest 
	blendMode = Blend 
	priority = 0 
	SuspendDistance = Default_Particle_Suspend_Dist 
} 
SCRIPT emit_APM_marker01_particle 
	setEmitRange width = 0.00000000000 height = 0.00000000000 depth = 0.00000000000 
	setLife min = 3.90000009537 max = 3.90000009537 
	setAngleSpread spread = 0.00000000000 
	setSpeedRange min = 0.00000000000 max = 0.00000000000 
	setEmitTarget x = 1.00000000000 y = 0.00000000000 z = 0.00000000000 
	setForce x = 0.00000000000 y = 0.00000000000 z = 0.00000000000 
	setParticleSize sw = 10.00000000000 ew = 10.00000000000 sh = 5.00000000000 eh = 5.00000000000 
	setColor corner = 0 sr = 255 sg = 128 sb = 0 sa = 255 mr = 255 mg = 128 mb = 0 ma = 255 er = 255 eg = 128 eb = 0 ea = 0 midTime = 0.93000000715 
	setColor corner = 1 sr = 255 sg = 128 sb = 0 sa = 255 mr = 255 mg = 128 mb = 0 ma = 255 er = 255 eg = 128 eb = 0 ea = 0 midTime = 0.93000000715 
	setColor corner = 2 sr = 255 sg = 128 sb = 0 sa = 255 mr = 255 mg = 128 mb = 0 ma = 255 er = 255 eg = 128 eb = 0 ea = 0 midTime = 0.93000000715 
	setColor corner = 3 sr = 255 sg = 128 sb = 0 sa = 255 mr = 255 mg = 128 mb = 0 ma = 255 er = 255 eg = 128 eb = 0 ea = 0 midTime = 0.93000000715 
	emitRate rate = 32.00000000000 
ENDSCRIPT

APM_tesla01_particle_params = { 
	emitScript = emit_APM_tesla01_particle 
	emitterIndependent = 1 
	max = 3 
	type = Ribbon 
	texture = apm_lightning01 
	blendMode = Add 
	history = 1 
	priority = 0 
} 
SCRIPT emit_APM_tesla01_particle 
	setEmitRange width = 44.00000000000 height = 44.00000000000 depth = 44.00000000000 
	setLife min = 0.50000000000 max = 0.50000000000 
	setAngleSpread spread = -0.02999999933 
	setSpeedRange min = 18.00000000000 max = 18.00000000000 
	setEmitTarget x = 0.00000000000 y = 1.00000000000 z = 0.00000000000 
	setForce x = 0.00000000000 y = -0.05000000075 z = 0.00000000000 
	setParticleSize sw = 22.00000000000 ew = 22.00000000000 sh = 1.00000000000 eh = 1.00000000000 
	setColor corner = 0 sr = 0 sg = 183 sb = 255 sa = 255 mr = 197 mg = 226 mb = 231 ma = 255 er = 0 eg = 183 eb = 255 ea = 255 midTime = 0.95999997854 
	setColor corner = 1 sr = 197 sg = 226 sb = 231 sa = 0 mr = 83 mg = 229 mb = 255 ma = 255 er = 0 eg = 183 eb = 255 ea = 255 midTime = 0.56000000238 
	wait 0.20000000298 seconds 
	emit num = 3 
	destroy ifEmpty = 1 
ENDSCRIPT

APM_Debris01_particle_params = { 
	bone = Bone_Board_Root 
	boneOffset = VECTOR(0.00000000000, 0.00000000000, -10.00000000000) 
	emitScript = emit_APM_Debris01_particle 
	emitterIndependent = 1 
	updateScript = align_scale_to_vel_update 
	params = { 
		bone = Bone_Board_Root 
		update_pos = 1 
		emit_offset = VECTOR(0.00000000000, 3.00000000000, 0.00000000000) 
		emit_scale = 1 
		pos_offset = VECTOR(0.00000000000, -5.00000000000, 0.00000000000) 
		base_vel = 650 
		min_vel_range = 6 
		max_vel_range = 8 
		base_emit_rate = 15 
	} 
	max = 5 
	type = Flat 
	texture = apm_debis_Quad01 
	blendMode = Blend 
	useGlobalColorModulation 
	priority = 0 
} 
SCRIPT emit_APM_Debris01_particle 
	setEmitRange width = 1.00000000000 height = 1.00000000000 depth = 0.00000000000 
	setLife min = 0.20000000298 max = 0.30000001192 
	setAngleSpread spread = 0.37000000477 
	setSpeedRange min = 1.00000000000 max = 1.00000000000 
	setEmitTarget x = 0.00000000000 y = 1.00000000000 z = 0.00000000000 
	setForce x = 0.00000000000 y = -0.69999998808 z = 0.00000000000 
	setParticleSize sw = 8.00000000000 ew = 10.00000000000 
	setColor corner = 0 sr = 71 sg = 75 sb = 77 sa = 255 mr = 138 mg = 138 mb = 138 ma = 255 er = 95 eg = 95 eb = 91 ea = 108 midTime = 0.62999999523 
	emitRate rate = 15.00000000000 
ENDSCRIPT

APM_Gravel01_particle_params = { 
	bone = Bone_Board_Root 
	boneOffset = VECTOR(0.00000000000, 0.00000000000, -10.00000000000) 
	emitScript = emit_APM_Gravel01_particle 
	emitterIndependent = 1 
	updateScript = align_scale_to_vel_update 
	params = { 
		bone = Bone_Board_Root 
		update_pos = 1 
		emit_offset = VECTOR(0.00000000000, 3.00000000000, 0.00000000000) 
		emit_scale = 1 
		pos_offset = VECTOR(0.00000000000, -5.00000000000, 0.00000000000) 
		base_vel = 600 
		min_vel_range = 6 
		max_vel_range = 8 
		base_emit_rate = 15 
	} 
	max = 5 
	type = Flat 
	texture = apm_debis_Quad01 
	blendMode = Blend 
	useGlobalColorModulation 
	update_Brightness 
	priority = 0 
} 
SCRIPT emit_APM_Gravel01_particle 
	setEmitRange width = 1.00000000000 height = 1.00000000000 depth = 0.00000000000 
	setLife min = 0.20000000298 max = 0.30000001192 
	setAngleSpread spread = 0.37000000477 
	setSpeedRange min = 1.00000000000 max = 1.00000000000 
	setEmitTarget x = 0.00000000000 y = 1.00000000000 z = 0.00000000000 
	setForce x = 0.00000000000 y = -0.60000002384 z = 0.00000000000 
	setParticleSize sw = 15.00000000000 ew = 15.00000000000 
	setColor corner = 0 sr = 77 sg = 73 sb = 70 sa = 255 mr = 138 mg = 136 mb = 130 ma = 255 er = 95 eg = 93 eb = 88 ea = 108 midTime = 0.62999999523 
	emitRate rate = 15.00000000000 
ENDSCRIPT

APM_VEH_SPARKS01_particle_params = { 
	boneOffset = VECTOR(0.00000000000, 0.00000000000, -15.00000000000) 
	emitScript = emit_APM_VEH_SPARKS01_particle 
	updateScript = align_scale_to_vel_update 
	params = { 
		bone = Bone_Board_Tail 
		update_pos = 0 
		emit_offset = VECTOR(0.00000000000, 1.00000000000, 0.00000000000) 
		emit_scale = -1.00000000000 
		pos_offset = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		base_vel = 500 
		min_vel_range = 6 
		max_vel_range = 8 
		base_emit_rate = 30 
	} 
	max = 15 
	type = FlatRibbonTail 
	texture = apm_spark_01 
	blendMode = Add 
	history = 3 
	priority = 0 
} 
SCRIPT emit_APM_VEH_SPARKS01_particle 
	setEmitRange width = 5.00000000000 height = 5.00000000000 depth = 0.00000000000 
	setLife min = 0.15000000596 max = 0.30000001192 
	setAngleSpread spread = 0.37000000477 
	setSpeedRange min = 3.00000000000 max = 4.00000000000 
	setEmitTarget x = 0.00000000000 y = 1.00000000000 z = 0.00000000000 
	setForce x = 0.00000000000 y = -0.50000000000 z = 0.00000000000 
	setParticleSize sw = 1.00000000000 ew = 0.50000000000 
	setColor corner = 0 sr = 255 sg = 97 sb = 53 sa = 255 mr = 255 mg = 97 mb = 53 ma = 255 er = 255 eg = 20 eb = 0 ea = 0 midTime = 0.50999999046 
	setColor corner = 1 sr = 255 sg = 97 sb = 53 sa = 255 mr = 255 mg = 97 mb = 53 ma = 255 er = 255 eg = 20 eb = 0 ea = 0 midTime = 0.50999999046 
	setColor corner = 2 sr = 255 sg = 97 sb = 53 sa = 255 mr = 255 mg = 97 mb = 53 ma = 255 er = 255 eg = 20 eb = 0 ea = 0 midTime = 0.50999999046 
	setColor corner = 3 sr = 255 sg = 97 sb = 53 sa = 255 mr = 255 mg = 97 mb = 53 ma = 255 er = 255 eg = 20 eb = 0 ea = 0 midTime = 0.50999999046 
	setColor corner = 4 sr = 255 sg = 97 sb = 53 sa = 255 mr = 255 mg = 97 mb = 53 ma = 255 er = 255 eg = 20 eb = 0 ea = 0 midTime = 0.50999999046 
	emitRate rate = 60.00000000000 
	wait 10.00000000000 seconds 
	emitRate rate = 0 
	destroy ifEmpty = 1 
ENDSCRIPT

APM_flamingBOARD_particle_params = { 
	bone = Bone_Board_Root 
	boneOffset = VECTOR(0.00000000000, 8.00000000000, 7.09999990463) 
	emitScript = emit_APM_flamingBOARD_particle 
	updateScript = align_to_vel_update 
	params = { 
		bone = Bone_Board_Root 
		update_pos = 0 
		emit_offset = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		emit_scale = -1.00000000000 
		pos_offset = VECTOR(0.00000000000, -2.00000000000, 0.00000000000) 
	} 
	max = 7 
	type = Shaded 
	texture = apm_flameQUAD_01 
	blendMode = Add 
	UseRandomUVQuadrants 
} 
SCRIPT emit_APM_flamingBOARD_particle 
	setEmitRange width = 0.00000000000 height = 0.00000000000 
	setLife min = 0.15000000596 max = 0.25999999046 
	setAngleSpread spread = 0.18333299458 
	setSpeedRange min = 0.10000000149 max = 4.00000000000 
	setEmitTarget x = 0.00000000000 y = 0.00000000000 z = 0.00000000000 
	setForce x = 0.00000000000 y = 0.46000000834 z = 0.00000000000 
	setParticleSize sw = 20.00000000000 ew = 0.00000000000 
	setColor sr = 55 sg = 104 sb = 255 sa = 15 mr = 255 mg = 132 mb = 53 ma = 255 er = 114 eg = 17 eb = 0 ea = 0 midTime = 0.51450002193 
	emitRate rate = 30.00000000000 
ENDSCRIPT

APM_flaming_HEAD_particle_params = { 
	bone = Bone_Head 
	boneOffset = VECTOR(0.00000000000, 0.00000000000, 9.19999980927) 
	emitScript = emit_APM_flaming_HEAD_particle 
	updateScript = align_to_vel_update 
	params = { 
		bone = Bone_Head 
		update_pos = 0 
		emit_offset = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		emit_scale = -1.00000000000 
		pos_offset = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
	} 
	max = 29 
	type = Shaded 
	texture = apm_flameQUAD_01 
	blendMode = Add 
	UseRandomUVQuadrants 
} 
SCRIPT emit_APM_flaming_HEAD_particle 
	setEmitRange width = 3.00000000000 height = 3.00000000000 
	setLife min = 0.15000000596 max = 0.25000000000 
	setAngleSpread spread = 0.18333299458 
	setSpeedRange min = 0.10000000149 max = 4.00000000000 
	setEmitTarget x = 0.00000000000 y = 0.00000000000 z = 0.00000000000 
	setForce x = 0.00000000000 y = 0.30000001192 z = 0.00000000000 
	setParticleSize sw = 15.00000000000 ew = 3.00000000000 
	setColor sr = 55 sg = 104 sb = 255 sa = 15 mr = 255 mg = 132 mb = 53 ma = 255 er = 114 eg = 17 eb = 0 ea = 0 midTime = 0.51450002193 
	emitRate rate = 30.00000000000 
ENDSCRIPT

JEG_CanFlameDur_particle_params = { 
	bone = Bone_Palm_R 
	boneOffset = VECTOR(0.00000000000, 7.00000000000, -7.00000000000) 
	EnableRotate 
	emitScript = emit_JEG_CanFlameDur_particle 
	emitterIndependent = 1 
	max = 18 
	type = Flat 
	texture = apm_spray_01 
	blendMode = Add 
	priority = 0 
} 
JEG_CanFlameDur_particle_params2 = { 
	bone = Bone_Palm_L 
	boneOffset = VECTOR(0.00000000000, 7.00000000000, -7.00000000000) 
	EnableRotate 
	emitScript = emit_JEG_CanFlameDur_particle 
	emitterIndependent = 1 
	max = 18 
	type = Flat 
	texture = apm_spray_01 
	blendMode = Add 
	priority = 0 
} 
SCRIPT emit_JEG_CanFlameDur_particle 
	setEmitRange width = 0.10000000149 height = 0.10000000149 depth = 0.00000000000 
	setCircularEmit circular = 1 
	setLife min = 0.10000000149 max = 0.30000001192 
	setAngleSpread spread = 0.01111099962 
	setSpeedRange min = 0.50000000000 max = 1.00000000000 
	setForce x = 0.00000000000 y = 0.00000000000 z = 0.00000000000 
	setParticleSize sw = 0.10000000149 ew = 25.00000000000 
	setColor corner = 0 sr = 37 sg = 96 sb = 247 sa = 255 er = 155 eg = 39 eb = 12 ea = 180 
	emitRate rate = 60.00000000000 
	wait 0.15000000596 seconds 
	emitRate rate = 0 
	destroy ifEmpty = 1 
ENDSCRIPT

JEG_CanFlame_particle_params = { 
	bone = Bone_Palm_R 
	boneOffset = VECTOR(0.00000000000, 7.00000000000, -7.00000000000) 
	EnableRotate 
	emitScript = emit_JEG_CanFlame_particle 
	emitterIndependent = 1 
	max = 18 
	type = Flat 
	texture = apm_spray_01 
	blendMode = Add 
	priority = 0 
} 
JEG_CanFlame_particle_params2 = { 
	bone = Bone_Palm_L 
	boneOffset = VECTOR(0.00000000000, 7.00000000000, -7.00000000000) 
	EnableRotate 
	emitScript = emit_JEG_CanFlame_particle 
	emitterIndependent = 1 
	max = 18 
	type = Flat 
	texture = apm_spray_01 
	blendMode = Add 
	priority = 0 
} 
SCRIPT emit_JEG_CanFlame_particle 
	setEmitRange width = 0.10000000149 height = 0.10000000149 depth = 0.00000000000 
	setCircularEmit circular = 1 
	setLife min = 0.10000000149 max = 0.30000001192 
	setAngleSpread spread = 0.01111099962 
	setSpeedRange min = 0.50000000000 max = 1.00000000000 
	setForce x = 0.00000000000 y = 0.00000000000 z = 0.00000000000 
	setParticleSize sw = 0.10000000149 ew = 25.00000000000 
	setColor corner = 0 sr = 37 sg = 96 sb = 247 sa = 255 er = 232 eg = 68 eb = 11 ea = 180 
	emitRate rate = 60.00000000000 
ENDSCRIPT

JEG_FartBurst_particle_params = { 
	bone = Bone_Pelvis 
	boneOffset = VECTOR(0.00000000000, 7.00000000000, -7.00000000000) 
	EnableRotate 
	emitScript = emit_JEG_FartBurst_particle 
	emitterIndependent = 1 
	max = 18 
	type = Flat 
	texture = apm_spray_01 
	blendMode = Add 
} 
SCRIPT emit_JEG_FartBurst_particle 
	setEmitRange width = 0.10000000149 height = 0.10000000149 depth = 0.00000000000 
	setCircularEmit circular = 1 
	setLife min = 0.10000000149 max = 0.30000001192 
	setAngleSpread spread = 0.01111099962 
	setSpeedRange min = 0.50000000000 max = 1.00000000000 
	setForce x = 0.00000000000 y = 0.00000000000 z = 0.00000000000 
	setParticleSize sw = 0.10000000149 ew = 25.00000000000 
	setColor sr = 234 sg = 115 sb = 36 sa = 255 er = 41 eg = 119 eb = 196 ea = 180 
	emitRate rate = 60.00000000000 
	wait 0.34999999404 seconds 
	emitRate rate = 0 
	destroy ifEmpty = 1 
ENDSCRIPT

JEG_Hoagie_particle_params = { 
	bone = Bone_Chin_Scale 
	boneOffset = VECTOR(0.00000000000, -8.00000000000, 0.00000000000) 
	emitScript = emit_JEG_Hoagie_particle 
	max = 10 
	type = Shaded 
	texture = apm_debis_01 
	blendMode = Blend 
	useGlobalColorModulation 
	update_Brightness 
	priority = 0 
} 
SCRIPT emit_JEG_Hoagie_particle 
	setEmitRange width = 10.00000000000 height = 0.00000000000 depth = 0.00000000000 
	setLife min = 0.10000000149 max = 0.40000000596 
	setAngleSpread spread = 0.33000001311 
	setSpeedRange min = 0.10000000149 max = 6.00000000000 
	setEmitTarget x = 0.00000000000 y = 1.00000000000 z = 0.00000000000 
	setForce x = 0.00000000000 y = -0.60000002384 z = 0.00000000000 
	setParticleSize sw = 5.00000000000 ew = 11.00000000000 
	setColor corner = 0 sr = 236 sg = 234 sb = 81 sa = 255 er = 105 eg = 74 eb = 37 ea = 191 
	setColor corner = 1 sr = 236 sg = 234 sb = 81 sa = 255 er = 105 eg = 74 eb = 37 ea = 191 
	setColor corner = 2 sr = 236 sg = 234 sb = 81 sa = 255 er = 105 eg = 74 eb = 37 ea = 191 
	setColor corner = 3 sr = 236 sg = 234 sb = 81 sa = 255 er = 105 eg = 74 eb = 37 ea = 191 
	emitRate rate = 25.00000000000 
ENDSCRIPT

JEG_ShrekBurp_particle_params = { 
	bone = Bone_Chin_Scale 
	EnableRotate 
	angles = VECTOR(0.00000000000, 2.00000000000, 0.00000000000) 
	emitScript = emit_JEG_ShrekBurp_particle 
	emitterIndependent = 1 
	max = 10 
	type = Flat 
	texture = apm_spray_01 
	blendMode = Blend 
	useGlobalColorModulation 
	priority = 0 
} 
SCRIPT emit_JEG_ShrekBurp_particle 
	setEmitRange width = 5.00000000000 height = 5.00000000000 depth = 0.00000000000 
	setLife min = 0.75000000000 max = 1.00000000000 
	setAngleSpread spread = 0.33000001311 
	setSpeedRange min = 0.75000000000 max = 1.75000000000 
	setEmitAngle x = 90.00000000000 y = 0.00000000000 z = 315.00000000000 
	setForce x = 0.00000000000 y = -0.00999999978 z = 0.00000000000 
	setParticleSize sw = 24.00000000000 ew = 48.00000000000 
	setColor corner = 0 sr = 91 sg = 128 sb = 41 sa = 106 mr = 34 mg = 94 mb = 30 ma = 255 er = 43 eg = 110 eb = 136 ea = 0 midTime = 0.30000001192 
	setLODParams min_particles = 0 lod_dist1 = Default_Particle_LOD_Dist1 lod_dist2 = Default_Particle_LOD_Dist2 
	emitRate rate = 10.00000000000 
	wait 0.50000000000 seconds 
	emitRate rate = 0 
	destroy ifEmpty = 1 
ENDSCRIPT

JEG_Spin_particle_params = { 
	bone = Bone_Neck 
	EnableRotate 
	emitScript = emit_JEG_Spin_particle 
	emitterIndependent = 1 
	max = 30 
	type = Shaded 
	texture = apm_ring_01 
	blendMode = Add 
	align_to = VECTOR(0.00000000000, 1.00000000000, 0.00000000000) 
	useGlobalColorModulation 
	priority = 0 
} 
SCRIPT emit_JEG_Spin_particle 
	setEmitRange width = 1.00000000000 height = 1.00000000000 depth = 0.00000000000 
	setCircularEmit circular = 1 
	setLife min = 0.50000000000 max = 0.50000000000 
	setAngleSpread spread = 0.25000000000 
	setSpeedRange min = 2.00000000000 max = 3.50000000000 
	setEmitAngle x = 0.00000000000 y = 0.00000000000 z = 90.00000000000 
	setForce x = 0.00000000000 y = 0.00000000000 z = 0.00000000000 
	setParticleSize sw = 35.00000000000 ew = 0.50000000000 
	setColor corner = 0 sr = 210 sg = 227 sb = 227 sa = 255 er = 173 eg = 178 eb = 245 ea = 0 
	setColor corner = 1 sr = 210 sg = 227 sb = 227 sa = 255 er = 173 eg = 178 eb = 245 ea = 0 
	setColor corner = 2 sr = 210 sg = 227 sb = 227 sa = 255 er = 173 eg = 178 eb = 245 ea = 0 
	setColor corner = 3 sr = 210 sg = 227 sb = 227 sa = 255 er = 173 eg = 178 eb = 245 ea = 0 
	setLODParams min_particles = 0 lod_dist1 = Default_Particle_LOD_Dist1 lod_dist2 = Default_Particle_LOD_Dist2 
	emitRate rate = 60.00000000000 
	wait 0.50000000000 seconds 
	emitRate rate = 0 
	destroy ifEmpty = 1 
ENDSCRIPT

JEG_SprayBlue_particle_params = { 
	bone = Bone_Fingers_Tip_L 
	emitScript = emit_JEG_SprayBlue_particle 
	emitterIndependent = 1 
	FillPath 
	max = 24 
	type = Flat 
	texture = apm_spray_01 
	blendMode = Blend 
	useGlobalColorModulation 
	priority = 0 
} 
SCRIPT emit_JEG_SprayBlue_particle 
	setEmitRange width = 1.00000000000 height = 1.00000000000 depth = 0.00000000000 
	setLife min = 0.30000001192 max = 0.40000000596 
	setAngleSpread spread = 0.11999999732 
	setSpeedRange min = 1.00000000000 max = 3.00000000000 
	setEmitTarget x = 0.00000000000 y = 1.00000000000 z = 0.00000000000 
	setForce x = 0.00000000000 y = 0.00000000000 z = 0.00000000000 
	setParticleSize sw = 8.00000000000 ew = 20.00000000000 
	setColor corner = 0 sr = 240 sg = 238 sb = 253 sa = 125 mr = 143 mg = 192 mb = 201 ma = 251 er = 44 eg = 40 eb = 209 ea = 0 midTime = 0.20000000298 
	emitRate rate = 60.00000000000 
	wait 3.50000000000 seconds 
	emitRate rate = 0 
	destroy ifEmpty = 1 
ENDSCRIPT

JEG_SprayRed_particle_params = { 
	bone = Bone_Fingers_Tip_R 
	emitScript = emit_JEG_SprayRed_particle 
	emitterIndependent = 1 
	FillPath 
	max = 24 
	type = Flat 
	texture = apm_spray_01 
	blendMode = Blend 
	useGlobalColorModulation 
	priority = 0 
} 
SCRIPT emit_JEG_SprayRed_particle 
	setEmitRange width = 1.00000000000 height = 1.00000000000 depth = 0.00000000000 
	setLife min = 0.30000001192 max = 0.40000000596 
	setAngleSpread spread = 0.11999999732 
	setSpeedRange min = 1.00000000000 max = 3.00000000000 
	setEmitTarget x = 0.00000000000 y = 1.00000000000 z = 0.00000000000 
	setForce x = 0.00000000000 y = 0.00000000000 z = 0.00000000000 
	setParticleSize sw = 8.00000000000 ew = 20.00000000000 
	setColor corner = 0 sr = 240 sg = 238 sb = 253 sa = 125 mr = 206 mg = 154 mb = 206 ma = 251 er = 202 eg = 27 eb = 13 ea = 0 midTime = 0.20000000298 
	emitRate rate = 60.00000000000 
	wait 3.50000000000 seconds 
	emitRate rate = 0 
	destroy ifEmpty = 1 
ENDSCRIPT

JEG_TireSmoke_particle_params = { 
	bone = Bone_Board_Root 
	boneOffset = VECTOR(0.00000000000, 0.00000000000, -10.00000000000) 
	emitScript = emit_JEG_TireSmoke_particle 
	emitterIndependent = 1 
	max = 128 
	type = Flat 
	texture = apm_spray_01 
	blendMode = Blend 
	useGlobalColorModulation 
	priority = 0 
} 
SCRIPT emit_JEG_TireSmoke_particle 
	setEmitRange width = 1.00000000000 height = 1.00000000000 depth = 0.00000000000 
	setLife min = 0.50000000000 max = 0.80000001192 
	setAngleSpread spread = 0.11999999732 
	setSpeedRange min = 1.00000000000 max = 3.00000000000 
	setEmitTarget x = 0.00000000000 y = 1.00000000000 z = 0.00000000000 
	setForce x = 0.00000000000 y = 0.01999999955 z = 0.00000000000 
	setParticleSize sw = 5.00000000000 ew = 90.00000000000 
	setColor corner = 0 sr = 197 sg = 208 sb = 221 sa = 125 mr = 97 mg = 97 mb = 97 ma = 251 er = 7 eg = 10 eb = 26 ea = 0 midTime = 0.00999999978 
	emitRate rate = 30.00000000000 
	wait 1.79999995232 seconds 
	emitRate rate = 0 
	destroy ifEmpty = 1 
ENDSCRIPT

apm_Boardslide01_particle_params = { 
	id = skater 
	boneOffset = VECTOR(0.00000000000, 0.00000000000, -3.00000000000) 
	emitScript = emit_apm_Boardslide01_particle 
	updateScript = align_scale_to_vel_update 
	params = { 
		bone = Bone_Board_Root 
		update_pos = 0 
		emit_offset = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		emit_scale = -1.00000000000 
		pos_offset = VECTOR(0.00000000000, -10.00000000000, 0.00000000000) 
		base_vel = 500.00000000000 
		min_vel_range = 3 
		max_vel_range = 3 
		base_emit_rate = 30 
	} 
	max = 15 
	type = Flat 
	texture = apm_spray_01 
	blendMode = Blend 
	useGlobalColorModulation 
	update_Brightness objID = skater 
	priority = 0 
} 
SCRIPT emit_apm_Boardslide01_particle 
	setEmitRange width = 1.00000000000 height = 1.00000000000 depth = 1.00000000000 
	setLife min = 0.20000000298 max = 0.20000000298 
	setAngleSpread spread = 0.18000000715 
	setSpeedRange min = 6.00000000000 max = 6.00000000000 
	setEmitTarget x = 0.00000000000 y = 0.00000000000 z = 0.00000000000 
	setForce x = 0.00000000000 y = 0.01999999955 z = 0.00000000000 
	setParticleSize sw = 10.00000000000 ew = 1.00000000000 
	setColor corner = 0 sr = 128 sg = 128 sb = 128 sa = 128 er = 102 eg = 101 eb = 98 ea = 0 
	emitRate rate = 15.00000000000 
ENDSCRIPT

apm_Grass01_particle_params = { 
	id = skater 
	emitScript = emit_apm_Grass01_particle 
	emitterIndependent = 1 
	FillPath 
	updateScript = align_scale_to_vel_update 
	params = { 
		bone = Bone_Board_Root 
		update_pos = 0 
		emit_offset = VECTOR(0.00000000000, 2.50000000000, 0.00000000000) 
		emit_scale = 1 
		pos_offset = VECTOR(0.00000000000, -2.00000000000, 0.00000000000) 
		base_vel = 100 
		min_vel_range = 1 
		max_vel_range = 1.25000000000 
		base_emit_rate = 40 
	} 
	max = 20 
	type = Ribbon 
	texture = apm_grass01 
	blendMode = Blend 
	history = 2 
	useGlobalColorModulation 
	update_Brightness objID = skater 
	priority = 0 
} 
SCRIPT emit_apm_Grass01_particle 
	setEmitRange width = 10.00000000000 height = 40.00000000000 depth = 0.00000000000 
	setLife min = 0.20000000298 max = 0.50000000000 
	setAngleSpread spread = 0.70999997854 
	setSpeedRange min = 0.10000000149 max = 0.10000000149 
	setEmitTarget x = 0.00000000000 y = 0.00000000000 z = 0.00000000000 
	setForce x = 0.00000000000 y = -0.44999998808 z = 0.00000000000 
	setParticleSize sw = 5.00000000000 ew = 4.00000000000 
	setColor corner = 0 sr = 57 sg = 64 sb = 44 sa = 255 mr = 83 mg = 97 mb = 52 ma = 255 er = 66 eg = 77 eb = 39 ea = 255 midTime = 0.50000000000 
	setColor corner = 1 sr = 57 sg = 64 sb = 44 sa = 255 mr = 83 mg = 97 mb = 52 ma = 255 er = 66 eg = 77 eb = 39 ea = 255 midTime = 0.50000000000 
	emitRate rate = 40.00000000000 
ENDSCRIPT

apm_OILYsmoke_particle_params = { 
	bone = Bone_Board_Root 
	boneOffset = VECTOR(0.00000000000, 15.00000000000, 22.00000000000) 
	emitScript = emit_apm_OILYsmoke_particle 
	emitterIndependent = 1 
	FillPath 
	max = 24 
	type = Flat 
	texture = apm_spray_01 
	blendMode = Blend 
	useGlobalColorModulation 
	priority = 0 
} 
SCRIPT emit_apm_OILYsmoke_particle 
	setEmitRange width = 1.00000000000 height = 1.00000000000 depth = 0.00000000000 
	setLife min = 0.30000001192 max = 0.80000001192 
	setAngleSpread spread = 0.12222199887 
	setSpeedRange min = 1.00000000000 max = 3.00000000000 
	setEmitTarget x = 0.00000000000 y = 1.00000000000 z = 0.00000000000 
	setForce x = 0.00000000000 y = 0.01999999955 z = 0.00000000000 
	setParticleSize sw = 10.00000000000 ew = 20.00000000000 
	setColor corner = 0 sr = 41 sg = 46 sb = 48 sa = 125 mr = 31 mg = 31 mb = 31 ma = 251 er = 40 eg = 40 eb = 40 ea = 0 midTime = 0.20000000298 
	emitRate rate = 30.00000000000 
ENDSCRIPT

apm_Skater_splash01_particle_params = { 
	boneOffset = VECTOR(0.00000000000, 20.00000000000, 0.00000000000) 
	emitScript = emit_apm_Skater_splash01_particle 
	max = 18 
	type = Shaded 
	texture = BA_APM_SoftSGrade01 
	blendMode = Blend 
	align_to = VECTOR(0.00000000000, 1.00000000000, 0.00000000000) 
	useGlobalColorModulation 
	priority = 0 
} 
SCRIPT emit_apm_Skater_splash01_particle 
	setEmitRange width = 1.00000000000 height = 1.00000000000 depth = 0.00000000000 
	setLife min = 1.00000000000 max = 2.00000000000 
	setAngleSpread spread = 0.25000000000 
	setSpeedRange min = 0.02999999933 max = 0.02999999933 
	setEmitTarget x = 0.00000000000 y = 0.00000000000 z = 0.00000000000 
	setForce x = 0.00000000000 y = 0.00000000000 z = 0.00000000000 
	setParticleSize sw = 10.00000000000 ew = 150.00000000000 
	setColor corner = 0 sr = 117 sg = 117 sb = 117 sa = 130 mr = 117 mg = 117 mb = 117 ma = 28 er = 117 eg = 117 eb = 117 ea = 0 midTime = 0.41999998689 
	setColor corner = 1 sr = 117 sg = 117 sb = 117 sa = 130 mr = 117 mg = 117 mb = 117 ma = 28 er = 117 eg = 117 eb = 117 ea = 0 midTime = 0.41999998689 
	setColor corner = 2 sr = 117 sg = 117 sb = 117 sa = 130 mr = 117 mg = 117 mb = 117 ma = 28 er = 117 eg = 117 eb = 117 ea = 0 midTime = 0.41999998689 
	setColor corner = 3 sr = 117 sg = 117 sb = 117 sa = 130 mr = 117 mg = 117 mb = 117 ma = 28 er = 117 eg = 117 eb = 117 ea = 0 midTime = 0.41999998689 
	emitRate rate = 9.00000000000 
	wait 1.00000000000 seconds 
	emitRate rate = 0 
	destroy ifEmpty = 1 
ENDSCRIPT

apm_dirt_puff01_particle_params = { 
	id = skater 
	boneOffset = VECTOR(0.00000000000, 5.00000000000, 20.00000000000) 
	emitScript = emit_apm_dirt_puff01_particle 
	emitterIndependent = 1 
	FillPath 
	updateScript = align_scale_to_vel_update 
	params = { 
		bone = Bone_Board_Tail 
		update_pos = 0 
		emit_offset = VECTOR(0.00000000000, 0.50000000000, 0.00000000000) 
		emit_scale = -1.00000000000 
		pos_offset = VECTOR(0.00000000000, -2.00000000000, 0.00000000000) 
		base_vel = 600 
		min_vel_range = 2 
		max_vel_range = 3 
		base_emit_rate = 30 
	} 
	max = 18 
	type = Flat 
	texture = apm_spray_01 
	blendMode = Blend 
	useGlobalColorModulation 
	priority = 0 
} 
SCRIPT emit_apm_dirt_puff01_particle 
	setEmitRange width = 5.00000000000 height = 5.00000000000 depth = 0.00000000000 
	setLife min = 0.20000000298 max = 0.30000001192 
	setAngleSpread spread = 0.17000000179 
	setSpeedRange min = 5.00000000000 max = 5.00000000000 
	setEmitTarget x = 0.00000000000 y = 1.00000000000 z = 0.00000000000 
	setForce x = 0.00000000000 y = 0.07999999821 z = 0.00000000000 
	setParticleSize sw = 30.00000000000 ew = 10.00000000000 
	setColor corner = 0 sr = 64 sg = 55 sb = 45 sa = 0 mr = 77 mg = 68 mb = 58 ma = 255 er = 89 eg = 79 eb = 67 ea = 255 midTime = 0.50000000000 
	emitRate rate = 60.00000000000 
ENDSCRIPT

apm_dirt_puff02_particle_params = { 
	emitScript = emit_apm_dirt_puff02_particle 
	emitterIndependent = 1 
	max = 9 
	type = Flat 
	texture = apm_spray_01 
	blendMode = Blend 
	useGlobalColorModulation 
	update_Brightness objID = skater 
	priority = 0 
} 
SCRIPT emit_apm_dirt_puff02_particle 
	setEmitRange width = 5.00000000000 height = 5.00000000000 depth = 0.00000000000 
	setLife min = 0.30000001192 max = 0.30000001192 
	setAngleSpread spread = 0.17000000179 
	setSpeedRange min = 1.00000000000 max = 1.00000000000 
	setEmitTarget x = 0.00000000000 y = 1.00000000000 z = 0.00000000000 
	setForce x = 0.00000000000 y = 0.00999999978 z = 0.00000000000 
	setParticleSize sw = 10.00000000000 ew = 20.00000000000 
	setColor corner = 0 sr = 102 sg = 88 sb = 72 sa = 255 er = 102 eg = 95 eb = 76 ea = 0 
	emitRate rate = 30.00000000000 
	wait 0.20000000298 seconds 
	emitRate rate = 0 
	destroy ifEmpty = 1 
ENDSCRIPT

apm_sand_puff01_particle_params = { 
	boneOffset = VECTOR(0.00000000000, 5.00000000000, 20.00000000000) 
	emitScript = emit_apm_sand_puff01_particle 
	emitterIndependent = 1 
	FillPath 
	updateScript = align_scale_to_vel_update 
	params = { 
		bone = Bone_Board_Tail 
		update_pos = 0 
		emit_offset = VECTOR(0.00000000000, 0.50000000000, 0.00000000000) 
		emit_scale = -1.00000000000 
		pos_offset = VECTOR(0.00000000000, -2.00000000000, 0.00000000000) 
		base_vel = 600 
		min_vel_range = 2 
		max_vel_range = 3 
		base_emit_rate = 30 
	} 
	max = 12 
	type = Flat 
	texture = apm_spray_01 
	blendMode = Blend 
	useGlobalColorModulation 
	update_Brightness objID = skater 
	priority = 0 
} 
SCRIPT emit_apm_sand_puff01_particle 
	setEmitRange width = 5.00000000000 height = 5.00000000000 depth = 0.00000000000 
	setLife min = 0.20000000298 max = 0.30000001192 
	setAngleSpread spread = 0.17000000179 
	setSpeedRange min = 5.00000000000 max = 5.00000000000 
	setEmitTarget x = 0.00000000000 y = 1.00000000000 z = 0.00000000000 
	setForce x = 0.00000000000 y = 0.05000000075 z = 0.00000000000 
	setParticleSize sw = 30.00000000000 ew = 10.00000000000 
	setColor corner = 0 sr = 128 sg = 119 sb = 95 sa = 0 mr = 110 mg = 102 mb = 82 ma = 215 er = 102 eg = 95 eb = 76 ea = 0 midTime = 0.50000000000 
	emitRate rate = 60.00000000000 
ENDSCRIPT

apm_sand_puff02_particle_params = { 
	emitScript = emit_apm_sand_puff02_particle 
	emitterIndependent = 1 
	max = 9 
	type = Flat 
	texture = apm_spray_01 
	blendMode = Blend 
	useGlobalColorModulation 
	update_Brightness objID = skater 
	priority = 0 
} 
SCRIPT emit_apm_sand_puff02_particle 
	setEmitRange width = 5.00000000000 height = 5.00000000000 depth = 0.00000000000 
	setLife min = 0.30000001192 max = 0.30000001192 
	setAngleSpread spread = 0.17000000179 
	setSpeedRange min = 1.00000000000 max = 1.00000000000 
	setEmitTarget x = 0.00000000000 y = 1.00000000000 z = 0.00000000000 
	setForce x = 0.00000000000 y = 0.00999999978 z = 0.00000000000 
	setParticleSize sw = 10.00000000000 ew = 20.00000000000 
	setColor corner = 0 sr = 128 sg = 120 sb = 83 sa = 255 er = 102 eg = 95 eb = 76 ea = 0 
	emitRate rate = 30.00000000000 
	wait 0.20000000298 seconds 
	emitRate rate = 0 
	destroy ifEmpty = 1 
ENDSCRIPT

apm_splinter01_particle_params = { 
	boneOffset = VECTOR(0.00000000000, -2.09999990463, 0.00000000000) 
	emitScript = emit_apm_splinter01_particle 
	updateScript = align_scale_to_vel_update 
	params = { 
		bone = Bone_Board_Root 
		update_pos = 0 
		emit_offset = VECTOR(0.00000000000, 1.00000000000, 0.00000000000) 
		emit_scale = -1.00000000000 
		pos_offset = VECTOR(0.00000000000, -2.00000000000, 0.00000000000) 
		base_vel = 600 
		min_vel_range = 6 
		max_vel_range = 8 
		base_emit_rate = 30.00000000000 
	} 
	max = 12 
	type = Ribbon 
	texture = apm_splinters_01 
	blendMode = Blend 
	history = 2 
	useGlobalColorModulation 
	update_Brightness objID = skater 
	priority = 0 
} 
SCRIPT emit_apm_splinter01_particle 
	setEmitRange width = 0.00000000000 height = 0.00000000000 depth = 0.00000000000 
	setLife min = 0.10000000149 max = 0.40000000596 
	setAngleSpread spread = 0.38999998569 
	setSpeedRange min = 3.00000000000 max = 4.00000000000 
	setEmitTarget x = 0.00000000000 y = 0.00000000000 z = 0.00000000000 
	setForce x = 0.00000000000 y = -0.40000000596 z = 0.00000000000 
	setParticleSize sw = 5.00000000000 ew = 10.00000000000 
	setColor corner = 0 sr = 84 sg = 80 sb = 74 sa = 255 mr = 156 mg = 148 mb = 128 ma = 255 er = 84 eg = 80 eb = 74 ea = 255 midTime = 0.50000000000 
	setColor corner = 1 sr = 84 sg = 80 sb = 74 sa = 255 mr = 156 mg = 148 mb = 128 ma = 255 er = 84 eg = 80 eb = 74 ea = 255 midTime = 0.50000000000 
	emitRate rate = 30.00000000000 
ENDSCRIPT

apm_spray03_particle_params = { 
	bone = Bone_Palm_L 
	boneOffset = VECTOR(0.00000000000, 0.00000000000, -7.30000019073) 
	EnableRotate 
	angles = VECTOR(100.00000000000, 0.00000000000, 0.00000000000) 
	emitScript = emit_apm_spray03_particle 
	emitterIndependent = 1 
	max = 6 
	type = Shaded 
	texture = apm_spray_01 
	blendMode = Blend 
	useGlobalColorModulation 
	update_Brightness 
	priority = 0 
} 
SCRIPT emit_apm_spray03_particle 
	setEmitRange width = 0.25000000000 height = 0.25000000000 depth = 0.00000000000 
	setLife min = 0.10000000149 max = 0.50000000000 
	setAngleSpread spread = 0.16666699946 
	setSpeedRange min = 0.00000000000 max = 0.20000000298 
	setForce x = 0.00000000000 y = 0.07999999821 z = 0.00000000000 
	setParticleSize sw = 10.00000000000 ew = 20.00000000000 
	setColor sr = 115 sg = 120 sb = 128 sa = 255 er = 92 eg = 97 eb = 102 ea = 0 
	emitRate rate = 30.00000000000 
ENDSCRIPT

apm_water_wake01_particle_params = { 
	boneOffset = VECTOR(0.00000000000, 2.00000000000, 0.00000000000) 
	emitScript = emit_apm_water_wake01_particle 
	emitterIndependent = 1 
	FillPath 
	max = 3 
	type = Shaded 
	texture = BA_APM_SoftSGrade01 
	blendMode = Blend 
	align_to = VECTOR(0.00000000000, 1.00000000000, 0.00000000000) 
	useGlobalColorModulation 
	priority = 0 
} 
SCRIPT emit_apm_water_wake01_particle 
	setEmitRange width = 0.00000000000 height = 0.00000000000 depth = 0.00000000000 
	setLife min = 0.50000000000 max = 0.75000000000 
	setAngleSpread spread = 0.31000000238 
	setSpeedRange min = 0.10000000149 max = 0.10000000149 
	setEmitTarget x = 0.00000000000 y = 0.00000000000 z = 0.00000000000 
	setForce x = 0.00000000000 y = 0.00000000000 z = 0.00000000000 
	setParticleSize sw = 5.00000000000 ew = 33.00000000000 
	setColor corner = 0 sr = 198 sg = 198 sb = 198 sa = 38 mr = 182 mg = 182 mb = 182 ma = 26 er = 125 eg = 128 eb = 117 ea = 0 midTime = 0.49000000954 
	setColor corner = 1 sr = 198 sg = 198 sb = 198 sa = 38 mr = 182 mg = 182 mb = 182 ma = 26 er = 125 eg = 128 eb = 117 ea = 0 midTime = 0.49000000954 
	setColor corner = 2 sr = 198 sg = 198 sb = 198 sa = 38 mr = 182 mg = 182 mb = 182 ma = 26 er = 125 eg = 128 eb = 117 ea = 0 midTime = 0.49000000954 
	setColor corner = 3 sr = 198 sg = 198 sb = 198 sa = 38 mr = 182 mg = 182 mb = 182 ma = 26 er = 125 eg = 128 eb = 117 ea = 0 midTime = 0.49000000954 
	emitRate rate = 15.00000000000 
	wait 0.30000001192 seconds 
	emitRate rate = 0 
	destroy ifEmpty = 1 
ENDSCRIPT

apm_water_wake02_particle_params = { 
	bone = Bone_Board_Root 
	boneOffset = VECTOR(0.00000000000, 0.00000000000, 4.00000000000) 
	emitScript = emit_apm_water_wake02_particle 
	emitterIndependent = 1 
	FillPath 
	updateScript = align_scale_to_vel_update 
	params = { 
		bone = Bone_Board_Tail 
		update_pos = 0 
		emit_offset = VECTOR(0.00000000000, 0.50000000000, 0.00000000000) 
		emit_scale = 1.00000000000 
		pos_offset = VECTOR(0.00000000000, -2.00000000000, 0.00000000000) 
		base_vel = 800.00000000000 
		min_vel_range = 4 
		max_vel_range = 8 
		base_emit_rate = 23 
	} 
	max = 26 
	type = Flat 
	texture = APM_water_splash01 
	blendMode = Blend 
	useGlobalColorModulation 
	priority = 0 
} 
SCRIPT emit_apm_water_wake02_particle 
	setEmitRange width = 10.00000000000 height = 1.00000000000 depth = 1.00000000000 
	setCircularEmit circular = 1 
	setLife min = 0.20000000298 max = 0.40000000596 
	setAngleSpread spread = 0.48888900876 
	setSpeedRange min = 8.69999980927 max = 8.69999980927 
	setEmitTarget x = 0.00000000000 y = 1.00000000000 z = 0.00000000000 
	setForce x = 0.00000000000 y = -0.27000001073 z = 0.00000000000 
	setParticleSize sw = 7.00000000000 ew = 2.00000000000 
	setColor sr = 219 sg = 229 sb = 229 sa = 255 mr = 223 mg = 233 mb = 233 ma = 255 er = 199 eg = 211 eb = 213 ea = 0 midTime = 0.29359999299 
	emitRate rate = 66.00000000000 
ENDSCRIPT

apm_water_wake03_particle_params = { 
	bone = Bone_Board_Root 
	boneOffset = VECTOR(0.00000000000, 0.00000000000, 3.00000000000) 
	emitScript = emit_apm_water_wake03_particle 
	emitterIndependent = 1 
	FillPath 
	updateScript = align_scale_to_vel_update 
	params = { 
		bone = Bone_Board_Root 
		update_pos = 0 
		emit_offset = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		emit_scale = -1.00000000000 
		pos_offset = VECTOR(0.00000000000, -2.00000000000, 0.00000000000) 
		base_vel = 800.00000000000 
		min_vel_range = 2 
		max_vel_range = 2 
		base_emit_rate = 30 
	} 
	max = 7 
	type = Shaded 
	texture = apm_fallingwater_01 
	blendMode = Brighten 
	align_to = VECTOR(0.00000000000, 1.00000000000, 0.00000000000) 
	priority = 0 
} 
SCRIPT emit_apm_water_wake03_particle 
	setEmitRange width = 1.70000004768 height = 4.40000009537 depth = 3.59999990463 
	setLife min = 0.20000000298 max = 0.20000000298 
	setAngleSpread spread = 0.13333299756 
	setSpeedRange min = 5.00000000000 max = 5.00000000000 
	setEmitTarget x = 0.00000000000 y = 0.00000000000 z = 0.00000000000 
	setForce x = 0.00000000000 y = 0.00000000000 z = 0.00000000000 
	setParticleSize sw = 12.00000000000 ew = 22.00000000000 
	setColor sr = 227 sg = 227 sb = 227 sa = 255 mr = 227 mg = 227 mb = 227 ma = 255 er = 125 eg = 128 eb = 117 ea = 0 midTime = 0.50000000000 
	emitRate rate = 33.00000000000 
ENDSCRIPT

cod_natas_particle_params = { 
	boneOffset = VECTOR(0.00000000000, 69.00000000000, 0.00000000000) 
	EnableRotate 
	emitScript = emit_cod_natas_particle 
	max = 30 
	type = Shaded 
	texture = apm_ring_02 
	blendMode = Add 
	priority = 0 
} 
SCRIPT emit_cod_natas_particle 
	setEmitRange width = 0.00000000000 height = 0.00000000000 depth = 0.00000000000 
	setLife min = 0.50000000000 max = 0.50000000000 
	setAngleSpread spread = 0.00000000000 
	setSpeedRange min = 0.00000000000 max = 0.00000000000 
	setForce x = 0.00000000000 y = 0.00000000000 z = 0.00000000000 
	setParticleSize sw = 10.00000000000 ew = 40.00000000000 
	setColor corner = 0 sr = 0 sg = 0 sb = 0 sa = 255 mr = 28 mg = 28 mb = 28 ma = 255 er = 0 eg = 0 eb = 0 ea = 86 midTime = 0.10999999940 
	setColor corner = 1 sr = 0 sg = 0 sb = 0 sa = 255 mr = 28 mg = 28 mb = 28 ma = 255 er = 0 eg = 0 eb = 0 ea = 86 midTime = 0.10999999940 
	setColor corner = 2 sr = 0 sg = 0 sb = 0 sa = 255 mr = 28 mg = 28 mb = 28 ma = 255 er = 0 eg = 0 eb = 0 ea = 86 midTime = 0.10999999940 
	setColor corner = 3 sr = 0 sg = 0 sb = 0 sa = 255 mr = 28 mg = 28 mb = 28 ma = 255 er = 0 eg = 0 eb = 0 ea = 86 midTime = 0.10999999940 
	emitRate rate = 30.00000000000 
ENDSCRIPT


