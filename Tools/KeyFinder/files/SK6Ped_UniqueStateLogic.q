
Ped_UniqueStateLogic_DefaultStates = [
    {tag = drummer state = BO_STATE_drummer_drumwalking table = BO_StateLogic_Table}
    {tag = Rollerblader state = BO_STATE_rollerblading table = BO_StateLogic_Table}
    {tag = Paulie state = BO_STATE_Paulie_Waiting table = BO_PaulieLogic_Table}
    {tag = FluteGuy state = NO_STATE_fluteguy table = NO_StateLogic_Table}
    {tag = FluteGuy_playing state = NO_STATE_fluteguy_playing table = NO_StateLogic_Table}
    {tag = Jazzman state = NO_STATE_Jazzman table = NO_StateLogic_Table}
    {tag = Jazzman_playing state = NO_STATE_Jazzman_playing table = NO_StateLogic_Table}
    {tag = F_MardisGras_Dance state = NO_STATE_F_MardisGras_Dance table = NO_MardisGras_F_Table}
    {tag = Griller state = BE_STATE_Griller table = BE_GrillerLogic_Table}
    {tag = DJ state = BE_STATE_DJ table = BE_StateLogic_Table}
    {tag = Forklift state = BE_STATE_Forklift table = BE_StateLogic_Table}
    {tag = BE_Cop_Chase state = BE_STATE_Cop_Chase table = BE_CopLogic_Table}
    {tag = BE_Cop_Standing state = BE_STATE_Cop_Standing table = BE_CopLogic_Table}
    {tag = BE_Cop_Direct state = BE_STATE_Cop_Direct table = BE_CopLogic_Table}
    {tag = BE_Cop_OnFire state = BE_STATE_Cop_OnFire table = BE_CopLogic_Table}
    {tag = Mime state = BA_STATE_Mime table = BA_StateLogic_Table}
    {tag = MetalDetect state = AU_STATE_MetalDetect_Walking table = AU_MetalDetectLogic_Table}
    {tag = minikart state = AU_STATE_Minikart table = AU_Minikart_Table}
    {tag = RampKid state = AU_STATE_RampKid table = AU_StateLogic_Table}
    {tag = LifeGuard_Walking state = AU_STATE_LifeGuard_Walking table = AU_StateLogic_Table}
    {tag = LifeGuard_Scanning state = AU_STATE_LifeGuard_Scanning table = AU_StateLogic_Table}
    {tag = F_Bikini state = ALL_STATE_F_Bikini table = ALL_StateLogic_Table}
    {tag = F_Bikini_Front state = ALL_STATE_F_Bikini_Front table = ALL_StateLogic_Table}
    {tag = F_Bikini_Sit state = ALL_STATE_F_Bikini_sit table = ALL_StateLogic_Table}
    {tag = Cop_Ticketing state = ALL_STATE_Cop_Ticketing table = ALL_StateLogic_Table}
    {tag = Cop_Pissed state = AU_STATE_Cop_Pissed table = AU_StateLogic_Table}
    {tag = LoungeSinger_Laying state = SECRET_State_LoungeSinger_Laying table = SECRET_StateLogic_Table}
    {tag = LoungeSinger_Dance state = SECRET_State_LoungeSinger_Dance table = SECRET_StateLogic_Table}
    {tag = Alien state = SECRET_STATE_AlienIdle table = SECRET_Alien_Table}
    {tag = dance state = ALL_STATE_Dance table = ALL_StateLogic_Table}
    {tag = guitarist state = ALL_STATE_Guitarist table = ALL_StateLogic_Table}
    {tag = Guitarist_playing state = ALL_STATE_Guitarist_playing table = ALL_StateLogic_Table}
    {tag = SWKid_Sitting state = BO_STATE_SWKid_Sitting table = BO_SWKidLogic_Table}
    {tag = graffiti state = ALL_STATE_Graffiti table = ALL_StateLogic_Table}
    {tag = pinkcat state = ST_STATE_IdleCat table = ST_CatLogic_Table}
]
ALL_StateLogic_Table = {
    ALL_STATE_Dance = {
        ped_update_type = no_move_update
        script_ped_state = ALL_STATECONTROL_Dance
    }
    ALL_STATE_Guitarist = {
        script_ped_state = ALL_STATECONTROL_Guitarist
        exit_state_action = wait_anim_finished
    }
    ALL_STATE_Guitarist_playing = {
        script_ped_state = ALL_STATECONTROL_Guitarist_playing
        exit_state_action = wait_anim_finished
    }
    ALL_STATE_Graffiti = {
        script_ped_state = BE_STATECONTROL_Graffiti
        exit_state_action = wait_anim_finished
    }
    ALL_STATE_Cop_Ticketing = {
        ped_update_type = no_move_update
        script_ped_state = ALL_STATECONTROL_Cop_ticketing
    }
    ALL_STATE_F_Bikini = {
        ped_update_type = no_move_update
        script_ped_state = AU_STATECONTROL_F_Bikini
    }
    ALL_STATE_F_Bikini_Front = {
        ped_update_type = no_move_update
        script_ped_state = AU_STATECONTROL_F_Bikini_Front
    }
    ALL_STATE_F_Bikini_sit = {
        ped_update_type = no_move_update
        script_ped_state = AU_STATECONTROL_F_Bikini_Sit
    }
}
BO_SWKidLogic_Table = {
    BO_STATE_SWKid_Sitting = {
        script_ped_state = BO_STATECONTROL_SWKid_Sitting
        exit_state_action = wait_anim_finished
    }
    BO_STATE_SWKid_Force = {
        script_ped_state = BO_STATECONTROL_SWKid_Force
        exit_state_action = wait_anim_finished
    }
    STATE_getattention = {
        script_ped_state = BO_STATECONTROL_SWKid_GetAttention
        exit_state_action = wait_anim_finished
    }
}
NO_StateLogic_Table = {
    NO_STATE_fluteguy = {
        script_ped_state = NO_STATECONTROL_fluteguy
        exit_state_action = wait_anim_finished
    }
    NO_STATE_fluteguy_playing = {
        script_ped_state = NO_STATECONTROL_fluteguy_playing
        exit_state_action = wait_anim_finished
    }
    NO_STATE_Jazzman = {
        script_ped_state = NO_STATECONTROL_Jazzman
        exit_state_action = wait_anim_finished
    }
    NO_STATE_Jazzman_playing = {
        script_ped_state = NO_STATECONTROL_Jazzman_playing
        exit_state_action = wait_anim_finished
    }
}

