
script create_debug_menu 
    if ObjectExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    pause_menu_gradient Off
    make_new_roundbar_menu {
        menu_id = DEBUG_MENU
        vmenu_id = debug_vmenu
        menu_title = 'DEBUG'
        scrolling
        dims = (420.0, 380.0)
        padding_scale = 1
        Pos = (100.0, 20.0)
        internal_text_offset = (0.0, 0.0)
    }
    SetScreenElementProps {id = DEBUG_MENU
        event_handlers = [
            {pad_back generic_menu_pad_back params = { callback = create_debug_options_menu }}
        ]
    }
    add_roundbar_menu_item rot = 0 text = 'Dump Heaps' id = menu_dumpheaps pad_choose_script = debug_dumpheaps
    add_roundbar_menu_item rot = 0 text = 'Finish Pending Zone Loads' id = menu_zoneloads pad_choose_script = debug_pendingzone
    add_roundbar_menu_item rot = 0 text = 'Show Skater Pos' id = skaterpos pad_choose_script = show_skater_coords
    add_roundbar_menu_item rot = 0 text = 'Tweak Processor Params' id = processor pad_choose_script = debug_tweak_processor_params
    add_roundbar_menu_item rot = 0 text = 'Auto Rail Level' id = menu_autoraillevel pad_choose_script = autorail_level
    add_roundbar_menu_item rot = 0 text = 'Time Of Day' id = menu_timeofday pad_choose_script = launch_timeofday_menu
    add_roundbar_menu_item rot = 0 text = 'Lighting / FX Tool' id = menu_lighting pad_choose_script = debug_launch_global_light_fx_menu
    add_roundbar_menu_item rot = 0 text = 'Rail Display Toggle' pad_choose_script = toggle_rails
    add_roundbar_menu_item rot = 0 text = 'Bouncy Object Debug Display Toggle' pad_choose_script = toggle_rigidbody
    add_roundbar_menu_item rot = 0 text = 'Toggle Ped NavMesh Polys' id = navmesh_poly pad_choose_script = toggle_navmesh_polydraw
    add_roundbar_menu_item rot = 0 text = 'Toggle Ped NavMesh Lines' id = navmesh_lines pad_choose_script = toggle_navmesh_draw
    add_roundbar_menu_item rot = 0 text = 'Toggle Ped Debug Info' id = menu_peddebug pad_choose_script = toggle_ped_debug
    add_roundbar_menu_item rot = 0 text = 'Toggle Profiler' id = menu_profiler pad_choose_script = launch_toggle_profiler
    add_roundbar_menu_item rot = 0 text = 'Toggle FPS Display' id = menu_fps pad_choose_script = launch_toggle_fps
    add_roundbar_menu_item rot = 0 text = 'Toggle Anim Times' id = menu_anim_times pad_choose_script = launch_toggle_anim_times
    add_roundbar_menu_item rot = 0 text = 'Toggle Anim Cache State' id = menu_animcache_state pad_choose_script = launch_toggle_animcache_state pad_choose_params = { display_offset = (0.0, 50.0) }
    add_roundbar_menu_item rot = 0 text = 'Toggle Rigid Body Times' id = menu_rigid_body_times pad_choose_script = launch_toggle_rigid_body_times
    add_roundbar_menu_item rot = 0 text = 'Toggle Particle Times' id = menu_particle_times pad_choose_script = launch_toggle_particle_times
    add_roundbar_menu_item rot = 0 text = 'Toggle Particle Emit Dir Display' id = menu_emit pad_choose_script = launch_toggle_emit_dir
    add_roundbar_menu_item rot = 0 text = 'Toggle Model Scene Light Display' id = menu_light_model pad_choose_script = launch_toggle_lights pad_choose_params = { light_type = Model }
    add_roundbar_menu_item rot = 0 text = 'Toggle Geom Scene Light Display' id = menu_light_geom pad_choose_script = launch_toggle_lights pad_choose_params = { light_type = geom }
    add_roundbar_menu_item rot = 0 text = 'Toggle Active Scene Light Display' id = menu_light_active pad_choose_script = launch_toggle_lights pad_choose_params = { light_type = active }
    add_roundbar_menu_item rot = 0 text = 'Toggle Geom Stats' id = menu_geom_stats pad_choose_script = launch_toggle_geom_stats
    add_roundbar_menu_item rot = 0 text = 'Toggle Poly Count' id = menu_poly pad_choose_script = show_poly_count
    add_roundbar_menu_item rot = 0 text = 'Toggle Free Memory' id = menu_mem pad_choose_script = show_free_mem
    add_roundbar_menu_item rot = 0 text = 'Defrag Animation Cache' id = menu_defrag_anim pad_choose_script = show_defrag_anim_cache
    if cd
        add_roundbar_menu_item rot = 0 text = 'Start AutoTest' id = menu_start_autotest pad_choose_script = menu_start_autotest
        add_roundbar_menu_item rot = 0 text = 'Stop AutoTest' id = menu_stop_autotest pad_choose_script = menu_stop_autotest
    endif
    add_roundbar_menu_item rot = 0 text = 'Wireframe Toggle' pad_choose_script = toggle_wireframe
    add_roundbar_menu_item rot = 0 text = 'Wireframe Skins Toggle' pad_choose_script = toggle_wireframe_skins
    add_roundbar_menu_item rot = 0 text = 'Show Vert Polys' pad_choose_script = toggle_show_polys pad_choose_params = { showscript = show_vert }
    add_roundbar_menu_item rot = 0 text = 'Show Wallride Polys' pad_choose_script = toggle_show_polys pad_choose_params = { showscript = show_wallride }
    add_roundbar_menu_item rot = 0 text = 'Show Trigger Polys' pad_choose_script = toggle_show_polys pad_choose_params = { showscript = show_trigger }
    add_roundbar_menu_item rot = 0 text = 'Show Camera Polys' pad_choose_script = toggle_show_polys pad_choose_params = { showscript = show_camera_collide }
    add_roundbar_menu_item rot = 0 text = 'Show Not Skateable' pad_choose_script = toggle_show_polys pad_choose_params = { showscript = show_not_skatable }
    add_roundbar_menu_item rot = 0 text = 'CheckForHoles (Slow)' pad_choose_script = hole_check
    add_roundbar_menu_item rot = 0 text = 'Hide HUD' pad_choose_script = debug_menu_hide_hud
    add_roundbar_menu_item rot = 0 text = 'Done' id = menu_done pad_choose_script = create_debug_options_menu
    RunScriptOnScreenElement id = current_menu_anchor animate_in params = { final_pos = (320.0, 134.0) }
endscript

script debug_dumpheaps 
    DumpHeaps
endscript

script debug_pendingzone 
    FinishPendingZoneLoads
endscript

script debug_menu_hide_hud 
    UnPauseGame
    exit_pause_menu
    hide_root_window
endscript

script exit_test_menu 
    if (IsTrue UsePlayerPosForViewerObjPos)
        skater ::unhide
    endif
    create_debug_options_menu
endscript

script create_test_menu 
    if ObjectExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    pause_menu_gradient Off
    dialog_box_exit
    make_new_menu {
        menu_id = DEBUG_MENU
        vmenu_id = debug_vmenu
        menu_title = 'TEST'
        type = vscrollingmenu
        dims = (200.0, 350.0)
        padding_scale = 0.9500
        Pos = (543.0, 350.0)
    }
    SetScreenElementProps {id = DEBUG_MENU
        event_handlers = [
            { pad_back exit_test_menu }
        ]
    }
    make_text_sub_menu_item text = 'Toggle Memory Card Test' id = menu_memcard pad_choose_script = memcardtest_toggle
    make_text_sub_menu_item text = 'View Cars' id = menu_view_car_models pad_choose_script = launch_view_models_menu pad_choose_params = { model_set = car }
    make_text_sub_menu_item text = 'View Cutscenes' id = menu_view_cutscenes pad_choose_script = launch_view_cutscenes_menu
    make_text_sub_menu_item text = 'Set Pre-Made Skater' id = menu_set_premade_skater pad_choose_script = create_set_premade_skater_menu
    make_text_sub_menu_item text = 'dialog box' id = menu_dialog pad_choose_script = create_test_dialog
    make_text_sub_menu_item text = 'Scrolling Menu' id = menu_scroll pad_choose_script = test_scrolling_menu
    make_text_sub_menu_item text = 'Face Texture Test' id = menu_face_texture pad_choose_script = face_texture_test
    make_text_sub_menu_item text = 'View High Scores' id = menu_hs_displaye pad_choose_script = high_scores_menu_create pad_choose_params = { new_initials = 'ABC' }
    make_text_sub_menu_item text = 'Keyboard' pad_choose_script = launch_keyboard
    make_text_sub_menu_item text = 'Done' id = menu_done pad_choose_script = create_debug_options_menu
    RunScriptOnScreenElement id = current_menu_anchor animate_in params = { final_pos = (320.0, 134.0) }
endscript

script autorail_level 
    Autorail
endscript

script hole_check 
    checkforholes
    create_pause_menu
endscript

script launch_toggle_profiler 
    ToggleMetrics
    create_pause_menu
endscript

script launch_toggle_fps 
    ToggleFPS
    create_pause_menu
endscript

script launch_toggle_anim_times 
    ToggleAnimTimes
    create_pause_menu
endscript

script launch_toggle_rigid_body_times 
    ToggleRigidBodyTimes
    create_pause_menu
endscript

script launch_toggle_particle_times 
    ToggleParticleTimes
    create_pause_menu
endscript

script launch_toggle_emit_dir 
    ToggleDrawEmitDir
    create_pause_menu
endscript

script launch_toggle_lights 
    ToggleDrawLights <...> 
    create_pause_menu
endscript

script launch_toggle_geom_stats 
    ToggleGeomStats
    create_pause_menu
endscript

script toggle_rails 
    ToggleRails
    pulse_item
endscript

script toggle_rigidbody 
    ToggleRigidBodyDebug
    pulse_item
endscript

script toggle_wireframe 
    togglerendermode
    show_all
    pulse_item
