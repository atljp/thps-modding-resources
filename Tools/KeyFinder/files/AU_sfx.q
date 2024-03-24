AU_SFX_WalkingOnTheBeach = 0

script AU_LoadingSounds 
    LoadSound 'Shared\Menu\CheatBad'
    LoadSound 'Shared\Hits\HitGlassPane2x'
    LoadSound 'Shared\Auto\LA_Skid_11' vol = 100 dropoff = 150
    LoadSound 'Shared\Auto\CarBrakeSqueal' vol = 100 dropoff = 150
    LoadSound 'Shared\Auto\CarHorn_11' vol = 100 dropoff = 150
    LoadSound 'Shared\Hits\HitMetalCan' vol = 100 dropoff = 150 PosUpdateWithDoppler
    LoadSound 'Shared\Hits\BonkBush' vol = 100 dropoff = 0
    LoadSound 'Shared\Water\FallWater'
    LoadSound 'Shared\Auto\CarLoop' vol = 100 dropoff = 150 PosUpdateWithDoppler
    LoadSound 'Vehicles\Silent_Vehicle_Tire_Loop'
    LoadSound 'Terrains\BonkMetal_11'
    LoadSound 'BouncyObjects\Bouncy_AluminumCanHit01'
    LoadSound 'BouncyObjects\Bouncy_AluminumCanHit02'
    LoadSound 'BouncyObjects\Bouncy_BottleNonBreakHit01'
    LoadSound 'BouncyObjects\Bouncy_BottleNonBreakHit02'
    LoadSound 'BouncyObjects\Bouncy_MetalTrashHit02'
    LoadSound 'BouncyObjects\Bouncy_UmbrellaHit01'
    LoadSound 'BouncyObjects\Bouncy_UmbrellaHit02'
    LoadSound 'BA\SK6_TrashCanHitSpin02'
    LoadSound 'BouncyObjects\Bouncy_MetalHit01'
    LoadSound 'BouncyObjects\Bouncy_BeachBallHit02'
    LoadSound 'BouncyObjects\Bouncy_WoodPole_Hit01'
    LoadSound 'BouncyObjects\Bouncy_WoodenTableHit01'
    LoadSound 'BouncyObjects\Bouncy_WoodenTableHit02'
    LoadSound 'BouncyObjects\Bouncy_PlasticMetalChair01'
    LoadSound 'BouncyObjects\Bouncy_PlasticGarbageHit01'
    LoadSound 'Au\AU_PoppingStreetLight'
    LoadSound 'BO\SK6_BO_RiverLoop01_11'
    LoadSound 'AU\AU_HitHandiSign'
    LoadSound 'AU\AU_KartLoop'
    LoadSound 'AU\AU_KartLand'
    LoadSound 'AU\AU_KartJump'
    LoadSound 'AU\AU_KartGrind'
    LoadSound 'AU\AU_SANDSTEP01'
    LoadSound 'AU\AU_SANDSTEP02'
    LoadSound 'AU\AU_SANDSTEP03'
    if (debugsoundfx = 1)
        DumpHeaps
    endif
endscript


script AU_SFX_DrainPool 
    if NOT IsStreamPlaying DrainingThePool
        PlayStream AU_DrainPool vol = 100 id = DrainingThePool priority = 101
    endif
endscript