script STATECONTROL_avoidstop_custom01 
    obj_setinneravoidradius 4
    seteventhandler {
        Ex = objectinavoidradius
        scr = Ped_Utils_EventHandler params = {setstate = STATE_avoidinit event = objectinavoidradius}
    }
    obj_setouteravoidradius 10
    seteventhandler {
        Ex = objectoutofavoidradius
        scr = Ped_Utils_EventHandler params = {setstate = STATE_RESET_EVENTS event = objectoutofavoidradius}
    }
    wait 1 gameframe
    if getsingletag should_look_at_skater
        if (<should_look_at_skater> = 1)
            ped_rotate_to_skater_from_idle
        endif
    endif
    Ped_Utils_SetMiscEventHandlers
    Ped_StateLogic_SetDefaultState
endscript


script STATECONTROL_avoidland_custom01 
    obj_setinneravoidradius 4
    seteventhandler {
        Ex = objectinavoidradius
        scr = Ped_Utils_EventHandler params = {setstate = STATE_avoidinit event = objectinavoidradius}
    }
    Ped_Utils_SetMiscEventHandlers
endscript


script ALL_STATECONTROL_Dance 
    begin 
    PlayAnimWithPartialAnimIfExists anim = Ped_Suit_Dance
    Obj_WaitAnimFinished
    repeat 
endscript


