
BO_SFX_BirdChirpVol = 70
BO_SFX_SubwayMusicStatus = 0
BO_SFX_NerdKidMusicStatus = 0
BO_MUSIC_Beat_Goal_Layer01 = 0
BO_MUSIC_Beat_Goal_Layer02 = 0
BO_MUSIC_Beat_Goal_Layer03 = 0
BO_MUSIC_Beat_Goal_Layer04 = 0
WholeNoteInSeconds = 4
HalfNoteInSeconds = 2
QuarterNoteInSeconds = 1
EightNoteInSeconds = 0.5000
SixteenthNoteInSeconds = 0.2500
BeatAdjustedToleranceTime = 0.2500
WithinBeatTolerance = 0
BO_MUSIC_KickDrumVolume = 100
BO_MUSIC_SnareDrumVolume = 400
BO_MUSIC_HiHatVolume = 100
BO_MUSIC_ScratchVolume = 100
BO_SFX_WaitingPipeSound = 0
BO_SFX_AlreadyHitMast = 0
TestFirstTime = 1

script BO_LoadingSounds 
    LoadSound 'BO\ShoppingCartBail'
    LoadSound 'BO\ShoppingCartLand'
    LoadSound 'BO\ShoppingCartLoop'
    LoadSound 'Shared\Hits\HitGlassPane2x'
    LoadSound 'Shared\Hits\HitMetalCan' vol = 100 dropoff = 150 PosUpdateWithDoppler
    LoadSound 'Shared\Hits\BonkBush' vol = 100 dropoff = 0
    LoadSound 'Shared\Water\FallWater'
    LoadSound 'Shared\Auto\CarLoop' vol = 100 dropoff = 150 PosUpdateWithDoppler
    LoadSound 'Vehicles\Silent_Vehicle_Tire_Loop'
    LoadSound 'Terrains\BonkMetal_11'
    LoadSound 'BO\SK6_BO_FireLoop'
    LoadSound 'BO\SK6_BO_RiverLoop01_11'
    LoadSound 'BO\SK6_BO_TrainLoop02' PosUpdateWithDoppler
    LoadSound 'Shared\TrickBeatGoal\TrickBeat_HiHat01'
    LoadSound 'Shared\TrickBeatGoal\TrickBeat_Kick01'
    LoadSound 'Shared\TrickBeatGoal\TrickBeat_Scratch01'
    LoadSound 'Shared\TrickBeatGoal\TrickBeat_Scratch02'
    LoadSound 'Shared\TrickBeatGoal\TrickBeat_Scratch03'
    LoadSound 'BO\SK6_BO_RevolutionaryDrum01'
    LoadSound 'Shared\Hits\HitPotty'
    LoadSound 'Shared\Hits\BustValve'
    LoadSound 'Shared\Hits\HitTrafficBarrier'
    LoadSound 'BO\SK6_BO_FountainLoop03_11'
    LoadSound 'Terrains\GrindMetalOn02'
    LoadSound 'BO\SK6_Paper_Rustle01'
    LoadSound 'BouncyObjects\Bouncy_MetalDrumHit01'
    LoadSound 'BouncyObjects\Bouncy_MetalDrumHit02'
    LoadSound 'BouncyObjects\Bouncy_OrangeConeHit01'
    LoadSound 'BouncyObjects\Bouncy_MetalChairHit01'
    LoadSound 'BouncyObjects\Bouncy_MetalChairHit02'
    LoadSound 'BouncyObjects\Bouncy_AluminumCanHit01'
    LoadSound 'BouncyObjects\Bouncy_AluminumCanHit02'
    LoadSound 'BouncyObjects\Bouncy_PlasticChairHit02'
    LoadSound 'BouncyObjects\Bouncy_TombstoneHit02'
    LoadSound 'BouncyObjects\Bouncy_PlasticChairHit01'
    LoadSound 'BouncyObjects\Bouncy_CardboardBoxHit02'
    LoadSound 'BO\SK6_BO_JesseRide_Loop'
    LoadSound 'BO\SK6_BO_JesseRide_Grind'
    LoadSound 'BO\SK6_BO_JesseRide_Jump'
    LoadSound 'BO\SK6_BO_JesseRide_Land'
    LoadSound 'BO\SK6_BO_GrindblockerPop'
    if (debugsoundfx = 1)
        DumpHeaps
    endif
endscript


script BO_SFX_ConstructionSite01 
    if NOT IsStreamPlaying ConstructionLoopStream
        obj_playstream SK6_BO_ConstructionLoop emitter = TRG_SFX_SOB_ConstructionSite01 id = ConstructionLoopStream num_loops = -1 priority = 51
    endif
endscript


script BO_SFX_SubwayMusic01 
    wait 1 gameframe
    if NOT InSplitScreenGame
        if NOT IsStreamPlaying GuitaristsStream
            RandomNoRepeat (
                @ obj_playstream SK6_BO_Bum_Gtr_01 vol = 250 emitter = TRG_SFX_SOB_BassMan01 dropoff_function = linear id = GuitaristsStream
                wait 13 seconds
                @ obj_playstream SK6_BO_Bum_Gtr_02 vol = 250 emitter = TRG_SFX_SOB_BassMan01 dropoff_function = linear id = GuitaristsStream
                wait 16 seconds
                @ obj_playstream SK6_BO_Bum_Gtr_03 vol = 250 emitter = TRG_SFX_SOB_BassMan01 dropoff_function = linear id = GuitaristsStream
                wait 9 seconds
                @ obj_playstream SK6_BO_Bum_Gtr_04 vol = 250 emitter = TRG_SFX_SOB_BassMan01 dropoff_function = linear id = GuitaristsStream
                wait 11 seconds
                @ obj_playstream SK6_BO_Bum_Gtr_05 vol = 250 emitter = TRG_SFX_SOB_BassMan01 dropoff_function = linear id = GuitaristsStream
                wait 5 seconds
                @ obj_playstream SK6_BO_Bum_Gtr_06 vol = 250 emitter = TRG_SFX_SOB_BassMan01 dropoff_function = linear id = GuitaristsStream
                wait 11 seconds
                @ obj_playstream SK6_BO_Bum_Gtr_07 vol = 250 emitter = TRG_SFX_SOB_BassMan01 dropoff_function = linear id = GuitaristsStream
                wait 10 seconds
                @ obj_playstream SK6_BO_Bum_Gtr_08 vol = 250 emitter = TRG_SFX_SOB_BassMan01 dropoff_function = linear id = GuitaristsStream
                wait 11 seconds
                @ obj_playstream SK6_BO_Bum_Gtr_09 vol = 250 emitter = TRG_SFX_SOB_BassMan01 dropoff_function = linear id = GuitaristsStream
                wait 4 seconds
                @*15 obj_playstream SK6_BO_Bum_Gtr_12 vol = 250 emitter = TRG_SFX_SOB_BassMan01 dropoff_function = linear id = GuitaristsStream
                wait 5 seconds
            )
            begin 
            RandomNoRepeat (
                @*10 obj_playstream SK6_BO_Bum_Gtr_01 vol = 250 emitter = TRG_SFX_SOB_BassMan01 dropoff_function = linear id = GuitaristsStream
                wait 13 seconds
                @*10 obj_playstream SK6_BO_Bum_Gtr_02 vol = 250 emitter = TRG_SFX_SOB_BassMan01 dropoff_function = linear id = GuitaristsStream
                wait 16 seconds
                @*10 obj_playstream SK6_BO_Bum_Gtr_03 vol = 250 emitter = TRG_SFX_SOB_BassMan01 dropoff_function = linear id = GuitaristsStream
                wait 9 seconds
                @*10 obj_playstream SK6_BO_Bum_Gtr_04 vol = 250 emitter = TRG_SFX_SOB_BassMan01 dropoff_function = linear id = GuitaristsStream
                wait 11 seconds
                @*10 obj_playstream SK6_BO_Bum_Gtr_05 vol = 250 emitter = TRG_SFX_SOB_BassMan01 dropoff_function = linear id = GuitaristsStream
                wait 5 seconds
                @*10 obj_playstream SK6_BO_Bum_Gtr_06 vol = 250 emitter = TRG_SFX_SOB_BassMan01 dropoff_function = linear id = GuitaristsStream
                wait 11 seconds
                @*10 obj_playstream SK6_BO_Bum_Gtr_07 vol = 250 emitter = TRG_SFX_SOB_BassMan01 dropoff_function = linear id = GuitaristsStream
                wait 10 seconds
                @*10 obj_playstream SK6_BO_Bum_Gtr_08 vol = 250 emitter = TRG_SFX_SOB_BassMan01 dropoff_function = linear id = GuitaristsStream
                wait 11 seconds
                @*10 obj_playstream SK6_BO_Bum_Gtr_09 vol = 250 emitter = TRG_SFX_SOB_BassMan01 dropoff_function = linear id = GuitaristsStream
                wait 4 seconds
                @ obj_playstream SK6_BO_Bum_Gtr_10 vol = 250 emitter = TRG_SFX_SOB_BassMan01 dropoff_function = linear id = GuitaristsStream
                wait 14 seconds
            )
            wait 1 seconds
            repeat 
        endif
    endif
