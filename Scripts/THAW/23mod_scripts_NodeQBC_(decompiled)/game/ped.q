Ped_StaticAnimTree = {
    type = partialswitch
    id = PedBlendRoot
    [
        { type = degenerateblend id = PedFAMAnimParentNode }
        { type = degenerateblend id = PedMainAnimParentNode }
    ]
}
Ped_AnimBranch_Standard = {
    type = param_timer_type
    id = bodytimer
    Speed = param_speed
    start = param_start
    anim = param_anim
    enable_anim_events
    [
        { id = BodySource type = source anim = param_anim }
    ]
}
Ped_AnimBranch_LookAt = {
    id = LookAtController
    type = DifferenceLookAt
    params = param_lookat_params
    target = param_lookat_target
    [
        { Ped_AnimBranch_Standard }
    ]
}
Ped_AnimBranch_FAMStandard = {
    type = param_timer_type
    id = FamTimer
    Speed = param_speed
    start = param_start
    anim = param_anim
    enable_anim_events
    [
        { id = PedFAMAnimNode type = source anim = param_anim }
    ]
}
Ped_AnimBranch_FAMEmpty = { type = blank }
Ped_AnimBranch_Flipped = {
    type = flip
    id = BodyFlip
    [
        { Ped_AnimBranch_Standard }
    ]
}
Ped_AnimBranch_Overlay = {
    type = param_timer_type
    id = bodytimer
    Speed = param_speed
    start = param_start
    anim = param_anim
    enable_anim_events
    [
        {
            id = BodyOverlay
            type = overlay
            anim = param_overlay
            [
                { id = BodySource type = source anim = param_anim }
            ]
        }
    ]
}

script Ped_InitStaticAnimTree \{ tree = Ped_StaticAnimTree }
    anim_uninittree
    anim_inittree tree = <tree> nodeiddeclaration = [
        PedMainAnimParentNode
        PedFAMAnimParentNode
        PedBlendRoot
        FamTimer
        PedFAMAnimNode
        bodytimer
        BodySource
        BodyOverlay
        LookAtController
    ]
endscript

script Ped_AddDegenerateBlendBranch 
    Ped_Anim_Command \{command = degenerateblend_addbranch params = {tree = Ped_AnimBranch_Standard params = { param_timer_type = play param_anim = Ped_M_Idle1 }}}
    anim_updatepose
    anim_command \{command = degenerateblend_setnextblendduration params = { 0.0 }}
endscript

script Ped_PlayAnim {anim = 0 target = PedMainAnimParentNode tree = Ped_AnimBranch_Standard source = BodySource Flipped = 0}
    if GotParam norestart
        if Ped_Anim_Command target = <source> command = source_animequals params = { <anim> }
            return 
        endif
    endif
    timer_type = play
    if GotParam Cycle
        timer_type = Cycle
    endif
    if GotParam Wobble
        timer_type = Wobble
    endif
    if (<Flipped> = 1)
        <tree> = Ped_AnimBranch_Flipped
    endif
    if GotParam PartialAnimOverlay
        Ped_Anim_Command target = Ped_AnimBranch_Overlay command = degenerateblend_addbranch params = {
            blendduration = <BlendPeriod>
            tree = <tree> params = {
                param_timer_type = <timer_type>
                param_anim = <anim>
                param_overlay = <PartialAnimOverlay>
                param_speed = <Speed>
                param_start = <start>
            }
        }
    else
        Ped_Anim_Command target = <target> command = degenerateblend_addbranch params = {
            blendduration = <BlendPeriod>
            tree = <tree> params = {
                param_timer_type = <timer_type>
                param_anim = <anim>
                param_speed = <Speed>
                param_start = <start>
                param_lookat_params = <lookat_params>
                param_lookat_target = <lookat_target>
            }
        }
    endif
    if (DEBUG_PEDINFO = 1)
        settags LastAnim = <anim>
    endif
