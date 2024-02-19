PreviousSfxLevel = 0
cutscene_frame_advance_delay = 10
todmanager_temp_tod_changed = 0
TODManagerActiveBeforeCutscene = 0
cutscene_head_seam_fix = 1
total_fadeout_cutscene_frames = 0
total_fadeout_cutscene_frames_rendered = 0
fadeout_cutscene_direction = 0

script CutsceneFadeIn \{ time = 0.0 }
    if IsTrue \{ output_cutscene_video }
        change total_fadeout_cutscene_frames = ((<time> * 30.0)+ 1.0)
        change \{ total_fadeout_cutscene_frames_rendered = 0 }
        change \{ fadeout_cutscene_direction = 1 }
    else
        printf \{ 'testing cutscene fade in...' }
        KillSpawnedScript \{ name = FadeInCutscene }
        SpawnScriptLater FadeInCutscene params = { fadein_time = <time> }
    endif
endscript

script CutsceneFadeOut \{ time = 0.0 }
    if IsTrue \{ output_cutscene_video }
        change total_fadeout_cutscene_frames = ((<time> * 30.0)+ 1.0)
        change \{ total_fadeout_cutscene_frames_rendered = 0 }
        change \{ fadeout_cutscene_direction = 0 }
    else
        printf \{ 'testing cutscene fade out...' }
        FadeOutCutscene fadeout_time = <time>
    endif
endscript

script FadeInCutscene 
    if NOT GotParam \{ fadein_time }
        script_assert \{ 'no fadein time' }
    endif
    if NOT (<fadein_time> = 0)
        fadetoblack \{ on time = 0.0 alpha = 1.0 }
        fadetoblack Off time = <fadein_time>
    else
        fadetoblack \{ Off time = 0.0 }
    endif
endscript

script FadeOutCutscene 
    KillSpawnedScript \{ name = FadeInCutscene }
    if NOT GotParam \{ fadeout_time }
        script_assert \{ 'no fadeout time' }
    endif
    fadetoblack on time = <fadeout_time> alpha = 1.0
endscript

script CutsceneHideUI 
    if NOT GameModeEquals \{ is_classic }
        ResetScore
    endif
    speech_box_exit \{ anchor_id = goal_start_dialog no_pad_start }
    pause_bloom_on
    hide_all_hud_items \{ dont_disable_screen_effects }
    toggle_focus
    GlobalEffects_ClearState \{ id = pulse_bloom }
    setslomo \{ 1 }
    kill_start_key_binding
endscript

script CutsceneUnhideUI 
    show_all_hud_items
    restore_start_key_binding
endscript

script cutscene_hide_objects 
endscript

script cutscene_unhide_objects 
endscript

script UnhideLoResHeads 
    skater ::switchonatomic \{ skater_m_head }
    skater ::switchonatomic \{ skater_f_head }
endscript
cutscene_is_playing = 0

script PreCutscene 
    change block_pedspawn = 1
    change cutscene_is_playing = 1
    change update_transition_nodes = 0
    FinishPendingZoneLoads
    if GotParam name
        if StringEquals a = <name> b = 'cutscenes\au_5.cut'
            set_temporary_nude_appearance
        endif
    endif
    cutscene_deactivate_tod_manager
    UnpauseMusicAndStreams
    SetSfxReverb 0 mode = REV_MODE_CAVE
    KillSpawnedScript name = wait_and_check_for_unplugged_controllers
    change check_for_unplugged_controllers = 0
    GetValueFromVolume sfxvol
    change PreviousSfxLevel = <value>
    change PreviousSfxLevel = (PreviousSfxLevel * 10)
    StopMusic
    SetMusicStreamVolume PreviousSfxLevel
    printf '***Changing Rain Sounds\' volumes if playing!!!'
    if issoundplaying TestLight01
        printf '****Light Rain sound 01 - setting sound params to zero'
        setsoundparams TestLight01 vol = 0
    endif
    if issoundplaying TestLight02
        printf '****Light Rain sound 02 - setting sound params to zero'
        setsoundparams TestLight02 vol = 0
    endif
    if issoundplaying TestMedium02
        printf '****Medium Rain sound 02 - setting sound params to zero'
        setsoundparams TestMedium02 vol = 0
    endif
    printf '***Pausing Rain Sounds with pause_rain!!!!'
    pause_rain
    printf '***Stopping all streams with StopStream!'
    StopAudioStreams
    skater ::SkaterLoopingSound_TurnOff
    printf '***Turned skater\'s looping sound off'
    RunScriptOnComponentType Component = skaterloopingsound target = SkaterLoopingSound_TurnOff
    printf '***Running scr on all SkaterLoopingSound components - SkaterLoopingSound_TurnOff!!!'
    SetSfxVolume 0
    printf '***Set SFX Volume to Zero'
    skater ::VibrateOff
    skater ::obj_killspawnedscript name = BloodSmall
    skater ::obj_killspawnedscript name = BloodSplat
    skater ::obj_killspawnedscript name = SkaterBloodOn
    skater ::ResetSkaterParticleSystems
    CutsceneHideUI
    if ScreenElementExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    GoalManager_HidePoints
    GoalManager_HideGoalPoints
    skater ::StatsManager_Deactivate
    GoalManager_SetCanStartGoal 0
    if (<unload_goals> = 1)
        if ((GameModeEquals is_classic)|| (GameModeEquals is_singlesession))
            GoalManager_PauseAllGoals
        else
            if GameModeEquals is_career
                GoalManager_UninitializeAllGoals
            endif
        endif
    endif
    PauseObjects
    PauseSpawnedScripts
    skater ::switchoffatomic skater_m_head
    skater ::switchoffatomic skater_f_head
    skater ::SwitchOnBoard
    skater ::hide
    skater ::StopSkaterVehicleSounds
    KillSpawnedScript name = FadeInCutscene
    if (<unload_anims> = 1)
        if InPreFile 'skaterparts.pre'
            UnloadPreFile 'skaterparts.pre'
            cutscene_skaterparts_unloaded = 1
        endif
        do_unload_unloadable
    endif
    SetSfxReverb 0 mode = REV_MODE_CAVE
    if IsXenon
        SetShadowMapParams near = 100.0 far = 450.0
    endif
    ChangeNodeFlag NODEFLAG_PERMANENT_PEDS 0
    KillAllPedlifeObjects
    KillAllPedMissionObjects
    flushdeadobjects
    UnloadPedPak
    PushShadowVolumeDrawPriority priority = 0.0
    StartDelaySystemUI
