UsePreFilesForLevelLoading = 0
fake_net = 0
assertonmissingscripts = 0
assertonmissingassets = 1
AlwaysDump = 0
next_level_script = NullScript
InStreamingLevel = 0
update_transition_nodes = 0
LastLoadedGameType = 0
ClassicModeNavMeshLoaded = 0
dont_call_zone_init_hack = 0

script cleanup_before_changing_level_unload_all_paks 
    printf 'cleanup_before_changing_level_unload_all_paks'
    if InFrontend
        if IsTrue EG_pak_always_in_frontend
            BeginUnloadPak 'pak/CAGR_assets/CAGR_assets.pak' localized
            EndUnloadPak 'pak/CAGR_assets/CAGR_assets.pak' localized
            change EG_pak_loaded = 0
        endif
    endif
    if ((InFrontend)|| (IsTrue entering_cas_store))
        BeginUnloadPak 'pak/CAS_common/CAS_common.pak' localized
        EndUnloadPak 'pak/CAS_common/CAS_common.pak' localized
        StopKeyboardHandler
        if NOT IsNGC
            if NOT (cas_store_pak_file = '')
                BeginUnloadPak (cas_store_pak_file)
                wait 2 gameframes
                EndUnloadPak (cas_store_pak_file)
                change cas_store_pak_file = ''
            endif
        endif
        if IsTrue entering_cas_store
            GetCurrentSkaterProfileIndex
            DestroyPlayerAppearanceCache profile = <currentSkaterProfileIndex>
            change entering_cas_store = 0
        endif
    endif
    BeginUnloadPak 'worlds/worldZones/z_world/z_world.pak'
    EndUnloadPak 'worlds/worldZones/z_world/z_world.pak'
    BeginUnloadPak 'worlds/worldZones/z_bus/z_bus.pak'
    EndUnloadPak 'worlds/worldZones/z_bus/z_bus.pak'
    if (LastLoadedGameType = 1)
        printf 'unloading singleplayer pak...'
        BeginUnloadPak 'pak/singleplayer/singleplayer.pak'
        EndUnloadPak 'pak/singleplayer/singleplayer.pak'
    endif
    if (LastLoadedGameType = 2)
        printf 'unloading multiplayer pak...'
        BeginUnloadPak 'pak/multiplayer/multiplayer.pak'
        EndUnloadPak 'pak/multiplayer/multiplayer.pak'
    endif
    change LastLoadedGameType = 0
    if NOT cd
        BeginUnloadPak 'worlds/worldZones/z_viewer/z_viewer_extra.pak'
        EndUnloadPak 'worlds/worldZones/z_viewer/z_viewer_extra.pak'
    endif
    LoadSkaterParts unload
    do_unload_unloadable
    DeinitializeNavMeshAsset
    if (ClassicModeNavMeshLoaded = 1)
        change ClassicModeNavMeshLoaded = 0
        GetLevelStructureName
        if StructureContains structure = (<level_structure_name>)classic_mode_navmesh
            <NavMesh> = (<level_structure_name>.classic_mode_navmesh)
            BeginUnloadPak (<NavMesh> + '.pak')
            EndUnloadPak (<NavMesh> + '.pak')
        endif
    else
        BeginUnloadPak 'worlds/worldZones/Z_NavMesh/Z_NavMesh.pak'
        EndUnloadPak 'worlds/worldZones/Z_NavMesh/Z_NavMesh.pak'
    endif
    cleanup_arbitrary_game_mode_settings
    printf 'cleanup_before_changing_level_unload_all_paks done'
endscript

script cleanup_arbitrary_game_mode_settings 
    if ScreenElementExists id = level_menu
        DestroyScreenElement id = level_menu
        level_select_unload
    endif
    if GetGlobalFlag flag = CAREER_ONETIMEINTRO
        if NOT InFrontend
            z_storyselect_asset_cleanup
            z_storyselect_kill_skaters
            UnsetGlobalFlag flag = CAREER_ONETIMEINTRO
        endif
    endif
    if IsTrue cat_pak_is_loaded
        cat_unload_pak
    endif
    if IsTrue EG_pak_loaded
        if InFrontend
            if NOT IsTrue EG_pak_always_in_frontend
                BeginUnloadPak 'pak/CAGR_assets/CAGR_assets.pak' localized
                EndUnloadPak 'pak/CAGR_assets/CAGR_assets.pak' localized
                change EG_pak_loaded = 0
            endif
        endif
    endif
    memcard_panic_cleanup
    destroy_onscreen_keyboard
    KillSpawnedScript name = check_card
    KillSpawnedScript name = CheckForCardRemoval
    change main_menu_jump_to_cas = 0
    if globalexists name = entered_cas_from_main
        change entered_cas_from_main = 0
    endif
    change EG_in_create_a_graphic = 0
endscript

script cleanup_before_changing_level_unload_zones 
    BeginUnloadAllZones
    if IsSkyLoaded
        BeginUnloadSky
        unloading_sky = 1
    endif
    if NOT GotParam \{ do_not_wait }
        wait \{ 2 gameframe }
    endif
    EndUnloadAllZones
    if GotParam \{ unloading_sky }
        EndUnloadSky
    endif
    DestroyZoneMap
endscript

script cleanup_before_changing_level 
    PauseObjects
    printf 'cleanup_before_changing_level'
    change is_changing_levels = 1
    change load_bike = 0
    if IsTrue cat_pak_is_loaded
        cat_cleanup
    endif
    if IsCreated skater
        if skater ::IsSkaterOnBike
            skater ::cleanup_bike_for_change_level
        endif
        if NOT IsObserving
            skater ::ClearPanel_Landed
            skater ::StatsManager_Deactivate
        endif
    endif
    SetMusicLooping 0
    SFX_Music_Volume_Box_Kill_State
    skater ::vibrate Off
    if InSplitScreenGame
        if ObjectExists id = skater2
            skater2 ::vibrate Off
        endif
    endif
    GetArraySize scripts_to_kill_when_changing_levels
    <index> = 0
    begin 
    KillSpawnedScript name = (scripts_to_kill_when_changing_levels [ <index> ])
    <index> = (<index> + 1)
    repeat <array_size>
    if LevelIs load_sk5ed
        SwitchOffRailEditor
    endif
    game_progress_process_cleanup
    TODManager_AllowTempTOD 1
    if NOT InNetGame
        hide_everything
    endif
    kill_blur
    if InSplitScreenGame
        if InFrontend
            do_not_wait = 1
        endif
    endif
    if GotParam from_movie
        do_not_wait = 1
    endif
    change update_transition_nodes = 0
    change dont_call_zone_init_hack = 1
    FinishPendingZoneLoads
    if NOT GotParam do_not_wait
        wait 3 gameframes
    endif
    change dont_call_zone_init_hack = 0
    KillSpawnedScript name = mission_init_add_zone_sensitive_goals
    GoalManager_DeactivateAllGoals force_all
    if NOT SkaterCamAnimFinished name = thaw_transition_cam
        printf 'cleaning up transition camera'
        SetScreenEffectsNoiseParams {
            on = 0
            intensity = 0
        }
        StopStream Camera_Int_Perspective
    endif
    KillSkaterCamAnim all
    KillObjectAnim all
    ScreenElementSystemCleanup
    cleanup_before_changing_level_unload_all_paks <...> 
    cleanup_before_changing_level_unload_zones <...> 
    printf 'cleanup_before_changing_level done'
    UnpauseObjects
endscript

script cleanup_before_loading_level 
    printf \{ '*********************** cleanup_before_loading_level' }
    cleanup <...> 
    StopMusic
    PauseMusic
    ClearMusicTrackList
endscript

script request_level 
    if GotParam \{ level }
        RequestLevel <level>
    else
        script_assert \{ 'request_level needs a level param' }
    endif
endscript

script LoadLevel 
    MemPushContext \{ 0 }
    ScreenElementSystemCleanup
    LaunchLevel <...> 
    MemPopContext
