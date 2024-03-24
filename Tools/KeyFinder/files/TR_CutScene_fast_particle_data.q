

script load_cutscene_fast_particle_textures 
    LoadParticleTexture 'particles\apm_spark_01'
    LoadParticleTexture 'particles\apm_spray_01'
endscript

APM_TRc_Barrel_blast_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    ObjID = skater
    LocalSpace
    BoxDimsStart = (10.0, 10.0, 10.0)
    BoxDimsMid = (80.0, 20.0, 80.0)
    BoxDimsEnd = (100.0, 40.0, 100.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.0, 80.0, 0.0)
    EndPosition = (0.0, 40.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0
    lod_dist2 = 0
    emitrate = 500.0
    lifetime = 0.3000
    startradius = 20.0
    MidRadius = 10.0
    endradius = 1.0
    StartRadiusSpread = 0.0
    MidRadiusSpread = 10.0
    EndRadiusSpread = 20.0
    texture = apm_spark_01
    BlendMode = Add
    alphacutoff = 1
    startRGB = [255 , 97 , 97]
    startAlpha = 255
    endRGB = [255 , 110 , 0]
    endAlpha = 0
    midRGB = [255 , 42 , 42]
    midAlpha = 128
    UseColorMidTime
    ColorMidTime = 50
    useglobalcolormodulation
}
APM_TRc_Barrel_smoke_fast_particle_params = {
    class = particleobject
    type = NewFlat
    createdatstart
    absentinnetgames
    maxstreams = 2
    ObjID = skater
    LocalSpace
    BoxDimsStart = (10.0, 10.0, 10.0)
    BoxDimsMid = (80.0, 20.0, 80.0)
    BoxDimsEnd = (100.0, 60.0, 100.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.0, 60.0, 0.0)
    EndPosition = (0.0, 80.0, 0.0)
    UseMidPoint
    suspenddistance = Default_Fast_Particle_Suspend_Dist
    lod_dist1 = 0.0
    lod_dist2 = 0.0
    emitrate = 500.0
    lifetime = 0.5000
    startradius = 10.0
    MidRadius = 40.0
    endradius = 40.0
    StartRadiusSpread = 0.0
    MidRadiusSpread = 10.0
    EndRadiusSpread = 20.0
    texture = apm_spray_01
    BlendMode = Blend
    alphacutoff = 1
    startRGB = [156 , 57 , 37]
    startAlpha = 255
    endRGB = [116 , 110 , 110]
    endAlpha = 0
    midRGB = [116 , 110 , 110]
    midAlpha = 128
    UseColorMidTime
    ColorMidTime = 59
}
