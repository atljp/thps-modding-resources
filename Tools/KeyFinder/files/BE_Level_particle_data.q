

script load_level_particle_textures 
    LoadParticleTexture 'particles\apm_flamequad_01'
    LoadParticleTexture 'particles\apm_quadleaf01'
    LoadParticleTexture 'particles\apm_spark_01'
endscript

apm_BE_fire01_particle_params = {
    enablerotate
    emitscript = emit_apm_BE_fire01_particle
    emitterindependent = 1
    max = 38
    type = Shaded
    texture = apm_flamequad_01
    BlendMode = Add
    userandomuvquadrants
    priority = 0
    suspenddistance = Default_Particle_Suspend_Dist
}

script emit_apm_BE_fire01_particle 
    setemitrange width = 12.0 height = 3.0 depth = 0.0
    setlife min = 0.2000 max = 0.4000
    setanglespread spread = 0.1222
    setspeedrange min = 1.0 max = 2.0
    setforce x = 0.0 y = 0.05000 z = 0.0
    setparticlesize sw = 15.0 ew = 2.0
    setcolor sr = 50 sg = 91 sb = 255 sa = 0 mr = 240 mg = 98 mb = 48 ma = 255 er = 154 eg = 47 eb = 31 ea = 0 midTime = 0.6962
    setlodparams min_particles = 0 lod_dist1 = 700.0 lod_dist2 = 1201.0
    emitrate rate = 128.0
endscript

apm_BE_fire_poof01_particle_params = {
    id = skater
    emitscript = emit_apm_BE_fire_poof01_particle
    max = 26
    type = Shaded
    texture = apm_flamequad_01
    BlendMode = Add
    userandomuvquadrants
    priority = 0
}

script emit_apm_BE_fire_poof01_particle 
    setemitrange width = 22.0 height = 0.0 depth = 22.0
    setlife min = 0.2000 max = 0.2000
    setanglespread spread = 0.2889
    setspeedrange min = 3.0 max = 8.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.5000 z = 0.0
    setparticlesize sw = 50.0 ew = 1.0
    setcolor sr = 50 sg = 91 sb = 255 sa = 0 mr = 240 mg = 98 mb = 48 ma = 255 er = 154 eg = 47 eb = 31 ea = 0 midTime = 0.6962
    emitrate rate = 128.0
    wait 0.2000 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript

apm_BE_leafTrail01_particle_params = {
    bone = Bone_Stomach_Upper
    emitscript = emit_apm_BE_leafTrail01_particle
    emitterindependent = 1
    max = 128
    type = Shaded
    texture = apm_quadleaf01
    BlendMode = Blend
    userandomuvquadrants
    useglobalcolormodulation
    priority = 0
}

script emit_apm_BE_leafTrail01_particle 
    setemitrange width = 20.0 height = 20.0 depth = 20.0
    setlife min = 1.0 max = 2.0
    setanglespread spread = 0.7111
    setspeedrange min = 1.0 max = 2.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = -0.05000 z = 0.0
    setparticlesize sw = 4.0 ew = 5.0
    setcolor sr = 128 sg = 111 sb = 87 sa = 255 mr = 64 mg = 56 mb = 44 ma = 204 er = 102 eg = 90 eb = 71 ea = 0 midTime = 0.5000
    emitrate rate = 60.0
    wait 1.500 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript

apm_BE_sparks_particle_params = {
    enablerotate
    emitscript = emit_apm_BE_sparks_particle
    emitterindependent = 1
    max = 8
    type = FlatRibbonTail
    texture = apm_spark_01
    BlendMode = Add
    History = 3
    suspenddistance = 5
}

script emit_apm_BE_sparks_particle 
    setemitrange width = 1.0 height = 1.0 depth = 0.0
    setlife min = 0.1000 max = 0.4000
    setanglespread spread = 0.5000
    setspeedrange min = 1.0 max = 5.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = -0.2500 z = 0.0
    setparticlesize sw = 1.500 ew = 0.1000
    setcolor sr = 108 sg = 214 sb = 255 sa = 0 er = 99 eg = 150 eb = 255 ea = 255
    setlodparams min_particles = 0 lod_dist1 = 400.0 lod_dist2 = 401.0
    emitrate rate = 15
    setcolor corner = 0 sr = 100 sg = 200 sb = 255 sa = 0 ma = 255 er = 100 eg = 200 eb = 255 ea = 255
    setcolor corner = 1 sr = 100 sg = 200 sb = 255 sa = 0 ma = 255 er = 100 eg = 200 eb = 255 ea = 255
    setcolor corner = 2 sr = 100 sg = 200 sb = 255 sa = 0 ma = 255 er = 100 eg = 200 eb = 255 ea = 255
    setcolor corner = 3 sr = 100 sg = 200 sb = 255 sa = 0 ma = 255 er = 100 eg = 200 eb = 255 ea = 128
    setcolor corner = 4 sr = 100 sg = 200 sb = 255 sa = 0 ma = 128 er = 100 eg = 200 eb = 255 ea = 0
endscript

