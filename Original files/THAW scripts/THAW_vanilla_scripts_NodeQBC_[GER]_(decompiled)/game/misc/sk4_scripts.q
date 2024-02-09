
script Sk3_KillSkater 
    if InSplitScreenGame
        GetSkaterNumber
        switch <skaternumber>
            case 0
            parent = player1_panel_container
            case 1
            parent = player2_panel_container
        endswitch
    endif
    if obj_flagnotset FLAG_SKATER_KILLING
        obj_setflag FLAG_SKATER_KILLING
        inbail
        if GotParam DeathSound
            playsound <DeathSound>
        else
            playsound BailBodyPunch01_11
            playsound BailSlap01
            playsound BailBodyFall01
        endif
        if NOT GotParam NoMessage
            if NOT GetGlobalFlag flag = NO_DISPLAY_HUD
                if GotParam Message1
                    create_panel_message {
                        style = panel_message_death
                        id = death_message
                        parent = <parent>
                        text = Random (
                            @ <Message1>
                            @ <message2>
                            @ <message3>
                            @ <message4>
                        )
                    }
                else
                    if driving
                        create_panel_message {
                            style = panel_message_death
                            id = death_message
                            parent = <parent>
                            text = Random (
                                @ 'Kein Alkohol am Steuer!'
                                @ 'Lerne zu fahren!'
                                @*2 'Da geht\'s nicht lang!'
                            )
                        }
                    else
                        create_panel_message {
                            style = panel_message_death
                            id = death_message
                            parent = <parent>
                            text = Random (
                                @ 'Du nervst!'
                                @ 'Keine Macht den Drogen!'
                                @ 'Bleib in der Schule!'
                                @ 'So sieht dein Gehirn unter Drogen aus!'
                                @ 'Sehr schön!'
                                @ 'Fantastisch!'
                                @ 'Hmmmmm ...'
                                @ 'Loser!'
                                @ 'Wer hat dir dieses Board geliehen?'
                                @*4 'Da geht\'s nicht lang!'
                            )
                        }
                    endif
                endif
            endif
        endif
        SK3_Killskater_Finish <...> 
    endif
endscript

script SK3_KillSkater_Water 
    if InSplitScreenGame
        GetSkaterNumber
        switch <skaternumber>
            case 0
            parent = player1_panel_container
            case 1
            parent = player2_panel_container
        endswitch
    endif
    if obj_flagnotset FLAG_SKATER_KILLING
        obj_setflag FLAG_SKATER_KILLING
        if GotParam DeathSound
            playsound <DeathSound>
        else
            playsound FallWater
        endif
        if NOT GetGlobalFlag flag = NO_DISPLAY_HUD
            if GotParam Message1
                create_panel_message {
                    style = panel_message_death
                    id = death_message
                    parent = <parent>
                    text = Random (
                        @ <Message1>
                        @ <message2>
                        @ <message3>
                        @ <message4>
                    )
                }
            else
                create_panel_message {
                    style = panel_message_death
                    id = death_message
                    parent = <parent>
                    text = Random (
                        @ 'Alles trieft!'
                        @ 'Du Tropf!'
                        @ 'WASSER ... BUUH!'
                        @ 'Schwimmen verboten'
                        @ 'Du gehst unter!'
                        @ 'Du sitzt in der Patsche!'
                    )
                }
            endif
        endif
        SK3_Killskater_Finish water r = 100 g = 100 b = 200 <...> 
    endif
endscript

script SK3_KillSkater_Pungee 
    if InSplitScreenGame
        GetSkaterNumber
        switch <skaternumber>
            case 0
            parent = player1_panel_container
            case 1
            parent = player2_panel_container
        endswitch
    endif
    if obj_flagnotset FLAG_SKATER_KILLING
        obj_setflag FLAG_SKATER_KILLING
        playsound FallPungee_11
        if NOT GetGlobalFlag flag = NO_DISPLAY_HUD
            if NOT GotParam Lava
                create_panel_message {
                    style = panel_message_death
                    id = death_message
                    parent = <parent>
                    text = Random (
                        @ 'Dir hat man gut zugesetzt!'
                        @ 'Wer hat das gebaut?!'
                        @ 'Spiel, Satz und Spike!'
                        @ 'Shish Kebab?'
                        @ 'Nicht zur Nachahmung geeignet!'
                    )
                }
            else
                create_panel_message {
                    style = panel_message_death
                    id = death_message
                    parent = <parent>
                    text = Random (
                        @ 'Heiße Zehen!'
                        @ 'Knusprig gebruzzelt!'
                        @ 'Perfekt gegrillt!'
                        @ 'Autsch!'
                        @ 'Tod in der Lava!'
                    )
                }
            endif
        endif
        SK3_Killskater_Finish r = 150 g = 50 b = 50 <...> 
    endif
endscript

script SK4_Hide_Death_Message 
    if ObjectExists \{ id = death_message }
        SetScreenElementProps \{id = death_message rgba = [ 0 0 0 0 ]}
    endif
endscript

script SK3_Killskater_Finish r = 255 g = 255 b = 255
    if NOT driving
        obj_getid
        LaunchEvent type = KillingSkater target = <ObjID>
    endif
    disableplayerinput
    if GotParam bail
        is_skating_or_biking = 0
        if IsSkaterOnBike
            is_skating_or_biking = 1
        endif
        if skating
            is_skating_or_biking = 1
        endif
        if (<is_skating_or_biking> = 1)
            MakeSkaterGoto Killskater_Bail
        endif
    endif
    pulse_blur start = 0 end = 255 Speed = 4
    ClearPanel_Bailed
    if GotParam nodeName
        change kill_skater_nodename = <nodeName>
    endif
    OnExitRun SK3_Killskater_Finish2
    if GotParam water
        SkaterSplashOn
        PausePhysics
        hide
        if ObjectExists id = PlayerVehicle
            PlayerVehicle ::hide
        endif
        if IsSkaterOnBike
            si_bike ::hide
        endif
        wait 0.5000 seconds
    else
        wait 0.2500 seconds
    endif
    OnExitRun
    SK3_Killskater_Finish3 <...> 
endscript
kill_skater_nodename = 0

script SK3_Killskater_Finish2 
    if InSplitScreenGame
        obj_getid
        if ObjectExists <ObjID>
            MakeSkaterGoto SK3_Killskater_Finish3 params = {nodeName = (kill_skater_nodename)}
        endif
    else
        MakeSkaterGoto SK3_Killskater_Finish3 params = {nodeName = (kill_skater_nodename)}
    endif
endscript

script SK3_Killskater_Finish3 
    ClearTrickQueues
    wait 1 gameframe
    BlendperiodOut 0
    ClearEventBuffer
    BailSkaterTricks
    if NOT driving
        if GotParam nodeName
            KillSkater node = <nodeName>
        else
            KillSkater
        endif
    else
        PlayerVehicle ::Vehicle_MoveToRestart <nodeName>
        PlayerVehicleCamera ::VehicleCamera_Reset
        PlayerVehicle ::unhide
        if PlayerVehicle ::Vehicle_IsSkaterVisible
            unhide
        endif
    endif
    if InNetGame
        if GameModeEquals is_goal_attack
            if NOT GameIsOver
                speech_box_exit
            endif
        endif
    else
        speech_box_exit
    endif
    obj_killspawnedscript name = ForceToWalk
    if IsForceWalkOn
        KillForceToWalk
    endif
    ResetSkaterParticleSystems
    pulse_blur start = 255 end = 0 Speed = 4
    wait 0.7500 seconds
    notinbail
    obj_clearflag FLAG_SKATER_KILLING
    if GoalManager_HasActiveGoals
        if GoalManager_GetActiveGoalId
            GoalManager_GetGoalParams name = <goal_id>
            if GotParam horse
                GoalManager_LoseGoal name = <goal_id>
            endif
        endif
    endif
endscript

script panel_message_death 
    if InSplitScreenGame
        ScriptGetScreenMode
        switch <screen_mode>
            case split_vertical
            off_set = (-160.0, 20.0)
            case split_horizontal
            off_set = (0.0, 20.0)
            default 
            off_set = (0.0, 20.0)
        endswitch
    else
        off_set = (0.0, 20.0)
    endif
    DoMorph time = 0 Scale = 1.100 Pos = ((320.0, 100.0) + <off_set>)alpha = 1
    DoMorph Pos = ((323.0, 103.0) + <off_set>)time = 0.05000
    DoMorph Pos = ((317.0, 97.0) + <off_set>)time = 0.05000
    DoMorph Pos = ((323.0, 103.0) + <off_set>)time = 0.05000
    DoMorph Pos = ((317.0, 97.0) + <off_set>)time = 0.05000
    DoMorph Pos = ((323.0, 103.0) + <off_set>)time = 0.05000
    DoMorph Pos = ((317.0, 97.0) + <off_set>)time = 0.05000
    DoMorph Pos = ((323.0, 103.0) + <off_set>)time = 0.05000
    DoMorph Pos = ((317.0, 97.0) + <off_set>)time = 0.05000
    DoMorph Pos = ((323.0, 103.0) + <off_set>)time = 0.05000
    DoMorph Pos = ((317.0, 97.0) + <off_set>)time = 0.05000
    DoMorph Pos = ((323.0, 103.0) + <off_set>)time = 0.05000
    DoMorph Pos = ((317.0, 97.0) + <off_set>)time = 0.05000
    DoMorph Pos = ((323.0, 103.0) + <off_set>)time = 0.05000
    DoMorph Pos = ((317.0, 97.0) + <off_set>)time = 0.05000
    DoMorph Pos = ((323.0, 103.0) + <off_set>)time = 0.05000
    DoMorph Pos = ((317.0, 97.0) + <off_set>)time = 0.05000
    DoMorph Pos = ((323.0, 103.0) + <off_set>)time = 0.05000
    DoMorph Pos = ((317.0, 97.0) + <off_set>)time = 0.05000
    DoMorph Pos = ((323.0, 103.0) + <off_set>)time = 0.05000
    DoMorph Pos = ((317.0, 97.0) + <off_set>)time = 0.05000
    DoMorph Pos = ((323.0, 103.0) + <off_set>)time = 0.05000
    DoMorph Pos = ((317.0, 97.0) + <off_set>)time = 0.05000
    DoMorph Pos = ((323.0, 103.0) + <off_set>)time = 0.05000
    DoMorph Pos = ((317.0, 97.0) + <off_set>)time = 0.05000
    DoMorph Pos = ((323.0, 103.0) + <off_set>)time = 0.05000
    DoMorph Pos = ((317.0, 97.0) + <off_set>)time = 0.05000
    DoMorph Pos = ((323.0, 103.0) + <off_set>)time = 0.05000
    DoMorph Pos = ((317.0, 97.0) + <off_set>)time = 0.05000
    DoMorph Pos = ((323.0, 103.0) + <off_set>)time = 0.05000
    DoMorph Pos = ((317.0, 97.0) + <off_set>)time = 0.05000
    DoMorph Pos = ((323.0, 103.0) + <off_set>)time = 0.05000
    DoMorph Pos = ((317.0, 97.0) + <off_set>)time = 0.05000 rot_angle = 0 Scale = 1
    DoMorph Pos = ((317.0, 97.0) + <off_set>)time = 0.05000 rot_angle = 0 Scale = 1.300 alpha = 1
    DoMorph time = 0.1300 Pos = ((320.0, 140.0) + <off_set>)rot_angle = -10
    DoMorph alpha = 0 time = 0.1700 Pos = ((320.0, 260.0) + <off_set>)rot_angle = -45
    Die
endscript

script Killskater_Bail 
    if NOT IsSkaterOnBike
        Skater_Playanim \{ anim = Bail_Spin_FWD_Regular BlendPeriod = 0.3000 }
    else
        Skater_Playanim \{ anim = Bail_Manual_FT BlendPeriod = 0.3000 }
    endif
endscript

script SK3_TeleportToNode 
    TeleportSkaterToNode <...> 
endscript

