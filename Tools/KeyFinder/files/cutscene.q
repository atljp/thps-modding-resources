
PreviousSfxLevel = 0
cutscene_frame_advance_delay = 10
todmanager_temp_tod_changed = 0
TODManagerActiveBeforeCutscene = 0

script CutsceneFadeIn time = 0.0
    if IsTrue output_cutscene_video
        
        return 
    endif
    
    KillSpawnedScript name = FadeInCutscene
    SpawnScript FadeInCutscene params = { fadein_time = <time> }
endscript


script CutsceneFadeOut time = 0.0
    if IsTrue output_cutscene_video
        
        return 
    endif
    
    FadeOutCutscene fadeout_time = <time>
endscript


script FadeInCutscene 
    if NOT GotParam fadein_time
        script_assert 'no fadein time'
    endif
    if NOT (<fadein_time> = 0)
        fadetoblack on time = 0.0 alpha = 1.0
        fadetoblack Off time = <fadein_time>
    else
        fadetoblack Off time = 0.0
    endif
endscript


script FadeOutCutscene 
    KillSpawnedScript name = FadeInCutscene
    if NOT GotParam fadeout_time
        script_assert 'no fadeout time'
    endif
    fadetoblack on time = <fadeout_time> alpha = 1.0
endscript

last_screen_mode = standard_screen_mode

script CutsceneDestroyUI 
    ScreenElementSystemCleanup no_panel_stuff
    kill_start_key_binding
endscript


script CutsceneRestoreUI 
    ScreenElementSystemCleanup
endscript


script CutsceneHideUI 
    if NOT GameModeEquals is_classic
        ResetScore
    endif
    speech_box_exit { anchor_id = goal_start_dialog no_pad_start }
    pause_bloom_on
    hide_all_hud_items dont_disable_screen_effects
    toggle_bullettime
    TODManager_SetTempBloomParams on = 0
    setslomo 1
    menu3d_hide
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
    skater ::switchonatomic skater_m_head
    skater ::switchonatomic skater_f_head
endscript

cutscene_is_playing = 0

script PreCutscene 
    change cutscene_is_playing = 1
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
    
    if issoundplaying TestLight01
        
        setsoundparams TestLight01 vol = 0
    endif
    if issoundplaying TestLight02
        
        setsoundparams TestLight02 vol = 0
    endif
    if issoundplaying TestMedium02
        
        setsoundparams TestMedium02 vol = 0
    endif
    
    pause_rain
    
    StopStream
    skater ::SkaterLoopingSound_TurnOff
    
    RunScriptOnComponentType Component = skaterloopingsound target = SkaterLoopingSound_TurnOff
    
    SetSfxVolume 0
    
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
    skater ::statsmanager_deactivategoals
    GoalManager_SetCanStartGoal 0
    if (<unload_goals> = 1)
        if ((GameModeEquals is_classic)|| (GameModeEquals is_singlesession)|| (GameModeEquals is_creategoals))
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
    if IsNGC
        unload_current_theme
    endif
    SetSfxReverb 0 mode = REV_MODE_CAVE
endscript


script CutsceneStartVideo 
    CutsceneHideUI
    CutsceneFadeOut time = 0
    switch (current_screen_mode)
        case standard_screen_mode
        cutscene_fake_letterboxing
        change last_screen_mode = standard_screen_mode
        case widescreen_screen_mode
        change last_screen_mode = widescreen_screen_mode
        case letterbox_screen_mode
        change last_screen_mode = letterbox_screen_mode
        default 
        
        script_assert 'Unrecognized screen mode'
    endswitch
endscript

cutscene_skaterparts_unloaded = 0

