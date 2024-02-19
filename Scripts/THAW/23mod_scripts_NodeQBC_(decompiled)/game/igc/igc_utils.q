igc_custom_camera_name = custom_igc_cam

script PlayIGCCamScene 
    hide_all_hud_sprites
    PlayIGCCam {
        <...> 
        name = (igc_custom_camera_name)
        exitscript = show_all_hud_sprites
        allow_pause = 1
    }
endscript

script PlayIGCCamSceneWithHUD 
    PlayIGCCam {
        <...> 
        allow_pause = 1
    }
endscript

script PlayIGCScene 
    kill_start_key_binding
    SetSearchAllMangles
    StartDelaySystemUI
    igc_player_run {
        <...> 
        gameside_tags = {
            goal_id = <goal_id>
        }
        gameside_callbacks = {
            setup = igc_generic_setup
            cleanup = igc_generic_cleanup
            play_text = igc_utils_create_text
            stop_text = igc_utils_kill_text
        }
    }
    StopDelaySystemUI
    SetSearchAllMangles \{ Off }
    restore_start_key_binding
endscript

script igc_ped_head_format 
    if GotParam FormatWithZoneName
        if GotParam global
            FormatText textname = part_name '%z_%n' z = 'Global' n = <part_name>
        else
            if GotParam mission
                FormatText textname = part_name '%z_%n' z = (g_goal_current_pak_short_name)n = <part_name>
            else
                if GotParam m
                    FormatText textname = part_name 'm_%n' n = <part_name>
                else
                    GetLevelStructureName
                    FormatText textname = part_name '%z_%n' z = (<level_structure_name>.level)n = <part_name>
                endif
            endif
        endif
    endif
    return formatted_part_name = <part_name>
endscript

script igc_ped_head_on 
    FormatText checksumname = part <part_name>
    switchonatomic <part>
    igc_ped_head_format <...> 
    FormatText checksumname = part <formatted_part_name>
    switchonatomic <part>
    igc_ped_head_format mission <...> 
    FormatText checksumname = part <formatted_part_name>
    switchonatomic <part>
    igc_ped_head_format m <...> 
    FormatText checksumname = part <formatted_part_name>
    switchonatomic <part>
    igc_ped_head_format global <...> 
    FormatText checksumname = part <formatted_part_name>
    switchonatomic <part>
endscript

script igc_ped_head_off 
    FormatText checksumname = part <part_name>
    switchoffatomic <part>
    igc_ped_head_format <...> 
    FormatText checksumname = part <formatted_part_name>
    switchoffatomic <part>
    igc_ped_head_format mission <...> 
    FormatText checksumname = part <formatted_part_name>
    switchoffatomic <part>
    igc_ped_head_format m <...> 
    FormatText checksumname = part <formatted_part_name>
    switchoffatomic <part>
    igc_ped_head_format global <...> 
    FormatText checksumname = part <formatted_part_name>
    switchoffatomic <part>
endscript

script igc_generic_setup 
    hide_all_hud_sprites
    FlushPedsFromHeap \{ heap = GoalHeap }
    if NOT InNetGame
        GetValueFromVolume \{ cdvol }
        if (<value> > 1)
            igc_anchor ::settags original_music_volume = (<value> * 10)
            SetMusicVolume \{ 10 }
        endif
    endif
    if igc_anchor ::getsingletag \{ passive_setup }
        skater ::Pause
    else
        fake_letterboxing
        if ChecksumEquals a = (last_screen_mode)b = standard_screen_mode
            igc_goal_extras
        endif
        freeze_skater_for_cinematic
    endif
    GoalManager_PauseAllGoals
endscript

script igc_generic_cleanup 
    StopAnimSave
    show_all_hud_sprites
    if ScreenElementExists \{ id = igc_anchor }
        if igc_anchor ::getsingletag \{ passive_setup }
            skater ::UnPause
        else
            fake_letterboxing \{ remove }
            unfreeze_skater_after_cinematic
        endif
        if igc_anchor ::getsingletag \{ original_music_volume }
            SetMusicVolume <original_music_volume>
        endif
    endif
    GoalManager_UnPauseAllGoals