endscript


script BO_SFX_Library_Shh 
    Random (
        @ PlayStream SK6_BO_LibraryShh01 vol = 150
        @ PlayStream SK6_BO_LibraryShh02 vol = 150
        @ PlayStream SK6_BO_LibraryShh03 vol = 150
        @ PlayStream SK6_BO_LibraryShh04 vol = 150
    )
endscript


script BO_SFX_Library_BG 
    begin 
    Random (
        @ obj_playstream SK6_BO_LibraryMvmt01 emitter = TRG_SFX_SOB_LibraryBG
        wait 27 seconds
        @ obj_playstream SK6_BO_LibraryMvmt02 emitter = TRG_SFX_SOB_LibraryBG
        wait 26 seconds
        @ obj_playstream SK6_BO_LibraryMvmt03 emitter = TRG_SFX_SOB_LibraryBG
        wait 24 seconds
        @ obj_playstream SK6_BO_LibraryMvmt04 emitter = TRG_SFX_SOB_LibraryBG
        wait 30 seconds
    )
    wait 0.5000 seconds
    repeat 
endscript


script BO_SFX_Airflow_Vent 
    if NOT IsStreamPlaying SK6_BO_Air_Vent
        obj_playstream SK6_BO_Air_Vent vol = 180 emitter = TRG_SFX_SOB_Airflow_Vent num_loops = -1
    endif
endscript


script BO_SFX_TrashCan_Fire 
    obj_playsound SK6_BO_FireLoop emitter = TRG_SFX_SOB_TrashCanFire01
endscript


script TRG_SFX_SOB_CommonsTree01 
    wait Random (@ 0 @ 0.2000 @ 0.8000 @ 0.9000) seconds
    begin 
    RandomNoRepeat (
        @ obj_playstream SK6_BO_Bird01 vol = BO_SFX_BirdChirpVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_CommonsTree01 @ TRG_SFX_SOB_CommonsTree02 @ TRG_SFX_SOB_CommonsTree03) priority = StreamPriorityLow
        wait 4 seconds
        @ obj_playstream SK6_BO_Bird02 vol = BO_SFX_BirdChirpVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_CommonsTree01 @ TRG_SFX_SOB_CommonsTree02 @ TRG_SFX_SOB_CommonsTree03) priority = StreamPriorityLow
        wait 5 seconds
        @ obj_playstream SK6_BO_Bird03 vol = BO_SFX_BirdChirpVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_CommonsTree01 @ TRG_SFX_SOB_CommonsTree02 @ TRG_SFX_SOB_CommonsTree03) priority = StreamPriorityLow
        wait 4 seconds
        @ obj_playstream SK6_BO_Bird04 vol = BO_SFX_BirdChirpVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_CommonsTree01 @ TRG_SFX_SOB_CommonsTree02 @ TRG_SFX_SOB_CommonsTree03) priority = StreamPriorityLow
        wait 5 seconds
        @ obj_playstream SK6_BO_Bird05 vol = BO_SFX_BirdChirpVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_CommonsTree01 @ TRG_SFX_SOB_CommonsTree02 @ TRG_SFX_SOB_CommonsTree03) priority = StreamPriorityLow
        wait 8 seconds
        @ obj_playstream SK6_BO_Bird06 vol = BO_SFX_BirdChirpVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_CommonsTree01 @ TRG_SFX_SOB_CommonsTree02 @ TRG_SFX_SOB_CommonsTree03) priority = StreamPriorityLow
        wait 9 seconds
        @ obj_playstream SK6_BO_Bird07 vol = BO_SFX_BirdChirpVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_CommonsTree01 @ TRG_SFX_SOB_CommonsTree02 @ TRG_SFX_SOB_CommonsTree03) priority = StreamPriorityLow
        wait 4 seconds
        @ obj_playstream SK6_BO_Bird08 vol = BO_SFX_BirdChirpVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_CommonsTree01 @ TRG_SFX_SOB_CommonsTree02 @ TRG_SFX_SOB_CommonsTree03) priority = StreamPriorityLow
        wait 5 seconds
    )
    wait Random (@ 0.5000 @ 1.100 @ 1.300) seconds
    repeat 
endscript


script TRG_SFX_SOB_CommonsTree02 
    if SkaterCamAnimFinished
        wait Random (@ 0 @ 0.5000 @ 0.7000 @ 0.1000) seconds
        begin 
        RandomNoRepeat (
            @ obj_playstream SK6_BO_Bird09 vol = BO_SFX_BirdChirpVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_CommonsTree04 @ TRG_SFX_SOB_CommonsTree05 @ TRG_SFX_SOB_CommonsTree06) priority = StreamPriorityLow
            wait 5 seconds
            @ obj_playstream SK6_BO_Bird10 vol = BO_SFX_BirdChirpVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_CommonsTree04 @ TRG_SFX_SOB_CommonsTree05 @ TRG_SFX_SOB_CommonsTree06) priority = StreamPriorityLow
            wait 7 seconds
            @ obj_playstream SK6_BO_Bird11 vol = BO_SFX_BirdChirpVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_CommonsTree04 @ TRG_SFX_SOB_CommonsTree05 @ TRG_SFX_SOB_CommonsTree06) priority = StreamPriorityLow
            wait 4 seconds
            @ obj_playstream SK6_BO_Bird12 vol = BO_SFX_BirdChirpVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_CommonsTree04 @ TRG_SFX_SOB_CommonsTree05 @ TRG_SFX_SOB_CommonsTree06) priority = StreamPriorityLow
            wait 3 seconds
            @ obj_playstream SK6_BO_Bird13 vol = BO_SFX_BirdChirpVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_CommonsTree04 @ TRG_SFX_SOB_CommonsTree05 @ TRG_SFX_SOB_CommonsTree06) priority = StreamPriorityLow
            wait 3 seconds
            @ obj_playstream SK6_BO_Bird14 vol = BO_SFX_BirdChirpVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_CommonsTree04 @ TRG_SFX_SOB_CommonsTree05 @ TRG_SFX_SOB_CommonsTree06) priority = StreamPriorityLow
            wait 7 seconds
            @ obj_playstream SK6_BO_Bird15 vol = BO_SFX_BirdChirpVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_CommonsTree04 @ TRG_SFX_SOB_CommonsTree05 @ TRG_SFX_SOB_CommonsTree06) priority = StreamPriorityLow
            wait 7 seconds
            @ obj_playstream SK6_BO_Bird16 vol = BO_SFX_BirdChirpVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_CommonsTree04 @ TRG_SFX_SOB_CommonsTree05 @ TRG_SFX_SOB_CommonsTree06) priority = StreamPriorityLow
            wait 7 seconds
            @ obj_playstream SK6_BO_Bird17 vol = BO_SFX_BirdChirpVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_CommonsTree04 @ TRG_SFX_SOB_CommonsTree05 @ TRG_SFX_SOB_CommonsTree06) priority = StreamPriorityLow
            wait 5 seconds
        )
        wait Random (@ 0.5000 @ 1.100 @ 1.300) seconds
        repeat 
    endif
endscript


script BO_SFX_River01 
    obj_playsound SK6_BO_RiverLoop01_11 vol = 40 emitter = TRG_SFX_SOB_River01
endscript


script BO_SFX_NerdKidMusic 
    change TestFirstTime = 0
    if NOT InSplitScreenGame
        if NOT IsStreamPlaying NerdKidStream
            RandomNoRepeat (
                @ obj_playstream Kid_02 vol = 150 emitter = TRG_SFX_SOB_NerdKid dropoff_function = inv_exponential id = NerdKidStream priority = 101 num_loops = -1
                @ obj_playstream Kid_03 vol = 150 emitter = TRG_SFX_SOB_NerdKid dropoff_function = inv_exponential id = NerdKidStream priority = 101 num_loops = -1
                @ obj_playstream Kid_04 vol = 150 emitter = TRG_SFX_SOB_NerdKid dropoff_function = inv_exponential id = NerdKidStream priority = 101 num_loops = -1
                @ obj_playstream Kid_05 vol = 150 emitter = TRG_SFX_SOB_NerdKid dropoff_function = inv_exponential id = NerdKidStream priority = 101 num_loops = -1
            )
            obj_addstream NerdKidStream Add = Kid_01 vol = 150
            wait 1 gameframe
            obj_removestream NerdKidStream remove = Kid_02
            obj_removestream NerdKidStream remove = Kid_03
            obj_removestream NerdKidStream remove = Kid_04
            obj_removestream NerdKidStream remove = Kid_05
        endif
    endif
endscript


