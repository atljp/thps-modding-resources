
lock_framerate = 0
display_framerate_box = 1
framerate_value = 0.0
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
particle_options_debug = {
    show_particle_heap = 0
    particle_warning_script = FlexParticleWarning
}

script load_permanent_prefiles 
    LoadPreFile 'permtex.pre'
    if NOT IsNGC
        LoadPreFile 'casfiles.pre'
    endif
    if IsNGC
        LoadPreFile 'gcmemicons.pre'
    endif
endscript


script load_permanent_assets 
    printf 'LOADING PERMANENT SHIT HOLY FUCK WOW'
    SetDefaultPermanent 1
    SetReferenceChecksum 0
    LoadPreFile 'skeletons.pre'
    LoadPreFile 'bits.pre'
    InitAnimCompressTable 'anims\standardkeyq.bin' q48
    InitAnimCompressTable 'anims\standardkeyt.bin' t48
    PushMemProfile 'Animation Cache'
    if NOT IsNGC
        InitAnimSystem {
            animheapsize = 337920
            CacheBlockAlign = 3072
            DefCacheType = fullres
            maxdegenerateanims = 3
            maxanimsubsets = 4
        }
    else
        InitAnimSystem {
            animheapsize = 0
            CacheBlockAlign = 3072
            DefCacheType = fullres
            maxdegenerateanims = 3
            maxanimsubsets = 4
        }
    endif
    PopMemProfile
    PushMemProfile 'Collision Heap'
    MemInitHeap name = 'Collision' size = 20480
    PopMemProfile
    PushMemProfile 'Audio Stream header'
    LoadStreamHeader 'streams\streams'
    PopMemProfile
    PushMemProfile 'Permanent Skeletons'
    skeletonload_all
    PopMemProfile
    PushMemProfile 'Permanent Models'
    LoadAsset 'models\arrow\arrow.tex'
    LoadAsset 'models\arrow\arrow.mdl' nocollision = 1 parent = `models\arrow\arrow.tex`
    LoadAsset 'models\special_arrow\special_arrow.tex'
    LoadAsset 'models\special_arrow\special_arrow.mdl' nocollision = 1 parent = `models\special_arrow\special_arrow.tex`
    PushMemProfile 'Menu 3D'
    LoadAsset 'models\gradient_bg\gradient_bg.tex'
    LoadAsset 'models\gradient_bg\gradient_bg.mdl' nocollision = 1 parent = `models\gradient_bg\gradient_bg.tex`
    PopMemProfile
    LoadAsset 'models\gameobjects\scavenger_coin\scavenger_coin.tex'
    LoadAsset 'models\gameobjects\scavenger_coin\scavenger_coin.mdl' nocollision = 1 parent = #"0xaed267d6"
    LoadAsset 'models\HUD_arrow\HUD_arrow.tex'
    LoadAsset 'models\HUD_arrow\HUD_arrow.mdl' nocollision = 1 parent = `models\hud_arrow\hud_arrow.tex`
    LoadAsset 'models\ped_shadow\ped_shadow.tex'
    LoadAsset 'models\ped_shadow\ped_shadow.mdl' nocollision = 1 parent = #"0xc2ca7f0b"
    LoadAsset 'models\goalarrow\goalarrow.tex'
    LoadAsset 'models\goalarrow\goalarrow.mdl' nocollision = 1 parent = `models\goalarrow\goalarrow.tex`
    LoadAsset 'models\cat_bg\cat_bg.tex'
    LoadAsset 'models\cat_bg\cat_bg.mdl' nocollision = 1 parent = #"0x2d3a686d"
    LoadAsset 'models\gameobjects\p1_cursor\p1_cursor.tex'
    LoadAsset 'models\gameobjects\p1_cursor\p1_cursor.mdl' nocollision = 1 parent = `models\gameobjects\p1_cursor\p1_cursor.tex`
    LoadAsset 'models\gameobjects\skate\letter_s\letter_s.tex'
    LoadAsset 'models\gameobjects\skate\letter_s\letter_s.mdl' nocollision = 1 parent = `models\gameobjects\skate\letter_s\letter_s.tex`
    LoadAsset 'models\gameobjects\skate\letter_k\letter_k.tex'
    LoadAsset 'models\gameobjects\skate\letter_k\letter_k.mdl' nocollision = 1 parent = `models\gameobjects\skate\letter_k\letter_k.tex`
    LoadAsset 'models\gameobjects\skate\letter_a\letter_a.tex'
    LoadAsset 'models\gameobjects\skate\letter_a\letter_a.mdl' nocollision = 1 parent = `models\gameobjects\skate\letter_a\letter_a.tex`
    LoadAsset 'models\gameobjects\skate\letter_t\letter_t.tex'
    LoadAsset 'models\gameobjects\skate\letter_t\letter_t.mdl' nocollision = 1 parent = `models\gameobjects\skate\letter_t\letter_t.tex`
    LoadAsset 'models\gameobjects\skate\letter_e\letter_e.tex'
    LoadAsset 'models\gameobjects\skate\letter_e\letter_e.mdl' nocollision = 1 parent = `models\gameobjects\skate\letter_e\letter_e.tex`
    LoadAsset 'models\gameobjects\combo\goal_combo_c\goal_combo_c.tex'
    LoadAsset 'models\gameobjects\combo\goal_combo_c\goal_combo_c.mdl' nocollision = 1 parent = `models\gameobjects\combo\goal_combo_c\goal_combo_c.tex`
    LoadAsset 'models\gameobjects\combo\goal_combo_o\goal_combo_o.tex'
    LoadAsset 'models\gameobjects\combo\goal_combo_o\goal_combo_o.mdl' nocollision = 1 parent = `models\gameobjects\combo\goal_combo_o\goal_combo_o.tex`
    LoadAsset 'models\gameobjects\combo\goal_combo_m\goal_combo_m.tex'
    LoadAsset 'models\gameobjects\combo\goal_combo_m\goal_combo_m.mdl' nocollision = 1 parent = `models\gameobjects\combo\goal_combo_m\goal_combo_m.tex`
    LoadAsset 'models\gameobjects\combo\goal_combo_b\goal_combo_b.tex'
    LoadAsset 'models\gameobjects\combo\goal_combo_b\goal_combo_b.mdl' nocollision = 1 parent = `models\gameobjects\combo\goal_combo_b\goal_combo_b.tex`
    LoadAsset 'models\gameobjects\projectiles\tomato\tomato.tex'
    LoadAsset 'models\gameobjects\projectiles\tomato\tomato.mdl' nocollision = 1 parent = `models\gameobjects\projectiles\tomato\tomato.tex`
    PopMemProfile
    load_special_items
    PushMemProfile 'Permanent Particle Textures'
    LoadParticleTexture 'particles\dt_generic_particle01' perm
    LoadParticleTexture 'bits\particle_test02' perm
    LoadParticleTexture 'bits\sun' perm
    LoadParticleTexture 'bits\apm_sun_C_01' perm
    LoadParticleTexture 'bits\blood_01' perm
    LoadParticleTexture 'bits\splash' perm
    LoadParticleTexture 'bits\snow' perm
    LoadParticleTexture 'particles\dt_nj_flame02' perm
    LoadParticleTexture 'particles\dt_barf02' perm
    #"0xc831952f"
    LoadParticleTexture 'bits\cag_workspace' perm
    #"0xca7a12c0"
    LoadParticleTexture 'particles\apm_spark_4' perm
    if IsXbox
        LoadParticleTexture 'bits\skidtrail' perm
    else
        LoadParticleTexture 'bits\skidtrail_ps2' perm
    endif
    load_permanent_particle_textures
    load_permanent_fast_particle_textures
    load_permanent_shatter_textures
    PopMemProfile
    UnloadPreFile 'skeletons.pre'
    UnloadPreFile 'bits.pre'
    if IsNGC
        do_load_permanent
        do_load_unloadable
    endif
    SetDefaultPermanent 0
    PushMemProfile 'Fonts and Bitmaps'
    Theme_GetFontColors return_value = font_colors
    if NOT IsNGC
        LoadPreFile 'fonts.pre'
    endif
    PushMemProfile 'Fonts'
    LoadFont 'testtitle' char_spacing = 0 space_spacing = 12 color_tab = <font_colors>
    LoadFont 'newtrickfont' char_spacing = 0 space_spacing = 10 color_tab = newtrickfont_colors
    LoadFont 'small' char_spacing = 1.500 space_spacing = 9 color_tab = <font_colors>
    LoadFont 'newtimerfont' char_spacing = -2
    LoadFont 'dialog' char_spacing = -3 space_spacing = 12 color_tab = <font_colors>
    LoadFont buttons_font
    PopMemProfile
    if NOT IsNGC
        UnloadPreFile 'fonts.pre' dont_assert
    endif
    LoadPreFile 'panelsprites.pre'
    load_textures_to_main_memory array = permanent_textures heap = PermanentTextureHeap
    if IsXbox
        load_ps2_textures_to_main_memory
    endif
    load_textures_to_main_memory array = unloadable_textures heap = #"0x33b42c96"
    UnloadPreFile 'panelsprites.pre' dont_assert
    load_theme_textures_to_main_memory
    PopMemProfile
