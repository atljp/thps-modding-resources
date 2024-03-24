
script Default_setup 
    if IsCareerMode
    else
    endif
endscript


script default_startup 
    LoadSound 'Shared\Hits\HitGlassPane2x'
    LoadSound 'Shared\Auto\LA_Skid_11' vol = 100 dropoff = 150
    LoadSound 'Shared\Auto\CarBrakeSqueal' vol = 100 dropoff = 150
    LoadSound 'Shared\Auto\CarHorn_11' vol = 100 dropoff = 150
    LoadSound 'Shared\Hits\HitMetalCan' vol = 100 dropoff = 150 PosUpdateWithDoppler
    LoadSound 'Shared\Hits\BonkBush' vol = 100 dropoff = 0
    LoadSound 'Shared\Auto\CarLoop' vol = 100 dropoff = 150 PosUpdateWithDoppler
    LoadSound 'Vehicles\Vehicle_Tire_Loop'
    LoadSound 'Terrains\BonkMetal_11'
    animload_ped_baha
    animload_Ped_Driver
endscript


script Default_goals 
    if InMultiPlayerGame
        add_multiplayer_mode_goals
    endif
    if NOT InSplitScreenGame
        if NOT GameModeEquals is_singlesession
        endif
    endif
    if NOT InSplitScreenGame
        if NOT GameModeEquals is_singlesession
            if NOT InNetGame
            endif
        endif
    endif
endscript


script tod_script 
    switch <current_tod>
        case Morning
        case day
        case Evening
        case Night
        default 
        printf '### no tod set ###'
    endswitch
endscript

