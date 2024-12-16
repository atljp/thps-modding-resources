
lock_framerate = 0 
display_framerate_box = 1 
framerate_value = 0.00000000000 
show_filenames = 0 
output_tracking_lines = 0 
rail_arrows = 0 
show_all_trick_objects = 0 
entered_from_autolaunch = 0 
DontSpoofAdaptor = 0 
viewer_buttons_enabled = 1 
enable_view_goals_select_shortcut = 0 
wireframe_skins = 0 
DEMO_BUILD = 0 
GameInformerBuild = 0 
auto_change_chapter_and_stage = 0 
SHOWPOLYS_ONQUICKVIEW = 1 
particle_heap_size = 71680 
particle_options_DEBUG = { 
	show_particle_heap = 0 
	particle_warning_script = FlexParticleWarning 
} 
SCRIPT load_permanent_prefiles 
	LoadPreFile "permtex.pre" 
	IF NOT IsNgc 
		LoadPreFile "casfiles.pre" 
	ENDIF 
	IF IsNgc 
		LoadPreFile "gcmemicons.pre" 
	ENDIF 
ENDSCRIPT

SCRIPT load_permanent_assets 
	SetDefaultPermanent 1 
	SetReferenceChecksum 0 
	LoadPreFile "skeletons.pre" 
	LoadPreFile "bits.pre" 
	InitAnimCompressTable "anims\\standardkeyq.bin" q48 
	InitAnimCompressTable "anims\\standardkeyt.bin" t48 
	PushMemProfile "Animation Cache" 
	IF NOT IsNgc 
		InitAnimSystem { 
			AnimHeapSize = 337920 
			CacheBlockAlign = 3072 
			DefCacheType = fullres 
			MaxDegenerateAnims = 3 
			MaxAnimSubsets = 4 
		} 
	ELSE 
		InitAnimSystem { 
			AnimHeapSize = 0 
			CacheBlockAlign = 3072 
			DefCacheType = fullres 
			MaxDegenerateAnims = 3 
			MaxAnimSubsets = 4 
		} 
	ENDIF 
	PopMemProfile 
	PushMemProfile "Collision Heap" 
	MemInitHeap name = "Collision" size = 20480 
	PopMemProfile 
	PushMemProfile "Audio Stream header" 
	LoadStreamHeader "streams\\streams" 
	PopMemProfile 
	PushMemProfile "Permanent Skeletons" 
	skeletonload_all 
	PopMemProfile 
	PushMemProfile "Permanent Models" 
	LoadAsset "models\\arrow\\arrow.tex" 
	LoadAsset "models\\arrow\\arrow.mdl" nocollision = 1 parent = %"models\\arrow\\arrow.tex" 
	LoadAsset "models\\special_arrow\\special_arrow.tex" 
	LoadAsset "models\\special_arrow\\special_arrow.mdl" nocollision = 1 parent = %"models\\special_arrow\\special_arrow.tex" 
	PushMemProfile "Menu 3D" 
	LoadAsset "models\\gradient_bg\\gradient_bg.tex" 
	LoadAsset "models\\gradient_bg\\gradient_bg.mdl" nocollision = 1 parent = %"models\\gradient_bg\\gradient_bg.tex" 
	PopMemProfile 
	LoadAsset "models\\gameobjects\\scavenger_coin\\scavenger_coin.tex" 
	LoadAsset "models\\gameobjects\\scavenger_coin\\scavenger_coin.mdl" nocollision = 1 parent = %"models\\gameobjects\\scavenger_coin\\scavenger_coin.tex" 
	LoadAsset "models\\HUD_arrow\\HUD_arrow.tex" 
	LoadAsset "models\\HUD_arrow\\HUD_arrow.mdl" nocollision = 1 parent = %"models\\HUD_arrow\\HUD_arrow.tex" 
	LoadAsset "models\\ped_shadow\\ped_shadow.tex" 
	LoadAsset "models\\ped_shadow\\ped_shadow.mdl" nocollision = 1 parent = %"models\\ped_shadow\\ped_shadow.tex" 
	LoadAsset "models\\goalarrow\\goalarrow.tex" 
	LoadAsset "models\\goalarrow\\goalarrow.mdl" nocollision = 1 parent = %"models\\goalarrow\\goalarrow.tex" 
	LoadAsset "models\\cat_bg\\cat_bg.tex" 
	LoadAsset "models\\cat_bg\\cat_bg.mdl" nocollision = 1 parent = %"models\\cat_bg\\cat_bg.tex" 
	LoadAsset "models\\gameobjects\\p1_cursor\\p1_cursor.tex" 
	LoadAsset "models\\gameobjects\\p1_cursor\\p1_cursor.mdl" nocollision = 1 parent = %"models\\gameobjects\\p1_cursor\\p1_cursor.tex" 
	LoadAsset "models\\gameobjects\\skate\\letter_s\\letter_s.tex" 
	LoadAsset "models\\gameobjects\\skate\\letter_s\\letter_s.mdl" nocollision = 1 parent = %"models\\gameobjects\\skate\\letter_s\\letter_s.tex" 
	LoadAsset "models\\gameobjects\\skate\\letter_k\\letter_k.tex" 
	LoadAsset "models\\gameobjects\\skate\\letter_k\\letter_k.mdl" nocollision = 1 parent = %"models\\gameobjects\\skate\\letter_k\\letter_k.tex" 
	LoadAsset "models\\gameobjects\\skate\\letter_a\\letter_a.tex" 
	LoadAsset "models\\gameobjects\\skate\\letter_a\\letter_a.mdl" nocollision = 1 parent = %"models\\gameobjects\\skate\\letter_a\\letter_a.tex" 
	LoadAsset "models\\gameobjects\\skate\\letter_t\\letter_t.tex" 
	LoadAsset "models\\gameobjects\\skate\\letter_t\\letter_t.mdl" nocollision = 1 parent = %"models\\gameobjects\\skate\\letter_t\\letter_t.tex" 
	LoadAsset "models\\gameobjects\\skate\\letter_e\\letter_e.tex" 
	LoadAsset "models\\gameobjects\\skate\\letter_e\\letter_e.mdl" nocollision = 1 parent = %"models\\gameobjects\\skate\\letter_e\\letter_e.tex" 
	LoadAsset "models\\gameobjects\\combo\\goal_combo_c\\goal_combo_c.tex" 
	LoadAsset "models\\gameobjects\\combo\\goal_combo_c\\goal_combo_c.mdl" nocollision = 1 parent = %"models\\gameobjects\\combo\\goal_combo_c\\goal_combo_c.tex" 
	LoadAsset "models\\gameobjects\\combo\\goal_combo_o\\goal_combo_o.tex" 
	LoadAsset "models\\gameobjects\\combo\\goal_combo_o\\goal_combo_o.mdl" nocollision = 1 parent = %"models\\gameobjects\\combo\\goal_combo_o\\goal_combo_o.tex" 
	LoadAsset "models\\gameobjects\\combo\\goal_combo_m\\goal_combo_m.tex" 
	LoadAsset "models\\gameobjects\\combo\\goal_combo_m\\goal_combo_m.mdl" nocollision = 1 parent = %"models\\gameobjects\\combo\\goal_combo_m\\goal_combo_m.tex" 
	LoadAsset "models\\gameobjects\\combo\\goal_combo_b\\goal_combo_b.tex" 
	LoadAsset "models\\gameobjects\\combo\\goal_combo_b\\goal_combo_b.mdl" nocollision = 1 parent = %"models\\gameobjects\\combo\\goal_combo_b\\goal_combo_b.tex" 
	LoadAsset "models\\gameobjects\\projectiles\\tomato\\tomato.tex" 
	LoadAsset "models\\gameobjects\\projectiles\\tomato\\tomato.mdl" nocollision = 1 parent = %"models\\gameobjects\\projectiles\\tomato\\tomato.tex" 
	PopMemProfile 
	load_special_items 
	PushMemProfile "Permanent Particle Textures" 
	LoadParticleTexture "particles\\dt_generic_particle01" perm 
	LoadParticleTexture "bits\\particle_test02" perm 
	LoadParticleTexture "bits\\sun" perm 
	LoadParticleTexture "bits\\apm_sun_C_01" perm 
	LoadParticleTexture "bits\\blood_01" perm 
	LoadParticleTexture "bits\\splash" perm 
	LoadParticleTexture "bits\\snow" perm 
	LoadParticleTexture "particles\\dt_nj_flame02" perm 
	LoadParticleTexture "particles\\dt_barf02" perm 
	SetNGCAGFix 
	LoadParticleTexture "bits\\cag_workspace" perm 
	UnSetNGCAGFix 
	LoadParticleTexture "particles\\apm_spark_4" perm 
	IF isXbox 
		LoadParticleTexture "bits\\skidtrail" perm 
	ELSE 
		LoadParticleTexture "bits\\skidtrail_ps2" perm 
	ENDIF 
	load_permanent_particle_textures 
	load_permanent_fast_particle_textures 
	load_permanent_shatter_textures 
	PopMemProfile 
	UnloadPreFile "skeletons.pre" 
	UnloadPreFile "bits.pre" 
	IF IsNgc 
		do_load_permanent 
		do_load_unloadable 
	ENDIF 
	SetDefaultPermanent 0 
	PushMemProfile "Fonts and Bitmaps" 
	Theme_GetFontColors return_value = font_colors 
	IF NOT IsNgc 
		LoadPreFile "fonts.pre" 
	ENDIF 
	PushMemProfile "Fonts" 
	LoadFont "testtitle" char_spacing = 0 space_spacing = 12 color_tab = <font_colors> 
	LoadFont "newtrickfont" char_spacing = 0 space_spacing = 10 color_tab = newtrickfont_colors 
	LoadFont "small" char_spacing = 1.50000000000 space_spacing = 9 color_tab = <font_colors> 
	LoadFont "newtimerfont" char_spacing = -2 
	LoadFont "dialog" char_spacing = -3 space_spacing = 12 color_tab = <font_colors> 
	LoadFont buttons_font 
	PopMemProfile 
	IF NOT IsNgc 
		UnloadPreFile "fonts.pre" dont_assert 
	ENDIF 
	LoadPreFile "panelsprites.pre" 
	load_textures_to_main_memory array = permanent_textures heap = PermanentTextureHeap 
	IF isXbox 
		load_ps2_textures_to_main_memory 
	ENDIF 
	load_textures_to_main_memory array = unloadable_textures heap = UnloadableTextureHeap 
	UnloadPreFile "panelsprites.pre" dont_assert 
	load_theme_textures_to_main_memory 
	PopMemProfile 
