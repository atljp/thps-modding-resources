
SE_SFX_LoungeSingerMusicStatus = 0
SE_SFX_SpaceportMusicStatus = 0
SE_SFX_DoneWaitingSpaceport = 1

script SE_LoadingSounds 
    LoadSound 'Shared\Hits\HitGlassPane2x'
    LoadSound 'Shared\Auto\LA_Skid_11' vol = 100 dropoff = 150
    LoadSound 'Shared\Auto\CarBrakeSqueal' vol = 100 dropoff = 150
    LoadSound 'Shared\Auto\CarHorn_11' vol = 100 dropoff = 150
    LoadSound 'Shared\Hits\HitMetalCan' vol = 100 dropoff = 150 PosUpdateWithDoppler
    LoadSound 'Shared\Hits\BonkBush' vol = 100 dropoff = 0
    LoadSound 'Shared\Water\FallWater'
    LoadSound 'Shared\Auto\CarLoop' vol = 100 dropoff = 150 PosUpdateWithDoppler
    LoadSound 'Vehicles\Vehicle_Tire_Loop'
    LoadSound 'Terrains\BonkMetal_11'
    LoadSound 'SE\SK6_SE_ShipEngineLoop_11'
    LoadSound 'SE\SK6_SE_PressButton01'
    LoadSound 'SE\SK6_SE_HologramLoop'
    LoadSound 'SE\SK6_SE_ConveyorLoop_11' PosUpdateWithDoppler
    LoadSound 'Vehicles\Silent_Vehicle_Tire_Loop'
    LoadSound 'SE\SK6_SE_DoorsOpen'
    LoadSound 'SE\SK6_SE_WarpHoleLoop'
    LoadSound 'SE\SK6_SE_BreakMetalWall'
    LoadSound 'SE\SK6_SE_SnapCable'
    LoadSound 'SE\Sk6_SE_MonkeySwordGlow'
    LoadSound 'BO\SK6_BO_FireLoop'
    if (debugsoundfx = 1)
        DumpHeaps
    endif
endscript


script SE_SFX_FanBlades 
    if NOT IsStreamPlaying SK6_BO_Air_Vent
        obj_playstream SK6_BO_Air_Vent pitch = 80 vol = 180 emitter = TRG_SFX_SOB_Airflow_Vent num_loops = -1 priority = 70
    endif
endscript


script SE_SFX_Spaceport_Music_Box 
endscript


script SE_SFX_WaitingSpaceportMusic 
    change SE_SFX_DoneWaitingSpaceport = 0
    <counter_waiting_music> = 0
    begin 
    printf 'Waited %c seconds' c = <counter_waiting_music>
    wait 1 second
    <counter_waiting_music> = (<counter_waiting_music> + 1)
    repeat 230
    change SE_SFX_DoneWaitingSpaceport = 1
endscript


script SE_SFX_Mayan_Music_Box 
endscript


script SE_SFX_Hell_Music_Box 
endscript


script SE_SFX_Garage03 
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


script SE_SFX_Garage02 
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


script SE_SFX_Garage01 
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


script SE_SFX_ShipIdle01 
    wait 5 seconds
    begin 
    if ((IsAlive name = GEO_PreEvent_Spaceship_RedButton01))
        if ((IsAlive name = GEO_PreEvent_Spaceship_RedButton02))
            obj_stopsound SK6_SE_ShipEngineLoop_11
        else
            obj_playsound SK6_SE_ShipEngineLoop_11 emitter = TRG_SFX_SOB_ShipIdle01
        endif
    else
        if ((IsAlive name = GEO_PreEvent_Spaceship_RedButton02))
            obj_playsound SK6_SE_ShipEngineLoop_11 emitter = TRG_SFX_SOB_ShipIdle01
        else
            obj_stopsound SK6_SE_ShipEngineLoop_11
            break 
        endif
    endif
    wait 0.5000 seconds
    repeat 
endscript


script SE_SFX_Hologram 
    obj_playsound SK6_SE_HologramLoop emitter = TRG_SFX_SOB_Hologram
endscript


