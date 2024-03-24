
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
morning_sun_theta = 0.0
morning_sun_phi = -10.0
morning_sun_red = 255.0
morning_sun_green = 210.0
morning_sun_blue = 172.0
afternoon_sun_theta = 0.0
afternoon_sun_phi = 20.0
afternoon_sun_red = 255.0
afternoon_sun_green = 210.0
afternoon_sun_blue = 172.0
evening_sun_theta = 0.0
evening_sun_phi = 180.0
evening_sun_red = 255.0
evening_sun_green = 128
evening_sun_blue = 64
night_sun_theta = 0.0
night_sun_phi = 200.0
night_sun_red = 0.0
night_sun_green = 0.0
night_sun_blue = 0.0
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

script launch_lighting_tool set = character
    UnpauseGame
    makeskatergoto freezeskater
    SetAnalogStickActiveForMenus 0
    if (got_intial_lighting = 0)
        get_level_light_values
        change got_intial_lighting = 1
    else
        <color> = (lev_red + (lev_green * 256)+ (lev_blue * 65536))
        <sky> = (sky_red + (sky_green * 256)+ (sky_blue * 65536))
        lighting color = <color> sky = <sky>
    endif
    removeparameter device_num
    removeparameter controller_num
    removeparameter type
    TODManager_GetTimeMultiplier
    TODManager_SetTimeMultiplier 0
    create_lighting_tool <...> remember_colors
endscript


script create_lighting_tool 
    if ObjectExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    if (<set> = character)
        if (current_lighting = 3)
            change current_lighting = 0
        else
            if (current_lighting > 3)
                change current_lighting = 2
            endif
        endif
    else
        if (current_lighting < 3)
            change current_lighting = 12
        else
            if (current_lighting > 12)
                change current_lighting = 3
            endif
        endif
    endif
    if (<set> = character)
        switch current_lighting
            case 0
            menu_title = 'AMBIENT'
            case 1
            menu_title = 'ONE'
            case 2
            menu_title = 'TWO'
            default 
            change current_lighting = 0
            menu_title = 'AMBIENT'
        endswitch
    else
        switch current_lighting
            case 3
            menu_title = 'LEVEL'
            case 4
            menu_title = 'FOG'
            case 5
            menu_title = 'SKY'
            case 6
            menu_title = 'TIME'
            case 7
            menu_title = 'RAIN'
            case 8
            menu_title = 'RAIN COLOR'
            case 9
            menu_title = 'SPLASH COLOR'
            case 10
            menu_title = 'SPLASH'
            case 11
            menu_title = 'SNOW'
            case 12
            menu_title = 'SNOW COLOR'
            default 
            change current_lighting = 3
            menu_title = 'LEVEL'
        endswitch
    endif
    GetCurrentLightingValues
    set_current_tod_values
    if GotParam remember_colors
        change amb_mod2_lo = (amb_mod_lo)
        change amb_mod2_hi = (amb_mod_hi)
        change dir0_head2 = (dir0_head)
        change dir0_pitch2 = (dir0_pitch)
        change dir0_mod2_hi = (dir0_mod_hi)
        change dir0_mod2_lo = (dir0_mod_lo)
        change dir1_head2 = (dir1_head)
        change dir1_pitch2 = (dir1_pitch)
        change dir1_mod2_lo = (dir1_mod_lo)
        change dir1_mod2_hi = (dir1_mod_hi)
        change ambient_red2 = <ambient_red>
        change ambient_green2 = <ambient_green>
        change ambient_blue2 = <ambient_blue>
        change red_02 = <red_0>
        change green_02 = <green_0>
        change blue_02 = <blue_0>
        change red_12 = <red_1>
        change green_12 = <green_1>
        change blue_12 = <blue_1>
    endif
    make_new_menu {
        menu_id = light_menu
        vmenu_id = light_vmenu
        menu_title = <menu_title>
        type = VMenu
        dims = (200.0, 200.0)
        padding_scale = 0.9500
        pos = (50.0, 180.0)
    }
    if (<set> = character)
        create_helper_text helper_pos = (320.0, 410.0) scale = 0.9500 helper_text_elements = [
            { text = '\b7/\b4=Select' }
            { text = '\b6/\b5=Adjust' }
            { text = '\m1=Back/Print Values' }
        ]
        create_helper_text anchor_id = helper_text_anchor2 scale = 0.9500 helper_text_elements = [
            { text = '\m0=toggle speed 1,10' }
            { text = '\m3=link/unlink color values' }
            { text = '\m4=toggle previous values' }
        ]
        removeparameter left
        SetScreenElementProps {
            id = light_vmenu
            event_handlers = [{pad_back print_light_values params = <...> }
                {pad_choose toggle_step_multiplier params = {}}
                {pad_square toggle_color_lock params = {}}
                {pad_circle toggle_old_colors params = <...> }
                {pad_l2 next_light params = { left <...>  }}
                {pad_r2 next_light params = { <...>  }}
                {pad_r1 toggle_light_menu_focus params = { off }}
            ]
        }
    else
        create_helper_text helper_pos = (320.0, 410.0) helper_text_elements = [
            { text = '\b7/\b4=Select' }
            { text = '\b6/\b5=Adjust' }
            { text = '\m1=Back/Print Values' }
        ]
        create_helper_text anchor_id = helper_text_anchor2 helper_text_elements = [
            { text = '\m0=toggle speed 1,10' }
            { text = '\m3=link/unlink color values' }
        ]
        removeparameter left
        SetScreenElementProps {
            id = light_vmenu
            event_handlers = [{pad_back print_light_values params = <...> }
                {pad_choose toggle_step_multiplier params = {}}
                {pad_square toggle_color_lock params = {}}
                {pad_l2 next_light params = { left <...>  }}
                {pad_r2 next_light params = { <...>  }}
                {pad_r1 toggle_light_menu_focus params = { off }}
            ]
        }
    endif
    if (toggle_dir0 = 1)
        dir0_on_text = 'on'
    else
        dir0_on_text = 'off'
    endif
    if (toggle_dir1 = 1)
        dir1_on_text = 'on'
    else
        dir1_on_text = 'off'
    endif
    if (fog_state = 1)
        fog_text = 'on'
    else
        fog_text = 'off'
    endif
    switch current_lighting
        case 0
        make_light_tool_item text = 'red' id = menu_red value = <ambient_red> pad_choose_script = incr_color_val
        make_light_tool_item text = 'green' id = menu_green value = <ambient_green> pad_choose_script = incr_color_val
        make_light_tool_item text = 'blue' id = menu_blue value = <ambient_blue> pad_choose_script = incr_color_val
        make_light_tool_item text = 'mod lo' id = menu_mod value = amb_mod_lo pad_choose_script = incr_mod_val
        make_light_tool_item text = 'mod hi' id = menu_mod2 value = amb_mod_hi pad_choose_script = incr_mod_val2
        case 1
        make_light_tool_item text = 'heading' id = menu_heading value = dir0_head pad_choose_script = incr_heading_val
        make_light_tool_item text = 'pitch' id = menu_pitch value = dir0_pitch pad_choose_script = incr_pitch_val
        make_light_tool_item text = 'red' id = menu_red value = <red_0> pad_choose_script = incr_color_val
        make_light_tool_item text = 'green' id = menu_green value = <green_0> pad_choose_script = incr_color_val
        make_light_tool_item text = 'blue' id = menu_blue value = <blue_0> pad_choose_script = incr_color_val
        make_light_tool_item text = 'mod lo' id = menu_mod1 value = dir0_mod_lo pad_choose_script = incr_mod_val
        make_light_tool_item text = 'mod hi' id = menu_mod2 value = dir0_mod_hi pad_choose_script = incr_mod_val2
        make_light_tool_item text = 'light' id = menu_onoff value_text = <dir0_on_text> pad_choose_script = toggle_dir_light_on_off params = { index = 0 }
        case 2
        make_light_tool_item text = 'heading' id = menu_heading value = dir1_head pad_choose_script = incr_heading_val
        make_light_tool_item text = 'pitch' id = menu_pitch value = dir1_pitch pad_choose_script = incr_pitch_val
        make_light_tool_item text = 'red' id = menu_red value = <red_1> pad_choose_script = incr_color_val
        make_light_tool_item text = 'green' id = menu_green value = <green_1> pad_choose_script = incr_color_val
        make_light_tool_item text = 'blue' id = menu_blue value = <blue_1> pad_choose_script = incr_color_val
        make_light_tool_item text = 'mod lo' id = menu_mod1 value = dir1_mod_lo pad_choose_script = incr_mod_val
        make_light_tool_item text = 'mod hi' id = menu_mod2 value = dir1_mod_hi pad_choose_script = incr_mod_val2
        make_light_tool_item text = 'light' id = menu_onoff value_text = <dir1_on_text> pad_choose_script = toggle_dir_light_on_off params = { index = 1 }
        case 3
        make_light_tool_item text = 'red' id = menu_red value = lev_red pad_choose_script = incr_color_val
        make_light_tool_item text = 'green' id = menu_green value = lev_green pad_choose_script = incr_color_val
        make_light_tool_item text = 'blue' id = menu_blue value = lev_blue pad_choose_script = incr_color_val
        case 4
        make_light_tool_item text = 'red' id = menu_red value = fog_red pad_choose_script = incr_color_val
        make_light_tool_item text = 'green' id = menu_green value = fog_green pad_choose_script = incr_color_val
        make_light_tool_item text = 'blue' id = menu_blue value = fog_blue pad_choose_script = incr_color_val
        make_light_tool_item text = 'alpha' id = menu_alpha value = fog_alpha pad_choose_script = incr_color_val
        make_light_tool_item text = 'distance' id = menu_exp value = fog_dist pad_choose_script = incr_color_val
        make_light_tool_item text = 'fog' id = menu_fog value = <fog_text> pad_choose_script = incr_color_val
        case 5
        make_light_tool_item text = 'red' id = menu_red value = sky_red pad_choose_script = incr_color_val
        make_light_tool_item text = 'green' id = menu_green value = sky_green pad_choose_script = incr_color_val
        make_light_tool_item text = 'blue' id = menu_blue value = sky_blue pad_choose_script = incr_color_val
        case 6
        SetScreenElementProps {
            id = light_vmenu
            event_handlers = [{pad_choose null_script params = {}}] replace_handlers
        }
        make_text_sub_menu_item text = 'Day' id = menu_day pad_choose_script = tod_light_set_instant pad_choose_params = { tod_state = afternoon }
        make_text_sub_menu_item text = 'Morning' id = menu_morn pad_choose_script = tod_light_set_instant pad_choose_params = { tod_state = morning }
        make_text_sub_menu_item text = 'Evening' id = menu_even pad_choose_script = tod_light_set_instant pad_choose_params = { tod_state = evening }
        make_text_sub_menu_item text = 'Night' id = menu_night pad_choose_script = tod_light_set_instant pad_choose_params = { tod_state = night }
        case 7
        if (rain_or_snow = 0)
            rain_text = 'rain'
        else
            rain_text = 'snow'
        endif
        make_light_tool_item text = 'Rain/Snow' id = menu_rain value = <rain_text> pad_choose_script = toggle_rain_snow
        make_light_tool_item text = 'rate' id = menu_rate value = rain_rate pad_choose_script = incr_rain_val
        make_light_tool_item text = 'frames' id = menu_frames value = rain_frames pad_choose_script = incr_rain_val
        make_light_tool_item text = 'height' id = menu_height value = rain_height pad_choose_script = incr_rain_val
        make_light_tool_item text = 'length' id = menu_length value = rain_length pad_choose_script = incr_rain_val
        get_rain_mode_string
        make_light_tool_item text = 'blendmode' id = menu_blend value_text = <value_text> pad_choose_script = incr_rain_val
        make_light_tool_item text = 'fixalpha' id = menu_fixed value = rain_fixed pad_choose_script = incr_rain_val
        case 8
        make_light_tool_item text = 'red' id = menu_red value = rain_red pad_choose_script = incr_rain_color params = { rain }
        make_light_tool_item text = 'green' id = menu_green value = rain_green pad_choose_script = incr_rain_color params = { rain }
        make_light_tool_item text = 'blue' id = menu_blue value = rain_blue pad_choose_script = incr_rain_color params = { rain }
        make_light_tool_item text = 'alpha' id = menu_alpha value = rain_alpha pad_choose_script = incr_rain_color params = { rain }
        make_light_tool_item text = 'red2' id = menu_red2 value = rain_red2 pad_choose_script = incr_rain_color params = { rain }
        make_light_tool_item text = 'green2' id = menu_green2 value = rain_green2 pad_choose_script = incr_rain_color params = { rain }
        make_light_tool_item text = 'blue2' id = menu_blue2 value = rain_blue2 pad_choose_script = incr_rain_color params = { rain }
        make_light_tool_item text = 'alpha2' id = menu_alpha2 value = rain_alpha2 pad_choose_script = incr_rain_color params = { rain }
        case 9
        make_light_tool_item text = 'rate' id = menu_rate value = splash_rate pad_choose_script = incr_splash_val
        make_light_tool_item text = 'life' id = menu_life value = splash_life pad_choose_script = incr_splash_val
        make_light_tool_item text = 'size' id = menu_size value = splash_size pad_choose_script = incr_splash_val
        get_rain_mode_string splash
        make_light_tool_item text = 'blendmode' id = menu_blend value_text = <value_text> pad_choose_script = incr_splash_val
        make_light_tool_item text = 'fixalpha' id = menu_fixed value = splash_fixed pad_choose_script = incr_splash_val
        case 10
        make_light_tool_item text = 'red' id = menu_red value = splash_red pad_choose_script = incr_rain_color params = { splash }
        make_light_tool_item text = 'green' id = menu_green value = splash_green pad_choose_script = incr_rain_color params = { splash }
        make_light_tool_item text = 'blue' id = menu_blue value = splash_blue pad_choose_script = incr_rain_color params = { splash }
        make_light_tool_item text = 'alpha' id = menu_alpha value = splash_alpha pad_choose_script = incr_rain_color params = { splash }
        case 11
        if (rain_or_snow = 0)
            rain_text = 'rain'
        else
            rain_text = 'snow'
        endif
        make_light_tool_item text = 'Rain/Snow' id = menu_rain value = <rain_text> pad_choose_script = toggle_rain_snow
        make_light_tool_item text = 'rate' id = menu_rate value = snow_rate pad_choose_script = incr_snow_val
        make_light_tool_item text = 'frames' id = menu_frames value = snow_frames pad_choose_script = incr_snow_val
        make_light_tool_item text = 'height' id = menu_height value = snow_height pad_choose_script = incr_snow_val
        make_light_tool_item text = 'size' id = menu_size value = snow_size pad_choose_script = incr_snow_val
        get_rain_mode_string snow
        make_light_tool_item text = 'blendmode' id = menu_blend value_text = <value_text> pad_choose_script = incr_snow_val
        make_light_tool_item text = 'fixalpha' id = menu_fixed value = snow_fixed pad_choose_script = incr_snow_val
        case 12
        make_light_tool_item text = 'red' id = menu_red value = snow_red pad_choose_script = incr_rain_color params = { snow }
        make_light_tool_item text = 'green' id = menu_green value = snow_green pad_choose_script = incr_rain_color params = { snow }
        make_light_tool_item text = 'blue' id = menu_blue value = snow_blue pad_choose_script = incr_rain_color params = { snow }
        make_light_tool_item text = 'alpha' id = menu_alpha value = snow_alpha pad_choose_script = incr_rain_color params = { snow }
        default 
        change current_lighting = 0
        create_lighting_tool
    endswitch
    spawnscript update_directional_light_pos
    FireEvent type = focus target = light_menu
