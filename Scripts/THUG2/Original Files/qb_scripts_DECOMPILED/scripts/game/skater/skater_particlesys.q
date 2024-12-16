
SCRIPT InitSkaterParticles 
ENDSCRIPT

SkaterParticleHandlerExceptionTable = [ 
	{ Event Ex = OnSkaterStateChange Scr = SkaterParticles_OnSkaterStateChange } 
	{ Event Ex = OnSkaterPhysicsStateChange Scr = SkaterParticles_OnSkaterPhysicsStateChange } 
	{ Event Ex = OnSkaterTerrainChange Scr = SkaterParticles_OnSkaterTerrainChange } 
] 
SCRIPT set_skater_particle_handlers 
	ResetEventHandlersFromTable SkaterParticleHandlerExceptionTable group = flexpartsys 
ENDSCRIPT

SCRIPT destroy_particle_object 
	Obj_GetId 
	MangleChecksums a = <a> b = <objId> 
	IF GotParam b 
		MangleChecksums a = <mangled_id> b = <b> 
	ENDIF 
	IF ObjectExists id = <mangled_id> 
		<mangled_id> : DestroyParticles 
		<mangled_id> : Die 
	ELSE 
		
	ENDIF 
ENDSCRIPT

SCRIPT DestroySkaterParticles 
	ResetSkaterParticleSystems 
	Obj_GetId 
	<objId> : destroy_particle_object a = skater_blood_system b = bone_head 
	FlushDeadObjects 
ENDSCRIPT

SCRIPT ResetSkaterParticleSystems 
	SkaterParticles_DestroySkatingGfx 
	SkaterParticles_DestroyStepGfx 
	SkaterParticles_DestroyGrindGfx 
	SkaterParticles_DestroySlideGfx 
	CleanUp_SpecialTrickParticles 
	BloodParticlesOff 
	SprayPaintOff 
	SkaterSplashOff 
	SparksOff 
ENDSCRIPT

SCRIPT SkaterParticles_SparksOn type = grind 
	IF ( <type> = grind ) 
		SkaterParticles_CreateGrindGfx 
	ELSE 
		SkaterParticles_CreateSlideGfx 
	ENDIF 
ENDSCRIPT

SCRIPT SkaterParticles_SparksOff 
	SkaterParticles_DestroyGrindGfx 
	SkaterParticles_DestroySlideGfx 
ENDSCRIPT

SCRIPT SetSparksTruckFromNollie 
	IF InNollie 
		SetSparksPos front 
	ELSE 
		SetSparksPos rear 
	ENDIF 
ENDSCRIPT

SCRIPT SkaterSplashOn 
	Obj_GetId 
	CreateFlexibleParticleSystem name = skatersplash objId = <objId> params_script = apm_Skater_splash01_particle_params 
	CreateFastParticleSystem name = skatersplash2 attachObjId = <objId> params_script = apm_Skater_splash01f_fast_particle_params 
	CreateFastParticleSystem name = skatersplash3 attachObjId = <objId> params_script = apm_Skater_splash02f_fast_particle_params 
ENDSCRIPT

SCRIPT SkaterSplashOff 
	Obj_GetId 
	DestroyFlexibleParticleSystem name = skatersplash objId = <objId> 
	DestroyFastParticleSystem name = skatersplash2 attachObjId = <objId> 
	DestroyFastParticleSystem name = skatersplash3 attachObjId = <objId> 
ENDSCRIPT

SCRIPT SprayPaintOn 
	Obj_GetId 
	CreateFlexibleParticleSystem name = skater_SprayPaint_system objId = <objId> params_script = apm_spray03_particle_params bone = <bone> 
ENDSCRIPT

SCRIPT SprayPaintOff 
	Obj_GetId 
	DestroyFlexibleParticleSystem name = skater_SprayPaint_system objId = <objId> 
ENDSCRIPT

