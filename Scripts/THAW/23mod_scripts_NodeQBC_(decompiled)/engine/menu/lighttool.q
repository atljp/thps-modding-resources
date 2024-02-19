current_lighttool_params = { null }
current_lighttool_light_save = { null }
current_lighttool_shadow_save = { shadows_on = 1 }
current_lighttool_global_save_startup = { null }
current_lighttool_global_save_modified = { null }

script global_light_fx_menu_create {
        items_common = [
            {
                text = 'Adjust Character Lights'
                control_items = [
                    {
                        text = 'Ambient'
                        callback = update_light_dir_and_apply
                        structure = current_lighttool_params
                        control_items = [
                            {text = 'Czerwona' param = ambient_red param_links = [ ambient_green ambient_blue ] min = 0 max = 255 step = 1}
                            {text = 'Zielona' param = ambient_green param_links = [ ambient_red ambient_blue ] min = 0 max = 255 step = 1}
                            {text = 'Niebieski' param = ambient_blue param_links = [ ambient_red ambient_green ] min = 0 max = 255 step = 1}
                            {text = 'Mod Lo' param = ambient_mod_factor_lo min = 0.0 max = 2.0 step = 0.01000}
                            {text = 'Mod Hi' param = ambient_mod_factor_hi min = 0.0 max = 2.0 step = 0.01000}
                        ]
                    }
                    {
                        text = 'Light One'
                        callback = update_light_dir_and_apply
                        structure = current_lighttool_params
                        control_items = [
                            {text = 'Heading' param = heading_0 min = 0.0 max = 360.0 range_loop = 1 step = 1}
                            {text = 'Pitch' param = pitch_0 min = 0.0 max = 360.0 range_loop = 1 step = 1}
                            {text = 'Czerwona' param = red_0 param_links = [ green_0 blue_0 ] min = 0 max = 255 step = 1}
                            {text = 'Zielona' param = green_0 param_links = [ red_0 blue_0 ] min = 0 max = 255 step = 1}
                            {text = 'Niebieski' param = blue_0 param_links = [ red_0 green_0 ] min = 0 max = 255 step = 1}
                            {text = 'Mod Lo' param = mod_factor_0_lo min = 0.0 max = 2.0 step = 0.01000}
                            {text = 'Mod Hi' param = mod_factor_0_hi min = 0.0 max = 2.0 step = 0.01000}
                            {
                                text = 'Enable'
                                param = light0_on
                                values = [ 1 0 ]
                                value_labels = [ 'on' 'off' ]
                                callback = toggle_light0
                                structure = current_lighttool_light_save
                                range_loop = 1
                            }
                        ]
                    }
                    {
                        text = 'Light Two'
                        callback = update_light_dir_and_apply
                        structure = current_lighttool_params
                        control_items = [
                            {text = 'Heading' param = heading_1 min = 0.0 max = 360.0 range_loop = 1 step = 1}
                            {text = 'Pitch' param = pitch_1 min = 0.0 max = 360.0 range_loop = 1 step = 1}
                            {text = 'Czerwona' param = red_1 param_links = [ green_1 blue_1 ] min = 0 max = 255 step = 1}
                            {text = 'Zielona' param = green_1 param_links = [ red_1 blue_1 ] min = 0 max = 255 step = 1}
                            {text = 'Niebieski' param = blue_1 param_links = [ red_1 green_1 ] min = 0 max = 255 step = 1}
                            {text = 'Mod Lo' param = mod_factor_1_lo min = 0.0 max = 2.0 step = 0.01000}
                            {text = 'Mod Hi' param = mod_factor_1_hi min = 0.0 max = 2.0 step = 0.01000}
                            {
                                text = 'Enable'
                                param = light1_on
                                values = [ 1 0 ]
                                value_labels = [ 'on' 'off' ]
                                callback = toggle_light1
                                structure = current_lighttool_light_save
                                range_loop = 1
                            }
                        ]
                    }
                ]
            }
            {
                text = 'Adjust Level Lights'
                control_items = [
                    {
                        text = 'Ambient'
                        callback = global_fx_unlock_and_set_temp_tod
                        structure = current_lighttool_params
                        control_items = [
                            {text = 'Czerwona' param = lev_red param_links = [ lev_green lev_blue ] min = 0 max = 255 step = 1}
                            {text = 'Zielona' param = lev_green param_links = [ lev_red lev_blue ] min = 0 max = 255 step = 1}
                            {text = 'Niebieski' param = lev_blue param_links = [ lev_red lev_green ] min = 0 max = 255 step = 1}
                        ]
                    }
                    {
                        text = 'Sky'
                        callback = global_fx_unlock_and_set_temp_tod
                        structure = current_lighttool_params
                        control_items = [
                            {text = 'Czerwona' param = sky_red param_links = [ sky_green sky_blue ] min = 0 max = 255 step = 1}
                            {text = 'Zielona' param = sky_green param_links = [ sky_red sky_blue ] min = 0 max = 255 step = 1}
                            {text = 'Niebieski' param = sky_blue param_links = [ sky_red sky_green ] min = 0 max = 255 step = 1}
                        ]
                    }
                    {
                        text = 'Sun'
                        callback = global_fx_unlock_and_set_temp_tod
                        structure = current_lighttool_params
                        control_items = [
                            {
                                text = 'Enable'
                                param = sun_on
                                values = [ 1 0 ]
                                value_labels = [ 'on' 'off' ]
                                range_loop = 1
                            }
                            {text = 'Theta' param = sun_theta min = 0.0 max = 360.0 range_loop = 1 step = 1}
                            {text = 'Phi' param = sun_phi min = 0.0 max = 360.0 range_loop = 1 step = 1}
                            {text = 'Czerwona' param = sun_red param_links = [ sun_green sun_blue ] min = 0 max = 255 step = 1}
                            {text = 'Zielona' param = sun_green param_links = [ sun_red sun_blue ] min = 0 max = 255 step = 1}
                            {text = 'Niebieski' param = sun_blue param_links = [ sun_red sun_green ] min = 0 max = 255 step = 1}
                        ]
                    }
                    {
                        text = 'Fog'
                        callback = global_fx_unlock_and_set_temp_tod
                        structure = current_lighttool_params
                        control_items = [
                            {
                                text = 'Enable'
                                param = fog_on
                                values = [ 1 0 ]
                                value_labels = [ 'on' 'off' ]
                                range_loop = 1
                            }
                            {text = 'Distance' param = fog_dist min = 0 max = 100000 step = 5}
                            {text = 'Czerwona' param = fog_red param_links = [ fog_green fog_blue ] min = 0 max = 255 step = 1}
                            {text = 'Zielona' param = fog_green param_links = [ fog_red fog_blue ] min = 0 max = 255 step = 1}
                            {text = 'Niebieski' param = fog_blue param_links = [ fog_red fog_green ] min = 0 max = 255 step = 1}
                            {text = 'Alpha' param = fog_alpha min = 0 max = 255 step = 1}
                        ]
                    }
                    {
                        text = 'Sky Fog'
                        callback = global_fx_unlock_and_set_temp_tod
                        structure = current_lighttool_params
                        control_items = [
                            {text = 'Czerwona' param = fog_sky_red param_links = [ fog_sky_green fog_sky_blue ] min = 0 max = 255 step = 1}
                            {text = 'Zielona' param = fog_sky_green param_links = [ fog_sky_red fog_sky_blue ] min = 0 max = 255 step = 1}
                            {text = 'Niebieski' param = fog_sky_blue param_links = [ fog_sky_red fog_sky_green ] min = 0 max = 255 step = 1}
                            {text = 'Alpha' param = fog_sky_alpha min = 0 max = 255 step = 1}
                        ]
                    }
                ]
            }
            {
                text = 'Adjust Screen Effects'
                control_items = [
                    {
                        text = 'Bloom'
                        callback = global_fx_unlock_and_set_temp_tod
                        structure = current_lighttool_params
                        control_items = [
                            {
                                text = 'Enable'
                                param = bloom_on
                                values = [ 1 0 ]
                                value_labels = [ 'on' 'off' ]
                                range_loop = 1
                            }
                            {text = 'Bloom1' param = bloom1 min = 0 max = 100 step = 1}
                            {text = 'Bloom2' param = bloom2 min = 0 max = 100 step = 1}
                            {text = 'Strength' param = bloom_strength min = 0 max = 255 step = 1}
                            {text = 'Color' param = bloom_color min = 0 max = 255 step = 1}
                        ]
                    }
                    {
                        text = 'Depth of Field'
                        callback = global_fx_unlock_and_set_temp_tod
                        structure = current_lighttool_params
                        control_items = [
                            {
                                text = 'Enable'
                                param = dof_on
                                values = [ 1 0 ]
                                value_labels = [ 'on' 'off' ]
                                range_loop = 1
                            }
                            {text = 'Strength' param = DOF_Strength min = 0 max = 128 step = 1}
                            {text = 'Crossfade' param = dof_crossfade min = 0 max = 128 step = 1}
                            {text = 'Back Dist' param = dof_backdist min = 0 max = 255 step = 1}
                            {text = 'Front Dist' param = dof_frontdist min = 0 max = 255 step = 1}
                            {text = 'Back Color' param = dof_backcolor min = 0 max = 255 step = 1}
                            {text = 'Front Color' param = dof_frontcolor min = 0 max = 255 step = 1}
                        ]
                    }
                    {
                        text = 'Shadow Volumes'
                        callback = SetScreenEffectsShadowVolumeParams
                        structure = Shadow_Volume_Settings
                        control_items = [
                            {
                                text = 'Enable'
                                param = shadows_on
                                values = [ 1 0 ]
                                value_labels = [ 'on' 'off' ]
                                callback = global_fx_toggle_shadows
                                structure = current_lighttool_shadow_save
                                range_loop = 1
                            }
                            {text = 'Intensity' param = intensity min = 0.0 max = 1.0 step = 0.01000}
                            {text = 'Softness' param = softness min = 0.0 max = 1.0 step = 0.01000}
                            {
                                text = 'Rodzaj'
                                param = type
                                values = [ Blend modulate ]
                                value_labels = [ 'blend' 'modulate' ]
                                range_loop = 1
                            }
                            {text = 'Color' param = color min = 0 max = 255 step = 1}
                        ]
                    }
                    {
                        text = 'White Noise'
                        callback = global_fx_set_noise
                        structure = White_Noise_Settings
                        control_items = [
                            {
                                text = 'Enable'
                                param = on
                                values = [ 1 0 ]
                                value_labels = [ 'on' 'off' ]
                                range_loop = 1
                            }
                            {text = 'Intensity' param = intensity min = 0 max = 255 step = 1}
                            {text = 'Color' param = color min = 0 max = 255 step = 1}
                        ]
                    }
                    {
                        text = 'Zoom Blur'
                        callback = SetScreenEffectsBlurParams
                        structure = ZoomBlur_Settings
                        control_items = [
                            {text = 'Focus Center' param = focus_center min = 0.0 max = 1.0 step = 0.05000 index_item_labels = [ 'Inner' 'Outer' ]}
                            {text = 'Skaluj' param = scales min = -5 max = 5 step = 0.05000 index_item_labels = [ 'Inner' 'Outer' ]}
                            {text = 'Angle' param = angles min = -360 max = 360 step = 1 index_item_labels = [ 'Inner' 'Outer' ]}
                            {text = 'Inner Color' param = inner_color min = -8 max = 8 step = 0.1000}
                            {text = 'Inner Alpha' param = inner_alpha min = -8 max = 8 step = 0.1000}
                            {text = 'Outer Color' param = outer_color min = -8 max = 8 step = 0.05000}
                            {text = 'Outer Alpha' param = outer_alpha min = -8 max = 8 step = 0.05000}
                        ]
                        padding_scale = 0.8000
                        Scale = 0.8500
                    }
                    {
                        xenon_only
                        text = 'Shader Override( Xenon Only )'
                        callback = SetShaderOverrideParams
                        structure = ShaderOverrideSettings
                        control_items = [
                            {
                                text = 'Static'
                                param = override_static
                                values = [ 1 0 ]
                                value_labels = [ 'on' 'off' ]
                                range_loop = 1
                            }
                            {
                                text = 'Skinned'
                                param = override_skinned
                                values = [ 1 0 ]
                                value_labels = [ 'on' 'off' ]
                                range_loop = 1
                            }
                            {
                                text = 'Normal Mapped'
                                param = override_normalmapped
                                values = [ 1 0 ]
                                value_labels = [ 'on' 'off' ]
                                range_loop = 1
                            }
                            {
                                text = 'Env Mapped'
                                param = override_envmapped
                                values = [ 1 0 ]
                                value_labels = [ 'on' 'off' ]
                                range_loop = 1
                            }
                            {
                                text = 'UV Wibble'
                                param = override_uvwibble
                                values = [ 1 0 ]
                                value_labels = [ 'on' 'off' ]
                                range_loop = 1
                            }
                            {
                                text = 'Pass Count'
                                param = override_pass
                                values = [0 1 2 3 4]
                                value_labels = ['off' '0' '1' '2' '3']
                            }
                            {
                                text = 'Shader'
                                param = override_shader
                                values = [0 1 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40]
                                value_labels = ['Simple' 'NormalMapLighting' 'TexturePass0' 'TexturePass1' 'TexturePass2' 'TexturePass3' 'TexturePass4' 'TexturePass5' 'TexturePass0A' 'TexturePass1A' 'TexturePass2A' 'TexturePass3A' 'TexturePass4A' 'TexturePass5A' 'EnvmapPass0' 'EnvmapPass1' 'EnvmapPass2' 'EnvmapPass3' 'UVWibble0' 'UVWibble1' 'UVWibble2' 'UVWibble3' 'MatCol0' 'MatCol1' 'MatCol2' 'MatCol3' 'VertCol' 'Light0' 'Light1' 'Light2' 'LightAll' 'UV0' 'UV1' 'UV2' 'UV3' 'Normals' 'Binormals' 'Tangent Light' 'HotPink']
                            }
                        ]
                    }
                ]
            }
        ]
        items_common_nocontrol = [
            {text = 'Print current temp TOD' pad_choose_script = global_light_fx_print_current}
            {text = 'Ukryæ narzêdznie, trzymaæ je TOD (domylnie)' pad_choose_script = global_light_fx_menu_hide}
            {text = 'Wyjd i przywróæ oryginalne ustawienia' pad_choose_script = global_light_fx_restore_original_tod_and_quit}
        ]
        buttons_common = [
            {
                binding = pad_circle
                callback = global_fx_toggle_preview
                text = '\m4: Podgl¹d prze³¹czania'
            }
            {
                binding = pad_r2
                callback = global_fx_toggle_focus
                text = '\ml: W³¹czenie menu'
            }
        ]
    }
    if StructureContains structure = current_lighttool_params null
        if ScreenElementExists id = light_tool_anchor
            DestroyScreenElement id = light_tool_anchor
        endif
    endif
    if NOT ScreenElementExists id = light_tool_anchor
        global_fx_menu_init_menu
        light_tool_anchor ::settags structure_array = [ null ]
        light_tool_anchor ::settags structure_array_valid = 0
        if GotParam items_common
            i = 0
            GetArraySize items_common
            size_i = <array_size>
            begin 
            global_fx_find_structures_in_menu_category (<items_common> [ <i> ])
            if StructureContains structure = (<items_common> [ <i> ])control_items
                j = 0
                GetArraySize (<items_common> [ <i> ].control_items)
                size_j = <array_size>
                begin 
                global_fx_find_structures_in_menu_category (<items_common> [ <i> ].control_items [ <j> ])
                if StructureContains structure = (<items_common> [ <i> ].control_items [ <j> ])control_items
                    k = 0
                    GetArraySize (<items_common> [ <i> ].control_items [ <j> ].control_items)
                    size_k = <array_size>
                    begin 
                    global_fx_find_structures_in_menu_category (<items_common> [ <i> ].control_items [ <j> ].control_items [ <k> ])
                    k = (<k> + 1)
                    repeat <size_k>
                endif
                j = (<j> + 1)
                repeat <size_j>
            endif
            i = (<i> + 1)
            repeat <size_i>
        endif
        if GotParam items_game
            i = 0
            GetArraySize items_game
            size_i = <array_size>
            begin 
            global_fx_find_structures_in_menu_category (<items_game> [ <i> ])
            if StructureContains structure = (<items_game> [ <i> ])control_items
                j = 0
                GetArraySize (<items_game> [ <i> ].control_items)
                size_j = <array_size>
                begin 
                global_fx_find_structures_in_menu_category (<items_game> [ <i> ].control_items [ <j> ])
                if StructureContains structure = (<items_game> [ <i> ].control_items [ <j> ])control_items
                    k = 0
                    GetArraySize (<items_game> [ <i> ].control_items [ <j> ].control_items)
                    size_k = <array_size>
                    begin 
                    global_fx_find_structures_in_menu_category (<items_game> [ <i> ].control_items [ <j> ].control_items [ <k> ])
                    k = (<k> + 1)
                    repeat <size_k>
                endif
                j = (<j> + 1)
                repeat <size_j>
            endif
            i = (<i> + 1)
            repeat <size_i>
        endif
        light_tool_anchor ::getsingletag structure_array_valid
        if NOT (<structure_array_valid> = 1)
            scriptassert 'No valid structures were found. Uh oh'
        endif
        global_fx_menu_init_globals
    endif
    SetScreenEffectsOn
    SetAnalogStickActiveForMenus 0
    global_fx_menu_clear
    create_vmenu_with_title {
        parent = light_tool_anchor
        vmenu_id = light_tool_vmenu
        text = 'WIAT£O / NARZÊDZIE FX'
        title_color = [ 4 45 120 128 ]
        title_scale = 1.600
    }
    SetScreenElementProps {
        id = current_menu
        event_handlers = [{ pad_back global_light_fx_menu_hide }]
        replace_handlers
    }
    light_tool_anchor ::settags {
        callback_hide = <callback_hide>
        callback_quit = <callback_quit>
        callback_print = <callback_print>
        callback_refresh = <callback_refresh>
        buttons_game = <buttons_game>
        buttons_common = <buttons_common>
    }
    global_fx_tool_message text = '\m1: Ukryj narzêdzie' parent = light_tool_helpers
    global_fx_add_generic_handlers
    GetArraySize items_common
    i = 0
    begin 
    CreateScreenElement {
        type = TextElement
        parent = current_menu
        text = (<items_common> [ <i> ].text)
        font = small
        rgba = [ 88 105 112 128 ]
        Scale = 1
        event_handlers = [
            { focus global_fx_item_focus }
            { unfocus global_fx_item_unfocus }
            {pad_choose global_fx_control_panel_create params = (<items_common> [ <i> ])}
        ]
    }
    i = (<i> + 1)
    repeat <array_size>
    light_tool_anchor ::getsetoftags [
        items_game
        items_game_nocontrol
    ]
    if GotParam items_game
        light_tool_anchor ::settags items_game = <items_game>
        GetArraySize items_game
        i = 0
        begin 
        CreateScreenElement {
            type = TextElement
            parent = current_menu
            text = (<items_game> [ <i> ].text)
            font = small
            rgba = [ 88 105 112 128 ]
            Scale = 1
            event_handlers = [
                { focus global_fx_item_focus }
                { unfocus global_fx_item_unfocus }
                {pad_choose global_fx_control_panel_create params = (<items_game> [ <i> ])}
            ]
        }
        i = (<i> + 1)
        repeat <array_size>
    endif
    if GotParam items_game_nocontrol
        light_tool_anchor ::settags items_game_nocontrol = <items_game_nocontrol>
        GetArraySize items_game_nocontrol
        i = 0
        begin 
        CreateScreenElement {
            type = TextElement
            parent = current_menu
            text = (<items_game_nocontrol> [ <i> ].text)
            font = small
            rgba = [ 88 105 112 128 ]
            Scale = 1
            event_handlers = [
                { focus global_fx_item_focus }
                { unfocus global_fx_item_unfocus }
                {pad_choose (<items_game_nocontrol> [ <i> ].pad_choose_script)}
            ]
        }
        i = (<i> + 1)
        repeat <array_size>
    endif
    GetArraySize items_common_nocontrol
    i = 0
    begin 
    CreateScreenElement {
        type = TextElement
        parent = current_menu
        text = (<items_common_nocontrol> [ <i> ].text)
        font = small
        rgba = [ 88 105 112 128 ]
        Scale = 1
        event_handlers = [
            { focus global_fx_item_focus }
            { unfocus global_fx_item_unfocus }
            {pad_choose (<items_common_nocontrol> [ <i> ].pad_choose_script)}
        ]
    }
    i = (<i> + 1)
    repeat <array_size>
    FireEvent type = focus target = current_menu
