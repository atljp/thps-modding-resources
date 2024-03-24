
script SE_setup 
    SetFlag flag = ElevatorIsDown
    UnSetFlag flag = FighterEngine01
    UnSetFlag flag = FighterEngine02
    UnSetFlag flag = FighterEngine03
    UnSetFlag flag = FireTrap_01
    UnSetFlag flag = FireTrap_02
    UnSetFlag flag = FireTrap_03
    UnSetFlag flag = FireTrap_04
    UnSetFlag flag = FireTrap_05
    UnSetFlag flag = FireTrap_06
    UnSetFlag flag = FireTrap_07
    UnSetFlag flag = FireTrap_08
    UnSetFlag flag = FireTrap_09
    UnSetFlag flag = FireTrap_10
    UnSetFlag flag = FireTrap_11
    UnSetFlag flag = FireTrap_12
    UnSetFlag flag = DartTrap_01
    UnSetFlag flag = DartTrap_02
    UnSetFlag flag = DartTrap_03
    UnSetFlag flag = DartTrap_04
    UnSetFlag flag = DartTrap_05
    UnSetFlag flag = DartTrap_06
    UnSetFlag flag = DartTrap_07
    UnSetFlag flag = DartTrap_08
    SE_Initializer
endscript


script SE_Startup 
    SpawnScript SE_particles
    LoadSkeleton name = 'skeletons/CS_SE_SpaceWarp.ske' CS_SE_SpaceWarp
endscript


script SE_Initializer 
    if InMultiPlayerGame
        Kill prefix = 'GEO_PreEvent_GatesToHell'
        Kill prefix = 'TRG_PreEvent_GatesToHell'
        Create prefix = 'GEO_PostEvent_GatesToHell'
        Create prefix = 'TRG_PostEvent_GatesToHell'
        Create name = TRG_PostEvent_GatesToHell_TeleportPlane03
        Kill prefix = 'GEO_PreEvent_Boulder'
        Kill prefix = 'TRG_PreEvent_Boulder'
        Create prefix = 'GEO_PostEvent_Boulder'
        Create prefix = 'TRG_PostEvent_Boulder'
        Create name = GEO_PostEvent_Spaceship_SpacePort_Kicker01
        Create name = GEO_PostEvent_Spaceship_Crane
        Create name = GEO_PostEvent_Spaceship_GreenButton01
        Create name = GEO_PostEvent_Spaceship_GreenButton02
        Create prefix = 'TRG_PostEvent_Spaceship'
        SetFlag flag = Idol01
        SetFlag flag = Idol02
        SetFlag flag = Idol03
        SetFlag flag = Idol04
        SetFlag flag = Idol05
        DestroyFastParticleSystem name = SP_sparking01 attachobjid = TRG_Droid_08
        DestroyFastParticleSystem name = SP_sparking02 attachobjid = TRG_Droid_08
        DestroyFastParticleSystem name = SP_shiphover
        Create name = GEO_PostEvent_Rib_Rib_001
        Create name = GEO_PostEvent_Rib_Rib_002
        Create name = GEO_PostEvent_Rib_QPKicker_01
        Create name = GEO_PostEvent_Rib_QPKicker_02
        Create name = GEO_PostEvent_Rib_LoungeKicker_001
        Create name = GEO_PostEvent_Rib_Tongue
        Create name = GEO_PostEvent_Rib_Mouth
        Create prefix = 'TRG_PostEvent_Rib'
        Kill name = GEO_Spaceport_Train
    else
        SpawnScript robosparks
    endif
endscript


script SE_KillCreate_NetGeo 
    if ((InMultiPlayerGame)|| (InNetGame))
    endif
endscript

ElevatorIsDown = 0
ElevatorIsGoingUp = 1
ElevatorIsUp = 2
ElevatorIsGoingDown = 3
Rope01 = 4
Rope02 = 5
RedButton01 = 6
RedButton02 = 7
EnginesOn = 8
Engine01 = 9
Engine02 = 10
RibButton01 = 11
RibButton02 = 12
Idol01 = 13
Idol02 = 14
Idol03 = 15
Idol04 = 16
Idol05 = 17
FighterEngine01 = 18
FighterEngine02 = 19
FighterEngine03 = 20
FireTrap_01 = 21
FireTrap_02 = 22
FireTrap_03 = 23
FireTrap_04 = 24
FireTrap_05 = 25
FireTrap_06 = 26
FireTrap_07 = 27
FireTrap_08 = 28
FireTrap_09 = 29
FireTrap_10 = 30
FireTrap_11 = 31
FireTrap_12 = 32
DartTrap_01 = 33
DartTrap_02 = 34
DartTrap_03 = 35
DartTrap_04 = 36
DartTrap_05 = 37
DartTrap_06 = 38
DartTrap_07 = 39
DartTrap_08 = 40
SpaceToTempleVisible = 41
SpaceToHellVisible = 42
TempleToSpaceVisible = 43
TempleToHellVisible = 44
HellToTempleVisible = 45
HellToSpaceVisible = 46

script SE_goals 
    if NOT InMultiPlayerGame
    endif
    if InMultiPlayerGame
        add_multiplayer_mode_goals
    endif
    if NOT InSplitScreenGame
        if NOT ((GameModeEquals is_singlesession)|| (GameModeEquals is_creategoals))
            if NOT InNetGame
            endif
        endif
    endif
endscript


script SE_Crazy_Girl 
    obj_setattentionradius 10
    Ped_InitAI stand avoid GetAttention F_MardisGras_Dance
endscript


script SE_Mayan_Weather_ON 
    TODManager_SetTODInstant Evening
    EnableSun
endscript


script SE_Mayan_Weather_Off 
    TODManager_SetTODInstant Afternoon
    DisableSun
endscript


script Shatter_1 
    SE_SFX_BreakMetal
    Shatter {name = <name>
        area = 2000
        texture_swap = cg_se_shatter_circlegrate
        variance = 1.0
        spread = 1.500
        life = 6
        Bounce = 0.5000
        Scale = 0.4000
        vel_x = 0
        vel_y = 60
        vel_z = 0
    }
    Kill name = <name>
endscript


script Shatter_2 
    SE_SFX_BreakMetal
    Shatter {name = <name>
        area = 2000
        texture_swap = cg_se_shatter_grate
        variance = 1.0
        spread = 1.500
        life = 6
        Bounce = 0.5000
        Scale = 0.4000
        vel_x = 0
        vel_y = 60
        vel_z = 0
    }
    Kill name = <name>
endscript


script SE_Temple_FireTrap 
    if NOT GetFlag flag = <flag>
        playsound FlamingFireBall01 pitch = 130
        SetFlag flag = <flag>
        switch <flag>
            case FireTrap_01
            CreateFastParticleSystem name = JOW_SE_FireTrap01 params_script = JOW_SE_FireTrap01_fast_particle_params
            CreateFastParticleSystem name = JOW_SE_FireTrap01a params_script = JOW_SE_FireTrap01a_fast_particle_params
            case FireTrap_02
            CreateFastParticleSystem name = JOW_SE_FireTrap02 params_script = JOW_SE_FireTrap02_fast_particle_params
            CreateFastParticleSystem name = JOW_SE_FireTrap02a params_script = JOW_SE_FireTrap02a_fast_particle_params
            case FireTrap_03
            CreateFastParticleSystem name = JOW_SE_FireTrap03 params_script = JOW_SE_FireTrap03_fast_particle_params
            CreateFastParticleSystem name = JOW_SE_FireTrap03a params_script = JOW_SE_FireTrap03a_fast_particle_params
            case FireTrap_04
            CreateFastParticleSystem name = JOW_SE_FireTrap04 params_script = JOW_SE_FireTrap04_fast_particle_params
            CreateFastParticleSystem name = JOW_SE_FireTrap04a params_script = JOW_SE_FireTrap04a_fast_particle_params
            case FireTrap_05
            CreateFastParticleSystem name = JOW_SE_FireTrap05 params_script = JOW_SE_FireTrap05_fast_particle_params
            CreateFastParticleSystem name = JOW_SE_FireTrap05a params_script = JOW_SE_FireTrap05a_fast_particle_params
            case FireTrap_06
            CreateFastParticleSystem name = JOW_SE_FireTrap06 params_script = JOW_SE_FireTrap06_fast_particle_params
            CreateFastParticleSystem name = JOW_SE_FireTrap06a params_script = JOW_SE_FireTrap06a_fast_particle_params
            case FireTrap_07
            CreateFastParticleSystem name = JOW_SE_FireTrap07 params_script = JOW_SE_FireTrap07_fast_particle_params
            CreateFastParticleSystem name = JOW_SE_FireTrap07a params_script = JOW_SE_FireTrap07a_fast_particle_params
            case FireTrap_08
            CreateFastParticleSystem name = JOW_SE_FireTrap08 params_script = JOW_SE_FireTrap08_fast_particle_params
            CreateFastParticleSystem name = JOW_SE_FireTrap08a params_script = JOW_SE_FireTrap08a_fast_particle_params
            case FireTrap_09
            CreateFastParticleSystem name = JOW_SE_FireTrap09 params_script = JOW_SE_FireTrap09_fast_particle_params
            CreateFastParticleSystem name = JOW_SE_FireTrap09a params_script = JOW_SE_FireTrap09a_fast_particle_params
            case FireTrap_10
            CreateFastParticleSystem name = JOW_SE_FireTrap10 params_script = JOW_SE_FireTrap10_fast_particle_params
            CreateFastParticleSystem name = JOW_SE_FireTrap10a params_script = JOW_SE_FireTrap10a_fast_particle_params
            case FireTrap_11
            CreateFastParticleSystem name = JOW_SE_FireTrap11 params_script = JOW_SE_FireTrap11_fast_particle_params
            CreateFastParticleSystem name = JOW_SE_FireTrap11a params_script = JOW_SE_FireTrap11a_fast_particle_params
            case FireTrap_12
            CreateFastParticleSystem name = JOW_SE_FireTrap12 params_script = JOW_SE_FireTrap12_fast_particle_params
            CreateFastParticleSystem name = JOW_SE_FireTrap12a params_script = JOW_SE_FireTrap12a_fast_particle_params
        endswitch
        wait 3 seconds
        UnSetFlag flag = <flag>
    endif
endscript


script SE_Temple_DartTrap 
    if NOT GetFlag flag = <flag>
        SpawnScript SE_SFX_DartsShoot
        SetFlag flag = <flag>
        Create name = <particle>
        Create name = <Particle2>
        switch <flag>
            case DartTrap_01
            CreateFastParticleSystem name = JOW_SE_Dart01 params_script = JOW_SE_Dart01_fast_particle_params
            CreateFastParticleSystem name = JOW_SE_Dart01a params_script = JOW_SE_Dart01a_fast_particle_params
            case DartTrap_02
            CreateFastParticleSystem name = JOW_SE_Dart02 params_script = JOW_SE_Dart02_fast_particle_params
            CreateFastParticleSystem name = JOW_SE_Dart02a params_script = JOW_SE_Dart02a_fast_particle_params
            case DartTrap_03
            CreateFastParticleSystem name = JOW_SE_Dart03 params_script = JOW_SE_Dart03_fast_particle_params
            CreateFastParticleSystem name = JOW_SE_Dart03a params_script = JOW_SE_Dart03a_fast_particle_params
            case DartTrap_04
            CreateFastParticleSystem name = JOW_SE_Dart04 params_script = JOW_SE_Dart04_fast_particle_params
            CreateFastParticleSystem name = JOW_SE_Dart04a params_script = JOW_SE_Dart04a_fast_particle_params
            case DartTrap_05
            CreateFastParticleSystem name = JOW_SE_Dart05 params_script = JOW_SE_Dart05_fast_particle_params
            CreateFastParticleSystem name = JOW_SE_Dart05a params_script = JOW_SE_Dart05a_fast_particle_params
            case DartTrap_06
            CreateFastParticleSystem name = JOW_SE_Dart06 params_script = JOW_SE_Dart06_fast_particle_params
            CreateFastParticleSystem name = JOW_SE_Dart06a params_script = JOW_SE_Dart06a_fast_particle_params
            case DartTrap_07
            CreateFastParticleSystem name = JOW_SE_Dart07 params_script = JOW_SE_Dart07_fast_particle_params
            CreateFastParticleSystem name = JOW_SE_Dart07a params_script = JOW_SE_Dart07a_fast_particle_params
            case DartTrap_08
            CreateFastParticleSystem name = JOW_SE_Dart08 params_script = JOW_SE_Dart08_fast_particle_params
            CreateFastParticleSystem name = JOW_SE_Dart08a params_script = JOW_SE_Dart08a_fast_particle_params
        endswitch
        wait 1 seconds
        Kill name = <particle>
        Kill name = <Particle2>
        UnSetFlag flag = <flag>
    endif
endscript


script SE_Fighter_Liptrick_01 
    GetTriggerArray lip
    if triggertype <trigger_array>
        if NOT InMultiPlayerGame
            if NOT GetFlag flag = FighterEngine01
                Create name = TRG_EngineSmoke_01_Start
                Create name = TRG_EngineSmoke_02_Start
                SetFlag flag = FighterEngine01
            endif
        endif
    endif
endscript


script SE_Fighter_Liptrick_02 
    GetTriggerArray lip
    if triggertype <trigger_array>
        if NOT InMultiPlayerGame
            if NOT GetFlag flag = FighterEngine02
                Create name = TRG_EngineSmoke_03_Start
                Create name = TRG_EngineSmoke_04_Start
                SetFlag flag = FighterEngine02
            endif
        endif
    endif
endscript


script SE_Fighter_Liptrick_03 
    GetTriggerArray lip
    if triggertype <trigger_array>
        if NOT InMultiPlayerGame
            if NOT GetFlag flag = FighterEngine03
                Create name = TRG_EngineSmoke_05_Start
                Create name = TRG_EngineSmoke_06_Start
                SetFlag flag = FighterEngine03
            endif
        endif
    endif
endscript


script SE_Ped_LS_Music_On 
    obj_setattentionradius 10
    Ped_InitAI stand GetAttention LoungeSinger_Laying
endscript


script SE_Ped_TempleHint1 
    Ped_Utils_SetupHintSpeech {
        ped_id = TRG_Ped_Hint_Mayan
        accept_text = 'Press \m5 to talk.'
        hint_text = 'The Monkey gods are quick to judge wrongdoers.  If you tag the 5 idols, you will be doomed to face the Monkey\'s wrath in Hell!'
        hint_text_time = 15
        vo = SE_Ped_Mayan_VO
        volume = 250
        inner_radius = 8
        outer_radius = 30
        dont_deactivate_goals
    }
    obj_setattentionradius 40
    Ped_InitAI stand fall GetAttention
endscript


script SE_Ped_TempleHint2 
    Ped_Utils_SetupHintSpeech {
        ped_id = TRG_Ped_Hint_Tikiman
        accept_text = 'Press \m5 to talk.'
        hint_text = 'I think the statue\'s support ropes are about to break!  Don\'t Grind near them, or something bad might happen!'
        hint_text_time = 15
        vo = SE_Ped_Tikiman_VO
        volume = 250
        inner_radius = 8
        outer_radius = 30
        dont_deactivate_goals
    }
    obj_setattentionradius 40
    Ped_InitAI stand fall GetAttention
endscript


script SE_Ped_SpaceportHint1 
    Ped_Utils_SetupHintSpeech {
        ped_id = TRG_Ped_Hint_Space
        accept_text = 'Press \m5 to talk.'
        hint_text = 'Activate the red wall circuitry on either side of the walkway behind me or face immediate probing, puny meatslave!'
        hint_text_time = 15
        vo = SE_Ped_AlienDoctor_VO
        volume = 250
        inner_radius = 8
        outer_radius = 30
        dont_deactivate_goals
    }
    obj_setattentionradius 40
    Ped_InitAI stand fall GetAttention
endscript


script SE_Ped_HellHint1 
    Ped_Utils_SetupHintSpeech {
        ped_id = TRG_Ped_Hint_Hell
        accept_text = 'Press \m5 to talk.'
        hint_text = 'Da big boss needs da runes lit up. Lip Trick on toppa da two brokin ribs to nok em ovva an den Wallplant on da two pillar runes.  Once ya do that, I\'ll let you inta da bak room so da boss kin \'gratulate you hisself.'
        hint_text_time = 15
        vo = SE_Ped_Imp_VO
        volume = 250
        inner_radius = 8
        outer_radius = 30
        dont_deactivate_goals
    }
    obj_setattentionradius 40
    Ped_InitAI stand fall GetAttention
endscript


script SE_TeleporterDoor_A_PlayerApproaches 
    SpawnScript SE_SFX_SpaceDoorOpen
    SendException open name = GEO_LeftDoor_05
    SendException open name = GEO_RightDoor_05
    SendException open name = GEO_LeftDoor_03
    SendException open name = GEO_RightDoor_03
endscript


script SE_TeleporterDoor_A_PlayerLeaves 
    SpawnScript SE_SFX_SpaceDoorClose
    SendException close name = GEO_LeftDoor_05
    SendException close name = GEO_RightDoor_05
    SendException close name = GEO_LeftDoor_03
    SendException close name = GEO_RightDoor_03
endscript


script SE_TeleporterDoor_B_PlayerApproaches 
    SpawnScript SE_SFX_SpaceDoorOpen
    SendException open name = GEO_LeftDoor_06
    SendException open name = GEO_RightDoor_06
    SendException open name = GEO_LeftDoor_02
    SendException open name = GEO_RightDoor_02
endscript


script SE_TeleporterDoor_B_PlayerLeaves 
    SpawnScript SE_SFX_SpaceDoorClose
    SendException close name = GEO_LeftDoor_06
    SendException close name = GEO_RightDoor_06
    SendException close name = GEO_LeftDoor_02
    SendException close name = GEO_RightDoor_02
endscript


script SE_TeleporterDoor_C_PlayerApproaches 
    SpawnScript SE_SFX_SpaceDoorOpen
    SendException open name = GEO_LeftDoor_01
    SendException open name = GEO_RightDoor_01
    SendException open name = GEO_LeftDoor_04
    SendException open name = GEO_RightDoor_04
endscript


script SE_TeleporterDoor_C_PlayerLeaves 
    SpawnScript SE_SFX_SpaceDoorClose
    SendException close name = GEO_LeftDoor_01
    SendException close name = GEO_RightDoor_01
    SendException close name = GEO_LeftDoor_04
    SendException close name = GEO_RightDoor_04
endscript


script SE_Door_Left_01 
    Obj_ClearExceptions
    Obj_SetException Ex = open scr = SE_Door_Left_01_Open params = <...> 
    Obj_SetException Ex = close scr = SE_Door_Left_01_Close params = <...> 
endscript


script SE_Door_Left_01_Open 
    obj_movetonode name = TRG_LeftDoor_01_Open Speed = 15
    Obj_WaitMove
endscript


script SE_Door_Left_01_Close 
    obj_movetonode name = TRG_LeftDoor_01_Closed Speed = 15
    Obj_WaitMove
endscript


script SE_Door_Right_01 
    Obj_ClearExceptions
    Obj_SetException Ex = open scr = SE_Door_Right_01_Open params = <...> 
    Obj_SetException Ex = close scr = SE_Door_Right_01_Close params = <...> 
endscript


script SE_Door_Right_01_Open 
    obj_movetonode name = TRG_RightDoor_01_Open Speed = 15
    Obj_WaitMove
endscript


script SE_Door_Right_01_Close 
    obj_movetonode name = TRG_RightDoor_01_Closed Speed = 15
    Obj_WaitMove
endscript


script SE_Door_Left_02 
    Obj_ClearExceptions
    Obj_SetException Ex = open scr = SE_Door_Left_02_Open params = <...> 
    Obj_SetException Ex = close scr = SE_Door_Left_02_Close params = <...> 
endscript


script SE_Door_Left_02_Open 
    obj_movetonode name = TRG_LeftDoor_02_Open Speed = 15
    Obj_WaitMove
endscript


script SE_Door_Left_02_Close 
    obj_movetonode name = TRG_LeftDoor_02_Closed Speed = 15
    Obj_WaitMove
endscript


script SE_Door_Right_02 
    Obj_ClearExceptions
    Obj_SetException Ex = open scr = SE_Door_Right_02_Open params = <...> 
    Obj_SetException Ex = close scr = SE_Door_Right_02_Close params = <...> 
endscript


script SE_Door_Right_02_Open 
    obj_movetonode name = TRG_RightDoor_02_Open Speed = 15
    Obj_WaitMove
endscript


script SE_Door_Right_02_Close 
    obj_movetonode name = TRG_RightDoor_02_Closed Speed = 15
    Obj_WaitMove
endscript


script SE_Door_Left_03 
    Obj_ClearExceptions
    Obj_SetException Ex = open scr = SE_Door_Left_03_Open params = <...> 
    Obj_SetException Ex = close scr = SE_Door_Left_03_Close params = <...> 
endscript


script SE_Door_Left_03_Open 
    obj_movetonode name = TRG_LeftDoor_03_Open Speed = 15
    Obj_WaitMove
endscript


script SE_Door_Left_03_Close 
    obj_movetonode name = TRG_LeftDoor_03_Closed Speed = 15
    Obj_WaitMove
endscript


script SE_Door_Right_03 
    Obj_ClearExceptions
    Obj_SetException Ex = open scr = SE_Door_Right_03_Open params = <...> 
    Obj_SetException Ex = close scr = SE_Door_Right_03_Close params = <...> 
endscript


script SE_Door_Right_03_Open 
    obj_movetonode name = TRG_RightDoor_03_Open Speed = 15
    Obj_WaitMove
endscript


script SE_Door_Right_03_Close 
    obj_movetonode name = TRG_RightDoor_03_Closed Speed = 15
    Obj_WaitMove
endscript


script SE_Door_Left_04 
    Obj_ClearExceptions
    Obj_SetException Ex = open scr = SE_Door_Left_04_Open params = <...> 
    Obj_SetException Ex = close scr = SE_Door_Left_04_Close params = <...> 
endscript


script SE_Door_Left_04_Open 
    obj_movetonode name = TRG_LeftDoor_04_Open Speed = 15
    Obj_WaitMove
endscript


script SE_Door_Left_04_Close 
    obj_movetonode name = TRG_LeftDoor_04_Closed Speed = 15
    Obj_WaitMove
endscript


script SE_Door_Right_04 
    Obj_ClearExceptions
    Obj_SetException Ex = open scr = SE_Door_Right_04_Open params = <...> 
    Obj_SetException Ex = close scr = SE_Door_Right_04_Close params = <...> 
endscript


script SE_Door_Right_04_Open 
    obj_movetonode name = TRG_RightDoor_04_Open Speed = 15
    Obj_WaitMove
endscript


script SE_Door_Right_04_Close 
    obj_movetonode name = TRG_RightDoor_04_Closed Speed = 15
    Obj_WaitMove
endscript


script SE_Door_Left_05 
    Obj_ClearExceptions
    Obj_SetException Ex = open scr = SE_Door_Left_05_Open params = <...> 
    Obj_SetException Ex = close scr = SE_Door_Left_05_Close params = <...> 
endscript


script SE_Door_Left_05_Open 
    obj_movetonode name = TRG_LeftDoor_05_Open Speed = 15
    Obj_WaitMove
endscript


script SE_Door_Left_05_Close 
    obj_movetonode name = TRG_LeftDoor_05_Closed Speed = 15
    Obj_WaitMove
endscript


script SE_Door_Right_05 
    Obj_ClearExceptions
    Obj_SetException Ex = open scr = SE_Door_Right_05_Open params = <...> 
    Obj_SetException Ex = close scr = SE_Door_Right_05_Close params = <...> 
endscript


script SE_Door_Right_05_Open 
    obj_movetonode name = TRG_RightDoor_05_Open Speed = 15
    Obj_WaitMove
endscript


script SE_Door_Right_05_Close 
    obj_movetonode name = TRG_RightDoor_05_Closed Speed = 15
    Obj_WaitMove
endscript


script SE_Door_Left_06 
    Obj_ClearExceptions
    Obj_SetException Ex = open scr = SE_Door_Left_06_Open params = <...> 
    Obj_SetException Ex = close scr = SE_Door_Left_06_Close params = <...> 
endscript


script SE_Door_Left_06_Open 
    obj_movetonode name = TRG_LeftDoor_06_Open Speed = 15
    Obj_WaitMove
endscript


script SE_Door_Left_06_Close 
    obj_movetonode name = TRG_LeftDoor_06_Closed Speed = 15
    Obj_WaitMove
endscript


script SE_Door_Right_06 
    Obj_ClearExceptions
    Obj_SetException Ex = open scr = SE_Door_Right_06_Open params = <...> 
    Obj_SetException Ex = close scr = SE_Door_Right_06_Close params = <...> 
endscript


script SE_Door_Right_06_Open 
    obj_movetonode name = TRG_RightDoor_06_Open Speed = 15
    Obj_WaitMove
endscript


script SE_Door_Right_06_Close 
    obj_movetonode name = TRG_RightDoor_06_Closed Speed = 15
    Obj_WaitMove
endscript


script SE_FanBlade 
    obj_rotz Angle = 180 Speed = 1000 flag_max_coords
    Obj_WaitRotate
    obj_roty Speed = 200 flag_max_coords
endscript


script SE_HellGate_01_Approach 
    SendException open name = GEO_HellGate_01A
    SendException open name = GEO_HellGate_01B
endscript


script SE_HellGate_01_Leave 
    SendException close name = GEO_HellGate_01A
    SendException close name = GEO_HellGate_01B
endscript


script SE_HellGate_01A 
    Obj_ClearExceptions
    Obj_SetException Ex = open scr = SE_HellGate_A_Open params = <...> 
    Obj_SetException Ex = close scr = SE_HellGate_A_Close params = <...> 
endscript


script SE_HellGate_01B 
    Obj_ClearExceptions
    Obj_SetException Ex = open scr = SE_HellGate_B_Open params = <...> 
    Obj_SetException Ex = close scr = SE_HellGate_B_Close params = <...> 
endscript


script SE_HellGate_02_Approach 
    SendException open name = GEO_HellGate_02A
    SendException open name = GEO_HellGate_02B
endscript


script SE_HellGate_02_Leave 
    SendException close name = GEO_HellGate_02A
    SendException close name = GEO_HellGate_02B
endscript


script SE_HellGate_02A 
    Obj_ClearExceptions
    Obj_SetException Ex = open scr = SE_HellGate_A_Open params = <...> 
    Obj_SetException Ex = close scr = SE_HellGate_A_Close params = <...> 
endscript


script SE_HellGate_02B 
    Obj_ClearExceptions
    Obj_SetException Ex = open scr = SE_HellGate_B_Open params = <...> 
    Obj_SetException Ex = close scr = SE_HellGate_B_Close params = <...> 
endscript


script SE_HellGate_03_Approach 
    SendException open name = GEO_Hellgate_03A
    SendException open name = GEO_Hellgate_03B
endscript


script SE_HellGate_03_Leave 
    SendException close name = GEO_Hellgate_03A
    SendException close name = GEO_Hellgate_03B
endscript


script SE_HellGate_03A 
    Obj_ClearExceptions
    Obj_SetException Ex = open scr = SE_HellGate_A_Open params = <...> 
    Obj_SetException Ex = close scr = SE_HellGate_A_Close params = <...> 
endscript


script SE_HellGate_03B 
    Obj_ClearExceptions
    Obj_SetException Ex = open scr = SE_HellGate_B_Open params = <...> 
    Obj_SetException Ex = close scr = SE_HellGate_B_Close params = <...> 
endscript


script SE_HellGate_04_Approach 
    SendException open name = GEO_Hellgate_04A
    SendException open name = GEO_Hellgate_04B
endscript


script SE_HellGate_04_Leave 
    SendException close name = GEO_Hellgate_04A
    SendException close name = GEO_Hellgate_04B
endscript


script SE_Hellgate_04A 
    Obj_ClearExceptions
    Obj_SetException Ex = open scr = SE_HellGate_A_Open params = <...> 
    Obj_SetException Ex = close scr = SE_HellGate_A_Close params = <...> 
endscript


script SE_Hellgate_04B 
    Obj_ClearExceptions
    Obj_SetException Ex = open scr = SE_HellGate_B_Open params = <...> 
    Obj_SetException Ex = close scr = SE_HellGate_B_Close params = <...> 
endscript


script SE_HellGate_05_Approach 
    SendException open name = GEO_HellGate_05A
    SendException open name = GEO_HellGate_05B
endscript


script SE_HellGate_05_Leave 
    SendException close name = GEO_HellGate_05A
    SendException close name = GEO_HellGate_05B
endscript


script SE_HellGate_05A 
    Obj_ClearExceptions
    Obj_SetException Ex = open scr = SE_HellGate_A_Open params = <...> 
    Obj_SetException Ex = close scr = SE_HellGate_A_Close params = <...> 
endscript


script SE_HellGate_05B 
    Obj_ClearExceptions
    Obj_SetException Ex = open scr = SE_HellGate_B_Open params = <...> 
    Obj_SetException Ex = close scr = SE_HellGate_B_Close params = <...> 
endscript


script SE_HellGate_06_Approach 
    SendException open name = GEO_HellGate_06A
    SendException open name = GEO_HellGate_06B
endscript


script SE_HellGate_06_Leave 
    SendException close name = GEO_HellGate_06A
    SendException close name = GEO_HellGate_06B
endscript


script SE_HellGate_06A 
    Obj_ClearExceptions
    Obj_SetException Ex = open scr = SE_HellGate_A_Open params = <...> 
    Obj_SetException Ex = close scr = SE_HellGate_A_Close params = <...> 
endscript


script SE_HellGate_06B 
    Obj_ClearExceptions
    Obj_SetException Ex = open scr = SE_HellGate_B_Open params = <...> 
    Obj_SetException Ex = close scr = SE_HellGate_B_Close params = <...> 
endscript


script SE_HellGate_07_Approach 
    SendException open name = GEO_HellGate_07A
    SendException open name = GEO_HellGate_07B
endscript


script SE_HellGate_07_Leave 
    SendException close name = GEO_HellGate_07A
    SendException close name = GEO_HellGate_07B
endscript


script SE_HellGate_07A 
    Obj_ClearExceptions
    Obj_SetException Ex = open scr = SE_HellGate_A_Open params = <...> 
    Obj_SetException Ex = close scr = SE_HellGate_A_Close params = <...> 
endscript


script SE_HellGate_07B 
    Obj_ClearExceptions
    Obj_SetException Ex = open scr = SE_HellGate_B_Open params = <...> 
    Obj_SetException Ex = close scr = SE_HellGate_B_Close params = <...> 
endscript


script SE_HellGate_08_Approach 
    SendException open name = GEO_HellGate_08A
    SendException open name = GEO_HellGate_08B
endscript


script SE_HellGate_08_Leave 
    SendException close name = GEO_HellGate_08A
    SendException close name = GEO_HellGate_08B
endscript


script SE_HellGate_08A 
    Obj_ClearExceptions
    Obj_SetException Ex = open scr = SE_HellGate_A_Open params = <...> 
    Obj_SetException Ex = close scr = SE_HellGate_A_Close params = <...> 
endscript


script SE_HellGate_08B 
    Obj_ClearExceptions
    Obj_SetException Ex = open scr = SE_HellGate_B_Open params = <...> 
    Obj_SetException Ex = close scr = SE_HellGate_B_Close params = <...> 
endscript


script SE_HellGate_A_Open 
    obj_rotz Angle = 90 Speed = 1000 flag_max_coords
endscript


script SE_HellGate_A_Close 
    obj_rotz Angle = -90 Speed = 1000 flag_max_coords
endscript


script SE_HellGate_B_Open 
    obj_rotz Angle = -90 Speed = 1000 flag_max_coords
endscript


script SE_HellGate_B_Close 
    obj_rotz Angle = 90 Speed = 1000 flag_max_coords
endscript


script SE_Droid_Slow 
    Car_Generic01 StickToGround nosound TurnDist = 20 DefaultSpeed = 5 <...> 
endscript


script SE_Droid_Medium 
    Car_Generic01 StickToGround nosound TurnDist = 20 DefaultSpeed = 10 <...> 
endscript


script SE_Droid_Fast 
    Car_Generic01 StickToGround nosound TurnDist = 20 DefaultSpeed = 20 <...> 
endscript


script SE_FlyingDroid_Slow 
    Car_Generic01 nosound TurnDist = 20 DefaultSpeed = 10 <...> 
endscript


script SE_FlyingDroid_Medium 
    Car_Generic01 nosound TurnDist = 20 DefaultSpeed = 20 <...> 
endscript


script SE_FlyingDroid_Fast 
    Car_Generic01 nosound TurnDist = 20 DefaultSpeed = 30 <...> 
endscript


script SE_Train 
    obj_sticktoground Off
    obj_setpathvelocity 200 mph
    obj_setpathturndist 10
    obj_pathheading on
    obj_followpathlinked orient
    obj_playsound SK6_SE_ConveyorLoop_11 dropoff = 200
endscript


script SE_Bird 
    obj_shadowoff
    Obj_ClearExceptions
    Obj_SetException Ex = objectinradius scr = SE_Bird_Fly
    obj_setinnerradius 15
    begin 
    Obj_CycleAnim anim = idle numCycles = Random (@ 3 @ 4 @ 5 @ 6 @ 7 @ 8 @ 9 @ 10)
    Obj_CycleAnim anim = Flyhop numCycles = Random (@ 1 @ 2 @ 3)
    repeat 
endscript


script SE_Bird_Fly 
    Obj_ClearExceptions
    Obj_PlayAnim anim = Fly Cycle
    obj_movetorelpos (0.0, 250.0, 0.0) Speed = 12 acceleration = 2
    Obj_WaitMove
    obj_setouterradius 20
    Obj_SetException Ex = objectoutofradius scr = SE_Bird_Return
endscript


script SE_Bird_Return 
    Obj_ClearExceptions
    Obj_PlayAnim anim = Fly Cycle
    obj_movetorelpos (0.0, -250.0, 0.0) Speed = 8 acceleration = 2
    Obj_WaitMove
    goto SE_Bird
endscript


script SE_Bird2 
    obj_shadowoff
    Obj_ClearExceptions
    Obj_SetException Ex = objectinradius scr = SE_Bird2_Fly
    obj_setinnerradius 10
    begin 
    Obj_CycleAnim anim = idle numCycles = Random (@ 3 @ 4 @ 5 @ 6 @ 7 @ 8 @ 9 @ 10)
    Obj_CycleAnim anim = Flyhop numCycles = Random (@ 1 @ 2 @ 3)
    repeat 
endscript


script SE_Bird2_Fly 
    Obj_ClearExceptions
    Obj_PlayAnim anim = Fly Cycle
    obj_movetorelpos (0.0, 250.0, 0.0) Speed = 12 acceleration = 2
    Obj_WaitMove
    obj_setouterradius 15
    Obj_SetException Ex = objectoutofradius scr = SE_Bird2_Return
endscript


script SE_Bird2_Return 
    Obj_ClearExceptions
    Obj_PlayAnim anim = Fly Cycle
    obj_movetorelpos (0.0, -250.0, 0.0) Speed = 8 acceleration = 2
    Obj_WaitMove
    goto SE_Bird2
endscript


script SE_FrontGateSpeedBoost 
    GetTriggerArray walk onto
    if triggertype <trigger_array>
    else
        GetTriggerArray [{ skate Off }{ jump Off }]
        if triggertype <trigger_array>
            trigger_speed_boost Speed = 1600 DefSkaterVO = 1
            printf 'TSC-----------------SpeedBoost 1 Successful'
        else
            printf 'TSC-----------------SpeedBoost 1 Failed'
        endif
    endif
endscript


script SE_SpeedBoost_01 
    GetTriggerArray walk onto
    if triggertype <trigger_array>
    else
        GetTriggerArray [{ skate Off }{ jump Off }]
        if triggertype <trigger_array>
            trigger_speed_boost Speed = 1100 DefSkaterVO = 1
            printf 'TSC-----------------SpeedBoost 1 Successful'
        else
            printf 'TSC-----------------SpeedBoost 1 Failed'
        endif
    endif
endscript


script SE_SpeedBoost_04 
    GetTriggerArray walk onto
    if triggertype <trigger_array>
    else
        GetTriggerArray [{ skate Off }{ jump Off }]
        if triggertype <trigger_array>
            trigger_speed_boost Speed = 1100 DefSkaterVO = 1
            printf 'TSC-----------------SpeedBoost 4 Successful'
        else
            printf 'TSC-----------------SpeedBoost 4 Failed'
        endif
    endif
endscript


script SE_SpeedBoost_05 
    GetTriggerArray walk onto
    if triggertype <trigger_array>
    else
        GetTriggerArray [{ skate Off }{ jump Off }]
        if triggertype <trigger_array>
            trigger_speed_boost Speed = 1800 DefSkaterVO = 1
            printf 'TSC-----------------SpeedBoost 5 Successful'
        else
            printf 'TSC-----------------SpeedBoost 5 Failed'
        endif
    endif
endscript


script SE_HellPlatformTransfer 
    GetTriggerArray walk onto
    if triggertype <trigger_array>
    else
        GetTriggerArray [{ skate Off }{ jump Off }]
        if triggertype <trigger_array>
            trigger_speed_boost Speed = 1100 DefSkaterVO = 1
            printf 'TSC-----------------SpeedBoost 4 Successful'
        else
            printf 'TSC-----------------SpeedBoost 4 Failed'
        endif
    endif
endscript


script SE_SpeedBoost_TemplePillars 
    GetTriggerArray walk onto
    if triggertype <trigger_array>
    else
        GetTriggerArray [{ skate Off }{ jump Off }]
        if triggertype <trigger_array>
            trigger_speed_boost Speed = 1000 DefSkaterVO = 1
        else
        endif
    endif
endscript


script SE_Teleport 
    TeleportSkaterToNode nodeName = <node> orient
endscript


script SE_TempleMenu 
    change menu3d_subicon = Temple
    set_se2_ambient_zone zone = Temple
    SE_SFX_Stop_All_Warping_Looping_Sounds
    if GetFlag flag = TempleToSpaceVisible
        SpawnSound SE_SFX_MayanToSpacePortal
    endif
    if GetFlag flag = TempleToHellVisible
        SpawnSound SE_SFX_MayanToHellPortal
    endif
endscript


script SE_SpaceportMenu 
    change menu3d_subicon = spaceport
    set_se2_ambient_zone zone = spaceport
    SE_SFX_Stop_All_Warping_Looping_Sounds
    if GetFlag flag = SpaceToTempleVisible
        SpawnSound SE_SFX_SpaceToMayanPortal
    endif
    if GetFlag flag = SpaceToHellVisible
        SpawnSound SE_SFX_SpaceToHellPortal
    endif
endscript


script SE_HellMenu 
    change menu3d_subicon = hell
    set_se2_ambient_zone zone = hell
    SE_SFX_Stop_All_Warping_Looping_Sounds
    if GetFlag flag = HellToTempleVisible
        SpawnSound SE_SFX_HellToMayanPortal
    endif
    if GetFlag flag = HellToSpaceVisible
        SpawnSound SE_SFX_HellToSpacePortal
    endif
endscript


script SE_HoveringLight 
    begin 
    obj_movetonode name = <NodeA> Speed = 1
    Obj_WaitMove
    obj_movetonode name = <NodeB> Speed = 1
    Obj_WaitMove
    repeat 
endscript


script SE_Idol_Text 
    <IdolsDefaced> = 0
    if GetFlag flag = Idol01
        <IdolsDefaced> = (<IdolsDefaced> + 1)
    endif
    if GetFlag flag = Idol02
        <IdolsDefaced> = (<IdolsDefaced> + 1)
    endif
    if GetFlag flag = Idol03
        <IdolsDefaced> = (<IdolsDefaced> + 1)
    endif
    if GetFlag flag = Idol04
        <IdolsDefaced> = (<IdolsDefaced> + 1)
    endif
    if GetFlag flag = Idol05
        <IdolsDefaced> = (<IdolsDefaced> + 1)
    endif
    switch <IdolsDefaced>
        case 0
        case 1
        create_panel_message {id = current_goal text = '1 of 5 Idols Defaced!' style = goal_collect_text}
        case 2
        create_panel_message {id = current_goal text = '2 of 5 Idols Defaced!' style = goal_collect_text}
        case 3
        create_panel_message {id = current_goal text = '3 of 5 Idols Defaced!' style = goal_collect_text}
        case 4
        create_panel_message {id = current_goal text = '4 of 5 Idols Defaced!' style = goal_collect_text}
        case 5
        create_panel_message {id = current_goal text = '5 of 5 Idols Defaced!' style = goal_collect_text}
        default 
    endswitch
endscript


script SE_Graf_Idol01 
    if NOT InMultiPlayerGame
        GetTriggerArray graffiti onto
        if triggertype <trigger_array>
            if NOT GetFlag flag = Idol01
                printf 'Graffiti 01'
                SetFlag flag = Idol01
                SE_Idol_Text
                if GetFlag flag = Idol02
                    if GetFlag flag = Idol03
                        if GetFlag flag = Idol04
                            if GetFlag flag = Idol05
                                ShakeCamera {
                                    duration = 4.500
                                    vert_amp = 5.0
                                    horiz_amp = 3.0
                                    vert_vel = 10.27
                                    horiz_vel = 5.920}
                                wait 0.5000 seconds
                                SE_IdolsCompleted
                            endif
                        endif
                    endif
                endif
            endif
        endif
    endif
endscript


script SE_Graf_Idol02 
    if NOT InMultiPlayerGame
        GetTriggerArray graffiti onto
        if triggertype <trigger_array>
            if NOT GetFlag flag = Idol02
                printf 'Graffiti 02'
                SetFlag flag = Idol02
                SE_Idol_Text
                if GetFlag flag = Idol01
                    if GetFlag flag = Idol03
                        if GetFlag flag = Idol04
                            if GetFlag flag = Idol05
                                ShakeCamera {
                                    duration = 4.500
                                    vert_amp = 5.0
                                    horiz_amp = 3.0
                                    vert_vel = 10.27
                                    horiz_vel = 5.920}
                                wait 0.5000 seconds
                                SE_IdolsCompleted
                            endif
                        endif
                    endif
                endif
            endif
        endif
    endif
endscript


script SE_Graf_Idol03 
    if NOT InMultiPlayerGame
        GetTriggerArray graffiti onto
        if triggertype <trigger_array>
            if NOT GetFlag flag = Idol03
                printf 'Graffiti 03'
                SetFlag flag = Idol03
                SE_Idol_Text
                if GetFlag flag = Idol01
                    if GetFlag flag = Idol02
                        if GetFlag flag = Idol04
                            if GetFlag flag = Idol05
                                ShakeCamera {
                                    duration = 4.500
                                    vert_amp = 5.0
                                    horiz_amp = 3.0
                                    vert_vel = 10.27
                                    horiz_vel = 5.920}
                                wait 0.5000 seconds
                                SE_IdolsCompleted
                            endif
                        endif
                    endif
                endif
            endif
        endif
    endif
endscript


script SE_Graf_Idol04 
    if NOT InMultiPlayerGame
        GetTriggerArray graffiti onto
        if triggertype <trigger_array>
            if NOT GetFlag flag = Idol04
                printf 'Graffiti 04'
                SetFlag flag = Idol04
                SE_Idol_Text
                if GetFlag flag = Idol01
                    if GetFlag flag = Idol02
                        if GetFlag flag = Idol03
                            if GetFlag flag = Idol05
                                ShakeCamera {
                                    duration = 4.500
                                    vert_amp = 5.0
                                    horiz_amp = 3.0
                                    vert_vel = 10.27
                                    horiz_vel = 5.920}
                                wait 0.5000 seconds
                                SE_IdolsCompleted
                            endif
                        endif
                    endif
                endif
            endif
        endif
    endif
endscript


script SE_Graf_Idol05 
    if NOT InMultiPlayerGame
        GetTriggerArray graffiti onto
        if triggertype <trigger_array>
            if NOT GetFlag flag = Idol05
                printf 'Graffiti 05'
                SetFlag flag = Idol05
                SE_Idol_Text
                if GetFlag flag = Idol01
                    if GetFlag flag = Idol02
                        if GetFlag flag = Idol03
                            if GetFlag flag = Idol04
                                ShakeCamera {
                                    duration = 4.500
                                    vert_amp = 5.0
                                    horiz_amp = 3.0
                                    vert_vel = 10.27
                                    horiz_vel = 5.920}
                                wait 0.5000 seconds
                                SE_IdolsCompleted
                            endif
                        endif
                    endif
                endif
            endif
        endif
    endif
endscript


script SE_IdolsCompleted 
    Kill prefix = 'GEO_PreEvent_GatesToHell'
    Kill prefix = 'TRG_PreEvent_GatesToHell'
    Create prefix = 'GEO_PostEvent_GatesToHell'
    Create prefix = 'TRG_PostEvent_GatesToHell'
    SpawnSound SE_SFX_MayanToHellPortal
    SetFlag flag = TempleToHellVisible
    SetFlag flag = Idol01
    SetFlag flag = Idol02
    SetFlag flag = Idol03
    SetFlag flag = Idol04
    SetFlag flag = Idol05
    PlaySkaterCamAnim {virtual_cam
        TargetID = world
        targetOffset = (-6985.7998046875, -3232.0, -1979.9000244140625)
        positionOffset = (-110.5, 261.70001220703125, -8345.5)
        frames = 240
        skippable = 0}
    Kill name = TRG_Ped_Hint_Mayan
    wait 1 second
    create_panel_message {text = 'BURN IN HELL!!!' style = goal_collect_text}
endscript


script SE_Rib01_Liptrick 
    GetTriggerArray lip
    if triggertype <trigger_array>
        SetException Ex = SkaterExitLip scr = SE_Rib01_LiptrickB group = RibGroup
        SetException Ex = SkaterBailed scr = SE_Rib_Bailed group = RibGroup
        Block
    endif
endscript


script SE_Rib01_LiptrickB 
    printf 'TSC------------------------RIB 01 has been lip tricked on'
    wait 1 second
    Kill name = GEO_PreEvent_Rib_Rib_001
    Kill name = TRG_PreEvent_Rib_RailNode_001A
    Kill name = TRG_PreEvent_Rib_RailNode_001B
    Kill name = TRG_PreEvent_Rib_RailNode_265
    Kill name = TRG_PreEvent_Rib_RailNode_A
    Kill name = TRG_PreEvent_Rib_RailNode_B
    Kill name = GEO_PreEvent_Rib_QP_01
    Create name = GEO_PostEvent_Rib_QPKicker_02
    Create name = GEO_PostEvent_Rib_Rib_001
    Create name = TRG_PostEvent_Rib_RailNode_001A
    Create name = TRG_PostEvent_Rib_RailNode_001B
endscript


script SE_Rib02_Liptrick 
    GetTriggerArray lip
    if triggertype <trigger_array>
        SetException Ex = SkaterExitLip scr = SE_Rib02_LiptrickB group = RibGroup
        SetException Ex = SkaterBailed scr = SE_Rib_Bailed group = RibGroup
        Block
    endif
endscript


script SE_Rib_Bailed 
    ClearExceptionGroup RibGroup
endscript


script SE_Rib02_LiptrickB 
    printf 'TSC------------------------RIB 02 has been lip tricked on'
    wait 1 second
    Kill name = GEO_PreEvent_Rib_Rib_002
    Kill name = TRG_PreEvent_Rib_RailNode_002A
    Kill name = TRG_PreEvent_Rib_RailNode_002B
    Kill name = TRG_PreEvent_Rib_RailNode_268
    Kill name = TRG_PreEvent_Rib_RailNode_C
    Kill name = TRG_PreEvent_Rib_RailNode_D
    Kill name = GEO_PreEvent_Rib_QP_03
    Create name = GEO_PostEvent_Rib_QPKicker_01
    Create name = GEO_PostEvent_Rib_Rib_002
    Create name = TRG_PostEvent_Rib_RailNode_002A
    Create name = TRG_PostEvent_Rib_RailNode_002B
endscript


script SE_Rib_Button01_WallPlant 
    GetTriggerArray wallplant onto
    if triggertype <trigger_array>
        SendException RIBBUTTON01_PUSH name = TRG_Rib_Button01_Ghost
    endif
endscript


script SE_Rib_Button01_Ghost 
    Obj_ClearExceptions
    Obj_SetException Ex = RIBBUTTON01_PUSH scr = SE_Rib_Button01_Push
endscript


script SE_Rib_Button01_Push 
    if IsAlive name = GEO_PreEvent_Rib_Button01
        printf 'TSC------------------------RIB BUTTON 01 is raised...so now press.'
        Kill name = GEO_PreEvent_Rib_Button01
        Kill name = JG_Hell_ButtonShadow02
        SetFlag flag = RibButton01
        if GetFlag flag = RibButton02
            wait 0.5000 second
            printf 'TSC------------------------RIB BUTTON 02 is also pressed...so now open Lounge Portal'
            goto SE_LevelEvent_Lounge
        endif
    endif
endscript


script SE_Rib_Button02_WallPlant 
    GetTriggerArray wallplant onto
    if triggertype <trigger_array>
        SendException RIBBUTTON02_PUSH name = TRG_Rib_Button02_Ghost
    endif
endscript


script SE_Rib_Button02_Ghost 
    Obj_ClearExceptions
    Obj_SetException Ex = RIBBUTTON02_PUSH scr = SE_Rib_Button02_Push
endscript


script SE_Rib_Button02_Push 
    if IsAlive name = GEO_PreEvent_Rib_Button02
        printf 'TSC------------------------RIB BUTTON 02 is raised...so now press.'
        Kill name = GEO_PreEvent_Rib_Button02
        Kill name = JG_Hell_ButtonShadow01
        SetFlag flag = RibButton02
        if GetFlag flag = RibButton01
            wait 0.5000 second
            printf 'TSC------------------------RIB BUTTON 01 is also pressed...so now open Lounge Portal'
            goto SE_LevelEvent_Lounge
        endif
    endif
endscript


script SE_SpacePortButton01_WallPlant 
    if NOT InMultiPlayerGame
        GetTriggerArray wallplant onto
        if triggertype <trigger_array>
            SendException SPACEPORTBUTTON01_PUSH name = TRG_Spaceship_RedButton01_Ghost
        endif
    endif
endscript


script SE_SpacePortButton01_Ghost 
    Obj_ClearExceptions
    Obj_SetException Ex = SPACEPORTBUTTON01_PUSH scr = SE_SpacePortButton01_Push
endscript


script SE_SpacePortButton01_Push 
    if IsAlive name = GEO_PreEvent_Spaceship_RedButton01
        SpawnSound SE_SFX_IgniteEngine01
        printf 'TSC------------------------RED BUTTON 01 is raised...so now press.'
        Create name = GEO_PostEvent_Spaceship_GreenButton01
        Kill name = GEO_PreEvent_Spaceship_RedButton01
        printf '1_2'
        CreateFastParticleSystem name = thrusterR1 params_script = apm_SP_thrusrter01_fast_particle_params attachobjid = GEO_PreEvent_SpaceShip_Ship_01
        CreateFastParticleSystem name = thrusterR2 params_script = apm_SP_thrusrter02_fast_particle_params attachobjid = GEO_PreEvent_SpaceShip_Ship_01
        SetFlag flag = RedButton01
        if GetFlag flag = RedButton02
            printf 'TSC------------------------RED BUTTON 02 is also pressed...so now prepare for launch'
            Kill name = TRG_Ped_Hint_Space
            goto SE_LevelEvent_Spaceship
        endif
    endif
endscript


script SE_SpacePortButton02_WallPlant 
    if NOT InMultiPlayerGame
        GetTriggerArray wallplant onto
        if triggertype <trigger_array>
            SendException SPACEPORTBUTTON02_PUSH name = TRG_Spaceship_RedButton02_Ghost
        endif
    endif
endscript


script SE_SpacePortButton02_Ghost 
    Obj_ClearExceptions
    Obj_SetException Ex = SPACEPORTBUTTON02_PUSH scr = SE_SpacePortButton02_Push
endscript


script SE_SpacePortButton02_Push 
    if IsAlive name = GEO_PreEvent_Spaceship_RedButton02
        SpawnSound SE_SFX_IgniteEngine02
        printf 'TSC------------------------RED BUTTON 02 is raised...so now press.'
        Create name = GEO_PostEvent_Spaceship_GreenButton02
        printf '3_4'
        CreateFastParticleSystem name = thrusterL1 params_script = apm_SP_thrusrter03_fast_particle_params attachobjid = GEO_PreEvent_SpaceShip_Ship_01
        CreateFastParticleSystem name = thrusterL2 params_script = apm_SP_thrusrter04_fast_particle_params attachobjid = GEO_PreEvent_SpaceShip_Ship_01
        Kill name = GEO_PreEvent_Spaceship_RedButton02
        SetFlag flag = RedButton02
        if GetFlag flag = RedButton01
            printf 'TSC------------------------RED BUTTON 01 is also pressed...so now prepare for launch'
            Kill name = TRG_Ped_Hint_Space
            goto SE_LevelEvent_Spaceship
        endif
    endif
endscript


script SE_BoulderRope01_Grind 
    if IsAlive name = GEO_PreEvent_Boulder_Rope_01
        printf 'TSC---------------------------------Rope 01 has been snapped!'
        SpawnSound SE_SFX_RopeBreak01
        Kill name = GEO_PreEvent_Boulder_Rope_01
        SetFlag flag = Rope01
        if GetFlag flag = Rope02
            printf 'TSC------------------------Rope 02 has also been snapped...so now run level event'
            wait 1 seconds
            Kill name = TRG_Ped_Hint_Tikiman
            goto SE_LevelEvent_Boulder
        endif
    endif
endscript


script SE_BoulderRope02_Grind 
    if IsAlive name = GEO_PreEvent_Boulder_Rope_02
        printf 'TSC---------------------------------Rope 02 has been snapped!'
        SpawnSound SE_SFX_RopeBreak02
        Kill name = GEO_PreEvent_Boulder_Rope_02
        SetFlag flag = Rope02
        if GetFlag flag = Rope01
            printf 'TSC------------------------Rope 01 has also been snapped...so now run level event'
            wait 1 seconds
            Kill name = TRG_Ped_Hint_Tikiman
            goto SE_LevelEvent_Boulder
        endif
    endif
endscript


script SE_Event_GatesToHell_PreNode 
    if NOT InMultiPlayerGame
        create_panel_message {text = 'The Monkey Gods have been appeased. The portals to Hell are now closed.' style = goal_collect_text}
        Kill prefix = 'GEO_PostEvent_GatesToHell'
        Kill prefix = 'TRG_PostEvent_GatesToHell'
        Create prefix = 'GEO_PreEvent_GatesToHell'
        Create prefix = 'TRG_PreEvent_GatesToHell'
        UnSetFlag flag = Idol01
        UnSetFlag flag = Idol02
        UnSetFlag flag = Idol03
        UnSetFlag flag = Idol04
        UnSetFlag flag = Idol05
    endif
endscript


script SE_Event_GatesToHell_PostNode 
    if NOT InMultiPlayerGame
        create_panel_message {text = 'BURN IN HELL!!!' style = goal_collect_text}
        Kill prefix = 'GEO_PreEvent_GatesToHell'
        Kill prefix = 'TRG_PreEvent_GatesToHell'
        Create prefix = 'GEO_PostEvent_GatesToHell'
        Create prefix = 'TRG_PostEvent_GatesToHell'
        SetFlag flag = Idol01
        SetFlag flag = Idol02
        SetFlag flag = Idol03
        SetFlag flag = Idol04
        SetFlag flag = Idol05
    endif
endscript


script SE_LevelEvent_Lounge 
    printf 'TSC------------------------Lounge Portal has been opened'
    Kill name = GEO_PreEvent_Rib_LoungeQP_001
    Kill name = GEO_PreEvent_Rib_Mouth
    Kill name = GEO_PreEvent_Rib_Tongue
    Kill name = TRG_Ped_Hint_Hell
    Create name = GEO_PostEvent_Rib_Tongue
    Create name = GEO_PostEvent_Rib_Mouth
    Create name = TRG_PostEvent_Rib_TeleportPlane_01
    Create name = GEO_PostEvent_Rib_LoungeKicker_001
    SetFlag flag = RibButton01
    SetFlag flag = RibButton02
    PlayCutscene name = 'CutScenes\SE_SmallEvent_Satan.cut' RestartNode = TRG_Hell_PostEvent_Restart
endscript


script SE_Event_Rib_PreNode 
    if NOT InMultiPlayerGame
        create_panel_message {text = 'The Lounge Portal has not been opened yet.' style = goal_collect_text}
        Kill prefix = 'GEO_PostEvent_Rib'
        Kill prefix = 'TRG_PostEvent_Rib'
        Create prefix = 'GEO_PreEvent_Rib'
        Create prefix = 'TRG_PreEvent_Rib'
        UnSetFlag flag = RibButton01
        UnSetFlag flag = RibButton02
    endif
endscript


script SE_Event_Rib_PostNode 
    if NOT InMultiPlayerGame
        create_panel_message {text = 'The Lounge Portal has been opened.' style = goal_collect_text}
        Kill prefix = 'GEO_PreEvent_Rib'
        Kill prefix = 'TRG_PreEvent_Rib'
        Create prefix = 'GEO_PostEvent_Rib'
        Create prefix = 'TRG_PostEvent_Rib'
        SetFlag flag = RibButton01
        SetFlag flag = RibButton02
    endif
endscript


script SE_LevelEvent_Spaceship 
    DestroyFastParticleSystem name = SP_shiphover
    DestroyFastParticleSystem name = thrusterL1
    DestroyFastParticleSystem name = thrusterL2
    DestroyFastParticleSystem name = thrusterR1
    DestroyFastParticleSystem name = thrusterR2
    Kill prefix = 'GEO_PreEvent_Spaceship'
    Kill prefix = 'TRG_PreEvent_Spaceship'
    Create prefix = 'GEO_PostEvent_Spaceship'
    Create prefix = 'TRG_PostEvent_Spaceship'
    SetFlag flag = SpaceToTempleVisible
    SetFlag flag = TempleToSpaceVisible
    SpawnScript SE_SFX_SpaceToMayanPortal
    PlayCutscene name = 'CutScenes\SE_SmallEvent_Spaceship.Cut' RestartNode = TRG_SpacePort_Restart_LevelEvent_Spaceship
endscript


script SE_Event_Spaceship_PreNode 
    create_panel_message {text = 'The Spaceship has not taken off yet.' style = goal_collect_text}
    Kill prefix = 'GEO_PostEvent_Spaceship'
    Kill prefix = 'TRG_PostEvent_Spaceship'
    Create prefix = 'GEO_PreEvent_Spaceship'
    Create prefix = 'TRG_PreEvent_Spaceship'
    CreateFastParticleSystem name = SP_shiphover
endscript


script SE_Event_Spaceship_PostNode 
    create_panel_message {text = 'The Spaceship has left the building.' style = goal_collect_text}
    DestroyFastParticleSystem name = SP_shiphover
    Kill prefix = 'GEO_PreEvent_Spaceship'
    Kill prefix = 'TRG_PreEvent_Spaceship'
    Create prefix = 'GEO_PostEvent_Spaceship'
    Create prefix = 'TRG_PostEvent_Spaceship'
endscript


script SE_LevelEvent_Boulder 
    Kill prefix = 'GEO_PreEvent_Boulder'
    Kill prefix = 'TRG_PreEvent_Boulder'
    Create prefix = 'GEO_PostEvent_Boulder'
    Create prefix = 'TRG_PostEvent_Boulder'
    PlayCutscene name = 'CutScenes\SE_LevelEvent.Cut' RestartNode = TRG_Temple_Restart_LevelEvent_Boulder
endscript


script SE_Event_Boulder_PreNode 
    create_panel_message {text = 'The Boulder has not fallen yet.' style = goal_collect_text}
    Kill prefix = 'GEO_PostEvent_Boulder'
    Kill prefix = 'TRG_PostEvent_Boulder'
    Create prefix = 'GEO_PreEvent_Boulder'
    Create prefix = 'TRG_PreEvent_Boulder'
endscript


script SE_Event_Boulder_PostNode 
    create_panel_message {text = 'The Boulder has fallen and cracked through the floor!' style = goal_collect_text}
    Kill prefix = 'GEO_PreEvent_Boulder'
    Kill prefix = 'TRG_PreEvent_Boulder'
    Create prefix = 'GEO_PostEvent_Boulder'
    Create prefix = 'TRG_PostEvent_Boulder'
endscript


script SE_ElevatorDoor_LowerLeft 
    Obj_ClearExceptions
    Obj_SetException Ex = open scr = SE_ElevatorDoor_LowerLeft_Open params = <...> 
    Obj_SetException Ex = close scr = SE_ElevatorDoor_LowerLeft_Close params = <...> 
endscript


script SE_ElevatorDoor_LowerLeft_Open 
    printf 'TSC-----------------Lower Left Elevator Door is Opening'
    obj_movetonode name = TRG_ElevatorDoor_LowerLeft_Open Speed = 15
    Obj_WaitMove
endscript


script SE_ElevatorDoor_LowerLeft_Close 
    printf 'TSC-----------------Lower Left Elevator Door is Closing'
    obj_movetonode name = TRG_ElevatorDoor_LowerLeft_Closed Speed = 15
    Obj_WaitMove
endscript


script SE_ElevatorDoor_LowerRight 
    Obj_ClearExceptions
    Obj_SetException Ex = open scr = SE_ElevatorDoor_LowerRight_Open params = <...> 
    Obj_SetException Ex = close scr = SE_ElevatorDoor_LowerRight_Close params = <...> 
endscript


script SE_ElevatorDoor_LowerRight_Open 
    printf 'TSC-----------------Lower Right Elevator Door is Opening'
    obj_movetonode name = TRG_ElevatorDoor_LowerRight_Open Speed = 15
    Obj_WaitMove
endscript


script SE_ElevatorDoor_LowerRight_Close 
    printf 'TSC-----------------Lower Right Elevator Door is Closing'
    obj_movetonode name = TRG_ElevatorDoor_LowerRight_Closed Speed = 15
    Obj_WaitMove
endscript


script SE_ElevatorDoor_UpperLeft 
    Obj_ClearExceptions
    Obj_SetException Ex = open scr = SE_ElevatorDoor_UpperLeft_Open params = <...> 
    Obj_SetException Ex = close scr = SE_ElevatorDoor_UpperLeft_Close params = <...> 
endscript


script SE_ElevatorDoor_UpperLeft_Open 
    printf 'TSC-----------------Upper Left Elevator Door is Opening'
    obj_movetonode name = TRG_ElevatorDoor_UpperLeft_Open Speed = 15
    Obj_WaitMove
endscript


script SE_ElevatorDoor_UpperLeft_Close 
    printf 'TSC-----------------Upper Left Elevator Door is Closing'
    obj_movetonode name = TRG_ElevatorDoor_UpperLeft_Closed Speed = 15
    Obj_WaitMove
endscript


script SE_ElevatorDoor_UpperRight 
    Obj_ClearExceptions
    Obj_SetException Ex = open scr = SE_ElevatorDoor_UpperRight_Open params = <...> 
    Obj_SetException Ex = close scr = SE_ElevatorDoor_UpperRight_Close params = <...> 
endscript


script SE_ElevatorDoor_UpperRight_Open 
    printf 'TSC-----------------Upper Right Elevator Door is Opening'
    obj_movetonode name = TRG_ElevatorDoor_UpperRight_Open Speed = 15
    Obj_WaitMove
endscript


script SE_ElevatorDoor_UpperRight_Close 
    printf 'TSC-----------------Upper Right Elevator Door is Closing'
    obj_movetonode name = TRG_ElevatorDoor_UpperRight_Closed Speed = 15
    Obj_WaitMove
endscript


script SE_Elevator_001 
    Obj_ClearExceptions
    Obj_SetException Ex = GoUp scr = SE_Elevator_001_Raise params = <...> 
    Obj_SetException Ex = GoDown scr = SE_Elevator_001_Lower params = <...> 
endscript