ENDSCRIPT

SCRIPT load_special_items 
	PushMemProfile "Special Item Models" 
	LoadAsset "Models\\SpecialItems\\FranklinKite\\franklinkite.tex" 
	LoadAsset "models\\specialitems\\FranklinKite\\franklinkite.skin" parent = %"Models\\SpecialItems\\FranklinKite\\franklinkite.tex" 
	LoadAsset "models\\specialitems\\Sword\\SI_Sword.tex" 
	LoadAsset "models\\specialitems\\Sword\\SI_Sword.skin" parent = %"models\\specialitems\\Sword\\SI_Sword.tex" 
	LoadAsset "models\\specialitems\\JugglingBalls\\SI_JugglingBalls.tex" 
	LoadAsset "models\\specialitems\\JugglingBalls\\SI_JugglingBalls.skin" parent = %"models\\specialitems\\JugglingBalls\\SI_JugglingBalls.tex" 
	LoadAsset "models\\specialitems\\Chainsaw\\SI_Chainsaw.tex" 
	LoadAsset "models\\specialitems\\Chainsaw\\SI_Chainsaw.skin" parent = %"models\\specialitems\\Chainsaw\\SI_Chainsaw.tex" 
	LoadAsset "models\\Animals\\Anl_Shark\\Anl_shark.tex" 
	LoadAsset "models\\Animals\\Anl_Shark\\Anl_shark.skin" parent = %"models\\Animals\\Anl_Shark\\Anl_shark.tex" 
	LoadAsset "models\\specialitems\\spraycan\\spraycan.tex" 
	LoadAsset "models\\specialitems\\spraycan\\spraycan.skin" parent = %"models\\specialitems\\spraycan\\spraycan.tex" 
	LoadAsset "models\\specialitems\\spraycan\\si_spraycan_double.tex" 
	LoadAsset "models\\specialitems\\spraycan\\SI_SprayCan_Double.skin" parent = %"models\\specialitems\\spraycan\\si_spraycan_double.tex" 
	LoadAsset "models\\specialitems\\Hoagie\\si_Hoagie.tex" 
	LoadAsset "models\\specialitems\\Hoagie\\si_Hoagie.skin" parent = %"models\\specialitems\\Hoagie\\si_Hoagie.tex" 
	LoadAsset "models\\specialitems\\DragTires\\si_DragTires.tex" 
	LoadAsset "models\\specialitems\\DragTires\\si_DragTires.skin" parent = %"models\\specialitems\\DragTires\\si_DragTires.tex" 
	LoadAsset "models\\specialitems\\Flag\\SI_Flag.tex" 
	LoadAsset "models\\specialitems\\Flag\\SI_Flag.skin" parent = %"models\\specialitems\\Flag\\SI_Flag.tex" 
	LoadAsset "models\\specialitems\\bustedboard\\bustedboard.tex" 
	LoadAsset "models\\specialitems\\bustedboard\\bustedboard.skin" parent = %"models\\specialitems\\bustedboard\\bustedboard.tex" 
	LoadAsset "models\\specialitems\\extraboard\\extraboard.tex" 
	LoadAsset "models\\specialitems\\extraboard\\extraboard.skin" parent = %"models\\specialitems\\extraboard\\extraboard.tex" 
	PopMemProfile 