endscript

script Ped_Anim_Command 
    anim_command <...> 
    obj_getid
    getsingletag \{ specialItemId }
    if GotParam \{ specialItemId }
        if IsCreated <specialItemId>
            <specialItemId> ::anim_command <...> 
        endif
    endif
endscript

script Ped_WaitAnimFinished \{ timer = bodytimer }
    Ped_Anim_Command target = <timer> command = timer_wait
endscript

script Ped_WaitAnim 
    Ped_Anim_Command target = bodytimer command = timer_wait params = { <...>  }
endscript

script Ped_AnimComplete \{ timer = bodytimer }
    if anim_command target = <timer> command = timer_isanimcomplete
        return \{ scriptresult = 1 }
    else
        return \{ scriptresult = 0 }
    endif
endscript

script Ped_AnimEquals 
    if anim_command target = BodySource command = source_animequals params = { <...>  }
        return \{ 1 }
    endif
    return \{ 0 }
endscript

script Ped_GetAnimDuration \{ timer = bodytimer }
    anim_command target = <timer> command = timer_getanimduration
    return <duration>
endscript

script Ped_SetAnimCycleMode 
    timer_type = Cycle
    if GotParam Off
        timer_type = play
    endif
    anim_command target = BodySource command = source_getanimname
    anim = <AnimName>
    anim_command target = bodytimer command = timer_getframefactor
    start = <framefactor>
    anim_command target = PedMainAnimParentNode command = degenerateblend_addbranch params = {
        blendduration = <BlendPeriod>
        tree = Ped_AnimBranch_Standard params = {
            param_timer_type = <timer_type>
            param_anim = <anim>
            param_speed = <Speed>
            param_start = <start>
        }
    }
endscript

script Ped_Flip 
endscript

script car_add_components 
    if GotParam SkeletonName
        createcomponentfromstructure Component = skeleton SkeletonName = <SkeletonName>
    endif
    createcomponentfromstructure Component = Model usemodellights <...> 
    createcomponentfromstructure Component = ModelLightUpdate
    if GotParam SkeletonName
    endif
    if NOT GotParam nocollision
        createcomponentfromstructure Component = collision collisionmode = geometry
    endif
    createcomponentfromstructure Component = nodearray <...> 
    if NOT GotParam norail
        createcomponentfromstructure Component = railmanager <...> 
    endif
    if NOT GotParam noskitch
        createcomponentfromstructure Component = objecthookmanager <...> 
        createcomponentfromstructure Component = skitch <...> 
    endif
    if GotParam compassbliptype
        createcomponentfromstructure Component = compassblip <...> 
    endif
endscript

script gameobj_add_components 
    if GotParam SkeletonName
        if GotParam tree
            createcomponentfromstructure {
                Component = AnimTree
                SkeletonName = <SkeletonName>
                ReferenceChecksum = <ReferenceChecksum>
                animEventTableName = <animEventTableName>
                defaultcommandtarget = <defaultcommandtarget>
                DefaultWaitTarget = <DefaultWaitTarget>
            }
        endif
        createcomponentfromstructure Component = skeleton <...> SkeletonName = <SkeletonName>
    endif
    <is_level_obj> = 0
    if GotParam class
        if ChecksumEquals a = <class> b = LevelObject
            <is_level_obj> = 1
        endif
    endif
    if (<is_level_obj> = 1)
        createcomponentfromstructure Component = Model <...> 
    else
        if GotParam Model
            if NOT StringEquals a = <Model> b = 'none'
                createcomponentfromstructure Component = Model <...> 
            endif
        endif
    endif
    if GotParam DoUseModelLights
        createcomponentfromstructure Component = ModelLightUpdate <...> 
    endif
    if GotParam supportstreams
        if ContainsComponent name = stream
            script_assert 'obiekt ma ju¿ komponent strumieniowy'
        else
            createcomponentfromstructure Component = stream
        endif
    endif
    if GotParam ShadowVolumeModels
        createcomponentfromstructure Component = shadow <...> ShadowType = volume ShadowVolumeModels = <ShadowVolumeModels>
    else
    endif
    if GotParam collisionmode
        if NOT (collisionmode = None)
            createcomponentfromstructure Component = collision <...> 
        endif
    endif
    if GotParam target
        createcomponentfromstructure Component = projectileproximity
    endif
    if GotParam compassbliptype
        createcomponentfromstructure Component = compassblip <...> 
    endif
    if GameModeEquals is_career
        if GotParam TransitionZoneName
            createcomponentfromstructure Component = TransitionNode <...> 
        endif
    endif
