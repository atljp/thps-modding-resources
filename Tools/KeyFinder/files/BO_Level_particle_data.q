

script load_level_particle_textures 
    LoadParticleTexture 'particles\apm_spray_01'
endscript

APM_FLAMING_seg2a_particle_params = {
    bone = Bone_Board_Tail
    boneoffset = (16.0, -9.0, 12.0)
    enablerotate
    emitscript = emit_APM_FLAMING_seg2a_particle
    max = 30
    type = flat
    texture = apm_spray_01
    BlendMode = Blend
    priority = 0
}

script emit_APM_FLAMING_seg2a_particle 
    setemitrange width = 0.0 height = 0.0 depth = 0.0
    setcircularemit circular = 12
    setlife min = 0.1000 max = 0.2000
    setanglespread spread = 0.07000
    setspeedrange min = 6.0 max = 6.0
    setemitangle x = 0.0 y = -90.0 z = 0.0
    setforce x = 0.0 y = 0.5000 z = 0.0
    setparticlesize sw = 8.0 ew = 20.0
    setcolor corner = 0 sr = 255 sg = 124 sb = 55 sa = 255 mr = 26 mg = 24 mb = 23 ma = 255 er = 48 eg = 45 eb = 43 ea = 231 midTime = 0.2300
    setlodparams min_particles = 0 lod_dist1 = Default_Particle_LOD_Dist1 lod_dist2 = Default_Particle_LOD_Dist2
    emitrate rate = 30.0
endscript

APM_FLAMING_seg2b_particle_params = {
    bone = Bone_Board_Nose
    boneoffset = (16.0, 9.0, 12.0)
    enablerotate
    emitscript = emit_APM_FLAMING_seg2b_particle
    max = 30
    type = flat
    texture = apm_spray_01
    BlendMode = Blend
    priority = 0
}

script emit_APM_FLAMING_seg2b_particle 
    setemitrange width = 0.0 height = 0.0 depth = 0.0
    setcircularemit circular = 8
    setlife min = 0.1000 max = 0.2000
    setanglespread spread = 0.07000
    setspeedrange min = 6.0 max = 6.0
    setemitangle x = 0.2000 y = 90.0 z = 0.0
    setforce x = 0.0 y = 0.7000 z = 0.0
    setparticlesize sw = 8.0 ew = 20.0
    setcolor corner = 0 sr = 255 sg = 124 sb = 55 sa = 255 mr = 26 mg = 24 mb = 23 ma = 255 er = 48 eg = 45 eb = 43 ea = 231 midTime = 0.2300
    setlodparams min_particles = 0 lod_dist1 = Default_Particle_LOD_Dist1 lod_dist2 = Default_Particle_LOD_Dist2
    emitrate rate = 30.0
endscript

