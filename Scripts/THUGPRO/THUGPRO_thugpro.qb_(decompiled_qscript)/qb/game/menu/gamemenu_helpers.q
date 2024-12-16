
lens_flare_visible_before_pause = 1 
SCRIPT handle_pause_continue 
	root_window : GetTags 
	IF GotParam pause_controller 
		IF NOT ( <pause_controller> = <device_num> ) 
			RETURN 
		ENDIF 
	ENDIF 
	exit_pause_menu 
ENDSCRIPT

is_changing_levels = 0 
SCRIPT handle_start_pressed 
	root_window : GetTags 
	IF NOT ( thugpro_observe_hud_visible ) 
		change thugpro_observe_hud_visible = 0 
		thugpro_observe_toggle_hud 
		change thugpro_observe_hud_visible = 1 
	ENDIF 
	IF ( is_changing_levels = 1 ) 
		RETURN 
	ENDIF 
	IF LevelIs Load_MainMenu 
		RETURN 
	ENDIF 
	IF InNetGame 
		THUGPROResetViewer 
	ELSE 
		THUGPROResetViewer unfreeze 
	ENDIF 
	IF ChecksumEquals a = <menu_state> b = on 
		IF GotParam pause_controller 
			IF NOT ( <pause_controller> = -1 ) 
				IF NOT ( <device_num> = <pause_controller> ) 
					RETURN 
				ENDIF 
			ENDIF 
		ENDIF 
		IF NOT InNetGame 
			UnpauseGame 
		ENDIF 
		exit_pause_menu 
		change inside_pause = 0 
	ENDIF 
	IF ChecksumEquals a = <menu_state> b = off 
		change viewer_buttons_enabled = 0 
		IF NOT InMultiPlayerGame 
			IF NOT ControllerBoundToSkater controller = <device_num> skater = 0 
				RETURN 
			ENDIF 
		ELSE 
			IF InSplitScreenGame 
				IF NOT ControllerBoundToSkater controller = <device_num> skater = 0 
					IF NOT ControllerBoundToSkater controller = <device_num> skater = 1 
						RETURN 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
		SetTags pause_controller = <device_num> 
		possibly_remove_temp_special_trick 
		KillSpawnedScript name = goal_accept_trigger 
		IF NOT InNetGame 
			GetSkaterId 
			IF GetSkaterCamAnimParams skater = <objId> 
				IF ( <allow_pause> = 0 ) 
					RETURN 
				ENDIF 
			ENDIF 
			printf "-------------------- PAUSING GAME ----------------------" 
			PauseGame 
			GoalManager_PauseAllGoals 
			wait 1 gameframe 
		ENDIF 
		set_pause_menu_allow_continue 
		create_pause_menu device_num = <device_num> from_start 
	ENDIF 
ENDSCRIPT

SCRIPT set_pause_menu_allow_continue 
	IF GotParam off 
		root_window : SetTags no_exit_pause_menu = 1 
	ELSE 
		root_window : RemoveTags tags = [ no_exit_pause_menu ] 
	ENDIF 
ENDSCRIPT

SCRIPT set_custom_restart 
	IF ( view_mode = 0 ) 
		skater : SetCustomRestart Set 
	ENDIF 
ENDSCRIPT

SCRIPT skip_to_custom_restart 
	IF ( view_mode = 0 ) 
		skater : SkipToCustomRestart 
	ENDIF 
ENDSCRIPT

SCRIPT set_sub_bg { parent = current_menu_anchor 
		pos = PAIR(326.00000000000, 115.00000000000) 
		scale = PAIR(1.16999995708, 1.10000002384) 
		just = [ center top ] 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <parent> 
		texture = options_bg 
		draw_behind_parent 
		pos = <pos> 
		scale = <scale> 
		just = <just> 
		rgba = [ 128 128 128 128 ] 
		z_priority = 1 
	} 
ENDSCRIPT

SCRIPT hide_everything 
	DoScreenElementMorph id = root_window time = 0 scale = 0 
ENDSCRIPT

SCRIPT unhide_everything 
	DoScreenElementMorph id = root_window time = 0 scale = 1 
ENDSCRIPT

SCRIPT hide_all_hud_items 
	dialog_box_exit no_pad_start <...> 
	IF ScreenElementExists id = console_message_vmenu 
		DoScreenElementMorph id = console_message_vmenu time = 0 scale = 0 
	ENDIF 
	IF ScreenElementExists id = first_time_goal_info 
		DestroyScreenElement id = first_time_goal_info 
	ENDIF 
	IF ScreenElementExists id = cutscene_camera_hud_anchor 
		change camera_hud_is_hidden = 1 
		DoScreenElementMorph id = cutscene_camera_hud_anchor alpha = 0 
	ENDIF 
	IF ScreenElementExists id = nightvision_hud_anchor 
		change nightvision_hud_is_hidden = 1 
		DoScreenElementMorph id = nightvision_hud_anchor alpha = 0 
	ENDIF 
	IF ScreenElementExists id = the_time 
		SetScreenElementProps id = the_time hide 
	ENDIF 
	IF NOT GotParam ignore_speech_boxes 
		hide_speech_boxes 
	ENDIF 
	IF ScreenElementExists id = digital_timer_anchor 
		SetScreenElementProps id = digital_timer_anchor hide 
	ENDIF 
	IF ScreenElementExists id = new_ammo_message 
		DestroyScreenElement id = new_ammo_message 
	ENDIF 
	IF ScreenElementExists id = new_ammo_message2 
		DestroyScreenElement id = new_ammo_message2 
	ENDIF 
	hide_panel_messages 
	menu3d_hide 
	pause_special_meter 
	pause_balance_meter 
	pause_run_timer 
	hide_goal_panel_messages 
	GoalManager_HideGoalPoints 
	GoalManager_HidePoints 
	hide_3d_goal_arrow 
	hide_landing_msg 
	hide_console_window 
	goal_skate_hide_letters 
	hide_combo_letters 
	hide_net_scores 
	hide_stat_message 
	MaybeHideLensFlare 
	IF NOT LevelIs Load_MainMenu 
		IF NOT InMultiPlayerGame 
			change lens_flare_visible_before_pause = ( DoUpdateLensFlare ) 
			change DoUpdateLensFlare = 0 
		ENDIF 
	ENDIF 
	hide_tips 
	pause_trick_text 
	hide_death_msg 
	GoalListReminderHide 
	TantrumMessageHide 
	IF NOT GotParam dont_disable_screen_effects 
		pause_bloom_off 
	ENDIF 
	kill_blur 
