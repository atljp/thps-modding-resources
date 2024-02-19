MusicVolume = 30
MusicStreamVolume = 100
ambienttracknum = 0
forceambientsfxtomusicvolume = 0
MusicChangedAtStartup = 0
MusicStartupVolume = 30.0
MusicVolOutsideBox = 30.0
FadeMusicInRunning = 0
FadeMusicOutRunning = 0
FadeTempMusicVol = 30.0
DontAdjustMusicViaProximNode = 0
InsideAdjacentReverbBox01 = 0
InsideAdjacentReverbBox02 = 0
InsideAdjacentReverbBox03 = 0
SloMoMusicPaused = 0
InsideMusicAdjustmentBox = 0
InsideSmallBox = 0
OutterBoxesExist = 0
StaticMusicBoxesOn = 1
StaticMusicBoxState = Off
SFX_FootStepWalk01 = WalkStepConc01_11
SFX_FootStepWalk02 = WalkStepConc03_11
SFX_FootStepWalk03 = WalkStepConc05_11
SFX_FootStepRun01 = RunStepConc01_11
SFX_FootStepRun02 = RunStepConc02_11
SFX_FootStepRun03 = RunStepConc03_11
SFX_FootStepRun04 = RunStepConc03_11
SFX_FootStepRun05 = RunStepConc03_11
GlobalGoalVOVol = 200
GlobalHintVOVol = 200
GlobalHintVODropoff = 150
GlobalIntroVOVol = 160
GlobalFarVOVol = 150
GlobalFarVODropoff = 150
GlobalFarWaitTime = 8
GlobalShotVOVol = 200
GlobalShotVODropoff = 150
GlobalWhackedVOVol = 200
GlobalWhackedVODropoff = 150
GlobalAvoidVOVol = 200
GlobalAvoidVODropoff = 150
GlobalTrickBailVOVol = 250
GlobalTrickBailVODropoff = 150
GlobalTrickPositiveVOVol = 200
GlobalTrickPositiveVODropoff = 150
CheckForPedStreamExistence = 0
Thug_SFX_DT_Underground = 0

script SetThisLevelSoundBanks 
endscript

script LoadSfxBank 
    GetArraySize <bank>
    index = 0
    if (<array_size> > 0)
        begin 
        el = (<bank> [ <index> ])
        LoadSound <el> FLAG_PERM
        index = (<index> + 1)
        repeat <array_size>
    endif
endscript

script LoadPermSFX 
    if (debugsoundfx = 1)
        DumpHeaps
    endif
endscript
StreamPriorityLow = 10
StreamPriorityLowMid = 30
StreamPriorityMid = 50
StreamPriorityMidHigh = 70
StreamPriorityHigh = 90
StreamPriorityHighest = 95
streamprioritysystem = 100

script stat_goal_appear 
    playsound \{ SK6_BulletZoomOut pitch = 400 }
    wait \{ 0.3000 seconds }
    playsound \{ ExtraTrick pitch = 200 }
endscript

script stat_goal_success 
    playsound \{ GotStat04 vol = 150 }
endscript

script found_gap_success_sound 
    playsound \{ DE_PauseFlyIn pitch = 400 }
    wait \{ 1.800 seconds }
    found_gap_away_sound
endscript

script found_gap_away_sound 
    playsound \{ DE_PauseFlyIn pitch = 180 vol = 80 }
endscript

script LandPointsSound 
    playsound \{ LandCombo01 vol = 250 }
endscript
Paused_Light_Rain = 0
Paused_Heavy_Rain = 0
Inside_Light_Rain = 0
Inside_Heavy_Rain = 0
LightRainVolume = 100
MediumRainVolume = 66

script Light_Rain_SFX_On 
    if NOT issoundplaying \{ TestLight01 }
        if NOT issoundplaying \{ TestLight02 }
            printf \{ '*********TURNING LIGHT RAIN SFX ON - DO NOT TURN ON AGAIN BEFORE STOPPING!********' }
            change \{ Inside_Light_Rain = 0 }
        endif
    endif
