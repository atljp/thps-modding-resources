
script Play_BikeSFX_Brake 
    StopBikeLoopingSounds
    obj_spawnscriptnow \{ Brake_SFX_Instance_Limiting }
endscript

script Brake_SFX_Instance_Limiting 
    SetSpawnedScriptNoRepeatFor \{ time = 0.6000 }
    SetSpawnInstanceLimits \{ max = 2 management = kill_oldest }
    obj_playsound Bmx_Brake_01 vol = randomrange (20.0, 50.0) pitch = randomrange (100.0, 140.0)
endscript

script Play_BikeSFX_Skid 
    obj_playsound Bmx_Skid_01 vol = randomrange (70.0, 100.0) pitch = randomrange (100.0, 120.0)
endscript

script Play_BikeSFX_Bike_Fall 
    obj_playsound Bmx_Fall_02 vol = randomrange (100.0, 140.0) pitch = randomrange (80.0, 120.0)
endscript

script bike_play_looping_sounds 
    new_sound = None
    last_sound = None
    last_speed = 0
    begin 
    if NOT IsSkaterOnBike
        StopBikeLoopingSounds
        return 
    endif
    getspeed
    if ((<Speed> < 100)& ((<last_speed> > <Speed>)|| (<last_speed> = <Speed>)))
        new_sound = None
    else
        if IsInBail
            new_sound = None
        else
            if InAir
                new_sound = freewheel
            else
                if onwall
                    new_sound = Wall
                else
                    if NOT OnGround
                        new_sound = None
                    else
                        if braking
                            new_sound = Brake
                        else
                            if BikeInManual
                                if GotParam nose
                                    new_sound = None
                                else
                                    new_sound = freewheel
                                endif
                                RemoveParameter nose
                            else
                                if backwards
                                    new_sound = pedal
                                else
                                    if ((bike_pedaling + 0)= 0)
                                        new_sound = freewheel
                                    else
                                        new_sound = pedal
                                    endif
                                endif
                            endif
                        endif
                    endif
                endif
            endif
        endif
    endif
    if NOT (<new_sound> = <last_sound>)
        switch <new_sound>
            case freewheel
            Play_BikeSFX_Freewheel
            case pedal
            Play_BikeSFX_Pedal
            case Brake
            Play_BikeSFX_Brake
            case Wall
            Play_BikeSFX_Freewheel
            default 
            StopBikeLoopingSounds
        endswitch
    else
        switch <new_sound>
            case freewheel
            if OnGround
                GetBikeLoopingPitch
                obj_adjustsound Bmx_Freewheel pitchpercent = <pitch> pitchStep = 1.500
            endif
            case Wall
            GetBikeLoopingPitch
            obj_adjustsound Bmx_Freewheel pitchpercent = <pitch> pitchStep = 1.500
            case pedal
            GetBikeLoopingPitch
            obj_adjustsound Bmx_pedal_loop pitchpercent = <pitch> pitchStep = 1.500
            default 
        endswitch
    endif
    last_sound = <new_sound>
    last_speed = <Speed>
    wait 1 gameframe
    repeat 
endscript

script StopBikeLoopingSounds 
    obj_stopsound \{ Bmx_pedal_on }
    obj_stopsound \{ Bmx_pedal_loop }
    obj_stopsound \{ Bmx_Freewheel }
    obj_stopsound \{ SK6_BoardRollIn01_11 }
endscript

script Play_BikeSFX_Pedal_on 
    obj_spawnscriptnow \{ Bike_SFX_Pedal_On_Instance_Limiting }
endscript

script Bike_SFX_Pedal_On_Instance_Limiting 
    SetSpawnedScriptNoRepeatFor \{ time = 0.6000 }
    SetSpawnInstanceLimits \{ max = 2 management = kill_oldest }
    obj_playsound \{ Bmx_pedal_on vol = 100 }
endscript

script Play_BikeSFX_Pedal 
    obj_stopsound \{ Bmx_Freewheel }
    obj_stopsound \{ SK6_BoardRollIn01_11 }
    Play_BikeSFX_Pedal_on
    wait \{ 0.1000 seconds }
    GetBikeLoopingPitch
    obj_playsound Bmx_pedal_loop vol = 25 pitch = <pitch>
endscript

script Play_BikeSFX_Freewheel 
    obj_stopsound \{ Bmx_pedal_on }
    obj_stopsound \{ Bmx_pedal_loop }
    GetBikeLoopingPitch
    if onwall
        obj_playsound SK6_BoardRollIn01_11 vol = 100 pitch = <pitch>
    endif
    obj_playsound Bmx_Freewheel vol = 18 pitch = <pitch>
endscript

script GetBikeLoopingPitch 
    getspeed
    return pitch = ((<Speed> / 18)+ 100)
endscript
