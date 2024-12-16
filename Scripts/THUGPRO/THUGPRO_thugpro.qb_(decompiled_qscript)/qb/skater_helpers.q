
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
	GetCurrentSkaterProfileIndex 
	skaterselect_handle_skater_profile_stuff <...> 
	RefreshSkaterModel profile = <currentSkaterProfileIndex> skater = 0 no_board = <no_board> 
	IF ( <currentSkaterProfileIndex> = 0 ) 
		UpdateTrickMappings skater = <currentSkaterProfileIndex> 
	ENDIF 
	GetSkaterProfileInfo player = <currentSkaterProfileIndex> 
	set_correct_graffiti_textures <...> 
ENDSCRIPT

banned_sticker_textures = [ "thugpro/sticker_invisible" "thugpro/logo_thugpro" "thugpro/stickers/logo_thugpro" "thugpro/stickers/sticker_mjay" "thugpro/stickers/sticker_nug" "thugpro/stickers/sticker_nuggod" "thugpro/stickers/tags_ng" "thugpro/stickers/tags_phun" ] 
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
		IF NOT GotParam tag_texture 
			<tag_texture> = "Tags/cas_01" 
		ENDIF 
		IF ArrayContains array = banned_sticker_textures contains = <tag_texture> 
			<tag_texture> = "Tags/cas_01" 
			printf "Woah! You can\'t use that tag texture.." 
		ENDIF 
		<objID> : SetGraffitiTexture <tag_texture> 
	ELSE 
		<objID> : SetGraffitiTexture <tag_texture> 
	ENDIF 
	IF NOT GotParam sticker_texture 
		<sticker_texture> = "thugpro/stickers/sticker_thugpro" 
	ELSE 
		IF ArrayContains array = banned_sticker_textures contains = <sticker_texture> 
			<sticker_texture> = "thugpro/stickers/sticker_thugpro" 
			printf "Woah! You can\'t use that sticker..." 
		ENDIF 
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
EG_TEST_GRAFFITI_AS_SPRITE = 1 
layer_infos_need_resetting = 0 
EG_creating_premade = 0 
EG_premade_key_color = [ 60 , 60 , 60 , 128 ] 
EG_selected_text_color = [ 128 , 128 , 128 , 128 ] 
EG_unselected_text_color = [ 64 , 64 , 64 , 128 ] 
EG_unselectable_text_color = [ 64 , 64 , 64 , 64 ] 
EG_selected_title_color = [ 40 , 40 , 110 , 128 ] 
EG_unselected_title_color = [ 0 , 0 , 80 , 128 ] 
EG_selected_background_color = [ 16 , 16 , 16 , 128 ] 
EG_unselected_background_color = [ 64 , 64 , 64 , 128 ] 
EG_inuse_background_color = [ 32 , 32 , 32 , 128 ] 
EG_unselected_image_color = [ 64 , 64 , 64 , 128 ] 
EG_selected_image_color = [ 128 , 128 , 128 , 128 ] 
EG_image_background_color = [ 32 , 32 , 32 , 128 ] 
EG_current_layer_menu_index = 0 
EG_current_layer_info_index = 0 
EG_thumb_scale = PAIR(0.32499998808, 0.32499998808) 
EG_thumb_pos = PAIR(47.00000000000, 2.00000000000) 
EG_canvas_scale_factor = 2.87500000000 
EG_canvas_pos_factor = 2.87500000000 
EG_canvas_base_z = 0 
EG_color_swatch_values = [ 
	[ 128 , 128 , 128 , 128 ] 
	[ 128 , 0 , 0 , 128 ] 
	[ 128 , 64 , 0 , 128 ] 
	[ 128 , 128 , 0 , 128 ] 
	[ 0 , 128 , 0 , 128 ] 
	[ 0 , 0 , 128 , 128 ] 
	[ 80 , 0 , 128 , 128 ] 
	[ 128 , 0 , 80 , 128 ] 
	[ 0 , 0 , 0 , 128 ] 
	[ 50 , 0 , 0 , 128 ] 
	[ 45 , 22 , 10 , 128 ] 
	[ 0 , 50 , 0 , 128 ] 
	[ 0 , 128 , 128 , 128 ] 
	[ 0 , 60 , 60 , 128 ] 
	[ 0 , 0 , 50 , 128 ] 
	[ 50 , 0 , 50 , 128 ] 
] 
EG_font_names = [ 
	{ 
		name = "graf1" 
		spacing = 1 
	} 
	{ 
		name = "graf2" 
		spacing = 0.80000001192 
	} 
	{ 
		name = "bold1" 
		spacing = 0.64999997616 
	} 
	{ 
		name = "block1" 
		spacing = 0.85000002384 
	} 
	{ 
		name = "ns1" 
		spacing = 0.81999999285 
	} 
	{ 
		name = "sten1" 
		spacing = 0.64999997616 
	} 
	{ 
		name = "spr1" 
		spacing = 0.80000001192 
	} 
	{ 
		name = "threed" 
		spacing = 0.44999998808 
	} 
] 
SCRIPT edit_graphic_set_layer_infos 
	<index> = 0 
	BEGIN 
		IF NOT ( ( <layer_infos> [ <index> ] . texture_name ) = "" ) 
			FormatText checksumname = texture_id "%t" t = ( <layer_infos> [ <index> ] . texture_name ) 
		ELSE 
			<texture_id> = none 
		ENDIF 
		edit_graphic_change_layer_info_value { 
			use_current = 0 
			index = <index> 
			change_texture_id = <texture_id> 
			change_texture_name = ( <layer_infos> [ <index> ] . texture_name ) 
			change_string = ( <layer_infos> [ <index> ] . string ) 
			change_font_id = ( <layer_infos> [ <index> ] . font_id ) 
			change_pos_x = ( <layer_infos> [ <index> ] . pos_x ) 
			change_pos_y = ( <layer_infos> [ <index> ] . pos_y ) 
			change_rot = ( <layer_infos> [ <index> ] . rot ) 
			change_scale = ( <layer_infos> [ <index> ] . scale ) 
			change_flip_h = ( <layer_infos> [ <index> ] . flip_h ) 
			change_flip_v = ( <layer_infos> [ <index> ] . flip_v ) 
			change_h = ( <layer_infos> [ <index> ] . hsva [ 0 ] ) 
			change_s = ( <layer_infos> [ <index> ] . hsva [ 1 ] ) 
			change_v = ( <layer_infos> [ <index> ] . hsva [ 2 ] ) 
			change_a = ( <layer_infos> [ <index> ] . hsva [ 3 ] ) 
			change_layer_id = ( <layer_infos> [ <index> ] . layer_id ) 
		} 
		<index> = ( <index> + 1 ) 
	REPEAT 10 