script TeleportSkaterToNode r = 255 g = 255 b = 255
    if GotParam Message1
        LaunchPanelMessage properties = panel_message_death <Message1>
    else
        LaunchPanelMessage properties = panel_message_death 'Immer unterwegs!'
    endif
    GetSkaterHeight
    printf 'skater_height ===================== %f' f = <skater_height>
    if (<skater_height> > 1)
        <skater_height> = (<skater_height> + 10)
    endif
    if GotParam nodeName
        printf 'Got the nodename ....................'
        is_skating_or_biking = 0
        if IsSkaterOnBike
            is_skating_or_biking = 1
        endif
        if skating
            is_skating_or_biking = 1
        endif
        if (<is_skating_or_biking> = 1)
            if onrail
                ClearEventBuffer
                ClearTrickQueue
                KillExtraTricks
                ClearExtraGrindTrick
                stopbalancetrick
                if NOT IsInBail
                    if IsSkaterOnBike
                        MakeSkaterGoto bike_GroundGone
                    else
                        MakeSkaterGoto GroundGone
                    endif
                endif
            endif
        endif
        pulse_blur start = 255 Speed = 5
        if GotParam no_offset
            <skater_height> = 0
        endif
        if NOT GotParam reset
            <no_reset> = { NoReset }
        else
            <no_reset> = {}
        endif
        obj_movetonode name = <nodeName> orient <no_reset> y_offset = <skater_height>
    else
        LaunchPanelMessage properties = panel_message_death 'ERROR! Please pass in nodename='
    endif
    if walking
        GetCameraId
        <cameraid> ::WalkCamera_Reset
        if walk_hang
            Walk_ForceToAirFromHang
        endif
        Walk_SetForwardControlLock on
        wait 0.3000 seconds
        Walk_SetForwardControlLock Off
    endif
endscript

script PrepareSkaterForMove 
    if skating
        setstate \{ Air }
        CleanUpSpecialItems
        stopbalancetrick
        MakeSkaterGoto \{ GroundGone }
        LandSkaterTricks
        ClearEventBuffer
    endif
endscript
FLAG_TRAFFICLIGHT_GREEN = 0
FLAG_TRAFFICLIGHT_YELLOW = 1
FLAG_TRAFFICLIGHT_RED = 2
FLAG_CAR_GENERIC_STOPPED = 3
FLAG_CAR_GENERIC_NOSOUND = 4
FLAG_CAR_SOUND_FRANTICSTOP = 5
FLAG_CAR_SKITCH = 7
FLAG_CAR_TYPE_BUS = 30
FLAG_CAR_TYPE_HPRV = 31
FLAG_CAR_GENERIC_STOPPED_SKATER = 8

script Car_Generic01 {
        TurnDist = 20
        DefaultSpeed = 40
        SkitchSpeed = 60
        CarLoopSFX = CarLoop
        SkaterCheckOffset = (0.0, 0.0, 5.5)
        SkaterCheckWidth = 15
        SkaterCheckHeight = 25
    }
    obj_getid
    settags DefaultSpeed = <DefaultSpeed> Tag_TurnDist = <TurnDist> CarLoopSFX = <CarLoopSFX>
    gettags
    obj_setpathturndist <Tag_TurnDist>
    obj_followpathlinked
    obj_setpathacceleration 10 mphps
    obj_setpathdeceleration 10 mphps
    obj_setpathminstopvel 5
    obj_setpathvelocity <DefaultSpeed> mph
    if NOT GotParam AllowSlow
        if (<DefaultSpeed> < 20)
            printf '### CAR SPEED TOO SLOW! CHANGING TO 20mph ###'
            printstruct <DefaultSpeed>
            <DefaultSpeed> = 20
            printstruct <DefaultSpeed>
        endif
    endif
    if GotParam bus
        obj_setflag FLAG_CAR_TYPE_BUS
    endif
    if GotParam HPRV
        obj_setflag FLAG_CAR_TYPE_HPRV
    endif
    if GotParam SkaterDebugBox
        <SkaterDebugBox> = debug
    endif
    if GotParam CarDebugBox
        <CarDebugBox> = debug
    endif
    if GotParam nosound
        obj_setflag FLAG_CAR_GENERIC_NOSOUND
    else
        obj_playsound <CarLoopSFX> pitch = RandomNoRepeat (@ 80 @ 85 @ 90 @ 95 @ 100 @ 105 @ 110) dropoff = 160 dropoff_function = exponential
        obj_playsound Car_Tire_Rolling_Loop pitch = RandomNoRepeat (@ 92 @ 97 @ 101 @ 105 @ 110) dropoff = 120 dropoff_function = exponential
    endif
    if GotParam StickToGround
        obj_sticktoground on distabove = 2 distbelow = 2
    endif
    if GotParam NoSkater
    else
        obj_spawnscriptlater Car_CheckForSkater01 params = <...> 
    endif
    if GotParam skitch
        Obj_SetException Ex = Skitched scr = <skitch>
    endif
    obj_spawnscriptlater Car_CheckForOtherCar01 params = <...> 
endscript
Car_CheckForSkater_Pause = 1

script Car_CheckForSkater01 
    p1 = {
        dist = (<DefaultSpeed> * 1.500)
        width = <SkaterCheckWidth>
        height = <SkaterCheckHeight>
        type = skater
        Offset = <SkaterCheckOffset>
        <SkaterDebugBox>
    }
    change Car_CheckForSkater_Pause = (Car_CheckForSkater_Pause + 1)
    if (Car_CheckForSkater_Pause > 10)
        change Car_CheckForSkater_Pause = 1
    endif
    wait Car_CheckForSkater_Pause gameframes
    begin 
    wait 0.1600 seconds
    if LocalSkaterExists
        if obj_flagnotset FLAG_CAR_GENERIC_STOPPED
            if obj_objectinrect <p1>
                KillSpawnedScript id = CarAccelSound
                obj_adjustsound {
                    <CarLoopSFX>
                    volumepercent = 50
                    VolumeStep = 1.500
                    pitchpercent = 40
                    pitchStep = 1.500
                }
                obj_adjustsound {
                    Car_Tire_Rolling_Loop
                    volumepercent = 1
                    VolumeStep = 1.500
                    pitchpercent = 1
                    pitchStep = 1.500
                }
                Car_Sound_FranticStop01
                obj_stopalongpath 8
                obj_setflag FLAG_CAR_GENERIC_STOPPED_SKATER
                begin 
                wait 1.500 seconds
                if obj_objectinrect <p1>
                    KillSpawnedScript id = CarAccelSound
                    wait 1 seconds
                    Car_Sound_RandomHonk01
                else
                    SpawnSound Car_Sound_Accel01 id = CarAccelSound
                    obj_startalongpath
                    obj_clearflag FLAG_CAR_GENERIC_STOPPED_SKATER
                    break 
                endif
                repeat 
            else
                if skater ::skitching
                    obj_getspeed
                    if obj_flagnotset FLAG_CAR_SKITCH
                        obj_setflag FLAG_CAR_SKITCH
                        if obj_flagnotset FLAG_CAR_GENERIC_NOSOUND
                            SpawnSound Auto_SFX_Car_Tire_Squeal
                        endif
                        obj_setpathvelocity <SkitchSpeed> mph
                    endif
                else
                    if obj_flagset FLAG_CAR_SKITCH
                        obj_clearflag FLAG_CAR_SKITCH
                        if NOT GotParam NoSkitchStop
                            obj_setflag FLAG_CAR_GENERIC_STOPPED
                            obj_stopalongpath 15 feet
                            wait 1 second
                            obj_clearflag FLAG_CAR_GENERIC_STOPPED
                            obj_startalongpath
                        endif
                        obj_setpathvelocity <DefaultSpeed> mph
                    endif
                endif
            endif
        endif
    endif
    repeat 
