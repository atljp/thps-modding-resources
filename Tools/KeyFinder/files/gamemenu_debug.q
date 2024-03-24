

script create_debug_menu 
    if ObjectExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    pause_menu_gradient Off
    make_new_menu {
        menu_id = DEBUG_MENU
        vmenu_id = debug_vmenu
        menu_title = 'DEBUG'
        type = vscrollingmenu
        dims = (200.0, 350.0)
        padding_scale = 0.9500
        Pos = (243.0, 50.0)
    }
    SetScreenElementProps {id = DEBUG_MENU
        event_handlers = [
            {pad_back generic_menu_pad_back params = { callback = create_debug_options_menu }}
        ]
    }
    make_text_sub_menu_item text = 'Auto Rail Level' id = menu_autoraillevel pad_choose_script = autorail_level
    make_text_sub_menu_item text = 'Time Of Day' id = menu_timeofday pad_choose_script = launch_timeofday_menu
    make_text_sub_menu_item text = 'Lighting Tool' id = menu_lighting pad_choose_script = launch_lighttool_sub_menu
    make_text_sub_menu_item text = 'Rail Display Toggle' pad_choose_script = toggle_rails
    make_text_sub_menu_item text = 'Bouncy Object Debug Display Toggle' pad_choose_script = toggle_rigidbody
    make_text_sub_menu_item text = 'Toggle Profiler' id = menu_profiler pad_choose_script = launch_toggle_profiler
    make_text_sub_menu_item text = 'Toggle FPS Display' id = menu_fps pad_choose_script = launch_toggle_fps
    make_text_sub_menu_item text = 'Toggle Anim Times' id = menu_anim_times pad_choose_script = launch_toggle_anim_times
    make_text_sub_menu_item text = 'Toggle Particle Times' id = menu_particle_times pad_choose_script = launch_toggle_particle_times
    make_text_sub_menu_item text = 'Toggle Particle Emit Dir Display' id = menu_emit pad_choose_script = launch_toggle_emit_dir
    make_text_sub_menu_item text = 'Toggle Model Scene Light Display' id = menu_light_model pad_choose_script = launch_toggle_lights pad_choose_params = { light_type = Model }
    make_text_sub_menu_item text = 'Toggle Geom Scene Light Display' id = menu_light_geom pad_choose_script = launch_toggle_lights pad_choose_params = { light_type = geom }
    make_text_sub_menu_item text = 'Toggle Active Scene Light Display' id = menu_light_active pad_choose_script = launch_toggle_lights pad_choose_params = { light_type = active }
    make_text_sub_menu_item text = 'Toggle Geom Stats' id = menu_geom_stats pad_choose_script = launch_toggle_geom_stats
    make_text_sub_menu_item text = 'Toggle Poly Count' id = menu_poly pad_choose_script = show_poly_count
    make_text_sub_menu_item text = 'Toggle Free Memory' id = menu_mem pad_choose_script = show_free_mem
    make_text_sub_menu_item text = 'Defrag Animation Cache' id = menu_defrag_anim pad_choose_script = show_defrag_anim_cache
    if cd
        make_text_sub_menu_item text = 'Start AutoTest' id = menu_start_autotest pad_choose_script = menu_start_autotest
        make_text_sub_menu_item text = 'Stop AutoTest' id = menu_stop_autotest pad_choose_script = menu_stop_autotest
    endif
    make_text_sub_menu_item text = 'Wireframe Toggle' pad_choose_script = toggle_wireframe
    make_text_sub_menu_item text = 'Wireframe Skins Toggle' pad_choose_script = toggle_wireframe_skins
    make_text_sub_menu_item text = 'Show Vert Polys' pad_choose_script = toggle_show_polys pad_choose_params = { showscript = show_vert }
    make_text_sub_menu_item text = 'Show Wallride Polys' pad_choose_script = toggle_show_polys pad_choose_params = { showscript = show_wallride }
    make_text_sub_menu_item text = 'Show Trigger Polys' pad_choose_script = toggle_show_polys pad_choose_params = { showscript = show_trigger }
    make_text_sub_menu_item text = 'Show Camera Polys' pad_choose_script = toggle_show_polys pad_choose_params = { showscript = show_camera_collide }
    make_text_sub_menu_item text = 'Show Not Skateable' pad_choose_script = toggle_show_polys pad_choose_params = { showscript = show_not_skatable }
    make_text_sub_menu_item text = 'Show skater shadow' pad_choose_script = toggle_show_polys pad_choose_params = { showscript = show_skater_shadow }
    make_text_sub_menu_item text = 'Show no skater shadow' pad_choose_script = toggle_show_polys pad_choose_params = { showscript = show_no_skater_shadow }
    make_text_sub_menu_item text = 'Show no skater shadow wall' pad_choose_script = toggle_show_polys pad_choose_params = { showscript = show_no_skater_shadow_wall }
    make_text_sub_menu_item text = 'CheckForHoles (Slow)' pad_choose_script = hole_check
    make_text_sub_menu_item text = 'Hide HUD' pad_choose_script = debug_menu_hide_hud
    make_text_sub_menu_item text = 'Done' id = menu_done pad_choose_script = create_debug_options_menu
    RunScriptOnScreenElement id = current_menu_anchor animate_in params = { final_pos = (320.0, 134.0) }