endscript

script CutsceneStartVideo 
    if NOT cd
        ReQBRAll
    endif
    CutsceneHideUI
    CutsceneFadeOut \{ time = 0 }
    fake_letterboxing
    igc_temporarily_disable_rendering \{ 2 gameframes }
endscript
cutscene_skaterparts_unloaded = 0

script CutsceneKillObjects 
    if IsArray cutsceneparticletextures
        GetArraySize cutsceneparticletextures
        if (<array_size> = 0)
            printf 'CutsceneParticleTextures array is empty!'
        else
            <index> = 0
            begin 
            <nameString> = (cutsceneparticletextures [ <index> ])
            UnloadTexture <nameString>
            <index> = (<index> + 1)
            repeat <array_size>
        endif
    endif
    if IsArray CutsceneObjectNames
        GetArraySize CutsceneObjectNames
        if (<array_size> = 0)
            printf 'CutsceneObjectNames array is empty!'
        else
            <index> = 0
            begin 
            <name> = (CutsceneObjectNames [ <index> ])
            if CompositeObjectExists name = <name>
                <name> ::Die
            else
            endif
            <index> = (<index> + 1)
            repeat <array_size>
        endif
    endif
    flushdeadobjects
endscript

script PostCutscene 
    PopShadowVolumeDrawPriority
    LoadPedPak
    if NOT GetGlobalFlag flag = CAREER_ONETIMEINTRO
        CreatePedMissionObjects
        ChangeNodeFlag NODEFLAG_PERMANENT_PEDS 1
    endif
    cutscene_subtitle_cleanup
    CutsceneUnhideUI
    SetScreenEffectsDOFParams on = 0
    change update_transition_nodes = 1
    SpawnScriptLater wait_and_check_for_unplugged_controllers
    cutscene_reactivate_tod_manager
    restore_start_key_binding
    skater ::obj_disableambientlight
    TODManager_RestoreCurrentTOD
    SetSfxVolume PreviousSfxLevel
    SetSfxReverb 0 mode = REV_MODE_CAVE
    printf '*** turning skater looping sound ON!!!'
    skater ::SkaterLoopingSound_TurnOn
    printf '***Running scr on all SkaterLoopingSound components - SkaterLoopingSound_TurnOn!!!'
    RunScriptOnComponentType Component = skaterloopingsound target = SkaterLoopingSound_TurnOn
    if (<reload_anims> = 1)
        if (cutscene_skaterparts_unloaded = 1)
            LoadPreFile 'skaterparts.pre'
            change cutscene_skaterparts_unloaded = 0
        endif
        do_load_unloadable
    endif
    fadetoblack Off time = 0.0
    skater ::unhide
    skater ::switchonatomic skater_m_head
    skater ::switchonatomic skater_f_head
    if GotParam RestartNode
        ResetSkaters node_name = <RestartNode>
    endif
    if GameModeEquals is_classic
        ResetSkaters
    endif
    if NOT skater ::IsSkaterOnVehicle
        if NOT GotParam dont_send_skater_to_hand_brake
            if NOT skater ::IsInBail
                if NOT skater ::walking
                    skater ::OnGroundExceptions
                    MakeSkaterGoto HandBrake
                    skater ::stopbalancetrick
                endif
            endif
        endif
    endif
    UnpauseObjects
    UnpauseSpawnedScripts
    GoalManager_ShowPoints
    GoalManager_ShowGoalPoints
    GoalManager_SetCanStartGoal 1
    skater ::StatsManager_Activate
    if (<reload_goals> = 1)
        if ((GameModeEquals is_classic)|| (GameModeEquals is_singlesession))
            GoalManager_UnPauseAllGoals
            show_goal_panel_messages
        else
            if GameModeEquals is_career
                GoalManager_Initializeallgoals
            endif
        endif
    endif
    igc_temporarily_disable_rendering 3 gameframes
    fake_letterboxing remove
    SetSfxReverb 0 mode = REV_MODE_CAVE
    printf '***Unpausing rain sounds!!!'
    unpause_rain <...> 
    if IsXenon
        ResetShadowMapParams
    endif
    if IsNGC
        if GotParam name
            if StringEquals a = <name> b = 'cutscenes\no_7.cut'
                RefreshSkaterModel profile = 0 skater = 0
            endif
        endif
    endif
    change cutscene_is_playing = 0
    AllowBoneLOD allow = 1
    change block_pedspawn = 0
    StopDelaySystemUI