ENDSCRIPT

SCRIPT show_all_hud_items 
	show_panel_messages 
	GoalManager_ShowGoalPoints 
	GoalManager_ShowPoints 
	unhide_3d_goal_arrow 
	unhide_landing_msg 
	unhide_stat_message 
	unhide_tips 
	goal_skate_unhide_letters 
	unhide_combo_letters 
	unhide_death_msg 
	GoalListReminderShow 
	TantrumMessageShow 
	unpause_trick_text 
	IF NOT InNetGame 
		unpause_trick_text 
	ENDIF 
	unpause_special_meter 
	Unpause_Balance_Meter 
	unpause_run_timer 
	pause_bloom_on 
	unhide_speech_boxes 
	IF ScreenElementExists id = cutscene_camera_hud_anchor 
		IF ( camera_hud_is_hidden = 1 ) 
			change camera_hud_is_hidden = 0 
			DoScreenElementMorph id = cutscene_camera_hud_anchor alpha = 1 
		ENDIF 
	ENDIF 
	IF ScreenElementExists id = nightvision_hud_anchor 
		IF ( nightvision_hud_is_hidden = 1 ) 
			change nightvision_hud_is_hidden = 0 
			DoScreenElementMorph id = nightvision_hud_anchor alpha = 1 
		ENDIF 
	ENDIF 
	IF ScreenElementExists id = the_time 
		SetScreenElementProps id = the_time unhide 
	ENDIF 
	IF ScreenElementExists id = digital_timer_anchor 
		SetScreenElementProps id = digital_timer_anchor unhide 
	ENDIF 
	show_goal_panel_messages 
	IF NOT LevelIs Load_MainMenu 
		IF NOT InMultiPlayerGame 
			change DoUpdateLensFlare = 1 
			UnHideLensFlare 
		ENDIF 
	ENDIF 
	IF NOT InMultiPlayerGame 
		GoalManager_ShowPoints 
		IF NOT GoalManager_HasActiveGoals 
			GoalManager_ShowGoalPoints 
		ELSE 
			GoalManager_HideGoalPoints 
		ENDIF 
	ENDIF 
	IF ObjectExists id = console_message_vmenu 
		DoScreenElementMorph id = console_message_vmenu time = 0 scale = 1 
	ENDIF 
	IF ( HIDEHUD = 1 ) 
		printf "hiding" 
		hide_root_window 
	ENDIF 
	IF GetGlobalFlag flag = NO_DISPLAY_HUD 
		GoalManager_HideGoalPoints 
		GoalManager_HidePoints 
	ENDIF 
	IF NOT GetGlobalFlag flag = NO_DISPLAY_CHATWINDOW 
		unhide_console_window 
	ELSE 
		hide_console_window 
	ENDIF 
	IF NOT GetGlobalFlag flag = NO_DISPLAY_NET_SCORES 
		unhide_net_scores 
	ELSE 
		hide_net_scores 
	ENDIF 
ENDSCRIPT

SCRIPT hide_speech_boxes 
	IF ScreenElementExists id = speech_box_anchor 
		SetScreenElementProps id = speech_box_anchor block_events 
		DoScreenElementMorph id = speech_box_anchor scale = 0 relative_scale 
	ENDIF 
	IF ScreenElementExists id = goal_start_dialog 
		SetScreenElementProps id = goal_start_dialog block_events 
		DoScreenElementMorph id = goal_start_dialog scale = 0 relative_scale 
	ENDIF 
	IF ScreenElementExists id = ped_speech_dialog 
		SetScreenElementProps id = ped_speech_dialog block_events 
		DoScreenElementMorph id = ped_speech_dialog scale = 0 relative_scale 
	ENDIF 
	IF ScreenElementExists id = goal_retry_anchor 
		SetScreenElementProps id = goal_retry_anchor block_events 
		DoScreenElementMorph id = goal_retry_anchor scale = 0 relative_scale 
	ENDIF 
	IF ScreenElementExists id = ped_hint_dialog 
		SetScreenElementProps id = ped_hint_dialog block_events 
		DoScreenElementMorph id = ped_hint_dialog scale = 0 relative_scale 
	ENDIF 
ENDSCRIPT

SCRIPT unhide_speech_boxes 
	IF ScreenElementExists id = speech_box_anchor 
		SetScreenElementProps id = speech_box_anchor unblock_events 
		DoScreenElementMorph id = speech_box_anchor scale = 1 relative_scale 
	ENDIF 
	IF ScreenElementExists id = goal_start_dialog 
		SetScreenElementProps id = goal_start_dialog unblock_events 
		DoScreenElementMorph id = goal_start_dialog scale = 1 relative_scale 
	ENDIF 
	IF ScreenElementExists id = ped_speech_dialog 
		SetScreenElementProps id = ped_speech_dialog unblock_events 
		DoScreenElementMorph id = ped_speech_dialog scale = 1 relative_scale 
	ENDIF 
	IF ScreenElementExists id = goal_retry_anchor 
		SetScreenElementProps id = goal_retry_anchor unblock_events 
		DoScreenElementMorph id = goal_retry_anchor scale = 1 relative_scale 
	ENDIF 
	IF ScreenElementExists id = ped_hint_dialog 
		SetScreenElementProps id = ped_hint_dialog block_events 
		DoScreenElementMorph id = ped_hint_dialog scale = 1 relative_scale 
	ENDIF 
ENDSCRIPT

SCRIPT kill_speech_boxes 
	IF ScreenElementExists id = speech_box_anchor 
		DestroyScreenElement id = speech_box_anchor 
	ENDIF 
	IF ScreenElementExists id = goal_start_dialog 
		DestroyScreenElement id = goal_start_dialog 
	ENDIF 
	IF ScreenElementExists id = ped_speech_dialog 
		DestroyScreenElement id = ped_speech_dialog 
	ENDIF 
	IF ScreenElementExists id = goal_retry_anchor 
		DestroyScreenElement id = goal_retry_anchor 
	ENDIF 
	IF ScreenElementExists id = ped_hint_dialog 
		DestroyScreenElement id = ped_hint_dialog 
	ENDIF 