endscript

script global_fx_find_structures_in_menu_category 
    if GotParam structure
        light_tool_anchor ::getsingletag structure_array
        light_tool_anchor ::getsingletag structure_array_valid
        if (<structure_array_valid> = 0)
            SetArrayElement arrayName = structure_array index = 0 newValue = <structure> resolveglobals = 0
            light_tool_anchor ::settags structure_array = <structure_array>
            light_tool_anchor ::settags structure_array_valid = 1
        else
            if NOT ArrayContains array = <structure_array> contains = <structure>
                AddArrayElement array = <structure_array> element = <structure>
                light_tool_anchor ::settags structure_array = <array>
            endif
        endif
    endif
endscript

script global_fx_menu_init_menu 
    SetScreenElementLock id = root_window Off
    CreateScreenElement {
        type = ContainerElement
        parent = root_window
        id = light_tool_anchor
        not_focusable
    }
    CreateScreenElement {
        type = vmenu
        parent = light_tool_anchor
        id = global_fx_tool_messages
        padding_scale = 0.8000
        font = dialog
        just = [ left top ]
        internal_just = [ left center ]
        Pos = (400.0, 265.0)
    }
    global_fx_tool_message text = 'wiat³o / Narzêdzie FX w³¹czone' id = light_menu_on_message rgba = [ 80 80 128 128 ] parent = light_tool_anchor Pos = (320.0, 420.0)