script AU_SFX_ElectricSparks 
    begin 
    RandomNoRepeat (
        @ obj_playstream SK6_SmSpark01 emitter = TRG_SFX_SOB_SwitchBreakElectric dropoff_function = exponential priority = StreamPriorityLow
        wait 0.7000 seconds
        @ obj_playstream SK6_SmSpark02 emitter = TRG_SFX_SOB_SwitchBreakElectric dropoff_function = exponential priority = StreamPriorityLow
        wait 0.6500 seconds
        @ obj_playstream SK6_SmSpark03 emitter = TRG_SFX_SOB_SwitchBreakElectric dropoff_function = exponential priority = StreamPriorityLow
        wait 0.4800 seconds
        @ obj_playstream SK6_SmSpark04 emitter = TRG_SFX_SOB_SwitchBreakElectric dropoff_function = exponential priority = StreamPriorityLow
        wait 0.4200 seconds
        @ obj_playstream SK6_SmSpark05 emitter = TRG_SFX_SOB_SwitchBreakElectric dropoff_function = exponential priority = StreamPriorityLow
        wait 0.8600 seconds
        @ obj_playstream SK6_SmSpark06 emitter = TRG_SFX_SOB_SwitchBreakElectric dropoff_function = exponential priority = StreamPriorityLow
        wait 0.09000 seconds
        @ obj_playstream SK6_SmSpark07 emitter = TRG_SFX_SOB_SwitchBreakElectric dropoff_function = exponential priority = StreamPriorityLow
        wait 0.4400 seconds
        @ obj_playstream SK6_SmSpark08 emitter = TRG_SFX_SOB_SwitchBreakElectric dropoff_function = exponential priority = StreamPriorityLow
        wait 0.9900 seconds
        @ obj_playstream SK6_SmSpark09 emitter = TRG_SFX_SOB_SwitchBreakElectric dropoff_function = exponential priority = StreamPriorityLow
        wait 0.4300 seconds
        @ obj_playstream SK6_SmSpark10 emitter = TRG_SFX_SOB_SwitchBreakElectric dropoff_function = exponential priority = StreamPriorityLow
        wait 0.6600 seconds
        @ obj_playstream SK6_SmSpark11 emitter = TRG_SFX_SOB_SwitchBreakElectric dropoff_function = exponential priority = StreamPriorityLow
        wait 0.4600 seconds
        @ obj_playstream SK6_SmSpark12 emitter = TRG_SFX_SOB_SwitchBreakElectric dropoff_function = exponential priority = StreamPriorityLow
        wait 0.5900 seconds
        @ obj_playstream SK6_SmSpark13 emitter = TRG_SFX_SOB_SwitchBreakElectric dropoff_function = exponential priority = StreamPriorityLow
        wait 0.5300 seconds
        @ obj_playstream SK6_SmSpark14 emitter = TRG_SFX_SOB_SwitchBreakElectric dropoff_function = exponential priority = StreamPriorityLow
        wait 1.0 seconds
        @ obj_playstream SK6_SmSpark15 emitter = TRG_SFX_SOB_SwitchBreakElectric dropoff_function = exponential priority = StreamPriorityLow
        wait 1.080 seconds
        @ obj_playstream SK6_SmSpark16 emitter = TRG_SFX_SOB_SwitchBreakElectric dropoff_function = exponential priority = StreamPriorityLow
        wait 1.540 seconds
        @ obj_playstream SK6_SmSpark17 emitter = TRG_SFX_SOB_SwitchBreakElectric dropoff_function = exponential priority = StreamPriorityLow
        wait 0.6800 seconds
        @ obj_playstream SK6_SmSpark18 emitter = TRG_SFX_SOB_SwitchBreakElectric dropoff_function = exponential priority = StreamPriorityLow
        wait 1.220 seconds
        @ obj_playstream SK6_SmSpark19 emitter = TRG_SFX_SOB_SwitchBreakElectric dropoff_function = exponential priority = StreamPriorityLow
        wait 0.5100 seconds
        @ obj_playstream SK6_SmSpark20 emitter = TRG_SFX_SOB_SwitchBreakElectric dropoff_function = exponential priority = StreamPriorityLow
        wait 0.3400 seconds
        @ obj_playstream SK6_SmSpark21 emitter = TRG_SFX_SOB_SwitchBreakElectric dropoff_function = exponential priority = StreamPriorityLow
        wait 0.3600 seconds
    )
    wait 0.1000 seconds
    repeat 
endscript


script AU_SFX_Waves01 
    if SkaterCamAnimFinished
        if NOT IsStreamPlaying AU_SFX_WavesLeftStream
            begin 
            RandomNoRepeat (
                @ obj_playstream AU_WavesLeft01 vol = 50 emitter = TRG_SFX_SOB_Waves01 dropoff_function = inv_exponential id = AU_SFX_WavesLeftStream
                @ obj_playstream AU_WavesLeft02 vol = 50 emitter = TRG_SFX_SOB_Waves01 dropoff_function = inv_exponential id = AU_SFX_WavesLeftStream
                @ obj_playstream AU_WavesLeft03 vol = 50 emitter = TRG_SFX_SOB_Waves01 dropoff_function = inv_exponential id = AU_SFX_WavesLeftStream
                @ obj_playstream AU_WavesLeft04 vol = 50 emitter = TRG_SFX_SOB_Waves01 dropoff_function = inv_exponential id = AU_SFX_WavesLeftStream
                @ obj_playstream AU_WavesLeft05 vol = 50 emitter = TRG_SFX_SOB_Waves01 dropoff_function = inv_exponential id = AU_SFX_WavesLeftStream
                @ obj_playstream AU_WavesLeft06 vol = 50 emitter = TRG_SFX_SOB_Waves01 dropoff_function = inv_exponential id = AU_SFX_WavesLeftStream
            )
            wait 23 seconds
            repeat 
        endif
    endif
endscript


