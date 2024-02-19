use_defined_zone_sizes = 0
lock_framerate = 0
display_framerate_box = 1
framerate_value = 1.0
show_filenames = 1
output_tracking_lines = 0
rail_arrows = 1
show_all_trick_objects = 1
entered_from_autolaunch = 0
DontSpoofAdaptor = 1
viewer_buttons_enabled = 1
enable_view_goals_select_shortcut = 0
wireframe_skins = 0
DEMO_BUILD = 0
GameInformerBuild = 1
auto_change_chapter_and_stage = 0
SHOWPOLYS_ONQUICKVIEW = 1
particle_heap_size = 71680
xenon_particle_heap_size = 4718592
xbox_particle_heap_size = 2097152
particle_options_debug = { show_particle_heap = 1 particle_warning_script = FlexParticleWarning }
assertonmissinganims = 0
RAILNODE_ASSETS_ENABLED = 1
RAILNODE_ASSETS_VEH_ENABLED = 1
clear_abilities = 1
collectors_edition_fake_debug = collectors
navmeshpolys = 2000
navmeshradius = 4000
navmeshalpha = 64

script load_permanent_prefiles 
    LoadPak \{ 'pak/permtex/permtex.pak' is_raw }
endscript

script load_permanent_assets 
    if (debugcomplexstreams = 25395205)
        PushMemProfile 'Audio Stream header'
        LoadStreamHeader 'streams\streams'
        PopMemProfile
        <heap_size> = 2539520
        if IsNGC
            <heap_size> = 1024
        else
            if (IsXbox)
                <heap_size> = (3600 * 1024)
            else
                if isPC
                    <heap_size> = 15728640
                else
                    if IsXenon
                        <heap_size> = 15728640
                    endif
                endif
            endif
        endif
        MemInitHeap name = 'UnloadableAnim' size = <heap_size>
        SetDefaultPermanent 1
        SetReferenceChecksum 0
        create_node_flags
        tod_manager_nodeflags_setup
        if IsPs2
            SetPakSizesArray [ zone_sizes_ps2 pak_sizes_ps2 pak_cap_sizes_ps2 sky_sizes_ps2 ]
        else
            if IsNGC
                SetPakSizesArray [ zone_sizes_ngc pak_sizes_ngc pak_cap_sizes_ngc sky_sizes_ngc ]
            else
                if ((IsXbox)|| (isPC))
                    SetPakSizesArray [ zone_sizes_xbx pak_sizes_xbx pak_cap_sizes_xbx sky_sizes_xbx ]
                else
                    SetPakSizesArray [ zone_sizes_xen pak_sizes_xen pak_cap_sizes_xen sky_sizes_xen ]
                endif
            endif
        endif
        if IsNGC
            LoadPak 'worlds/global/global.pak' localized supress_scene
        else
            LoadPak 'worlds/global/global.pak' localized supress_scene splitfile
        endif
        GetPlatformExt
        LoadPak ('pak/cas/cas_' + <platform_ext> + '.pak')localized
        LoadPak 'pak/z_sm_tattooshop_data/z_sm_tatooshop_data.pak'
        change debugcomplexstreams = 31851312
        if NOT IsPs2
            LoadPak 'pak/fam/fam.pak'
        endif
        InitAnimCompressTable 'anims\standardkeyq.bin' q48
        InitAnimCompressTable 'anims\standardkeyt.bin' t48
        PushMemProfile 'Animation Cache'
        if NOT IsNGC
            InitAnimSystem {
                animheapsize = 131072
                CacheBlockAlign = 1024
                DefCacheType = fullres
                maxanimstages = 2
                maxanimsubsets = 4
                maxdegenerateanims = 3
            }
        else
            InitAnimSystem {
                animheapsize = 0
                CacheBlockAlign = 3072
                DefCacheType = fullres
                maxanimstages = 2
                maxdegenerateanims = 3
                maxanimsubsets = 4
            }
        endif
        PopMemProfile
        GetPlatform
        CreateSkyMap links = SkyLinks
        if NOT IsNGC
            PushMemProfile 'Collision Heap'
            MemInitHeap name = 'Collision' size = 20480
            PopMemProfile
        endif
        PushMemProfile 'Sta³e tekstury cz¹steczek'
        PopMemProfile
        if IsNGC
            do_load_permanent
        endif
        SetDefaultPermanent 0
        Theme_GetFontColors return_value = font_colors
        LoadFont 'testtitle' char_spacing = -2.500 space_spacing = 8 color_tab = <font_colors>
        LoadFont 'newtrickfont' char_spacing = 0 space_spacing = 8 color_tab = newtrickfont_colors
        LoadFont {
            'small'
            char_spacing = 2.200
            space_spacing = 3
            color_tab = <font_colors>
        }
        LoadFont 'newtimerfont' char_spacing = -2.500
        LoadFont {
            'dialog'
            char_spacing = -1
            space_spacing = 8
            color_tab = <font_colors>
        }
        LoadFont buttons_font
    else
        #"0x9741e5bf" ::obj_initmodelfromprofile {struct = Profile_Anl_Pigeon
            use_asset_manager = 1
            texDictOffset = 0
        }
    endif
endscript

script load_net_anims \{ LoadFunction = LoadAnim }
endscript

script init_light_manager 
    InitLightManager \{ max_lights = 2 max_diffuse_lights = 4 max_render_verts_per_geom = 4096 }
    LightManager_SetVertexColorStorageHeap \{ heap = frontendheap }
    LightManager_EnableVertexColorStorage \{ on }
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
        corona_size = 7332.0
        texture = sun
        corona_texture = apm_sun_c_01
        lens_flare_data = lens_flare_data
    }