ENDSCRIPT

SCRIPT hide_landing_msg 
	IF ObjectExists id = perfect 
		DoScreenElementMorph id = perfect time = 0 alpha = 0 
	ENDIF 
	IF ObjectExists id = perfect2 
		DoScreenElementMorph id = perfect2 time = 0 alpha = 0 
	ENDIF 
ENDSCRIPT

SCRIPT unhide_landing_msg 
	IF ObjectExists id = perfect 
		DoScreenElementMorph id = perfect time = 0 alpha = 0.50000000000 
	ENDIF 
	IF ObjectExists id = perfect2 
		DoScreenElementMorph id = perfect2 time = 0 alpha = 0.50000000000 
	ENDIF 
ENDSCRIPT

SCRIPT hide_3d_goal_arrow 
	IF ScreenElementExists id = DesignerCreated_3DArrowPointer 
		DoScreenElementMorph id = DesignerCreated_3DArrowPointer pos = PAIR(320.00000000000, -300.00000000000) 
	ENDIF 
	IF ScreenElementExists id = race_arrow 
		DoScreenElementMorph id = race_arrow pos = PAIR(320.00000000000, -300.00000000000) 
	ENDIF 
	IF ScreenElementExists id = ctf_arrow 
		DoScreenElementMorph id = ctf_arrow pos = PAIR(320.00000000000, -300.00000000000) 
	ENDIF 
ENDSCRIPT

SCRIPT unhide_3d_goal_arrow 
	IF ScreenElementExists id = DesignerCreated_3DArrowPointer 
		DoScreenElementMorph id = DesignerCreated_3DArrowPointer pos = PAIR(320.00000000000, 70.00000000000) 
	ENDIF 
	IF ScreenElementExists id = race_arrow 
		DoScreenElementMorph id = race_arrow pos = PAIR(320.00000000000, 70.00000000000) 
	ENDIF 
	IF ScreenElementExists id = ctf_arrow 
		DoScreenElementMorph id = ctf_arrow pos = PAIR(320.00000000000, 70.00000000000) 
	ENDIF 
ENDSCRIPT

SCRIPT hide_net_scores 
	IF ObjectExists id = net_score_1 
		DoScreenElementMorph id = net_score_1 time = 0 scale = 0 
	ENDIF 
	IF ObjectExists id = net_score_2 
		DoScreenElementMorph id = net_score_2 time = 0 scale = 0 
	ENDIF 
	IF ObjectExists id = net_score_3 
		DoScreenElementMorph id = net_score_3 time = 0 scale = 0 
	ENDIF 
	IF ObjectExists id = net_score_4 
		DoScreenElementMorph id = net_score_4 time = 0 scale = 0 
	ENDIF 
	IF ObjectExists id = net_score_5 
		DoScreenElementMorph id = net_score_5 time = 0 scale = 0 
	ENDIF 
	IF ObjectExists id = net_score_6 
		DoScreenElementMorph id = net_score_6 time = 0 scale = 0 
	ENDIF 
	IF ObjectExists id = net_score_7 
		DoScreenElementMorph id = net_score_7 time = 0 scale = 0 
	ENDIF 
	IF ObjectExists id = net_score_8 
		DoScreenElementMorph id = net_score_8 time = 0 scale = 0 
	ENDIF 
ENDSCRIPT

SCRIPT unhide_net_scores 
	IF ObjectExists id = net_score_1 
		DoScreenElementMorph id = net_score_1 time = 0 scale = 0.89999997616 
	ENDIF 
	IF ObjectExists id = net_score_2 
		DoScreenElementMorph id = net_score_2 time = 0 scale = 0.89999997616 
	ENDIF 
	IF ObjectExists id = net_score_3 
		DoScreenElementMorph id = net_score_3 time = 0 scale = 0.89999997616 
	ENDIF 
	IF ObjectExists id = net_score_4 
		DoScreenElementMorph id = net_score_4 time = 0 scale = 0.89999997616 
	ENDIF 
	IF ObjectExists id = net_score_5 
		DoScreenElementMorph id = net_score_5 time = 0 scale = 0.89999997616 
	ENDIF 
	IF ObjectExists id = net_score_6 
		DoScreenElementMorph id = net_score_6 time = 0 scale = 0.89999997616 
	ENDIF 
	IF ObjectExists id = net_score_7 
		DoScreenElementMorph id = net_score_7 time = 0 scale = 0.89999997616 
	ENDIF 
	IF ObjectExists id = net_score_8 
		DoScreenElementMorph id = net_score_8 time = 0 scale = 0.89999997616 
	ENDIF 
ENDSCRIPT

SCRIPT hide_current_goal 
	IF ObjectExists id = current_goal 
		DoScreenElementMorph id = current_goal time = 0 scale = 0 
	ENDIF 
	IF ObjectExists id = sc_goal_text 
		DoScreenElementMorph id = sc_goal_text time = 0 scale = 0 
	ENDIF 
	IF ObjectExists id = Eric_score 
		DoScreenElementMorph id = Eric_score time = 0 scale = 0 
	ENDIF 
	hide_key_combo_text 
ENDSCRIPT

comp_texts = [ Eric_Text Ron_Text Johnny_Text Chicken_Text Raven_Text final_scores goal_comp_out_of_bounds_warning ] 
SCRIPT hide_comp_text 
	GetArraySize comp_texts 
	<index> = 0 
	BEGIN 
		<id> = ( comp_texts [ <index> ] ) 
		IF ObjectExists id = <id> 
			DoScreenElementMorph id = <id> time = 0 scale = 0 
		ENDIF 
		<index> = ( <index> + 1 ) 
	REPEAT <array_size> 
ENDSCRIPT

SCRIPT unhide_comp_text 
	GetArraySize comp_texts 
	<index> = 0 
	BEGIN 
		<id> = ( comp_texts [ <index> ] ) 
		IF ObjectExists id = <id> 
			DoScreenElementMorph id = <id> time = 0 scale = 1 
		ENDIF 
		<index> = ( <index> + 1 ) 
	REPEAT <array_size> 
ENDSCRIPT

