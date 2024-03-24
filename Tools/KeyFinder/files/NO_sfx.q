
BO_MUSIC_KickDrumVolume = 100
BO_MUSIC_SnareDrumVolume = 400
BO_MUSIC_HiHatVolume = 100
BO_MUSIC_ScratchVolume = 100
NO_DixieMusicStatus = 0

script NO_LoadingSounds 
    LoadSound 'NJ\NJ_woodbreak01'
    LoadSound 'NO\SK6_NO_HitObriensSign'
    LoadSound 'NO\SK6_NO_BreakFence01'
    LoadSound 'NO\SK6_NO_GoThroughSmoke'
    LoadSound 'NO\SK6_NO_HitSign'
    LoadSound 'Shared\Animal\RatDeathSquish'
    LoadSound 'Shared\Hits\HitGlassPane2X'
    LoadSound 'Shared\Misc\Ricco2_11'
    LoadSound 'Shared\Hits\HitGlassPane2x'
    LoadSound 'Shared\Auto\LA_Skid_11' vol = 100 dropoff = 150
    LoadSound 'Shared\Auto\CarBrakeSqueal' vol = 100 dropoff = 150
    LoadSound 'Shared\Auto\CarHorn_11' vol = 100 dropoff = 150
    LoadSound 'Shared\Hits\HitMetalCan' vol = 100 dropoff = 150 PosUpdateWithDoppler
    LoadSound 'Shared\Hits\BonkBush' vol = 100 dropoff = 0
    LoadSound 'Shared\Water\FallWater'
    LoadSound 'Shared\Menu\GoToLoadLevel'
    LoadSound 'BO\SK6_BO_RevolutionaryDrum01'
    LoadSound 'BO\MB_HiHat_01'
    LoadSound 'Shared\Auto\CarLoop' vol = 100 dropoff = 150 PosUpdateWithDoppler
    LoadSound 'Vehicles\Silent_Vehicle_Tire_Loop'
    LoadSound 'Terrains\BonkMetal_11'
    LoadSound 'BE\SK6_GlassCrackQuick01'
    LoadSound 'BO\SK6_BO_TrainLoop02' PosUpdateWithDoppler
    LoadSound 'BO\SK6_BO_Air_Vent_02'
    LoadSound 'NO\SK6_NO_CryptRumbleLoop'
    LoadSound 'BO\SK6_BO_RiverLoop01_11'
    LoadSound 'Shared\Hits\BustValve'
    LoadSound 'NO\SK6_NO_HeloLoop'
    LoadSound 'NO\SK6_NO_TrikeSqueak'
    LoadSound 'NO\SK6_NO_TrikeLand'
    LoadSound 'NO\SK6_NO_TrikeJump'
    LoadSound 'NO\SK6_NO_Trike_Grind'
    LoadSound 'NO\SK6_NO_Hit_Zombie'
    LoadSound 'BouncyObjects\Bouncy_TombstoneHit02'
    LoadSound 'BouncyObjects\Bouncy_LemonWedge_Hit01'
    LoadSound 'BouncyObjects\Bouncy_LemonWedge_Hit02'
    LoadSound 'BouncyObjects\Bouncy_PlantSmall01'
    LoadSound 'BouncyObjects\Bouncy_PlantSmall02'
    LoadSound 'BouncyObjects\Bouncy_WoodenTableHit01'
    LoadSound 'BouncyObjects\Bouncy_WoodenTableHit02'
    LoadSound 'BouncyObjects\Bouncy_PlasticChairHit01'
    LoadSound 'BouncyObjects\Bouncy_PlasticChairHit02'
    LoadSound 'BouncyObjects\Bouncy_MetalTableHit01'
    LoadSound 'BouncyObjects\Bouncy_MetalTableHit02'
    LoadSound 'BouncyObjects\Bouncy_UmbrellaHit01'
    LoadSound 'BouncyObjects\Bouncy_UmbrellaHit02'
    LoadSound 'BouncyObjects\Bouncy_BottleNonBreakHit01'
    LoadSound 'BouncyObjects\Bouncy_BottleNonBreakHit02'
    LoadSound 'BouncyObjects\Bouncy_MetalHit01'
    LoadSound 'BouncyObjects\Bouncy_MetalHit02'
    if (debugsoundfx = 1)
        DumpHeaps
    endif
