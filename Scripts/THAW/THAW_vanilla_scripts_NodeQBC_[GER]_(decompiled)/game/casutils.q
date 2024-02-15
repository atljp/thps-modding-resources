
script create_model_from_appearance editable_list = master_editable_list
    GetCurrentSkaterProfileIndex
    GetSkaterSex player = <currentSkaterProfileIndex>
    if (is_male = 1)
        change hack_shadow_struct = {
            ShadowType = volume
            ShadowVolumeModels = [
                'Models\volume_shadows\volume_board_shadow.shd'
                'Models\volume_shadows\volume_shadow.shd'
            ]
            DoCastTest
            NoAutoUpdate
        }
    else
        change hack_shadow_struct = {
            ShadowType = volume
            ShadowVolumeModels = [
                'Models\volume_shadows\volume_board_shadow.shd'
                'Models\volume_shadows\volume_female_shadow.shd'
            ]
            DoCastTest
            NoAutoUpdate
        }
    endif
    LockCurrentSkaterProfileIndex 1
    modelclearallgeoms
    if GotParam remove_assets
        process_cas_command cas_command = ModelRemoveAsset editable_list = <editable_list>
    endif
    process_cas_command cas_command = modelrunscript editable_list = <editable_list> target = disqualify_script
    process_cas_command cas_command = modeladdgeom editable_list = <editable_list>
    process_cas_command cas_command = geomreplacetexture editable_list = <editable_list>
    model_apply_created_graphics
    model_apply_scale
    process_cas_command cas_command = model_hide_geom editable_list = <editable_list>
    ModelRemovePolys
    model_apply_face_texture
    ModelPropagateHeadColor
    process_cas_command cas_command = GeomModulateColor editable_list = <editable_list>
    allocate_uv_matrix_params
    set_uv_from_appearance
    modelexpandboundingsphere
    ModelFinalize
    LockCurrentSkaterProfileIndex 0
endscript

script create_model_from_appearance_modelviewer 
    create_model_from_appearance \{ editable_list = mv_editable_list remove_assets }
endscript

script create_ped_model_from_appearance 
    LockCurrentSkaterProfileIndex \{ 1 }
    modelclearallgeoms
    ForEachInEditableList \{ do = modeladdgeom }
    model_apply_scale
    ModelRemovePolys
    ForEachInEditableList \{ do = GeomModulateColor }
    ModelFinalize
    LockCurrentSkaterProfileIndex \{ 0 }
endscript

script replace_cutscene_skater_from_appearance 
    LockCurrentSkaterProfileIndex \{ 1 }
    process_cas_command \{ cas_command = geomreplacetexture editable_list = master_editable_list }
    model_apply_face_texture
    ModelPropagateHeadColor
    process_cas_command \{ cas_command = GeomModulateColor editable_list = master_editable_list }
    LockCurrentSkaterProfileIndex \{ 0 }
endscript

script replace_igc_skater_from_appearance 
    GetCurrentSkaterProfileIndex
    GetSkaterSex player = <currentSkaterProfileIndex>
    if (is_male = 1)
        change hack_shadow_struct = {
            ShadowType = volume
            ShadowVolumeModels = [
                'Models\volume_shadows\volume_board_shadow.shd'
                'Models\volume_shadows\volume_shadow.shd'
            ]
            DoCastTest
            NoAutoUpdate
        }
    else
        change hack_shadow_struct = {
            ShadowType = volume
            ShadowVolumeModels = [
                'Models\volume_shadows\volume_board_shadow.shd'
                'Models\volume_shadows\volume_female_shadow.shd'
            ]
            DoCastTest
            NoAutoUpdate
        }
    endif
    LockCurrentSkaterProfileIndex 1
    model_apply_scale
    process_cas_command cas_command = model_hide_geom editable_list = master_editable_list
    model_apply_face_texture
    ModelPropagateHeadColor
    process_cas_command cas_command = GeomModulateColor editable_list = master_editable_list
    allocate_uv_matrix_params
    set_uv_from_appearance
    process_cas_command cas_command = geomreplacetexture editable_list = master_editable_list
    process_cas_command cas_command = modelapplybonescale editable_list = master_scaling_list
    ModelFinalize
    LockCurrentSkaterProfileIndex 0
endscript
face_map_points_saved = 0
original_model_face_points = {
    left_eye = [ 51 61 ]
    right_eye = [ 84 61 ]
    nose = [ 67 84 ]
    lips = [ 67 99 ]
    width = 128
    height = 128
}

script model_apply_face_texture 
    ModelApplyFaceTexture \{ src = 'Body_M_fmap.png' }
endscript

script model_apply_scale 
    <standard_scaling> = 1
    modelresetscale
    if appearanceallowscalingcheat
        if GetGlobalFlag flag = CHEAT_KID
            modelapplybodyshape body_shape = kid_scale_info
            modelapplyobjectscale body_shape = kid_scale_info
            <standard_scaling> = 0
        endif
        if GetGlobalFlag flag = CHEAT_BIGHEAD
            modelapplybodyshape body_shape = bighead_scale_info is_bighead_cheat
            modelapplyobjectscale body_shape = bighead_scale_info
            <standard_scaling> = 0
        endif
        if GetGlobalFlag flag = CHEAT_GORILLA
            modelapplybodyshape body_shape = gorilla_scale_info
            modelapplyobjectscale body_shape = gorilla_scale_info
            <standard_scaling> = 0
        endif
    endif
    if (<standard_scaling> = 1)
        modelapplybodyshape
        modelapplyobjectscale
        process_cas_command cas_command = modelapplybonescale editable_list = master_scaling_list
    endif
    if GetGlobalFlag flag = CHEAT_HOVERBOARD
        modelapplybodyshape body_shape = hoverboard_scale_info
    endif
