
park_side_to_move = 0 
ThemeIndicesA = [ 1 , 2 , 3 , 4 , 5 , 6 , 7 , 8 , 9 , 10 , 16 , 17 , 19 , 21 , 23 , 24 ] 
ThemeIndicesB = [ 11 , 12 , 13 , 14 , 15 , 18 , 20 , 22 , 25 ] 
SCRIPT PlayEdPlaceSound 
	PlaySound GUI_placeblock1 vol = 60 
	
ENDSCRIPT

SCRIPT PlayEdEraseSound 
	PlaySound GUI_removeblock1 vol = 60 
ENDSCRIPT

SCRIPT PlayEdBuzzSound 
	PlaySound GUI_buzzer01 vol = 60 
ENDSCRIPT

SCRIPT PlayRaiseGroundSound 
	PlaySound MenuUp pitch = 35 
ENDSCRIPT

SCRIPT PlayLowerGroundSound 
	PlaySound MenuUp pitch = 24 
ENDSCRIPT

SCRIPT PlayRotatePieceSound 
	PlaySound menu03 pitch = 55 
ENDSCRIPT


