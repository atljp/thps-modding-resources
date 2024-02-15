
script load_permanent_particle_textures 
    LoadParticleTexture 'particles\apm_debis_01' perm
    LoadParticleTexture 'particles\apm_debis_quad01' perm
    LoadParticleTexture 'particles\apm_debris_xploder01' perm
    LoadParticleTexture 'particles\apm_fallingwater_01' perm
    LoadParticleTexture 'particles\apm_flame_rot01' perm
    LoadParticleTexture 'particles\apm_flamequad_01' perm
    LoadParticleTexture 'particles\apm_grass01' perm
    LoadParticleTexture 'particles\apm_harcircle' perm
    LoadParticleTexture 'particles\apm_lightning02' perm
    LoadParticleTexture 'particles\apm_marker01' perm
    LoadParticleTexture 'particles\apm_rainbow' perm
    LoadParticleTexture 'particles\apm_ring_01' perm
    LoadParticleTexture 'particles\apm_ring_02' perm
    LoadParticleTexture 'particles\apm_smokepuff_rot_01' perm
    LoadParticleTexture 'particles\apm_smokepuff_rot_01b' perm
    LoadParticleTexture 'particles\apm_smoketrail01' perm
    LoadParticleTexture 'particles\apm_spark_01' perm
    LoadParticleTexture 'particles\apm_spark_03' perm
    LoadParticleTexture 'particles\apm_splinters_01' perm
    LoadParticleTexture 'particles\apm_spray_01' perm
    LoadParticleTexture 'particles\apm_trail01' perm
    LoadParticleTexture 'particles\apm_trail01side' perm
    LoadParticleTexture 'particles\apm_water_splash01' perm
    LoadParticleTexture 'particles\ba_apm_ripple' perm
    LoadParticleTexture 'particles\ba_apm_softsgrade01' perm
    LoadParticleTexture 'particles\jow_au_chunks01' perm
    LoadParticleTexture 'particles\skidmarks' perm
endscript
APM_DT_LE_RKTSMK01_particle_params = {
    boneoffset = (0.0, 0.0, 22.0)
    emitscript = emit_APM_DT_LE_RKTSMK01_particle
    emitterindependent = 1
    fillpath
    max = 256
    type = Shaded
    texture = apm_smokepuff_rot_01b
    BlendMode = Blend
    rotvel = (0.0, 0.5)
    rotveltimescale = 0.2000
    useglobalcolormodulation
    priority = 0
    suspenddistance = Default_Particle_Suspend_Dist
}

script emit_APM_DT_LE_RKTSMK01_particle 
    setemitrange width = 1.0 height = 1.0 depth = 0.0
    setlife min = 1.0 max = 1.0
    setanglespread spread = 0.1200
    setspeedrange min = 0.1000 max = 1.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.02000 z = 0.0
    setparticlesize sw = 10.0 ew = 20.0 sh = 10.0 eh = 20.0
    setcolor corner = 0 sr = 244 sg = 120 sb = 75 sa = 37 mr = 235 mg = 235 mb = 235 ma = 112 er = 209 eg = 209 eb = 209 ea = 0 midTime = 0.2100
    setcolor corner = 1 sr = 244 sg = 120 sb = 75 sa = 37 mr = 235 mg = 235 mb = 235 ma = 112 er = 209 eg = 209 eb = 209 ea = 0 midTime = 0.2100
    setcolor corner = 2 sr = 244 sg = 120 sb = 75 sa = 37 mr = 235 mg = 235 mb = 235 ma = 112 er = 209 eg = 209 eb = 209 ea = 0 midTime = 0.2100
    setcolor corner = 3 sr = 244 sg = 120 sb = 75 sa = 37 mr = 235 mg = 235 mb = 235 ma = 112 er = 209 eg = 209 eb = 209 ea = 0 midTime = 0.2100
    emitrate rate = 256.0
endscript
APM_DT_LE_RKTSMK02_particle_params = {
    enablerotate
    emitscript = emit_APM_DT_LE_RKTSMK02_particle
    emitterindependent = 1
    fillpath
    max = 256
    type = Shaded
    texture = apm_smokepuff_rot_01
    BlendMode = Blend
    rotvel = (0.0, 0.5)
    rotveltimescale = 0.5000
    priority = 0
    suspenddistance = Default_Particle_Suspend_Dist
}

script emit_APM_DT_LE_RKTSMK02_particle 
    setemitrange width = 1.0 height = 1.0 depth = 0.0
    setlife min = 1.0 max = 2.0
    setanglespread spread = 0.5100
    setspeedrange min = 1.0 max = 2.0
    setemitangle x = 0.0 y = 300.0 z = 0.0
    setforce x = 0.0 y = 0.0 z = 0.0
    setparticlesize sw = 5.0 ew = 33.0 sh = 5.0 eh = 33.0
    setcolor corner = 0 sr = 244 sg = 120 sb = 75 sa = 255 mr = 240 mg = 238 mb = 255 ma = 185 er = 143 eg = 143 eb = 143 ea = 0 midTime = 0.4100
    setcolor corner = 1 sr = 244 sg = 120 sb = 75 sa = 255 mr = 240 mg = 238 mb = 255 ma = 185 er = 143 eg = 143 eb = 143 ea = 0 midTime = 0.4100
    setcolor corner = 2 sr = 244 sg = 120 sb = 75 sa = 255 mr = 240 mg = 238 mb = 255 ma = 185 er = 143 eg = 143 eb = 143 ea = 0 midTime = 0.4100
    setcolor corner = 3 sr = 244 sg = 120 sb = 75 sa = 255 mr = 240 mg = 238 mb = 255 ma = 185 er = 143 eg = 143 eb = 143 ea = 0 midTime = 0.4100
    emitrate rate = 256.0
endscript
APM_DT_LE_RKTfire01_particle_params = {
    enablerotate
    emitscript = emit_APM_DT_LE_RKTfire01_particle
    max = 26
    type = Shaded
    texture = apm_smokepuff_rot_01b
    BlendMode = Add
    rotvel = (0.0, 1.0)
    rotveltimescale = 0.5000
    priority = 0
    suspenddistance = Default_Particle_Suspend_Dist
}

script emit_APM_DT_LE_RKTfire01_particle 
    setemitrange width = 1.0 height = 1.0 depth = 0.0
    setlife min = 0.1000 max = 0.1000
    setanglespread spread = 0.1800
    setspeedrange min = 5.0 max = 8.0
    setemitangle x = 0.0 y = 300.0 z = 0.0
    setforce x = 0.0 y = 0.0 z = 0.0
    setparticlesize sw = 10.0 ew = 5.0 sh = 10.0 eh = 5.0
    setcolor corner = 0 sr = 244 sg = 120 sb = 75 sa = 255 mr = 255 mg = 89 mb = 31 ma = 185 er = 143 eg = 0 eb = 0 ea = 0 midTime = 0.4100
    setcolor corner = 1 sr = 244 sg = 120 sb = 75 sa = 255 mr = 255 mg = 89 mb = 31 ma = 185 er = 143 eg = 0 eb = 0 ea = 0 midTime = 0.4100
    setcolor corner = 2 sr = 244 sg = 120 sb = 75 sa = 255 mr = 255 mg = 89 mb = 31 ma = 185 er = 143 eg = 0 eb = 0 ea = 0 midTime = 0.4100
    setcolor corner = 3 sr = 244 sg = 120 sb = 75 sa = 255 mr = 255 mg = 89 mb = 31 ma = 185 er = 143 eg = 0 eb = 0 ea = 0 midTime = 0.4100
    emitrate rate = 256.0
endscript
APM_DT_LE_SL_smoke01_particle_params = {
    emitscript = emit_APM_DT_LE_SL_smoke01_particle
    emitterindependent = 1
    fillpath
    max = 256
    type = Shaded
    texture = apm_spray_01
    BlendMode = Blend
    rotvel = (0.0, 1.0)
    rotveltimescale = 0.2000
    useglobalcolormodulation
    priority = 0
    suspenddistance = Default_Particle_Suspend_Dist
}

script emit_APM_DT_LE_SL_smoke01_particle 
    setemitrange width = 71.10 height = 56.30 depth = 26.80
    setlife min = 0.5000 max = 1.0
    setanglespread elevation = (-0.5, 0.5) sweep = (-1.0, 1.0)
    setspeedrange min = 0.1000 max = 0.1000
    setemittarget x = 0.0 y = -1.0 z = 0.0
    setforce x = 0.0 y = 0.02000 z = 0.0
    setparticlesize sw = 43.60 ew = 30.0 sh = 38.80 eh = 30.37
    setcolor corner = 0 sr = 13 sg = 13 sb = 13 sa = 0 mr = 31 mg = 30 mb = 29 ma = 255 er = 31 eg = 31 eb = 31 ea = 0 midTime = 0.4100
    setcolor corner = 1 sr = 13 sg = 13 sb = 13 sa = 0 mr = 31 mg = 30 mb = 29 ma = 255 er = 31 eg = 31 eb = 31 ea = 0 midTime = 0.4100
    setcolor corner = 2 sr = 13 sg = 13 sb = 13 sa = 0 mr = 31 mg = 30 mb = 29 ma = 255 er = 31 eg = 31 eb = 31 ea = 0 midTime = 0.4100
    setcolor corner = 3 sr = 13 sg = 13 sb = 13 sa = 0 mr = 31 mg = 30 mb = 29 ma = 255 er = 31 eg = 31 eb = 31 ea = 0 midTime = 0.4100
    emitrate rate = 256.0
endscript
APM_DT_LE_XPLODER_DEBRIS02_particle_params = {
    emitscript = emit_APM_DT_LE_XPLODER_DEBRIS02_particle
    radiate
    max = 128
    type = smooth
    texture = apm_debis_01
    BlendMode = Blend
    userandomuvquadrants
    rotvel = (0.0, 5.0)
    rotveltimescale = 0.2000
    useglobalcolormodulation
    priority = 0
    suspenddistance = Default_Particle_Suspend_Dist
}

script emit_APM_DT_LE_XPLODER_DEBRIS02_particle 
    setemitrange width = 1.0 height = 1.0 depth = 0.0
    setlife min = 0.2000 max = 0.7500
    setanglespread elevation = (0.0, 0.5) sweep = (-1.0, 1.0)
    setspeedrange min = 10.0 max = 20.0
    setemittarget x = 0.0 y = 0.0 z = 1.0
    setforce x = 0.0 y = -0.3000 z = 0.05000
    setparticlesize sw = 10.0 ew = 10.0 sh = 10.0 eh = 10.0
    setcolor corner = 0 sr = 244 sg = 74 sb = 12 sa = 0 mr = 83 mg = 73 mb = 70 ma = 255 er = 70 eg = 70 eb = 70 ea = 0 midTime = 0.4100
    setcolor corner = 1 sr = 244 sg = 74 sb = 12 sa = 0 mr = 83 mg = 73 mb = 70 ma = 255 er = 70 eg = 70 eb = 70 ea = 0 midTime = 0.4100
    emit num = 128
    destroy ifempty = 1
endscript
APM_DT_LE_XPLODER_DEBRIS_particle_params = {
    emitscript = emit_APM_DT_LE_XPLODER_DEBRIS_particle
    emitterindependent = 1
    radiate
    max = 128
    type = Shaded
    texture = apm_debris_xploder01
    BlendMode = Blend
    rotvel = (0.0, 1.0)
    rotveltimescale = 0.2000
    useglobalcolormodulation
    priority = 0
    suspenddistance = Default_Particle_Suspend_Dist
}