endscript

script global_fx_menu_init_globals 
    change \{ tod_manager_block_fakelight_updates = 1 }
    TODManager_AllowTempTOD \{ 0 }
    change \{current_lighttool_light_save = { light0_on = 1 light1_on = 1 }}
    refresh_current_tod_params
    global_fx_menu_archive_current_state \{ dest = current_lighttool_global_save_startup }
    global_light_fx_refresh_from_structures
endscript

script clear_light_tool_helper_menu 
    if ScreenElementExists \{ id = light_tool_helpers }
        DestroyScreenElement \{ id = light_tool_helpers }
    endif
    SetScreenElementLock \{ id = light_tool_anchor Off }
    CreateScreenElement \{type = vmenu parent = light_tool_anchor id = light_tool_helpers padding_scale = 0.8000 font = dialog just = [ left top ] internal_just = [ left center ] Pos = (400.0, 320.0)}
endscript

script global_light_fx_refresh_from_structures 
    global_fx_unlock_and_set_temp_tod \{ current_lighttool_params }
    SetScreenEffectsShadowVolumeParams \{ Shadow_Volume_Settings }
    SetScreenEffectsBlurParams \{ ZoomBlur_Settings }
    global_fx_set_noise \{ White_Noise_Settings }
    light_tool_anchor ::getsingletag \{ callback_refresh }
    if GotParam \{ callback_refresh }
        <callback_refresh>
    endif
    structure_control_menu_refresh