endscript


script tod_light_set_instant 
    TODManager_SetTODInstant <tod_state>
    set_current_tod_values
endscript


script set_current_tod_values 
    TODManager_GetCurrentTODParams
    change lev_red = (<tod_params>.lev_red)
    change lev_green = (<tod_params>.lev_green)
    change lev_blue = (<tod_params>.lev_blue)
    fog_on = (<tod_params>.fog_on)
    change fog_red = (<tod_params>.fog_red)
    change fog_green = (<tod_params>.fog_green)
    change fog_blue = (<tod_params>.fog_blue)
    change fog_alpha = (<tod_params>.fog_alpha)
    change fog_dist = (<tod_params>.fog_dist)
    change sky_red = (<tod_params>.sky_red)
    change sky_green = (<tod_params>.sky_green)
    change sky_blue = (<tod_params>.sky_blue)
    change dir0_head = (<tod_params>.heading_0)
    change dir0_pitch = (<tod_params>.pitch_0)
    change dir1_head = (<tod_params>.heading_1)
    change dir1_pitch = (<tod_params>.pitch_1)
    change amb_mod_lo = (<tod_params>.ambient_mod_factor_lo)
    change amb_mod_hi = (<tod_params>.ambient_mod_factor_hi)
endscript


script toggle_old_colors 
    GetCurrentLightingValues
    amb_modt_lo = (amb_mod_lo)
    amb_modt_hi = (amb_mod_hi)
    dir0_headt = (dir0_head)
    dir0_pitcht = (dir0_pitch)
    dir0_modt_lo = (dir0_mod_lo)
    dir0_modt_hi = (dir0_mod_hi)
    dir1_headt = (dir1_head)
    dir1_pitcht = (dir1_pitch)
    dir1_modt_lo = (dir1_mod_lo)
    dir1_modt_hi = (dir1_mod_hi)
    ambient_redt = <ambient_red>
    ambient_greent = <ambient_green>
    ambient_bluet = <ambient_blue>
    red_0t = <red_0>
    green_0t = <green_0>
    blue_0t = <blue_0>
    red_1t = <red_1>
    green_1t = <green_1>
    blue_1t = <blue_1>
    change amb_mod_lo = (amb_mod2_lo)
    change amb_mod_hi = (amb_mod2_hi)
    change dir0_head = (dir0_head2)
    change dir0_pitch = (dir0_pitch2)
    change dir0_mod_lo = (dir0_mod2_lo)
    change dir0_mod_hi = (dir0_mod2_hi)
    change dir1_head = (dir1_head2)
    change dir1_pitch = (dir1_pitch2)
    change dir1_mod_lo = (dir1_mod2_lo)
    change dir1_mod_hi = (dir1_mod2_hi)
    SetLightAmbientColor r = (ambient_red2)g = (ambient_green2)b = (ambient_blue2)
    SetLightDiffuseColor index = 0 r = (red_02)g = (green_02)b = (blue_02)
    SetLightDiffuseColor index = 1 r = (red_12)g = (green_12)b = (blue_12)
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
    if GotParam remember_colors
        removeparameter remember_colors
    endif
    create_lighting_tool <...> 
endscript


script toggle_light_menu_focus 
    if ScreenElementExists id = light_menu_focus_message
        DestroyScreenElement id = light_menu_focus_message
    endif
    if GotParam off
        FireEvent type = unfocus target = light_menu
        SetScreenElementLock id = light_menu off
        CreateScreenElement {
            type = TextElement
            parent = light_menu
            id = light_menu_focus_message
            font = small
            text = 'Light tool unfocused.  Press R2 to bring back into focus'
            pos = (320.0, 40.0)
            z_priority = 1000
            rgba = [ 128 80 80 128 ]
        }
        SetScreenElementProps {
            id = root_window
            event_handlers = [{pad_r1 toggle_light_menu_focus params = { on }}]
        }
    else
        if GotParam on
            FireEvent type = focus target = light_menu
            SetScreenElementProps {
                id = root_window
                event_handlers = [{pad_r1 null_script params = {}}]
                replace_handlers
            }
        endif
    endif
endscript


script get_level_light_values 
    if LevelIs Load_MainMenu
        this_level = level_skateshop
        no_fog = 1
    endif
    if LevelIs load_AU
        this_level = level_AU
    endif
    if LevelIs load_SC
        this_level = level_SC
    endif
    if LevelIs load_Default
        this_level = level_default
        no_fog = 1
    endif
    if LevelIs load_TestLevel
        this_level = level_testlevel
        no_fog = 1
    endif
    set_to_tod_values tod = <this_level> level no_fog = <no_fog>
endscript


script reset_light_values 
    printf 'Reset skater lighting to level defaults'
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
endscript


script next_light max = 13
    if GotParam left
        change current_lighting = (current_lighting - 1)
    else
        change current_lighting = (current_lighting + 1)
    endif
    if (current_lighting > <max>)
        change current_lighting = 0
    else
        if (0 > current_lighting)
            change current_lighting = <max>
        endif
    endif
    create_lighting_tool <...> 
endscript


script make_light_tool_item {focus_script = do_scale_up
        unfocus_script = do_scale_down
        pad_choose_script = nullscript
        font_face = small
        parent_menu_id = current_menu
        scale = 1
        rgba = [ 88 105 112 128 ]
        value = 100
    }
    switch <id>
        case menu_red
        rgba = [ 80 20 20 128 ]
        case menu_green
        rgba = [ 20 80 20 128 ]
        case menu_blue
        rgba = [ 20 20 80 128 ]
    endswitch
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
            {focus <focus_script> params = <focus_params>}
            {unfocus <unfocus_script> params = <unfocus_params>}
            {pad_left <pad_choose_script> params = { reverse <params> }}
            {pad_right <pad_choose_script> params = { <params> }}
        ]
    }
    if NOT GotParam value_text
        FormatText TextName = value_text '%i' i = <value>
    endif
    CreateScreenElement {
        type = TextElement
        parent = <id>
        pos = (150.0, 10.0)
        text = <value_text>
        font = <font_face>
        rgba = <rgba>
        scale = <scale>
    }
endscript


script incr_color_val step = 1 max = 128 min = 0
    GetTags
    GetCurrentLightingValues
    set_current_tod_values
    removeparameter random_effect_done
    if GotParam reverse
        step = (-1 * <step>)
    endif
    step = (<step> * step_multiplier)
    if (lock_color_values = 1)
        id = menu_all
    endif
    switch current_lighting
        case 0
        switch <id>
            case menu_red
            ambient_red = (<ambient_red> + <step>)
            if (<ambient_red> > 255)
                ambient_red = 255
            else
                if (0 > <ambient_red>)
                    ambient_red = 0
                endif
            endif
            FormatText TextName = value_text '%i' i = <ambient_red>
            case menu_green
            ambient_green = (<ambient_green> + <step>)
            if (<ambient_green> > 255)
                ambient_green = 255
            else
                if (0 > <ambient_green>)
                    ambient_green = 0
                endif
            endif
            FormatText TextName = value_text '%i' i = <ambient_green>
            case menu_blue
            ambient_blue = (<ambient_blue> + <step>)
            if (<ambient_blue> > 255)
                ambient_blue = 255
            else
                if (0 > <ambient_blue>)
                    ambient_blue = 0
                endif
            endif
            FormatText TextName = value_text '%i' i = <ambient_blue>
            case menu_all
            ambient_red = (<ambient_red> + <step>)
            if (<ambient_red> > 255)
                ambient_red = 255
            else
                if (0 > <ambient_red>)
                    ambient_red = 0
                endif
            endif
            ambient_green = <ambient_red>
            ambient_blue = <ambient_red>
            FormatText TextName = value_text '%i' i = <ambient_red>
        endswitch
        case 1
        switch <id>
            case menu_red
            red_0 = (<red_0> + <step>)
            if (<red_0> > 255)
                red_0 = 255
            else
                if (0 > <red_0>)
                    red_0 = 0
                endif
            endif
            FormatText TextName = value_text '%i' i = <red_0>
            case menu_green
            green_0 = (<green_0> + <step>)
            if (<green_0> > 255)
                green_0 = 255
            else
                if (0 > <green_0>)
                    green_0 = 0
                endif
            endif
            FormatText TextName = value_text '%i' i = <green_0>
            case menu_blue
            blue_0 = (<blue_0> + <step>)
            if (<blue_0> > 255)
                blue_0 = 255
            else
                if (0 > <blue_0>)
                    blue_0 = 0
                endif
            endif
            FormatText TextName = value_text '%i' i = <blue_0>
            case menu_all
            red_0 = (<red_0> + <step>)
            if (<red_0> > 255)
                red_0 = 255
            else
                if (0 > <red_0>)
                    red_0 = 0
                endif
            endif
            green_0 = <red_0>
            blue_0 = <red_0>
            FormatText TextName = value_text '%i' i = <red_0>
        endswitch
        case 2
        switch <id>
            case menu_red
            red_1 = (<red_1> + <step>)
            if (<red_1> > 255)
                red_1 = 255
            else
                if (0 > <red_1>)
                    red_1 = 0
                endif
            endif
            FormatText TextName = value_text '%i' i = <red_1>
            case menu_green
            green_1 = (<green_1> + <step>)
            if (<green_1> > 255)
                green_1 = 255
            else
                if (0 > <green_1>)
                    green_1 = 0
                endif
            endif
            FormatText TextName = value_text '%i' i = <green_1>
            case menu_blue
            blue_1 = (<blue_1> + <step>)
            if (<blue_1> > 255)
                blue_1 = 255
            else
                if (0 > <blue_1>)
                    blue_1 = 0
                endif
            endif
            FormatText TextName = value_text '%i' i = <blue_1>
            case menu_all
            red_1 = (<red_1> + <step>)
            if (<red_1> > 255)
                red_1 = 255
            else
                if (0 > <red_1>)
                    red_1 = 0
                endif
            endif
            green_1 = <red_1>
            blue_1 = <red_1>
            FormatText TextName = value_text '%i' i = <red_1>
        endswitch
        case 3
        switch <id>
            case menu_red
            change lev_red = (lev_red + <step>)
            if (lev_red > 255)
                change lev_red = 255
            else
                if (0 > lev_red)
                    change lev_red = 0
                endif
            endif
            FormatText TextName = value_text '%i' i = lev_red
            case menu_green
            change lev_green = (lev_green + <step>)
            if (lev_green > 255)
                change lev_green = 255
            else
                if (0 > lev_green)
                    change lev_green = 0
                endif
            endif
            FormatText TextName = value_text '%i' i = lev_green
            case menu_blue
            change lev_blue = (lev_blue + <step>)
            if (lev_blue > 255)
                change lev_blue = 255
            else
                if (0 > lev_blue)
                    change lev_blue = 0
                endif
            endif
            FormatText TextName = value_text '%i' i = lev_blue
            case menu_target
            change lev_vct = (lev_vct + <step>)
            if (lev_vct > 255)
                change lev_vct = 255
            else
                if (0 > lev_vct)
                    change lev_vct = 0
                endif
            endif
            FormatText TextName = value_text '%i' i = lev_vct
            case menu_percent
            change lev_vcp = (lev_vcp + <step>)
            if (lev_vcp > 100)
                change lev_vcp = 100
            else
                if (0 > lev_vcp)
                    change lev_vcp = 0
                endif
            endif
            FormatText TextName = value_text '%i' i = lev_vcp
            case menu_all
            change lev_red = (lev_red + <step>)
            if (lev_red > 255)
                change lev_red = 255
            else
                if (0 > lev_red)
                    change lev_red = 0
                endif
            endif
            change lev_green = lev_red
            change lev_blue = lev_red
            FormatText TextName = value_text '%i' i = lev_red
        endswitch
        case 4
        switch <id>
            case menu_red
            change fog_red = (fog_red + <step>)
            if (fog_red > 255)
                change fog_red = 255
            else
                if (0 > fog_red)
                    change fog_red = 0
                endif
            endif
            FormatText TextName = value_text '%i' i = fog_red
            case menu_green
            change fog_green = (fog_green + <step>)
            if (fog_green > 255)
                change fog_green = 255
            else
                if (0 > fog_green)
                    change fog_green = 0
                endif
            endif
            FormatText TextName = value_text '%i' i = fog_green
            case menu_blue
            change fog_blue = (fog_blue + <step>)
            if (fog_blue > 255)
                change fog_blue = 255
            else
                if (0 > fog_blue)
                    change fog_blue = 0
                endif
            endif
            FormatText TextName = value_text '%i' i = fog_blue
            case menu_alpha
            change fog_alpha = (fog_alpha + <step>)
            if (fog_alpha > 128)
                change fog_alpha = 128
            else
                if (0 > fog_alpha)
                    change fog_alpha = 0
                endif
            endif
            FormatText TextName = value_text '%i' i = fog_alpha
            case menu_exp
            change fog_dist = (fog_dist + (0.5000 * <step>))
            if (fog_dist > 100000)
                change fog_dist = 100000
            else
                if (0 > fog_dist)
                    change fog_dist = 0
                endif
            endif
            FormatText TextName = value_text '%i' i = fog_dist
            case menu_fog
            if (fog_state = 0)
                change fog_state = 1
                enablefog
                value_text = 'on'
            else
                change fog_state = 0
                disablefog
                value_text = 'off'
            endif
            case menu_all
            change fog_red = (fog_red + <step>)
            if (fog_red > 255)
                change fog_red = 255
            else
                if (0 > fog_red)
                    change fog_red = 0
                endif
            endif
            change fog_green = fog_red
            change fog_blue = fog_red
            FormatText TextName = value_text '%i' i = fog_red
        endswitch
        case 5
        switch <id>
            case menu_red
            change sky_red = (sky_red + <step>)
            if (sky_red > 255)
                change sky_red = 255
            else
                if (0 > sky_red)
                    change sky_red = 0
                endif
            endif
            FormatText TextName = value_text '%i' i = sky_red
            case menu_green
            change sky_green = (sky_green + <step>)
            if (sky_green > 255)
                change sky_green = 255
            else
                if (0 > sky_green)
                    change sky_green = 0
                endif
            endif
            FormatText TextName = value_text '%i' i = sky_green
            case menu_blue
            change sky_blue = (sky_blue + <step>)
            if (sky_blue > 255)
                change sky_blue = 255
            else
                if (0 > sky_blue)
                    change sky_blue = 0
                endif
            endif
            FormatText TextName = value_text '%i' i = sky_blue
            case menu_all
            change sky_red = (sky_red + <step>)
            if (sky_red > 255)
                change sky_red = 255
            else
                if (0 > sky_red)
                    change sky_red = 0
                endif
            endif
            change sky_green = sky_red
            change sky_blue = sky_red
            FormatText TextName = value_text '%i' i = sky_red
        endswitch
    endswitch
    if (lock_color_values = 1)
        SetScreenElementProps id = { menu_red child = 0 }text = <value_text>
        SetScreenElementProps id = { menu_green child = 0 }text = <value_text>
        SetScreenElementProps id = { menu_blue child = 0 }text = <value_text>
    else
        SetScreenElementProps id = {<id> child = 0}text = <value_text>
    endif
    <color> = 0
    TODManager_GetCurrentTODParams
    morning_params = (tod_manager_default_morning)
    afternoon_params = (tod_manager_default_afternoon)
    evening_params = (tod_manager_default_evening)
    night_params = (tod_manager_default_night)
    new_params = {
        ambient_red = <ambient_red>
        ambient_green = <ambient_green>
        ambient_blue = <ambient_blue>
        ambient_mod_factor_lo = (amb_mod_lo)
        ambient_mod_factor_hi = (amb_mod_hi)
        red_0 = <red_0>
        green_0 = <green_0>
        blue_0 = <blue_0>
        red_1 = <red_1>
        green_1 = <green_1>
        blue_1 = <blue_1>
        sky_red = (sky_red)
        sky_green = (sky_green)
        sky_blue = (sky_blue)
        lev_red = (lev_red)
        lev_green = (lev_green)
        lev_blue = (lev_blue)
        heading_0 = (dir0_head)
        pitch_0 = (dir0_pitch)
        heading_1 = (dir1_head)
        pitch_1 = (dir1_pitch)
        fog_red = (fog_red)
        fog_green = (fog_green)
        fog_blue = (fog_blue)
        fog_alpha = (fog_alpha)
        fog_dist = (fog_dist)
        fog_on = <fog_on>
        sky_red = (sky_red)
        sky_green = (sky_green)
        sky_blue = (sky_blue)
        state_length = 180000
    }
    switch (<tod_params>.current_state_name)
        case morning
        morning_params = {(tod_manager_default_morning)<new_params>}
        cur_params = <morning_params>
        case afternoon
        afternoon_params = {(tod_manager_default_afternoon)<new_params>}
        cur_params = <afternoon_params>
        case evening
        evening_params = {(tod_manager_default_evening)<new_params>}
        cur_params = <evening_params>
        case night
        night_params = {(tod_manager_default_night)<new_params>}
        cur_params = <night_params>
        default 
        afternoon_params = {(tod_manager_default_afternoon)<new_params>}
        cur_params = <afternoon_params>
    endswitch
    switch current_lighting
        case 0
        SetLightAmbientColor r = <ambient_red> g = <ambient_green> b = <ambient_blue>
        case 1
        SetLightDiffuseColor index = 0 r = <red_0> g = <green_0> b = <blue_0>
        case 2
        SetLightDiffuseColor index = 1 r = <red_1> g = <green_1> b = <blue_1>
    endswitch
    TODManager_SetParams {
        system = 1
        transition_length = 90
        groups = [
            {parts = 6 wait_frames = 3 light_group = outdoor}
            {parts = 2 wait_frames = 3 light_group = nolevellights reset_lightgroup = indoor}
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
            {parts = 6 wait_frames = 3 light_group = outdoor}
            {parts = 2 wait_frames = 3 light_group = nolevellights reset_lightgroup = indoor}
        ]
        overwrite_current_state = <cur_params>
        morning = <morning_params>
        afternoon = <afternoon_params>
        evening = <evening_params>
        night = <night_params>
    }
    if (current_lighting > 2)
        TODManager_SetTODInstant (<tod_params>.current_state_name)
    endif
    if IsTrue cutscene_is_playing
        change todmanager_temp_tod_changed = 1
        TODManager_SetTODInstant (<tod_params>.current_state_name)
        TODManager_ResetLevelLights
    endif
endscript


script incr_mod_val step = 0.01000 max = 2 min = 0
    GetTags
    removeparameter random_effect_done
    if GotParam reverse
        step = (-1 * <step>)
    endif
    step = (<step> * step_multiplier)
    switch current_lighting
        case 0
        change amb_mod_lo = (amb_mod_lo + <step>)
        if (amb_mod_lo > <max>)
            change amb_mod_lo = <max>
        endif
        if (<min> > amb_mod_lo)
            change amb_mod_lo = <min>
        endif
        FormatText TextName = value_text '%i' i = amb_mod_lo
        case 1
        change dir0_mod_lo = (dir0_mod_lo + <step>)
        if (dir0_mod_lo > <max>)
            change dir0_mod_lo = <max>
        endif
        if (<min> > dir0_mod_lo)
            change dir0_mod_lo = <min>
        endif
        FormatText TextName = value_text '%i' i = dir0_mod_lo
        case 2
        change dir1_mod_lo = (dir1_mod_lo + <step>)
        if (dir1_mod_lo > <max>)
            change dir1_mod_lo = <max>
        endif
        if (<min> > dir1_mod_lo)
            change dir1_mod_lo = <min>
        endif
        FormatText TextName = value_text '%i' i = dir1_mod_lo
    endswitch
    SetScreenElementProps id = {<id> child = 0}text = <value_text>
    SetDynamicLightModulationFactor ambient value = amb_mod_lo value2 = amb_mod_hi
    SetDynamicLightModulationFactor directional = 0 value = dir0_mod_lo value2 = dir0_mod_hi
    SetDynamicLightModulationFactor directional = 1 value = dir1_mod_lo value2 = dir1_mod_hi
endscript


script incr_mod_val2 step = 0.01000 max = 2 min = 0
    GetTags
    removeparameter random_effect_done
    if GotParam reverse
        step = (-1 * <step>)
    endif
    step = (<step> * step_multiplier)
    switch current_lighting
        case 0
        change amb_mod_hi = (amb_mod_hi + <step>)
        if (amb_mod_hi > <max>)
            change amb_mod_hi = <max>
        endif
        if (<min> > amb_mod_hi)
            change amb_mod_hi = <min>
        endif
        FormatText TextName = value_text '%i' i = amb_mod_hi
        case 1
        change dir0_mod_hi = (dir0_mod_hi + <step>)
        if (dir0_mod_hi > <max>)
            change dir0_mod_hi = <max>
        endif
        if (<min> > dir0_mod_hi)
            change dir0_mod_hi = <min>
        endif
        FormatText TextName = value_text '%i' i = dir0_mod_hi
        case 2
        change dir1_mod_hi = (dir1_mod_hi + <step>)
        if (dir1_mod_hi > <max>)
            change dir1_mod_hi = <max>
        endif
        if (<min> > dir1_mod_hi)
            change dir1_mod_hi = <min>
        endif
        FormatText TextName = value_text '%i' i = dir1_mod_hi
    endswitch
    SetScreenElementProps id = {<id> child = 0}text = <value_text>
    SetDynamicLightModulationFactor ambient value = amb_mod_lo value2 = amb_mod_hi
    SetDynamicLightModulationFactor directional = 0 value = dir0_mod_lo value2 = dir0_mod_hi
    SetDynamicLightModulationFactor directional = 1 value = dir1_mod_lo value2 = dir1_mod_hi
endscript


