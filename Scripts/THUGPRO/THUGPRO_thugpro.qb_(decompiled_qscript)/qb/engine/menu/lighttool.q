
got_intial_lighting = 0 
current_lighting = 0 
step_multiplier = 10 
lock_color_values = 0 
toggle_dir0 = 1 
toggle_dir1 = 1 
amb_mod_lo = 0 
amb_mod_hi = 0 
dir0_head = 0 
dir0_pitch = 0 
dir0_mod_hi = 0 
dir0_mod_lo = 0 
dir1_head = 0 
dir1_pitch = 0 
dir1_mod_hi = 0 
dir1_mod_lo = 0 
amb_mod2_lo = 0 
amb_mod2_hi = 0 
dir0_head2 = 0 
dir0_pitch2 = 0 
dir0_mod2_hi = 0 
dir0_mod2_lo = 0 
dir1_head2 = 0 
dir1_pitch2 = 0 
dir1_mod2_lo = 0 
dir1_mod2_hi = 0 
ambient_red2 = 0 
ambient_green2 = 0 
ambient_blue2 = 0 
red_02 = 0 
green_02 = 0 
blue_02 = 0 
red_12 = 0 
green_12 = 0 
blue_12 = 0 
lev_red = 128 
lev_green = 128 
lev_blue = 128 
lev_vct = 128 
lev_vcp = 0 
lev_red = 128 
lev_green = 128 
lev_blue = 128 
morning_sun_theta = 0.00000000000 
morning_sun_phi = -10.00000000000 
morning_sun_red = 255.00000000000 
morning_sun_green = 210.00000000000 
morning_sun_blue = 172.00000000000 
afternoon_sun_theta = 0.00000000000 
afternoon_sun_phi = 20.00000000000 
afternoon_sun_red = 255.00000000000 
afternoon_sun_green = 210.00000000000 
afternoon_sun_blue = 172.00000000000 
evening_sun_theta = 0.00000000000 
evening_sun_phi = 180.00000000000 
evening_sun_red = 255.00000000000 
evening_sun_green = 128 
evening_sun_blue = 64 
night_sun_theta = 0.00000000000 
night_sun_phi = 200.00000000000 
night_sun_red = 0.00000000000 
night_sun_green = 0.00000000000 
night_sun_blue = 0.00000000000 
fog_red = 128 
fog_green = 128 
fog_blue = 128 
fog_alpha = 0 
fog_dist = 0 
fog_state = 0 
sky_red = 128 
sky_green = 128 
sky_blue = 128 
last_dir0_red = 0 
last_dir0_green = 0 
last_dir0_blue = 0 
last_dir1_red = 0 
last_dir1_green = 0 
last_dir1_blue = 0 
dir0_red = 0 
dir0_green = 0 
dir0_blue = 0 
dir1_red = 0 
dir1_green = 0 
dir1_blue = 0 
bloom_on = 1 
bloom_r = 120 
bloom_g = 120 
bloom_b = 120 
bloom_threshold = 40 
bloom_strength = 30 
rain_or_snow = 0 
rain_rate = 0 
rain_height = 2000 
rain_frames = 40 
rain_length = 100 
rain_blend = 6 
rain_fixed = 64 
rain_red = 0 
rain_green = 0 
rain_blue = 0 
rain_alpha = 0 
rain_red2 = 0 
rain_green2 = 0 
rain_blue2 = 0 
rain_alpha2 = 0 
splash_red = 255 
splash_green = 255 
splash_blue = 255 
splash_alpha = 255 
splash_rate = 0 
splash_life = 8 
splash_size = 16 
splash_blend = 6 
splash_fixed = 64 
snow_rate = 0 
snow_height = 500 
snow_frames = 254 
snow_size = 4 
snow_blend = 6 
snow_fixed = 64 
snow_red = 128 
snow_green = 128 
snow_blue = 128 
snow_alpha = 128 
SCRIPT launch_lighting_tool set = character 
	UnpauseGame 
	makeskatergoto freezeskater 
	SetAnalogStickActiveForMenus 0 
	IF ( got_intial_lighting = 0 ) 
		get_level_light_values 
		change got_intial_lighting = 1 
	ELSE 
		<color> = ( lev_red + ( lev_green * 256 ) + ( lev_blue * 65536 ) ) 
		<sky> = ( sky_red + ( sky_green * 256 ) + ( sky_blue * 65536 ) ) 
		lighting color = <color> sky = <sky> 
	ENDIF 
	removeparameter device_num 
	removeparameter controller_num 
	removeparameter type 
	TODManager_GetTimeMultiplier 
	TODManager_SetTimeMultiplier 0 
	create_lighting_tool <...> remember_colors 
ENDSCRIPT

SCRIPT create_lighting_tool 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	IF ( <set> = character ) 
		IF ( current_lighting = 3 ) 
			change current_lighting = 0 
		ELSE 
			IF ( current_lighting > 3 ) 
				change current_lighting = 2 
			ENDIF 
		ENDIF 
	ELSE 
		IF ( current_lighting < 3 ) 
			change current_lighting = 12 
		ELSE 
			IF ( current_lighting > 12 ) 
				change current_lighting = 3 
			ENDIF 
		ENDIF 
	ENDIF 
	IF ( <set> = character ) 
		SWITCH current_lighting 
			CASE 0 
				menu_title = "AMBIENT" 
			CASE 1 
				menu_title = "ONE" 
			CASE 2 
				menu_title = "TWO" 
			DEFAULT 
				change current_lighting = 0 
				menu_title = "AMBIENT" 
		ENDSWITCH 
	ELSE 
		SWITCH current_lighting 
			CASE 3 
				menu_title = "LEVEL" 
			CASE 4 
				menu_title = "FOG" 
			CASE 5 
				menu_title = "SKY" 
			CASE 6 
				menu_title = "TIME" 
			CASE 7 
				menu_title = "RAIN" 
			CASE 8 
				menu_title = "RAIN COLOR" 
			CASE 9 
				menu_title = "SPLASH COLOR" 
			CASE 10 
				menu_title = "SPLASH" 
			CASE 11 
				menu_title = "SNOW" 
			CASE 12 
				menu_title = "SNOW COLOR" 
			DEFAULT 
				change current_lighting = 3 
				menu_title = "LEVEL" 
		ENDSWITCH 
	ENDIF 
	GetCurrentLightingValues 
	set_current_tod_values 
	IF GotParam remember_colors 
		change amb_mod2_lo = ( amb_mod_lo ) 
		change amb_mod2_hi = ( amb_mod_hi ) 
		change dir0_head2 = ( dir0_head ) 
		change dir0_pitch2 = ( dir0_pitch ) 
		change dir0_mod2_hi = ( dir0_mod_hi ) 
		change dir0_mod2_lo = ( dir0_mod_lo ) 
		change dir1_head2 = ( dir1_head ) 
		change dir1_pitch2 = ( dir1_pitch ) 
		change dir1_mod2_lo = ( dir1_mod_lo ) 
		change dir1_mod2_hi = ( dir1_mod_hi ) 
		change ambient_red2 = <ambient_red> 
		change ambient_green2 = <ambient_green> 
		change ambient_blue2 = <ambient_blue> 
		change red_02 = <red_0> 
		change green_02 = <green_0> 
		change blue_02 = <blue_0> 
		change red_12 = <red_1> 
		change green_12 = <green_1> 
		change blue_12 = <blue_1> 
	ENDIF 
	make_new_menu { 
		menu_id = light_menu 
		vmenu_id = light_vmenu 
		menu_title = <menu_title> 
		type = VMenu 
		dims = PAIR(200.00000000000, 200.00000000000) 
		padding_scale = 0.94999998808 
		pos = PAIR(50.00000000000, 180.00000000000) 
	} 
	IF ( <set> = character ) 
		create_helper_text helper_pos = PAIR(320.00000000000, 410.00000000000) scale = 0.94999998808 helper_text_elements = [ 
			{ text = "\\b7/\\b4=Select" } 
			{ text = "\\b6/\\b5=Adjust" } 
			{ text = "\\m1=Back/Print Values" } 
		] 
		create_helper_text anchor_id = helper_text_anchor2 scale = 0.94999998808 helper_text_elements = [ 
			{ text = "\\m0=toggle speed 1,10" } 
			{ text = "\\m3=link/unlink color values" } 
			{ text = "\\m4=toggle previous values" } 
		] 
		removeparameter left 
		SetScreenElementProps { 
			id = light_vmenu 
			event_handlers = [ { pad_back print_light_values params = <...> } 
				{ pad_choose toggle_step_multiplier params = { } } 
				{ pad_square toggle_color_lock params = { } } 
				{ pad_circle toggle_old_colors params = <...> } 
				{ pad_l2 next_light params = { left <...> } } 
				{ pad_r2 next_light params = { <...> } } 
				{ pad_r1 toggle_light_menu_focus params = { off } } 
			] 
		} 
	ELSE 
		create_helper_text helper_pos = PAIR(320.00000000000, 410.00000000000) helper_text_elements = [ 
			{ text = "\\b7/\\b4=Select" } 
			{ text = "\\b6/\\b5=Adjust" } 
			{ text = "\\m1=Back/Print Values" } 
		] 
		create_helper_text anchor_id = helper_text_anchor2 helper_text_elements = [ 
			{ text = "\\m0=toggle speed 1,10" } 
			{ text = "\\m3=link/unlink color values" } 
		] 
		removeparameter left 
		SetScreenElementProps { 
			id = light_vmenu 
			event_handlers = [ { pad_back print_light_values params = <...> } 
				{ pad_choose toggle_step_multiplier params = { } } 
				{ pad_square toggle_color_lock params = { } } 
				{ pad_l2 next_light params = { left <...> } } 
				{ pad_r2 next_light params = { <...> } } 
				{ pad_r1 toggle_light_menu_focus params = { off } } 
			] 
		} 
	ENDIF 
	IF ( toggle_dir0 = 1 ) 
		dir0_on_text = "on" 
	ELSE 
		dir0_on_text = "off" 
	ENDIF 
	IF ( toggle_dir1 = 1 ) 
		dir1_on_text = "on" 
	ELSE 
		dir1_on_text = "off" 
	ENDIF 
	IF ( fog_state = 1 ) 
		fog_text = "on" 
	ELSE 
		fog_text = "off" 
	ENDIF 
	SWITCH current_lighting 
		CASE 0 
			make_light_tool_item text = "red" id = menu_red value = <ambient_red> pad_choose_script = incr_color_val 
			make_light_tool_item text = "green" id = menu_green value = <ambient_green> pad_choose_script = incr_color_val 
			make_light_tool_item text = "blue" id = menu_blue value = <ambient_blue> pad_choose_script = incr_color_val 
			make_light_tool_item text = "mod lo" id = menu_mod value = amb_mod_lo pad_choose_script = incr_mod_val 
			make_light_tool_item text = "mod hi" id = menu_mod2 value = amb_mod_hi pad_choose_script = incr_mod_val2 
		CASE 1 
			make_light_tool_item text = "heading" id = menu_heading value = dir0_head pad_choose_script = incr_heading_val 
			make_light_tool_item text = "pitch" id = menu_pitch value = dir0_pitch pad_choose_script = incr_pitch_val 
			make_light_tool_item text = "red" id = menu_red value = <red_0> pad_choose_script = incr_color_val 
			make_light_tool_item text = "green" id = menu_green value = <green_0> pad_choose_script = incr_color_val 
			make_light_tool_item text = "blue" id = menu_blue value = <blue_0> pad_choose_script = incr_color_val 
			make_light_tool_item text = "mod lo" id = menu_mod1 value = dir0_mod_lo pad_choose_script = incr_mod_val 
			make_light_tool_item text = "mod hi" id = menu_mod2 value = dir0_mod_hi pad_choose_script = incr_mod_val2 
			make_light_tool_item text = "light" id = menu_onoff value_text = <dir0_on_text> pad_choose_script = toggle_dir_light_on_off params = { index = 0 } 
		CASE 2 
			make_light_tool_item text = "heading" id = menu_heading value = dir1_head pad_choose_script = incr_heading_val 
			make_light_tool_item text = "pitch" id = menu_pitch value = dir1_pitch pad_choose_script = incr_pitch_val 
			make_light_tool_item text = "red" id = menu_red value = <red_1> pad_choose_script = incr_color_val 
			make_light_tool_item text = "green" id = menu_green value = <green_1> pad_choose_script = incr_color_val 
			make_light_tool_item text = "blue" id = menu_blue value = <blue_1> pad_choose_script = incr_color_val 
			make_light_tool_item text = "mod lo" id = menu_mod1 value = dir1_mod_lo pad_choose_script = incr_mod_val 
			make_light_tool_item text = "mod hi" id = menu_mod2 value = dir1_mod_hi pad_choose_script = incr_mod_val2 
			make_light_tool_item text = "light" id = menu_onoff value_text = <dir1_on_text> pad_choose_script = toggle_dir_light_on_off params = { index = 1 } 
		CASE 3 
			make_light_tool_item text = "red" id = menu_red value = lev_red pad_choose_script = incr_color_val 
			make_light_tool_item text = "green" id = menu_green value = lev_green pad_choose_script = incr_color_val 
			make_light_tool_item text = "blue" id = menu_blue value = lev_blue pad_choose_script = incr_color_val 
		CASE 4 
			make_light_tool_item text = "red" id = menu_red value = fog_red pad_choose_script = incr_color_val 
			make_light_tool_item text = "green" id = menu_green value = fog_green pad_choose_script = incr_color_val 
			make_light_tool_item text = "blue" id = menu_blue value = fog_blue pad_choose_script = incr_color_val 
			make_light_tool_item text = "alpha" id = menu_alpha value = fog_alpha pad_choose_script = incr_color_val 
			make_light_tool_item text = "distance" id = menu_exp value = fog_dist pad_choose_script = incr_color_val 
			make_light_tool_item text = "fog" id = menu_fog value = <fog_text> pad_choose_script = incr_color_val 
		CASE 5 
			make_light_tool_item text = "red" id = menu_red value = sky_red pad_choose_script = incr_color_val 
			make_light_tool_item text = "green" id = menu_green value = sky_green pad_choose_script = incr_color_val 
			make_light_tool_item text = "blue" id = menu_blue value = sky_blue pad_choose_script = incr_color_val 
		CASE 6 
			SetScreenElementProps { 
				id = light_vmenu 
				event_handlers = [ { pad_choose null_script params = { } } ] replace_handlers 
			} 
			make_text_sub_menu_item text = "Day" id = menu_day pad_choose_script = tod_light_set_instant pad_choose_params = { tod_state = afternoon } 
			make_text_sub_menu_item text = "Morning" id = menu_morn pad_choose_script = tod_light_set_instant pad_choose_params = { tod_state = morning } 
			make_text_sub_menu_item text = "Evening" id = menu_even pad_choose_script = tod_light_set_instant pad_choose_params = { tod_state = evening } 
			make_text_sub_menu_item text = "Night" id = menu_night pad_choose_script = tod_light_set_instant pad_choose_params = { tod_state = night } 
		CASE 7 
			IF ( rain_or_snow = 0 ) 
				rain_text = "rain" 
			ELSE 
				rain_text = "snow" 
			ENDIF 
			make_light_tool_item text = "Rain/Snow" id = menu_rain value = <rain_text> pad_choose_script = toggle_rain_snow 
			make_light_tool_item text = "rate" id = menu_rate value = rain_rate pad_choose_script = incr_rain_val 
			make_light_tool_item text = "frames" id = menu_frames value = rain_frames pad_choose_script = incr_rain_val 
			make_light_tool_item text = "height" id = menu_height value = rain_height pad_choose_script = incr_rain_val 
			make_light_tool_item text = "length" id = menu_length value = rain_length pad_choose_script = incr_rain_val 
			get_rain_mode_string 
			make_light_tool_item text = "blendmode" id = menu_blend value_text = <value_text> pad_choose_script = incr_rain_val 
			make_light_tool_item text = "fixalpha" id = menu_fixed value = rain_fixed pad_choose_script = incr_rain_val 
		CASE 8 
			make_light_tool_item text = "red" id = menu_red value = rain_red pad_choose_script = incr_rain_color params = { rain } 
			make_light_tool_item text = "green" id = menu_green value = rain_green pad_choose_script = incr_rain_color params = { rain } 
			make_light_tool_item text = "blue" id = menu_blue value = rain_blue pad_choose_script = incr_rain_color params = { rain } 
			make_light_tool_item text = "alpha" id = menu_alpha value = rain_alpha pad_choose_script = incr_rain_color params = { rain } 
			make_light_tool_item text = "red2" id = menu_red2 value = rain_red2 pad_choose_script = incr_rain_color params = { rain } 
			make_light_tool_item text = "green2" id = menu_green2 value = rain_green2 pad_choose_script = incr_rain_color params = { rain } 
			make_light_tool_item text = "blue2" id = menu_blue2 value = rain_blue2 pad_choose_script = incr_rain_color params = { rain } 
			make_light_tool_item text = "alpha2" id = menu_alpha2 value = rain_alpha2 pad_choose_script = incr_rain_color params = { rain } 
		CASE 9 
			make_light_tool_item text = "rate" id = menu_rate value = splash_rate pad_choose_script = incr_splash_val 
			make_light_tool_item text = "life" id = menu_life value = splash_life pad_choose_script = incr_splash_val 
			make_light_tool_item text = "size" id = menu_size value = splash_size pad_choose_script = incr_splash_val 
			get_rain_mode_string splash 
			make_light_tool_item text = "blendmode" id = menu_blend value_text = <value_text> pad_choose_script = incr_splash_val 
			make_light_tool_item text = "fixalpha" id = menu_fixed value = splash_fixed pad_choose_script = incr_splash_val 
		CASE 10 
			make_light_tool_item text = "red" id = menu_red value = splash_red pad_choose_script = incr_rain_color params = { splash } 
			make_light_tool_item text = "green" id = menu_green value = splash_green pad_choose_script = incr_rain_color params = { splash } 
			make_light_tool_item text = "blue" id = menu_blue value = splash_blue pad_choose_script = incr_rain_color params = { splash } 
			make_light_tool_item text = "alpha" id = menu_alpha value = splash_alpha pad_choose_script = incr_rain_color params = { splash } 
		CASE 11 
			IF ( rain_or_snow = 0 ) 
				rain_text = "rain" 
			ELSE 
				rain_text = "snow" 
			ENDIF 
			make_light_tool_item text = "Rain/Snow" id = menu_rain value = <rain_text> pad_choose_script = toggle_rain_snow 
			make_light_tool_item text = "rate" id = menu_rate value = snow_rate pad_choose_script = incr_snow_val 
			make_light_tool_item text = "frames" id = menu_frames value = snow_frames pad_choose_script = incr_snow_val 
			make_light_tool_item text = "height" id = menu_height value = snow_height pad_choose_script = incr_snow_val 
			make_light_tool_item text = "size" id = menu_size value = snow_size pad_choose_script = incr_snow_val 
			get_rain_mode_string snow 
			make_light_tool_item text = "blendmode" id = menu_blend value_text = <value_text> pad_choose_script = incr_snow_val 
			make_light_tool_item text = "fixalpha" id = menu_fixed value = snow_fixed pad_choose_script = incr_snow_val 
		CASE 12 
			make_light_tool_item text = "red" id = menu_red value = snow_red pad_choose_script = incr_rain_color params = { snow } 
			make_light_tool_item text = "green" id = menu_green value = snow_green pad_choose_script = incr_rain_color params = { snow } 
			make_light_tool_item text = "blue" id = menu_blue value = snow_blue pad_choose_script = incr_rain_color params = { snow } 
			make_light_tool_item text = "alpha" id = menu_alpha value = snow_alpha pad_choose_script = incr_rain_color params = { snow } 
		DEFAULT 
			change current_lighting = 0 
			create_lighting_tool 
	ENDSWITCH 
	spawnscript update_directional_light_pos 
	FireEvent type = focus target = light_menu 
ENDSCRIPT

SCRIPT tod_light_set_instant 
	TODManager_SetTODInstant <tod_state> 
	set_current_tod_values 
ENDSCRIPT

SCRIPT set_current_tod_values 
	TODManager_GetCurrentTODParams 
	change lev_red = ( <tod_params> . lev_red ) 
	change lev_green = ( <tod_params> . lev_green ) 
	change lev_blue = ( <tod_params> . lev_blue ) 
	fog_on = ( <tod_params> . fog_on ) 
	change fog_red = ( <tod_params> . fog_red ) 
	change fog_green = ( <tod_params> . fog_green ) 
	change fog_blue = ( <tod_params> . fog_blue ) 
	change fog_alpha = ( <tod_params> . fog_alpha ) 
	change fog_dist = ( <tod_params> . fog_dist ) 
	change sky_red = ( <tod_params> . sky_red ) 
	change sky_green = ( <tod_params> . sky_green ) 
	change sky_blue = ( <tod_params> . sky_blue ) 
	change dir0_head = ( <tod_params> . heading_0 ) 
	change dir0_pitch = ( <tod_params> . pitch_0 ) 
	change dir1_head = ( <tod_params> . heading_1 ) 
	change dir1_pitch = ( <tod_params> . pitch_1 ) 
	change amb_mod_lo = ( <tod_params> . ambient_mod_factor_lo ) 
	change amb_mod_hi = ( <tod_params> . ambient_mod_factor_hi ) 
