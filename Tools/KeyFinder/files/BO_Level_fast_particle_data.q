

script load_level_fast_particle_textures 
    LoadParticleTexture 'particles\apm_debis_01'
    LoadParticleTexture 'particles\apm_debis_02'
    LoadParticleTexture 'particles\apm_spark_01'
    LoadParticleTexture 'particles\apm_spray_01'
    LoadParticleTexture 'particles\tb_bo_tea_leaves_01'
    LoadParticleTexture 'particles\ba_apm_smokepuff01s'
endscript

apm_BO_applesplatta01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    LocalSpace
    BoxDimsStart = (1.0, 1.0, 1.0)
    BoxDimsMid = (50.0, 25.0, 50.0)
    BoxDimsEnd = (200.0, 25.0, 200.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.0, 0.0, 0.0)
    EndPosition = (0.0, -20.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 100.0
    lifetime = 0.3000
    startradius = 10.0
    MidRadius = 10.0
    endradius = 10.0
    StartRadiusSpread = 5.0
    MidRadiusSpread = 5.0
    EndRadiusSpread = 5.0
    texture = apm_debis_01
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [153 , 136 , 128]
    startAlpha = 255
    endRGB = [128 , 115 , 110]
    endAlpha = 0
    midRGB = [128 , 121 , 119]
    midAlpha = 128
    UseColorMidTime
    ColorMidTime = 42
    useglobalcolormodulation
}
apm_BO_applesplatta02_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    LocalSpace
    BoxDimsStart = (1.0, 1.0, 1.0)
    BoxDimsMid = (50.0, 25.0, 50.0)
    BoxDimsEnd = (100.0, 25.0, 100.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.0, 0.0, 0.0)
    EndPosition = (0.0, -10.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 50.0
    lifetime = 0.2000
    startradius = 10.0
    MidRadius = 10.0
    endradius = 10.0
    StartRadiusSpread = 5.0
    MidRadiusSpread = 5.0
    EndRadiusSpread = 5.0
    texture = apm_debis_02
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [102 , 31 , 31]
    startAlpha = 255
    endRGB = [153 , 46 , 46]
    endAlpha = 0
    midRGB = [102 , 31 , 31]
    midAlpha = 180
    UseColorMidTime
    ColorMidTime = 42
    useglobalcolormodulation
}
apm_BO_cannonSPARKS02_fast_particle_params = {
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
apm_BO_cannonSparkSmoke01_fast_particle_params = {
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
apm_Bo_tea01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    BoxDimsStart = (20.0, 30.0, 20.0)
    BoxDimsMid = (75.0, 20.0, 75.0)
    BoxDimsEnd = (100.0, 60.0, 100.0)
    Pos = (0.0, 20.0, 0.0)
    MidPosition = (0.0, 60.0, 0.0)
    EndPosition = (0.0, -20.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 500.0
    lifetime = 0.7500
    startradius = 5.0
    MidRadius = 5.0
    endradius = 5.0
    StartRadiusSpread = 5.0
    MidRadiusSpread = 10.0
    EndRadiusSpread = 20.0
    texture = tb_bo_tea_leaves_01
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [73 , 77 , 63]
    startAlpha = 128
    endRGB = [103 , 108 , 89]
    endAlpha = 0
    midRGB = [126 , 132 , 108]
    midAlpha = 70
    UseColorMidTime
    ColorMidTime = 46
    useglobalcolormodulation
}
apm_Bo_tea02_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    ObjID = skater
    LocalSpace
    BoxDimsStart = (20.0, 30.0, 20.0)
    BoxDimsMid = (75.0, 20.0, 75.0)
    BoxDimsEnd = (100.0, 60.0, 100.0)
    Pos = (0.0, 20.0, 0.0)
    MidPosition = (0.0, 20.0, 0.0)
    EndPosition = (0.0, 20.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0
    lod_dist2 = 0
    emitrate = 100.0
    lifetime = 0.7500
    startradius = 10.0
    MidRadius = 20.0
    endradius = 5.0
    StartRadiusSpread = 5.0
    MidRadiusSpread = 10.0
    EndRadiusSpread = 20.0
    texture = ba_apm_smokepuff01s
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [73 , 77 , 63]
    startAlpha = 39
    endRGB = [103 , 108 , 89]
    endAlpha = 0
    midRGB = [126 , 132 , 108]
    midAlpha = 42
    UseColorMidTime
    ColorMidTime = 46
    useglobalcolormodulation
}
