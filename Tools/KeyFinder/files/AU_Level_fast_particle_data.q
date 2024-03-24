

script load_level_fast_particle_textures 
    LoadParticleTexture 'particles\apm_spray_01'
    LoadParticleTexture 'particles\jow_no_drops01'
    LoadParticleTexture 'particles\jow_no_drip01'
    LoadParticleTexture 'particles\apm_spark_01'
    LoadParticleTexture 'particles\dt_barf02'
    LoadParticleTexture 'particles\apm_fallingwater_01'
endscript

JOW_AU_FootBath01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    BoxDimsStart = (2.4000000953674316, 2.4000000953674316, 2.4000000953674316)
    BoxDimsMid = (12.0, 6.0, 12.0)
    BoxDimsEnd = (48.0, 24.0, 48.0)
    Pos = (1186.5699462890625, 21.84000015258789, 5225.68994140625)
    MidPosition = (1186.6099853515625, -11.630000114440918, 5206.77978515625)
    EndPosition = (1186.699951171875, -2.1700000762939453, 5200.830078125)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 100.0
    lifetime = 1.0
    startradius = 6.0
    MidRadius = 10.0
    endradius = 20.0
    priority = 0
    texture = apm_spray_01
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [191 , 191 , 191]
    startAlpha = 64
    endRGB = [207 , 207 , 207]
    endAlpha = 0
    midRGB = [191 , 191 , 191]
    midAlpha = 45
    UseColorMidTime
    ColorMidTime = 52
    useglobalcolormodulation
}
JOW_AU_FootBath02_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    BoxDimsStart = (2.4000000953674316, 2.4000000953674316, 2.4000000953674316)
    BoxDimsMid = (12.0, 6.0, 12.0)
    BoxDimsEnd = (48.0, 24.0, 48.0)
    Pos = (1177.6800537109375, 21.84000015258789, 5234.77001953125)
    MidPosition = (1160.3800048828125, -11.630000114440918, 5234.93017578125)
    EndPosition = (1148.2900390625, -2.1700000762939453, 5235.1201171875)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 100.0
    lifetime = 1.0
    startradius = 6.0
    MidRadius = 10.0
    endradius = 20.0
    priority = 0
    texture = apm_spray_01
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [191 , 191 , 191]
    startAlpha = 64
    endRGB = [207 , 207 , 207]
    endAlpha = 0
    midRGB = [191 , 191 , 191]
    midAlpha = 45
    UseColorMidTime
    ColorMidTime = 52
    useglobalcolormodulation
}
JOW_AU_Gusher01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    BoxDimsStart = (12.0, 24.0, 12.0)
    BoxDimsMid = (96.0, 36.0, 96.0)
    BoxDimsEnd = (192.0, 60.0, 192.0)
    Pos = (-4605.25, 450.0, 9618.3701171875)
    MidPosition = (-4605.25, 634.219970703125, 9618.3701171875)
    EndPosition = (-4605.25, 589.4199829101562, 9618.3701171875)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 400.0
    lifetime = 1.0
    startradius = 6.0
    MidRadius = 8.0
    endradius = 12.0
    StartRadiusSpread = 2.0
    MidRadiusSpread = 3.0
    EndRadiusSpread = 3.0
    priority = 0
    texture = JOW_NO_Drops01
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [178 , 178 , 178]
    startAlpha = 0
    endRGB = [178 , 178 , 178]
    endAlpha = 0
    midRGB = [178 , 178 , 178]
    midAlpha = 125
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
JOW_AU_Gusher02_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    BoxDimsStart = (10.0, 6.0, 10.0)
    BoxDimsMid = (96.0, 36.0, 96.0)
    BoxDimsEnd = (60.0, 60.0, 60.0)
    Pos = (-4605.25, 400.0, 9618.3701171875)
    MidPosition = (-4597.77978515625, 641.8599853515625, 9609.76953125)
    EndPosition = (-4605.25, 617.25, 9618.3701171875)
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 250.0
    lifetime = 0.4000
    startradius = 48.0
    endradius = 80.0
    StartRadiusSpread = 10.0
    EndRadiusSpread = 6.0
    priority = 0
    texture = JOW_NO_Drip01
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [235 , 235 , 235]
    startAlpha = 50
    endRGB = [218 , 218 , 218]
    endAlpha = 0
    midRGB = [229 , 229 , 229]
    midAlpha = 31
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
JOW_AU_HydrantDrip01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    BoxDimsStart = (6.0, 1.2000000476837158, 2.4000000953674316)
    BoxDimsMid = (6.0, 2.4000000953674316, 3.5999999046325684)
    BoxDimsEnd = (6.0, 12.0, 3.5999999046325684)
    Pos = (-4606.91015625, 434.239990234375, 9629.91015625)
    MidPosition = (-4606.89013671875, 431.2200012207031, 9629.75)
    EndPosition = (-4606.919921875, 406.3999938964844, 9629.5595703125)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 8.0
    lifetime = 1.0
    startradius = 1.0
    MidRadius = 3.0
    endradius = 4.0
    StartRadiusSpread = 1.0
    MidRadiusSpread = 3.0
    EndRadiusSpread = 4.0
    priority = 0
    texture = JOW_NO_Drip01
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [129 , 139 , 145]
    startAlpha = 68
    endRGB = [114 , 123 , 128]
    endAlpha = 49
    midRGB = [77 , 87 , 94]
    midAlpha = 105
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
JOW_AU_LampSparks01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDimsStart = (20.0, 20.0, 20.0)
    BoxDimsMid = (64.0, 48.0, 64.0)
    BoxDimsEnd = (112.0, 36.0, 112.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.11999999731779099, 31.489999771118164, 0.0)
    EndPosition = (0.1599999964237213, -24.200000762939453, 0.0)
    UseMidPoint
    MidPointPCT = 53.0
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 100.0
    lifetime = 0.8000
    emitduration = 0.2000
    startradius = 24.0
    MidRadius = 12.0
    endradius = 3.0
    priority = 0
    texture = apm_spark_01
    BlendMode = Add
    alphacutoff = 1
    startRGB = [105 , 167 , 255]
    startAlpha = 94
    endRGB = [99 , 164 , 255]
    endAlpha = 0
    useglobalcolormodulation
}
JOW_AU_SecretFoam01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    BoxDimsStart = (288.0, 36.0, 288.0)
    BoxDimsMid = (20.0, 20.0, 20.0)
    BoxDimsEnd = (384.0, 48.0, 384.0)
    Pos = (8244.5, -918.27001953125, 5907.2998046875)
    MidPosition = (8284.5, -950.27001953125, 5907.2998046875)
    EndPosition = (8255.8203125, -888.989990234375, 5860.7900390625)
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 50.0
    lifetime = 2.0
    startradius = 128.0
    endradius = 192.0
    StartRadiusSpread = 6.0
    EndRadiusSpread = 6.0
    priority = 0
    texture = apm_spray_01
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [153 , 153 , 153]
    startAlpha = 51
    endRGB = [153 , 153 , 153]
    endAlpha = 0
    useglobalcolormodulation
}
JOW_AU_SecretFoam02_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    BoxDimsStart = (192.0, 36.0, 192.0)
    BoxDimsMid = (20.0, 20.0, 20.0)
    BoxDimsEnd = (288.0, 48.0, 288.0)
    Pos = (8023.47021484375, -918.27001953125, 5695.06005859375)
    MidPosition = (8063.47021484375, -950.27001953125, 5695.06005859375)
    EndPosition = (8022.490234375, -888.989990234375, 5679.72021484375)
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 40.0
    lifetime = 2.0
    startradius = 128.0
    endradius = 192.0
    StartRadiusSpread = 6.0
    EndRadiusSpread = 6.0
    priority = 0
    texture = apm_spray_01
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [153 , 153 , 153]
    startAlpha = 51
    endRGB = [153 , 153 , 153]
    endAlpha = 0
    useglobalcolormodulation
}
JOW_AU_SecretFoam03_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    BoxDimsStart = (192.0, 36.0, 192.0)
    BoxDimsMid = (20.0, 20.0, 20.0)
    BoxDimsEnd = (288.0, 36.0, 288.0)
    Pos = (8168.85986328125, -186.52999877929688, 6108.580078125)
    MidPosition = (8208.8603515625, -218.52999877929688, 6108.580078125)
    EndPosition = (8167.8798828125, -182.5800018310547, 6093.240234375)
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 30.0
    lifetime = 2.0
    startradius = 128.0
    endradius = 192.0
    StartRadiusSpread = 6.0
    EndRadiusSpread = 6.0
    priority = 0
    texture = apm_spray_01
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [153 , 153 , 153]
    startAlpha = 13
    endRGB = [153 , 153 , 153]
    endAlpha = 0
    useglobalcolormodulation
}
JOW_AU_SecretFoam04_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    BoxDimsStart = (192.0, 36.0, 192.0)
    BoxDimsMid = (20.0, 20.0, 20.0)
    BoxDimsEnd = (288.0, 36.0, 288.0)
    Pos = (7957.47021484375, -186.52999877929688, 5988.68017578125)
    MidPosition = (7997.47021484375, -218.52999877929688, 5988.68017578125)
    EndPosition = (7956.490234375, -181.17999267578125, 5973.35009765625)
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 30.0
    lifetime = 2.0
    startradius = 128.0
    endradius = 192.0
    StartRadiusSpread = 6.0
    EndRadiusSpread = 6.0
    priority = 0
    texture = apm_spray_01
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [153 , 153 , 153]
    startAlpha = 13
    endRGB = [153 , 153 , 153]
    endAlpha = 0
    useglobalcolormodulation
}
JOW_AU_SecretFoam05_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    BoxDimsStart = (96.0, 36.0, 24.0)
    BoxDimsMid = (20.0, 20.0, 20.0)
    BoxDimsEnd = (120.0, 36.0, 60.0)
    Pos = (8234.3798828125, 23.350000381469727, 6251.240234375)
    MidPosition = (8274.3798828125, -8.649999618530273, 6251.240234375)
    EndPosition = (8233.400390625, 23.149999618530273, 6240.60986328125)
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 20.0
    lifetime = 2.0
    startradius = 128.0
    endradius = 192.0
    StartRadiusSpread = 6.0
    EndRadiusSpread = 6.0
    priority = 0
    texture = apm_spray_01
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [153 , 153 , 153]
    startAlpha = 13
    endRGB = [153 , 153 , 153]
    endAlpha = 0
    useglobalcolormodulation
}
JOW_AU_SecretFoam06_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    BoxDimsStart = (288.0, 36.0, 288.0)
    BoxDimsMid = (20.0, 20.0, 20.0)
    BoxDimsEnd = (384.0, 36.0, 384.0)
    Pos = (7842.08984375, 23.350000381469727, 6182.14990234375)
    MidPosition = (7882.08984375, -8.649999618530273, 6182.14990234375)
    EndPosition = (7841.10986328125, 27.299999237060547, 6166.81005859375)
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 50.0
    lifetime = 2.0
    startradius = 128.0
    endradius = 192.0
    StartRadiusSpread = 6.0
    EndRadiusSpread = 6.0
    priority = 0
    texture = apm_spray_01
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [153 , 153 , 153]
    startAlpha = 13
    endRGB = [153 , 153 , 153]
    endAlpha = 0
    useglobalcolormodulation
}
JOW_AU_ShrimpSplat01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDimsStart = (15.0, 15.0, 15.0)
    BoxDimsMid = (20.0, 20.0, 20.0)
    BoxDimsEnd = (80.0, 80.0, 80.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (-0.05999999865889549, 0.0, 0.0)
    EndPosition = (-0.11999999731779099, 0.09000000357627869, 0.0)
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 120.0
    lifetime = 0.3000
    emitduration = 0.1500
    startradius = 8.0
    endradius = 1.0
    priority = 0
    texture = dt_barf02
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [92 , 121 , 84]
    startAlpha = 128
    endRGB = [114 , 121 , 104]
    endAlpha = 0
    useglobalcolormodulation
}
apm_AU_hydrant01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    LocalSpace
    BoxDimsStart = (5.0, 5.0, 5.0)
    BoxDimsMid = (20.0, 20.0, 20.0)
    BoxDimsEnd = (40.0, 20.0, 40.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (-2.1875, -9.457579612731934, 20.103500366210938)
    EndPosition = (-5.444340229034424, -40.488800048828125, 31.80470085144043)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 100.0
    lifetime = 0.5000
    startradius = 5.0
    MidRadius = 10.0
    endradius = 20.0
    StartRadiusSpread = 1.0
    MidRadiusSpread = 5.0
    EndRadiusSpread = 5.0
    priority = 0
    texture = apm_fallingwater_01
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [182 , 182 , 182]
    startAlpha = 255
    endRGB = [158 , 158 , 158]
    endAlpha = 0
    midRGB = [204 , 204 , 204]
    midAlpha = 84
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