endscript

script init_loading_bar 
    SetLoadingBarPos \{ x = 258 y = 400 }
    SetLoadingBarSize \{ width = 140 height = 8 }
    SetLoadingBarStartColor \{ r = 0 g = 76 b = 129 }
    SetLoadingBarEndColor \{ r = 176 g = 211 b = 115 }
    SetLoadingBarBorder \{ width = 5 height = 5 }
    SetLoadingBarBorderColor \{ r = 40 g = 40 b = 40 }
endscript
All_Levels_Unlocked = 1
bootstrap_build = 0
UseLevelOverrideStats = 0

script network_driver_startup 
    printf '*** about to write DNAS binary ***'
    NetSessionFunc func = write_dnas_binary
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
    SetScreenElementProps \{id = root_window tags = { menu_state = Off }}
    FireEvent \{ type = focus target = root_window }
    create_panel_stuff
endscript

script default_system_startup 
    setup_gs_idle_proc_params
    AllowAssetLoading Off
    AddEditableList ped_editable_list
    change select_shift = 0
    if NOT IsTrue RAILNODE_ASSETS_ENABLED
        printf 'ALLOC\'D RAILNODE HEAP!!!'
        MemInitHeap name = 'RailNodeHeap' size = (330 * 1024)
    endif
    PushMemProfile 'Pre-game initialization'
    SetupSkaterCareer
    SetStartingLevelFlags
    SetSfxVolume 100
    SetMusicVolume MusicVolOutsideBox
    SetRandomMode 1
    SetGlobalFlag flag = SOUNDS_SONGORDER_RANDOM
    NetSessionFunc func = initialize
    VibrationOn
    if cd
        change UsePreFilesForLevelLoading = 1
        change DEVKIT_LEVELS = 0
        change All_Levels_Unlocked = 0
        change ApplyViewerObjModelToPlayer = 1
    else
        change DontSpoofAdaptor = 0
        change All_Levels_Unlocked = 0
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
    PushMemProfile 'Rail Editor'
    CreateRailEditor
    PopMemProfile
    PreprocessStreamSets
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
            change viewer_buttons_enabled = 1
            if (DEMO_BUILD)
                autolaunch level = Load_Z_MainMenu Game = career
            else
                autolaunch level = Load_Z_MainMenu Game = career
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
        endif
    endif
    SetCurrentSkaterProfile 0
endscript

script Call_Personal_StartUp_Script 
    if ScriptExists startup
        startup
    else
        if NOT cd
            printf bg_color = cyan ''
            printf bg_color = cyan 'WOOT! You are missing a startup script!'
            printf bg_color = cyan 'Does it exist in your user.q?'
            printf bg_color = cyan 'Do you even HAVE a user.q? (it should be yourname.q)'
            printf bg_color = cyan 'The script needs to look something like this:'
            printf bg_color = cyan ''
            printf bg_color = green 'script startup'
            printf bg_color = green '	autolaunch level=load_z_ho game=career'
            printf bg_color = green 'endscript'
            printf bg_color = cyan ''
            scriptassert 'No startup script found! See above for details'
        endif
        printf 'WARNING: Missing the startup script'
        hideloadingscreen
        CreateScreenElement {
            parent = root_window
            type = TextElement
            id = ns_rules
            text = 'Neversoft i Activision 2002'
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
    setprops \{ text = 'Brakuje skryptu startupu' }
    DoMorph \{ time = 0 alpha = 0 }
    DoMorph \{ time = 0.5000 alpha = 1 Scale = 3 }
    DoMorph \{ time = 0.5000 alpha = 1 Scale = 1 }
    wait \{ 5 seconds }
    DoMorph \{ time = 0.5000 alpha = 0 Scale = 0.5000 }
    DoMorph \{ time = 0.5000 alpha = 0 }
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
    main_menu_add_item text = 'Rozpocznij Grê' pad_choose_script = continue_career
    main_menu_add_item {
        text = 'Sterowanie'
        pad_choose_script = bootstrap_displayscreen
        pad_choose_params = { Screen = 'loadscrn_demo_controls' }
    }
    main_menu_add_item {
        text = 'Wiêcej info'
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
        text = 'Neversoft i Activision 2002'
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
    if ObjectExists \{ id = screen_menu }
        DestroyScreenElement \{ id = screen_menu }
    endif
    hideloadingscreen
    create_startup_menu
endscript

script startup_camera_playback 
    KillSkaterCamAnim \{ all }
    UnPauseGame
    PauseSkaters
    PlaySkaterCamAnim \{ skater = 0 name = sch_overview_camera loop }
endscript

script continue_career 
    restore_start_key_binding
    if ObjectExists \{ id = ns_rules }
        DestroyScreenElement \{ id = ns_rules }
    endif
    KillSkaterCamAnim \{ all }
    GoalManager_ShowPoints
    GoalManager_ShowGoalPoints
    MakeSkaterGoto \{ StartSkating1 }
    UnpauseSkaters
    skiptrack
    if ObjectExists \{ id = current_menu_anchor }
        DestroyScreenElement \{ id = current_menu_anchor }
    endif
    SetScreenElementProps \{id = root_window tags = { menu_state = Off }}
endscript

script fadein_fadeout \{ text = 'zapomnia³e tekstu' }
    setprops text = <text>
    DoMorph \{ time = 0 alpha = 0 }
    DoMorph \{ time = 2 alpha = 1 }
    wait \{ 5 seconds }
    DoMorph \{ time = 2 alpha = 0 }
    DoMorph \{ time = 2 alpha = 0 }
endscript
