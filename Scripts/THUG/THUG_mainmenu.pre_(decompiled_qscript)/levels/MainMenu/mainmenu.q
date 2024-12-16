NodeArray = 
[ 
	{ 
		Pos = VECTOR(0.13694199920, -0.68662399054, -0.16329100728) 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		Name = Box01 
		Class = LevelGeometry 
		CreatedAtStart 
		CollisionMode = Geometry 
	} 
	{ 
		Pos = VECTOR(0.08246999979, 0.00000000000, -349.88525390625) 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		Name = TRG_Playerrestart 
		Class = Restart 
		Type = Player1 
		CreatedAtStart 
		RestartName = "P1: Restart" 
		restart_types = [ Player1 Multiplayer Horse ] 
	} 
	{ 
		Pos = VECTOR(226.25555419922, 0.00000000000, -91.98060607910) 
		Angles = VECTOR(-1.57079601288, 0.00000000000, 0.00000000000) 
		Name = TRGP_shadowtrigger 
		Class = LevelGeometry 
		CreatedAtStart 
		CollisionMode = Geometry 
		TriggerScript = TRGP_shadowtriggerScript 
	} 
	{ 
		Pos = VECTOR(4.37183523178, -334.70700073242, 0.42694801092) 
		Angles = VECTOR(1.57079601288, 0.18682999909, -0.00000000000) 
		Name = mainmenu_background 
		Class = LevelGeometry 
		CreatedAtStart 
		CollisionMode = Geometry 
	} 
	{ 
		Pos = VECTOR(2343.84814453125, -502.46063232422, -1315.03857421875) 
		Angles = VECTOR(0.00000000000, 0.16351400316, 0.00000000000) 
		Name = light_03 
		Class = LevelGeometry 
		CreatedAtStart 
		CollisionMode = Geometry 
	} 
	{ 
		Pos = VECTOR(9.11307525635, -275.52621459961, 139.66789245605) 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		Name = TRG_LevelLightSS 
		Class = LevelLight 
		CreatedAtStart 
		Brightness = 1 
		InnerRadius = 20 
		OuterRadius = 190 
		Color = [ 255 , 252 , 235 ] 
	} 
	{ 
		Pos = VECTOR(23.18715286255, -375.67077636719, 188.22048950195) 
		Angles = VECTOR(0.00000000000, -0.11975699663, 0.00000000000) 
		Name = SS_player_restart 
		Class = Restart 
		Type = Player1 
		CreatedAtStart 
		RestartName = "P1: Restart" 
		restart_types = [ Player1 Multiplayer Horse ] 
		extra_anims = animload_THPS5_FrontEnd 
	} 
	{ 
		Pos = VECTOR(-312.81390380859, -124.64791870117, 10.28564453125) 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		Name = TRG_LightController 
		Class = GameObject 
		Type = Ghost 
		CreatedAtStart 
		AbsentInNetGames 
		Model = "none" 
		SuspendDistance = 0 
		lod_dist1 = 400 
		lod_dist2 = 401 
		TriggerScript = TRG_LightControllerScript 
	} 
	{ 
		Pos = VECTOR(-2.52145409584, -376.16741943359, -0.16330699623) 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		Name = Box02 
		Class = LevelGeometry 
		CreatedAtStart 
		CollisionMode = Geometry 
	} 
	{ 
		Pos = VECTOR(-302.14190673828, -40.75115966797, -0.00000200000) 
		Angles = VECTOR(1.57079601288, 0.00000000000, 0.00000000000) 
		Name = options_clousd_trigger 
		Class = GameObject 
		Type = Ghost 
		AbsentInNetGames 
		Model = "options_clouds\\options_clouds.mdl" 
		SuspendDistance = 0 
		lod_dist1 = 400 
		lod_dist2 = 401 
	} 
	{ 
		Pos = VECTOR(-302.14190673828, -7.81028699875, -0.00000000000) 
		Angles = VECTOR(1.57079601288, 0.00000000000, 0.00000000000) 
		Name = ui_bg_trigger 
		Class = GameObject 
		Type = Ghost 
		AbsentInNetGames 
		Model = "UI_bg\\UI_bg.mdl" 
		SuspendDistance = 0 
		lod_dist1 = 400 
		lod_dist2 = 401 
	} 
	{ 
		Pos = VECTOR(-15.91499710083, -356.83148193359, -21.02365112305) 
		Angles = VECTOR(1.57079601288, 0.00000000000, 0.00000000000) 
		Name = manhole_cover_smoke 
		Class = LevelGeometry 
		CollisionMode = Geometry 
	} 
	{ 
		Pos = VECTOR(25.01156806946, -374.59722900391, 131.59545898438) 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		Name = Iron_Man_Dust_1 
		Class = ParticleObject 
		Type = Default 
		BoxDimsStart = VECTOR(33.42842483521, 30.92082977295, 43.03717422485) 
		MidPosition = VECTOR(6.09924697876, -374.59722900391, 140.58856201172) 
		BoxDimsMid = VECTOR(11.96586418152, 12.93626308441, 9.29428958893) 
		EndPosition = VECTOR(6.48288488388, -374.59722900391, 119.04566192627) 
		BoxDimsEnd = VECTOR(11.96586418152, 12.93626308441, 9.29428958893) 
		Texture = ru_tb_puff_01 
		UseMidPoint 
		Type = NEWFLAT 
		BlendMode = Add 
		FixedAlpha = 128 
		AlphaCutoff = 1 
		MaxStreams = 2 
		SuspendDistance = 0 
		lod_dist1 = 400 
		lod_dist2 = 401 
		EmitRate = 40.00000000000 
		Lifetime = 4.00000000000 
		MidPointPCT = 50 
		StartRadius = 25.00000000000 
		MidRadius = 25.00000000000 
		EndRadius = 25.00000000000 
		StartRadiusSpread = 25.00000000000 
		MidRadiusSpread = 25.00000000000 
		EndRadiusSpread = 25.00000000000 
		StartRGB = [ 35 , 66 , 69 ] 
		StartAlpha = 7 
		EndRGB = [ 111 , 157 , 151 ] 
		EndAlpha = 0 
	} 
	{ 
		Pos = VECTOR(53.65729141235, -372.95919799805, 164.16018676758) 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		Name = Gene_Simmons_pyro 
		Class = ParticleObject 
		Type = Default 
		BoxDimsStart = VECTOR(6.61689710617, 6.12131309509, 15.30447196960) 
		MidPosition = VECTOR(53.08649063110, -337.56323242188, 163.84664916992) 
		BoxDimsMid = VECTOR(17.66764831543, 14.22690868378, 27.39497947693) 
		EndPosition = VECTOR(53.52594757080, -259.62115478516, 163.23831176758) 
		BoxDimsEnd = VECTOR(12.19581794739, 12.19583034515, 26.21425628662) 
		Texture = dt_generic_particle01 
		UseMidPoint 
		UseColorMidTime 
		Type = NEWFLAT 
		BlendMode = Add 
		FixedAlpha = 128 
		AlphaCutoff = 0 
		MaxStreams = 2 
		SuspendDistance = 10 
		lod_dist1 = 400 
		lod_dist2 = 401 
		EmitRate = 900.00000000000 
		Lifetime = 1.50000000000 
		MidPointPCT = 50 
		StartRadius = 30.00000000000 
		MidRadius = 14.00000000000 
		EndRadius = 14.00000000000 
		StartRadiusSpread = 4.00000000000 
		MidRadiusSpread = 4.00000000000 
		EndRadiusSpread = 4.00000000000 
		StartRGB = [ 49 , 36 , 21 ] 
		StartAlpha = 61 
		ColorMidTime = 40 
		MidRGB = [ 95 , 34 , 0 ] 
		MidAlpha = 51 
		EndRGB = [ 23 , 22 , 21 ] 
		EndAlpha = 0 
	} 
	{ 
		Pos = VECTOR(-7.63473892212, -372.95919799805, 164.16018676758) 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		Name = Gene_Simmons_pyro01 
		Class = ParticleObject 
		Type = Default 
		BoxDimsStart = VECTOR(6.61689710617, 6.12131309509, 15.30447196960) 
		MidPosition = VECTOR(-8.20553874969, -337.56323242188, 163.84664916992) 
		BoxDimsMid = VECTOR(17.66764831543, 14.22690868378, 27.39497947693) 
		EndPosition = VECTOR(-7.76608181000, -259.62115478516, 163.23831176758) 
		BoxDimsEnd = VECTOR(12.19581794739, 12.19583034515, 26.21425628662) 
		Texture = dt_generic_particle01 
		UseMidPoint 
		UseColorMidTime 
		Type = NEWFLAT 
		BlendMode = Add 
		FixedAlpha = 128 
		AlphaCutoff = 0 
		MaxStreams = 2 
		SuspendDistance = 10 
		lod_dist1 = 400 
		lod_dist2 = 401 
		EmitRate = 900.00000000000 
		Lifetime = 1.50000000000 
		MidPointPCT = 50 
		StartRadius = 30.00000000000 
		MidRadius = 14.00000000000 
		EndRadius = 14.00000000000 
		StartRadiusSpread = 4.00000000000 
		MidRadiusSpread = 4.00000000000 
		EndRadiusSpread = 4.00000000000 
		StartRGB = [ 49 , 36 , 21 ] 
		StartAlpha = 61 
		ColorMidTime = 40 
		MidRGB = [ 95 , 34 , 0 ] 
		MidAlpha = 51 
		EndRGB = [ 23 , 22 , 21 ] 
		EndAlpha = 0 
	} 
] 
TriggerScripts = 
[ 
	LoadTerrain 
	TRGP_shadowtriggerScript 
	TRG_LightControllerScript 
] 
SCRIPT LoadAllParticleTextures 
	LoadParticleTexture "particles\\ru_tb_puff_01" 
	LoadParticleTexture "particles\\dt_generic_particle01" 