SCRIPT AcidParticlesOn 
	IF IsSkaterOnVehicle 
		RETURN 
	ENDIF 
	BEGIN 
		IF OnRail 
			BREAK 
		ENDIF 
		IF Walking 
			BREAK 
		ENDIF 
		IF OnGround 
			Obj_GetId 
			CreateFastParticleSystem name = skater_acid_system02 params_script = apm_ACID_DROP02_fast_particle_params attachObjId = <objId> 
			CreateFastParticleSystem name = skater_acid_system03 params_script = apm_ACID_DROP03_fast_particle_params attachObjId = <objId> 
			ShakeCamera { 
				duration = 0.25000000000 
				vert_amp = 25 
				horiz_amp = 10 
				vert_vel = 10 
				horiz_vel = 10.92000007629 
			} 
			Vibrate Actuator = 0 , Percent = 1 , duration = 1 , 
			Vibrate Actuator = 1 , Percent = 1 , duration = 1 , 
			wait 2 seconds 
			BREAK 
		ENDIF 
		wait 1 gameframe 
	REPEAT 
ENDSCRIPT

SCRIPT AcidParticlesOff 
	DestroyFlexibleParticleSystem name = skater_acid_system 
ENDSCRIPT

SCRIPT BloodParticlesOn bone = bone_head 
	Obj_GetId 
	MangleChecksums a = skater_blood_system b = <objId> 
	MangleChecksums a = <mangled_id> b = <bone> 
	Obj_SpawnScript SkaterBloodOn params = { name = <mangled_id> num = <num> } 
ENDSCRIPT

SCRIPT SkaterBloodOn num = 10 
	IF NOT GotParam name 
		script_assert "No name parameter" 
	ENDIF 
	alloc_blood_system name = <name> 
	IF NOT GetGlobalFlag Flag = CHEAT_SUPER_BLOOD 
		IF ObjectExists id = <name> 
			<name> : SetEmitScript name = <name> emitscript = skater_blood_emit 
		ENDIF 
	ELSE 
		IF ObjectExists id = <name> 
			<name> : SetEmitScript name = <name> emitscript = skater_blood_emit_super 
		ENDIF 
	ENDIF 
	BEGIN 
		IF ObjectExists id = <name> 
			<name> : EmitOn 
		ENDIF 
		wait 1 gameframe 
	REPEAT <num> 
	IF ObjectExists id = <name> 
		<name> : EmitOff 
	ENDIF 
ENDSCRIPT

SCRIPT BloodParticlesOff bone = bone_head 
	Obj_GetId 
	MangleChecksums a = skater_blood_system b = <objId> 
	MangleChecksums a = <mangled_id> b = bone_head 
	SkaterBloodOff name = <mangled_id> 
	IF ObjectExists id = <mangled_id> 
		<mangled_id> : EmptySystem 
	ENDIF 
ENDSCRIPT

SCRIPT SkaterBloodOff 
	IF NOT GotParam name 
		script_assert "No name parameter" 
	ENDIF 
	IF ObjectExists id = <name> 
		<name> : DestroyParticles 
	ENDIF 
ENDSCRIPT

SCRIPT alloc_blood_system bone = bone_head 
	Obj_GetId 
	IF NOT GotParam name 
		script_assert "No <name> parameter" 
	ENDIF 
	IF NOT ObjectExists id = <name> 
		CreateCompositeObject { 
			Components = [ 
				{ component = suspend } 
				{ component = lockobj } 
				{ component = FlexibleParticle } 
			] 
			params = { 
				name = <name> 
				LocalSpace 
				vel = <vel> 
				params = { objId = <objId> bone = <bone> name = <name> } 
				max = 25 
				emitscript = skater_blood_emit 
				texture = particle_test02 
				blendmode = blend 
				perm = 1 
			} 
		} 
		<name> : Obj_LockToObject bone = <bone> id = <objId> add_vel 
	ENDIF 
ENDSCRIPT

SCRIPT SkaterParticles_OnSkaterStateChange 
	SkaterParticles_DestroySkatingGfx 
	SkaterParticles_DestroyGrindGfx 
	SkaterParticles_DestroySlideGfx 
	IF OnGround 
		SkaterParticles_CreateSkatingGfx 
	ENDIF 
ENDSCRIPT

SCRIPT SkaterParticles_OnSkaterPhysicsStateChange 
	SkaterParticles_DestroySkatingGfx 
	SkaterParticles_DestroyGrindGfx 
	SkaterParticles_DestroySlideGfx 
	IF Skating 
		SkaterParticles_CreateSkatingGfx 
	ENDIF 
ENDSCRIPT

SCRIPT SkaterParticles_OnSkaterTerrainChange 
	SkaterParticles_DestroySkatingGfx 
	IF Skating 
		SkaterParticles_CreateSkatingGfx 
	ENDIF 
ENDSCRIPT

