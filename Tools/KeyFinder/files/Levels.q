
UsePreFilesForLevelLoading = 0
fake_net = 0
assertonmissingscripts = 0
assertonmissingassets = 1
AlwaysDump = 0
next_level_script = NullScript
ingame_screen_mode = current_screen_mode

script cleanup_before_loading_level 
    
    cleanup
    StopMusic
    PauseMusic
    ClearMusicTrackList
endscript


script request_level 
    if GotParam level
        RequestLevel <level>
    else
        script_assert 'request_level needs a level param'
    endif
endscript


script LoadLevel 
    MemPushContext 0
    ScreenElementSystemCleanup
    LaunchLevel <...> 
    MemPopContext
endscript

LevelNum_TR = 9
LevelNum_BO = 1
LevelNum_BA = 2
LevelNum_BE = 3
LevelNum_AU = 4
LevelNum_NO = 5
LevelNum_ST = 6
LevelNum_SE = 7
LevelNum_SE2 = 8
LevelNum_SC = 12
LevelNum_PH = 13
LevelNum_DJ = 14
LevelNum_LA = 15
LevelNum_CA = 16
LevelNum_AP = 17
LevelNum_Default = 11
LevelNum_TestLevel = 21
LevelNum_Skateshop = 0
LevelNum_Sk5ed = 11
levels_with_gaps = [
    LevelNum_TR
    LevelNum_BO
    LevelNum_BA
    LevelNum_BE
    LevelNum_AU
    LevelNum_NO
    LevelNum_ST
    LevelNum_SE
    LevelNum_SE2
    LevelNum_SC
    LevelNum_PH
    LevelNum_DJ
    LevelNum_LA
    LevelNum_CA
    LevelNum_AP
]

script LoadLevelPreFile 
    if IsTrue UsePreFilesForLevelLoading
        LoadPreFile <...> 
    endif
endscript


script LoadSkaterParts {pre_files = [
            'skaterparts.pre'
            'skaterparts_temp.pre'
        ]
    }
    if GotParam unload
        
    else
        
    endif
    GetArraySize <pre_files>
    index = 0
    if IsNGC
        begin 
        if GotParam unload
            
            UnloadPreFile (<pre_files> [ <index> ])
        else
            
            LoadPreFile (<pre_files> [ <index> ])use_bottom_up_heap
        endif
        index = (<index> + 1)
        repeat <array_size>
        if GotParam unload
            UnloadPreFile 'skaterparts_secret.pre'
            UnloadPreFile 'cagpieces.pre'
        else
            LoadPreFile 'skaterparts_secret.pre'
            LoadPreFile 'cagpieces.pre'
        endif
    else
        if NOT IsTrue cas_artist
            begin 
            if GotParam unload
                
                UnloadPreFile (<pre_files> [ <index> ])
            else
                
                LoadPreFile (<pre_files> [ <index> ])
            endif
            index = (<index> + 1)
            repeat <array_size>
        endif
    endif
endscript


