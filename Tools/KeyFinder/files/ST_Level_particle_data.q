

script load_level_particle_textures 
    LoadParticleTexture 'particles\apm_quadfeathers'
    LoadParticleTexture 'particles\apm_ring_02'
    LoadParticleTexture 'particles\apm_spark_01'
    LoadParticleTexture 'particles\apm_splinters_01'
    LoadParticleTexture 'particles\apm_spray_01'
    LoadParticleTexture 'particles\ba_apm_smokepuff01s'
endscript

apm_ST_BigSMOKE01_particle_params = {
    boneoffset = (0.0, 200.0, 0.0)
    enablerotate
    emitscript = emit_apm_ST_BigSMOKE01_particle
    max = 90
    type = flat
    texture = apm_spray_01
    BlendMode = Blend
    useglobalcolormodulation
    priority = 0
}

script emit_apm_ST_BigSMOKE01_particle 
    setemitrange width = 5.0 height = 100.0 depth = 500.0
    setlife min = 2.0 max = 3.0
    setanglespread spread = 0.2778
    setspeedrange min = 3.0 max = 3.0
    setforce x = 0.01000 y = 0.03000 z = 0.0
    setparticlesize sw = 200.0 ew = 100.0
    setcolor corner = 0 sr = 34 sg = 39 sb = 40 sa = 0 mr = 44 mg = 44 mb = 44 ma = 255 er = 40 eg = 40 eb = 40 ea = 0 midTime = 0.2089
    emitrate rate = 30.0
endscript

apm_ST_Bigsplash01_particle_params = {
    boneoffset = (0.0, 20.0, 0.0)
    emitscript = emit_apm_ST_Bigsplash01_particle
    fillpath
    max = 45
    type = Shaded
    texture = apm_ring_02
    BlendMode = Blend
    align_to = (0.0, 1.0, 0.0)
    useglobalcolormodulation
    priority = 0
}

script emit_apm_ST_Bigsplash01_particle 
    setemitrange width = 20.0 height = 20.0 depth = 0.0
    setlife min = 0.1000 max = 0.5000
    setanglespread spread = 1.0
    setspeedrange min = 8.0 max = 8.0
    setemittarget x = 0.0 y = 0.0 z = 0.0
    setforce x = 0.0 y = 0.01000 z = 0.0
    setparticlesize sw = 10.0 ew = 200.0
    setcolor corner = 0 sr = 83 sg = 74 sb = 70 sa = 0 mr = 161 mg = 161 mb = 161 ma = 255 er = 161 eg = 161 eb = 161 ea = 0 midTime = 0.4100
    setcolor corner = 1 sr = 83 sg = 74 sb = 70 sa = 0 mr = 161 mg = 161 mb = 161 ma = 255 er = 161 eg = 161 eb = 161 ea = 0 midTime = 0.4100
    setcolor corner = 2 sr = 83 sg = 74 sb = 70 sa = 0 mr = 161 mg = 161 mb = 161 ma = 255 er = 161 eg = 161 eb = 161 ea = 0 midTime = 0.4100
    setcolor corner = 3 sr = 83 sg = 74 sb = 70 sa = 0 mr = 161 mg = 161 mb = 161 ma = 255 er = 161 eg = 161 eb = 161 ea = 0 midTime = 0.4100
    emitrate rate = 90.0
    wait 0.1000 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript

apm_ST_Boardsmoke_particle_params = {
    bone = Bone_Board_Root
    boneoffset = (0.0, 15.0, 0.0)
    emitscript = emit_apm_ST_Boardsmoke_particle
    emitterindependent = 1
    fillpath
    max = 24
    type = flat
    texture = apm_spray_01
    BlendMode = Blend
    useglobalcolormodulation
    priority = 0
}

script emit_apm_ST_Boardsmoke_particle 
    setemitrange width = 1.0 height = 1.0 depth = 0.0
    setlife min = 0.3000 max = 0.8000
    setanglespread spread = 0.1200
    setspeedrange min = 1.0 max = 3.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.03000 z = 0.0
    setparticlesize sw = 10.0 ew = 20.0
    setcolor corner = 0 sr = 41 sg = 46 sb = 48 sa = 125 mr = 31 mg = 31 mb = 31 ma = 251 er = 40 eg = 40 eb = 40 ea = 0 midTime = 0.2000
    emitrate rate = 30.0
endscript