script BO_SFX_PornoMusic 
    if NOT InSplitScreenGame
        if NOT IsStreamPlaying BO_Porno_Music
            if (StaticMusicBoxesOn = 1)
                RandomNoRepeat (
                    @ obj_playstream Porno_02 vol = 150 id = BO_Porno_Music emitter = TRG_SFX_SOB_PornoMusic dropoff_function = inv_exponential num_loops = -1
                    @ obj_playstream Porno_03 vol = 150 id = BO_Porno_Music emitter = TRG_SFX_SOB_PornoMusic dropoff_function = inv_exponential num_loops = -1
                    @ obj_playstream Porno_04 vol = 150 id = BO_Porno_Music emitter = TRG_SFX_SOB_PornoMusic dropoff_function = inv_exponential num_loops = -1
                    @ obj_playstream Porno_05 vol = 150 id = BO_Porno_Music emitter = TRG_SFX_SOB_PornoMusic dropoff_function = inv_exponential num_loops = -1
                )
                obj_addstream BO_Porno_Music Add = Porno_01 vol = 150
                wait 1 gameframe
                obj_removestream BO_Porno_Music remove = Porno_02
                obj_removestream BO_Porno_Music remove = Porno_03
                obj_removestream BO_Porno_Music remove = Porno_04
                obj_removestream BO_Porno_Music remove = Porno_05
            endif
        endif
        if NOT IsStreamPlaying GoatStream
            begin 
            RandomNoRepeat (
                @ TRG_SFX_Ghost_Goat01 ::obj_playstream SK6_BO_Goat01 id = GoatStream priority = StreamPriorityLow
                @ TRG_SFX_Ghost_Goat01 ::obj_playstream SK6_BO_Goat02 id = GoatStream priority = StreamPriorityLow
                @ TRG_SFX_Ghost_Goat01 ::obj_playstream SK6_BO_Goat03 id = GoatStream priority = StreamPriorityLow
            )
            wait Random (@ 5 @ 8 @ 11) seconds
            repeat 
        endif
    endif
endscript


script BO_SFX_BoatCreaks 
    begin 
    RandomNoRepeat (
        @ obj_playstream SK6_BO_BoatCreaks01 vol = 40 emitter = TRG_SFX_SOB_BoatCreaks dropoff_function = inv_exponential
        @ obj_playstream SK6_BO_BoatCreaks02 vol = 40 emitter = TRG_SFX_SOB_BoatCreaks dropoff_function = inv_exponential
    )
    wait Random (@ 6 @ 8 @ 10) seconds
    repeat 
endscript


script BO_SFX_CheersBar 
    if SkaterCamAnimFinished
        if NOT IsStreamPlaying BarCrowdStream
            obj_playstream SK6_BarCrowd vol = 80 emitter = TRG_SFX_SOB_CheersBar dropoff_function = exponential id = BarCrowdStream num_loops = -1 priority = StreamPriorityMidHigh
        endif
    endif
endscript


script BO_SFX_OrganMusic 
    if NOT InSplitScreenGame
        if NOT IsStreamPlaying BO_Church02_Organ
            if (StaticMusicBoxesOn = 1)
                TODManager_GetNumberOfDaysPassed
                dayofweek = (<num_days_passed> - (<num_days_passed> / 7)* 7)
                RandomNoRepeat (
                    @ obj_playstream Church02_02 vol = 200 id = BO_Church02_Organ emitter = TRG_SFX_SOB_OrganMusic dropoff_function = inv_exponential num_loops = -1
                    @ obj_playstream Church02_03 vol = 200 id = BO_Church02_Organ emitter = TRG_SFX_SOB_OrganMusic dropoff_function = inv_exponential num_loops = -1
                    @ obj_playstream Church02_04 vol = 200 id = BO_Church02_Organ emitter = TRG_SFX_SOB_OrganMusic dropoff_function = inv_exponential num_loops = -1
                    @ obj_playstream Church02_05 vol = 200 id = BO_Church02_Organ emitter = TRG_SFX_SOB_OrganMusic dropoff_function = inv_exponential num_loops = -1
                )
                obj_addstream BO_Church02_Organ Add = Church02_01 vol = 200
                wait 1 gameframe
                obj_removestream BO_Church02_Organ remove = Church02_02
                obj_removestream BO_Church02_Organ remove = Church02_03
                obj_removestream BO_Church02_Organ remove = Church02_04
                obj_removestream BO_Church02_Organ remove = Church02_05
            endif
        endif
    endif
endscript


script BO_SFX_SMFountain01 
    obj_playsound SK6_BO_FountainLoop03_11 vol = 20 pitch = 100 emitter = TRG_SFX_SOB_SmFountain01
endscript


script BO_SFX_SMFountain02 
    obj_playsound SK6_BO_FountainLoop03_11 vol = 20 pitch = 100 emitter = TRG_SFX_SOB_SMFountain02
endscript


script BO_SFX_PortaPottyFlies 
    begin 
    RandomNoRepeat (
        @ obj_playstream Sk6_BO_PortaPottyFlies01 vol = 60 emitter = TRG_SFX_SOB_PortaPottyFlies dropoff_function = exponential priority = StreamPriorityLow
        @ obj_playstream Sk6_BO_PortaPottyFlies02 vol = 60 emitter = TRG_SFX_SOB_PortaPottyFlies dropoff_function = exponential priority = StreamPriorityLow
    )
    wait 8.500 seconds
    repeat 
endscript


script BO_SFX_SubwayDistSounds 
endscript


script BO_SFX_ConstructionHose 
    obj_playsound SK6_BO_FountainLoop03_11 vol = 20 pitch = 200 emitter = TRG_SFX_SOB_ConstructionHose
endscript


script BO_SFX_ATMJackpot 
    begin 
    RandomNoRepeat (
        @ obj_playstream SK6_SmSpark01 emitter = TRG_SFX_SOB_ATMJackpot vol = 50 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.7000 seconds
        @ obj_playstream SK6_SmSpark02 emitter = TRG_SFX_SOB_ATMJackpot vol = 50 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.6500 seconds
        @ obj_playstream SK6_SmSpark03 emitter = TRG_SFX_SOB_ATMJackpot vol = 50 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.4800 seconds
        @ obj_playstream SK6_SmSpark04 emitter = TRG_SFX_SOB_ATMJackpot vol = 50 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.4200 seconds
        @ obj_playstream SK6_SmSpark05 emitter = TRG_SFX_SOB_ATMJackpot vol = 50 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.8600 seconds
        @ obj_playstream SK6_SmSpark06 emitter = TRG_SFX_SOB_ATMJackpot vol = 50 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.09000 seconds
        @ obj_playstream SK6_SmSpark07 emitter = TRG_SFX_SOB_ATMJackpot vol = 50 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.4400 seconds
        @ obj_playstream SK6_SmSpark08 emitter = TRG_SFX_SOB_ATMJackpot vol = 50 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.9900 seconds
        @ obj_playstream SK6_SmSpark09 emitter = TRG_SFX_SOB_ATMJackpot vol = 50 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.4300 seconds
        @ obj_playstream SK6_SmSpark10 emitter = TRG_SFX_SOB_ATMJackpot vol = 50 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.6600 seconds
        @ obj_playstream SK6_SmSpark11 emitter = TRG_SFX_SOB_ATMJackpot vol = 50 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.4600 seconds
        @ obj_playstream SK6_SmSpark12 emitter = TRG_SFX_SOB_ATMJackpot vol = 50 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.5900 seconds
        @ obj_playstream SK6_SmSpark13 emitter = TRG_SFX_SOB_ATMJackpot vol = 50 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.5300 seconds
        @ obj_playstream SK6_SmSpark14 emitter = TRG_SFX_SOB_ATMJackpot vol = 50 dropoff_function = exponential priority = StreamPriorityLow
        wait 1.0 seconds
        @ obj_playstream SK6_SmSpark15 emitter = TRG_SFX_SOB_ATMJackpot vol = 50 dropoff_function = exponential priority = StreamPriorityLow
        wait 1.080 seconds
        @ obj_playstream SK6_SmSpark16 emitter = TRG_SFX_SOB_ATMJackpot vol = 50 dropoff_function = exponential priority = StreamPriorityLow
        wait 1.540 seconds
        @ obj_playstream SK6_SmSpark17 emitter = TRG_SFX_SOB_ATMJackpot vol = 50 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.6800 seconds
        @ obj_playstream SK6_SmSpark18 emitter = TRG_SFX_SOB_ATMJackpot vol = 50 dropoff_function = exponential priority = StreamPriorityLow
        wait 1.220 seconds
        @ obj_playstream SK6_SmSpark19 emitter = TRG_SFX_SOB_ATMJackpot vol = 50 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.5100 seconds
        @ obj_playstream SK6_SmSpark20 emitter = TRG_SFX_SOB_ATMJackpot vol = 50 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.3400 seconds
        @ obj_playstream SK6_SmSpark21 emitter = TRG_SFX_SOB_ATMJackpot vol = 50 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.3600 seconds
    )
    wait 0.1000 seconds
    repeat 
endscript


script BO_SFX_HitLightBallPole 
    if NOT (issoundplaying GrindMetalOn02)
        switch <DefPole>
            case 1
            TRG_SFX_Ghost_LightBalls03 ::obj_playsound GrindMetalOn02 vol = 250 pitch = randomrange (48.0, 52.0)
            case 2
            TRG_SFX_Ghost_LightBalls01 ::obj_playsound GrindMetalOn02 vol = 250 pitch = randomrange (48.0, 52.0)
            case 3
            TRG_SFX_Ghost_LightBalls02 ::obj_playsound GrindMetalOn02 vol = 250 pitch = randomrange (48.0, 52.0)
            default 
        endswitch
    endif