endscript

script global_fx_tool_message \{parent = global_fx_tool_messages rgba = [ 128 128 128 128 ] Pos = (320.0, 40.0)}
    SetScreenElementLock id = <parent> Off
    CreateScreenElement {
        type = TextElement
        parent = <parent>
        id = <id>
        font = small
        text = <text>
        Pos = <Pos>
        z_priority = 1000
        rgba = <rgba>
        Scale = 0.8000
    }
endscript

script global_fx_toggle_preview 
    save_toggle = Original
    light_tool_anchor ::getsingletag save_toggle
    if (<save_toggle> = Original)
        global_fx_tool_message text = 'Patrzenie na pocz¹tkowe wartoci.' id = light_menu_preview_message1 rgba = [ 128 80 80 128 ]
        global_fx_tool_message text = 'Zmiany nie zostan¹ zapisane!' id = light_menu_preview_message2 rgba = [ 128 80 80 128 ]
        global_fx_menu_archive_current_state dest = current_lighttool_global_save_modified
        global_fx_menu_archive_restore src = current_lighttool_global_save_startup
        light_tool_anchor ::settags save_toggle = modified
    else
        DestroyScreenElement id = light_menu_preview_message1
        DestroyScreenElement id = light_menu_preview_message2
        global_fx_menu_archive_restore src = current_lighttool_global_save_modified
        light_tool_anchor ::settags save_toggle = Original
    endif
    global_light_fx_refresh_from_structures