endscript

script bouncyobj_add_components 
    if GotParam fireskaterproximityevents
        createcomponentfromstructure Component = objectproximity
    endif
    if GotParam uselockobjcomponent
        createcomponentfromstructure Component = lockobj Off
    endif
    if GotParam Model
        if StringEquals a = <Model> b = 'none'
            AddFlag no_model
        endif
    endif
    if NOT GotParam no_model
        createcomponentfromstructure Component = ModelLightUpdate interlace_update_frames = 60
        if IsXenon
            createcomponentfromstructure Component = Model usemodellights <...> 
        else
            createcomponentfromstructure Component = Model usemodellights max_scene_lights = 0 <...> 
        endif
    endif
    if GotParam profile
        AddParams <profile>
    endif
    if GotParam ShadowVolumeModels
        createcomponentfromstructure Component = shadow <...> 
    endif
endscript

script createobjlabel 
    obj_getid
    SpawnScriptLater MaintainObjLabel params = { ObjID = <ObjID> }
endscript

script MaintainObjLabel 
    <id> = (<ObjID> + 5)
    begin 
    if CompositeObjectExists name = <ObjID>
        <ObjID> ::obj_getposition
        FormatText textname = text '%a' a = <ObjID> nowarning
        if ObjectExists id = <id>
            SetScreenElementProps id = <id> text = <text> pos3d = (<Pos> + (0.0, 80.0, 0.0))rgba = [ 100 0 0 128 ]
        else
            create_object_label id = <id> text = <text> pos3d = (<Pos> + (0.0, 80.0, 0.0))rgba = [ 100 0 0 128 ]
        endif
    else
        if ScreenElementExists id = <id>
            DestroyScreenElement id = <id>
        endif
        break 
    endif
    wait 1 frame
    repeat 
endscript

script ped_add_components 
    if IsNGC
        MemPushContext VMHeapBottomUp
    endif
    if NOT GotParam profile
        printstruct <...> 
        script_assert 'Tworzenie Pada potrzebuje profilu parametrów'
    endif
    AddParams <profile>
    if GotParam creation_params
        AddParams <creation_params>
    endif
    if NOT GotParam SkeletonName
        printstruct <...> 
        script_assert 'Pieszy nie ma szkieletu!'
    endif
    if NOT GotParam NoPedLogic
        createcomponentfromstructure Component = avoid
        createcomponentfromstructure Component = pedlogic <...> 
        createcomponentfromstructure Component = fam <...> 
    endif
    if GotParam pedlogic_params
        if StructureContains structure = <pedlogic_params> Navigation_mode
            if (<pedlogic_params>.Navigation_mode = PEDMOTION_SKATER)
                createcomponentfromstructure Component = skaterloopingsound <...> volume_mult = 0.2000
                createcomponentfromstructure Component = skatersound <...> volume_mult = 0.2000
            endif
        endif
    endif
    createcomponentfromstructure Component = pedlife <...> 
    if GotParam AnimName
        if NOT GotParam animEventTableName
            GetAnimEventTableName animType = <type>
        endif
        createcomponentfromstructure {
            Component = AnimTree
            SkeletonName = <SkeletonName>
            ReferenceChecksum = <ReferenceChecksum>
            animEventTableName = <animEventTableName>
            defaultcommandtarget = PedMainAnimParentNode
            DefaultWaitTarget = PedMainAnimParentNode
        }
    endif
    if GotParam SkeletonName
        PushMemProfile 'Szkielety przechodniów'
        createcomponentfromstructure Component = skeleton <...> SkeletonName = <SkeletonName>
        PopMemProfile
    endif
    if IsNGC
        MemPopContext
    endif
    createcomponentfromstructure Component = Model <...> usemodellights
    if GotParam ShadowVolumeModels
        createcomponentfromstructure Component = shadow <...> ShadowType = volume ShadowVolumeModels = <ShadowVolumeModels>
    else
        createcomponentfromstructure Component = shadow <...> ShadowType = simple
    endif
    createcomponentfromstructure Component = ModelLightUpdate <...> 
    if NOT GotParam Dont_Target
        createcomponentfromstructure Component = projectileproximity
    endif
    if GotParam compassbliptype
        createcomponentfromstructure Component = compassblip <...> 
    endif
    if GotParam specialitem
        createcomponentfromstructure Component = specialitem <...> 
    endif