ENDSCRIPT

SCRIPT custom_graffiti_texture_test 
	CopyTexture src = cas_texture_from_profile new = dummy2 
	CreateTexture { 
		%0x43% 
		Width = 128 
		Height = 128 
		BitDepth = 32 
		%0x51533ecb% = 8 
	} 
	GetCurrentSkaterProfileIndex 
ENDSCRIPT

edit_graphics_backgrounds = [ 
	"CAGR/Backgrounds/bg_1" 
	"CAGR/Backgrounds/bg_10" 
	"CAGR/Backgrounds/bg_11" 
	"CAGR/Backgrounds/bg_12" 
	"CAGR/Backgrounds/bg_13" 
	"CAGR/Backgrounds/bg_14" 
	"CAGR/Backgrounds/bg_15" 
	"CAGR/Backgrounds/bg_16" 
	"CAGR/Backgrounds/bg_17" 
	"CAGR/Backgrounds/bg_18" 
	"CAGR/Backgrounds/bg_19" 
	"CAGR/Backgrounds/bg_2" 
	"CAGR/Backgrounds/bg_20" 
	"CAGR/Backgrounds/bg_21" 
	"CAGR/Backgrounds/bg_22" 
	"CAGR/Backgrounds/bg_23" 
	"CAGR/Backgrounds/bg_24" 
	"CAGR/Backgrounds/bg_25" 
	"CAGR/Backgrounds/bg_26" 
	"CAGR/Backgrounds/bg_27" 
	"CAGR/Backgrounds/bg_28" 
	"CAGR/Backgrounds/bg_29" 
	"CAGR/Backgrounds/bg_3" 
	"CAGR/Backgrounds/bg_30" 
	"CAGR/Backgrounds/bg_31" 
	"CAGR/Backgrounds/bg_4" 
	"CAGR/Backgrounds/bg_5" 
	"CAGR/Backgrounds/bg_6" 
	"CAGR/Backgrounds/bg_7" 
	"CAGR/Backgrounds/bg_8" 
	"CAGR/Backgrounds/bg_9" 
] 
edit_graphic_layer_infos = [ 
	{ 
		texture_id = bg_30 
		texture_name = "bg_30" 
		string = "" 
		canvas_id = none 
		font_id = 0 
		pos_x = 32 
		pos_y = 32 
		rot = 0 
		scale = 1.00000000000 
		flip_h = 0 
		flip_v = 0 
		hsva = [ 0 , 90 , 23 , 128 ] 
		layer_id = 0 
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
		scale = 1.00000000000 
		flip_h = 0 
		flip_v = 0 
		hsva = [ 0 , 0 , 60 , 128 ] 
		layer_id = 1 
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
		scale = 1.00000000000 
		flip_h = 0 
		flip_v = 0 
		hsva = [ 0 , 0 , 60 , 128 ] 
		layer_id = 2 
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
		scale = 1.00000000000 
		flip_h = 0 
		flip_v = 0 
		hsva = [ 0 , 0 , 60 , 128 ] 
		layer_id = 6 
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
		scale = 1.00000000000 
		flip_h = 0 
		flip_v = 0 
		hsva = [ 0 , 0 , 60 , 128 ] 
		layer_id = 9 
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
		scale = 1.00000000000 
		flip_h = 0 
		flip_v = 0 
		hsva = [ 0 , 0 , 60 , 128 ] 
		layer_id = 3 
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
		scale = 1.00000000000 
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
		scale = 1.00000000000 
		flip_h = 0 
		flip_v = 0 
		hsva = [ 0 , 0 , 60 , 128 ] 
		layer_id = 4 
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
		scale = 1.00000000000 
		flip_h = 0 
		flip_v = 0 
		hsva = [ 0 , 0 , 60 , 128 ] 
		layer_id = 5 
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
		scale = 1.00000000000 
		flip_h = 0 
		flip_v = 0 
		hsva = [ 0 , 0 , 60 , 128 ] 
		layer_id = 8 
	} 
] 
edit_graphic_layer_infos_copy = [ 
	{ 
		texture_id = none 
		texture_name = "" 
		string = "" 
		canvas_id = none 
		font_id = 0 
		pos_x = 32 
		pos_y = 32 
		rot = 0 
		scale = 1.00000000000 
		flip_h = 0 
		flip_v = 0 
		hsva = [ 0 , 0 , 60 , 128 ] 
		layer_id = 0 
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
		scale = 1.00000000000 
		flip_h = 0 
		flip_v = 0 
		hsva = [ 0 , 0 , 60 , 128 ] 
		layer_id = 1 
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
		scale = 1.00000000000 
		flip_h = 0 
		flip_v = 0 
		hsva = [ 0 , 0 , 60 , 128 ] 
		layer_id = 2 
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
		scale = 1.00000000000 
		flip_h = 0 
		flip_v = 0 
		hsva = [ 0 , 0 , 60 , 128 ] 
		layer_id = 6 
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
		scale = 1.00000000000 
		flip_h = 0 
		flip_v = 0 
		hsva = [ 0 , 0 , 60 , 128 ] 
		layer_id = 9 
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
		scale = 1.00000000000 
		flip_h = 0 
		flip_v = 0 
		hsva = [ 0 , 0 , 60 , 128 ] 
		layer_id = 3 
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
		scale = 1.00000000000 
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
		scale = 1.00000000000 
		flip_h = 0 
		flip_v = 0 
		hsva = [ 0 , 0 , 60 , 128 ] 
		layer_id = 4 
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
		scale = 1.00000000000 
		flip_h = 0 
		flip_v = 0 
		hsva = [ 0 , 0 , 60 , 128 ] 
		layer_id = 5 
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
		scale = 1.00000000000 
		flip_h = 0 
		flip_v = 0 
		hsva = [ 0 , 0 , 60 , 128 ] 
		layer_id = 8 
	} 
] 
thugpro_layer_infos = [ 
	{ 
		texture_id = bg_30 
		texture_name = "bg_30" 
		string = "" 
		canvas_id = none 
		font_id = 0 
		pos_x = 32 
		pos_y = 32 
		rot = 0 
		scale = 1.00000000000 
		flip_h = 0 
		flip_v = 0 
		hsva = [ 0 , 0 , 60 , 128 ] 
		layer_id = 0 
	} 
	{ 
		texture_id = bg_30 
		texture_name = "bg_30" 
		string = "" 
		canvas_id = none 
		font_id = 0 
		pos_x = 32 
		pos_y = 32 
		rot = 0 
		scale = 1.00000000000 
		flip_h = 0 
		flip_v = 0 
		hsva = [ 0 , 0 , 60 , 128 ] 
		layer_id = 1 
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
		scale = 1.00000000000 
		flip_h = 0 
		flip_v = 0 
		hsva = [ 0 , 0 , 60 , 128 ] 
		layer_id = 2 
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
		scale = 1.00000000000 
		flip_h = 0 
		flip_v = 0 
		hsva = [ 0 , 0 , 60 , 128 ] 
		layer_id = 6 
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
		scale = 1.00000000000 
		flip_h = 0 
		flip_v = 0 
		hsva = [ 0 , 0 , 60 , 128 ] 
		layer_id = 9 
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
		scale = 1.00000000000 
		flip_h = 0 
		flip_v = 0 
		hsva = [ 0 , 0 , 60 , 128 ] 
		layer_id = 3 
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
		scale = 1.00000000000 
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
		scale = 1.00000000000 
		flip_h = 0 
		flip_v = 0 
		hsva = [ 0 , 0 , 60 , 128 ] 
		layer_id = 4 
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
		scale = 1.00000000000 
		flip_h = 0 
		flip_v = 0 
		hsva = [ 0 , 0 , 60 , 128 ] 
		layer_id = 5 
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
		scale = 1.00000000000 
		flip_h = 0 
		flip_v = 0 
		hsva = [ 0 , 0 , 60 , 128 ] 
		layer_id = 8 
	} 
] 
SCRIPT edit_graphic_change_layer_info_value use_current = 1 
	<tmpArray> = edit_graphic_layer_infos 
	IF ( <use_current> = 1 ) 
		<info_index> = EG_current_layer_info_index 
	ELSE 
		<info_index> = <index> 
	ENDIF 
	edit_graphic_get_array_info_vals index = <info_index> 
	IF ( GotParam change_texture_id ) 
		<texture_id> = <change_texture_id> 
	ENDIF 
	IF ( GotParam change_texture_name ) 
		<texture_name> = <change_texture_name> 
	ENDIF 
	IF ( GotParam change_string ) 
		<string> = <change_string> 
	ENDIF 
	IF ( GotParam change_font_id ) 
		<font_id> = <change_font_id> 
	ENDIF 
	IF ( GotParam change_canvas_id ) 
		<canvas_id> = <change_canvas_id> 
	ENDIF 
	IF ( GotParam change_pos_x ) 
		<pos_x> = <change_pos_x> 
	ENDIF 
	IF ( GotParam change_pos_y ) 
		<pos_y> = <change_pos_y> 
	ENDIF 
	IF ( GotParam change_rot ) 
		<rot> = <change_rot> 
	ENDIF 
	IF ( GotParam change_scale ) 
		<scale> = <change_scale> 
	ENDIF 
	IF ( GotParam change_flip_h ) 
		<flip_h> = <change_flip_h> 
	ENDIF 
	IF ( GotParam change_flip_v ) 
		<flip_v> = <change_flip_v> 
	ENDIF 
	IF ( GotParam change_h ) 
		SetArrayElement arrayname = hsva index = 0 newvalue = <change_h> 
	ENDIF 
	IF ( GotParam change_s ) 
		SetArrayElement arrayname = hsva index = 1 newvalue = <change_s> 
	ENDIF 
	IF ( GotParam change_v ) 
		SetArrayElement arrayname = hsva index = 2 newvalue = <change_v> 
	ENDIF 
	IF ( GotParam change_a ) 
		SetArrayElement arrayname = hsva index = 3 newvalue = <change_a> 
	ENDIF 
	IF ( GotParam change_layer_id ) 
		<layer_id> = <change_layer_id> 
	ENDIF 
	SetArrayElement { 
		arrayname = tmpArray 
		index = <info_index> 
		newvalue = { 
			texture_id = <texture_id> 
			texture_name = <texture_name> 
			string = <string> 
			canvas_id = <canvas_id> 
			font_id = <font_id> 
			pos_x = <pos_x> 
			pos_y = <pos_y> 
			rot = <rot> 
			scale = <scale> 
			flip_h = <flip_h> 
			flip_v = <flip_v> 
			hsva = <hsva> 
			layer_id = <layer_id> 
		} 
	} 