script incr_heading_val step = 1 max = 360 min = 0
    GetTags
    TODManager_GetCurrentTODParams
    set_current_tod_values
    if GotParam reverse
        step = (-1 * <step>)
    endif
    step = (<step> * step_multiplier)
    switch current_lighting
        case 0
        return 
        case 1
        change dir0_head = (dir0_head + <step>)
        if (dir0_head > <max>)
            change dir0_head = <min>
        endif
        if (<min> > dir0_head)
            change dir0_head = <max>
        endif
        FormatText TextName = value_text '%i' i = dir0_head
        case 2
        change dir1_head = (dir1_head + <step>)
        if (dir1_head > <max>)
            change dir1_head = <min>
        endif
        if (<min> > dir1_head)
            change dir1_head = <max>
        endif
        FormatText TextName = value_text '%i' i = dir1_head
    endswitch
    SetScreenElementProps id = {<id> child = 0}text = <value_text>
    TODManager_GetCurrentTODParams
    morning_params = (tod_manager_default_morning)
    afternoon_params = (tod_manager_default_afternoon)
    evening_params = (tod_manager_default_evening)
    night_params = (tod_manager_default_night)
    new_params = {
        ambient_red = (<tod_params>.ambient_red)
        ambient_green = (<tod_params>.ambient_green)
        ambient_blue = (<tod_params>.ambient_blue)
        ambient_mod_factor_lo = (amb_mod_lo)
        ambient_mod_factor_hi = (amb_mod_hi)
        red_0 = (<tod_params>.red_0)
        green_0 = (<tod_params>.green_0)
        blue_0 = (<tod_params>.blue_0)
        red_1 = (<tod_params>.red_1)
        green_1 = (<tod_params>.green_1)
        blue_1 = (<tod_params>.blue_1)
        sky_red = (sky_red)
        sky_green = (sky_green)
        sky_blue = (sky_blue)
        lev_red = (lev_red)
        lev_green = (lev_green)
        lev_blue = (lev_blue)
        heading_0 = (dir0_head)
        pitch_0 = (dir0_pitch)
        heading_1 = (dir1_head)
        pitch_1 = (dir1_pitch)
        fog_red = (fog_red)
        fog_green = (fog_green)
        fog_blue = (fog_blue)
        fog_alpha = (fog_alpha)
        fog_dist = (fog_dist)
        fog_on = <fog_on>
        sky_red = (sky_red)
        sky_green = (sky_green)
        sky_blue = (sky_blue)
        state_length = 180000
    }
    switch (<tod_params>.current_state_name)
        case morning
        morning_params = {(tod_manager_default_morning)<new_params>}
        cur_params = <morning_params>
        case afternoon
        afternoon_params = {(tod_manager_default_afternoon)<new_params>}
        cur_params = <afternoon_params>
        case evening
        evening_params = {(tod_manager_default_evening)<new_params>}
        cur_params = <evening_params>
        case night
        night_params = {(tod_manager_default_night)<new_params>}
        cur_params = <night_params>
        default 
        afternoon_params = {(tod_manager_default_afternoon)<new_params>}
        cur_params = <afternoon_params>
    endswitch
    TODManager_SetParams {
        system = 1
        transition_length = 90
        groups = [
            {parts = 6 wait_frames = 3 light_group = outdoor}
            {parts = 2 wait_frames = 3 light_group = nolevellights reset_lightgroup = indoor}
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
            {parts = 6 wait_frames = 3 light_group = outdoor}
            {parts = 2 wait_frames = 3 light_group = nolevellights reset_lightgroup = indoor}
        ]
        overwrite_current_state = <cur_params>
        morning = <morning_params>
        afternoon = <afternoon_params>
        evening = <evening_params>
        night = <night_params>
    }
    SetLightDirection index = 0 heading = dir0_head pitch = dir0_pitch
    SetLightDirection index = 1 heading = dir1_head pitch = dir1_pitch
    if IsTrue cutscene_is_playing
        TODManager_SetTODInstant (<tod_params>.current_state_name)
        change todmanager_temp_tod_changed = 1
    endif
endscript


script incr_pitch_val step = 1 max = 360 min = 0
    GetTags
    set_current_tod_values
    if GotParam reverse
        step = (-1 * <step>)
    endif
    step = (<step> * step_multiplier)
    switch current_lighting
        case 0
        return 
        case 1
        change dir0_pitch = (dir0_pitch + <step>)
        if (dir0_pitch > <max>)
            change dir0_pitch = <min>
        endif
        if (<min> > dir0_pitch)
            change dir0_pitch = <max>
        endif
        FormatText TextName = value_text '%i' i = dir0_pitch
        case 2
        change dir1_pitch = (dir1_pitch + <step>)
        if (dir1_pitch > <max>)
            change dir1_pitch = <min>
        endif
        if (<min> > dir1_pitch)
            change dir1_pitch = <max>
        endif
        FormatText TextName = value_text '%i' i = dir1_pitch
    endswitch
    SetScreenElementProps id = {<id> child = 0}text = <value_text>
    SetLightDirection index = 0 heading = dir0_head pitch = dir0_pitch
    SetLightDirection index = 1 heading = dir1_head pitch = dir1_pitch
    TODManager_GetCurrentTODParams
    morning_params = (tod_manager_default_morning)
    afternoon_params = (tod_manager_default_afternoon)
    evening_params = (tod_manager_default_evening)
    night_params = (tod_manager_default_night)
    new_params = {
        ambient_red = (<tod_params>.ambient_red)
        ambient_green = (<tod_params>.ambient_green)
        ambient_blue = (<tod_params>.ambient_blue)
        ambient_mod_factor_lo = (amb_mod_lo)
        ambient_mod_factor_hi = (amb_mod_hi)
        red_0 = (<tod_params>.red_0)
        green_0 = (<tod_params>.green_0)
        blue_0 = (<tod_params>.blue_0)
        red_1 = (<tod_params>.red_1)
        green_1 = (<tod_params>.green_1)
        blue_1 = (<tod_params>.blue_1)
        sky_red = (sky_red)
        sky_green = (sky_green)
        sky_blue = (sky_blue)
        lev_red = (lev_red)
        lev_green = (lev_green)
        lev_blue = (lev_blue)
        heading_0 = (dir0_head)
        pitch_0 = (dir0_pitch)
        heading_1 = (dir1_head)
        pitch_1 = (dir1_pitch)
        fog_red = (fog_red)
        fog_green = (fog_green)
        fog_blue = (fog_blue)
        fog_alpha = (fog_alpha)
        fog_dist = (fog_dist)
        fog_on = <fog_on>
        sky_red = (sky_red)
        sky_green = (sky_green)
        sky_blue = (sky_blue)
        state_length = 180000
    }
    switch (<tod_params>.current_state_name)
        case morning
        morning_params = {(tod_manager_default_morning)<new_params>}
        cur_params = <morning_params>
        case afternoon
        afternoon_params = {(tod_manager_default_afternoon)<new_params>}
        cur_params = <afternoon_params>
        case evening
        evening_params = {(tod_manager_default_evening)<new_params>}
        cur_params = <evening_params>
        case night
        night_params = {(tod_manager_default_night)<new_params>}
        cur_params = <night_params>
        default 
        afternoon_params = {(tod_manager_default_afternoon)<new_params>}
        cur_params = <afternoon_params>
    endswitch
    TODManager_SetParams {
        system = 1
        transition_length = 90
        groups = [
            {parts = 6 wait_frames = 3 light_group = outdoor}
            {parts = 2 wait_frames = 3 light_group = nolevellights reset_lightgroup = indoor}
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
            {parts = 6 wait_frames = 3 light_group = outdoor}
            {parts = 2 wait_frames = 3 light_group = nolevellights reset_lightgroup = indoor}
        ]
        overwrite_current_state = <cur_params>
        morning = <morning_params>
        afternoon = <afternoon_params>
        evening = <evening_params>
        night = <night_params>
    }
    if IsTrue cutscene_is_playing
        TODManager_SetTODInstant (<tod_params>.current_state_name)
        change todmanager_temp_tod_changed = 1
    endif
endscript


script GetCurrentLightingValues 
    GetLightCurrentColor
    return <...> 
endscript


script toggle_step_multiplier 
    if (step_multiplier = 1)
        change step_multiplier = 10
    else
        change step_multiplier = 1
    endif
    printf 'step_multiplier = %s' s = step_multiplier
endscript


script toggle_color_lock 
    if (lock_color_values = 1)
        change lock_color_values = 0
        printf 'RGB values UNlocked'
    else
        change lock_color_values = 1
        printf 'RGB values locked'
    endif
endscript


script toggle_dir_light_on_off 
    if (<index> = 0)
        if (toggle_dir0 = 1)
            GetCurrentLightingValues
            change last_dir0_red = <red_0>
            change last_dir0_green = <green_0>
            change last_dir0_blue = <blue_0>
            SetLightDiffuseColor index = 0 r = 0 g = 0 b = 0
            change toggle_dir0 = 0
            SetScreenElementProps id = { menu_onoff child = 0 }text = 'off'
        else
            SetLightDiffuseColor index = 0 r = last_dir0_red g = last_dir0_green b = last_dir0_blue
            change toggle_dir0 = 1
            SetScreenElementProps id = { menu_onoff child = 0 }text = 'on'
        endif
    else
        if (<index> = 1)
            if (toggle_dir1 = 1)
                GetCurrentLightingValues
                change last_dir1_red = <red_1>
                change last_dir1_green = <green_1>
                change last_dir1_blue = <blue_1>
                SetLightDiffuseColor index = 1 r = 0 g = 0 b = 0
                change toggle_dir1 = 0
                SetScreenElementProps id = { menu_onoff child = 0 }text = 'off'
            else
                SetLightDiffuseColor index = 1 r = last_dir1_red g = last_dir1_green b = last_dir1_blue
                change toggle_dir1 = 1
                SetScreenElementProps id = { menu_onoff child = 0 }text = 'on'
            endif
        else
            printf 'toggle_dir_light_on_off: bad index value'
        endif
    endif
endscript


script kill_lightlines_Max 
    killspawnedscript name = update_directional_light_pos2
endscript


script spawn_lightlines_Max 
    printstruct <...> 
    killspawnedscript name = update_directional_light_pos2
    spawnscript {update_directional_light_pos2
        params = {dir0_head = <h0>
            dir0_pitch = <p0>
            dir1_head = <h1>
            dir1_pitch = <p1>
        }
    }
endscript


script update_directional_light_pos2 
    printstruct <...> 
    begin 
    DrawDirectionalLightLines heading = <dir0_head> pitch = <dir0_pitch> r = 255 g = 0 b = 0
    wait 1 gameframe
    DrawDirectionalLightLines heading = <dir1_head> pitch = <dir1_pitch> r = 0 g = 0 b = 255
    wait 1 gameframe
    repeat 
endscript


script SendCurrentLightingValuestoMax 
    printf 'Sending Lighting Values to MAX'
    GetLightCurrentColor
    printf 'Ambient_Red = %a Ambient_Green = %b Ambient_Blue = %c' a = <ambient_red> b = <ambient_green> c = <ambient_blue> file = 'lighting.txt'
    GetDynamicLightModulationFactor ambient
    printf 'Ambient_Mod_lo = %d AmbientMod_hi = %e' d = <mod_value_lo> e = <mod_value_hi> file = 'lighting.txt' Append
    printf 'Red_0 = %e Green_0 = %f Blue_0 = %g' e = <red_0> f = <green_0> g = <blue_0> file = 'lighting.txt' Append
    getLightdirection index = 0
    printf 'Head_0 = %h Pitch_0 = %i' h = <heading> i = <pitch> file = 'lighting.txt' Append
    GetDynamicLightModulationFactor directional = 0
    printf 'Mod_0_lo = %j Mod_0_hi = %k' j = <mod_value_lo> k = <mod_value_hi> file = 'lighting.txt' Append
    printf 'Red_1 = %k Green_1 = %l Blue_1 = %m' k = <red_1> l = <green_1> m = <blue_1> file = 'lighting.txt' Append
    getLightdirection index = 1
    printf 'Head_1 = %n Pitch_1 = %o' n = <heading> o = <pitch> file = 'lighting.txt' Append
    GetDynamicLightModulationFactor directional = 1
    printf 'Mod_1_lo = %j Mod_1_hi = %k' j = <mod_value_lo> k = <mod_value_hi> file = 'lighting.txt' Append
endscript


script maxscriptConnection 
    GetCurrentLevel
    printf '%l' l = <level> file = 'Connection.txt'
endscript


script maxtest 
    getLightdirection index = 1
    printf 'Head_1 = %n Pitch_1 = %o' n = <heading> o = <pitch>
    GetDynamicLightModulationFactor directional = 1
    printf 'Mod_1_lo = %p Mod_1_hi = %q' p = <mod_value_lo> q = <mod_value_hi>
    getLightdirection index = 0
    printstruct <...> 
endscript


script update_directional_light_pos 
    begin 
    if (toggle_dir0 = 1)
        DrawDirectionalLightLines heading = dir0_head pitch = dir0_pitch r = 255 g = 0 b = 0
        wait 1 gameframe
    endif
    if (toggle_dir1 = 1)
        DrawDirectionalLightLines heading = dir1_head pitch = dir1_pitch r = 0 g = 0 b = 255
    endif
    wait 1 gameframe
    repeat 
endscript


script set_to_tod_values 
    if NOT GotParam tod
        return 
    endif
    change amb_mod_lo = (<tod>.ambient_mod_factor_lo)
    change amb_mod_hi = (<tod>.ambient_mod_factor_hi)
    change dir0_mod_lo = (<tod>.mod_factor_0_lo)
    change dir0_mod_hi = (<tod>.mod_factor_0_hi)
    change dir1_mod_lo = (<tod>.mod_factor_1_lo)
    change dir1_mod_hi = (<tod>.mod_factor_1_hi)
    if NOT GotParam level
        change lev_red = (<tod>.lev_red)
        change lev_green = (<tod>.lev_green)
        change lev_blue = (<tod>.lev_blue)
    else
    endif
    if NOT GotParam no_fog
        if StructureContains structure = tod fog_red
            change fog_red = (<tod>.fog_red)
            change fog_green = (<tod>.fog_green)
            change fog_blue = (<tod>.fog_blue)
            change fog_alpha = (<tod>.fog_alpha)
            change fog_dist = (<tod>.fog_dist)
        else
            change fog_red = 0
            change fog_green = 0
            change fog_blue = 0
            change fog_alpha = 0
            change fog_dist = 0
        endif
    else
        change fog_red = 0
        change fog_green = 0
        change fog_blue = 0
        change fog_alpha = 0
        change fog_dist = 0
    endif
    change sky_red = 128
    change sky_green = 128
    change sky_blue = 128
    ambient_red = (<tod>.ambient_red)
    ambient_green = (<tod>.ambient_green)
    ambient_blue = (<tod>.ambient_blue)
    red_0 = (<tod>.red_0)
    green_0 = (<tod>.green_0)
    blue_0 = (<tod>.blue_0)
    red_1 = (<tod>.red_1)
    green_1 = (<tod>.green_1)
    blue_1 = (<tod>.blue_1)
    set_all_light_values <...> 
endscript


script set_all_light_values 
    <color> = (lev_red + (lev_green * 256)+ (lev_blue * 65536))
    <sky> = (sky_red + (sky_green * 256)+ (sky_blue * 65536))
    lighting color = <color> sky = <sky>
    if NOT GotParam level_only
        SetLightAmbientColor r = <ambient_red> g = <ambient_green> b = <ambient_blue>
        SetLightDiffuseColor index = 0 r = <red_0> g = <green_0> b = <blue_0>
        SetLightDiffuseColor index = 1 r = <red_1> g = <green_1> b = <blue_1>
    endif
    SetFogColor r = fog_red b = fog_blue g = fog_green a = fog_alpha
    SetFogDistance distance = fog_dist
endscript


script print_light_values 
    printf ' '
    printf '<---------------------------------------------->'
    printf 'Selected lighting values:'
    printf 'ambient_red = %i' i = <ambient_red>
    printf 'ambient_green = %i' i = <ambient_green>
    printf 'ambient_blue = %i' i = <ambient_blue>
    printf 'ambient_mod_factor_lo = %i' i = amb_mod_lo
    printf 'ambient_mod_factor_hi = %i' i = amb_mod_hi
    printf ' '
    if (toggle_dir0 = 1)
        printf 'heading_0 = %i' i = dir0_head
        printf 'pitch_0 = %i' i = dir0_pitch
        printf 'red_0 = %i' i = <red_0>
        printf 'green_0 = %i' i = <green_0>
        printf 'blue_0 = %i' i = <blue_0>
        printf 'mod_factor_0_lo = %i' i = dir0_mod_lo
        printf 'mod_factor_0_hi = %i' i = dir0_mod_hi
        printf ' '
    endif
    if (toggle_dir1 = 1)
        printf 'heading_1 = %i' i = dir1_head
        printf 'pitch_1 = %i' i = dir1_pitch
        printf 'red_1 = %i' i = <red_1>
        printf 'green_1 = %i' i = <green_1>
        printf 'blue_1 = %i' i = <blue_1>
        printf 'mod_factor_1_lo = %i' i = dir1_mod_lo
        printf 'mod_factor_1_hi = %i' i = dir1_mod_hi
        printf 'dir light 2 on/off = %i' i = toggle_dir1
        printf ' '
    endif
    printf 'lev_red = %i' i = lev_red
    printf 'lev_green = %i' i = lev_green
    printf 'lev_blue  = %i' i = lev_blue
    printf ' '
    printf 'sky_red  = %i' i = sky_red
    printf 'sky_green  = %i' i = sky_green
    printf 'sky_blue  = %i' i = sky_blue
    printf ' '
    printf 'fog_on  = %i' i = fog_state
    printf 'fog_red  = %i' i = fog_red
    printf 'fog_green  = %i' i = fog_green
    printf 'fog_blue  = %i' i = fog_blue
    printf 'fog_alpha  = %i' i = fog_alpha
    printf 'fog_dist  = %i' i = fog_dist
    printf ' '
    printf '<---------------------------------------------->'
    printf ' '
    killspawnedscript name = update_directional_light_pos
    makeskatergoto ongroundai
    if CutsceneFinished
        pauseGame
    endif
    TODManager_SetTimeMultiplier <TOD_Time_Multiplier>
    SetAnalogStickActiveForMenus 1
    if CutsceneFinished
        launch_lighttool_sub_menu
    else
        if ScreenElementExists id = current_menu_anchor
            DestroyScreenElement id = current_menu_anchor
        endif
        if ScreenElementExists id = light_menu
            DestroyScreenElement id = light_menu
        endif
    endif
endscript


script toggle_rain_snow 
    if (rain_or_snow = 0)
        change rain_or_snow = 1
        WeatherSetSnowActive
        rain_text = 'snow'
    else
        change rain_or_snow = 0
        WeatherSetRainActive
        rain_text = 'rain'
    endif
    SetScreenElementProps id = { menu_rain child = 0 }text = <rain_text>
endscript


script incr_rain_val step = 1 max = 128 min = 0
    GetTags
    if GotParam reverse
        step = (-1 * <step>)
    endif
    step = (<step> * step_multiplier)
    switch <id>
        case menu_rate
        change rain_rate = (rain_rate + <step>)
        if (rain_rate > (1024 / rain_frames))
            change rain_rate = (1024 / rain_frames)
        else
            if (0 > rain_rate)
                change rain_rate = 0
            endif
        endif
        FormatText TextName = value_text '%i' i = rain_rate
        WeatherSetRainRate rain_rate
        case menu_frames
        change rain_frames = (rain_frames + <step>)
        if (rain_frames > 255)
            change rain_frames = 255
        else
            if (1 > rain_frames)
                change rain_frames = 1
            endif
        endif
        FormatText TextName = value_text '%i' i = rain_frames
        WeatherSetRainFrames rain_frames
        case menu_height
        change rain_height = (rain_height + <step>)
        if (rain_height > 3000)
            change rain_height = 3000
        else
            if (0 > rain_height)
                change rain_height = 0
            endif
        endif
        FormatText TextName = value_text '%i' i = rain_height
        WeatherSetRainHeight rain_height
        case menu_length
        change rain_length = (rain_length + <step>)
        if (rain_length > 200)
            change rain_length = 200
        else
            if (0 > rain_length)
                change rain_length = 0
            endif
        endif
        FormatText TextName = value_text '%i' i = rain_length
        WeatherSetRainLength rain_length
        case menu_blend
        if NOT GotParam reverse
            change rain_blend = (rain_blend + 1)
        else
            change rain_blend = (rain_blend - 1)
        endif
        if (rain_blend > 10)
            change rain_blend = 0
        else
            if (0 > rain_blend)
                change rain_blend = 10
            endif
        endif
        get_rain_mode_string
        WeatherSetRainBlendMode <checksum> (rain_fixed + 0)
        case menu_fixed
        change rain_fixed = (rain_fixed + <step>)
        if (rain_fixed > 128)
            change rain_fixed = 128
        else
            if (0 > rain_fixed)
                change rain_fixed = 0
            endif
        endif
        get_rain_mode_string
        WeatherSetRainBlendMode <checksum> (rain_fixed + 0)
        FormatText TextName = value_text '%i' i = rain_fixed
    endswitch
    SetScreenElementProps id = {<id> child = 0}text = <value_text>
endscript


script get_rain_mode_string 
    if GotParam splash
        value = splash_blend
    else
        if GotParam snow
            value = snow_blend
        else
            value = rain_blend
        endif
    endif
    switch <value>
        case 0
        value_text = 'blend'
        case 1
        value_text = 'add'
        case 2
        value_text = 'sub'
        case 3
        value_text = 'modulate'
        case 4
        value_text = 'brighten'
        case 5
        value_text = 'fixblend'
        case 6
        value_text = 'fixadd'
        case 7
        value_text = 'fixsub'
        case 8
        value_text = 'fixmodulate'
        case 9
        value_text = 'fixbrighten'
        case 10
        value_text = 'diffuse'
    endswitch
    FormatText checksumname = checksum '%i' i = <value_text>
    return {value_text = <value_text> checksum = <checksum>}
endscript


script incr_rain_color step = 1 max = 128 min = 0
    GetTags
    if GotParam reverse
        step = (-1 * <step>)
    endif
    step = (<step> * step_multiplier)
    if GotParam splash
        value_red = (splash_red)
        value_green = (splash_green)
        value_blue = (splash_blue)
        value_alpha = (splash_alpha)
    endif
    if GotParam snow
        value_red = (snow_red)
        value_green = (snow_green)
        value_blue = (snow_blue)
        value_alpha = (snow_alpha)
    endif
    if GotParam rain
        value_red = (rain_red)
        value_green = (rain_green)
        value_blue = (rain_blue)
        value_alpha = (rain_alpha)
    endif
    switch <id>
        case menu_red
        value_red = (<value_red> + <step>)
        if (<value_red> > 255)
            value_red = 255
        else
            if (0 > <value_red>)
                value_red = 0
            endif
        endif
        FormatText TextName = value_text '%i' i = <value_red>
        case menu_blue
        value_blue = (<value_blue> + <step>)
        if (<value_blue> > 255)
            value_blue = 255
        else
            if (0 > <value_blue>)
                value_blue = 0
            endif
        endif
        FormatText TextName = value_text '%i' i = <value_blue>
        case menu_green
        value_green = (<value_green> + <step>)
        if (<value_green> > 255)
            value_green = 255
        else
            if (0 > <value_green>)
                value_green = 0
            endif
        endif
        FormatText TextName = value_text '%i' i = <value_green>
        case menu_alpha
        value_alpha = (<value_alpha> + <step>)
        if (<value_alpha> > 255)
            value_alpha = 255
        else
            if (0 > <value_alpha>)
                value_alpha = 0
            endif
        endif
        FormatText TextName = value_text '%i' i = <value_alpha>
        case menu_red2
        change rain_red2 = (rain_red2 + <step>)
        if (rain_red2 > 255)
            change rain_red2 = 255
        else
            if (0 > rain_red2)
                change rain_red2 = 0
            endif
        endif
        FormatText TextName = value_text '%i' i = rain_red2
        case menu_blue2
        change rain_blue2 = (rain_blue2 + <step>)
        if (rain_blue2 > 255)
            change rain_blue2 = 255
        else
            if (0 > rain_blue2)
                change rain_blue2 = 0
            endif
        endif
        FormatText TextName = value_text '%i' i = rain_blue2
        case menu_green2
        change rain_green2 = (rain_green2 + <step>)
        if (rain_green2 > 255)
            change rain_green2 = 255
        else
            if (0 > rain_green2)
                change rain_green2 = 0
            endif
        endif
        FormatText TextName = value_text '%i' i = rain_green2
        case menu_alpha2
        change rain_alpha2 = (rain_alpha2 + <step>)
        if (rain_alpha2 > 255)
            change rain_alpha2 = 255
        else
            if (0 > rain_alpha2)
                change rain_alpha2 = 0
            endif
        endif
        FormatText TextName = value_text '%i' i = rain_alpha2
    endswitch
    SetScreenElementProps id = {<id> child = 0}text = <value_text>
    <color> = (<value_red> + (<value_green> * 256)+ (<value_blue> * 65536)+ (<value_alpha> * 16777216))
    if GotParam splash
        change splash_red = <value_red>
        change splash_green = <value_green>
        change splash_blue = <value_blue>
        change splash_alpha = <value_alpha>
        WeatherSetSplashColor <color>
    endif
    if GotParam snow
        change snow_red = <value_red>
        change snow_green = <value_green>
        change snow_blue = <value_blue>
        change snow_alpha = <value_alpha>
        WeatherSetSnowColor <color>
    endif
    if GotParam rain
        change rain_red = <value_red>
        change rain_green = <value_green>
        change rain_blue = <value_blue>
        change rain_alpha = <value_alpha>
        <color2> = (rain_red2 + (rain_green2 * 256)+ (rain_blue2 * 65536)+ (rain_alpha2 * 16777216))
        WeatherSetRainColor top = <color> bottom = <color2>
    endif
endscript


script incr_splash_val step = 1 max = 128 min = 0
    GetTags
    if GotParam reverse
        step = (-1 * <step>)
    endif
    step = (<step> * step_multiplier)
    switch <id>
        case menu_rate
        change splash_rate = (splash_rate + (<step> / 20.0))
        if (splash_rate > 1)
            change splash_rate = 1.0
        else
            if (0 > splash_rate)
                change splash_rate = 0.0
            endif
        endif
        FormatText TextName = value_text '%i' i = splash_rate
        WeatherSetSplashRate splash_rate
        case menu_life
        change splash_life = (splash_life + <step>)
        if (splash_life > 100)
            change splash_life = 100
        else
            if (1 > splash_life)
                change splash_life = 1
            endif
        endif
        FormatText TextName = value_text '%i' i = splash_life
        WeatherSetSplashLife splash_life
        case menu_size
        change splash_size = (splash_size + <step>)
        if (splash_size > 100)
            change splash_size = 100
        else
            if (0 > splash_size)
                change splash_size = 0
            endif
        endif
        FormatText TextName = value_text '%i' i = splash_size
        WeatherSetSplashSize splash_size
        case menu_blend
        if NOT GotParam reverse
            change splash_blend = (splash_blend + 1)
        else
            change splash_blend = (splash_blend - 1)
        endif
        if (splash_blend > 10)
            change splash_blend = 0
        else
            if (0 > splash_blend)
                change splash_blend = 10
            endif
        endif
        get_rain_mode_string splash
        WeatherSetSplashBlendMode <checksum> (splash_fixed + 0)
        case menu_fixed
        change splash_fixed = (splash_fixed + <step>)
        if (splash_fixed > 128)
            change splash_fixed = 128
        else
            if (0 > splash_fixed)
                change splash_fixed = 0
            endif
        endif
        get_rain_mode_string splash
        WeatherSetSplashBlendMode <checksum> (splash_fixed + 0)
        FormatText TextName = value_text '%i' i = splash_fixed
    endswitch
    SetScreenElementProps id = {<id> child = 0}text = <value_text>
endscript


script incr_snow_val step = 1 max = 128 min = 0
    GetTags
    if GotParam reverse
        step = (-1 * <step>)
    endif
    step = (<step> * step_multiplier)
    switch <id>
        case menu_rate
        change snow_rate = (snow_rate + <step>)
        if (snow_rate > (1024 / snow_frames))
            change snow_rate = (1024 / snow_frames)
        else
            if (0 > snow_rate)
                change snow_rate = 0
            endif
        endif
        FormatText TextName = value_text '%i' i = snow_rate
        WeatherSetSnowRate snow_rate
        case menu_frames
        change snow_frames = (snow_frames + <step>)
        if (snow_frames > 254)
            change snow_frames = 254
        else
            if (1 > snow_frames)
                change snow_frames = 1
            endif
        endif
        FormatText TextName = value_text '%i' i = snow_frames
        WeatherSetSnowFrames snow_frames
        case menu_height
        change snow_height = (snow_height + <step>)
        if (snow_height > 3000)
            change snow_height = 3000
        else
            if (0 > snow_height)
                change snow_height = 0
            endif
        endif
        FormatText TextName = value_text '%i' i = snow_height
        WeatherSetSnowHeight snow_height
        case menu_size
        change snow_size = (snow_size + <step>)
        if (snow_size > 200)
            change snow_size = 200
        else
            if (0 > snow_size)
                change snow_size = 0
            endif
        endif
        FormatText TextName = value_text '%i' i = snow_size
        WeatherSetSnowSize snow_size
        case menu_blend
        if NOT GotParam reverse
            change snow_blend = (snow_blend + 1)
        else
            change snow_blend = (snow_blend - 1)
        endif
        if (snow_blend > 10)
            change snow_blend = 0
        else
            if (0 > snow_blend)
                change snow_blend = 10
            endif
        endif
        get_rain_mode_string snow
        WeatherSetSnowBlendMode <checksum> (snow_fixed + 0)
        case menu_fixed
        change snow_fixed = (snow_fixed + <step>)
        if (snow_fixed > 128)
            change snow_fixed = 128
        else
            if (0 > snow_fixed)
                change snow_fixed = 0
            endif
        endif
        get_rain_mode_string snow
        WeatherSetSnowBlendMode <checksum> (snow_fixed + 0)
        FormatText TextName = value_text '%i' i = snow_fixed
    endswitch
    SetScreenElementProps id = {<id> child = 0}text = <value_text>
endscript

poly_count_on = 0

script show_poly_count 
endscript


script refresh_poly_count 
endscript


script refresh_poly_count_repeatedly 
    * / 
endscript


script switch_off_poly_count_refresh 
endscript


script screen_outline rgba = [ 128 128 128 128 ]
endscript


script exit_thug_pro_light_menu 
    ResetSkaters
    create_pause_menu
    change thug_pro_light_tool_active = 0
endscript


script create_thug_pro_light_menu 
    printf 'create_thug_pro_light_menu'
    makeskatergoto freezeskater
    hide_all_hud_items
    UTILS_CREATE_BASIC_MENU {
        base_name = 'thug_pro_light'
        menu_pos = (-80.0, 0.0)
        menu_dims = (640.0, 1000.0)
        NO_BACKGROUND
        callback_script = exit_thug_pro_light_menu
    }
    change thug_pro_light_tool_active = 1
    make_thpg_menu_item child_texture = pickup_tomato text = 'change time of day' pad_choose_script = create_thug_pro_light_tod_menu
    make_thpg_menu_item child_texture = pickup_tomato text = 'change level colors' pad_choose_script = create_thug_pro_light_level_menu
    make_thpg_menu_item child_texture = pickup_tomato text = 'change fog colors' pad_choose_script = create_thug_pro_fog_menu
    make_thpg_menu_item child_texture = pickup_tomato text = 'change sky colors' pad_choose_script = create_thug_pro_light_sky_menu
    make_thpg_menu_item child_texture = pickup_tomato text = 'change skater ambient light values' pad_choose_script = create_thug_pro_light_skater_ambient_menu
    make_thpg_menu_item child_texture = pickup_tomato text = 'change skater directional light values' pad_choose_script = create_thug_pro_light_skater_menu
    make_thpg_menu_item child_texture = pickup_tomato text = 'change screen fx values' pad_choose_script = create_thug_pro_light_fx_menu
    make_thpg_menu_item child_texture = icon_save text = 'export current values' pad_choose_script = thug_pro_light_export_settings
    UTILS_FINALIZE_BASIC_MENU base_name = 'thug_pro_light'
    thug_pro_light_get_settings_from_memory
    create_thug_pro_light_menu_stats
endscript


script create_thug_pro_light_menu_stats 
    GetLevelStructureName
    FormatText checksumname = level_user_tod_params '%a_tod_%b_params' a = (<level_structure_name>.level)b = (LEVEL_TOD_STATE)
    if GlobalExists name = <level_user_tod_params> type = structure
        tod_values = 'custom'
    else
        tod_values = 'default'
    endif
    FormatText {
        TextName = tod_params_info 'current_level:\c4 %l\ntod_current_state:\c4 %a\ntod_values:\c4 %b'
        l = (<level_structure_name>.level)
        a = (LEVEL_TOD_STATE)
        b = <tod_values>
    }
    if ScreenElementExists id = light_menu_stats_background
        DestroyScreenElement id = light_menu_stats_background
    endif
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        id = light_menu_stats_background
        pos = (485.0, 0.0)
        scale = (60.0, 20.0)
        just = [ left , top ]
        internal_just = [ left , top ]
        texture = white
        rgba = [ 0 0 0 128 ]
        alpha = 0.6000
        z_priority = 1000
    }
    if ScreenElementExists id = light_menu_stats_text
        DestroyScreenElement id = light_menu_stats_text
    endif
    CreateScreenElement {
        type = TextBlockElement
        parent = current_menu_anchor
        id = light_menu_stats_text
        font = dialog
        text = <tod_params_info>
        scale = 0.7000
        pos = (500.0, 30.0)
        dims = (400.0, 100.0)
        line_spacing = 0.8000
        just = [ left , center ]
        internal_just = [ left , center ]
        z_priority = 1020
    }
endscript


script create_thug_pro_light_tod_menu 
    hide_all_hud_items
    UTILS_CREATE_BASIC_MENU {
        base_name = 'thug_pro_light_tod'
        menu_pos = (-80.0, 0.0)
        NO_BACKGROUND
        callback_script = create_thug_pro_light_menu
    }
    make_thpg_menu_item text = 'morning' pad_choose_script = thug_pro_light_menu_change_tod pad_choose_params = { state = morning }
    make_thpg_menu_item text = 'day/afternoon' pad_choose_script = thug_pro_light_menu_change_tod pad_choose_params = { state = afternoon }
    make_thpg_menu_item text = 'evening' pad_choose_script = thug_pro_light_menu_change_tod pad_choose_params = { state = evening }
    make_thpg_menu_item text = 'night' pad_choose_script = thug_pro_light_menu_change_tod pad_choose_params = { state = night }
    UTILS_FINALIZE_BASIC_MENU base_name = 'thug_pro_light_tod'
    create_thug_pro_light_menu_stats
endscript


script thug_pro_light_menu_change_tod 
    change thug_pro_light_tool_active = 0
    thugpro_menu_change_tod state = <state>
    create_thug_pro_light_menu_stats
endscript


script create_thug_pro_light_level_menu 
    hide_all_hud_items
    UTILS_CREATE_BASIC_MENU {
        base_name = 'thug_pro_light_level'
        menu_pos = (-80.0, 0.0)
        NO_BACKGROUND
        callback_script = create_thug_pro_light_menu
    }
    tp_light_tool_format_value_text value = (lev_red)
    make_thpg_menu_item {
        text = 'lev_red: '
        extra_text = <value_text>
        option_arrows
        option_arrows_callback = tp_light_tool_update_values
        option_arrows_callback_params = { value = lev_red scene }
    }
    tp_light_tool_format_value_text value = (lev_green)
    make_thpg_menu_item {
        text = 'lev_green: '
        extra_text = <value_text>
        option_arrows
        option_arrows_callback = tp_light_tool_update_values
        option_arrows_callback_params = { value = lev_green scene }
    }
    tp_light_tool_format_value_text value = (lev_blue)
    make_thpg_menu_item {
        text = 'lev_blue: '
        extra_text = <value_text>
        option_arrows
        option_arrows_callback = tp_light_tool_update_values
        option_arrows_callback_params = { value = lev_blue scene }
    }
    UTILS_FINALIZE_BASIC_MENU base_name = 'thug_pro_light_level'
    create_thug_pro_light_menu_stats
endscript


script set_current_sun_values 
    switch (LEVEL_TOD_STATE)
        case morning
        return {
            change morning_sun_theta = <sun_theta>
            change morning_sun_phi = <sun_phi>
            change morning_sun_red = <sun_red>
            change morning_sun_green = <sun_green>
            change morning_sun_blue = <sun_blue>
        }
        case afternoon
        return {
            change afternoon_sun_theta = <sun_theta>
            change afternoon_sun_phi = <sun_phi>
            change afternoon_sun_red = <sun_red>
            change afternoon_sun_green = <sun_green>
            change afternoon_sun_blue = <sun_blue>
        }
        case evening
        return {
            change evening_sun_theta = <sun_theta>
            change evening_sun_phi = <sun_phi>
            change evening_sun_red = <sun_red>
            change evening_sun_green = <sun_green>
            change evening_sun_blue = <sun_blue>
        }
        case night
        return {
            change night_sun_theta = <sun_theta>
            change night_sun_phi = <sun_phi>
            change night_sun_red = <sun_red>
            change night_sun_green = <sun_green>
            change night_sun_blue = <sun_blue>
        }
    endswitch
endscript


script get_current_sun_values 
    switch (LEVEL_TOD_STATE)
        case morning
        return {
            sun_theta = (morning_sun_theta)
            sun_phi = (morning_sun_phi)
            sun_red = (morning_sun_red)
            sun_green = (morning_sun_green)
            sun_blue = (morning_sun_blue)
        }
        case afternoon
        return {
            sun_theta = (afternoon_sun_theta)
            sun_phi = (afternoon_sun_phi)
            sun_red = (afternoon_sun_red)
            sun_green = (afternoon_sun_green)
            sun_blue = (afternoon_sun_blue)
        }
        case evening
        return {
            sun_theta = (evening_sun_theta)
            sun_phi = (evening_sun_phi)
            sun_red = (evening_sun_red)
            sun_green = (evening_sun_green)
            sun_blue = (evening_sun_blue)
        }
        case night
        return {
            sun_theta = (night_sun_theta)
            sun_phi = (night_sun_phi)
            sun_red = (night_sun_red)
            sun_green = (night_sun_green)
            sun_blue = (night_sun_blue)
        }
    endswitch
endscript


script tp_light_tool_format_value_text 
    if GotParam value
        FormatText TextName = value_text '%b' b = (<value>)
        return value_text = <value_text>
    else
        return value_text = '\c2BAD'
    endif
endscript


script tp_light_tool_update_values step = 1
    GetTags
    get_current_sun_values
    if GotParam sun
        switch <value>
            case sun_theta
            if GotParam right
                sun_theta = (<sun_theta> + <step>)
            else
                sun_theta = (<sun_theta> - <step>)
            endif
            tp_light_tool_format_value_text value = <sun_theta>
            case sun_phi
            if GotParam right
                sun_phi = (<sun_phi> + <step>)
            else
                sun_phi = (<sun_phi> - <step>)
            endif
            tp_light_tool_format_value_text value = <sun_phi>
            case sun_red
            if GotParam right
                sun_red = (<sun_red> + <step>)
            else
                sun_red = (<sun_red> - <step>)
            endif
            tp_light_tool_format_value_text value = <sun_red>
            case sun_green
            if GotParam right
                sun_green = (<sun_green> + <step>)
            else
                sun_green = (<sun_green> - <step>)
            endif
            tp_light_tool_format_value_text value = <sun_green>
            case sun_blue
            if GotParam right
                sun_blue = (<sun_blue> + <step>)
            else
                sun_blue = (<sun_blue> - <step>)
            endif
            tp_light_tool_format_value_text value = <sun_blue>
        endswitch
        set_current_sun_values <...> 
    else
        if GotParam right
            NewValue = ((<value>)+ <step>)
        else
            NewValue = ((<value>)- <step>)
        endif
        change GlobalName = <value> NewValue = <NewValue>
        tp_light_tool_format_value_text value = <value>
    endif
    SetScreenElementProps {
        id = {<id> child = extra_text}
        text = <value_text>
    }
    bloom_color_array = [0 , 0 , 0]
    SetArrayElement ArrayName = bloom_color_array index = 0 NewValue = (bloom_r)
    SetArrayElement ArrayName = bloom_color_array index = 1 NewValue = (bloom_g)
    SetArrayElement ArrayName = bloom_color_array index = 2 NewValue = (bloom_b)
    tod_params = {
        lev_red = (lev_red)
        lev_green = (lev_green)
        lev_blue = (lev_blue)
        sky_red = (sky_red)
        sky_green = (sky_green)
        sky_blue = (sky_blue)
        fog_red = (fog_red)
        fog_green = (fog_green)
        fog_blue = (fog_blue)
        fog_alpha = (fog_alpha)
        fog_dist = (fog_dist)
        sun_theta = <sun_theta>
        sun_phi = <sun_phi>
        sun_red = <sun_red>
        sun_green = <sun_green>
        sun_blue = <sun_blue>
        heading_0 = (dir0_head)
        pitch_0 = (dir0_pitch)
        red_0 = (dir0_red)
        green_0 = (dir0_green)
        blue_0 = (dir0_blue)
        mod_factor_0_lo = (dir0_mod_lo)
        mod_factor_0_hi = (dir0_mod_hi)
        heading_1 = (dir1_head)
        pitch_1 = (dir1_pitch)
        red_1 = (dir1_red)
        green_1 = (dir1_green)
        blue_1 = (dir1_blue)
        mod_factor_1_lo = (dir1_mod_lo)
        mod_factor_1_hi = (dir1_mod_hi)
        ambient_red = (ambient_red2)
        ambient_green = (ambient_green2)
        ambient_blue = (ambient_blue2)
        ambient_mod_factor_lo = (amb_mod_lo)
        ambient_mod_factor_hi = (amb_mod_hi)
        bloom_on = (bloom_on)
        bloom1 = (bloom_threshold)
        bloom2 = (bloom_strength)
        bloom_color = <bloom_color_array>
        state_length = 180000
    }
    switch (LEVEL_TOD_STATE)
        case morning
        tod_manager_set_default_params morning_params = <tod_params> current_params = <tod_params>
        case afternoon
        tod_manager_set_default_params afternoon_params = <tod_params> current_params = <tod_params>
        case evening
        tod_manager_set_default_params evening_params = <tod_params> current_params = <tod_params>
        case night
        tod_manager_set_default_params night_params = <tod_params> current_params = <tod_params>
    endswitch
    TODManager_SetTODInstant (LEVEL_TOD_STATE)
endscript


script create_thug_pro_light_sky_menu 
    hide_all_hud_items
    UTILS_CREATE_BASIC_MENU {
        base_name = 'thug_pro_light_sky'
        menu_pos = (-80.0, 0.0)
        menu_dims = (640.0, 1000.0)
        menu_params = { num_items_to_show = 100 }
        NO_BACKGROUND
        callback_script = create_thug_pro_light_menu
    }
    tp_light_tool_format_value_text value = (sky_red)
    make_thpg_menu_item {
        text = 'sky_red: '
        extra_text = <value_text>
        option_arrows
        option_arrows_callback = tp_light_tool_update_values
        option_arrows_callback_params = { value = sky_red scene }
    }
    tp_light_tool_format_value_text value = (sky_green)
    make_thpg_menu_item {
        text = 'sky_green: '
        extra_text = <value_text>
        option_arrows
        option_arrows_callback = tp_light_tool_update_values
        option_arrows_callback_params = { value = sky_green scene }
    }
    tp_light_tool_format_value_text value = (sky_blue)
    make_thpg_menu_item {
        text = 'sky_blue: '
        extra_text = <value_text>
        option_arrows
        option_arrows_callback = tp_light_tool_update_values
        option_arrows_callback_params = { value = sky_blue scene }
    }
    create_thug_pro_light_sun_menu_items
    UTILS_FINALIZE_BASIC_MENU base_name = 'thug_pro_light_sky'
    create_thug_pro_light_menu_stats
endscript


script create_thug_pro_fog_menu 
    hide_all_hud_items
    UTILS_CREATE_BASIC_MENU {
        base_name = 'thug_pro_fog'
        menu_pos = (-80.0, 0.0)
        menu_dims = (640.0, 1000.0)
        menu_params = { num_items_to_show = 100 }
        NO_BACKGROUND
        callback_script = create_thug_pro_light_menu
    }
    tp_light_tool_format_value_text value = (fog_red)
    make_thpg_menu_item {
        text = 'fog_red: '
        extra_text = <value_text>
        option_arrows
        option_arrows_callback = tp_light_tool_update_values
        option_arrows_callback_params = { value = fog_red fog }
    }
    tp_light_tool_format_value_text value = (fog_green)
    make_thpg_menu_item {
        text = 'fog_green: '
        extra_text = <value_text>
        option_arrows
        option_arrows_callback = tp_light_tool_update_values
        option_arrows_callback_params = { value = fog_green fog }
    }
    tp_light_tool_format_value_text value = (fog_blue)
    make_thpg_menu_item {
        text = 'fog_blue: '
        extra_text = <value_text>
        option_arrows
        option_arrows_callback = tp_light_tool_update_values
        option_arrows_callback_params = { value = fog_blue fog }
    }
    tp_light_tool_format_value_text value = (fog_alpha)
    make_thpg_menu_item {
        text = 'fog_alpha: '
        extra_text = <value_text>
        option_arrows
        option_arrows_callback = tp_light_tool_update_values
        option_arrows_callback_params = { value = fog_alpha fog }
    }
    tp_light_tool_format_value_text value = (fog_dist)
    make_thpg_menu_item {
        text = 'fog_dist: '
        extra_text = <value_text>
        option_arrows
        option_arrows_callback = tp_light_tool_update_values
        option_arrows_callback_params = {value = fog_dist step = 100 fog}
    }
    UTILS_FINALIZE_BASIC_MENU base_name = 'thug_pro_fog'
    create_thug_pro_light_menu_stats
endscript


script create_thug_pro_light_sun_menu_items 
    get_current_sun_values
    tp_light_tool_format_value_text value = <sun_theta>
    make_thpg_menu_item {
        text = 'sun_theta: '
        extra_text = <value_text>
        option_arrows
        option_arrows_callback = tp_light_tool_update_values
        option_arrows_callback_params = { value = sun_theta sun }
    }
    tp_light_tool_format_value_text value = <sun_phi>
    make_thpg_menu_item {
        text = 'sun_phi: '
        extra_text = <value_text>
        option_arrows
        option_arrows_callback = tp_light_tool_update_values
        option_arrows_callback_params = { value = sun_phi sun }
    }
    tp_light_tool_format_value_text value = <sun_red>
    make_thpg_menu_item {
        text = 'sun_red: '
        extra_text = <value_text>
        option_arrows
        option_arrows_callback = tp_light_tool_update_values
        option_arrows_callback_params = { value = sun_red sun }
    }
    tp_light_tool_format_value_text value = <sun_green>
    make_thpg_menu_item {
        text = 'sun_green: '
        extra_text = <value_text>
        option_arrows
        option_arrows_callback = tp_light_tool_update_values
        option_arrows_callback_params = { value = sun_green sun }
    }
    tp_light_tool_format_value_text value = <sun_blue>
    make_thpg_menu_item {
        text = 'sun_blue: '
        extra_text = <value_text>
        option_arrows
        option_arrows_callback = tp_light_tool_update_values
        option_arrows_callback_params = { value = sun_blue sun }
    }
endscript


script create_thug_pro_light_skater_ambient_menu 
    hide_all_hud_items
    UTILS_CREATE_BASIC_MENU {
        base_name = 'thug_pro_light_skater_ambient'
        menu_pos = (-80.0, 0.0)
        NO_BACKGROUND
        callback_script = create_thug_pro_light_menu
    }
    tp_light_tool_format_value_text value = (ambient_red2)
    make_thpg_menu_item {
        text = 'ambient_red: '
        extra_text = <value_text>
        option_arrows
        option_arrows_callback = tp_light_tool_update_values
        option_arrows_callback_params = {value = ambient_red2 skater ambient}
    }
    tp_light_tool_format_value_text value = (ambient_green2)
    make_thpg_menu_item {
        text = 'ambient_green: '
        extra_text = <value_text>
        option_arrows
        option_arrows_callback = tp_light_tool_update_values
        option_arrows_callback_params = {value = ambient_green2 skater ambient}
    }
    tp_light_tool_format_value_text value = (ambient_blue2)
    make_thpg_menu_item {
        text = 'ambient_blue: '
        extra_text = <value_text>
        option_arrows
        option_arrows_callback = tp_light_tool_update_values
        option_arrows_callback_params = {value = ambient_blue2 skater ambient}
    }
    tp_light_tool_format_value_text value = (amb_mod_lo)
    make_thpg_menu_item {
        text = 'ambient_mod_factor_lo: '
        extra_text = <value_text>
        option_arrows
        option_arrows_callback = tp_light_tool_update_values
        option_arrows_callback_params = {value = amb_mod_lo skater ambient step = 0.01000}
    }
    tp_light_tool_format_value_text value = (amb_mod_hi)
    make_thpg_menu_item {
        text = 'ambient_mod_factor_hi: '
        extra_text = <value_text>
        option_arrows
        option_arrows_callback = tp_light_tool_update_values
        option_arrows_callback_params = {value = amb_mod_hi skater ambient step = 0.01000}
    }
    UTILS_FINALIZE_BASIC_MENU base_name = 'thug_pro_light_skater_ambient'
    create_thug_pro_light_menu_stats
endscript


script create_thug_pro_light_skater_menu 
    hide_all_hud_items
    UTILS_CREATE_BASIC_MENU {
        base_name = 'thug_pro_light_skater'
        menu_pos = (-80.0, 0.0)
        menu_dims = (640.0, 1000.0)
        menu_params = { num_items_to_show = 100 }
        NO_BACKGROUND
        callback_script = create_thug_pro_light_menu
    }
    tp_light_tool_format_value_text value = (dir0_head)
    make_thpg_menu_item {
        text = 'heading_0: '
        extra_text = <value_text>
        option_arrows
        option_arrows_callback = tp_light_tool_update_values
        option_arrows_callback_params = {value = dir0_head skater dir0}
    }
    tp_light_tool_format_value_text value = (dir0_pitch)
    make_thpg_menu_item {
        text = 'pitch_0: '
        extra_text = <value_text>
        option_arrows
        option_arrows_callback = tp_light_tool_update_values
        option_arrows_callback_params = {value = dir0_pitch skater dir0}
    }
    tp_light_tool_format_value_text value = (dir0_red)
    make_thpg_menu_item {
        text = 'red_0: '
        extra_text = <value_text>
        option_arrows
        option_arrows_callback = tp_light_tool_update_values
        option_arrows_callback_params = {value = dir0_red skater dir0}
    }
    tp_light_tool_format_value_text value = (dir0_green)
    make_thpg_menu_item {
        text = 'green_0: '
        extra_text = <value_text>
        option_arrows
        option_arrows_callback = tp_light_tool_update_values
        option_arrows_callback_params = {value = dir0_green skater dir0}
    }
    tp_light_tool_format_value_text value = (dir0_blue)
    make_thpg_menu_item {
        text = 'blue_0: '
        extra_text = <value_text>
        option_arrows
        option_arrows_callback = tp_light_tool_update_values
        option_arrows_callback_params = {value = dir0_blue skater dir0}
    }
    tp_light_tool_format_value_text value = (dir0_mod_lo)
    make_thpg_menu_item {
        text = 'mod_factor_0_lo: '
        extra_text = <value_text>
        option_arrows
        option_arrows_callback = tp_light_tool_update_values
        option_arrows_callback_params = {value = dir0_mod_lo skater dir0 step = 0.01000}
    }
    tp_light_tool_format_value_text value = (dir0_mod_hi)
    make_thpg_menu_item {
        text = 'mod_factor_0_hi: '
        extra_text = <value_text>
        option_arrows
        option_arrows_callback = tp_light_tool_update_values
        option_arrows_callback_params = {value = dir0_mod_hi skater dir0 step = 0.01000}
    }
    tp_light_tool_format_value_text value = (dir1_head)
    make_thpg_menu_item {
        text = 'heading_1: '
        extra_text = <value_text>
        option_arrows
        option_arrows_callback = tp_light_tool_update_values
        option_arrows_callback_params = {value = dir1_head skater dir1}
    }
    tp_light_tool_format_value_text value = (dir1_pitch)
    make_thpg_menu_item {
        text = 'pitch_1: '
        extra_text = <value_text>
        option_arrows
        option_arrows_callback = tp_light_tool_update_values
        option_arrows_callback_params = {value = dir1_pitch skater dir1}
    }
    tp_light_tool_format_value_text value = (dir1_red)
    make_thpg_menu_item {
        text = 'red_1: '
        extra_text = <value_text>
        option_arrows
        option_arrows_callback = tp_light_tool_update_values
        option_arrows_callback_params = {value = dir1_red skater dir1}
    }
    tp_light_tool_format_value_text value = (dir1_green)
    make_thpg_menu_item {
        text = 'green_1: '
        extra_text = <value_text>
        option_arrows
        option_arrows_callback = tp_light_tool_update_values
        option_arrows_callback_params = {value = dir1_green skater dir1}
    }
    tp_light_tool_format_value_text value = (dir1_blue)
    make_thpg_menu_item {
        text = 'blue_1: '
        extra_text = <value_text>
        option_arrows
        option_arrows_callback = tp_light_tool_update_values
        option_arrows_callback_params = {value = dir1_blue skater dir1}
    }
    tp_light_tool_format_value_text value = (dir1_mod_lo)
    make_thpg_menu_item {
        text = 'mod_factor_1_lo: '
        extra_text = <value_text>
        option_arrows
        option_arrows_callback = tp_light_tool_update_values
        option_arrows_callback_params = {value = dir1_mod_lo skater dir1 step = 0.01000}
    }
    tp_light_tool_format_value_text value = (dir1_mod_hi)
    make_thpg_menu_item {
        text = 'mod_factor_1_hi: '
        extra_text = <value_text>
        option_arrows
        option_arrows_callback = tp_light_tool_update_values
        option_arrows_callback_params = {value = dir1_mod_hi skater dir1 step = 0.01000}
    }
    UTILS_FINALIZE_BASIC_MENU base_name = 'thug_pro_light_skater'
    create_thug_pro_light_menu_stats
endscript


script create_thug_pro_light_fx_menu 
    hide_all_hud_items
    UTILS_CREATE_BASIC_MENU {
        base_name = 'thug_pro_light_fx'
        menu_pos = (-80.0, 0.0)
        NO_BACKGROUND
        callback_script = create_thug_pro_light_menu
    }
    tp_light_tool_format_value_text value = (bloom_on)
    make_thpg_menu_item {
        text = 'Bloom enabled: '
        extra_text = <value_text>
        option_arrows
        option_arrows_callback = tp_light_tool_update_values
        option_arrows_callback_params = {value = bloom_on bloom step = 1}
    }
    tp_light_tool_format_value_text value = (bloom_threshold)
    make_thpg_menu_item {
        text = 'Bloom threshold: '
        extra_text = <value_text>
        option_arrows
        option_arrows_callback = tp_light_tool_update_values
        option_arrows_callback_params = {value = bloom_threshold bloom step = 1}
    }
    tp_light_tool_format_value_text value = (bloom_strength)
    make_thpg_menu_item {
        text = 'Bloom strength: '
        extra_text = <value_text>
        option_arrows
        option_arrows_callback = tp_light_tool_update_values
        option_arrows_callback_params = {value = bloom_strength bloom step = 1}
    }
    tp_light_tool_format_value_text value = (bloom_r)
    make_thpg_menu_item {
        text = 'Bloom red: '
        extra_text = <value_text>
        option_arrows
        option_arrows_callback = tp_light_tool_update_values
        option_arrows_callback_params = {value = bloom_r bloom step = 1}
    }
    tp_light_tool_format_value_text value = (bloom_g)
    make_thpg_menu_item {
        text = 'Bloom green: '
        extra_text = <value_text>
        option_arrows
        option_arrows_callback = tp_light_tool_update_values
        option_arrows_callback_params = {value = bloom_g bloom step = 1}
    }
    tp_light_tool_format_value_text value = (bloom_b)
    make_thpg_menu_item {
        text = 'Bloom blue: '
        extra_text = <value_text>
        option_arrows
        option_arrows_callback = tp_light_tool_update_values
        option_arrows_callback_params = {value = bloom_b bloom step = 1}
    }
    UTILS_FINALIZE_BASIC_MENU base_name = 'thug_pro_light_fx'
    create_thug_pro_light_menu_stats
endscript

thug_pro_light_tool_active = 0

script thug_pro_light_get_settings_from_memory 
    TODManager_GetCurrentTODParams
    GetLightCurrentColor
    change lev_red = (<tod_params>.lev_red)
    change lev_green = (<tod_params>.lev_green)
    change lev_blue = (<tod_params>.lev_blue)
    change sky_red = (<tod_params>.sky_red)
    change sky_green = (<tod_params>.sky_green)
    change sky_blue = (<tod_params>.sky_blue)
    change dir0_head = (<tod_params>.heading_0)
    change dir0_pitch = (<tod_params>.pitch_0)
    change dir0_red = <red_0>
    change dir0_green = <green_0>
    change dir0_blue = <blue_0>
    change mod_factor_0_lo = (<tod_params>.dir0_mod_lo)
    change mod_factor_0_hi = (<tod_params>.dir0_mod_hi)
    change dir1_head = (<tod_params>.heading_1)
    change dir1_pitch = (<tod_params>.pitch_1)
    change dir1_red = <red_1>
    change dir1_green = <green_1>
    change dir1_blue = <blue_1>
    change mod_factor_1_lo = (<tod_params>.dir1_mod_lo)
    change mod_factor_1_hi = (<tod_params>.dir1_mod_hi)
    change ambient_red2 = <ambient_red>
    change ambient_green2 = <ambient_green>
    change ambient_blue2 = <ambient_blue>
    change amb_mod_lo = (<tod_params>.ambient_mod_factor_lo)
    change amb_mod_hi = (<tod_params>.ambient_mod_factor_hi)
    change bloom_on = (<tod_params>.bloom_on)
    change bloom_threshold = (<tod_params>.bloom1)
    change bloom_strength = (<tod_params>.bloom2)
    change bloom_r = (<tod_params>.bloom_color [ 0 ])
    change bloom_g = (<tod_params>.bloom_color [ 1 ])
    change bloom_b = (<tod_params>.bloom_color [ 2 ])
endscript


script thug_pro_light_export_settings 
    printf 'thug_pro_light_export_settings'
    GetLevelStructureName
    TODManager_GetCurrentTODParams
    GetLightCurrentColor
    get_current_sun_values
    FormatText TextName = structure_name '%a_tod_%b_params' a = (<level_structure_name>.level)b = (LEVEL_TOD_STATE)
    filename = (('..\source\generated\tod_params\')+ (<structure_name>)+ ('.q'))
    printf <filename>
    THUGPRO_WriteFile filename = <filename> string = '// GENERATED WITH THE THUGPRO LIGHT TOOL'
    FormatText TextName = line '%a = {' a = <structure_name>
    THUGPRO_WriteToFile filename = <filename> string = <line>
    FormatText TextName = line '	state_length = 90000' a = 90000
    THUGPRO_WriteToFile filename = <filename> string = <line>
    FormatText TextName = line '	entry_script = nullscript'
    THUGPRO_WriteToFile filename = <filename> string = <line>
    FormatText TextName = line '	lev_red = %a' a = (<tod_params>.lev_red)
    THUGPRO_WriteToFile filename = <filename> string = <line>
    FormatText TextName = line '	lev_green = %a' a = (<tod_params>.lev_green)
    THUGPRO_WriteToFile filename = <filename> string = <line>
    FormatText TextName = line '	lev_blue = %a' a = (<tod_params>.lev_blue)
    THUGPRO_WriteToFile filename = <filename> string = <line>
    FormatText TextName = line '	sky_red = %a' a = (<tod_params>.sky_red)
    THUGPRO_WriteToFile filename = <filename> string = <line>
    FormatText TextName = line '	sky_green = %a' a = (<tod_params>.sky_green)
    THUGPRO_WriteToFile filename = <filename> string = <line>
    FormatText TextName = line '	sky_blue = %a' a = (<tod_params>.sky_blue)
    THUGPRO_WriteToFile filename = <filename> string = <line>
    FormatText TextName = line '	ambient_mod_factor_lo = %a' a = (<tod_params>.ambient_mod_factor_lo)
    THUGPRO_WriteToFile filename = <filename> string = <line>
    FormatText TextName = line '	ambient_mod_factor_hi = %a' a = (<tod_params>.ambient_mod_factor_hi)
    THUGPRO_WriteToFile filename = <filename> string = <line>
    FormatText TextName = line '	ambient_red = %a' a = (<tod_params>.ambient_red)
    THUGPRO_WriteToFile filename = <filename> string = <line>
    FormatText TextName = line '	ambient_green = %a' a = (<tod_params>.ambient_green)
    THUGPRO_WriteToFile filename = <filename> string = <line>
    FormatText TextName = line '	ambient_blue = %a' a = (<tod_params>.ambient_blue)
    THUGPRO_WriteToFile filename = <filename> string = <line>
    FormatText TextName = line '	heading_0 = %a' a = (<tod_params>.heading_0)
    THUGPRO_WriteToFile filename = <filename> string = <line>
    FormatText TextName = line '	pitch_0 = %a' a = (<tod_params>.pitch_0)
    THUGPRO_WriteToFile filename = <filename> string = <line>
    FormatText TextName = line '	red_0 = %a' a = (<tod_params>.red_0)
    THUGPRO_WriteToFile filename = <filename> string = <line>
    FormatText TextName = line '	green_0 = %a' a = (<tod_params>.green_0)
    THUGPRO_WriteToFile filename = <filename> string = <line>
    FormatText TextName = line '	blue_0 = %a' a = (<tod_params>.blue_0)
    THUGPRO_WriteToFile filename = <filename> string = <line>
    FormatText TextName = line '	mod_factor_0_lo = %a' a = (<tod_params>.mod_factor_0_lo)
    THUGPRO_WriteToFile filename = <filename> string = <line>
    FormatText TextName = line '	mod_factor_0_hi = %a' a = (<tod_params>.mod_factor_0_hi)
    THUGPRO_WriteToFile filename = <filename> string = <line>
    FormatText TextName = line '	heading_1 = %a' a = (<tod_params>.heading_1)
    THUGPRO_WriteToFile filename = <filename> string = <line>
    FormatText TextName = line '	pitch_1 = %a' a = (<tod_params>.pitch_1)
    THUGPRO_WriteToFile filename = <filename> string = <line>
    FormatText TextName = line '	red_1 = %a' a = (<tod_params>.red_1)
    THUGPRO_WriteToFile filename = <filename> string = <line>
    FormatText TextName = line '	green_1 = %a' a = (<tod_params>.green_1)
    THUGPRO_WriteToFile filename = <filename> string = <line>
    FormatText TextName = line '	blue_1 = %a' a = (<tod_params>.blue_1)
    THUGPRO_WriteToFile filename = <filename> string = <line>
    FormatText TextName = line '	mod_factor_1_lo = %a' a = (<tod_params>.mod_factor_1_lo)
    THUGPRO_WriteToFile filename = <filename> string = <line>
    FormatText TextName = line '	mod_factor_1_hi = %a' a = (<tod_params>.mod_factor_1_hi)
    THUGPRO_WriteToFile filename = <filename> string = <line>
    FormatText TextName = line '	fog_on = %a' a = (<tod_params>.fog_on)
    THUGPRO_WriteToFile filename = <filename> string = <line>
    FormatText TextName = line '	fog_red = %a' a = (<tod_params>.fog_red)
    THUGPRO_WriteToFile filename = <filename> string = <line>
    FormatText TextName = line '	fog_green = %a' a = (<tod_params>.fog_green)
    THUGPRO_WriteToFile filename = <filename> string = <line>
    FormatText TextName = line '	fog_blue = %a' a = (<tod_params>.fog_blue)
    THUGPRO_WriteToFile filename = <filename> string = <line>
    FormatText TextName = line '	fog_alpha = %a' a = (<tod_params>.fog_alpha)
    THUGPRO_WriteToFile filename = <filename> string = <line>
    FormatText TextName = line '	fog_dist = %a' a = (<tod_params>.fog_dist)
    THUGPRO_WriteToFile filename = <filename> string = <line>
    FormatText TextName = line '	sun_theta = %a' a = <sun_theta>
    THUGPRO_WriteToFile filename = <filename> string = <line>
    FormatText TextName = line '	sun_phi = %a' a = <sun_phi>
    THUGPRO_WriteToFile filename = <filename> string = <line>
    FormatText TextName = line '	sun_red = %a' a = <sun_red>
    THUGPRO_WriteToFile filename = <filename> string = <line>
    FormatText TextName = line '	sun_green = %a' a = <sun_green>
    THUGPRO_WriteToFile filename = <filename> string = <line>
    FormatText TextName = line '	sun_blue = %a' a = <sun_blue>
    THUGPRO_WriteToFile filename = <filename> string = <line>
    FormatText TextName = line '	bloom_on = %a' a = (bloom_on)
    THUGPRO_WriteToFile filename = <filename> string = <line>
    FormatText TextName = line '	bloom1 = %a' a = (bloom_threshold)
    THUGPRO_WriteToFile filename = <filename> string = <line>
    FormatText TextName = line '	bloom2 = %a' a = (bloom_strength)
    THUGPRO_WriteToFile filename = <filename> string = <line>
    FormatText TextName = line '	bloom_color = [%r, %g, %b]' r = (bloom_r)g = (bloom_g)b = (bloom_b)
    THUGPRO_WriteToFile filename = <filename> string = <line>
    FormatText TextName = line '}'
    THUGPRO_WriteToFile filename = <filename> string = <line>
endscript

