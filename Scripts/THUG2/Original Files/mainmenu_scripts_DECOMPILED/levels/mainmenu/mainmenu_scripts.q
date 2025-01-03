
skater_ambient_color = [ 105 , 85 , 85 ] 
skater_diffuse_color1 = [ 28 , 28 , 28 ] 
skater_diffuse_color2 = [ 10 , 10 , 10 ] 
mainmneu_cam_offset = VECTOR(-25.00000000000, 51.00000000000, -40.00000000000) 
spin_menu_pos = PAIR(46.00000000000, 214.00000000000) 
SCRIPT mainmenu_startup 
	
	
	
	
	
	LoadAsset "models\\mainmenu_bg\\mainmenu_bg.tex" 
	LoadAsset "models\\mainmenu_bg\\mainmenu_bg.mdl" nocollision = 1 parent = %"models\\mainmenu_bg\\mainmenu_bg.tex" 
	GoalManager_HidePoints 
	GoalManager_HideGoalPoints 
	Randomize 
	SetScoreDegradation 0 
	change main_menu_ok_to_go = 0 
	SpawnScript maybe_auto_load_from_memory_card 
ENDSCRIPT

SCRIPT mainmenu_LoadingSounds 
	LoadSound "Skateshop\\BoardsFlip" vol = 100 dropoff = 150 
	LoadSound "terrains\\olliewood2" vol = 100 dropoff = 150 
	LoadSound "terrains\\olliewood3" vol = 100 dropoff = 150 
	LoadSound "terrains\\landwood2" vol = 100 dropoff = 150 
	LoadSound "terrains\\landwood3" vol = 100 dropoff = 150 
	LoadSound "Shared\\Menu\\CheatGood" 
	LoadSound "Shared\\Menu\\CheatBad" 
ENDSCRIPT

SCRIPT Default_Goals 
	IF InMultiplayerGame 
		Add_MultiPlayer_Mode_Goals 
	ENDIF 
	IF NOT InSplitScreenGame 
		IF NOT GameModeEquals Is_SingleSession 
		ENDIF 
	ENDIF 
	IF NOT InSplitScreenGame 
		IF NOT GameModeEquals Is_SingleSession 
			IF NOT InNetGame 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT TOD_Script 
	SWITCH <current_tod> 
		CASE morning 
		CASE day 
		CASE evening 
		CASE night 
		DEFAULT 
			
	ENDSWITCH 
ENDSCRIPT

SCRIPT launch_main_menu 
	IF ( main_menu_jump_to_cas = 1 ) 
		cas_mainmenu_startup 
		RETURN 
	ENDIF 
	IF ( main_menu_return_to_createamodes = 1 ) 
		change main_menu_return_to_createamodes = 0 
		create_createamodes_menu launched = launched 
	ELSE 
		create_main_menu launched = launched 
	ENDIF 
	IF NOT GetGlobalFlag flag = SOUNDS_SONGORDER_RANDOM 
		PlaySongsInOrder 
	ELSE 
		PlaySongsRandomly 
	ENDIF 
	PauseMusic 0 
	pause_trick_text 
	SetColorBufferClear clear = 1 
ENDSCRIPT

SCRIPT xbox_autoload_message 
	IF ( attempted_xbox_autoload = 0 ) 
		change attempted_xbox_autoload = 1 
		change DoAutoload = 1 
		FireEvent type = unfocus target = current_menu 
		create_dialog_box { title = "Load Game" 
			text = "Load last Game Progress save?" 
			text_dims = PAIR(350.00000000000, 0.00000000000) 
			pos = PAIR(320.00000000000, 240.00000000000) 
			just = [ center center ] 
			text_rgba = [ 88 105 112 128 ] 
			text_scale = 1 
			no_bg = no_bg 
			buttons = [ { font = small text = "Yes" pad_choose_script = yes_xbox_autoload } 
				{ font = small text = "No" pad_choose_script = no_xbox_autoload } 
			] 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT yes_xbox_autoload 
	mark_first_input_received <...> 
	dialog_box_exit 
	change DoAutoload = 0 
ENDSCRIPT

SCRIPT no_xbox_autoload 
	mark_first_input_received <...> 
	dialog_box_exit 
	FireEvent type = unfocus target = current_menu 
	change no_load = 1 
	CheckForCardOnBootup 
	change DoAutoload = 0 
	Debounce X 0.30000001192 
	UnpauseMusicAndStreams 
	create_main_menu 
ENDSCRIPT

SCRIPT main_menu_startup_wait_and_signal_clear 
	change dont_unhide_loading_screen = 1 
	PauseSkaters 
	wait 10 gameframes 
	change dont_unhide_loading_screen = 0 
	IF NOT IsTrue main_menu_jump_to_cas 
		play_no_skater_cam 
	ENDIF 
	change main_menu_ok_to_go = 1 
ENDSCRIPT

SCRIPT main_menu_wait_until_all_clear 
	BEGIN 
		IF ObjectExists id = skatercam0 
			IF ObjectExists id = skater 
				IF LocalSkaterExists 
					IF IsTrue main_menu_ok_to_go 
						RETURN 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
		wait 1 gameframe 
	REPEAT 
ENDSCRIPT

SCRIPT create_main_menu 
	change main_menu_return_to_createamodes = 0 
	SetNetworkMode 
	UnpauseMusicAndStreams 
	UnPauseObjects 
	change in_options_menu = 0 
	SetNetworkMode 
	SetMemThreadSafe off 
	main_menu_wait_until_all_clear 
	spin_menu_skater_script reset 
	KillSpawnedScript name = TemporarilyDisableInput 
	SpawnScript TemporarilyDisableInput params = { time = 400 } 
	SetMenuPadMappings [ active 
		use_as_first 
	] 
	make_spin_menu pos = spin_menu_pos menu_id = main_menu vmenu_id = main_vmenu 
	spin_menu_visible 
	SetScreenElementProps { 
		id = current_menu 
		event_handlers = [ 
			{ pad_up reset_attract_mode_timer } 
			{ pad_down reset_attract_mode_timer } 
		] 
	} 
	IF NOT IsXBox 
		CreateScreenElement { 
			type = SpriteElement 
			parent = current_menu_anchor 
			texture = white3 
			id = main_menu_gradient 
			scale = PAIR(11.00000000000, 6.00000000000) 
			rgba = [ 0 0 0 60 ] 
			pos = PAIR(300.00000000000, -10.00000000000) 
			rot_angle = 0 
			just = [ left top ] 
		} 
	ENDIF 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		id = mm_icon 
		texture = <main_icon> 
		just = [ center center ] 
		pos = PAIR(42.00000000000, 70.00000000000) 
		scale = PAIR(1.39999997616, 1.39999997616) 
		rot_angle = -30 
		z_priority = 12 
		alpha = 1 
	} 
	add_main_menu_items 
	GetScreenElementChildren id = current_menu 
	GetArraySize <children> 
	IF ( ( <array_size> * 2 ) < 17 ) 
		<num_blanks> = ( 8 - <array_size> ) 
		IF ( <num_blanks> > 0 ) 
			BEGIN 
				make_spin_menu_item { 
					blank 
				} 
			REPEAT <num_blanks> 
		ENDIF 
		add_main_menu_items copy 
		IF ( <num_blanks> > 0 ) 
			BEGIN 
				make_spin_menu_item { 
					blank 
				} 
			REPEAT <num_blanks> 
		ENDIF 
	ENDIF 
	change spin_menu_cycle = 1 
	CreateScreenElement { 
		type = ContainerElement 
		parent = current_menu_anchor 
		id = attract_container 
		event_handlers = [ { pad_back reset_attract_mode_timer } 
			{ pad_left reset_attract_mode_timer } 
			{ pad_right reset_attract_mode_timer } 
		] 
	} 
	create_helper_text generic_helper_text_no_back 
	spin_menu_init 
	FireEvent type = focus target = attract_container 
	unpauseskaters 
	UnpauseMusicAndStreams 
	spin_menu_camera_init 
	pulse_blur speed = 2 start = 255 
	KillSpawnedScript name = attract_mode_timer 
	SpawnScript attract_mode_timer 
	IF isNgc 
		MemPushContext TopDownHeap 
	ENDIF 
	SpawnSecondControllerCheck 
	IF isNgc 
		MemPopContext 
	ENDIF 
	IF ( layer_infos_need_resetting = 1 ) 
		edit_graphic_reset_layer_infos 
		edit_graphic_apply_graphic_from_save 
		change layer_infos_need_resetting = 0 
	ENDIF 
	wait 5 gameframe 
	kill_start_key_binding 
ENDSCRIPT

SCRIPT spin_menu_init 
	FireEvent type = focus target = main_vmenu data = { grid_index = ( spin_menu_selected_index ) } 
	SetScreenElementProps id = root_window tags = { menu_state = on } 
	IF NOT ( spin_menu_selected_index = 0 ) 
		change spin_menu_angle = ( -22.50000000000 * spin_menu_selected_index ) 
		change spin_menu_dir = -1 
		DoScreenElementMorph id = current_menu rot_angle = spin_menu_angle time = 0 
		spin_menu_spin_geometry rot_angle = spin_menu_angle spin_time = 0 no_wait 
	ENDIF 
ENDSCRIPT

SCRIPT add_test_spin_menu_items 
	<index> = 1 
	BEGIN 
		FormatText TextName = text "   --::     %i" i = <index> 
		FormatText ChecksumName = id "ITEM%i" i = <index> 
		make_spin_menu_item { 
			text1 = <text> 
			highlight_text = <text> 
			id = <id> 
			pad_choose_script = main_menu_exit 
			pad_choose_params = { 
				new_menu_script = create_gamemode_options_menu 
				change_gamemode = change_gamemode_career 
				hold_camera 
			} 
			focus_params = { attract_timer } 
			mark_first_input 
			helper_text = <text> 
			icon = mainicon_story 
		} 
		<index> = ( <index> + 1 ) 
	REPEAT 16 
ENDSCRIPT