endscript

script global_fx_menu_archive_current_state \{ dest = my_global_structure }
    light_tool_anchor ::getsingletag \{ structure_array }
    light_tool_anchor ::getsingletag \{ structure_array_valid }
    GetArraySize \{ structure_array }
    i = 0
    begin 
    FormatText checksumname = entry 'save_entry_%i' i = <i>
    temp_structure = (<structure_array> [ <i> ])
    AddParam name = <entry> structure_name = save_params value = (<temp_structure>)
    i = (<i> + 1)
    repeat <array_size>
    change globalname = <dest> newValue = <save_params>
endscript

script global_fx_menu_archive_restore \{ src = my_global_structure }
    light_tool_anchor ::getsingletag \{ structure_array }
    light_tool_anchor ::getsingletag \{ structure_array_valid }
    GetArraySize \{ structure_array }
    i = 0
    begin 
    FormatText checksumname = entry 'save_entry_%i' i = <i>
    change globalname = (<structure_array> [ <i> ])newValue = (<src>.<entry>)
    i = (<i> + 1)
    repeat <array_size>
endscript

script global_light_fx_menu_hide 
    global_light_fx_print_current
    global_fx_menu_clear
    light_tool_anchor ::getsingletag \{ callback_hide }
    if GotParam \{ callback_hide }
        <callback_hide>
    endif