endscript
Car_CheckForOtherCar_Pause = 1

script Car_CheckForOtherCar01 
    p1 = {
        dist = (<DefaultSpeed> * 1.500)
        width = 20
        height = 20
        Offset = (0.0, 0.0, 5.0)
        <CarDebugBox>
    }
    p2 = {
        dist = <DefaultSpeed>
        width = 20
        height = 20
        Offset = (0.0, 0.0, 5.0)
        <CarDebugBox>
    }
    change Car_CheckForOtherCar_Pause = (Car_CheckForOtherCar_Pause + 1)
    if (Car_CheckForOtherCar_Pause > 10)
        change Car_CheckForOtherCar_Pause = 1
    endif
    wait Car_CheckForOtherCar_Pause gameframes
    begin 
    wait 0.1600 seconds
    if obj_flagnotset FLAG_CAR_GENERIC_STOPPED
        CarGeneric_GetNextObjOnPath_Decel <...> 
        gettags
        obj_getnextobjonpath range = <LookAheadCheckDist_Decel>
        if GotParam ob
            obj_spawnscriptlater Car_DecelForOtherCar01 params = <...> 
            if IsAlive name = <ob>
                CarGeneric_GetNextObjOnPath_Stop <...> 
                gettags
                obj_getnextobjonpath range = <LookAheadCheckDist>
            endif
            if GotParam ob
                Car_StopForOtherCar01 <...> 
            endif
        endif
    endif
    repeat 
endscript

script Car_StopForOtherCar01 
    KillSpawnedScript id = CarAccelSound
    obj_setflag FLAG_CAR_GENERIC_STOPPED
    obj_stopalongpath 7
    gettags
    if obj_flagset FLAG_CAR_TYPE_BUS
        printf '### distance ahead bus looked before stopping = %d' d = <LookAheadCheckDist>
    endif
    if obj_flagset FLAG_CAR_TYPE_HPRV
        printf '### distance ahead HPRV looked before stopping = %d' d = <LookAheadCheckDist>
    endif
    Car_Sound_Stop01
    begin 
    Car_Sound_RandomHonk01
    if IsAlive name = <ob>
        CarGeneric_GetNextObjOnPath_Stop <...> 
        gettags
        obj_getnextobjonpath range = <LookAheadCheckDist>
    endif
    if NOT GotParam ob
        if obj_flagnotset FLAG_CAR_GENERIC_STOPPED_SKATER
            Car_StartForOtherCar01 <...> 
            break 
        endif
    endif
    wait 1 seconds
    repeat 
endscript

script Car_StartForOtherCar01 
    SpawnSound \{ Car_Sound_Accel01 id = CarAccelSound }
    obj_clearflag \{ FLAG_CAR_GENERIC_STOPPED }
    wait \{ 0.1600 seconds }
    if obj_flagnotset \{ FLAG_CAR_GENERIC_STOPPED_SKATER }
        obj_setpathvelocity \{ 30 mph }
        obj_startalongpath
    endif
endscript

script CarGeneric_GetNextObjOnPath_Decel 
    LookAheadCheckDist_Decel = 45
    if GotParam \{ bus }
        LookAheadCheckDist_Decel = (<LookAheadCheckDist_Decel> + 20)
    else
        if GotParam \{ HPRV }
            LookAheadCheckDist_Decel = (<LookAheadCheckDist_Decel> + 20)
        else
            if GotParam \{ scooter }
                LookAheadCheckDist_Decel = (<LookAheadCheckDist_Decel> - 20)
            else
                if GotParam \{ truck }
                    LookAheadCheckDist_Decel = (<LookAheadCheckDist_Decel> + 10)
                endif
            endif
        endif
    endif
    settags LookAheadCheckDist_Decel = <LookAheadCheckDist_Decel>
endscript

script CarGeneric_GetNextObjOnPath_Stop 
    LookAheadCheckDist = 37
    if GotParam bus
        LookAheadCheckDist = (<LookAheadCheckDist> + 20)
    else
        if GotParam HPRV
            LookAheadCheckDist = (<LookAheadCheckDist> + 20)
        else
            if GotParam scooter
                LookAheadCheckDist_Decel = (<LookAheadCheckDist_Decel> - 20)
            else
                if GotParam truck
                    LookAheadCheckDist_Decel = (<LookAheadCheckDist_Decel> + 10)
                endif
            endif
        endif
    endif
    if QueryFlag name = <ob> FLAG_CAR_TYPE_BUS
        LookAheadCheckDist = (<LookAheadCheckDist> + 10)
    endif
    if QueryFlag name = <ob> FLAG_CAR_TYPE_HPRV
        printf '#### vehicle ahead of me %o is a HPRV ####' o = <ObjID>
        LookAheadCheckDist = (<LookAheadCheckDist> + 50)
    endif
    settags LookAheadCheckDist = <LookAheadCheckDist>
endscript