ENDSCRIPT

SCRIPT load_permanent_anims LoadFunction = LoadAnim 
	animload_thps6_human <...> 
	load_special_item_anims <...> 
ENDSCRIPT

SCRIPT load_unloadable_anims LoadFunction = LoadAnim 
	animload_THPS6_human_unloadable <...> 
ENDSCRIPT

SCRIPT load_net_anims LoadFunction = LoadAnim 
	animload_THPS6_human_net <...> 
	load_special_item_anims <...> 
ENDSCRIPT

SCRIPT load_special_item_anims LoadFunction = LoadAnim 
	animload_SI_Prop_1 <...> 
	animload_SI_Prop2 <...> 
	animload_SI_Prop_3 <...> 
	animload_SI_bustedboard <...> 
	animload_SI_Extraboard <...> 
	animload_SI_FranklinKite <...> 
	animload_SI_Shark <...> 
	animload_SI_flag <...> 
ENDSCRIPT

SCRIPT init_light_manager 
	InitLightManager max_lights = 2 max_diffuse_lights = 3 
ENDSCRIPT

SCRIPT uninit_light_manager 
	UninitLightManager 
ENDSCRIPT

SCRIPT init_environment 
	InitSun { 
		theta = ( 3.14159011841 / 4.00000000000 ) 
		phi = ( 3.14159011841 / 6.00000000000 ) 
		radius = 18000.00000000000 
		size = 7332.00000000000 
		texture = sun 
		corona_texture = apm_sun_C_01 
		lens_flare_data = lens_flare_data 
	} 
