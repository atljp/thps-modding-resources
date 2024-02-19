select_shift = 0
memcard_screenshots = 0
skater_cam_0_mode = 2
skater_cam_1_mode = 2
arl_text = 'Poka¿ Pak\b6'
arr_text = '\b5'
aru_text = 'W³¹cz widok 2D'
ard_text = 'Profiler'
all_text = '\b6'
alr_text = '\b5Narzêdzie wiate³'
alu_text = 'Plamy krwi'
ald_text = 'Przegl¹d modeli'
root_text = {
    arl_text = 'Poka¿ Pak\b6'
    arr_text = '\b5'
    aru_text = 'W³¹cz widok 2D'
    ard_text = 'Profiler'
    all_text = '\b6'
    alr_text = '\b5Narzêdzie wiate³'
    alu_text = 'Plamy krwi'
    ald_text = 'Przegl¹d modeli'
}
modelviewer_text = {
    arl_text = 'Poka¿ Pak\b6'
    arr_text = '\b5'
    aru_text = 'W³¹cz widok 2D'
    ard_text = 'Profiler'
    all_text = 'Ustaw gracza\b6'
    alr_text = '\b5Centruj kamerê'
    alu_text = 'Plamy krwi'
    ald_text = 'Przegl¹d modeli'
}
select_text = root_text

script set_select_text \{ text = root_text }
    change all_text = (<text>.all_text)
    change alr_text = (<text>.alr_text)
    change alu_text = (<text>.alu_text)
    change ald_text = (<text>.ald_text)
    change arl_text = (<text>.arl_text)
    change arr_text = (<text>.arr_text)
    change aru_text = (<text>.aru_text)
    change ard_text = (<text>.ard_text)
    change select_text = <text>
    refresh_analog_options
endscript

script refresh_analog_options 
    hide_analog_options
    show_analog_options
endscript

script UserSelectSelect 
    if InFrontend
        return 
    endif
    if IsObserving
        return 
    endif
    if IsSurveying
        return 
    endif
    if ScreenElementExists id = current_menu_anchor
        return 
    endif
    if ScreenElementExists id = root_window
        if root_window ::getsingletag menu_state
            if (<menu_state> = on)
                return 
            endif
        endif
    endif
    if NOT IsNGC
        if ObjectExists id = skatercam0
            switch skater_cam_0_mode
                case 1
                change skater_cam_0_mode = 2
                case 2
                change skater_cam_0_mode = 3
                case 3
                change skater_cam_0_mode = 4
                case 4
                change skater_cam_0_mode = 1
            endswitch
            skatercam0 ::sc_setmode mode = skater_cam_0_mode
        endif
    endif
endscript

script UserSelectSelect2 
    if InFrontend
        return 
    endif
    if IsObserving
        return 
    endif
    if IsSurveying
        return 
    endif
    if ScreenElementExists id = current_menu_anchor
        return 
    endif
    if ScreenElementExists id = root_window
        if root_window ::getsingletag menu_state
            if (<menu_state> = on)
                return 
            endif
        endif
    endif
    if NOT IsNGC
        if ObjectExists id = skatercam1
            switch skater_cam_1_mode
                case 1
                change skater_cam_1_mode = 2
                case 2
                change skater_cam_1_mode = 3
                case 3
                change skater_cam_1_mode = 4
                case 4
                change skater_cam_1_mode = 1
            endswitch
            skatercam1 ::sc_setmode mode = skater_cam_1_mode
        endif
    endif
endscript
view_mode = 0
render_mode = 0
wireframe_mode = 0
drop_in_car = 0
drop_in_car_setup = MiniBajaCarSetup

script userselecttriangle 
    if notcd
        switch render_mode
            case 0
            change render_mode = 1
            show_wireframe_mode
            case 1
            change render_mode = 2
            show_wireframe_mode
            case 2
            change render_mode = 3
            toggle_wireframe_skins
            case 3
            change render_mode = 4
            toggle_wireframe_skins
            case 4
            change render_mode = 0
            toggle_wireframe_skins
        endswitch
        if ((render_mode = 3)|| (render_mode = 4))
            setRenderMode mode = 0
        else
            setRenderMode mode = render_mode
        endif
    endif
endscript

script do_screenshot 
    hide_analog_options
    global_light_fx_menu_hide_anchor
    if toggle2d \{ Off }
        wait \{ 1 gameframe }
        ScreenShot
        toggle2d \{ on }
    else
        wait \{ 1 gameframe }
        ScreenShot
    endif
    global_light_fx_menu_show_anchor
