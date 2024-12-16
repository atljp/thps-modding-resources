
SCRIPT GetSkaterTantrumMeterAnchor 
	IF NOT GotParam ObjId 
		IF NOT IsObjectScript 
			script_assert "Needs to be an object script" 
		ENDIF 
		Obj_GetID 
	ENDIF 
	IF ChecksumEquals a = <ObjId> b = 0 
		id = player1_tantrum_meter 
	ELSE 
		id = player2_tantrum_meter 
	ENDIF 
	RETURN tantrum_meter_anchor = <id> 
ENDSCRIPT

SCRIPT TantrumMessageHide 
	IF ScreenElementExists id = player1_tantrum_meter 
		DoScreenElementMorph id = player1_tantrum_meter scale = 0 time = 0 relative_scale 
	ENDIF 
	IF ScreenElementExists id = player2_tantrum_meter 
		DoScreenElementMorph id = player2_tantrum_meter scale = 0 time = 0 relative_scale 
	ENDIF 
ENDSCRIPT

SCRIPT TantrumMessageKill 
	IF ScreenElementExists id = player1_tantrum_meter 
		DestroyScreenElement id = player1_tantrum_meter 
	ENDIF 
	IF ScreenElementExists id = player2_tantrum_meter 
		DestroyScreenElement id = player2_tantrum_meter 
	ENDIF 
ENDSCRIPT

SCRIPT TantrumMessageShow 
	IF ScreenElementExists id = player1_tantrum_meter 
		DoScreenElementMorph id = player1_tantrum_meter scale = 1 time = 0 relative_scale 
	ENDIF 
	IF ScreenElementExists id = player2_tantrum_meter 
		DoScreenElementMorph id = player2_tantrum_meter scale = 1 time = 0 relative_scale 
	ENDIF 
ENDSCRIPT

SCRIPT tantrum_meter_update_tags 
	GetSkaterTantrumMeterAnchor 
	IF NOT ScreenElementExists id = <tantrum_meter_anchor> 
		RETURN 
	ENDIF 
	<tantrum_meter_anchor> : SetTags { 
		tantrum_heartbeat_frequency = 1 
		tantrum_heartbeat_amplitude = ( ( <spazzfactor> * 0.15000000596 ) + 1.50000000000 ) 
	} 
ENDSCRIPT