endscript

script Heavy_Rain_SFX_On 
    printf '*********TURNING LIGHT and MEDIUM RAIN SFX ON - DO NOT TURN ON AGAIN BEFORE STOPPING!********'
    if NOT issoundplaying TestLight02
        if NOT issoundplaying TestLight01
            printf '*********TURNING LIGHT RAIN SFX ON - DO NOT TURN ON AGAIN BEFORE STOPPING!********'
            change Inside_Heavy_Rain = 0
        endif
    endif
    if NOT issoundplaying TestMedium02
        printf '*********TURNING MEDIUM RAIN SFX ON - DO NOT TURN ON AGAIN BEFORE STOPPING!********'
    endif
endscript

script wait_and_start_rain 
    switch <type>
        case 1
        begin 
        wait 1
        if NOT issoundplaying TestLight01
            break 
        endif
        repeat 
        Light_Rain_SFX_On
        change Paused_Light_Rain = 0
        case 2
        begin 
        wait 1
        if NOT issoundplaying TestLight02
            break 
        endif
        repeat 
        begin 
        wait 1
        if NOT issoundplaying TestMedium02
            break 
        endif
        repeat 
        Heavy_Rain_SFX_On
        change Paused_Heavy_Rain = 0
    endswitch
    printf <type>
    KillSpawnedScript type = wait_and_start_rain
endscript

script Ped_Skater_Grind_Bail_Sound 
    Temp_Ped_Fall_Sound
    wait 0.5000 seconds
    RandomNoRepeat (
        @ obj_playsound BailBoard01 pitch = randomrange (100.0, 102.0) vol = randomrange (40.0, 50.0)
        @ obj_playsound BailBoard02 pitch = randomrange (100.0, 102.0) vol = randomrange (40.0, 50.0)
        @ obj_playsound BailBoard03 pitch = randomrange (100.0, 102.0) vol = randomrange (40.0, 50.0)
        @ obj_playsound BailBoard04 pitch = randomrange (100.0, 102.0) vol = randomrange (40.0, 50.0)
        @ obj_playsound BailBoard05 pitch = randomrange (100.0, 102.0) vol = randomrange (40.0, 50.0)
    )
    RandomNoRepeat (
        @ obj_playsound BailBodyFall01 pitch = randomrange (95.0, 105.0) vol = randomrange (60.0, 80.0)
        @ obj_playsound BailBodyFall02 pitch = randomrange (95.0, 105.0) vol = randomrange (60.0, 80.0)
        @ obj_playsound BailBodyFall03 pitch = randomrange (95.0, 105.0) vol = randomrange (60.0, 80.0)
        @ obj_playsound BailBodyFall04 pitch = randomrange (95.0, 105.0) vol = randomrange (60.0, 80.0)
        @ obj_playsound BailBodyFall05 pitch = randomrange (95.0, 105.0) vol = randomrange (60.0, 80.0)
    )
endscript

script projectile_hit_ped_sounds 
    SpawnSound \{ HandleBailBodyPunchSoundEffect }
    SpawnSound \{ HandleBailSlapSoundEffect }
endscript

script Temp_Ped_Fall_Sound 
    RandomNoRepeat (
        @ obj_playsound BailBodyPunch01_11 pitch = randomrange (80.0, 102.0) vol = randomrange (100.0, 120.0)
        @ obj_playsound BailBodyPunch02_11 pitch = randomrange (80.0, 102.0) vol = randomrange (100.0, 120.0)
        @ obj_playsound BailBodyPunch03_11 pitch = randomrange (80.0, 102.0) vol = randomrange (100.0, 120.0)
        @ obj_playsound BailBodyPunch04_11 pitch = randomrange (80.0, 102.0) vol = randomrange (100.0, 120.0)
        @ obj_playsound BailBodyPunch05_11 pitch = randomrange (80.0, 102.0) vol = randomrange (100.0, 120.0)
    )
    RandomNoRepeat (
        @ obj_playsound BailSlap01 pitch = randomrange (95.0, 115.0) vol = randomrange (100.0, 120.0)
        @ obj_playsound BailSlap02 pitch = randomrange (95.0, 115.0) vol = randomrange (100.0, 120.0)
        @ obj_playsound BailSlap03 pitch = randomrange (95.0, 115.0) vol = randomrange (100.0, 120.0)
    )
