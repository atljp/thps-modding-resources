

script Sk3_KillSkater 
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
                if NOT InSplitScreenGame
                    if GotParam Message1
                        create_panel_message {
                            style = panel_message_death
                            id = death_message
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
                                text = Random (
                                    @ 'Don\'t drink and drive!'
                                    @ 'Learn to drive!'
                                    @*2 'Out of bounds!'
                                )
                            }
                        else
                            create_panel_message {
                                style = panel_message_death
                                id = death_message
                                text = Random (
                                    @ 'You suck!'
                                    @ 'Don\'t do drugs!'
                                    @ 'Stay in school!'
                                    @ 'This is your brain on drugs!'
                                    @ 'Nice one!'
                                    @ 'Good one!'
                                    @ 'Hmmmmm...'
                                    @ 'Loser!'
                                    @ 'Who loaned you that board?'
                                    @*4 'Out of bounds!'
                                )
                            }
                        endif
                    endif
                endif
            endif
        endif
        SK3_Killskater_Finish <...> 
    endif
endscript


script SK3_KillSkater_Water 
    if obj_flagnotset FLAG_SKATER_KILLING
        obj_setflag FLAG_SKATER_KILLING
        if GotParam DeathSound
            playsound <DeathSound>
        else
            playsound FallWater
        endif
        if NOT InSplitScreenGame
            if NOT GetGlobalFlag flag = NO_DISPLAY_HUD
                if GotParam Message1
                    create_panel_message {
                        style = panel_message_death
                        id = death_message
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
                        text = Random (
                            @ 'All wet'
                            @ 'You big drip!'
                            @ 'WATER... BAAAD!'
                            @ 'No swimming'
                            @ 'You\'re drowning!'
                            @ 'You\'re hosed!'
                        )
                    }
                endif
            endif
        endif
        SK3_Killskater_Finish water r = 100 g = 100 b = 200 <...> 
    endif
endscript


script SK3_KillSkater_Pungee 
    if obj_flagnotset FLAG_SKATER_KILLING
        obj_setflag FLAG_SKATER_KILLING
        playsound FallPungee_11
        if NOT InSplitScreenGame
            if NOT GetGlobalFlag flag = NO_DISPLAY_HUD
                if NOT GotParam Lava
                    create_panel_message {
                        style = panel_message_death
                        id = death_message
                        text = Random (
                            @ 'You got shafted'
                            @ 'Who built that?!'
                            @ 'Serve, set, spike!'
                            @ 'Shish kabob?'
                            @ 'Don\'t build this at home!'
                        )
                    }
                else
                    create_panel_message {
                        style = panel_message_death
                        id = death_message
                        text = Random (
                            @ 'Toasted toes!'
                            @ 'Burnt to a crisp!'
                            @ 'Grilled to perfection!'
                            @ 'Ouch!'
                            @ 'Death by hot lava!'
                        )
                    }
                endif
            endif
        endif
        SK3_Killskater_Finish r = 150 g = 50 b = 50 <...> 
    endif
endscript


script SK4_Hide_Death_Message 
    if ObjectExists id = death_message
        SetScreenElementProps id = death_message rgba = [ 0 0 0 0 ]
    endif
endscript


script SK3_Killskater_Finish r = 255 g = 255 b = 255
    if NOT driving
        obj_getid
        LaunchEvent type = KillingSkater target = <ObjID>
    endif
    disableplayerinput
    if GotParam bail
        if skating
            MakeSkaterGoto Killskater_Bail
        endif
    endif
    pulse_blur start = 0 end = 255 Speed = 4
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
    off_set = (0.0, 20.0)
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
    PlayAnim anim = Bail_Spin_FWD_Regular BlendPeriod = 0.3000
endscript


script SK3_TeleportToNode 
    TeleportSkaterToNode <...> 
endscript


