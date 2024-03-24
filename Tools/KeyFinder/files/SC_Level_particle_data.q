

script load_level_particle_textures 
    LoadParticleTexture 'particles\jow_sc_alarm01'
    LoadParticleTexture 'particles\jow_sc_books01'
    LoadParticleTexture 'particles\jow_sc_star01'
endscript

JOW_SC_Alarm01_particle_params = {
    emitscript = emit_JOW_SC_Alarm01_particle
    max = 12
    type = Shaded
    texture = JOW_SC_Alarm01
    BlendMode = Blend
    userandomuvquadrants
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_SC_Alarm01_particle 
    setemitrange width = 20.0 height = 20.0 depth = 20.0
    setlife min = 2.0 max = 3.0
    setanglespread spread = 1.0
    setspeedrange min = 2.0 max = 4.0
    setemittarget x = -1.0 y = 0.5000 z = 0.0
    setforce x = 0.0 y = -0.08000 z = 0.0
    setparticlesize sw = 8.0 ew = 8.0
    setcolor corner = 0 sr = 119 sg = 119 sb = 119 sa = 255 er = 119 eg = 119 eb = 119 ea = 255
    setcolor corner = 1 sr = 119 sg = 119 sb = 119 sa = 255 er = 119 eg = 119 eb = 119 ea = 255
    setcolor corner = 2 sr = 119 sg = 119 sb = 119 sa = 255 er = 119 eg = 119 eb = 119 ea = 255
    setcolor corner = 3 sr = 119 sg = 119 sb = 119 sa = 255 er = 119 eg = 119 eb = 119 ea = 255
    setlodparams min_particles = 0 lod_dist1 = Default_Particle_LOD_Dist1 lod_dist2 = Default_Particle_LOD_Dist2
    emit num = 12
    destroy ifempty = 1
endscript

JOW_SC_Alarm01a_particle_params = {
    emitscript = emit_JOW_SC_Alarm01a_particle
    max = 24
    type = FlatRibbonTail
    texture = JOW_SC_Star01
    BlendMode = Blend
    History = 5
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_SC_Alarm01a_particle 
    setemitrange width = 20.0 height = 20.0 depth = 20.0
    setlife min = 1.0 max = 1.500
    setanglespread spread = 1.0
    setspeedrange min = 6.0 max = 6.0
    setemittarget x = -1.0 y = 0.5000 z = 0.0
    setforce x = 0.0 y = -0.08000 z = 0.0
    setparticlesize sw = 1.0 ew = 0.0
    setcolor corner = 0 sr = 255 sg = 148 sb = 66 sa = 196 er = 255 eg = 185 eb = 95 ea = 0
    setcolor corner = 1 sr = 255 sg = 148 sb = 66 sa = 196 er = 255 eg = 185 eb = 95 ea = 0
    setcolor corner = 2 sr = 255 sg = 148 sb = 66 sa = 196 er = 255 eg = 185 eb = 95 ea = 0
    setcolor corner = 3 sr = 255 sg = 148 sb = 66 sa = 196 er = 255 eg = 185 eb = 95 ea = 0
    setcolor corner = 4 sr = 255 sg = 148 sb = 66 sa = 136 er = 255 eg = 185 eb = 95 ea = 0
    setcolor corner = 5 sr = 255 sg = 148 sb = 66 sa = 72 er = 255 eg = 185 eb = 95 ea = 0
    setcolor corner = 6 sr = 255 sg = 148 sb = 66 sa = 0 er = 255 eg = 185 eb = 95 ea = 0
    setlodparams min_particles = 0 lod_dist1 = Default_Particle_LOD_Dist1 lod_dist2 = Default_Particle_LOD_Dist2
    emit num = 24
    destroy ifempty = 1
endscript

JOW_SC_Alarm02_particle_params = {
    emitscript = emit_JOW_SC_Alarm02_particle
    max = 12
    type = Shaded
    texture = JOW_SC_Alarm01
    BlendMode = Blend
    userandomuvquadrants
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_SC_Alarm02_particle 
    setemitrange width = 20.0 height = 20.0 depth = 20.0
    setlife min = 2.0 max = 3.0
    setanglespread spread = 1.0
    setspeedrange min = 2.0 max = 4.0
    setemittarget x = 0.0 y = 0.5000 z = -1.0
    setforce x = 0.0 y = -0.08000 z = 0.0
    setparticlesize sw = 8.0 ew = 8.0
    setcolor corner = 0 sr = 119 sg = 119 sb = 119 sa = 255 er = 119 eg = 119 eb = 119 ea = 255
    setcolor corner = 1 sr = 119 sg = 119 sb = 119 sa = 255 er = 119 eg = 119 eb = 119 ea = 255
    setcolor corner = 2 sr = 119 sg = 119 sb = 119 sa = 255 er = 119 eg = 119 eb = 119 ea = 255
    setcolor corner = 3 sr = 119 sg = 119 sb = 119 sa = 255 er = 119 eg = 119 eb = 119 ea = 255
    setlodparams min_particles = 0 lod_dist1 = Default_Particle_LOD_Dist1 lod_dist2 = Default_Particle_LOD_Dist2
    emit num = 12
    destroy ifempty = 1
endscript

JOW_SC_Alarm02a_particle_params = {
    emitscript = emit_JOW_SC_Alarm02a_particle
    max = 24
    type = FlatRibbonTail
    texture = JOW_SC_Star01
    BlendMode = Blend
    History = 5
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_SC_Alarm02a_particle 
    setemitrange width = 20.0 height = 20.0 depth = 20.0
    setlife min = 1.0 max = 1.500
    setanglespread spread = 1.0
    setspeedrange min = 6.0 max = 6.0
    setemittarget x = 0.0 y = 0.5000 z = -1.0
    setforce x = 0.0 y = -0.08000 z = 0.0
    setparticlesize sw = 1.0 ew = 0.0
    setcolor corner = 0 sr = 255 sg = 148 sb = 66 sa = 196 er = 255 eg = 185 eb = 95 ea = 0
    setcolor corner = 1 sr = 255 sg = 148 sb = 66 sa = 196 er = 255 eg = 185 eb = 95 ea = 0
    setcolor corner = 2 sr = 255 sg = 148 sb = 66 sa = 196 er = 255 eg = 185 eb = 95 ea = 0
    setcolor corner = 3 sr = 255 sg = 148 sb = 66 sa = 196 er = 255 eg = 185 eb = 95 ea = 0
    setcolor corner = 4 sr = 255 sg = 148 sb = 66 sa = 136 er = 255 eg = 185 eb = 95 ea = 0
    setcolor corner = 5 sr = 255 sg = 148 sb = 66 sa = 72 er = 255 eg = 185 eb = 95 ea = 0
    setcolor corner = 6 sr = 255 sg = 148 sb = 66 sa = 0 er = 255 eg = 185 eb = 95 ea = 0
    setlodparams min_particles = 0 lod_dist1 = Default_Particle_LOD_Dist1 lod_dist2 = Default_Particle_LOD_Dist2
    emit num = 24
    destroy ifempty = 1
endscript

JOW_SC_Alarm03_particle_params = {
    emitscript = emit_JOW_SC_Alarm03_particle
    max = 12
    type = Shaded
    texture = JOW_SC_Alarm01
    BlendMode = Blend
    userandomuvquadrants
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_SC_Alarm03_particle 
    setemitrange width = 20.0 height = 20.0 depth = 20.0
    setlife min = 2.0 max = 3.0
    setanglespread spread = 1.0
    setspeedrange min = 2.0 max = 4.0
    setemittarget x = 0.0 y = 0.5000 z = -1.0
    setforce x = 0.0 y = -0.08000 z = 0.0
    setparticlesize sw = 8.0 ew = 8.0
    setcolor corner = 0 sr = 119 sg = 119 sb = 119 sa = 255 er = 119 eg = 119 eb = 119 ea = 255
    setcolor corner = 1 sr = 119 sg = 119 sb = 119 sa = 255 er = 119 eg = 119 eb = 119 ea = 255
    setcolor corner = 2 sr = 119 sg = 119 sb = 119 sa = 255 er = 119 eg = 119 eb = 119 ea = 255
    setcolor corner = 3 sr = 119 sg = 119 sb = 119 sa = 255 er = 119 eg = 119 eb = 119 ea = 255
    setlodparams min_particles = 0 lod_dist1 = Default_Particle_LOD_Dist1 lod_dist2 = Default_Particle_LOD_Dist2
    emit num = 12
    destroy ifempty = 1
endscript

JOW_SC_Alarm03a_particle_params = {
    emitscript = emit_JOW_SC_Alarm03a_particle
    max = 24
    type = FlatRibbonTail
    texture = JOW_SC_Star01
    BlendMode = Blend
    History = 5
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_SC_Alarm03a_particle 
    setemitrange width = 20.0 height = 20.0 depth = 20.0
    setlife min = 1.0 max = 1.500
    setanglespread spread = 1.0
    setspeedrange min = 6.0 max = 6.0
    setemittarget x = 0.0 y = 0.5000 z = -1.0
    setforce x = 0.0 y = -0.08000 z = 0.0
    setparticlesize sw = 1.0 ew = 0.0
    setcolor corner = 0 sr = 255 sg = 148 sb = 66 sa = 196 er = 255 eg = 185 eb = 95 ea = 0
    setcolor corner = 1 sr = 255 sg = 148 sb = 66 sa = 196 er = 255 eg = 185 eb = 95 ea = 0
    setcolor corner = 2 sr = 255 sg = 148 sb = 66 sa = 196 er = 255 eg = 185 eb = 95 ea = 0
    setcolor corner = 3 sr = 255 sg = 148 sb = 66 sa = 196 er = 255 eg = 185 eb = 95 ea = 0
    setcolor corner = 4 sr = 255 sg = 148 sb = 66 sa = 136 er = 255 eg = 185 eb = 95 ea = 0
    setcolor corner = 5 sr = 255 sg = 148 sb = 66 sa = 72 er = 255 eg = 185 eb = 95 ea = 0
    setcolor corner = 6 sr = 255 sg = 148 sb = 66 sa = 0 er = 255 eg = 185 eb = 95 ea = 0
    setlodparams min_particles = 0 lod_dist1 = Default_Particle_LOD_Dist1 lod_dist2 = Default_Particle_LOD_Dist2
    emit num = 24
    destroy ifempty = 1
endscript

JOW_SC_Alarm04_particle_params = {
    emitscript = emit_JOW_SC_Alarm04_particle
    max = 12
    type = Shaded
    texture = JOW_SC_Alarm01
    BlendMode = Blend
    userandomuvquadrants
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_SC_Alarm04_particle 
    setemitrange width = 20.0 height = 20.0 depth = 20.0
    setlife min = 2.0 max = 3.0
    setanglespread spread = 1.0
    setspeedrange min = 2.0 max = 4.0
    setemittarget x = 0.0 y = 0.5000 z = -1.0
    setforce x = 0.0 y = -0.08000 z = 0.0
    setparticlesize sw = 8.0 ew = 8.0
    setcolor corner = 0 sr = 119 sg = 119 sb = 119 sa = 255 er = 119 eg = 119 eb = 119 ea = 255
    setcolor corner = 1 sr = 119 sg = 119 sb = 119 sa = 255 er = 119 eg = 119 eb = 119 ea = 255
    setcolor corner = 2 sr = 119 sg = 119 sb = 119 sa = 255 er = 119 eg = 119 eb = 119 ea = 255
    setcolor corner = 3 sr = 119 sg = 119 sb = 119 sa = 255 er = 119 eg = 119 eb = 119 ea = 255
    setlodparams min_particles = 0 lod_dist1 = Default_Particle_LOD_Dist1 lod_dist2 = Default_Particle_LOD_Dist2
    emit num = 12
    destroy ifempty = 1
endscript

JOW_SC_Alarm04a_particle_params = {
    emitscript = emit_JOW_SC_Alarm04a_particle
    max = 24
    type = FlatRibbonTail
    texture = JOW_SC_Star01
    BlendMode = Blend
    History = 5
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_SC_Alarm04a_particle 
    setemitrange width = 20.0 height = 20.0 depth = 20.0
    setlife min = 1.0 max = 1.500
    setanglespread spread = 1.0
    setspeedrange min = 6.0 max = 6.0
    setemittarget x = 0.0 y = 0.5000 z = -1.0
    setforce x = 0.0 y = -0.08000 z = 0.0
    setparticlesize sw = 1.0 ew = 0.0
    setcolor corner = 0 sr = 255 sg = 148 sb = 66 sa = 196 er = 255 eg = 185 eb = 95 ea = 0
    setcolor corner = 1 sr = 255 sg = 148 sb = 66 sa = 196 er = 255 eg = 185 eb = 95 ea = 0
    setcolor corner = 2 sr = 255 sg = 148 sb = 66 sa = 196 er = 255 eg = 185 eb = 95 ea = 0
    setcolor corner = 3 sr = 255 sg = 148 sb = 66 sa = 196 er = 255 eg = 185 eb = 95 ea = 0
    setcolor corner = 4 sr = 255 sg = 148 sb = 66 sa = 136 er = 255 eg = 185 eb = 95 ea = 0
    setcolor corner = 5 sr = 255 sg = 148 sb = 66 sa = 72 er = 255 eg = 185 eb = 95 ea = 0
    setcolor corner = 6 sr = 255 sg = 148 sb = 66 sa = 0 er = 255 eg = 185 eb = 95 ea = 0
    setlodparams min_particles = 0 lod_dist1 = Default_Particle_LOD_Dist1 lod_dist2 = Default_Particle_LOD_Dist2
    emit num = 24
    destroy ifempty = 1
endscript

JOW_SC_Alarm05_particle_params = {
    emitscript = emit_JOW_SC_Alarm05_particle
    max = 12
    type = Shaded
    texture = JOW_SC_Alarm01
    BlendMode = Blend
    userandomuvquadrants
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_SC_Alarm05_particle 
    setemitrange width = 20.0 height = 20.0 depth = 20.0
    setlife min = 2.0 max = 3.0
    setanglespread spread = 1.0
    setspeedrange min = 2.0 max = 4.0
    setemittarget x = 1.0 y = 0.5000 z = 0.0
    setforce x = 0.0 y = -0.08000 z = 0.0
    setparticlesize sw = 8.0 ew = 8.0
    setcolor corner = 0 sr = 119 sg = 119 sb = 119 sa = 255 er = 119 eg = 119 eb = 119 ea = 255
    setcolor corner = 1 sr = 119 sg = 119 sb = 119 sa = 255 er = 119 eg = 119 eb = 119 ea = 255
    setcolor corner = 2 sr = 119 sg = 119 sb = 119 sa = 255 er = 119 eg = 119 eb = 119 ea = 255
    setcolor corner = 3 sr = 119 sg = 119 sb = 119 sa = 255 er = 119 eg = 119 eb = 119 ea = 255
    setlodparams min_particles = 0 lod_dist1 = Default_Particle_LOD_Dist1 lod_dist2 = Default_Particle_LOD_Dist2
    emit num = 12
    destroy ifempty = 1
endscript

JOW_SC_Alarm05a_particle_params = {
    emitscript = emit_JOW_SC_Alarm05a_particle
    max = 24
    type = FlatRibbonTail
    texture = JOW_SC_Star01
    BlendMode = Blend
    History = 5
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_SC_Alarm05a_particle 
    setemitrange width = 20.0 height = 20.0 depth = 20.0
    setlife min = 1.0 max = 1.500
    setanglespread spread = 1.0
    setspeedrange min = 6.0 max = 6.0
    setemittarget x = 1.0 y = 0.5000 z = 0.0
    setforce x = 0.0 y = -0.08000 z = 0.0
    setparticlesize sw = 1.0 ew = 0.0
    setcolor corner = 0 sr = 255 sg = 148 sb = 66 sa = 196 er = 255 eg = 185 eb = 95 ea = 0
    setcolor corner = 1 sr = 255 sg = 148 sb = 66 sa = 196 er = 255 eg = 185 eb = 95 ea = 0
    setcolor corner = 2 sr = 255 sg = 148 sb = 66 sa = 196 er = 255 eg = 185 eb = 95 ea = 0
    setcolor corner = 3 sr = 255 sg = 148 sb = 66 sa = 196 er = 255 eg = 185 eb = 95 ea = 0
    setcolor corner = 4 sr = 255 sg = 148 sb = 66 sa = 136 er = 255 eg = 185 eb = 95 ea = 0
    setcolor corner = 5 sr = 255 sg = 148 sb = 66 sa = 72 er = 255 eg = 185 eb = 95 ea = 0
    setcolor corner = 6 sr = 255 sg = 148 sb = 66 sa = 0 er = 255 eg = 185 eb = 95 ea = 0
    setlodparams min_particles = 0 lod_dist1 = Default_Particle_LOD_Dist1 lod_dist2 = Default_Particle_LOD_Dist2
    emit num = 24
    destroy ifempty = 1
endscript

JOW_SC_Books01_particle_params = {
    emitscript = emit_JOW_SC_Books01_particle
    max = 12
    type = Shaded
    texture = JOW_SC_Books01
    BlendMode = Blend
    userandomuvquadrants
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_SC_Books01_particle 
    setemitrange width = 10.0 height = 10.0 depth = 10.0
    setlife min = 2.0 max = 3.0
    setanglespread spread = 1.0
    setspeedrange min = 2.0 max = 3.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = -0.06000 z = 0.0
    setparticlesize sw = 12.0 ew = 12.0
    setcolor corner = 0 sr = 89 sg = 89 sb = 89 sa = 255 er = 89 eg = 89 eb = 89 ea = 255
    setcolor corner = 1 sr = 89 sg = 89 sb = 89 sa = 255 er = 89 eg = 89 eb = 89 ea = 255
    setcolor corner = 2 sr = 89 sg = 89 sb = 89 sa = 255 er = 89 eg = 89 eb = 89 ea = 255
    setcolor corner = 3 sr = 89 sg = 89 sb = 89 sa = 255 er = 89 eg = 89 eb = 89 ea = 255
    setlodparams min_particles = 0 lod_dist1 = Default_Particle_LOD_Dist1 lod_dist2 = Default_Particle_LOD_Dist2
    emit num = 12
    destroy ifempty = 1
endscript

JOW_SC_Books02_particle_params = {
    emitscript = emit_JOW_SC_Books02_particle
    max = 12
    type = Shaded
    texture = JOW_SC_Books01
    BlendMode = Blend
    userandomuvquadrants
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_SC_Books02_particle 
    setemitrange width = 10.0 height = 10.0 depth = 10.0
    setlife min = 2.0 max = 3.0
    setanglespread spread = 1.0
    setspeedrange min = 2.0 max = 3.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = -0.06000 z = 0.0
    setparticlesize sw = 12.0 ew = 12.0
    setcolor corner = 0 sr = 89 sg = 89 sb = 89 sa = 255 er = 89 eg = 89 eb = 89 ea = 255
    setcolor corner = 1 sr = 89 sg = 89 sb = 89 sa = 255 er = 89 eg = 89 eb = 89 ea = 255
    setcolor corner = 2 sr = 89 sg = 89 sb = 89 sa = 255 er = 89 eg = 89 eb = 89 ea = 255
    setcolor corner = 3 sr = 89 sg = 89 sb = 89 sa = 255 er = 89 eg = 89 eb = 89 ea = 255
    setlodparams min_particles = 0 lod_dist1 = Default_Particle_LOD_Dist1 lod_dist2 = Default_Particle_LOD_Dist2
    emit num = 12
    destroy ifempty = 1
endscript

JOW_SC_Books03_particle_params = {
    emitscript = emit_JOW_SC_Books03_particle
    max = 12
    type = Shaded
    texture = JOW_SC_Books01
    BlendMode = Blend
    userandomuvquadrants
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_SC_Books03_particle 
    setemitrange width = 10.0 height = 10.0 depth = 10.0
    setlife min = 2.0 max = 3.0
    setanglespread spread = 1.0
    setspeedrange min = 2.0 max = 3.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = -0.06000 z = 0.0
    setparticlesize sw = 12.0 ew = 12.0
    setcolor corner = 0 sr = 89 sg = 89 sb = 89 sa = 255 er = 89 eg = 89 eb = 89 ea = 255
    setcolor corner = 1 sr = 89 sg = 89 sb = 89 sa = 255 er = 89 eg = 89 eb = 89 ea = 255
    setcolor corner = 2 sr = 89 sg = 89 sb = 89 sa = 255 er = 89 eg = 89 eb = 89 ea = 255
    setcolor corner = 3 sr = 89 sg = 89 sb = 89 sa = 255 er = 89 eg = 89 eb = 89 ea = 255
    setlodparams min_particles = 0 lod_dist1 = Default_Particle_LOD_Dist1 lod_dist2 = Default_Particle_LOD_Dist2
    emit num = 12
    destroy ifempty = 1
endscript

JOW_SC_Books04_particle_params = {
    emitscript = emit_JOW_SC_Books04_particle
    max = 12
    type = Shaded
    texture = JOW_SC_Books01
    BlendMode = Blend
    userandomuvquadrants
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_SC_Books04_particle 
    setemitrange width = 10.0 height = 10.0 depth = 10.0
    setlife min = 2.0 max = 3.0
    setanglespread spread = 1.0
    setspeedrange min = 2.0 max = 3.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = -0.06000 z = 0.0
    setparticlesize sw = 12.0 ew = 12.0
    setcolor corner = 0 sr = 89 sg = 89 sb = 89 sa = 255 er = 89 eg = 89 eb = 89 ea = 255
    setcolor corner = 1 sr = 89 sg = 89 sb = 89 sa = 255 er = 89 eg = 89 eb = 89 ea = 255
    setcolor corner = 2 sr = 89 sg = 89 sb = 89 sa = 255 er = 89 eg = 89 eb = 89 ea = 255
    setcolor corner = 3 sr = 89 sg = 89 sb = 89 sa = 255 er = 89 eg = 89 eb = 89 ea = 255
    setlodparams min_particles = 0 lod_dist1 = Default_Particle_LOD_Dist1 lod_dist2 = Default_Particle_LOD_Dist2
    emit num = 12
    destroy ifempty = 1
endscript

JOW_SC_Books05_particle_params = {
    emitscript = emit_JOW_SC_Books05_particle
    max = 12
    type = Shaded
    texture = JOW_SC_Books01
    BlendMode = Blend
    userandomuvquadrants
    useglobalcolormodulation
    priority = 0
}

script emit_JOW_SC_Books05_particle 
    setemitrange width = 10.0 height = 10.0 depth = 10.0
    setlife min = 2.0 max = 3.0
    setanglespread spread = 1.0
    setspeedrange min = 2.0 max = 3.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = -0.06000 z = 0.0
    setparticlesize sw = 12.0 ew = 12.0
    setcolor corner = 0 sr = 89 sg = 89 sb = 89 sa = 255 er = 89 eg = 89 eb = 89 ea = 255
    setcolor corner = 1 sr = 89 sg = 89 sb = 89 sa = 255 er = 89 eg = 89 eb = 89 ea = 255
    setcolor corner = 2 sr = 89 sg = 89 sb = 89 sa = 255 er = 89 eg = 89 eb = 89 ea = 255
    setcolor corner = 3 sr = 89 sg = 89 sb = 89 sa = 255 er = 89 eg = 89 eb = 89 ea = 255
    setlodparams min_particles = 0 lod_dist1 = Default_Particle_LOD_Dist1 lod_dist2 = Default_Particle_LOD_Dist2
    emit num = 12
    destroy ifempty = 1
endscript