endscript


script BO_SFX_Pipe_Spray 
    printf 'SPRAY NAME!!!!!!!!!!!!!!!!   %s' s = <DefSprayName>
    switch (<DefSprayName>)
        case JG_BluePipeSpray01
        TRG_SFX_Ghost_PipeBust01 ::obj_playsound BustValve pitch = randomrange (130.0, 180.0) vol = 50
        TRG_SFX_Ghost_PipeBust01 ::obj_playsound SK6_BO_FountainLoop03_11 pitch = 400 vol = 20 dropoff = 64
        case JG_BluePipeSpray02
        TRG_SFX_Ghost_PipeBust02 ::obj_playsound BustValve pitch = randomrange (130.0, 180.0) vol = 50
        TRG_SFX_Ghost_PipeBust02 ::obj_playsound SK6_BO_RiverLoop01_11 pitch = 400 vol = 20 dropoff = 64
        case JG_BluePipeSpray03
        TRG_SFX_Ghost_PipeBust03 ::obj_playsound BustValve pitch = randomrange (130.0, 180.0) vol = 50
        TRG_SFX_Ghost_PipeBust03 ::obj_playsound SK6_BO_FountainLoop03_11 pitch = 400 vol = 20 dropoff = 64
        case JG_BluePipeSpray04
        TRG_SFX_Ghost_PipeBust04 ::obj_playsound BustValve pitch = randomrange (130.0, 180.0) vol = 50
        TRG_SFX_Ghost_PipeBust04 ::obj_playsound SK6_BO_RiverLoop01_11 pitch = 400 vol = 20 dropoff = 64
        default 
    endswitch
endscript


script BO_SFX_PipeAfterCollapse 
    obj_playsound SK6_BO_RiverLoop01_11 pitch = 230 vol = 50 dropoff = 110 emitter = TRG_SFX_SOB_PipeAfterCollapse
endscript


script BO_SFX_Library_Reverb01 
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


script BO_SFX_ApartmentReverb01 
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


script BO_SFX_SubwayReverb01 
    if NOT GameIsPaused
        if NOT InSplitScreenGame
            if (inside)
                printf 'Inside Subway Reverb Box 01'
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
                printf 'Outside Subway Reverb Box 01'
                if (InsideAdjacentReverbBox02 = 0)
                    SetSfxReverb 0 mode = REV_MODE_ARENA
                else
                endif
                change InsideAdjacentReverbBox01 = 0
            endif
        endif
    endif
endscript


script BO_SFX_BankMusak 
    if NOT InSplitScreenGame
        if NOT IsStreamPlaying BO_Bank_Bossa_Musak
            if (StaticMusicBoxesOn = 1)
                wait 1 gameframe
                RandomNoRepeat (
                    @ obj_playstream Bossa_02 vol = 150 id = BO_Bank_Bossa_Musak emitter = TRG_SFX_SOB_BankMusak dropoff_function = inv_exponential num_loops = -1
                    @ obj_playstream Bossa_03 vol = 150 id = BO_Bank_Bossa_Musak emitter = TRG_SFX_SOB_BankMusak dropoff_function = inv_exponential num_loops = -1
                    @ obj_playstream Bossa_04 vol = 150 id = BO_Bank_Bossa_Musak emitter = TRG_SFX_SOB_BankMusak dropoff_function = inv_exponential num_loops = -1
                    @ obj_playstream Bossa_05 vol = 150 id = BO_Bank_Bossa_Musak emitter = TRG_SFX_SOB_BankMusak dropoff_function = inv_exponential num_loops = -1
                )
                obj_addstream BO_Bank_Bossa_Musak Add = Bossa_01
                wait 1 gameframe
                obj_removestream BO_Bank_Bossa_Musak remove = Bossa_02
                obj_removestream BO_Bank_Bossa_Musak remove = Bossa_03
                obj_removestream BO_Bank_Bossa_Musak remove = Bossa_04
                obj_removestream BO_Bank_Bossa_Musak remove = Bossa_05
            endif
        endif
    endif
endscript


script BO_SFX_Music_Volume_Box_Bank 
    if NOT InSplitScreenGame
        if (StaticMusicBoxesOn = 1)
            if SkaterCamAnimFinished
                if NOT IsTrue cutscene_is_playing
                    if (inside)
                        if (InsideSmallBox = 1)
                            SpawnScript SK6_Music_Fade_Out
                            change StaticMusicBoxState = on
                        endif
                    else
                        SpawnScript SK6_Music_Fade_In
                        change StaticMusicBoxState = Off
                        Kill name = TRG_SFX_TrigBox_LG_BankMusak
                        wait 1 gameframe
                        change OutterBoxesExist = 0
                        Kill name = TRG_SFX_TrigBox_LG_BankMusakOff
                    endif
                endif
            endif
        endif
    endif
endscript


script BO_SFX_SMALL_Bank_Musak 
    if NOT InSplitScreenGame
        if SkaterCamAnimFinished
            if NOT IsTrue cutscene_is_playing
                if (inside)
                    wait 1 gameframe
                    if (OutterBoxesExist = 0)
                        change InsideSmallBox = 1
                        Kill name = TRG_SFX_TrigBox_LG_BankMusak
                        Kill name = TRG_SFX_TrigBox_LG_BankMusakOff
                        Create name = TRG_SFX_TrigBox_LG_BankMusak
                        Create name = TRG_SFX_TrigBox_LG_BankMusakOff
                        change OutterBoxesExist = 1
                    endif
                else
                    change InsideSmallBox = 0
                endif
            endif
        endif
    endif
endscript


script BO_SFX_Music_Volume_Box_Library 
    SFX_Music_Volume_Box
    if (inside)
        SpawnScript BO_SFX_Library_Shh
    endif
endscript


script BO_SFX_Music_Volume_Box_Organ 
    if NOT InSplitScreenGame
        if (StaticMusicBoxesOn = 1)
            if SkaterCamAnimFinished
                if NOT IsTrue cutscene_is_playing
                    if (inside)
                        if (InsideSmallBox = 1)
                            SpawnScript SK6_Music_Fade_Out
                            change StaticMusicBoxState = on
                        endif
                    else
                        SpawnScript SK6_Music_Fade_In
                        change StaticMusicBoxState = Off
                        Kill name = TRG_SFX_TrigBox_LG_OrganMusic
                        wait 1 gameframe
                        change OutterBoxesExist = 0
                        Kill name = TRG_SFX_TrigBox_LG_OrganMusicOff
                    endif
                endif
            endif
        endif
    endif
endscript


script BO_SFX_SMALL_Music_Volume_Box_Organ 
    if NOT InSplitScreenGame
        if SkaterCamAnimFinished
            if NOT IsTrue cutscene_is_playing
                if (inside)
                    wait 1 gameframe
                    if (OutterBoxesExist = 0)
                        change InsideSmallBox = 1
                        Kill name = TRG_SFX_TrigBox_LG_OrganMusicOff
                        Kill name = TRG_SFX_TrigBox_LG_OrganMusic
                        Create name = TRG_SFX_TrigBox_LG_OrganMusicOff
                        Create name = TRG_SFX_TrigBox_LG_OrganMusic
                        change OutterBoxesExist = 1
                    endif
                else
                    change InsideSmallBox = 0
                endif
            endif
        endif
    endif
endscript


script BO_SFX_Music_Volume_Box_Porno 
    if NOT InSplitScreenGame
        if (StaticMusicBoxesOn = 1)
            if SkaterCamAnimFinished
                if NOT IsTrue cutscene_is_playing
                    if (inside)
                        if (InsideSmallBox = 1)
                            SpawnScript SK6_Music_Fade_Out
                            change StaticMusicBoxState = on
                        endif
                    else
                        SpawnScript SK6_Music_Fade_In
                        change StaticMusicBoxState = Off
                        Kill name = TRG_SFX_TrigBox_LG_PornoMusic
                        wait 1 gameframe
                        change OutterBoxesExist = 0
                        Kill name = TRG_SFX_TrigBox_LG_PornoMusicOff
                    endif
                endif
            endif
        endif
    endif
endscript


script BO_SFX_SMALL_Porno_Music_Box 
    if NOT InSplitScreenGame
        if SkaterCamAnimFinished
            if NOT IsTrue cutscene_is_playing
                if (inside)
                    wait 1 gameframe
                    if (OutterBoxesExist = 0)
                        change InsideSmallBox = 1
                        Kill name = TRG_SFX_TrigBox_LG_PornoMusic
                        Kill name = TRG_SFX_TrigBox_LG_PornoMusic
                        Create name = TRG_SFX_TrigBox_LG_PornoMusic
                        Create name = TRG_SFX_TrigBox_LG_PornoMusicOff
                        change OutterBoxesExist = 1
                    endif
                else
                    change InsideSmallBox = 0
                endif
            endif
        endif
    endif