SCRIPT tantrum_draw_meter 
	GetSkaterTantrumMeterAnchor 
	IF GotParam die 
		IF ScreenElementExists id = <tantrum_meter_anchor> 
			IF NOT <tantrum_meter_anchor> : GetSingleTag dead 
				<tantrum_meter_anchor> : SetTags dead 
				IF <tantrum_meter_anchor> : GetSingleTag in_the_zone 
					SFX_KILL_HEART_BEAT 
				ENDIF 
				DoScreenElementMorph id = <tantrum_meter_anchor> alpha = 0 time = 0.40000000596 
				RunScriptOnScreenElement id = <tantrum_meter_anchor> panel_message_wait_and_die params = { time = 500 } 
			ENDIF 
		ENDIF 
		RETURN 
	ENDIF 
	IF ScreenElementExists id = <tantrum_meter_anchor> 
		DestroyScreenElement id = <tantrum_meter_anchor> 
	ENDIF 
	SetScreenElementLock id = root_window off 
	scale = 1 
	pos = PAIR(224.50000000000, 130.00000000000) 
	IF InSplitScreenGame 
		Obj_GetID 
		ScriptGetScreenMode 
		SWITCH <screen_mode> 
			CASE split_vertical 
				pos = PAIR(240.00000000000, 130.00000000000) 
				IF ChecksumEquals a = <ObjId> b = 0 
					pos = ( <pos> - PAIR(150.00000000000, 0.00000000000) ) 
				ELSE 
					pos = ( <pos> + PAIR(160.00000000000, 0.00000000000) ) 
				ENDIF 
				scale = 0.80000001192 
			CASE split_horizontal 
				pos = PAIR(240.00000000000, 130.00000000000) 
				IF ChecksumEquals a = <ObjId> b = 0 
					pos = ( <pos> - PAIR(0.00000000000, 60.00000000000) ) 
				ELSE 
					pos = ( <pos> + PAIR(0.00000000000, 160.00000000000) ) 
				ENDIF 
				scale = 0.80000001192 
		ENDSWITCH 
	ENDIF 
	CreateScreenElement { 
		type = ContainerElement 
		parent = root_window 
		id = <tantrum_meter_anchor> 
		pos = <pos> 
		scale = <scale> 
		just = [ left center ] 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <tantrum_meter_anchor> 
		rgba = [ 128 128 128 128 ] 
		pos = PAIR(0.00000000000, 0.00000000000) 
		just = [ left center ] 
		scale = PAIR(12.00000000000, 1.00000000000) 
		texture = spazzbody 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <tantrum_meter_anchor> 
		rgba = [ 128 128 128 128 ] 
		pos = PAIR(191.00000000000, 0.00000000000) 
		just = [ left center ] 
		scale = 1 
		texture = spazztip 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <tantrum_meter_anchor> 
		rgba = ( ( THUGPRO_GlobalThemeInfo ) . BG_PARTS_COLOR ) 
		pos = PAIR(0.00000000000, -14.00000000000) 
		just = [ center center ] 
		scale = PAIR(1.20000004768, 1.00000000000) 
		texture = heart 
		z_priority = 20 
	} 
	IF IsXbox 
		freak_text = "press \\m2 to freak out" 
	ELSE 
		freak_text = "hit \\m2 to freak out" 
	ENDIF 
	CreateScreenElement { 
		type = TextElement 
		parent = <tantrum_meter_anchor> 
		text = <freak_text> 
		rgba = [ 128 128 128 80 ] 
		pos = PAIR(15.00000000000, 21.00000000000) 
		just = [ left center ] 
		scale = 1 
		font = small 
		z_priority = 30 
		shadow 
		shadow_rgba = UI_text_shadow_color 
		shadow_offs = UI_text_shadow_offset 
	} 
	DoScreenElementMorph id = <tantrum_meter_anchor> alpha = 0 time = 0 
	DoScreenElementMorph id = <tantrum_meter_anchor> alpha = 1 time = 0.10000000149 
	<tantrum_meter_anchor> : SetTags { 
		tantrum_heartbeat_amplitude = 1.50000000000 
		tantrum_heartbeat_frequency = 0 
	} 
	RunScriptOnScreenElement id = <tantrum_meter_anchor> tantrum_heartbeat 
ENDSCRIPT

SCRIPT tantrum_meter_maybe_play_sound 
	GetSkaterTantrumMeterAnchor 
	IF ScreenElementExists id = <tantrum_meter_anchor> 
		IF NOT <tantrum_meter_anchor> : GetSingleTag dead 
			IF NOT <tantrum_meter_anchor> : GetSingleTag in_the_zone 
				<tantrum_meter_anchor> : GetSingleTag sound_pitch 
				Playsound SK6_Menu_Move vol = 150 pitch = <sound_pitch> 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT tantrum_heartbeat_beat 
	DoMorph alpha = 0 time = 0 
	DoMorph alpha = 0.30000001192 scale = <tantrum_heartbeat_amplitude> relative_scale time = 0.30000001192 pos = PAIR(0.00000000000, -20.00000000000) 
	DoMorph alpha = 0 scale = 1 relative_scale time = 0.20000000298 
	die 
ENDSCRIPT

SCRIPT tantrum_heartbeat 
	GetSingleTag id 
	anchor = <id> 
	counter = 0 
	BEGIN 
		GetSingleTag tantrum_heartbeat_frequency 
		tantrum_heartbeat_frequency = ( <tantrum_heartbeat_frequency> + 1 ) 
		IF ( <tantrum_heartbeat_frequency> > 40 ) 
			tantrum_heartbeat_frequency = 40 
		ENDIF 
		IF ( <tantrum_heartbeat_frequency> < 5 ) 
			tantrum_heartbeat_frequency = 5 
		ENDIF 
		SetTags tantrum_heartbeat_frequency = <tantrum_heartbeat_frequency> 
		IF ( <counter> > <tantrum_heartbeat_frequency> ) 
			counter = 0 
			SetScreenElementLock id = <anchor> off 
			CreateScreenElement { 
				type = SpriteElement 
				parent = <anchor> 
				rgba = ( ( THUGPRO_GlobalThemeInfo ) . BG_PARTS_COLOR ) 
				pos = PAIR(0.00000000000, -14.00000000000) 
				just = [ center center ] 
				scale = PAIR(1.20000004768, 1.00000000000) 
				texture = heart 
				z_priority = 15 
			} 
			GetSingleTag tantrum_heartbeat_amplitude 
			RunScriptOnScreenElement id = <id> tantrum_heartbeat_beat params = { tantrum_heartbeat_amplitude = <tantrum_heartbeat_amplitude> } 
		ENDIF 
		counter = ( <counter> + 1 ) 
		wait 1 gameframes 
	REPEAT 