ENDSCRIPT

SCRIPT edit_graphic_get_array_info_vals 
	RETURN ( edit_graphic_layer_infos [ <index> ] ) 
ENDSCRIPT

SCRIPT edit_graphic_prepare_sprite_infos 
	<sprite_infos> = [ ] 
	<index> = 0 
	BEGIN 
		<layer_info_index> = 0 
		BEGIN 
			IF ( ( edit_graphic_layer_infos [ <layer_info_index> ] . layer_id ) = <index> ) 
				BREAK 
			ENDIF 
			<layer_info_index> = ( <layer_info_index> + 1 ) 
		REPEAT 10 
		IF ( ( edit_graphic_layer_infos [ <layer_info_index> ] . texture_id ) = none ) 
			IF NOT ( ( edit_graphic_layer_infos [ <layer_info_index> ] . string ) = "" ) 
				edit_graphic_prepare_text_sprite_infos info_index = <layer_info_index> 
				<sprite_infos> = ( <sprite_infos> + <text_infos> ) 
			ENDIF 
		ELSE 
			<posx> = ( ( edit_graphic_layer_infos [ <layer_info_index> ] . pos_x ) - 32 ) 
			<posy> = ( ( edit_graphic_layer_infos [ <layer_info_index> ] . pos_y ) - 32 ) 
			HSVtoRGB hsv = ( edit_graphic_layer_infos [ <layer_info_index> ] . hsva ) 
			<tmp_array> = [ 
				{ 
					texture_id = ( edit_graphic_layer_infos [ <layer_info_index> ] . texture_id ) 
					pos_x = <posx> 
					pos_y = <posy> 
					rot = ( edit_graphic_layer_infos [ <layer_info_index> ] . rot ) 
					scale = ( edit_graphic_layer_infos [ <layer_info_index> ] . scale ) 
					flip_h = ( edit_graphic_layer_infos [ <layer_info_index> ] . flip_h ) 
					flip_v = ( edit_graphic_layer_infos [ <layer_info_index> ] . flip_v ) 
					rgba = <rgb> 
					layer_id = ( edit_graphic_layer_infos [ <layer_info_index> ] . layer_id ) 
				} 
			] 
			<sprite_infos> = ( <sprite_infos> + <tmp_array> ) 
		ENDIF 
		<index> = ( <index> + 1 ) 
		RemoveParameter layer_info_index 
	REPEAT 10 
	RETURN sprite_infos = <sprite_infos> 