ENDSCRIPT

SCRIPT init_loading_bar 
	SetLoadingBarPos x = 258 y = 400 
	SetLoadingBarSize width = 140 height = 8 
	SetLoadingBarStartColor r = 0 g = 76 b = 129 
	SetLoadingBarEndColor r = 176 g = 211 b = 115 
	SetLoadingBarBorder width = 5 height = 5 
	SetLoadingBarBorderColor r = 40 g = 40 b = 40 
ENDSCRIPT

All_Levels_Unlocked = 0 
bootstrap_build = 0 
UseLevelOverrideStats = 0 
SCRIPT network_driver_startup 
	WriteDNASBinary 
	
	
	IF LoadNetworkDrivers 
		
	ELSE 
		
	ENDIF 
	
ENDSCRIPT

SCRIPT screen_element_startup 
	ScreenElementSystemInit 
	setup_main_button_event_mappings 
	SetScreenElementProps { 
		id = root_window 
		tags = { menu_state = off } 
	} 
	FireEvent type = focus target = root_window 
	create_panel_stuff 
ENDSCRIPT

SCRIPT default_system_startup 
	change select_shift = 0 
	PushMemProfile "Pre-game initialization" 
	SetStartingLevelFlags 
	CareerReset 
	ResetArcadeScores 
	SetSfxVolume 100 
	SetMusicVolume MusicVolOutsideBox 
	SetRandomMode 1 
	SetGlobalFlag flag = SOUNDS_SONGORDER_RANDOM 
	VibrationOn 
	IF CD 
		change UsePreFilesForLevelLoading = 1 
		change DEVKIT_LEVELS = 0 
		change All_Levels_Unlocked = 0 
		change ApplyViewerObjModelToPlayer = 1 
	ELSE 
		change All_Levels_Unlocked = 1 
	ENDIF 
	IF IsNgc 
		change UsePreFilesForLevelLoading = 1 
	ENDIF 
	screen_element_startup 
	SetScreenElementProps id = root_window event_handlers = [ { pad_start nullscript } ] replace_handlers 
	
	setservermode on 
	SetJoinMode JOIN_MODE_PLAY 
	PushMemProfile "Start & Join Server" 
	StartServer 
	JoinServer <...> 
	PopMemProfile 
	PushMemProfile "Goal Editor" 
	CreateGoalEditor 
	PopMemProfile 
	PushMemProfile "Rail Editor" 
	CreateRailEditor 
	PopMemProfile 
	PopMemProfile 
	IF English 
		SetGlobalFlag flag = NO_DISPLAY_CUTSCENE_SUBTITLES 
	ENDIF 
	IF Bootstrap 
		change bootstrap_build = 1 
		change STARTGAME_FIRST_TIME = 1 
		change BUMP_STATS = 0 
		change All_Levels_Unlocked = 0 
		autolaunch level = load_sch game = career 
	ELSE 
		IF CD 
			EnableScriptPrintf 0 
			change BUMP_STATS = 1 
			change has_accepted_dnas = 0 
			change DontSpoofAdaptor = 1 
			change viewer_buttons_enabled = 0 
			IF ( DEMO_BUILD ) 
				autolaunch level = Load_MainMenu game = career 
			ELSE 
				autolaunch level = Load_MainMenu game = career 
			ENDIF 
		ELSE 
			cheat_select_shift 
			IF NOT IsTrue DontSpoofAdaptor 
				auto_launch_viewer 
			ENDIF 
			cheat_give_neversoft_skaters 
			IF NOT IsTrue DontSpoofAdaptor 
				LaunchScriptDebugger 
			ENDIF 
			change SkipDNASAuthentication = 1 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT Call_Personal_StartUp_Script 
	IF ScriptExists startup 
		startup 
	ELSE 
		
		Hideloadingscreen 
		CreateScreenElement { 
			parent = root_window 
			type = textelement 
			id = ns_rules 
			text = "Neversoft and Activision 2002" 
			font = newtrickfont 
			pos = PAIR(320.00000000000, 420.00000000000) 
			rgba = [ 140 128 128 55 ] 
			Scale = 0.60000002384 
			just = [ center center ] 
			not_focusable 
		} 
		RunScriptOnScreenElement id = ns_rules missing_startup 
	ENDIF 
	SFX_SetOutsideVolAtTopOfLevel 