endscript


script BO_SFX_Music_Volume_Box_NerdKid 
    if NOT InSplitScreenGame
        if (StaticMusicBoxesOn = 1)
            if SkaterCamAnimFinished
                if NOT IsTrue cutscene_is_playing
                    if (inside)
                        if (InsideSmallBox = 1)
                            SpawnScript SK6_Music_Fade_Out
                            change StaticMusicBoxState = on
                        endif
                    else
                        SpawnScript SK6_Music_Fade_In
                        change StaticMusicBoxState = Off
                        Kill name = TRG_SFX_TrigBox_NerdKid
                        wait 1 gameframe
                        change OutterBoxesExist = 0
                        Kill name = TRG_SFX_TrigBox_NerdKidMusicOff
                    endif
                endif
            endif
        endif
    endif
endscript


script BO_SFX_SMALL_Music_Box_Nerd_Kid 
    if NOT InSplitScreenGame
        if SkaterCamAnimFinished
            if NOT IsTrue cutscene_is_playing
                if (inside)
                    wait 1 gameframe
                    if (OutterBoxesExist = 0)
                        change InsideSmallBox = 1
                        Kill name = TRG_SFX_TrigBox_NerdKid
                        Kill name = TRG_SFX_TrigBox_NerdKidMusicOff
                        Create name = TRG_SFX_TrigBox_NerdKid
                        Create name = TRG_SFX_TrigBox_NerdKidMusicOff
                        change OutterBoxesExist = 1
                    endif
                else
                    change InsideSmallBox = 0
                endif
            endif
        endif
    endif
endscript


script BO_SFX_Music_Volume_Box_Subway 
    if NOT InSplitScreenGame
        SFX_Music_Volume_Box
    endif
endscript


script BO_SFX_MusicPed_NerdKid_Music_Start 
    printf 'PLAYING A NERD STREAM STARTUP STREAM'
    RandomNoRepeat (
        @ obj_playstream Ped_NerdKid_Start01 vol = GlobalHintVOVol
        @ obj_playstream Ped_NerdKid_Start02 vol = GlobalHintVOVol
        @ obj_playstream Ped_NerdKid_Start03 vol = GlobalHintVOVol
        @ obj_playstream Ped_NerdKid_Start04 vol = GlobalHintVOVol
    )
endscript


script BO_SFX_MusicPed_NerdKid_Music_Start_02 
    printf 'CREATING THE BOXES TO START THE POWER'
    change BO_SFX_NerdKidMusicStatus = 1
    change TestFirstTime = 1
    Kill name = TRG_SFX_TrigBox_SmallNerdKid
    Create name = TRG_SFX_TrigBox_SmallNerdKid
endscript


script BO_SFX_MusicPed_NerdKid_Music_Stop 
    printf 'PLAYING A NERD STREAM PISSED ABOUT ENDING'
    printf 'FADING OUT THE MUSIC'
    RandomNoRepeat (
        @ obj_playstream Ped_NerdKid_End01 vol = GlobalHintVOVol
        @ obj_playstream Ped_NerdKid_End02 vol = GlobalHintVOVol
        @ obj_playstream Ped_NerdKid_End03 vol = GlobalHintVOVol
        @ obj_playstream Ped_NerdKid_End04 vol = GlobalHintVOVol
        @ obj_playstream Ped_NerdKid_End05 vol = GlobalHintVOVol
    )
endscript


script BO_SFX_MusicPed_NerdKid_Music_Stop_02 
    printf 'STOPPING THE MUSIC BY KILLING BOXES'
    change BO_SFX_NerdKidMusicStatus = 0
    Kill name = TRG_SFX_TrigBox_SmallNerdKid
    Kill name = TRG_SFX_TrigBox_NerdKidMusicOff
    Kill name = TRG_SFX_TrigBox_NerdKid
    change TestFirstTime = 1
endscript


script BO_SFX_NerdKid_Moves01 
    printf '########################## 1 '
    wait 0.9000 seconds
    begin 
    if NOT IsStreamPlaying NerdKidSFXStream
        RandomNoRepeat (
            @ obj_playstream Ped_NerdKid_Moves02 vol = (GlobalHintVOVol - 60)id = NerdKidSFXStream dropoff = 50
            @ obj_playstream Ped_NerdKid_Moves03 vol = (GlobalHintVOVol - 60)id = NerdKidSFXStream dropoff = 50
            @ obj_playstream Ped_NerdKid_Moves04 vol = (GlobalHintVOVol - 60)id = NerdKidSFXStream dropoff = 50
            @ obj_playstream Ped_NerdKid_Moves05 vol = (GlobalHintVOVol - 60)id = NerdKidSFXStream dropoff = 50
            @ obj_playstream Ped_NerdKid_Moves06 vol = (GlobalHintVOVol - 60)id = NerdKidSFXStream dropoff = 50
            @ obj_playstream Ped_NerdKid_Moves07 vol = (GlobalHintVOVol - 60)id = NerdKidSFXStream dropoff = 50
            @ obj_playstream Ped_NerdKid_Moves08 vol = (GlobalHintVOVol - 60)id = NerdKidSFXStream dropoff = 50
            @ obj_playstream Ped_NerdKid_Moves09 vol = (GlobalHintVOVol - 60)id = NerdKidSFXStream dropoff = 50
            @ obj_playstream Ped_NerdKid_Moves10 vol = (GlobalHintVOVol - 60)id = NerdKidSFXStream dropoff = 50
        )
    endif
    wait 0.5000 seconds
    repeat 4
endscript


script BO_SFX_NerdKid_Moves02 
    begin 
    if NOT IsStreamPlaying NerdKidSFXStream
        RandomNoRepeat (
            @ obj_playstream Ped_NerdKid_Moves02 vol = (GlobalHintVOVol - 60)id = NerdKidSFXStream dropoff = 50
            @ obj_playstream Ped_NerdKid_Moves03 vol = (GlobalHintVOVol - 60)id = NerdKidSFXStream dropoff = 50
            @ obj_playstream Ped_NerdKid_Moves04 vol = (GlobalHintVOVol - 60)id = NerdKidSFXStream dropoff = 50
            @ obj_playstream Ped_NerdKid_Moves05 vol = (GlobalHintVOVol - 60)id = NerdKidSFXStream dropoff = 50
            @ obj_playstream Ped_NerdKid_Moves06 vol = (GlobalHintVOVol - 60)id = NerdKidSFXStream dropoff = 50
            @ obj_playstream Ped_NerdKid_Moves07 vol = (GlobalHintVOVol - 60)id = NerdKidSFXStream dropoff = 50
            @ obj_playstream Ped_NerdKid_Moves08 vol = (GlobalHintVOVol - 60)id = NerdKidSFXStream dropoff = 50
            @ obj_playstream Ped_NerdKid_Moves09 vol = (GlobalHintVOVol - 60)id = NerdKidSFXStream dropoff = 50
            @ obj_playstream Ped_NerdKid_Moves10 vol = (GlobalHintVOVol - 60)id = NerdKidSFXStream dropoff = 50
        )
    endif
    wait 0.5000 seconds
    repeat 8
endscript


script BO_SFX_MusicPed_Subway_Music_Start 
    obj_playstream SK6_BO_ChangeDrop vol = 250
    RandomNoRepeat (
        @ obj_playstream Ped_Guitarist_Start01 vol = 200 dropoff = 150 priority = StreamPriorityHigh
        @ obj_playstream Ped_Guitarist_Start02 vol = 200 dropoff = 150 priority = StreamPriorityHigh
        @ obj_playstream Ped_Guitarist_Start03 vol = 200 dropoff = 150 priority = StreamPriorityHigh
    )
endscript


script BO_SFX_MusicPed_Subway_Music_Start02 
    change BO_SFX_SubwayMusicStatus = 1
    change TestFirstTime = 1
    Kill name = TRG_SFX_TrigBox_SubwayMusicOff
    Kill name = TRG_SFX_TrigBox_SubwayMusic01
    Create name = TRG_SFX_TrigBox_SubwayMusicOff
    Create name = TRG_SFX_TrigBox_SubwayMusic01
endscript


script BO_SFX_MusicPed_Subway_Music_Stop 
    RandomNoRepeat (
        @ obj_playstream Ped_Guitarist_End01 vol = 200 dropoff = 150 priority = StreamPriorityHigh
        @ obj_playstream Ped_Guitarist_End02 vol = 200 dropoff = 150 priority = StreamPriorityHigh
        @ obj_playstream Ped_Guitarist_End03 vol = 200 dropoff = 150 priority = StreamPriorityHigh
    )
endscript


script BO_SFX_MusicPed_Subway_Music_Stop02 
    change BO_SFX_SubwayMusicStatus = 0
    Kill name = TRG_SFX_TrigBox_SubwayMusicOff
    Kill name = TRG_SFX_TrigBox_SubwayMusic01
    change TestFirstTime = 1
endscript


