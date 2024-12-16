
enable_coim_object_debug = 0 
screen_element_heap = FrontEnd 
debug_graffiti = 0 
ViewerModeOn = 0 
g_NoParticles = 0 
debug_cutscenes = 0 
output_cutscene_video = 0 
particle_heap_size = 71680 
particle_options_DEBUG = { 
	show_particle_heap = 0 
	particle_warning_script = FlexParticleWarning 
} 
lock_framerate = 0 
display_framerate_box = 0 
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
SHOWPOLYS_ONQUICKVIEW = 0 
THUGPRO_Footstep_Sounds_Changed = 0 
All_Levels_Unlocked = 1 
bootstrap_build = 0 
UseLevelOverrideStats = 0 
cas_artist = 0 
SCRIPT load_permanent_prefiles 
	LoadPreFile "permtex.pre" 
	LoadPreFile "casfiles.pre" 
ENDSCRIPT

SCRIPT load_permanent_assets 
	MemInitHeap name = "SkProPermanent" size = 12582912 
	MemInitHeap name = "SkProUnloadable" size = 1048576 
	SetDefaultPermanent 1 
	SetReferenceChecksum 0 
	LoadPreFile "skeletons.pre" 
	LoadPreFile "bits.pre" 
	LoadPreFile "thugpro_models.pre" 
	InitAnimCompressTable "anims\\standardkeyq.bin" q48 
	InitAnimCompressTable "anims\\standardkeyt.bin" t48 
	PushMemProfile "Animation Cache" 
	InitAnimSystem { 
		AnimHeapSize = 337920 
		CacheBlockAlign = 3072 
		DefCacheType = fullres 
		MaxDegenerateAnims = 3 
		MaxAnimSubsets = 4 
	} 
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
	LoadAsset "models\\ped_shadow\\ped_shadow.tex" 
	LoadAsset "models\\ped_shadow\\ped_shadow.mdl" nocollision = 1 parent = %"models\\ped_shadow\\ped_shadow.tex" 
	LoadAsset "models\\gameobjects\\pickups\\doublecheeseburger\\doublecheeseburger.tex" 
	LoadAsset "models\\gameobjects\\pickups\\doublecheeseburger\\doublecheeseburger.mdl" parent = %"models\\gameobjects\\pickups\\doublecheeseburger\\doublecheeseburger.tex" 
	LoadAsset "models\\gameobjects\\pickups\\applepie\\applepie.tex" 
	LoadAsset "models\\gameobjects\\pickups\\applepie\\applepie.mdl" nocollision = 1 parent = %"models\\gameobjects\\pickups\\applepie\\applepie.tex" 
	LoadAsset "models\\THUGPRO_GOAL_Arrow\\THUGPRO_GOAL_Arrow.tex" 
	LoadAsset "models\\THUGPRO_GOAL_Arrow\\THUGPRO_GOAL_Arrow.mdl" nocollision = 1 parent = %"models\\THUGPRO_GOAL_Arrow\\THUGPRO_GOAL_Arrow.tex" 
	LoadAsset "models\\props\\prop_snowman.tex" 
	LoadAsset "models\\props\\prop_snowman.mdl" nocollision = 1 parent = %"models\\props\\prop_snowman.tex" 
	LoadAsset "models\\GameObjects\\Net\\Rocket\\Rocket.tex" 
	LoadAsset "models\\GameObjects\\Net\\Rocket\\Rocket.mdl" nocollision = 1 parent = %"models\\GameObjects\\Net\\Rocket\\Rocket.tex" 
	LoadAsset "models\\GameObjects\\Net\\Sprite\\Sprite.tex" 
	LoadAsset "models\\GameObjects\\Net\\Sprite\\Sprite.mdl" nocollision = 1 parent = %"models\\GameObjects\\Net\\Sprite\\Sprite.tex" 
	LoadAsset "models\\GameObjects\\Net\\Snowball\\Snowball.tex" 
	LoadAsset "models\\GameObjects\\Net\\Snowball\\Snowball.mdl" nocollision = 1 parent = %"models\\GameObjects\\Net\\Snowball\\Snowball.tex" 
	LoadAsset "models\\gameobjects\\goal_money\\goal_money.tex" 
	LoadAsset "models\\gameobjects\\goal_money\\goal_money.mdl" nocollision = 1 parent = %"models\\gameobjects\\goal_money\\goal_money.tex" 
	LoadAsset "models\\thugproarrow\\thugproarrow.tex" 
	LoadAsset "models\\thugproarrow\\thugproarrow.mdl" nocollision = 1 parent = %"models\\thugproarrow\\thugproarrow.tex" 
	LoadAsset "models\\GameObjects\\boombox\\boombox.tex" 
	LoadAsset "models\\GameObjects\\boombox\\boombox.mdl" nocollision = 1 parent = %"models\\GameObjects\\boombox\\boombox.tex" 
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
	LoadParticleTexture "particles\\dt_ironblast01" perm 
	LoadParticleTexture "particles\\dt_barf02" perm 
	LoadParticleTexture "bits\\cag_workspace" perm 
	LoadParticleTexture "particles\\apm_spark_4" perm 
	LoadParticleTexture "bits\\skidtrail" perm 
	load_permanent_particle_textures 
	load_permanent_fast_particle_textures 
	load_permanent_shatter_textures 
	PopMemProfile 
	THUGPRO_GetProxyGlobal global = g_NoParticles 
	IF GotParam value 
		Change g_NoParticles = <value> 
	ENDIF 
	UnloadPreFile "skeletons.pre" 
	UnloadPreFile "bits.pre" 
	UnloadPreFile "thugpro_models.pre" 
	SetDefaultPermanent 0 
	PushMemProfile "Fonts and Bitmaps" 
	MemPushContext BottomUpHeap 
	load_fonts_to_main_memory 
	MemPopContext 
	LoadPreFile "panelsprites.pre" 
	LoadPreFile "thugpro_images.pre" 
	MemPushContext PermanentTextureHeap 
	SHUFFLE_SPLASH_IMAGES 
	LoadTexture ( ( splash_images ) [ ( GLOBAL_SPLASH_RAND ) ] ) dont_assert 
	MemPopContext 
	printf "load permanent_textures" 
	load_textures_to_main_memory array = permanent_textures heap = PermanentTextureHeap 
	printf "load unloadable_textures" 
	load_textures_to_main_memory array = unloadable_textures heap = UnloadableTextureHeap 
	UnloadPreFile "panelsprites.pre" dont_assert 
	UnloadPreFile "thugpro_images.pre" dont_assert 
	load_theme_textures_to_main_memory 
	load_update_level_select_textures_to_main_memory 
	load_skater_stickers_to_main_memory { 
		no_pre_file = 1 
		mem_context = UnloadableTextureHeap 
	} 
	PopMemProfile 
	PushMemProfile "Permanent Anims" 
	IF NOT ( has_loaded_permanent_anims ) 
		do_load_permanent 
		do_load_unloadable 
		do_load_thugpro_permanent 
		Change has_loaded_permanent_anims = 1 
	ENDIF 
	PopMemProfile 
	PushMemProfile "Multiplayer Textures" 
	MemPushContext UnloadableTextureHeap 
	load_multiplayer_textures_to_main_memory 
	MemPopContext 
	PopMemProfile 
