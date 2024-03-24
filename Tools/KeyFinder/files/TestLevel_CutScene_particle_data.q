

script load_cutscene_particle_textures 
    LoadParticleTexture 'particles\apm_spark_01'
    LoadParticleTexture 'particles\apm_spray_01'
endscript

apm_TESTc_flare01_particle_params = {
    boneoffset = (0.0, 100.0, 0.0)
    emitscript = emit_apm_TESTc_flare01_particle
    emitterindependent = 1
    max = 128
    type = flat
    texture = apm_spray_01
    BlendMode = Blend
    useglobalcolormodulation
}

script emit_apm_TESTc_flare01_particle 
    setemitrange width = 1.0 height = 1.0
    setlife min = 0.2000 max = 0.5000
    setanglespread spread = 0.1222
    setspeedrange min = 1.0 max = 2.0
    setemittarget x = 0.0 y = 1.0 z = 0.0
    setforce x = 0.0 y = 0.05000 z = 0.0
    setparticlesize sw = 2.0 ew = 5.0
    setcolor sr = 255 sg = 85 sb = 50 sa = 83 mr = 154 mg = 145 mb = 139 ma = 216 er = 103 eg = 101 eb = 99 ea = 0 midTime = 0.3000
    emitrate rate = 128.0
endscript

apm_TESTc_flare02_particle_params = {
    boneoffset = (0.0, 100.0, 0.0)
    enablerotate
    emitscript = emit_apm_TESTc_flare02_particle
    emitterindependent = 1
    max = 13
    type = flat
    texture = apm_spark_01
    BlendMode = Add
    useglobalcolormodulation
}

script emit_apm_TESTc_flare02_particle 
    setemitrange width = 1.0 height = 1.0
    setlife min = 0.1000 max = 0.3000
    setanglespread spread = 0.7111
    setspeedrange min = 0.1000 max = 0.5000
    setforce x = 0.0 y = 0.0 z = 0.0
    setparticlesize sw = 10.0 ew = 3.0
    setcolor sr = 255 sg = 141 sb = 141 sa = 255 mr = 255 mg = 50 mb = 50 ma = 202 er = 255 eg = 85 eb = 50 ea = 83 midTime = 0.3000
    emitrate rate = 128.0
endscript