endscript
toggled_geom_stats_on = 0

script ToggleGeomStats 
    if (toggled_geom_stats_on = 1)
        change toggled_geom_stats_on = 0
        KillSpawnedScript name = RefreshGeomStatsDisplay
        wait 0.2000 seconds
        if ObjectExists id = geom_stats_anchor
            DestroyScreenElement id = geom_stats_anchor
        endif
    else
        change toggled_geom_stats_on = 1
        SetScreenElementLock id = root_window Off
        if ObjectExists id = geom_stats_anchor
            DestroyScreenElement id = geom_stats_anchor
        endif
        CreateScreenElement {
            type = ContainerElement
            parent = root_window
            id = geom_stats_anchor
            Pos = (430.0, 80.0)
            just = [ center center ]
            internal_just = [ left center ]
        }
        CreateScreenElement {
            type = TextBlockElement
            parent = geom_stats_anchor
            id = geom_stats_text
            Pos = (0.0, -47.0)
            dims = (300.0, 100.0)
            allow_expansion
            text = 'blah'
            font = dialog
            rgba = [ 60 60 100 100 ]
            just = [ left center ]
            Scale = 0.7000
            line_spacing = 0.8000
        }
        SetScreenElementLock id = root_window on
        SpawnScriptLater RefreshGeomStatsDisplay
    endif
endscript

script RefreshGeomStatsDisplay interval = 0.1000
    begin 
    if ObjectExists id = geom_stats_anchor
        GetCurrentGeomStats
        FormatText {textname = gstat
            'Total=%a\nInactive=%b\nSky=%c\nTransformed=%d\nInstances=%%instance\nSkeletal=%e\nCameraSphere=%f\nClipCull=%g\nCulled=%h\nLeafCulled=%i\nBoxCheck=%j\nBocCheckCulled=%k\nOccludeCheck=%l\nOccludedObject=%m\nnOccludedLeaf=%%occluded_leaf\nColored=%n\nLeaf=%o\nMinLeaf=%p\nWibbleUV=%q\nWibbleVC=%r\nEnvMapped=%s\nSendContext=%t\nSorted=%u\nShadow=%v\nBillboard=%w\nFastParticles=%x\nFastParticleSys=%%fast_sys\nFlexParticles=%y\nFlexParticleSys=%z\nFlexParticlePrims=%_'
            a = <geom_stats_total>
            b = <geom_stats_inactive>
            c = <geom_stats_sky>
            d = <geom_stats_transformed>
            instance = <geom_stats_instance>
            e = <geom_stats_skeletal>
            f = <geom_stats_camera_sphere>
            g = <geom_stats_clipcull>
            h = <geom_stats_culled>
            i = <geom_stats_leaf_culled>
            j = <geom_stats_boxcheck>
            k = <geom_stats_boxcheck_culled>
            l = <geom_stats_occludecheck>
            m = <geom_stats_occluded_object>
            occluded_leaf = <geom_stats_occluded_leaf>
            n = <geom_stats_colored>
            o = <geom_stats_leaf>
            p = <geom_stats_minimal_leaf>
            q = <geom_stats_wibbleUV>
            r = <geom_stats_wibbleVC>
            s = <geom_stats_envmapped>
            t = <geom_stats_sendcontext>
            u = <geom_stats_sorted>
            v = <geom_stats_shadow>
            w = <geom_stats_billboard>
            x = <geom_stats_new_particles>
            fast_sys = <geom_stats_new_particle_systems>
            y = <geom_stats_old_particles>
            z = <geom_stats_old_particle_systems>
            _ = <geom_stats_old_particle_prims>
        }
        SetScreenElementProps id = geom_stats_text text = <gstat>
    else
        KillSpawnedScript id = RefreshGeomStatsDisplay
        change toggled_geom_stats_on = 0
    endif
    wait <interval> seconds
    repeat 
endscript
DrawEmitLines = 0

script ToggleDrawEmitDir 
    if (DrawEmitLines = 1)
        change \{ DrawEmitLines = 0 }
    else
        change \{ DrawEmitLines = 1 }
    endif
endscript
DrawModelLights = 0
DrawGeomLights = 0
DrawActiveLights = 0

script ToggleDrawLights 
    switch <light_type>
        case Model
        if ((DrawModelLights)= 1)
            change DrawModelLights = 0
            DestroyLightCountDisplay <...> 
        else
            change DrawModelLights = 1
            CreateLightCountDisplay <...> 
        endif
        case geom
        if ((DrawGeomLights)= 1)
            change DrawGeomLights = 0
            DestroyLightCountDisplay <...> 
        else
            change DrawGeomLights = 1
            CreateLightCountDisplay <...> 
        endif
        case active
        if ((DrawActiveLights)= 1)
            change DrawActiveLights = 0
            DestroyLightCountDisplay <...> 
        else
            change DrawActiveLights = 1
            CreateLightCountDisplay <...> 
        endif
    endswitch
endscript

script CreateLightCountDisplay 
    switch <light_type>
        case Model
        <root_id> = mlight_anchor
        <text_id> = mlight_text
        <text> = 'Model Lights'
        <Pos> = (400.0, 40.0)
        <rgba> = [ 255 255 0 255 ]
        case geom
        <root_id> = glight_anchor
        <text_id> = glight_text
        <text> = 'Geom Lights'
        <Pos> = (400.0, 55.0)
        <rgba> = [ 255 0 255 255 ]
        case active
        <root_id> = alight_anchor
        <text_id> = alight_text
        <text> = 'Active Lights'
        <Pos> = (400.0, 70.0)
        <rgba> = [ 255 0 0 255 ]
    endswitch
    SetScreenElementLock id = root_window Off
    CreateScreenElement {
        type = ContainerElement
        parent = root_window
        id = <root_id>
        Pos = <Pos>
        just = [ center center ]
        internal_just = [ left center ]
    }
    CreateScreenElement {
        type = TextElement
        parent = <root_id>
        id = <text_id>
        Pos = (0.0, 0.0)
        text = <text>
        font = dialog
        rgba = <rgba>
        just = [ left center ]
        Scale = 1.0
    }
    SetScreenElementLock id = root_window on
endscript

script modifylightcountdisplay 
    switch <light_type>
        case Model
        <text_id> = mlight_text
        FormatText textname = text 'Model Lights: %d/%e' e = <count> d = <active>
        case geom
        <text_id> = glight_text
        FormatText textname = text 'Geom Lights: %d/%e' e = <count> d = <active>
        case active
        <text_id> = alight_text
        FormatText textname = text 'Active Lights'
    endswitch
    if ObjectExists id = <text_id>
        SetScreenElementProps id = <text_id> text = <text>
    endif
endscript

script DestroyLightCountDisplay 
    switch <light_type>
        case Model
        <root_id> = mlight_anchor
        case geom
        <root_id> = glight_anchor
        case active
        <root_id> = alight_anchor
    endswitch
    if ObjectExists id = <root_id>
        DestroyScreenElement id = <root_id>
    endif
endscript
toggled_fps_on = 0
framerate_warning = 60.0

script ToggleFPS 
    if (toggled_fps_on = 1)
        change toggled_fps_on = 0
        KillSpawnedScript name = RefreshFPSDisplay
        wait 0.2000 seconds
        if ObjectExists id = fps_anchor
            DestroyScreenElement id = fps_anchor
        endif
    else
        change toggled_fps_on = 1
        SetScreenElementLock id = root_window Off
        if ObjectExists id = fps_anchor
            DestroyScreenElement id = fps_anchor
        endif
        CreateScreenElement {
            type = ContainerElement
            parent = root_window
            id = fps_anchor
            Pos = (30.0, 240.0)
            just = [ center center ]
            internal_just = [ left center ]
        }
        CreateScreenElement {
            type = TextElement
            parent = fps_anchor
            id = fps_text
            Pos = (0.0, -15.0)
            text = 'FPS'
            font = dialog
            rgba = [ 60 60 100 100 ]
            just = [ left center ]
            Scale = 1.0
        }
        SetScreenElementLock id = root_window on
        SpawnScriptLater RefreshFPSDisplay
    endif
endscript
toggled_anim_times_on = 0