endscript
SkaterCareerParams = {
    level_table = [
        {
            names = [ 'z_mainmenu' 'mainmenu' ]
            include_in_all_gaps_check = 0
            is_frontend = 1
        }
        {
            names = [ 'z_ho' 'ho' ]
            include_in_all_gaps_check = 1
            is_frontend = 0
        }
        {
            names = [ 'z_bh' 'bh' ]
            include_in_all_gaps_check = 1
            is_frontend = 0
        }
        {
            names = [ 'z_dt' 'dt' ]
            include_in_all_gaps_check = 1
            is_frontend = 0
        }
        {
            names = [ 'z_el' 'el' ]
            include_in_all_gaps_check = 1
            is_frontend = 0
        }
        {
            names = [ 'z_sm' 'sm' ]
            include_in_all_gaps_check = 1
            is_frontend = 0
        }
        {
            names = [ 'z_oi' 'oi' ]
            include_in_all_gaps_check = 1
            is_frontend = 0
        }
        {
            names = [ 'z_lv' 'lv' ]
            include_in_all_gaps_check = 1
            is_frontend = 0
        }
        {
            names = [ 'z_sr' 'sr' ]
            include_in_all_gaps_check = 1
            is_frontend = 0
        }
        {
            names = [ 'z_at' 'at' ]
            include_in_all_gaps_check = 1
            is_frontend = 0
            collectors_edition_only
        }
        {
            names = [ 'z_ch' 'ch' ]
            include_in_all_gaps_check = 1
            is_frontend = 0
        }
        {
            names = [ 'z_dn' 'dn' ]
            include_in_all_gaps_check = 1
            is_frontend = 0
        }
        {
            names = [ 'z_ja' 'ja' ]
            include_in_all_gaps_check = 1
            is_frontend = 0
        }
        {
            names = [ 'z_ma' 'ma' ]
            include_in_all_gaps_check = 1
            is_frontend = 0
        }
        {
            names = [ 'z_ms' 'ms' ]
            include_in_all_gaps_check = 1
            is_frontend = 0
            collectors_edition_only
        }
        {
            names = [ 'z_sz' 'sz' ]
            include_in_all_gaps_check = 1
            is_frontend = 0
        }
        {
            names = [ 'z_sv' 'sv' ]
            include_in_all_gaps_check = 1
            is_frontend = 0
        }
        {
            names = [ 'z_sv2' 'sv2' ]
            include_in_all_gaps_check = 1
            is_frontend = 0
        }
        {
            names = [ 'sk5ed' 'sk5ed_gameplay' ]
            include_in_all_gaps_check = 0
            is_frontend = 0
        }
        {
            names = [ 'Standard' ]
            include_in_all_gaps_check = 0
            is_frontend = 0
        }
        {
            names = [ 'Z_TestLevel' 'testlevel' ]
            include_in_all_gaps_check = 0
            is_frontend = 0
        }
        {
            names = [ 'z_Test_NN' 'Test_NN' ]
            include_in_all_gaps_check = 0
            is_frontend = 0
        }
        {
            names = [ 'z_viewer' 'viewer' ]
            include_in_all_gaps_check = 0
            is_frontend = 0
        }
        {
            names = [ 'z_storyselect' ]
            include_in_all_gaps_check = 0
            is_frontend = 0
        }
    ]
}

script LoadLevelPreFile 
    if IsTrue \{ UsePreFilesForLevelLoading }
        LoadPreFile <...> 
    endif
endscript

script LoadSkaterParts {
        pak_files = [ 
        'pak\skaterparts\skaterparts.pak'
         ]
    }
    if GotParam unload
        printf 'Unloading skater parts...'
    else
        printf 'Loading Skater Parts...'
    endif
    GetArraySize <pak_files>
    index = 0
    if NOT IsTrue cas_artist
        begin 
        if GotParam unload
            printf (<pak_files> [ <index> ])
            BeginUnloadPak (<pak_files> [ <index> ])
            EndUnloadPak (<pak_files> [ <index> ])
        else
            printf (<pak_files> [ <index> ])
            LoadPak (<pak_files> [ <index> ])is_raw
        endif
        index = (<index> + 1)
        repeat <array_size>
    endif
endscript