ENDSCRIPT

SCRIPT toggle_old_colors 
	GetCurrentLightingValues 
	amb_modt_lo = ( amb_mod_lo ) 
	amb_modt_hi = ( amb_mod_hi ) 
	dir0_headt = ( dir0_head ) 
	dir0_pitcht = ( dir0_pitch ) 
	dir0_modt_lo = ( dir0_mod_lo ) 
	dir0_modt_hi = ( dir0_mod_hi ) 
	dir1_headt = ( dir1_head ) 
	dir1_pitcht = ( dir1_pitch ) 
	dir1_modt_lo = ( dir1_mod_lo ) 
	dir1_modt_hi = ( dir1_mod_hi ) 
	ambient_redt = <ambient_red> 
	ambient_greent = <ambient_green> 
	ambient_bluet = <ambient_blue> 
	red_0t = <red_0> 
	green_0t = <green_0> 
	blue_0t = <blue_0> 
	red_1t = <red_1> 
	green_1t = <green_1> 
	blue_1t = <blue_1> 
	change amb_mod_lo = ( amb_mod2_lo ) 
	change amb_mod_hi = ( amb_mod2_hi ) 
	change dir0_head = ( dir0_head2 ) 
	change dir0_pitch = ( dir0_pitch2 ) 
	change dir0_mod_lo = ( dir0_mod2_lo ) 
	change dir0_mod_hi = ( dir0_mod2_hi ) 
	change dir1_head = ( dir1_head2 ) 
	change dir1_pitch = ( dir1_pitch2 ) 
	change dir1_mod_lo = ( dir1_mod2_lo ) 
	change dir1_mod_hi = ( dir1_mod2_hi ) 
	SetLightAmbientColor r = ( ambient_red2 ) g = ( ambient_green2 ) b = ( ambient_blue2 ) 
	SetLightDiffuseColor index = 0 r = ( red_02 ) g = ( green_02 ) b = ( blue_02 ) 
	SetLightDiffuseColor index = 1 r = ( red_12 ) g = ( green_12 ) b = ( blue_12 ) 
	change amb_mod2_lo = <amb_modt_lo> 
	change amb_mod2_hi = <amb_modt_hi> 
	change dir0_head2 = <dir0_headt> 
	change dir0_pitch2 = <dir0_pitcht> 
	change dir0_mod2_lo = <dir0_modt_lo> 
	change dir0_mod2_hi = <dir0_modt_hi> 
	change dir1_head2 = <dir1_headt> 
	change dir1_pitch2 = <dir1_pitcht> 
	change dir1_mod2_lo = <dir1_modt_lo> 
	change dir1_mod2_hi = <dir1_modt_hi> 
	change ambient_red2 = <ambient_redt> 
	change ambient_green2 = <ambient_greent> 
	change ambient_blue2 = <ambient_bluet> 
	change red_02 = <red_0t> 
	change green_02 = <green_0t> 
	change blue_02 = <blue_0t> 
	change red_12 = <red_1t> 
	change green_12 = <green_1t> 
	change blue_12 = <blue_1t> 
	IF GotParam remember_colors 
		removeparameter remember_colors 
	ENDIF 
	create_lighting_tool <...> 
ENDSCRIPT

SCRIPT toggle_light_menu_focus 
	IF ScreenElementExists id = light_menu_focus_message 
		DestroyScreenElement id = light_menu_focus_message 
	ENDIF 
	IF GotParam off 
		FireEvent type = unfocus target = light_menu 
		SetScreenElementLock id = light_menu off 
		CreateScreenElement { 
			type = TextElement 
			parent = light_menu 
			id = light_menu_focus_message 
			font = small 
			text = "Light tool unfocused.  Press R2 to bring back into focus" 
			pos = PAIR(320.00000000000, 40.00000000000) 
			z_priority = 1000 
			rgba = [ 128 80 80 128 ] 
		} 
		SetScreenElementProps { 
			id = root_window 
			event_handlers = [ { pad_r1 toggle_light_menu_focus params = { on } } ] 
		} 
	ELSE 
		IF GotParam on 
			FireEvent type = focus target = light_menu 
			SetScreenElementProps { 
				id = root_window 
				event_handlers = [ { pad_r1 null_script params = { } } ] 
				replace_handlers 
			} 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT get_level_light_values 
	IF LevelIs Load_MainMenu 
		this_level = level_skateshop 
		no_fog = 1 
	ENDIF 
	IF LevelIs load_AU 
		this_level = level_AU 
	ENDIF 
	IF LevelIs load_SC 
		this_level = level_SC 
	ENDIF 
	IF LevelIs load_Default 
		this_level = level_default 
		no_fog = 1 
	ENDIF 
	IF LevelIs load_TestLevel 
		this_level = level_testlevel 
		no_fog = 1 
	ENDIF 
	set_to_tod_values tod = <this_level> level no_fog = <no_fog> 
ENDSCRIPT

SCRIPT reset_light_values 
	printf "Reset skater lighting to level defaults" 
	<setcolor> = 0 
	change lev_red = 128 
	change lev_green = 128 
	change lev_blue = 128 
	change lev_vct = 128 
	change lev_vcp = 0 
	change fog_red = 128 
	change fog_green = 128 
	change fog_blue = 128 
	change fog_alpha = 50 
	change fog_dist = 15 
	change sky_red = 128 
	change sky_green = 128 
	change sky_blue = 128 
	get_level_light_values 
	launch_lighting_tool 
ENDSCRIPT

SCRIPT next_light max = 13 
	IF GotParam left 
		change current_lighting = ( current_lighting - 1 ) 
	ELSE 
		change current_lighting = ( current_lighting + 1 ) 
	ENDIF 
	IF ( current_lighting > <max> ) 
		change current_lighting = 0 
	ELSE 
		IF ( 0 > current_lighting ) 
			change current_lighting = <max> 
		ENDIF 
	ENDIF 
	create_lighting_tool <...> 
ENDSCRIPT

SCRIPT make_light_tool_item { focus_script = do_scale_up 
		unfocus_script = do_scale_down 
		pad_choose_script = nullscript 
		font_face = small 
		parent_menu_id = current_menu 
		scale = 1 
		rgba = [ 88 105 112 128 ] 
		value = 100 
	} 
	SWITCH <id> 
		CASE menu_red 
			rgba = [ 80 20 20 128 ] 
		CASE menu_green 
			rgba = [ 20 80 20 128 ] 
		CASE menu_blue 
			rgba = [ 20 20 80 128 ] 
	ENDSWITCH 
	unfocus_params = { rgba = <rgba> } 
	CreateScreenElement { 
		type = TextElement 
		parent = <parent_menu_id> 
		id = <id> 
		text = <text> 
		font = <font_face> 
		rgba = <rgba> 
		scale = <scale> 
		event_handlers = [ 
			{ focus <focus_script> params = <focus_params> } 
			{ unfocus <unfocus_script> params = <unfocus_params> } 
			{ pad_left <pad_choose_script> params = { reverse <params> } } 
			{ pad_right <pad_choose_script> params = { <params> } } 
		] 
	} 
	IF NOT GotParam value_text 
		FormatText TextName = value_text "%i" i = <value> 
	ENDIF 
	CreateScreenElement { 
		type = TextElement 
		parent = <id> 
		pos = PAIR(150.00000000000, 10.00000000000) 
		text = <value_text> 
		font = <font_face> 
		rgba = <rgba> 
		scale = <scale> 
	} 
ENDSCRIPT

