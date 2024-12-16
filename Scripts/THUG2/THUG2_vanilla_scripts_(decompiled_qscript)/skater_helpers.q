
SCRIPT refresh_skater_model 
	GetCurrentSkaterProfileIndex 
	IF LevelIs Load_MainMenu 
		<skaterIndex> = 0 
	ELSE 
		<skaterIndex> = <currentSkaterProfileIndex> 
	ENDIF 
	RefreshSkaterModel profile = <currentSkaterProfileIndex> skater = <skaterIndex> 
	RefreshSkaterScale profile = <currentSkaterProfileIndex> skater = <skaterIndex> 
	RefreshSkaterVisibility profile = <currentSkaterProfileIndex> skater = <skaterIndex> 
ENDSCRIPT

SCRIPT refresh_skater_model_for_cheats 
	<refresh_both_skaters> = 0 
	IF InSplitScreenGame 
		<refresh_both_skaters> = 1 
		IF LevelIs Load_MainMenu 
			<refresh_both_skaters> = 0 
		ENDIF 
	ENDIF 
	IF ( <refresh_both_skaters> = 1 ) 
		RefreshSkaterScale profile = 0 skater = 0 
		RefreshSkaterVisibility profile = 0 skater = 0 
		RefreshSkaterScale profile = 1 skater = 1 
		RefreshSkaterVisibility profile = 1 skater = 1 
	ELSE 
		GetCurrentSkaterProfileIndex 
		IF LevelIs Load_MainMenu 
			<skaterIndex> = 0 
		ELSE 
			<skaterIndex> = <currentSkaterProfileIndex> 
		ENDIF 
		RefreshSkaterScale profile = <currentSkaterProfileIndex> skater = <skaterIndex> 
		RefreshSkaterVisibility profile = <currentSkaterProfileIndex> skater = <skaterIndex> 
	ENDIF 
ENDSCRIPT

SCRIPT load_pro_skater 
	SelectCurrentSkater name = <name> 
	IF ( ( LevelIs load_cas ) | ( LevelIs Load_MainMenu ) ) 
		skater : SwitchOffBoard 
		no_board = no_board 
	ENDIF 
	GetCurrentSkaterProfileIndex 
	RefreshSkaterModel profile = <currentSkaterProfileIndex> skater = 0 no_board = <no_board> 
	IF ( <currentSkaterProfileIndex> = 0 ) 
		UpdateTrickMappings skater = <currentSkaterProfileIndex> 
	ENDIF 
	GetSkaterProfileInfo player = <currentSkaterProfileIndex> 
	set_correct_graffiti_textures <...> 
ENDSCRIPT

SCRIPT set_correct_graffiti_textures 
	IF NOT GotParam name 
		script_assert "no name specified" 
	ENDIF 
	GetCurrentSkaterProfileIndex 
	IF NOT ( <currentSkaterProfileIndex> = 0 ) 
		RETURN 
	ENDIF 
	GetSkaterID skater = <currentSkaterProfileIndex> 
	IF ( <name> = custom ) 
		IF <objID> : HasCustomTagTexture 
			<objID> : ApplyCustomTagTexture 
		ELSE 
			<objID> : SetGraffitiTexture <tag_texture> 
		ENDIF 
	ELSE 
		<objID> : SetGraffitiTexture <tag_texture> 
	ENDIF 
	IF NOT GotParam sticker_texture 
		<sticker_texture> = sticker 
	ENDIF 
	<objID> : SetStickerTexture <sticker_texture> 
ENDSCRIPT

SCRIPT scalingmenu_get_xyz 
	GetCurrentSkaterProfileIndex 
	GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = <part> 
	IF NOT GotParam use_default_scale 
		<use_default_scale> = 1 
	ENDIF 
	IF NOT GotParam x 
		<x> = 100 
	ENDIF 
	IF NOT GotParam y 
		<y> = 100 
	ENDIF 
	IF NOT GotParam z 
		<z> = 100 
	ENDIF 
	IF ( <use_default_scale> = 1 ) 
		<x> = 100 
		<y> = 100 
		<z> = 100 
	ENDIF 
	RETURN x = <x> y = <y> z = <z> 
ENDSCRIPT