script load_level COIM_size = 1331200
    load_level_handle_loading_screen <...> 
    change update_transition_nodes = 0
    if (<is_streaming_level> = 1)
        change InStreamingLevel = 1
        change UsePreFilesForLevelLoading = 0
    else
        change InStreamingLevel = 0
        change UsePreFilesForLevelLoading = 1
    endif
    if GotParam park_editor
        change InStreamingLevel = 0
        change UsePreFilesForLevelLoading = 0
    endif
    Change_Sky sky = 'default_sky'
    TODManager_Reset
    if NOT GotParam is_streaming_level
        is_streaming_level = 0
    endif
    if (<is_streaming_level> = 1)
        if NOT GotParam stream_load
        endif
        if GotParam stream_load
            BlockPakSceneSetting on
        endif
        Zone_SetAppropriateMap <...> 
    endif
    if InNetGame
        printf 'I think it\'s a net game, I\'m an idiot'
    else
        printf 'Not a net game, I\'m not as dumb as I look'
    endif
    if InNetGame
        if NOT IsObserving
            ExitSurveyorMode
        endif
    endif
    if NOT InNetGame
        if NOT GotParam park_editor
            do_load_permanent
        endif
    endif
    load_level_handle_ambient_sfx ambient_track = <ambient_track>
    kill_start_key_binding
    printf 'replace_handlers to take away start key in load_level'
    SetScoreAccumulation 0
    SetScoreDegradation 0
    if ObjectExists id = skater
        if skater ::IsLocalSkater
            skater ::transitionExit
        endif
    endif
    if InSplitScreenGame
        UnsetGlobalFlag flag = CHEAT_DISCO
    endif
    printf '@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'
    printf '@@@ LOADLEVEL'
    if EnteringNetGame
        if OnServer
            printf '@@@ AS SERVER'
        else
            printf '@@@ AS CLIENT'
        endif
    else
        printf '@@@ NON NET GAME'
    endif
    if CompositeObjectExists name = main_menu_camera
        main_menu_camera ::Die
    endif
    restore_skater_camera
    exit_pause_menu
    CareerStartLevel structure_name = <structure_name>
    load_level_tod_set_default <tod_manager_params>
    if NOT InNetGame
        PushMemProfile 'Path Manager'
        AllocatePathManMemory maxlinks = 60 maxobjectsperpath = 20 maxpedsperpath = 1
        PopMemProfile
    endif
    ResetLevelFlags
    if GotParam scnpre
        if NOT InNetGame
            LoadLevelPreFile <scnpre>
        else
            LoadLevelPreFile (<level> + 'scn_net.pre')
        endif
    endif
    if GotParam park_editor
        SetPakZoneFolder 'Worlds/CreateAPark/'
        CreateZoneMap links = CAPZones force_size = 1024
        LoadParkEditorPaks {sky_pak = <sky_pak> outer_shell_pak = <outer_shell_pak> Asset_pak = <Asset_pak>}
    else
        if (<is_streaming_level> = 0)
            if GotParam sky
                LoadScene scene = <sky>
            endif
            if GotParam level
                if InNetGame
                    LoadScene scene = <level> is_net
                else
                    LoadScene scene = <level>
                endif
            endif
        endif
    endif
    if GotParam level_name
        SetLevelName <level_name>
    else
        SetLevelName <level>
    endif
    if GotParam scnpre
        if NOT InNetGame
            UnloadPreFile <scnpre> dont_assert
        else
            UnloadPreFile (<level> + 'scn_net.pre')dont_assert
        endif
    endif
    if (IsNGC)
        if NOT InMultiPlayerGame
            if GotParam pedpre
                LoadPreFile <pedpre> dont_assert
            endif
        endif
    endif
    if NOT IsPs2
        if GotParam pre
            LoadLevelPreFile <pre>
        endif
    endif
    if GotParam qb
        if (<is_streaming_level> = 0)
            NodeArrayManLoad <qb>
            PFXManLoad <qb>
        endif
    endif
    if IsPs2
        if GotParam pre
            LoadLevelPreFile <pre>
        endif
    endif
    InitNavNodeManager
    if (<is_streaming_level> = 1)
        if NOT GotParam stream_load
            if NOT InMultiPlayerGame
                if GameModeEquals is_career
                    if IsNGC
                        MemPushContext VMHeapBottomUp
                    endif
                    if NOT InFrontend
                        PushMemProfile 'Goal Heap'
                        if IsXenon
                            MemInitHeap name = 'GoalHeap' size = 7340032
                        else
                            if (IsXbox)
                                MemInitHeap name = 'GoalHeap' size = 1000000
                            else
                                if (isPC)
                                    MemInitHeap name = 'GoalHeap' size = 10000000
                                else
                                    MemInitHeap name = 'GoalHeap' size = 409600
                                endif
                            endif
                        endif
                        PopMemProfile
                    endif
                    if IsNGC
                        MemPopContext
                    endif
                endif
            endif
            if NOT InMultiPlayerGame
                if NOT ChecksumEquals a = <structure_name> b = Level_Z_Test_NN
                    SetupCOIM size = Generic_COIM_Size
                    if GameModeEquals is_career
                        resv_size = (Generic_COIM_Size - Career_PedLife_COIM_Size)
                    else
                        resv_size = (Generic_COIM_Size - NonCareer_PedLife_COIM_Size)
                    endif
                    COIM_PreAllocate size = <resv_size>
                endif
            endif
            PushMemProfile 'Z_World Pak File'
            LoadPak 'worlds/worldZones/z_world/z_world.pak'
            PopMemProfile
            ParseNodeArray
            if NOT InMultiPlayerGame
                if GameModeEquals is_career
                    if NOT ChecksumEquals a = <structure_name> b = level_z_viewer
                        LoadPak 'worlds/worldZones/z_bus/z_bus.pak'
                        ParseNodeArray
                    endif
                endif
            endif
            if ((GameModeEquals is_career)|| (GameModeEquals is_singlesession))
                printf 'loading singleplayer pak...'
                LoadPak 'pak/singleplayer/singleplayer.pak'
                change LastLoadedGameType = 1
            else
                printf 'loading multiplayer pak...'
                LoadPak 'pak/multiplayer/multiplayer.pak'
                change LastLoadedGameType = 2
            endif
            ParseNodeArray
            if NOT InFrontend
                if NOT InMultiPlayerGame
                    printf 'Initializing PedParts Heap'
                    if IsXenon
                        MemInitHeap name = 'PedParts' size = (30 * 1024 * 1024)
                    else
                        if IsXbox
                            MemInitHeap name = 'PedParts' size = ((2 * (1024 * 1024))+ (768 * 1024))
                        else
                            if isPC
                                MemInitHeap name = 'PedParts' size = (30 * 1024 * 1024)
                            else
                                if IsNGC
                                    MemInitHeap name = 'PedParts' size = (1470 * 1024)
                                else
                                    MemInitHeap name = 'PedParts' size = 1643824
                                endif
                            endif
                        endif
                    endif
                endif
            else
                LoadPak 'pak/CAS_common/CAS_common.pak' localized
                if IsTrue EG_pak_always_in_frontend
                    LoadPak 'pak/CAGR_assets/CAGR_assets.pak' heap = unloadableanim localized
                    change EG_pak_loaded = 1
                endif
            endif
            if NOT InFrontend
                PreAllocSplats
            endif
            <want_net_pak> = 0
            if (((InNetGame)|| (InSplitScreenGame))& (IsPs2))
                if NOT GetGlobalFlag flag = CAREER_ONETIMEINTRO
                    <want_net_pak> = 1
                endif
            endif
            if GetGlobalFlag flag = CAREER_ONETIMEINTRO
                SetGameType freeskate2p
                SetCurrentGameType
            endif
            if NOT InNetGame
                if NOT InFrontend
                    if NOT ChecksumEquals a = <structure_name> b = level_z_viewer
                        if GameModeEquals is_classic
                            if GotParam classic_mode_navmesh
                                LoadPak (<classic_mode_navmesh> + '.pak')
                                InitializeNavMeshAsset (<classic_mode_navmesh> + '.nav')
                                change ClassicModeNavMeshLoaded = 1
                            endif
                        else
                            LoadPak 'worlds/worldZones/Z_NavMesh/Z_NavMesh.pak'
                            InitializeNavMeshAsset 'worlds/worldZones/Z_NavMesh/Z_NavMesh.nav'
                            change ClassicModeNavMeshLoaded = 0
                        endif
                    endif
                endif
            endif
            if (<want_net_pak> = 1)
                StartPakLoad zone = (<level> + '_net')
            else
                StartPakLoad zone = <level>
            endif
            FinishPendingZoneLoads
            if GetGlobalFlag flag = CAREER_ONETIMEINTRO
                SetGameType career
                SetCurrentGameType
            endif
        endif
    endif
    if GotParam qb
        preloadmodels
    endif
    PushMemProfile 'Level-specific QB files'
    if GotParam level_qb
        UnloadQB <level_qb>
        if (<is_streaming_level> = 0)
            LoadQB <level_qb> levelspecific
        endif
    endif
    if GotParam level_sfx_qb
        LoadQB <level_sfx_qb> levelspecific
    endif
    load_level_tod_finalize <tod_manager_params> instant
    PopMemProfile
    if (<is_streaming_level> = 1)
    endif
    SetThisLevelSoundBanks ThisLevel = <level>
    if GotParam park_editor
    else
        SetTerrainDefault
        if GotParam qb
            LoadTerrain
        endif
    endif
    startup_handle_stats <...> 
    SetAllStats value = 0
    if GameModeEquals is_classic
        if GotParam default_stats_classic
            if (level_stats = 1)
                SetAllStats value = <default_stats_classic>
            endif
        endif
    else
        if GotParam default_stats
            if (level_stats = 1)
                SetAllStats value = <default_stats>
            endif
        endif
    endif
    if ScriptExists LoadObjectAnims
        PushMemProfile 'Objektanimationen'
        LoadObjectAnims
        PopMemProfile
    endif
    PushMemProfile 'Particle Textures'
    if (<is_streaming_level> = 0)
        if ScriptExists LoadAllParticleTextures
            LoadAllParticleTextures
        endif
    endif
    if (<is_streaming_level> = 1)
        FormatText checksumname = load_particle_texture_script '%i_load_particle_textures' i = <level>
        if ScriptExists <load_particle_texture_script>
            <load_particle_texture_script>
        endif
        FormatText checksumname = load_fast_particle_texture_script '%i_load_fast_particle_textures' i = <level>
        if ScriptExists <load_fast_particle_texture_script>
            <load_fast_particle_texture_script>
        endif
    else
        if ScriptExists load_level_particle_textures
            load_level_particle_textures
        endif
        if ScriptExists load_level_fast_particle_textures
            load_level_fast_particle_textures
        endif
    endif
    if ScriptExists load_cutscene_particle_textures
        load_cutscene_particle_textures
    endif
    if ScriptExists load_cutscene_fast_particle_textures
        load_cutscene_fast_particle_textures
    endif
    PopMemProfile
    if GotParam extranetanimsscript
        if InNetGame
            printf '                    WE\'RE IN A NET GAME!!!!!!!!!!!!!'
            PushMemProfile 'Level Specific Anims'
            <extranetanimsscript>
            PopMemProfile
        endif
    endif
    if GotParam setup_script
        <setup_script>
    endif
    if NOT IsNGC
        if GotParam pre
            UnloadPreFile <pre> dont_assert
        endif
    endif
    if NOT (IsNGC)
        if NOT InMultiPlayerGame
            if GotParam pedpre
                UnloadPreFile <pedpre> dont_assert
            endif
        endif
    endif
    if InFrontend
        SetAllowMovieTransition 0
    else
        SetAllowMovieTransition 1
    endif
    PushMemProfile 'Level Collision decompressed PIP + Supersectors'
    if IsTrue UsePreFilesForLevelLoading
        if GotParam colpre
            if NOT InNetGame
                LoadPipPre <colpre> heap = bottomup
            else
                if GotParam park_editor
                    LoadPipPre <colpre> heap = bottomup
                else
                    LoadPipPre (<level> + 'col_net.pre')heap = bottomup
                endif
            endif
        endif
    endif
    if (<is_streaming_level> = 0)
        if InNetGame
            if NOT GotParam park_editor
                LoadCollision scene = <level> is_net
            endif
        else
            if NOT GotParam park_editor
                LoadCollision scene = <level>
            endif
        endif
    endif
    PopMemProfile
    if GotParam park_editor
    else
        if GotParam qb
            if (<is_streaming_level> = 0)
                ParseNodeArray
            endif
            CleanUpAndRemoveSymbol triggerscripts
            CleanUpAndRemoveSymbol LoadAllParticleTextures
            CleanUpAndRemoveSymbol load_level_particle_textures
            CleanUpAndRemoveSymbol load_level_fast_particle_textures
            CleanUpAndRemoveSymbol load_cutscene_particle_textures
            CleanUpAndRemoveSymbol load_cutscene_fast_particle_textures
            CleanUpAndRemoveSymbol LoadTerrain
            CleanUpAndRemoveSymbol load_level_anims
            CleanUpAndRemoveSymbol LoadCameras
            CleanUpAndRemoveSymbol LoadObjectAnims
        endif
    endif
    if GameModeEquals is_classic
        if NOT InFrontend
            AddGoal_TimedScoreRun zone = <level>
        endif
    endif
    if GotParam uber_frig_height
        change uber_frig_current_height = <uber_frig_height>
    else
        change uber_frig_current_height = uber_frig_default_height
    endif
    setup_classic_stat_nodes level = <level>
    SFX_refresh_music_box_triggers
    PushMemProfile 'Permanent & semi-permanent anims'
    if NOT GotParam park_editor
        if NOT InFrontend
            do_load_unloadable
        endif
    endif
    PopMemProfile
    if NOT IsNGC
        if InFrontend
            LoadSkaterParts
        endif
    endif
    if InSplitScreenGame
        AllocateSplitScreenDMA
    endif
    SetScreenEffectsShadowVolumeParams (Shadow_Volume_Settings)
    UnPauseGame
    if GotParam viewer_mode
        gameflow StandardGameFlowToggleView
        printf '****************************************** CHANGING ASSERT = 0'
        change assertonmissingscripts = 0
        change assertonmissingassets = 0
    else
        printf '****************************************** CHANGING ASSERT = 1'
        change assertonmissingscripts = 1
        change assertonmissingassets = 1
        gameflow StandardGameFlow
    endif
    if IsNGC
        if GotParam pre
            UnloadPreFile <pre> dont_assert
        endif
        if NOT InMultiPlayerGame
            if GotParam pedpre
                UnloadPreFile <pedpre> dont_assert
            endif
        endif
        if InFrontend
            LoadSkaterParts
        endif
    endif
    if InNetGame
        <pedlife_allowed> = 0
    endif
    if NOT GotParam pedlife_allowed
        <pedlife_allowed> = 0
    endif
    KillSpawnedScript name = PedlifeSpawner
    if (<pedlife_allowed> = 1)
        SpawnScriptLater PedlifeSpawner
    endif
    if (view_mode)
        SetAnalogStickActiveForMenus 0
    endif
    if ObjectExists id = skater
        if skater ::IsSkaterOnBike
            switch_all_bike_peds Off
        endif
    endif