script CutsceneKillObjects 
    if IsArray cutsceneparticletextures
        GetArraySize cutsceneparticletextures
        if (<array_size> = 0)
            
        else
            <index> = 0
            begin 
            <nameString> = (cutsceneparticletextures [ <index> ])
            UnloadParticleTexture <nameString>
            <index> = (<index> + 1)
            repeat <array_size>
        endif
    endif
    if IsArray CutsceneObjectNames
        GetArraySize CutsceneObjectNames
        if (<array_size> = 0)
            
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
    cutscene_subtitle_cleanup
    CutsceneUnhideUI
    SetScreenEffectsDOFParams on = 0
    SpawnScript wait_and_check_for_unplugged_controllers
    cutscene_reactivate_tod_manager
    restore_start_key_binding
    skater ::obj_disableambientlight
    TODManager_RestoreCurrentTOD
    SetSfxVolume PreviousSfxLevel
    SetSfxReverb 0 mode = REV_MODE_CAVE
    
    skater ::SkaterLoopingSound_TurnOn
    
    RunScriptOnComponentType Component = skaterloopingsound target = SkaterLoopingSound_TurnOn
    if IsNGC
        reload_current_theme
    endif
    if (<reload_anims> = 1)
        if (cutscene_skaterparts_unloaded = 1)
            LoadPreFile 'skaterparts.pre'
            change cutscene_skaterparts_unloaded = 0
        endif
        do_load_unloadable
    endif
    fadetoblack Off time = 0.0
    kill_cutscene_camera_hud
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
    skater ::StatsManager_ActivateGoals
    if (<reload_goals> = 1)
        if ((GameModeEquals is_classic)|| (GameModeEquals is_singlesession)|| (GameModeEquals is_creategoals))
            GoalManager_UnPauseAllGoals
            show_goal_panel_messages
        else
            if GameModeEquals is_career
                GoalManager_Initializeallgoals
            endif
        endif
    else
        if IsXbox
            DisplayLoadingScreen freeze
        else
            DisplayLoadingScreen blank
        endif
    endif
    switch (last_screen_mode)
        case standard_screen_mode
        cutscene_fake_letterboxing remove
        case widescreen_screen_mode
        case letterbox_screen_mode
        default 
        
        script_assert 'Unrecognized screen mode'
    endswitch
    SetSfxReverb 0 mode = REV_MODE_CAVE
    
    unpause_rain <...> 
    if IsNGC
        if GotParam name
            if StringEquals a = <name> b = 'cutscenes\no_7.cut'
                RefreshSkaterModel profile = 0 skater = 0
            endif
        endif
    endif
    change cutscene_is_playing = 0
    AllowBoneLOD allow = 1
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
            createcomponentfromstructure Component = Model <...> usemodellights max_scene_lights = 1
        else
            createcomponentfromstructure Component = Model <...> usemodellights max_scene_lights = 1
        endif
    else
        createcomponentfromstructure Component = Model <...> 
    endif
    if GotParam isBlocking
        if (<isBlocking> = 0)
        endif
    endif
endscript


script cutscene_restore_skater_model_lights 
    
    obj_disableambientlight
    obj_disablediffuselight index = 0
    obj_disablediffuselight index = 1
endscript


script cutsceneobj_init_model 
    if GotParam isBlocking
        if NOT GotParam cutscenedummy
            if obj_hasmodellights
                if NOT GotParam isskinnedmodel
                    TODManager_GetCurrentTODParams
                    obj_setlightambientcolor {
                        r = ((<tod_params>).ambient_red)
                        g = ((<tod_params>).ambient_green)
                        b = ((<tod_params>).ambient_blue)
                    }
                    obj_setlightdiffusecolor {
                        index = 0
                        r = ((<tod_params>).red_0)
                        g = ((<tod_params>).green_0)
                        b = ((<tod_params>).blue_0)
                    }
                    obj_setlightdirection {
                        index = 0
                        heading = ((<tod_params>).heading_0)
                        pitch = ((<tod_params>).pitch_0)
                    }
                    obj_setlightdiffusecolor {
                        index = 1
                        r = ((<tod_params>).red_0)
                        g = ((<tod_params>).green_0)
                        b = ((<tod_params>).blue_0)
                    }
                    obj_setlightdirection {
                        index = 1
                        heading = ((<tod_params>).heading_1)
                        pitch = ((<tod_params>).pitch_1)
                    }
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
    endif
    if ObjectExists id = vo_line2
        SetScreenElementProps {id = vo_line2 text = <line2>}
    else
        create_panel_message id = vo_line2 text = <line2> style = panel_message_viewobj_line params = { xy = (40.0, 80.0) }
    endif
endscript


script kill_cutscene_panel 
    if ObjectExists id = vo_line1
        RunScriptOnScreenElement id = vo_line1 kill_panel_message
    endif
    if ObjectExists id = vo_line2
        RunScriptOnScreenElement id = vo_line2 kill_panel_message
    endif
endscript


script spawn_next_cutscene 
    PauseObjects
    SpawnScript start_next_cutscene params = { <...>  }
endscript


script start_next_cutscene 
    if GotParam Tod_Action
        DisplayLoadingScreen freeze
    endif
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
        texture = videoscreen
        Pos = (320.0, 240.0)
        just = [ center center ]
        Scale = (5.0, 10.0)
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
            text = 'PLAY'
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
        text = 'REC'
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
        texture = recdot
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
    if GotParam Fade
        RunScriptOnScreenElement id = rec_dot fadetoblack params = {on time = 0.5000 alpha = 1.0 z_priority = 5}
        RunScriptOnScreenElement id = rec_dot really_kill_cutscene_camera_hud
    else
        if ScreenElementExists id = cutscene_camera_hud_anchor
            DestroyScreenElement id = cutscene_camera_hud_anchor
        endif
    endif
endscript


script cutscene_camera_hud_fade_in 
    fadetoblack on time = 0 alpha = 1.0 z_priority = 5
    wait 0.2000 seconds
    fadetoblack Off time = 0.5000
endscript


script really_kill_cutscene_camera_hud 
    wait 0.7000 seconds
    fadetoblack Off time = 0
    if ScreenElementExists id = cutscene_camera_hud_anchor
        DestroyScreenElement id = cutscene_camera_hud_anchor
    endif
endscript