script SE_SFX_RedZap_01 
    if InSplitScreenGame
        if NOT IsStreamPlaying RedZapper
            obj_playstream SK6_SE_RedElectricalZappingLoop emitter = TRG_SFX_SOB_RedZap01 id = RedZapper num_loops = -1
        endif
    else
        obj_playstream SK6_SE_RedElectricalZappingLoop emitter = TRG_SFX_SOB_RedZap01 id = RedZapper num_loops = -1
    endif
endscript


script SE_SFX_RedZap_02 
    if InSplitScreenGame
        if NOT IsStreamPlaying RedZapper
            obj_playstream SK6_SE_RedElectricalZappingLoop emitter = TRG_SFX_SOB_RedZap02 id = RedZapper num_loops = -1
        endif
    else
        obj_playstream SK6_SE_RedElectricalZappingLoop emitter = TRG_SFX_SOB_RedZap02 id = RedZapper num_loops = -1
    endif
endscript


script SE_SFX_Conveyor 
endscript


script SE_SFX_OutsideBG 
endscript


script SE_SFX_OutsideBG02 
endscript


script SE_SFX_TempleReverb 
endscript


script SE_SFX_GlowingSword 
    obj_playsound SK6_SE_HologramLoop pitch = 89
    obj_playsound SK6_BO_FireLoop vol = 20 pitch = 400
endscript


script SE_SFX_Lava01 
endscript


script SE_SFX_LoungeSinger_Music_Box 
    if (StaticMusicBoxesOn = 1)
        SFX_Music_Volume_Box
    endif
endscript


script SE_SFX_LoungeSinger 
    if NOT IsStreamPlaying LoungeSingerStream
        RandomNoRepeat (
            @ obj_playstream LoungeBand02 vol = 150 emitter = TRG_SFX_SOB_LoungeSinger dropoff_function = inv_exponential id = LoungeSingerStream priority = 101 num_loops = -1
            @ obj_playstream LoungeBand03 vol = 150 emitter = TRG_SFX_SOB_LoungeSinger dropoff_function = inv_exponential id = LoungeSingerStream priority = 101 num_loops = -1
            @ obj_playstream LoungeBand04 vol = 150 emitter = TRG_SFX_SOB_LoungeSinger dropoff_function = inv_exponential id = LoungeSingerStream priority = 101 num_loops = -1
            @ obj_playstream LoungeBand05 vol = 150 emitter = TRG_SFX_SOB_LoungeSinger dropoff_function = inv_exponential id = LoungeSingerStream priority = 101 num_loops = -1
        )
        obj_addstream LoungeSingerStream Add = LoungeBand01
        wait 1 gameframe
        obj_removestream LoungeSingerStream remove = LoungeBand02
        obj_removestream LoungeSingerStream remove = LoungeBand03
        obj_removestream LoungeSingerStream remove = LoungeBand04
        obj_removestream LoungeSingerStream remove = LoungeBand05
    endif
endscript


script SE_SFX_LoungeSinger_Start 
    RandomNoRepeat (
        @ obj_playstream Ped_LoungeSinger_Start01 vol = 200 priority = StreamPriorityHigh
        @ obj_playstream Ped_LoungeSinger_Start02 vol = 200 priority = StreamPriorityHigh
        @ obj_playstream Ped_LoungeSinger_Start03 vol = 200 priority = StreamPriorityHigh
        @ obj_playstream Ped_LoungeSinger_Start04 vol = 200 priority = StreamPriorityHigh
        @ obj_playstream Ped_LoungeSinger_Start05 vol = 200 priority = StreamPriorityHigh
        @ obj_playstream Ped_LoungeSinger_Start06 vol = 200 priority = StreamPriorityHigh
        @ obj_playstream Ped_LoungeSinger_Start07 vol = 200 priority = StreamPriorityHigh
    )
endscript


script SE_SFX_LoungeSinger_Start02 
    printf 'CREATING THE BOXES TO START THE BAND'
    change SE_SFX_LoungeSingerMusicStatus = 1
    Kill name = TRG_SFX_TrigBox_LoungeSinger
    Kill name = TRG_SFX_TrigBox_LoungeSingerMusicOff
    Create name = TRG_SFX_TrigBox_LoungeSinger
    Create name = TRG_SFX_TrigBox_LoungeSingerMusicOff
endscript


script SE_SFX_LoungeSinger_Stop 
    printf 'PLAYING A SINGER PISSED ABOUT ENDING'
    RandomNoRepeat (
        @ obj_playstream Ped_LoungeSinger_End01 vol = 200 priority = StreamPriorityHigh
        @ obj_playstream Ped_LoungeSinger_End02 vol = 200 priority = StreamPriorityHigh
        @ obj_playstream Ped_LoungeSinger_End03 vol = 200 priority = StreamPriorityHigh
        @ obj_playstream Ped_LoungeSinger_End04 vol = 200 priority = StreamPriorityHigh
        @ obj_playstream Ped_LoungeSinger_End05 vol = 200 priority = StreamPriorityHigh
        @ obj_playstream Ped_LoungeSinger_End06 vol = 200 priority = StreamPriorityHigh
        @ obj_playstream Ped_LoungeSinger_End07 vol = 200 priority = StreamPriorityHigh
    )
endscript


script SE_SFX_LoungeSinger_Stop02 
    printf 'STOPPING THE MUSIC BY KILLING BOXES'
    change SE_SFX_LoungeSingerMusicStatus = 0
    Kill name = TRG_SFX_TrigBox_LoungeSinger
    Kill name = TRG_SFX_TrigBox_LoungeSingerMusicOff
endscript


script SE_SFX_Spits 
endscript


script SE_SFX_Robot_Beeps Robot = TRG_Droid_01
    Random (
        @ <Robot> ::obj_playstream SK6_SE_Robot_Beep01 dropoff = 250 priority = StreamPriorityLow
        @ <Robot> ::obj_playstream SK6_SE_Robot_Beep02 dropoff = 250 priority = StreamPriorityLow
        @ <Robot> ::obj_playstream SK6_SE_Robot_Beep03 dropoff = 250 priority = StreamPriorityLow
        @ <Robot> ::obj_playstream SK6_SE_Robot_Beep04 dropoff = 250 priority = StreamPriorityLow
        @ <Robot> ::obj_playstream SK6_SE_Robot_Beep05 dropoff = 250 priority = StreamPriorityLow
    )
endscript


script SE_SFX_IgniteEngine01 
    wait 0.1000 seconds
    if NOT ((GetFlag flag = RedButton01)& (GetFlag flag = RedButton02))
        playsound SK6_SE_PressButton01 vol = 160
    endif
endscript


script SE_SFX_IgniteEngine02 
    wait 0.1000 seconds
    if NOT ((GetFlag flag = RedButton01)& (GetFlag flag = RedButton02))
        playsound SK6_SE_PressButton01 vol = 160
    endif
endscript


script SE_SFX_DeathByLaser 
endscript


script SE_SFX_SpaceDoorOpen 
    if NOT issoundplaying SK6_SE_DoorsOpen
        playsound SK6_SE_DoorsOpen vol = 80
    endif
endscript


script SE_SFX_SpaceDoorClose 
    if NOT issoundplaying SK6_SE_PressButton01
        playsound SK6_SE_PressButton01 pitch = 50
    endif
endscript


script SE_SFX_DartsShoot 
    if NOT IsStreamPlaying SFX_Darts
        PlayStream SK6_SE_DartsShooting id = SFX_Darts
    endif
endscript


script SE_SFX_RopeBreak01 
    playsound SK6_SE_SnapCable
endscript


script SE_SFX_RopeBreak02 
    playsound SK6_SE_SnapCable
endscript


script SE_SFX_LavaBurstUp 
endscript


script SE_SFX_DistantScream 
endscript


script SE_SFX_HellBasement 
endscript


script SE_SFX_HellBasement02 
endscript


script SE_SFX_Laughing 
endscript


script SE_SFX_BreakMetal 
    PlayStream SK6_BreakMetalFence vol = 200
    playsound HitGlassPane2x pitch = 50
endscript


script SE_SFX_BreakGlass 
    playsound HitGlassPane2x pitch = Random (@ 85 @ 95 @ 105 @ 110)
endscript


script SE_SFX_SpaceToMayanPortal 
endscript


script SE_SFX_SpaceToHellPortal 
endscript


script SE_SFX_MayanToSpacePortal 
endscript


script SE_SFX_MayanToHellPortal 
endscript


script SE_SFX_HellToMayanPortal 
endscript


script SE_SFX_HellToSpacePortal 
endscript

