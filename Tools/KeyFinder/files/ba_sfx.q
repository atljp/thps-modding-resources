
BA_SFX_BirdChirpVol = 70
BA_SFX_BullFightingStreamPlaying = SK6_BA_BullCrowdConst01
BA_SFX_BullFightingStreamNext = SK6_BA_BullCrowdConst01
BA_SFX_DrawBridgeDone = 0

script BA_LoadingSounds 
    LoadSound 'Shared\Hits\HitGlassPane2x'
    LoadSound 'Shared\Auto\LA_Skid_11' vol = 100 dropoff = 150
    LoadSound 'Shared\Auto\CarBrakeSqueal' vol = 100 dropoff = 150
    LoadSound 'Shared\Auto\CarHorn_11' vol = 100 dropoff = 150
    LoadSound 'Shared\Hits\HitMetalCan' vol = 100 dropoff = 150 PosUpdateWithDoppler
    LoadSound 'Shared\Hits\BonkBush' vol = 100 dropoff = 0
    LoadSound 'Shared\Water\FallWater'
    LoadSound 'Shared\Hits\FallPungee_11'
    LoadSound 'Shared\Auto\CarLoop' vol = 100 dropoff = 150 PosUpdateWithDoppler
    LoadSound 'Vehicles\Silent_Vehicle_Tire_Loop'
    LoadSound 'Terrains\BonkMetal_11'
    LoadSound 'BouncyObjects\Bouncy_AluminumCanHit01'
    LoadSound 'BouncyObjects\Bouncy_AluminumCanHit02'
    LoadSound 'BouncyObjects\Bouncy_BottleNonBreakHit01'
    LoadSound 'BouncyObjects\Bouncy_BottleNonBreakHit02'
    LoadSound 'BouncyObjects\Bouncy_BasketballHit01'
    LoadSound 'BouncyObjects\Bouncy_CardboardBoxHit01'
    LoadSound 'BouncyObjects\Bouncy_CardboardBoxHit02'
    LoadSound 'BouncyObjects\Bouncy_OrangeConeHit01'
    LoadSound 'BouncyObjects\Bouncy_WoodenBarrelHit01'
    LoadSound 'BouncyObjects\Bouncy_WoodenBarrelHit02'
    LoadSound 'BouncyObjects\Bouncy_MetalTrashHit02'
    LoadSound 'BouncyObjects\Bouncy_UmbrellaHit01'
    LoadSound 'BouncyObjects\Bouncy_UmbrellaHit02'
    LoadSound 'BouncyObjects\Bouncy_PlasticChairHit01'
    LoadSound 'BouncyObjects\Bouncy_PlasticChairHit02'
    LoadSound 'BA\SK6_TrashCanHitSpin02'
    LoadSound 'BouncyObjects\Bouncy_MetalHit01'
    LoadSound 'Vehicles\SK6_BA_Scooter_Engine' PosUpdateWithDoppler
    LoadSound 'BA\SK6_BA_Tram_Overhead_11' PosUpdateWithDoppler
    LoadSound 'BouncyObjects\Bouncy_PlasticMetalChair01'
    LoadSound 'BouncyObjects\Bouncy_PlasticMetalChair02'
    LoadSound 'BouncyObjects\Bouncy_MetalTableHit01'
    LoadSound 'BouncyObjects\Bouncy_MetalTableHit02'
    LoadSound 'BouncyObjects\Bouncy_NewsStandHit01'
    LoadSound 'BouncyObjects\Bouncy_NewsStandHit02'
    LoadSound 'BouncyObjects\Bouncy_MetalBucketHit01'
    LoadSound 'BouncyObjects\Bouncy_MetalBucketHit02'
    LoadSound 'BouncyObjects\Bouncy_BrickHit01'
    LoadSound 'BouncyObjects\Bouncy_BrickHit02'
    LoadSound 'BA\SK6_BA_BullGallop01' PosUpdateWithDoppler
    LoadSound 'BA\SK6_BA_BullGallop02' PosUpdateWithDoppler
    LoadSound 'BA\SK6_BA_BullGallop03' PosUpdateWithDoppler
    LoadSound 'BA\SK6_BA_BullGallop04' PosUpdateWithDoppler
    LoadSound 'BO\SK6_BO_RiverLoop01_11'
    LoadSound 'BA\SK6_BA_HitBuoyBell'
    LoadSound 'BO\SK6_BO_FireLoop'
    LoadSound 'BA\SK6_BA_CatapultShoot'
    LoadSound 'BA\SK6_BA_BreakBushes'
    LoadSound 'BA\SK6_BA_SteveOElecLoop'
    LoadSound 'BA\SK6_BA_Steveo_Buck_11'
    LoadSound 'BA\SK6_BA_Steveo_Buck02_11'
    LoadSound 'BA\SK6_BA_SteveO_Grind'
    LoadSound 'BA\SK6_BA_Steveo_Jump'
    if (debugsoundfx = 1)
        DumpHeaps
    endif
endscript


script SK6_BA_SFX_MetalTrashHitSpin 
    if NOT issoundplaying SK6_TrashCanHitSpin02
        obj_playsound SK6_TrashCanHitSpin02 vol = 200
    endif
endscript


script BA_SFX_WindowBreak 
    playsound HitGlassPane2x
endscript


script BA_SFX_MowGrass 
    playsound BonkBush
endscript


script BA_SFX_Bull_Vocals 
    begin 
    if NOT GameIsPaused
        if NOT IsStreamPlaying BullStream
            RandomNoRepeat (
                @ obj_playstream SK6_BA_BullScream01 vol = 150 dropoff = 150 id = BullStream
                @ obj_playstream SK6_BA_BullScream02 vol = 150 dropoff = 150 id = BullStream
                @ obj_playstream SK6_BA_BullScream03 vol = 150 dropoff = 150 id = BullStream
                @ obj_playstream SK6_BA_BullScream04 vol = 150 dropoff = 150 id = BullStream
                @ obj_playstream SK6_BA_BullScream05 vol = 150 dropoff = 150 id = BullStream
                @ obj_playstream SK6_BA_BullScream06 vol = 150 dropoff = 150 id = BullStream
            )
        endif
    endif
    wait Random (@ 3 @ 4 @ 5) seconds
    repeat 
