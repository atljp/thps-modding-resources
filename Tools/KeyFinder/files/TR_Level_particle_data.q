

script load_level_particle_textures 
    LoadParticleTexture 'particles\apm_flamequad_01'
endscript

apm_TR_fire01_particle_params = {
    emitscript = emit_apm_TR_fire01_particle
    emitterindependent = 1
    max = 70
    type = Shaded
    texture = apm_flamequad_01
    BlendMode = Add
    userandomuvquadrants
}

script emit_apm_TR_fire01_particle 
    setemitrange width = 3.0 height = 3.0
    setcircularemit circular = 1
    setlife min = 0.2000 max = 0.5500
    setanglespread spread = 0.1222
    setspeedrange min = 1.0 max = 2.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.05000 z = 0.0
    setparticlesize sw = 15.0 ew = 2.0
    setcolor sr = 255 sg = 94 sb = 50 sa = 187 mr = 240 mg = 98 mb = 48 ma = 255 er = 154 eg = 47 eb = 31 ea = 0 midTime = 0.5000
    emitrate rate = 128.0
endscript