script BO_SFX_SubwayPassBy 
    obj_playsound SK6_BO_TrainLoop02 pitch = Random (@ 95 @ 100 @ 102) vol = 200 dropoff = 300 dropoff_function = exponential
endscript


script BO_SFX_HydrantPop_01 
    printf 'Starting Looping Sound for Hydrant Here!'
    switch <HydrantNode>
        case JG_BO_HydrantWater01
        TRG_SFX_Ghost_Hydrant01 ::obj_playsound BustValve
        TRG_SFX_Ghost_Hydrant01 ::obj_playsound SK6_BO_RiverLoop01_11 vol = 80 pitch = 200 dropoff = 110 dropoff_function = exponential
        case JG_BO_HydrantWater02
        TRG_SFX_Ghost_Hydrant02 ::obj_playsound BustValve
        TRG_SFX_Ghost_Hydrant02 ::obj_playsound SK6_BO_RiverLoop01_11 vol = 80 pitch = 200 dropoff = 110 dropoff_function = exponential
        case JG_BO_HydrantWater03
        TRG_SFX_Ghost_Hydrant03 ::obj_playsound BustValve
        TRG_SFX_Ghost_Hydrant03 ::obj_playsound SK6_BO_RiverLoop01_11 vol = 80 pitch = 200 dropoff = 110 dropoff_function = exponential
        case JG_BO_HydrantWater05
        TRG_SFX_Ghost_Hydrant05 ::obj_playsound BustValve
        TRG_SFX_Ghost_Hydrant05 ::obj_playsound SK6_BO_RiverLoop01_11 vol = 80 pitch = 200 dropoff = 110 dropoff_function = exponential
        default 
    endswitch
endscript


script BO_SFX_Big_Fan_Restart_Whoops 
    if NOT (IsStreamPlaying CustomJumpStream01)
    endif
endscript


script BO_SFX_ScaffoldingFall_01 
    TRG_SFX_Ghost_ScaffoldingFall ::obj_playsound HitTrafficBarrier vol = 300 dropoff = 180
endscript


script BO_SFX_PortaPottyFallOver_01 
    printf 'Playing Sounds and Streams for Porta Potty Falling Over Here!'
    TRG_SFX_Ghost_PortaPotty01 ::obj_playsound HitPotty vol = 200
    TRG_SFX_Ghost_PortaPotty01 ::obj_playstream SK6_PortaPottyFall vol = 250 dropoff = 150
    wait 1 second
    Create name = TRG_SFX_TrigBox_PortaPottyFlies01
endscript


script BO_SFX_LightFixtureBreak_01 
    printf 'Playing Sounds and Streams for Statehouse Light Breaking Here!'
    TRG_SFX_Ghost_StateLight01 ::obj_playsound HitGlassPane2x
    wait 1 second
    Create name = TRG_SFX_TrigBox_StateHouseSizzle
endscript


script BO_SFX_Hit_Church_Sign_01 
    TRG_SFX_Ghost_ChurchSign ::obj_playsound HitGlassPane2x vol = 160
    TRG_SFX_Ghost_ChurchSign ::obj_playsound HitGlassPane2x vol = 60 pitch = 150 dropoff = 150
    TRG_SFX_Ghost_ChurchSign ::obj_playstream SK6_NO_BreakNeonSign vol = 200 dropoff = 250
    wait 1 second
    Create name = TRG_SFX_TrigBox_ChurchSignSizzle01
endscript


script BO_SFX_Church_Sign_Sizzle 
    begin 
    RandomNoRepeat (
        @ obj_playstream SK6_SmSpark01 emitter = TRG_SFX_SOB_ChurchSignSizzle dropoff_function = exponential priority = StreamPriorityLow
        wait 0.7000 seconds
        @ obj_playstream SK6_SmSpark02 emitter = TRG_SFX_SOB_ChurchSignSizzle dropoff_function = exponential priority = StreamPriorityLow
        wait 0.6500 seconds
        @ obj_playstream SK6_SmSpark03 emitter = TRG_SFX_SOB_ChurchSignSizzle dropoff_function = exponential priority = StreamPriorityLow
        wait 0.4800 seconds
        @ obj_playstream SK6_SmSpark04 emitter = TRG_SFX_SOB_ChurchSignSizzle dropoff_function = exponential priority = StreamPriorityLow
        wait 0.4200 seconds
        @ obj_playstream SK6_SmSpark05 emitter = TRG_SFX_SOB_ChurchSignSizzle dropoff_function = exponential priority = StreamPriorityLow
        wait 0.8600 seconds
        @ obj_playstream SK6_SmSpark06 emitter = TRG_SFX_SOB_ChurchSignSizzle dropoff_function = exponential priority = StreamPriorityLow
        wait 0.09000 seconds
        @ obj_playstream SK6_SmSpark07 emitter = TRG_SFX_SOB_ChurchSignSizzle dropoff_function = exponential priority = StreamPriorityLow
        wait 0.4400 seconds
        @ obj_playstream SK6_SmSpark08 emitter = TRG_SFX_SOB_ChurchSignSizzle dropoff_function = exponential priority = StreamPriorityLow
        wait 0.9900 seconds
        @ obj_playstream SK6_SmSpark09 emitter = TRG_SFX_SOB_ChurchSignSizzle dropoff_function = exponential priority = StreamPriorityLow
        wait 0.4300 seconds
        @ obj_playstream SK6_SmSpark10 emitter = TRG_SFX_SOB_ChurchSignSizzle dropoff_function = exponential priority = StreamPriorityLow
        wait 0.6600 seconds
        @ obj_playstream SK6_SmSpark11 emitter = TRG_SFX_SOB_ChurchSignSizzle dropoff_function = exponential priority = StreamPriorityLow
        wait 0.4600 seconds
        @ obj_playstream SK6_SmSpark12 emitter = TRG_SFX_SOB_ChurchSignSizzle dropoff_function = exponential priority = StreamPriorityLow
        wait 0.5900 seconds
        @ obj_playstream SK6_SmSpark13 emitter = TRG_SFX_SOB_ChurchSignSizzle dropoff_function = exponential priority = StreamPriorityLow
        wait 0.5300 seconds
        @ obj_playstream SK6_SmSpark14 emitter = TRG_SFX_SOB_ChurchSignSizzle dropoff_function = exponential priority = StreamPriorityLow
        wait 1.0 seconds
        @ obj_playstream SK6_SmSpark15 emitter = TRG_SFX_SOB_ChurchSignSizzle dropoff_function = exponential priority = StreamPriorityLow
        wait 1.080 seconds
        @ obj_playstream SK6_SmSpark16 emitter = TRG_SFX_SOB_ChurchSignSizzle dropoff_function = exponential priority = StreamPriorityLow
        wait 1.540 seconds
        @ obj_playstream SK6_SmSpark17 emitter = TRG_SFX_SOB_ChurchSignSizzle dropoff_function = exponential priority = StreamPriorityLow
        wait 0.6800 seconds
        @ obj_playstream SK6_SmSpark18 emitter = TRG_SFX_SOB_ChurchSignSizzle dropoff_function = exponential priority = StreamPriorityLow
        wait 1.220 seconds
        @ obj_playstream SK6_SmSpark19 emitter = TRG_SFX_SOB_ChurchSignSizzle dropoff_function = exponential priority = StreamPriorityLow
        wait 0.5100 seconds
        @ obj_playstream SK6_SmSpark20 emitter = TRG_SFX_SOB_ChurchSignSizzle dropoff_function = exponential priority = StreamPriorityLow
        wait 0.3400 seconds
        @ obj_playstream SK6_SmSpark21 emitter = TRG_SFX_SOB_ChurchSignSizzle dropoff_function = exponential priority = StreamPriorityLow
        wait 0.3600 seconds
    )
    wait 0.1000 seconds
    repeat 
endscript


