skater_swapping_teammate_name = None

script swap_skaters_get_current_name 
    GetCurrentSkaterProfileIndex
    GetSkaterProfileInfo player = <currentSkaterProfileIndex>
    if (<skater_family> = family_pro)
        return name = pro_teammate
    endif
    return name = <name>
endscript


script swap_skaters_setup 
    Obj_ClearExceptions
    obj_getid
    setup_ped_speech {
        ped_id = <ObjID>
        accept_text = 'Press \m5 to switch.'
        swap_skaters
        swap_skaters_params = {
            ObjID = <ObjID>
            profile_name = <profile_name>
            restart_node = <restart_node>
            activation_script = <activation_script>
            activation_script_params = <activation_script_params>
        }
        activation_script = <activation_script>
        activation_script_params = <activation_script_params>
    }
    <ObjID> ::obj_spawnscript swap_skaters_set_avoid_exception
endscript


script swap_skaters obj_1 = skater
    GoalManager_ClearLastGoal
    TerminateObjectsScripts id = <ObjID> script_name = setup_ped_speech
    TerminateObjectsScripts id = <ObjID> script_name = ped_speech_got_trigger
    TerminateObjectsScripts id = <ObjID> script_name = swap_skaters_set_avoid_exception
    <ObjID> ::Obj_ClearException objectoutofradius
    <ObjID> ::Obj_ClearException objectinradius
    if ScreenElementExists id = ped_speech_dialog
        DestroyScreenElement id = ped_speech_dialog
    endif
    if IsSkaterOnVehicle
        gettags
        if (<racemode> = Gurney)
            reset_gurney no_ai show_gurney
        else
            was_on_vehicle = 1
        endif
        segway_reenable_gurney
        skatervehicleoff
        SkaterLoopingSound_TurnOn
    endif
    remove_all_anim_subsets
    TurnOffLevelParticles
    SwapObjectModels obj_1 = <obj_1> obj_2 = <ObjID>
    if (<profile_name> = custom)
        <ObjID> ::ped_disable_bones
    else
        <ObjID> ::ped_enable_bones
    endif
    SetSwappedSkaterName profile_name = <profile_name> return_params
    RefreshSwappedSkaterData return_params
    if GotParam restart_node
        ResetSkaters node_name = <restart_node>
        skater ::RemoveSkaterFromWorld
        wait 1 frame
        skater ::AddSkaterToWorld
    endif
    if GotParam motoskateboard
        motoskateboardon
        if walking
            CleanUp_WalkingtoSkating
            SwitchToSkatingPhysics
            MakeSkaterGoto ongroundai
        endif
    else
        motoskateboardoff
    endif
    if GotParam vehicle_params
        Vehicle_Start params = <vehicle_params>
    else
        if GotParam was_on_vehicle
            KillObjectAnim current
            MakeSkaterGoto ongroundai
        endif
    endif
    if NOT GotParam no_ped_setup
        if GotParam was_on_vehicle
            TerminateObjectsScripts id = <ObjID>
            get_skater_index_from_name name = <old_profile_name>
            if StructureContains vehicle_params structure = (master_skater_list [ <skater_index> ])
                old_vehicle_params = (master_skater_list [ <skater_index> ].vehicle_params)
                <ObjID> ::Obj_PlayAnim anim = (<old_vehicle_params>.idle_anim)Cycle
            endif
        else
            if <ObjID> ::obj_hascomponent pedlogic
                RunScriptOnObject {
                    id = <ObjID>
                    Ped_InitAI
                    params = {
                        stand
                        GetAttention
                        should_look_at_skater = 0
                    }
                }
                <ObjID> ::Ped_SetLogicState STATE_standing
            else
                <ObjID> ::Obj_PlayAnim anim = Ped_M_SkateIdle1 Cycle
            endif
        endif
        RunScriptOnObject {
            id = <ObjID>
            setup_ped_speech
            params = {
                ped_id = <ObjID>
                accept_text = 'Press \m5 to switch.'
                swap_skaters
                swap_skaters_params = {
                    ObjID = <ObjID>
                    profile_name = <old_profile_name>
                    restart_node = <restart_node>
                    activation_script = <activation_script>
                    activation_script_params = <activation_script_params>
                }
                activation_script = <activation_script>
                activation_script_params = <activation_script_params>
            }
        }
        <ObjID> ::obj_spawnscript swap_skaters_set_avoid_exception
    endif
    <ObjID> ::settags profile_name = <old_profile_name>
    UnpauseSkaters
    restore_start_key_binding
endscript


script SetSwappedSkaterName 
    get_current_skater_name
    <old_profile_name> = <name>
    SelectCurrentSkater name = (<profile_name>)
    if GotParam return_params
        RemoveParameter return_params
        return <...> 
    endif
endscript


script RefreshSwappedSkaterData 
    GetCurrentSkaterProfileIndex
    UpdateTrickMappings skater = <currentSkaterProfileIndex>
    GetSkaterProfileInfo player = <currentSkaterProfileIndex>
    set_correct_graffiti_textures <...> 
    if GotParam return_params
        RemoveParameter return_params
        return <...> 
    endif
endscript


script ResetSkaterToCustom 
    
    if IsSkaterOnVehicle
        gettags
        if (<racemode> = Gurney)
            reset_gurney no_ai show_gurney
            skatervehicleoff
        else
            was_on_vehicle = 1
        endif
        if NodeExists TRG_Gurney_Ghost
            segway_reenable_gurney
        endif
        skatervehicleoff
        remove_all_anim_subsets
        SkaterLoopingSound_TurnOn
    endif
    RestoreAllSwappedObjectModels
    SelectCurrentSkater name = custom
    RefreshSwappedSkaterData
    ResetSkaters
endscript


script swap_skaters_wait_and_reset_avoid_exception 
    wait 20 gameframes
    swap_skaters_set_avoid_exception
endscript


script swap_skaters_set_avoid_exception 
    obj_setinneravoidradius 3
    obj_getid
    SetEventHandlerOnObject {
        object = <ObjID>
        exception
        Ex = objectinavoidradius
        scr = goal_pro_bounce_skater
        params = { reset_script = swap_skaters_wait_and_reset_avoid_exception }
    }
endscript


script swap_skaters_get_current_skater_name 
    <ObjID> ::gettags
    if GotParam model_name
        return model_name = <model_name>
    endif
endscript


script swap_skaters_get_vehicle_params 
    skater ::gettags
    return skater_vehicle_params = <vehicle_params>
endscript


script play_swappable_pro_intro_cameras 
    if NOT IsAlive name = TRG_Ped_TeammateIntroPro
        Create name = TRG_Ped_TeammateIntroPro
    endif
    if CompositeObjectExists name = TRG_Ped_TeammateIntroPro
        SwapObjectModels obj_1 = TRG_Ped_TeammateIntroPro obj_2 = skater
    endif
    if NOT GotParam intro_cameras
        script_assert 'no intro_cameras specified'
    endif
    PlayIntroCameras goal_intro_cameras = <intro_cameras> letterbox
    if CompositeObjectExists name = TRG_Ped_TeammateIntroPro
        SwapObjectModels obj_1 = TRG_Ped_TeammateIntroPro obj_2 = skater
    endif
    Kill name = TRG_Ped_TeammateIntroPro
endscript

