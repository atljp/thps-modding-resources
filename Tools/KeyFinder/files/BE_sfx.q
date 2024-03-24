
BE_SFX_BirdChirpVol = 70
BE_SFX_SaxManMusicStatus = 0
BE_SFX_DJMusicStatus = 0

script BE_LoadingSounds 
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
    LoadSound 'BE\SK6_GlassCrackQuick01'
    LoadSound 'BE\SK6_StoneCrackQuick01'
    LoadSound 'BE\SK6_BreakSignQuick'
    LoadSound 'BE\SK6_BreakCigMachine'
    LoadSound 'BE\SK6_BreakGlassPane01'
    LoadSound 'AU\AU_PoppingStreetLight'
    LoadSound 'BE\SK6_BE_AssfartFountain01'
    LoadSound 'BO\SK6_BO_RiverLoop01_11'
    LoadSound 'BouncyObjects\Bouncy_ACUnitLarge01'
    LoadSound 'BouncyObjects\Bouncy_ACUnitLarge02'
    LoadSound 'BouncyObjects\Bouncy_PlantLarge01'
    LoadSound 'BouncyObjects\Bouncy_PlantLarge02'
    LoadSound 'BouncyObjects\Bouncy_PlasticGarbageHit01'
    LoadSound 'BouncyObjects\Bouncy_PlasticGarbageHit02'
    LoadSound 'BouncyObjects\Bouncy_MetalHit01'
    LoadSound 'BouncyObjects\Bouncy_MetalHit02'
    LoadSound 'BouncyObjects\Bouncy_WoodSign01'
    LoadSound 'BouncyObjects\Bouncy_WoodSign02'
    LoadSound 'BouncyObjects\Bouncy_MetalSmallHit01'
    LoadSound 'BouncyObjects\Bouncy_MetalSmallHit02'
    LoadSound 'Terrains\GrindMetalOn02'
    LoadSound 'Shared\Hits\BustValve'
    LoadSound 'Shared\Hits\HitTrafficBarrier'
    LoadSound 'BO\SK6_BO_FireLoop'
    LoadSound 'BE\SK6_BE_Paulie_Loop'
    LoadSound 'BE\SK6_BE_Paulie_Grind'
    LoadSound 'BE\SK6_BE_Paulie_Jump'
    LoadSound 'BE\SK6_BE_Paulie_Land'
    LoadSound 'BE\SK6_BE_ElectricShock01'
    LoadSound 'BE\SK6_BE_CoockooTick'
    LoadSound 'BE\SK6_Throw_SprayCan_11'
    if (debugsoundfx = 1)
        DumpHeaps
    endif
endscript


script SK6_BE_SFX_TankCracking 
    TRG_SFX_Ghost_Fishtank ::obj_playsound SK6_GlassCrackQuick01 vol = 120 dropoff = 150
    TRG_SFX_Ghost_Fishtank ::obj_playstream SK6_GlassCracking01 vol = 120 dropoff = 150 priority = 101
endscript


script SK6_BE_SFX_TankBreakingOpen 
    TRG_SFX_Ghost_Fishtank ::obj_playstream SK6_WaterRushOut01 vol = 150 dropoff = 150 priority = 101
    TRG_SFX_Ghost_Fishtank ::obj_playsound SK6_BreakGlassPane01 vol = 120 dropoff = 150
endscript


script SK6_BE_SFX_ChurchGlassPaneBreak01 
    playsound SK6_BreakGlassPane01 vol = 120 pitch = Random (@ 80 @ 90 @ 100)
endscript


script BE_SFX_AssfartWaterfall01 
    obj_playsound SK6_BE_AssfartFountain01 vol = 70 emitter = TRG_SFX_SOB_AssfartWaterfall01 dropoff_function = linear
endscript


script BE_SFX_AssfartReverb01 
    if NOT GameIsPaused
        if NOT InSplitScreenGame
            if (inside)
                change InsideAdjacentReverbBox01 = 1
                GetValueFromVolume cdvol
                if (<value> = 0)
                    SetSfxReverb 60 mode = REV_MODE_ROOM
                else
                    SetSfxReverb 75 mode = REV_MODE_ROOM
                endif
            else
                if (InsideAdjacentReverbBox02 = 0)
                    SetSfxReverb 0 mode = REV_MODE_ROOM
                else
                    GetValueFromVolume cdvol
                    if (<value> = 0)
                        SetSfxReverb 60 mode = REV_MODE_ARENA
                    else
                        SetSfxReverb 75 mode = REV_MODE_ARENA
                    endif
                endif
                change InsideAdjacentReverbBox01 = 0
            endif
        endif
    endif
endscript


script BE_SFX_TreeBirds01 
    wait Random (@ 0 @ 0.5000 @ 0.7000 @ 0.1000) seconds
    begin 
    RandomNoRepeat (
        @ obj_playstream SK6_BO_Bird09 vol = BE_SFX_BirdChirpVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_Birds01 @ TRG_SFX_SOB_Birds02) priority = StreamPriorityLow
        wait 5 seconds
        @ obj_playstream SK6_BO_Bird10 vol = BE_SFX_BirdChirpVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_Birds01 @ TRG_SFX_SOB_Birds02) priority = StreamPriorityLow
        wait 7 seconds
        @ obj_playstream SK6_BO_Bird11 vol = BE_SFX_BirdChirpVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_Birds01 @ TRG_SFX_SOB_Birds02) priority = StreamPriorityLow
        wait 4 seconds
        @ obj_playstream SK6_BO_Bird12 vol = BE_SFX_BirdChirpVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_Birds01 @ TRG_SFX_SOB_Birds02) priority = StreamPriorityLow
        wait 3 seconds
        @ obj_playstream SK6_BO_Bird13 vol = BE_SFX_BirdChirpVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_Birds01 @ TRG_SFX_SOB_Birds02) priority = StreamPriorityLow
        wait 3 seconds
        @ obj_playstream SK6_BO_Bird14 vol = BE_SFX_BirdChirpVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_Birds01 @ TRG_SFX_SOB_Birds02) priority = StreamPriorityLow
        wait 7 seconds
        @ obj_playstream SK6_BO_Bird15 vol = BE_SFX_BirdChirpVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_Birds01 @ TRG_SFX_SOB_Birds02) priority = StreamPriorityLow
        wait 7 seconds
        @ obj_playstream SK6_BO_Bird16 vol = BE_SFX_BirdChirpVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_Birds01 @ TRG_SFX_SOB_Birds02) priority = StreamPriorityLow
        wait 7 seconds
        @ obj_playstream SK6_BO_Bird17 vol = BE_SFX_BirdChirpVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_Birds01 @ TRG_SFX_SOB_Birds02) priority = StreamPriorityLow
        wait 5 seconds
    )
    wait Random (@ 0.5000 @ 1.100 @ 1.300) seconds
    repeat 