endscript

script reset_level 
    ResetLevelFlags
    GetLevelStructureName
    if StructureContains structure = (<level_structure_name>)setup_script
        (<level_structure_name>.setup_script)
    endif
    setup_classic_stat_nodes level = (<level_structure_name>.level)
endscript

script GetCurrentLevelName 
    GetLevelStructureName
    return level_name = (<level_structure_name>.name)
endscript
use_async_goal_intialization = 1

script init_goal_manager 
    GoalManager_LevelLoad
    if InNetGame
        UnSetFlag flag = FLAG_PROSET1_GEO_ON
        UnSetFlag flag = FLAG_PROSET2_GEO_ON
        UnSetFlag flag = FLAG_PROSET3_GEO_ON
        UnSetFlag flag = FLAG_PROSET4_GEO_ON
        UnSetFlag flag = FLAG_PROSET5_GEO_ON
        UnSetFlag flag = FLAG_PROSET6_GEO_ON
        UnSetFlag flag = FLAG_PROSET7_GEO_ON
    else
    endif
    GoalManager_UpdateFamilyTrees
    GoalManager_SyncGoalsWithCareer
    if ((use_async_goal_intialization = 1)& (GameModeEquals is_career))
        KillSpawnedScript name = async_initialize_all_goals
        spawnscriptnow async_initialize_all_goals
    else
        GoalManager_Initializeallgoals
    endif
    GoalManager_SetCanStartGoal 1
    if InFrontend
        GoalManager_HideGoalPoints
        GoalManager_HidePoints
    else
        if NOT GameIsPaused
            if NOT InMultiPlayerGame
                GoalManager_ShowGoalPoints
            endif
            if NOT (in_cinematic_sequence)
                GoalManager_ShowPoints
            endif
        endif
    endif
endscript

script async_initialize_all_goals 
    GoalManager_GetInitializeGoalList
    printstruct <...> 
    GetArraySize <goal_list>
    <index> = 0
    if (<array_size> > 0)
        begin 
        printf 'initializing goal %s' s = (<goal_list> [ <index> ])
        GoalManager_InitializeGoal name = (<goal_list> [ <index> ])
        wait \{ 2 frames }
        <index> = (<index> + 1)
        repeat <array_size>
    endif
endscript

script level_cleanup_assets 
    <skaterNum> = 0
    begin 
    if SkaterExists skater = <skaterNum>
        printf 'Cleaning up level-specific assets for skater %d' d = <ObjID>
        if <ObjID> ::IsLocalSkater
            <ObjID> ::SetAmmo 0
            <ObjID> ::ClearPagerMessages
        endif
    endif
    <skaterNum> = (<skaterNum> + 1)
    repeat 8
    SFX_Change_Footstep_Sounds_To_Default
    UnloadParkEditorPaks
endscript

script zone_init 
    printf 'zone_init: %s' s = <zone_string_name>
    begin 
    if PedPakLoaded
        break 
    endif
    printf 'zone_init waiting for ped parts! thank Brad' s = <zone_string_name>
    wait 1 gameframes
    repeat 
    MemPushContext topdownheap
    FormatText textname = zone_editable_text checksumname = zone_editable_list '%a%b' a = <zone_string_name> b = '_editable_list'
    if globalexists name = <zone_editable_list> type = array
        AddEditableList <zone_editable_list>
    endif
    MemPopContext
    MemPushContext bottomupheap
    ParseNodeArray {
        queue
        zone_name = <zone_name>
        array_name = <array_name>
        checksum_add = <checksum_add>
    }
    if GotParam sfx_array_name
        ParseNodeArray {
            queue
            zone_name = <sfx_zone_name>
            array_name = <sfx_array_name>
            checksum_add = <checksum_add>
        }
    endif
    if GotParam gfx_array_name
        ParseNodeArray {
            queue
            zone_name = <gfx_zone_name>
            array_name = <gfx_array_name>
            checksum_add = <checksum_add>
        }
    endif
    MemPopContext
    if ((IsXbox)|| (isPC))
        if IsTrue in_bus
            ParseNodeArray Block
        endif
    endif
    mission_init zone_string_name = <zone_string_name>
endscript

script zone_deinit 
    printf 'zone_deinit: %s' s = <zone_string_name>
    mission_deinit zone_string_name = <zone_string_name>
    ParseNodeArray abort array_name = <array_name>
    if GotParam sfx_array_name
        ParseNodeArray abort array_name = <sfx_array_name>
    endif
    if GotParam gfx_array_name
        ParseNodeArray abort array_name = <gfx_array_name>
    endif
    FormatText textname = zone_editable_text checksumname = zone_editable_list '%a%b' a = <zone_string_name> b = '_editable_list'
    if globalexists name = <zone_editable_list> type = array
        RemoveEditableList <zone_editable_list>
    endif
endscript

script mission_init 
    if NOT cd
        if GetGlobalFlag flag = CAREER_ONETIMEINTRO
            if IsTrue entered_from_autolaunch
                return 
            endif
        endif
    endif
    printf 'mission_init: %s' s = <zone_string_name>
    if InMultiPlayerGame
        ReformatNetZoneStringName zone_string_name = <zone_string_name>
    endif
    FormatText checksumname = zone_structure 'Level_%a' a = <zone_string_name>
    if StructureContains structure = <zone_structure> goals_script
        if NOT ScriptExists (<zone_structure>.goals_script)
            script_assert 'goals_script defined in level structure does not exist'
        endif
        PushMemProfile 'Goals script'
        (<zone_structure>.goals_script)
        if GameModeEquals is_singlesession
            if NOT GoalManager_GoalIsActive name = trickattack
                AddGoal_TrickAttack zone = <zone_string_name>
            endif
        endif
        PopMemProfile
        if GameModeEquals is_career
            SpawnScriptLater mission_init_add_zone_sensitive_goals params = { zone_string_name = <zone_string_name> }
        else
            init_goal_manager
        endif
    endif
endscript