apm_ST_CarDust01_particle_params = {
    emitscript = emit_apm_ST_CarDust01_particle
    emitterindependent = 1
    fillpath
    updatescript = align_scale_to_vel_update
    params = {
        bone = None
        update_pos = 0
        emit_offset = (0.0, 0.5, 0.0)
        emit_scale = -1.0
        pos_offset = (0.0, -2.0, 0.0)
        base_vel = 800.0
        min_vel_range = 0.1000
        max_vel_range = 0.1000
        base_emit_rate = 60
    }
    max = 15
    type = flat
    texture = apm_spray_01
    BlendMode = Blend
    useglobalcolormodulation
    priority = 0
}

script emit_apm_ST_CarDust01_particle 
    setemitrange width = 60.0 height = 60.0 depth = 0.0
    setlife min = 0.5000 max = 0.5000
    setanglespread spread = 0.2800
    setspeedrange min = 0.1000 max = 0.1000
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.05000 z = 0.0
    setparticlesize sw = 75.0 ew = 100.0
    setcolor corner = 0 sr = 62 sg = 52 sb = 43 sa = 138 mr = 88 mg = 80 mb = 73 ma = 227 er = 89 eg = 74 eb = 62 ea = 0 midTime = 0.5000
    emitrate rate = 30.0
endscript

apm_ST_Frietrail01_particle_params = {
    boneoffset = (0.0, 33.0, 0.0)
    enablerotate
    emitscript = emit_apm_ST_Frietrail01_particle
    emitterindependent = 1
    fillpath
    max = 30
    type = flat
    texture = apm_spark_01
    BlendMode = Add
    priority = 1
}

script emit_apm_ST_Frietrail01_particle 
    setemitrange width = 10.0 height = 30.0 depth = 10.0
    setlife min = 0.1000 max = 0.5000
    setanglespread spread = 0.7100
    setspeedrange min = 3.0 max = 3.0
    setemitangle x = 0.0 y = 3.0 z = 0.0
    setforce x = 0.0 y = 0.0 z = 0.0
    setparticlesize sw = 10.0 ew = 5.0
    setcolor corner = 0 sr = 218 sg = 98 sb = 22 sa = 255 mr = 218 mg = 56 mb = 22 ma = 255 er = 218 eg = 39 eb = 22 ea = 0 midTime = 0.5000
    emitrate rate = 60.0
    wait 1.500 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript

apm_ST_NATAS4Trees_particle_params = {
    emitscript = emit_apm_ST_NATAS4Trees_particle
    emitterindependent = 1
    fillpath
    max = 15
    type = Ribbon
    texture = apm_splinters_01
    BlendMode = Blend
    History = 3
    useglobalcolormodulation
    update_brightness
    priority = 0
}

script emit_apm_ST_NATAS4Trees_particle 
    setemitrange width = 10.0 height = 10.0 depth = 10.0
    setlife min = 0.4000 max = 0.6000
    setanglespread spread = 0.7100
    setspeedrange min = 5.0 max = 5.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = -0.5000 z = 0.0
    setparticlesize sw = 15.0 ew = 20.0
    setcolor corner = 0 sr = 64 sg = 55 sb = 49 sa = 0 mr = 86 mg = 80 mb = 76 ma = 213 er = 86 eg = 79 eb = 75 ea = 0 midTime = 0.3000
    setcolor corner = 1 sr = 64 sg = 55 sb = 49 sa = 0 mr = 86 mg = 80 mb = 76 ma = 213 er = 86 eg = 79 eb = 75 ea = 0 midTime = 0.3000
    emitrate rate = 30.0
endscript

apm_ST_OILYsmoke_ZIP2_particle_params = {
    boneoffset = (-6.0, 20.0, -12.0)
    emitscript = emit_apm_ST_OILYsmoke_ZIP2_particle
    emitterindependent = 1
    fillpath
    max = 24
    type = flat
    texture = apm_spray_01
    BlendMode = Blend
    useglobalcolormodulation
    priority = 0
    suspenddistance = Default_Particle_Suspend_Dist
}

script emit_apm_ST_OILYsmoke_ZIP2_particle 
    setemitrange width = 1.0 height = 1.0 depth = 0.0
    setlife min = 0.3000 max = 0.8000
    setanglespread spread = 0.1222
    setspeedrange min = 1.0 max = 3.0
    setemittarget x = 0.0 y = -1.0 z = 0.0
    setforce x = 0.0 y = 0.1000 z = 0.0
    setparticlesize sw = 10.0 ew = 20.0
    setcolor corner = 0 sr = 41 sg = 46 sb = 48 sa = 125 mr = 31 mg = 31 mb = 31 ma = 251 er = 40 eg = 40 eb = 40 ea = 0 midTime = 0.2000
    setlodparams min_particles = 0 lod_dist1 = Default_Particle_LOD_Dist1 lod_dist2 = Default_Particle_LOD_Dist2
    emitrate rate = 30.0
