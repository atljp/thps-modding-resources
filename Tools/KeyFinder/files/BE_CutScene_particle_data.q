

script load_cutscene_particle_textures 
    LoadParticleTexture 'particles\apm_spark_01'
    LoadParticleTexture 'particles\apm_spark_03'
    LoadParticleTexture 'particles\apm_spray_01'
    LoadParticleTexture 'particles\dt_nj_puff01b'
    LoadParticleTexture 'particles\jow_be_chunks01'
    LoadParticleTexture 'particles\jow_be_chunks02'
endscript

JOW_BEe1_BeerSuds01_particle_params = {
    emitscript = emit_JOW_BEe1_BeerSuds01_particle
    emitterindependent = 1
    fillpath
    max = 40
    type = flat
    texture = apm_spray_01
    BlendMode = Blend
    useglobalcolormodulation
    priority = 128
}

script emit_JOW_BEe1_BeerSuds01_particle 
    setemitrange width = 4.0 height = 4.0 depth = 4.0
    setlife min = 0.2500 max = 0.2500
    setanglespread spread = 0.0
    setspeedrange min = 0.5000 max = 0.5000
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = -0.04000 z = 0.0
    setparticlesize sw = 6.0 ew = 2.0
    setcolor sr = 193 sg = 147 sb = 87 sa = 66 er = 163 eg = 158 eb = 152 ea = 0
    emitrate rate = 200.0
    wait 1.0 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript

JOW_BEe1_BeerSuds02_particle_params = {
    emitscript = emit_JOW_BEe1_BeerSuds02_particle
    emitterindependent = 1
    fillpath
    max = 100
    type = flat
    texture = apm_spray_01
    BlendMode = Blend
    useglobalcolormodulation
    priority = 128
}

script emit_JOW_BEe1_BeerSuds02_particle 
    setemitrange width = 4.0 height = 4.0 depth = 4.0
    setlife min = 0.5000 max = 0.5000
    setanglespread spread = 0.0
    setspeedrange min = 0.5000 max = 0.5000
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = -0.04000 z = 0.0
    setparticlesize sw = 5.0 ew = 2.0
    setcolor sr = 180 sg = 153 sb = 79 sa = 110 er = 180 eg = 158 eb = 117 ea = 0
    emitrate rate = 200.0
    wait 1.500 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript

JOW_BEe1_BoxDust01_particle_params = {
    boneoffset = (75.0, 0.0, 0.0)
    emitscript = emit_JOW_BEe1_BoxDust01_particle
    emitterindependent = 1
    fillpath
    max = 192
    type = flat
    texture = dt_nj_puff01b
    BlendMode = Blend
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_BEe1_BoxDust01_particle 
    setemitrange width = 192.0 height = 192.0 depth = 0.0
    setlife min = 3.0 max = 3.0
    setanglespread spread = 0.2500
    setspeedrange min = 0.0 max = 0.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.03000 z = 0.0
    setparticlesize sw = 128.0 ew = 256.0
    setcolor sr = 79 sg = 72 sb = 65 sa = 42 mr = 73 mg = 67 mb = 60 ma = 51 er = 72 eg = 65 eb = 57 ea = 0 midTime = 0.5000
    emitrate rate = 64.0
endscript

JOW_BEe1_BoxDust02_particle_params = {
    boneoffset = (75.0, 0.0, 0.0)
    emitscript = emit_JOW_BEe1_BoxDust02_particle
    emitterindependent = 1
    fillpath
    max = 120
    type = flat
    texture = dt_nj_puff01b
    BlendMode = Blend
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_BEe1_BoxDust02_particle 
    setemitrange width = 192.0 height = 192.0 depth = 0.0
    setlife min = 8.0 max = 8.0
    setanglespread spread = 0.2500
    setspeedrange min = 0.0 max = 0.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.002000 z = 0.0
    setparticlesize sw = 128.0 ew = 256.0
    setcolor sr = 79 sg = 72 sb = 65 sa = 13 mr = 73 mg = 67 mb = 60 ma = 26 er = 72 eg = 65 eb = 57 ea = 0 midTime = 0.5000
    emitrate rate = 20.0
    wait 5.700 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript

JOW_BEe1_BoxSparks01_particle_params = {
    boneoffset = (0.0, 30.0, 10.0)
    emitscript = emit_JOW_BEe1_BoxSparks01_particle
    emitterindependent = 1
    max = 128
    type = Ribbon
    texture = apm_spark_03
    BlendMode = Add
    History = 3
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_BEe1_BoxSparks01_particle 
    setemitrange width = 1.0 height = 1.0 depth = 0.0
    setlife min = 0.3000 max = 0.7500
    setanglespread spread = 0.2500
    setspeedrange min = 7.0 max = 8.0
    setemittarget x = -0.4266 y = 0.5000 z = -0.9044
    setforce x = 0.0 y = -0.1500 z = 0.0
    setparticlesize sw = 3.0 ew = 0.5000
    setcolor sr = 255 sg = 44 sb = 0 sa = 255 er = 255 eg = 192 eb = 0 ea = 0
    emitrate rate = 90.0
endscript

JOW_BEe1_BoxSparks02_particle_params = {
    boneoffset = (0.0, 30.0, 10.0)
    emitscript = emit_JOW_BEe1_BoxSparks02_particle
    max = 68
    type = Ribbon
    texture = apm_spark_03
    BlendMode = Add
    History = 3
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_BEe1_BoxSparks02_particle 
    setemitrange width = 1.0 height = 1.0 depth = 0.0
    setlife min = 0.3000 max = 0.7500
    setanglespread spread = 0.2500
    setspeedrange min = 7.0 max = 8.0
    setemittarget x = 0.8611 y = 0.5000 z = -0.5085
    setforce x = 0.0 y = -0.1500 z = 0.0
    setparticlesize sw = 3.0 ew = 0.5000
    setcolor sr = 255 sg = 44 sb = 0 sa = 255 er = 255 eg = 192 eb = 0 ea = 0
    emitrate rate = 90.0
    wait 0.2000 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript

JOW_BEe1_BoxSparks03_particle_params = {
    boneoffset = (0.0, 30.0, 10.0)
    emitscript = emit_JOW_BEe1_BoxSparks03_particle
    max = 34
    type = Ribbon
    texture = apm_spark_03
    BlendMode = Add
    History = 3
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_BEe1_BoxSparks03_particle 
    setemitrange width = 1.0 height = 1.0 depth = 0.0
    setlife min = 0.3000 max = 0.7500
    setanglespread spread = 0.2500
    setspeedrange min = 5.0 max = 6.0
    setemittarget x = 0.8611 y = 0.5000 z = -0.5085
    setforce x = 0.0 y = -0.1500 z = 0.0
    setparticlesize sw = 2.0 ew = 0.5000
    setcolor sr = 255 sg = 44 sb = 0 sa = 255 er = 255 eg = 192 eb = 0 ea = 0
    emitrate rate = 45.0
    wait 0.2000 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript

JOW_BEe1_ColumnChunks01_particle_params = {
    emitscript = emit_JOW_BEe1_ColumnChunks01_particle
    emitterindependent = 1
    max = 48
    type = Shaded
    texture = JOW_BE_Chunks02
    BlendMode = Blend
    userandomuvquadrants
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_BEe1_ColumnChunks01_particle 
    setemitrange width = 100.0 height = 5.0 depth = 0.0
    setlife min = 1.500 max = 2.0
    setanglespread spread = 0.7778
    setspeedrange min = 12.0 max = 16.0
    setemittarget x = 0.0 y = 0.0 z = 1.0
    setforce x = 0.0 y = -0.2000 z = 0.0
    setparticlesize sw = 12.0 ew = 12.0
    setcolor sr = 128 sg = 128 sb = 128 sa = 255 mr = 128 mg = 128 mb = 128 ma = 255 er = 128 eg = 128 eb = 128 ea = 0 midTime = 0.5000
    emit num = 48
    destroy ifempty = 1
endscript

JOW_BEe1_TrackChunks01_particle_params = {
    emitscript = emit_JOW_BEe1_TrackChunks01_particle
    emitterindependent = 1
    max = 30
    type = Shaded
    texture = JOW_BE_Chunks01
    BlendMode = Blend
    userandomuvquadrants
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_BEe1_TrackChunks01_particle 
    setemitrange width = 200.0 height = 1.0 depth = 0.0
    setlife min = 3.0 max = 3.0
    setanglespread spread = 0.1111
    setspeedrange min = 1.0 max = 3.0
    setemittarget x = -0.7818 y = 0.0 z = 0.6235
    setforce x = 0.0 y = -0.6000 z = 0.0
    setparticlesize sw = 20.0 ew = 20.0
    setcolor sr = 132 sg = 130 sb = 115 sa = 255 er = 132 eg = 130 eb = 115 ea = 255
    emitrate rate = 10.0
    wait 1.0 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript

JOW_BEe1_TrainDust01_particle_params = {
    emitscript = emit_JOW_BEe1_TrainDust01_particle
    emitterindependent = 1
    fillpath
    max = 180
    type = flat
    texture = dt_nj_puff01b
    BlendMode = Blend
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_BEe1_TrainDust01_particle 
    setemitrange width = 192.0 height = 192.0 depth = 0.0
    setlife min = 2.0 max = 2.0
    setanglespread spread = 0.2500
    setspeedrange min = 0.0 max = 0.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.03000 z = 0.0
    setparticlesize sw = 150.0 ew = 300.0
    setcolor sr = 79 sg = 72 sb = 65 sa = 42 mr = 73 mg = 67 mb = 60 ma = 51 er = 72 eg = 65 eb = 57 ea = 0 midTime = 0.5000
    emitrate rate = 90.0
    wait 2.0 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript

JOW_BEe1_WallChunks01_particle_params = {
    boneoffset = (-80.0, 0.0, 30.0)
    emitscript = emit_JOW_BEe1_WallChunks01_particle
    emitterindependent = 1
    max = 30
    type = Shaded
    texture = JOW_BE_Chunks01
    BlendMode = Blend
    userandomuvquadrants
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_BEe1_WallChunks01_particle 
    setemitrange width = 60.0 height = 80.0 depth = 0.0
    setlife min = 1.500 max = 2.0
    setanglespread spread = 0.6667
    setspeedrange min = 3.0 max = 3.0
    setemittarget x = 0.0 y = 0.2500 z = 1.0
    setforce x = 0.0 y = -0.2000 z = 0.0
    setparticlesize sw = 8.0 ew = 8.0
    setcolor sr = 141 sg = 126 sb = 107 sa = 255 mr = 141 mg = 126 mb = 107 ma = 255 er = 141 eg = 126 eb = 107 ea = 0 midTime = 0.5000
    emitrate rate = 15.0
    wait 1.500 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript

JOW_BEe1_WheelSparks01_particle_params = {
    boneoffset = (0.0, 30.0, 10.0)
    emitscript = emit_JOW_BEe1_WheelSparks01_particle
    max = 68
    type = Ribbon
    texture = apm_spark_03
    BlendMode = Add
    History = 5
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_BEe1_WheelSparks01_particle 
    setemitrange width = 1.0 height = 1.0 depth = 0.0
    setlife min = 0.3000 max = 0.7500
    setanglespread spread = 0.2500
    setspeedrange min = 8.0 max = 8.0
    setemittarget x = -0.2920 y = 0.5000 z = -0.9564
    setforce x = 0.0 y = -0.1500 z = 0.0
    setparticlesize sw = 5.0 ew = 1.0
    setcolor sr = 255 sg = 44 sb = 0 sa = 255 er = 255 eg = 192 eb = 0 ea = 0
    emitrate rate = 90.0
endscript

JOW_BEe1_WireSparks01_particle_params = {
    emitscript = emit_JOW_BEe1_WireSparks01_particle
    emitterindependent = 1
    max = 7
    type = flat
    texture = apm_spark_01
    BlendMode = Add
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_BEe1_WireSparks01_particle 
    setemitrange width = 5.0 height = 5.0 depth = 2.0
    setlife min = 1.200 max = 1.500
    setanglespread spread = 0.6667
    setspeedrange min = 2.0 max = 3.0
    setemittarget x = 0.0 y = -1.0 z = 0.0
    setforce x = 0.0 y = -0.04000 z = 0.0
    setparticlesize sw = 12.0 ew = 2.0
    setcolor sr = 255 sg = 143 sb = 0 sa = 255 er = 255 eg = 192 eb = 0 ea = 0
    emitrate rate = 39.0
    wait 1.500 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript

