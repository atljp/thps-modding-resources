
skater_ambient_color = [105 , 85 , 85]
skater_diffuse_color1 = [28 , 28 , 28]
skater_diffuse_color2 = [10 , 10 , 10]
mainmneu_cam_offset = (-25.0, 51.0, -40.0)
spin_menu_pos = (46.0, 214.0)

script mainmenu_startup 
    
    
    
    
    
    LoadAsset 'models\mainmenu_bg\mainmenu_bg.tex'
    LoadAsset 'models\mainmenu_bg\mainmenu_bg.mdl' nocollision = 1 parent = `models\mainmenu_bg\mainmenu_bg.tex`
    GoalManager_HidePoints
    GoalManager_HideGoalPoints
    Randomize
    SetScoreDegradation 0
    change main_menu_ok_to_go = 0
    SpawnScript maybe_auto_load_from_memory_card
endscript


script mainmenu_LoadingSounds 
    LoadSound 'Skateshop\BoardsFlip' vol = 100 dropoff = 150
    LoadSound 'terrains\olliewood2' vol = 100 dropoff = 150
    LoadSound 'terrains\olliewood3' vol = 100 dropoff = 150
    LoadSound 'terrains\landwood2' vol = 100 dropoff = 150
    LoadSound 'terrains\landwood3' vol = 100 dropoff = 150
    LoadSound 'Shared\Menu\CheatGood'
    LoadSound 'Shared\Menu\CheatBad'
endscript


script Default_Goals 
    if InMultiplayerGame
        Add_MultiPlayer_Mode_Goals
    endif
    if NOT InSplitScreenGame
        if NOT GameModeEquals Is_SingleSession
        endif
    endif
    if NOT InSplitScreenGame
        if NOT GameModeEquals Is_SingleSession
            if NOT InNetGame
            endif
        endif
    endif
endscript


script TOD_Script 
    switch <current_tod>
        case morning
        case day
        case evening
        case night
        default 
        
    endswitch
endscript


script launch_main_menu 
    if (main_menu_jump_to_cas = 1)
        cas_mainmenu_startup
        return 
    endif
    if (main_menu_return_to_createamodes = 1)
        change main_menu_return_to_createamodes = 0
        create_createamodes_menu launched = launched
    else
        create_main_menu launched = launched
    endif
    if NOT GetGlobalFlag flag = SOUNDS_SONGORDER_RANDOM
        PlaySongsInOrder
    else
        PlaySongsRandomly
    endif
    PauseMusic 0
    pause_trick_text
    SetColorBufferClear clear = 1
endscript


script xbox_autoload_message 
    if (attempted_xbox_autoload = 0)
        change attempted_xbox_autoload = 1
        change DoAutoload = 1
        FireEvent type = unfocus target = current_menu
        create_dialog_box {title = 'Load Game'
            text = 'Load last Game Progress save?'
            text_dims = (350.0, 0.0)
            pos = (320.0, 240.0)
            just = [ center center ]
            text_rgba = [ 88 105 112 128 ]
            text_scale = 1
            no_bg = no_bg
            buttons = [{font = small text = 'Yes' pad_choose_script = yes_xbox_autoload}
                {font = small text = 'No' pad_choose_script = no_xbox_autoload}
            ]
        }
    endif
endscript


script yes_xbox_autoload 
    mark_first_input_received <...> 
    dialog_box_exit
    change DoAutoload = 0
endscript


script no_xbox_autoload 
    mark_first_input_received <...> 
    dialog_box_exit
    FireEvent type = unfocus target = current_menu
    change no_load = 1
    CheckForCardOnBootup
    change DoAutoload = 0
    Debounce X 0.3000
    UnpauseMusicAndStreams
    create_main_menu
endscript


script main_menu_startup_wait_and_signal_clear 
    change dont_unhide_loading_screen = 1
    PauseSkaters
    wait 10 gameframes
    change dont_unhide_loading_screen = 0
    if NOT IsTrue main_menu_jump_to_cas
        play_no_skater_cam
    endif
    change main_menu_ok_to_go = 1
endscript


script main_menu_wait_until_all_clear 
    begin 
    if ObjectExists id = skatercam0
        if ObjectExists id = skater
            if LocalSkaterExists
                if IsTrue main_menu_ok_to_go
                    return 
                endif
            endif
        endif
    endif
    wait 1 gameframe
    repeat 
endscript


script create_main_menu 
    change main_menu_return_to_createamodes = 0
    SetNetworkMode
    UnpauseMusicAndStreams
    UnPauseObjects
    change in_options_menu = 0
    SetNetworkMode
    SetMemThreadSafe off
    main_menu_wait_until_all_clear
    spin_menu_skater_script reset
    KillSpawnedScript name = TemporarilyDisableInput
    SpawnScript TemporarilyDisableInput params = { time = 400 }
    SetMenuPadMappings [ active
    use_as_first
     ]
    make_spin_menu pos = spin_menu_pos menu_id = main_menu vmenu_id = main_vmenu
    spin_menu_visible
    SetScreenElementProps {
        id = current_menu
        event_handlers = [
            { pad_up reset_attract_mode_timer }
            { pad_down reset_attract_mode_timer }
        ]
    }
    if NOT IsXBox
        CreateScreenElement {
            type = SpriteElement
            parent = current_menu_anchor
            texture = white3
            id = main_menu_gradient
            scale = (11.0, 6.0)
            rgba = [ 0 0 0 60 ]
            pos = (300.0, -10.0)
            rot_angle = 0
            just = [ left top ]
        }
    endif
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        id = mm_icon
        texture = <main_icon>
        just = [ center center ]
        pos = (42.0, 70.0)
        scale = (1.399999976158142, 1.399999976158142)
        rot_angle = -30
        z_priority = 12
        alpha = 1
    }
    add_main_menu_items
    GetScreenElementChildren id = current_menu
    GetArraySize <children>
    if ((<array_size> * 2)< 17)
        <num_blanks> = (8 - <array_size>)
        if (<num_blanks> > 0)
            begin 
            make_spin_menu_item { 
            blank
             }
            repeat <num_blanks>
        endif
        add_main_menu_items copy
        if (<num_blanks> > 0)
            begin 
            make_spin_menu_item { 
            blank
             }
            repeat <num_blanks>
        endif
    endif
    change spin_menu_cycle = 1
    CreateScreenElement {
        type = ContainerElement
        parent = current_menu_anchor
        id = attract_container
        event_handlers = [{ pad_back reset_attract_mode_timer }
            { pad_left reset_attract_mode_timer }
            { pad_right reset_attract_mode_timer }
        ]
    }
    create_helper_text generic_helper_text_no_back
    spin_menu_init
    FireEvent type = focus target = attract_container
    unpauseskaters
    UnpauseMusicAndStreams
    spin_menu_camera_init
    pulse_blur speed = 2 start = 255
    KillSpawnedScript name = attract_mode_timer
    SpawnScript attract_mode_timer
    if isNgc
        MemPushContext TopDownHeap
    endif
    SpawnSecondControllerCheck
    if isNgc
        MemPopContext
    endif
    if (layer_infos_need_resetting = 1)
        edit_graphic_reset_layer_infos
        edit_graphic_apply_graphic_from_save
        change layer_infos_need_resetting = 0
    endif
    wait 5 gameframe
    kill_start_key_binding
endscript


script spin_menu_init 
    FireEvent type = focus target = main_vmenu data = {grid_index = (spin_menu_selected_index)}
    SetScreenElementProps id = root_window tags = { menu_state = on }
    if NOT (spin_menu_selected_index = 0)
        change spin_menu_angle = (-22.50 * spin_menu_selected_index)
        change spin_menu_dir = -1
        DoScreenElementMorph id = current_menu rot_angle = spin_menu_angle time = 0
        spin_menu_spin_geometry rot_angle = spin_menu_angle spin_time = 0 no_wait
    endif
endscript


script add_test_spin_menu_items 
    <index> = 1
    begin 
    FormatText TextName = text '   --::     %i' i = <index>
    FormatText ChecksumName = id 'ITEM%i' i = <index>
    make_spin_menu_item {
        text1 = <text>
        highlight_text = <text>
        id = <id>
        pad_choose_script = main_menu_exit
        pad_choose_params = {
            new_menu_script = create_gamemode_options_menu
            change_gamemode = change_gamemode_career
            hold_camera
        }
        focus_params = { attract_timer }
        mark_first_input
        helper_text = <text>
        icon = mainicon_story
    }
    <index> = (<index> + 1)
    repeat 16
endscript


