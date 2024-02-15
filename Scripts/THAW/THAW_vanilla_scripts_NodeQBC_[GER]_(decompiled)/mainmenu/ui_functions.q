
script spin_menu_skater_script 
    load_pro_skater_set_custom
    UnpauseSkaters
    skater ::obj_getid
    MakeSkaterGoto SpinMenuSkaterIdle params = <...> 
    skater ::hide
endscript

script spin_menu_camera_init \{ LockTo = world Pos = (42.599998474121094, 12.100000381469727, -983.7999877929688) Quat = (0.00013800000306218863, 0.999862015247345, 0.011831999756395817) FOV = 72.0 }
    skater ::obj_getid
    SetActiveCamera \{ id = skatercam0 }
    skater ::unhide
    KillSkaterCamAnim \{ all }
    PlayIGCCam {
        skater = 0
        LockTo = world
        Pos = <Pos>
        Quat = <Quat>
        FOV = <FOV>
        Play_hold
        frames = 1
    }
endscript
spin_menu_skater_idling = 0
spin_menu_skater_transitioning = 0

script SpinMenuGetSkaterAnim 
    if (spin_menu_skater_transitioning)
        change \{ spin_menu_skater_transitioning = 0 }
        return \{ anim = FrontEnd_Spin2Wheel }
    endif
    if (spin_menu_skater_idling)
        return anim = Random (@ FrontEnd_Wheel_Idle_1 @ FrontEnd_Wheel_Idle_2 @ FrontEnd_Wheel_Idle_3)
    else
        return anim = Random (@*3 FrontEnd_Wheel_Spin_Idle @ FrontEnd_Wheel_Spin_Idle2)
    endif
endscript

script SpinMenuSkaterIdle 
    if GotParam reset
        SkaterInit NoEndRun ReturnControl NoAnims
        TurnOffSpecialItem
        SwitchOnBoard
        ClearExceptions
        obj_movetonode name = Z_mainmenu_TRG_Playerrestart orient NoReset
        if NOT obj_hasmodellights
            script_assert 'Kein Skater-Lighting!'
        endif
        SetLightAmbientColor {
            r = (skater_ambient_color [ 0 ])
            g = (skater_ambient_color [ 1 ])
            b = (skater_ambient_color [ 2 ])
        }
        SetLightDiffuseColor {
            index = 0
            r = (skater_diffuse_color1 [ 0 ])
            g = (skater_diffuse_color1 [ 1 ])
            b = (skater_diffuse_color1 [ 2 ])
        }
        SetLightDiffuseColor {
            index = 1
            r = (skater_diffuse_color2 [ 0 ])
            g = (skater_diffuse_color2 [ 1 ])
            b = (skater_diffuse_color2 [ 2 ])
        }
        cancelrotatedisplay
        disableplayerinput
        setrollingfriction 10000
        setspeed 0
        if Flipped
            flip
        endif
        PausePhysics
    endif
    begin 
    SpinMenuGetSkaterAnim
    Skater_Playanim anim = <anim> BlendPeriod = 0.2000
    Skater_WaitAnimFinished
    if (0 = 1)
        break 
    endif
    repeat 
endscript

script SpinMenuSkaterAction 
    change \{ spin_menu_skater_transitioning = 0 }
    if (spin_menu_skater_idling)
        change \{ spin_menu_skater_idling = 0 }
    endif
    if GotParam \{ up }
        <anim> = FrontEnd_Wheel_Spin_Dwn
    else
        if GotParam \{ down }
            <anim> = FrontEnd_Wheel_Spin_Up
        else
            if GotParam \{ spin }
                <anim> = FrontEnd_Wheel_Spin_Hard
            endif
        endif
    endif
    if GotParam \{ anim }
        Skater_Playanim anim = <anim> BlendPeriod = 0.2000
        Skater_WaitAnimFinished
    endif
    MakeSkaterGoto \{ SpinMenuSkaterIdle }
endscript

script ShadowSkaterOptionsTricks 
    KillSpawnedScript \{ name = skaterDoOptionsTricks }
    if (in_options_menu = 1)
        wait \{ 5 gameframes }
        SpawnScriptLater \{ skaterDoOptionsTricks }
    endif
endscript

