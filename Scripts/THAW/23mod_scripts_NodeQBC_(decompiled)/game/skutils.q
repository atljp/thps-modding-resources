block_proxim_node_updates = 0
check_for_unplugged_controllers = 0
TimeOfDayDebug = 0
main_menu_ok_to_go = 0
scripts_to_kill_when_changing_levels = [
    Sk3_KillSkater
    SK3_Killskater_Finish
    SK3_Killskater_Finish3
    SK3_KillSkater_Water
    SK3_KillSkater_Pungee
    BA_Goal_Catapult720_EnterGrab
    BA_Goal_Catapult720_Counter
    BA_Goal_Catapult720_SpinChecker
    PedlifeSpawner
]
animlodinterleave2 = 67.0
AnimLODInterleave4 = 100.0
NGC_AnimLODInterleave2 = 67.0
NGC_AnimLODInterleave4 = 100.0
XBox_AnimLODInterleave2 = 67.0
XBox_AnimLODInterleave4 = 100.0
xenon_animlodinterleave2 = 100.0
Xenon_AnimLODInterleave4 = 120.0

script PrintState 
    if InAir
        printf \{ 'In air' }
    endif
    if OnGround
        printf \{ 'On ground' }
    endif
    if onwall
        printf \{ 'On wall' }
    endif
    if onlip
        printf \{ 'On lip' }
    endif
    if onrail
        printf \{ 'OnRail' }
    endif
endscript
z_bh_ped_vo_info = [
    {
        type = 'cash_'
        lasttime = -1
        generic_range = 2
        lasttime_range = 2
        tod_range = 2
        action_range = 2
    }
    {
        type = 'graffiti_'
        lasttime = -1
        generic_range = 2
        lasttime_range = 2
        tod_range = 2
        action_range = 2
    }
    {
        type = 'accessoryshop_'
        lasttime = -1
        generic_range = 5
        lasttime_range = 5
        tod_range = 5
        action_range = 5
    }
    {
        type = 'clothingshop_'
        lasttime = -1
        generic_range = 5
        lasttime_range = 5
        tod_range = 5
        action_range = 5
    }
    {
        type = 'skateshop_'
        lasttime = -1
        generic_range = 5
        lasttime_range = 5
        tod_range = 5
        action_range = 5
    }
]
z_dt_ped_vo_info = [
    {
        type = 'cash_'
        lasttime = -1
        generic_range = 2
        lasttime_range = 2
        tod_range = 2
        action_range = 2
    }
    {
        type = 'graffiti_'
        lasttime = -1
        generic_range = 2
        lasttime_range = 2
        tod_range = 2
        action_range = 2
    }
    {
        type = 'accessoryshop_'
        lasttime = -1
        generic_range = 5
        lasttime_range = 5
        tod_range = 5
        action_range = 5
    }
    {
        type = 'clothingshop_'
        lasttime = -1
        generic_range = 5
        lasttime_range = 5
        tod_range = 5
        action_range = 5
    }
    {
        type = 'skateshop_'
        lasttime = -1
        generic_range = 5
        lasttime_range = 5
        tod_range = 5
        action_range = 5
    }
    {
        type = 'tattooshop_'
        lasttime = -1
        generic_range = 5
        lasttime_range = 5
        tod_range = 5
        action_range = 5
    }
]
z_el_ped_vo_info = [
    {
        type = 'cash_'
        lasttime = -1
        generic_range = 2
        lasttime_range = 2
        tod_range = 2
        action_range = 2
    }
    {
        type = 'graffiti_'
        lasttime = -1
        generic_range = 2
        lasttime_range = 2
        tod_range = 2
        action_range = 2
    }
    {
        type = 'clothingshop_'
        lasttime = -1
        generic_range = 5
        lasttime_range = 5
        tod_range = 5
        action_range = 5
    }
    {
        type = 'skateshop_'
        lasttime = -1
        generic_range = 5
        lasttime_range = 5
        tod_range = 5
        action_range = 5
    }
    {
        type = 'tattooshop_'
        lasttime = -1
        generic_range = 5
        lasttime_range = 5
        tod_range = 5
        action_range = 5
    }
]
z_ho_ped_vo_info = [
    {
        type = 'cash_'
        lasttime = -1
        generic_range = 2
        lasttime_range = 2
        tod_range = 2
        action_range = 2
    }
    {
        type = 'graffiti_'
        lasttime = -1
        generic_range = 2
        lasttime_range = 2
        tod_range = 2
        action_range = 2
    }
    {
        type = 'accessoryshop_'
        lasttime = -1
        generic_range = 5
        lasttime_range = 5
        tod_range = 5
        action_range = 5
    }
    {
        type = 'barbershop_'
        lasttime = -1
        generic_range = 5
        lasttime_range = 5
        tod_range = 5
        action_range = 5
    }
    {
        type = 'clothingshop_'
        lasttime = -1
        generic_range = 5
        lasttime_range = 5
        tod_range = 5
        action_range = 5
    }
    {
        type = 'skateshop_'
        lasttime = -1
        generic_range = 5
        lasttime_range = 5
        tod_range = 5
        action_range = 5
    }
]
z_lv_ped_vo_info = [
    {
        type = 'cash_'
        lasttime = -1
        generic_range = 2
        lasttime_range = 2
        tod_range = 2
        action_range = 2
    }
    {
        type = 'graffiti_'
        lasttime = -1
        generic_range = 2
        lasttime_range = 2
        tod_range = 2
        action_range = 2
    }
]
z_oi_ped_vo_info = [
    {
        type = 'cash_'
        lasttime = -1
        generic_range = 2
        lasttime_range = 2
        tod_range = 2
        action_range = 2
    }
    {
        type = 'graffiti_'
        lasttime = -1
        generic_range = 2
        lasttime_range = 2
        tod_range = 2
        action_range = 2
    }
]
z_sm_ped_vo_info = [
    {
        type = 'cash_'
        lasttime = -1
        generic_range = 2
        lasttime_range = 2
        tod_range = 2
        action_range = 2
    }
    {
        type = 'graffiti_'
        lasttime = -1
        generic_range = 2
        lasttime_range = 2
        tod_range = 2
        action_range = 2
    }
    {
        type = 'barbershop_'
        lasttime = -1
        generic_range = 5
        lasttime_range = 5
        tod_range = 5
        action_range = 5
    }
    {
        type = 'skateshop_'
        lasttime = -1
        generic_range = 5
        lasttime_range = 5
        tod_range = 5
        action_range = 5
    }
    {
        type = 'tattooshop_'
        lasttime = -1
        generic_range = 5
        lasttime_range = 5
        tod_range = 5
        action_range = 5
    }
]
z_sr_ped_vo_info = [
    {
        type = 'cash_'
        lasttime = -1
        generic_range = 2
        lasttime_range = 2
        tod_range = 2
        action_range = 2
    }
    {
        type = 'graffiti_'
        lasttime = -1
        generic_range = 2
        lasttime_range = 2
        tod_range = 2
        action_range = 2
    }
]
z_sv_ped_vo_info = [
    {
        type = 'cash_'
        lasttime = -1
        generic_range = 2
        lasttime_range = 2
        tod_range = 2
        action_range = 2
    }
    {
        type = 'graffiti_'
        lasttime = -1
        generic_range = 2
        lasttime_range = 2
        tod_range = 2
        action_range = 2
    }
]
vo_filename_generic = null
vo_filename_lasttime = null
vo_filename_tod = null
vo_filename_action = null

script play_vo_sound_stopstreams 
    if NOT (cas_current_store_ped = 0)
        (cas_current_store_ped)::obj_stoplastfam
    else
        StopStream (vo_filename_generic)
        StopStream (vo_filename_lasttime)
        StopStream (vo_filename_tod)
        StopStream (vo_filename_action)
    endif
endscript

script play_vo_sound_killall 
    KillSpawnedScript \{ name = play_vo_sound }
    play_vo_sound_stopstreams
    if GotParam \{ ped_vo_type }
        play_vo_sound <...> 
    endif
endscript

script ped_vo_reset_level 
    FormatText checksumname = level_vo_info '%a_ped_vo_info' a = (<level>)
    GetArraySize <level_vo_info>
    <i> = 0
    begin 
    SetArrayElement arrayName = level_vo_info index = <i> newValue = {(<level_vo_info> [ <i> ] + { lasttime = -1 })}
    <i> = (<i> + 1)
    repeat <array_size>
endscript

script ped_vo_reset_all_levels 
    ped_vo_reset_level \{ level = 'z_bh' }
    ped_vo_reset_level \{ level = 'z_dt' }
    ped_vo_reset_level \{ level = 'z_el' }
    ped_vo_reset_level \{ level = 'z_ho' }
    ped_vo_reset_level \{ level = 'z_lv' }
    ped_vo_reset_level \{ level = 'z_oi' }
    ped_vo_reset_level \{ level = 'z_sm' }
    ped_vo_reset_level \{ level = 'z_sr' }
    ped_vo_reset_level \{ level = 'z_sv' }
endscript

script play_vo_sound 
    GetLevelStructureName
    FormatText checksumname = level_vo_info '%a_ped_vo_info' a = (<level_structure_name>.level)
    GetArraySize <level_vo_info>
    <i> = 0
    <goal> = -1
    begin 
    if (<level_vo_info> [ <i> ].type = <ped_vo_type>)
        <goal> = <i>
        break 
    endif
    <i> = (<i> + 1)
    repeat <array_size>
    if (<goal> = -1)
        printstruct <...> 
        scriptassert 'Nie znaleziono pod³o¿onego g³osu'
    endif
    CareerFunc func = GetDaysPassed
    TODManager_GetCurrentTime
    <curTime> = ((<days_passed> * 24)+ <hours>)
    <timedif> = (<curTime> - <level_vo_info> [ <goal> ].lasttime)
    if (<level_vo_info> [ <goal> ].lasttime = -1)
        RemoveFlag play_lasttime
    else
        if (<timedif> < 1)
            <lasttime> = 'recent_'
        else
            if (<timedif> < 24)
                <lasttime> = 'today_'
            else
                if (<timedif> < 48)
                    <lasttime> = 'yesterday_'
                else
                    if (<timedif> < 168)
                        <lasttime> = 'lastweek_'
                    else
                        <lasttime> = 'longtime_'
                    endif
                endif
            endif
        endif
    endif
    if (<hours> < 8)
        <tod> = 'morning_'
    else
        if (<hours> < 15)
            <tod> = 'afternoon_'
        else
            if (<hours> < 20)
                <tod> = 'evening_'
            else
                <tod> = 'night_'
            endif
        endif
    endif
    if GotParam play_sponsor
        if (<hours> = 23)
            RemoveFlag play_tod
            RemoveFlag play_lasttime
            AddFlag play_action
            <ped_vo_action> = 'sponsor_'
        endif
    endif
    <last_stream> = null
    if GotParam play_generic
        getrandomvalue name = generic_index a = 0 b = (<level_vo_info> [ <goal> ].generic_range -1)integer
        FormatText checksumname = filename_generic '%ageneric_%b_lip' a = <ped_vo_type> b = <generic_index>
        change vo_filename_generic = <filename_generic>
        if (cas_current_store_ped = 0)
            PlayStream (vo_filename_generic)
        else
            (cas_current_store_ped)::obj_playfam (vo_filename_generic)
        endif
        <last_stream> = (vo_filename_generic)
    endif
    if GotParam play_lasttime
        getrandomvalue name = lasttime_index a = 0 b = (<level_vo_info> [ <goal> ].lasttime_range -1)integer
        FormatText checksumname = filename_lasttime '%a%b%c_lip' a = <ped_vo_type> b = <lasttime> c = <lasttime_index>
        change vo_filename_lasttime = <filename_lasttime>
        begin 
        if NOT IsStreamPlaying <last_stream>
            if (cas_current_store_ped = 0)
                PlayStream (vo_filename_lasttime)
            else
                wait 1 gameframe
                (cas_current_store_ped)::obj_playfam (vo_filename_lasttime)
            endif
            <last_stream> = (vo_filename_lasttime)
            break 
        endif
        wait 0.5000 seconds
        repeat 
    endif
    if GotParam play_tod
        getrandomvalue name = tod_index a = 0 b = (<level_vo_info> [ <goal> ].tod_range -1)integer
        FormatText checksumname = filename_tod '%a%b%c_lip' a = <ped_vo_type> b = <tod> c = <tod_index>
        change vo_filename_tod = <filename_tod>
        begin 
        if NOT IsStreamPlaying <last_stream>
            if (cas_current_store_ped = 0)
                PlayStream (vo_filename_tod)
            else
                wait 1 gameframe
                (cas_current_store_ped)::obj_playfam (vo_filename_tod)
            endif
            <last_stream> = (vo_filename_tod)
            break 
        endif
        wait 0.5000 seconds
        repeat 
    endif
    if GotParam play_action
        if GotParam action_range
            <range> = (<action_range> -1)
        else
            <range> = (<level_vo_info> [ <goal> ].action_range -1)
        endif
        getrandomvalue name = action_index a = 0 b = <range> integer
        begin 
        if GotParam ped_vo_action
            if GotParam ped_vo_item
                FormatText checksumname = filename_action '%a%b%c%d_lip' a = <ped_vo_type> b = <ped_vo_action> c = <ped_vo_item> d = <action_index>
            else
                FormatText checksumname = filename_action '%a%b%c_lip' a = <ped_vo_type> b = <ped_vo_action> c = <action_index>
            endif
        endif
        if NOT ChecksumEquals a = (vo_filename_action)b = <filename_action>
            break 
        else
            if (<range> = 0)
                break 
            else
                <action_index> = (<action_index> + 1)
                if (<action_index> > <range>)
                    <action_index> = 0
                endif
            endif
        endif
        repeat 
        change vo_filename_action = <filename_action>
        begin 
        if NOT IsStreamPlaying <last_stream>
            if (cas_current_store_ped = 0)
                PlayStream (vo_filename_action)
            else
                wait 1 gameframe
                (cas_current_store_ped)::obj_playfam (vo_filename_action)
            endif
            break 
        endif
        wait 0.5000 seconds
        repeat 
    endif
    SetArrayElement arrayName = level_vo_info index = <goal> newValue = {(<level_vo_info> [ <goal> ] + { lasttime = <curTime> })}