script add_main_menu_items 
    demo_build_item_active = 1
    if GotParam copy
        <id> = menu_career2
    else
        <id> = menu_career
    endif
    make_spin_menu_item {
        text1 = '         Story Mode'
        highlight_text = 'STORY MODE'
        id = <id>
        pad_choose_script = main_menu_exit
        pad_choose_params = {
            new_menu_script = create_gamemode_options_menu
            change_gamemode = change_gamemode_career
            hold_camera
        }
        focus_params = { attract_timer }
        mark_first_input
        helper_text = 'Play the game in story mode...'
        icon = mainicon_story
    }
    if GotParam copy
        <id> = menu_classic2
    else
        <id> = menu_classic
    endif
    make_spin_menu_item {
        text1 = '         Classic Mode'
        highlight_text = 'CLASSIC MODE'
        id = <id>
        pad_choose_script = main_menu_exit
        pad_choose_params = {
            new_menu_script = create_gamemode_options_menu
            change_gamemode = change_gamemode_classic
            hold_camera
        }
        focus_params = { attract_timer }
        mark_first_input
        helper_text = 'Play the game in classic mode...'
        icon = mainicon_classic
    }
    if OnXbox
        if GotParam copy
            <id> = menu_net2
        else
            <id> = menu_net
        endif
        if NOT (DEMO_BUILD)
            if NetworkAdaptorInstalled
                make_spin_menu_item {
                    text1 = '         Multiplayer'
                    highlight_text = 'MULTIPLAYER'
                    id = <id>
                    pad_choose_script = main_menu_exit
                    pad_choose_params = {
                        new_menu_script = select_network_play_multi
                        change_gamemode = change_gamemode_net
                        hold_camera
                        do_loading_logo
                    }
                    mark_first_input
                    focus_params = { attract_timer }
                    helper_text = 'Play the game online...'
                    icon = mainicon_online
                }
            else
                if NOT CD
                    make_spin_menu_item {
                        text1 = '         Multiplayer'
                        highlight_text = 'MULTIPLAYER'
                        id = <id>
                        pad_choose_script = main_menu_exit
                        pad_choose_params = {
                            new_menu_script = select_network_play_multi
                            change_gamemode = change_gamemode_net
                            hold_camera
                            do_loading_logo
                        }
                        mark_first_input
                        focus_params = { attract_timer }
                        helper_text = 'Play the game online...'
                        icon = mainicon_online
                    }
                else
                    make_spin_menu_item {
                        text1 = '         Multiplayer'
                        highlight_text = 'MULTIPLAYER'
                        id = <id>
                        pad_choose_script = main_menu_exit
                        pad_choose_params = {
                            new_menu_script = select_network_play_multi
                            change_gamemode = change_gamemode_net
                            hold_camera
                            do_loading_logo
                        }
                        mark_first_input
                        active = 0
                        focus_params = { attract_timer }
                        helper_text = 'Play the game online...'
                        icon = mainicon_online
                    }
                endif
            endif
        else
            make_spin_menu_item {
                text1 = '         Multiplayer'
                highlight_text = 'MULTIPLAYER'
                id = <id>
                active = 0
                helper_text = 'Play the game online...'
                icon = mainicon_online
            }
        endif
    endif
    if GotParam copy
        <id> = menu_singlesess2
    else
        <id> = menu_singlesess
    endif
    make_spin_menu_item {
        text1 = '           High Score'
        text2 = '           Free Skate'
        highlight_text = 'HIGH SCORE / FREE SKATE'
        id = <id>
        pad_choose_script = main_menu_exit
        pad_choose_params = {
            new_menu_script = launch_select_skater_menu
            change_gamemode = change_gamemode_singlesession
            hold_camera
            do_loading_logo
        }
        focus_params = { attract_timer }
        mark_first_input
        helper_text = 'Skate around or go for a high score...'
        icon = mainicon_score
        active = <demo_build_item_active>
    }
    if GotParam copy
        <id> = main_menu_2_player_option2
    else
        <id> = main_menu_2_player_option
    endif
    make_spin_menu_item {
        text1 = '         2 Player'
        highlight_text = '2 PLAYER'
        id = <id>
        pad_choose_script = main_menu_exit
        pad_choose_params = {
            new_menu_script = launch_select_skater_menu
            change_gamemode = change_gamemode_freeskate_2p
            hold_camera
            do_loading_logo
        }
        mark_first_input
        focus_params = { attract_timer }
        helper_text = 'Play the game with a friend...'
        icon = mainicon_2player
        active = <demo_build_item_active>
    }
    if GotParam copy
        <id> = menu_createamodes2
    else
        <id> = menu_createamodes
    endif
    make_spin_menu_item {
        text1 = '        Create-A-Modes'
        highlight_text = 'CREATE-A-MODES'
        id = <id>
        pad_choose_script = main_menu_exit
        pad_choose_params = {
            new_menu_script = create_createamodes_menu
            change_gamemode = change_gamemode_singlesession
            hold_camera
        }
        focus_params = { attract_timer }
        mark_first_input
        helper_text = 'Create custom content...'
        icon = mainicon_mode
    }
    if GotParam copy
        <id> = menu_options2
    else
        <id> = menu_options
    endif
    make_spin_menu_item {
        text1 = '         Game Options'
        highlight_text = 'GAME OPTIONS'
        id = <id>
        pad_choose_script = main_menu_exit
        pad_choose_params = {
            new_menu_script = create_setup_options_menu
            hold_camera
        }
        mark_first_input
        focus_params = { attract_timer }
        helper_text = 'Change the game options...'
        icon = mainicon_options
    }
    if GotParam copy
        <id> = menu_quit2
    else
        <id> = menu_quit
    endif
    make_spin_menu_item {
        text1 = '        Quit'
        highlight_text = 'QUIT'
        id = <id>
        pad_choose_script = main_menu_exit
        pad_choose_params = {
            new_menu_script = main_menu_exit_game
            hold_camera
        }
        focus_params = { attract_timer }
        mark_first_input
        helper_text = 'Quit the game...'
        icon = mainicon_mode
    }
endscript


script build_frontend_menu_title 
    CreateScreenElement {
        type = ContainerElement
        parent = current_menu_anchor
        id = current_menu_title
        pos = (700.0, 30.0)
    }
    Theme_GetSupportPieceColor return_value = tab_color
    FormatText ChecksumName = mainmenu_icon '%i_new' i = (THEME_PREFIXES [ current_theme_prefix ])
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_title
        texture = goal_tab
        rgba = <tab_color>
        scale = (1.0, 1.25)
        pos = (30.0, 0.0)
        alpha = 1
        just = [ left top ]
        z_priority = 1
    }
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_title
        texture = goal_tab_extra
        rgba = <tab_color>
        scale = (7.0, 1.25)
        pos = (80.0, 0.0)
        alpha = 1
        just = [ left top ]
        z_priority = 2
    }
    CreateScreenElement {
        type = TextElement
        parent = <id>
        font = testtitle
        text = 'MAIN MENU'
        rgba = [85 , 30 , 0 , 128]
        pos = (-3.0, 1.0)
        scale = (0.20000000298023224, 1.2999999523162842)
        just = [ left top ]
        z_priority = 3
    }
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_title
        texture = <mainmenu_icon>
        rgba = [ 128 128 2 30 ]
        scale = (1.25, 1.25)
        pos = (185.0, -20.0)
        alpha = 1
        rot_angle = 10
        just = [ left top ]
        z_priority = 10
    }
    Theme_GetAltColor return_value = grad_color
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_title
        texture = goal_grad
        rgba = <grad_color>
        scale = (9.0, 1.0)
        pos = (-30.0, 40.0)
        just = [ left top ]
        z_priority = 4
        alpha = 0.8000
        flip_v
    }
    DoScreenElementMorph id = current_menu_title pos = (380.0, 30.0) time = 0.3000
endscript


script spin_menu_skater_script 
    select_skater_get_current_skater_name
    if NOT (<current_skater> = custom)
        load_pro_skater {profile = 0 skater = 0 name = custom}
    endif
    unpauseskaters
    skater ::Obj_GetID
    MakeSkaterGoto SpinMenuSkaterIdle params = <...> 
    skater ::hide
endscript


script spin_menu_camera_init 
    skater ::Obj_GetID
    SetActiveCamera id = skatercam0
    skater ::unhide
    KillSkaterCamAnim all
    PlaySkaterCamAnim {name = mainmenu_camera02
        skater = 0
        targetID = <objId>
        targetOffset = mainmneu_cam_offset
        positionOffset = (0.0, 0.0, 160.0)
        play_hold
        frames = 1
    }
endscript

spin_menu_skater_idling = 0
spin_menu_skater_transitioning = 0

script SpinMenuGetSkaterAnim 
    if (spin_menu_skater_transitioning)
        change spin_menu_skater_transitioning = 0
        return anim = FrontEnd_Spin2Wheel
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
        Obj_MoveToNode name = trg_playerrestart Orient NoReset
        if NOT Obj_HasModelLights
            script_assert 'No skater lighting!'
        endif
        Obj_SetLightAmbientColor {
            r = (skater_ambient_color [ 0 ])
            g = (skater_ambient_color [ 1 ])
            b = (skater_ambient_color [ 2 ])
        }
        Obj_SetLightDiffuseColor {
            index = 0
            r = (skater_diffuse_color1 [ 0 ])
            g = (skater_diffuse_color1 [ 1 ])
            b = (skater_diffuse_color1 [ 2 ])
        }
        Obj_SetLightDiffuseColor {
            index = 1
            r = (skater_diffuse_color2 [ 0 ])
            g = (skater_diffuse_color2 [ 1 ])
            b = (skater_diffuse_color2 [ 2 ])
        }
        CancelRotateDisplay
        DisablePlayerInput
        SetRollingFriction 10000
        SetSpeed 0
        if flipped
            flip
        endif
        PausePhysics
    endif
    begin 
    SpinMenuGetSkaterAnim
    PlayAnim anim = <anim> Blendperiod = 0.2000
    Obj_WaitAnimFinished
    repeat 
endscript


script SpinMenuSkaterAction 
    change spin_menu_skater_transitioning = 0
    if (spin_menu_skater_idling)
        change spin_menu_skater_idling = 0
    endif
    if GotParam up
        <anim> = FrontEnd_Wheel_Spin_Dwn
    else
        if GotParam down
            <anim> = FrontEnd_Wheel_Spin_Up
        else
            if GotParam spin
                <anim> = FrontEnd_Wheel_Spin_Hard
            endif
        endif
    endif
    if GotParam anim
        PlayAnim anim = <anim> Blendperiod = 0.2000
        Obj_WaitAnimFinished
    endif
    MakeSkaterGoto SpinMenuSkaterIdle
endscript


script shadow_skater_script2 
    if GotParam launched
        wait 30 gameframes
    endif
    unpauseskaters
    SetActiveCamera id = skatercam0
    skater ::Obj_GetID
    MakeSkaterGoto ShadowSkaterFreestyleAI params = <...> 
    targetOffset = mainmneu_cam_offset
    positionOffset = (0.0, 0.0, 160.0)
    KillSkaterCamAnim all
    PlaySkaterCamAnim {name = mainmenu_camera02
        skater = 0
        targetID = <objId>
        targetOffset = <targetOffset>
        positionOffset = <positionOffset>
        play_hold
        frames = 1
    }
endscript