endscript


script launch_lighttool_sub_menu 
    if ObjectExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    pause_menu_gradient Off
    make_new_menu {
        menu_id = DEBUG_MENU
        vmenu_id = debug_vmenu
        menu_title = 'LIGHT TOOL SUBMENU'
        type = vscrollingmenu
        dims = (200.0, 350.0)
        padding_scale = 0.9500
        Pos = (243.0, 50.0)
    }
    SetScreenElementProps {id = DEBUG_MENU
        event_handlers = [
            {pad_back generic_menu_pad_back params = { callback = create_pause_menu }}
        ]
    }
    make_text_sub_menu_item text = 'Character Lights' id = menu_charlights pad_choose_script = launch_lighting_tool pad_choose_params = { set = Character }
    make_text_sub_menu_item text = 'Level Lights' id = menu_levellights pad_choose_script = launch_lighting_tool pad_choose_params = { set = level }
    make_text_sub_menu_item text = 'Done' id = menu_done pad_choose_script = create_debug_menu
    RunScriptOnScreenElement id = current_menu_anchor animate_in params = { final_pos = (320.0, 134.0) }
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
        Pos = (243.0, 50.0)
    }
    SetScreenElementProps {id = DEBUG_MENU
        event_handlers = [
            { pad_back exit_test_menu }
        ]
    }
    make_text_sub_menu_item text = 'View Humans' id = menu_view_human_models pad_choose_script = launch_view_models_menu pad_choose_params = { model_set = human }
    make_text_sub_menu_item text = 'View Cutscene Heads' id = menu_view_cutscene_heads pad_choose_script = launch_view_models_menu pad_choose_params = { model_set = cutscene_heads }
    make_text_sub_menu_item text = 'View Animals' id = menu_view_animal_models pad_choose_script = launch_view_models_menu pad_choose_params = { model_set = Animal }
    make_text_sub_menu_item text = 'View Cars' id = menu_view_car_models pad_choose_script = launch_view_models_menu pad_choose_params = { model_set = car }
    make_text_sub_menu_item text = 'View Cutscenes' id = menu_view_cutscenes pad_choose_script = launch_view_cutscenes_menu
    make_text_sub_menu_item text = 'Set Pro Skater' id = menu_set_pro_skater pad_choose_script = create_set_pro_skater_menu
    make_text_sub_menu_item text = 'Set Pre-Made Skater' id = menu_set_premade_skater pad_choose_script = create_set_premade_skater_menu
    make_text_sub_menu_item text = 'Edit Appearance' id = menu_edit_appearance pad_choose_script = pause_launch_level pad_choose_params = { level = load_cas }
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
        SpawnScript RefreshGeomStatsDisplay
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
        change DrawEmitLines = 0
    else
        change DrawEmitLines = 1
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
        SpawnScript RefreshFPSDisplay
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
        SpawnScript RefreshAnimTimesDisplay
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
        SpawnScript RefreshParticleTimesDisplay
    endif
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
    if (wireframe_skins = 1)
        change wireframe_skins = 0
    else
        change wireframe_skins = 1
    endif
endscript

free_mem_on = 0