script BO_SFX_StateHouse_Sizzle 
    begin 
    RandomNoRepeat (
        @ obj_playstream SK6_SmSpark01 emitter = TRG_SFX_SOB_StateHouseSizzle vol = 50 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.7000 seconds
        @ obj_playstream SK6_SmSpark02 emitter = TRG_SFX_SOB_StateHouseSizzle vol = 50 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.6500 seconds
        @ obj_playstream SK6_SmSpark03 emitter = TRG_SFX_SOB_StateHouseSizzle vol = 50 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.4800 seconds
        @ obj_playstream SK6_SmSpark04 emitter = TRG_SFX_SOB_StateHouseSizzle vol = 50 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.4200 seconds
        @ obj_playstream SK6_SmSpark05 emitter = TRG_SFX_SOB_StateHouseSizzle vol = 50 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.8600 seconds
        @ obj_playstream SK6_SmSpark06 emitter = TRG_SFX_SOB_StateHouseSizzle vol = 50 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.09000 seconds
        @ obj_playstream SK6_SmSpark07 emitter = TRG_SFX_SOB_StateHouseSizzle vol = 50 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.4400 seconds
        @ obj_playstream SK6_SmSpark08 emitter = TRG_SFX_SOB_StateHouseSizzle vol = 50 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.9900 seconds
        @ obj_playstream SK6_SmSpark09 emitter = TRG_SFX_SOB_StateHouseSizzle vol = 50 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.4300 seconds
        @ obj_playstream SK6_SmSpark10 emitter = TRG_SFX_SOB_StateHouseSizzle vol = 50 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.6600 seconds
        @ obj_playstream SK6_SmSpark11 emitter = TRG_SFX_SOB_StateHouseSizzle vol = 50 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.4600 seconds
        @ obj_playstream SK6_SmSpark12 emitter = TRG_SFX_SOB_StateHouseSizzle vol = 50 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.5900 seconds
        @ obj_playstream SK6_SmSpark13 emitter = TRG_SFX_SOB_StateHouseSizzle vol = 50 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.5300 seconds
        @ obj_playstream SK6_SmSpark14 emitter = TRG_SFX_SOB_StateHouseSizzle vol = 50 dropoff_function = exponential priority = StreamPriorityLow
        wait 1.0 seconds
        @ obj_playstream SK6_SmSpark15 emitter = TRG_SFX_SOB_StateHouseSizzle vol = 50 dropoff_function = exponential priority = StreamPriorityLow
        wait 1.080 seconds
        @ obj_playstream SK6_SmSpark16 emitter = TRG_SFX_SOB_StateHouseSizzle vol = 50 dropoff_function = exponential priority = StreamPriorityLow
        wait 1.540 seconds
        @ obj_playstream SK6_SmSpark17 emitter = TRG_SFX_SOB_StateHouseSizzle vol = 50 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.6800 seconds
        @ obj_playstream SK6_SmSpark18 emitter = TRG_SFX_SOB_StateHouseSizzle vol = 50 dropoff_function = exponential priority = StreamPriorityLow
        wait 1.220 seconds
        @ obj_playstream SK6_SmSpark19 emitter = TRG_SFX_SOB_StateHouseSizzle vol = 50 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.5100 seconds
        @ obj_playstream SK6_SmSpark20 emitter = TRG_SFX_SOB_StateHouseSizzle vol = 50 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.3400 seconds
        @ obj_playstream SK6_SmSpark21 emitter = TRG_SFX_SOB_StateHouseSizzle vol = 50 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.3600 seconds
    )
    wait 0.1000 seconds
    repeat 
endscript


script BO_SFX_VolcanoLava 
endscript


script BO_SFX_Break_State_House_Fence_01 
    TRG_SFX_Ghost_StateFence01 ::obj_playstream SK6_BreakMetalFence vol = 200
    TRG_SFX_Ghost_StateFence01 ::obj_playsound HitGlassPane2x pitch = 50
    TRG_SFX_Ghost_StateFence01 ::obj_playsound HitTrafficBarrier
endscript


script BO_SFX_Break_State_House_Fence_02 
    TRG_SFX_Ghost_StateFence02 ::obj_playstream SK6_BreakMetalFence vol = 200
    TRG_SFX_Ghost_StateFence02 ::obj_playsound HitGlassPane2x pitch = 50
    TRG_SFX_Ghost_StateFence02 ::obj_playsound HitTrafficBarrier
endscript


script BO_SFX_Church_Back_Pipe 
    obj_playsound SK6_BO_FountainLoop03_11 vol = 20 pitch = 200 emitter = TRG_SFX_SOB_ChurchBackPipe
endscript


script BO_SFX_Library_Book_Flying 
    playsound SK6_Paper_Rustle01 vol = 100 pitch = RandomNoRepeat (@ 85 @ 100 @ 110)
endscript


script BO_SFX_ATM_Hit 
    TRG_SFX_Ghost_ATM ::obj_playsound HitMetalCan vol = 200
    TRG_SFX_Ghost_ATM ::obj_playsound BonkMetal_11 vol = 100
    wait 0.1000 seconds
    TRG_SFX_Ghost_ATM ::obj_playstream SK6_ATM_Hit_Cash vol = 250 dropoff = 150 priority = StreamPriorityHigh
    wait 7 seconds
    Create name = TRG_SFX_TrigBox_ATMJackpot
endscript


script BO_SFX_Cannon_01_Fuse 
    TRG_SFX_Ghost_Cannon01 ::obj_playstream SK6_BO_Cannon_Fuse01 vol = 150 dropoff = 120
endscript


script BO_SFX_Cannon_02_Fuse 
    TRG_SFX_Ghost_Cannon02 ::obj_playstream SK6_BO_Cannon_Fuse01 vol = 150 dropoff = 120
endscript


script BO_SFX_Grind_Teapot_Whistle 
    if NOT (IsStreamPlaying SK6_Teapot_Sign_Whistle)
        TRG_SFX_Ghost_TeapotWhistle ::obj_playstream SK6_Teapot_Sign_Whistle vol = 150 dropoff = 120
    endif
endscript


script BO_SFX_ArcadeMachine01 
    wait 1 gameframe
    if SkaterCamAnimFinished
        begin 
        if NOT IsStreamPlaying ArcadeGameStream
            RandomNoRepeat (
                @*6 obj_playstream SK6_Arcade_Beeps_01 vol = 200 emitter = TRG_SFX_SOB_ArcadeMachine01 priority = StreamPriorityLow dropoff_function = exponential id = ArcadeGameStream
                wait 28 seconds
                @*6 obj_playstream SK6_Arcade_Beeps_02 vol = 200 emitter = TRG_SFX_SOB_ArcadeMachine01 priority = StreamPriorityLow dropoff_function = exponential id = ArcadeGameStream
                wait 38 seconds
                @ obj_playstream SK6_Arcade_Beeps_03 vol = 200 emitter = TRG_SFX_SOB_ArcadeMachine01 priority = StreamPriorityLow dropoff_function = exponential id = ArcadeGameStream
                wait 10 seconds
                @*6 obj_playstream SK6_Arcade_Beeps_04 vol = 200 emitter = TRG_SFX_SOB_ArcadeMachine01 priority = StreamPriorityLow dropoff_function = exponential id = ArcadeGameStream
                wait 11 seconds
                @*6 obj_playstream SK6_Arcade_Beeps_05 vol = 200 emitter = TRG_SFX_SOB_ArcadeMachine01 priority = StreamPriorityLow dropoff_function = exponential id = ArcadeGameStream
                wait 35 seconds
            )
        endif
        wait 1 second
        repeat 
    endif
endscript


script BO_SFX_BarrelShatter 
    switch <defname>
        case BO_Barrel_Boat_01
        TRG_SFX_Ghost_BarrelBreak01 ::obj_playsound HitTrafficBarrier vol = 200
        TRG_SFX_Ghost_BarrelBreak01 ::obj_playstream SK6_TeaWater vol = 400
        case BO_Barrel_Boat_02
        TRG_SFX_Ghost_BarrelBreak02 ::obj_playsound HitTrafficBarrier vol = 200
        TRG_SFX_Ghost_BarrelBreak02 ::obj_playstream SK6_TeaWater vol = 400
        case BO_Barrel_Boat_03
        TRG_SFX_Ghost_BarrelBreak03 ::obj_playsound HitTrafficBarrier vol = 200
        TRG_SFX_Ghost_BarrelBreak03 ::obj_playstream SK6_TeaWater vol = 400
        case BO_Barrel_Boat_04
        TRG_SFX_Ghost_BarrelBreak04 ::obj_playsound HitTrafficBarrier vol = 200
        TRG_SFX_Ghost_BarrelBreak04 ::obj_playstream SK6_TeaWater vol = 400
        case BO_Barrel_Boat_05
        TRG_SFX_Ghost_BarrelBreak05 ::obj_playsound HitTrafficBarrier vol = 200
        TRG_SFX_Ghost_BarrelBreak05 ::obj_playstream SK6_TeaWater vol = 400
        case BO_Classic_Barrel_01
        TRG_SFX_Ghost_ClassicBarrelBreak01 ::obj_playsound HitTrafficBarrier vol = 200
        TRG_SFX_Ghost_ClassicBarrelBreak01 ::obj_playstream SK6_TeaWater vol = 400
        case BO_Classic_Barrel_02
        TRG_SFX_Ghost_ClassicBarrelBreak02 ::obj_playsound HitTrafficBarrier vol = 200
        TRG_SFX_Ghost_ClassicBarrelBreak02 ::obj_playstream SK6_TeaWater vol = 400
        case BO_Classic_Barrel_03
        TRG_SFX_Ghost_ClassicBarrelBreak03 ::obj_playsound HitTrafficBarrier vol = 200
        TRG_SFX_Ghost_ClassicBarrelBreak03 ::obj_playstream SK6_TeaWater vol = 400
        case BO_Classic_Barrel_04
        TRG_SFX_Ghost_ClassicBarrelBreak04 ::obj_playsound HitTrafficBarrier vol = 200
        TRG_SFX_Ghost_ClassicBarrelBreak04 ::obj_playstream SK6_TeaWater vol = 400
        case BO_Classic_Barrel_05
        TRG_SFX_Ghost_ClassicBarrelBreak05 ::obj_playsound HitTrafficBarrier vol = 200
        TRG_SFX_Ghost_ClassicBarrelBreak05 ::obj_playstream SK6_TeaWater vol = 400
    endswitch
