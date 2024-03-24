

script load_cutscene_particle_textures 
    LoadParticleTexture 'particles\apm_spark_03'
    LoadParticleTexture 'particles\dt_choochoosmoke01c'
    LoadParticleTexture 'particles\dt_nj_puff01b'
    LoadParticleTexture 'particles\jow_au_chunks01'
    LoadParticleTexture 'particles\jow_au_chunks02'
    LoadParticleTexture 'particles\jow_au_chunks03'
    LoadParticleTexture 'particles\jow_au_skidmark01'
    LoadParticleTexture 'particles\jow_no_drops01'
    LoadParticleTexture 'particles\water_spray'
endscript

JOW_AUe1_BallChunks01_particle_params = {
    emitscript = emit_JOW_AUe1_BallChunks01_particle
    emitterindependent = 1
    max = 48
    type = Shaded
    texture = jow_au_chunks01
    BlendMode = Blend
    userandomuvquadrants
    useglobalcolormodulation
}

script emit_JOW_AUe1_BallChunks01_particle 
    setemitrange width = 80.0 height = 80.0
    setlife min = 1.0 max = 1.0
    setanglespread spread = 1.0
    setspeedrange min = 1.0 max = 3.0
    setemittarget x = 1.0 y = 0.0 z = 0.0
    setforce x = 0.0 y = -0.1000 z = 0.0
    setparticlesize sw = 8.0 ew = 8.0
    setcolor sr = 128 sg = 128 sb = 128 sa = 255 er = 128 eg = 128 eb = 128 ea = 255
    emit num = 48
    destroy ifempty = 1
endscript

JOW_AUe1_CraneSmoke01_particle_params = {
    emitscript = emit_JOW_AUe1_CraneSmoke01_particle
    emitterindependent = 1
    max = 40
    type = flat
    texture = dt_choochoosmoke01c
    BlendMode = Blend
}

script emit_JOW_AUe1_CraneSmoke01_particle 
    setemitrange width = 3.0 height = 3.0
    setlife min = 1.500 max = 2.0
    setanglespread spread = 0.1667
    setspeedrange min = 0.0 max = 0.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.02000 z = 0.0
    setparticlesize sw = 8.0 ew = 32.0
    setcolor sr = 68 sg = 72 sb = 81 sa = 0 mr = 66 mg = 71 mb = 77 ma = 26 er = 53 eg = 56 eb = 62 ea = 0 midTime = 0.6709
    emitrate rate = 20.0
endscript

JOW_AUe1_Hydrant01_particle_params = {
    emitscript = emit_JOW_AUe1_Hydrant01_particle
    emitterindependent = 1
    max = 40
    type = Ribbon
    texture = water_spray
    BlendMode = Blend
    History = 3
    useglobalcolormodulation
}

script emit_JOW_AUe1_Hydrant01_particle 
    setemitrange width = 5.0 height = 5.0
    setlife min = 0.2000 max = 0.2000
    setanglespread spread = 0.1667
    setspeedrange min = 15.0 max = 15.0
    setemittarget x = 0.0 y = 0.0 z = 1.0
    setforce x = 0.0 y = -0.4000 z = 0.0
    setparticlesize sw = 1.0 ew = 4.0
    setcolor sr = 110 sg = 110 sb = 110 sa = 90 er = 97 eg = 97 eb = 97 ea = 0
    setlodparams min_particles = 0 lod_dist1 = Default_Particle_LOD_Dist1 lod_dist2 = Default_Particle_LOD_Dist2
    emitrate rate = 200.0
    wait 1.0 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript

JOW_AUe1_LampSpark01_particle_params = {
    emitscript = emit_JOW_AUe1_LampSpark01_particle
    emitterindependent = 1
    max = 12
    type = FlatRibbonTail
    texture = apm_spark_03
    BlendMode = Add
    History = 4
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_AUe1_LampSpark01_particle 
    setemitrange width = 5.0 height = 5.0 depth = 0.0
    setlife min = 1.0 max = 1.0
    setanglespread spread = 0.6667
    setspeedrange min = 2.0 max = 3.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = -0.07000 z = 0.0
    setparticlesize sw = 0.5000 ew = 0.2500
    setcolor corner = 0 sr = 255 sg = 0 sb = 0 sa = 84 er = 255 eg = 192 eb = 0 ea = 0
    setcolor corner = 1 sr = 255 sg = 0 sb = 0 sa = 193 er = 255 eg = 192 eb = 0 ea = 0
    setcolor corner = 2 sr = 255 sg = 0 sb = 0 sa = 193 er = 255 eg = 192 eb = 0 ea = 0
    setcolor corner = 3 sr = 255 sg = 0 sb = 0 sa = 193 er = 255 eg = 192 eb = 0 ea = 0
    setcolor corner = 4 sr = 255 sg = 0 sb = 0 sa = 117 er = 255 eg = 192 eb = 0 ea = 0
    setcolor corner = 5 sr = 255 sg = 0 sb = 0 sa = 0 er = 255 eg = 192 eb = 0 ea = 0
    emitrate rate = 90.0
endscript

JOW_AUe1_PlugSpark01_particle_params = {
    emitscript = emit_JOW_AUe1_PlugSpark01_particle
    emitterindependent = 1
    max = 128
    type = FlatRibbonTail
    texture = apm_spark_03
    BlendMode = Add
    History = 4
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_AUe1_PlugSpark01_particle 
    setemitrange width = 1.0 height = 1.0 depth = 0.0
    setlife min = 1.0 max = 1.0
    setanglespread spread = 0.5000
    setspeedrange min = 0.7500 max = 1.500
    setemittarget x = -0.1778 y = 0.0 z = -0.9841
    setforce x = 0.0 y = -0.04000 z = 0.0
    setparticlesize sw = 0.2500 ew = 0.1500
    setcolor corner = 0 sr = 255 sg = 0 sb = 0 sa = 163 er = 255 eg = 192 eb = 0 ea = 0
    setcolor corner = 1 sr = 255 sg = 0 sb = 0 sa = 163 er = 255 eg = 192 eb = 0 ea = 0
    setcolor corner = 2 sr = 255 sg = 0 sb = 0 sa = 163 er = 255 eg = 192 eb = 0 ea = 0
    setcolor corner = 3 sr = 255 sg = 0 sb = 0 sa = 106 er = 255 eg = 192 eb = 0 ea = 0
    setcolor corner = 4 sr = 255 sg = 0 sb = 0 sa = 48 er = 255 eg = 192 eb = 0 ea = 0
    setcolor corner = 5 sr = 255 sg = 0 sb = 0 sa = 0 er = 255 eg = 192 eb = 0 ea = 0
    emitrate rate = 60.0
    wait 0.2500 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript

JOW_AUe1_ScooterGlow01_particle_params = {
    emitscript = emit_JOW_AUe1_ScooterGlow01_particle
    emitterindependent = 1
    max = 7
    type = flat
    texture = apm_spark_03
    BlendMode = Add
    useglobalcolormodulation
}

script emit_JOW_AUe1_ScooterGlow01_particle 
    setemitrange width = 1.0 height = 1.0
    setlife min = 0.1200 max = 0.1200
    setanglespread spread = 0.2500
    setspeedrange min = 0.0 max = 0.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.0 z = 0.0
    setparticlesize sw = 8.0 ew = 8.0
    setcolor sr = 255 sg = 0 sb = 0 sa = 255 mr = 255 mg = 0 mb = 0 ma = 84 er = 255 eg = 66 eb = 0 ea = 0 midTime = 0.2532
    emitrate rate = 60.0
    wait 1.0 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript

JOW_AUe1_ScooterSkid01_particle_params = {
    boneoffset = (0.0, -10.0, 0.0)
    emitscript = emit_JOW_AUe1_ScooterSkid01_particle
    emitterindependent = 1
    max = 225
    type = Shaded
    texture = JOW_AU_SkidMark01
    BlendMode = Blend
    align_to = (0.0, 1.0, 0.0)
    useglobalcolormodulation
}

script emit_JOW_AUe1_ScooterSkid01_particle 
    setemitrange width = 1.0 height = 1.0
    setlife min = 3.0 max = 3.0
    setanglespread spread = 0.2500
    setspeedrange min = 0.0 max = 0.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.0 z = 0.0
    setparticlesize sw = 6.0 ew = 6.0
    setcolor sr = 89 sg = 89 sb = 89 sa = 64 mr = 89 mg = 89 mb = 89 ma = 64 er = 89 eg = 89 eb = 89 ea = 0 midTime = 0.8924
    setlodparams min_particles = 0 lod_dist1 = Default_Particle_LOD_Dist1 lod_dist2 = Default_Particle_LOD_Dist2
    emitrate rate = 75.0
    wait 0.5000 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript

JOW_AUe1_ScooterSmoke01_particle_params = {
    emitscript = emit_JOW_AUe1_ScooterSmoke01_particle
    emitterindependent = 1
    max = 23
    type = flat
    texture = dt_nj_puff01b
    BlendMode = Blend
    useglobalcolormodulation
}

script emit_JOW_AUe1_ScooterSmoke01_particle 
    setemitrange width = 1.0 height = 1.0
    setlife min = 0.1000 max = 0.2500
    setanglespread spread = 0.2500
    setspeedrange min = 0.0 max = 0.1000
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.04000 z = 0.0
    setparticlesize sw = 4.0 ew = 8.0
    setcolor sr = 27 sg = 29 sb = 31 sa = 51 er = 48 eg = 51 eb = 57 ea = 0
    setlodparams min_particles = 0 lod_dist1 = Default_Particle_LOD_Dist1 lod_dist2 = Default_Particle_LOD_Dist2
    emitrate rate = 90.0
    wait 1.500 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript

JOW_AUe1_Splash01_particle_params = {
    emitscript = emit_JOW_AUe1_Splash01_particle
    emitterindependent = 1
    max = 128
    type = Ribbon
    texture = JOW_NO_Drops01
    BlendMode = Blend
    History = 4
    useglobalcolormodulation
}

script emit_JOW_AUe1_Splash01_particle 
    setemitrange width = 5.0 height = 5.0
    setlife min = 0.9000 max = 1.200
    setanglespread spread = 0.2222
    setspeedrange min = 10.0 max = 12.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = -0.4000 z = 0.0
    setparticlesize sw = 12.0 ew = 8.0
    setcolor sr = 128 sg = 128 sb = 128 sa = 0 mr = 128 mg = 128 mb = 128 ma = 255 er = 112 eg = 112 eb = 112 ea = 0 midTime = 0.5759
    setlodparams min_particles = 0 lod_dist1 = Default_Particle_LOD_Dist1 lod_dist2 = Default_Particle_LOD_Dist2
    emit num = 128
    destroy ifempty = 1
endscript

JOW_AUe1_Splash02_particle_params = {
    emitscript = emit_JOW_AUe1_Splash02_particle
    emitterindependent = 1
    max = 72
    type = Ribbon
    texture = JOW_NO_Drops01
    BlendMode = Blend
    History = 6
    useglobalcolormodulation
}

script emit_JOW_AUe1_Splash02_particle 
    setemitrange width = 4.0 height = 4.0
    setlife min = 0.1000 max = 0.2000
    setanglespread spread = 0.1667
    setspeedrange min = 15.0 max = 15.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.0 z = 0.0
    setparticlesize sw = 12.0 ew = 8.0
    setcolor sr = 128 sg = 128 sb = 128 sa = 255 er = 112 eg = 112 eb = 112 ea = 0
    setlodparams min_particles = 0 lod_dist1 = Default_Particle_LOD_Dist1 lod_dist2 = Default_Particle_LOD_Dist2
    emitrate rate = 360.0
    wait 0.2000 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript

JOW_AUe1_VanSkid01_particle_params = {
    boneoffset = (0.0, -10.0, 0.0)
    emitscript = emit_JOW_AUe1_VanSkid01_particle
    emitterindependent = 1
    max = 240
    type = Shaded
    texture = JOW_AU_SkidMark01
    BlendMode = Blend
    align_to = (0.0, 1.0, 0.0)
    useglobalcolormodulation
}

script emit_JOW_AUe1_VanSkid01_particle 
    setemitrange width = 1.0 height = 1.0
    setlife min = 6.0 max = 6.0
    setanglespread spread = 0.2500
    setspeedrange min = 0.0 max = 0.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.0 z = 0.0
    setparticlesize sw = 6.0 ew = 6.0
    setcolor sr = 89 sg = 89 sb = 89 sa = 89 mr = 89 mg = 89 mb = 89 ma = 89 er = 89 eg = 89 eb = 89 ea = 0 midTime = 0.8924
    emitrate rate = 40.0
    wait 0.7000 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript

JOW_AUe1_VanTireSmoke01_particle_params = {
    boneoffset = (0.0, -10.0, 0.0)
    emitscript = emit_JOW_AUe1_VanTireSmoke01_particle
    emitterindependent = 1
    max = 60
    type = flat
    texture = dt_nj_puff01b
    BlendMode = Blend
    useglobalcolormodulation
}

script emit_JOW_AUe1_VanTireSmoke01_particle 
    setemitrange width = 1.0 height = 1.0
    setlife min = 2.0 max = 2.0
    setanglespread spread = 0.2500
    setspeedrange min = 0.0 max = 0.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.01000 z = 0.0
    setparticlesize sw = 12.0 ew = 64.0
    setcolor sr = 41 sg = 46 sb = 57 sa = 64 er = 42 eg = 47 eb = 57 ea = 0
    emitrate rate = 30.0
    wait 1.0 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript

JOW_AUe1_WRXSkid01_particle_params = {
    emitscript = emit_JOW_AUe1_WRXSkid01_particle
    emitterindependent = 1
    max = 240
    type = Shaded
    texture = JOW_AU_SkidMark01
    BlendMode = Blend
    align_to = (0.0, 1.0, 0.0)
    useglobalcolormodulation
}

script emit_JOW_AUe1_WRXSkid01_particle 
    setemitrange width = 1.0 height = 1.0
    setlife min = 6.0 max = 6.0
    setanglespread spread = 0.2500
    setspeedrange min = 0.0 max = 0.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.0 z = 0.0
    setparticlesize sw = 6.0 ew = 6.0
    setcolor sr = 89 sg = 89 sb = 89 sa = 89 mr = 89 mg = 89 mb = 89 ma = 89 er = 89 eg = 89 eb = 89 ea = 0 midTime = 0.8924
    emitrate rate = 40.0
    wait 0.7000 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript

JOW_AUe1_WRXTireSmoke01_particle_params = {
    emitscript = emit_JOW_AUe1_WRXTireSmoke01_particle
    emitterindependent = 1
    max = 60
    type = flat
    texture = dt_nj_puff01b
    BlendMode = Blend
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_AUe1_WRXTireSmoke01_particle 
    setemitrange width = 1.0 height = 1.0 depth = 0.0
    setlife min = 2.0 max = 2.0
    setanglespread spread = 0.2500
    setspeedrange min = 0.0 max = 0.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.01000 z = 0.0
    setparticlesize sw = 12.0 ew = 64.0
    setcolor sr = 41 sg = 46 sb = 57 sa = 64 er = 42 eg = 47 eb = 57 ea = 0
    emitrate rate = 30.0
    wait 1.0 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript

JOW_AUe2_CarSteam01_particle_params = {
    emitscript = emit_JOW_AUe2_CarSteam01_particle
    emitterindependent = 1
    max = 64
    type = flat
    texture = dt_nj_puff01b
    BlendMode = Blend
    useglobalcolormodulation
}

script emit_JOW_AUe2_CarSteam01_particle 
    setemitrange width = 1.0 height = 1.0
    setlife min = 0.5000 max = 0.5000
    setanglespread spread = 0.1111
    setspeedrange min = 2.0 max = 4.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.0 z = 0.0
    setparticlesize sw = 6.0 ew = 32.0
    setcolor sr = 125 sg = 125 sb = 125 sa = 0 mr = 147 mg = 147 mb = 147 ma = 51 er = 154 eg = 154 eb = 154 ea = 0 midTime = 0.2089
    setlodparams min_particles = 0 lod_dist1 = Default_Particle_LOD_Dist1 lod_dist2 = Default_Particle_LOD_Dist2
    emitrate rate = 128.0
    wait 2.0 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript

JOW_AUe2_DoorChunks01_particle_params = {
    emitscript = emit_JOW_AUe2_DoorChunks01_particle
    emitterindependent = 1
    max = 32
    type = Shaded
    texture = JOW_AU_Chunks02
    BlendMode = Blend
    userandomuvquadrants
    useglobalcolormodulation
}

script emit_JOW_AUe2_DoorChunks01_particle 
    setemitrange width = 40.0 height = 40.0
    setlife min = 3.0 max = 4.0
    setanglespread spread = 0.6667
    setspeedrange min = 2.0 max = 20.0
    setemittarget x = -0.7071 y = 0.7071 z = 0.0
    setforce x = 0.0 y = -0.1000 z = 0.0
    setparticlesize sw = 24.0 ew = 24.0
    setcolor sr = 128 sg = 128 sb = 128 sa = 255 er = 128 eg = 128 eb = 128 ea = 255
    emit num = 32
    destroy ifempty = 1
endscript

JOW_AUe2_DustStream01_particle_params = {
    boneoffset = (0.0, -50.0, 0.0)
    emitscript = emit_JOW_AUe2_DustStream01_particle
    emitterindependent = 1
    max = 120
    type = flat
    texture = dt_nj_puff01b
    BlendMode = Blend
    useglobalcolormodulation
}

script emit_JOW_AUe2_DustStream01_particle 
    setemitrange width = 3.0 height = 3.0
    setlife min = 1.500 max = 2.500
    setanglespread spread = 1.0
    setspeedrange min = 0.0 max = 0.05000
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.01000 z = 0.0
    setparticlesize sw = 32.0 ew = 48.0
    setcolor sr = 77 sg = 67 sb = 57 sa = 13 mr = 84 mg = 74 mb = 62 ma = 38 er = 77 eg = 67 eb = 56 ea = 0 midTime = 0.5000
    emitrate rate = 60.0
    wait 1.0 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript

JOW_AUe2_LampSpark01_particle_params = {
    emitscript = emit_JOW_AUe2_LampSpark01_particle
    emitterindependent = 1
    max = 15
    type = FlatRibbonTail
    texture = apm_spark_03
    BlendMode = Add
    History = 4
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_AUe2_LampSpark01_particle 
    setemitrange width = 5.0 height = 5.0 depth = 0.0
    setlife min = 1.0 max = 1.500
    setanglespread spread = 0.6667
    setspeedrange min = 3.0 max = 4.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = -0.07000 z = 0.0
    setparticlesize sw = 0.5000 ew = 0.2500
    setcolor corner = 0 sr = 255 sg = 0 sb = 0 sa = 84 er = 255 eg = 192 eb = 0 ea = 0
    setcolor corner = 1 sr = 255 sg = 0 sb = 0 sa = 193 er = 255 eg = 192 eb = 0 ea = 0
    setcolor corner = 2 sr = 255 sg = 0 sb = 0 sa = 193 er = 255 eg = 192 eb = 0 ea = 0
    setcolor corner = 3 sr = 255 sg = 0 sb = 0 sa = 193 er = 255 eg = 192 eb = 0 ea = 0
    setcolor corner = 4 sr = 255 sg = 0 sb = 0 sa = 117 er = 255 eg = 192 eb = 0 ea = 0
    setcolor corner = 5 sr = 255 sg = 0 sb = 0 sa = 0 er = 255 eg = 192 eb = 0 ea = 0
    emit num = 15
    destroy ifempty = 1
endscript

JOW_AUe2_SkidMark01_particle_params = {
    emitscript = emit_JOW_AUe2_SkidMark01_particle
    emitterindependent = 1
    max = 225
    type = Shaded
    texture = JOW_AU_SkidMark01
    BlendMode = Blend
    align_to = (0.0, 1.0, 0.0)
    useglobalcolormodulation
}

script emit_JOW_AUe2_SkidMark01_particle 
    setemitrange width = 1.0 height = 1.0
    setlife min = 3.0 max = 3.0
    setanglespread spread = 0.2500
    setspeedrange min = 0.0 max = 0.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.0 z = 0.0
    setparticlesize sw = 6.0 ew = 6.0
    setcolor sr = 89 sg = 89 sb = 89 sa = 64 mr = 89 mg = 89 mb = 89 ma = 64 er = 89 eg = 89 eb = 89 ea = 0 midTime = 0.8924
    setlodparams min_particles = 0 lod_dist1 = Default_Particle_LOD_Dist1 lod_dist2 = Default_Particle_LOD_Dist2
    emitrate rate = 75.0
endscript

JOW_AUe2_StairChunks01_particle_params = {
    emitscript = emit_JOW_AUe2_StairChunks01_particle
    emitterindependent = 1
    max = 32
    type = Shaded
    texture = jow_au_chunks01
    BlendMode = Blend
    userandomuvquadrants
    useglobalcolormodulation
}

script emit_JOW_AUe2_StairChunks01_particle 
    setemitrange width = 80.0 height = 80.0
    setlife min = 1.0 max = 1.0
    setanglespread spread = 1.0
    setspeedrange min = 1.0 max = 3.0
    setemittarget x = 0.0 y = 0.7071 z = -0.7071
    setforce x = 0.0 y = -0.1000 z = 0.0
    setparticlesize sw = 8.0 ew = 8.0
    setcolor sr = 128 sg = 128 sb = 128 sa = 255 er = 128 eg = 128 eb = 128 ea = 255
    emit num = 32
    destroy ifempty = 1
endscript

JOW_AUe2_TireSmoke01_particle_params = {
    emitscript = emit_JOW_AUe2_TireSmoke01_particle
    emitterindependent = 1
    max = 60
    type = flat
    texture = dt_nj_puff01b
    BlendMode = Blend
    useglobalcolormodulation
}

script emit_JOW_AUe2_TireSmoke01_particle 
    setemitrange width = 1.0 height = 1.0
    setlife min = 1.500 max = 3.0
    setanglespread spread = 0.2500
    setspeedrange min = 0.0 max = 0.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.01000 z = 0.0
    setparticlesize sw = 12.0 ew = 64.0
    setcolor sr = 41 sg = 46 sb = 57 sa = 64 er = 42 eg = 47 eb = 57 ea = 0
    setlodparams min_particles = 0 lod_dist1 = Default_Particle_LOD_Dist1 lod_dist2 = Default_Particle_LOD_Dist2
    emitrate rate = 30.0
endscript

JOW_AUe2_WallChunks01_particle_params = {
    emitscript = emit_JOW_AUe2_WallChunks01_particle
    emitterindependent = 1
    max = 16
    type = Shaded
    texture = JOW_AU_Chunks03
    BlendMode = Blend
    userandomuvquadrants
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_AUe2_WallChunks01_particle 
    setemitrange width = 5.0 height = 5.0 depth = 0.0
    setlife min = 1.0 max = 1.0
    setanglespread spread = 1.0
    setspeedrange min = 3.0 max = 4.0
    setemittarget x = 0.0 y = 0.5000 z = 1.0
    setforce x = 0.0 y = -0.1000 z = 0.0
    setparticlesize sw = 5.0 ew = 5.0
    setcolor corner = 0 sr = 102 sg = 102 sb = 102 sa = 255 er = 102 eg = 102 eb = 102 ea = 255
    setcolor corner = 1 sr = 102 sg = 102 sb = 102 sa = 255 er = 102 eg = 102 eb = 102 ea = 255
    setcolor corner = 2 sr = 102 sg = 102 sb = 102 sa = 255 er = 102 eg = 102 eb = 102 ea = 255
    setcolor corner = 3 sr = 102 sg = 102 sb = 102 sa = 255 er = 102 eg = 102 eb = 102 ea = 255
    emit num = 16
    destroy ifempty = 1
endscript