script Car_Sound_Accel01 
    gettags
    if obj_flagnotset FLAG_CAR_GENERIC_NOSOUND
        obj_adjustsound {
            Car_Tire_Rolling_Loop
            volumepercent = 40
            VolumeStep = 0.7500
            pitchpercent = randomrange (83.0, 87.0)
            pitchStep = randomrange (0.6000000238418579, 0.8999999761581421)
        }
        obj_adjustsound {
            <CarLoopSFX>
            volumepercent = 40
            VolumeStep = 0.7500
            pitchpercent = randomrange (83.0, 87.0)
            pitchStep = randomrange (0.6000000238418579, 0.8999999761581421)
        }
        wait randomrange (0.8999999761581421, 1.5) seconds
        obj_adjustsound {
            <CarLoopSFX>
            volumepercent = 30
            VolumeStep = 3
            pitchpercent = randomrange (48.0, 52.0)
            pitchStep = randomrange (4.0, 5.5)
        }
        wait randomrange (0.15000000596046448, 0.4000000059604645) seconds
        gettags
        if obj_flagnotset FLAG_CAR_GENERIC_STOPPED
            obj_adjustsound {
                <CarLoopSFX>
                volumepercent = 40
                VolumeStep = 0.5000
                pitchpercent = randomrange (77.0, 81.0)
                pitchStep = randomrange (0.4000000059604645, 0.6000000238418579)
            }
            wait randomrange (1.2000000476837158, 1.899999976158142) seconds
            obj_adjustsound {
                <CarLoopSFX>
                volumepercent = 27
                VolumeStep = 4
                pitchpercent = randomrange (42.0, 47.0)
                pitchStep = randomrange (0.4000000059604645, 0.5)
            }
            wait randomrange (0.15000000596046448, 0.4000000059604645) seconds
        endif
        gettags
        if obj_flagnotset FLAG_CAR_GENERIC_STOPPED
            obj_adjustsound {
                <CarLoopSFX>
                volumepercent = 40
                VolumeStep = 0.4000
                pitchpercent = 73
                pitchStep = 0.4000
            }
            wait 2.0 seconds
            obj_adjustsound {
                <CarLoopSFX>
                volumepercent = 25
                VolumeStep = 5
                pitchpercent = 45
                pitchStep = 5
            }
            wait randomrange (0.15000000596046448, 0.4000000059604645) seconds
        endif
        gettags
        if obj_flagnotset FLAG_CAR_GENERIC_STOPPED
            obj_adjustsound {
                <CarLoopSFX>
                volumepercent = 40
                VolumeStep = 0.3000
                pitchpercent = 60
                pitchStep = 0.3000
            }
        endif
    endif
endscript

script Car_Sound_Decel01 
    KillSpawnedScript \{ id = CarAccelSound }
    gettags
    if obj_flagnotset \{ FLAG_CAR_GENERIC_NOSOUND }
        obj_adjustsound {
            <CarLoopSFX>
            volumepercent = 40
            VolumeStep = 2
            pitchpercent = randomrange (40.0, 50.0)
            pitchStep = 1
        }
        wait \{ 1 second }
        SpawnSound \{ Auto_SFX_CarBrakeSqueal }
    endif
endscript

script Car_Sound_Stop01 
    KillSpawnedScript \{ id = CarAccelSound }
    gettags
    if obj_flagnotset \{ FLAG_CAR_GENERIC_NOSOUND }
        obj_adjustsound {
            <CarLoopSFX>
            volumepercent = 25
            VolumeStep = 1.500
            pitchpercent = 30
            pitchStep = 1.500
        }
        SpawnSound \{ Auto_SFX_CarBrakeSqueal }
    endif
endscript

script Car_Sound_FranticStop01 
    KillSpawnedScript \{ id = CarAccelSound }
    gettags
    if obj_flagnotset \{ FLAG_CAR_GENERIC_NOSOUND }
        if obj_flagnotset \{ FLAG_CAR_SOUND_FRANTICSTOP }
            SpawnSound \{ Auto_SFX_Car_Tire_Squeal }
            Random (@ @ @ 
                @ SpawnSound \{ Auto_SFX_Car_Horn_Stream })
        endif
    endif
    obj_spawnscriptlater \{ Car_Counter_FranticStop01 }
endscript

script Car_Counter_FranticStop01 
    obj_setflag \{ FLAG_CAR_SOUND_FRANTICSTOP }
    KillSpawnedScript \{ id = CarAccelSound }
    wait \{ 2 seconds }
    obj_clearflag \{ FLAG_CAR_SOUND_FRANTICSTOP }
endscript

script Car_Sound_RandomHonk01 
    if obj_flagnotset \{ FLAG_CAR_GENERIC_NOSOUND }
        Random (@*20 
            @ SpawnSound \{ Auto_SFX_Car_Horn_Stream })
    endif
endscript

script Car_Accel01 
    if obj_flagset FLAG_CAR_SKITCH
    else
        gettags
        getrandomvalue name = AccelSpeed a = (<DefaultSpeed> * 0.9000)b = (<DefaultSpeed> * 1.200)
        obj_setpathvelocity <AccelSpeed> mph
        SpawnSound Car_Sound_Accel01 id = CarAccelSound
        if GotParam printstruct
            printstruct <...> 
        endif
    endif
    if GotParam StickToGround
        obj_sticktoground on distabove = 2 distbelow = 2
    else
        if GotParam NoStickToGround
            obj_sticktoground Off
        endif
    endif
endscript

script Car_AccelAfterDecelForCar01 
    if obj_flagset \{ FLAG_CAR_SKITCH }
    else
        gettags
        getrandomvalue name = AccelSpeed a = (<DefaultSpeed> * 0.9000)b = (<DefaultSpeed> * 1.200)
        obj_setpathvelocity <AccelSpeed> mph
        SpawnSound \{ Car_Sound_Accel01 id = CarAccelSound }
    endif
endscript

script Car_Decel01 
    if obj_flagset \{ FLAG_CAR_SKITCH }
    else
        KillSpawnedScript \{ id = CarAccelSound }
        gettags
        getrandomvalue name = DecelSpeed a = (<DefaultSpeed> * 0.6000)b = (<DefaultSpeed> * 0.7000)
        obj_setpathvelocity <DecelSpeed> mph
        if GotParam \{ printstruct }
            printstruct <...> 
        endif
    endif
endscript

script Car_DecelForTurn01 
    if obj_flagset \{ FLAG_CAR_SKITCH }
    else
        KillSpawnedScript \{ id = CarAccelSound }
        settags Tag_TurnDist = <TurnDist>
        gettags
        getrandomvalue name = DecelSpeed a = (<DefaultSpeed> * 0.6000)b = (<DefaultSpeed> * 0.7000)
        if (<DecelSpeed> < 20)
            <DecelSpeed> = 20
        endif
        obj_setpathvelocity <DecelSpeed> mph
        obj_setpathturndist <Tag_TurnDist>
        Car_Sound_Decel01
        if GotParam \{ printstruct }
            printstruct <...> 
        endif
    endif
endscript

script Car_DecelForOtherCar01 
    KillSpawnedScript \{ id = CarAccelSound }
    Car_Decel01 <...> 
    wait \{ 2 seconds }
    Car_AccelAfterDecelForCar01 <...> 
endscript