endscript

script model_apply_created_graphics 
    GeomSetCreatedTexture \{ part = hat_logo }
    GeomSetCreatedTexture \{ part = front_logo }
    GeomSetCreatedTexture \{ part = back_logo }
    GeomSetCreatedTexture \{ part = deck_graphic }
endscript

script model_hide_geom 
    <invisible> = 0
    if NOT InNetGame
        if appearanceallowscalingcheat
            if GetGlobalFlag flag = CHEAT_INVISIBLE
                <invisible> = 1
            endif
        endif
    endif
    if ChecksumEquals a = <part> b = skater_m_head
        modelhidegeom part = <part> <invisible>
        return 
    endif
    if ChecksumEquals a = <part> b = skater_m_hair
        modelhidegeom part = <part> <invisible>
        return 
    endif
    if ChecksumEquals a = <part> b = skater_f_head
        modelhidegeom part = <part> <invisible>
        return 
    endif
    if ChecksumEquals a = <part> b = skater_f_hair
        modelhidegeom part = <part> <invisible>
        return 
    endif
    if ChecksumEquals a = <part> b = Body
        modelhidegeom part = <part> <invisible>
        return 
    endif
endscript

script preload_model_from_appearance 
    modelclearallgeoms
    process_cas_command \{ cas_command = modeladdgeom editable_list = master_editable_list }
endscript

script color_model_from_appearance 
    ModelPropagateHeadColor
    process_cas_command \{ cas_command = GeomModulateColor editable_list = master_editable_list }
endscript

script scale_model_from_appearance 
    model_apply_scale
endscript

script hide_model_from_appearance 
    process_cas_command \{ cas_command = model_hide_geom editable_list = master_editable_list }
endscript

script allocate_uv_matrix_params 
    GetArraySize \{ master_uv_list }
    <index> = 0
    begin 
    GeomAllocateUVMatrixParams (master_uv_list [ <index> ])
    <index> = (<index> + 1)
    repeat <array_size>
endscript

script set_uv_from_appearance 
    GetArraySize \{ master_uv_list }
    <index> = 0
    begin 
    GeomSetUVOffset (master_uv_list [ <index> ])
    <index> = (<index> + 1)
    repeat <array_size>
endscript

script process_cas_command \{ editable_list = master_editable_list }
    ForEachIn <editable_list> do = <cas_command> params = <...> 
endscript

script preselect_random_parts 
    if GotParam num_m_heads
        PreSelectRandomPedMHeads num = <num_m_heads>
    endif
    if GotParam num_m_torsos
        PreSelectRandomPedMTorsos num = <num_m_torsos>
    endif
    if GotParam num_m_legs
        PreSelectRandomPedMLegs num = <num_m_legs>
    endif
    if GotParam num_m_accessories
        PreSelectRandomPedMAccessories num = <num_m_accessories>
    endif
    if GotParam num_f_heads
        PreSelectRandomPedFHeads num = <num_f_heads>
    endif
    if GotParam num_f_torsos
        PreSelectRandomPedFTorsos num = <num_f_torsos>
    endif
    if GotParam num_f_legs
        PreSelectRandomPedFLegs num = <num_f_legs>
    endif
    if GotParam num_f_accessories
        PreSelectRandomPedFAccessories num = <num_f_accessories>
    endif
endscript

script PreSelectRandomPedMHeads \{ num = 3 }
    PreselectRandomPedestrians part = ped_m_head num = <num>
endscript

script PreSelectRandomPedMTorsos \{ num = 3 }
    PreselectRandomPedestrians part = ped_m_torso num = <num>
endscript

script PreSelectRandomPedMLegs \{ num = 3 }
    PreselectRandomPedestrians part = ped_m_legs num = <num>
endscript

script PreSelectRandomPedMAccessories \{ num = 8 }
    PreselectRandomPedestrians part = ped_m_accessories num = <num>
endscript

script PreSelectRandomPedFHeads \{ num = 3 }
    PreselectRandomPedestrians part = ped_f_head num = <num>
endscript

script PreSelectRandomPedFTorsos \{ num = 3 }
    PreselectRandomPedestrians part = ped_f_torso num = <num>
endscript

script PreSelectRandomPedFLegs \{ num = 2 }
    PreselectRandomPedestrians part = ped_f_legs num = <num>
endscript

script PreSelectRandomPedFAccessories \{ num = 3 }
    PreselectRandomPedestrians part = ped_f_accessories num = <num>
endscript

script model_apply_custom_logos \{ player = 0 }
    <logo_parts> = [ hat_logo front_logo back_logo deck_graphic ]
    <index> = 0
    begin 
    if GetPlayerAppearancePart player = <player> part = (<logo_parts> [ <index> ])
        if ChecksumEquals a = <desc_id> b = createdgraphic
            ApplyCustomLogoToPart {
                player = <player>
                part = (<logo_parts> [ <index> ])
            }
        endif
    endif
    <index> = (<index> + 1)
    repeat 4
endscript
