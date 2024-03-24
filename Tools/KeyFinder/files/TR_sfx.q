
script TR_LoadingSounds 
    LoadSound 'Shared\Hits\HitGlassPane2x'
    LoadSound 'Shared\Auto\LA_Skid_11' vol = 100 dropoff = 150
    LoadSound 'Shared\Auto\CarBrakeSqueal' vol = 100 dropoff = 150
    LoadSound 'Shared\Auto\CarHorn_11' vol = 100 dropoff = 150
    LoadSound 'Shared\Hits\HitMetalCan' vol = 100 dropoff = 150 PosUpdateWithDoppler
    LoadSound 'Shared\Hits\BonkBush' vol = 100 dropoff = 0
    LoadSound 'Shared\Water\FallWater'
    LoadSound 'BO\ShoppingCartBail'
    LoadSound 'BO\ShoppingCartLand'
    LoadSound 'BO\ShoppingCartLoop'
    LoadSound 'BO\ShoppingCartOllie'
    LoadSound 'BO\SK6_BO_FireLoop'
    LoadSound 'BO\SK6_BO_RiverLoop01_11'
    LoadSound 'TR\TR_BreakDownWoodWall'
    LoadSound 'TR\TR_LightHum01'
    LoadSound 'TR\TR_BreakSwitch'
    LoadSound 'BO\SK6_BO_FountainLoop03_11'
    LoadSound 'Shared\Hits\BustValve'
    LoadSound 'BouncyObjects\Bouncy_MetalBucketHit01'
    LoadSound 'BouncyObjects\Bouncy_MetalHit02'
    LoadSound 'BouncyObjects\Bouncy_MetalDrumHit02'
    LoadSound 'BouncyObjects\Bouncy_WoodenTableHit01'
    LoadSound 'BouncyObjects\Bouncy_WoodenTableHit02'
    LoadSound 'BouncyObjects\Bouncy_PlasticCup_Hit01'
    LoadSound 'BouncyObjects\Bouncy_PlasticCup_Hit02'
    LoadSound 'BouncyObjects\Bouncy_CardboardBoxHit01'
    LoadSound 'BouncyObjects\Bouncy_CardboardBoxHit02'
    if (debugsoundfx = 1)
        DumpHeaps
    endif
endscript


script TR_SFX_Reverb_Box_01 
    printf '################################REVERB BOX HERE!!!!!!!!!!!!!'
    if NOT IsTrue cutscene_is_playing
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
    endif
endscript


script TR_SFX_TaxiHop 
    if NOT IsStreamPlaying TaxiHopStream
        printf '*************TAXI HOP STREAM!'
        PlayStream TR_TaxiHop id = TaxiHopStream
    endif
endscript


script TR_SFX_OnLight_Gap 
    if NOT IsStreamPlaying LightGapStream
        printf '*************LIGHT GAP STREAM!'
        PlayStream TR_LandOnLightGap id = LightGapStream
    endif
endscript


script TR_SFX_Warehouse_Hum_01 
    printf '*************************************************PLAYING TR_LightHum01!!!!!!!!!!!!!!!'
    obj_playsound TR_LightHum01 vol = 15 emitter = TRG_SFX_SOB_LightHum_01 dropoff = exponential id = ThisWarehouselighthum01
endscript


script TR_SFX_Warehouse_Hum_02 
    obj_playsound TR_LightHum01 vol = 15 emitter = TRG_SFX_SOB_LightHum_02 dropoff = exponential
endscript


script TR_SFX_Warehouse_Drips_01 
    wait Random (@ 0 @ 0.2000 @ 0.8000 @ 0.9000) seconds
    begin 
    RandomNoRepeat (
        @ obj_playstream TR_Drip01 vol = TR_SFX_DripVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_Drip01 @ TRG_SFX_SOB_Drip02 @ TRG_SFX_SOB_Drip03 @ TRG_SFX_SOB_Drip04) priority = StreamPriorityLow
        wait 4 seconds
        @ obj_playstream TR_Drip02 vol = TR_SFX_DripVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_Drip01 @ TRG_SFX_SOB_Drip02 @ TRG_SFX_SOB_Drip03 @ TRG_SFX_SOB_Drip04) priority = StreamPriorityLow
        wait 5 seconds
        @ obj_playstream TR_Drip03 vol = TR_SFX_DripVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_Drip01 @ TRG_SFX_SOB_Drip02 @ TRG_SFX_SOB_Drip03 @ TRG_SFX_SOB_Drip04) priority = StreamPriorityLow
        wait 4 seconds
        @ obj_playstream TR_Drip04 vol = TR_SFX_DripVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_Drip01 @ TRG_SFX_SOB_Drip02 @ TRG_SFX_SOB_Drip03 @ TRG_SFX_SOB_Drip04) priority = StreamPriorityLow
        wait 5 seconds
    )
    wait Random (@ 0.5000 @ 1.100 @ 1.300) seconds
    repeat 
