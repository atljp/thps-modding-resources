

script load_level_particle_textures 
    LoadParticleTexture 'particles\apm_snowflake01'
    LoadParticleTexture 'particles\apm_spark_01'
    LoadParticleTexture 'particles\apm_spray_01'
    LoadParticleTexture 'particles\ba_apm_smokepuff01s'
    LoadParticleTexture 'particles\apm_spark_02'
endscript

JEG_Zombie_FlareUp_particle_params = {
    boneoffset = (0.0, 0.0, 10.0)
    enablerotate
    emitscript = emit_JEG_Zombie_FlareUp_particle
    emitterindependent = 1
    max = 5
    type = flat
    texture = apm_spark_01
    BlendMode = Add
    useglobalcolormodulation
    priority = 0
}

script emit_JEG_Zombie_FlareUp_particle 
    setemitrange width = 1.0 height = 1.0 depth = 0.0
    setlife min = 0.1000 max = 4.0
    setanglespread spread = 0.5600
    setspeedrange min = 0.1000 max = 0.5000
    setforce x = 0.0 y = 0.0 z = 0.0
    setparticlesize sw = 25.0 ew = 3.0
    setcolor corner = 0 sr = 142 sg = 233 sb = 249 sa = 255 mr = 67 mg = 51 mb = 190 ma = 202 er = 123 eg = 50 eb = 130 ea = 83 midTime = 0.3000
    emit num = 5
    destroy ifempty = 1
endscript

JEG_Zombie_burst_particle_params = {
    bone = Bone_Pelvis
    emitscript = emit_JEG_Zombie_burst_particle
    emitterindependent = 1
    max = 256
    type = flat
    texture = apm_spark_02
    BlendMode = Add
    priority = 0
}

script emit_JEG_Zombie_burst_particle 
    setemitrange width = 1.0 height = 1.0 depth = 0.0
    setcircularemit circular = 1
    setlife min = 0.05000 max = 3.0
    setanglespread spread = 0.8300
    setspeedrange min = 0.5000 max = 3.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = -0.05000 z = 0.0
    setparticlesize sw = 0.1000 ew = 3.0
    setcolor corner = 0 sr = 53 sg = 39 sb = 232 sa = 145 mr = 0 mg = 185 mb = 218 ma = 255 er = 94 eg = 9 eb = 102 ea = 0 midTime = 0.5000
    emit num = 256
    destroy ifempty = 1
endscript

apm_NO_Sooty01_particle_params = {
    id = skater
    bone = Bone_Pelvis
    enablerotate
    emitscript = emit_apm_NO_Sooty01_particle
    emitterindependent = 1
    max = 33
    type = flat
    texture = ba_apm_smokepuff01s
    BlendMode = Blend
    useglobalcolormodulation
}

script emit_apm_NO_Sooty01_particle 
    setemitrange width = 10.0 height = 10.0 depth = 33.0
    setlife min = 0.5000 max = 0.5000
    setanglespread spread = 0.2500
    setspeedrange min = 0.1000 max = 0.1000
    setforce x = 0.0 y = 0.05000 z = 0.0
    setparticlesize sw = 15.0 ew = 5.0
    setcolor sr = 32 sg = 38 sb = 42 sa = 95 mr = 37 mg = 40 mb = 40 ma = 165 er = 16 eg = 16 eb = 17 ea = 0 midTime = 0.4557
    emitrate rate = 66.0
endscript

apm_NO_freeze01_particle_params = {
    boneoffset = (0.0, 40.0, 0.0)
    enablerotate
    angles = (0.0, 3.0, 0.0)
    emitscript = emit_apm_NO_freeze01_particle
    emitterindependent = 1
    updatescript = align_scale_to_vel_update
    params = {
        bone = Bone_Board_Tail
        update_pos = 0
        emit_offset = (0.0, 0.5, 0.0)
        emit_scale = -1.0
        pos_offset = (0.0, -2.0, 0.0)
        base_vel = 800.0
        min_vel_range = 1
        max_vel_range = 1
        base_emit_rate = 30
    }
    max = 20
    type = flat
    texture = apm_snowflake01
    BlendMode = Add
    useglobalcolormodulation
}

script emit_apm_NO_freeze01_particle 
    setemitrange width = 10.0 height = 25.0 depth = 0.0
    setlife min = 0.5000 max = 0.5000
    setanglespread spread = 0.2500
    setspeedrange min = 0.1000 max = 0.1000
    setforce x = 0.0 y = 0.0 z = 0.0
    setparticlesize sw = 3.0 ew = 3.0
    setcolor sr = 193 sg = 232 sb = 255 sa = 0 mr = 193 mg = 232 mb = 255 ma = 86 er = 193 eg = 232 eb = 255 ea = 0 midTime = 0.1000
    emitrate rate = 20.0
    wait 1.0 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript

apm_NO_stinky01_particle_params = {
    id = skater
    bone = Bone_Pelvis
    enablerotate
    emitscript = emit_apm_NO_stinky01_particle
    emitterindependent = 1
    max = 33
    type = flat
    texture = apm_spray_01
    BlendMode = Blend
    useglobalcolormodulation
}

script emit_apm_NO_stinky01_particle 
    setemitrange width = 10.0 height = 10.0 depth = 33.0
    setlife min = 0.5000 max = 0.5000
    setanglespread spread = 0.2500
    setspeedrange min = 0.1000 max = 0.1000
    setforce x = 0.0 y = 0.05000 z = 0.0
    setparticlesize sw = 22.0 ew = 5.0
    setcolor sr = 82 sg = 154 sb = 78 sa = 0 mr = 101 mg = 91 mb = 44 ma = 72 er = 42 eg = 32 eb = 25 ea = 0 midTime = 0.4557
    emitrate rate = 66.0
endscript