SCRIPT SkaterParticles_OnRightFootstep 
	SkaterParticles_CreateStepGfx bone = Bone_Ankle_R 
ENDSCRIPT

SCRIPT SkaterParticles_OnLeftFootstep 
	SkaterParticles_CreateStepGfx bone = Bone_Ankle_L 
ENDSCRIPT

SCRIPT SkaterParticles_CreateSkatingGfx 
	Obj_GetId 
	GetTerrain 
	IF GetTerrainTypeParam param = TreadActions terrain_id = <terrain> 
		BEGIN 
			IF GetNextArrayElement ( <TreadActions> . SkaterSkatingParticleParms ) 
				FormatText ChecksumName = tag "terrain_skating%d" d = <index> 
				MangleChecksums a = <tag> b = <objId> 
				<name> = <mangled_id> 
				IF NOT ObjectExists id = <name> 
					MangleChecksums a = terrain_skating b = <objId> 
					<groupID> = <mangled_id> 
					<type> = flexible 
					IF StructureContains structure = ( <element> ) Class 
						IF ( ( <element> . Class ) = ParticleObject ) 
							<type> = fast 
						ENDIF 
					ENDIF 
					IF ( <type> = flexible ) 
						alloc_flexible_particle params_script = ( <element> ) name = <name> objId = <objId> groupID = <groupID> 
					ELSE 
						alloc_fast_particle params_script = ( <element> ) name = <name> attachObjId = <objId> groupID = <groupID> 
					ENDIF 
				ENDIF 
			ELSE 
				BREAK 
			ENDIF 
		REPEAT 
	ENDIF 
ENDSCRIPT

SCRIPT SkaterParticles_DestroySkatingGfx 
	Obj_GetId 
	MangleChecksums a = terrain_skating b = <objId> 
	DestroyParticlesByGroupID groupID = <mangled_id> 
ENDSCRIPT

SCRIPT SkaterParticles_CreateStepGfx bone = Bone_Ankle_L SystemLifetime = 400 
	Obj_GetId 
	GetTerrain 
	IF GetTerrainTypeParam param = TreadActions terrain_id = <terrain> 
		BEGIN 
			IF GetNextArrayElement ( <TreadActions> . SkaterStepParticleParms ) 
				GetUniqueCompositeObjectId PreferredId = FootstepParticleSystem 
				<name> = <UniqueID> 
				MangleChecksums a = terrain_step b = <objId> 
				<groupID> = <mangled_id> 
				<type> = flexible 
				IF StructureContains structure = ( <element> ) Class 
					IF ( ( <element> . Class ) = ParticleObject ) 
						<type> = fast 
					ENDIF 
				ENDIF 
				IF ( <type> = flexible ) 
					alloc_flexible_particle params_script = ( <element> ) name = <name> objId = <objId> groupID = <groupID> bone = <bone> 
				ELSE 
					IF StructureContains structure = ( <element> ) EmitDuration 
						SystemLifetime = ( 1000 * ( <element> . EmitDuration ) ) 
						CastToInteger SystemLifetime 
					ENDIF 
					alloc_fast_particle params_script = ( <element> ) name = <name> groupID = <groupID> bone = <bone> SystemLifetime = <SystemLifetime> 
					Orient Object = <UniqueID> RelativeTo = <objId> bone = <bone> 
				ENDIF 
			ELSE 
				BREAK 
			ENDIF 
		REPEAT 
	ENDIF 
ENDSCRIPT

SCRIPT SkaterParticles_DestroyStepGfx 
	Obj_GetId 
	MangleChecksums a = terrain_step b = <objId> 
	DestroyParticlesByGroupID groupID = <mangled_id> 
ENDSCRIPT

SCRIPT SkaterParticles_CreateGrindGfx 
	Obj_GetId 
	GetTerrain 
	IF GetTerrainTypeParam param = TreadActions terrain_id = <terrain> 
		BEGIN 
			IF GetNextArrayElement ( <TreadActions> . SkaterGrindParticleParms ) 
				FormatText ChecksumName = tag "terrain_grind%d" d = <index> 
				MangleChecksums a = <tag> b = <objId> 
				<name> = <mangled_id> 
				IF NOT ObjectExists id = <name> 
					MangleChecksums a = terrain_grind b = <objId> 
					<groupID> = <mangled_id> 
					<type> = flexible 
					IF StructureContains structure = ( <element> ) Class 
						IF ( ( <element> . Class ) = ParticleObject ) 
							<type> = fast 
						ENDIF 
					ENDIF 
					IF ( <type> = flexible ) 
						alloc_flexible_particle params_script = ( <element> ) name = <name> objId = <objId> groupID = <groupID> 
					ELSE 
						alloc_fast_particle params_script = ( <element> ) name = <name> attachObjId = <objId> groupID = <groupID> 
					ENDIF 
				ENDIF 
			ELSE 
				BREAK 
			ENDIF 
		REPEAT 
	ENDIF 
