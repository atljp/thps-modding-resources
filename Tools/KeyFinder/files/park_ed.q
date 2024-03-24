
park_side_to_move = 0
ThemeIndicesA = [1 , 2 , 3 , 4 , 5 , 6 , 7 , 8 , 9 , 10 , 16 , 17 , 19 , 21 , 23 , 24]
ThemeIndicesB = [11 , 12 , 13 , 14 , 15 , 18 , 20 , 22 , 25]

script PlayEdPlaceSound 
    playsound GUI_placeblock1 vol = 60
    
endscript


script PlayEdEraseSound 
    playsound GUI_removeblock1 vol = 60
endscript


script PlayEdBuzzSound 
    playsound GUI_Buzzer01 vol = 60
endscript


script PlayRaiseGroundSound 
    playsound MenuUp pitch = 35
endscript


script PlayLowerGroundSound 
    playsound MenuUp pitch = 24
endscript


script PlayRotatePieceSound 
    playsound menu03 pitch = 55
endscript

