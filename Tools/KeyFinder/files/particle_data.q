

script load_permanent_particle_textures 
    LoadParticleTexture 'particles\apm_debis_01' perm
    LoadParticleTexture 'particles\apm_debis_quad01' perm
    LoadParticleTexture 'particles\apm_fallingwater_01' perm
    LoadParticleTexture 'particles\apm_flamequad_01' perm
    LoadParticleTexture 'particles\apm_grass01' perm
    LoadParticleTexture 'particles\apm_ring_01' perm
    LoadParticleTexture 'particles\apm_ring_02' perm
    LoadParticleTexture 'particles\apm_spark_01' perm
    LoadParticleTexture 'particles\apm_splinters_01' perm
    LoadParticleTexture 'particles\apm_spray_01' perm
    LoadParticleTexture 'particles\apm_water_splash01' perm
    LoadParticleTexture 'particles\ba_apm_softsgrade01' perm
endscript

APM_Debris01_particle_params = {
    bone = Bone_Board_Root
    boneoffset = (0.0, 0.0, -10.0)
    emitscript = emit_APM_Debris01_particle
    emitterindependent = 1
    updatescript = align_scale_to_vel_update
    params = {
        bone = Bone_Board_Root
        update_pos = 1
        emit_offset = (0.0, 3.0, 0.0)
        emit_scale = 1
        pos_offset = (0.0, -5.0, 0.0)
        base_vel = 650
        min_vel_range = 6
        max_vel_range = 8
        base_emit_rate = 15
    }
    max = 5
    type = flat
    texture = apm_debis_quad01
    BlendMode = Blend
    useglobalcolormodulation
    priority = 0
}

script emit_APM_Debris01_particle 
    setemitrange width = 1.0 height = 1.0 depth = 0.0
    setlife min = 0.2000 max = 0.3000
    setanglespread spread = 0.3700
    setspeedrange min = 1.0 max = 1.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = -0.7000 z = 0.0
    setparticlesize sw = 8.0 ew = 10.0
    setcolor corner = 0 sr = 71 sg = 75 sb = 77 sa = 255 mr = 138 mg = 138 mb = 138 ma = 255 er = 95 eg = 95 eb = 91 ea = 108 midTime = 0.6300
    emitrate rate = 15.0
endscript

APM_Gravel01_particle_params = {
    bone = Bone_Board_Root
    boneoffset = (0.0, 0.0, -10.0)
    emitscript = emit_APM_Gravel01_particle
    emitterindependent = 1
    updatescript = align_scale_to_vel_update
    params = {
        bone = Bone_Board_Root
        update_pos = 1
        emit_offset = (0.0, 3.0, 0.0)
        emit_scale = 1
        pos_offset = (0.0, -5.0, 0.0)
        base_vel = 600
        min_vel_range = 6
        max_vel_range = 8
        base_emit_rate = 15
    }
    max = 5
    type = flat
    texture = apm_debis_quad01
    BlendMode = Blend
    useglobalcolormodulation
    update_brightness
    priority = 0
}

script emit_APM_Gravel01_particle 
    setemitrange width = 1.0 height = 1.0 depth = 0.0
    setlife min = 0.2000 max = 0.3000
    setanglespread spread = 0.3700
    setspeedrange min = 1.0 max = 1.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = -0.6000 z = 0.0
    setparticlesize sw = 15.0 ew = 15.0
    setcolor corner = 0 sr = 77 sg = 73 sb = 70 sa = 255 mr = 138 mg = 136 mb = 130 ma = 255 er = 95 eg = 93 eb = 88 ea = 108 midTime = 0.6300
    emitrate rate = 15.0
endscript

APM_VEH_SPARKS01_particle_params = {
    boneoffset = (0.0, 0.0, -15.0)
    emitscript = emit_APM_VEH_SPARKS01_particle
    updatescript = align_scale_to_vel_update
    params = {
        bone = Bone_Board_Tail
        update_pos = 0
        emit_offset = (0.0, 1.0, 0.0)
        emit_scale = -1.0
        pos_offset = (0.0, 0.0, 0.0)
        base_vel = 500
        min_vel_range = 6
        max_vel_range = 8
        base_emit_rate = 30
    }
    max = 15
    type = FlatRibbonTail
    texture = apm_spark_01
    BlendMode = Add
    History = 3
    priority = 0
}