ENDSCRIPT

SCRIPT SkaterParticles_DestroyGrindGfx 
	Obj_GetId 
	MangleChecksums a = terrain_grind b = <objId> 
	DestroyParticlesByGroupID groupID = <mangled_id> 
ENDSCRIPT

SCRIPT SkaterParticles_CreateSlideGfx 
	Obj_GetId 
	GetTerrain 
	IF GetTerrainTypeParam param = TreadActions terrain_id = <terrain> 
		BEGIN 
			IF GetNextArrayElement ( <TreadActions> . SkaterSlideParticleParms ) 
				FormatText ChecksumName = tag "terrain_slide%d" d = <index> 
				MangleChecksums a = <tag> b = <objId> 
				<name> = <mangled_id> 
				IF NOT ObjectExists id = <name> 
					MangleChecksums a = terrain_slide b = <objId> 
					<groupID> = <mangled_id> 
					<type> = flexible 
					IF StructureContains structure = ( <element> ) Class 
						IF ( ( <element> . Class ) = ParticleObject ) 
							<type> = fast 
						ENDIF 
					ENDIF 
					IF ( <type> = flexible ) 
						alloc_flexible_particle params_script = ( <element> ) name = <name> objId = <objId> groupID = <groupID> 
					ELSE 
						alloc_fast_particle params_script = ( <element> ) name = <name> attachObjId = <objId> groupID = <groupID> 
					ENDIF 
				ENDIF 
			ELSE 
				BREAK 
			ENDIF 
		REPEAT 
	ENDIF 
ENDSCRIPT

SCRIPT SkaterParticles_DestroySlideGfx 
	Obj_GetId 
	MangleChecksums a = terrain_slide b = <objId> 
	DestroyParticlesByGroupID groupID = <mangled_id> 
ENDSCRIPT

skater_particle_composite_structure = 
[ 
	{ component = suspend } 
	{ component = particle } 
	{ component = lockobj } 
] 
SCRIPT CleanUp_SpecialTrickParticles 
	Obj_GetId 
	MangleChecksums a = <objId> b = SpecialTrickParticles 
	particle_id = <mangled_id> 
	IF ObjectExists id = <particle_id> 
		<particle_id> : Die 
	ENDIF 
ENDSCRIPT

SCRIPT Emit_SpecialTrickParticles bone = bone_head specialtrick_particles = barf_particles 
	Obj_SpawnScript Emit_SpecialTrickParticles2 params = { <...> } 
ENDSCRIPT

SCRIPT Emit_SpecialTrickParticles2 
	Obj_GetId 
	MangleChecksums a = <objId> b = SpecialTrickParticles 
	particle_id = <mangled_id> 
	IF ObjectExists id = <particle_id> 
		<particle_id> : Die 
	ENDIF 
	wait 1 game frame 
	
	IF NOT GotParam dont_orient_toskater 
		GetSkaterVelocity 
		vel = ( <vel_x> * VECTOR(1.00000000000, 0.00000000000, 0.00000000000) + <vel_y> * VECTOR(0.00000000000, 1.00000000000, 0.00000000000) + <vel_z> * VECTOR(0.00000000000, 0.00000000000, 1.00000000000) ) 
		CreateCompositeObject { 
			Components = skater_particle_composite_structure 
			params = { 
				name = <particle_id> 
				LocalSpace 
				EnableRotate 
				vel = <vel> 
				<specialtrick_particles> 
			} 
		} 
	ELSE 
		
		CreateCompositeObject { 
			Components = skater_particle_composite_structure 
			params = { 
				name = <particle_id> 
				LocalSpace 
				<specialtrick_particles> 
			} 
		} 
	ENDIF 
	<particle_id> : Obj_LockToObject bone = <bone> id = <objId> 
	IF GotParam StopEmitAt 
		wait <StopEmitAt> seconds 
		IF ObjectExists id = <particle_id> 
			<particle_id> : SetEmitRate 0 
		ENDIF 
	ENDIF 
