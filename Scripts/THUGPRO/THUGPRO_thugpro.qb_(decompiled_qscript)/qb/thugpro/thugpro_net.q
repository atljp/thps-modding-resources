
RejoinNextGame = 0 
JoinedGameInProgress = 0 
JoinedAsObserver = 0 
THUGPRO_ObserveOn = 0 
THUGPRO_ObserveState_Running = 0 
observe_overview_cam_state = 0 
observe_overview_cam_mode = 0 
SCRIPT THUGPRO_RejoinNextGame 
	IF GotParam FromPauseMenu 
		THUGPRO_ObserveDestroyPauseMenu 
	ENDIF 
	Change RejoinNextGame = 1 
ENDSCRIPT

SCRIPT THUGPRO_ObserveMode 
	MORTEN_DUMP_OBSERVE_MODE_DATA 
	IF GotParam on 
		IF LocalSkaterExists 
			IF Skater : OnLip 
				RETURN 
			ENDIF 
		ENDIF 
	ENDIF 
	IF GotParam FromPauseMenu 
		THUGPRO_ObserveDestroyPauseMenu 
	ENDIF 
	IF GotParam off 
		IF IsTrue AlreadyEndedRun 
			Change THUGPRO_ObserveOn = 1 
			RETURN 
		ENDIF 
		THUGPRO_ClearAllObserveValues 
		IF ScreenElementExists id = observe_input_handler 
			DestroyScreenElement id = observe_input_handler 
		ENDIF 
		IF GameModeEquals is_lobby 
			ExitSurveyorMode 
			MakeSkaterGoto THUGPRO_EnablePlayerInput 
			IF LocalSkaterExists 
				IF NOT Skater : Walking 
					ResetPhysics 
				ELSE 
					ResetPhysics Walk 
				ENDIF 
			ENDIF 
		ELSE 
			IF IsTrue RejoinNextGame 
				ExitSurveyorMode 
				MakeSkaterGoto THUGPRO_EnablePlayerInput 
			ENDIF 
		ENDIF 
		Change THUGPRO_ObserveOn = 0 
	ELSE 
		IF GotParam on 
			thugpro_observe_overview off 
			IF LocalSkaterExists 
				IF Skater : Obj_FlagSet FLAG_SKATER_DROPPING_IN 
					Wait 1 second 
				ENDIF 
				IF Skater : IsInBail 
					Skater : ReturnBoardToSkater 
				ENDIF 
				IF THUGPRO_UberFriggedThisFrame 
					ResetSkaters 
				ENDIF 
				MakeSkaterGoto THUGPRO_DisablePlayerInput 
				SlowSkaterToStop_NoBrake 
				IF NOT GameModeEquals is_lobby 
					Change AlreadyEndedRun = 1 
					FireEvent type = EndOfRunDone 
					EndOfRunDone 
				ENDIF 
			ENDIF 
			Change THUGPRO_ObserveOn = 1 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT THUGPRO_ObserveDestroyPauseMenu 
	exit_pause_menu menu_id = pause_menu 
	IF ScreenElementExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	destroy_menu_background_title 
ENDSCRIPT

SCRIPT THUGPRO_ClearAllObserveValues 
	thugpro_observe_hud_set_visible 
	Change THUGPRO_ObserveOn = 0 
	Change observe_overview_cam_state = 0 
	Change observe_overview_cam_mode = 0 
	THUGPROResetViewer 
	IF NOT GotParam quit 
		THUGPRO_ObserveFunctionCall func = ObserveSelf 
		KillSkaterCamAnim all 
		thugpro_observe_overview_cam_toggle_objects unhide 
		restore_skater_camera 
	ENDIF 
	unhide_special_meter 
	update_all_player_names 
ENDSCRIPT

SCRIPT THUGPRO_ObserveState 
ENDSCRIPT

SCRIPT THUGPRO_ObserveBail 
	IF Obj_FlagSet FLAG_SKATER_DROPPING_IN 
		Wait 1 second 
	ENDIF 
	IF IsInBail 
		ReturnBoardToSkater 
	ENDIF 
	SlowSkaterToStop 
ENDSCRIPT

SCRIPT create_observe_menu 
	MORTEN_DUMP_OBSERVE_MODE_DATA 
	IF NOT IsTrue JoinedAsObserver 
		IF NOT IsTrue JoinedGameInProgress 
			IF NOT IsSurveying 
				IF NOT IsTrue THUGPRO_ObserveOn 
					edmsg2 "\\c2BOOOOO! THUGPRO_ObserveOn == FALSE" 
					THUGPRO_ClearAllObserveValues 
					RETURN 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	reset_exit_pause_menu_delay 
	IF ScreenElementExists id = host_options_menu 
		RETURN 
	ENDIF 
	IF ScreenElementExists id = rankings_anchor 
		RETURN 
	ENDIF 
	IF ScreenElementExists id = observe_input_handler 
		RETURN 
	ENDIF 
	edmsg2 "\\c6create_observe_menu" 
	IF ScreenElementExists id = current_menu_anchor 
		IF ScreenElementExists id = keyboard_anchor 
			IF ScreenElementExists id = keyboard_bg_anchor 
				DestroyScreenElement id = current_menu_anchor 
			ENDIF 
		ELSE 
			DestroyScreenElement id = current_menu_anchor 
		ENDIF 
	ENDIF 
	IF ScreenElementExists id = current_menu 
		DestroyScreenElement id = current_menu 
	ENDIF 
	destroy_menu_background_title 
	CreateScreenElement { 
		id = observe_input_handler 
		parent = root_window 
		type = ContainerElement 
		pos = PAIR(0.00000000000, 0.00000000000) 
		event_handlers = [ 
			{ pad_left thugpro_observe_prev params = { } } 
			{ pad_right thugpro_observe_next params = { } } 
			{ pad_circle thugpro_observe_prev params = { } } 
			{ pad_choose thugpro_observe_next params = { } } 
			{ pad_expand thugpro_observe_overview params = { } } 
			{ pad_L3 thugpro_observe_toggle_hud params = { } } 
		] 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = observe_input_handler 
		id = menu_obs_player_name 
		text = "" 
		font = testtitle 
		scale = 1.00000000000 
		pos = PAIR(320.00000000000, 380.00000000000) 
		alpha = 1.00000000000 
		just = [ center center ] 
	} 
	RunScriptOnScreenElement id = menu_obs_player_name do_obs_player_name_update 
	pause_menu_gradient off 
	IF ObjectExists id = helper_text_anchor 
		DestroyScreenElement id = helper_text_anchor 
	ENDIF 
	thugpro_observe_menu_refresh_helper_text 
	Wait 4 frames 
	FireEvent type = focus target = observe_input_handler 
	restore_start_key_binding 
ENDSCRIPT

SCRIPT do_obs_player_name_update 
	BEGIN 
		IF NOT IsTrue observe_overview_cam_state 
			THUGPRO_ObserveFunctionCall func = GetCurrentPlayerName 
			IF GotParam player_name 
				thugpro_observe_menu_set_display_text text = <player_name> 
			ENDIF 
		ENDIF 
		Wait 30 gameframe 
	REPEAT 
ENDSCRIPT