script emit_APM_DT_LE_XPLODER_DEBRIS_particle 
    setemitrange width = 1.0 height = 1.0 depth = 0.0
    setlife min = 0.2000 max = 0.7500
    setanglespread elevation = (0.0, 0.5) sweep = (-1.0, 1.0)
    setspeedrange min = 10.0 max = 20.0
    setemittarget x = 0.0 y = 0.0 z = 1.0
    setforce x = 0.0 y = -0.3000 z = 0.05000
    setparticlesize sw = 10.0 ew = 10.0 sh = 10.0 eh = 10.0
    setcolor corner = 0 sr = 244 sg = 120 sb = 75 sa = 0 mr = 127 mg = 85 mb = 66 ma = 255 er = 0 eg = 0 eb = 0 ea = 0 midTime = 0.4100
    setcolor corner = 1 sr = 244 sg = 120 sb = 75 sa = 0 mr = 127 mg = 85 mb = 66 ma = 255 er = 0 eg = 0 eb = 0 ea = 0 midTime = 0.4100
    setcolor corner = 2 sr = 244 sg = 120 sb = 75 sa = 0 mr = 127 mg = 85 mb = 66 ma = 255 er = 0 eg = 0 eb = 0 ea = 0 midTime = 0.4100
    setcolor corner = 3 sr = 244 sg = 120 sb = 75 sa = 0 mr = 127 mg = 85 mb = 66 ma = 255 er = 0 eg = 0 eb = 0 ea = 0 midTime = 0.4100
    emit num = 128
    destroy ifempty = 1
endscript
APM_DT_LE_XPLODER_fire_particle_params = {
    emitscript = emit_APM_DT_LE_XPLODER_fire_particle
    radiate
    max = 133
    type = smooth
    texture = apm_smokepuff_rot_01
    BlendMode = Add
    rotvel = (0.0, 5.0)
    rotveltimescale = 0.2000
    priority = 0
    suspenddistance = Default_Particle_Suspend_Dist
}

script emit_APM_DT_LE_XPLODER_fire_particle 
    setemitrange width = 1.0 height = 1.0 depth = 0.0
    setlife min = 0.2000 max = 0.2000
    setanglespread elevation = (0.0, 0.5) sweep = (-1.0, 1.0)
    setspeedrange min = 11.0 max = 22.0
    setemittarget x = -1.0 y = 0.0 z = 0.0
    setforce x = 0.0 y = 0.0 z = 0.0
    setparticlesize sw = 44.0 ew = 33.0 sh = 22.0 eh = 44.0
    setcolor corner = 0 sr = 244 sg = 82 sb = 12 sa = 0 mr = 244 mg = 32 mb = 0 ma = 255 er = 255 eg = 4 eb = 4 ea = 0 midTime = 0.4100
    setcolor corner = 1 sr = 244 sg = 82 sb = 12 sa = 0 mr = 244 mg = 32 mb = 0 ma = 255 er = 255 eg = 4 eb = 4 ea = 0 midTime = 0.4100
    emitrate rate = 666.0
    wait 0.3000 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript
APM_DT_LE_XPLODER_smoke01_particle_params = {
    emitscript = emit_APM_DT_LE_XPLODER_smoke01_particle
    radiate
    max = 128
    type = Shaded
    texture = apm_smokepuff_rot_01b
    BlendMode = Blend
    rotvel = (0.0, 0.4000000059604645)
    rotveltimescale = 0.2000
    useglobalcolormodulation
    priority = 0
    suspenddistance = Default_Particle_Suspend_Dist
}

script emit_APM_DT_LE_XPLODER_smoke01_particle 
    setemitrange width = 1.0 height = 1.0 depth = 0.0
    setlife min = 0.5000 max = 5.0
    setanglespread elevation = (0.0, 0.5) sweep = (-1.0, 1.0)
    setspeedrange min = 1.0 max = 5.0
    setemittarget x = -1.0 y = 0.0 z = 0.0
    setforce x = 0.0 y = 0.03000 z = 0.0
    setparticlesize sw = 22.0 ew = 55.0 sh = 22.0 eh = 55.0
    setcolor corner = 0 sr = 255 sg = 78 sb = 70 sa = 0 mr = 68 mg = 60 mb = 57 ma = 255 er = 70 eg = 70 eb = 70 ea = 0 midTime = 0.2100
    setcolor corner = 1 sr = 255 sg = 78 sb = 70 sa = 0 mr = 68 mg = 60 mb = 57 ma = 255 er = 70 eg = 70 eb = 70 ea = 0 midTime = 0.2100
    setcolor corner = 2 sr = 255 sg = 78 sb = 70 sa = 0 mr = 68 mg = 60 mb = 57 ma = 255 er = 70 eg = 70 eb = 70 ea = 0 midTime = 0.2100
    setcolor corner = 3 sr = 255 sg = 78 sb = 70 sa = 0 mr = 68 mg = 60 mb = 57 ma = 255 er = 70 eg = 70 eb = 70 ea = 0 midTime = 0.2100
    emitrate rate = 256.0
    wait 0.5000 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript
APM_DT_LE_XPLODER_sparks_particle_params = {
    emitscript = emit_APM_DT_LE_XPLODER_sparks_particle
    radiate
    max = 256
    type = smooth
    texture = apm_spark_03
    BlendMode = Add
    rotvel = (0.0, 5.0)
    rotveltimescale = 0.2000
    useglobalcolormodulation
    priority = 0
    suspenddistance = Default_Particle_Suspend_Dist
}

script emit_APM_DT_LE_XPLODER_sparks_particle 
    setemitrange width = 1.0 height = 1.0 depth = 0.0
    setlife min = 0.5000 max = 1.0
    setanglespread elevation = (0.0, 0.5) sweep = (-1.0, 1.0)
    setspeedrange min = 11.0 max = 22.0
    setemittarget x = -1.0 y = 0.0 z = 0.0
    setforce x = 0.0 y = -0.5000 z = 0.0
    setparticlesize sw = 5.0 ew = 1.0 sh = 5.0 eh = 1.0
    setcolor corner = 0 sr = 244 sg = 122 sb = 12 sa = 0 mr = 244 mg = 65 mb = 0 ma = 255 er = 255 eg = 26 eb = 26 ea = 0 midTime = 0.4100
    setcolor corner = 1 sr = 244 sg = 122 sb = 12 sa = 0 mr = 244 mg = 65 mb = 0 ma = 255 er = 255 eg = 26 eb = 26 ea = 0 midTime = 0.4100
    emit num = 256
    destroy ifempty = 1
endscript
APM_DT_LE_flamingtrash_particle_params = {
    enablerotate
    emitscript = emit_APM_DT_LE_flamingtrash_particle
    emitterindependent = 1
    fillpath
    max = 39
    type = Shaded
    texture = apm_flame_rot01
    BlendMode = Add
    rotvel = (0.0, 1.0)
    rotveltimescale = 0.5000
    priority = 0
    suspenddistance = Default_Particle_Suspend_Dist
}

script emit_APM_DT_LE_flamingtrash_particle 
    setemitrange width = 1.0 height = 1.0 depth = 1.0
    setlife min = 0.1000 max = 0.5000
    setanglespread spread = 0.1800
    setspeedrange min = 0.1000 max = 0.1000
    setforce x = 0.0 y = 0.0 z = 0.0
    setparticlesize sw = 5.0 ew = 3.0 sh = 10.0 eh = 5.0
    setcolor corner = 0 sr = 244 sg = 120 sb = 75 sa = 255 mr = 255 mg = 89 mb = 31 ma = 185 er = 143 eg = 0 eb = 0 ea = 0 midTime = 0.4100
    setcolor corner = 1 sr = 244 sg = 120 sb = 75 sa = 255 mr = 255 mg = 89 mb = 31 ma = 185 er = 143 eg = 0 eb = 0 ea = 0 midTime = 0.4100
    setcolor corner = 2 sr = 244 sg = 120 sb = 75 sa = 255 mr = 255 mg = 89 mb = 31 ma = 185 er = 143 eg = 0 eb = 0 ea = 0 midTime = 0.4100
    setcolor corner = 3 sr = 244 sg = 120 sb = 75 sa = 255 mr = 255 mg = 89 mb = 31 ma = 185 er = 143 eg = 0 eb = 0 ea = 0 midTime = 0.4100
    emitrate rate = 80.0
endscript
APM_DT_LE_smokingtrash_particle_params = {
    emitscript = emit_APM_DT_LE_smokingtrash_particle
    emitterindependent = 1
    fillpath
    max = 80
    type = Shaded
    texture = apm_smokepuff_rot_01
    BlendMode = Blend
    rotvel = (0.0, 0.5)
    rotveltimescale = 0.5000
    priority = 0
    suspenddistance = Default_Particle_Suspend_Dist
}

script emit_APM_DT_LE_smokingtrash_particle 
    setemitrange width = 1.0 height = 1.0 depth = 1.0
    setlife min = 0.5000 max = 1.0
    setanglespread spread = 0.1800
    setspeedrange min = 0.1000 max = 0.1000
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.02000 z = 0.0
    setparticlesize sw = 5.0 ew = 10.0 sh = 5.0 eh = 10.0
    setcolor corner = 0 sr = 215 sg = 104 sb = 63 sa = 255 mr = 117 mg = 99 mb = 92 ma = 185 er = 42 eg = 0 eb = 0 ea = 0 midTime = 0.4100
    setcolor corner = 1 sr = 215 sg = 104 sb = 63 sa = 255 mr = 117 mg = 99 mb = 92 ma = 185 er = 42 eg = 0 eb = 0 ea = 0 midTime = 0.4100
    setcolor corner = 2 sr = 215 sg = 104 sb = 63 sa = 255 mr = 117 mg = 99 mb = 92 ma = 185 er = 42 eg = 0 eb = 0 ea = 0 midTime = 0.4100
    setcolor corner = 3 sr = 215 sg = 104 sb = 63 sa = 255 mr = 117 mg = 99 mb = 92 ma = 185 er = 42 eg = 0 eb = 0 ea = 0 midTime = 0.4100
    emitrate rate = 80.0
endscript
APM_DT_lilsparks01_particle_params = {
    emitscript = emit_APM_DT_lilsparks01_particle
    max = 5
    type = RibbonTrail
    texture = apm_trail01
    BlendMode = Add
    History = 5
    priority = 0
    suspenddistance = Default_Particle_Suspend_Dist
}

script emit_APM_DT_lilsparks01_particle 
    setemitrange width = 0.0 height = 0.0 depth = 0.0
    setlife min = 0.1000 max = 1.0
    setanglespread spread = 0.4600
    setspeedrange min = 0.1000 max = 5.0
    setemittarget x = 1.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = -0.2000 z = 0.0
    setparticlesize sw = 1.0 ew = 1.0 sh = 1.0 eh = 1.0
    setcolor corner = 0 sr = 197 sg = 226 sb = 231 sa = 0 mr = 83 mg = 229 mb = 255 ma = 255 er = 0 eg = 183 eb = 255 ea = 0 midTime = 0.5600
    setcolor corner = 1 sr = 197 sg = 226 sb = 231 sa = 0 mr = 83 mg = 229 mb = 255 ma = 255 er = 0 eg = 183 eb = 255 ea = 255 midTime = 0.5600
    setcolor corner = 2 sr = 197 sg = 226 sb = 231 sa = 0 mr = 83 mg = 229 mb = 255 ma = 255 er = 0 eg = 183 eb = 255 ea = 255 midTime = 0.5600
    setcolor corner = 3 sr = 197 sg = 226 sb = 231 sa = 0 mr = 83 mg = 229 mb = 255 ma = 255 er = 0 eg = 183 eb = 255 ea = 255 midTime = 0.5600
    setcolor corner = 4 sr = 197 sg = 226 sb = 231 sa = 0 mr = 83 mg = 229 mb = 255 ma = 255 er = 0 eg = 183 eb = 255 ea = 255 midTime = 0.5600
    setcolor corner = 5 sr = 197 sg = 226 sb = 231 sa = 0 mr = 83 mg = 229 mb = 255 ma = 255 er = 0 eg = 183 eb = 255 ea = 0 midTime = 0.5600
    emitrate rate = 256.0
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
    suspenddistance = Default_Particle_Suspend_Dist
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
APM_FW_BIGdebris01_particle_params = {
    enablerotate
    emitscript = emit_APM_FW_BIGdebris01_particle
    max = 128
    type = Shaded
    texture = apm_debis_quad01
    BlendMode = Blend
    userandomuvquadrants
    rotvel = (0.0, 2.0)
    rotveltimescale = 0.2000
    useglobalcolormodulation
    priority = 0
    suspenddistance = Default_Particle_Suspend_Dist
}