script skaterDoOptionsTricks 
    skater ::ShadowSkaterOptionsTrickScript
endscript

script ShadowSkaterOptionsTrickScript 
    setspeed 0
    setrollingfriction 999
    setspeed 1
    setrollingfriction 5
    type = (RandomNoRepeat (@ 0 @ 1))
    if (<type> = 0)
        Skater_Playanim {anim = CrouchIdle Speed = 1.0 BlendPeriod = 0.2000 Cycle}
        wait 1.300 seconds
        Skater_Playanim {anim = ollie Speed = 1.0 BlendPeriod = 0}
        jump no_sound
        Skater_WaitAnim percent = 20
        anim = (RandomNoRepeat (@ _360Flip @ KickFlip @ HeelFlip @ Impossible @ HardFlip @ VarialKickFlip @ VarialHeelFlip @ PopShoveitBS @ NollieKickflip @ PopShoveIt))
        Skater_Playanim {anim = <anim> Speed = 1.0 BlendPeriod = 0.2000}
        Skater_WaitAnimFinished
        Skater_Playanim {anim = CrouchIdle Speed = 1.0 BlendPeriod = 0.2000 Cycle}
    else
        anim = (RandomNoRepeat (@ NoseManual_range @ Manual_Range))
        Skater_Playanim {anim = CrouchIdle Speed = 1.0 BlendPeriod = 0.2000 Cycle}
        wait 0.6000 seconds
        Skater_Playanim {anim = <anim> Speed = 1.0 from = 20 to = 60 BlendPeriod = 0.5000}
        Skater_WaitAnimFinished
        Skater_Playanim {anim = <anim> Speed = 1.0 backwards from = 20 to = 60 BlendPeriod = 0.2000}
        Skater_WaitAnimFinished
        Skater_Playanim {anim = CrouchIdle Speed = 1.0 BlendPeriod = 0.2000 Cycle}
    endif
endscript

