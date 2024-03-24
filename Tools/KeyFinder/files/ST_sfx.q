
ST_WaitingLogJumpScript = 0

script ST_LoadingSounds 
    LoadSound 'Shared\Water\BucketSplash'
    LoadSound 'Shared\Hits\HitGlassPane2x'
    LoadSound 'Shared\Auto\LA_Skid_11' vol = 100 dropoff = 150
    LoadSound 'Shared\Auto\CarBrakeSqueal' vol = 100 dropoff = 150
    LoadSound 'Shared\Auto\CarHorn_11' vol = 100 dropoff = 150
    LoadSound 'Shared\Hits\HitMetalCan' vol = 100 dropoff = 150 PosUpdateWithDoppler
    LoadSound 'Shared\Hits\BonkBush' vol = 100 dropoff = 0
    LoadSound 'Shared\Auto\CarLoop' vol = 100 dropoff = 150 PosUpdateWithDoppler
    LoadSound 'Vehicles\Silent_Vehicle_Tire_Loop'
    LoadSound 'Terrains\BonkMetal_11'
    LoadSound 'BO\SK6_BO_FireLoop'
    LoadSound 'ST\ST_Expl_Lrg01'
    LoadSound 'ST\ST_Expl_Lrg02'
    LoadSound 'ST\ST_Expl_Lrg03'
    LoadSound 'St\ST_LogLaunch'
    LoadSound 'BO\SK6_BO_RiverLoop01_11'
    LoadSound 'NJ\NJ_woodbreak01'
    LoadSound 'ST\ST_PullyLaunch01'
    LoadSound 'ST\ST_BeehiveHit_Scrape'
    LoadSound 'ST\ST_OldSchoolJump'
    LoadSound 'ST\ST_BowlingStrike'
    LoadSound 'ST\ST_BonfireLoop'
    LoadSound 'BouncyObjects\Bouncy_BeachBallHit02'
    LoadSound 'BouncyObjects\Bouncy_PlasticGarbageHit01'
    LoadSound 'BouncyObjects\Bouncy_WoodenBarrelHit01'
    LoadSound 'BouncyObjects\Bouncy_WoodenBarrelHit02'
    LoadSound 'BouncyObjects\Bouncy_TombstoneHit02'
    LoadSound 'BouncyObjects\Bouncy_WoodenTableHit02'
    LoadSound 'BouncyObjects\Bouncy_MetalTableHit02'
    LoadSound 'BouncyObjects\Bouncy_BowlingBall_Hit01'
    LoadSound 'BouncyObjects\Bouncy_BowlingPin_Hit01'
    LoadSound 'BouncyObjects\Bouncy_MetalDrumHit02'
    if (debugsoundfx = 1)
        DumpHeaps
    endif
endscript


script ST_SFX_Bonfire 
    obj_playsound ST_BonfireLoop vol = 130 emitter = TRG_SFX_SOB_Bonfire dropoff_function = exponential
endscript


script ST_SFX_ChickenCoop01 
endscript


script ST_SFX_ChickenCoop02 
endscript


script ST_SFX_WaterPipe01 
    obj_playsound SK6_BO_RiverLoop01_11 vol = 80 pitch = 200 emitter = TRG_SFX_SOB_WaterPipe01
endscript


script ST_SFX_WaterPipe02 
    obj_playsound SK6_BO_RiverLoop01_11 vol = 50 pitch = 150 emitter = TRG_SFX_SOB_WaterPipe02
endscript


script ST_SFX_Generator01 
endscript


script ST_SFX_BeeHive01 
    if NOT IsStreamPlaying ThisBeeHiveSFX
        obj_playstream SK6_BA_FliesOnShit emitter = TRG_SFX_SOB_BeeHive01 vol = 100 dropoff_function = linear id = ThisBeeHiveSFX num_loops = -1
    endif
endscript


script ST_SFX_BeeHive02 
    if NOT IsStreamPlaying ThisBeeHiveSFX
        obj_playstream SK6_BA_FliesOnShit emitter = TRG_SFX_SOB_BeeHive02 vol = 100 dropoff_function = linear id = ThisBeeHiveSFX num_loops = -1
    endif
endscript


script ST_SFX_BeeHive03 
    if NOT IsStreamPlaying ThisBeeHiveSFX
        obj_playstream SK6_BA_FliesOnShit emitter = TRG_SFX_SOB_BeeHive03 vol = 100 dropoff_function = linear id = ThisBeeHiveSFX num_loops = -1
    endif
endscript


script ST_SFX_BeeHive04 
    if NOT IsStreamPlaying ThisBeeHiveSFX
        obj_playstream SK6_BA_FliesOnShit emitter = TRG_SFX_SOB_BeeHive04 vol = 100 dropoff_function = linear id = ThisBeeHiveSFX num_loops = -1
    endif