endscript


script load_special_items 
    PushMemProfile 'Special Item Models'
    LoadAsset 'Models\SpecialItems\FranklinKite\franklinkite.tex'
    LoadAsset 'models\specialitems\FranklinKite\franklinkite.skin' parent = #"0x91d71626"
    LoadAsset 'models\specialitems\Sword\SI_Sword.tex'
    LoadAsset 'models\specialitems\Sword\SI_Sword.skin' parent = #"0xeab5211c"
    LoadAsset 'models\specialitems\JugglingBalls\SI_JugglingBalls.tex'
    LoadAsset 'models\specialitems\JugglingBalls\SI_JugglingBalls.skin' parent = #"0x1eefadfd"
    LoadAsset 'models\specialitems\Chainsaw\SI_Chainsaw.tex'
    LoadAsset 'models\specialitems\Chainsaw\SI_Chainsaw.skin' parent = `models\specialitems\chainsaw\si_chainsaw.tex`
    LoadAsset 'models\Animals\Anl_Shark\Anl_shark.tex'
    LoadAsset 'models\Animals\Anl_Shark\Anl_shark.skin' parent = `models\animals\anl_shark\anl_shark.tex`
    LoadAsset 'models\specialitems\spraycan\spraycan.tex'
    LoadAsset 'models\specialitems\spraycan\spraycan.skin' parent = `models\specialitems\spraycan\spraycan.tex`
    LoadAsset 'models\specialitems\spraycan\si_spraycan_double.tex'
    LoadAsset 'models\specialitems\spraycan\SI_SprayCan_Double.skin' parent = `models\specialitems\spraycan\si_spraycan_double.tex`
    LoadAsset 'models\specialitems\Hoagie\si_Hoagie.tex'
    LoadAsset 'models\specialitems\Hoagie\si_Hoagie.skin' parent = #"0x10c192bf"
    LoadAsset 'models\specialitems\DragTires\si_DragTires.tex'
    LoadAsset 'models\specialitems\DragTires\si_DragTires.skin' parent = #"0xe5a2cf0c"
    LoadAsset 'models\specialitems\Flag\SI_Flag.tex'
    LoadAsset 'models\specialitems\Flag\SI_Flag.skin' parent = #"0xb13be7a1"
    LoadAsset 'models\specialitems\bustedboard\bustedboard.tex'
    LoadAsset 'models\specialitems\bustedboard\bustedboard.skin' parent = #"0xc44e3145"
    LoadAsset 'models\specialitems\extraboard\extraboard.tex'
    LoadAsset 'models\specialitems\extraboard\extraboard.skin' parent = `models\specialitems\extraboard\extraboard.tex`
    PopMemProfile
endscript


script load_permanent_anims LoadFunction = LoadAnim
    animload_THPS6_human <...> 
    load_special_item_anims <...> 
endscript


script load_unloadable_anims LoadFunction = LoadAnim
    animload_THPS6_human_unloadable <...> 
endscript


script load_net_anims LoadFunction = LoadAnim
    animload_THPS6_human_net <...> 
    load_special_item_anims <...> 
endscript


script load_special_item_anims LoadFunction = LoadAnim
    animload_SI_Prop_1 <...> 
    animload_SI_Prop2 <...> 
    animload_SI_Prop_3 <...> 
    animload_SI_bustedboard <...> 
    animload_SI_Extraboard <...> 
    animload_SI_FranklinKite <...> 
    animload_SI_shark <...> 
    animload_SI_flag <...> 
endscript


script init_light_manager 
    InitLightManager max_lights = 2 max_diffuse_lights = 3
endscript


script uninit_light_manager 
    UninitLightManager
endscript


script init_environment 
    InitSun {
        theta = (3.142 / 4.0)
        phi = (3.142 / 6.0)
        Radius = 18000.0
        size = 7332.0
        texture = sun
        corona_texture = apm_sun_c_01
        lens_flare_data = lens_flare_data
    }
endscript


script init_loading_bar 
    SetLoadingBarPos x = 258 y = 400
    SetLoadingBarSize width = 140 height = 8
    SetLoadingBarStartColor r = 0 g = 76 b = 129
    SetLoadingBarEndColor r = 176 g = 211 b = 115
    SetLoadingBarBorder width = 5 height = 5
    SetLoadingBarBorderColor r = 40 g = 40 b = 40
endscript

All_Levels_Unlocked = 0
bootstrap_build = 0
UseLevelOverrideStats = 0

script network_driver_startup 
    writednasbinary
    printf '*********************************************'
    printf 'Loading net drivers...'
    if LoadNetworkDrivers
        printf '**** SUCCESS!'
    else
        printf '**** FAILURE!'
    endif
    printf '*********************************************'
endscript


script screen_element_startup 
    ScreenElementSystemInit
    setup_main_button_event_mappings
    SetScreenElementProps {
        id = root_window
        tags = { menu_state = Off }
    }
    FireEvent type = focus target = root_window
    create_panel_stuff
endscript


script default_system_startup 
    change select_shift = 0
    PushMemProfile 'Pre-game initialization'
    SetStartingLevelFlags
    #"0x2cee1330"
    #"0xff5efddb"
    SetSfxVolume 100
    SetMusicVolume MusicVolOutsideBox
    SetRandomMode 1
    SetGlobalFlag flag = SOUNDS_SONGORDER_RANDOM
    VibrationOn
    if cd
        change UsePreFilesForLevelLoading = 1
        change DEVKIT_LEVELS = 0
        change All_Levels_Unlocked = 0
        change ApplyViewerObjModelToPlayer = 1
    else
        change All_Levels_Unlocked = 1
    endif
    if IsNGC
        change UsePreFilesForLevelLoading = 1
    endif
    screen_element_startup
    SetScreenElementProps id = root_window event_handlers = [{ pad_start NullScript }] replace_handlers
    printf 'replace_handlers to take away start key in load_level'
    SetServerMode on
    SetJoinMode JOIN_MODE_PLAY
    PushMemProfile 'Start & Join Server'
    StartServer
    JoinServer <...> 
    PopMemProfile
    PushMemProfile 'Goal Editor'
    CreateGoalEditor
    PopMemProfile
    PushMemProfile 'Rail Editor'
    CreateRailEditor
    PopMemProfile
    PopMemProfile
    if English
        SetGlobalFlag flag = NO_DISPLAY_CUTSCENE_SUBTITLES
    endif
    if Bootstrap
        change bootstrap_build = 1
        change STARTGAME_FIRST_TIME = 1
        change bump_stats = 0
        change All_Levels_Unlocked = 0
        autolaunch level = load_sch Game = career
    else
        if cd
            EnableScriptPrintf 0
            change bump_stats = 1
            change has_accepted_dnas = 0
            change DontSpoofAdaptor = 1
            change viewer_buttons_enabled = 0
            if (DEMO_BUILD)
                autolaunch level = load_mainmenu Game = career
            else
                autolaunch level = load_mainmenu Game = career
            endif
        else
            cheat_select_shift
            if NOT IsTrue DontSpoofAdaptor
                auto_launch_viewer
            endif
            cheat_give_neversoft_skaters
            if NOT IsTrue DontSpoofAdaptor
                LaunchScriptDebugger
            endif
            change SkipDNASAuthentication = 1
        endif
    endif
endscript


script Call_Personal_StartUp_Script 
    if ScriptExists startup
        startup
    else
        printf 'WARNING: Missing the startup script'
        hideloadingscreen
        CreateScreenElement {
            parent = root_window
            type = TextElement
            id = ns_rules
            text = 'Neversoft and Activision 2002'
            font = newtrickfont
            Pos = (320.0, 420.0)
            rgba = [ 140 128 128 55 ]
            Scale = 0.6000
            just = [ center center ]
            not_focusable
        }
        RunScriptOnScreenElement id = ns_rules missing_startup
    endif
    SFX_SetOutsideVolAtTopOfLevel
endscript


script missing_startup 
    begin 
    setprops text = 'Missing Script Startup'
    DoMorph time = 0 alpha = 0
    DoMorph time = 0.5000 alpha = 1 Scale = 3
    DoMorph time = 0.5000 alpha = 1 Scale = 1
    wait 5 seconds
    DoMorph time = 0.5000 alpha = 0 Scale = 0.5000
    DoMorph time = 0.5000 alpha = 0
    repeat 
endscript

STARTGAME_FIRST_TIME = 0

script create_startup_menu 
    hideloadingscreen
    GoalManager_HidePoints
    GoalManager_HideGoalPoints
    if ObjectExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
        wait 1 Game frame
    endif
    KillSkaterCamAnim all
    PlaySkaterCamAnim name = SS_MenuCam Play_hold
    SetMemThreadSafe Off
    make_new_skateshop_menu {
        Pos = (205.0, 109.0)
        internal_just = [ center center ]
        menu_id = startup_menu
        vmenu_id = startup_vmenu
        menu_title = ''
    }
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        texture = THPS4
        Pos = (320.0, 132.0)
        Scale = (1.399999976158142, 1.0)
        z_priority = 2
    }
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        texture = options_bg
        draw_behind_parent
        Pos = (321.0, 115.0)
        Scale = (1.1699999570846558, 1.100000023841858)
        just = [ center top ]
        rgba = [ 128 128 128 128 ]
        z_priority = 0
    }
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        id = startup_menu_blue_bar
        texture = stats_notch
        Pos = (312.0, 369.0)
        rgba = [ 42 48 77 50 ]
        Scale = (14.0, 0.20000000298023224)
        just = [ center top ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        id = startup_menu_box_top
        texture = level_top_piece
        Pos = (321.0, 145.0)
        rgba = [ 128 128 128 80 ]
        Scale = <Scale>
        just = [ center top ]
    }
    begin 
    GetStackedScreenElementPos y id = <id>
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        texture = level_repeat_mid
        Pos = <Pos>
        Scale = <Scale>
        rgba = [ 128 128 128 80 ]
        just = [ left top ]
    }
    repeat 5
    GetStackedScreenElementPos y id = <id>
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        texture = level_bottom_piece
        Pos = <Pos>
        rgba = [ 128 128 128 80 ]
        Scale = (0.9599999785423279, 1.0)
        just = [ left top ]
    }
    CreateScreenElement {
        type = TextElement
        parent = current_menu
        font = small
        text = ''
        not_focusable
    }
    SetScreenElementProps {
        id = root_window
        event_handlers = [{ pad_start continue_career }]
        replace_handlers
    }
    main_menu_add_item text = 'Start Game' pad_choose_script = continue_career
    main_menu_add_item {
        text = 'Controls'
        pad_choose_script = bootstrap_displayscreen
        pad_choose_params = { Screen = 'loadscrn_demo_controls' }
    }
    main_menu_add_item {
        text = 'More Info'
        pad_choose_script = bootstrap_displayscreen
        pad_choose_params = { Screen = 'loadscrn_marketing' }
    }
    printf 'create_Startup_menu'
    RunScriptOnScreenElement id = startup_menu menu_onscreen
    printf 'step2'
    CreateScreenElement {
        parent = root_window
        type = TextElement
        id = ns_rules
        text = 'Neversoft and Activision 2002'
        font = newtrickfont
        Pos = (320.0, 420.0)
        rgba = [ 140 128 128 55 ]
        Scale = 0.6000
        just = [ center center ]
        not_focusable
    }
    startup_camera_playback
    change STARTGAME_FIRST_TIME = 0
    printf 'step3'
endscript


script exit_screen_menu 
    if ObjectExists id = screen_menu
        DestroyScreenElement id = screen_menu
    endif
    hideloadingscreen
    create_startup_menu
endscript


script startup_camera_playback 
    KillSkaterCamAnim all
    UnPauseGame
    PauseSkaters
    PlaySkaterCamAnim skater = 0 name = sch_overview_camera loop
endscript


script continue_career 
    restore_start_key_binding
    if ObjectExists id = ns_rules
        DestroyScreenElement id = ns_rules
    endif
    KillSkaterCamAnim all
    GoalManager_ShowPoints
    GoalManager_ShowGoalPoints
    MakeSkaterGoto StartSkating1
    UnpauseSkaters
    skiptrack
    if ObjectExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    SetScreenElementProps {
        id = root_window
        tags = { menu_state = Off }
    }
endscript


script fadein_fadeout text = 'you forgot the text'
    setprops text = <text>
    DoMorph time = 0 alpha = 0
    DoMorph time = 2 alpha = 1
    wait 5 seconds
    DoMorph time = 2 alpha = 0
    DoMorph time = 2 alpha = 0
endscript