script ShadowSkaterAI 
    SkaterInit NoEndRun ReturnControl NoAnims
    TurnOffSpecialItem
    SwitchOnBoard
    ClearExceptions
    if NOT Obj_HasModelLights
        script_assert 'No skater lighting!'
    endif
    SetSpeed 0
    SetRollingFriction 999
    Obj_SetLightAmbientColor r = 0 g = 0 b = 0
    Obj_SetLightDiffuseColor index = 0 r = 0 g = 0 b = 0
    Obj_SetLightDiffuseColor index = 1 r = 0 g = 0 b = 0
    CancelRotateDisplay
    DisablePlayerInput
    SetRollingFriction 0
    Obj_MoveToNode name = trg_playerrestart Orient NoReset
    ShadowSkaterOptionsTricks
endscript


script ShadowSkaterOptionsTricks 
    KillSpawnedScript name = skaterDoOptionsTricks
    if (in_options_menu = 1)
        wait 5 gameframes
        SpawnScript skaterDoOptionsTricks
    endif
endscript


script skaterDoOptionsTricks 
    skater ::ShadowSkaterOptionsTrickScript
endscript


script ShadowSkaterOptionsTrickScript 
    SetSpeed 0
    SetRollingFriction 999
    SetSpeed 1
    SetRollingFriction 5
    type = (RandomNoRepeat (@ 0 @ 1))
    if (<type> = 0)
        PlayAnim {anim = crouchidle speed = 1.0 Blendperiod = 0.2000 cycle}
        wait 1.300 seconds
        PlayAnim {anim = ollie speed = 1.0 Blendperiod = 0}
        Jump no_sound
        WaitAnim 20 percent
        anim = (RandomNoRepeat (@ _360Flip @ kickflip @ heelflip @ impossible @ Hardflip @ varialkickflip @ varialheelflip @ PopShoveItBS @ NollieKickflip @ PopShoveIt))
        PlayAnim {anim = <anim> speed = 1.0 Blendperiod = 0.2000}
        Obj_WaitAnimFinished
        PlayAnim {anim = crouchidle speed = 1.0 Blendperiod = 0.2000 cycle}
    else
        anim = (RandomNoRepeat (@ NoseManual_Range @ Manual_Range))
        PlayAnim {anim = crouchidle speed = 1.0 Blendperiod = 0.2000 cycle}
        wait 0.6000 seconds
        PlayAnim {anim = <anim> speed = 1.0 from = 20 to = 60 Blendperiod = 0.5000}
        Obj_WaitAnimFinished
        PlayAnim {anim = <anim> speed = 1.0 backwards from = 20 to = 60 Blendperiod = 0.2000}
        Obj_WaitAnimFinished
        PlayAnim {anim = crouchidle speed = 1.0 Blendperiod = 0.2000 cycle}
    endif
endscript


script ShadowSkaterFreestyleAI 
    KillSpawnedScript name = ShadowSkaterOptionsTrickScript
    if GotParam make_it_safe
        SkaterInit NoEndRun ReturnControl NoAnims
        TurnOffSpecialItem
        SwitchOnBoard
        ClearExceptions
        Obj_MoveToNode name = trg_playerrestart Orient NoReset
        if NOT GotParam leave_lights
            if NOT Obj_HasModelLights
                script_assert 'No skater lighting!'
            endif
            Obj_SetLightAmbientColor {
                r = (skater_ambient_color [ 0 ])
                g = (skater_ambient_color [ 1 ])
                b = (skater_ambient_color [ 2 ])
            }
            Obj_SetLightDiffuseColor {
                index = 0
                r = (skater_diffuse_color1 [ 0 ])
                g = (skater_diffuse_color1 [ 1 ])
                b = (skater_diffuse_color1 [ 2 ])
            }
            Obj_SetLightDiffuseColor {
                index = 1
                r = (skater_diffuse_color2 [ 0 ])
                g = (skater_diffuse_color2 [ 1 ])
                b = (skater_diffuse_color2 [ 2 ])
            }
        endif
        CancelRotateDisplay
        DisablePlayerInput
        SetRollingFriction 10000
        SetSpeed 0
        flip
    else
        Obj_WaitAnimFinished
    endif
    begin 
    PlayAnim anim = Ped_M_Idle1
    wait 2 second
    repeat 
endscript


script ShadowSkaterTauntAI 
    
    KillSpawnedScript name = ShadowSkaterOptionsTrickScript
    if GotParam make_it_safe
        SkaterInit NoEndRun ReturnControl NoAnims
        TurnOffSpecialItem
        SwitchOnBoard
        ClearExceptions
        if NOT Obj_HasModelLights
            script_assert 'No skater lighting!'
        endif
        Obj_SetLightAmbientColor r = 0 g = 0 b = 0
        Obj_SetLightDiffuseColor index = 0 r = 0 g = 0 b = 0
        Obj_SetLightDiffuseColor index = 1 r = 0 g = 0 b = 0
        CancelRotateDisplay
        DisablePlayerInput
        SetRollingFriction 10000
        SetSpeed 0
        Obj_MoveToPos (0.0, 0.0, 0.0)
        if NOT flipped
            flip
        endif
    else
        Obj_WaitAnimFinished
    endif
    PlayAnim anim = Idle cycle
endscript

