replay_data_directory = 'c:/skate7/data/'
replay_root_directory = 'AnimSaves/'
replay_default_skeleton = thps7_human
AnimSave_BaseAnimTree = { type = degenerateblend id = Blender }
AnimSave_Branch_PlayAnim = {
    type = AnimSaveSound
    id = BodyOverlay
    [
        {
            type = param_timer_type
            id = bodytimer
            Speed = param_speed
            start = param_start
            anim = param_anim
            [
                { id = BodySource type = source anim = param_anim }
            ]
        }
    ]
}
replay_anim_fudge = 1
replay_currently_playing = 0
replay_current_name = 'default'

script PlayAnimSave name = 'default' exitscript = ReplayExit_Die CloneFrom = skater
    if IsTrue replay_currently_playing
        StopAnimSave
    endif
    if NOT cd
        change replay_anim_fudge = ((replay_anim_fudge)+ 1)
    endif
    replay_hideorshow func = hide hide = <hide>
    replay_hideorshow func = hide hide = <hide_perm>
    if GotParam id
        ReplayActorName = <id>
        exitscript = ReplayExit_PedIdle
        <id> ::igc_ped_setidle
        if <id> ::obj_suspendisenabled
            <id> ::settags reset_suspend = 1
            <id> ::obj_suspendenable on = 0
        endif
        <id> ::igc_ped_switch_board Scale = 1
        replay_hideorshow func = unhide hide = <id>
    else
        replay_create_actor CloneFrom = <CloneFrom> preferredid = ReplaySkater skeleton = (replay_default_skeleton)
    endif
    AssignAlias id = <ReplayActorName> alias = ReplayActor
    <ReplayActorName> ::settags {
        ReplayExitScript = <exitscript>
        ReplayExitParams = <exitparams>
        ReplayExitHide = <hide>
        Replay_Actor
        igc_behavior_active
    }
    <ReplayActorName> ::obj_spawnscriptnow play_replay_guts params = { name = <name> }
    return { ReplayActorName = <ReplayActorName> }
endscript

script StopAnimSave ReplayActorName = ReplayActor
    if NOT IsTrue replay_currently_playing
        return 
    endif
    name = (replay_current_name)
    printf 'Trying to stop anim save: %s' s = <name>
    change replay_currently_playing = 0
    KillSpawnedScript name = play_replay_guts
    if replay_generate_filenames name = <name>
        if NOT ObjectAnimFinished name = <oba_checksum>
            printf 'Stopping object anim'
            KillObjectAnim name = <oba_checksum>
        endif
    endif
    if CompositeObjectExists <ReplayActorName>
        printf 'Stopping skeletal anim'
        <ReplayActorName> ::obj_spawnscriptnow { 
        replay_handle_exit_script
         }
    endif
endscript

script RecordSkaterAnim \{ name = 'default' time = 10 }
    if skater ::export_isrecording
        RecordSkaterAnimStop
    else
        skater ::record_start name = <name> time = <time>
    endif
endscript

script RecordSkaterAnimStop 
    skater ::export_stop
endscript

script replay_create_actor 
    if CompositeObjectExists name = <preferredid>
        return ReplayActorName = <preferredid>
    endif
    if NOT CompositeObjectExists name = <CloneFrom>
        scriptassert 'No object found to clone from!'
    endif
    GetUniqueCompositeObjectID preferredid = <preferredid>
    ReplayActorName = <uniqueid>
    CreateCompositeObject {
        Components = [
            {
                Component = Suspend
                neversuspend
            }
            {
                Component = sound
            }
            {
                Component = AnimTree
                SkeletonName = <SkeletonName>
                defaultcommandtarget = Blender
            }
            {
                Component = skeleton
            }
            {
                Component = SetDisplayMatrix
            }
            {
                Component = ModelLightUpdate
            }
            {
                Component = Model
                CloneFrom = <CloneFrom>
                usemodellights
            }
        ]
        params = {
            SkeletonName = <skeleton>
            name = <ReplayActorName>
        }
    }
    <ReplayActorName> ::anim_inittree {
        tree = AnimSave_BaseAnimTree
        nodeiddeclaration = [
            Blender
            bodytimer
            BodyOverlay
            BodySource
        ]
    }
    return ReplayActorName = <ReplayActorName>
endscript

script play_replay_guts 
    change assertonmissingassets = 1
    if NOT replay_generate_filenames name = <name>
        goto replay_handle_exit_script
    endif
    if GotParam debug_memory_load
        AllowAssetLoading on
        MemPushContext DebugHeap
        SetReferenceChecksum (replay_default_skeleton)
        LoadAnim name = <ska_name> descchecksum = <ska_checksum>
        SetReferenceChecksum 0
        LoadAnim name = <oba_name> descchecksum = <oba_checksum>
        MemPopContext
        AllowAssetLoading Off
    endif
    printf 'Starting replay anim: %s' s = <name>
    change replay_currently_playing = 1
    change replay_current_name = <name>
    anim_command {
        command = degenerateblend_addbranch
        blendduration = 0.0
        params = {
            tree = AnimSave_Branch_PlayAnim
            params = {
                param_timer_type = play
                param_anim = <ska_checksum>
            }
        }
    }
    anim_updatepose
    PlayObjectAnim name = <oba_checksum> update_locked_objects move_to_final_position_on_exit
    anim_command target = bodytimer command = timer_wait
    KillObjectAnim name = <oba_checksum>
    printf 'Finished replay anim!'
    change replay_currently_playing = 0
    if GotParam debug_memory_load
        UnloadAnim name = <ska_name> descchecksum = <ska_checksum>
        UnloadAnim name = <oba_name> descchecksum = <oba_checksum>
    endif
    replay_handle_exit_script
endscript

script replay_handle_exit_script 
    tag_array = [
        ReplayExitScript
        ReplayExitParams
        ReplayExitHide
        Replay_Actor
        igc_behavior_active
    ]
    getsetoftags <tag_array>
    removetags <tag_array>
    if GotParam \{ ReplayExitHide }
        replay_hideorshow hide = <ReplayExitHide> func = unhide
    endif
    if GotParam \{ ReplayExitScript }
        <ReplayExitScript> <ReplayExitParams>
    endif
endscript

script ReplayExit_Die 
    printf \{ 'ReplayExit_Die' }
    Die
endscript

script ReplayExit_Idle \{ anim = Ped_M_Idle1 }
    printf \{ 'ReplayExit_Idle' }
    ReplayExit_OptionalLogic <...> 
    anim_command {
        command = degenerateblend_addbranch
        blendduration = 0.0
        params = {
            tree = AnimSave_Branch_PlayAnim
            params = {
                param_timer_type = Cycle
                param_anim = <anim>
            }
        }
    }
endscript

script ReplayExit_OptionalLogic 
    if GotParam \{ name }
        obj_movetonode name = <name> orient
    endif
    if GotParam \{ hide }
        obj_getid
        replay_hideorshow func = hide hide = <ObjID>
    endif
endscript

script ReplayExit_PedIdle 
    printf \{ 'ReplayExit_PedIdle' }
    ReplayExit_OptionalLogic <...> 
    if getsingletag \{ reset_suspend }
        removetags \{[ reset_suspend ]}
        obj_suspendenable
    endif
    if getsingletag \{ igc_actor_flag }
        obj_getid
        igc_set_actor_direction actor = <ObjID> BlendPeriod = randomrange (0.20000000298023224, 0.4000000059604645)
    else
        igc_ped_setdefault
    endif
endscript

script replay_hideorshow func = hide
    if GotParam hide
        if IsArray <hide>
            GetArraySize hide
            i = 0
            begin 
            hide_object = (<hide> [ <i> ])
            <hide_object> ::<func>
            MangleChecksums a = <hide_object> b = Head
            if CompositeObjectExists name = <mangled_id>
                <mangled_id> ::<func>
            endif
            i = (<i> + 1)
            repeat <array_size>
        else
            <hide> ::<func>
            MangleChecksums a = <hide> b = Head
            if CompositeObjectExists name = <mangled_id>
                <mangled_id> ::<func>
            endif
        endif
    endif
endscript

