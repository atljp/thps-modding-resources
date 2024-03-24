

script load_cutscene_particle_textures 
    LoadParticleTexture 'particles\apm_flamequad_01'
    LoadParticleTexture 'particles\apm_spark_01'
    LoadParticleTexture 'particles\ba_apm_smokepuff01s'
endscript

APM_STc_flamingBOARD02_particle_params = {
    bone = Bone_Board_Root
    emitscript = emit_APM_STc_flamingBOARD02_particle
    updatescript = align_to_vel_update
    params = {
        bone = Bone_Board_Root
        update_pos = 0
        emit_offset = (0.0, 0.0, 0.0)
        emit_scale = -1.0
        pos_offset = (0.0, -2.0, 0.0)
    }
    max = 13
    type = Shaded
    texture = apm_flamequad_01
    BlendMode = Add
    userandomuvquadrants
    priority = 0
}

script emit_APM_STc_flamingBOARD02_particle 
    setemitrange width = 0.0 height = 0.0 depth = 0.0
    setlife min = 0.1500 max = 0.2000
    setanglespread spread = 0.1800
    setspeedrange min = 0.2000 max = 1.0
    setemittarget x = 0.0 y = 0.0 z = 0.0
    setforce x = 0.0 y = 0.3000 z = 0.0
    setparticlesize sw = 15.0 ew = 0.0
    setcolor corner = 0 sr = 255 sg = 91 sb = 20 sa = 15 mr = 255 mg = 67 mb = 39 ma = 128 er = 114 eg = 17 eb = 0 ea = 0 midTime = 0.5100
    setcolor corner = 1 sr = 255 sg = 91 sb = 20 sa = 15 mr = 255 mg = 67 mb = 39 ma = 128 er = 114 eg = 17 eb = 0 ea = 0 midTime = 0.5100
    setcolor corner = 2 sr = 255 sg = 91 sb = 20 sa = 15 mr = 255 mg = 67 mb = 39 ma = 128 er = 114 eg = 17 eb = 0 ea = 0 midTime = 0.5100
    setcolor corner = 3 sr = 255 sg = 91 sb = 20 sa = 15 mr = 255 mg = 67 mb = 39 ma = 128 er = 114 eg = 17 eb = 0 ea = 0 midTime = 0.5100
    emitrate rate = 66.0
    wait 0.8000 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript

APM_STc_flamingBOARD_particle_params = {
    bone = Bone_Board_Root
    emitscript = emit_APM_STc_flamingBOARD_particle
    updatescript = align_to_vel_update
    params = {
        bone = Bone_Board_Root
        update_pos = 0
        emit_offset = (0.0, 0.0, 0.0)
        emit_scale = -1.0
        pos_offset = (0.0, -2.0, 0.0)
    }
    max = 13
    type = Shaded
    texture = apm_flamequad_01
    BlendMode = Add
    userandomuvquadrants
    priority = 0
}

script emit_APM_STc_flamingBOARD_particle 
    setemitrange width = 0.0 height = 0.0 depth = 0.0
    setlife min = 0.1500 max = 0.2000
    setanglespread spread = 0.1800
    setspeedrange min = 0.2000 max = 1.0
    setemittarget x = 0.0 y = 0.0 z = 0.0
    setforce x = 0.0 y = 0.5000 z = 0.0
    setparticlesize sw = 20.0 ew = 0.0
    setcolor corner = 0 sr = 255 sg = 91 sb = 20 sa = 15 mr = 255 mg = 67 mb = 39 ma = 128 er = 114 eg = 17 eb = 0 ea = 0 midTime = 0.5100
    setcolor corner = 1 sr = 255 sg = 91 sb = 20 sa = 15 mr = 255 mg = 67 mb = 39 ma = 128 er = 114 eg = 17 eb = 0 ea = 0 midTime = 0.5100
    setcolor corner = 2 sr = 255 sg = 91 sb = 20 sa = 15 mr = 255 mg = 67 mb = 39 ma = 128 er = 114 eg = 17 eb = 0 ea = 0 midTime = 0.5100
    setcolor corner = 3 sr = 255 sg = 91 sb = 20 sa = 15 mr = 255 mg = 67 mb = 39 ma = 128 er = 114 eg = 17 eb = 0 ea = 0 midTime = 0.5100
    emitrate rate = 66.0
    wait 1.900 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript

apm_STc_Flameon01_particle_params = {
    boneoffset = (0.0, 100.0, 75.0)
    emitscript = emit_apm_STc_Flameon01_particle
    emitterindependent = 1
    fillpath
    max = 60
    type = Shaded
    texture = apm_flamequad_01
    BlendMode = Add
    userandomuvquadrants
    priority = 1
}