endscript

script Goal_Success_Message_Sound 
    playsound \{ GoalGood02 vol = 100 }
    PlayStream \{ GoalSuccessStream vol = 100 priority = StreamPriorityHighest }
endscript

script SK6_SFX_BulletTime_In 
    change \{ SloMoMusicPaused = 1 }
    PauseMusic \{ 1 }
    StopSound \{ SK6_BulletZoomIn }
    StopSound \{ SK6_BulletZoomOut }
    if NOT issoundplaying \{ SK6_BulletZoomIn }
        playsound \{ SK6_BulletZoomIn vol = 130 }
    endif
    if NOT issoundplaying \{ SK6_Wind_Test_11 }
        playsound \{ SK6_Wind_Test_11 }
    endif
    wait \{ 0.1500 seconds }
    SpawnScriptLater \{ SK6_SFX_BulletTime_Heart }
endscript

script SK6_SFX_BulletTime_Heart 
    HeartWaitTime = 0.3500
    HeartPitch = 105
    HeartVol = 150
    begin 
    playsound SK6_BulletHeart_11 pitch = <HeartPitch> vol = <HeartVol>
    wait <HeartWaitTime> seconds
    repeat 
endscript

script SK6_SFX_BulletTime_Out 
    StopSound \{ SK6_BulletZoomOut }
    StopSound \{ SK6_BulletZoomIn }
    if NOT issoundplaying \{ SK6_BulletZoomOut }
        playsound \{ SK6_BulletZoomOut vol = 180 }
    endif
    StopSound \{ SK6_BulletHeart_11 }
    StopSound \{ SK6_Wind_Test_11 }
    KillSpawnedScript \{ name = SK6_SFX_BulletTime_Heart }
    wait \{ 0.3300 seconds }
    change \{ SloMoMusicPaused = 0 }
    SFX_Music_Volume_Box_Restore_State
endscript

script THUG2_SFX_Tag_Spray_Wallplant 
    playsound \{ SK6_Walk_Spray_Tag_01 }
endscript

script Hit_Wall_With_Board_SFX 
    obj_playsound \{ BoardBounce01 vol = 120 }
    obj_playsound \{ SK6_BoardSplit01 vol = 40 pitch = 220 }
endscript

script SK6_SFX_Jump_Booster_Sound 
    if (LevelIs load_bo)
    else
        if NOT (IsStreamPlaying ThisBoostSound)
            PlayStream \{ Sk6_JumpFar_01 priority = StreamPriorityHighest id = ThisBoostSound vol = 50 }
        endif
        wait \{ 0.5000 seconds }
    endif
endscript

script SK6_SFX_Roll_Booster_Sound \{ DefBoostSound = 1 DefSkaterVO = 0 }
    if (<DefBoostSound> = 1)
        if NOT (IsStreamPlaying ThisBoostSound)
            PlayStream \{ Sk6_JumpFar_01 priority = StreamPriorityHigh id = ThisBoostSound vol = 100 }
        endif
    endif
endscript

script StartupMusicVol \{ MusicVol = 50 }
    change \{ MusicChangedAtStartup = 1 }
    change MusicStartupVolume = <MusicVol>
endscript

