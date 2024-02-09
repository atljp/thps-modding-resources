in_bus = 0
SkateZoneParams = {
    Z_HO_Transition_Params = { prefix = 'HO' transition_zone = true show_welcome = false }
    Z_BH_Transition_Params = { prefix = 'BH' transition_zone = true show_welcome = false }
    Z_DT_Transition_Params = { prefix = 'DT' transition_zone = true show_welcome = false }
    Z_EL_Transition_Params = { prefix = 'EL' transition_zone = true show_welcome = false }
    Z_SM_Transition_Params = { prefix = 'SM' transition_zone = true show_welcome = false }
    Z_OI_Transition_Params = { prefix = 'OI' transition_zone = true show_welcome = false }
    Z_SV_Transition_Params = { prefix = 'SV' transition_zone = true show_welcome = false }
    Z_LV_Transition_Params = { prefix = 'LV' transition_zone = true show_welcome = false }
    Z_SR_Transition_Params = { prefix = 'SR' transition_zone = true show_welcome = false }
    Z_HO_Params = {
        prefix = 'HO'
        name = 'Hollywood'
        transition_zone = false
        show_welcome = true
        bus_restart_node = z_ho_bus
    }
    Z_BH_Params = {
        prefix = 'BH'
        name = 'Beverly Hills'
        transition_zone = false
        show_welcome = true
        bus_restart_node = z_bh_bus
    }
    Z_DT_Params = {
        prefix = 'DT'
        name = 'Downtown'
        transition_zone = false
        show_welcome = true
        bus_restart_node = z_dt_bus
    }
    Z_EL_Params = {
        prefix = 'EL'
        name = 'L.A. Ost'
        transition_zone = false
        show_welcome = true
        bus_restart_node = z_el_bus
    }
    Z_SM_Params = {
        prefix = 'SM'
        name = 'Santa Monica'
        transition_zone = false
        show_welcome = true
        bus_restart_node = z_sm_bus
    }
    Z_OI_Params = {
        prefix = 'OI'
        name = 'Bohrinsel'
        transition_zone = false
        show_welcome = true
        bus_restart_node = z_sm_bus
    }
    Z_LV_Params = {
        prefix = 'LV'
        name = 'Kasino'
        transition_zone = false
        show_welcome = true
        bus_restart_node = z_el_bus
    }
    Z_SV_Params = {
        prefix = 'SV'
        name = 'Vans Skatepark'
        transition_zone = false
        show_welcome = true
        bus_restart_node = z_dt_bus
    }
    Z_SR_Params = {
        prefix = 'SR'
        name = 'Skate-Ranch'
        transition_zone = false
        show_welcome = true
        bus_restart_node = z_bh_bus
    }
    Z_Shop_Params = { transition_zone = true show_welcome = false }
}

script Zone_LoadLastPlayed 
    if GetGlobalFlag \{ flag = CAREER_ONETIMEINTRO }
        <last_level> = Load_Z_StorySelect
    else
        if NOT CareerFunc \{ func = GetLastLevelPlayed }
            scriptassert \{ 'no last level recorded!' }
        endif
    endif
    SpawnScriptLater noqbid change_level params = { level = <last_level> }
endscript

script zone_changed 
    if NOT GotParam newzoneparamsstruct
        return 
    endif
    if NOT GameModeEquals is_career
        return 
    endif
    if (view_mode > 0)
        zone_welcome_message_kill
    else
        zone_welcome_fast_out
    endif
    if ((SkateZoneParams.<newzoneparamsstruct>.transition_zone)= false)
        GetLevelStructureName level = (SkateZoneParams.<newzoneparamsstruct>.prefix)
        <load_script> = (<level_structure_name>.load_script)
        if (cas_was_in_store = 0)
            GetValueFromVolume cdvol
            if (<value> = 0)
                SetCDToAmbient
            endif
        else
            change cas_was_in_store = 0
        endif
        if CareerFunc func = GetLastLevelPlayed
            if (<last_level> = <load_script>)
                return 
            endif
        endif
        zone_welcome_message <...> 
        CareerStartLevel structure_name = <level_structure_name>
        SpawnScriptLater game_progress_process_status params = { wait_time = 3 }
    else
        if ((entering_cas_store)= 0)
            GetValueFromVolume cdvol
            if (<value> = 0)
                SetCDToMusic
            endif
        endif
    endif
    if StructureContains structure = (SkateZoneParams.<newzoneparamsstruct>)prefix
        KillSpawnedScript name = zone_changed_setup_tod
        SpawnScript zone_changed_setup_tod params = {prefix = (SkateZoneParams.<newzoneparamsstruct>.prefix)}
    endif