script BO_STATECONTROL_SWKid_Sitting 
    if obj_animequals Ped_StarWarsKid_Clip01
        SpawnSound BO_SFX_MusicPed_NerdKid_Music_Stop
        PlayAnimWithPartialAnimIfExists anim = Ped_Starwarskid_sitdown BlendPeriod = 1
        Obj_WaitAnimFinished
    endif
    if obj_animequals Ped_StarWarsKid_Clip02
        SpawnSound BO_SFX_MusicPed_NerdKid_Music_Stop
        PlayAnimWithPartialAnimIfExists anim = Ped_Starwarskid_sitdown BlendPeriod = 1
        Obj_WaitAnimFinished
    endif
    if ScreenElementExists id = ped_speech_dialog
        speech_box_exit anchor_id = ped_speech_dialog
    endif
    if (BO_SFX_NerdKidMusicStatus = 1)
        SpawnSound BO_SFX_MusicPed_NerdKid_Music_Stop_02
    endif
    setup_ped_speech {ped_id = TRG_Ped_SW_On
        inner_radius = 7
        outer_radius = 8
        accept_text = 'Press \m5 to feel the power!'
        activation_script = BO_SW_MusicPlay
        dont_deactivate_goals
    }
    Ped_Utils_SetMiscEventHandlers
    begin 
    Random (
        @ PlayAnimWithPartialAnimIfExists anim = Ped_Starwarskid_Idle_sit01
        @ PlayAnimWithPartialAnimIfExists anim = Ped_Starwarskid_Idle_sit02
        @ PlayAnimWithPartialAnimIfExists anim = Ped_Starwarskid_Idle_sit03
    )
    Obj_WaitAnimFinished
    repeat 
endscript


script BO_STATECONTROL_SWKid_GetAttention 
    if (randomrange (1.0, 100.0) > 62)
        Ped_Utils_PlayStream type = far
    endif
    begin 
    if NOT obj_objectinattentionradius
        break 
    endif
    PlayAnimWithPartialAnimIfExists anim = Ped_Starwarskid_ComeHere
    Obj_WaitAnimFinished
    repeat 2
    Ped_Utils_SetMiscEventHandlers
    Ped_StateLogic_SetDefaultState
endscript


script BO_STATECONTROL_SWKid_Force 
    SpawnSound BO_SFX_MusicPed_NerdKid_Music_Start
    PlayAnimWithPartialAnimIfExists anim = Ped_Starwarskid_stand BlendPeriod = 1
    Obj_WaitAnimFinished
    if ScreenElementExists id = ped_speech_dialog
        speech_box_exit anchor_id = ped_speech_dialog
    endif
    setup_ped_speech {ped_id = TRG_Ped_SW_On
        inner_radius = 7
        outer_radius = 8
        accept_text = 'Press \m5 to stop.'
        activation_script = BO_SW_MusicStop
        dont_deactivate_goals
    }
    if (BO_SFX_NerdKidMusicStatus = 0)
        SpawnSound BO_SFX_MusicPed_NerdKid_Music_Start_02
    endif
    begin 
    Random (
        @ PlayAnimWithPartialAnimIfExists anim = Ped_StarWarsKid_Clip01
        SpawnSound BO_SFX_NerdKid_Moves01
        @ PlayAnimWithPartialAnimIfExists anim = Ped_StarWarsKid_Clip02
        SpawnSound BO_SFX_NerdKid_Moves02
    )
    Obj_WaitAnimFinished
    repeat 
endscript


script ALL_STATECONTROL_Guitarist 
    if LevelIs load_bo
        if (BO_SFX_SubwayMusicStatus = 1)
            SpawnSound BO_SFX_MusicPed_Subway_Music_Stop
        endif
    endif
    if LevelIs load_NO
        if (NO_DixieMusicStatus = 1)
            SpawnSound NO_SFX_Dixie_Stop
        endif
    endif
    PlayAnimWithPartialAnimIfExists anim = PED_Guitarist_Back2idle
    Obj_WaitAnimFinished
    if ScreenElementExists id = ped_speech_dialog
        speech_box_exit anchor_id = ped_speech_dialog
    endif
    if LevelIs load_bo
        if (BO_SFX_SubwayMusicStatus = 1)
            SpawnSound BO_SFX_MusicPed_Subway_Music_Stop02
        endif
        setup_ped_speech {ped_id = TRG_MusicPed_On
            inner_radius = 7
            outer_radius = 8
            accept_text = 'Press \m5 to start the music!'
            activation_script = BO_MusicPlay
            dont_deactivate_goals
        }
    endif
    if LevelIs load_NO
        if (NO_DixieMusicStatus = 1)
            SpawnSound NO_SFX_Dixie_Stop02
        endif
        setup_ped_speech {ped_id = trg_ped_jazz_01
            inner_radius = 7
            outer_radius = 8
            accept_text = 'Press \m5 to start the music!'
            activation_script = NO_MusicPlay
            dont_deactivate_goals
        }
    endif
    begin 
    PlayAnimWithPartialAnimIfExists anim = PED_Guitarist_idle
    Obj_WaitAnimFinished
    repeat 