endscript

apm_ST_OILYsmoke_ZIP_particle_params = {
    boneoffset = (0.0, -6.0, 35.0)
    emitscript = emit_apm_ST_OILYsmoke_ZIP_particle
    emitterindependent = 1
    fillpath
    max = 24
    type = flat
    texture = apm_spray_01
    BlendMode = Blend
    useglobalcolormodulation
    priority = 0
    suspenddistance = Default_Particle_Suspend_Dist
}

script emit_apm_ST_OILYsmoke_ZIP_particle 
    setemitrange width = 1.0 height = 1.0 depth = 0.0
    setlife min = 0.3000 max = 0.8000
    setanglespread spread = 0.1222
    setspeedrange min = 1.0 max = 3.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.02000 z = 0.0
    setparticlesize sw = 10.0 ew = 20.0
    setcolor corner = 0 sr = 41 sg = 46 sb = 48 sa = 125 mr = 31 mg = 31 mb = 31 ma = 251 er = 40 eg = 40 eb = 40 ea = 0 midTime = 0.2000
    setlodparams min_particles = 0 lod_dist1 = Default_Particle_LOD_Dist1 lod_dist2 = Default_Particle_LOD_Dist2
    emitrate rate = 30.0
endscript

apm_ST_Rocket_trail01_particle_params = {
    enablerotate
    emitscript = emit_apm_ST_Rocket_trail01_particle
    emitterindependent = 1
    fillpath
    max = 60
    type = flat
    texture = ba_apm_smokepuff01s
    BlendMode = Blend
    useglobalcolormodulation
    priority = 0
}

script emit_apm_ST_Rocket_trail01_particle 
    setemitrange width = 0.0 height = 0.0 depth = 10.0
    setlife min = 2.0 max = 2.0
    setanglespread spread = 0.07000
    setspeedrange min = 5.0 max = 5.0
    setemitangle x = 10.0 y = 0.0 z = 0.0
    setforce x = 0.0 y = 0.02000 z = 0.0
    setparticlesize sw = 10.0 ew = 50.0
    setcolor corner = 0 sr = 88 sg = 40 sb = 9 sa = 147 mr = 50 mg = 50 mb = 51 ma = 216 er = 108 eg = 106 eb = 106 ea = 0 midTime = 0.1000
    emitrate rate = 30.0
endscript

apm_ST_Rocket_trail02_particle_params = {
    enablerotate
    emitscript = emit_apm_ST_Rocket_trail02_particle
    max = 45
    type = flat
    texture = apm_spark_01
    BlendMode = Add
    priority = 0
}

script emit_apm_ST_Rocket_trail02_particle 
    setemitrange width = 0.0 height = 0.0 depth = 10.0
    setlife min = 0.5000 max = 0.7500
    setanglespread spread = 0.3700
    setspeedrange min = 12.0 max = 12.0
    setemitangle x = 10.0 y = 0.0 z = 0.0
    setforce x = 0.0 y = -0.05000 z = 0.0
    setparticlesize sw = 50.0 ew = 0.0
    setcolor corner = 0 sr = 231 sg = 71 sb = 38 sa = 255 mr = 150 mg = 62 mb = 15 ma = 255 er = 88 eg = 40 eb = 9 ea = 0 midTime = 0.1000
    emitrate rate = 60.0
endscript

apm_ST_Sooty01_particle_params = {
    id = skater
    bone = Bone_Pelvis
    enablerotate
    emitscript = emit_apm_ST_Sooty01_particle
    emitterindependent = 1
    max = 33
    type = flat
    texture = ba_apm_smokepuff01s
    BlendMode = Blend
    useglobalcolormodulation
    priority = 0
}

script emit_apm_ST_Sooty01_particle 
    setemitrange width = 10.0 height = 10.0 depth = 33.0
    setlife min = 0.5000 max = 0.5000
    setanglespread spread = 0.2500
    setspeedrange min = 0.1000 max = 0.1000
    setforce x = 0.0 y = 0.05000 z = 0.0
    setparticlesize sw = 15.0 ew = 5.0
    setcolor corner = 0 sr = 32 sg = 38 sb = 42 sa = 95 mr = 37 mg = 40 mb = 40 ma = 165 er = 16 eg = 16 eb = 17 ea = 0 midTime = 0.4600
    emitrate rate = 66.0
