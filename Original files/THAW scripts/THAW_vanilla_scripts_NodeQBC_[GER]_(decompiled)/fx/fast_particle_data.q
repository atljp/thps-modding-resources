
script load_permanent_fast_particle_textures 
    LoadParticleTexture 'particles\apm_flame_rot01' perm
    LoadParticleTexture 'particles\apm_spray_01' perm
    LoadParticleTexture 'particles\apm_smokepuff_rot_01' perm
    LoadParticleTexture 'particles\apm_smokepuff_rot_01b' perm
    LoadParticleTexture 'particles\apm_debis_01' perm
    LoadParticleTexture 'particles\apm_fallingwater_01' perm
    LoadParticleTexture 'particles\apm_water_splash01' perm
    LoadParticleTexture 'particles\apm_debis_02' perm
    LoadParticleTexture 'particles\apm_spark_03' perm
    LoadParticleTexture 'particles\apm_splinters_01' perm
    LoadParticleTexture 'particles\apm_flys' perm
    LoadParticleTexture 'particles\apm_lightningfm01' perm
    LoadParticleTexture 'particles\apm_spark_01' perm
    LoadParticleTexture 'particles\dt_nj_waterdrop05' perm
    LoadParticleTexture 'particles\apm_ring_02' perm
    LoadParticleTexture 'particles\apm_debis_quad01' perm
    LoadParticleTexture 'particles\apm_flys01' perm
    LoadParticleTexture 'particles\apm_leaf01' perm
    LoadParticleTexture 'particles\apm_beez02a' perm
    LoadParticleTexture 'particles\apm_beez02b' perm
    LoadParticleTexture 'particles\apm_beez02c' perm
    LoadParticleTexture 'particles\apm_beez02d' perm
    LoadParticleTexture 'particles\apm_feather01' perm