endscript


script BE_SFX_TreeBirds02 
    wait Random (@ 0 @ 0.2000 @ 0.8000 @ 0.9000) seconds
    begin 
    RandomNoRepeat (
        @ obj_playstream SK6_BO_Bird01 vol = BE_SFX_BirdChirpVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_Birds03 @ TRG_SFX_SOB_Birds04) priority = StreamPriorityLow
        wait 4 seconds
        @ obj_playstream SK6_BO_Bird02 vol = BE_SFX_BirdChirpVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_Birds03 @ TRG_SFX_SOB_Birds04) priority = StreamPriorityLow
        wait 5 seconds
        @ obj_playstream SK6_BO_Bird03 vol = BE_SFX_BirdChirpVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_Birds03 @ TRG_SFX_SOB_Birds04) priority = StreamPriorityLow
        wait 4 seconds
        @ obj_playstream SK6_BO_Bird04 vol = BE_SFX_BirdChirpVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_Birds03 @ TRG_SFX_SOB_Birds04) priority = StreamPriorityLow
        wait 5 seconds
        @ obj_playstream SK6_BO_Bird05 vol = BE_SFX_BirdChirpVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_Birds03 @ TRG_SFX_SOB_Birds04) priority = StreamPriorityLow
        wait 8 seconds
        @ obj_playstream SK6_BO_Bird06 vol = BE_SFX_BirdChirpVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_Birds03 @ TRG_SFX_SOB_Birds04) priority = StreamPriorityLow
        wait 9 seconds
        @ obj_playstream SK6_BO_Bird07 vol = BE_SFX_BirdChirpVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_Birds03 @ TRG_SFX_SOB_Birds04) priority = StreamPriorityLow
        wait 4 seconds
        @ obj_playstream SK6_BO_Bird08 vol = BE_SFX_BirdChirpVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_Birds03 @ TRG_SFX_SOB_Birds04) priority = StreamPriorityLow
        wait 5 seconds
    )
    wait Random (@ 0.5000 @ 1.100 @ 1.300) seconds
    repeat 
endscript


script BE_SFX_TreeBirds03 
    wait Random (@ 0 @ 0.5000 @ 0.7000 @ 0.1000) seconds
    begin 
    RandomNoRepeat (
        @ obj_playstream SK6_BO_Bird09 vol = BE_SFX_BirdChirpVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_Birds05 @ TRG_SFX_SOB_Birds06 @ TRG_SFX_SOB_Birds07) priority = StreamPriorityLow
        wait 5 seconds
        @ obj_playstream SK6_BO_Bird10 vol = BE_SFX_BirdChirpVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_Birds05 @ TRG_SFX_SOB_Birds06 @ TRG_SFX_SOB_Birds07) priority = StreamPriorityLow
        wait 7 seconds
        @ obj_playstream SK6_BO_Bird11 vol = BE_SFX_BirdChirpVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_Birds05 @ TRG_SFX_SOB_Birds06 @ TRG_SFX_SOB_Birds07) priority = StreamPriorityLow
        wait 4 seconds
        @ obj_playstream SK6_BO_Bird12 vol = BE_SFX_BirdChirpVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_Birds05 @ TRG_SFX_SOB_Birds06 @ TRG_SFX_SOB_Birds07) priority = StreamPriorityLow
        wait 3 seconds
        @ obj_playstream SK6_BO_Bird13 vol = BE_SFX_BirdChirpVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_Birds05 @ TRG_SFX_SOB_Birds06 @ TRG_SFX_SOB_Birds07) priority = StreamPriorityLow
        wait 3 seconds
        @ obj_playstream SK6_BO_Bird14 vol = BE_SFX_BirdChirpVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_Birds05 @ TRG_SFX_SOB_Birds06 @ TRG_SFX_SOB_Birds07) priority = StreamPriorityLow
        wait 7 seconds
        @ obj_playstream SK6_BO_Bird15 vol = BE_SFX_BirdChirpVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_Birds05 @ TRG_SFX_SOB_Birds06 @ TRG_SFX_SOB_Birds07) priority = StreamPriorityLow
        wait 7 seconds
        @ obj_playstream SK6_BO_Bird16 vol = BE_SFX_BirdChirpVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_Birds05 @ TRG_SFX_SOB_Birds06 @ TRG_SFX_SOB_Birds07) priority = StreamPriorityLow
        wait 7 seconds
        @ obj_playstream SK6_BO_Bird17 vol = BE_SFX_BirdChirpVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_Birds05 @ TRG_SFX_SOB_Birds06 @ TRG_SFX_SOB_Birds07) priority = StreamPriorityLow
        wait 5 seconds
    )
    wait Random (@ 1 @ 2 @ 3) seconds
    repeat 
endscript


script BE_SFX_DistRiver01 
    RandomNoRepeat (
        @ obj_playstream SK6_BE_CityTraffic01 vol = 150 emitter = TRG_SFX_SOB_DistRiver01 dropoff_function = linear
        @ obj_playstream SK6_BE_CityTraffic02 vol = 150 emitter = TRG_SFX_SOB_DistRiver01 dropoff_function = linear
        @ obj_playstream SK6_BE_CityTraffic03 vol = 150 emitter = TRG_SFX_SOB_DistRiver01 dropoff_function = linear
    )
    wait 25 seconds
endscript


script BE_SFX_DistRiver02 
    RandomNoRepeat (
        @ obj_playstream SK6_BE_CityTraffic01 vol = 150 emitter = TRG_SFX_SOB_DistRiver02 dropoff_function = linear
        @ obj_playstream SK6_BE_CityTraffic02 vol = 150 emitter = TRG_SFX_SOB_DistRiver02 dropoff_function = linear
        @ obj_playstream SK6_BE_CityTraffic03 vol = 150 emitter = TRG_SFX_SOB_DistRiver02 dropoff_function = linear
    )
    wait 25 seconds
endscript