SCRIPT unhide_current_goal 
	IF ObjectExists id = current_goal 
		DoScreenElementMorph id = current_goal time = 0 scale = 1.00000000000 relative_scale 
	ENDIF 
	IF ObjectExists id = mp_goal_text 
		DoScreenElementMorph id = mp_goal_text time = 0 scale = 1.00000000000 relative_scale 
	ENDIF 
	IF ObjectExists id = sc_goal_text 
		DoScreenElementMorph id = sc_goal_text time = 0 scale = 1.00000000000 relative_scale 
	ENDIF 
	IF ObjectExists id = Eric_score 
		DoScreenElementMorph id = Eric_score time = 0 scale = 1.00000000000 relative_scale 
	ENDIF 
	unhide_key_combo_text 
ENDSCRIPT

SCRIPT hide_death_msg 
	IF ObjectExists id = death_message 
		DoScreenElementMorph id = death_message time = 0 scale = 0 relative_scale 
	ENDIF 
ENDSCRIPT

SCRIPT unhide_death_msg 
	IF ObjectExists id = death_message 
		DoScreenElementMorph id = death_message time = 0 scale = 1 relative_scale 
	ENDIF 
ENDSCRIPT

SCRIPT hide_tips 
	IF ObjectExists id = skater_hint 
		DoScreenElementMorph id = skater_hint time = 0 pos = PAIR(320.00000000000, 11050.00000000000) 
	ENDIF 
ENDSCRIPT

SCRIPT unhide_tips 
	IF ObjectExists id = skater_hint 
		DoScreenElementMorph id = skater_hint time = 0 pos = PAIR(320.00000000000, 150.00000000000) 
	ENDIF 
ENDSCRIPT

SCRIPT pause_rain 
	IF IsSoundPlaying TestLight01 
		change Paused_Light_Rain = 1 
	ENDIF 
	IF IsSoundPlaying TestMedium02 
		change Paused_Heavy_Rain = 1 
	ENDIF 
ENDSCRIPT

SCRIPT unpause_rain 
	IF NOT LevelIs Load_MainMenu 
		IF ( Paused_Light_Rain = 1 ) 
			IF IsSoundPlaying TestLight01 
				IF NOT GotParam dont_unpause_rain_sounds 
					IF ( Inside_Light_Rain = 1 ) 
						SetSoundParams TestLight01 vol = ( LightRainVolume * 0.10000000149 ) 
					ELSE 
						SetSoundParams TestLight01 vol = LightRainVolume 
					ENDIF 
				ENDIF 
			ENDIF 
			change Paused_Light_Rain = 0 
		ENDIF 
		IF ( Paused_Heavy_Rain = 1 ) 
			IF IsSoundPlaying TestLight02 
				IF NOT GotParam dont_unpause_rain_sounds 
					IF ( Inside_Heavy_Rain = 1 ) 
						SetSoundParams TestLight02 vol = ( LightRainVolume * 0.10000000149 ) 
					ELSE 
						SetSoundParams TestLight02 vol = LightRainVolume 
					ENDIF 
				ENDIF 
			ENDIF 
			IF IsSoundPlaying TestMedium02 
				IF NOT GotParam dont_unpause_rain_sounds 
					IF ( Inside_Heavy_Rain = 1 ) 
						SetSoundParams TestMedium02 vol = ( MediumRainVolume * 0.10000000149 ) 
					ELSE 
						SetSoundParams TestMedium02 vol = MediumRainVolume 
					ENDIF 
				ENDIF 
			ENDIF 
			change Paused_Heavy_Rain = 0 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT menu_quit_no 
	generic_menu_pad_back_sound 
	dialog_box_exit 
	create_pause_menu 
ENDSCRIPT

SCRIPT bootstrap_quit 
	dialog_box_exit 
	SetButtonEventMappings block_menu_input 
	skater : DisablePlayerInput 
	PauseGame 
	Cleanup 
	SkProDisplayLoadingScreen "loadscrn_marketing" 
	wait 5 seconds 
	exitdemo 
ENDSCRIPT

SCRIPT change_gamemode_career 
	printf "********** CHANGING GAME MODE TO CAREER" 
	EnableSun 
	SetGameType career 
	SetCurrentGameType 
ENDSCRIPT

SCRIPT change_gamemode_classic 
	printf "********** CHANGING GAME MODE TO CLASSIC" 
	EnableSun 
	SetGameType classic 
	SetCurrentGameType 
ENDSCRIPT

SCRIPT change_gamemode_net 
	printf "********** CHANGING GAME MODE TO NET!!!" 
	DisableSun 
	SetGameType net 
	SetCurrentGameType 
ENDSCRIPT

SCRIPT change_gamemode_singlesession 
	EnableSun 
	SetGameType singlesession 
	SetCurrentGameType 
ENDSCRIPT

SCRIPT change_gamemode_freeskate_2p 
	DisableSun 
	SetGameType freeskate2p 
	SetCurrentGameType 
ENDSCRIPT

SCRIPT change_gamemode_creategoals 
	EnableSun 
	SetGameType creategoals 
	SetCurrentGameType 
ENDSCRIPT

SCRIPT menu_select menu_select_script = item_chosen 
	IF GotParam stop_streams 
		StopStream 
	ENDIF 
	IF GotParam stop_vibration 
	ENDIF 
	exit_pause_menu 
	<menu_select_script> 
ENDSCRIPT

SCRIPT item_chosen menu_id = current_menu_anchor 
	printf "item_chosen" 
	RunScriptOnScreenElement id = <menu_id> animate_out callback = create_pause_menu 
ENDSCRIPT

SCRIPT make_text_menu_item { focus_script = do_scale_up 
		unfocus_script = do_scale_down 
		pad_choose_script = item_chosen 
		pad_back_script = exit_pause_menu 
	font_face = small } 
	CreateScreenElement { 
		type = textelement parent = current_menu 
		id = <id> 
		text = <text> 
		font = <font_face> 
		rgba = [ 128 128 128 75 ] 
		event_handlers = [ 
			{ focus <focus_script> } 
			{ unfocus <unfocus_script> } 
			{ pad_choose <pad_choose_script> params = <pad_choose_params> } 
			{ pad_back <pad_back_script> } 
		] 
	} 