script SFX_SetOutsideVolAtTopOfLevel 
    if (MusicChangedAtStartup = 1)
        SetMusicVolume \{ MusicStartupVolume }
        change \{ MusicVolOutsideBox = MusicStartupVolume }
        change FadeTempMusicVol = (MusicVolOutsideBox)
        change \{ MusicChangedAtStartup = 0 }
    else
        GetValueFromVolume \{ cdvol }
        change MusicVolOutsideBox = (<value> * 10)
        change FadeTempMusicVol = (MusicVolOutsideBox)
    endif
endscript

script SFX_refresh_music_box_triggers 
    Kill \{ prefix = TRG_SFX_TrigBox_LG noprefixwarning }
    Kill \{ prefix = TRG_SFX_TrigBox_MS noprefixwarning }
    if GetGlobalFlag \{ flag = SOUNDS_MUSICBOXES_OFF }
        return 
    endif
    if GotParam \{ wait }
        wait \{ 1 gameframe }
    endif
    Create \{ prefix = TRG_SFX_TrigBox_MS noprefixwarning }
endscript

script SFX_Music_Volume_Box 
    if SkaterCamAnimFinished
        if NOT IsTrue \{ cutscene_is_playing }
            if (inside)
                SpawnScriptLater \{ SK6_Music_Fade_Out }
                change \{ StaticMusicBoxState = on }
            else
                SpawnScriptLater \{ SK6_Music_Fade_In }
                change \{ StaticMusicBoxState = Off }
            endif
        endif
    endif
endscript

script SFX_Music_Volume_Box_Restore_State 
    if InFrontend
        return 
    endif
    if (StaticMusicBoxState = Off)
        if NOT GotParam sound_options
            if NOT (MusicVolOutsideBox = FadeTempMusicVol)
                SpawnScriptLater SK6_Music_Fade_In params = { DoQuick = 1 }
            else
                if NOT (MusicVolOutsideBox = (FadeTempMusicVol - 1))
                    SpawnScriptLater SK6_Music_Fade_In params = { DoQuick = 1 }
                endif
            endif
        endif
    else
        KillSpawnedScript name = SK6_Music_Fade_In
        KillSpawnedScript name = SK6_Music_Fade_Out
        if GotParam sound_options
            GetValueFromVolume cdvol
            change MusicVolOutsideBox = (<value> * 10)
        endif
        SetMusicVolume 0
    endif
endscript

script SFX_Music_Volume_Box_Kill_State 
    if (StaticMusicBoxState = on)
        change \{ SloMoMusicPaused = 0 }
        SK6_Music_Fade_In \{ DoQuick = 1 }
        change \{ StaticMusicBoxState = Off }
    endif
    change \{ SloMoMusicPaused = 0 }
endscript

script SK6_Music_Fade_Out 
    if (SloMoMusicPaused = 1)
        return 
    endif
    if NOT (DontAdjustMusicViaProximNode = 1)
        if (FadeMusicOutRunning = 0)
            change StaticMusicBoxState = on
            change FadeMusicOutRunning = 1
            GetValueFromVolume cdvol
            if NOT (<value> = 0)
                if (FadeMusicInRunning = 0)
                    GetValueFromVolume cdvol
                    change MusicVolOutsideBox = (<value> * 10)
                    change FadeTempMusicVol = (MusicVolOutsideBox)
                    KillSpawnedScript name = SK6_Music_Fade_In
                    change FadeMusicInRunning = 0
                else
                    KillSpawnedScript name = SK6_Music_Fade_In
                    change FadeMusicInRunning = 0
                endif
                begin 
                if (FadeTempMusicVol < 0.0)
                    FadeTempMusicVol = 0.0
                    break 
                endif
                if (FadeTempMusicVol < 0)
                    change FadeTempMusicVol = 0
                endif
                if (FadeTempMusicVol > 100)
                    change FadeTempMusicVol = 100
                endif
                SetMusicVolume FadeTempMusicVol
                if (MusicVolOutsideBox > 50)
                    change FadeTempMusicVol = (FadeTempMusicVol - (MusicVolOutsideBox / 50))
                else
                    change FadeTempMusicVol = (FadeTempMusicVol - 1)
                endif
                wait 1 gameframe
                repeat 101
                PauseMusic 1
            else
                KillSpawnedScript name = SK6_Music_Fade_In
                change FadeMusicInRunning = 0
                begin 
                if (FadeTempMusicVol < 0.0)
                    FadeTempMusicVol = 0.0
                    break 
                endif
                if (FadeTempMusicVol < 0)
                    change FadeTempMusicVol = 0
                endif
                if (FadeTempMusicVol > 100)
                    change FadeTempMusicVol = 100
                endif
                SetMusicVolume FadeTempMusicVol
                change FadeTempMusicVol = (FadeTempMusicVol - 1)
                wait 1 gameframe
                repeat 
            endif
            change FadeMusicOutRunning = 0
        endif
    endif