endscript


script ST_SFX_BeeHive05 
    if NOT IsStreamPlaying ThisBeeHiveSFX
        obj_playstream SK6_BA_FliesOnShit emitter = TRG_SFX_SOB_BeeHive05 vol = 100 dropoff_function = linear id = ThisBeeHiveSFX num_loops = -1
    endif
endscript


script ST_SFX_HouseBeeps01 
    begin 
    obj_playstream ST_Suitcase_ServoBeeps01 vol = 70 emitter = TRG_SFX_SOB_HouseBeeps01
    wait 3 seconds
    repeat 
endscript


script ST_SFX_GlobeBeeps01 
    begin 
    obj_playstream ST_Suitcase_ServoBeeps01 vol = 70 emitter = TRG_SFX_SOB_GlobeBeeps01
    wait 3 seconds
    repeat 
endscript


script ST_SFX_SuitcaseBeeps01 
    begin 
    obj_playstream ST_Suitcase_ServoBeeps01 vol = 70 emitter = TRG_SFX_TrigBox_SuitcaseBeeps01
    wait 3 seconds
    repeat 
endscript


script ST_SFX_SuitcaseBeeps02 
    begin 
    obj_playstream ST_Suitcase_ServoBeeps01 vol = 70 emitter = TRG_SFX_SOB_SuitcaseBeeps02
    wait 3 seconds
    repeat 
endscript


script ST_SFX_Day_Forest01 
endscript


script ST_SFX_Day_Forest02 
endscript


script ST_SFX_Day_Forest03 
endscript


script ST_SFX_Day_Forest04 
endscript


script ST_SFX_Day_Forest05 
endscript


script ST_SFX_Day_Forest06 
endscript


script ST_SFX_Night_Forest01 
    if InSplitScreenGame
        if NOT IsStreamPlaying SK6_CrixLoop_01
            obj_playstream SK6_CrixLoop_01 vol = 30 num_loops = -1 priority = StreamPriorityHigh
        endif
    else
        obj_playstream SK6_CrixLoop_01 vol = 30 num_loops = -1 priority = StreamPriorityHigh
    endif
endscript


script ST_SFX_Night_Forest02 
    if InSplitScreenGame
        if NOT IsStreamPlaying SK6_CrixLoop_01
            obj_playstream SK6_CrixLoop_01 vol = 30 num_loops = -1 priority = StreamPriorityHigh
        endif
    else
        obj_playstream SK6_CrixLoop_01 vol = 30 num_loops = -1 priority = StreamPriorityHigh
    endif
endscript


script ST_SFX_Night_Forest05 
    if InSplitScreenGame
        if NOT IsStreamPlaying SK6_CrixLoop_01
            obj_playstream SK6_CrixLoop_01 vol = 30 num_loops = -1 priority = StreamPriorityHigh
        endif
    else
        obj_playstream SK6_CrixLoop_01 vol = 30 num_loops = -1 priority = StreamPriorityHigh
    endif
endscript


script ST_SFX_Night_Forest06 
    if InSplitScreenGame
        if NOT IsStreamPlaying SK6_CrixLoop_01
            obj_playstream SK6_CrixLoop_01 vol = 30 num_loops = -1 priority = StreamPriorityHigh
        endif
    else
        obj_playstream SK6_CrixLoop_01 vol = 30 num_loops = -1 priority = StreamPriorityHigh
    endif
endscript


script ST_SFX_MineReverb01 
    if NOT GameIsPaused
        if NOT InSplitScreenGame
            if (inside)
                change InsideAdjacentReverbBox01 = 1
                GetValueFromVolume cdvol
                if (InsideAdjacentReverbBox02 = 0)
                    if (InsideAdjacentReverbBox03 = 0)
                        if (<value> = 0)
                            SetSfxReverb 60 mode = REV_MODE_ARENA
                        else
                            SetSfxReverb 75 mode = REV_MODE_ARENA
                        endif
                    endif
                endif
            else
                if (InsideAdjacentReverbBox02 = 0)
                    if (InsideAdjacentReverbBox03 = 0)
                        SetSfxReverb 0 mode = REV_MODE_ARENA
                    else
                    endif
                else
                endif
                change InsideAdjacentReverbBox01 = 0
            endif
        endif
    endif
endscript


script ST_SFX_MineReverb02 
    if NOT GameIsPaused
        if NOT InSplitScreenGame
            if (inside)
                change InsideAdjacentReverbBox02 = 1
                GetValueFromVolume cdvol
                if (InsideAdjacentReverbBox01 = 0)
                    if (InsideAdjacentReverbBox03 = 0)
                        if (<value> = 0)
                            SetSfxReverb 60 mode = REV_MODE_ARENA
                        else
                            SetSfxReverb 75 mode = REV_MODE_ARENA
                        endif
                    endif
                endif
            else
                if (InsideAdjacentReverbBox01 = 0)
                    if (InsideAdjacentReverbBox03 = 0)
                        SetSfxReverb 0 mode = REV_MODE_ARENA
                    else
                    endif
                else
                endif
                change InsideAdjacentReverbBox02 = 0
            endif
        endif
    endif