ENDSCRIPT

SCRIPT make_sprite_menu_item 
	make_theme_menu_item <...> dims = PAIR(300.00000000000, 18.00000000000) no_angle 
ENDSCRIPT

SCRIPT make_toggle_menu_item { font = small 
		child_pos = { PAIR(210.00000000000, 0.00000000000) relative } 
		rgba = [ 88 105 112 128 ] 
		child_rgba = [ 88 105 112 128 ] 
		just = [ right top ] 
		child_just = [ left top ] 
		child_scale = 1 
		focus_script = do_scale_up 
		unfocus_script = do_scale_down 
		pad_choose_script = item_chosen 
		toggle_text = "off" 
	} 
	CreateScreenElement { 
		type = textelement 
		parent = current_menu 
		id = <id> 
		font = <font> 
		pos = <pos> 
		rgba = <rgba> 
		just = <just> 
		text = <text> 
		scale = <scale> 
		event_handlers = [ 
			{ focus <focus_script> params = <focus_params> } 
			{ unfocus <unfocus_script> params = <unfocus_params> } 
			{ pad_choose <pad_choose_script> params = <pad_choose_params> } 
			{ pad_start <pad_choose_script> params = <pad_choose_params> } 
		] 
	} 
	CreateScreenElement { 
		type = textelement 
		parent = <id> 
		font = <font> 
		pos = <child_pos> 
		rgba = <child_rgba> 
		just = <child_just> 
		text = <toggle_text> 
		scale = <child_scale> 
	} 
ENDSCRIPT

SCRIPT toggle_menu_item_on { 
		toggle_text = "on" 
	} 
	SetScreenElementProps { 
		id = { <id> child = 0 } 
		text = <toggle_text> 
	} 
ENDSCRIPT

SCRIPT toggle_menu_item_off { 
		toggle_text = "off" 
	} 
	SetScreenElementProps { 
		id = { <id> child = 0 } 
		text = <toggle_text> 
	} 
ENDSCRIPT

SCRIPT animate_in_fade 
	DoMorph time = 0 alpha = 0 
	DoMorph time = 0.03999999911 alpha = 0.40000000596 
	DoMorph time = 0.03999999911 alpha = 1 
	DoMorph time = 0.03999999911 
ENDSCRIPT

SCRIPT animate_in 
	SetButtonEventMappings block_menu_input 
	SetScreenElementProps id = root_window tags = { menu_state = entering } 
	DoMorph time = 0 scale = 0 alpha = 0 
	FireEvent type = focus target = <menu_id> 
	DoMorph time = 0.07000000030 scale = 1.10000002384 alpha = 0.40000000596 
	DoMorph time = 0.07000000030 scale = 0.94999998808 alpha = 1 
	DoMorph time = 0.07000000030 scale = 1.00000000000 
	SetScreenElementProps id = root_window tags = { menu_state = on } 
	IF NOT GotParam dont_unblock 
		SetButtonEventMappings unblock_menu_input 
	ENDIF 
ENDSCRIPT

SCRIPT menu_onscreen menu_id = current_menu_anchor scale = 1 
	DoMorph scale = <scale> time = 0 
	IF GotParam pos 
		DoMorph pos = <pos> 
	ENDIF 
	SetProps just = [ center center ] 
	GetTags 
	IF GotParam focus_child 
		FireEvent type = focus target = <menu_id> data = { child_id = <focus_child> } 
	ELSE 
		FireEvent type = focus target = <id> 
	ENDIF 
	IF NOT GotParam preserve_menu_state 
		SetScreenElementProps id = root_window tags = { menu_state = on } 
	ENDIF 
ENDSCRIPT

SCRIPT animate_out menu_id = current_menu_anchor 
	SetButtonEventMappings block_menu_input 
	SetScreenElementProps id = root_window tags = { menu_state = leaving } 
	GetTags 
	SetProps just = [ center center ] 
	DoMorph time = 0 scale = 1.00000000000 
	DoMorph time = 0.07000000030 scale = 1.29999995232 
	DoMorph time = 0.05000000075 scale = 1.39999997616 alpha = 0.05000000075 
	DoMorph time = 0.15000000596 scale = 0.00000000000 alpha = 0 
	SetScreenElementProps id = root_window tags = { menu_state = off } 
	SetScreenElementLock id = root_window off 
	DestroyScreenElement id = <menu_id> 
	SetButtonEventMappings unblock_menu_input 
ENDSCRIPT

SCRIPT menu_offscreen 
	SetScreenElementProps id = root_window tags = { menu_state = off } 
	SetScreenElementLock id = root_window off 
	GetTags 
	FireEvent type = unfocus target = <id> 
	DestroyScreenElement id = <id> recurse 
ENDSCRIPT

SCRIPT scale_sprite_up 
	DoMorph time = 0 scale = 0 alpha = 0 
	wait 0.20000000298 second 
	DoMorph time = 0 scale = 4.50000000000 alpha = 0 rot_angle = 0 
	DoMorph time = 0.20000000298 rot_angle = 0 scale = 0.94999998808 alpha = 0.55000001192 
ENDSCRIPT

SCRIPT scale_sprite_down 
	DoMorph time = 0 rot_angle = 0 scale = 0 
ENDSCRIPT

SCRIPT do_scale_up rgba = [ 127 102 0 100 ] 
	GetTags 
	SetProps rgba = <rgba> 
	RunScriptOnScreenElement id = <id> do_random_effect params = { id = <id> } 
ENDSCRIPT

SCRIPT do_scale_down rgba = [ 88 105 112 128 ] 
	IF NOT GotParam no_sound 
		generic_menu_pad_up_down_sound 
	ENDIF 
	KillSpawnedScript name = do_random_effect 
	SetProps no_blur_effect 
	SetProps rgba = <rgba> 
ENDSCRIPT

