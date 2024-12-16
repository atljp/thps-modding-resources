
MENU_SS_SKATER_INDICATOR_FOCUS_COLOR = [ 128 128 128 128 ] 
MENU_SS_SKATER_INDICATOR_UNFOCUS_COLOR = [ 80 80 80 128 ] 
MENU_SS_SKATER_INDICATOR_LOCKED_COLOR = [ 40 40 40 128 ] 
MENU_SS_SKATER_INDICATOR_SPECIAL_COLOR = [ 0 128 0 128 ] 
skater_select_light0_heading = 60 
skater_select_light1_heading = -190 
skater_rot_angle = 0 
current_attract_movie = 0 
attract_mode_movies = [ ] 
in_options_menu = 0 
launch_to_createatrick = 0 
SCRIPT wait_and_pause_skater time = 10 
	BEGIN 
		IF ObjectExists id = skater 
			wait <time> gameframes 
			IF NOT GotParam dont_pause_music 
				PauseMusic 1 
			ENDIF 
			BREAK 
		ENDIF 
		wait 1 gameframe 
	REPEAT 
ENDSCRIPT

show_custom_level_validation_failed = 0 
show_custom_level_validation_failed_wait = 0 
SCRIPT show_custom_level_validation_failed_dialog 
	dialog_box_exit 
	create_dialog_box { 
		anchor_id = custom_level_validation_failed_anchor 
		title = "FAILED TO LOAD LEVEL" 
		text = "There was an error loading the last level..." 
		buttons = [ 
			{ text = "Ok" pad_choose_script = hide_custom_level_validation_failed_dialog } 
		] 
	} 
ENDSCRIPT

SCRIPT hide_custom_level_validation_failed_dialog 
	IF ScreenElementExists id = custom_level_validation_failed_anchor 
		DestroyScreenElement id = custom_level_validation_failed_anchor 
	ENDIF 
	Change show_custom_level_validation_failed_wait = 1 
ENDSCRIPT

SCRIPT fade_thugpro_startup_loadscreen 
	IF ScreenElementExists id = loadscreen_container 
		wait 2.50000000000 seconds 
		loadingscreen_container_hide 
	ENDIF 
ENDSCRIPT

SCRIPT autoload_thugpro_registry 
	IF IsTrue auto_load_thugpro_data 
		ForEachIn ( thugpro_generic_save_info ) do = thugpro_maybe_read_reg_key Params = { autoload = autoload } 
		Change auto_load_thugpro_data = 0 
	ENDIF 
ENDSCRIPT

SCRIPT autoload_thugpro_set_first_run_key 
	IF NOT GetRegKeyValue key = "first_run" type = Int 
		SetRegKeyValue { 
			key = "first_run" 
			type = Int 
			value = 0 
		} 
		create_preset_menu dialog 
		thugpro_wait ReadyVal = thugpro_wait_test 
	ENDIF 
ENDSCRIPT

SCRIPT maybe_show_autoload_cas_failed_dialog 
	IF IsTrue autoload_cas_failed 
		Change failed_load_dialog_wait = 0 
		thugpro_autoload_failed_dialog 
		thugpro_wait ReadyVal = failed_load_dialog_wait 
		Change autoload_cas_failed = 0 
	ENDIF 
ENDSCRIPT

SCRIPT maybe_show_autoload_net_failed_dialog 
	IF IsTrue autoload_net_failed 
		Change failed_load_dialog_wait = 0 
		thugpro_autoload_failed_dialog 
		thugpro_wait ReadyVal = failed_load_dialog_wait 
		Change autoload_net_failed = 0 
	ENDIF 
ENDSCRIPT

SCRIPT maybe_show_custom_level_validation_failed_dialog 
	IF IsTrue show_custom_level_validation_failed 
		Change show_custom_level_validation_failed_wait = 0 
		show_custom_level_validation_failed_dialog 
		destroy_thugpro_startup_loadscreen_or_fade_in 
		thugpro_wait ReadyVal = show_custom_level_validation_failed_wait 
		Change show_custom_level_validation_failed = 0 
	ENDIF 
ENDSCRIPT

SCRIPT create_main_menu 
	hide_select_skater_arrows 
	orient_skateshop_skater 
	cas_remove_ped_stuff_from_skater 
	KillSkaterCamAnim all 
	PlaySkaterCamAnim name = skateshop_startcam play_hold 
	SetNetworkMode 
	UnPauseMusicAndStreams 
	Change back_to_local_net_menu = 0 
	Change in_server_options = 0 
	change_gamemode_singlesession 
	autoload_thugpro_registry 
	fade_thugpro_startup_loadscreen 
	maybe_show_autoload_cas_failed_dialog 
	maybe_show_autoload_net_failed_dialog 
	autoload_thugpro_set_first_run_key 
	maybe_show_custom_level_validation_failed_dialog 
	IF GotParam InputDelay 
		KillSpawnedScript name = TemporarilyDisableInput 
		SpawnScript TemporarilyDisableInput Params = { time = 400 } 
	ENDIF 
	SetMenuPadMappings [ active use_as_first ] 
	thugpro_menu_create { 
		menu_name = startup 
		menu_title = "SKATESHOP" 
		menu_title_texture = thugpro_logo_new 
		menu_title_scale = 0.41999998689 
		menu_style = MENU_STYLE_RIGHT 
		helper_text = generic_helper_text_no_back 
		show_description_panel 
	} 
	thugpro_menu_create_background { } 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		texture = top_gradient 
		id = menu_top_gradient 
		alpha = 0.80000001192 
		scale = PAIR(90.00000000000, 10.00000000000) 
		pos = PAIR(0.00000000000, 0.00000000000) 
		just = [ left top ] 
		rgba = [ 0 0 0 128 ] 
		z_priority = 0 
	} 
	make_thugpro_menu_item { 
		text = "Play Online" 
		description_text = ( Desc_SS_PlayOnline ) 
		pad_choose_script = select_network_play_multi 
		centered 
		scale = 1.20000004768 
	} 
	make_thugpro_menu_item { 
		text = "Freeskate" 
		description_text = ( Desc_SS_Freeskate ) 
		pad_choose_script = launch_new_select_skater_menu 
		pad_choose_params = { 
			callback = create_main_menu 
			change_gamemode = change_gamemode_singlesession 
		} 
		centered 
		scale = 1.20000004768 
	} 
	make_thugpro_menu_item { 
		text = "Edit Skater" 
		description_text = ( Desc_SS_EditSkater ) 
		pad_choose_script = launch_pre_cas_menu 
		centered 
		scale = 1.20000004768 
	} 
	make_thugpro_menu_item { 
		text = "Park Editor" 
		description_text = ( Desc_SS_ParkEditor ) 
		pad_choose_script = launch_park_editor 
		centered 
		scale = 1.20000004768 
	} 
	make_thugpro_menu_item { 
		text = "Options" 
		description_text = ( Desc_SS_Options ) 
		pad_choose_script = create_setup_options_menu 
		centered 
		scale = 1.20000004768 
	} 
	make_thugpro_menu_item { 
		text = "Quit Game" 
		description_text = ( Desc_SS_Quit ) 
		pad_choose_script = main_menu_exit_game 
		centered 
		scale = 1.20000004768 
	} 
	thugpro_menu_finalize <...> 
	kill_start_key_binding 
	wait 1 gameframe 
	destroy_thugpro_startup_loadscreen_or_fade_in 
ENDSCRIPT

SCRIPT destroy_thugpro_startup_loadscreen_or_fade_in 
	IF ScreenElementExists id = loadscreen_container 
		wait 1.50000000000 seconds 
		loadingscreen_container_destroy 
	ELSE 
		FadeToBlack off time = 0.50000000000 
		wait 0.50000000000 seconds 
	ENDIF 
ENDSCRIPT

SCRIPT SkateshopAI 
ENDSCRIPT

SCRIPT start_internet_game 
	memcard_menus_cleanup 
	InitPrefsBeenox 
	SetNetworkMode LAN_MODE 
	KillSkaterCamAnim all 
	PlaySkaterCamAnim name = skateshop_startcam play_hold 
	SpawnSecondControllerCheck 
	wait 5 gameframe 
	kill_start_key_binding 
	select_xbox_multiplayer change_gamemode = change_gamemode_net 
ENDSCRIPT

SCRIPT make_new_skateshop_menu 
	SetScreenElementProps { 
		id = root_window 
		replace_handlers 
		event_handlers = [ 
			{ pad_start main_menu_start_pressed } 
		] 
	} 
	make_new_menu <...> 
ENDSCRIPT

SCRIPT main_menu_start_pressed 
ENDSCRIPT

SCRIPT skateshop_transition menu_anim = animate_out 
	RunScriptOnScreenElement id = current_menu_anchor <menu_anim> callback = skateshop_transition2 callback_params = <...> 
ENDSCRIPT

SCRIPT skateshop_transition2 
	IF GotParam cam_anim 
		printf "got a cam_anim" 
		PlaySkaterCamAnim skater = 0 name = <cam_anim> 
	ENDIF 
	IF GotParam came_from_main_menu 
		<new_menu_script> came_from_main_menu 
	ELSE 
		<new_menu_script> 
	ENDIF 