endscript

script global_light_fx_menu_hide_anchor 
    if ScreenElementExists \{ id = light_tool_anchor }
        light_tool_anchor ::DoMorph \{ alpha = 0 }
    endif
endscript

script global_light_fx_menu_show_anchor 
    if ScreenElementExists \{ id = light_tool_anchor }
        light_tool_anchor ::DoMorph \{ alpha = 1 }
    endif
endscript

script global_light_fx_print_current 
    printf '<------------------------------------------------------->'
    printf ''
    printf 'TOD_current='
    GlobalEffects_GetCurrentStateParams light_env = 0
    printstruct <global_effects_params> printstruct_insert_spaces_after_params = [5 8 11 17 21 26 33 40 45]
    printf ''
    printf 'Shadow Volume current='
    printstruct (Shadow_Volume_Settings)printstruct_insert_spaces_after_params = 1
    printf ''
    printf 'White Noise current='
    printstruct (White_Noise_Settings)printstruct_insert_spaces_after_params = 1
    printf ''
    printf 'ZoomBlur current='
    printstruct (ZoomBlur_Settings)
    printf ''
    light_tool_anchor ::getsingletag callback_print
    if GotParam callback_print
        <callback_print>
    endif
    printf ''
    printf '<------------------------------------------------------->'
endscript

script global_fx_write_current_values 
    GlobalEffects_GetCurrentStateParams \{ light_env = 0 }
    PrintStructToFile {
        file = 'Dumps/light_values.txt'
        label = 'current_lighting_values = '
        structure = {
            <global_effects_params>
            printstruct_insert_spaces_after_params = [5 8 11 17 21 26 33 40 45]
        }
    }
endscript

script global_fx_menu_clear 
    if ScreenElementExists \{ id = light_tool_vmenu }
        DestroyScreenElement \{ id = light_tool_vmenu }
    endif
    clear_light_tool_helper_menu
    show_directional_lights \{ Off }
endscript

script show_directional_lights 
    KillSpawnedScript \{ name = show_directional_lights_loop }
    if GotParam \{ Off }
        return 
    endif
    SpawnScriptLater \{ show_directional_lights_loop }
endscript