SCRIPT add_main_menu_items 
	demo_build_item_active = 1 
	IF GotParam copy 
		<id> = menu_career2 
	ELSE 
		<id> = menu_career 
	ENDIF 
	make_spin_menu_item { 
		text1 = "         Story Mode" 
		highlight_text = "STORY MODE" 
		id = <id> 
		pad_choose_script = main_menu_exit 
		pad_choose_params = { 
			new_menu_script = create_gamemode_options_menu 
			change_gamemode = change_gamemode_career 
			hold_camera 
		} 
		focus_params = { attract_timer } 
		mark_first_input 
		helper_text = "Play the game in story mode..." 
		icon = mainicon_story 
	} 
	IF GotParam copy 
		<id> = menu_classic2 
	ELSE 
		<id> = menu_classic 
	ENDIF 
	make_spin_menu_item { 
		text1 = "         Classic Mode" 
		highlight_text = "CLASSIC MODE" 
		id = <id> 
		pad_choose_script = main_menu_exit 
		pad_choose_params = { 
			new_menu_script = create_gamemode_options_menu 
			change_gamemode = change_gamemode_classic 
			hold_camera 
		} 
		focus_params = { attract_timer } 
		mark_first_input 
		helper_text = "Play the game in classic mode..." 
		icon = mainicon_classic 
	} 
	IF OnXbox 
		IF GotParam copy 
			<id> = menu_net2 
		ELSE 
			<id> = menu_net 
		ENDIF 
		IF NOT ( DEMO_BUILD ) 
			IF NetworkAdaptorInstalled 
				make_spin_menu_item { 
					text1 = "         Multiplayer" 
					highlight_text = "MULTIPLAYER" 
					id = <id> 
					pad_choose_script = main_menu_exit 
					pad_choose_params = { 
						new_menu_script = select_network_play_multi 
						change_gamemode = change_gamemode_net 
						hold_camera 
						do_loading_logo 
					} 
					mark_first_input 
					focus_params = { attract_timer } 
					helper_text = "Play the game online..." 
					icon = mainicon_online 
				} 
			ELSE 
				IF NOT CD 
					make_spin_menu_item { 
						text1 = "         Multiplayer" 
						highlight_text = "MULTIPLAYER" 
						id = <id> 
						pad_choose_script = main_menu_exit 
						pad_choose_params = { 
							new_menu_script = select_network_play_multi 
							change_gamemode = change_gamemode_net 
							hold_camera 
							do_loading_logo 
						} 
						mark_first_input 
						focus_params = { attract_timer } 
						helper_text = "Play the game online..." 
						icon = mainicon_online 
					} 
				ELSE 
					make_spin_menu_item { 
						text1 = "         Multiplayer" 
						highlight_text = "MULTIPLAYER" 
						id = <id> 
						pad_choose_script = main_menu_exit 
						pad_choose_params = { 
							new_menu_script = select_network_play_multi 
							change_gamemode = change_gamemode_net 
							hold_camera 
							do_loading_logo 
						} 
						mark_first_input 
						active = 0 
						focus_params = { attract_timer } 
						helper_text = "Play the game online..." 
						icon = mainicon_online 
					} 
				ENDIF 
			ENDIF 
		ELSE 
			make_spin_menu_item { 
				text1 = "         Multiplayer" 
				highlight_text = "MULTIPLAYER" 
				id = <id> 
				active = 0 
				helper_text = "Play the game online..." 
				icon = mainicon_online 
			} 
		ENDIF 
	ENDIF 
	IF GotParam copy 
		<id> = menu_singlesess2 
	ELSE 
		<id> = menu_singlesess 
	ENDIF 
	make_spin_menu_item { 
		text1 = "           High Score" 
		text2 = "           Free Skate" 
		highlight_text = "HIGH SCORE / FREE SKATE" 
		id = <id> 
		pad_choose_script = main_menu_exit 
		pad_choose_params = { 
			new_menu_script = launch_select_skater_menu 
			change_gamemode = change_gamemode_singlesession 
			hold_camera 
			do_loading_logo 
		} 
		focus_params = { attract_timer } 
		mark_first_input 
		helper_text = "Skate around or go for a high score..." 
		icon = mainicon_score 
		active = <demo_build_item_active> 
	} 
	IF GotParam copy 
		<id> = main_menu_2_player_option2 
	ELSE 
		<id> = main_menu_2_player_option 
	ENDIF 
	make_spin_menu_item { 
		text1 = "         2 Player" 
		highlight_text = "2 PLAYER" 
		id = <id> 
		pad_choose_script = main_menu_exit 
		pad_choose_params = { 
			new_menu_script = launch_select_skater_menu 
			change_gamemode = change_gamemode_freeskate_2p 
			hold_camera 
			do_loading_logo 
		} 
		mark_first_input 
		focus_params = { attract_timer } 
		helper_text = "Play the game with a friend..." 
		icon = mainicon_2player 
		active = <demo_build_item_active> 
	} 
	IF GotParam copy 
		<id> = menu_createamodes2 
	ELSE 
		<id> = menu_createamodes 
	ENDIF 
	make_spin_menu_item { 
		text1 = "        Create-A-Modes" 
		highlight_text = "CREATE-A-MODES" 
		id = <id> 
		pad_choose_script = main_menu_exit 
		pad_choose_params = { 
			new_menu_script = create_createamodes_menu 
			change_gamemode = change_gamemode_singlesession 
			hold_camera 
		} 
		focus_params = { attract_timer } 
		mark_first_input 
		helper_text = "Create custom content..." 
		icon = mainicon_mode 
	} 
	IF GotParam copy 
		<id> = menu_options2 
	ELSE 
		<id> = menu_options 
	ENDIF 
	make_spin_menu_item { 
		text1 = "         Game Options" 
		highlight_text = "GAME OPTIONS" 
		id = <id> 
		pad_choose_script = main_menu_exit 
		pad_choose_params = { 
			new_menu_script = create_setup_options_menu 
			hold_camera 
		} 
		mark_first_input 
		focus_params = { attract_timer } 
		helper_text = "Change the game options..." 
		icon = mainicon_options 
	} 
	IF GotParam copy 
		<id> = menu_quit2 
	ELSE 
		<id> = menu_quit 
	ENDIF 
	make_spin_menu_item { 
		text1 = "        Quit" 
		highlight_text = "QUIT" 
		id = <id> 
		pad_choose_script = main_menu_exit 
		pad_choose_params = { 
			new_menu_script = main_menu_exit_game 
			hold_camera 
		} 
		focus_params = { attract_timer } 
		mark_first_input 
		helper_text = "Quit the game..." 
		icon = mainicon_mode 
	} 
ENDSCRIPT

SCRIPT build_frontend_menu_title 
	CreateScreenElement { 
		type = ContainerElement 
		parent = current_menu_anchor 
		id = current_menu_title 
		pos = PAIR(700.00000000000, 30.00000000000) 
	} 
	Theme_GetSupportPieceColor return_value = tab_color 
	FormatText ChecksumName = mainmenu_icon "%i_new" i = ( THEME_PREFIXES [ current_theme_prefix ] ) 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_title 
		texture = goal_tab 
		rgba = <tab_color> 
		scale = PAIR(1.00000000000, 1.25000000000) 
		pos = PAIR(30.00000000000, 0.00000000000) 
		alpha = 1 
		just = [ left top ] 
		z_priority = 1 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_title 
		texture = goal_tab_extra 
		rgba = <tab_color> 
		scale = PAIR(7.00000000000, 1.25000000000) 
		pos = PAIR(80.00000000000, 0.00000000000) 
		alpha = 1 
		just = [ left top ] 
		z_priority = 2 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = <id> 
		font = testtitle 
		text = "MAIN MENU" 
		rgba = [ 85 , 30 , 0 , 128 ] 
		pos = PAIR(-3.00000000000, 1.00000000000) 
		scale = PAIR(0.20000000298, 1.29999995232) 
		just = [ left top ] 
		z_priority = 3 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_title 
		texture = <mainmenu_icon> 
		rgba = [ 128 128 2 30 ] 
		scale = PAIR(1.25000000000, 1.25000000000) 
		pos = PAIR(185.00000000000, -20.00000000000) 
		alpha = 1 
		rot_angle = 10 
		just = [ left top ] 
		z_priority = 10 
	} 
	Theme_GetAltColor return_value = grad_color 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_title 
		texture = goal_grad 
		rgba = <grad_color> 
		scale = PAIR(9.00000000000, 1.00000000000) 
		pos = PAIR(-30.00000000000, 40.00000000000) 
		just = [ left top ] 
		z_priority = 4 
		alpha = 0.80000001192 
		flip_v 
	} 
	DoScreenElementMorph id = current_menu_title pos = PAIR(380.00000000000, 30.00000000000) time = 0.30000001192 
ENDSCRIPT

SCRIPT spin_menu_skater_script 
	select_skater_get_current_skater_name 
	IF NOT ( <current_skater> = custom ) 
		load_pro_skater { profile = 0 skater = 0 name = custom } 
	ENDIF 
	unpauseskaters 
	skater : Obj_GetID 
	MakeSkaterGoto SpinMenuSkaterIdle params = <...> 
	skater : hide 
ENDSCRIPT

SCRIPT spin_menu_camera_init 
	skater : Obj_GetID 
	SetActiveCamera id = skatercam0 
	skater : unhide 
	KillSkaterCamAnim all 
	PlaySkaterCamAnim { name = mainmenu_camera02 
		skater = 0 
		targetID = <objId> 
		targetOffset = mainmneu_cam_offset 
		positionOffset = VECTOR(0.00000000000, 0.00000000000, 160.00000000000) 
		play_hold 
		frames = 1 
	} 
ENDSCRIPT

spin_menu_skater_idling = 0 
spin_menu_skater_transitioning = 0 
SCRIPT SpinMenuGetSkaterAnim 
	IF ( spin_menu_skater_transitioning ) 
		change spin_menu_skater_transitioning = 0 
		RETURN anim = FrontEnd_Spin2Wheel 
	ENDIF 
	IF ( spin_menu_skater_idling ) 
		RETURN anim = RANDOM(1, 1, 1) RANDOMCASE FrontEnd_Wheel_Idle_1 RANDOMCASE FrontEnd_Wheel_Idle_2 RANDOMCASE FrontEnd_Wheel_Idle_3 RANDOMEND 
	ELSE 
		RETURN anim = RANDOM(3, 1) RANDOMCASE FrontEnd_Wheel_Spin_Idle RANDOMCASE FrontEnd_Wheel_Spin_Idle2 RANDOMEND 
	ENDIF 
ENDSCRIPT

SCRIPT SpinMenuSkaterIdle 
	IF GotParam reset 
		SkaterInit NoEndRun ReturnControl NoAnims 
		TurnOffSpecialItem 
		SwitchOnBoard 
		ClearExceptions 
		Obj_MoveToNode name = trg_playerrestart Orient NoReset 
		IF NOT Obj_HasModelLights 
			script_assert "No skater lighting!" 
		ENDIF 
		Obj_SetLightAmbientColor { 
			r = ( skater_ambient_color [ 0 ] ) 
			g = ( skater_ambient_color [ 1 ] ) 
			b = ( skater_ambient_color [ 2 ] ) 
		} 
		Obj_SetLightDiffuseColor { 
			index = 0 
			r = ( skater_diffuse_color1 [ 0 ] ) 
			g = ( skater_diffuse_color1 [ 1 ] ) 
			b = ( skater_diffuse_color1 [ 2 ] ) 
		} 
		Obj_SetLightDiffuseColor { 
			index = 1 
			r = ( skater_diffuse_color2 [ 0 ] ) 
			g = ( skater_diffuse_color2 [ 1 ] ) 
			b = ( skater_diffuse_color2 [ 2 ] ) 
		} 
		CancelRotateDisplay 
		DisablePlayerInput 
		SetRollingFriction 10000 
		SetSpeed 0 
		IF flipped 
			flip 
		ENDIF 
		PausePhysics 
	ENDIF 
	BEGIN 
		SpinMenuGetSkaterAnim 
		PlayAnim anim = <anim> Blendperiod = 0.20000000298 
		Obj_WaitAnimFinished 
	REPEAT 
ENDSCRIPT

SCRIPT SpinMenuSkaterAction 
	change spin_menu_skater_transitioning = 0 
	IF ( spin_menu_skater_idling ) 
		change spin_menu_skater_idling = 0 
	ENDIF 
	IF GotParam up 
		<anim> = FrontEnd_Wheel_Spin_Dwn 
	ELSE 
		IF GotParam down 
			<anim> = FrontEnd_Wheel_Spin_Up 
		ELSE 
			IF GotParam spin 
				<anim> = FrontEnd_Wheel_Spin_Hard 
			ENDIF 
		ENDIF 
	ENDIF 
	IF GotParam anim 
		PlayAnim anim = <anim> Blendperiod = 0.20000000298 
		Obj_WaitAnimFinished 
	ENDIF 
	MakeSkaterGoto SpinMenuSkaterIdle 
ENDSCRIPT

SCRIPT shadow_skater_script2 
	IF GotParam launched 
		wait 30 gameframes 
	ENDIF 
	unpauseskaters 
	SetActiveCamera id = skatercam0 
	skater : Obj_GetID 
	MakeSkaterGoto ShadowSkaterFreestyleAI params = <...> 
	targetOffset = mainmneu_cam_offset 
	positionOffset = VECTOR(0.00000000000, 0.00000000000, 160.00000000000) 
	KillSkaterCamAnim all 
	PlaySkaterCamAnim { name = mainmenu_camera02 
		skater = 0 
		targetID = <objId> 
		targetOffset = <targetOffset> 
		positionOffset = <positionOffset> 
		play_hold 
		frames = 1 
	} 
ENDSCRIPT

SCRIPT ShadowSkaterAI 
	SkaterInit NoEndRun ReturnControl NoAnims 
	TurnOffSpecialItem 
	SwitchOnBoard 
	ClearExceptions 
	IF NOT Obj_HasModelLights 
		script_assert "No skater lighting!" 
	ENDIF 
	SetSpeed 0 
	SetRollingFriction 999 
	Obj_SetLightAmbientColor r = 0 g = 0 b = 0 
	Obj_SetLightDiffuseColor index = 0 r = 0 g = 0 b = 0 
	Obj_SetLightDiffuseColor index = 1 r = 0 g = 0 b = 0 
	CancelRotateDisplay 
	DisablePlayerInput 
	SetRollingFriction 0 
	Obj_MoveToNode name = trg_playerrestart Orient NoReset 
	ShadowSkaterOptionsTricks 
ENDSCRIPT

SCRIPT ShadowSkaterOptionsTricks 
	KillSpawnedScript name = skaterDoOptionsTricks 
	IF ( in_options_menu = 1 ) 
		wait 5 gameframes 
		SpawnScript skaterDoOptionsTricks 
	ENDIF 
ENDSCRIPT

SCRIPT skaterDoOptionsTricks 
	skater : ShadowSkaterOptionsTrickScript 
