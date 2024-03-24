

script load_level_fast_particle_textures 
    LoadParticleTexture 'particles\dt_nj_puff01b'
    LoadParticleTexture 'particles\dt_browndot02'
    LoadParticleTexture 'particles\apm_spray_01'
    LoadParticleTexture 'particles\apm_spark_01'
    LoadParticleTexture 'particles\dt_nj_waterdrop05'
    LoadParticleTexture 'particles\ba_apm_smokepuff01s'
    LoadParticleTexture 'particles\apm_feather01'
    LoadParticleTexture 'particles\apm_feather02'
    LoadParticleTexture 'particles\apm_feather03'
    LoadParticleTexture 'particles\apm_feather04'
    LoadParticleTexture 'particles\apm_flame_01'
    LoadParticleTexture 'particles\apm_fallingwater_01'
    LoadParticleTexture 'particles\apm_ring_01'
endscript

JOW_ST_SmokeBomb01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDimsStart = (15.0, 15.0, 15.0)
    BoxDimsMid = (80.0, 80.0, 80.0)
    BoxDimsEnd = (140.0, 140.0, 140.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.6100000143051147, -0.1899999976158142, 0.0)
    EndPosition = (0.5400000214576721, -0.23000000417232513, 0.0)
    UseMidPoint
    MidPointPCT = 50.0
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 120.0
    lifetime = 2.0
    emitduration = 0.3000
    startradius = 12.0
    MidRadius = 36.0
    endradius = 64.0
    priority = 0
    texture = dt_nj_puff01b
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [127 , 57 , 13]
    startAlpha = 49
    endRGB = [127 , 57 , 13]
    endAlpha = 0
    useglobalcolormodulation
}
JOW_ST_SmokeBomb02_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDimsStart = (15.0, 15.0, 15.0)
    BoxDimsMid = (80.0, 80.0, 80.0)
    BoxDimsEnd = (100.0, 100.0, 100.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.6100000143051147, -0.1899999976158142, 0.0)
    EndPosition = (0.5400000214576721, -13.770000457763672, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 100.0
    lifetime = 0.5000
    emitduration = 0.1000
    startradius = 6.0
    MidRadius = 6.0
    endradius = 3.0
    priority = 0
    texture = dt_browndot02
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [90 , 90 , 90]
    startAlpha = 128
    endRGB = [94 , 94 , 94]
    endAlpha = 0
    midRGB = [92 , 92 , 92]
    midAlpha = 92
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
apm_ST_CHIMsmoke01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    LocalSpace
    BoxDimsStart = (20.0, 10.0, 20.0)
    BoxDimsMid = (30.0, 25.0, 30.0)
    BoxDimsEnd = (200.0, 25.0, 200.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.0, 100.0, 0.0)
    EndPosition = (0.0, 300.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 15.0
    lifetime = 7.0
    startradius = 25.0
    MidRadius = 30.0
    endradius = 100.0
    StartRadiusSpread = 10.0
    MidRadiusSpread = 10.0
    EndRadiusSpread = 25.0
    priority = 0
    texture = apm_spray_01
    BlendMode = Blend
    alphacutoff = 2
    startRGB = [69 , 73 , 77]
    startAlpha = 0
    endRGB = [120 , 120 , 128]
    endAlpha = 0
    midRGB = [94 , 102 , 102]
    midAlpha = 27
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
apm_ST_CHIMsmoke02_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    LocalSpace
    BoxDimsStart = (30.0, 10.0, 30.0)
    BoxDimsMid = (75.0, 25.0, 75.0)
    BoxDimsEnd = (200.0, 25.0, 200.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (20.0, 250.0, -20.0)
    EndPosition = (100.0, 500.0, -100.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 35.0
    lifetime = 10.0
    startradius = 25.0
    MidRadius = 40.0
    endradius = 100.0
    StartRadiusSpread = 10.0
    MidRadiusSpread = 10.0
    EndRadiusSpread = 25.0
    priority = 0
    texture = apm_spray_01
    BlendMode = Blend
    alphacutoff = 2
    startRGB = [23 , 24 , 26]
    startAlpha = 38
    endRGB = [72 , 72 , 77]
    endAlpha = 0
    midRGB = [46 , 51 , 51]
    midAlpha = 13
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
apm_ST_RoketLaunch01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDimsStart = (10.0, 10.0, 10.0)
    BoxDimsMid = (300.0, 100.0, 300.0)
    BoxDimsEnd = (500.0, 200.0, 500.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.0, 300.0, 0.0)
    EndPosition = (0.0, -100.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 500.0
    lifetime = 0.4000
    emitduration = 0.1000
    startradius = 100.0
    MidRadius = 50.0
    endradius = 20.0
    StartRadiusSpread = 10.0
    MidRadiusSpread = 5.0
    EndRadiusSpread = 5.0
    priority = 0
    texture = apm_spark_01
    BlendMode = Add
    alphacutoff = 1
    startRGB = [236 , 118 , 40]
    startAlpha = 128
    endRGB = [250 , 51 , 25]
    endAlpha = 0
    midRGB = [243 , 76 , 37]
    midAlpha = 112
    UseColorMidTime
    ColorMidTime = 50
}
apm_ST_Sootpoof01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    ObjID = skater
    bone = Bone_Pelvis
    LocalSpace
    BoxDimsStart = (10.0, 60.0, 10.0)
    BoxDimsMid = (100.0, 60.0, 100.0)
    BoxDimsEnd = (200.0, 60.0, 200.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.0, 10.0, 0.0)
    EndPosition = (0.0, 100.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 300.0
    lifetime = 0.4000
    emitduration = 0.2000
    startradius = 50.0
    MidRadius = 15.0
    endradius = 1.0
    StartRadiusSpread = 10.0
    MidRadiusSpread = 10.0
    EndRadiusSpread = 10.0
    priority = 0
    texture = apm_spray_01
    BlendMode = Blend
    alphacutoff = 2
    startRGB = [32 , 38 , 42]
    startAlpha = 44
    endRGB = [16 , 16 , 17]
    endAlpha = 0
    midRGB = [37 , 40 , 40]
    midAlpha = 105
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
apm_ST_Sooty01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    ObjID = skater
    bone = Bone_Pelvis
    LocalSpace
    enablerotate
    BoxDimsStart = (10.0, 60.0, 10.0)
    BoxDimsMid = (50.0, 60.0, 50.0)
    BoxDimsEnd = (75.0, 60.0, 75.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.0, 0.0, 0.0)
    EndPosition = (0.0, 0.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 60.0
    lifetime = 1.0
    startradius = 25.0
    MidRadius = 30.0
    endradius = 50.0
    StartRadiusSpread = 10.0
    MidRadiusSpread = 10.0
    EndRadiusSpread = 10.0
    priority = 0
    texture = apm_spray_01
    BlendMode = Blend
    alphacutoff = 2
    startRGB = [32 , 38 , 42]
    startAlpha = 0
    endRGB = [16 , 16 , 17]
    endAlpha = 0
    midRGB = [37 , 40 , 40]
    midAlpha = 105
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
apm_ST_SparkFountain01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    ObjID = skater
    LocalSpace
    BoxDimsStart = (30.0, 10.0, 30.0)
    BoxDimsMid = (300.0, 200.0, 300.0)
    BoxDimsEnd = (500.0, 200.0, 500.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.0, 1000.0, 0.0)
    EndPosition = (0.0, -200.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 300.0
    lifetime = 1.500
    startradius = 100.0
    MidRadius = 50.0
    endradius = 100.0
    StartRadiusSpread = 50.0
    MidRadiusSpread = 25.0
    EndRadiusSpread = 25.0
    priority = 1
    texture = apm_spark_01
    BlendMode = Add
    alphacutoff = 1
    startRGB = [226 , 236 , 236]
    startAlpha = 128
    endRGB = [25 , 197 , 250]
    endAlpha = 0
    midRGB = [93 , 220 , 243]
    midAlpha = 112
    UseColorMidTime
    ColorMidTime = 46
}
apm_ST_Spinner_sparks01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    boneoffset = (0.0, 0.0, -100.0)
    LocalSpace
    enablerotate
    BoxDimsStart = (0.0, 0.0, 0.0)
    BoxDimsMid = (50.0, 30.0, 50.0)
    BoxDimsEnd = (100.0, 45.0, 100.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.0, 0.0, -200.0)
    EndPosition = (0.0, -100.0, -500.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 100.0
    lifetime = 0.4000
    startradius = 25.0
    MidRadius = 15.0
    endradius = 5.0
    StartRadiusSpread = 5.0
    MidRadiusSpread = 2.500
    EndRadiusSpread = 1.0
    priority = 0
    texture = apm_spark_01
    BlendMode = Add
    alphacutoff = 1
    startRGB = [236 , 118 , 40]
    startAlpha = 128
    endRGB = [250 , 51 , 25]
    endAlpha = 0
    midRGB = [243 , 76 , 37]
    midAlpha = 112
    UseColorMidTime
    ColorMidTime = 50
}
apm_ST_Splash01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    BoxDimsStart = (20.0, 20.0, 300.0)
    BoxDimsMid = (20.0, 20.0, 300.0)
    BoxDimsEnd = (20.0, 20.0, 300.0)
    Pos = (1333.8900146484375, 6234.41015625, -1466.5)
    MidPosition = (1390.3599853515625, 6382.97021484375, -1525.300048828125)
    EndPosition = (1480.6800537109375, 6269.419921875, -1575.5400390625)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 500.0
    lifetime = 0.3000
    startradius = 50.0
    MidRadius = 20.0
    endradius = 50.0
    StartRadiusSpread = 10.0
    MidRadiusSpread = 10.0
    EndRadiusSpread = 40.0
    priority = 0
    texture = dt_nj_waterdrop05
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [221 , 229 , 229]
    startAlpha = 82
    endRGB = [223 , 231 , 231]
    endAlpha = 0
    midRGB = [221 , 229 , 229]
    midAlpha = 128
    UseColorMidTime
    ColorMidTime = 58
    useglobalcolormodulation
}
apm_ST_Splash02_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    LocalSpace
    BoxDimsStart = (50.0, 100.0, 50.0)
    BoxDimsMid = (100.0, 20.0, 100.0)
    BoxDimsEnd = (300.0, 20.0, 300.0)
    Pos = (0.0, 50.0, 0.0)
    MidPosition = (0.0, 100.0, 0.0)
    EndPosition = (0.0, 50.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 500.0
    lifetime = 0.3000
    emitduration = 0.3000
    startradius = 50.0
    MidRadius = 10.0
    endradius = 20.0
    StartRadiusSpread = 0.0
    MidRadiusSpread = 10.0
    EndRadiusSpread = 10.0
    priority = 0
    texture = dt_nj_waterdrop05
    BlendMode = Blend
    alphacutoff = 0
    startRGB = [221 , 229 , 229]
    startAlpha = 0
    endRGB = [223 , 231 , 231]
    endAlpha = 0
    midRGB = [234 , 242 , 242]
    midAlpha = 128
    UseColorMidTime
    ColorMidTime = 53
    useglobalcolormodulation
}
apm_ST_Splash03_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    LocalSpace
    BoxDimsStart = (0.0, 10.0, 0.0)
    BoxDimsMid = (250.0, 20.0, 250.0)
    BoxDimsEnd = (300.0, 20.0, 300.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.0, 20.0, 0.0)
    EndPosition = (0.0, 100.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 1000.0
    lifetime = 0.2000
    emitduration = 0.3000
    startradius = 50.0
    MidRadius = 25.0
    endradius = 10.0
    StartRadiusSpread = 0.0
    MidRadiusSpread = 29.0
    EndRadiusSpread = 1.0
    priority = 0
    texture = dt_nj_waterdrop05
    BlendMode = Blend
    alphacutoff = 0
    startRGB = [79 , 76 , 72]
    startAlpha = 99
    endRGB = [183 , 180 , 177]
    endAlpha = 0
    midRGB = [127 , 127 , 123]
    midAlpha = 128
    UseColorMidTime
    ColorMidTime = 45
    useglobalcolormodulation
}
apm_ST_TNTsparks01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    boneoffset = (0.0, 40.0, 0.0)
    LocalSpace
    BoxDimsStart = (0.0, 0.0, 0.0)
    BoxDimsMid = (50.0, 30.0, 50.0)
    BoxDimsEnd = (100.0, 45.0, 100.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.0, 10.0, 0.0)
    EndPosition = (0.0, -10.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 100.0
    lifetime = 0.4000
    startradius = 15.0
    MidRadius = 10.0
    endradius = 0.0
    StartRadiusSpread = 5.0
    MidRadiusSpread = 2.500
    EndRadiusSpread = 1.0
    priority = 0
    texture = apm_spark_01
    BlendMode = Add
    alphacutoff = 1
    startRGB = [236 , 118 , 40]
    startAlpha = 128
    endRGB = [250 , 51 , 25]
    endAlpha = 0
    midRGB = [243 , 76 , 37]
    midAlpha = 112
    UseColorMidTime
    ColorMidTime = 50
}
apm_ST_TREE_smoke01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    boneoffset = (0.0, 300.0, 0.0)
    LocalSpace
    BoxDimsStart = (250.0, 10.0, 250.0)
    BoxDimsMid = (300.0, 20.0, 300.0)
    BoxDimsEnd = (500.0, 60.0, 500.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.0, 350.0, 0.0)
    EndPosition = (0.0, 750.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 20.0
    lifetime = 5.0
    startradius = 100.0
    MidRadius = 100.0
    endradius = 200.0
    StartRadiusSpread = 50.0
    MidRadiusSpread = 50.0
    EndRadiusSpread = 100.0
    priority = 0
    texture = ba_apm_smokepuff01s
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [121 , 78 , 39]
    startAlpha = 0
    endRGB = [26 , 24 , 24]
    endAlpha = 0
    midRGB = [40 , 39 , 37]
    midAlpha = 128
    UseColorMidTime
    ColorMidTime = 62
}
apm_ST_Xplode01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDimsStart = (50.0, 0.0, 50.0)
    BoxDimsMid = (150.0, 10.0, 150.0)
    BoxDimsEnd = (500.0, 10.0, 500.0)
    Pos = (0.0, -5.0, 0.0)
    MidPosition = (0.0, 10.0, 0.0)
    EndPosition = (0.0, 100.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 500.0
    lod_dist2 = 1000.0
    emitrate = 300.0
    lifetime = 0.2000
    emitduration = 0.2000
    startradius = 10.0
    MidRadius = 50.0
    endradius = 100.0
    StartRadiusSpread = 5.0
    MidRadiusSpread = 2.0
    EndRadiusSpread = 5.0
    priority = 0
    texture = ba_apm_smokepuff01s
    BlendMode = Blend
    alphacutoff = 0
    startRGB = [226 , 116 , 46]
    startAlpha = 0
    endRGB = [55 , 51 , 50]
    endAlpha = 0
    midRGB = [64 , 37 , 27]
    midAlpha = 89
    UseColorMidTime
    ColorMidTime = 50
}
apm_ST_Xplode02_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDimsStart = (10.0, 30.0, 10.0)
    BoxDimsMid = (5.0, 10.0, 5.0)
    BoxDimsEnd = (300.0, 200.0, 300.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.0, 0.0, 0.0)
    EndPosition = (0.0, 0.5, 0.0)
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 200.0
    lifetime = 0.2000
    emitduration = 0.2000
    startradius = 0.0
    endradius = 100.0
    StartRadiusSpread = 0.0
    EndRadiusSpread = 5.0
    priority = 0
    texture = ba_apm_smokepuff01s
    BlendMode = Add
    alphacutoff = 0
    startRGB = [226 , 116 , 46]
    startAlpha = 47
    endRGB = [163 , 48 , 30]
    endAlpha = 0
    midRGB = [189 , 54 , 32]
    midAlpha = 128
    UseColorMidTime
    ColorMidTime = 50
}
apm_ST_bigsmoke01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    ObjID = skater
    boneoffset = (100.0, 0.0, 0.0)
    LocalSpace
    BoxDimsStart = (10.0, 10.0, 1000.0)
    BoxDimsMid = (20.0, 20.0, 1000.0)
    BoxDimsEnd = (60.0, 60.0, 1000.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.0, 250.0, 0.0)
    EndPosition = (0.0, 500.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 50.0
    lifetime = 4.0
    startradius = 100.0
    MidRadius = 100.0
    endradius = 200.0
    StartRadiusSpread = 50.0
    MidRadiusSpread = 50.0
    EndRadiusSpread = 100.0
    priority = 0
    texture = ba_apm_smokepuff01s
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [121 , 78 , 39]
    startAlpha = 30
    endRGB = [26 , 24 , 24]
    endAlpha = 0
    midRGB = [40 , 39 , 37]
    midAlpha = 112
    UseColorMidTime
    ColorMidTime = 50
}
apm_ST_bigsparks01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDimsStart = (30.0, 10.0, 30.0)
    BoxDimsMid = (200.0, 100.0, 200.0)
    BoxDimsEnd = (300.0, 200.0, 300.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.0, 50.0, 0.0)
    EndPosition = (0.0, 25.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 500.0
    lifetime = 0.4000
    emitduration = 0.3000
    startradius = 25.0
    MidRadius = 15.0
    endradius = 11.0
    StartRadiusSpread = 10.0
    MidRadiusSpread = 5.0
    EndRadiusSpread = 5.0
    priority = 0
    texture = apm_spark_01
    BlendMode = Add
    alphacutoff = 1
    startRGB = [236 , 118 , 40]
    startAlpha = 128
    endRGB = [250 , 51 , 25]
    endAlpha = 0
    midRGB = [243 , 76 , 37]
    midAlpha = 112
    UseColorMidTime
    ColorMidTime = 50
}
apm_ST_feather01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    boneoffset = (0.0, 40.0, 0.0)
    LocalSpace
    BoxDimsStart = (50.0, 40.0, 20.0)
    BoxDimsMid = (100.0, 80.0, 100.0)
    BoxDimsEnd = (100.0, 100.0, 100.0)
    Pos = (0.0, 5.0, 0.0)
    MidPosition = (0.0, 10.0, 40.0)
    EndPosition = (0.0, -20.0, -100.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 200.0
    lifetime = 1.0
    emitduration = 0.3000
    startradius = 3.0
    MidRadius = 3.0
    endradius = 3.0
    StartRadiusSpread = 2.0
    MidRadiusSpread = 2.0
    EndRadiusSpread = 2.0
    priority = 0
    texture = apm_feather01
    BlendMode = Blend
    alphacutoff = 2
    startRGB = [179 , 181 , 182]
    startAlpha = 120
    endRGB = [98 , 106 , 106]
    endAlpha = 0
    midRGB = [154 , 154 , 154]
    midAlpha = 77
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
apm_ST_feather02_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    boneoffset = (0.0, 40.0, 0.0)
    LocalSpace
    BoxDimsStart = (50.0, 40.0, 20.0)
    BoxDimsMid = (175.0, 80.0, 200.0)
    BoxDimsEnd = (100.0, 100.0, 100.0)
    Pos = (0.0, 5.0, 0.0)
    MidPosition = (0.0, 10.0, 40.0)
    EndPosition = (0.0, -20.0, -100.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 200.0
    lifetime = 1.0
    emitduration = 0.5000
    startradius = 3.0
    MidRadius = 3.0
    endradius = 3.0
    StartRadiusSpread = 2.0
    MidRadiusSpread = 2.0
    EndRadiusSpread = 2.0
    priority = 0
    texture = apm_feather02
    BlendMode = Blend
    alphacutoff = 2
    startRGB = [130 , 131 , 132]
    startAlpha = 117
    endRGB = [98 , 106 , 106]
    endAlpha = 0
    midRGB = [154 , 154 , 154]
    midAlpha = 77
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
apm_ST_feather03_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    boneoffset = (0.0, 40.0, 0.0)
    LocalSpace
    BoxDimsStart = (50.0, 40.0, 20.0)
    BoxDimsMid = (100.0, 80.0, 100.0)
    BoxDimsEnd = (100.0, 100.0, 100.0)
    Pos = (0.0, 5.0, 0.0)
    MidPosition = (0.0, 10.0, 40.0)
    EndPosition = (0.0, -20.0, -100.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 200.0
    lifetime = 1.0
    emitduration = 0.5000
    startradius = 3.0
    MidRadius = 3.0
    endradius = 3.0
    StartRadiusSpread = 2.0
    MidRadiusSpread = 2.0
    EndRadiusSpread = 2.0
    priority = 0
    texture = apm_feather03
    BlendMode = Blend
    alphacutoff = 2
    startRGB = [81 , 82 , 83]
    startAlpha = 126
    endRGB = [196 , 196 , 196]
    endAlpha = 0
    midRGB = [154 , 154 , 154]
    midAlpha = 77
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
apm_ST_feather04_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    boneoffset = (0.0, 40.0, 0.0)
    LocalSpace
    BoxDimsStart = (50.0, 40.0, 20.0)
    BoxDimsMid = (200.0, 80.0, 200.0)
    BoxDimsEnd = (100.0, 100.0, 100.0)
    Pos = (0.0, 5.0, 0.0)
    MidPosition = (0.0, 10.0, 40.0)
    EndPosition = (0.0, -20.0, -100.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 200.0
    lifetime = 1.0
    emitduration = 0.5000
    startradius = 3.0
    MidRadius = 3.0
    endradius = 3.0
    StartRadiusSpread = 2.0
    MidRadiusSpread = 2.0
    EndRadiusSpread = 2.0
    priority = 0
    texture = apm_feather04
    BlendMode = Blend
    alphacutoff = 2
    startRGB = [179 , 181 , 182]
    startAlpha = 120
    endRGB = [98 , 106 , 106]
    endAlpha = 0
    midRGB = [154 , 154 , 154]
    midAlpha = 77
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
apm_ST_fire01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    LocalSpace
    BoxDimsStart = (100.0, 0.0, 100.0)
    BoxDimsMid = (50.0, 25.0, 50.0)
    BoxDimsEnd = (30.0, 80.0, 30.0)
    Pos = (0.0, -5.0, 0.0)
    MidPosition = (0.0, 25.0, 0.0)
    EndPosition = (0.0, 100.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 500.0
    lod_dist2 = 1000.0
    emitrate = 333.0
    lifetime = 1.0
    startradius = 15.0
    MidRadius = 15.0
    endradius = 10.0
    StartRadiusSpread = 10.0
    MidRadiusSpread = 5.0
    EndRadiusSpread = 5.0
    priority = 2
    texture = apm_flame_01
    BlendMode = Add
    alphacutoff = 0
    startRGB = [229 , 85 , 23]
    startAlpha = 0
    endRGB = [248 , 52 , 43]
    endAlpha = 0
    midRGB = [227 , 55 , 29]
    midAlpha = 96
    UseColorMidTime
    ColorMidTime = 50
}
apm_ST_fire01b_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    LocalSpace
    BoxDimsStart = (30.0, 0.0, 30.0)
    BoxDimsMid = (150.0, 100.0, 150.0)
    BoxDimsEnd = (220.0, 250.0, 220.0)
    Pos = (0.0, -25.0, 0.0)
    MidPosition = (0.0, 100.0, 0.0)
    EndPosition = (0.0, -50.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 25.0
    lifetime = 2.0
    startradius = 50.0
    MidRadius = 5.0
    endradius = 0.0
    StartRadiusSpread = 5.0
    MidRadiusSpread = 10.0
    EndRadiusSpread = 5.0
    priority = 0
    texture = apm_spark_01
    BlendMode = Add
    alphacutoff = 0
    startRGB = [229 , 94 , 23]
    startAlpha = 128
    endRGB = [248 , 69 , 43]
    endAlpha = 0
    midRGB = [227 , 80 , 29]
    midAlpha = 64
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
apm_ST_fire01c_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    LocalSpace
    BoxDimsStart = (100.0, 0.0, 100.0)
    BoxDimsMid = (150.0, 10.0, 150.0)
    BoxDimsEnd = (175.0, 10.0, 175.0)
    Pos = (0.0, -5.0, 0.0)
    MidPosition = (0.0, 10.0, 0.0)
    EndPosition = (0.0, 100.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 500.0
    lod_dist2 = 1000.0
    emitrate = 50.0
    lifetime = 2.0
    startradius = 10.0
    MidRadius = 5.0
    endradius = 0.0
    StartRadiusSpread = 5.0
    MidRadiusSpread = 2.0
    EndRadiusSpread = 5.0
    priority = 0
    texture = apm_spray_01
    BlendMode = Add
    alphacutoff = 0
    startRGB = [226 , 116 , 46]
    startAlpha = 0
    endRGB = [55 , 51 , 50]
    endAlpha = 0
    midRGB = [194 , 81 , 43]
    midAlpha = 105
    UseColorMidTime
    ColorMidTime = 50
}
apm_ST_fire02_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    LocalSpace
    BoxDimsStart = (20.0, 0.0, 20.0)
    BoxDimsMid = (30.0, 25.0, 30.0)
    BoxDimsEnd = (20.0, 80.0, 20.0)
    Pos = (0.0, -25.0, 0.0)
    MidPosition = (0.0, 50.0, 0.0)
    EndPosition = (0.0, 150.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 100.0
    lifetime = 1.0
    startradius = 30.0
    MidRadius = 25.0
    endradius = 10.0
    StartRadiusSpread = 10.0
    MidRadiusSpread = 5.0
    EndRadiusSpread = 5.0
    priority = 0
    texture = apm_spray_01
    BlendMode = Add
    alphacutoff = 0
    startRGB = [229 , 147 , 23]
    startAlpha = 0
    endRGB = [248 , 69 , 43]
    endAlpha = 0
    midRGB = [227 , 99 , 29]
    midAlpha = 128
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
apm_ST_fireBASE01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDimsStart = (100.0, 0.0, 500.0)
    BoxDimsMid = (100.0, 5.0, 500.0)
    BoxDimsEnd = (100.0, 5.0, 500.0)
    Pos = (0.0, 5.0, 0.0)
    MidPosition = (0.0, 20.0, 0.0)
    EndPosition = (0.0, 30.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 500.0
    lod_dist2 = 1000.0
    emitrate = 300.0
    lifetime = 1.0
    startradius = 10.0
    MidRadius = 50.0
    endradius = 10.0
    StartRadiusSpread = 10.0
    MidRadiusSpread = 5.0
    EndRadiusSpread = 5.0
    priority = 2
    texture = apm_flame_01
    BlendMode = Add
    alphacutoff = 0
    startRGB = [255 , 122 , 64]
    startAlpha = 0
    endRGB = [248 , 140 , 43]
    endAlpha = 0
    midRGB = [255 , 132 , 53]
    midAlpha = 96
    UseColorMidTime
    ColorMidTime = 50
}
apm_ST_fireBASE02_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDimsStart = (500.0, 0.0, 100.0)
    BoxDimsMid = (500.0, 5.0, 100.0)
    BoxDimsEnd = (500.0, 5.0, 100.0)
    Pos = (0.0, 5.0, 0.0)
    MidPosition = (0.0, 20.0, 0.0)
    EndPosition = (0.0, 30.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 500.0
    lod_dist2 = 1000.0
    emitrate = 300.0
    lifetime = 1.0
    startradius = 10.0
    MidRadius = 50.0
    endradius = 10.0
    StartRadiusSpread = 10.0
    MidRadiusSpread = 5.0
    EndRadiusSpread = 5.0
    priority = 2
    texture = apm_flame_01
    BlendMode = Add
    alphacutoff = 0
    startRGB = [255 , 122 , 64]
    startAlpha = 0
    endRGB = [248 , 140 , 43]
    endAlpha = 0
    midRGB = [255 , 132 , 53]
    midAlpha = 96
    UseColorMidTime
    ColorMidTime = 50
}
apm_ST_fire_Sign_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDimsStart = (50.0, 50.0, 50.0)
    BoxDimsMid = (100.0, 30.0, 100.0)
    BoxDimsEnd = (75.0, 54.0, 75.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.0, 20.0, 0.0)
    EndPosition = (0.0, 50.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 100.0
    lifetime = 1.0
    startradius = 30.0
    MidRadius = 20.0
    endradius = 10.0
    StartRadiusSpread = 10.0
    MidRadiusSpread = 5.0
    EndRadiusSpread = 5.0
    priority = 2
    texture = apm_flame_01
    BlendMode = Add
    alphacutoff = 0
    startRGB = [229 , 69 , 0]
    startAlpha = 0
    endRGB = [248 , 52 , 43]
    endAlpha = 0
    midRGB = [227 , 69 , 0]
    midAlpha = 96
    UseColorMidTime
    ColorMidTime = 50
}
apm_ST_fire_TREE01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDimsStart = (100.0, 50.0, 100.0)
    BoxDimsMid = (250.0, 50.0, 250.0)
    BoxDimsEnd = (250.0, 80.0, 200.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.0, 100.0, 0.0)
    EndPosition = (0.0, 500.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 333.0
    lifetime = 2.0
    startradius = 15.0
    MidRadius = 50.0
    endradius = 10.0
    StartRadiusSpread = 10.0
    MidRadiusSpread = 5.0
    EndRadiusSpread = 5.0
    priority = 2
    texture = apm_flame_01
    BlendMode = Add
    alphacutoff = 0
    startRGB = [229 , 69 , 0]
    startAlpha = 0
    endRGB = [248 , 52 , 43]
    endAlpha = 0
    midRGB = [227 , 30 , 0]
    midAlpha = 96
    UseColorMidTime
    ColorMidTime = 50
}
apm_ST_greenBlast01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    LocalSpace
    BoxDimsStart = (20.0, 0.0, 20.0)
    BoxDimsMid = (100.0, 25.0, 100.0)
    BoxDimsEnd = (0.0, 0.0, 0.0)
    Pos = (0.0, -25.0, 0.0)
    MidPosition = (0.0, 50.0, 0.0)
    EndPosition = (0.0, 100.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 500.0
    lifetime = 0.5000
    emitduration = 3.0
    startradius = 50.0
    MidRadius = 10.0
    endradius = 10.0
    StartRadiusSpread = 10.0
    MidRadiusSpread = 5.0
    EndRadiusSpread = 5.0
    priority = 0
    texture = apm_fallingwater_01
    BlendMode = Add
    alphacutoff = 0
    startRGB = [134 , 229 , 23]
    startAlpha = 0
    endRGB = [72 , 132 , 77]
    endAlpha = 0
    midRGB = [46 , 165 , 51]
    midAlpha = 128
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
apm_ST_greenBlast02_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    LocalSpace
    BoxDimsStart = (20.0, 0.0, 20.0)
    BoxDimsMid = (10.0, 4.0, 10.0)
    BoxDimsEnd = (100.0, 0.0, 100.0)
    Pos = (0.0, 500.0, 0.0)
    MidPosition = (0.0, 30.0, 0.0)
    EndPosition = (0.0, 20.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 500.0
    lifetime = 1.0
    emitduration = 2.0
    startradius = 10.0
    MidRadius = 15.0
    endradius = 10.0
    StartRadiusSpread = 10.0
    MidRadiusSpread = 5.0
    EndRadiusSpread = 5.0
    priority = 0
    texture = apm_fallingwater_01
    BlendMode = Add
    alphacutoff = 0
    startRGB = [134 , 229 , 23]
    startAlpha = 0
    endRGB = [72 , 132 , 77]
    endAlpha = 0
    midRGB = [46 , 165 , 51]
    midAlpha = 128
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
apm_ST_pipeSpray01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    BoxDimsStart = (0.0, 0.0, 0.0)
    BoxDimsMid = (20.0, 20.0, 20.0)
    BoxDimsEnd = (40.0, 20.0, 40.0)
    Pos = (-221.18099975585938, 6006.0, 2108.340087890625)
    MidPosition = (-287.9280090332031, 5943.16015625, 2095.989990234375)
    EndPosition = (-321.3909912109375, 5781.93994140625, 2093.360107421875)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 100.0
    lifetime = 1.0
    startradius = 7.0
    MidRadius = 25.0
    endradius = 50.0
    StartRadiusSpread = 5.0
    MidRadiusSpread = 10.0
    EndRadiusSpread = 25.0
    priority = 0
    texture = dt_nj_waterdrop05
    BlendMode = Blend
    alphacutoff = 2
    startRGB = [179 , 181 , 182]
    startAlpha = 120
    endRGB = [154 , 167 , 167]
    endAlpha = 0
    midRGB = [191 , 207 , 207]
    midAlpha = 77
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
apm_ST_rocket_sparks01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    boneoffset = (0.0, 40.0, 0.0)
    LocalSpace
    enablerotate
    BoxDimsStart = (0.0, 0.0, 0.0)
    BoxDimsMid = (50.0, 30.0, 50.0)
    BoxDimsEnd = (75.0, 45.0, 75.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.0, -200.0, 0.0)
    EndPosition = (0.0, -700.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 200.0
    lifetime = 0.2000
    emitduration = 0.4000
    startradius = 100.0
    MidRadius = 50.0
    endradius = 10.0
    StartRadiusSpread = 5.0
    MidRadiusSpread = 2.500
    EndRadiusSpread = 1.0
    priority = 0
    texture = apm_spark_01
    BlendMode = Add
    alphacutoff = 1
    startRGB = [236 , 118 , 40]
    startAlpha = 128
    endRGB = [250 , 51 , 25]
    endAlpha = 0
    midRGB = [243 , 76 , 37]
    midAlpha = 128
    UseColorMidTime
    ColorMidTime = 50
}
apm_ST_rocket_xploder01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    boneoffset = (0.0, 0.0, -100.0)
    LocalSpace
    BoxDimsStart = (10.0, 10.0, 10.0)
    BoxDimsMid = (3000.0, 1000.0, 3000.0)
    BoxDimsEnd = (4000.0, 1000.0, 2000.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.0, -50.0, 0.0)
    EndPosition = (0.0, -5000.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 500.0
    lifetime = 2.0
    emitduration = 0.2000
    startradius = 200.0
    MidRadius = 100.0
    endradius = 25.0
    StartRadiusSpread = 100.0
    MidRadiusSpread = 50.0
    EndRadiusSpread = 5.0
    priority = 1
    texture = apm_spark_01
    BlendMode = Add
    alphacutoff = 1
    startRGB = [236 , 91 , 40]
    startAlpha = 128
    endRGB = [250 , 25 , 25]
    endAlpha = 0
    midRGB = [243 , 37 , 37]
    midAlpha = 112
    UseColorMidTime
    ColorMidTime = 44
}
apm_ST_rocket_xploder02_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    ObjID = skater
    LocalSpace
    BoxDimsStart = (30.0, 10.0, 30.0)
    BoxDimsMid = (1000.0, 500.0, 1000.0)
    BoxDimsEnd = (2000.0, 500.0, 2000.0)
    Pos = (0.0, 100.0, 0.0)
    MidPosition = (0.0, 200.0, 0.0)
    EndPosition = (0.0, 500.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 100.0
    lifetime = 2.0
    emitduration = 0.2000
    startradius = 100.0
    MidRadius = 400.0
    endradius = 500.0
    StartRadiusSpread = 10.0
    MidRadiusSpread = 5.0
    EndRadiusSpread = 5.0
    priority = 0
    texture = ba_apm_smokepuff01s
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [61 , 19 , 15]
    startAlpha = 21
    endRGB = [0 , 0 , 0]
    endAlpha = 0
    midRGB = [17 , 15 , 15]
    midAlpha = 81
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
apm_ST_rocket_xploder03_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    ObjID = skater
    boneoffset = (0.0, 0.0, -100.0)
    LocalSpace
    BoxDimsStart = (30.0, 10.0, 30.0)
    BoxDimsMid = (2000.0, 200.0, 2000.0)
    BoxDimsEnd = (4000.0, 500.0, 4000.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.0, 50.0, 0.0)
    EndPosition = (0.0, -500.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 500.0
    lifetime = 1.0
    emitduration = 0.1000
    startradius = 200.0
    MidRadius = 100.0
    endradius = 25.0
    StartRadiusSpread = 10.0
    MidRadiusSpread = 5.0
    EndRadiusSpread = 5.0
    priority = 1
    texture = apm_spark_01
    BlendMode = Add
    alphacutoff = 1
    startRGB = [41 , 81 , 230]
    startAlpha = 128
    endRGB = [41 , 81 , 230]
    endAlpha = 0
    midRGB = [41 , 81 , 230]
    midAlpha = 128
    UseColorMidTime
    ColorMidTime = 50
}
apm_ST_rocket_xploder04_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    ObjID = skater
    boneoffset = (300.0, 0.0, -300.0)
    LocalSpace
    BoxDimsStart = (30.0, 10.0, 30.0)
    BoxDimsMid = (500.0, 250.0, 500.0)
    BoxDimsEnd = (1000.0, 500.0, 1000.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.0, 50.0, 0.0)
    EndPosition = (0.0, 25.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 500.0
    lifetime = 0.4000
    EmitDelay = 0.1000
    emitduration = 0.2000
    startradius = 100.0
    MidRadius = 50.0
    endradius = 11.0
    StartRadiusSpread = 10.0
    MidRadiusSpread = 5.0
    EndRadiusSpread = 5.0
    priority = 1
    texture = apm_spark_01
    BlendMode = Add
    alphacutoff = 1
    startRGB = [236 , 225 , 217]
    startAlpha = 128
    endRGB = [250 , 51 , 25]
    endAlpha = 0
    midRGB = [243 , 165 , 37]
    midAlpha = 112
    UseColorMidTime
    ColorMidTime = 50
}
apm_ST_trashSmoke01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    boneoffset = (0.0, 100.0, 0.0)
    LocalSpace
    BoxDimsStart = (300.0, 10.0, 300.0)
    BoxDimsMid = (200.0, 20.0, 200.0)
    BoxDimsEnd = (200.0, 60.0, 200.0)
    Pos = (0.0, 100.0, 0.0)
    MidPosition = (0.0, 300.0, 0.0)
    EndPosition = (0.0, 700.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 400.0
    lod_dist2 = 1000.0
    emitrate = 10.0
    lifetime = 6.0
    startradius = 75.0
    MidRadius = 100.0
    endradius = 150.0
    StartRadiusSpread = 50.0
    MidRadiusSpread = 50.0
    EndRadiusSpread = 50.0
    priority = 0
    texture = ba_apm_smokepuff01s
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [81 , 53 , 31]
    startAlpha = 1
    endRGB = [26 , 24 , 24]
    endAlpha = 0
    midRGB = [29 , 29 , 28]
    midAlpha = 128
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
apm_bigfire01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    BoxDimsStart = (500.0, 10.0, 10.0)
    BoxDimsMid = (500.0, 20.0, 10.0)
    BoxDimsEnd = (500.0, 60.0, 10.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.0, 100.0, 0.0)
    EndPosition = (0.0, 500.0, 0.0)
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 300.0
    lifetime = 0.5000
    startradius = 100.0
    endradius = 100.0
    StartRadiusSpread = 50.0
    EndRadiusSpread = 0.0
    priority = 0
    texture = apm_spray_01
    BlendMode = Add
    alphacutoff = 1
    startRGB = [255 , 112 , 62]
    startAlpha = 64
    endRGB = [255 , 187 , 0]
    endAlpha = 15
    midRGB = [0 , 255 , 0]
    midAlpha = 64
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
apm_st_radioWaves_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    ObjID = skater
    LocalSpace
    BoxDimsStart = (1.0, 1.0, 1.0)
    BoxDimsMid = (1.0, 1.0, 1.0)
    BoxDimsEnd = (1.0, 1.0, 1.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.0, 0.0, 0.0)
    EndPosition = (0.0, 0.0, 0.0)
    UseMidPoint
    MidPointPCT = 50.0
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 2.0
    lifetime = 2.0
    startradius = 1.0
    MidRadius = 100.0
    endradius = 200.0
    priority = 0
    texture = apm_ring_01
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [233 , 249 , 255]
    startAlpha = 128
    endRGB = [233 , 249 , 255]
    endAlpha = 0
    useglobalcolormodulation
}