SCRIPT do_random_effect 
	GetTags 
	SetTags random_effect_done = 0 
	RunScriptOnScreenElement id = <id> do_random_effect2 
	BEGIN 
		GetTags 
		IF ( <random_effect_done> = 1 ) 
			SetTags random_effect_done = 0 
			RunScriptOnScreenElement id = <id> do_random_effect2 params = { 
				id = <id> 
				effect = RANDOM(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1) RANDOMCASE 2 RANDOMCASE 6 RANDOMCASE 5 RANDOMCASE 8 RANDOMCASE 2 RANDOMCASE 1 RANDOMCASE 5 RANDOMCASE 2 RANDOMCASE 3 RANDOMCASE 5 RANDOMCASE 2 RANDOMCASE 10 RANDOMCASE 1 RANDOMCASE 2 RANDOMCASE 3 RANDOMCASE 5 RANDOMCASE 2 RANDOMCASE 3 RANDOMCASE 8 RANDOMCASE 3 RANDOMCASE 5 RANDOMCASE 9 RANDOMCASE 2 RANDOMCASE 9 RANDOMCASE 5 RANDOMCASE 2 RANDOMCASE 3 RANDOMCASE 5 RANDOMCASE 6 RANDOMCASE 2 RANDOMCASE 1 RANDOMCASE 9 RANDOMCASE 5 RANDOMCASE 3 RANDOMCASE 2 RANDOMCASE 3 RANDOMCASE 5 RANDOMCASE 2 RANDOMCASE 3 RANDOMCASE 5 RANDOMCASE 2 RANDOMCASE 3 RANDOMCASE 5 RANDOMCASE 6 RANDOMCASE 1 RANDOMEND 
				<...> 
			} 
		ENDIF 
		wait 4 frame 
	REPEAT 
ENDSCRIPT

SCRIPT do_random_effect2 orig_rot = 0 
	SWITCH <effect> 
		CASE 1 
			DoMorph time = 0.03999999911 scale = PAIR(1.20000004768, 0.97000002861) alpha = 0.10000000149 relative_scale rot_angle = ( -8 + <orig_rot> ) 
			DoMorph time = 0.03999999911 scale = 1 alpha = 1 relative_scale rot_angle = ( 0 + <orig_rot> ) 
		CASE 2 
			DoMorph time = 0.05000000075 pos = { PAIR(-0.75000000000, 0.50000000000) relative } 
			DoMorph time = 0.05000000075 pos = { PAIR(1.50000000000, -1.00000000000) relative } 
			DoMorph time = 0.05000000075 pos = { PAIR(-0.75000000000, 0.50000000000) relative } 
		CASE 3 
			DoMorph time = 0.05000000075 alpha = 0.60000002384 scale = 1.20000004768 relative_scale 
			DoMorph time = 0.05000000075 alpha = 1 scale = 1 relative_scale 
		CASE 4 
			SetProps blur_effect 
			do_blur_effect_highlight 
			SetProps no_blur_effect 
		CASE 5 
			DoMorph time = 0.05000000075 pos = { PAIR(-1.50000000000, 0.50000000000) relative } 
			DoMorph time = 0.05000000075 pos = { PAIR(3.00000000000, -1.00000000000) relative } 
			DoMorph time = 0.05000000075 pos = { PAIR(-1.50000000000, 0.50000000000) relative } 
		CASE 6 
			DoMorph time = 0.05000000075 pos = { PAIR(-0.75000000000, 1.50000000000) relative } 
			DoMorph time = 0.05000000075 pos = { PAIR(1.50000000000, -3.00000000000) relative } 
			DoMorph time = 0.05000000075 pos = { PAIR(-0.75000000000, 1.50000000000) relative } 
		CASE 7 
			SetProps blur_effect 
			do_blur_effect_accept 
			SetProps no_blur_effect 
		CASE 8 
			DoMorph time = 0.05000000075 scale = 1.29999995232 relative_scale 
			DoMorph time = 0.05000000075 scale = 1 relative_scale 
		CASE 9 
			DoMorph time = 0.03999999911 scale = PAIR(0.94999998808, 0.64999997616) alpha = 0.80000001192 relative_scale 
			DoMorph time = 0.03999999911 scale = 1 alpha = 1 relative_scale 
		CASE 10 
			DoMorph time = 0.05000000075 pos = { PAIR(-2.00000000000, 0.00000000000) relative } rot_angle = ( 0 + <orig_rot> ) 
			DoMorph time = 0.05000000075 pos = { PAIR(4.00000000000, 0.00000000000) relative } rot_angle = ( 2 + <orig_rot> ) 
			DoMorph time = 0.05000000075 pos = { PAIR(-2.00000000000, 0.00000000000) relative } rot_angle = ( 0 + <orig_rot> ) 
		DEFAULT 
			SetProps blur_effect 
			do_blur_effect 
			SetProps no_blur_effect 
	ENDSWITCH 
	SetTags random_effect_done = 1 
ENDSCRIPT

random_effect_break_loop = 0 
SCRIPT do_random_effect_paused 
	change random_effect_break_loop = 0 
	GetTags 
	SetTags random_effect_done = 0 
	RunScriptOnScreenElement id = <id> do_random_effect_paused_2 
	BEGIN 
		IF ( <random_effect_break_loop> = 1 ) 
			BREAK 
		ENDIF 
		GetTags 
		IF ( <random_effect_done> = 1 ) 
			SetTags random_effect_done = 0 
			RunScriptOnScreenElement id = <id> do_random_effect_paused_2 params = { 
				id = <id> 
				effect = RANDOM(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1) RANDOMCASE 2 RANDOMCASE 3 RANDOMCASE 5 RANDOMCASE 8 RANDOMCASE 2 RANDOMCASE 3 RANDOMCASE 5 RANDOMCASE 2 RANDOMCASE 3 RANDOMCASE 5 RANDOMCASE 2 RANDOMCASE 10 RANDOMCASE 3 RANDOMCASE 2 RANDOMCASE 3 RANDOMCASE 5 RANDOMCASE 2 RANDOMCASE 3 RANDOMCASE 8 RANDOMCASE 3 RANDOMCASE 5 RANDOMCASE 9 RANDOMCASE 2 RANDOMCASE 3 RANDOMCASE 5 RANDOMCASE 2 RANDOMCASE 3 RANDOMCASE 5 RANDOMCASE 6 RANDOMCASE 2 RANDOMCASE 3 RANDOMCASE 9 RANDOMCASE 5 RANDOMCASE 3 RANDOMCASE 2 RANDOMCASE 3 RANDOMCASE 5 RANDOMCASE 2 RANDOMCASE 3 RANDOMCASE 5 RANDOMCASE 2 RANDOMCASE 3 RANDOMCASE 5 RANDOMCASE 6 RANDOMCASE 7 RANDOMCASE 1 RANDOMEND 
			} 
		ENDIF 
		wait 10 frame 
	REPEAT 