ENDSCRIPT

SCRIPT ShadowSkaterOptionsTrickScript 
	SetSpeed 0 
	SetRollingFriction 999 
	SetSpeed 1 
	SetRollingFriction 5 
	type = ( RANDOM_NO_REPEAT(1, 1) RANDOMCASE 0 RANDOMCASE 1 RANDOMEND ) 
	IF ( <type> = 0 ) 
		PlayAnim { anim = crouchidle speed = 1.00000000000 Blendperiod = 0.20000000298 cycle } 
		wait 1.29999995232 seconds 
		PlayAnim { anim = ollie speed = 1.00000000000 Blendperiod = 0 } 
		Jump no_sound 
		WaitAnim 20 percent 
		anim = ( RANDOM_NO_REPEAT(1, 1, 1, 1, 1, 1, 1, 1, 1, 1) RANDOMCASE _360Flip RANDOMCASE kickflip RANDOMCASE heelflip RANDOMCASE impossible RANDOMCASE Hardflip RANDOMCASE varialkickflip RANDOMCASE varialheelflip RANDOMCASE PopShoveItBS RANDOMCASE NollieKickflip RANDOMCASE PopShoveIt RANDOMEND ) 
		PlayAnim { anim = <anim> speed = 1.00000000000 Blendperiod = 0.20000000298 } 
		Obj_WaitAnimFinished 
		PlayAnim { anim = crouchidle speed = 1.00000000000 Blendperiod = 0.20000000298 cycle } 
	ELSE 
		anim = ( RANDOM_NO_REPEAT(1, 1) RANDOMCASE NoseManual_Range RANDOMCASE Manual_Range RANDOMEND ) 
		PlayAnim { anim = crouchidle speed = 1.00000000000 Blendperiod = 0.20000000298 cycle } 
		wait 0.60000002384 seconds 
		PlayAnim { anim = <anim> speed = 1.00000000000 from = 20 to = 60 Blendperiod = 0.50000000000 } 
		Obj_WaitAnimFinished 
		PlayAnim { anim = <anim> speed = 1.00000000000 backwards from = 20 to = 60 Blendperiod = 0.20000000298 } 
		Obj_WaitAnimFinished 
		PlayAnim { anim = crouchidle speed = 1.00000000000 Blendperiod = 0.20000000298 cycle } 
	ENDIF 
ENDSCRIPT

SCRIPT ShadowSkaterFreestyleAI 
	KillSpawnedScript name = ShadowSkaterOptionsTrickScript 
	IF GotParam make_it_safe 
		SkaterInit NoEndRun ReturnControl NoAnims 
		TurnOffSpecialItem 
		SwitchOnBoard 
		ClearExceptions 
		Obj_MoveToNode name = trg_playerrestart Orient NoReset 
		IF NOT GotParam leave_lights 
			IF NOT Obj_HasModelLights 
				script_assert "No skater lighting!" 
			ENDIF 
			Obj_SetLightAmbientColor { 
				r = ( skater_ambient_color [ 0 ] ) 
				g = ( skater_ambient_color [ 1 ] ) 
				b = ( skater_ambient_color [ 2 ] ) 
			} 
			Obj_SetLightDiffuseColor { 
				index = 0 
				r = ( skater_diffuse_color1 [ 0 ] ) 
				g = ( skater_diffuse_color1 [ 1 ] ) 
				b = ( skater_diffuse_color1 [ 2 ] ) 
			} 
			Obj_SetLightDiffuseColor { 
				index = 1 
				r = ( skater_diffuse_color2 [ 0 ] ) 
				g = ( skater_diffuse_color2 [ 1 ] ) 
				b = ( skater_diffuse_color2 [ 2 ] ) 
			} 
		ENDIF 
		CancelRotateDisplay 
		DisablePlayerInput 
		SetRollingFriction 10000 
		SetSpeed 0 
		flip 
	ELSE 
		Obj_WaitAnimFinished 
	ENDIF 
	BEGIN 
		PlayAnim anim = Ped_M_Idle1 
		wait 2 second 
	REPEAT 
ENDSCRIPT

SCRIPT ShadowSkaterTauntAI 
	
	KillSpawnedScript name = ShadowSkaterOptionsTrickScript 
	IF GotParam make_it_safe 
		SkaterInit NoEndRun ReturnControl NoAnims 
		TurnOffSpecialItem 
		SwitchOnBoard 
		ClearExceptions 
		IF NOT Obj_HasModelLights 
			script_assert "No skater lighting!" 
		ENDIF 
		Obj_SetLightAmbientColor r = 0 g = 0 b = 0 
		Obj_SetLightDiffuseColor index = 0 r = 0 g = 0 b = 0 
		Obj_SetLightDiffuseColor index = 1 r = 0 g = 0 b = 0 
		CancelRotateDisplay 
		DisablePlayerInput 
		SetRollingFriction 10000 
		SetSpeed 0 
		Obj_MoveToPos VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
		IF NOT flipped 
			flip 
		ENDIF 
	ELSE 
		Obj_WaitAnimFinished 
	ENDIF 
	PlayAnim anim = Idle cycle 
ENDSCRIPT

ped_profile_list = [ 
	{ 
		display_name = "THPS1 Tony Hawk" 
		ped_appearance_structure = appearance_thps_hawk 
		ped_group_flag = SKATER_UNLOCKED_THPS 
		tag_texture = "tags\\thps_01" 
	} 
	{ 
		display_name = "The Hand" 
		skater_profile = Hand 
		ped_appearance_structure = appearance_hand 
		ped_group_flag = SKATER_UNLOCKED_HAND 
		tag_texture = "tags\\hnd_01" 
	} 
	{ 
		display_name = "Jesse James" 
		skater_profile = JesseJamesSkater 
		ped_appearance_structure = Ped_segwayrider 
		ped_group_flag = SKATER_UNLOCKED_JESSEJAMES 
		tag_texture = "tags\\jam_01" 
	} 
	{ 
		display_name = "Natas Kaupas" 
		ped_appearance_structure = Ped_Natas 
		ped_group_flag = SKATER_UNLOCKED_NATAS 
		tag_texture = "tags\\nts_01" 
	} 
	{ 
		display_name = "Phil Margera" 
		ped_appearance_structure = Phil_Gagged 
		ped_group_flag = SKATER_UNLOCKED_PHIL 
		tag_texture = "tags\\phil_01" 
	} 
	{ 
		display_name = "Steve-O" 
		skater_profile = SteveoSkater 
		ped_appearance_structure = Ped_mechbull 
		ped_group_flag = SKATER_UNLOCKED_STEVEO 
		tag_texture = "tags\\stv_01" 
	} 
	{ 
		display_name = "Nigel Beaverhausen" 
		ped_appearance_structure = Nigel_Costume 
		ped_group_flag = SKATER_UNLOCKED_NIGEL 
		tag_texture = "tags\\bev_01" 
	} 
	{ 
		display_name = "Paulie Ryan" 
		skater_profile = PaulieSkater 
		ped_appearance_structure = paulie_full 
		ped_group_flag = SKATER_UNLOCKED_PAULIE 
		tag_texture = "tags\\paul_01" 
	} 
	{ 
		display_name = "Aborigine" 
		ped_appearance_structure = Ped_aborigine 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP6 
		tag_texture = "tags\\aborigine" 
	} 
	{ 
		display_name = "Alien" 
		ped_appearance_structure = Ped_Alien 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP1 
		tag_texture = "tags\\alien" 
	} 
	{ 
		display_name = "Alien Doctor" 
		ped_appearance_structure = Ped_AlienDoctor 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP2 
		tag_texture = "tags\\alien_dr" 
	} 
	{ 
		display_name = "Alien Leader" 
		ped_appearance_structure = Ped_AlienLeader 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP4 
		tag_texture = "tags\\alien_leader" 
	} 
	{ 
		display_name = "Australian Cop" 
		ped_appearance_structure = Ped_copaussie 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP7 
		tag_texture = "tags\\OZ_cop" 
	} 
	{ 
		display_name = "Bigfoot" 
		ped_appearance_structure = Ped_Bigfoot 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP5 
		tag_texture = "tags\\bigfoot" 
	} 
	{ 
		display_name = "Bigfoot One" 
		ped_appearance_structure = Ped_Bigfoot_graf 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP8 
		tag_texture = "tags\\bigfoot_1" 
	} 
	{ 
		display_name = "Boat Captain" 
		ped_appearance_structure = Ped_boatcaptain 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP2 
		tag_texture = "tags\\boat_capt" 
	} 
	{ 
		display_name = "Boxer" 
		ped_appearance_structure = Ped_Boxer 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP8 
		tag_texture = "tags\\boxer" 
	} 
	{ 
		display_name = "Bratwurst Vendor" 
		ped_appearance_structure = Ped_Bratwurst 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP7 
		tag_texture = "tags\\brat_vendor" 
	} 
	{ 
		display_name = "Camera Man" 
		ped_appearance_structure = Ped_CameraMan 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP6 
		tag_texture = "tags\\camera_man" 
	} 
	{ 
		display_name = "Construction Worker" 
		ped_appearance_structure = Ped_Construction_Worker_01 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP6 
		tag_texture = "tags\\construction_worker" 
	} 
	{ 
		display_name = "Corn Vendor" 
		ped_appearance_structure = Ped_Corn_Vendor_01 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP7 
		tag_texture = "tags\\corn_vendor" 
	} 
	{ 
		display_name = "Cut Chemist" 
		ped_appearance_structure = Ped_CutChemist 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP6 
		tag_texture = "tags\\cut_chemist" 
	} 
	{ 
		display_name = "Flute Player" 
		ped_appearance_structure = Ped_FluteGuy 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP8 
		tag_texture = "tags\\flute_player" 
	} 
	{ 
		display_name = "Geeky Kid" 
		ped_appearance_structure = Ped_Nerdkid 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP1 
		tag_texture = "tags\\geeky_kid" 
	} 
	{ 
		display_name = "German Cop" 
		ped_appearance_structure = Ped_germancop 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP7 
		tag_texture = "tags\\german_cop" 
	} 
	{ 
		display_name = "German Drunk 1" 
		ped_appearance_structure = Ped_germandrunk 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP3 
		tag_texture = "tags\\german_drunk_1" 
	} 
	{ 
		display_name = "German Drunk 2" 
		ped_appearance_structure = Ped_germandrunk01 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP6 
		tag_texture = "tags\\german_drunk_2" 
	} 
	{ 
		display_name = "German Drunk 3" 
		ped_appearance_structure = Ped_germandrunk02 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP7 
		tag_texture = "tags\\german_drunk_3" 
	} 
	{ 
		display_name = "Graffiti Punk" 
		ped_appearance_structure = Ped_Grafiti_Punker_01 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP6 
		tag_texture = "tags\\graffiti_punk" 
	} 
	{ 
		display_name = "Guitar Player" 
		ped_appearance_structure = Ped_guitarist 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP8 
		tag_texture = "tags\\guitarist" 
	} 
	{ 
		display_name = "Horn Player" 
		ped_appearance_structure = Ped_jazzman1 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP7 
		tag_texture = "tags\\horn_player" 
	} 
	{ 
		display_name = "Hospital Attendant" 
		ped_appearance_structure = Ped_attendant 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP6 
		tag_texture = "tags\\attendant" 
	} 
	{ 
		display_name = "Imp" 
		ped_appearance_structure = Ped_Imp 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP5 
		tag_texture = "tags\\imp" 
	} 
	{ 
		display_name = "Inline Skater" 
		ped_appearance_structure = Ped_rollerblader 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP4 
		tag_texture = "tags\\inline_skater" 
	} 
	{ 
		display_name = "Lifeguard" 
		ped_appearance_structure = Ped_Lifeguard 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP6 
		tag_texture = "tags\\lifeguard" 
	} 
	{ 
		display_name = "Lounge Singer" 
		ped_appearance_structure = Ped_loungesinger 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP8 
		tag_texture = "tags\\lounge_singer" 
	} 
	{ 
		display_name = "Lost Soul 1" 
		ped_appearance_structure = Ped_LostSoul01 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP2 
		tag_texture = "tags\\lost_soul_1" 
	} 
	{ 
		display_name = "Lost Soul 2" 
		ped_appearance_structure = Ped_LostSoul02 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP7 
		tag_texture = "tags\\lost_soul_2" 
	} 
	{ 
		display_name = "Lost Soul 3" 
		ped_appearance_structure = Ped_LostSoul03 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP8 
		tag_texture = "tags\\lost_soul_3" 
	} 
	{ 
		display_name = "Mayan" 
		ped_appearance_structure = Ped_Mayan 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP6 
		tag_texture = "tags\\mayan" 
	} 
	{ 
		display_name = "Mayan Tiki Mask" 
		ped_appearance_structure = Ped_TikiMan 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP8 
		tag_texture = "tags\\mayan_mask" 
	} 
	{ 
		display_name = "Metal Detector Guy" 
		ped_appearance_structure = Ped_metaldetector 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP7 
		tag_texture = "tags\\metal_detector" 
	} 
	{ 
		display_name = "Mime" 
		ped_appearance_structure = Ped_mime 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP3 
		tag_texture = "tags\\mime" 
	} 
	{ 
		display_name = "Paramedic" 
		ped_appearance_structure = Ped_Paramedic_01 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP8 
		tag_texture = "tags\\paramedic" 
	} 
	{ 
		display_name = "Pirate" 
		ped_appearance_structure = Ped_Pirate 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP7 
		tag_texture = "tags\\pirate" 
	} 
	{ 
		display_name = "Ramp Kid" 
		ped_appearance_structure = Ped_Ramp_Kid_01 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP4 
		tag_texture = "tags\\ramp_kid" 
	} 
	{ 
		display_name = "Revolutionary Soldier" 
		ped_appearance_structure = Ped_Soldier_01 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP6 
		tag_texture = "tags\\soldier" 
	} 
	{ 
		display_name = "Security Guard" 
		ped_appearance_structure = Ped_Security_Guard_01 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP8 
		tag_texture = "tags\\security_guard" 
	} 
	{ 
		display_name = "Skaboto" 
		ped_appearance_structure = Ped_Skaboto 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP8 
		tag_texture = "tags\\skaboto" 
	} 
	{ 
		display_name = "Skatopia Punk" 
		ped_appearance_structure = Ped_Skatopiaguy 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP7 
		tag_texture = "tags\\skatopia_punk" 
	} 
	{ 
		display_name = "Space Monkey 1" 
		ped_appearance_structure = Ped_dalek 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP1 
		tag_texture = "tags\\dalek_1" 
	} 
	{ 
		display_name = "Space Monkey 2" 
		ped_appearance_structure = Ped_dalekPink 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP5 
		tag_texture = "tags\\dalek_2" 
	} 
	{ 
		display_name = "Space Monkey 3" 
		ped_appearance_structure = Ped_dalekBlue 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP8 
		tag_texture = "tags\\dalek_3" 
	} 
	{ 
		display_name = "Voodoo Doctor" 
		ped_appearance_structure = Ped_witchdoctor 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP6 
		tag_texture = "tags\\voodoo_dr" 
	} 
	{ 
		display_name = "Wiener Vendor" 
		ped_appearance_structure = Ped_Wienerman 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP8 
		tag_texture = "tags\\wiener_man" 
	} 
	{ 
		display_name = "Zombie 1" 
		ped_appearance_structure = Ped_zombiemale01 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP3 
		tag_texture = "tags\\zombie1" 
	} 
	{ 
		display_name = "Zombie 2" 
		ped_appearance_structure = Ped_zombiemale02 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP7 
		tag_texture = "tags\\zombie2" 
	} 
	{ 
		display_name = "Nick" 
		ped_appearance_structure = appearance_Nick_SecretGuy 
		ped_group_flag = SKATER_UNLOCKED_SECRETPC2 
		tag_texture = "tags\\cas_01" 
	} 
] 
Cheat_Array_PS2 = [ 
	{ c1 = 545841905 c2 = 84713469 CheatScript = cheat_unlock_always_special } , 
	{ c1 = -583947711 c2 = -1240660229 CheatScript = cheat_unlock_perfect_rail } , 
	{ c1 = -1345692571 c2 = 703699882 CheatScript = cheat_unlock_perfect_skitch } , 
	{ c1 = -1223130875 c2 = 715658530 CheatScript = cheat_unlock_perfect_manual } , 
	{ c1 = 55099068 c2 = 1958650257 CheatScript = cheat_unlock_moon_grav } , 
	{ c1 = 1344548858 c2 = -927109724 CheatScript = cheat_unlock_pedgroup1 } , 
	{ c1 = 285918770 c2 = 1603341981 CheatScript = cheat_unlock_pedgroup2 } , 
	{ c1 = -1396779224 c2 = -1073220455 CheatScript = cheat_unlock_pedgroup3 } , 
	{ c1 = -1782492827 c2 = -640838653 CheatScript = cheat_unlock_pedgroup4 } , 
	{ c1 = -1693513812 c2 = -228863361 CheatScript = cheat_unlock_pedgroup5 } , 
	{ c1 = 1891226589 c2 = -854662387 CheatScript = cheat_unlock_pedgroup6 } , 
	{ c1 = 845877638 c2 = -544801105 CheatScript = cheat_unlock_pedgroup7 } , 
	{ c1 = -53690407 c2 = -977021967 CheatScript = cheat_unlock_pedgroup8 } , 
	{ c1 = 170978007 c2 = -566211124 CheatScript = cheat_give_shrek } , 
	{ c1 = 1519669830 c2 = -2005756819 CheatScript = cheat_give_soldier } , 
	{ c1 = 1932251332 c2 = 2016179590 CheatScript = cheat_give_phil } , 
	{ c1 = -615110808 c2 = -1734759928 CheatScript = cheat_give_hand } , 
	{ c1 = -1050231328 c2 = 826772284 CheatScript = cheat_give_paulie } , 
	{ c1 = -218547029 c2 = -348688460 CheatScript = cheat_give_nigel } , 
	{ c1 = 308960353 c2 = 486659919 CheatScript = cheat_give_steveo } , 
	{ c1 = -1274239892 c2 = 190985262 CheatScript = cheat_give_jesse } , 
	{ c1 = 1518124631 c2 = 2063664936 CheatScript = cheat_give_thps } , 
	{ c1 = -894413638 c2 = 872184104 CheatScript = cheat_give_natas } , 
	{ c1 = 732008750 c2 = 1439874859 CheatScript = cheat_unlockmovies } , 
	{ c1 = -438074064 c2 = 226203349 CheatScript = cheat_reallygivelevels } , 
	{ c1 = -856409528 c2 = 1701196796 CheatScript = cheat_give_story_skaters } , 
	{ c1 = 91444980 c2 = 392468884 CheatScript = unlock_all_cheats } , 
	{ c1 = -806439674 c2 = -388533228 CheatScript = cheat_select_shift } , 
	{ c1 = -1493081239 c2 = 1180396759 CheatScript = cheat_sce_patchtest } , 
] 
Cheat_Array_Xbox = [ 
	{ c1 = 545841905 c2 = 84713469 CheatScript = cheat_unlock_always_special } , 
	{ c1 = -583947711 c2 = -1240660229 CheatScript = cheat_unlock_perfect_rail } , 
	{ c1 = -1345692571 c2 = 703699882 CheatScript = cheat_unlock_perfect_skitch } , 
	{ c1 = -1223130875 c2 = 715658530 CheatScript = cheat_unlock_perfect_manual } , 
	{ c1 = 55099068 c2 = 1958650257 CheatScript = cheat_unlock_moon_grav } , 
	{ c1 = 1344548858 c2 = -927109724 CheatScript = cheat_unlock_pedgroup1 } , 
	{ c1 = 285918770 c2 = 1603341981 CheatScript = cheat_unlock_pedgroup2 } , 
	{ c1 = -1396779224 c2 = -1073220455 CheatScript = cheat_unlock_pedgroup3 } , 
	{ c1 = -1782492827 c2 = -640838653 CheatScript = cheat_unlock_pedgroup4 } , 
	{ c1 = -1693513812 c2 = -228863361 CheatScript = cheat_unlock_pedgroup5 } , 
	{ c1 = 1891226589 c2 = -854662387 CheatScript = cheat_unlock_pedgroup6 } , 
	{ c1 = 845877638 c2 = -544801105 CheatScript = cheat_unlock_pedgroup7 } , 
	{ c1 = -53690407 c2 = -977021967 CheatScript = cheat_unlock_pedgroup8 } , 
	{ c1 = -303100549 c2 = -863936501 CheatScript = cheat_give_shrek } , 
	{ c1 = 1056673164 c2 = -732347542 CheatScript = cheat_give_soldier } , 
	{ c1 = 183490368 c2 = 912427169 CheatScript = cheat_give_phil } , 
	{ c1 = -16749197 c2 = 460243178 CheatScript = cheat_give_hand } , 
	{ c1 = -1333030372 c2 = 1370788918 CheatScript = cheat_give_paulie } , 
	{ c1 = -676492935 c2 = -66972016 CheatScript = cheat_give_nigel } , 
	{ c1 = 12676939 c2 = -1435521434 CheatScript = cheat_give_steveo } , 
	{ c1 = -601691221 c2 = -752390296 CheatScript = cheat_give_jesse } , 
	{ c1 = 170735393 c2 = 1091967566 CheatScript = cheat_give_thps } , 
	{ c1 = 371805994 c2 = -1595871973 CheatScript = cheat_give_natas } , 
	{ c1 = -982563233 c2 = -597069101 CheatScript = unlock_PC_secret_character2 } , 
	{ c1 = 475224047 c2 = -1197708078 CheatScript = cheat_unlockmovies } , 
	{ c1 = -961267055 c2 = 720938718 CheatScript = cheat_reallygivelevels } , 
	{ c1 = 634158371 c2 = -1664558761 CheatScript = cheat_give_story_skaters } , 
	{ c1 = -1876658675 c2 = 1905700282 CheatScript = unlock_all_cheats } , 
	{ c1 = -806439674 c2 = -388533228 CheatScript = cheat_select_shift } , 
] 
Cheat_Array_Gamecube = [ 
	{ c1 = 545841905 c2 = 84713469 CheatScript = cheat_unlock_always_special } , 
	{ c1 = -583947711 c2 = -1240660229 CheatScript = cheat_unlock_perfect_rail } , 
	{ c1 = -1345692571 c2 = 703699882 CheatScript = cheat_unlock_perfect_skitch } , 
	{ c1 = -1223130875 c2 = 715658530 CheatScript = cheat_unlock_perfect_manual } , 
	{ c1 = 55099068 c2 = 1958650257 CheatScript = cheat_unlock_moon_grav } , 
	{ c1 = 1344548858 c2 = -927109724 CheatScript = cheat_unlock_pedgroup1 } , 
	{ c1 = 285918770 c2 = 1603341981 CheatScript = cheat_unlock_pedgroup2 } , 
	{ c1 = -1396779224 c2 = -1073220455 CheatScript = cheat_unlock_pedgroup3 } , 
	{ c1 = -1782492827 c2 = -640838653 CheatScript = cheat_unlock_pedgroup4 } , 
	{ c1 = -1693513812 c2 = -228863361 CheatScript = cheat_unlock_pedgroup5 } , 
	{ c1 = 1891226589 c2 = -854662387 CheatScript = cheat_unlock_pedgroup6 } , 
	{ c1 = 845877638 c2 = -544801105 CheatScript = cheat_unlock_pedgroup7 } , 
	{ c1 = -53690407 c2 = -977021967 CheatScript = cheat_unlock_pedgroup8 } , 
	{ c1 = 170978007 c2 = -566211124 CheatScript = cheat_give_shrek } , 
	{ c1 = 649428403 c2 = -1098547668 CheatScript = cheat_give_soldier } , 
	{ c1 = 128307069 c2 = 928653172 CheatScript = cheat_give_phil } , 
	{ c1 = 379679930 c2 = 1875427755 CheatScript = cheat_give_hand } , 
	{ c1 = -1421658672 c2 = 1181521849 CheatScript = cheat_give_paulie } , 
	{ c1 = 948655059 c2 = -969410848 CheatScript = cheat_give_nigel } , 
	{ c1 = -647890074 c2 = 264051307 CheatScript = cheat_give_steveo } , 
	{ c1 = 1449630157 c2 = 1853352064 CheatScript = cheat_give_jesse } , 
	{ c1 = 2117264192 c2 = 933696620 CheatScript = cheat_give_thps } , 
	{ c1 = -334042047 c2 = 602512449 CheatScript = cheat_give_natas } , 
	{ c1 = 952447539 c2 = 1258891340 CheatScript = cheat_unlockmovies } , 
	{ c1 = -2008980294 c2 = 1671116804 CheatScript = cheat_reallygivelevels } , 
	{ c1 = 1603485155 c2 = -571160259 CheatScript = cheat_give_story_skaters } , 
	{ c1 = 14630830 c2 = -2025296367 CheatScript = unlock_all_cheats } , 
	{ c1 = -806439674 c2 = -388533228 CheatScript = cheat_select_shift } , 
] 
SCRIPT create_createamodes_menu 
	IF ( DEMO_BUILD = 1 ) 
	ENDIF 
	main_menu_wait_until_all_clear 
	change main_menu_return_to_createamodes = 1 
	make_new_roundbar_menu title = "CREATE-A-MODES" pos = PAIR(130.00000000000, 100.00000000000) use_icons spacing = 6 pad_back_script = generic_menu_pad_back pad_back_params = { callback = create_main_menu } 
	IF GotParam launched 
		spin_menu_skater_script reset 
	ELSE 
		MakeSkaterGoto SpinMenuSkaterIdle params = { reset } 
	ENDIF 
	change cas_cam_angle = 0 
	cas_setup_rotating_camera cam_anim = create_modes_camera 
	pulse_blur speed = 2 start = 255 
	add_roundbar_menu_item { 
		text = "CREATE-A-SKATER" 
		id = menu_cas 
		pad_choose_script = createamodes_menu_exit 
		pad_choose_params = { 
			new_menu_script = cas_mainmenu_startup 
			change_cas_from_main 
		} 
		icon = mainicon_cas 
	} 
	add_roundbar_menu_item { 
		text = "CREATE-A-PARK" 
		id = menu_parked 
		pad_choose_script = createamodes_menu_exit 
		pad_choose_params = { 
			new_menu_script = launch_park_editor 
		} 
		icon = mainicon_cap 
		<demo_build_item_active> 
	} 
	add_roundbar_menu_item { 
		text = "CREATE-A-GRAPHIC" 
		id = menu_cagr 
		pad_choose_script = createamodes_menu_exit 
		pad_choose_params = { 
			new_menu_script = edit_graphic_launch_cagr 
		} 
		icon = mainicon_cagr 
	} 
	add_roundbar_menu_item { 
		text = "CREATE-A-GOAL" 
		id = menu_creategoals 
		pad_choose_script = createamodes_menu_exit 
		pad_choose_params = { 
			new_menu_script = create_select_goals_menu 
			change_gamemode = change_gamemode_creategoals 
		} 
		icon = mainicon_cag 
		<demo_build_item_active> 
	} 
	add_roundbar_menu_item { 
		text = "CREATE-A-TRICK" 
		id = menu_cat 
		pad_choose_script = createamodes_menu_exit 
		pad_choose_params = { 
			new_menu_script = cat_launch_bo 
			change_gamemode = change_gamemode_singlesession 
			set_cat_mode_flag 
		} 
		icon = mainicon_cat 
		<demo_build_item_active> 
	} 
	draw_menu_background create_mode 
	roundbar_menu_finish build_pause_parts = 0 
ENDSCRIPT

SCRIPT createamodes_menu_exit 
	IF GotParam change_cas_from_main 
		change entered_cas_from_main = 1 
	ENDIF 
	IF GotParam set_cat_mode_flag 
		change launch_to_createatrick = 1 
	ELSE 
		change launch_to_createatrick = 0 
	ENDIF 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	<new_menu_script> <...> 
ENDSCRIPT

SCRIPT cancel_quit_game 
	dialog_box_exit 
	create_main_menu 
ENDSCRIPT

SCRIPT confirm_quit_game 
	menu_confirm_quit { 
		yes_script = quit_game 
		back_script = cancel_quit_game 
		no_script = cancel_quit_game 
	} 
ENDSCRIPT

SCRIPT main_menu_exit_game 
	menu_confirm_quit { 
		yes_script = quit_game 
		back_script = cancel_quit_game 
		no_script = cancel_quit_game 
	} 
ENDSCRIPT

SCRIPT quit_game 
	QuitGame 
ENDSCRIPT

SCRIPT create_gamemode_options_menu 
	dialog_box_exit 
	IF GotParam change_gamemode 
		<change_gamemode> 
	ENDIF 
	change cas_cam_angle = 0 
	cas_setup_rotating_camera cam_anim = story_mode_menu 
	IF GameModeEquals is_classic 
		mode_text = "CLASSIC MODE" 
		mode_flag = CLASSIC_STARTED 
		continue_script = launch_select_skater_menu 
	ELSE 
		mode_text = "STORY MODE" 
		mode_flag = CAREER_STARTED 
		continue_script = story_options_change_level 
	ENDIF 
	make_new_roundbar_menu title = ( <mode_text> + " OPTIONS" ) pos = PAIR(130.00000000000, 100.00000000000) spacing = 6 pad_back_script = generic_menu_pad_back pad_back_params = { callback = create_main_menu } vmenu_id = career_options_vmenu 
	IF GameModeEquals is_career 
		IF NOT CD 
			add_roundbar_menu_item { 
				text = "LEVEL SELECT" 
				id = ss_play_level 
				pad_choose_script = gamemode_options_menu_exit 
				pad_choose_params = { 
					new_menu_script = launch_level_select_menu 
				} 
			} 
		ENDIF 
	ENDIF 
	IF GetGlobalFlag flag = <mode_flag> 
		add_roundbar_menu_item { 
			text = ( "CONTINUE " + <mode_text> ) 
			id = ss_continue_story 
			pad_choose_script = gamemode_options_menu_exit 
			pad_choose_params = { 
				new_menu_script = <continue_script> 
				continue_story 
			} 
		} 
		add_roundbar_menu_item { 
			text = ( "START NEW " + <mode_text> ) 
			id = ss_new_story 
			pad_choose_script = gamemode_overwrite_warning 
		} 
		add_roundbar_menu_item { 
			text = ( "LOAD GAME PROGRESS" ) 
			id = ss_load_story 
			pad_choose_script = gamemode_overwrite_warning 
			pad_choose_params = { 
				load 
				pad_choose_script = launch_career_menu_load_game_sequence 
			} 
		} 
	ELSE 
		reset_gamemode 
		add_roundbar_menu_item { 
			text = ( "CONTINUE " + <mode_text> ) 
			id = ss_continue_story 
			pad_choose_script = null_script 
			not_focusable 
		} 
		add_roundbar_menu_item { 
			text = ( "START NEW " + <mode_text> ) 
			id = ss_new_story 
			pad_choose_script = gamemode_options_menu_exit 
			pad_choose_params = { 
				new_menu_script = create_gamemode_difficulty_menu 
			} 
		} 
		add_roundbar_menu_item { 
			text = ( "LOAD GAME PROGRESS" ) 
			id = ss_load_story 
			pad_choose_script = gamemode_options_menu_exit 
			pad_choose_params = { 
				new_menu_script = launch_career_menu_load_game_sequence 
				from_career 
			} 
		} 
	ENDIF 
	IF NOT GameModeEquals is_classic 
		draw_menu_background story_mode story_wdt 
	ELSE 
		draw_menu_background story_mode 
	ENDIF 
	roundbar_menu_finish build_pause_parts = 0 
ENDSCRIPT

SCRIPT gamemode_options_menu_exit 
	IF GotParam show_skater 
		skater : unhide 
	ENDIF 
	dialog_box_exit 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	IF GameModeEquals is_classic 
		IF GotParam just_started_game 
			GetInitialsString 
			IF StringEquals a = <string> b = "ABC" 
				high_scores_menu_enter_initials <...> allow_back keyboard_cancel_script = create_gamemode_difficulty_menu 
				RETURN 
			ENDIF 
		ENDIF 
	ENDIF 
	safe_callback = <new_menu_script> 
	RemoveParameter new_menu_script 
	<safe_callback> <...> 
ENDSCRIPT

