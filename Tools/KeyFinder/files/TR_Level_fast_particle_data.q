

script load_level_fast_particle_textures 
    LoadParticleTexture 'particles\apm_spray_01'
    LoadParticleTexture 'particles\apm_debis_01'
    LoadParticleTexture 'particles\apm_debis_02'
endscript

TB_TR_DoorDust01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    LocalSpace
    BoxDimsStart = (10.0, 10.0, 10.0)
    BoxDimsMid = (200.0, 100.0, 200.0)
    BoxDimsEnd = (300.0, 100.0, 300.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.0, 0.0, 0.0)
    EndPosition = (0.0, 60.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 50.0
    lifetime = 5.0
    emitduration = 3.0
    startradius = 20.0
    MidRadius = 60.0
    endradius = 80.0
    StartRadiusSpread = 10.0
    MidRadiusSpread = 20.0
    EndRadiusSpread = 10.0
    priority = 0
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
apm_TR_Tomatosplatta01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
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
    emitduration = 0.1500
    startradius = 10.0
    MidRadius = 10.0
    endradius = 10.0
    StartRadiusSpread = 5.0
    MidRadiusSpread = 5.0
    EndRadiusSpread = 5.0
    priority = 0
    texture = apm_debis_01
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [116 , 64 , 56]
    startAlpha = 254
    endRGB = [94 , 54 , 46]
    endAlpha = 0
    midRGB = [114 , 66 , 56]
    midAlpha = 191
    UseColorMidTime
    ColorMidTime = 42
    useglobalcolormodulation
}
apm_TR_Tomatosplatta02_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
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
    emitduration = 0.1000
    startradius = 10.0
    MidRadius = 10.0
    endradius = 10.0
    StartRadiusSpread = 5.0
    MidRadiusSpread = 5.0
    EndRadiusSpread = 5.0
    priority = 0
    texture = apm_debis_02
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [152 , 45 , 54]
    startAlpha = 254
    endRGB = [152 , 60 , 68]
    endAlpha = 0
    midRGB = [152 , 42 , 51]
    midAlpha = 0
    UseColorMidTime
    ColorMidTime = 42
    useglobalcolormodulation
}