ENDSCRIPT

SCRIPT main_menu_add_item 
ENDSCRIPT

SCRIPT make_main_menu_item 
ENDSCRIPT

SCRIPT main_menu_item_focus 
ENDSCRIPT

SCRIPT main_menu_focus 
ENDSCRIPT

SCRIPT main_menu_unfocus 
ENDSCRIPT

SCRIPT main_menu_exit 
ENDSCRIPT

SCRIPT main_menu_loading_screen 
ENDSCRIPT

SCRIPT play_no_skater_cam 
	KillSkaterCamAnim all 
	SetActiveCamera id = SkaterCam0 
	PlaySkaterCamAnim skater = 0 name = mainmenu_camera03 play_hold 
ENDSCRIPT

SCRIPT make_mainmenu_3d_plane { 
		id = bg_plane 
		parent = current_menu_anchor 
		z_priority = -500 
		model = "UI_bg\\UI_bg.mdl" 
		scale = VECTOR(2.09999990463, 2.20000004768, 2.09999990463) 
		pos = PAIR(320.00000000000, 225.00000000000) 
	} 
	IF ScreenElementExists id = <id> 
		DestroyScreenElement id = <id> 
	ENDIF 
	IF ScreenElementExists id = <parent> 
		SetScreenElementLock off id = <parent> 
		CreateScreenElement { 
			parent = <parent> 
			type = Element3d 
			id = <id> 
			model = <model> 
			TexDictOffset = 20 
			pos = <pos> 
			CameraZ = <z_priority> 
			scale = <scale> 
			Tilt = 0 
		} 
	ELSE 
		printf "make_mainmenu_3d_plane: parent %p doesn\'t exist" p = <parent> 
	ENDIF 
ENDSCRIPT

SCRIPT check_cheat_from_keyboard 
	GetTextElementString id = keyboard_current_string 
	IF NOT GotParam cancel 
		TryCheatString string = <string> 
	ENDIF 
	destroy_onscreen_keyboard 
	create_setup_options_menu 
ENDSCRIPT

SCRIPT story_options_change_level 
	dialog_box_exit 
	restore_start_key_binding 
	SetGlobalFlag flag = CAREER_STARTED 
	LoadCurrentChapter 
ENDSCRIPT

SCRIPT launch_ss_menu 
	printf "WARNING: launch_ss_menu has been removed!" 
ENDSCRIPT

SCRIPT ss_initialization 
	printf "WARNING: ss_initialization has been removed!" 
ENDSCRIPT

SCRIPT create_ss_menu 
	printf "WARNING: create_ss_menu has been removed!" 
ENDSCRIPT

SCRIPT toggle_net_connection_type 
	printf "WARNING: toggle_net_connection_type has been removed!" 
ENDSCRIPT

SCRIPT player_1_ready 
	load_second_skater_profile 
	launch_select_skater_menu second_player 
ENDSCRIPT

SCRIPT ss_menu_exit 
	printf "WARNING: ss_menu_exit has been removed!" 
ENDSCRIPT

SCRIPT launch_select_skater_menu 
	printf "WARNING: launch_select_skater_menu has been removed!" 
ENDSCRIPT

SCRIPT create_select_skater_menu 
	printf "WARNING: create_select_skater_menu has been removed!" 
ENDSCRIPT

SCRIPT SkaterSelectAI 
	printf "WARNING: SkaterSelectAI has been removed!" 
ENDSCRIPT

SCRIPT reset_model_lights 
	IF Obj_HasModelLights 
		Obj_DisableAmbientLight 
		Obj_DisableDiffuseLight index = 0 
		Obj_DisableDiffuseLight index = 1 
	ELSE 
		printf "No model lights to reset" 
	ENDIF 
ENDSCRIPT

SCRIPT create_select_skater_hmenu 
ENDSCRIPT

SCRIPT ss_overwrite_warning { 
		callback = cas_reset_skater_and_goto_menu 
	} 
	hide_select_skater_arrows 
	IF ObjectExists id = select_skater_hmenu 
		FireEvent type = unfocus target = select_skater_hmenu 
	ENDIF 
	IF ObjectExists id = select_skater_hmenu_new 
		FireEvent type = unfocus target = select_skater_hmenu_new 
	ENDIF 
	IF ObjectExists id = stats_block_menu_anchor 
		DoScreenElementMorph { 
			id = stats_block_menu_anchor 
			alpha = 0.00000000000 
			time = 0.20000000298 
		} 
	ENDIF 
	create_snazzy_dialog_box { 
		title = #"Load Skater" 
		text = #"Warning !\\nAny unsaved changes to your current Game Progress will be lost.\\nContinue ?" 
		text_dims = PAIR(400.00000000000, 0.00000000000) 
		no_bg 
		pad_back_script = generic_menu_pad_back 
		pad_back_params = { callback = ss_cancel_load_skater } 
		buttons = [ 
			{ 
				font = small text = #"Yes" 
				pad_choose_script = ss_yes_load_skater 
			} 
			{ 
				font = small text = #"No" 
				pad_choose_script = ss_cancel_load_skater 
			} 
		] 
	} 
ENDSCRIPT

SCRIPT ss_yes_load_skater 
	GetCurrentSkaterProfileIndex 
	IF ( <currentSkaterProfileIndex> = 1 ) 
		Change layer_infos_need_resetting = 1 
		edit_graphic_copy_layer_infos 
	ENDIF 
	launch_load_cas_from_select_sequence 
ENDSCRIPT

SCRIPT ss_cancel_load_skater 
	dialog_box_exit 
	SetScreenElementLock id = current_menu_anchor off 
	launch_new_select_skater_menu 
ENDSCRIPT

SCRIPT menu_horiz_blink_arrow 
	printf "WARNING: menu_horiz_blink_arrow has been removed!" 
ENDSCRIPT

SCRIPT back_from_player_two_select 
	printf "WARNING: back_from_player_two_select has been removed!" 
ENDSCRIPT

SCRIPT select_skater_menu_add_hmenu_items 
ENDSCRIPT

SCRIPT get_current_skater_display_name 
	GetCurrentSkaterProfileIndex 
	GetSkaterProfileInfo player = <currentSkaterProfileIndex> 
	RETURN display_name = <display_name> 
ENDSCRIPT

SCRIPT get_custom_skater_display_name 
	GetSkaterProfileInfoByName name = custom 
	RETURN display_name = <display_name> 
ENDSCRIPT

SCRIPT select_skater_relight_skater 
	FakeLights percent = 100 prefix = TRG_TR_Level_Light 
	skater : Obj_SetLightAmbientColor r = ( skater_ambient_color [ 0 ] ) g = ( skater_ambient_color [ 1 ] ) b = ( skater_ambient_color [ 2 ] ) 
	skater : Obj_SetLightDiffuseColor index = 0 r = ( skater_diffuse_color1 [ 0 ] ) g = ( skater_diffuse_color1 [ 1 ] ) b = ( skater_diffuse_color1 [ 2 ] ) 
	skater : Obj_SetLightDiffuseColor index = 1 r = ( skater_diffuse_color2 [ 0 ] ) g = ( skater_diffuse_color2 [ 1 ] ) b = ( skater_diffuse_color2 [ 2 ] ) 
	skater : Obj_SetLightAmbientColor r = ( skater_ambient_color [ 0 ] ) g = ( skater_ambient_color [ 1 ] ) b = ( skater_ambient_color [ 2 ] ) 
	skater : Obj_SetLightDiffuseColor index = 0 r = ( skater_diffuse_color1 [ 0 ] ) g = ( skater_diffuse_color1 [ 1 ] ) b = ( skater_diffuse_color1 [ 2 ] ) 
	skater : Obj_SetLightDiffuseColor index = 1 r = ( skater_diffuse_color2 [ 0 ] ) g = ( skater_diffuse_color2 [ 1 ] ) b = ( skater_diffuse_color2 [ 2 ] ) 
	skater : Obj_SetLightDirection index = 0 heading = skater_select_light0_heading pitch = 350 
	skater : Obj_SetLightDirection index = 1 heading = skater_select_light1_heading pitch = 270 
	SetLightDirection index = 0 heading = skater_select_light0_heading pitch = 350 
	SetLightDirection index = 1 heading = skater_select_light1_heading pitch = 270 
ENDSCRIPT

SCRIPT select_skater_hmenu_focus 
ENDSCRIPT

SCRIPT highlight_box_pulse 
ENDSCRIPT

SCRIPT select_skater_get_current_skater_name 
	GetCurrentSkaterProfileIndex 
	GetSkaterProfileInfo player = <currentSkaterProfileIndex> 
	RETURN current_skater = <name> 
ENDSCRIPT

SCRIPT select_skater_hmenu_unfocus 
	GetTags 
	generic_menu_pad_up_down_sound 
	SetScreenElementProps { 
		id = <id> 
		rgba = [ 0 , 0 , 0 , 108 ] 
	} 
	skater : reset_model_lights 