endscript

script userselectsquare 
    if notcd
        SpawnScriptLater \{ do_screenshot }
    endif
endscript

script userselectcircle 
    if (render_mode)
        if notcd
            switch wireframe_mode
                case 0
                change wireframe_mode = 1
                case 1
                change wireframe_mode = 2
                case 2
                change wireframe_mode = 3
                case 3
                change wireframe_mode = 4
                case 4
                change wireframe_mode = 5
                case 5
                change wireframe_mode = 6
                case 6
                change wireframe_mode = 0
            endswitch
            setwireframemode mode = wireframe_mode
            show_wireframe_mode
        endif
    else
        if skater ::driving
            ToggleUserControlledVehicleMode
        endif
        UnpauseSkaters 0
        if (drop_in_car = 0)
            skater ::PlaceBeforeCamera
            restore_skater_camera
            if (view_mode)
                change view_mode = 0
                ToggleViewMode no_reload
                ToggleViewMode no_reload
                ToggleViewMode no_reload
            endif
        else
            MakeSkaterGoto Switch_OnGroundAI params = {NewScript = TransAm VehicleSetup = drop_in_car_setup edited_goal}
            SetActiveCamera id = viewer_cam
            PlayerVehicle ::Vehicle_PlaceBeforeCamera
            change view_mode = 0
            ToggleViewMode
            ToggleViewMode
            ToggleViewMode
            SetActiveCamera id = PlayerVehicleCamera
            skater ::PausePhysics
        endif
    endif
endscript

script userselectstart 
    if notcd
        change \{ render_mode = 0 }
        setRenderMode \{ mode = render_mode }
        TogglePass \{ pass = 0 }
    endif
endscript