endscript

script cutsceneobj_add_components 
    createcomponentfromstructure Component = cutsceneupdate
    if GotParam cutscenedummy
        return 
    endif
    if GotParam SkeletonName
        createcomponentfromstructure Component = skeleton <...> skeleton = <SkeletonName>
    endif
    if GotParam isBlocking
        if NOT GotParam isskinnedmodel
            createcomponentfromstructure Component = Model <...> usemodellights max_scene_lights = 1 lightkludge
        else
            createcomponentfromstructure Component = Model <...> usemodellights max_scene_lights = 1
        endif
    else
        createcomponentfromstructure Component = Model <...> usemodellights lightkludge
    endif
    createcomponentfromstructure Component = ModelLightUpdate
    if GotParam ShadowVolumeModels
        createcomponentfromstructure Component = shadow ShadowType = volume <...> 
    endif
    if GotParam isBlocking
        if (<isBlocking> = 0)
        endif
    endif
endscript

script cutscene_restore_skater_model_lights 
    printf \{ 'cutscene_restore_skater_model_lights' }
    obj_disableambientlight
    obj_disablediffuselight \{ index = 0 }
    obj_disablediffuselight \{ index = 1 }
endscript

script cutsceneobj_init_model 
    if GotParam isBlocking
        if NOT GotParam cutscenedummy
            if obj_hasmodellights
                if NOT GotParam isskinnedmodel
                    TODManager_GetCurrentTODParams
                    SetLightAmbientColor {
                        r = ((<tod_params>).ambient_red)
                        g = ((<tod_params>).ambient_green)
                        b = ((<tod_params>).ambient_blue)
                    }
                    SetLightDiffuseColor {
                        index = 0
                        r = ((<tod_params>).red_0)
                        g = ((<tod_params>).green_0)
                        b = ((<tod_params>).blue_0)
                    }
                    SetLightDirection {
                        index = 0
                        heading = ((<tod_params>).heading_0)
                        pitch = ((<tod_params>).pitch_0)
                    }
                    SetLightDiffuseColor {
                        index = 1
                        r = ((<tod_params>).red_0)
                        g = ((<tod_params>).green_0)
                        b = ((<tod_params>).blue_0)
                    }
                    SetLightDirection {
                        index = 1
                        heading = ((<tod_params>).heading_1)
                        pitch = ((<tod_params>).pitch_1)
                    }
                    if StructureContains structure = (<tod_params>)indoor
                        <indoor_tod_params> = ((<tod_params>).indoor)
                        SetLightAmbientColor {
                            lightgroup = indoor
                            r = ((<indoor_tod_params>).ambient_red)
                            g = ((<indoor_tod_params>).ambient_green)
                            b = ((<indoor_tod_params>).ambient_blue)
                        }
                        SetLightDiffuseColor {
                            lightgroup = indoor
                            index = 0
                            r = ((<indoor_tod_params>).red_0)
                            g = ((<indoor_tod_params>).green_0)
                            b = ((<indoor_tod_params>).blue_0)
                        }
                        SetLightDirection {
                            lightgroup = indoor
                            index = 0
                            heading = ((<indoor_tod_params>).heading_0)
                            pitch = ((<indoor_tod_params>).pitch_0)
                        }
                        SetLightDiffuseColor {
                            lightgroup = indoor
                            index = 1
                            r = ((<indoor_tod_params>).red_0)
                            g = ((<indoor_tod_params>).green_0)
                            b = ((<indoor_tod_params>).blue_0)
                        }
                        SetLightDirection {
                            lightgroup = indoor
                            index = 1
                            heading = ((<indoor_tod_params>).heading_1)
                            pitch = ((<indoor_tod_params>).pitch_1)
                        }
                    endif
                endif
            endif
        endif
    endif