script SE_Elevator_001_PlayerApproachesTop 
    if GetFlag flag = ElevatorIsUp
        printf 'TSC-----------------Got Flag -- Elevator is Up already, opening doors'
        SendException open name = GEO_ElevatorDoor_UpperLeft
        SendException open name = GEO_ElevatorDoor_UpperRight
    else
        if GetFlag flag = ElevatorIsGoingUp
            printf 'TSC-----------------Got Flag -- Elevator is on its way up up, doing nothing'
        else
            printf 'TSC-----------------Didn\'t get Up or GoingUp Flags, elevator is starting on its way Up'
            UnSetFlag flag = ElevatorIsDown
            UnSetFlag flag = ElevatorIsUp
            UnSetFlag flag = ElevatorIsGoingDown
            SetFlag flag = ElevatorIsGoingUp
            printf 'TSC-----------------Sending GoUp Exception'
            SendException GoUp name = GEO_Spaceport_Elevator_001
        endif
    endif
endscript


script SE_Elevator_001_Raise 
    wait 1 second
    SendException close name = GEO_ElevatorDoor_LowerLeft
    SendException close name = GEO_ElevatorDoor_LowerRight
    wait 1 second
    printf 'TSC-----------------Elevator Rising'
    obj_movetonode name = TRG_SpacePort_Elevator001_B Speed = 25
    Obj_WaitMove
    UnSetFlag flag = ElevatorIsDown
    UnSetFlag flag = ElevatorIsGoingUp
    UnSetFlag flag = ElevatorIsGoingDown
    printf 'TSC-----------------Set Up Flag'
    SetFlag flag = ElevatorIsUp
    SendException open name = GEO_ElevatorDoor_UpperLeft
    SendException open name = GEO_ElevatorDoor_UpperRight
endscript


script SE_Elevator_001_EnterTop 
    wait 1 second
    SendException close name = GEO_ElevatorDoor_UpperLeft
    SendException close name = GEO_ElevatorDoor_UpperRight
    wait 1 second
    UnSetFlag flag = ElevatorIsUp
    UnSetFlag flag = ElevatorIsGoingUp
    UnSetFlag flag = ElevatorIsDown
    SetFlag flag = ElevatorIsGoingDown
    SendException GoDown name = GEO_Spaceport_Elevator_001
    printf 'TSC-----------------Sending GoDown Exception'
endscript


script SE_Elevator_001_Lower 
    wait 1 second
    SendException close name = GEO_ElevatorDoor_UpperLeft
    SendException close name = GEO_ElevatorDoor_UpperRight
    wait 1 second
    printf 'TSC-----------------Elevator Lowering'
    obj_movetonode name = TRG_SpacePort_Elevator001_A Speed = 25
    Obj_WaitMove
    UnSetFlag flag = ElevatorIsGoingUp
    UnSetFlag flag = ElevatorIsUp
    UnSetFlag flag = ElevatorIsGoingDown
    printf 'TSC-----------------Set Down Flag'
    SetFlag flag = ElevatorIsDown
    SendException open name = GEO_ElevatorDoor_LowerLeft
    SendException open name = GEO_ElevatorDoor_LowerRight
endscript


script SE_Elevator_001_EnterBottom 
    printf 'TSC-----------------Didn\'t get Up Flag, starting Up'
    wait 1 second
    SendException close name = GEO_ElevatorDoor_LowerLeft
    SendException close name = GEO_ElevatorDoor_LowerRight
    wait 1 second
    UnSetFlag flag = ElevatorIsUp
    UnSetFlag flag = ElevatorIsGoingDown
    UnSetFlag flag = ElevatorIsDown
    SetFlag flag = ElevatorIsGoingUp
    SendException GoUp name = GEO_Spaceport_Elevator_001
    printf 'TSC-----------------Sending GoUp Exception'
endscript


script SE_Elevator_001_PlayerApproachesBottom 
    if GetFlag flag = ElevatorIsDown
        printf 'TSC-----------------Got Flag -- Elevator is Down already, Opening Doors'
        SendException open name = GEO_ElevatorDoor_LowerLeft
        SendException open name = GEO_ElevatorDoor_LowerRight
    else
        if GetFlag flag = ElevatorIsGoingDown
            printf 'TSC-----------------Got Flag -- Elevator is on its way down already, doing nothing'
        else
            printf 'TSC-----------------Didn\'t get Down or GoingDown Flags, elevator is starting on its way Down'
            UnSetFlag flag = ElevatorIsGoingUp
            UnSetFlag flag = ElevatorIsUp
            UnSetFlag flag = ElevatorIsDown
            SetFlag flag = ElevatorIsGoingDown
            printf 'TSC-----------------Sending GoDown Exception'
            SendException GoDown name = GEO_Spaceport_Elevator_001
        endif
    endif
endscript

Elevator = {NodeA = TRG_SpacePort_Elevator001_A NodeB = TRG_SpacePort_Elevator001_B}

script SE_GapStart_RailHop 
    StartGap GapID = <id1> flags = [ PURE_AIR ]
endscript


script SE_GapEnd_RailHop 
    endgap GapID = <id1> Score = 25 text = 'Rail hop'
endscript


script SE_GapStart_Entry 
    StartGap GapID = <id1> flags = [ CANCEL_GROUND ]
endscript


script SE_GapEnd_Entry 
    endgap GapID = <id1> Score = 75 text = 'Clear the Entrance'
endscript


script SE_GapStart_Pillars 
endscript


script SE_GapEnd_Pillars 
endscript


script SE_GapStart_Pools 
    StartGap GapID = pools flags = [ CANCEL_GROUND REQUIRE_GRIND ]
endscript


script SE_GapEnd_Pools 
    endgap GapID = pools Score = 400 text = 'Hop the Pools'
endscript


script SE_GapStart_Platforms 
    StartGap GapID = Platforms flags = [ CANCEL_GROUND ]
endscript


script SE_GapEnd_Platforms 
    endgap GapID = Platforms Score = 350 text = 'Temple Platforms'
endscript


script SE_GapStart_Statue 
    StartGap GapID = <id1> flags = [ CANCEL_GROUND ]
endscript


script SE_GapEnd_Statue 
    endgap GapID = <id1> Score = 750 text = 'Monkey Transfer'
endscript


script SE_GapStart_LowerPools 
    StartGap GapID = <id1> flags = [ PURE_AIR ]
endscript


script SE_GapEnd_LowerPools 
    endgap GapID = <id1> Score = 600 text = 'Clear the Monkey'
endscript


script SE_GapStart_LowerPools2A 
    StartGap GapID = <id1> flags = [ PURE_AIR ]
endscript


script SE_GapEnd_LowerPools2A 
    endgap GapID = <id1> continue = SE_GapStart_LowerPools2B
endscript


script SE_GapStart_LowerPools2B 
    StartGap GapID = <id1> flags = [ PURE_AIR ]
endscript


script SE_GapEnd_LowerPools2B 
    endgap GapID = <id1> Score = 200 text = 'Double Monkey'
endscript


script SE_GapStart_Ramp 
    StartGap GapID = <id1> flags = [ PURE_AIR ]
endscript


script SE_GapEnd_Ramp 
    endgap GapID = <id1> Score = 100 text = 'Ramp Transfer'
endscript


script SE_GapStart_Columns 
    StartGap GapID = columns flags = [ PURE_AIR ]
endscript


script SE_GapEnd_Columns 
    endgap GapID = columns Score = 150 text = 'Spinal Columns'
endscript


script SE_GapStart_Columns2 
    StartGap GapID = Columns2 flags = [ PURE_AIR ]
endscript


script SE_GapEnd_Columns2 
    endgap GapID = Columns2 Score = 150 text = 'Spinal Columns'
endscript


script SE_GapStart_Portal 
    StartGap GapID = <id1> flags = [ CANCEL_GROUND ]
endscript


script SE_GapEnd_Portal 
    endgap GapID = <id1> Score = 50 text = 'Portal Hop'
endscript


script SE_GapStart_Rubble 
    StartGap GapID = Rubble flags = [ CANCEL_GROUND REQUIRE_GRIND ]
endscript


script SE_GapEnd_Rubble 
    endgap GapID = Rubble Score = 150 text = 'Rubble Jump'
endscript


script SE_GapStart_ColumnLip 
    StartGap GapID = ColumnLip flags = [ CANCEL_GROUND ]
endscript


script SE_GapEnd_ColumnLip 
    GetTriggerArray Lip_Onto
    if triggertype <trigger_array>
        endgap GapID = ColumnLip Score = 3500 text = 'Snake Acid Lip'
    endif
endscript


script SE_GapStart_Sword 
    StartGap GapID = <id1> flags = [ CANCEL_GROUND ]
endscript


script SE_GapEnd_Sword 
    GetTriggerArray Lip_Onto
    if triggertype <trigger_array>
        endgap GapID = <id1> Score = 750 text = 'Cutting Edge'
    endif
endscript


script SE_GapStart_WallTransfer 
    StartGap GapID = <id1> flags = [ PURE_AIR ]
endscript


script SE_GapEnd_WallTransfer 
    endgap GapID = <id1> Score = 50 text = 'Temple Wall Transfer'
endscript


script SE_GapStart_Rope 
endscript


script SE_GapEnd_Rope 
    GetTriggerArray Climb_onto
    if triggertype <trigger_array>
    endif
endscript


script SE_GapStart_LandingPad 
    StartGap GapID = LandingPad flags = [ PURE_AIR ]
endscript


script SE_GapEnd_LandingPad 
    endgap GapID = LandingPad Score = 2000 text = 'Spine Drop'
endscript


script SE_GapStart_Holo 
    StartGap GapID = Holo flags = [ CANCEL_GROUND ]
endscript


script SE_GapEnd_Holo 
    endgap GapID = Holo Score = 50 text = 'Holo Boy'
endscript


script SE_GapStart_Pit 
endscript


script SE_GapEnd_Pit 
endscript


script SE_GapStart_RailA 
    StartGap GapID = <id1> flags = [ PURE_AIR ]
endscript


script SE_GapEnd_RailA 
    endgap GapID = <id1> continue = SE_GapStart_RailB
endscript


script SE_GapStart_RailB 
    StartGap GapID = <id1> flags = [ PURE_AIR ]
endscript


script SE_GapEnd_RailB 
    endgap GapID = <id1> Score = 200 text = 'Triple Rail Skip'
endscript


script SE_GapStart_FrontDoor 
    StartGap GapID = <id1> flags = [ PURE_AIR ]
endscript


script SE_GapEnd_FrontDoor 
    endgap GapID = <id1> Score = 250 text = 'Space Leap'
endscript


script SE_GapStart_RailPlantA 
    StartGap GapID = <id1> flags = [ PURE_AIR ]
endscript


script SE_GapEnd_RailPlantA 
    endgap GapID = <id1> continue = SE_GapStart_RailPlantB
endscript


script SE_GapStart_RailPlantB 
    StartGap GapID = <id1> flags = [ PURE_AIR ]
endscript


script SE_GapEnd_RailPlantB 
    endgap GapID = <id1> Score = 75 text = 'Cable Plant'
endscript


script SE_GapStart_CableLip 
    StartGap GapID = <id1> flags = [ CANCEL_GROUND ]
endscript