SCRIPT incr_color_val step = 1 max = 128 min = 0 
	GetTags 
	GetCurrentLightingValues 
	set_current_tod_values 
	removeparameter random_effect_done 
	IF GotParam reverse 
		step = ( -1 * <step> ) 
	ENDIF 
	step = ( <step> * step_multiplier ) 
	IF ( lock_color_values = 1 ) 
		id = menu_all 
	ENDIF 
	SWITCH current_lighting 
		CASE 0 
			SWITCH <id> 
				CASE menu_red 
					ambient_red = ( <ambient_red> + <step> ) 
					IF ( <ambient_red> > 255 ) 
						ambient_red = 255 
					ELSE 
						IF ( 0 > <ambient_red> ) 
							ambient_red = 0 
						ENDIF 
					ENDIF 
					FormatText TextName = value_text "%i" i = <ambient_red> 
				CASE menu_green 
					ambient_green = ( <ambient_green> + <step> ) 
					IF ( <ambient_green> > 255 ) 
						ambient_green = 255 
					ELSE 
						IF ( 0 > <ambient_green> ) 
							ambient_green = 0 
						ENDIF 
					ENDIF 
					FormatText TextName = value_text "%i" i = <ambient_green> 
				CASE menu_blue 
					ambient_blue = ( <ambient_blue> + <step> ) 
					IF ( <ambient_blue> > 255 ) 
						ambient_blue = 255 
					ELSE 
						IF ( 0 > <ambient_blue> ) 
							ambient_blue = 0 
						ENDIF 
					ENDIF 
					FormatText TextName = value_text "%i" i = <ambient_blue> 
				CASE menu_all 
					ambient_red = ( <ambient_red> + <step> ) 
					IF ( <ambient_red> > 255 ) 
						ambient_red = 255 
					ELSE 
						IF ( 0 > <ambient_red> ) 
							ambient_red = 0 
						ENDIF 
					ENDIF 
					ambient_green = <ambient_red> 
					ambient_blue = <ambient_red> 
					FormatText TextName = value_text "%i" i = <ambient_red> 
			ENDSWITCH 
		CASE 1 
			SWITCH <id> 
				CASE menu_red 
					red_0 = ( <red_0> + <step> ) 
					IF ( <red_0> > 255 ) 
						red_0 = 255 
					ELSE 
						IF ( 0 > <red_0> ) 
							red_0 = 0 
						ENDIF 
					ENDIF 
					FormatText TextName = value_text "%i" i = <red_0> 
				CASE menu_green 
					green_0 = ( <green_0> + <step> ) 
					IF ( <green_0> > 255 ) 
						green_0 = 255 
					ELSE 
						IF ( 0 > <green_0> ) 
							green_0 = 0 
						ENDIF 
					ENDIF 
					FormatText TextName = value_text "%i" i = <green_0> 
				CASE menu_blue 
					blue_0 = ( <blue_0> + <step> ) 
					IF ( <blue_0> > 255 ) 
						blue_0 = 255 
					ELSE 
						IF ( 0 > <blue_0> ) 
							blue_0 = 0 
						ENDIF 
					ENDIF 
					FormatText TextName = value_text "%i" i = <blue_0> 
				CASE menu_all 
					red_0 = ( <red_0> + <step> ) 
					IF ( <red_0> > 255 ) 
						red_0 = 255 
					ELSE 
						IF ( 0 > <red_0> ) 
							red_0 = 0 
						ENDIF 
					ENDIF 
					green_0 = <red_0> 
					blue_0 = <red_0> 
					FormatText TextName = value_text "%i" i = <red_0> 
			ENDSWITCH 
		CASE 2 
			SWITCH <id> 
				CASE menu_red 
					red_1 = ( <red_1> + <step> ) 
					IF ( <red_1> > 255 ) 
						red_1 = 255 
					ELSE 
						IF ( 0 > <red_1> ) 
							red_1 = 0 
						ENDIF 
					ENDIF 
					FormatText TextName = value_text "%i" i = <red_1> 
				CASE menu_green 
					green_1 = ( <green_1> + <step> ) 
					IF ( <green_1> > 255 ) 
						green_1 = 255 
					ELSE 
						IF ( 0 > <green_1> ) 
							green_1 = 0 
						ENDIF 
					ENDIF 
					FormatText TextName = value_text "%i" i = <green_1> 
				CASE menu_blue 
					blue_1 = ( <blue_1> + <step> ) 
					IF ( <blue_1> > 255 ) 
						blue_1 = 255 
					ELSE 
						IF ( 0 > <blue_1> ) 
							blue_1 = 0 
						ENDIF 
					ENDIF 
					FormatText TextName = value_text "%i" i = <blue_1> 
				CASE menu_all 
					red_1 = ( <red_1> + <step> ) 
					IF ( <red_1> > 255 ) 
						red_1 = 255 
					ELSE 
						IF ( 0 > <red_1> ) 
							red_1 = 0 
						ENDIF 
					ENDIF 
					green_1 = <red_1> 
					blue_1 = <red_1> 
					FormatText TextName = value_text "%i" i = <red_1> 
			ENDSWITCH 
		CASE 3 
			SWITCH <id> 
				CASE menu_red 
					change lev_red = ( lev_red + <step> ) 
					IF ( lev_red > 255 ) 
						change lev_red = 255 
					ELSE 
						IF ( 0 > lev_red ) 
							change lev_red = 0 
						ENDIF 
					ENDIF 
					FormatText TextName = value_text "%i" i = lev_red 
				CASE menu_green 
					change lev_green = ( lev_green + <step> ) 
					IF ( lev_green > 255 ) 
						change lev_green = 255 
					ELSE 
						IF ( 0 > lev_green ) 
							change lev_green = 0 
						ENDIF 
					ENDIF 
					FormatText TextName = value_text "%i" i = lev_green 
				CASE menu_blue 
					change lev_blue = ( lev_blue + <step> ) 
					IF ( lev_blue > 255 ) 
						change lev_blue = 255 
					ELSE 
						IF ( 0 > lev_blue ) 
							change lev_blue = 0 
						ENDIF 
					ENDIF 
					FormatText TextName = value_text "%i" i = lev_blue 
				CASE menu_target 
					change lev_vct = ( lev_vct + <step> ) 
					IF ( lev_vct > 255 ) 
						change lev_vct = 255 
					ELSE 
						IF ( 0 > lev_vct ) 
							change lev_vct = 0 
						ENDIF 
					ENDIF 
					FormatText TextName = value_text "%i" i = lev_vct 
				CASE menu_percent 
					change lev_vcp = ( lev_vcp + <step> ) 
					IF ( lev_vcp > 100 ) 
						change lev_vcp = 100 
					ELSE 
						IF ( 0 > lev_vcp ) 
							change lev_vcp = 0 
						ENDIF 
					ENDIF 
					FormatText TextName = value_text "%i" i = lev_vcp 
				CASE menu_all 
					change lev_red = ( lev_red + <step> ) 
					IF ( lev_red > 255 ) 
						change lev_red = 255 
					ELSE 
						IF ( 0 > lev_red ) 
							change lev_red = 0 
						ENDIF 
					ENDIF 
					change lev_green = lev_red 
					change lev_blue = lev_red 
					FormatText TextName = value_text "%i" i = lev_red 
			ENDSWITCH 
		CASE 4 
			SWITCH <id> 
				CASE menu_red 
					change fog_red = ( fog_red + <step> ) 
					IF ( fog_red > 255 ) 
						change fog_red = 255 
					ELSE 
						IF ( 0 > fog_red ) 
							change fog_red = 0 
						ENDIF 
					ENDIF 
					FormatText TextName = value_text "%i" i = fog_red 
				CASE menu_green 
					change fog_green = ( fog_green + <step> ) 
					IF ( fog_green > 255 ) 
						change fog_green = 255 
					ELSE 
						IF ( 0 > fog_green ) 
							change fog_green = 0 
						ENDIF 
					ENDIF 
					FormatText TextName = value_text "%i" i = fog_green 
				CASE menu_blue 
					change fog_blue = ( fog_blue + <step> ) 
					IF ( fog_blue > 255 ) 
						change fog_blue = 255 
					ELSE 
						IF ( 0 > fog_blue ) 
							change fog_blue = 0 
						ENDIF 
					ENDIF 
					FormatText TextName = value_text "%i" i = fog_blue 
				CASE menu_alpha 
					change fog_alpha = ( fog_alpha + <step> ) 
					IF ( fog_alpha > 128 ) 
						change fog_alpha = 128 
					ELSE 
						IF ( 0 > fog_alpha ) 
							change fog_alpha = 0 
						ENDIF 
					ENDIF 
					FormatText TextName = value_text "%i" i = fog_alpha 
				CASE menu_exp 
					change fog_dist = ( fog_dist + ( 0.50000000000 * <step> ) ) 
					IF ( fog_dist > 100000 ) 
						change fog_dist = 100000 
					ELSE 
						IF ( 0 > fog_dist ) 
							change fog_dist = 0 
						ENDIF 
					ENDIF 
					FormatText TextName = value_text "%i" i = fog_dist 
				CASE menu_fog 
					IF ( fog_state = 0 ) 
						change fog_state = 1 
						enablefog 
						value_text = "on" 
					ELSE 
						change fog_state = 0 
						disablefog 
						value_text = "off" 
					ENDIF 
				CASE menu_all 
					change fog_red = ( fog_red + <step> ) 
					IF ( fog_red > 255 ) 
						change fog_red = 255 
					ELSE 
						IF ( 0 > fog_red ) 
							change fog_red = 0 
						ENDIF 
					ENDIF 
					change fog_green = fog_red 
					change fog_blue = fog_red 
					FormatText TextName = value_text "%i" i = fog_red 
			ENDSWITCH 
		CASE 5 
			SWITCH <id> 
				CASE menu_red 
					change sky_red = ( sky_red + <step> ) 
					IF ( sky_red > 255 ) 
						change sky_red = 255 
					ELSE 
						IF ( 0 > sky_red ) 
							change sky_red = 0 
						ENDIF 
					ENDIF 
					FormatText TextName = value_text "%i" i = sky_red 
				CASE menu_green 
					change sky_green = ( sky_green + <step> ) 
					IF ( sky_green > 255 ) 
						change sky_green = 255 
					ELSE 
						IF ( 0 > sky_green ) 
							change sky_green = 0 
						ENDIF 
					ENDIF 
					FormatText TextName = value_text "%i" i = sky_green 
				CASE menu_blue 
					change sky_blue = ( sky_blue + <step> ) 
					IF ( sky_blue > 255 ) 
						change sky_blue = 255 
					ELSE 
						IF ( 0 > sky_blue ) 
							change sky_blue = 0 
						ENDIF 
					ENDIF 
					FormatText TextName = value_text "%i" i = sky_blue 
				CASE menu_all 
					change sky_red = ( sky_red + <step> ) 
					IF ( sky_red > 255 ) 
						change sky_red = 255 
					ELSE 
						IF ( 0 > sky_red ) 
							change sky_red = 0 
						ENDIF 
					ENDIF 
					change sky_green = sky_red 
					change sky_blue = sky_red 
					FormatText TextName = value_text "%i" i = sky_red 
			ENDSWITCH 
	ENDSWITCH 
	IF ( lock_color_values = 1 ) 
		SetScreenElementProps id = { menu_red child = 0 } text = <value_text> 
		SetScreenElementProps id = { menu_green child = 0 } text = <value_text> 
		SetScreenElementProps id = { menu_blue child = 0 } text = <value_text> 
	ELSE 
		SetScreenElementProps id = { <id> child = 0 } text = <value_text> 
	ENDIF 
	<color> = 0 
	TODManager_GetCurrentTODParams 
	morning_params = ( tod_manager_default_morning ) 
	afternoon_params = ( tod_manager_default_afternoon ) 
	evening_params = ( tod_manager_default_evening ) 
	night_params = ( tod_manager_default_night ) 
	new_params = { 
		ambient_red = <ambient_red> 
		ambient_green = <ambient_green> 
		ambient_blue = <ambient_blue> 
		ambient_mod_factor_lo = ( amb_mod_lo ) 
		ambient_mod_factor_hi = ( amb_mod_hi ) 
		red_0 = <red_0> 
		green_0 = <green_0> 
		blue_0 = <blue_0> 
		red_1 = <red_1> 
		green_1 = <green_1> 
		blue_1 = <blue_1> 
		sky_red = ( sky_red ) 
		sky_green = ( sky_green ) 
		sky_blue = ( sky_blue ) 
		lev_red = ( lev_red ) 
		lev_green = ( lev_green ) 
		lev_blue = ( lev_blue ) 
		heading_0 = ( dir0_head ) 
		pitch_0 = ( dir0_pitch ) 
		heading_1 = ( dir1_head ) 
		pitch_1 = ( dir1_pitch ) 
		fog_red = ( fog_red ) 
		fog_green = ( fog_green ) 
		fog_blue = ( fog_blue ) 
		fog_alpha = ( fog_alpha ) 
		fog_dist = ( fog_dist ) 
		fog_on = <fog_on> 
		sky_red = ( sky_red ) 
		sky_green = ( sky_green ) 
		sky_blue = ( sky_blue ) 
		state_length = 180000 
	} 
	SWITCH ( <tod_params> . current_state_name ) 
		CASE morning 
			morning_params = { ( tod_manager_default_morning ) <new_params> } 
			cur_params = <morning_params> 
		CASE afternoon 
			afternoon_params = { ( tod_manager_default_afternoon ) <new_params> } 
			cur_params = <afternoon_params> 
		CASE evening 
			evening_params = { ( tod_manager_default_evening ) <new_params> } 
			cur_params = <evening_params> 
		CASE night 
			night_params = { ( tod_manager_default_night ) <new_params> } 
			cur_params = <night_params> 
		DEFAULT 
			afternoon_params = { ( tod_manager_default_afternoon ) <new_params> } 
			cur_params = <afternoon_params> 
	ENDSWITCH 
	SWITCH current_lighting 
		CASE 0 
			SetLightAmbientColor r = <ambient_red> g = <ambient_green> b = <ambient_blue> 
		CASE 1 
			SetLightDiffuseColor index = 0 r = <red_0> g = <green_0> b = <blue_0> 
		CASE 2 
			SetLightDiffuseColor index = 1 r = <red_1> g = <green_1> b = <blue_1> 
	ENDSWITCH 
	TODManager_SetParams { 
		system = 1 
		transition_length = 90 
		groups = [ 
			{ parts = 6 wait_frames = 3 light_group = outdoor } 
			{ parts = 2 wait_frames = 3 light_group = nolevellights reset_lightgroup = indoor } 
		] 
		overwrite_current_state = <cur_params> 
		morning = <morning_params> 
		afternoon = <afternoon_params> 
		evening = <evening_params> 
		night = <night_params> 
	} 
	TODManager_SetParams { 
		system = 2 
		sky 
		transition_length = 90 
		groups = [ 
			{ parts = 6 wait_frames = 3 light_group = outdoor } 
			{ parts = 2 wait_frames = 3 light_group = nolevellights reset_lightgroup = indoor } 
		] 
		overwrite_current_state = <cur_params> 
		morning = <morning_params> 
		afternoon = <afternoon_params> 
		evening = <evening_params> 
		night = <night_params> 
	} 
	IF ( current_lighting > 2 ) 
		TODManager_SetTODInstant ( <tod_params> . current_state_name ) 
	ENDIF 
	IF IsTrue cutscene_is_playing 
		change todmanager_temp_tod_changed = 1 
		TODManager_SetTODInstant ( <tod_params> . current_state_name ) 
		TODManager_ResetLevelLights 
	ENDIF 