script load_level level_number = 0 COIM_size = 1331200
    TODManager_Reset
    TODManager_SetTODScript <tod_script>
    tod_manager_set_default_params
    if InNetGame
        if NOT IsObserving
            ExitSurveyorMode
        endif
    endif
    change freemem_script_lowest = 999999999
    change freemem_main_lowest = 999999999
    do_unload_unloadable
    if NOT InNetGame
        if NOT GotParam park_editor
            do_load_permanent
        endif
    endif
    SetLevelStructureName name = <structure_name>
    load_level_handle_ambient_sfx ambient_track = <ambient_track>
    kill_start_key_binding
    
    SetScoreAccumulation 0
    SetScoreDegradation 0
    if ObjectExists id = skater
        if skater ::IsLocalSkater
            skater ::motoskateboardoff
        endif
    endif
    if InSplitScreenGame
        UnsetGlobalFlag flag = CHEAT_DISCO
    endif
    
    
    if EnteringNetGame
        if OnServer
            
        else
            
        endif
    else
        
    endif
    load_level_handle_loading_screen <...> 
    exit_pause_menu
    CareerStartLevel level = <level_number>
    if NOT InNetGame
        PushMemProfile 'Path Manager'
        AllocatePathManMemory
        PopMemProfile
    endif
    ResetLevelFlags
    if GotParam park_editor
        ParkEdMemSnapshot reset
        ParkEdMemSnapshot startload
    endif
    if GotParam scnpre
        if NOT InNetGame
            LoadLevelPreFile <scnpre>
        else
            if GotParam park_editor
                LoadLevelPreFile <scnpre>
            else
                LoadLevelPreFile (<level> + 'scn.pre')
            endif
        endif
    endif
    if GotParam sky
        LoadScene scene = <sky>
    endif
    if GotParam park_editor
        LoadScene scene = <level> is_dictionary
        if GotParam outer_shell
            ParkEdMemSnapshot start_outer_shell
            LoadScene scene = <outer_shell> no_supersectors
            ParkEdMemSnapshot end_outer_shell
        endif
    else
        if GotParam level
            if InNetGame
                LoadScene scene = <level> is_net
            else
                LoadScene scene = <level>
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
            if GotParam park_editor
                UnloadPreFile <scnpre> dont_assert
            else
                UnloadPreFile (<level> + 'scn.pre')dont_assert
            endif
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
        if GotParam park_editor
            NodeArrayManLoad <qb>
        else
            NodeArrayManLoad <qb>
            <need_goal_editor_nodes> = 0
            if InSplitScreenGame
                <need_goal_editor_nodes> = 1
            endif
            if InNetGame
                <need_goal_editor_nodes> = 1
            endif
            if GameModeEquals is_creategoals
                <need_goal_editor_nodes> = 1
            endif
            if (<need_goal_editor_nodes> = 1)
                AddGoalEditorNodesToLevelNodeArray
            endif
        endif
    endif
    if IsPs2
        if GotParam pre
            LoadLevelPreFile <pre>
        endif
    endif
    if GotParam park_editor
    else
        if GotParam qb
            preloadmodels
        endif
    endif
    PushMemProfile 'Level-specific QB files'
    if GotParam level_qb
        UnloadQB <level_qb>
        LoadQB <level_qb> levelspecific
    endif
    if GotParam level_sfx_qb
        LoadQB <level_sfx_qb> levelspecific
    endif
    if GotParam more_level_qbs
        if NOT IsArray <more_level_qbs>
            script_assert 'more_level_qbs is not an array'
        endif
        GetArraySize <more_level_qbs>
        <index> = 0
        begin 
        <curr_level_qb> = (<more_level_qbs> [ <index> ])
        UnloadQB <curr_level_qb>
        LoadQB <curr_level_qb> levelspecific
        <index> = (<index> + 1)
        repeat <array_size>
    endif
    PopMemProfile
    if GotParam qb
        preselect_random_parts <...> 
    endif
    SetThisLevelSoundBanks ThisLevel = <level>
    if GotParam park_editor
        LoadTerrain
    else
        SetTerrainDefault
        if GotParam qb
            LoadTerrain
        endif
    endif
    if GotParam park_editor
        ParkEdMemSnapshot endload
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
    if NOT InNetGame
        if ScriptExists load_level_anims
            PushMemProfile 'Level Specific Anims'
            load_level_anims
            PopMemProfile
        endif
    endif
    if NOT InNetGame
        if ScriptExists LoadCameras
            PushMemProfile 'Level Cameras'
            LoadCameras
            PopMemProfile
        endif
    endif
    if ScriptExists LoadObjectAnims
        PushMemProfile 'Object Anims'
        LoadObjectAnims
        PopMemProfile
    endif
    PushMemProfile 'Particle Textures'
    if ScriptExists LoadAllParticleTextures
        LoadAllParticleTextures
    endif
    if ScriptExists load_level_particle_textures
        load_level_particle_textures
    endif
    if ScriptExists load_level_fast_particle_textures
        load_level_fast_particle_textures
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
            
            PushMemProfile 'Level Specific Anims'
            <extranetanimsscript>
            PopMemProfile
        endif
    endif
    if GotParam park_editor
    else
        if IsNGC
            if (<level_number> = LevelNum_Skateshop)
            else
                if GotParam startup_script
                    <startup_script>
                endif
            endif
        else
            if GotParam startup_script
                <startup_script>
            endif
        endif
    endif
    GoalManager_GetLevelPrefix
    FormatText checksumname = loading_sounds_script '%i_LoadingSounds' i = <level_prefix>
    if ScriptExists <loading_sounds_script>
        <loading_sounds_script>
    endif
    if NOT IsNGC
        if GotParam pre
            UnloadPreFile <pre> dont_assert
        endif
    endif
    if NOT (IsNGC)
        if NOT InMultiPlayerGame
            if GotParam pedpre
                LoadPreFile <pedpre> dont_assert
            endif
        endif
    endif
    if NOT InMultiPlayerGame
        if GotParam qb
            if NOT GotParam frontend_level
                if GotParam park_editor
                    PreloadPedestrians no_random
                else
                    PreloadPedestrians
                endif
            endif
        endif
    endif
    if NOT InNetGame
        if InMultiPlayerGame
            PreloadModel name = 'crown'
        endif
    endif
    menu3d_load_assets structure_name = <structure_name>
    if NOT (IsNGC)
        if NOT InMultiPlayerGame
            if GotParam pedpre
                UnloadPreFile <pedpre> dont_assert
            endif
        endif
    endif
    if (<level_number> = LevelNum_Skateshop)
        LoadPreFile 'mainmenusprites.pre'
        load_mainmenu_textures_to_main_memory no_pre_file
        load_cas_textures_to_main_memory no_pre_file
        UnloadPreFile 'mainmenusprites.pre'
    endif
    if GotParam park_editor
    else
        if IsNGC
            if GotParam startup_script
                if (<level_number> = LevelNum_Skateshop)
                    <startup_script>
                endif
                if (<level_number> = LevelNum_boardshop)
                    <startup_script>
                endif
            endif
        endif
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
                    LoadPipPre (<level> + 'col.pre')heap = bottomup
                endif
            endif
        endif
    endif
    if InNetGame
        if GotParam park_editor
            LoadCollision scene = <level>
        else
            LoadCollision scene = <level> is_net
        endif
    else
        LoadCollision scene = <level>
    endif
    if GotParam park_editor
        if GotParam outer_shell
            if IsTrue UsePreFilesForLevelLoading
                <extension> = 'col.pre'
                LoadPipPre (<outer_shell> + <extension>)heap = bottomupheap
            endif
            LoadCollision scene = <outer_shell>
        endif
    endif
    PopMemProfile
    change ParseNodeArrayIgnoreGaps = 0
    if GotParam park_editor
        if GotParam startup_script
            <startup_script>
        endif
    else
        if GotParam qb
            ParseNodeArray
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
    if GameModeEquals is_career
        GetOptionalChapterGoalsScript level = <load_script>
    endif
    if GotParam goals_script
        if NOT ScriptExists <goals_script>
            script_assert 'goals_script defined in level structure does not exist'
        endif
        PushMemProfile 'Goals script'
        <goals_script>
        PopMemProfile
    endif
    if GameModeEquals is_creategoals
        InitialiseCreatedGoals
    else
        if InNetGame
            InitialiseCreatedGoals DoNotCreateGoalPeds
        endif
    endif
    if GameModeEquals is_singlesession
        AddGoal_TrickAttack
    endif
    if GameModeEquals is_classic
        if NOT (<load_script> = load_mainmenu)
            AddGoal_TimedScoreRun
        endif
    endif
    init_goal_manager
    if GotParam sun_theta
        <morning_params> = {(tod_manager_default_morning)sun_theta = (<sun_theta> [ 0 ])}
        <afternoon_params> = {(tod_manager_default_afternoon)sun_theta = (<sun_theta> [ 1 ])}
        <evening_params> = {(tod_manager_default_evening)sun_theta = (<sun_theta> [ 2 ])}
        <night_params> = {(tod_manager_default_night)sun_theta = (<sun_theta> [ 3 ])}
        TODManager_SetParams {
            system = 1
            current_state = Afternoon
            transition_length = 90000
            groups = [
                {parts = 6 wait_frames = 3 light_group = outdoor}
                {parts = 2 wait_frames = 3 light_group = NoLevelLights reset_light_group = indoor}
            ]
            Morning = <morning_params>
            Afternoon = <afternoon_params>
            Evening = <evening_params>
            Night = <night_params>
        }
        <morning_params> = {(tod_manager_default_morning_sky)sun_theta = (<sun_theta> [ 0 ])}
        <afternoon_params> = {(tod_manager_default_afternoon_sky)sun_theta = (<sun_theta> [ 1 ])}
        <evening_params> = {(tod_manager_default_evening_sky)sun_theta = (<sun_theta> [ 2 ])}
        <night_params> = {(tod_manager_default_night_sky)sun_theta = (<sun_theta> [ 3 ])}
        TODManager_SetParams {
            system = 2
            sky
            current_state = Afternoon
            transition_length = 90000
            groups = [
                {parts = 6 wait_frames = 3 light_group = outdoor}
                {parts = 2 wait_frames = 3 light_group = NoLevelLights reset_light_group = indoor}
            ]
            Morning = <morning_params>
            Afternoon = <afternoon_params>
            Evening = <evening_params>
            Night = <night_params>
        }
    endif
    if GotParam setup_script
        PushMemProfile 'Setup Script'
        <setup_script>
        PopMemProfile
    endif
    <TOD_off> = 0
    if GotParam frontend_level
        <TOD_off> = 1
    endif
    if (tod_manager_inactive = 1)
        <TOD_off> = 1
    endif
    if ((GotParam park_editor)|| (<TOD_off> = 1))
        TODManager_SetActive 0
    else
        TODManager_SetActive 1
    endif
    if IsTrue GameInformerBuild
        TODManager_SetActive 0
    endif
    if GotParam tod_manager_active
        if (<tod_manager_active> = 0)
            TODManager_SetActive 0
        endif
    endif
    if GotParam frontend_level
        TODManager_SetTODInstant Afternoon
    else
        if NOT GotParam tod_state
            <tod_state> = Afternoon
        endif
        TODManager_SetTODInstant <tod_state>
    endif
    if GotParam uber_frig_height
        change uber_frig_current_height = <uber_frig_height>
    else
        change uber_frig_current_height = uber_frig_default_height
    endif
    if GameModeEquals is_career
        <do_teammate_pro> = 1
        if GotParam skip_teammate_pro
            <do_teammate_pro> = 0
        endif
        if (<do_teammate_pro> = 1)
            MemPushContext bottomupheap
            PushMemProfile 'Teammate Pro Heap'
            if IsNGC
                MemInitHeap name = 'TeammatePro' size = 195000
            else
                MemInitHeap name = 'TeammatePro' size = 250000
            endif
            PopMemProfile
            MemPopContext
            change skater_swapping_teammate_name = None
        endif
    endif
    setup_classic_stat_nodes level = <level> level_num = <level_num>
    SFX_refresh_music_box_triggers
    PushMemProfile 'Permanent & semi-permanent anims'
    if NOT GotParam park_editor
        if NOT GotParam frontend_level
            do_load_unloadable
        endif
    endif
    PopMemProfile
    <is_frontend> = 0
    if GotParam frontend_level
        <is_frontend> = <frontend_level>
    endif
    if (<is_frontend> = 1)
        MemPushContext bottomupheap
        load_multiplayer_textures_to_main_memory
        MemPopContext
    endif
    if NOT IsNGC
        if GotParam frontend_level
            if (<frontend_level> = 1)
                LoadSkaterParts
            endif
        endif
    endif
    if InSplitScreenGame
        AllocateSplitScreenDMA
    endif
    if GotParam frontend_level
        if (current_screen_mode = standard_screen_mode)
            change ingame_screen_mode = standard_screen_mode
        else
            change ingame_screen_mode = (current_screen_mode)
            screen_setup_standard
        endif
    else
        if NOT (ingame_screen_mode = (current_screen_mode))
            switch (ingame_screen_mode)
                case standard_screeen_mode
                screen_setup_standard
                case widescreen_screen_mode
                screen_setup_widescreen
                case letterbox_screen_mode
                screen_setup_letterbox
            endswitch
        endif
    endif
    UnPauseGame
    if GotParam viewer_mode
        gameflow StandardGameFlowToggleView
        
        change assertonmissingscripts = 0
        change assertonmissingassets = 0
    else
        
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
        if GotParam frontend_level
            if (<frontend_level> = 1)
                LoadSkaterParts
            endif
        endif
    endif