endscript

script SK6_Music_Fade_In { DoQuick = 0 }
    if (SloMoMusicPaused = 1)
        return 
    endif
    if NOT (DontAdjustMusicViaProximNode = 1)
        if (FadeMusicInRunning = 0)
            change FadeMusicInRunning = 1
            if NOT (FadeTempMusicVol = (MusicVolOutsideBox + 1))
                if (FadeMusicOutRunning = 0)
                    SetMusicVolume 0
                    change FadeTempMusicVol = 0.0
                    KillSpawnedScript name = SK6_Music_Fade_Out
                    change FadeMusicOutRunning = 0
                else
                    KillSpawnedScript name = SK6_Music_Fade_Out
                    change FadeMusicOutRunning = 0
                endif
                if (<DoQuick> = 0)
                    wait 2 gameframes
                endif
                PauseMusic 0
                if (<DoQuick> = 1)
                    change FadeTempMusicVol = MusicVolOutsideBox
                    if (FadeTempMusicVol < 0)
                        change FadeTempMusicVol = 0
                    endif
                    if (FadeTempMusicVol > 100)
                        change FadeTempMusicVol = 100
                    endif
                    SetMusicVolume FadeTempMusicVol
                else
                    begin 
                    if (FadeTempMusicVol > MusicVolOutsideBox)
                        change FadeTempMusicVol = MusicVolOutsideBox
                        break 
                    endif
                    if (FadeTempMusicVol < 0)
                        change FadeTempMusicVol = 0
                    endif
                    if (FadeTempMusicVol > 100)
                        change FadeTempMusicVol = 100
                    endif
                    SetMusicVolume FadeTempMusicVol
                    if (MusicVolOutsideBox > 50)
                        change FadeTempMusicVol = (FadeTempMusicVol + (MusicVolOutsideBox / 50))
                    else
                        change FadeTempMusicVol = (FadeTempMusicVol + 1)
                    endif
                    wait 1 gameframe
                    repeat 102
                endif
                PauseMusic 0
                GetValueFromVolume cdvol
                if (<DoQuick> = 0)
                    wait 2 gameframes
                endif
            endif
            change FadeMusicInRunning = 0
        endif
        change StaticMusicBoxState = Off
    endif
endscript

script Menu_SFX_Wheel_Click_Short 
    playsound MenuUp pitch = randomrange (98.0, 102.0) vol = randomrange (50.0, 60.0)
    wait \{ 0.1000 seconds }
    playsound MenuUp pitch = randomrange (98.0, 102.0) vol = randomrange (50.0, 60.0)
endscript