script mission_init_add_zone_sensitive_goals 
    wait \{ 1 gameframes }
    cash_goals_add_goals zone = <zone_string_name>
    graffiti_goals_add_goals zone = <zone_string_name>
    goal_bike_goals_add_goals zone = <zone_string_name>
    KillSpawnedScript \{ name = goal_add_poi_floaters }
    spawnscriptnow goal_add_poi_floaters params = { zone = <zone_string_name> }
    init_goal_manager
endscript

script mission_deinit 
    printf 'mission_deinit: %s' s = <zone_string_name>
    if InMultiPlayerGame
        ReformatNetZoneStringName zone_string_name = <zone_string_name>
    endif
    FormatText checksumname = zone_structure 'Level_%a' a = <zone_string_name>
    if StructureContains structure = <zone_structure> goals_script
        if NOT InNetGame
            if GameModeEquals is_classic is_coop is_career
                GoalManager_LevelUnload
            endif
        endif
        GoalManager_DeactivateAllGoals silent_deactivation
        if (use_async_goal_intialization = 1)
            KillSpawnedScript name = async_initialize_all_goals
        endif
        GoalManager_UninitializeAllGoals
        GoalManager_RemoveAllGoals
        goal_remove_poi_floaters zone = <zone_string_name>
    endif
endscript

script SetupCOIM 
    PushMemProfile \{ 'COIM' }
    if ((IsXbox)|| (isPC))
        InitCOIM {
            size = <size>
            blockalign = Generic_XBox_COIM_BlockAlign
            coim_min_scratch_blocks
            Generic_COIM_Params
        }
    else
        InitCOIM {
            size = <size>
            blockalign = Generic_COIM_BlockAlign
            coim_min_scratch_blocks
            Generic_COIM_Params
        }
    endif
    PopMemProfile
endscript

script Load_Z_MainMenu 
    load_level \{ level_Z_Mainmenu }
endscript

script Load_Z_HO 
    load_level \{ Level_Z_HO }
endscript

script Load_Z_BH 
    load_level \{ Level_Z_BH }
endscript

script Load_Z_DT 
    load_level \{ Level_Z_DT }
endscript

script Load_Z_EL 
    load_level \{ Level_Z_EL }
endscript

script Load_Z_SM 
    load_level \{ Level_Z_SM }
endscript

script Load_Z_OI 
    load_level \{ Level_Z_OI }
endscript

script Load_Z_LV 
    load_level \{ Level_Z_LV }
endscript

script Load_Z_SR 
    load_level \{ Level_Z_SR }
endscript

script Load_Z_SV 
    load_level \{ Level_Z_SV }
endscript

script Load_Z_SV2 
    load_level \{ Level_Z_SV2 }
endscript

script Load_Z_CH 
    load_level \{ Level_Z_CH }
endscript

script Load_Z_DN 
    load_level \{ Level_Z_DN }
endscript

script Load_Z_MA 
    load_level \{ Level_Z_MA }
endscript

script Load_Z_MS 
    load_level \{ Level_Z_MS }
endscript

script Load_Z_AT 
    load_level \{ Level_Z_AT }
endscript

script Load_Z_SZ 
    load_level \{ Level_Z_SZ }
endscript

script Load_Z_JA 
    load_level \{ Level_Z_JA }
endscript

script Load_TestLevel 
    load_level \{ Level_TestLevel }
endscript

script Load_Z_TestLevel 
    load_level \{ Level_Z_TestLevel }
endscript

script Load_Z_Test_NN 
    load_level \{ Level_Z_Test_NN }
endscript

script viewer 
    load_level \{ level_z_viewer }
endscript

script Load_Z_StorySelect 
    load_level \{ Level_Z_StorySelect }