script replay_generate_filenames 
    return_value = false
    base_name = ((replay_root_directory)+ <name>)
    FormatText checksumname = ska_checksum (<name> + '_skeleton')
    FormatText checksumname = oba_checksum (<name> + '_object')
    <mangle_checksum> = mission
    MangleChecksums a = <ska_checksum> b = <mangle_checksum>
    if anim_animexists anim = <mangled_id> ReferenceChecksum = (replay_default_skeleton)
        <ska_checksum> = <mangled_id>
        MangleChecksums a = <oba_checksum> b = <mangle_checksum>
        <oba_checksum> = <mangled_id>
        return_value = true
    else
        if anim_animexists anim = <ska_checksum> ReferenceChecksum = (replay_default_skeleton)
            return_value = true
        else
            if NOT cd
                if gotextramemory
                    if ScreenElementExists id = animsave_controls
                        MangleChecksums a = <ska_checksum> b = (replay_anim_fudge)
                        <ska_checksum> = <mangled_id>
                        MangleChecksums a = <oba_checksum> b = (replay_anim_fudge)
                        <oba_checksum> = <mangled_id>
                        debug_memory_load = 1
                        return_value = true
                    endif
                endif
            endif
        endif
    endif
    return {
        ska_checksum = <ska_checksum>
        oba_checksum = <oba_checksum>
        ska_name = (<base_name> + '_skeleton.ska')
        oba_name = (<base_name> + '_object.ska')
        debug_memory_load = <debug_memory_load>
        <return_value>
    }
endscript
animexport_pending_conversions = 0

script animexport_convert 
    change animexport_pending_conversions = ((animexport_pending_conversions)+ 1)
    RunRemoteScript {
        ScriptName = RunShellCommand
        params = {
            command = 'bindproj && animconv.exe'
            args = ('-pp -f' + (replay_data_directory)+ <filename>)
        }
        LocalCallback = animexport_convert_finished
    }
endscript

script animexport_convert_finished 
    if ((animexport_pending_conversions)> 0)
        change animexport_pending_conversions = ((animexport_pending_conversions)-1)
    endif
endscript

script record_start 
    if NOT IsObjectScript
        scriptassert 'need to run this on an object'
    endif
    if export_hasdata
        printf 'Old replay found....'
        record_stop no_export
        return 
    endif
    FinishPendingZoneLoads
    ChangeNodeFlag NODEFLAG_PERMANENT_PEDS 0
    change update_transition_nodes = 0
    cutscene_deactivate_tod_manager
    GoalManager_UninitializeAllGoals
    KillAllPedlifeObjects
    KillTextureSplats all
    PreAllocSplats
    PauseSpawnedScripts
    PauseObjects
    EnableScriptPrintf 0
    UnPause
    skatercam0 ::UnPause
    change animexport_pending_conversions = 0
    settags current_replay_name = <name>
    replay_generate_filenames name = <name>
    export_record {
        object = {
            filename = <oba_name>
            refChecksum = ReplayActor
            capture_update_count = (<time> * 60)
            capture_update_interval = 1
            export_rate = 60
        }
        skeleton = {
            filename = <ska_name>
            refChecksum = (replay_default_skeleton)
            capture_update_count = (<time> * 30)
            capture_update_interval = 2
            export_rate = 30
        }
        stop_callback = record_stop
    }
    SetScreenElementLock id = root_window Off
    CreateScreenElement {
        parent = root_window
        id = record_anchor
        type = ContainerElement
        z_priority = 1000
    }
    CreateScreenElement {
        parent = record_anchor
        id = record_dot
        type = SpriteElement
        texture = Circle
        Pos = (600.0, 410.0)
        Scale = 1
    }
    CreateScreenElement {
        parent = record_anchor
        id = record_label
        type = TextElement
        font = testtitle
        Pos = (570.0, 410.0)
        Scale = 1
        text = 'Nagrywaj'
    }
    RunScriptOnScreenElement record_blink_dot id = record_dot
endscript
animsave_replay_params = { start_time = 0.0 end_time = 1.0 }

