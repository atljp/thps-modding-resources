
script PulseBloom 
    KillSpawnedScript id = PulseBloom_ScriptId
    KillSpawnedScript id = EndBloom_ScriptId
    SpawnScript PulseBloom_Spawned id = PulseBloom_ScriptId params = <...> 
endscript


script EndBloom 
    KillSpawnedScript id = PulseBloom_ScriptId
    KillSpawnedScript id = EndBloom_ScriptId
    SpawnScript EndBloom_Spawned id = EndBloom_ScriptId params = <...> 
endscript


script PulseBloom_Spawned {initial_bloom_color = 50
        final_bloom_color = 80
        initial_strength = 180
        final_strength = 150
        strength_increment = 1
    }
    strength = <initial_strength>
    strength_array = [0 , 0 , 0]
    bloom = <initial_bloom_color>
    bloom_color_array = [0 , 0 , 0]
    begin 
    SetArrayElement arrayName = bloom_color_array index = 0 newValue = <bloom>
    SetArrayElement arrayName = bloom_color_array index = 1 newValue = <bloom>
    SetArrayElement arrayName = bloom_color_array index = 2 newValue = <bloom>
    SetArrayElement arrayName = strength_array index = 0 newValue = <strength>
    SetArrayElement arrayName = strength_array index = 1 newValue = <strength>
    SetArrayElement arrayName = strength_array index = 2 newValue = <strength>
    TODManager_SetTempBloomParams {
        on = 1
        bloom1 = 30
        bloom2 = 80
        color = <bloom_color_array>
        strength = <strength_array>
    }
    strength = (<strength> - <strength_increment>)
    if (<strength> < <final_strength>)
        strength = <final_strength>
        break 
    endif
    wait 1 gameframe
    repeat 
    bloom = <final_bloom_color>
    SetArrayElement arrayName = bloom_color_array index = 0 newValue = <bloom>
    SetArrayElement arrayName = bloom_color_array index = 1 newValue = <bloom>
    SetArrayElement arrayName = bloom_color_array index = 2 newValue = <bloom>
    SetArrayElement arrayName = strength_array index = 0 newValue = <strength>
    SetArrayElement arrayName = strength_array index = 1 newValue = <strength>
    SetArrayElement arrayName = strength_array index = 2 newValue = <strength>
    TODManager_SetTempBloomParams {
        on = 1
        color = <bloom_color_array>
        strength = <strength_array>
    }
endscript


script EndBloom_Spawned MaxBloom = 100 FinalBloom = 255 SpeedDown = 6 strength = 13
    bloom = <MaxBloom>
    BloomColor = [0 , 0 , 0]
    begin 
    SetArrayElement arrayName = BloomColor index = 0 newValue = <bloom>
    SetArrayElement arrayName = BloomColor index = 1 newValue = <bloom>
    SetArrayElement arrayName = BloomColor index = 2 newValue = <bloom>
    TODManager_SetTempBloomParams on = 1 color = <BloomColor> strength = <strength>
    wait 1 gameframe
    bloom = (<bloom> + <SpeedDown>)
    if (<bloom> > <FinalBloom>)
        bloom = <FinalBloom>
        break 
    endif
    repeat 
    SetArrayElement arrayName = BloomColor index = 0 newValue = <bloom>
    SetArrayElement arrayName = BloomColor index = 1 newValue = <bloom>
    SetArrayElement arrayName = BloomColor index = 2 newValue = <bloom>
    TODManager_SetTempBloomParams on = 1 color = <BloomColor> strength = <strength>
    TODManager_SetTempBloomParams on = 0
endscript


script pause_bloom_off 
    KillSpawnedScript id = PulseBloom_ScriptId
    KillSpawnedScript id = EndBloom_ScriptId
    SetScreenEffectsOff
endscript


script pause_bloom_on MaxBloom = 100 strength = 7
    SetScreenEffectsOn
endscript


script intensify_bloom amount = 90 color = [ 240 240 240 ]
    return 
    if (<amount> > 9600)
        SetArrayElement arrayName = color index = 0 newValue = (240 - ((<amount> -9600)/ 18))
        SetArrayElement arrayName = color index = 1 newValue = (240 - ((<amount> -9600)/ 18))
        SetArrayElement arrayName = color index = 2 newValue = (240 - ((<amount> -9600)/ 18))
        TODManager_SetTempBloomParams on = 1 strength = 100 bloom1 = 100 bloom2 = 100 color = <color>
    else
        TODManager_SetTempBloomParams on = 1 strength = 100 bloom1 = 100 bloom2 = 70 color = <color>
    endif
endscript