script hide_cutscene_camera_hud 
    if ScreenElementExists id = cutscene_camera_hud_anchor
        DoScreenElementMorph id = cutscene_camera_hud_anchor alpha = 0
    endif
endscript


script unhide_cutscene_camera_hud 
    if ScreenElementExists id = cutscene_camera_hud_anchor
        DoScreenElementMorph id = cutscene_camera_hud_anchor alpha = 1
    endif
endscript


script blink_rec_dot 
    begin 
    DoScreenElementMorph id = rec_dot alpha = 0.8000
    wait 0.5000 seconds
    DoScreenElementMorph id = rec_dot alpha = 0
    wait 0.5000 seconds
    repeat 
endscript


script flicker_video_screen time = 0.05000
    begin 
    DoScreenElementMorph id = video_screen alpha = 0.3000 time = <time>
    wait <time> seconds
    DoScreenElementMorph id = video_screen alpha = 0.2250 time = <time>
    wait <time> seconds
    repeat 
endscript


script morph_camera_hud_line time = 1.500
    begin 
    DoScreenElementMorph id = camera_hud_line Pos = (0.0, 480.0) time = <time>
    wait <time> seconds
    DoScreenElementMorph id = camera_hud_line Pos = (0.0, 0.0)
    repeat 
endscript


script camera_hud_count up = 1
    if (<up> = 1)
        <action> = camera_hud_count_one
    else
        <action> = camera_hud_count_minus_one
    endif
    begin 
    wait 2 gameframes
    <action>
    if GotParam done
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


script camera_hud_breakup_frames 
    if NOT ScreenElementExists id = mins
        return 
    endif
    if (<millisecs> > 60000)
        mins = (<millisecs> / 6000)
        millisecs = (<millisecs> - (<mins> * 6000))
    else
        mins = 0
    endif
    if (<millisecs> > 1000)
        secs = (<millisecs> / 1000)
        millisecs = (<millisecs> - (<secs> * 1000))
    else
        secs = 0
    endif
    frames = (<millisecs> / 17)
    mins2 = (<mins> / 10)
    mins1 = (<mins> - (<mins2> * 10))
    FormatText textname = min_text '%m' m = <mins1>
    SetScreenElementProps id = mins text = <min_text>
    FormatText textname = min_text '%m' m = <mins2>
    SetScreenElementProps id = mins2 text = <min_text>
    secs2 = (<secs> / 10)
    secs1 = (<secs> - (<secs2> * 10))
    FormatText textname = sec_text '%s' s = <secs1>
    SetScreenElementProps id = secs text = <sec_text>
    FormatText textname = sec_text '%s' s = <secs2>
    SetScreenElementProps id = secs2 text = <sec_text>
    frames2 = (<frames> / 10)
    frames1 = (<frames> - (<frames2> * 10))
    FormatText textname = frame_text '%f' f = <frames1>
    SetScreenElementProps id = frames text = <frame_text>
    FormatText textname = frame_text '%f' f = <frames2>
    SetScreenElementProps id = frames2 text = <frame_text>
endscript


script really_kill_cutscene_hangover_hud 
    SetScreenBlur 0
    wait 0.7000 seconds
    fadetoblack Off time = 0
    if ScreenElementExists id = cutscene_hangover_hud_anchor
        DestroyScreenElement id = cutscene_hangover_hud_anchor
    endif
endscript


script show_videointro_hud 
    if ScreenElementExists id = videointro_hud_anchor
        DestroyScreenElement id = videointro_hud_anchor
    endif
    SetScreenElementLock Off id = root_window
    CreateScreenElement {
        type = ContainerElement
        id = videointro_hud_anchor
        parent = root_window
        Pos = (320.0, 240.0)
        dims = (640.0, 480.0)
    }
    CreateScreenElement {
        type = SpriteElement
        parent = videointro_hud_anchor
        id = videointro_black
        texture = black
        Pos = (320.0, 240.0)
        just = [ center center ]
        Scale = (200.0, 200.0)
        rgba = [ 0 0 0 128 ]
        z_priority = -5
        alpha = 1
        z_priority = 50000
    }
    CreateScreenElement {
        type = SpriteElement
        parent = videointro_hud_anchor
        id = bg_icon
        texture = go_fail
        Pos = (320.0, 250.0)
        just = [ center center ]
        Scale = (1.2000000476837158, 1.2000000476837158)
        rgba = [ 128 128 128 10 ]
        z_priority = 500013
        rot_angle = 5
    }
    CreateScreenElement {
        type = TextElement
        parent = videointro_hud_anchor
        id = peralta_name
        Pos = (150.0, 190.0)
        text = 'Peralta Productions Presents'
        font = dialog
        just = [ left , top ]
        Scale = 1.100
        rgba = [ 128 128 128 100 ]
        z_priority = 1397
        z_priority = 50004
    }
    RunScriptOnScreenElement id = peralta_name flicker_textintro
    RunScriptOnScreenElement id = bg_icon flicker_skullintro
endscript