endscript

script DefaultGapScript 
    if issoundplaying \{ MainGapSound }
        StopSound \{ MainGapSound }
    endif
    playsound \{ Hud_jumpgap id = MainGapSound }
    if skating
        if OnGround
            LandGapsImmediately = 1
        endif
    else
        if walking
            LandGapsImmediately = 1
        else
            if driving
                LandGapsImmediately = 1
            endif
        endif
    endif
    if GotParam \{ LandGapsImmediately }
        getnumberofnongaptricks
        if (<NumberOfNonGapTricks> = 0)
            LandSkaterTricks
        endif
    endif
endscript

script SetAllStats \{ value = 3 }
    if (<value> = 0)
        printf \{ '* Clearing Stats Override' }
    else
        printf '* Overriding Stats to %d' d = <value>
    endif
    SetStatOverride <value>
endscript

script ToggleMinMetrics 
    ToggleMetricItem \{ item = METRIC_TIME }
    ToggleMetricItem \{ item = METRIC_TOTALPOLYS }
    ToggleMetricItem \{ item = METRIC_VERTS }
    ToggleMetricItem \{ item = METRIC_RESOURCEALLOCS }
    ToggleMetricItem \{ item = METRIC_TEXTUREUPLOADS }
    ToggleMetricItem \{ item = METRIC_VU1 }
    ToggleMetricItem \{ item = METRIC_DMA1 }
    ToggleMetricItem \{ item = METRIC_DMA2 }
    ToggleMetricItem \{ item = METRIC_IHANDLERTIME }
    ToggleMetricItem \{ item = METRIC_SKYCACHE }
    ToggleMetricItem \{ item = METRIC_VIDEOMODE }
    ToggleMetricItem \{ item = METRIC_MEMFREE }
    ToggleMetricItem \{ item = METRIC_REGIONINFO }
endscript

script WaitOneGameFrame 
    wait \{ 1 gameframes }
endscript

script WaitAnimWhilstChecking 
    begin 
    DoNextTrick
    if GotParam \{ AndManuals }
        DoNextManualTrick
    endif
    if Skater_AnimComplete
        break 
    endif
    wait \{ 1 gameframe }
    repeat 
endscript

script WaitWhilstChecking 
    GetStartTime
    begin 
    DoNextTrick
    if GotParam \{ AndManuals }
        DoNextManualTrick
    endif
    wait \{ 1 gameframe }
    GetElapsedTime starttime = <starttime>
    if (<elapsedtime> > <duration>)
        break 
    endif
    repeat 
endscript

script reverse 
    PlayAnim \{ anim = current from = current to = 0 }
endscript
main_menu_jump_to_cas = 0

script CheckForInvalidLevels 
    change \{ main_menu_jump_to_cas = 0 }
    if (<level> = load_cas)
        change \{ main_menu_jump_to_cas = 1 }
        level = Load_Z_MainMenu
    endif
    return level = <level>
endscript

script autolaunch 
    if NOT GotParam \{ Game }
        Game = career
    endif
    if NOT cd
        change \{ entered_from_autolaunch = 1 }
        if (<Game> = career)
            SelectCurrentSkater \{ name = custom_story }
        endif
    endif
    SetGameType <Game>
    SetCurrentGameType
    CheckForInvalidLevels level = <level>
    request_level level = <level>
    cleanup_before_loading_level
    load_requested_level
endscript
load_bike = 0

script change_level 
    if NOT InNetGame
        DisplayLoadingScreen freeze
    endif
    parked_loading_screen_show level = <level>
    SetEnableMovies 1
    change tod_manager_inactive = 0
    CheckForInvalidLevels level = <level>
    change check_for_unplugged_controllers = 0
    if GotParam next_level_script
        change next_level_script = <next_level_script>
    endif
    ResetScore
    ResetScorePot
    hide_console_window
    FinishPendingZoneLoads
    if NOT InNetGame
        cleanup_before_changing_level <...> 
    endif
    ChangeLevel <...> 
    if InSplitScreenGame
        launch_two_player
    endif
endscript

script QuickScript 
    printf \{ 'Running quickscript....' }
    ReloadNodeArray
    if ScriptExists \{ LoadAllParticleTextures }
        LoadAllParticleTextures
    endif
    retry
endscript

script Change_Sky 
    SpawnScriptLater change_sky_async params = { sky = <sky> }
endscript

script change_sky_async 
    if IsSkyLoaded
        BeginUnloadSky
        wait \{ 2 gameframes }
        EndUnloadSky
    endif
    LoadSky <...> 
    GlobalEffects_Refresh
endscript

script reloadscene 
    skater ::SetCustomRestart set
    if GotParam scene
        if UnloadScene <...> 
            do_unload_unloadable
            cleanup
            if NOT InNetGame
                AllocatePathManMemory
            endif
            FormatText checksumname = struct_name 'level_%s' s = <scene>
            AddParams <struct_name>
            if GotParam sky
                LoadScene scene = <sky>
            endif
            LoadScene <...> 
            if GotParam level_name
                SetLevelName <level_name>
            else
                SetLevelName <level>
            endif
            if GotParam qb
                NodeArrayManLoad <qb>
                PFXManLoad <qb>
            endif
            if GotParam qb
                preloadmodels
            endif
            if GotParam level_qb
                LoadQB <level_qb> levelspecific
            endif
            if GotParam level_sfx_qb
                LoadQB <level_sfx_qb> levelspecific
            endif
            if GotParam more_level_qbs
                if NOT IsArray <more_level_qbs>
                    script_assert 'more_level_qbs nie jest szeregiem'
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
            LoadTerrain
            if GotParam temp_script
                <temp_script>
            endif
            if NOT InNetGame
                PushMemProfile 'Level Specific Anims'
                load_level_anims
                PopMemProfile
            endif
            PushMemProfile 'Level Cameras'
            LoadCameras
            PopMemProfile
            if ScriptExists LoadObjectAnims
                PushMemProfile 'Animacje obiektów'
                LoadObjectAnims
                PopMemProfile
            endif
            if ScriptExists LoadAllParticleTextures
                LoadAllParticleTextures
            endif
            if GotParam setup_script
                <setup_script>
            endif
            PushMemProfile 'Sta³e i pó³sta³e animacje'
            do_load_unloadable
            PopMemProfile
            LoadCollision <...> 
            ParseNodeArray
            if GotParam setup_script
                <setup_script>
            endif
            TODManager_Refresh
            refresh_poly_count
            if (SHOWPOLYS_ONQUICKVIEW)
                if (poly_count_on = 0)
                    show_poly_count
                endif
            endif
        else
            autolaunch level = <scene>
        endif
    else
        script_assert 'Nie ustalono parametru sceny dla autoodpalania'
    endif
    skater ::SkipToCustomRestart
    GlobalEffects_Refresh
    if (view_mode)
        SetAnalogStickActiveForMenus 0
    endif
endscript

script AddToScene 
    if GotParam \{ Add }
    else
        Add \{ 'update' }
    endif
    if GotParam \{ scene }
        AddScene scene = <scene> Add = <Add>
        AddCollision scene = <scene> Add = <Add>
    else
        script_assert \{ 'No scene param specified for autolaunching' }
    endif
endscript
CANCEL_GROUND = 1
CANCEL_AIR = 2
CANCEL_RAIL = 4
CANCEL_WALL = 8
CANCEL_LIP = 16
CANCEL_WALLPLANT = 32
CANCEL_MANUAL = 64
CANCEL_HANG = 128
CANCEL_LADDER = 256
PURE_GROUND = 510
PURE_AIR = 509
PURE_RAIL = 507
PURE_WALL = 503
PURE_LIP = 495
PURE_WALLPLANT = 479
PURE_MANUAL = 447
PURE_HANG = 383
PURE_LADDER = 255
REQUIRE_GROUND = 65536
REQUIRE_AIR = 131072
REQUIRE_RAIL = 262144
REQUIRE_WALL = 524288
REQUIRE_LIP = 1048576
REQUIRE_WALLPLANT = 2097152
REQUIRE_MANUAL = 4194304
REQUIRE_HANG = 8388608
REQUIRE_LADDER = 16777216
CANCEL_SKATE = 512
CANCEL_WALK = 1024
CANCEL_DRIVE = 2048
REQUIRE_SKATE = 33554432
REQUIRE_WALK = 67108864
REQUIRE_DRIVE = 134217728
mFD_SKATABLE = 1
mFD_NOT_SKATABLE = 2
mFD_WALL_RIDABLE = 4
mFD_VERT = 8
mFD_NON_COLLIDABLE = 16
mFD_LIGHT_MODULATION_ONLY = 32
mFD_TRIGGER = 64
mFD_CAMERA_NON_COLLIDABLE = 128
mFD_BANK = 256
mFD_UNDER_OK = 2048
mFD_INVISIBLE = 4096
mFD_NOT_TAGGABLE = 8192

script show_all 
    DebugRenderIgnore
endscript

script show_vert 
    DebugRenderIgnore \{ ignore_0 = mFD_VERT }
endscript

script show_wallride 
    DebugRenderIgnore \{ ignore_0 = mFD_WALL_RIDABLE }
endscript

script show_wall_ridable 
    DebugRenderIgnore \{ ignore_0 = mFD_WALL_RIDABLE }
endscript

script show_trigger 
    DebugRenderIgnore \{ ignore_0 = mFD_TRIGGER }
endscript

script show_invisible 
    DebugRenderIgnore \{ ignore_0 = mFD_INVISIBLE }
endscript

script show_triggers 
    show_trigger
endscript

script show_CAMERA 
    DebugRenderIgnore \{ ignore_0 = mFD_NON_CAMERA_COLLIDABLE }
endscript

script show_camera_collide 
    DebugRenderIgnore \{ ignore_0 = mFD_CAMERA_NON_COLLIDABLE }
endscript

script show_skatable 
    DebugRenderIgnore \{ ignore_0 = mFD_SKATABLE }
endscript

script show_not_skatable 
    DebugRenderIgnore \{ ignore_0 = mFD_NOT_SKATABLE }
endscript

script show_non_collidable 
    DebugRenderIgnore \{ ignore_0 = mFD_NON_COLLIDABLE }
endscript

script show_collidable 
    DebugRenderIgnore \{ ignore_1 = mFD_NON_COLLIDABLE }
endscript

script JumpSkaterToNode 
    MakeSkaterGoto JumpToNode params = {nodeName = <nodeName> <...> }
endscript

script JumpToNode 
    if NodeExists <nodeName>
        stopbalancetrick
        setspeed \{ 0 }
        if GotParam \{ MoveUpABit }
            move \{ y = 10 }
        endif
        obj_movetonode name = <nodeName> orient NoReset
        goto \{ GroundGone }
    endif
endscript

script ScreenElementSystemCleanup 
    printf '************ CLEANING UP SYSTEM ***************'
    if ObjectExists id = root_window
        DestroyScreenElement id = root_window
        ScreenElementSystemInit
        SetScreenElementProps {
            id = root_window
            event_handlers = [
                { pad_start handle_start_pressed }
            ]
            replace_handlers
            tags = { menu_state = Off }
        }
        FireEvent type = focus target = root_window
        if NOT GotParam no_panel_stuff
            create_panel_stuff
        endif
    endif
    if ((IsXbox)|| (isPC))
        SetButtonEventMappings unblock_menu_input
    endif
endscript

script KillElement3d 
    wait \{ 1 gameframe }
    Die
endscript

script setup_ped_speech \{ inner_radius = 12 Speed = 20 pad_choose_script = ped_speech_exit }
    if NOT IsCreated <ped_id>
        scriptassert \{ 'tried to set up ped speech on an object that doesn\'t exist' }
    endif
    <ped_id> ::obj_setinnerradius <inner_radius>
    ClearEventHandler \{ anyobjectinradius }
    ClearEventHandler \{ objectoutofradius }
    seteventhandler Ex = anyobjectinradius scr = ped_speech_got_trigger params = <...> 
endscript

script ped_speech_got_trigger {set_script = seteventhandler set_script_scr = ped_speech_got_trigger}
    if NOT <colobjid> ::IsLocalSkater
        return 
    endif
    if ((dont_create_speech_boxes = 1)|| (game_progress_block_triggers = 1)|| (sysnotify_wait_in_progress = 1))
        return 
    endif
    ClearEventHandler anyobjectinradius
    if ObjectExists id = ped_speech_dialog
        <should_destroy> = 0
        if skater ::IsInBail
            <should_destroy> = 1
        endif
        if SkaterCurrentScorePotGreaterThan 0
            <should_destroy> = 1
        endif
        if <colobjid> ::DoingTrick
            <should_destroy> = 1
        endif
        if NOT GoalManager_CanStartGoal
            <should_destroy> = 1
        endif
        if GoalManager_IsInCompetition
            <should_destroy> = 1
        endif
        if (<should_destroy> = 1)
            DestroyScreenElement id = ped_speech_dialog
        endif
        <set_script> Ex = anyobjectinradius scr = <set_script_scr> object = <ped_id> params = <...> 
    else
        show_speech_box = 1
        if IsTrue igc_playing
            show_speech_box = 0
        endif
        if ObjectExists id = root_window
            root_window ::gettags
            if GotParam menu_state
                if (<menu_state> = on)
                    show_speech_box = 0
                endif
            endif
        endif
        if NOT GoalManager_CanStartGoal
            if NOT InNetGame
                show_speech_box = 0
            endif
        endif
        if GoalManager_IsInCompetition
            show_speech_box = 0
        endif
        if NOT <colobjid> ::OnGround
            show_speech_box = 0
        endif
        if <colobjid> ::IsInBail
            show_speech_box = 0
        endif
        if <colobjid> ::DoingTrick
            show_speech_box = 0
        endif
        if SkaterCurrentScorePotGreaterThan 0
            show_speech_box = 0
        endif
        if (<show_speech_box> = 1)
            <ped_id> ::obj_setouterradius <inner_radius>
            <set_script> Ex = objectoutofradius scr = ped_speech_refuse object = <ped_id> params = <...> 
            if NOT GotParam accept_text
                if NOT GotParam display_name
                    <display_name> = 'Pieszy'
                endif
                FormatText textname = accept_text '%s: \me by rozmawiaæ.' s = <display_name>
            endif
            if ObjectExists id = ped_speech_dialog
                DestroyScreenElement id = ped_speech_dialog
            endif
            create_speech_box {
                anchor_id = ped_speech_dialog
                text = <accept_text>
                no_pad_choose
                no_pad_start
                pad_option_script = ped_speech_accept
                pad_option_params = <...> 
                bg_rgba = [ 100 100 100 128 ]
                text_rgba = [ 128 128 128 128 ]
                Pos = (320.0, 400.0)
                z_priority = 5
            }
            ped_speech_dialog ::obj_spawnscriptlater ped_speech_die_with_trigger params = { ped_id = <ped_id> }
        else
            <set_script> Ex = anyobjectinradius scr = <set_script_scr> object = <ped_id> params = <...> 
        endif
    endif
