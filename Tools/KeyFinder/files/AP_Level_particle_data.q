

script load_level_particle_textures 
    LoadParticleTexture 'particles\jow_ap_flagscraps01'
    LoadParticleTexture 'particles\jow_ap_suitcase01'
endscript

JOW_AP_FlagScraps01_particle_params = {
    emitscript = emit_JOW_AP_FlagScraps01_particle
    max = 12
    type = Shaded
    texture = JOW_AP_FlagScraps01
    BlendMode = Blend
    userandomuvquadrants
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_AP_FlagScraps01_particle 
    setemitrange width = 10.0 height = 10.0 depth = 50.0
    setlife min = 2.0 max = 3.0
    setanglespread spread = 1.0
    setspeedrange min = 1.0 max = 2.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = -0.04000 z = 0.0
    setparticlesize sw = 8.0 ew = 8.0
    setcolor corner = 0 sr = 97 sg = 97 sb = 97 sa = 255 er = 97 eg = 97 eb = 97 ea = 255
    setcolor corner = 1 sr = 97 sg = 97 sb = 97 sa = 255 er = 97 eg = 97 eb = 97 ea = 255
    setcolor corner = 2 sr = 97 sg = 97 sb = 97 sa = 255 er = 97 eg = 97 eb = 97 ea = 255
    setcolor corner = 3 sr = 97 sg = 97 sb = 97 sa = 255 er = 97 eg = 97 eb = 97 ea = 255
    setlodparams min_particles = 0 lod_dist1 = Default_Particle_LOD_Dist1 lod_dist2 = Default_Particle_LOD_Dist2
    emit num = 12
    destroy ifempty = 1
endscript

JOW_AP_Suitcase01_particle_params = {
    emitscript = emit_JOW_AP_Suitcase01_particle
    emitterindependent = 1
    max = 8
    type = Shaded
    texture = JOW_AP_Suitcase01
    BlendMode = Blend
    userandomuvquadrants
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_AP_Suitcase01_particle 
    setemitrange width = 1.0 height = 1.0 depth = 0.0
    setlife min = 2.0 max = 3.0
    setanglespread spread = 1.0
    setspeedrange min = 2.0 max = 4.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = -0.1000 z = 0.0
    setparticlesize sw = 12.0 ew = 12.0
    setcolor corner = 0 sr = 102 sg = 102 sb = 102 sa = 255 er = 102 eg = 102 eb = 102 ea = 255
    setcolor corner = 1 sr = 102 sg = 102 sb = 102 sa = 255 er = 102 eg = 102 eb = 102 ea = 255
    setcolor corner = 2 sr = 102 sg = 102 sb = 102 sa = 255 er = 102 eg = 102 eb = 102 ea = 255
    setcolor corner = 3 sr = 102 sg = 102 sb = 102 sa = 255 er = 102 eg = 102 eb = 102 ea = 255
    setlodparams min_particles = 0 lod_dist1 = Default_Particle_LOD_Dist1 lod_dist2 = Default_Particle_LOD_Dist2
    emit num = 8
    destroy ifempty = 1
endscript

JOW_AP_Suitcase02_particle_params = {
    emitscript = emit_JOW_AP_Suitcase02_particle
    emitterindependent = 1
    max = 8
    type = Shaded
    texture = JOW_AP_Suitcase01
    BlendMode = Blend
    userandomuvquadrants
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_AP_Suitcase02_particle 
    setemitrange width = 1.0 height = 1.0 depth = 0.0
    setlife min = 2.0 max = 3.0
    setanglespread spread = 1.0
    setspeedrange min = 2.0 max = 4.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = -0.1000 z = 0.0
    setparticlesize sw = 12.0 ew = 12.0
    setcolor corner = 0 sr = 102 sg = 102 sb = 102 sa = 255 er = 102 eg = 102 eb = 102 ea = 255
    setcolor corner = 1 sr = 102 sg = 102 sb = 102 sa = 255 er = 102 eg = 102 eb = 102 ea = 255
    setcolor corner = 2 sr = 102 sg = 102 sb = 102 sa = 255 er = 102 eg = 102 eb = 102 ea = 255
    setcolor corner = 3 sr = 102 sg = 102 sb = 102 sa = 255 er = 102 eg = 102 eb = 102 ea = 255
    setlodparams min_particles = 0 lod_dist1 = Default_Particle_LOD_Dist1 lod_dist2 = Default_Particle_LOD_Dist2
    emit num = 8
    destroy ifempty = 1
endscript

JOW_AP_Suitcase03_particle_params = {
    emitscript = emit_JOW_AP_Suitcase03_particle
    emitterindependent = 1
    max = 8
    type = Shaded
    texture = JOW_AP_Suitcase01
    BlendMode = Blend
    userandomuvquadrants
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_AP_Suitcase03_particle 
    setemitrange width = 1.0 height = 1.0 depth = 0.0
    setlife min = 2.0 max = 3.0
    setanglespread spread = 1.0
    setspeedrange min = 2.0 max = 4.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = -0.1000 z = 0.0
    setparticlesize sw = 12.0 ew = 12.0
    setcolor corner = 0 sr = 102 sg = 102 sb = 102 sa = 255 er = 102 eg = 102 eb = 102 ea = 255
    setcolor corner = 1 sr = 102 sg = 102 sb = 102 sa = 255 er = 102 eg = 102 eb = 102 ea = 255
    setcolor corner = 2 sr = 102 sg = 102 sb = 102 sa = 255 er = 102 eg = 102 eb = 102 ea = 255
    setcolor corner = 3 sr = 102 sg = 102 sb = 102 sa = 255 er = 102 eg = 102 eb = 102 ea = 255
    setlodparams min_particles = 0 lod_dist1 = Default_Particle_LOD_Dist1 lod_dist2 = Default_Particle_LOD_Dist2
    emit num = 8
    destroy ifempty = 1
endscript

JOW_AP_Suitcase04_particle_params = {
    emitscript = emit_JOW_AP_Suitcase04_particle
    emitterindependent = 1
    max = 8
    type = Shaded
    texture = JOW_AP_Suitcase01
    BlendMode = Blend
    userandomuvquadrants
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_AP_Suitcase04_particle 
    setemitrange width = 1.0 height = 1.0 depth = 0.0
    setlife min = 2.0 max = 3.0
    setanglespread spread = 1.0
    setspeedrange min = 2.0 max = 4.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = -0.1000 z = 0.0
    setparticlesize sw = 12.0 ew = 12.0
    setcolor corner = 0 sr = 102 sg = 102 sb = 102 sa = 255 er = 102 eg = 102 eb = 102 ea = 255
    setcolor corner = 1 sr = 102 sg = 102 sb = 102 sa = 255 er = 102 eg = 102 eb = 102 ea = 255
    setcolor corner = 2 sr = 102 sg = 102 sb = 102 sa = 255 er = 102 eg = 102 eb = 102 ea = 255
    setcolor corner = 3 sr = 102 sg = 102 sb = 102 sa = 255 er = 102 eg = 102 eb = 102 ea = 255
    setlodparams min_particles = 0 lod_dist1 = Default_Particle_LOD_Dist1 lod_dist2 = Default_Particle_LOD_Dist2
    emit num = 8
    destroy ifempty = 1
endscript

JOW_AP_Suitcase05_particle_params = {
    emitscript = emit_JOW_AP_Suitcase05_particle
    emitterindependent = 1
    max = 8
    type = Shaded
    texture = JOW_AP_Suitcase01
    BlendMode = Blend
    userandomuvquadrants
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_AP_Suitcase05_particle 
    setemitrange width = 1.0 height = 1.0 depth = 0.0
    setlife min = 2.0 max = 3.0
    setanglespread spread = 1.0
    setspeedrange min = 2.0 max = 4.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = -0.1000 z = 0.0
    setparticlesize sw = 12.0 ew = 12.0
    setcolor corner = 0 sr = 102 sg = 102 sb = 102 sa = 255 er = 102 eg = 102 eb = 102 ea = 255
    setcolor corner = 1 sr = 102 sg = 102 sb = 102 sa = 255 er = 102 eg = 102 eb = 102 ea = 255
    setcolor corner = 2 sr = 102 sg = 102 sb = 102 sa = 255 er = 102 eg = 102 eb = 102 ea = 255
    setcolor corner = 3 sr = 102 sg = 102 sb = 102 sa = 255 er = 102 eg = 102 eb = 102 ea = 255
    setlodparams min_particles = 0 lod_dist1 = Default_Particle_LOD_Dist1 lod_dist2 = Default_Particle_LOD_Dist2
    emit num = 8
    destroy ifempty = 1
endscript