endscript


script reset_level 
    ResetLevelFlags
    GetLevelStructureName
    if StructureContains structure = (<level_structure_name>)setup_script
        (<level_structure_name>.setup_script)
    endif
    setup_classic_stat_nodes level = (<level_structure_name>.level)level_num = (<level_structure_name>.level_num)
endscript


script OverrideSkaterSpeed Speed = 1000
    begin 
    if ObjectExists id = skater
        
        
        
        
        skater ::overridelimits max = <Speed> CurrentLevel
        break 
    endif
    wait 1 gameframe
    repeat 
endscript


script GetCurrentLevelName 
    GoalManager_GetLevelPrefix
    FormatText checksumname = level_info 'Level_%i' i = <level_prefix>
    return level_name = (<level_info>.name)
endscript


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
    GoalManager_Initializeallgoals
    GoalManager_SetCanStartGoal 1
    if CareerLevelIs LevelNum_Skateshop
        GoalManager_HideGoalPoints
        GoalManager_HidePoints
    else
        if NOT InMultiPlayerGame
            GoalManager_ShowGoalPoints
        endif
        if NOT (in_cinematic_sequence)
            GoalManager_ShowPoints
        endif
    endif
endscript


script level_cleanup_assets 
    <skaterNum> = 0
    begin 
    if SkaterExists skater = <skaterNum>
        
        if <ObjID> ::IsLocalSkater
            <ObjID> ::kill_all_vehicles
            <ObjID> ::SetAmmo 0
            <ObjID> ::ClearPagerMessages
        endif
    endif
    <skaterNum> = (<skaterNum> + 1)
    repeat 8
    if CompositeObjectExists name = TRG_Ped_TeammatePro
        TRG_Ped_TeammatePro ::obj_cleargeoms
    endif
    undo_fake_nigel
    SFX_Change_Footstep_Sounds_To_Default
    menu3d_unload_assets
    MemDeleteHeap name = 'TeammatePro'
    load_multiplayer_textures_to_main_memory unload dont_assert
    UnloadPreFile 'skaterparts.pre' dont_assert
    UnloadPreFile 'skaterparts_temp.pre' dont_assert
    if IsNGC
        UnloadPreFile 'skaterparts_secret.pre' dont_assert
        UnloadPreFile 'cagpieces.pre' dont_assert
    endif
endscript


script load_default 
    load_level level_default
endscript


script Load_EmptyDefault 
    load_level Level_EmptyDefault
endscript


script load_bo 
    load_level Level_BO
endscript


script load_au 
    load_level Level_AU
endscript


script load_ba 
    load_level Level_BA
endscript


script load_be 
    load_level Level_BE
endscript


script load_NO 
    load_level Level_NO
endscript


script load_st 
    load_level Level_ST
endscript


script load_se 
    load_level Level_SE
endscript


script load_se2 
    load_level Level_SE2
endscript


script load_tr 
    load_level Level_TR
endscript


script Load_TestLevel 
    load_level Level_TestLevel
endscript


script load_la 
    load_level Level_LA
endscript


script load_sc 
    load_level Level_SC
endscript


script load_ph 
    load_level Level_PH
endscript


script load_dj 
    load_level Level_DJ
endscript


script load_ca 
    load_level Level_CA
endscript


script load_ap 
    load_level Level_AP
endscript