script Ped_StopAtNode01 
    obj_setanimcyclemode \{ Off }
    Obj_WaitAnimFinished
    Obj_PlayAnim \{ anim = WalkToIdle }
    wait \{ 2 gameframes }
    obj_stopalongpath
    Obj_WaitAnimFinished
endscript

script Ped_WalkToNextNode01 
    Random (
        @ obj_setpathvelocity \{ 4 }
        obj_startalongpath
        Obj_CycleAnim \{ anim = IdleToWalk }
        Obj_PlayAnim \{ anim = Walk1 Cycle }
        @ obj_setpathvelocity \{ 4 }
        obj_startalongpath
        Obj_CycleAnim \{ anim = IdleToWalk }
        Obj_PlayAnim \{ anim = Walk2 Cycle }
    )
endscript

script Ped_RandomWaitAtNode01 
    Ped_StopAtNode01
    Obj_CycleAnim \{ anim = idle }
    begin 
    Random (
        @ Ped_Idle01
        @ goto \{ Ped_WalkToNextNode01 }
    )
    repeat 
endscript

script Ped_Idle01 
    Random (
        @ Obj_CycleAnim anim = ScratchChin
        @ Obj_CycleAnim anim = LookAtWatch
        @ Obj_CycleAnim anim = LookLeftRight
        @ Obj_CycleAnim anim = LookRight
        @ Obj_CycleAnim anim = LookLeftDown
        @ Obj_CycleAnim anim = talk
        @ Obj_CycleAnim anim = Talk2
        @ Obj_CycleAnim anim = idle
        @ Obj_CycleAnim anim = idle
        @ Obj_CycleAnim anim = idle
        @ Obj_CycleAnim anim = idle
        @ Obj_CycleAnim anim = IdleToIdle2
        Obj_CycleAnim anim = Idle2
        Obj_CycleAnim anim = Idle2ToIdle
        @ Obj_CycleAnim anim = IdleToIdle3
        Obj_CycleAnim anim = Idle3
        Obj_CycleAnim anim = Idle3ToIdle
    )
endscript

script Team_Flag 
    obj_setinnerradius 10
    if GameModeEquals is_lobby
        printf 'Creating team flag'
        Obj_SetException Ex = objectinradius scr = Team_Flag_Trigger params = { <...>  }
    else
        if GameModeEquals is_ctf
            printf 'Creating CTF flag'
            if OnServer
                printf 'Setting CTF flag exception : AnyObjectInRadius'
                Obj_SetException Ex = anyobjectinradius scr = CTF_Team_Flag_Trigger params = { <...>  }
            endif
        endif
    endif
endscript

script Team_Flag_Trigger 
    if NOT GetCurrentZoneName
        script_assert 'Team_Flag_Trigger called before zone map created'
    endif
    FormatText checksumname = red_flag '%z_TRG_Flag_Red' z = <zone_name>
    FormatText checksumname = blue_flag '%z_TRG_Flag_Blue' z = <zone_name>
    FormatText checksumname = green_flag '%z_TRG_Flag_Green' z = <zone_name>
    FormatText checksumname = yellow_flag '%z_TRG_Flag_Yellow' z = <zone_name>
    GetNumTeams
    if GotParam blue
        JoinTeam blue
        Kill name = <red_flag>
        Kill name = <green_flag>
        Kill name = <yellow_flag>
        Create name = <red_flag>
        switch <num_teams>
            case 3
            Create name = <green_flag>
            case 4
            Create name = <green_flag>
            Create name = <yellow_flag>
        endswitch
        Die
    endif
    if GotParam red
        JoinTeam red
        Kill name = <blue_flag>
        Kill name = <green_flag>
        Kill name = <yellow_flag>
        Create name = <blue_flag>
        switch <num_teams>
            case 3
            Create name = <green_flag>
            case 4
            Create name = <green_flag>
            Create name = <yellow_flag>
        endswitch
        Die
    endif
    if GotParam green
        JoinTeam green
        Kill name = <blue_flag>
        Kill name = <red_flag>
        Kill name = <yellow_flag>
        Create name = <blue_flag>
        Create name = <red_flag>
        switch <num_teams>
            case 4
            Create name = <yellow_flag>
        endswitch
        Die
    endif
    if GotParam yellow
        JoinTeam yellow
        Kill name = <blue_flag>
        Kill name = <red_flag>
        Kill name = <green_flag>
        Create name = <blue_flag>
        Create name = <red_flag>
        Create name = <green_flag>
        Die
    endif
endscript

script CTF_Team_Base_Trigger 
    if GotParam red
        GetCollidingPlayerAndTeam exclude_team = 0 Radius = 10
        if (<player> = -1)
        else
            if (<team> = 0)
                if PlayerHasFlag <...> 
                    if TeamFlagTaken <...> 
                        DisplayFlagBaseWarning
                    endif
                endif
            endif
        endif
    endif
    if GotParam blue
        GetCollidingPlayerAndTeam exclude_team = 1 Radius = 10
        if (<player> = -1)
        else
            if (<team> = 1)
                if PlayerHasFlag <...> 
                    if TeamFlagTaken <...> 
                        DisplayFlagBaseWarning
                    endif
                endif
            endif
        endif
    endif
    if GotParam green
        GetCollidingPlayerAndTeam exclude_team = 2 Radius = 10
        if (<player> = -1)
        else
            if (<team> = 2)
                if PlayerHasFlag <...> 
                    if TeamFlagTaken <...> 
                        DisplayFlagBaseWarning
                    endif
                endif
            endif
        endif
    endif
    if GotParam yellow
        GetCollidingPlayerAndTeam exclude_team = 3 Radius = 10
        if (<player> = -1)
        else
            if (<team> = 3)
                if PlayerHasFlag <...> 
                    if TeamFlagTaken <...> 
                        DisplayFlagBaseWarning
                    endif
                endif
            endif
        endif
    endif
endscript

script display_flag_base_warning 
    create_net_panel_message \{ msg_time = 2000 text = net_message_flag_base_warning }
endscript

script CTF_Team_Flag_Trigger 
    printf '*** In Exception Handler CTF_Team_Flag_Trigger'
    wait 1 gameframe
    if JustStartedNetGame
        printf '*** Leaving Exception Handler CTF_Team_Flag_Trigger because the game just started'
        return 
    endif
    printf '*** Processing Exception Handler CTF_Team_Flag_Trigger'
    if GotParam red
        GetCollidingPlayerAndTeam exclude_team = 0 Radius = 10
        if (<player> = -1)
        else
            if (<team> = 0)
                PlayerCapturedFlag flag_team = 0 <...> 
            else
                PlayerTookFlag flag_team = 0 <...> 
                Obj_ClearExceptions
            endif
        endif
    endif
    if GotParam blue
        GetCollidingPlayerAndTeam exclude_team = 1 Radius = 10
        if (<player> = -1)
        else
            if (<team> = 1)
                PlayerCapturedFlag flag_team = 1 <...> 
            else
                PlayerTookFlag flag_team = 1 <...> 
                Obj_ClearExceptions
            endif
        endif
    endif
    if GotParam green
        GetCollidingPlayerAndTeam exclude_team = 2 Radius = 10
        if (<player> = -1)
        else
            if (<team> = 2)
                PlayerCapturedFlag flag_team = 2 <...> 
            else
                PlayerTookFlag flag_team = 2 <...> 
                Obj_ClearExceptions
            endif
        endif
    endif
    if GotParam yellow
        GetCollidingPlayerAndTeam exclude_team = 3 Radius = 10
        if (<player> = -1)
        else
            if (<team> = 3)
                PlayerCapturedFlag flag_team = 3 <...> 
            else
                PlayerTookFlag flag_team = 3 <...> 
                Obj_ClearExceptions
            endif
        endif
    endif
endscript

script kill_team_flags 
    if NOT GetCurrentZoneName
        script_assert 'Kill_Team_Flags called before zone map created'
    endif
    FormatText checksumname = red_flag '%z_TRG_Flag_Red' z = <zone_name>
    if IsInNodeArray <red_flag>
        Kill name = <red_flag>
    endif
    FormatText checksumname = red_base '%z_TRG_Flag_Red_Base' z = <zone_name>
    if IsInNodeArray <red_base>
        Kill name = <red_base>
    endif
    FormatText checksumname = blue_flag '%z_TRG_Flag_Blue' z = <zone_name>
    if IsInNodeArray <blue_flag>
        Kill name = <blue_flag>
    endif
    FormatText checksumname = blue_base '%z_TRG_Flag_Blue_Base' z = <zone_name>
    if IsInNodeArray <blue_base>
        Kill name = <blue_base>
    endif
    FormatText checksumname = green_flag '%z_TRG_Flag_Green' z = <zone_name>
    if IsInNodeArray <green_flag>
        Kill name = <green_flag>
    endif
    FormatText checksumname = green_base '%z_TRG_Flag_Green_Base' z = <zone_name>
    if IsInNodeArray <green_base>
        Kill name = <green_base>
    endif
    FormatText checksumname = yellow_flag '%z_TRG_Flag_Yellow' z = <zone_name>
    if IsInNodeArray <yellow_flag>
        Kill name = <yellow_flag>
    endif
    FormatText checksumname = yellow_base '%z_TRG_Flag_Yellow_Base' z = <zone_name>
    if IsInNodeArray <yellow_base>
        Kill name = <yellow_base>
    endif
    FormatText checksumname = red_flag '%z_TRG_CTF_Red' z = <zone_name>
    if IsInNodeArray <red_flag>
        Kill name = <red_flag>
    endif
    FormatText checksumname = red_base '%z_TRG_CTF_Red_Base' z = <zone_name>
    if IsInNodeArray <red_base>
        Kill name = <red_base>
    endif
    FormatText checksumname = blue_flag '%z_TRG_CTF_Blue' z = <zone_name>
    if IsInNodeArray <blue_flag>
        Kill name = <blue_flag>
    endif
    FormatText checksumname = blue_base '%z_TRG_CTF_Blue_Base' z = <zone_name>
    if IsInNodeArray <blue_base>
        Kill name = <blue_base>
    endif
    FormatText checksumname = green_flag '%z_TRG_CTF_Green' z = <zone_name>
    if IsInNodeArray <green_flag>
        Kill name = <green_flag>
    endif
    FormatText checksumname = green_base '%z_TRG_CTF_Green_Base' z = <zone_name>
    if IsInNodeArray <green_base>
        Kill name = <green_base>
    endif
    FormatText checksumname = yellow_flag '%z_TRG_CTF_Yellow' z = <zone_name>
    if IsInNodeArray <yellow_flag>
        Kill name = <yellow_flag>
    endif
    FormatText checksumname = yellow_base '%z_TRG_CTF_Yellow_Base' z = <zone_name>
    if IsInNodeArray <yellow_base>
        Kill name = <yellow_base>
    endif
endscript

script create_team_flags 
    if NOT GetCurrentZoneName
        script_assert 'Create_Team_Flags called before zone map created'
    endif
    if GameModeEquals is_lobby
        FormatText checksumname = red_flag '%z_TRG_Flag_Red' z = <zone_name>
        if IsInNodeArray <red_flag>
            Create name = <red_flag>
        endif
        FormatText checksumname = red_base '%z_TRG_Flag_Red_Base' z = <zone_name>
        if IsInNodeArray <red_base>
            Create name = <red_base>
        endif
        if (<num_teams> > 1)
            FormatText checksumname = blue_flag '%z_TRG_Flag_Blue' z = <zone_name>
            if IsInNodeArray <blue_flag>
                Create name = <blue_flag>
            endif
            FormatText checksumname = blue_base '%z_TRG_Flag_Blue_Base' z = <zone_name>
            if IsInNodeArray <blue_base>
                Create name = <blue_base>
            endif
        endif
        if (<num_teams> > 2)
            FormatText checksumname = green_flag '%z_TRG_Flag_Green' z = <zone_name>
            if IsInNodeArray <green_flag>
                Create name = <green_flag>
            endif
            FormatText checksumname = green_base '%z_TRG_Flag_Green_Base' z = <zone_name>
            if IsInNodeArray <green_base>
                Create name = <green_base>
            endif
        endif
        if (<num_teams> > 3)
            FormatText checksumname = yellow_flag '%z_TRG_Flag_Yellow' z = <zone_name>
            if IsInNodeArray <yellow_flag>
                Create name = <yellow_flag>
            endif
            FormatText checksumname = yellow_base '%z_TRG_Flag_Yellow_Base' z = <zone_name>
            if IsInNodeArray <yellow_base>
                Create name = <yellow_base>
            endif
        endif
    else
        GetNumPlayersOnTeam team = 0
        if (<num_members> > 0)
            FormatText checksumname = red_flag '%z_TRG_CTF_Red' z = <zone_name>
            if IsInNodeArray <red_flag>
                Create name = <red_flag>
            endif
            FormatText checksumname = red_base '%z_TRG_CTF_Red_Base' z = <zone_name>
            if IsInNodeArray <red_base>
                Create name = <red_base>
            endif
        endif
        GetNumPlayersOnTeam team = 1
        if (<num_members> > 0)
            FormatText checksumname = blue_flag '%z_TRG_CTF_Blue' z = <zone_name>
            if IsInNodeArray <blue_flag>
                Create name = <blue_flag>
            endif
            FormatText checksumname = blue_base '%z_TRG_CTF_Blue_Base' z = <zone_name>
            if IsInNodeArray <blue_base>
                Create name = <blue_base>
            endif
        endif
        GetNumPlayersOnTeam team = 2
        if (<num_members> > 0)
            FormatText checksumname = green_flag '%z_TRG_CTF_Green' z = <zone_name>
            if IsInNodeArray <green_flag>
                Create name = <green_flag>
            endif
            FormatText checksumname = green_base '%z_TRG_CTF_Green_Base' z = <zone_name>
            if IsInNodeArray <green_base>
                Create name = <green_base>
            endif
        endif
        GetNumPlayersOnTeam team = 3
        if (<num_members> > 0)
            FormatText checksumname = yellow_flag '%z_TRG_CTF_Yellow' z = <zone_name>
            if IsInNodeArray <yellow_flag>
                Create name = <yellow_flag>
            endif
            FormatText checksumname = yellow_base '%z_TRG_CTF_Yellow_Base' z = <zone_name>
            if IsInNodeArray <yellow_base>
                Create name = <yellow_base>
            endif
        endif
    endif
