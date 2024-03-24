

script load_level_fast_particle_textures 
    LoadParticleTexture 'particles\apm_flame_01'
    LoadParticleTexture 'particles\dt_nj_waterdrop05'
    LoadParticleTexture 'particles\apm_debis_01'
    LoadParticleTexture 'particles\apm_debis_02'
    LoadParticleTexture 'particles\apm_leaf01'
    LoadParticleTexture 'particles\apm_leaf02'
    LoadParticleTexture 'particles\apm_leaf03'
    LoadParticleTexture 'particles\apm_leaf04'
    LoadParticleTexture 'particles\apm_spray_01'
    LoadParticleTexture 'particles\apm_water_splash01'
    LoadParticleTexture 'particles\ba_apm_smokepuff01s'
    LoadParticleTexture 'particles\apm_spark_01'
endscript

apm_BA_CARfire01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    BoxDimsStart = (40.0, 30.0, 50.0)
    BoxDimsMid = (40.0, 25.0, 40.0)
    BoxDimsEnd = (30.0, 80.0, 30.0)
    Pos = (3300.0, 20.0, 2724.0)
    MidPosition = (3310.0, 60.0, 2724.0)
    EndPosition = (3320.0, 90.0, 2724.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 500.0
    lod_dist2 = 1000.0
    emitrate = 150.0
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
apm_BA_CARfire02_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    BoxDimsStart = (40.0, 30.0, 50.0)
    BoxDimsMid = (70.0, 25.0, 70.0)
    BoxDimsEnd = (100.0, 80.0, 100.0)
    Pos = (3300.0, 20.0, 2724.0)
    MidPosition = (3310.0, 100.0, 2724.0)
    EndPosition = (3320.0, 200.0, 2724.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 500.0
    lod_dist2 = 1000.0
    emitrate = 50.0
    lifetime = 2.0
    startradius = 10.0
    MidRadius = 10.0
    endradius = 10.0
    StartRadiusSpread = 10.0
    MidRadiusSpread = 5.0
    EndRadiusSpread = 5.0
    priority = 2
    texture = apm_spark_01
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
apm_BA_DragonBlast02_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    bone = Bone_Board_Root
    LocalSpace
    BoxDimsStart = (10.0, 5.0, 10.0)
    BoxDimsMid = (20.0, 10.0, 20.0)
    BoxDimsEnd = (40.0, 20.0, 40.0)
    Pos = (0.0, 10.0, 0.0)
    MidPosition = (0.0, 5.0, -10.0)
    EndPosition = (0.0, 0.0, -100.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0
    lod_dist2 = 0
    emitrate = 300.0
    lifetime = 0.2500
    emitduration = 1.0
    startradius = 15.0
    MidRadius = 10.0
    endradius = 5.0
    StartRadiusSpread = 4.0
    MidRadiusSpread = 5.0
    EndRadiusSpread = 5.0
    priority = 0
    texture = dt_nj_waterdrop05
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [227 , 225 , 222]
    startAlpha = 60
    endRGB = [209 , 207 , 204]
    endAlpha = 0
    midRGB = [204 , 222 , 229]
    midAlpha = 128
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
apm_BA_Tomatosplatta01_fast_particle_params = {
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
    startAlpha = 255
    endRGB = [94 , 54 , 46]
    endAlpha = 0
    midRGB = [114 , 66 , 56]
    midAlpha = 191
    UseColorMidTime
    ColorMidTime = 42
    useglobalcolormodulation
}
apm_BA_Tomatosplatta02_fast_particle_params = {
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
    startAlpha = 255
    endRGB = [152 , 60 , 68]
    endAlpha = 0
    midRGB = [152 , 42 , 51]
    midAlpha = 0
    UseColorMidTime
    ColorMidTime = 42
    useglobalcolormodulation
}
apm_BA_leaf01_fast_particle_params = {
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
    startRGB = [55 , 64 , 44]
    startAlpha = 102
    endRGB = [82 , 102 , 71]
    endAlpha = 0
    midRGB = [60 , 77 , 52]
    midAlpha = 128
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
apm_BA_leaf02_fast_particle_params = {
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
    texture = apm_leaf02
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [55 , 64 , 44]
    startAlpha = 102
    endRGB = [82 , 102 , 71]
    endAlpha = 0
    midRGB = [60 , 77 , 52]
    midAlpha = 128
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
apm_BA_leaf03_fast_particle_params = {
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
    texture = apm_leaf03
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [55 , 64 , 44]
    startAlpha = 102
    endRGB = [82 , 102 , 71]
    endAlpha = 0
    midRGB = [60 , 77 , 52]
    midAlpha = 128
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
apm_BA_leaf04_fast_particle_params = {
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
    texture = apm_leaf04
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [55 , 64 , 44]
    startAlpha = 102
    endRGB = [82 , 102 , 71]
    endAlpha = 0
    midRGB = [60 , 77 , 52]
    midAlpha = 128
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
apm_BA_leafBUSH01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    bone = Bone_Stomach_Upper
    LocalSpace
    BoxDimsStart = (10.0, 60.0, 10.0)
    BoxDimsMid = (100.0, 60.0, 100.0)
    BoxDimsEnd = (150.0, 60.0, 150.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.0, 30.0, 0.0)
    EndPosition = (0.0, -50.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 200.0
    lifetime = 0.7500
    emitduration = 0.05000
    startradius = 3.0
    MidRadius = 5.0
    endradius = 3.0
    StartRadiusSpread = 3.0
    MidRadiusSpread = 3.0
    EndRadiusSpread = 3.0
    priority = 0
    texture = apm_leaf01
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [66 , 77 , 53]
    startAlpha = 102
    endRGB = [82 , 102 , 71]
    endAlpha = 0
    midRGB = [79 , 102 , 69]
    midAlpha = 128
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
apm_BA_leafBUSH02_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    bone = Bone_Stomach_Upper
    LocalSpace
    BoxDimsStart = (10.0, 60.0, 10.0)
    BoxDimsMid = (100.0, 60.0, 100.0)
    BoxDimsEnd = (150.0, 60.0, 150.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.0, 30.0, 0.0)
    EndPosition = (0.0, -50.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 200.0
    lifetime = 0.7500
    emitduration = 0.05000
    startradius = 3.0
    MidRadius = 5.0
    endradius = 3.0
    StartRadiusSpread = 2.0
    MidRadiusSpread = 2.0
    EndRadiusSpread = 2.0
    priority = 0
    texture = apm_leaf02
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [87 , 102 , 70]
    startAlpha = 102
    endRGB = [47 , 59 , 41]
    endAlpha = 0
    midRGB = [99 , 128 , 86]
    midAlpha = 128
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
apm_BA_leafBUSH03_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    bone = Bone_Stomach_Upper
    LocalSpace
    BoxDimsStart = (10.0, 60.0, 10.0)
    BoxDimsMid = (100.0, 60.0, 100.0)
    BoxDimsEnd = (150.0, 60.0, 150.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.0, 30.0, 0.0)
    EndPosition = (0.0, -50.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0
    lod_dist2 = 0
    emitrate = 200.0
    lifetime = 0.7500
    emitduration = 0.05000
    startradius = 3.0
    MidRadius = 3.0
    endradius = 3.0
    StartRadiusSpread = 3.0
    MidRadiusSpread = 3.0
    EndRadiusSpread = 3.0
    priority = 0
    texture = apm_leaf03
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [66 , 77 , 53]
    startAlpha = 102
    endRGB = [102 , 128 , 89]
    endAlpha = 0
    midRGB = [79 , 102 , 69]
    midAlpha = 128
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
apm_BA_phoenix01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    LocalSpace
    enablerotate
    BoxDimsStart = (1.0, 1.0, 1.0)
    BoxDimsMid = (5.0, 7.0, 5.0)
    BoxDimsEnd = (50.0, 10.0, 20.0)
    Pos = (0.0, 15.0, 15.0)
    MidPosition = (0.0, 5.0, -25.0)
    EndPosition = (0.0, 15.0, -60.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 100.0
    lifetime = 0.5000
    startradius = 10.0
    MidRadius = 5.0
    endradius = 5.0
    StartRadiusSpread = 0.0
    MidRadiusSpread = 2.0
    EndRadiusSpread = 3.0
    priority = 0
    texture = apm_spray_01
    BlendMode = Add
    alphacutoff = 1
    startRGB = [255 , 162 , 62]
    startAlpha = 64
    endRGB = [255 , 122 , 64]
    endAlpha = 64
    midRGB = [255 , 137 , 62]
    midAlpha = 64
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
apm_BA_phoenix02_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    bone = Pigeon_WingTip_Left01
    angles = (0.0, 0.0, 3.0)
    boneoffset = (0.0, 0.0, -5.0)
    LocalSpace
    enablerotate
    BoxDimsStart = (15.0, 5.0, 10.0)
    BoxDimsMid = (15.0, 5.0, 10.0)
    BoxDimsEnd = (15.0, 5.0, 10.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.0, 0.0, 7.0)
    EndPosition = (0.0, 0.0, 15.0)
    UseMidPoint
    MidPointPCT = 50
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 100.0
    lifetime = 0.5000
    startradius = 10.0
    MidRadius = 5.0
    endradius = 5.0
    StartRadiusSpread = 0.0
    MidRadiusSpread = 2.0
    EndRadiusSpread = 3.0
    priority = 0
    texture = apm_spray_01
    BlendMode = Add
    alphacutoff = 1
    startRGB = [255 , 162 , 62]
    startAlpha = 64
    endRGB = [255 , 122 , 64]
    endAlpha = 64
    useglobalcolormodulation
}
apm_BA_phoenix03_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    bone = Pigeon_WingTip_Right01
    angles = (0.0, 0.0, 3.0)
    boneoffset = (0.0, 0.0, -5.0)
    LocalSpace
    enablerotate
    BoxDimsStart = (15.0, 5.0, 10.0)
    BoxDimsMid = (15.0, 5.0, 10.0)
    BoxDimsEnd = (15.0, 5.0, 10.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.0, 0.0, 7.0)
    EndPosition = (0.0, 0.0, 15.0)
    UseMidPoint
    MidPointPCT = 50
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 100.0
    lifetime = 0.5000
    startradius = 10.0
    MidRadius = 5.0
    endradius = 5.0
    StartRadiusSpread = 0.0
    MidRadiusSpread = 2.0
    EndRadiusSpread = 3.0
    priority = 0
    texture = apm_spray_01
    BlendMode = Add
    alphacutoff = 1
    startRGB = [255 , 162 , 62]
    startAlpha = 64
    endRGB = [255 , 122 , 64]
    endAlpha = 64
    useglobalcolormodulation
}
apm_DragonSpray01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    BoxDimsStart = (10.0, 10.0, 10.0)
    BoxDimsMid = (30.0, 30.0, 30.0)
    BoxDimsEnd = (30.0, 20.0, 30.0)
    Pos = (1995.6099853515625, 216.53199768066406, -2130.0)
    MidPosition = (1995.260009765625, 294.0870056152344, -1918.9300537109375)
    EndPosition = (1995.6099853515625, 25.443300247192383, -1736.449951171875)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 500.0
    lifetime = 1.0
    startradius = 10.0
    MidRadius = 30.0
    endradius = 30.0
    StartRadiusSpread = 1.0
    MidRadiusSpread = 2.0
    EndRadiusSpread = 5.0
    priority = 0
    texture = dt_nj_waterdrop05
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [227 , 225 , 222]
    startAlpha = 128
    endRGB = [209 , 207 , 204]
    endAlpha = 65
    midRGB = [170 , 185 , 191]
    midAlpha = 64
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
apm_DragonSpray02_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    BoxDimsStart = (100.0, 10.0, 100.0)
    BoxDimsMid = (150.0, 10.0, 125.0)
    BoxDimsEnd = (200.0, 20.0, 150.0)
    Pos = (1995.5, 20.0, -1750.0)
    MidPosition = (1995.5, 75.0, -1750.0)
    EndPosition = (1995.5, 31.0, -1750.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 500.0
    lod_dist2 = 1000.0
    emitrate = 500.0
    lifetime = 0.5000
    startradius = 30.0
    MidRadius = 15.0
    endradius = 10.0
    StartRadiusSpread = 4.0
    MidRadiusSpread = 5.0
    EndRadiusSpread = 5.0
    priority = 0
    texture = dt_nj_waterdrop05
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [227 , 225 , 222]
    startAlpha = 64
    endRGB = [209 , 207 , 204]
    endAlpha = 32
    midRGB = [170 , 185 , 191]
    midAlpha = 128
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
apm_DragonSpray03_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    BoxDimsStart = (150.0, 10.0, 100.0)
    BoxDimsMid = (150.0, 10.0, 100.0)
    BoxDimsEnd = (150.0, 20.0, 100.0)
    Pos = (1995.5, 30.0, -1750.0)
    MidPosition = (1995.5, 50.0, -1750.0)
    EndPosition = (1995.5, 60.0, -1750.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 500.0
    lod_dist2 = 1000.0
    emitrate = 50.0
    lifetime = 0.5000
    startradius = 74.0
    MidRadius = 50.0
    endradius = 50.0
    StartRadiusSpread = 4.0
    MidRadiusSpread = 5.0
    EndRadiusSpread = 5.0
    priority = 0
    texture = apm_spray_01
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [227 , 225 , 222]
    startAlpha = 0
    endRGB = [209 , 207 , 204]
    endAlpha = 0
    midRGB = [170 , 185 , 191]
    midAlpha = 64
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
apm_HEDSpray01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    BoxDimsStart = (1.0, 1.0, 1.0)
    BoxDimsMid = (5.0, 5.0, 5.0)
    BoxDimsEnd = (12.577199935913086, 12.577199935913086, 12.577199935913086)
    Pos = (-115.0, 135.0, 227.0)
    MidPosition = (-57.0, 136.0, 227.0)
    EndPosition = (-7.0, 50.0, 227.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 200.0
    lifetime = 1.0
    startradius = 1.0
    MidRadius = 10.0
    endradius = 15.0
    StartRadiusSpread = 1.0
    MidRadiusSpread = 2.0
    EndRadiusSpread = 5.0
    priority = 0
    texture = apm_water_splash01
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [227 , 225 , 222]
    startAlpha = 128
    endRGB = [209 , 207 , 204]
    endAlpha = 32
    midRGB = [170 , 185 , 191]
    midAlpha = 64
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
apm_HEDSpray03_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    BoxDimsStart = (25.0, 10.0, 25.0)
    BoxDimsMid = (50.0, 10.0, 50.0)
    BoxDimsEnd = (75.0, 20.0, 75.0)
    Pos = (-7.0, 40.0, 227.0)
    MidPosition = (-7.0, 50.0, 227.0)
    EndPosition = (-7.0, 40.0, 227.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 500.0
    lod_dist2 = 1000.0
    emitrate = 100.0
    lifetime = 0.5000
    startradius = 30.0
    MidRadius = 5.0
    endradius = 5.0
    StartRadiusSpread = 4.0
    MidRadiusSpread = 5.0
    EndRadiusSpread = 5.0
    priority = 0
    texture = dt_nj_waterdrop05
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [227 , 225 , 222]
    startAlpha = 94
    endRGB = [209 , 207 , 204]
    endAlpha = 0
    midRGB = [170 , 185 , 191]
    midAlpha = 116
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
apm_TramSmoke01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    LocalSpace
    BoxDimsStart = (50.0, 20.0, 50.0)
    BoxDimsMid = (75.0, 20.0, 75.0)
    BoxDimsEnd = (300.0, 20.0, 300.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.0, 100.0, 0.0)
    EndPosition = (0.0, 500.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 500.0
    lod_dist2 = 1000.0
    emitrate = 15.0
    lifetime = 5.0
    startradius = 33.0
    MidRadius = 50.0
    endradius = 100.0
    StartRadiusSpread = 4.0
    MidRadiusSpread = 5.0
    EndRadiusSpread = 5.0
    priority = 0
    texture = ba_apm_smokepuff01s
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [26 , 26 , 26]
    startAlpha = 0
    endRGB = [11 , 11 , 11]
    endAlpha = 0
    midRGB = [46 , 50 , 53]
    midAlpha = 56
    UseColorMidTime
    ColorMidTime = 54
    useglobalcolormodulation
}
apm_TramSpark01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    LocalSpace
    BoxDimsStart = (50.0, 20.0, 50.0)
    BoxDimsMid = (150.0, 20.0, 150.0)
    BoxDimsEnd = (300.0, 100.0, 300.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.0, 1.0, 0.0)
    EndPosition = (0.0, -100.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 500.0
    lod_dist2 = 1000.0
    emitrate = 100.0
    lifetime = 0.5000
    emitduration = 0.1000
    startradius = 55.0
    MidRadius = 15.0
    endradius = 5.0
    StartRadiusSpread = 4.0
    MidRadiusSpread = 5.0
    EndRadiusSpread = 5.0
    priority = 0
    texture = apm_spark_01
    BlendMode = Add
    alphacutoff = 1
    startRGB = [97 , 143 , 189]
    startAlpha = 72
    endRGB = [128 , 172 , 189]
    endAlpha = 0
    midRGB = [143 , 176 , 189]
    midAlpha = 128
    UseColorMidTime
    ColorMidTime = 54
    useglobalcolormodulation
}