endscript
level_z_viewer = {
    structure_name = level_z_viewer
    load_script = viewer
    name = 'Z_Viewer'
    loading_screen_default = 'loadscrn_generic'
    loading_time = 9.500
    level = 'Z_Viewer'
    sky = 'TestLevel_Sky'
    goals_script = Z_Viewer_goals
    setup_script = Z_Viewer_setup
    default_stats = 10
    default_stats_classic = 10
    is_streaming_level = 1
    num_m_heads = 10
    num_m_torsos = 10
    num_m_legs = 8
    pedlife_allowed = 0
    tod_manager_params = {
        active = 1
        systems = [
            { tod_manager_system_main_params tod_manager_system_main_cycle }
            { tod_manager_system_sky_params tod_manager_system_sky_cycle }
        ]
    }
}
Level_Z_StorySelect = {
    structure_name = Level_Z_StorySelect
    load_script = Load_Z_StorySelect
    name = 'Z_StorySelect'
    loading_screen_default = 'loadscrn_generic'
    loading_time = 9.500
    level = 'Z_StorySelect'
    sky = 'TestLevel_Sky'
    setup_script = z_storyselect_setup
    default_stats = 10
    default_stats_classic = 10
    is_streaming_level = 1
    num_m_heads = 10
    num_m_torsos = 10
    num_m_legs = 8
    pedlife_allowed = 0
    tod_manager_params = {
        active = 1
        systems = [
            { tod_manager_system_main_params tod_manager_system_main_cycle }
            { tod_manager_system_sky_params tod_manager_system_sky_cycle }
        ]
    }
}
Level_Z_CH = {
    structure_name = Level_Z_CH
    load_script = Load_Z_CH
    name = 'Chicago'
    ambient_track = 'music\vag\backgrounds\z_ch_bg'
    loading_screen_default = 'loadscrn_chicago_classic'
    loading_screen_classic = 'loadscrn_chicago_classic'
    loading_screen_multi = 'loadscrn_chicago'
    loading_time = 9.500
    level = 'Z_CH'
    sky = 'TestLevel_Sky'
    goals_script = Z_CH_goals
    setup_script = Z_CH_setup
    default_stats = 10
    default_stats_classic = 10
    is_streaming_level = 1
    num_m_heads = 10
    num_m_torsos = 10
    num_m_legs = 8
    pedlife_allowed = 0
    tod_manager_params = {
        active = 1
        systems = [
            { tod_manager_system_main_params tod_manager_system_main_cycle }
            { tod_manager_system_sky_params tod_manager_system_sky_cycle }
        ]
    }
}
Level_Z_DN = {
    structure_name = Level_Z_DN
    load_script = Load_Z_DN
    name = 'Minneapolis'
    ambient_track = 'music\vag\backgrounds\z_dn_bg'
    loading_screen_default = 'loadscrn_minneapolis_classic'
    loading_screen_classic = 'loadscrn_minneapolis_classic'
    loading_screen_multi = 'loadscrn_minneapolis'
    loading_time = 9.500
    level = 'Z_DN'
    sky = 'TestLevel_Sky'
    goals_script = Z_DN_goals
    setup_script = Z_DN_setup
    default_stats = 10
    default_stats_classic = 10
    is_streaming_level = 1
    num_m_heads = 10
    num_m_torsos = 10
    num_m_legs = 8
    pedlife_allowed = 1
    tod_manager_params = {
        active = 1
        temp_tod = z_dn_temp_tod
        systems = [
            { tod_manager_system_main_params tod_manager_system_main_cycle }
            { tod_manager_system_sky_params tod_manager_system_sky_cycle }
        ]
    }
    classic_mode_navmesh = 'worlds\worldZones\Z_DN_NavMesh\Z_DN_NavMesh'
}
Level_Z_MA = {
    structure_name = Level_Z_MA
    load_script = Load_Z_MA
    name = 'Die Mall'
    ambient_track = 'music\vag\backgrounds\z_ma_bg'
    loading_screen_default = 'loadscrn_mall_classic'
    loading_screen_classic = 'loadscrn_mall_classic'
    loading_screen_multi = 'loadscrn_mall'
    loading_time = 9.500
    level = 'Z_MA'
    sky = 'TestLevel_Sky'
    goals_script = Z_MA_goals
    setup_script = Z_MA_setup
    default_stats = 10
    default_stats_classic = 10
    is_streaming_level = 1
    num_m_heads = 10
    num_m_torsos = 10
    num_m_legs = 8
    pedlife_allowed = 0
    tod_manager_params = {
        active = 1
        systems = [
            { tod_manager_system_main_params tod_manager_system_main_cycle }
            { tod_manager_system_sky_params tod_manager_system_sky_cycle }
        ]
    }
}
Level_Z_MS = {
    structure_name = Level_Z_MS
    load_script = Load_Z_MS
    name = 'Marseilles'
    ambient_track = 'music\vag\backgrounds\z_ms_bg'
    loading_screen_default = 'loadscrn_marseilles_classic'
    loading_screen_classic = 'loadscrn_marseilles_classic'
    loading_screen_multi = 'loadscrn_marseilles'
    loading_time = 9.500
    level = 'Z_MS'
    sky = 'TestLevel_Sky'
    goals_script = Z_MS_goals
    setup_script = Z_MS_setup
    default_stats = 10
    default_stats_classic = 10
    is_streaming_level = 1
    num_m_heads = 10
    num_m_torsos = 10
    num_m_legs = 8
    pedlife_allowed = 0
    tod_manager_params = {
        active = 1
        systems = [
            { tod_manager_system_main_params tod_manager_system_main_cycle }
            { tod_manager_system_sky_params tod_manager_system_sky_cycle }
        ]
    }
}
Level_Z_JA = {
    structure_name = Level_Z_JA
    load_script = Load_Z_JA
    name = 'Kyoto'
    ambient_track = 'music\vag\backgrounds\z_ja_bg'
    loading_screen_default = 'loadscrn_kyoto_classic'
    loading_screen_classic = 'loadscrn_kyoto_classic'
    loading_screen_multi = 'loadscrn_kyoto'
    loading_time = 9.500
    level = 'Z_JA'
    sky = 'TestLevel_Sky'
    goals_script = Z_JA_goals
    setup_script = Z_JA_setup
    default_stats = 10
    default_stats_classic = 10
    is_streaming_level = 1
    num_m_heads = 10
    num_m_torsos = 10
    num_m_legs = 8
    pedlife_allowed = 1
    tod_manager_params = {
        active = 1
        systems = [
            { tod_manager_system_main_params tod_manager_system_main_cycle }
            { tod_manager_system_sky_params tod_manager_system_sky_cycle }
        ]
    }
    classic_mode_navmesh = 'worlds\worldZones\Z_JA_NavMesh\Z_JA_NavMesh'
}
Level_Z_AT = {
    structure_name = Level_Z_AT
    load_script = Load_Z_AT
    name = 'Atlanta'
    ambient_track = 'music\vag\backgrounds\z_at_bg'
    loading_screen_default = 'loadscrn_atlanta_classic'
    loading_screen_classic = 'loadscrn_atlanta_classic'
    loading_screen_multi = 'loadscrn_atlanta'
    loading_time = 9.500
    level = 'Z_AT'
    sky = 'TestLevel_Sky'
    goals_script = Z_AT_goals
    setup_script = Z_AT_setup
    default_stats = 10
    default_stats_classic = 10
    is_streaming_level = 1
    num_m_heads = 10
    num_m_torsos = 10
    num_m_legs = 8
    pedlife_allowed = 1
    tod_manager_params = {
        active = 1
        systems = [
            { tod_manager_system_main_params tod_manager_system_main_cycle }
            { tod_manager_system_sky_params tod_manager_system_sky_cycle }
        ]
    }
    classic_mode_navmesh = 'worlds\worldZones\Z_AT_NavMesh\Z_AT_NavMesh'
}
Level_Z_SZ = {
    structure_name = Level_Z_SZ
    load_script = Load_Z_SZ
    name = 'Santa Cruz'
    ambient_track = 'music\vag\backgrounds\z_sz_bg'
    loading_screen_default = 'loadscrn_santacruz_classic'
    loading_screen_classic = 'loadscrn_santacruz_classic'
    loading_screen_multi = 'loadscrn_santacruz'
    loading_time = 9.500
    level = 'Z_SZ'
    sky = 'TestLevel_Sky'
    goals_script = Z_SZ_goals
    setup_script = Z_SZ_setup
    default_stats = 10
    default_stats_classic = 10
    is_streaming_level = 1
    num_m_heads = 10
    num_m_torsos = 10
    num_m_legs = 8
    pedlife_allowed = 1
    tod_manager_params = {
        active = 1
        systems = [
            { tod_manager_system_main_params tod_manager_system_main_cycle }
            { tod_manager_system_sky_params tod_manager_system_sky_cycle }
        ]
    }
    classic_mode_navmesh = 'worlds/worldZones/z_sz_navmesh/z_sz_navmesh'
}
Level_TestLevel = {
    structure_name = Level_TestLevel
    load_script = Load_TestLevel
    name = 'TestLevel'
    loading_screen_default = 'loadscrn_generic'
    loading_time = 9.500
    pre = 'TestLevel_scripts.pre'
    scnpre = 'TestLevelscn.pre'
    level = 'TestLevel'
    sky = 'TestLevel_Sky'
    qb = 'levels\TestLevel\TestLevel.qb'
    colpre = 'TestLevelcol.pre'
    pedpre = 'TestLevelped.pre'
    level_qb = 'levels\TestLevel\TestLevel_scripts.qb'
    goals_script = TestLevel_goals
    setup_script = TestLevel_setup
    default_stats = 10
    default_stats_classic = 10
    is_streaming_level = 0
    num_m_heads = 10
    num_m_torsos = 10
    num_m_legs = 8
    pedlife_allowed = 1
    tod_manager_params = {
        active = 1
        systems = [
            { tod_manager_system_main_params tod_manager_system_main_cycle }
            { tod_manager_system_sky_params tod_manager_system_sky_cycle }
        ]
    }
}
Level_Z_TestLevel = {
    structure_name = Level_Z_TestLevel
    load_script = Load_Z_TestLevel
    name = 'Z_TestLevel'
    loading_screen_default = 'loadscrn_generic'
    loading_time = 9.500
    level = 'Z_TestLevel'
    sky = 'TestLevel_Sky'
    goals_script = Z_TestLevel_goals
    setup_script = Z_TestLevel_setup
    default_stats = 10
    default_stats_classic = 10
    is_streaming_level = 1
    peds = 40
    num_m_heads = 10
    num_m_torsos = 10
    num_m_legs = 8
    pedlife_allowed = 1
    tod_manager_params = {
        active = 1
        systems = [
            { tod_manager_system_main_params tod_manager_system_main_cycle }
            { tod_manager_system_sky_params tod_manager_system_sky_cycle }
        ]
    }
}
Level_Z_Test_NN = {
    structure_name = Level_Z_Test_NN
    load_script = Load_Z_Test_NN
    name = 'Z_Test_NN'
    loading_screen_default = 'loadscrn_generic'
    loading_time = 9.500
    level = 'Z_Test_NN'
    sky = 'TestLevel_Sky'
    goals_script = Z_Test_NN_goals
    setup_script = Z_Test_NN_setup
    default_stats = 10
    default_stats_classic = 10
    is_streaming_level = 1
    peds = 100
    num_m_heads = 10
    num_m_torsos = 10
    num_m_legs = 10
    pedlife_allowed = 0
    tod_manager_params = {
        active = 1
        systems = [
            { tod_manager_system_main_params tod_manager_system_main_cycle }
            { tod_manager_system_sky_params tod_manager_system_sky_cycle }
        ]
    }
}
Level_Z_BH = {
    structure_name = Level_Z_BH
    load_script = Load_Z_BH
    name = 'Beverly Hills'
    ambient_track = 'music\vag\backgrounds\z_bh_bg'
    loading_screen_default = 'loadscrn_beverly_hills'
    loading_screen_multi = 'loadscrn_beverly_hills'
    loading_time = 9.500
    level = 'Z_BH'
    sky = 'TestLevel_Sky'
    goals_script = Z_BH_goals
    setup_script = Z_BH_setup
    default_stats = 5
    default_stats_classic = 10
    level_map = bh_level_map
    map_conversion = (0.013000000268220901, 0.013000000268220901)
    map_offset = (-12997.0, 5337.0)
    map_scale = 2.400
    is_streaming_level = 1
    num_m_heads = 10
    num_m_torsos = 10
    num_m_legs = 8
    pedlife_allowed = 1
    tod_manager_params = {
        active = 1
        systems = [
            { tod_manager_system_main_params tod_manager_system_main_cycle }
            { tod_manager_system_sky_params tod_manager_system_sky_cycle }
        ]
    }
}
Level_Z_HO = {
    structure_name = Level_Z_HO
    load_script = Load_Z_HO
    name = 'Hollywood'
    ambient_track = 'music\vag\backgrounds\z_ho_bg'
    loading_screen_default = 'loadscrn_hollywood'
    loading_screen_multi = 'loadscrn_hollywood_2'
    loading_time = 9.500
    level = 'Z_HO'
    sky = 'TestLevel_Sky'
    goals_script = Z_HO_goals
    setup_script = Z_HO_setup
    default_stats = 3
    default_stats_classic = 10
    level_map = ho_level_map
    map_conversion = (0.013000000268220901, 0.013000000268220901)
    map_offset = (-265.0, -1395.0)
    map_scale = 2.400
    is_streaming_level = 1
    num_m_heads = 10
    num_m_torsos = 10
    num_m_legs = 8
    pedlife_allowed = 1
    tod_manager_params = {
        active = 1
        systems = [
            { tod_manager_system_main_params tod_manager_system_main_cycle }
            { tod_manager_system_sky_params tod_manager_system_sky_cycle }
        ]
    }
}
Level_Z_DT = {
    structure_name = Level_Z_DT
    load_script = Load_Z_DT
    name = 'Downtown'
    ambient_track = 'music\vag\backgrounds\z_dt_bg'
    loading_screen_default = 'loadscrn_downtown'
    loading_screen_multi = 'loadscrn_downtown'
    loading_time = 9.500
    level = 'Z_DT'
    sky = 'TestLevel_Sky'
    goals_script = Z_DT_goals
    setup_script = Z_DT_setup
    default_stats = 10
    default_stats_classic = 10
    level_map = dt_level_map
    map_conversion = (0.014000000432133675, 0.012000000104308128)
    map_offset = (7500.0, 9600.0)
    map_scale = 2
    is_streaming_level = 1
    num_m_heads = 10
    num_m_torsos = 10
    num_m_legs = 8
    pedlife_allowed = 1
    tod_manager_params = {
        active = 1
        systems = [
            { tod_manager_system_main_params tod_manager_system_main_cycle }
            { tod_manager_system_sky_params tod_manager_system_sky_cycle }
        ]
    }
}
Level_Z_EL = {
    structure_name = Level_Z_EL
    load_script = Load_Z_EL
    name = 'Los Angeles Ost'
    ambient_track = 'music\vag\backgrounds\z_el_bg'
    loading_screen_default = 'loadscrn_east_la'
    loading_screen_multi = 'loadscrn_east_la'
    loading_time = 9.500
    level = 'Z_EL'
    sky = 'TestLevel_Sky'
    goals_script = Z_EL_goals
    setup_script = Z_EL_setup
    default_stats = 10
    default_stats_classic = 10
    level_map = el_level_map
    map_conversion = (0.007499999832361937, 0.007499999832361937)
    map_offset = (9000.0, 10300.0)
    map_scale = 3
    is_streaming_level = 1
    num_m_heads = 10
    num_m_torsos = 10
    num_m_legs = 8
    pedlife_allowed = 1
    tod_manager_params = {
        active = 1
        systems = [
            { tod_manager_system_main_params tod_manager_system_main_cycle }
            { tod_manager_system_sky_params tod_manager_system_sky_cycle }
        ]
    }
}
Level_Z_SM = {
    structure_name = Level_Z_SM
    load_script = Load_Z_SM
    name = 'Santa Monica'
    ambient_track = 'music\vag\backgrounds\z_sm_bg'
    loading_screen_default = 'loadscrn_santa_monica'
    loading_screen_multi = 'loadscrn_santa_monica'
    loading_time = 9.500
    level = 'Z_SM'
    sky = 'TestLevel_Sky'
    goals_script = Z_SM_goals
    setup_script = Z_SM_setup
    default_stats = 10
    default_stats_classic = 10
    level_map = sm_level_map
    map_conversion = (0.00800000037997961, 0.007499999832361937)
    map_offset = (-11600.0, 18500.0)
    map_scale = 2.400
    is_streaming_level = 1
    num_m_heads = 10
    num_m_torsos = 10
    num_m_legs = 8
    pedlife_allowed = 1
    tod_manager_params = {
        active = 1
        systems = [
            {
                tod_manager_system_main_params
                Morning = z_sm_tod_morning
                Afternoon = z_sm_tod_afternoon
                Evening = z_sm_tod_evening
                Night = z_sm_tod_night
            }
            {
                tod_manager_system_sky_params
                Morning = z_sm_tod_morning_sky
                Afternoon = z_sm_tod_afternoon_sky
                Evening = z_sm_tod_evening_sky
                Night = z_sm_tod_night_sky
            }
        ]
    }
}
Level_Z_OI = {
    structure_name = Level_Z_OI
    load_script = Load_Z_OI
    name = 'Bohrinsel'
    ambient_track = 'music\vag\backgrounds\z_oi_bg'
    loading_screen_default = 'loadscrn_oil_rig'
    loading_screen_multi = 'loadscrn_oil_rig'
    loading_time = 9.500
    level = 'Z_OI'
    sky = 'TestLevel_Sky'
    goals_script = Z_OI_goals
    setup_script = Z_OI_setup
    default_stats = 10
    default_stats_classic = 10
    map_conversion = (0.03999999910593033, 0.029999999329447746)
    map_offset = (-6.0, 40.0)
    map_scale = 1
    is_streaming_level = 1
    num_m_heads = 10
    num_m_torsos = 10
    num_m_legs = 8
    pedlife_allowed = 1
    tod_manager_params = {
        active = 1
        systems = [
            {
                tod_manager_system_main_params
                Morning = z_oi_tod_morning
                Afternoon = z_oi_tod_afternoon
                Evening = z_oi_tod_evening
                Night = z_oi_tod_night
            }
            {
                tod_manager_system_sky_params
                Morning = z_oi_tod_morning_sky
                Afternoon = z_oi_tod_afternoon_sky
                Evening = z_oi_tod_evening_sky
                Night = z_oi_tod_night_sky
            }
        ]
    }
}
Level_Z_LV = {
    structure_name = Level_Z_LV
    load_script = Load_Z_LV
    name = 'Kasino'
    ambient_track = 'music\vag\backgrounds\z_lv_bg'
    loading_screen_default = 'loadscrn_casino'
    loading_screen_multi = 'loadscrn_casino'
    loading_time = 9.500
    level = 'Z_LV'
    sky = 'TestLevel_Sky'
    goals_script = Z_LV_goals
    setup_script = Z_LV_setup
    default_stats = 10
    default_stats_classic = 10
    map_conversion = (0.03999999910593033, 0.029999999329447746)
    map_offset = (-6.0, 40.0)
    map_scale = 1
    is_streaming_level = 1
    num_m_heads = 10
    num_m_torsos = 10
    num_m_legs = 8
    pedlife_allowed = 1
    tod_manager_params = {
        active = 1
        temp_tod = {
            fog_on = 1
            fog_red = 105
            fog_green = 96
            fog_blue = 132
            fog_alpha = 0
            fog_dist = 803
        }
        systems = [
            {
                tod_manager_system_main_params
                Morning = tod_manager_LV_morning
                Afternoon = tod_manager_LV_afternoon
                Evening = tod_manager_LV_evening
                Night = tod_manager_LV_night
            }
            {
                tod_manager_system_sky_params
                Morning = tod_manager_LV_morning_sky
                Afternoon = tod_manager_LV_afternoon_sky
                Evening = tod_manager_LV_evening_sky
                Night = tod_manager_LV_night_sky
            }
        ]
    }
}
Level_Z_SR = {
    structure_name = Level_Z_SR
    load_script = Load_Z_SR
    name = 'Skate-Ranch'
    ambient_track = 'music\vag\backgrounds\z_sr_bg'
    loading_screen_default = 'loadscrn_skateranch'
    loading_screen_multi = 'loadscrn_skateranch'
    loading_time = 9.500
    level = 'Z_SR'
    sky = 'TestLevel_Sky'
    goals_script = Z_SR_goals
    setup_script = Z_SR_setup
    default_stats = 10
    default_stats_classic = 10
    map_conversion = (0.03999999910593033, 0.029999999329447746)
    map_offset = (-6.0, 40.0)
    map_scale = 1
    is_streaming_level = 1
    num_m_heads = 10
    num_m_torsos = 10
    num_m_legs = 8
    pedlife_allowed = 1
    tod_manager_params = {
        active = 1
        systems = [
            { tod_manager_system_main_params tod_manager_system_main_cycle }
            { tod_manager_system_sky_params tod_manager_system_sky_cycle }
        ]
    }
}
Level_Z_SV = {
    structure_name = Level_Z_SV
    load_script = Load_Z_SV
    name = 'Vans Park'
    ambient_track = 'music\vag\backgrounds\z_sv_bg'
    loading_screen_default = 'loadscrn_vans'
    loading_screen_multi = 'loadscrn_vans'
    loading_time = 9.500
    level = 'Z_SV'
    sky = 'TestLevel_Sky'
    goals_script = Z_SV_goals
    setup_script = Z_SV_setup
    default_stats = 10
    default_stats_classic = 10
    map_conversion = (0.03999999910593033, 0.029999999329447746)
    map_offset = (-6.0, 40.0)
    map_scale = 1
    is_streaming_level = 1
    num_m_heads = 10
    num_m_torsos = 10
    num_m_legs = 8
    pedlife_allowed = 1
    tod_manager_params = {
        active = 1
        systems = [
            {
                tod_manager_system_main_params
                Morning = { z_sv_tod_main state_length = 90000 }
                Afternoon = { z_sv_tod_main state_length = 400000 }
                Evening = { z_sv_tod_main state_length = 90000 }
                Night = { z_sv_tod_main state_length = 140000 }
            }
            {
                tod_manager_system_sky_params
                Morning = { z_sv_tod_sky state_length = 110000 }
                Afternoon = { z_sv_tod_sky state_length = 400000 }
                Evening = { z_sv_tod_sky state_length = 110000 }
                Night = { z_sv_tod_sky state_length = 100000 }
            }
        ]
    }
}
Level_Z_SV2 = {
    structure_name = Level_Z_SV2
    load_script = Load_Z_SV2
    name = 'Die Ruinen'
    ambient_track = 'music\vag\backgrounds\z_sv2_bg'
    loading_screen_default = 'loadscrn_ruins'
    loading_screen_multi = 'loadscrn_ruins'
    loading_time = 9.500
    level = 'Z_SV2'
    sky = 'TestLevel_Sky'
    goals_script = Z_SV2_goals
    setup_script = Z_SV2_setup
    default_stats = 10
    default_stats_classic = 10
    map_conversion = (0.03999999910593033, 0.029999999329447746)
    map_offset = (-6.0, 40.0)
    map_scale = 1
    is_streaming_level = 1
    num_m_heads = 10
    num_m_torsos = 10
    num_m_legs = 8
    pedlife_allowed = 1
    tod_manager_params = { active = 0 temp_tod = z_sv2_temp_tod }
    classic_mode_navmesh = 'worlds/worldZones/z_sv2_navmesh/z_sv2_navmesh'
}
level_Z_Mainmenu = {
    structure_name = level_Z_Mainmenu
    load_script = Load_Z_MainMenu
    name = 'z_mainmenu'
    loading_screen_default = 'loadscrn_generic'
    loading_time = 6.750
    loading_time_xbox = 11.0
    level_name = 'z_mainmenu'
    level = 'z_mainmenu'
    goals_script = NullScript
    setup_script = z_mainmenu_setup
    default_stats = 8
    is_streaming_level = 1
    pedlife_allowed = 0
    tod_manager_params = { active = 0 }
}