SCRIPT thugpro_observe_menu_refresh_helper_text 
	hide_special_meter 
	viewer_enabled = 0 
	camera_toggle_enabled = 0 
	IF ( ( userselect_index ) = 0 ) 
		camera_toggle_enabled = 1 
	ENDIF 
	IF ( ( userselect_index ) = 2 ) 
		viewer_enabled = 1 
	ENDIF 
	IF ( ( observe_overview_cam_state ) = 1 ) 
		viewer_enabled = 0 
		camera_toggle_enabled = 0 
	ENDIF 
	helper_text_console = 0 
	helper_text_pc = 0 
	IF ( ( GLOBAL_CtrlLayout ) = 0 ) 
		helper_text_pc = 1 
		helper_text_console = 0 
	ELSE 
		helper_text_console = 1 
		helper_text_pc = 0 
	ENDIF 
	IF ScreenElementExists id = observe_input_handler 
		create_helper_text { 
			parent = observe_input_handler 
			anchor_id = observe_helper_text_anchor 
			helper_pos = PAIR(320.00000000000, 464.00000000000) 
			helper_text_elements = [ 
				{ text = "\\b6/\\b5 = Cycle Cameras" } 
				{ enabled = <helper_text_pc> text = "\\m1 = Toggle Camera Modes" } 
				{ enabled = <helper_text_console> text = "\\b0 = Toggle Camera Modes" } 
				{ enabled = <viewer_enabled> text = "\\b9 = Detach Camera" } 
				{ enabled = <camera_toggle_enabled> text = "\\b9 = Player Camera Angle" } 
				{ enabled = <helper_text_pc> text = "\\mq = Toggle HUD" } 
				{ enabled = <helper_text_console> text = "\\bk = Toggle HUD" } 
			] 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_observe_menu_set_display_text 
	IF NOT GotParam text 
		text = "" 
	ENDIF 
	IF ObjectExists id = menu_obs_player_name 
		SetScreenElementProps { 
			id = menu_obs_player_name 
			text = <text> 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_set_overview_cam_active 
	THUGPROResetViewer 
	THUGPRO_ObserveFunctionCall func = GetSceneCenterPos 
	GetLevelStructureName 
	IF StructureContains structure = <level_structure_name> overview_cam_zoom 
		<pos> = ( <pos> - ( <level_structure_name> . overview_cam_zoom ) ) 
	ENDIF 
	IF StructureContains structure = <level_structure_name> overview_cam_pos 
		<pos> = ( <level_structure_name> . overview_cam_pos ) 
	ENDIF 
	IF StructureContains structure = <level_structure_name> overview_cam_angle 
		<angle> = ( <level_structure_name> . overview_cam_angle ) 
	ENDIF 
	thugpro_observe_overview_cam_toggle_objects hide 
	Overview_Cam01 : Obj_SetPosition Position = <pos> 
	Overview_Cam01 : Obj_SetOrientation y = <angle> x = 90 
	SetActiveCamera id = Overview_Cam01 
	Change observe_overview_cam_state = 1 
ENDSCRIPT

SCRIPT thugpro_observe_overview_cam_toggle_objects 
	GetLevelStructureName 
	IF StructureContains structure = <level_structure_name> overview_cam_hide_objects 
		GetArraySize ( <level_structure_name> . overview_cam_hide_objects ) 
		IF GotParam hide 
			index = 0 
			BEGIN 
				Invisible name = ( ( <level_structure_name> . overview_cam_hide_objects ) [ <index> ] ) 
				index = ( <index> + 1 ) 
			REPEAT <array_size> 
		ELSE 
			IF GotParam unhide 
				index = 0 
				BEGIN 
					Visible name = ( ( <level_structure_name> . overview_cam_hide_objects ) [ <index> ] ) 
					index = ( <index> + 1 ) 
				REPEAT <array_size> 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_observe_viewer_fov 
	printf "thugpro_observe_viewer_fov" 
	IF IsTrue view_mode 
		IF GotParam up 
			printf "UP" 
			toggle_camera_fov { right no_menu } 
		ELSE 
			printf "down" 
			toggle_camera_fov { left no_menu } 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_observe_name_test 
ENDSCRIPT

thugpro_observe_hud_visible = 1 
SCRIPT thugpro_observe_toggle_hud 
	IF ( thugpro_observe_hud_visible ) 
		thugpro_observe_hud_set_invisible 
	ELSE 
		thugpro_observe_hud_set_visible 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_observe_hud_set_visible 
	IF NOT ScreenElementExists id = rankings_anchor 
		show_all_hud_items 
	ENDIF 
	Change thugpro_observe_hud_visible = 1 
	IF ObjectExists id = root_window 
		DoScreenElementMorph { 
			id = root_window 
			scale = 1 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_observe_hud_set_invisible 
	hide_all_hud_items 
	Change thugpro_observe_hud_visible = 0 
	IF ObjectExists id = root_window 
		DoScreenElementMorph { 
			id = root_window 
			scale = 0 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT MORTEN_DUMP_OBSERVE_MODE_DATA 
ENDSCRIPT

SCRIPT thugpro_observe_overview 
	MORTEN_DUMP_OBSERVE_MODE_DATA 
	IF GotParam off 
		Change observe_overview_cam_state = 1 
	ENDIF 
	IF IsTrue observe_overview_cam_state 
		thugpro_observe_overview_cam_toggle_objects unhide 
		restore_skater_camera 
		THUGPRO_ObserveFunctionCall func = RefreshCamera 
		Change observe_overview_cam_state = 0 
		Change observe_overview_cam_mode = 0 
	ELSE 
		thugpro_set_overview_cam_active 
		thugpro_observe_menu_set_display_text text = "overview" 
	ENDIF 
	update_all_player_names 
	thugpro_observe_menu_refresh_helper_text 
ENDSCRIPT

SCRIPT thugpro_observe_overview_cam_update 
	IF IsTrue observe_overview_cam_state 
		SWITCH ( observe_overview_cam_mode ) 
			CASE 0 
				SetActiveCamera id = Overview_Cam01 
			CASE 1 
				observe_overview_cam_view_flag flag_name = TRG_Flag_Red 
			CASE 2 
				observe_overview_cam_view_flag flag_name = TRG_Flag_Blue 
			CASE 3 
				observe_overview_cam_view_flag flag_name = TRG_Flag_Green 
			CASE 4 
				observe_overview_cam_view_flag flag_name = TRG_Flag_Yellow 
			CASE 5 
				thugpro_observe_the_crown 
			DEFAULT 
				Change observe_overview_cam_mode = 0 
				SetActiveCamera id = Overview_Cam01 
		ENDSWITCH 
	ENDIF 
ENDSCRIPT

SCRIPT observe_overview_cam_view_flag 
	IF GotParam object_name 
		IF ObjectExists id = <object_name> 
			<object_name> : Obj_GetPosition 
			Overview_Cam02 : Obj_SetPosition Position = ( <pos> + VECTOR(0.00000000000, 100.00000000000, 0.00000000000) ) 
			SetActiveCamera id = Overview_Cam02 
		ENDIF 
	ELSE 
		IF NodeExists <flag_name> 
			IF IsAlive name = <flag_name> 
				edmsg2 "flag_name = %a" a = <flag_name> 
				<flag_name> : Obj_GetPosition 
				Overview_Cam02 : Obj_SetPosition Position = ( <pos> + VECTOR(0.00000000000, 100.00000000000, 0.00000000000) ) 
				SetActiveCamera id = Overview_Cam02 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT change_observe_overview_cam_mode 
	IF GotParam prev 
		IF ( observe_overview_cam_mode = 0 ) 
			Change observe_overview_cam_mode = 8 
		ELSE 
			Change observe_overview_cam_mode = ( ( observe_overview_cam_mode ) - 1 ) 
		ENDIF 
	ELSE 
		IF ( observe_overview_cam_mode = 8 ) 
			Change observe_overview_cam_mode = 0 
		ELSE 
			Change observe_overview_cam_mode = ( ( observe_overview_cam_mode ) + 1 ) 
		ENDIF 
	ENDIF 
	thugpro_observe_overview_cam_update 
ENDSCRIPT

SCRIPT thugpro_observe_next 
	IF NOT IsTrue view_mode 
		IF IsTrue observe_overview_cam_state 
			change_observe_overview_cam_mode next 
		ELSE 
			THUGPRO_ObserveFunctionCall func = ObserveNextPlayer 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_observe_prev 
	IF NOT IsTrue view_mode 
		IF IsTrue observe_overview_cam_state 
			change_observe_overview_cam_mode prev 
		ELSE 
			THUGPRO_ObserveFunctionCall func = ObservePrevPlayer 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_observe_leader 
	IF NOT IsTrue view_mode 
		THUGPRO_ObserveFunctionCall func = ObserveLeader 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_observe_the_crown 
ENDSCRIPT

SCRIPT thugpro_observe_king 
	IF THUGPRO_ObserveFunctionCall func = ObserveKing 
	ELSE 
		observe_overview_cam_view_flag object_name = crown_object 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_observe_crown 
	observe_overview_cam_view_flag object_name = crown_object 
ENDSCRIPT

SCRIPT thugpro_observe_self 
	IF NOT IsTrue view_mode 
		THUGPRO_ObserveFunctionCall func = ObserveSelf 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_observe_skater_name 
	exit_pause_menu 
	create_onscreen_keyboard keyboard_done_script = thugpro_try_observe_skater keyboard_title = "skater name" min_length = 4 max_length = 15 text = "" 
	pause_menu_gradient off 
ENDSCRIPT

SCRIPT thugpro_try_observe_skater 
	IF ObjectExists id = keyboard_current_string 
		GetTextElementString id = keyboard_current_string 
		FormatText TextName = PlayerName "%s" s = <string> 
		destroy_onscreen_keyboard 
		THUGPRO_ObserveFunctionCall func = ObservePlayerByPlayerName PlayerName = <PlayerName> 
	ENDIF 
	create_observe_menu 
ENDSCRIPT

SCRIPT test_projectile_SettleScript 
	test_projectile_OBJID : die 
ENDSCRIPT

SCRIPT test_spawn_projectile 
	IF IsTrue view_mode 
		viewer_cam : Obj_GetPosition 
		viewer_cam : Obj_GetOrientation 
	ELSE 
		Skater : Obj_GetPosition 
		skatercam0 : Obj_GetOrientation 
	ENDIF 
	dir = ( VECTOR(-1.00000000000, 0.00000000000, 0.00000000000) * <x> + VECTOR(0.00000000000, -1.00000000000, 0.00000000000) * <y> + VECTOR(0.00000000000, 0.00000000000, -1.00000000000) * <z> ) 
	vel = ( <dir> * 1000.00000000000 ) 
	IF NOT IsTrue view_mode 
		pos = ( <pos> + <dir> + VECTOR(0.00000000000, 40.00000000000, 0.00000000000) ) 
	ENDIF 
	IF ObjectExists id = test_projectile_OBJID 
		test_projectile_OBJID : die 
	ENDIF 
	IF NOT ObjectExists id = test_projectile_OBJID 
		CreateCompositeObject { 
			Components = [ 
				{ component = motion } 
				{ component = model } 
				{ component = rigidbody } 
				{ component = MovableContact } 
			] 
			params = { 
				name = test_projectile_OBJID 
				pos = <pos> 
				model = "leveleditor\\props\\NY_BasketBall\\NY_BasketBall.mdl" 
				bouncy 
				contacts = [ VECTOR(0.00000000000, 0.00000000000, -9.00000000000) VECTOR(9.00000000000, 0.00000000000, -2.00000000000) VECTOR(4.00000000000, 0.00000000000, 7.00000000000) VECTOR(-3.00000000000, 0.00000000000, 7.00000000000) VECTOR(-8.00000000000, 0.00000000000, -2.00000000000) VECTOR(-2.00000000000, 8.00000000000, -2.00000000000) VECTOR(2.00000000000, 8.00000000000, -2.00000000000) VECTOR(-2.00000000000, 8.00000000000, 2.00000000000) VECTOR(2.00000000000, 8.00000000000, 2.00000000000) VECTOR(-2.00000000000, -8.00000000000, -2.00000000000) VECTOR(2.00000000000, -8.00000000000, -2.00000000000) VECTOR(-2.00000000000, -8.00000000000, 2.00000000000) VECTOR(2.00000000000, -8.00000000000, 2.00000000000) ] 
				center_of_mass = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
				coeff_restitution = 0.60000002384 
				coeff_friction = 0.69999998808 
				skater_collision_impulse_factor = 0.89999997616 
				skater_collision_rotation_factor = 4.50000000000 
				skater_collision_assent = 30 
				skater_collision_radius = 20 
				SoundType = Basketball 
				SettleScript = test_projectile_SettleScript 
			} 
		} 
	ENDIF 
	Wait 1 frame 
	test_projectile_OBJID : RigidBody_Kick vel = <vel> 
ENDSCRIPT

player_list_anchor_pos = PAIR(60.00000000000, 48.00000000000) 
server_info_anchor_pos = PAIR(-70.00000000000, 48.00000000000) 
SCRIPT update_lobby_server_list 
	printf "script update_lobby_server_list" 
	IF ScreenElementExists id = server_list_menu 
		IF NOT ( current_lobby_focus = 1 ) 
			SetScreenElementProps id = server_list_scrolling_menu reset_window_top 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT update_lobby_player_list 
	IF ScreenElementExists id = lobby_player_list_menu 
		IF NOT ( current_lobby_focus = 2 ) 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT back_from_network_select_menu 
	SetNetworkMode 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
		Wait 1 frame 
	ENDIF 
	destroy_menu_background_title 
	IF NOT GotParam no_menu 
		launch_new_ss_menu 
	ENDIF 
ENDSCRIPT

SCRIPT select_network_play_multi 
	hide_select_skater_arrows 
	Change back_to_local_net_menu = 0 
	KillSkaterCamAnim all 
	PlaySkaterCamAnim name = skateshop_startcam play_hold 
	UseNetworkPreferences 
	thugpro_menu_create { 
		menu_name = multiplayer 
		menu_title = "MULTIPLAYER" 
		menu_style = MENU_STYLE_RIGHT 
		helper_text = generic_helper_text 
		pad_back_script = create_main_menu 
		show_description_panel 
		boxed 
	} 
	make_thugpro_menu_item { 
		text = "Internet" 
		pad_choose_script = select_network_play 
		<focusable> 
	} 
	make_thugpro_menu_item { 
		text = "Local" 
		pad_choose_script = select_local_play 
	} 
	thugpro_menu_finalize <...> 
ENDSCRIPT

SCRIPT select_local_play 
	Change back_to_local_net_menu = 1 
	SetNetworkMode LAN_MODE 
	Change network_connection_type = lan 
	change_gamemode_net 
	GoalManager_SetDifficultyLevel 1 
	SetAllStats value = 10 
	UseNetworkPreferences 
	setup_from_net_play_successful 
ENDSCRIPT

SCRIPT select_network_play 
	Change back_to_local_net_menu = 0 
	SetNetworkMode INTERNET_MODE 
	Change network_connection_type = internet 
	change_gamemode_net 
	GoalManager_SetDifficultyLevel 1 
	SetAllStats value = 10 
	UseNetworkPreferences 
	setup_from_net_play_successful 
ENDSCRIPT

SCRIPT setup_from_net_play_successful 
	default_skateshop_menu_cleanup 
	launch_new_select_skater_menu callback = select_network_play_multi params = { from_skaterselect } 
ENDSCRIPT

SCRIPT back_from_internet_options 
	CleanUpTopStats 
	StatsLogOff 
	ProfileLogOff 
	SetNetworkMode 
	default_skateshop_menu_cleanup 
	launch_new_ss_menu 
ENDSCRIPT

SCRIPT create_internet_options 
	IF ScreenElementExists id = lobby_list_anchor 
		DestroyScreenElement id = lobby_list_anchor 
	ENDIF 
	IF ScreenElementExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	destroy_menu_background_title 
	IF ScreenElementExists id = current_menu 
		DestroyScreenElement id = current_menu 
	ENDIF 
	ClearMemcardDataForUpload 
	dialog_box_exit 
	KillSkaterCamAnim all 
	PlaySkaterCamAnim name = skateshop_board_select_cam play_hold 
	Change in_net_lobby = 0 
	Change has_accepted_dnas = 1 
	select_network_play_multi 
	create_console_message { 
		text = "\\c2UNEXPECTED MENU STATE! PLEASE TELL MORTEN ABOUT THIS!" 
		wait_and_die 
		editor 
	} 
ENDSCRIPT

SCRIPT join_chosen 
	IF FoundServers 
		Change JoinedGameInProgress = 0 
		Change JoinedAsObserver = 0 
		StopServerList 
		SetJoinMode JOIN_MODE_PLAY 
		actions_menu_anchor : DoMorph scale = 0 
		thugpro_change_lobby_menu_header_title title = "Game Info" 
		hide_internet_only_menus keep_chat 
		server_desc_menu_anchor : DoMorph scale = 1 
		server_player_list_title : DoMorph scale = 0.20000000298 
		server_desc_level_anchor : DoMorph scale = 1 
		FireEvent type = unfocus target = actions_menu 
		FireEvent type = focus target = server_list_menu 
		Change current_lobby_focus = 1 
		AssignAlias id = server_list_menu alias = current_menu 
	ENDIF 
ENDSCRIPT

SCRIPT observe_chosen 
	IF FoundServers 
		Change JoinedGameInProgress = 0 
		Change JoinedAsObserver = 1 
		StopServerList 
		SetJoinMode JOIN_MODE_OBSERVE 
		actions_menu_anchor : DoMorph scale = 0 
		thugpro_change_lobby_menu_header_title title = "Game Info" 
		hide_internet_only_menus keep_chat 
		server_desc_menu_anchor : DoMorph scale = 1 
		server_player_list_title : DoMorph scale = 0.69999998808 
		server_desc_level_anchor : DoMorph scale = 1 
		FireEvent type = unfocus target = actions_menu 
		FireEvent type = focus target = server_list_menu 
		Change current_lobby_focus = 1 
		AssignAlias id = server_list_menu alias = current_menu 
	ENDIF 
ENDSCRIPT

SCRIPT user_list_chosen 
	StopServerList 
	FireEvent type = unfocus target = actions_menu 
	FireEvent type = focus target = lobby_player_list_menu 
	Change current_lobby_focus = 2 
	AssignAlias id = lobby_player_list_menu alias = current_menu 
ENDSCRIPT

SCRIPT refresh_chosen 
	RefreshServerList force_refresh 
	IF InInternetMode 
		FillPlayerList 
	ENDIF 
ENDSCRIPT

SCRIPT refocus_actions_menu 
	FireEvent type = unfocus target = server_list_menu 
	FireEvent type = focus target = actions_menu 
	Change current_lobby_focus = 0 
	AssignAlias id = actions_menu alias = current_menu 
	thugpro_change_lobby_menu_header_title title = "THUG Pro Online" 
	IF InInternetMode 
		FireEvent type = unfocus target = lobby_player_list_menu 
		DoScreenElementMorph id = player_list_anchor time = 0 scale = 1 
		IF ObjectExists id = console_message_vmenu 
			DoScreenElementMorph id = console_message_vmenu time = 0 scale = 1 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT refocus_gamelist_menu 
	FireEvent type = unfocus target = server_desc_menu 
	FireEvent type = focus target = server_list_menu 
ENDSCRIPT

SCRIPT hide_internet_only_menus 
	IF InInternetMode 
		IF NOT GotParam keep_chat 
			IF ObjectExists id = console_message_vmenu 
				DoScreenElementMorph id = console_message_vmenu time = 0 scale = 0 
			ENDIF 
		ENDIF 
		DoScreenElementMorph id = player_list_anchor time = 0 scale = 0 
	ENDIF 
ENDSCRIPT

SCRIPT play_online_chosen 
	CleanUpTopStats 
	spawn_lobby_list 
	IF ScreenElementExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	IF ScreenElementExists id = current_menu 
		DestroyScreenElement id = current_menu 
	ENDIF 
	PlaySkaterCamAnim name = skateshop_board_select_cam play_hold 
ENDSCRIPT

SCRIPT spawn_lobby_list 
	Change back_to_local_net_menu = 0 
	FireEvent type = unfocus target = ss_vmenu 
	CleanUpTopStats 
	dialog_box_exit 
	create_dialog_box { title = net_status_msg 
		text = "Connecting to OpenSpy..." 
		no_bg keep_menu bg_anchor_id = ss_menu 
		pos = PAIR(237.00000000000, 250.00000000000) 
		delay_input 
		buttons = [ 
			{ text = "cancel" pad_choose_script = cancel_lobby_connecting } 
		] 
	} 
	LobbyConnect 
ENDSCRIPT

SCRIPT cancel_lobby_connecting 
	dialog_box_exit 
	LeaveLobby 
	StatsLogOff 
	ProfileLogOff 
	CancelLogon 
	CancelLobbyConnect 
	StopServerList 
	FreeServerList 
	CancelNatNegotiation 
	create_helper_text generic_helper_text 
	FireEvent type = focus target = ss_vmenu 
ENDSCRIPT

SCRIPT cancel_lobby_list 
	dialog_box_exit 
	DestroyIfObjectExist id = bg_container 
	DestroyIfObjectExist id = current_menu_anchor 
	StopServerList 
	FreeServerList 
	LobbyDisconnect 
	CancelNatNegotiation 
	launch_new_ss_menu 
ENDSCRIPT

SCRIPT back_from_internet_menu 
	console_destroy 
	LeaveLobby 
	StopServerList 
	FreeServerList 
	LobbyDisconnect 
	DestroyIfObjectExist id = bg_container 
	DestroyIfObjectExist id = current_menu_anchor 
	launch_new_ss_menu 
ENDSCRIPT

SCRIPT create_network_select_games_menu 
	DestroyIfObjectExist id = bg_container 
	IF IsInternetGameHost 
		IF IsTrue already_tried 
			QuitGame 
			RETURN 
		ENDIF 
	ENDIF 
	IF IsJoiningInternetGame 
		IF IsTrue already_tried 
			IF NOT TryJoinServerIPSuccess 
				QuitGame 
				RETURN 
			ENDIF 
		ENDIF 
	ENDIF 
	Change already_tried = 1 
	Skater : reset_model_lights 
	KillSkaterCamAnim all 
	PlaySkaterCamAnim Skater = 0 name = skateshop_board_select_cam play_hold 
	IF GotParam play_cam 
		PlaySkaterCamAnim name = skateshop_board_select_cam play_hold 
	ENDIF 
	dialog_box_exit 
	make_server_list_menu 
	IF IsInternetGameHost 
		host_net_chosen 
	ELSE 
		IF InInternetMode 
			SetScreenElementProps { 
				id = actions_menu 
				event_handlers = [ 
					{ pad_back generic_menu_pad_back params = { callback = back_from_internet_menu } } 
				] 
			} 
			SetScreenElementProps { 
				id = lobby_player_list_menu 
				event_handlers = [ 
					{ pad_back generic_menu_pad_back params = { callback = back_from_user_list } } 
				] 
			} 
		ELSE 
			SetScreenElementProps { 
				id = actions_menu 
				event_handlers = [ 
					{ pad_back generic_menu_pad_back params = { callback = back_from_multiplayer_menu } } 
				] 
			} 
		ENDIF 
		SetScreenElementProps { 
			id = server_list_menu 
			event_handlers = [ 
				{ pad_back generic_menu_pad_back params = { callback = back_from_game_list } } 
			] 
		} 
		make_thugpro_menu_item { 
			id = menu_network_select_host 
			text = "Host Game" 
			width_ajustment = 0.50000000000 
			parent_id = actions_menu 
			pad_choose_script = host_chosen 
		} 
		make_thugpro_menu_item { 
			id = menu_network_select_join 
			text = "Join Game" 
			width_ajustment = 0.50000000000 
			parent_id = actions_menu 
			pad_choose_script = join_chosen 
		} 
		make_thugpro_menu_item { 
			id = menu_network_select_observe 
			text = "Observe Game" 
			width_ajustment = 0.50000000000 
			parent_id = actions_menu 
			pad_choose_script = observe_chosen 
		} 
		make_thugpro_menu_item { 
			id = menu_network_select_refresh 
			text = "Refresh game list" 
			width_ajustment = 0.50000000000 
			parent_id = actions_menu 
			pad_choose_script = refresh_chosen 
		} 
		IF InInternetMode 
			make_thugpro_menu_item { 
				id = menu_network_select_user_list 
				text = "User List" 
				width_ajustment = 0.50000000000 
				parent_id = actions_menu 
				pad_choose_script = user_list_chosen 
			} 
			make_thugpro_menu_item { 
				id = menu_network_select_chat 
				text = "Chat Message" 
				width_ajustment = 0.50000000000 
				parent_id = actions_menu 
				pad_choose_script = create_lobby_onscreen_kb 
			} 
		ENDIF 
		add_no_servers_found_message refocus 
		RunScriptOnScreenElement id = current_menu_anchor menu_onscreen params = { scale = 0.89999997616 } 
		SetScreenElementLock id = current_menu_anchor off 
		create_helper_text generic_helper_text helper_pos = PAIR(204.00000000000, 426.00000000000) helper_scale = 1.12500000000 
		SetScreenElementLock id = current_menu_anchor on 
		FireEvent type = unfocus target = server_list_menu 
		FireEvent type = unfocus target = server_desc_menu 
		IF InInternetMode 
			FireEvent type = unfocus target = lobby_player_list_menu 
		ENDIF 
		FireEvent type = focus target = actions_menu 
		AssignAlias id = actions_menu alias = current_menu 
		Change current_lobby_focus = 0 
		Change check_for_unplugged_controllers = 1 
		IF GotParam focus_on_enter_message 
			RunScriptOnScreenElement id = current_menu_anchor set_enter_message_focus 
		ENDIF 
		IF NOT TryJoinServerIPSuccess 
			IF IsJoiningInternetGame 
				check_join_internet_ip 
				RETURN 
			ENDIF 
			RefreshServerList force_refresh 
		ENDIF 
		IF GotParam focus_on_enter_message 
			RunScriptOnScreenElement id = current_menu_anchor set_enter_message_focus 
		ENDIF 
		IF TryJoinServerIPSuccess 
			ForceServerListRefresh 
			join_chosen 
			GetScreenElementProps id = { server_list_menu child = 0 } 
			FireEvent type = pad_choose target = <id> 
		ENDIF 
	ENDIF 
	hide_panel_stuff 
ENDSCRIPT

SCRIPT thugpro_change_lobby_menu_header_title title = "THUG Pro Lobby" 
	IF ScreenElementExists id = lobby_menu_header_title 
		SetScreenElementProps id = lobby_menu_header_title text = <title> 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_create_lobby_menu_header parent = server_list_anchor title = "THUG Pro Lobby" 
	CreateScreenElement { 
		type = TextElement 
		parent = <parent> 
		id = lobby_menu_header_title 
		font = machine 
		text = <title> 
		alpha = 0.89999997616 
		scale = 0.30000001192 
		just = [ left center ] 
		rgba = [ 120 120 120 120 ] 
		z_priority = 2404 
		pos = PAIR(-220.00000000000, 6.00000000000) 
	} 
	IF InInternetMode 
		CreateScreenElement { 
			id = lobby_menu_openspy_logo 
			type = SpriteElement 
			parent = <parent> 
			texture = openspy_new 
			scale = 0.20000000298 
			alpha = 1.00000000000 
			pos = PAIR(200.00000000000, 5.00000000000) 
			just = [ center center ] 
		} 
	ENDIF 
	CreateScreenElement { 
		id = lobby_menu_header_bg_l 
		type = SpriteElement 
		parent = <parent> 
		texture = header_gradient_r 
		scale = PAIR(0.50000000000, 0.40000000596) 
		rot_angle = 180 
		pos = PAIR(0.00000000000, 5.00000000000) 
		just = [ center center ] 
		rgba = ( ( THUGPRO_GlobalThemeInfo ) . HIGHLIGHTED_TEXT_COLOR ) 
	} 
	CreateScreenElement { 
		id = lobby_menu_header_bg_r 
		type = SpriteElement 
		parent = <parent> 
		texture = header_gradient_r 
		scale = PAIR(0.50000000000, 0.40000000596) 
		pos = PAIR(0.00000000000, 5.00000000000) 
		just = [ center center ] 
		rgba = ( ( THUGPRO_GlobalThemeInfo ) . KEY_COLOR ) 
	} 
ENDSCRIPT

SCRIPT thugpro_create_lobby_menu_container parent = server_list_anchor 
	CreateScreenElement { 
		id = lobby_menu_container 
		type = SpriteElement 
		parent = <parent> 
		texture = white 
		scale = PAIR(120.00000000000, 50.00000000000) 
		alpha = 0.75000000000 
		just = [ left top ] 
		rgba = [ 0 0 0 128 ] 
		pos = PAIR(-240.50000000000, 30.00000000000) 
	} 
ENDSCRIPT

SCRIPT thugpro_create_lobby_menu_chat_container parent = server_list_anchor 
	CreateScreenElement { 
		id = lobby_menu_chat_container 
		type = SpriteElement 
		parent = <parent> 
		texture = white 
		scale = PAIR(120.00000000000, 36.00000000000) 
		alpha = 0.60000002384 
		just = [ left top ] 
		rgba = [ 0 0 0 128 ] 
		pos = PAIR(-240.50000000000, 240.50000000000) 
	} 
ENDSCRIPT

MAX_NUM_STATUS_ICONS = 5 
SCRIPT make_server_list_menu 
	create_console 
	console_unhide 
	Change in_net_lobby = 1 
	SetScreenElementLock id = root_window off 
	CreateScreenElement { 
		type = ContainerElement 
		parent = root_window 
		id = server_list_anchor 
		pos = PAIR(150.00000000000, 60.00000000000) 
		scale = 1.00000000000 
		just = [ left center ] 
		focusable_child = actions_menu 
	} 
	thugpro_create_lobby_menu_header { 
		parent = server_list_anchor 
		title = "THUG Pro Lobby" 
	} 
	thugpro_create_lobby_menu_container { 
		parent = server_list_anchor 
	} 
	thugpro_create_lobby_menu_chat_container { 
		parent = server_list_anchor 
	} 
	create_menu_background_title title = "Games" bg_just = right_lobby 
	CreateScreenElement { 
		type = ContainerElement 
		parent = server_list_anchor 
		id = actions_menu_anchor 
		just = [ left top ] 
		pos = PAIR(-220.00000000000, 60.00000000000) 
		scale = 1.00000000000 
	} 
	CreateScreenElement { 
		type = Vmenu 
		parent = actions_menu_anchor 
		id = actions_menu 
		just = [ left top ] 
		scale = 1.00000000000 
		event_handlers = [ 
			{ pad_up generic_menu_up_or_down_sound params = { up } } 
			{ pad_down generic_menu_up_or_down_sound params = { down } } 
			{ pad_back generic_menu_pad_back_sound } 
		] 
	} 
	CreateScreenElement { 
		type = ContainerElement 
		parent = server_list_anchor 
		id = game_list_menu_anchor 
		dims = PAIR(300.00000000000, 300.00000000000) 
		pos = PAIR(300.00000000000, 60.00000000000) 
		just = [ left top ] 
	} 
	CreateScreenElement { 
		type = VScrollingMenu 
		parent = game_list_menu_anchor 
		id = server_list_scrolling_menu 
		dims = PAIR(440.00000000000, 300.00000000000) 
		pos = PAIR(0.00000000000, 0.00000000000) 
		just = [ left top ] 
		num_items_to_show = 10 
	} 
	CreateScreenElement { 
		type = Vmenu 
		parent = server_list_scrolling_menu 
		id = server_list_menu 
		vmenu_id = server_list_vmenu 
		scale = 1.20000004768 
		dims = PAIR(440.00000000000, 300.00000000000) 
		pos = PAIR(0.00000000000, 0.00000000000) 
		just = [ left top ] 
		internal_just = [ left top ] 
		event_handlers = [ 
			{ pad_up generic_menu_up_or_down_sound params = { up } } 
			{ pad_down generic_menu_up_or_down_sound params = { down } } 
			{ pad_back generic_menu_pad_back_sound } 
		] 
		dont_allow_wrap 
	} 
	CreateScreenElement { 
		type = ContainerElement 
		parent = server_list_anchor 
		id = server_desc_menu_anchor 
		just = [ left top ] 
		pos = PAIR(0.00000000000, 0.00000000000) 
	} 
	CreateScreenElement { 
		type = ContainerElement 
		parent = server_desc_menu_anchor 
		id = server_desc_level_anchor 
		scale = 0.00000000000 
		just = [ left top ] 
		pos = PAIR(-220.50000000000, 50.00000000000) 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = server_desc_level_anchor 
		id = server_desc_level_thumb 
		texture = flare1 
		scale = 0.25200000405 
		alpha = 0.94999998808 
		just = [ left top ] 
		pos = PAIR(0.00000000000, 0.00000000000) 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = server_desc_level_anchor 
		id = server_desc_level_static 
		texture = levelselect_static 
		scale = PAIR(0.33500000834, 0.40999999642) 
		just = [ left top ] 
		rgba = [ 200 200 200 128 ] 
		pos = PAIR(0.00000000000, 0.00000000000) 
	} 
	TerminateObjectsScripts id = server_desc_level_static 
	RunScriptOnScreenElement id = server_desc_level_static do_server_desc_level_static_effect 
	CreateScreenElement { 
		type = SpriteElement 
		parent = server_desc_level_anchor 
		id = server_desc_level_name_bg 
		texture = white 
		pos = PAIR(0.00000000000, 110.00000000000) 
		scale = PAIR(32.50000000000, 4.80000019073) 
		just = [ left top ] 
		alpha = 0.60000002384 
		rgba = [ 0 0 0 128 ] 
		z_priority = 999 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = server_desc_level_anchor 
		id = server_desc_level_name 
		font = newtrickfont 
		text = "test level" 
		scale = 0.50000000000 
		pos = PAIR(5.00000000000, 114.00000000000) 
		just = [ left top ] 
		z_priority = 1000 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = server_desc_level_anchor 
		id = server_desc_status_01 
		texture = logo_25 
		pos = PAIR(0.00000000000, 135.00000000000) 
		scale = PAIR(0.18000000715, 0.18000000715) 
		just = [ left top ] 
		alpha = 0.60000002384 
		rgba = [ 128 128 128 128 ] 
		z_priority = 999 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = server_desc_level_anchor 
		id = server_desc_status_02 
		texture = logo_25 
		pos = PAIR(20.00000000000, 135.00000000000) 
		scale = PAIR(0.18000000715, 0.18000000715) 
		just = [ left top ] 
		alpha = 0.60000002384 
		rgba = [ 128 128 128 128 ] 
		z_priority = 999 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = server_desc_level_anchor 
		id = server_desc_status_03 
		texture = logo_25 
		pos = PAIR(40.00000000000, 135.00000000000) 
		scale = PAIR(0.18000000715, 0.18000000715) 
		just = [ left top ] 
		alpha = 0.60000002384 
		rgba = [ 128 128 128 128 ] 
		z_priority = 999 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = server_desc_level_anchor 
		id = server_desc_status_04 
		texture = logo_25 
		pos = PAIR(60.00000000000, 135.00000000000) 
		scale = PAIR(0.18000000715, 0.18000000715) 
		just = [ left top ] 
		alpha = 0.60000002384 
		rgba = [ 128 128 128 128 ] 
		z_priority = 999 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = server_desc_level_anchor 
		id = server_desc_status_05 
		texture = logo_25 
		pos = PAIR(80.00000000000, 135.00000000000) 
		scale = PAIR(0.18000000715, 0.18000000715) 
		just = [ left top ] 
		alpha = 0.60000002384 
		rgba = [ 128 128 128 128 ] 
		z_priority = 999 
	} 
	CreateScreenElement { 
		type = Vmenu 
		parent = server_desc_menu_anchor 
		id = server_desc_menu 
		just = [ left top ] 
		pos = ( server_info_anchor_pos ) 
		scale = 1 
		not_focusable 
	} 
	CreateScreenElement { 
		type = ContainerElement 
		parent = server_desc_menu_anchor 
		id = server_player_list_anchor 
		just = [ left top ] 
		pos = ( player_list_anchor_pos ) 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = server_player_list_anchor 
		id = server_player_list_title 
		font = impact 
		text = "Skaters in game: " 
		scale = 0.00000000000 
		pos = PAIR(0.00000000000, 0.00000000000) 
		just = [ left top ] 
		alpha = 0.69999998808 
		rgba = ( ( THUGPRO_GlobalThemeInfo ) . MENU_TITLE_COLOR ) 
	} 
	CreateScreenElement { 
		type = Vmenu 
		parent = server_player_list_anchor 
		id = server_player_menu 
		just = [ left top ] 
		pos = PAIR(20.00000000000, 24.00000000000) 
		scale = 0.85000002384 
		not_focusable 
	} 
	IF InInternetMode 
		CreateScreenElement { 
			type = ContainerElement 
			parent = server_list_anchor 
			id = player_list_anchor 
			just = [ left top ] 
			pos = ( player_list_anchor_pos ) 
		} 
		CreateScreenElement { 
			type = TextElement 
			parent = player_list_anchor 
			id = player_list_title 
			font = impact 
			text = "Skaters in lobby: " 
			scale = 0.20000000298 
			pos = PAIR(0.00000000000, 0.00000000000) 
			just = [ left top ] 
			alpha = 0.69999998808 
			rgba = ( ( THUGPRO_GlobalThemeInfo ) . MENU_TITLE_COLOR ) 
		} 
		CreateScreenElement { 
			type = Vmenu 
			parent = player_list_anchor 
			id = lobby_player_list_menu 
			just = [ left top ] 
			pos = PAIR(20.00000000000, 24.00000000000) 
			scale = 0.85000002384 
			not_focusable 
		} 
		DoScreenElementMorph id = player_list_anchor time = 0 scale = 1 
		FillPlayerList 
		FireEvent type = unfocus target = lobby_player_list_menu 
	ENDIF 
	AssignAlias id = server_list_anchor alias = current_menu_anchor 
	AssignAlias id = actions_menu alias = current_menu 
	hide_panel_stuff 
ENDSCRIPT

SCRIPT server_list_menu_add_item 
	printf "script server_list_menu_add_item" 
	IF ObjectExists id = server_list_menu 
		FormatText ChecksumName = mode_name <mode> 
		FormatText ChecksumName = mode_attack "Trick Attack" 
		FormatText ChecksumName = mode_score "Score Challenge" 
		FormatText ChecksumName = mode_mambo "Combo Mambo" 
		FormatText ChecksumName = mode_slap "Slap!" 
		FormatText ChecksumName = mode_koth "King of the Hill" 
		FormatText ChecksumName = mode_graffiti "Graffiti" 
		FormatText ChecksumName = mode_goal "Goal Attack" 
		FormatText ChecksumName = mode_ctf "Capture the Flag" 
		FormatText ChecksumName = mode_fire "FireFight" 
		FormatText ChecksumName = mode_elim "Elimiskate" 
		FormatText ChecksumName = mode_hunt "Scavenger Hunt" 
		SWITCH <mode_name> 
			CASE <mode_attack> 
				FormatText ChecksumName = gametype_icon "2p_attack" 
			CASE <mode_score> 
				FormatText ChecksumName = gametype_icon "2p_score" 
			CASE <mode_mambo> 
				FormatText ChecksumName = gametype_icon "2p_mambo" 
			CASE <mode_slap> 
				FormatText ChecksumName = gametype_icon "2p_slap" 
			CASE <mode_koth> 
				FormatText ChecksumName = gametype_icon "2p_koth" 
			CASE <mode_graffiti> 
				FormatText ChecksumName = gametype_icon "2p_graffiti" 
			CASE <mode_goal> 
				FormatText ChecksumName = gametype_icon "2p_goal" 
			CASE <mode_ctf> 
				FormatText ChecksumName = gametype_icon "2p_flag" 
			CASE <mode_fire> 
				FormatText ChecksumName = gametype_icon "2p_fire" 
			CASE <mode_elim> 
				FormatText ChecksumName = gametype_icon "2p_elim" 
			CASE <mode_hunt> 
				FormatText ChecksumName = gametype_icon "2p_hunt" 
			DEFAULT 
				FormatText ChecksumName = gametype_icon "2p_free" 
		ENDSWITCH 
		make_thugpro_menu_item { 
			child_texture = <gametype_icon> 
			child_texture_offset = PAIR(-180.00000000000, 10.00000000000) 
			parent_id = <parent> 
			width_ajustment = 0.75000000000 
			<...> 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT player_list_add_item 
	IF ObjectExists id = lobby_player_list_menu 
		SetScreenElementLock id = lobby_player_list_menu off 
		IF ScreenElementExists id = <id> 
			DestroyScreenElement id = <id> 
		ENDIF 
		CreateScreenElement { 
			type = ContainerElement 
			parent = lobby_player_list_menu 
			id = <id> 
			pos = PAIR(0.00000000000, 0.00000000000) 
			dims = PAIR(200.00000000000, 15.00000000000) 
			scale = 1.00000000000 
			just = [ left top ] 
			internal_just = [ left top ] 
			event_handlers = [ 
				{ focus player_list_focus } 
				{ unfocus player_list_unfocus } 
			] 
			replace_handlers 
		} 
		<anchor_id> = <id> 
		CreateScreenElement { 
			type = TextElement 
			parent = <anchor_id> 
			font = bebas 
			text = <text> 
			scale = 0.18000000715 
			pos = PAIR(-20.00000000000, 0.00000000000) 
			just = [ left center ] 
			rgba = ( ( THUGPRO_GlobalThemeInfo ) . UNHIGHLIGHTED_TEXT_COLOR ) 
		} 
		SetScreenElementLock id = lobby_player_list_menu on 
		update_lobby_player_list 
	ENDIF 
ENDSCRIPT

SCRIPT player_list_focus 
	GetTags 
	RunScriptOnScreenElement id = <id> text_twitch_effect2 
	DoScreenElementMorph { 
		id = <id> 
		scale = 1.00000000000 
	} 
	DoScreenElementMorph { 
		id = { <id> child = 0 } 
		rgba = ( ( THUGPRO_GlobalThemeInfo ) . HIGHLIGHTED_TEXT_COLOR ) 
	} 
ENDSCRIPT

SCRIPT player_list_unfocus 
	GetTags 
	KillSpawnedScript name = text_twitch_effect2 
	DoScreenElementMorph { 
		id = <id> 
		scale = 1.00000000000 
	} 
	DoScreenElementMorph { 
		id = { <id> child = 0 } 
		rgba = ( ( THUGPRO_GlobalThemeInfo ) . UNHIGHLIGHTED_TEXT_COLOR ) 
	} 
ENDSCRIPT

SCRIPT do_server_desc_level_static_effect 
	GetTags 
	BEGIN 
		IF ScreenElementExists id = <id> 
			DoScreenElementMorph id = <id> scale = PAIR(0.33500000834, 0.40999999642) 
			Wait 6 gameframes 
			DoScreenElementMorph id = <id> scale = PAIR(-0.33500000834, -0.40999999642) 
			Wait 6 gameframes 
			DoScreenElementMorph id = <id> scale = PAIR(0.33500000834, -0.40999999642) 
			Wait 6 gameframes 
			DoScreenElementMorph id = <id> scale = PAIR(-0.33500000834, 0.40999999642) 
			Wait 6 gameframes 
		ELSE 
			BREAK 
		ENDIF 
	REPEAT 
ENDSCRIPT

SCRIPT server_desc_level_update_text 
	IF ScreenElementExists id = server_desc_level_name 
		IF GotParam name 
			SetScreenElementProps id = server_desc_level_name text = <name> 
		ENDIF 
		IF GotParam level_name_checksum 
			get_level_thumb_texture_from_level_name_checksum <...> 
			IF GotParam level_thumb 
				SetScreenElementProps id = server_desc_level_thumb texture = <level_thumb> 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT player_list_update_rank 
ENDSCRIPT

SCRIPT net_game_info_set_status_icon 
	index = ( <index> + 1 ) 
	FormatText ChecksumName = status_icon_id "server_desc_status_0%i" i = <index> 
	IF ScreenElementExists id = <status_icon_id> 
		SetScreenElementProps { 
			id = <status_icon_id> 
			texture = <texture> 
			rgba = <rgba> 
		} 
		DoScreenElementMorph { 
			id = <status_icon_id> 
			alpha = 0.60000002384 
		} 
	ENDIF 
	RETURN status_icon_index = <index> 
ENDSCRIPT

SCRIPT net_game_info_update_status_icons 
	status_icon_index = 0 
	IF GotParam has_password 
		net_game_info_set_status_icon { 
			index = <status_icon_index> 
			texture = logo_63 
			rgba = [ 128 0 0 128 ] 
		} 
	ENDIF 
	IF GotParam game_in_progress 
		net_game_info_set_status_icon { 
			index = <status_icon_index> 
			texture = logo_82 
			rgba = [ 128 128 0 128 ] 
		} 
	ENDIF 
	IF GotParam script_mods_allowed 
		IF ( <script_mods_allowed> = 1 ) 
			net_game_info_set_status_icon { 
				index = <status_icon_index> 
				texture = logo_36 
				rgba = [ 128 0 0 128 ] 
			} 
		ELSE 
			net_game_info_set_status_icon { 
				index = <status_icon_index> 
				texture = logo_36 
				rgba = [ 0 128 0 128 ] 
			} 
		ENDIF 
	ENDIF 
	IF GotParam hosting_imported_level 
		SWITCH <hosting_imported_level> 
			CASE 0 
				net_game_info_set_status_icon { 
					index = <status_icon_index> 
					texture = logo_64 
					rgba = [ 0 128 0 128 ] 
				} 
			CASE 1 
				net_game_info_set_status_icon { 
					index = <status_icon_index> 
					texture = logo_64 
					rgba = [ 128 0 0 128 ] 
				} 
			DEFAULT 
		ENDSWITCH 
	ENDIF 
	BEGIN 
		IF ( <status_icon_index> < ( MAX_NUM_STATUS_ICONS ) ) 
			<status_icon_index> = ( <status_icon_index> + 1 ) 
			FormatText ChecksumName = status_icon_id "server_desc_status_0%i" i = <status_icon_index> 
			IF ScreenElementExists id = <status_icon_id> 
				DoScreenElementMorph { 
					id = <status_icon_id> 
					alpha = 0.00000000000 
				} 
			ENDIF 
		ELSE 
			BREAK 
		ENDIF 
	REPEAT ( MAX_NUM_STATUS_ICONS ) 
ENDSCRIPT

SCRIPT net_game_info_add_item { 
		parent = server_desc_menu 
		dims = PAIR(300.00000000000, 16.00000000000) 
	} 
	IF ObjectExists id = <parent> 
		IF NOT GotParam value 
			RETURN 
		ENDIF 
		SetScreenElementLock id = <parent> off 
		IF GotParam value 
			dims = PAIR(300.00000000000, 33.00000000000) 
		ENDIF 
		CreateScreenElement { 
			type = ContainerElement 
			parent = <parent> 
			dims = <dims> 
		} 
		anchor_id = <id> 
		CreateScreenElement { 
			type = TextElement 
			parent = <anchor_id> 
			text = <name> 
			font = impact 
			scale = 0.20000000298 
			just = [ left top ] 
			pos = PAIR(0.00000000000, 0.00000000000) 
			alpha = 0.69999998808 
			rgba = ( ( THUGPRO_GlobalThemeInfo ) . MENU_TITLE_COLOR ) 
		} 
		IF GotParam value 
			GetUpperCaseString <value> 
			<value> = <UpperCaseString> 
			CreateScreenElement { 
				type = TextElement 
				parent = <anchor_id> 
				text = <value> 
				font = bebas 
				scale = 0.15000000596 
				just = [ left top ] 
				pos = PAIR(2.00000000000, 18.00000000000) 
				rgba = ( ( THUGPRO_GlobalThemeInfo ) . UNHIGHLIGHTED_TEXT_COLOR ) 
			} 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT net_game_info_add_player 
	IF ObjectExists id = server_player_menu 
		FormatText ChecksumName = id "%a%b" a = <name> b = <value> 
		SetScreenElementLock id = server_player_menu off 
		IF ScreenElementExists id = <id> 
			DestroyScreenElement id = <id> 
		ENDIF 
		CreateScreenElement { 
			type = ContainerElement 
			parent = server_player_menu 
			id = <id> 
			pos = PAIR(0.00000000000, 0.00000000000) 
			dims = PAIR(200.00000000000, 15.00000000000) 
			scale = 1.00000000000 
			just = [ left top ] 
			internal_just = [ left top ] 
			event_handlers = [ ] 
			replace_handlers 
		} 
		<anchor_id> = <id> 
		CreateScreenElement { 
			type = TextElement 
			parent = <anchor_id> 
			font = bebas 
			text = <value> 
			scale = 0.18000000715 
			pos = PAIR(-20.00000000000, 0.00000000000) 
			just = [ left center ] 
			rgba = ( ( THUGPRO_GlobalThemeInfo ) . UNHIGHLIGHTED_TEXT_COLOR ) 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT net_game_info_update_player_title 
ENDSCRIPT

SCRIPT server_list_focus 
	GetTags 
	RunScriptOnScreenElement id = <id> text_twitch_effect2 
	DoScreenElementMorph { 
		id = <id> 
		scale = 1.00000000000 
	} 
	DoScreenElementMorph { 
		id = { <id> child = 0 } 
		rgba = ( ( THUGPRO_GlobalThemeInfo ) . HIGHLIGHTED_TEXT_COLOR ) 
	} 
	IF RetrieveServerInfo <...> 
		describe_selected_server <...> 
	ENDIF 
ENDSCRIPT

SCRIPT server_list_unfocus 
	GetTags 
	KillSpawnedScript name = text_twitch_effect2 
	DoScreenElementMorph { 
		id = <id> 
		scale = 1.00000000000 
	} 
	DoScreenElementMorph { 
		id = { <id> child = 0 } 
		rgba = ( ( THUGPRO_GlobalThemeInfo ) . UNHIGHLIGHTED_TEXT_COLOR ) 
	} 
ENDSCRIPT

SCRIPT back_from_game_list 
	actions_menu_anchor : DoMorph scale = 1 
	server_desc_menu_anchor : DoMorph scale = 0 
	server_player_list_title : DoMorph scale = 0 
	server_desc_level_anchor : DoMorph scale = 0 
	destroy_server_desc_children 
	refocus_actions_menu 
ENDSCRIPT

SCRIPT back_from_user_list 
	actions_menu_anchor : DoMorph scale = 1 
	refocus_actions_menu 
ENDSCRIPT

SCRIPT back_from_buddy_list 
	actions_menu_anchor : DoMorph scale = 1 
	refocus_actions_menu 
ENDSCRIPT

already_tried = 0 
SCRIPT set_enter_message_focus 
	menu_onscreen params = { scale = 0.89999997616 } <...> 
	FireEvent type = unfocus target = actions_menu 
	FireEvent type = focus target = actions_menu data = { child_id = menu_network_select_chat } 
ENDSCRIPT

SCRIPT back_to_server_list_from_buddy_list 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	create_network_select_games_menu 
	IF ObjectExists id = console_message_vmenu 
		DoScreenElementMorph id = console_message_vmenu time = 0 scale = 1 
	ENDIF 
ENDSCRIPT

SCRIPT create_remove_players_menu 
	make_new_menu menu_id = remove_players_menu vmenu_id = remove_players_vmenu menu_title = "REMOVE WHICH PLAYER?" 
	SetScreenElementProps { 
		id = remove_players_menu 
		event_handlers = [ 
			{ pad_back generic_menu_pad_back params = { callback = create_pause_menu } } 
		] 
	} 
	FillRemovePlayersMenu 
	RunScriptOnScreenElement id = current_menu_anchor menu_onscreen params = { scale = 0.89999997616 } 
ENDSCRIPT

SCRIPT cancel_view_homies 
	dialog_box_exit 
	FireEvent type = focus target = actions_menu 
	SetScreenElementLock id = server_list_anchor off 
	create_helper_text generic_helper_text 
	SetScreenElementLock id = server_list_anchor on 
ENDSCRIPT

SCRIPT lobby_remove_buddy 
	RemoveBuddy <...> 
	FillBuddyList clear_list allow_remove 
	launch_homie_list 
ENDSCRIPT

SCRIPT back_from_regions_menu_update 
	IF ObjectExists id = lobby_list_anchor 
		FireEvent type = focus target = internet_vmenu 
		DoScreenElementMorph id = lobby_list_anchor pos = PAIR(-5.00000000000, 800.00000000000) time = 0.30000001192 
		Wait 0.30000001192 Seconds 
		DestroyScreenElement id = lobby_list_anchor 
	ENDIF 
ENDSCRIPT

SCRIPT back_from_lobbies_update 
	StopServerList 
	FreeServerList 
	LobbyDisconnect 
	CancelNatNegotiation 
	back_from_regions_menu_update 
ENDSCRIPT

SCRIPT create_lobby_list_menu 
	cas_handle_board_stuff RefreshSkaterModel show_board 
	destroy_menu_background_title 
	CreateScreenElement { 
		type = ContainerElement 
		parent = root_window 
		id = lobby_list_anchor 
		pos = PAIR(0.00000000000, 0.00000000000) 
	} 
	default_skateshop_menu_cleanup 
	make_new_skateshop_menu { 
		parent = lobby_list_anchor 
		pos = PAIR(380.00000000000, 115.00000000000) 
		internal_just = [ center center ] 
		menu_id = lobby_list_menu 
		vmenu_id = lobby_list_vmenu 
	} 
	create_menu_background_title title = "select lobby" bg_just = right_lobby 
	SetScreenElementLock id = root_window off 
	SetScreenElementProps { 
		id = lobby_list_vmenu 
		event_handlers = [ { pad_back generic_menu_pad_back params = { callback = cancel_lobby_list } } ] 
		replace_handlers 
	} 
	create_helper_text generic_helper_text 
	FireEvent type = focus target = lobby_list_vmenu 
ENDSCRIPT

SCRIPT launch_network_select_games_menu_update 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	create_network_select_games_menu play_cam 
ENDSCRIPT

SCRIPT regions_menu_add_item 
	FormatText ChecksumName = id "%i" i = <text> 
	RemoveParameter focus_script 
	RemoveParameter unfocus_script 
	make_thpg_menu_item <...> rgba = [ 70 70 70 70 ] 
ENDSCRIPT

SCRIPT choose_selected_lobby 
	printf "---------------------- chose lobby ----------------------" 
	ChooseLobby <...> 
	IF ScreenElementExists id = lobby_list_anchor 
		DestroyScreenElement id = lobby_list_anchor 
	ENDIF 
	create_joining_lobby_dialog 
ENDSCRIPT

SCRIPT CreateGettingLobbyListDialog 
	dialog_box_exit 
	create_dialog_box { title = net_status_msg 
		text = net_status_getting_lobbies 
		no_animate keep_menu bg_anchor_id = ss_menu 
		no_bg 
		delay_input 
		pos = PAIR(237.00000000000, 250.00000000000) 
		buttons = [ 
			{ text = "cancel" pad_choose_script = cancel_lobby_ } 
		] 
	} 
ENDSCRIPT

SCRIPT cancel_lobby_ 
	dialog_box_exit 
	StatsLogOff 
	ProfileLogOff 
	console_destroy 
	back_from_lobbies 
	SetNetworkMode 
	FireEvent type = focus target = ss_vmenu 
ENDSCRIPT

SCRIPT show_BulletinBoard 
	default_skateshop_menu_cleanup 
	KillSkaterCamAnim all 
	Wait 1 frame 
	IF NOT ObjectExists id = menu_cam 
		create_menu_camera 
	ENDIF 
	menu_cam : UnPause 
	menu_cam : Obj_SetPosition Position = VECTOR(-2942.13696289062, 85.00000000000, 839.00000000000) 
	menu_cam : Obj_SetOrientation dir = VECTOR(-1.00000000000, 0.02999999933, -0.00600000005) 
	SetActiveCamera id = menu_cam 
	IF ScreenElementExists id = BulletinBoard_anchor 
		DestroyScreenElement id = BulletinBoard_anchor 
	ENDIF 
	SetScreenElementLock off id = root_window 
	IF GotParam CanScroll 
		CreateScreenElement { 
			type = ContainerElement 
			dims = PAIR(640.00000000000, 480.00000000000) 
			pos = PAIR(320.00000000000, 240.00000000000) 
			parent = root_window 
			id = BulletinBoard_anchor 
			event_handlers = [ 
				{ pad_down BulletinBoard_scroll_down } 
				{ pad_up BulletinBoard_scroll_up } 
			] 
		} 
	ELSE 
		CreateScreenElement { 
			type = ContainerElement 
			dims = PAIR(640.00000000000, 480.00000000000) 
			pos = PAIR(320.00000000000, 240.00000000000) 
			parent = root_window 
			id = BulletinBoard_anchor 
		} 
	ENDIF 
	AssignAlias alias = current_menu_anchor id = BulletinBoard_anchor 
	CreateScreenElement { 
		type = TextElement 
		parent = BulletinBoard_anchor 
		id = BulletinBoard_title 
		font = testtitle 
		text = "THUGPRO News" 
		pos = PAIR(320.00000000000, 40.00000000000) 
		scale = 2.00000000000 
		rgba = ( ( THUGPRO_GlobalThemeInfo ) . HIGHLIGHTED_TEXT_COLOR ) 
	} 
	IF GotParam CanScroll 
		CreateScreenElement { 
			type = SpriteElement 
			parent = BulletinBoard_anchor 
			id = down_arrow 
			texture = down_arrow 
			pos = PAIR(300.00000000000, 352.00000000000) 
			scale = 1.00000000000 
			rgba = ( ( THUGPRO_GlobalThemeInfo ) . UNHIGHLIGHTED_TEXT_COLOR ) 
		} 
	ENDIF 
	CreateScreenElement { 
		type = hmenu 
		parent = BulletinBoard_anchor 
		dims = PAIR(360.00000000000, 20.00000000000) 
		id = BulletinBoard_hmenu 
		pos = PAIR(360.00000000000, 400.00000000000) 
		z_priority = 20 
		event_handlers = [ 
			{ pad_back generic_menu_pad_back_sound } 
			{ pad_back back_from_BulletinBoard } 
		] 
	} 
	CreateScreenElement { 
		type = TextElement 
		pos = PAIR(350.00000000000, 320.00000000000) 
		parent = BulletinBoard_hmenu 
		font = dialog 
		text = "Back" 
		dims = PAIR(120.00000000000, 15.00000000000) 
		rgba = ( ( THUGPRO_GlobalThemeInfo ) . UNHIGHLIGHTED_TEXT_COLOR ) 
		event_handlers = [ 
			{ focus BulletinBoard_focus } 
			{ unfocus BulletinBoard_unfocus } 
			{ pad_choose back_from_BulletinBoard } 
		] 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = BulletinBoard_anchor 
		id = black_mask 
		texture = white2 
		scale = PAIR(90.00000000000, 5.00000000000) 
		pos = PAIR(0.00000000000, 380.00000000000) 
		rgba = [ 0 0 0 255 ] 
		just = [ left top ] 
		z_priority = -3 
	} 
	CreateScreenElement { 
		type = Vmenu 
		parent = BulletinBoard_anchor 
		id = BulletinBoard_vmenu 
		pos = PAIR(80.00000000000, 82.00000000000) 
		dims = PAIR(880.00000000000, 380.00000000000) 
		just = [ left top ] 
		internal_just = [ left top ] 
		z_priority = -4 
		dont_allow_wrap 
		padding_scale = 0.69999998808 
	} 
	THUGPRO_Version 
	FormatText TextName = version_string "Welcome To THUGPRO BETA Version %a!" a = <version> 
	CreateScreenElement { 
		type = TextElement 
		parent = BulletinBoard_vmenu 
		id = first_line 
		text = <version_string> 
		font = small_rus 
		rgba = ( ( THUGPRO_GlobalThemeInfo ) . UNHIGHLIGHTED_TEXT_COLOR ) 
		scale = 0.80000001192 
		shadow 
		shadow_rgba = [ 0 , 0 , 0 , 128 ] 
		shadow_offs = PAIR(0.69999998808, 0.69999998808) 
	} 
	CreateMultipleTextElements { 
		parent = BulletinBoard_vmenu 
		text = BulletinBoard_text 
		font = small_rus 
		rgba = ( ( THUGPRO_GlobalThemeInfo ) . UNHIGHLIGHTED_TEXT_COLOR ) 
		scale = 0.80000001192 
		width = 700 
		shadow 
		shadow_rgba = [ 0 , 0 , 0 , 128 ] 
		shadow_offs = PAIR(0.69999998808, 0.69999998808) 
	} 
	IF GotParam CanScroll 
		create_helper_text helper_text_elements = [ { text = "\\b6/\\b5 = Select" } 
			{ text = "\\b4 = Scroll" } 
			{ text = "\\bn = Back" } 
			{ text = "\\bm = Accept" } 
		] 
	ELSE 
		create_helper_text helper_text_elements = [ 
			{ text = "\\bn & \\bm = Back" } 
		] 
	ENDIF 
	FireEvent type = focus target = BulletinBoard_hmenu 
	FireEvent type = focus target = BulletinBoard_anchor 
	Wait 2 gameframes 
ENDSCRIPT

SCRIPT BulletinBoard_scroll_down 
	GetTags 
	GetScreenElementPosition id = BulletinBoard_vmenu 
	IF NOT ( <ScreenElementPos> . PAIR(0.00000000000, 1.00000000000) < -300 ) 
		SetScreenElementProps { 
			id = BulletinBoard_vmenu 
			pos = ( <ScreenElementPos> + PAIR(0.00000000000, -20.00000000000) ) 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT BulletinBoard_scroll_up 
	GetTags 
	GetScreenElementPosition id = BulletinBoard_vmenu 
	IF NOT ( <ScreenElementPos> . PAIR(0.00000000000, 1.00000000000) > 60 ) 
		SetScreenElementProps { 
			id = BulletinBoard_vmenu 
			pos = ( <ScreenElementPos> + PAIR(0.00000000000, 20.00000000000) ) 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT BulletinBoard_focus 
	GetTags 
	DoScreenElementMorph id = <id> rgba = ( ( THUGPRO_GlobalThemeInfo ) . HIGHLIGHTED_TEXT_COLOR ) scale = 1.20000004768 
ENDSCRIPT

SCRIPT BulletinBoard_unfocus 
	GetTags 
	DoScreenElementMorph id = <id> rgba = [ 50 50 50 50 ] scale = 1 
ENDSCRIPT

SCRIPT signed_BulletinBoard 
	IF ScreenElementExists id = BulletinBoard_anchor 
		DestroyScreenElement id = BulletinBoard_anchor 
	ENDIF 
	create_main_menu 
ENDSCRIPT

SCRIPT back_from_BulletinBoard 
	dialog_box_exit 
	generic_menu_pad_back_sound 
	IF ScreenElementExists id = BulletinBoard_anchor 
		DestroyScreenElement id = BulletinBoard_anchor 
	ENDIF 
	KillSkaterCamAnim all 
	PlaySkaterCamAnim name = skateshop_startcam play_hold 
	create_main_menu 
ENDSCRIPT

BulletinBoard_text = [ 
] 
AlreadyEndedRun = 0 
SCRIPT THUGPRO_NetEndRun 
	IF InNetGame 
		IF GameModeEquals should_end_run_quickly 
			GoalManager_GetTimeLeftInNetGame 
			IF ( <time_left> < 1 ) 
				Change AlreadyEndedRun = 1 
				FireEvent type = EndOfRunDone 
				EndOfRunDone 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_create_mode_text { 
		mode_name = "Unknown gamemode!" 
		mode_desc = "Missing gamemode description!!!" 
	} 
	IF InNetGame 
		FormatText TextName = msg_text "%b\\n\\c1%c" b = <mode_name> c = <mode_desc> 
		CreateScreenElement { 
			id = mp_goal_text 
			parent = root_window 
			type = ContainerElement 
		} 
		create_panel_message { 
			id = mp_goal_text_mode 
			text = <mode_name> 
			parent = mp_goal_text 
			style = panel_message_goal_new 
			font_face = ( ( THUGPRO_GlobalThemeInfo ) . HUD_FONT ) 
			final_scale = 0.21999999881 
			rgba = ( ( THUGPRO_GlobalThemeInfo ) . HIGHLIGHTED_TEXT_COLOR ) 
			final_pos = ( panel_block_goal_desc_pos1 ) 
			just = [ center top ] 
			shadow 
		} 
		create_panel_block { 
			id = mp_goal_text_desc 
			text = <mode_desc> 
			parent = mp_goal_text 
			style = panel_message_goal_new 
			font_face = ( ( THUGPRO_GlobalThemeInfo ) . HUD_FONT ) 
			dims = PAIR(1100.00000000000, 0.00000000000) 
			rgba = ( ( THUGPRO_GlobalThemeInfo ) . UNHIGHLIGHTED_TEXT_COLOR ) 
			final_scale = 0.20000000298 
			final_pos = ( panel_block_goal_desc_pos2 ) 
			just = [ center top ] 
			internal_just = [ center top ] 
			shadow 
		} 
	ENDIF 
ENDSCRIPT