endscript


script NO_SFX_Music_Volume_Box_Cajun 
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
                        Kill name = TRG_SFX_TrigBox_LG_CajunBand01
                        wait 1 gameframe
                        change OutterBoxesExist = 0
                        Kill name = TRG_SFX_TrigBox_LG_CajunBandMusicOff
                    endif
                endif
            endif
        endif
    endif
endscript


script NO_SFX_SMALL_Cajun_Music_Box 
    if NOT InSplitScreenGame
        if SkaterCamAnimFinished
            if NOT IsTrue cutscene_is_playing
                if (inside)
                    wait 1 gameframe
                    if (OutterBoxesExist = 0)
                        change InsideSmallBox = 1
                        Kill name = TRG_SFX_TrigBox_LG_CajunBand01
                        Kill name = TRG_SFX_TrigBox_LG_CajunBandMusicOff
                        Create name = TRG_SFX_TrigBox_LG_CajunBand01
                        Create name = TRG_SFX_TrigBox_LG_CajunBandMusicOff
                        change OutterBoxesExist = 1
                    endif
                else
                    change InsideSmallBox = 0
                endif
            endif
        endif
    endif
endscript


script NO_SFX_Music_Volume_Box_Techno 
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
                        Kill name = TRG_SFX_TrigBox_LG_Techno
                        wait 1 gameframe
                        change OutterBoxesExist = 0
                        Kill name = TRG_SFX_TrigBox_LG_TechnoMusicOff
                    endif
                endif
            endif
        endif
    endif
endscript


script NO_SFX_SMALL_Techno_Music_Box 
    if NOT InSplitScreenGame
        if SkaterCamAnimFinished
            if NOT IsTrue cutscene_is_playing
                if (inside)
                    wait 1 gameframe
                    if (OutterBoxesExist = 0)
                        change InsideSmallBox = 1
                        Kill name = TRG_SFX_TrigBox_LG_Techno
                        Kill name = TRG_SFX_TrigBox_LG_TechnoMusicOff
                        Create name = TRG_SFX_TrigBox_LG_Techno
                        Create name = TRG_SFX_TrigBox_LG_TechnoMusicOff
                        change OutterBoxesExist = 1
                    endif
                else
                    change InsideSmallBox = 0
                endif
            endif
        endif
    endif
endscript


script NO_SFX_Music_Volume_Box_Dixie 
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
                        Kill name = TRG_SFX_TrigBox_DixieBand01
                        wait 1 gameframe
                        change OutterBoxesExist = 0
                        Kill name = TRG_SFX_TrigBox_DixieBandMusicOff
                    endif
                endif
            endif
        endif
    endif
endscript


script NO_SFX_SMALL_Dixie_Music_Box 
    if NOT InSplitScreenGame
        if SkaterCamAnimFinished
            if NOT IsTrue cutscene_is_playing
                if (inside)
                    wait 1 gameframe
                    if (OutterBoxesExist = 0)
                        change InsideSmallBox = 1
                        Kill name = TRG_SFX_TrigBox_DixieBand01
                        Kill name = TRG_SFX_TrigBox_DixieBandMusicOff
                        Create name = TRG_SFX_TrigBox_DixieBand01
                        Create name = TRG_SFX_TrigBox_DixieBandMusicOff
                        change OutterBoxesExist = 1
                    endif
                else
                    change InsideSmallBox = 0
                endif
            endif
        endif
    endif
endscript


script NO_SFX_Techno_Music 
    if NOT InSplitScreenGame
        if NOT IsStreamPlaying Techno_Music
            RandomNoRepeat (
                @ obj_playstream Techno_02 vol = 250 emitter = TRG_SFX_SOB_Techno01 dropoff_function = inv_exponential id = Techno_Music num_loops = -1 priority = 101
                @ obj_playstream Techno_03 vol = 250 emitter = TRG_SFX_SOB_Techno01 dropoff_function = inv_exponential id = Techno_Music num_loops = -1 priority = 101
                @ obj_playstream Techno_04 vol = 250 emitter = TRG_SFX_SOB_Techno01 dropoff_function = inv_exponential id = Techno_Music num_loops = -1 priority = 101
                @ obj_playstream Techno_05 vol = 250 emitter = TRG_SFX_SOB_Techno01 dropoff_function = inv_exponential id = Techno_Music num_loops = -1 priority = 101
            )
            obj_addstream Techno_Music Add = Techno_01 vol = 250
            wait 1 gameframe
            obj_removestream Techno_Music remove = Techno_02
            obj_removestream Techno_Music remove = Techno_03
            obj_removestream Techno_Music remove = Techno_04
            obj_removestream Techno_Music remove = Techno_05
        endif
    endif