script videointro_hud_fade_in 
    SetScreenBlur 70
    fadetoblack on time = 0 alpha = 1.0 z_priority = 10000
    make_black_in2
    wait 1.400 seconds
    show_videointro_hud
    make_black_out2
    wait 0.2000 seconds
    fadetoblack Off time = 0.5000
endscript


script really_kill_videointro_hud 
    SetScreenBlur 1
    make_black_out2
    fadetoblack Off time = 0.3000
    if ScreenElementExists id = videointro_hud_anchor
        DestroyScreenElement id = videointro_hud_anchor
    endif
endscript


script flicker_textintro time = 0.05000
    begin 
    DoScreenElementMorph id = peralta_name alpha = 1 time = <time> Pos = (150.0, 189.0)
    wait <time> seconds
    DoScreenElementMorph id = peralta_name alpha = 0.7000 time = <time> Pos = (150.0, 190.0)
    wait <time> seconds
    repeat 
endscript


script flicker_skullintro time = 0.05000
    begin 
    DoScreenElementMorph id = bg_icon alpha = 1 time = <time>
    wait <time> seconds
    DoScreenElementMorph id = bg_icon alpha = 0.7000 time = <time>
    wait <time> seconds
    repeat 
endscript


script show_videointro_hud2 
    if ScreenElementExists id = videointro_hud_anchor2
        DestroyScreenElement id = videointro_hud_anchor2
    endif
    SetScreenElementLock Off id = root_window
    CreateScreenElement {
        type = ContainerElement
        id = videointro_hud_anchor2
        parent = root_window
        Pos = (320.0, 240.0)
        dims = (640.0, 480.0)
        z_priority = 50
    }
    CreateScreenElement {
        type = SpriteElement
        parent = videointro_hud_anchor2
        id = videointro_black2
        texture = black
        Pos = (320.0, 240.0)
        just = [ center center ]
        Scale = (200.0, 200.0)
        rgba = [ 0 0 0 128 ]
        z_priority = -5
        alpha = 1
        z_priority = 50000
    }
    CreateScreenElement {
        type = SpriteElement
        parent = videointro_hud_anchor2
        id = star1
        texture = PA_goals
        Pos = (100.0, 110.0)
        just = [ center center ]
        Scale = (2.0, 2.0)
        rgba = [ 0 0 0 128 ]
        alpha = 0.8000
        rot_angle = -3
        z_priority = 50003
    }
    CreateScreenElement {
        type = SpriteElement
        parent = videointro_hud_anchor2
        id = star2
        texture = PA_goals
        Pos = (480.0, 310.0)
        just = [ center center ]
        Scale = (2.0, 2.0)
        rgba = [ 0 0 0 128 ]
        alpha = 0.9000
        rot_angle = -7
        z_priority = 50004
    }
    CreateScreenElement {
        type = SpriteElement
        parent = videointro_hud_anchor2
        id = star3
        texture = PA_goals
        Pos = (430.0, 120.0)
        just = [ center center ]
        Scale = (1.2999999523162842, 1.2999999523162842)
        rgba = [ 0 0 0 128 ]
        alpha = 0.8000
        rot_angle = 18
        z_priority = 50004
    }
    GoalManager_GetTeam
    CreateScreenElement {
        type = TextElement
        parent = videointro_hud_anchor2
        id = team name
        Pos = (310.0, 190.0)
        text = (<team>.team_name)
        font = small
        just = [ center top ]
        Scale = 2.200
        rgba = [ 128 77 0 100 ]
        z_priority = 50008
    }
    CreateScreenElement {
        type = TextElement
        parent = videointro_hud_anchor2
        id = a
        Pos = (110.0, 120.0)
        text = 'A'
        font = dialog
        just = [ left , top ]
        Scale = 1.500
        rgba = [ 128 73 0 88 ]
        z_priority = 50009
    }
    CreateScreenElement {
        type = TextElement
        parent = videointro_hud_anchor2
        id = videoname
        Pos = (420.0, 245.0)
        text = 'VIDEO'
        font = dialog
        just = [ left , top ]
        Scale = 2.500
        rgba = [ 128 73 0 78 ]
        z_priority = 50009
    }
endscript


script videointro_hud_fade_in2 
    SetScreenBlur 20
    fadetoblack on time = 0 alpha = 1.0 z_priority = 100000
    make_black_in
    wait 0.02500 seconds
    show_videointro_hud2
    make_black_out
    wait 0.2000 seconds
    fadetoblack Off time = 0.2000
endscript


script really_kill_videointro_hud2 
    SetScreenBlur 4
    if ScreenElementExists id = videointro_hud_anchor2
        DestroyScreenElement id = videointro_hud_anchor2
    endif
endscript


script make_black_in 
    CreateScreenElement {
        type = SpriteElement
        parent = root_window
        id = videointro_black3
        texture = black
        Pos = (320.0, 240.0)
        just = [ center center ]
        Scale = (200.0, 200.0)
        rgba = [ 0 0 0 128 ]
        z_priority = -5
        alpha = 0
        z_priority = 4560040
    }
    DoScreenElementMorph id = videointro_black3 alpha = 1 time = 0