ENDSCRIPT

fire_particles = 
{ 
	Class = ParticleObject 
	type = Default 
	BoxDimsStart = VECTOR(20.41944122314, 20.24608993530, 0.35107499361) 
	MidPosition = VECTOR(-10.00213432312, -10.85268878937, -10.05867862701) 
	BoxDimsMid = VECTOR(20.41944122314, 20.24608993530, 0.35107499361) 
	EndPosition = VECTOR(-20.01586723328, -20.33533477783, -20.05867958069) 
	BoxDimsEnd = VECTOR(20.41944122314, 20.24608993530, 0.35107499361) 
	texture = dt_generic_particle01 
	CreatedAtStart 
	AbsentInNetGames 
	UseMidPoint 
	UseColorMidTime 
	type = NEWFLAT 
	blendmode = Add 
	FixedAlpha = 128 
	AlphaCutoff = 1 
	MaxStreams = 2 
	SuspendDistance = 0 
	lod_dist1 = 400 
	lod_dist2 = 401 
	EmitRate = 160.00000000000 
	Lifetime = 0.40000000596 
	MidPointPCT = 50 
	StartRadius = 7.00000000000 
	MidRadius = 5.00000000000 
	EndRadius = 3.50000000000 
	StartRadiusSpread = 1.00000000000 
	MidRadiusSpread = 1.00000000000 
	EndRadiusSpread = 1.00000000000 
	StartRGB = [ 150 , 72 , 25 ] 
	StartAlpha = 85 
	ColorMidTime = 50 
	MidRGB = [ 150 , 67 , 18 ] 
	MidAlpha = 85 
	EndRGB = [ 150 , 67 , 18 ] 
	EndAlpha = 0 
} 
barf_particles = 
{ 
	Class = ParticleObject 
	type = Default 
	BoxDimsStart = VECTOR(1.40137803555, 1.40137803555, 1.40137803555) 
	MidPosition = VECTOR(-0.00908999983, -17.07610130310, -0.03491999954) 
	BoxDimsMid = VECTOR(4.44386386871, 4.44386386871, 4.44386386871) 
	EndPosition = VECTOR(-0.06447999924, -64.39933013916, -0.03492100164) 
	BoxDimsEnd = VECTOR(6.66731977463, 6.66731977463, 6.66731977463) 
	texture = dt_barf02 
	CreatedAtStart 
	AbsentInNetGames 
	UseMidPoint 
	UseColorMidTime 
	type = NEWFLAT 
	blendmode = blend 
	FixedAlpha = 128 
	AlphaCutoff = 1 
	MaxStreams = 2 
	SuspendDistance = 0 
	lod_dist1 = 400 
	lod_dist2 = 401 
	EmitRate = 100.00000000000 
	Lifetime = 0.30000001192 
	MidPointPCT = 50 
	StartRadius = 1.00000000000 
	MidRadius = 2.00000000000 
	EndRadius = 3.00000000000 
	StartRadiusSpread = 1.00000000000 
	MidRadiusSpread = 1.00000000000 
	EndRadiusSpread = 1.00000000000 
	StartRGB = [ 105 , 111 , 96 ] 
	StartAlpha = 122 
	ColorMidTime = 50 
	MidRGB = [ 105 , 111 , 96 ] 
	MidAlpha = 160 
	EndRGB = [ 105 , 111 , 96 ] 
	EndAlpha = 50 
} 
barf2_particles = 
{ 
	Class = ParticleObject 
	type = Default 
	BoxDimsStart = VECTOR(1.40137803555, 1.40137803555, 1.40137803555) 
	MidPosition = VECTOR(-0.00908999983, 0.00000000000, -17.07610130310) 
	BoxDimsMid = VECTOR(1.40137803555, 1.40137803555, 1.40137803555) 
	EndPosition = VECTOR(-0.06447999924, 0.00000000000, -34.39933013916) 
	BoxDimsEnd = VECTOR(1.40137803555, 1.40137803555, 1.40137803555) 
	texture = dt_barf02 
	CreatedAtStart 
	AbsentInNetGames 
	UseMidPoint 
	UseColorMidTime 
	type = NEWFLAT 
	blendmode = blend 
	FixedAlpha = 128 
	AlphaCutoff = 1 
	MaxStreams = 2 
	SuspendDistance = 0 
	lod_dist1 = 400 
	lod_dist2 = 401 
	EmitRate = 100.00000000000 
	Lifetime = 0.30000001192 
	MidPointPCT = 50 
	StartRadius = 1.00000000000 
	MidRadius = 2.00000000000 
	EndRadius = 3.00000000000 
	StartRadiusSpread = 1.00000000000 
	MidRadiusSpread = 1.00000000000 
	EndRadiusSpread = 1.00000000000 
	StartRGB = [ 105 , 111 , 96 ] 
	StartAlpha = 122 
	ColorMidTime = 50 
	MidRGB = [ 105 , 111 , 96 ] 
	MidAlpha = 160 
	EndRGB = [ 105 , 111 , 96 ] 
	EndAlpha = 50 
} 
firebreath_particles = 
{ 
	Class = ParticleObject 
	type = Default 
	BoxDimsStart = VECTOR(0.69999998808, 0.69999998808, 0.69999998808) 
	MidPosition = VECTOR(-0.00213799998, 10.16623592377, -0.05867899954) 
	BoxDimsMid = VECTOR(4.54235410690, 4.54235410690, 4.54235410690) 
	EndPosition = VECTOR(-0.01587600075, 38.12525558472, -0.05867600068) 
	BoxDimsEnd = VECTOR(9.06387519836, 9.06387519836, 9.06387519836) 
	texture = dt_generic_particle01 
	CreatedAtStart 
	AbsentInNetGames 
	UseMidPoint 
	UseColorMidTime 
	type = NEWFLAT 
	blendmode = Add 
	FixedAlpha = 128 
	AlphaCutoff = 1 
	MaxStreams = 2 
	SuspendDistance = 0 
	lod_dist1 = 400 
	lod_dist2 = 401 
	EmitRate = 250.00000000000 
	Lifetime = 0.20000000298 
	MidPointPCT = 50 
	StartRadius = 4.00000000000 
	MidRadius = 4.00000000000 
	EndRadius = 6.00000000000 
	StartRadiusSpread = 1.00000000000 
	MidRadiusSpread = 1.00000000000 
	EndRadiusSpread = 1.00000000000 
	StartRGB = [ 150 , 93 , 59 ] 
	StartAlpha = 82 
	ColorMidTime = 50 
	MidRGB = [ 150 , 67 , 18 ] 
	MidAlpha = 109 
	EndRGB = [ 150 , 67 , 18 ] 
	EndAlpha = 0 
} 
SCRIPT skater_blood_emit 
	setlife min = 0.25000000000 max = 1 
	setanglespread spread = 0.10000000149 
	setspeedrange min = 4 max = 8 
	setforce force = VECTOR(0.00000000000, -0.50000000000, 0.00000000000) 
	setparticlesize sw = 2 sh = 2 ew = 2 eh = 2 
	setcolor corner = 0 sr = 100 sg = 0 sb = 0 sa = 255 er = 80 eg = 0 eb = 0 ea = 0 
	setcolor corner = 1 sr = 100 sg = 0 sb = 0 sa = 255 er = 80 eg = 0 eb = 0 ea = 0 
	setcolor corner = 2 sr = 100 sg = 0 sb = 0 sa = 255 er = 80 eg = 0 eb = 0 ea = 0 
	setcolor corner = 3 sr = 100 sg = 0 sb = 0 sa = 255 er = 80 eg = 0 eb = 0 ea = 0 
	BEGIN 
		IF <name> : ShouldEmit 
			emit num = 1 
		ENDIF 
		wait 1 gameframe 
	REPEAT 