script show_analog_options 
    if NOT ScreenElementExists id = viewer_options_anchor
        SetScreenElementLock id = root_window Off
        CreateScreenElement {
            id = viewer_options_anchor
            type = ContainerElement
            parent = root_window
            Pos = (0.0, 350.0)
            z_priority = 6000
        }
        CreateScreenElement {
            id = viewer_options_bg
            type = SpriteElement
            parent = viewer_options_anchor
            dims = (640.0, 80.0)
            Pos = (0.0, 10.0)
            just = [ left top ]
            rgba = [ 0 0 0 128 ]
            alpha = 0.3000
        }
        CreateScreenElement {
            id = left_anchor
            type = ContainerElement
            parent = viewer_options_anchor
            Scale = 1.0
            Pos = (128.0, 48.0)
            just = [ left top ]
        }
        CreateScreenElement {
            id = analog_l_l
            type = TextElement
            parent = left_anchor
            font = small
            text = all_text
            Scale = 0.8000
            Pos = (0.0, 0.0)
            just = [ RIGHT center ]
            rgba = [ 128 128 128 128 ]
        }
        CreateScreenElement {
            id = analog_l_r
            type = TextElement
            parent = left_anchor
            font = small
            text = alr_text
            Scale = 0.8000
            Pos = (0.0, 0.0)
            just = [ left center ]
            rgba = [ 128 128 128 128 ]
        }
        CreateScreenElement {
            id = analog_l_t_button
            type = TextElement
            parent = left_anchor
            font = small
            text = '\b7'
            Scale = 0.8000
            Pos = (0.0, 0.0)
            just = [ center bottom ]
            rgba = [ 128 128 128 128 ]
        }
        CreateScreenElement {
            id = analog_l_t
            type = TextElement
            parent = left_anchor
            font = small
            text = alu_text
            Scale = 0.8000
            Pos = (0.0, -14.0)
            just = [ center bottom ]
            rgba = [ 128 128 128 128 ]
        }
        CreateScreenElement {
            id = analog_l_b_button
            type = TextElement
            parent = left_anchor
            font = small
            text = '\b4'
            Scale = 0.8000
            Pos = (0.0, 0.0)
            just = [ center top ]
            rgba = [ 128 128 128 128 ]
        }
        CreateScreenElement {
            id = analog_l_b
            type = TextElement
            parent = left_anchor
            font = small
            text = ald_text
            Scale = 0.8000
            Pos = (0.0, 16.0)
            just = [ center top ]
            rgba = [ 128 128 128 128 ]
        }
        CreateScreenElement {
            id = right_anchor
            type = ContainerElement
            parent = viewer_options_anchor
            Scale = 1.0
            Pos = (512.0, 48.0)
            just = [ left top ]
        }
        CreateScreenElement {
            id = analog_r_l
            type = TextElement
            parent = right_anchor
            font = small
            text = arl_text
            Scale = 0.8000
            Pos = (0.0, 0.0)
            just = [ RIGHT center ]
            rgba = [ 128 128 128 128 ]
        }
        CreateScreenElement {
            id = analog_r_r
            type = TextElement
            parent = right_anchor
            font = small
            text = arr_text
            Scale = 0.8000
            Pos = (0.0, 0.0)
            just = [ left center ]
            rgba = [ 128 128 128 128 ]
        }
        CreateScreenElement {
            id = analog_r_t_button
            type = TextElement
            parent = right_anchor
            font = small
            text = '\b7'
            Scale = 0.8000
            Pos = (0.0, 0.0)
            just = [ center bottom ]
            rgba = [ 128 128 128 128 ]
        }
        CreateScreenElement {
            id = analog_r_t
            type = TextElement
            parent = right_anchor
            font = small
            text = aru_text
            Scale = 0.8000
            Pos = (0.0, -14.0)
            just = [ center bottom ]
            rgba = [ 128 128 128 128 ]
        }
        CreateScreenElement {
            id = analog_r_b_button
            type = TextElement
            parent = right_anchor
            font = small
            text = '\b4'
            Scale = 0.8000
            Pos = (0.0, 0.0)
            just = [ center top ]
            rgba = [ 128 128 128 128 ]
        }
        CreateScreenElement {
            id = analog_r_b
            type = TextElement
            parent = right_anchor
            font = small
            text = ard_text
            Scale = 0.8000
            Pos = (0.0, 16.0)
            just = [ center top ]
            rgba = [ 128 128 128 128 ]
        }
        CreateScreenElement {
            id = center_anchor
            type = ContainerElement
            parent = viewer_options_anchor
            Scale = 1.0
            Pos = (320.0, 48.0)
            just = [ left top ]
        }
        CreateScreenElement {
            id = center_square
            type = TextElement
            parent = center_anchor
            font = small
            text = 'Obrazek\b1'
            Scale = 0.8000
            Pos = (-8.0, 0.0)
            just = [ RIGHT center ]
            rgba = [ 128 128 128 128 ]
        }
        CreateScreenElement {
            id = center_circle
            type = TextElement
            parent = center_anchor
            font = small
            text = '\b2Drop'
            Scale = 0.8000
            Pos = (8.0, 0.0)
            just = [ left center ]
            rgba = [ 128 128 128 128 ]
        }
        CreateScreenElement {
            id = center_tri_button
            type = TextElement
            parent = center_anchor
            font = small
            text = '\b0'
            Scale = 0.8000
            Pos = (0.0, 0.0)
            just = [ center bottom ]
            rgba = [ 128 128 128 128 ]
        }
        CreateScreenElement {
            id = center_tri
            type = TextElement
            parent = center_anchor
            font = small
            text = 'Wireframe'
            Scale = 0.8000
            Pos = (0.0, -14.0)
            just = [ center bottom ]
            rgba = [ 128 128 128 128 ]
        }
        CreateScreenElement {
            id = center_x_button
            type = TextElement
            parent = center_anchor
            font = small
            text = '\b3'
            Scale = 0.8000
            Pos = (0.0, 0.0)
            just = [ center top ]
            rgba = [ 128 128 128 128 ]
        }
        CreateScreenElement {
            id = center_x
            type = TextElement
            parent = center_anchor
            font = small
            text = 'Przegl¹darka'
            Scale = 0.8000
            Pos = (0.0, 16.0)
            just = [ center top ]
            rgba = [ 128 128 128 128 ]
        }
        SetScreenElementLock id = root_window on
    endif
endscript

script hide_analog_options 
    if ScreenElementExists \{ id = viewer_options_anchor }
        DestroyScreenElement \{ id = viewer_options_anchor }
    endif
endscript

script ToggleViewMode 
    switch view_mode
        case 0
        SetAnalogStickActiveForMenus 0
        change view_mode = 1
        SetAllowMoviePause 0
        SetEnableMovies 0
        case 1
        change view_mode = 2
        case 2
        if NOT GotParam no_reload
            GetSaveZoneName
            FinishPendingZoneLoads
            BeginUnloadUnlinkedZones zone = <save_zone>
            wait 2 gameframe
            EndUnloadUnlinkedZones zone = <save_zone>
            StartPakLoad zone = <save_zone>
            FinishPendingZoneLoads
        endif
        change view_mode = 0
        SetAnalogStickActiveForMenus 1
        viewer_cam ::sethfov hfov = (camera_fov)
        SetAllowMoviePause 1
        SetEnableMovies 1
    endswitch
    SetViewMode view_mode
