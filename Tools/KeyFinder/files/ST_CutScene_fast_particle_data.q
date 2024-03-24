

script load_cutscene_fast_particle_textures 
    LoadParticleTexture 'particles\apm_spark_01'
endscript

apm_STc_Xplode02_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    ObjID = skater
    bone = Bone_Board_Root
    LocalSpace
    enablerotate
    BoxDimsStart = (10.0, 30.0, 10.0)
    BoxDimsMid = (100.0, 100.0, 100.0)
    BoxDimsEnd = (200.0, 300.0, 200.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (50.0, 0.0, 0.0)
    EndPosition = (-200.0, 0.5, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 200.0
    lifetime = 0.2000
    EmitDelay = 0.5000
    emitduration = 0.3000
    startradius = 20.0
    MidRadius = 20.0
    endradius = 10.0
    StartRadiusSpread = 0.0
    MidRadiusSpread = 0.0
    EndRadiusSpread = 5.0
    priority = 0
    texture = apm_spark_01
    BlendMode = Add
    alphacutoff = 0
    startRGB = [226 , 116 , 46]
    startAlpha = 47
    endRGB = [163 , 48 , 30]
    endAlpha = 0
    midRGB = [189 , 54 , 32]
    midAlpha = 128
    UseColorMidTime
    ColorMidTime = 50
}
apm_STc_bigsparks01_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    maxstreams = 2
    LocalSpace
    enablerotate
    BoxDimsStart = (10.0, 10.0, 10.0)
    BoxDimsMid = (75.0, 25.0, 75.0)
    BoxDimsEnd = (150.0, 10.0, 150.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.0, 30.0, 20.0)
    EndPosition = (0.0, 0.0, 40.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 300.0
    lifetime = 0.4000
    emitduration = 0.1000
    startradius = 25.0
    MidRadius = 15.0
    endradius = 11.0
    StartRadiusSpread = 10.0
    MidRadiusSpread = 5.0
    EndRadiusSpread = 5.0
    priority = 0
    texture = apm_spark_01
    BlendMode = Add
    alphacutoff = 1
    startRGB = [236 , 74 , 40]
    startAlpha = 128
    endRGB = [121 , 25 , 12]
    endAlpha = 0
    midRGB = [220 , 46 , 10]
    midAlpha = 112
    UseColorMidTime
    ColorMidTime = 50
}