level_default = {
    structure_name = level_default
    load_script = load_default
    name = 'Default'
    loading_screen = 'loadscrn_generic'
    loading_time = 9.500
    level = 'Default'
    sky = 'Default_Sky'
    qb = 'levels\Default\Default.qb'
    level_qb = 'levels\Default\Default_scripts.qb'
    startup_script = default_startup
    goals_script = Default_goals
    setup_script = Default_setup
    default_stats = 5
    default_stats_classic = 5
    level_number = LevelNum_Default
    viewer_mode = 1
    ambient_red = 54
    ambient_green = 63
    ambient_blue = 64
    ambient_mod_factor_lo = 1.100
    ambient_mod_factor_hi = 0.0
    heading_0 = 159
    pitch_0 = 308
    red_0 = 136
    green_0 = 120
    blue_0 = 110
    mod_factor_0_lo = 0.0
    mod_factor_0_hi = 0.0
    heading_1 = 305
    pitch_1 = 37
    red_1 = 72
    green_1 = 70
    blue_1 = 66
    mod_factor_1_lo = 1.300
    mod_factor_1_hi = 0.0
    num_m_heads = 4
    num_m_torsos = 4
    num_m_legs = 4
}
Level_EmptyDefault = {
    structure_name = Level_EmptyDefault
    load_script = Load_EmptyDefault
    name = 'Default'
    loading_screen = 'loadscrn_generic'
    loading_time = 9.500
    level = 'Default'
    sky = 'Default_Sky'
    default_stats = 5
    default_stats_classic = 5
    level_number = LevelNum_Default
    viewer_mode = 1
    ambient_red = 69
    ambient_green = 72
    ambient_blue = 79
    ambient_mod_factor_lo = 0.3000
    ambient_mod_factor_hi = 0.0
    heading_0 = 120.0
    pitch_0 = -127.0
    red_0 = 130
    green_0 = 120
    blue_0 = 97
    mod_factor_0_lo = 1.400
    mod_factor_0_hi = 0.0
    heading_1 = -45.0
    pitch_1 = -110.0
    red_1 = 58
    green_1 = 62
    blue_1 = 66
    mod_factor_1_lo = 0.1000
    mod_factor_1_hi = 0.0
    num_m_heads = 4
    num_m_torsos = 4
    num_m_legs = 4
}
Level_TR = {
    structure_name = Level_TR
    load_script = load_tr
    name = 'Training'
    ambient_track = 'music\vag\backgrounds\tr_bg'
    loading_screen = 'loadscrn_training'
    loading_time = 9.350
    tod_manager_active = 0
    COIM_size = 614400
    pre = 'TR_scripts.pre'
    scnpre = 'TRscn.pre'
    level = 'TR'
    sky = 'TR_Sky'
    qb = 'levels\TR\TR.qb'
    colpre = 'TRcol.pre'
    pedpre = 'TRped.pre'
    level_qb = 'levels\TR\TR_scripts.qb'
    level_sfx_qb = 'levels\TR\TR_sfx.qb'
    menu3d_name = 'menu3d\tr_menu3d\tr_menu3d.mdl'
    menu3d_sprites = [
        'PanelSprites/Menu3d/TR_icon_1'
        'PanelSprites/Menu3d/TR_icon_2'
    ]
    more_level_qbs = [
        'levels\TR\TR_cutscene_particle_data.qb'
        'levels\TR\TR_level_particle_data.qb'
        'levels\TR\TR_cutscene_fast_particle_data.qb'
        'levels\TR\TR_level_fast_particle_data.qb'
    ]
    startup_script = TR_Startup
    goals_script = TR_goals
    setup_script = TR_setup
    default_stats = 5
    default_stats_classic = 7
    level_number = LevelNum_TR
    skip_teammate_pro
    ambient_red = 54
    ambient_green = 63
    ambient_blue = 64
    ambient_mod_factor_lo = 1.100
    ambient_mod_factor_hi = 0.0
    heading_0 = 159
    pitch_0 = 308
    red_0 = 136
    green_0 = 120
    blue_0 = 110
    mod_factor_0_lo = 0.0
    mod_factor_0_hi = 0.0
    heading_1 = 305
    pitch_1 = 37
    red_1 = 72
    green_1 = 70
    blue_1 = 66
    mod_factor_1_lo = 1.300
    mod_factor_1_hi = 0.0
    fog_red = 0
    fog_blue = 0
    fog_green = 0
    fog_alpha = 0
    fog_dist = 0
    num_m_heads = 8
    num_m_torsos = 8
    num_m_legs = 6
}
Level_BO = {
    structure_name = Level_BO
    load_script = load_bo
    name = 'Boston'
    ambient_track = 'music\vag\backgrounds\bo_bg'
    loading_screen = 'loadscrn_boston'
    loading_time = 12.40
    tod_manager_active = 1
    COIM_size = 768000
    pre = 'BO_scripts.pre'
    scnpre = 'BOscn.pre'
    level = 'BO'
    sky = 'BO_Sky'
    qb = 'levels\BO\BO.qb'
    colpre = 'BOcol.pre'
    pedpre = 'BOped.pre'
    level_qb = 'levels\BO\BO_scripts.qb'
    level_sfx_qb = 'levels\BO\BO_sfx.qb'
    menu3d_name = 'menu3d\bo_menu3d\bo_menu3d.mdl'
    menu3d_sprites = [
        'PanelSprites/Menu3d/BO_icon_1'
        'PanelSprites/Menu3d/BO_icon_2'
    ]
    more_level_qbs = [
        'levels\BO\BO_cutscene_particle_data.qb'
        'levels\BO\BO_level_particle_data.qb'
        'levels\BO\BO_cutscene_fast_particle_data.qb'
        'levels\BO\BO_level_fast_particle_data.qb'
    ]
    startup_script = BO_startup
    goals_script = BO_Goals
    setup_script = BO_Setup
    default_stats = 5
    default_stats_classic = 7
    level_number = LevelNum_BO
    special_ped_info = [
        {type = pro flag = PRO_FOUND_01}
        {type = guest name = benfranklin}
        {type = flavor name = segwayrider}
    ]
    ambient_red = 54
    ambient_green = 63
    ambient_blue = 64
    ambient_mod_factor_lo = 1.100
    ambient_mod_factor_hi = 0.0
    heading_0 = 159
    pitch_0 = 308
    red_0 = 136
    green_0 = 120
    blue_0 = 110
    mod_factor_0_lo = 0.0
    mod_factor_0_hi = 0.0
    heading_1 = 305
    pitch_1 = 37
    red_1 = 72
    green_1 = 70
    blue_1 = 66
    mod_factor_1_lo = 1.300
    mod_factor_1_hi = 0.0
    fog_red = 0
    fog_blue = 0
    fog_green = 0
    fog_alpha = 0
    fog_dist = 0
    num_m_heads = 6
    num_m_torsos = 6
    num_m_legs = 4
}
Level_BA = {
    structure_name = Level_BA
    load_script = load_ba
    name = 'Barcelona'
    ambient_track = 'music\vag\backgrounds\ba_bg'
    loading_screen = 'loadscrn_barcelona'
    loading_time = 13.39
    COIM_size = 1536000
    tod_manager_active = 1
    pre = 'BA_scripts.pre'
    scnpre = 'BAscn.pre'
    level = 'BA'
    sky = 'BA_Sky'
    qb = 'levels\BA\BA.qb'
    colpre = 'BAcol.pre'
    pedpre = 'BAped.pre'
    level_qb = 'levels\BA\BA_scripts.qb'
    level_sfx_qb = 'levels\BA\BA_sfx.qb'
    menu3d_name = 'menu3d\ba_menu3d\ba_menu3d.mdl'
    menu3d_sprites = [
        'PanelSprites/Menu3d/BA_icon_1'
        'PanelSprites/Menu3d/BA_icon_2'
    ]
    more_level_qbs = [
        'levels\BA\BA_cutscene_particle_data.qb'
        'levels\BA\BA_level_particle_data.qb'
        'levels\BA\BA_cutscene_fast_particle_data.qb'
        'levels\BA\BA_level_fast_particle_data.qb'
    ]
    startup_script = BA_startup
    goals_script = BA_Goals
    setup_script = BA_Setup
    tod_script = BA_TOD
    default_stats = 7
    default_stats_classic = 3
    level_number = LevelNum_BA
    special_ped_info = [
        {type = pro flag = PRO_FOUND_02}
        {name = BullFighter type = guest}
        {name = MechBullrider type = flavor}
    ]
    ambient_red = 54
    ambient_green = 63
    ambient_blue = 64
    ambient_mod_factor_lo = 1.100
    ambient_mod_factor_hi = 0.0
    heading_0 = 159
    pitch_0 = 308
    red_0 = 136
    green_0 = 120
    blue_0 = 110
    mod_factor_0_lo = 0
    mod_factor_0_hi = 0
    heading_1 = 305
    pitch_1 = 37
    red_1 = 72
    green_1 = 70
    blue_1 = 66
    mod_factor_1_lo = 1.300
    mod_factor_1_hi = 0.0
    fog_red = 100
    fog_blue = 150
    fog_green = 120
    fog_alpha = 50
    fog_dist = 1000
    num_m_heads = 8
    num_m_torsos = 8
    num_m_legs = 6
}
Level_BE = {
    structure_name = Level_BE
    load_script = load_be
    name = 'Berlin'
    ambient_track = 'music\vag\backgrounds\be_bg'
    loading_screen = 'loadscrn_berlin'
    loading_time = 14.58
    COIM_size = 1331200
    tod_manager_active = 1
    pre = 'BE_scripts.pre'
    scnpre = 'BEscn.pre'
    level = 'BE'
    sky = 'BE_Sky'
    qb = 'levels\BE\BE.qb'
    colpre = 'BEcol.pre'
    pedpre = 'BEped.pre'
    level_qb = 'levels\BE\BE_scripts.qb'
    level_sfx_qb = 'levels\BE\BE_sfx.qb'
    menu3d_name = 'menu3d\be_menu3d\be_menu3d.mdl'
    menu3d_sprites = [
        'PanelSprites/Menu3d/BE_icon_1'
        'PanelSprites/Menu3d/BE_icon_2'
    ]
    more_level_qbs = [
        'levels\BE\BE_cutscene_particle_data.qb'
        'levels\BE\BE_level_particle_data.qb'
        'levels\BE\BE_cutscene_fast_particle_data.qb'
        'levels\BE\BE_level_fast_particle_data.qb'
    ]
    startup_script = BE_startup
    goals_script = BE_Goals
    setup_script = BE_Setup
    default_stats = 8
    default_stats_classic = 5
    level_number = LevelNum_BE
    skip_teammate_pro
    special_ped_info = [
        {type = pro flag = PRO_FOUND_03}
        {name = GraffitiTagger type = guest}
        {name = Paulie type = flavor}
    ]
    ambient_red = 54
    ambient_green = 63
    ambient_blue = 64
    ambient_mod_factor_lo = 1.100
    ambient_mod_factor_hi = 0.0
    heading_0 = 159
    pitch_0 = 308
    red_0 = 136
    green_0 = 120
    blue_0 = 110
    mod_factor_0_lo = 0
    mod_factor_0_hi = 0
    heading_1 = 305
    pitch_1 = 37
    red_1 = 72
    green_1 = 70
    blue_1 = 66
    mod_factor_1_lo = 1.300
    mod_factor_1_hi = 0.0
    fog_red = 0
    fog_blue = 0
    fog_green = 0
    fog_alpha = 0
    fog_dist = 0
    num_m_heads = 4
    num_m_torsos = 4
    num_m_legs = 3
    num_f_heads = 3
    num_f_torsos = 3
    num_f_legs = 3
}
Level_AU = {
    structure_name = Level_AU
    load_script = load_au
    name = 'Australia'
    ambient_track = 'music\vag\backgrounds\au_bg'
    loading_screen = 'loadscrn_australia'
    loading_time = 12.28
    tod_manager_active = 1
    pre = 'AU_scripts.pre'
    scnpre = 'AUscn.pre'
    level = 'AU'
    sky = 'AU_Sky'
    qb = 'levels\AU\AU.qb'
    colpre = 'AUcol.pre'
    pedpre = 'AUped.pre'
    level_qb = 'levels\AU\AU_scripts.qb'
    level_sfx_qb = 'levels\AU\AU_sfx.qb'
    menu3d_name = 'menu3d\au_menu3d\au_menu3d.mdl'
    menu3d_sprites = [
        'PanelSprites/Menu3d/AU_icon_1'
        'PanelSprites/Menu3d/AU_icon_2'
    ]
    more_level_qbs = [
        'levels\AU\AU_cutscene_particle_data.qb'
        'levels\AU\AU_level_particle_data.qb'
        'levels\AU\AU_cutscene_fast_particle_data.qb'
        'levels\AU\AU_level_fast_particle_data.qb'
    ]
    startup_script = AU_Startup
    goals_script = AU_Goals
    setup_script = AU_Setup
    default_stats = 6
    default_stats_classic = 4
    level_number = LevelNum_AU
    sun_theta = [ 50.0 65.0 90.0 90.0 ]
    ambient_red = 54
    ambient_green = 63
    ambient_blue = 64
    ambient_mod_factor_lo = 1.100
    ambient_mod_factor_hi = 0.0
    heading_0 = 159
    pitch_0 = 308
    red_0 = 136
    green_0 = 120
    blue_0 = 110
    mod_factor_0_lo = 0
    mod_factor_0_hi = 0
    heading_1 = 305
    pitch_1 = 37
    red_1 = 72
    green_1 = 70
    blue_1 = 66
    mod_factor_1_lo = 1.300
    mod_factor_1_hi = 0.0
    fog_red = 0
    fog_blue = 0
    fog_green = 0
    fog_alpha = 0
    fog_dist = 0
    num_m_heads = 4
    num_m_torsos = 4
    num_m_legs = 4
    num_f_heads = 4
    num_f_torsos = 4
    num_f_legs = 4
    special_ped_info = [
        {type = pro flag = PRO_FOUND_04}
        {name = ShrimpVendor type = guest}
        {name = minikartdriver type = flavor}
    ]
}
Level_NO = {
    structure_name = Level_NO
    load_script = load_NO
    name = 'New Orleans'
    ambient_track = 'music\vag\backgrounds\no_bg'
    loading_screen = 'loadscrn_new_orleans'
    loading_time = 13.93
    COIM_size = 1331200
    tod_manager_active = 1
    pre = 'NO_scripts.pre'
    scnpre = 'NOscn.pre'
    level = 'NO'
    sky = 'NO_Sky'
    qb = 'levels\NO\NO.qb'
    colpre = 'NOcol.pre'
    pedpre = 'NOped.pre'
    level_qb = 'levels\NO\NO_scripts.qb'
    level_sfx_qb = 'levels\NO\NO_sfx.qb'
    menu3d_name = 'menu3d\no_menu3d\no_menu3d.mdl'
    menu3d_sprites = [
        'PanelSprites/Menu3d/NO_icon_1'
        'PanelSprites/Menu3d/NO_icon_2'
    ]
    more_level_qbs = [
        'levels\NO\NO_cutscene_particle_data.qb'
        'levels\NO\NO_level_particle_data.qb'
        'levels\NO\NO_cutscene_fast_particle_data.qb'
        'levels\NO\NO_level_fast_particle_data.qb'
    ]
    startup_script = NO_Startup
    goals_script = NO_goals
    setup_script = NO_setup
    default_stats = 8
    default_stats_classic = 7
    level_number = LevelNum_NO
    tod_state = Night
    ambient_red = 54
    ambient_green = 63
    ambient_blue = 64
    ambient_mod_factor_lo = 1.100
    ambient_mod_factor_hi = 0.0
    heading_0 = 159
    pitch_0 = 308
    red_0 = 136
    green_0 = 120
    blue_0 = 110
    mod_factor_0_lo = 0
    mod_factor_0_hi = 0
    heading_1 = 305
    pitch_1 = 37
    red_1 = 72
    green_1 = 70
    blue_1 = 66
    mod_factor_1_lo = 1.300
    mod_factor_1_hi = 1.300
    fog_red = 0
    fog_blue = 0
    fog_green = 0
    fog_alpha = 0
    fog_dist = 0
    num_m_heads = 3
    num_m_torsos = 3
    num_m_legs = 3
    num_f_heads = 4
    num_f_torsos = 4
    num_f_legs = 3
    special_ped_info = [
        {type = pro flag = PRO_FOUND_05}
        {type = guest name = jester}
        {type = flavor name = Voodoo}
    ]
}
Level_TestLevel = {
    structure_name = Level_TestLevel
    load_script = Load_TestLevel
    name = 'TestLevel'
    loading_screen = 'loadscrn_generic'
    loading_time = 9.500
    COIM_size = 1331200
    pre = 'TestLevel_scripts.pre'
    scnpre = 'TestLevelscn.pre'
    level = 'TestLevel'
    sky = 'TestLevel_Sky'
    qb = 'levels\TestLevel\TestLevel.qb'
    colpre = 'TestLevelcol.pre'
    pedpre = 'TestLevelped.pre'
    level_qb = 'levels\TestLevel\TestLevel_scripts.qb'
    startup_script = TestLevel_Startup
    goals_script = TestLevel_goals
    setup_script = TestLevel_setup
    default_stats = 10
    default_stats_classic = 10
    level_number = LevelNum_Default
    ambient_red = 54
    ambient_green = 63
    ambient_blue = 64
    ambient_mod_factor_lo = 1.100
    ambient_mod_factor_hi = 0.0
    heading_0 = 159
    pitch_0 = 308
    red_0 = 136
    green_0 = 120
    blue_0 = 110
    mod_factor_0_hi = 0
    mod_factor_0_lo = 0
    heading_1 = 305
    pitch_1 = 37
    red_1 = 72
    green_1 = 70
    blue_1 = 66
    mod_factor_1_hi = 1.300
    mod_factor_1_lo = 0.0
    fog_red = 0
    fog_blue = 0
    fog_green = 0
    fog_alpha = 0
    fog_dist = 0
    num_m_heads = 10
    num_m_torsos = 10
    num_m_legs = 8
}
Level_ST = {
    structure_name = Level_ST
    load_script = load_st
    name = 'Skatopia'
    ambient_track = 'music\vag\backgrounds\st_bg'
    loading_screen = 'loadscrn_skatopia'
    loading_time = 10.25
    COIM_size = 1331200
    tod_manager_active = 1
    pre = 'ST_scripts.pre'
    scnpre = 'STscn.pre'
    level = 'ST'
    sky = 'ST_Sky'
    qb = 'levels\ST\ST.qb'
    colpre = 'STcol.pre'
    pedpre = 'STped.pre'
    level_qb = 'levels\ST\ST_scripts.qb'
    level_sfx_qb = 'levels\ST\ST_sfx.qb'
    menu3d_name = 'menu3d\st_menu3d\st_menu3d.mdl'
    menu3d_sprites = [
        'PanelSprites/Menu3d/SK_icon_1'
        'PanelSprites/Menu3d/SK_icon_2'
    ]
    more_level_qbs = [
        'levels\ST\ST_cutscene_particle_data.qb'
        'levels\ST\ST_level_particle_data.qb'
        'levels\ST\ST_cutscene_fast_particle_data.qb'
        'levels\ST\ST_level_fast_particle_data.qb'
    ]
    startup_script = ST_Startup
    goals_script = ST_goals
    setup_script = ST_setup
    default_stats = 7
    default_stats_classic = 4
    level_number = LevelNum_ST
    ambient_red = 54
    ambient_green = 63
    ambient_blue = 64
    ambient_mod_factor_lo = 1.100
    ambient_mod_factor_hi = 0.0
    heading_0 = 159
    pitch_0 = 308
    red_0 = 136
    green_0 = 120
    blue_0 = 110
    mod_factor_0_lo = 0
    mod_factor_0_hi = 0
    heading_1 = 305
    pitch_1 = 37
    red_1 = 72
    green_1 = 70
    blue_1 = 66
    mod_factor_1_lo = 1.300
    mod_factor_1_hi = 0.0
    fog_red = 0
    fog_blue = 0
    fog_green = 0
    fog_alpha = 0
    fog_dist = 0
    num_m_heads = 8
    num_m_torsos = 8
    num_m_legs = 6
    special_ped_info = [
        {type = pro flag = PRO_FOUND_06}
        {type = guest name = sheckler}
        {type = flavor name = chainsawskater}
    ]
}
Level_SE = {
    structure_name = Level_SE
    load_script = load_se
    name = 'Pro Skater'
    ambient_track = ['music\vag\backgrounds\se_bg'
        'music\vag\backgrounds\se_bg2'
        'music\vag\backgrounds\se_bg3'
    ]
    loading_screen = 'loadscrn_secret_1'
    loading_time = 9.470
    COIM_size = 1331200
    tod_manager_active = 0
    pre = 'SE_scripts.pre'
    scnpre = 'SEscn.pre'
    level = 'SE'
    sky = 'SE_Sky'
    qb = 'levels\SE\SE.qb'
    colpre = 'SEcol.pre'
    pedpre = 'SEped.pre'
    level_qb = 'levels\SE\SE_scripts.qb'
    level_sfx_qb = 'levels\SE\SE_sfx.qb'
    menu3d_name = 'menu3d\se_menu3d\se_menu3d.mdl'
    menu3d_sprites = [ 
    'PanelSprites/Menu3d/SE_icon_1'
     ]
    more_level_qbs = [
        'levels\SE\SE_cutscene_particle_data.qb'
        'levels\SE\SE_level_particle_data.qb'
        'levels\SE\SE_cutscene_fast_particle_data.qb'
        'levels\SE\SE_level_fast_particle_data.qb'
    ]
    startup_script = SE_Startup
    goals_script = SE_goals
    setup_script = SE_setup
    default_stats = 7
    default_stats_classic = 7
    level_number = LevelNum_SE
    ambient_red = 54
    ambient_green = 63
    ambient_blue = 64
    ambient_mod_factor_lo = 1.100
    ambient_mod_factor_hi = 0.0
    heading_0 = 159
    pitch_0 = 308
    red_0 = 136
    green_0 = 120
    blue_0 = 110
    mod_factor_0_lo = 0
    mod_factor_0_hi = 0
    heading_1 = 305
    pitch_1 = 37
    red_1 = 72
    green_1 = 70
    blue_1 = 66
    mod_factor_1_lo = 1.300
    mod_factor_1_hi = 0.0
    fog_red = 0
    fog_blue = 0
    fog_green = 0
    fog_alpha = 0
    fog_dist = 0
    num_m_heads = 8
    num_m_torsos = 8
    num_m_legs = 6
    uber_frig_height = 800.0
}
Level_SE2 = {
    structure_name = Level_SE2
    load_script = load_se2
    name = 'The Triangle'
    ambient_track = 'music\vag\backgrounds\se2_bg'
    loading_screen = 'loadscrn_secret_2'
    loading_time = 7.310
    COIM_size = 1331200
    tod_manager_active = 0
    pre = 'SE2_scripts.pre'
    scnpre = 'SE2scn.pre'
    level = 'SE2'
    sky = 'SE2_Sky'
    qb = 'levels\SE2\SE2.qb'
    colpre = 'SE2col.pre'
    pedpre = 'SE2ped.pre'
    level_qb = 'levels\SE2\SE2_scripts.qb'
    level_sfx_qb = 'levels\SE2\SE2_sfx.qb'
    menu3d_name = 'menu3d\se2_menu3d\se2_menu3d.mdl'
    menu3d_sprites = [
        'PanelSprites/Menu3d/SE2_icon_1'
        'PanelSprites/Menu3d/SE2_icon_2'
    ]
    more_level_qbs = [
        'levels\SE2\SE2_cutscene_particle_data.qb'
        'levels\SE2\SE2_level_particle_data.qb'
        'levels\SE2\SE2_cutscene_fast_particle_data.qb'
        'levels\SE2\SE2_level_fast_particle_data.qb'
    ]
    startup_script = SE2_Startup
    goals_script = SE2_goals
    setup_script = SE2_setup
    default_stats = 7
    default_stats_classic = 9
    level_number = LevelNum_SE2
    ambient_red = 54
    ambient_green = 63
    ambient_blue = 64
    ambient_mod_factor_lo = 1.100
    ambient_mod_factor_hi = 0.0
    heading_0 = 159
    pitch_0 = 308
    red_0 = 136
    green_0 = 120
    blue_0 = 110
    mod_factor_0_lo = 0
    mod_factor_0_hi = 0
    heading_1 = 305
    pitch_1 = 37
    red_1 = 72
    green_1 = 70
    blue_1 = 66
    mod_factor_1_lo = 1.300
    mod_factor_1_hi = 0.0
    fog_red = 0
    fog_blue = 0
    fog_green = 0
    fog_alpha = 0
    fog_dist = 0
    num_m_heads = 8
    num_m_torsos = 8
    num_m_legs = 6
}