endscript

script Zone_SetAppropriateMap 
    <zone_folder> = 'Worlds/worldZones/'
    if (<level> = 'z_mainmenu')
        <zone_links> = MainMenuZones
    else
        GetGameMode
        if (((InNetGame)|| (InSplitScreenGame))& (IsPs2))
            <zone_links> = NetSkateZones
        else
            switch <gamemode>
                case career
                if GetGlobalFlag flag = CAREER_ONETIMEINTRO
                    <zone_links> = SkateZonesStoryOpening
                else
                    <zone_links> = SkateZones
                endif
                default 
                <zone_links> = SkateZones
            endswitch
        endif
    endif
    SetPakZoneFolder <zone_folder>
    CreateZoneMap links = <zone_links>
endscript

script zone_transport dest = 'z_dt'
    change in_bus = 1
    StopStream Int_Bus_Loop
    StopStream Int_Bus_Loop
    if GotParam truck_menu
        PlayStream Truck_Depart priority = StreamPriorityHighest
    else
        PlayStream Bus_Depart priority = StreamPriorityHighest
    endif
    zone_welcome_message_kill
    zone_transport_menu_exit
    if GotParam truck_menu
        skater ::disableplayerinput
    endif
    BlockPakSceneSetting on
    BeginUnloadAllZones
    wait 2 gameframes
    EndUnloadAllZones
    CareerStartLevel prefix = <dest>
    StartPakLoad zone = <dest> no_block
    FormatText checksumname = dest_checksum <dest>
    begin 
    if ZoneLoadedAndParsed <dest_checksum>
        break 
    endif
    wait 0.2500 seconds
    repeat 
    if GotParam truck_menu
        FlushPedsFromHeap heap = GoalHeap
        BeginUnloadPak 'worlds/worldZones/z_pickup/z_pickup.pak'
        wait 2 gameframes
        EndUnloadPak 'worlds/worldZones/z_pickup/z_pickup.pak'
    endif
    change in_bus = 0
    stoprendering
    zone_changed_setup_tod {
        prefix = <dest>
        system_transition_length = 1
        no_wait
    }
    wait 2 gameframes
    show_compass_anchor
    KillSkaterCamAnim all
    skater ::KillForceToWalk
    ResetSkaters
    BlockPakSceneSetting Off
    startrendering
    SpawnScriptLater game_progress_process_status params = { wait_time = 3 }
    StopStream Int_Bus_Loop
    if GotParam truck_menu
        skater ::switchonatomic board
        skater ::enableplayerinput
    endif
endscript

script GetPakSizes 
    GetPlatform
    switch <platform>
        case xbox
        return \{ pak_sizes_array = pak_sizes_xbx }
        case pc
        return \{ pak_sizes_array = pak_sizes_wpc }
        case xenon
        return \{ pak_sizes_array = pak_sizes_xen }
        case ngc
        return \{ pak_sizes_array = pak_sizes_ngc }
        case ps2
        return \{ pak_sizes_array = pak_sizes_ps2 }
        default 
        scriptassert \{ 'Unknown platform' }
    endswitch
endscript

script swap_paks 
    FormatText textname = pak_name 'pak/%p/%p.pak' p = <a>
    FormatText checksumname = pak_checksum <a>
    printf 'swap_paks: unloading %s' s = <pak_name>
    ResetStopwatch
    BeginUnloadPak <pak_name> <a_localized_flag>
    PrintStopwatchTime
    wait 2 gameframes
    ResetStopwatch
    EndUnloadPak <pak_name> <a_localized_flag>
    PrintStopwatchTime
    FormatText textname = pak_name 'pak/%p/%p.pak' p = <b>
    FormatText checksumname = pak_checksum <b>
    printf 'swap_paks: loading %s' s = <pak_name>
    SetDefaultPermanent 0
    GetPakSizes
    ResetStopwatch
    LoadPak <pak_name> heap = <heap> size = (<pak_sizes_array>.<pak_checksum>.size)load_callback = <load_callback> <b_localized_flag>
    PrintStopwatchTime