script AU_SFX_Waves02 
    if SkaterCamAnimFinished
        if NOT IsStreamPlaying AU_SFX_WavesRightStream
            begin 
            RandomNoRepeat (
                @ obj_playstream AU_WavesRight01 vol = 50 emitter = TRG_SFX_SOB_Waves02 dropoff_function = inv_exponential id = AU_SFX_WavesRightStream
                @ obj_playstream AU_WavesRight02 vol = 50 emitter = TRG_SFX_SOB_Waves02 dropoff_function = inv_exponential id = AU_SFX_WavesRightStream
                @ obj_playstream AU_WavesRight03 vol = 50 emitter = TRG_SFX_SOB_Waves02 dropoff_function = inv_exponential id = AU_SFX_WavesRightStream
                @ obj_playstream AU_WavesRight04 vol = 50 emitter = TRG_SFX_SOB_Waves02 dropoff_function = inv_exponential id = AU_SFX_WavesRightStream
                @ obj_playstream AU_WavesRight05 vol = 50 emitter = TRG_SFX_SOB_Waves02 dropoff_function = inv_exponential id = AU_SFX_WavesRightStream
                @ obj_playstream AU_WavesRight06 vol = 50 emitter = TRG_SFX_SOB_Waves02 dropoff_function = inv_exponential id = AU_SFX_WavesRightStream
            )
            wait 23 seconds
            repeat 
        endif
    endif
endscript


script AU_SFX_ScreamingpeopleAtCafe 
    if NOT IsStreamPlaying AU_PeopleScreaming
        RandomNoRepeat (
            @ PlayStream SK6_AU_Crowd_Scream01 vol = 170 priority = StreamPriorityHigh id = AU_PeopleScreaming
            @ PlayStream SK6_AU_Crowd_Scream02 vol = 170 priority = StreamPriorityHigh id = AU_PeopleScreaming
            @ PlayStream SK6_AU_Crowd_Scream03 vol = 170 priority = StreamPriorityHigh id = AU_PeopleScreaming
        )
    endif
endscript


script AU_SFX_ToiletFlush 
    if NOT IsStreamPlaying ThisToiletFlushing
        PlayStream AU_SFX_ToiletFlush vol = 65 id = ThisToiletFlushing
    endif
endscript


script AU_SFX_Aborigine_Waterfall 
    obj_playsound SK6_BO_RiverLoop01_11 vol = 50 emitter = TRG_SFX_SOB_AborigineWaterfall
endscript


script AU_SFX_Aborigine_Jungle 
endscript


script AU_SFX_Aborigine_Music_Volume_Box 
    if (StaticMusicBoxesOn = 1)
        SFX_Music_Volume_Box
    endif
endscript


script AU_SFX_Aborigine_Music 
    if NOT InSplitScreenGame
        if SkaterCamAnimFinished
            if NOT IsStreamPlaying Aborigine_Stream
                RandomNoRepeat (
                    @ obj_playstream Aborigine_02 vol = 150 id = Aborigine_Stream emitter = TRG_SFX_SOB_AborigineMusic dropoff_function = inv_exponential num_loops = -1
                    @ obj_playstream Aborigine_03 vol = 150 id = Aborigine_Stream emitter = TRG_SFX_SOB_AborigineMusic dropoff_function = inv_exponential num_loops = -1
                    @ obj_playstream Aborigine_04 vol = 150 id = Aborigine_Stream emitter = TRG_SFX_SOB_AborigineMusic dropoff_function = inv_exponential num_loops = -1
                    @ obj_playstream Aborigine_05 vol = 150 id = Aborigine_Stream emitter = TRG_SFX_SOB_AborigineMusic dropoff_function = inv_exponential num_loops = -1
                )
                obj_addstream Aborigine_Stream Add = Aborigine_01 vol = 150
                wait 1 gameframe
                obj_removestream Aborigine_Stream remove = Aborigine_02
                obj_removestream Aborigine_Stream remove = Aborigine_03
                obj_removestream Aborigine_Stream remove = Aborigine_04
                obj_removestream Aborigine_Stream remove = Aborigine_05
            endif
        endif
    endif
endscript


script AU_SFX_Cracked_Hydrant 
    obj_playsound SK6_BO_RiverLoop01_11 vol = 160 pitch = 200 emitter = TRG_SFX_SOB_Hydrant dropoff_function = inv_exponential
endscript