endscript


script BA_SFX_Day_DistantBullFight01 
endscript


script BA_SFX_Day_DistantBullFight02 
endscript


script BA_SFX_Day_DistantBullFightFull 
    if SkaterCamAnimFinished
        if NOT IsStreamPlaying BullCrowdStream
            RandomNoRepeat (
                @ obj_playstream SK6_BA_BullCrowdConst01 vol = 300 emitter = TRG_SFX_SOB_DistantBullFightFull id = BullCrowdStream priority = StreamPriorityHigh num_loops = -1
                change BA_SFX_BullFightingStreamPlaying = SK6_BA_BullCrowdConst01
                @ obj_playstream SK6_BA_BullCrowdConst02 vol = 300 emitter = TRG_SFX_SOB_DistantBullFightFull id = BullCrowdStream priority = StreamPriorityHigh num_loops = -1
                change BA_SFX_BullFightingStreamPlaying = SK6_BA_BullCrowdConst02
                @ obj_playstream SK6_BA_BullCrowdConst03 vol = 300 emitter = TRG_SFX_SOB_DistantBullFightFull id = BullCrowdStream priority = StreamPriorityHigh num_loops = -1
                change BA_SFX_BullFightingStreamPlaying = SK6_BA_BullCrowdConst03
                @ obj_playstream SK6_BA_BullCrowdOle01 vol = 300 emitter = TRG_SFX_SOB_DistantBullFightFull id = BullCrowdStream priority = StreamPriorityHigh num_loops = -1
                change BA_SFX_BullFightingStreamPlaying = SK6_BA_BullCrowdOle01
                @ obj_playstream SK6_BA_BullCrowdOle02 vol = 300 emitter = TRG_SFX_SOB_DistantBullFightFull id = BullCrowdStream priority = StreamPriorityHigh num_loops = -1
                change BA_SFX_BullFightingStreamPlaying = SK6_BA_BullCrowdOle02
            )
            begin 
            wait 1 gameframe
            switch BA_SFX_BullFightingStreamPlaying
                case SK6_BA_BullCrowdConst01
                obj_removestream BullCrowdStream remove = SK6_BA_BullCrowdConst02
                obj_removestream BullCrowdStream remove = SK6_BA_BullCrowdConst03
                obj_removestream BullCrowdStream remove = SK6_BA_BullCrowdOle01
                obj_removestream BullCrowdStream remove = SK6_BA_BullCrowdOle02
                case SK6_BA_BullCrowdConst02
                obj_removestream BullCrowdStream remove = SK6_BA_BullCrowdConst01
                obj_removestream BullCrowdStream remove = SK6_BA_BullCrowdConst03
                obj_removestream BullCrowdStream remove = SK6_BA_BullCrowdOle01
                obj_removestream BullCrowdStream remove = SK6_BA_BullCrowdOle02
                case SK6_BA_BullCrowdConst03
                obj_removestream BullCrowdStream remove = SK6_BA_BullCrowdConst01
                obj_removestream BullCrowdStream remove = SK6_BA_BullCrowdConst02
                obj_removestream BullCrowdStream remove = SK6_BA_BullCrowdOle01
                obj_removestream BullCrowdStream remove = SK6_BA_BullCrowdOle02
                case SK6_BA_BullCrowdOle01
                obj_removestream BullCrowdStream remove = SK6_BA_BullCrowdConst01
                obj_removestream BullCrowdStream remove = SK6_BA_BullCrowdConst02
                obj_removestream BullCrowdStream remove = SK6_BA_BullCrowdConst03
                obj_removestream BullCrowdStream remove = SK6_BA_BullCrowdOle02
                case SK6_BA_BullCrowdOle02
                obj_removestream BullCrowdStream remove = SK6_BA_BullCrowdConst01
                obj_removestream BullCrowdStream remove = SK6_BA_BullCrowdConst02
                obj_removestream BullCrowdStream remove = SK6_BA_BullCrowdConst03
                obj_removestream BullCrowdStream remove = SK6_BA_BullCrowdOle01
                default 
            endswitch
            RandomNoRepeat (
                @ obj_addstream BullCrowdStream Add = SK6_BA_BullCrowdConst01
                change BA_SFX_BullFightingStreamPlaying = SK6_BA_BullCrowdConst01
                wait 24 seconds
                @ obj_addstream BullCrowdStream Add = SK6_BA_BullCrowdOle01
                change BA_SFX_BullFightingStreamPlaying = SK6_BA_BullCrowdOle01
                wait 22 seconds
                @ obj_addstream BullCrowdStream Add = SK6_BA_BullCrowdOle02
                change BA_SFX_BullFightingStreamPlaying = SK6_BA_BullCrowdOle02
                wait 22 seconds
            )
            wait 1 gameframe
            obj_removestream BullCrowdStream remove = SK6_BA_BullCrowdConst02
            obj_removestream BullCrowdStream remove = SK6_BA_BullCrowdConst03
            wait 1 second
            repeat 
        endif
    endif
endscript


script BA_SFX_HarborWater01 
    obj_playsound SK6_BO_RiverLoop01_11 vol = 60 emitter = TRG_SFX_SOB_HarborWater01
endscript


script BA_SFX_HarborWater02 
    obj_playsound SK6_BO_RiverLoop01_11 vol = 60 emitter = TRG_SFX_SOB_HarborWater02
endscript