EG_in_create_a_graphic = 0 
EG_TEST_GRAFFITI_AS_SPRITE = 0 
edit_graphic_layer_infos = [ 
	{ 
		texture_id = odd_1 
		texture_name = "odd_1" 
		string = "" 
		canvas_id = none 
		font_id = 0 
		pos_x = 32 
		pos_y = 32 
		rot = 0 
		scale = 0.92000001669 
		flip_h = 0 
		flip_v = 0 
		hsva = [ 0 , 90 , 23 , 128 ] 
		layer_id = 0 
	} 
	{ 
		texture_id = grap_76 
		texture_name = "grap_76" 
		string = "" 
		canvas_id = none 
		font_id = 0 
		pos_x = 45 
		pos_y = 29 
		rot = 351.86999511719 
		scale = 0.94999998808 
		flip_h = 0 
		flip_v = 0 
		hsva = [ 0 , 0 , 60 , 128 ] 
		layer_id = 1 
	} 
	{ 
		texture_id = grap_76 
		texture_name = "grap_76" 
		string = "" 
		canvas_id = none 
		font_id = 0 
		pos_x = 22 
		pos_y = 40 
		rot = 181.72500610352 
		scale = 0.80599999428 
		flip_h = 0 
		flip_v = 0 
		hsva = [ 0 , 0 , 60 , 128 ] 
		layer_id = 2 
	} 
	{ 
		texture_id = ill_30 
		texture_name = "ill_30" 
		string = "" 
		canvas_id = none 
		font_id = 0 
		pos_x = 32 
		pos_y = 34 
		rot = 18.58399963379 
		scale = 0.86699998379 
		flip_h = 0 
		flip_v = 0 
		hsva = [ 0 , 0 , 0 , 128 ] 
		layer_id = 6 
	} 
	{ 
		texture_id = grap_82 
		texture_name = "grap_82" 
		string = "" 
		canvas_id = none 
		font_id = 0 
		pos_x = 16 
		pos_y = 16 
		rot = 331.33801269531 
		scale = 0.47799998522 
		flip_h = 0 
		flip_v = 0 
		hsva = [ 0 , 0 , 60 , 128 ] 
		layer_id = 9 
	} 
	{ 
		texture_id = odd_15 
		texture_name = "odd_15" 
		string = "" 
		canvas_id = none 
		font_id = 0 
		pos_x = 36 
		pos_y = 30 
		rot = 35.00000000000 
		scale = 0.72600001097 
		flip_h = 0 
		flip_v = 0 
		hsva = [ 30 , 90 , 60 , 92 ] 
		layer_id = 3 
	} 
	{ 
		texture_id = ill_30 
		texture_name = "ill_30" 
		string = "" 
		canvas_id = none 
		font_id = 0 
		pos_x = 32 
		pos_y = 33 
		rot = 18.58399963379 
		scale = 0.81199997663 
		flip_h = 0 
		flip_v = 0 
		hsva = [ 0 , 0 , 60 , 128 ] 
		layer_id = 7 
	} 
	{ 
		texture_id = none 
		texture_name = "" 
		string = "" 
		canvas_id = none 
		font_id = 0 
		pos_x = 32 
		pos_y = 32 
		rot = 0 
		scale = 1 
		flip_h = 0 
		flip_v = 0 
		hsva = [ 0 , 0 , 60 , 128 ] 
		layer_id = 4 
	} 
	{ 
		texture_id = odd_16 
		texture_name = "odd_16" 
		string = "" 
		canvas_id = none 
		font_id = 0 
		pos_x = 43 
		pos_y = 49 
		rot = 349.22100830078 
		scale = 0.69199997187 
		flip_h = 0 
		flip_v = 0 
		hsva = [ 180 , 90 , 28 , 128 ] 
		layer_id = 5 
	} 
	{ 
		texture_id = ill_17 
		texture_name = "ill_17" 
		string = "" 
		canvas_id = none 
		font_id = 0 
		pos_x = 50 
		pos_y = 47 
		rot = 354.90798950195 
		scale = 0.48800000548 
		flip_h = 1 
		flip_v = 0 
		hsva = [ 30 , 57 , 60 , 128 ] 
		layer_id = 8 
	} 
] 
layer_infos_need_resetting = 0 
edit_graphic_layer_infos_copy = [ 
	{ 
		texture_id = odd_1 
		texture_name = "odd_1" 
		string = "" 
		canvas_id = none 
		font_id = 0 
		pos_x = 32 
		pos_y = 32 
		rot = 0 
		scale = 0.92000001669 
		flip_h = 0 
		flip_v = 0 
		hsva = [ 0 , 90 , 23 , 128 ] 
		layer_id = 0 
	} 
	{ 
		texture_id = grap_76 
		texture_name = "grap_76" 
		string = "" 
		canvas_id = none 
		font_id = 0 
		pos_x = 45 
		pos_y = 29 
		rot = 351.86999511719 
		scale = 0.94999998808 
		flip_h = 0 
		flip_v = 0 
		hsva = [ 0 , 0 , 60 , 128 ] 
		layer_id = 1 
	} 
	{ 
		texture_id = grap_76 
		texture_name = "grap_76" 
		string = "" 
		canvas_id = none 
		font_id = 0 
		pos_x = 22 
		pos_y = 40 
		rot = 181.72500610352 
		scale = 0.80599999428 
		flip_h = 0 
		flip_v = 0 
		hsva = [ 0 , 0 , 60 , 128 ] 
		layer_id = 2 
	} 
	{ 
		texture_id = ill_30 
		texture_name = "ill_30" 
		string = "" 
		canvas_id = none 
		font_id = 0 
		pos_x = 32 
		pos_y = 34 
		rot = 18.58399963379 
		scale = 0.86699998379 
		flip_h = 0 
		flip_v = 0 
		hsva = [ 0 , 0 , 0 , 128 ] 
		layer_id = 6 
	} 
	{ 
		texture_id = grap_82 
		texture_name = "grap_82" 
		string = "" 
		canvas_id = none 
		font_id = 0 
		pos_x = 16 
		pos_y = 16 
		rot = 331.33801269531 
		scale = 0.47799998522 
		flip_h = 0 
		flip_v = 0 
		hsva = [ 0 , 0 , 60 , 128 ] 
		layer_id = 9 
	} 
	{ 
		texture_id = odd_15 
		texture_name = "odd_15" 
		string = "" 
		canvas_id = none 
		font_id = 0 
		pos_x = 36 
		pos_y = 30 
		rot = 35.00000000000 
		scale = 0.72600001097 
		flip_h = 0 
		flip_v = 0 
		hsva = [ 30 , 90 , 60 , 92 ] 
		layer_id = 3 
	} 
	{ 
		texture_id = ill_30 
		texture_name = "ill_30" 
		string = "" 
		canvas_id = none 
		font_id = 0 
		pos_x = 32 
		pos_y = 33 
		rot = 18.58399963379 
		scale = 0.81199997663 
		flip_h = 0 
		flip_v = 0 
		hsva = [ 0 , 0 , 60 , 128 ] 
		layer_id = 7 
	} 
	{ 
		texture_id = none 
		texture_name = "" 
		string = "" 
		canvas_id = none 
		font_id = 0 
		pos_x = 32 
		pos_y = 32 
		rot = 0 
		scale = 1 
		flip_h = 0 
		flip_v = 0 
		hsva = [ 0 , 0 , 60 , 128 ] 
		layer_id = 4 
	} 
	{ 
		texture_id = odd_16 
		texture_name = "odd_16" 
		string = "" 
		canvas_id = none 
		font_id = 0 
		pos_x = 43 
		pos_y = 49 
		rot = 349.22100830078 
		scale = 0.69199997187 
		flip_h = 0 
		flip_v = 0 
		hsva = [ 180 , 90 , 28 , 128 ] 
		layer_id = 5 
	} 
	{ 
		texture_id = ill_17 
		texture_name = "ill_17" 
		string = "" 
		canvas_id = none 
		font_id = 0 
		pos_x = 50 
		pos_y = 47 
		rot = 354.90798950195 
		scale = 0.48800000548 
		flip_h = 1 
		flip_v = 0 
		hsva = [ 30 , 57 , 60 , 128 ] 
		layer_id = 8 
	} 
] 