endscript


script NO_SFX_DixieBand 
    if NOT InSplitScreenGame
        if NOT IsStreamPlaying Dixie_Music
            RandomNoRepeat (
                @ obj_playstream Dixie_02 vol = 150 emitter = TRG_SFX_SOB_DixieBand01 dropoff_function = inv_exponential id = Dixie_Music num_loops = -1 priority = 101
                @ obj_playstream Dixie_03 vol = 150 emitter = TRG_SFX_SOB_DixieBand01 dropoff_function = inv_exponential id = Dixie_Music num_loops = -1 priority = 101
                @ obj_playstream Dixie_04 vol = 150 emitter = TRG_SFX_SOB_DixieBand01 dropoff_function = inv_exponential id = Dixie_Music num_loops = -1 priority = 101
                @ obj_playstream Dixie_05 vol = 150 emitter = TRG_SFX_SOB_DixieBand01 dropoff_function = inv_exponential id = Dixie_Music num_loops = -1 priority = 101
            )
            obj_addstream Dixie_Music Add = Dixie_01 vol = 150
            wait 1 gameframe
            obj_removestream Dixie_Music remove = Dixie_02
            obj_removestream Dixie_Music remove = Dixie_03
            obj_removestream Dixie_Music remove = Dixie_04
            obj_removestream Dixie_Music remove = Dixie_05
        endif
    endif
endscript


script NO_SFX_CajunBand 
    if NOT InSplitScreenGame
        if NOT IsStreamPlaying Cajun_Music
            RandomNoRepeat (
                @ obj_playstream Cajun_02 vol = 150 emitter = TRG_SFX_SOB_CajunBand01 dropoff_function = inv_exponential id = Cajun_Music num_loops = -1 priority = 101
                @ obj_playstream Cajun_03 vol = 150 emitter = TRG_SFX_SOB_CajunBand01 dropoff_function = inv_exponential id = Cajun_Music num_loops = -1 priority = 101
                @ obj_playstream Cajun_04 vol = 150 emitter = TRG_SFX_SOB_CajunBand01 dropoff_function = inv_exponential id = Cajun_Music num_loops = -1 priority = 101
                @ obj_playstream Cajun_05 vol = 150 emitter = TRG_SFX_SOB_CajunBand01 dropoff_function = inv_exponential id = Cajun_Music num_loops = -1 priority = 101
            )
            obj_addstream Cajun_Music Add = Cajun_01 vol = 150
            wait 1 gameframe
            obj_removestream Cajun_Music remove = Cajun_02
            obj_removestream Cajun_Music remove = Cajun_03
            obj_removestream Cajun_Music remove = Cajun_04
            obj_removestream Cajun_Music remove = Cajun_05
        endif
    endif
endscript


script NO_SFX_Hit_AC_Unit 
    if NOT (IsStreamPlaying SK6_GlassCracking01)
        PlayStream SK6_GlassCracking01 vol = 120
    endif
    wait 0.02000 seconds
    playsound SK6_GlassCrackQuick01 vol = 200
    PauseMusic 1
    PauseStream 1
endscript


script NO_SFX_Breakout_Ice 
    playsound HitGlassPane2x pitch = 200
    SpawnSound SK6_SFX_Roll_Booster_Sound
    PauseMusic 0
    PauseStream 0
    wait 1 second
    StopStream SK6_GlassCracking01
    KillSpawnedScript name = SK6_SFX_BulletTime_Heart
endscript


script NO_SFX_AirBlow01 
    obj_playsound SK6_BO_Air_Vent_02 emitter = TRG_SFX_SOB_AirBlow01
endscript


script NO_SFX_AirBlow02 
    obj_playsound SK6_BO_Air_Vent_02 emitter = TRG_SFX_SOB_AirBlow02