script emit_APM_FW_BIGdebris01_particle 
    setemitrange width = 128.0 height = 0.0 depth = 5.0
    setlife min = 0.1000 max = 0.5000
    setanglespread spread = 0.4600
    setspeedrange min = 3.0 max = 8.0
    setemitangle x = 220.0 y = 270.0 z = 0.0
    setforce x = 0.0 y = -0.2000 z = 0.0
    setparticlesize sw = 6.0 ew = 6.0 sh = 6.0 eh = 6.0
    setcolor corner = 0 sr = 147 sg = 144 sb = 141 sa = 0 mr = 86 mg = 83 mb = 81 ma = 255 er = 106 eg = 102 eb = 100 ea = 0 midTime = 0.5600
    setcolor corner = 1 sr = 147 sg = 144 sb = 141 sa = 0 mr = 86 mg = 83 mb = 81 ma = 255 er = 106 eg = 102 eb = 100 ea = 0 midTime = 0.5600
    setcolor corner = 2 sr = 147 sg = 144 sb = 141 sa = 0 mr = 86 mg = 83 mb = 81 ma = 255 er = 106 eg = 102 eb = 100 ea = 0 midTime = 0.5600
    setcolor corner = 3 sr = 147 sg = 144 sb = 141 sa = 0 mr = 86 mg = 83 mb = 81 ma = 255 er = 106 eg = 102 eb = 100 ea = 0 midTime = 0.5600
    emitrate rate = 256.0
endscript
APM_FW_BIGsmoke01_particle_params = {
    boneoffset = (0.0, 55.0, 0.0)
    enablerotate
    emitscript = emit_APM_FW_BIGsmoke01_particle
    emitterindependent = 1
    fillpath
    max = 256
    type = Shaded
    texture = apm_smokepuff_rot_01
    BlendMode = Blend
    rotvel = (0.0, 0.4000000059604645)
    rotveltimescale = 0.2000
    useglobalcolormodulation
    priority = 0
    suspenddistance = Default_Particle_Suspend_Dist
}

script emit_APM_FW_BIGsmoke01_particle 
    setemitrange width = 10.0 height = 22.0 depth = 111.0
    setlife min = 1.0 max = 1.0
    setanglespread elevation = (0.0, 0.5) sweep = (-1.0, 1.0)
    setspeedrange min = 1.100 max = 1.100
    setforce x = 0.0 y = 0.02000 z = 0.0
    setparticlesize sw = 22.0 ew = 55.0 sh = 22.0 eh = 55.0
    setcolor corner = 0 sr = 172 sg = 172 sb = 172 sa = 0 mr = 244 mg = 221 mb = 211 ma = 255 er = 231 eg = 215 eb = 197 ea = 0 midTime = 0.8100
    setcolor corner = 1 sr = 172 sg = 172 sb = 172 sa = 0 mr = 244 mg = 221 mb = 211 ma = 255 er = 231 eg = 215 eb = 197 ea = 0 midTime = 0.8100
    setcolor corner = 2 sr = 172 sg = 172 sb = 172 sa = 0 mr = 244 mg = 221 mb = 211 ma = 255 er = 231 eg = 215 eb = 197 ea = 0 midTime = 0.8100
    setcolor corner = 3 sr = 172 sg = 172 sb = 172 sa = 0 mr = 244 mg = 221 mb = 211 ma = 255 er = 231 eg = 215 eb = 197 ea = 0 midTime = 0.8100
    emitrate rate = 256.0
endscript
APM_FW_BIGsparks01_particle_params = {
    enablerotate
    emitscript = emit_APM_FW_BIGsparks01_particle
    updatescript = align_to_vel_update
    params = {
        bone = None
        update_pos = 0
        emit_offset = (0.0, 0.5, 0.0)
        emit_scale = -1.0
        pos_offset = (0.0, -2.0, 0.0)
    }
    max = 64
    type = RibbonTrail
    texture = apm_marker01
    BlendMode = Add
    History = 5
    useglobalcolormodulation
    priority = 0
    suspenddistance = Default_Particle_Suspend_Dist
}

script emit_APM_FW_BIGsparks01_particle 
    setemitrange width = 128.0 height = 0.0 depth = 5.0
    setlife min = 0.1000 max = 0.5000
    setanglespread spread = 0.4600
    setspeedrange min = 3.0 max = 8.0
    setemitangle x = 220.0 y = 270.0 z = 0.0
    setforce x = 0.0 y = -0.2000 z = 0.0
    setparticlesize sw = 3.0 ew = 2.0 sh = 24.80 eh = 0.0
    setcolor corner = 0 sr = 231 sg = 215 sb = 197 sa = 0 mr = 255 mg = 142 mb = 83 ma = 255 er = 255 eg = 66 eb = 0 ea = 0 midTime = 0.5600
    setcolor corner = 1 sr = 231 sg = 215 sb = 197 sa = 0 mr = 255 mg = 142 mb = 83 ma = 255 er = 255 eg = 66 eb = 0 ea = 255 midTime = 0.1600
    setcolor corner = 2 sr = 231 sg = 215 sb = 197 sa = 0 mr = 255 mg = 142 mb = 83 ma = 255 er = 255 eg = 66 eb = 0 ea = 255 midTime = 0.1600
    setcolor corner = 3 sr = 231 sg = 215 sb = 197 sa = 0 mr = 255 mg = 142 mb = 83 ma = 255 er = 255 eg = 66 eb = 0 ea = 255 midTime = 0.1600
    setcolor corner = 4 sr = 231 sg = 215 sb = 197 sa = 0 mr = 255 mg = 142 mb = 83 ma = 255 er = 255 eg = 66 eb = 0 ea = 255 midTime = 0.1600
    setcolor corner = 5 sr = 231 sg = 215 sb = 197 sa = 0 mr = 255 mg = 142 mb = 83 ma = 255 er = 255 eg = 66 eb = 0 ea = 255 midTime = 0.1600
    emitrate rate = 128.0
endscript
APM_FW_BIGsparks02_particle_params = {
    emitscript = emit_APM_FW_BIGsparks02_particle
    updatescript = align_scale_to_vel_update
    params = {
        bone = None
        update_pos = 0
        emit_offset = (0.0, 0.5, 0.0)
        emit_scale = -1.0
        pos_offset = (0.0, -2.0, 0.0)
        base_vel = 800
        min_vel_range = 4
        max_vel_range = 8
        base_emit_rate = 128
    }
    max = 64
    type = RibbonTrail
    texture = apm_marker01
    BlendMode = Add
    History = 5
    useglobalcolormodulation
    priority = 0
    suspenddistance = Default_Particle_Suspend_Dist
}

script emit_APM_FW_BIGsparks02_particle 
    setemitrange width = 128.0 height = 0.0 depth = 5.0
    setlife min = 0.1000 max = 0.5000
    setanglespread spread = 0.4600
    setspeedrange min = 3.0 max = 8.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setemitangle x = 220.0 y = 270.0 z = 0.0
    setforce x = 0.0 y = -0.2000 z = 0.0
    setparticlesize sw = 3.0 ew = 2.0 sh = 24.80 eh = 0.0
    setcolor corner = 0 sr = 231 sg = 215 sb = 197 sa = 0 mr = 255 mg = 142 mb = 83 ma = 255 er = 255 eg = 66 eb = 0 ea = 0 midTime = 0.5600
    setcolor corner = 1 sr = 231 sg = 215 sb = 197 sa = 0 mr = 255 mg = 142 mb = 83 ma = 255 er = 255 eg = 66 eb = 0 ea = 255 midTime = 0.1600
    setcolor corner = 2 sr = 231 sg = 215 sb = 197 sa = 0 mr = 255 mg = 142 mb = 83 ma = 255 er = 255 eg = 66 eb = 0 ea = 255 midTime = 0.1600
    setcolor corner = 3 sr = 231 sg = 215 sb = 197 sa = 0 mr = 255 mg = 142 mb = 83 ma = 255 er = 255 eg = 66 eb = 0 ea = 255 midTime = 0.1600
    setcolor corner = 4 sr = 231 sg = 215 sb = 197 sa = 0 mr = 255 mg = 142 mb = 83 ma = 255 er = 255 eg = 66 eb = 0 ea = 255 midTime = 0.1600
    setcolor corner = 5 sr = 231 sg = 215 sb = 197 sa = 0 mr = 255 mg = 142 mb = 83 ma = 255 er = 255 eg = 66 eb = 0 ea = 255 midTime = 0.1600
    emitrate rate = 128.0
endscript
APM_FW_LE_smokeTRail01_particle_params = {
    emitscript = emit_APM_FW_LE_smokeTRail01_particle
    emitterindependent = 1
    fillpath
    max = 80
    type = Shaded
    texture = apm_smokepuff_rot_01
    BlendMode = Blend
    rotvel = (0.0, 0.5)
    rotveltimescale = 0.5000
    priority = 0
    suspenddistance = Default_Particle_Suspend_Dist
}

script emit_APM_FW_LE_smokeTRail01_particle 
    setemitrange width = 22.0 height = 1.0 depth = 22.0
    setlife min = 0.5000 max = 1.0
    setanglespread spread = 0.1800
    setspeedrange min = 0.1000 max = 0.1000
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.02000 z = 0.0
    setparticlesize sw = 15.0 ew = 15.0 sh = 15.0 eh = 15.0
    setcolor corner = 0 sr = 201 sg = 213 sb = 215 sa = 0 mr = 211 mg = 207 mb = 206 ma = 150 er = 229 eg = 229 eb = 229 ea = 0 midTime = 0.2100
    setcolor corner = 1 sr = 201 sg = 213 sb = 215 sa = 0 mr = 211 mg = 207 mb = 206 ma = 150 er = 229 eg = 229 eb = 229 ea = 0 midTime = 0.2100
    setcolor corner = 2 sr = 201 sg = 213 sb = 215 sa = 0 mr = 211 mg = 207 mb = 206 ma = 150 er = 229 eg = 229 eb = 229 ea = 0 midTime = 0.2100
    setcolor corner = 3 sr = 201 sg = 213 sb = 215 sa = 0 mr = 211 mg = 207 mb = 206 ma = 150 er = 229 eg = 229 eb = 229 ea = 0 midTime = 0.2100
    emitrate rate = 80.0
endscript
APM_FW_LE_smokeTRail02_particle_params = {
    emitscript = emit_APM_FW_LE_smokeTRail02_particle
    emitterindependent = 1
    fillpath
    max = 66
    type = Shaded
    texture = apm_smokepuff_rot_01b
    BlendMode = Blend
    rotvel = (0.0, 0.5)
    rotveltimescale = 0.5000
    priority = 0
    suspenddistance = Default_Particle_Suspend_Dist
}

script emit_APM_FW_LE_smokeTRail02_particle 
    setemitrange width = 5.0 height = 1.0 depth = 5.0
    setlife min = 1.0 max = 2.0
    setanglespread spread = 0.3300
    setspeedrange min = 0.1000 max = 0.1000
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.02000 z = 0.0
    setparticlesize sw = 10.0 ew = 15.0 sh = 10.0 eh = 15.0
    setcolor corner = 0 sr = 146 sg = 154 sb = 156 sa = 0 mr = 139 mg = 137 mb = 136 ma = 68 er = 134 eg = 134 eb = 134 ea = 0 midTime = 0.2100
    setcolor corner = 1 sr = 146 sg = 154 sb = 156 sa = 0 mr = 139 mg = 137 mb = 136 ma = 68 er = 134 eg = 134 eb = 134 ea = 0 midTime = 0.2100
    setcolor corner = 2 sr = 146 sg = 154 sb = 156 sa = 0 mr = 139 mg = 137 mb = 136 ma = 68 er = 134 eg = 134 eb = 134 ea = 0 midTime = 0.2100
    setcolor corner = 3 sr = 146 sg = 154 sb = 156 sa = 0 mr = 139 mg = 137 mb = 136 ma = 68 er = 134 eg = 134 eb = 134 ea = 0 midTime = 0.2100
    emitrate rate = 66.0