script show_directional_lights_loop 
    if NOT CutsceneFinished
        extra_params = { all_objects }
    endif
    begin 
    if ((current_lighttool_light_save.light0_on)= 1)
        DrawDirectionalLightLines heading = (current_lighttool_params.heading_0)pitch = (current_lighttool_params.pitch_0)r = 255 g = 0 b = 0 <extra_params>
    endif
    if ((current_lighttool_light_save.light1_on)= 1)
        DrawDirectionalLightLines heading = (current_lighttool_params.heading_1)pitch = (current_lighttool_params.pitch_1)r = 0 g = 0 b = 255 <extra_params>
    endif
    wait 1 gameframe
    repeat 
endscript

script toggle_light0 
    if (<light0_on> = 0)
        new_light_params = {
            red_0 = 0
            green_0 = 0
            blue_0 = 0
        }
        save_light_params = {
            light0 = {
                red_0 = (current_lighttool_params.red_0)
                green_0 = (current_lighttool_params.green_0)
                blue_0 = (current_lighttool_params.blue_0)
            }
        }
        change globalname = current_lighttool_light_save newValue = {(current_lighttool_light_save)<save_light_params>}
    else
        if StructureContains structure = (current_lighttool_light_save)light0
            new_light_params = {
                red_0 = (current_lighttool_light_save.light0.red_0)
                green_0 = (current_lighttool_light_save.light0.green_0)
                blue_0 = (current_lighttool_light_save.light0.blue_0)
            }
        endif
    endif
    change globalname = current_lighttool_params newValue = {(current_lighttool_params)<new_light_params>}
    global_light_fx_refresh_from_structures
endscript

script toggle_light1 
    if (<light1_on> = 0)
        new_light_params = {
            red_1 = 0
            green_1 = 0
            blue_1 = 0
        }
        save_light_params = {
            light1 = {
                red_1 = (current_lighttool_params.red_1)
                green_1 = (current_lighttool_params.green_1)
                blue_1 = (current_lighttool_params.blue_1)
            }
        }
        change globalname = current_lighttool_light_save newValue = {(current_lighttool_light_save)<save_light_params>}
    else
        if StructureContains structure = (current_lighttool_light_save)light1
            new_light_params = {
                red_1 = (current_lighttool_light_save.light1.red_1)
                green_1 = (current_lighttool_light_save.light1.green_1)
                blue_1 = (current_lighttool_light_save.light1.blue_1)
            }
        endif
    endif
    change globalname = current_lighttool_params newValue = {(current_lighttool_params)<new_light_params>}
    global_light_fx_refresh_from_structures
endscript

script update_light_dir_and_apply 
    show_directional_lights
    global_fx_unlock_and_set_temp_tod <...> 
endscript

script refresh_current_tod_params 
    GlobalEffects_GetCurrentStateParams \{ light_env = 0 }
    change current_lighttool_params = <global_effects_params>
endscript

script global_fx_add_menu_item 
    CreateScreenElement {
        type = TextElement
        parent = current_menu
        text = <text>
        font = small
        rgba = [ 88 105 112 128 ]
        Scale = 1
        event_handlers = [
            { focus global_fx_item_focus }
            { unfocus global_fx_item_unfocus }
            {pad_choose <pad_choose_script> params = <...> }
        ]
    }
endscript

script global_fx_item_focus 
    GetProps
    settags old_rgba = <rgba>
    setprops \{rgba = [ 127 102 0 100 ]}
endscript

script global_fx_item_unfocus \{old_rgba = [ 88 105 112 128 ]}
    getsingletag \{ old_rgba }
    setprops rgba = <old_rgba>
endscript

script global_fx_control_panel_create tool_index = 0
    global_fx_menu_clear
    FormatText checksumname = saved_tool_index_name 'category_%i_index' i = <text>
    tool_index_saves = {}
    light_tool_anchor ::getsingletag tool_index_saves
    if NOT GotParam Cycle
        if StructureContains structure = tool_index_saves <saved_tool_index_name>
            tool_index = (<tool_index_saves>.<saved_tool_index_name>)
        endif
    endif
    AddParam name = <saved_tool_index_name> structure_name = tool_index_saves value = <tool_index>
    light_tool_anchor ::settags tool_index_saves = <tool_index_saves>
    structure_control_menu_create {
        parent = light_tool_anchor
        run_callback_on_create = 1
        index_item_labels = [ 'R' 'G' 'B' 'A' ]
        vmenu_id = light_tool_vmenu
        (<control_items> [ <tool_index> ])
        pad_back_script = global_light_fx_menu_create
    }
    GetArraySize control_items
    if (<array_size> > 1)
        SetScreenElementProps {
            id = current_menu
            event_handlers = [
                {pad_l1 cycle_current_lighttool_submenu params = {left control_items = <control_items> tool_index = <tool_index> text = <text>}}
                {pad_r1 cycle_current_lighttool_submenu params = {RIGHT control_items = <control_items> tool_index = <tool_index> text = <text>}}
            ]
            replace_handlers
        }
        global_fx_tool_message text = '\ma / \mb: Cycle category' parent = light_tool_helpers
    endif
    global_fx_tool_message text = '\m0: Toggle step (1,10)' parent = light_tool_helpers
    global_fx_tool_message text = '\m3: Toggle color links' parent = light_tool_helpers
    global_fx_add_generic_handlers