script BA_SFX_HarborBG 
    if SkaterCamAnimFinished
        HarborBG01Vol = 150
        wait Random (@ 0.3000 @ 0.8000 @ 1.300 @ 1.800) seconds
        begin 
        Random (
            @ obj_playstream SK6_BA_HarborBell01 vol = <HarborBG01Vol> emitter = Random (@ TRG_SFX_SOB_HarborBG01 @ TRG_SFX_SOB_HarborBG06 @ TRG_SFX_SOB_HarborBG07) dropoff_function = inv_exponential priority = StreamPriorityLow
            wait 4 seconds
            @ obj_playstream SK6_BA_HarborBell02 vol = <HarborBG01Vol> emitter = Random (@ TRG_SFX_SOB_HarborBG01 @ TRG_SFX_SOB_HarborBG06 @ TRG_SFX_SOB_HarborBG07) dropoff_function = inv_exponential priority = StreamPriorityLow
            wait 4 seconds
            @ obj_playstream SK6_BA_HarborBell04 vol = <HarborBG01Vol> emitter = Random (@ TRG_SFX_SOB_HarborBG01 @ TRG_SFX_SOB_HarborBG06 @ TRG_SFX_SOB_HarborBG07) dropoff_function = inv_exponential priority = StreamPriorityLow
            wait 5 seconds
            @ obj_playstream SK6_BA_HarborBell05 vol = <HarborBG01Vol> emitter = Random (@ TRG_SFX_SOB_HarborBG01 @ TRG_SFX_SOB_HarborBG06 @ TRG_SFX_SOB_HarborBG07) dropoff_function = inv_exponential priority = StreamPriorityLow
            wait 5 seconds
            @*10 obj_playstream SK6_BA_HarborBird01 vol = <HarborBG01Vol> emitter = Random (@ TRG_SFX_SOB_HarborBG01 @ TRG_SFX_SOB_HarborBG06 @ TRG_SFX_SOB_HarborBG07) dropoff_function = inv_exponential priority = StreamPriorityLow
            wait 5.500 seconds
            @*5 
            if NOT (IsStreamPlaying SK6_BA_HarborBird02)
                obj_playstream SK6_BA_HarborBird02 vol = <HarborBG01Vol> emitter = Random (@ TRG_SFX_SOB_HarborBG01 @ TRG_SFX_SOB_HarborBG06 @ TRG_SFX_SOB_HarborBG07) dropoff_function = inv_exponential priority = StreamPriorityLow
                wait 5.500 seconds
            endif
            @*5 
            if NOT (IsStreamPlaying SK6_BA_HarborBird03)
                obj_playstream SK6_BA_HarborBird03 vol = <HarborBG01Vol> emitter = Random (@ TRG_SFX_SOB_HarborBG01 @ TRG_SFX_SOB_HarborBG06 @ TRG_SFX_SOB_HarborBG07) dropoff_function = inv_exponential priority = StreamPriorityLow
                wait 6 seconds
            endif
            @*10 obj_playstream SK6_BA_HarborBird04 vol = <HarborBG01Vol> emitter = Random (@ TRG_SFX_SOB_HarborBG01 @ TRG_SFX_SOB_HarborBG06 @ TRG_SFX_SOB_HarborBG07) dropoff_function = inv_exponential priority = StreamPriorityLow
            wait 7 seconds
            @*3 
            if NOT (IsStreamPlaying HarborHornSound)
                printf 'NO HARBOUR HORN STREAM IS PLAYING!!!'
                RandomNoRepeat (
                    @ obj_playstream SK6_BA_HarborHorn01 vol = <HarborBG01Vol> emitter = Random (@ TRG_SFX_SOB_HarborBG01 @ TRG_SFX_SOB_HarborBG06 @ TRG_SFX_SOB_HarborBG07) dropoff_function = inv_exponential id = HarborHornSound priority = StreamPriorityLow
                    wait 5 seconds
                    @ obj_playstream SK6_BA_HarborHorn02 vol = <HarborBG01Vol> emitter = Random (@ TRG_SFX_SOB_HarborBG01 @ TRG_SFX_SOB_HarborBG06 @ TRG_SFX_SOB_HarborBG07) dropoff_function = inv_exponential id = HarborHornSound priority = StreamPriorityLow
                    wait 11 seconds
                    @ obj_playstream SK6_BA_HarborHorn03 vol = <HarborBG01Vol> emitter = Random (@ TRG_SFX_SOB_HarborBG01 @ TRG_SFX_SOB_HarborBG06 @ TRG_SFX_SOB_HarborBG07) dropoff_function = inv_exponential id = HarborHornSound priority = StreamPriorityLow
                    wait 9 seconds
                    @ obj_playstream SK6_BA_HarborHorn04 vol = <HarborBG01Vol> emitter = Random (@ TRG_SFX_SOB_HarborBG01 @ TRG_SFX_SOB_HarborBG06 @ TRG_SFX_SOB_HarborBG07) dropoff_function = inv_exponential id = HarborHornSound priority = StreamPriorityLow
                    wait 5 seconds
                )
            endif
        )
        wait Random (@ 0.5000 @ 1 @ 1.300) seconds
        repeat 
    endif
endscript