script BE_SFX_DistTraffic01 
    begin 
    RandomNoRepeat (
        @ obj_playstream SK6_BE_CityTraffic01 vol = 150 emitter = TRG_SFX_SOB_DistTraffic01 dropoff_function = linear
        @ obj_playstream SK6_BE_CityTraffic02 vol = 150 emitter = TRG_SFX_SOB_DistTraffic01 dropoff_function = linear
        @ obj_playstream SK6_BE_CityTraffic03 vol = 150 emitter = TRG_SFX_SOB_DistTraffic01 dropoff_function = linear
    )
    wait 25 seconds
    repeat 
endscript


script BE_SFX_DistTraffic02 
    begin 
    RandomNoRepeat (
        @ obj_playstream SK6_BE_CityTraffic01 vol = 150 emitter = TRG_SFX_SOB_DistTraffic02 dropoff_function = linear
        @ obj_playstream SK6_BE_CityTraffic02 vol = 150 emitter = TRG_SFX_SOB_DistTraffic02 dropoff_function = linear
        @ obj_playstream SK6_BE_CityTraffic03 vol = 150 emitter = TRG_SFX_SOB_DistTraffic02 dropoff_function = linear
    )
    wait 25 seconds
    repeat 
endscript


script BE_SFX_PubMusic 
    if NOT InSplitScreenGame
        wait 1 frame
        RandomNoRepeat (
            @ obj_playstream Polka_02 vol = 150 emitter = TRG_SFX_SOB_PubMusic id = Polka_Music num_loops = -1 priority = StreamPriorityHigh
            @ obj_playstream Polka_03 vol = 150 emitter = TRG_SFX_SOB_PubMusic id = Polka_Music num_loops = -1 priority = StreamPriorityHigh
            @ obj_playstream Polka_04 vol = 150 emitter = TRG_SFX_SOB_PubMusic id = Polka_Music num_loops = -1 priority = StreamPriorityHigh
            @ obj_playstream Polka_05 vol = 150 emitter = TRG_SFX_SOB_PubMusic id = Polka_Music num_loops = -1 priority = StreamPriorityHigh
        )
        obj_addstream Polka_Music Add = Polka_01
        wait 1 gameframe
        obj_removestream Polka_Music remove = Polka_02
        obj_removestream Polka_Music remove = Polka_03
        obj_removestream Polka_Music remove = Polka_04
        obj_removestream Polka_Music remove = Polka_05
    endif
endscript


script BE_SFX_Music_Volume_Box_Pub 
    if (StaticMusicBoxesOn = 1)
        if SkaterCamAnimFinished
            if NOT IsTrue cutscene_is_playing
                if (inside)
                    if NOT GetFlag flag = FLAG_BE_EVENT_DONE
                        if (InsideSmallBox = 1)
                            SpawnScript SK6_Music_Fade_Out
                            change StaticMusicBoxState = on
                        endif
                    endif
                else
                    SpawnScript SK6_Music_Fade_In
                    change StaticMusicBoxState = Off
                    Kill name = TRG_SFX_TrigBox_LG_PubMusic
                    wait 1 gameframe
                    change OutterBoxesExist = 0
                    Kill name = TRG_SFX_TrigBox_LG_PubMusicOff
                endif
            endif
        endif
    endif
endscript


script BE_SFX_SMALL_Pub_Music_Box 
    if SkaterCamAnimFinished
        if NOT IsTrue cutscene_is_playing
            if (inside)
                if NOT GetFlag flag = FLAG_BE_EVENT_DONE
                    wait 1 gameframe
                    if (OutterBoxesExist = 0)
                        change InsideSmallBox = 1
                        Kill name = TRG_SFX_TrigBox_LG_PubMusicOff
                        Kill name = TRG_SFX_TrigBox_LG_PubMusic
                        Create name = TRG_SFX_TrigBox_LG_PubMusicOff
                        Create name = TRG_SFX_TrigBox_LG_PubMusic
                        change OutterBoxesExist = 1
                    endif
                endif
            else
                change InsideSmallBox = 0
            endif
        endif
    endif
endscript


script BE_SFX_SkateparkMusic 
    if NOT InSplitScreenGame
        Kill name = TRG_SFX_TrigBox_LG_PubMusicOff
        Kill name = TRG_SFX_TrigBox_LG_PubMusic
        Kill name = TRG_SFX_TrigBox_MS_SmallPub
        wait 1 frame
        RandomNoRepeat (
            @ obj_playstream Chemist02 vol = 400 emitter = TRG_SFX_SOB_SkateparkMusic dropoff_function = linear id = FirstChemistStream priority = StreamPriorityHigh num_loops = -1
            @ obj_playstream Chemist03 vol = 400 emitter = TRG_SFX_SOB_SkateparkMusic dropoff_function = linear id = FirstChemistStream priority = StreamPriorityHigh num_loops = -1
            @ obj_playstream Chemist04 vol = 400 emitter = TRG_SFX_SOB_SkateparkMusic dropoff_function = linear id = FirstChemistStream priority = StreamPriorityHigh num_loops = -1
            @ obj_playstream Chemist05 vol = 400 emitter = TRG_SFX_SOB_SkateparkMusic dropoff_function = linear id = FirstChemistStream priority = StreamPriorityHigh num_loops = -1
        )
        obj_addstream FirstChemistStream Add = Chemist01
        wait 1 gameframe
        obj_removestream FirstChemistStream remove = Chemist02
        obj_removestream FirstChemistStream remove = Chemist03
        obj_removestream FirstChemistStream remove = Chemist04
        obj_removestream FirstChemistStream remove = Chemist05
    endif
endscript


script BE_SFX_Music_Volume_Box_Skatepark 
    printf '!!!!!Passed a Skatepark Boundary!!!!!'
    if NOT IsTrue cutscene_is_playing
        if (inside)
            SpawnScript SK6_Music_Fade_Out
            change StaticMusicBoxState = on
        else
            SpawnScript SK6_Music_Fade_In
            change StaticMusicBoxState = Off
        endif
    endif
endscript