SCRIPT gamemode_overwrite_warning pad_choose_script = gamemode_options_menu_exit 
	IF GameModeEquals is_classic 
		mode_text = "Classic Mode" 
	ELSE 
		mode_text = "Story Mode" 
	ENDIF 
	IF GotParam load 
		mode_text = "Game progress" 
		FormatText { 
			TextName = title 
			"Load %m" 
			m = <mode_text> 
		} 
		extra_text = "\\n Continue? " 
	ELSE 
		FormatText { 
			TextName = title 
			"Start New %m" 
			m = <mode_text> 
		} 
		extra_text = "\\n\\nNote: Items unlocked from beating the game will not be lost.\\nContinue?" 
	ENDIF 
	FormatText { 
		TextName = text 
		#"Warning !\\nAny unsaved changes to your current %m will be lost.%e" 
		m = <mode_text> 
		e = <extra_text> 
	} 
	FireEvent type = unfocus target = current_menu_anchor 
	DoScreenElementMorph id = career_options_vmenu alpha = 0 time = 0.10000000149 
	create_snazzy_dialog_box { 
		title = <title> 
		text = <text> 
		text_dims = PAIR(400.00000000000, 0.00000000000) 
		no_bg 
		pad_back_script = cancel_gamemode_overwrite 
		buttons = [ { font = small text = #"No" pad_choose_script = cancel_gamemode_overwrite } 
			{ font = small text = #"Yes" 
				pad_choose_script = <pad_choose_script> 
				pad_choose_params = 
				{ 
					new_menu_script = reset_gamemode 
					create_difficulty_menu 
				} 
			} 
		] 
	} 
ENDSCRIPT

SCRIPT cancel_gamemode_overwrite 
	dialog_box_exit 
	DoScreenElementMorph id = career_options_vmenu alpha = 1 time = 0.10000000149 
	FireEvent type = focus target = current_menu_anchor 
	SetScreenElementLock id = current_menu_anchor off 
	create_helper_text generic_helper_text 
ENDSCRIPT

SCRIPT reset_gamemode 
	IF GameModeEquals is_classic 
		
		UnsetGlobalFlag flag = CLASSIC_STARTED 
		clear_flag_array = CLASSIC_CLEAR_GLOBAL_FLAGS 
		need_flags_cleared = 1 
		reset_mode = classic 
	ELSE 
		
		SetCurrentChapter chapter = 0 
		ResetChapterStatus 
		ForEachSkaterName do = ResetToDefaultProfile params = { partial = stats_and_tricks } 
		GetCurrentSkaterProfileIndex 
		UpdateTrickMappings skater = <currentSkaterProfileIndex> 
		UnsetGlobalFlag flag = CAREER_STARTED 
		clear_flag_array = STORY_CLEAR_GLOBAL_FLAGS 
		need_flags_cleared = 1 
		reset_mode = career 
	ENDIF 
	CareerReset <reset_mode> 
	GoalManager_ResetCareer <reset_mode> 
	IF ( <need_flags_cleared> = 1 ) 
		index = 0 
		BEGIN 
			IF ArrayContains array = <clear_flag_array> contains = <index> 
				UnsetGlobalFlag flag = <index> 
			ENDIF 
			<index> = ( <index> + 1 ) 
		REPEAT 512 
	ENDIF 
	SetStartingLevelFlags 
	IF GotParam create_difficulty_menu 
		create_gamemode_difficulty_menu 
	ENDIF 
ENDSCRIPT

SCRIPT create_gamemode_difficulty_menu 
	dialog_box_exit 
	skater : hide 
	IF GotParam from_ss_menu 
		new_menu_script = launch_ss_menu 
	ELSE 
		new_menu_script = create_gamemode_options_menu 
	ENDIF 
	make_new_roundbar_menu { 
		pad_back_script = generic_menu_pad_back 
		pad_back_params = { callback = gamemode_options_menu_exit new_menu_script = <new_menu_script> no_animate show_skater } 
		pos = PAIR(100.00000000000, 100.00000000000) 
		dims = PAIR(230.00000000000, 480.00000000000) 
		additional_create_script = pause_create_tipbox 
		additional_focus_script = pause_focus_tipbox 
		additional_unfocus_script = pause_unfocus_tipbox 
		internal_text_just = right 
		helper_text = <helper> 
	} 
	build_theme_sub_title title = "DIFFICULTY" 
	starting_difficulty = 0 
	IF NOT GameModeEquals is_classic 
		add_roundbar_menu_item { text = #"Easy" 
			pad_choose_script = gamemode_options_menu_exit 
			pad_choose_params = { new_menu_script = set_gamemode_difficulty dif = <starting_difficulty> from_ss_menu = <from_ss_menu> } 
			tip_text = "Less difficult goals for those fairly new to the Tony Hawk series" 
			additional_width = PAIR(100.00000000000, 0.00000000000) 
		} 
		starting_difficulty = 1 
	ENDIF 
	add_roundbar_menu_item { text = #"Normal" 
		pad_choose_script = gamemode_options_menu_exit 
		pad_choose_params = { new_menu_script = set_gamemode_difficulty dif = <starting_difficulty> from_ss_menu = <from_ss_menu> } 
		tip_text = "Challenging goals for the average to good Tony Hawk player" 
		additional_width = PAIR(100.00000000000, 0.00000000000) 
		tag_grid_x = 1 
	} 
	IF NOT GotParam from_ss_menu 
		add_roundbar_menu_item { text = #"Sick" 
			pad_choose_script = gamemode_options_menu_exit 
			pad_choose_params = { new_menu_script = set_gamemode_difficulty dif = ( <starting_difficulty> + 1 ) from_ss_menu = <from_ss_menu> } 
			tip_text = "For hardcore veterans who have mastered the Tony Hawk games" 
			additional_width = PAIR(100.00000000000, 0.00000000000) 
		} 
	ENDIF 
	IF NOT GameModeEquals is_classic 
		draw_menu_background story_mode story_wdt difficulty 
	ELSE 
		draw_menu_background story_mode difficulty 
	ENDIF 
	roundbar_menu_finish data = { grid_index = 1 } 
ENDSCRIPT

SCRIPT set_gamemode_difficulty 
	GoalManager_SetDifficultyLevel <dif> 
	IF GameModeEquals is_classic 
		pad_choose_script = launch_select_skater_menu 
		SetGlobalFlag flag = CLASSIC_STARTED 
	ENDIF 
	IF GameModeEquals is_career 
		pad_choose_script = story_options_change_level 
		ResetArcadeScores 
		skater : StatsManager_ReInit 
	ENDIF 
	IF GotParam set_flag 
		SetGlobalFlag flag = <flag> 
	ENDIF 
	IF NOT GotParam from_ss_menu 
		skater : remove_skater_from_world 
		change check_for_unplugged_controllers = 0 
		gamemode_options_menu_exit { new_menu_script = <pad_choose_script> kill_all just_started_game } 
	ELSE 
		launch_ss_menu no_animate 
	ENDIF 
ENDSCRIPT

spin_menu_angles = [ 
	0.00000000000 
	22.50000000000 
	45.00000000000 
	67.50000000000 
	90.00000000000 
	112.50000000000 
	135.00000000000 
	157.50000000000 
	180.00000000000 
	202.50000000000 
	225.00000000000 
	247.50000000000 
	270.00000000000 
	292.50000000000 
	315.00000000000 
	337.00000000000 
] 
spin_menu_angle_index = 0 
spin_menu_angle = 0.00000000000 
spin_menu_dir = 0 
spin_menu_cycle = 1 
spin_menu_unhighlighted_text = [ 10 0 0 128 ] 
spin_menu_disabled_text = [ 30 20 20 58 ] 
spin_menu_spin_time = 0.15000000596 
spin_menu_selected_index = 0 
SCRIPT spin_menu_mark_selected 
	GetTags 
	change spin_menu_selected_index = <tag_grid_x> 
ENDSCRIPT

SCRIPT make_spin_menu 
	change spin_menu_angle_index = 0 
	change spin_menu_angle = 0.00000000000 
	spin_menu_spin_geometry rot_angle = 0.00000000000 spin_time = 0.00000000000 no_wait 
	change spin_menu_dir = 0 
	change spin_menu_item_index = 0 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	kill_start_key_binding 
	SetScreenElementLock id = root_window off 
	CreateScreenElement { 
		type = ContainerElement 
		parent = root_window 
		id = <menu_id> 
		font = small 
		pos = PAIR(320.00000000000, 240.00000000000) 
		scale = 1 
		dims = PAIR(640.00000000000, 480.00000000000) 
		focusable_child = <vmenu_id> 
	} 
	CreateScreenElement { 
		type = VMenu 
		parent = <menu_id> 
		id = <vmenu_id> 
		font = small 
		just = [ center center ] 
		pos = <pos> 
		padding_scale = 0 
		dims = PAIR(1.00000000000, 1.00000000000) 
		internal_just = [ center center ] 
		event_handlers = [ 
			{ pad_up spin_the_menu params = { up } } 
			{ pad_down spin_the_menu params = { down } } 
		] 
	} 
	AssignAlias id = <menu_id> alias = current_menu_anchor 
	AssignAlias id = <vmenu_id> alias = current_menu 
	build_roundbar <...> 
ENDSCRIPT

spin_menu_item_index = 0 
SCRIPT make_spin_menu_item pad_choose_script = null_script active = 1 
	Theme_GetUnhighlightedTextColor return_value = text_color 
	IF ( <active> = 1 ) 
		<rgba> = spin_menu_unhighlighted_text 
	ELSE 
		<rgba> = spin_menu_disabled_text 
	ENDIF 
	CreateScreenElement { 
		type = ContainerElement 
		parent = current_menu 
		id = <id> 
		just = [ center center ] 
		internal_just = [ center center ] 
		event_handlers = [ 
			{ focus spin_menu_item_focus params = <focus_params> } 
			{ unfocus spin_menu_item_unfocus } 
			{ pad_start spin_menu_mark_selected } 
			{ pad_choose spin_menu_mark_selected } 
			{ pad_start <pad_choose_script> params = <pad_choose_params> } 
			{ pad_choose <pad_choose_script> params = <pad_choose_params> } 
		] 
		dims = PAIR(1.00000000000, 1.00000000000) 
		tags = { tag_grid_x = ( spin_menu_item_index ) } 
	} 
	<container_id> = <id> 
	change spin_menu_item_index = ( spin_menu_item_index + 1 ) 
	IF GotParam blank 
		SetScreenElementProps { 
			id = <container_id> 
			tags = { blank } 
		} 
		CreateScreenElement { 
			type = SpriteElement 
			parent = <container_id> 
			texture = goal_complete_line 
			pos = PAIR(90.00000000000, 5.00000000000) 
			scale = 1 
			rgba = [ 20 , 40 , 40 , 70 ] 
			just = [ left center ] 
			z_priority = 1 
		} 
	ELSE 
		IF GotParam text2 
			pos1 = PAIR(0.00000000000, -8.00000000000) 
			pos2 = PAIR(0.00000000000, 8.00000000000) 
		ELSE 
			pos1 = PAIR(0.00000000000, 0.00000000000) 
		ENDIF 
		CreateScreenElement { 
			type = TextElement 
			parent = <container_id> 
			font = small 
			text = <text1> 
			rgba = <rgba> 
			just = [ left top ] 
			internal_just = [ left center ] 
			pos = <pos1> 
			z_priority = 1 
		} 
		IF GotParam text2 
			CreateScreenElement { 
				type = TextElement 
				parent = <container_id> 
				font = small 
				text = <text2> 
				rgba = <rgba> 
				just = [ left top ] 
				internal_just = [ left center ] 
				pos = <pos2> 
				z_priority = 1 
			} 
		ENDIF 
	ENDIF 
	SetScreenElementProps { 
		id = <container_id> 
		rot_angle = ( spin_menu_angles [ spin_menu_angle_index ] ) 
		tags = { 
			active = <active> 
			helper_text = <helper_text> 
			highlight_text = <highlight_text> 
			icon = <icon> 
		} 
	} 
	change spin_menu_angle_index = ( spin_menu_angle_index + 1 ) 
	IF GotParam mark_first_input 
		SetScreenElementProps { 
			id = <container_id> 
			event_handlers = [ 
				{ pad_choose mark_first_input_received } 
				{ pad_start mark_first_input_received } 
			] 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT build_roundbar 
	Theme_GetPauseBarColor return_value = bar_color 
	<pos> = ( <pos> + PAIR(60.00000000000, -3.00000000000) ) 
	CreateScreenElement { 
		type = ContainerElement 
		parent = current_menu_anchor 
		id = roundbar_bar 
		pos = <pos> 
		just = [ left center ] 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = roundbar_bar 
		id = roundbar_left 
		pos = PAIR(0.00000000000, 0.00000000000) 
		just = [ left top ] 
		scale = 1 
		texture = roundbar_tip_left 
		z_priority = 2 
		rgba = <bar_color> 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = roundbar_bar 
		id = roundbar_middle 
		pos = PAIR(32.00000000000, 0.00000000000) 
		just = [ left top ] 
		scale = PAIR(1.00000000000, 1.00000000000) 
		texture = roundbar_middle 
		z_priority = 2 
		rgba = <bar_color> 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = roundbar_bar 
		id = roundbar_right 
		pos = PAIR(64.00000000000, 0.00000000000) 
		just = [ left top ] 
		scale = 1 
		texture = roundbar_tip_right 
		z_priority = 2 
		rgba = <bar_color> 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = roundbar_bar 
		id = roundbar_accent 
		texture = roundbar_highlight 
		pos = PAIR(32.00000000000, 15.00000000000) 
		rgba = <bar_color> 
		just = [ center center ] 
		scale = PAIR(2.75000000000, 1.00000000000) 
		z_priority = 3 
		alpha = 0 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = roundbar_bar 
		id = roundbar_text 
		pos = PAIR(20.00000000000, 0.00000000000) 
		just = [ left top ] 
		text = "" 
		font = small 
		scale = PAIR(1.50000000000, 1.50000000000) 
		z_priority = 4 
		rgba = [ 0 , 0 , 0 , 128 ] 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = roundbar_bar 
		id = roundbar_icon 
		pos = PAIR(0.00000000000, 0.00000000000) 
		texture = white2 
		scale = 0.60000002384 
		rgba = [ 128 , 128 , 128 , 128 ] 
		just = [ left top ] 
		z_priority = 4 
	} 
ENDSCRIPT

SCRIPT spin_menu_item_focus 
	GetTags 
	IF GotParam attract_timer 
		reset_attract_mode_timer 
	ENDIF 
	IF GotParam blank 
		spin_menu__reset_input_timer 
		wait 1 gameframe 
		IF ( spin_menu_dir > 0 ) 
			IF ( spin_menu_cycle = 1 ) 
				FireEvent type = pad_up target = current_menu 
			ELSE 
				FireEvent type = pad_down target = current_menu 
			ENDIF 
		ELSE 
			IF ( spin_menu_dir < 0 ) 
				IF ( spin_menu_cycle = 1 ) 
					FireEvent type = pad_down target = current_menu 
				ELSE 
					FireEvent type = pad_up target = current_menu 
				ENDIF 
			ENDIF 
		ENDIF 
	ELSE 
		IF ( <active> = 0 ) 
			spin_menu__reset_input_timer 
			wait 1 gameframe 
			IF ( spin_menu_dir > 0 ) 
				current_menu : GetTags 
				IF ( ( spin_menu_cycle = 0 ) & ( <tag_selected_index> = 0 ) ) 
					FireEvent type = pad_down target = current_menu 
				ELSE 
					FireEvent type = pad_up target = current_menu 
				ENDIF 
			ELSE 
				FireEvent type = pad_down target = current_menu 
			ENDIF 
		ELSE 
			IF NOT ( spin_menu_dir = 0 ) 
				Menu_SFX_Wheel_Click_Short 
			ENDIF 
			do_roundbar_highlight <...> 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT do_roundbar_highlight 
	DoScreenElementMorph id = { <id> child = 0 } alpha = 0 time = spin_menu_spin_time 
	IF ScreenElementExists id = { <id> child = 1 } 
		DoScreenElementMorph id = { <id> child = 1 } alpha = 0 time = spin_menu_spin_time 
	ENDIF 
	SetScreenElementProps { 
		id = roundbar_text 
		text = <highlight_text> 
	} 
	GetScreenElementDims id = roundbar_text 
	<bar_mid_width> = ( <width> + 26 ) 
	<bar_mid_width_scale> = ( ( PAIR(1.00000000000, 0.00000000000) * ( <bar_mid_width> / 32.00000000000 ) ) + PAIR(0.00000000000, 1.00000000000) ) 
	<bar_right_pos> = ( PAIR(1.00000000000, 0.00000000000) * ( <bar_mid_width> + 20 ) ) 
	DoScreenElementMorph id = roundbar_middle scale = <bar_mid_width_scale> time = 0 
	SetScreenElementProps { 
		id = roundbar_right 
		pos = <bar_right_pos> 
	} 
	<icon_pos> = ( ( PAIR(1.00000000000, 0.00000000000) * ( <width> + 26 ) ) + ( PAIR(0.00000000000, 1.00000000000) * 3 ) ) 
	SetScreenElementProps { 
		id = roundbar_icon 
		texture = <icon> 
		pos = <icon_pos> 
	} 
	KillSpawnedScript name = do_roundbar_highlight_accent 
	RunScriptOnScreenElement id = roundbar_accent do_roundbar_highlight_accent params = { right = ( <bar_mid_width> + 20 ) } 
ENDSCRIPT

SCRIPT do_roundbar_highlight_accent 
	GetTags 
	SetScreenElementProps { 
		id = <id> 
		pos = PAIR(32.00000000000, 15.00000000000) 
		z_priority = 5 
	} 
	DoScreenElementMorph id = <id> scale = PAIR(2.75000000000, 1.00000000000) time = 0 
	DoScreenElementMorph id = <id> alpha = 1 time = 0 
	<pos> = ( ( PAIR(1.00000000000, 0.00000000000) * <right> ) + ( PAIR(0.00000000000, 1.00000000000) * 15 ) ) 
	DoScreenElementMorph id = <id> pos = <pos> time = 0.30000001192 
	DoScreenElementMorph id = <id> alpha = 0.20000000298 time = 0.30000001192 
	wait 0.30000001192 seconds 
	<width> = ( <right> - 32 ) 
	<center> = ( ( <width> / 2 ) + 32 ) 
	<pos> = ( ( PAIR(1.00000000000, 0.00000000000) * <center> ) + ( PAIR(0.00000000000, 1.00000000000) * 15 ) ) 
	SetScreenElementProps { 
		id = <id> 
		pos = <pos> 
		z_priority = 3 
	} 
	<scale_width> = ( <width> / 14.00000000000 ) 
	<scale> = ( ( PAIR(1.00000000000, 0.00000000000) * <scale_width> ) + ( PAIR(0.00000000000, 1.00000000000) * 1.25000000000 ) ) 
	DoScreenElementMorph id = <id> scale = <scale> time = 0 
	BEGIN 
		DoScreenElementMorph id = <id> alpha = 1 time = 0.30000001192 
		wait 0.30000001192 seconds 
		DoScreenElementMorph id = <id> alpha = 0 time = 0.30000001192 
		wait 0.30000001192 seconds 
	REPEAT 
ENDSCRIPT

SCRIPT spin_menu_item_unfocus 
	GetTags 
	IF NOT GotParam blank 
		IF ( <active> = 1 ) 
			DoScreenElementMorph id = { <id> child = 0 } alpha = 1 time = spin_menu_spin_time 
			IF ScreenElementExists id = { <id> child = 1 } 
				DoScreenElementMorph id = { <id> child = 1 } alpha = 1 time = spin_menu_spin_time 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

spin_menu_input_enabled = 1 
SCRIPT spin_menu_input_timer 
	SetScreenElementProps { 
		id = current_menu 
		disable_pad_handling 
	} 
	change spin_menu_input_enabled = 0 
	wait spin_menu_spin_time seconds 
	change spin_menu_input_enabled = 1 
	SetScreenElementProps { 
		id = current_menu 
		enable_pad_handling 
	} 
ENDSCRIPT

SCRIPT spin_menu__reset_input_timer 
	KillSpawnedScript name = spin_menu_input_timer 
	change spin_menu_input_enabled = 1 
	SetScreenElementProps { 
		id = current_menu 
		enable_pad_handling 
	} 
ENDSCRIPT

SCRIPT spin_the_menu 
	IF ( ( spin_menu_input_enabled = 1 ) | ( spin_menu_auto_spin = 1 ) ) 
		IF GotParam down 
			<diff> = -22.50000000000 
			change spin_menu_dir = -1 
		ELSE 
			<diff> = 22.50000000000 
			change spin_menu_dir = 1 
		ENDIF 
		IF ( spin_menu_cycle = 0 ) 
			current_menu : GetTags 
			GetScreenElementChildren id = current_menu 
			GetArraySize <children> 
			IF ( <tag_selected_index> = 0 & GotParam up ) 
				RETURN 
			ENDIF 
			IF ( <tag_selected_index> = ( <array_size> - 0 ) & GotParam down ) 
				RETURN 
			ENDIF 
			IF ( <tag_selected_index> = ( <array_size> - 1 ) & GotParam down ) 
				RETURN 
			ENDIF 
			IF ( <tag_selected_index> = ( <array_size> - 0 ) & GotParam up ) 
				RETURN 
			ENDIF 
		ENDIF 
		change spin_menu_angle = ( spin_menu_angle + <diff> ) 
		SpawnScript spin_menu_input_timer 
		DoScreenElementMorph id = current_menu rot_angle = spin_menu_angle time = spin_menu_spin_time 
		spin_menu_spin_geometry rot_angle = spin_menu_angle 
		MakeSkaterGoto SpinMenuSkaterAction params = <...> 
		pulse_blur speed = 4 start = 180 
	ENDIF 
ENDSCRIPT

SCRIPT spin_menu_spin_geometry spin_time = spin_menu_spin_time 
	IF NOT GotParam no_wait 
		wait 2 gameframes 
	ENDIF 
	<angle> = ( VECTOR(0.00000000000, 0.00000000000, 1.00000000000) * <rot_angle> ) 
	wol_inner_ring : Obj_Rotate absolute = <angle> time = <spin_time> 
	wol_inner_star : Obj_Rotate absolute = <angle> time = <spin_time> 
	wol_tag : Obj_Rotate absolute = <angle> time = <spin_time> 
	wol_outer_ring : Obj_Rotate absolute = <angle> time = <spin_time> 
	<index> = 1 
	BEGIN 
		FormatText ChecksumName = model_id "wol_pie_%i" i = <index> 
		<model_id> : Obj_Rotate absolute = <angle> time = <spin_time> 
		<index> = ( <index> + 1 ) 
	REPEAT 16 
	<index> = 1 
	BEGIN 
		FormatText ChecksumName = model_id "wol_lightbulb_%i" i = <index> 
		<model_id> : Obj_Rotate absolute = <angle> time = <spin_time> 
		<index> = ( <index> + 1 ) 
	REPEAT 28 
ENDSCRIPT

SCRIPT spin_menu_visible on = 1 
	IF ( <on> ) 
		<action> = unhide 
	ELSE 
		<action> = hide 
	ENDIF 
	wol_inner_ring : <action> 
	wol_inner_star : <action> 
	wol_tag : <action> 
	wol_outer_ring : <action> 
	<index> = 1 
	BEGIN 
		FormatText ChecksumName = model_id "wol_pie_%i" i = <index> 
		<model_id> : <action> 
		<index> = ( <index> + 1 ) 
	REPEAT 16 
	<index> = 1 
	BEGIN 
		FormatText ChecksumName = model_id "wol_lightbulb_%i" i = <index> 
		<model_id> : <action> 
		<index> = ( <index> + 1 ) 
	REPEAT 28 
ENDSCRIPT

SCRIPT draw_menu_background 
	CreateScreenElement { 
		type = ContainerElement 
		parent = current_menu_anchor 
		id = arrow_sign_container 
		pos = PAIR(0.00000000000, 0.00000000000) 
	} 
	IF GotParam story_mode 
		<bg_text> = new_bg_1 
		<bg_angle> = 128 
		<bg_flip> = flip_v 
		<bg_scale> = 1.50000000000 
		<bg_pos> = PAIR(-40.00000000000, 120.00000000000) 
		<bg_rgba> = [ 73 22 107 70 ] 
		<arrow_text> = new_graf_arrow 
		<arrow_angle> = 0 
		<arrow_flip> = flip_v 
		<arrow_scale> = 0.85000002384 
		<arrow_pos> = PAIR(340.00000000000, 250.00000000000) 
		<arrow_rgba> = [ 128 128 128 35 ] 
		<arrow_z> = -2 
		<drip_text> = RANDOM(1, 1) RANDOMCASE new_drip_2 RANDOMCASE new_drip_4 RANDOMEND 
		<drip_angle> = 0 
		<drip_flip> = no 
		<drip_scale> = PAIR(0.80000001192, 1.50000000000) 
		<drip_pos> = PAIR(580.00000000000, 70.00000000000) 
		<drip_rgba> = [ 126 49 3 120 ] 
		<drip_z> = 100 
		IF GotParam difficulty 
			<drip_pos> = PAIR(587.00000000000, 73.00000000000) 
		ENDIF 
		<spray_text> = new_icon_5 
		<spray_angle> = 0 
		<spray_flip> = no 
		<spray_scale> = 1.39999997616 
		<spray_pos> = PAIR(150.00000000000, 47.00000000000) 
		<spray_rgba> = [ 128 128 128 80 ] 
		<spray_z> = -4 
		<sign_pos> = PAIR(700.00000000000, 50.00000000000) 
		IF GotParam story_wdt 
			<the_logo> = wdt_logo_big 
		ELSE 
			<the_logo> = wdt_logo_big_2 
		ENDIF 
		IF Checksumequals a = <the_logo> b = wdt_logo_big_2 
			<logo_rgba> = [ 0 0 0 128 ] 
			<logo_scale> = PAIR(2.50000000000, 1.50000000000) 
			<logo_pos> = PAIR(535.00000000000, 155.00000000000) 
			<logo_angle> = -34 
		ELSE 
			<logo_pos> = PAIR(610.00000000000, 195.00000000000) 
			<logo_scale> = 0.80000001192 
			<logo_rgba> = [ 128 128 128 128 ] 
			<logo_angle> = 0 
		ENDIF 
		CreateScreenElement { 
			type = SpriteElement 
			parent = arrow_sign_container 
			id = sign 
			texture = menu_sign 
			pos = <sign_pos> 
			just = [ right top ] 
			rgba = [ 128 128 128 128 ] 
			z_priority = -1 
			rot_angle = -10 
			scale = 1.70000004768 
		} 
		CreateScreenElement { 
			type = SpriteElement 
			parent = arrow_sign_container 
			id = wdt_logo 
			texture = <the_logo> 
			pos = <logo_pos> 
			just = [ right top ] 
			rgba = <logo_rgba> 
			z_priority = 0 
			scale = <logo_scale> 
			rot_angle = <logo_angle> 
		} 
	ENDIF 
	IF GotParam options_mode 
		<bg_text> = new_bg_1 
		<bg_angle> = 70 
		<bg_flip> = flip_v 
		<bg_scale> = 1.50000000000 
		<bg_pos> = PAIR(610.00000000000, 130.00000000000) 
		<bg_rgba> = [ 62 105 122 50 ] 
		<arrow_text> = new_graf_arrow 
		<arrow_angle> = 2 
		<arrow_flip> = no 
		<arrow_scale> = 0.89999997616 
		<arrow_pos> = PAIR(220.00000000000, 18.00000000000) 
		<arrow_rgba> = [ 128 128 128 35 ] 
		<arrow_z> = -2 
		<drip_text> = RANDOM(1, 1) RANDOMCASE new_drip_2 RANDOMCASE new_drip_4 RANDOMEND 
		<drip_angle> = 0 
		<drip_flip> = no 
		<drip_scale> = PAIR(2.00000000000, 2.50000000000) 
		<drip_pos> = PAIR(507.00000000000, 83.00000000000) 
		<drip_rgba> = [ 20 70 92 128 ] 
		<drip_z> = 1 
		<spray_text> = new_icon_1 
		<spray_angle> = 0 
		<spray_flip> = no 
		<spray_scale> = 1.60000002384 
		<spray_pos> = PAIR(60.00000000000, 80.00000000000) 
		<spray_rgba> = [ 128 128 128 50 ] 
		<spray_z> = -4 
	ENDIF 
	IF GotParam create_mode 
		<bg_text> = new_bg_2 
		<bg_angle> = 20 
		<bg_flip> = no 
		<bg_scale> = PAIR(1.20000004768, 0.80000001192) 
		<bg_pos> = PAIR(450.00000000000, 0.00000000000) 
		<bg_rgba> = [ 62 105 122 60 ] 
		<arrow_text> = new_graf_arrow 
		<arrow_angle> = 179.89999389648 
		<arrow_flip> = no 
		<arrow_scale> = 1.10000002384 
		<arrow_pos> = PAIR(550.00000000000, 200.00000000000) 
		<arrow_rgba> = [ 128 128 128 25 ] 
		<arrow_z> = -2 
		<drip_text> = RANDOM(1, 1) RANDOMCASE new_drip_1 RANDOMCASE new_drip_3 RANDOMEND 
		<drip_angle> = 60 
		<drip_flip> = no 
		<drip_scale> = 0.69999998808 
		<drip_pos> = PAIR(295.00000000000, 42.00000000000) 
		<drip_rgba> = [ 126 49 3 108 ] 
		<drip_z> = 1 
		<spray_text> = new_icon_4 
		<spray_angle> = 0 
		<spray_flip> = no 
		<spray_scale> = 2.20000004768 
		<spray_pos> = PAIR(80.00000000000, 100.00000000000) 
		<spray_rgba> = [ 128 128 128 40 ] 
		<spray_z> = -4 
	ENDIF 
	<bg_text> = RANDOM(1, 1) RANDOMCASE new_bg_1 RANDOMCASE new_bg_2 RANDOMEND 
	<bg_rgba> = RANDOM(1, 1) RANDOMCASE [ 62 105 122 60 ] RANDOMCASE [ 73 22 107 70 ] RANDOMEND 
	FormatText ChecksumName = spray_text_name "new_icon_%i" i = RANDOM(1, 1, 1, 1, 1, 1, 1, 1, 1, 1) RANDOMCASE 1 RANDOMCASE 2 RANDOMCASE 3 RANDOMCASE 4 RANDOMCASE 5 RANDOMCASE 6 RANDOMCASE 7 RANDOMCASE 8 RANDOMCASE 9 RANDOMCASE 10 RANDOMEND 
	<spray_text> = <spray_text_name> 
	<circle_rot> = 0 
	<circle_pos> = PAIR(0.00000000000, 70.00000000000) 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		id = bg 
		texture = <bg_text> 
		rot_angle = <bg_angle> 
		pos = <bg_pos> 
		scale = <bg_scale> 
		<bg_flip> 
		z_priority = -4.50000000000 
		rgba = <bg_rgba> 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = arrow_sign_container 
		id = graf_arrow 
		texture = <arrow_text> 
		rot_angle = <arrow_angle> 
		pos = <arrow_pos> 
		scale = <arrow_scale> 
		<arrow_flip> 
		z_priority = <arrow_z> 
		rgba = <arrow_rgba> 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		id = drip 
		texture = <drip_text> 
		just = [ center top ] 
		rot_angle = <drip_angle> 
		pos = <drip_pos> 
		scale = <drip_scale> 
		<drip_flip> 
		z_priority = <drip_z> 
		rgba = <drip_rgba> 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		id = spray_icon 
		texture = <spray_text> 
		rot_angle = <spray_angle> 
		pos = <spray_pos> 
		scale = <spray_scale> 
		<spray_flip> 
		z_priority = <spray_z> 
		rgba = <spray_rgba> 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		id = circle_drip_icon 
		texture = circle_drip 
		rot_angle = <circle_rot> 
		pos = <circle_pos> 
		rgba = [ 128 128 128 40 ] 
		z_priority = -4 
	} 
	RunScriptOnScreenElement id = current_menu_anchor icon_drop params = { orig_pos = <spray_pos> 
		orig_rot = <spray_angle> 
		orig_scale = <spray_scale> 
		orig_flip = <spray_flip> 
		orig_rgba = <spray_rgba> 
		orig_z = <spray_z> 
	} 
	RunScriptOnScreenElement id = circle_drip_icon circle_rotation params = { orig_pos = <circle_pos> } 
	IF NOT GotParam create_mode 
		IF GotParam story_mode 
			RunScriptOnScreenElement id = arrow_sign_container slide_in params = { right orig_pos = PAIR(0.00000000000, 0.00000000000) } 
			RunScriptOnScreenElement id = drip paint_dripping 
			RunScriptOnScreenElement id = wdt_logo do_random_effect params = { orig_rot = <logo_angle> } 
		ELSE 
			RunScriptOnScreenElement id = arrow_sign_container slide_in params = { some_wait top orig_pos = PAIR(0.00000000000, 0.00000000000) } 
			RunScriptOnScreenElement id = drip paint_dripping params = { some_wait } 
		ENDIF 
	ELSE 
		RunScriptOnScreenElement id = arrow_sign_container slide_in params = { some_wait right orig_pos = PAIR(0.00000000000, 0.00000000000) } 
		RunScriptOnScreenElement id = drip paint_twitch params = { orig_rot = <drip_angle> } 
	ENDIF 
ENDSCRIPT

SCRIPT icon_drop orig_pos = PAIR(0.00000000000, 0.00000000000) 
	BEGIN 
		spray_icon : DoMorph time = 0 pos = ( <orig_pos> + PAIR(0.00000000000, -150.00000000000) ) 
		spray_icon : DoMorph time = 0.15000000596 pos = <orig_pos> 
		wait 0.15000000596 seconds 
		BEGIN 
			spray_icon : DoMorph time = 0.00999999978 rot_angle = <orig_rot> alpha = 1 pos = <orig_pos> 
			ran_xjump = RANDOM(1, 1, 1, 1, 1, 1, 1) RANDOMCASE PAIR(-3.00000000000, 0.00000000000) RANDOMCASE PAIR(-2.00000000000, 0.00000000000) RANDOMCASE PAIR(-1.00000000000, 0.00000000000) RANDOMCASE PAIR(0.00000000000, 0.00000000000) RANDOMCASE PAIR(1.00000000000, 0.00000000000) RANDOMCASE PAIR(2.00000000000, 0.00000000000) RANDOMCASE PAIR(3.00000000000, 0.00000000000) RANDOMEND 
			ran_yjump = RANDOM(1, 1, 1, 1, 1, 1, 1) RANDOMCASE PAIR(0.00000000000, -3.00000000000) RANDOMCASE PAIR(0.00000000000, -2.00000000000) RANDOMCASE PAIR(0.00000000000, -1.00000000000) RANDOMCASE PAIR(0.00000000000, 0.00000000000) RANDOMCASE PAIR(0.00000000000, 1.00000000000) RANDOMCASE PAIR(2.00000000000, 0.00000000000) RANDOMCASE PAIR(3.00000000000, 0.00000000000) RANDOMEND 
			add_angle = RANDOM(1, 1, 1, 1, 1, 1, 1) RANDOMCASE -6 RANDOMCASE -4 RANDOMCASE -2 RANDOMCASE 0 RANDOMCASE 2 RANDOMCASE 4 RANDOMCASE 6 RANDOMEND 
			ran_time = RANDOM(1, 1, 1, 1, 1) RANDOMCASE 0.01999999955 RANDOMCASE 0.02999999933 RANDOMCASE 0.03999999911 RANDOMCASE 0.05000000075 RANDOMCASE 0.05999999866 RANDOMEND 
			ran_alpha = RANDOM(1, 1, 1, 1) RANDOMCASE 0.40000000596 RANDOMCASE 0.60000002384 RANDOMCASE 0.80000001192 RANDOMCASE 1 RANDOMEND 
			spray_icon : DoMorph time = <ran_time> alpha = <ran_alpha> rot_angle = ( <orig_rot> + <add_angle> ) pos = ( <orig_pos> + <ran_xjump> + <ran_yjump> ) 
			wait 0.03999999911 
		REPEAT RANDOM(1, 1, 1) RANDOMCASE 20 RANDOMCASE 25 RANDOMCASE 30 RANDOMEND 
		spray_icon : DoMorph time = 0 pos = <orig_pos> 
		spray_icon : DoMorph time = 0.20000000298 pos = ( <orig_pos> + PAIR(-500.00000000000, 0.00000000000) ) 
		wait RANDOM(1, 1, 1, 1) RANDOMCASE 1 RANDOMCASE 2 RANDOMCASE 3 RANDOMCASE 4 RANDOMEND seconds 
		DestroyScreenElement id = spray_icon 
		FormatText ChecksumName = spray_text_name "new_icon_%i" i = RANDOM(1, 1, 1, 1, 1, 1, 1, 1, 1, 1) RANDOMCASE 1 RANDOMCASE 2 RANDOMCASE 3 RANDOMCASE 4 RANDOMCASE 5 RANDOMCASE 6 RANDOMCASE 7 RANDOMCASE 8 RANDOMCASE 9 RANDOMCASE 10 RANDOMEND 
		CreateScreenElement { 
			type = SpriteElement 
			parent = current_menu_anchor 
			id = spray_icon 
			texture = <spray_text_name> 
			rot_angle = <orig_rot> 
			pos = <orig_pos> 
			scale = <orig_scale> 
			<orig_flip> 
			z_priority = <orig_z> 
			rgba = <orig_rgba> 
		} 
	REPEAT 
ENDSCRIPT

SCRIPT paint_dripping 
	IF GotParam some_wait 
		add_time = 0.20000000298 
	ELSE 
		add_time = 0 
	ENDIF 
	wait <add_time> seconds 
	DoMorph time = 0 scale = PAIR(1.00000000000, 0.20000000298) 
	DoMorph time = 2 scale = PAIR(1.00000000000, 2.00000000000) 
ENDSCRIPT

SCRIPT slide_in orig_pos = PAIR(200.00000000000, 200.00000000000) 
	IF GotParam some_wait 
		add_time = 0.20000000298 
	ELSE 
		add_time = 0 
	ENDIF 
	IF GotParam right 
		DoMorph time = 0 pos = ( <orig_pos> + PAIR(400.00000000000, 0.00000000000) ) 
		wait <add_time> seconds 
		DoMorph time = 0.20000000298 pos = <orig_pos> 
	ENDIF 
	IF GotParam top 
		top_location = RANDOM(1, 1, 1, 1, 1) RANDOMCASE PAIR(-100.00000000000, 0.00000000000) RANDOMCASE PAIR(-50.00000000000, 0.00000000000) RANDOMCASE PAIR(0.00000000000, 0.00000000000) RANDOMCASE PAIR(50.00000000000, 0.00000000000) RANDOMCASE PAIR(100.00000000000, 0.00000000000) RANDOMEND 
		DoMorph time = 0 pos = ( <orig_pos> - PAIR(0.00000000000, 100.00000000000) + <top_location> ) 
		wait <add_time> seconds 
		DoMorph time = 0.20000000298 pos = ( <orig_pos> + <top_location> ) 
	ENDIF 
ENDSCRIPT

SCRIPT circle_rotation 
	end_pos = ( <orig_pos> + RANDOM(1, 1, 1, 1, 1, 1) RANDOMCASE PAIR(100.00000000000, 0.00000000000) RANDOMCASE PAIR(150.00000000000, 0.00000000000) RANDOMCASE PAIR(200.00000000000, 0.00000000000) RANDOMCASE PAIR(250.00000000000, 0.00000000000) RANDOMCASE PAIR(300.00000000000, 0.00000000000) RANDOMCASE PAIR(350.00000000000, 0.00000000000) RANDOMEND ) 
	DoMorph time = 0 rot_angle = 0 pos = ( <end_pos> - PAIR(500.00000000000, 0.00000000000) ) 
	wait RANDOM(1, 1, 1) RANDOMCASE 3 RANDOMCASE 4 RANDOMCASE 5 RANDOMEND seconds 
	DoMorph time = 1 rot_angle = 1800 pos = <end_pos> 
	wait RANDOM(1, 1, 1, 1, 1) RANDOMCASE 2 RANDOMCASE 3 RANDOMCASE 4 RANDOMCASE 5 RANDOMCASE 6 RANDOMEND seconds 
	DoMorph time = 0 rot_angle = 1800 
	DoMorph time = 0.20000000298 rot_angle = 720 
	DoMorph time = 0 pos = <end_pos> 
	DoMorph time = 0.20000000298 pos = ( <end_pos> + PAIR(1000.00000000000, 0.00000000000) ) 
ENDSCRIPT

SCRIPT paint_twitch 
	BEGIN 
		DoMorph time = 0 rot_angle = <orig_rot> 
		add_angle = RANDOM(1, 1, 1, 1, 1, 1, 1) RANDOMCASE -3 RANDOMCASE -2 RANDOMCASE -1 RANDOMCASE 0 RANDOMCASE 1 RANDOMCASE 2 RANDOMCASE 3 RANDOMEND 
		ran_time = RANDOM(1, 1, 1, 1, 1, 1, 1) RANDOMCASE 0.05999999866 RANDOMCASE 0.07000000030 RANDOMCASE 0.07999999821 RANDOMCASE 0.09000000358 RANDOMCASE 0.10000000149 RANDOMCASE 0.11999999732 RANDOMCASE 0.50000000000 RANDOMEND 
		DoMorph time = <ran_time> rot_angle = ( <orig_rot> + <add_angle> ) 
	REPEAT 
ENDSCRIPT


