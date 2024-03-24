
script TestLevel_setup 
endscript


script TestLevel_Startup 
    animload_Ped_Driver
    animload_ped_baha
endscript


script TestLevel_LoadingSounds 
    LoadSound 'Skater\bitchslap2'
    LoadSound 'Shared\Hits\HitGlassPane2x'
    LoadSound 'Shared\Auto\LA_Skid_11' vol = 100 dropoff = 150
    LoadSound 'Shared\Auto\CarBrakeSqueal' vol = 100 dropoff = 150
    LoadSound 'Shared\Auto\CarLoop' vol = 100 dropoff = 150 PosUpdateWithDoppler
    LoadSound 'Shared\Auto\CarHorn_11' vol = 100 dropoff = 150
    LoadSound 'Shared\Hits\HitMetalCan' vol = 100 dropoff = 150 PosUpdateWithDoppler
    LoadSound 'Shared\Hits\BonkBush' vol = 100 dropoff = 0
    LoadSound 'Shared\Auto\CarLoop' vol = 100 dropoff = 150 PosUpdateWithDoppler
    LoadSound 'Vehicles\Vehicle_Tire_Loop'
    LoadSound 'Terrains\BonkMetal_11'
    SetTerrainMetalSmooth
endscript


script TestLevel_goals 
    SpawnScript Test_BarrelColor
    if InMultiPlayerGame
        add_multiplayer_mode_goals
    endif
    if NOT InSplitScreenGame
        if NOT GameModeEquals is_singlesession
        endif
    endif
    if NOT InSplitScreenGame
        if NOT GameModeEquals is_singlesession
            if NOT InNetGame
                AddGoal_HighScore {
                    goal_text = 'TestLevel High Score'
                    view_goals_text = 'TestLevel High Score'
                    goal_description = 'Duuude!  Whoah...  Yeah!'
                    Score = 1
                    start_cam_anim = G_HS_CameraStart
                    success_cam_anim = G_HS_CameraStart
                    pro = 'skater'
                    full_name = 'SIK'
                }
            endif
        endif
    endif
endscript


script tod_script 
    switch <current_tod>
        case Morning
        case day
        case Evening
        case Night
        default 
        printf '### no tod set ###'
    endswitch
endscript


script TestLevel_CarOutside 
    Car_Generic01 TurnDist = 40 DefaultSpeed = 35
endscript


script TestLevel_Skater_Spectator 
    Obj_ClearExceptions
    Obj_SetException Ex = objectinradius scr = TestLevel_Skater_SpectatorFall
    obj_setinnerradius 3
    begin 
    Random (
        @ Obj_PlayAnim anim = Ped_M_Cheering
        @ Obj_PlayAnim anim = Ped_M_ThumbUp
        @ Obj_PlayAnim anim = Ped_M_Clap
        @ Obj_PlayAnim anim = Ped_M_CheerIdle1
        @ Obj_PlayAnim anim = Ped_M_CheerIdle2
        @ Obj_PlayAnim anim = Ped_M_CheerIdle3
        @ Obj_PlayAnim anim = Ped_M_CheerIdle4
        @ Obj_PlayAnim anim = Ped_M_CheerIdle5
        @ Obj_PlayAnim anim = Ped_M_CheerIdle6
    )
    Obj_LookAtObject type = skater time = 0.3000
    Obj_WaitAnimFinished
    repeat 
endscript


script TestLevel_Skater_SpectatorFall 
    Obj_ClearExceptions
    Obj_PlayAnim anim = Ped_M_FalldownA
    Obj_SetException Ex = objectoutofradius scr = TestLevel_Skater_SpectatorGetUp
    obj_setouterradius 20
endscript


script TestLevel_Skater_SpectatorGetUp 
    Obj_ClearExceptions
    Obj_PlayAnim anim = Ped_M_GetUpA
    Obj_WaitAnimFinished
    goto TestLevel_Skater_Spectator
endscript


script TestLevel_GoalPedAI 
    Ped_InitAI stand Cop_Ticketing
endscript


script TestLevel_StandPedAI 
    Ped_InitAI stand DJ
endscript


script TestLevel_StandPedAI_F 
    Ped_InitAI stand avoid Chick
endscript


script Pigeon_Follow 
    obj_applyscaling {
        x = 2
        y = 2
        z = 2}
    obj_setinnerradius 500
    Obj_SetException Ex = objectinradius scr = Pigeon_ChaseSkater
    begin 
    Random (
        @ Obj_CycleAnim anim = idle
        @ Obj_CycleAnim anim = Peck
        @ Obj_CycleAnim anim = Preen)
    repeat 