endscript

script draw_cutscene_panel 
    if ObjectExists id = vo_line1
        SetScreenElementProps {id = vo_line1 text = <line1>}
    else
        create_panel_message id = vo_line1 text = <line1> style = panel_message_viewobj_line params = { xy = (40.0, 60.0) }
        show_panel_messages
    endif
    if ObjectExists id = vo_line2
        SetScreenElementProps {id = vo_line2 text = <line2>}
    else
        create_panel_message id = vo_line2 text = <line2> style = panel_message_viewobj_line params = { xy = (40.0, 80.0) }
        show_panel_messages
    endif
    if (total_fadeout_cutscene_frames_rendered < total_fadeout_cutscene_frames)
        change total_fadeout_cutscene_frames_rendered = (total_fadeout_cutscene_frames_rendered + 1)
        alpha = (total_fadeout_cutscene_frames_rendered / total_fadeout_cutscene_frames)
        if (fadeout_cutscene_direction = 0)
            fadetoblack on time = 0.0 alpha = (<alpha>)
        else
            fadetoblack on time = 0.0 alpha = (1.0 - <alpha>)
        endif
    endif
endscript

script kill_cutscene_panel 
    if ObjectExists \{ id = vo_line1 }
        RunScriptOnScreenElement \{ id = vo_line1 kill_panel_message }
    endif
    if ObjectExists \{ id = vo_line2 }
        RunScriptOnScreenElement \{ id = vo_line2 kill_panel_message }
    endif
endscript

script spawn_next_cutscene 
    PauseObjects
    SpawnScriptLater start_next_cutscene params = { <...>  }
endscript

script start_next_cutscene 
    UnpauseObjects
    PlayCutscene name = <name> unload_anims = <unload_anims> reload_anims = <reload_anims> exitscript = <exitscript>
endscript
camera_hud_is_hidden = 0

