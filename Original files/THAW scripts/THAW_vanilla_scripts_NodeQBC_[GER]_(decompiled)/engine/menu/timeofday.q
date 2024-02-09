
script launch_timeofday_menu 
    if ObjectExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    make_new_menu {
        menu_id = timeofday_menu
        vmenu_id = timeofday_vmenu
        menu_title = 'TIME OF DAY'
        type = vmenu
        dims = (200.0, 200.0)
        padding_scale = 1.100
        Pos = (510.0, 350.0)
    }
    SetScreenElementProps {
        id = timeofday_menu
        event_handlers = [
            { pad_back create_debug_menu }
        ]
    }
    make_text_sub_menu_item text = 'Cycle on' id = tod_cycle_on pad_choose_script = toggle_tod_manager_active pad_choose_params = { active = 1 }
    make_text_sub_menu_item text = 'Cycle off' id = tod_cycle_off pad_choose_script = toggle_tod_manager_active pad_choose_params = { active = 0 }
    make_text_sub_menu_item text = 'Quick Cycle on' id = tod_quick_cycle_on pad_choose_script = tod_menu_set_quick_cycle pad_choose_params = { mult = 9 }
    make_text_sub_menu_item text = 'Quick Cycle off' id = tod_quick_cycle_off pad_choose_script = tod_menu_set_quick_cycle pad_choose_params = { mult = 1 }
    make_text_sub_menu_item text = 'Advance TOD State' id = tod_advance pad_choose_script = tod_menu_advance_state
    make_text_sub_menu_item text = 'Morning' id = tod_morn pad_choose_script = tod_menu_set_instant pad_choose_params = { tod_state = Morning }
    make_text_sub_menu_item text = 'Day' id = tod_day pad_choose_script = tod_menu_set_instant pad_choose_params = { tod_state = Afternoon }
    make_text_sub_menu_item text = 'Evening' id = tod_even pad_choose_script = tod_menu_set_instant pad_choose_params = { tod_state = Evening }
    make_text_sub_menu_item text = 'Night' id = tod_night pad_choose_script = tod_menu_set_instant pad_choose_params = { tod_state = Night }
    set_sub_bg Pos = (320.0, 54.0)
    RunScriptOnScreenElement id = current_menu_anchor animate_in params = { final_pos = (320.0, 134.0) }
endscript

script toggle_tod_manager_active 
    TODManager_SetActive <active>
endscript

script tod_menu_set_quick_cycle 
    TODManager_SetActive \{ 1 }
    TODManager_SetTimeMultiplier <mult>
    exit_pause_menu
endscript

script tod_menu_set_instant 
    UnPauseGame
    TODManager_SetTODInstant <tod_state>
    exit_pause_menu
endscript

script tod_menu_advance_state 
    TODManager_AdvanceTODState
    exit_pause_menu
endscript