script BE_SFX_ChurchOrganMusic01 
    if NOT InSplitScreenGame
        wait 1 frame
        RandomNoRepeat (
            @ obj_playstream BEOrgan_02 vol = 400 emitter = TRG_SFX_SOB_OrganMusic01 id = FirstChurchStream priority = StreamPriorityHigh num_loops = -1
            @ obj_playstream BEOrgan_03 vol = 400 emitter = TRG_SFX_SOB_OrganMusic01 id = FirstChurchStream priority = StreamPriorityHigh num_loops = -1
            @ obj_playstream BEOrgan_04 vol = 400 emitter = TRG_SFX_SOB_OrganMusic01 id = FirstChurchStream priority = StreamPriorityHigh num_loops = -1
            @ obj_playstream BEOrgan_05 vol = 400 emitter = TRG_SFX_SOB_OrganMusic01 id = FirstChurchStream priority = StreamPriorityHigh num_loops = -1
        )
        obj_addstream FirstChurchStream Add = BEOrgan_01 vol = 400
        wait 1 gameframe
        obj_removestream FirstChurchStream remove = BEOrgan_02
        obj_removestream FirstChurchStream remove = BEOrgan_03
        obj_removestream FirstChurchStream remove = BEOrgan_04
        obj_removestream FirstChurchStream remove = BEOrgan_05
    endif
endscript


script BE_SFX_Music_Volume_Box_ChurchOrgan 
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
                    Kill name = TRG_SFX_TrigBox_LG_ChurchOrganMusic01
                    wait 1 gameframe
                    change OutterBoxesExist = 0
                    Kill name = TRG_SFX_TrigBox_LG_ChurchOrganMusicOff
                endif
            endif
        endif
    endif
endscript


script BE_SFX_SMALL_OrganMusicBox 
    if SkaterCamAnimFinished
        if NOT IsTrue cutscene_is_playing
            if (inside)
                wait 1 gameframe
                if (OutterBoxesExist = 0)
                    change InsideSmallBox = 1
                    Kill name = TRG_SFX_TrigBox_LG_ChurchOrganMusicOff
                    Kill name = TRG_SFX_TrigBox_LG_ChurchOrganMusic01
                    Create name = TRG_SFX_TrigBox_LG_ChurchOrganMusicOff
                    Create name = TRG_SFX_TrigBox_LG_ChurchOrganMusic01
                    change OutterBoxesExist = 1
                endif
            else
                change InsideSmallBox = 0
            endif
        endif
    endif
endscript


script BE_SFX_SkateparkReverb01 
    if NOT GameIsPaused
        if NOT InSplitScreenGame
            if (inside)
                change InsideAdjacentReverbBox01 = 1
                GetValueFromVolume cdvol
                if (<value> = 0)
                    SetSfxReverb 60 mode = REV_MODE_ROOM
                else
                    SetSfxReverb 75 mode = REV_MODE_ROOM
                endif
            else
                if (InsideAdjacentReverbBox02 = 0)
                    SetSfxReverb 0 mode = REV_MODE_ROOM
                else
                    GetValueFromVolume cdvol
                    if (<value> = 0)
                        SetSfxReverb 60 mode = REV_MODE_ARENA
                    else
                        SetSfxReverb 75 mode = REV_MODE_ARENA
                    endif
                endif
                change InsideAdjacentReverbBox01 = 0
            endif
        endif
    endif
endscript


script BE_SFX_RoofAirVent01 
    if NOT IsStreamPlaying BE_VentLoopStream
        obj_playstream SK6_BO_Air_Vent vol = 180 emitter = TRG_SFX_SOB_RoofAirVent01 dropoff_function = exponential priority = StreamPriorityHigh num_loops = -1 id = BE_VentLoopStream
    endif
endscript


script BE_SFX_SaxManStart 
    printf 'PLAYING A SAX MAN STREAM STARTUP STREAM'
    obj_playstream SK6_BO_ChangeDrop vol = 200
    RandomNoRepeat (
        @ obj_playstream SaxMan_Start01 vol = 200 priority = StreamPriorityHigh dropoff = 150
        @ obj_playstream SaxMan_Start02 vol = 200 priority = StreamPriorityHigh dropoff = 150
        @ obj_playstream SaxMan_Start03 vol = 200 priority = StreamPriorityHigh dropoff = 150
        @ obj_playstream SaxMan_Start04 vol = 200 priority = StreamPriorityHigh dropoff = 150
        @ obj_playstream SaxMan_Start05 vol = 200 priority = StreamPriorityHigh dropoff = 150
        @ obj_playstream SaxMan_Start06 vol = 200 priority = StreamPriorityHigh dropoff = 150
    )
endscript


script BE_SFX_SaxManStart02 
    printf 'CREATING THE BOXES TO START HIM PLAYING'
    change BE_SFX_SaxManMusicStatus = 1
    Kill name = TRG_SFX_TrigBox_SaxManMusicOff
    Kill name = TRG_SFX_TrigBox_SaxMan01
    Kill name = TRG_SFX_TrigBox_SmallSaxMan
    Create name = TRG_SFX_TrigBox_SmallSaxMan
endscript


script BE_SFX_SaxManStop 
    printf 'PLAYING A SAX MAN STREAM PISSED ABOUT ENDING'
    RandomNoRepeat (
        @ obj_playstream SaxMan_End01 vol = 200 priority = StreamPriorityHigh dropoff = 150
        @ obj_playstream SaxMan_End02 vol = 200 priority = StreamPriorityHigh dropoff = 150
        @ obj_playstream SaxMan_End03 vol = 200 priority = StreamPriorityHigh dropoff = 150
        @ obj_playstream SaxMan_End04 vol = 200 priority = StreamPriorityHigh dropoff = 150
        @ obj_playstream SaxMan_End05 vol = 200 priority = StreamPriorityHigh dropoff = 150
    )
endscript


script BE_SFX_SaxManStop02 
    change BE_SFX_SaxManMusicStatus = 0
    Kill name = TRG_SFX_TrigBox_SaxMan01
    Kill name = TRG_SFX_TrigBox_SaxManMusicOff
    Kill name = TRG_SFX_TrigBox_SmallSaxMan
endscript


script BE_SFX_Music_Volume_Box_SaxMan 
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
                    Kill name = TRG_SFX_TrigBox_SaxMan01
                    wait 1 gameframe
                    change OutterBoxesExist = 0
                    Kill name = TRG_SFX_TrigBox_SaxManMusicOff
                endif
            endif
        endif
    endif
endscript


script BE_SFX_SMALL_SaxMan_Music_Box 
    if SkaterCamAnimFinished
        if NOT IsTrue cutscene_is_playing
            if (inside)
                wait 1 gameframe
                if (OutterBoxesExist = 0)
                    change InsideSmallBox = 1
                    Kill name = TRG_SFX_TrigBox_SaxManMusicOff
                    Kill name = TRG_SFX_TrigBox_SaxMan01
                    Create name = TRG_SFX_TrigBox_SaxManMusicOff
                    Create name = TRG_SFX_TrigBox_SaxMan01
                    change OutterBoxesExist = 1
                endif
            else
                change InsideSmallBox = 0
            endif
        endif
    endif