script show_cutscene_camera_hud mins = 2 secs = 16 frames = 3
    if ScreenElementExists id = cutscene_camera_hud_anchor
        DestroyScreenElement id = cutscene_camera_hud_anchor
    endif
    if GotParam for_goal
        mins = 0 secs = 0 frames = 0
        rec_alpha = 0
        rec_pos = (500.0, 90.0)
    else
        if GotParam play
            rec_alpha = 0
        else
            rec_alpha = 1
        endif
        rec_pos = (500.0, 50.0)
    endif
    SetScreenElementLock Off id = root_window
    CreateScreenElement {
        type = ContainerElement
        id = cutscene_camera_hud_anchor
        parent = root_window
        Pos = (320.0, 240.0)
        dims = (640.0, 480.0)
    }
    CreateScreenElement {
        type = SpriteElement
        parent = cutscene_camera_hud_anchor
        id = video_screen
        texture = white
        Pos = (320.0, 240.0)
        just = [ center center ]
        Scale = 0
        alpha = 0.3000
    }
    CreateScreenElement {
        type = SpriteElement
        id = camera_hud_line
        parent = cutscene_camera_hud_anchor
        texture = white2
        Pos = (0.0, 0.0)
        just = [ left center ]
        Scale = (100.0, 0.10000000149011612)
        alpha = 0.5000
    }
    if GotParam play
        CreateScreenElement {
            type = TextElement
            parent = cutscene_camera_hud_anchor
            id = play
            Pos = <rec_pos>
            text = 'GRAJ'
            font = small
            just = [ left top ]
            Scale = 1.500
            rgba = [ 100 100 100 128 ]
            alpha = 0.8000
        }
    endif
    CreateScreenElement {
        type = ContainerElement
        id = rec_anchor
        parent = cutscene_camera_hud_anchor
        Pos = (320.0, 240.0)
        dims = (640.0, 480.0)
        alpha = <rec_alpha>
    }
    CreateScreenElement {
        type = TextElement
        parent = rec_anchor
        id = rec
        Pos = <rec_pos>
        text = 'Nagrywaj'
        font = small
        just = [ left top ]
        Scale = 1.500
        rgba = [ 100 0 0 128 ]
        alpha = 0.8000
    }
    GetStackedScreenElementPos x id = rec Offset = (10.0, 16.0)
    CreateScreenElement {
        type = SpriteElement
        id = rec_dot
        parent = rec_anchor
        texture = Circle
        rgba = [ 100 0 0 128 ]
        Pos = <Pos>
        just = [ left center ]
        Scale = 1.500
        alpha = 0.8000
    }
    Scale = 1.500
    alpha = 0.6000
    font = dialog
    CreateScreenElement {
        type = TextElement
        parent = cutscene_camera_hud_anchor
        id = mins2
        Pos = (450.0, 355.0)
        text = '0'
        font = <font>
        just = [ RIGHT top ]
        Scale = <Scale>
        alpha = <alpha>
        rgba = <rgba>
    }
    GetStackedScreenElementPos x id = <id> Offset = (23.0, 0.0)
    CreateScreenElement {
        type = TextElement
        parent = cutscene_camera_hud_anchor
        id = mins
        Pos = <Pos>
        text = '0'
        font = <font>
        just = [ RIGHT top ]
        Scale = <Scale>
        alpha = <alpha>
        rgba = <rgba>
    }
    GetStackedScreenElementPos x id = <id> Offset = (5.0, -2.0)
    CreateScreenElement {
        type = TextElement
        parent = cutscene_camera_hud_anchor
        Pos = <Pos>
        text = ':'
        font = <font>
        just = [ left top ]
        Scale = <Scale>
        alpha = <alpha>
        rgba = <rgba>
    }
    GetStackedScreenElementPos x id = <id> Offset = (23.0, 2.0)
    CreateScreenElement {
        type = TextElement
        parent = cutscene_camera_hud_anchor
        id = secs2
        Pos = <Pos>
        text = '0'
        font = <font>
        just = [ RIGHT top ]
        Scale = <Scale>
        alpha = <alpha>
        rgba = <rgba>
    }
    GetStackedScreenElementPos x id = <id> Offset = (23.0, 0.0)
    CreateScreenElement {
        type = TextElement
        parent = cutscene_camera_hud_anchor
        id = secs
        Pos = <Pos>
        text = '0'
        font = <font>
        just = [ RIGHT top ]
        Scale = <Scale>
        alpha = <alpha>
        rgba = <rgba>
    }
    GetStackedScreenElementPos x id = <id> Offset = (5.0, -2.0)
    CreateScreenElement {
        type = TextElement
        parent = cutscene_camera_hud_anchor
        Pos = <Pos>
        text = ':'
        font = <font>
        just = [ left top ]
        Scale = <Scale>
        alpha = <alpha>
        rgba = <rgba>
    }
    GetStackedScreenElementPos x id = <id> Offset = (23.0, 2.0)
    CreateScreenElement {
        type = TextElement
        parent = cutscene_camera_hud_anchor
        id = frames2
        Pos = <Pos>
        text = '0'
        font = <font>
        just = [ RIGHT top ]
        Scale = <Scale>
        alpha = <alpha>
        rgba = <rgba>
    }
    GetStackedScreenElementPos x id = <id> Offset = (23.0, 0.0)
    CreateScreenElement {
        type = TextElement
        parent = cutscene_camera_hud_anchor
        id = frames
        Pos = <Pos>
        text = '0'
        font = <font>
        just = [ RIGHT top ]
        Scale = <Scale>
        alpha = <alpha>
        rgba = <rgba>
    }
    mins2 = (<mins> / 10)
    mins1 = (<mins> - (<mins2> * 10))
    secs2 = (<secs> / 10)
    secs1 = (<secs> - (<secs2> * 10))
    frames2 = (<frames> / 10)
    frames1 = (<frames> - (<frames2> * 10))
    FormatText textname = min_text '%m' m = <mins1>
    SetScreenElementProps id = mins text = <min_text>
    FormatText textname = min_text '%m' m = <mins2>
    SetScreenElementProps id = mins2 text = <min_text>
    FormatText textname = sec_text '%s' s = <secs1>
    SetScreenElementProps id = secs text = <sec_text>
    FormatText textname = sec_text '%s' s = <secs2>
    SetScreenElementProps id = secs2 text = <sec_text>
    FormatText textname = frame_text '%f' f = <frames1>
    SetScreenElementProps id = frames text = <frame_text>
    FormatText textname = frame_text '%f' f = <frames2>
    SetScreenElementProps id = frames2 text = <frame_text>
    mins ::settags frames = <frames> secs = <secs> mins = <mins>
    if GotParam Fade
        RunScriptOnScreenElement id = rec_dot cutscene_camera_hud_fade_in
    endif
    RunScriptOnScreenElement id = video_screen flicker_video_screen
    RunScriptOnScreenElement id = camera_hud_line morph_camera_hud_line
    RunScriptOnScreenElement id = rec_dot blink_rec_dot
    if NOT GotParam for_goal
        RunScriptOnScreenElement id = secs camera_hud_count
    endif
endscript

script kill_cutscene_camera_hud 
    if GotParam \{ Fade }
        RunScriptOnScreenElement \{id = rec_dot fadetoblack params = { on time = 0.5000 alpha = 1.0 z_priority = 5 }}
        RunScriptOnScreenElement \{ id = rec_dot really_kill_cutscene_camera_hud }
    else
        if ScreenElementExists \{ id = cutscene_camera_hud_anchor }
            DestroyScreenElement \{ id = cutscene_camera_hud_anchor }
        endif
    endif
endscript

script cutscene_camera_hud_fade_in 
    fadetoblack \{ on time = 0 alpha = 1.0 z_priority = 5 }
    wait \{ 0.2000 seconds }
    fadetoblack \{ Off time = 0.5000 }