script BA_SFX_HarborBG02 
    HarborBG02Vol = 150
    wait Random (@ 0.1500 @ 0.6500 @ 1.150 @ 1.650) seconds
    begin 
    Random (
        @ obj_playstream SK6_BA_HarborBell03 vol = <HarborBG02Vol> emitter = Random (@ TRG_SFX_SOB_HarborBG02 @ TRG_SFX_SOB_HarborBG03 @ TRG_SFX_SOB_HarborBG04 @ TRG_SFX_SOB_HarborBG05) dropoff_function = inv_exponential priority = StreamPriorityLow
        wait 4 seconds
        @ obj_playstream SK6_BA_HarborBell06 vol = <HarborBG02Vol> emitter = Random (@ TRG_SFX_SOB_HarborBG02 @ TRG_SFX_SOB_HarborBG03 @ TRG_SFX_SOB_HarborBG04 @ TRG_SFX_SOB_HarborBG05) dropoff_function = inv_exponential priority = StreamPriorityLow
        wait 6 seconds
        @ obj_playstream SK6_BA_HarborBell07 vol = <HarborBG02Vol> emitter = Random (@ TRG_SFX_SOB_HarborBG02 @ TRG_SFX_SOB_HarborBG03 @ TRG_SFX_SOB_HarborBG04 @ TRG_SFX_SOB_HarborBG05) dropoff_function = inv_exponential priority = StreamPriorityLow
        wait 5 seconds
        @*5 
        if NOT (IsStreamPlaying SK6_BA_HarborBird02)
            obj_playstream SK6_BA_HarborBird02 vol = <HarborBG02Vol> emitter = Random (@ TRG_SFX_SOB_HarborBG02 @ TRG_SFX_SOB_HarborBG03 @ TRG_SFX_SOB_HarborBG04 @ TRG_SFX_SOB_HarborBG05) dropoff_function = inv_exponential priority = StreamPriorityLow
            wait 5.500 seconds
        endif
        @*5 
        if NOT (IsStreamPlaying SK6_BA_HarborBird03)
            obj_playstream SK6_BA_HarborBird03 vol = <HarborBG02Vol> emitter = Random (@ TRG_SFX_SOB_HarborBG02 @ TRG_SFX_SOB_HarborBG03 @ TRG_SFX_SOB_HarborBG04 @ TRG_SFX_SOB_HarborBG05) dropoff_function = inv_exponential priority = StreamPriorityLow
            wait 6 seconds
        endif
        @*10 obj_playstream SK6_BA_HarborBird05 vol = <HarborBG02Vol> emitter = Random (@ TRG_SFX_SOB_HarborBG02 @ TRG_SFX_SOB_HarborBG03 @ TRG_SFX_SOB_HarborBG04 @ TRG_SFX_SOB_HarborBG05) dropoff_function = inv_exponential priority = StreamPriorityLow
        wait 8 seconds
        @*10 obj_playstream SK6_BA_HarborBird06 vol = <HarborBG02Vol> emitter = Random (@ TRG_SFX_SOB_HarborBG02 @ TRG_SFX_SOB_HarborBG03 @ TRG_SFX_SOB_HarborBG04 @ TRG_SFX_SOB_HarborBG05) dropoff_function = inv_exponential priority = StreamPriorityLow
        wait 7 seconds
        @*3 
        if NOT (IsStreamPlaying HarborHornSound)
            printf 'NO HARBOUR HORN STREAM IS PLAYING!!!'
            RandomNoRepeat (
                @ obj_playstream SK6_BA_HarborHorn01 vol = <HarborBG02Vol> emitter = Random (@ TRG_SFX_SOB_HarborBG02 @ TRG_SFX_SOB_HarborBG03 @ TRG_SFX_SOB_HarborBG04 @ TRG_SFX_SOB_HarborBG05) dropoff_function = inv_exponential id = HarborHornSound priority = StreamPriorityLow
                wait 5 seconds
                @ obj_playstream SK6_BA_HarborHorn02 vol = <HarborBG02Vol> emitter = Random (@ TRG_SFX_SOB_HarborBG02 @ TRG_SFX_SOB_HarborBG03 @ TRG_SFX_SOB_HarborBG04 @ TRG_SFX_SOB_HarborBG05) dropoff_function = inv_exponential id = HarborHornSound priority = StreamPriorityLow
                wait 11 seconds
                @ obj_playstream SK6_BA_HarborHorn03 vol = <HarborBG02Vol> emitter = Random (@ TRG_SFX_SOB_HarborBG02 @ TRG_SFX_SOB_HarborBG03 @ TRG_SFX_SOB_HarborBG04 @ TRG_SFX_SOB_HarborBG05) dropoff_function = inv_exponential id = HarborHornSound priority = StreamPriorityLow
                wait 9 seconds
                @ obj_playstream SK6_BA_HarborHorn04 vol = <HarborBG02Vol> emitter = Random (@ TRG_SFX_SOB_HarborBG02 @ TRG_SFX_SOB_HarborBG03 @ TRG_SFX_SOB_HarborBG04 @ TRG_SFX_SOB_HarborBG05) dropoff_function = inv_exponential id = HarborHornSound priority = StreamPriorityLow
                wait 5 seconds
            )
        endif
    )
    wait Random (@ 0.8000 @ 1.200 @ 1.700) seconds
    repeat 
endscript


script BA_SFX_BusPhone01 
    begin 
    Random (
        @*6 
        @ 
        begin 
        RandomNoRepeat (
            @ obj_playstream SK6_BA_PhoneRing01 vol = 100 emitter = TRG_SFX_SOB_BusPhone01 priority = StreamPriorityLow
            @ obj_playstream SK6_BA_PhoneRing01 vol = 100 emitter = TRG_SFX_SOB_BusPhone02 priority = StreamPriorityLow
            @ obj_playstream SK6_BA_PhoneRing01 vol = 100 emitter = TRG_SFX_SOB_BusPhone03 priority = StreamPriorityLow
        )
        wait 3 seconds
        repeat 4
    )
    wait Random (@ 20 @ 30 @ 40 seconds)
    repeat 
endscript


script BA_SFX_ArtBldgReverb01 
    if NOT GameIsPaused
        if NOT InSplitScreenGame
            if (inside)
                change InsideAdjacentReverbBox01 = 1
                GetValueFromVolume cdvol
                if (InsideAdjacentReverbBox02 = 0)
                    if (<value> = 0)
                        SetSfxReverb 60 mode = REV_MODE_ARENA
                    else
                        SetSfxReverb 75 mode = REV_MODE_ARENA
                    endif
                endif
            else
                if (InsideAdjacentReverbBox02 = 0)
                    SetSfxReverb 0 mode = REV_MODE_ARENA
                else
                endif
                change InsideAdjacentReverbBox01 = 0
            endif
        endif
    endif
endscript


script BA_SFX_ArtBldgReverb02 
    if NOT GameIsPaused
        if NOT InSplitScreenGame
            if (inside)
                change InsideAdjacentReverbBox02 = 1
                GetValueFromVolume cdvol
                if (InsideAdjacentReverbBox01 = 0)
                    if (<value> = 0)
                        SetSfxReverb 60 mode = REV_MODE_ARENA
                    else
                        SetSfxReverb 75 mode = REV_MODE_ARENA
                    endif
                endif
            else
                if (InsideAdjacentReverbBox01 = 0)
                    SetSfxReverb 0 mode = REV_MODE_ARENA
                else
                endif
                change InsideAdjacentReverbBox02 = 0
            endif
        endif
    endif
endscript