script emit_APM_VEH_SPARKS01_particle 
    setemitrange width = 5.0 height = 5.0 depth = 0.0
    setlife min = 0.1500 max = 0.3000
    setanglespread spread = 0.3700
    setspeedrange min = 3.0 max = 4.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = -0.5000 z = 0.0
    setparticlesize sw = 1.0 ew = 0.5000
    setcolor corner = 0 sr = 255 sg = 97 sb = 53 sa = 255 mr = 255 mg = 97 mb = 53 ma = 255 er = 255 eg = 20 eb = 0 ea = 0 midTime = 0.5100
    setcolor corner = 1 sr = 255 sg = 97 sb = 53 sa = 255 mr = 255 mg = 97 mb = 53 ma = 255 er = 255 eg = 20 eb = 0 ea = 0 midTime = 0.5100
    setcolor corner = 2 sr = 255 sg = 97 sb = 53 sa = 255 mr = 255 mg = 97 mb = 53 ma = 255 er = 255 eg = 20 eb = 0 ea = 0 midTime = 0.5100
    setcolor corner = 3 sr = 255 sg = 97 sb = 53 sa = 255 mr = 255 mg = 97 mb = 53 ma = 255 er = 255 eg = 20 eb = 0 ea = 0 midTime = 0.5100
    setcolor corner = 4 sr = 255 sg = 97 sb = 53 sa = 255 mr = 255 mg = 97 mb = 53 ma = 255 er = 255 eg = 20 eb = 0 ea = 0 midTime = 0.5100
    emitrate rate = 60.0
    wait 10.0 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript

APM_flamingBOARD_particle_params = {
    bone = Bone_Board_Root
    boneoffset = (0.0, 8.0, 7.099999904632568)
    emitscript = emit_APM_flamingBOARD_particle
    updatescript = align_to_vel_update
    params = {
        bone = Bone_Board_Root
        update_pos = 0
        emit_offset = (0.0, 0.0, 0.0)
        emit_scale = -1.0
        pos_offset = (0.0, -2.0, 0.0)
    }
    max = 7
    type = Shaded
    texture = apm_flamequad_01
    BlendMode = Add
    userandomuvquadrants
}

script emit_APM_flamingBOARD_particle 
    setemitrange width = 0.0 height = 0.0
    setlife min = 0.1500 max = 0.2600
    setanglespread spread = 0.1833
    setspeedrange min = 0.1000 max = 4.0
    setemittarget x = 0.0 y = 0.0 z = 0.0
    setforce x = 0.0 y = 0.4600 z = 0.0
    setparticlesize sw = 20.0 ew = 0.0
    setcolor sr = 55 sg = 104 sb = 255 sa = 15 mr = 255 mg = 132 mb = 53 ma = 255 er = 114 eg = 17 eb = 0 ea = 0 midTime = 0.5145
    emitrate rate = 30.0
endscript

APM_flaming_HEAD_particle_params = {
    bone = Bone_Head
    boneoffset = (0.0, 0.0, 9.199999809265137)
    emitscript = emit_APM_flaming_HEAD_particle
    updatescript = align_to_vel_update
    params = {
        bone = Bone_Head
        update_pos = 0
        emit_offset = (0.0, 0.0, 0.0)
        emit_scale = -1.0
        pos_offset = (0.0, 0.0, 0.0)
    }
    max = 29
    type = Shaded
    texture = apm_flamequad_01
    BlendMode = Add
    userandomuvquadrants
}

script emit_APM_flaming_HEAD_particle 
    setemitrange width = 3.0 height = 3.0
    setlife min = 0.1500 max = 0.2500
    setanglespread spread = 0.1833
    setspeedrange min = 0.1000 max = 4.0
    setemittarget x = 0.0 y = 0.0 z = 0.0
    setforce x = 0.0 y = 0.3000 z = 0.0
    setparticlesize sw = 15.0 ew = 3.0
    setcolor sr = 55 sg = 104 sb = 255 sa = 15 mr = 255 mg = 132 mb = 53 ma = 255 er = 114 eg = 17 eb = 0 ea = 0 midTime = 0.5145
    emitrate rate = 30.0
endscript

JEG_CanFlameDur_particle_params = {
    bone = Bone_Palm_R
    boneoffset = (0.0, 7.0, -7.0)
    enablerotate
    emitscript = emit_JEG_CanFlameDur_particle
    emitterindependent = 1
    max = 18
    type = flat
    texture = apm_spray_01
    BlendMode = Add
    priority = 0
}
JEG_CanFlameDur_particle_params2 = {
    bone = Bone_Palm_L
    boneoffset = (0.0, 7.0, -7.0)
    enablerotate
    emitscript = emit_JEG_CanFlameDur_particle
    emitterindependent = 1
    max = 18
    type = flat
    texture = apm_spray_01
    BlendMode = Add
    priority = 0
}

script emit_JEG_CanFlameDur_particle 
    setemitrange width = 0.1000 height = 0.1000 depth = 0.0
    setcircularemit circular = 1
    setlife min = 0.1000 max = 0.3000
    setanglespread spread = 0.01111
    setspeedrange min = 0.5000 max = 1.0
    setforce x = 0.0 y = 0.0 z = 0.0
    setparticlesize sw = 0.1000 ew = 25.0
    setcolor corner = 0 sr = 37 sg = 96 sb = 247 sa = 255 er = 155 eg = 39 eb = 12 ea = 180
    emitrate rate = 60.0
    wait 0.1500 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript

JEG_CanFlame_particle_params = {
    bone = Bone_Palm_R
    boneoffset = (0.0, 7.0, -7.0)
    enablerotate
    emitscript = emit_JEG_CanFlame_particle
    emitterindependent = 1
    max = 18
    type = flat
    texture = apm_spray_01
    BlendMode = Add
    priority = 0
}
JEG_CanFlame_particle_params2 = {
    bone = Bone_Palm_L
    boneoffset = (0.0, 7.0, -7.0)
    enablerotate
    emitscript = emit_JEG_CanFlame_particle
    emitterindependent = 1
    max = 18
    type = flat
    texture = apm_spray_01
    BlendMode = Add
    priority = 0
}

script emit_JEG_CanFlame_particle 
    setemitrange width = 0.1000 height = 0.1000 depth = 0.0
    setcircularemit circular = 1
    setlife min = 0.1000 max = 0.3000
    setanglespread spread = 0.01111
    setspeedrange min = 0.5000 max = 1.0
    setforce x = 0.0 y = 0.0 z = 0.0
    setparticlesize sw = 0.1000 ew = 25.0
    setcolor corner = 0 sr = 37 sg = 96 sb = 247 sa = 255 er = 232 eg = 68 eb = 11 ea = 180
    emitrate rate = 60.0
endscript

JEG_FartBurst_particle_params = {
    bone = Bone_Pelvis
    boneoffset = (0.0, 7.0, -7.0)
    enablerotate
    emitscript = emit_JEG_FartBurst_particle
    emitterindependent = 1
    max = 18
    type = flat
    texture = apm_spray_01
    BlendMode = Add
}

script emit_JEG_FartBurst_particle 
    setemitrange width = 0.1000 height = 0.1000 depth = 0.0
    setcircularemit circular = 1
    setlife min = 0.1000 max = 0.3000
    setanglespread spread = 0.01111
    setspeedrange min = 0.5000 max = 1.0
    setforce x = 0.0 y = 0.0 z = 0.0
    setparticlesize sw = 0.1000 ew = 25.0
    setcolor sr = 234 sg = 115 sb = 36 sa = 255 er = 41 eg = 119 eb = 196 ea = 180
    emitrate rate = 60.0
    wait 0.3500 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript

JEG_Hoagie_particle_params = {
    bone = Bone_Chin_Scale
    boneoffset = (0.0, -8.0, 0.0)
    emitscript = emit_JEG_Hoagie_particle
    max = 10
    type = Shaded
    texture = apm_debis_01
    BlendMode = Blend
    useglobalcolormodulation
    update_brightness
    priority = 0
}

script emit_JEG_Hoagie_particle 
    setemitrange width = 10.0 height = 0.0 depth = 0.0
    setlife min = 0.1000 max = 0.4000
    setanglespread spread = 0.3300
    setspeedrange min = 0.1000 max = 6.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = -0.6000 z = 0.0
    setparticlesize sw = 5.0 ew = 11.0
    setcolor corner = 0 sr = 236 sg = 234 sb = 81 sa = 255 er = 105 eg = 74 eb = 37 ea = 191
    setcolor corner = 1 sr = 236 sg = 234 sb = 81 sa = 255 er = 105 eg = 74 eb = 37 ea = 191
    setcolor corner = 2 sr = 236 sg = 234 sb = 81 sa = 255 er = 105 eg = 74 eb = 37 ea = 191
    setcolor corner = 3 sr = 236 sg = 234 sb = 81 sa = 255 er = 105 eg = 74 eb = 37 ea = 191
    emitrate rate = 25.0
endscript

JEG_ShrekBurp_particle_params = {
    bone = Bone_Chin_Scale
    enablerotate
    angles = (0.0, 2.0, 0.0)
    emitscript = emit_JEG_ShrekBurp_particle
    emitterindependent = 1
    max = 10
    type = flat
    texture = apm_spray_01
    BlendMode = Blend
    useglobalcolormodulation
    priority = 0
}

script emit_JEG_ShrekBurp_particle 
    setemitrange width = 5.0 height = 5.0 depth = 0.0
    setlife min = 0.7500 max = 1.0
    setanglespread spread = 0.3300
    setspeedrange min = 0.7500 max = 1.750
    setemitangle x = 90.0 y = 0.0 z = 315.0
    setforce x = 0.0 y = -0.01000 z = 0.0
    setparticlesize sw = 24.0 ew = 48.0
    setcolor corner = 0 sr = 91 sg = 128 sb = 41 sa = 106 mr = 34 mg = 94 mb = 30 ma = 255 er = 43 eg = 110 eb = 136 ea = 0 midTime = 0.3000
    setlodparams min_particles = 0 lod_dist1 = Default_Particle_LOD_Dist1 lod_dist2 = Default_Particle_LOD_Dist2
    emitrate rate = 10.0
    wait 0.5000 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript

JEG_Spin_particle_params = {
    bone = Bone_Neck
    enablerotate
    emitscript = emit_JEG_Spin_particle
    emitterindependent = 1
    max = 30
    type = Shaded
    texture = apm_ring_01
    BlendMode = Add
    align_to = (0.0, 1.0, 0.0)
    useglobalcolormodulation
    priority = 0
}

script emit_JEG_Spin_particle 
    setemitrange width = 1.0 height = 1.0 depth = 0.0
    setcircularemit circular = 1
    setlife min = 0.5000 max = 0.5000
    setanglespread spread = 0.2500
    setspeedrange min = 2.0 max = 3.500
    setemitangle x = 0.0 y = 0.0 z = 90.0
    setforce x = 0.0 y = 0.0 z = 0.0
    setparticlesize sw = 35.0 ew = 0.5000
    setcolor corner = 0 sr = 210 sg = 227 sb = 227 sa = 255 er = 173 eg = 178 eb = 245 ea = 0
    setcolor corner = 1 sr = 210 sg = 227 sb = 227 sa = 255 er = 173 eg = 178 eb = 245 ea = 0
    setcolor corner = 2 sr = 210 sg = 227 sb = 227 sa = 255 er = 173 eg = 178 eb = 245 ea = 0
    setcolor corner = 3 sr = 210 sg = 227 sb = 227 sa = 255 er = 173 eg = 178 eb = 245 ea = 0
    setlodparams min_particles = 0 lod_dist1 = Default_Particle_LOD_Dist1 lod_dist2 = Default_Particle_LOD_Dist2
    emitrate rate = 60.0
    wait 0.5000 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript

JEG_SprayBlue_particle_params = {
    bone = Bone_Fingers_Tip_L
    emitscript = emit_JEG_SprayBlue_particle
    emitterindependent = 1
    fillpath
    max = 24
    type = flat
    texture = apm_spray_01
    BlendMode = Blend
    useglobalcolormodulation
    priority = 0
}

script emit_JEG_SprayBlue_particle 
    setemitrange width = 1.0 height = 1.0 depth = 0.0
    setlife min = 0.3000 max = 0.4000
    setanglespread spread = 0.1200
    setspeedrange min = 1.0 max = 3.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.0 z = 0.0
    setparticlesize sw = 8.0 ew = 20.0
    setcolor corner = 0 sr = 240 sg = 238 sb = 253 sa = 125 mr = 143 mg = 192 mb = 201 ma = 251 er = 44 eg = 40 eb = 209 ea = 0 midTime = 0.2000
    emitrate rate = 60.0
    wait 3.500 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript

JEG_SprayRed_particle_params = {
    bone = Bone_Fingers_Tip_R
    emitscript = emit_JEG_SprayRed_particle
    emitterindependent = 1
    fillpath
    max = 24
    type = flat
    texture = apm_spray_01
    BlendMode = Blend
    useglobalcolormodulation
    priority = 0
}

script emit_JEG_SprayRed_particle 
    setemitrange width = 1.0 height = 1.0 depth = 0.0
    setlife min = 0.3000 max = 0.4000
    setanglespread spread = 0.1200
    setspeedrange min = 1.0 max = 3.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.0 z = 0.0
    setparticlesize sw = 8.0 ew = 20.0
    setcolor corner = 0 sr = 240 sg = 238 sb = 253 sa = 125 mr = 206 mg = 154 mb = 206 ma = 251 er = 202 eg = 27 eb = 13 ea = 0 midTime = 0.2000
    emitrate rate = 60.0
    wait 3.500 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript

JEG_TireSmoke_particle_params = {
    bone = Bone_Board_Root
    boneoffset = (0.0, 0.0, -10.0)
    emitscript = emit_JEG_TireSmoke_particle
    emitterindependent = 1
    max = 128
    type = flat
    texture = apm_spray_01
    BlendMode = Blend
    useglobalcolormodulation
    priority = 0
}

script emit_JEG_TireSmoke_particle 
    setemitrange width = 1.0 height = 1.0 depth = 0.0
    setlife min = 0.5000 max = 0.8000
    setanglespread spread = 0.1200
    setspeedrange min = 1.0 max = 3.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.02000 z = 0.0
    setparticlesize sw = 5.0 ew = 90.0
    setcolor corner = 0 sr = 197 sg = 208 sb = 221 sa = 125 mr = 97 mg = 97 mb = 97 ma = 251 er = 7 eg = 10 eb = 26 ea = 0 midTime = 0.01000
    emitrate rate = 30.0
    wait 1.800 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript

apm_Boardslide01_particle_params = {
    id = skater
    boneoffset = (0.0, 0.0, -3.0)
    emitscript = emit_apm_Boardslide01_particle
    updatescript = align_scale_to_vel_update
    params = {
        bone = Bone_Board_Root
        update_pos = 0
        emit_offset = (0.0, 0.0, 0.0)
        emit_scale = -1.0
        pos_offset = (0.0, -10.0, 0.0)
        base_vel = 500.0
        min_vel_range = 3
        max_vel_range = 3
        base_emit_rate = 30
    }
    max = 15
    type = flat
    texture = apm_spray_01
    BlendMode = Blend
    useglobalcolormodulation
    update_brightness ObjID = skater
    priority = 0
}

script emit_apm_Boardslide01_particle 
    setemitrange width = 1.0 height = 1.0 depth = 1.0
    setlife min = 0.2000 max = 0.2000
    setanglespread spread = 0.1800
    setspeedrange min = 6.0 max = 6.0
    setemittarget x = 0.0 y = 0.0 z = 0.0
    setforce x = 0.0 y = 0.02000 z = 0.0
    setparticlesize sw = 10.0 ew = 1.0
    setcolor corner = 0 sr = 128 sg = 128 sb = 128 sa = 128 er = 102 eg = 101 eb = 98 ea = 0
    emitrate rate = 15.0
endscript

apm_Grass01_particle_params = {
    id = skater
    emitscript = emit_apm_Grass01_particle
    emitterindependent = 1
    fillpath
    updatescript = align_scale_to_vel_update
    params = {
        bone = Bone_Board_Root
        update_pos = 0
        emit_offset = (0.0, 2.5, 0.0)
        emit_scale = 1
        pos_offset = (0.0, -2.0, 0.0)
        base_vel = 100
        min_vel_range = 1
        max_vel_range = 1.250
        base_emit_rate = 40
    }
    max = 20
    type = Ribbon
    texture = apm_grass01
    BlendMode = Blend
    History = 2
    useglobalcolormodulation
    update_brightness ObjID = skater
    priority = 0
}

script emit_apm_Grass01_particle 
    setemitrange width = 10.0 height = 40.0 depth = 0.0
    setlife min = 0.2000 max = 0.5000
    setanglespread spread = 0.7100
    setspeedrange min = 0.1000 max = 0.1000
    setemittarget x = 0.0 y = 0.0 z = 0.0
    setforce x = 0.0 y = -0.4500 z = 0.0
    setparticlesize sw = 5.0 ew = 4.0
    setcolor corner = 0 sr = 57 sg = 64 sb = 44 sa = 255 mr = 83 mg = 97 mb = 52 ma = 255 er = 66 eg = 77 eb = 39 ea = 255 midTime = 0.5000
    setcolor corner = 1 sr = 57 sg = 64 sb = 44 sa = 255 mr = 83 mg = 97 mb = 52 ma = 255 er = 66 eg = 77 eb = 39 ea = 255 midTime = 0.5000
    emitrate rate = 40.0
endscript

apm_OILYsmoke_particle_params = {
    bone = Bone_Board_Root
    boneoffset = (0.0, 15.0, 22.0)
    emitscript = emit_apm_OILYsmoke_particle
    emitterindependent = 1
    fillpath
    max = 24
    type = flat
    texture = apm_spray_01
    BlendMode = Blend
    useglobalcolormodulation
    priority = 0
}

script emit_apm_OILYsmoke_particle 
    setemitrange width = 1.0 height = 1.0 depth = 0.0
    setlife min = 0.3000 max = 0.8000
    setanglespread spread = 0.1222
    setspeedrange min = 1.0 max = 3.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.02000 z = 0.0
    setparticlesize sw = 10.0 ew = 20.0
    setcolor corner = 0 sr = 41 sg = 46 sb = 48 sa = 125 mr = 31 mg = 31 mb = 31 ma = 251 er = 40 eg = 40 eb = 40 ea = 0 midTime = 0.2000
    emitrate rate = 30.0
endscript

apm_Skater_splash01_particle_params = {
    boneoffset = (0.0, 20.0, 0.0)
    emitscript = emit_apm_Skater_splash01_particle
    max = 18
    type = Shaded
    texture = ba_apm_softsgrade01
    BlendMode = Blend
    align_to = (0.0, 1.0, 0.0)
    useglobalcolormodulation
    priority = 0
}