endscript

script really_kill_cutscene_camera_hud 
    wait \{ 0.7000 seconds }
    fadetoblack \{ Off time = 0 }
    if ScreenElementExists \{ id = cutscene_camera_hud_anchor }
        DestroyScreenElement \{ id = cutscene_camera_hud_anchor }
    endif
endscript

script blink_rec_dot 
    begin 
    DoScreenElementMorph \{ id = rec_dot alpha = 0.8000 }
    wait \{ 0.5000 seconds }
    DoScreenElementMorph \{ id = rec_dot alpha = 0 }
    wait \{ 0.5000 seconds }
    repeat 
endscript

script flicker_video_screen \{ time = 0.05000 }
    begin 
    DoScreenElementMorph id = video_screen alpha = 0.3000 time = <time>
    wait <time> seconds
    DoScreenElementMorph id = video_screen alpha = 0.2250 time = <time>
    wait <time> seconds
    repeat 
endscript

script morph_camera_hud_line \{ time = 1.500 }
    begin 
    DoScreenElementMorph id = camera_hud_line Pos = (0.0, 480.0) time = <time>
    wait <time> seconds
    DoScreenElementMorph \{ id = camera_hud_line Pos = (0.0, 0.0) }
    repeat 
endscript

script camera_hud_count \{ up = 1 }
    if (<up> = 1)
        <action> = camera_hud_count_one
    else
        <action> = camera_hud_count_minus_one
    endif
    begin 
    wait \{ 2 gameframes }
    <action>
    if GotParam \{ done }
        break 
    endif
    repeat 
    mins ::gettags
    <callback> <callback_params>
endscript

script camera_hud_count_one 
    mins ::gettags
    frames = (<frames> + 1)
    if (<frames> > 29)
        frames = 0
        secs = (<secs> + 1)
        if (<secs> > 59)
            secs = 0
            mins = (<mins> + 1)
            mins2 = (<mins> / 10)
            mins1 = (<mins> - (<mins2> * 10))
            FormatText textname = min_text '%m' m = <mins1>
            SetScreenElementProps id = mins text = <min_text>
            FormatText textname = min_text '%m' m = <mins2>
            SetScreenElementProps id = mins2 text = <min_text>
        endif
        secs2 = (<secs> / 10)
        secs1 = (<secs> - (<secs2> * 10))
        FormatText textname = sec_text '%s' s = <secs1>
        SetScreenElementProps id = secs text = <sec_text>
        FormatText textname = sec_text '%s' s = <secs2>
        SetScreenElementProps id = secs2 text = <sec_text>
    endif
    frames2 = (<frames> / 10)
    frames1 = (<frames> - (<frames2> * 10))
    FormatText textname = frame_text '%f' f = <frames1>
    SetScreenElementProps id = frames text = <frame_text>
    FormatText textname = frame_text '%f' f = <frames2>
    SetScreenElementProps id = frames2 text = <frame_text>
    mins ::settags frames = <frames> secs = <secs> mins = <mins>
endscript

script camera_hud_count_minus_one 
    mins ::gettags
    if (<mins> < 1)
        if (<secs> < 1)
            if (<frames> < 1)
                return done = done
            endif
        endif
    endif
    frames = (<frames> - 1)
    if (<frames> < 0)
        frames = 29
        secs = (<secs> - 1)
        if (<secs> < 0)
            secs = 59
            mins = (<mins> - 1)
            mins2 = (<mins> / 10)
            mins1 = (<mins> - (<mins2> * 10))
            FormatText textname = min_text '%m' m = <mins1>
            SetScreenElementProps id = mins text = <min_text>
            FormatText textname = min_text '%m' m = <mins2>
            SetScreenElementProps id = mins2 text = <min_text>
        endif
        secs2 = (<secs> / 10)
        secs1 = (<secs> - (<secs2> * 10))
        FormatText textname = sec_text '%s' s = <secs1>
        SetScreenElementProps id = secs text = <sec_text>
        FormatText textname = sec_text '%s' s = <secs2>
        SetScreenElementProps id = secs2 text = <sec_text>
    endif
    frames2 = (<frames> / 10)
    frames1 = (<frames> - (<frames2> * 10))
    FormatText textname = frame_text '%f' f = <frames1>
    SetScreenElementProps id = frames text = <frame_text>
    FormatText textname = frame_text '%f' f = <frames2>
    SetScreenElementProps id = frames2 text = <frame_text>
    mins ::settags frames = <frames> secs = <secs> mins = <mins>
endscript

script really_kill_cutscene_hangover_hud 
    SetScreenBlur \{ 0 }
    wait \{ 0.7000 seconds }
    fadetoblack \{ Off time = 0 }
    if ScreenElementExists \{ id = cutscene_hangover_hud_anchor }
        DestroyScreenElement \{ id = cutscene_hangover_hud_anchor }
    endif
