

script load_cutscene_particle_textures 
    LoadParticleTexture 'particles\apm_debis_01'
    LoadParticleTexture 'particles\apm_flamequad_01'
    LoadParticleTexture 'particles\apm_spark_01'
    LoadParticleTexture 'particles\apm_spray_01'
endscript

Skater_Wheel_dust01_particle_params = {
    emitscript = emit_Skater_Wheel_dust01_particle
    emitterindependent = 1
    max = 30
    type = flat
    texture = apm_spray_01
    BlendMode = Blend
    useglobalcolormodulation
}

script emit_Skater_Wheel_dust01_particle 
    setemitrange width = 1.0 height = 1.0
    setlife min = 0.1000 max = 0.5000
    setanglespread spread = 0.1222
    setspeedrange min = 0.1000 max = 2.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setemitangle x = 0.0 y = 180.0 z = 0.0
    setforce x = 0.0 y = 0.01000 z = 0.0
    setparticlesize sw = 10.0 ew = 50.0
    setcolor sr = 88 sg = 79 sb = 60 sa = 0 mr = 88 mg = 79 mb = 60 ma = 90 er = 130 eg = 117 eb = 89 ea = 0 midTime = 0.3000
    ApplyEnvBrightness always_update
    emitrate rate = 60.0
endscript

VAN_Wheel_Bitz01_particle_params = {
    enablerotate
    emitscript = emit_VAN_Wheel_Bitz01_particle
    emitterindependent = 1
    max = 50
    type = flat
    texture = apm_debis_01
    BlendMode = Blend
    useglobalcolormodulation
}

script emit_VAN_Wheel_Bitz01_particle 
    setemitrange width = 1.0 height = 1.0
    setlife min = 0.1000 max = 1.0
    setanglespread spread = 0.2444
    setspeedrange min = 7.0 max = 10.0
    setemitangle x = 310.0 y = 0.0 z = 0.0
    setforce x = 0.0 y = -0.5000 z = 0.0
    setparticlesize sw = 10.0 ew = 10.0
    setcolor sr = 88 sg = 79 sb = 60 sa = 0 mr = 46 mg = 45 mb = 43 ma = 255 er = 79 eg = 77 eb = 73 ea = 110 midTime = 0.5000
    emitrate rate = 50.0
endscript

VAN_Wheel_dust01_particle_params = {
    enablerotate
    emitscript = emit_VAN_Wheel_dust01_particle
    emitterindependent = 1
    max = 128
    type = flat
    texture = apm_spray_01
    BlendMode = Blend
    useglobalcolormodulation
}

script emit_VAN_Wheel_dust01_particle 
    setemitrange width = 1.0 height = 1.0
    setlife min = 0.1000 max = 0.5000
    setanglespread spread = 0.1222
    setspeedrange min = 1.0 max = 5.0
    setforce x = 0.0 y = 0.01000 z = 0.0
    setparticlesize sw = 10.0 ew = 50.0
    setcolor sr = 88 sg = 79 sb = 60 sa = 0 mr = 88 mg = 79 mb = 60 ma = 99 er = 132 eg = 119 eb = 90 ea = 0 midTime = 0.3000
    ApplyEnvBrightness always_update
    emitrate rate = 128.0
endscript

apm_TESTc_fire01_particle_params = {
    emitscript = emit_apm_TESTc_fire01_particle
    emitterindependent = 1
    max = 83
    type = Shaded
    texture = apm_flamequad_01
    BlendMode = Add
    userandomuvquadrants
    useglobalcolormodulation
}

script emit_apm_TESTc_fire01_particle 
    setemitrange width = 4.0 height = 4.0
    setcircularemit circular = 1
    setlife min = 0.2000 max = 0.6500
    setanglespread spread = 0.1222
    setspeedrange min = 1.0 max = 2.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.05000 z = 0.0
    setparticlesize sw = 18.0 ew = 2.0
    setcolor sr = 255 sg = 94 sb = 50 sa = 187 mr = 240 mg = 98 mb = 48 ma = 255 er = 154 eg = 47 eb = 31 ea = 0 midTime = 0.5000
    emitrate rate = 128.0
endscript

apm_TRc_flare01_particle_params = {
    boneoffset = (0.0, 0.0, -7.0)
    enablerotate
    angles = (0.0, 5.0, 0.0)
    emitscript = emit_apm_TRc_flare01_particle
    emitterindependent = 1
    max = 64
    type = flat
    texture = apm_spray_01
    BlendMode = Blend
}

script emit_apm_TRc_flare01_particle 
    setemitrange width = 1.0 height = 1.0
    setlife min = 0.5000 max = 1.0
    setanglespread spread = 0.1222
    setspeedrange min = 0.01000 max = 0.1000
    setforce x = 0.0 y = 0.1000 z = 0.0
    setparticlesize sw = 2.0 ew = 10.0
    setcolor sr = 255 sg = 85 sb = 50 sa = 83 mr = 154 mg = 145 mb = 139 ma = 216 er = 103 eg = 101 eb = 99 ea = 0 midTime = 0.6203
    emitrate rate = 64.0
endscript

apm_TRc_flare02_particle_params = {
    boneoffset = (0.0, 0.0, -7.0)
    enablerotate
    angles = (0.0, 5.0, 0.0)
    emitscript = emit_apm_TRc_flare02_particle
    emitterindependent = 1
    max = 50
    type = flat
    texture = apm_spark_01
    BlendMode = Add
    useglobalcolormodulation
}

script emit_apm_TRc_flare02_particle 
    setemitrange width = 1.0 height = 1.0
    setcircularemit circular = 1
    setlife min = 0.1000 max = 0.2000
    setanglespread spread = 0.7111
    setspeedrange min = 0.1000 max = 1.0
    setforce x = 0.0 y = 0.0 z = 0.0
    setparticlesize sw = 5.0 ew = 3.0
    setcolor sr = 255 sg = 99 sb = 99 sa = 255 mr = 255 mg = 50 mb = 50 ma = 202 er = 255 eg = 85 eb = 50 ea = 83 midTime = 0.3000
    emitrate rate = 128.0
endscript

apm_trc_stuffin01_particle_params = {
    boneoffset = (-10.0, 0.0, 0.0)
    enablerotate
    angles = (1.5, 0.0, 0.0)
    emitscript = emit_apm_trc_stuffin01_particle
    max = 128
    type = flat
    texture = apm_debis_01
    BlendMode = Blend
}

script emit_apm_trc_stuffin01_particle 
    setemitrange width = 1.0 height = 1.0
    setlife min = 0.2000 max = 0.3000
    setanglespread spread = 0.3667
    setspeedrange min = 3.0 max = 3.0
    setforce x = 0.0 y = 0.05000 z = 0.0
    setparticlesize sw = 2.0 ew = 2.0
    setcolor sr = 130 sg = 117 sb = 117 sa = 255 mr = 167 mg = 160 mb = 157 ma = 255 er = 79 eg = 71 eb = 71 ea = 0 midTime = 0.5000
    emitrate rate = 128.0
endscript