ENDSCRIPT

SCRIPT incr_mod_val step = 0.00999999978 max = 2 min = 0 
	GetTags 
	removeparameter random_effect_done 
	IF GotParam reverse 
		step = ( -1 * <step> ) 
	ENDIF 
	step = ( <step> * step_multiplier ) 
	SWITCH current_lighting 
		CASE 0 
			change amb_mod_lo = ( amb_mod_lo + <step> ) 
			IF ( amb_mod_lo > <max> ) 
				change amb_mod_lo = <max> 
			ENDIF 
			IF ( <min> > amb_mod_lo ) 
				change amb_mod_lo = <min> 
			ENDIF 
			FormatText TextName = value_text "%i" i = amb_mod_lo 
		CASE 1 
			change dir0_mod_lo = ( dir0_mod_lo + <step> ) 
			IF ( dir0_mod_lo > <max> ) 
				change dir0_mod_lo = <max> 
			ENDIF 
			IF ( <min> > dir0_mod_lo ) 
				change dir0_mod_lo = <min> 
			ENDIF 
			FormatText TextName = value_text "%i" i = dir0_mod_lo 
		CASE 2 
			change dir1_mod_lo = ( dir1_mod_lo + <step> ) 
			IF ( dir1_mod_lo > <max> ) 
				change dir1_mod_lo = <max> 
			ENDIF 
			IF ( <min> > dir1_mod_lo ) 
				change dir1_mod_lo = <min> 
			ENDIF 
			FormatText TextName = value_text "%i" i = dir1_mod_lo 
	ENDSWITCH 
	SetScreenElementProps id = { <id> child = 0 } text = <value_text> 
	SetDynamicLightModulationFactor ambient value = amb_mod_lo value2 = amb_mod_hi 
	SetDynamicLightModulationFactor directional = 0 value = dir0_mod_lo value2 = dir0_mod_hi 
	SetDynamicLightModulationFactor directional = 1 value = dir1_mod_lo value2 = dir1_mod_hi 
ENDSCRIPT

SCRIPT incr_mod_val2 step = 0.00999999978 max = 2 min = 0 
	GetTags 
	removeparameter random_effect_done 
	IF GotParam reverse 
		step = ( -1 * <step> ) 
	ENDIF 
	step = ( <step> * step_multiplier ) 
	SWITCH current_lighting 
		CASE 0 
			change amb_mod_hi = ( amb_mod_hi + <step> ) 
			IF ( amb_mod_hi > <max> ) 
				change amb_mod_hi = <max> 
			ENDIF 
			IF ( <min> > amb_mod_hi ) 
				change amb_mod_hi = <min> 
			ENDIF 
			FormatText TextName = value_text "%i" i = amb_mod_hi 
		CASE 1 
			change dir0_mod_hi = ( dir0_mod_hi + <step> ) 
			IF ( dir0_mod_hi > <max> ) 
				change dir0_mod_hi = <max> 
			ENDIF 
			IF ( <min> > dir0_mod_hi ) 
				change dir0_mod_hi = <min> 
			ENDIF 
			FormatText TextName = value_text "%i" i = dir0_mod_hi 
		CASE 2 
			change dir1_mod_hi = ( dir1_mod_hi + <step> ) 
			IF ( dir1_mod_hi > <max> ) 
				change dir1_mod_hi = <max> 
			ENDIF 
			IF ( <min> > dir1_mod_hi ) 
				change dir1_mod_hi = <min> 
			ENDIF 
			FormatText TextName = value_text "%i" i = dir1_mod_hi 
	ENDSWITCH 
	SetScreenElementProps id = { <id> child = 0 } text = <value_text> 
	SetDynamicLightModulationFactor ambient value = amb_mod_lo value2 = amb_mod_hi 
	SetDynamicLightModulationFactor directional = 0 value = dir0_mod_lo value2 = dir0_mod_hi 
	SetDynamicLightModulationFactor directional = 1 value = dir1_mod_lo value2 = dir1_mod_hi 
ENDSCRIPT

SCRIPT incr_heading_val step = 1 max = 360 min = 0 
	GetTags 
	TODManager_GetCurrentTODParams 
	set_current_tod_values 
	IF GotParam reverse 
		step = ( -1 * <step> ) 
	ENDIF 
	step = ( <step> * step_multiplier ) 
	SWITCH current_lighting 
		CASE 0 
			RETURN 
		CASE 1 
			change dir0_head = ( dir0_head + <step> ) 
			IF ( dir0_head > <max> ) 
				change dir0_head = <min> 
			ENDIF 
			IF ( <min> > dir0_head ) 
				change dir0_head = <max> 
			ENDIF 
			FormatText TextName = value_text "%i" i = dir0_head 
		CASE 2 
			change dir1_head = ( dir1_head + <step> ) 
			IF ( dir1_head > <max> ) 
				change dir1_head = <min> 
			ENDIF 
			IF ( <min> > dir1_head ) 
				change dir1_head = <max> 
			ENDIF 
			FormatText TextName = value_text "%i" i = dir1_head 
	ENDSWITCH 
	SetScreenElementProps id = { <id> child = 0 } text = <value_text> 
	TODManager_GetCurrentTODParams 
	morning_params = ( tod_manager_default_morning ) 
	afternoon_params = ( tod_manager_default_afternoon ) 
	evening_params = ( tod_manager_default_evening ) 
	night_params = ( tod_manager_default_night ) 
	new_params = { 
		ambient_red = ( <tod_params> . ambient_red ) 
		ambient_green = ( <tod_params> . ambient_green ) 
		ambient_blue = ( <tod_params> . ambient_blue ) 
		ambient_mod_factor_lo = ( amb_mod_lo ) 
		ambient_mod_factor_hi = ( amb_mod_hi ) 
		red_0 = ( <tod_params> . red_0 ) 
		green_0 = ( <tod_params> . green_0 ) 
		blue_0 = ( <tod_params> . blue_0 ) 
		red_1 = ( <tod_params> . red_1 ) 
		green_1 = ( <tod_params> . green_1 ) 
		blue_1 = ( <tod_params> . blue_1 ) 
		sky_red = ( sky_red ) 
		sky_green = ( sky_green ) 
		sky_blue = ( sky_blue ) 
		lev_red = ( lev_red ) 
		lev_green = ( lev_green ) 
		lev_blue = ( lev_blue ) 
		heading_0 = ( dir0_head ) 
		pitch_0 = ( dir0_pitch ) 
		heading_1 = ( dir1_head ) 
		pitch_1 = ( dir1_pitch ) 
		fog_red = ( fog_red ) 
		fog_green = ( fog_green ) 
		fog_blue = ( fog_blue ) 
		fog_alpha = ( fog_alpha ) 
		fog_dist = ( fog_dist ) 
		fog_on = <fog_on> 
		sky_red = ( sky_red ) 
		sky_green = ( sky_green ) 
		sky_blue = ( sky_blue ) 
		state_length = 180000 
	} 
	SWITCH ( <tod_params> . current_state_name ) 
		CASE morning 
			morning_params = { ( tod_manager_default_morning ) <new_params> } 
			cur_params = <morning_params> 
		CASE afternoon 
			afternoon_params = { ( tod_manager_default_afternoon ) <new_params> } 
			cur_params = <afternoon_params> 
		CASE evening 
			evening_params = { ( tod_manager_default_evening ) <new_params> } 
			cur_params = <evening_params> 
		CASE night 
			night_params = { ( tod_manager_default_night ) <new_params> } 
			cur_params = <night_params> 
		DEFAULT 
			afternoon_params = { ( tod_manager_default_afternoon ) <new_params> } 
			cur_params = <afternoon_params> 
	ENDSWITCH 
	TODManager_SetParams { 
		system = 1 
		transition_length = 90 
		groups = [ 
			{ parts = 6 wait_frames = 3 light_group = outdoor } 
			{ parts = 2 wait_frames = 3 light_group = nolevellights reset_lightgroup = indoor } 
		] 
		overwrite_current_state = <cur_params> 
		morning = <morning_params> 
		afternoon = <afternoon_params> 
		evening = <evening_params> 
		night = <night_params> 
	} 
	TODManager_SetParams { 
		system = 2 
		sky 
		transition_length = 90 
		groups = [ 
			{ parts = 6 wait_frames = 3 light_group = outdoor } 
			{ parts = 2 wait_frames = 3 light_group = nolevellights reset_lightgroup = indoor } 
		] 
		overwrite_current_state = <cur_params> 
		morning = <morning_params> 
		afternoon = <afternoon_params> 
		evening = <evening_params> 
		night = <night_params> 
	} 
	SetLightDirection index = 0 heading = dir0_head pitch = dir0_pitch 
	SetLightDirection index = 1 heading = dir1_head pitch = dir1_pitch 
	IF IsTrue cutscene_is_playing 
		TODManager_SetTODInstant ( <tod_params> . current_state_name ) 
		change todmanager_temp_tod_changed = 1 
	ENDIF 
ENDSCRIPT

