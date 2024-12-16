
SCRIPT launch_timeofday_menu 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	make_new_menu { 
		menu_id = timeofday_menu 
		vmenu_id = timeofday_vmenu 
		menu_title = "TIME OF DAY" 
		type = VMenu 
		dims = PAIR(200.00000000000, 200.00000000000) 
		padding_scale = 1.10000002384 
		pos = PAIR(210.00000000000, 50.00000000000) 
	} 
	SetScreenElementProps { 
		id = timeofday_menu 
		event_handlers = [ 
			{ pad_back create_debug_menu } 
		] 
	} 
	make_text_sub_menu_item text = "Cycle on" id = tod_cycle_on pad_choose_script = toggle_tod_manager_active pad_choose_params = { active = 1 } 
	make_text_sub_menu_item text = "Cycle off" id = tod_cycle_off pad_choose_script = toggle_tod_manager_active pad_choose_params = { active = 0 } 
	make_text_sub_menu_item text = "Quick Cycle on" id = tod_quick_cycle_on pad_choose_script = tod_menu_set_quick_cycle pad_choose_params = { mult = 9 } 
	make_text_sub_menu_item text = "Quick Cycle off" id = tod_quick_cycle_off pad_choose_script = tod_menu_set_quick_cycle pad_choose_params = { mult = 1 } 
	make_text_sub_menu_item text = "Advance TOD State" id = tod_advance pad_choose_script = tod_menu_advance_state 
	make_text_sub_menu_item text = "Morning" id = tod_morn pad_choose_script = tod_menu_set_instant pad_choose_params = { tod_state = morning } 
	make_text_sub_menu_item text = "Day" id = tod_day pad_choose_script = tod_menu_set_instant pad_choose_params = { tod_state = afternoon } 
	make_text_sub_menu_item text = "Evening" id = tod_even pad_choose_script = tod_menu_set_instant pad_choose_params = { tod_state = evening } 
	make_text_sub_menu_item text = "Night" id = tod_night pad_choose_script = tod_menu_set_instant pad_choose_params = { tod_state = night } 
	set_sub_bg pos = PAIR(320.00000000000, 54.00000000000) 
	RunScriptOnScreenElement id = current_menu_anchor animate_in params = { final_pos = PAIR(320.00000000000, 134.00000000000) } 
ENDSCRIPT

SCRIPT toggle_tod_manager_active 
	TODManager_SetActive <active> 
ENDSCRIPT

SCRIPT tod_menu_set_quick_cycle 
	TODManager_SetActive 1 
	TODManager_SetTimeMultiplier <mult> 
	exit_pause_menu 
ENDSCRIPT

SCRIPT tod_menu_set_instant 
	UnPauseGame 
	TODManager_SetTODInstant <tod_state> 
	exit_pause_menu 
ENDSCRIPT

SCRIPT tod_menu_advance_state 
	TODManager_AdvanceTODState 
	exit_pause_menu 
ENDSCRIPT