endscript

script userselectx 
    if IsTrue \{ soft_assert_active }
        return 
    endif
    change \{ viewer_rotation_angle = 0 }
    ToggleViewMode
    switch_to_env_speed
    if (view_mode = 1)
        set_viewer_speed
    endif
endscript

script userselectrightanalogup 
    toggle2d
endscript

script userselectrightanalogdown 
    ToggleMetrics
endscript

script userselectrightanalogleft 
    if IsTrue \{ showpakmap }
        change \{ showpakmap = 0 }
    else
        change \{ showpakmap = 1 }
    endif
endscript

script userselectrightanalogright 
endscript

script userselectleftanalogup 
    KillTextureSplats \{ all }
    PreAllocSplats
endscript

script userselectleftanalogdown 
    if NOT ScreenElementExists \{ id = view_models_menu }
        set_select_text \{ text = modelviewer_text }
    else
        set_select_text \{ text = root_text }
    endif
    switch_to_obj_speed
    toggle_model_viewer
    if ScreenElementExists \{ id = view_models_menu }
        set_viewer_speed
    endif
endscript

script userselectleftanalogleft 
    if ScreenElementExists \{ id = view_models_menu }
        set_player_to_model
    endif
endscript

script userselectleftanalogright 
    if ScreenElementExists \{ id = view_models_menu }
        ResetModelViewerCamera
    else
        viewer_toggle_global_light_fx_menu
    endif
endscript
viewer_rotation_angle = 0

script UserViewerX 
    if ScreenElementExists id = light_tool_vmenu
        return 
    endif
    if (viewer_rotation_angle = 0)
        change viewer_rotation_angle = 1
        CenterCamera Scale = 0.5000 y = -45
    else
        if (viewer_rotation_angle = 1)
            CenterCamera Scale = 0.5000 y = -135
            change viewer_rotation_angle = 2
        else
            if (viewer_rotation_angle = 2)
                change viewer_rotation_angle = 3
                CenterCamera Scale = 0.5000 y = -225
            else
                if (viewer_rotation_angle = 3)
                    change viewer_rotation_angle = 0
                    CenterCamera Scale = 0.5000 y = -315
                endif
            endif
        endif
    endif
endscript

script UserViewerSquare 
    if (viewer_rotation_angle = 0)
        change viewer_rotation_angle = 1
        CenterCamera x = -10 y = -90 Scale = 0.7000
    else
        if (viewer_rotation_angle = 1)
            CenterCamera x = -10 y = -180 Scale = 0.7000
            change viewer_rotation_angle = 2
        else
            if (viewer_rotation_angle = 2)
                change viewer_rotation_angle = 3
                CenterCamera x = -10 y = -270 Scale = 0.7000
            else
                if (viewer_rotation_angle = 3)
                    change viewer_rotation_angle = 0
                    CenterCamera x = -10 y = 0 Scale = 0.7000
                endif
            endif
        endif
    endif
endscript
Viewer_move_mode = 1
Obj_Viewer_move_mode = 0
Env_Viewer_move_mode = 2
viewer_speed = env
USER_VIEWER_TRIANGLE_TOD = 1

script UserViewerTriangle 
    if (USER_VIEWER_TRIANGLE_TOD)
        if (view_mode = 1)
            if NOT ScreenElementExists \{ id = light_tool_vmenu }
                TODManager_AdvanceTODState
            endif
        endif
    endif
endscript

script switch_to_env_speed 
    change Viewer_move_mode = (Env_Viewer_move_mode)
    change \{ viewer_speed = env }
endscript

script switch_to_obj_speed 
    change Viewer_move_mode = (Obj_Viewer_move_mode)
    change \{ viewer_speed = obj }
endscript

script set_viewer_speed 
    switch Viewer_move_mode
        case 0
        SetMovementVelocity 100
        SetRotateVelocity 50
        create_panel_message id = viewermovemode text = '1 Bardzo wolna kamera' Pos = (320.0, 84.0) rgba = [ 64 0 0 128 ]
        case 1
        SetMovementVelocity 250
        SetRotateVelocity 80
        create_panel_message id = viewermovemode text = '2 Wolna kamera' Pos = (320.0, 84.0) rgba = [ 128 64 0 128 ]
        case 2
        SetMovementVelocity 700
        SetRotateVelocity 120
        create_panel_message id = viewermovemode text = '3 rednia kamera' Pos = (320.0, 84.0) rgba = [ 96 96 0 128 ]
        case 3
        SetMovementVelocity 1700
        SetRotateVelocity 160
        create_panel_message id = viewermovemode text = '4 rednio szybka kamera' Pos = (320.0, 84.0) rgba = [ 128 128 0 128 ]
        case 4
        SetMovementVelocity 5000
        SetRotateVelocity 200
        create_panel_message id = viewermovemode text = 'kamera 5 Fast' Pos = (320.0, 84.0) rgba = [ 0 128 0 128 ]
    endswitch
    if (viewer_speed = env)
        change Env_Viewer_move_mode = (Viewer_move_mode)
    else
        change Obj_Viewer_move_mode = (Viewer_move_mode)
    endif
endscript

script UserViewerL1 
    if ScreenElementExists \{ id = light_tool_vmenu }
        return 
    endif
    change \{ viewer_rotation_angle = 0 }
    switch Viewer_move_mode
        case 0
        change \{ Viewer_move_mode = 1 }
        case 1
        change \{ Viewer_move_mode = 2 }
        case 2
        change \{ Viewer_move_mode = 3 }
        case 3
        change \{ Viewer_move_mode = 4 }
        case 4
        change \{ Viewer_move_mode = 0 }
    endswitch
    set_viewer_speed
endscript

script UserViewerL2 
    change \{ viewer_rotation_angle = 0 }
    switch Viewer_move_mode
        case 0
        change \{ Viewer_move_mode = 4 }
        case 1
        change \{ Viewer_move_mode = 0 }
        case 2
        change \{ Viewer_move_mode = 1 }
        case 3
        change \{ Viewer_move_mode = 2 }
        case 4
        change \{ Viewer_move_mode = 3 }
    endswitch
    set_viewer_speed
endscript

script show_wireframe_mode 
    switch wireframe_mode
        case 0
        wireframe_message text = 'Klatki na sekundê : Flagi zwrócone'
        case 1
        wireframe_message text = 'Klatki na sekundê : Gêstoæ polygonów'
        case 2
        wireframe_message text = 'Klatki na sekundê : Niskiej jakoci wiat³o na polygony'
        case 3
        wireframe_message text = 'Klatki na sekundê : Unikalne kolory obiektów'
        case 4
        wireframe_message text = 'Klatki na sekundê : Renderuj unikalne kolory powierzchni'
        case 5
        wireframe_message text = 'Klatki na sekundê : Renderuj gêstoæ wierzcho³ków powierzchni'
        case 6
        wireframe_message text = 'Klatki na sekundê : Flagi zwrócone'
    endswitch
endscript

script wireframe_message \{ text = 'wireframe' }
    create_panel_message text = <text> id = wireframe_mess rgba = [ 200 128 128 128 ] Pos = (20.0, 340.0) just = [ left center ] Scale = 5 style = wireframe_style
endscript

script wireframe_style 
    DoMorph \{ time = 0 Scale = (1.0, 1.0) }
    DoMorph \{ time = 3 Scale = (1.0, 1.0) }
    DoMorph \{ time = 1 alpha = 0 }
    Die
endscript

script viewerleft 
    if ScreenElementExists \{ id = light_tool_vmenu }
        return 
    endif
    viewer_cam ::gethfov
    hfov = (<hfov> + 1)
    if (<hfov> > 150)
        hfov = 150
    endif
    viewer_cam ::sethfov hfov = <hfov>
    viewer_print_debug_info
endscript

script viewerright 
    if ScreenElementExists \{ id = light_tool_vmenu }
        return 
    endif
    viewer_cam ::gethfov
    hfov = (<hfov> -1)
    if (<hfov> < 5)
        hfov = 5
    endif
    viewer_cam ::sethfov hfov = <hfov>
    viewer_print_debug_info
endscript

script viewerup 
    if ScreenElementExists \{ id = light_tool_vmenu }
        return 
    endif
    if NOT SkaterCamAnimFinished
        return 
    endif
    fake_letterboxing
endscript

script viewerdown 
    if ScreenElementExists \{ id = light_tool_vmenu }
        return 
    endif
    if NOT SkaterCamAnimFinished
        return 
    endif
    fake_letterboxing \{ remove }
endscript

script viewer_print_debug_info 
endscript