script show_free_mem 
    if (free_mem_on = 0)
        change free_mem_on = 1
        DoScreenElementMorph {
            id = the_score_sprite
            Scale = 0
        }
        DoScreenElementMorph {
            id = the_score
            Scale = 0
        }
        DoScreenElementMorph {
            id = goal_points_text
            Scale = 0
        }
        if ScreenElementExists id = goal_points_display
            DoScreenElementMorph id = goal_points_display Scale = 0
        endif
        SetScreenElementLock id = root_window Off
        if ObjectExists id = free_mem_anchor
            DestroyScreenElement id = free_mem_anchor
            wait 0.2000 seconds
        endif
        CreateScreenElement {
            type = ContainerElement
            parent = root_window
            id = free_mem_anchor
            Pos = (30.0, 40.0)
            just = [ center center ]
            internal_just = [ left center ]
        }
        CreateScreenElement {
            type = TextElement
            parent = free_mem_anchor
            Pos = (0.0, -15.0)
            text = 'Free Memory'
            font = dialog
            rgba = [ 60 60 100 100 ]
            just = [ left center ]
            Scale = 0.8000
        }
        CreateScreenElement {
            type = TextElement
            parent = free_mem_anchor
            id = topdown_heap_text
            Pos = (0.0, 0.0)
            text = ''
            font = dialog
            rgba = [ 58 108 58 100 ]
            just = [ left center ]
            Scale = 0.8000
        }
        CreateScreenElement {
            type = TextElement
            parent = free_mem_anchor
            id = script_heap_text
            Pos = (0.0, 15.0)
            text = ''
            font = dialog
            rgba = [ 58 108 58 100 ]
            just = [ left center ]
            Scale = 0.8000
        }
        SetScreenElementLock id = root_window on
        SpawnScript RefreshFreeMemoryDisplay
    else
        change free_mem_on = 0
        KillSpawnedScript name = RefreshFreeMemoryDisplay
        wait 0.2000 seconds
        if ObjectExists id = free_mem_anchor
            DestroyScreenElement id = free_mem_anchor
        endif
        DoScreenElementMorph {
            id = the_score_sprite
            Scale = 1
        }
        DoScreenElementMorph {
            id = the_score
            Scale = 1
        }
        DoScreenElementMorph {
            id = goal_points_text
            Scale = 1
        }
        if ScreenElementExists id = goal_points_display
            DoScreenElementMorph id = goal_points_display Scale = 1
        endif
    endif
endscript

freemem_script_lowest = 999999999
freemem_main_lowest = 999999999

script RefreshFreeMemoryDisplay interval = 1.0
    begin 
    DisplayFreeMem
    wait <interval> seconds
    repeat 
endscript


script updatedisplayfreememory 
    if ObjectExists id = free_mem_anchor
        FormatText checksumname = context_name 'Script'
        if (<id> = <context_name>)
            FormatText textname = script_heap 'Script: %m (%nK) low: %o (%pK)' m = <free_mem> n = (<free_mem> / 1024)o = min_free_mem p = (<min_free_mem> / 1024)usecommas
            SetScreenElementProps id = script_heap_text text = <script_heap>
        endif
        FormatText checksumname = context_name 'Top Down'
        if (<id> = <context_name>)
            FormatText textname = main_heap 'Main: %m (%nK) low: %o (%pK)' m = <free_mem> n = (<free_mem> / 1024)o = min_free_mem p = (<min_free_mem> / 1024)usecommas
            SetScreenElementProps id = topdown_heap_text text = <main_heap>
        endif
    else
        KillSpawnedScript id = RefreshFreeMemoryDisplay
        change free_mem_on = 0
    endif
endscript


script show_defrag_anim_cache 
    
    DumpHeaps
    UpdateAnimCache defrag
    
    DumpHeaps
endscript


script toggle_show_all 
    show_all
endscript


script toggle_show_polys showscript = show_vert
    <showscript>
    pulse_item
endscript


script launch_keyboard 
    DestroyScreenElement id = current_menu_anchor
    create_onscreen_keyboard
endscript


script launch_cheats_menu 
    RunScriptOnScreenElement id = current_menu_anchor animate_out callback = create_cheats_menu
endscript


