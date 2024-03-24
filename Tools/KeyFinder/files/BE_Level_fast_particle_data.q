

script load_level_fast_particle_textures 
    LoadParticleTexture 'particles\apm_spark_01'
    LoadParticleTexture 'particles\dt_nj_waterdrop05'
    LoadParticleTexture 'particles\apm_spray_01'
    LoadParticleTexture 'particles\apm_fallingwater_01'
    LoadParticleTexture 'particles\apm_water_splash01'
    LoadParticleTexture 'particles\apm_leaf01'
    LoadParticleTexture 'particles\apm_leaf02'
    LoadParticleTexture 'particles\apm_leaf03'
    LoadParticleTexture 'particles\apm_leaf04'
    LoadParticleTexture 'particles\ba_apm_smokepuff01s'
    LoadParticleTexture 'particles\apm_debis_02'
    LoadParticleTexture 'particles\apm_ring_02'
endscript

APM_BE_lightbulb01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    LocalSpace
    BoxDimsStart = (10.0, 10.0, 10.0)
    BoxDimsMid = (100.0, 10.0, 100.0)
    BoxDimsEnd = (200.0, 60.0, 200.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.0, -20.0, 0.0)
    EndPosition = (0.0, -100.0, 0.0)
    UseMidPoint
    MidPointPCT = 50
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 2000.0
    lifetime = 0.3500
    emitduration = 0.1000
    startradius = 10.0
    MidRadius = 10.0
    endradius = 5.0
    StartRadiusSpread = 0.0
    MidRadiusSpread = 5.0
    EndRadiusSpread = 5.0
    texture = apm_spark_01
    BlendMode = Add
    alphacutoff = 1
    startRGB = [255 , 87 , 40]
    startAlpha = 196
    endRGB = [255 , 220 , 123]
    endAlpha = 0
    useglobalcolormodulation
}
JOW_BE_PubBarrels01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    BoxDimsStart = (20.0, 31.0, 20.0)
    BoxDimsMid = (150.0, 60.0, 150.0)
    BoxDimsEnd = (200.0, 24.0, 200.0)
    Pos = (2723.080078125, 89.2300033569336, 2280.159912109375)
    MidPosition = (2723.110107421875, 115.0, 2280.159912109375)
    EndPosition = (2723.139892578125, 50.0, 2280.159912109375)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 250.0
    lifetime = 0.7500
    emitduration = 0.5000
    startradius = 20.0
    MidRadius = 15.0
    endradius = 10.0
    StartRadiusSpread = 3.0
    MidRadiusSpread = 3.0
    EndRadiusSpread = 2.0
    priority = 0
    texture = dt_nj_waterdrop05
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [116 , 96 , 42]
    startAlpha = 128
    endRGB = [209 , 195 , 158]
    endAlpha = 128
    midRGB = [178 , 151 , 81]
    midAlpha = 128
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
JOW_BE_PubBarrels02_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    BoxDimsStart = (20.0, 31.0, 20.0)
    BoxDimsMid = (150.0, 60.0, 150.0)
    BoxDimsEnd = (200.0, 24.0, 200.0)
    Pos = (2703.510009765625, 89.2300033569336, 2366.14990234375)
    MidPosition = (2703.5400390625, 116.0, 2366.14990234375)
    EndPosition = (2703.570068359375, 60.0, 2366.14990234375)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 500.0
    lifetime = 0.7500
    emitduration = 0.5000
    startradius = 15.0
    MidRadius = 10.0
    endradius = 10.0
    StartRadiusSpread = 8.0
    MidRadiusSpread = 5.0
    EndRadiusSpread = 5.0
    priority = 0
    texture = dt_nj_waterdrop05
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [116 , 96 , 42]
    startAlpha = 128
    endRGB = [226 , 206 , 156]
    endAlpha = 128
    midRGB = [178 , 154 , 88]
    midAlpha = 128
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
apm_BE_DoorDust01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    ObjID = skater
    LocalSpace
    BoxDimsStart = (10.0, 10.0, 10.0)
    BoxDimsMid = (200.0, 100.0, 200.0)
    BoxDimsEnd = (200.0, 100.0, 200.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.0, 0.0, 0.0)
    EndPosition = (0.0, 60.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 300.0
    lifetime = 2.0
    emitduration = 0.1000
    startradius = 25.0
    MidRadius = 50.0
    endradius = 100.0
    StartRadiusSpread = 10.0
    MidRadiusSpread = 20.0
    EndRadiusSpread = 10.0
    texture = apm_spray_01
    BlendMode = Blend
    alphacutoff = 2
    startRGB = [128 , 117 , 117]
    startAlpha = 125
    endRGB = [77 , 71 , 71]
    endAlpha = 0
    midRGB = [102 , 94 , 94]
    midAlpha = 22
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
apm_BE_DoorDust02_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    ObjID = skater
    LocalSpace
    BoxDimsStart = (10.0, 10.0, 10.0)
    BoxDimsMid = (200.0, 100.0, 200.0)
    BoxDimsEnd = (300.0, 100.0, 300.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.0, 0.0, 0.0)
    EndPosition = (0.0, 60.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0
    lod_dist2 = 0
    emitrate = 50.0
    lifetime = 5.0
    emitduration = 3.0
    startradius = 20.0
    MidRadius = 60.0
    endradius = 80.0
    StartRadiusSpread = 10.0
    MidRadiusSpread = 20.0
    EndRadiusSpread = 10.0
    texture = apm_spray_01
    BlendMode = Blend
    alphacutoff = 2
    startRGB = [128 , 117 , 117]
    startAlpha = 0
    endRGB = [77 , 71 , 71]
    endAlpha = 0
    midRGB = [102 , 94 , 94]
    midAlpha = 42
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
apm_BE_fishtank01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    ObjID = skater
    LocalSpace
    BoxDimsStart = (150.0, 20.0, 20.0)
    BoxDimsMid = (175.0, 20.0, 20.0)
    BoxDimsEnd = (200.0, 20.0, 50.0)
    Pos = (0.0, 0.0, -40.0)
    MidPosition = (1.4047900438308716, 18.843700408935547, 90.0)
    EndPosition = (-2.855710029602051, -129.6909942626953, 142.23399353027344)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 600.0
    lifetime = 1.0
    startradius = 20.0
    MidRadius = 30.0
    endradius = 50.0
    priority = 0
    texture = apm_fallingwater_01
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [153 , 153 , 153]
    startAlpha = 0
    endRGB = [147 , 151 , 153]
    endAlpha = 77
    midRGB = [134 , 138 , 139]
    midAlpha = 77
    UseColorMidTime
    ColorMidTime = 50
}
apm_BE_fishtank02_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    ObjID = skater
    LocalSpace
    BoxDimsStart = (1.0, 1.0, 1.0)
    BoxDimsMid = (5.0, 40.0, 5.0)
    BoxDimsEnd = (20.0, 80.0, 20.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (9.131349563598633, 0.0, 38.13330078125)
    EndPosition = (24.411399841308594, -30.0, 91.85679626464844)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 300.0
    lifetime = 0.5100
    startradius = 10.0
    MidRadius = 10.0
    endradius = 5.0
    StartRadiusSpread = 5.0
    MidRadiusSpread = 5.0
    EndRadiusSpread = 1.0
    priority = 0
    texture = apm_water_splash01
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [191 , 211 , 218]
    startAlpha = 128
    endRGB = [147 , 151 , 153]
    endAlpha = 0
    midRGB = [200 , 200 , 200]
    midAlpha = 77
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
apm_BE_leaf01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    LocalSpace
    BoxDimsStart = (300.0, 10.0, 300.0)
    BoxDimsMid = (200.0, 20.0, 200.0)
    BoxDimsEnd = (300.0, 10.0, 300.0)
    Pos = (0.0, 50.0, 0.0)
    MidPosition = (0.0, -100.0, 0.0)
    EndPosition = (0.0, -200.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 3.0
    lifetime = 7.500
    emitduration = 5.0
    startradius = 7.0
    MidRadius = 7.0
    endradius = 7.0
    StartRadiusSpread = 4.0
    MidRadiusSpread = 4.0
    EndRadiusSpread = 4.0
    priority = 0
    texture = apm_leaf01
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [77 , 67 , 52]
    startAlpha = 235
    endRGB = [116 , 102 , 81]
    endAlpha = 0
    midRGB = [102 , 86 , 61]
    midAlpha = 235
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
apm_BE_leaf02_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    LocalSpace
    BoxDimsStart = (200.0, 10.0, 200.0)
    BoxDimsMid = (300.0, 20.0, 300.0)
    BoxDimsEnd = (200.0, 10.0, 200.0)
    Pos = (0.0, 50.0, 0.0)
    MidPosition = (0.0, -100.0, 0.0)
    EndPosition = (0.0, -200.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 1.0
    lifetime = 7.500
    emitduration = 5.0
    startradius = 7.0
    MidRadius = 7.0
    endradius = 7.0
    StartRadiusSpread = 4.0
    MidRadiusSpread = 4.0
    EndRadiusSpread = 4.0
    priority = 0
    texture = apm_leaf02
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [77 , 47 , 0]
    startAlpha = 235
    endRGB = [116 , 70 , 0]
    endAlpha = 0
    midRGB = [102 , 62 , 0]
    midAlpha = 235
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
apm_BE_leaf03_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    LocalSpace
    BoxDimsStart = (200.0, 10.0, 200.0)
    BoxDimsMid = (200.0, 20.0, 200.0)
    BoxDimsEnd = (200.0, 10.0, 200.0)
    Pos = (0.0, 50.0, 0.0)
    MidPosition = (0.0, -100.0, 0.0)
    EndPosition = (0.0, -200.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 2.0
    lifetime = 6.0
    emitduration = 4.500
    startradius = 7.0
    MidRadius = 7.0
    endradius = 7.0
    StartRadiusSpread = 4.0
    MidRadiusSpread = 4.0
    EndRadiusSpread = 4.0
    priority = 0
    texture = apm_leaf03
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [102 , 93 , 78]
    startAlpha = 235
    endRGB = [140 , 123 , 98]
    endAlpha = 0
    midRGB = [128 , 112 , 89]
    midAlpha = 235
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
apm_BE_leaf04_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    LocalSpace
    BoxDimsStart = (300.0, 10.0, 200.0)
    BoxDimsMid = (200.0, 20.0, 200.0)
    BoxDimsEnd = (200.0, 10.0, 200.0)
    Pos = (0.0, 50.0, 0.0)
    MidPosition = (0.0, -100.0, 0.0)
    EndPosition = (0.0, -200.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 1.0
    lifetime = 8.0
    emitduration = 4.0
    startradius = 7.0
    MidRadius = 7.0
    endradius = 7.0
    StartRadiusSpread = 4.0
    MidRadiusSpread = 4.0
    EndRadiusSpread = 4.0
    priority = 0
    texture = apm_leaf04
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [77 , 70 , 59]
    startAlpha = 235
    endRGB = [102 , 90 , 71]
    endAlpha = 0
    midRGB = [102 , 89 , 71]
    midAlpha = 235
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
apm_BE_spark01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    LocalSpace
    BoxDimsStart = (3.0, 3.0, 3.0)
    BoxDimsMid = (5.0, 5.0, 5.0)
    BoxDimsEnd = (10.0, 10.0, 10.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.0, 0.0, 0.0)
    EndPosition = (0.0, 0.0, 0.0)
    UseMidPoint
    MidPointPCT = 50
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 50.0
    lifetime = 0.1000
    startradius = 20.0
    MidRadius = 10.0
    endradius = 1.0
    StartRadiusSpread = 5.0
    MidRadiusSpread = 5.0
    EndRadiusSpread = 0.0
    texture = apm_spark_01
    BlendMode = Add
    alphacutoff = 1
    startRGB = [125 , 173 , 255]
    startAlpha = 128
    endRGB = [194 , 217 , 255]
    endAlpha = 0
}
apm_BE_spark_lilXPLD01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    LocalSpace
    BoxDimsStart = (3.0, 3.0, 3.0)
    BoxDimsMid = (40.0, 5.0, 40.0)
    BoxDimsEnd = (50.0, 10.0, 50.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.0, 20.0, 0.0)
    EndPosition = (0.0, 0.0, 0.0)
    UseMidPoint
    MidPointPCT = 50
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 200.0
    lifetime = 0.2000
    emitduration = 0.2000
    startradius = 10.0
    MidRadius = 5.0
    endradius = 1.0
    StartRadiusSpread = 5.0
    MidRadiusSpread = 5.0
    EndRadiusSpread = 0.0
    priority = 0
    texture = apm_spark_01
    BlendMode = Add
    alphacutoff = 1
    startRGB = [125 , 173 , 255]
    startAlpha = 128
    endRGB = [194 , 217 , 255]
    endAlpha = 0
}
apm_spraycan01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    BoxDimsStart = (10.0, 10.0, 10.0)
    BoxDimsMid = (50.0, 10.0, 50.0)
    BoxDimsEnd = (60.0, 10.0, 60.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.0, 20.0, 2.0)
    EndPosition = (0.0, 50.0, 5.0)
    UseMidPoint
    MidPointPCT = 50
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 120.0
    lifetime = 0.5000
    emitduration = 0.05000
    startradius = 10.0
    MidRadius = 25.0
    endradius = 50.0
    StartRadiusSpread = 10.0
    MidRadiusSpread = 10.0
    EndRadiusSpread = 20.0
    texture = ba_apm_smokepuff01s
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [153 , 153 , 153]
    startAlpha = 64
    endRGB = [128 , 128 , 128]
    endAlpha = 0
    useglobalcolormodulation
}
apm_spraycan02_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    ObjID = skater
    bone = Bone_Chest
    LocalSpace
    BoxDimsStart = (10.0, 10.0, 10.0)
    BoxDimsMid = (100.0, 60.0, 100.0)
    BoxDimsEnd = (150.0, 100.0, 150.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.0, -10.0, 0.0)
    EndPosition = (0.0, -40.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 200.0
    lifetime = 0.2000
    emitduration = 0.1000
    startradius = 20.0
    MidRadius = 10.0
    endradius = 5.0
    StartRadiusSpread = 10.0
    MidRadiusSpread = 10.0
    EndRadiusSpread = 20.0
    texture = apm_debis_02
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [77 , 77 , 77]
    startAlpha = 128
    endRGB = [77 , 77 , 77]
    endAlpha = 0
    midRGB = [26 , 26 , 26]
    midAlpha = 139
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
apm_spraycan03_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    boneoffset = (0.0, 0.0, 15.0)
    LocalSpace
    enablerotate
    BoxDimsStart = (0.0, 0.0, 0.0)
    BoxDimsMid = (10.0, 0.0, 10.0)
    BoxDimsEnd = (25.0, 0.0, 25.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.0, 0.0, 0.0)
    EndPosition = (0.0, 0.0, 0.0)
    UseMidPoint
    MidPointPCT = 50
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 120.0
    lifetime = 0.1000
    EmitDelay = 0.1000
    emitduration = 0.05000
    startradius = 1.0
    MidRadius = 15.0
    endradius = 30.0
    StartRadiusSpread = 1.0
    MidRadiusSpread = 10.0
    EndRadiusSpread = 20.0
    texture = apm_ring_02
    BlendMode = Add
    alphacutoff = 1
    startRGB = [153 , 125 , 96]
    startAlpha = 255
    endRGB = [128 , 43 , 43]
    endAlpha = 0
    useglobalcolormodulation
}
