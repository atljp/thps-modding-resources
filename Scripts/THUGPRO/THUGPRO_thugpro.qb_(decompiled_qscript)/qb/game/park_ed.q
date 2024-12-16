
park_side_to_move = 0 
SCRIPT PlayEdPlaceSound 
	PlaySound GUI_placeblock1 vol = 60 
	printf "Play Place Sound" 
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