endscript
APM_Gravel01_particle_params = {
    id = skater
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
    ObjID = skater
    update_brightness
    priority = 0
    suspenddistance = Default_Particle_Suspend_Dist
}

script emit_APM_Gravel01_particle 
    setemitrange width = 1.0 height = 1.0 depth = 0.0
    setlife min = 0.2000 max = 0.3000
    setanglespread spread = 0.3700
    setspeedrange min = 1.0 max = 1.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = -0.6000 z = 0.0
    setparticlesize sw = 15.0 ew = 15.0 sh = 15.0 eh = 15.0
    setcolor corner = 0 sr = 77 sg = 73 sb = 70 sa = 255 mr = 138 mg = 136 mb = 130 ma = 255 er = 95 eg = 93 eb = 88 ea = 108 midTime = 0.6300
    emitrate rate = 15.0
endscript
APM_HO_LE_BIGsmoke01_particle_params = {
    enablerotate
    emitscript = emit_APM_HO_LE_BIGsmoke01_particle
    emitterindependent = 1
    fillpath
    max = 76
    type = Shaded
    texture = apm_smokepuff_rot_01
    BlendMode = Blend
    rotvel = (0.0, 0.4000000059604645)
    rotveltimescale = 0.2000
    useglobalcolormodulation
    priority = 0
    suspenddistance = Default_Particle_Suspend_Dist
}

script emit_APM_HO_LE_BIGsmoke01_particle 
    setemitrange width = 10.0 height = 22.0 depth = 10.0
    setlife min = 1.0 max = 1.0
    setanglespread elevation = (-1.0, 0.5) sweep = (-1.0, 1.0)
    setspeedrange min = 1.100 max = 2.0
    setforce x = 0.0 y = 0.02000 z = 0.0
    setparticlesize sw = 22.0 ew = 55.0 sh = 22.0 eh = 55.0
    setcolor corner = 0 sr = 172 sg = 172 sb = 172 sa = 0 mr = 244 mg = 221 mb = 211 ma = 255 er = 231 eg = 215 eb = 197 ea = 0 midTime = 0.2100
    setcolor corner = 1 sr = 172 sg = 172 sb = 172 sa = 0 mr = 244 mg = 221 mb = 211 ma = 255 er = 231 eg = 215 eb = 197 ea = 0 midTime = 0.2100
    setcolor corner = 2 sr = 172 sg = 172 sb = 172 sa = 0 mr = 244 mg = 221 mb = 211 ma = 255 er = 231 eg = 215 eb = 197 ea = 0 midTime = 0.2100
    setcolor corner = 3 sr = 172 sg = 172 sb = 172 sa = 0 mr = 244 mg = 221 mb = 211 ma = 255 er = 231 eg = 215 eb = 197 ea = 0 midTime = 0.2100
    emitrate rate = 75.50
    wait 5.0 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript
APM_HO_LE_BIGsmoke02_particle_params = {
    emitscript = emit_APM_HO_LE_BIGsmoke02_particle
    emitterindependent = 1
    fillpath
    max = 132
    type = Shaded
    texture = apm_smokepuff_rot_01
    BlendMode = Blend
    rotvel = (0.0, 0.10000000149011612)
    rotveltimescale = 0.2000
    useglobalcolormodulation
    priority = 0
    suspenddistance = Default_Particle_Suspend_Dist
}

script emit_APM_HO_LE_BIGsmoke02_particle 
    setemitrange width = 300.0 height = 11.0 depth = 100.0
    setlife min = 2.0 max = 2.0
    setanglespread elevation = (-1.0, -0.5) sweep = (-1.0, 1.0)
    setspeedrange min = 0.1000 max = 0.2000
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.01000 z = 0.0
    setparticlesize sw = 37.10 ew = 100.0 sh = 44.50 eh = 100.0
    setcolor corner = 0 sr = 117 sg = 117 sb = 117 sa = 84 mr = 161 mg = 151 mb = 147 ma = 255 er = 178 eg = 166 eb = 152 ea = 0 midTime = 0.6100
    setcolor corner = 1 sr = 117 sg = 117 sb = 117 sa = 84 mr = 161 mg = 151 mb = 147 ma = 255 er = 178 eg = 166 eb = 152 ea = 0 midTime = 0.6100
    setcolor corner = 2 sr = 117 sg = 117 sb = 117 sa = 84 mr = 161 mg = 151 mb = 147 ma = 255 er = 178 eg = 166 eb = 152 ea = 0 midTime = 0.6100
    setcolor corner = 3 sr = 117 sg = 117 sb = 117 sa = 84 mr = 161 mg = 151 mb = 147 ma = 255 er = 178 eg = 166 eb = 152 ea = 0 midTime = 0.6100
    emitrate rate = 66.0
    wait 12.0 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript
APM_HO_Signsmoke01_particle_params = {
    enablerotate
    emitscript = emit_APM_HO_Signsmoke01_particle
    emitterindependent = 1
    fillpath
    max = 76
    type = Shaded
    texture = apm_smokepuff_rot_01
    BlendMode = Blend
    rotvel = (0.0, 0.4000000059604645)
    rotveltimescale = 0.2000
    useglobalcolormodulation
    priority = 0
    suspenddistance = Default_Particle_Suspend_Dist
}

script emit_APM_HO_Signsmoke01_particle 
    setemitrange width = 10.0 height = 22.0 depth = 55.0
    setlife min = 1.0 max = 1.0
    setanglespread elevation = (0.0, 0.5) sweep = (-1.0, 1.0)
    setspeedrange min = 0.1000 max = 0.1000
    setforce x = 0.0 y = 0.01000 z = 0.0
    setparticlesize sw = 22.0 ew = 55.0 sh = 22.0 eh = 55.0
    setcolor corner = 0 sr = 172 sg = 172 sb = 172 sa = 0 mr = 244 mg = 221 mb = 211 ma = 136 er = 255 eg = 237 eb = 217 ea = 0 midTime = 0.2100
    setcolor corner = 1 sr = 172 sg = 172 sb = 172 sa = 0 mr = 244 mg = 221 mb = 211 ma = 136 er = 255 eg = 237 eb = 217 ea = 0 midTime = 0.2100
    setcolor corner = 2 sr = 172 sg = 172 sb = 172 sa = 0 mr = 244 mg = 221 mb = 211 ma = 136 er = 255 eg = 237 eb = 217 ea = 0 midTime = 0.2100
    setcolor corner = 3 sr = 172 sg = 172 sb = 172 sa = 0 mr = 244 mg = 221 mb = 211 ma = 136 er = 255 eg = 237 eb = 217 ea = 0 midTime = 0.2100
    emitrate rate = 75.50
    wait 2.0 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript
APM_HO_sparks01_particle_params = {
    bone = Bone_Fingers_Tip_R
    emitscript = emit_APM_HO_sparks01_particle
    emitterindependent = 1
    radiate
    max = 256
    type = Shaded
    texture = apm_spark_01
    BlendMode = Add
    rotvel = (0.0, 5.0)
    rotveltimescale = 0.2000
    priority = 0
    suspenddistance = Default_Particle_Suspend_Dist
}

script emit_APM_HO_sparks01_particle 
    setemitrange width = 1.0 height = 1.0 depth = 0.0
    setlife min = 1.0 max = 1.0
    setanglespread elevation = (0.0, 0.5) sweep = (-1.0, 1.0)
    setspeedrange min = 2.600 max = 5.0
    setemittarget x = -1.0 y = 0.0 z = 0.0
    setforce x = 0.0 y = -0.1000 z = 0.0
    setparticlesize sw = 12.0 ew = 7.850 sh = 10.40 eh = 7.060
    setcolor corner = 0 sr = 244 sg = 244 sb = 244 sa = 255 mr = 158 mg = 224 mb = 244 ma = 255 er = 4 eg = 120 eb = 255 ea = 0 midTime = 0.4100
    setcolor corner = 1 sr = 244 sg = 244 sb = 244 sa = 255 mr = 158 mg = 224 mb = 244 ma = 255 er = 4 eg = 120 eb = 255 ea = 0 midTime = 0.4100
    setcolor corner = 2 sr = 244 sg = 244 sb = 244 sa = 255 mr = 158 mg = 224 mb = 244 ma = 255 er = 4 eg = 120 eb = 255 ea = 0 midTime = 0.4100
    setcolor corner = 3 sr = 244 sg = 244 sb = 244 sa = 255 mr = 158 mg = 224 mb = 244 ma = 255 er = 4 eg = 120 eb = 255 ea = 0 midTime = 0.4100
    emitrate rate = 256.0
    wait 0.5000 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript
APM_HO_sparks02_particle_params = {
    emitscript = emit_APM_HO_sparks02_particle
    emitterindependent = 1
    fillpath
    max = 32
    type = Shaded
    texture = apm_spark_01
    BlendMode = Add
    rotvel = (0.0, 5.0)
    rotveltimescale = 0.2000
    priority = 0
    suspenddistance = Default_Particle_Suspend_Dist
}

script emit_APM_HO_sparks02_particle 
    setemitrange width = 1.0 height = 1.0 depth = 0.0
    setlife min = 1.0 max = 1.0
    setanglespread elevation = (0.0, 0.5) sweep = (-1.0, 1.0)
    setspeedrange min = 2.600 max = 5.0
    setemittarget x = -1.0 y = 0.0 z = 0.0
    setforce x = 0.0 y = -0.1000 z = 0.0
    setparticlesize sw = 12.0 ew = 7.850 sh = 10.40 eh = 7.060
    setcolor corner = 0 sr = 244 sg = 190 sb = 190 sa = 255 mr = 244 mg = 95 mb = 0 ma = 255 er = 255 eg = 4 eb = 4 ea = 0 midTime = 0.4100
    setcolor corner = 1 sr = 244 sg = 190 sb = 190 sa = 255 mr = 244 mg = 95 mb = 0 ma = 255 er = 255 eg = 4 eb = 4 ea = 0 midTime = 0.4100
    setcolor corner = 2 sr = 244 sg = 190 sb = 190 sa = 255 mr = 244 mg = 95 mb = 0 ma = 255 er = 255 eg = 4 eb = 4 ea = 0 midTime = 0.4100
    setcolor corner = 3 sr = 244 sg = 190 sb = 190 sa = 255 mr = 244 mg = 95 mb = 0 ma = 255 er = 255 eg = 4 eb = 4 ea = 0 midTime = 0.4100
    emitrate rate = 32.0
    wait 0.5000 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript
APM_HO_LE_groundsparks_particle_params = {
    boneoffset = (0.0, 12.0, 0.0)
    emitscript = emit_APM_Ho_LE_groundsparks_particle
    emitterindependent = 1
    max = 64
    type = flat
    texture = apm_spark_01
    BlendMode = Add
    priority = 0
    suspenddistance = Default_Particle_Suspend_Dist
}

script emit_APM_Ho_LE_groundsparks_particle 
    setemitrange width = 77.0 height = 33.0 depth = 1.0
    setlife min = 0.1000 max = 0.5000
    setanglespread elevation = (0.0, 0.5) sweep = (-1.0, 1.0)
    setspeedrange min = 1.0 max = 1.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = -0.05000 z = 0.0
    setparticlesize sw = 33.0 ew = 1.0 sh = 5.0 eh = 1.0
    setcolor corner = 0 sr = 244 sg = 168 sb = 100 sa = 0 mr = 244 mg = 63 mb = 0 ma = 255 er = 255 eg = 26 eb = 26 ea = 0 midTime = 0.2100
    emitrate rate = 128.0
    wait 3.0 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript
APM_SM_Roofsmoke01_particle_params = {
    boneoffset = (0.0, 22.0, -77.0)
    enablerotate
    angles = (0.0, 2.5999999046325684, 3.0)
    emitscript = emit_APM_SM_Roofsmoke01_particle
    emitterindependent = 1
    max = 256
    type = Shaded
    texture = apm_spray_01
    BlendMode = Blend
    rotvel = (0.0, 1.0)
    rotveltimescale = 0.2000
    useglobalcolormodulation
    priority = 0
    novisibilitytest
    suspenddistance = 1111.0
}