endscript

script Ped_Utils_SetupIGCSpeech \{ inner_radius = 8 outer_radius = 40 activation_script = igc_speech_accept }
    ClearEventHandler \{ anyobjectinradius }
    ClearEventHandler \{ objectoutofradius }
    obj_setinnerradius <inner_radius>
    seteventhandler Ex = anyobjectinradius scr = ped_speech_got_trigger params = { <...> activation_script_params = <...>  }
endscript

script freeze_skater_for_cinematic 
    if skater ::walking
        MakeSkaterGoto \{SkaterInit params = { walk }}
    else
        MakeSkaterGoto \{ SkaterInit }
        if NOT skater ::IsSkaterOnBike
            MakeSkaterGoto \{ HandBrake }
        endif
    endif
    skater ::switchoffatomic \{ board }
    skater ::PausePhysics
    skater ::disableplayerinput
    skater ::SkaterLoopingSound_TurnOff
    GlobalEffects_ClearState \{ id = pulse_bloom }
    KillSpawnedScript \{ name = PulseBloom_Spawned }
    KillSpawnedScript \{ name = EndBloom_Spawned }
endscript

script igc_skater_setidle 
    MakeSkaterGoto \{ NullScript }
endscript

script igc_skater_restore 
    if skater ::walking
        MakeSkaterGoto \{SkaterInit params = { walk }}
    else
        MakeSkaterGoto \{ SkaterInit }
    endif
    if CompositeObjectExists \{ skatercam0 }
        skatercam0 ::SC_MarkInstantUpdate
    endif
endscript

script unfreeze_skater_after_cinematic 
    if skater ::IsSkaterOnBike
    else
        skater ::switchonatomic \{ board }
    endif
    skater ::UnPausePhysics
    skater ::enableplayerinput
    skater ::input_debounce \{ x }
    if NOT skater ::walking
        skater ::SkaterLoopingSound_TurnOn
    endif
endscript

script fadetoblack time = 0.5000 alpha = 0.5000 z_priority = 9000 rgba = [ 0 0 0 128 ] Scale = (300.0, 200.0) texture = black id = screenfader Pos = (320.0, 240.0) parent = root_window
    if GotParam on
        if NOT ScreenElementExists id = <id>
            SetScreenElementLock Off id = <parent>
            if NOT GotParam create_script
                CreateScreenElement {
                    type = SpriteElement
                    parent = <parent>
                    id = <id>
                    texture = <texture>
                    Pos = <Pos>
                    rgba = <rgba>
                    just = [ center center ]
                    Scale = <Scale>
                    alpha = 0
                    z_priority = <z_priority>
                    no_zwrite
                }
            else
                <create_script>
            endif
        else
            TerminateObjectsScripts id = <id>
            <id> ::removetags [ waiting_to_die ]
        endif
        DoScreenElementMorph id = <id> time = <time> alpha = <alpha>
    endif
    if GotParam Off
        if ScreenElementExists id = <id>
            DoScreenElementMorph id = <id> time = <time> alpha = 0
            if GotParam no_wait
                RunScriptOnScreenElement id = <id> fadetoblack_wait_and_die params = { time = <time> }
            else
                <id> ::settags waiting_to_die
                if (<time> > 0.0)
                    printf 'waiting'
                    wait <time> seconds
                endif
                if ScreenElementExists id = <id>
                    if <id> ::getsingletag waiting_to_die
                        DestroyScreenElement id = <id>
                    endif
                endif
            endif
        endif
    endif
endscript

script fadetoblack_wait_and_die 
    if GotParam \{ time }
        wait <time> seconds
    endif
    Die
endscript

script igc_speech_accept 
    UnpauseSkaters
    PlayIGCScene <scene>
    if ObjectExists id = <ped_id>
        <ped_id> ::PedLogic_ResetEventHandlers
        <ped_id> ::PedLogic_SetDefaultState
    endif
