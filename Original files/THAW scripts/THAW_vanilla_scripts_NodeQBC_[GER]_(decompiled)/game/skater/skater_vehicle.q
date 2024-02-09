
script orient_vehicle 
    if Flipped
        flip
    endif
    if BoardIsRotated
        boardrotate
    endif
endscript

script remove_all_anim_subsets 
    Skater_ClothAnimOff
    Skater_ThrowAnimOff
    Skater_SteerAnimOff
endscript