script emit_apm_STc_Flameon01_particle 
    setemitrange width = 100.0 height = 100.0 depth = 0.0
    setlife min = 0.2000 max = 0.5000
    setanglespread spread = 0.1800
    setspeedrange min = 0.1000 max = 1.0
    setemittarget x = 0.0 y = 0.0 z = 1.0
    setforce x = 0.0 y = 0.5000 z = 0.0
    setparticlesize sw = 50.0 ew = 20.0
    setcolor corner = 0 sr = 218 sg = 102 sb = 28 sa = 0 mr = 218 mg = 56 mb = 22 ma = 255 er = 218 eg = 39 eb = 22 ea = 0 midTime = 0.5000
    setcolor corner = 1 sr = 218 sg = 102 sb = 28 sa = 0 mr = 218 mg = 56 mb = 22 ma = 255 er = 218 eg = 39 eb = 22 ea = 0 midTime = 0.5000
    setcolor corner = 2 sr = 218 sg = 102 sb = 28 sa = 0 mr = 218 mg = 56 mb = 22 ma = 255 er = 218 eg = 39 eb = 22 ea = 0 midTime = 0.5000
    setcolor corner = 3 sr = 218 sg = 102 sb = 28 sa = 0 mr = 218 mg = 56 mb = 22 ma = 255 er = 218 eg = 39 eb = 22 ea = 0 midTime = 0.5000
    emitrate rate = 200.0
    wait 1.0 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript

apm_STc_Frietrail01_particle_params = {
    boneoffset = (0.0, 33.0, 0.0)
    emitscript = emit_apm_STc_Frietrail01_particle
    emitterindependent = 1
    fillpath
    max = 60
    type = flat
    texture = apm_spark_01
    BlendMode = Add
    priority = 1
}

script emit_apm_STc_Frietrail01_particle 
    setemitrange width = 10.0 height = 30.0 depth = 10.0
    setlife min = 0.1000 max = 0.5000
    setanglespread spread = 0.7100
    setspeedrange min = 5.0 max = 6.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.0 z = 0.0
    setparticlesize sw = 10.0 ew = 5.0
    setcolor corner = 0 sr = 218 sg = 98 sb = 22 sa = 255 mr = 218 mg = 56 mb = 22 ma = 255 er = 218 eg = 39 eb = 22 ea = 0 midTime = 0.5000
    emitrate rate = 120.0
    wait 1.500 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript

apm_STc_OILYsmoke_particle_params = {
    bone = Bone_Board_Root
    boneoffset = (0.0, 0.0, 15.0)
    emitscript = emit_apm_STc_OILYsmoke_particle
    emitterindependent = 1
    fillpath
    max = 24
    type = flat
    texture = ba_apm_smokepuff01s
    BlendMode = Blend
    priority = 0
}

script emit_apm_STc_OILYsmoke_particle 
    setemitrange width = 1.0 height = 1.0 depth = 0.0
    setlife min = 0.5000 max = 0.8000
    setanglespread spread = 0.1200
    setspeedrange min = 1.0 max = 3.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.02000 z = 0.0
    setparticlesize sw = 20.0 ew = 20.0
    setcolor corner = 0 sr = 205 sg = 85 sb = 34 sa = 29 mr = 39 mg = 35 mb = 33 ma = 127 er = 51 eg = 51 eb = 51 ea = 0 midTime = 0.2000
    emitrate rate = 30.0
    wait 2.750 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript

apm_STc_smoketrail01_particle_params = {
    id = skater
    emitscript = emit_apm_STc_smoketrail01_particle
    emitterindependent = 1
    fillpath
    max = 18
    type = flat
    texture = ba_apm_smokepuff01s
    BlendMode = Blend
    useglobalcolormodulation
    priority = 0
}

script emit_apm_STc_smoketrail01_particle 
    setemitrange width = 10.0 height = 10.0 depth = 10.0
    setlife min = 0.4000 max = 0.6000
    setanglespread spread = 0.1800
    setspeedrange min = 0.5000 max = 1.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.2000 z = 0.0
    setparticlesize sw = 30.0 ew = 50.0
    setcolor corner = 0 sr = 205 sg = 92 sb = 21 sa = 0 mr = 68 mg = 64 mb = 57 ma = 105 er = 36 eg = 38 eb = 40 ea = 0 midTime = 0.3000
    emitrate rate = 30.0
    wait 1.0 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript

apm_STc_sparks01_particle_params = {
    bone = Bone_Board_Root
    emitscript = emit_apm_STc_sparks01_particle
    emitterindependent = 1
    fillpath
    max = 80
    type = flat
    texture = apm_spark_01
    BlendMode = Add
    useglobalcolormodulation
    priority = 0
}

script emit_apm_STc_sparks01_particle 
    setemitrange width = 1.0 height = 1.0 depth = 0.0
    setlife min = 0.3000 max = 0.8000
    setanglespread spread = 0.3700
    setspeedrange min = 5.0 max = 8.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = -0.5000 z = 0.0
    setparticlesize sw = 10.0 ew = 5.0
    setcolor corner = 0 sr = 220 sg = 57 sb = 23 sa = 125 mr = 233 mg = 74 mb = 30 ma = 251 er = 40 eg = 40 eb = 40 ea = 0 midTime = 0.2000
    emitrate rate = 100.0
    wait 0.2000 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript

