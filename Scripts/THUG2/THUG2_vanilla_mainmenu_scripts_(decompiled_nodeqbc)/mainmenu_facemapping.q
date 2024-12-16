
default_face_points = [{name = 'the center of your right eye' pos = (42.0, 51.0)}
    {name = 'the center of your left eye' pos = (80.0, 51.0)}
    {name = 'the spot between your nostrils' pos = (61.0, 77.0)}
    {name = 'the center of your lips' pos = (61.0, 97.0)}
]
tony_face_points = [(43.0, 42.0)
    (83.0, 44.0)
    (62.0, 72.0)
    (62.0, 88.0)
]
saved_face_points = [(42.0, 51.0)
    (80.0, 51.0)
    (61.0, 77.0)
    (61.0, 97.0)
]
from_CAS_face_mapping = 0
download_from_online = 0

script download_face 
    ChooseFaceForFacemap <...> 
    done_download_face
endscript


script add_item_to_face_menu 
    theme_menu_add_item {text = <name> pad_choose_script = download_face pad_choose_params = { string = <file> }centered = centered}
endscript


script create_face_map_menu brightness = 1.0
    skater ::unhide
    if ScreenElementExists id = cas_category_anchor
        DestroyScreenElement id = cas_category_anchor
    endif
    if GotParam goto_face_map
        init_cas_skater_and_cam
    endif
    
    change goto_face_menu = 0
    GetCurrentSkaterProfileIndex
    if NOT (<currentSkaterProfileIndex> = 0)
        load_pro_skater name = custom
    endif
    if NOT GotParam face_texture
        if NOT GotParam downloaded_face
            maybe_load_default_face
        else
            refresh_skater_model
        endif
    endif
    if NOT GotParam no_textures
        if NOT GotParam no_new_textures
            LoadFaceTextureFromProfile checksum = cas_texture_from_profile
        endif
    endif
    cas_setup_rotating_camera cam_anim = Head
    UnpauseMusicAndStreams
    if GotParam goto_face_map
        face_map_menu
        return 
    endif
    if ScreenElementExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    make_new_themed_sub_menu title = 'FACE MAPPING' pos = (125.0, 80.0) dims = (400.0, 300.0) from_cas
    create_helper_text generic_helper_text_cas
    SetScreenElementProps {id = sub_menu
        event_handlers = [
            {pad_back generic_menu_pad_back params = {callback = face_map_exit new_script = face_map_return_to_cas}}
            { pad_l1 cas_rotate_skater_left }
            { pad_r1 cas_rotate_skater_right }
        ]
    }
    Theme_GetUnhighlightedTextColor return_value = rgba
    theme_menu_add_item {text = '1)' extra_text = 'Choose Face' pad_choose_script = retrieve_face_selected text_just = [ right center ] text_pos = (-30.0, -5.0) ignore_width}
    theme_menu_add_item {text = '2)' extra_text = 'Edit Points' pad_choose_script = face_map_exit pad_choose_params = { new_script = face_map_menu }id = menu_edit_points text_just = [ right center ] text_pos = (-30.0, -5.0) ignore_width}
    theme_menu_add_item {text = '3)' extra_text = 'Match Your Face' pad_choose_script = face_map_exit pad_choose_params = {new_script = face_hsv_menu on_load = on_load hue = 0.0 sat = 1.0 val = 1.0}text_just = [ right center ] text_pos = (-30.0, -5.0) ignore_width}
    theme_menu_add_item {text = '4)' extra_text = 'Color Your Skin' pad_choose_script = face_map_exit pad_choose_params = {new_script = face_skin_menu on_load = on_load}text_just = [ right center ] text_pos = (-30.0, -5.0) ignore_width}
    theme_menu_add_item {text = '5)' extra_text = 'Done        '
        pad_choose_script = face_map_exit
        pad_choose_params = { new_script = face_map_return_to_cas }
        text_just = [ right center ]
        last_menu_item = last_menu_item
        text_pos = (-30.0, -5.0)
    }
    finish_themed_sub_menu
    change disable_menu_sounds = 1
    if GotParam focus_child
        begin 
        FireEvent type = pad_down target = sub_vmenu
        repeat <focus_child>
    endif
    change disable_menu_sounds = 0
endscript


script eye_toy_menu 
    change eye_toy_in_capture_menu = 1
    skater ::hide
    if ScreenElementExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    CreateScreenElement {
        type = containerElement
        parent = root_window
        id = eye_toy_menu_anchor
        dims = (640.0, 480.0)
        pos = (320.0, 240.0)
    }
    AssignAlias id = eye_toy_menu_anchor alias = current_menu_anchor
    create_helper_text eye_toy_helper_text
    SetScreenElementProps {
        id = current_menu_anchor
        event_handlers = [
            {pad_back generic_menu_pad_back params = { callback = exit_eye_toy_menu }}
            { pad_choose eye_toy_capture_face }
            { pad_square eye_toy_toggle_settings }
        ]
    }
    build_theme_sub_title title = 'CAPTURE YOUR FACE' from_cas
    Theme_GetAltColor return_value = frame_color
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        texture = white2
        rgba = <frame_color>
        pos = (185.0, 87.0)
        scale = (34.0, 34.0)
        just = [ left top ]
        z_priority = -1
    }
    Theme_GetHighlightedTextColor return_value = highlight_rgba
    Theme_GetUnhighlightedTextColor return_value = unhighlight_rgba
    CreateScreenElement {
        type = textBlockElement
        parent = current_menu_anchor
        id = directions_text
        text = 'Center your face in the image above and then\npress the \b3 button to capture a picture.'
        pos = (320.0, 368.0)
        dims = (640.0, 60.0)
        font = small
        scale = 0.9000
        rgba = <unhighlight_rgba>
        line_spacing = 0.6500
        z_priority = 5
        just = [ center center ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        texture = myf_box_mid
        pos = (320.0, 370.0)
        scale = (12.0, 1.2000000476837158)
        just = [ center center ]
        rgba = <highlight_rgba>
        z_priority = 5
    }
    GetStackedScreenElementPos X id = <id>
    GetScreenElementPosition id = <id>
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        texture = myf_box_right
        pos = <pos>
        scale = (1.0, 1.2000000476837158)
        just = [ left top ]
        rgba = <highlight_rgba>
        z_priority = 5
    }
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        texture = myf_box_left
        pos = <ScreenElementPos>
        scale = (1.0, 1.2000000476837158)
        just = [ right top ]
        rgba = <highlight_rgba>
        z_priority = 5
    }
    if NOT CD
        PauseMusic 1
    endif
    StartupCaptureDevice
    SetupCaptureBitmapBuffer
    LoadTexture 'faces\CS_NSN_Head_EyeToy'
    Generate32BitImage CS_NSN_Head_EyeToy renderable = 1
    ApplyRGBAToTexture CS_NSN_Head_EyeToy r = 0 g = 0 b = 0 a = 128
    CreateScreenElement {
        id = the_face_test
        type = SpriteElement
        parent = current_menu_anchor
        texture = CS_NSN_Head_EyeToy
        scale = (2.0, 2.0)
        pos = (193.0, 90.0)
        just = [ left top ]
        rgba = [ 128 128 128 128 ]
    }
    SetCaptureDestTexture CS_NSN_Head_EyeToy
    change eye_toy_use_defaults = 0
    eye_toy_toggle_settings
    StartVideoCapture
    FireEvent type = focus target = current_menu_anchor
endscript


script exit_eye_toy_menu back_to_face_map = 1 reset_cam = 1 unload_cas_texture = 1
    DestroyScreenElement id = current_menu_anchor
    if (<reset_cam>)
        StopVideoCapture
        ShutdownCaptureDevice
    endif
    UnloadTexture 'CS_NSN_Head_EyeToy'
    if NOT CD
        PauseMusic 0
    endif
    if (<unload_cas_texture>)
        unload_cas_texture_from_profile
    endif
    change eye_toy_in_capture_menu = 0
    if (<back_to_face_map>)
        create_face_map_menu focus_child = 5
    endif
endscript


script eye_toy_capture_face 
    StopVideoCapture
    SetScreenElementLock id = current_menu_anchor off
    DestroyScreenElement id = the_face_test
    Put32BitImageIntoTexture CS_NSN_Head_EyeToy palette_gen = 1
    SetFaceTextureFromVideoCapture captured_texture = CS_NSN_Head_EyeToy
    get_default_face_texture_name
    if NOT GotParam texturePath
        script_assert 'no texture path?'
    endif
    GetCurrentSkaterProfileIndex
    SetPlayerFacePoints {
        player = <currentSkaterProfileIndex>
        left_eye = [ 44 , 40 ]
        right_eye = [ 87 , 42 ]
        nose = [ 65 , 70 ]
        lips = [ 66 , 88 ]
        width = 128
        height = 128
    }
    SetPlayerFaceOverlayTexture {
        player = <currentSkaterProfileIndex>
        texture = <overlayPath>
    }
    exit_eye_toy_menu
endscript

eye_toy_use_defaults = 1

script eye_toy_toggle_settings 
    change eye_toy_use_defaults = (1 - eye_toy_use_defaults)
    if (eye_toy_use_defaults)
        SetCaptureAttribute auto_gain arg0 = 1
        SetCaptureAttribute auto_brightness arg0 = 1
        SetCaptureAttribute auto_exposure arg0 = 1
        SetCaptureAttribute saturation arg0 = 164
        SetCaptureAttribute backlight_comp arg0 = 0
    else
        SetCaptureAttribute auto_gain arg0 = 0
        SetCaptureAttribute gain arg0 = 255
        SetCaptureAttribute auto_brightness arg0 = 0
        SetCaptureAttribute brightness arg0 = 220
        SetCaptureAttribute auto_exposure arg0 = 0
        SetCaptureAttribute exposure arg0 = 255
        SetCaptureAttribute saturation arg0 = 180
        SetCaptureAttribute backlight_comp arg0 = 1
    endif
endscript

eye_toy_in_capture_menu = 0

script eye_toy_handle_camera_check 
    if (<camera_present>)
        if NOT (eye_toy_in_capture_menu)
            if ScreenElementExists id = eye_toy_menu
                SetScreenElementProps id = eye_toy_menu focusable
                SetScreenElementProps id = { eye_toy_menu_text child = 0 }rgba = [ 128 128 128 128 ]
                SetScreenElementProps id = { eye_toy_menu_text child = 1 }rgba = [ 128 128 128 128 ]
            endif
        endif
    else
        if (eye_toy_in_capture_menu)
            eye_toy_warn_removed
        else
            if ScreenElementExists id = sub_vmenu
                sub_vmenu ::gettags
                if ChecksumEquals a = <tag_selected_id> b = eye_toy_menu
                    FireEvent type = pad_up target = sub_vmenu
                endif
            endif
            if ScreenElementExists id = eye_toy_menu
                SetScreenElementProps id = eye_toy_menu not_focusable
                SetScreenElementProps id = { eye_toy_menu_text child = 0 }rgba = [ 80 80 80 80 ]
                SetScreenElementProps id = { eye_toy_menu_text child = 1 }rgba = [ 80 80 80 80 ]
            endif
        endif
    endif
endscript


script eye_toy_warn_removed 
    StopEyeToyCheck
    StopVideoCapture
    ShutdownCaptureDevice
    FireEvent type = unfocus target = current_menu_anchor
    create_error_box {
        title = 'Warning!'
        text = 'EyeToy® USB Camera (for PlayStation®2) not detected.  Please plug the EyeToy® USB camera (for PlayStation®2) into one of the USB connectors on the front of the console.'
        buttons = [{text = 'OK' pad_choose_script = eye_toy_resolve_removed}]
        no_bg
    }
endscript


script eye_toy_resolve_removed 
    CheckEyeToyPresent
    dialog_box_exit
    if (<camera_present>)
        exit_eye_toy_menu back_to_face_map = 0 reset_cam = 0 unload_cas_texture = 0
        eye_toy_menu
        SpawnEyeToyCheck
    else
        exit_eye_toy_menu reset_cam = 0
    endif
endscript


script setup_face_map_cam 
    wait 2 gameframes
    GoalManager_HidePoints
    GoalManager_HideGoalPoints
    skater ::pausephysics
    UnPauseSkater 0
    MakeSkaterGoto SkateShopAI params = { CAS_Screen NOSFX }
    if LevelIs load_cas
        skater ::Obj_MoveToNode orient name = cas_player_restart
    endif
    KillSkaterCamAnim all
    CalcPosRelative
    target_vector = ((-14.0, 65.0, 0.0))
    pos_vector = ((-14.0, 65.0, 35.0))
    change cas_cam_angle = 0
    change cas_cam_target_x = (<target_vector>.(1.0, 0.0, 0.0))
    change cas_cam_target_y = (<target_vector>.(0.0, 1.0, 0.0))
    change cas_cam_target_z = (<target_vector>.(0.0, 0.0, 1.0))
    change cas_cam_pos_x = (<pos_vector>.(1.0, 0.0, 0.0))
    change cas_cam_pos_y = (<pos_vector>.(0.0, 1.0, 0.0))
    change cas_cam_pos_z = (<pos_vector>.(0.0, 0.0, 1.0))
    get_rotated_vector vector = <target_vector>
    t_off = (<vector> + <pos>)
    get_rotated_vector vector = <pos_vector>
    p_off = (<vector> + <pos>)
    
    skater ::Obj_GetId
    PlaySkaterCamAnim {skater = 0
        targetID = world
        targetOffset = <t_off>
        positionOffset = <p_off>
        play_hold
        frames = 1
        virtual_cam
    }
endscript


script face_map_exit 
    StopEyeToyCheck
    <new_script> <...> 
endscript


script face_map_return_to_cas 
    UnloadCaptureDeviceLibraries
    
    unload_cas_texture_from_profile
    SetNetworkMode
    build_cas_category_menu
    create_pre_cas_menu
    cas_setup_rotating_camera
    skater ::SwitchOffBoard
endscript