script SE_GapEnd_CableLip 
    GetTriggerArray Lip_Onto
    if triggertype <trigger_array>
        endgap GapID = <id1> Score = 750 text = 'Cable Man'
    endif
endscript


script SE_GapStart_CraneHop 
endscript


script SE_GapEnd_CraneHop 
    if GetFlag flag = EnginesOn
    endif
endscript


script SE_GapStart_WireHop 
    StartGap GapID = <id1> flags = [ PURE_AIR ]
endscript


script SE_GapEnd_WireHop 
    if NOT GetFlag flag = EnginesOn
        endgap GapID = <id1> Score = 50 text = 'Craneless'
    endif
endscript


script SE_GapStart_PlatformSpine 
    StartGap GapID = <id1> flags = [ PURE_AIR ]
endscript


script SE_GapEnd_PlatformSpine 
    endgap GapID = <id1> Score = 40 text = 'Spine the Landing Pad'
endscript


script SE_GapStart_HangerTransfer 
    StartGap GapID = <id1> flags = [ PURE_AIR ]
endscript


script SE_GapEnd_HangerTransfer 
    endgap GapID = <id1> Score = 75 text = 'Clear the Fighter'
endscript


script SE_GapStart_RampTransfer2 
    StartGap GapID = <id1> flags = [ PURE_AIR ]
endscript


script SE_GapEnd_RampTransfer2 
    endgap GapID = <id1> Score = 75 text = 'Star Transfer'
endscript


script SE_GapStart_HighBeam 
    StartGap GapID = <id1> flags = [ PURE_AIR ]
endscript


script SE_GapEnd_HighBeam 
    endgap GapID = <id1> Score = 80 text = 'Hop the Hell Beams'
endscript


script SE_GapStart_HellPit 
    StartGap GapID = <id1> flags = [ PURE_AIR ]
endscript


script SE_GapEnd_HellPit 
    endgap GapID = <id1> Score = 175 text = 'Go to Hell'
endscript


script robosparks 
    if NOT InMultiPlayerGame
    endif
    begin 
    <random_droid_beep_sfx> = Random (@ TRG_Droid_01 @ TRG_Droid_02 @ TRG_Droid_03 @ TRG_Droid_04 @ TRG_Droid_05 @ TRG_Droid_06 @ TRG_Droid_08 @ TRG_Droid_09 @ TRG_Droid_10)
    wait 1 frame
    CreateFastParticleSystem name = SP_sparking01 params_script = apm_SE_Spark01_fast_particle_params attachobjid = TRG_Droid_08
    SpawnSound SE_SFX_Robot_Beeps params = { Robot = <random_droid_beep_sfx> }
    wait randomrange (10.0, 90.0) frames
    repeat 
endscript


script SE_particles 
    if NOT InMultiPlayerGame
        CreateFastParticleSystem name = SP_shiphover params_script = apm_SP_ShipHover01_fast_particle_params
        SP_shiphover ::obj_setposition position = (-351.0, -1550.0, -321.0)
    endif
endscript


script SE_2d_sign_element_create parent = menu3d_anchor
    if GetGlobalFlag flag = SCREEN_MODE_WIDE
        <Offset> = (-8.0, 0.0)
    else
        <Offset> = (0.0, 0.0)
    endif
    CreateScreenElement {
        type = SpriteElement
        parent = <parent>
        texture = SE_icon_1
        id = SE_hexagon
        Scale = 1.500
        rgba = [ 128 128 128 128 ]
        Pos = ((9.0, 148.0) + <Offset>)
        rot_angle = 0
        just = [ center center ]
        z_priority = -51
    }
    RunScriptOnScreenElement id = SE_hexagon SE_hexagon_anim
endscript


script SE_hexagon_anim 
    if ChecksumEquals a = (menu3d_subicon)b = spaceport
        hex_pos = (10.0, 290.0)
    else
        if ChecksumEquals a = (menu3d_subicon)b = Temple
            hex_pos = (150.0, 260.0)
        else
            hex_pos = (50.0, 163.0)
        endif
    endif
    begin 
    DoMorph time = 0 Pos = <hex_pos> time = 0 Scale = 3 alpha = 1
    DoMorph time = 1 Scale = 4.500 alpha = 0
    wait 0.7500 seconds
    repeat 
endscript

SECRET_StateLogic_Table = {
    SECRET_State_LoungeSinger_Laying = {
        script_ped_state = SECRET_STATECONTROL_LoungeSinger_Laying
        exit_state_action = wait_anim_finished
    }
    SECRET_State_LoungeSinger_Dance = {
        script_ped_state = SECRET_STATECONTROL_LoungeSinger_Dance
        exit_state_action = wait_anim_finished
    }
    STATE_getattention = {
        script_ped_state = SECRET_STATECONTROL_LoungeSinger_GetAttention
        exit_state_action = wait_anim_finished
    }
}
SECRET_Alien_Table = {
    SECRET_STATE_AlienIdle = {
        script_ped_state = SECRET_STATECONTROL_AlienIdle
    }
    STATE_Stand = {
        ped_update_type = no_move_update
        script_ped_state = SECRET_STATECONTROL_Alien_Stand
        exit_state_action = wait_anim_finished
    }
    STATE_getattention = {
        script_ped_state = SECRET_STATECONTROL_Alien_GetAttention
        exit_state_action = wait_anim_finished
    }
}

script SECRET_STATECONTROL_LoungeSinger_Laying 
    if (SE_SFX_LoungeSingerMusicStatus = 1)
        SpawnSound SE_SFX_LoungeSinger_Stop
    endif
    if NOT obj_animequals Ped_LoungeSinger_Hey
        PlayAnimWithPartialAnimIfExists anim = Ped_LoungeSinger_GetUp BlendPeriod = 1 backwards
        Obj_WaitAnimFinished
    endif
    if ScreenElementExists id = ped_speech_dialog
        speech_box_exit anchor_id = ped_speech_dialog
    endif
    if (SE_SFX_LoungeSingerMusicStatus = 1)
        SpawnScript SE_SFX_LoungeSinger_Stop02
    endif
    setup_ped_speech {ped_id = TRG_Ped_LoungeSinger
        inner_radius = 7
        outer_radius = 8
        accept_text = 'Press \m5 to Dance with the Devil.'
        activation_script = SECRET_Lounge_MusicPlay
        dont_deactivate_goals
    }
    Ped_Utils_SetMiscEventHandlers
    begin 
    Random (
        @*2 PlayAnimWithPartialAnimIfExists anim = Ped_LoungeSinger_LayIdle1
        @ PlayAnimWithPartialAnimIfExists anim = Ped_LoungeSinger_LayIdle2
    )
    Obj_WaitAnimFinished
    repeat 
endscript


script SECRET_STATECONTROL_LoungeSinger_GetAttention 
    begin 
    if NOT obj_objectinattentionradius
        break 
    endif
    PlayAnimWithPartialAnimIfExists anim = Ped_LoungeSinger_Hey
    Obj_WaitAnimFinished
    repeat 2
    Ped_Utils_SetMiscEventHandlers
    Ped_StateLogic_SetDefaultState
endscript


script SECRET_STATECONTROL_LoungeSinger_Dance 
    if (SE_SFX_LoungeSingerMusicStatus = 0)
        SpawnSound SE_SFX_LoungeSinger_Start
    endif
    PlayAnimWithPartialAnimIfExists anim = Ped_LoungeSinger_GetUp BlendPeriod = 1
    Obj_WaitAnimFinished
    if ScreenElementExists id = ped_speech_dialog
        speech_box_exit anchor_id = ped_speech_dialog
    endif
    if (SE_SFX_LoungeSingerMusicStatus = 0)
        SpawnScript SE_SFX_LoungeSinger_Start02
    endif
    setup_ped_speech {ped_id = TRG_Ped_LoungeSinger
        inner_radius = 7
        outer_radius = 8
        accept_text = 'Press \m5 to stop.'
        activation_script = SECRET_LOUNGE_MusicStop
        dont_deactivate_goals
    }
    begin 
    PlayAnimWithPartialAnimIfExists anim = Ped_LoungeSinger_Dance
    Obj_WaitAnimFinished
    repeat 
endscript


script SECRET_Lounge_MusicPlay 
    TRG_Ped_LoungeSinger ::Ped_StateLogic_RegisterTempDefaultState state = SECRET_State_LoungeSinger_Dance table = SECRET_StateLogic_Table
    TRG_Ped_LoungeSinger ::Ped_SetLogicState SECRET_State_LoungeSinger_Dance table = SECRET_StateLogic_Table
    UnpauseSkaters
endscript


script SECRET_LOUNGE_MusicStop 
    TRG_Ped_LoungeSinger ::Ped_StateLogic_RegisterTempDefaultState state = SECRET_State_LoungeSinger_Laying table = SECRET_StateLogic_Table
    TRG_Ped_LoungeSinger ::Ped_SetLogicState SECRET_State_LoungeSinger_Laying table = SECRET_StateLogic_Table
    UnpauseSkaters
endscript


script SECRET_STATECONTROL_AlienIdle 
    obj_setattentionradius 25
    PlayAnimWithPartialAnimIfExists anim = Ped_Alien_Idle Cycle
endscript


script SECRET_Alien_StartAvoid 
endscript


script SECRET_STATECONTROL_Alien_GetAttention 
    PlayAnimWithPartialAnimIfExists anim = Ped_Alien_Avoid
    Obj_WaitAnimFinished
    PlayAnimWithPartialAnimIfExists anim = Ped_Alien_Avoid_Idle Cycle
    begin 
    if NOT obj_objectinattentionradius
        PlayAnimWithPartialAnimIfExists anim = Ped_Alien_Avoid backwards
        Ped_Utils_SetMiscEventHandlers
        Ped_StateLogic_SetDefaultState
        return 
    endif
    wait 1 gameframe
    repeat 
endscript


script SE_SFX_Stop_All_Warping_Looping_Sounds 
    TRG_SFX_Ghost_SpaceToTempleWarp ::obj_stopsound
    TRG_SFX_Ghost_SpaceToTempleWarp ::obj_stopsound
    TRG_SFX_Ghost_SpaceToHellWarp ::obj_stopsound
    TRG_SFX_Ghost_SpaceToHellWarp ::obj_stopsound
    TRG_SFX_Ghost_TempleToSpaceWarp ::obj_stopsound
    TRG_SFX_Ghost_TempleToSpaceWarp ::obj_stopsound
    TRG_SFX_Ghost_TempleToHellWarp ::obj_stopsound
    TRG_SFX_Ghost_TempleToHellWarp ::obj_stopsound
    TRG_SFX_Ghost_HellToTempleWarp ::obj_stopsound
    TRG_SFX_Ghost_HellToTempleWarp ::obj_stopsound
    TRG_SFX_Ghost_HellToSpaceWarp ::obj_stopsound
    TRG_SFX_Ghost_HellToSpaceWarp ::obj_stopsound
endscript

