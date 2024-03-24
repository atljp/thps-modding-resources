

script load_cutscene_particle_textures 
    LoadParticleTexture 'particles\apm_spark_03'
    LoadParticleTexture 'particles\dt_browndot02'
    LoadParticleTexture 'particles\dt_nj_puff01b'
    LoadParticleTexture 'particles\jow_au_skidmark01'
    LoadParticleTexture 'particles\jow_ba_chunks01'
    LoadParticleTexture 'particles\jow_ba_trash01'
    LoadParticleTexture 'particles\jow_ba_trash02'
endscript

JOW_BAe1_BullDirt01_particle_params = {
    emitscript = emit_JOW_BAe1_BullDirt01_particle
    emitterindependent = 1
    max = 6
    type = flat
    texture = dt_browndot02
    BlendMode = Blend
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_BAe1_BullDirt01_particle 
    setemitrange width = 3.0 height = 3.0 depth = 0.0
    setlife min = 1.0 max = 1.0
    setanglespread spread = 0.5000
    setspeedrange min = 0.7000 max = 1.200
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = -0.04000 z = 0.0
    setparticlesize sw = 3.0 ew = 3.0
    setcolor corner = 0 sr = 79 sg = 75 sb = 72 sa = 134 er = 66 eg = 62 eb = 57 ea = 0
    emit num = 6
    destroy ifempty = 1
endscript

JOW_BAe1_BullDust01_particle_params = {
    emitscript = emit_JOW_BAe1_BullDust01_particle
    emitterindependent = 1
    max = 6
    type = flat
    texture = dt_nj_puff01b
    BlendMode = Blend
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_BAe1_BullDust01_particle 
    setemitrange width = 10.0 height = 10.0 depth = 0.0
    setlife min = 3.0 max = 3.0
    setanglespread spread = 0.2500
    setspeedrange min = 0.0 max = 0.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.002000 z = 0.0
    setparticlesize sw = 16.0 ew = 42.0
    setcolor corner = 0 sr = 56 sg = 52 sb = 46 sa = 38 mr = 59 mg = 54 mb = 48 ma = 51 er = 66 eg = 59 eb = 51 ea = 0 midTime = 0.3038
    emit num = 6
    destroy ifempty = 1
endscript

JOW_BAe1_CarDust01_particle_params = {
    boneoffset = (0.0, 0.0, 15.0)
    emitscript = emit_JOW_BAe1_CarDust01_particle
    emitterindependent = 1
    max = 40
    type = flat
    texture = dt_nj_puff01b
    BlendMode = Blend
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_BAe1_CarDust01_particle 
    setemitrange width = 10.0 height = 10.0 depth = 0.0
    setlife min = 4.0 max = 4.0
    setanglespread spread = 0.2500
    setspeedrange min = 0.0 max = 0.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.002000 z = 0.0
    setparticlesize sw = 48.0 ew = 96.0
    setcolor corner = 0 sr = 70 sg = 64 sb = 58 sa = 61 mr = 68 mg = 63 mb = 56 ma = 39 er = 66 eg = 59 eb = 51 ea = 0 midTime = 0.5000
    emitrate rate = 10.0
    wait 1.0 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript

JOW_BAe1_CarSpark01_particle_params = {
    emitscript = emit_JOW_BAe1_CarSpark01_particle
    emitterindependent = 1
    max = 24
    type = FlatRibbonTail
    texture = apm_spark_03
    BlendMode = Add
    History = 4
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_BAe1_CarSpark01_particle 
    setemitrange width = 15.0 height = 15.0 depth = 0.0
    setlife min = 1.0 max = 1.0
    setanglespread spread = 1.0
    setspeedrange min = 1.250 max = 2.0
    setemittarget x = -0.7702 y = 0.2500 z = -0.6378
    setforce x = 0.0 y = -0.04000 z = 0.0
    setparticlesize sw = 0.6000 ew = 0.1500
    setcolor corner = 0 sr = 255 sg = 0 sb = 0 sa = 163 er = 255 eg = 192 eb = 0 ea = 0
    setcolor corner = 1 sr = 255 sg = 0 sb = 0 sa = 163 er = 255 eg = 192 eb = 0 ea = 0
    setcolor corner = 2 sr = 255 sg = 0 sb = 0 sa = 163 er = 255 eg = 192 eb = 0 ea = 0
    setcolor corner = 3 sr = 255 sg = 0 sb = 0 sa = 106 er = 255 eg = 192 eb = 0 ea = 0
    setcolor corner = 4 sr = 255 sg = 0 sb = 0 sa = 48 er = 255 eg = 192 eb = 0 ea = 0
    setcolor corner = 5 sr = 255 sg = 0 sb = 0 sa = 0 er = 255 eg = 192 eb = 0 ea = 0
    emit num = 24
    destroy ifempty = 1
endscript

JOW_BAe1_CarSteam01_particle_params = {
    emitscript = emit_JOW_BAe1_CarSteam01_particle
    emitterindependent = 1
    fillpath
    max = 256
    type = flat
    texture = dt_nj_puff01b
    BlendMode = Blend
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_BAe1_CarSteam01_particle 
    setemitrange width = 1.0 height = 1.0 depth = 0.0
    setlife min = 2.0 max = 2.0
    setanglespread spread = 0.1111
    setspeedrange min = 2.0 max = 4.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.0 z = 0.0
    setparticlesize sw = 6.0 ew = 32.0
    setcolor corner = 0 sr = 125 sg = 125 sb = 125 sa = 0 mr = 147 mg = 147 mb = 147 ma = 51 er = 154 eg = 154 eb = 154 ea = 0 midTime = 0.2089
    emitrate rate = 128.0
    wait 2.500 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript

JOW_BAe1_ChimneyChunks01_particle_params = {
    emitscript = emit_JOW_BAe1_ChimneyChunks01_particle
    emitterindependent = 1
    max = 128
    type = Shaded
    texture = JOW_BA_Chunks01
    BlendMode = Blend
    userandomuvquadrants
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_BAe1_ChimneyChunks01_particle 
    setemitrange width = 0.0 height = 800.0 depth = 0.0
    setlife min = 2.0 max = 2.0
    setanglespread spread = 0.6700
    setspeedrange min = 0.5000 max = 12.0
    setemittarget x = -1.0 y = 0.3500 z = 0.02000
    setforce x = 0.0 y = -0.1000 z = 0.0
    setparticlesize sw = 8.0 ew = 8.0
    setcolor corner = 0 sr = 140 sg = 140 sb = 140 sa = 255 er = 140 eg = 140 eb = 140 ea = 0
    setcolor corner = 1 sr = 140 sg = 140 sb = 140 sa = 255 er = 140 eg = 140 eb = 140 ea = 0
    setcolor corner = 2 sr = 140 sg = 140 sb = 140 sa = 255 er = 140 eg = 140 eb = 140 ea = 0
    setcolor corner = 3 sr = 140 sg = 140 sb = 140 sa = 255 er = 140 eg = 140 eb = 140 ea = 0
    emit num = 128
    destroy ifempty = 1
endscript

JOW_BAe1_SkidMark01_particle_params = {
    emitscript = emit_JOW_BAe1_SkidMark01_particle
    emitterindependent = 1
    max = 225
    type = Shaded
    texture = JOW_AU_SkidMark01
    BlendMode = Blend
    align_to = (0.0, 1.0, 0.0)
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_BAe1_SkidMark01_particle 
    setemitrange width = 1.0 height = 1.0 depth = 0.0
    setlife min = 3.0 max = 3.0
    setanglespread spread = 0.2500
    setspeedrange min = 0.0 max = 0.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.0 z = 0.0
    setparticlesize sw = 6.0 ew = 6.0
    setcolor corner = 0 sr = 89 sg = 89 sb = 89 sa = 64 mr = 89 mg = 89 mb = 89 ma = 64 er = 89 eg = 89 eb = 89 ea = 0 midTime = 0.8924
    setcolor corner = 1 sr = 89 sg = 89 sb = 89 sa = 64 mr = 89 mg = 89 mb = 89 ma = 64 er = 89 eg = 89 eb = 89 ea = 0 midTime = 0.8924
    setcolor corner = 2 sr = 89 sg = 89 sb = 89 sa = 64 mr = 89 mg = 89 mb = 89 ma = 64 er = 89 eg = 89 eb = 89 ea = 0 midTime = 0.8924
    setcolor corner = 3 sr = 89 sg = 89 sb = 89 sa = 64 mr = 89 mg = 89 mb = 89 ma = 64 er = 89 eg = 89 eb = 89 ea = 0 midTime = 0.8924
    emitrate rate = 75.0
    wait 1.0 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript

JOW_BAe1_TireSmoke01_particle_params = {
    emitscript = emit_JOW_BAe1_TireSmoke01_particle
    emitterindependent = 1
    max = 90
    type = flat
    texture = dt_nj_puff01b
    BlendMode = Blend
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_BAe1_TireSmoke01_particle 
    setemitrange width = 1.0 height = 1.0 depth = 0.0
    setlife min = 3.0 max = 3.0
    setanglespread spread = 0.2500
    setspeedrange min = 0.0 max = 0.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.01000 z = 0.0
    setparticlesize sw = 12.0 ew = 64.0
    setcolor corner = 0 sr = 41 sg = 46 sb = 57 sa = 26 er = 42 eg = 47 eb = 57 ea = 0
    emitrate rate = 30.0
    wait 2.0 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript

JOW_BAe1_Trash01_particle_params = {
    enablerotate
    emitscript = emit_JOW_BAe1_Trash01_particle
    max = 60
    type = Shaded
    texture = JOW_BA_Trash01
    BlendMode = Blend
    userandomuvquadrants
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_BAe1_Trash01_particle 
    setemitrange width = 80.0 height = 20.0 depth = 20.0
    setlife min = 1.0 max = 1.0
    setanglespread spread = 0.0
    setspeedrange min = 1.0 max = 3.0
    setforce x = 0.0 y = -0.1000 z = 0.0
    setparticlesize sw = 12.0 ew = 12.0
    setcolor corner = 0 sr = 66 sg = 68 sb = 77 sa = 255 mr = 66 mg = 68 mb = 77 ma = 255 er = 66 eg = 68 eb = 77 ea = 0 midTime = 0.5000
    setcolor corner = 1 sr = 66 sg = 68 sb = 77 sa = 255 mr = 66 mg = 68 mb = 77 ma = 255 er = 66 eg = 68 eb = 77 ea = 0 midTime = 0.5000
    setcolor corner = 2 sr = 66 sg = 68 sb = 77 sa = 255 mr = 66 mg = 68 mb = 77 ma = 255 er = 66 eg = 68 eb = 77 ea = 0 midTime = 0.5000
    setcolor corner = 3 sr = 66 sg = 68 sb = 77 sa = 255 mr = 66 mg = 68 mb = 77 ma = 255 er = 66 eg = 68 eb = 77 ea = 0 midTime = 0.5000
    emitrate rate = 60.0
    wait 0.3000 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript

JOW_BAe1_Trash02_particle_params = {
    emitscript = emit_JOW_BAe1_Trash02_particle
    emitterindependent = 1
    max = 24
    type = Shaded
    texture = JOW_BA_Trash02
    BlendMode = Blend
    userandomuvquadrants
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_BAe1_Trash02_particle 
    setemitrange width = 20.0 height = 40.0 depth = 20.0
    setlife min = 1.0 max = 1.0
    setanglespread spread = 0.2500
    setspeedrange min = 2.0 max = 4.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = -0.1000 z = 0.0
    setparticlesize sw = 6.0 ew = 6.0
    setcolor corner = 0 sr = 66 sg = 68 sb = 77 sa = 255 mr = 66 mg = 68 mb = 77 ma = 255 er = 66 eg = 68 eb = 77 ea = 0 midTime = 0.5000
    setcolor corner = 1 sr = 66 sg = 68 sb = 77 sa = 255 mr = 66 mg = 68 mb = 77 ma = 255 er = 66 eg = 68 eb = 77 ea = 0 midTime = 0.5000
    setcolor corner = 2 sr = 66 sg = 68 sb = 77 sa = 255 mr = 66 mg = 68 mb = 77 ma = 255 er = 66 eg = 68 eb = 77 ea = 0 midTime = 0.5000
    setcolor corner = 3 sr = 66 sg = 68 sb = 77 sa = 255 mr = 66 mg = 68 mb = 77 ma = 255 er = 66 eg = 68 eb = 77 ea = 0 midTime = 0.5000
    emit num = 24
    destroy ifempty = 1
endscript

JOW_BAe1_WallChunks01_particle_params = {
    emitscript = emit_JOW_BAe1_WallChunks01_particle
    emitterindependent = 1
    max = 24
    type = Shaded
    texture = JOW_BA_Chunks01
    BlendMode = Blend
    userandomuvquadrants
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_BAe1_WallChunks01_particle 
    setemitrange width = 10.0 height = 10.0 depth = 0.0
    setlife min = 2.0 max = 2.0
    setanglespread spread = 0.6667
    setspeedrange min = 0.5000 max = 4.0
    setemittarget x = 0.0 y = 0.2500 z = 1.0
    setforce x = 0.0 y = -0.1000 z = 0.0
    setparticlesize sw = 5.0 ew = 5.0
    setcolor corner = 0 sr = 140 sg = 140 sb = 140 sa = 255 er = 140 eg = 140 eb = 140 ea = 0
    setcolor corner = 1 sr = 140 sg = 140 sb = 140 sa = 255 er = 140 eg = 140 eb = 140 ea = 0
    setcolor corner = 2 sr = 140 sg = 140 sb = 140 sa = 255 er = 140 eg = 140 eb = 140 ea = 0
    setcolor corner = 3 sr = 140 sg = 140 sb = 140 sa = 255 er = 140 eg = 140 eb = 140 ea = 0
    emit num = 24
    destroy ifempty = 1
endscript

