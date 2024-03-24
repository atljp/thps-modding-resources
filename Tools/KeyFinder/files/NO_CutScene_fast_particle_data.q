

script load_cutscene_fast_particle_textures 
    LoadParticleTexture 'particles\apm_debis_02'
    LoadParticleTexture 'particles\dt_nj_waterdrop05'
    LoadParticleTexture 'particles\ba_apm_smokepuff01s'
    LoadParticleTexture 'particles\jow_no_cauldronbubble01'
    LoadParticleTexture 'particles\apm_spray_01'
    LoadParticleTexture 'particles\jow_no_drops01'
    LoadParticleTexture 'particles\jow_no_drip01'
    LoadParticleTexture 'particles\apm_spark_01'
    LoadParticleTexture 'particles\apm_ring_02'
    LoadParticleTexture 'particles\jow_no_puff01'
    LoadParticleTexture 'particles\no_tw_vortex01'
    LoadParticleTexture 'particles\se_hj_spotlightglow'
endscript

Apm_NOc_chopperDebris01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDimsStart = (10.0, 10.0, 10.0)
    BoxDimsMid = (1000.0, 250.0, 1000.0)
    BoxDimsEnd = (2000.0, 60.0, 2000.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.0, 500.0, 24.0)
    EndPosition = (0.0, 0.0, 48.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 50.0
    lifetime = 0.5000
    emitduration = 0.2000
    startradius = 100.0
    MidRadius = 50.0
    endradius = 50.0
    StartRadiusSpread = 50.0
    MidRadiusSpread = 25.0
    EndRadiusSpread = 25.0
    priority = 0
    texture = apm_debis_02
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [42 , 42 , 42]
    startAlpha = 87
    endRGB = [66 , 66 , 66]
    endAlpha = 128
    midRGB = [75 , 75 , 75]
    midAlpha = 128
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
Apm_NOc_choppersplash01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDimsStart = (10.0, 10.0, 10.0)
    BoxDimsMid = (500.0, 250.0, 500.0)
    BoxDimsEnd = (700.0, 60.0, 700.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (300.0, 300.0, -100.0)
    EndPosition = (400.0, 0.0, -300.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 1000.0
    lifetime = 0.5000
    emitduration = 0.3000
    startradius = 100.0
    MidRadius = 50.0
    endradius = 50.0
    priority = 0
    texture = dt_nj_waterdrop05
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [167 , 174 , 162]
    startAlpha = 87
    endRGB = [186 , 196 , 176]
    endAlpha = 94
    midRGB = [181 , 191 , 181]
    midAlpha = 113
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
JOW_NOc8_ChopperSmoke01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDimsStart = (120.0, 120.0, 120.0)
    BoxDimsMid = (300.0, 120.0, 300.0)
    BoxDimsEnd = (600.0, 120.0, 600.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.0, 500.0, 0.0)
    EndPosition = (0.0, 1000.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 32.0
    lifetime = 8.0
    startradius = 128.0
    MidRadius = 180.0
    endradius = 256.0
    StartRadiusSpread = 66.0
    MidRadiusSpread = 90.0
    EndRadiusSpread = 128.0
    priority = 0
    texture = ba_apm_smokepuff01s
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [185 , 88 , 39]
    startAlpha = 31
    endRGB = [48 , 48 , 48]
    endAlpha = 0
    midRGB = [68 , 68 , 68]
    midAlpha = 48
    UseColorMidTime
    ColorMidTime = 48
    useglobalcolormodulation
}
JOW_NOe1_CauldronBubbles01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    BoxDimsStart = (216.0, 1.2000000476837158, 216.0)
    BoxDimsMid = (20.0, 20.0, 20.0)
    BoxDimsEnd = (216.0, 1.2000000476837158, 216.0)
    Pos = (0.6200000047683716, 156.7100067138672, -3525.39990234375)
    MidPosition = (0.6899999976158142, 170.49000549316406, -3525.39990234375)
    EndPosition = (0.7699999809265137, 156.61000061035156, -3525.39990234375)
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 10.0
    lifetime = 0.8000
    emitduration = 20.0
    startradius = 6.0
    endradius = 16.0
    StartRadiusSpread = 0.0
    EndRadiusSpread = 6.0
    priority = 0
    texture = JOW_NO_CauldronBubble01
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [121 , 128 , 112]
    startAlpha = 0
    endRGB = [110 , 128 , 96]
    endAlpha = 10
    midRGB = [103 , 128 , 91]
    midAlpha = 128
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
JOW_NOe1_Exhaust01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    enablerotate
    BoxDimsStart = (3.0, 3.0, 3.0)
    BoxDimsMid = (12.0, 6.0, 12.0)
    BoxDimsEnd = (3.0, 3.0, 3.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.07999999821186066, 13.100000381469727, 0.0)
    EndPosition = (-0.09000000357627869, 58.56999969482422, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 100.0
    lifetime = 0.2000
    emitduration = 5.0
    startradius = 4.0
    MidRadius = 8.0
    endradius = 2.0
    priority = 64
    texture = apm_spray_01
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [255 , 198 , 0]
    startAlpha = 64
    endRGB = [154 , 20 , 0]
    endAlpha = 31
    midRGB = [215 , 75 , 0]
    midAlpha = 64
    UseColorMidTime
    ColorMidTime = 47
}
JOW_NOe1_Exhaust02_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    enablerotate
    BoxDimsStart = (1.5, 1.5, 1.5)
    BoxDimsMid = (12.0, 6.0, 12.0)
    BoxDimsEnd = (3.0, 3.0, 3.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.07999999821186066, 13.100000381469727, 0.0)
    EndPosition = (-0.09000000357627869, 3.3399999141693115, 0.0)
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 25.0
    lifetime = 0.1000
    startradius = 8.0
    endradius = 2.0
    priority = 0
    texture = apm_spray_01
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [255 , 88 , 0]
    startAlpha = 64
    endRGB = [154 , 20 , 0]
    endAlpha = 31
}
JOW_NOe1_FireHydrant01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    BoxDimsStart = (12.0, 24.0, 12.0)
    BoxDimsMid = (96.0, 36.0, 96.0)
    BoxDimsEnd = (192.0, 60.0, 192.0)
    Pos = (175.1300048828125, 44.876800537109375, -172.66099548339844)
    MidPosition = (175.23500061035156, 264.8479919433594, -172.66099548339844)
    EndPosition = (175.11000061035156, 220.05299377441406, -172.66099548339844)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 400.0
    lifetime = 1.0
    startradius = 5.0
    MidRadius = 8.0
    endradius = 8.0
    StartRadiusSpread = 2.0
    MidRadiusSpread = 3.0
    EndRadiusSpread = 3.0
    texture = JOW_NO_Drops01
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [128 , 128 , 128]
    startAlpha = 33
    endRGB = [128 , 128 , 128]
    endAlpha = 0
    midRGB = [128 , 128 , 128]
    midAlpha = 125
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
JOW_NOe1_FireHydrant02_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    BoxDimsStart = (10.0, 6.0, 10.0)
    BoxDimsMid = (96.0, 36.0, 96.0)
    BoxDimsEnd = (60.0, 60.0, 60.0)
    Pos = (175.1300048828125, 25.364099502563477, -172.66099548339844)
    MidPosition = (175.23500061035156, 260.5780029296875, -172.66099548339844)
    EndPosition = (175.11000061035156, 235.96400451660156, -172.66099548339844)
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 250.0
    lifetime = 0.5000
    startradius = 24.0
    endradius = 40.0
    StartRadiusSpread = 10.0
    EndRadiusSpread = 6.0
    texture = JOW_NO_Drip01
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [169 , 169 , 169]
    startAlpha = 50
    endRGB = [176 , 176 , 176]
    endAlpha = 0
    midRGB = [176 , 176 , 176]
    midAlpha = 31
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
JOW_NOe1_Glow01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    boneoffset = (0.0, -30.0, 0.0)
    LocalSpace
    BoxDimsStart = (1.5, 1.5, 1.5)
    BoxDimsMid = (12.0, 6.0, 12.0)
    BoxDimsEnd = (1.5, 1.5, 1.5)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.07999999821186066, 13.100000381469727, 0.0)
    EndPosition = (0.0, 0.0, 0.0)
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 1.0
    lifetime = 3.0
    emitduration = 1.0
    startradius = 128.0
    endradius = 128.0
    priority = 0
    texture = apm_spark_01
    BlendMode = Add
    alphacutoff = 1
    startRGB = [255 , 77 , 11]
    startAlpha = 128
    endRGB = [255 , 207 , 130]
    endAlpha = 0
}
JOW_NOe1_SpellEffect01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    BoxDimsStart = (2.4000000953674316, 2.4000000953674316, 2.4000000953674316)
    BoxDimsMid = (12.0, 12.0, 12.0)
    BoxDimsEnd = (60.0, 12.0, 60.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (18.700000762939453, -32.040000915527344, 73.19000244140625)
    EndPosition = (35.650001525878906, -72.66000366210938, 152.25)
    UseMidPoint
    MidPointPCT = 50.0
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 250.0
    lifetime = 0.5000
    startradius = 4.0
    MidRadius = 12.0
    endradius = 36.0
    priority = 0
    texture = apm_ring_02
    BlendMode = Add
    alphacutoff = 1
    startRGB = [3 , 123 , 0]
    startAlpha = 81
    endRGB = [18 , 61 , 17]
    endAlpha = 0
    useglobalcolormodulation
}
JOW_NOe1_StreetDustBot01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    BoxDimsStart = (600.0, 20.0, 120.0)
    BoxDimsMid = (600.0, 20.0, 180.0)
    BoxDimsEnd = (240.0, 20.0, 60.0)
    Pos = (-0.5471950173377991, -15.610400199890137, 1696.8399658203125)
    MidPosition = (-1.5605499744415283, -16.175399780273438, 465.1830139160156)
    EndPosition = (-0.37755200266838074, -15.948200225830078, 81.54109954833984)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 300.0
    lifetime = 4.0
    startradius = 20.0
    MidRadius = 60.0
    endradius = 80.0
    StartRadiusSpread = 10.0
    MidRadiusSpread = 10.0
    EndRadiusSpread = 10.0
    texture = jow_no_puff01
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [20 , 22 , 23]
    startAlpha = 0
    endRGB = [68 , 66 , 57]
    endAlpha = 0
    midRGB = [75 , 74 , 70]
    midAlpha = 13
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
JOW_NOe1_StreetDustLeft01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    BoxDimsStart = (600.0, 20.0, 120.0)
    BoxDimsMid = (600.0, 20.0, 180.0)
    BoxDimsEnd = (240.0, 20.0, 60.0)
    Pos = (-1661.72998046875, -15.610400199890137, 4.444169998168945)
    MidPosition = (-1660.0899658203125, -16.175399780273438, -1160.469970703125)
    EndPosition = (-1659.719970703125, -15.948200225830078, -1589.699951171875)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 300.0
    lifetime = 4.0
    startradius = 20.0
    MidRadius = 60.0
    endradius = 80.0
    StartRadiusSpread = 10.0
    MidRadiusSpread = 10.0
    EndRadiusSpread = 10.0
    texture = jow_no_puff01
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [20 , 22 , 23]
    startAlpha = 0
    endRGB = [68 , 66 , 57]
    endAlpha = 0
    midRGB = [75 , 74 , 70]
    midAlpha = 13
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
JOW_NOe1_StreetDustRight01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    BoxDimsStart = (600.0, 20.0, 120.0)
    BoxDimsMid = (600.0, 20.0, 180.0)
    BoxDimsEnd = (240.0, 20.0, 60.0)
    Pos = (1799.8299560546875, -15.610400199890137, 4.444009780883789)
    MidPosition = (1801.469970703125, -16.175399780273438, 1292.25)
    EndPosition = (1801.8399658203125, -15.948200225830078, 1706.72998046875)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 300.0
    lifetime = 4.0
    startradius = 20.0
    MidRadius = 60.0
    endradius = 80.0
    StartRadiusSpread = 10.0
    MidRadiusSpread = 10.0
    EndRadiusSpread = 10.0
    texture = no_tw_vortex01
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [20 , 22 , 23]
    startAlpha = 0
    endRGB = [68 , 66 , 57]
    endAlpha = 0
    midRGB = [75 , 74 , 70]
    midAlpha = 13
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
JOW_NOe1_StreetDustTop01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    BoxDimsStart = (600.0, 20.0, 120.0)
    BoxDimsMid = (600.0, 20.0, 180.0)
    BoxDimsEnd = (240.0, 20.0, 60.0)
    Pos = (-0.5471950173377991, -15.610400199890137, -1786.550048828125)
    MidPosition = (-1.5605499744415283, -16.175399780273438, -544.6630249023438)
    EndPosition = (-0.37755200266838074, -15.948200225830078, -78.93990325927734)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 300.0
    lifetime = 4.0
    startradius = 20.0
    MidRadius = 60.0
    endradius = 80.0
    StartRadiusSpread = 10.0
    MidRadiusSpread = 10.0
    EndRadiusSpread = 10.0
    texture = no_tw_vortex01
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [20 , 22 , 23]
    startAlpha = 0
    endRGB = [68 , 66 , 57]
    endAlpha = 0
    midRGB = [75 , 74 , 70]
    midAlpha = 13
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
JOW_NOe1_Tornado01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    BoxDimsStart = (20.0, 20.0, 20.0)
    BoxDimsMid = (20.0, 20.0, 20.0)
    BoxDimsEnd = (20.0, 20.0, 20.0)
    Pos = (-0.20999999344348907, -95.08999633789062, 6.519999980926514)
    MidPosition = (-0.7699999809265137, 514.3200073242188, 25.510000228881836)
    EndPosition = (1.4299999475479126, 2883.080078125, 0.019999999552965164)
    UseMidPoint
    suspenddistance = 0.0
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 40.0
    lifetime = 2.0
    startradius = 50.0
    MidRadius = 250.0
    endradius = 1000.0
    StartRadiusSpread = 60.0
    MidRadiusSpread = 250.0
    EndRadiusSpread = 1000.0
    priority = 0
    texture = no_tw_vortex01
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [143 , 65 , 48]
    startAlpha = 65
    endRGB = [38 , 39 , 40]
    endAlpha = 68
    midRGB = [38 , 39 , 40]
    midAlpha = 68
    UseColorMidTime
    ColorMidTime = 51
    useglobalcolormodulation
}
JOW_NOe1_Tornado02_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    BoxDimsStart = (102.88999938964844, 51.34000015258789, 102.88999938964844)
    BoxDimsMid = (164.11000061035156, 62.810001373291016, 164.11000061035156)
    BoxDimsEnd = (252.3300018310547, 80.33000183105469, 252.3300018310547)
    Pos = (-0.9200000166893005, 25.719999313354492, 3.049999952316284)
    MidPosition = (-3.490000009536743, 24.829999923706055, 7.820000171661377)
    EndPosition = (-0.03999999910593033, 77.37999725341797, 40.77000045776367)
    UseMidPoint
    suspenddistance = 0.0
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 50.0
    lifetime = 1.500
    startradius = 20.0
    MidRadius = 40.0
    endradius = 70.0
    priority = 0
    texture = no_tw_vortex01
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [132 , 61 , 50]
    startAlpha = 0
    endRGB = [43 , 43 , 45]
    endAlpha = 0
    midRGB = [75 , 52 , 40]
    midAlpha = 44
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
JOW_NOe2_Laser01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    BoxDimsStart = (5.0, 5.0, 5.0)
    BoxDimsMid = (12.0, 12.0, 12.0)
    BoxDimsEnd = (5.0, 5.0, 5.0)
    Pos = (-0.05215450003743172, 260.0820007324219, 3112.110107421875)
    MidPosition = (39.94779968261719, 228.08200073242188, 3112.110107421875)
    EndPosition = (-27.419300079345703, 220.68800354003906, -3698.590087890625)
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 3200.0
    lifetime = 1.0
    emitduration = 1.500
    startradius = 24.0
    endradius = 24.0
    priority = 0
    texture = se_hj_SpotLightGlow
    BlendMode = Add
    alphacutoff = 1
    startRGB = [92 , 152 , 255]
    startAlpha = 20
    endRGB = [92 , 152 , 255]
    endAlpha = 20
    useglobalcolormodulation
}
