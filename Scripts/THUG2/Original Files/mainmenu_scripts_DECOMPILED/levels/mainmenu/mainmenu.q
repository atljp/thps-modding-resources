mainmenu_NodeArray = 
[ 
	{ 
		Pos = VECTOR(144.35845947266, 1.64830994606, 15.56134223938) 
		Angles = VECTOR(0.20921400189, 0.53086400032, -0.15056000650) 
		Name = SkWare_Light_Sign23 
		Class = LevelGeometry 
		CreatedAtStart 
		CollisionMode = Geometry 
	} 
	{ 
		Pos = VECTOR(-79.14469146729, 79.38018798828, 61.68460083008) 
		Angles = VECTOR(0.00000000000, 0.22515800595, 0.00000000000) 
		Name = TRG_TR_Level_Light_01 
		Class = LevelLight 
		CreatedAtStart 
		RenderToViewport 
		SelectRenderOnly 
		ExcludeLevel 
		Brightness = 90 
		InnerRadius = 90 
		OuterRadius = 650 
		ExcludeGeometry = [ ] 
		Color = [ 255 , 131 , 30 ] 
	} 
	{ 
		Pos = VECTOR(-85.33068084717, 173.71533203125, 56.12510681152) 
		Angles = VECTOR(0.00000000000, 0.22515800595, 0.00000000000) 
		Name = TRG_TR_Level_Light_02 
		Class = LevelLight 
		CreatedAtStart 
		RenderToViewport 
		SelectRenderOnly 
		ExcludeLevel 
		Brightness = 90 
		InnerRadius = 300 
		OuterRadius = 350 
		ExcludeGeometry = [ ] 
		Color = [ 255 , 131 , 30 ] 
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
		Pos = VECTOR(23.18715286255, -375.67077636719, 188.22048950195) 
		Angles = VECTOR(0.00000000000, -0.11975699663, 0.00000000000) 
		Name = SS_player_restart 
		Class = Restart 
		Type = Player1 
		CreatedAtStart 
		RestartName = "P1: Restart" 
		restart_types = [ Player1 Multiplayer Horse ] 
		extra_anims = animload_THPS6_FrontEnd 
	} 
	{ 
		Pos = VECTOR(-626.45812988281, -40.75115966797, -0.00000200000) 
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
		Pos = VECTOR(-626.45812988281, -7.81028699875, -0.00000000000) 
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
		Pos = VECTOR(84.83287048340, -63.73978042603, 61.70404052734) 
		Angles = VECTOR(0.00000000000, 0.00323999999, 0.00000000000) 
		Name = TRG_Playerrestart 
		Class = Restart 
		Type = Player1 
		CreatedAtStart 
		RestartName = "P1: Restart" 
		restart_types = [ Player1 Multiplayer Horse ] 
	} 
	{ 
		Pos = VECTOR(48.52580261230, -63.75512695312, -0.16329400241) 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		Name = Box01 
		Class = LevelGeometry 
		CreatedAtStart 
		CollisionMode = Geometry 
	} 
	{ 
		Pos = VECTOR(-0.01681800000, -12.52342414856, -0.78991997242) 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		Name = wol_pie_12 
		Class = LevelObject 
		Type = Normal 
		CreatedAtStart 
		SuspendDistance = 0 
		lod_dist1 = 200 
		lod_dist2 = 201 
	} 
	{ 
		Pos = VECTOR(-0.01681800000, -12.52342414856, -0.78991997242) 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		Name = wol_pie_13 
		Class = LevelObject 
		Type = Normal 
		CreatedAtStart 
		SuspendDistance = 0 
		lod_dist1 = 200 
		lod_dist2 = 201 
	} 
	{ 
		Pos = VECTOR(-0.01681800000, -12.52342414856, -0.78991997242) 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		Name = wol_pie_11 
		Class = LevelObject 
		Type = Normal 
		CreatedAtStart 
		SuspendDistance = 0 
		lod_dist1 = 200 
		lod_dist2 = 201 
	} 
	{ 
		Pos = VECTOR(-0.01681800000, -12.52342414856, -0.78991997242) 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		Name = wol_pie_8 
		Class = LevelObject 
		Type = Normal 
		CreatedAtStart 
		SuspendDistance = 0 
		lod_dist1 = 200 
		lod_dist2 = 201 
	} 
	{ 
		Pos = VECTOR(-0.01681800000, -12.52342414856, -0.78991997242) 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		Name = wol_pie_9 
		Class = LevelObject 
		Type = Normal 
		CreatedAtStart 
		SuspendDistance = 0 
		lod_dist1 = 200 
		lod_dist2 = 201 
	} 
	{ 
		Pos = VECTOR(-0.01681800000, -12.52342414856, -0.78991997242) 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		Name = wol_pie_10 
		Class = LevelObject 
		Type = Normal 
		CreatedAtStart 
		SuspendDistance = 0 
		lod_dist1 = 200 
		lod_dist2 = 201 
	} 
	{ 
		Pos = VECTOR(-0.01681800000, -12.52342414856, -0.78991997242) 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		Name = wol_pie_7 
		Class = LevelObject 
		Type = Normal 
		CreatedAtStart 
		SuspendDistance = 0 
		lod_dist1 = 200 
		lod_dist2 = 201 
	} 
	{ 
		Pos = VECTOR(-0.62580400705, -12.52342414856, -0.78991997242) 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		Name = wol_pie_16 
		Class = LevelObject 
		Type = Normal 
		CreatedAtStart 
		SuspendDistance = 0 
		lod_dist1 = 200 
		lod_dist2 = 201 
	} 
	{ 
		Pos = VECTOR(-0.01681800000, -12.52342414856, -0.78991997242) 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		Name = wol_pie_3 
		Class = LevelObject 
		Type = Normal 
		CreatedAtStart 
		SuspendDistance = 0 
		lod_dist1 = 200 
		lod_dist2 = 201 
	} 
	{ 
		Pos = VECTOR(-0.01681800000, -12.52342414856, -0.78991997242) 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		Name = wol_pie_2 
		Class = LevelObject 
		Type = Normal 
		CreatedAtStart 
		SuspendDistance = 0 
		lod_dist1 = 200 
		lod_dist2 = 201 
	} 
	{ 
		Pos = VECTOR(-0.01681800000, -12.52342414856, -0.78991997242) 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		Name = wol_pie_1 
		Class = LevelObject 
		Type = Normal 
		CreatedAtStart 
		SuspendDistance = 0 
		lod_dist1 = 200 
		lod_dist2 = 201 
	} 
	{ 
		Pos = VECTOR(-0.01681800000, -12.52342414856, -0.78991997242) 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		Name = wol_pie_14 
		Class = LevelObject 
		Type = Normal 
		CreatedAtStart 
		SuspendDistance = 0 
		lod_dist1 = 200 
		lod_dist2 = 201 
	} 
	{ 
		Pos = VECTOR(-0.01681800000, -12.52342414856, -0.78991997242) 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		Name = wol_pie_15 
		Class = LevelObject 
		Type = Normal 
		CreatedAtStart 
		SuspendDistance = 0 
		lod_dist1 = 200 
		lod_dist2 = 201 
	} 
	{ 
		Pos = VECTOR(-0.01681800000, -12.52342414856, -0.78991997242) 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		Name = wol_pie_4 
		Class = LevelObject 
		Type = Normal 
		CreatedAtStart 
		SuspendDistance = 0 
		lod_dist1 = 200 
		lod_dist2 = 201 
	} 
	{ 
		Pos = VECTOR(-0.01681800000, -12.52342414856, -0.78991997242) 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		Name = wol_pie_6 
		Class = LevelObject 
		Type = Normal 
		CreatedAtStart 
		SuspendDistance = 0 
		lod_dist1 = 200 
		lod_dist2 = 201 
	} 
	{ 
		Pos = VECTOR(-0.01681800000, -12.52342414856, -0.78991997242) 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		Name = wol_pie_5 
		Class = LevelObject 
		Type = Normal 
		CreatedAtStart 
		SuspendDistance = 0 
		lod_dist1 = 200 
		lod_dist2 = 201 
	} 
	{ 
		Pos = VECTOR(0.00000000000, -12.75367546082, -7.07049322128) 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		Name = wol_inner_ring 
		Class = LevelObject 
		Type = Normal 
		CreatedAtStart 
		SuspendDistance = 0 
		lod_dist1 = 200 
		lod_dist2 = 201 
	} 
	{ 
		Pos = VECTOR(0.07999999821, -12.76000022888, -14.18999862671) 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		Name = wol_tag 
		Class = LevelObject 
		Type = Normal 
		CreatedAtStart 
		SuspendDistance = 0 
		lod_dist1 = 200 
		lod_dist2 = 201 
	} 
	{ 
		Pos = VECTOR(-0.10346700251, -12.75223731995, -0.02244099975) 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		Name = wol_outer_ring 
		Class = LevelObject 
		Type = Normal 
		CreatedAtStart 
		SuspendDistance = 0 
		lod_dist1 = 200 
		lod_dist2 = 201 
	} 
	{ 
		Pos = VECTOR(0.08517800272, -12.76135063171, -14.19164276123) 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		Name = wol_inner_star 
		Class = LevelObject 
		Type = Normal 
		CreatedAtStart 
		SuspendDistance = 0 
		lod_dist1 = 200 
		lod_dist2 = 201 
	} 
	{ 
		Pos = VECTOR(0.07999999821, -12.76000022888, -14.18999958038) 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		Name = wol_lightbulb_1 
		Class = LevelObject 
		Type = Normal 
		CreatedAtStart 
		SuspendDistance = 0 
		lod_dist1 = 200 
		lod_dist2 = 201 
	} 
	{ 
		Pos = VECTOR(0.07999999821, -12.76000022888, -14.18999958038) 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		Name = wol_lightbulb_2 
		Class = LevelObject 
		Type = Normal 
		CreatedAtStart 
		SuspendDistance = 0 
		lod_dist1 = 200 
		lod_dist2 = 201 
	} 
	{ 
		Pos = VECTOR(0.07999999821, -12.76000022888, -14.18999958038) 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		Name = wol_lightbulb_3 
		Class = LevelObject 
		Type = Normal 
		CreatedAtStart 
		SuspendDistance = 0 
		lod_dist1 = 200 
		lod_dist2 = 201 
	} 
	{ 
		Pos = VECTOR(0.07999999821, -12.76000022888, -14.18999958038) 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		Name = wol_lightbulb_4 
		Class = LevelObject 
		Type = Normal 
		CreatedAtStart 
		SuspendDistance = 0 
		lod_dist1 = 200 
		lod_dist2 = 201 
	} 
	{ 
		Pos = VECTOR(0.08000200242, -12.76000022888, -14.18999958038) 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		Name = wol_lightbulb_5 
		Class = LevelObject 
		Type = Normal 
		CreatedAtStart 
		SuspendDistance = 0 
		lod_dist1 = 200 
		lod_dist2 = 201 
	} 
	{ 
		Pos = VECTOR(0.07999999821, -12.76000022888, -14.18999958038) 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		Name = wol_lightbulb_6 
		Class = LevelObject 
		Type = Normal 
		CreatedAtStart 
		SuspendDistance = 0 
		lod_dist1 = 200 
		lod_dist2 = 201 
	} 
	{ 
		Pos = VECTOR(0.08000200242, -12.76000213623, -14.18999958038) 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		Name = wol_lightbulb_7 
		Class = LevelObject 
		Type = Normal 
		CreatedAtStart 
		SuspendDistance = 0 
		lod_dist1 = 200 
		lod_dist2 = 201 
	} 
	{ 
		Pos = VECTOR(0.08000200242, -12.76000213623, -14.18999958038) 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		Name = wol_lightbulb_8 
		Class = LevelObject 
		Type = Normal 
		CreatedAtStart 
		SuspendDistance = 0 
		lod_dist1 = 200 
		lod_dist2 = 201 
	} 
	{ 
		Pos = VECTOR(0.08000200242, -12.76000022888, -14.18999958038) 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		Name = wol_lightbulb_9 
		Class = LevelObject 
		Type = Normal 
		CreatedAtStart 
		SuspendDistance = 0 
		lod_dist1 = 200 
		lod_dist2 = 201 
	} 
	{ 
		Pos = VECTOR(0.08000200242, -12.76000213623, -14.18999958038) 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		Name = wol_lightbulb_10 
		Class = LevelObject 
		Type = Normal 
		CreatedAtStart 
		SuspendDistance = 0 
		lod_dist1 = 200 
		lod_dist2 = 201 
	} 
	{ 
		Pos = VECTOR(0.07999999821, -12.76000213623, -14.18999958038) 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		Name = wol_lightbulb_11 
		Class = LevelObject 
		Type = Normal 
		CreatedAtStart 
		SuspendDistance = 0 
		lod_dist1 = 200 
		lod_dist2 = 201 
	} 
	{ 
		Pos = VECTOR(0.07999999821, -12.76000213623, -14.18999958038) 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		Name = wol_lightbulb_12 
		Class = LevelObject 
		Type = Normal 
		CreatedAtStart 
		SuspendDistance = 0 
		lod_dist1 = 200 
		lod_dist2 = 201 
	} 
	{ 
		Pos = VECTOR(0.07999999821, -12.76000213623, -14.18999958038) 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		Name = wol_lightbulb_13 
		Class = LevelObject 
		Type = Normal 
		CreatedAtStart 
		SuspendDistance = 0 
		lod_dist1 = 200 
		lod_dist2 = 201 
	} 
	{ 
		Pos = VECTOR(0.07999999821, -12.76000213623, -14.18999958038) 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		Name = wol_lightbulb_14 
		Class = LevelObject 
		Type = Normal 
		CreatedAtStart 
		SuspendDistance = 0 
		lod_dist1 = 200 
		lod_dist2 = 201 
	} 
	{ 
		Pos = VECTOR(0.07999999821, -12.76000213623, -14.18999958038) 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		Name = wol_lightbulb_15 
		Class = LevelObject 
		Type = Normal 
		CreatedAtStart 
		SuspendDistance = 0 
		lod_dist1 = 200 
		lod_dist2 = 201 
	} 
	{ 
		Pos = VECTOR(0.08000200242, -12.76000213623, -14.18999958038) 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		Name = wol_lightbulb_16 
		Class = LevelObject 
		Type = Normal 
		CreatedAtStart 
		SuspendDistance = 0 
		lod_dist1 = 200 
		lod_dist2 = 201 
	} 
	{ 
		Pos = VECTOR(0.08000200242, -12.76000213623, -14.18999958038) 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		Name = wol_lightbulb_17 
		Class = LevelObject 
		Type = Normal 
		CreatedAtStart 
		SuspendDistance = 0 
		lod_dist1 = 200 
		lod_dist2 = 201 
	} 
	{ 
		Pos = VECTOR(0.07999999821, -12.76000213623, -14.18999958038) 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		Name = wol_lightbulb_18 
		Class = LevelObject 
		Type = Normal 
		CreatedAtStart 
		SuspendDistance = 0 
		lod_dist1 = 200 
		lod_dist2 = 201 
	} 
	{ 
		Pos = VECTOR(0.08000200242, -12.76000213623, -14.18999958038) 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		Name = wol_lightbulb_19 
		Class = LevelObject 
		Type = Normal 
		CreatedAtStart 
		SuspendDistance = 0 
		lod_dist1 = 200 
		lod_dist2 = 201 
	} 
	{ 
		Pos = VECTOR(0.08000200242, -12.76000213623, -14.18999958038) 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		Name = wol_lightbulb_20 
		Class = LevelObject 
		Type = Normal 
		CreatedAtStart 
		SuspendDistance = 0 
		lod_dist1 = 200 
		lod_dist2 = 201 
	} 
	{ 
		Pos = VECTOR(0.08000200242, -12.76000213623, -14.18999958038) 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		Name = wol_lightbulb_21 
		Class = LevelObject 
		Type = Normal 
		CreatedAtStart 
		SuspendDistance = 0 
		lod_dist1 = 200 
		lod_dist2 = 201 
	} 
	{ 
		Pos = VECTOR(0.08000200242, -12.76000213623, -14.18999958038) 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		Name = wol_lightbulb_22 
		Class = LevelObject 
		Type = Normal 
		CreatedAtStart 
		SuspendDistance = 0 
		lod_dist1 = 200 
		lod_dist2 = 201 
	} 
	{ 
		Pos = VECTOR(0.08000200242, -12.76000022888, -14.18999958038) 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		Name = wol_lightbulb_23 
		Class = LevelObject 
		Type = Normal 
		CreatedAtStart 
		SuspendDistance = 0 
		lod_dist1 = 200 
		lod_dist2 = 201 
	} 
	{ 
		Pos = VECTOR(0.08000200242, -12.76000213623, -14.18999958038) 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		Name = wol_lightbulb_24 
		Class = LevelObject 
		Type = Normal 
		CreatedAtStart 
		SuspendDistance = 0 
		lod_dist1 = 200 
		lod_dist2 = 201 
	} 
	{ 
		Pos = VECTOR(0.08000200242, -12.76000022888, -14.18999958038) 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		Name = wol_lightbulb_25 
		Class = LevelObject 
		Type = Normal 
		CreatedAtStart 
		SuspendDistance = 0 
		lod_dist1 = 200 
		lod_dist2 = 201 
	} 
	{ 
		Pos = VECTOR(0.08000200242, -12.76000022888, -14.18999958038) 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		Name = wol_lightbulb_26 
		Class = LevelObject 
		Type = Normal 
		CreatedAtStart 
		SuspendDistance = 0 
		lod_dist1 = 200 
		lod_dist2 = 201 
	} 
	{ 
		Pos = VECTOR(0.08000200242, -12.76000022888, -14.18999958038) 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		Name = wol_lightbulb_27 
		Class = LevelObject 
		Type = Normal 
		CreatedAtStart 
		SuspendDistance = 0 
		lod_dist1 = 200 
		lod_dist2 = 201 
	} 
	{ 
		Pos = VECTOR(0.07999999821, -12.76000022888, -14.18999958038) 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		Name = wol_lightbulb_28 
		Class = LevelObject 
		Type = Normal 
		CreatedAtStart 
		SuspendDistance = 0 
		lod_dist1 = 200 
		lod_dist2 = 201 
	} 
	{ 
		Pos = VECTOR(-485.57220458984, 24.06773757935, -534.62658691406) 
		Angles = VECTOR(0.00000000000, 0.18451799452, 0.00000000000) 
		Name = SkWare_Light_Sign_MenGirls01 
		Class = LevelGeometry 
		CreatedAtStart 
		CollisionMode = Geometry 
	} 
	{ 
		Pos = VECTOR(-485.59417724609, 24.06767654419, -534.61102294922) 
		Angles = VECTOR(0.00000000000, 0.18451799452, 0.00000000000) 
		Name = SkWare_Dark_Sign_MenGirls01 
		Class = LevelGeometry 
		CollisionMode = Geometry 
	} 
	{ 
		Pos = VECTOR(-555.44537353516, 301.72982788086, -909.00036621094) 
		Angles = VECTOR(0.00000000000, 0.12638799846, 0.00000000000) 
		Name = SkWare_Roof03 
		Class = LevelGeometry 
		CreatedAtStart 
		CollisionMode = Geometry 
	} 
	{ 
		Pos = VECTOR(-781.63415527344, 24.81908035278, -485.48266601562) 
		Angles = VECTOR(0.00000000000, 0.12638799846, 0.00000000000) 
		Name = SkWare_Light_WindowFrame01 
		Class = LevelGeometry 
		CreatedAtStart 
		CollisionMode = Geometry 
	} 
	{ 
		Pos = VECTOR(-191.71968078613, 24.81908035278, -595.58636474609) 
		Angles = VECTOR(0.00000000000, 0.12638799846, 0.00000000000) 
		Name = SkWare_Light_WindowFrame02 
		Class = LevelGeometry 
		CreatedAtStart 
		CollisionMode = Geometry 
	} 
	{ 
		Pos = VECTOR(-338.89636230469, 6.14053821564, 251.19554138184) 
		Angles = VECTOR(0.00000000000, 0.12638799846, 0.00000000000) 
		Name = SkWare_Light_QP05 
		Class = LevelGeometry 
		CreatedAtStart 
		CollisionMode = Geometry 
	} 
	{ 
		Pos = VECTOR(399.84252929688, -53.95696640015, -696.88745117188) 
		Angles = VECTOR(0.00000000000, 0.12638799846, 0.00000000000) 
		Name = SkWare_Dark_Wall04 
		Class = LevelGeometry 
		CreatedAtStart 
		CollisionMode = Geometry 
	} 
	{ 
		Pos = VECTOR(-781.65124511719, 24.81889724731, -485.46795654297) 
		Angles = VECTOR(0.00000000000, 0.12638799846, 0.00000000000) 
		Name = SkWare_Dark_WindowFrame01 
		Class = LevelGeometry 
		CollisionMode = Geometry 
	} 
	{ 
		Pos = VECTOR(-191.74153137207, 24.81889724731, -595.57067871094) 
		Angles = VECTOR(0.00000000000, 0.12638799846, 0.00000000000) 
		Name = SkWare_Dark_WindowFrame02 
		Class = LevelGeometry 
		CollisionMode = Geometry 
	} 
	{ 
		Pos = VECTOR(115.83273315430, 165.74484252930, -109.47831726074) 
		Angles = VECTOR(1.44435095787, 0.17339199781, 0.01283499971) 
		Name = TB_Door_Roller_01 
		Class = LevelGeometry 
		CreatedAtStart 
		CollisionMode = Geometry 
	} 
	{ 
		Pos = VECTOR(100.49591064453, -4.08378076553, -317.40399169922) 
		Angles = VECTOR(0.00000000000, 0.17638799548, 0.00000000000) 
		Name = TB_Electrical_Upper_02 
		Class = LevelGeometry 
		CreatedAtStart 
		CollisionMode = Geometry 
		TriggerScript = TB_Electrical_Upper_02Script 
	} 
	{ 
		Pos = VECTOR(56.77767944336, -66.58618164062, -93.99282836914) 
		Angles = VECTOR(1.44435095787, 0.17339199781, 0.01283499971) 
		Name = TB_WH_Floor_Warning_01 
		Class = LevelGeometry 
		CreatedAtStart 
		CollisionMode = Geometry 
	} 
	{ 
		Pos = VECTOR(399.84252929688, -53.95696640015, -696.88745117188) 
		Angles = VECTOR(0.00000000000, 0.12638799846, 0.00000000000) 
		Name = TB_Floor_Upper_01 
		Class = LevelGeometry 
		CreatedAtStart 
		CollisionMode = Geometry 
	} 
	{ 
		Pos = VECTOR(344.97125244141, -66.94296264648, -433.54058837891) 
		Angles = VECTOR(-3.14159297943, 1.38627803326, -3.14159297943) 
		Name = WH_TB_Grime_01 
		Class = LevelGeometry 
		CreatedAtStart 
		CollisionMode = Geometry 
	} 
	{ 
		Pos = VECTOR(146.56158447266, 7.31479406357, -53.52258300781) 
		Angles = VECTOR(0.00000000000, 0.18451799452, 0.00000000000) 
		Name = G_Exit_Fence 
		Class = LevelGeometry 
		CreatedAtStart 
		CollisionMode = Geometry 
	} 
	{ 
		Pos = VECTOR(741.94232177734, 42.28172683716, -224.82325744629) 
		Angles = VECTOR(0.00000000000, 0.12875600159, 0.00000000000) 
		Name = g_entrance_door 
		Class = LevelGeometry 
		CreatedAtStart 
		CollisionMode = Geometry 
	} 
	{ 
		Pos = VECTOR(-933.97827148438, 35.47760391235, 2.13273692131) 
		Angles = VECTOR(0.00000000000, 0.18451799452, 0.00000000000) 
		Name = TB_Ware_Graffiti_01 
		Class = LevelGeometry 
		CreatedAtStart 
		CollisionMode = Geometry 
	} 
	{ 
		Pos = VECTOR(43.32333374023, -66.58618164062, -133.51440429688) 
		Angles = VECTOR(2.70418691635, 1.24019396305, 1.08945798874) 
		Name = TB_WH_Floor_Oilstains_02 
		Class = LevelGeometry 
		CreatedAtStart 
		CollisionMode = Geometry 
	} 
	{ 
		Pos = VECTOR(-1093.91894531250, -59.43947982788, -850.47167968750) 
		Angles = VECTOR(0.00000000000, 0.18451799452, 0.00000000000) 
		Name = SkWare_Fence02 
		Class = LevelGeometry 
		CreatedAtStart 
		CollisionMode = Geometry 
	} 
	{ 
		Pos = VECTOR(-1094.81225585938, -59.43941879272, -850.30493164062) 
		Angles = VECTOR(0.00000000000, 0.18451799452, 0.00000000000) 
		Name = SkWare_Fence03 
		Class = LevelGeometry 
		CreatedAtStart 
		CollisionMode = Geometry 
	} 
	{ 
		Pos = VECTOR(-1139.28784179688, 94.62901306152, -1093.61584472656) 
		Angles = VECTOR(3.14159297943, -0.22161400318, 3.14159297943) 
		Name = SkWare_Fence02_frame 
		Class = LevelGeometry 
		CreatedAtStart 
		CollisionMode = Geometry 
		LightGroup = NoLevelLights 
	} 
	{ 
		Pos = VECTOR(183.84120178223, 35.47761917114, 112.36955261230) 
		Angles = VECTOR(0.00000000000, 0.18451799452, 0.00000000000) 
		Name = TB_Ware_Graffiti_02 
		Class = LevelGeometry 
		CreatedAtStart 
		CollisionMode = Geometry 
	} 
	{ 
		Pos = VECTOR(124.15155029297, -62.72970199585, 82.81889343262) 
		Angles = VECTOR(0.00000000000, 0.18451799452, 0.00000000000) 
		Name = WH_TB_Ska8brd_01 
		Class = LevelObject 
		Type = Bouncy_Default 
		CreatedAtStart 
		AbsentInNetGames 
		bouncy 
		CollisionMode = Geometry 
		SuspendDistance = 0 
		lod_dist1 = 200 
		lod_dist2 = 201 
		contacts = [ VECTOR(-12.00000000000, 0.00000000000, -12.00000000000) VECTOR(12.00000000000, 0.00000000000, -12.00000000000) VECTOR(-12.00000000000, 0.00000000000, 12.00000000000) VECTOR(12.00000000000, 0.00000000000, 12.00000000000) VECTOR(-12.00000000000, 25.00000000000, -12.00000000000) VECTOR(12.00000000000, 25.00000000000, -12.00000000000) VECTOR(-12.00000000000, 25.00000000000, 12.00000000000) VECTOR(12.00000000000, 25.00000000000, 12.00000000000) ] 
		center_of_mass = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		coeff_restitution = 0.40000000596 
		coeff_friction = 0.50000000000 
		skater_collision_impulse_factor = 1.00000000000 
		skater_collision_rotation_factor = 1.00000000000 
		skater_collision_assent = 25.00000000000 
		skater_collision_radius = 48.00000000000 
	} 
	{ 
		Pos = VECTOR(171.79299926758, -52.14393234253, 85.55584716797) 
		Angles = VECTOR(0.00000000000, 0.18451799452, 0.00000000000) 
		Name = WH_TB_Sk8brd_02 
		Class = LevelObject 
		Type = Bouncy_Default 
		CreatedAtStart 
		AbsentInNetGames 
		bouncy 
		CollisionMode = Geometry 
		SuspendDistance = 0 
		lod_dist1 = 200 
		lod_dist2 = 201 
		contacts = [ VECTOR(-12.00000000000, 0.00000000000, -12.00000000000) VECTOR(12.00000000000, 0.00000000000, -12.00000000000) VECTOR(-12.00000000000, 0.00000000000, 12.00000000000) VECTOR(12.00000000000, 0.00000000000, 12.00000000000) VECTOR(-12.00000000000, 25.00000000000, -12.00000000000) VECTOR(12.00000000000, 25.00000000000, -12.00000000000) VECTOR(-12.00000000000, 25.00000000000, 12.00000000000) VECTOR(12.00000000000, 25.00000000000, 12.00000000000) ] 
		center_of_mass = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		coeff_restitution = 0.40000000596 
		coeff_friction = 0.50000000000 
		skater_collision_impulse_factor = 1.00000000000 
		skater_collision_rotation_factor = 1.00000000000 
		skater_collision_assent = 25.00000000000 
		skater_collision_radius = 48.00000000000 
	} 
	{ 
		Pos = VECTOR(175.81573486328, -66.87539672852, 84.76736450195) 
		Angles = VECTOR(0.00000000000, 0.84164899588, 0.00000000000) 
		Name = WH_TB_Sk8brd_02_shadow 
		Class = LevelGeometry 
		CreatedAtStart 
		CollisionMode = Geometry 
	} 
	{ 
		Pos = VECTOR(116.83691406250, -63.75161361694, 88.67747497559) 
		Angles = VECTOR(3.14159297943, 0.59844601154, 3.14159297943) 
		Name = WH_TB_Ska8brd_01_shadow 
		Class = LevelGeometry 
		CreatedAtStart 
		CollisionMode = Geometry 
	} 
	{ 
		Pos = VECTOR(116.83691406250, -63.75161361694, 88.67747497559) 
		Angles = VECTOR(3.14159297943, 0.59844601154, 3.14159297943) 
		Name = WH_TB_Ska8brd_01b_shadow 
		Class = LevelGeometry 
		CreatedAtStart 
		CollisionMode = Geometry 
	} 
	{ 
		Pos = VECTOR(104.59921264648, -62.68294906616, 95.25292968750) 
		Angles = VECTOR(0.00000000000, 0.18451799452, 0.00000000000) 
		Name = WH_TB_Ska8brd_01b 
		Class = LevelObject 
		Type = Bouncy_Default 
		CreatedAtStart 
		AbsentInNetGames 
		bouncy 
		CollisionMode = Geometry 
		SuspendDistance = 0 
		lod_dist1 = 200 
		lod_dist2 = 201 
		contacts = [ VECTOR(-12.00000000000, 0.00000000000, -12.00000000000) VECTOR(12.00000000000, 0.00000000000, -12.00000000000) VECTOR(-12.00000000000, 0.00000000000, 12.00000000000) VECTOR(12.00000000000, 0.00000000000, 12.00000000000) VECTOR(-12.00000000000, 25.00000000000, -12.00000000000) VECTOR(12.00000000000, 25.00000000000, -12.00000000000) VECTOR(-12.00000000000, 25.00000000000, 12.00000000000) VECTOR(12.00000000000, 25.00000000000, 12.00000000000) ] 
		center_of_mass = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		coeff_restitution = 0.40000000596 
		coeff_friction = 0.50000000000 
		skater_collision_impulse_factor = 1.00000000000 
		skater_collision_rotation_factor = 1.00000000000 
		skater_collision_assent = 25.00000000000 
		skater_collision_radius = 48.00000000000 
	} 
	{ 
		Pos = VECTOR(52.52392578125, 280.33493041992, -576.04992675781) 
		Angles = VECTOR(0.94503998756, 0.11343099922, -0.03673100099) 
		Name = WH_TB_Pipes_02 
		Class = LevelGeometry 
		CreatedAtStart 
		CollisionMode = Geometry 
	} 
	{ 
		Pos = VECTOR(452.45678710938, -183.07331848145, -2928.53369140625) 
		Angles = VECTOR(0.00000000000, 0.18451799452, 0.00000000000) 
		Name = WH_TB_Roof_01 
		Class = LevelGeometry 
		CreatedAtStart 
		LOD_Name = SkWare_Wall02_LOD 
		LOD_Dist = 3000 
	} 
	{ 
		Pos = VECTOR(-316.61663818359, 337.89181518555, 365.20495605469) 
		Angles = VECTOR(0.00000000000, 0.18451799452, 0.00000000000) 
		Name = TB_Beam_Upper_01_Shadow 
		Class = LevelGeometry 
		CreatedAtStart 
		CollisionMode = Geometry 
	} 
	{ 
		Pos = VECTOR(100.49591064453, -4.08378076553, -317.40399169922) 
		Angles = VECTOR(0.00000000000, 0.17638799548, 0.00000000000) 
		Name = TB_Electrical_Upper_02_destroyed 
		Class = LevelGeometry 
		CollisionMode = Geometry 
	} 
	{ 
		Pos = VECTOR(-316.61663818359, 337.89181518555, 365.20495605469) 
		Angles = VECTOR(0.00000000000, 0.18451799452, 0.00000000000) 
		Name = TB_Beam_Upper_01 
		Class = LevelGeometry 
		CreatedAtStart 
		CollisionMode = Geometry 
	} 
	{ 
		Pos = VECTOR(95.32220458984, -4.82026195526, -309.82751464844) 
		Angles = VECTOR(0.00000000000, 0.16843900084, 0.00000000000) 
		Name = ATM_SparkA01 
		Class = ParticleObject 
		Type = Default 
		BoxDimsStart = VECTOR(7.60034990311, 2.05353999138, 10.92683219910) 
		MidPosition = VECTOR(100.21472167969, -4.32624292374, -312.64276123047) 
		BoxDimsMid = VECTOR(34.32083511353, 34.32083511353, 34.32083511353) 
		EndPosition = VECTOR(103.27105712891, 1.89787805080, -296.56066894531) 
		BoxDimsEnd = VECTOR(30.04693031311, 30.04693031311, 30.04693031311) 
		Texture = apm_spark_01 
		AbsentInNetGames 
		UseMidPoint 
		Type = NEWFLAT 
		BlendMode = Add 
		FixedAlpha = 128 
		AlphaCutoff = 1 
		MaxStreams = 2 
		SuspendDistance = 0 
		lod_dist1 = 400 
		lod_dist2 = 401 
		EmitRate = 12.00000000000 
		Lifetime = 0.25000000000 
		MidPointPCT = 50 
		StartRadius = 20.00000000000 
		MidRadius = 10.00000000000 
		EndRadius = 1.00000000000 
		StartRadiusSpread = 5.00000000000 
		MidRadiusSpread = 5.00000000000 
		EndRadiusSpread = 5.00000000000 
		StartRGB = [ 191 , 250 , 255 ] 
		StartAlpha = 95 
		EndRGB = [ 103 , 139 , 255 ] 
		EndAlpha = 0 
	} 
	{ 
		Pos = VECTOR(-1120.89355468750, -56.26629257202, -867.07873535156) 
		Angles = VECTOR(0.00000000000, 0.15309999883, 0.00000000000) 
		Name = TB_WH_Sprinklerhead_06 
		Class = LevelGeometry 
		CreatedAtStart 
		CollisionMode = Geometry 
	} 
	{ 
		Pos = VECTOR(-316.61663818359, 337.89181518555, 365.20495605469) 
		Angles = VECTOR(0.00000000000, 0.18451799452, 0.00000000000) 
		Name = TB_Beam_Upper_02_grime 
		Class = LevelGeometry 
		CreatedAtStart 
		CollisionMode = Geometry 
	} 
	{ 
		Pos = VECTOR(84.13894653320, -2.19390392303, -320.63262939453) 
		Angles = VECTOR(0.00000000000, 0.19493399560, 0.00000000000) 
		Name = ATM_SmokeA01 
		Class = ParticleObject 
		Type = Default 
		BoxDimsStart = VECTOR(25.41799926758, 25.41799926758, 25.41799926758) 
		MidPosition = VECTOR(77.10942077637, 57.99119567871, -321.26647949219) 
		BoxDimsMid = VECTOR(39.35069274902, 39.35069274902, 39.35069274902) 
		EndPosition = VECTOR(60.06177902222, 195.80842590332, -324.23171997070) 
		BoxDimsEnd = VECTOR(77.16815185547, 77.16815185547, 77.16815185547) 
		Texture = ru_tb_puff_01 
		AbsentInNetGames 
		UseMidPoint 
		UseColorMidTime 
		Type = NEWFLAT 
		BlendMode = Blend 
		FixedAlpha = 128 
		AlphaCutoff = 1 
		MaxStreams = 2 
		SuspendDistance = 0 
		lod_dist1 = 400 
		lod_dist2 = 401 
		EmitRate = 6.00000000000 
		Lifetime = 20.00000000000 
		MidPointPCT = 50 
		StartRadius = 30.00000000000 
		MidRadius = 40.00000000000 
		EndRadius = 50.00000000000 
		StartRadiusSpread = 0.00000000000 
		MidRadiusSpread = 0.00000000000 
		EndRadiusSpread = 0.00000000000 
		StartRGB = [ 71 , 63 , 56 ] 
		StartAlpha = 0 
		ColorMidTime = 13 
		MidRGB = [ 60 , 49 , 47 ] 
		MidAlpha = 71 
		EndRGB = [ 0 , 0 , 0 ] 
		EndAlpha = 0 
	} 
	{ 
		Pos = VECTOR(198.08584594727, 124.75039672852, 241.59852600098) 
		Angles = VECTOR(0.00000000000, 0.14808799326, 0.00000000000) 
		Name = ParticleBox_10 
		Class = ParticleObject 
		Type = Default 
		BoxDimsStart = VECTOR(8.16381931305, 4.33375692368, 8.16381931305) 
		MidPosition = VECTOR(167.57351684570, 187.32073974609, 240.25790405273) 
		BoxDimsMid = VECTOR(59.50305175781, 37.19781875610, 59.50305175781) 
		EndPosition = VECTOR(89.45681762695, 326.40026855469, 191.91758728027) 
		BoxDimsEnd = VECTOR(181.99858093262, 105.53264617920, 181.99858093262) 
		Texture = apm_spray_01 
		CreatedAtStart 
		AbsentInNetGames 
		UseMidPoint 
		UseColorMidTime 
		Type = NEWFLAT 
		BlendMode = Blend 
		FixedAlpha = 128 
		AlphaCutoff = 0 
		MaxStreams = 1 
		SuspendDistance = 800 
		lod_dist1 = 400 
		lod_dist2 = 800 
		EmitRate = 4.00000000000 
		Lifetime = 5.00000000000 
		MidPointPCT = 50 
		StartRadius = 5.00000000000 
		MidRadius = 75.00000000000 
		EndRadius = 150.00000000000 
		StartRadiusSpread = 50.00000000000 
		MidRadiusSpread = 0.00000000000 
		EndRadiusSpread = 30.00000000000 
		StartRGB = [ 78 , 67 , 52 ] 
		StartAlpha = 10 
		ColorMidTime = 21 
		MidRGB = [ 33 , 26 , 19 ] 
		MidAlpha = 31 
		EndRGB = [ 0 , 0 , 0 ] 
		EndAlpha = 0 
	} 
	{ 
		Pos = VECTOR(-485.02935791016, 39.23234939575, -531.73364257812) 
		Angles = VECTOR(0.00000000000, 0.12638799846, 0.00000000000) 
		Name = SkWare_Dark_Wall01 
		Class = LevelGeometry 
		CreatedAtStart 
		CollisionMode = Geometry 
	} 
	{ 
		Pos = VECTOR(-509.44104003906, -316.56204223633, -662.54748535156) 
		Angles = VECTOR(0.00000000000, 0.12638799846, 0.00000000000) 
		Name = SkWare_Dark_Floor06 
		Class = LevelGeometry 
		CreatedAtStart 
		CollisionMode = Geometry 
	} 
	{ 
		Pos = VECTOR(-5308.51757812500, 0.00000000000, -1806.27954101562) 
		Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		Name = Plane01 
		Class = LevelGeometry 
		CreatedAtStart 
		CollisionMode = Geometry 
	} 
	{ 
		Pos = VECTOR(79.05760955811, 49.45666122437, -443.04528808594) 
		Angles = VECTOR(-0.22013300657, 0.18897700310, 0.00189800002) 
		Name = TB_Ware_Graffiti_03 
		Class = LevelGeometry 
		CreatedAtStart 
		CollisionMode = Geometry 
	} 
	{ 
		Pos = VECTOR(-870.76495361328, 107.76268005371, 306.59176635742) 
		Angles = VECTOR(2.96091699600, -0.18071599305, -3.10955095291) 
		Name = TB_Ware_Graffiti_04 
		Class = LevelGeometry 
		CreatedAtStart 
		CollisionMode = Geometry 
	} 
	{ 
		Pos = VECTOR(-837.95385742188, 107.76268005371, 296.01080322266) 
		Angles = VECTOR(2.96091699600, -0.18071599305, -3.10955095291) 
		Name = TB_Ware_Graffiti_05 
		Class = LevelGeometry 
		CreatedAtStart 
		CollisionMode = Geometry 
	} 
	{ 
		Pos = VECTOR(-662.59466552734, -65.91798400879, 67.21861267090) 
		Angles = VECTOR(3.03672003746, 1.17336404324, 1.33448994160) 
		Name = TB_WH_Floor_Oilstains_03 
		Class = LevelGeometry 
		CreatedAtStart 
		CollisionMode = Geometry 
	} 
	{ 
		Pos = VECTOR(-1015.94598388672, -53.95708847046, -432.64282226562) 
		Angles = VECTOR(0.00000000000, 0.12638799846, 0.00000000000) 
		Name = SkWare_Dark_Wall05 
		Class = LevelGeometry 
		CreatedAtStart 
		CollisionMode = Geometry 
	} 
	{ 
		Pos = VECTOR(-485.02935791016, 39.23234939575, -531.73364257812) 
		Angles = VECTOR(0.00000000000, 0.12638799846, 0.00000000000) 
		Name = SkWare_Dark_Wall02 
		Class = LevelGeometry 
		CreatedAtStart 
		CollisionMode = Geometry 
	} 
	{ 
		Pos = VECTOR(-743.29992675781, 25.83911132812, -1016.15240478516) 
		Angles = VECTOR(-0.23765200377, 0.38956400752, -0.00137700001) 
		Name = TB_Ware_Graffiti_06 
		Class = LevelGeometry 
		CreatedAtStart 
		CollisionMode = Geometry 
	} 
] 
SCRIPT LoadAllParticleTextures 
	LoadParticleTexture "particles\\apm_spark_01" 
	LoadParticleTexture "particles\\ru_tb_puff_01" 
	LoadParticleTexture "particles\\apm_spray_01" 