script Menu_SFX_Wheel_Click_Long 
    playsound MenuUp pitch = randomrange (105.0, 110.0) vol = randomrange (50.0, 60.0)
    wait 0.05000 seconds
    playsound MenuUp pitch = randomrange (100.0, 107.0) vol = randomrange (50.0, 60.0)
    wait 0.05000 seconds
    playsound MenuUp pitch = randomrange (98.0, 105.0) vol = randomrange (50.0, 60.0)
    wait 0.05000 seconds
    playsound MenuUp pitch = randomrange (98.0, 102.0) vol = randomrange (50.0, 60.0)
    wait 0.05000 seconds
    playsound MenuUp pitch = randomrange (90.0, 95.0) vol = randomrange (50.0, 60.0)
    wait 0.05000 seconds
    playsound MenuUp pitch = randomrange (90.0, 95.0) vol = randomrange (50.0, 60.0)
    wait 0.05000 seconds
    playsound MenuUp pitch = randomrange (90.0, 95.0) vol = randomrange (50.0, 60.0)
    wait 0.05000 seconds
    playsound MenuUp pitch = randomrange (87.0, 89.0) vol = randomrange (50.0, 60.0)
    wait 0.05000 seconds
endscript

script SK6_SFX_OutOfAmmoBuzzer 
    wait \{ 0.3000 seconds }
endscript

script Auto_SFX_Car_Tire_Squeal 
    if NOT (IsStreamPlaying LA_Skids)
        RandomNoRepeat (
            @ obj_playstream LA_Skid_01 id = LA_Skids pitch = randomrange (85.0, 125.0) vol = randomrange (150.0, 200.0)
            @ obj_playstream LA_Skid_02 id = LA_Skids pitch = randomrange (85.0, 125.0) vol = randomrange (150.0, 200.0)
            @ obj_playstream LA_Skid_03 id = LA_Skids pitch = randomrange (85.0, 125.0) vol = randomrange (150.0, 200.0)
            @ obj_playstream LA_Skid_04 id = LA_Skids pitch = randomrange (85.0, 125.0) vol = randomrange (150.0, 200.0)
            @ obj_playstream LA_Skid_05 id = LA_Skids pitch = randomrange (85.0, 125.0) vol = randomrange (150.0, 200.0)
            @ obj_playstream LA_Skid_06 id = LA_Skids pitch = randomrange (85.0, 125.0) vol = randomrange (150.0, 200.0)
            @ obj_playstream LA_Skid_07 id = LA_Skids pitch = randomrange (85.0, 125.0) vol = randomrange (150.0, 200.0)
            @ obj_playstream LA_Skid_08 id = LA_Skids pitch = randomrange (85.0, 125.0) vol = randomrange (150.0, 200.0)
            @ obj_playstream LA_Skid_09 id = LA_Skids pitch = randomrange (85.0, 125.0) vol = randomrange (150.0, 200.0)
            @ obj_playstream LA_Skid_10 id = LA_Skids pitch = randomrange (85.0, 125.0) vol = randomrange (150.0, 200.0)
            @ obj_playstream LA_Skid_12 id = LA_Skids pitch = randomrange (85.0, 125.0) vol = randomrange (150.0, 200.0)
            @ obj_playstream LA_Skid_13 id = LA_Skids pitch = randomrange (85.0, 125.0) vol = randomrange (150.0, 200.0)
            @ obj_playstream LA_Skid_14 id = LA_Skids pitch = randomrange (85.0, 125.0) vol = randomrange (150.0, 200.0)
            @ obj_playstream LA_Skid_15 id = LA_Skids pitch = randomrange (85.0, 125.0) vol = randomrange (150.0, 200.0)
            @ obj_playstream LA_Skid_16 id = LA_Skids pitch = randomrange (85.0, 125.0) vol = randomrange (150.0, 200.0)
        )
    endif
endscript

script Auto_SFX_CarBrakeSqueal 
endscript

script Auto_SFX_Car_Horn_Stream 
    if NOT (IsStreamPlaying CarHorn)
        wait Random (@ 0.2000 @ 0.4000 @ 0.6000) seconds
        obj_playstream CarHorn vol = randomrange (50.0, 60.0) pitch = randomrange (80.0, 100.0) dropoff = 120
    endif
