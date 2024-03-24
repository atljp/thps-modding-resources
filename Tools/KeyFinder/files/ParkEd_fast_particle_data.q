

script load_level_fast_particle_textures 
    LoadParticleTexture 'particles\dt_flametest01'
endscript

sk6ed_fire_fast_particle_params = {
    class = particleobject
    type = default
    BoxDimsStart = (20.0, 20.0, 20.0)
    Pos = (0.0, 0.0, 0.0)
    MidPosition = (0.0, 100.0, 0.0)
    EndPosition = (0.0, 200.0, 0.0)
    BoxDimsMid = (20.0, 20.0, 20.0)
    BoxDimsEnd = (20.0, 20.0, 20.0)
    texture = dt_flametest01
    absentinnetgames
    UseMidPoint
    UseColorMidTime
    type = NewFlat
    BlendMode = Add
    FixedAlpha = 128
    alphacutoff = 0
    maxstreams = 2
    suspenddistance = 10
    lod_dist1 = 400
    lod_dist2 = 401
    emitrate = 70.0
    lifetime = 1.500
    MidPointPCT = 50
    startradius = 30.0
    MidRadius = 12.0
    endradius = 9.0
    StartRadiusSpread = 5.0
    MidRadiusSpread = 5.0
    EndRadiusSpread = 5.0
    startRGB = [139 , 112 , 80]
    startAlpha = 99
    ColorMidTime = 50
    midRGB = [95 , 40 , 0]
    midAlpha = 128
    endRGB = [23 , 22 , 21]
    endAlpha = 0
}