script AU_SFX_Snoring_Worker 
    if NOT IsStreamPlaying CraneEngineIdleSFX
        obj_playstream SK6_AU_CraneEngineIdle vol = 150 emitter = TRG_SFX_SOB_SnoringWorker id = CraneEngineIdleSFX num_loops = -1 priority = StreamPriorityMidHigh dropoff_function = exponential
    endif
    if NOT InNetGame
        begin 
        if NOT IsStreamPlaying ConstructionSnoring
            RandomNoRepeat (
                @ obj_playstream AU_WorkerSnoring01 vol = 200 emitter = TRG_SFX_SOB_SnoringWorker priority = StreamPriorityLowMid id = ConstructionSnoring
                @ obj_playstream AU_WorkerSnoring02 vol = 200 emitter = TRG_SFX_SOB_SnoringWorker priority = StreamPriorityLowMid id = ConstructionSnoring
                @ obj_playstream AU_WorkerSnoring03 vol = 200 emitter = TRG_SFX_SOB_SnoringWorker priority = StreamPriorityLowMid id = ConstructionSnoring
                @ obj_playstream AU_WorkerSnoring04 vol = 200 emitter = TRG_SFX_SOB_SnoringWorker priority = StreamPriorityLowMid id = ConstructionSnoring
                @ obj_playstream AU_WorkerSnoring05 vol = 200 emitter = TRG_SFX_SOB_SnoringWorker priority = StreamPriorityLowMid id = ConstructionSnoring
            )
        endif
        wait 2 seconds
        repeat 
    endif
endscript


script AU_SFX_OutdoorCafe 
    if SkaterCamAnimFinished
        if NOT IsStreamPlaying AU_OutdoorCafe
            obj_playstream AU_OutdoorCafe emitter = TRG_SFX_SOB_OutdoorCafe priority = StreamPriorityHigh num_loops = -1
        endif
    endif
endscript


script AU_SFX_Lifeguard_Yelling 
endscript


script AU_SFX_Seagull_Idle 
endscript


script AU_SFX_Seagull_Fly_Up 
    StopStream SeagullFlyUpStream
    wait 1 gameframe
    if NOT IsStreamPlaying SeagullFlyUpStream
        Random (
            @ obj_playstream AU_Seagull_Fly_Up_01 id = GullFlyUpSound vol = 150 id = SeagullFlyUpStream
            @ obj_playstream AU_Seagull_Fly_Up_02 id = GullFlyUpSound vol = 150 id = SeagullFlyUpStream
        )
    endif
endscript


script AU_SFX_Metal_Detector_Beep 
    begin 
    if NOT IsStreamPlaying MetDetStream
        RandomNoRepeat (
            @ obj_playstream AU_Met_Detector_Beep_01 vol = 100 priority = StreamPriorityLow dropoff = 150 id = MetDetStream
            @ obj_playstream AU_Met_Detector_Beep_02 vol = 100 priority = StreamPriorityLow dropoff = 150 id = MetDetStream
        )
    endif
    wait 2 seconds
    repeat 2
endscript


script AU_SFX_Metal_Detector_FindVO 
    obj_stopstream MetDetStream
    RandomNoRepeat (
        @ obj_playstream AU_Met_Detector_Beep_01 vol = 100 priority = StreamPriorityLow dropoff = 150 id = MetDetStream
        @ obj_playstream AU_Met_Detector_Beep_02 vol = 100 priority = StreamPriorityLow dropoff = 150 id = MetDetStream
    )
    wait 2 seconds
    RandomNoRepeat (
        @ obj_playstream AU_Met_Det_Guy_Find_VO_01 vol = 200 priority = StreamPriorityMid dropoff = 150 id = MetDetStream
        @ obj_playstream AU_Met_Det_Guy_Find_VO_02 vol = 200 priority = StreamPriorityMid dropoff = 150 id = MetDetStream
        @ obj_playstream AU_Met_Det_Guy_Find_VO_03 vol = 200 priority = StreamPriorityMid dropoff = 150 id = MetDetStream
    )
endscript


script AU_SFX_Bridge_Reverb 
    if NOT GameIsPaused
        if NOT InSplitScreenGame
            if (inside)
                printf 'Inside Subway Reverb Box 01'
                change InsideAdjacentReverbBox01 = 1
                GetValueFromVolume cdvol
                if (InsideAdjacentReverbBox02 = 0)
                    if (<value> = 0)
                        SetSfxReverb 50 mode = REV_MODE_ROOM
                    else
                        SetSfxReverb 60 mode = REV_MODE_ROOM
                    endif
                endif
            else
                printf 'Outside Subway Reverb Box 01'
                if (InsideAdjacentReverbBox02 = 0)
                    SetSfxReverb 0 mode = REV_MODE_ROOM
                else
                endif
                change InsideAdjacentReverbBox01 = 0
            endif
        endif
    endif