endscript

script SK6_SFX_ShowClassicGoals 
    playsound \{ DE_PauseFlyIn pitch = 200 }
    wait \{ 0.2000 seconds }
    playsound \{ BailSlap02 }
endscript

script SK6_SFX_ShowPointsFromGoal 
    wait \{ 12 gameframes }
    playsound \{ boneless09 pitch = 30 }
endscript

script SK6_SFX_IncomingBeeper 
    wait \{ 1 gameframe }
    PauseStream \{ 0 }
    PlayStream \{ Nokia_Ring_01 vol = 150 priority = 101 }
endscript

script SK6_SFX_Get_Throwing_Item 
    if LevelIs load_bo
        PlayStream Sk6_Pickup_Apples vol = 120
    endif
    if LevelIs load_ba
        PlayStream Sk6_Pickup_Tomatoes vol = 120
    endif
    if LevelIs load_be
        PlayStream Sk6_Pickup_SprayCans vol = 120
    endif
    if LevelIs load_au
        PlayStream Sk6_Pickup_Shrimp vol = 120
    endif
    if LevelIs load_NO
        PlayStream Sk6_Pickup_Beads vol = 120
    endif
    if LevelIs load_st
        PlayStream Sk6_Pickup_SmokeBombs vol = 150
    endif
    if LevelIs load_se
    endif
endscript

script ALL_Levels_SFX_PlayThrowingSound 
    if LevelIs \{ load_be }
        skater ::obj_playsound \{ SK6_Throw_SprayCan_11 vol = 400 pitch = 120 }
    endif
endscript

script ALL_Levels_Going_Through_Tree 
    printf \{ 'GOING THROUGH TREE SOUNDS!!!!!!!!!!!!!!!!!!!!!!' }
    if NOT IsStreamPlaying \{ SK6_ThroughTrees }
        PlayStream \{ SK6_ThroughTrees vol = 140 }
    endif
endscript

script ALL_Levels_SFX_Start_Goal 
    PlayStream \{ SK6_StartAGoal vol = 125 priority = 101 }
endscript

script load_level_handle_ambient_sfx 
    if ((cd)|| (IsTrue TestMusicFromHost))
        ClearMusicTrackList
        change \{ forceambientsfxtomusicvolume = 0 }
        change \{ ambienttracknum = 0 }
        if GotParam \{ ambient_track }
            if IsArray <ambient_track>
                GetArraySize <ambient_track>
                i = 0
                begin 
                AddMusicTrack (<ambient_track> [ <i> ])
                i = (<i> + 1)
                repeat <array_size>
            else
                AddMusicTrack <ambient_track>
            endif
        endif
        set_music_ambient_state
    endif
endscript

script set_music_ambient_state 
    if InFrontend
        SetCDToMusic
        return 
    endif
    if GotParam \{ force }
        StopMusic
    endif
    if IsTrue \{ forceambientsfxtomusicvolume }
        SetCDToAmbient
    else
        if ((MusicVolOutsideBox)= 0)
            SetCDToAmbient
        else
            SetCDToMusic
        endif
    endif
endscript

script SFX_Change_Footstep_Sounds_To_Default 
    change \{ SFX_FootStepWalk01 = WalkStepConc01_11 }
    change \{ SFX_FootStepWalk02 = WalkStepConc03_11 }
    change \{ SFX_FootStepWalk03 = WalkStepConc05_11 }
    change \{ SFX_FootStepRun01 = RunStepConc01_11 }
    change \{ SFX_FootStepRun02 = RunStepConc02_11 }
    change \{ SFX_FootStepRun03 = RunStepConc03_11 }
    change \{ SFX_FootStepRun04 = RunStepConc03_11 }
    change \{ SFX_FootStepRun05 = RunStepConc03_11 }
endscript