script BA_SFX_TunnelReverb01 
    if NOT GameIsPaused
        if NOT InSplitScreenGame
            if (inside)
                change InsideAdjacentReverbBox01 = 1
                GetValueFromVolume cdvol
                if (InsideAdjacentReverbBox02 = 0)
                    if (<value> = 0)
                        SetSfxReverb 60 mode = REV_MODE_SEWERPIPE
                    else
                        SetSfxReverb 75 mode = REV_MODE_SEWERPIPE
                    endif
                endif
            else
                if (InsideAdjacentReverbBox02 = 0)
                    SetSfxReverb 0 mode = REV_MODE_SEWERPIPE
                else
                endif
                change InsideAdjacentReverbBox01 = 0
            endif
        endif
    endif
endscript


script BA_SFX_SubwayReverb01 
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


script BA_SFX_SubwayReverb02 
    if NOT GameIsPaused
        if NOT InSplitScreenGame
            if (inside)
                change InsideAdjacentReverbBox02 = 1
                GetValueFromVolume cdvol
                if (InsideAdjacentReverbBox01 = 0)
                    if (InsideAdjacentReverbBox03 = 0)
                        if (<value> = 0)
                            SetSfxReverb 60 mode = REV_MODE_ROOM
                        else
                            SetSfxReverb 75 mode = REV_MODE_ROOM
                        endif
                    endif
                endif
            else
                if (InsideAdjacentReverbBox01 = 0)
                    if (InsideAdjacentReverbBox03 = 0)
                        SetSfxReverb 0 mode = REV_MODE_ROOM
                    else
                    endif
                else
                endif
                change InsideAdjacentReverbBox02 = 0
            endif
        endif
    endif
endscript


script BA_SFX_SubwayReverb03 
    if NOT GameIsPaused
        if NOT InSplitScreenGame
            if (inside)
                change InsideAdjacentReverbBox03 = 1
                GetValueFromVolume cdvol
                if (InsideAdjacentReverbBox01 = 0)
                    if (InsideAdjacentReverbBox02 = 0)
                        if (<value> = 0)
                            SetSfxReverb 60 mode = REV_MODE_ROOM
                        else
                            SetSfxReverb 75 mode = REV_MODE_ROOM
                        endif
                    endif
                endif
            else
                if (InsideAdjacentReverbBox01 = 0)
                    if (InsideAdjacentReverbBox02 = 0)
                        SetSfxReverb 0 mode = REV_MODE_ROOM
                    else
                    endif
                else
                endif
                change InsideAdjacentReverbBox03 = 0
            endif
        endif
    endif
endscript


script BA_SFX_PicnicBirds01 
    wait Random (@ 0 @ 0.2000 @ 0.8000 @ 0.9000) seconds
    begin 
    RandomNoRepeat (
        @ obj_playstream SK6_BO_Bird01 vol = BA_SFX_BirdChirpVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_PicnicBirds01 @ TRG_SFX_SOB_PicnicBirds07 @ TRG_SFX_SOB_PicnicBirds08 @ TRG_SFX_SOB_PicnicBirds09) priority = StreamPriorityLow
        wait 4 seconds
        @ obj_playstream SK6_BO_Bird02 vol = BA_SFX_BirdChirpVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_PicnicBirds01 @ TRG_SFX_SOB_PicnicBirds07 @ TRG_SFX_SOB_PicnicBirds08 @ TRG_SFX_SOB_PicnicBirds09) priority = StreamPriorityLow
        wait 5 seconds
        @ obj_playstream SK6_BO_Bird03 vol = BA_SFX_BirdChirpVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_PicnicBirds01 @ TRG_SFX_SOB_PicnicBirds07 @ TRG_SFX_SOB_PicnicBirds08 @ TRG_SFX_SOB_PicnicBirds09) priority = StreamPriorityLow
        wait 4 seconds
        @ obj_playstream SK6_BO_Bird04 vol = BA_SFX_BirdChirpVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_PicnicBirds01 @ TRG_SFX_SOB_PicnicBirds07 @ TRG_SFX_SOB_PicnicBirds08 @ TRG_SFX_SOB_PicnicBirds09) priority = StreamPriorityLow
        wait 5 seconds
        @ obj_playstream SK6_BO_Bird05 vol = BA_SFX_BirdChirpVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_PicnicBirds01 @ TRG_SFX_SOB_PicnicBirds07 @ TRG_SFX_SOB_PicnicBirds08 @ TRG_SFX_SOB_PicnicBirds09) priority = StreamPriorityLow
        wait 8 seconds
        @ obj_playstream SK6_BO_Bird06 vol = BA_SFX_BirdChirpVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_PicnicBirds01 @ TRG_SFX_SOB_PicnicBirds07 @ TRG_SFX_SOB_PicnicBirds08 @ TRG_SFX_SOB_PicnicBirds09) priority = StreamPriorityLow
        wait 9 seconds
        @ obj_playstream SK6_BO_Bird07 vol = BA_SFX_BirdChirpVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_PicnicBirds01 @ TRG_SFX_SOB_PicnicBirds07 @ TRG_SFX_SOB_PicnicBirds08 @ TRG_SFX_SOB_PicnicBirds09) priority = StreamPriorityLow
        wait 4 seconds
        @ obj_playstream SK6_BO_Bird08 vol = BA_SFX_BirdChirpVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_PicnicBirds01 @ TRG_SFX_SOB_PicnicBirds07 @ TRG_SFX_SOB_PicnicBirds08 @ TRG_SFX_SOB_PicnicBirds09) priority = StreamPriorityLow
        wait 5 seconds
    )
    wait Random (@ 0.5000 @ 1.100 @ 1.300) seconds
    repeat 
endscript