ENDSCRIPT

TEST_FONT_COLORS = [ 
	[ 88 105 112 128 ] 
	[ 110 30 15 108 ] 
	[ 50 80 112 100 ] 
	[ 9 107 36 100 ] 
	[ 123 99 3 100 ] 
	[ 0 128 128 100 ] 
	[ 128 0 128 100 ] 
	[ 30 50 80 100 ] 
	[ 88 105 112 128 ] 
	[ 50 80 112 100 ] 
	[ 120 45 4 128 ] 
	[ 128 128 128 128 ] 
	[ 0 128 230 120 ] 
	[ 200 90 11 120 ] 
	[ 0 128 0 120 ] 
	[ 128 0 0 120 ] 
] 
SCRIPT load_fonts_to_main_memory 
	LoadPreFile "thugpro_fonts.pre" 
	PushMemProfile "Fonts" 
	LoadFont "testtitle" char_spacing = 0 space_spacing = 12 color_tab = TEST_FONT_COLORS 
	LoadFont "newtrickfont" char_spacing = 0 space_spacing = 10 color_tab = TEST_FONT_COLORS 
	LoadFont "newtrickfont_high" char_spacing = -2 space_spacing = 40 color_tab = TEST_FONT_COLORS 
	LoadFont "small" char_spacing = 1.50000000000 space_spacing = 9 color_tab = TEST_FONT_COLORS 
	LoadFont "small_rus" char_spacing = 1.50000000000 space_spacing = 9 color_tab = TEST_FONT_COLORS 
	LoadFont "newtimerfont" char_spacing = -2 
	LoadFont "dialog" char_spacing = -3 space_spacing = 12 color_tab = TEST_FONT_COLORS 
	LoadFont "cyrillic" char_spacing = 1.50000000000 space_spacing = 36 color_tab = TEST_FONT_COLORS 
	LoadFont "machine" char_spacing = -4 space_spacing = 20 color_tab = TEST_FONT_COLORS 
	LoadFont "impact" char_spacing = -6 space_spacing = 24 color_tab = TEST_FONT_COLORS 
	LoadFont "compacta" char_spacing = 0 space_spacing = 11 color_tab = TEST_FONT_COLORS 
	LoadFont "fake" char_spacing = -12 space_spacing = 48 color_tab = TEST_FONT_COLORS 
	LoadFont "xtemplate" char_spacing = -6 space_spacing = 24 color_tab = TEST_FONT_COLORS 
	LoadFont "bebas" char_spacing = -6 space_spacing = 30 color_tab = TEST_FONT_COLORS 
	LoadFont "royal" char_spacing = -2 space_spacing = 30 color_tab = TEST_FONT_COLORS 
	LoadFont "eras" char_spacing = -6 space_spacing = 30 color_tab = TEST_FONT_COLORS 
	LoadFont "crillee" char_spacing = -6 space_spacing = 30 color_tab = TEST_FONT_COLORS 
	LoadFont "euclid" char_spacing = -6 space_spacing = 30 color_tab = TEST_FONT_COLORS 
	LoadFont "aventra" char_spacing = -6 space_spacing = 30 color_tab = TEST_FONT_COLORS 
	LoadFont "boltbt" char_spacing = -3 space_spacing = 40 color_tab = TEST_FONT_COLORS 
	LoadFont "glaser" char_spacing = -3 space_spacing = 40 color_tab = TEST_FONT_COLORS 
	LoadFont "neosans" char_spacing = -6 space_spacing = 30 color_tab = TEST_FONT_COLORS 
	LoadFont "candara" char_spacing = -6 space_spacing = 30 color_tab = TEST_FONT_COLORS 
	LoadFont "baksheesh" char_spacing = -6 space_spacing = 30 color_tab = TEST_FONT_COLORS 
	LoadFont buttons_font 
	PopMemProfile 
	UnloadPreFile "thugpro_fonts.pre" dont_assert 
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
	LoadAsset "models\\specialitems\\pizzabox\\pizzabox.tex" 
	LoadAsset "models\\specialitems\\pizzabox\\pizzabox.skin" parent = %"models\\specialitems\\pizzabox\\pizzabox.tex" 
	LoadAsset "models\\specialitems\\Tongue\\SEC_Gene_Tongue.tex" 
	LoadAsset "models\\specialitems\\Tongue\\SEC_Gene_Tongue.skin" parent = %"models\\specialitems\\Tongue\\SEC_Gene_Tongue.tex" 
	LoadAsset "models\\specialitems\\spraycan_ghetto\\spraycan_ghetto.tex" 
	LoadAsset "models\\specialitems\\spraycan_ghetto\\spraycan_ghetto.skin" parent = %"models\\specialitems\\spraycan_ghetto\\spraycan_ghetto.tex" 
	LoadAsset "models\\specialitems\\BoomBox\\BoomBox.tex" 
	LoadAsset "models\\specialitems\\BoomBox\\BoomBox.skin" parent = %"models\\specialitems\\BoomBox\\BoomBox.tex" 
	LoadAsset "models\\specialitems\\Flag\\Flag.tex" 
	LoadAsset "models\\specialitems\\Flag\\Flag.skin" parent = %"models\\specialitems\\Flag\\Flag.tex" 
	LoadAsset "models\\specialitems\\Guitar\\Guitar.tex" 
	LoadAsset "models\\specialitems\\Guitar\\Guitar.skin" parent = %"models\\specialitems\\Guitar\\Guitar.tex" 
	LoadAsset "models\\specialitems\\Skull\\Skull.tex" 
	LoadAsset "models\\specialitems\\Skull\\Skull.skin" parent = %"models\\specialitems\\Skull\\Skull.tex" 
	LoadAsset "models\\specialitems\\spooky\\si_spooky.tex" 
	LoadAsset "models\\specialitems\\spooky\\si_spooky.mdl" parent = %"models\\specialitems\\spooky\\si_spooky.tex" 
	PopMemProfile 
ENDSCRIPT

SCRIPT load_permanent_anims LoadFunction = LoadAnim 
	animload_thps6_human <...> 
	load_special_item_anims <...> 
ENDSCRIPT

SCRIPT load_permanent_thugpro_anims LoadFunction = LoadAnim 
	animload_thugpro <...> 
	animload_SI_Pizza <...> 
	animload_SI_tongue <...> 
	animload_SI_Boombox <...> 
	animload_si_generic_thugpro <...> 
	animload_SI_Flag2 <...> 
	animload_SI_Skull <...> 
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

SCRIPT network_driver_startup 
	printf "*********************************************" 
	printf "Loading net drivers..." 
	IF LoadNetworkDrivers 
		printf "**** SUCCESS!" 
	ELSE 
		printf "**** FAILURE!" 
	ENDIF 
	printf "*********************************************" 
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
	THUGPRO_ToggeScreenElementScaling on 
ENDSCRIPT

SCRIPT thug_pro_startup_defaults 
	THUGPRO_TogglePermanentPatches 
	THUGPRO_ParkEdHeightPatch off 
	Change temp_parked_height_patch_disabled = 1 
	PrintConfig 
	PushMemProfile "Pre-game initialization" 
	CareerReset 
	ResetArcadeScores 
	GoalManager_SetDifficultyLevel 1 
	SetSfxVolume 100 
	SetMusicVolume 0 
	SetRandomMode 0 
	SetGlobalFlag flag = SOUNDS_SONGORDER_RANDOM 
	VibrationOn 
	Change select_shift = 0 
	Change DEVKIT_LEVELS = 0 
	Change All_Levels_Unlocked = 0 
	Change BUMP_STATS = 1 
	Change has_accepted_dnas = 1 
	Change DontSpoofAdaptor = 1 
	Change UsePreFilesForLevelLoading = 1 
	Change ApplyViewerObjModelToPlayer = 1 
	IF English 
		SetGlobalFlag flag = NO_DISPLAY_CUTSCENE_SUBTITLES 
	ENDIF 
	screen_element_startup 
	SetScreenElementProps { 
		id = root_window 
	} 
	SetServerMode on 
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
ENDSCRIPT

SCRIPT default_system_startup 
ENDSCRIPT

SCRIPT InitializeGameFlow_EMPTY 
	Goto StandardGameFlow_EMPTY 
ENDSCRIPT

SCRIPT ChangeLevelGameFlow_EMPTY 
	SetScreenModeFromGameMode 
	Goto ( STANDARD_GAMEFLOW_SCRIPT ) 
ENDSCRIPT

SCRIPT StandardGameFlow_EMPTY 
ENDSCRIPT

SCRIPT thug_pro_startup_empty 
	Change INITIALIZE_GAMEFLOW_SCRIPT = InitializeGameFlow_EMPTY 
	Change CHANGE_LEVEL_GAMEFLOW_SCRIPT = ChangeLevelGameFlow_EMPTY 
	Change STANDARD_GAMEFLOW_SCRIPT = StandardGameFlow_EMPTY 
	printf "thug_pro_startup_empty" 
	set_theme_thug1_de 
	Change SHOW_STARTUP_LOADING_SCREEN = 0 
	thug_pro_startup_defaults 
	GetCurrentSkaterProfileIndex 
	SetPlayerAppearance { 
		player = <currentSkaterProfileIndex> 
		appearance_structure = appearance_hawk 
	} 
	LoadScene scene = "Default_Sky" 
	SpawnScript thug_pro_startup_empty_spawned 
ENDSCRIPT

SCRIPT thug_pro_startup_empty_spawned 
	BEGIN 
		wait 1 gameframe 
		IF SkatersAreReady 
			BREAK 
		ENDIF 
	REPEAT 
	Skater : RemoveSkaterFromWorld 
	LaunchViewer 
	ToggleViewMode 
	Change view_mode = 1 
	SetViewMode 1 
ENDSCRIPT

SCRIPT thug_pro_startup_developer 
	printf "thug_pro_startup_developer" 
	thug_pro_startup_defaults 
	Change SHOW_STARTUP_LOADING_SCREEN = 1 
	AutoLaunch level = Load_MainMenu game = career 
ENDSCRIPT

SCRIPT thug_pro_startup_function 
	thug_pro_startup_normal 
ENDSCRIPT

SCRIPT thug_pro_startup_normal 
	printf "thug_pro_startup_normal" 
	thug_pro_startup_defaults 
	Change SHOW_STARTUP_LOADING_SCREEN = 1 
	IF Bootstrap 
		Change bootstrap_build = 1 
		Change BUMP_STATS = 0 
		Change All_Levels_Unlocked = 0 
		Change UsePreFilesForLevelLoading = 0 
		AutoLaunch level = Load_MainMenu game = career 
	ELSE 
		AutoLaunch level = Load_MainMenu game = career 
	ENDIF 
ENDSCRIPT

SCRIPT fadein_fadeout text = "you forgot the text" 
	SetProps text = <text> 
	DoMorph time = 0 alpha = 0 
	DoMorph time = 2 alpha = 1 
	wait 5 seconds 
	DoMorph time = 2 alpha = 0 
	DoMorph time = 2 alpha = 0 
ENDSCRIPT

edit_graphics_corp_logo = [ ] 
edit_graphics_graphics = [ ] 
edit_graphics_illustrations = [ ] 
edit_graphics_logos = [ ] 
edit_graphics_odd = [ ] 
edit_graphics_premade = [ ] 