script build_roundbar 
    Theme_GetPauseBarColor return_value = bar_color
    <Pos> = (<Pos> + (60.0, -3.0))
    CreateScreenElement {
        type = ContainerElement
        parent = current_menu_anchor
        id = roundbar_bar
        Pos = <Pos>
        just = [ left center ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = roundbar_bar
        id = roundbar_left
        Pos = (0.0, 0.0)
        just = [ left top ]
        Scale = 1
        texture = roundbar_tip_left
        z_priority = 2
        rgba = <bar_color>
    }
    CreateScreenElement {
        type = SpriteElement
        parent = roundbar_bar
        id = roundbar_middle
        Pos = (32.0, 0.0)
        just = [ left top ]
        Scale = (1.0, 1.0)
        texture = roundbar_middle
        z_priority = 2
        rgba = <bar_color>
    }
    CreateScreenElement {
        type = SpriteElement
        parent = roundbar_bar
        id = roundbar_right
        Pos = (64.0, 0.0)
        just = [ left top ]
        Scale = 1
        texture = roundbar_tip_right
        z_priority = 2
        rgba = <bar_color>
    }
    CreateScreenElement {
        type = SpriteElement
        parent = roundbar_bar
        id = roundbar_accent
        texture = roundbar_highlight
        Pos = (32.0, 15.0)
        rgba = <bar_color>
        just = [ center center ]
        Scale = (2.75, 1.0)
        z_priority = 3
        alpha = 0
    }
    CreateScreenElement {
        type = TextElement
        parent = roundbar_bar
        id = roundbar_text
        Pos = (20.0, 0.0)
        just = [ left top ]
        text = ''
        font = small
        Scale = (1.5, 1.5)
        z_priority = 4
        rgba = [ 123 4 93 128 ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = roundbar_bar
        id = roundbar_icon
        Pos = (0.0, 0.0)
        texture = white2
        Scale = 0.6000
        rgba = [128 , 128 , 128 , 0]
        just = [ left top ]
        z_priority = 4
    }
endscript

script spin_menu_item_focus 
    gettags
    if GotParam attract_timer
        reset_attract_mode_timer
    endif
    if GotParam blank
        spin_menu__reset_input_timer
        wait 1 gameframe
        if (spin_menu_dir > 0)
            if (spin_menu_cycle = 1)
                FireEvent type = pad_up target = current_menu
            else
                FireEvent type = pad_down target = current_menu
            endif
        else
            if (spin_menu_dir < 0)
                if (spin_menu_cycle = 1)
                    FireEvent type = pad_down target = current_menu
                else
                    FireEvent type = pad_up target = current_menu
                endif
            endif
        endif
    else
        if (<active> = 0)
            spin_menu__reset_input_timer
            wait 1 gameframe
            if (spin_menu_dir > 0)
                current_menu ::gettags
                if ((spin_menu_cycle = 0)& (<tag_selected_index> = 0))
                    FireEvent type = pad_down target = current_menu
                else
                    FireEvent type = pad_up target = current_menu
                endif
            else
                FireEvent type = pad_down target = current_menu
            endif
        else
            if NOT (spin_menu_dir = 0)
                Menu_SFX_Wheel_Click_Short
            endif
            do_roundbar_highlight <...> 
        endif
    endif
endscript

script do_roundbar_highlight 
    DoScreenElementMorph id = {<id> child = 0}alpha = 0 time = spin_menu_spin_time
    if ScreenElementExists id = {<id> child = 1}
        DoScreenElementMorph id = {<id> child = 1}alpha = 0 time = spin_menu_spin_time
    endif
    SetScreenElementProps {
        id = roundbar_text
        text = <highlight_text>
    }
    GetScreenElementDims id = roundbar_text
    <bar_mid_width> = (<width> + 26)
    <bar_mid_width_scale> = (((1.0, 0.0) * (<bar_mid_width> / 32.0))+ (0.0, 1.0))
    <bar_right_pos> = ((1.0, 0.0) * (<bar_mid_width> + 20))
    DoScreenElementMorph id = roundbar_middle Scale = <bar_mid_width_scale> time = 0
    SetScreenElementProps {
        id = roundbar_right
        Pos = <bar_right_pos>
    }
    <icon_pos> = (((1.0, 0.0) * (<width> + 26))+ ((0.0, 1.0) * 3))
    SetScreenElementProps {
        id = roundbar_icon
        texture = <icon>
        Pos = <icon_pos>
    }
    KillSpawnedScript name = do_roundbar_highlight_accent
    RunScriptOnScreenElement id = roundbar_accent do_roundbar_highlight_accent params = {RIGHT = (<bar_mid_width> + 20)}
endscript

script do_roundbar_highlight_accent 
    gettags
    SetScreenElementProps {
        id = <id>
        Pos = (32.0, 15.0)
        z_priority = 5
    }
    DoScreenElementMorph id = <id> Scale = (2.75, 1.0) time = 0
    DoScreenElementMorph id = <id> alpha = 1 time = 0
    <Pos> = (((1.0, 0.0) * <RIGHT>)+ ((0.0, 1.0) * 15))
    DoScreenElementMorph id = <id> Pos = <Pos> time = 0.3000
    DoScreenElementMorph id = <id> alpha = 0.2000 time = 0.3000
    wait 0.3000 seconds
    <width> = (<RIGHT> - 32)
    <center> = ((<width> / 2)+ 32)
    <Pos> = (((1.0, 0.0) * <center>)+ ((0.0, 1.0) * 15))
    SetScreenElementProps {
        id = <id>
        Pos = <Pos>
        z_priority = 3
    }
    <scale_width> = (<width> / 14.0)
    <Scale> = (((1.0, 0.0) * <scale_width>)+ ((0.0, 1.0) * 1.250))
    DoScreenElementMorph id = <id> Scale = <Scale> time = 0
    begin 
    DoScreenElementMorph id = <id> alpha = 1 time = 0.3000
    wait 0.3000 seconds
    DoScreenElementMorph id = <id> alpha = 0 time = 0.3000
    wait 0.3000 seconds
    repeat 
endscript

script draw_menu_background 
    CreateScreenElement {
        type = ContainerElement
        parent = current_menu_anchor
        id = arrow_sign_container
        Pos = (0.0, 0.0)
    }
    if GotParam story_mode
        <bg_text> = new_bg_1
        <bg_angle> = 128
        <bg_flip> = flip_v
        <bg_scale> = 1.500
        <bg_pos> = (-40.0, 120.0)
        <bg_rgba> = [ 73 22 107 70 ]
        <arrow_text> = new_graf_arrow
        <arrow_angle> = 0
        <arrow_flip> = flip_v
        <arrow_scale> = 0.8500
        <arrow_pos> = (340.0, 250.0)
        <arrow_rgba> = [ 128 128 128 35 ]
        <arrow_z> = -2
        <drip_text> = Random (@ new_drip_2 @ new_drip_4)
        <drip_angle> = 0
        <drip_flip> = no
        <drip_scale> = (0.800000011920929, 1.5)
        <drip_pos> = (455.0, 60.0)
        <drip_rgba> = [ 5 121 9 128 ]
        <drip_z> = 100
        if GotParam difficulty
            <drip_pos> = (587.0, 73.0)
        endif
        <spray_text> = new_icon_5
        <spray_angle> = 0
        <spray_flip> = no
        <spray_scale> = 1.400
        <spray_pos> = (150.0, 47.0)
        <spray_rgba> = [ 128 128 128 80 ]
        <spray_z> = -4
        <sign_pos> = (700.0, 50.0)
        if GotParam story_wdt
            <the_logo> = wdt_logo_big
        else
            <the_logo> = wdt_logo_big_2
        endif
        if ChecksumEquals a = <the_logo> b = wdt_logo_big_2
            <logo_rgba> = [ 0 0 0 128 ]
            <logo_scale> = (2.5, 1.5)
            <logo_pos> = (535.0, 155.0)
            <logo_angle> = -34
        else
            <logo_pos> = (590.0, 160.0)
            <logo_scale> = 0.9000
            <logo_rgba> = [ 128 128 128 128 ]
            <logo_angle> = -20
        endif
        CreateScreenElement {
            type = SpriteElement
            parent = arrow_sign_container
            id = sign
            texture = menu_sign
            Pos = <sign_pos>
            just = [ RIGHT top ]
            rgba = [ 128 128 128 128 ]
            z_priority = -1
            rot_angle = -10
            Scale = 1.700
        }
        CreateScreenElement {
            type = SpriteElement
            parent = arrow_sign_container
            id = wdt_logo
            texture = <the_logo>
            Pos = <logo_pos>
            just = [ RIGHT top ]
            rgba = <logo_rgba>
            z_priority = 0
            Scale = <logo_scale>
            rot_angle = <logo_angle>
        }
    endif
    if GotParam options_mode
        <bg_text> = new_bg_1
        <bg_angle> = 70
        <bg_flip> = flip_v
        <bg_scale> = 1.500
        <bg_pos> = (610.0, 130.0)
        <bg_rgba> = [ 62 105 122 50 ]
        <arrow_text> = new_graf_arrow
        <arrow_angle> = 2
        <arrow_flip> = no
        <arrow_scale> = 0.9000
        <arrow_pos> = (220.0, 18.0)
        <arrow_rgba> = [ 128 128 128 35 ]
        <arrow_z> = -2
        <drip_text> = Random (@ new_drip_2 @ new_drip_4)
        <drip_angle> = 0
        <drip_flip> = no
        <drip_scale> = (2.0, 2.5)
        <drip_pos> = (507.0, 83.0)
        <drip_rgba> = [ 20 70 92 128 ]
        <drip_z> = 1
        <spray_text> = new_icon_1
        <spray_angle> = 0
        <spray_flip> = no
        <spray_scale> = 1.600
        <spray_pos> = (60.0, 80.0)
        <spray_rgba> = [ 128 128 128 50 ]
        <spray_z> = -4
    endif
    if GotParam create_mode
        <bg_text> = new_bg_2
        <bg_angle> = 20
        <bg_flip> = no
        <bg_scale> = (1.2000000476837158, 0.800000011920929)
        <bg_pos> = (450.0, 0.0)
        <bg_rgba> = [ 62 105 122 60 ]
        <arrow_text> = new_graf_arrow
        <arrow_angle> = 179.9
        <arrow_flip> = no
        <arrow_scale> = 1.100
        <arrow_pos> = (550.0, 200.0)
        <arrow_rgba> = [ 128 128 128 25 ]
        <arrow_z> = -2
        <drip_text> = Random (@ new_drip_1 @ new_drip_3)
        <drip_angle> = 60
        <drip_flip> = no
        <drip_scale> = 0.7000
        <drip_pos> = (355.0, 42.0)
        <drip_rgba> = [ 5 121 9 108 ]
        <drip_z> = 1
        <spray_text> = new_icon_4
        <spray_angle> = 0
        <spray_flip> = no
        <spray_scale> = 2.200
        <spray_pos> = (80.0, 100.0)
        <spray_rgba> = [ 128 128 128 40 ]
        <spray_z> = -4
    endif
    <bg_text> = Random (@ new_bg_1 @ new_bg_2)
    <bg_rgba> = Random (@ [ 62 105 122 60 ] @ [ 73 22 107 70 ])
    FormatText checksumname = spray_text_name 'new_icon_%i' i = Random (@ 1 @ 2 @ 3 @ 4 @ 5 @ 6 @ 7 @ 8 @ 9 @ 10)
    <spray_text> = <spray_text_name>
    <circle_rot> = 0
    <circle_pos> = (0.0, 70.0)
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        id = bG
        texture = <bg_text>
        rot_angle = <bg_angle>
        Pos = <bg_pos>
        Scale = <bg_scale>
        <bg_flip>
        z_priority = -4.500
        rgba = <bg_rgba>
    }
    CreateScreenElement {
        type = SpriteElement
        parent = arrow_sign_container
        id = graf_arrow
        texture = <arrow_text>
        rot_angle = <arrow_angle>
        Pos = <arrow_pos>
        Scale = <arrow_scale>
        <arrow_flip>
        z_priority = <arrow_z>
        rgba = <arrow_rgba>
    }
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        id = drip
        texture = <drip_text>
        just = [ center top ]
        rot_angle = <drip_angle>
        Pos = <drip_pos>
        Scale = <drip_scale>
        <drip_flip>
        z_priority = <drip_z>
        rgba = <drip_rgba>
    }
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        id = spray_icon
        texture = <spray_text>
        rot_angle = <spray_angle>
        Pos = <spray_pos>
        Scale = <spray_scale>
        <spray_flip>
        z_priority = <spray_z>
        rgba = <spray_rgba>
    }
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        id = circle_drip_icon
        texture = circle_drip
        rot_angle = <circle_rot>
        Pos = <circle_pos>
        rgba = [ 128 128 128 40 ]
        z_priority = -4
    }
    RunScriptOnScreenElement id = current_menu_anchor icon_drop params = {orig_pos = <spray_pos>
        orig_rot = <spray_angle>
        orig_scale = <spray_scale>
        orig_flip = <spray_flip>
        orig_rgba = <spray_rgba>
        orig_z = <spray_z>
    }
    RunScriptOnScreenElement id = circle_drip_icon circle_rotation params = { orig_pos = <circle_pos> }
    if NOT GotParam create_mode
        if GotParam story_mode
            RunScriptOnScreenElement id = arrow_sign_container slide_in params = { RIGHT orig_pos = (0.0, 0.0) }
            RunScriptOnScreenElement id = drip paint_dripping
            RunScriptOnScreenElement id = wdt_logo do_random_effect params = { orig_rot = <logo_angle> }
        else
            RunScriptOnScreenElement id = arrow_sign_container slide_in params = {some_wait top orig_pos = (0.0, 0.0)}
            RunScriptOnScreenElement id = drip paint_dripping params = { some_wait }
        endif
    else
        RunScriptOnScreenElement id = arrow_sign_container slide_in params = {some_wait RIGHT orig_pos = (0.0, 0.0)}
        RunScriptOnScreenElement id = drip paint_twitch params = { orig_rot = <drip_angle> }
    endif