script face_back_from_net_setup 
    
    dialog_box_exit
    if ObjectExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    if (in_net_setup_flow = 1)
        create_dialog_box {title = 'Loading'
            text = 'Please wait...'
            no_animate
        }
        wait 10 gameframes
        dialog_box_exit
    endif
    change in_net_setup_flow = 0
    create_face_map_menu focus_child = 4
endscript


script create_face_download_menu_from_net_setup 
    
    dialog_box_exit
    if ObjectExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    create_dialog_box {title = 'Loading'
        text = 'Please wait...'
        no_animate
    }
    wait 10 gameframes
    dialog_box_exit
    change in_net_setup_flow = 0
    create_face_download_menu
endscript


script cancel_face_download_kb 
    destroy_onscreen_keyboard
    change from_CAS_face_mapping = 0
    face_back_from_net_setup
endscript


script create_face_download_menu 
    dialog_box_exit
    change from_CAS_face_mapping = 1
    face_download_chosen cancel_script = cancel_face_download_kb
endscript


script face_go_to_connection_setup_from_dialog 
    dialog_box_exit
    change in_net_setup_flow = 1
    create_dialog_box {title = 'Loading'
        text = 'Please wait...'
        no_animate
    }
    wait 10 gameframes
    dialog_box_exit
    change InNetOptionsFromFaceDownload = 1
    change InNetOptionsFromNetPlay = 0
    create_network_options_menu
endscript


script face_create_net_startup_need_setup_dialog 
    
    create_dialog_box {title = net_status_msg
        text = <text>
        buttons = [{text = ' Yes ' pad_choose_script = face_go_to_connection_setup_from_dialog}
            {text = ' No ' pad_choose_script = <error_script>}
        ]
    }
endscript


script net_setup_succeeded_from_cas 
    SetNetworkMode INTERNET_MODE
    ConnectToInternet success = create_face_download_menu failure = face_back_from_net_setup
endscript


script unload_cas_texture_from_profile 
    
    UnloadTexture cas_texture_from_profile
endscript


script done_download_face 
    unload_cas_texture_from_profile
    create_face_map_menu focus_child = 2 downloaded_face = downloaded_face
endscript


script retrieve_face_selected 
    if ScreenElementExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    FormatText ChecksumName = title_icon '%i_edit_skater' i = (THEME_PREFIXES [ current_theme_prefix ])
    make_new_themed_sub_menu title = 'CHOOSE FACE' title_icon = <title_icon> pos = (80.0, 80.0)
    SetScreenElementProps {id = sub_menu
        event_handlers = [
            { pad_back done_download_face }
        ]
    }
    AddFacesToMenu
    theme_menu_add_item {text = 'Done'
        pad_choose_script = done_download_face
        centered = centered
        last_menu_item = last_menu_item
    }
    finish_themed_sub_menu
endscript


script face_hsv_menu hue = 2.460 sat = 0.9000 val = 0.8700 left_eye = [ 44 , 40 ] right_eye = [ 87 , 42 ] nose = [ 65 , 70 ] lips = [ 66 , 88 ]
    
    if ScreenElementExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    make_new_themed_sub_menu title = 'FACE COLOR' pos = (80.0, 80.0) from_cas
    create_helper_text {helper_text_elements = [{ text = '\b7/\b4=Select' }
            { text = '\b6/\b5=Adjust' }
            { text = '\bn=Back' }
            { text = '\bm=Accept' }
        ]
    }
    SetScreenElementProps {id = sub_menu
        event_handlers = [
            {pad_back generic_menu_pad_back params = {callback = exit_face_hsv id = sub_menu no_textures = no_textures}}
        ]
    }
    Theme_GetUnhighlightedTextColor return_value = rgba
    Theme_GetHighlightedTextColor return_value = highlight_rgba
    load_face_overlay_texture
    get_default_face_texture_name
    SetModelFaceTexturePoints face_points = original_model_face_points
    CopyTexture src = cas_texture_from_profile new = dummy2
    Generate32BitImage dummy2 renderable = 1 store_original = 1
    value = (saved_face_points [ 0 ].(1.0, 0.0))
    CastToInteger value
    SetArrayElement arrayname = left_eye index = 0 newvalue = <value>
    value = (saved_face_points [ 0 ].(0.0, 1.0))
    CastToInteger value
    SetArrayElement arrayname = left_eye index = 1 newvalue = <value>
    value = (saved_face_points [ 1 ].(1.0, 0.0))
    CastToInteger value
    SetArrayElement arrayname = right_eye index = 0 newvalue = <value>
    value = (saved_face_points [ 1 ].(0.0, 1.0))
    CastToInteger value
    SetArrayElement arrayname = right_eye index = 1 newvalue = <value>
    value = (saved_face_points [ 2 ].(1.0, 0.0))
    CastToInteger value
    SetArrayElement arrayname = nose index = 0 newvalue = <value>
    value = (saved_face_points [ 2 ].(0.0, 1.0))
    CastToInteger value
    SetArrayElement arrayname = nose index = 1 newvalue = <value>
    value = (saved_face_points [ 3 ].(1.0, 0.0))
    CastToInteger value
    SetArrayElement arrayname = lips index = 0 newvalue = <value>
    value = (saved_face_points [ 3 ].(0.0, 1.0))
    CastToInteger value
    SetArrayElement arrayname = lips index = 1 newvalue = <value>
    AdjustFaceTextureToModel {texture = dummy2
        face_points = {
            left_eye = <left_eye>
            right_eye = <right_eye>
            nose = <nose>
            lips = <lips>
            width = 128
            height = 128
        }
    }
    current_face_points = {h = <hue> s = <sat> v = <val>}
    GetCurrentSkaterProfileIndex
    GetPlayerFacePoints player = <currentSkaterProfileIndex>
    <hue> = (<current_face_points>.h)
    <sat> = (<current_face_points>.s)
    <val> = (<current_face_points>.v)
    AdjustTextureHSV dummy2 h = <hue> s = <sat> v = <val>
    CreateScreenElement {
        type = SpriteElement
        id = val_bar
        parent = sub_menu
        just = [ left center ]
        pos = (134.0, 108.0)
        scale = (4.0, 2.0)
        texture = bw_slider
        rgba = colormenu_bar_unfocus_rgba
    }
    CreateScreenElement {
        type = SpriteElement
        parent = sub_menu
        just = [ left center ]
        pos = ((132.0, 101.0) + (<val>)* (60.0, 0.0))
        scale = colormenu_arrow_scale
        texture = down_arrow
        rgba = [ 128 128 128 128 ]
        z_priority = 10
    }
    CreateScreenElement {
        type = SpriteElement
        parent = sub_menu
        just = [ left center ]
        pos = ((132.0, 115.0) + (<val>)* (60.0, 0.0))
        scale = colormenu_arrow_scale
        texture = up_arrow
        rgba = [ 128 128 128 128 ]
        z_priority = 10
    }
    CreateScreenElement {
        type = SpriteElement
        id = sat_bar
        parent = sub_menu
        just = [ left center ]
        pos = (134.0, 131.0)
        scale = (4.0, 2.0)
        texture = bw_slider
        rgba = colormenu_bar_unfocus_rgba
    }
    CreateScreenElement {
        type = SpriteElement
        parent = sub_menu
        just = [ left center ]
        pos = ((132.0, 124.0) + (<sat>)* (60.0, 0.0))
        scale = colormenu_arrow_scale
        texture = down_arrow
        rgba = [ 128 128 128 128 ]
        z_priority = 10
    }
    CreateScreenElement {
        type = SpriteElement
        parent = sub_menu
        just = [ left center ]
        pos = ((132.0, 138.0) + (<sat>)* (60.0, 0.0))
        scale = colormenu_arrow_scale
        texture = up_arrow
        rgba = [ 128 128 128 128 ]
        z_priority = 10
    }
    CreateScreenElement {
        type = SpriteElement
        id = hue_bar
        parent = sub_menu
        just = [ left center ]
        pos = (134.0, 154.0)
        scale = (4.0, 2.0)
        texture = bw_slider
        rgba = colormenu_bar_unfocus_rgba
    }
    if (<hue> < 181.0)
        <hue> = (180.0 + (<hue> * 18.0))
    else
        <hue> = ((<hue> -350)* 18.0)
    endif
    CreateScreenElement {
        type = SpriteElement
        parent = sub_menu
        just = [ left center ]
        pos = ((132.0, 147.0) + (<hue>)* (0.3333300054073334, 0.0))
        scale = colormenu_arrow_scale
        texture = down_arrow
        z_priority = 10
        rgba = [ 128 128 128 128 ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = sub_menu
        just = [ left center ]
        pos = ((132.0, 161.0) + (<hue>)* (0.3333300054073334, 0.0))
        scale = colormenu_arrow_scale
        z_priority = 10
        texture = up_arrow
        rgba = [ 128 128 128 128 ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = sub_menu
        texture = white2
        pos = (320.0, 87.0)
        scale = 30
        just = [ left top ]
        rgba = <highlight_rgba>
        z_priority = 5
    }
    get_default_face_texture_name
    CreateScreenElement {
        type = SpriteElement
        parent = <id>
        id = temp_preview_overlay
        just = [ left top ]
        pos = (0.15000000596046448, 0.07999999821186066)
        scale = (0.05999999865889549, 0.061000000685453415)
        texture = <overlayName>
        rgba = [ 128 128 128 128 ]
        z_priority = 10
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <id>
        id = temp_preview
        just = [ left top ]
        pos = (22.0, 27.0)
        scale = (0.699999988079071, 0.699999988079071)
        texture = dummy2
        rgba = [ 128 128 128 128 ]
        z_priority = 9
    }
    Theme_GetPauseBarColor return_value = bar_rgba
    CreateScreenElement {
        type = SpriteElement
        parent = sub_menu
        local_id = val_highlight
        z_priority = 2
        pos = (178.0, 108.0)
        scale = (5.5, 0.8500000238418579)
        texture = roundbar_middle
        rgba = <bar_rgba>
    }
    DoScreenElementMorph id = <id> alpha = 0 time = 0
    CreateScreenElement {
        type = SpriteElement
        parent = sub_menu
        local_id = sat_highlight
        z_priority = 2
        pos = (178.0, 131.0)
        scale = (5.5, 0.8500000238418579)
        texture = roundbar_middle
        rgba = <bar_rgba>
    }
    DoScreenElementMorph id = <id> alpha = 0 time = 0
    CreateScreenElement {
        type = SpriteElement
        parent = sub_menu
        local_id = hue_highlight
        z_priority = 2
        pos = (178.0, 154.0)
        scale = (5.5, 0.8500000238418579)
        texture = roundbar_middle
        rgba = <bar_rgba>
    }
    DoScreenElementMorph id = <id> alpha = 0 time = 0
    DoScreenElementMorph id = { sub_menu child = 2 }time = 0 alpha = 0
    DoScreenElementMorph id = { sub_menu child = 3 }time = 0 alpha = 0
    DoScreenElementMorph id = { sub_menu child = 5 }time = 0 alpha = 0
    DoScreenElementMorph id = { sub_menu child = 6 }time = 0 alpha = 0
    DoScreenElementMorph id = { sub_menu child = 8 }time = 0 alpha = 0
    DoScreenElementMorph id = { sub_menu child = 9 }time = 0 alpha = 0
    theme_menu_add_item text = 'VAL.     ' scale = (1.2000000476837158, 0.800000011920929) id = match_val focus_script = face_hsv_focus focus_params = { type = val }unfocus_script = face_hsv_unfocus unfocus_params = { type = val }pad_choose_script = null_script pad_right_script = face_hsv_increase pad_right_params = {type = val id = sub_menu}pad_left_script = face_hsv_decrease pad_left_params = {type = val id = sub_menu}text_spacing = 2.0
    theme_menu_add_item text = 'SAT.     ' scale = (1.2000000476837158, 0.800000011920929) id = match_sat focus_script = face_hsv_focus focus_params = { type = sat }unfocus_script = face_hsv_unfocus unfocus_params = { type = sat }pad_choose_script = null_script pad_right_script = face_hsv_increase pad_right_params = {type = sat id = sub_menu}pad_left_script = face_hsv_decrease pad_left_params = {type = sat id = sub_menu}text_spacing = 2.0
    theme_menu_add_item text = 'HUE     ' scale = (1.2000000476837158, 0.800000011920929) id = match_hue focus_script = face_hsv_focus focus_params = { type = hue }unfocus_script = face_hsv_unfocus unfocus_params = { type = hue }pad_choose_script = null_script pad_right_script = face_hsv_increase pad_right_params = {type = hue id = sub_menu}pad_left_script = face_hsv_decrease pad_left_params = {type = hue id = sub_menu}text_spacing = 2.0
    theme_menu_add_item text = 'Reset To Default' pad_choose_script = reset_face_hsv pad_choose_params = { id = sub_menu }centered = 1 ignore_width
    theme_menu_add_item text = 'Done' pad_choose_script = exit_face_hsv pad_choose_params = {id = sub_menu no_textures = no_textures}last_menu_item = 1
    if GotParam no_animate
        finish_themed_sub_menu time = 0.0
    else
        finish_themed_sub_menu
    endif
    CreateScreenElement {
        type = textBlockElement
        parent = current_menu_anchor
        id = directions_text
        text = 'Adjust your face color so that it blends\n seamlessly with the surrounding skin'
        pos = (320.0, 368.0)
        dims = (640.0, 60.0)
        font = small
        scale = 0.9000
        rgba = <rgba>
        line_spacing = 0.6500
        z_priority = 5
        just = [ center center ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        id = directions_box
        texture = myf_box_mid
        pos = (320.0, 370.0)
        scale = (12.0, 1.2000000476837158)
        just = [ center center ]
        rgba = <highlight_rgba>
        z_priority = 5
    }
    GetStackedScreenElementPos X id = <id>
    GetScreenElementPosition id = <id>
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        texture = myf_box_right
        pos = <pos>
        scale = (1.0, 1.2000000476837158)
        just = [ left top ]
        rgba = <highlight_rgba>
        z_priority = 5
    }
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        texture = myf_box_left
        pos = <ScreenElementPos>
        scale = (1.0, 1.2000000476837158)
        just = [ right top ]
        rgba = <highlight_rgba>
        z_priority = 5
    }
endscript


script reset_face_hsv 
    get_default_face_texture_name
    AdjustTextureHSV dummy2 h = <hue> s = <sat> v = <val>
    
    if (<hue> < 181.0)
        <hue> = (180.0 + (<hue> * 18.0))
    else
        <hue> = ((<hue> -350)* 18.0)
    endif
    SetScreenElementProps {id = {<id> child = 2}
        pos = ((130.0, 103.0) + (60.0, 0.0) * <val>)
    }
    SetScreenElementProps {id = {<id> child = 3}
        pos = ((130.0, 117.0) + (60.0, 0.0) * <val>)
    }
    SetScreenElementProps {id = {<id> child = 5}
        pos = ((130.0, 126.0) + (60.0, 0.0) * <sat>)
    }
    SetScreenElementProps {id = {<id> child = 6}
        pos = ((130.0, 140.0) + (60.0, 0.0) * <sat>)
    }
    SetScreenElementProps {id = {<id> child = 8}
        pos = ((130.0, 149.0) + <hue> * (0.3333300054073334, 0.0))
    }
    SetScreenElementProps {id = {<id> child = 9}
        pos = ((130.0, 163.0) + <hue> * (0.3333300054073334, 0.0))
    }
endscript


script face_hsv_focus 
    <text_rgba> = [0 , 0 , 0 , 128]
    if (<type> = hue)
        DoScreenElementMorph id = { sub_menu child = 8 }time = 0 alpha = 1
        DoScreenElementMorph id = { sub_menu child = 9 }time = 0 alpha = 1
        SetScreenElementProps {
            id = { sub_menu child = 7 }
            rgba = [ 200 100 100 118 ]
        }
        DoScreenElementMorph id = { sub_menu child = hue_highlight }time = 0 alpha = 1
        SetScreenElementProps {
            id = { match_hue child = 0 }
            rgba = <text_rgba>
        }
    endif
    if (<type> = sat)
        DoScreenElementMorph id = { sub_menu child = 5 }time = 0 alpha = 1
        DoScreenElementMorph id = { sub_menu child = 6 }time = 0 alpha = 1
        SetScreenElementProps {
            id = { sub_menu child = 4 }
            rgba = colormenu_bar_focus_rgba
        }
        DoScreenElementMorph id = { sub_menu child = sat_highlight }time = 0 alpha = 1
        SetScreenElementProps {
            id = { match_sat child = 0 }
            rgba = <text_rgba>
        }
    endif
    if (<type> = val)
        DoScreenElementMorph id = { sub_menu child = 2 }time = 0 alpha = 1
        DoScreenElementMorph id = { sub_menu child = 3 }time = 0 alpha = 1
        SetScreenElementProps {
            id = { sub_menu child = 1 }
            rgba = colormenu_bar_focus_rgba
        }
        DoScreenElementMorph id = { sub_menu child = val_highlight }time = 0 alpha = 1
        SetScreenElementProps {
            id = { match_val child = 0 }
            rgba = <text_rgba>
        }
    endif
endscript


script face_hsv_unfocus 
    <text_rgba> = [128 , 128 , 128 , 128]
    if (<type> = hue)
        DoScreenElementMorph id = { sub_menu child = 8 }time = 0 alpha = 0
        DoScreenElementMorph id = { sub_menu child = 9 }time = 0 alpha = 0
        SetScreenElementProps {
            id = { sub_menu child = 7 }
            rgba = colormenu_bar_unfocus_rgba
        }
        DoScreenElementMorph id = { sub_menu child = hue_highlight }time = 0 alpha = 0
        SetScreenElementProps {
            id = { match_hue child = 0 }
            rgba = <text_rgba>
        }
    endif
    if (<type> = sat)
        DoScreenElementMorph id = { sub_menu child = 5 }time = 0 alpha = 0
        DoScreenElementMorph id = { sub_menu child = 6 }time = 0 alpha = 0
        SetScreenElementProps {
            id = { sub_menu child = 4 }
            rgba = colormenu_bar_unfocus_rgba
        }
        DoScreenElementMorph id = { sub_menu child = sat_highlight }time = 0 alpha = 0
        SetScreenElementProps {
            id = { match_sat child = 0 }
            rgba = <text_rgba>
        }
    endif
    if (<type> = val)
        DoScreenElementMorph id = { sub_menu child = 2 }time = 0 alpha = 0
        DoScreenElementMorph id = { sub_menu child = 3 }time = 0 alpha = 0
        SetScreenElementProps {
            id = { sub_menu child = 1 }
            rgba = colormenu_bar_unfocus_rgba
        }
        DoScreenElementMorph id = { sub_menu child = val_highlight }time = 0 alpha = 0
        SetScreenElementProps {
            id = { match_val child = 0 }
            rgba = <text_rgba>
        }
    endif
endscript


script exit_face_hsv 
    if ObjectExists id = temp_preview
        DestroyScreenElement id = temp_preview
    endif
    if ObjectExists id = temp_preview_overlay
        DestroyScreenElement id = temp_preview_overlay
    endif
    GetScreenElementPosition {id = {<id> child = 8}}
    <current_hue> = ((((<ScreenElementPos>).(1.0, 0.0))-130.0)* 3.0)
    if (<current_hue> < 181.0)
        <current_hue> = (350.0 + (<current_hue> / 18.0))
    else
        <current_hue> = ((<current_hue> -180.0)/ 18.0)
    endif
    GetScreenElementPosition {id = {<id> child = 5}}
    <current_sat> = ((((<ScreenElementPos>).(1.0, 0.0))-130.0)/ 60.0)
    GetScreenElementPosition {id = {<id> child = 2}}
    <current_val> = ((((<ScreenElementPos>).(1.0, 0.0))-130.0)/ 60.0)
    unload_face_overlay_texture
    
    UnloadTexture 'dummy2'
    GetCurrentSkaterProfileIndex
    GetPlayerFacePoints player = <currentSkaterProfileIndex>
    current_face_points = {<current_face_points> h = <current_hue> s = <current_sat> v = <current_val>}
    SetPlayerFacePoints player = <currentSkaterProfileIndex> face_points = <current_face_points>
    RefreshSkaterModel skater = 0 profile = <currentSkaterProfileIndex> no_board = no_board
    create_face_map_menu <...> focus_child = 4
endscript


script load_face_overlay_texture 
    get_default_face_texture_name
    LoadTexture <overlayPath>
    SetFaceMassageTextureOverlay <overlayName>
endscript


script unload_face_overlay_texture 
    get_default_face_texture_name
    UnloadTexture <overlayPath>
endscript


script face_hsv_increase 
    GetScreenElementPosition {id = {<id> child = 8}}
    <current_hue> = ((((<ScreenElementPos>).(1.0, 0.0))-130.0)* 3.0)
    GetScreenElementPosition {id = {<id> child = 5}}
    <current_sat> = ((((<ScreenElementPos>).(1.0, 0.0))-130.0)/ 60.0)
    GetScreenElementPosition {id = {<id> child = 2}}
    <current_val> = ((((<ScreenElementPos>).(1.0, 0.0))-130.0)/ 60.0)
    if (<type> = hue)
        <current_hue> = (<current_hue> + 6.0)
        if (<current_hue> > 360)
            <current_hue> = (<current_hue> -6.0)
        else
            SetScreenElementProps {id = {<id> child = 8}
                pos = ((130.0, 149.0) + (<current_hue>)* (0.3333300054073334, 0.0))
            }
            SetScreenElementProps {id = {<id> child = 9}
                pos = ((130.0, 163.0) + (<current_hue>)* (0.3333300054073334, 0.0))
            }
        endif
    endif
    if (<type> = sat)
        <current_sat> = (<current_sat> + 0.02000)
        if (<current_sat> > 2.0)
            <current_sat> = (<current_sat> -0.02000)
        else
            SetScreenElementProps {id = {<id> child = 5}
                pos = ((130.0, 126.0) + (<current_sat>)* (60.0, 0.0))
            }
            SetScreenElementProps {id = {<id> child = 6}
                pos = ((130.0, 140.0) + (<current_sat>)* (60.0, 0.0))
            }
        endif
    endif
    if (<type> = val)
        <current_val> = (<current_val> + 0.02000)
        if (<current_val> > 2.0)
            <current_val> = (<current_val> -0.02000)
        else
            SetScreenElementProps {id = {<id> child = 2}
                pos = ((130.0, 103.0) + (<current_val>)* (60.0, 0.0))
            }
            SetScreenElementProps {id = {<id> child = 3}
                pos = ((130.0, 117.0) + (<current_val>)* (60.0, 0.0))
            }
        endif
    endif
    if (<current_hue> < 181.0)
        <current_hue> = (350.0 + (<current_hue> / 18.0))
    else
        <current_hue> = ((<current_hue> -180.0)/ 18.0)
    endif
    AdjustTextureHSV dummy2 h = <current_hue> s = <current_sat> v = <current_val>
endscript


script face_hsv_decrease 
    GetScreenElementPosition {id = {<id> child = 8}}
    <current_hue> = ((((<ScreenElementPos>).(1.0, 0.0))-130.0)* 3.0)
    GetScreenElementPosition {id = {<id> child = 5}}
    <current_sat> = ((((<ScreenElementPos>).(1.0, 0.0))-130.0)/ 60.0)
    GetScreenElementPosition {id = {<id> child = 2}}
    <current_val> = ((((<ScreenElementPos>).(1.0, 0.0))-130.0)/ 60.0)
    if (<type> = hue)
        <current_hue> = (<current_hue> -6.0)
        if (<current_hue> < 0)
            <current_hue> = (<current_hue> + 6.0)
        else
            SetScreenElementProps {id = {<id> child = 8}
                pos = ((130.0, 149.0) + (<current_hue>)* (0.3333300054073334, 0.0))
            }
            SetScreenElementProps {id = {<id> child = 9}
                pos = ((130.0, 163.0) + (<current_hue>)* (0.3333300054073334, 0.0))
            }
        endif
    endif
    if (<type> = sat)
        <current_sat> = (<current_sat> -0.02000)
        if (<current_sat> < 0)
            <current_sat> = (<current_sat> + 0.02000)
        else
            SetScreenElementProps {id = {<id> child = 5}
                pos = ((130.0, 126.0) + (<current_sat>)* (60.0, 0.0))
            }
            SetScreenElementProps {id = {<id> child = 6}
                pos = ((130.0, 140.0) + (<current_sat>)* (60.0, 0.0))
            }
        endif
    endif
    if (<type> = val)
        <current_val> = (<current_val> -0.02000)
        if (<current_val> < 0)
            <current_val> = (<current_val> + 0.02000)
        else
            SetScreenElementProps {id = {<id> child = 2}
                pos = ((130.0, 103.0) + (<current_val>)* (60.0, 0.0))
            }
            SetScreenElementProps {id = {<id> child = 3}
                pos = ((130.0, 117.0) + (<current_val>)* (60.0, 0.0))
            }
        endif
    endif
    if (<current_hue> < 181.0)
        <current_hue> = (350.0 + (<current_hue> / 18.0))
    else
        <current_hue> = ((<current_hue> -180.0)/ 18.0)
    endif
    AdjustTextureHSV dummy2 h = <current_hue> s = <current_sat> v = <current_val>
endscript


script face_skin_menu 
    if ScreenElementExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    make_new_themed_sub_menu title = 'SKIN COLOR' pos = (80.0, 90.0) from_cas
    theme_background pos = (180.0, 87.0) width = 2.050 num_parts = 3 parent = current_menu_anchor
    create_helper_text {helper_text_elements = [{ text = '\b7/\b4=Select' }
            { text = '\b6/\b5=Adjust' }
            { text = '\bn=Back' }
            { text = '\bm=Accept' }
            { text = '\bs/\bt = Rotate' }
        ]
    }
    SetScreenElementProps {
        id = sub_menu
        event_handlers = [
            {pad_back generic_menu_pad_back params = {callback = exit_face_skin id = sub_menu no_textures = no_textures}}
            { pad_l1 cas_rotate_skater_left }
            { pad_r1 cas_rotate_skater_right }
        ]
    }
    Theme_GetUnhighlightedTextColor return_value = rgba
    Theme_GetHighlightedTextColor return_value = highlight_rgba
    GetCurrentSkaterProfileIndex
    GetSkaterProfileInfo player = <currentSkaterProfileIndex>
    if (<is_male> = 1)
        <head_part> = skater_m_head
    else
        <head_part> = skater_f_head
    endif
    colormenu_add_options_to_menu part = <head_part> from_caf = 1 text_pos = (0.0, -4.0) icon_pos = (115.0, -4.0) arrow_pos_up = (100.0, 4.0) arrow_pos_down = (100.0, -12.0) bar_pos = (93.0, -3.0)
    SetScreenElementLock id = current_menu off
    theme_menu_add_item text = 'Reset To Default' no_bg centered = 1 ignore_width static_width = 500 highlight_bar_pos = (82.0, -7.0) highlight_bar_scale = (1.899999976158142, 0.699999988079071) pad_choose_script = colormenu_reset_to_default pad_choose_params = { part = <head_part> }
    theme_menu_add_item text = 'Done' no_bg ignore_width centered = 1 static_width = 500 highlight_bar_pos = (82.0, -7.0) highlight_bar_scale = (1.899999976158142, 0.699999988079071) pad_choose_script = exit_face_skin pad_choose_params = {id = sub_menu no_textures = no_textures}last_menu_item = 1
    finish_themed_sub_menu
    CreateScreenElement {
        type = textBlockElement
        parent = current_menu_anchor
        id = directions_text
        text = 'Adjust the color of the skin on your\n entire body as desired'
        pos = (320.0, 668.0)
        dims = (640.0, 60.0)
        font = small
        scale = 0.9000
        rgba = <rgba>
        line_spacing = 0.6500
        z_priority = 5
        just = [ center center ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        id = directions_box
        texture = myf_box_mid
        pos = (320.0, 670.0)
        scale = (12.0, 1.2000000476837158)
        just = [ center center ]
        rgba = <highlight_rgba>
        z_priority = 5
    }
    DoScreenElementMorph id = directions_text time = 0.2000 pos = (320.0, 368.0)
    DoScreenElementMorph id = directions_box time = 0.2000 pos = (320.0, 370.0)
    DoScreenElementMorph id = bg_box_vmenu time = 0.0 pos = (180.0, 587.0)
    DoScreenElementMorph id = bg_box_vmenu time = 0.2000 pos = (180.0, 87.0)
endscript


script exit_face_skin 
    create_face_map_menu <...> focus_child = 5
endscript


script face_map_menu scale = 2
    
    if ScreenElementExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    SetScreenElementLock id = root_window off
    CreateScreenElement {
        type = containerElement
        parent = root_window
        id = face_map_menu_anchor
        dims = (640.0, 480.0)
        pos = (320.0, 240.0)
    }
    AssignAlias id = face_map_menu_anchor alias = current_menu_anchor
    create_helper_text generic_helper_text_up_down_left_right
    unpauseskaters
    SetScreenElementProps {id = current_menu_anchor
        event_handlers = [
            { pad_l1 cas_rotate_skater_left }
            { pad_r1 cas_rotate_skater_right }
            {pad_back generic_menu_pad_back params = { callback = cancel_face_map }}
        ]
    }
    build_theme_sub_title title = 'FACE MAPPING' from_cas
    theme_background pos = (173.0, 85.0) num_parts = 9 parent = current_menu_anchor width = 2.450
    theme_background pos = (469.0, 85.0) num_parts = 9 parent = current_menu_anchor width = 2.450 id = bg_box_vmenu2
    Theme_GetHighlightedTextColor return_value = highlight_rgba
    Theme_GetUnhighlightedTextColor return_value = unhighlight_rgba
    CreateScreenElement {
        type = containerElement
        parent = current_menu_anchor
        id = face_anchor
        pos = (45.0, 95.0)
        dims = (256.0, 256.0)
        just = [ left top ]
    }
    CreateScreenElement {
        type = textElement
        parent = face_anchor
        text = 'Your Face'
        pos = (128.0, 5.0)
        font = small
        scale = 1.500
        rgba = <highlight_rgba>
        z_priority = 5
        just = [ center center ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = face_anchor
        pos = (128.0, 8.0)
        texture = myf_frame
        just = [ center center ]
        scale = (2.0999999046325684, 1.0)
        z_priority = 4
    }
    CreateScreenElement {
        type = SpriteElement
        parent = face_anchor
        id = your_face
        pos = (0.0, 0.0)
        texture = cas_texture_from_profile
        just = [ left top ]
        scale = <scale>
    }
    CreateScreenElement {
        type = SpriteElement
        parent = face_anchor
        pos = (128.0, 242.0)
        texture = myf_frame
        just = [ center center ]
        scale = (2.0999999046325684, 1.0)
        z_priority = 4
        rot_angle = 180
    }
    CreateScreenElement {
        type = SpriteElement
        parent = face_anchor
        id = point_arrow
        texture = myf_crosshair
        pos = (85.0, 130.0)
        alpha = 0
        z_priority = 900
        just = [ center center ]
        rgba = [ 0 0 100 128 ]
    }
    CreateScreenElement {
        type = containerElement
        parent = current_menu_anchor
        id = tony_face_anchor
        pos = (341.0, 95.0)
        dims = (256.0, 256.0)
        just = [ left top ]
    }
    CreateScreenElement {
        type = textElement
        parent = tony_face_anchor
        text = 'Example'
        pos = (128.0, 5.0)
        font = small
        scale = 1.500
        rgba = <unhighlight_rgba>
        z_priority = 5
        just = [ center center ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = tony_face_anchor
        pos = (128.0, 8.0)
        texture = myf_frame
        just = [ center center ]
        scale = (2.0999999046325684, 1.0)
        z_priority = 4
    }
    CreateScreenElement {
        type = SpriteElement
        parent = tony_face_anchor
        pos = (0.0, 0.0)
        texture = myf_example
        just = [ left top ]
        scale = <scale>
    }
    CreateScreenElement {
        type = SpriteElement
        parent = tony_face_anchor
        pos = (128.0, 242.0)
        texture = myf_frame
        just = [ center center ]
        scale = (2.0999999046325684, 1.0)
        z_priority = 4
        rot_angle = 180
    }
    CreateScreenElement {
        type = SpriteElement
        parent = tony_face_anchor
        id = tony_arrow
        texture = myf_crosshair
        pos = (85.0, 130.0)
        alpha = 0
        z_priority = 900
        just = [ center center ]
        rgba = [ 100 0 0 128 ]
        scale = 1.400
    }
    CreateScreenElement {
        type = textBlockElement
        parent = current_menu_anchor
        id = directions_text
        text = ''
        pos = (320.0, 368.0)
        dims = (640.0, 60.0)
        font = small
        scale = 0.9000
        rgba = <unhighlight_rgba>
        line_spacing = 0.6500
        z_priority = 5
        just = [ center center ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        texture = myf_box_mid
        pos = (320.0, 370.0)
        scale = (12.0, 1.2000000476837158)
        just = [ center center ]
        rgba = <highlight_rgba>
        z_priority = 5
    }
    GetStackedScreenElementPos X id = <id>
    GetScreenElementPosition id = <id>
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        texture = myf_box_right
        pos = <pos>
        scale = (1.0, 1.2000000476837158)
        just = [ left top ]
        rgba = <highlight_rgba>
        z_priority = 5
    }
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        texture = myf_box_left
        pos = <ScreenElementPos>
        scale = (1.0, 1.2000000476837158)
        just = [ right top ]
        rgba = <highlight_rgba>
        z_priority = 5
    }
    FireEvent type = focus target = current_menu_anchor
    KillSpawnedScript name = get_face_points
    spawnscript get_face_points
endscript


script cancel_face_map 
    KillSpawnedScript name = get_face_points
    create_face_map_menu no_textures focus_child = 3
endscript


script get_face_points scale = 2
    Theme_GetHighlightedTextColor return_value = highlight_rgba
    left_eye = [ 0 0 ]
    right_eye = [ 0 0 ]
    nose = [ 0 0 ]
    lips = [ 0 0 ]
    GetArraySize default_face_points
    DoScreenElementMorph id = point_arrow alpha = 1
    DoScreenElementMorph id = tony_arrow alpha = 1
    RunScriptOnScreenElement id = point_arrow blink_tony_face_arrow
    if (face_map_points_saved = 1)
        create_saved_face_points highlight_rgba = <highlight_rgba>
    endif
    index = 0
    begin 
    if (face_map_points_saved = 0)
        pos = ((default_face_points [ <index> ].pos)* <scale>)
    else
        FormatText ChecksumName = point_id 'point%i' i = <index>
        if ScreenElementExists id = <point_id>
            DestroyScreenElement id = <point_id>
        endif
        pos = ((saved_face_points [ <index> ])* <scale>)
    endif
    tony_pos = ((tony_face_points [ <index> ])* <scale>)
    DoScreenElementMorph id = point_arrow pos = <pos>
    DoScreenElementMorph id = tony_arrow pos = <tony_pos>
    RunScriptOnScreenElement adjust_face_point id = point_arrow params = { pos = <pos> }
    FormatText textname = directions 'Select %i\nusing the keyboard and press \bm' i = (default_face_points [ <index> ].name)
    SetScreenElementProps id = directions_text text = <directions>
    WaitForEvent type = pad_choose
    KillSpawnedScript name = adjust_face_point
    GetScreenElementPosition id = point_arrow
    face_x = ((<ScreenElementPos>.(1.0, 0.0) + 16)* (1.0 / <scale>))
    face_y = ((<ScreenElementPos>.(0.0, 1.0) + 16)* (1.0 / <scale>))
    CastToInteger face_x
    CastToInteger face_y
    new_pos = ((1.0, 0.0) * <face_x> + (0.0, 1.0) * <face_y>)
    switch <index>
        case 0
        SetArrayElement arrayname = left_eye index = 0 newvalue = <face_x>
        SetArrayElement arrayname = left_eye index = 1 newvalue = <face_y>
        case 1
        SetArrayElement arrayname = right_eye index = 0 newvalue = <face_x>
        SetArrayElement arrayname = right_eye index = 1 newvalue = <face_y>
        case 2
        SetArrayElement arrayname = nose index = 0 newvalue = <face_x>
        SetArrayElement arrayname = nose index = 1 newvalue = <face_y>
        case 3
        SetArrayElement arrayname = lips index = 0 newvalue = <face_x>
        SetArrayElement arrayname = lips index = 1 newvalue = <face_y>
    endswitch
    saved_face_points2 = saved_face_points
    SetArrayElement arrayname = saved_face_points2 index = <index> newvalue = <new_pos>
    FormatText ChecksumName = point_id 'point%i' i = <index>
    if NOT ScreenElementExists id = <point_id>
        SetScreenElementLock off id = face_anchor
        CreateScreenElement {
            type = SpriteElement
            parent = face_anchor
            id = <point_id>
            texture = myf_dot
            pos = (<new_pos> * 2)
            z_priority = 800
            just = [ center center ]
            rgba = <highlight_rgba>
            scale = 2
        }
    else
        
    endif
    index = (<index> + 1)
    if (<index> = <array_size>)
        break 
    endif
    repeat 
    change face_map_points_saved = 1
    SetScreenElementProps id = directions_text text = 'Mapping Face Now...'
    DoScreenElementMorph id = directions_text scale = 1.500
    DoScreenElementMorph id = point_arrow alpha = 0
    wait 2 gameframe
    GetCurrentSkaterProfileIndex
    SetPlayerFacePoints {
        player = <currentSkaterProfileIndex>
        left_eye = <left_eye>
        right_eye = <right_eye>
        nose = <nose>
        lips = <lips>
        width = 128
        height = 128
    }
    GetCurrentSkaterProfileIndex
    RefreshSkaterModel skater = 0 profile = <currentSkaterProfileIndex> no_board = no_board
    create_face_map_menu no_new_textures focus_child = 3
endscript


script clear_face_texture_from_profile 
    GetCurrentSkaterProfileIndex
    ClearPlayerFaceTexture player = <currentSkaterProfileIndex>
    RefreshSkaterModel skater = 0 profile = <currentSkaterProfileIndex> no_board = no_board
endscript


script blink_tony_face_arrow 
    begin 
    DoMorph alpha = 1
    wait 0.3000 seconds
    DoMorph alpha = 0.6000 time = 0.3000
    repeat 
endscript


script adjust_face_point pos = (320.0, 240.0)
    controller = 0
    got_controller = 0
    begin 
    if ControllerBoundToSkater controller = <controller> skater = 0
        got_controller = 1
        break 
    endif
    controller = (<controller> + 1)
    repeat 4
    if (got_controller = 0)
        return 
    endif
    begin 
    GetAnalogueInfo controller = <controller>
    new_pos = (<pos> + (<leftx> * (1.0, 0.0) + <lefty> * (0.0, 1.0)))
    if (0 > <pos>.(1.0, 0.0))
        if (0 > <leftx>)
            new_pos = (<new_pos> - (<leftx> * (2.0, 0.0)))
        endif
    else
        if (<pos>.(1.0, 0.0) > 254)
            if (<leftx> > 0)
                new_pos = (<new_pos> - (<leftx> * (2.0, 0.0)))
            endif
        endif
    endif
    if (0 > <pos>.(0.0, 1.0))
        if (0 > <lefty>)
            new_pos = (<new_pos> - (<lefty> * (0.0, 2.0)))
        endif
    else
        if (<pos>.(0.0, 1.0) > 254)
            if (<lefty> > 0)
                new_pos = (<new_pos> - (<lefty> * (0.0, 2.0)))
            endif
        endif
    endif
    DoMorph pos = <new_pos>
    pos = <new_pos>
    wait 2 gameframe
    repeat 
endscript


script create_saved_face_points scale = 2
    index = 1
    SetScreenElementLock off id = face_anchor
    begin 
    FormatText ChecksumName = point_id 'point%i' i = <index>
    pos = ((saved_face_points [ <index> ])* <scale>)
    CreateScreenElement {
        type = SpriteElement
        parent = face_anchor
        id = <point_id>
        texture = myf_dot
        pos = <pos>
        z_priority = 800
        just = [ center center ]
        rgba = <highlight_rgba>
        scale = 2
    }
    index = (<index> + 1)
    repeat 3
endscript

cas_head_index = 10

script get_default_face_texture_name 
    GetCurrentSkaterProfileIndex
    GetSkaterSex player = <currentSkaterProfileIndex>
    if (<is_male>)
        <head_part> = skater_m_head
        <texturePath> = 'faces\CS_NSN_facemap_male_light'
        <overlayPath> = 'faces\CS_NSN_Head_gry_alpha'
        <overlayName> = CS_NSN_Head_gry_alpha
    else
        <head_part> = skater_f_head
        <texturePath> = 'faces\CS_NSN_facemap_female_light'
        <overlayPath> = 'faces\CS_NSN_Head_f_gry_alpha'
        <overlayName> = CS_NSN_Head_f_gry_alpha
    endif
    <hue> = 2.460
    <sat> = 0.9000
    <val> = 0.8700
    return texturePath = <texturePath> overlayPath = <overlayPath> overlayName = <overlayName> hue = <hue> sat = <sat> val = <val>
endscript


script maybe_load_default_face 
    GetCurrentSkaterProfileIndex
    if NOT PlayerFaceIsValid player = <currentSkaterProfileIndex>
        get_default_face_texture_name
        if NOT GotParam texturePath
            script_assert 'no texture path?'
        endif
        SetPlayerFaceTexture {
            player = <currentSkaterProfileIndex>
            texture = <texturePath>
        }
        SetPlayerFacePoints {
            player = <currentSkaterProfileIndex>
            left_eye = [ 44 , 40 ]
            right_eye = [ 87 , 42 ]
            nose = [ 65 , 70 ]
            lips = [ 66 , 88 ]
            width = 128
            height = 128
        }
        SetPlayerFaceOverlayTexture {
            player = <currentSkaterProfileIndex>
            texture = <overlayPath>
        }
        refresh_skater_model
    else
        refresh_skater_model
    endif
endscript

