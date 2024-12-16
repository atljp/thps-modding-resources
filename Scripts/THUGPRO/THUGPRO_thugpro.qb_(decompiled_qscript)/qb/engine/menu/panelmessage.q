
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

SCRIPT create_panel_message { 
		text = "Default panel message" 
		parent = panel_message_layer 
		pos = PAIR(320.00000000000, 70.00000000000) 
		rgba = [ 144 32 32 100 ] 
		time = 1500 
		z_priority = -5 
		just = [ center center ] 
		scale = 0.25000000000 
	} 
	IF NOT GotParam font_face 
		<font_face> = ( ( THUGPRO_GlobalThemeInfo ) . PANEL_MESSAGE_FONT ) 
	ENDIF 
	IF GotParam id 
		kill_panel_message_if_it_exists id = <id> 
	ENDIF 
	IF GotParam id 
		SWITCH <id> 
			CASE leaving_message 
				IF LevelIs Load_CA 
					<style> = panel_message_death 
				ELSE 
					<style> = panel_message_teleport 
					<scale> = 0.25000000000 
				ENDIF 
			CASE message_rock 
				<style> = scoreboard_small_style_thugpro 
			CASE message_panels_broken 
				<style> = style_NO_broken_panel_thugpro 
			CASE message_skulls 
				<style> = style_NO_smoked_thugpro 
			CASE message_skulls2 
				<style> = style_NO_smoked_thugpro 
			CASE message_skulltime 
				IF ChecksumEquals a = <style> b = style_NO_skulltimer2 
					<style> = style_NO_skulltimer2_thugpro 
				ELSE 
					<style> = style_NO_skulltimer_thugpro 
				ENDIF 
		ENDSWITCH 
	ENDIF 
	IF GotParam shadow 
		<shadow> = shadow 
		<shadow_offs> = PAIR(0.50000000000, 0.50000000000) 
		<shadow_rgba> = [ 30 30 30 100 ] 
	ENDIF 
	create_panel_message_layer_if_needed 
	SetScreenElementLock id = <parent> off 
	CreateScreenElement { 
		type = textelement 
		parent = <parent> 
		id = <id> 
		font = <font_face> 
		text = <text> 
		scale = <scale> 
		pos = <pos> 
		just = <just> 
		rgba = <rgba> 
		z_priority = <z_priority> 
		not_focusable 
		<shadow> 
		shadow_offs = <shadow_offs> 
		shadow_rgba = <shadow_rgba> 
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

SCRIPT create_panel_block { 
		text = "Default panel message" 
		pos = PAIR(320.00000000000, 60.00000000000) 
		dims = PAIR(250.00000000000, 0.00000000000) 
		rgba = [ 144 32 32 100 ] 
		time = 2000 
		just = [ center center ] 
		internal_just = [ center center ] 
		z_priority = -5 
		scale = 0.25000000000 
		parent = panel_message_layer 
		shadow = shadow 
	} 
	IF NOT GotParam font_face 
		<font_face> = ( ( THUGPRO_GlobalThemeInfo ) . PANEL_MESSAGE_FONT ) 
	ENDIF 
	create_panel_message_layer_if_needed 
	SetScreenElementLock id = <parent> off 
	IF GotParam id 
		IF ScreenElementExists id = <id> 
			DestroyScreenElement id = <id> 
		ENDIF 
	ENDIF 
	<internal_scale> = 1.00000000000 
	IF LevelIs Load_LA 
		<andy_message_ids> = [ Earthquake_text Earthquake_text1 Earthquake_text2 Earthquake_text11 ] 
		IF ArrayContains array = <andy_message_ids> contains = <id> 
			<internal_scale> = <scale> 
		ENDIF 
	ENDIF 
	IF LevelIs Load_AP 
		IF ( <id> = InteriorTest ) 
			<style> = airport_flag_style_thugpro 
			<pos> = PAIR(320.00000000000, 60.00000000000) 
			<dims> = PAIR(800.00000000000, 25.00000000000) 
		ENDIF 
	ENDIF 
	IF LevelIs Load_PH 
		IF ( <id> = scoreboard ) 
			<style> = scoreboard_small_style_thugpro 
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
		internal_scale = <internal_scale> 
		<shadow> 
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
		scale = 1.00000000000 
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

SCRIPT scoreboard_small_style_thugpro 
	pos = PAIR(20.00000000000, 10.00000000000) 
	DoMorph scale = 1.20000004768 relative_scale 
	BEGIN 
		DoMorph time = 0.10000000149 pos = PAIR(320.00000000000, 290.00000000000) 
		DoMorph time = 0.10000000149 pos = PAIR(320.00000000000, 280.00000000000) 
		rgba = { 255 , 255 , 255 , 128 } 
	REPEAT 10 
	Die 
ENDSCRIPT

SCRIPT airport_flag_style_thugpro 
	pos = PAIR(20.00000000000, 10.00000000000) 
	DoMorph scale = 1.20000004768 relative_scale 
	BEGIN 
		DoMorph time = 0.10000000149 pos = PAIR(320.00000000000, 290.00000000000) 
		DoMorph time = 0.10000000149 pos = PAIR(320.00000000000, 280.00000000000) 
		rgba = { 255 , 255 , 255 , 128 } 
	REPEAT 4 
	Die 
ENDSCRIPT

SCRIPT style_NO_broken_panel_thugpro 
	SWITCH jm_panels_broken 
		CASE 1 
			SetProps just = [ center center ] rgba = [ 120 120 0 255 ] 
			DoMorph time = 0.20000000298 pos = PAIR(320.00000000000, 80.00000000000) scale = 1.50000000000 alpha = 0.80000001192 relative_scale 
			DoMorph time = 0.10000000149 scale = 1.20000004768 alpha = 1 relative_scale 
			wait 0.69999998808 seconds 
			DoMorph time = 0.10000000149 scale = 0 alpha = 0 relative_scale 
		CASE 2 
			SetProps just = [ center center ] rgba = [ 140 100 0 255 ] 
			DoMorph time = 0.20000000298 pos = PAIR(320.00000000000, 80.00000000000) scale = 1.50000000000 alpha = 0.80000001192 relative_scale 
			DoMorph time = 0.10000000149 scale = 1.20000004768 alpha = 1 relative_scale 
			wait 0.69999998808 seconds 
			DoMorph time = 0.10000000149 scale = 0 alpha = 0 relative_scale 
		CASE 3 
			SetProps just = [ center center ] rgba = [ 160 80 0 255 ] 
			DoMorph time = 0.20000000298 pos = PAIR(320.00000000000, 80.00000000000) scale = 1.50000000000 alpha = 0.80000001192 relative_scale 
			DoMorph time = 0.10000000149 scale = 1.20000004768 alpha = 1 relative_scale 
			wait 0.69999998808 seconds 
			DoMorph time = 0.10000000149 scale = 0 alpha = 0 relative_scale 
		CASE 4 
			SetProps just = [ center center ] rgba = [ 200 60 0 255 ] 
			DoMorph time = 0.20000000298 pos = PAIR(320.00000000000, 80.00000000000) scale = 1.50000000000 alpha = 0.80000001192 relative_scale 
			DoMorph time = 0.10000000149 scale = 1.20000004768 alpha = 1 relative_scale 
			wait 0.69999998808 seconds 
			DoMorph time = 0.10000000149 scale = 0 alpha = 0 relative_scale 
		CASE 5 
			SetProps just = [ center center ] rgba = [ 220 40 0 255 ] 
			DoMorph time = 0.20000000298 pos = PAIR(320.00000000000, 80.00000000000) scale = 1.50000000000 alpha = 0.80000001192 relative_scale 
			DoMorph time = 0.10000000149 scale = 1.20000004768 alpha = 1 relative_scale 
			wait 0.69999998808 seconds 
			DoMorph time = 0.10000000149 scale = 0 alpha = 0 relative_scale 
		CASE 6 
			SetProps just = [ center center ] rgba = [ 240 20 0 255 ] 
			DoMorph time = 0.20000000298 pos = PAIR(320.00000000000, 80.00000000000) scale = 1.50000000000 alpha = 0.80000001192 relative_scale 
			DoMorph time = 0.10000000149 scale = 1.20000004768 alpha = 1 relative_scale 
			wait 0.69999998808 seconds 
			DoMorph time = 0.10000000149 scale = 0 alpha = 0 relative_scale 
		DEFAULT 
			SetProps just = [ center center ] rgba = [ 240 20 0 255 ] 
			DoMorph time = 0.20000000298 pos = PAIR(320.00000000000, 80.00000000000) scale = 1.50000000000 alpha = 0.80000001192 relative_scale 
			DoMorph time = 0.10000000149 scale = 1.20000004768 alpha = 1 relative_scale 
			wait 0.69999998808 seconds 
			DoMorph time = 0.10000000149 scale = 0 alpha = 0 relative_scale 
	ENDSWITCH 
	wait 60 frames 
	kill_panel_message_if_it_exists id = message_panels_broken 
ENDSCRIPT

SCRIPT style_NO_smoked_thugpro 
	SetProps just = [ center center ] rgba = [ 255 255 255 255 ] 
	DoMorph time = 0.10000000149 pos = PAIR(320.00000000000, 80.00000000000) scale = 0 alpha = 0 rot_angle = 0 relative_scale 
	DoMorph time = 0.10000000149 pos = PAIR(320.00000000000, 80.00000000000) scale = 1.79999995232 alpha = 100 rot_angle = 3 relative_scale 
	DoMorph time = 0.10000000149 pos = PAIR(320.00000000000, 80.00000000000) scale = 1.60000002384 alpha = 100 rot_angle = -3 relative_scale 
	DoMorph time = 0.10000000149 pos = PAIR(320.00000000000, 80.00000000000) scale = 2.09999990463 alpha = 100 rot_angle = 2 relative_scale 
	DoMorph time = 0.10000000149 pos = PAIR(320.00000000000, 80.00000000000) scale = 1.60000002384 alpha = 100 rot_angle = 0 relative_scale 
	DoMorph time = 0.10000000149 pos = PAIR(320.00000000000, 80.00000000000) scale = 1.89999997616 alpha = 100 rot_angle = 3 relative_scale 
	DoMorph time = 0.10000000149 pos = PAIR(320.00000000000, 80.00000000000) scale = 1.70000004768 alpha = 100 rot_angle = -3 relative_scale 
	DoMorph time = 0.10000000149 pos = PAIR(320.00000000000, 80.00000000000) scale = 2.09999990463 alpha = 100 rot_angle = 2 relative_scale 
	DoMorph time = 0.10000000149 pos = PAIR(320.00000000000, 80.00000000000) scale = 1.50000000000 alpha = 100 rot_angle = 0 relative_scale 
	DoMorph time = 0.10000000149 pos = PAIR(320.00000000000, 80.00000000000) scale = 1.79999995232 alpha = 100 rot_angle = 3 relative_scale 
	DoMorph time = 0.10000000149 pos = PAIR(320.00000000000, 80.00000000000) scale = 1.60000002384 alpha = 100 rot_angle = -3 relative_scale 
	DoMorph time = 0.10000000149 pos = PAIR(320.00000000000, 80.00000000000) scale = 2.09999990463 alpha = 100 rot_angle = 2 relative_scale 
	DoMorph time = 0.10000000149 pos = PAIR(320.00000000000, 80.00000000000) scale = 1.60000002384 alpha = 100 rot_angle = 0 relative_scale 
	DoMorph time = 0.10000000149 pos = PAIR(320.00000000000, 80.00000000000) scale = 1.89999997616 alpha = 100 rot_angle = 3 relative_scale 
	DoMorph time = 0.10000000149 pos = PAIR(320.00000000000, 80.00000000000) scale = 1.70000004768 alpha = 100 rot_angle = -3 relative_scale 
	DoMorph time = 0.10000000149 pos = PAIR(320.00000000000, 80.00000000000) scale = 2.09999990463 alpha = 100 rot_angle = 2 relative_scale 
	DoMorph time = 0.10000000149 pos = PAIR(320.00000000000, 80.00000000000) scale = 1.50000000000 alpha = 100 rot_angle = 0 relative_scale 
	DoMorph time = 0.30000001192 pos = PAIR(320.00000000000, 80.00000000000) scale = 0 alpha = 0 rot_angle = 0 relative_scale 
ENDSCRIPT

SCRIPT style_NO_skulltimer_thugpro 
	SetProps just = [ center center ] rgba = [ 255 255 255 255 ] 
	DoMorph time = 0 pos = PAIR(320.00000000000, 80.00000000000) scale = 0.69999998808 alpha = 0 rot_angle = 2 relative_scale 
	DoMorph time = 0.20000000298 pos = PAIR(320.00000000000, 80.00000000000) scale = 0.89999997616 alpha = 100 rot_angle = -2 relative_scale 
ENDSCRIPT

SCRIPT style_NO_skulltimer2_thugpro 
	SetProps just = [ center center ] rgba = [ 255 255 255 255 ] 
	DoMorph time = 0 pos = PAIR(320.00000000000, 80.00000000000) scale = 0 alpha = 0 rot_angle = 0 relative_scale 
	DoMorph time = 0.30000001192 pos = PAIR(320.00000000000, 80.00000000000) scale = 0.69999998808 alpha = 100 rot_angle = 2 relative_scale 
	DoMorph time = 0.20000000298 pos = PAIR(320.00000000000, 80.00000000000) scale = 1.50000000000 alpha = 100 rot_angle = -2 relative_scale 
	DoMorph time = 0.10000000149 scale = 1.00000000000 alpha = 100 rot_angle = 2 relative_scale 
	DoMorph time = 0.10000000149 scale = 1.10000002384 alpha = 100 rot_angle = 0 relative_scale 
ENDSCRIPT