endscript


script ST_SFX_BarnReverb01 
    if NOT GameIsPaused
        if NOT InSplitScreenGame
            if (inside)
                change InsideAdjacentReverbBox01 = 1
                GetValueFromVolume cdvol
                if (InsideAdjacentReverbBox02 = 0)
                    if (InsideAdjacentReverbBox03 = 0)
                        if (<value> = 0)
                            SetSfxReverb 60 mode = REV_MODE_ROOM
                        else
                            SetSfxReverb 75 mode = REV_MODE_ROOM
                        endif
                    endif
                endif
            else
                if (InsideAdjacentReverbBox02 = 0)
                    if (InsideAdjacentReverbBox03 = 0)
                        SetSfxReverb 0 mode = REV_MODE_ROOM
                    else
                    endif
                else
                endif
                change InsideAdjacentReverbBox01 = 0
            endif
        endif
    endif
endscript


script ST_SFX_ExplodingGarbage 
    wait 0.1000 seconds
    Random (
        @ playsound ST_Expl_Lrg01 vol = 400
        @ playsound ST_Expl_Lrg02 vol = 400
        @ playsound ST_Expl_Lrg03 vol = 400
    )
endscript


script ST_SFX_BreakWood 
    playsound NJ_woodbreak01 pitch = Random (@ 80 @ 100 @ 120)
endscript


script ST_SFX_BreakMetalRoof 
endscript


script ST_SFX_GrowTree 
endscript


script ST_SFX_BreakOffBeeHive 
    playsound ST_BeehiveHit_Scrape
endscript


script ST_SFX_Chicken_Hit01 
    RandomNoRepeat (
        @ PlayStream ST_ChickenCoopMayhem01 vol = 200 priority = StreamPriorityHigh
        @ PlayStream ST_ChickenCoopMayhem02 vol = 200 priority = StreamPriorityHigh
        @ PlayStream ST_ChickenCoopMayhem03 vol = 200 priority = StreamPriorityHigh
        @ PlayStream ST_ChickenCoopMayhem04 vol = 200 priority = StreamPriorityHigh
        @ PlayStream ST_ChickenCoopMayhem05 vol = 200 priority = StreamPriorityHigh
    )
endscript


script ST_SFX_CollectChainsaw 
endscript


script ST_SFX_CollectSkunkClassic 
endscript


script ST_SFX_BreakRoofAboveHalfPipe 
    StopStream SK6_BreakMetalFence
    playsound HitGlassPane2x pitch = 50
    wait 1 gameframe
    PlayStream SK6_BreakMetalFence vol = 200
endscript


script ST_SFX_Cat_Jump_On_Skater 
    Random (
        @ PlayStream ST_Cat_Angry01 vol = 200 priority = StreamPriorityMidHigh dropoff = 150
        @ PlayStream ST_Cat_Angry02 vol = 200 priority = StreamPriorityMidHigh dropoff = 150
    )
endscript


script ST_SFX_Hit_Bees_No_Wallride 
    playsound BailSlap01
endscript


script ST_SFX_Grab_Balloon 
endscript


script ST_SFX_Random_Dog_Whimper 
    if NOT IsStreamPlaying DogSFXStream
        Random (
            @*3 obj_playstream ST_DogBarks01 vol = 200 dropoff = 120 priority = StreamPriorityHigh id = DogSFXStream
            @*3 obj_playstream ST_DogBarks02 vol = 200 dropoff = 120 priority = StreamPriorityHigh id = DogSFXStream
            @*3 obj_playstream ST_DogBarks03 vol = 200 dropoff = 120 priority = StreamPriorityHigh id = DogSFXStream
            @*3 obj_playstream ST_DogBarks04 vol = 200 dropoff = 120 priority = StreamPriorityHigh id = DogSFXStream
            @*3 obj_playstream ST_DogBarks05 vol = 200 dropoff = 120 priority = StreamPriorityHigh id = DogSFXStream
            @*3 obj_playstream ST_DogGoal_Collect vol = 200 dropoff = 120 priority = StreamPriorityHigh id = DogSFXStream
            @ obj_playstream ST_DogWhimper01 vol = 200 dropoff = 120 priority = StreamPriorityHigh id = DogSFXStream
            @ obj_playstream ST_DogWhimper02 vol = 200 dropoff = 120 priority = StreamPriorityHigh id = DogSFXStream
            @ obj_playstream ST_DogWhimper03 vol = 200 dropoff = 120 priority = StreamPriorityHigh id = DogSFXStream
            @ obj_playstream ST_DogWhimper04 vol = 200 dropoff = 120 priority = StreamPriorityHigh id = DogSFXStream
            @ obj_playstream ST_DogWhimper05 vol = 200 dropoff = 120 priority = StreamPriorityHigh id = DogSFXStream
        )
    endif
