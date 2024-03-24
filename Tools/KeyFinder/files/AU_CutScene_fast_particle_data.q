

script load_cutscene_fast_particle_textures 
    LoadParticleTexture 'particles\dt_nj_puff01b'
    LoadParticleTexture 'particles\jow_no_drops01'
    LoadParticleTexture 'particles\jow_no_drip01'
endscript

JOW_AUe1_BallDust01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    BoxDimsStart = (48.0, 48.0, 12.0)
    BoxDimsMid = (96.0, 96.0, 48.0)
    BoxDimsEnd = (240.0, 240.0, 96.0)
    Pos = (-4106.64990234375, 522.6589965820312, 10426.599609375)
    MidPosition = (-4107.31982421875, 528.2169799804688, 10401.7998046875)
    EndPosition = (-4106.7001953125, 522.4219970703125, 10365.0)
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 250.0
    lifetime = 3.0
    emitduration = 0.1000
    startradius = 48.0
    endradius = 96.0
    priority = 0
    texture = dt_nj_puff01b
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [77 , 67 , 57]
    startAlpha = 32
    endRGB = [77 , 66 , 58]
    endAlpha = 0
    midRGB = [77 , 67 , 58]
    midAlpha = 54
    UseColorMidTime
    ColorMidTime = 42
    useglobalcolormodulation
}
JOW_AUe1_BallDust02_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    BoxDimsStart = (192.0, 36.0, 192.0)
    BoxDimsMid = (72.0, 24.0, 72.0)
    BoxDimsEnd = (336.0, 60.0, 336.0)
    Pos = (-4087.7099609375, 411.61199951171875, 10394.7001953125)
    MidPosition = (-4088.3798828125, 417.1700134277344, 10394.2998046875)
    EndPosition = (-4087.760009765625, 450.45599365234375, 10394.7001953125)
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 250.0
    lifetime = 2.0
    emitduration = 0.1000
    startradius = 48.0
    endradius = 96.0
    priority = 0
    texture = dt_nj_puff01b
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [77 , 67 , 57]
    startAlpha = 44
    endRGB = [77 , 66 , 58]
    endAlpha = 0
    midRGB = [77 , 67 , 58]
    midAlpha = 61
    UseColorMidTime
    ColorMidTime = 42
    useglobalcolormodulation
}
JOW_AUe1_Gusher01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    BoxDimsStart = (12.0, 24.0, 12.0)
    BoxDimsMid = (96.0, 36.0, 96.0)
    BoxDimsEnd = (192.0, 60.0, 192.0)
    Pos = (-4597.8798828125, 414.24700927734375, 9609.76953125)
    MidPosition = (-4597.77978515625, 634.218017578125, 9609.76953125)
    EndPosition = (-4597.89990234375, 589.4229736328125, 9609.76953125)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 400.0
    lifetime = 1.0
    startradius = 10.0
    MidRadius = 16.0
    endradius = 16.0
    StartRadiusSpread = 2.0
    MidRadiusSpread = 3.0
    EndRadiusSpread = 3.0
    texture = JOW_NO_Drops01
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [178 , 178 , 178]
    startAlpha = 33
    endRGB = [178 , 178 , 178]
    endAlpha = 0
    midRGB = [178 , 178 , 178]
    midAlpha = 125
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
JOW_AUe1_Gusher02_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    BoxDimsStart = (10.0, 6.0, 10.0)
    BoxDimsMid = (96.0, 36.0, 96.0)
    BoxDimsEnd = (60.0, 60.0, 60.0)
    Pos = (-4597.8798828125, 406.6449890136719, 9609.76953125)
    MidPosition = (-4597.77978515625, 641.8590087890625, 9609.76953125)
    EndPosition = (-4597.89990234375, 617.2449951171875, 9609.76953125)
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 250.0
    lifetime = 0.4000
    emitduration = 2.0
    startradius = 48.0
    endradius = 80.0
    StartRadiusSpread = 10.0
    EndRadiusSpread = 6.0
    texture = JOW_NO_Drip01
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [195 , 195 , 195]
    startAlpha = 50
    endRGB = [202 , 202 , 202]
    endAlpha = 0
    midRGB = [202 , 202 , 202]
    midAlpha = 31
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
JOW_AUe1_LampDust01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    BoxDimsStart = (12.0, 12.0, 12.0)
    BoxDimsMid = (72.0, 24.0, 72.0)
    BoxDimsEnd = (96.0, 24.0, 96.0)
    Pos = (-4251.58984375, 404.406005859375, 9630.9404296875)
    MidPosition = (-4252.259765625, 409.9639892578125, 9630.5400390625)
    EndPosition = (-4251.64013671875, 413.5780029296875, 9630.9404296875)
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0
    lod_dist2 = 0
    emitrate = 100.0
    lifetime = 2.0
    emitduration = 0.1000
    startradius = 32.0
    endradius = 64.0
    priority = 0
    texture = dt_nj_puff01b
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [77 , 67 , 57]
    startAlpha = 13
    endRGB = [77 , 66 , 58]
    endAlpha = 0
    midRGB = [77 , 67 , 58]
    midAlpha = 23
    UseColorMidTime
    ColorMidTime = 42
    useglobalcolormodulation
}
JOW_AUe1_PedDust01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    BoxDimsStart = (48.0, 20.0, 48.0)
    BoxDimsMid = (72.0, 24.0, 72.0)
    BoxDimsEnd = (192.0, 24.0, 192.0)
    Pos = (-4142.81982421875, 414.24700927734375, 9978.16015625)
    MidPosition = (-4143.490234375, 419.80499267578125, 9977.759765625)
    EndPosition = (-4142.8701171875, 414.010009765625, 9978.16015625)
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 250.0
    lifetime = 2.0
    emitduration = 0.1000
    startradius = 24.0
    endradius = 48.0
    texture = dt_nj_puff01b
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [77 , 67 , 57]
    startAlpha = 8
    endRGB = [77 , 66 , 58]
    endAlpha = 0
    midRGB = [77 , 67 , 58]
    midAlpha = 18
    UseColorMidTime
    ColorMidTime = 42
    useglobalcolormodulation
}
JOW_AUe1_ScooterDust01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    BoxDimsStart = (48.0, 20.0, 48.0)
    BoxDimsMid = (72.0, 24.0, 72.0)
    BoxDimsEnd = (192.0, 24.0, 192.0)
    Pos = (-4735.7998046875, 412.10101318359375, 10166.0)
    MidPosition = (-4736.47021484375, 417.65899658203125, 10165.599609375)
    EndPosition = (-4735.85009765625, 411.864013671875, 10166.0)
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 250.0
    lifetime = 2.0
    emitduration = 0.1000
    startradius = 24.0
    endradius = 48.0
    texture = dt_nj_puff01b
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [77 , 67 , 57]
    startAlpha = 8
    endRGB = [77 , 66 , 58]
    endAlpha = 0
    midRGB = [77 , 67 , 58]
    midAlpha = 18
    UseColorMidTime
    ColorMidTime = 42
    useglobalcolormodulation
}
JOW_AUe1_ScooterDust02_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    BoxDimsStart = (48.0, 20.0, 48.0)
    BoxDimsMid = (72.0, 24.0, 72.0)
    BoxDimsEnd = (192.0, 24.0, 192.0)
    Pos = (-4657.2099609375, 412.10101318359375, 10302.7001953125)
    MidPosition = (-4657.8798828125, 417.65899658203125, 10302.2998046875)
    EndPosition = (-4657.259765625, 411.864013671875, 10302.7001953125)
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 250.0
    lifetime = 2.0
    emitduration = 0.1000
    startradius = 32.0
    endradius = 64.0
    texture = dt_nj_puff01b
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [77 , 67 , 57]
    startAlpha = 13
    endRGB = [77 , 66 , 58]
    endAlpha = 0
    midRGB = [77 , 67 , 58]
    midAlpha = 24
    UseColorMidTime
    ColorMidTime = 42
    useglobalcolormodulation
}
JOW_AUe2_CarDust01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    BoxDimsStart = (60.0, 12.0, 60.0)
    BoxDimsMid = (128.0, 24.0, 128.0)
    BoxDimsEnd = (256.0, 64.0, 256.0)
    Pos = (-2758.6298828125, 391.4580078125, 10099.7998046875)
    MidPosition = (-2759.300048828125, 399.0559997558594, 10099.400390625)
    EndPosition = (-2758.679931640625, 411.1239929199219, 10099.7998046875)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 250.0
    lifetime = 2.0
    startradius = 32.0
    MidRadius = 48.0
    endradius = 64.0
    texture = dt_nj_puff01b
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [79 , 68 , 57]
    startAlpha = 26
    endRGB = [72 , 63 , 54]
    endAlpha = 0
    midRGB = [73 , 63 , 53]
    midAlpha = 24
    UseColorMidTime
    ColorMidTime = 25
    useglobalcolormodulation
}
JOW_AUe2_CarDust02_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    BoxDimsStart = (60.0, 12.0, 60.0)
    BoxDimsMid = (128.0, 24.0, 128.0)
    BoxDimsEnd = (256.0, 64.0, 256.0)
    Pos = (-2623.3798828125, 391.4580078125, 10099.7998046875)
    MidPosition = (-2624.050048828125, 399.0559997558594, 10099.400390625)
    EndPosition = (-2623.429931640625, 411.1239929199219, 10099.7998046875)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 300.0
    lifetime = 2.0
    startradius = 32.0
    MidRadius = 48.0
    endradius = 64.0
    texture = dt_nj_puff01b
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [79 , 68 , 56]
    startAlpha = 26
    endRGB = [72 , 63 , 53]
    endAlpha = 0
    midRGB = [73 , 64 , 54]
    midAlpha = 24
    UseColorMidTime
    ColorMidTime = 25
    useglobalcolormodulation
}
JOW_AUe2_HeadDust01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    BoxDimsStart = (48.0, 20.0, 48.0)
    BoxDimsMid = (72.0, 24.0, 72.0)
    BoxDimsEnd = (192.0, 24.0, 192.0)
    Pos = (-4097.5498046875, 408.55499267578125, 10079.900390625)
    MidPosition = (-4098.22021484375, 414.1130065917969, 10079.5)
    EndPosition = (-4097.60009765625, 408.3179931640625, 10079.900390625)
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 250.0
    lifetime = 2.0
    startradius = 48.0
    endradius = 64.0
    texture = dt_nj_puff01b
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [77 , 67 , 57]
    startAlpha = 13
    endRGB = [77 , 66 , 58]
    endAlpha = 0
    midRGB = [77 , 67 , 58]
    midAlpha = 24
    UseColorMidTime
    ColorMidTime = 42
    useglobalcolormodulation
}
JOW_AUe2_HeadDust02_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    BoxDimsStart = (36.0, 18.0, 36.0)
    BoxDimsMid = (48.0, 24.0, 48.0)
    BoxDimsEnd = (120.0, 24.0, 120.0)
    Pos = (-1835.9200439453125, 379.343994140625, 9777.3896484375)
    MidPosition = (-1836.5899658203125, 384.9020080566406, 9776.990234375)
    EndPosition = (-1835.969970703125, 379.10699462890625, 9777.3896484375)
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 200.0
    lifetime = 2.0
    startradius = 24.0
    endradius = 48.0
    texture = dt_nj_puff01b
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [77 , 67 , 57]
    startAlpha = 8
    endRGB = [77 , 66 , 58]
    endAlpha = 0
    midRGB = [77 , 67 , 58]
    midAlpha = 19
    UseColorMidTime
    ColorMidTime = 42
    useglobalcolormodulation
}
JOW_AUe2_HeadDust03_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    BoxDimsStart = (36.0, 18.0, 36.0)
    BoxDimsMid = (48.0, 24.0, 48.0)
    BoxDimsEnd = (120.0, 24.0, 120.0)
    Pos = (-1566.260009765625, 340.29998779296875, 9663.4501953125)
    MidPosition = (-1566.9300537109375, 345.8580017089844, 9663.0498046875)
    EndPosition = (-1566.31005859375, 340.06298828125, 9663.4501953125)
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 200.0
    lifetime = 2.0
    startradius = 24.0
    endradius = 48.0
    texture = dt_nj_puff01b
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [77 , 67 , 57]
    startAlpha = 8
    endRGB = [77 , 66 , 58]
    endAlpha = 0
    midRGB = [77 , 67 , 58]
    midAlpha = 19
    UseColorMidTime
    ColorMidTime = 42
    useglobalcolormodulation
}
JOW_AUe2_HeadDust04_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    BoxDimsStart = (36.0, 18.0, 36.0)
    BoxDimsMid = (48.0, 24.0, 48.0)
    BoxDimsEnd = (120.0, 24.0, 120.0)
    Pos = (-1379.0699462890625, 296.3349914550781, 9585.6796875)
    MidPosition = (-1379.739990234375, 301.89300537109375, 9585.2802734375)
    EndPosition = (-1379.1199951171875, 296.0979919433594, 9585.6796875)
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 200.0
    lifetime = 2.0
    startradius = 24.0
    endradius = 32.0
    texture = dt_nj_puff01b
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [77 , 69 , 61]
    startAlpha = 6
    endRGB = [77 , 68 , 61]
    endAlpha = 0
    midRGB = [77 , 69 , 61]
    midAlpha = 13
    UseColorMidTime
    ColorMidTime = 42
    useglobalcolormodulation
}
JOW_AUe2_HeadDust05_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    BoxDimsStart = (36.0, 36.0, 18.0)
    BoxDimsMid = (48.0, 24.0, 48.0)
    BoxDimsEnd = (120.0, 120.0, 24.0)
    Pos = (-1264.5899658203125, 306.2340087890625, 9539.169921875)
    MidPosition = (-1265.260009765625, 311.7919921875, 9538.76953125)
    EndPosition = (-1264.6400146484375, 305.99700927734375, 9542.6396484375)
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 200.0
    lifetime = 2.0
    emitduration = 0.1000
    startradius = 24.0
    endradius = 48.0
    priority = 0
    texture = dt_nj_puff01b
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [73 , 67 , 60]
    startAlpha = 10
    endRGB = [71 , 64 , 59]
    endAlpha = 0
    midRGB = [73 , 65 , 60]
    midAlpha = 26
    UseColorMidTime
    ColorMidTime = 42
    useglobalcolormodulation
}
JOW_AUe2_HeadDust06_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    BoxDimsStart = (36.0, 18.0, 36.0)
    BoxDimsMid = (48.0, 24.0, 48.0)
    BoxDimsEnd = (120.0, 24.0, 120.0)
    Pos = (-1184.52001953125, 261.3999938964844, 9612.990234375)
    MidPosition = (-1185.18994140625, 266.9580078125, 9612.58984375)
    EndPosition = (-1184.5699462890625, 261.1629943847656, 9612.990234375)
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 200.0
    lifetime = 2.0
    startradius = 24.0
    endradius = 32.0
    texture = dt_nj_puff01b
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [71 , 64 , 57]
    startAlpha = 6
    endRGB = [71 , 63 , 56]
    endAlpha = 0
    midRGB = [71 , 64 , 57]
    midAlpha = 13
    UseColorMidTime
    ColorMidTime = 42
    useglobalcolormodulation
}
JOW_AUe2_HeadDust07_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    BoxDimsStart = (36.0, 18.0, 36.0)
    BoxDimsMid = (48.0, 24.0, 48.0)
    BoxDimsEnd = (120.0, 24.0, 120.0)
    Pos = (-1065.27001953125, 240.09800720214844, 9714.73046875)
    MidPosition = (-1065.93994140625, 245.656005859375, 9714.330078125)
    EndPosition = (-1065.3199462890625, 239.86099243164062, 9714.73046875)
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 200.0
    lifetime = 2.0
    startradius = 16.0
    endradius = 24.0
    texture = dt_nj_puff01b
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [77 , 67 , 57]
    startAlpha = 6
    endRGB = [77 , 66 , 58]
    endAlpha = 0
    midRGB = [77 , 67 , 58]
    midAlpha = 13
    UseColorMidTime
    ColorMidTime = 42
    useglobalcolormodulation
}
JOW_AUe2_HeadDust08_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    BoxDimsStart = (72.0, 36.0, 72.0)
    BoxDimsMid = (72.0, 24.0, 72.0)
    BoxDimsEnd = (240.0, 48.0, 240.0)
    Pos = (-674.3400268554688, 273.83099365234375, 10188.900390625)
    MidPosition = (-675.010009765625, 279.3890075683594, 10188.5)
    EndPosition = (-674.3900146484375, 273.593994140625, 10188.900390625)
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 250.0
    lifetime = 2.0
    startradius = 72.0
    endradius = 96.0
    texture = dt_nj_puff01b
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [88 , 78 , 70]
    startAlpha = 18
    endRGB = [86 , 77 , 69]
    endAlpha = 0
    midRGB = [97 , 87 , 78]
    midAlpha = 38
    UseColorMidTime
    ColorMidTime = 42
    useglobalcolormodulation
}
JOW_AUe2_HeadDust09_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    BoxDimsStart = (72.0, 20.0, 72.0)
    BoxDimsMid = (72.0, 24.0, 72.0)
    BoxDimsEnd = (240.0, 24.0, 240.0)
    Pos = (139.87399291992188, 168.56500244140625, 10326.099609375)
    MidPosition = (139.20399475097656, 174.1230010986328, 10325.7001953125)
    EndPosition = (139.82400512695312, 168.3280029296875, 10326.099609375)
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 250.0
    lifetime = 2.0
    startradius = 52.0
    endradius = 64.0
    texture = dt_nj_puff01b
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [77 , 67 , 57]
    startAlpha = 13
    endRGB = [77 , 66 , 58]
    endAlpha = 0
    midRGB = [77 , 67 , 58]
    midAlpha = 24
    UseColorMidTime
    ColorMidTime = 42
    useglobalcolormodulation
}
JOW_AUe2_HeadDust10_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    BoxDimsStart = (72.0, 60.0, 96.0)
    BoxDimsMid = (72.0, 24.0, 72.0)
    BoxDimsEnd = (120.0, 192.0, 240.0)
    Pos = (684.2890014648438, 188.52999877929688, 10415.099609375)
    MidPosition = (683.6190185546875, 194.08799743652344, 10414.7001953125)
    EndPosition = (667.8839721679688, 241.7239990234375, 10401.5)
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 300.0
    lifetime = 2.0
    startradius = 72.0
    endradius = 96.0
    texture = dt_nj_puff01b
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [88 , 78 , 70]
    startAlpha = 18
    endRGB = [86 , 77 , 69]
    endAlpha = 0
    midRGB = [97 , 87 , 78]
    midAlpha = 38
    UseColorMidTime
    ColorMidTime = 42
    useglobalcolormodulation
}