script BA_SFX_PicnicBirds02 
    wait Random (@ 0 @ 0.5000 @ 0.7000 @ 0.1000) seconds
    begin 
    RandomNoRepeat (
        @ obj_playstream SK6_BO_Bird09 vol = BA_SFX_BirdChirpVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_PicnicBirds02 @ TRG_SFX_SOB_PicnicBirds03 @ TRG_SFX_SOB_PicnicBirds04 @ TRG_SFX_SOB_PicnicBirds05 @ TRG_SFX_SOB_PicnicBirds06) priority = StreamPriorityLow
        wait 5 seconds
        @ obj_playstream SK6_BO_Bird10 vol = BA_SFX_BirdChirpVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_PicnicBirds02 @ TRG_SFX_SOB_PicnicBirds03 @ TRG_SFX_SOB_PicnicBirds04 @ TRG_SFX_SOB_PicnicBirds05 @ TRG_SFX_SOB_PicnicBirds06) priority = 11
        wait 7 seconds
        @ obj_playstream SK6_BO_Bird11 vol = BA_SFX_BirdChirpVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_PicnicBirds02 @ TRG_SFX_SOB_PicnicBirds03 @ TRG_SFX_SOB_PicnicBirds04 @ TRG_SFX_SOB_PicnicBirds05 @ TRG_SFX_SOB_PicnicBirds06) priority = 11
        wait 4 seconds
        @ obj_playstream SK6_BO_Bird12 vol = BA_SFX_BirdChirpVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_PicnicBirds02 @ TRG_SFX_SOB_PicnicBirds03 @ TRG_SFX_SOB_PicnicBirds04 @ TRG_SFX_SOB_PicnicBirds05 @ TRG_SFX_SOB_PicnicBirds06) priority = 11
        wait 3 seconds
        @ obj_playstream SK6_BO_Bird13 vol = BA_SFX_BirdChirpVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_PicnicBirds02 @ TRG_SFX_SOB_PicnicBirds03 @ TRG_SFX_SOB_PicnicBirds04 @ TRG_SFX_SOB_PicnicBirds05 @ TRG_SFX_SOB_PicnicBirds06) priority = 11
        wait 3 seconds
        @ obj_playstream SK6_BO_Bird14 vol = BA_SFX_BirdChirpVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_PicnicBirds02 @ TRG_SFX_SOB_PicnicBirds03 @ TRG_SFX_SOB_PicnicBirds04 @ TRG_SFX_SOB_PicnicBirds05 @ TRG_SFX_SOB_PicnicBirds06) priority = 11
        wait 7 seconds
        @ obj_playstream SK6_BO_Bird15 vol = BA_SFX_BirdChirpVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_PicnicBirds02 @ TRG_SFX_SOB_PicnicBirds03 @ TRG_SFX_SOB_PicnicBirds04 @ TRG_SFX_SOB_PicnicBirds05 @ TRG_SFX_SOB_PicnicBirds06) priority = 11
        wait 7 seconds
        @ obj_playstream SK6_BO_Bird16 vol = BA_SFX_BirdChirpVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_PicnicBirds02 @ TRG_SFX_SOB_PicnicBirds03 @ TRG_SFX_SOB_PicnicBirds04 @ TRG_SFX_SOB_PicnicBirds05 @ TRG_SFX_SOB_PicnicBirds06) priority = 11
        wait 7 seconds
        @ obj_playstream SK6_BO_Bird17 vol = BA_SFX_BirdChirpVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_PicnicBirds02 @ TRG_SFX_SOB_PicnicBirds03 @ TRG_SFX_SOB_PicnicBirds04 @ TRG_SFX_SOB_PicnicBirds05 @ TRG_SFX_SOB_PicnicBirds06) priority = 11
        wait 5 seconds
    )
    wait Random (@ 0.5000 @ 1.100 @ 1.300) seconds
    repeat 
endscript


script BA_SFX_Tram_Overhead 
    obj_playsound SK6_BA_Tram_Overhead_11 vol = 60 dropoff = 180 dropoff_function = exponential
endscript


script BA_SFX_CarFire01 
    if NOT IsStreamPlaying SK6_BA_CarFireLoop
        obj_playstream SK6_BA_CarFireLoop emitter = TRG_SFX_SOB_CarFire01 vol = 200 dropoff_function = exponential num_loops = -1 priority = StreamPriorityMidHigh
    endif
endscript


script BA_SFX_ArcadeGame01 
    if SkaterCamAnimFinished
        wait 1 gameframe
        begin 
        if NOT IsStreamPlaying ArcadeGameStream
            RandomNoRepeat (
                @*6 obj_playstream SK6_Arcade_Beeps_01 vol = 200 emitter = TRG_SFX_SOB_ArcadeGame01 priority = StreamPriorityLow dropoff_function = exponential id = ArcadeGameStream
                wait 28 seconds
                @*6 obj_playstream SK6_Arcade_Beeps_02 vol = 200 emitter = TRG_SFX_SOB_ArcadeGame01 priority = StreamPriorityLow dropoff_function = exponential id = ArcadeGameStream
                wait 38 seconds
                @ obj_playstream SK6_Arcade_Beeps_03 vol = 200 emitter = TRG_SFX_SOB_ArcadeGame01 priority = StreamPriorityLow dropoff_function = exponential id = ArcadeGameStream
                wait 10 seconds
                @*6 obj_playstream SK6_Arcade_Beeps_04 vol = 200 emitter = TRG_SFX_SOB_ArcadeGame01 priority = StreamPriorityLow dropoff_function = exponential id = ArcadeGameStream
                wait 11 seconds
                @*6 obj_playstream SK6_Arcade_Beeps_05 vol = 200 emitter = TRG_SFX_SOB_ArcadeGame01 priority = StreamPriorityLow dropoff_function = exponential id = ArcadeGameStream
                wait 35 seconds
            )
        endif
        wait 1 second
        repeat 
    endif
endscript


script BA_SFX_Sm_Fountain01 
    if NOT IsStreamPlaying BA_SmallFountainLoopingStream
        obj_playstream SK6_BA_SmallFountain emitter = TRG_SFX_SOB_SmFountain01 priority = StreamPriorityMidHigh num_loops = -1 id = BA_SmallFountainLoopingStream
    endif
endscript


script BA_SFX_Lg_Fountain01 
    if NOT IsStreamPlaying BA_LargeFountainLoopingStream
        obj_playstream SK6_BA_LargeFountain emitter = TRG_SFX_SOB_LgFountain01 priority = StreamPriorityMidHigh num_loops = -1 id = BA_LargeFountainLoopingStream
    endif
endscript


script BA_SFX_ShipStuck01 
endscript