ENDSCRIPT

SCRIPT TRGP_shadowtriggerScript 
	Obj_MoveToNode Name = TRG_Playerrestart Orient NoReset 
	ShadowSkaterOptionsTricks 
ENDSCRIPT

SCRIPT TRG_LightControllerScript 
	BEGIN 
		Wait 0.03999999911 second 
		FakeLights percent = 40 prefix = TRG_LevelLightSS 
		Wait 0.30000001192 second 
		FakeLights percent = 35 prefix = TRG_LevelLightSS 
		Wait 0.01999999955 second 
		FakeLights percent = 45 prefix = TRG_LevelLightSS 
		Wait 0.10000000149 second 
		FakeLights percent = 30 prefix = TRG_LevelLightSS 
		Wait 0.01999999955 second 
		FakeLights percent = 40 prefix = TRG_LevelLightSS 
		Wait 0.02999999933 second 
		FakeLights percent = 30 prefix = TRG_LevelLightSS 
		Wait 0.01999999955 second 
		FakeLights percent = 45 prefix = TRG_LevelLightSS 
		Wait 0.00999999978 second 
		FakeLights percent = 70 prefix = TRG_LevelLightSS 
		Wait 0.05999999866 second 
		FakeLights percent = 50 prefix = TRG_LevelLightSS 
		Wait 0.01999999955 second 
		FakeLights percent = 40 prefix = TRG_LevelLightSS 
		Wait 0.01999999955 second 
		FakeLights percent = 45 prefix = TRG_LevelLightSS 
		Wait 0.05000000075 second 
		FakeLights percent = 30 prefix = TRG_LevelLightSS 
		Wait 0.01999999955 second 
		FakeLights percent = 40 prefix = TRG_LevelLightSS 
		Wait 0.10000000149 second 
		FakeLights percent = 35 prefix = TRG_LevelLightSS 
		Wait 0.01999999955 second 
		FakeLights percent = 45 prefix = TRG_LevelLightSS 
		Wait 0.00999999978 second 
		FakeLights percent = 40 prefix = TRG_LevelLightSS 
		Wait 0.02999999933 second 
		FakeLights percent = 30 prefix = TRG_LevelLightSS 
		Wait 0.01999999955 second 
		FakeLights percent = 45 prefix = TRG_LevelLightSS 
		Wait 0.00999999978 second 
		FakeLights percent = 70 prefix = TRG_LevelLightSS 
		Wait 0.05999999866 second 
		FakeLights percent = 50 prefix = TRG_LevelLightSS 
		Wait 0.01999999955 second 
		FakeLights percent = 40 prefix = TRG_LevelLightSS 
		Wait 0.01999999955 second 
		FakeLights percent = 45 prefix = TRG_LevelLightSS 
		Wait 0.05000000075 second 
		FakeLights percent = 30 prefix = TRG_LevelLightSS 
		Wait 0.05999999866 second 
		FakeLights percent = 50 prefix = TRG_LevelLightSS 
		Wait 0.01999999955 second 
		FakeLights percent = 40 prefix = TRG_LevelLightSS 
		Wait 0.01999999955 second 
		FakeLights percent = 45 prefix = TRG_LevelLightSS 
		Wait 0.05000000075 second 
		FakeLights percent = 30 prefix = TRG_LevelLightSS 
	REPEAT 
ENDSCRIPT

SCRIPT LoadTerrain 
	SetTerrainDefault 
ENDSCRIPT

SCRIPT load_level_anims 
	animload_THPS5_FrontEnd 
ENDSCRIPT

SCRIPT LoadCameras 
	LoadAsset "levels\\MainMenu\\mainmenu_camera.ska" mainmenu_camera 
	LoadAsset "levels\\MainMenu\\mainmenu_camera02.ska" mainmenu_camera02 
	LoadAsset "levels\\MainMenu\\mainmenu_camera03.ska" mainmenu_camera03 
	LoadAsset "levels\\MainMenu\\skater_select_cam.ska" skater_select_cam 
	LoadAsset "levels\\MainMenu\\skater_select_cam01.ska" skater_select_cam01 
	LoadAsset "levels\\MainMenu\\skater_select_cam02.ska" skater_select_cam02 
	LoadAsset "levels\\MainMenu\\stationary_skater_cam.ska" stationary_skater_cam 
ENDSCRIPT

SCRIPT LoadObjectAnims 
ENDSCRIPT