ENDSCRIPT

SCRIPT select_skater_hmenu_choose 
ENDSCRIPT

SCRIPT select_skater_get_profile_info 
	GetArraySize master_skater_list 
	<index> = 0 
	BEGIN 
		IF ChecksumEquals a = ( ( master_skater_list [ <index> ] ) . name ) b = <skater_profile> 
			RETURN profile_info = ( master_skater_list [ <index> ] ) 
		ENDIF 
		<index> = ( <index> + 1 ) 
	REPEAT <array_size> 
ENDSCRIPT

SCRIPT MakeSelectPedMenu 
ENDSCRIPT

SCRIPT PedChoose 
ENDSCRIPT

SCRIPT PedFocus 
ENDSCRIPT

SCRIPT BackFromPedMenu 
ENDSCRIPT

SCRIPT SkateshopGO 
	wait 0.18000000715 seconds 
	PlaySkaterStream type = "SSGo" 
ENDSCRIPT

SCRIPT load_second_skater_profile 
	printf "REFRESHING SKATER MODEL" 
	SetCurrentSkaterProfile 1 
	RefreshSkaterModel profile = 1 skater = 0 
	SyncPlayer2Profile 
ENDSCRIPT

SCRIPT select_skater_menu_back 
	IF IsInternetGameHost 
		QuitGame 
		RETURN 
	ENDIF 
	IF IsJoiningInternetGame 
		QuitGame 
		RETURN 
	ENDIF 
	IF ObjectExists id = select_skater_anchor 
		DestroyScreenElement id = select_skater_anchor 
		restore_start_key_binding 
	ENDIF 
	orient_skateshop_skater 
	skater : CancelRotateDisplay 
	FakeLights percent = 100 prefix = TRG_TR_Level_Light 
	skater : SetTags stopskateshopstreams = 1 
	<callback> from_skater_select 
ENDSCRIPT

SCRIPT select_skater_menu_animate_top 
	DoMorph pos = { PAIR(0.00000000000, -120.00000000000) relative } alpha = 0 
	DoMorph time = 0.20000000298 pos = { PAIR(0.00000000000, 120.00000000000) relative } alpha = 1 
ENDSCRIPT

SCRIPT select_skater_menu_animate_stats 
	FireEvent type = select_skater_menu_animate_stats_done 
ENDSCRIPT

SCRIPT menu_blink_arrow 
	DoMorph alpha = 0 
	wait 100 
	DoMorph time = 0.50000000000 alpha = 1 
ENDSCRIPT

SCRIPT blink_arrow 
	IF NOT ScreenElementExists id = <id> 
		RETURN 
	ENDIF 
	DoScreenElementMorph id = <id> alpha = 0 
	wait 100 
	DoScreenElementMorph id = <id> time = 0.30000001192 alpha = 1 
ENDSCRIPT

SCRIPT set_which_arrow 
	SetTags arrow_id = <arrow> 
ENDSCRIPT

SCRIPT menu_vert_blink_arrow menu_id = current_menu rgba = [ 128 128 128 128 ] 
	IF NOT ObjectExists id = <id> 
		printf "bad arrow id" 
		RETURN 
	ENDIF 
	TerminateObjectsScripts id = <id> 
	DoScreenElementMorph { 
		id = <id> 
		alpha = 1 
	} 
	wait 1 gameframe 
	IF NOT ( ( MenuSelectedIndexIs id = <menu_id> first ) | ( MenuSelectedIndexIs id = <menu_id> last ) ) 
		SetScreenElementProps { id = <id> rgba = <rgba> } 
		RunScriptOnScreenElement id = <id> menu_blink_arrow 
	ENDIF 
ENDSCRIPT

SCRIPT launch_park_editor 
	SetGameType creategoals 
	SetCurrentGameType 
	SetParkName "" 
	BindParkEditorToController <device_num> 
	GetCurrentSkaterProfileIndex 
	BindControllerToSkater skater_heap_index = <currentSkaterProfileIndex> controller = <device_num> 
	BindFrontEndToController front_end_pad = <currentSkaterProfileIndex> controller = <device_num> 
	main_menu_play_level level = load_Sk5Ed 
ENDSCRIPT

SCRIPT main_menu_play_level 
	restore_start_key_binding 
	skater : reset_model_lights 
	change_level level = <level> 
ENDSCRIPT

SCRIPT main_menu_play_level2 
ENDSCRIPT

SCRIPT leave_front_end 
	restore_start_key_binding 
	load_cas_textures_to_main_memory unload 
ENDSCRIPT

SCRIPT spawn_two_player 
	Cleanup preserve_skaters 
	LeaveServer 
	FlushDeadObjects 
	InitSkaterHeaps 
	SetServerMode 
	StartServer 
	SetJoinMode JOIN_MODE_PLAY 
	JoinServer 
	BEGIN 
		IF JoinServerComplete 
			BREAK 
		ELSE 
			wait 1 
		ENDIF 
	REPEAT 
	ScreenElementSystemCleanup 
ENDSCRIPT

SCRIPT launch_two_player 
	SetCurrentSkaterProfile 0 
	RefreshSkaterModel profile = 0 skater = 0 
	SetMenuPadMappings [ active 
		use_as_first 
	] 
	SpawnScript spawn_two_player NotSessionSpecific = 1 
ENDSCRIPT

SCRIPT enable_two_player_option 
	IF ObjectExists id = main_menu_2_player_option 
		handle_enable_two_player_option item = main_menu_2_player_option 
	ENDIF 
	IF ObjectExists id = main_menu_2_player_option2 
		handle_enable_two_player_option item = main_menu_2_player_option2 
	ENDIF 
ENDSCRIPT

SCRIPT handle_enable_two_player_option 
	IF IsTrue DEMO_BUILD 
		RETURN 
	ENDIF 
	<item> : GetTags 
	IF ( <active> = 0 ) 
		main_vmenu : GetTags 
		IF GotParam tag_selected_id 
			IF ( <tag_selected_id> = <item> ) 
				Theme_GetHighlightedTextColor return_value = rgba 
				SetScreenElementProps { 
					id = { <item> child = 0 } 
					rgba = <rgba> 
					z_priority = 4 
				} 
				IF ScreenElementExists id = { <item> child = 1 } 
					SetScreenElementProps { 
						id = { <item> child = 1 } 
						rgba = <rgba> 
						z_priority = 4 
					} 
				ENDIF 
			ELSE 
				SetScreenElementProps { 
					id = { <item> child = 0 } 
					rgba = spin_menu_unhighlighted_text 
				} 
				IF ScreenElementExists id = { <item> child = 1 } 
					SetScreenElementProps { 
						id = { <item> child = 1 } 
						rgba = spin_menu_unhighlighted_text 
						z_priority = 4 
					} 
				ENDIF 
			ENDIF 
			SetScreenElementProps { 
				id = <item> 
				tags = { active = 1 } 
			} 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT disable_two_player_option 
	IF ObjectExists id = main_menu_2_player_option 
		handle_disable_two_player_option item = main_menu_2_player_option 
	ENDIF 
	IF ObjectExists id = main_menu_2_player_option2 
		handle_disable_two_player_option item = main_menu_2_player_option2 
	ENDIF 
ENDSCRIPT