endscript

script igc_skater_orient 
    if walking
        obj_setorientation Quat = <Quat>
    else
        SetOrientation Quat = <Quat>
    endif
endscript

script igc_skater_rotate 
    if walking
        obj_rotate relative = <relative>
    else
        rotate x = (<relative>.(1.0, 0.0, 0.0))
        rotate y = (<relative>.(0.0, 1.0, 0.0))
        rotate z = (<relative>.(0.0, 0.0, 1.0))
    endif
endscript

script igc_ped_create 
    Create name = <name>
    <name> ::Obj_ForceUpdate
endscript

script igc_ped_setidle 
    obj_getid
    Ped_SetLogicState \{ STATE_PASSIVE_STAND }
    PedLogic_ClearAllEventHandlers
    disassociatefromobject
    TerminateObjectsScripts id = <ObjID>
endscript

script igc_ped_setdefault 
    if GotParam \{ name }
        <name> ::igc_ped_reset
    else
        igc_ped_reset
    endif
endscript

script igc_ped_reset 
    PedLogic_SetDefaultState
    igc_ped_switch_board \{ Scale = 1 }
endscript

script igc_fadeout \{ time = 0.7500 }
    fadetoblack on alpha = 1.0 time = <time>
    wait (<time> + 0.1000)seconds
endscript

script igc_fadeout_fast 
    fadetoblack \{ on alpha = 1.0 time = 0.0 }
endscript

script igc_fadein_fast 
    fadetoblack \{ Off time = 0.0 }
endscript

script igc_fadein \{ time = 0.7500 }
    fadetoblack Off time = <time> no_wait
endscript

script igc_ped_walk_in x = 0 y = 0 z = -150 anim = Ped_M_Walk2
    Ped_SetLogicState STATE_PASSIVE
    obj_getposition
    Obj_GetQuat
    RotateVector Quat = <Quat> x = <x> y = <y> z = <z>
    newpos = ((<x> * (1.0, 0.0, 0.0))+ (<y> * (0.0, 1.0, 0.0))+ (<z> * (0.0, 0.0, 1.0))+ <Pos>)
    obj_setposition position = <newpos>
    igc_ped_switch_board Scale = 0
    Ped_PlayAnim anim = <anim> Cycle
    Ped_MoveToPos <Pos> Speed = 7
    obj_lookatpos <Pos> instant
    Ped_WaitMove
    Ped_SetLogicState STATE_PASSIVE_STAND
endscript

script igc_ped_switch_board Scale = 0
    if (<Scale> = 0)
        if getsingletag igc_board_hidden
            return 
        endif
        settags igc_board_hidden
    else
        if NOT getsingletag igc_board_hidden
            return 
        endif
        removetags [ igc_board_hidden ]
    endif
    bones = [
        Bone_Board_Root
        Bone_Board_Nose
        Bone_Trucks_Nose
        Bone_Board_Tail
        Bone_Trucks_Tail
    ]
    GetArraySize bones
    i = 0
    begin 
    obj_setbonescale bone = (<bones> [ <i> ])Scale = <Scale> propogate
    i = (<i> + 1)
    repeat <array_size>
endscript

script igc_walk_out \{ x = 0 y = 0 z = -150 movement = walk_slow }
    obj_getposition
    Obj_GetQuat
    RotateVector x = <x> y = <y> z = <z> Quat = <Quat>
    Pos = ((<x> * (1.0, 0.0, 0.0))+ (<y> * (0.0, 1.0, 0.0))+ (<z> * (0.0, 0.0, 1.0))+ <Pos>)
endscript

script igc_ped_playlookatanim 
    Ped_PlayAnim {
        <...> 
        tree = Ped_AnimBranch_LookAt
    }
endscript

script igc_changelookat_skater 
    if IsSkaterOnBike
        return 
    endif
    igc_changelookat_generic <...> 
endscript