SCRIPT incr_pitch_val step = 1 max = 360 min = 0 
	GetTags 
	set_current_tod_values 
	IF GotParam reverse 
		step = ( -1 * <step> ) 
	ENDIF 
	step = ( <step> * step_multiplier ) 
	SWITCH current_lighting 
		CASE 0 
			RETURN 
		CASE 1 
			change dir0_pitch = ( dir0_pitch + <step> ) 
			IF ( dir0_pitch > <max> ) 
				change dir0_pitch = <min> 
			ENDIF 
			IF ( <min> > dir0_pitch ) 
				change dir0_pitch = <max> 
			ENDIF 
			FormatText TextName = value_text "%i" i = dir0_pitch 
		CASE 2 
			change dir1_pitch = ( dir1_pitch + <step> ) 
			IF ( dir1_pitch > <max> ) 
				change dir1_pitch = <min> 
			ENDIF 
			IF ( <min> > dir1_pitch ) 
				change dir1_pitch = <max> 
			ENDIF 
			FormatText TextName = value_text "%i" i = dir1_pitch 
	ENDSWITCH 
	SetScreenElementProps id = { <id> child = 0 } text = <value_text> 
	SetLightDirection index = 0 heading = dir0_head pitch = dir0_pitch 
	SetLightDirection index = 1 heading = dir1_head pitch = dir1_pitch 
	TODManager_GetCurrentTODParams 
	morning_params = ( tod_manager_default_morning ) 
	afternoon_params = ( tod_manager_default_afternoon ) 
	evening_params = ( tod_manager_default_evening ) 
	night_params = ( tod_manager_default_night ) 
	new_params = { 
		ambient_red = ( <tod_params> . ambient_red ) 
		ambient_green = ( <tod_params> . ambient_green ) 
		ambient_blue = ( <tod_params> . ambient_blue ) 
		ambient_mod_factor_lo = ( amb_mod_lo ) 
		ambient_mod_factor_hi = ( amb_mod_hi ) 
		red_0 = ( <tod_params> . red_0 ) 
		green_0 = ( <tod_params> . green_0 ) 
		blue_0 = ( <tod_params> . blue_0 ) 
		red_1 = ( <tod_params> . red_1 ) 
		green_1 = ( <tod_params> . green_1 ) 
		blue_1 = ( <tod_params> . blue_1 ) 
		sky_red = ( sky_red ) 
		sky_green = ( sky_green ) 
		sky_blue = ( sky_blue ) 
		lev_red = ( lev_red ) 
		lev_green = ( lev_green ) 
		lev_blue = ( lev_blue ) 
		heading_0 = ( dir0_head ) 
		pitch_0 = ( dir0_pitch ) 
		heading_1 = ( dir1_head ) 
		pitch_1 = ( dir1_pitch ) 
		fog_red = ( fog_red ) 
		fog_green = ( fog_green ) 
		fog_blue = ( fog_blue ) 
		fog_alpha = ( fog_alpha ) 
		fog_dist = ( fog_dist ) 
		fog_on = <fog_on> 
		sky_red = ( sky_red ) 
		sky_green = ( sky_green ) 
		sky_blue = ( sky_blue ) 
		state_length = 180000 
	} 
	SWITCH ( <tod_params> . current_state_name ) 
		CASE morning 
			morning_params = { ( tod_manager_default_morning ) <new_params> } 
			cur_params = <morning_params> 
		CASE afternoon 
			afternoon_params = { ( tod_manager_default_afternoon ) <new_params> } 
			cur_params = <afternoon_params> 
		CASE evening 
			evening_params = { ( tod_manager_default_evening ) <new_params> } 
			cur_params = <evening_params> 
		CASE night 
			night_params = { ( tod_manager_default_night ) <new_params> } 
			cur_params = <night_params> 
		DEFAULT 
			afternoon_params = { ( tod_manager_default_afternoon ) <new_params> } 
			cur_params = <afternoon_params> 
	ENDSWITCH 
	TODManager_SetParams { 
		system = 1 
		transition_length = 90 
		groups = [ 
			{ parts = 6 wait_frames = 3 light_group = outdoor } 
			{ parts = 2 wait_frames = 3 light_group = nolevellights reset_lightgroup = indoor } 
		] 
		overwrite_current_state = <cur_params> 
		morning = <morning_params> 
		afternoon = <afternoon_params> 
		evening = <evening_params> 
		night = <night_params> 
	} 
	TODManager_SetParams { 
		system = 2 
		sky 
		transition_length = 90 
		groups = [ 
			{ parts = 6 wait_frames = 3 light_group = outdoor } 
			{ parts = 2 wait_frames = 3 light_group = nolevellights reset_lightgroup = indoor } 
		] 
		overwrite_current_state = <cur_params> 
		morning = <morning_params> 
		afternoon = <afternoon_params> 
		evening = <evening_params> 
		night = <night_params> 
	} 
	IF IsTrue cutscene_is_playing 
		TODManager_SetTODInstant ( <tod_params> . current_state_name ) 
		change todmanager_temp_tod_changed = 1 
	ENDIF 
ENDSCRIPT

SCRIPT GetCurrentLightingValues 
	GetLightCurrentColor 
	RETURN <...> 
ENDSCRIPT

SCRIPT toggle_step_multiplier 
	IF ( step_multiplier = 1 ) 
		change step_multiplier = 10 
	ELSE 
		change step_multiplier = 1 
	ENDIF 
	printf "step_multiplier = %s" s = step_multiplier 
ENDSCRIPT

SCRIPT toggle_color_lock 
	IF ( lock_color_values = 1 ) 
		change lock_color_values = 0 
		printf "RGB values UNlocked" 
	ELSE 
		change lock_color_values = 1 
		printf "RGB values locked" 
	ENDIF 
ENDSCRIPT

SCRIPT toggle_dir_light_on_off 
	IF ( <index> = 0 ) 
		IF ( toggle_dir0 = 1 ) 
			GetCurrentLightingValues 
			change last_dir0_red = <red_0> 
			change last_dir0_green = <green_0> 
			change last_dir0_blue = <blue_0> 
			SetLightDiffuseColor index = 0 r = 0 g = 0 b = 0 
			change toggle_dir0 = 0 
			SetScreenElementProps id = { menu_onoff child = 0 } text = "off" 
		ELSE 
			SetLightDiffuseColor index = 0 r = last_dir0_red g = last_dir0_green b = last_dir0_blue 
			change toggle_dir0 = 1 
			SetScreenElementProps id = { menu_onoff child = 0 } text = "on" 
		ENDIF 
	ELSE 
		IF ( <index> = 1 ) 
			IF ( toggle_dir1 = 1 ) 
				GetCurrentLightingValues 
				change last_dir1_red = <red_1> 
				change last_dir1_green = <green_1> 
				change last_dir1_blue = <blue_1> 
				SetLightDiffuseColor index = 1 r = 0 g = 0 b = 0 
				change toggle_dir1 = 0 
				SetScreenElementProps id = { menu_onoff child = 0 } text = "off" 
			ELSE 
				SetLightDiffuseColor index = 1 r = last_dir1_red g = last_dir1_green b = last_dir1_blue 
				change toggle_dir1 = 1 
				SetScreenElementProps id = { menu_onoff child = 0 } text = "on" 
			ENDIF 
		ELSE 
			printf "toggle_dir_light_on_off: bad index value" 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT kill_lightlines_Max 
	killspawnedscript name = update_directional_light_pos2 
ENDSCRIPT

SCRIPT spawn_lightlines_Max 
	printstruct <...> 
	killspawnedscript name = update_directional_light_pos2 
	spawnscript { update_directional_light_pos2 
		params = { dir0_head = <h0> 
			dir0_pitch = <p0> 
			dir1_head = <h1> 
			dir1_pitch = <p1> 
		} 
	} 
ENDSCRIPT

SCRIPT update_directional_light_pos2 
	printstruct <...> 
	BEGIN 
		DrawDirectionalLightLines heading = <dir0_head> pitch = <dir0_pitch> r = 255 g = 0 b = 0 
		wait 1 gameframe 
		DrawDirectionalLightLines heading = <dir1_head> pitch = <dir1_pitch> r = 0 g = 0 b = 255 
		wait 1 gameframe 
	REPEAT 
ENDSCRIPT

SCRIPT SendCurrentLightingValuestoMax 
	printf "Sending Lighting Values to MAX" 
	GetLightCurrentColor 
	printf "Ambient_Red = %a Ambient_Green = %b Ambient_Blue = %c" a = <ambient_red> b = <ambient_green> c = <ambient_blue> file = "lighting.txt" 
	GetDynamicLightModulationFactor ambient 
	printf "Ambient_Mod_lo = %d AmbientMod_hi = %e" d = <mod_value_lo> e = <mod_value_hi> file = "lighting.txt" Append 
	printf "Red_0 = %e Green_0 = %f Blue_0 = %g" e = <red_0> f = <green_0> g = <blue_0> file = "lighting.txt" Append 
	getLightdirection index = 0 
	printf "Head_0 = %h Pitch_0 = %i" h = <heading> i = <pitch> file = "lighting.txt" Append 
	GetDynamicLightModulationFactor directional = 0 
	printf "Mod_0_lo = %j Mod_0_hi = %k" j = <mod_value_lo> k = <mod_value_hi> file = "lighting.txt" Append 
	printf "Red_1 = %k Green_1 = %l Blue_1 = %m" k = <red_1> l = <green_1> m = <blue_1> file = "lighting.txt" Append 
	getLightdirection index = 1 
	printf "Head_1 = %n Pitch_1 = %o" n = <heading> o = <pitch> file = "lighting.txt" Append 
	GetDynamicLightModulationFactor directional = 1 
	printf "Mod_1_lo = %j Mod_1_hi = %k" j = <mod_value_lo> k = <mod_value_hi> file = "lighting.txt" Append 
ENDSCRIPT

SCRIPT maxscriptConnection 
	GetCurrentLevel 
	printf "%l" l = <level> file = "Connection.txt" 
ENDSCRIPT

SCRIPT maxtest 
	getLightdirection index = 1 
	printf "Head_1 = %n Pitch_1 = %o" n = <heading> o = <pitch> 
	GetDynamicLightModulationFactor directional = 1 
	printf "Mod_1_lo = %p Mod_1_hi = %q" p = <mod_value_lo> q = <mod_value_hi> 
	getLightdirection index = 0 
	printstruct <...> 
ENDSCRIPT

SCRIPT update_directional_light_pos 
	BEGIN 
		IF ( toggle_dir0 = 1 ) 
			DrawDirectionalLightLines heading = dir0_head pitch = dir0_pitch r = 255 g = 0 b = 0 
			wait 1 gameframe 
		ENDIF 
		IF ( toggle_dir1 = 1 ) 
			DrawDirectionalLightLines heading = dir1_head pitch = dir1_pitch r = 0 g = 0 b = 255 
		ENDIF 
		wait 1 gameframe 
	REPEAT 