ENDSCRIPT

SCRIPT tantrum_explosion_explode 
	DoMorph alpha = 0 time = 0 
	DoMorph alpha = 0.50000000000 scale = 2.50000000000 relative_scale time = 0.05000000075 rot_angle = 0 
	DoMorph alpha = 0.30000001192 scale = 3.50000000000 relative_scale time = 0.30000001192 rot_angle = 25 
	DoMorph alpha = 0 time = 0.20000000298 scale = 4 rot_angle = 40 
	die 
ENDSCRIPT

SCRIPT tantrum_explosion 
	GetSkaterTantrumMeterAnchor 
	IF NOT ScreenElementExists id = <tantrum_meter_anchor> 
		RETURN 
	ENDIF 
	SetScreenElementLock id = <tantrum_meter_anchor> off 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <tantrum_meter_anchor> 
		rgba = [ 128 128 30 128 ] 
		pos = PAIR(191.00000000000, 0.00000000000) 
		just = [ center center ] 
		scale = 1 
		texture = spazzburst 
		z_priority = -10 
	} 
	RunScriptOnScreenElement id = <id> tantrum_explosion_explode 
	wait 0.20000000298 seconds 
	IF NOT ScreenElementExists id = <tantrum_meter_anchor> 
		RETURN 
	ENDIF 
	SetScreenElementLock id = <tantrum_meter_anchor> off 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <tantrum_meter_anchor> 
		rgba = [ 128 128 30 128 ] 
		pos = PAIR(191.00000000000, 0.00000000000) 
		just = [ center center ] 
		scale = 1 
		texture = spazzburst 
		z_priority = -10 
	} 
	RunScriptOnScreenElement id = <id> tantrum_explosion_explode 
ENDSCRIPT

SCRIPT tantrum_draw_and_update_spazzfactors { min = 3.00000000000 
		max = 7.50000000000 
		start_pos = PAIR(0.00000000000, 0.00000000000) 
		end_pos = PAIR(200.00000000000, 0.00000000000) 
	} 
	GetSkaterTantrumMeterAnchor 
	GetArraySize tantrum_array 
	spazz_interval = ( ( <max> - <min> ) / ( <array_size> -1.00000000000 ) ) 
	begin_pos = ( ( <end_pos> / <max> ) * <min> ) 
	draw_interval = ( ( <end_pos> - <begin_pos> ) / ( <array_size> -1.00000000000 ) ) 
	<local_array> = tantrum_array 
	index = 0 
	BEGIN 
		SetArrayElement ArrayName = local_array index = <index> newvalue = { name = ( ( tantrum_array [ <index> ] ) . name ) 
			spazzfactor = ( <index> * <spazz_interval> + <min> ) 
		} 
		IF NOT ( <index> = ( <array_size> -1 ) ) 
			CreateScreenElement { 
				type = SpriteElement 
				parent = <tantrum_meter_anchor> 
				rgba = [ 128 128 128 128 ] 
				pos = ( <index> * <draw_interval> + <begin_pos> ) 
				just = [ center center ] 
				scale = 1 
				texture = spazznotch 
				z_priority = 30 
			} 
		ENDIF 
		index = ( <index> + 1 ) 
	REPEAT <array_size> 
ENDSCRIPT