script ToggleAnimTimes 
    if (toggled_anim_times_on = 1)
        change toggled_anim_times_on = 0
        KillSpawnedScript name = RefreshAnimTimesDisplay
        wait 0.2000 seconds
        if ObjectExists id = anim_times_anchor
            DestroyScreenElement id = anim_times_anchor
        endif
        change min_anim_boned_frame_pcnt_1 = 999.0
        change min_anim_boned_frame_pcnt_2 = 999.0
        change max_anim_boned_frame_pcnt_1 = 0.0
        change max_anim_boned_frame_pcnt_2 = 0.0
        change min_anim_channel_frame_pcnt_1 = 999.0
        change min_anim_channel_frame_pcnt_2 = 999.0
        change max_anim_channel_frame_pcnt_1 = 0.0
        change max_anim_channel_frame_pcnt_2 = 0.0
        change min_anim_subset_frame_pcnt_1 = 999.0
        change min_anim_subset_frame_pcnt_2 = 999.0
        change max_anim_subset_frame_pcnt_1 = 0.0
        change max_anim_subset_frame_pcnt_2 = 0.0
    else
        change toggled_anim_times_on = 1
        SetScreenElementLock id = root_window Off
        if ObjectExists id = anim_times_anchor
            DestroyScreenElement id = anim_times_anchor
        endif
        CreateScreenElement {
            type = ContainerElement
            parent = root_window
            id = anim_times_anchor
            Pos = (30.0, 180.0)
            just = [ center center ]
            internal_just = [ left center ]
        }
        CreateScreenElement {
            type = TextElement
            parent = anim_times_anchor
            id = anim_times_text
            Pos = (0.0, -75.0)
            text = 'Animation Blending (pcnt/frame):'
            font = dialog
            rgba = [ 0 60 100 100 ]
            just = [ left center ]
            Scale = 0.8000
        }
        CreateScreenElement {
            type = TextElement
            parent = anim_times_anchor
            id = anim_times_p_text
            Pos = (0.0, -60.0)
            text = 'Primary (hero+horse):'
            font = dialog
            rgba = [ 60 0 100 100 ]
            just = [ left center ]
            Scale = 0.8000
        }
        CreateScreenElement {
            type = TextElement
            parent = anim_times_anchor
            id = anim_times_boned_text
            Pos = (0.0, -45.0)
            text = 'Boned Frames'
            font = dialog
            rgba = [ 60 60 100 100 ]
            just = [ left center ]
            Scale = 0.8000
        }
        CreateScreenElement {
            type = TextElement
            parent = anim_times_anchor
            id = anim_times_channel_text
            Pos = (0.0, -30.0)
            text = 'Channels'
            font = dialog
            rgba = [ 60 60 100 100 ]
            just = [ left center ]
            Scale = 0.8000
        }
        CreateScreenElement {
            type = TextElement
            parent = anim_times_anchor
            id = anim_times_subset_text
            Pos = (0.0, -15.0)
            text = 'Subset'
            font = dialog
            rgba = [ 60 60 100 100 ]
            just = [ left center ]
            Scale = 0.8000
        }
        CreateScreenElement {
            type = TextElement
            parent = anim_times_anchor
            id = anim_times_total_text
            Pos = (0.0, 0.0)
            text = 'Total'
            font = dialog
            rgba = [ 60 60 100 100 ]
            just = [ left center ]
            Scale = 0.8000
        }
        CreateScreenElement {
            type = TextElement
            parent = anim_times_anchor
            id = anim_times_break_text
            Pos = (0.0, 15.0)
            text = '--------------------------'
            font = dialog
            rgba = [ 60 60 100 100 ]
            just = [ left center ]
            Scale = 0.8000
        }
        CreateScreenElement {
            type = TextElement
            parent = anim_times_anchor
            id = anim_times_s_text
            Pos = (0.0, 30.0)
            text = 'Secondary (peds):'
            font = dialog
            rgba = [ 60 0 100 100 ]
            just = [ left center ]
            Scale = 0.8000
        }
        CreateScreenElement {
            type = TextElement
            parent = anim_times_anchor
            id = anim_times_boned_text_2
            Pos = (0.0, 45.0)
            text = 'Boned Frames'
            font = dialog
            rgba = [ 60 60 100 100 ]
            just = [ left center ]
            Scale = 0.8000
        }
        CreateScreenElement {
            type = TextElement
            parent = anim_times_anchor
            id = anim_times_channel_text_2
            Pos = (0.0, 60.0)
            text = 'Channels'
            font = dialog
            rgba = [ 60 60 100 100 ]
            just = [ left center ]
            Scale = 0.8000
        }
        CreateScreenElement {
            type = TextElement
            parent = anim_times_anchor
            id = anim_times_subset_text_2
            Pos = (0.0, 75.0)
            text = 'Subset'
            font = dialog
            rgba = [ 60 60 100 100 ]
            just = [ left center ]
            Scale = 0.8000
        }
        CreateScreenElement {
            type = TextElement
            parent = anim_times_anchor
            id = anim_times_total_text_2
            Pos = (0.0, 90.0)
            text = 'Total'
            font = dialog
            rgba = [ 60 60 100 100 ]
            just = [ left center ]
            Scale = 0.8000
        }
        SetScreenElementLock id = root_window on
        SpawnScriptLater RefreshAnimTimesDisplay
    endif
endscript
min_anim_boned_frame_pcnt_1 = 999.0
min_anim_boned_frame_pcnt_2 = 999.0
max_anim_boned_frame_pcnt_1 = 0.0
max_anim_boned_frame_pcnt_2 = 0.0
min_anim_channel_frame_pcnt_1 = 999.0
min_anim_channel_frame_pcnt_2 = 999.0
max_anim_channel_frame_pcnt_1 = 0.0
max_anim_channel_frame_pcnt_2 = 0.0
min_anim_subset_frame_pcnt_1 = 999.0
min_anim_subset_frame_pcnt_2 = 999.0
max_anim_subset_frame_pcnt_1 = 0.0
max_anim_subset_frame_pcnt_2 = 0.0

script RefreshAnimTimesDisplay 
    begin 
    if ObjectExists id = anim_times_anchor
        GetCurrentAnimTimes
        if (<primary_boned_time> > (max_anim_boned_frame_pcnt_1))
            if (<primary_boned_time> < 100.0)
                change max_anim_boned_frame_pcnt_1 = <primary_boned_time>
            endif
        else
            if (<primary_boned_time> < (min_anim_boned_frame_pcnt_1))
                change min_anim_boned_frame_pcnt_1 = <primary_boned_time>
            endif
        endif
        if (<secondary_boned_time> > (max_anim_boned_frame_pcnt_2))
            if (<secondary_boned_time> < 100.0)
                change max_anim_boned_frame_pcnt_2 = <secondary_boned_time>
            endif
        else
            if (<secondary_boned_time> < (min_anim_boned_frame_pcnt_2))
                change min_anim_boned_frame_pcnt_2 = <secondary_boned_time>
            endif
        endif
        if (<primary_channel_time> > (max_anim_channel_frame_pcnt_1))
            if (<primary_channel_time> < 100.0)
                change max_anim_channel_frame_pcnt_1 = <primary_channel_time>
            endif
        else
            if (<primary_channel_time> < (min_anim_channel_frame_pcnt_1))
                change min_anim_channel_frame_pcnt_1 = <primary_channel_time>
            endif
        endif
        if (<secondary_channel_time> > (max_anim_channel_frame_pcnt_2))
            if (<secondary_channel_time> < 100.0)
                change max_anim_channel_frame_pcnt_2 = <secondary_channel_time>
            endif
        else
            if (<secondary_channel_time> < (min_anim_channel_frame_pcnt_2))
                change min_anim_channel_frame_pcnt_2 = <secondary_channel_time>
            endif
        endif
        if (<primary_subset_time> > (max_anim_subset_frame_pcnt_1))
            if (<primary_subset_time> < 100.0)
                change max_anim_subset_frame_pcnt_1 = <primary_subset_time>
            endif
        else
            if (<primary_subset_time> < (min_anim_subset_frame_pcnt_1))
                change min_anim_subset_frame_pcnt_1 = <primary_subset_time>
            endif
        endif
        if (<secondary_subset_time> > (max_anim_subset_frame_pcnt_2))
            if (<secondary_subset_time> < 100.0)
                change max_anim_subset_frame_pcnt_2 = <secondary_subset_time>
            endif
        else
            if (<secondary_subset_time> < (min_anim_subset_frame_pcnt_2))
                change min_anim_subset_frame_pcnt_2 = <secondary_subset_time>
            endif
        endif
        FormatText textname = test1 'Boned: \c5%d \c0(\c4%e, \c2%f\c0)' d = <primary_boned_time> e = (min_anim_boned_frame_pcnt_1)f = (max_anim_boned_frame_pcnt_1)
        SetScreenElementProps id = anim_times_boned_text text = <test1>
        FormatText textname = test2 'Channel: \c5%d \c0(\c4%e, \c2%f\c0)' d = <primary_channel_time> e = (min_anim_channel_frame_pcnt_1)f = (max_anim_channel_frame_pcnt_1)
        SetScreenElementProps id = anim_times_channel_text text = <test2>
        FormatText textname = test3 'Subset: \c5%d \c0(\c4%e, \c2%f\c0)' d = <primary_subset_time> e = (min_anim_subset_frame_pcnt_1)f = (max_anim_subset_frame_pcnt_1)
        SetScreenElementProps id = anim_times_subset_text text = <test3>
        FormatText {
            textname = Test4 'Total: \c5%d \c0(\c4%e, \c2%f\c0)'
            d = (<primary_boned_time> + <primary_channel_time> + <primary_subset_time>)
            e = ((min_anim_boned_frame_pcnt_1)+ (min_anim_channel_frame_pcnt_1)+ (min_anim_subset_frame_pcnt_1))
            f = ((max_anim_boned_frame_pcnt_1)+ (max_anim_channel_frame_pcnt_1)+ (max_anim_subset_frame_pcnt_1))
        }
        SetScreenElementProps id = anim_times_total_text text = <Test4>
        FormatText textname = Test5 'Boned: \c5%d \c0(\c4%e, \c2%f\c0)' d = <secondary_boned_time> e = (min_anim_boned_frame_pcnt_2)f = (max_anim_boned_frame_pcnt_2)
        SetScreenElementProps id = anim_times_boned_text_2 text = <Test5>
        FormatText textname = Test6 'Channel: \c5%d \c0(\c4%e, \c2%f\c0)' d = <secondary_channel_time> e = (min_anim_channel_frame_pcnt_2)f = (max_anim_channel_frame_pcnt_2)
        SetScreenElementProps id = anim_times_channel_text_2 text = <Test6>
        FormatText textname = Test7 'Subset: \c5%d \c0(\c4%e, \c2%f\c0)' d = <secondary_subset_time> e = (min_anim_subset_frame_pcnt_2)f = (max_anim_subset_frame_pcnt_2)
        SetScreenElementProps id = anim_times_subset_text_2 text = <Test7>
        FormatText {
            textname = Test8 'Total: \c5%d \c0(\c4%e, \c2%f\c0)'
            d = (<secondary_boned_time> + <secondary_channel_time> + <secondary_subset_time>)
            e = ((min_anim_boned_frame_pcnt_2)+ (min_anim_channel_frame_pcnt_2)+ (min_anim_subset_frame_pcnt_2))
            f = ((max_anim_boned_frame_pcnt_2)+ (max_anim_channel_frame_pcnt_2)+ (max_anim_subset_frame_pcnt_2))
        }
        SetScreenElementProps id = anim_times_total_text_2 text = <Test8>
    else
        KillSpawnedScript id = RefreshAnimTimesDisplay
        change toggled_anim_times_on = 0
    endif
    wait <interval> seconds
    repeat 
endscript
toggled_particle_times_on = 0