endscript

script flicker_textintro \{ time = 0.05000 }
    begin 
    DoScreenElementMorph id = peralta_name alpha = 1 time = <time> Pos = (150.0, 189.0)
    wait <time> seconds
    DoScreenElementMorph id = peralta_name alpha = 0.7000 time = <time> Pos = (150.0, 190.0)
    wait <time> seconds
    repeat 
endscript

script flicker_skullintro \{ time = 0.05000 }
    begin 
    DoScreenElementMorph id = bg_icon alpha = 1 time = <time>
    wait <time> seconds
    DoScreenElementMorph id = bg_icon alpha = 0.7000 time = <time>
    wait <time> seconds
    repeat 
endscript

script make_black_in 
    CreateScreenElement \{type = SpriteElement parent = root_window id = videointro_black3 texture = black Pos = (320.0, 240.0) just = [ center center ] Scale = (200.0, 200.0) rgba = [ 0 0 0 128 ] z_priority = -5 alpha = 0 z_priority = 4560040}
    DoScreenElementMorph \{ id = videointro_black3 alpha = 1 time = 0 }
endscript

script make_black_out 
    DoScreenElementMorph \{ id = videointro_black3 alpha = 0 time = 0.5000 }
endscript

script make_black_in2 
    CreateScreenElement \{type = SpriteElement parent = root_window id = videointro_black4 texture = black Pos = (320.0, 240.0) just = [ center center ] Scale = (200.0, 200.0) rgba = [ 0 0 0 128 ] z_priority = -5 alpha = 0 z_priority = 160080}
    DoScreenElementMorph \{ id = videointro_black4 alpha = 1 time = 0 }
endscript

script make_black_out2 
    DoScreenElementMorph \{ id = videointro_black4 alpha = 0 time = 0 }
endscript

script underground_fly_in 
    wait \{ 1 second }
    DoScreenElementMorph \{ id = under_1 alpha = 0 time = 0 Scale = 8 }
    DoScreenElementMorph \{ id = under_1 alpha = 0.9000 time = 0.3000 Scale = 3 }
    wait \{ 4.500 second }
    DoScreenElementMorph \{ id = under_1 alpha = 0 Scale = (20.0, 3.0) time = 0.2000 }
endscript

script underground_fly_in2 
    wait \{ 1 second }
    DoScreenElementMorph \{ id = under_2 alpha = 0 time = 0 Pos = (700.0, 190.0) }
    DoScreenElementMorph \{ id = under_2 alpha = 0.9000 time = 0.4000 Pos = (52.0, 190.0) }
    wait \{ 3.0 second }
    DoScreenElementMorph \{ id = under_2 alpha = 0 time = 0.2000 }
endscript

script skater_name_fly_1 
    DoScreenElementMorph \{ id = skater_name_1 alpha = 0 time = 0 Pos = (700.0, 70.0) }
    DoScreenElementMorph \{id = skater_name_1 alpha = 0.6000 time = 6.200 Scale = (5.0, 5.0) Pos = (-650.0, 70.0)}
endscript

script skater_name_fly_2 
    DoScreenElementMorph \{ id = skater_name_2 alpha = 0 time = 0 Pos = (-200.0, 270.0) }
    DoScreenElementMorph \{ id = skater_name_2 alpha = 0.5000 time = 5.800 Pos = (1000.0, 270.0) }
endscript

script skater_name_fly_3 
    DoScreenElementMorph \{ id = skater_name_3 alpha = 0 time = 0 Pos = (300.0, 600.0) }
    DoScreenElementMorph \{ id = skater_name_3 alpha = 0.5500 time = 6.400 Pos = (300.0, -600.0) }
endscript

script skater_name_fly_4 
    DoScreenElementMorph \{ id = skater_name_4 alpha = 0 time = 0 Pos = (100.0, -600.0) }
    DoScreenElementMorph \{id = skater_name_4 alpha = 0.4000 time = 6.200 Scale = (4.800000190734863, 4.800000190734863) Pos = (100.0, 600.0)}
endscript

script skater_name_fly_5 
    wait \{ 2 second }
    DoScreenElementMorph \{id = skater_name_5 alpha = 0.7000 time = 0 Scale = 9 Pos = (320.0, 170.0)}
    DoScreenElementMorph \{id = skater_name_5 alpha = 0 time = 3.500 Scale = 0 Pos = (320.0, 170.0)}
endscript

script star_fly_1 
    wait \{ 1 second }
    DoScreenElementMorph \{id = understar_1 alpha = 0.5000 time = 0 Pos = (730.0, 210.0) rot_angle = 0}
    DoScreenElementMorph \{id = understar_1 alpha = 0.9500 time = 2.800 Scale = (2.299999952316284, 2.299999952316284) Pos = (-250.0, 210.0) rot_angle = 720}
endscript