script emit_APM_SM_Roofsmoke01_particle 
    setemitrange width = 222.0 height = 0.0 depth = 111.0
    setlife min = 0.5000 max = 1.0
    setanglespread elevation = (-0.5, 0.5) sweep = (-1.0, 1.0)
    setspeedrange min = 0.1000 max = 0.1000
    setforce x = 0.0 y = 0.02000 z = 0.0
    setparticlesize sw = 43.60 ew = 30.0 sh = 38.80 eh = 30.37
    setcolor corner = 0 sr = 84 sg = 84 sb = 84 sa = 0 mr = 99 mg = 96 mb = 93 ma = 255 er = 110 eg = 110 eb = 110 ea = 0 midTime = 0.4100
    setcolor corner = 1 sr = 84 sg = 84 sb = 84 sa = 0 mr = 99 mg = 96 mb = 93 ma = 255 er = 110 eg = 110 eb = 110 ea = 0 midTime = 0.4100
    setcolor corner = 2 sr = 84 sg = 84 sb = 84 sa = 0 mr = 99 mg = 96 mb = 93 ma = 255 er = 110 eg = 110 eb = 110 ea = 0 midTime = 0.4100
    setcolor corner = 3 sr = 84 sg = 84 sb = 84 sa = 0 mr = 99 mg = 96 mb = 93 ma = 255 er = 110 eg = 110 eb = 110 ea = 0 midTime = 0.4100
    setlodparams min_particles = 256 lod_dist1 = 1111.0 lod_dist2 = 1112.0
    emitrate rate = 256.0
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
    type = flatribbontrail
    texture = apm_spark_01
    BlendMode = Add
    History = 3
    priority = 0
    suspenddistance = Default_Particle_Suspend_Dist
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
APM_coasterSmoke01_particle_params = {
    emitscript = emit_APM_coasterSmoke01_particle
    emitterindependent = 1
    fillpath
    max = 128
    type = Shaded
    texture = apm_smokepuff_rot_01
    BlendMode = Blend
    rotvel = (0.0, 1.0)
    rotveltimescale = 0.5000
    priority = 0
}

script emit_APM_coasterSmoke01_particle 
    setemitrange width = 1.0 height = 1.0 depth = 0.0
    setlife min = 0.5000 max = 1.0
    setanglespread spread = 0.5100
    setspeedrange min = 1.0 max = 2.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setemitangle x = 0.0 y = 300.0 z = 0.0
    setforce x = 0.0 y = -0.01000 z = 0.0
    setparticlesize sw = 22.0 ew = 33.0 sh = 22.0 eh = 33.0
    setcolor corner = 0 sr = 193 sg = 193 sb = 193 sa = 0 mr = 200 mg = 200 mb = 200 ma = 51 er = 143 eg = 143 eb = 143 ea = 0 midTime = 0.4100
    setcolor corner = 1 sr = 193 sg = 193 sb = 193 sa = 0 mr = 200 mg = 200 mb = 200 ma = 51 er = 143 eg = 143 eb = 143 ea = 0 midTime = 0.4100
    setcolor corner = 2 sr = 193 sg = 193 sb = 193 sa = 0 mr = 200 mg = 200 mb = 200 ma = 51 er = 143 eg = 143 eb = 143 ea = 0 midTime = 0.4100
    setcolor corner = 3 sr = 193 sg = 193 sb = 193 sa = 0 mr = 200 mg = 200 mb = 200 ma = 51 er = 143 eg = 143 eb = 143 ea = 0 midTime = 0.4100
    emitrate rate = 128.0
endscript
APM_contrail02_particle_params = {
    boneoffset = (0.0, 40.0, 0.0)
    emitscript = emit_APM_contrail02_particle
    emitterindependent = 1
    max = 22
    type = RibbonChain
    texture = apm_smoketrail01
    BlendMode = Blend
    History = 1
    useglobalcolormodulation
    priority = 0
    novisibilitytest
}

script emit_APM_contrail02_particle 
    setemitrange width = 5.0 height = 5.0 depth = 0.0
    setlife min = 2.0 max = 2.0
    setanglespread spread = 0.3100
    setspeedrange min = 0.1000 max = 0.1000
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.0 z = 0.0
    setparticlesize sw = 44.0 ew = 5.0 sh = 44.0 eh = 5.0
    setcolor corner = 0 sr = 158 sg = 161 sb = 161 sa = 0 mr = 158 mg = 161 mb = 161 ma = 255 er = 82 eg = 84 eb = 84 ea = 0 midTime = 0.6100
    setcolor corner = 1 sr = 158 sg = 161 sb = 161 sa = 0 mr = 158 mg = 161 mb = 161 ma = 255 er = 82 eg = 84 eb = 84 ea = 0 midTime = 0.6100
    setlodparams min_particles = 22 lod_dist1 = 111111.0 lod_dist2 = 111112.0
    emitrate rate = 11.0
    wait 3.0 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript
APM_dirttrail02_particle_params = {
    boneoffset = (0.0, 44.0, 0.0)
    enablerotate
    emitscript = emit_APM_dirttrail02_particle
    emitterindependent = 1
    max = 32
    type = flat
    texture = apm_fallingwater_01
    BlendMode = Blend
    useglobalcolormodulation
    priority = 0
    suspenddistance = Default_Particle_Suspend_Dist
}

script emit_APM_dirttrail02_particle 
    setemitrange width = 5.0 height = 5.0 depth = 0.0
    setlife min = 0.5000 max = 0.5000
    setanglespread spread = 0.3100
    setspeedrange min = 0.1000 max = 1.0
    setemitangle x = 270.0 y = 0.0 z = 0.0
    setforce x = 0.0 y = -0.05000 z = 0.0
    setparticlesize sw = 22.0 ew = 5.0 sh = 22.0 eh = 5.0
    setcolor corner = 0 sr = 20 sg = 18 sb = 15 sa = 0 mr = 66 mg = 52 mb = 35 ma = 255 er = 110 eg = 87 eb = 54 ea = 0 midTime = 0.6100
    emitrate rate = 64.0
    wait 0.04000 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript
APM_dirttrail03_particle_params = {
    boneoffset = (0.0, 118.0, 0.0)
    enablerotate
    emitscript = emit_APM_dirttrail03_particle
    emitterindependent = 1
    max = 32
    type = flat
    texture = apm_fallingwater_01
    BlendMode = Blend
    useglobalcolormodulation
    priority = 0
    suspenddistance = Default_Particle_Suspend_Dist
}

script emit_APM_dirttrail03_particle 
    setemitrange width = 5.0 height = 5.0 depth = 0.0
    setlife min = 0.5000 max = 0.5000
    setanglespread spread = 0.3100
    setspeedrange min = 0.1000 max = 1.0
    setemitangle x = 270.0 y = 0.0 z = 0.0
    setforce x = 0.0 y = -0.05000 z = 0.0
    setparticlesize sw = 22.0 ew = 5.0 sh = 22.0 eh = 5.0
    setcolor corner = 0 sr = 20 sg = 18 sb = 15 sa = 0 mr = 66 mg = 52 mb = 35 ma = 255 er = 110 eg = 87 eb = 54 ea = 0 midTime = 0.6100
    emitrate rate = 64.0
    wait 0.04000 seconds
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
    suspenddistance = Default_Particle_Suspend_Dist
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
    suspenddistance = Default_Particle_Suspend_Dist
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
APM_jettrail01_particle_params = {
    boneoffset = (0.0, 10.300000190734863, 0.0)
    emitscript = emit_APM_jettrail01_particle
    emitterindependent = 1
    fillpath
    max = 60
    type = RibbonChain
    texture = apm_smoketrail01
    BlendMode = Blend
    History = 1
    useglobalcolormodulation
    priority = 0
    novisibilitytest
    suspenddistance = Default_Particle_Suspend_Dist
}

script emit_APM_jettrail01_particle 
    setemitrange width = 0.0 height = 0.0 depth = 0.0
    setlife min = 30.0 max = 30.0
    setanglespread spread = 0.0
    setspeedrange min = 0.0 max = 0.0
    setemittarget x = 1.0 y = 0.0 z = 0.0
    setforce x = 0.0 y = 0.0 z = 0.0
    setparticlesize sw = 222.0 ew = 222.0 sh = 5.0 eh = 5.0
    setcolor corner = 0 sr = 183 sg = 183 sb = 183 sa = 0 mr = 155 mg = 165 mb = 165 ma = 255 er = 134 eg = 134 eb = 134 ea = 0 midTime = 0.03000
    setcolor corner = 1 sr = 183 sg = 183 sb = 183 sa = 0 mr = 155 mg = 165 mb = 165 ma = 255 er = 134 eg = 134 eb = 134 ea = 0 midTime = 0.03000
    emitrate rate = 2.0
endscript
APM_llightning02_particle_params = {
    emitscript = emit_APM_llightning02_particle
    emitterindependent = 1
    radiate
    max = 2
    type = RibbonChain
    texture = apm_trail01side
    BlendMode = Add
    History = 1
    priority = 0
    suspenddistance = Default_Particle_Suspend_Dist
}

script emit_APM_llightning02_particle 
    setemitrange width = 11.0 height = 11.0 depth = 11.0
    setlife min = 0.1000 max = 0.1000
    setanglespread elevation = (-0.5, 0.5) sweep = (-1.0, 1.0)
    setspeedrange min = 11.0 max = 11.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.0 z = 0.0
    setparticlesize sw = 12.0 ew = 0.0 sh = 22.0 eh = 22.0
    setcolor corner = 0 sr = 197 sg = 226 sb = 231 sa = 0 mr = 193 mg = 246 mb = 255 ma = 255 er = 0 eg = 183 eb = 255 ea = 0 midTime = 0.5600
    setcolor corner = 1 sr = 197 sg = 226 sb = 231 sa = 0 mr = 83 mg = 229 mb = 255 ma = 255 er = 0 eg = 183 eb = 255 ea = 255 midTime = 0.5600
    emitrate rate = 128.0
endscript
APM_llightningX01_particle_params = {
    boneoffset = (0.0, 74.9000015258789, 0.0)
    emitscript = emit_APM_llightningX01_particle
    emitterindependent = 1
    radiate
    max = 128
    type = RibbonTrail
    texture = apm_lightning02
    BlendMode = Add
    History = 1
    priority = 0
    suspenddistance = Default_Particle_Suspend_Dist
}

script emit_APM_llightningX01_particle 
    setemitrange width = 1.0 height = 1.0 depth = 1.0
    setlife min = 0.1000 max = 0.2000
    setanglespread elevation = (-1.0, 0.5) sweep = (-1.0, 1.0)
    setspeedrange min = 1.0 max = 5.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.0 z = 0.0
    setparticlesize sw = 33.0 ew = 0.0 sh = 22.0 eh = 0.0
    setcolor corner = 0 sr = 242 sg = 253 sb = 255 sa = 0 mr = 193 mg = 246 mb = 255 ma = 255 er = 0 eg = 183 eb = 255 ea = 255 midTime = 0.5600
    setcolor corner = 1 sr = 197 sg = 226 sb = 231 sa = 0 mr = 83 mg = 229 mb = 255 ma = 255 er = 0 eg = 183 eb = 255 ea = 255 midTime = 0.5600
    emit num = 128
    destroy ifempty = 1
endscript
APM_marker01_particle_params = {
    boneoffset = (0.0, -20.0, 32.0)
    emitscript = emit_APM_marker01_particle
    emitterindependent = 1
    fillpath
    max = 250
    type = RibbonChain
    texture = apm_marker01
    novisibilitytest
    BlendMode = Blend
    priority = 0
    suspenddistance = Default_Particle_Suspend_Dist
}