script LoadParkEditorPaks 
    ParkEdPushSnapshot \{ tag = reset }
    ParkEdPushSnapshot \{ tag = load }
    LoadPak <sky_pak>
    ParkEdPushSnapshot \{ tag = outer_shell }
    LoadPak <outer_shell_pak>
    ParkEdPopSnapshot \{ tag = outer_shell }
    LoadPak <Asset_pak> localized
    LoadPak \{ 'pak/multiplayer/multiplayer.pak' }
    change \{ LastLoadedGameType = 2 }
    ParkEdPopSnapshot \{ tag = load }
    SetEditorLoadedTheme
endscript

script UnloadParkEditorPaks 
    GetEditorLoadedTheme
    if (<theme> > -1)
        PauseSkaters \{ hide }
        CAP_Generate_LevelStructureName theme = <theme>
        BeginUnloadPak (<structure_name>.sky_pak)
        EndUnloadPak (<structure_name>.sky_pak)
        BeginUnloadPak (<structure_name>.outer_shell_pak)
        EndUnloadPak (<structure_name>.outer_shell_pak)
        BeginUnloadPak (<structure_name>.Asset_pak)localized
        EndUnloadPak (<structure_name>.Asset_pak)localized
        SetEditorLoadedTheme \{ -1 }
    endif
