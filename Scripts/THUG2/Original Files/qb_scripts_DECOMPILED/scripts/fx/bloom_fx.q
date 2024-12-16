SCRIPT PulseBloom 
	KillSpawnedScript Id = PulseBloom_ScriptId 
	KillSpawnedScript Id = EndBloom_ScriptId 
	SpawnScript PulseBloom_Spawned Id = PulseBloom_ScriptId Params = <...> 
ENDSCRIPT

SCRIPT EndBloom 
	KillSpawnedScript Id = PulseBloom_ScriptId 
	KillSpawnedScript Id = EndBloom_ScriptId 
	SpawnScript EndBloom_Spawned Id = EndBloom_ScriptId Params = <...> 
ENDSCRIPT

SCRIPT PulseBloom_Spawned { initial_bloom_color = 50 
		final_bloom_color = 80 
		initial_strength = 180 
		final_strength = 150 
		strength_increment = 1 
	} 
	strength = <initial_strength> 
	strength_array = [ 0 , 0 , 0 ] 
	bloom = <initial_bloom_color> 
	bloom_color_array = [ 0 , 0 , 0 ] 
	BEGIN 
		SetArrayElement ArrayName = bloom_color_array Index = 0 NewValue = <bloom> 
		SetArrayElement ArrayName = bloom_color_array Index = 1 NewValue = <bloom> 
		SetArrayElement ArrayName = bloom_color_array Index = 2 NewValue = <bloom> 
		SetArrayElement ArrayName = strength_array Index = 0 NewValue = <strength> 
		SetArrayElement ArrayName = strength_array Index = 1 NewValue = <strength> 
		SetArrayElement ArrayName = strength_array Index = 2 NewValue = <strength> 
		TODManager_SetTempBloomParams { 
			On = 1 
			bloom1 = 30 
			bloom2 = 80 
			Color = <bloom_color_array> 
			strength = <strength_array> 
		} 
		strength = ( <strength> - <strength_increment> ) 
		IF ( <strength> < <final_strength> ) 
			strength = <final_strength> 
			BREAK 
		ENDIF 
		wait 1 gameframe 
	REPEAT 
	bloom = <final_bloom_color> 
	SetArrayElement ArrayName = bloom_color_array Index = 0 NewValue = <bloom> 
	SetArrayElement ArrayName = bloom_color_array Index = 1 NewValue = <bloom> 
	SetArrayElement ArrayName = bloom_color_array Index = 2 NewValue = <bloom> 
	SetArrayElement ArrayName = strength_array Index = 0 NewValue = <strength> 
	SetArrayElement ArrayName = strength_array Index = 1 NewValue = <strength> 
	SetArrayElement ArrayName = strength_array Index = 2 NewValue = <strength> 
	TODManager_SetTempBloomParams { 
		On = 1 
		Color = <bloom_color_array> 
		strength = <strength_array> 
	} 
ENDSCRIPT

SCRIPT EndBloom_Spawned MaxBloom = 100 FinalBloom = 255 SpeedDown = 6 strength = 13 
	bloom = <MaxBloom> 
	BloomColor = [ 0 , 0 , 0 ] 
	BEGIN 
		SetArrayElement ArrayName = BloomColor Index = 0 NewValue = <bloom> 
		SetArrayElement ArrayName = BloomColor Index = 1 NewValue = <bloom> 
		SetArrayElement ArrayName = BloomColor Index = 2 NewValue = <bloom> 
		TODManager_SetTempBloomParams On = 1 Color = <BloomColor> strength = <strength> 
		wait 1 gameframe 
		bloom = ( <bloom> + <SpeedDown> ) 
		IF ( <bloom> > <FinalBloom> ) 
			bloom = <FinalBloom> 
			BREAK 
		ENDIF 
	REPEAT 
	SetArrayElement ArrayName = BloomColor Index = 0 NewValue = <bloom> 
	SetArrayElement ArrayName = BloomColor Index = 1 NewValue = <bloom> 
	SetArrayElement ArrayName = BloomColor Index = 2 NewValue = <bloom> 
	TODManager_SetTempBloomParams On = 1 Color = <BloomColor> strength = <strength> 
	TODManager_SetTempBloomParams On = 0 
ENDSCRIPT

SCRIPT pause_bloom_off 
	KillSpawnedScript Id = PulseBloom_ScriptId 
	KillSpawnedScript Id = EndBloom_ScriptId 
	SetScreenEffectsOff 
ENDSCRIPT

SCRIPT pause_bloom_on MaxBloom = 100 strength = 7 
	SetScreenEffectsOn 
ENDSCRIPT

SCRIPT intensify_bloom amount = 90 Color = [ 240 240 240 ] 
	RETURN 
	IF ( <amount> > 9600 ) 
		SetArrayElement ArrayName = Color Index = 0 NewValue = ( 240 - ( ( <amount> -9600 ) / 18 ) ) 
		SetArrayElement ArrayName = Color Index = 1 NewValue = ( 240 - ( ( <amount> -9600 ) / 18 ) ) 
		SetArrayElement ArrayName = Color Index = 2 NewValue = ( 240 - ( ( <amount> -9600 ) / 18 ) ) 
		TODManager_SetTempBloomParams On = 1 strength = 100 bloom1 = 100 bloom2 = 100 Color = <Color> 
	ELSE 
		TODManager_SetTempBloomParams On = 1 strength = 100 bloom1 = 100 bloom2 = 70 Color = <Color> 
	ENDIF 
ENDSCRIPT