script ToggleParticleTimes 
    if (toggled_particle_times_on = 1)
        change toggled_particle_times_on = 0
        KillSpawnedScript name = RefreshParticleTimesDisplay
        wait 0.2000 seconds
        if ObjectExists id = particle_times_anchor
            DestroyScreenElement id = particle_times_anchor
        endif
        if ObjectExists id = new_particle_times_anchor
            DestroyScreenElement id = new_particle_times_anchor
        endif
        change min_particle_process_frame_pcnt = 999.0
        change max_particle_process_frame_pcnt = 0.0
        change min_particle_render_frame_pcnt = 999.0
        change max_particle_render_frame_pcnt = 0.0
        change min_particle_sys_count = 99999
        change max_particle_sys_count = 0
        change min_particle_num_count = 99999
        change max_particle_num_count = 0
        change min_particle_prim_count = 99999
        change max_particle_prim_count = 0
        change min_new_particle_process_frame_pcnt = 999.0
        change max_new_particle_process_frame_pcnt = 0.0
        change min_new_particle_render_frame_pcnt = 999.0
        change max_new_particle_render_frame_pcnt = 0.0
        change min_new_particle_sys_count = 99999
        change max_new_particle_sys_count = 0
        change min_new_particle_num_count = 99999
        change max_new_particle_num_count = 0
    else
        change toggled_particle_times_on = 1
        SetScreenElementLock id = root_window Off
        if ObjectExists id = particle_times_anchor
            DestroyScreenElement id = particle_times_anchor
        endif
        if ObjectExists id = new_particle_times_anchor
            DestroyScreenElement id = new_particle_times_anchor
        endif
        CreateScreenElement {
            type = ContainerElement
            parent = root_window
            id = particle_times_anchor
            Pos = (30.0, 150.0)
            just = [ center center ]
            internal_just = [ left center ]
        }
        CreateScreenElement {
            type = TextElement
            parent = particle_times_anchor
            id = particle_times_text
            Pos = (0.0, -60.0)
            text = 'Flexible Particles (pcnt/frame):'
            font = dialog
            rgba = [ 60 60 100 100 ]
            just = [ left center ]
            Scale = 0.8000
        }
        CreateScreenElement {
            type = TextElement
            parent = particle_times_anchor
            id = particle_times_process_text
            Pos = (0.0, -45.0)
            text = 'Process'
            font = dialog
            rgba = [ 60 60 100 100 ]
            just = [ left center ]
            Scale = 0.8000
        }
        CreateScreenElement {
            type = TextElement
            parent = particle_times_anchor
            id = particle_times_render_text
            Pos = (0.0, -30.0)
            text = 'Render'
            font = dialog
            rgba = [ 60 60 100 100 ]
            just = [ left center ]
            Scale = 0.8000
        }
        CreateScreenElement {
            type = TextElement
            parent = particle_times_anchor
            id = particle_times_total_text
            Pos = (0.0, -15.0)
            text = 'Total'
            font = dialog
            rgba = [ 60 60 100 100 ]
            just = [ left center ]
            Scale = 0.8000
        }
        CreateScreenElement {
            type = TextElement
            parent = particle_times_anchor
            id = particle_times_break_text
            Pos = (0.0, 0.0)
            text = '--------------------------'
            font = dialog
            rgba = [ 60 60 100 100 ]
            just = [ left center ]
            Scale = 0.8000
        }
        CreateScreenElement {
            type = TextElement
            parent = particle_times_anchor
            id = particle_times_sys_text
            Pos = (0.0, 15.0)
            text = 'ParticleSys'
            font = dialog
            rgba = [ 60 60 100 100 ]
            just = [ left center ]
            Scale = 0.8000
        }
        CreateScreenElement {
            type = TextElement
            parent = particle_times_anchor
            id = particle_times_num_text
            Pos = (0.0, 30.0)
            text = 'ParticleNum'
            font = dialog
            rgba = [ 60 60 100 100 ]
            just = [ left center ]
            Scale = 0.8000
        }
        CreateScreenElement {
            type = TextElement
            parent = particle_times_anchor
            id = particle_times_prims_text
            Pos = (0.0, 45.0)
            text = 'ParticlePrims'
            font = dialog
            rgba = [ 60 60 100 100 ]
            just = [ left center ]
            Scale = 0.8000
        }
        CreateScreenElement {
            type = ContainerElement
            parent = root_window
            id = new_particle_times_anchor
            Pos = (30.0, 280.0)
            just = [ center center ]
            internal_just = [ left center ]
        }
        CreateScreenElement {
            type = TextElement
            parent = new_particle_times_anchor
            id = new_particle_times_text
            Pos = (0.0, -60.0)
            text = 'Fast Particles (pcnt/frame):'
            font = dialog
            rgba = [ 60 100 60 100 ]
            just = [ left center ]
            Scale = 0.8000
        }
        CreateScreenElement {
            type = TextElement
            parent = new_particle_times_anchor
            id = new_particle_times_process_text
            Pos = (0.0, -45.0)
            text = 'Process'
            font = dialog
            rgba = [ 60 100 60 100 ]
            just = [ left center ]
            Scale = 0.8000
        }
        CreateScreenElement {
            type = TextElement
            parent = new_particle_times_anchor
            id = new_particle_times_render_text
            Pos = (0.0, -30.0)
            text = 'Render'
            font = dialog
            rgba = [ 60 100 60 100 ]
            just = [ left center ]
            Scale = 0.8000
        }
        CreateScreenElement {
            type = TextElement
            parent = new_particle_times_anchor
            id = new_particle_times_total_text
            Pos = (0.0, -15.0)
            text = 'Total'
            font = dialog
            rgba = [ 60 100 60 100 ]
            just = [ left center ]
            Scale = 0.8000
        }
        CreateScreenElement {
            type = TextElement
            parent = new_particle_times_anchor
            id = new_particle_times_break_text
            Pos = (0.0, 0.0)
            text = '--------------------------'
            font = dialog
            rgba = [ 60 100 60 1000 ]
            just = [ left center ]
            Scale = 0.8000
        }
        CreateScreenElement {
            type = TextElement
            parent = new_particle_times_anchor
            id = new_particle_times_sys_text
            Pos = (0.0, 15.0)
            text = 'ParticleSys'
            font = dialog
            rgba = [ 60 100 60 100 ]
            just = [ left center ]
            Scale = 0.8000
        }
        CreateScreenElement {
            type = TextElement
            parent = new_particle_times_anchor
            id = new_particle_times_num_text
            Pos = (0.0, 30.0)
            text = 'ParticleNum'
            font = dialog
            rgba = [ 60 100 60 100 ]
            just = [ left center ]
            Scale = 0.8000
        }
        SetScreenElementLock id = root_window on
        SpawnScriptLater RefreshParticleTimesDisplay
    endif
endscript
toggled_rigid_body_times_on = 0

script ToggleRigidBodyTimes 
    if (toggled_rigid_body_times_on = 1)
        change toggled_rigid_body_times_on = 0
        KillSpawnedScript name = RefreshRigidBodyTimesDisplay
        wait 0.2000 seconds
        if ObjectExists id = rigid_body_times_anchor
            DestroyScreenElement id = rigid_body_times_anchor
        endif
        if ObjectExists id = new_rigid_body_times_anchor
            DestroyScreenElement id = new_rigid_body_times_anchor
        endif
        change min_rigid_body_update_time_frame_pcnt = 999.0
        change max_rigid_body_update_time_frame_pcnt = 0.0
        change min_num_rigid_bodies = 99999
        change max_num_rigid_bodies = 0
        change min_num_active_rigid_bodies = 99999
        change max_num_active_rigid_bodies = 0
    else
        change toggled_rigid_body_times_on = 1
        SetScreenElementLock id = root_window Off
        if ObjectExists id = rigid_body_times_anchor
            DestroyScreenElement id = rigid_body_times_anchor
        endif
        if ObjectExists id = new_rigid_body_times_anchor
            DestroyScreenElement id = new_rigid_body_times_anchor
        endif
        CreateScreenElement {
            type = ContainerElement
            parent = root_window
            id = rigid_body_times_anchor
            Pos = (30.0, 120.0)
            just = [ center center ]
            internal_just = [ left center ]
        }
        CreateScreenElement {
            type = TextElement
            parent = rigid_body_times_anchor
            id = rigid_body_times_text
            Pos = (0.0, -60.0)
            text = 'Rigid Bodies:'
            font = dialog
            rgba = [ 60 60 100 100 ]
            just = [ left center ]
            Scale = 0.8000
        }
        CreateScreenElement {
            type = TextElement
            parent = rigid_body_times_anchor
            id = rigid_body_update_time_text
            Pos = (0.0, -45.0)
            text = 'Update'
            font = dialog
            rgba = [ 60 60 100 100 ]
            just = [ left center ]
            Scale = 0.8000
        }
        CreateScreenElement {
            type = TextElement
            parent = rigid_body_times_anchor
            id = rigid_body_count_break_text
            Pos = (0.0, -30.0)
            text = '--------------------------'
            font = dialog
            rgba = [ 60 60 100 100 ]
            just = [ left center ]
            Scale = 0.8000
        }
        CreateScreenElement {
            type = TextElement
            parent = rigid_body_times_anchor
            id = rigid_body_heading_text
            Pos = (0.0, -15.0)
            text = '(Full Count)'
            font = dialog
            rgba = [ 60 60 100 100 ]
            just = [ left center ]
            Scale = 0.8000
        }
        CreateScreenElement {
            type = TextElement
            parent = rigid_body_times_anchor
            id = rigid_body_active_num_text
            Pos = (0.0, 0.0)
            text = 'Total Rigid Bodies'
            font = dialog
            rgba = [ 60 60 100 100 ]
            just = [ left center ]
            Scale = 0.8000
        }
        CreateScreenElement {
            type = TextElement
            parent = rigid_body_times_anchor
            id = rigid_body_num_text
            Pos = (0.0, 15.0)
            text = 'Active Rigid Bodies'
            font = dialog
            rgba = [ 60 60 100 100 ]
            just = [ left center ]
            Scale = 0.8000
        }
        CreateScreenElement {
            type = TextElement
            parent = rigid_body_times_anchor
            id = rigid_body_node_break_text
            Pos = (0.0, 30.0)
            text = '--------------------------'
            font = dialog
            rgba = [ 60 60 100 100 ]
            just = [ left center ]
            Scale = 0.8000
        }
        CreateScreenElement {
            type = TextElement
            parent = rigid_body_times_anchor
            id = rigid_body_node_heading_text
            Pos = (0.0, 45.0)
            text = '(Node Array Only)'
            font = dialog
            rgba = [ 60 60 100 100 ]
            just = [ left center ]
            Scale = 0.8000
        }
        CreateScreenElement {
            type = TextElement
            parent = rigid_body_times_anchor
            id = rigid_body_num_node_active_text
            Pos = (0.0, 60.0)
            text = 'Active Rigid Bodies (node array only)'
            font = dialog
            rgba = [ 60 60 100 100 ]
            just = [ left center ]
            Scale = 0.8000
        }
        CreateScreenElement {
            type = TextElement
            parent = rigid_body_times_anchor
            id = rigid_body_num_node_text
            Pos = (0.0, 75.0)
            text = 'Total Rigid Bodies (node array only)'
            font = dialog
            rgba = [ 60 60 100 100 ]
            just = [ left center ]
            Scale = 0.8000
        }
        CreateScreenElement {
            type = TextElement
            parent = rigid_body_times_anchor
            id = rigid_body_memory_text
            Pos = (0.0, 90.0)
            text = 'Memory (node array only)'
            font = dialog
            rgba = [ 60 60 100 100 ]
            just = [ left center ]
            Scale = 0.8000
        }
        SetScreenElementLock id = root_window on
        SpawnScriptLater RefreshRigidBodyTimesDisplay
    endif