endscript


script BE_SFX_SaxMan01 
    wait 1 gameframe
    begin 
    RandomNoRepeat (
        @ obj_playstream BE_SaxGuy01 vol = 250 emitter = TRG_SFX_SOB_SaxMan01 dropoff_function = inv_exponential
        wait 3.100 seconds
        @ obj_playstream BE_SaxGuy02 vol = 250 emitter = TRG_SFX_SOB_SaxMan01 dropoff_function = inv_exponential
        wait 7.500 seconds
        @ obj_playstream BE_SaxGuy03 vol = 250 emitter = TRG_SFX_SOB_SaxMan01 dropoff_function = inv_exponential
        wait 7.800 seconds
        @ obj_playstream BE_SaxGuy04 vol = 250 emitter = TRG_SFX_SOB_SaxMan01 dropoff_function = inv_exponential
        wait 4 seconds
        @ obj_playstream BE_SaxGuy05 vol = 250 emitter = TRG_SFX_SOB_SaxMan01 dropoff_function = inv_exponential
        wait 2.700 seconds
        @ obj_playstream BE_SaxGuy06 vol = 250 emitter = TRG_SFX_SOB_SaxMan01 dropoff_function = inv_exponential
        wait 2.600 seconds
        @ obj_playstream BE_SaxGuy07 vol = 250 emitter = TRG_SFX_SOB_SaxMan01 dropoff_function = inv_exponential
        wait 8.600 seconds
        @ obj_playstream BE_SaxGuy08 vol = 250 emitter = TRG_SFX_SOB_SaxMan01 dropoff_function = inv_exponential
        wait 2.500 seconds
        @ obj_playstream BE_SaxGuy09 vol = 250 emitter = TRG_SFX_SOB_SaxMan01 dropoff_function = inv_exponential
        wait 7.300 seconds
        @ obj_playstream BE_SaxGuy10 vol = 250 emitter = TRG_SFX_SOB_SaxMan01 dropoff_function = inv_exponential
        wait 5.300 seconds
        @ obj_playstream BE_SaxGuy11 vol = 250 emitter = TRG_SFX_SOB_SaxMan01 dropoff_function = inv_exponential
        wait 7.300 seconds
        @ obj_playstream BE_SaxGuy12 vol = 250 emitter = TRG_SFX_SOB_SaxMan01 dropoff_function = inv_exponential
        wait 9 seconds
        @ obj_playstream BE_SaxGuy13 vol = 250 emitter = TRG_SFX_SOB_SaxMan01 dropoff_function = inv_exponential
        wait 7.600 seconds
        @ obj_playstream BE_SaxGuy14 vol = 250 emitter = TRG_SFX_SOB_SaxMan01 dropoff_function = inv_exponential
        wait 7 seconds
        @ obj_playstream BE_SaxGuy15 vol = 250 emitter = TRG_SFX_SOB_SaxMan01 dropoff_function = inv_exponential
        wait 6.500 seconds
        @ obj_playstream BE_SaxGuy16 vol = 250 emitter = TRG_SFX_SOB_SaxMan01 dropoff_function = inv_exponential
        wait 5 seconds
    )
    wait 1 second
    repeat 
endscript


script BE_SFX_BrokenPubTap 
    obj_playsound SK6_BO_RiverLoop01_11 pitch = 400 vol = 20 emitter = TRG_SFX_SOB_PubBrokenTap
endscript


script BE_SFX_BrokenPubElectric 
    begin 
    RandomNoRepeat (
        @ obj_playstream SK6_SmSpark01 emitter = TRG_SFX_SOB_BrokenPubElectric dropoff_function = exponential priority = StreamPriorityLow
        wait 0.7000 seconds
        @ obj_playstream SK6_SmSpark02 emitter = TRG_SFX_SOB_BrokenPubElectric dropoff_function = exponential priority = StreamPriorityLow
        wait 0.6500 seconds
        @ obj_playstream SK6_SmSpark03 emitter = TRG_SFX_SOB_BrokenPubElectric dropoff_function = exponential priority = StreamPriorityLow
        wait 0.4800 seconds
        @ obj_playstream SK6_SmSpark04 emitter = TRG_SFX_SOB_BrokenPubElectric dropoff_function = exponential priority = StreamPriorityLow
        wait 0.4200 seconds
        @ obj_playstream SK6_SmSpark05 emitter = TRG_SFX_SOB_BrokenPubElectric dropoff_function = exponential priority = StreamPriorityLow
        wait 0.8600 seconds
        @ obj_playstream SK6_SmSpark06 emitter = TRG_SFX_SOB_BrokenPubElectric dropoff_function = exponential priority = StreamPriorityLow
        wait 0.09000 seconds
        @ obj_playstream SK6_SmSpark07 emitter = TRG_SFX_SOB_BrokenPubElectric dropoff_function = exponential priority = StreamPriorityLow
        wait 0.4400 seconds
        @ obj_playstream SK6_SmSpark08 emitter = TRG_SFX_SOB_BrokenPubElectric dropoff_function = exponential priority = StreamPriorityLow
        wait 0.9900 seconds
        @ obj_playstream SK6_SmSpark09 emitter = TRG_SFX_SOB_BrokenPubElectric dropoff_function = exponential priority = StreamPriorityLow
        wait 0.4300 seconds
        @ obj_playstream SK6_SmSpark10 emitter = TRG_SFX_SOB_BrokenPubElectric dropoff_function = exponential priority = StreamPriorityLow
        wait 0.6600 seconds
        @ obj_playstream SK6_SmSpark11 emitter = TRG_SFX_SOB_BrokenPubElectric dropoff_function = exponential priority = StreamPriorityLow
        wait 0.4600 seconds
        @ obj_playstream SK6_SmSpark12 emitter = TRG_SFX_SOB_BrokenPubElectric dropoff_function = exponential priority = StreamPriorityLow
        wait 0.5900 seconds
        @ obj_playstream SK6_SmSpark13 emitter = TRG_SFX_SOB_BrokenPubElectric dropoff_function = exponential priority = StreamPriorityLow
        wait 0.5300 seconds
        @ obj_playstream SK6_SmSpark14 emitter = TRG_SFX_SOB_BrokenPubElectric dropoff_function = exponential priority = StreamPriorityLow
        wait 1.0 seconds
        @ obj_playstream SK6_SmSpark15 emitter = TRG_SFX_SOB_BrokenPubElectric dropoff_function = exponential priority = StreamPriorityLow
        wait 1.080 seconds
        @ obj_playstream SK6_SmSpark16 emitter = TRG_SFX_SOB_BrokenPubElectric dropoff_function = exponential priority = StreamPriorityLow
        wait 1.540 seconds
        @ obj_playstream SK6_SmSpark17 emitter = TRG_SFX_SOB_BrokenPubElectric dropoff_function = exponential priority = StreamPriorityLow
        wait 0.6800 seconds
        @ obj_playstream SK6_SmSpark18 emitter = TRG_SFX_SOB_BrokenPubElectric dropoff_function = exponential priority = StreamPriorityLow
        wait 1.220 seconds
        @ obj_playstream SK6_SmSpark19 emitter = TRG_SFX_SOB_BrokenPubElectric dropoff_function = exponential priority = StreamPriorityLow
        wait 0.5100 seconds
        @ obj_playstream SK6_SmSpark20 emitter = TRG_SFX_SOB_BrokenPubElectric dropoff_function = exponential priority = StreamPriorityLow
        wait 0.3400 seconds
        @ obj_playstream SK6_SmSpark21 emitter = TRG_SFX_SOB_BrokenPubElectric dropoff_function = exponential priority = StreamPriorityLow
        wait 0.3600 seconds
    )
    wait 0.1000 seconds
    repeat 