ped_profile_list = [
    {
        display_name = 'THPS1 Tony Hawk'
        ped_appearance_structure = appearance_thps_hawk
        ped_group_flag = SKATER_UNLOCKED_THPS
        tag_texture = 'tags\thps_01'
    }
    {
        display_name = 'The Hand'
        skater_profile = Hand
        ped_appearance_structure = appearance_hand
        ped_group_flag = SKATER_UNLOCKED_HAND
        tag_texture = 'tags\hnd_01'
    }
    {
        display_name = 'Jesse James'
        skater_profile = JesseJamesSkater
        ped_appearance_structure = Ped_segwayrider
        ped_group_flag = SKATER_UNLOCKED_JESSEJAMES
        tag_texture = 'tags\jam_01'
    }
    {
        display_name = 'Natas Kaupas'
        ped_appearance_structure = Ped_Natas
        ped_group_flag = SKATER_UNLOCKED_NATAS
        tag_texture = 'tags\nts_01'
    }
    {
        display_name = 'Phil Margera'
        ped_appearance_structure = Phil_Gagged
        ped_group_flag = SKATER_UNLOCKED_PHIL
        tag_texture = 'tags\phil_01'
    }
    {
        display_name = 'Steve-O'
        skater_profile = SteveoSkater
        ped_appearance_structure = Ped_mechbull
        ped_group_flag = SKATER_UNLOCKED_STEVEO
        tag_texture = 'tags\stv_01'
    }
    {
        display_name = 'Nigel Beaverhausen'
        ped_appearance_structure = Nigel_Costume
        ped_group_flag = SKATER_UNLOCKED_NIGEL
        tag_texture = 'tags\bev_01'
    }
    {
        display_name = 'Paulie Ryan'
        skater_profile = PaulieSkater
        ped_appearance_structure = paulie_full
        ped_group_flag = SKATER_UNLOCKED_PAULIE
        tag_texture = 'tags\paul_01'
    }
    {
        display_name = 'Aborigine'
        ped_appearance_structure = Ped_aborigine
        ped_group_flag = SKATER_UNLOCKED_PEDGROUP6
        tag_texture = 'tags\aborigine'
    }
    {
        display_name = 'Alien'
        ped_appearance_structure = Ped_Alien
        ped_group_flag = SKATER_UNLOCKED_PEDGROUP1
        tag_texture = 'tags\alien'
    }
    {
        display_name = 'Alien Doctor'
        ped_appearance_structure = Ped_AlienDoctor
        ped_group_flag = SKATER_UNLOCKED_PEDGROUP2
        tag_texture = 'tags\alien_dr'
    }
    {
        display_name = 'Alien Leader'
        ped_appearance_structure = Ped_AlienLeader
        ped_group_flag = SKATER_UNLOCKED_PEDGROUP4
        tag_texture = 'tags\alien_leader'
    }
    {
        display_name = 'Australian Cop'
        ped_appearance_structure = Ped_copaussie
        ped_group_flag = SKATER_UNLOCKED_PEDGROUP7
        tag_texture = 'tags\OZ_cop'
    }
    {
        display_name = 'Bigfoot'
        ped_appearance_structure = Ped_Bigfoot
        ped_group_flag = SKATER_UNLOCKED_PEDGROUP5
        tag_texture = 'tags\bigfoot'
    }
    {
        display_name = 'Bigfoot One'
        ped_appearance_structure = Ped_Bigfoot_graf
        ped_group_flag = SKATER_UNLOCKED_PEDGROUP8
        tag_texture = 'tags\bigfoot_1'
    }
    {
        display_name = 'Boat Captain'
        ped_appearance_structure = Ped_boatcaptain
        ped_group_flag = SKATER_UNLOCKED_PEDGROUP2
        tag_texture = 'tags\boat_capt'
    }
    {
        display_name = 'Boxer'
        ped_appearance_structure = Ped_Boxer
        ped_group_flag = SKATER_UNLOCKED_PEDGROUP8
        tag_texture = 'tags\boxer'
    }
    {
        display_name = 'Bratwurst Vendor'
        ped_appearance_structure = Ped_Bratwurst
        ped_group_flag = SKATER_UNLOCKED_PEDGROUP7
        tag_texture = 'tags\brat_vendor'
    }
    {
        display_name = 'Camera Man'
        ped_appearance_structure = Ped_CameraMan
        ped_group_flag = SKATER_UNLOCKED_PEDGROUP6
        tag_texture = 'tags\camera_man'
    }
    {
        display_name = 'Construction Worker'
        ped_appearance_structure = Ped_Construction_Worker_01
        ped_group_flag = SKATER_UNLOCKED_PEDGROUP6
        tag_texture = 'tags\construction_worker'
    }
    {
        display_name = 'Corn Vendor'
        ped_appearance_structure = Ped_Corn_Vendor_01
        ped_group_flag = SKATER_UNLOCKED_PEDGROUP7
        tag_texture = 'tags\corn_vendor'
    }
    {
        display_name = 'Cut Chemist'
        ped_appearance_structure = Ped_CutChemist
        ped_group_flag = SKATER_UNLOCKED_PEDGROUP6
        tag_texture = 'tags\cut_chemist'
    }
    {
        display_name = 'Flute Player'
        ped_appearance_structure = Ped_FluteGuy
        ped_group_flag = SKATER_UNLOCKED_PEDGROUP8
        tag_texture = 'tags\flute_player'
    }
    {
        display_name = 'Geeky Kid'
        ped_appearance_structure = Ped_Nerdkid
        ped_group_flag = SKATER_UNLOCKED_PEDGROUP1
        tag_texture = 'tags\geeky_kid'
    }
    {
        display_name = 'German Cop'
        ped_appearance_structure = Ped_germancop
        ped_group_flag = SKATER_UNLOCKED_PEDGROUP7
        tag_texture = 'tags\german_cop'
    }
    {
        display_name = 'German Drunk 1'
        ped_appearance_structure = Ped_germandrunk
        ped_group_flag = SKATER_UNLOCKED_PEDGROUP3
        tag_texture = 'tags\german_drunk_1'
    }
    {
        display_name = 'German Drunk 2'
        ped_appearance_structure = Ped_germandrunk01
        ped_group_flag = SKATER_UNLOCKED_PEDGROUP6
        tag_texture = 'tags\german_drunk_2'
    }
    {
        display_name = 'German Drunk 3'
        ped_appearance_structure = Ped_germandrunk02
        ped_group_flag = SKATER_UNLOCKED_PEDGROUP7
        tag_texture = 'tags\german_drunk_3'
    }
    {
        display_name = 'Graffiti Punk'
        ped_appearance_structure = Ped_Grafiti_Punker_01
        ped_group_flag = SKATER_UNLOCKED_PEDGROUP6
        tag_texture = 'tags\graffiti_punk'
    }
    {
        display_name = 'Guitar Player'
        ped_appearance_structure = Ped_guitarist
        ped_group_flag = SKATER_UNLOCKED_PEDGROUP8
        tag_texture = 'tags\guitarist'
    }
    {
        display_name = 'Horn Player'
        ped_appearance_structure = Ped_jazzman1
        ped_group_flag = SKATER_UNLOCKED_PEDGROUP7
        tag_texture = 'tags\horn_player'
    }
    {
        display_name = 'Hospital Attendant'
        ped_appearance_structure = Ped_attendant
        ped_group_flag = SKATER_UNLOCKED_PEDGROUP6
        tag_texture = 'tags\attendant'
    }
    {
        display_name = 'Imp'
        ped_appearance_structure = Ped_Imp
        ped_group_flag = SKATER_UNLOCKED_PEDGROUP5
        tag_texture = 'tags\imp'
    }
    {
        display_name = 'Inline Skater'
        ped_appearance_structure = Ped_rollerblader
        ped_group_flag = SKATER_UNLOCKED_PEDGROUP4
        tag_texture = 'tags\inline_skater'
    }
    {
        display_name = 'Lifeguard'
        ped_appearance_structure = Ped_Lifeguard
        ped_group_flag = SKATER_UNLOCKED_PEDGROUP6
        tag_texture = 'tags\lifeguard'
    }
    {
        display_name = 'Lounge Singer'
        ped_appearance_structure = Ped_loungesinger
        ped_group_flag = SKATER_UNLOCKED_PEDGROUP8
        tag_texture = 'tags\lounge_singer'
    }
    {
        display_name = 'Lost Soul 1'
        ped_appearance_structure = Ped_LostSoul01
        ped_group_flag = SKATER_UNLOCKED_PEDGROUP2
        tag_texture = 'tags\lost_soul_1'
    }
    {
        display_name = 'Lost Soul 2'
        ped_appearance_structure = Ped_LostSoul02
        ped_group_flag = SKATER_UNLOCKED_PEDGROUP7
        tag_texture = 'tags\lost_soul_2'
    }
    {
        display_name = 'Lost Soul 3'
        ped_appearance_structure = Ped_LostSoul03
        ped_group_flag = SKATER_UNLOCKED_PEDGROUP8
        tag_texture = 'tags\lost_soul_3'
    }
    {
        display_name = 'Mayan'
        ped_appearance_structure = Ped_Mayan
        ped_group_flag = SKATER_UNLOCKED_PEDGROUP6
        tag_texture = 'tags\mayan'
    }
    {
        display_name = 'Mayan Tiki Mask'
        ped_appearance_structure = Ped_TikiMan
        ped_group_flag = SKATER_UNLOCKED_PEDGROUP8
        tag_texture = 'tags\mayan_mask'
    }
    {
        display_name = 'Metal Detector Guy'
        ped_appearance_structure = Ped_metaldetector
        ped_group_flag = SKATER_UNLOCKED_PEDGROUP7
        tag_texture = 'tags\metal_detector'
    }
    {
        display_name = 'Mime'
        ped_appearance_structure = Ped_mime
        ped_group_flag = SKATER_UNLOCKED_PEDGROUP3
        tag_texture = 'tags\mime'
    }
    {
        display_name = 'Paramedic'
        ped_appearance_structure = Ped_Paramedic_01
        ped_group_flag = SKATER_UNLOCKED_PEDGROUP8
        tag_texture = 'tags\paramedic'
    }
    {
        display_name = 'Pirate'
        ped_appearance_structure = Ped_Pirate
        ped_group_flag = SKATER_UNLOCKED_PEDGROUP7
        tag_texture = 'tags\pirate'
    }
    {
        display_name = 'Ramp Kid'
        ped_appearance_structure = Ped_Ramp_Kid_01
        ped_group_flag = SKATER_UNLOCKED_PEDGROUP4
        tag_texture = 'tags\ramp_kid'
    }
    {
        display_name = 'Revolutionary Soldier'
        ped_appearance_structure = Ped_Soldier_01
        ped_group_flag = SKATER_UNLOCKED_PEDGROUP6
        tag_texture = 'tags\soldier'
    }
    {
        display_name = 'Security Guard'
        ped_appearance_structure = Ped_Security_Guard_01
        ped_group_flag = SKATER_UNLOCKED_PEDGROUP8
        tag_texture = 'tags\security_guard'
    }
    {
        display_name = 'Skaboto'
        ped_appearance_structure = Ped_Skaboto
        ped_group_flag = SKATER_UNLOCKED_PEDGROUP8
        tag_texture = 'tags\skaboto'
    }
    {
        display_name = 'Skatopia Punk'
        ped_appearance_structure = Ped_Skatopiaguy
        ped_group_flag = SKATER_UNLOCKED_PEDGROUP7
        tag_texture = 'tags\skatopia_punk'
    }
    {
        display_name = 'Space Monkey 1'
        ped_appearance_structure = Ped_dalek
        ped_group_flag = SKATER_UNLOCKED_PEDGROUP1
        tag_texture = 'tags\dalek_1'
    }
    {
        display_name = 'Space Monkey 2'
        ped_appearance_structure = Ped_dalekPink
        ped_group_flag = SKATER_UNLOCKED_PEDGROUP5
        tag_texture = 'tags\dalek_2'
    }
    {
        display_name = 'Space Monkey 3'
        ped_appearance_structure = Ped_dalekBlue
        ped_group_flag = SKATER_UNLOCKED_PEDGROUP8
        tag_texture = 'tags\dalek_3'
    }
    {
        display_name = 'Voodoo Doctor'
        ped_appearance_structure = Ped_witchdoctor
        ped_group_flag = SKATER_UNLOCKED_PEDGROUP6
        tag_texture = 'tags\voodoo_dr'
    }
    {
        display_name = 'Wiener Vendor'
        ped_appearance_structure = Ped_Wienerman
        ped_group_flag = SKATER_UNLOCKED_PEDGROUP8
        tag_texture = 'tags\wiener_man'
    }
    {
        display_name = 'Zombie 1'
        ped_appearance_structure = Ped_zombiemale01
        ped_group_flag = SKATER_UNLOCKED_PEDGROUP3
        tag_texture = 'tags\zombie1'
    }
    {
        display_name = 'Zombie 2'
        ped_appearance_structure = Ped_zombiemale02
        ped_group_flag = SKATER_UNLOCKED_PEDGROUP7
        tag_texture = 'tags\zombie2'
    }
    {
        display_name = 'Nick'
        ped_appearance_structure = appearance_Nick_SecretGuy
        ped_group_flag = SKATER_UNLOCKED_SECRETPC2
        tag_texture = 'tags\cas_01'
    }
]
Cheat_Array_PS2 = [
    {c1 = 545841905 c2 = 84713469 CheatScript = cheat_unlock_always_special}, 
    {c1 = -583947711 c2 = -1240660229 CheatScript = cheat_unlock_perfect_rail}, 
    {c1 = -1345692571 c2 = 703699882 CheatScript = cheat_unlock_perfect_skitch}, 
    {c1 = -1223130875 c2 = 715658530 CheatScript = cheat_unlock_perfect_manual}, 
    {c1 = 55099068 c2 = 1958650257 CheatScript = cheat_unlock_moon_grav}, 
    {c1 = 1344548858 c2 = -927109724 CheatScript = cheat_unlock_pedgroup1}, 
    {c1 = 285918770 c2 = 1603341981 CheatScript = cheat_unlock_pedgroup2}, 
    {c1 = -1396779224 c2 = -1073220455 CheatScript = cheat_unlock_pedgroup3}, 
    {c1 = -1782492827 c2 = -640838653 CheatScript = cheat_unlock_pedgroup4}, 
    {c1 = -1693513812 c2 = -228863361 CheatScript = cheat_unlock_pedgroup5}, 
    {c1 = 1891226589 c2 = -854662387 CheatScript = cheat_unlock_pedgroup6}, 
    {c1 = 845877638 c2 = -544801105 CheatScript = cheat_unlock_pedgroup7}, 
    {c1 = -53690407 c2 = -977021967 CheatScript = cheat_unlock_pedgroup8}, 
    {c1 = 170978007 c2 = -566211124 CheatScript = cheat_give_shrek}, 
    {c1 = 1519669830 c2 = -2005756819 CheatScript = cheat_give_soldier}, 
    {c1 = 1932251332 c2 = 2016179590 CheatScript = cheat_give_phil}, 
    {c1 = -615110808 c2 = -1734759928 CheatScript = cheat_give_hand}, 
    {c1 = -1050231328 c2 = 826772284 CheatScript = cheat_give_paulie}, 
    {c1 = -218547029 c2 = -348688460 CheatScript = cheat_give_nigel}, 
    {c1 = 308960353 c2 = 486659919 CheatScript = cheat_give_steveo}, 
    {c1 = -1274239892 c2 = 190985262 CheatScript = cheat_give_jesse}, 
    {c1 = 1518124631 c2 = 2063664936 CheatScript = cheat_give_thps}, 
    {c1 = -894413638 c2 = 872184104 CheatScript = cheat_give_natas}, 
    {c1 = 732008750 c2 = 1439874859 CheatScript = cheat_unlockmovies}, 
    {c1 = -438074064 c2 = 226203349 CheatScript = cheat_reallygivelevels}, 
    {c1 = -856409528 c2 = 1701196796 CheatScript = cheat_give_story_skaters}, 
    {c1 = 91444980 c2 = 392468884 CheatScript = unlock_all_cheats}, 
    {c1 = -806439674 c2 = -388533228 CheatScript = cheat_select_shift}, 
    {c1 = -1493081239 c2 = 1180396759 CheatScript = cheat_sce_patchtest}, 
]
Cheat_Array_Xbox = [
    {c1 = 545841905 c2 = 84713469 CheatScript = cheat_unlock_always_special}, 
    {c1 = -583947711 c2 = -1240660229 CheatScript = cheat_unlock_perfect_rail}, 
    {c1 = -1345692571 c2 = 703699882 CheatScript = cheat_unlock_perfect_skitch}, 
    {c1 = -1223130875 c2 = 715658530 CheatScript = cheat_unlock_perfect_manual}, 
    {c1 = 55099068 c2 = 1958650257 CheatScript = cheat_unlock_moon_grav}, 
    {c1 = 1344548858 c2 = -927109724 CheatScript = cheat_unlock_pedgroup1}, 
    {c1 = 285918770 c2 = 1603341981 CheatScript = cheat_unlock_pedgroup2}, 
    {c1 = -1396779224 c2 = -1073220455 CheatScript = cheat_unlock_pedgroup3}, 
    {c1 = -1782492827 c2 = -640838653 CheatScript = cheat_unlock_pedgroup4}, 
    {c1 = -1693513812 c2 = -228863361 CheatScript = cheat_unlock_pedgroup5}, 
    {c1 = 1891226589 c2 = -854662387 CheatScript = cheat_unlock_pedgroup6}, 
    {c1 = 845877638 c2 = -544801105 CheatScript = cheat_unlock_pedgroup7}, 
    {c1 = -53690407 c2 = -977021967 CheatScript = cheat_unlock_pedgroup8}, 
    {c1 = -303100549 c2 = -863936501 CheatScript = cheat_give_shrek}, 
    {c1 = 1056673164 c2 = -732347542 CheatScript = cheat_give_soldier}, 
    {c1 = 183490368 c2 = 912427169 CheatScript = cheat_give_phil}, 
    {c1 = -16749197 c2 = 460243178 CheatScript = cheat_give_hand}, 
    {c1 = -1333030372 c2 = 1370788918 CheatScript = cheat_give_paulie}, 
    {c1 = -676492935 c2 = -66972016 CheatScript = cheat_give_nigel}, 
    {c1 = 12676939 c2 = -1435521434 CheatScript = cheat_give_steveo}, 
    {c1 = -601691221 c2 = -752390296 CheatScript = cheat_give_jesse}, 
    {c1 = 170735393 c2 = 1091967566 CheatScript = cheat_give_thps}, 
    {c1 = 371805994 c2 = -1595871973 CheatScript = cheat_give_natas}, 
    {c1 = -982563233 c2 = -597069101 CheatScript = unlock_PC_secret_character2}, 
    {c1 = 475224047 c2 = -1197708078 CheatScript = cheat_unlockmovies}, 
    {c1 = -961267055 c2 = 720938718 CheatScript = cheat_reallygivelevels}, 
    {c1 = 634158371 c2 = -1664558761 CheatScript = cheat_give_story_skaters}, 
    {c1 = -1876658675 c2 = 1905700282 CheatScript = unlock_all_cheats}, 
    {c1 = -806439674 c2 = -388533228 CheatScript = cheat_select_shift}, 
]
Cheat_Array_Gamecube = [
    {c1 = 545841905 c2 = 84713469 CheatScript = cheat_unlock_always_special}, 
    {c1 = -583947711 c2 = -1240660229 CheatScript = cheat_unlock_perfect_rail}, 
    {c1 = -1345692571 c2 = 703699882 CheatScript = cheat_unlock_perfect_skitch}, 
    {c1 = -1223130875 c2 = 715658530 CheatScript = cheat_unlock_perfect_manual}, 
    {c1 = 55099068 c2 = 1958650257 CheatScript = cheat_unlock_moon_grav}, 
    {c1 = 1344548858 c2 = -927109724 CheatScript = cheat_unlock_pedgroup1}, 
    {c1 = 285918770 c2 = 1603341981 CheatScript = cheat_unlock_pedgroup2}, 
    {c1 = -1396779224 c2 = -1073220455 CheatScript = cheat_unlock_pedgroup3}, 
    {c1 = -1782492827 c2 = -640838653 CheatScript = cheat_unlock_pedgroup4}, 
    {c1 = -1693513812 c2 = -228863361 CheatScript = cheat_unlock_pedgroup5}, 
    {c1 = 1891226589 c2 = -854662387 CheatScript = cheat_unlock_pedgroup6}, 
    {c1 = 845877638 c2 = -544801105 CheatScript = cheat_unlock_pedgroup7}, 
    {c1 = -53690407 c2 = -977021967 CheatScript = cheat_unlock_pedgroup8}, 
    {c1 = 170978007 c2 = -566211124 CheatScript = cheat_give_shrek}, 
    {c1 = 649428403 c2 = -1098547668 CheatScript = cheat_give_soldier}, 
    {c1 = 128307069 c2 = 928653172 CheatScript = cheat_give_phil}, 
    {c1 = 379679930 c2 = 1875427755 CheatScript = cheat_give_hand}, 
    {c1 = -1421658672 c2 = 1181521849 CheatScript = cheat_give_paulie}, 
    {c1 = 948655059 c2 = -969410848 CheatScript = cheat_give_nigel}, 
    {c1 = -647890074 c2 = 264051307 CheatScript = cheat_give_steveo}, 
    {c1 = 1449630157 c2 = 1853352064 CheatScript = cheat_give_jesse}, 
    {c1 = 2117264192 c2 = 933696620 CheatScript = cheat_give_thps}, 
    {c1 = -334042047 c2 = 602512449 CheatScript = cheat_give_natas}, 
    {c1 = 952447539 c2 = 1258891340 CheatScript = cheat_unlockmovies}, 
    {c1 = -2008980294 c2 = 1671116804 CheatScript = cheat_reallygivelevels}, 
    {c1 = 1603485155 c2 = -571160259 CheatScript = cheat_give_story_skaters}, 
    {c1 = 14630830 c2 = -2025296367 CheatScript = unlock_all_cheats}, 
    {c1 = -806439674 c2 = -388533228 CheatScript = cheat_select_shift}, 
]