endscript


script TR_SFX_Warehouse_Drips_02 
    wait Random (@ 0 @ 0.2000 @ 0.8000 @ 0.9000) seconds
    begin 
    RandomNoRepeat (
        @ obj_playstream TR_Drip05 vol = TR_SFX_DripVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_Drip05 @ TRG_SFX_SOB_Drip06 @ TRG_SFX_SOB_Drip07 @ TRG_SFX_SOB_Drip08) priority = StreamPriorityLow
        wait 4 seconds
        @ obj_playstream TR_Drip06 vol = TR_SFX_DripVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_Drip05 @ TRG_SFX_SOB_Drip06 @ TRG_SFX_SOB_Drip07 @ TRG_SFX_SOB_Drip08) priority = StreamPriorityLow
        wait 5 seconds
        @ obj_playstream TR_Drip07 vol = TR_SFX_DripVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_Drip05 @ TRG_SFX_SOB_Drip06 @ TRG_SFX_SOB_Drip07 @ TRG_SFX_SOB_Drip08) priority = StreamPriorityLow
        wait 4 seconds
        @ obj_playstream TR_Drip08 vol = TR_SFX_DripVol emitter = RandomNoRepeat (@ TRG_SFX_SOB_Drip05 @ TRG_SFX_SOB_Drip06 @ TRG_SFX_SOB_Drip07 @ TRG_SFX_SOB_Drip08) priority = StreamPriorityLow
        wait 5 seconds
    )
    wait Random (@ 0.5000 @ 1.100 @ 1.300) seconds
    repeat 
endscript


script TR_SFX_BustPipe_WaterSpray 
    switch <name>
        case Water_SprinklerA10
        TRG_SFX_Ghost_PipeBust06 ::obj_playsound BustValve pitch = randomrange (130.0, 180.0) vol = 50
        TRG_SFX_Ghost_PipeBust06 ::obj_playsound SK6_BO_FountainLoop03_11 pitch = 400 vol = 20 dropoff = 64
        case Water_SprinklerA28
        TRG_SFX_Ghost_PipeBust07 ::obj_playsound BustValve pitch = randomrange (130.0, 180.0) vol = 50
        TRG_SFX_Ghost_PipeBust07 ::obj_playsound SK6_BO_FountainLoop03_11 pitch = 400 vol = 20 dropoff = 64
        case Water_SprinklerA25
        TRG_SFX_Ghost_PipeBust08 ::obj_playsound BustValve pitch = randomrange (130.0, 180.0) vol = 50
        TRG_SFX_Ghost_PipeBust08 ::obj_playsound SK6_BO_FountainLoop03_11 pitch = 400 vol = 20 dropoff = 64
        case Water_SprinklerA07
        TRG_SFX_Ghost_PipeBust05 ::obj_playsound BustValve pitch = randomrange (130.0, 180.0) vol = 50
        TRG_SFX_Ghost_PipeBust05 ::obj_playsound SK6_BO_FountainLoop03_11 pitch = 400 vol = 20 dropoff = 64
        case Water_SprinklerA06
        TRG_SFX_Ghost_PipeBust03 ::obj_playsound BustValve pitch = randomrange (130.0, 180.0) vol = 50
        TRG_SFX_Ghost_PipeBust03 ::obj_playsound SK6_BO_FountainLoop03_11 pitch = 400 vol = 20 dropoff = 64
        case Water_SprinklerA16
        TRG_SFX_Ghost_PipeBust02 ::obj_playsound BustValve pitch = randomrange (130.0, 180.0) vol = 50
        TRG_SFX_Ghost_PipeBust02 ::obj_playsound SK6_BO_FountainLoop03_11 pitch = 400 vol = 20 dropoff = 64
        case Water_SprinklerA19
        TRG_SFX_Ghost_PipeBust04 ::obj_playsound BustValve pitch = randomrange (130.0, 180.0) vol = 50
        TRG_SFX_Ghost_PipeBust04 ::obj_playsound SK6_BO_FountainLoop03_11 pitch = 400 vol = 20 dropoff = 64
        case Water_SprinklerA13
        TRG_SFX_Ghost_PipeBust01 ::obj_playsound BustValve pitch = randomrange (130.0, 180.0) vol = 50
        TRG_SFX_Ghost_PipeBust01 ::obj_playsound SK6_BO_FountainLoop03_11 pitch = 400 vol = 20 dropoff = 64
        case Water_SprinklerA61_Start09
        TRG_SFX_Ghost_PipeBust18 ::obj_playsound BustValve pitch = randomrange (130.0, 180.0) vol = 50
        TRG_SFX_Ghost_PipeBust18 ::obj_playsound SK6_BO_FountainLoop03_11 pitch = 400 vol = 20 dropoff = 64
        case Water_SprinklerA60_Start08
        TRG_SFX_Ghost_PipeBust19 ::obj_playsound BustValve pitch = randomrange (130.0, 180.0) vol = 50
        TRG_SFX_Ghost_PipeBust19 ::obj_playsound SK6_BO_FountainLoop03_11 pitch = 400 vol = 20 dropoff = 64
        case Water_SprinklerA59_Start07
        TRG_SFX_Ghost_PipeBust17 ::obj_playsound BustValve pitch = randomrange (130.0, 180.0) vol = 50
        TRG_SFX_Ghost_PipeBust17 ::obj_playsound SK6_BO_FountainLoop03_11 pitch = 400 vol = 20 dropoff = 64
        case Water_SprinklerA56_Start04
        TRG_SFX_Ghost_PipeBust15 ::obj_playsound BustValve pitch = randomrange (130.0, 180.0) vol = 50
        TRG_SFX_Ghost_PipeBust15 ::obj_playsound SK6_BO_FountainLoop03_11 pitch = 400 vol = 20 dropoff = 64
        case Water_SprinklerA57_Start05
        TRG_SFX_Ghost_PipeBust14 ::obj_playsound BustValve pitch = randomrange (130.0, 180.0) vol = 50
        TRG_SFX_Ghost_PipeBust14 ::obj_playsound SK6_BO_FountainLoop03_11 pitch = 400 vol = 20 dropoff = 64
        case Water_SprinklerA58_Start06
        TRG_SFX_Ghost_PipeBust16 ::obj_playsound BustValve pitch = randomrange (130.0, 180.0) vol = 50
        TRG_SFX_Ghost_PipeBust16 ::obj_playsound SK6_BO_FountainLoop03_11 pitch = 400 vol = 20 dropoff = 64
        case Water_SprinklerA55_Start03
        TRG_SFX_Ghost_PipeBust13 ::obj_playsound BustValve pitch = randomrange (130.0, 180.0) vol = 50
        TRG_SFX_Ghost_PipeBust13 ::obj_playsound SK6_BO_FountainLoop03_11 pitch = 400 vol = 20 dropoff = 64
        case Water_SprinklerA53_Start01
        TRG_SFX_Ghost_PipeBust10 ::obj_playsound BustValve pitch = randomrange (130.0, 180.0) vol = 50
        TRG_SFX_Ghost_PipeBust10 ::obj_playsound SK6_BO_FountainLoop03_11 pitch = 400 vol = 20 dropoff = 64
        case Water_SprinklerA54_Start02
        TRG_SFX_Ghost_PipeBust12 ::obj_playsound BustValve pitch = randomrange (130.0, 180.0) vol = 50
        TRG_SFX_Ghost_PipeBust12 ::obj_playsound SK6_BO_FountainLoop03_11 pitch = 400 vol = 20 dropoff = 64
        case Water_SprinklerA52_Start
        TRG_SFX_Ghost_PipeBust11 ::obj_playsound BustValve pitch = randomrange (130.0, 180.0) vol = 50
        TRG_SFX_Ghost_PipeBust11 ::obj_playsound SK6_BO_FountainLoop03_11 pitch = 400 vol = 20 dropoff = 64
        case Water_SprinklerA22
        TRG_SFX_Ghost_PipeBust09 ::obj_playsound BustValve pitch = randomrange (130.0, 180.0) vol = 50
        TRG_SFX_Ghost_PipeBust09 ::obj_playsound SK6_BO_FountainLoop03_11 pitch = 400 vol = 20 dropoff = 64
    endswitch
endscript


script TR_SFX_BustedPipe 
    obj_playsound SK6_BO_RiverLoop01_11 vol = 80 pitch = 200 emitter = TRG_SFX_SOB_BustedPipe dropoff_function = exponential
endscript


script TR_SFX_TrashFire01 
    obj_playsound SK6_BO_FireLoop emitter = TRG_SFX_SOB_TrashFire01
endscript


script TR_SFX_Break_Switch 
    wait 1 second
    Create name = TRG_SFX_TrigBox_SwitchBreakElectric
endscript


script TR_SFX_ElectricSparks 
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


script SFX_PlaneBy_01 
    TRG_SFX_Ghost_Airplane_By_01 ::obj_movetonode name = TRG_AirplaneWayPoint0101 Speed = 100
    wait 8 seconds
    begin 
    TRG_SFX_Ghost_Airplane_By_01 ::obj_movetonode name = TRG_AirplaneWayPoint0102 Speed = 25
    RandomNoRepeat (
        @ TRG_SFX_Ghost_Airplane_By_01 ::obj_playstream vol = 200 TR_DistHelo01 dropoff = 2000 priority = StreamPriorityHigh
        @ TRG_SFX_Ghost_Airplane_By_01 ::obj_playstream vol = 200 TR_DistHelo02 dropoff = 2000 priority = StreamPriorityHigh
        @ TRG_SFX_Ghost_Airplane_By_01 ::obj_playstream vol = 200 TR_DistPlane01 dropoff = 2000 priority = StreamPriorityHigh
        @ TRG_SFX_Ghost_Airplane_By_01 ::obj_playstream vol = 200 TR_DistPlane02 dropoff = 2000 priority = StreamPriorityHigh
        @ TRG_SFX_Ghost_Airplane_By_01 ::obj_playstream vol = 200 TR_DistPlane03 dropoff = 2000 priority = StreamPriorityHigh
    )
    wait Random (@ 40 @ 60 @ 90) seconds
    TRG_SFX_Ghost_Airplane_By_01 ::obj_movetonode name = TRG_AirplaneWayPoint0101 Speed = 25
    RandomNoRepeat (
        @ TRG_SFX_Ghost_Airplane_By_01 ::obj_playstream vol = 200 TR_DistHelo01 dropoff = 2000 priority = StreamPriorityHigh
        @ TRG_SFX_Ghost_Airplane_By_01 ::obj_playstream vol = 200 TR_DistHelo02 dropoff = 2000 priority = StreamPriorityHigh
        @ TRG_SFX_Ghost_Airplane_By_01 ::obj_playstream vol = 200 TR_DistPlane01 dropoff = 2000 priority = StreamPriorityHigh
        @ TRG_SFX_Ghost_Airplane_By_01 ::obj_playstream vol = 200 TR_DistPlane02 dropoff = 2000 priority = StreamPriorityHigh
        @ TRG_SFX_Ghost_Airplane_By_01 ::obj_playstream vol = 200 TR_DistPlane03 dropoff = 2000 priority = StreamPriorityHigh
    )
    wait Random (@ 40 @ 60 @ 90) seconds
    repeat 
endscript


script TR_SFX_GlassShatter 
    playsound HitGlassPane2x pitch = Random (@ 95 @ 100 @ 108)
endscript


script TR_SFX_Koston_Hitting_PhilM 
    RandomNoRepeat (
        @ TRG_G_COUNTER6_PRO ::obj_playstream TR_Koston_Goal_Laugh01 vol = 250
        @ TRG_G_COUNTER6_PRO ::obj_playstream TR_Koston_Goal_Laugh02 vol = 250
        @ TRG_G_COUNTER6_PRO ::obj_playstream TR_Koston_Goal_Laugh03 vol = 250
        @ TRG_G_COUNTER6_PRO ::obj_playstream TR_Koston_Goal_Laugh04 vol = 250
        @ TRG_G_COUNTER6_PRO ::obj_playstream TR_Koston_Goal_Laugh05 vol = 250
    )
endscript


script TR_SFX_GarageOpening 
    printf 'Playing GarageOpening!!!!!'
    PlayStream TR_GarageDoorOpen vol = 200
endscript


script TR_SFX_BreakStoneWall 
    wait 0.5000 seconds
    playsound TR_BreakDownWoodWall
endscript


script TR_SFX_BreakDryWall 
    playsound TR_BreakDownWoodWall vol = 120
endscript