endscript

script Team_Flag_Base 
    obj_setinnerradius \{ 10 }
    Obj_SetException Ex = objectinradius scr = CTF_Team_Base_Trigger params = { <...>  }
endscript

script BouncyShadow_Kill 
    printf \{ 'STUBBED!' }
    printf \{ 'Don\'t use BouncyShadow_Kill' }
    printf \{ 'See Jason or Dan for info on how to kill shadows!' }
endscript

script Pigeon_Generic_Idle_Perched 
    obj_shadowoff
    Obj_ClearExceptions
    obj_setinnerradius \{ 15 }
    Obj_SetException \{ Ex = objectinradius scr = Pigeon_Generic_SkaterNear_Perched }
    SpawnSound \{ SFX_Pigeon_idle }
    begin 
    begin 
    Ped_PlayAnim \{ anim = idle }
    Ped_WaitAnimFinished
    repeat randomrange (1.0, 3.0)
    Ped_PlayAnim \{ anim = Preen }
    Ped_WaitAnimFinished
    repeat 
endscript

script Pigeon_Generic_SkaterNear_Perched 
    Obj_ClearExceptions
    SpawnSound \{ SFX_Pigeon_Fly_Up }
    Ped_PlayAnim \{ anim = Flyhop }
    Ped_WaitAnimFinished
    goto \{ Pigeon_Generic_Idle_Perched }
endscript

script Pigeon_Generic_Idle 
    Obj_ClearExceptions
    obj_setinnerradius \{ 15 }
    Obj_SetException \{ Ex = objectinradius scr = Pigeon_Generic_SkaterNear }
    SpawnSound \{ NY_SFX_PigeonIdle }
    begin 
    Obj_CycleAnim anim = idle numCycles = randomrange (1.0, 3.0)
    Obj_CycleAnim \{ anim = PeckFromIdle }
    begin 
    obj_roty \{ Speed = 25 }
    Obj_CycleAnim \{ anim = Peck }
    obj_stoprotating
    repeat numCycles randomrange (1.0, 5.0)
    Obj_CycleAnim \{ anim = PeckToIdle }
    Obj_CycleAnim \{ anim = idle }
    Obj_CycleAnim \{ anim = Preen }
    repeat 
endscript

script Pigeon_Generic_SkaterNear 
    Obj_ClearExceptions
    obj_getrandomlink
    obj_movetolink Speed = 8 linknum = <link>
    obj_lookatnodelinked time = 0.2000 linknum = <link>
    obj_setinnerradius \{ 5 }
    Obj_SetException \{ Ex = objectinradius scr = Pigeon_Generic_SkaterReallyNear }
    Obj_PlayAnim \{ anim = run Cycle }
    Obj_WaitMove
    obj_setanimcyclemode \{ Off }
    Obj_WaitAnimFinished
    Obj_CycleAnim \{ anim = RunToIdle }
    obj_setinnerradius \{ 15 }
    Obj_SetException \{ Ex = objectinradius scr = Pigeon_Generic_SkaterNear }
    goto \{ Pigeon_Generic_Idle }
endscript

script Pigeon_Generic_SkaterReallyNear 
    Obj_ClearExceptions
    SpawnSound \{ NY_SFX_PigeonFlyUp }
    Obj_CycleAnim \{ anim = Flyhop }
    Obj_WaitMove
    obj_setinnerradius \{ 15 }
    Obj_SetException \{ Ex = objectinradius scr = Pigeon_Generic_SkaterNear }
    goto \{ Pigeon_Generic_Idle }
endscript

script Collect_Hover 
    obj_roty \{ Speed = 150 }
    obj_hover \{ amp = 10 freq = 1 }
endscript

script ShatterAndDie {area = 1000
        variance = 4.600
        vel_x = Random (@ 0.0 @ 30 @ -30)
        vel_y = Random (@ 10 @ 30 @ 50)
        vel_z = Random (@ 0 @ 30 @ -30)
        spread = 1.0
        texture_swap = ba_apm_brokenglass01
    }
    Kill name = <name>
    if GotParam OldStyle
        Shatter {
            name = <name>
            area = <area>
            variance = <variance>
            vel_x = <vel_x>
            vel_y = <vel_y>
            vel_z = <vel_z>
            spread = <spread>
            <...> 
        }
    else
        Shatter {
            name = <name>
            texture_swap = <texture_swap>
            area = <area>
            variance = <variance>
            vel_x = <vel_x>
            vel_y = <vel_y>
            vel_z = <vel_z>
            spread = <spread>
            <...> 
        }
    endif
    if GotParam vibrate
        getsingletag state
        if NOT ((<state> = Skater_OnRail)|| (<state> = Skater_InManual))
            vibrate actuator = 0 percent = 100
            wait 5 gameframes
            vibrate Off
        endif
    endif
endscript

script FirstSwap_VO 
endscript

script Takeover_VO 
endscript

script CAG_Boundary 
endscript
