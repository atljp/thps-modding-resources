
script element3d_add_components 
    if GotParam AnimName
        scriptassert 'Tell Stuart that he needs to add animation support to element3d\'s'
    endif
    if GotParam SkeletonName
        PushMemProfile '3D-Skelette'
        createcomponentfromstructure Component = skeleton <...> skeleton = <SkeletonName>
        PopMemProfile
    endif
    if GotParam AnimName
        createcomponentfromstructure Component = Model usemodellights max_scene_lights = 0 <...> Scale = 1
    else
        createcomponentfromstructure Component = Model <...> Scale = 1
    endif
endscript

script element3d_init_model 
    if GotParam AnimName
        obj_setbonescale bone = Bone_Board_Root Scale = 0 propogate
        if GotParam blackout_model
            SetLightAmbientColor r = 0 g = 0 b = 0
            SetLightDiffuseColor index = 0 r = 0 g = 0 b = 0
            SetLightDiffuseColor index = 1 r = 0 g = 0 b = 0
            SetLightAmbientColor r = 0 g = 0 b = 0
            SetLightDiffuseColor index = 0 r = 0 g = 0 b = 0
            SetLightDiffuseColor index = 1 r = 0 g = 0 b = 0
        else
            SetLightAmbientColor r = 128 g = 128 b = 128
            SetLightDiffuseColor index = 0 r = 110 g = 125 b = 155
            SetLightDiffuseColor index = 1 r = 10 g = 3 b = 5
        endif
        Obj_ForceUpdate
    endif
endscript
