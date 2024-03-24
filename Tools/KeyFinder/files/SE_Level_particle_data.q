

script load_level_particle_textures 
    LoadParticleTexture 'particles\apm_flamequad_01'
    LoadParticleTexture 'particles\ba_apm_softsquare01'
endscript

apm_SE_SP_ship_hover01_particle_params = {
    emitscript = emit_apm_SE_SP_ship_hover01_particle
    emitterindependent = 1
    max = 5
    type = Shaded
    texture = BA_APM_SoftSQuare01
    BlendMode = Add
    align_to = (0.0, 1.0, 0.0)
    priority = 0
}

script emit_apm_SE_SP_ship_hover01_particle 
    setemitrange width = 4.0 height = 4.0 depth = 0.0
    setcircularemit circular = 1
    setlife min = 0.4000 max = 0.4000
    setanglespread spread = 0.0
    setspeedrange min = 0.0 max = 0.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.4000 z = 0.0
    setparticlesize sw = 100.0 ew = 500.0
    setcolor corner = 0 sr = 209 sg = 242 sb = 255 sa = 0 mr = 111 mg = 220 mb = 240 ma = 53 er = 31 eg = 109 eb = 154 ea = 0 midTime = 0.5000
    setcolor corner = 1 sr = 209 sg = 242 sb = 255 sa = 0 mr = 111 mg = 220 mb = 240 ma = 53 er = 31 eg = 109 eb = 154 ea = 0 midTime = 0.5000
    setcolor corner = 2 sr = 209 sg = 242 sb = 255 sa = 0 mr = 111 mg = 220 mb = 240 ma = 53 er = 31 eg = 109 eb = 154 ea = 0 midTime = 0.5000
    setcolor corner = 3 sr = 209 sg = 242 sb = 255 sa = 0 mr = 111 mg = 220 mb = 240 ma = 53 er = 31 eg = 109 eb = 154 ea = 0 midTime = 0.5000
    emitrate rate = 128.0
endscript

apm_SE_fire01_particle_params = {
    boneoffset = (50.0, 0.0, 0.0)
    emitscript = emit_apm_SE_fire01_particle
    emitterindependent = 1
    max = 83
    type = Shaded
    texture = apm_flamequad_01
    BlendMode = Add
    userandomuvquadrants
    useglobalcolormodulation
}

script emit_apm_SE_fire01_particle 
    setemitrange width = 4.0 height = 4.0
    setcircularemit circular = 1
    setlife min = 0.2000 max = 0.6500
    setanglespread spread = 0.1222
    setspeedrange min = 1.0 max = 2.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.05000 z = 0.0
    setparticlesize sw = 18.0 ew = 2.0
    setcolor sr = 255 sg = 94 sb = 50 sa = 187 mr = 240 mg = 98 mb = 48 ma = 255 er = 154 eg = 47 eb = 31 ea = 0 midTime = 0.5000
    emitrate rate = 128.0
endscript