script TeleportSkaterToNode r = 255 g = 255 b = 255
    if GotParam Message1
        LaunchPanelMessage properties = panel_message_death Random (
            @ ) <Message1>
    else
        LaunchPanelMessage properties = panel_message_death 'On the Move!'
    endif
    if GotParam vertair
    endif
    if GotParam nodeName
        
        if skating
            if onrail
                ClearEventBuffer
                ClearTrickQueue
                KillExtraTricks
                ClearExtraGrindTrick
                stopbalancetrick
                MakeSkaterGoto GroundGone
            endif
        endif
        pulse_blur start = 255 Speed = 5
        obj_movetonode name = <nodeName> orient NoReset
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
        setstate Air
        CleanUpSpecialItems
        stopbalancetrick
        MakeSkaterGoto GroundGone
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
            
            
            <DefaultSpeed> = 20
            
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
        obj_playsound <CarLoopSFX> dropoff_function = exponential
    endif
    if GotParam StickToGround
        obj_sticktoground on distabove = 2 distbelow = 2
    endif
    if GotParam NoSkater
    else
        obj_spawnscript Car_CheckForSkater01 params = <...> 
    endif
    if GotParam skitch
        Obj_SetException Ex = Skitched scr = <skitch>
    endif
    obj_spawnscript Car_CheckForOtherCar01 params = <...> 
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
    wait 10 gameframes
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
                Car_Sound_FranticStop01
                obj_stopalongpath 8
                obj_setflag FLAG_CAR_GENERIC_STOPPED_SKATER
                begin 
                wait 90 gameframes
                if obj_objectinrect <p1>
                    KillSpawnedScript id = CarAccelSound
                    wait 60 gameframes
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
    wait 10 gameframes
    if obj_flagnotset FLAG_CAR_GENERIC_STOPPED
        CarGeneric_GetNextObjOnPath_Decel <...> 
        gettags
        obj_getnextobjonpath range = <LookAheadCheckDist_Decel>
        if GotParam ob
            obj_spawnscript Car_DecelForOtherCar01 params = <...> 
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
        
    endif
    if obj_flagset FLAG_CAR_TYPE_HPRV
        
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
    wait 60 gameframes
    repeat 
endscript


script Car_StartForOtherCar01 
    SpawnSound Car_Sound_Accel01 id = CarAccelSound
    obj_clearflag FLAG_CAR_GENERIC_STOPPED
    wait 20 gameframes
    if obj_flagnotset FLAG_CAR_GENERIC_STOPPED_SKATER
        obj_setpathvelocity 30 mph
        obj_startalongpath
    endif
endscript


script CarGeneric_GetNextObjOnPath_Decel 
    LookAheadCheckDist_Decel = 45
    if GotParam bus
        LookAheadCheckDist_Decel = (<LookAheadCheckDist_Decel> + 20)
    else
        if GotParam HPRV
            LookAheadCheckDist_Decel = (<LookAheadCheckDist_Decel> + 20)
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
        
        LookAheadCheckDist = (<LookAheadCheckDist> + 50)
    endif
    settags LookAheadCheckDist = <LookAheadCheckDist>
endscript


script Car_Sound_Accel01 
    gettags
    if obj_flagnotset FLAG_CAR_GENERIC_NOSOUND
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
    KillSpawnedScript id = CarAccelSound
    gettags
    if obj_flagnotset FLAG_CAR_GENERIC_NOSOUND
        obj_adjustsound {
            <CarLoopSFX>
            volumepercent = 40
            VolumeStep = 2
            pitchpercent = randomrange (40.0, 50.0)
            pitchStep = 1
        }
        wait 1 second
        SpawnSound Auto_SFX_CarBrakeSqueal
    endif
endscript


script Car_Sound_Stop01 
    KillSpawnedScript id = CarAccelSound
    gettags
    if obj_flagnotset FLAG_CAR_GENERIC_NOSOUND
        obj_adjustsound {
            <CarLoopSFX>
            volumepercent = 25
            VolumeStep = 1.500
            pitchpercent = 30
            pitchStep = 1.500
        }
        SpawnSound Auto_SFX_CarBrakeSqueal
    endif
endscript


script Car_Sound_FranticStop01 
    KillSpawnedScript id = CarAccelSound
    gettags
    if obj_flagnotset FLAG_CAR_GENERIC_NOSOUND
        if obj_flagnotset FLAG_CAR_SOUND_FRANTICSTOP
            SpawnSound Auto_SFX_Car_Tire_Squeal
            Random (@ @ @ 
                @ SpawnSound Auto_SFX_Car_Horn_Stream)
        endif
    endif
    obj_spawnscript Car_Counter_FranticStop01
endscript


script Car_Counter_FranticStop01 
    obj_setflag FLAG_CAR_SOUND_FRANTICSTOP
    KillSpawnedScript id = CarAccelSound
    wait 120 gameframes
    obj_clearflag FLAG_CAR_SOUND_FRANTICSTOP
endscript


script Car_Sound_RandomHonk01 
    if obj_flagnotset FLAG_CAR_GENERIC_NOSOUND
        Random (@*20 
            @ SpawnSound Auto_SFX_Car_Horn_Stream)
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
    if obj_flagset FLAG_CAR_SKITCH
    else
        gettags
        getrandomvalue name = AccelSpeed a = (<DefaultSpeed> * 0.9000)b = (<DefaultSpeed> * 1.200)
        obj_setpathvelocity <AccelSpeed> mph
        SpawnSound Car_Sound_Accel01 id = CarAccelSound
    endif