script BA_SFX_Medieval01 
    RandomNoRepeat (
        @ obj_playstream SK6_BA_Medieval01 emitter = TRG_SFX_SOB_Medieval01 priority = StreamPriorityLow
        @ obj_playstream SK6_BA_Medieval02 emitter = TRG_SFX_SOB_Medieval01 priority = StreamPriorityLow
        @ obj_playstream SK6_BA_Medieval03 emitter = TRG_SFX_SOB_Medieval01 priority = StreamPriorityLow
        @ obj_playstream SK6_BA_Medieval04 emitter = TRG_SFX_SOB_Medieval01 priority = StreamPriorityLow
        @ obj_playstream SK6_BA_Medieval05 emitter = TRG_SFX_SOB_Medieval01 priority = StreamPriorityLow
    )
endscript


script BA_SFX_Medieval02 
    RandomNoRepeat (
        @ obj_playstream SK6_BA_Medieval01 emitter = TRG_SFX_SOB_Medieval02 priority = StreamPriorityLow
        @ obj_playstream SK6_BA_Medieval02 emitter = TRG_SFX_SOB_Medieval02 priority = StreamPriorityLow
        @ obj_playstream SK6_BA_Medieval03 emitter = TRG_SFX_SOB_Medieval02 priority = StreamPriorityLow
        @ obj_playstream SK6_BA_Medieval04 emitter = TRG_SFX_SOB_Medieval02 priority = StreamPriorityLow
        @ obj_playstream SK6_BA_Medieval05 emitter = TRG_SFX_SOB_Medieval02 priority = StreamPriorityLow
    )
endscript


script BA_SFX_MedievalReverb01 
    if NOT GameIsPaused
        if NOT InSplitScreenGame
            if (inside)
                change InsideAdjacentReverbBox01 = 1
                GetValueFromVolume cdvol
                if (InsideAdjacentReverbBox02 = 0)
                    if (<value> = 0)
                        SetSfxReverb 60 mode = REV_MODE_ROOM
                    else
                        SetSfxReverb 75 mode = REV_MODE_ROOM
                    endif
                endif
            else
                if (InsideAdjacentReverbBox02 = 0)
                    SetSfxReverb 0 mode = REV_MODE_ROOM
                else
                endif
                change InsideAdjacentReverbBox01 = 0
            endif
        endif
    endif
endscript


script BA_SFX_AirVent01 
    if SkaterCamAnimFinished
        if NOT IsStreamPlaying BA_SFX_VentLoopStream
            obj_playstream SK6_BO_Air_Vent vol = 180 emitter = TRG_SFX_SOB_AirVent01 dropoff_function = exponential num_loops = -1 id = BA_SFX_VentLoopStream
        endif
    endif
endscript


script BA_SFX_Bull_In_Cage 
    if NOT IsStreamPlaying BullStream
        if NOT InNetGame
            if ((GameModeEquals is_classic)|| (InNetGame))
                RandomPermute (
                    @ TRG_SFX_Ghost_BullInCage ::obj_playstream SK6_BA_BullScream01 vol = 150 dropoff = 150 id = BullStream
                    @ TRG_SFX_Ghost_BullInCage ::obj_playstream SK6_BA_BullScream02 vol = 150 dropoff = 150 id = BullStream
                    @ TRG_SFX_Ghost_BullInCage ::obj_playstream SK6_BA_BullScream03 vol = 150 dropoff = 150 id = BullStream
                    @ TRG_SFX_Ghost_BullInCage ::obj_playstream SK6_BA_BullScream04 vol = 150 dropoff = 150 id = BullStream
                    @ TRG_SFX_Ghost_BullInCage ::obj_playstream SK6_BA_BullScream05 vol = 150 dropoff = 150 id = BullStream
                    @ TRG_SFX_Ghost_BullInCage ::obj_playstream SK6_BA_BullScream06 vol = 110 dropoff = 150 id = BullStream
                )
            else
                RandomPermute (
                    @ TRG_SFX_Ghost_BullInCage ::obj_playstream SK6_BA_BullScream01 vol = 150 dropoff = 150 id = BullStream
                    @ TRG_SFX_Ghost_BullInCage ::obj_playstream SK6_BA_BullScream02 vol = 150 dropoff = 150 id = BullStream
                    @ TRG_SFX_Ghost_BullInCage ::obj_playstream SK6_BA_BullScream03 vol = 150 dropoff = 150 id = BullStream
                    @ TRG_SFX_Ghost_BullInCage ::obj_playstream SK6_BA_BullScream04 vol = 150 dropoff = 150 id = BullStream
                    @ TRG_SFX_Ghost_BullInCage ::obj_playstream SK6_BA_BullScream05 vol = 150 dropoff = 150 id = BullStream
                    @ TRG_SFX_Ghost_BullInCage ::obj_playstream SK6_BA_BullScream06 vol = 110 dropoff = 150 id = BullStream
                    @ TRG_SFX_Ghost_BullFighterHanging ::obj_playstream Ped_Bullfighter_Help01 vol = 110 dropoff = 150 id = BullStream
                    @ TRG_SFX_Ghost_BullFighterHanging ::obj_playstream Ped_Bullfighter_Help02 vol = 110 dropoff = 150 id = BullStream
                    @ TRG_SFX_Ghost_BullFighterHanging ::obj_playstream Ped_Bullfighter_Help03 vol = 110 dropoff = 150 id = BullStream
                    @ TRG_SFX_Ghost_BullFighterHanging ::obj_playstream Ped_Bullfighter_Help04 vol = 110 dropoff = 150 id = BullStream
                    @ TRG_SFX_Ghost_BullFighterHanging ::obj_playstream Ped_Bullfighter_Help05 vol = 110 dropoff = 150 id = BullStream
                    @ TRG_SFX_Ghost_BullFighterHanging ::obj_playstream Ped_Bullfighter_Help06 vol = 110 dropoff = 150 id = BullStream
                    @ TRG_SFX_Ghost_BullFighterHanging ::obj_playstream Ped_Bullfighter_Help07 vol = 110 dropoff = 150 id = BullStream
                )
            endif
        endif
    endif
endscript


script BA_SFX_Ped_Throw_Hit_Cage 
    wait 0.3000 seconds
    TRG_SFX_Ghost_BullInCage ::obj_playsound playsound SK6_TrashCanHitSpin02 vol = 120 pitch = randomrange (100.0, 110.0)