endscript


script Pigeon_Idle 
    obj_moveforward Speed = 0
    Obj_ClearExceptions
    obj_setinnerradius 500
    Obj_SetException Ex = objectinradius scr = Pigeon_ChaseSkater
    begin 
    Random (
        @ Obj_CycleAnim anim = idle
        @ Obj_CycleAnim anim = Peck
        @ Obj_CycleAnim anim = Preen)
    repeat 
endscript


script Pigeon_ChaseSkater 
    Obj_ClearExceptions
    obj_setinnerradius 5
    obj_setouterradius 1000
    Obj_SetException Ex = objectinradius scr = Pigeon_Attack
    Obj_SetException Ex = objectoutofradius scr = Pigeon_Idle
    begin 
    Obj_LookAtObject type = skater time = 0.1000
    Obj_WaitRotate
    if NOT obj_getcollision height = 0.5000 Length = 50
        if NOT obj_animequals run
            Obj_PlayAnim anim = run Cycle
        endif
        obj_moveforward dist = 600 Speed = 10 acceleration = 1
    else
        if NOT obj_getcollision height = 0.5000 Length = 20
            if NOT obj_animequals run
                Obj_PlayAnim anim = run Cycle
            endif
            obj_moveforward dist = 240 Speed = 10 acceleration = 1
        else
            Obj_CycleAnim anim = idle
            goto Pigeon_Idle
        endif
    endif
    Obj_WaitMove
    repeat 
endscript


script Pigeon_Attack 
    Obj_ClearExceptions
    Obj_PlayAnim anim = Flyhop
    obj_moveforward Speed = 0
    MakeSkaterGoto PedKnockDown
    playsound bitchslap2
    Obj_WaitAnimFinished
    goto Pigeon_Idle
endscript


script TestLevel_CameraDist 
endscript


script TestLevel_ProximRain 
    WeatherSetSnowActive
    if inside
        WeatherSetSnowRate 1024
        WeatherSetSnowSize 2
    else
        WeatherSetSnowRate 0.0
    endif
endscript


script SlowSkater 
    printf 'slow skater'
    skater ::setspeed 0
endscript

FLAG_SJ_CROWD_CHEERING = 0
FLAG_SJ_CROWD_CHEERING_HUGE = 1
FLAG_SJ_CROWD_CHEERING_BIG = 2
FLAG_SJ_CROWD_CHEERING_MED = 3
FLAG_SJ_CROWD_CHEERING_SMALL = 4
FLAG_SJ_CROWD_EXCITED_HUGE = 5
FLAG_SJ_CROWD_EXCITED_BIG = 6
FLAG_SJ_CROWD_EXCITED_MED = 7
FLAG_SJ_CROWD_EXCITED_SMALL = 8

script SJ_WAT_Crowd u = 0 framerate = 10 grid_size = 8
    Offset = (1.0 / <grid_size>)
    max_offset = (1 - <Offset>)
    v = <max_offset>
    begin 
    if TRG_SJ_CrowdGhost ::obj_flagset FLAG_SJ_CROWD_CHEERING
        getrandomvalue name = random_offset a = 4 b = 7 integer
    else
        getrandomvalue name = random_offset a = 0 b = 3 integer
    endif
    u = (<Offset> * <random_offset>)
    begin 
    SetUVWibbleOffsets sector = <object> u_off = <u> , v_off = <v>
    if NOT (<v> < 0)
        v = (<v> - <Offset>)
    else
        v = <max_offset>
        break 
    endif
    wait <framerate> frames
    repeat 
    repeat 
endscript


script SJ_Crowd 
    ClearExceptionGroup SJ_Crowd
    SetException Ex = SkaterEnterCombo scr = SJ_Crowd_SkaterEnterCombo group = SJ_Crowd
endscript


script SJ_Crowd_SkaterEnterCombo 
    small_trick_score = 5000
    huge_trick_score = 1000000
    ClearExceptionGroup SJ_Crowd
    SetException Ex = SkaterExitCombo scr = SJ_Crowd_SkaterExitCombo group = SJ_Crowd
    med_trick_score = 50000
    big_trick_score = 200000
    begin 
    if SkaterCurrentScorePotGreaterThan <huge_trick_score>
        printf '&&&& current score: huge cheer &&&&'
        SJ_Crowd_Cheer excite_level = huge
    else
        if SkaterCurrentScorePotGreaterThan <big_trick_score>
            printf '&&&& current score: big cheer &&&&'
            SJ_Crowd_Cheer excite_level = big
        else
            if SkaterCurrentScorePotGreaterThan <med_trick_score>
                printf '&&&& current score: med cheer &&&&'
                SJ_Crowd_Cheer excite_level = med
            else
                if SkaterCurrentScorePotGreaterThan <small_trick_score>
                    printf '&&&& current score: small cheer &&&&'
                    SJ_Crowd_Cheer excite_level = small
                endif
            endif
        endif
    endif
    wait 1 frame
    repeat 
endscript


script SJ_Crowd_SkaterExitCombo 
    small_trick_score = 5000
    med_trick_score = 50000
    big_trick_score = 200000
    huge_trick_score = 1000000
    ClearExceptionGroup SJ_Crowd
    SetException Ex = SkaterEnterCombo scr = SJ_Crowd_SkaterEnterCombo group = SJ_Crowd
    if SkaterLastScoreLandedGreaterThan <huge_trick_score>
        printf '&&&& last landed: huge cheer &&&&'
        SJ_Crowd_Cheer cheer_level = huge
    else
        if SkaterLastScoreLandedGreaterThan <big_trick_score>
            printf '&&&& last landed: big cheer &&&&'
            SJ_Crowd_Cheer cheer_level = big
        else
            if SkaterLastScoreLandedGreaterThan <med_trick_score>
                printf '&&&& last landed: med cheer &&&&'
                SJ_Crowd_Cheer cheer_level = med
            else
                if SkaterLastScoreLandedGreaterThan <small_trick_score>
                    printf '&&&& last landed: small cheer &&&&'
                    SJ_Crowd_Cheer cheer_level = small
                else
                    printf '&&&& you suck! &&&'
                    SJ_Crowd_Cheer cheer_level = suckage
                endif
            endif
        endif
    endif
endscript


script SJ_Crowd_Cheer 
    obj_clearflag all
    if GotParam cheer_level
        printf 'gotparam cheer level &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&'
    endif
    if GotParam excite_level
        printf 'gotparam excite level &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&'
    endif
    switch <cheer_level>
        case huge
        obj_setflag FLAG_SJ_CROWD_CHEERING
        default 
        obj_setflag FLAG_SJ_CROWD_CHEERING
    endswitch
endscript


script SJ_Crowd_WaitBetweenCheers 
    obj_setflag FLAG_SJ_CROWD_CHEERING
    printf '&&&& waiting to cheer again &&&&'
    wait randomrange (1.0, 5.0) seconds
    printf '&&&& done waiting to cheer &&&&'
    obj_clearflag FLAG_SJ_CROWD_CHEERING
endscript


script testlevel_checkforskater 
    begin 
    wait 10 frame
    if obj_objectinrect dist = 35 width = 15 height = 25 type = skater Offset = (0.0, 0.0, 20.0) debug
        printf '#### CAR SEES SKATER!!! ####'
    endif
    repeat 
endscript


script TestLevel_ShatterTest area = 5500 shatter_scale = 1.0
    Shatter {name = <name>
        area = <area>
        variance = 5.0
        spread = 0.0
        life = 4.0
        Bounce = 1
        Scale = 1.0
        vel_x = -5
        vel_y = 20
        vel_z = -5
        texture_swap = <texture_swap>
        shatter_scale = <shatter_scale>
    }
    invisible name = <name>
    wait 5 seconds
    Visible name = <name>
endscript


script Test_BarrelColor 
    begin 
    break 
    if IsAlive name = Test_Bouncy_HotDog
        begin 
        Test_Bouncy_HotDog ::obj_roty Angle = 80 Speed = 30
        Test_Bouncy_HotDog ::Obj_WaitRotate
        Test_Bouncy_HotDog ::obj_roty Angle = -80 Speed = 30
        Test_Bouncy_HotDog ::Obj_WaitRotate
        repeat 
    endif
    wait 1 frame
    repeat 
endscript


script Testlevel_Ped_Idle 
    Obj_PlayAnim anim = Ped_M_Idle1 Cycle
endscript


script Test_Ped_Cop 
    Obj_ClearExceptions
    obj_setinnerradius 25
    Obj_SetException Ex = objectinradius scr = Test_Ped_Cop_Chase
    Ped_InitAI fall should_look_at_skater = 1
endscript


script Test_Ped_Cop_Chase 
    Obj_ClearExceptions
    Ped_Utils_BeginPlayerChase CatchScript = Test_Ped_Cop_Chase_End
endscript


script Test_Ped_Cop_Chase_End 
    Obj_ClearExceptions
    Ped_Utils_EndPlayerChase
    wait 2 seconds
    goto Test_Ped_Cop
endscript