endscript


script Car_Decel01 
    if obj_flagset FLAG_CAR_SKITCH
    else
        KillSpawnedScript id = CarAccelSound
        gettags
        getrandomvalue name = DecelSpeed a = (<DefaultSpeed> * 0.6000)b = (<DefaultSpeed> * 0.7000)
        obj_setpathvelocity <DecelSpeed> mph
        if GotParam printstruct
            
            
        endif
    endif
endscript


script Car_DecelForTurn01 
    if obj_flagset FLAG_CAR_SKITCH
    else
        KillSpawnedScript id = CarAccelSound
        settags Tag_TurnDist = <TurnDist>
        gettags
        getrandomvalue name = DecelSpeed a = (<DefaultSpeed> * 0.6000)b = (<DefaultSpeed> * 0.7000)
        if (<DecelSpeed> < 20)
            <DecelSpeed> = 20
        endif
        obj_setpathvelocity <DecelSpeed> mph
        obj_setpathturndist <Tag_TurnDist>
        Car_Sound_Decel01
        if GotParam printstruct
            
            
        endif
    endif
endscript


script Car_DecelForOtherCar01 
    KillSpawnedScript id = CarAccelSound
    Car_Decel01 <...> 
    wait 120 gameframes
    Car_AccelAfterDecelForCar01 <...> 
endscript


script Car_Start01 
    wait randomrange (800.0, 1200.0)
    obj_clearflag FLAG_CAR_GENERIC_STOPPED
    obj_startalongpath
    SpawnSound Car_Sound_Accel01 id = CarAccelSound
endscript


script Ped_StopAtNode01 
    obj_setanimcyclemode Off
    Obj_WaitAnimFinished
    PlayAnimWithPartialAnimIfExists anim = WalkToIdle
    wait 2 gameframes
    obj_stopalongpath
    Obj_WaitAnimFinished
endscript


script Ped_WalkToNextNode01 
    Random (
        @ obj_setpathvelocity 4
        obj_startalongpath
        Obj_CycleAnim anim = IdleToWalk
        PlayAnimWithPartialAnimIfExists anim = Walk1 Cycle
        @ obj_setpathvelocity 4
        obj_startalongpath
        Obj_CycleAnim anim = IdleToWalk
        PlayAnimWithPartialAnimIfExists anim = Walk2 Cycle
    )
endscript


