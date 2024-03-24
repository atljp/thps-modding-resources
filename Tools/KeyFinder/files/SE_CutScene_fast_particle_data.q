

script load_cutscene_fast_particle_textures 
    LoadParticleTexture 'particles\dt_browndot02'
    LoadParticleTexture 'particles\dt_nj_puff01b'
    LoadParticleTexture 'particles\apm_spark_01'
    LoadParticleTexture 'particles\apm_stripes01'
endscript

JOW_SEe1_BallBits01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    BoxDimsStart = (192.0, 36.0, 36.0)
    BoxDimsMid = (384.0, 60.0, 384.0)
    BoxDimsEnd = (480.0, 24.0, 96.0)
    Pos = (-617.5399780273438, 242.99000549316406, -10310.099609375)
    MidPosition = (-618.219970703125, 291.3599853515625, -10310.5)
    EndPosition = (-617.5999755859375, 95.7300033569336, -10311.099609375)
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 10.0
    lifetime = 1.0
    emitduration = 4.0
    startradius = 4.0
    endradius = 4.0
    priority = 64
    texture = dt_browndot02
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [51 , 45 , 40]
    startAlpha = 97
    endRGB = [51 , 45 , 40]
    endAlpha = 97
    useglobalcolormodulation
}
JOW_SEe1_BallBits02_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    BoxDimsStart = (144.0, 12.0, 24.0)
    BoxDimsMid = (156.0, 12.0, 24.0)
    BoxDimsEnd = (288.0, 24.0, 48.0)
    Pos = (-613.3499755859375, -444.8399963378906, -9515.1904296875)
    MidPosition = (-614.02001953125, -456.45001220703125, -9476.76953125)
    EndPosition = (-613.4000244140625, -564.6799926757812, -9436.5302734375)
    UseMidPoint
    MidPointPCT = 50.0
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 100.0
    lifetime = 0.7000
    emitduration = 0.1000
    startradius = 6.0
    MidRadius = 6.0
    endradius = 6.0
    priority = 64
    texture = dt_browndot02
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [77 , 64 , 60]
    startAlpha = 97
    endRGB = [77 , 64 , 60]
    endAlpha = 97
    useglobalcolormodulation
}
JOW_SEe1_BallDirt01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    BoxDimsStart = (192.0, 20.0, 192.0)
    BoxDimsMid = (384.0, 60.0, 384.0)
    BoxDimsEnd = (480.0, 24.0, 480.0)
    Pos = (-617.5399780273438, -446.9100036621094, -10031.900390625)
    MidPosition = (-618.219970703125, -398.5400085449219, -10032.2998046875)
    EndPosition = (-617.5999755859375, -447.70001220703125, -10031.900390625)
    UseMidPoint
    MidPointPCT = 50.0
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 200.0
    lifetime = 1.0
    emitduration = 0.1000
    startradius = 8.0
    MidRadius = 8.0
    endradius = 6.0
    priority = 64
    texture = dt_browndot02
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [77 , 24 , 16]
    startAlpha = 97
    endRGB = [77 , 36 , 21]
    endAlpha = 97
    useglobalcolormodulation
}
JOW_SEe1_BallDust01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    BoxDimsStart = (144.0, 20.0, 144.0)
    BoxDimsMid = (72.0, 24.0, 72.0)
    BoxDimsEnd = (288.0, 24.0, 288.0)
    Pos = (-617.5399780273438, -443.4700012207031, -10024.2001953125)
    MidPosition = (-618.219970703125, -437.9100036621094, -10024.599609375)
    EndPosition = (-617.5999755859375, -443.7099914550781, -10024.2001953125)
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 250.0
    lifetime = 2.0
    emitduration = 0.1000
    startradius = 64.0
    endradius = 128.0
    priority = 0
    texture = dt_nj_puff01b
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [38 , 33 , 29]
    startAlpha = 19
    endRGB = [38 , 33 , 29]
    endAlpha = 0
    midRGB = [38 , 33 , 29]
    midAlpha = 32
    UseColorMidTime
    ColorMidTime = 42
    useglobalcolormodulation
}
JOW_SEe1_BallDust02_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    BoxDimsStart = (144.0, 20.0, 144.0)
    BoxDimsMid = (72.0, 24.0, 72.0)
    BoxDimsEnd = (288.0, 24.0, 288.0)
    Pos = (-617.5399780273438, -465.739990234375, -9896.83984375)
    MidPosition = (-618.219970703125, -460.17999267578125, -9897.240234375)
    EndPosition = (-617.5999755859375, -465.9800109863281, -9896.83984375)
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 250.0
    lifetime = 2.0
    emitduration = 0.1000
    startradius = 64.0
    endradius = 128.0
    priority = 0
    texture = dt_nj_puff01b
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [38 , 33 , 29]
    startAlpha = 19
    endRGB = [38 , 33 , 29]
    endAlpha = 0
    midRGB = [38 , 33 , 29]
    midAlpha = 32
    UseColorMidTime
    ColorMidTime = 42
    useglobalcolormodulation
}
JOW_SEe1_BallDust03_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    BoxDimsStart = (144.0, 20.0, 144.0)
    BoxDimsMid = (72.0, 24.0, 72.0)
    BoxDimsEnd = (288.0, 24.0, 288.0)
    Pos = (-617.5399780273438, -482.0, -9797.0595703125)
    MidPosition = (-618.219970703125, -476.44000244140625, -9797.4599609375)
    EndPosition = (-617.5999755859375, -482.2300109863281, -9797.0595703125)
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 250.0
    lifetime = 2.0
    emitduration = 0.1000
    startradius = 64.0
    endradius = 128.0
    priority = 0
    texture = dt_nj_puff01b
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [38 , 33 , 29]
    startAlpha = 19
    endRGB = [38 , 33 , 29]
    endAlpha = 0
    midRGB = [38 , 33 , 29]
    midAlpha = 32
    UseColorMidTime
    ColorMidTime = 42
    useglobalcolormodulation
}
dfn_SE_Spark01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    BoxDimsStart = (200.0, 200.0, 200.0)
    BoxDimsMid = (500.0, 500.0, 500.0)
    BoxDimsEnd = (400.0, 600.0, 600.0)
    Pos = (-350.0, -1325.0, -2600.0)
    MidPosition = (-350.0, -1325.0, -2400.0)
    EndPosition = (-350.0, -1325.0, -3000.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 800.0
    lifetime = 1.0
    emitduration = 0.1000
    startradius = 200.0
    MidRadius = 50.0
    endradius = 5.0
    StartRadiusSpread = 4.0
    MidRadiusSpread = 5.0
    EndRadiusSpread = 5.0
    priority = 0
    texture = apm_spark_01
    BlendMode = Add
    alphacutoff = 1
    startRGB = [97 , 143 , 255]
    startAlpha = 72
    endRGB = [35 , 83 , 136]
    endAlpha = 0
    midRGB = [72 , 110 , 224]
    midAlpha = 128
    UseColorMidTime
    ColorMidTime = 54
    useglobalcolormodulation
}
dfn_SP_HoverFadeOut_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDimsStart = (200.0, 10.0, 800.0)
    BoxDimsMid = (200.0, 10.0, 800.0)
    BoxDimsEnd = (200.0, 10.0, 800.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.0, 0.0, 0.0)
    EndPosition = (0.0, 1.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 100.0
    lifetime = 1.0
    startradius = 100.0
    MidRadius = 100.0
    endradius = 100.0
    priority = 0
    texture = apm_stripes01
    BlendMode = Add
    alphacutoff = 1
    startRGB = [246 , 247 , 255]
    startAlpha = 0
    endRGB = [0 , 93 , 202]
    endAlpha = 0
    midRGB = [0 , 172 , 255]
    midAlpha = 35
    UseColorMidTime
    ColorMidTime = 50
    updatescript = fast_change_color
    params = {
        endStartRGBA = [0 , 0 , 255 , 0]
        endMidRGBA = [0 , 0 , 255 , 0]
        endEndRGBA = [0 , 0 , 255 , 0]
        delayStart = 4.0
        changetime = 1.0
        stepTime = 0.1000
    }
}