endscript

script ped_speech_accept 
    if <colobjid> ::IsInBail
        return 
    endif
    if <colobjid> ::DoingTrick
        return 
    endif
    speech_box_exit
    if NOT ObjectExists id = <ped_id>
        return 
    endif
    Debounce x time = 0.5000
    if <colobjid> ::OnGround
        if NOT SkaterCurrentScorePotGreaterThan 0
            wait 5 frame
            if <colobjid> ::OnGround
                ped_speech_accept2 <...> 
            else
                if NOT <colobjid> ::rightpressed
                    if NOT <colobjid> ::leftpressed
                        if NOT <colobjid> ::uppressed
                            if NOT <colobjid> ::downpressed
                                ped_speech_accept2 <...> 
                            endif
                        endif
                    endif
                endif
            endif
        endif
    else
        if NOT <colobjid> ::rightpressed
            if NOT <colobjid> ::leftpressed
                if NOT <colobjid> ::uppressed
                    if NOT <colobjid> ::downpressed
                        ped_speech_accept2 <...> 
                    endif
                endif
            endif
        endif
    endif
endscript

script ped_speech_accept2 
    if NOT GotParam dont_deactivate_goals
        if NOT GameModeEquals is_singlesession
            if NOT GameModeEquals is_classic
                GoalManager_DeactivateAllGoals
            endif
        endif
    endif
    PauseSkaters
    ClearEventHandler anyobjectinradius
    if ScreenElementExists id = ped_speech_dialog
        DestroyScreenElement id = ped_speech_dialog
    endif
    if GotParam activation_script
        <colobjid> ::obj_spawnscriptlater <activation_script> params = {ped_id = <ped_id> <activation_script_params>}
    endif
    if GotParam cam_anim
        PlaySkaterCamAnim name = <cam_anim>
    endif
    if GotParam text
        create_speech_box <...> no_pad_start
    endif
endscript

script ped_speech_refuse 
    if GotParam \{ intid }
        if GotParam \{ outintid }
            if NOT (<outintid> = <intid>)
                return 
            endif
        endif
    endif
    if GotParam \{ hint_text }
        ped_utils_hint_dialog_refuse <...> 
    endif
    ClearEventHandler \{ objectoutofradius }
    speech_box_exit \{ anchor_id = ped_speech_dialog }
    ped_speech_reset <...> 
endscript

script ped_speech_reset 
    if GotParam \{ outer_radius_script }
        <outer_radius_script> <outer_radius_params>
    endif
    if NOT GotParam \{ no_repeat }
        setup_ped_speech <...> 
    endif
endscript

script ped_speech_exit 
    UnpauseSkaters
    speech_box_exit
endscript

script ped_speech_die_with_trigger 
    if NOT GotParam \{ ped_id }
        return 
    endif
    begin 
    if NOT IsCreated <ped_id>
        FireEvent \{ type = speech_box_destroyed }
        Die
        return 
    endif
    wait \{ 1 gameframes }
    repeat 
endscript

script script_assert 
    printf \{ 'ASSERT MESSAGE:' }
    scriptassert <...> 
endscript

script GetStackedScreenElementPos 
    if GotParam \{ xy }
        GetStackedScreenElementPosOnXY <...> 
    else
        if GotParam \{ x }
            if GotParam \{ y }
                GetStackedScreenElementPosOnXY <...> 
            else
                GetStackedScreenElementPosOnX <...> 
            endif
        else
            if GotParam \{ y }
                GetStackedScreenElementPosOnY <...> 
            else
                script_assert \{ 'GetStackedScreenElementPos called without an axis' }
            endif
        endif
    endif
    return Pos = <Pos>
endscript

script GetStackedScreenElementPosOnX 
    GetScreenElementPosition id = <id>
    GetScreenElementDims id = <id>
    <unit_pair> = (1.0, 0.0)
    if GotParam \{ negative }
        <unit_pair> = (-1.0, 0.0)
    endif
    if GotParam \{ Offset }
        return Pos = (<screenelementpos> + (<unit_pair> * <width> + <Offset>))
    else
        return Pos = (<screenelementpos> + (<unit_pair> * <width>))
    endif
endscript

script GetStackedScreenElementPosOnY 
    GetScreenElementPosition id = <id>
    GetScreenElementDims id = <id>
    <unit_pair> = (0.0, 1.0)
    if GotParam \{ negative }
        <unit_pair> = (0.0, -1.0)
    endif
    if GotParam \{ Offset }
        return Pos = (<screenelementpos> + (<unit_pair> * <height> + <Offset>))
    else
        return Pos = (<screenelementpos> + (<unit_pair> * <height>))
    endif
endscript

script GetStackedScreenElementPosOnXY 
    GetScreenElementPosition id = <id>
    GetScreenElementDims id = <id>
    <x_unit_pair> = (1.0, 0.0)
    <y_unit_pair> = (0.0, 1.0)
    if GotParam negative
        <x_unit_pair> = (-1.0, 0.0)
        <y_unit_pair> = (0.0, -1.0)
    endif
    if GotParam Offset
        return Pos = (<screenelementpos> + (<y_unit_pair> * <height> + <x_unit_pair> * <width> + <Offset>))
    else
        return Pos = (<screenelementpos> + (<y_unit_pair> * <height> + <x_unit_pair> * <width>))
    endif
endscript

script kill_blur \{ start = 0 }
    if NOT InSplitScreenGame
        KillSpawnedScript \{ name = pulse_blur_script_down }
        KillSpawnedScript \{ name = pulse_blur_script_up }
        SetScreenBlur amount = <start>
    endif
endscript

script pulse_blur \{ start = 200 end = 0 Speed = 4 }
    KillSpawnedScript \{ name = pulse_blur_script_down }
    KillSpawnedScript \{ name = pulse_blur_script_up }
    if (<start> > <end>)
        SpawnScriptLater pulse_blur_script_down params = <...> 
    else
        SpawnScriptLater pulse_blur_script_up params = <...> 
    endif
endscript

script pulse_blur_script_down 
    if GotParam force_pulse
        begin 
        if (<start> < <end>)
            SetScreenBlur <end>
            break 
        endif
        SetScreenBlur <start>
        <start> = (<start> - <Speed>)
        wait 1 gameframe
        repeat 
        return 
    endif
    if NOT InSplitScreenGame
        begin 
        if (<start> < <end>)
            SetScreenBlur <end>
            break 
        endif
        SetScreenBlur <start>
        <start> = (<start> - <Speed>)
        wait 1 gameframe
        repeat 
    endif
endscript

script pulse_blur_script_up 
    if GotParam force_pulse
        begin 
        if (<start> > <end>)
            SetScreenBlur <end>
            break 
        endif
        SetScreenBlur <start>
        <start> = (<start> + <Speed>)
        wait 1 gameframe
        repeat 
        return 
    endif
    if NOT InSplitScreenGame
        begin 
        if (<start> > <end>)
            SetScreenBlur <end>
            break 
        endif
        SetScreenBlur <start>
        <start> = (<start> + <Speed>)
        wait 1 gameframe
        repeat 
    endif
endscript

script NullScript 
endscript

script mark_first_input_received 
    GetCurrentSkaterProfileIndex
    GetSkaterId
    if GotParam device_num
        <controller_index> = <device_num>
    else
        if GotParam controller
            <controller_index> = <controller>
        else
            printf '=== ERROR === mark_first_input_received was passed neither controller nor device_num'
            <controller_index> = 0
        endif
    endif
    BindControllerToSkater skater_heap_index = <currentSkaterProfileIndex> controller = <controller_index>
    SpawnScriptLater mark_first_input_received_spawned params = <...> 
    FirstInputReceived
    change check_for_unplugged_controllers = 1
endscript

script mark_first_input_received_spawned 
    BindFrontEndToController front_end_pad = <currentSkaterProfileIndex> controller = <controller_index>
endscript

script lighting \{ target = 8421504 percent = 0 }
    if GotParam \{ lights }
        if GotParam \{ id }
            FakeLights percent = <lights> id = <id> prefix = <prefix>
        else
            if GotParam \{ prefix }
                FakeLights percent = <lights> prefix = <prefix>
            else
                FakeLights percent = <lights> prefix = TRG_LevelLight
            endif
        endif
    endif
endscript

script DumpMetrics 
    GetMetrics
    printf
    printf \{ 'Dumping Metrics Structure' }
    printstruct <...> 
endscript
dummy_metrics_struct = {
    mainscene = 0
    skyscene = 0
    metrics = 0
    sectors = 0
    ColSectors = 0
    verts = 0
    basepolys = 0
    texturememory = 0
}
proximobj_composite_structure = [
    { Component = sound }
    { Component = stream }
]
gameobj_composite_structure = [
    { Component = Suspend }
    { Component = lockobj Off }
    { Component = motion }
    { Component = objectproximity }
    { Component = sound }
    { Component = bbox }
]
bouncy_composite_structure = [
    { Component = Suspend }
    { Component = rigidbody }
    { Component = sound }
]
particle_composite_structure = [
    { Component = Suspend }
    { Component = particle }
]
moving_particle_composite_structure = [
    { Component = Suspend }
    { Component = motion }
    { Component = particle }
]
skatercam_composite_structure = [
    { Component = cameralookaround }
    { Component = skatercamera }
    { Component = walkcamera }
    { Component = camera }
    { Component = compassdisplay }
    { Component = Input }
]
viewercam_composite_structure = [
    { Component = camera }
]
parkedcam_composite_structure = [
    { Component = camera }
]
explosion_composite_structure = [
    { Component = Suspend }
    { Component = particle }
]
fireball_composite_structure = [
    { Component = velocity }
    { Component = collideanddie }
    { Component = particle }
]

script restore_skater_camera 
    if InFrontend
        if CompositeObjectExists name = main_menu_camera
            SetActiveCamera id = main_menu_camera
            return 
        endif
    endif
    if NOT (view_mode = 0)
        SetActiveCamera id = viewer_cam
        return 
    endif
    if IsObserving
        SetActiveCamera id = skatercam0
    else
        if NOT LocalSkaterExists
            SetActiveCamera id = skatercam0
        else
            if NOT skater ::driving
                SetActiveCamera id = skatercam0
            else
                SetActiveCamera id = PlayerVehicleCamera
            endif
        endif
    endif
    if NOT InFrontend
        if NOT IsObserving
            if LocalSkaterExists
                skater ::obj_enablescaling
            endif
        endif
    endif
endscript

script disable_skater_scaling 
    if NOT InFrontend
        if NOT IsObserving
            if NOT GetGlobalFlag \{ flag = CHEAT_KID }
                skater ::obj_disablescaling
            endif
        endif
    endif
endscript

script GetSkaterCam 
    camera_object = skatercam0
    if InSplitScreenGame
        if IsObjectScript
            obj_getid
            if NOT ChecksumEquals a = <ObjID> b = 0
                camera_object = skatercam1
            endif
        endif
    endif
    return skatercam = <camera_object>
endscript

script SetSkaterCamOverride 
    GetSkaterCam
    <skatercam> ::SC_SetSkaterCamOverride <...> 
endscript

script ClearSkaterCamOverride 
    GetSkaterCam
    <skatercam> ::SC_ClearSkaterCamOverride <...> 
endscript

script ShakeCamera 
    GetSkaterCam
    <skatercam> ::SC_ShakeCamera <...> 
endscript

script empty_script 
endscript

script HideSkaterAndMiscSkaterEffects 
    KillTextureSplats \{ all }
    PreAllocSplats
    skater ::TurnSparksOff
    skater ::SwitchOnBoard
    skater ::RemoveSkaterFromWorld
endscript

script ResetLookAround 
    printf \{ 'ResetLookAround is not currently working.....' }
endscript

script toggle_framerate 
    switch lock_framerate
        case 0
        change \{ lock_framerate = 2 }
        case 1
        change \{ lock_framerate = 2 }
        case 2
        change \{ lock_framerate = 1 }
    endswitch
endscript

script CalcPosRelative ob = skater dx = 0 dy = 0 dz = 0
    <ob> ::obj_getposition
    <ob> ::obj_getorientation
    unit_z = ((1.0, 0.0, 0.0) * <x> + (0.0, 1.0, 0.0) * <y> + (0.0, 0.0, 1.0) * <z>)
    unit_x = ((0.0, 1.0, 0.0) * <unit_z>)
    unit_y = (<unit_z> * <unit_x>)
    Pos = (<Pos> + <dx> * <unit_x> + <dy> * <unit_y> + <dz> * <unit_z>)
    return x = (<Pos>.(1.0, 0.0, 0.0))y = (<Pos>.(0.0, 1.0, 0.0))z = (<Pos>.(0.0, 0.0, 1.0))Pos = <Pos>