endscript


script ALL_STATECONTROL_Guitarist_playing 
    if LevelIs load_bo
        if (BO_SFX_SubwayMusicStatus = 0)
            SpawnSound BO_SFX_MusicPed_Subway_Music_Start
        endif
    endif
    if LevelIs load_NO
        if (NO_DixieMusicStatus = 0)
            SpawnSound NO_SFX_Dixie_Start
        endif
    endif
    PlayAnimWithPartialAnimIfExists anim = PED_Guitarist_GrabGuitar
    Obj_WaitAnimFinished
    if ScreenElementExists id = ped_speech_dialog
        speech_box_exit anchor_id = ped_speech_dialog
    endif
    if LevelIs load_bo
        if (BO_SFX_SubwayMusicStatus = 0)
            SpawnSound BO_SFX_MusicPed_Subway_Music_Start02
        endif
        setup_ped_speech {ped_id = TRG_MusicPed_On
            inner_radius = 7
            outer_radius = 8
            accept_text = 'Press \m5 to stop!'
            activation_script = BO_MusicStop
            dont_deactivate_goals
        }
    endif
    if LevelIs load_NO
        if (NO_DixieMusicStatus = 0)
            SpawnSound NO_SFX_Dixie_Start02
        endif
        setup_ped_speech {ped_id = trg_ped_jazz_01
            inner_radius = 7
            outer_radius = 8
            accept_text = 'Press \m5 to stop!'
            activation_script = NO_MusicStop
            dont_deactivate_goals
        }
    endif
    if LevelIs load_bo
        begin 
        getrandomvalue name = randomspeedvalue a = 0.6000 b = 1 resolution = 4
        PlayAnimWithPartialAnimIfExists anim = PED_Guitarist_Play_pick Speed = <randomspeedvalue>
        Obj_WaitAnimFinished
        repeat 
    else
        begin 
        Random (
            @ PlayAnimWithPartialAnimIfExists anim = PED_Guitarist_Play01
            @ PlayAnimWithPartialAnimIfExists anim = PED_Guitarist__Play02
            @ PlayAnimWithPartialAnimIfExists anim = PED_Guitarist_Play03
        )
        Obj_WaitAnimFinished
        repeat 
    endif
endscript


script NO_STATECONTROL_fluteguy 
    if LevelIs load_be
        if (BE_SFX_SaxManMusicStatus = 1)
            SpawnSound BE_SFX_SaxManStop
        endif
        setup_ped_speech {ped_id = TRG_ped_saxman01
            inner_radius = 7
            outer_radius = 8
            accept_text = 'Press \m5 to start the music!'
            activation_script = BE_Musicplay
            dont_deactivate_goals
        }
    endif
    PlayAnimWithPartialAnimIfExists anim = Fluteguy_BackToidle
    Obj_WaitAnimFinished
    if LevelIs load_be
        if (BE_SFX_SaxManMusicStatus = 1)
            SpawnSound BE_SFX_SaxManStop02
        endif
    endif
    begin 
    PlayAnimWithPartialAnimIfExists anim = Fluteguy_idle
    Obj_WaitAnimFinished
    repeat 
endscript