endscript


script NO_SFX_Manual_Over_Manhole 
    playsound GrindMetalOn02 vol = randomrange (72.0, 80.0) pitch = randomrange (55.0, 60.0)
    wait 0.1000 seconds
    playsound GrindMetalOn02 vol = randomrange (80.0, 90.0) pitch = randomrange (65.0, 80.0)
endscript


script NO_SFX_Crypt01_First_Rumble 
endscript


script NO_SFX_Crypt01_Constant_Rumble 
    if GetFlag flag = FLAG_CRYPT_1
        obj_playsound SK6_NO_CryptRumbleLoop pitch = 40 emitter = TRG_SFX_SOB_CryptRumble01 dropoff_function = exponential
        begin 
        if NOT IsStreamPlaying ACryptStream
            RandomNoRepeat (
                @ TRG_SFX_Ghost_Crypt01 ::obj_playstream SK6_NO_CryptYell01 id = ACryptStream vol = 200 dropoff = 100
                @ TRG_SFX_Ghost_Crypt01 ::obj_playstream SK6_NO_CryptYell02 id = ACryptStream vol = 200 dropoff = 100
                @ TRG_SFX_Ghost_Crypt01 ::obj_playstream SK6_NO_CryptYell03 id = ACryptStream vol = 200 dropoff = 100
            )
        endif
        wait 1 second
        repeat 
    endif
endscript


script NO_SFX_Crypt02_First_Rumble 
endscript


script NO_SFX_Crypt02_Constant_Rumble 
    if GetFlag flag = FLAG_CRYPT_2
        obj_playsound SK6_NO_CryptRumbleLoop pitch = 40 emitter = TRG_SFX_SOB_CryptRumble02 dropoff_function = exponential
        begin 
        if NOT IsStreamPlaying ACryptStream
            RandomNoRepeat (
                @ TRG_SFX_Ghost_Crypt02 ::obj_playstream SK6_NO_CryptYell01 id = ACryptStream vol = 200 dropoff = 100
                @ TRG_SFX_Ghost_Crypt02 ::obj_playstream SK6_NO_CryptYell02 id = ACryptStream vol = 200 dropoff = 100
                @ TRG_SFX_Ghost_Crypt02 ::obj_playstream SK6_NO_CryptYell03 id = ACryptStream vol = 200 dropoff = 100
            )
        endif
        wait 1 second
        repeat 
    endif
endscript


script NO_SFX_Crypt03_First_Rumble 
endscript


script NO_SFX_Crypt03_Constant_Rumble 
    if GetFlag flag = FLAG_CRYPT_3
        obj_playsound SK6_NO_CryptRumbleLoop pitch = 40 emitter = TRG_SFX_SOB_CryptRumble03 dropoff_function = exponential
        begin 
        if NOT IsStreamPlaying ACryptStream
            RandomNoRepeat (
                @ TRG_SFX_Ghost_Crypt03 ::obj_playstream SK6_NO_CryptYell01 id = ACryptStream vol = 200 dropoff = 100
                @ TRG_SFX_Ghost_Crypt03 ::obj_playstream SK6_NO_CryptYell02 id = ACryptStream vol = 200 dropoff = 100
                @ TRG_SFX_Ghost_Crypt03 ::obj_playstream SK6_NO_CryptYell03 id = ACryptStream vol = 200 dropoff = 100
            )
        endif
        wait 1 second
        repeat 
    endif
endscript


script NO_SFX_Crypt04_First_Rumble 
endscript


script NO_SFX_Crypt04_Constant_Rumble 
    if GetFlag flag = FLAG_CRYPT_4
        obj_playsound SK6_NO_CryptRumbleLoop pitch = 40 emitter = TRG_SFX_SOB_CryptRumble04 dropoff_function = exponential
        begin 
        if NOT IsStreamPlaying ACryptStream
            RandomNoRepeat (
                @ TRG_SFX_Ghost_Crypt04 ::obj_playstream SK6_NO_CryptYell01 id = ACryptStream vol = 200 dropoff = 100
                @ TRG_SFX_Ghost_Crypt04 ::obj_playstream SK6_NO_CryptYell02 id = ACryptStream vol = 200 dropoff = 100
                @ TRG_SFX_Ghost_Crypt04 ::obj_playstream SK6_NO_CryptYell03 id = ACryptStream vol = 200 dropoff = 100
            )
        endif
        wait 1 second
        repeat 
    endif
endscript


script NO_SFX_Crypt05_First_Rumble 
endscript


script NO_SFX_Crypt05_Constant_Rumble 
    if GetFlag flag = FLAG_CRYPT_5
        obj_playsound SK6_NO_CryptRumbleLoop pitch = 40 emitter = TRG_SFX_SOB_CryptRumble05
        begin 
        if NOT IsStreamPlaying ACryptStream
            RandomNoRepeat (
                @ TRG_SFX_Ghost_Crypt05 ::obj_playstream SK6_NO_CryptYell01 id = ACryptStream vol = 200 dropoff = 100
                @ TRG_SFX_Ghost_Crypt05 ::obj_playstream SK6_NO_CryptYell02 id = ACryptStream vol = 200 dropoff = 100
                @ TRG_SFX_Ghost_Crypt05 ::obj_playstream SK6_NO_CryptYell03 id = ACryptStream vol = 200 dropoff = 100
            )
        endif
        wait 1 second
        repeat 
    endif
endscript


script NO_SFX_Day_Swamp 
    if SkaterCamAnimFinished
        begin 
        if NOT IsStreamPlaying SwampDayLoopStream
            obj_playstream SK6_NO_SwampDaytimeLoop vol = 50 emitter = TRG_SFX_SOB_Swamp01 priority = StreamPriorityHigh id = SwampDayLoopStream num_loops = -1
        endif
        wait 1 second
        repeat 
    endif
endscript


script NO_SFX_Night_Swamp 
    if SkaterCamAnimFinished
        begin 
        if NOT IsStreamPlaying SwampNightLoopStream
            obj_playstream SK6_NO_SwampNightTimeLoop vol = 50 emitter = TRG_SFX_SOB_Swamp01 priority = StreamPriorityHigh id = SwampNightLoopStream num_loops = -1
        endif
        wait 1 second
        repeat 
    endif
endscript


script NO_SFX_RiverBG01 
    obj_playsound SK6_BO_RiverLoop01_11 vol = 80 emitter = TRG_SFX_SOB_RiverBG01
endscript


script NO_SFX_RiverBG02 
endscript


script NO_SFX_Water_Tower01 
    obj_playsound SK6_BO_RiverLoop01_11 pitch = 200 emitter = TRG_SFX_SOB_WaterTower01 dropoff_function = linear
endscript


script NO_SFX_GiantFanBlow01 
    obj_playsound SK6_BO_Air_Vent_02 pitch = 130 vol = 200 emitter = TRG_SFX_SOB_GiantFan01 dropoff_function = linear
endscript