script igc_changelookat_generic 
    if getsingletag \{ Replay_Actor }
        return 
    endif
    anim_command {
        target = LookAtController
        command = differencelookat_settarget
        params = {
            target = <lookat_target>
        }
    }
endscript
igc_lookat_defaultanims = [
    {
        a = { anim = Ped_M_LookUp_D max_strength = 1.500 max_apply = 0.8000 }
        b = { anim = Ped_M_LookDown_D max_strength = 1.500 max_apply = 0.8000 }
        reference = (0.0, 0.0, 1.0)
        axis = (0.0, 1.0, 0.0)
        max_angle = 1.0
        speed_fast = 8.0
        speed_slow = 1.500
        max_lerp = 0.9000
    }
    {
        a = { anim = Ped_M_LookLeft_D max_strength = 1.100 max_apply = 0.8000 }
        b = { anim = Ped_M_LookRight_D max_strength = 1.100 max_apply = 0.8000 }
        reference = (0.0, 0.0, 1.0)
        axis = (1.0, 0.0, 0.0)
        max_angle = 1.550
        speed_fast = 6.0
        speed_slow = 2.0
        max_lerp = 0.8500
    }
]

script igc_utils_create_text 
    if igc_anchor ::getsingletag goal_id
        if ShouldReplaceTrickText name = <goal_id>
            igc_printf 'replacing trick text for goal \'%g\'' g = <goal_id>
            ReplaceTrickText name = <goal_id> text = <text>
            RemoveParameter text
            <text> = <TrickText>
        endif
    endif
    Scale = 0.8000
    create_panel_block {
        parent = igc_anchor
        id = IGC_current_dialog
        font_face = small
        Scale = (0.800000011920929, 0.800000011920929)
        Pos = (320.0, 410.0)
        line_spacing = <Scale>
        dims = ((590.0, 0.0) / <Scale>)
        rgba = [ 128 128 128 128 ]
        text = <text>
        just = [ center center ]
        internal_just = [ center center ]
        z_priority = 1000
        hold
    }
endscript

script igc_utils_kill_text 
    kill_panel_message_if_it_exists \{ id = IGC_current_dialog }
endscript