endscript


script ST_SFX_Bomb01_activated 
    Create name = TRG_SFX_TrigBox_GlobeBeeps01
endscript


script ST_SFX_Bomb02_activated 
    Create name = TRG_SFX_TrigBox_SuitcaseBeeps01
endscript


script ST_SFX_Bomb03_activated 
    Create name = TRG_SFX_TrigBox_SuitcaseBeeps02
endscript


script ST_SFX_Bomb04_activated 
endscript


script ST_SFX_Bomb05_activated 
    Create name = TRG_SFX_TrigBox_HouseBeeps01
endscript


script ST_SFX_Skater_Ignite 
    if NOT issoundplaying SK6_BO_FireLoop
        skater ::obj_playsound SK6_BO_FireLoop vol = 110 pitch = 120
    endif
endscript


script ST_SFX_Skater_PutOutFire 
    skater ::obj_stopsound SK6_BO_FireLoop
    skater ::obj_stopsound SK6_BO_FireLoop
endscript


script ST_SFX_BugZapHouse01 
endscript


script ST_SFX_BugZapTop01 
endscript


script ST_SFX_LogBoost 
    playsound ST_LogLaunch pitch = randomrange (95.0, 105.0)
    wait 0.1000 seconds
    change ST_WaitingLogJumpScript = 0
endscript


script ST_SFX_EG_Fire01 
    if SkaterCamAnimFinished
        obj_playsound ST_BonfireLoop pitch = 80 vol = 200 dropoff_function = inv_exponential emitter = TRG_SFX_SOB_EG_Fire01
    endif
endscript


script ST_SFX_EG_Fire02 
    if SkaterCamAnimFinished
        obj_playsound SK6_BO_FireLoop pitch = 70 vol = 200 dropoff_function = inv_exponential emitter = TRG_SFX_SOB_EG_Fire02
    endif
endscript


script ST_SFX_EG_Fire03 
    obj_playsound SK6_BO_FireLoop pitch = 100 vol = 200 dropoff_function = inv_exponential emitter = TRG_SFX_SOB_EG_Fire03
endscript


script ST_SFX_EG_Fire04 
    if SkaterCamAnimFinished
        obj_playsound SK6_BO_FireLoop pitch = 120 vol = 200 dropoff_function = inv_exponential emitter = TRG_SFX_SOB_EG_Fire04
    endif
endscript


script ST_SFX_EG_Fire05 
    if SkaterCamAnimFinished
        obj_playsound SK6_BO_FireLoop pitch = 80 vol = 200 dropoff_function = inv_exponential emitter = TRG_SFX_SOB_EG_Fire05
    endif
endscript


script ST_SFX_EG_Fire06 
    obj_playsound ST_BonfireLoop pitch = 180 vol = 200 dropoff_function = inv_exponential emitter = TRG_SFX_SOB_EG_Fire06
endscript


script ST_SFX_EG_Fire07 
    begin 
    if NOT IsStreamPlaying RomanCandleSFXStream
        obj_playstream ST_EscapeGoal02 vol = 200 dropoff_function = inv_exponential emitter = TRG_SFX_SOB_EG_Fire07 id = RomanCandleSFXStream num_loops = -1 priority = StreamPriorityHigh
    endif
    wait 0.5000 seconds
    repeat 
endscript


script ST_SFX_EG_Fire08 
    begin 
    if NOT IsStreamPlaying RocketsLaunchingStream
        obj_playstream ST_EscapeGoal03 vol = 200 dropoff_function = inv_exponential emitter = TRG_SFX_SOB_EG_Fire08 id = RocketsLaunchingStream num_loops = -1 priority = StreamPriorityHigh
    endif
    wait 0.5000 seconds
    repeat 
endscript


script ST_SFX_EG_Fire09 
    begin 
    if NOT IsStreamPlaying SpinningFireworkStream
        obj_playstream ST_EscapeGoal01 vol = 200 dropoff_function = inv_exponential emitter = TRG_SFX_SOB_EG_Fire09 id = SpinningFireworkStream num_loops = -1 priority = StreamPriorityHigh
    endif
    wait 0.5000 seconds
    repeat 
endscript


script ST_SFX_EG_Fire10 
    obj_playsound ST_BonfireLoop pitch = 120 vol = 200 dropoff_function = inv_exponential emitter = TRG_SFX_SOB_EG_Fire10
endscript