endscript

script ped_init_model 
    if ((LevelIs load_sk5ed)|| (LevelIs load_sk5ed_gameplay))
        ChooseRandomCreatedGoalPedModel
        return 
    endif
    ped_create_special_item <...> 
    if GotParam profile
        if StructureContains structure = <profile> random_parts
            <random_profile> = <profile>
            RemoveParameter profile
            CreateRandomAppearance profile = <random_profile>
        endif
        obj_initmodelfromprofile struct = <profile> use_asset_manager = 1 buildscript = create_ped_model_from_appearance
    else
        if NOT GotParam Model
            script_assert 'brak nazwy modelu!'
        endif
        obj_initmodel Model = <Model> <...> use_asset_manager = 1
    endif
    obj_getid
    RunScriptOnObject id = <ObjID> set_ped_anim_handlers
endscript

script ped_create_special_item 
    AddParams <profile>
    if GotParam \{ specialitem }
        TurnOnSpecialItem ped specialitem_details = <specialitem>
    endif
endscript

script ped_disable_bones 
    obj_setboneactive \{ bone = Cloth_Shirt_L active = 0 }
    obj_setboneactive \{ bone = Cloth_Shirt_C active = 0 }
    obj_setboneactive \{ bone = Cloth_Shirt_R active = 0 }
endscript

script ped_enable_bones 
    obj_setboneactive \{ bone = Cloth_Shirt_L active = 1 }
    obj_setboneactive \{ bone = Cloth_Shirt_C active = 1 }
    obj_setboneactive \{ bone = Cloth_Shirt_R active = 1 }
endscript

script Ped_InitPedLogicFromProfile 
    if NOT GotParam \{ profile }
        return 
    endif
    AddParams <profile>
    if GotParam \{ defaultanimname }
        settags defaultanimname = <defaultanimname>
    endif
    if NOT GotParam \{ NoPedLogic }
        if GotParam \{ pedlogic_params }
            if StructureContains structure = <pedlogic_params> Navigation_mode
                <name> ::PedLogic_InitParams <pedlogic_params>
            else
                <name> ::Ped_InitAI <pedlogic_params>
            endif
        endif
    endif
endscript

script create_ped_label 
    SetScreenElementLock \{ id = root_window Off }
    CreateScreenElement {
        id = <id>
        type = TextBlockElement
        parent = root_window
        font = dialog
        text = ''
        Scale = 1.0
        Pos = (0.0, 0.0)
        rgba = [ 0 128 0 128 ]
        dims = (250.0, 0.0)
        allow_expansion
        just = [ center top ]
    }
endscript

script destroy_ped_label 
    if ObjectExists id = <id>
        DestroyScreenElement id = <id>
    endif
endscript