script NO_SFX_Train_Electrics 
    TRG_SFX_Ghost_TrainSparks01 ::obj_playsound SK6_BO_TrainLoop02 vol = 80 pitch = 100 dropoff = 160 dropoff_function = exponential
    begin 
    RandomNoRepeat (
        @ TRG_SFX_Ghost_TrainSparks01 ::obj_playstream SK6_SmSpark01 vol = 40 pitch = 100 id = TrainSpark dropoff = 160 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.7000 seconds
        @ TRG_SFX_Ghost_TrainSparks01 ::obj_playstream SK6_SmSpark02 vol = 40 pitch = 100 id = TrainSpark dropoff = 160 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.6500 seconds
        @ TRG_SFX_Ghost_TrainSparks01 ::obj_playstream SK6_SmSpark03 vol = 40 pitch = 100 id = TrainSpark dropoff = 160 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.4800 seconds
        @ TRG_SFX_Ghost_TrainSparks01 ::obj_playstream SK6_SmSpark04 vol = 40 pitch = 100 id = TrainSpark dropoff = 160 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.4200 seconds
        @ TRG_SFX_Ghost_TrainSparks01 ::obj_playstream SK6_SmSpark05 vol = 40 pitch = 100 id = TrainSpark dropoff = 160 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.8600 seconds
        @ TRG_SFX_Ghost_TrainSparks01 ::obj_playstream SK6_SmSpark06 vol = 40 pitch = 100 id = TrainSpark dropoff = 160 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.09000 seconds
        @ TRG_SFX_Ghost_TrainSparks01 ::obj_playstream SK6_SmSpark07 vol = 40 pitch = 100 id = TrainSpark dropoff = 160 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.4400 seconds
        @ TRG_SFX_Ghost_TrainSparks01 ::obj_playstream SK6_SmSpark08 vol = 40 pitch = 100 id = TrainSpark dropoff = 160 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.9900 seconds
        @ TRG_SFX_Ghost_TrainSparks01 ::obj_playstream SK6_SmSpark09 vol = 40 pitch = 100 id = TrainSpark dropoff = 160 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.4300 seconds
        @ TRG_SFX_Ghost_TrainSparks01 ::obj_playstream SK6_SmSpark10 vol = 40 pitch = 100 id = TrainSpark dropoff = 160 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.6600 seconds
        @ TRG_SFX_Ghost_TrainSparks01 ::obj_playstream SK6_SmSpark11 vol = 40 pitch = 100 id = TrainSpark dropoff = 160 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.4600 seconds
        @ TRG_SFX_Ghost_TrainSparks01 ::obj_playstream SK6_SmSpark12 vol = 40 pitch = 100 id = TrainSpark dropoff = 160 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.5900 seconds
        @ TRG_SFX_Ghost_TrainSparks01 ::obj_playstream SK6_SmSpark13 vol = 40 pitch = 100 id = TrainSpark dropoff = 160 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.5300 seconds
        @ TRG_SFX_Ghost_TrainSparks01 ::obj_playstream SK6_SmSpark14 vol = 40 pitch = 100 id = TrainSpark dropoff = 160 dropoff_function = exponential priority = StreamPriorityLow
        wait 1.0 seconds
        @ TRG_SFX_Ghost_TrainSparks01 ::obj_playstream SK6_SmSpark15 vol = 40 pitch = 100 id = TrainSpark dropoff = 160 dropoff_function = exponential priority = StreamPriorityLow
        wait 1.080 seconds
        @ TRG_SFX_Ghost_TrainSparks01 ::obj_playstream SK6_SmSpark16 vol = 40 pitch = 100 id = TrainSpark dropoff = 160 dropoff_function = exponential priority = StreamPriorityLow
        wait 1.540 seconds
        @ TRG_SFX_Ghost_TrainSparks01 ::obj_playstream SK6_SmSpark17 vol = 40 pitch = 100 id = TrainSpark dropoff = 160 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.6800 seconds
        @ TRG_SFX_Ghost_TrainSparks01 ::obj_playstream SK6_SmSpark18 vol = 40 pitch = 100 id = TrainSpark dropoff = 160 dropoff_function = exponential priority = StreamPriorityLow
        wait 1.220 seconds
        @ TRG_SFX_Ghost_TrainSparks01 ::obj_playstream SK6_SmSpark19 vol = 40 pitch = 100 id = TrainSpark dropoff = 160 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.5100 seconds
        @ TRG_SFX_Ghost_TrainSparks01 ::obj_playstream SK6_SmSpark20 vol = 40 pitch = 100 id = TrainSpark dropoff = 160 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.3400 seconds
        @ TRG_SFX_Ghost_TrainSparks01 ::obj_playstream SK6_SmSpark21 vol = 40 pitch = 100 id = TrainSpark dropoff = 160 dropoff_function = exponential priority = StreamPriorityLow
        wait 0.3600 seconds
    )
    wait 0.1000 seconds
    repeat 
endscript


script NO_SFX_MardiGrasNeon 
endscript


script NO_SFX_Street_Reverb_01 
    if NOT GameIsPaused
        if NOT InSplitScreenGame
            if (inside)
                change InsideAdjacentReverbBox01 = 1
                GetValueFromVolume cdvol
                if (InsideAdjacentReverbBox02 = 0)
                    if (<value> = 0)
                        SetSfxReverb 30 mode = REV_MODE_ROOM
                    else
                        SetSfxReverb 30 mode = REV_MODE_ROOM
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