ENDSCRIPT

SCRIPT do_random_effect_paused_2 
	SWITCH <effect> 
		CASE 1 
			DoMorph time = 0.03999999911 alpha = 0.10000000149 
			DoMorph time = 0.03999999911 alpha = 0.20000000298 
			DoMorph time = 0.03999999911 alpha = 1.00000000000 
		CASE 2 
			DoMorph time = 0.05000000075 alpha = 0.60000002384 
			DoMorph time = 0.05000000075 alpha = 1 
		CASE 3 
			DoMorph time = 0.05000000075 alpha = 0.60000002384 
			DoMorph time = 0.05000000075 alpha = 1 
		CASE 4 
			SetProps blur_effect 
			do_blur_effect_highlight 
			SetProps no_blur_effect 
		CASE 5 
			DoMorph time = 0.05000000075 pos = { PAIR(-1.50000000000, 0.50000000000) relative } 
			DoMorph time = 0.05000000075 pos = { PAIR(3.00000000000, -1.00000000000) relative } 
			DoMorph time = 0.05000000075 pos = { PAIR(-1.50000000000, 0.50000000000) relative } 
		CASE 6 
			DoMorph time = 0.05000000075 pos = { PAIR(-0.75000000000, 1.50000000000) relative } 
			DoMorph time = 0.05000000075 pos = { PAIR(1.50000000000, -3.00000000000) relative } 
			DoMorph time = 0.05000000075 pos = { PAIR(-0.75000000000, 1.50000000000) relative } 
		CASE 7 
			DoMorph time = 0.40000000596 alpha = 0 
			DoMorph time = 0.05000000075 alpha = 0 
			DoMorph time = 0.05000000075 alpha = 1 
		CASE 8 
			DoMorph time = 1 alpha = 0.69999998808 
			DoMorph time = 0.05000000075 alpha = 1 
		CASE 9 
			DoMorph time = 0.03999999911 alpha = 0.80000001192 
			DoMorph time = 0.03999999911 alpha = 1 
		CASE 10 
			DoMorph time = 0 alpha = 0 
			DoMorph time = 0.05000000075 alpha = 1 
		DEFAULT 
			SetProps blur_effect 
			do_blur_effect 
			SetProps no_blur_effect 
	ENDSWITCH 
	SetTags random_effect_done = 1 
ENDSCRIPT

SCRIPT hide_root_window 
	DoScreenElementMorph id = root_window scale = 0 
ENDSCRIPT

SCRIPT unhide_root_window 
	DoScreenElementMorph id = root_window scale = 1 
ENDSCRIPT

