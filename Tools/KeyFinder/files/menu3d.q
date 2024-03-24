
menu3d_disabled = 0
menu3d_current_level_structure_name = None
menu3d_subicon = spaceport

script menu3d_load_assets 
    if (menu3d_disabled = 1)
        return 
    endif
    if NOT GotParam structure_name
        script_assert 'no level structure_name specified'
        return 
    endif
    change menu3d_current_level_structure_name = <structure_name>
    PushMemProfile 'Menu 3D'
    if StructureContains structure = (menu3d_current_level_structure_name)menu3d_sprites
        load_array_of_textures textures = ((menu3d_current_level_structure_name).menu3d_sprites)no_pre_file
    endif
    if StructureContains structure = (menu3d_current_level_structure_name)menu3d_name
        PreloadModel name = ((menu3d_current_level_structure_name).menu3d_name)
    endif
    PopMemProfile
endscript


script menu3d_unload_assets 
    GetLevelStructureName
    if StructureContains structure = (<level_structure_name>)menu3d_sprites
        load_array_of_textures textures = (<level_structure_name>.menu3d_sprites)unload dont_assert
    endif
endscript


script menu3d_show parent = root_window
    KillSpawnedScript name = menu3d_animate_out
    menu3d_hide
    SetScreenElementLock id = <parent> Off
    CreateScreenElement {
        type = ContainerElement
        parent = <parent>
        id = menu3d_anchor
    }
    GoalManager_GetLevelPrefix
    FormatText checksumname = sign_element_script '%l_2d_sign_element_create' l = <level_prefix>
    if ScriptExists <sign_element_script>
        <sign_element_script> parent = menu3d_anchor
    endif
    menu3d_show_sign parent = menu3d_anchor
endscript


script menu3d_animate_in 
    if NOT ScreenElementExists id = menu3d_anchor
        return 
    endif
    GetScreenElementPosition id = menu3d_anchor
    DoScreenElementMorph id = menu3d_anchor Pos = (<screenelementpos> + (-640.0, 0.0))time = 0
    DoScreenElementMorph id = menu3d_anchor Pos = <screenelementpos> time = 0.1500
endscript


script menu3d_animate_out 
    if NOT ScreenElementExists id = menu3d_anchor
        return 
    endif
    GetScreenElementPosition id = menu3d_anchor
    DoScreenElementMorph id = menu3d_anchor Pos = (<screenelementpos> + (-640.0, 0.0))time = 0.1500
    if GotParam Die
        wait 0.2000 seconds
        menu3d_hide
    endif
endscript


script menu3d_hide 
    if ScreenElementExists id = menu3d_anchor
        DestroyScreenElement id = menu3d_anchor
    endif
endscript


script menu3d_zoom_options 
endscript


script menu3d_morph 
    gettags
    if ObjectExists id = <id>
        if GotParam Pos
            if GotParam pos_time
                <time> = <pos_time>
            else
                <time> = 0
            endif
            DoScreenElementMorph id = <id> time = <time> Pos = <Pos>
        endif
        if GotParam Scale
            if GotParam scale_time
                <time> = <scale_time>
            else
                <time> = 0
            endif
            DoScreenElementMorph id = <id> time = <time> Scale = <Scale>
        endif
        GetScreenElementProps id = <id>
        if GotParam rot_x
            <rot_x> = ((<rot_x> * 3.140)/ 180.0)
            if GotParam rot_x_time
                <rel_rot_x> = (<rot_x> - (<anglex> + 1.570))
                <rot_x_frames> = (<rot_x_time> * 60)
                <rot_x_diff> = (<rel_rot_x> / <rot_x_frames>)
            else
                <rot_x_frames> = 1
                <rot_x_diff> = <rot_x>
            endif
            <cur_x_frame> = 0
            <next_rot_x> = (<anglex> + <rot_x_diff>)
            <should_rot_x> = 1
        else
            <should_rot_x> = 0
        endif
        if GotParam rot_y
            <rot_y> = ((<rot_y> * 3.140)/ 180.0)
            if GotParam rot_y_time
                <rel_rot_y> = (<rot_y> - <angley>)
                <rot_y_frames> = (<rot_y_time> * 60)
                <rot_y_diff> = (<rel_rot_y> / <rot_y_frames>)
            else
                <rot_y_frames> = 1
                <rot_y_diff> = <rot_y>
            endif
            <cur_y_frame> = 0
            <next_rot_y> = (<angley> + <rot_y_diff>)
            <should_rot_y> = 1
        else
            <should_rot_y> = 0
        endif
        if GotParam rot_z
            <rot_z> = ((<rot_z> * -3.140)/ 180.0)
            if GotParam rot_z_time
                <rel_rot_z> = (<rot_z> - <anglez>)
                <rot_z_frames> = (<rot_z_time> * 60)
                <rot_z_diff> = (<rel_rot_z> / <rot_z_frames>)
            else
                <rot_z_frames> = 1
                <rot_z_diff> = <rot_z>
            endif
            <cur_z_frame> = 0
            <next_rot_z> = (<anglez> + <rot_z_diff>)
            <should_rot_z> = 1
        else
            <should_rot_z> = 0
        endif
        begin 
        if NOT ObjectExists id = <id>
            return 
        endif
        if (<should_rot_x> || <should_rot_y> || <should_rot_z>)
            if (<should_rot_x>)
                if ((<cur_x_frame> < <rot_x_frames>)|| (GotParam rot_x_loop))
                    SetScreenElementProps id = <id> anglex = <next_rot_x>
                    <next_rot_x> = (<next_rot_x> + <rot_x_diff>)
                    <cur_x_frame> = (<cur_x_frame> + 1)
                else
                    <should_rot_x> = 0
                endif
            endif
            if (<should_rot_y>)
                if ((<cur_y_frame> < <rot_y_frames>)|| (GotParam rot_y_loop))
                    SetScreenElementProps id = <id> angley = <next_rot_y>
                    <next_rot_y> = (<next_rot_y> + <rot_y_diff>)
                    <cur_y_frame> = (<cur_y_frame> + 1)
                else
                    <should_rot_y> = 0
                endif
            endif
            if (<should_rot_z>)
                if ((<cur_z_frame> < <rot_z_frames>)|| (GotParam rot_z_loop))
                    SetScreenElementProps id = <id> anglez = <next_rot_z>
                    <next_rot_z> = (<next_rot_z> + <rot_z_diff>)
                    <cur_z_frame> = (<cur_z_frame> + 1)
                else
                    <should_rot_z> = 0
                endif
            endif
            wait 1 gameframes
        else
            return 
        endif
        repeat 
    endif
endscript


script menu3d_show_sign active_viewport = 0 parent = root_window
    if NOT ScreenElementExists id = <parent>
        
        return 
    endif
    SetScreenElementLock id = <parent> Off
    if GotParam no_slide
        Pos = (360.0, 220.0)
    else
        Pos = (800.0, 220.0)
    endif
    GetPausePosByResolution
    if StructureContains structure = (menu3d_current_level_structure_name)menu3d_name
        <menu3d_name> = ((menu3d_current_level_structure_name).menu3d_name)
    else
        <menu3d_name> = 'menu3d\menu3d.mdl'
    endif
    CreateScreenElement {
        parent = <parent>
        type = element3d
        id = menu3d_sign
        Model = <menu3d_name>
        Pos = <Pos>
        cameraz = -6
        Scale = 0.08000
        tilt = 0
        pivotpoint = (0.0, 0.0, 0.0)
        active_viewport = <active_viewport>
        angleorderxyz
        anglex = -1.570
        angley = 0
        anglez = 0
    }
endscript


script element3d_add_components 
    if GotParam AnimName
        if NOT GotParam animEventTableName
            GetAnimEventTableName animType = <type>
        endif
        if ChecksumEquals a = <AnimName> b = default
            if ChecksumEquals a = <SkeletonName> b = THPS6_human
                <defaultanimname> = Ped_M_Idle1
            endif
        else
            defaultanimname = <AnimName>
        endif
        createcomponentfromstructure Component = Suspend
        createcomponentfromstructure Component = AnimBlender animEventTableName = <animEventTableName> <...> 
    endif
    if GotParam SkeletonName
        PushMemProfile 'Element3d Skeletons'
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
            obj_setlightambientcolor r = 0 g = 0 b = 0
            obj_setlightdiffusecolor index = 0 r = 0 g = 0 b = 0
            obj_setlightdiffusecolor index = 1 r = 0 g = 0 b = 0
            obj_setlightambientcolor r = 0 g = 0 b = 0
            obj_setlightdiffusecolor index = 0 r = 0 g = 0 b = 0
            obj_setlightdiffusecolor index = 1 r = 0 g = 0 b = 0
        else
            obj_setlightambientcolor r = 128 g = 128 b = 128
            obj_setlightdiffusecolor index = 0 r = 110 g = 125 b = 155
            obj_setlightdiffusecolor index = 1 r = 10 g = 3 b = 5
        endif
        Obj_ForceUpdate
    endif
endscript