script NO_STATECONTROL_fluteguy_playing 
    if LevelIs load_be
        setup_ped_speech {ped_id = TRG_ped_saxman01
            inner_radius = 7
            outer_radius = 8
            accept_text = 'Press \m5 to stop!'
            activation_script = BE_MusicStop
            dont_deactivate_goals
        }
    endif
    if LevelIs load_be
        SpawnSound BE_SFX_SaxManStart
    endif
    PlayAnimWithPartialAnimIfExists anim = Fluteguy_GrabFlute
    Obj_WaitAnimFinished
    if LevelIs load_be
        if (BE_SFX_SaxManMusicStatus = 0)
            SpawnSound BE_SFX_SaxManStart02
        endif
    endif
    begin 
    Random (
        @*3 PlayAnimWithPartialAnimIfExists anim = Fluteguy_Play
        @ PlayAnimWithPartialAnimIfExists anim = Fluteguy_Play1toPLay2
        Obj_WaitAnimFinished
        getrandomvalue name = RepeatCount a = 1 b = 3 resolution = 3 integer
        begin 
        PlayAnimWithPartialAnimIfExists anim = Fluteguy_Play2
        Obj_WaitAnimFinished
        repeat <RepeatCount>
        PlayAnimWithPartialAnimIfExists anim = Fluteguy_Play2toGrabFlute
        @ PlayAnimWithPartialAnimIfExists anim = Fluteguy_Play3
    )
    Obj_WaitAnimFinished
    repeat 
endscript


script NO_STATECONTROL_Jazzman 
    PlayAnimWithPartialAnimIfExists anim = Ped_Jazzman_Back2Idle BlendPeriod = 1
    Obj_WaitAnimFinished
    begin 
    PlayAnimWithPartialAnimIfExists anim = Ped_Jazzman_idle_01
    Obj_WaitAnimFinished
    repeat 
endscript


script NO_STATECONTROL_Jazzman_playing 
    PlayAnimWithPartialAnimIfExists anim = Ped_jazzman_GrabTuba
    Obj_WaitAnimFinished
    begin 
    getrandomvalue name = RepeatCount a = 1 b = 2 resolution = 2 integer
    begin 
    Random (
        @ PlayAnimWithPartialAnimIfExists anim = Ped_Jazzman_Play_01
        @ PlayAnimWithPartialAnimIfExists anim = Ped_Jazzman_Play_02
    )
    Obj_WaitAnimFinished
    repeat <RepeatCount>
    repeat 
endscript


script ALL_STATECONTROL_Cop_ticketing 
    obj_getid
    <ObjID> ::switchonatomic ped_board
    <ObjID> ::switchoffatomic ped_m_accessories
    begin 
    Random (
        @ PlayAnimWithPartialAnimIfExists anim = Ped_CopClipboard1 Speed = 0.7000
        @ PlayAnimWithPartialAnimIfExists anim = Ped_CopClipboard2 Speed = 0.7000
        @ PlayAnimWithPartialAnimIfExists anim = Ped_CopClipboard4 Speed = 0.7000
        @ PlayAnimWithPartialAnimIfExists anim = Ped_CopClipboard3 Speed = 0.7000
        @ PlayAnimWithPartialAnimIfExists anim = Ped_CopClipboard_Stand2Idle backwards
        Obj_WaitAnimFinished
        getrandomvalue name = RepeatCount a = 3 b = 10 resolution = 7 integer
        begin 
        PlayAnimWithPartialAnimIfExists anim = Ped_CopClipboard_Stand
        Obj_WaitAnimFinished
        repeat <RepeatCount>
        PlayAnimWithPartialAnimIfExists anim = Ped_CopClipboard_Stand2Idle
    )
    Obj_WaitAnimFinished
    repeat 
endscript


script AU_STATECONTROL_F_Bikini 
    Obj_CycleAnim anim = Ped_Bikini_LyingBack numCycles = 2
    begin 
    Random (
        @ PlayAnimWithPartialAnimIfExists anim = Ped_Bikini_LyingFrontFromBack
        Obj_WaitAnimFinished
        Ped_SetLogicState AU_STATE_F_Bikini_Front table = AU_StateLogic_Table
        @ PlayAnimWithPartialAnimIfExists anim = Ped_Bikini_LyingBackToSit1
        Obj_WaitAnimFinished
        Ped_SetLogicState AU_STATE_F_Bikini_Sit table = AU_StateLogic_Table
        @ getrandomvalue name = RepeatCount a = 1 b = 3 resolution = 3 integer
        begin 
        PlayAnimWithPartialAnimIfExists anim = Ped_Bikini_LyingBack
        Obj_WaitAnimFinished
        repeat <RepeatCount>
        repeat 
    )
endscript


script AU_STATECONTROL_F_Bikini_Front 
    getrandomvalue name = RepeatCount a = 1 b = 5 resolution = 5 integer
    begin 
    PlayAnimWithPartialAnimIfExists anim = Ped_Bikini_LyingFront
    Obj_WaitAnimFinished
    repeat <RepeatCount>
    PlayAnimWithPartialAnimIfExists anim = Ped_Bikini_LyingFrontToBack
    Obj_WaitAnimFinished
    Ped_SetLogicState AU_STATE_F_Bikini table = AU_StateLogic_Table
endscript


script AU_STATECONTROL_F_Bikini_Sit 
    getrandomvalue name = RepeatCount a = 1 b = 5 resolution = 5 integer
    begin 
    Random (
        @ 
        PlayAnimWithPartialAnimIfExists anim = Ped_Bikini_Sit1
        @ PlayAnimWithPartialAnimIfExists anim = Ped_Bikini_Sit1ToSit2
        Obj_WaitAnimFinished
        PlayAnimWithPartialAnimIfExists anim = Ped_Bikini_Sit2
        Obj_WaitAnimFinished
        PlayAnimWithPartialAnimIfExists anim = Ped_Bikini_Sit1FromSit2
        @ PlayAnimWithPartialAnimIfExists anim = Ped_Bikini_Sit1ToSit3
        Obj_WaitAnimFinished
        PlayAnimWithPartialAnimIfExists anim = Ped_Bikini_Sit3
        Obj_WaitAnimFinished
        PlayAnimWithPartialAnimIfExists anim = Ped_Bikini_Sit1FromSit3
        @ PlayAnimWithPartialAnimIfExists anim = Ped_Bikini_Sit1ToSunblock
        Obj_WaitAnimFinished
        PlayAnimWithPartialAnimIfExists anim = Ped_Bikini_Sunblock
        Obj_WaitAnimFinished
        PlayAnimWithPartialAnimIfExists anim = Ped_Bikini_Sit1FromSunblock
    )
    Obj_WaitAnimFinished
    repeat <RepeatCount>
    PlayAnimWithPartialAnimIfExists anim = Ped_Bikini_LyingBackFromSit1
    Obj_WaitAnimFinished
    Ped_SetLogicState AU_STATE_F_Bikini table = AU_StateLogic_Table
endscript


script BE_STATECONTROL_Graffiti 
    Ped_TurnToCurrentWaypointOrientation
    PlayAnimWithPartialAnimIfExists anim = Ped_Graffiti_Step2Tag
    switchonatomic board
    switchoffatomic ped_m_accessories
    begin 
    begin 
    getrandomvalue name = RepeatCount a = 1 b = 5 resolution = 5 integer
    Random (
        @ PlayAnimWithPartialAnimIfExists anim = Ped_Graffiti_Idle
        @ PlayAnimWithPartialAnimIfExists anim = Ped_Graffiti_LookAround
        @ PlayAnimWithPartialAnimIfExists anim = Ped_Graffiti_ShakeCan
    )
    Obj_WaitAnimFinished
    repeat <RepeatCount>
    PlayAnimWithPartialAnimIfExists anim = Ped_Graffiti_Step2BigTag
    Obj_WaitAnimFinished
    begin 
    getrandomvalue name = RepeatCount a = 1 b = 3 resolution = 3 integer
    Random (
        @ PlayAnimWithPartialAnimIfExists anim = Ped_Graffiti_BigTag01
        @ PlayAnimWithPartialAnimIfExists anim = Ped_Graffiti_BigTag02
    )
    Obj_WaitAnimFinished
    repeat <RepeatCount>
    switchonatomic ped_m_accessories
    switchoffatomic board
    PlayAnimWithPartialAnimIfExists anim = Ped_Graffiti_BigTagStepBack
    Obj_WaitAnimFinished
    repeat 
endscript

