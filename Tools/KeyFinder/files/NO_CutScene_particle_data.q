

script load_cutscene_particle_textures 
    LoadParticleTexture 'particles\apm_flame_01'
    LoadParticleTexture 'particles\apm_flamequad_01'
    LoadParticleTexture 'particles\dt_choochoosmoke01c'
    LoadParticleTexture 'particles\dt_generic_flame01'
    LoadParticleTexture 'particles\jow_au_skidmark01'
    LoadParticleTexture 'particles\jow_no_burst01'
    LoadParticleTexture 'particles\jow_no_cauldronring01'
    LoadParticleTexture 'particles\jow_no_drops01'
endscript

JOW_NOe1_CauldronBurst02_particle_params = {
    boneoffset = (0.0, 0.0, -30.0)
    emitscript = emit_JOW_NOe1_CauldronBurst02_particle
    emitterindependent = 1
    max = 128
    type = FlatRibbonTail
    texture = JOW_NO_Burst01
    BlendMode = Add
    History = 3
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_NOe1_CauldronBurst02_particle 
    setemitrange width = 32.0 height = 32.0 depth = 0.0
    setlife min = 1.0 max = 1.500
    setanglespread spread = 0.6667
    setspeedrange min = 20.0 max = 24.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = -0.3200 z = 0.0
    setparticlesize sw = 3.0 ew = 1.0
    setcolor corner = 0 sr = 255 sg = 77 sb = 0 sa = 106 mr = 255 mg = 64 mb = 0 ma = 130 er = 255 eg = 192 eb = 0 ea = 0 midTime = 0.5000
    setcolor corner = 1 sr = 255 sg = 77 sb = 0 sa = 106 mr = 255 mg = 64 mb = 0 ma = 130 er = 255 eg = 192 eb = 0 ea = 0 midTime = 0.5000
    setcolor corner = 2 sr = 255 sg = 77 sb = 0 sa = 106 mr = 255 mg = 64 mb = 0 ma = 130 er = 255 eg = 192 eb = 0 ea = 0 midTime = 0.5000
    setcolor corner = 3 sr = 255 sg = 77 sb = 0 sa = 90 mr = 255 mg = 64 mb = 0 ma = 106 er = 255 eg = 192 eb = 0 ea = 0 midTime = 0.5000
    setcolor corner = 4 sr = 255 sg = 77 sb = 0 sa = 0 mr = 255 mg = 64 mb = 0 ma = 0 er = 255 eg = 192 eb = 0 ea = 0 midTime = 0.5000
    emit num = 128
    destroy ifempty = 1
endscript

JOW_NOe1_CauldronRings01_particle_params = {
    emitscript = emit_JOW_NOe1_CauldronRings01_particle
    max = 16
    type = Shaded
    texture = JOW_NO_CauldronRing01
    BlendMode = Blend
    align_to = (0.0, 1.0, 0.0)
    useglobalcolormodulation
    priority = 128
}

script emit_JOW_NOe1_CauldronRings01_particle 
    setemitrange width = 90.0 height = 90.0 depth = 0.0
    setcircularemit circular = 1
    setlife min = 1.0 max = 2.0
    setanglespread spread = 0.0
    setspeedrange min = 0.0 max = 0.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.0 z = 0.0
    setparticlesize sw = 4.0 ew = 16.0
    setcolor corner = 0 sr = 138 sg = 138 sb = 138 sa = 0 mr = 138 mg = 138 mb = 138 ma = 112 er = 132 eg = 132 eb = 132 ea = 0 midTime = 0.5000
    setcolor corner = 1 sr = 138 sg = 138 sb = 138 sa = 0 mr = 138 mg = 138 mb = 138 ma = 112 er = 132 eg = 132 eb = 132 ea = 0 midTime = 0.5000
    setcolor corner = 2 sr = 138 sg = 138 sb = 138 sa = 0 mr = 138 mg = 138 mb = 138 ma = 112 er = 132 eg = 132 eb = 132 ea = 0 midTime = 0.5000
    setcolor corner = 3 sr = 138 sg = 138 sb = 138 sa = 0 mr = 138 mg = 138 mb = 138 ma = 112 er = 132 eg = 132 eb = 132 ea = 0 midTime = 0.5000
    emitrate rate = 8.0
    wait 20.0 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript

JOW_NOe1_SkidMark01_particle_params = {
    emitscript = emit_JOW_NOe1_SkidMark01_particle
    emitterindependent = 1
    max = 225
    type = Shaded
    texture = JOW_AU_SkidMark01
    BlendMode = Blend
    align_to = (0.0, 1.0, 0.0)
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_NOe1_SkidMark01_particle 
    setemitrange width = 1.0 height = 1.0 depth = 0.0
    setlife min = 3.0 max = 3.0
    setanglespread spread = 0.2500
    setspeedrange min = 0.0 max = 0.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.0 z = 0.0
    setparticlesize sw = 6.0 ew = 6.0
    setcolor corner = 0 sr = 89 sg = 89 sb = 89 sa = 89 mr = 89 mg = 89 mb = 89 ma = 89 er = 89 eg = 89 eb = 89 ea = 0 midTime = 0.8900
    setcolor corner = 1 sr = 89 sg = 89 sb = 89 sa = 89 mr = 89 mg = 89 mb = 89 ma = 89 er = 89 eg = 89 eb = 89 ea = 0 midTime = 0.8900
    setcolor corner = 2 sr = 89 sg = 89 sb = 89 sa = 89 mr = 89 mg = 89 mb = 89 ma = 89 er = 89 eg = 89 eb = 89 ea = 0 midTime = 0.8900
    setcolor corner = 3 sr = 89 sg = 89 sb = 89 sa = 89 mr = 89 mg = 89 mb = 89 ma = 89 er = 89 eg = 89 eb = 89 ea = 0 midTime = 0.8900
    setlodparams min_particles = 0 lod_dist1 = Default_Particle_LOD_Dist1 lod_dist2 = Default_Particle_LOD_Dist2
    emitrate rate = 75.0
    wait 0.8000 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript

JOW_NOe1_SkullBurstDown01_particle_params = {
    emitscript = emit_JOW_NOe1_SkullBurstDown01_particle
    max = 16
    type = Ribbon
    texture = dt_generic_flame01
    BlendMode = Add
    History = 4
    priority = 0
}

script emit_JOW_NOe1_SkullBurstDown01_particle 
    setemitrange width = 6.0 height = 6.0 depth = 0.0
    setlife min = 0.2000 max = 0.5000
    setanglespread spread = 1.0
    setspeedrange min = 8.0 max = 12.0
    setemittarget x = 0.0 y = -1.0 z = 0.0
    setforce x = 0.0 y = 0.0 z = 0.0
    setparticlesize sw = 12.0 ew = 0.0
    setcolor corner = 0 sr = 255 sg = 68 sb = 68 sa = 211 er = 114 eg = 17 eb = 0 ea = 0
    setcolor corner = 1 sr = 255 sg = 68 sb = 68 sa = 211 er = 114 eg = 17 eb = 0 ea = 0
    emit num = 16
    destroy ifempty = 1
endscript

JOW_NOe1_SkullBurstUp01_particle_params = {
    emitscript = emit_JOW_NOe1_SkullBurstUp01_particle
    max = 16
    type = Ribbon
    texture = dt_generic_flame01
    BlendMode = Add
    History = 4
    priority = 0
}

script emit_JOW_NOe1_SkullBurstUp01_particle 
    setemitrange width = 6.0 height = 6.0 depth = 0.0
    setlife min = 0.2000 max = 0.5000
    setanglespread spread = 1.0
    setspeedrange min = 8.0 max = 12.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.0 z = 0.0
    setparticlesize sw = 12.0 ew = 0.0
    setcolor corner = 0 sr = 255 sg = 68 sb = 68 sa = 211 er = 114 eg = 17 eb = 0 ea = 0
    setcolor corner = 1 sr = 255 sg = 68 sb = 68 sa = 211 er = 114 eg = 17 eb = 0 ea = 0
    emit num = 16
    destroy ifempty = 1
endscript

JOW_NOe1_SkullFlames01_particle_params = {
    emitscript = emit_JOW_NOe1_SkullFlames01_particle
    emitterindependent = 1
    fillpath
    max = 30
    type = Shaded
    texture = apm_flamequad_01
    BlendMode = Blend
    userandomuvquadrants
    priority = 0
}

script emit_JOW_NOe1_SkullFlames01_particle 
    setemitrange width = 3.0 height = 3.0 depth = 0.0
    setlife min = 0.1500 max = 0.1500
    setanglespread spread = -0.1100
    setspeedrange min = 2.0 max = 3.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.0 z = 0.0
    setparticlesize sw = 10.0 ew = 0.0
    setcolor corner = 0 sr = 191 sg = 152 sb = 43 sa = 153 mr = 209 mg = 67 mb = 6 ma = 204 er = 114 eg = 17 eb = 0 ea = 0 midTime = 0.3100
    setcolor corner = 1 sr = 191 sg = 152 sb = 43 sa = 153 mr = 209 mg = 67 mb = 6 ma = 204 er = 114 eg = 17 eb = 0 ea = 0 midTime = 0.3100
    setcolor corner = 2 sr = 191 sg = 152 sb = 43 sa = 153 mr = 209 mg = 67 mb = 6 ma = 204 er = 114 eg = 17 eb = 0 ea = 0 midTime = 0.3100
    setcolor corner = 3 sr = 191 sg = 152 sb = 43 sa = 153 mr = 209 mg = 67 mb = 6 ma = 204 er = 114 eg = 17 eb = 0 ea = 0 midTime = 0.3100
    emitrate rate = 200.0
endscript

JOW_NOe1_SkullFlames02_particle_params = {
    emitscript = emit_JOW_NOe1_SkullFlames02_particle
    max = 24
    type = Shaded
    texture = apm_flamequad_01
    BlendMode = Blend
    userandomuvquadrants
    priority = 0
}

script emit_JOW_NOe1_SkullFlames02_particle 
    setemitrange width = 3.0 height = 3.0 depth = 0.0
    setlife min = 0.1500 max = 0.1500
    setanglespread spread = -0.1100
    setspeedrange min = 2.0 max = 3.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.0 z = 0.0
    setparticlesize sw = 10.0 ew = 0.0
    setcolor corner = 0 sr = 191 sg = 152 sb = 43 sa = 153 mr = 209 mg = 67 mb = 6 ma = 204 er = 114 eg = 17 eb = 0 ea = 0 midTime = 0.3100
    setcolor corner = 1 sr = 191 sg = 152 sb = 43 sa = 153 mr = 209 mg = 67 mb = 6 ma = 204 er = 114 eg = 17 eb = 0 ea = 0 midTime = 0.3100
    setcolor corner = 2 sr = 191 sg = 152 sb = 43 sa = 153 mr = 209 mg = 67 mb = 6 ma = 204 er = 114 eg = 17 eb = 0 ea = 0 midTime = 0.3100
    setcolor corner = 3 sr = 191 sg = 152 sb = 43 sa = 153 mr = 209 mg = 67 mb = 6 ma = 204 er = 114 eg = 17 eb = 0 ea = 0 midTime = 0.3100
    emitrate rate = 160.0
endscript

JOW_NOe1_ZombieBurst01_particle_params = {
    boneoffset = (0.0, 0.0, 40.0)
    emitscript = emit_JOW_NOe1_ZombieBurst01_particle
    emitterindependent = 1
    max = 16
    type = Ribbon
    texture = apm_flame_01
    BlendMode = Add
    History = 3
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_NOe1_ZombieBurst01_particle 
    setemitrange width = 4.0 height = 4.0 depth = 0.0
    setlife min = 0.2000 max = 0.5000
    setanglespread spread = 1.0
    setspeedrange min = 8.0 max = 12.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.0 z = 0.0
    setparticlesize sw = 24.0 ew = 0.0
    setcolor corner = 0 sr = 255 sg = 192 sb = 0 sa = 172 mr = 255 mg = 88 mb = 0 ma = 172 er = 255 eg = 192 eb = 0 ea = 40 midTime = 0.5000
    setcolor corner = 1 sr = 255 sg = 192 sb = 0 sa = 172 mr = 255 mg = 88 mb = 0 ma = 172 er = 255 eg = 192 eb = 0 ea = 40 midTime = 0.5000
    emit num = 16
    destroy ifempty = 1
endscript

JOW_NOe1_ZombieBurst02_particle_params = {
    boneoffset = (0.0, 0.0, 40.0)
    emitscript = emit_JOW_NOe1_ZombieBurst02_particle
    emitterindependent = 1
    max = 16
    type = Ribbon
    texture = apm_flame_01
    BlendMode = Add
    History = 3
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_NOe1_ZombieBurst02_particle 
    setemitrange width = 4.0 height = 4.0 depth = 0.0
    setlife min = 0.2000 max = 0.5000
    setanglespread spread = 1.0
    setspeedrange min = 8.0 max = 12.0
    setemittarget x = 0.0 y = -1.0 z = 0.0
    setforce x = 0.0 y = 0.0 z = 0.0
    setparticlesize sw = 24.0 ew = 0.0
    setcolor corner = 0 sr = 255 sg = 192 sb = 0 sa = 172 mr = 255 mg = 88 mb = 0 ma = 172 er = 255 eg = 192 eb = 0 ea = 40 midTime = 0.5000
    setcolor corner = 1 sr = 255 sg = 192 sb = 0 sa = 172 mr = 255 mg = 88 mb = 0 ma = 172 er = 255 eg = 192 eb = 0 ea = 40 midTime = 0.5000
    emit num = 16
    destroy ifempty = 1
endscript

JOW_NOe2_LaserBurst01_particle_params = {
    emitscript = emit_JOW_NOe2_LaserBurst01_particle
    emitterindependent = 1
    max = 32
    type = FlatRibbonTail
    texture = JOW_NO_Burst01
    BlendMode = Add
    History = 3
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_NOe2_LaserBurst01_particle 
    setemitrange width = 1.0 height = 1.0 depth = 0.0
    setlife min = 1.0 max = 2.0
    setanglespread spread = 1.0
    setspeedrange min = 10.0 max = 12.0
    setemittarget x = 0.0 y = 0.0 z = 1.0
    setforce x = 0.0 y = -0.04000 z = 0.0
    setparticlesize sw = 1.200 ew = 0.5000
    setcolor corner = 0 sr = 134 sg = 221 sb = 255 sa = 119 er = 156 eg = 255 eb = 253 ea = 0
    setcolor corner = 1 sr = 134 sg = 221 sb = 255 sa = 92 er = 156 eg = 255 eb = 253 ea = 0
    setcolor corner = 2 sr = 178 sg = 234 sb = 255 sa = 61 er = 178 eg = 255 eb = 253 ea = 0
    setcolor corner = 3 sr = 204 sg = 241 sb = 255 sa = 31 er = 204 eg = 255 eb = 254 ea = 0
    setcolor corner = 4 sr = 255 sg = 255 sb = 255 sa = 0 er = 255 eg = 255 eb = 255 ea = 0
    setlodparams min_particles = 0 lod_dist1 = Default_Particle_LOD_Dist1 lod_dist2 = Default_Particle_LOD_Dist2
    emit num = 32
    destroy ifempty = 1
endscript

JOW_NOe2_Smoke01_particle_params = {
    boneoffset = (0.0, 0.0, 60.0)
    emitscript = emit_JOW_NOe2_Smoke01_particle
    emitterindependent = 1
    fillpath
    max = 30
    type = flat
    texture = dt_choochoosmoke01c
    BlendMode = Blend
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_NOe2_Smoke01_particle 
    setemitrange width = 5.0 height = 5.0 depth = 0.0
    setlife min = 0.3000 max = 0.3000
    setanglespread spread = 0.1667
    setspeedrange min = 0.0 max = 0.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.1250 z = 0.0
    setparticlesize sw = 32.0 ew = 48.0
    setcolor corner = 0 sr = 77 sg = 77 sb = 77 sa = 18 er = 62 eg = 62 eb = 62 ea = 0
    emitrate rate = 100.0
    wait 2.500 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript

JOW_NOe2_Smoke02_particle_params = {
    emitscript = emit_JOW_NOe2_Smoke02_particle
    emitterindependent = 1
    fillpath
    max = 30
    type = flat
    texture = dt_choochoosmoke01c
    BlendMode = Blend
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_NOe2_Smoke02_particle 
    setemitrange width = 5.0 height = 5.0 depth = 0.0
    setlife min = 0.3000 max = 0.3000
    setanglespread spread = 0.1667
    setspeedrange min = 0.0 max = 0.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.1250 z = 0.0
    setparticlesize sw = 32.0 ew = 48.0
    setcolor corner = 0 sr = 77 sg = 77 sb = 77 sa = 18 er = 62 eg = 62 eb = 62 ea = 0
    emitrate rate = 100.0
    wait 2.0 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript

JOW_NOe2_Splash01_particle_params = {
    boneoffset = (0.0, 0.0, -20.0)
    emitscript = emit_JOW_NOe2_Splash01_particle
    emitterindependent = 1
    max = 32
    type = Ribbon
    texture = JOW_NO_Drops01
    BlendMode = Blend
    History = 4
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_NOe2_Splash01_particle 
    setemitrange width = 5.0 height = 5.0 depth = 0.0
    setlife min = 0.9000 max = 1.200
    setanglespread spread = 0.2222
    setspeedrange min = 10.0 max = 12.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = -0.4000 z = 0.0
    setparticlesize sw = 12.0 ew = 8.0
    setcolor corner = 0 sr = 128 sg = 128 sb = 128 sa = 0 mr = 128 mg = 128 mb = 128 ma = 255 er = 112 eg = 112 eb = 112 ea = 0 midTime = 0.5759
    setcolor corner = 1 sr = 128 sg = 128 sb = 128 sa = 0 mr = 128 mg = 128 mb = 128 ma = 255 er = 112 eg = 112 eb = 112 ea = 0 midTime = 0.5759
    emit num = 32
    destroy ifempty = 1
endscript

JOW_NOe2_Splash02_particle_params = {
    emitscript = emit_JOW_NOe2_Splash02_particle
    emitterindependent = 1
    max = 72
    type = Ribbon
    texture = JOW_NO_Drops01
    BlendMode = Blend
    History = 6
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_NOe2_Splash02_particle 
    setemitrange width = 4.0 height = 4.0 depth = 0.0
    setlife min = 0.1000 max = 0.2000
    setanglespread spread = 0.1667
    setspeedrange min = 15.0 max = 15.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.0 z = 0.0
    setparticlesize sw = 12.0 ew = 8.0
    setcolor corner = 0 sr = 128 sg = 128 sb = 128 sa = 255 er = 112 eg = 112 eb = 112 ea = 0
    setcolor corner = 1 sr = 128 sg = 128 sb = 128 sa = 255 er = 112 eg = 112 eb = 112 ea = 0
    emitrate rate = 360.0
    wait 0.2000 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript

