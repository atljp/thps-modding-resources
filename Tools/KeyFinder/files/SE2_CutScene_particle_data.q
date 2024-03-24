

script load_cutscene_particle_textures 
    LoadParticleTexture 'particles\dt_nj_puff01b'
    LoadParticleTexture 'particles\jow_sc_star01'
    LoadParticleTexture 'particles\jow_se2_dirt01'
    LoadParticleTexture 'particles\jow_se2_qpchunks01'
    LoadParticleTexture 'particles\jow_se2_qpchunks02'
    LoadParticleTexture 'particles\jow_se2_redmetal01'
endscript

JOW_SE2e1_MissileFire01_particle_params = {
    enablerotate
    emitscript = emit_JOW_SE2e1_MissileFire01_particle
    emitterindependent = 1
    fillpath
    max = 256
    type = flat
    texture = dt_nj_puff01b
    BlendMode = Blend
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_SE2e1_MissileFire01_particle 
    setemitrange width = 3.0 height = 3.0 depth = 3.0
    setlife min = 1.0 max = 1.0
    setanglespread spread = 0.08000
    setspeedrange min = 8.0 max = 8.0
    setforce x = 0.0 y = 0.04000 z = 0.0
    setparticlesize sw = 12.0 ew = 48.0
    setcolor corner = 0 sr = 255 sg = 88 sb = 0 sa = 132 mr = 42 mg = 42 mb = 42 ma = 92 er = 42 eg = 42 eb = 42 ea = 0 midTime = 0.1600
    emitrate rate = 256.0
    wait 2.400 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript

JOW_SE2e1_MissileFire02_particle_params = {
    enablerotate
    emitscript = emit_JOW_SE2e1_MissileFire02_particle
    emitterindependent = 1
    fillpath
    max = 256
    type = flat
    texture = dt_nj_puff01b
    BlendMode = Blend
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_SE2e1_MissileFire02_particle 
    setemitrange width = 3.0 height = 3.0 depth = 3.0
    setlife min = 1.0 max = 1.0
    setanglespread spread = 0.08000
    setspeedrange min = 8.0 max = 8.0
    setforce x = 0.0 y = 0.04000 z = 0.0
    setparticlesize sw = 12.0 ew = 48.0
    setcolor corner = 0 sr = 255 sg = 88 sb = 0 sa = 132 mr = 42 mg = 42 mb = 42 ma = 92 er = 42 eg = 42 eb = 42 ea = 0 midTime = 0.1600
    emitrate rate = 256.0
    wait 3.900 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript

JOW_SE2e1_MissileFire03_particle_params = {
    enablerotate
    emitscript = emit_JOW_SE2e1_MissileFire03_particle
    emitterindependent = 1
    fillpath
    max = 256
    type = flat
    texture = dt_nj_puff01b
    BlendMode = Blend
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_SE2e1_MissileFire03_particle 
    setemitrange width = 3.0 height = 3.0 depth = 3.0
    setlife min = 1.0 max = 1.0
    setanglespread spread = 0.08000
    setspeedrange min = 8.0 max = 8.0
    setforce x = 0.0 y = 0.04000 z = 0.0
    setparticlesize sw = 12.0 ew = 48.0
    setcolor corner = 0 sr = 255 sg = 88 sb = 0 sa = 132 mr = 42 mg = 42 mb = 42 ma = 92 er = 42 eg = 42 eb = 42 ea = 0 midTime = 0.1600
    emitrate rate = 256.0
    wait 4.850 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript

JOW_SE2e1_QPChunks01_particle_params = {
    emitscript = emit_JOW_SE2e1_QPChunks01_particle
    max = 48
    type = Shaded
    texture = JOW_SE2_QPChunks01
    BlendMode = Blend
    userandomuvquadrants
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_SE2e1_QPChunks01_particle 
    setemitrange width = 200.0 height = 200.0 depth = 0.0
    setlife min = 2.0 max = 2.0
    setanglespread spread = 1.0
    setspeedrange min = 4.0 max = 16.0
    setemittarget x = 0.9200 y = 0.8000 z = 0.3900
    setforce x = 0.0 y = -0.1000 z = 0.0
    setparticlesize sw = 24.0 ew = 24.0
    setcolor corner = 0 sr = 115 sg = 115 sb = 115 sa = 255 er = 115 eg = 115 eb = 115 ea = 255
    setcolor corner = 1 sr = 115 sg = 115 sb = 115 sa = 255 er = 115 eg = 115 eb = 115 ea = 255
    setcolor corner = 2 sr = 115 sg = 115 sb = 115 sa = 255 er = 115 eg = 115 eb = 115 ea = 255
    setcolor corner = 3 sr = 115 sg = 115 sb = 115 sa = 255 er = 115 eg = 115 eb = 115 ea = 255
    emit num = 48
    destroy ifempty = 1
endscript

JOW_SE2e1_QPChunks02_particle_params = {
    emitscript = emit_JOW_SE2e1_QPChunks02_particle
    max = 48
    type = Shaded
    texture = JOW_SE2_QPChunks02
    BlendMode = Blend
    userandomuvquadrants
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_SE2e1_QPChunks02_particle 
    setemitrange width = 200.0 height = 200.0 depth = 0.0
    setlife min = 2.0 max = 2.0
    setanglespread spread = 1.0
    setspeedrange min = 4.0 max = 16.0
    setemittarget x = 0.9200 y = 0.8000 z = 0.3900
    setforce x = 0.0 y = -0.1000 z = 0.0
    setparticlesize sw = 12.0 ew = 12.0
    setcolor corner = 0 sr = 140 sg = 140 sb = 140 sa = 255 er = 140 eg = 140 eb = 140 ea = 255
    setcolor corner = 1 sr = 140 sg = 140 sb = 140 sa = 255 er = 140 eg = 140 eb = 140 ea = 255
    setcolor corner = 2 sr = 140 sg = 140 sb = 140 sa = 255 er = 140 eg = 140 eb = 140 ea = 255
    setcolor corner = 3 sr = 140 sg = 140 sb = 140 sa = 255 er = 140 eg = 140 eb = 140 ea = 255
    emit num = 48
    destroy ifempty = 1
endscript

JOW_SE2e1_QPStars01_particle_params = {
    emitscript = emit_JOW_SE2e1_QPStars01_particle
    max = 48
    type = FlatRibbonTail
    texture = JOW_SC_Star01
    BlendMode = Blend
    History = 6
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_SE2e1_QPStars01_particle 
    setemitrange width = 200.0 height = 200.0 depth = 0.0
    setlife min = 2.0 max = 2.0
    setanglespread spread = 1.0
    setspeedrange min = 4.0 max = 16.0
    setemittarget x = 0.9200 y = 0.8000 z = 0.3900
    setforce x = 0.0 y = -0.1000 z = 0.0
    setparticlesize sw = 2.0 ew = 1.0
    setcolor corner = 0 sr = 255 sg = 121 sb = 0 sa = 51 er = 255 eg = 121 eb = 0 ea = 0
    setcolor corner = 1 sr = 255 sg = 121 sb = 0 sa = 180 er = 255 eg = 121 eb = 0 ea = 0
    setcolor corner = 2 sr = 255 sg = 121 sb = 0 sa = 180 er = 255 eg = 121 eb = 0 ea = 0
    setcolor corner = 3 sr = 255 sg = 121 sb = 0 sa = 180 er = 255 eg = 121 eb = 0 ea = 0
    setcolor corner = 4 sr = 255 sg = 121 sb = 0 sa = 180 er = 255 eg = 121 eb = 0 ea = 0
    setcolor corner = 5 sr = 255 sg = 121 sb = 0 sa = 106 er = 255 eg = 121 eb = 0 ea = 0
    setcolor corner = 6 sr = 255 sg = 121 sb = 0 sa = 59 er = 255 eg = 121 eb = 0 ea = 0
    setcolor corner = 7 sr = 255 sg = 121 sb = 0 sa = 0 er = 255 eg = 121 eb = 0 ea = 0
    emit num = 48
    destroy ifempty = 1
endscript

JOW_SE2e1_TunnelDirt01_particle_params = {
    emitscript = emit_JOW_SE2e1_TunnelDirt01_particle
    max = 40
    type = Shaded
    texture = JOW_SE2_Dirt01
    BlendMode = Blend
    userandomuvquadrants
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_SE2e1_TunnelDirt01_particle 
    setemitrange width = 200.0 height = 200.0 depth = 0.0
    setlife min = 2.0 max = 2.0
    setanglespread spread = 1.0
    setspeedrange min = 2.0 max = 14.0
    setemittarget x = -0.3500 y = 0.5000 z = 0.9400
    setforce x = 0.0 y = -0.1000 z = 0.0
    setparticlesize sw = 36.0 ew = 36.0
    setcolor corner = 0 sr = 153 sg = 153 sb = 153 sa = 255 er = 153 eg = 153 eb = 153 ea = 255
    setcolor corner = 1 sr = 153 sg = 153 sb = 153 sa = 255 er = 153 eg = 153 eb = 153 ea = 255
    setcolor corner = 2 sr = 153 sg = 153 sb = 153 sa = 255 er = 153 eg = 153 eb = 153 ea = 255
    setcolor corner = 3 sr = 153 sg = 153 sb = 153 sa = 255 er = 153 eg = 153 eb = 153 ea = 255
    emit num = 40
    destroy ifempty = 1
endscript

JOW_SE2e1_TunnelDirt02_particle_params = {
    emitscript = emit_JOW_SE2e1_TunnelDirt02_particle
    max = 40
    type = Shaded
    texture = JOW_SE2_Dirt01
    BlendMode = Blend
    userandomuvquadrants
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_SE2e1_TunnelDirt02_particle 
    setemitrange width = 200.0 height = 200.0 depth = 0.0
    setlife min = 2.0 max = 2.0
    setanglespread spread = 1.0
    setspeedrange min = 2.0 max = 14.0
    setemittarget x = -0.3500 y = 0.5000 z = 0.9400
    setforce x = 0.0 y = -0.1000 z = 0.0
    setparticlesize sw = 36.0 ew = 36.0
    setcolor corner = 0 sr = 153 sg = 153 sb = 153 sa = 255 er = 153 eg = 153 eb = 153 ea = 255
    setcolor corner = 1 sr = 153 sg = 153 sb = 153 sa = 255 er = 153 eg = 153 eb = 153 ea = 255
    setcolor corner = 2 sr = 153 sg = 153 sb = 153 sa = 255 er = 153 eg = 153 eb = 153 ea = 255
    setcolor corner = 3 sr = 153 sg = 153 sb = 153 sa = 255 er = 153 eg = 153 eb = 153 ea = 255
    emit num = 40
    destroy ifempty = 1
endscript

JOW_SE2e1_TunnelMetal01_particle_params = {
    emitscript = emit_JOW_SE2e1_TunnelMetal01_particle
    max = 16
    type = Shaded
    texture = JOW_SE2_RedMetal01
    BlendMode = Blend
    userandomuvquadrants
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_SE2e1_TunnelMetal01_particle 
    setemitrange width = 200.0 height = 200.0 depth = 0.0
    setlife min = 2.0 max = 2.0
    setanglespread spread = 1.0
    setspeedrange min = 4.0 max = 16.0
    setemittarget x = -0.3500 y = 0.5000 z = 0.9400
    setforce x = 0.0 y = -0.1000 z = 0.0
    setparticlesize sw = 20.0 ew = 20.0
    setcolor corner = 0 sr = 114 sg = 114 sb = 114 sa = 255 er = 114 eg = 114 eb = 114 ea = 255
    setcolor corner = 1 sr = 114 sg = 114 sb = 114 sa = 255 er = 114 eg = 114 eb = 114 ea = 255
    setcolor corner = 2 sr = 114 sg = 114 sb = 114 sa = 255 er = 114 eg = 114 eb = 114 ea = 255
    setcolor corner = 3 sr = 114 sg = 114 sb = 114 sa = 255 er = 114 eg = 114 eb = 114 ea = 255
    emit num = 16
    destroy ifempty = 1
endscript

JOW_SE2e1_TunnelMetal02_particle_params = {
    emitscript = emit_JOW_SE2e1_TunnelMetal02_particle
    max = 16
    type = Shaded
    texture = JOW_SE2_RedMetal01
    BlendMode = Blend
    userandomuvquadrants
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_SE2e1_TunnelMetal02_particle 
    setemitrange width = 200.0 height = 200.0 depth = 0.0
    setlife min = 2.0 max = 2.0
    setanglespread spread = 1.0
    setspeedrange min = 4.0 max = 16.0
    setemittarget x = -0.3700 y = 0.5000 z = 0.9300
    setforce x = 0.0 y = -0.1000 z = 0.0
    setparticlesize sw = 20.0 ew = 20.0
    setcolor corner = 0 sr = 114 sg = 114 sb = 114 sa = 255 er = 114 eg = 114 eb = 114 ea = 255
    setcolor corner = 1 sr = 114 sg = 114 sb = 114 sa = 255 er = 114 eg = 114 eb = 114 ea = 255
    setcolor corner = 2 sr = 114 sg = 114 sb = 114 sa = 255 er = 114 eg = 114 eb = 114 ea = 255
    setcolor corner = 3 sr = 114 sg = 114 sb = 114 sa = 255 er = 114 eg = 114 eb = 114 ea = 255
    emit num = 16
    destroy ifempty = 1
endscript

JOW_SE2e1_TunnelStars01_particle_params = {
    emitscript = emit_JOW_SE2e1_TunnelStars01_particle
    max = 48
    type = FlatRibbonTail
    texture = JOW_SC_Star01
    BlendMode = Blend
    History = 6
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_SE2e1_TunnelStars01_particle 
    setemitrange width = 200.0 height = 200.0 depth = 0.0
    setlife min = 2.0 max = 2.0
    setanglespread spread = 1.0
    setspeedrange min = 4.0 max = 16.0
    setemittarget x = -0.3500 y = 0.5000 z = 0.9400
    setforce x = 0.0 y = -0.1000 z = 0.0
    setparticlesize sw = 2.0 ew = 1.0
    setcolor corner = 0 sr = 255 sg = 121 sb = 0 sa = 51 er = 255 eg = 121 eb = 0 ea = 0
    setcolor corner = 1 sr = 255 sg = 121 sb = 0 sa = 180 er = 255 eg = 121 eb = 0 ea = 0
    setcolor corner = 2 sr = 255 sg = 121 sb = 0 sa = 180 er = 255 eg = 121 eb = 0 ea = 0
    setcolor corner = 3 sr = 255 sg = 121 sb = 0 sa = 180 er = 255 eg = 121 eb = 0 ea = 0
    setcolor corner = 4 sr = 255 sg = 121 sb = 0 sa = 180 er = 255 eg = 121 eb = 0 ea = 0
    setcolor corner = 5 sr = 255 sg = 121 sb = 0 sa = 106 er = 255 eg = 121 eb = 0 ea = 0
    setcolor corner = 6 sr = 255 sg = 121 sb = 0 sa = 59 er = 255 eg = 121 eb = 0 ea = 0
    setcolor corner = 7 sr = 255 sg = 121 sb = 0 sa = 0 er = 255 eg = 121 eb = 0 ea = 0
    emit num = 48
    destroy ifempty = 1
endscript

JOW_SE2e1_TunnelStars02_particle_params = {
    emitscript = emit_JOW_SE2e1_TunnelStars02_particle
    max = 48
    type = FlatRibbonTail
    texture = JOW_SC_Star01
    BlendMode = Blend
    History = 6
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_SE2e1_TunnelStars02_particle 
    setemitrange width = 200.0 height = 200.0 depth = 0.0
    setlife min = 2.0 max = 2.0
    setanglespread spread = 1.0
    setspeedrange min = 4.0 max = 16.0
    setemittarget x = -0.3300 y = 0.5000 z = 0.9400
    setforce x = 0.0 y = -0.1000 z = 0.0
    setparticlesize sw = 2.0 ew = 1.0
    setcolor corner = 0 sr = 255 sg = 121 sb = 0 sa = 51 er = 255 eg = 121 eb = 0 ea = 0
    setcolor corner = 1 sr = 255 sg = 121 sb = 0 sa = 180 er = 255 eg = 121 eb = 0 ea = 0
    setcolor corner = 2 sr = 255 sg = 121 sb = 0 sa = 180 er = 255 eg = 121 eb = 0 ea = 0
    setcolor corner = 3 sr = 255 sg = 121 sb = 0 sa = 180 er = 255 eg = 121 eb = 0 ea = 0
    setcolor corner = 4 sr = 255 sg = 121 sb = 0 sa = 180 er = 255 eg = 121 eb = 0 ea = 0
    setcolor corner = 5 sr = 255 sg = 121 sb = 0 sa = 106 er = 255 eg = 121 eb = 0 ea = 0
    setcolor corner = 6 sr = 255 sg = 121 sb = 0 sa = 59 er = 255 eg = 121 eb = 0 ea = 0
    setcolor corner = 7 sr = 255 sg = 121 sb = 0 sa = 0 er = 255 eg = 121 eb = 0 ea = 0
    emit num = 48
    destroy ifempty = 1
endscript

