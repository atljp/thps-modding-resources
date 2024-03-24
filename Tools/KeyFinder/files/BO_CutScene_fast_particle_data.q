

script load_cutscene_fast_particle_textures 
    LoadParticleTexture 'particles\ba_apm_smokepuff01s'
    LoadParticleTexture 'particles\apm_ring_02'
    LoadParticleTexture 'particles\apm_spray_01'
    LoadParticleTexture 'particles\apm_spark_03'
    LoadParticleTexture 'particles\apm_spark_01'
    LoadParticleTexture 'particles\apm_debis_02'
    LoadParticleTexture 'particles\apm_debis_01'
    LoadParticleTexture 'particles\cod_splash'
endscript

apm_BOc1_BigSmoke01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    LocalSpace
    BoxDimsStart = (300.0, 60.0, 100.0)
    BoxDimsMid = (600.0, 60.0, 100.0)
    BoxDimsEnd = (900.0, 60.0, 100.0)
    Pos = (0.0, 400.0, 100.0)
    MidPosition = (0.0, 1000.0, 100.0)
    EndPosition = (0.0, 2000.0, 100.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 25.0
    lifetime = 4.0
    startradius = 200.0
    MidRadius = 300.0
    endradius = 500.0
    StartRadiusSpread = 0.0
    MidRadiusSpread = 100.0
    EndRadiusSpread = 250.0
    texture = ba_apm_smokepuff01s
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [37 , 35 , 34]
    startAlpha = 0
    endRGB = [29 , 29 , 29]
    endAlpha = 0
    midRGB = [42 , 42 , 42]
    midAlpha = 75
    UseColorMidTime
    ColorMidTime = 70
    useglobalcolormodulation
}
apm_BOc1_xploder02_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    BoxDimsStart = (5.0, 5.0, 5.0)
    BoxDimsMid = (25.0, 25.0, 25.0)
    BoxDimsEnd = (50.0, 50.0, 50.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.0, 0.0, 0.0)
    EndPosition = (0.0, 0.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 600.0
    lifetime = 0.01000
    startradius = 1.0
    MidRadius = 150.0
    endradius = 300.0
    StartRadiusSpread = 0.0
    MidRadiusSpread = 15.0
    EndRadiusSpread = 100.0
    texture = apm_ring_02
    BlendMode = Add
    alphacutoff = 1
    startRGB = [255 , 170 , 61]
    startAlpha = 0
    endRGB = [29 , 29 , 29]
    endAlpha = 0
    midRGB = [160 , 28 , 0]
    midAlpha = 253
    UseColorMidTime
    ColorMidTime = 27
}
apm_BOc1_xploder_Smoke1_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    BoxDimsStart = (5.0, 5.0, 5.0)
    BoxDimsMid = (100.0, 15.0, 100.0)
    BoxDimsEnd = (500.0, 250.0, 500.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.0, 0.0, 0.0)
    EndPosition = (0.0, 0.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 100.0
    lifetime = 0.2000
    EmitDelay = 0.1000
    startradius = 50.0
    MidRadius = 150.0
    endradius = 300.0
    StartRadiusSpread = 0.0
    MidRadiusSpread = 15.0
    EndRadiusSpread = 50.0
    texture = apm_spray_01
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [189 , 76 , 16]
    startAlpha = 0
    endRGB = [77 , 77 , 77]
    endAlpha = 0
    midRGB = [51 , 49 , 49]
    midAlpha = 242
    UseColorMidTime
    ColorMidTime = 45
}
apm_BOc1_xploder_Smoke1a_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    BoxDimsStart = (5.0, 5.0, 5.0)
    BoxDimsMid = (100.0, 15.0, 500.0)
    BoxDimsEnd = (500.0, 250.0, 500.0)
    Pos = (-500.0, 800.0, 2555.0)
    MidPosition = (-500.0, 800.0, 2555.0)
    EndPosition = (-500.0, 800.0, 2555.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 100.0
    lifetime = 0.2000
    startradius = 50.0
    MidRadius = 150.0
    endradius = 300.0
    StartRadiusSpread = 0.0
    MidRadiusSpread = 15.0
    EndRadiusSpread = 50.0
    texture = apm_spray_01
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [189 , 76 , 16]
    startAlpha = 0
    endRGB = [29 , 29 , 29]
    endAlpha = 0
    midRGB = [26 , 24 , 24]
    midAlpha = 242
    UseColorMidTime
    ColorMidTime = 26
    useglobalcolormodulation
}
apm_BOc1_xploder_Smoke2_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    BoxDimsStart = (153.4459991455078, 60.300899505615234, 114.01100158691406)
    BoxDimsMid = (347.2170104980469, 61.21009826660156, 358.885009765625)
    BoxDimsEnd = (850.0700073242188, 147.69400024414062, 611.3150024414062)
    Pos = (-547.8200073242188, 872.9530029296875, 3462.800048828125)
    MidPosition = (-535.6389770507812, 800.0, 3008.199951171875)
    EndPosition = (-511.0369873046875, 800.0, 2520.429931640625)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 100.0
    lifetime = 0.7000
    startradius = 50.0
    MidRadius = 150.0
    endradius = 300.0
    StartRadiusSpread = 0.0
    MidRadiusSpread = 15.0
    EndRadiusSpread = 50.0
    texture = apm_spray_01
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [44 , 18 , 4]
    startAlpha = 0
    endRGB = [29 , 29 , 29]
    endAlpha = 0
    midRGB = [11 , 11 , 11]
    midAlpha = 242
    UseColorMidTime
    ColorMidTime = 45
    useglobalcolormodulation
}
apm_BOc1_xploder_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    BoxDimsStart = (5.0, 5.0, 5.0)
    BoxDimsMid = (25.0, 15.0, 25.0)
    BoxDimsEnd = (50.0, 30.0, 50.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.0, 0.0, 0.0)
    EndPosition = (0.0, 0.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 100.0
    lifetime = 0.1000
    EmitDelay = 0.1000
    startradius = 1.0
    MidRadius = 25.0
    endradius = 100.0
    StartRadiusSpread = 0.0
    MidRadiusSpread = 15.0
    EndRadiusSpread = 15.0
    texture = apm_spray_01
    BlendMode = Add
    alphacutoff = 1
    startRGB = [255 , 121 , 0]
    startAlpha = 246
    endRGB = [29 , 29 , 29]
    endAlpha = 105
    midRGB = [160 , 28 , 0]
    midAlpha = 253
    UseColorMidTime
    ColorMidTime = 27
}
apm_BOc_cannonSPARKS1_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    LocalSpace
    BoxDimsStart = (0.5, 0.5, 0.5)
    BoxDimsMid = (1.0, 1.0, 1.0)
    BoxDimsEnd = (6.0, 3.0, 6.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.0, 10.0, 0.0)
    EndPosition = (0.0, 30.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 100.0
    lifetime = 0.3000
    startradius = 2.0
    MidRadius = 3.0
    endradius = 3.0
    StartRadiusSpread = 1.0
    MidRadiusSpread = 1.0
    EndRadiusSpread = 1.0
    texture = apm_spark_03
    BlendMode = Add
    alphacutoff = 1
    startRGB = [255 , 51 , 77]
    startAlpha = 255
    endRGB = [255 , 66 , 0]
    endAlpha = 0
    midRGB = [255 , 94 , 26]
    midAlpha = 255
    UseColorMidTime
    ColorMidTime = 33
}
apm_BOc_cannonSPARKS2_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    LocalSpace
    BoxDimsStart = (1.0, 2.0, 1.0)
    BoxDimsMid = (10.0, 5.0, 10.0)
    BoxDimsEnd = (20.0, 9.0, 20.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.0, 10.0, 0.0)
    EndPosition = (0.0, 5.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 100.0
    lifetime = 0.6000
    startradius = 5.0
    MidRadius = 4.0
    endradius = 3.0
    StartRadiusSpread = 3.0
    MidRadiusSpread = 3.0
    EndRadiusSpread = 1.0
    texture = apm_spark_01
    BlendMode = Add
    alphacutoff = 1
    startRGB = [255 , 104 , 51]
    startAlpha = 255
    endRGB = [255 , 95 , 51]
    endAlpha = 0
    midRGB = [255 , 104 , 51]
    midAlpha = 158
    UseColorMidTime
    ColorMidTime = 47
}
apm_BOc_cannonSPARKSring1_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    BoxDimsStart = (2.0, 1.0, 2.0)
    BoxDimsMid = (3.0, 1.0, 3.0)
    BoxDimsEnd = (3.0, 1.0, 3.0)
    Pos = (0.0, 1.0, 0.0)
    MidPosition = (0.0, 1.0, 0.0)
    EndPosition = (0.0, 1.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 100.0
    lifetime = 0.1000
    startradius = 5.0
    MidRadius = 5.0
    endradius = 1.0
    StartRadiusSpread = 1.0
    MidRadiusSpread = 1.0
    EndRadiusSpread = 1.0
    texture = apm_spark_01
    BlendMode = Add
    alphacutoff = 1
    startRGB = [255 , 130 , 51]
    startAlpha = 0
    endRGB = [255 , 66 , 0]
    endAlpha = 0
    midRGB = [255 , 94 , 26]
    midAlpha = 255
    UseColorMidTime
    ColorMidTime = 28
}
apm_BOc_cannonSPARKSring2_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    BoxDimsStart = (2.0, 2.0, 2.0)
    BoxDimsMid = (3.0, 1.0, 3.0)
    BoxDimsEnd = (3.0, 1.0, 3.0)
    Pos = (-881.010009765625, 64.0, 1213.0)
    MidPosition = (-881.0130004882812, 64.0, 1213.0)
    EndPosition = (-880.9669799804688, 64.0, 1213.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 100.0
    lifetime = 0.1000
    startradius = 3.0
    MidRadius = 3.0
    endradius = 1.0
    StartRadiusSpread = 3.0
    MidRadiusSpread = 3.0
    EndRadiusSpread = 1.0
    texture = apm_spark_01
    BlendMode = Add
    alphacutoff = 1
    startRGB = [255 , 130 , 51]
    startAlpha = 255
    endRGB = [255 , 66 , 0]
    endAlpha = 0
    midRGB = [255 , 95 , 26]
    midAlpha = 255
    UseColorMidTime
    ColorMidTime = 28
}
apm_BOc_cannonSparkSmoke01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    boneoffset = (0.0, 0.0, 5.0)
    LocalSpace
    BoxDimsStart = (4.0, 4.0, 4.0)
    BoxDimsMid = (20.0, 8.0, 20.0)
    BoxDimsEnd = (50.0, 8.0, 20.0)
    Pos = (0.0, 0.009999999776482582, 0.0)
    MidPosition = (0.0, 65.0, 0.0)
    EndPosition = (0.0, 100.0, 0.0)
    UseMidPoint
    suspenddistance = 0.0
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 300.0
    lifetime = 1.0
    startradius = 5.0
    MidRadius = 15.0
    endradius = 20.0
    StartRadiusSpread = 1.0
    MidRadiusSpread = 5.0
    EndRadiusSpread = 10.0
    texture = apm_spray_01
    BlendMode = Blend
    alphacutoff = 0
    startRGB = [180 , 125 , 54]
    startAlpha = 238
    endRGB = [51 , 50 , 47]
    endAlpha = 0
    midRGB = [128 , 128 , 128]
    midAlpha = 84
    UseColorMidTime
    ColorMidTime = 81
    useglobalcolormodulation
}
apm_BOc_cannonball_smoke_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    LocalSpace
    enablerotate
    BoxDimsStart = (10.0, 10.0, 10.0)
    BoxDimsMid = (20.0, 10.0, 20.0)
    BoxDimsEnd = (60.0, 10.0, 60.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.0, 0.0, -20.0)
    EndPosition = (0.0, 0.0, -200.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 100.0
    lifetime = 1.0
    startradius = 1.0
    MidRadius = 10.0
    endradius = 5.0
    texture = apm_spray_01
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [13 , 13 , 13]
    startAlpha = 4
    endRGB = [42 , 42 , 42]
    endAlpha = 4
    midRGB = [86 , 86 , 86]
    midAlpha = 150
    UseColorMidTime
    ColorMidTime = 50
}
apm_BOc_fallingDebris01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    BoxDimsStart = (700.0, 60.0, 500.0)
    BoxDimsMid = (500.0, 20.0, 500.0)
    BoxDimsEnd = (800.0, 100.0, 500.0)
    Pos = (-600.0, 675.9080200195312, 2721.219970703125)
    MidPosition = (-449.9079895019531, 643.9080200195312, 2721.219970703125)
    EndPosition = (-600.0, 0.0, 2721.219970703125)
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 20.0
    lifetime = 1.100
    startradius = 20.0
    endradius = 20.0
    StartRadiusSpread = 200.0
    EndRadiusSpread = 100.0
    texture = apm_debis_02
    BlendMode = Blend
    alphacutoff = 12
    startRGB = [18 , 18 , 18]
    startAlpha = 0
    endRGB = [55 , 55 , 55]
    endAlpha = 0
    midRGB = [61 , 61 , 61]
    midAlpha = 119
    UseColorMidTime
    ColorMidTime = 88
    useglobalcolormodulation
}
apm_BOc_fallingDebris02_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    BoxDimsStart = (700.0, 60.0, 500.0)
    BoxDimsMid = (500.0, 20.0, 500.0)
    BoxDimsEnd = (800.0, 100.0, 500.0)
    Pos = (-600.0, 675.9080200195312, 2721.219970703125)
    MidPosition = (-449.9079895019531, 643.9080200195312, 2721.219970703125)
    EndPosition = (-600.0, 0.0, 2721.219970703125)
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 30.0
    lifetime = 1.0
    startradius = 1.0
    endradius = 1.0
    StartRadiusSpread = 50.0
    EndRadiusSpread = 50.0
    texture = apm_spray_01
    BlendMode = Blend
    alphacutoff = 12
    startRGB = [18 , 18 , 18]
    startAlpha = 0
    endRGB = [55 , 55 , 55]
    endAlpha = 0
    midRGB = [61 , 61 , 61]
    midAlpha = 119
    UseColorMidTime
    ColorMidTime = 88
    useglobalcolormodulation
}
apm_BOc_grounddust01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    LocalSpace
    BoxDimsStart = (600.0, 10.0, 200.0)
    BoxDimsMid = (500.0, 10.0, 100.0)
    BoxDimsEnd = (400.0, 10.0, 100.0)
    Pos = (0.0, -20.0, 0.0)
    MidPosition = (0.0, 50.0, 0.0)
    EndPosition = (0.0, 300.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 100.0
    lifetime = 4.0
    startradius = 50.0
    MidRadius = 75.0
    endradius = 55.0
    StartRadiusSpread = 25.0
    MidRadiusSpread = 20.0
    EndRadiusSpread = 25.0
    texture = ba_apm_smokepuff01s
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [57 , 50 , 45]
    startAlpha = 0
    endRGB = [125 , 117 , 112]
    endAlpha = 0
    midRGB = [105 , 93 , 86]
    midAlpha = 53
    UseColorMidTime
    ColorMidTime = 69
    useglobalcolormodulation
}
apm_BOc_grounddust02_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    LocalSpace
    BoxDimsStart = (1.0, 10.0, 1.0)
    BoxDimsMid = (500.0, 10.0, 100.0)
    BoxDimsEnd = (400.0, 10.0, 100.0)
    Pos = (-200.0, -20.0, 0.0)
    MidPosition = (-100.0, 50.0, 0.0)
    EndPosition = (-200.0, 100.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 100.0
    lifetime = 1.0
    startradius = 50.0
    MidRadius = 75.0
    endradius = 55.0
    StartRadiusSpread = 25.0
    MidRadiusSpread = 20.0
    EndRadiusSpread = 25.0
    texture = apm_spray_01
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [57 , 50 , 45]
    startAlpha = 0
    endRGB = [125 , 117 , 112]
    endAlpha = 0
    midRGB = [105 , 93 , 86]
    midAlpha = 53
    UseColorMidTime
    ColorMidTime = 69
    useglobalcolormodulation
}
apm_BOc_xploder_Smoke3_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    ObjID = skater
    LocalSpace
    BoxDimsStart = (10.0, 10.0, 10.0)
    BoxDimsMid = (500.0, 100.0, 500.0)
    BoxDimsEnd = (1000.0, 250.0, 1000.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.0, 0.0, -50.0)
    EndPosition = (0.0, 50.0, -100.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 300.0
    lifetime = 1.0
    startradius = 1.0
    MidRadius = 100.0
    endradius = 100.0
    StartRadiusSpread = 20.0
    MidRadiusSpread = 50.0
    EndRadiusSpread = 100.0
    texture = ba_apm_smokepuff01s
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [127 , 52 , 35]
    startAlpha = 0
    endRGB = [37 , 37 , 37]
    endAlpha = 0
    midRGB = [37 , 37 , 37]
    midAlpha = 128
    UseColorMidTime
    ColorMidTime = 61
    useglobalcolormodulation
}
apm_BOc_xploder_Smoke4_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    LocalSpace
    BoxDimsStart = (10.0, 10.0, 10.0)
    BoxDimsMid = (10.0, 10.0, 10.0)
    BoxDimsEnd = (10.0, 10.0, 10.0)
    Pos = (-300.0, 0.0, 0.0)
    MidPosition = (-300.0, 0.0, 0.0)
    EndPosition = (-300.0, 0.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 300.0
    lifetime = 0.3000
    startradius = 20.0
    MidRadius = 100.0
    endradius = 300.0
    StartRadiusSpread = 20.0
    MidRadiusSpread = 50.0
    EndRadiusSpread = 99.80
    texture = apm_ring_02
    BlendMode = Add
    alphacutoff = 1
    startRGB = [255 , 104 , 70]
    startAlpha = 0
    endRGB = [37 , 37 , 37]
    endAlpha = 0
    midRGB = [132 , 56 , 24]
    midAlpha = 128
    UseColorMidTime
    ColorMidTime = 68
    useglobalcolormodulation
}
apm_BOc_xploder_debis01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    BoxDimsStart = (159.5800018310547, 78.88999938964844, 139.4600067138672)
    BoxDimsMid = (2000.0, 145.0500030517578, 2000.0)
    BoxDimsEnd = (5000.0, 150.0, 5000.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.0, 0.0, 0.0)
    EndPosition = (0.0, 0.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 300.0
    lifetime = 0.5000
    emitduration = 0.3000
    startradius = 10.0
    MidRadius = 50.0
    endradius = 50.0
    priority = 0
    texture = apm_debis_01
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [81 , 81 , 81]
    startAlpha = 128
    endRGB = [24 , 0 , 0]
    endAlpha = 0
    midRGB = [101 , 101 , 101]
    midAlpha = 132
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
cod_dust_jump_slow_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    BoxDimsStart = (50.0, 20.0, 20.0)
    BoxDimsMid = (45.0, 20.0, 25.0)
    BoxDimsEnd = (40.0, 10.0, 10.0)
    Pos = (299.80499267578125, 63.36470031738281, 3082.699951171875)
    MidPosition = (299.80499267578125, 148.13400268554688, 3153.239990234375)
    EndPosition = (299.80499267578125, 173.2519989013672, 3210.5)
    UseMidPoint
    MidPointPCT = 54
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 600.0
    lifetime = 1.0
    EmitDelay = 0.1000
    emitduration = 0.2000
    startradius = 40.0
    MidRadius = 35.0
    endradius = 30.0
    StartRadiusSpread = 50.0
    MidRadiusSpread = 50.0
    EndRadiusSpread = 50.0
    priority = 0
    texture = apm_spray_01
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [101 , 84 , 65]
    startAlpha = 6
    endRGB = [112 , 103 , 81]
    endAlpha = 0
    useglobalcolormodulation
}
cod_dust_jump_slowest_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    BoxDimsStart = (50.0, 20.0, 20.0)
    BoxDimsMid = (45.0, 20.0, 25.0)
    BoxDimsEnd = (40.0, 10.0, 10.0)
    Pos = (299.80499267578125, 63.36470031738281, 3082.699951171875)
    MidPosition = (299.80499267578125, 148.13400268554688, 3153.239990234375)
    EndPosition = (299.80499267578125, 173.2519989013672, 3210.5)
    UseMidPoint
    MidPointPCT = 54
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 400.0
    lifetime = 1.300
    EmitDelay = 0.1000
    emitduration = 0.2000
    startradius = 60.0
    MidRadius = 55.0
    endradius = 50.0
    StartRadiusSpread = 50.0
    MidRadiusSpread = 50.0
    EndRadiusSpread = 50.0
    priority = 0
    texture = apm_spray_01
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [101 , 84 , 65]
    startAlpha = 5
    endRGB = [169 , 150 , 115]
    endAlpha = 0
    useglobalcolormodulation
}
cod_splash_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    BoxDimsStart = (20.0, 20.0, 20.0)
    BoxDimsMid = (150.0, 50.0, 150.0)
    BoxDimsEnd = (250.0, 100.0, 250.0)
    Pos = (296.0, -282.6300048828125, 3504.0)
    MidPosition = (296.0, -49.060001373291016, 3504.0)
    EndPosition = (296.0, -200.5, 3504.0)
    UseMidPoint
    MidPointPCT = 50.0
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 200.0
    lifetime = 1.500
    EmitDelay = 1.0
    emitduration = 0.2000
    startradius = 20.0
    MidRadius = 40.0
    endradius = 75.0
    StartRadiusSpread = 10.0
    MidRadiusSpread = 15.0
    EndRadiusSpread = 25.0
    priority = 0
    texture = cod_splash
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [172 , 179 , 187]
    startAlpha = 64
    endRGB = [201 , 201 , 201]
    endAlpha = 64
    useglobalcolormodulation
}