endscript

script forced_create 
    if GotParam prefix
        Kill prefix = <prefix>
        Create prefix = <prefix>
    else
        if GotParam name
            if NodeExists <name>
                Kill name = <name>
                Create name = <name>
            else
                printf '### Forced_Create: %n does not exist' n = <name>
            endif
        else
            printf '### Forced_Create: Must specifiy a name or prefix'
        endif
    endif
endscript
skater_special_index = 0
have_loaded_permanent = 0
have_loaded_unloadable = 0

script do_load_permanent 
    if (have_loaded_permanent)
    else
        if IsNGC
            PushMemProfile 'Permanent Anims'
            MemPushContext topdownheap
            LoadPak 'pak/perm_anims/perm_anims.pak'
            MemPopContext
            PopMemProfile
        else
            do_unload_unloadable
            PushMemProfile 'Permanent Anims'
            MemPushContext topdownheap
            SetDefaultPermanent 1
            PushMemProfile 'Permanent Anims'
            LoadPak 'pak/perm_anims/perm_anims.pak'
            PopMemProfile
            SetDefaultPermanent 0
            MemPopContext
            PopMemProfile
        endif
        change have_loaded_permanent = 1
    endif
endscript

script do_unload_permanent 
    if NOT IsNGC
        if (have_loaded_permanent)
            BeginUnloadPak \{ 'pak/perm_anims/perm_anims.pak' }
            wait \{ 2 gameframe }
            EndUnloadPak \{ 'pak/perm_anims/perm_anims.pak' }
            change \{ have_loaded_permanent = 0 }
        endif
    endif
endscript

script do_load_unloadable 
    printf '**************************** do_load_unloadable'
    if (have_loaded_unloadable)
        printf 'already loaded'
    else
        do_load_permanent
        PushMemProfile 'Niewczytywalne animacje'
        SetDefaultPermanent 0
        if (load_bike)
            printf '************************load bike'
            LoadPak 'pak/bmx_anims/bmx_anims.pak' heap = unloadableanim
        else
            LoadPak 'pak/unloadable_anims/unloadable_anims.pak' heap = unloadableanim
        endif
        PopMemProfile
        if (load_bike)
        endif
        change have_loaded_unloadable = 1
        printf 'do_load_unloadable finished'
    endif
endscript

script do_unload_unloadable 
    printf '**************************** do_unload_unloadable'
    if (have_loaded_unloadable)
        if (load_bike)
            printf '************************unload bike'
            BeginUnloadPak 'pak/bmx_anims/bmx_anims.pak'
            EndUnloadPak 'pak/bmx_anims/bmx_anims.pak'
        else
            BeginUnloadPak 'pak/unloadable_anims/unloadable_anims.pak'
            EndUnloadPak 'pak/unloadable_anims/unloadable_anims.pak'
        endif
        change have_loaded_unloadable = 0
        printf 'do_unload_unloadable finished'
    else
        printf 'do_unload_unloadable not needed'
    endif
endscript

script what_is_loaded 
    if (have_loaded_permanent)
        printf \{ 'PERMANENT' }
    endif
    if (have_loaded_unloadable)
        printf \{ 'UNLOADABLE' }
    endif
endscript

script SetObjectColor_CurrentTOD 
    TODManager_GetCurrentTODParams
    <lev_red> = (<tod_params>.lev_red)
    <lev_green> = (<tod_params>.lev_green)
    <lev_blue> = (<tod_params>.lev_blue)
    setobjectcolor <...> color = (<lev_red> + (<lev_green> * 256)+ (<lev_blue> * 65536))
endscript

script KillCreateSponsorGeo 
    GoalManager_GetSponsor
    if GotParam sponsor_kill_prefix
        Kill prefix = <sponsor_kill_prefix>
    else
        printf ' >>>>>>>> WARNING: NO GEO PREFIX SENT TO KillCreateSponsorGeo >>>>>>>>>>> '
        return 
    endif
    if GotParam nosponsor_prefix
        Kill prefix = <nosponsor_prefix>
    endif
    switch <SPONSOR>
        case sponsor_birdhouse
        printf 'I\'m on Birdhouse!'
        Create prefix = <sponsor_birdhouse_prefix>
        case sponsor_element
        printf 'I\'m on Element!'
        Create prefix = <sponsor_element_prefix>
        case sponsor_flip
        printf 'I\'m on Flip!'
        Create prefix = <sponsor_flip_prefix>
        case sponsor_girl
        printf 'I\'m on Girl!'
        Create prefix = <sponsor_girl_prefix>
        case sponsor_zero
        printf 'I\'m on Zero!'
        Create prefix = <sponsor_zero_prefix>
        default 
        if GotParam nosponsor_prefix
            Create prefix = <nosponsor_prefix>
        endif
    endswitch
endscript

script GetNetworkNumPlayers 
    GetPreferenceChecksum pref_type = network num_players
    switch <checksum>
        case num_2
        return num_players = 2
        case num_3
        return num_players = 3
        case num_4
        return num_players = 4
        case num_5
        return num_players = 5
        case num_6
        return num_players = 6
        case num_7
        return num_players = 7
        case num_8
        return num_players = 8
        default 
        return num_players = 1
    endswitch
endscript

script trigger_speed_boost multi = 7.500
    if NOT GotParam no_sound
        SpawnSound SK6_SFX_Roll_Booster_Sound params = {DefBoostSound = <DefBoostSound> DefSkaterVO = <DefSkaterVO>}
    endif
    if GotParam max_speed
        getspeed
        if ((<Speed> * <multi>)> <max_speed>)
            if (<Speed> < <max_speed>)
                <new_speed> = <max_speed>
            else
                return 
            endif
        else
            <new_speed> = (<Speed> * <multi>)
        endif
        SetSkaterVelocity <new_speed>
    else
        if GotParam Speed
            SetSkaterVelocity <Speed>
        else
            GetSkaterVelocity
            SetSkaterVelocity vel_x = (<vel_x> * <multi>)vel_y = (<vel_y> * <multi>)vel_z = (<vel_z> * <multi>)
        endif
    endif
endscript

script trigger_jump_boost \{ multi = 7.500 }
    SpawnSound \{ SK6_SFX_Jump_Booster_Sound }
    GetSkaterVelocity
    if GotParam \{ Speed }
        SetSkaterVelocity vel_x = <vel_x> vel_y = <Speed> vel_z = <vel_z>
    else
        SetSkaterVelocity vel_x = <vel_x> vel_y = (<vel_y> * <multi>)vel_z = <vel_z>
    endif
endscript

script trigger_bounce \{ vel = 500 }
    GetSkaterVelocity
    if NOT walking
        jump \{ BonelessHeight }
    else
        LaunchEvent \{ type = JumpRequested }
    endif
    SetSkaterVelocity vel_x = <vel_x> vel_y = <vel> vel_z = <vel_z>
endscript

script ForceToWalk 
    printf \{ 'ForceToWalk' }
    if IsSkaterOnVehicle
        return 
    endif
    if IsSkaterOnBike
        return 
    endif
    SetForceWalk
    wait \{ 1 gameframe }
    TantrumOff
    if IsInBail
        WaitForEvent \{ type = finished_bailing }
    endif
    if NOT walking
        MakeSkaterGoto \{Switch_OnGroundAI params = { NewScript = Walking_onGroundAi }}
    else
        ClearTrickQueues
        SetWalkingAirTricks
        SetWalkingGroundTricks
    endif
    SwitchOnBoard
endscript

script KillForceToWalk 
    printf \{ 'KillForceToWalk' }
    if IsSkaterOnVehicle
        return 
    endif
    if IsSkaterOnBike
        return 
    endif
    UnsetForceWalk
    SwitchOnBoard
    ClearTrickQueues
    SetWalkingAirTricks
    SetWalkingGroundTricks
endscript
triggertypearray = [
    { name = skate value = 1 }
    { name = jump value = 2 }
    { name = onto value = 3 }
    { name = on value = 3 }
    { name = Off value = 4 }
    { name = OffEdge value = 5 }
    { name = wallplant value = 6 }
    { name = lip value = 7 }
    { name = land value = 8 }
    { name = bonk value = 9 }
    { name = climb value = 10 }
    { name = hang value = 10 }
    { name = graffiti value = 11 }
    { name = tag value = 11 }
    { name = spin value = 12 }
    { name = Natas value = 12 }
    { name = grind value = 13 }
    { name = projectile value = 14 }
    { name = walk value = 15 }
    { name = Smack value = 16 }
    { name = stall value = 17 }
    { name = AcidDrop value = 18 }
]

script StopParticleObject 
    if GotParam \{ debug }
        printf '### stopping particle object name = %n' n = <name>
    endif
    <name> ::setemitrate 0
    if NOT GotParam \{ StayAlive }
        begin 
        if NOT <name> ::isemitting
            Kill name = <name>
            break 
        endif
        wait \{ 30 gameframes }
        repeat 
    endif
endscript

script restore_start_key_binding 
    SetScreenElementProps \{id = root_window event_handlers = [{ pad_start handle_start_pressed }] replace_handlers}
    if (enable_view_goals_select_shortcut = 1)
        SetScreenElementProps \{id = root_window event_handlers = [{ pad_select create_view_goals_shortcut }] replace_handlers}
    endif
endscript

script kill_start_key_binding 
    SetScreenElementProps \{id = root_window event_handlers = [{ pad_start null_script }] replace_handlers}
    if (enable_view_goals_select_shortcut = 1)
        SetScreenElementProps \{id = root_window event_handlers = [{ pad_select null_script }] replace_handlers}
    endif
endscript

script ShowUIMem 
    <profile_names> = [
        'Fonts and Bitmaps'
        'Sprite\'y - czcionki i bitmapy'
    ]
    GetMemProfileSize profile_names = <profile_names>
    <usage_2d> = <profile_size>
    GetMemProfileSize profile_name = 'Menu 3D'
    <usage_3d> = <profile_size>
    if ((<usage_2d> > -1)& (<usage_3d> > -1))
        printf ''
        printf '**********************************'
        printf '	UI Memory Usage:'
        printf '	2D - %iK' i = (<usage_2d> / 1024)
        printf '	3D - %jK' j = (<usage_3d> / 1024)
        printf '**********************************'
        printf ''
    else
        printf 'Mem Profiler not active, probably overflowed, try restarting...'
    endif
endscript

script ShowAnimMem 
    <profile_names> = [
        'Permanent Anims'
        'Sta³e i pó³sta³e animacje'
    ]
    GetMemProfileSize profile_names = <profile_names>
    <usage_permanent> = <profile_size>
    GetMemProfileSize profile_name = 'Level Specific Anims'
    <usage_levelspecific> = <profile_size>
    if (<profile_size> > -1)
        printf ''
        printf '**********************************'
        printf '	Anim Memory Usage:'
        printf '	Permanent - %iK' i = (<usage_permanent> / 1024)
        printf '	Level-Specific - %jK' j = (<usage_levelspecific> / 1024)
        printf '**********************************'
        printf ''
    else
        printf 'Mem Profiler not active, probably overflowed, try restarting...'
    endif
endscript

script make_new_menu {menu_title = ''
        padding_scale = 1.150
        internal_scale = 1
        Pos = (230.0, 109.0)
        dims = (200.0, 100.0)
        internal_just = [ left top ]
        parent = root_window
        just = [ center center ]
        scrolling_menu_offset = (0.0, 10.0)
    }
    <Pos> = (<Pos> + (0.0, 12.0))
    SetScreenElementLock id = <parent> Off
    CreateScreenElement {
        type = ContainerElement
        parent = <parent>
        id = <menu_id>
        font = small
        Pos = (320.0, 240.0)
        Scale = 1
        dims = (640.0, 480.0)
        focusable_child = <vmenu_id>
    }
    switch <type>
        case vscrollingmenu
        if GotParam scrolling_menu_title_id
            CreateScreenElement {
                type = TextElement
                parent = <menu_id>
                id = <scrolling_menu_title_id>
                font = testtitle
                text = <menu_title>
                Scale = 1.400
                Pos = <Pos>
                just = [ left top ]
                rgba = MENU_TITLE_COLOR
                not_focusable
            }
            GetStackedScreenElementPos y id = <id> Offset = <scrolling_menu_offset>
        endif
        CreateScreenElement {
            type = vscrollingmenu
            parent = <menu_id>
            id = <scrolling_menu_id>
            Pos = <Pos>
            just = [ left top ]
            dims = <dims>
            Scale = <Scale>
            internal_just = [ left top ]
            num_items_to_show = <num_items_to_show>
        }
        <vscrolling_menu_id> = <id>
        CreateScreenElement {
            type = vmenu
            parent = <vscrolling_menu_id>
            id = <vmenu_id>
            dims = <dims>
            font = small
            just = [ left top ]
            Pos = (0.0, 0.0)
            Scale = <Scale>
            regular_space_amount = <regular_space_amount>
            padding_scale = <padding_scale>
            internal_scale = <internal_scale>
            internal_just = <internal_just>
            <dont_allow_wrap>
            event_handlers = [{pad_up generic_menu_up_or_down_sound params = { up }}
                {pad_down generic_menu_up_or_down_sound params = { down }}
            ]
        }
        default 
        CreateScreenElement {
            type = vmenu
            parent = <menu_id>
            id = <vmenu_id>
            font = small
            just = [ left top ]
            Pos = <Pos>
            padding_scale = <padding_scale>
            internal_scale = <internal_scale>
            internal_just = <internal_just>
            <dont_allow_wrap>
            event_handlers = [{pad_up generic_menu_up_or_down_sound params = { up }}
                {pad_down generic_menu_up_or_down_sound params = { down }}
            ]
        }
        if NOT GotParam no_menu_title
            CreateScreenElement {
                type = TextElement
                parent = <vmenu_id>
                font = testtitle
                text = <menu_title>
                Scale = 1.400
                rgba = MENU_TITLE_COLOR
                not_focusable
            }
        endif
    endswitch
    if NOT GotParam no_alias
        AssignAlias id = <menu_id> alias = current_menu_anchor
    endif
    AssignAlias id = <vmenu_id> alias = current_menu
    if GotParam helper_text
        create_helper_text <helper_text>
    endif