script Paulie_TalkShit Line = 0
    if NOT IsStreamPlaying ThisPaulieLine
        Random (
            @*50 
            @ PlayStream Paulie_Wild01 vol = 200 id = ThisPaulieLine
            @ PlayStream Paulie_Wild02 vol = 200 id = ThisPaulieLine
            @ PlayStream Paulie_Wild03 vol = 200 id = ThisPaulieLine
            @ PlayStream Paulie_Wild04 vol = 200 id = ThisPaulieLine
            @ PlayStream Paulie_Wild05 vol = 200 id = ThisPaulieLine
            @ PlayStream Paulie_Wild07 vol = 200 id = ThisPaulieLine
            @ PlayStream Paulie_Wild08 vol = 200 id = ThisPaulieLine
            @ PlayStream Paulie_Wild09 vol = 200 id = ThisPaulieLine
            @ PlayStream Paulie_Wild10 vol = 200 id = ThisPaulieLine
            @ PlayStream Paulie_Wild11 vol = 200 id = ThisPaulieLine
            @ PlayStream Paulie_Wild12 vol = 200 id = ThisPaulieLine
            @ PlayStream Paulie_Wild13 vol = 200 id = ThisPaulieLine
            @ PlayStream Paulie_Wild14 vol = 200 id = ThisPaulieLine
            @ PlayStream Paulie_Wild16 vol = 200 id = ThisPaulieLine
            @ PlayStream Paulie_Wild17 vol = 200 id = ThisPaulieLine
            @ PlayStream Paulie_Wild18 vol = 200 id = ThisPaulieLine
            @ PlayStream Paulie_Wild19 vol = 200 id = ThisPaulieLine
            @ PlayStream Paulie_Wild20 vol = 200 id = ThisPaulieLine
            @ PlayStream Paulie_Wild21 vol = 200 id = ThisPaulieLine
            @ PlayStream Paulie_Wild22 vol = 200 id = ThisPaulieLine
            @ PlayStream Paulie_Wild23 vol = 200 id = ThisPaulieLine
            @ PlayStream Paulie_Wild25 vol = 200 id = ThisPaulieLine
            @ PlayStream Paulie_Wild26 vol = 200 id = ThisPaulieLine
        )
    endif
endscript

script ALL_SFX_Wait_Before_Tantrum_Stream 
    wait \{ 0.5000 seconds }
    PlaySkaterStream \{ type = 'tantrum' }
endscript

script SFX_Pigeon_Fly_Up 
    if NOT IsStreamPlaying \{ PigeonStreamFlyUp }
        Random (
            @ obj_playstream Birds_wingflaps_01 vol = 150 priority = StreamPriorityHighest pitch = randomrange (85.0, 125.0) vol = randomrange (75.0, 125.0) id = PigeonStreamFlyUp
            @ obj_playstream Birds_wingflaps_02 vol = 150 priority = StreamPriorityHighest pitch = randomrange (85.0, 125.0) vol = randomrange (75.0, 125.0) id = PigeonStreamFlyUp
        )
    endif
endscript

script SFX_Pigeon_idle 
    obj_playstream \{Pigeons_Cooing vol = 150 num_loops = -1 priority = StreamPriorityHigh vol = 80}
endscript

script SK7_SFX_Spawned_Glass_Break_Regular 
    SetSpawnedScriptNoRepeatFor \{ time = 0.3000 }
    SetSpawnInstanceLimits \{ max = 1 management = ignore_spawn_request }
    playsound HitGlassPane2x pitch = RandomNoRepeat (@ 80 @ 90 @ 100 @ 110)
endscript

script SK7_SFX_Spawned_Bus_Idle_Loop_Limiting 
    SetSpawnedScriptNoRepeatFor \{ time = 0.3000 }
    SetSpawnInstanceLimits \{ max = 1 management = ignore_spawn_request }
    PlayStream \{ Int_Bus_Loop priority = StreamPriorityHighest vol = 75 num_loops = -1 }
endscript