SCRIPT GetHighestTantrumReached 
	IF NOT GotParam spazzfactor 
		RETURN 
	ENDIF 
	GetArraySize tantrum_array 
	index = ( <array_size> -1 ) 
	BEGIN 
		IF NOT ( <spazzfactor> < ( ( tantrum_array [ <index> ] ) . spazzfactor ) ) 
			RETURN tantrum = <index> 
		ENDIF 
		index = ( <index> - 1 ) 
	REPEAT <array_size> 
	RETURN tantrum = -1 
ENDSCRIPT

SCRIPT tantrum_update_meter current = 5 max = 10 
	GetSkaterTantrumMeterAnchor 
	IF NOT ScreenElementExists id = <tantrum_meter_anchor> 
		RETURN 
	ENDIF 
	IF <tantrum_meter_anchor> : GetSingleTag dead 
		RETURN 
	ENDIF 
	percent = ( ( <current> / <max> ) * 100 ) 
	IF NOT ScreenElementExists id = { <tantrum_meter_anchor> child = spazz_blood } 
		SetScreenElementLock id = <tantrum_meter_anchor> off 
		CreateScreenElement { 
			type = SpriteElement 
			parent = <tantrum_meter_anchor> 
			local_id = spazz_blood 
			rgba = ( ( THUGPRO_GlobalThemeInfo ) . BG_PARTS_COLOR ) 
			pos = PAIR(0.00000000000, 0.00000000000) 
			just = [ left center ] 
			scale = 1 
			texture = blood 
			z_priority = 10 
		} 
		CreateScreenElement { 
			type = SpriteElement 
			parent = <tantrum_meter_anchor> 
			local_id = spazz_blood_tip 
			rgba = ( ( THUGPRO_GlobalThemeInfo ) . BG_PARTS_COLOR ) 
			pos = PAIR(191.00000000000, 0.00000000000) 
			just = [ right center ] 
			scale = PAIR(1.00000000000, 0.89999997616) 
			texture = bloodtip 
			z_priority = 11 
		} 
	ENDIF 
	IF ( <current> > ( tantrum_array [ 0 ] . spazzfactor ) ) 
		IF NOT <tantrum_meter_anchor> : GetSingleTag in_the_zone 
			<tantrum_meter_anchor> : Obj_SpawnScript SFX_TANTRUM_THERM_RANGE 
			<tantrum_meter_anchor> : SetTags in_the_zone 
		ENDIF 
	ELSE 
		IF <tantrum_meter_anchor> : GetSingleTag in_the_zone 
			<tantrum_meter_anchor> : SFX_KILL_HEART_BEAT 
		ENDIF 
		<tantrum_meter_anchor> : RemoveTags tags = [ in_the_zone ] 
		<tantrum_meter_anchor> : SetTags sound_pitch = ( ( <current> * 8 ) + 80 ) 
	ENDIF 
	IF GotParam maxedOut 
		percent = 100 
		IF NOT <tantrum_meter_anchor> : GetSingleTag tantrum_explosion_tripped 
			<tantrum_meter_anchor> : SetTags tantrum_explosion_tripped 
			tantrum_explosion 
		ENDIF 
	ELSE 
		<tantrum_meter_anchor> : RemoveTags tags = [ tantrum_explosion_tripped ] 
		IF ( <percent> < 0 ) 
			percent = 0 
		ENDIF 
	ENDIF 
	DoScreenElementMorph id = { <tantrum_meter_anchor> child = spazz_blood } scale = ( <percent> * PAIR(0.12200000137, 0.00000000000) + PAIR(0.00000000000, 0.89999997616) ) time = 0 
	DoScreenElementMorph id = { <tantrum_meter_anchor> child = spazz_blood_tip } pos = ( <percent> * PAIR(2.02999997139, 0.00000000000) ) time = 0 
ENDSCRIPT

SCRIPT SFX_TANTRUM_THERM_RANGE 
	printf "Playing Heart Beat while above spazz line!" 
	BEGIN 
		Playsound SK6_BulletHeart_11 pitch = 150 vol = 150 
		wait 0.34999999404 seconds 
	REPEAT 
ENDSCRIPT

SCRIPT SFX_KILL_HEART_BEAT 
	printf "Killing Heart Beat - dropped below, or ended animation" 
	Obj_KillSpawnedScript name = SFX_TANTRUM_THERM_RANGE 
ENDSCRIPT