script record_stop 
    UnpauseObjects
    UnpauseSpawnedScripts
    change update_transition_nodes = 1
    ChangeNodeFlag NODEFLAG_PERMANENT_PEDS 1
    cutscene_reactivate_tod_manager
    GoalManager_Initializeallgoals
    EnableScriptPrintf 1
    wait 5 gameframes
    if NOT export_hasdata
        printf 'No anim export data?'
        return 
    endif
    kill_panel_message_if_it_exists id = record_anchor
    if ScreenElementExists id = animsave_controls
        return 
    endif
    kill_start_key_binding
    MakeSkaterGoto freezeskater
    obj_getid
    export_getduration
    if NOT GotParam no_export
        change globalname = animsave_replay_params newValue = {start_time = 0.0 end_time = <duration>}
        SpawnScriptLater animsave_replay_export params = { id = <ObjID> }
    endif
    <ObjID> ::getsingletag current_replay_name
    structure_control_menu_create {
        vmenu_id = animsave_controls
        text = ('AnimSave: ' + <current_replay_name>)
        callback = animsave_control_enforce_bounds
        structure = animsave_replay_params
        control_items = [
            {text = 'Start' param = start_time min = 0.0 max = <duration> step = 0.01000}
            {text = 'Koniec' param = end_time min = 0.0 max = <duration> step = 0.01000}
        ]
        choose_items = [
            {text = 'Eksportuj, zapisz i obejrzyj' pad_choose_script = animsave_replay_export pad_choose_params = { id = <ObjID> }}
            {text = 'Przejrzyj, bez eksportowania' pad_choose_script = animsave_replay_go pad_choose_params = { id = <ObjID> }}
            {text = '' focusable = not_focusable}
            {text = 'Wyjd, zachowuj¹c animacje tymczasowe' pad_choose_script = animsave_control_exit pad_choose_params = { id = <ObjID> }}
            {text = 'Zakoñcz i wyjd (nie mo¿na cofn¹æ!)' pad_choose_script = animsave_control_exit pad_choose_params = {id = <ObjID> quit}}
        ]
        pad_back_script = NullScript
    }
endscript

script animsave_control_enforce_bounds 
    if (<start_time> > <end_time>)
        change globalname = animsave_replay_params newValue = {(animsave_replay_params)start_time = <end_time>}
    else
        if (<end_time> < <start_time>)
            change globalname = animsave_replay_params newValue = {(animsave_replay_params)end_time = <start_time>}
        endif
    endif
    structure_control_menu_refresh
endscript

script animsave_replay_export 
    if NOT ObjectAnimFinished
        return 
    endif
    <id> ::export_save (animsave_replay_params)
    animsave_replay_go id = <id>
endscript

script animsave_replay_go 
    if NOT ObjectAnimFinished
        return 
    endif
    begin 
    if NOT ((animexport_pending_conversions)> 0)
        break 
    endif
    wait \{ 1 seconds }
    repeat 
    <id> ::getsingletag current_replay_name
    PlayAnimSave name = <current_replay_name>
endscript

script animsave_control_exit 
    if GotParam \{ quit }
        <id> ::export_clear
        <id> ::removetags [ current_replay_name ]
    endif
    MakeSkaterGoto \{ ongroundai }
    DestroyScreenElement \{ id = current_menu }
    restore_start_key_binding
endscript

script record_blink_dot 
    setprops \{rgba = [ 128 0 0 128 ]}
    begin 
    DoMorph \{ alpha = 1 }
    wait \{ 0.4000 seconds }
    DoMorph \{ alpha = 0 }
    wait \{ 0.4000 seconds }
    repeat 
endscript
animsave_sound_debug = 0

script animsave_create_panel_message 
    switch <id>
        case Speed
        Pos = (450.0, 30.0)
        just = [ left top ]
        style = NullScript
        case state
        Pos = (600.0, 50.0)
        just = [ RIGHT top ]
        style = NullScript
        case action
        parent = animsave_console
        rgba = [ 0 128 0 128 ]
        if NOT ScreenElementExists id = animsave_console
            SetScreenElementLock id = root_window Off
            CreateScreenElement {
                type = vmenu
                parent = root_window
                id = animsave_console
                Pos = (600.0, 70.0)
                padding_scale = 0.6500
                font = dialog
                just = [ RIGHT top ]
                internal_just = [ RIGHT center ]
                z_priority = 0
            }
        endif
        RemoveParameter id
        default 
        printf 'eh?'
    endswitch
    create_panel_message <...> 
endscript

script animsave_kill_panel_message 
    kill_panel_message_if_it_exists \{ id = animsave_console }
    kill_panel_messages
endscript
