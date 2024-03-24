

script car_add_components 
    if GotParam SkeletonName
        createcomponentfromstructure Component = skeleton skeleton = <SkeletonName>
    endif
    createcomponentfromstructure Component = Model <...> 
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
endscript


script gameobj_add_components 
    if GotParam SkeletonName
        createcomponentfromstructure Component = AnimBlender <...> 
        createcomponentfromstructure Component = skeleton <...> skeleton = <SkeletonName>
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
    if GotParam supportstreams
        if ContainsComponent name = stream
            script_assert 'object already has a stream component'
        else
            createcomponentfromstructure Component = stream
        endif
    endif
    if GotParam collisionmode
        if NOT (collisionmode = None)
            createcomponentfromstructure Component = collision <...> 
        endif
    endif
    if GotParam target
        createcomponentfromstructure Component = projectileproximity
    endif
endscript


script createobjlabel 
    obj_getid
    SpawnScript MaintainObjLabel params = { ObjID = <ObjID> }
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
    if NOT GotParam NoPedLogic
        createcomponentfromstructure Component = avoid
        createcomponentfromstructure Component = pedlogic <...> 
        createcomponentfromstructure Component = fam <...> 
    endif
    if GotParam IsSkaterPed
        createcomponentfromstructure Component = skaterloopingsound <...> volume_mult = 0.2000
        createcomponentfromstructure Component = skatersound <...> volume_mult = 0.2000
    endif
    if GotParam SkeletonName
        switch <SkeletonName>
            case shark
            SkeletonName = anl_shark
        endswitch
    endif
    if ((InNetGame)|| (LevelIs load_sk5ed)|| (LevelIs load_sk5ed_gameplay))
        if (<SkeletonName> = anl_pigeon)
            createcomponentfromstructure {
                Component = AnimBlender
                <...> 
                AnimName = animload_anl_pigeon
            }
            createcomponentfromstructure Component = skeleton <...> SkeletonName = anl_pigeon
        else
            GetAnimEventTableName animType = THPS6_human
            createcomponentfromstructure {
                Component = AnimBlender
                <...> 
                AnimName = animload_THPS6_human
                animEventTableName = <animEventTableName>
            }
            createcomponentfromstructure Component = skeleton <...> SkeletonName = THPS6_human
        endif
    else
        if GotParam AnimName
            if NOT GotParam animEventTableName
                GetAnimEventTableName animType = <type>
            endif
            if NOT GotParam defaultanimname
                if ChecksumEquals a = <SkeletonName> b = THPS6_human
                    <defaultanimname> = WStandIdle1
                endif
                if NOT (have_loaded_net)
                    if ChecksumEquals a = <SkeletonName> b = ped_female
                        <defaultanimname> = Ped_F_Idle1
                    endif
                endif
            endif
            createcomponentfromstructure Component = AnimBlender animEventTableName = <animEventTableName> <...> 
        endif
        if GotParam SkeletonName
            PushMemProfile 'Pedestrian Skeletons'
            createcomponentfromstructure Component = skeleton <...> skeleton = <SkeletonName>
            PopMemProfile
        endif
    endif
    if IsNGC
        MemPopContext
    endif
    createcomponentfromstructure Component = Model <...> 
    if GotParam DoLightCollision
        createcomponentfromstructure Component = ModelLightUpdate <...> 
    endif
    if NOT GotParam Dont_Target
        createcomponentfromstructure Component = projectileproximity
    endif
    if NOT GotParam ShadowOff
        createcomponentfromstructure Component = shadow <...> ShadowType = simple
    endif
endscript


script ped_init_model 
    if InNetGame
        if GotParam SkeletonName
            switch <SkeletonName>
                case shark
                SkeletonName = anl_shark
            endswitch
        endif
        if (<SkeletonName> = anl_pigeon)
            if NOT GotParam Model
                script_assert 'no model specified'
            endif
            obj_initmodel Model = <Model> use_asset_manager = 1
        else
            obj_initmodel Model = 'Peds/Ped_Judge/Ped_Judge.skin' use_asset_manager = 1
        endif
        return 
    endif
    if ((LevelIs load_sk5ed)|| (LevelIs load_sk5ed_gameplay))
        ChooseRandomCreatedGoalPedModel
        return 
    endif
    if GotParam profile
        obj_initmodelfromprofile struct = <profile> use_asset_manager = 1 buildscript = create_ped_model_from_appearance
    else
        if NOT GotParam Model
            script_assert 'no model name!'
        endif
        obj_initmodel Model = <Model> <...> use_asset_manager = 1
    endif
    obj_getid
    RunScriptOnObject id = <ObjID> set_ped_anim_handlers
endscript


script ped_disable_bones 
    obj_setboneactive bone = Cloth_Shirt_L active = 0
    obj_setboneactive bone = Cloth_Shirt_C active = 0
    obj_setboneactive bone = Cloth_Shirt_R active = 0
endscript


script ped_enable_bones 
    obj_setboneactive bone = Cloth_Shirt_L active = 1
    obj_setboneactive bone = Cloth_Shirt_C active = 1
    obj_setboneactive bone = Cloth_Shirt_R active = 1
endscript

