

script load_permanent_fast_particle_textures 
    LoadParticleTexture 'particles\apm_spray_01' perm
    LoadParticleTexture 'particles\apm_ring_02' perm
    LoadParticleTexture 'particles\apm_debis_quad01' perm
    LoadParticleTexture 'particles\dt_nj_waterdrop05' perm
    LoadParticleTexture 'particles\apm_debis_01' perm
    LoadParticleTexture 'particles\apm_flame_01' perm
endscript

JOW_VehExhaust01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    enablerotate
    BoxDimsStart = (3.0, 3.0, 3.0)
    BoxDimsMid = (20.0, 20.0, 20.0)
    BoxDimsEnd = (6.0, 6.0, 6.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.07999999821186066, 0.10000000149011612, -25.639999389648438)
    EndPosition = (0.029999999329447746, 0.10000000149011612, -9.649999618530273)
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 10.0
    lifetime = 0.3000
    startradius = 3.0
    endradius = 8.0
    priority = 0
    texture = apm_spray_01
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [37 , 37 , 37]
    startAlpha = 112
    endRGB = [46 , 46 , 46]
    endAlpha = 36
    useglobalcolormodulation
}
apm_ACID_DROP01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    enablerotate
    BoxDimsStart = (10.0, 0.0, 10.0)
    BoxDimsMid = (10.0, 10.0, 10.0)
    BoxDimsEnd = (10.0, 10.0, 10.0)
    Pos = (0.0, 30.0, 0.0)
    MidPosition = (0.0, 30.0, -1.0)
    EndPosition = (0.0, 30.0, -100.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 12.0
    lifetime = 0.1000
    emitduration = 0.5000
    startradius = 20.0
    MidRadius = 150.0
    endradius = 0.0
    priority = 0
    texture = apm_ring_02
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [128 , 128 , 128]
    startAlpha = 128
    endRGB = [189 , 189 , 189]
    endAlpha = 128
    midRGB = [194 , 194 , 194]
    midAlpha = 91
    UseColorMidTime
    ColorMidTime = 42
    updatescript = fast_change_color
    params = {
        endStartRGBA = [128 , 128 , 128 , 0]
        endMidRGBA = [128 , 128 , 128 , 0]
        endEndRGBA = [128 , 128 , 128 , 0]
        delayStart = 0
        changetime = 0.5000
        stepTime = 0.1000
    }
}
apm_ACID_DROP02_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    enablerotate
    BoxDimsStart = (10.0, 0.0, 10.0)
    BoxDimsMid = (10.0, 10.0, 10.0)
    BoxDimsEnd = (10.0, 10.0, 10.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.0, 0.0, -1.0)
    EndPosition = (0.0, 30.0, -100.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 12.0
    lifetime = 0.5000
    emitduration = 3.0
    startradius = 20.0
    MidRadius = 50.0
    endradius = 30.0
    priority = 0
    texture = apm_spray_01
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [51 , 46 , 41]
    startAlpha = 128
    endRGB = [102 , 90 , 82]
    endAlpha = 128
    midRGB = [77 , 68 , 62]
    midAlpha = 128
    UseColorMidTime
    ColorMidTime = 42
    useglobalcolormodulation
    update_brightness_from = skater
    updatescript = fast_change_color
    params = {
        endStartRGBA = [80 , 75 , 70 , 0]
        endMidRGBA = [80 , 75 , 70 , 0]
        endEndRGBA = [80 , 75 , 70 , 0]
        delayStart = 0
        changetime = 2
        stepTime = 0.1000
    }
}
apm_ACID_DROP03_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    enablerotate
    BoxDimsStart = (10.0, 20.0, 10.0)
    BoxDimsMid = (60.0, 10.0, 60.0)
    BoxDimsEnd = (75.0, 10.0, 75.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.0, 30.0, -1.0)
    EndPosition = (0.0, 0.0, -100.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 15.0
    lifetime = 0.3000
    emitduration = 1.0
    startradius = 20.0
    MidRadius = 20.0
    endradius = 20.0
    StartRadiusSpread = 10.0
    MidRadiusSpread = 10.0
    EndRadiusSpread = 10.0
    priority = 0
    texture = apm_debis_quad01
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [77 , 77 , 77]
    startAlpha = 128
    endRGB = [128 , 128 , 128]
    endAlpha = 128
    midRGB = [102 , 102 , 102]
    midAlpha = 128
    UseColorMidTime
    ColorMidTime = 42
    useglobalcolormodulation
    update_brightness_from = skater
    updatescript = fast_change_color
    params = {
        endStartRGBA = [128 , 128 , 128 , 0]
        endMidRGBA = [128 , 128 , 128 , 0]
        endEndRGBA = [128 , 128 , 128 , 0]
        delayStart = 0
        changetime = 1
        stepTime = 0.1000
    }
}
apm_DirtFootstep01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    angles = (0.0, 0.0, 3.0)
    LocalSpace
    BoxDimsStart = (10.0, 10.0, 10.0)
    BoxDimsMid = (10.0, 10.0, 10.0)
    BoxDimsEnd = (15.0, 15.0, 15.0)
    Pos = (0.0, 1.0, 0.0)
    MidPosition = (0.0, 5.0, 0.0)
    EndPosition = (0.0, 20.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 15.0
    lifetime = 0.3000
    emitduration = 0.1000
    startradius = 10.0
    MidRadius = 20.0
    endradius = 30.0
    StartRadiusSpread = 0.0
    MidRadiusSpread = 2.0
    EndRadiusSpread = 3.0
    priority = 0
    texture = apm_spray_01
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [77 , 64 , 50]
    startAlpha = 41
    endRGB = [102 , 94 , 71]
    endAlpha = 0
    midRGB = [102 , 88 , 71]
    midAlpha = 89
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
    update_brightness_from = skater
}
apm_SandFootstep01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    angles = (0.0, 0.0, 3.0)
    LocalSpace
    BoxDimsStart = (10.0, 10.0, 10.0)
    BoxDimsMid = (10.0, 10.0, 10.0)
    BoxDimsEnd = (15.0, 15.0, 15.0)
    Pos = (0.0, 1.0, 0.0)
    MidPosition = (0.0, 5.0, 0.0)
    EndPosition = (0.0, 20.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 15.0
    lifetime = 0.3000
    emitduration = 0.1000
    startradius = 10.0
    MidRadius = 20.0
    endradius = 30.0
    StartRadiusSpread = 0.0
    MidRadiusSpread = 2.0
    EndRadiusSpread = 3.0
    priority = 0
    texture = apm_spray_01
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [128 , 118 , 90]
    startAlpha = 41
    endRGB = [178 , 165 , 124]
    endAlpha = 0
    midRGB = [153 , 142 , 107]
    midAlpha = 128
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
    update_brightness_from = skater
}
apm_SandFootstep02_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    enablerotate
    BoxDimsStart = (10.0, 10.0, 10.0)
    BoxDimsMid = (15.0, 10.0, 15.0)
    BoxDimsEnd = (30.0, 15.0, 30.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.0, 20.0, -10.0)
    EndPosition = (0.0, 0.0, -20.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 60.0
    lifetime = 0.2000
    emitduration = 0.1000
    startradius = 10.0
    MidRadius = 7.500
    endradius = 5.0
    StartRadiusSpread = 0.0
    MidRadiusSpread = 2.0
    EndRadiusSpread = 3.0
    priority = 0
    texture = apm_debis_quad01
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [102 , 95 , 72]
    startAlpha = 128
    endRGB = [128 , 119 , 89]
    endAlpha = 71
    midRGB = [115 , 105 , 80]
    midAlpha = 128
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
    update_brightness_from = skater
}
apm_Skater_gravel01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDimsStart = (10.0, 10.0, 10.0)
    BoxDimsMid = (30.0, 10.0, 30.0)
    BoxDimsEnd = (50.0, 10.0, 50.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.0, 10.0, 0.0)
    EndPosition = (0.0, -10.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 30.0
    lifetime = 0.4000
    emitduration = 0.1000
    startradius = 10.0
    MidRadius = 20.0
    endradius = 10.0
    StartRadiusSpread = 5.0
    MidRadiusSpread = 10.0
    EndRadiusSpread = 5.0
    priority = 0
    texture = apm_debis_quad01
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [102 , 98 , 93]
    startAlpha = 87
    endRGB = [102 , 98 , 95]
    endAlpha = 84
    midRGB = [128 , 123 , 118]
    midAlpha = 113
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
    update_brightness_from = skater
}
apm_Skater_splash01f_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    LocalSpace
    BoxDimsStart = (10.0, 10.0, 10.0)
    BoxDimsMid = (50.0, 15.0, 50.0)
    BoxDimsEnd = (100.0, 40.0, 100.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.0, 100.0, 0.0)
    EndPosition = (0.0, 0.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 500.0
    lifetime = 0.6000
    emitduration = 0.2000
    startradius = 10.0
    MidRadius = 5.0
    endradius = 2.0
    StartRadiusSpread = 5.0
    MidRadiusSpread = 5.0
    EndRadiusSpread = 5.0
    texture = dt_nj_waterdrop05
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [143 , 143 , 143]
    startAlpha = 196
    endRGB = [134 , 134 , 134]
    endAlpha = 29
    midRGB = [105 , 105 , 105]
    midAlpha = 125
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
apm_Skater_splash02f_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    LocalSpace
    BoxDimsStart = (10.0, 10.0, 10.0)
    BoxDimsMid = (50.0, 15.0, 50.0)
    BoxDimsEnd = (100.0, 40.0, 100.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.0, 100.0, 0.0)
    EndPosition = (0.0, 0.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 250.0
    lifetime = 0.6000
    emitduration = 0.2500
    startradius = 5.0
    MidRadius = 5.0
    endradius = 2.0
    StartRadiusSpread = 5.0
    MidRadiusSpread = 5.0
    EndRadiusSpread = 5.0
    texture = apm_debis_01
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [143 , 143 , 143]
    startAlpha = 196
    endRGB = [134 , 134 , 134]
    endAlpha = 29
    midRGB = [105 , 105 , 105]
    midAlpha = 125
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
apm_Skater_splash03_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDimsStart = (10.0, 10.0, 10.0)
    BoxDimsMid = (30.0, 10.0, 30.0)
    BoxDimsEnd = (50.0, 10.0, 50.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.0, 20.0, 0.0)
    EndPosition = (0.0, -10.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 100.0
    lifetime = 0.3000
    emitduration = 0.1000
    startradius = 5.0
    MidRadius = 5.0
    endradius = 5.0
    StartRadiusSpread = 5.0
    MidRadiusSpread = 3.0
    EndRadiusSpread = 3.0
    priority = 0
    texture = dt_nj_waterdrop05
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [187 , 187 , 187]
    startAlpha = 128
    endRGB = [110 , 110 , 110]
    endAlpha = 0
    midRGB = [156 , 156 , 156]
    midAlpha = 63
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
apm_sandpuff01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    ObjID = skater
    bone = Bone_Board_Root
    LocalSpace
    enablerotate
    BoxDimsStart = (10.0, 0.0, 10.0)
    BoxDimsMid = (60.0, 5.0, 60.0)
    BoxDimsEnd = (50.0, 5.0, 50.0)
    Pos = (0.0, 10.0, 0.0)
    MidPosition = (0.0, 20.0, 0.0)
    EndPosition = (0.0, 10.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 200.0
    lifetime = 0.2500
    emitduration = 0.2500
    startradius = 5.0
    MidRadius = 20.0
    endradius = 20.0
    StartRadiusSpread = 2.0
    MidRadiusSpread = 10.0
    EndRadiusSpread = 10.0
    priority = 0
    texture = apm_spray_01
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [77 , 71 , 54]
    startAlpha = 0
    endRGB = [102 , 95 , 76]
    endAlpha = 0
    midRGB = [102 , 94 , 72]
    midAlpha = 128
    UseColorMidTime
    ColorMidTime = 61
    useglobalcolormodulation
    update_brightness_from = skater
}