script create_createamodes_menu 
    if (DEMO_BUILD = 1)
    endif
    main_menu_wait_until_all_clear
    change main_menu_return_to_createamodes = 1
    make_new_roundbar_menu title = 'CREATE-A-MODES' pos = (130.0, 100.0) use_icons spacing = 6 pad_back_script = generic_menu_pad_back pad_back_params = { callback = create_main_menu }
    if GotParam launched
        spin_menu_skater_script reset
    else
        MakeSkaterGoto SpinMenuSkaterIdle params = { reset }
    endif
    change cas_cam_angle = 0
    cas_setup_rotating_camera cam_anim = create_modes_camera
    pulse_blur speed = 2 start = 255
    add_roundbar_menu_item {
        text = 'CREATE-A-SKATER'
        id = menu_cas
        pad_choose_script = createamodes_menu_exit
        pad_choose_params = {
            new_menu_script = cas_mainmenu_startup
            change_cas_from_main
        }
        icon = mainicon_cas
    }
    add_roundbar_menu_item {
        text = 'CREATE-A-PARK'
        id = menu_parked
        pad_choose_script = createamodes_menu_exit
        pad_choose_params = {
            new_menu_script = launch_park_editor
        }
        icon = mainicon_cap
        <demo_build_item_active>
    }
    add_roundbar_menu_item {
        text = 'CREATE-A-GRAPHIC'
        id = menu_cagr
        pad_choose_script = createamodes_menu_exit
        pad_choose_params = {
            new_menu_script = edit_graphic_launch_cagr
        }
        icon = mainicon_cagr
    }
    add_roundbar_menu_item {
        text = 'CREATE-A-GOAL'
        id = menu_creategoals
        pad_choose_script = createamodes_menu_exit
        pad_choose_params = {
            new_menu_script = create_select_goals_menu
            change_gamemode = change_gamemode_creategoals
        }
        icon = mainicon_cag
        <demo_build_item_active>
    }
    add_roundbar_menu_item {
        text = 'CREATE-A-TRICK'
        id = menu_cat
        pad_choose_script = createamodes_menu_exit
        pad_choose_params = {
            new_menu_script = cat_launch_bo
            change_gamemode = change_gamemode_singlesession
            set_cat_mode_flag
        }
        icon = mainicon_cat
        <demo_build_item_active>
    }
    draw_menu_background create_mode
    roundbar_menu_finish build_pause_parts = 0
endscript


script createamodes_menu_exit 
    if GotParam change_cas_from_main
        change entered_cas_from_main = 1
    endif
    if GotParam set_cat_mode_flag
        change launch_to_createatrick = 1
    else
        change launch_to_createatrick = 0
    endif
    if ObjectExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    <new_menu_script> <...> 
endscript