ENDSCRIPT

SCRIPT missing_startup 
	BEGIN 
		SetProps text = "Missing Script Startup" 
		DoMorph time = 0 alpha = 0 
		DoMorph time = 0.50000000000 alpha = 1 Scale = 3 
		DoMorph time = 0.50000000000 alpha = 1 Scale = 1 
		wait 5 seconds 
		DoMorph time = 0.50000000000 alpha = 0 Scale = 0.50000000000 
		DoMorph time = 0.50000000000 alpha = 0 
	REPEAT 
ENDSCRIPT

STARTGAME_FIRST_TIME = 0 
SCRIPT create_startup_menu 
	Hideloadingscreen 
	GoalManager_HidePoints 
	GoalManager_HideGoalPoints 
	IF ObjectExists id = current_menu_anchor 
		Destroyscreenelement id = current_menu_anchor 
		wait 1 game frame 
	ENDIF 
	KillSkaterCamAnim all 
	PlaySkaterCamAnim name = SS_MenuCam play_hold 
	SetMemThreadSafe off 
	make_new_skateshop_menu { 
		pos = PAIR(205.00000000000, 109.00000000000) 
		internal_just = [ center center ] 
		menu_id = startup_menu 
		vmenu_id = startup_vmenu 
		menu_title = "" 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		texture = THPS4 
		pos = PAIR(320.00000000000, 132.00000000000) 
		Scale = PAIR(1.39999997616, 1.00000000000) 
		z_priority = 2 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		texture = options_bg 
		draw_behind_parent 
		pos = PAIR(321.00000000000, 115.00000000000) 
		Scale = PAIR(1.16999995708, 1.10000002384) 
		just = [ center top ] 
		rgba = [ 128 128 128 128 ] 
		z_priority = 0 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		id = startup_menu_blue_bar 
		texture = stats_notch 
		pos = PAIR(312.00000000000, 369.00000000000) 
		rgba = [ 42 48 77 50 ] 
		Scale = PAIR(14.00000000000, 0.20000000298) 
		just = [ center top ] 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		id = startup_menu_box_top 
		texture = level_top_piece 
		pos = PAIR(321.00000000000, 145.00000000000) 
		rgba = [ 128 128 128 80 ] 
		Scale = <Scale> 
		just = [ center top ] 
	} 
	BEGIN 
		GetStackedScreenElementPos y id = <id> 
		CreateScreenElement { 
			type = SpriteElement 
			parent = current_menu_anchor 
			texture = level_repeat_mid 
			pos = <pos> 
			Scale = <Scale> 
			rgba = [ 128 128 128 80 ] 
			just = [ left top ] 
		} 
	REPEAT 5 
	GetStackedScreenElementPos y id = <id> 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		texture = level_bottom_piece 
		pos = <pos> 
		rgba = [ 128 128 128 80 ] 
		Scale = PAIR(0.95999997854, 1.00000000000) 
		just = [ left top ] 
	} 
	CreateScreenElement { 
		type = textelement 
		parent = current_menu 
		font = small 
		text = "" 
		not_focusable 
	} 
	SetScreenElementProps { 
		id = root_window 
		event_handlers = [ { pad_start continue_career } ] 
		replace_handlers 
	} 
	main_menu_add_item text = "Start Game" pad_choose_script = continue_career 
	main_menu_add_item { 
		text = "Controls" 
		pad_choose_script = bootstrap_displayscreen 
		pad_choose_params = { screen = "loadscrn_demo_controls" } 
	} 
	main_menu_add_item { 
		text = "More Info" 
		pad_choose_script = bootstrap_displayscreen 
		pad_choose_params = { screen = "loadscrn_marketing" } 
	} 
	
	RunScriptOnScreenElement id = startup_menu menu_onscreen 
	
	CreateScreenElement { 
		parent = root_window 
		type = textelement 
		id = ns_rules 
		text = "Neversoft and Activision 2002" 
		font = newtrickfont 
		pos = PAIR(320.00000000000, 420.00000000000) 
		rgba = [ 140 128 128 55 ] 
		Scale = 0.60000002384 
		just = [ center center ] 
		not_focusable 
	} 
	startup_camera_playback 
	change STARTGAME_FIRST_TIME = 0 
	