endscript


script BO_SFX_MastBreakOff 
    if NOT (issoundplaying MastBreaking)
        if (BO_SFX_AlreadyHitMast = 0)
            TRG_SFX_Ghost_MastBreak01 ::obj_playsound HitTrafficBarrier id = MastBreaking vol = 400 pitch = 70
        else
            playsound HitTrafficBarrier id = MastBreaking vol = randomrange (150.0, 200.0) pitch = randomrange (65.0, 75.0)
        endif
    endif
    if NOT (BO_SFX_AlreadyHitMast = 1)
        if NOT (IsStreamPlaying SK6_MastBreakOff)
            TRG_SFX_Ghost_MastBreak02 ::obj_playstream SK6_MastBreakOff vol = 200 dropoff = 120
        endif
        wait 2 seconds
        if NOT (IsStreamPlaying SK6_MastFallInWater)
            TRG_SFX_Ghost_MastBreak03 ::obj_playstream SK6_MastFallInWater vol = 200 dropoff = 120
        endif
    endif
    change BO_SFX_AlreadyHitMast = 1
endscript


script BO_SFX_HeadCrumble01 
    TRG_SFX_Ghost_StatueHead01 ::obj_playstream SK6_CrumblingStone
endscript


script BO_SFX_HeadCrumble02 
    TRG_SFX_Ghost_StatueHead02 ::obj_playstream SK6_CrumblingStone
endscript


script BO_SFX_Pigeons01 
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


script BO_SFX_PigeonsFlyUp 
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


script BO_SFX_Hit_TSign 
    playsound Bouncy_MetalDrumHit01 vol = 200
endscript


script BO_SFX_TakeOffStatueHead 
    playsound Bouncy_TombstoneHit02 vol = 250 pitch = 80
endscript


script BO_SFX_Skater_Ignite 
    PlayStream SK6_BO_SkaterIgnite vol = 300
    skater ::obj_playsound SK6_BO_FireLoop vol = 110 pitch = 120
endscript


script BO_SFX_Skater_Put_Out_Fire 
    skater ::obj_stopsound SK6_BO_FireLoop
    skater ::obj_stopsound SK6_BO_FireLoop
endscript


script BO_SFX_Music_Beat_Start {tempo = 103 tolerance = 0.5000}
    SpawnScript SK6_Music_Fade_Out
    wait 1 gameframe
    change DontAdjustMusicViaProximNode = 1
endscript


script BO_SFX_Music_Beat_Stop 
    change DontAdjustMusicViaProximNode = 0
    SpawnScript SK6_Music_Fade_In
endscript


script BO_SFX_Start_Music_With_Tempo {DefTempo = 103 DefTolerance = 0.5000}
    change WholeNoteInSeconds = (240.0 / <DefTempo>)
    change HalfNoteInSeconds = (120.0 / <DefTempo>)
    change QuarterNoteInSeconds = (60.0 / <DefTempo>)
    change EightNoteInSeconds = (30.0 / <DefTempo>)
    change SixteenthNoteInSeconds = (15.0 / <DefTempo>)
    change BeatAdjustedToleranceTime = (EightNoteInSeconds * <DefTolerance>)
    printf 'TEMPO in BPM = %s' s = <DefTempo>
    printf 'WHOLE NOTE = %s' s = WholeNoteInSeconds
    printf 'HALF NOTE = %s' s = HalfNoteInSeconds
    printf 'QUARTER NOTE = %s' s = QuarterNoteInSeconds
    printf 'EIGHT NOTE = %s' s = EightNoteInSeconds
    printf 'SIXTEENTH NOTE = %s' s = SixteenthNoteInSeconds
    printf 'TOLERANCE = %s' s = BeatAdjustedToleranceTime
    begin 
    SpawnScript TestingForQuarterNoteTolerance
    printf '!!!!!!!!!!!!!!!!NEW MEASURE!!!!!!!!!!!!!!!'
    printf '!!!!!!!!!!!!!!!!    1    !!!!!!!!!!!!!!!'
    playsound GoToLoadLevel vol = ((BO_MUSIC_KickDrumVolume * 2)+ randomrange (0.10000000149011612, 4.0))pitch = (100 + randomrange (0.10000000149011612, 3.0))
    wait EightNoteInSeconds seconds
    playsound MB_HiHat_01 vol = (BO_MUSIC_HiHatVolume + randomrange (0.10000000149011612, 4.0))pitch = (100 + randomrange (0.10000000149011612, 3.0))
    wait SixteenthNoteInSeconds seconds
    wait SixteenthNoteInSeconds seconds
    printf '!!!!!!!!!!!!!!!!    2    !!!!!!!!!!!!!!!'
    playsound SK6_BO_RevolutionaryDrum01 vol = (BO_MUSIC_SnareDrumVolume + randomrange (0.10000000149011612, 4.0))pitch = (160 + randomrange (0.10000000149011612, 3.0))
    wait SixteenthNoteInSeconds seconds
    wait SixteenthNoteInSeconds seconds
    playsound MB_HiHat_01 vol = (BO_MUSIC_HiHatVolume + randomrange (0.10000000149011612, 4.0))pitch = (100 + randomrange (0.10000000149011612, 3.0))
    wait SixteenthNoteInSeconds seconds
    playsound GoToLoadLevel vol = ((BO_MUSIC_KickDrumVolume * 0.7000)+ randomrange (0.10000000149011612, 4.0))pitch = (100 + randomrange (0.10000000149011612, 3.0))
    wait SixteenthNoteInSeconds seconds
    printf '!!!!!!!!!!!!!!!!    3    !!!!!!!!!!!!!!!'
    playsound GoToLoadLevel vol = ((BO_MUSIC_KickDrumVolume * 1.200)+ randomrange (0.10000000149011612, 4.0))pitch = (100 + randomrange (0.10000000149011612, 3.0))
    wait EightNoteInSeconds seconds
    playsound MB_HiHat_01 vol = (BO_MUSIC_HiHatVolume + randomrange (0.10000000149011612, 4.0))pitch = (100 + randomrange (0.10000000149011612, 3.0))
    playsound GoToLoadLevel vol = (BO_MUSIC_KickDrumVolume + randomrange (0.10000000149011612, 4.0))pitch = (100 + randomrange (0.10000000149011612, 3.0))
    wait SixteenthNoteInSeconds seconds
    wait SixteenthNoteInSeconds seconds
    printf '!!!!!!!!!!!!!!!!    4    !!!!!!!!!!!!!!!'
    playsound SK6_BO_RevolutionaryDrum01 vol = (BO_MUSIC_SnareDrumVolume + randomrange (0.10000000149011612, 4.0))pitch = (160 + randomrange (0.10000000149011612, 3.0))
    wait EightNoteInSeconds seconds
    playsound MB_HiHat_01 vol = (BO_MUSIC_HiHatVolume + randomrange (0.10000000149011612, 4.0))pitch = (100 + randomrange (0.10000000149011612, 3.0))
    wait EightNoteInSeconds seconds
    repeat 
endscript


script TestingForQuarterNoteTolerance 
    begin 
    change WithinBeatTolerance = 1
    wait BeatAdjustedToleranceTime seconds
    change WithinBeatTolerance = 0
    wait (QuarterNoteInSeconds - (BeatAdjustedToleranceTime * 2))seconds
    change WithinBeatTolerance = 1
    wait BeatAdjustedToleranceTime seconds
    repeat 4
endscript


script BO_SFX_VolcanoRumble 
    if NOT IsStreamPlaying VolcanoRumbleStream
        PlayStream SK6_BO_VolcanoRumble vol = 350 id = VolcanoRumbleStream
    endif
endscript


script BO_SFX_Night_Common 
    if InSplitScreenGame
        if NOT IsStreamPlaying SK6_CrixLoop_01
            obj_playstream SK6_CrixLoop_01 vol = 30 num_loops = -1 priority = StreamPriorityHigh
        endif
    else
        obj_playstream SK6_CrixLoop_01 vol = 30 num_loops = -1 priority = StreamPriorityHigh
    endif
endscript


script BO_SFX_Night_AptArea 
    if InSplitScreenGame
        if NOT IsStreamPlaying SK6_CrixLoop_01
            obj_playstream SK6_CrixLoop_01 vol = 30 num_loops = -1 priority = StreamPriorityHigh
        endif
    else
        obj_playstream SK6_CrixLoop_01 vol = 30 num_loops = -1 priority = StreamPriorityHigh
    endif
endscript


script BO_SFX_Night_GovtCenter 
    if InSplitScreenGame
        if NOT IsStreamPlaying SK6_CrixLoop_01
            obj_playstream SK6_CrixLoop_01 vol = 30 num_loops = -1 priority = StreamPriorityHigh
        endif
    else
        obj_playstream SK6_CrixLoop_01 vol = 30 num_loops = -1 priority = StreamPriorityHigh
    endif
endscript


script BO_SFX_Day_AptArea 
endscript

level_terrain = [ 
 ]