endscript

script CAP_Generate_LevelStructureName 
    if NOT GotParam \{ theme }
        GetEditorTheme
    endif
    if (<theme> = 0)
        structure_name = Level_sk5ed
    else
        FormatText checksumname = structure_name 'Level_sk5ed%d' d = (<theme> + 1)
    endif
    return structure_name = <structure_name>
endscript

script load_sk5ed 
    CAP_Generate_LevelStructureName
    if ((IsXbox)|| (isPC))
        load_level <structure_name> loading_screen_default = 'loadscrn_editor_x'
    endif
    if IsNGC
        load_level <structure_name> loading_screen_default = 'loadscrn_editor_ngc'
    endif
    if IsPs2
        load_level <structure_name> loading_screen_default = 'loadscrn_editor'
    endif
    if IsXenon
        load_level <structure_name> loading_screen_default = 'loadscrn_editor_x'
    endif
endscript

script load_sk5ed_gameplay 
    CAP_Generate_LevelStructureName
    load_level <structure_name> setup_script = ParkED_Gameplay_Start loading_screen_default = 'loadscrn_created'
endscript
Level_CAP_defaults = {
    park_editor
    load_script = load_sk5ed
    structure_name = Level_sk5ed
    level = 'sk5ed'
    level_name = 'sk5ed'
    Asset_pak = 'worlds\CreateAPark\CAP_assets\CAP_assets.pak'
    name = 'Erstellter Park'
    loading_screen_default = 'loadscrn_editor_play'
    loading_time = 6.810
    loading_time_xbox = 9
    setup_script = ParkED_Start
    goals_script = ParkED_Goals
    default_stats = 10
    default_stats_classic = 10
    is_streaming_level = 0
    pedlife_allowed = 0
    tod_manager_params = { active = 0 }
}
Level_sk5ed = {
    Level_CAP_defaults
    loading_time = 7.110
    theme_name = 'Flugzeugträger'
    sky_pak = 'Skies\CAP_Shell1_Sky\CAP_Shell1_Sky.pak'
    outer_shell_pak = 'worlds\CreateAPark\CAP_Shell1\CAP_Shell1.pak'
}
Level_sk5ed2 = {
    Level_CAP_defaults
    loading_time = 7.380
    theme_name = 'Antarktis'
    sky_pak = 'Skies\CAP_Shell2_Sky\CAP_Shell2_Sky.pak'
    outer_shell_pak = 'worlds\CreateAPark\CAP_Shell2\CAP_Shell2.pak'
}
Level_sk5ed3 = {
    Level_CAP_defaults
    loading_time = 7.120
    theme_name = 'Friedhof'
    sky_pak = 'Skies\CAP_Shell3_Sky\CAP_Shell3_Sky.pak'
    outer_shell_pak = 'worlds\CreateAPark\CAP_Shell3\CAP_Shell3.pak'
}
Level_sk5ed4 = {
    Level_CAP_defaults
    loading_time = 7.150
    theme_name = 'Mars'
    sky_pak = 'Skies\CAP_Shell4_Sky\CAP_Shell4_Sky.pak'
    outer_shell_pak = 'worlds\CreateAPark\CAP_Shell4\CAP_Shell4.pak'
}
Level_sk5ed5 = {
    Level_CAP_defaults
    loading_time = 7.590
    theme_name = 'Rennstrecke'
    sky_pak = 'Skies\CAP_Shell5_Sky\CAP_Shell5_Sky.pak'
    outer_shell_pak = 'worlds\CreateAPark\CAP_Shell5\CAP_Shell5.pak'
}
Level_sk5ed6 = {
    Level_CAP_defaults
    loading_time = 7.590
    theme_name = 'Sumpf'
    sky_pak = 'Skies\CAP_Shell6_Sky\CAP_Shell6_Sky.pak'
    outer_shell_pak = 'worlds\CreateAPark\CAP_Shell6\CAP_Shell6.pak'
}