script cancel_quit_game 
    dialog_box_exit
    create_main_menu
endscript


script confirm_quit_game 
    menu_confirm_quit {
        yes_script = quit_game
        back_script = cancel_quit_game
        no_script = cancel_quit_game
    }
endscript


script main_menu_exit_game 
    menu_confirm_quit {
        yes_script = quit_game
        back_script = cancel_quit_game
        no_script = cancel_quit_game
    }
endscript


script quit_game 
    QuitGame
endscript


script create_gamemode_options_menu 
    dialog_box_exit
    if GotParam change_gamemode
        <change_gamemode>
    endif
    change cas_cam_angle = 0
    cas_setup_rotating_camera cam_anim = story_mode_menu
    if GameModeEquals is_classic
        mode_text = 'CLASSIC MODE'
        mode_flag = CLASSIC_STARTED
        continue_script = launch_select_skater_menu
    else
        mode_text = 'STORY MODE'
        mode_flag = CAREER_STARTED
        continue_script = story_options_change_level
    endif
    make_new_roundbar_menu title = (<mode_text> + ' OPTIONS')pos = (130.0, 100.0) spacing = 6 pad_back_script = generic_menu_pad_back pad_back_params = { callback = create_main_menu }vmenu_id = career_options_vmenu
    if GameModeEquals is_career
        if NOT CD
            add_roundbar_menu_item {
                text = 'LEVEL SELECT'
                id = ss_play_level
                pad_choose_script = gamemode_options_menu_exit
                pad_choose_params = {
                    new_menu_script = launch_level_select_menu
                }
            }
        endif
    endif
    if GetGlobalFlag flag = <mode_flag>
        add_roundbar_menu_item {
            text = ('CONTINUE ' + <mode_text>)
            id = ss_continue_story
            pad_choose_script = gamemode_options_menu_exit
            pad_choose_params = {
                new_menu_script = <continue_script>
                continue_story
            }
        }
        add_roundbar_menu_item {
            text = ('START NEW ' + <mode_text>)
            id = ss_new_story
            pad_choose_script = gamemode_overwrite_warning
        }
        add_roundbar_menu_item {
            text = ('LOAD GAME PROGRESS')
            id = ss_load_story
            pad_choose_script = gamemode_overwrite_warning
            pad_choose_params = {
                load
                pad_choose_script = launch_career_menu_load_game_sequence
            }
        }
    else
        reset_gamemode
        add_roundbar_menu_item {
            text = ('CONTINUE ' + <mode_text>)
            id = ss_continue_story
            pad_choose_script = null_script
            not_focusable
        }
        add_roundbar_menu_item {
            text = ('START NEW ' + <mode_text>)
            id = ss_new_story
            pad_choose_script = gamemode_options_menu_exit
            pad_choose_params = {
                new_menu_script = create_gamemode_difficulty_menu
            }
        }
        add_roundbar_menu_item {
            text = ('LOAD GAME PROGRESS')
            id = ss_load_story
            pad_choose_script = gamemode_options_menu_exit
            pad_choose_params = {
                new_menu_script = launch_career_menu_load_game_sequence
                from_career
            }
        }
    endif
    if NOT GameModeEquals is_classic
        draw_menu_background story_mode story_wdt
    else
        draw_menu_background story_mode
    endif
    roundbar_menu_finish build_pause_parts = 0
endscript


script gamemode_options_menu_exit 
    if GotParam show_skater
        skater ::unhide
    endif
    dialog_box_exit
    if ObjectExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    if GameModeEquals is_classic
        if GotParam just_started_game
            GetInitialsString
            if StringEquals a = <string> b = 'ABC'
                high_scores_menu_enter_initials <...> allow_back keyboard_cancel_script = create_gamemode_difficulty_menu
                return 
            endif
        endif
    endif
    safe_callback = <new_menu_script>
    RemoveParameter new_menu_script
    <safe_callback> <...> 
endscript


script gamemode_overwrite_warning pad_choose_script = gamemode_options_menu_exit
    if GameModeEquals is_classic
        mode_text = 'Classic Mode'
    else
        mode_text = 'Story Mode'
    endif
    if GotParam load
        mode_text = 'Game progress'
        FormatText {
            TextName = title
            'Load %m'
            m = <mode_text>
        }
        extra_text = '\n Continue? '
    else
        FormatText {
            TextName = title
            'Start New %m'
            m = <mode_text>
        }
        extra_text = '\n\nNote: Items unlocked from beating the game will not be lost.\nContinue?'
    endif
    FormatText {
        TextName = text
        'Warning !\nAny unsaved changes to your current %m will be lost.%e'
        m = <mode_text>
        e = <extra_text>
    }
    FireEvent type = unfocus target = current_menu_anchor
    DoScreenElementMorph id = career_options_vmenu alpha = 0 time = 0.1000
    create_snazzy_dialog_box {
        title = <title>
        text = <text>
        text_dims = (400.0, 0.0)
        no_bg
        pad_back_script = cancel_gamemode_overwrite
        buttons = [{font = small text = 'No' pad_choose_script = cancel_gamemode_overwrite}
            {font = small text = 'Yes'
                pad_choose_script = <pad_choose_script>
                pad_choose_params = 
                {
                    new_menu_script = reset_gamemode
                    create_difficulty_menu
                }
            }
        ]
    }
endscript


script cancel_gamemode_overwrite 
    dialog_box_exit
    DoScreenElementMorph id = career_options_vmenu alpha = 1 time = 0.1000
    FireEvent type = focus target = current_menu_anchor
    SetScreenElementLock id = current_menu_anchor off
    create_helper_text generic_helper_text
endscript


script reset_gamemode 
    if GameModeEquals is_classic
        
        UnsetGlobalFlag flag = CLASSIC_STARTED
        clear_flag_array = CLASSIC_CLEAR_GLOBAL_FLAGS
        need_flags_cleared = 1
        reset_mode = classic
    else
        
        SetCurrentChapter chapter = 0
        ResetChapterStatus
        ForEachSkaterName do = ResetToDefaultProfile params = { partial = stats_and_tricks }
        GetCurrentSkaterProfileIndex
        UpdateTrickMappings skater = <currentSkaterProfileIndex>
        UnsetGlobalFlag flag = CAREER_STARTED
        clear_flag_array = STORY_CLEAR_GLOBAL_FLAGS
        need_flags_cleared = 1
        reset_mode = career
    endif
    CareerReset <reset_mode>
    GoalManager_ResetCareer <reset_mode>
    if (<need_flags_cleared> = 1)
        index = 0
        begin 
        if ArrayContains array = <clear_flag_array> contains = <index>
            UnsetGlobalFlag flag = <index>
        endif
        <index> = (<index> + 1)
        repeat 512
    endif
    SetStartingLevelFlags
    if GotParam create_difficulty_menu
        create_gamemode_difficulty_menu
    endif
endscript


script create_gamemode_difficulty_menu 
    dialog_box_exit
    skater ::hide
    if GotParam from_ss_menu
        new_menu_script = launch_ss_menu
    else
        new_menu_script = create_gamemode_options_menu
    endif
    make_new_roundbar_menu {
        pad_back_script = generic_menu_pad_back
        pad_back_params = {callback = gamemode_options_menu_exit new_menu_script = <new_menu_script> no_animate show_skater}
        pos = (100.0, 100.0)
        dims = (230.0, 480.0)
        additional_create_script = pause_create_tipbox
        additional_focus_script = pause_focus_tipbox
        additional_unfocus_script = pause_unfocus_tipbox
        internal_text_just = right
        helper_text = <helper>
    }
    build_theme_sub_title title = 'DIFFICULTY'
    starting_difficulty = 0
    if NOT GameModeEquals is_classic
        add_roundbar_menu_item {text = 'Easy'
            pad_choose_script = gamemode_options_menu_exit
            pad_choose_params = {new_menu_script = set_gamemode_difficulty dif = <starting_difficulty> from_ss_menu = <from_ss_menu>}
            tip_text = 'Less difficult goals for those fairly new to the Tony Hawk series'
            additional_width = (100.0, 0.0)
        }
        starting_difficulty = 1
    endif
    add_roundbar_menu_item {text = 'Normal'
        pad_choose_script = gamemode_options_menu_exit
        pad_choose_params = {new_menu_script = set_gamemode_difficulty dif = <starting_difficulty> from_ss_menu = <from_ss_menu>}
        tip_text = 'Challenging goals for the average to good Tony Hawk player'
        additional_width = (100.0, 0.0)
        tag_grid_x = 1
    }
    if NOT GotParam from_ss_menu
        add_roundbar_menu_item {text = 'Sick'
            pad_choose_script = gamemode_options_menu_exit
            pad_choose_params = {new_menu_script = set_gamemode_difficulty dif = (<starting_difficulty> + 1)from_ss_menu = <from_ss_menu>}
            tip_text = 'For hardcore veterans who have mastered the Tony Hawk games'
            additional_width = (100.0, 0.0)
        }
    endif
    if NOT GameModeEquals is_classic
        draw_menu_background story_mode story_wdt difficulty
    else
        draw_menu_background story_mode difficulty
    endif
    roundbar_menu_finish data = { grid_index = 1 }
endscript


script set_gamemode_difficulty 
    GoalManager_SetDifficultyLevel <dif>
    if GameModeEquals is_classic
        pad_choose_script = launch_select_skater_menu
        SetGlobalFlag flag = CLASSIC_STARTED
    endif
    if GameModeEquals is_career
        pad_choose_script = story_options_change_level
        ResetArcadeScores
        skater ::StatsManager_ReInit
    endif
    if GotParam set_flag
        SetGlobalFlag flag = <flag>
    endif
    if NOT GotParam from_ss_menu
        skater ::remove_skater_from_world
        change check_for_unplugged_controllers = 0
        gamemode_options_menu_exit {new_menu_script = <pad_choose_script> kill_all just_started_game}
    else
        launch_ss_menu no_animate
    endif
endscript

