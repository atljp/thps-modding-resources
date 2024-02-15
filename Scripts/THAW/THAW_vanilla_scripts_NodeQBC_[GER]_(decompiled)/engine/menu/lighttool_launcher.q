Shadow_Volume_Settings = {
    intensity = 0.3000
    type = modulate
    softness = 0.5000
    color = [ 0 0 0 ]
}
White_Noise_Settings = {
    on = 0
    intensity = 20
    color = [ 128 128 128 ]
}
ZoomBlur_Settings = {
    focus_center = [ 0.5000 0.5000 ]
    scales = [ 1.500 0.0 ]
    angles = [ 0.0 0.0 ]
    inner_color = [ 0.0 0.0 0.0 ]
    inner_alpha = 0.0
    outer_color = [ 1.0 1.0 1.0 ]
    outer_alpha = 0.0
}
ShaderOverrideSettings = {
    override_static = 0
    override_skinned = 0
    override_normalmapped = 0
    override_envmapped = 0
    override_uvwibble = 0
    override_pass = 0
    override_shader = 0
}

script lighttool_create 
    if SkaterCamAnimFinished
        if ((view_mode)= 0)
            UnPauseGame
            MakeSkaterGoto freezeskater
            pause_menu_gradient Off
            hide_all_hud_items
            kill_start_key_binding
        endif
    endif
    SetAnalogStickActiveForMenus 0
    if NOT ScreenElementExists id = light_tool_anchor
        cutscene_deactivate_tod_manager
    endif
    global_light_fx_menu_create {
        callback_hide = lighttool_hide
        callback_quit = lighttool_quit
        buttons_game = [
            {
                binding = pad_l2
                callback = cycle_current_lighttool_tod
                text = '\mf: Advance TOD'
            }
        ]
    }
endscript

script viewer_toggle_global_light_fx_menu 
    if ScreenElementExists \{ id = light_tool_vmenu }
        global_light_fx_menu_hide
    else
        lighttool_create
    endif
endscript

script debug_launch_global_light_fx_menu 
    if ScreenElementExists \{ id = current_menu_anchor }
        DestroyScreenElement \{ id = current_menu_anchor }
    endif
    if ScreenElementExists \{ id = DEBUG_MENU }
        DestroyScreenElement \{ id = DEBUG_MENU }
    endif
    lighttool_create
endscript

script lighttool_hide 
    SetAnalogStickActiveForMenus \{ 1 }
    if NOT SkaterCamAnimFinished
        return 
    endif
    if (view_mode)
        return 
    endif
    MakeSkaterGoto \{ ongroundai }
    show_all_hud_items
    restore_start_key_binding
endscript

script lighttool_quit 
    cutscene_reactivate_tod_manager
    TODManager_AllowTempTOD \{ 1 }
    TODManager_RestoreCurrentTOD
    wait \{ 15 gameframes }
endscript

script cycle_current_lighttool_tod 
    SetButtonEventMappings \{ block_menu_input }
    change \{ tod_manager_block_fakelight_updates = 0 }
    TODManager_AllowTempTOD \{ 1 }
    TODManager_RestoreCurrentTOD
    wait \{ 15 gameframes }
    TODManager_AdvanceTODState
    TODManager_AllowTempTOD \{ 0 }
    wait \{ 15 gameframes }
    change \{ tod_manager_block_fakelight_updates = 1 }
    refresh_current_tod_params
    global_fx_unlock_and_set_temp_tod \{ current_lighttool_params }
    global_light_fx_refresh_from_structures
    SetButtonEventMappings \{ unblock_menu_input }
endscript