endscript
min_rigid_body_update_time_frame_pcnt = 999.0
max_rigid_body_update_time_frame_pcnt = 0.0
min_num_rigid_bodies = 99999
max_num_rigid_bodies = 0
min_num_active_rigid_bodies = 99999
max_num_active_rigid_bodies = 0
min_num_node_rigid_bodies = 99999
max_num_node_rigid_bodies = 0
min_num_node_active_rigid_bodies = 99999
max_num_node_active_rigid_bodies = 0
min_memory_rigid_bodies = 99999
max_memory_rigid_bodies = 0

script RefreshRigidBodyTimesDisplay 
    begin 
    if ObjectExists id = rigid_body_times_anchor
        GetRigidBodyDebugData
        if (<update_time_frame_pcnt> > max_rigid_body_update_time_frame_pcnt)
            if (<update_time_frame_pcnt> < 100.0)
                change max_rigid_body_update_time_frame_pcnt = <update_time_frame_pcnt>
            endif
        else
            if (<update_time_frame_pcnt> < min_rigid_body_update_time_frame_pcnt)
                change min_rigid_body_update_time_frame_pcnt = <update_time_frame_pcnt>
            endif
        endif
        if (<num_rigid_bodies> > max_num_rigid_bodies)
            change max_num_rigid_bodies = <num_rigid_bodies>
        else
            if (<num_rigid_bodies> < min_num_rigid_bodies)
                change min_num_rigid_bodies = <num_rigid_bodies>
            endif
        endif
        if (<num_active_rigid_bodies> > max_num_active_rigid_bodies)
            change max_num_active_rigid_bodies = <num_active_rigid_bodies>
        else
            if (<num_active_rigid_bodies> < min_num_active_rigid_bodies)
                change min_num_active_rigid_bodies = <num_active_rigid_bodies>
            endif
        endif
        if (<num_node_rigid_bodies> > max_num_node_rigid_bodies)
            change max_num_node_rigid_bodies = <num_node_rigid_bodies>
        else
            if (<num_node_rigid_bodies> < min_num_node_rigid_bodies)
                change min_num_node_rigid_bodies = <num_node_rigid_bodies>
            endif
        endif
        if (<num_node_active_rigid_bodies> > max_num_node_active_rigid_bodies)
            change max_num_node_active_rigid_bodies = <num_node_active_rigid_bodies>
        else
            if (<num_node_active_rigid_bodies> < min_num_node_active_rigid_bodies)
                change min_num_node_active_rigid_bodies = <num_node_active_rigid_bodies>
            endif
        endif
        if (<memory_usage> > max_memory_rigid_bodies)
            change max_memory_rigid_bodies = <memory_usage>
        else
            if (<memory_usage> < min_memory_rigid_bodies)
                change min_memory_rigid_bodies = <memory_usage>
            endif
        endif
        FormatText textname = test 'Update (pcnt/frame): \c5%d \c0(\c4%e, \c2%f\c0)' d = <update_time_frame_pcnt> e = (min_rigid_body_update_time_frame_pcnt)f = (max_rigid_body_update_time_frame_pcnt)
        SetScreenElementProps id = rigid_body_update_time_text text = <test>
        FormatText textname = test 'Total Rigid Bodies: \c5%d \c0(\c4%e, \c2%f\c0)' d = <num_rigid_bodies> e = (min_num_rigid_bodies)f = (max_num_rigid_bodies)
        SetScreenElementProps id = rigid_body_num_text text = <test>
        FormatText textname = test 'Active Rigid Bodies: \c5%d \c0(\c4%e, \c2%f\c0)' d = <num_active_rigid_bodies> e = (min_num_active_rigid_bodies)f = (max_num_active_rigid_bodies)
        SetScreenElementProps id = rigid_body_active_num_text text = <test>
        FormatText textname = test 'Total Rigid Bodies: \c5%d \c0(\c4%e, \c2%f\c0)' d = <num_node_rigid_bodies> e = (min_num_node_rigid_bodies)f = (max_num_node_rigid_bodies)
        SetScreenElementProps id = rigid_body_num_node_text text = <test>
        FormatText textname = test 'Active Rigid Bodies: \c5%d \c0(\c4%e, \c2%f\c0)' d = <num_node_active_rigid_bodies> e = (min_num_node_active_rigid_bodies)f = (max_num_node_active_rigid_bodies)
        SetScreenElementProps id = rigid_body_num_node_active_text text = <test>
        FormatText textname = test 'Memory: \c5%d K \c0(\c4%e K, \c2%f K\c0)' d = <memory_usage> e = (min_memory_rigid_bodies)f = (max_memory_rigid_bodies)
        SetScreenElementProps id = rigid_body_memory_text text = <test>
    else
        KillSpawnedScript id = RefreshRigidBodyTimesDisplay
        change toggled_rigid_body_times_on = 0
    endif
    wait <interval> seconds
    repeat 
endscript

script FlexParticleWarning 
    SetScreenElementLock id = root_window Off
    if ObjectExists id = particle_warn_anchor
        DestroyScreenElement id = particle_warn_anchor
    endif
    CreateScreenElement {
        type = ContainerElement
        parent = root_window
        id = particle_warn_anchor
        Pos = (25.0, 80.0)
        just = [ center center ]
        internal_just = [ left center ]
    }
    CreateScreenElement {
        type = TextElement
        parent = particle_warn_anchor
        id = particle_warn_text
        Pos = (0.0, 0.0)
        text = 'Particle failed: Too many at once'
        font = dialog
        rgba = [ 255 0 0 255 ]
        just = [ left top ]
    }
    SetScreenElementLock id = root_window on
    wait 2 seconds
    if ObjectExists id = particle_warn_anchor
        DestroyScreenElement id = particle_warn_anchor
    endif
endscript

script RefreshFPSDisplay interval = 0.1000
    begin 
    if ObjectExists id = fps_anchor
        FormatText textname = fps 'FPS: %d' d = (framerate_value)
        SetScreenElementProps id = fps_text text = <fps>
        if ((framerate_value)< framerate_warning)
            SetScreenElementProps id = fps_text rgba = [ 255 0 0 255 ]
        else
            SetScreenElementProps id = fps_text rgba = [ 0 255 0 100 ]
        endif
    else
        KillSpawnedScript id = RefreshFPSDisplay
        change toggled_fps_on = 0
    endif
    wait <interval> seconds
    repeat 
endscript
min_particle_process_frame_pcnt = 999.0
max_particle_process_frame_pcnt = 0.0
min_particle_render_frame_pcnt = 999.0
max_particle_render_frame_pcnt = 0.0
min_particle_sys_count = 99999
max_particle_sys_count = 0
min_particle_num_count = 99999
max_particle_num_count = 0
min_particle_prim_count = 99999
max_particle_prim_count = 0
min_new_particle_process_frame_pcnt = 999.0
max_new_particle_process_frame_pcnt = 0.0
min_new_particle_render_frame_pcnt = 999.0
max_new_particle_render_frame_pcnt = 0.0
min_new_particle_sys_count = 99999
max_new_particle_sys_count = 0
min_new_particle_num_count = 99999
max_new_particle_num_count = 0