script emit_apm_Skater_splash01_particle 
    setemitrange width = 1.0 height = 1.0 depth = 0.0
    setlife min = 1.0 max = 2.0
    setanglespread spread = 0.2500
    setspeedrange min = 0.03000 max = 0.03000
    setemittarget x = 0.0 y = 0.0 z = 0.0
    setforce x = 0.0 y = 0.0 z = 0.0
    setparticlesize sw = 10.0 ew = 150.0
    setcolor corner = 0 sr = 117 sg = 117 sb = 117 sa = 130 mr = 117 mg = 117 mb = 117 ma = 28 er = 117 eg = 117 eb = 117 ea = 0 midTime = 0.4200
    setcolor corner = 1 sr = 117 sg = 117 sb = 117 sa = 130 mr = 117 mg = 117 mb = 117 ma = 28 er = 117 eg = 117 eb = 117 ea = 0 midTime = 0.4200
    setcolor corner = 2 sr = 117 sg = 117 sb = 117 sa = 130 mr = 117 mg = 117 mb = 117 ma = 28 er = 117 eg = 117 eb = 117 ea = 0 midTime = 0.4200
    setcolor corner = 3 sr = 117 sg = 117 sb = 117 sa = 130 mr = 117 mg = 117 mb = 117 ma = 28 er = 117 eg = 117 eb = 117 ea = 0 midTime = 0.4200
    emitrate rate = 9.0
    wait 1.0 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript

apm_dirt_puff01_particle_params = {
    id = skater
    boneoffset = (0.0, 5.0, 20.0)
    emitscript = emit_apm_dirt_puff01_particle
    emitterindependent = 1
    fillpath
    updatescript = align_scale_to_vel_update
    params = {
        bone = Bone_Board_Tail
        update_pos = 0
        emit_offset = (0.0, 0.5, 0.0)
        emit_scale = -1.0
        pos_offset = (0.0, -2.0, 0.0)
        base_vel = 600
        min_vel_range = 2
        max_vel_range = 3
        base_emit_rate = 30
    }
    max = 18
    type = flat
    texture = apm_spray_01
    BlendMode = Blend
    useglobalcolormodulation
    priority = 0
}

script emit_apm_dirt_puff01_particle 
    setemitrange width = 5.0 height = 5.0 depth = 0.0
    setlife min = 0.2000 max = 0.3000
    setanglespread spread = 0.1700
    setspeedrange min = 5.0 max = 5.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.08000 z = 0.0
    setparticlesize sw = 30.0 ew = 10.0
    setcolor corner = 0 sr = 64 sg = 55 sb = 45 sa = 0 mr = 77 mg = 68 mb = 58 ma = 255 er = 89 eg = 79 eb = 67 ea = 255 midTime = 0.5000
    emitrate rate = 60.0
endscript

apm_dirt_puff02_particle_params = {
    emitscript = emit_apm_dirt_puff02_particle
    emitterindependent = 1
    max = 9
    type = flat
    texture = apm_spray_01
    BlendMode = Blend
    useglobalcolormodulation
    update_brightness ObjID = skater
    priority = 0
}

script emit_apm_dirt_puff02_particle 
    setemitrange width = 5.0 height = 5.0 depth = 0.0
    setlife min = 0.3000 max = 0.3000
    setanglespread spread = 0.1700
    setspeedrange min = 1.0 max = 1.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.01000 z = 0.0
    setparticlesize sw = 10.0 ew = 20.0
    setcolor corner = 0 sr = 102 sg = 88 sb = 72 sa = 255 er = 102 eg = 95 eb = 76 ea = 0
    emitrate rate = 30.0
    wait 0.2000 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript

apm_sand_puff01_particle_params = {
    boneoffset = (0.0, 5.0, 20.0)
    emitscript = emit_apm_sand_puff01_particle
    emitterindependent = 1
    fillpath
    updatescript = align_scale_to_vel_update
    params = {
        bone = Bone_Board_Tail
        update_pos = 0
        emit_offset = (0.0, 0.5, 0.0)
        emit_scale = -1.0
        pos_offset = (0.0, -2.0, 0.0)
        base_vel = 600
        min_vel_range = 2
        max_vel_range = 3
        base_emit_rate = 30
    }
    max = 12
    type = flat
    texture = apm_spray_01
    BlendMode = Blend
    useglobalcolormodulation
    update_brightness ObjID = skater
    priority = 0
}

script emit_apm_sand_puff01_particle 
    setemitrange width = 5.0 height = 5.0 depth = 0.0
    setlife min = 0.2000 max = 0.3000
    setanglespread spread = 0.1700
    setspeedrange min = 5.0 max = 5.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.05000 z = 0.0
    setparticlesize sw = 30.0 ew = 10.0
    setcolor corner = 0 sr = 128 sg = 119 sb = 95 sa = 0 mr = 110 mg = 102 mb = 82 ma = 215 er = 102 eg = 95 eb = 76 ea = 0 midTime = 0.5000
    emitrate rate = 60.0
endscript

apm_sand_puff02_particle_params = {
    emitscript = emit_apm_sand_puff02_particle
    emitterindependent = 1
    max = 9
    type = flat
    texture = apm_spray_01
    BlendMode = Blend
    useglobalcolormodulation
    update_brightness ObjID = skater
    priority = 0
}