ENDSCRIPT

SCRIPT TRGP_shadowtriggerScript 
	Obj_MoveToNode Name = TRG_Playerrestart Orient NoReset 
	ShadowSkaterOptionsTricks 
ENDSCRIPT

SCRIPT TB_Electrical_Upper_02Script 
	TR_Electrical_Smash 
ENDSCRIPT

SCRIPT LoadTerrain 
	LoadTerrainSounds terrain = TERRAIN_DEFAULT 
ENDSCRIPT

SCRIPT load_level_anims 
	animload_THPS6_FrontEnd 
ENDSCRIPT

SCRIPT LoadCameras 
	LoadAsset "levels\\mainmenu\\mainmenu_camera.ska" desc = mainmenu_camera 
	LoadAsset "levels\\mainmenu\\mainmenu_camera02.ska" desc = mainmenu_camera02 
	LoadAsset "levels\\mainmenu\\mainmenu_camera03.ska" desc = mainmenu_camera03 
	LoadAsset "levels\\mainmenu\\skater_select_cam.ska" desc = skater_select_cam 
	LoadAsset "levels\\mainmenu\\skater_select_cam01.ska" desc = skater_select_cam01 
	LoadAsset "levels\\mainmenu\\skater_select_cam02.ska" desc = skater_select_cam02 
	LoadAsset "levels\\mainmenu\\stationary_skater_cam.ska" desc = stationary_skater_cam 
	LoadAsset "levels\\mainmenu\\test_cam.ska" desc = test_cam 
	LoadAsset "levels\\mainmenu\\CAGR_cam1.ska" desc = CAGR_cam1 
	LoadAsset "levels\\mainmenu\\level_select_cam.ska" desc = level_select_cam 
ENDSCRIPT

SCRIPT LoadObjectAnims 
ENDSCRIPT