endscript


script BA_SFX_SuckedUpThroughVent 
    if NOT IsStreamPlaying SK6_BA_SuckedUpThroughVent
        PlayStream SK6_BA_SuckedUpThroughVent vol = 300 priority = 101
    endif
endscript


script BA_SFX_HitBuoyBell01 
    TRG_SFX_Ghost_BuoyBell01 ::obj_playsound SK6_BA_HitBuoyBell vol = 200
endscript


script BA_SFX_HitBuoyBell02 
    TRG_SFX_Ghost_BuoyBell02 ::obj_playsound SK6_BA_HitBuoyBell vol = 200
endscript


script BA_SFX_HitBuoyBell03 
    TRG_SFX_Ghost_BuoyBell03 ::obj_playsound SK6_BA_HitBuoyBell vol = 200
endscript


script BA_SFX_BurningBird 
    PlayStream Sk6_BA_BurningBird vol = 250 priority = StreamPriorityHigh
endscript


script BA_SFX_Skater_Ignite 
    PlayStream SK6_BO_SkaterIgnite vol = 300
    skater ::obj_playsound SK6_BO_FireLoop vol = 110 pitch = 120
endscript


script BA_SFX_Skater_Put_Out_Fire 
    skater ::obj_stopsound SK6_BO_FireLoop
    skater ::obj_stopsound SK6_BO_FireLoop
endscript


script BA_SFX_OpenDrawBridge 
    if NOT InNetGame
        change BA_SFX_DrawBridgeDone = 1
        StopStream Ped_Boatcaptain_Far01
        StopStream Ped_Boatcaptain_Far02
        StopStream Ped_Boatcaptain_Far03
        StopStream Ped_Boatcaptain_Far04
        StopStream Ped_Boatcaptain_Far05
        StopStream Ped_Boatcaptain_Far06
        StopStream Ped_Boatcaptain_Far07
        wait 0.4000 seconds
        PlayStream SK6_BA_DrawBridgeOpen vol = 400 priority = 101
    endif
endscript


script BA_SFX_BullCrapFliesFromPile 
endscript


script BA_SFX_BreakBushes 
endscript


script BA_SFX_DragonBreath 
endscript


script BA_SFX_WaterShootUpStart node = 1
    switch <node>
        case 1
        TRG_SFX_Ghost_WaterJets01 ::obj_playsound SK6_BO_RiverLoop01_11 vol = 50 pitch = 400 dropoff = 70
        case 2
        TRG_SFX_Ghost_WaterJets02 ::obj_playsound SK6_BO_RiverLoop01_11 vol = 50 pitch = 400 dropoff = 70
        case 3
        TRG_SFX_Ghost_WaterJets03 ::obj_playsound SK6_BO_RiverLoop01_11 vol = 50 pitch = 400 dropoff = 70
        default 
    endswitch
endscript


script BA_SFX_WaterShootUpSTOP node = 1
    switch <node>
        case 1
        TRG_SFX_Ghost_WaterJets01 ::obj_adjustsound SK6_BO_RiverLoop01_11 volumepercent = 0 VolumeStep = 2
        wait 30 gameframes
        TRG_SFX_Ghost_WaterJets01 ::obj_stopsound
        case 2
        TRG_SFX_Ghost_WaterJets02 ::obj_adjustsound SK6_BO_RiverLoop01_11 volumepercent = 0 VolumeStep = 2
        wait 30 gameframes
        TRG_SFX_Ghost_WaterJets02 ::obj_stopsound
        case 3
        TRG_SFX_Ghost_WaterJets03 ::obj_adjustsound SK6_BO_RiverLoop01_11 volumepercent = 0 VolumeStep = 2
        wait 30 gameframes
        TRG_SFX_Ghost_WaterJets03 ::obj_stopsound
        default 
    endswitch
endscript


script BA_SFX_ElevatorDing 
    StopStream ThisElevatorStream
    wait 1 gameframe
    PlayStream SK6_BA_ElevatorDing vol = 70 id = ThisElevatorStream
endscript


script BA_SFX_DragonReverb 
    if NOT GameIsPaused
        if NOT InSplitScreenGame
            if (inside)
                change InsideAdjacentReverbBox01 = 1
                GetValueFromVolume cdvol
                if (InsideAdjacentReverbBox02 = 0)
                    if (<value> = 0)
                        SetSfxReverb 60 mode = REV_MODE_ROOM
                    else
                        SetSfxReverb 75 mode = REV_MODE_ROOM
                    endif
                endif
            else
                if (InsideAdjacentReverbBox02 = 0)
                    SetSfxReverb 0 mode = REV_MODE_ROOM
                else
                endif
                change InsideAdjacentReverbBox01 = 0
            endif
        endif
    endif
endscript


script BA_SFX_WarpThroughSubway 
endscript


script BA_SFX_Night_Crix01 
    if InSplitScreenGame
        if NOT IsStreamPlaying SK6_CrixLoop_01
            obj_playstream SK6_CrixLoop_01 vol = 30 num_loops = -1 priority = StreamPriorityHigh
        endif
    else
        obj_playstream SK6_CrixLoop_01 vol = 30 num_loops = -1 priority = StreamPriorityHigh
    endif
endscript


script BA_SFX_Night_Crix02 
    if InSplitScreenGame
        if NOT IsStreamPlaying SK6_CrixLoop_01
            obj_playstream SK6_CrixLoop_01 vol = 30 num_loops = -1 priority = StreamPriorityHigh
        endif
    else
        obj_playstream SK6_CrixLoop_01 vol = 30 num_loops = -1 priority = StreamPriorityHigh
    endif
endscript


script BA_SFX_Night_Crix03 
    if InSplitScreenGame
        if NOT IsStreamPlaying SK6_CrixLoop_01
            obj_playstream SK6_CrixLoop_01 vol = 30 num_loops = -1 priority = StreamPriorityHigh
        endif
    else
        obj_playstream SK6_CrixLoop_01 vol = 30 num_loops = -1 priority = StreamPriorityHigh
    endif
endscript