endscript

script swap_paks_with_transition 
    StartDelaySystemUI
    change check_for_unplugged_controllers = 0
    SetScreenElementLock id = root_window Off
    CreateScreenElement {
        type = SpriteElement
        parent = root_window
        id = loading_sprite
        texture = hud_comp_goal
        Pos = (590.0, 40.0)
        just = [ center center ]
        Scale = (1.0, 1.0)
        rgba = [ 128 128 128 128 ]
        alpha = 1
    }
    RunScriptOnScreenElement id = loading_sprite anim_swap_loading
    skater ::PausePhysics
    skater ::disableplayerinput
    skater ::SkaterLoopingSound_TurnOff
    GlobalEffects_ClearState id = pulse_bloom
    MakeSkaterGoto skater_loading_pak_anim
    wait 1 seconds
    swap_paks {
        load_callback = swap_paks_with_transition_signal
        a = <a>
        a_localized_flag = <a_localized_flag>
        b = <b>
        b_localized_flag = <b_localized_flag>
        heap = <heap>
    }
    WaitForEvent type = swap_paks_with_transition_finished
    wait 2 seconds
    StopDelaySystemUI
    change check_for_unplugged_controllers = 1
    DestroyScreenElement id = loading_sprite
    skater ::UnPausePhysics
    skater ::enableplayerinput
    skater ::input_debounce x
    if NOT skater ::walking
        skater ::SkaterLoopingSound_TurnOn
    endif
    if skater ::walking
        MakeSkaterGoto StandState
    else
        MakeSkaterGoto ongroundai
    endif
    if GotParam callback
        <callback>
    endif
endscript

script skater_loading_pak_anim 
    begin 
    Skater_Playanim \{ anim = W_Boardswitch_Standing }
    Skater_WaitAnimFinished
    flip
    repeat 
endscript

script swap_paks_for_bike 
    SetScreenElementLock id = root_window Off
    CreateScreenElement {
        type = SpriteElement
        parent = root_window
        id = loading_sprite
        texture = hud_comp_goal
        Pos = (590.0, 40.0)
        just = [ center center ]
        Scale = (1.0, 1.0)
        rgba = [ 128 128 128 128 ]
        alpha = 1
    }
    RunScriptOnScreenElement id = loading_sprite anim_swap_loading
    swap_paks {
        load_callback = swap_paks_with_transition_signal
        a = <a>
        b = <b>
        heap = <heap>
    }
    WaitForEvent type = swap_paks_with_transition_finished
    DestroyScreenElement id = loading_sprite
endscript

script swap_paks_with_transition_signal 
    if GotParam \{ start }
        broadcastevent \{ type = swap_paks_with_transition_started }
    endif
    if GotParam \{ end }
        broadcastevent \{ type = swap_paks_with_transition_finished }
        broadcastevent \{ type = swap_paks_for_bike_finished }
    endif
endscript

script anim_swap_loading 
    t = 10
    begin 
    DoMorph rot_angle = (180 * <t>)time = <t>
    repeat 
endscript

script anim_swap_cam 
    CinematicCamera_DoMorph \{LockTo = skater Pos = (140.10000610351562, 93.4000015258789, -68.19999694824219) Quat = (-0.07620500028133392, 0.5281100273132324, -0.04765700176358223) FOV = 72.0 time = 1 Block}
    CinematicCamera_DoMorph \{LockTo = skater Pos = (60.400001525878906, 93.4000015258789, 143.6999969482422) Quat = (-0.017774000763893127, 0.9762910008430481, -0.08810599893331528) FOV = 72.0 time = 7}
endscript

script anim_swap_cam_out 
    IGC_Camera_MoveToPlayer \{ time = 2 }
endscript
g_desired_average = 20
g_low_average_threshold = 0.9500
g_high_average_threshold = 1.500
g_forced_catch_up_average = 1.300

script setup_gs_idle_proc_params 
    SetGSIdleProcParams {
        desired_average = (g_desired_average)
        low_average_threshold = (g_low_average_threshold)
        high_average_threshold = (g_high_average_threshold)
        forced_catch_up_average = (g_forced_catch_up_average)
    }
endscript