endscript

apm_ST_chickenBLAST01_particle_params = {
    boneoffset = (0.0, 33.0, 0.0)
    enablerotate
    emitscript = emit_apm_ST_chickenBLAST01_particle
    fillpath
    max = 180
    type = Shaded
    texture = apm_QUADfeathers
    BlendMode = Blend
    userandomuvquadrants
    useglobalcolormodulation
    priority = 0
}

script emit_apm_ST_chickenBLAST01_particle 
    setemitrange width = 10.0 height = 30.0 depth = 10.0
    setlife min = 1.0 max = 1.0
    setanglespread spread = 0.7111
    setspeedrange min = 4.0 max = 6.0
    setemitangle x = 340.0 y = 0.0 z = 0.0
    setforce x = 0.5000 y = -0.07000 z = -0.4000
    setparticlesize sw = 4.0 ew = 3.0
    setcolor corner = 0 sr = 125 sg = 127 sb = 128 sa = 198 mr = 198 mg = 201 mb = 202 ma = 97 er = 149 eg = 150 eb = 150 ea = 57 midTime = 0.5000
    setcolor corner = 1 sr = 125 sg = 127 sb = 128 sa = 198 mr = 198 mg = 201 mb = 202 ma = 97 er = 149 eg = 150 eb = 150 ea = 57 midTime = 0.5000
    setcolor corner = 2 sr = 125 sg = 127 sb = 128 sa = 198 mr = 198 mg = 201 mb = 202 ma = 97 er = 149 eg = 150 eb = 150 ea = 57 midTime = 0.5000
    setcolor corner = 3 sr = 125 sg = 127 sb = 128 sa = 198 mr = 198 mg = 201 mb = 202 ma = 97 er = 149 eg = 150 eb = 150 ea = 57 midTime = 0.5000
    setlodparams min_particles = 0 lod_dist1 = Default_Particle_LOD_Dist1 lod_dist2 = Default_Particle_LOD_Dist2
    emitrate rate = 180.0
    wait 0.5000 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript

apm_ST_smoketrail01_particle_params = {
    boneoffset = (0.0, 33.0, 0.0)
    emitscript = emit_apm_ST_smoketrail01_particle
    emitterindependent = 1
    fillpath
    max = 15
    type = flat
    texture = ba_apm_smokepuff01s
    BlendMode = Blend
    useglobalcolormodulation
    priority = 0
}

script emit_apm_ST_smoketrail01_particle 
    setemitrange width = 10.0 height = 10.0 depth = 10.0
    setlife min = 0.4000 max = 0.6000
    setanglespread spread = 0.1800
    setspeedrange min = 3.300 max = 4.700
    setemittarget x = 0.0 y = 0.0 z = -1.0
    setforce x = 0.0 y = 0.0 z = 0.0
    setparticlesize sw = 30.0 ew = 20.0
    setcolor corner = 0 sr = 86 sg = 39 sb = 9 sa = 0 mr = 22 mg = 20 mb = 19 ma = 255 er = 18 eg = 17 eb = 17 ea = 0 midTime = 0.3000
    emitrate rate = 30.0
    wait 2.0 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript

apm_ST_spinner01_particle_params = {
    enablerotate
    emitscript = emit_apm_ST_spinner01_particle
    emitterindependent = 1
    fillpath
    max = 8
    type = flat
    texture = apm_spark_01
    BlendMode = Add
    priority = 1
}

script emit_apm_ST_spinner01_particle 
    setemitrange width = 0.0 height = 0.0 depth = 0.0
    setlife min = 0.1000 max = 1.0
    setanglespread spread = 0.2400
    setspeedrange min = 3.0 max = 7.0
    setforce x = 0.0 y = -0.5000 z = 0.0
    setparticlesize sw = 55.0 ew = 5.0
    setcolor corner = 0 sr = 218 sg = 98 sb = 22 sa = 255 mr = 218 mg = 22 mb = 22 ma = 154 er = 218 eg = 0 eb = 0 ea = 0 midTime = 0.5000
    emitrate rate = 32.0
endscript

apm_ST_spinner01s_particle_params = {
    enablerotate
    emitscript = emit_apm_ST_spinner01s_particle
    emitterindependent = 1
    fillpath
    max = 12
    type = flat
    texture = ba_apm_smokepuff01s
    BlendMode = Blend
    priority = 1
}

script emit_apm_ST_spinner01s_particle 
    setemitrange width = 0.0 height = 0.0 depth = 0.0
    setlife min = 1.0 max = 1.0
    setanglespread spread = 0.2400
    setspeedrange min = 3.0 max = 4.0
    setforce x = 0.0 y = 0.1000 z = 0.0
    setparticlesize sw = 10.0 ew = 100.0
    setcolor corner = 0 sr = 79 sg = 40 sb = 16 sa = 255 mr = 68 mg = 64 mb = 63 ma = 187 er = 29 eg = 29 eb = 29 ea = 0 midTime = 0.5000
    emitrate rate = 12.0
endscript

apm_ST_spinnerF01_particle_params = {
    enablerotate
    angles = (0.0, 3.0, 0.0)
    emitscript = emit_apm_ST_spinnerF01_particle
    emitterindependent = 1
    fillpath
    max = 60
    type = flat
    texture = apm_spark_01
    BlendMode = Add
    priority = 0
}

script emit_apm_ST_spinnerF01_particle 
    setemitrange width = 0.0 height = 0.0 depth = 10.0
    setlife min = 0.5000 max = 1.0
    setanglespread spread = 0.1800
    setspeedrange min = 30.0 max = 30.0
    setforce x = 0.0 y = -0.3000 z = 0.0
    setparticlesize sw = 200.0 ew = 0.0
    setcolor corner = 0 sr = 226 sg = 164 sb = 241 sa = 255 mr = 107 mg = 16 mb = 210 ma = 255 er = 28 eg = 9 eb = 170 ea = 0 midTime = 0.1000
    emitrate rate = 60.0
endscript

apm_ST_spinnerF02_particle_params = {
    enablerotate
    angles = (0.0, 1.5, 0.0)
    emitscript = emit_apm_ST_spinnerF02_particle
    emitterindependent = 1
    fillpath
    max = 60
    type = flat
    texture = apm_spark_01
    BlendMode = Add
    priority = 0
}

script emit_apm_ST_spinnerF02_particle 
    setemitrange width = 0.0 height = 0.0 depth = 10.0
    setlife min = 0.5000 max = 1.0
    setanglespread spread = 0.1800
    setspeedrange min = 20.0 max = 30.0
    setforce x = 0.0 y = -0.5000 z = 0.0
    setparticlesize sw = 200.0 ew = 0.0
    setcolor corner = 0 sr = 226 sg = 164 sb = 241 sa = 255 mr = 107 mg = 16 mb = 210 ma = 255 er = 28 eg = 9 eb = 170 ea = 0 midTime = 0.1000
    emitrate rate = 60.0
endscript

apm_ST_spinnerF03_particle_params = {
    enablerotate
    emitscript = emit_apm_ST_spinnerF03_particle
    emitterindependent = 1
    fillpath
    max = 45
    type = flat
    texture = apm_spark_01
    BlendMode = Add
    priority = 0
}

script emit_apm_ST_spinnerF03_particle 
    setemitrange width = 0.0 height = 0.0 depth = 10.0
    setlife min = 0.5000 max = 0.7500
    setanglespread spread = 0.1800
    setspeedrange min = 25.0 max = 30.0
    setforce x = 0.0 y = -0.3000 z = 0.0
    setparticlesize sw = 200.0 ew = 0.0
    setcolor corner = 0 sr = 226 sg = 164 sb = 241 sa = 255 mr = 107 mg = 16 mb = 210 ma = 255 er = 28 eg = 9 eb = 170 ea = 0 midTime = 0.1000
    emitrate rate = 60.0
endscript

apm_ST_spinnerF04_particle_params = {
    enablerotate
    angles = (0.0, 4.5, 0.0)
    emitscript = emit_apm_ST_spinnerF04_particle
    emitterindependent = 1
    fillpath
    max = 45
    type = flat
    texture = apm_spark_01
    BlendMode = Add
    priority = 0
}

script emit_apm_ST_spinnerF04_particle 
    setemitrange width = 0.0 height = 0.0 depth = 10.0
    setlife min = 0.5000 max = 0.7500
    setanglespread spread = 0.1800
    setspeedrange min = 30.0 max = 30.0
    setforce x = 0.0 y = -0.5000 z = 0.0
    setparticlesize sw = 200.0 ew = 0.0
    setcolor corner = 0 sr = 226 sg = 164 sb = 241 sa = 255 mr = 107 mg = 16 mb = 210 ma = 255 er = 28 eg = 9 eb = 170 ea = 0 midTime = 0.1000
    emitrate rate = 60.0
endscript