endscript

script global_fx_add_generic_handlers 
    light_tool_anchor ::getsingletag \{ buttons_common }
    light_tool_anchor ::getsingletag \{ buttons_game }
    if GotParam \{ buttons_common }
        ForEachIn <buttons_common> do = global_fx_add_callback_handler
    endif
    if GotParam \{ buttons_game }
        ForEachIn <buttons_game> do = global_fx_add_callback_handler
    endif
endscript

script global_fx_add_callback_handler 
    SetScreenElementProps {
        id = current_menu
        event_handlers = [
            { <binding> <callback> }
        ]
        replace_handlers
    }
    global_fx_tool_message text = <text> parent = light_tool_helpers
endscript

script cycle_current_lighttool_submenu 
    GetArraySize control_items
    if GotParam left
        tool_index = (<tool_index> -1)
        if (<tool_index> < 0)
            tool_index = (<array_size> -1)
        endif
    endif
    if GotParam RIGHT
        tool_index = (<tool_index> + 1)
        if NOT (<tool_index> < <array_size>)
            tool_index = 0
        endif
    endif
    if StructureContains structure = (<control_items> [ <tool_index> ])xenon_only
        if NOT IsXenon
            cycle_current_lighttool_submenu <...> 
            return 
        endif
    endif
    global_fx_control_panel_create control_items = <control_items> tool_index = <tool_index> text = <text> Cycle
endscript

script global_fx_toggle_focus light_menu = light_tool_vmenu
    if GotParam on
        FireEvent type = focus target = light_tool_vmenu
        DestroyScreenElement id = light_menu_focus_message
        SetScreenElementProps {
            id = root_window
            event_handlers = [{pad_r2 null_script params = {}}]
            replace_handlers
        }
    else
        FireEvent type = unfocus target = light_tool_vmenu
        global_fx_tool_message text = 'Narzêdzie nie jest ustawione!' id = light_menu_focus_message rgba = [ 128 80 80 128 ]
        SetScreenElementProps {
            id = root_window
            event_handlers = [{pad_r2 global_fx_toggle_focus params = { on }}]
        }
    endif
endscript

script global_light_fx_restore_original_tod_and_quit 
    SetButtonEventMappings \{ block_menu_input }
    change \{ tod_manager_block_fakelight_updates = 0 }
    global_fx_menu_archive_restore \{ src = current_lighttool_global_save_startup }
    global_light_fx_refresh_from_structures
    light_tool_anchor ::getsingletag \{ callback_quit }
    if GotParam \{ callback_quit }
        <callback_quit>
    endif
    TODManager_AllowTempTOD \{ 1 }
    global_light_fx_menu_hide
    DestroyScreenElement \{ id = light_tool_anchor }
    SetButtonEventMappings \{ unblock_menu_input }
endscript

script global_fx_unlock_and_set_temp_tod 
    TODManager_AllowTempTOD \{ 1 }
    TODManager_SetTempTOD <...> 
    TODManager_AllowTempTOD \{ 0 }
endscript

script global_fx_set_noise 
    if (<on> = 1)
        SetScreenEffectsNoiseParams <...> 
    else
        SetScreenEffectsNoiseParams \{ on = 0 }
    endif
endscript

script global_fx_toggle_shadows 
    if (<shadows_on> = 1)
        change {
            globalname = current_lighttool_shadow_save
            newValue = {
                (current_lighttool_shadow_save)
                shadows_on = 0
            }
        }
    else
        change {
            globalname = current_lighttool_shadow_save
            newValue = {
                (current_lighttool_shadow_save)
                shadows_on = 1
            }
        }
    endif
    toggle_shadows
    global_light_fx_refresh_from_structures
endscript

script toggle_shadows 
    if ((current_lighttool_shadow_save.shadows_on)= 1)
        intensity = 0
        change {
            globalname = current_lighttool_shadow_save
            newValue = {
                intensity = (Shadow_Volume_Settings.intensity)
                shadows_on = 0
            }
        }
    else
        intensity = (current_lighttool_shadow_save.intensity)
        change {
            globalname = current_lighttool_shadow_save
            newValue = {
                shadows_on = 1
            }
        }
    endif
    change globalname = Shadow_Volume_Settings newValue = {(Shadow_Volume_Settings)intensity = <intensity>}
    SetScreenEffectsShadowVolumeParams Shadow_Volume_Settings
endscript

script global_fx_zoomblur_clear 
    SetScreenEffectsBlurParams \{ amount = 0 }
    wait \{ 5 gameframes }
    SetScreenEffectsBlurParams (ZoomBlur_Settings)
endscript