endscript


script AU_SFX_SecreteAreaReverb01 
    if NOT GameIsPaused
        if NOT InSplitScreenGame
            if (inside)
                printf 'Inside Subway Reverb Box 01'
                change InsideAdjacentReverbBox01 = 1
                GetValueFromVolume cdvol
                if (InsideAdjacentReverbBox02 = 0)
                    if (<value> = 0)
                        SetSfxReverb 65 mode = REV_MODE_ROOM
                    else
                        SetSfxReverb 80 mode = REV_MODE_ROOM
                    endif
                endif
            else
                printf 'Outside Subway Reverb Box 01'
                if (InsideAdjacentReverbBox02 = 0)
                    SetSfxReverb 0 mode = REV_MODE_ROOM
                else
                endif
                change InsideAdjacentReverbBox01 = 0
            endif
        endif
    endif
endscript


script AU_BirdsFlyUpPoopOnGirls 
endscript


script AU_SFX_NIght_Crix01 
    if InSplitScreenGame
        if NOT IsStreamPlaying SK6_CrixLoop_01
            obj_playstream SK6_CrixLoop_01 vol = 30 num_loops = -1 priority = StreamPriorityHigh
        endif
    else
        obj_playstream SK6_CrixLoop_01 vol = 30 num_loops = -1 priority = StreamPriorityHigh
    endif
endscript


script AU_SFX_NIght_Crix02 
    if InSplitScreenGame
        if NOT IsStreamPlaying SK6_CrixLoop_01
            obj_playstream SK6_CrixLoop_01 vol = 30 num_loops = -1 priority = StreamPriorityHigh
        endif
    else
        obj_playstream SK6_CrixLoop_01 vol = 30 num_loops = -1 priority = StreamPriorityHigh
    endif
endscript


script SFX_HandleLandOnSand 
    RandomNoRepeat (
        @ obj_playsound (SFX_FootStepRun01)pitch = randomrange (97.0, 102.0) vol = randomrange (105.0, 120.0)
        @ obj_playsound (SFX_FootStepRun02)pitch = randomrange (97.0, 102.0) vol = randomrange (105.0, 120.0)
        @ obj_playsound (SFX_FootStepRun03)pitch = randomrange (97.0, 102.0) vol = randomrange (105.0, 120.0)
        @ obj_playsound (SFX_FootStepRun04)pitch = randomrange (97.0, 102.0) vol = randomrange (105.0, 120.0)
        @ obj_playsound (SFX_FootStepRun05)pitch = randomrange (97.0, 102.0) vol = randomrange (105.0, 120.0)
    )
    wait 0.1000 seconds
    RandomNoRepeat (
        @ obj_playsound (SFX_FootStepRun01)pitch = randomrange (97.0, 102.0) vol = randomrange (105.0, 120.0)
        @ obj_playsound (SFX_FootStepRun02)pitch = randomrange (97.0, 102.0) vol = randomrange (105.0, 120.0)
        @ obj_playsound (SFX_FootStepRun03)pitch = randomrange (97.0, 102.0) vol = randomrange (105.0, 120.0)
        @ obj_playsound (SFX_FootStepRun04)pitch = randomrange (97.0, 102.0) vol = randomrange (105.0, 120.0)
        @ obj_playsound (SFX_FootStepRun05)pitch = randomrange (97.0, 102.0) vol = randomrange (105.0, 120.0)
    )
endscript


script AU_SFX_Pigeons_Idle 
    if SkaterCamAnimFinished
        wait Random (@ 1 @ 0.5000 @ 0.1000) seconds
        if NOT IsStreamPlaying PigeonFlyUpSound
            if NOT IsStreamPlaying PigeonIdleSound
                Random (
                    @*2 
                    @ obj_playstream BO_Pigeon id = PigeonIdleSound vol = 50 pitch = randomrange (95.0, 100.0) priority = StreamPriorityLowMid
                    @ obj_playstream BO_Pigeon_02 id = PigeonIdleSound vol = 50 pitch = randomrange (95.0, 100.0) priority = StreamPriorityLowMid
                )
            endif
        endif
    endif
endscript


script AU_SFX_Pigeons_FlyUp 
    if IsStreamPlaying PigeonIdleSound
        StopStream PigeonIdleSound
    endif
    if IsStreamPlaying BO_Pigeon
        StopStream BO_Pigeon
    endif
    StopStream BO_PigeonFly
    if NOT IsStreamPlaying PigeonFlyUpSound
        obj_playstream BO_PigeonFly id = PigeonFlyUpSound vol = 150
    endif
endscript