script emit_APM_marker01_particle 
    setemitrange width = 0.0 height = 0.0 depth = 0.0
    setlife min = 3.900 max = 3.900
    setanglespread spread = 0.0
    setspeedrange min = 0.0 max = 0.0
    setemittarget x = 1.0 y = 0.0 z = 0.0
    setforce x = 0.0 y = 0.0 z = 0.0
    setparticlesize sw = 10.0 ew = 10.0 sh = 5.0 eh = 5.0
    setcolor corner = 0 sr = 255 sg = 128 sb = 0 sa = 255 mr = 255 mg = 128 mb = 0 ma = 255 er = 255 eg = 128 eb = 0 ea = 0 midTime = 0.9300
    setcolor corner = 1 sr = 255 sg = 128 sb = 0 sa = 255 mr = 255 mg = 128 mb = 0 ma = 255 er = 255 eg = 128 eb = 0 ea = 0 midTime = 0.9300
    setcolor corner = 2 sr = 255 sg = 128 sb = 0 sa = 255 mr = 255 mg = 128 mb = 0 ma = 255 er = 255 eg = 128 eb = 0 ea = 0 midTime = 0.9300
    setcolor corner = 3 sr = 255 sg = 128 sb = 0 sa = 255 mr = 255 mg = 128 mb = 0 ma = 255 er = 255 eg = 128 eb = 0 ea = 0 midTime = 0.9300
    emitrate rate = 32.0
endscript
APM_marker02_particle_params = {
    boneoffset = (0.0, 0.0, 43.0)
    emitscript = emit_APM_marker02_particle
    emitterindependent = 1
    fillpath
    max = 256
    type = RibbonChain
    texture = apm_harcircle
    BlendMode = Blend
    priority = 0
    suspenddistance = Default_Particle_Suspend_Dist
}

script emit_APM_marker02_particle 
    setemitrange width = 0.0 height = 0.0 depth = 0.0
    setlife min = 4.100 max = 4.100
    setanglespread spread = 0.0
    setspeedrange min = 0.0 max = 0.0
    setemittarget x = 1.0 y = 0.0 z = 0.0
    setforce x = 0.0 y = 0.0 z = 0.0
    setparticlesize sw = 10.0 ew = 10.0 sh = 5.0 eh = 5.0
    setcolor corner = 0 sr = 0 sg = 255 sb = 0 sa = 255 mr = 0 mg = 255 mb = 0 ma = 255 er = 0 eg = 255 eb = 0 ea = 255 midTime = 0.6300
    setcolor corner = 1 sr = 0 sg = 255 sb = 0 sa = 255 mr = 0 mg = 255 mb = 0 ma = 255 er = 0 eg = 255 eb = 0 ea = 255 midTime = 0.6300
    setcolor corner = 2 sr = 0 sg = 255 sb = 0 sa = 255 mr = 0 mg = 255 mb = 0 ma = 255 er = 0 eg = 255 eb = 0 ea = 255 midTime = 0.6300
    setcolor corner = 3 sr = 0 sg = 255 sb = 0 sa = 255 mr = 0 mg = 255 mb = 0 ma = 255 er = 0 eg = 255 eb = 0 ea = 255 midTime = 0.6300
    emitrate rate = 64.0
endscript
APM_marker03_particle_params = {
    boneoffset = (0.0, 0.0, 44.0)
    emitscript = emit_APM_marker03_particle
    emitterindependent = 1
    fillpath
    max = 256
    type = RibbonChain
    texture = apm_harcircle
    BlendMode = Blend
    priority = 0
    suspenddistance = Default_Particle_Suspend_Dist
}

script emit_APM_marker03_particle 
    setemitrange width = 0.0 height = 0.0 depth = 0.0
    setlife min = 4.0 max = 4.0
    setanglespread spread = 0.0
    setspeedrange min = 0.0 max = 0.0
    setemittarget x = 1.0 y = 0.0 z = 0.0
    setforce x = 0.0 y = 0.0 z = 0.0
    setparticlesize sw = 10.0 ew = 10.0 sh = 5.0 eh = 5.0
    setcolor corner = 0 sr = 0 sg = 255 sb = 0 sa = 255 mr = 0 mg = 255 mb = 0 ma = 255 er = 0 eg = 255 eb = 0 ea = 255 midTime = 0.6300
    setcolor corner = 1 sr = 0 sg = 255 sb = 0 sa = 255 mr = 0 mg = 255 mb = 0 ma = 255 er = 0 eg = 255 eb = 0 ea = 255 midTime = 0.6300
    setcolor corner = 2 sr = 0 sg = 255 sb = 0 sa = 255 mr = 0 mg = 255 mb = 0 ma = 255 er = 0 eg = 255 eb = 0 ea = 255 midTime = 0.6300
    setcolor corner = 3 sr = 0 sg = 255 sb = 0 sa = 255 mr = 0 mg = 255 mb = 0 ma = 255 er = 0 eg = 255 eb = 0 ea = 255 midTime = 0.6300
    emitrate rate = 64.0
endscript
APM_rainbow_particle_params = {
    emitscript = emit_APM_rainbow_particle
    emitterindependent = 1
    fillpath
    max = 128
    type = RibbonChain
    texture = apm_rainbow
    BlendMode = Blend
    History = 1
    priority = 0
    suspenddistance = Default_Particle_Suspend_Dist
}

script emit_APM_rainbow_particle 
    setemitrange width = 0.0 height = 0.0 depth = 0.0
    setlife min = 4.0 max = 4.0
    setanglespread spread = 0.0
    setspeedrange min = 0.0 max = 0.0
    setemittarget x = 1.0 y = 0.0 z = 0.0
    setforce x = 0.0 y = 0.0 z = 0.0
    setparticlesize sw = 5.0 ew = 10.0 sh = 5.0 eh = 5.0
    setcolor corner = 0 sr = 134 sg = 134 sb = 134 sa = 136 mr = 134 mg = 134 mb = 134 ma = 134 er = 134 eg = 134 eb = 134 ea = 0 midTime = 0.6300
    setcolor corner = 1 sr = 134 sg = 134 sb = 134 sa = 136 mr = 134 mg = 134 mb = 134 ma = 134 er = 134 eg = 134 eb = 134 ea = 0 midTime = 0.6300
    emitrate rate = 32.0
endscript
APM_sm_wheelsmoke01_particle_params = {
    emitscript = emit_APM_sm_wheelsmoke01_particle
    emitterindependent = 1
    fillpath
    max = 44
    type = Shaded
    texture = apm_smokepuff_rot_01
    BlendMode = Blend
    rotvel = (0.0, 1.0)
    rotveltimescale = 0.2000
    useglobalcolormodulation
    priority = 0
}

script emit_APM_sm_wheelsmoke01_particle 
    setemitrange width = 55.0 height = 55.0 depth = 55.0
    setcircularemit circular = 1
    setlife min = 1.0 max = 2.0
    setanglespread spread = 0.3100
    setspeedrange min = 1.0 max = 1.0
    setemittarget x = 0.0 y = -1.0 z = 0.0
    setforce x = 0.0 y = 0.08000 z = 0.0
    setparticlesize sw = 111.0 ew = 111.0 sh = 111.0 eh = 111.0
    setcolor corner = 0 sr = 101 sg = 101 sb = 101 sa = 0 mr = 105 mg = 105 mb = 105 ma = 169 er = 64 eg = 64 eb = 64 ea = 0 midTime = 0.5100
    setcolor corner = 1 sr = 101 sg = 101 sb = 101 sa = 0 mr = 105 mg = 105 mb = 105 ma = 169 er = 64 eg = 64 eb = 64 ea = 0 midTime = 0.5100
    setcolor corner = 2 sr = 101 sg = 101 sb = 101 sa = 0 mr = 105 mg = 105 mb = 105 ma = 169 er = 64 eg = 64 eb = 64 ea = 0 midTime = 0.5100
    setcolor corner = 3 sr = 101 sg = 101 sb = 101 sa = 0 mr = 105 mg = 105 mb = 105 ma = 169 er = 64 eg = 64 eb = 64 ea = 0 midTime = 0.5100
    emitrate rate = 22.0
    wait 12.0 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript
APM_sm_wheelsmoke02_particle_params = {
    emitscript = emit_APM_sm_wheelsmoke02_particle
    max = 16
    type = Shaded
    texture = apm_fallingwater_01
    BlendMode = Blend
    align_to = (0.0, 1.0, 0.0)
    useglobalcolormodulation
    priority = 0
}

script emit_APM_sm_wheelsmoke02_particle 
    setemitrange width = 0.0 height = 0.0 depth = 0.0
    setlife min = 0.5000 max = 0.5000
    setanglespread spread = 0.0
    setspeedrange min = 0.01000 max = 0.01000
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.0 z = 0.0
    setparticlesize sw = 55.0 ew = 22.0 sh = 55.0 eh = 22.0
    setcolor corner = 0 sr = 26 sg = 26 sb = 26 sa = 62 mr = 26 mg = 26 mb = 26 ma = 62 er = 26 eg = 26 eb = 26 ea = 62 midTime = 0.5100
    setcolor corner = 1 sr = 26 sg = 26 sb = 26 sa = 62 mr = 26 mg = 26 mb = 26 ma = 62 er = 26 eg = 26 eb = 26 ea = 62 midTime = 0.5100
    setcolor corner = 2 sr = 26 sg = 26 sb = 26 sa = 62 mr = 26 mg = 26 mb = 26 ma = 62 er = 26 eg = 26 eb = 26 ea = 62 midTime = 0.5100
    setcolor corner = 3 sr = 26 sg = 26 sb = 26 sa = 62 mr = 26 mg = 26 mb = 26 ma = 62 er = 26 eg = 26 eb = 26 ea = 62 midTime = 0.5100
    emitrate rate = 32.0
endscript
APM_sm_woodhit01_particle_params = {
    emitscript = emit_APM_sm_woodhit01_particle
    emitterindependent = 1
    radiate
    max = 111
    type = Shaded
    texture = jow_au_chunks01
    BlendMode = Blend
    rotvel = (0.0, 3.0)
    rotveltimescale = 0.2000
    useglobalcolormodulation
    priority = 0
}

script emit_APM_sm_woodhit01_particle 
    setemitrange width = 12.0 height = 12.0 depth = 12.0
    setlife min = 0.5000 max = 0.5000
    setanglespread elevation = (-0.33000001311302185, 0.33000001311302185) sweep = (-0.5, 0.5)
    setspeedrange min = 3.0 max = 11.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = -0.6000 z = 0.0
    setparticlesize sw = 22.0 ew = 44.0 sh = 5.0 eh = 5.0
    setcolor corner = 0 sr = 77 sg = 63 sb = 43 sa = 255 mr = 128 mg = 106 mb = 72 ma = 255 er = 66 eg = 54 eb = 37 ea = 255 midTime = 0.5100
    setcolor corner = 1 sr = 77 sg = 63 sb = 43 sa = 255 mr = 128 mg = 106 mb = 72 ma = 255 er = 66 eg = 54 eb = 37 ea = 255 midTime = 0.5100
    setcolor corner = 2 sr = 77 sg = 63 sb = 43 sa = 255 mr = 128 mg = 106 mb = 72 ma = 255 er = 66 eg = 54 eb = 37 ea = 255 midTime = 0.5100
    setcolor corner = 3 sr = 77 sg = 63 sb = 43 sa = 255 mr = 128 mg = 106 mb = 72 ma = 255 er = 66 eg = 54 eb = 37 ea = 255 midTime = 0.5100
    emitrate rate = 222.0
    wait 0.2000 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript
APM_sm_woodhit02_particle_params = {
    emitscript = emit_APM_sm_woodhit02_particle
    emitterindependent = 1
    fillpath
    max = 33
    type = Shaded
    texture = jow_au_chunks01
    BlendMode = Blend
    rotvel = (0.0, 3.0)
    rotveltimescale = 0.2000
    useglobalcolormodulation
    priority = 0
}

script emit_APM_sm_woodhit02_particle 
    setemitrange width = 12.0 height = 12.0 depth = 12.0
    setlife min = 0.5000 max = 0.5000
    setanglespread elevation = (-0.33000001311302185, 0.33000001311302185) sweep = (-0.5, 0.5)
    setspeedrange min = 7.0 max = 11.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = -0.6000 z = 0.0
    setparticlesize sw = 15.0 ew = 30.0 sh = 5.0 eh = 2.0
    setcolor corner = 0 sr = 77 sg = 63 sb = 43 sa = 255 mr = 128 mg = 106 mb = 72 ma = 176 er = 66 eg = 54 eb = 37 ea = 255 midTime = 0.5100
    setcolor corner = 1 sr = 77 sg = 63 sb = 43 sa = 255 mr = 128 mg = 106 mb = 72 ma = 176 er = 66 eg = 54 eb = 37 ea = 255 midTime = 0.5100
    setcolor corner = 2 sr = 77 sg = 63 sb = 43 sa = 255 mr = 128 mg = 106 mb = 72 ma = 176 er = 66 eg = 54 eb = 37 ea = 255 midTime = 0.5100
    setcolor corner = 3 sr = 77 sg = 63 sb = 43 sa = 255 mr = 128 mg = 106 mb = 72 ma = 176 er = 66 eg = 54 eb = 37 ea = 255 midTime = 0.5100
    emitrate rate = 66.0
    wait 1.0 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript
APM_smoketrail01_particle_params = {
    boneoffset = (0.0, 10.300000190734863, 0.0)
    emitscript = emit_APM_smoketrail01_particle
    emitterindependent = 1
    fillpath
    max = 32
    type = RibbonChain
    texture = apm_smoketrail01
    BlendMode = Blend
    History = 1
    useglobalcolormodulation
    priority = 0
    suspenddistance = Default_Particle_Suspend_Dist
}

script emit_APM_smoketrail01_particle 
    setemitrange width = 0.0 height = 0.0 depth = 0.0
    setlife min = 1.0 max = 1.0
    setanglespread spread = 0.0
    setspeedrange min = 0.0 max = 0.0
    setemittarget x = 1.0 y = 0.0 z = 0.0
    setforce x = 0.0 y = 0.0 z = 0.0
    setparticlesize sw = 15.0 ew = 10.0 sh = 5.0 eh = 5.0
    setcolor corner = 0 sr = 183 sg = 183 sb = 183 sa = 0 mr = 155 mg = 165 mb = 165 ma = 64 er = 134 eg = 134 eb = 134 ea = 0 midTime = 0.03000
    setcolor corner = 1 sr = 183 sg = 183 sb = 183 sa = 0 mr = 155 mg = 165 mb = 165 ma = 64 er = 134 eg = 134 eb = 134 ea = 0 midTime = 0.03000
    emitrate rate = 32.0
endscript
APM_tesla01_particle_params = {
    emitscript = emit_APM_tesla01_particle
    emitterindependent = 1
    max = 3
    type = RibbonChain
    texture = apm_lightning02
    BlendMode = Add
    History = 1
    priority = 0
}

script emit_APM_tesla01_particle 
    setemitrange width = 44.0 height = 44.0 depth = 44.0
    setlife min = 0.5000 max = 0.5000
    setanglespread spread = -0.03000
    setspeedrange min = 18.0 max = 18.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = -0.05000 z = 0.0
    setparticlesize sw = 22.0 ew = 22.0 sh = 1.0 eh = 1.0
    setcolor corner = 0 sr = 0 sg = 183 sb = 255 sa = 255 mr = 197 mg = 226 mb = 231 ma = 255 er = 0 eg = 183 eb = 255 ea = 255 midTime = 0.9600
    setcolor corner = 1 sr = 197 sg = 226 sb = 231 sa = 0 mr = 83 mg = 229 mb = 255 ma = 255 er = 0 eg = 183 eb = 255 ea = 255 midTime = 0.5600
    wait 0.2000 seconds
    emit num = 3
    destroy ifempty = 1
endscript
APM_tesla02_particle_params = {
    emitscript = emit_APM_tesla02_particle
    emitterindependent = 1
    max = 3
    type = RibbonChain
    texture = apm_lightning02
    BlendMode = Add
    History = 1
    priority = 0
}

script emit_APM_tesla02_particle 
    setemitrange width = 44.0 height = 44.0 depth = 44.0
    setlife min = 0.5000 max = 0.5000
    setanglespread spread = -0.03000
    setspeedrange min = 18.0 max = 18.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = -0.05000 z = 0.0
    setparticlesize sw = 22.0 ew = 22.0 sh = 1.0 eh = 1.0
    setcolor corner = 0 sr = 0 sg = 183 sb = 255 sa = 255 mr = 197 mg = 226 mb = 231 ma = 255 er = 0 eg = 183 eb = 255 ea = 255 midTime = 0.9600
    setcolor corner = 1 sr = 197 sg = 226 sb = 231 sa = 0 mr = 83 mg = 229 mb = 255 ma = 255 er = 0 eg = 183 eb = 255 ea = 255 midTime = 0.5600
    emit num = 3
    destroy ifempty = 1
endscript
DT_APM_smokeBurst01_particle_params = {
    boneoffset = (-5446.0, 155.0, -1814.0)
    enablerotate
    emitscript = emit_DT_APM_smokeBurst01_particle
    max = 256
    type = Shaded
    texture = apm_smokepuff_rot_01
    BlendMode = Blend
    rotvel = (0.0, 1.0)
    rotveltimescale = 0.2000
    useglobalcolormodulation
    priority = 0
    suspenddistance = Default_Particle_Suspend_Dist
}

script emit_DT_APM_smokeBurst01_particle 
    setemitrange width = 1.0 height = 55.0 depth = 0.0
    setlife min = 0.5000 max = 0.5000
    setanglespread spread = 0.6800
    setspeedrange min = 1.0 max = 1.0
    setemitangle x = 0.0 y = 90.0 z = 0.0
    setforce x = 0.0 y = 0.01000 z = 0.0
    setparticlesize sw = 12.0 ew = 55.0 sh = 12.0 eh = 55.0
    setcolor corner = 0 sr = 202 sg = 180 sb = 169 sa = 255 er = 211 eg = 211 eb = 211 ea = 0
    setcolor corner = 1 sr = 202 sg = 180 sb = 169 sa = 255 er = 211 eg = 211 eb = 211 ea = 0
    setcolor corner = 2 sr = 202 sg = 180 sb = 169 sa = 255 er = 211 eg = 211 eb = 211 ea = 0
    setcolor corner = 3 sr = 202 sg = 180 sb = 169 sa = 255 er = 211 eg = 211 eb = 211 ea = 0
    setlodparams min_particles = 0 lod_dist1 = Default_Particle_LOD_Dist1 lod_dist2 = Default_Particle_LOD_Dist2
    emitrate rate = 512.0
    wait 0.06000 seconds
    emitrate rate = 0
    destroy ifempty = 1
endscript
DT_APM_splinterBurst01_particle_params = {
    boneoffset = (0.0, 13.899999618530273, 0.0)
    emitscript = emit_DT_APM_splinterBurst01_particle
    emitterindependent = 1
    max = 128
    type = Shaded
    texture = jow_au_chunks01
    BlendMode = Blend
    rotvel = (0.0, 3.0)
    rotveltimescale = 0.2000
    useglobalcolormodulation
    priority = 0
    suspenddistance = Default_Particle_Suspend_Dist
}

script emit_DT_APM_splinterBurst01_particle 
    setemitrange width = 1.0 height = 0.0 depth = 0.0
    setlife min = 0.1000 max = 1.0
    setanglespread spread = 0.6300
    setspeedrange min = 6.0 max = 12.50
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = -0.5000 z = 0.0
    setparticlesize sw = 22.0 ew = 12.0 sh = 2.0 eh = 4.0
    setcolor corner = 0 sr = 0 sg = 0 sb = 0 sa = 255 mr = 193 mg = 144 mb = 124 ma = 255 er = 211 eg = 137 eb = 68 ea = 0 midTime = 0.5000
    setcolor corner = 1 sr = 0 sg = 0 sb = 0 sa = 255 mr = 193 mg = 144 mb = 124 ma = 255 er = 211 eg = 137 eb = 68 ea = 0 midTime = 0.5000
    setcolor corner = 2 sr = 0 sg = 0 sb = 0 sa = 255 mr = 193 mg = 144 mb = 124 ma = 255 er = 211 eg = 137 eb = 68 ea = 0 midTime = 0.5000
    setcolor corner = 3 sr = 0 sg = 0 sb = 0 sa = 255 mr = 193 mg = 144 mb = 124 ma = 255 er = 211 eg = 137 eb = 68 ea = 0 midTime = 0.5000
    setlodparams min_particles = 0 lod_dist1 = Default_Particle_LOD_Dist1 lod_dist2 = Default_Particle_LOD_Dist2
    emitrate rate = 512.0
    wait 0.06000 seconds
    emitrate rate = 0
    destroy ifempty = 1
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
    suspenddistance = Default_Particle_Suspend_Dist
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
    suspenddistance = Default_Particle_Suspend_Dist
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
    suspenddistance = Default_Particle_Suspend_Dist
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
    suspenddistance = Default_Particle_Suspend_Dist
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
    suspenddistance = Default_Particle_Suspend_Dist
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
    suspenddistance = Default_Particle_Suspend_Dist
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
    suspenddistance = Default_Particle_Suspend_Dist
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
    suspenddistance = Default_Particle_Suspend_Dist
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
    suspenddistance = Default_Particle_Suspend_Dist
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
    suspenddistance = Default_Particle_Suspend_Dist
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
    suspenddistance = Default_Particle_Suspend_Dist
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
apm_BH_Grass01_particle_params = {
    emitscript = emit_apm_BH_Grass01_particle
    emitterindependent = 1
    fillpath
    max = 56
    type = Shaded
    texture = apm_grass01
    BlendMode = Blend
    rotvel = (0.0, 3.0)
    rotveltimescale = 0.2000
    useglobalcolormodulation
    priority = 0
}

script emit_apm_BH_Grass01_particle 
    setemitrange width = 10.0 height = 11.0 depth = 0.0
    setlife min = 0.2000 max = 0.5000
    setanglespread spread = 0.2500
    setspeedrange min = 4.0 max = 8.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = -0.4500 z = 0.0
    setparticlesize sw = 3.0 ew = 3.0 sh = 3.0 eh = 3.0
    setcolor corner = 0 sr = 57 sg = 64 sb = 44 sa = 255 mr = 83 mg = 97 mb = 52 ma = 255 er = 66 eg = 77 eb = 39 ea = 255 midTime = 0.5000
    setcolor corner = 1 sr = 57 sg = 64 sb = 44 sa = 255 mr = 83 mg = 97 mb = 52 ma = 255 er = 66 eg = 77 eb = 39 ea = 255 midTime = 0.5000
    setcolor corner = 2 sr = 57 sg = 64 sb = 44 sa = 255 mr = 83 mg = 97 mb = 52 ma = 255 er = 66 eg = 77 eb = 39 ea = 255 midTime = 0.5000
    setcolor corner = 3 sr = 57 sg = 64 sb = 44 sa = 255 mr = 83 mg = 97 mb = 52 ma = 255 er = 66 eg = 77 eb = 39 ea = 255 midTime = 0.5000
    emitrate rate = 111.0
endscript
apm_BH_dust01_particle_params = {
    boneoffset = (0.0, 7.199999809265137, 0.0)
    emitscript = emit_apm_BH_dust01_particle
    emitterindependent = 1
    fillpath
    max = 12
    type = Shaded
    texture = apm_spray_01
    BlendMode = Blend
    rotvel = (0.0, 1.0)
    rotveltimescale = 0.2000
    useglobalcolormodulation
    priority = 0
}

script emit_apm_BH_dust01_particle 
    setemitrange width = 10.0 height = 11.0 depth = 0.0
    setlife min = 0.2500 max = 1.0
    setanglespread spread = 0.2500
    setspeedrange min = 0.01000 max = 0.01000
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.01000 z = 0.0
    setparticlesize sw = 33.0 ew = 55.0 sh = 33.0 eh = 55.0
    setcolor corner = 0 sr = 50 sg = 47 sb = 44 sa = 0 mr = 73 mg = 69 mb = 65 ma = 235 er = 50 eg = 47 eb = 44 ea = 0 midTime = 0.5000
    setcolor corner = 1 sr = 50 sg = 47 sb = 44 sa = 0 mr = 73 mg = 69 mb = 65 ma = 235 er = 50 eg = 47 eb = 44 ea = 0 midTime = 0.5000
    setcolor corner = 2 sr = 50 sg = 47 sb = 44 sa = 0 mr = 73 mg = 69 mb = 65 ma = 235 er = 50 eg = 47 eb = 44 ea = 0 midTime = 0.5000
    setcolor corner = 3 sr = 50 sg = 47 sb = 44 sa = 0 mr = 73 mg = 69 mb = 65 ma = 235 er = 50 eg = 47 eb = 44 ea = 0 midTime = 0.5000
    emitrate rate = 12.0
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
    ObjID = skater
    update_brightness
    priority = 0
    suspenddistance = Default_Particle_Suspend_Dist
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
apm_FW_LE_SkidMARKS01_particle_params = {
    emitscript = emit_apm_FW_LE_SkidMARKS01_particle
    emitterindependent = 1
    max = 110
    type = RibbonChain
    texture = skidmarks
    BlendMode = Blend
    History = 2
    priority = 0
    suspenddistance = Default_Particle_Suspend_Dist
}

script emit_apm_FW_LE_SkidMARKS01_particle 
    setemitrange width = 1.0 height = 1.0 depth = 0.0
    setlife min = 5.0 max = 5.0
    setanglespread spread = 0.01000
    setspeedrange min = 0.01000 max = 0.01000
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.0 z = 0.0
    setparticlesize sw = 22.0 ew = 22.0 sh = 10.0 eh = 11.0
    setcolor corner = 0 sr = 0 sg = 0 sb = 0 sa = 68 mr = 0 mg = 0 mb = 0 ma = 94 er = 0 eg = 0 eb = 0 ea = 73 midTime = 0.5000
    setcolor corner = 1 sr = 0 sg = 0 sb = 0 sa = 68 mr = 0 mg = 0 mb = 0 ma = 94 er = 0 eg = 0 eb = 0 ea = 73 midTime = 0.5000
    emitrate rate = 22.0
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
    ObjID = skater
    update_brightness
    priority = 0
    suspenddistance = Default_Particle_Suspend_Dist
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
apm_HO_LE_OILYsmoke_particle_params = {
    boneoffset = (0.0, 15.0, 0.0)
    emitscript = emit_apm_HO_LE_OILYsmoke_particle
    emitterindependent = 1
    max = 55
    type = RibbonChain
    texture = apm_marker01
    BlendMode = Blend
    History = 1
    priority = 0
    suspenddistance = Default_Particle_Suspend_Dist
}

script emit_apm_HO_LE_OILYsmoke_particle 
    setemitrange width = 1.0 height = 1.0 depth = 0.0
    setlife min = 5.0 max = 5.0
    setanglespread spread = 0.01000
    setspeedrange min = 0.01000 max = 0.01000
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.0 z = 0.0
    setparticlesize sw = 10.0 ew = 11.0 sh = 10.0 eh = 11.0
    setcolor corner = 0 sr = 0 sg = 0 sb = 0 sa = 128 mr = 0 mg = 0 mb = 0 ma = 128 er = 0 eg = 0 eb = 0 ea = 128 midTime = 0.5000
    setcolor corner = 1 sr = 0 sg = 0 sb = 0 sa = 128 mr = 0 mg = 0 mb = 0 ma = 128 er = 0 eg = 0 eb = 0 ea = 128 midTime = 0.5000
    emitrate rate = 11.0
endscript
apm_HO_LE_SkidMARKS01_particle_params = {
    boneoffset = (0.0, 16.100000381469727, 0.0)
    emitscript = emit_apm_HO_LE_SkidMARKS01_particle
    emitterindependent = 1
    max = 110
    type = RibbonChain
    texture = apm_marker01
    BlendMode = Blend
    History = 2
    priority = 0
    suspenddistance = Default_Particle_Suspend_Dist
}

script emit_apm_HO_LE_SkidMARKS01_particle 
    setemitrange width = 1.0 height = 1.0 depth = 0.0
    setlife min = 5.0 max = 5.0
    setanglespread spread = 0.01000
    setspeedrange min = 0.01000 max = 0.01000
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.0 z = 0.0
    setparticlesize sw = 10.0 ew = 11.0 sh = 10.0 eh = 11.0
    setcolor corner = 0 sr = 0 sg = 0 sb = 0 sa = 128 mr = 0 mg = 0 mb = 0 ma = 128 er = 0 eg = 0 eb = 0 ea = 128 midTime = 0.5000
    setcolor corner = 1 sr = 0 sg = 0 sb = 0 sa = 128 mr = 0 mg = 0 mb = 0 ma = 128 er = 0 eg = 0 eb = 0 ea = 128 midTime = 0.5000
    emitrate rate = 22.0
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
    suspenddistance = Default_Particle_Suspend_Dist
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
    suspenddistance = Default_Particle_Suspend_Dist
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
apm_dirt_plant01_particle_params = {
    id = skater
    emitscript = emit_apm_dirt_plant01_particle
    emitterindependent = 1
    updatescript = align_scale_to_vel_update
    params = {
        bone = Bone_Board_Tail
        update_pos = 0
        emit_offset = (0.0, 0.5, 0.0)
        emit_scale = -1.0
        pos_offset = (0.0, -2.0, 0.0)
        base_vel = 800.0
        min_vel_range = 4
        max_vel_range = 8
        base_emit_rate = 66
    }
    max = 66
    type = Shaded
    texture = apm_debis_01
    BlendMode = Blend
    rotvel = (0.10000000149011612, 1.7000000476837158)
    rotveltimescale = 0.2000
    useglobalcolormodulation
    ObjID = skater
    update_brightness
    priority = 0
    suspenddistance = Default_Particle_Suspend_Dist
}

script emit_apm_dirt_plant01_particle 
    setemitrange width = 5.0 height = 5.0 depth = 0.0
    setlife min = 0.5000 max = 0.5000
    setanglespread spread = 0.5500
    setspeedrange min = 1.0 max = 5.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = -0.2000 z = 0.0
    setparticlesize sw = 5.0 ew = 5.0 sh = 5.0 eh = 5.0
    setcolor corner = 0 sr = 102 sg = 88 sb = 72 sa = 255 er = 102 eg = 95 eb = 76 ea = 0
    setcolor corner = 1 sr = 102 sg = 88 sb = 72 sa = 255 er = 102 eg = 95 eb = 76 ea = 0
    setcolor corner = 2 sr = 102 sg = 88 sb = 72 sa = 255 er = 102 eg = 95 eb = 76 ea = 0
    setcolor corner = 3 sr = 102 sg = 88 sb = 72 sa = 255 er = 102 eg = 95 eb = 76 ea = 0
    emit num = 66
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
    suspenddistance = Default_Particle_Suspend_Dist
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
    id = skater
    emitscript = emit_apm_dirt_puff02_particle
    emitterindependent = 1
    max = 9
    type = flat
    texture = apm_spray_01
    BlendMode = Blend
    useglobalcolormodulation
    priority = 0
    suspenddistance = Default_Particle_Suspend_Dist
}

script emit_apm_dirt_puff02_particle 
    setemitrange width = 5.0 height = 5.0 depth = 0.0
    setlife min = 0.3000 max = 0.3000
    setanglespread spread = 0.1700
    setspeedrange min = 1.0 max = 1.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.01000 z = 0.0
    setparticlesize sw = 10.0 ew = 20.0 sh = 10.0 eh = 20.0
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
    ObjID = skater
    update_brightness
    priority = 0
    suspenddistance = Default_Particle_Suspend_Dist
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
    ObjID = skater
    update_brightness
    priority = 0
    suspenddistance = Default_Particle_Suspend_Dist
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
    ObjID = skater
    update_brightness
    priority = 0
    suspenddistance = Default_Particle_Suspend_Dist
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
    ObjID = skater
    useglobalcolormodulation
    update_brightness
    priority = 0
    suspenddistance = Default_Particle_Suspend_Dist
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
apm_temp_particle01_particle_params = {
    emitscript = emit_apm_temp_particle01_particle
    emitterindependent = 1
    max = 36
    type = flat
    texture = apm_spark_01
    BlendMode = Blend
    useglobalcolormodulation
    priority = 0
    suspenddistance = Default_Particle_Suspend_Dist
}

script emit_apm_temp_particle01_particle 
    setemitrange width = 1.0 height = 1.0 depth = 0.0
    setlife min = 2.0 max = 3.0
    setanglespread spread = 0.2500
    setspeedrange min = 0.5000 max = 0.5000
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = -0.04000 z = 0.0
    setparticlesize sw = 4.0 ew = 12.0 sh = 4.0 eh = 12.0
    setcolor corner = 0 sr = 134 sg = 91 sb = 91 sa = 255 er = 150 eg = 143 eb = 119 ea = 0
    setlodparams min_particles = 0 lod_dist1 = Default_Particle_LOD_Dist1 lod_dist2 = Default_Particle_LOD_Dist2
    emitrate rate = 12.0
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
    suspenddistance = Default_Particle_Suspend_Dist
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
    suspenddistance = Default_Particle_Suspend_Dist
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
    suspenddistance = Default_Particle_Suspend_Dist
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
apm_waterring01_particle_params = {
    boneoffset = (0.0, 10.0, 0.0)
    emitscript = emit_apm_waterring01_particle
    emitterindependent = 1
    max = 5
    type = smooth
    texture = ba_apm_ripple
    BlendMode = brighten
    align_to = (0.0, 1.0, 0.0)
    priority = 0
    suspenddistance = Default_Particle_Suspend_Dist
}

script emit_apm_waterring01_particle 
    setemitrange width = 5.0 height = 5.0 depth = 0.0
    setlife min = 1.0 max = 3.0
    setanglespread spread = 0.1800
    setspeedrange min = 0.0 max = 0.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.0 z = 0.0
    setparticlesize sw = 5.0 ew = 40.0 sh = 5.0 eh = 40.0
    setcolor corner = 0 sr = 242 sg = 255 sb = 255 sa = 0 mr = 242 mg = 255 mb = 255 ma = 134 er = 242 eg = 255 eb = 255 ea = 0 midTime = 0.5000
    setcolor corner = 1 sr = 242 sg = 255 sb = 255 sa = 0 mr = 242 mg = 255 mb = 255 ma = 134 er = 242 eg = 255 eb = 255 ea = 0 midTime = 0.5000
    emitrate rate = 5.0
endscript
apm_waterring02_particle_params = {
    emitscript = emit_apm_waterring02_particle
    emitterindependent = 1
    max = 3
    type = smooth
    texture = ba_apm_ripple
    BlendMode = brighten
    align_to = (0.0, 1.0, 0.0)
    priority = 0
    suspenddistance = Default_Particle_Suspend_Dist
}

script emit_apm_waterring02_particle 
    setemitrange width = 5.0 height = 5.0 depth = 0.0
    setlife min = 0.5000 max = 0.5000
    setanglespread spread = 0.1800
    setspeedrange min = 0.0 max = 0.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.0 z = 0.0
    setparticlesize sw = 5.0 ew = 77.0 sh = 5.0 eh = 77.0
    setcolor corner = 0 sr = 242 sg = 255 sb = 255 sa = 255 mr = 242 mg = 255 mb = 255 ma = 134 er = 242 eg = 255 eb = 255 ea = 0 midTime = 0.5000
    setcolor corner = 1 sr = 242 sg = 255 sb = 255 sa = 255 mr = 242 mg = 255 mb = 255 ma = 134 er = 242 eg = 255 eb = 255 ea = 0 midTime = 0.5000
    emitrate rate = 5.0
    wait 0.5000 seconds
    emitrate rate = 0
    destroy ifempty = 1
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
    suspenddistance = Default_Particle_Suspend_Dist
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