endscript


script BE_SFX_BrokenPipeTrainWall 
    obj_playsound SK6_BO_RiverLoop01_11 pitch = 200 vol = 20 emitter = TRG_SFX_SOB_BrokenPipeTrainWall
endscript


script BE_SFX_BrokenPillar01 
    begin 
    RandomNoRepeat (
        @ obj_playstream SK6_SmSpark01 emitter = TRG_SFX_SOB_BrokenPillar01 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.7000 seconds
        @ obj_playstream SK6_SmSpark02 emitter = TRG_SFX_SOB_BrokenPillar01 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.6500 seconds
        @ obj_playstream SK6_SmSpark03 emitter = TRG_SFX_SOB_BrokenPillar01 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.4800 seconds
        @ obj_playstream SK6_SmSpark04 emitter = TRG_SFX_SOB_BrokenPillar01 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.4200 seconds
        @ obj_playstream SK6_SmSpark05 emitter = TRG_SFX_SOB_BrokenPillar01 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.8600 seconds
        @ obj_playstream SK6_SmSpark06 emitter = TRG_SFX_SOB_BrokenPillar01 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.09000 seconds
        @ obj_playstream SK6_SmSpark07 emitter = TRG_SFX_SOB_BrokenPillar01 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.4400 seconds
        @ obj_playstream SK6_SmSpark08 emitter = TRG_SFX_SOB_BrokenPillar01 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.9900 seconds
        @ obj_playstream SK6_SmSpark09 emitter = TRG_SFX_SOB_BrokenPillar01 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.4300 seconds
        @ obj_playstream SK6_SmSpark10 emitter = TRG_SFX_SOB_BrokenPillar01 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.6600 seconds
        @ obj_playstream SK6_SmSpark11 emitter = TRG_SFX_SOB_BrokenPillar01 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.4600 seconds
        @ obj_playstream SK6_SmSpark12 emitter = TRG_SFX_SOB_BrokenPillar01 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.5900 seconds
        @ obj_playstream SK6_SmSpark13 emitter = TRG_SFX_SOB_BrokenPillar01 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.5300 seconds
        @ obj_playstream SK6_SmSpark14 emitter = TRG_SFX_SOB_BrokenPillar01 dropoff_function = exponential priority = StreamPriorityLow
        wait 1.0 seconds
        @ obj_playstream SK6_SmSpark15 emitter = TRG_SFX_SOB_BrokenPillar01 dropoff_function = exponential priority = StreamPriorityLow
        wait 1.080 seconds
        @ obj_playstream SK6_SmSpark16 emitter = TRG_SFX_SOB_BrokenPillar01 dropoff_function = exponential priority = StreamPriorityLow
        wait 1.540 seconds
        @ obj_playstream SK6_SmSpark17 emitter = TRG_SFX_SOB_BrokenPillar01 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.6800 seconds
        @ obj_playstream SK6_SmSpark18 emitter = TRG_SFX_SOB_BrokenPillar01 dropoff_function = exponential priority = StreamPriorityLow
        wait 1.220 seconds
        @ obj_playstream SK6_SmSpark19 emitter = TRG_SFX_SOB_BrokenPillar01 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.5100 seconds
        @ obj_playstream SK6_SmSpark20 emitter = TRG_SFX_SOB_BrokenPillar01 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.3400 seconds
        @ obj_playstream SK6_SmSpark21 emitter = TRG_SFX_SOB_BrokenPillar01 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.3600 seconds
    )
    wait 0.1000 seconds
    repeat 
endscript


script BE_SFX_BrokenPillar02 
endscript


script BE_SFX_PipeFire 
    obj_playsound SK6_BO_FireLoop vol = 200 emitter = TRG_SFX_SOB_PipeFire dropoff_function = exponential
endscript


script BE_SFX_Zoo 
endscript


script BE_SFX_AC_Spark01 
    BE_SFX_PlaySparksFromObject_With_Emitter emitter = TRG_SFX_SOB_AC_Sparks_Signs01
endscript


script BE_SFX_AC_Spark02 
    BE_SFX_PlaySparksFromObject_With_Emitter emitter = TRG_SFX_SOB_AC_Sparks_Signs02
endscript


script BE_SFX_AC_Spark03 
    BE_SFX_PlaySparksFromObject_With_Emitter emitter = TRG_SFX_SOB_AC_Sparks_Signs03
endscript


script BE_SFX_AC_Spark04 
    BE_SFX_PlaySparksFromObject_With_Emitter emitter = TRG_SFX_SOB_AC_Sparks_Signs04
endscript


script BE_SFX_AC_Sparks05 
    BE_SFX_PlaySparksFromObject_With_Emitter emitter = TRG_SFX_SOB_AC_Sparks_SP01
endscript


script BE_SFX_AC_Sparks06 
    BE_SFX_PlaySparksFromObject_With_Emitter emitter = TRG_SFX_SOB_AC_Sparks_SP02
endscript


