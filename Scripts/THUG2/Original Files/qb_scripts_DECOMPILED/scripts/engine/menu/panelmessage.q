
SCRIPT kill_panel_message_if_it_exists 
	IF ScreenElementExists id = <id> 
		DestroyScreenElement id = <id> 
	ENDIF 
ENDSCRIPT

SCRIPT kill_panel_messages 
	kill_panel_message_if_it_exists id = panel_message_layer 
ENDSCRIPT

SCRIPT hide_panel_messages 
	IF ScreenElementExists id = panel_message_layer 
		DoScreenElementMorph id = panel_message_layer alpha = 0 
	ENDIF 
ENDSCRIPT

SCRIPT show_panel_messages 
	IF ScreenElementExists id = panel_message_layer 
		DoScreenElementMorph id = panel_message_layer alpha = 1 
	ENDIF 
ENDSCRIPT

SCRIPT create_panel_message_layer_if_needed 
	IF NOT ScreenElementExists id = panel_message_layer 
		SetScreenElementLock id = root_window off 
		CreateScreenElement { 
			type = ContainerElement 
			parent = root_window 
			id = panel_message_layer 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT create_panel_message { text = "Default panel message" 
		pos = PAIR(320.00000000000, 70.00000000000) 
		rgba = [ 144 32 32 100 ] 
		font_face = testtitle 
		time = 1500 
		z_priority = -5 
		just = [ center center ] 
		parent = panel_message_layer 
	} 
	IF GotParam id 
		kill_panel_message_if_it_exists id = <id> 
	ENDIF 
	create_panel_message_layer_if_needed 
	SetScreenElementLock id = <parent> off 
	CreateScreenElement { 
		type = textelement 
		parent = <parent> 
		id = <id> 
		font = <font_face> 
		text = <text> 
		scale = 1 
		pos = <pos> 
		just = <just> 
		rgba = <rgba> 
		z_priority = <z_priority> 
		not_focusable 
	} 
	IF GotParam style 
		IF GotParam params 
			RunScriptOnScreenElement id = <id> <style> params = <params> 
		ELSE 
			RunScriptOnScreenElement id = <id> <style> params = <...> 
		ENDIF 
	ELSE 
		RunScriptOnScreenElement id = <id> panel_message_wait_and_die params = { time = <time> } 
	ENDIF 
ENDSCRIPT

SCRIPT create_panel_sprite { pos = PAIR(320.00000000000, 60.00000000000) 
		rgba = [ 128 128 128 100 ] 
		z_priority = -5 
		parent = panel_message_layer 
	} 
	IF GotParam id 
		IF ScreenElementExists id = <id> 
			RunScriptOnScreenElement id = <id> kill_panel_message 
		ENDIF 
	ENDIF 
	create_panel_message_layer_if_needed 
	SetScreenElementLock id = <parent> off 
	CreateScreenElement { 
		type = spriteelement 
		parent = <parent> 
		texture = <texture> 
		id = <id> 
		scale = 1 
		pos = <pos> 
		just = [ center center ] 
		rgba = <rgba> 
		z_priority = <z_priority> 
	} 
	IF GotParam style 
		IF GotParam params 
			RunScriptOnScreenElement id = <id> <style> params = <params> 
		ELSE 
			RunScriptOnScreenElement id = <id> <style> params = <...> 
		ENDIF 
	ELSE 
		IF GotParam time 
			RunScriptOnScreenElement id = <id> panel_message_wait_and_die params = { time = <time> } 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT create_panel_block { text = "Default panel message" 
		pos = PAIR(320.00000000000, 60.00000000000) 
		dims = PAIR(250.00000000000, 0.00000000000) 
		rgba = [ 144 32 32 100 ] 
		font_face = small 
		time = 2000 
		just = [ center center ] 
		internal_just = [ center center ] 
		z_priority = -5 
		scale = 1 
		parent = panel_message_layer 
	} 
	create_panel_message_layer_if_needed 
	SetScreenElementLock id = <parent> off 
	IF GotParam id 
		IF ScreenElementExists id = <id> 
			DestroyScreenElement id = <id> 
		ENDIF 
	ENDIF 
	CreateScreenElement { 
		type = TextBlockElement 
		parent = <parent> 
		id = <id> 
		font = <font_face> 
		text = <text> 
		dims = <dims> 
		pos = <pos> 
		just = <just> 
		internal_just = <internal_just> 
		line_spacing = <line_spacing> 
		rgba = <rgba> 
		scale = <scale> 
		shadow 
		shadow_rgba = UI_text_shadow_color 
		shadow_offs = UI_text_shadow_offset 
		allow_expansion 
		z_priority = <z_priority> 
	} 
	IF GotParam style 
		IF GotParam params 
			RunScriptOnScreenElement id = <id> <style> params = <params> 
		ELSE 
			RunScriptOnScreenElement id = <id> <style> params = <...> 
		ENDIF 
	ELSE 
		RunScriptOnScreenElement id = <id> panel_message_wait_and_die params = { time = <time> } 
	ENDIF 
ENDSCRIPT

SCRIPT create_intro_panel_block { text = "Default intro panel message" 
		pos = PAIR(320.00000000000, 60.00000000000) 
		dims = PAIR(250.00000000000, 0.00000000000) 
		rgba = [ 144 32 32 100 ] 
		font_face = small 
		time = 2000 
		just = [ center center ] 
		internal_just = [ center center ] 
		z_priority = -5 
		scale = 1 
		parent = panel_message_layer 
	} 
	create_panel_message_layer_if_needed 
	SetScreenElementLock id = <parent> off 
	IF GotParam id 
		IF ScreenElementExists id = <id> 
			DestroyScreenElement id = <id> 
		ENDIF 
	ENDIF 
	CreateScreenElement { 
		type = ContainerElement 
		parent = <parent> 
		id = <id> 
		pos = PAIR(0.00000000000, 0.00000000000) 
	} 
	<the_id> = <id> 
	CreateScreenElement { 
		type = TextBlockElement 
		parent = <the_id> 
		font = <font_face> 
		text = <text> 
		dims = <dims> 
		pos = <pos> 
		just = <just> 
		internal_just = <internal_just> 
		line_spacing = <line_spacing> 
		rgba = <rgba> 
		scale = <scale> 
		shadow 
		shadow_rgba = UI_text_shadow_color 
		shadow_offs = UI_text_shadow_offset 
		allow_expansion 
		z_priority = ( <z_priority> + 3 ) 
	} 
	Theme_GetAltColor return_value = grad_color 
	IF GotParam create_bg 
		CreateScreenElement { 
			type = spriteelement 
			parent = <the_id> 
			texture = goal_grad 
			pos = ( <pos> + PAIR(300.00000000000, 0.00000000000) ) 
			scale = PAIR(21.00000000000, 10.00000000000) 
			just = [ center center ] 
			rgba = <grad_color> 
			alpha = 0.40000000596 
			z_priority = ( <z_priority> + 1 ) 
		} 
		CreateScreenElement { 
			type = spriteelement 
			parent = <the_id> 
			texture = goal_grad 
			pos = ( <pos> + PAIR(300.00000000000, -20.00000000000) ) 
			scale = PAIR(21.00000000000, 1.00000000000) 
			just = [ center center ] 
			rgba = <grad_color> 
			alpha = 0.60000002384 
			z_priority = ( <z_priority> + 1 ) 
		} 
		CreateScreenElement { 
			type = spriteelement 
			parent = <the_id> 
			texture = goal_grad 
			pos = ( <pos> + PAIR(300.00000000000, 20.00000000000) ) 
			scale = PAIR(21.00000000000, 1.00000000000) 
			just = [ center center ] 
			rgba = <grad_color> 
			alpha = 0.60000002384 
			flip_v 
			z_priority = ( <z_priority> + 1 ) 
		} 
		CreateScreenElement { 
			type = spriteelement 
			parent = <the_id> 
			pos = ( <pos> + PAIR(320.00000000000, 0.00000000000) ) 
			just = [ center center ] 
			scale = PAIR(13.00000000000, 1.00000000000) 
			texture = roundbar_middle 
			z_priority = ( <z_priority> + 2 ) 
			rgba = [ 128 128 128 20 ] 
		} 
		GetScreenElementPosition id = <id> 
		GetScreenElementDims id = <id> 
		CreateScreenElement { 
			type = spriteelement 
			parent = <the_id> 
			pos = ( <ScreenElementPos> + PAIR(-16.00000000000, 16.00000000000) ) 
			just = [ center center ] 
			scale = 1 
			texture = roundbar_tip_left 
			z_priority = ( <z_priority> + 2 ) 
			rgba = [ 128 128 128 20 ] 
		} 
		CreateScreenElement { 
			type = spriteelement 
			parent = <the_id> 
			pos = ( <ScreenElementPos> + <width> * PAIR(1.00000000000, 0.00000000000) + PAIR(16.00000000000, 16.00000000000) ) 
			just = [ center center ] 
			scale = 1 
			texture = roundbar_tip_right 
			z_priority = ( <z_priority> + 2 ) 
			rgba = [ 128 128 128 20 ] 
		} 
	ENDIF 
	IF GotParam style 
		IF GotParam params 
			RunScriptOnScreenElement id = <the_id> <style> params = <params> 
		ELSE 
			RunScriptOnScreenElement id = <the_id> <style> params = <...> 
		ENDIF 
	ELSE 
		RunScriptOnScreenElement id = <the_id> panel_message_wait_and_die params = { time = <time> } 
	ENDIF 
ENDSCRIPT

SCRIPT panel_message_wait_and_die time = 1500 
	wait <time> 
	Die 
ENDSCRIPT

SCRIPT kill_panel_message 
	Die 
ENDSCRIPT

SCRIPT hide_panel_message 
	IF ScreenElementExists id = <id> 
		SetScreenElementProps { 
			id = <id> 
			hide 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT show_panel_message 
	IF ScreenElementExists id = <id> 
		SetScreenElementProps { 
			id = <id> 
			unhide 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT destroy_panel_message 
	IF ScreenElementExists id = <id> 
		<id> : Die 
	ENDIF 
ENDSCRIPT