script NO_SFX_Street_Reverb_02 
    if NOT GameIsPaused
        if NOT InSplitScreenGame
            if (inside)
                change InsideAdjacentReverbBox02 = 1
                GetValueFromVolume cdvol
                if (InsideAdjacentReverbBox01 = 0)
                    if (<value> = 0)
                        SetSfxReverb 30 mode = REV_MODE_ROOM
                    else
                        SetSfxReverb 30 mode = REV_MODE_ROOM
                    endif
                endif
            else
                if (InsideAdjacentReverbBox01 = 0)
                    SetSfxReverb 0 mode = REV_MODE_ROOM
                else
                endif
                change InsideAdjacentReverbBox02 = 0
            endif
        endif
    endif
endscript


script NO_SFX_Car_Lift_Reverb01 
    if NOT GameIsPaused
        if NOT InSplitScreenGame
            if (inside)
                change InsideAdjacentReverbBox01 = 1
                GetValueFromVolume cdvol
                if (InsideAdjacentReverbBox02 = 0)
                    if (<value> = 0)
                        SetSfxReverb 100 mode = REV_MODE_ROOM
                    else
                        SetSfxReverb 100 mode = REV_MODE_ROOM
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


script NO_SFX_Dixie_Start 
    obj_playstream SK6_BO_ChangeDrop vol = 250
    RandomNoRepeat (
        @ obj_playstream DixieBandLeader_Start01 vol = 200 dropoff = 150 priority = StreamPriorityHigh
        @ obj_playstream DixieBandLeader_Start02 vol = 200 dropoff = 150 priority = StreamPriorityHigh
        @ obj_playstream DixieBandLeader_Start03 vol = 200 dropoff = 150 priority = StreamPriorityHigh
        @ obj_playstream DixieBandLeader_Start04 vol = 200 dropoff = 150 priority = StreamPriorityHigh
        @ obj_playstream DixieBandLeader_Start05 vol = 200 dropoff = 150 priority = StreamPriorityHigh
        @ obj_playstream DixieBandLeader_Start06 vol = 200 dropoff = 150 priority = StreamPriorityHigh
        @ obj_playstream DixieBandLeader_Start07 vol = 200 dropoff = 150 priority = StreamPriorityHigh
    )
endscript


script NO_SFX_Dixie_Start02 
    change NO_DixieMusicStatus = 1
    Kill name = TRG_SFX_TrigBox_DixieBand01
    Kill name = TRG_SFX_TrigBox_DixieBandMusicOff
    Kill name = TRG_SFX_TrigBox_SmallDixie
    Create name = TRG_SFX_TrigBox_SmallDixie
endscript


script NO_SFX_Dixie_Stop 
    RandomNoRepeat (
        @ obj_playstream DixieBandLeader_Stop01 vol = 200 dropoff = 150 priority = StreamPriorityHigh
        @ obj_playstream DixieBandLeader_Stop02 vol = 200 dropoff = 150 priority = StreamPriorityHigh
        @ obj_playstream DixieBandLeader_Stop03 vol = 200 dropoff = 150 priority = StreamPriorityHigh
        @ obj_playstream DixieBandLeader_Stop04 vol = 200 dropoff = 150 priority = StreamPriorityHigh
        @ obj_playstream DixieBandLeader_Stop05 vol = 200 dropoff = 150 priority = StreamPriorityHigh
        @ obj_playstream DixieBandLeader_Stop06 vol = 200 dropoff = 150 priority = StreamPriorityHigh
        @ obj_playstream DixieBandLeader_Stop07 vol = 200 dropoff = 150 priority = StreamPriorityHigh
    )
endscript


script NO_SFX_Dixie_Stop02 
    change NO_DixieMusicStatus = 0
    Kill name = TRG_SFX_TrigBox_DixieBand01
    Kill name = TRG_SFX_TrigBox_DixieBandMusicOff
    Kill name = TRG_SFX_TrigBox_SmallDixie
endscript


script NO_SFX_HitObriensSign 
    playsound SK6_NO_HitObriensSign pitch = randomrange (100.0, 130.0)
endscript


script NO_SFX_Go_Through_Smoke 
    wait 0.3000 seconds
    playsound SK6_NO_GoThroughSmoke vol = 250
endscript


script NO_SFX_PaddleWheel01 
    TRG_SFX_Ghost_PaddleWheel ::obj_playstream SK6_NO_PaddleWheelAndHorn vol = 200 dropoff = 300