endscript


script kill_black 
    DestroyScreenElement id = videointro_black3
endscript


script make_black_out 
    DoScreenElementMorph id = videointro_black3 alpha = 0 time = 0.5000
endscript


script make_black_in2 
    CreateScreenElement {
        type = SpriteElement
        parent = root_window
        id = videointro_black4
        texture = black
        Pos = (320.0, 240.0)
        just = [ center center ]
        Scale = (200.0, 200.0)
        rgba = [ 0 0 0 128 ]
        z_priority = -5
        alpha = 0
        z_priority = 160080
    }
    DoScreenElementMorph id = videointro_black4 alpha = 1 time = 0
endscript


script make_black_out2 
    DoScreenElementMorph id = videointro_black4 alpha = 0 time = 0
endscript


script kill_black2 
    DestroyScreenElement id = videointro_black4
endscript


script show_underground_hud 
    if ScreenElementExists id = underground_hud_anchor
        DestroyScreenElement id = underground_hud_anchor
    endif
    SetScreenElementLock Off id = root_window
    CreateScreenElement {
        type = ContainerElement
        id = underground_hud_anchor
        parent = root_window
        Pos = (320.0, 240.0)
        dims = (640.0, 480.0)
    }
    CreateScreenElement {
        type = SpriteElement
        parent = underground_hud_anchor
        id = underground_black
        texture = white2
        Pos = (-30.0, 63.0)
        just = [ top left ]
        Scale = (100.0, 38.20000076293945)
        rgba = [ 2 8 12 128 ]
        z_priority = -5
        alpha = 1
        z_priority = 1000000
    }
    CreateScreenElement {
        type = SpriteElement
        parent = underground_hud_anchor
        id = underground_black2
        texture = white2
        Pos = (240.0, 63.0)
        just = [ center center ]
        Scale = (100.0, 200.0)
        rgba = [ 0 0 0 128 ]
        z_priority = -5
        alpha = 1
        z_priority = 100000000
    }
    CreateScreenElement {
        type = TextElement
        parent = underground_hud_anchor
        id = under_1
        Pos = (52.0, 190.0)
        text = 'UNDERGROUND'
        font = testtitle
        just = [ left , top ]
        Scale = (2)
        rgba = [ 114 23 13 128 ]
        alpha = 0
        z_priority = 10000003
    }
    CreateScreenElement {
        type = TextElement
        parent = underground_hud_anchor
        id = under_2
        Pos = (52.0, 190.0)
        text = 'UNDERGROUND'
        font = testtitle
        just = [ left , top ]
        Scale = (3)
        rgba = [ 60 60 60 98 ]
        alpha = 0
        z_priority = 10000003
    }
    CreateScreenElement {
        type = SpriteElement
        parent = underground_hud_anchor
        id = understar_1
        texture = PA_goals
        Pos = (730.0, 210.0)
        just = [ center center ]
        Scale = (1.2999999523162842, 1.2999999523162842)
        rgba = [ 128 0 0 128 ]
        alpha = 1
        rot_angle = 18
        z_priority = 10000001
    }
    CreateScreenElement {
        type = SpriteElement
        parent = underground_hud_anchor
        id = understar_2
        texture = PA_goals
        Pos = (-250.0, 210.0)
        just = [ center center ]
        Scale = (1.2999999523162842, 1.2999999523162842)
        rgba = [ 128 0 0 128 ]
        alpha = 1
        rot_angle = 18
        z_priority = 10000001
    }
    GetTeamNames
    CreateScreenElement {
        type = TextElement
        parent = underground_hud_anchor
        id = skater_name_1
        Pos = (52.0, 70.0)
        text = <team_name1>
        font = small
        just = [ left , top ]
        Scale = (1.2999999523162842, 2.0)
        rgba = [ 80 80 80 98 ]
        z_priority = 10000001
    }
    CreateScreenElement {
        type = TextElement
        parent = underground_hud_anchor
        id = skater_name_2
        Pos = (-200.0, 270.0)
        text = <team_name2>
        font = small
        just = [ left , top ]
        Scale = (1.600000023841858, 2.200000047683716)
        rgba = [ 80 80 80 98 ]
        z_priority = 10000001
    }
    CreateScreenElement {
        type = TextElement
        parent = underground_hud_anchor
        id = skater_name_3
        Pos = (300.0, 600.0)
        text = <team_name3>
        font = small
        just = [ left , top ]
        Scale = (2.299999952316284, 3.0)
        rgba = [ 80 80 80 98 ]
        z_priority = 10000001
    }
    CreateScreenElement {
        type = TextElement
        parent = underground_hud_anchor
        id = skater_name_4
        Pos = (100.0, -600.0)
        text = <team_name4>
        font = small
        just = [ left , top ]
        Scale = (1.2999999523162842, 2.0)
        rgba = [ 80 80 80 98 ]
        z_priority = 10000001
    }
    CreateScreenElement {
        type = TextElement
        parent = underground_hud_anchor
        id = skater_name_5
        Pos = (320.0, 170.0)
        text = <team_name5>
        font = small
        just = [ center , center ]
        Scale = (1.2999999523162842, 2.0)
        rgba = [ 80 80 80 98 ]
        alpha = 0
        z_priority = 10000001
    }
    RunScriptOnScreenElement id = underground_black2 fadeinout
    build_top_and_bottom_blocks parent = underground_hud_anchor top_z = 100000 bot_z = 100000
    RunScriptOnScreenElement id = under_1 underground_fly_in
    RunScriptOnScreenElement id = under_2 underground_fly_in2
    RunScriptOnScreenElement id = skater_name_1 skater_name_fly_1
    RunScriptOnScreenElement id = skater_name_2 skater_name_fly_2
    RunScriptOnScreenElement id = skater_name_3 skater_name_fly_3
    RunScriptOnScreenElement id = skater_name_4 skater_name_fly_4
    RunScriptOnScreenElement id = skater_name_5 skater_name_fly_5
    RunScriptOnScreenElement id = understar_1 star_fly_1
    RunScriptOnScreenElement id = understar_2 star_fly_2