script star_fly_2 
    wait \{ 1.500 second }
    DoScreenElementMorph \{id = understar_2 alpha = 0.5000 time = 0 Pos = (-250.0, 210.0) rot_angle = 0}
    DoScreenElementMorph \{id = understar_2 alpha = 0.8000 time = 1.800 Scale = (2.299999952316284, 2.299999952316284) Pos = (720.0, 210.0) rot_angle = -720}
endscript

script fadeinout 
    wait \{ 0.6000 second }
    DoScreenElementMorph \{ id = underground_black2 alpha = 0 time = 0 }
    DoScreenElementMorph \{ id = underground_black2 alpha = 1 time = 0.2000 }
    DoScreenElementMorph \{ id = underground_black2 alpha = 0 time = 0.1000 }
endscript

script GetTeamNames 
    GoalManager_GetTeam
    GetArraySize master_skater_list
    index = 0
    index2 = 0
    begin 
    name = (master_skater_list [ <index> ].name)
    if StructureContains structure = <team> <name>
        switch <index2>
            case 0
            team_name1 = (master_skater_list [ <index> ].display_name)
            case 1
            team_name2 = (master_skater_list [ <index> ].display_name)
            case 2
            team_name3 = (master_skater_list [ <index> ].display_name)
            case 3
            team_name4 = (master_skater_list [ <index> ].display_name)
            case 4
            team_name5 = (master_skater_list [ <index> ].display_name)
            default 
            return 
        endswitch
        index2 = (<index2> + 1)
    endif
    index = (<index> + 1)
    repeat <array_size>
    RemoveParameter name
    RemoveParameter team
    RemoveParameter num_team_members
    RemoveParameter index
    RemoveParameter index2
    RemoveParameter array_size
    return <...> 
endscript

script play_cutscene 
    if IsObjectScript
        obj_getid
        printf '*******************************************************'
        printf 'Cutscenes should not be launched from object scripts...'
        printf 'Object = %s' s = <ObjID>
        printf 'Spawning cutscene instead, to be played on the following frame'
        printf '*******************************************************'
        SpawnScriptLater play_cutscene_from_gameplay params = { <...>  }
    else
        PlayCutscene <...> 
    endif
endscript

script play_cutscene_from_gameplay 
    if NOT GotParam \{ name }
        script_assert \{ 'missing name parameter for cutscene' }
    endif
    PlayCutscene <...> 
endscript

script cutscene_deactivate_tod_manager 
    TODManager_GetCurrentTODParams
    <active> = (<tod_params>.active)
    change TODManagerActiveBeforeCutscene = <active>
    TODManager_SetActive \{ 0 }
endscript

script cutscene_reactivate_tod_manager 
    if IsTrue \{ TODManagerActiveBeforeCutscene }
        TODManager_SetActive \{ 1 }
    endif
    GlobalEffects_ClearState \{ id = pulse_bloom }
endscript

script cutscene_pause 
    printf \{ 'cutscene_pause' }
    PauseCutscene \{ toggle }
endscript

script cutscene_kill_spawned_script 
    KillSpawnedScript id = <id>
endscript

script destroy_digital_timer 
    if ScreenElementExists \{ id = digital_timer_anchor }
        DestroyScreenElement \{ id = digital_timer_anchor }
    endif
endscript

script cutscene_unload_pak_file 
    Cutscene_BeginUnloadPak anim_pak_index = <anim_pak_index>
    wait \{ 2 frames }
    Cutscene_EndUnloadPak anim_pak_index = <anim_pak_index>
    Cutscene_PakFileUnloaded <...> 
endscript

script cutscene_error 
    if (IsTrue <readerror>)
        create_snazzy_dialog_box \{ text = 'Nast¹pi³ b³¹d odczytu z dysku. Proszê czekaæ, trwa próba odzyskania.' Title = 'B³¹d' }
    endif
    if (IsTrue <FatalReadError>)
        dialog_box_exit
    endif
    if (IsTrue <readerrorrecovery>)
        dialog_box_exit
    endif
endscript

script cutscene_subtitle_create 
    if GetGlobalFlag flag = NO_DISPLAY_CUTSCENE_SUBTITLES
        return 
    endif
    if NOT GotParam text
        return 
    endif
    if GotParam duration
        <duration> = (<duration> * 1000)
    endif
    <font> = small
    <Scale> = (0.8500000238418579, 0.8500000238418579)
    create_panel_block {
        id = cutscene_subtitle
        text = <text>
        font_face = <font>
        rgba = [ 128 128 128 128 ]
        Pos = (320.0, 390.0)
        time = <duration>
        dims = (800.0, 0.0)
        just = [ center top ]
        Scale = <Scale>
        internal_just = [ center top ]
        parent = root_window
        z_priority = 15
    }
endscript

script cutscene_subtitle_cleanup 
    if ScreenElementExists \{ id = cutscene_subtitle }
        DestroyScreenElement \{ id = cutscene_subtitle }
    endif
endscript