SCRIPT handle_disable_two_player_option 
	<item> : GetTags 
	IF ( <active> = 1 ) 
		main_vmenu : GetTags 
		IF GotParam tag_selected_id 
			IF ( <tag_selected_id> = <item> ) 
				FireEvent type = pad_up target = current_menu 
			ENDIF 
		ENDIF 
		SetScreenElementProps { 
			id = { <item> child = 0 } 
			rgba = spin_menu_disabled_text 
		} 
		IF ScreenElementExists id = { <item> child = 1 } 
			SetScreenElementProps { 
				id = { <item> child = 0 } 
				rgba = spin_menu_disabled_text 
			} 
		ENDIF 
		SetScreenElementProps { 
			id = <item> 
			tags = { active = 0 } 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT enable_system_link_option 
	IF ObjectExists id = mm_multi_play 
		handle_enable_system_link_option item = mm_multi_play 
	ENDIF 
	IF ObjectExists id = mm_multi_play2 
		handle_enable_system_link_option item = mm_multi_play2 
	ENDIF 
ENDSCRIPT

SCRIPT handle_enable_system_link_option 
	<item> : GetTags 
	IF ( <active> = 0 ) 
		main_vmenu : GetTags 
		IF GotParam tag_selected_id 
			IF ( <tag_selected_id> = <item> ) 
				Theme_GetHighlightedTextColor return_value = rgba 
				SetScreenElementProps { 
					id = { <item> child = 0 } 
					rgba = <rgba> 
					z_priority = 4 
				} 
				IF ScreenElementExists id = { <item> child = 1 } 
					SetScreenElementProps { 
						id = { <item> child = 1 } 
						rgba = <rgba> 
						z_priority = 4 
					} 
				ENDIF 
			ELSE 
				SetScreenElementProps { 
					id = { <item> child = 0 } 
					rgba = spin_menu_unhighlighted_text 
				} 
				IF ScreenElementExists id = { <item> child = 1 } 
					SetScreenElementProps { 
						id = { <item> child = 1 } 
						rgba = spin_menu_unhighlighted_text 
						z_priority = 4 
					} 
				ENDIF 
			ENDIF 
			SetScreenElementProps { 
				id = <item> 
				tags = { active = 1 } 
			} 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT disable_system_link_option 
	IF ObjectExists id = mm_multi_play 
		handle_disable_system_link_option item = mm_multi_play 
	ENDIF 
	IF ObjectExists id = mm_multi_play2 
		handle_disable_system_link_option item = mm_multi_play2 
	ENDIF 
ENDSCRIPT

SCRIPT handle_disable_system_link_option 
	<item> : GetTags 
	IF ( <active> = 1 ) 
		main_vmenu : GetTags 
		IF GotParam tag_selected_id 
			IF ( <tag_selected_id> = <item> ) 
				FireEvent type = pad_up target = current_menu 
			ENDIF 
		ENDIF 
		SetScreenElementProps { 
			id = { <item> child = 0 } 
			rgba = spin_menu_disabled_text 
		} 
		IF ScreenElementExists id = { <item> child = 1 } 
			SetScreenElementProps { 
				id = { <item> child = 1 } 
				rgba = spin_menu_disabled_text 
			} 
		ENDIF 
		SetScreenElementProps { 
			id = <item> 
			tags = { active = 0 } 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT make_mainmenu_clouds 
	printf "!! make_mainmenu_clouds no longer in use !!" 
ENDSCRIPT

SCRIPT launch_new_select_skater_menu 
	<callback> = create_main_menu 
	<from_skaterselect> = from_skaterselect 
	dialog_box_exit 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	IF GameModeEquals is_net 
		<callback> = select_network_play_multi 
		<from_skaterselect> = from_skaterselect 
	ELSE 
		<callback> = create_main_menu 
		<from_skaterselect> = from_skaterselect 
	ENDIF 
	IF GotParam change_gamemode 
		SpawnScript <change_gamemode> 
	ENDIF 
	SetMenuPadMappings [ active use_as_first ] 
	GoalManager_HidePoints 
	GoalManager_HideGoalPoints 
	create_new_select_skater_menu <...> 
ENDSCRIPT

LAST_SELECTED_SKATER_MENU_ID = custom 
LAST_SELECTED_SKATER_SKIN_INDEX = 0 
LAST_SELECTED_SKATER_LIST_INDEX = 0 
LAST_SELECTED_SKATER_BEHAVIOUR = SkateshopBehavior 
LAST_SELECTED_SKATER_HIDE_BOARD = 0 
SCRIPT new_select_skater_hmenu_focus 
	orient_skateshop_skater 
	IF ( LAST_SELECTED_SKATER_MENU_ID = <new_name> ) 
		first_time_in_focus = 1 
	ENDIF 
	Change LAST_SELECTED_SKATER_MENU_ID = <new_name> 
	GetTags 
	DoScreenElementMorph { 
		id = <id> 
		rgba = ( MENU_SS_SKATER_INDICATOR_FOCUS_COLOR ) 
		time = 0.20000000298 
	} 
	<stored_display_name> = <display_name> 
	IF GotParam no_board 
		Change LAST_SELECTED_SKATER_HIDE_BOARD = 1 
	ELSE 
		Change LAST_SELECTED_SKATER_HIDE_BOARD = 0 
	ENDIF 
	IF GotParam skater_behavior_script 
		IF NOT GotParam first_time_in_focus 
			SpawnSkaterScript SkateshopBehaviorSpawner Params = { script_name = <skater_behavior_script> } 
		ENDIF 
	ELSE 
		IF NOT GotParam first_time_in_focus 
			ResetLastSkaterBehaviorStuff 
			SpawnSkaterScript SkateshopBehavior 
		ENDIF 
	ENDIF 
	GetCurrentSkaterProfileIndex 
	SWITCH <name> 
		CASE ped 
			load_other_skater { profile = <currentSkaterProfileIndex> skater = 0 <...> } 
		DEFAULT 
			load_pro_skater { profile = <currentSkaterProfileIndex> skater = 0 <...> } 
	ENDSWITCH 
	IF ScreenElementExists id = stats_block_menu_anchor 
		DestroyScreenElement id = stats_block_menu_anchor 
	ENDIF 
	IF NOT GameModeEquals is_net 
		create_thugpro_style_test_menu_stats no_animate 
		GetSkaterProfileInfo player = <currentSkaterProfileIndex> 
	ENDIF 
	IF ScreenElementExists id = menu_title_text 
		SetScreenElementProps { 
			id = menu_title_text 
			text = <stored_display_name> 
		} 
	ENDIF 
	<id> : GetSingleTag selected_skin_index 
	IF GotParam selected_skin_index 
		IF NOT GotParam first_time_in_focus 
			Change LAST_SELECTED_SKATER_SKIN_INDEX = <selected_skin_index> 
		ENDIF 
	ENDIF 
	<id> : GetSingleTag has_multiple_skins 
	IF GotParam has_multiple_skins 
		IF GotParam first_time_in_focus 
			<id> : SetTags selected_skin_index = ( LAST_SELECTED_SKATER_SKIN_INDEX ) 
		ENDIF 
		<id> : skaterselect_skater_update_skin skins = <sub_menu> <...> 
	ELSE 
		IF ScreenElementExists id = skaterselect_sub_menu_text 
			DoScreenElementMorph { 
				id = skaterselect_sub_menu_text 
				alpha = 0.00000000000 
				time = 0.20000000298 
			} 
		ENDIF 
	ENDIF 
	SpawnScript TemporarilyDisableInput Params = { time = 60 } 
ENDSCRIPT

SCRIPT SkateshopBehaviorSpawner 
	Change LAST_SELECTED_SKATER_BEHAVIOUR = <script_name> 
	MakeSkaterGoto <script_name> 
ENDSCRIPT

SCRIPT ResetLastSkaterBehaviorStuff 
	Change LAST_SELECTED_SKATER_BEHAVIOUR = SkateshopBehavior 
	Change LAST_SELECTED_SKATER_HIDE_BOARD = 0 
ENDSCRIPT

SCRIPT load_other_skater 
	SelectCurrentSkater name = ped 
	GetCurrentSkaterProfileIndex 
	IF NOT GotParam new_default_appearance 
		IF GotParam default_appearance 
			<new_default_appearance> = <default_appearance> 
		ELSE 
			<new_default_appearance> = appearance_hawk 
		ENDIF 
	ENDIF 
	SetPlayerAppearance player = <currentSkaterProfileIndex> appearance_structure = <new_default_appearance> 
	skaterselect_handle_skater_profile_stuff <...> 
	RefreshSkaterModel profile = <currentSkaterProfileIndex> skater = 0 no_board = <no_board> 
	UpdateTrickMappings skater = 0 
ENDSCRIPT

SCRIPT skaterselect_handle_skater_profile_stuff 
	IF GotParam name 
		IF NOT ( <name> = custom ) 
			IF GotParam is_female 
				SetSkaterProfileProperty player = <currentSkaterProfileIndex> is_male 0 
			ELSE 
				SetSkaterProfileProperty player = <currentSkaterProfileIndex> is_male 1 
			ENDIF 
		ENDIF 
	ELSE 
		IF GotParam is_female 
			SetSkaterProfileProperty player = <currentSkaterProfileIndex> is_male 0 
		ELSE 
			SetSkaterProfileProperty player = <currentSkaterProfileIndex> is_male 1 
		ENDIF 
	ENDIF 
	IF GotParam new_deck_graphic 
		EditPlayerAppearance { 
			profile = <currentSkaterProfileIndex> 
			target = SetPart targetParams = { part = deck_graphic desc_id = <new_deck_graphic> } 
		} 
	ENDIF 
	IF GotParam new_board_type 
		EditPlayerAppearance { 
			profile = <currentSkaterProfileIndex> 
			target = SetPart targetParams = { part = board desc_id = <new_board_type> } 
		} 
	ENDIF 
	IF GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = board 
		Change g_current_skater_board_type = ( <desc_id> ) 
	ENDIF 
	IF GotParam tag_texture 
		SetSkaterProfileProperty player = <currentSkaterProfileIndex> tag_texture <tag_texture> 
		set_correct_graffiti_textures name = ped tag_texture = <tag_texture> 
	ENDIF 
ENDSCRIPT

SCRIPT skaterselect_skater_update_skin 
	GetTags 
	<id> : GetSingleTag selected_skin_index 
	<id> : GetSingleTag number_of_skins 
	IF ScreenElementExists id = skaterselect_sub_menu_text 
		FormatText textName = skinsMenuText "%a / %b" a = ( <selected_skin_index> + 1 ) b = <number_of_skins> 
		SetScreenElementProps { 
			id = skaterselect_sub_menu_text 
			text = <skinsMenuText> 
		} 
		DoScreenElementMorph { 
			id = skaterselect_sub_menu_text 
			alpha = 0.89999997616 
			time = 0.20000000298 
		} 
	ENDIF 
	IF GotParam selected_skin_index 
		IF ScreenElementExists id = menu_title_text 
			SetScreenElementProps { 
				id = menu_title_text 
				text = ( ( <skins> ) [ <selected_skin_index> ] . display_name ) 
			} 
		ENDIF 
		GetCurrentSkaterProfileIndex 
		SetPlayerAppearance player = <currentSkaterProfileIndex> appearance_structure = ( ( <skins> ) [ <selected_skin_index> ] . default_appearance ) 
		IF GotParam is_female 
			SetSkaterProfileProperty player = <currentSkaterProfileIndex> is_male 0 
		ELSE 
			SetSkaterProfileProperty player = <currentSkaterProfileIndex> is_male 1 
		ENDIF 
		skaterselect_handle_skater_profile_stuff currentSkaterProfileIndex = <currentSkaterProfileIndex> ( ( <skins> ) [ <selected_skin_index> ] ) 
		RefreshSkaterModel profile = <currentSkaterProfileIndex> skater = 0 no_board = <no_board> 
	ENDIF 
ENDSCRIPT

SCRIPT skaterselect_skater_change_skin 
	GetTags 
	<id> : GetSingleTag selected_skin_index 
	<id> : GetSingleTag number_of_skins 
	IF GotParam down 
		index_next_wraparound index = <selected_skin_index> max = <number_of_skins> 
	ELSE 
		IF GotParam up 
			index_previous_wraparound index = <selected_skin_index> max = <number_of_skins> 
		ENDIF 
	ENDIF 
	Change LAST_SELECTED_SKATER_SKIN_INDEX = <index> 
	<id> : SetTags selected_skin_index = <index> 
	<id> : skaterselect_skater_update_skin skins = <skins> <...> 
ENDSCRIPT

SCRIPT new_select_skater_hmenu_unfocus 
	GetTags 
	DoScreenElementMorph { 
		id = <id> 
		rgba = ( MENU_SS_SKATER_INDICATOR_UNFOCUS_COLOR ) 
		time = 0.00000000000 
	} 
ENDSCRIPT

SCRIPT skater_select_menu_add_item 
	IF GotParam skater_index 
		skater_select_menu_add_item_2 ( master_skater_list [ <skater_index> ] ) <...> 
	ELSE 
		skater_select_menu_add_item_2 <...> 
	ENDIF 
ENDSCRIPT

SCRIPT skater_select_menu_add_item_2 
	IF GotParam new_display_name 
		RemoveParameter display_name 
		display_name = <new_display_name> 
	ENDIF 
	IF GotParam is_separator 
		CreateScreenElement { 
			type = SpriteElement 
			parent = select_skater_hmenu_new 
			texture = logo_13 
			scale = 0.40000000596 
			alpha = 0.00000000000 
			rgba = ( MENU_SS_SKATER_INDICATOR_LOCKED_COLOR ) 
			not_focusable 
		} 
	ELSE 
		IF NOT GotParam new_name 
			<new_name> = <name> 
		ENDIF 
		IF GotParam no_board 
			no_board = no_board 
		ENDIF 
		IF ( <new_name> = custom ) 
			RemoveParameter display_name 
			get_custom_skater_display_name 
			pad_expand_event = { pad_expand nullscript Params = { } } 
		ELSE 
			IF GotParam new_default_appearance 
				current_appearance_struct = <new_default_appearance> 
			ELSE 
				IF GotParam default_appearance 
					current_appearance_struct = <default_appearance> 
				ELSE 
					current_appearance_struct = appearance_hawk 
				ENDIF 
			ENDIF 
			pad_expand_event = { 
				pad_expand ss_send_to_cas 
				Params = { 
					appearance_structure = <current_appearance_struct> 
					new_deck_graphic = <new_deck_graphic> 
					new_board_type = <new_board_type> 
					is_female = <is_female> 
					skins = <sub_menu> 
				} 
			} 
		ENDIF 
		<pad_up_down_event_script> = nullscript 
		<pad_up_event_params> = { } 
		<pad_down_event_params> = { } 
		IF GotParam sub_menu 
			<pad_up_down_event_script> = skaterselect_skater_change_skin 
			<pad_up_event_params> = { up skins = <sub_menu> <...> } 
			<pad_down_event_params> = { down skins = <sub_menu> <...> } 
		ENDIF 
		CreateScreenElement { 
			type = SpriteElement 
			parent = select_skater_hmenu_new 
			id = <new_name> 
			texture = logo_13 
			scale = 0.18000000715 
			alpha = 0.89999997616 
			rgba = ( MENU_SS_SKATER_INDICATOR_UNFOCUS_COLOR ) 
			just = [ center center ] 
			event_handlers = [ 
				{ focus new_select_skater_hmenu_focus Params = <...> } 
				{ unfocus new_select_skater_hmenu_unfocus } 
				{ pad_choose select_skater_hmenu_choose_real Params = <...> } 
				{ pad_up <pad_up_down_event_script> Params = <pad_up_event_params> } 
				{ pad_down <pad_up_down_event_script> Params = <pad_down_event_params> } 
				{ <pad_expand_event> } 
			] 
		} 
		IF GotParam sub_menu 
			GetArraySize ( <sub_menu> ) 
			<new_name> : SetTags number_of_skins = <array_size> 
			<new_name> : SetTags selected_skin_index = 0 
			<new_name> : SetTags has_multiple_skins = 1 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT skater_select_temp_hide 
	skater : hide 
	wait 99 
	skater : unhide 
ENDSCRIPT

SCRIPT select_skater_hmenu_choose_real 
	Change LAST_SELECTED_SKATER_MENU_ID = <new_name> 
	generic_menu_pad_choose_sound 
	launch_new_ss_menu <...> 
	printf "select_skater_hmenu_choose_real %i" i = ( LAST_SELECTED_SKATER_LIST_INDEX ) 
ENDSCRIPT

SCRIPT create_skater_select_menu_items 
	IF ScreenElementExists id = skaterselect_category_text 
		SetScreenElementProps { 
			id = skaterselect_category_text 
			text = ( ( ( SKATER_SELECT_MENUS ) [ ( LAST_SELECTED_SKATER_LIST_INDEX ) ] ) . menu_title ) 
		} 
	ENDIF 
	printf "create_skater_select_menu_items %i" i = ( LAST_SELECTED_SKATER_LIST_INDEX ) 
	CreateScreenElement { 
		type = SpriteElement 
		parent = select_skater_hmenu_new 
		id = select_skater_list_scroll_left 
		texture = left_arrow 
		scale = 0 
		just = [ center center ] 
		event_handlers = [ 
			{ focus select_skater_list_scroll_focus Params = { left } } 
		] 
	} 
	ForEachIn ( ( ( SKATER_SELECT_MENUS ) [ ( LAST_SELECTED_SKATER_LIST_INDEX ) ] ) . menu_array ) do = skater_select_menu_add_item 
	CreateScreenElement { 
		type = SpriteElement 
		parent = select_skater_hmenu_new 
		id = select_skater_list_scroll_right 
		texture = right_arrow 
		scale = 0 
		just = [ center center ] 
		event_handlers = [ 
			{ focus select_skater_list_scroll_focus Params = { right } } 
		] 
	} 
ENDSCRIPT

SCRIPT ss_send_to_cas 
	hide_select_skater_arrows 
	GetTags 
	<id> : GetSingleTag selected_skin_index 
	IF GotParam is_female 
		printf "ss_send_to_cas - is_female" 
	ENDIF 
	IF GotParam skins 
		IF GotParam selected_skin_index 
			RemoveParameter appearance_structure 
			<appearance_structure> = ( ( <skins> ) [ <selected_skin_index> ] . default_appearance ) 
			RemoveParameter is_female 
			IF StructureContains structure = ( ( <skins> ) [ <selected_skin_index> ] ) is_female 
				<is_female> = ( ( <skins> ) [ <selected_skin_index> ] . is_female ) 
			ENDIF 
			RemoveParameter new_board_type 
			<new_board_type> = ( ( <skins> ) [ <selected_skin_index> ] . new_board_type ) 
			RemoveParameter new_deck_graphic 
			<new_deck_graphic> = ( ( <skins> ) [ <selected_skin_index> ] . new_deck_graphic ) 
		ENDIF 
	ENDIF 
	IF ObjectExists id = select_skater_hmenu 
		FireEvent type = unfocus target = select_skater_hmenu 
	ENDIF 
	IF ObjectExists id = select_skater_hmenu_new 
		FireEvent type = unfocus target = select_skater_hmenu_new 
	ENDIF 
	IF ObjectExists id = stats_block_menu_anchor 
		DoScreenElementMorph { 
			id = stats_block_menu_anchor 
			alpha = 0.00000000000 
			time = 0.20000000298 
		} 
	ENDIF 
	create_snazzy_dialog_box { 
		title = #"Make Custom Skater" 
		text = #"Warning !\\nAny unsaved changes to your current Game Progress will be lost.\\nContinue ?" 
		text_dims = PAIR(400.00000000000, 0.00000000000) 
		no_bg 
		pad_back_script = generic_menu_pad_back 
		pad_back_params = { callback = ss_send_to_cas_no } 
		buttons = [ 
			{ 
				font = small text = #"Yes" 
				pad_choose_script = ss_send_to_cas_yes 
				pad_choose_params = <...> 
			} 
			{ 
				font = small text = #"No" 
				pad_choose_script = ss_send_to_cas_no 
			} 
		] 
	} 
ENDSCRIPT

SCRIPT ss_send_to_cas_yes 
	dialog_box_exit 
	SetScreenElementLock id = current_menu_anchor off 
	ResetToDefaultProfile name = custom partial = appearance 
	load_pro_skater name = custom 
	Change LAST_SELECTED_SKATER_MENU_ID = custom 
	Change LAST_SELECTED_SKATER_LIST_INDEX = 0 
	Change LAST_SELECTED_SKATER_SKIN_INDEX = 0 
	skater : SwitchOffBoard 
	edit_skater_premade_skater_choose { 
		appearance = <appearance_structure> 
	} 
	GetCurrentSkaterProfileIndex 
	IF GotParam is_female 
		SetSkaterProfileProperty player = <currentSkaterProfileIndex> is_male 0 
		SetSkaterProfileInfo player = <currentSkaterProfileIndex> Params = { voice = female1 } 
	ELSE 
		SetSkaterProfileProperty player = <currentSkaterProfileIndex> is_male 1 
		SetSkaterProfileInfo player = <currentSkaterProfileIndex> Params = { voice = male1 } 
	ENDIF 
	IF GotParam new_deck_graphic 
		EditPlayerAppearance { 
			profile = <currentSkaterProfileIndex> 
			target = SetPart targetParams = { part = deck_graphic desc_id = <new_deck_graphic> } 
		} 
	ENDIF 
	IF GotParam new_board_type 
		EditPlayerAppearance { 
			profile = <currentSkaterProfileIndex> 
			target = SetPart targetParams = { part = board desc_id = <new_board_type> } 
		} 
	ENDIF 
	skater : SwitchOnBoard 
	launch_new_select_skater_menu 
ENDSCRIPT

SCRIPT ss_send_to_cas_no 
	dialog_box_exit 
	SetScreenElementLock id = current_menu_anchor off 
	launch_new_select_skater_menu 
ENDSCRIPT

SCRIPT show_select_skater_arrows 
	skater_select_arrow_L : unhide 
	skater_select_arrow_R : unhide 
ENDSCRIPT

SCRIPT hide_select_skater_arrows 
	skater_select_arrow_L : hide 
	skater_select_arrow_R : hide 
ENDSCRIPT

SkaterSelectArrow_focus_scale = 1.00000000000 
SkaterSelectArrow_unfocus_scale = 0.80000001192 
SCRIPT SkaterSelectArrow_Script 
	Obj_GetID 
	<objId> : hide 
	<objId> : Obj_Hover Amp = 0.30000001192 Freq = 0.50000000000 
	<objId> : Obj_EnableScaling 
	<objId> : Obj_EnableAmbientLight 
	<objId> : Obj_ApplyScaling x = ( SkaterSelectArrow_unfocus_scale ) y = ( SkaterSelectArrow_unfocus_scale ) z = ( SkaterSelectArrow_unfocus_scale ) 
	<objId> : Obj_SetLightAmbientColor { 
		r = ( ( ( THUGPRO_GlobalThemeInfo ) . UNHIGHLIGHTED_TEXT_COLOR ) [ 0 ] ) 
		g = ( ( ( THUGPRO_GlobalThemeInfo ) . UNHIGHLIGHTED_TEXT_COLOR ) [ 1 ] ) 
		b = ( ( ( THUGPRO_GlobalThemeInfo ) . UNHIGHLIGHTED_TEXT_COLOR ) [ 2 ] ) 
	} 
ENDSCRIPT

SCRIPT menu_skaterselect_blink_arrow_left 
	IF ObjectExists id = skater_select_arrow_L 
		skater_select_arrow_L : Obj_ApplyScaling x = ( SkaterSelectArrow_focus_scale ) y = ( SkaterSelectArrow_focus_scale ) z = ( SkaterSelectArrow_focus_scale ) 
		skater_select_arrow_L : Obj_SetLightAmbientColor { 
			r = ( ( ( THUGPRO_GlobalThemeInfo ) . HIGHLIGHTED_TEXT_COLOR ) [ 0 ] ) 
			g = ( ( ( THUGPRO_GlobalThemeInfo ) . HIGHLIGHTED_TEXT_COLOR ) [ 1 ] ) 
			b = ( ( ( THUGPRO_GlobalThemeInfo ) . HIGHLIGHTED_TEXT_COLOR ) [ 2 ] ) 
		} 
		wait 10 frames 
		skater_select_arrow_L : Obj_ApplyScaling x = ( SkaterSelectArrow_unfocus_scale ) y = ( SkaterSelectArrow_unfocus_scale ) z = ( SkaterSelectArrow_unfocus_scale ) 
		skater_select_arrow_L : Obj_SetLightAmbientColor { 
			r = ( ( ( THUGPRO_GlobalThemeInfo ) . UNHIGHLIGHTED_TEXT_COLOR ) [ 0 ] ) 
			g = ( ( ( THUGPRO_GlobalThemeInfo ) . UNHIGHLIGHTED_TEXT_COLOR ) [ 1 ] ) 
			b = ( ( ( THUGPRO_GlobalThemeInfo ) . UNHIGHLIGHTED_TEXT_COLOR ) [ 2 ] ) 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT menu_skaterselect_blink_arrow_right 
	IF ObjectExists id = skater_select_arrow_R 
		skater_select_arrow_R : Obj_ApplyScaling x = ( SkaterSelectArrow_focus_scale ) y = ( SkaterSelectArrow_focus_scale ) z = ( SkaterSelectArrow_focus_scale ) 
		skater_select_arrow_R : Obj_SetLightAmbientColor { 
			r = ( ( ( THUGPRO_GlobalThemeInfo ) . HIGHLIGHTED_TEXT_COLOR ) [ 0 ] ) 
			g = ( ( ( THUGPRO_GlobalThemeInfo ) . HIGHLIGHTED_TEXT_COLOR ) [ 1 ] ) 
			b = ( ( ( THUGPRO_GlobalThemeInfo ) . HIGHLIGHTED_TEXT_COLOR ) [ 2 ] ) 
		} 
		wait 10 frames 
		skater_select_arrow_R : Obj_ApplyScaling x = ( SkaterSelectArrow_unfocus_scale ) y = ( SkaterSelectArrow_unfocus_scale ) z = ( SkaterSelectArrow_unfocus_scale ) 
		skater_select_arrow_R : Obj_SetLightAmbientColor { 
			r = ( ( ( THUGPRO_GlobalThemeInfo ) . UNHIGHLIGHTED_TEXT_COLOR ) [ 0 ] ) 
			g = ( ( ( THUGPRO_GlobalThemeInfo ) . UNHIGHLIGHTED_TEXT_COLOR ) [ 1 ] ) 
			b = ( ( ( THUGPRO_GlobalThemeInfo ) . UNHIGHLIGHTED_TEXT_COLOR ) [ 2 ] ) 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT create_new_select_skater_menu 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	IF ObjectExists id = current_menu 
		DestroyScreenElement id = current_menu 
	ENDIF 
	destroy_menu_background_title 
	show_select_skater_arrows 
	CreateScreenElement { 
		type = ContainerElement 
		parent = root_window 
		id = select_skater_anchor 
		pos = PAIR(320.00000000000, 240.00000000000) 
		dims = PAIR(640.00000000000, 480.00000000000) 
	} 
	AssignAlias id = select_skater_anchor alias = current_menu_anchor 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		texture = top_gradient 
		id = skaterselect_indicator_gradient 
		alpha = 0.80000001192 
		scale = PAIR(90.00000000000, 10.00000000000) 
		pos = PAIR(0.00000000000, 0.00000000000) 
		just = [ left top ] 
		rgba = [ 0 0 0 128 ] 
		z_priority = -100 
	} 
	IF GameModeEquals is_net 
		SetAllStats value = 10 
		targetOffset = VECTOR(0.00000000000, 60.00000000000, 50.00000000000) 
		positionOffset = VECTOR(0.00000000000, 10.00000000000, 50.00000000000) 
		KillSkaterCamAnim all 
		PlaySkaterCamAnim { 
			skater = 0 
			name = SkaterSelect_CAM 
			targetID = TRG_DummySkater 
			play_hold 
			targetOffset = <targetOffset> 
			positionOffset = <positionOffset> 
			frames = 1 
			virtual_cam 
		} 
		TRG_DummySkater : Obj_GetPosition 
		SetActiveCamera id = SkaterSelect_CAM 
		create_menu_background_title { title = "" bg_just = right_nobg title_pos = PAIR(320.00000000000, 370.00000000000) title_text_just = [ center , center ] } 
		select_skater_hmenu_anchor_just = [ center center ] 
		current_menu_anchor_pos = PAIR(320.00000000000, 34.00000000000) 
	ELSE 
		SetAllStats value = 0 
		KillSkaterCamAnim all 
		PlaySkaterCamAnim name = skateshop_startcam play_hold 
		select_skater_hmenu_anchor_just = [ left center ] 
		current_menu_anchor_pos = PAIR(-50.00000000000, 34.00000000000) 
	ENDIF 
	CreateScreenElement { 
		type = ContainerElement 
		parent = current_menu_anchor 
		id = select_skater_hmenu_anchor 
		pos = <current_menu_anchor_pos> 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = select_skater_hmenu_anchor 
		id = skaterselect_category_text 
		pos = PAIR(2.00000000000, -22.00000000000) 
		scale = 0.20000000298 
		rgba = ( ( THUGPRO_GlobalThemeInfo ) . ALT_COLOR ) 
		just = <select_skater_hmenu_anchor_just> 
		font = bebas 
		text = "PRO SKATERS" 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = select_skater_hmenu_anchor 
		id = skaterselect_sub_menu_text 
		pos = PAIR(2.00000000000, 20.00000000000) 
		scale = 0.18000000715 
		alpha = 0.00000000000 
		rgba = ( ( THUGPRO_GlobalThemeInfo ) . BG_PARTS_COLOR ) 
		just = <select_skater_hmenu_anchor_just> 
		font = bebas 
		text = "0 / 0" 
	} 
	IF NOT GameModeEquals is_net 
		CreateScreenElement { 
			type = SpriteElement 
			parent = select_skater_hmenu_anchor 
			id = skaterselect_snaz_icon 
			texture = ( ( THUGPRO_GlobalThemeInfo ) . SNAZ_ICON_TEXTURE ) 
			rgba = ( ( THUGPRO_GlobalThemeInfo ) . ALT_COLOR ) 
			pos = PAIR(-20.00000000000, -10.00000000000) 
			just = <select_skater_hmenu_anchor_just> 
			scale = 0.40000000596 
			alpha = 0.40000000596 
		} 
	ENDIF 
	CreateScreenElement { 
		type = HMenu 
		parent = select_skater_hmenu_anchor 
		id = select_skater_hmenu_new 
		pos = PAIR(0.00000000000, 0.00000000000) 
		just = <select_skater_hmenu_anchor_just> 
		internal_just = <select_skater_hmenu_anchor_just> 
		padding_scale = 0.20000000298 
	} 
	bg_color = ( ( THUGPRO_GlobalThemeInfo ) . BG_PARTS_COLOR ) 
	AssignAlias id = select_skater_hmenu_new alias = current_menu 
	create_skater_select_menu_items 
	SetScreenElementProps { 
		id = select_skater_hmenu_new 
		event_handlers = [ 
			{ pad_left menu_skaterselect_blink_arrow_left Params = { } } 
			{ pad_right menu_skaterselect_blink_arrow_right Params = { } } 
			{ pad_left generic_menu_up_or_down_sound } 
			{ pad_right generic_menu_up_or_down_sound } 
			{ pad_back generic_menu_pad_back Params = { callback = <callback> <...> } } 
			{ pad_option ss_overwrite_warning Params = { } } 
			{ pad_option generic_menu_pad_choose_sound } 
			{ pad_alt cas_skater_left Params = { } } 
			{ pad_alt2 cas_skater_right Params = { } } 
			{ pad_l2 select_skater_list_scroll_focus Params = { left } } 
			{ pad_r2 select_skater_list_scroll_focus Params = { right } } 
			{ pad_l2 generic_menu_scroll_sideways_sound } 
			{ pad_r2 generic_menu_scroll_sideways_sound } 
		] 
	} 
	create_helper_text helper_text_skater_select helper_text_pos = PAIR(320.00000000000, 458.00000000000) 
	IF NOT GameModeEquals is_net 
		create_thugpro_style_test_menu_stats 
	ENDIF 
	RemoveParameter display_name 
	get_current_skater_display_name 
	IF ScreenElementExists id = menu_title_text 
		SetScreenElementProps { 
			id = menu_title_text 
			text = <display_name> 
		} 
	ENDIF 
	FireEvent type = focus target = select_skater_hmenu_new data = { child_id = ( LAST_SELECTED_SKATER_MENU_ID ) } 
ENDSCRIPT

SCRIPT select_skater_list_scroll_spawned 
	IF GotParam left 
		FireEvent type = unfocus target = select_skater_hmenu_new 
		destroy_current_skater_select_list 
		array_previous_wraparound index = ( LAST_SELECTED_SKATER_LIST_INDEX ) array = ( SKATER_SELECT_MENUS ) 
		Change LAST_SELECTED_SKATER_LIST_INDEX = <index> 
		printf "new list index = %i" i = ( <index> ) 
		create_skater_select_menu_items 
		wait 3 frames 
		skater_select_menu_focus_first_or_last last 
	ELSE 
		IF GotParam right 
			FireEvent type = unfocus target = select_skater_hmenu_new 
			destroy_current_skater_select_list 
			array_next_wraparound index = ( LAST_SELECTED_SKATER_LIST_INDEX ) array = ( SKATER_SELECT_MENUS ) 
			Change LAST_SELECTED_SKATER_LIST_INDEX = <index> 
			printf "new list index = %i" i = ( <index> ) 
			create_skater_select_menu_items 
			wait 3 frames 
			skater_select_menu_focus_first_or_last first 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT select_skater_list_scroll_focus 
	skater : hide 
	FireEvent type = unfocus target = select_skater_hmenu_new 
	SpawnScript select_skater_list_scroll_spawned Params = <...> 
ENDSCRIPT

SCRIPT skater_select_menu_focus_first_or_last 
	IF ScreenElementExists id = select_skater_hmenu_new 
		IF GetScreenElementChildren id = select_skater_hmenu_new 
			IF GotParam first 
				FireEvent type = focus target = select_skater_hmenu_new data = { child_id = ( <children> [ 1 ] ) } 
				printf "focus first skater %s" s = ( <children> [ 1 ] ) 
			ELSE 
				IF GotParam last 
					GetArraySize <children> 
					last_index = ( ( <array_size> ) - 2 ) 
					FireEvent type = focus target = select_skater_hmenu_new data = { child_id = ( <children> [ <last_index> ] ) } 
					printf "focus last skater %s" s = ( <children> [ <last_index> ] ) 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT destroy_current_skater_select_list 
	IF ScreenElementExists id = select_skater_hmenu_new 
		IF GetScreenElementChildren id = select_skater_hmenu_new 
			GetArraySize <children> 
			index = 0 
			BEGIN 
				IF ScreenElementExists id = ( <children> [ <index> ] ) 
					DestroyScreenElement id = ( <children> [ <index> ] ) 
				ENDIF 
				index = ( <index> + 1 ) 
			REPEAT <array_size> 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT do_arrow_effect2 
	DoMorph scale = 0.80000001192 alpha = 0.89999997616 time = 0.10000000149 
	DoMorph scale = 0.60000002384 alpha = 0.60000002384 time = 0.10000000149 
ENDSCRIPT

SCRIPT main_menu_startup_wait_and_signal_clear 
	Change dont_unhide_loading_screen = 1 
	wait 10 gameframes 
	Change dont_unhide_loading_screen = 0 
	Change main_menu_ok_to_go = 1 
ENDSCRIPT

SCRIPT main_menu_wait_until_all_clear 
	BEGIN 
		IF ObjectExists id = SkaterCam0 
			IF ObjectExists id = skater 
				IF LocalSkaterExists 
					IF IsTrue main_menu_ok_to_go 
						BREAK 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
		wait 1 gameframe 
	REPEAT 
ENDSCRIPT

SCRIPT launch_new_ss_menu 
	dialog_box_exit 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	create_new_ss_menu <...> 
ENDSCRIPT

SCRIPT new_ss_menu_exit 
	default_skateshop_menu_cleanup 
	IF GotParam new_menu_script 
		<new_menu_script> <...> 
	ENDIF 
ENDSCRIPT

SCRIPT create_new_ss_menu 
	hide_select_skater_arrows 
	orient_skateshop_skater 
	cas_remove_ped_stuff_from_skater 
	KillSkaterCamAnim all 
	PlaySkaterCamAnim name = skateshop_startcam play_hold 
	IF GotParam change_gamemode 
		<change_gamemode> 
	ENDIF 
	GetCurrentSkaterProfileIndex 
	GetGameMode 
	SWITCH <GameMode> 
		CASE career 
			<menu_title> = "Story Mode" 
		CASE freeskate 
			<menu_title> = "Freeskate" 
		CASE net 
			<menu_title> = "THUGPRO Online" 
			<callback> = select_network_play_multi 
			<change_gamemode> = change_gamemode_net 
		CASE singlesession 
			Change in_server_options = 0 
			<menu_title> = "Freeskate" 
			<change_gamemode> = change_gamemode_singlesession 
		CASE creategoals 
			<menu_title> = #"Create Goals" 
		CASE classic 
			<menu_title> = #"Classic Mode" 
		DEFAULT 
			<menu_title> = #"Skateshop" 
	ENDSWITCH 
	IF ( launch_to_createatrick = 1 ) 
		<menu_title> = #"Create Tricks" 
	ENDIF 
	kill_start_key_binding 
	thugpro_menu_create { 
		menu_name = ss 
		menu_title = <menu_title> 
		menu_style = MENU_STYLE_RIGHT 
		helper_text = generic_helper_text 
		pad_back_script = launch_new_select_skater_menu 
		pad_back_params = { callback = <callback> change_gamemode = <change_gamemode> } 
		show_description_panel 
		show_gradient 
		boxed 
	} 
	GetCurrentSkaterProfileIndex 
	IF GameModeEquals is_net 
		IF ( network_connection_type = internet ) 
			<connection_extra_text> = "INTERNET" 
			make_thugpro_menu_item { 
				text = "Ready" 
				id = ss_play_level 
				pad_choose_script = spawn_lobby_list 
			} 
		ELSE 
			<connection_extra_text> = "LAN" 
			make_thugpro_menu_item { 
				text = "Ready" 
				id = ss_play_level 
				pad_choose_script = new_ss_menu_exit 
				pad_choose_params = { new_menu_script = select_lan_play } 
			} 
		ENDIF 
		make_thugpro_menu_item { 
			text = "Connection" 
			extra_text = <connection_extra_text> 
			id = ss_connection 
			not_focusable 
		} 
		GetPreferenceString pref_type = network network_id 
		make_thugpro_menu_item { 
			text = "Player Name" 
			extra_text = <ui_string> 
			id = menu_player_name 
			pad_choose_script = new_ss_menu_exit 
			pad_choose_params = { 
				new_menu_script = launch_onscreen_keyboard_from_net_options_menu 
				title = "PLAYER NAME" 
				field = "network_id" 
				text = <ui_string> 
				min_length = 1 
				max_length = 15 
			} 
		} 
		make_thugpro_menu_item { 
			text = "Edit Taunts" 
			id = network_option_taunts 
			pad_choose_script = create_taunt_options_menu 
		} 
	ELSE 
		make_thugpro_menu_item { 
			text = "Select Level" 
			id = ss_play_level 
			pad_choose_script = new_ss_menu_exit 
			pad_choose_params = { new_menu_script = launch_level_select_menu <...> } 
		} 
	ENDIF 
	get_current_skater_name 
	IF NOT ( <name> = custom ) 
		<not_focusable> = not_focusable 
	ENDIF 
	IF GameModeEquals is_net 
		SetAllStats value = 10 
	ENDIF 
	make_thugpro_menu_item { 
		text = "Edit Appearance" 
		pad_choose_script = pre_cas_menu_exit 
		pad_choose_params = { new_menu_script = skateshop_create_cas_menu from_ss_menu } 
		<not_focusable> 
	} 
	IF NOT GameModeEquals is_net 
		make_thugpro_menu_item { 
			text = "Edit Stats" 
			pad_choose_script = create_thugpro_style_test_menu_stats 
			pad_choose_params = { 
				callback_script = launch_new_ss_menu 
				edit 
			} 
		} 
	ENDIF 
	make_thugpro_menu_item { 
		text = "Edit Tricks" 
		pad_choose_script = new_ss_menu_exit 
		pad_choose_params = { 
			new_menu_script = create_edit_tricks_menu 
			hide_bg = 1 
			from_ss_menu 
		} 
	} 
	IF NOT GameModeEquals is_net 
		get_difficulty_level_text 
		make_thugpro_menu_item { 
			text = "Difficulty" 
			description_text = "Difficulty affects how easy tricks are to land" 
			extra_text = <difficulty_level_text> 
			option_arrows pad_choose 
			option_arrows_callback = option_menu_change_difficulty 
		} 
	ENDIF 
	make_thugpro_menu_item { 
		text = "Save Skater" 
		pad_choose_script = new_ss_menu_exit 
		description_text = "Custom skater appearance, tricks and stats" 
		pad_choose_params = { 
			new_menu_script = launch_skater_select_menu_save_game_sequence 
			callback_script = launch_new_ss_menu 
		} 
	} 
	make_thugpro_menu_item { 
		text = "Load Skater" 
		pad_choose_script = new_ss_menu_exit 
		description_text = "Custom skater appearance, tricks and stats" 
		pad_choose_params = { 
			new_menu_script = launch_skater_select_menu_load_game_sequence 
			callback_script = launch_new_ss_menu 
		} 
	} 
	IF GameModeEquals is_net 
		make_thugpro_menu_item { 
			text = "Save Online Prefs" 
			id = network_option_save 
			description_text = "Player name and server options" 
			pad_choose_script = launch_save_network_settings 
		} 
		make_thugpro_menu_item { 
			text = "Load Online Prefs" 
			description_text = "Player name and server options" 
			id = network_option_load 
			pad_choose_script = maybe_load_net_settings 
		} 
	ENDIF 
	thugpro_menu_finalize <...> 
ENDSCRIPT

SCRIPT get_difficulty_level_text 
	IF NOT GotParam difficulty_level 
		GoalManager_GetDifficultyLevel 
	ENDIF 
	SWITCH <difficulty_level> 
		CASE 0 
			RETURN difficulty_level_text = "EASY" 
		CASE 2 
			RETURN difficulty_level_text = "SICK" 
		DEFAULT 
			RETURN difficulty_level_text = "NORMAL" 
	ENDSWITCH 
ENDSCRIPT

SCRIPT option_menu_change_difficulty 
	GetTags 
	GoalManager_GetDifficultyLevel 
	IF GotParam right 
		index_next_wraparound_2 { index = <difficulty_level> min = 0 max = 2 } 
	ELSE 
		index_previous_wraparound_2 { index = <difficulty_level> min = 0 max = 2 } 
	ENDIF 
	GoalManager_SetDifficultyLevel <new_index> 
	GoalManager_UninitializeAllGoals 
	GoalManager_InitializeAllGoals 
	get_difficulty_level_text { 
		difficulty_level = <new_index> 
	} 
	thugpro_menu_item_update_extra_text { 
		id = <id> 
		text = <difficulty_level_text> 
	} 
ENDSCRIPT

SCRIPT main_menu_exit_game 
	default_skateshop_menu_cleanup 
	menu_confirm_quit { 
		yes_script = quit_game 
		back_script = cancel_quit_game 
		no_script = cancel_quit_game 
	} 
ENDSCRIPT

SCRIPT quit_game_clean 
	dialog_box_exit 
	QuitGame 
ENDSCRIPT

SCRIPT quit_game 
	dialog_box_exit 
	FadeToBlack on time = 0.50000000000 alpha = 1.00000000000 
	wait 1.50000000000 seconds 
	QuitGame 
ENDSCRIPT

SCRIPT cancel_quit_game 
	dialog_box_exit 
	create_main_menu 
ENDSCRIPT

SCRIPT create_setup_options_menu 
	default_skateshop_menu_cleanup 
	thugpro_menu_create { 
		menu_name = game_options 
		menu_title = "Options" 
		menu_style = MENU_STYLE_LEFT 
		helper_text = generic_helper_text 
		pad_back_script = create_main_menu 
		show_description_panel 
		show_gradient 
	} 
	thugpro_menu_camera_create { 
		cameraName = CAM_OPTIONS_MENU 
		targetName = CAM_T_OPTIONS_MENU 
		targetPosition = VECTOR(-2960.00000000000, 42.00000000000, 890.00000000000) 
		positionOffset = VECTOR(-90.00000000000, 30.00000000000, 100.00000000000) 
	} 
	make_thugpro_menu_item { 
		text = "General Options" 
		id = menu_general_options 
		pad_choose_script = create_general_options_menu 
		child_texture = icon_general 
	} 
	make_thugpro_menu_item { 
		text = "Control Options" 
		id = menu_control_options 
		pad_choose_script = create_control_setup_menu 
		child_texture = icon_gamepad 
	} 
	make_thugpro_menu_item { 
		text = "Display Options" 
		id = menu_display_options 
		pad_choose_script = create_predisplay_options_menu 
		child_texture = icon_screen 
	} 
	make_thugpro_menu_item { 
		text = "Sound Options" 
		id = menu_sound_options 
		pad_choose_script = launch_sound_options_menu 
		child_texture = icon_audio 
	} 
	make_thugpro_menu_item { 
		text = "Music Options" 
		id = menu_music_optons 
		pad_choose_script = create_music_options_menu 
		child_texture = icon_audio 
	} 
	make_thugpro_menu_item { text = "" not_focusable } 
	make_thugpro_menu_item { 
		text = "Save Skater" 
		id = menu_save_game 
		pad_choose_script = launch_options_menu_save_game_sequence 
		child_texture = icon_save 
	} 
	make_thugpro_menu_item { 
		text = "Load Skater" 
		id = menu_load_game 
		pad_choose_script = launch_options_menu_load_game_sequence 
		child_texture = icon_load 
	} 
	thugpro_menu_finalize <...> 
ENDSCRIPT