ENDSCRIPT

SCRIPT exit_screen_menu 
	IF ObjectExists id = screen_menu 
		Destroyscreenelement id = screen_menu 
	ENDIF 
	Hideloadingscreen 
	create_startup_menu 
ENDSCRIPT

SCRIPT startup_camera_playback 
	KillSkaterCamAnim all 
	UnPauseGame 
	PauseSkaters 
	PlaySkaterCamAnim skater = 0 name = sch_overview_camera loop 
ENDSCRIPT

SCRIPT continue_career 
	restore_start_key_binding 
	IF ObjectExists id = ns_rules 
		Destroyscreenelement id = ns_rules 
	ENDIF 
	KillSkaterCamAnim all 
	GoalManager_ShowPoints 
	GoalManager_ShowGoalPoints 
	MakeSkaterGoto StartSkating1 
	UnPauseskaters 
	skiptrack 
	IF ObjectExists id = current_menu_anchor 
		Destroyscreenelement id = current_menu_anchor 
	ENDIF 
	SetScreenElementProps { 
		id = root_window 
		tags = { menu_state = off } 
	} 
ENDSCRIPT

SCRIPT fadein_fadeout text = "you forgot the text" 
	SetProps text = <text> 
	DoMorph time = 0 alpha = 0 
	DoMorph time = 2 alpha = 1 
	wait 5 seconds 
	DoMorph time = 2 alpha = 0 
	DoMorph time = 2 alpha = 0 
ENDSCRIPT