endscript


script underground_fly_in 
    wait 1 second
    DoScreenElementMorph id = under_1 alpha = 0 time = 0 Scale = 8
    DoScreenElementMorph id = under_1 alpha = 0.9000 time = 0.3000 Scale = 3
    wait 4.500 second
    DoScreenElementMorph id = under_1 alpha = 0 Scale = (20.0, 3.0) time = 0.2000
endscript


script underground_fly_in2 
    wait 1 second
    DoScreenElementMorph id = under_2 alpha = 0 time = 0 Pos = (700.0, 190.0)
    DoScreenElementMorph id = under_2 alpha = 0.9000 time = 0.4000 Pos = (52.0, 190.0)
    wait 3.0 second
    DoScreenElementMorph id = under_2 alpha = 0 time = 0.2000
endscript


script skater_name_fly_1 
    DoScreenElementMorph id = skater_name_1 alpha = 0 time = 0 Pos = (700.0, 70.0)
    DoScreenElementMorph id = skater_name_1 alpha = 0.6000 time = 6.200 Scale = (5.0, 5.0) Pos = (-650.0, 70.0)
endscript


script skater_name_fly_2 
    DoScreenElementMorph id = skater_name_2 alpha = 0 time = 0 Pos = (-200.0, 270.0)
    DoScreenElementMorph id = skater_name_2 alpha = 0.5000 time = 5.800 Pos = (1000.0, 270.0)
endscript


script skater_name_fly_3 
    DoScreenElementMorph id = skater_name_3 alpha = 0 time = 0 Pos = (300.0, 600.0)
    DoScreenElementMorph id = skater_name_3 alpha = 0.5500 time = 6.400 Pos = (300.0, -600.0)
endscript


script skater_name_fly_4 
    DoScreenElementMorph id = skater_name_4 alpha = 0 time = 0 Pos = (100.0, -600.0)
    DoScreenElementMorph id = skater_name_4 alpha = 0.4000 time = 6.200 Scale = (4.800000190734863, 4.800000190734863) Pos = (100.0, 600.0)
endscript


script skater_name_fly_5 
    wait 2 second
    DoScreenElementMorph id = skater_name_5 alpha = 0.7000 time = 0 Scale = 9 Pos = (320.0, 170.0)
    DoScreenElementMorph id = skater_name_5 alpha = 0 time = 3.500 Scale = 0 Pos = (320.0, 170.0)
endscript


script star_fly_1 
    wait 1 second
    DoScreenElementMorph id = understar_1 alpha = 0.5000 time = 0 Pos = (730.0, 210.0) rot_angle = 0
    DoScreenElementMorph id = understar_1 alpha = 0.9500 time = 2.800 Scale = (2.299999952316284, 2.299999952316284) Pos = (-250.0, 210.0) rot_angle = 720
endscript


script star_fly_2 
    wait 1.500 second
    DoScreenElementMorph id = understar_2 alpha = 0.5000 time = 0 Pos = (-250.0, 210.0) rot_angle = 0
    DoScreenElementMorph id = understar_2 alpha = 0.8000 time = 1.800 Scale = (2.299999952316284, 2.299999952316284) Pos = (720.0, 210.0) rot_angle = -720
endscript


script fadeinout 
    wait 0.6000 second
    DoScreenElementMorph id = underground_black2 alpha = 0 time = 0
    DoScreenElementMorph id = underground_black2 alpha = 1 time = 0.2000
    DoScreenElementMorph id = underground_black2 alpha = 0 time = 0.1000
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

nightvision_hud_is_hidden = 0