endscript

script icon_drop orig_pos = (0.0, 0.0)
    begin 
    spray_icon ::DoMorph time = 0 Pos = (<orig_pos> + (0.0, -150.0))
    spray_icon ::DoMorph time = 0.1500 Pos = <orig_pos>
    wait 0.1500 seconds
    begin 
    spray_icon ::DoMorph time = 0.01000 rot_angle = <orig_rot> alpha = 1 Pos = <orig_pos>
    ran_xjump = Random (@ (-3.0, 0.0) @ (-2.0, 0.0) @ (-1.0, 0.0) @ (0.0, 0.0) @ (1.0, 0.0) @ (2.0, 0.0) @ (3.0, 0.0))
    ran_yjump = Random (@ (0.0, -3.0) @ (0.0, -2.0) @ (0.0, -1.0) @ (0.0, 0.0) @ (0.0, 1.0) @ (2.0, 0.0) @ (3.0, 0.0))
    add_angle = Random (@ -6 @ -4 @ -2 @ 0 @ 2 @ 4 @ 6)
    ran_time = Random (@ 0.02000 @ 0.03000 @ 0.04000 @ 0.05000 @ 0.06000)
    ran_alpha = Random (@ 0.4000 @ 0.6000 @ 0.8000 @ 1)
    spray_icon ::DoMorph time = <ran_time> alpha = <ran_alpha> rot_angle = (<orig_rot> + <add_angle>)Pos = (<orig_pos> + <ran_xjump> + <ran_yjump>)
    wait 0.04000
    repeat Random (@ 20 @ 25 @ 30)
    spray_icon ::DoMorph time = 0 Pos = <orig_pos>
    spray_icon ::DoMorph time = 0.2000 Pos = (<orig_pos> + (-500.0, 0.0))
    wait Random (@ 1 @ 2 @ 3 @ 4) seconds
    DestroyScreenElement id = spray_icon
    FormatText checksumname = spray_text_name 'new_icon_%i' i = Random (@ 1 @ 2 @ 3 @ 4 @ 5 @ 6 @ 7 @ 8 @ 9 @ 10)
    SetScreenElementLock id = current_menu_anchor Off
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        id = spray_icon
        texture = <spray_text_name>
        rot_angle = <orig_rot>
        Pos = <orig_pos>
        Scale = <orig_scale>
        <orig_flip>
        z_priority = <orig_z>
        rgba = <orig_rgba>
    }
    repeat 
endscript

script paint_dripping 
    if GotParam \{ some_wait }
        add_time = 0.2000
    else
        add_time = 0
    endif
    wait <add_time> seconds
    DoMorph \{ time = 0 Scale = (1.0, 0.20000000298023224) }
    DoMorph \{ time = 6 Scale = (1.0, 2.0) }
endscript

script slide_in orig_pos = (200.0, 200.0)
    if GotParam some_wait
        add_time = 0.2000
    else
        add_time = 0
    endif
    if GotParam RIGHT
        DoMorph time = 0 Pos = (<orig_pos> + (400.0, 0.0))
        wait <add_time> seconds
        DoMorph time = 0.2000 Pos = <orig_pos>
    endif
    if GotParam top
        top_location = Random (@ (-100.0, 0.0) @ (-50.0, 0.0) @ (0.0, 0.0) @ (50.0, 0.0) @ (100.0, 0.0))
        DoMorph time = 0 Pos = (<orig_pos> - (0.0, 100.0) + <top_location>)
        wait <add_time> seconds
        DoMorph time = 0.2000 Pos = (<orig_pos> + <top_location>)
    endif
endscript

script circle_rotation 
    end_pos = (<orig_pos> + Random (@ (100.0, 0.0) @ (150.0, 0.0) @ (200.0, 0.0) @ (250.0, 0.0) @ (300.0, 0.0) @ (350.0, 0.0)))
    DoMorph time = 0 rot_angle = 0 Pos = (<end_pos> - (500.0, 0.0))
    wait Random (@ 3 @ 4 @ 5) seconds
    DoMorph time = 1 rot_angle = 1800 Pos = <end_pos>
    wait Random (@ 2 @ 3 @ 4 @ 5 @ 6) seconds
    DoMorph time = 0 rot_angle = 1800
    DoMorph time = 0.2000 rot_angle = 720
    DoMorph time = 0 Pos = <end_pos>
    DoMorph time = 0.2000 Pos = (<end_pos> + (1000.0, 0.0))
endscript

script paint_twitch 
    begin 
    DoMorph time = 0 rot_angle = <orig_rot>
    add_angle = Random (@ -3 @ -2 @ -1 @ 0 @ 1 @ 2 @ 3)
    ran_time = Random (@ 0.06000 @ 0.07000 @ 0.08000 @ 0.09000 @ 0.1000 @ 0.1200 @ 0.5000)
    DoMorph time = <ran_time> rot_angle = (<orig_rot> + <add_angle>)
    repeat 
endscript