script load_mainmenu 
    load_level level_Mainmenu
endscript

level_Mainmenu = {
    structure_name = level_Mainmenu
    load_script = load_mainmenu
    name = 'Main Menu'
    loading_screen = 'loadscrn_generic'
    loading_time = 6.750
    COIM_size = 10240
    loading_time_xbox = 11.0
    level_name = 'mainmenu'
    pre = 'mainmenu_scripts.pre'
    scnpre = 'mainmenuscn.pre'
    level = 'mainmenu'
    qb = 'levels\mainmenu\mainmenu.qb'
    colpre = 'mainmenucol.pre'
    level_qb = 'levels\mainmenu\mainmenu_scripts.qb'
    more_level_qbs = [
        'levels\mainmenu\mainmenu_options.qb'
        'levels\mainmenu\mainmenu_net.qb'
        'levels\mainmenu\mainmenu_cas.qb'
        'levels\mainmenu\neversoft_skaters.qb'
        'levels\mainmenu\mainmenu_facemapping.qb'
        'levels\mainmenu\casmenu.qb'
        'levels\mainmenu\colormenu.qb'
        'levels\mainmenu\scalingmenu.qb'
        'levels\mainmenu\edit_graphics_premade.qb'
        'levels\mainmenu\edit_graphics_sprites.qb'
        'levels\mainmenu\instructions_caf.qb'
        'levels\mainmenu\edit_graphics_menu.qb'
    ]
    startup_script = mainmenu_startup
    default_stats = 8
    level_number = LevelNum_Skateshop
    frontend_level = 1
    skip_teammate_pro
    ambient_red = 66
    ambient_green = 67
    ambient_blue = 68
    ambient_mod_factor_lo = 0.0
    ambient_mod_factor_hi = 0.0
    heading_0 = -90.0
    pitch_0 = -10.0
    red_0 = 0
    green_0 = 0
    blue_0 = 0
    mod_factor_0_lo = 0.0
    mod_factor_0_hi = 0.0
    heading_1 = -120.0
    pitch_1 = 120.0
    red_1 = 0
    green_1 = 0
    blue_1 = 0
    mod_factor_1_lo = 0.0
    mod_factor_1_hi = 0.0
}
Level_LA = {
    structure_name = Level_LA
    load_script = load_la
    name = 'Los Angeles'
    ambient_track = 'music\vag\backgrounds\la_bg'
    loading_screen = 'loadscrn_los_angeles'
    loading_time = 8.670
    COIM_size = 1331200
    tod_manager_active = 0
    pre = 'LA_scripts.pre'
    scnpre = 'LAscn.pre'
    level = 'LA'
    sky = 'LA_Sky'
    qb = 'levels\LA\LA.qb'
    colpre = 'LAcol.pre'
    pedpre = 'LAped.pre'
    level_qb = 'levels\LA\LA_scripts.qb'
    level_sfx_qb = 'levels\LA\LA_sfx.qb'
    menu3d_name = 'menu3d\la_menu3d\la_menu3d.mdl'
    menu3d_sprites = [
        'PanelSprites/Menu3d/LA_icon_1'
        'PanelSprites/Menu3d/LA_icon_2'
    ]
    more_level_qbs = [
        'levels\LA\LA_cutscene_particle_data.qb'
        'levels\LA\LA_level_particle_data.qb'
        'levels\LA\LA_cutscene_fast_particle_data.qb'
        'levels\LA\LA_level_fast_particle_data.qb'
    ]
    startup_script = LA_startup
    goals_script = LA_Goals
    setup_script = LA_Setup
    default_stats = 5
    default_stats_classic = 9
    level_number = LevelNum_LA
    ambient_red = 69
    ambient_green = 72
    ambient_blue = 79
    ambient_mod_factor_lo = 0.3000
    ambient_mod_factor_hi = 0.0
    heading_0 = 50
    pitch_0 = 330
    red_0 = 130
    green_0 = 120
    blue_0 = 97
    mod_factor_0_lo = 1.400
    mod_factor_0_hi = 0.0
    heading_1 = 240
    pitch_1 = 330
    red_1 = 58
    green_1 = 62
    blue_1 = 66
    mod_factor_1_lo = 0.4000
    mod_factor_1_hi = 0.0
    fog_red = 0
    fog_blue = 0
    fog_green = 0
    fog_alpha = 0
    fog_dist = 0
    num_m_heads = 8
    num_m_torsos = 8
    num_m_legs = 6
}
Level_SC = {
    structure_name = Level_SC
    load_script = load_sc
    name = 'School 1'
    ambient_track = 'music\vag\backgrounds\sc_bg'
    loading_screen = 'loadscrn_school'
    loading_time = 6.150
    COIM_size = 1331200
    tod_manager_active = 0
    pre = 'SC_scripts.pre'
    scnpre = 'SCscn.pre'
    level = 'SC'
    sky = 'SC_Sky'
    qb = 'levels\SC\SC.qb'
    colpre = 'SCcol.pre'
    pedpre = 'SCped.pre'
    level_qb = 'levels\SC\SC_scripts.qb'
    level_sfx_qb = 'levels\SC\SC_sfx.qb'
    menu3d_name = 'menu3d\sc_menu3d\sc_menu3d.mdl'
    menu3d_sprites = [
        'PanelSprites/Menu3d/SC_icon_1'
        'PanelSprites/Menu3d/SC_icon_2'
    ]
    more_level_qbs = [
        'levels\SC\SC_cutscene_particle_data.qb'
        'levels\SC\SC_level_particle_data.qb'
        'levels\SC\SC_cutscene_fast_particle_data.qb'
        'levels\SC\SC_level_fast_particle_data.qb'
    ]
    startup_script = SC_Startup
    goals_script = SC_goals
    setup_script = SC_setup
    default_stats = 5
    default_stats_classic = 5
    level_number = LevelNum_SC
    ambient_red = 69
    ambient_green = 72
    ambient_blue = 79
    ambient_mod_factor_lo = 0.3000
    ambient_mod_factor_hi = 0.0
    heading_0 = 50
    pitch_0 = 330
    red_0 = 130
    green_0 = 120
    blue_0 = 97
    mod_factor_0_lo = 1.400
    mod_factor_0_hi = 0.0
    heading_1 = 240
    pitch_1 = 330
    red_1 = 58
    green_1 = 62
    blue_1 = 66
    mod_factor_1_lo = 0.4000
    mod_factor_1_hi = 0.0
    fog_red = 0
    fog_blue = 0
    fog_green = 0
    fog_alpha = 0
    fog_dist = 0
    num_m_heads = 8
    num_m_torsos = 8
    num_m_legs = 6
}
Level_PH = {
    structure_name = Level_PH
    load_script = load_ph
    name = 'Philly'
    ambient_track = 'music\vag\backgrounds\ph_bg'
    loading_screen = 'loadscrn_philly'
    loading_time = 7.120
    COIM_size = 1331200
    tod_manager_active = 0
    pre = 'PH_scripts.pre'
    scnpre = 'PHscn.pre'
    level = 'PH'
    sky = 'PH_Sky'
    qb = 'levels\PH\PH.qb'
    colpre = 'PHcol.pre'
    pedpre = 'PHped.pre'
    level_qb = 'levels\PH\PH_scripts.qb'
    level_sfx_qb = 'levels\PH\PH_sfx.qb'
    menu3d_name = 'menu3d\PH_menu3d\PH_menu3d.mdl'
    menu3d_sprites = [
        'PanelSprites/Menu3d/PH_icon_1'
        'PanelSprites/Menu3d/PH_icon_2'
    ]
    more_level_qbs = [
        'levels\PH\PH_cutscene_particle_data.qb'
        'levels\PH\PH_level_particle_data.qb'
        'levels\PH\PH_cutscene_fast_particle_data.qb'
        'levels\PH\PH_level_fast_particle_data.qb'
    ]
    startup_script = PH_Startup
    goals_script = PH_goals
    setup_script = PH_setup
    default_stats = 5
    default_stats_classic = 8
    level_number = LevelNum_PH
    ambient_red = 69
    ambient_green = 72
    ambient_blue = 79
    ambient_mod_factor_lo = 0.3000
    ambient_mod_factor_hi = 0.0
    heading_0 = 50
    pitch_0 = 330
    red_0 = 130
    green_0 = 120
    blue_0 = 97
    mod_factor_0_lo = 1.400
    mod_factor_0_hi = 0.0
    heading_1 = 240
    pitch_1 = 330
    red_1 = 58
    green_1 = 62
    blue_1 = 66
    mod_factor_1_lo = 0.4000
    mod_factor_1_hi = 0.0
    fog_red = 0
    fog_blue = 0
    fog_green = 0
    fog_alpha = 0
    fog_dist = 0
    num_m_heads = 8
    num_m_torsos = 8
    num_m_legs = 6
}
Level_DJ = {
    structure_name = Level_DJ
    load_script = load_dj
    name = 'Downhill Jam'
    ambient_track = 'music\vag\backgrounds\dj_bg'
    loading_screen = 'loadscrn_downhill'
    loading_time = 5.860
    COIM_size = 1331200
    tod_manager_active = 0
    pre = 'DJ_scripts.pre'
    scnpre = 'DJscn.pre'
    level = 'DJ'
    sky = 'DJ_Sky'
    qb = 'levels\DJ\DJ.qb'
    colpre = 'DJcol.pre'
    pedpre = 'DJped.pre'
    level_qb = 'levels\DJ\DJ_scripts.qb'
    level_sfx_qb = 'levels\DJ\DJ_sfx.qb'
    menu3d_name = 'menu3d\DJ_menu3d\DJ_menu3d.mdl'
    menu3d_sprites = [
        'PanelSprites/Menu3d/DJ_icon_1'
        'PanelSprites/Menu3d/DJ_icon_2'
    ]
    more_level_qbs = [
        'levels\DJ\DJ_cutscene_particle_data.qb'
        'levels\DJ\DJ_level_particle_data.qb'
        'levels\DJ\DJ_cutscene_fast_particle_data.qb'
        'levels\DJ\DJ_level_fast_particle_data.qb'
    ]
    startup_script = DJ_startup
    goals_script = DJ_Goals
    setup_script = DJ_Setup
    default_stats = 5
    default_stats_classic = 6
    level_number = LevelNum_DJ
    ambient_red = 69
    ambient_green = 72
    ambient_blue = 79
    ambient_mod_factor_lo = 0.3000
    ambient_mod_factor_hi = 0.0
    heading_0 = 50
    pitch_0 = 330
    red_0 = 130
    green_0 = 120
    blue_0 = 97
    mod_factor_0_lo = 1.400
    mod_factor_0_hi = 0.0
    heading_1 = 240
    pitch_1 = 330
    red_1 = 58
    green_1 = 62
    blue_1 = 66
    mod_factor_1_lo = 0.4000
    mod_factor_1_hi = 0.0
    fog_red = 0
    fog_blue = 0
    fog_green = 0
    fog_alpha = 0
    fog_dist = 0
    num_m_heads = 8
    num_m_torsos = 8
    num_m_legs = 6
}
Level_CA = {
    structure_name = Level_CA
    load_script = load_ca
    name = 'Canada'
    ambient_track = 'music\vag\backgrounds\ca_bg'
    loading_screen = 'loadscrn_canada'
    loading_time = 6.800
    COIM_size = 1331200
    tod_manager_active = 0
    pre = 'CA_scripts.pre'
    scnpre = 'CAscn.pre'
    level = 'CA'
    sky = 'CA_Sky'
    qb = 'levels\CA\CA.qb'
    colpre = 'CAcol.pre'
    pedpre = 'CAped.pre'
    level_qb = 'levels\CA\CA_scripts.qb'
    level_sfx_qb = 'levels\CA\CA_sfx.qb'
    menu3d_name = 'menu3d\CA_menu3d\CA_menu3d.mdl'
    menu3d_sprites = [
        'PanelSprites/Menu3d/CA_icon_1'
        'PanelSprites/Menu3d/CA_icon_2'
    ]
    more_level_qbs = [
        'levels\CA\CA_cutscene_particle_data.qb'
        'levels\CA\CA_level_particle_data.qb'
        'levels\CA\CA_cutscene_fast_particle_data.qb'
        'levels\CA\CA_level_fast_particle_data.qb'
    ]
    startup_script = CA_Startup
    goals_script = CA_goals
    setup_script = CA_setup
    default_stats = 5
    default_stats_classic = 8
    level_number = LevelNum_CA
    ambient_red = 69
    ambient_green = 72
    ambient_blue = 79
    ambient_mod_factor_lo = 0.3000
    ambient_mod_factor_hi = 0.0
    heading_0 = 50
    pitch_0 = 330
    red_0 = 130
    green_0 = 120
    blue_0 = 97
    mod_factor_0_lo = 1.400
    mod_factor_0_hi = 0.0
    heading_1 = 240
    pitch_1 = 330
    red_1 = 58
    green_1 = 62
    blue_1 = 66
    mod_factor_1_lo = 0.4000
    mod_factor_1_hi = 0.0
    fog_red = 0
    fog_blue = 0
    fog_green = 0
    fog_alpha = 0
    fog_dist = 0
    num_m_heads = 8
    num_m_torsos = 8
    num_m_legs = 6
}
Level_AP = {
    structure_name = Level_AP
    load_script = load_ap
    name = 'Airport'
    ambient_track = 'music\vag\backgrounds\ap_bg'
    loading_screen = 'loadscrn_airport'
    loading_time = 7.830
    COIM_size = 1331200
    tod_manager_active = 0
    pre = 'AP_scripts.pre'
    scnpre = 'APscn.pre'
    level = 'AP'
    sky = 'AP_Sky'
    qb = 'levels\AP\AP.qb'
    colpre = 'APcol.pre'
    pedpre = 'APped.pre'
    level_qb = 'levels\AP\AP_scripts.qb'
    level_sfx_qb = 'levels\AP\AP_sfx.qb'
    menu3d_name = 'menu3d\AP_menu3d\AP_menu3d.mdl'
    menu3d_sprites = [
        'PanelSprites/Menu3d/AP_icon_1'
        'PanelSprites/Menu3d/AP_icon_2'
    ]
    more_level_qbs = [
        'levels\AP\AP_cutscene_particle_data.qb'
        'levels\AP\AP_level_particle_data.qb'
        'levels\AP\AP_cutscene_fast_particle_data.qb'
        'levels\AP\AP_level_fast_particle_data.qb'
    ]
    startup_script = AP_startup
    goals_script = AP_Goals
    setup_script = AP_Setup
    default_stats = 5
    default_stats_classic = 5
    level_number = LevelNum_AP
    ambient_red = 69
    ambient_green = 72
    ambient_blue = 79
    ambient_mod_factor_lo = 0.3000
    ambient_mod_factor_hi = 0.0
    heading_0 = 50
    pitch_0 = 330
    red_0 = 130
    green_0 = 120
    blue_0 = 97
    mod_factor_0_lo = 1.400
    mod_factor_0_hi = 0.0
    heading_1 = 240
    pitch_1 = 330
    red_1 = 58
    green_1 = 62
    blue_1 = 66
    mod_factor_1_lo = 0.4000
    mod_factor_1_hi = 0.0
    fog_red = 0
    fog_blue = 0
    fog_green = 0
    fog_alpha = 0
    fog_dist = 0
    num_m_heads = 8
    num_m_torsos = 8
    num_m_legs = 6
}