script igc_goal_extras 
    SetScreenElementLock id = igc_anchor Off
    CreateScreenElement {
        type = ContainerElement
        id = igc_goal_hud_extras
        parent = igc_anchor
        z_priority = 999
        just = [ center center ]
        internal_just = [ left top ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = igc_goal_hud_extras
        texture = white2
        Scale = (80.0, 8.0)
        Pos = (0.0, -5.0)
        rgba = [ 0 0 0 128 ]
        just = [ left top ]
        z_priority = 500
    }
    CreateScreenElement {
        type = SpriteElement
        parent = igc_goal_hud_extras
        texture = white2
        Scale = (80.0, 8.0)
        Pos = (0.0, 390.0)
        rgba = [ 0 0 0 128 ]
        just = [ left top ]
        z_priority = 500
    }
    CreateScreenElement {
        type = SpriteElement
        parent = igc_goal_hud_extras
        texture = de_b_m
        Scale = (1.600000023841858, 1.600000023841858)
        Pos = (0.0, 0.0)
        rgba = [ 128 128 128 108 ]
        just = [ left top ]
        z_priority = 510
    }
    CreateScreenElement {
        type = SpriteElement
        parent = igc_goal_hud_extras
        texture = de_b_m
        Scale = (1.600000023841858, 1.600000023841858)
        Pos = (100.0, 0.0)
        rgba = [ 128 128 128 108 ]
        just = [ left top ]
        z_priority = 511
    }
    CreateScreenElement {
        type = SpriteElement
        parent = igc_goal_hud_extras
        texture = de_b_m
        Scale = (1.600000023841858, 1.600000023841858)
        Pos = (200.0, 0.0)
        rgba = [ 128 128 128 108 ]
        just = [ left top ]
        z_priority = 512
    }
    CreateScreenElement {
        type = SpriteElement
        parent = igc_goal_hud_extras
        texture = de_b_m
        Scale = (1.600000023841858, 1.600000023841858)
        Pos = (300.0, 0.0)
        rgba = [ 128 128 128 108 ]
        just = [ left top ]
        z_priority = 513
    }
    CreateScreenElement {
        type = SpriteElement
        parent = igc_goal_hud_extras
        texture = de_t_m
        Scale = (1.600000023841858, 1.600000023841858)
        Pos = (400.0, 0.0)
        rgba = [ 128 128 128 108 ]
        just = [ left top ]
        z_priority = 514
        flip_h
    }
    CreateScreenElement {
        type = SpriteElement
        parent = igc_goal_hud_extras
        texture = de_t_m
        Scale = (1.600000023841858, 1.600000023841858)
        Pos = (600.0, 52.0)
        rgba = [ 128 128 128 108 ]
        just = [ left top ]
        z_priority = 514
        rot_angle = 180
    }
    CreateScreenElement {
        type = SpriteElement
        parent = igc_goal_hud_extras
        texture = de_t_r
        Scale = (1.600000023841858, 1.600000023841858)
        Pos = (670.0, 52.0)
        rgba = [ 128 128 128 108 ]
        just = [ left top ]
        z_priority = 515
        flip_v
        rot_angle = 180
    }
    CreateScreenElement {
        type = SpriteElement
        parent = igc_goal_hud_extras
        texture = white2
        Scale = (100.0, 0.30000001192092896)
        Pos = (0.0, 54.0)
        rgba = [ 63 10 110 128 ]
        just = [ left top ]
        z_priority = 516
    }
    CreateScreenElement {
        type = SpriteElement
        parent = igc_goal_hud_extras
        texture = white2
        Scale = (100.0, 0.30000001192092896)
        Pos = (0.0, 392.0)
        rgba = [ 63 10 110 128 ]
        just = [ left top ]
        z_priority = 516
    }
    CreateScreenElement {
        type = SpriteElement
        parent = igc_goal_hud_extras
        texture = hud_comp_goal
        Scale = (1.0, 1.0)
        Pos = (0.0, 20.0)
        rgba = [ 128 128 128 28 ]
        just = [ left top ]
        z_priority = 516
        rot_angle = -10
    }
    CreateScreenElement {
        type = SpriteElement
        parent = igc_goal_hud_extras
        texture = hud_comp_goal
        Scale = (1.2000000476837158, 1.2000000476837158)
        Pos = (35.0, 15.0)
        rgba = [ 128 128 128 28 ]
        just = [ left top ]
        z_priority = 516
        rot_angle = 2
    }
    CreateScreenElement {
        type = SpriteElement
        parent = igc_goal_hud_extras
        texture = hud_comp_goal
        Scale = (1.0, 1.0)
        Pos = (65.0, 20.0)
        rgba = [ 128 128 128 28 ]
        just = [ left top ]
        z_priority = 516
        rot_angle = -10
    }
    CreateScreenElement {
        type = SpriteElement
        parent = igc_goal_hud_extras
        texture = hud_comp_goal
        Scale = (1.2000000476837158, 1.2000000476837158)
        Pos = (95.0, 15.0)
        rgba = [ 128 128 128 28 ]
        just = [ left top ]
        z_priority = 516
        rot_angle = 4
    }
    CreateScreenElement {
        type = SpriteElement
        parent = igc_goal_hud_extras
        texture = hud_comp_goal
        Scale = (0.8999999761581421, 0.8999999761581421)
        Pos = (125.0, 25.0)
        rgba = [ 128 128 128 28 ]
        just = [ left top ]
        z_priority = 516
        rot_angle = -15
    }
    CreateScreenElement {
        type = SpriteElement
        parent = igc_goal_hud_extras
        texture = hud_comp_goal
        Scale = (1.2000000476837158, 1.2000000476837158)
        Pos = (155.0, 15.0)
        rgba = [ 128 128 128 28 ]
        just = [ left top ]
        z_priority = 516
        rot_angle = 9
    }
    CreateScreenElement {
        type = SpriteElement
        parent = igc_goal_hud_extras
        texture = hud_comp_goal
        Scale = (0.8999999761581421, 0.8999999761581421)
        Pos = (185.0, 30.0)
        rgba = [ 128 128 128 28 ]
        just = [ left top ]
        z_priority = 516
        rot_angle = -25
    }
    CreateScreenElement {
        type = SpriteElement
        parent = igc_goal_hud_extras
        texture = hud_comp_goal
        Scale = (1.2000000476837158, 1.2000000476837158)
        Pos = (225.0, 10.0)
        rgba = [ 128 128 128 28 ]
        just = [ left top ]
        z_priority = 516
        rot_angle = 10
    }
    CreateScreenElement {
        type = SpriteElement
        parent = igc_goal_hud_extras
        texture = hud_comp_goal
        Scale = (0.8999999761581421, 0.8999999761581421)
        Pos = (250.0, 30.0)
        rgba = [ 128 128 128 28 ]
        just = [ left top ]
        z_priority = 516
        rot_angle = -25
    }
    CreateScreenElement {
        type = SpriteElement
        parent = igc_goal_hud_extras
        texture = hud_comp_goal
        Scale = (1.2000000476837158, 1.2000000476837158)
        Pos = (290.0, 10.0)
        rgba = [ 128 128 128 28 ]
        just = [ left top ]
        z_priority = 516
        rot_angle = 25
    }
    CreateScreenElement {
        type = SpriteElement
        parent = igc_goal_hud_extras
        texture = hud_comp_goal
        Scale = (0.8999999761581421, 0.8999999761581421)
        Pos = (315.0, 25.0)
        rgba = [ 128 128 128 28 ]
        just = [ left top ]
        z_priority = 516
        rot_angle = -5
    }
    CreateScreenElement {
        type = SpriteElement
        parent = igc_goal_hud_extras
        texture = hud_comp_goal
        Scale = (1.2000000476837158, 1.2000000476837158)
        Pos = (355.0, 10.0)
        rgba = [ 128 128 128 28 ]
        just = [ left top ]
        z_priority = 516
        rot_angle = 15
    }
    CreateScreenElement {
        type = SpriteElement
        parent = igc_goal_hud_extras
        texture = hud_comp_goal
        Scale = (0.8999999761581421, 0.8999999761581421)
        Pos = (385.0, 32.0)
        rgba = [ 128 128 128 28 ]
        just = [ left top ]
        z_priority = 516
        rot_angle = -35
    }
    CreateScreenElement {
        type = SpriteElement
        parent = igc_goal_hud_extras
        texture = hud_comp_goal
        Scale = (1.2000000476837158, 1.2000000476837158)
        Pos = (425.0, 10.0)
        rgba = [ 128 128 128 28 ]
        just = [ left top ]
        z_priority = 516
        rot_angle = 15
    }
    CreateScreenElement {
        type = SpriteElement
        parent = igc_goal_hud_extras
        texture = hud_comp_goal
        Scale = (0.8999999761581421, 0.8999999761581421)
        Pos = (460.0, 22.0)
        rgba = [ 128 128 128 28 ]
        just = [ left top ]
        z_priority = 516
        rot_angle = 0
    }
    CreateScreenElement {
        type = SpriteElement
        parent = igc_goal_hud_extras
        texture = hud_comp_goal
        Scale = (1.2000000476837158, 1.2000000476837158)
        Pos = (495.0, 10.0)
        rgba = [ 128 128 128 28 ]
        just = [ left top ]
        z_priority = 516
        rot_angle = 25
    }
    CreateScreenElement {
        type = SpriteElement
        parent = igc_goal_hud_extras
        texture = hud_comp_goal
        Scale = (0.8999999761581421, 0.8999999761581421)
        Pos = (525.0, 22.0)
        rgba = [ 128 128 128 28 ]
        just = [ left top ]
        z_priority = 516
        rot_angle = -3
    }
    CreateScreenElement {
        type = SpriteElement
        parent = igc_goal_hud_extras
        texture = hud_comp_goal
        Scale = (1.2000000476837158, 1.2000000476837158)
        Pos = (555.0, 15.0)
        rgba = [ 128 128 128 28 ]
        just = [ left top ]
        z_priority = 516
        rot_angle = 5
    }
    CreateScreenElement {
        type = SpriteElement
        parent = igc_goal_hud_extras
        texture = hud_comp_goal
        Scale = (0.8999999761581421, 0.8999999761581421)
        Pos = (590.0, 22.0)
        rgba = [ 128 128 128 28 ]
        just = [ left top ]
        z_priority = 516
        rot_angle = -3
    }
    CreateScreenElement {
        type = SpriteElement
        parent = igc_goal_hud_extras
        texture = de_t_m
        Scale = (10.600000381469727, 1.600000023841858)
        Pos = (0.0, 390.0)
        rgba = [ 128 128 128 108 ]
        just = [ left top ]
        z_priority = 514
    }
endscript

script igc_skater_question 
    Skater_Playanim \{ BlendPeriod = 0.0 anim = Ped_M_Talk2_Maybe }
    Skater_WaitAnimFinished
endscript

script IGC_Ped_Question 
    Ped_PlayAnim \{ BlendPeriod = 0.0 anim = Ped_M_Talk2_Maybe }
    Ped_WaitAnimFinished
endscript

script IGC_Skater_point 
    Skater_Playanim \{ BlendPeriod = 0.0 anim = Talk_Gesture_02 }
    Skater_WaitAnimFinished
endscript

script IGC_ped_point 
    Ped_PlayAnim \{ BlendPeriod = 0.0 anim = Talk_Gesture_02 }
    Ped_WaitAnimFinished
endscript

script IGC_Skater_point_Behind 
    Skater_Playanim \{ BlendPeriod = 0.0 anim = Talk_Gesture_04 }
    Skater_WaitAnimFinished
endscript

script IGC_ped_point_Behind 
    Ped_PlayAnim \{ BlendPeriod = 0.0 anim = Talk_Gesture_04 }
    Ped_WaitAnimFinished
endscript

script IGC_Skater_point_Right 
    Skater_Playanim \{ BlendPeriod = 0.0 anim = Talk_Gesture_06 }
    Skater_WaitAnimFinished
endscript

script IGC_ped_point_Right 
    Ped_PlayAnim \{ BlendPeriod = 0.0 anim = Talk_Gesture_06 }
    Ped_WaitAnimFinished
endscript

script IGC_Skater_point_Left 
    Skater_Playanim \{ BlendPeriod = 0.0 anim = Talk_Gesture_08 }
    Skater_WaitAnimFinished
endscript

script IGC_ped_point_Left 
    Ped_PlayAnim \{ BlendPeriod = 0.0 anim = Talk_Gesture_08 }
    Ped_WaitAnimFinished
endscript

script IGC_Skater_Wave 
    Skater_Playanim \{ BlendPeriod = 0.0 anim = Ped_M_Wave }
    Skater_WaitAnimFinished
endscript

script IGC_ped_Wave 
    Ped_PlayAnim \{ BlendPeriod = 0.0 anim = Ped_M_Wave }
    Ped_WaitAnimFinished
endscript

script IGC_Skater_Clap 
    Skater_Playanim \{ BlendPeriod = 0.0 anim = Ped_M_Clap }
    Skater_WaitAnimFinished
endscript

script IGC_ped_Clap 
    Ped_PlayAnim \{ BlendPeriod = 0.0 anim = Ped_M_Clap }
    Ped_WaitAnimFinished
endscript

script IGC_Skater_Disgust 
    Skater_Playanim \{ BlendPeriod = 0.0 anim = Ped_M_Disgust }
    Skater_WaitAnimFinished
endscript

script IGC_ped_Disgust 
    Ped_PlayAnim \{ BlendPeriod = 0.0 anim = Ped_M_Disgust }
    Ped_WaitAnimFinished
endscript