endscript


script NO_SFX_PaddleWheel02 
    TRG_SFX_Ghost_PaddleWheel ::obj_playstream SK6_NO_PaddleWheelAndHorn vol = 200 dropoff = 300
endscript


script NO_SFX_PaddleWheel03 
    TRG_SFX_Ghost_PaddleWheel ::obj_playstream SK6_NO_PaddleWheelAndHorn vol = 200 dropoff = 300
endscript


script NO_SFX_NeonSignBreak 
    playsound SK6_NO_HitSign vol = 200
    playsound HitGlassPane2x vol = 60 pitch = 150
    PlayStream SK6_NO_BreakNeonSign vol = 150
endscript


script NO_SFX_FliesOnSkater 
    if NOT IsStreamPlaying ThisSkaterFliesSFX
        PlayStream SK6_NO_Flies_On_Skater vol = 50 id = ThisSkaterFliesSFX
    endif
endscript


script NO_SFX_HydrantPop1 
    TRG_SFX_Ghost_Hydrant01 ::obj_playsound BustValve
    TRG_SFX_Ghost_Hydrant01 ::obj_playsound SK6_BO_RiverLoop01_11 vol = 80 pitch = 200 dropoff = 110 dropoff_function = exponential
endscript


script NO_SFX_HydrantPop2 
    TRG_SFX_Ghost_Hydrant02 ::obj_playsound BustValve
    TRG_SFX_Ghost_Hydrant02 ::obj_playsound SK6_BO_RiverLoop01_11 vol = 80 pitch = 200 dropoff = 110 dropoff_function = exponential
endscript


script NO_SFX_Giant_Tornado 
    begin 
    if NOT IsStreamPlaying GiantTornadoStream
        obj_playstream SK6_NO_GiantTornado vol = 400 emitter = TRG_SFX_SOB_GiantTornado dropoff_function = inv_exponential priority = StreamPriorityHigh id = GiantTornadoStream num_loops = -1
    endif
    wait 1 second
    repeat 
endscript


script NO_SFX_StreetChatter 
    if NOT IsStreamPlaying GiantTornadoStream
        if NOT IsStreamPlaying StreetCrowdSFX
            obj_playstream SK6_NO_CrowdInStreet priority = StreamPriorityHigh id = StreetCrowdSFX num_loops = -1 emitter = TRG_SFX_SOB_StreetChatter
        endif
    endif
endscript


script NO_SFX_Night_Crix01 
    if InSplitScreenGame
        if NOT IsStreamPlaying SK6_CrixLoop_01
            obj_playstream SK6_CrixLoop_01 vol = 30 num_loops = -1 priority = StreamPriorityHigh
        endif
    else
        obj_playstream SK6_CrixLoop_01 vol = 30 num_loops = -1 priority = StreamPriorityHigh
    endif
endscript


script NO_SFX_Night_Crix02 
    if InSplitScreenGame
        if NOT IsStreamPlaying SK6_CrixLoop_01
            obj_playstream SK6_CrixLoop_01 vol = 30 num_loops = -1 priority = StreamPriorityHigh
        endif
    else
        obj_playstream SK6_CrixLoop_01 vol = 30 num_loops = -1 priority = StreamPriorityHigh
    endif
endscript


script NO_SFX_Night_Crix03 
    if InSplitScreenGame
        if NOT IsStreamPlaying SK6_CrixLoop_01
            obj_playstream SK6_CrixLoop_01 vol = 30 num_loops = -1 priority = StreamPriorityHigh
        endif
    else
        obj_playstream SK6_CrixLoop_01 vol = 30 num_loops = -1 priority = StreamPriorityHigh
    endif
endscript


script NO_SFX_BreakObrienFence 
    StopStream SK6_BreakMetalFence
    playsound SK6_NO_BreakFence01
    playsound HitGlassPane2x pitch = 50
    PlayStream SK6_BreakMetalFence vol = 200 priority = StreamPriorityHigh
endscript


script NO_SFX_ObrienFountain 
    obj_playsound SK6_BO_RiverLoop01_11 emitter = TRG_SFX_SOB_ObrienDrink vol = 60 pitch = 170
endscript


script NO_SFX_Dungeon 
endscript