ENDSCRIPT

SCRIPT set_to_tod_values 
	IF NOT GotParam tod 
		RETURN 
	ENDIF 
	change amb_mod_lo = ( <tod> . ambient_mod_factor_lo ) 
	change amb_mod_hi = ( <tod> . ambient_mod_factor_hi ) 
	change dir0_mod_lo = ( <tod> . mod_factor_0_lo ) 
	change dir0_mod_hi = ( <tod> . mod_factor_0_hi ) 
	change dir1_mod_lo = ( <tod> . mod_factor_1_lo ) 
	change dir1_mod_hi = ( <tod> . mod_factor_1_hi ) 
	IF NOT GotParam level 
		change lev_red = ( <tod> . lev_red ) 
		change lev_green = ( <tod> . lev_green ) 
		change lev_blue = ( <tod> . lev_blue ) 
	ELSE 
	ENDIF 
	IF NOT GotParam no_fog 
		IF StructureContains structure = tod fog_red 
			change fog_red = ( <tod> . fog_red ) 
			change fog_green = ( <tod> . fog_green ) 
			change fog_blue = ( <tod> . fog_blue ) 
			change fog_alpha = ( <tod> . fog_alpha ) 
			change fog_dist = ( <tod> . fog_dist ) 
		ELSE 
			change fog_red = 0 
			change fog_green = 0 
			change fog_blue = 0 
			change fog_alpha = 0 
			change fog_dist = 0 
		ENDIF 
	ELSE 
		change fog_red = 0 
		change fog_green = 0 
		change fog_blue = 0 
		change fog_alpha = 0 
		change fog_dist = 0 
	ENDIF 
	change sky_red = 128 
	change sky_green = 128 
	change sky_blue = 128 
	ambient_red = ( <tod> . ambient_red ) 
	ambient_green = ( <tod> . ambient_green ) 
	ambient_blue = ( <tod> . ambient_blue ) 
	red_0 = ( <tod> . red_0 ) 
	green_0 = ( <tod> . green_0 ) 
	blue_0 = ( <tod> . blue_0 ) 
	red_1 = ( <tod> . red_1 ) 
	green_1 = ( <tod> . green_1 ) 
	blue_1 = ( <tod> . blue_1 ) 
	set_all_light_values <...> 
ENDSCRIPT

SCRIPT set_all_light_values 
	<color> = ( lev_red + ( lev_green * 256 ) + ( lev_blue * 65536 ) ) 
	<sky> = ( sky_red + ( sky_green * 256 ) + ( sky_blue * 65536 ) ) 
	lighting color = <color> sky = <sky> 
	IF NOT GotParam level_only 
		SetLightAmbientColor r = <ambient_red> g = <ambient_green> b = <ambient_blue> 
		SetLightDiffuseColor index = 0 r = <red_0> g = <green_0> b = <blue_0> 
		SetLightDiffuseColor index = 1 r = <red_1> g = <green_1> b = <blue_1> 
	ENDIF 
	SetFogColor r = fog_red b = fog_blue g = fog_green a = fog_alpha 
	SetFogDistance distance = fog_dist 
ENDSCRIPT

SCRIPT print_light_values 
	printf " " 
	printf "<---------------------------------------------->" 
	printf "Selected lighting values:" 
	printf "ambient_red = %i" i = <ambient_red> 
	printf "ambient_green = %i" i = <ambient_green> 
	printf "ambient_blue = %i" i = <ambient_blue> 
	printf "ambient_mod_factor_lo = %i" i = amb_mod_lo 
	printf "ambient_mod_factor_hi = %i" i = amb_mod_hi 
	printf " " 
	IF ( toggle_dir0 = 1 ) 
		printf "heading_0 = %i" i = dir0_head 
		printf "pitch_0 = %i" i = dir0_pitch 
		printf "red_0 = %i" i = <red_0> 
		printf "green_0 = %i" i = <green_0> 
		printf "blue_0 = %i" i = <blue_0> 
		printf "mod_factor_0_lo = %i" i = dir0_mod_lo 
		printf "mod_factor_0_hi = %i" i = dir0_mod_hi 
		printf " " 
	ENDIF 
	IF ( toggle_dir1 = 1 ) 
		printf "heading_1 = %i" i = dir1_head 
		printf "pitch_1 = %i" i = dir1_pitch 
		printf "red_1 = %i" i = <red_1> 
		printf "green_1 = %i" i = <green_1> 
		printf "blue_1 = %i" i = <blue_1> 
		printf "mod_factor_1_lo = %i" i = dir1_mod_lo 
		printf "mod_factor_1_hi = %i" i = dir1_mod_hi 
		printf "dir light 2 on/off = %i" i = toggle_dir1 
		printf " " 
	ENDIF 
	printf "lev_red = %i" i = lev_red 
	printf "lev_green = %i" i = lev_green 
	printf "lev_blue  = %i" i = lev_blue 
	printf " " 
	printf "sky_red  = %i" i = sky_red 
	printf "sky_green  = %i" i = sky_green 
	printf "sky_blue  = %i" i = sky_blue 
	printf " " 
	printf "fog_on  = %i" i = fog_state 
	printf "fog_red  = %i" i = fog_red 
	printf "fog_green  = %i" i = fog_green 
	printf "fog_blue  = %i" i = fog_blue 
	printf "fog_alpha  = %i" i = fog_alpha 
	printf "fog_dist  = %i" i = fog_dist 
	printf " " 
	printf "<---------------------------------------------->" 
	printf " " 
	killspawnedscript name = update_directional_light_pos 
	makeskatergoto ongroundai 
	IF CutsceneFinished 
		pauseGame 
	ENDIF 
	TODManager_SetTimeMultiplier <TOD_Time_Multiplier> 
	SetAnalogStickActiveForMenus 1 
	IF CutsceneFinished 
		launch_lighttool_sub_menu 
	ELSE 
		IF ScreenElementExists id = current_menu_anchor 
			DestroyScreenElement id = current_menu_anchor 
		ENDIF 
		IF ScreenElementExists id = light_menu 
			DestroyScreenElement id = light_menu 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT toggle_rain_snow 
	IF ( rain_or_snow = 0 ) 
		change rain_or_snow = 1 
		WeatherSetSnowActive 
		rain_text = "snow" 
	ELSE 
		change rain_or_snow = 0 
		WeatherSetRainActive 
		rain_text = "rain" 
	ENDIF 
	SetScreenElementProps id = { menu_rain child = 0 } text = <rain_text> 
ENDSCRIPT

SCRIPT incr_rain_val step = 1 max = 128 min = 0 
	GetTags 
	IF GotParam reverse 
		step = ( -1 * <step> ) 
	ENDIF 
	step = ( <step> * step_multiplier ) 
	SWITCH <id> 
		CASE menu_rate 
			change rain_rate = ( rain_rate + <step> ) 
			IF ( rain_rate > ( 1024 / rain_frames ) ) 
				change rain_rate = ( 1024 / rain_frames ) 
			ELSE 
				IF ( 0 > rain_rate ) 
					change rain_rate = 0 
				ENDIF 
			ENDIF 
			FormatText TextName = value_text "%i" i = rain_rate 
			WeatherSetRainRate rain_rate 
		CASE menu_frames 
			change rain_frames = ( rain_frames + <step> ) 
			IF ( rain_frames > 255 ) 
				change rain_frames = 255 
			ELSE 
				IF ( 1 > rain_frames ) 
					change rain_frames = 1 
				ENDIF 
			ENDIF 
			FormatText TextName = value_text "%i" i = rain_frames 
			WeatherSetRainFrames rain_frames 
		CASE menu_height 
			change rain_height = ( rain_height + <step> ) 
			IF ( rain_height > 3000 ) 
				change rain_height = 3000 
			ELSE 
				IF ( 0 > rain_height ) 
					change rain_height = 0 
				ENDIF 
			ENDIF 
			FormatText TextName = value_text "%i" i = rain_height 
			WeatherSetRainHeight rain_height 
		CASE menu_length 
			change rain_length = ( rain_length + <step> ) 
			IF ( rain_length > 200 ) 
				change rain_length = 200 
			ELSE 
				IF ( 0 > rain_length ) 
					change rain_length = 0 
				ENDIF 
			ENDIF 
			FormatText TextName = value_text "%i" i = rain_length 
			WeatherSetRainLength rain_length 
		CASE menu_blend 
			IF NOT GotParam reverse 
				change rain_blend = ( rain_blend + 1 ) 
			ELSE 
				change rain_blend = ( rain_blend - 1 ) 
			ENDIF 
			IF ( rain_blend > 10 ) 
				change rain_blend = 0 
			ELSE 
				IF ( 0 > rain_blend ) 
					change rain_blend = 10 
				ENDIF 
			ENDIF 
			get_rain_mode_string 
			WeatherSetRainBlendMode <checksum> ( rain_fixed + 0 ) 
		CASE menu_fixed 
			change rain_fixed = ( rain_fixed + <step> ) 
			IF ( rain_fixed > 128 ) 
				change rain_fixed = 128 
			ELSE 
				IF ( 0 > rain_fixed ) 
					change rain_fixed = 0 
				ENDIF 
			ENDIF 
			get_rain_mode_string 
			WeatherSetRainBlendMode <checksum> ( rain_fixed + 0 ) 
			FormatText TextName = value_text "%i" i = rain_fixed 
	ENDSWITCH 
	SetScreenElementProps id = { <id> child = 0 } text = <value_text> 
ENDSCRIPT

SCRIPT get_rain_mode_string 
	IF GotParam splash 
		value = splash_blend 
	ELSE 
		IF GotParam snow 
			value = snow_blend 
		ELSE 
			value = rain_blend 
		ENDIF 
	ENDIF 
	SWITCH <value> 
		CASE 0 
			value_text = "blend" 
		CASE 1 
			value_text = "add" 
		CASE 2 
			value_text = "sub" 
		CASE 3 
			value_text = "modulate" 
		CASE 4 
			value_text = "brighten" 
		CASE 5 
			value_text = "fixblend" 
		CASE 6 
			value_text = "fixadd" 
		CASE 7 
			value_text = "fixsub" 
		CASE 8 
			value_text = "fixmodulate" 
		CASE 9 
			value_text = "fixbrighten" 
		CASE 10 
			value_text = "diffuse" 
	ENDSWITCH 
	FormatText checksumname = checksum "%i" i = <value_text> 
	RETURN { value_text = <value_text> checksum = <checksum> } 
ENDSCRIPT

