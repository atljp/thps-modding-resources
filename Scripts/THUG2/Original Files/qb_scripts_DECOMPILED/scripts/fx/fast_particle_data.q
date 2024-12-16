
SCRIPT load_permanent_fast_particle_textures 
	LoadParticleTexture "particles\\apm_spray_01" perm 
	LoadParticleTexture "particles\\apm_ring_02" perm 
	LoadParticleTexture "particles\\apm_debis_quad01" perm 
	LoadParticleTexture "particles\\dt_nj_waterdrop05" perm 
	LoadParticleTexture "particles\\apm_debis_01" perm 
	LoadParticleTexture "particles\\apm_flame_01" perm 
ENDSCRIPT

JOW_VehExhaust01_fast_particle_params = { 
	Class = ParticleObject 
	Type = NewFlat 
	CreatedAtStart 
	MaxStreams = 2 
	LocalSpace 
	EnableRotate 
	BoxDimsStart = VECTOR(3.00000000000, 3.00000000000, 3.00000000000) 
	BoxDimsMid = VECTOR(20.00000000000, 20.00000000000, 20.00000000000) 
	BoxDimsEnd = VECTOR(6.00000000000, 6.00000000000, 6.00000000000) 
	pos = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
	MidPosition = VECTOR(0.07999999821, 0.10000000149, -25.63999938965) 
	EndPosition = VECTOR(0.02999999933, 0.10000000149, -9.64999961853) 
	SuspendDistance = Default_Fast_Particle_Suspend_Dist 
	LOD_Dist1 = Default_Fast_Particle_LOD_Dist1 
	LOD_Dist2 = Default_Fast_Particle_LOD_Dist2 
	EmitRate = 10.00000000000 
	LifeTime = 0.30000001192 
	StartRadius = 3.00000000000 
	EndRadius = 8.00000000000 
	priority = 0 
	Texture = apm_spray_01 
	BlendMode = Blend 
	AlphaCutoff = 1 
	StartRGB = [ 37 , 37 , 37 ] 
	StartAlpha = 112 
	EndRGB = [ 46 , 46 , 46 ] 
	EndAlpha = 36 
	UseGlobalColorModulation 
} 
apm_ACID_DROP01_fast_particle_params = { 
	Class = ParticleObject 
	Type = NewFlat 
	CreatedAtStart 
	MaxStreams = 2 
	LocalSpace 
	EnableRotate 
	BoxDimsStart = VECTOR(10.00000000000, 0.00000000000, 10.00000000000) 
	BoxDimsMid = VECTOR(10.00000000000, 10.00000000000, 10.00000000000) 
	BoxDimsEnd = VECTOR(10.00000000000, 10.00000000000, 10.00000000000) 
	pos = VECTOR(0.00000000000, 30.00000000000, 0.00000000000) 
	MidPosition = VECTOR(0.00000000000, 30.00000000000, -1.00000000000) 
	EndPosition = VECTOR(0.00000000000, 30.00000000000, -100.00000000000) 
	UseMidPoint 
	SuspendDistance = Default_Fast_Particle_Suspend_Dist 
	LOD_Dist1 = 0.00000000000 
	LOD_Dist2 = 0.00000000000 
	EmitRate = 12.00000000000 
	LifeTime = 0.10000000149 
	EmitDuration = 0.50000000000 
	StartRadius = 20.00000000000 
	MidRadius = 150.00000000000 
	EndRadius = 0.00000000000 
	priority = 0 
	Texture = apm_ring_02 
	BlendMode = Blend 
	AlphaCutoff = 1 
	StartRGB = [ 128 , 128 , 128 ] 
	StartAlpha = 128 
	EndRGB = [ 189 , 189 , 189 ] 
	EndAlpha = 128 
	MidRGB = [ 194 , 194 , 194 ] 
	MidAlpha = 91 
	UseColorMidTime 
	ColorMidTime = 42 
	UpdateScript = fast_change_color 
	Params = { 
		endStartRGBA = [ 128 , 128 , 128 , 0 ] 
		endMidRGBA = [ 128 , 128 , 128 , 0 ] 
		endEndRGBA = [ 128 , 128 , 128 , 0 ] 
		delayStart = 0 
		changeTime = 0.50000000000 
		stepTime = 0.10000000149 
	} 
} 
apm_ACID_DROP02_fast_particle_params = { 
	Class = ParticleObject 
	Type = NewFlat 
	CreatedAtStart 
	MaxStreams = 2 
	LocalSpace 
	EnableRotate 
	BoxDimsStart = VECTOR(10.00000000000, 0.00000000000, 10.00000000000) 
	BoxDimsMid = VECTOR(10.00000000000, 10.00000000000, 10.00000000000) 
	BoxDimsEnd = VECTOR(10.00000000000, 10.00000000000, 10.00000000000) 
	pos = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
	MidPosition = VECTOR(0.00000000000, 0.00000000000, -1.00000000000) 
	EndPosition = VECTOR(0.00000000000, 30.00000000000, -100.00000000000) 
	UseMidPoint 
	SuspendDistance = Default_Fast_Particle_Suspend_Dist 
	LOD_Dist1 = 0.00000000000 
	LOD_Dist2 = 0.00000000000 
	EmitRate = 12.00000000000 
	LifeTime = 0.50000000000 
	EmitDuration = 3.00000000000 
	StartRadius = 20.00000000000 
	MidRadius = 50.00000000000 
	EndRadius = 30.00000000000 
	priority = 0 
	Texture = apm_spray_01 
	BlendMode = Blend 
	AlphaCutoff = 1 
	StartRGB = [ 51 , 46 , 41 ] 
	StartAlpha = 128 
	EndRGB = [ 102 , 90 , 82 ] 
	EndAlpha = 128 
	MidRGB = [ 77 , 68 , 62 ] 
	MidAlpha = 128 
	UseColorMidTime 
	ColorMidTime = 42 
	UseGlobalColorModulation 
	Update_Brightness_From = skater 
	UpdateScript = fast_change_color 
	Params = { 
		endStartRGBA = [ 80 , 75 , 70 , 0 ] 
		endMidRGBA = [ 80 , 75 , 70 , 0 ] 
		endEndRGBA = [ 80 , 75 , 70 , 0 ] 
		delayStart = 0 
		changeTime = 2 
		stepTime = 0.10000000149 
	} 
} 
apm_ACID_DROP03_fast_particle_params = { 
	Class = ParticleObject 
	Type = NewFlat 
	CreatedAtStart 
	MaxStreams = 2 
	LocalSpace 
	EnableRotate 
	BoxDimsStart = VECTOR(10.00000000000, 20.00000000000, 10.00000000000) 
	BoxDimsMid = VECTOR(60.00000000000, 10.00000000000, 60.00000000000) 
	BoxDimsEnd = VECTOR(75.00000000000, 10.00000000000, 75.00000000000) 
	pos = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
	MidPosition = VECTOR(0.00000000000, 30.00000000000, -1.00000000000) 
	EndPosition = VECTOR(0.00000000000, 0.00000000000, -100.00000000000) 
	UseMidPoint 
	SuspendDistance = Default_Fast_Particle_Suspend_Dist 
	LOD_Dist1 = 0.00000000000 
	LOD_Dist2 = 0.00000000000 
	EmitRate = 15.00000000000 
	LifeTime = 0.30000001192 
	EmitDuration = 1.00000000000 
	StartRadius = 20.00000000000 
	MidRadius = 20.00000000000 
	EndRadius = 20.00000000000 
	StartRadiusSpread = 10.00000000000 
	MidRadiusSpread = 10.00000000000 
	EndRadiusSpread = 10.00000000000 
	priority = 0 
	Texture = apm_debis_Quad01 
	BlendMode = Blend 
	AlphaCutoff = 1 
	StartRGB = [ 77 , 77 , 77 ] 
	StartAlpha = 128 
	EndRGB = [ 128 , 128 , 128 ] 
	EndAlpha = 128 
	MidRGB = [ 102 , 102 , 102 ] 
	MidAlpha = 128 
	UseColorMidTime 
	ColorMidTime = 42 
	UseGlobalColorModulation 
	Update_Brightness_From = skater 
	UpdateScript = fast_change_color 
	Params = { 
		endStartRGBA = [ 128 , 128 , 128 , 0 ] 
		endMidRGBA = [ 128 , 128 , 128 , 0 ] 
		endEndRGBA = [ 128 , 128 , 128 , 0 ] 
		delayStart = 0 
		changeTime = 1 
		stepTime = 0.10000000149 
	} 
} 
apm_DirtFootstep01_fast_particle_params = { 
	Class = ParticleObject 
	Type = NewFlat 
	CreatedAtStart 
	MaxStreams = 2 
	Angles = VECTOR(0.00000000000, 0.00000000000, 3.00000000000) 
	LocalSpace 
	BoxDimsStart = VECTOR(10.00000000000, 10.00000000000, 10.00000000000) 
	BoxDimsMid = VECTOR(10.00000000000, 10.00000000000, 10.00000000000) 
	BoxDimsEnd = VECTOR(15.00000000000, 15.00000000000, 15.00000000000) 
	pos = VECTOR(0.00000000000, 1.00000000000, 0.00000000000) 
	MidPosition = VECTOR(0.00000000000, 5.00000000000, 0.00000000000) 
	EndPosition = VECTOR(0.00000000000, 20.00000000000, 0.00000000000) 
	UseMidPoint 
	SuspendDistance = Default_Fast_Particle_Suspend_Dist 
	LOD_Dist1 = 0.00000000000 
	LOD_Dist2 = 0.00000000000 
	EmitRate = 15.00000000000 
	LifeTime = 0.30000001192 
	EmitDuration = 0.10000000149 
	StartRadius = 10.00000000000 
	MidRadius = 20.00000000000 
	EndRadius = 30.00000000000 
	StartRadiusSpread = 0.00000000000 
	MidRadiusSpread = 2.00000000000 
	EndRadiusSpread = 3.00000000000 
	priority = 0 
	Texture = apm_spray_01 
	BlendMode = Blend 
	AlphaCutoff = 1 
	StartRGB = [ 77 , 64 , 50 ] 
	StartAlpha = 41 
	EndRGB = [ 102 , 94 , 71 ] 
	EndAlpha = 0 
	MidRGB = [ 102 , 88 , 71 ] 
	MidAlpha = 89 
	UseColorMidTime 
	ColorMidTime = 50 
	UseGlobalColorModulation 
	Update_Brightness_From = skater 
} 
apm_SandFootstep01_fast_particle_params = { 
	Class = ParticleObject 
	Type = NewFlat 
	CreatedAtStart 
	MaxStreams = 2 
	Angles = VECTOR(0.00000000000, 0.00000000000, 3.00000000000) 
	LocalSpace 
	BoxDimsStart = VECTOR(10.00000000000, 10.00000000000, 10.00000000000) 
	BoxDimsMid = VECTOR(10.00000000000, 10.00000000000, 10.00000000000) 
	BoxDimsEnd = VECTOR(15.00000000000, 15.00000000000, 15.00000000000) 
	pos = VECTOR(0.00000000000, 1.00000000000, 0.00000000000) 
	MidPosition = VECTOR(0.00000000000, 5.00000000000, 0.00000000000) 
	EndPosition = VECTOR(0.00000000000, 20.00000000000, 0.00000000000) 
	UseMidPoint 
	SuspendDistance = Default_Fast_Particle_Suspend_Dist 
	LOD_Dist1 = 0.00000000000 
	LOD_Dist2 = 0.00000000000 
	EmitRate = 15.00000000000 
	LifeTime = 0.30000001192 
	EmitDuration = 0.10000000149 
	StartRadius = 10.00000000000 
	MidRadius = 20.00000000000 
	EndRadius = 30.00000000000 
	StartRadiusSpread = 0.00000000000 
	MidRadiusSpread = 2.00000000000 
	EndRadiusSpread = 3.00000000000 
	priority = 0 
	Texture = apm_spray_01 
	BlendMode = Blend 
	AlphaCutoff = 1 
	StartRGB = [ 128 , 118 , 90 ] 
	StartAlpha = 41 
	EndRGB = [ 178 , 165 , 124 ] 
	EndAlpha = 0 
	MidRGB = [ 153 , 142 , 107 ] 
	MidAlpha = 128 
	UseColorMidTime 
	ColorMidTime = 50 
	UseGlobalColorModulation 
	Update_Brightness_From = skater 
} 
apm_SandFootstep02_fast_particle_params = { 
	Class = ParticleObject 
	Type = NewFlat 
	CreatedAtStart 
	MaxStreams = 2 
	LocalSpace 
	EnableRotate 
	BoxDimsStart = VECTOR(10.00000000000, 10.00000000000, 10.00000000000) 
	BoxDimsMid = VECTOR(15.00000000000, 10.00000000000, 15.00000000000) 
	BoxDimsEnd = VECTOR(30.00000000000, 15.00000000000, 30.00000000000) 
	pos = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
	MidPosition = VECTOR(0.00000000000, 20.00000000000, -10.00000000000) 
	EndPosition = VECTOR(0.00000000000, 0.00000000000, -20.00000000000) 
	UseMidPoint 
	SuspendDistance = Default_Fast_Particle_Suspend_Dist 
	LOD_Dist1 = 0.00000000000 
	LOD_Dist2 = 0.00000000000 
	EmitRate = 60.00000000000 
	LifeTime = 0.20000000298 
	EmitDuration = 0.10000000149 
	StartRadius = 10.00000000000 
	MidRadius = 7.50000000000 
	EndRadius = 5.00000000000 
	StartRadiusSpread = 0.00000000000 
	MidRadiusSpread = 2.00000000000 
	EndRadiusSpread = 3.00000000000 
	priority = 0 
	Texture = apm_debis_Quad01 
	BlendMode = Blend 
	AlphaCutoff = 1 
	StartRGB = [ 102 , 95 , 72 ] 
	StartAlpha = 128 
	EndRGB = [ 128 , 119 , 89 ] 
	EndAlpha = 71 
	MidRGB = [ 115 , 105 , 80 ] 
	MidAlpha = 128 
	UseColorMidTime 
	ColorMidTime = 50 
	UseGlobalColorModulation 
	Update_Brightness_From = skater 
} 
apm_Skater_gravel01_fast_particle_params = { 
	Class = ParticleObject 
	Type = NewFlat 
	CreatedAtStart 
	MaxStreams = 2 
	LocalSpace 
	BoxDimsStart = VECTOR(10.00000000000, 10.00000000000, 10.00000000000) 
	BoxDimsMid = VECTOR(30.00000000000, 10.00000000000, 30.00000000000) 
	BoxDimsEnd = VECTOR(50.00000000000, 10.00000000000, 50.00000000000) 
	pos = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
	MidPosition = VECTOR(0.00000000000, 10.00000000000, 0.00000000000) 
	EndPosition = VECTOR(0.00000000000, -10.00000000000, 0.00000000000) 
	UseMidPoint 
	SuspendDistance = Default_Fast_Particle_Suspend_Dist 
	LOD_Dist1 = 0.00000000000 
	LOD_Dist2 = 0.00000000000 
	EmitRate = 30.00000000000 
	LifeTime = 0.40000000596 
	EmitDuration = 0.10000000149 
	StartRadius = 10.00000000000 
	MidRadius = 20.00000000000 
	EndRadius = 10.00000000000 
	StartRadiusSpread = 5.00000000000 
	MidRadiusSpread = 10.00000000000 
	EndRadiusSpread = 5.00000000000 
	priority = 0 
	Texture = apm_debis_Quad01 
	BlendMode = Blend 
	AlphaCutoff = 1 
	StartRGB = [ 102 , 98 , 93 ] 
	StartAlpha = 87 
	EndRGB = [ 102 , 98 , 95 ] 
	EndAlpha = 84 
	MidRGB = [ 128 , 123 , 118 ] 
	MidAlpha = 113 
	UseColorMidTime 
	ColorMidTime = 50 
	UseGlobalColorModulation 
	Update_Brightness_From = skater 
} 
apm_Skater_splash01f_fast_particle_params = { 
	Class = ParticleObject 
	Type = NewFlat 
	CreatedAtStart 
	AbsentInNetGames 
	MaxStreams = 2 
	LocalSpace 
	BoxDimsStart = VECTOR(10.00000000000, 10.00000000000, 10.00000000000) 
	BoxDimsMid = VECTOR(50.00000000000, 15.00000000000, 50.00000000000) 
	BoxDimsEnd = VECTOR(100.00000000000, 40.00000000000, 100.00000000000) 
	pos = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
	MidPosition = VECTOR(0.00000000000, 100.00000000000, 0.00000000000) 
	EndPosition = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
	UseMidPoint 
	SuspendDistance = Default_Fast_Particle_Suspend_Dist 
	LOD_Dist1 = 0.00000000000 
	LOD_Dist2 = 0.00000000000 
	EmitRate = 500.00000000000 
	LifeTime = 0.60000002384 
	EmitDuration = 0.20000000298 
	StartRadius = 10.00000000000 
	MidRadius = 5.00000000000 
	EndRadius = 2.00000000000 
	StartRadiusSpread = 5.00000000000 
	MidRadiusSpread = 5.00000000000 
	EndRadiusSpread = 5.00000000000 
	Texture = dt_nj_waterdrop05 
	BlendMode = Blend 
	AlphaCutoff = 1 
	StartRGB = [ 143 , 143 , 143 ] 
	StartAlpha = 196 
	EndRGB = [ 134 , 134 , 134 ] 
	EndAlpha = 29 
	MidRGB = [ 105 , 105 , 105 ] 
	MidAlpha = 125 
	UseColorMidTime 
	ColorMidTime = 50 
	UseGlobalColorModulation 
} 
apm_Skater_splash02f_fast_particle_params = { 
	Class = ParticleObject 
	Type = NewFlat 
	CreatedAtStart 
	AbsentInNetGames 
	MaxStreams = 2 
	LocalSpace 
	BoxDimsStart = VECTOR(10.00000000000, 10.00000000000, 10.00000000000) 
	BoxDimsMid = VECTOR(50.00000000000, 15.00000000000, 50.00000000000) 
	BoxDimsEnd = VECTOR(100.00000000000, 40.00000000000, 100.00000000000) 
	pos = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
	MidPosition = VECTOR(0.00000000000, 100.00000000000, 0.00000000000) 
	EndPosition = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
	UseMidPoint 
	SuspendDistance = Default_Fast_Particle_Suspend_Dist 
	LOD_Dist1 = 0.00000000000 
	LOD_Dist2 = 0.00000000000 
	EmitRate = 250.00000000000 
	LifeTime = 0.60000002384 
	EmitDuration = 0.25000000000 
	StartRadius = 5.00000000000 
	MidRadius = 5.00000000000 
	EndRadius = 2.00000000000 
	StartRadiusSpread = 5.00000000000 
	MidRadiusSpread = 5.00000000000 
	EndRadiusSpread = 5.00000000000 
	Texture = apm_debis_01 
	BlendMode = Blend 
	AlphaCutoff = 1 
	StartRGB = [ 143 , 143 , 143 ] 
	StartAlpha = 196 
	EndRGB = [ 134 , 134 , 134 ] 
	EndAlpha = 29 
	MidRGB = [ 105 , 105 , 105 ] 
	MidAlpha = 125 
	UseColorMidTime 
	ColorMidTime = 50 
	UseGlobalColorModulation 
} 
apm_Skater_splash03_fast_particle_params = { 
	Class = ParticleObject 
	Type = NewFlat 
	CreatedAtStart 
	MaxStreams = 2 
	LocalSpace 
	BoxDimsStart = VECTOR(10.00000000000, 10.00000000000, 10.00000000000) 
	BoxDimsMid = VECTOR(30.00000000000, 10.00000000000, 30.00000000000) 
	BoxDimsEnd = VECTOR(50.00000000000, 10.00000000000, 50.00000000000) 
	pos = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
	MidPosition = VECTOR(0.00000000000, 20.00000000000, 0.00000000000) 
	EndPosition = VECTOR(0.00000000000, -10.00000000000, 0.00000000000) 
	UseMidPoint 
	SuspendDistance = Default_Fast_Particle_Suspend_Dist 
	LOD_Dist1 = 0.00000000000 
	LOD_Dist2 = 0.00000000000 
	EmitRate = 100.00000000000 
	LifeTime = 0.30000001192 
	EmitDuration = 0.10000000149 
	StartRadius = 5.00000000000 
	MidRadius = 5.00000000000 
	EndRadius = 5.00000000000 
	StartRadiusSpread = 5.00000000000 
	MidRadiusSpread = 3.00000000000 
	EndRadiusSpread = 3.00000000000 
	priority = 0 
	Texture = dt_nj_waterdrop05 
	BlendMode = Blend 
	AlphaCutoff = 1 
	StartRGB = [ 187 , 187 , 187 ] 
	StartAlpha = 128 
	EndRGB = [ 110 , 110 , 110 ] 
	EndAlpha = 0 
	MidRGB = [ 156 , 156 , 156 ] 
	MidAlpha = 63 
	UseColorMidTime 
	ColorMidTime = 50 
	UseGlobalColorModulation 
} 
apm_sandpuff01_fast_particle_params = { 
	Class = ParticleObject 
	Type = NewFlat 
	CreatedAtStart 
	MaxStreams = 2 
	ObjID = skater 
	Bone = Bone_Board_Root 
	LocalSpace 
	EnableRotate 
	BoxDimsStart = VECTOR(10.00000000000, 0.00000000000, 10.00000000000) 
	BoxDimsMid = VECTOR(60.00000000000, 5.00000000000, 60.00000000000) 
	BoxDimsEnd = VECTOR(50.00000000000, 5.00000000000, 50.00000000000) 
	pos = VECTOR(0.00000000000, 10.00000000000, 0.00000000000) 
	MidPosition = VECTOR(0.00000000000, 20.00000000000, 0.00000000000) 
	EndPosition = VECTOR(0.00000000000, 10.00000000000, 0.00000000000) 
	UseMidPoint 
	SuspendDistance = Default_Fast_Particle_Suspend_Dist 
	LOD_Dist1 = Default_Fast_Particle_LOD_Dist1 
	LOD_Dist2 = Default_Fast_Particle_LOD_Dist2 
	EmitRate = 200.00000000000 
	LifeTime = 0.25000000000 
	EmitDuration = 0.25000000000 
	StartRadius = 5.00000000000 
	MidRadius = 20.00000000000 
	EndRadius = 20.00000000000 
	StartRadiusSpread = 2.00000000000 
	MidRadiusSpread = 10.00000000000 
	EndRadiusSpread = 10.00000000000 
	priority = 0 
	Texture = apm_spray_01 
	BlendMode = Blend 
	AlphaCutoff = 1 
	StartRGB = [ 77 , 71 , 54 ] 
	StartAlpha = 0 
	EndRGB = [ 102 , 95 , 76 ] 
	EndAlpha = 0 
	MidRGB = [ 102 , 94 , 72 ] 
	MidAlpha = 128 
	UseColorMidTime 
	ColorMidTime = 61 
	UseGlobalColorModulation 
	Update_Brightness_From = skater 
} 

