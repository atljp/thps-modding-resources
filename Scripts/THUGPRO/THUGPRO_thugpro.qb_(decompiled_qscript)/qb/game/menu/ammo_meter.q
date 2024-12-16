
SCRIPT create_ammo_meter 
	IF NOT IsObjectScript 
		script_assert "Needs to be an object script" 
	ENDIF 
	Obj_GetId 
	IF ChecksumEquals a = <objId> b = 0 
		id = 0 
	ELSE 
		id = 1 
	ENDIF 
	pos = PAIR(-16.00000000000, 350.00000000000) 
	scale = PAIR(3.31999993324, 4.71999979019) 
	parent = ( the_score_sprite + <id> ) 
	IF NOT ScreenElementExists id = <parent> 
		RETURN 
	ENDIF 
	get_ammo_meter_name 
	IF ScreenElementExists id = <ammo_meter_name> 
		DestroyScreenElement id = <ammo_meter_name> 
	ENDIF 
	SetScreenElementLock id = <parent> off 
	get_ammo_texture type = <type> 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <parent> 
		id = <ammo_meter_name> 
		texture = <ammo_texture> 
		pos = <pos> 
		just = [ center center ] 
		scale = <scale> 
		rgba = [ 128 128 128 128 ] 
	} 
	GetScreenElementDims id = <id> 
	CreateScreenElement { 
		type = TextElement 
		parent = <ammo_meter_name> 
		local_id = counter 
		text = "0" 
		font = testtitle 
		pos = ( <width> * PAIR(0.15500000119, 0.00000000000) + <height> * PAIR(0.00000000000, 0.12500000000) ) 
		just = [ center center ] 
		scale = 0.89999997616 
		rgba = [ 128 128 128 128 ] 
	} 
	DoScreenElementMorph id = <ammo_meter_name> alpha = 0 time = 0 
ENDSCRIPT

SCRIPT get_ammo_meter_name 
	IF NOT IsObjectScript 
		script_assert "Needs to be an object script" 
	ENDIF 
	Obj_GetId 
	IF ChecksumEquals a = <objId> b = 0 
		id = player1_ammo_display 
	ELSE 
		id = player2_ammo_display 
	ENDIF 
	RETURN ammo_meter_name = <id> 
ENDSCRIPT

SCRIPT get_ammo_texture 
	SWITCH <type> 
		CASE apple 
			ammo_texture = pickup_apple 
		CASE tomato 
			ammo_texture = pickup_tomato 
		CASE paintcan 
			ammo_texture = pickup_spraycan 
		CASE shrimp 
			ammo_texture = pickup_shrimp 
		CASE beads 
			ammo_texture = pickup_beads 
		CASE cocktail 
		CASE smokebomb 
			ammo_texture = pickup_cocktail 
		DEFAULT 
			ammo_texture = white2 
	ENDSWITCH 
	RETURN ammo_texture = <ammo_texture> 
ENDSCRIPT

SCRIPT ammo_meter_change 
	IF NOT GotParam count 
		RETURN 
	ENDIF 
	IF ( <count> = 0 ) 
		RETURN 
	ENDIF 
	IF ( <count> < 0 ) 
		abscount = ( <count> * -1 ) 
		dir = -1 
	ELSE 
		abscount = <count> 
		dir = 1 
	ENDIF 
	GetAmmo 
	index = ( <ammo> - <count> ) 
	timer = ( 1.20000004768 / <abscount> ) 
	get_ammo_meter_name 
	BEGIN 
		IF NOT ScreenElementExists id = <ammo_meter_name> 
			RETURN 
		ENDIF 
		index = ( <index> + <dir> ) 
		IF ( <index> < 0 ) 
			RETURN 
		ENDIF 
		FormatText textname = ammo "%a" a = <index> 
		TerminateObjectsScripts id = <ammo_meter_name> script_name = ammo_meter_increase 
		TerminateObjectsScripts id = <ammo_meter_name> script_name = ammo_meter_decrease 
		IF ( <count> < 0 ) 
			RunScriptOnScreenElement id = <ammo_meter_name> ammo_meter_decrease params = { text = <ammo> index = <index> } 
		ELSE 
			RunScriptOnScreenElement id = <ammo_meter_name> ammo_meter_increase params = { text = <ammo> } 
		ENDIF 
		wait <timer> seconds 
	REPEAT <abscount> 
ENDSCRIPT

SCRIPT ammo_meter_increase 
	GetTags 
	SetScreenElementProps id = { <id> child = counter } text = <text> 
	DoMorph scale = 0 alpha = 1 relative_scale 
	DoMorph scale = 1.50000000000 relative_scale time = 0.20000000298 
	DoMorph scale = 1 relative_scale time = 0.15000000596 
ENDSCRIPT

SCRIPT ammo_meter_decrease 
	GetTags 
	DoMorph scale = 1 alpha = 1 relative_scale 
	DoMorph scale = 0 relative_scale time = 0.15000000596 
	IF NOT ( <index> = 0 ) 
		SetScreenElementProps id = { <id> child = counter } text = <text> 
		DoMorph scale = 1 relative_scale time = 0 
	ENDIF 
ENDSCRIPT