script create_cheats_menu 
    GoalManager_HidePoints
    GoalManager_HideGoalPoints
    make_new_menu {
        padding_scale = 1
        menu_id = cheats_menu
        vmenu_id = cheats_vmenu
        menu_title = 'CHEATS'
        padding_scale = 0.9000
        Pos = (230.0, 40.0)
        helper_text = generic_helper_text
    }
    kill_start_key_binding
    SetScreenElementProps {id = cheats_menu
        event_handlers = [{ pad_back create_debug_options_menu }]
    }
    make_text_sub_menu_item text = 'Time of Day' pad_choose_script = launch_timeofday_menu
    make_text_sub_menu_item text = 'View Cutscenes' pad_choose_script = launch_view_cutscenes_menu
    make_toggle_menu_item id = cheats_menu_level_lock text = 'Levels unlocked: ' pad_choose_script = cheats_menu_change_level_lock
    if GameModeEquals is_career
        make_text_sub_menu_item text = 'Advance Stage' pad_choose_script = cheats_menu_advance_stage
        make_text_sub_menu_item text = 'Give 50 cheat points for this session' pad_choose_script = give_cheat_points
        make_text_sub_menu_item text = 'Reset cheat points for this session' pad_choose_script = reset_cheat_points
    endif
    if GameModeEquals is_classic
        make_toggle_menu_item id = classic_cheat_points text = 'Goals to complete bracket:' pad_choose_script = cheats_menu_change_classic_points
        RunScriptOnScreenElement id = classic_cheat_points cheats_menu_refresh_classic_points
    endif
    make_text_sub_menu_item text = '100 Stat Points' pad_choose_script = cheats_menu_100_stat_points
    if GoalManager_HasActiveGoals
        make_text_sub_menu_item text = 'Beat current goal' pad_choose_script = cheats_menu_beat_current_goal
    endif
    make_text_sub_menu_item text = 'Unlock all chapters' pad_choose_script = unlock_all_chapters
    make_text_sub_menu_item text = 'Unlock all stats goals' pad_choose_script = cheats_menu_UnlockAllStatsGoals
    make_text_sub_menu_item text = 'Score 5 million points' pad_choose_script = cheats_menu_score5mil
    make_text_sub_menu_item text = 'Mark all goals unbeaten' pad_choose_script = cheats_menu_UnBeatAllGoals
    make_text_sub_menu_item text = 'Set Difficulty Level' pad_choose_script = launch_cheats_menu_select_difficulty
    RunScriptOnScreenElement id = cheats_menu_level_lock cheats_menu_check_level_lock
    FireEvent type = focus target = cheats_menu
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
    if IntegerEquals a = All_Levels_Unlocked b = 1
        toggle_menu_item_on id = <id>
    else
        toggle_menu_item_off id = <id>
    endif
endscript


script cheats_menu_change_level_lock 
    gettags
    if IntegerEquals a = All_Levels_Unlocked b = 1
        toggle_menu_item_off id = <id>
        change All_Levels_Unlocked = 0
    else
        if IntegerEquals a = All_Levels_Unlocked b = 0
            toggle_menu_item_on id = <id>
            change All_Levels_Unlocked = 1
            change DEMO_BUILD = 0
            
        endif
    endif
    pulse_item
endscript


script cheats_menu_refresh_classic_points 
    gettags
    if IsTrue classic_mode_use_cheat_points
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
    if IntegerEquals a = classic_mode_use_cheat_points b = 1
        change classic_mode_use_cheat_points = 0
        cheats_menu_refresh_classic_points <...> 
    else
        change classic_mode_use_cheat_points = 1
        cheats_menu_refresh_classic_points <...> 
    endif
    pulse_item
endscript


script cheats_menu_100_stat_points 
    AwardStatPoint 100
    pulse_item
endscript


script cheats_menu_UnlockAllGoals 
    GoalManager_UnlockAllGoals
    pulse_item
endscript


script cheats_menu_UnlockAllStatsGoals 
    skater ::StatsManager_UnlockAmGoals
    skater ::StatsManager_UnlockProGoals
    pulse_item
endscript


script cheats_menu_score5mil 
    skater ::SetTrickName 'You cheat like Kurt'
    skater ::SetTrickScore 5000000
    skater ::display
endscript


script cheats_menu_UnBeatAllGoals 
    GoalManager_UnBeatAllGoals
    GoalManager_UninitializeAllGoals
    GoalManager_Initializeallgoals
endscript


script cheats_menu_beat_current_goal 
    if GoalManager_GetActiveGoalId
        exit_pause_menu
        GoalManager_WinGoal name = <goal_id>
    endif
endscript


script cheats_menu_advance_stage 
    exit_pause_menu
    wait 1 gameframes
    change total_cheat_points = 1000
    GotoNextChapter
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
    if NOT GotParam Female
        SetSkaterProfileProperty player = <currentSkaterProfileIndex> is_male 1
    else
        SetSkaterProfileProperty player = <currentSkaterProfileIndex> is_male 0
    endif
    SetPlayerAppearance appearance_structure = <appearance> player = <currentSkaterProfileIndex>
    RefreshSkaterModel skater = 0 profile = <currentSkaterProfileIndex>
    exit_pause_menu
endscript