script BE_SFX_AC_Sparks07 
    BE_SFX_PlaySparksFromObject_With_Emitter emitter = TRG_SFX_SOB_AC_Sparks_SP03
endscript


script BE_SFX_AC_Sparks08 
    BE_SFX_PlaySparksFromObject_With_Emitter emitter = TRG_SFX_SOB_AC_Sparks_SP04
endscript


script BE_SFX_CigMachine01 
    BE_SFX_PlaySparksFromObject_With_Emitter emitter = TRG_SFX_SOB_CigMachine01
endscript


script BE_SFX_CigMachine02 
    BE_SFX_PlaySparksFromObject_With_Emitter emitter = TRG_SFX_SOB_CigMachine02
endscript


script BE_SFX_CigMachine03 
    BE_SFX_PlaySparksFromObject_With_Emitter emitter = TRG_SFX_SOB_CigMachine03
endscript


script BE_SFX_BreakPipeNearAssfart 
    TRG_SFX_Ghost_BrokenPipe ::obj_playsound BustValve
    TRG_SFX_Ghost_BrokenPipe ::obj_playsound SK6_BO_RiverLoop01_11 vol = 80 pitch = 200 dropoff = 110 dropoff_function = exponential
endscript


script BE_SFX_LightningAndThunder number = 1
    SFXGhostObject = TRG_SFX_Ghost_Lightning01
    switch <number>
        case 1
        SFXGhostObject = TRG_SFX_Ghost_Lightning01
        case 2
        SFXGhostObject = TRG_SFX_Ghost_Lightning02
        case 3
        SFXGhostObject = TRG_SFX_Ghost_Lightning03
        case 4
        SFXGhostObject = TRG_SFX_Ghost_Lightning04
        case 5
        SFXGhostObject = TRG_SFX_Ghost_Lightning05
        case 6
        SFXGhostObject = TRG_SFX_Ghost_Lightning06
        case 7
        SFXGhostObject = TRG_SFX_Ghost_Lightning07
        case 8
        SFXGhostObject = TRG_SFX_Ghost_Lightning08
        case 9
        SFXGhostObject = TRG_SFX_Ghost_Lightning09
        case 10
        SFXGhostObject = TRG_SFX_Ghost_Lightning10
        default 
    endswitch
    TRG_SFX_Ghost_Lightning01 ::obj_stopstream
    TRG_SFX_Ghost_Lightning02 ::obj_stopstream
    TRG_SFX_Ghost_Lightning03 ::obj_stopstream
    TRG_SFX_Ghost_Lightning04 ::obj_stopstream
    TRG_SFX_Ghost_Lightning05 ::obj_stopstream
    TRG_SFX_Ghost_Lightning06 ::obj_stopstream
    TRG_SFX_Ghost_Lightning07 ::obj_stopstream
    TRG_SFX_Ghost_Lightning08 ::obj_stopstream
    TRG_SFX_Ghost_Lightning09 ::obj_stopstream
    TRG_SFX_Ghost_Lightning10 ::obj_stopstream
    RandomNoRepeat (
        @ <SFXGhostObject> ::obj_playstream SK6_BE_LightningAndThunder01 vol = 300 dropoff = 2000 id = LightningStream priority = StreamPriorityLowMid
        @ <SFXGhostObject> ::obj_playstream SK6_BE_LightningAndThunder02 vol = 300 dropoff = 2000 id = LightningStream priority = StreamPriorityLowMid
        @ <SFXGhostObject> ::obj_playstream SK6_BE_LightningAndThunder03 vol = 300 dropoff = 2000 id = LightningStream priority = StreamPriorityLowMid
        @ <SFXGhostObject> ::obj_playstream SK6_BE_LightningAndThunder04 vol = 300 dropoff = 2000 id = LightningStream priority = StreamPriorityLowMid
        @ <SFXGhostObject> ::obj_playstream SK6_BE_LightningAndThunder05 vol = 300 dropoff = 2000 id = LightningStream priority = StreamPriorityLowMid
        @ <SFXGhostObject> ::obj_playstream SK6_BE_LightningAndThunder06 vol = 300 dropoff = 2000 id = LightningStream priority = StreamPriorityLowMid
        @ <SFXGhostObject> ::obj_playstream SK6_BE_LightningAndThunder07 vol = 300 dropoff = 2000 id = LightningStream priority = StreamPriorityLowMid
        @ <SFXGhostObject> ::obj_playstream SK6_BE_LightningAndThunder08 vol = 300 dropoff = 2000 id = LightningStream priority = StreamPriorityLowMid
    )
endscript


script BE_SFX_CoockooTick 
endscript


script BE_SFX_CoockooChime 
endscript


script BE_SFX_PoliceRadio 
    begin 
    RandomNoRepeat (
        @ obj_playstream SK6_BE_PoliceRadio01 vol = 50 priority = StreamPriorityLow
        @ obj_playstream SK6_BE_PoliceRadio02 vol = 50 priority = StreamPriorityLow
        @ obj_playstream SK6_BE_PoliceRadio03 vol = 50 priority = StreamPriorityLow
        @ obj_playstream SK6_BE_PoliceRadio04 vol = 50 priority = StreamPriorityLow
    )
    wait Random (@ 6.500 @ 8 @ 9) seconds
    repeat 
endscript


script BE_SFX_BreakHangingLight 
endscript


script BE_SFX_BreakBarrierLight 
endscript


script BE_SFX_Skater_On_Fire 
    PlayStream SK6_BO_SkaterIgnite vol = 300
    skater ::obj_playsound SK6_BO_FireLoop vol = 110 pitch = 120
endscript


script BE_SFX_CopHatOnFire 
    Random (
        @ PlayStream Ped_Security_Guard_01_Fire01 vol = 200 priority = StreamPriorityHigh
        @ PlayStream Ped_Security_Guard_01_Fire02 vol = 200 priority = StreamPriorityHigh
        @ PlayStream Ped_Security_Guard_01_Fire03 vol = 200 priority = StreamPriorityHigh
        @ PlayStream Ped_Security_Guard_01_Fire04 vol = 200 priority = StreamPriorityHigh
        @ PlayStream Ped_Security_Guard_01_Fire05 vol = 200 priority = StreamPriorityHigh
        @ PlayStream Ped_Security_Guard_01_Fire06 vol = 200 priority = StreamPriorityHigh
    )
    obj_playsound SK6_BO_FireLoop vol = 80 dropoff = 120 dropoff_function = exponential
endscript