script nightvision_hud 
    if ScreenElementExists id = nightvision_hud_anchor
        DestroyScreenElement id = nightvision_hud_anchor
    endif
    SetScreenElementLock Off id = root_window
    CreateScreenElement {
        type = ContainerElement
        id = nightvision_hud_anchor
        parent = root_window
        Pos = (320.0, 240.0)
        dims = (640.0, 480.0)
    }
    CreateScreenElement {
        type = SpriteElement
        id = nightvision_hud_line
        parent = nightvision_hud_anchor
        texture = white2
        Pos = (0.0, 0.0)
        just = [ left center ]
        Scale = (100.0, 0.10000000149011612)
        alpha = 0.5000
    }
    RunScriptOnScreenElement id = nightvision_hud_line morph_nightvision_hud_line
endscript


script really_kill_flicker_nightvision_hud 
    wait 0.7000 seconds
    fadetoblack Off time = 0
    if ScreenElementExists id = nightvision_hud_anchor
        DestroyScreenElement id = nightvision_hud_anchor
    endif
endscript


script morph_nightvision_hud_line time = 1.500
    begin 
    DoScreenElementMorph id = nightvision_hud_line Pos = (0.0, 480.0) time = <time>
    wait <time> seconds
    DoScreenElementMorph id = nightvision_hud_line Pos = (0.0, 0.0)
    repeat 
endscript


script play_cutscene 
    if IsObjectScript
        obj_getid
        
        
        
        
        
        SpawnScript play_cutscene_from_gameplay params = { <...>  }
    else
        PlayCutscene <...> 
    endif
endscript


script play_cutscene_from_gameplay 
    if NOT GotParam name
        script_assert 'missing name parameter for cutscene'
    endif
    PlayCutscene <...> 
endscript


script cutscene_deactivate_tod_manager 
    TODManager_GetCurrentTODParams
    <active> = (<tod_params>.active)
    change TODManagerActiveBeforeCutscene = <active>
    TODManager_SetActive 0
endscript


script cutscene_reactivate_tod_manager 
    if (TODManagerActiveBeforeCutscene = 1)
        TODManager_SetActive 1
    endif
    TODManager_SetTempBloomParams on = 0
endscript


script cutscene_set_pad_event_handlers 
    if NOT cd
        SetScreenElementLock id = root_window Off
        if ScreenElementExists id = cutscene_anchor
            DestroyScreenElement id = cutscene_anchor
        endif
        CreateScreenElement {
            type = ContainerElement
            parent = root_window
            id = cutscene_anchor
        }
        SetScreenElementProps {
            id = cutscene_anchor
            event_handlers = [
                { pad_start cutscene_pause }
            ]
            replace_handlers
        }
        FireEvent type = focus target = cutscene_anchor
    endif
endscript


script cutscene_pause 
    
    PauseCutscene toggle
endscript


script cutscene_frame_advance 
    Cutscene_FrameAdvance
endscript


script cutscene_clear_pad_event_handlers 
    if NOT cd
        if ScreenElementExists id = cutscene_anchor
            DestroyScreenElement id = cutscene_anchor
        endif
    endif
endscript