ENDSCRIPT

SCRIPT edit_graphic_prepare_text_sprite_infos 
	<layer_string> = ( edit_graphic_layer_infos [ <info_index> ] . string ) 
	StringToCharArray string = <layer_string> 
	GetArraySize <char_array> 
	<font_spacing> = ( EG_font_names [ ( edit_graphic_layer_infos [ <info_index> ] . font_id ) ] . spacing ) 
	<container_scale> = ( edit_graphic_layer_infos [ <info_index> ] . scale ) 
	<char_image_size> = ( ( 64.00000000000 / <array_size> ) * <container_scale> ) 
	<container_pos_x> = ( edit_graphic_layer_infos [ <info_index> ] . pos_x ) 
	<char_x_pos> = ( ( 0 - ( ( <char_image_size> * <array_size> ) / 2 ) ) + ( <char_image_size> / 2 ) ) 
	<char_y_pos> = 0 
	<font> = ( EG_font_names [ ( edit_graphic_layer_infos [ <info_index> ] . font_id ) ] . name ) 
	<scale> = ( <char_image_size> / 64.00000000000 ) 
	IF NOT ( <array_size> = 1 ) 
		IF NOT ( <font_spacing> = 0 ) 
			<scale> = ( <scale> * ( 1 / <font_spacing> ) ) 
		ENDIF 
	ENDIF 
	<rot> = ( edit_graphic_layer_infos [ <info_index> ] . rot ) 
	HSVtoRGB hsv = ( edit_graphic_layer_infos [ <info_index> ] . hsva ) 
	<text_infos> = [ ] 
	<index> = 0 
	BEGIN 
		<char> = ( <char_array> [ <index> ] ) 
		IF ( <char> = " " ) 
			FormatText checksumname = texture "%f_a" f = <font> l = <char> 
			<rgba> = [ 0 , 0 , 0 , 0 ] 
		ELSE 
			FormatText checksumname = texture "%f_%l" f = <font> l = <char> 
			<rgba> = <rgb> 
		ENDIF 
		Get2DPosFrom2DVec magnitude = <char_x_pos> theta = <rot> 
		<tmp_array> = [ 
			{ 
				texture_id = <texture> 
				pos_x = ( <x> + ( <container_pos_x> - 32 ) ) 
				pos_y = ( <y> + ( ( edit_graphic_layer_infos [ <info_index> ] . pos_y ) - 32 ) ) 
				rot = <rot> 
				scale = <scale> 
				flip_h = ( edit_graphic_layer_infos [ <info_index> ] . flip_h ) 
				flip_v = ( edit_graphic_layer_infos [ <info_index> ] . flip_v ) 
				rgba = <rgba> 
				layer_id = ( edit_graphic_layer_infos [ <info_index> ] . layer_id ) 
			} 
		] 
		<text_infos> = ( <text_infos> + <tmp_array> ) 
		<char_x_pos> = ( <char_x_pos> + <char_image_size> ) 
		<index> = ( <index> + 1 ) 
	REPEAT <array_size> 
	<index> = ( <array_size> - 1 ) 
	<reverse_infos> = [ ] 
	BEGIN 
		<tmp_array> = [ { ( <text_infos> [ <index> ] ) } ] 
		<reverse_infos> = ( <reverse_infos> + <tmp_array> ) 
		<index> = ( <index> - 1 ) 
	REPEAT <array_size> 
	RETURN text_infos = <reverse_infos> 
ENDSCRIPT