script BE_SFX_RevealMural 
    wait 0.6000 seconds
    PlayStream SK6_RevealMural vol = 200 priority = 99
endscript


script BE_SFX_Break_Wooden_Barrel 
    StopStream SK6_TeaWater
    if NOT issoundplaying ThisBarrelsSound01
        TRG_SFX_Ghost_Barrel01 ::obj_playsound HitTrafficBarrier vol = 200 dropoff = 150 id = ThisBarrelsSound01
    endif
    if NOT IsStreamPlaying SK6_TeaWater
        TRG_SFX_Ghost_Barrel01 ::obj_playstream SK6_TeaWater vol = 400 id = ThisBarrelsStream01
    endif
endscript


script BE_SFX_Break_Wooden_Barrel02 
    StopStream SK6_TeaWater
    if NOT issoundplaying ThisBarrelsSound01
        TRG_SFX_Ghost_Barrel02 ::obj_playsound HitTrafficBarrier vol = 200 dropoff = 150 id = ThisBarrelsSound01
    endif
    if NOT IsStreamPlaying SK6_TeaWater
        TRG_SFX_Ghost_Barrel02 ::obj_playstream SK6_TeaWater vol = 400 id = ThisBarrelsStream01
    endif
endscript


script BE_SFX_ConstructionSparks01 
endscript


script BE_SFX_ConstructionSparks02 
endscript


script BE_SFX_ChurchStoneDoorCrack 
    TRG_SFX_Ghost_ChurchWall ::obj_playsound SK6_StoneCrackQuick01 vol = 200 dropoff = 150
    TRG_SFX_Ghost_ChurchWall ::obj_playstream SK6_StoneCracking01 vol = 200 dropoff = 150 priority = 100 id = DoorBreakDownStream
endscript


script BE_SFX_ChurchStoneDoorBreakDown 
    TRG_SFX_Ghost_ChurchWall ::obj_stopstream DoorBreakDownStream
    TRG_SFX_Ghost_ChurchWall ::obj_playstream SK6_StoneDoorBreakDown vol = 200 priority = 100 dropoff = 150
endscript


script BE_SFX_HitCigMachine01 
    TRG_SFX_Ghost_CigMachine01 ::obj_playsound SK6_BreakCigMachine vol = 150 dropoff = 150
endscript


script BE_SFX_HitCigMachine02 
    TRG_SFX_Ghost_CigMachine02 ::obj_playsound SK6_BreakCigMachine vol = 150 dropoff = 150
endscript


script BE_SFX_HitCigMachine03 
    TRG_SFX_Ghost_CigMachine03 ::obj_playsound SK6_BreakCigMachine vol = 150 dropoff = 150
endscript


script BE_SFX_BreakSignDown01 
    TRG_SFX_Ghost_SignBreak01 ::obj_playsound SK6_BreakSignQuick vol = 200
    TRG_SFX_Ghost_SignBreak01 ::obj_playstream SK6_SignBreakDown vol = 200 priority = StreamPriorityHigh
endscript


script BE_SFX_BreakSignDown02 
    TRG_SFX_Ghost_SignBreak01 ::obj_playsound SK6_BreakSignQuick vol = 200
    TRG_SFX_Ghost_SignBreak01 ::obj_playstream SK6_SignBreakDown vol = 200 priority = StreamPriorityHigh
endscript


script BE_SFX_PlaySparksFromObject_With_Emitter emitter = TRG_SFX
    begin 
    RandomNoRepeat (
        @ obj_playstream SK6_SmSpark01 emitter = <emitter> vol = 50 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.7000 seconds
        @ obj_playstream SK6_SmSpark02 emitter = <emitter> vol = 50 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.6500 seconds
        @ obj_playstream SK6_SmSpark03 emitter = <emitter> vol = 50 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.4800 seconds
        @ obj_playstream SK6_SmSpark04 emitter = <emitter> vol = 50 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.4200 seconds
        @ obj_playstream SK6_SmSpark05 emitter = <emitter> vol = 50 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.8600 seconds
        @ obj_playstream SK6_SmSpark06 emitter = <emitter> vol = 50 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.09000 seconds
        @ obj_playstream SK6_SmSpark07 emitter = <emitter> vol = 50 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.4400 seconds
        @ obj_playstream SK6_SmSpark08 emitter = <emitter> vol = 50 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.9900 seconds
        @ obj_playstream SK6_SmSpark09 emitter = <emitter> vol = 50 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.4300 seconds
        @ obj_playstream SK6_SmSpark10 emitter = <emitter> vol = 50 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.6600 seconds
        @ obj_playstream SK6_SmSpark11 emitter = <emitter> vol = 50 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.4600 seconds
        @ obj_playstream SK6_SmSpark12 emitter = <emitter> vol = 50 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.5900 seconds
        @ obj_playstream SK6_SmSpark13 emitter = <emitter> vol = 50 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.5300 seconds
        @ obj_playstream SK6_SmSpark14 emitter = <emitter> vol = 50 dropoff_function = exponential priority = StreamPriorityLow
        wait 1.0 seconds
        @ obj_playstream SK6_SmSpark15 emitter = <emitter> vol = 50 dropoff_function = exponential priority = StreamPriorityLow
        wait 1.080 seconds
        @ obj_playstream SK6_SmSpark16 emitter = <emitter> vol = 50 dropoff_function = exponential priority = StreamPriorityLow
        wait 1.540 seconds
        @ obj_playstream SK6_SmSpark17 emitter = <emitter> vol = 50 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.6800 seconds
        @ obj_playstream SK6_SmSpark18 emitter = <emitter> vol = 50 dropoff_function = exponential priority = StreamPriorityLow
        wait 1.220 seconds
        @ obj_playstream SK6_SmSpark19 emitter = <emitter> vol = 50 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.5100 seconds
        @ obj_playstream SK6_SmSpark20 emitter = <emitter> vol = 50 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.3400 seconds
        @ obj_playstream SK6_SmSpark21 emitter = <emitter> vol = 50 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.3600 seconds
    )
    wait 0.1000 seconds
    repeat 
endscript


script BE_SFX_Pigeons_Idle 
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


script BE_SFX_Pigeons_FlyUp 
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


script BE_SFX_Bats_Loop 
    begin 
    if NOT IsStreamPlaying ThisBatLoopStream
        obj_playstream SK6_BE_BatsLoopStream01 priority = StreamPriorityLowMid dropoff = 60 id = ThisBatLoopStream
    endif
    wait 1 second
    repeat 
endscript