script RefreshParticleTimesDisplay 
    begin 
    if ObjectExists id = particle_times_anchor
        GetCurrentParticleTimes
        if (<particle_process_frame_pcnt> > (max_particle_process_frame_pcnt))
            if (<particle_process_frame_pcnt> < 100.0)
                change max_particle_process_frame_pcnt = <particle_process_frame_pcnt>
            endif
        else
            if (<particle_process_frame_pcnt> < (min_particle_process_frame_pcnt))
                change min_particle_process_frame_pcnt = <particle_process_frame_pcnt>
            endif
        endif
        if (<particle_render_frame_pcnt> > (max_particle_render_frame_pcnt))
            if (<particle_render_frame_pcnt> < 100.0)
                change max_particle_render_frame_pcnt = <particle_render_frame_pcnt>
            endif
        else
            if (<particle_render_frame_pcnt> < (min_particle_render_frame_pcnt))
                change min_particle_render_frame_pcnt = <particle_render_frame_pcnt>
            endif
        endif
        if (<geom_stats_old_particle_systems> > (max_particle_sys_count))
            change max_particle_sys_count = <geom_stats_old_particle_systems>
        else
            if (<geom_stats_old_particle_systems> < (min_particle_sys_count))
                change min_particle_sys_count = <geom_stats_old_particle_systems>
            endif
        endif
        if (<geom_stats_old_particles> > (max_particle_num_count))
            change max_particle_num_count = <geom_stats_old_particles>
        else
            if (<geom_stats_old_particles> < (min_particle_num_count))
                change min_particle_num_count = <geom_stats_old_particles>
            endif
        endif
        if (<geom_stats_old_particle_prims> > (max_particle_prim_count))
            change max_particle_prim_count = <geom_stats_old_particle_prims>
        else
            if (<geom_stats_old_particle_prims> < (min_particle_prim_count))
                change min_particle_prim_count = <geom_stats_old_particle_prims>
            endif
        endif
        FormatText textname = test1 'Process: \c5%d \c0(\c4%e, \c2%f\c0)' d = <particle_process_frame_pcnt> e = (min_particle_process_frame_pcnt)f = (max_particle_process_frame_pcnt)
        SetScreenElementProps id = particle_times_process_text text = <test1>
        FormatText textname = test2 'Render: \c5%d \c0(\c4%e, \c2%f\c0)' d = <particle_render_frame_pcnt> e = (min_particle_render_frame_pcnt)f = (max_particle_render_frame_pcnt)
        SetScreenElementProps id = particle_times_render_text text = <test2>
        FormatText textname = test3 'Total: \c5%d \c0(\c4%e, \c2%f\c0)' d = (<particle_process_frame_pcnt> + <particle_render_frame_pcnt>)e = ((min_particle_process_frame_pcnt)+ (min_particle_render_frame_pcnt))f = ((max_particle_process_frame_pcnt)+ (max_particle_render_frame_pcnt))
        SetScreenElementProps id = particle_times_total_text text = <test3>
        FormatText textname = Test4 'Particle Systems: \c5%d \c0(\c4%e, \c2%f\c0)' d = <geom_stats_old_particle_systems> e = (min_particle_sys_count)f = (max_particle_sys_count)
        SetScreenElementProps id = particle_times_sys_text text = <Test4>
        FormatText textname = Test5 'Particle Count: \c5%d \c0(\c4%e, \c2%f\c0)' d = <geom_stats_old_particles> e = (min_particle_num_count)f = (max_particle_num_count)
        SetScreenElementProps id = particle_times_num_text text = <Test5>
        FormatText textname = Test6 'Particle Primitives: \c5%d \c0(\c4%e, \c2%f\c0)' d = <geom_stats_old_particle_prims> e = (min_particle_prim_count)f = (max_particle_prim_count)
        SetScreenElementProps id = particle_times_prims_text text = <Test6>
        if (<new_particle_process_frame_pcnt> > (max_new_particle_process_frame_pcnt))
            if (<new_particle_process_frame_pcnt> < 100.0)
                change max_new_particle_process_frame_pcnt = <new_particle_process_frame_pcnt>
            endif
        else
            if (<new_particle_process_frame_pcnt> < (min_new_particle_process_frame_pcnt))
                change min_new_particle_process_frame_pcnt = <new_particle_process_frame_pcnt>
            endif
        endif
        if (<new_particle_render_frame_pcnt> > (max_new_particle_render_frame_pcnt))
            if (<new_particle_render_frame_pcnt> < 100.0)
                change max_new_particle_render_frame_pcnt = <new_particle_render_frame_pcnt>
            endif
        else
            if (<new_particle_render_frame_pcnt> < (min_new_particle_render_frame_pcnt))
                change min_new_particle_render_frame_pcnt = <new_particle_render_frame_pcnt>
            endif
        endif
        if (<geom_stats_new_particle_systems> > (max_new_particle_sys_count))
            change max_new_particle_sys_count = <geom_stats_new_particle_systems>
        else
            if (<geom_stats_new_particle_systems> < (min_new_particle_sys_count))
                change min_new_particle_sys_count = <geom_stats_new_particle_systems>
            endif
        endif
        if (<geom_stats_new_particles> > (max_new_particle_num_count))
            change max_new_particle_num_count = <geom_stats_new_particles>
        else
            if (<geom_stats_new_particles> < (min_new_particle_num_count))
                change min_new_particle_num_count = <geom_stats_new_particles>
            endif
        endif
        FormatText textname = test1 'Process: \c5%d \c0(\c4%e, \c2%f\c0)' d = <new_particle_process_frame_pcnt> e = (min_new_particle_process_frame_pcnt)f = (max_new_particle_process_frame_pcnt)
        SetScreenElementProps id = new_particle_times_process_text text = <test1>
        FormatText textname = test2 'Render: \c5%d \c0(\c4%e, \c2%f\c0)' d = <new_particle_render_frame_pcnt> e = (min_new_particle_render_frame_pcnt)f = (max_new_particle_render_frame_pcnt)
        SetScreenElementProps id = new_particle_times_render_text text = <test2>
        FormatText textname = test3 'Total: \c5%d \c0(\c4%e, \c2%f\c0)' d = (<new_particle_process_frame_pcnt> + <new_particle_render_frame_pcnt>)e = ((min_new_particle_process_frame_pcnt)+ (min_new_particle_render_frame_pcnt))f = ((max_new_particle_process_frame_pcnt)+ (max_new_particle_render_frame_pcnt))
        SetScreenElementProps id = new_particle_times_total_text text = <test3>
        FormatText textname = Test4 'Particle Systems: \c5%d \c0(\c4%e, \c2%f\c0)' d = <geom_stats_new_particle_systems> e = (min_new_particle_sys_count)f = (max_new_particle_sys_count)
        SetScreenElementProps id = new_particle_times_sys_text text = <Test4>
        FormatText textname = Test5 'Particle Count: \c5%d \c0(\c4%e, \c2%f\c0)' d = <geom_stats_new_particles> e = (min_new_particle_num_count)f = (max_new_particle_num_count)
        SetScreenElementProps id = new_particle_times_num_text text = <Test5>
    else
        KillSpawnedScript id = RefreshParticleTimesDisplay
        change toggled_particle_times_on = 0
    endif
    wait <interval> seconds
    repeat 
endscript

script toggle_wireframe_skins 
    if (wireframe_skins = 0)
        change \{ wireframe_skins = 1 }
    else
        if (wireframe_skins = 1)
            change \{ wireframe_skins = 2 }
        else
            change \{ wireframe_skins = 0 }
        endif
    endif
endscript

script show_free_mem_get_index 
    y_offset = 0
    free_mem_anchor ::getsingletag \{ y_offset }
    free_mem_anchor ::settags y_offset = (<y_offset> + 1)
    return y_offset = <y_offset>
endscript

script show_free_mem_add_category 
    show_free_mem_get_index
    CreateScreenElement {
        type = TextElement
        parent = free_mem_anchor
        Pos = (<y_offset> * (0.0, 15.0))
        text = <label>
        font = dialog
        rgba = [ 60 60 100 100 ]
        just = [ left top ]
        Scale = 0.8000
    }
    ForEachIn <items> do = show_free_mem_add_item
endscript

script show_free_mem_add_item 
    show_free_mem_get_index
    CreateScreenElement {
        type = TextElement
        parent = free_mem_anchor
        local_id = <id>
        Pos = (<y_offset> * (0.0, 15.0))
        text = ''
        font = dialog
        rgba = [ 58 108 58 100 ]
        just = [ left top ]
        Scale = 0.8000
    }
endscript

script show_free_mem 
    if NOT ScreenElementExists id = free_mem_anchor
        DoScreenElementMorph {
            id = the_score_sprite
            Scale = 0
        }
        DoScreenElementMorph {
            id = the_score
            Scale = 0
        }
        categories = [
            {
                label = 'Free Memory'
                items = [
                    { id = bottomup }
                    { id = Script }
                    { id = GoalHeap }
                ]
            }
            {
                label = 'Free Script Pool Items'
                items = [
                    { id = CComponents }
                    { id = CStructs }
                ]
            }
        ]
        SetScreenElementLock id = root_window Off
        CreateScreenElement {
            type = ContainerElement
            parent = root_window
            id = free_mem_anchor
            Pos = (30.0, 10.0)
            just = [ center center ]
            internal_just = [ left center ]
            z_priority = 10001
        }
        ForEachIn <categories> do = show_free_mem_add_category
        show_free_mem_get_index
        CreateScreenElement {
            type = SpriteElement
            parent = free_mem_anchor
            rgba = [ 0 0 0 70 ]
            texture = white2
            Scale = ((58.0, 0.0) + <y_offset> * (0.0, 1.899999976158142))
            z_priority = 10000
            just = [ left top ]
        }
        SpawnScriptLater noqbid RefreshFreeMemoryDisplay
    else
        KillSpawnedScript name = RefreshFreeMemoryDisplay
        DestroyScreenElement id = free_mem_anchor
        DoScreenElementMorph {
            id = the_score_sprite
            Scale = 1
        }
        DoScreenElementMorph {
            id = the_score
            Scale = 1
        }
        show_compass_anchor
    endif
endscript

script RefreshFreeMemoryDisplay \{ interval = 0.7500 }
    begin 
    hide_compass_anchor
    DisplayFreeMem
    wait <interval> seconds
    repeat 
endscript

script updatedisplayfreememory 
    if ScreenElementExists id = free_mem_anchor
        if ResolveScreenElementID id = {free_mem_anchor child = <id>}
            FormatText {
                textname = display
                '%s: %m of %t, low: %o'
                s = <text_name>
                m = <free>
                t = <total>
                o = <min>
                usecommas
                DontAssertForChecksums
            }
            SetScreenElementProps id = <resolved_id> text = <display>
        endif
    else
        KillSpawnedScript id = RefreshFreeMemoryDisplay
    endif
endscript

script show_defrag_anim_cache 
    printf \{ '\n\n\n************Before:***********************' }
    DumpHeaps
    UpdateAnimCache \{ defrag }
    printf \{ '\n************After:***********************' }
    DumpHeaps
