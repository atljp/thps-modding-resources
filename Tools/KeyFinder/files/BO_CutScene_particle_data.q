

script load_cutscene_particle_textures 
    LoadParticleTexture 'particles\apm_debis_01'
    LoadParticleTexture 'particles\apm_spark_01'
    LoadParticleTexture 'particles\apm_spray_01'
    LoadParticleTexture 'particles\ba_apm_smokepuff01'
    LoadParticleTexture 'particles\ba_apm_smokepuff01s'
endscript

APM_BOc_sparklies_particle_params = {
    enablerotate
    emitscript = emit_APM_BOc_sparklies_particle
    emitterindependent = 1
    max = 128
    type = flat
    texture = apm_spark_01
    BlendMode = Add
}

script emit_APM_BOc_sparklies_particle 
    setemitrange width = 1.0 height = 1.0
    setlife min = 0.5000 max = 2.0
    setanglespread spread = 0.2500
    setspeedrange min = 4.0 max = 6.0
    setemitangle x = 90.0 y = 0.0 z = 0.0
    setforce x = 0.0 y = -0.04000 z = 0.0
    setparticlesize sw = 33.0 ew = 12.0
    setcolor sr = 255 sg = 82 sb = 46 sa = 255 er = 255 eg = 196 eb = 132 ea = 0
    emitrate rate = 128.0
    wait 1.0 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript

apm_BOc_BigSMOKE01_particle_params = {
    boneoffset = (0.0, 0.0, 400.0)
    emitscript = emit_apm_BOc_BigSMOKE01_particle
    max = 60
    type = flat
    texture = apm_spray_01
    BlendMode = Blend
    useglobalcolormodulation
}

script emit_apm_BOc_BigSMOKE01_particle 
    setemitrange width = 100.0 height = 200.0
    setlife min = 2.0 max = 6.0
    setanglespread spread = 0.2778
    setspeedrange min = 3.0 max = 3.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.01000 y = 0.01000 z = 0.0
    setparticlesize sw = 200.0 ew = 100.0
    setcolor sr = 34 sg = 39 sb = 40 sa = 0 mr = 44 mg = 44 mb = 44 ma = 255 er = 40 eg = 40 eb = 40 ea = 0 midTime = 0.2089
    emitrate rate = 60.0
    wait 1.0 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript

apm_BOc_DebrisSMOKE01_particle_params = {
    enablerotate
    emitscript = emit_apm_BOc_DebrisSMOKE01_particle
    emitterindependent = 1
    max = 60
    type = flat
    texture = apm_spray_01
    BlendMode = Blend
}

script emit_apm_BOc_DebrisSMOKE01_particle 
    setemitrange width = 10.0 height = 10.0
    setlife min = 0.5000 max = 2.0
    setanglespread spread = 0.1833
    setspeedrange min = 3.0 max = 3.0
    setforce x = 0.0 y = 0.01000 z = 0.0
    setparticlesize sw = 80.0 ew = 20.0
    setcolor sr = 28 sg = 32 sb = 33 sa = 255 mr = 44 mg = 44 mb = 44 ma = 128 er = 40 eg = 40 eb = 40 ea = 0 midTime = 0.3608
    emitrate rate = 60.0
    wait 2.700 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript

apm_BOc_cannonFire01_particle_params = {
    enablerotate
    emitscript = emit_apm_BOc_cannonFire01_particle
    max = 128
    type = flat
    texture = ba_apm_smokepuff01s
    BlendMode = Add
}

script emit_apm_BOc_cannonFire01_particle 
    setemitrange width = 1.0 height = 1.0
    setlife min = 0.2500 max = 0.5000
    setanglespread spread = 0.1167
    setspeedrange min = 9.0 max = 20.0
    setemitangle x = 0.0 y = 0.0 z = 0.0
    setforce x = 0.0 y = 0.0 z = 0.0
    setparticlesize sw = 10.0 ew = 33.0
    setcolor sr = 255 sg = 77 sb = 0 sa = 191 mr = 226 mg = 100 mb = 65 ma = 119 er = 82 eg = 86 eb = 86 ea = 0 midTime = 0.3481
    emitrate rate = 128.0
    wait 0.2000 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript

apm_BOc_cannonSmoke01_particle_params = {
    boneoffset = (10.0, 0.0, 0.0)
    enablerotate
    emitscript = emit_apm_BOc_cannonSmoke01_particle
    emitterindependent = 1
    max = 128
    type = flat
    texture = apm_spray_01
    BlendMode = Blend
    useglobalcolormodulation
}

script emit_apm_BOc_cannonSmoke01_particle 
    setemitrange width = 1.0 height = 1.0
    setlife min = 0.2000 max = 0.5000
    setanglespread spread = 0.1833
    setspeedrange min = 10.0 max = 15.0
    setforce x = 0.0 y = -0.2500 z = -0.5000
    setparticlesize sw = 20.0 ew = 75.0
    setcolor sr = 178 sg = 178 sb = 178 sa = 101 mr = 128 mg = 128 mb = 128 ma = 255 er = 82 eg = 86 eb = 86 ea = 0 midTime = 0.3354
    emitrate rate = 128.0
    wait 0.7000 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript

apm_BOc_cannonSmoke02_particle_params = {
    enablerotate
    emitscript = emit_apm_BOc_cannonSmoke02_particle
    max = 30
    type = flat
    texture = BA_APM_smokePuff01
    BlendMode = Blend
}

script emit_apm_BOc_cannonSmoke02_particle 
    setemitrange width = 10.0 height = 10.0
    setlife min = 0.5000 max = 1.0
    setanglespread spread = 0.1222
    setspeedrange min = 1.0 max = 1.0
    setforce x = 0.0 y = 0.05000 z = 0.0
    setparticlesize sw = 20.0 ew = 60.0
    setcolor sr = 138 sg = 138 sb = 138 sa = 101 mr = 134 mg = 134 mb = 134 ma = 193 er = 82 eg = 86 eb = 86 ea = 0 midTime = 0.3354
    emitrate rate = 30.0
endscript

apm_BOc_cannonSparks01_particle_params = {
    enablerotate
    emitscript = emit_apm_BOc_cannonSparks01_particle
    emitterindependent = 1
    max = 128
    type = flat
    texture = apm_spark_01
    BlendMode = Add
}

script emit_apm_BOc_cannonSparks01_particle 
    setemitrange width = 1.0 height = 1.0
    setlife min = 0.1000 max = 1.0
    setanglespread spread = 0.7111
    setspeedrange min = 5.0 max = 10.0
    setforce x = 0.0 y = -0.2500 z = 0.0
    setparticlesize sw = 10.0 ew = 5.0
    setcolor sr = 160 sg = 83 sb = 0 sa = 255 mr = 226 mg = 79 mb = 28 ma = 255 er = 86 eg = 57 eb = 35 ea = 0 midTime = 0.1076
    emit num = 128
    destroy ifempty = 1
endscript

apm_BOc_cannonballSMOKE_particle_params = {
    boneoffset = (0.0, 0.0, 20.0)
    enablerotate
    emitscript = emit_apm_BOc_cannonballSMOKE_particle
    emitterindependent = 1
    max = 60
    type = flat
    texture = apm_spray_01
    BlendMode = Blend
}

script emit_apm_BOc_cannonballSMOKE_particle 
    setemitrange width = 1.0 height = 1.0
    setlife min = 0.5000 max = 1.0
    setanglespread spread = 0.05000
    setspeedrange min = 3.0 max = 3.0
    setforce x = 0.0 y = 0.01000 z = 0.0
    setparticlesize sw = 20.0 ew = 10.0
    setcolor sr = 53 sg = 58 sb = 61 sa = 255 mr = 44 mg = 44 mb = 44 ma = 251 er = 40 eg = 40 eb = 40 ea = 0 midTime = 0.2139
    emitrate rate = 60.0
endscript

cod_potty_Debris_particle_params = {
    boneoffset = (0.0, -2.0999999046325684, 0.0)
    emitscript = emit_cod_potty_Debris_particle
    emitterindependent = 1
    max = 25
    type = Shaded
    texture = apm_debis_01
    BlendMode = Blend
    priority = 0
}

script emit_cod_potty_Debris_particle 
    setemitrange width = 10.0 height = 50.0 depth = 0.0
    setlife min = 0.2000 max = 1.0
    setanglespread spread = 0.5600
    setspeedrange min = 0.5000 max = 5.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = -0.1700 z = 0.0
    setparticlesize sw = 4.0 ew = 4.0
    setcolor corner = 0 sr = 145 sg = 126 sb = 98 sa = 255 er = 128 eg = 119 eb = 99 ea = 255
    setcolor corner = 1 sr = 145 sg = 126 sb = 98 sa = 255 er = 128 eg = 119 eb = 99 ea = 255
    setcolor corner = 2 sr = 145 sg = 126 sb = 98 sa = 255 er = 128 eg = 119 eb = 99 ea = 255
    setcolor corner = 3 sr = 145 sg = 126 sb = 98 sa = 255 er = 128 eg = 119 eb = 99 ea = 255
    ApplyEnvBrightness
    emitrate rate = 25.0
endscript

cod_potty_dust_particle_params = {
    emitscript = emit_cod_potty_dust_particle
    emitterindependent = 1
    max = 100
    type = flat
    texture = apm_spray_01
    BlendMode = Blend
    priority = 0
}

script emit_cod_potty_dust_particle 
    setemitrange width = 1.0 height = 30.0 depth = 0.0
    setlife min = 0.8000 max = 0.8000
    setanglespread spread = 0.0
    setspeedrange min = 0.0 max = 0.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.0 z = 0.0
    setparticlesize sw = 30.0 ew = 50.0
    setcolor corner = 0 sr = 75 sg = 63 sb = 48 sa = 116 mr = 77 mg = 63 mb = 47 ma = 255 er = 102 eg = 95 eb = 76 ea = 0 midTime = 0.3000
    emitrate rate = 60.0
endscript