script emit_apm_sand_puff02_particle 
    setemitrange width = 5.0 height = 5.0 depth = 0.0
    setlife min = 0.3000 max = 0.3000
    setanglespread spread = 0.1700
    setspeedrange min = 1.0 max = 1.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.01000 z = 0.0
    setparticlesize sw = 10.0 ew = 20.0
    setcolor corner = 0 sr = 128 sg = 120 sb = 83 sa = 255 er = 102 eg = 95 eb = 76 ea = 0
    emitrate rate = 30.0
    wait 0.2000 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript

apm_splinter01_particle_params = {
    boneoffset = (0.0, -2.0999999046325684, 0.0)
    emitscript = emit_apm_splinter01_particle
    updatescript = align_scale_to_vel_update
    params = {
        bone = Bone_Board_Root
        update_pos = 0
        emit_offset = (0.0, 1.0, 0.0)
        emit_scale = -1.0
        pos_offset = (0.0, -2.0, 0.0)
        base_vel = 600
        min_vel_range = 6
        max_vel_range = 8
        base_emit_rate = 30.0
    }
    max = 12
    type = Ribbon
    texture = apm_splinters_01
    BlendMode = Blend
    History = 2
    useglobalcolormodulation
    update_brightness ObjID = skater
    priority = 0
}

script emit_apm_splinter01_particle 
    setemitrange width = 0.0 height = 0.0 depth = 0.0
    setlife min = 0.1000 max = 0.4000
    setanglespread spread = 0.3900
    setspeedrange min = 3.0 max = 4.0
    setemittarget x = 0.0 y = 0.0 z = 0.0
    setforce x = 0.0 y = -0.4000 z = 0.0
    setparticlesize sw = 5.0 ew = 10.0
    setcolor corner = 0 sr = 84 sg = 80 sb = 74 sa = 255 mr = 156 mg = 148 mb = 128 ma = 255 er = 84 eg = 80 eb = 74 ea = 255 midTime = 0.5000
    setcolor corner = 1 sr = 84 sg = 80 sb = 74 sa = 255 mr = 156 mg = 148 mb = 128 ma = 255 er = 84 eg = 80 eb = 74 ea = 255 midTime = 0.5000
    emitrate rate = 30.0
endscript

apm_spray03_particle_params = {
    bone = Bone_Palm_L
    boneoffset = (0.0, 0.0, -7.300000190734863)
    enablerotate
    angles = (100.0, 0.0, 0.0)
    emitscript = emit_apm_spray03_particle
    emitterindependent = 1
    max = 6
    type = Shaded
    texture = apm_spray_01
    BlendMode = Blend
    useglobalcolormodulation
    update_brightness
    priority = 0
}

script emit_apm_spray03_particle 
    setemitrange width = 0.2500 height = 0.2500 depth = 0.0
    setlife min = 0.1000 max = 0.5000
    setanglespread spread = 0.1667
    setspeedrange min = 0.0 max = 0.2000
    setforce x = 0.0 y = 0.08000 z = 0.0
    setparticlesize sw = 10.0 ew = 20.0
    setcolor sr = 115 sg = 120 sb = 128 sa = 255 er = 92 eg = 97 eb = 102 ea = 0
    emitrate rate = 30.0
endscript

apm_water_wake01_particle_params = {
    boneoffset = (0.0, 2.0, 0.0)
    emitscript = emit_apm_water_wake01_particle
    emitterindependent = 1
    fillpath
    max = 3
    type = Shaded
    texture = ba_apm_softsgrade01
    BlendMode = Blend
    align_to = (0.0, 1.0, 0.0)
    useglobalcolormodulation
    priority = 0
}

script emit_apm_water_wake01_particle 
    setemitrange width = 0.0 height = 0.0 depth = 0.0
    setlife min = 0.5000 max = 0.7500
    setanglespread spread = 0.3100
    setspeedrange min = 0.1000 max = 0.1000
    setemittarget x = 0.0 y = 0.0 z = 0.0
    setforce x = 0.0 y = 0.0 z = 0.0
    setparticlesize sw = 5.0 ew = 33.0
    setcolor corner = 0 sr = 198 sg = 198 sb = 198 sa = 38 mr = 182 mg = 182 mb = 182 ma = 26 er = 125 eg = 128 eb = 117 ea = 0 midTime = 0.4900
    setcolor corner = 1 sr = 198 sg = 198 sb = 198 sa = 38 mr = 182 mg = 182 mb = 182 ma = 26 er = 125 eg = 128 eb = 117 ea = 0 midTime = 0.4900
    setcolor corner = 2 sr = 198 sg = 198 sb = 198 sa = 38 mr = 182 mg = 182 mb = 182 ma = 26 er = 125 eg = 128 eb = 117 ea = 0 midTime = 0.4900
    setcolor corner = 3 sr = 198 sg = 198 sb = 198 sa = 38 mr = 182 mg = 182 mb = 182 ma = 26 er = 125 eg = 128 eb = 117 ea = 0 midTime = 0.4900
    emitrate rate = 15.0
    wait 0.3000 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript

apm_water_wake02_particle_params = {
    bone = Bone_Board_Root
    boneoffset = (0.0, 0.0, 4.0)
    emitscript = emit_apm_water_wake02_particle
    emitterindependent = 1
    fillpath
    updatescript = align_scale_to_vel_update
    params = {
        bone = Bone_Board_Tail
        update_pos = 0
        emit_offset = (0.0, 0.5, 0.0)
        emit_scale = 1.0
        pos_offset = (0.0, -2.0, 0.0)
        base_vel = 800.0
        min_vel_range = 4
        max_vel_range = 8
        base_emit_rate = 23
    }
    max = 26
    type = flat
    texture = apm_water_splash01
    BlendMode = Blend
    useglobalcolormodulation
    priority = 0
}

script emit_apm_water_wake02_particle 
    setemitrange width = 10.0 height = 1.0 depth = 1.0
    setcircularemit circular = 1
    setlife min = 0.2000 max = 0.4000
    setanglespread spread = 0.4889
    setspeedrange min = 8.700 max = 8.700
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = -0.2700 z = 0.0
    setparticlesize sw = 7.0 ew = 2.0
    setcolor sr = 219 sg = 229 sb = 229 sa = 255 mr = 223 mg = 233 mb = 233 ma = 255 er = 199 eg = 211 eb = 213 ea = 0 midTime = 0.2936
    emitrate rate = 66.0
endscript

apm_water_wake03_particle_params = {
    bone = Bone_Board_Root
    boneoffset = (0.0, 0.0, 3.0)
    emitscript = emit_apm_water_wake03_particle
    emitterindependent = 1
    fillpath
    updatescript = align_scale_to_vel_update
    params = {
        bone = Bone_Board_Root
        update_pos = 0
        emit_offset = (0.0, 0.0, 0.0)
        emit_scale = -1.0
        pos_offset = (0.0, -2.0, 0.0)
        base_vel = 800.0
        min_vel_range = 2
        max_vel_range = 2
        base_emit_rate = 30
    }
    max = 7
    type = Shaded
    texture = apm_fallingwater_01
    BlendMode = brighten
    align_to = (0.0, 1.0, 0.0)
    priority = 0
}

script emit_apm_water_wake03_particle 
    setemitrange width = 1.700 height = 4.400 depth = 3.600
    setlife min = 0.2000 max = 0.2000
    setanglespread spread = 0.1333
    setspeedrange min = 5.0 max = 5.0
    setemittarget x = 0.0 y = 0.0 z = 0.0
    setforce x = 0.0 y = 0.0 z = 0.0
    setparticlesize sw = 12.0 ew = 22.0
    setcolor sr = 227 sg = 227 sb = 227 sa = 255 mr = 227 mg = 227 mb = 227 ma = 255 er = 125 eg = 128 eb = 117 ea = 0 midTime = 0.5000
    emitrate rate = 33.0
endscript

cod_natas_particle_params = {
    boneoffset = (0.0, 69.0, 0.0)
    enablerotate
    emitscript = emit_cod_natas_particle
    max = 30
    type = Shaded
    texture = apm_ring_02
    BlendMode = Add
    priority = 0
}

script emit_cod_natas_particle 
    setemitrange width = 0.0 height = 0.0 depth = 0.0
    setlife min = 0.5000 max = 0.5000
    setanglespread spread = 0.0
    setspeedrange min = 0.0 max = 0.0
    setforce x = 0.0 y = 0.0 z = 0.0
    setparticlesize sw = 10.0 ew = 40.0
    setcolor corner = 0 sr = 0 sg = 0 sb = 0 sa = 255 mr = 28 mg = 28 mb = 28 ma = 255 er = 0 eg = 0 eb = 0 ea = 86 midTime = 0.1100
    setcolor corner = 1 sr = 0 sg = 0 sb = 0 sa = 255 mr = 28 mg = 28 mb = 28 ma = 255 er = 0 eg = 0 eb = 0 ea = 86 midTime = 0.1100
    setcolor corner = 2 sr = 0 sg = 0 sb = 0 sa = 255 mr = 28 mg = 28 mb = 28 ma = 255 er = 0 eg = 0 eb = 0 ea = 86 midTime = 0.1100
    setcolor corner = 3 sr = 0 sg = 0 sb = 0 sa = 255 mr = 28 mg = 28 mb = 28 ma = 255 er = 0 eg = 0 eb = 0 ea = 86 midTime = 0.1100
    emitrate rate = 30.0
endscript