endscript

script toggle_show_all 
    show_all
endscript

script toggle_show_polys \{ showscript = show_vert }
    <showscript>
    pulse_item
endscript

script launch_keyboard 
    DestroyScreenElement \{ id = current_menu_anchor }
    create_onscreen_keyboard
endscript

script launch_cheats_menu 
    RunScriptOnScreenElement \{ id = current_menu_anchor animate_out callback = create_cheats_menu }
endscript

script create_cheats_menu 
    GoalManager_HidePoints
    GoalManager_HideGoalPoints
    make_new_roundbar_menu {
        padding_scale = 1
        menu_id = cheats_menu
        vmenu_id = cheats_vmenu
        menu_title = 'CHEATS'
        Pos = (200.0, 40.0)
        dims = (380.0, 400.0)
        helper_text = generic_helper_text
        internal_text_offset = (0.0, 0.0)
    }
    kill_start_key_binding
    SetScreenElementProps {id = cheats_menu
        event_handlers = [{ pad_back create_debug_options_menu }]
    }
    add_roundbar_menu_item rot = 0 text = 'Get 1000 cash money' pad_choose_script = cheats_cashmoney
    add_roundbar_menu_item rot = 0 text = 'Get spider chest tattoo' pad_choose_script = cheats_spider_chest_tattoo
    add_roundbar_menu_item rot = 0 text = 'Get Alien Suit' pad_choose_script = cheats_alien_suit
    add_roundbar_menu_item rot = 0 text = 'Get All City Tag' pad_choose_script = cheats_all_city_tag
    add_roundbar_menu_item rot = 0 text = 'Beat 3 Bike Training Goals' pad_choose_script = cheats_beat_bike
    add_roundbar_menu_item rot = 0 text = 'Toggle Bike' pad_choose_script = toggle_bike_on_off
    add_roundbar_menu_item rot = 0 text = 'Toggle Skater Abilities' pad_choose_script = toggle_all_abilities
    add_roundbar_menu_item rot = 0 text = 'Time of Day' pad_choose_script = launch_timeofday_menu
    add_roundbar_menu_item rot = 0 text = 'View Cutscenes' pad_choose_script = launch_view_cutscenes_menu
    add_roundbar_menu_item rot = 0 text = 'Set Stats 10' pad_choose_script = cheat_set_stats_10
    if (All_Levels_Unlocked = 1)
        <unlocked> = 'on'
    else
        <unlocked> = 'off'
    endif
    add_roundbar_menu_item rot = 0 id = cheats_menu_level_lock text = ('All Levels Unlocked: ' + <unlocked>)pad_choose_script = cheats_menu_change_level_lock
    add_roundbar_menu_item rot = 0 text = 'Set Transition Speed' pad_choose_script = launch_transition_speed_menu
    if GameModeEquals is_career
        if GoalManager_GoalIsActive name = (goal_utility_last_goal_activated)
            add_roundbar_menu_item rot = 0 text = 'Beat Current Mission' id = menu_beat_goal pad_choose_script = menu_select pad_choose_params = {stop_vibration stop_streams menu_select_script = goal_beat_current_goal}
        endif
        add_roundbar_menu_item rot = 0 text = 'Atom Unlocking (expert use only)' pad_choose_script = game_progress_debug_menu_create
    endif
    add_roundbar_menu_item rot = 0 text = 'Mark all goals unbeaten' pad_choose_script = cheats_menu_UnBeatAllGoals
    add_roundbar_menu_item rot = 0 text = 'Set Difficulty Level' pad_choose_script = launch_cheats_menu_select_difficulty
    FireEvent type = focus target = cheats_menu
endscript