endscript
APM_EL_LE_SrapnelHIT01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (0.0, 0.0, 0.0) (111.0, 111.0, 111.0) (222.0, 222.0, 222.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (0.0, 0.0, 0.0) (0.0, -100.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 2222.0
    lifetime = 0.3000
    emitduration = 0.01000
    Radii = (5.0, 5.0, 5.0)
    RadiusSpreads = (2.0, 2.0, 2.0)
    rotvel = (0.0, 7.300000190734863)
    rotveltimescale = 0.2000
    priority = 0
    texture = apm_flame_rot01
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ -8235392 522133297 960051456 ]
    UseColorMidTime
    ColorMidTime = 31
    useglobalcolormodulation
}
APM_FW_LE_Shrapnel01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (33.0, 10.0, 33.0) (100.0, 100.0, 100.5999984741211) (128.0, 128.0, 128.6999969482422) ]
    boxPositions = [ (0.0, 0.0, 0.0) (0.0, 100.0, 0.0) (0.0, 50.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 200.0
    lifetime = 0.3000
    emitduration = 0.1000
    Radii = (10.0, 5.0, 5.0)
    RadiusSpreads = (5.0, 5.0, 5.0)
    rotvel = (0.0, 4.199999809265137)
    rotveltimescale = 0.2000
    priority = 0
    texture = apm_flame_rot01
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ 960051584 1414812800 1212696576 ]
    UseColorMidTime
    useglobalcolormodulation
}
APM_HO_ShrapnelSMK01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (33.0, 10.0, 33.0) (22.0, 50.0, 22.0) (50.0, 50.0, 50.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (0.0, 50.0, 0.0) (0.0, 75.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 65.70
    lifetime = 0.3000
    emitduration = 0.1000
    Radii = (26.0, 22.0, 11.0)
    RadiusSpreads = (5.0, 5.0, 5.0)
    rotvel = (0.0, 0.8999999761581421)
    rotveltimescale = 0.2000
    priority = 0
    texture = apm_spray_01
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ 960051584 623191424 1044266496 ]
    UseColorMidTime
    useglobalcolormodulation
}
APM_HO_ShrapnelSMK02_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (100.0, 55.0, 150.0) (200.0, 200.0, 333.0) (400.0, 400.0, 800.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (200.0, 150.0, 0.0) (400.0, 300.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 222.0
    lifetime = 5.0
    emitduration = 2.0
    Radii = (55.0, 75.0, 100.0)
    RadiusSpreads = (5.0, 59.5, 55.0)
    rotvel = (0.0, 0.5)
    rotveltimescale = 0.0
    priority = 0
    texture = apm_smokepuff_rot_01
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ 2003457331 -1456040 -662272 ]
    UseColorMidTime
    useglobalcolormodulation
}
APM_HO_ShrapnelSMK03_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (100.0, 10.0, 200.0) (200.0, 100.0, 400.0) (400.0, 200.0, 800.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (100.0, 150.0, 0.0) (0.0, 200.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 333.0
    lifetime = 5.0
    emitduration = 0.5000
    Radii = (29.899999618530273, 100.0, 100.0)
    RadiusSpreads = (5.0, 59.5, 15.699999809265137)
    rotvel = (0.0, 0.20000000298023224)
    rotveltimescale = 0.2000
    priority = 0
    texture = apm_spray_01
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ 959919360 1043935813 1044001792 ]
    UseColorMidTime
    useglobalcolormodulation
}
APM_HO_ShrapnelSMK04_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (100.0, 55.0, 150.0) (200.0, 200.0, 333.0) (400.0, 400.0, 800.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (100.0, 150.0, 0.0) (0.0, 300.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 22.0
    lifetime = 5.0
    emitduration = 5.0
    Radii = (55.0, 75.0, 100.0)
    RadiusSpreads = (5.0, 59.5, 55.0)
    rotvel = (0.0, 0.5)
    rotveltimescale = 0.0
    priority = 0
    texture = apm_smokepuff_rot_01b
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ 2003457349 1886086224 -1785756416 ]
    UseColorMidTime
    useglobalcolormodulation
}
APM_HO_Srapnel01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (33.0, 10.0, 33.0) (100.0, 100.0, 100.5999984741211) (128.0, 128.0, 128.6999969482422) ]
    boxPositions = [ (0.0, 0.0, 0.0) (0.0, 100.0, 0.0) (0.0, 50.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 200.0
    lifetime = 0.3000
    emitduration = 0.1000
    Radii = (10.0, 5.0, 5.0)
    RadiusSpreads = (5.0, 5.0, 5.0)
    rotvel = (0.0, 4.199999809265137)
    rotveltimescale = 0.2000
    priority = 0
    texture = apm_flame_rot01
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ 960051584 1414812800 1212696576 ]
    UseColorMidTime
    useglobalcolormodulation
}
APM_HO_Srapnel03_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (33.0, 10.0, 33.0) (100.0, 100.0, 100.5999984741211) (200.0, 128.0, 200.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (0.0, 50.0, 0.0) (0.0, -50.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 1000.0
    lifetime = 0.3000
    emitduration = 0.01000
    Radii = (5.0, 5.0, 5.0)
    RadiusSpreads = (5.0, 2.0, 2.0)
    rotvel = (0.0, 4.199999809265137)
    rotveltimescale = 0.2000
    priority = 0
    texture = apm_flame_rot01
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ 1733442176 1733970560 1734433408 ]
    UseColorMidTime
    useglobalcolormodulation
}
APM_SM_DebrisCrack01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (33.0, 10.0, 33.0) (111.0, 55.0, 111.0) (155.0, 128.0, 155.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (0.0, -50.0, 0.0) (0.0, -200.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 400.0
    lod_dist2 = 401.0
    emitrate = 555.0
    lifetime = 0.7000
    emitduration = 0.1000
    Radii = (22.0, 10.0, 10.0)
    RadiusSpreads = (5.0, 5.0, 5.0)
    rotvel = (0.0, 4.199999809265137)
    rotveltimescale = 0.2000
    priority = 0
    texture = apm_debis_01
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ 960051584 1414812800 1212696576 ]
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
APM_SM_DebrisCrack02_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (33.0, 10.0, 33.0) (222.0, 55.0, 222.0) (155.0, 128.0, 155.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (0.0, 50.0, 0.0) (0.0, 111.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 400.0
    lod_dist2 = 401.0
    emitrate = 333.0
    lifetime = 2.0
    emitduration = 0.1000
    Radii = (22.0, 55.0, 55.0)
    RadiusSpreads = (5.0, 5.0, 5.0)
    rotvel = (0.0, 0.5)
    rotveltimescale = 0.2000
    priority = 0
    texture = apm_spray_01
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ 1785358848 1414812744 1212696576 ]
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
APM_SM_DebrisCrack03_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (33.0, 10.0, 33.0) (111.0, 55.0, 111.0) (155.0, 128.0, 155.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (0.0, -50.0, 0.0) (0.0, -200.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 400.0
    lod_dist2 = 401.0
    emitrate = 555.0
    lifetime = 1.0
    emitduration = 0.1000
    Radii = (22.0, 33.0, 44.0)
    RadiusSpreads = (5.0, 5.0, 5.0)
    rotvel = (0.0, 4.199999809265137)
    rotveltimescale = 0.2000
    priority = 0
    texture = apm_spray_01
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ 960051584 1414812726 1212696576 ]
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
APM_SM_Sand01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (111.0, 10.0, 111.0) (222.0, 100.0, 222.0) (333.0, 128.0, 333.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (0.0, 55.0, 0.0) (0.0, 0.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 400.0
    lod_dist2 = 401.0
    emitrate = 555.0
    lifetime = 3.0
    emitduration = 0.3000
    Radii = (55.0, 66.0, 77.0)
    RadiusSpreads = (5.0, 5.0, 5.0)
    rotvel = (0.0, 2.0)
    rotveltimescale = 0.2000
    priority = 0
    texture = apm_spray_01
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ 1599554944 1818250813 -2139724544 ]
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
APM_SM_Sand02_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (111.0, 10.0, 111.0) (222.0, 100.0, 222.0) (333.0, 128.0, 333.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (55.0, 55.0, 0.0) (111.0, 0.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 400.0
    lod_dist2 = 401.0
    emitrate = 555.0
    lifetime = 1.0
    emitduration = 0.2000
    Radii = (55.0, 66.0, 77.0)
    RadiusSpreads = (5.0, 5.0, 5.0)
    rotvel = (0.0, 2.0)
    rotveltimescale = 0.2000
    priority = 0
    texture = apm_spray_01
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ 1599554816 1818250813 -2139724544 ]
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
APM_SM_Waterhit02_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (11.0, 10.0, 11.0) (77.0, 55.0, 77.0) (111.0, 0.0, 111.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (0.0, 0.0, 0.0) (0.0, 0.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 400.0
    lod_dist2 = 401.0
    emitrate = 1111.0
    lifetime = 0.4000
    emitduration = 0.1000
    Radii = (11.0, 11.0, 11.0)
    RadiusSpreads = (5.0, 5.0, 5.0)
    rotvel = (0.0, 4.0)
    rotveltimescale = 0.2000
    priority = 0
    texture = apm_fallingwater_01
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ -143 -2038004111 1212696576 ]
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
APM_SM_Waterhit_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (11.0, 10.0, 11.0) (111.0, 55.0, 111.0) (155.0, 128.0, 155.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (0.0, 55.0, 0.0) (0.0, 0.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 400.0
    lod_dist2 = 401.0
    emitrate = 1111.0
    lifetime = 0.5000
    emitduration = 0.1000
    Radii = (11.0, 5.0, 5.0)
    RadiusSpreads = (5.0, 5.0, 5.0)
    rotvel = (0.0, 4.0)
    rotveltimescale = 0.2000
    priority = 0
    texture = apm_water_splash01
    BlendMode = brighten
    alphacutoff = 1
    BoxRGBAs = [ -143 -2038004111 1212696576 ]
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
APM_SM_roofFall01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (33.0, 10.0, 33.0) (333.0, 55.0, 333.0) (333.0, 128.0, 555.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (0.0, 222.0, 0.0) (0.0, 333.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 400.0
    lod_dist2 = 401.0
    emitrate = 12.0
    lifetime = 11.0
    timeseed = 11.0
    emitduration = 0.1000
    Radii = (111.0, 111.0, 55.0)
    RadiusSpreads = (5.0, 5.0, 5.0)
    rotvel = (0.0, 0.5)
    rotveltimescale = 0.2000
    priority = 0
    texture = apm_smokepuff_rot_01
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ 1785358848 -2038004111 -1768516096 ]
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
APM_SM_stairsmoke01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (222.0, 10.0, 555.0) (444.0, 55.0, 555.0) (333.0, 128.0, 555.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (0.0, 555.0, 0.0) (0.0, 0.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 400.0
    lod_dist2 = 401.0
    emitrate = 22.0
    lifetime = 30.0
    timeseed = 11.0
    Radii = (111.0, 111.0, 111.0)
    RadiusSpreads = (5.0, 22.0, 22.0)
    rotvel = (0.0, 0.5)
    rotveltimescale = 0.2000
    priority = 0
    texture = apm_spray_01
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ 858860928 2138072347 1212696576 ]
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
APM_SR_chipper01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (1.0, 1.0, 1.0) (55.0, 44.0, 55.0) (77.0, 20.0, 77.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (61.59000015258789, 24.549999237060547, -63.06999969482422) (128.89999389648438, -75.37000274658203, -123.05999755859375) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 555.0
    lifetime = 0.3000
    emitduration = 0.3000
    Radii = (11.0, 11.0, 11.0)
    RadiusSpreads = (5.0, 2.0, 2.0)
    rotvel = (0.0, 4.199999809265137)
    rotveltimescale = 0.2000
    priority = 0
    texture = apm_debis_02
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ 1733967488 1969231232 1228746368 ]
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
APM_SV2_drip1_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (1.0, 10.0, 1.0) (1.0, 100.0, 1.0) (0.0, 111.0, 0.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (0.0, -500.0, 11.0) (0.0, -1100.0, 11.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 1.400
    lifetime = 1.0
    emitduration = 0.5000
    Radii = (15.0, 15.0, 15.0)
    RadiusSpreads = (5.0, 5.0, 5.0)
    rotvel = (0.0, 4.199999809265137)
    rotveltimescale = 0.2000
    priority = 0
    texture = apm_spark_03
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ 1084836992 1270241357 878917972 ]
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
APM_SV2_drip2_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (1.0, 10.0, 1.0) (66.0, 25.0, 66.0) (111.0, 0.0, 111.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (0.0, 25.0, 0.0) (0.0, 0.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 333.0
    lifetime = 0.5000
    emitduration = 0.1000
    Radii = (11.0, 5.0, 5.0)
    RadiusSpreads = (5.0, 2.0, 2.0)
    rotvel = (0.0, 4.199999809265137)
    rotveltimescale = 0.2000
    priority = 0
    texture = apm_spark_03
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ 624503936 624109645 792539409 ]
    UseColorMidTime
    ColorMidTime = 50
}
APM_SplinterHit01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    enablerotate
    BoxDims = [ (11.0, 10.0, 11.0) (111.0, 66.0, 111.0) (150.0, 22.0, 200.0) ]
    boxPositions = [ (0.0, 0.0, -15.0) (0.0, 44.0, 22.0) (0.0, -9.600000381469727, 66.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 1111.0
    lifetime = 0.4000
    emitduration = 0.01000
    Radii = (10.0, 10.0, 10.0)
    RadiusSpreads = (5.0, 5.0, 5.0)
    rotvel = (0.0, 4.199999809265137)
    rotveltimescale = 0.2000
    priority = 0
    texture = apm_splinters_01
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ 959325312 2003459968 1212696576 ]
    UseColorMidTime
    useglobalcolormodulation
}
APM_SrapnelHIT01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (33.0, 10.0, 33.0) (100.0, 100.0, 100.5999984741211) (150.0, 128.0, 150.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (0.0, 50.0, 0.0) (0.0, 0.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 1111.0
    lifetime = 0.3000
    emitduration = 0.1000
    Radii = (3.0, 3.0, 3.0)
    RadiusSpreads = (2.0, 2.0, 2.0)
    rotvel = (0.0, 7.300000190734863)
    rotveltimescale = 0.2000
    priority = 0
    texture = apm_flame_rot01
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ 959455104 1548563072 959454976 ]
    UseColorMidTime
    useglobalcolormodulation
}
APM_bearNshedda01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    angles = (90.0, 0.0, 0.0)
    LocalSpace
    BoxDims = [ (11.0, 11.0, 11.0) (66.0, 44.0, 66.0) (128.0, 66.0, 128.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (-58.540000915527344, 13.4399995803833, 14.739999771118164) (-109.62000274658203, -23.530000686645508, 31.530000686645508) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 1111.0
    lifetime = 0.5000
    emitduration = 0.1000
    Radii = (5.0, 5.0, 5.0)
    RadiusSpreads = (2.0, 5.0, 5.0)
    rotvel = (0.0, 4.199999809265137)
    rotveltimescale = 0.2000
    priority = 0
    texture = apm_debis_02
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ 1145324672 -2139392384 1212696576 ]
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
APM_bearNshedda02_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    angles = (140.0, 0.0, 0.0)
    LocalSpace
    BoxDims = [ (5.0, 5.0, 5.0) (66.0, 44.0, 66.0) (128.0, 128.0, 128.6999969482422) ]
    boxPositions = [ (0.0, 0.0, 0.0) (-58.540000915527344, 13.4399995803833, 14.739999771118164) (-109.62000274658203, -23.530000686645508, 31.530000686645508) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 1111.0
    lifetime = 0.5000
    emitduration = 0.1000
    Radii = (5.0, 5.0, 5.0)
    RadiusSpreads = (10.0, 7.0, 5.0)
    rotvel = (0.0, 4.199999809265137)
    rotveltimescale = 0.2000
    priority = 0
    texture = apm_smokepuff_rot_01b
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ 1145324672 -185933440 -2105376256 ]
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
APM_bh_Shrapnel01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (300.0, 1000.0, 300.0) (777.0, 555.0, 777.0) (1000.0, 128.0, 1000.0) ]
    boxPositions = [ (0.0, 111.0, 1.0) (-111.0, 0.0, 111.0) (-222.0, -200.0, 222.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 666.0
    lifetime = 0.5000
    EmitDelay = 0.3000
    emitduration = 3.0
    Radii = (5.0, 11.0, 11.0)
    RadiusSpreads = (5.0, 5.0, 22.0)
    rotvel = (0.0, 4.199999809265137)
    rotveltimescale = 0.2000
    priority = 0
    texture = apm_flame_rot01
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ 471604352 623191364 1212696576 ]
    UseColorMidTime
    useglobalcolormodulation
    updatescript = fast_change_color
    params = {
        endStartRGBA = [ 0 0 0 0 ]
        endMidRGBA = [ 0 0 0 0 ]
        endEndRGBA = [ 0 0 0 0 ]
        delayStart = 1
        changetime = 2
        stepTime = 0.1000
    }
}
APM_boardNshedda01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    angles = (90.0, 0.0, 0.0)
    LocalSpace
    BoxDims = [ (5.0, 5.0, 5.0) (66.0, 44.0, 66.0) (128.0, 128.0, 128.6999969482422) ]
    boxPositions = [ (0.0, 0.0, 0.0) (-58.540000915527344, 13.4399995803833, 14.739999771118164) (-109.62000274658203, -23.530000686645508, 31.530000686645508) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 1111.0
    lifetime = 0.5000
    emitduration = 0.3000
    Radii = (3.0, 5.0, 3.0)
    RadiusSpreads = (2.0, 5.0, 5.0)
    rotvel = (0.0, 4.199999809265137)
    rotveltimescale = 0.2000
    priority = 0
    texture = apm_splinters_01
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ 1144923264 -1027041664 1145119872 ]
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
APM_boardNshedda02_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    angles = (90.0, 0.0, 0.0)
    LocalSpace
    BoxDims = [ (5.0, 5.0, 5.0) (66.0, 44.0, 66.0) (128.0, 128.0, 128.6999969482422) ]
    boxPositions = [ (0.0, 0.0, 0.0) (-58.540000915527344, 13.4399995803833, 14.739999771118164) (-109.62000274658203, -23.530000686645508, 31.530000686645508) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 1111.0
    lifetime = 0.5000
    emitduration = 0.1000
    Radii = (5.0, 5.0, 5.0)
    RadiusSpreads = (2.0, 5.0, 5.0)
    rotvel = (0.0, 4.199999809265137)
    rotveltimescale = 0.2000
    priority = 0
    texture = apm_debis_02
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ 1144464512 2002796416 1144464512 ]
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
APM_breakingGLASS01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    enablerotate
    BoxDims = [ (33.0, 10.0, 33.0) (100.0, 100.0, 100.5999984741211) (128.0, 128.0, 128.6999969482422) ]
    boxPositions = [ (0.0, 0.0, 0.0) (0.0, 50.0, 0.0) (0.0, 0.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 555.0
    lifetime = 0.3000
    emitduration = 0.03000
    Radii = (22.0, 22.0, 22.0)
    RadiusSpreads = (15.0, 11.0, 11.0)
    rotvel = (0.0, 4.199999809265137)
    rotveltimescale = 0.2000
    priority = 0
    texture = apm_flys
    BlendMode = brighten
    alphacutoff = 1
    BoxRGBAs = [ -656877440 -656877440 -656877568 ]
    UseColorMidTime
    useglobalcolormodulation
}
APM_clouds01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (2222.0, 555.0, 1111.0) (22222.0, 5555.0, 1111.0) (22222.0, 1111.0, 1111.0) ]
    boxPositions = [ (0.0, 11111.0, 55555.0) (11111.0, 11111.0, 44444.0) (11111.0, 11111.0, 33333.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 1.0
    lifetime = 33.0
    timeseed = 33.0
    Radii = (1111.0, 5555.0, 1111.0)
    RadiusSpreads = (222.0, 1111.0, 222.0)
    rotvel = (0.0, 0.10000000149011612)
    rotveltimescale = 0.0
    priority = 0
    texture = apm_spray_01
    BlendMode = Add
    alphacutoff = 1
    BoxRGBAs = [ -369623296 -529906 -588451840 ]
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
    update_brightness_from = skater
}
APM_fastlightning02_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    angles = (140.0, 0.0, 0.0)
    LocalSpace
    enablerotate
    BoxDims = [ (5.0, 5.0, 5.0) (22.0, 22.0, 22.0) (0.0, 0.0, 0.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (1.0, 0.0, 0.0) (0.0, 0.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 11.0
    lifetime = 0.1000
    Radii = (5.0, 44.0, 5.0)
    RadiusSpreads = (10.0, 122.0, 5.0)
    rotvel = (1.0, 12.0)
    rotveltimescale = 1.0
    priority = 0
    texture = apm_lightningfm01
    BlendMode = Add
    alphacutoff = 1
    BoxRGBAs = [ 1145372446 -1852702848 1145372438 ]
    UseColorMidTime
    ColorMidTime = 50
}
APM_fastlightning02b_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    angles = (140.0, 0.0, 0.0)
    boneoffset = (0.0, 37.099998474121094, 0.0)
    LocalSpace
    enablerotate
    BoxDims = [ (5.0, 5.0, 5.0) (22.0, 22.0, 22.0) (0.0, 0.0, 0.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (1.0, 0.0, 0.0) (0.0, 0.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 66.0
    lifetime = 0.1000
    Radii = (5.0, 44.0, 5.0)
    RadiusSpreads = (10.0, 88.0, 5.0)
    rotvel = (1.0, 22.0)
    rotveltimescale = 1.0
    priority = 0
    texture = apm_spark_01
    BlendMode = Add
    alphacutoff = 1
    BoxRGBAs = [ 1145372446 -1852702848 1145372438 ]
    UseColorMidTime
    ColorMidTime = 50
}
APM_filthgyser01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (0.0, 200.0, 0.0) (22.0, 100.0, 22.0) (111.0, 66.0, 111.0) ]
    boxPositions = [ (0.0, -200.0, 0.0) (0.0, 222.0, 0.0) (0.0, 50.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 333.0
    lifetime = 2.0
    Radii = (22.0, 11.0, 5.0)
    RadiusSpreads = (5.0, 5.0, 5.0)
    rotvel = (0.0, 4.199999809265137)
    rotveltimescale = 0.2000
    priority = 0
    texture = dt_nj_waterdrop05
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ 1330264448 1919303040 -1735896832 ]
    UseColorMidTime
    useglobalcolormodulation
}
APM_impactSMK01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    enablerotate
    BoxDims = [ (1.0, 33.0, 1.0) (33.0, 44.0, 33.0) (66.0, 66.0, 66.0) ]
    boxPositions = [ (0.0, 33.0, 0.0) (0.0, 33.0, 10.0) (0.0, 44.0, -10.0) ]
    UseMidPoint
    MidPointPCT = 50.0
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 555.0
    lifetime = 0.2000
    emitduration = 0.1000
    Radii = (12.0, 22.0, 33.0)
    RadiusSpreads = (6.0, 11.0, 11.0)
    rotvel = (0.0, 4.199999809265137)
    rotveltimescale = 0.2000
    priority = 0
    texture = apm_smokepuff_rot_01
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ -894129837 -1482184891 -656877568 ]
    useglobalcolormodulation
}
APM_lightningBOOST01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    angles = (140.0, 0.0, 0.0)
    LocalSpace
    enablerotate
    BoxDims = [ (5.0, 5.0, 5.0) (22.0, 22.0, 22.0) (0.0, 0.0, 0.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (1.0, 0.0, 0.0) (0.0, 0.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 11.0
    lifetime = 0.1000
    Radii = (5.0, 22.0, 5.0)
    RadiusSpreads = (10.0, 66.0, 5.0)
    rotvel = (1.0, 12.0)
    rotveltimescale = 1.0
    priority = 0
    texture = apm_lightningfm01
    BlendMode = Add
    alphacutoff = 1
    BoxRGBAs = [ 1145372446 -1852702848 1145372438 ]
    UseColorMidTime
    ColorMidTime = 50
}
APM_lightningBOOST02_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    angles = (140.0, 0.0, 0.0)
    LocalSpace
    enablerotate
    BoxDims = [ (5.0, 5.0, 5.0) (11.0, 11.0, 11.0) (0.0, 0.0, 0.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (1.0, 0.0, 0.0) (0.0, 0.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 66.0
    lifetime = 0.1000
    Radii = (5.0, 44.0, 5.0)
    RadiusSpreads = (10.0, 88.0, 5.0)
    rotvel = (1.0, 22.0)
    rotveltimescale = 1.0
    priority = 0
    texture = apm_spark_01
    BlendMode = Add
    alphacutoff = 1
    BoxRGBAs = [ 1145372446 -1852702848 1145372438 ]
    UseColorMidTime
    ColorMidTime = 50
}
APM_searchlight01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (0.0, 66.0, 0.0) (222.0, 44.0, 222.0) (0.0, 66.0, 0.0) ]
    boxPositions = [ (0.0, 128.0, 0.0) (0.0, 0.0, 0.0) (0.0, 128.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 66.0
    lifetime = 3.0
    Radii = (88.0, 33.0, 33.0)
    RadiusSpreads = (5.0, 5.0, 5.0)
    rotvel = (0.0, 4.199999809265137)
    rotveltimescale = 0.2000
    priority = 0
    texture = apm_spray_01
    BlendMode = brighten
    alphacutoff = 1
    BoxRGBAs = [ -771752192 -150995130 0 ]
    UseColorMidTime
}
APM_searchlight02_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (0.0, 0.0, 0.0) (11.0, 44.0, 11.0) (0.0, 66.0, 0.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (0.0, 0.0, 0.0) (0.0, 1111.0, 111.0) ]
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 11.0
    lifetime = 10.0
    Radii = (33.0, 33.0, 33.0)
    RadiusSpreads = (5.0, 5.0, 5.0)
    rotvel = (0.0, 4.199999809265137)
    rotveltimescale = 0.2000
    priority = 0
    texture = apm_spray_01
    BlendMode = brighten
    alphacutoff = 1
    BoxRGBAs = [ -771752064 -150995186 0 ]
    UseColorMidTime
}
JOW_VehExhaust01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    enablerotate
    BoxDims = [ (3.0, 3.0, 3.0) (20.0, 20.0, 20.0) (6.0, 6.0, 6.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (0.07999999821186066, 0.10000000149011612, -25.639999389648438) (0.029999999329447746, 0.10000000149011612, -9.649999618530273) ]
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 10.0
    lifetime = 0.3000
    Radii = (3.0, 1.0, 8.0)
    priority = 0
    texture = apm_spray_01
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ 623191408 16711744 774778404 ]
    useglobalcolormodulation
}
apm_ACID_DROP01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    enablerotate
    BoxDims = [ (10.0, 0.0, 10.0) (10.0, 10.0, 10.0) (10.0, 10.0, 10.0) ]
    boxPositions = [ (0.0, 30.0, 0.0) (0.0, 30.0, -1.0) (0.0, 30.0, -100.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 12.0
    lifetime = 0.1000
    emitduration = 0.5000
    Radii = (20.0, 150.0, 0.0)
    priority = 0
    texture = apm_ring_02
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ -2139062144 -1027423653 -1111638656 ]
    UseColorMidTime
    updatescript = fast_change_color
    params = {
        endStartRGBA = [ 128 128 128 0 ]
        endMidRGBA = [ 128 128 128 0 ]
        endEndRGBA = [ 128 128 128 0 ]
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
    BoxDims = [ (10.0, 0.0, 10.0) (10.0, 10.0, 10.0) (10.0, 10.0, 10.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (0.0, 0.0, -1.0) (0.0, 30.0, -100.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 12.0
    lifetime = 0.5000
    emitduration = 3.0
    Radii = (20.0, 50.0, 30.0)
    priority = 0
    texture = apm_spray_01
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ 858663296 1296318080 1717195392 ]
    UseColorMidTime
    useglobalcolormodulation
    update_brightness_from = skater
    updatescript = fast_change_color
    params = {
        endStartRGBA = [ 80 75 70 0 ]
        endMidRGBA = [ 80 75 70 0 ]
        endEndRGBA = [ 80 75 70 0 ]
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
    BoxDims = [ (10.0, 20.0, 10.0) (60.0, 10.0, 60.0) (75.0, 10.0, 75.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (0.0, 30.0, -1.0) (0.0, 0.0, -100.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 15.0
    lifetime = 0.3000
    emitduration = 1.0
    Radii = (20.0, 20.0, 20.0)
    RadiusSpreads = (10.0, 10.0, 10.0)
    priority = 0
    texture = apm_debis_quad01
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ 1296911744 1717986944 -2139062144 ]
    UseColorMidTime
    useglobalcolormodulation
    update_brightness_from = skater
    updatescript = fast_change_color
    params = {
        endStartRGBA = [ 128 128 128 0 ]
        endMidRGBA = [ 128 128 128 0 ]
        endEndRGBA = [ 128 128 128 0 ]
        delayStart = 0
        changetime = 1
        stepTime = 0.1000
    }
}
apm_BH_LE_Bigsmoke1_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (333.0, 20.0, 333.0) (888.0, 300.0, 888.0) (444.0, 600.0, 444.0) ]
    boxPositions = [ (0.0, -200.0, 222.0) (0.0, -100.0, 222.0) (0.0, 0.0, 222.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 22.0
    lifetime = 3.0
    emitduration = 4.0
    Radii = (222.0, 333.0, 333.0)
    RadiusSpreads = (11.0, 22.0, 55.0)
    rotvel = (0.0, 0.20000000298023224)
    rotveltimescale = 0.4000
    priority = 0
    texture = apm_smokepuff_rot_01
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ -2038728960 -657602784 -657602688 ]
    UseColorMidTime
    useglobalcolormodulation
}
apm_BH_LE_Bigsmoke2_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (555.0, 20.0, 555.0) (777.0, 300.0, 777.0) (4444.0, 600.0, 4444.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (0.0, 2000.0, 0.0) (0.0, 4000.0, 0.0) ]
    UseMidPoint
    MidPointPCT = 50.0
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 55.0
    lifetime = 22.0
    timeseed = 10.0
    Radii = (55.0, 555.0, 555.0)
    RadiusSpreads = (25.0, 55.0, 222.0)
    rotvel = (0.0, 0.20000000298023224)
    rotveltimescale = 0.4000
    priority = 0
    texture = apm_smokepuff_rot_01
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ 1330136704 1767856712 1919444224 ]
    useglobalcolormodulation
}
apm_BH_LE_Bigsmoke_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (333.0, 20.0, 333.0) (777.0, 300.0, 777.0) (1000.0, 600.0, 1000.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (0.0, 100.0, 111.0) (0.0, 200.0, 222.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 150.0
    lifetime = 5.0
    emitduration = 4.0
    Radii = (55.0, 222.0, 222.0)
    RadiusSpreads = (25.0, 55.0, 55.0)
    rotvel = (0.0, 0.20000000298023224)
    rotveltimescale = 0.4000
    priority = 0
    texture = apm_smokepuff_rot_01
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ -2038728960 -1786281856 -1853652736 ]
    UseColorMidTime
    useglobalcolormodulation
    updatescript = fast_change_color
    params = {
        endStartRGBA = [ 133 128 128 0 ]
        endMidRGBA = [ 133 128 128 128 ]
        endEndRGBA = [ 133 128 128 0 ]
        delayStart = 0.0
        changetime = 1
        stepTime = 0.1000
    }
}
apm_BH_fountainSPRAY01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (0.0, 0.0, 0.0) (5.0, 100.0, 5.0) (44.0, 40.0, 44.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (0.0, 100.0, 0.0) (0.0, 0.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 555.0
    lifetime = 1.500
    emitduration = 0.1000
    Radii = (11.0, 5.0, 5.0)
    RadiusSpreads = (11.0, 5.0, 5.0)
    rotvel = (0.0, 1.0)
    rotveltimescale = 0.4000
    priority = 0
    texture = apm_water_splash01
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ -436535936 -436535936 -436535936 ]
    UseColorMidTime
    useglobalcolormodulation
}
apm_BH_sparkHIT01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    boneoffset = (0.0, -16.299999237060547, 0.0)
    LocalSpace
    BoxDims = [ (20.0, 0.0, 20.0) (150.0, 1.0, 150.0) (300.0, 100.0, 300.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (0.0, 5.0, 75.0) (0.0, -53.20000076293945, 150.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 111.0
    lifetime = 0.2000
    emitduration = 0.1000
    Radii = (15.0, 15.0, 15.0)
    RadiusSpreads = (5.0, 5.0, 5.0)
    rotvel = (0.0, 3.5)
    rotveltimescale = 1.0
    priority = 0
    texture = apm_spark_01
    BlendMode = Add
    alphacutoff = 1
    BoxRGBAs = [ -486672000 2011889536 14221056 ]
    UseColorMidTime
    useglobalcolormodulation
}
apm_DT_FLYS_01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    boneoffset = (0.0, 44.5, 0.0)
    LocalSpace
    BoxDims = [ (200.0, 50.0, 200.0) (200.0, 50.0, 200.0) (200.0, 50.0, 200.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (0.0, 5.0, 0.0) (0.0, 0.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 500.0
    lod_dist2 = 501.0
    emitrate = 111.0
    lifetime = 0.7500
    Radii = (18.0, 18.0, 18.0)
    RadiusSpreads = (12.0, 11.0, 11.0)
    rotvel = (0.0, 3.0)
    rotveltimescale = 0.1000
    priority = 0
    texture = apm_flys01
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ 52 589505408 62 ]
    UseColorMidTime
    useglobalcolormodulation
}
apm_DT_FLYS_02_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (100.0, 50.0, 200.0) (100.0, 50.0, 200.0) (100.0, 50.0, 200.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (0.0, 5.0, 0.0) (0.0, 0.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 400.0
    lod_dist2 = 401.0
    emitrate = 111.0
    lifetime = 0.7500
    Radii = (18.0, 18.0, 18.0)
    RadiusSpreads = (12.0, 11.0, 11.0)
    rotvel = (0.0, 3.0)
    rotveltimescale = 0.1000
    priority = 0
    texture = apm_flys01
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ 48 589505408 46 ]
    UseColorMidTime
    useglobalcolormodulation
}
apm_DT_LE_debrisHit01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (5.0, 5.0, 5.0) (150.0, 100.0, 150.0) (300.0, 0.0, 200.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (-50.0, 50.0, 50.0) (-100.0, 0.0, 100.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 100.0
    lifetime = 0.5000
    emitduration = 0.1000
    Radii = (30.799999237060547, 17.700000762939453, 16.799999237060547)
    RadiusSpreads = (5.0, 5.0, 5.0)
    rotvel = (0.0, 3.5)
    rotveltimescale = 1.0
    priority = 0
    texture = apm_debis_quad01
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ -933483136 1784569216 1768515840 ]
    UseColorMidTime
    useglobalcolormodulation
}
apm_DT_LE_FlameHit01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (5.0, 5.0, 5.0) (100.0, 100.0, 100.0) (200.0, 100.0, 200.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (-50.0, 50.0, 50.0) (-100.0, 75.0, 100.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 1000.0
    lifetime = 0.2500
    emitduration = 0.2000
    Radii = (20.200000762939453, 29.600000381469727, 12.399999618530273)
    RadiusSpreads = (5.0, 5.0, 5.0)
    rotvel = (0.0, 3.5)
    rotveltimescale = 1.0
    priority = 0
    texture = apm_smokepuff_rot_01
    BlendMode = Add
    alphacutoff = 1
    BoxRGBAs = [ -42515584 -11783552 0 ]
    UseColorMidTime
    useglobalcolormodulation
}
apm_DT_LE_mushroomtf_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (75.0, 20.0, 75.0) (275.0, 30.0, 275.0) (222.0, 40.0, 222.0) ]
    boxPositions = [ (0.0, 300.0, 0.0) (0.0, 375.0, 0.0) (0.0, 325.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 55.0
    lifetime = 5.0
    EmitDelay = 2.0
    emitduration = 1.750
    Radii = (10.0, 10.0, 20.0)
    RadiusSpreads = (5.0, 22.0, 5.0)
    rotvel = (0.0, 1.0)
    rotveltimescale = 0.4000
    priority = 1
    texture = apm_flame_rot01
    BlendMode = Add
    alphacutoff = 1
    BoxRGBAs = [ -498266112 1813446727 989855744 ]
    UseColorMidTime
}
apm_DT_LE_mushroomt_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (75.0, 20.0, 75.0) (300.0, 100.0, 300.0) (250.0, 40.0, 250.0) ]
    boxPositions = [ (0.0, 300.0, 0.0) (0.0, 400.0, 0.0) (0.0, 300.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 150.0
    lifetime = 5.0
    EmitDelay = 2.0
    emitduration = 2.0
    Radii = (55.0, 55.0, 55.0)
    RadiusSpreads = (25.0, 55.0, 25.0)
    rotvel = (0.0, 0.20000000298023224)
    rotveltimescale = 0.4000
    priority = 0
    texture = apm_smokepuff_rot_01
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ 1733577984 858202496 -1853652736 ]
    UseColorMidTime
}
apm_DT_LE_mushroombf_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (200.0, 0.0, 200.0) (100.0, 40.0, 100.0) (150.0, 40.0, 150.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (0.0, 50.0, 0.0) (0.0, 450.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 66.0
    lifetime = 4.0
    emitduration = 2.0
    Radii = (20.0, 10.0, 10.0)
    RadiusSpreads = (20.0, 22.0, 25.0)
    rotvel = (0.0, 2.0)
    rotveltimescale = 0.4000
    priority = 0
    texture = apm_flame_rot01
    BlendMode = Add
    alphacutoff = 1
    BoxRGBAs = [ -867823104 -1522132608 -1523578368 ]
    UseColorMidTime
}
apm_DT_LE_mushroomb_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (200.0, 0.0, 200.0) (75.0, 40.0, 75.0) (150.0, 40.0, 150.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (0.0, 50.0, 0.0) (0.0, 450.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 100.0
    lifetime = 4.0
    emitduration = 2.0
    Radii = (55.0, 55.0, 55.0)
    RadiusSpreads = (25.0, 20.0, 25.0)
    rotvel = (0.0, 0.20000000298023224)
    rotveltimescale = 0.4000
    priority = 0
    texture = apm_smokepuff_rot_01
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ -8632576 1732588928 1077359360 ]
    UseColorMidTime
}
apm_DT_LE_smokeHit01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (5.0, 5.0, 5.0) (150.0, 100.0, 150.0) (300.0, 100.0, 200.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (-50.0, 50.0, 50.0) (-100.0, 100.0, 100.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 333.0
    lifetime = 0.5000
    emitduration = 0.2000
    Radii = (20.200000762939453, 44.599998474121094, 59.599998474121094)
    RadiusSpreads = (5.0, 5.0, 5.0)
    rotvel = (0.0, 0.6000000238418579)
    rotveltimescale = 1.0
    priority = 0
    texture = apm_smokepuff_rot_01
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ -42515584 2003462272 0 ]
    UseColorMidTime
    useglobalcolormodulation
}
apm_DT_LE_smokeHit01F_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (5.0, 5.0, 5.0) (150.0, 100.0, 150.0) (300.0, 100.0, 200.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (-50.0, 50.0, 50.0) (-100.0, 100.0, 100.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 345.4
    lifetime = 0.5000
    emitduration = 0.2000
    Radii = (11.0, 11.0, 11.0)
    RadiusSpreads = (5.0, 5.0, 5.0)
    rotvel = (0.0, 2.4000000953674316)
    rotveltimescale = 1.0
    priority = 0
    texture = apm_flame_rot01
    BlendMode = Add
    alphacutoff = 1
    BoxRGBAs = [ -42515584 1997471872 0 ]
    UseColorMidTime
    useglobalcolormodulation
}
apm_DT_LE_sparks01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (5.0, 5.0, 5.0) (100.0, 100.0, 100.0) (150.0, 50.0, 150.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (-100.0, 50.0, 100.0) (-150.0, 0.0, 150.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 1000.0
    lifetime = 0.5000
    emitduration = 0.1000
    Radii = (22.0, 5.0, 5.0)
    RadiusSpreads = (5.0, 5.0, 5.0)
    rotvel = (0.0, 3.5)
    rotveltimescale = 1.0
    priority = 0
    texture = apm_spark_01
    BlendMode = Add
    alphacutoff = 1
    BoxRGBAs = [ -42515584 -14614400 0 ]
    UseColorMidTime
    useglobalcolormodulation
}
apm_DT_embers01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (75.0, 20.0, 75.0) (175.0, 40.0, 175.0) (250.0, 40.0, 250.0) ]
    boxPositions = [ (0.0, 10.0, 0.0) (50.0, 200.0, 0.0) (75.0, 600.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 12.0
    lifetime = 10.0
    Radii = (50.0, 100.0, 50.0)
    RadiusSpreads = (25.0, 20.0, 25.0)
    rotvel = (0.0, 0.20000000298023224)
    rotveltimescale = 0.4000
    priority = 0
    texture = apm_spark_03
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ -42515679 -2075842432 437786624 ]
    UseColorMidTime
    useglobalcolormodulation
}
apm_DT_fire01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (50.0, 25.0, 50.0) (125.0, 50.0, 125.0) (200.0, 200.0, 200.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (25.0, 50.0, 25.0) (50.0, 200.0, 20.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 120.0
    lifetime = 3.0
    Radii = (30.0, 15.0, 10.0)
    RadiusSpreads = (10.0, 5.0, 5.0)
    rotvel = (-0.4000000059604645, 0.0)
    rotveltimescale = 0.3000
    priority = 1
    texture = apm_flame_rot01
    BlendMode = Add
    alphacutoff = 1
    BoxRGBAs = [ 1917920768 1730347136 1142297600 ]
    UseColorMidTime
}
apm_DT_smoke01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (75.0, 20.0, 75.0) (175.0, 40.0, 175.0) (250.0, 40.0, 250.0) ]
    boxPositions = [ (0.0, 10.0, 0.0) (50.0, 200.0, 0.0) (75.0, 600.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 12.0
    lifetime = 10.0
    Radii = (50.0, 100.0, 50.0)
    RadiusSpreads = (25.0, 20.0, 25.0)
    rotvel = (0.0, 0.20000000298023224)
    rotveltimescale = 0.4000
    priority = 0
    texture = apm_smokepuff_rot_01
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ -42515679 1481459840 437786624 ]
    UseColorMidTime
    useglobalcolormodulation
}
apm_DT_sparks01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (0.0, 0.0, 0.0) (5.0, 5.0, 5.0) (22.0, 22.0, 22.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (0.0, 0.0, 0.0) (0.0, 0.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 111.0
    lifetime = 0.1000
    emitduration = 0.1000
    Radii = (15.0, 10.0, 5.0)
    RadiusSpreads = (5.0, 5.0, 5.0)
    rotvel = (0.0, 3.5)
    rotveltimescale = 1.0
    priority = 0
    texture = apm_spark_01
    BlendMode = Add
    alphacutoff = 1
    BoxRGBAs = [ -486672000 2011889536 14221056 ]
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
apm_DT_sparks02_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    boneoffset = (0.0, 77.0, 0.0)
    LocalSpace
    BoxDims = [ (0.0, 0.0, 0.0) (22.0, 22.0, 22.0) (55.0, 55.0, 55.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (0.0, 0.0, 0.0) (0.0, -20.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 111.0
    lifetime = 0.3000
    emitduration = 0.01000
    Radii = (15.0, 10.0, 5.0)
    RadiusSpreads = (5.0, 5.0, 5.0)
    rotvel = (0.0, 3.5)
    rotveltimescale = 1.0
    priority = 0
    texture = apm_spark_01
    BlendMode = Add
    alphacutoff = 1
    BoxRGBAs = [ -486672000 2011889536 14221056 ]
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
apm_DT_treehit01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (300.0, 66.0, 300.0) (200.0, 66.0, 200.0) (300.0, 10.0, 300.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (25.0, -250.0, 25.0) (0.0, -500.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 22.0
    lifetime = 4.0
    emitduration = 3.0
    Radii = (7.0, 7.0, 7.0)
    RadiusSpreads = (4.0, 4.0, 4.0)
    rotvel = (0.0, 1.0)
    rotveltimescale = 0.2000
    priority = 0
    texture = apm_leaf01
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ 1179334016 1482438784 1937331584 ]
    UseColorMidTime
    useglobalcolormodulation
}
apm_DirtFootstep01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    angles = (0.0, 0.0, 3.0)
    LocalSpace
    BoxDims = [ (10.0, 10.0, 10.0) (10.0, 10.0, 10.0) (15.0, 15.0, 15.0) ]
    boxPositions = [ (0.0, 1.0, 0.0) (0.0, 5.0, 0.0) (0.0, 20.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 15.0
    lifetime = 0.3000
    emitduration = 0.1000
    Radii = (10.0, 10.0, 30.0)
    RadiusSpreads = (0.0, 2.0, 3.0)
    priority = 0
    texture = apm_spray_01
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ 1296052777 1717061465 1717454592 ]
    UseColorMidTime
    useglobalcolormodulation
    update_brightness_from = skater
}
apm_EL_LE_debris01t_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (33.0, 22.0, 33.0) (333.0, 111.0, 333.0) (555.0, 111.0, 555.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (0.0, 55.0, 0.0) (0.0, -100.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 555.0
    lifetime = 0.5000
    emitduration = 0.1000
    Radii = (55.0, 55.0, 55.0)
    RadiusSpreads = (25.0, 20.0, 25.0)
    rotvel = (0.0, 1.0)
    rotveltimescale = 0.4000
    priority = 0
    texture = apm_flys01
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ 1414812800 1448498816 303174144 ]
    UseColorMidTime
    ColorMidTime = 50
}
apm_EL_LE_fireball01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    boneoffset = (0.0, 100.0, 0.0)
    LocalSpace
    BoxDims = [ (200.0, 0.0, 200.0) (111.0, 111.0, 111.0) (222.0, 333.0, 222.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (0.0, -150.0, 0.0) (1000.0, -120.0, 222.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 2222.0
    lifetime = 0.7000
    emitduration = 0.5000
    Radii = (22.0, 22.0, 25.0)
    RadiusSpreads = (25.0, 20.0, 25.0)
    rotvel = (0.0, 4.0)
    rotveltimescale = 0.4000
    priority = 0
    texture = apm_smokepuff_rot_01
    BlendMode = Add
    alphacutoff = 1
    BoxRGBAs = [ -5880064 -8435840 -12105984 ]
    UseColorMidTime
    ColorMidTime = 50
}
apm_EL_LE_fireball02_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    boneoffset = (0.0, 100.0, 0.0)
    LocalSpace
    BoxDims = [ (200.0, 222.0, 200.0) (111.0, 111.0, 111.0) (111.0, 111.0, 111.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (222.0, 0.0, 111.0) (777.0, 0.0, 333.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 555.0
    lifetime = 1.0
    emitduration = 0.5000
    Radii = (22.0, 55.0, 66.0)
    RadiusSpreads = (25.0, 20.0, 25.0)
    rotvel = (0.0, 4.0)
    rotveltimescale = 0.4000
    priority = 0
    texture = apm_smokepuff_rot_01
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ -12105984 1110847872 1110847744 ]
    UseColorMidTime
    ColorMidTime = 50
}
apm_EL_LE_fireballT01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (111.0, 22.0, 111.0) (333.0, 111.0, 333.0) (333.0, 222.0, 444.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (0.0, 155.0, 0.0) (0.0, 333.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 1111.0
    lifetime = 1.0
    emitduration = 0.2500
    Radii = (22.0, 44.0, 111.0)
    RadiusSpreads = (25.0, 20.0, 25.0)
    rotvel = (0.0, 2.0)
    rotveltimescale = 0.4000
    priority = 0
    texture = apm_smokepuff_rot_01
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ -12105984 1076963968 -2139062272 ]
    UseColorMidTime
    ColorMidTime = 49
}
apm_EL_LE_fireballT02_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (111.0, 0.0, 111.0) (222.0, 111.0, 222.0) (333.0, 333.0, 444.0) ]
    boxPositions = [ (0.0, 1.0, 0.0) (0.0, 111.0, 0.0) (0.0, 333.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 2222.0
    lifetime = 0.7500
    emitduration = 0.2500
    Radii = (11.0, 11.0, 11.0)
    RadiusSpreads = (25.0, 20.0, 25.0)
    rotvel = (0.0, 6.0)
    rotveltimescale = 0.4000
    priority = 0
    texture = apm_flame_rot01
    BlendMode = Add
    alphacutoff = 1
    BoxRGBAs = [ -10008832 -12642688 -14145536 ]
    UseColorMidTime
    ColorMidTime = 55
}
apm_EL_LE_fireballT03_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (77.0, 222.0, 77.0) (222.0, 111.0, 222.0) (555.0, 333.0, 555.0) ]
    boxPositions = [ (0.0, -111.0, 0.0) (0.0, 222.0, 0.0) (0.0, 444.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 66.0
    lifetime = 5.0
    emitduration = 5.0
    Radii = (88.0, 66.0, 111.0)
    RadiusSpreads = (25.0, 20.0, 55.0)
    rotvel = (0.0, 0.6000000238418579)
    rotveltimescale = 0.4000
    priority = 0
    texture = apm_smokepuff_rot_01
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ 1732589696 1600085856 -1920103168 ]
    UseColorMidTime
    ColorMidTime = 49
}
apm_EL_LE_fireballT04_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (222.0, 55.0, 222.0) (1111.0, 333.0, 1111.0) (2222.0, 444.0, 2222.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (0.0, 444.0, 0.0) (0.0, 333.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 333.0
    lifetime = 0.7500
    emitduration = 0.2000
    Radii = (22.0, 22.0, 22.0)
    RadiusSpreads = (25.0, 20.0, 55.0)
    rotvel = (0.0, 1.0)
    rotveltimescale = 0.4000
    priority = 0
    texture = apm_debis_01
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ 1229210240 707406464 404232192 ]
    UseColorMidTime
    ColorMidTime = 49
}
apm_EL_LE_postsmokeLIL01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (11.0, 11.0, 11.0) (55.0, 33.0, 55.0) (111.0, 111.0, 111.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (50.0, 22.0, 0.0) (100.0, 111.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 11.0
    lifetime = 4.0
    emitduration = 5.0
    Radii = (33.0, 33.0, 55.0)
    RadiusSpreads = (25.0, 20.0, 25.0)
    rotvel = (0.0, 0.5)
    rotveltimescale = 0.4000
    priority = 0
    texture = apm_spray_01
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ 858993408 993737600 303174144 ]
    UseColorMidTime
    ColorMidTime = 50
}
apm_EL_LE_smoke05T_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (111.0, 22.0, 111.0) (111.0, 111.0, 111.0) (111.0, 111.0, 111.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (0.0, 111.0, 0.0) (0.0, 222.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 555.0
    lifetime = 1.0
    emitduration = 0.2000
    Radii = (55.0, 22.0, 22.0)
    RadiusSpreads = (25.0, 20.0, 25.0)
    rotvel = (0.0, 1.0)
    rotveltimescale = 0.4000
    priority = 0
    texture = apm_smokepuff_rot_01
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ 1414812800 1448498816 303174144 ]
    UseColorMidTime
    ColorMidTime = 50
}
apm_EL_LE_woodhit01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    boneoffset = (0.0, 64.5, 0.0)
    LocalSpace
    BoxDims = [ (11.0, 11.0, 11.0) (111.0, 55.0, 111.0) (222.0, 22.0, 222.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (0.0, 0.0, 0.0) (0.0, -50.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 222.0
    lifetime = 0.2000
    emitduration = 0.1000
    Radii = (11.0, 11.0, 11.0)
    RadiusSpreads = (11.0, 11.0, 11.0)
    rotvel = (0.0, 4.0)
    rotveltimescale = 0.4000
    priority = 0
    texture = apm_debis_02
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ 807605888 1413359232 1413359104 ]
    UseColorMidTime
    ColorMidTime = 50
}
apm_EL_fire01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    boneoffset = (0.0, 22.0, 0.0)
    LocalSpace
    BoxDims = [ (11.0, 11.0, 11.0) (22.0, 22.0, 22.0) (22.0, 55.0, 22.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (0.0, 33.0, 0.0) (0.0, 55.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 120.0
    lifetime = 1.500
    Radii = (11.0, 5.0, 5.0)
    RadiusSpreads = (10.0, 2.0, 5.0)
    rotvel = (-0.4000000059604645, 2.0)
    rotveltimescale = 0.3000
    priority = 1
    texture = apm_flame_rot01
    BlendMode = Add
    alphacutoff = 1
    BoxRGBAs = [ 1917920768 -11075456 1142297600 ]
    UseColorMidTime
    ColorMidTime = 50
}
apm_EL_fire02_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (11.0, 11.0, 11.0) (11.0, 22.0, 11.0) (111.0, 55.0, 111.0) ]
    boxPositions = [ (0.0, 11.0, 0.0) (0.0, 55.0, 0.0) (0.0, 150.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 10.0
    lifetime = 5.0
    Radii = (11.0, 22.0, 55.0)
    RadiusSpreads = (10.0, 2.0, 5.0)
    rotvel = (-0.4000000059604645, 1.0)
    rotveltimescale = 0.3000
    priority = 1
    texture = apm_smokepuff_rot_01
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ -1117901729 1329081728 1145324544 ]
    UseColorMidTime
    ColorMidTime = 49
}
apm_EL_postSmoke01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    boneoffset = (0.0, 64.5, 0.0)
    LocalSpace
    BoxDims = [ (55.0, 11.0, 55.0) (222.0, 55.0, 222.0) (666.0, 22.0, 666.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (111.0, 555.0, 0.0) (666.0, 1000.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 6.0
    lifetime = 15.0
    Radii = (111.0, 111.0, 333.0)
    RadiusSpreads = (11.0, 11.0, 11.0)
    rotvel = (0.0, 0.30000001192092896)
    rotveltimescale = 0.0
    priority = 0
    texture = apm_smokepuff_rot_01
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ 807605888 1414614400 1413359104 ]
    UseColorMidTime
    ColorMidTime = 44
}
apm_EL_sprinkla01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    boneoffset = (0.0, 22.0, 0.0)
    LocalSpace
    BoxDims = [ (0.0, 0.0, 0.0) (50.0, 15.0, 50.0) (100.0, 40.0, 100.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (-50.0, 66.0, 0.0) (-75.0, 0.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 500.0
    lifetime = 0.5000
    emitduration = 0.1000
    Radii = (10.0, 22.0, 22.0)
    RadiusSpreads = (5.0, 5.0, 5.0)
    rotvel = (0.0, 1.0)
    rotveltimescale = 0.2000
    priority = 0
    texture = apm_flys01
    BlendMode = Add
    alphacutoff = 1
    BoxRGBAs = [ -128 -1177102211 -2038004195 ]
    UseColorMidTime
    ColorMidTime = 50
}
apm_EL_sprinklaHit01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (0.0, 0.0, 0.0) (50.0, 15.0, 50.0) (100.0, 40.0, 100.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (0.0, 100.0, 0.0) (0.0, 50.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 250.0
    lod_dist2 = 251.0
    emitrate = 250.0
    lifetime = 0.5000
    Radii = (11.0, 22.0, 22.0)
    RadiusSpreads = (5.0, 5.0, 5.0)
    rotvel = (0.0, 1.0)
    rotveltimescale = 0.2000
    priority = 0
    texture = apm_flys01
    BlendMode = Add
    alphacutoff = 1
    BoxRGBAs = [ -128 -1177102211 -2038004195 ]
    UseColorMidTime
    ColorMidTime = 50
}
apm_FW_LE_sparks01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    enablerotate
    BoxDims = [ (50.0, 5.0, 200.0) (50.0, 22.0, 200.0) (50.0, 50.0, 200.0) ]
    boxPositions = [ (11.0, 0.0, 5.0) (11.0, 5.0, 0.0) (11.0, 0.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 666.0
    lifetime = 0.2000
    Radii = (22.0, 11.0, 5.0)
    RadiusSpreads = (5.0, 5.0, 5.0)
    rotvel = (0.0, 3.5)
    rotveltimescale = 1.0
    priority = 0
    texture = apm_spark_01
    BlendMode = Add
    alphacutoff = 1
    BoxRGBAs = [ -42515584 -14614400 0 ]
    UseColorMidTime
    useglobalcolormodulation
}
apm_H0_debris02_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    boneoffset = (0.0, 0.0, -20.0)
    LocalSpace
    BoxDims = [ (50.0, 200.0, 50.0) (500.0, 300.0, 250.0) (800.0, 40.0, 444.0) ]
    boxPositions = [ (0.0, 0.0, 25.0) (-50.0, -50.0, 100.0) (-100.0, -500.0, 150.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 1000.0
    lifetime = 1.0
    emitduration = 0.1000
    Radii = (77.0, 55.0, 55.0)
    RadiusSpreads = (22.0, 22.0, 22.0)
    rotvel = (0.0, 1.0)
    rotveltimescale = 0.4000
    priority = 0
    texture = apm_flys01
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ 1837403520 1145324672 128 ]
    UseColorMidTime
}
apm_H0_sparks02_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    boneoffset = (0.0, 0.0, -20.0)
    LocalSpace
    BoxDims = [ (50.0, 200.0, 50.0) (500.0, 300.0, 250.0) (800.0, 40.0, 444.0) ]
    boxPositions = [ (0.0, 0.0, 25.0) (-50.0, -50.0, 200.0) (-100.0, -1000.0, 400.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 1000.0
    lifetime = 1.0
    emitduration = 0.1000
    Radii = (55.0, 11.0, 11.0)
    RadiusSpreads = (22.0, 5.0, 5.0)
    rotvel = (0.0, 1.0)
    rotveltimescale = 0.4000
    priority = 0
    texture = apm_spark_01
    BlendMode = Add
    alphacutoff = 1
    BoxRGBAs = [ -1326973056 2010578816 1120337664 ]
    UseColorMidTime
}
apm_H0_sparks_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    BoxDims = [ (75.0, 20.0, 75.0) (175.0, 200.0, 175.0) (250.0, 40.0, 250.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (-50.0, -50.0, 0.0) (-100.0, -300.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 1000.0
    emitduration = 0.1000
    Radii = (26.0, 5.0, 5.0)
    RadiusSpreads = (25.0, 5.0, 5.0)
    rotvel = (0.0, 0.20000000298023224)
    rotveltimescale = 0.4000
    priority = 0
    texture = apm_spark_01
    BlendMode = Add
    alphacutoff = 1
    BoxRGBAs = [ -36849536 -12966018 -46252544 ]
    UseColorMidTime
    useglobalcolormodulation
}
apm_HO_LE_sparks01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    enablerotate
    BoxDims = [ (128.0, 5.0, 5.0) (128.0, 22.0, 22.0) (128.0, 50.0, 22.0) ]
    boxPositions = [ (0.0, 0.0, 5.0) (0.0, 5.0, -5.0) (0.0, 0.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 333.0
    lifetime = 0.1000
    Radii = (22.0, 11.0, 5.0)
    RadiusSpreads = (5.0, 5.0, 5.0)
    rotvel = (0.0, 3.5)
    rotveltimescale = 1.0
    priority = 0
    texture = apm_spark_01
    BlendMode = Add
    alphacutoff = 1
    BoxRGBAs = [ -42515584 -14614400 0 ]
    UseColorMidTime
    useglobalcolormodulation
}
apm_SM_Bigwater01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (111.0, 0.0, 111.0) (333.0, 222.0, 333.0) (444.0, 100.0, 444.0) ]
    boxPositions = [ (0.0, -100.0, 0.0) (0.0, 77.0, 88.0) (0.0, -111.0, 111.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 1111.0
    lifetime = 2.0
    emitduration = 0.2000
    Radii = (77.0, 55.0, 55.0)
    RadiusSpreads = (5.0, 34.0, 33.0)
    rotvel = (0.0, 1.0)
    rotveltimescale = 0.2000
    priority = 0
    texture = apm_water_splash01
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ -858993603 -808464579 -858993603 ]
    UseColorMidTime
    ColorMidTime = 50
}
apm_SR_MOTOSmoke01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (11.0, 11.0, 11.0) (55.0, 55.0, 55.0) (111.0, 22.0, 111.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (22.0, 55.0, 0.0) (33.0, 222.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 10.0
    lifetime = 5.0
    Radii = (22.0, 33.0, 44.0)
    RadiusSpreads = (11.0, 11.0, 11.0)
    rotvel = (0.0, 0.30000001192092896)
    rotveltimescale = 0.0
    priority = 0
    texture = apm_smokepuff_rot_01
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ 1414614272 1583242834 -1768516096 ]
    UseColorMidTime
    ColorMidTime = 44
    useglobalcolormodulation
}
apm_SV_AC01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (0.0, 0.0, 0.0) (111.0, 111.0, 111.0) (222.0, 100.0, 222.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (0.0, -200.0, 0.0) (0.0, -50.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 12.0
    lifetime = 5.0
    Radii = (55.0, 55.0, 22.0)
    RadiusSpreads = (5.0, 5.0, 5.0)
    rotvel = (0.0, 1.0)
    rotveltimescale = 0.2000
    priority = 0
    texture = apm_smokepuff_rot_01
    BlendMode = Add
    alphacutoff = 1
    BoxRGBAs = [ -256 -1177102322 -2038004224 ]
    UseColorMidTime
    ColorMidTime = 50
}
apm_SV_jeephit01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (111.0, 0.0, 111.0) (555.0, 222.0, 555.0) (666.0, 100.0, 666.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (0.0, 111.0, 0.0) (0.0, -111.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 555.0
    lifetime = 2.0
    emitduration = 0.2000
    Radii = (111.0, 111.0, 222.0)
    RadiusSpreads = (5.0, 5.0, 5.0)
    rotvel = (0.0, 1.0)
    rotveltimescale = 0.2000
    priority = 0
    texture = apm_spray_01
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ 1734497853 1397440578 1077952512 ]
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
apm_SV_jeephit02_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (111.0, 0.0, 111.0) (444.0, 222.0, 444.0) (666.0, 100.0, 666.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (0.0, 111.0, 0.0) (0.0, -111.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 225.0
    lifetime = 1.250
    emitduration = 0.2000
    Radii = (55.0, 55.0, 55.0)
    RadiusSpreads = (5.0, 5.0, 5.0)
    rotvel = (0.0, 1.0)
    rotveltimescale = 0.2000
    priority = 0
    texture = apm_splinters_01
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ 1734497920 1397440640 1077952512 ]
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
apm_SV_sprinkla01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (0.0, 0.0, 0.0) (111.0, 50.0, 111.0) (222.0, 100.0, 222.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (0.0, 0.0, -111.0) (0.0, -100.0, -222.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 1111.0
    lifetime = 0.3000
    emitduration = 5.0
    Radii = (22.0, 55.0, 22.0)
    RadiusSpreads = (5.0, 5.0, 5.0)
    rotvel = (0.0, 1.0)
    rotveltimescale = 0.2000
    priority = 0
    texture = apm_flys01
    BlendMode = Add
    alphacutoff = 1
    BoxRGBAs = [ -128 -1177102211 -2038004195 ]
    UseColorMidTime
    ColorMidTime = 50
}
apm_SV_sprinkla02_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (0.0, 0.0, 0.0) (111.0, 50.0, 111.0) (222.0, 100.0, 222.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (0.0, 0.0, 111.0) (0.0, -100.0, 222.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 1111.0
    lifetime = 0.3000
    emitduration = 5.0
    Radii = (22.0, 55.0, 22.0)
    RadiusSpreads = (5.0, 5.0, 5.0)
    rotvel = (0.0, 1.0)
    rotveltimescale = 0.2000
    priority = 0
    texture = apm_flys01
    BlendMode = Add
    alphacutoff = 1
    BoxRGBAs = [ -128 -1177102211 -2038004195 ]
    UseColorMidTime
    ColorMidTime = 50
}
apm_SV_sprinkla03_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (0.0, 0.0, 0.0) (111.0, 50.0, 111.0) (222.0, 100.0, 222.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (-111.0, 0.0, 0.0) (-221.89999389648438, -100.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 1111.0
    lifetime = 0.3000
    emitduration = 5.0
    Radii = (22.0, 55.0, 22.0)
    RadiusSpreads = (5.0, 5.0, 5.0)
    rotvel = (0.0, 1.0)
    rotveltimescale = 0.2000
    priority = 0
    texture = apm_flys01
    BlendMode = Add
    alphacutoff = 1
    BoxRGBAs = [ -128 -1177102211 -2038004195 ]
    UseColorMidTime
    ColorMidTime = 50
}
apm_SandFootstep01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    angles = (0.0, 0.0, 3.0)
    LocalSpace
    BoxDims = [ (10.0, 10.0, 10.0) (10.0, 10.0, 10.0) (15.0, 15.0, 15.0) ]
    boxPositions = [ (0.0, 1.0, 0.0) (0.0, 5.0, 0.0) (0.0, 20.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 15.0
    lifetime = 0.3000
    emitduration = 0.1000
    Radii = (10.0, 20.0, 30.0)
    RadiusSpreads = (0.0, 2.0, 3.0)
    priority = 0
    texture = apm_spray_01
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ -2139727319 -1718719616 -1297777664 ]
    UseColorMidTime
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
    BoxDims = [ (10.0, 10.0, 10.0) (15.0, 10.0, 15.0) (30.0, 15.0, 30.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (0.0, 20.0, -10.0) (0.0, 0.0, -20.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 60.0
    lifetime = 0.2000
    emitduration = 0.1000
    Radii = (10.0, 7.5, 5.0)
    RadiusSpreads = (0.0, 2.0, 3.0)
    priority = 0
    texture = apm_debis_quad01
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ 1717520512 1936281728 -2139662009 ]
    UseColorMidTime
    useglobalcolormodulation
    update_brightness_from = skater
}
apm_Skater_gravel01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (10.0, 10.0, 10.0) (30.0, 10.0, 30.0) (50.0, 10.0, 50.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (0.0, 10.0, 0.0) (0.0, -10.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 30.0
    lifetime = 0.4000
    emitduration = 0.1000
    Radii = (10.0, 20.0, 10.0)
    RadiusSpreads = (5.0, 10.0, 5.0)
    priority = 0
    texture = apm_debis_quad01
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ 1717722455 -2139392399 1717722964 ]
    UseColorMidTime
    useglobalcolormodulation
    update_brightness_from = skater
}
apm_Skater_splash01af_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (10.0, 10.0, 10.0) (75.0, 33.0, 75.0) (133.0, 11.0, 133.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (0.0, 33.0, 0.0) (0.0, -10.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 1111.0
    lifetime = 0.5000
    EmitDelay = 0.05000
    emitduration = 0.1000
    Radii = (10.0, 5.0, 2.0)
    RadiusSpreads = (5.0, 5.0, 5.0)
    rotvel = (0.0, 2.0)
    rotveltimescale = 0.2000
    priority = 0
    texture = apm_water_splash01
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ -128 -336860288 -2038004224 ]
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
apm_Skater_splash01f_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    BoxDims = [ (10.0, 10.0, 10.0) (50.0, 15.0, 50.0) (100.0, 40.0, 100.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (0.0, 100.0, 0.0) (0.0, 0.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 500.0
    lifetime = 0.6000
    emitduration = 0.2000
    Radii = (10.0, 5.0, 2.0)
    RadiusSpreads = (5.0, 5.0, 5.0)
    priority = 0
    texture = dt_nj_waterdrop05
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ -1886416957 1768515965 -2038004195 ]
    UseColorMidTime
    useglobalcolormodulation
}
apm_Skater_splash02f_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (10.0, 10.0, 10.0) (50.0, 15.0, 50.0) (100.0, 40.0, 100.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (0.0, 100.0, 0.0) (0.0, 0.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 250.0
    lifetime = 0.6000
    emitduration = 0.2500
    Radii = (5.0, 5.0, 2.0)
    RadiusSpreads = (5.0, 5.0, 5.0)
    priority = 0
    texture = apm_debis_01
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ -1886416957 1768515965 -2038004195 ]
    UseColorMidTime
    useglobalcolormodulation
}
apm_Skater_splash03_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (10.0, 10.0, 10.0) (30.0, 10.0, 30.0) (50.0, 10.0, 50.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (0.0, 20.0, 0.0) (0.0, -10.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 100.0
    lifetime = 0.3000
    emitduration = 0.1000
    Radii = (5.0, 5.0, 5.0)
    RadiusSpreads = (5.0, 3.0, 3.0)
    priority = 0
    texture = dt_nj_waterdrop05
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ -1145324672 -1667457985 1852730880 ]
    UseColorMidTime
    useglobalcolormodulation
}
apm_bees_01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (30.0, 60.0, 30.0) (60.0, 30.0, 60.0) (30.0, 60.0, 30.0) ]
    boxPositions = [ (0.0, 0.0, 20.0) (0.0, 10.0, -20.0) (0.0, 0.0, 20.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 50.0
    lifetime = 0.5000
    Radii = (2.0, 2.0, 2.0)
    RadiusSpreads = (2.0, 2.0, 2.0)
    priority = 0
    texture = apm_beez02a
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ -1717986944 1717986944 -1717986944 ]
    UseColorMidTime
    useglobalcolormodulation
}
apm_bees_02_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (30.0, 60.0, 30.0) (60.0, 30.0, 60.0) (30.0, 60.0, 30.0) ]
    boxPositions = [ (0.0, 0.0, 10.0) (0.0, -5.0, 0.0) (0.0, 0.0, 10.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 50.0
    lifetime = 0.5000
    Radii = (2.0, 2.0, 2.0)
    RadiusSpreads = (2.0, 2.0, 2.0)
    priority = 0
    texture = apm_beez02b
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ 1717986944 -1717986944 1717986944 ]
    UseColorMidTime
    useglobalcolormodulation
}
apm_bees_03_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (30.0, 60.0, 30.0) (60.0, 30.0, 60.0) (30.0, 60.0, 30.0) ]
    boxPositions = [ (22.0, 0.0, 0.0) (0.0, 5.0, 0.0) (22.0, 0.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 50.0
    lifetime = 0.5000
    Radii = (1.0, 2.0, 1.0)
    RadiusSpreads = (2.0, 2.0, 2.0)
    priority = 0
    texture = apm_beez02c
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ 1145324672 1717986944 1145324672 ]
    UseColorMidTime
    useglobalcolormodulation
}
apm_bees_04_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    BoxDims = [ (30.0, 60.0, 30.0) (60.0, 30.0, 60.0) (30.0, 60.0, 30.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (0.0, 5.0, -20.0) (0.0, 0.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 50.0
    lifetime = 0.5000
    Radii = (2.0, 2.0, 2.0)
    RadiusSpreads = (2.0, 2.0, 2.0)
    priority = 0
    texture = apm_beez02d
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ -1717986944 1717986944 -1717986944 ]
    UseColorMidTime
    useglobalcolormodulation
}
apm_coplightB02_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    enablerotate
    BoxDims = [ (0.0, 0.0, 0.0) (3.0, 3.0, 3.0) (0.0, 0.0, 0.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (0.0, 0.0, -12.0) (0.0, 0.0, -24.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 8.0
    lifetime = 5.0
    timeseed = 5.0
    Radii = (5.0, 33.0, 120.0)
    rotvel = (0.0, 1.7999999523162842)
    rotveltimescale = 0.2000
    priority = 0
    texture = apm_spark_03
    BlendMode = Add
    alphacutoff = 1
    BoxRGBAs = [ 895942452 895942406 895942400 ]
    UseColorMidTime
    ColorMidTime = 50
}
apm_coplightB_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    enablerotate
    BoxDims = [ (0.0, 0.0, 0.0) (3.0, 3.0, 3.0) (0.0, 0.0, 0.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (0.0, 0.0, 12.0) (0.0, 0.0, 24.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 8.0
    lifetime = 5.0
    timeseed = 5.0
    Radii = (5.0, 33.0, 120.0)
    rotvel = (0.0, 1.7999999523162842)
    rotveltimescale = 0.2000
    priority = 0
    texture = apm_spark_03
    BlendMode = Add
    alphacutoff = 1
    BoxRGBAs = [ 895942452 895942406 895942400 ]
    UseColorMidTime
    ColorMidTime = 50
}
apm_coplightR02_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    enablerotate
    BoxDims = [ (0.0, 0.0, 0.0) (3.0, 3.0, 3.0) (0.0, 0.0, 0.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (0.0, 0.0, 12.0) (0.0, 0.0, 24.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 8.0
    lifetime = 5.0
    timeseed = 5.0
    Radii = (5.0, 33.0, 120.0)
    rotvel = (0.0, 1.7999999523162842)
    rotveltimescale = 0.2000
    priority = 0
    texture = apm_spark_03
    BlendMode = Add
    alphacutoff = 1
    BoxRGBAs = [ -14134732 -14134773 -14134784 ]
    UseColorMidTime
    ColorMidTime = 50
}
apm_coplightR_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    enablerotate
    BoxDims = [ (0.0, 0.0, 0.0) (3.0, 3.0, 3.0) (0.0, 0.0, 0.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (0.0, 0.0, -12.0) (0.0, 0.0, -24.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 8.0
    lifetime = 5.0
    timeseed = 5.0
    Radii = (5.0, 33.0, 120.0)
    rotvel = (0.0, 1.7999999523162842)
    rotveltimescale = 0.2000
    priority = 0
    texture = apm_spark_03
    BlendMode = Add
    alphacutoff = 1
    BoxRGBAs = [ -14134732 -14134773 -14134784 ]
    UseColorMidTime
    ColorMidTime = 50
}
apm_coplight_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    enablerotate
    BoxDims = [ (0.0, 0.0, 0.0) (3.0, 3.0, 3.0) (0.0, 0.0, 0.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (0.0, 0.0, 33.0) (0.0, 0.0, 66.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 8.0
    lifetime = 5.0
    Radii = (5.0, 33.0, 66.0)
    rotvel = (0.0, 1.7999999523162842)
    rotveltimescale = 0.2000
    priority = 0
    texture = apm_spark_03
    BlendMode = Add
    alphacutoff = 1
    BoxRGBAs = [ -13281152 -13880054 -13875456 ]
    UseColorMidTime
    ColorMidTime = 50
}
apm_featherXplode_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    ObjID = skater
    LocalSpace
    BoxDims = [ (5.0, 5.0, 5.0) (77.0, 55.0, 77.0) (111.0, 60.0, 111.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (0.0, 55.0, 0.0) (0.0, 22.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 1111.0
    lifetime = 1.0
    emitduration = 0.2000
    Radii = (2.0, 2.0, 2.0)
    RadiusSpreads = (2.0, 2.0, 2.0)
    rotvel = (2.0, 4.0)
    rotveltimescale = 0.2000
    priority = 0
    texture = apm_feather01
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ 1263225728 -1600810901 -961304832 ]
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
apm_headlamp01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    boneoffset = (-29.0, 32.0, 155.0)
    LocalSpace
    enablerotate
    BoxDims = [ (0.0, 0.0, 0.0) (3.0, 3.0, 3.0) (0.0, 0.0, 0.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (0.0, -20.0, 50.0) (0.0, -40.0, 100.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 33.0
    lifetime = 1.0
    Radii = (5.0, 33.0, 66.0)
    rotvel = (0.0, 1.7999999523162842)
    rotveltimescale = 0.2000
    priority = 0
    texture = apm_spark_03
    BlendMode = Add
    alphacutoff = 1
    BoxRGBAs = [ -2944 -3062 -3072 ]
    UseColorMidTime
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
    BoxDims = [ (10.0, 0.0, 10.0) (60.0, 5.0, 60.0) (50.0, 5.0, 50.0) ]
    boxPositions = [ (0.0, 10.0, 0.0) (0.0, 20.0, 0.0) (0.0, 10.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 200.0
    lifetime = 0.2500
    emitduration = 0.2500
    Radii = (5.0, 20.0, 20.0)
    RadiusSpreads = (2.0, 10.0, 10.0)
    priority = 0
    texture = apm_spray_01
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ 1296512512 1717454976 1717521408 ]
    UseColorMidTime
    useglobalcolormodulation
    update_brightness_from = skater
}
apm_temp01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    ObjID = skater
    LocalSpace
    BoxDims = [ (5.0, 5.0, 5.0) (77.0, 55.0, 77.0) (111.0, 60.0, 111.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (0.0, 55.0, 0.0) (0.0, 22.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 555.0
    lifetime = 1.0
    Radii = (2.0, 2.0, 2.0)
    RadiusSpreads = (2.0, 2.0, 2.0)
    rotvel = (2.0, 4.0)
    rotveltimescale = 0.2000
    priority = 0
    texture = apm_feather01
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ 1263225728 -1600810901 -961304832 ]
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
apm_temp02_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    ObjID = skater
    LocalSpace
    BoxDims = [ (5.0, 5.0, 5.0) (77.0, 55.0, 77.0) (111.0, 60.0, 111.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (0.0, 55.0, 0.0) (0.0, 22.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 555.0
    lifetime = 1.0
    Radii = (2.0, 2.0, 2.0)
    RadiusSpreads = (2.0, 2.0, 2.0)
    rotvel = (2.0, 4.0)
    rotveltimescale = 0.2000
    priority = 0
    texture = apm_debis_01
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ 1263225728 -1600810901 -961304832 ]
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
apm_temp03_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    ObjID = skater
    LocalSpace
    BoxDims = [ (5.0, 5.0, 5.0) (77.0, 55.0, 77.0) (111.0, 60.0, 111.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (0.0, 55.0, 0.0) (0.0, 22.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 55.0
    lifetime = 1.0
    Radii = (55.0, 22.0, 2.0)
    RadiusSpreads = (2.0, 2.0, 2.0)
    rotvel = (2.0, 4.0)
    rotveltimescale = 0.2000
    priority = 0
    texture = apm_smokepuff_rot_01
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ 1263225728 -1600810901 -961304832 ]
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
apm_temp04_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    ObjID = skater
    LocalSpace
    BoxDims = [ (5.0, 5.0, 5.0) (77.0, 55.0, 77.0) (111.0, 60.0, 111.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (0.0, 55.0, 0.0) (0.0, 22.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 55.0
    lifetime = 1.0
    Radii = (55.0, 22.0, 2.0)
    RadiusSpreads = (2.0, 2.0, 2.0)
    rotvel = (2.0, 4.0)
    rotveltimescale = 0.2000
    priority = 0
    texture = apm_flys01
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ 1263225728 -1600810901 -961304832 ]
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
apm_temp05_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    ObjID = skater
    LocalSpace
    BoxDims = [ (5.0, 5.0, 5.0) (77.0, 55.0, 77.0) (111.0, 60.0, 111.0) ]
    boxPositions = [ (0.0, 0.0, 0.0) (0.0, 55.0, 0.0) (0.0, 22.0, 0.0) ]
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = Default_Fast_Particle_LOD_Dist1
    lod_dist2 = Default_Fast_Particle_LOD_Dist2
    emitrate = 55.0
    lifetime = 1.0
    Radii = (55.0, 22.0, 2.0)
    RadiusSpreads = (2.0, 2.0, 2.0)
    rotvel = (2.0, 4.0)
    rotveltimescale = 0.2000
    priority = 0
    texture = apm_lightningfm01
    BlendMode = Blend
    alphacutoff = 1
    BoxRGBAs = [ 1263225728 -1600810901 -961304832 ]
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