script GenerateLevelStructureNameFromTheme 
    if (<theme> > 0)
        FormatText checksumname = structure_name 'Level_sk5ed%d' d = (<theme> + 1)
    else
        structure_name = Level_sk5ed
    endif
    return structure_name = <structure_name>
endscript


script load_sk5ed 
    GetEditorTheme
    load_parked_textures_to_main_memory
    GenerateLevelStructureNameFromTheme theme = <theme>
    if IsXbox
        load_level <structure_name> loading_screen = 'loadscrn_editor_x'
    endif
    if IsNGC
        load_level <structure_name> loading_screen = 'loadscrn_editor_ngc'
    endif
    if IsPs2
        load_level <structure_name> loading_screen = 'loadscrn_editor'
    endif
endscript


script load_sk5ed_gameplay 
    GetEditorTheme
    if (<theme> > 0)
        FormatText checksumname = structure_name 'Level_sk5ed%d' d = (<theme> + 1)
    else
        structure_name = Level_sk5ed
    endif
    load_level <structure_name> startup_script = Sk5Ed_Startup_gameplay loading_screen = 'loadscrn_created'
endscript

Level_sk5ed_defaults = 
{
    park_editor
    load_script = load_sk5ed
    name = 'Created Park'
    loading_screen = 'loadscrn_editor_play'
    loading_time = 6.810
    loading_time_xbox = 9
    startup_script = Sk5Ed_Startup
    goals_script = Sk5Ed_goals
    default_stats = 10
    default_stats_classic = 10
    level_number = LevelNum_Sk5ed
    pre = 'sk5ed_scripts.pre'
    level = 'sk5ed'
    level_name = 'sk5ed'
    colpre = 'sk5edcol.pre'
    pedpre = 'sk5edped.pre'
    level_qb = 'levels\sk5ed\sk5ed_scripts.qb'
    qb = 'levels\sk5ed\sk5ed.qb'
    menu3d_name = 'menu3d\SK5ED_menu3d\SK5ED_menu3d.mdl'
    menu3d_sprites = [
        'PanelSprites/Menu3d/SK5ED_icon_1'
        'PanelSprites/Menu3d/SK5ED_icon_2'
    ]
    more_level_qbs = [
        'levels\sk5ed\ParkEd_node_scripts.qb'
        'levels\sk5ed\ParkEd_fast_particle_data.qb'
    ]
    ambient_red = 72
    ambient_green = 72
    ambient_blue = 72
    ambient_mod_factor_lo = 0.5000
    ambient_mod_factor_hi = 0.0
    heading_0 = 90.0
    pitch_0 = -60.0
    red_0 = 75
    green_0 = 75
    blue_0 = 75
    mod_factor_0_lo = 0.7000
    mod_factor_0_hi = 0.0
    heading_1 = 0.0
    pitch_1 = -90.0
    red_1 = 0
    green_1 = 0
    blue_1 = 0
    mod_factor_1_lo = 1.0
    mod_factor_1_hi = 0.0
    fog_red = 0
    fog_green = 0
    fog_blue = 0
    fog_alpha = 0
    fog_dist = 0
}
Level_sk5ed = {
    Level_sk5ed_defaults
    structure_name = Level_sk5ed
    loading_time = 7.110
    loading_time_xbox = 9
    scnpre = 'sk5ed_shellscn.pre'
    sky = 'sk5ed_Sky'
    outer_shell = 'sk5ed_shell'
    theme_name = 'Antarctica'
}
Level_sk5ed2 = {
    Level_sk5ed_defaults
    structure_name = Level_sk5ed2
    loading_time = 7.380
    scnpre = 'sk5ed2_shellscn.pre'
    sky = 'sk5ed2_Sky'
    outer_shell = 'sk5ed2_shell'
    theme_name = 'Mars'
}
Level_sk5ed3 = {
    Level_sk5ed_defaults
    structure_name = Level_sk5ed3
    loading_time = 7.120
    scnpre = 'sk5ed3_shellscn.pre'
    sky = 'sk5ed3_Sky'
    outer_shell = 'sk5ed3_shell'
    theme_name = 'Cemetary'
}
Level_sk5ed4 = {
    Level_sk5ed_defaults
    structure_name = Level_sk5ed4
    loading_time = 7.150
    scnpre = 'sk5ed4_shellscn.pre'
    sky = 'sk5ed4_Sky'
    outer_shell = 'sk5ed4_shell'
    theme_name = 'Race Car'
}
Level_sk5ed5 = {
    Level_sk5ed_defaults
    structure_name = Level_sk5ed5
    loading_time = 7.590
    scnpre = 'sk5ed5_shellscn.pre'
    sky = 'sk5ed5_Sky'
    outer_shell = 'sk5ed5_shell'
    theme_name = 'Swamp'
}