SCRIPT incr_rain_color step = 1 max = 128 min = 0 
	GetTags 
	IF GotParam reverse 
		step = ( -1 * <step> ) 
	ENDIF 
	step = ( <step> * step_multiplier ) 
	IF GotParam splash 
		value_red = ( splash_red ) 
		value_green = ( splash_green ) 
		value_blue = ( splash_blue ) 
		value_alpha = ( splash_alpha ) 
	ENDIF 
	IF GotParam snow 
		value_red = ( snow_red ) 
		value_green = ( snow_green ) 
		value_blue = ( snow_blue ) 
		value_alpha = ( snow_alpha ) 
	ENDIF 
	IF GotParam rain 
		value_red = ( rain_red ) 
		value_green = ( rain_green ) 
		value_blue = ( rain_blue ) 
		value_alpha = ( rain_alpha ) 
	ENDIF 
	SWITCH <id> 
		CASE menu_red 
			value_red = ( <value_red> + <step> ) 
			IF ( <value_red> > 255 ) 
				value_red = 255 
			ELSE 
				IF ( 0 > <value_red> ) 
					value_red = 0 
				ENDIF 
			ENDIF 
			FormatText TextName = value_text "%i" i = <value_red> 
		CASE menu_blue 
			value_blue = ( <value_blue> + <step> ) 
			IF ( <value_blue> > 255 ) 
				value_blue = 255 
			ELSE 
				IF ( 0 > <value_blue> ) 
					value_blue = 0 
				ENDIF 
			ENDIF 
			FormatText TextName = value_text "%i" i = <value_blue> 
		CASE menu_green 
			value_green = ( <value_green> + <step> ) 
			IF ( <value_green> > 255 ) 
				value_green = 255 
			ELSE 
				IF ( 0 > <value_green> ) 
					value_green = 0 
				ENDIF 
			ENDIF 
			FormatText TextName = value_text "%i" i = <value_green> 
		CASE menu_alpha 
			value_alpha = ( <value_alpha> + <step> ) 
			IF ( <value_alpha> > 255 ) 
				value_alpha = 255 
			ELSE 
				IF ( 0 > <value_alpha> ) 
					value_alpha = 0 
				ENDIF 
			ENDIF 
			FormatText TextName = value_text "%i" i = <value_alpha> 
		CASE menu_red2 
			change rain_red2 = ( rain_red2 + <step> ) 
			IF ( rain_red2 > 255 ) 
				change rain_red2 = 255 
			ELSE 
				IF ( 0 > rain_red2 ) 
					change rain_red2 = 0 
				ENDIF 
			ENDIF 
			FormatText TextName = value_text "%i" i = rain_red2 
		CASE menu_blue2 
			change rain_blue2 = ( rain_blue2 + <step> ) 
			IF ( rain_blue2 > 255 ) 
				change rain_blue2 = 255 
			ELSE 
				IF ( 0 > rain_blue2 ) 
					change rain_blue2 = 0 
				ENDIF 
			ENDIF 
			FormatText TextName = value_text "%i" i = rain_blue2 
		CASE menu_green2 
			change rain_green2 = ( rain_green2 + <step> ) 
			IF ( rain_green2 > 255 ) 
				change rain_green2 = 255 
			ELSE 
				IF ( 0 > rain_green2 ) 
					change rain_green2 = 0 
				ENDIF 
			ENDIF 
			FormatText TextName = value_text "%i" i = rain_green2 
		CASE menu_alpha2 
			change rain_alpha2 = ( rain_alpha2 + <step> ) 
			IF ( rain_alpha2 > 255 ) 
				change rain_alpha2 = 255 
			ELSE 
				IF ( 0 > rain_alpha2 ) 
					change rain_alpha2 = 0 
				ENDIF 
			ENDIF 
			FormatText TextName = value_text "%i" i = rain_alpha2 
	ENDSWITCH 
	SetScreenElementProps id = { <id> child = 0 } text = <value_text> 
	<color> = ( <value_red> + ( <value_green> * 256 ) + ( <value_blue> * 65536 ) + ( <value_alpha> * 16777216 ) ) 
	IF GotParam splash 
		change splash_red = <value_red> 
		change splash_green = <value_green> 
		change splash_blue = <value_blue> 
		change splash_alpha = <value_alpha> 
		WeatherSetSplashColor <color> 
	ENDIF 
	IF GotParam snow 
		change snow_red = <value_red> 
		change snow_green = <value_green> 
		change snow_blue = <value_blue> 
		change snow_alpha = <value_alpha> 
		WeatherSetSnowColor <color> 
	ENDIF 
	IF GotParam rain 
		change rain_red = <value_red> 
		change rain_green = <value_green> 
		change rain_blue = <value_blue> 
		change rain_alpha = <value_alpha> 
		<color2> = ( rain_red2 + ( rain_green2 * 256 ) + ( rain_blue2 * 65536 ) + ( rain_alpha2 * 16777216 ) ) 
		WeatherSetRainColor top = <color> bottom = <color2> 
	ENDIF 
ENDSCRIPT

SCRIPT incr_splash_val step = 1 max = 128 min = 0 
	GetTags 
	IF GotParam reverse 
		step = ( -1 * <step> ) 
	ENDIF 
	step = ( <step> * step_multiplier ) 
	SWITCH <id> 
		CASE menu_rate 
			change splash_rate = ( splash_rate + ( <step> / 20.00000000000 ) ) 
			IF ( splash_rate > 1 ) 
				change splash_rate = 1.00000000000 
			ELSE 
				IF ( 0 > splash_rate ) 
					change splash_rate = 0.00000000000 
				ENDIF 
			ENDIF 
			FormatText TextName = value_text "%i" i = splash_rate 
			WeatherSetSplashRate splash_rate 
		CASE menu_life 
			change splash_life = ( splash_life + <step> ) 
			IF ( splash_life > 100 ) 
				change splash_life = 100 
			ELSE 
				IF ( 1 > splash_life ) 
					change splash_life = 1 
				ENDIF 
			ENDIF 
			FormatText TextName = value_text "%i" i = splash_life 
			WeatherSetSplashLife splash_life 
		CASE menu_size 
			change splash_size = ( splash_size + <step> ) 
			IF ( splash_size > 100 ) 
				change splash_size = 100 
			ELSE 
				IF ( 0 > splash_size ) 
					change splash_size = 0 
				ENDIF 
			ENDIF 
			FormatText TextName = value_text "%i" i = splash_size 
			WeatherSetSplashSize splash_size 
		CASE menu_blend 
			IF NOT GotParam reverse 
				change splash_blend = ( splash_blend + 1 ) 
			ELSE 
				change splash_blend = ( splash_blend - 1 ) 
			ENDIF 
			IF ( splash_blend > 10 ) 
				change splash_blend = 0 
			ELSE 
				IF ( 0 > splash_blend ) 
					change splash_blend = 10 
				ENDIF 
			ENDIF 
			get_rain_mode_string splash 
			WeatherSetSplashBlendMode <checksum> ( splash_fixed + 0 ) 
		CASE menu_fixed 
			change splash_fixed = ( splash_fixed + <step> ) 
			IF ( splash_fixed > 128 ) 
				change splash_fixed = 128 
			ELSE 
				IF ( 0 > splash_fixed ) 
					change splash_fixed = 0 
				ENDIF 
			ENDIF 
			get_rain_mode_string splash 
			WeatherSetSplashBlendMode <checksum> ( splash_fixed + 0 ) 
			FormatText TextName = value_text "%i" i = splash_fixed 
	ENDSWITCH 
	SetScreenElementProps id = { <id> child = 0 } text = <value_text> 
ENDSCRIPT

SCRIPT incr_snow_val step = 1 max = 128 min = 0 
	GetTags 
	IF GotParam reverse 
		step = ( -1 * <step> ) 
	ENDIF 
	step = ( <step> * step_multiplier ) 
	SWITCH <id> 
		CASE menu_rate 
			change snow_rate = ( snow_rate + <step> ) 
			IF ( snow_rate > ( 1024 / snow_frames ) ) 
				change snow_rate = ( 1024 / snow_frames ) 
			ELSE 
				IF ( 0 > snow_rate ) 
					change snow_rate = 0 
				ENDIF 
			ENDIF 
			FormatText TextName = value_text "%i" i = snow_rate 
			WeatherSetSnowRate snow_rate 
		CASE menu_frames 
			change snow_frames = ( snow_frames + <step> ) 
			IF ( snow_frames > 254 ) 
				change snow_frames = 254 
			ELSE 
				IF ( 1 > snow_frames ) 
					change snow_frames = 1 
				ENDIF 
			ENDIF 
			FormatText TextName = value_text "%i" i = snow_frames 
			WeatherSetSnowFrames snow_frames 
		CASE menu_height 
			change snow_height = ( snow_height + <step> ) 
			IF ( snow_height > 3000 ) 
				change snow_height = 3000 
			ELSE 
				IF ( 0 > snow_height ) 
					change snow_height = 0 
				ENDIF 
			ENDIF 
			FormatText TextName = value_text "%i" i = snow_height 
			WeatherSetSnowHeight snow_height 
		CASE menu_size 
			change snow_size = ( snow_size + <step> ) 
			IF ( snow_size > 200 ) 
				change snow_size = 200 
			ELSE 
				IF ( 0 > snow_size ) 
					change snow_size = 0 
				ENDIF 
			ENDIF 
			FormatText TextName = value_text "%i" i = snow_size 
			WeatherSetSnowSize snow_size 
		CASE menu_blend 
			IF NOT GotParam reverse 
				change snow_blend = ( snow_blend + 1 ) 
			ELSE 
				change snow_blend = ( snow_blend - 1 ) 
			ENDIF 
			IF ( snow_blend > 10 ) 
				change snow_blend = 0 
			ELSE 
				IF ( 0 > snow_blend ) 
					change snow_blend = 10 
				ENDIF 
			ENDIF 
			get_rain_mode_string snow 
			WeatherSetSnowBlendMode <checksum> ( snow_fixed + 0 ) 
		CASE menu_fixed 
			change snow_fixed = ( snow_fixed + <step> ) 
			IF ( snow_fixed > 128 ) 
				change snow_fixed = 128 
			ELSE 
				IF ( 0 > snow_fixed ) 
					change snow_fixed = 0 
				ENDIF 
			ENDIF 
			get_rain_mode_string snow 
			WeatherSetSnowBlendMode <checksum> ( snow_fixed + 0 ) 
			FormatText TextName = value_text "%i" i = snow_fixed 
	ENDSWITCH 
	SetScreenElementProps id = { <id> child = 0 } text = <value_text> 
ENDSCRIPT

poly_count_on = 0 
SCRIPT show_poly_count 
ENDSCRIPT

SCRIPT refresh_poly_count 
ENDSCRIPT

SCRIPT refresh_poly_count_repeatedly 
	* / 
ENDSCRIPT

SCRIPT switch_off_poly_count_refresh 
ENDSCRIPT

SCRIPT screen_outline rgba = [ 128 128 128 128 ] 
ENDSCRIPT