spin_menu_angles = [
    0.0
    22.50
    45.0
    67.50
    90.0
    112.5
    135.0
    157.5
    180.0
    202.5
    225.0
    247.5
    270.0
    292.5
    315.0
    337.0
]
spin_menu_angle_index = 0
spin_menu_angle = 0.0
spin_menu_dir = 0
spin_menu_cycle = 1
spin_menu_unhighlighted_text = [ 10 0 0 128 ]
spin_menu_disabled_text = [ 30 20 20 58 ]
spin_menu_spin_time = 0.1500
spin_menu_selected_index = 0

script spin_menu_mark_selected 
    GetTags
    change spin_menu_selected_index = <tag_grid_x>
endscript


script make_spin_menu 
    change spin_menu_angle_index = 0
    change spin_menu_angle = 0.0
    spin_menu_spin_geometry rot_angle = 0.0 spin_time = 0.0 no_wait
    change spin_menu_dir = 0
    change spin_menu_item_index = 0
    if ObjectExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    kill_start_key_binding
    SetScreenElementLock id = root_window off
    CreateScreenElement {
        type = ContainerElement
        parent = root_window
        id = <menu_id>
        font = small
        pos = (320.0, 240.0)
        scale = 1
        dims = (640.0, 480.0)
        focusable_child = <vmenu_id>
    }
    CreateScreenElement {
        type = VMenu
        parent = <menu_id>
        id = <vmenu_id>
        font = small
        just = [ center center ]
        pos = <pos>
        padding_scale = 0
        dims = (1.0, 1.0)
        internal_just = [ center center ]
        event_handlers = [
            {pad_up spin_the_menu params = { up }}
            {pad_down spin_the_menu params = { down }}
        ]
    }
    AssignAlias id = <menu_id> alias = current_menu_anchor
    AssignAlias id = <vmenu_id> alias = current_menu
    build_roundbar <...> 
endscript

spin_menu_item_index = 0

script make_spin_menu_item pad_choose_script = null_script active = 1
    Theme_GetUnhighlightedTextColor return_value = text_color
    if (<active> = 1)
        <rgba> = spin_menu_unhighlighted_text
    else
        <rgba> = spin_menu_disabled_text
    endif
    CreateScreenElement {
        type = ContainerElement
        parent = current_menu
        id = <id>
        just = [ center center ]
        internal_just = [ center center ]
        event_handlers = [
            {focus spin_menu_item_focus params = <focus_params>}
            { unfocus spin_menu_item_unfocus }
            { pad_start spin_menu_mark_selected }
            { pad_choose spin_menu_mark_selected }
            {pad_start <pad_choose_script> params = <pad_choose_params>}
            {pad_choose <pad_choose_script> params = <pad_choose_params>}
        ]
        dims = (1.0, 1.0)
        tags = {tag_grid_x = (spin_menu_item_index)}
    }
    <container_id> = <id>
    change spin_menu_item_index = (spin_menu_item_index + 1)
    if GotParam blank
        SetScreenElementProps {
            id = <container_id>
            tags = { blank }
        }
        CreateScreenElement {
            type = SpriteElement
            parent = <container_id>
            texture = goal_complete_line
            pos = (90.0, 5.0)
            scale = 1
            rgba = [20 , 40 , 40 , 70]
            just = [ left center ]
            z_priority = 1
        }
    else
        if GotParam text2
            pos1 = (0.0, -8.0)
            pos2 = (0.0, 8.0)
        else
            pos1 = (0.0, 0.0)
        endif
        CreateScreenElement {
            type = TextElement
            parent = <container_id>
            font = small
            text = <text1>
            rgba = <rgba>
            just = [ left top ]
            internal_just = [ left center ]
            pos = <pos1>
            z_priority = 1
        }
        if GotParam text2
            CreateScreenElement {
                type = TextElement
                parent = <container_id>
                font = small
                text = <text2>
                rgba = <rgba>
                just = [ left top ]
                internal_just = [ left center ]
                pos = <pos2>
                z_priority = 1
            }
        endif
    endif
    SetScreenElementProps {
        id = <container_id>
        rot_angle = (spin_menu_angles [ spin_menu_angle_index ])
        tags = {
            active = <active>
            helper_text = <helper_text>
            highlight_text = <highlight_text>
            icon = <icon>
        }
    }
    change spin_menu_angle_index = (spin_menu_angle_index + 1)
    if GotParam mark_first_input
        SetScreenElementProps {
            id = <container_id>
            event_handlers = [
                { pad_choose mark_first_input_received }
                { pad_start mark_first_input_received }
            ]
        }
    endif
endscript