SCRIPT generic_menu_update_arrows menu_id = current_menu 
	IF NOT ObjectExists id = <up_arrow_id> 
		RETURN 
	ENDIF 
	IF NOT ObjectExists id = <down_arrow_id> 
		RETURN 
	ENDIF 
	IF MenuSelectedIndexIs id = <menu_id> first 
		SetScreenElementProps { 
			id = <up_arrow_id> 
			rgba = [ 128 128 128 0 ] 
		} 
	ELSE 
		SetScreenElementProps { 
			id = <up_arrow_id> 
			rgba = [ 128 128 128 128 ] 
		} 
	ENDIF 
	IF MenuSelectedIndexIs id = <menu_id> last 
		SetScreenElementProps { 
			id = <down_arrow_id> 
			rgba = [ 128 128 128 0 ] 
		} 
	ELSE 
		SetScreenElementProps { 
			id = <down_arrow_id> 
			rgba = [ 128 128 128 128 ] 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT generic_menu_pad_back 
	printf "generic_menu_pad_back Parameters = " 
	generic_menu_pad_back_sound 
	IF GotParam callback 
		<callback> <...> 
	ENDIF 
ENDSCRIPT

SCRIPT generic_menu_pad_choose 
	IF GotParam callback 
		<callback> <...> 
	ENDIF 
ENDSCRIPT

SCRIPT generic_menu_buzzer_sound 
	PlaySound GUI_Buzzer01 vol = 100 
ENDSCRIPT

SCRIPT generic_menu_pad_back_sound 
	StopSound DE_MenuBack 
	PlaySound DE_MenuBack 
ENDSCRIPT

SCRIPT generic_menu_pad_up_down_sound 
ENDSCRIPT

SCRIPT generic_menu_pad_choose_sound 
	StopSound ThisMenuSelectSound 
	PlaySound menu06 vol = 100 id = ThisMenuSelectSound 
ENDSCRIPT

disable_menu_sounds = 0 
SCRIPT generic_menu_up_or_down_sound { 
		menu_id = current_menu 
		pitch = 100 
	} 
	IF ( disable_menu_sounds = 0 ) 
		StopSound MenuDown 
		PlaySound MenuDown pitch = <pitch> vol = 50 
	ENDIF 
ENDSCRIPT

SCRIPT generic_menu_scroll_sideways_sound 
	IF ( disable_menu_sounds = 0 ) 
		PlaySound MENU_left_rightB vol = 80 
	ENDIF 
ENDSCRIPT

SCRIPT parked_scroll_sideways_sound 
	PlaySound MENU_left_rightB vol = 80 
ENDSCRIPT

SCRIPT generic_keyboard_sound 
ENDSCRIPT

SCRIPT theme_menu_pad_choose_sound 
	StopSound ThisMenuSelectSound 
	PlaySound menu06 vol = 100 id = ThisMenuSelectSound 
ENDSCRIPT

SCRIPT generic_pause_exit_sound 
	IF ( ( THUGPRO_CurrentThemeName ) = thps4 ) 
		StopSound PA_MenuBack 
		PlaySound PA_MenuBack 
	ELSE 
		StopSound DE_MenuBack 
		PlaySound DE_MenuBack 
	ENDIF 
ENDSCRIPT

SCRIPT generic_create_pause_menu_sound_thug2 
	StopSound SK6_Menu_Fly_In 
	PlaySound SK6_Menu_Fly_In 
ENDSCRIPT

SCRIPT generic_create_pause_menu_sound 
	IF ( ( THUGPRO_CurrentThemeName ) = thug2 ) 
		generic_create_pause_menu_sound_thug2 
	ELSE 
		StopSound DE_PauseFlyIn 
		PlaySound DE_PauseFlyIn 
	ENDIF 
ENDSCRIPT

SCRIPT create_skateboard_clone_model 
	GetSkaterId 
	IF NOT ObjectExists id = SkaterClone 
		CreateCompositeObject { 
			Components = [ 
				{ component = Skeleton SkeletonName = THPS6_human } 
				{ component = Model } 
			] 
			params = { 
				name = SkaterClone 
				pos = VECTOR(-50000.00000000000, -50000.00000000000, -50000.00000000000) 
				CloneFrom = <objId> 
				Geom = board 
			} 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT pause_show_deck { 
		active_viewport = 0 
		node = TRG_Restart01 
		parent = root_window 
		final_pos = PAIR(320.00000000000, 240.00000000000) 
	} 
	kill_pause_deck 
	IF NOT ObjectExists id = skater 
		RETURN 
	ENDIF 
	IF NOT ScreenElementExists id = <parent> 
		printf "WARNING: pause_show_deck couldn\'t find parent %s" s = <parent> 
		RETURN 
	ENDIF 
	SetScreenElementLock id = <parent> off 
	IF GotParam boombox 
		IF LevelIs Load_MainMenu 
			scale = 0.11999999732 
			start_pos = PAIR(200.00000000000, 220.00000000000) 
		ELSE 
			scale = 0.21999999881 
			start_pos = PAIR(160.00000000000, 220.00000000000) 
		ENDIF 
		final_pos = <start_pos> 
		rot_speed = 0.02250000089 
		CreateScreenElement { 
			parent = <parent> 
			type = Element3d 
			id = pause_deck 
			Model = "GameObjects\\boombox\\boombox.mdl" 
			pos = <start_pos> 
			CameraZ = -20 
			scale = <scale> 
			Tilt = 0 
			PivotPoint = VECTOR(0.00000000000, 4.11999988556, 0.00000000000) 
			active_viewport = <active_viewport> 
			AngleOrderXYZ 
			anglex = 0.00000000000 
			angley = 0.00000000000 
			anglez = 0.40000000596 
		} 
	ELSE 
		IF GotParam fly_in 
			start_pos = ( <final_pos> + PAIR(400.00000000000, 0.00000000000) ) 
		ELSE 
			start_pos = <final_pos> 
		ENDIF 
		rot_speed = 0.06250000000 
		IF ObjectExists id = SkaterClone 
			SkaterClone : Die 
		ENDIF 
		create_skateboard_clone_model 
		CreateScreenElement { 
			parent = <parent> 
			type = Element3d 
			id = pause_deck 
			SkeletonName = THPS6_human 
			refObjectName = SkaterClone 
			TexDictOffset = 20 
			pos = <start_pos> 
			CameraZ = -20 
			scale = 0.41999998689 
			Tilt = 0 
			PivotPoint = VECTOR(0.00000000000, 4.11999988556, 0.00000000000) 
			active_viewport = <active_viewport> 
			AngleOrderXYZ 
			anglex = -1.57000005245 
			angley = 0 
			anglez = 0.40000000596 
		} 
	ENDIF 
	SpawnScript rotate_pause_deck params = { final_pos = <final_pos> rot_speed = <rot_speed> } 
ENDSCRIPT

SCRIPT kill_pause_deck 
	IF ObjectExists id = pause_deck 
		KillSpawnedScript name = rotate_pause_deck 
		DestroyScreenElement id = pause_deck 
	ENDIF 
ENDSCRIPT

SCRIPT rotate_pause_deck 
	IF NOT GotParam rot_speed 
		rot_speed = 0.06250000000 
	ENDIF 
	IF NOT ObjectExists id = pause_deck 
		RETURN 
	ENDIF 
	rot_angle = 0 
	DoScreenElementMorph time = 0.25000000000 id = pause_deck pos = <final_pos> 
	BEGIN 
		IF NOT ObjectExists id = pause_deck 
			RETURN 
		ENDIF 
		SetScreenElementProps id = pause_deck angley = <rot_angle> 
		rot_angle = ( <rot_angle> + <rot_speed> ) 
		wait 1 gameframes 
	REPEAT 
ENDSCRIPT

SCRIPT pause_deck_sync_to_skater_graphic 
	GetCurrentSkaterProfileIndex 
	IF GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = deck_graphic 
		GetActualCASOptionStruct part = deck_graphic desc_id = <desc_id> 
	ENDIF 
ENDSCRIPT

SCRIPT pause_deck_sync_to_skater_griptape 
	GetCurrentSkaterProfileIndex 
	IF GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = griptape 
		GetActualCASOptionStruct part = griptape desc_id = <desc_id> 
	ENDIF 
ENDSCRIPT

SCRIPT fadetoblack time = 0.50000000000 alpha = 0.50000000000 z_priority = 9000 rgba = [ 0 0 0 128 ] scale = PAIR(300.00000000000, 200.00000000000) texture = black id = screenfader pos = PAIR(320.00000000000, 240.00000000000) parent = root_window 
	IF GotParam on 
		IF NOT ScreenElementExists id = <id> 
			SetScreenElementLock off id = <parent> 
			IF NOT GotParam create_script 
				CreateScreenElement { 
					type = SpriteElement 
					parent = <parent> 
					id = <id> 
					texture = <texture> 
					pos = <pos> 
					rgba = <rgba> 
					just = [ center center ] 
					scale = <scale> 
					alpha = 0 
					z_priority = <z_priority> 
					no_zwrite 
				} 
			ELSE 
				<create_script> 
			ENDIF 
			DoScreenElementMorph id = <id> time = <time> alpha = <alpha> rgba = <end_rgba> 
		ENDIF 
	ENDIF 
	IF GotParam off 
		IF ScreenElementExists id = <id> 
			DoScreenElementMorph id = <id> time = <time> alpha = 0 
			IF NOT ( <time> = 0.00000000000 ) 
				printf "waiting" 
				wait <time> seconds 
			ENDIF 
			IF ScreenElementExists id = <id> 
				DestroyScreenElement id = <id> 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT


