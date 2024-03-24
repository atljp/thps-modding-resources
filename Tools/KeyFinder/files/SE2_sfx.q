

script SE2_LoadingSounds 
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
    LoadSound 'SE\SK6_SE_ConveyorLoop'
    LoadSound 'SE\SK6_SE_HologramLoop'
    if (debugsoundfx = 1)
        DumpHeaps
    endif
endscript


script SE2_SFX_DistPlanes 
    wait 6 seconds
    begin 
    if NOT IsStreamPlaying EXTDistPlane
        Random (
            @ TRG_SFX_Ghost_DistPlane01 ::obj_playstream Random (@ ST_MtlBox_ServoBeeps01 @ ST_MtlBox_ServoBeeps02 @ ST_MtlBox_ServoBeeps03 @ ST_MtlBox_ServoBeeps04) vol = 200 dropoff = 800 id = EXTDistPlane
            @ TRG_SFX_Ghost_DistPlane02 ::obj_playstream Random (@ ST_MtlBox_ServoBeeps01 @ ST_MtlBox_ServoBeeps02 @ ST_MtlBox_ServoBeeps03 @ ST_MtlBox_ServoBeeps04) vol = 200 dropoff = 800 id = EXTDistPlane
            @ TRG_SFX_Ghost_DistPlane03 ::obj_playstream Random (@ ST_MtlBox_ServoBeeps01 @ ST_MtlBox_ServoBeeps02 @ ST_MtlBox_ServoBeeps03 @ ST_MtlBox_ServoBeeps04) vol = 200 dropoff = 800 id = EXTDistPlane
            @ TRG_SFX_Ghost_DistPlane04 ::obj_playstream Random (@ ST_MtlBox_ServoBeeps01 @ ST_MtlBox_ServoBeeps02 @ ST_MtlBox_ServoBeeps03 @ ST_MtlBox_ServoBeeps04) vol = 200 dropoff = 800 id = EXTDistPlane
        )
    endif
    wait 1 second
    repeat 
endscript


script SE2_SFX_TurbineVent01 
    if NOT InNetGame
        obj_playsound SK6_SE_ConveyorLoop emitter = TRG_SFX_SOB_TurbineVent01
    endif
endscript


script SE2_SFX_TurbineVent02 
    if NOT InNetGame
        obj_playsound SK6_SE_ConveyorLoop emitter = TRG_SFX_SOB_TurbineVent02
    endif
endscript


script SE2_SFX_UFO_Lip 
    obj_playsound SK6_SE_HologramLoop vol = 250 pitch = 70 emitter = TRG_SFX_SOB_UFO_Lip
endscript


script SE2_SFX_UFO01 
    obj_playsound SK6_SE_HologramLoop vol = 250 pitch = 70 emitter = TRG_SFX_SOB_UFO01
endscript


script SE2_SFX_UFO02 
    obj_playsound SK6_SE_HologramLoop vol = 250 pitch = 70 emitter = TRG_SFX_SOB_UFO02
endscript


script SE2_SFX_MainRoom 
    begin 
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
    wait 1 second
    repeat 
endscript