script cutscene_fake_letterboxing 
    if ScreenElementExists id = letterbox_anchor
        DestroyScreenElement id = letterbox_anchor
    endif
    if GotParam remove
        SetScreen Angle = 72.0 aspect = 1.333
        return 
    else
        SetScreen Angle = 88.18 aspect = 1.333
    endif
    SetScreenElementLock id = root_window Off
    CreateScreenElement {
        type = ContainerElement
        id = letterbox_anchor
        parent = root_window
        z_priority = 999
        just = [ center center ]
        internal_just = [ left top ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = letterbox_anchor
        texture = white2
        Scale = (100.0, 9.5)
        Pos = (0.0, -20.0)
        rgba = [ 0 0 0 128 ]
        just = [ left top ]
        z_priority = 15
    }
    CreateScreenElement {
        type = SpriteElement
        parent = letterbox_anchor
        texture = white2
        Scale = (100.0, 12.0)
        Pos = (0.0, 392.0)
        rgba = [ 0 0 0 128 ]
        just = [ left top ]
        z_priority = 15
    }
endscript


script cutscene_kill_spawned_script 
    KillSpawnedScript id = <id>
endscript


script create_digital_timer Pos = (50.0, 100.0) Scale = 1.500 alpha = 0.6000 font = dialog rgba = [ 128 128 128 128 ] mins = 2 secs = 16 frames = 3
    if ScreenElementExists id = digital_timer_anchor
        DestroyScreenElement id = digital_timer_anchor
    endif
    SetScreenElementLock Off id = root_window
    CreateScreenElement {
        type = ContainerElement
        id = digital_timer_anchor
        parent = root_window
        Pos = <Pos>
        just = [ left top ]
    }
    CreateScreenElement {
        type = TextElement
        parent = digital_timer_anchor
        id = mins2
        Pos = (0.0, 0.0)
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
        parent = digital_timer_anchor
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
        parent = digital_timer_anchor
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
        parent = digital_timer_anchor
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
        parent = digital_timer_anchor
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
        parent = digital_timer_anchor
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
        parent = digital_timer_anchor
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
        parent = digital_timer_anchor
        id = frames
        Pos = <Pos>
        text = '0'
        font = <font>
        just = [ RIGHT top ]
        Scale = <Scale>
        alpha = <alpha>
        rgba = <rgba>
    }
    <mins2> = (<mins> / 10)
    <mins1> = (<mins> - (<mins2> * 10))
    <secs2> = (<secs> / 10)
    <secs1> = (<secs> - (<secs2> * 10))
    <frames2> = (<frames> / 10)
    <frames1> = (<frames> - (<frames2> * 10))
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
    mins ::settags frames = <frames> secs = <secs> mins = <mins> callback = <callback> callback_params = <callback_params>
    RunScriptOnScreenElement id = secs camera_hud_count params = { up = 0 }
endscript


script reset_digital_timer 
    KillSpawnedScript name = camera_hud_count
    if ScreenElementExists id = mins
        if GotParam frames
            if NOT GotParam secs
                mins ::getsingletag secs
            endif
            begin 
            if (<frames> > 29)
                <secs> = (<secs> + 1)
                <frames> = (<frames> - 29)
            else
                break 
            endif
            repeat 
            <frames2> = (<frames> / 10)
            <frames1> = (<frames> - (<frames2> * 10))
            FormatText textname = frame_text '%f' f = <frames1>
            SetScreenElementProps id = frames text = <frame_text>
            FormatText textname = frame_text '%f' f = <frames2>
            SetScreenElementProps id = frames2 text = <frame_text>
            mins ::settags frames = <frames>
        endif
        if GotParam secs
            <secs2> = (<secs> / 10)
            <secs1> = (<secs> - (<secs2> * 10))
            FormatText textname = sec_text '%s' s = <secs1>
            SetScreenElementProps id = secs text = <sec_text>
            FormatText textname = sec_text '%s' s = <secs2>
            SetScreenElementProps id = secs2 text = <sec_text>
            mins ::settags secs = <secs>
        endif
        if GotParam mins
            <mins2> = (<mins> / 10)
            <mins1> = (<mins> - (<mins2> * 10))
            <secs2> = (<secs> / 10)
            <secs1> = (<secs> - (<secs2> * 10))
            FormatText textname = min_text '%m' m = <mins1>
            SetScreenElementProps id = mins text = <min_text>
            FormatText textname = min_text '%m' m = <mins2>
            SetScreenElementProps id = mins2 text = <min_text>
            mins ::settags mins = <mins>
        endif
    endif
    RunScriptOnScreenElement id = secs camera_hud_count params = { up = 0 }
endscript


script get_digital_timer_time 
    <mins> = 0
    <secs> = 0
    <frames> = 0
    if ScreenElementExists id = mins
        mins ::gettags
    endif
    return mins = <mins> secs = <secs> frames = <frames>
endscript


script destroy_digital_timer 
    if ScreenElementExists id = digital_timer_anchor
        DestroyScreenElement id = digital_timer_anchor
    endif
endscript


script cutscene_create_loadscreen 
    if ScreenElementExists id = root_window
        SetScreenElementLock id = root_window Off
        CreateScreenElement {
            type = ContainerElement
            parent = root_window
            id = loading_logo_anchor
            Pos = (0.0, 0.0)
            alpha = 1
            z_priority = 9999
        }
        Theme_GetAltColor return_value = grad_color
        Pos = (35.0, 310.0)
        CreateScreenElement {
            type = SpriteElement
            parent = loading_logo_anchor
            texture = goal_grad
            rgba = <grad_color>
            Scale = (19.0, 0.800000011920929)
            Pos = (<Pos> + (0.0, 0.0))
            just = [ left top ]
            flip_v
            alpha = 0.4000
        }
        CreateScreenElement {
            type = SpriteElement
            parent = loading_logo_anchor
            texture = goal_grad
            rgba = <grad_color>
            Scale = (19.0, 0.800000011920929)
            Pos = (<Pos> + (0.0, 10.0))
            just = [ left top ]
            flip_v
            alpha = 0.5000
        }
        CreateScreenElement {
            type = SpriteElement
            parent = loading_logo_anchor
            texture = goal_grad
            rgba = <grad_color>
            Scale = (19.0, 0.800000011920929)
            Pos = (<Pos> + (0.0, 20.0))
            just = [ left top ]
            flip_v
            alpha = 0.6000
        }
        CreateScreenElement {
            type = SpriteElement
            parent = loading_logo_anchor
            texture = goal_grad
            rgba = <grad_color>
            Scale = (19.0, 0.800000011920929)
            Pos = (<Pos> + (0.0, 30.0))
            just = [ left top ]
            flip_v
            alpha = 0.7000
        }
        CreateScreenElement {
            type = SpriteElement
            parent = loading_logo_anchor
            texture = goal_grad
            rgba = <grad_color>
            Scale = (19.0, 0.800000011920929)
            Pos = (<Pos> + (0.0, 40.0))
            just = [ left top ]
            flip_v
            alpha = 0.8000
        }
    endif
endscript


script cutscene_destroy_loadscreen 
    if ScreenElementExists id = loading_logo_anchor
        DestroyScreenElement id = loading_logo_anchor
    endif
endscript