endscript

script make_text_sub_menu_item {focus_script = do_scale_up
        unfocus_script = do_scale_down
        pad_choose_script = NullScript
        font_face = small
        parent_menu_id = current_menu
        Scale = 1
        rgba = [ 88 105 112 128 ]
    }
    if GotParam not_focusable
        CreateScreenElement {
            type = TextElement
            parent = <parent_menu_id>
            id = <id>
            text = <text>
            font = <font_face>
            rgba = <rgba>
            Scale = <Scale>
            event_handlers = [
                {focus <focus_script> params = <focus_params>}
                {unfocus <unfocus_script> params = <unfocus_params>}
                {pad_choose <pad_choose_script> params = <pad_choose_params>}
                {pad_start <pad_choose_script> params = <pad_choose_params>}
            ]
            not_focusable
        }
    else
        if GotParam no_choose_sound
            CreateScreenElement {
                type = TextElement
                parent = <parent_menu_id>
                id = <id>
                text = <text>
                font = <font_face>
                rgba = <rgba>
                Scale = <Scale>
                event_handlers = [
                    {focus <focus_script> params = <focus_params>}
                    {unfocus <unfocus_script> params = <unfocus_params>}
                    {pad_choose <pad_choose_script> params = <pad_choose_params>}
                    {pad_start <pad_choose_script> params = <pad_choose_params>}
                ]
            }
        else
            CreateScreenElement {
                type = TextElement
                parent = <parent_menu_id>
                id = <id>
                text = <text>
                font = <font_face>
                rgba = <rgba>
                Scale = <Scale>
                event_handlers = [
                    {focus <focus_script> params = <focus_params>}
                    {unfocus <unfocus_script> params = <unfocus_params>}
                    { pad_choose generic_menu_pad_choose_sound }
                    { pad_start generic_menu_pad_choose_sound }
                    {pad_choose <pad_choose_script> params = <pad_choose_params>}
                    {pad_start <pad_choose_script> params = <pad_choose_params>}
                ]
            }
        endif
    endif
    if GotParam pad_circle_script
        SetScreenElementProps {id = <id>
            event_handlers = [
                {pad_circle <pad_circle_script> params = <pad_circle_params>}
            ]
        }
    endif
endscript

script SafeCallback 
    if NOT GotParam \{ callback }
        return 
    endif
    old_callback = <callback>
    RemoveParameter \{ callback }
    <old_callback> <...> 
endscript

script get_current_skater_name 
    GetCurrentSkaterProfileIndex
    GetSkaterProfileInfo player = <currentSkaterProfileIndex>
    return name = <name>
endscript

script AwardNewSpecialTrickToProfile 
    if GotParam all_profiles
        if GotParam name
            profile = <name>
        else
            ForEachSkaterName do = AwardNewSpecialTrickToProfile params = { <...> dont_replace_trick_text }
            ReplaceTrickText all
            return 
        endif
    else
        if NOT GotParam profile
            script_assert 'AwardNewSpecialTrickToProfile potrzebuje parametru profilu'
        endif
    endif
    if NOT GotParam Trick
        script_assert 'AwardNewSpecialTrickToProfile potrzebuje parametru trick'
    endif
    if NOT GotParam key_combo
        script_assert 'AwardNewSpecialTrickToProfile potrzebuje parametru key_combo'
    endif
    AwardSpecialTrickslot profile = <profile>
    if GetTrickFromKeyCombo profile = <profile> special key_combo = <key_combo>
        printf 'AwardNewSpecialTrickToProfile - key combo bound already for profile %p' p = <profile>
        BindTrickToKeyCombo {
            profile = <profile>
            special
            index = <current_index>
            key_combo = Unassigned
            Trick = Unassigned
            update_mappings = 1
        }
        <index> = <current_index>
    endif
    if GetKeyComboBoundToTrick profile = <profile> special Trick = <Trick> cat_num = <Trick>
        printf 'AwardNewSpecialTrickToProfile - trick bound already for profile %p' p = <profile>
        BindTrickToKeyCombo {
            profile = <profile>
            special
            index = <current_index>
            key_combo = Unassigned
            Trick = Unassigned
            update_mappings = 1
        }
        <index> = <current_index>
    endif
    GetSkaterProfileInfoByName name = <profile>
    if NOT GotParam index
        <index> = (<max_specials> - 1)
    endif
    BindTrickToKeyCombo {
        profile = <profile>
        special
        index = <index>
        key_combo = <key_combo>
        Trick = <Trick>
        update_mappings = 1
    }
    if NOT GotParam dont_replace_trick_text
        ReplaceTrickText all
    endif
    GetCurrentSkaterProfileIndex
    UpdateTrickMappings skater = <currentSkaterProfileIndex>
endscript

script TurnOffLevelParticles 
    if LevelIs \{ load_bo }
        BO_AllParticlesOff
    endif
endscript

script flip_skating_backwards 
    if NOT DoingBalanceTrick
        flip
        boardrotate
    else
        boardrotate
        if innollie
            if islatesttrick TrickText = 'One Foot Nose Manual'
                MakeSkaterGoto ManualLink params = {name = 'One Foot Manual' Score = 100 Blend = 0.1000 BalanceAnim = OneFootManual_Range OffMeterTop = ManualLand OffMeterBottom = ManualBail ExtraTricks = ManualBranches ExtraTricks2 = FlatlandBranches IsExtra}
            else
                if islatesttrick TrickText = 'Anti Casper'
                    MakeSkaterGoto ManualLink params = {name = 'Casper' Score = 100 Blend = 0.1000 BalanceAnim = Casper_Range OutAnim = Casper_Out OffMeterTop = ManualLand OffMeterBottom = NoseManualBail friction = 0.5000 boardrotate ExtraTricks = FlatlandBranches ExtraTricks2 = CasperBranches}
                else
                    if islatesttrick TrickText = 'Nose Manual'
                        MakeSkaterGoto ManualLink params = {name = 'Manual' Score = 100 Blend = 0.1000 BalanceAnim = Manual_Range BalanceAnim2 = Manual_Range2 BalanceAnim3 = Manual_Range3 OffMeterTop = ManualBail OffMeterBottom = ManualLand ExtraTricks2 = ManualBranches ExtraTricks = FlatlandBranches CheckCheese AllowWallpush}
                    endif
                endif
            endif
        else
            if islatesttrick TrickText = 'One Foot Manual'
                MakeSkaterGoto ManualLink params = {name = 'One Foot Nose Manual' Score = 100 Blend = 0 BalanceAnim = OneFootNoseManual_Range Nollie OffMeterTop = NoseManualBail OffMeterBottom = ManualLand IsExtra ExtraTricks = NoseManualBranches ExtraTricks2 = FlatlandBranches}
            else
                if islatesttrick TrickText = 'Casper'
                    MakeSkaterGoto ManualLink params = {name = 'Anti Casper' Score = 100 Blend = 0 BalanceAnim = AntiCasper_Range OutAnim = AntiCasper_Out OffMeterTop = ManualBail OffMeterBottom = ManualLand friction = 0.5000 boardrotate Nollie ExtraTricks = FlatlandBranches ExtraTricks2 = AntiCasperBranches}
                else
                    if islatesttrick TrickText = 'Manual'
                        MakeSkaterGoto ManualLink params = {name = 'Nose Manual' Score = 100 Blend = 0 BalanceAnim = NoseManual_range BalanceAnim2 = NoseManual_Range2 Nollie OffMeterTop = ManualLand OffMeterBottom = NoseManualBail ExtraTricks2 = NoseManualBranches ExtraTricks = FlatlandBranches CheckCheese AllowWallpush}
                    endif
                endif
            endif
        endif
    endif
endscript

script flip_grinding_backwards 
    OnExitRun flip_grinding_backwards_exit
    GetLatestTrickChecksum
    switch <latest_trick>
        case `FS\_50-50`
        case `FS\_50-50\_Stall`
        flip
        boardrotate
        MakeSkaterGoto Trick_5050_BS params = {IsExtra = IsExtra NoBlend = yes}
        case `BS\_50-50`
        case `BS\_50-50\_Stall`
        flip
        boardrotate
        MakeSkaterGoto Trick_5050_FS params = {IsExtra = IsExtra NoBlend = yes}
        case `FS\_Nosegrind`
        case `FS\_Nosegrind\_Stall`
        flip
        boardrotate
        MakeSkaterGoto Trick_5_0_FS params = {IsExtra = IsExtra NoBlend = yes}
        case `BS\_Nosegrind`
        case `BS\_Nosegrind\_Stall`
        flip
        boardrotate
        MakeSkaterGoto Trick_5_0_BS params = {IsExtra = IsExtra NoBlend = yes}
        case `FS\_5-0`
        case `FS\_5-0\_Stall`
        flip
        boardrotate
        MakeSkaterGoto Trick_NoseGrind_FS params = {IsExtra = IsExtra NoBlend = yes}
        case `BS\_5-0`
        case `BS\_5-0\_Stall`
        flip
        boardrotate
        MakeSkaterGoto Trick_NoseGrind_BS params = {IsExtra = IsExtra NoBlend = yes}
        case `BS\_Lipslide`
        case `BS\_Lipslide\_Stall`
        flip
        boardrotate
        MakeSkaterGoto Trick_Boardslide_BS params = {IsExtra = IsExtra NoBlend = yes}
        case `FS\_Lipslide`
        case `FS\_Lipslide\_Stall`
        rotate
        MakeSkaterGoto Trick_BoardSlide_FS params = {IsExtra = IsExtra NoBlend = yes}
        case `BS\_Boardslide`
        case `BS\_Boardslide\_Stall`
        rotate
        MakeSkaterGoto Trick_LipSlide_BS params = {IsExtra = IsExtra NoBlend = yes}
        case `FS\_Boardslide`
        case `FS\_Boardslide\_Stall`
        MakeSkaterGoto Trick_LipSlide_FS params = {IsExtra = IsExtra NoBlend = yes}
        case `FS\_Noseslide`
        case `FS\_Noseslide\_Stall`
        MakeSkaterGoto Trick_NoseSlide_BS_ok params = {IsExtra = IsExtra NoBlend = yes}
        case `BS\_Noseslide`
        case `BS\_Noseslide\_Stall`
        MakeSkaterGoto Trick_NoseSlide_FS_ok params = {IsExtra = IsExtra NoBlend = yes}
        case `FS\_Tailslide`
        case `FS\_Tailslide\_Stall`
        MakeSkaterGoto Trick_Tailslide_BS_ok params = {IsExtra = IsExtra NoBlend = yes}
        case `BS\_Tailslide`
        case `BS\_Tailslide\_Stall`
        MakeSkaterGoto Trick_Tailslide_FS_ok params = {IsExtra = IsExtra NoBlend = yes}
        default 
        rotate y = 180
    endswitch
endscript

script flip_grinding_backwards_exit 
    turntofacevelocity
endscript

script SetDepthOfFieldParams \{front_start = 0.0 back_start = 200.0 front_strength = [ 50 50 50 ] back_strength = [ 50 50 50 ]}
    if GotParam \{ Off }
        on = 0
    else
        on = 1
    endif
    SetScreenEffectsDOFParams {
        on = <on>
        FrontBlurStart = <front_start>
        BackBlurStart = <back_start>
        FrontStrenth = <front_strength>
        BackStrength = <back_strength>
    }
endscript

script fam_play_stream vol = 190
    checksum = <stream_checksum>
    begin 
    if PreLoadStreamDone <streamId>
        break 
    endif
    wait 1 frame
    repeat 
    if GotParam play_anim
        begin 
        Anim_GetReferenceChecksum
        if NOT IsPs2
            MangleChecksums a = <stream_checksum> b = <ReferenceChecksum> subtract = 1
            checksum = <mangled_id>
        endif
        if IsAssetLoaded name = <checksum> refChecksum = <ReferenceChecksum>
            break 
        endif
        wait 1 frame
        repeat 
        anim_command target = PedFAMAnimParentNode command = degenerateblend_addbranch params = {
            blendduration = 0.0
            tree = Ped_AnimBranch_FAMStandard params = {
                param_timer_type = play
                param_anim = <checksum>
                param_speed = 1.0
                param_start = 0.0
            }
        }
        anim_command target = PedBlendRoot command = partialswitch_setstate params = { on }
    endif
    fam_preloadfinished
    if GotParam use_pos_info
        obj_startpreloadedstream {
            <streamId>
            vol = <vol>
            dropoff = 300
            use_pos_info = <use_pos_info>
        }
    else
        StartPreLoadedStream {
            streamId = <streamId>
            volume = <vol>
        }
    endif
endscript

script stop_fam 
    anim_command \{target = PedFAMAnimParentNode command = degenerateblend_addbranch params = { blendduration = 0.0 tree = Ped_AnimBranch_FAMEmpty }}
    anim_command \{target = PedBlendRoot command = partialswitch_setstate params = { Off }}
endscript

script reset_balance_indicator 
    SpawnScriptLater \{ reset_balance_indicator2 }
endscript

script reset_balance_indicator2 
    SetScreenElementLock Off id = root_window
    if NOT ScreenElementExists id = balance_indicator
        CreateScreenElement {
            type = SpriteElement
            id = balance_indicator
            texture = heart
            parent = root_window
            Pos = (570.0, 240.0)
            Scale = (1.0, 1.0)
            rgba = [ 100 100 100 100 ]
        }
        CreateScreenElement {
            type = SpriteElement
            id = balance_indicator3
            texture = white2
            parent = root_window
            Pos = (569.0, 220.0)
            Scale = (0.5, 4.75)
            rgba = [ 100 0 0 100 ]
        }
        CreateScreenElement {
            type = SpriteElement
            id = balance_indicator2
            texture = white2
            parent = root_window
            Pos = (568.0, 220.0)
            Scale = (0.75, 5.0)
            rgba = [ 0 0 0 100 ]
        }
        wait 0.5000 seconds
        if ScreenElementExists id = balance_indicator
            DestroyScreenElement id = balance_indicator
            DestroyScreenElement id = balance_indicator2
            DestroyScreenElement id = balance_indicator3
        endif
    endif
endscript

script Vibrate_Controller_Safe actuator = 1 percent = 95
    GetSkaterNumber
    if ControllerBoundToSkater controller = 0 skater = <skaternumber>
        VibrateController port = 0 actuator = <actuator> percent = <percent>
    else
        if ControllerBoundToSkater controller = 1 skater = <skaternumber>
            VibrateController port = 1 actuator = <actuator> percent = <percent>
        else
            if ControllerBoundToSkater controller = 2 skater = <skaternumber>
                VibrateController port = 2 actuator = <actuator> percent = <percent>
            else
                if ControllerBoundToSkater controller = 3 skater = <skaternumber>
                    VibrateController port = 3 actuator = <actuator> percent = <percent>
                endif
            endif
        endif
    endif
endscript

script Vibrate_Controller_Safe_Explicit actuator = 1 percent = 95 skaternumber = 0
    if ControllerBoundToSkater controller = 0 skater = <skaternumber>
        VibrateController port = 0 actuator = <actuator> percent = <percent>
    else
        if ControllerBoundToSkater controller = 1 skater = <skaternumber>
            VibrateController port = 1 actuator = <actuator> percent = <percent>
        else
            if ControllerBoundToSkater controller = 2 skater = <skaternumber>
                VibrateController port = 2 actuator = <actuator> percent = <percent>
            else
                if ControllerBoundToSkater controller = 3 skater = <skaternumber>
                    VibrateController port = 3 actuator = <actuator> percent = <percent>
                endif
            endif
        endif
    endif
endscript

script create_scroll_bar {
        items = 1
        cols = 1
        size_height = 100
        Pos = (0.0, 0.0)
        icon_height = 20
        bar_color = [ 0 0 0 128 ]
        width = 10
    }
    if NOT GotParam icon_color
        Theme_GetPauseBarColor return_value = icon_color
    endif
    if GotParam no_wrap
        <vmenu> ::settags no_wrap = 1
    else
        <vmenu> ::settags no_wrap = 0
    endif
    <vmenu> ::settags scrollbar_items = <items> scrollbar_pos = 1
    rows = (<items> / <cols>)
    if NOT ((<items> - <rows> * <cols>)= 0)
        <rows> = (<rows> + 1)
    endif
    SetScreenElementProps {
        id = <vmenu>
        event_handlers = [{pad_up scrollbar_up_down params = { up }}
            {pad_down scrollbar_up_down params = { down }}
        ]
    }
    CreateScreenElement {
        type = ContainerElement
        parent = <parent>
        id = scrollbar_holder
        Pos = <Pos>
        not_focusable
    }
    CreateScreenElement {
        type = SpriteElement
        parent = scrollbar_holder
        id = scrollbar_bg
        texture = white2
        Pos = (0.0, 0.0)
        Scale = 1
        rgba = <bar_color>
        z_priority = 10
        just = [ center top ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = scrollbar_holder
        id = scrollbar_icon
        texture = white2
        Pos = (0.0, 0.0)
        Scale = 1
        rgba = <icon_color>
        z_priority = 11
        just = [ center top ]
    }
    GetScreenElementDims id = scrollbar_bg
    scale_width = (<width> / (<width> * 1.0))
    icon_scaley = (<icon_height> / (<height> * 1.0))
    icon_scale = (<scale_width> * (1.0, 0.0) + (0.0, 1.0) * <icon_scaley>)
    DoScreenElementMorph id = scrollbar_icon time = 0 Scale = <icon_scale>
    GetScreenElementDims id = scrollbar_icon
    sb_icon_size = <height>
    GetScreenElementDims id = scrollbar_bg
    bg_scaley = (<size_height> / (<height> * 1.0))
    bg_scale = (<scale_width> * (1.0, 0.0) + <bg_scaley> * (0.0, 1.0))
    DoScreenElementMorph id = scrollbar_bg time = 0 Scale = <bg_scale>
    GetScreenElementDims id = scrollbar_bg
    icon_slide_increment = ((<height> * 1.0 - <sb_icon_size> * 1.0)/ (<rows> -1.0))
    icon_increment = ((0.0, 0.0) + <icon_slide_increment> * (0.0, 1.0))
    <vmenu> ::settags scrollbar_rows = <rows> sb_icon_pos = (0.0, 0.0) sb_increment = <icon_increment> sb_height = <height> sb_icon_size = <sb_icon_size>
endscript

script scrollbar_up_down 
    gettags
    if GotParam up
        if ((<scrollbar_pos> -1)< 1)
            if NOT (<no_wrap>)
                <scrollbar_pos> = <scrollbar_rows>
                <sb_icon_pos> = ((<sb_icon_pos>.(1.0, 0.0))* (1.0, 0.0) + (0.0, 1.0) * (<sb_height> - <sb_icon_size>))
            endif
        else
            <scrollbar_pos> = (<scrollbar_pos> -1)
            <sb_icon_pos> = (<sb_icon_pos> - <sb_increment>)
        endif
    else
        if ((<scrollbar_pos> + 1)> <scrollbar_rows>)
            if NOT (<no_wrap>)
                <scrollbar_pos> = 1
                <sb_icon_pos> = ((<sb_icon_pos>.(1.0, 0.0))* (1.0, 0.0))
            endif
        else
            <scrollbar_pos> = (<scrollbar_pos> + 1)
            <sb_icon_pos> = (<sb_icon_pos> + <sb_increment>)
        endif
    endif
    settags scrollbar_pos = <scrollbar_pos> sb_icon_pos = <sb_icon_pos>
    DoScreenElementMorph id = scrollbar_icon time = 0 Pos = <sb_icon_pos>
endscript

script Integrated_CAS_Ped_Script type = barbershop
    Obj_ClearExceptions
    switch <type>
        case barbershop
        setup_ped_speech {
            dont_deactivate_goals
            ped_id = <ped_id>
            text = 'Wcinij\m5 by wybraæ fryzurê.'
            pad_option_script = Integrated_CAS_Launch
            pad_option_params = {
                script_qb = 'scripts\mainmenu\Integrated_CAS_test.qb'
                part = skater_m_hair
                type = <type>
            }
            pad_back_script = Integrated_CAS_Ped_Cancel
        }
        case graphicshop
        setup_ped_speech {
            dont_deactivate_goals
            ped_id = <ped_id>
            text = 'Aby stworzyæ grafikê, wcinij \m5.'
            pad_option_script = Integrated_CAGR_Launch
            pad_option_params = { in_menu = 0 }
        }
    endswitch
endscript
Integrated_CAGR_in_menu = 1
Integrated_CAGR_goal_id = null

script Integrated_CAGR_Launch 
    ScriptUsageSoftAssert Off
    if skater ::IsSkaterOnBike
        if ScreenElementExists id = speech_box_anchor
            DestroyScreenElement id = speech_box_anchor
        endif
        create_snazzy_dialog_box {
            Title = 'Przepraszam'
            text = 'Nie mo¿esz tagowaæ, jad¹c na tym rowerze.'
            text_dims = (400.0, 0.0)
            pad_back_script = Integrated_CAGR_bike_exit
            buttons = [
                {text = 'Ok' pad_choose_script = Integrated_CAGR_bike_exit}
            ]
        }
        return 
    endif
    change Integrated_CAGR_in_menu = <in_menu>
    if GotParam goal_id
        change Integrated_CAGR_goal_id = <goal_id>
    endif
    if NOT InFrontend
        change dont_create_speech_boxes = 1
        kill_start_key_binding
        hide_all_hud_items
        if IsNGC
            SpawnScriptLater swap_paks_with_transition params = {
                callback = edit_graphic_launch_cagr
                heap = bottomupheap
                a = 'unloadable_anims'
                b = 'CAGR_assets'
                b_localized_flag = localized
            }
        else
            SpawnScriptLater swap_paks_with_transition params = {
                callback = edit_graphic_launch_cagr
                heap = unloadableanim
                a = 'unloadable_anims'
                b = 'CAGR_assets'
                b_localized_flag = localized
            }
        endif
        change EG_pak_loaded = 1
    else
        if IsXenon
            MemPushContext bottomupheap
        else
            if IsNGC
                MemPushContext bottomupheap
            else
                MemPushContext unloadableanim
            endif
        endif
        if NOT IsTrue EG_pak_always_in_frontend
            LoadPak 'pak/CAGR_assets/CAGR_assets.pak' localized
            change EG_pak_loaded = 1
        endif
        MemPopContext
        if ((IsXenon)|| (IsXbox)|| (isPC))
            <text> = 'Dokonane tu zmiany NIE wp³yn¹ na grafikê stworzon¹ w trybie fabularnym.\n\nAby zmieniæ grafikê stworzon¹ w trybie fabularnym, pogadaj z graficiarzem podczas gry.\n\nTo menu pozwala zmieniæ grafikê u¿ywan¹ w trybach: klasyczny, rekord i 2 graczy.'
        else
            if IsNGC
                <text> = 'Dokonane tu zmiany NIE wp³yn¹ na grafikê stworzon¹ w trybie fabularnym.\n\nAby zmieniæ grafikê stworzon¹ w trybie fabularnym, pogadaj z graficiarzem podczas gry.\n\nTo menu pozwala zmieniæ grafikê u¿ywan¹ w trybach: klasyczny, rekord i 2 graczy.'
            else
                <text> = 'Dokonane tu zmiany NIE wp³yn¹ na grafikê stworzon¹ w trybie fabularnym.\n\nAby zmieniæ grafikê stworzon¹ w trybie fabularnym, pogadaj z graficiarzem podczas gry.\n\nTo menu pozwala zmieniæ grafikê u¿ywane w trybach: klasyczny, rekord, 2 graczy i gra sieciowa.'
            endif
        endif
        create_snazzy_dialog_box {
            Title = 'UWAGA!'
            text = <text>
            text_dims = (400.0, 0.0)
            no_bg
            buttons = [
                {text = 'Ok' pad_choose_script = edit_graphic_launch_cagr}
            ]
        }
    endif
endscript

script Integrated_CAGR_bike_exit 
    dialog_box_exit
    UnpauseSkaters
endscript

script Integrated_CAGR_Exit 
    if ObjectExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    if ObjectExists id = Integrated_cas_bg
        DestroyScreenElement id = Integrated_cas_bg
    endif
    if ScreenElementExists id = speech_box_anchor
        DestroyScreenElement id = speech_box_anchor
    endif
    change EG_in_create_a_graphic = 0
    ScriptUsageSoftAssert on
    if NOT InFrontend
        UnPauseGame
        if IsNGC
            SpawnScriptLater swap_paks_with_transition params = {
                callback = Integrated_CAGR_Exit_Callback
                heap = bottomupheap
                a = 'CAGR_assets'
                a_localized_flag = localized
                b = 'unloadable_anims'
            }
        else
            SpawnScriptLater swap_paks_with_transition params = {
                callback = Integrated_CAGR_Exit_Callback
                heap = unloadableanim
                a = 'CAGR_assets'
                a_localized_flag = localized
                b = 'unloadable_anims'
            }
        endif
        change EG_pak_loaded = 0
    else
        if NOT IsTrue EG_pak_always_in_frontend
            BeginUnloadPak 'pak/CAGR_assets/CAGR_assets.pak' localized
            wait 2 frames
            EndUnloadPak 'pak/CAGR_assets/CAGR_assets.pak' localized
            change EG_pak_loaded = 0
        endif
        create_createamodes_menu
    endif
endscript

script Integrated_CAGR_Exit_Callback 
    show_all_hud_items
    UnpauseSkaters
    restore_start_key_binding
    exit_pause_menu
    if NOT ChecksumEquals a = (Integrated_CAGR_goal_id)b = null
        GoalManager_GetGoalParams name = (Integrated_CAGR_goal_id)
        if GotParam \{ ped_floater_element }
            RunScriptOnScreenElement id = <ped_floater_element> goal_show_ped_floater
        endif
        GoalManager_ResetGoalTrigger name = (Integrated_CAGR_goal_id)
        change \{ Integrated_CAGR_goal_id = null }
    endif
    change \{ dont_create_speech_boxes = 0 }
endscript

script Integrated_CAS_Ped_Cancel 
    if ScreenElementExists \{ id = ped_speech_dialog }
        DestroyScreenElement \{ id = ped_speech_dialog }
    endif
endscript

script Integrated_CAS_Launch 
    if ScreenElementExists \{ id = speech_box_anchor }
        DestroyScreenElement \{ id = speech_box_anchor }
    endif
    hide_all_hud_items
    PauseSkaters
    LoadQB <script_qb>
    Integrated_CAS_create_item_menu part = <part> type = <type>
endscript

script Integrated_CAS_Exit \{ type = barbershop }
    show_all_hud_items
    UnpauseSkaters
    switch <type>
        case barbershop
        UnloadQB \{ 'levels\mainmenu\Integrated_CAS_test.qb' }
    endswitch
endscript

script Integrated_CAT_Ped_Script 
    Obj_ClearExceptions
    setup_ped_speech {
        ped_id = <ped_id>
        accept_text = 'Wcinij\ms by stworzyæ trik'
        activation_script = Integrated_CAT_Launch
        activation_script_params = {in_menu = 0 set_autobind = 1}
        dont_deactivate_goals
    }
endscript
Integrated_CAT_allow_exit = 1

script Integrated_CAT_Launch 
    if skater ::IsSkaterOnBike
        goto goal_skate_only_box_create
    endif
    goal_check_goal_already_active
    if GotParam dont_allow_exit
        change Integrated_CAT_allow_exit = 0
    else
        change Integrated_CAT_allow_exit = 1
    endif
    hide_compass_anchor
    hide_all_hud_items
    speech_box_exit
    cat_load_pak
    PauseSkaters
    if GotParam next_dialog_text
        SetScreenElementProps {
            id = root_window
            tags = { next_dialog_text = <next_dialog_text> }
        }
    else
        SetScreenElementProps {
            id = root_window
            tags = { next_dialog_text = '' }
        }
    endif
    create_pre_cat_menu set_autobind = <set_autobind> cat_trick_type = <cat_trick_type>
endscript

script goal_check_goal_already_active 
    <goal_is_active> = 0
    if GoalManager_GoalExists name = (goal_utility_last_goal_activated)
        if GoalManager_GoalIsActive name = (goal_utility_last_goal_activated)
            if GotParam \{ check_for_bike }
                <goal_is_active> = 1
            else
                goto goal_check_goal_already_active_box_create params = { goal_id = <goal_id> }
            endif
        endif
    endif
    return goal_is_active = <goal_is_active>
endscript

script goal_check_goal_already_active_box_create 
    pausegame
    GoalManager_HidePedFloaters
    GoalManager_PauseAllGoals
    create_error_box {Title = 'Hej'
        text = 'Musisz najpierw ukoñczyæ misjê.'
        text_dims = (400.0, 0.0)
        bg_scale = 1.200
        buttons = [
            {text = 'OK' pad_choose_script = goal_check_goal_already_active_box_exit pad_choose_params = { goal_id = <goal_id> }}
        ]
    }
endscript

script goal_check_goal_already_active_box_exit 
    Debounce \{ Circle time = 0.3000 }
    if GotParam \{ goal_id }
        GoalManager_ResetGoalTrigger name = <goal_id>
    endif
    GoalManager_UnHidePedFloaters
    dialog_box_exit
    UnPauseGame
    GoalManager_UnPauseAllGoals
endscript

script RailAccelerate 
    if triggertype \{ land onto }
        KillSpawnedScript \{ name = RailAccelerate2 }
        obj_getid
        <ObjID> ::obj_spawnscriptlater RailAccelerate2 params = <...> 
    endif
endscript

script RailAccelerate2 \{ rate = 0.05000 }
    <OldPos> = 0
    begin 
    if onrail
        obj_getposition
        <newpos> = (<Pos>.(0.0, 1.0, 0.0))
        if (<newpos> > <OldPos>)
            getspeed
            setspeed (<Speed> * (1.0 + <rate>))
        endif
        <OldPos> = <newpos>
        wait \{ 1 frames }
    else
        break 
    endif
    repeat 
endscript

script THUG3_RailBoost \{ boost = 1.100 maxspeed = 1200 }
    if triggertype \{ land onto }
        KillSpawnedScript \{ name = THUG3_RailBoost_Spawn }
        obj_getid
        <ObjID> ::obj_spawnscriptlater THUG3_RailBoost_Spawn params = {boost = <boost> maxspeed = <maxspeed>}
    endif
endscript

script THUG3_RailBoost_Spawn 
    begin 
    if onrail
        getspeed
        Speed = (<Speed> * <boost>)
        if (<Speed> < <maxspeed>)
            setspeed <Speed>
        else
            setspeed <maxspeed>
        endif
    else
        break 
    endif
    wait \{ 2 frames }
    repeat 
endscript

script Transition_Arrow 
    obj_hover \{ amp = 15 freq = 1.200 }
endscript

script THUG3_Ped_Bike_Guy 
    Obj_ClearExceptions
    obj_getid
    if ObjectExists \{ id = skater }
        if skater ::IsSkaterOnBike
            Die
        endif
    endif
    setup_ped_speech {
        ped_id = <ObjID>
        accept_text = 'Wcinij \ms aby wsi¹æ na rower'
        activation_script = toggle_bike_on_off
        activation_script_params = {on bike_ped_id = <ObjID>}
        dont_deactivate_goals
    }
    Ped_PlayAnim \{ anim = BMX_Getup Speed = 0 BlendPeriod = 0 norestart }
endscript
in_telescope_cam = 0

script enter_telescope_cam {Pos = (-28542.900390625, 1270.300048828125, 10882.7001953125)
        Quat = (-0.0040270001627504826, 0.9956520199775696, -0.003254000097513199)
        FOV = 72.0
        vel = 6000
        max_y = 0.5000 min_y = -0.5000
    }
    CreateCompositeObject {
        Components = 
        [
            {
                Component = cinematiccamera
                updatewhencamerainactive = false
                enabled = true
                updatewhengamepaused = false
            }
            {
                Component = camera
            }
        ]
        params = { name = telescope_camera }
    }
    change in_telescope_cam = 1
    SetActiveCamera id = telescope_camera
    telescope_camera ::CinematicCamera_DoMorph {LockTo = world Pos = <Pos> Quat = <Quat> FOV = <FOV>}
    change telescope_fire_pos = <Pos>
    change scope_projectile_velocity = <vel>
    hide_all_hud_items
    hide_compass_anchor
    SetScreenElementLock id = root_window Off
    CreateScreenElement {
        type = ContainerElement
        id = exit_telescope_anchor
        parent = root_window
        dims = (640.0, 480.0)
        Pos = (320.0, 240.0)
        event_handlers = [
            {pad_back exit_telescope_cam params = {scope = <scope> exit_script = <exit_script>}}
        ]
    }
    telescope_camera ::settags max_y = <max_y> min_y = <min_y>
    if GotParam instruction_text
        CreateScreenElement {
            type = TextElement
            parent = root_window
            font = dialog
            just = [ RIGHT top ]
            z_priority = 32
            id = telescope_text
            text = <instruction_text>
            Pos = (585.0, 405.0)
            rgba = [128 , 128 , 128 , 128]
        }
    endif
    if GotParam counter_text
        if ScreenElementExists id = telescope_counter
            DestroyScreenElement id = telescope_counter
        endif
        CreateScreenElement {
            type = TextElement
            parent = root_window
            font = dialog
            rgba = [ 128 128 128 128 ]
            text = <counter_text>
            Pos = (110.0, 405.0)
            id = telescope_counter
            just = [ RIGHT top ]
            z_priority = 32
        }
    endif
    create_helper_text parent = exit_telescope_anchor helper_text_elements = [{ text = '\m1=Wyjd' }] no_bar
    CreateScreenElement {
        type = SpriteElement
        parent = exit_telescope_anchor
        texture = white2
        Pos = (0.0, 384.0)
        just = [ center top ]
        rgba = [ 0 0 0 128 ]
        Scale = (200.5, 8.0)
        z_priority = -50
    }
    FireEvent type = focus target = exit_telescope_anchor
    telescope_blur_on
    UnpauseSkaters
    skater ::PausePhysics
    MakeSkaterGoto telescope_skater_logic
    SpawnScriptLater adjust_goal_hud_for_telescope_cam
endscript

script telescope_blur_on 
    SetScreenEffectsOn
    SetScreenEffectsBlurParams \{focus_center = [ 0.5000 0.5000 ] scales = [ 1.500 0.0 ] angles = [ 0.0 0.0 ] inner_color = [ 0.5000 0.5000 0.5000 ] inner_alpha = 0.0 outer_color = [ 1.0 1.0 1.0 ] outer_alpha = 1.800}
    SetScreenDeadZoneOn
endscript

script pause_telescope_cam 
    global_fx_zoomblur_clear
    SetScreenDeadZoneOff
    FireEvent \{ type = unfocus target = exit_telescope_anchor }
    restore_goal_hud_after_telescope_cam
    if ScreenElementExists \{ id = telescope_text }
        telescope_text ::DoMorph \{ alpha = 0 }
    endif
    if ScreenElementExists \{ id = telescope_counter }
        telescope_counter ::DoMorph \{ alpha = 0 }
    endif
endscript

script restore_telescope_camera 
    SetActiveCamera id = telescope_camera
    telescope_blur_on
    skater ::hide
    SetScreenElementLock id = exit_telescope_anchor Off
    create_helper_text parent = exit_telescope_anchor helper_text_elements = [{ text = '\m1=Wyjd' }] no_bar
    if ScreenElementExists id = telescope_text
        telescope_text ::DoMorph alpha = 1
    endif
    if ScreenElementExists id = telescope_counter
        telescope_counter ::DoMorph alpha = 1
    endif
    FireEvent type = focus target = exit_telescope_anchor
    SpawnScriptLater adjust_goal_hud_for_telescope_cam
endscript
TelescopeTricks = [
    {
        trigger = { Press square 300 }
        scr = telescope_fire
        NGC_Trigger = { Press Circle 300 }
    }
]
telescope_fire_pos = (0.0, 0.0, 0.0)

script telescope_fire 
    playsound Water_Gun_Fire_01 pitch = randomrange (85.0, 115.0) vol = randomrange (80.0, 120.0)
    telescope_camera ::obj_getorientation
    dir = ((1.0, 0.0, 0.0) * <x> + (0.0, 1.0, 0.0) * <y> + (0.0, 0.0, 1.0) * <z>)
    LaunchDirtyProjectile Pos = telescope_fire_pos dir = <dir>
    telescope_skater_logic
endscript

script telescope_skater_logic 
    telescope_camera ::gettags
    telescope_rotate_params = {
        Angle = 0.5000 time = 0.0 Block
        max_y = <max_y> min_y = <min_y>
    }
    hide
    ClearExceptions
    ClearAllWalkingExceptions
    ClearTrickQueue
    SetQueueTricks TelescopeTricks
    obj_killspawnedscript name = ActivateGroundTricksDelay
    begin 
    telescope_camera ::cinematiccamera_freeze
    if leftpressed
        telescope_rotate_left <telescope_rotate_params>
    endif
    if rightpressed
        telescope_rotate_right <telescope_rotate_params>
    endif
    if uppressed
        if IsTrue default_user_axis_inversion
            telescope_rotate_down <telescope_rotate_params>
        else
            telescope_rotate_up <telescope_rotate_params>
        endif
    endif
    if downpressed
        if NOT IsTrue default_user_axis_inversion
            telescope_rotate_down <telescope_rotate_params>
        else
            telescope_rotate_up <telescope_rotate_params>
        endif
    endif
    DoNextTrick
    wait 1 gameframe
    repeat 
endscript

script telescope_rotate_left 
    GetCurrentLevel
    if ChecksumEquals a = <level> b = Load_Z_SM
        telescope_camera ::obj_getorientationtoobject \{ skater }
        if (<dotprod> < -0.5000)
            return 
        endif
    endif
    telescope_camera ::CinematicCamera_Yaw <Angle> <...> world_space
endscript

script telescope_rotate_right 
    GetCurrentLevel
    if ChecksumEquals a = <level> b = Load_Z_SM
        telescope_camera ::obj_getorientationtoobject \{ skater }
        if (<dotprod> > 0.5000)
            return 
        endif
    endif
    telescope_camera ::CinematicCamera_Yaw (-1 * <Angle>)<...> world_space
endscript

script telescope_rotate_up 
    telescope_camera ::obj_getorientation
    if (<y> > <min_y>)
        telescope_camera ::cinematiccamera_pitch <Angle> <...> 
    endif
endscript

script telescope_rotate_down 
    telescope_camera ::obj_getorientation
    if (<y> < <max_y>)
        telescope_camera ::cinematiccamera_pitch (-1 * <Angle>)<...> 
    endif
endscript

script exit_telescope_cam 
    speech_box_input_debounce
    kill_start_key_binding
    if ScreenElementExists id = exit_telescope_anchor
        DestroyScreenElement id = exit_telescope_anchor
    endif
    if ScreenElementExists id = telescope_text
        DestroyScreenElement id = telescope_text
    endif
    if ScreenElementExists id = telescope_counter
        DestroyScreenElement id = telescope_counter
    endif
    global_fx_zoomblur_clear
    SetScreenDeadZoneOff
    show_all_hud_items
    show_compass_anchor
    UnpauseSkaters
    skater ::SetQueueTricks NoTricks
    skater ::UnPausePhysics
    if GotParam exit_script
        <exit_script>
    endif
    if GotParam scope
        if NodeExists <scope>
            if IsCreated <scope>
                Create name = <scope>
            endif
        endif
    endif
    skater ::unhide
    if skater ::walking
        MakeSkaterGoto SkaterInit params = { walk }
    else
        MakeSkaterGoto SkaterInit
    endif
    change in_telescope_cam = 0
    restore_skater_camera
    if IsCreated telescope_camera
        telescope_camera ::Die
    endif
    restore_goal_hud_after_telescope_cam
    restore_start_key_binding
endscript

script trampoline_bounce max_vel = 1500
    GetSkaterVelocity
    Walk_GetPrevAirVertVel
    prev_vert_vel = (-1 * <prev_vert_vel>)
    if Held x
        if NOT heldlongerthan button = x 0.5000 second
            printf 'Good Bounce'
            GetGap GapID = shaba_bounce text = 'Podskoki' Score = 10
            new_vel = (<prev_vert_vel> + 250)
        endif
    endif
    if NOT GotParam new_vel
        printf 'Bad Bounce'
        new_vel = (<prev_vert_vel> / 1.300)
    endif
    if (<new_vel> > <max_vel>)
        new_vel = <max_vel>
    endif
    if (<new_vel> > 300)
        if walking
            JumpRequestedEvent
        else
            if NOT IsInBail
                jump
            endif
        endif
        SetSkaterVelocity vel_x = <vel_x> vel_y = <new_vel> vel_z = <vel_z>
        vibrate actuator = 1 percent = ((<new_vel> / <max_vel>)* 100)duration = 0.2000
        printf 'new_vel ============ %v' v = <new_vel>
    endif
endscript

script secret_tape 
    bounce_skate_letter
endscript

script skate_letter 
    bounce_skate_letter
endscript
G_THAW_GRIND_COUNT = [
    0
    0
    0
    0
    0
    0
    0
    0
]

script grind_count_text 
    setprops \{rgba = [ 128 128 128 128 ]}
    wait \{ 1000 }
    Die
endscript

script THAW_Grind_Counter 
    if onrail
        <skaternumber> = 0
        if InSplitScreenGame
            ScriptGetScreenMode
            GetSkaterNumber
            switch <screen_mode>
                case split_vertical
                Pos = (160.0, 90.0)
                switch <skaternumber>
                    case 0
                    parent = player1_panel_container
                    case 1
                    parent = player2_panel_container
                endswitch
                case split_horizontal
                Pos = (320.0, 40.0)
                switch <skaternumber>
                    case 0
                    parent = player1_panel_container
                    case 1
                    parent = player2_panel_container
                endswitch
            endswitch
        endif
        <tmpArray> = G_THAW_GRIND_COUNT
        SetArrayElement arrayName = tmpArray index = <skaternumber> newValue = ((<tmpArray> [ <skaternumber> ])+ 1)
        if NOT ((<tmpArray> [ <skaternumber> ])= 1)
            if ((<tmpArray> [ <skaternumber> ])= 2)
                FormatText textname = THAW_Grind_Counter_Text '%a okr¹¿eñ' a = ((<tmpArray> [ <skaternumber> ])-1)
            else
                FormatText textname = THAW_Grind_Counter_Text '%a razy dooko³a' a = ((<tmpArray> [ <skaternumber> ])-1)
            endif
            if InSplitScreenGame
                create_panel_message id = (message_THAW_Grind_Count + <skaternumber>)text = <THAW_Grind_Counter_Text> style = grind_count_text parent = <parent> Pos = <Pos>
            else
                Pos = (320.0, 100.0)
                create_panel_message id = (message_THAW_Grind_Count + <skaternumber>)text = <THAW_Grind_Counter_Text> style = grind_count_text Pos = <Pos>
            endif
        endif
        KillSpawnedScript id = THAW_Grind_Counter
        SpawnScriptLater THAW_Grind_Counter_End_Checker id = THAW_Grind_Counter
    endif
endscript

script THAW_Grind_Counter_End_Checker 
    ClearExceptionGroup \{ THAW_Grind_Counter }
    SetException \{ Ex = SkaterEnterAir scr = THUG3_Grind_Counter_Reset group = THAW_Grind_Counter }
    SetException \{ Ex = SkaterEnterBail scr = THUG3_Grind_Counter_Reset group = THAW_Grind_Counter }
    Block
endscript

script THUG3_Grind_Counter_Reset 
    <tmpArray> = G_THAW_GRIND_COUNT
    CastToInteger \{ fired_by_id }
    SetArrayElement arrayName = tmpArray index = <fired_by_id> newValue = 0
endscript

script move_skater_to 
    if GotParam x
        my_X = <x>
    endif
    if GotParam y
        my_Y = <y>
    endif
    if GotParam z
        my_z = <z>
    endif
    GetSkaterPosition
    if NOT GotParam my_X
        my_X = <x>
    endif
    if NOT GotParam my_Y
        my_Y = <y>
    endif
    if NOT GotParam my_z
        my_z = <z>
    endif
    skater ::obj_setposition position = (<my_X> * (1.0, 0.0, 0.0) + <my_Y> * (0.0, 1.0, 0.0) + <my_z> * (0.0, 0.0, 1.0))
endscript
SpotlightTargetComponents = [
    { Component = motion }
    { Component = lockobj }
    {
        Component = dynamiclight
        startradius = 100
        startIntensity = 1.0
        startRGBA = [ 128 128 128 128 ]
    }
]
SpotlightConeComponents = [
    { Component = motion }
    { Component = lockobj }
    { Component = Model Model = 'gameobjects\searchlight\searchlight01.mdl' }
]
heli_vertical_vel = 20

script create_heli 
    SpawnScriptLater create_heli2 params = {start_pos = <start_pos>
        velocity = <velocity>
        spot_speed = <spot_speed>
        spot_count = <spot_count>
    }
endscript

script create_heli2 {start_pos = (-1702.0, 496.0, -3195.0)
        velocity = 10
        spot_speed = 5
        spot_count = 60
    }
    SetSearchAllMangles
    CreateCompositeObject {
        Components = SpotlightTargetComponents
        params = { name = spotlightTarget }
    }
    CreateCompositeObject {
        Components = SpotlightConeComponents
        params = { name = spotlight1 }
    }
    CreateCompositeObject {
        Components = [
            {
                Component = motion
            }
            {
                Component = ModelLightUpdate
            }
            {
                Component = Model
                usemodellights
                Model = 'veh\veh_el_helicopter\veh_el_helicopter.mdl'
            }
            {
                Component = spotlight
                target = spotlightTarget
                texture = apm_searchlight_spat01_x
                object = spotlight1
                start_pos = <start_pos>
                velocity = <velocity>
                spot_speed = <spot_speed>
                spot_count = <spot_count>
            }
            {
                Component = stream
            }
        ]
        params = { name = heli1 }
    }
    spotlightTarget ::obj_locktoobject {
        id = skater
        boneoffset = (0.0, 0.0, 0.0)
        lagrange = (0.5, 0.800000011920929)
        no_rotate
        ignorelockdie
    }
    spotlight1 ::obj_locktoobject {
        id = heli1
        boneoffset = (0.0, 0.0, 0.0)
        no_rotate
        no_orient
        ignorelockdie
    }
    heli1 ::obj_playstream Chopper_Loop vol = 100 dropoff = 600 priority = StreamPriorityHighest num_loops = -1
    SetSearchAllMangles Off
endscript

script kill_heli 
    if IsCreated \{ heli1 }
        heli1 ::Die
    endif
    if IsCreated \{ spotlightTarget }
        spotlightTarget ::Die
    endif
    if IsCreated \{ spotlight1 }
        spotlight1 ::Die
    endif
endscript

script THAW_RollupDoor_Wait 
    Obj_ClearExceptions
    obj_setinnerradius \{ 50 }
    Obj_SetException \{ Ex = objectinradius scr = THAW_RollupDoor_MoveUp }
    printf \{ 'THAW_RollupDoor_Wait' }
endscript

script THAW_RollupDoor_MoveUp 
    PlayStream \{ Gate_open priority = StreamPriorityHighest }
    Obj_ClearExceptions
    obj_movetorelpos \{ (0.0, 200.0, 0.0) time = 0.5000 }
    obj_setouterradius \{ 80 }
    Obj_SetException Ex = objectoutofradius scr = THAW_RollupDoor_Down params = <...> 
    printf \{ 'THAW_RollupDoor_MoveUp' }
endscript

script THAW_RollupDoor_Down 
    Obj_ClearExceptions
    obj_movetorelpos \{ (0.0, -200.0, 0.0) time = 0.1000 }
    printf \{ 'THAW_RollupDoor_Down' }
    Obj_WaitMove
    GotoPreserveParams THAW_RollUpDoor_ZoneLoaded params = <...> 
endscript

script THAW_RollUpDoor_ZoneLoaded 
    Obj_ClearExceptions
    begin 
    if GotParam \{ occluder }
        if NOT IsCreated <occluder>
            Create name = <occluder>
        endif
    endif
    if ZoneLoadedAndParsed <zonename>
        GotoPreserveParams THAW_RollupDoor_Zone_MoveUp params = <...> 
    endif
    wait \{ 2 frames }
    repeat 
endscript

script THAW_RollupDoor_Zone_MoveUp 
    if GotParam occluder
        Kill name = <occluder>
    endif
    if GotParam down
        obj_movetorelpos (0.0, -700.0, 0.0) time = 0.5000
        Obj_WaitMove
    else
        obj_movetorelpos (0.0, 300.0, 0.0) time = 0.5000
        Obj_WaitMove
    endif
    begin 
    if NOT ZoneLoadedAndParsed <zonename>
        if GotParam occluder
            if NOT IsCreated <occluder>
                Create name = <occluder>
            endif
        endif
        if GotParam down
            obj_movetorelpos (0.0, 700.0, 0.0) time = 0.1000
            Obj_WaitMove
            GotoPreserveParams THAW_RollUpDoor_ZoneLoaded params = <...> 
        else
            obj_movetorelpos (0.0, -300.0, 0.0) time = 0.1000
            Obj_WaitMove
            GotoPreserveParams THAW_RollUpDoor_ZoneLoaded params = <...> 
        endif
    endif
    wait 2 frames
    repeat 
endscript
transition_max_speed = 600

script transitionEnter 
    GetCurrentZoneName
    switch <zone_name>
        case 'z_srbh'
        printf 'z_srbh'
        change transition_max_speed = 750
        case 'z_bhsr'
        printf 'z_bhsr'
        change transition_max_speed = 750
        case 'z_hodt'
        printf 'z_hodt'
        change transition_max_speed = 600
        case 'z_dtho'
        printf 'z_dtho'
        change transition_max_speed = 600
        case 'z_smbh'
        printf 'z_smbh'
        change transition_max_speed = 550
        case 'z_bhsm'
        printf 'z_bhsm'
        change transition_max_speed = 550
        case 'z_hobh'
        printf 'z_hobh'
        change transition_max_speed = 600
        case 'z_bhho'
        printf 'z_bhho'
        change transition_max_speed = 600
        case 'z_eldt'
        printf 'z_eldt'
        change transition_max_speed = 750
        case 'z_dtel'
        printf 'z_dtel'
        change transition_max_speed = 750
        default 
        printf 'default'
        change transition_max_speed = 750
    endswitch
    printf '******************************* transitionEnter speed=%s *******************************' s = (transition_max_speed)
    overridelimits max = (transition_max_speed)CurrentLevel
endscript

script transitionExit 
    printf \{ '******************************* transitionExit *******************************' }
    overridelimits \{ LevelEnd }
endscript

script THAW_skater_laydown 
    if NOT GameModeEquals \{ is_career }
        return 
    endif
    setup_ped_speech {
        ped_id = <nodeName>
        accept_text = 'Nacinij\ms aby zrzuciæ ³adunek'
        activation_script = THAW_skater_passtime_controller
        dont_deactivate_goals
        pad_circle_params = { ped_id = <nodeName> }
    }
endscript
thaw_skater_passtime_active = 0

script THAW_skater_passtime_controller 
    printf 'nodename = %n' n = <ped_id>
    if IsTrue thaw_skater_passtime_active
        return 
    endif
    if GoalManager_HasActiveGoals
        text = 'Zanim siê zrelaksujesz, zakoñcz misjê!'
    endif
    if NOT skater ::walking
        text = 'Musisz trochê pochodziæ zanim siê rozlunisz!'
    endif
    if skater ::IsSkaterOnBike
        text = 'Zanim siê zrelaksujesz, zejd z roweru!'
    endif
    if skater ::currentscorepotgreaterthan 0
        text = 'Zakoñcz combo zanim siê odprê¿ysz!'
    endif
    if GotParam text
        GoalManager_PauseAllGoals
        PauseSkaters
        create_snazzy_dialog_box {
            Title = 'Hej'
            text = <text>
            text_dims = (400.0, 0.0)
            pad_back_script = thaw_skater_reject_cleanup
            no_bg
            buttons = [
                {text = 'Ok' pad_choose_script = thaw_skater_reject_cleanup}
            ]
        }
    else
        change thaw_skater_passtime_active = 1
        skater ::RunTimer_pause
        UnpauseSkaters
        <initial_wait> = 2.0
        <fade_time> = 1.200
        <black_time> = 1.0
        <wait_time> = 1.0
        <end_wait> = 1.800
        spawnscriptnow THAW_skater_passtime_effect params = <...> 
    endif
endscript

script thaw_skater_reject_cleanup 
    GoalManager_UnPauseAllGoals
    bus_teleport_cleanup
endscript

script THAW_skater_passtime_effect 
    freeze_skater_for_cinematic
    MakeSkaterGoto THAW_skater_passtime_behavior params = {nodeName = <ped_id> wait_time = <wait_time>}
    PlayIGCCamScene ControlScript = thaw_sleepcam params = <...> Play_hold = 1
    kill_start_key_binding
    GoalManager_PauseAllGoals
    GetClockText
    create_panel_block {
        parent = root_window
        id = current_time_msg
        text = <clock_text>
        style = panel_message_landed
    }
    wait <initial_wait> seconds
    igc_fadeout time = <fade_time>
    TODManager_AdvanceTODState
    wait <black_time> seconds
    igc_fadein time = <fade_time>
    wait <fade_time> seconds
    GetClockText
    create_panel_block {
        parent = root_window
        id = current_time_msg
        text = <clock_text>
        style = panel_message_landed
    }
    wait <wait_time> seconds
    wait <end_wait> seconds
    unfreeze_skater_after_cinematic
    GoalManager_UnPauseAllGoals
    KillSkaterCamAnim current
    change thaw_skater_passtime_active = 0
    restore_start_key_binding
endscript

script THAW_skater_passtime_behavior 
    obj_movetonode name = <nodeName> orient
    Skater_Playanim \{ anim = Ped_Bum_Stand2Sit }
    Skater_Playanim \{ anim = Ped_Bum_Sit2Sleep }
    Skater_WaitAnimFinished
    Skater_Playanim \{ anim = Ped_Bum_Sleep_Idle_01 Cycle }
    wait <fade_time> seconds
    wait <black_time> seconds
    wait <fade_time> seconds
    wait <wait_time> seconds
    Skater_Playanim \{ anim = Ped_Bum_Sleep2Sit }
    Skater_Playanim \{ anim = Ped_Bum_Sit2Stand }
    Skater_WaitAnimFinished
    Skater_Playanim \{ anim = WStand Cycle }
endscript

script thaw_sleepcam 
    wait <initial_wait> seconds
    cinematiccamera_pitch -15 time = <fade_time>
    cinematiccamera_zoom -20 time = <fade_time>
    wait <fade_time> seconds
    wait <wait_time> seconds
    cinematiccamera_pitch 15 time = <fade_time>
    cinematiccamera_zoom 20 time = <fade_time>
endscript

script ui_exit_debounce 
    if IsNGC
        Debounce \{ square time = 86400 }
        ControllerDebounce \{ square time = 86400 }
    endif
endscript