script build_roundbar 
    Theme_GetPauseBarColor return_value = bar_color
    <pos> = (<pos> + (60.0, -3.0))
    CreateScreenElement {
        type = ContainerElement
        parent = current_menu_anchor
        id = roundbar_bar
        pos = <pos>
        just = [ left center ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = roundbar_bar
        id = roundbar_left
        pos = (0.0, 0.0)
        just = [ left top ]
        scale = 1
        texture = roundbar_tip_left
        z_priority = 2
        rgba = <bar_color>
    }
    CreateScreenElement {
        type = SpriteElement
        parent = roundbar_bar
        id = roundbar_middle
        pos = (32.0, 0.0)
        just = [ left top ]
        scale = (1.0, 1.0)
        texture = roundbar_middle
        z_priority = 2
        rgba = <bar_color>
    }
    CreateScreenElement {
        type = SpriteElement
        parent = roundbar_bar
        id = roundbar_right
        pos = (64.0, 0.0)
        just = [ left top ]
        scale = 1
        texture = roundbar_tip_right
        z_priority = 2
        rgba = <bar_color>
    }
    CreateScreenElement {
        type = SpriteElement
        parent = roundbar_bar
        id = roundbar_accent
        texture = roundbar_highlight
        pos = (32.0, 15.0)
        rgba = <bar_color>
        just = [ center center ]
        scale = (2.75, 1.0)
        z_priority = 3
        alpha = 0
    }
    CreateScreenElement {
        type = TextElement
        parent = roundbar_bar
        id = roundbar_text
        pos = (20.0, 0.0)
        just = [ left top ]
        text = ''
        font = small
        scale = (1.5, 1.5)
        z_priority = 4
        rgba = [0 , 0 , 0 , 128]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = roundbar_bar
        id = roundbar_icon
        pos = (0.0, 0.0)
        texture = white2
        scale = 0.6000
        rgba = [128 , 128 , 128 , 128]
        just = [ left top ]
        z_priority = 4
    }
endscript


script spin_menu_item_focus 
    GetTags
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
                current_menu ::GetTags
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
    DoScreenElementMorph id = roundbar_middle scale = <bar_mid_width_scale> time = 0
    SetScreenElementProps {
        id = roundbar_right
        pos = <bar_right_pos>
    }
    <icon_pos> = (((1.0, 0.0) * (<width> + 26))+ ((0.0, 1.0) * 3))
    SetScreenElementProps {
        id = roundbar_icon
        texture = <icon>
        pos = <icon_pos>
    }
    KillSpawnedScript name = do_roundbar_highlight_accent
    RunScriptOnScreenElement id = roundbar_accent do_roundbar_highlight_accent params = {right = (<bar_mid_width> + 20)}
endscript


script do_roundbar_highlight_accent 
    GetTags
    SetScreenElementProps {
        id = <id>
        pos = (32.0, 15.0)
        z_priority = 5
    }
    DoScreenElementMorph id = <id> scale = (2.75, 1.0) time = 0
    DoScreenElementMorph id = <id> alpha = 1 time = 0
    <pos> = (((1.0, 0.0) * <right>)+ ((0.0, 1.0) * 15))
    DoScreenElementMorph id = <id> pos = <pos> time = 0.3000
    DoScreenElementMorph id = <id> alpha = 0.2000 time = 0.3000
    wait 0.3000 seconds
    <width> = (<right> - 32)
    <center> = ((<width> / 2)+ 32)
    <pos> = (((1.0, 0.0) * <center>)+ ((0.0, 1.0) * 15))
    SetScreenElementProps {
        id = <id>
        pos = <pos>
        z_priority = 3
    }
    <scale_width> = (<width> / 14.0)
    <scale> = (((1.0, 0.0) * <scale_width>)+ ((0.0, 1.0) * 1.250))
    DoScreenElementMorph id = <id> scale = <scale> time = 0
    begin 
    DoScreenElementMorph id = <id> alpha = 1 time = 0.3000
    wait 0.3000 seconds
    DoScreenElementMorph id = <id> alpha = 0 time = 0.3000
    wait 0.3000 seconds
    repeat 
endscript


script spin_menu_item_unfocus 
    GetTags
    if NOT GotParam blank
        if (<active> = 1)
            DoScreenElementMorph id = {<id> child = 0}alpha = 1 time = spin_menu_spin_time
            if ScreenElementExists id = {<id> child = 1}
                DoScreenElementMorph id = {<id> child = 1}alpha = 1 time = spin_menu_spin_time
            endif
        endif
    endif
endscript

spin_menu_input_enabled = 1

script spin_menu_input_timer 
    SetScreenElementProps {
        id = current_menu
        disable_pad_handling
    }
    change spin_menu_input_enabled = 0
    wait spin_menu_spin_time seconds
    change spin_menu_input_enabled = 1
    SetScreenElementProps {
        id = current_menu
        enable_pad_handling
    }
endscript


script spin_menu__reset_input_timer 
    KillSpawnedScript name = spin_menu_input_timer
    change spin_menu_input_enabled = 1
    SetScreenElementProps {
        id = current_menu
        enable_pad_handling
    }
endscript


script spin_the_menu 
    if ((spin_menu_input_enabled = 1)|| (spin_menu_auto_spin = 1))
        if GotParam down
            <diff> = -22.50
            change spin_menu_dir = -1
        else
            <diff> = 22.50
            change spin_menu_dir = 1
        endif
        if (spin_menu_cycle = 0)
            current_menu ::GetTags
            GetScreenElementChildren id = current_menu
            GetArraySize <children>
            if (<tag_selected_index> = 0 & GotParam up)
                return 
            endif
            if (<tag_selected_index> = (<array_size> - 0)& GotParam down)
                return 
            endif
            if (<tag_selected_index> = (<array_size> - 1)& GotParam down)
                return 
            endif
            if (<tag_selected_index> = (<array_size> - 0)& GotParam up)
                return 
            endif
        endif
        change spin_menu_angle = (spin_menu_angle + <diff>)
        SpawnScript spin_menu_input_timer
        DoScreenElementMorph id = current_menu rot_angle = spin_menu_angle time = spin_menu_spin_time
        spin_menu_spin_geometry rot_angle = spin_menu_angle
        MakeSkaterGoto SpinMenuSkaterAction params = <...> 
        pulse_blur speed = 4 start = 180
    endif
endscript


script spin_menu_spin_geometry spin_time = spin_menu_spin_time
    if NOT GotParam no_wait
        wait 2 gameframes
    endif
    <angle> = ((0.0, 0.0, 1.0) * <rot_angle>)
    wol_inner_ring ::Obj_Rotate absolute = <angle> time = <spin_time>
    wol_inner_star ::Obj_Rotate absolute = <angle> time = <spin_time>
    wol_tag ::Obj_Rotate absolute = <angle> time = <spin_time>
    wol_outer_ring ::Obj_Rotate absolute = <angle> time = <spin_time>
    <index> = 1
    begin 
    FormatText ChecksumName = model_id 'wol_pie_%i' i = <index>
    <model_id> ::Obj_Rotate absolute = <angle> time = <spin_time>
    <index> = (<index> + 1)
    repeat 16
    <index> = 1
    begin 
    FormatText ChecksumName = model_id 'wol_lightbulb_%i' i = <index>
    <model_id> ::Obj_Rotate absolute = <angle> time = <spin_time>
    <index> = (<index> + 1)
    repeat 28
endscript


script spin_menu_visible on = 1
    if (<on>)
        <action> = unhide
    else
        <action> = hide
    endif
    wol_inner_ring ::<action>
    wol_inner_star ::<action>
    wol_tag ::<action>
    wol_outer_ring ::<action>
    <index> = 1
    begin 
    FormatText ChecksumName = model_id 'wol_pie_%i' i = <index>
    <model_id> ::<action>
    <index> = (<index> + 1)
    repeat 16
    <index> = 1
    begin 
    FormatText ChecksumName = model_id 'wol_lightbulb_%i' i = <index>
    <model_id> ::<action>
    <index> = (<index> + 1)
    repeat 28
endscript


script draw_menu_background 
    CreateScreenElement {
        type = ContainerElement
        parent = current_menu_anchor
        id = arrow_sign_container
        pos = (0.0, 0.0)
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
        <drip_pos> = (580.0, 70.0)
        <drip_rgba> = [ 126 49 3 120 ]
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
        if Checksumequals a = <the_logo> b = wdt_logo_big_2
            <logo_rgba> = [ 0 0 0 128 ]
            <logo_scale> = (2.5, 1.5)
            <logo_pos> = (535.0, 155.0)
            <logo_angle> = -34
        else
            <logo_pos> = (610.0, 195.0)
            <logo_scale> = 0.8000
            <logo_rgba> = [ 128 128 128 128 ]
            <logo_angle> = 0
        endif
        CreateScreenElement {
            type = SpriteElement
            parent = arrow_sign_container
            id = sign
            texture = menu_sign
            pos = <sign_pos>
            just = [ right top ]
            rgba = [ 128 128 128 128 ]
            z_priority = -1
            rot_angle = -10
            scale = 1.700
        }
        CreateScreenElement {
            type = SpriteElement
            parent = arrow_sign_container
            id = wdt_logo
            texture = <the_logo>
            pos = <logo_pos>
            just = [ right top ]
            rgba = <logo_rgba>
            z_priority = 0
            scale = <logo_scale>
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
        <drip_pos> = (295.0, 42.0)
        <drip_rgba> = [ 126 49 3 108 ]
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
    FormatText ChecksumName = spray_text_name 'new_icon_%i' i = Random (@ 1 @ 2 @ 3 @ 4 @ 5 @ 6 @ 7 @ 8 @ 9 @ 10)
    <spray_text> = <spray_text_name>
    <circle_rot> = 0
    <circle_pos> = (0.0, 70.0)
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        id = bg
        texture = <bg_text>
        rot_angle = <bg_angle>
        pos = <bg_pos>
        scale = <bg_scale>
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
        pos = <arrow_pos>
        scale = <arrow_scale>
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
        pos = <drip_pos>
        scale = <drip_scale>
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
        pos = <spray_pos>
        scale = <spray_scale>
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
        pos = <circle_pos>
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
            RunScriptOnScreenElement id = arrow_sign_container slide_in params = { right orig_pos = (0.0, 0.0) }
            RunScriptOnScreenElement id = drip paint_dripping
            RunScriptOnScreenElement id = wdt_logo do_random_effect params = { orig_rot = <logo_angle> }
        else
            RunScriptOnScreenElement id = arrow_sign_container slide_in params = {some_wait top orig_pos = (0.0, 0.0)}
            RunScriptOnScreenElement id = drip paint_dripping params = { some_wait }
        endif
    else
        RunScriptOnScreenElement id = arrow_sign_container slide_in params = {some_wait right orig_pos = (0.0, 0.0)}
        RunScriptOnScreenElement id = drip paint_twitch params = { orig_rot = <drip_angle> }
    endif
endscript


script icon_drop orig_pos = (0.0, 0.0)
    begin 
    spray_icon ::DoMorph time = 0 pos = (<orig_pos> + (0.0, -150.0))
    spray_icon ::DoMorph time = 0.1500 pos = <orig_pos>
    wait 0.1500 seconds
    begin 
    spray_icon ::DoMorph time = 0.01000 rot_angle = <orig_rot> alpha = 1 pos = <orig_pos>
    ran_xjump = Random (@ (-3.0, 0.0) @ (-2.0, 0.0) @ (-1.0, 0.0) @ (0.0, 0.0) @ (1.0, 0.0) @ (2.0, 0.0) @ (3.0, 0.0))
    ran_yjump = Random (@ (0.0, -3.0) @ (0.0, -2.0) @ (0.0, -1.0) @ (0.0, 0.0) @ (0.0, 1.0) @ (2.0, 0.0) @ (3.0, 0.0))
    add_angle = Random (@ -6 @ -4 @ -2 @ 0 @ 2 @ 4 @ 6)
    ran_time = Random (@ 0.02000 @ 0.03000 @ 0.04000 @ 0.05000 @ 0.06000)
    ran_alpha = Random (@ 0.4000 @ 0.6000 @ 0.8000 @ 1)
    spray_icon ::DoMorph time = <ran_time> alpha = <ran_alpha> rot_angle = (<orig_rot> + <add_angle>)pos = (<orig_pos> + <ran_xjump> + <ran_yjump>)
    wait 0.04000
    repeat Random (@ 20 @ 25 @ 30)
    spray_icon ::DoMorph time = 0 pos = <orig_pos>
    spray_icon ::DoMorph time = 0.2000 pos = (<orig_pos> + (-500.0, 0.0))
    wait Random (@ 1 @ 2 @ 3 @ 4) seconds
    DestroyScreenElement id = spray_icon
    FormatText ChecksumName = spray_text_name 'new_icon_%i' i = Random (@ 1 @ 2 @ 3 @ 4 @ 5 @ 6 @ 7 @ 8 @ 9 @ 10)
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        id = spray_icon
        texture = <spray_text_name>
        rot_angle = <orig_rot>
        pos = <orig_pos>
        scale = <orig_scale>
        <orig_flip>
        z_priority = <orig_z>
        rgba = <orig_rgba>
    }
    repeat 
endscript


script paint_dripping 
    if GotParam some_wait
        add_time = 0.2000
    else
        add_time = 0
    endif
    wait <add_time> seconds
    DoMorph time = 0 scale = (1.0, 0.20000000298023224)
    DoMorph time = 2 scale = (1.0, 2.0)
endscript


script slide_in orig_pos = (200.0, 200.0)
    if GotParam some_wait
        add_time = 0.2000
    else
        add_time = 0
    endif
    if GotParam right
        DoMorph time = 0 pos = (<orig_pos> + (400.0, 0.0))
        wait <add_time> seconds
        DoMorph time = 0.2000 pos = <orig_pos>
    endif
    if GotParam top
        top_location = Random (@ (-100.0, 0.0) @ (-50.0, 0.0) @ (0.0, 0.0) @ (50.0, 0.0) @ (100.0, 0.0))
        DoMorph time = 0 pos = (<orig_pos> - (0.0, 100.0) + <top_location>)
        wait <add_time> seconds
        DoMorph time = 0.2000 pos = (<orig_pos> + <top_location>)
    endif
endscript


script circle_rotation 
    end_pos = (<orig_pos> + Random (@ (100.0, 0.0) @ (150.0, 0.0) @ (200.0, 0.0) @ (250.0, 0.0) @ (300.0, 0.0) @ (350.0, 0.0)))
    DoMorph time = 0 rot_angle = 0 pos = (<end_pos> - (500.0, 0.0))
    wait Random (@ 3 @ 4 @ 5) seconds
    DoMorph time = 1 rot_angle = 1800 pos = <end_pos>
    wait Random (@ 2 @ 3 @ 4 @ 5 @ 6) seconds
    DoMorph time = 0 rot_angle = 1800
    DoMorph time = 0.2000 rot_angle = 720
    DoMorph time = 0 pos = <end_pos>
    DoMorph time = 0.2000 pos = (<end_pos> + (1000.0, 0.0))
endscript


script paint_twitch 
    begin 
    DoMorph time = 0 rot_angle = <orig_rot>
    add_angle = Random (@ -3 @ -2 @ -1 @ 0 @ 1 @ 2 @ 3)
    ran_time = Random (@ 0.06000 @ 0.07000 @ 0.08000 @ 0.09000 @ 0.1000 @ 0.1200 @ 0.5000)
    DoMorph time = <ran_time> rot_angle = (<orig_rot> + <add_angle>)
    repeat 
endscript