ENDSCRIPT

SCRIPT skater_blood_emit_super 
	setlife min = 0.25000000000 max = 1 
	setanglespread spread = 0.30000001192 
	setspeedrange min = 4 max = 10 
	setforce force = VECTOR(0.00000000000, -0.50000000000, 0.00000000000) 
	setparticlesize sw = 2 sh = 2 ew = 6 eh = 6 
	setcolor corner = 0 sr = 50 sg = 0 sb = 0 sa = 255 er = 50 eg = 0 eb = 0 ea = 0 
	setcolor corner = 1 sr = 50 sg = 0 sb = 0 sa = 255 er = 50 eg = 0 eb = 0 ea = 0 
	setcolor corner = 2 sr = 50 sg = 0 sb = 0 sa = 255 er = 50 eg = 0 eb = 0 ea = 0 
	setcolor corner = 3 sr = 50 sg = 0 sb = 0 sa = 255 er = 50 eg = 0 eb = 0 ea = 0 
	BEGIN 
		IF <name> : ShouldEmit 
			emit num = 1 
		ENDIF 
		wait 1 gameframe 
	REPEAT 
ENDSCRIPT

skater_sparks_params = { 
	bone = Bone_Board_Tail 
	LocalSpace 
	add_vel 
	max = 8 
	emitscript = skater_sparks_emit 
	updatescript = align_scale_size_to_vel_update 
	params = { update_pos = 1 
		base_vel = 700 
		pos_offset = VECTOR(0.00000000000, -5.00000000000, 0.00000000000) 
		emit_offset = VECTOR(0.00000000000, 1.50000000000, 0.00000000000) 
		base_emit_rate = 60 
		get_bone_script = GetBoardGrindBone 
	} 
	type = FlatRibbonTail 
	texture = apm_spark_4 
	history = 3 
	blendmode = Add 
} 
SCRIPT skater_sparks_emit 
	setlife min = 0.00999999978 max = 0.25000000000 
	setanglespread spread = 0.50000000000 
	setspeedrange min = 8 max = 12 
	setforce force = VECTOR(0.00000000000, -0.75000000000, 0.00000000000) 
	setparticlesize sw = 1 sh = 1 ew = 0.25000000000 eh = 0.25000000000 
	setcolor corner = 0 sr = 255 sg = 100 sb = 64 sa = 255 ma = 255 er = 255 eg = 64 eb = 0 ea = 255 
	setcolor corner = 1 sr = 255 sg = 128 sb = 64 sa = 0 ma = 255 er = 255 eg = 64 eb = 0 ea = 255 
	setcolor corner = 2 sr = 255 sg = 128 sb = 64 sa = 0 ma = 255 er = 255 eg = 64 eb = 0 ea = 128 
	setcolor corner = 3 sr = 255 sg = 128 sb = 64 sa = 0 ma = 255 er = 255 eg = 64 eb = 0 ea = 128 
	setcolor corner = 4 sr = 255 sg = 128 sb = 64 sa = 0 ma = 128 er = 255 eg = 64 eb = 0 ea = 0 
ENDSCRIPT

skater_elec_sparks_params = { 
	bone = Bone_Board_Tail 
	LocalSpace 
	add_vel 
	params = { update_pos = 1 
		get_bone_script = GetBoardGrindBone 
	} 
	max = 40 
	emitscript = skater_elec_sparks_emit 
	updatescript = align_scale_size_to_vel_update 
	type = FlatRibbonTail 
	texture = apm_spark_01 
	history = 2 
	blendmode = blend 
	perm = 1 
} 
SCRIPT skater_elec_sparks_emit 
	setlife min = 0.25000000000 max = 0.30000001192 
	setanglespread spread = 0.25000000000 
	setspeedrange min = 4 max = 8 
	setforce force = VECTOR(0.00000000000, -0.30000001192, 0.00000000000) 
	setparticlesize sw = 1.25000000000 sh = 1.25000000000 ew = 0.75000000000 eh = 0.75000000000 
	setcolor corner = 0 sr = 255 sg = 255 sb = 255 sa = 255 ma = 255 er = 255 eg = 255 eb = 255 ea = 0 
	setcolor corner = 1 sr = 124 sg = 255 sb = 255 sa = 128 ma = 128 er = 124 eg = 64 eb = 255 ea = 0 
	setcolor corner = 2 sr = 124 sg = 64 sb = 255 sa = 0 ma = 0 er = 124 eg = 64 eb = 255 ea = 0 
	setcolor corner = 3 sr = 124 sg = 255 sb = 255 sa = 80 ma = 80 er = 124 eg = 128 eb = 255 ea = 0 
	setcolor corner = 4 sr = 124 sg = 255 sb = 255 sa = 64 ma = 64 er = 124 eg = 128 eb = 255 ea = 0 
	setcolor corner = 5 sr = 124 sg = 255 sb = 255 sa = 0 ma = 0 er = 124 eg = 128 eb = 255 ea = 0 
	BEGIN 
		IF <name> : ShouldEmit 
			emit num = RANDOM_RANGE PAIR(1.00000000000, 2.00000000000) 
		ENDIF 
		wait 1 gameframe 
	REPEAT 
ENDSCRIPT