script cheats_alien_suit 
    CareerFunc \{ func = StoreTempAppearance }
    GetCurrentSkaterProfileIndex
    EditPlayerAppearance profile = <currentSkaterProfileIndex> target = setpart targetParams = {part = skater_m_torso desc_id = #"Alien Costume"}
    RefreshSkaterModel skater = 0 profile = <currentSkaterProfileIndex> no_board = 0
endscript

script cheats_menu_change_flag 
    gettags
    if GetGlobalFlag flag = <flag>
        UnsetGlobalFlag flag = <flag>
        toggle_menu_item_off id = <id>
    else
        SetGlobalFlag flag = <flag>
        toggle_menu_item_on id = <id>
    endif
endscript

script cheats_menu_check_flag 
    gettags
    if GetGlobalFlag flag = <flag>
        toggle_menu_item_on id = <id>
    else
        toggle_menu_item_off id = <id>
    endif
endscript

script cheats_menu_check_level_lock 
    gettags
    if IntegerEquals \{ a = All_Levels_Unlocked b = 1 }
        toggle_menu_item_on id = <id>
    else
        toggle_menu_item_off id = <id>
    endif
endscript

script cheats_menu_change_level_lock 
    gettags
    if IntegerEquals a = All_Levels_Unlocked b = 1
        SetScreenElementProps {
            id = {<id> child = 0}
            text = 'All Levels Unlocked: off'
        }
        change All_Levels_Unlocked = 0
    else
        if IntegerEquals a = All_Levels_Unlocked b = 0
            SetScreenElementProps {
                id = {<id> child = 0}
                text = 'All Levels Unlocked: on'
            }
            change All_Levels_Unlocked = 1
            change DEMO_BUILD = 0
            printf 'changing demo build to 0'
        endif
    endif
    pulse_item
endscript

script cheats_menu_refresh_classic_points 
    gettags
    if IsTrue \{ classic_mode_use_cheat_points }
        SetScreenElementProps {
            id = {<id> child = 0}
            text = '     1'
        }
    else
        GetClassicModeTargetGoalsComplete
        FormatText textname = goals '     %g' g = <target_goals_complete>
        SetScreenElementProps {
            id = {<id> child = 0}
            text = <goals>
        }
    endif
endscript

script cheats_menu_change_classic_points 
    gettags
    if IntegerEquals \{ a = classic_mode_use_cheat_points b = 1 }
        change \{ classic_mode_use_cheat_points = 0 }
        cheats_menu_refresh_classic_points <...> 
    else
        change \{ classic_mode_use_cheat_points = 1 }
        cheats_menu_refresh_classic_points <...> 
    endif
    pulse_item
endscript

script cheats_menu_100_stat_points 
    AwardStatPoint \{ 100 }
    pulse_item
endscript

script cheats_menu_UnlockAllGoals 
    GoalManager_UnlockAllGoals
    pulse_item
endscript

script cheats_menu_score5mil 
    skater ::SetTrickName \{ 'You cheat like Kurt' }
    skater ::SetTrickScore \{ 5000000 }
    skater ::display
endscript

script cheats_menu_UnBeatAllGoals 
    GoalManager_UnBeatAllGoals
    GoalManager_UninitializeAllGoals
    GoalManager_Initializeallgoals
endscript

script launch_cheats_menu_select_difficulty 
    if ScreenElementExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    make_new_menu {
        menu_id = cheats_select_difficulty_menu
        vmenu_id = cheats_select_difficulty_vmenu
        menu_title = 'SET DIFFICULTY'
        helper_text = generic_helper_text_left_right
    }
    make_text_sub_menu_item {
        text = 'Easy'
        id = cheats_difficulty_easy
        pad_choose_script = cheats_menu_set_difficulty
        pad_choose_params = { difficulty = 0 }
    }
    make_text_sub_menu_item {
        text = 'Normal'
        id = cheats_difficulty_normal
        pad_choose_script = cheats_menu_set_difficulty
        pad_choose_params = { difficulty = 1 }
    }
    make_text_sub_menu_item {
        text = 'Sick'
        id = cheats_difficulty_sick
        pad_choose_script = cheats_menu_set_difficulty
        pad_choose_params = { difficulty = 2 }
    }
    FireEvent type = focus target = cheats_select_difficulty_menu
endscript

script cheats_menu_set_difficulty 
    GoalManager_SetDifficultyLevel <difficulty>
    GoalManager_UninitializeAllGoals
    GoalManager_Initializeallgoals
    launch_cheats_menu
endscript

script cheats_cashmoney 
    CareerFunc \{func = AddCash params = { cash = 1000 }}
    printf \{ 'Show me the money!' }
endscript

script cheat_set_stats_10 
    SetAllStats \{ value = 10 }
endscript

script cheats_spider_chest_tattoo 
    printf \{ 'Spidey Sense tingling!' }
    GetCurrentSkaterProfileIndex
    EditPlayerAppearance {
        profile = <currentSkaterProfileIndex>
        target = setpart
        targetParams = {
            part = chest_tattoo
            desc_id = Spider
        }
    }
endscript

script cheats_all_city_tag 
    printf 'Some kinda Graffiti Supah-Stah!'
    CareerFunc func = UnlockZoneGraffitiStyle params = { zone = z_ho }
    CareerFunc func = UnlockZoneGraffitiStyle params = { zone = z_bh }
    CareerFunc func = UnlockZoneGraffitiStyle params = { zone = z_dt }
    CareerFunc func = UnlockZoneGraffitiStyle params = { zone = z_sm }
    <tmpArray> = edit_graphic_layer_infos
    <new_texture_ids> = [ bg_1 grap_1 ill_1 odd_1 ]
    <new_texture_names> = [ 'bg_1' 'grap_1' 'ill_1' 'odd_1' ]
    <index> = 0
    begin 
    if (<index> < 4)
        <texture_id> = (<new_texture_ids> [ <index> ])
        <texture_name> = (<new_texture_names> [ <index> ])
    else
        <texture_id> = None
        <texture_name> = ''
    endif
    SetArrayElement {
        arrayName = tmpArray
        index = <index>
        newValue = {
            texture_id = <texture_id>
            texture_name = <texture_name>
            string = ''
            canvas_id = None
            font_id = 0
            pos_x = 32
            pos_y = 32
            rot = 0
            Scale = 1
            flip_h = 0
            flip_v = 0
            hsva = [322 , 90 , 60 , 128]
            layer_id = <index>
        }
    }
    <index> = (<index> + 1)
    repeat 10
endscript

script cheats_beat_bike 
    printf \{ 'BMX Power!' }
    CareerFunc \{func = SetCurrentBikeTrainingGoal params = { current_bike_training_goal = 3 }}
endscript

script create_set_premade_skater_menu 
    if ObjectExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    make_new_menu {
        menu_id = set_premade_skater_menu
        vmenu_id = set_premade_skater_vmenu
        menu_title = 'PRE-MADE SKATERS'
        type = vscrollingmenu
        scrolling_menu_title_id = set_premade_skater_title
        num_items_to_show = 6
        dims = (200.0, 180.0)
    }
    SetScreenElementProps {
        id = set_premade_skater_menu
        event_handlers = [{ pad_back create_test_menu }]
        replace_handlers
    }
    GetArraySize custom_male_appearances
    index = 0
    begin 
    <text> = ((custom_male_appearances [ <index> ]).name)
    FormatText checksumname = id '%i' i = <text>
    make_text_sub_menu_item {
        text = <text>
        id = <id>
        pad_choose_script = set_premade_skater
        pad_choose_params = {
            appearance = ((custom_male_appearances [ <index> ]).struct)
            Female = ((custom_male_appearances [ <index> ]).Female)
        }
    }
    index = (<index> + 1)
    repeat <array_size>
    RunScriptOnScreenElement id = current_menu_anchor animate_in params = { final_pos = (320.0, 134.0) }
endscript

script set_premade_skater 
    GetCurrentSkaterProfileIndex
    if NOT GotParam \{ Female }
        SetSkaterProfileProperty player = <currentSkaterProfileIndex> is_male 1
    else
        SetSkaterProfileProperty player = <currentSkaterProfileIndex> is_male 0
    endif
    SetPlayerAppearance appearance_structure = <appearance> player = <currentSkaterProfileIndex>
    RefreshSkaterModel skater = 0 profile = <currentSkaterProfileIndex>
    exit_pause_menu
endscript

script toggle_all_abilities 
    skater ::ToggleAllAbilities
endscript
navmesh_draw_enable = 0
navmesh_poly_draw_enable = 0

script navmesh_draw_update 
    begin 
    if (navmesh_draw_enable = 0)
        break 
    endif
    nav_show \{ 60 }
    ShowNavNodeManager
    wait \{ 1 second }
    repeat 
endscript

script navmesh_poly_draw_update 
    begin 
    if (navmesh_poly_draw_enable = 0)
        break 
    endif
    nav_polyshow
    ShowNavNodeManager
    wait \{ 1 second }
    repeat 
endscript

script toggle_navmesh_draw 
    if (navmesh_draw_enable = 1)
        change \{ navmesh_draw_enable = 0 }
        KillSpawnedScript \{ id = navmesh_draw_update_script }
        nav_show \{ 1 }
    else
        change \{ navmesh_draw_enable = 1 }
        SpawnScriptLater \{ navmesh_draw_update id = navmesh_draw_update_script }
    endif
endscript

script toggle_navmesh_polydraw 
    if (navmesh_poly_draw_enable = 1)
        change \{ navmesh_poly_draw_enable = 0 }
        KillSpawnedScript \{ id = navmesh_poly_draw_update_script }
        nav_polyclear
    else
        change \{ navmesh_poly_draw_enable = 1 }
        SpawnScriptLater \{ navmesh_poly_draw_update id = navmesh_poly_draw_update_script }
    endif
endscript
DEBUG_PEDINFO = 0

script toggle_ped_debug 
    change DEBUG_PEDINFO = (1 - DEBUG_PEDINFO)
endscript

script show_skater_coords 
    if ScreenElementExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    SetScreenElementLock Off id = root_window
    skater ::get_skater_pos
    printstruct <...> 
    if NOT GotParam x
        create_debug_options_menu
        return 
    endif
    FormatText textname = text 'pos=(%x,%y,%z)' x = <x> y = <y> z = <z>
    CreateScreenElement {
        type = TextElement
        parent = root_window
        id = current_menu_anchor
        text = <text>
        font = small
        Scale = 1.500
        rgba = [ 0 0 0 128 ]
        Pos = (320.0, 240.0)
        z_priority = 1
        event_handlers = [
            {pad_back generic_menu_pad_back params = { callback = create_debug_options_menu }}
        ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        texture = white
        Scale = (70.0, 5.0)
        rgba = [ 100 100 100 100 ]
        Pos = (-20.0, 0.0)
        z_priority = 0
        just = [ left top ]
    }
    FireEvent type = focus target = current_menu_anchor
endscript

script get_skater_pos 
    GetSkaterPosition
    return <...> 
endscript

script launch_transition_speed_menu 
    if ScreenElementExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    make_new_menu {
        menu_id = transition_speed_menu
        vmenu_id = transition_speed_vmenu
        menu_title = 'transition speed'
        helper_text = generic_helper_text_left_right
    }
    make_text_sub_menu_item {
        text = '500'
        pad_choose_script = change_transition_speed
        pad_choose_params = { Speed = 500 }
    }
    make_text_sub_menu_item {
        text = '600'
        pad_choose_script = change_transition_speed
        pad_choose_params = { Speed = 600 }
    }
    make_text_sub_menu_item {
        text = '700'
        pad_choose_script = change_transition_speed
        pad_choose_params = { Speed = 700 }
    }
    make_text_sub_menu_item {
        text = '800'
        pad_choose_script = change_transition_speed
        pad_choose_params = { Speed = 800 }
    }
    make_text_sub_menu_item {
        text = '900'
        pad_choose_script = change_transition_speed
        pad_choose_params = { Speed = 900 }
    }
    make_text_sub_menu_item {
        text = '1000'
        pad_choose_script = change_transition_speed
        pad_choose_params = { Speed = 1000 }
    }
    make_text_sub_menu_item {
        text = '1100'
        pad_choose_script = change_transition_speed
        pad_choose_params = { Speed = 1100 }
    }
    FireEvent type = focus target = transition_speed_menu
endscript

script change_transition_speed 
    if NOT GotParam \{ Speed }
        printf \{ 'script change_transition_speed missing speed param' }
        return 
    endif
    change transition_max_speed = <Speed>
    launch_cheats_menu
endscript

script debug_tweak_processor_params 
    if ScreenElementExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    if ScreenElementExists id = DEBUG_MENU
        DestroyScreenElement id = DEBUG_MENU
    endif
    make_label_menu id = processor_menu pad_back_script = exit_tweak_processor_menu
    FormatText textname = desired_average '%a' a = (g_desired_average)
    add_label_menu_item {
        id = id_desired_average
        text = 'Desired Average:'
        extra_text = <desired_average>
        option_arrows_callback = debug_adjust_desired_average
        option_arrows
    }
    FormatText textname = low_average_threshold '%a' a = (g_low_average_threshold)
    add_label_menu_item {
        id = id_low_average_threshold
        text = 'Low Average Threshold:'
        extra_text = <low_average_threshold>
        option_arrows_callback = debug_adjust_low_average_threshold
        option_arrows
    }
    FormatText textname = high_average_threshold '%a' a = (g_high_average_threshold)
    add_label_menu_item {
        id = id_high_average_threshold
        text = 'High Average Threshold:'
        extra_text = <high_average_threshold>
        option_arrows_callback = debug_adjust_high_average_threshold
        option_arrows
    }
    FormatText textname = forced_catch_up_average '%a' a = (g_forced_catch_up_average)
    add_label_menu_item {
        id = id_forced_catch_up_average
        text = 'Forced Catch Up Average:'
        extra_text = <forced_catch_up_average>
        option_arrows_callback = debug_adjust_forced_catch_up_average
        option_arrows
    }
    label_menu_finish
endscript

script exit_tweak_processor_menu 
    setup_gs_idle_proc_params
    create_debug_menu
endscript

script debug_adjust_desired_average 
    if GotParam \{ left }
        change g_desired_average = ((g_desired_average)- 1)
    else
        change g_desired_average = ((g_desired_average)+ 1)
    endif
    if (g_desired_average < 1)
        change \{ g_desired_average = 1 }
    endif
    FormatText textname = desired_average '%a' a = (g_desired_average)
    SetScreenElementProps id = { id_desired_average child = extra_text }text = <desired_average>
endscript

script debug_adjust_low_average_threshold 
    if GotParam \{ left }
        change g_low_average_threshold = ((g_low_average_threshold)- 0.05000)
    else
        change g_low_average_threshold = ((g_low_average_threshold)+ 0.05000)
    endif
    if (g_low_average_threshold < 0.05000)
        change \{ g_low_average_threshold = 0.05000 }
    endif
    FormatText textname = low_average_threshold '%a' a = (g_low_average_threshold)
    SetScreenElementProps id = { id_low_average_threshold child = extra_text }text = <low_average_threshold>
endscript

script debug_adjust_high_average_threshold 
    if GotParam \{ left }
        change g_high_average_threshold = ((g_high_average_threshold)- 0.05000)
    else
        change g_high_average_threshold = ((g_high_average_threshold)+ 0.05000)
    endif
    if (g_high_average_threshold < 0.05000)
        change \{ g_high_average_threshold = 0.05000 }
    endif
    FormatText textname = high_average_threshold '%a' a = (g_high_average_threshold)
    SetScreenElementProps id = { id_high_average_threshold child = extra_text }text = <high_average_threshold>
endscript

script debug_adjust_forced_catch_up_average 
    if GotParam \{ left }
        change g_forced_catch_up_average = ((g_forced_catch_up_average)- 0.05000)
    else
        change g_forced_catch_up_average = ((g_forced_catch_up_average)+ 0.05000)
    endif
    if (g_forced_catch_up_average < 0.05000)
        change \{ g_forced_catch_up_average = 0.05000 }
    endif
    FormatText textname = forced_catch_up_average '%a' a = (g_forced_catch_up_average)
    SetScreenElementProps id = { id_forced_catch_up_average child = extra_text }text = <forced_catch_up_average>
endscript