script Ped_RandomWaitAtNode01 
    Ped_StopAtNode01
    Obj_CycleAnim anim = idle
    begin 
    Random (
        @ Ped_Idle01
        @ goto Ped_WalkToNextNode01
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
        
        Obj_SetException Ex = objectinradius scr = Team_Flag_Trigger params = { <...>  }
    else
        if GameModeEquals is_ctf
            
            if OnServer
                
                Obj_SetException Ex = anyobjectinradius scr = CTF_Team_Flag_Trigger params = { <...>  }
            endif
        endif
    endif
endscript


script Team_Flag_Trigger 
    GetNumTeams
    if GotParam blue
        JoinTeam blue
        Kill name = TRG_Flag_Red
        Kill name = TRG_Flag_Green
        Kill name = TRG_Flag_Yellow
        Create name = TRG_Flag_Red
        switch <num_teams>
            case 3
            Create name = TRG_Flag_Green
            case 4
            Create name = TRG_Flag_Green
            Create name = TRG_Flag_Yellow
        endswitch
        Die
    endif
    if GotParam red
        JoinTeam red
        Kill name = TRG_Flag_Blue
        Kill name = TRG_Flag_Green
        Kill name = TRG_Flag_Yellow
        Create name = TRG_Flag_Blue
        switch <num_teams>
            case 3
            Create name = TRG_Flag_Green
            case 4
            Create name = TRG_Flag_Green
            Create name = TRG_Flag_Yellow
        endswitch
        Die
    endif
    if GotParam green
        JoinTeam green
        Kill name = TRG_Flag_Blue
        Kill name = TRG_Flag_Red
        Kill name = TRG_Flag_Yellow
        Create name = TRG_Flag_Blue
        Create name = TRG_Flag_Red
        switch <num_teams>
            case 4
            Create name = TRG_Flag_Yellow
        endswitch
        Die
    endif
    if GotParam yellow
        JoinTeam yellow
        Kill name = TRG_Flag_Blue
        Kill name = TRG_Flag_Red
        Kill name = TRG_Flag_Green
        Create name = TRG_Flag_Blue
        Create name = TRG_Flag_Red
        Create name = TRG_Flag_Green
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
    create_net_panel_message msg_time = 2000 text = net_message_flag_base_warning
endscript


script CTF_Team_Flag_Trigger 
    
    wait 1 gameframe
    if JustStartedNetGame
        
        return 
    endif
    
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
    if NodeExists TRG_Flag_Red
        Kill name = TRG_Flag_Red
    endif
    if NodeExists TRG_Flag_Blue
        Kill name = TRG_Flag_Blue
    endif
    if NodeExists TRG_Flag_Green
        Kill name = TRG_Flag_Green
    endif
    if NodeExists TRG_Flag_Yellow
        Kill name = TRG_Flag_Yellow
    endif
    if NodeExists TRG_Flag_Red_Base
        Kill name = TRG_Flag_Red_Base
    endif
    if NodeExists TRG_Flag_Blue_Base
        Kill name = TRG_Flag_Blue_Base
    endif
    if NodeExists TRG_Flag_Green_Base
        Kill name = TRG_Flag_Green_Base
    endif
    if NodeExists TRG_Flag_Yellow_Base
        Kill name = TRG_Flag_Yellow_Base
    endif
    if NodeExists TRG_CTF_Red
        Kill name = TRG_CTF_Red
    endif
    if NodeExists TRG_CTF_Red_Base
        Kill name = TRG_CTF_Red_Base
    endif
    if NodeExists TRG_CTF_Blue
        Kill name = TRG_CTF_Blue
    endif
    if NodeExists TRG_CTF_Blue_Base
        Kill name = TRG_CTF_Blue_Base
    endif
    if NodeExists TRG_CTF_Green
        Kill name = TRG_CTF_Green
    endif
    if NodeExists TRG_CTF_Green_Base
        Kill name = TRG_CTF_Green_Base
    endif
    if NodeExists TRG_CTF_Yellow
        Kill name = TRG_CTF_Yellow
    endif
    if NodeExists TRG_CTF_Yellow_Base
        Kill name = TRG_CTF_Yellow_Base
    endif
endscript


script create_team_flags 
    if GameModeEquals is_lobby
        switch <num_teams>
            case 1
            if NodeExists TRG_Flag_Red
                Create name = TRG_Flag_Red
            endif
            if NodeExists TRG_Flag_Red_Base
                Create name = TRG_Flag_Red_Base
            endif
            case 2
            if NodeExists TRG_Flag_Red
                Create name = TRG_Flag_Red
            endif
            if NodeExists TRG_Flag_Blue
                Create name = TRG_Flag_Blue
            endif
            if NodeExists TRG_Flag_Red_Base
                Create name = TRG_Flag_Red_Base
            endif
            if NodeExists TRG_Flag_Blue_Base
                Create name = TRG_Flag_Blue_Base
            endif
            case 3
            if NodeExists TRG_Flag_Red
                Create name = TRG_Flag_Red
            endif
            if NodeExists TRG_Flag_Blue
                Create name = TRG_Flag_Blue
            endif
            if NodeExists TRG_Flag_Green
                Create name = TRG_Flag_Green
            endif
            if NodeExists TRG_Flag_Red_Base
                Create name = TRG_Flag_Red_Base
            endif
            if NodeExists TRG_Flag_Blue_Base
                Create name = TRG_Flag_Blue_Base
            endif
            if NodeExists TRG_Flag_Green_Base
                Create name = TRG_Flag_Green_Base
            endif
            case 4
            if NodeExists TRG_Flag_Red
                Create name = TRG_Flag_Red
            endif
            if NodeExists TRG_Flag_Blue
                Create name = TRG_Flag_Blue
            endif
            if NodeExists TRG_Flag_Green
                Create name = TRG_Flag_Green
            endif
            if NodeExists TRG_Flag_Yellow
                Create name = TRG_Flag_Yellow
            endif
            if NodeExists TRG_Flag_Red_Base
                Create name = TRG_Flag_Red_Base
            endif
            if NodeExists TRG_Flag_Blue_Base
                Create name = TRG_Flag_Blue_Base
            endif
            if NodeExists TRG_Flag_Green_Base
                Create name = TRG_Flag_Green_Base
            endif
            if NodeExists TRG_Flag_Yellow_Base
                Create name = TRG_Flag_Yellow_Base
            endif
        endswitch
    else
        GetNumPlayersOnTeam team = 0
        if (<num_members> = 0)
        else
            if NodeExists TRG_CTF_Red
                Create name = TRG_CTF_Red
            endif
            if NodeExists TRG_CTF_Red_Base
                Create name = TRG_CTF_Red_Base
            endif
        endif
        GetNumPlayersOnTeam team = 1
        if (<num_members> = 0)
        else
            if NodeExists TRG_CTF_Blue
                Create name = TRG_CTF_Blue
            endif
            if NodeExists TRG_CTF_Blue_Base
                Create name = TRG_CTF_Blue_Base
            endif
        endif
        GetNumPlayersOnTeam team = 2
        if (<num_members> = 0)
        else
            if NodeExists TRG_CTF_Green
                Create name = TRG_CTF_Green
            endif
            if NodeExists TRG_CTF_Green_Base
                Create name = TRG_CTF_Green_Base
            endif
        endif
        GetNumPlayersOnTeam team = 3
        if (<num_members> = 0)
        else
            if NodeExists TRG_CTF_Yellow
                Create name = TRG_CTF_Yellow
            endif
            if NodeExists TRG_CTF_Yellow_Base
                Create name = TRG_CTF_Yellow_Base
            endif
        endif
    endif
endscript


script Team_Flag_Base 
    obj_setinnerradius 10
    Obj_SetException Ex = objectinradius scr = CTF_Team_Base_Trigger params = { <...>  }
endscript


script BouncyShadow_Kill 
    FormatText textname = ShadowName '%o_shadow' o = <objectname>
    
    Kill prefix = <ShadowName>
endscript


script Pigeon_Generic 
    obj_shadowoff
    if GotParam perched
        Pigeon_Generic_Idle_Perched
    else
        Pigeon_Generic_Idle
    endif
endscript


script Pigeon_Generic_Idle_Perched 
    Obj_ClearExceptions
    obj_setinnerradius 15
    Obj_SetException Ex = objectinradius scr = Pigeon_Generic_SkaterNear_Perched
    SpawnSound NY_SFX_PigeonIdle
    begin 
    Obj_CycleAnim anim = idle numCycles = randomrange (1.0, 3.0)
    Obj_CycleAnim anim = Preen
    repeat 
endscript


script Pigeon_Generic_SkaterNear_Perched 
    Obj_ClearExceptions
    SpawnSound NY_SFX_PigeonFlyUp
    Obj_CycleAnim anim = Flyhop
    goto Pigeon_Generic_Idle_Perched
endscript


script Pigeon_Generic_Idle 
    Obj_ClearExceptions
    obj_setinnerradius 15
    Obj_SetException Ex = objectinradius scr = Pigeon_Generic_SkaterNear
    SpawnSound NY_SFX_PigeonIdle
    begin 
    Obj_CycleAnim anim = idle numCycles = randomrange (1.0, 3.0)
    Obj_CycleAnim anim = PeckFromIdle
    begin 
    obj_roty Speed = 25
    Obj_CycleAnim anim = Peck
    obj_stoprotating
    repeat numCycles randomrange (1.0, 5.0)
    Obj_CycleAnim anim = PeckToIdle
    Obj_CycleAnim anim = idle
    Obj_CycleAnim anim = Preen
    repeat 
endscript


script Pigeon_Generic_SkaterNear 
    Obj_ClearExceptions
    obj_getrandomlink
    obj_movetolink Speed = 8 linknum = <link>
    obj_lookatnodelinked time = 0.2000 linknum = <link>
    obj_setinnerradius 5
    Obj_SetException Ex = objectinradius scr = Pigeon_Generic_SkaterReallyNear
    PlayAnimWithPartialAnimIfExists anim = run Cycle
    Obj_WaitMove
    obj_setanimcyclemode Off
    Obj_WaitAnimFinished
    Obj_CycleAnim anim = RunToIdle
    obj_setinnerradius 15
    Obj_SetException Ex = objectinradius scr = Pigeon_Generic_SkaterNear
    goto Pigeon_Generic_Idle
endscript


script Pigeon_Generic_SkaterReallyNear 
    Obj_ClearExceptions
    SpawnSound NY_SFX_PigeonFlyUp
    Obj_CycleAnim anim = Flyhop
    Obj_WaitMove
    obj_setinnerradius 15
    Obj_SetException Ex = objectinradius scr = Pigeon_Generic_SkaterNear
    goto Pigeon_Generic_Idle
endscript


script Gap_Gen_Rail2Rail 
    Gap_Gen_RailHop <...> 
endscript


script Gap_Gen_Ledge2Ledge 
    Gap_Gen_LedgeHop <...> 
endscript


script Gap_Gen_Rail2Ledge 
    if GotParam start
        Gap_Gen_Rail <...> 
    else
        Gap_Gen_End GapID = <GapID> text = 'Rail 2 Ledge' Score = 50 <...> 
    endif
endscript


script Gap_Gen_Rail2Bench 
    if GotParam start
        Gap_Gen_Rail <...> 
    else
        Gap_Gen_End GapID = <GapID> text = 'Rail 2 Bench' Score = 50 <...> 
    endif
endscript


script Gap_Gen_Ledge2Rail 
    if GotParam start
        Gap_Gen_Rail <...> 
    else
        Gap_Gen_End GapID = <GapID> text = 'Ledge 2 Rail' Score = 50 <...> 
    endif
endscript


script Gap_Gen_Ledge2Bench 
    if GotParam start
        Gap_Gen_Rail <...> 
    else
        Gap_Gen_End GapID = <GapID> text = 'Ledge 2 Bench' Score = 50 <...> 
    endif
endscript


script Gap_Gen_Wire2Ledge 
    if GotParam start
        Gap_Gen_Rail <...> 
    else
        Gap_Gen_End GapID = <GapID> text = 'Wire 2 Ledge' Score = 50 <...> 
    endif
endscript


script Gap_Gen_Bench2Rail 
    if GotParam start
        Gap_Gen_Rail <...> 
    else
        Gap_Gen_End GapID = <GapID> text = 'Bench 2 Rail' Score = 50 <...> 
    endif
endscript


script Gap_Gen_Bench2Ledge 
    if GotParam start
        Gap_Gen_Rail <...> 
    else
        Gap_Gen_End GapID = <GapID> text = 'Bench 2 Ledge' Score = 50 <...> 
    endif
endscript


script Gap_Gen_WireHop 
    if GotParam start
        Gap_Gen_Rail <...> 
    else
        Gap_Gen_End GapID = <GapID> text = 'Wire hop' Score = 25 <...> 
    endif
endscript


script Gap_Gen_BenchHop 
    if GotParam start
        Gap_Gen_Rail <...> 
    else
        Gap_Gen_End GapID = <GapID> text = 'Bench hop' Score = 25 <...> 
    endif
endscript


script Gap_Gen_RailHop 
    if GotParam start
        Gap_Gen_Rail <...> 
    else
        Gap_Gen_End GapID = <GapID> text = 'Rail hop' Score = 25 <...> 
    endif
endscript


script Gap_Gen_LedgeHop 
    if GotParam start
        Gap_Gen_Rail <...> 
    else
        Gap_Gen_End GapID = <GapID> text = 'Ledge hop' Score = 25 <...> 
    endif
endscript


script Gap_Gen_AcrossTheStreet 
    if GotParam start
        Gap_Gen_Rail <...> 
    else
        Gap_Gen_End GapID = <GapID> text = 'Across the street' Score = 50 <...> 
    endif
endscript


script Gap_Gen_HighLip 
    if GotParam start
        StartGap {
            GapID = <GapID>
            flags = [
                REQUIRE_LIP
                CANCEL_GROUND
                CANCEL_WALL
                CANCEL_MANUAL
                CANCEL_RAIL
                CANCEL_WALLPLANT
                CANCEL_HANG
                CANCEL_LADDER
            ]
            <...> 
        }
    else
        wait 1 frame
        Gap_Gen_End GapID = <GapID> text = 'High lip' Score = 100 <...> 
    endif
endscript


script Gap_Gen_RampTransfer 
    if GotParam start
        StartGap {
            GapID = <GapID>
            flags = PURE_AIR
            <...> }
    else
        Gap_Gen_End GapID = <GapID> text = 'Ramp Transfer' Score = 100 <...> 
    endif
endscript


script Gap_Gen_Rail 
    if GotParam start
        StartGap {
            GapID = <GapID>
            flags = [
                CANCEL_GROUND
                CANCEL_MANUAL
                CANCEL_WALL
                CANCEL_LIP
                CANCEL_WALLPLANT
                CANCEL_HANG
                CANCEL_LADDER
            ]
            <...> 
        }
    else
        if GotParam end
            Gap_Gen_End GapID = <GapID> text = <text> Score = <Score> <...> 
        else
            
        endif
    endif
endscript


script Gap_Gen_Lip 
    if GotParam start
        StartGap {
            GapID = <GapID>
            flags = [
                REQUIRE_LIP
                CANCEL_GROUND
                CANCEL_WALL
                CANCEL_MANUAL
                CANCEL_RAIL
                CANCEL_WALLPLANT
                CANCEL_HANG
                CANCEL_LADDER
            ]
            <...> 
        }
    else
        if GotParam end
            wait 1 frame
            endgap {
                GapID = <GapID>
                text = <text>
                Score = <Score>
            }
        else
            
        endif
    endif
endscript


script Gap_Gen_Transfer 
    if GotParam start
        StartGap {
            GapID = <GapID>
            flags = PURE_AIR
            <...> 
        }
    else
        if GotParam end
            Gap_Gen_End GapID = <GapID> text = <text> Score = <Score> <...> 
        else
            
        endif
    endif
endscript


script Gap_Gen_PureAir 
    if GotParam start
        StartGap {
            GapID = <GapID>
            flags = PURE_AIR
            <...> 
        }
    else
        if GotParam end
            Gap_Gen_End GapID = <GapID> text = <text> Score = <Score> <...> 
        else
            
        endif
    endif
endscript


script Gap_Gen_Manual 
    if GotParam start
        StartGap {
            GapID = <GapID>
            flags = PURE_MANUAL
            <...> 
        }
    else
        if GotParam end
            Gap_Gen_End GapID = <GapID> text = <text> Score = <Score> <...> 
        else
            
        endif
    endif
endscript


script Gap_Gen_End 
    if GotParam end
        endgap {
            GapID = <GapID>
            text = <text>
            Score = <Score>
            <...> 
        }
    else
        
    endif
endscript


script Gap_CarHop gapscript = CarHopGapScript
    StartGap {GapID = <StartGapID> flags = PURE_AIR}
    endgap {GapID = <EndGapID> text = 'Car hop' Score = 100 gapscript = <gapscript>}
endscript


script CarHopGapScript 
    broadcastevent type = SkaterCarHop
endscript


script Collect_Hover 
    obj_roty Speed = 150
    obj_hover amp = 10 freq = 1
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


script CarTOD_TurnOffHeadlights 
    
    RunScriptOnComponentType {
        Component = Model
        target = obj_replacetexture
        params = {
            src = 'JKU_LightCircle_Transparent.png' dest = 'textures/cars/JKU_LightCircle_Transparent'
        }
    }
    RunScriptOnComponentType {
        Component = Model
        target = obj_replacetexture
        params = {
            src = 'JKU_HeadlightGlow_Transparent.png' dest = 'textures/cars/JKU_HeadlightGlow_Transparent'
        }
    }
endscript


script CarTOD_TurnOnHeadlights 
    
    RunScriptOnComponentType {
        Component = Model
        target = obj_replacetexture
        params = {
            src = 'JKU_LightCircle_Transparent.png' dest = 'textures/cars/JKU_LightCircle'
        }
    }
    RunScriptOnComponentType {
        Component = Model
        target = obj_replacetexture
        params = {
            src = 'JKU_HeadlightGlow_Transparent.png' dest = 'textures/cars/JKU_HeadlightGlow'
        }
    }
endscript


script FirstSwap_VO 
    get_current_skater_name
    switch <name>
        case benfranklin
        
        TRG_Ped_BenFranklin_Intro ::obj_playfam Ped_BenFranklin_FirstSwap_Lip vol = (GlobalHintVOVol)priority = StreamPriorityHighest
        case BullFighter
        
        TRG_Ped_BullFighter_Intro ::obj_playfam Ped_Bullfighter_FirstSwap_Lip vol = (GlobalHintVOVol)priority = StreamPriorityHighest
        case Burnquist
        
        TRG_Ped_TeammateIntroPro ::obj_playfam Burnquist_FirstSwap_Lip vol = (GlobalHintVOVol)priority = StreamPriorityHighest
        case chainsawskater
        
        TRG_Ped_Bigfoot_Intro ::obj_playfam Ped_Bigfoot_FirstSwap_Lip vol = (GlobalHintVOVol)priority = StreamPriorityHighest
        case GraffitiTagger
        
        TRG_Ped_Tagger_Intro ::obj_playfam Ped_GraffitiSkater_FirstSwap_Lip vol = (GlobalHintVOVol)priority = StreamPriorityHighest
        case Hawk
        
        TRG_Ped_TeammateIntroPro ::obj_playfam Hawk_FirstSwap_Lip vol = (GlobalHintVOVol)priority = StreamPriorityHighest
        case jester
        
        TRG_Ped_Jester_Intro ::obj_playfam Ped_Jester_FirstSwap_Lip vol = (GlobalHintVOVol)priority = StreamPriorityHighest
        case margera
        
        TRG_Ped_TeammateIntroPro ::obj_playfam Margera_FirstSwap_Lip vol = (GlobalHintVOVol)priority = StreamPriorityHighest
        case MechBullrider
        
        TRG_Ped_SteveO_Intro ::obj_playfam SteveO_FirstSwap_Lip vol = (GlobalHintVOVol)priority = StreamPriorityHighest
        case minikartdriver
        
        TRG_Ped_MiniKart_Intro ::obj_playfam Minikartguy_FirstSwap_Lip vol = (GlobalHintVOVol)priority = StreamPriorityHighest
        case Mullen
        
        TRG_Ped_TeammateIntroPro ::obj_playfam Mullen_FirstSwap_Lip vol = (GlobalHintVOVol)priority = StreamPriorityHighest
        case Muska
        
        TRG_Ped_TeammateIntroPro ::obj_playfam Muska_FirstSwap_Lip vol = (GlobalHintVOVol)priority = StreamPriorityHighest
        case Paulie
        
        PlayStream Paulie_FirstSwap_Lip vol = (GlobalHintVOVol)priority = StreamPriorityHighest
        case sheckler
        
        TRG_Ped_Sheckler_Intro ::obj_playfam Sheckler_FirstSwap_Lip vol = (GlobalHintVOVol)priority = StreamPriorityHighest
        case segwayrider
        
        TRG_Ped_Segway_Intro ::obj_playfam Ped_JesseJames_FirstSwap_Lip vol = (GlobalHintVOVol)priority = StreamPriorityHighest
        case ShrimpVendor
        
        TRG_Ped_ShrimpVendor_Intro ::obj_playfam Ped_ShrimpVendor_FirstSwap_Lip vol = (GlobalHintVOVol)priority = StreamPriorityHighest
        case Vallely
        
        TRG_Ped_TeammateIntroPro ::obj_playfam Vallely_FirstSwap_Lip vol = (GlobalHintVOVol)priority = StreamPriorityHighest
        case Voodoo
        
        TRG_ped_voodoo_intro ::obj_playfam Ped_WitchDoctor_FirstSwap_Lip vol = (GlobalHintVOVol)priority = StreamPriorityHighest
    endswitch
endscript


script Takeover_VO 
    view_goals_reminder_create
    get_current_skater_name
    
    switch <name>
        case benfranklin
        
        TakeOverVoicePrefix = 'Franklin'
        case BullFighter
        
        TakeOverVoicePrefix = 'Fighter'
        case Burnquist
        
        TakeOverVoicePrefix = 'Burnquist'
        case chainsawskater
        
        TakeOverVoicePrefix = 'Bigfoot'
        case custom
        
        TakeOverVoicePrefix = 'customm1'
        case Hawk
        
        TakeOverVoicePrefix = 'Hawk'
        case jester
        
        TakeOverVoicePrefix = 'Jester'
        case margera
        
        TakeOverVoicePrefix = 'Margera'
        case MechBullrider
        
        TakeOverVoicePrefix = 'Bullrider'
        case minikartdriver
        
        TakeOverVoicePrefix = 'Minikartguy'
        case Mullen
        
        TakeOverVoicePrefix = 'Mullen'
        case Muska
        
        TakeOverVoicePrefix = 'Muska'
        case Paulie
        
        TakeOverVoicePrefix = 'Paulie'
        case sheckler
        
        TakeOverVoicePrefix = 'Sheckler'
        case segwayrider
        
        TakeOverVoicePrefix = 'JesseJames'
        case ShrimpVendor
        
        TakeOverVoicePrefix = 'shrimpvendor'
        case Vallely
        
        TakeOverVoicePrefix = 'Vallely'
        case Voodoo
        
        TakeOverVoicePrefix = 'Witchdoctor'
        case GraffitiTagger
        
        TakeOverVoicePrefix = 'GraffitiSkater'
    endswitch
    begin 
    <TakeOverNumber> = RandomPermute (@ 1 @ 2 @ 3 @ 4 @ 5 @ 6 @ 7 @ 8 @ 9)
    FormatText checksumname = TakeOverStream '%t_TakeOver0%n' t = <TakeOverVoicePrefix> n = <TakeOverNumber>
    if NOT StreamExists <TakeOverStream>
        if (CheckForPedStreamExistence = 1)
            
        endif
    else
        break 
    endif
    wait 0.001000 seconds
    repeat 9
    if (<TakeOverVoicePrefix> = 'customm1')
        PlaySkaterStream type = 'takeover'
    else
        if NOT StreamExists <TakeOverStream>
            
            
            
            
            
            
            
            
            
            
            
            
            
            if (CheckForPedStreamExistence = 1)
                begin 
                playsound GUI_Buzzer01 vol = 200
                wait 0.2000 seconds
                repeat 10
            endif
        else
            if (CheckForPedStreamExistence = 1)
                
                
            endif
            if NOT IsStreamPlaying ProSwitch
                PlayStream <TakeOverStream> id = ProSwitch vol = 200 priority = StreamPriorityHigh
            endif
        endif
    endif
endscript


script CAG_Boundary 
endscript

