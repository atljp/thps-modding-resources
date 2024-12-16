SCRIPT mainmenu_startup 
	printf "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" 
	printf "X                                               X" 
	printf "X        Main Menu Startup                      X" 
	printf "X                                               X" 
	printf "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" 
	GoalManager_HidePoints 
	GoalManager_HideGoalPoints 
	Change EndOfReplayShouldJumpToPauseMenu = 0 
	Randomize 
	SetScoreDegradation 0 
	SpawnScript maybe_auto_load_from_memory_card 
	SpawnScript hide_the_skater 
	LoadSound "Skateshop\\BoardsFlip" vol = 100 dropoff = 150 
	LoadSound "terrains\\olliewood2" vol = 100 dropoff = 150 
	LoadSound "terrains\\olliewood3" vol = 100 dropoff = 150 
	LoadSound "terrains\\landwood2" vol = 100 dropoff = 150 
	LoadSound "terrains\\landwood3" vol = 100 dropoff = 150 
	LoadSound "Shared\\Menu\\CheatGood" 
	LoadSound "Shared\\Menu\\CheatBad" 
ENDSCRIPT

SCRIPT MainMenu_Setup 
	IF IsCareerMode 
	ELSE 
	ENDIF 
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
			printf "### no tod set ###" 
	ENDSWITCH 
ENDSCRIPT

SCRIPT launch_main_menu 
	create_main_menu launched = launched 
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
		Change attempted_xbox_autoload = 1 
		Change DoAutoload = 1 
		FireEvent type = unfocus target = current_menu 
		create_dialog_box { title = "Load Game" 
			text = "Load last Story/Skater save?" 
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
	Change DoAutoload = 0 
ENDSCRIPT

SCRIPT no_xbox_autoload 
	mark_first_input_received <...> 
	dialog_box_exit 
	FireEvent type = unfocus target = current_menu 
	Change no_load = 1 
	CheckForCardOnBootup 
	Change DoAutoload = 0 
	Debounce X 0.30000001192 
	UnpauseMusicAndStreams 
	create_main_menu 
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

SCRIPT create_main_menu 
	SetNetworkMode 
	pulse_blur speed = 2 start = 255 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	UnpauseMusicAndStreams 
	Change show_career_startup_menu = 0 
	Change in_options_menu = 0 
	SetNetworkMode 
	SetMemThreadSafe off 
	SetMenuPadMappings [ active 
		use_as_first 
	] 
	make_new_skateshop_menu { 
		pos = PAIR(120.00000000000, 100.00000000000) 
		internal_just = [ center center ] 
		padding_scale = 1.07500004768 
		menu_id = main_menu 
		vmenu_id = main_vmenu 
		menu_title = "" 
		helper_text = { helper_text_elements = [ { text = "\\b7/\\b4 = Select" } 
				{ text = "\\bm = Accept" } 
			] 
		} 
	} 
	SetScreenElementProps { 
		id = current_menu 
		event_handlers = [ 
			{ pad_up reset_attract_mode_timer } 
			{ pad_down reset_attract_mode_timer } 
		] 
	} 
	build_top_and_bottom_blocks 
	make_mainmenu_3d_plane model = "mainmenu_bg\\mainmenu_bg.mdl" scale = PAIR(1.25000000000, 1.25000000000) pos = PAIR(360.00000000000, 217.00000000000) 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		id = mm_building 
		texture = mm_building 
		just = [ left top ] 
		pos = PAIR(0.00000000000, 62.00000000000) 
		scale = PAIR(1.20000004768, 1.25000000000) 
		z_priority = -3 
		alpha = 1 
	} 
	make_mainmenu_clouds 
	FormatText ChecksumName = menu_title "%i_mainmenu" i = ( THEME_COLOR_PREFIXES [ current_theme_prefix ] ) 
	FormatText ChecksumName = main_icon "%i_mainicon" i = ( THEME_COLOR_PREFIXES [ current_theme_prefix ] ) 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		id = mm_title 
		texture = <menu_title> 
		just = [ center center ] 
		pos = PAIR(250.00000000000, 110.00000000000) 
		scale = PAIR(1.39999997616, 1.39999997616) 
		rot_angle = -5 
		z_priority = 4 
		alpha = 1 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		id = mm_icon 
		texture = <main_icon> 
		just = [ center center ] 
		pos = PAIR(250.00000000000, 70.00000000000) 
		scale = PAIR(1.50000000000, 1.50000000000) 
		rot_angle = -5 
		z_priority = 4 
		alpha = 1 
	} 
	IF NOT MultiPlayerOnly 
		make_main_menu_item { text = #"Story Mode" 
			id = menu_career 
			pad_choose_script = main_menu_exit 
			pad_choose_params = { new_menu_script = create_career_options_menu 
				change_gamemode = change_gamemode_career 
				hold_camera 
			} 
			focus_params = { attract_timer } 
			mark_first_input 
		} 
		SetScreenElementProps { 
			id = menu_career 
			event_handlers = [ 
				{ focus PlayHelperDesc params = { story_helper_desc } } 
				{ unfocus StopHelperDesc } 
			] 
		} 
		make_main_menu_item { text = #"High Score / Free Skate" 
			id = menu_singlesess 
			pad_choose_script = main_menu_exit 
			pad_choose_params = { new_menu_script = launch_select_skater_menu 
				change_gamemode = change_gamemode_singlesession 
				hold_camera 
			} 
			focus_params = { attract_timer } 
			mark_first_input 
		} 
		SetScreenElementProps { 
			id = menu_singlesess 
			event_handlers = [ 
				{ focus PlayHelperDesc params = { freeskate_helper_desc } } 
				{ unfocus StopHelperDesc } 
			] 
		} 
	ELSE 
		make_main_menu_item { text = #"Story Mode" 
			id = menu_career 
			focus_params = { attract_timer } 
			mark_first_input 
			not_focusable 
		} 
		make_main_menu_item { text = #"High Score / Free Skate" 
			id = menu_singlesess 
			not_focusable 
			mark_first_input 
		} 
	ENDIF 
	make_main_menu_item { text = #"Create / Play Goals" 
		id = menu_creategoals 
		pad_choose_script = main_menu_exit 
		pad_choose_params = { new_menu_script = create_select_goals_menu 
			change_gamemode = change_gamemode_creategoals 
			hold_camera 
		} 
		mark_first_input 
		focus_params = { attract_timer } 
	} 
	SetScreenElementProps { 
		id = menu_creategoals 
		event_handlers = [ 
			{ focus PlayHelperDesc params = { cag_helper_desc } } 
			{ unfocus StopHelperDesc } 
		] 
	} 
	make_main_menu_item { text = #"2 Player" 
		id = main_menu_2_player_option 
		pad_choose_script = main_menu_exit 
		pad_choose_params = { new_menu_script = launch_select_skater_menu 
			change_gamemode = change_gamemode_freeskate_2p 
			hold_camera 
		} 
		mark_first_input 
		focus_params = { attract_timer } 
	} 
	SetScreenElementProps { 
		id = main_menu_2_player_option 
		event_handlers = [ 
			{ focus PlayHelperDesc params = { splitscreen_helper_desc } } 
			{ unfocus StopHelperDesc } 
		] 
	} 
	IF OnXbox 
		IF IsTrue demo_build 
			make_main_menu_item { text = #"Network Play" 
				not_focusable = not_focusable 
				id = mm_multi_play 
				pad_choose_script = system_link_main_menu_exit 
				pad_choose_params = { new_menu_script = select_xbox_multiplayer 
					hold_camera 
				} 
				mark_first_input 
			} 
			SetScreenElementProps { 
				id = mm_multi_play 
				event_handlers = [ 
					{ focus PlayHelperDesc params = { systemlink_helper_desc } } 
					{ unfocus StopHelperDesc } 
				] 
			} 
		ELSE 
			make_main_menu_item { text = #"Multiplayer" 
				id = menu_net 
				pad_choose_script = main_menu_exit 
				pad_choose_params = { new_menu_script = select_network_play_multi 
					change_gamemode = change_gamemode_net 
					hold_camera 
				} 
				mark_first_input 
				focus_params = { attract_timer } 
			} 
			SetScreenElementProps { 
				id = menu_net 
				event_handlers = [ 
					{ focus PlayHelperDesc params = { multiplayer_helper_desc } } 
					{ unfocus StopHelperDesc } 
				] 
			} 
		ENDIF 
	ELSE 
		IF IsPS2 
			IF NOT ( demo_build ) 
				make_main_menu_item { text = #"THUG Online Play" 
					id = menu_net 
					pad_choose_script = main_menu_exit 
					pad_choose_params = { new_menu_script = select_network_play 
						change_gamemode = change_gamemode_net 
						hold_camera 
					} 
					mark_first_input 
					focus_params = { attract_timer } 
				} 
				SetScreenElementProps { 
					id = menu_net 
					event_handlers = [ 
						{ focus PlayHelperDesc params = { online_helper_desc } } 
						{ unfocus StopHelperDesc } 
					] 
				} 
			ELSE 
				make_main_menu_item { text = #"THUG Online Play" 
					id = menu_net 
					not_focusable = not_focusable 
				} 
			ENDIF 
		ENDIF 
	ENDIF 
	IF ( ( GetGlobalFlag flag = BOARDSHOP_UNLOCKED ) | ( all_levels_unlocked = 1 ) ) 
		make_main_menu_item { text = #"Skateshop" 
			id = menu_boardshop 
			pad_choose_script = launch_boardshop 
			mark_first_input 
			focus_params = { attract_timer } 
		} 
		SetScreenElementProps { 
			id = menu_boardshop 
			event_handlers = [ 
				{ focus PlayHelperDesc params = { boardshop_helper_desc } } 
				{ unfocus StopHelperDesc } 
			] 
		} 
	ELSE 
	ENDIF 
	FormatText ChecksumName = bar_rgba "%i_HIGHLIGHTED_TEXT_COLOR" i = ( THEME_COLOR_PREFIXES [ current_theme_prefix ] ) 
	CreateScreenElement { 
		type = ContainerElement 
		parent = current_menu 
		id = main_split1 
		not_focusable 
		dims = PAIR(200.00000000000, 0.00000000000) 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = main_split1 
		texture = streak_2 
		scale = PAIR(5.00000000000, 1.00000000000) 
		pos = PAIR(-10.00000000000, 0.00000000000) 
		rgba = <bar_rgba> 
		alpha = 0.40000000596 
	} 
	make_main_menu_item { text = #"Create-A-Trick" 
		id = menu_cat 
		pad_choose_script = main_menu_exit 
		pad_choose_params = { new_menu_script = cat_launch_nj 
			change_gamemode = change_gamemode_singlesession 
			set_cat_mode_flag 
			hold_camera 
			kill_clouds 
		} 
		mark_first_input 
		focus_params = { attract_timer } 
	} 
	SetScreenElementProps { 
		id = menu_cat 
		event_handlers = [ 
			{ focus PlayHelperDesc params = { cat_helper_desc } } 
			{ unfocus StopHelperDesc } 
		] 
	} 
	make_main_menu_item { text = #"Create-A-Park" 
		id = menu_parked 
		pad_choose_script = launch_park_editor 
		mark_first_input 
		focus_params = { attract_timer } 
	} 
	SetScreenElementProps { 
		id = menu_parked 
		event_handlers = [ 
			{ focus PlayHelperDesc params = { cap_helper_desc } } 
			{ unfocus StopHelperDesc } 
		] 
	} 
	make_main_menu_item { text = #"Create-A-Skater" 
		id = menu_cas 
		pad_choose_script = launch_cas 
		mark_first_input 
		focus_params = { attract_timer } 
	} 
	SetScreenElementProps { 
		id = menu_cas 
		event_handlers = [ 
			{ focus PlayHelperDesc params = { cas_helper_desc } } 
			{ unfocus StopHelperDesc } 
		] 
	} 
	IF ( ( GetGlobalFlag flag = CAD_UNLOCKED ) | ( all_levels_unlocked = 1 ) ) 
		make_main_menu_item { text = #"Create-A-Deck" 
			id = menu_deck 
			pad_choose_script = launch_cad 
			mark_first_input 
			focus_params = { attract_timer } 
		} 
		SetScreenElementProps { 
			id = menu_deck 
			event_handlers = [ 
				{ focus PlayHelperDesc params = { cad_helper_desc } } 
				{ unfocus StopHelperDesc } 
			] 
		} 
	ELSE 
		make_main_menu_item { text = #"Create-A-Deck" 
			id = menu_deck 
			pad_choose_script = launch_cad 
			mark_first_input 
			not_focusable 
			focus_params = { attract_timer } 
		} 
	ENDIF 
	IF IsPS2 
		make_main_menu_item { text = #"Download Your Face" 
			id = menu_face 
			pad_choose_script = launch_cas 
			pad_choose_params = { face = face } 
			mark_first_input 
			focus_params = { attract_timer } 
		} 
		SetScreenElementProps { 
			id = menu_face 
			event_handlers = [ 
				{ focus PlayHelperDesc params = { caf_helper_desc } } 
				{ unfocus StopHelperDesc } 
			] 
		} 
	ENDIF 
	CreateScreenElement { 
		type = ContainerElement 
		parent = current_menu 
		id = main_split2 
		not_focusable 
		dims = PAIR(200.00000000000, 0.00000000000) 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = main_split2 
		texture = streak_2 
		scale = PAIR(5.00000000000, 1.00000000000) 
		pos = PAIR(-10.00000000000, 0.00000000000) 
		rgba = <bar_rgba> 
		alpha = 0.40000000596 
	} 
	IF IsPS2 
		make_main_menu_item { text = #"Options / MTX Demo" 
			id = menu_options 
			pad_choose_script = main_menu_exit 
			pad_choose_params = { new_menu_script = create_setup_options_menu } 
			mark_first_input 
			focus_params = { attract_timer } 
		} 
		SetScreenElementProps { 
			id = menu_options 
			event_handlers = [ 
				{ focus PlayHelperDesc params = { options_helper_desc_ps2 } } 
				{ unfocus StopHelperDesc } 
			] 
		} 
	ELSE 
		make_main_menu_item { text = #"Options" 
			id = menu_options 
			pad_choose_script = main_menu_exit 
			pad_choose_params = { new_menu_script = create_setup_options_menu } 
			mark_first_input 
			focus_params = { attract_timer } 
		} 
		SetScreenElementProps { 
			id = menu_options 
			event_handlers = [ 
				{ focus PlayHelperDesc params = { options_helper_desc } } 
				{ unfocus StopHelperDesc } 
			] 
		} 
	ENDIF 
	make_main_menu_item { text = #"Quit" 
		id = menu_quit 
		pad_choose_script = main_menu_exit 
		pad_choose_params = { new_menu_script = confirm_quit_game } 
		mark_first_input 
		focus_params = { attract_timer } 
	} 
	SetScreenElementProps { 
		id = menu_quit 
		event_handlers = [ 
			{ focus PlayHelperDesc params = { quitgame_helper_desc } } 
			{ unfocus StopHelperDesc } 
		] 
	} 
	CreateScreenElement { 
		type = ContainerElement 
		parent = current_menu_anchor 
		id = attract_container 
		event_handlers = [ { pad_back reset_attract_mode_timer } 
			{ pad_left reset_attract_mode_timer } 
			{ pad_right reset_attract_mode_timer } 
		] 
	} 
	RunScriptOnScreenElement id = main_menu menu_onscreen 
	FireEvent type = focus target = attract_container 
	unpauseskaters 
	UnpauseMusicAndStreams 
	IF GotParam continue_shadow_skater_ai 
		SpawnScript shadow_skater_script2 
	ELSE 
		SpawnScript shadow_skater_script2 params = { make_it_safe launched = <launched> } 
	ENDIF 
	KillSpawnedScript name = attract_mode_timer 
	SpawnScript attract_mode_timer 
	SpawnSecondControllerCheck 
	wait 5 gameframe 
	kill_start_key_binding 
ENDSCRIPT

SCRIPT shadow_skater_script 
	IF GotParam taunt_options 
		MakeSkaterGoto ShadowSkaterTauntAI params = <...> 
	ELSE 
		MakeSkaterGoto ShadowSkaterAI 
	ENDIF 
	IF NOT ObjectExists id = Menu_Cam 
		create_menu_camera 
	ELSE 
		Menu_Cam : unpause 
	ENDIF 
	IF GotParam taunt_options 
		Skater : move X = 55 y = 0 z = 250 
		Skater : rotate y = 90 
		Menu_Cam : Obj_SetPosition Position = VECTOR(110.00000000000, 35.00000000000, 360.00000000000) 
	ELSE 
		Menu_Cam : Obj_SetPosition Position = VECTOR(100.00000000000, 50.00000000000, 350.00000000000) 
		Menu_Cam : Obj_SetOrientation y = 45 
	ENDIF 
	make_mainmenu_3d_plane 
	KillSkaterCamAnim all 
	wait 1 gameframe 
	SetActiveCamera id = Menu_Cam 
ENDSCRIPT

SCRIPT shadow_skater_script2 
	IF GotParam launched 
		wait 30 gameframes 
	ENDIF 
	unpauseskaters 
	SetActiveCamera id = SkaterCam0 
	Skater : Obj_GetID 
	MakeSkaterGoto ShadowSkaterFreestyleAI params = <...> 
	targetOffset = VECTOR(-65.00000000000, 35.00000000000, 0.00000000000) 
	positionOffset = VECTOR(180.00000000000, 0.00000000000, 180.00000000000) 
	KillSkaterCamAnim all 
	PlaySkaterCamAnim { name = mainmenu_camera02 
		Skater = 0 
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
	Skater : ShadowSkaterOptionsTrickScript 
ENDSCRIPT

SCRIPT ShadowSkaterOptionsTrickScript 
	SetSpeed 0 
	SetRollingFriction 999 
	SetSpeed 1 
	SetRollingFriction 5 
	type = ( RANDOM_NO_REPEAT(1, 1) RANDOMCASE 0 RANDOMCASE 1 RANDOMEND ) 
	IF ( <type> = 0 ) 
		PlayAnim { Anim = crouchidle speed = 1.00000000000 BlendPeriod = 0.20000000298 cycle } 
		wait 1.29999995232 seconds 
		PlayAnim { Anim = ollie speed = 1.00000000000 BlendPeriod = 0 } 
		Jump no_sound 
		WaitAnim 20 percent 
		Anim = ( RANDOM_NO_REPEAT(1, 1, 1, 1, 1, 1, 1, 1, 1, 1) RANDOMCASE _360Flip RANDOMCASE kickflip RANDOMCASE heelflip RANDOMCASE impossible RANDOMCASE Hardflip RANDOMCASE varialkickflip RANDOMCASE varialheelflip RANDOMCASE PopShoveItBS RANDOMCASE NollieKickflip RANDOMCASE PopShoveIt RANDOMEND ) 
		PlayAnim { Anim = <Anim> speed = 1.00000000000 BlendPeriod = 0.20000000298 } 
		waitAnimFinished 
		PlayAnim { Anim = crouchidle speed = 1.00000000000 BlendPeriod = 0.20000000298 cycle } 
	ELSE 
		Anim = ( RANDOM_NO_REPEAT(1, 1) RANDOMCASE NoseManual_Range RANDOMCASE Manual_Range RANDOMEND ) 
		PlayAnim { Anim = crouchidle speed = 1.00000000000 BlendPeriod = 0.20000000298 cycle } 
		wait 0.60000002384 seconds 
		PlayAnim { Anim = <Anim> speed = 1.00000000000 from = 20 to = 60 BlendPeriod = 0.50000000000 } 
		waitAnimFinished 
		PlayAnim { Anim = <Anim> speed = 1.00000000000 backwards from = 20 to = 60 BlendPeriod = 0.20000000298 } 
		waitAnimFinished 
		PlayAnim { Anim = crouchidle speed = 1.00000000000 BlendPeriod = 0.20000000298 cycle } 
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
			Obj_SetLightAmbientColor r = 0 g = 0 b = 0 
			Obj_SetLightDiffuseColor index = 0 r = 0 g = 0 b = 0 
			Obj_SetLightDiffuseColor index = 1 r = 0 g = 0 b = 0 
		ENDIF 
		CancelRotateDisplay 
		DisablePlayerInput 
		SetRollingFriction 10000 
		SetSpeed 0 
	ELSE 
		waitAnimFinished 
	ENDIF 
	BEGIN 
		PlayAnim Anim = Idle cycle 
		wait 2 second 
		RANDOM_PERMUTE(1, 1, 1, 1, 1, 1, 1, 1) 
			RANDOMCASE PlayAnim Anim = HandstandHandFlip_Init 
			waitAnimFinished 
			PlayAnim Anim = HandstandHandFlip_Range speed = 1.00000000000 
			waitAnimFinished 
			PlayAnim Anim = HandstandHandFlip_out speed = 0.75000000000 
			waitAnimFinished 
			PlayAnim Anim = Idle 
			waitAnimFinished 
			RANDOMCASE PlayAnim Anim = Truckstand_Init 
			waitAnimFinished 
			PlayAnim Anim = Truckstand_Range 
			waitAnimFinished 
			PlayAnim Anim = Truckstand_Out speed = 1.50000000000 
			waitAnimFinished 
			RANDOMCASE PlayAnim Anim = Primo_Init to = 10 
			waitAnimFinished 
			PlayAnim Anim = Primo_Range 
			waitAnimFinished 
			PlayAnim Anim = Primo_Out 
			waitAnimFinished 
			RANDOMCASE PlayAnim Anim = DoubleBlunt_Idle 
			waitAnimFinished 
			RANDOMCASE PlayAnim Anim = HoHoStreetPlant_Init 
			waitAnimFinished 
			PlayAnim Anim = HoHoStreetPlant_Init backwards 
			waitAnimFinished 
			RANDOMCASE PlayAnim Anim = CessSlide180_FS BlendPeriod = 0 
			waitAnimFinished 
			flip 
			PlayAnim Anim = Idle BlendPeriod = 0 
			waitAnimFinished 
			RANDOMCASE PlayAnim Anim = CessSlide180_BS BlendPeriod = 0 
			waitAnimFinished 
			flip 
			PlayAnim Anim = Idle BlendPeriod = 0 
			waitAnimFinished 
			RANDOMCASE PlayAnim Anim = casper_init 
			waitAnimFinished 
			PlayAnim Anim = casper_range speed = 1.79999995232 
			waitAnimFinished 
			PlayAnim Anim = casper_init backwards speed = 1.25000000000 
			waitAnimFinished 
		RANDOMEND 
	REPEAT 
ENDSCRIPT

SCRIPT ShadowSkaterTauntAI 
	printf "script ShadowSkaterTauntAI" 
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
		waitAnimFinished 
	ENDIF 
	PlayAnim Anim = Idle cycle 
ENDSCRIPT

SCRIPT Skateshop_Slideshow 
	RETURN 
	BEGIN 
		wait 10 seconds 
		KillSkaterCamAnim all 
		PlaySkaterCamAnim RANDOM_NO_REPEAT(1, 1, 1, 1, 1, 1) RANDOMCASE name = SS_MenuCam01 RANDOMCASE name = SS_MenuCam02 RANDOMCASE name = SS_MenuCam03 RANDOMCASE name = SS_MenuCam04 RANDOMCASE name = SS_MenuCam05 RANDOMCASE name = SS_MenuCam RANDOMEND play_hold 
	REPEAT 
ENDSCRIPT

SCRIPT launch_setup_options_menu 
	pulse_blur 
	IF ScreenElementExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	create_setup_options_menu 
ENDSCRIPT

SCRIPT quit_game 
	QuitGame 
ENDSCRIPT

SCRIPT create_setup_options_menu 
	change_gamemode_singlesession 
	dialog_box_exit 
	Skater : add_skater_to_world 
	Change in_options_menu = 1 
	FormatText ChecksumName = title_icon "%i_options" i = ( THEME_PREFIXES [ current_theme_prefix ] ) 
	make_new_themed_scrolling_menu title = "OPTIONS" title_icon = <title_icon> dims = PAIR(300.00000000000, 252.00000000000) 
	make_mainmenu_3d_plane id = cloud_bg z_priority = -499 model = "options_clouds\\options_clouds.mdl" 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		id = vector_bg 
		texture = mm_vector_bg_1 
		rgba = [ 100 100 100 80 ] 
		just = [ right bottom ] 
		pos = PAIR(640.00000000000, 400.00000000000) 
		scale = PAIR(1.79999995232, 0.80000001192) 
		z_priority = -3 
		alpha = 0.69999998808 
	} 
	kill_start_key_binding 
	SetScreenElementProps { id = sub_vmenu event_handlers = [ 
		{ pad_back generic_menu_pad_back params = { callback = create_main_menu } } ] 
	} 
	IF IsPS2 
		theme_menu_add_item { text = #"MTX Mototrax Demo" 
			id = options_motox 
			pad_choose_script = options_menu_exit 
			pad_choose_params = { new_menu_script = confirm_demo } 
			centered 
			no_bg 
		} 
	ENDIF 
	theme_menu_add_item { text = #"Save Game" 
		id = options_save 
		pad_choose_script = options_menu_exit 
		pad_choose_params = { new_menu_script = launch_options_menu_save_game_sequence } 
		centered 
		no_bg 
	} 
	IF GetGlobalFlag flag = CAREER_STARTED 
		theme_menu_add_item { text = #"Load Game" 
			id = options_load 
			pad_choose_script = options_menu_exit 
			pad_choose_params = { new_menu_script = prompt_launch_options_menu_load } 
			centered 
			no_bg 
		} 
	ELSE 
		theme_menu_add_item { text = #"Load Game" 
			id = options_load 
			pad_choose_script = options_menu_exit 
			pad_choose_params = { new_menu_script = launch_options_menu_load_game_sequence } 
			centered 
			no_bg 
		} 
	ENDIF 
	theme_menu_add_item { text = #"Control Setup" 
		id = options_controller 
		pad_choose_script = options_menu_exit 
		pad_choose_params = { new_menu_script = create_controller_config_menu } 
		centered 
		no_bg 
	} 
	IF IsPS2 
		theme_menu_add_item { text = #"Network Options" 
			id = options_network 
			pad_choose_script = options_menu_exit 
			pad_choose_params = { new_menu_script = create_network_options_menu } 
			centered 
			no_bg 
		} 
	ENDIF 
	theme_menu_add_item { text = #"Sound Options" 
		pad_choose_script = options_menu_exit 
		pad_choose_params = { new_menu_script = create_sound_options_menu } 
		centered 
		no_bg 
	} 
	IF NOT isxbox 
		theme_menu_add_item { text = #"Screen Mode" 
			pad_choose_script = options_menu_exit 
			pad_choose_params = { new_menu_script = create_screen_menu callback_script = create_setup_options_menu } 
			centered 
			no_bg 
		} 
	ENDIF 
	IF NOT isngc 
		theme_menu_add_item { text = #"Taunt Options" 
			pad_choose_script = options_menu_exit 
			pad_choose_params = { new_menu_script = create_taunt_options_menu keep_skater } 
			centered 
			no_bg 
		} 
	ENDIF 
	theme_menu_add_flag_item { text = "Blood:" 
		id = blood_text 
		flag = BLOOD_OFF 
		reverse 
		no_bg 
	} 
	theme_menu_add_item { text = #"Game Progress" 
		id = options_progress 
		pad_choose_script = options_menu_exit 
		pad_choose_params = { new_menu_script = game_progress_menu_create from_options } 
		centered 
		no_bg 
	} 
	IF NOT IsTrue demo_build 
		theme_menu_add_item { text = #"High Scores" 
			id = options_records 
			pad_choose_script = options_menu_exit 
			pad_choose_params = { new_menu_script = high_scores_menu_create from_options = from_options level = 1 level_name = "New Jersey" } 
			centered 
			no_bg 
		} 
		theme_menu_add_item { text = #"Cheat Codes" 
			id = options_cheats 
			pad_choose_script = options_menu_exit 
			pad_choose_params = { new_menu_script = create_onscreen_keyboard 
				text = "" 
				keyboard_title = "ENTER CHEAT" 
				min_length = 1 
				max_length = 15 
				keyboard_done_script = check_cheat_from_keyboard 
				keyboard_cancel_script = check_cheat_from_keyboard 
				keyboard_cancel_params = { cancel } 
			allow_cancel } 
			centered 
			no_bg 
		} 
		theme_menu_add_item { text = #"THUG Movies" 
			id = options_movies 
			pad_choose_script = options_menu_exit 
			pad_choose_params = { new_menu_script = create_movies_menu from_options = from_options } 
			centered 
			no_bg 
		} 
		theme_menu_add_item { text = #"Teasers" 
			id = options_teasers 
			pad_choose_script = options_menu_exit 
			pad_choose_params = { new_menu_script = create_teaser_menu from_options = from_options } 
			centered 
			no_bg 
		} 
		theme_menu_add_item { text = #"Interface Themes" 
			id = options_themes 
			pad_choose_script = options_menu_exit 
			pad_choose_params = { new_menu_script = swap_themes_menu } 
			centered 
			no_bg 
		} 
		theme_menu_add_item { text = #"PC Credits" 
			id = options_pc_credits 
			pad_choose_script = options_menu_exit 
			pad_choose_params = { new_menu_script = create_options_movie movie_file = "movies\\pccredits" } 
			centered 
			no_bg 
		} 
		theme_menu_add_item { text = #"Credits" 
			id = options_credits 
			pad_choose_script = options_menu_exit 
			pad_choose_params = { new_menu_script = create_options_movie movie_file = "movies\\credits" } 
			centered 
			no_bg 
		} 
		theme_menu_add_item { text = #"Done" 
			id = options_done 
			pad_choose_script = options_menu_exit 
			pad_choose_params = { new_menu_script = create_main_menu keep_skater } 
			centered 
			last_menu_item = last_menu_item 
			no_bg 
		} 
	ENDIF 
	UnpauseMusicAndStreams 
	SpawnScript shadow_skater_script 
	finish_themed_scrolling_menu 
ENDSCRIPT

SCRIPT prompt_launch_options_menu_load 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	Skater : hide 
	create_dialog_box { title = "Load Game" 
		text = #"Warning !\\nAny unsaved changes to your current STORY/SKATER will be lost.\\nContinue ?" 
		pos = PAIR(320.00000000000, 240.00000000000) 
		just = [ center center ] 
		text_rgba = [ 88 105 112 128 ] 
		text_scale = 1 
		buttons = [ { font = small text = "Yes" pad_choose_script = launch_options_menu_load_game_sequence } 
			{ font = small text = "No" pad_choose_script = no_launch_options_menu_load } 
		] 
	} 
ENDSCRIPT

SCRIPT no_launch_options_menu_load 
	dialog_box_exit 
	Skater : unhide 
	create_setup_options_menu 
ENDSCRIPT

SCRIPT confirm_demo 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	create_dialog_box { title = "Warning!" 
		text = "If you play the demo now your unsaved progress will be lost. Exit to demo?" 
		pos = PAIR(320.00000000000, 240.00000000000) 
		just = [ center center ] 
		text_rgba = [ 88 105 112 128 ] 
		text_scale = 1 
		pad_back_script = create_setup_options_menu 
		buttons = [ { font = small text = "Yes" pad_choose_script = motox_demo } 
			{ font = small text = "No" pad_choose_script = create_setup_options_menu } 
		] 
	} 
ENDSCRIPT

SCRIPT start_motox_demo 
	level_select_change_level level = load_motox 
ENDSCRIPT

SCRIPT options_menu_exit 
	dialog_box_exit 
	SetActiveCamera id = SkaterCam0 
	play_no_skater_cam 
	Change in_options_menu = 0 
	IF ScreenElementExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	IF NOT GotParam keep_skater 
		Skater : remove_skater_from_world 
	ENDIF 
	generic_menu_pad_choose_sound 
	<new_menu_script> <...> 
ENDSCRIPT

SCRIPT control_options_graphic 
	CreateScreenElement { 
		type = ContainerElement 
		parent = current_menu_anchor 
		id = joystick_anchor 
		dims = PAIR(320.00000000000, 240.00000000000) 
		pos = PAIR(340.00000000000, 30.00000000000) 
		just = [ left top ] 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = joystick_anchor 
		id = joystick1 
		texture = co_icon_1 
		pos = PAIR(170.00000000000, 160.00000000000) 
		just = [ center center ] 
		alpha = 0.30000001192 
		z_priority = -2 
		scale = PAIR(0.80000001192, 0.80000001192) 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = joystick_anchor 
		id = joystick2 
		texture = co_icon_2 
		pos = PAIR(160.00000000000, 170.00000000000) 
		just = [ center center ] 
		alpha = 0.03500000015 
		z_priority = -2 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = joystick_anchor 
		id = joystick_cord 
		texture = co_icon_4 
		pos = PAIR(70.00000000000, 50.00000000000) 
		just = [ center center ] 
		alpha = 0.30000001192 
		z_priority = -2 
		scale = PAIR(2.00000000000, 2.00000000000) 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = joystick_anchor 
		id = joystick_stick 
		texture = co_icon_3 
		pos = PAIR(170.00000000000, 140.00000000000) 
		scale = PAIR(1.39999997616, 0.89999997616) 
		just = [ center bottom ] 
		alpha = 0.34999999404 
		rot_angle = 0 
		z_priority = 0 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = joystick_anchor 
		id = joystick_ball 
		texture = co_icon_3_b 
		pos = PAIR(170.00000000000, 70.00000000000) 
		rgba = [ 62 65 70 128 ] 
		just = [ center center ] 
		alpha = 1.00000000000 
		z_priority = 1 
		scale = 1.79999995232 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		id = so_rotating_bg 
		texture = bg_vector_1 
		rgba = [ 23 58 75 15 ] 
		just = [ center , center ] 
		pos = PAIR(210.00000000000, 180.00000000000) 
		z_priority = -4 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		id = so_rotating_bg2 
		texture = bg_vector_1 
		rgba = [ 100 25 3 15 ] 
		just = [ center , center ] 
		pos = PAIR(210.00000000000, 180.00000000000) 
		z_priority = -3 
	} 
	SpawnScript chap_new_rotating_bg params = { id = so_rotating_bg scale = 1.39999997616 rot_angle = -5752 } 
	SpawnScript chap_new_rotating_bg_2 params = { id = so_rotating_bg2 scale = 1.10000002384 rot_angle = -5752 } 
ENDSCRIPT

SCRIPT animate_joystick 
	IF NOT ScreenElementExists id = joystick_stick 
		RETURN 
	ENDIF 
	IF ( joystick_pushed = 1 ) 
		RETURN 
	ENDIF 
	Change joystick_pushed = 1 
	SWITCH <dir> 
		CASE up 
			DoScreenElementMorph id = joystick_stick scale = PAIR(1.10000002384, 1.00000000000) rot_angle = -15 relative_scale time = 0.10000000149 
			DoScreenElementMorph id = joystick_ball pos = PAIR(153.00000000000, 70.00000000000) scale = 0.85000002384 relative_scale time = 0.10000000149 
		CASE down 
			DoScreenElementMorph id = joystick_stick scale = PAIR(1.20000004768, 0.89999997616) rot_angle = 60 relative_scale time = 0.10000000149 
			DoScreenElementMorph id = joystick_ball pos = PAIR(220.00000000000, 110.00000000000) scale = 1.10000002384 relative_scale time = 0.10000000149 
		CASE left 
			DoScreenElementMorph id = joystick_stick scale = PAIR(1.20000004768, 0.89999997616) rot_angle = -60 relative_scale time = 0.10000000149 
			DoScreenElementMorph id = joystick_ball pos = PAIR(120.00000000000, 110.00000000000) scale = 1.10000002384 relative_scale time = 0.10000000149 
		CASE right 
			DoScreenElementMorph id = joystick_stick scale = PAIR(1.00000000000, 1.00000000000) rot_angle = 40 relative_scale time = 0.10000000149 
			DoScreenElementMorph id = joystick_ball pos = PAIR(215.00000000000, 90.00000000000) scale = 0.89999997616 relative_scale time = 0.10000000149 
		DEFAULT 
			printf "forgot joystick dir" 
			RETURN 
	ENDSWITCH 
	wait 0.10000000149 seconds 
	BEGIN 
		IF ControllerPressed <dir> 
			wait 1 gameframe 
		ELSE 
			BREAK 
		ENDIF 
	REPEAT 
	IF ScreenElementExists id = joystick_stick 
		DoScreenElementMorph id = joystick_stick scale = PAIR(1.00000000000, 1.00000000000) rot_angle = 0 relative_scale time = 0.10000000149 
		DoScreenElementMorph id = joystick_ball pos = PAIR(170.00000000000, 70.00000000000) scale = 1.00000000000 relative_scale time = 0.10000000149 
	ENDIF 
	wait 0.10000000149 seconds 
	Change joystick_pushed = 0 
ENDSCRIPT

SCRIPT create_movies_menu 
	focus_index = 0 
	IF NOT GotParam from_options 
		Skater : AddSkatertoWorld 
		Skater : RemoveSkaterFromWorld 
	ENDIF 
	Skater : pausephysics 
	FormatText ChecksumName = title_icon "%i_movie" i = ( THEME_PREFIXES [ current_theme_prefix ] ) 
	make_new_themed_scrolling_menu title = "MOVIES" title_icon = <title_icon> 
	create_helper_text = { helper_text_elements = [ { text = "\\b7/\\b4 = Select" } 
			{ text = "\\bn = Back" } 
			{ text = "\\bm = Accept" } 
		] 
	} 
	SetScreenElementProps { id = sub_menu 
		event_handlers = [ 
			{ pad_back generic_menu_pad_back params = { callback = movie_menu_exit } } 
		] 
	} 
	GetArraySize movie_info 
	index = 0 
	first_item = first_item 
	BEGIN 
		IF StructureContains structure = ( movie_info [ <index> ] ) flag 
			IF GetGlobalFlag flag = ( ( movie_info [ <index> ] ) . flag ) 
				theme_menu_add_item { text = ( ( movie_info [ <index> ] ) . name ) 
					pad_choose_script = movie_menu_play_movie 
					pad_choose_params = { movie_file = ( ( movie_info [ <index> ] ) . file ) index = <index> } 
					centered 
					no_bg 
					<first_item> 
				} 
			ELSE 
				theme_menu_add_item { text = ( ( movie_info [ <index> ] ) . name ) 
					pad_choose_script = nullscript 
					not_focusable = not_focusable 
					centered 
					no_bg 
					<first_item> 
				} 
			ENDIF 
		ELSE 
			theme_menu_add_item { text = ( ( movie_info [ <index> ] ) . name ) 
				pad_choose_script = movie_menu_play_movie 
				pad_choose_params = { movie_file = ( ( movie_info [ <index> ] ) . file ) index = <index> } 
				centered 
				no_bg 
				<first_item> 
			} 
		ENDIF 
		RemoveParameter first_item 
		<index> = ( <index> + 1 ) 
	REPEAT <array_size> 
	theme_menu_add_item { text = "Done" 
		id = menu_done 
		pad_choose_script = generic_menu_pad_choose 
		pad_choose_params = { callback = controller_config_exit } 
		centered 
		no_bg 
		last_item 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		id = movie_black_box 
		texture = black 
		pos = PAIR(320.00000000000, 240.00000000000) 
		rgba = [ 0 0 0 128 ] 
		scale = PAIR(0.00000000000, 0.00000000000) 
		just = [ center center ] 
		z_priority = 5 
	} 
	movie_menu_graphic 
	SpawnScript rotate_projector_wheels 
	finish_themed_scrolling_menu 
	IF ( <focus_index> > 0 ) 
		BEGIN 
			FireEvent type = pad_down target = current_menu 
		REPEAT <focus_index> 
	ENDIF 
ENDSCRIPT

SCRIPT create_teaser_menu focus_index = 0 
	IF NOT GotParam from_options 
		Skater : AddSkatertoWorld 
		Skater : RemoveSkaterFromWorld 
	ENDIF 
	Skater : pausephysics 
	FormatText ChecksumName = title_icon "%i_movie" i = ( THEME_PREFIXES [ current_theme_prefix ] ) 
	make_new_themed_scrolling_menu title = "TEASERS" title_icon = <title_icon> 
	create_helper_text = { helper_text_elements = [ { text = "\\b7/\\b4 = Select" } 
			{ text = "\\bn = Back" } 
			{ text = "\\bm = Accept" } 
		] 
	} 
	SetScreenElementProps { id = sub_menu 
		event_handlers = [ 
			{ pad_back generic_menu_pad_back params = { callback = teaser_menu_exit } } 
		] 
	} 
	GetArraySize teaser_info 
	index = 0 
	first_item = first_item 
	BEGIN 
		IF StructureContains structure = ( teaser_info [ <index> ] ) flag 
			IF GetGlobalFlag flag = ( ( teaser_info [ <index> ] ) . flag ) 
				theme_menu_add_item { text = ( ( teaser_info [ <index> ] ) . name ) 
					pad_choose_script = teaser_menu_play_movie 
					pad_choose_params = { movie_file = ( ( teaser_info [ <index> ] ) . file ) index = <index> } 
					centered 
					no_bg 
					<first_item> 
				} 
			ELSE 
				theme_menu_add_item { text = ( ( teaser_info [ <index> ] ) . name ) 
					pad_choose_script = nullscript 
					not_focusable = not_focusable 
					centered 
					no_bg 
					<first_item> 
				} 
			ENDIF 
		ELSE 
			theme_menu_add_item { text = ( ( teaser_info [ <index> ] ) . name ) 
				pad_choose_script = teaser_menu_play_movie 
				pad_choose_params = { movie_file = ( ( teaser_info [ <index> ] ) . file ) index = <index> } 
				centered 
				no_bg 
				<first_item> 
			} 
		ENDIF 
		RemoveParameter first_item 
		<index> = ( <index> + 1 ) 
	REPEAT <array_size> 
	theme_menu_add_item { text = "Done" 
		id = menu_done 
		pad_choose_script = generic_menu_pad_choose 
		pad_choose_params = { callback = controller_config_exit } 
		centered 
		no_bg 
		last_item 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		id = movie_black_box 
		texture = black 
		pos = PAIR(320.00000000000, 240.00000000000) 
		rgba = [ 0 0 0 128 ] 
		scale = PAIR(0.00000000000, 0.00000000000) 
		just = [ center center ] 
		z_priority = 5 
	} 
	movie_menu_graphic 
	SpawnScript rotate_projector_wheels 
	finish_themed_scrolling_menu 
	IF ( <focus_index> > 0 ) 
		BEGIN 
			FireEvent type = pad_down target = current_menu 
		REPEAT <focus_index> 
	ENDIF 
ENDSCRIPT

SCRIPT teaser_menu_play_movie 
	printf "teaser_menu_play_movie" 
	IF NOT GotParam movie_file 
		printf "movie_menu_play_movie MISSING PARAM movie_file!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" 
	ENDIF 
	PauseMusicandStreams 1 
	KillSpawnedScript name = rotate_projector_wheels 
	KillSpawnedScript name = shake_projector 
	KillSpawnedScript name = chap_new_rotating_bg 
	KillSpawnedScript name = chap_new_rotating_bg2 
	IF ScreenElementExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	playmovie_script <movie_file> 
	RunScriptOnComponentType component = animation target = InvalidateCache params = { } 
	create_teaser_menu focus_index = <index> 
ENDSCRIPT

SCRIPT teaser_menu_exit 
	KillSpawnedScript name = rotate_projector_wheels 
	KillSpawnedScript name = shake_projector 
	controller_config_exit 
ENDSCRIPT

teaser_info = [ 
	{ name = "Adio" file = "teasers\\adio" } 
	{ name = "Billabong" file = "teasers\\billabon" } 
	{ name = "DC Shoes" file = "teasers\\dc" } 
	{ name = "Hawk Clothing" file = "teasers\\HawkC" } 
	{ name = "Krux" file = "teasers\\krux" } 
	{ name = "Nixon" file = "teasers\\Nixon" } 
	{ name = "QuikSilver" file = "teasers\\quik" } 
	{ name = "Transworld" file = "teasers\\transwor" } 
	{ name = "Vans" file = "teasers\\vans" } 
	{ name = "Volcom " file = "teasers\\Volcom" } 
	{ name = "Von Zipper" file = "teasers\\vonzippe" } 
] 
SCRIPT movie_menu_exit 
	KillSpawnedScript name = rotate_projector_wheels 
	KillSpawnedScript name = shake_projector 
	controller_config_exit 
ENDSCRIPT

SCRIPT movie_menu_graphic 
	CreateScreenElement { 
		type = ContainerElement 
		parent = current_menu_anchor 
		id = projector_anchor 
		dims = PAIR(320.00000000000, 240.00000000000) 
		pos = PAIR(360.00000000000, -20.00000000000) 
		just = [ left top ] 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = projector_anchor 
		id = projector1 
		texture = mo_icon_1 
		pos = PAIR(150.00000000000, 190.00000000000) 
		just = [ center center ] 
		alpha = 0.40000000596 
		rot_angle = 11 
		z_priority = -2 
		scale = PAIR(0.80000001192, 0.80000001192) 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = projector_anchor 
		id = projector2 
		texture = mo_icon_2 
		pos = PAIR(150.00000000000, 198.00000000000) 
		just = [ center center ] 
		alpha = 0.05499999970 
		rot_angle = 10 
		z_priority = -2 
	} 
	wheel1_pos = PAIR(81.00000000000, 88.00000000000) 
	CreateScreenElement { 
		type = SpriteElement 
		parent = projector_anchor 
		id = projector_wheel1 
		texture = mo_icon_3 
		rgba = [ 40 91 112 98 ] 
		pos = <wheel1_pos> 
		just = [ center center ] 
		alpha = 0.89999997616 
		scale = 1.50000000000 
		z_priority = 1 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = projector_anchor 
		id = projector_film1 
		texture = mo_film 
		rgba = [ 12 28 39 128 ] 
		pos = <wheel1_pos> 
		just = [ center center ] 
		alpha = 0.89999997616 
		scale = 2.50000000000 
		z_priority = 1 
	} 
	wheel2_pos = PAIR(242.00000000000, 168.00000000000) 
	CreateScreenElement { 
		type = SpriteElement 
		parent = projector_anchor 
		id = projector_wheel2 
		texture = mo_icon_3 
		rgba = [ 40 91 112 98 
		] 
		pos = <wheel2_pos> 
		just = [ center center ] 
		alpha = 0.89999997616 
		scale = 1.70000004768 
		z_priority = 1 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = projector_anchor 
		id = projector_film2 
		texture = mo_film 
		rgba = [ 12 28 39 128 ] 
		pos = <wheel2_pos> 
		just = [ center center ] 
		alpha = 0.89999997616 
		scale = 1.50000000000 
		z_priority = 1 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		id = bg_star 
		texture = mo_star 
		pos = PAIR(0.00000000000, 315.00000000000) 
		just = [ left center ] 
		alpha = 0.15000000596 
		z_priority = -2 
		scale = PAIR(1.29999995232, 2.00000000000) 
	} 
ENDSCRIPT

SCRIPT rotate_projector_wheels 
	max_angle = 1800 
	film1_scale_dif_total = 1 
	film2_scale_dif_total = 1 
	scale_dif = 0 
	film1_scale = 2.50000000000 
	film2_scale = 1.50000000000 
	wheel1_angle = 51 
	wheel2_angle = 26 
	wheel1_dif = 2.50000000000 
	wheel2_dif = 2 
	rewind = 0 
	end_of_tape = 0 
	BEGIN 
		IF ScreenElementExists id = projector_wheel1 
			wheel1_angle = ( <wheel1_angle> - <wheel1_dif> ) 
			DoScreenElementMorph id = projector_wheel1 rot_angle = <wheel1_angle> time = 0.10000000149 
			wheel2_angle = ( <wheel2_angle> - <wheel2_dif> ) 
			DoScreenElementMorph id = projector_wheel2 rot_angle = <wheel2_angle> time = 0.10000000149 
			IF NOT ( <end_of_tape> = 1 ) 
				scale_dif = ( <wheel1_angle> / ( <max_angle> / 2 ) ) 
				film1_scale = ( 2.50000000000 + <scale_dif> * <film1_scale_dif_total> ) 
				DoScreenElementMorph id = projector_film1 scale = <film1_scale> rot_angle = <wheel1_angle> time = 0.10000000149 
				film2_scale = ( 1.50000000000 + -1 * <scale_dif> * <film2_scale_dif_total> ) 
				DoScreenElementMorph id = projector_film2 scale = <film2_scale> rot_angle = <wheel2_angle> time = 0.10000000149 
			ELSE 
				DoScreenElementMorph id = projector_film1 rot_angle = <wheel1_angle> time = 0.10000000149 
				DoScreenElementMorph id = projector_film2 rot_angle = <wheel2_angle> time = 0.10000000149 
			ENDIF 
			wait 0.10000000149 seconds 
			IF ( ( -1 * <max_angle> ) > <wheel2_angle> ) 
				IF ( <rewind> = 0 ) 
					printf "stop projector... wait... rewind" 
					wheel1_dif = -100 
					wheel2_dif = -80 
					rewind = 1 
					end_of_tape = 0 
					wait 1.20000004768 seconds 
					SpawnScript shake_projector 
				ENDIF 
			ELSE 
				IF ( <end_of_tape> = 0 ) 
					IF ( <rewind> = 0 ) 
						IF ( ( ( <max_angle> * -1 ) / 2 ) > <wheel2_angle> ) 
							printf "end of tape" 
							wheel1_dif = 0 
							wheel2_dif = 80 
							end_of_tape = 1 
						ENDIF 
					ENDIF 
				ENDIF 
			ENDIF 
			IF ( <wheel1_angle> > 51 & <rewind> = 1 ) 
				printf "done rewinding... play again" 
				rewind = 0 
				KillSpawnedScript name = shake_projector 
				wheel1_dif = 2.50000000000 
				wheel2_dif = 2 
				IF ScreenElementExists id = projector_wheel2 
					wheel2_angle = 26 
					DoScreenElementMorph id = projector_wheel2 rot_angle = 26 time = 0 
					wait 1 second 
				ELSE 
					BREAK 
				ENDIF 
			ENDIF 
		ELSE 
			BREAK 
		ENDIF 
	REPEAT 
ENDSCRIPT

SCRIPT shake_projector id = projector_anchor amplitude = 5 time = 0.05000000075 
	GetScreenElementPosition id = <id> 
	BEGIN 
		IF ScreenElementExists id = <id> 
			DoScreenElementMorph id = <id> time = <time> pos = ( <ScreenElementPos> - ( <amplitude> * PAIR(1.00000000000, 0.00000000000) ) ) 
			wait <time> seconds 
		ELSE 
			BREAK 
		ENDIF 
		IF ScreenElementExists id = <id> 
			DoScreenElementMorph id = <id> time = <time> pos = <ScreenElementPos> 
			wait <time> seconds 
		ELSE 
			BREAK 
		ENDIF 
	REPEAT 
ENDSCRIPT

SCRIPT movie_menu_play_movie 
	printf "movie_menu_play_movie" 
	IF NOT GotParam movie_file 
		printf "movie_menu_play_movie MISSING PARAM movie_file!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" 
	ENDIF 
	PauseMusicandStreams 1 
	KillSpawnedScript name = rotate_projector_wheels 
	KillSpawnedScript name = shake_projector 
	KillSpawnedScript name = chap_new_rotating_bg 
	KillSpawnedScript name = chap_new_rotating_bg2 
	IF ScreenElementExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	playmovie_script <movie_file> 
	RunScriptOnComponentType component = animation target = InvalidateCache params = { } 
	create_movies_menu focus_index = <index> 
ENDSCRIPT

SCRIPT animate_movie_in 
	SetButtonEventMappings block_menu_input 
	SetScreenElementProps id = root_window tags = { menu_state = entering } 
	DoMorph time = 0 scale = 190 alpha = 0 
	DoMorph time = 0.07000000030 scale = 190 alpha = 0.33000001311 
	DoMorph time = 0.07000000030 scale = 190 alpha = 0.66000002623 
	DoMorph time = 0.07000000030 scale = 190 alpha = 1 
	SetScreenElementProps id = root_window tags = { menu_state = on } 
	SetButtonEventMappings unblock_menu_input 
ENDSCRIPT

SCRIPT animate_movie_out 
	GetTags 
	SetButtonEventMappings block_menu_input 
	SetScreenElementProps id = root_window tags = { menu_state = entering } 
	DoMorph time = 0 scale = 190 alpha = 1 
	DoMorph time = 0.07000000030 scale = 190 alpha = 0.66000002623 
	DoMorph time = 0.07000000030 scale = 190 alpha = 0.33000001311 
	DoMorph time = 0.07000000030 scale = 190 alpha = 0 
	SetScreenElementProps id = root_window tags = { menu_state = on } 
	SetButtonEventMappings unblock_menu_input 
ENDSCRIPT

movie_info = [ 
	{ name = "Neversoft Logo" file = "movies\\nslogo" flag = LEVEL_UNLOCKED_SCH first_name = "" } 
	{ name = "Activision Logo" file = "movies\\atvi" flag = LEVEL_UNLOCKED_SCH first_name = "" } 
	{ name = "Beenox Logo" file = "movies\\beenox" flag = LEVEL_UNLOCKED_SCH first_name = "" } 
	{ name = "THUG Intro" file = "movies\\intro" flag = LEVEL_UNLOCKED_SCH first_name = "" } 
	{ name = "Tony Hawk" file = "movies\\hawk" flag = MOVIE_UNLOCKED_HAWK first_name = "Tony" } 
	{ name = "Bob Burnquist" file = "movies\\burnquis" flag = MOVIE_UNLOCKED_BURNQUIST first_name = "Bob" } 
	{ name = "Eric Koston" file = "movies\\koston" flag = MOVIE_UNLOCKED_KOSTON first_name = "Eric" } 
	{ name = "Bucky Lasek" file = "movies\\lasek" flag = MOVIE_UNLOCKED_LASEK first_name = "Bucky" } 
	{ name = "Bam Margera" file = "movies\\margera" flag = MOVIE_UNLOCKED_MARGERA first_name = "Bam" } 
	{ name = "Rodney Mullen" file = "movies\\mullen" flag = MOVIE_UNLOCKED_MULLEN first_name = "Rodney" } 
	{ name = "Chad Muska" file = "movies\\muska" flag = MOVIE_UNLOCKED_MUSKA first_name = "Chad" } 
	{ name = "Andrew Reynolds" file = "movies\\reynolds" flag = MOVIE_UNLOCKED_REYNOLDS first_name = "Andrew" } 
	{ name = "Paul Rodriguez" file = "movies\\rodrigue" flag = MOVIE_UNLOCKED_RODRIGUEZ first_name = "Paul" } 
	{ name = "Geoff Rowley" file = "movies\\rowley" flag = MOVIE_UNLOCKED_ROWLEY first_name = "Geoff" } 
	{ name = "Arto Saari" file = "movies\\saari" flag = MOVIE_UNLOCKED_SAARI first_name = "Arto" } 
	{ name = "Jamie Thomas" file = "movies\\thomas" flag = MOVIE_UNLOCKED_THOMAS first_name = "Jamie" } 
	{ name = "Mike Vallely" file = "movies\\vallely" flag = MOVIE_UNLOCKED_VALLELEY first_name = "Mike" } 
	{ name = "Bails 1" file = "movies\\probail1" flag = MOVIE_UNLOCKED_CAS first_name = "custom" } 
	{ name = "Bails 2" file = "movies\\probail2" flag = MOVIE_UNLOCKED_BAILS2 first_name = "" } 
	{ name = "BirdHouse" file = "teasers\\bird" flag = MOVIE_UNLOCKED_BIRDHOUSE first_name = "" } 
	{ name = "Element" file = "teasers\\element" flag = MOVIE_UNLOCKED_ELEMENT first_name = "" } 
	{ name = "Flip" file = "teasers\\flip" flag = MOVIE_UNLOCKED_FLIP first_name = "" } 
	{ name = "Girl" file = "teasers\\girl" flag = MOVIE_UNLOCKED_GIRL first_name = "" } 
	{ name = "Zero" file = "teasers\\zero" flag = MOVIE_UNLOCKED_ZERO first_name = "" } 
	{ name = "Always Hard" file = "movies\\homiesp1" flag = MOVIE_UNLOCKED_HOMIES1 first_name = "" } 
	{ name = "Kiss" file = "movies\\kiss" flag = MOVIE_UNLOCKED_KISS first_name = "" } 
] 
SCRIPT create_options_movie 
	PauseMusicandStreams 1 
	IF ScreenElementExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	playmovie_script <movie_file> 
	RunScriptOnComponentType component = animation target = InvalidateCache params = { } 
	create_setup_options_menu 
ENDSCRIPT

SCRIPT create_taunt_options_menu 
	IF ScreenElementExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	FormatText ChecksumName = title_icon "%i_options" i = ( THEME_PREFIXES [ current_theme_prefix ] ) 
	make_new_themed_sub_menu title = "TAUNT OPTIONS" title_icon = <title_icon> 
	Skater : AddSkatertoWorld 
	build_top_and_bottom_blocks 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		id = vector_bg 
		texture = mm_vector_bg_1 
		rgba = [ 100 100 100 80 ] 
		just = [ right bottom ] 
		pos = PAIR(640.00000000000, 400.00000000000) 
		scale = PAIR(1.79999995232, 0.80000001192) 
		z_priority = -3 
		alpha = 0.69999998808 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		id = bg_star 
		texture = TA_star 
		pos = PAIR(0.00000000000, 315.00000000000) 
		just = [ left center ] 
		alpha = 0.15000000596 
		z_priority = -2 
		scale = PAIR(1.00000000000, 1.29999995232) 
	} 
	create_helper_text = generic_helper_text 
	SetScreenElementProps { id = sub_vmenu event_handlers = [ 
			{ pad_back generic_menu_pad_back params = { callback = launch_setup_options_menu } } 
		] 
	} 
	noway_buttons = "(\\be \\be \\b2)" 
	daddy_buttons = "(\\be \\be \\b1)" 
	props_buttons = "(\\be \\be \\b0)" 
	getsome_buttons = "(\\be \\be \\b3)" 
	GetPreferenceString pref_type = taunt no_way_string 
	theme_menu_add_item { text = "\'No Way\' Text" 
		extra_text = <noway_buttons> 
		id = no_way_item 
		pad_choose_script = launch_onscreen_keyboard_from_taunt_menu 
		pad_choose_params = { field = "no_way_string" 
			text = <ui_string> 
			title = "NO WAY STRING" 
			min_length = 1 
			max_length = 31 
		} 
		focus_script = taunt_options_focus 
		focus_params = { Anim = taunt2 } 
		unfocus_script = taunt_options_unfocus 
	} 
	DoScreenElementMorph id = { no_way_item child = 3 } time = 0 scale = 0.80000001192 
	theme_menu_add_item { text = <ui_string> 
		id = no_way_item_string 
		max_width = 300 
		rgba = [ 80 80 80 128 ] 
		scale = 0.89999997616 
		not_focusable = not_focusable 
		dims = <menu_item_dims> 
		font = dialog 
		box_it_up = box_it_up 
		centered 
	} 
	GetPreferenceString pref_type = taunt your_daddy_string 
	theme_menu_add_item { text = "            \'Your Daddy\' Text" 
		extra_text = <daddy_buttons> 
		id = your_daddy_item 
		pad_choose_script = launch_onscreen_keyboard_from_taunt_menu 
		pad_choose_params = { field = "your_daddy_string" text = <ui_string> title = "YOUR DADDY STRING" min_length = 1 max_length = 31 } 
		focus_script = taunt_options_focus 
		focus_params = { Anim = taunt1 } 
		unfocus_script = taunt_options_unfocus 
	} 
	DoScreenElementMorph id = { your_daddy_item child = 3 } time = 0 scale = 0.80000001192 
	theme_menu_add_item { text = <ui_string> 
		id = your_daddy_item_string 
		max_width = 300 
		rgba = [ 80 80 80 128 ] 
		scale = 0.89999997616 
		not_focusable = not_focusable 
		dims = <menu_item_dims> 
		font = dialog 
		box_it_up = box_it_up 
		centered 
	} 
	GetPreferenceString pref_type = taunt props_string 
	theme_menu_add_item { text = "\'Props\' Text" 
		extra_text = <props_buttons> 
		id = props_item 
		pad_choose_script = launch_onscreen_keyboard_from_taunt_menu 
		pad_choose_params = { field = "props_string" text = <ui_string> title = "PROPS STRING" min_length = 1 max_length = 31 } 
		focus_script = taunt_options_focus 
		focus_params = { props } 
		unfocus_script = taunt_options_unfocus 
	} 
	DoScreenElementMorph id = { props_item child = 3 } time = 0 scale = 0.80000001192 
	theme_menu_add_item { text = <ui_string> 
		id = props_item_string 
		max_width = 300 
		rgba = [ 80 80 80 128 ] 
		scale = 0.89999997616 
		not_focusable = not_focusable 
		dims = <menu_item_dims> 
		font = dialog 
		box_it_up = box_it_up 
		centered 
	} 
	GetPreferenceString pref_type = taunt get_some_string 
	theme_menu_add_item { text = "\'Get Some\' Text" 
		extra_text = <getsome_buttons> 
		id = get_some_item 
		pad_choose_script = launch_onscreen_keyboard_from_taunt_menu 
		pad_choose_params = { field = "get_some_string" text = <ui_string> title = "GET SOME STRING" min_length = 1 max_length = 31 } 
		focus_script = taunt_options_focus 
		focus_params = { Anim = taunt3 } 
		unfocus_script = taunt_options_unfocus 
	} 
	DoScreenElementMorph id = { get_some_item child = 3 } time = 0 scale = 0.80000001192 
	theme_menu_add_item { text = <ui_string> 
		id = get_some_item_string 
		max_width = 300 
		rgba = [ 80 80 80 128 ] 
		scale = 0.89999997616 
		not_focusable = not_focusable 
		dims = <menu_item_dims> 
		font = dialog 
		last_menu_item = last_menu_item 
		box_it_up = box_it_up 
		centered 
	} 
	IF NOT GotParam continue_taunt 
		SpawnScript shadow_skater_script params = { taunt_options make_it_safe } 
	ENDIF 
	make_mainmenu_3d_plane id = cloud_bg z_priority = -500 model = "options_clouds\\options_clouds.mdl" 
	finish_themed_sub_menu 
ENDSCRIPT

SCRIPT taunt_options_focus 
	GetTags 
	main_theme_focus <...> 
	DoScreenElementMorph id = { <id> child = 3 } time = 0 rgba = [ 128 128 128 128 ] 
	KillSpawnedScript name = display_taunt 
	IF GotParam props 
		RANDOM(1, 1) RANDOMCASE Anim = Prop RANDOMCASE Anim = Cheer1 RANDOMEND 
	ENDIF 
	SpawnScript display_taunt params = { <...> } 
ENDSCRIPT

SCRIPT taunt_options_unfocus 
	GetTags 
	main_theme_unfocus <...> 
	DoScreenElementMorph id = { <id> child = 3 } time = 0 scale = 0.80000001192 
ENDSCRIPT

SCRIPT display_taunt 
	IF GotParam Anim 
		wait 10 gameframes 
		Skater : PlayAnim Anim = <Anim> 
		MakeSkaterGoto ShadowSkaterTauntAI 
	ENDIF 
ENDSCRIPT

SCRIPT taunt_options_add_item { parent = current_menu 
		font = small 
		highlight_bar_scale = PAIR(1.39999997616, 1.29999995232) 
		highlight_bar_pos = PAIR(97.00000000000, -7.00000000000) 
		focus_script = main_menu_focus 
		unfocus_script = main_menu_unfocus 
		text_just = [ right , center ] 
		text_pos = PAIR(95.00000000000, -5.00000000000) 
		dims = PAIR(200.00000000000, 20.00000000000) 
		pad_choose_script = nullscript 
	} 
	IF GotParam not_focusable 
		CreateScreenElement { 
			type = ContainerElement 
			parent = <parent> 
			id = <id> 
			dims = <dims> 
			event_handlers = [ { focus <focus_script> params = <focus_params> } 
				{ unfocus <unfocus_script> params = <unfocus_params> } 
				{ pad_choose <pad_choose_script> params = <pad_choose_params> } 
				{ pad_start <pad_choose_script> params = <pad_choose_params> } 
			] 
			replace_handlers 
			not_focusable 
		} 
	ELSE 
		CreateScreenElement { 
			type = ContainerElement 
			parent = <parent> 
			id = <id> 
			dims = <dims> 
			event_handlers = [ { focus <focus_script> params = <focus_params> } 
				{ unfocus <unfocus_script> params = <unfocus_params> } 
				{ pad_choose generic_menu_pad_choose_sound } 
				{ pad_choose <pad_choose_script> params = <pad_choose_params> } 
				{ pad_start <pad_choose_script> params = <pad_choose_params> } 
			] 
			replace_handlers 
		} 
	ENDIF 
	<anchor_id> = <id> 
	IF GotParam mark_first_input 
		SetScreenElementProps { 
			id = <anchor_id> 
			event_handlers = [ { pad_choose mark_first_input_received } 
				{ pad_choose generic_menu_pad_choose_sound } 
				{ pad_choose <pad_choose_script> params = <pad_choose_params> } 
			] 
			replace_handlers 
		} 
	ENDIF 
	IF GotParam not_focusable 
		<text_rgba> = [ 60 60 60 75 ] 
		CreateScreenElement { 
			type = TextElement 
			parent = <anchor_id> 
			id = <text_id> 
			font = <font> 
			text = <text> 
			scale = <scale> 
			pos = <text_pos> 
			just = <text_just> 
			rgba = <text_rgba> 
			not_focusable 
		} 
	ELSE 
		<text_rgba> = [ 88 105 112 128 ] 
		CreateScreenElement { 
			type = TextElement 
			parent = <anchor_id> 
			id = <text_id> 
			font = <font> 
			text = <text> 
			scale = <scale> 
			pos = <text_pos> 
			just = <text_just> 
			rgba = <text_rgba> 
		} 
	ENDIF 
	text_id = <id> 
	IF GotParam max_width 
		truncate_string id = <id> max_width = <max_width> 
	ENDIF 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <anchor_id> 
		texture = highlight_bar 
		pos = <highlight_bar_pos> 
		scale = <highlight_bar_scale> 
		just = [ center center ] 
		rgba = [ 128 128 128 0 ] 
		z_priority = 3 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = <anchor_id> 
		pos = ( <text_pos> + PAIR(20.00000000000, 7.00000000000) ) 
		font = <font> 
		text = <button_text> 
		scale = 0.80000001192 
		just = [ top right ] 
		rgba = <text_rgba> 
	} 
ENDSCRIPT

SCRIPT set_taunt_preference 
	GetTextElementString id = keyboard_current_string 
	set_preferences_from_ui prefs = taunt <...> 
	pulse_blur 
	destroy_onscreen_keyboard 
	create_taunt_options_menu continue_taunt = continue_taunt 
ENDSCRIPT

SCRIPT taunt_back_from_keyboard 
	pulse_blur 
	destroy_onscreen_keyboard 
	create_taunt_options_menu continue_taunt = continue_taunt 
ENDSCRIPT

SCRIPT launch_onscreen_keyboard_from_taunt_menu 
	pulse_blur 
	KillSpawnedScript name = display_taunt 
	Skater : RemoveSkaterFromWorld 
	generic_menu_pad_choose_sound 
	RunScriptOnScreenElement id = current_menu_anchor menu_offscreen callback = pre_create_onscreen_keyboard callback_params = { allow_cancel keyboard_cancel_script = taunt_back_from_keyboard keyboard_done_script = set_taunt_preference keyboard_title = <title> <...> } 
ENDSCRIPT

SCRIPT pre_create_onscreen_keyboard 
	create_onscreen_keyboard allow_cancel keyboard_cancel_script = taunt_back_from_keyboard keyboard_done_script = set_taunt_preference keyboard_title = <title> <...> 
ENDSCRIPT

SCRIPT join_chosen 
	IF FoundServers 
		StopServerList 
		SetJoinMode JOIN_MODE_PLAY 
		actions_menu_anchor : DoMorph scale = 0 
		DoScreenElementMorph id = game_list_up_arrow time = 0 scale = 1 
		DoScreenElementMorph id = game_list_down_arrow time = 0 scale = 1 
		FormatText ChecksumName = title_icon "%i_online" i = ( THEME_PREFIXES [ current_theme_prefix ] ) 
		build_theme_sub_title title = "GAME INFO" title_icon = <title_icon> parent = server_list_anchor 
		hide_internet_only_menus keep_chat 
		server_desc_menu_anchor : DoMorph scale = 1 
		FireEvent type = unfocus target = actions_menu 
		FireEvent type = focus target = server_list_menu 
		Change current_lobby_focus = 1 
		AssignAlias id = server_list_menu alias = current_menu 
	ENDIF 
ENDSCRIPT

SCRIPT observe_chosen 
	IF FoundServers 
		StopServerList 
		SetJoinMode JOIN_MODE_OBSERVE 
		actions_menu_anchor : DoMorph scale = 0 
		FormatText ChecksumName = title_icon "%i_online" i = ( THEME_PREFIXES [ current_theme_prefix ] ) 
		build_theme_sub_title title = "GAME INFO" title_icon = <title_icon> parent = server_list_anchor 
		hide_internet_only_menus keep_chat 
		server_desc_menu_anchor : DoMorph scale = 1 
		FireEvent type = unfocus target = actions_menu 
		FireEvent type = focus target = server_list_menu 
		Change current_lobby_focus = 1 
		AssignAlias id = server_list_menu alias = current_menu 
	ENDIF 
ENDSCRIPT

SCRIPT user_list_chosen 
	StopServerList 
	DoScreenElementMorph id = user_list_up_arrow time = 0 scale = 1 
	DoScreenElementMorph id = user_list_down_arrow time = 0 scale = 1 
	FireEvent type = unfocus target = actions_menu 
	FireEvent type = focus target = lobby_player_list_menu 
	Change current_lobby_focus = 2 
	AssignAlias id = lobby_player_list_menu alias = current_menu 
ENDSCRIPT

SCRIPT refresh_chosen 
	RefreshServerList 
	IF InInternetMode 
		FillPlayerList 
	ENDIF 
ENDSCRIPT

SCRIPT refocus_actions_menu 
	FireEvent type = unfocus target = server_list_menu 
	FireEvent type = focus target = actions_menu 
	Change current_lobby_focus = 0 
	AssignAlias id = actions_menu alias = current_menu 
	FormatText ChecksumName = title_icon "%i_online" i = ( THEME_PREFIXES [ current_theme_prefix ] ) 
	build_theme_sub_title title = "ACTIONS" title_icon = <title_icon> parent = server_list_anchor 
	IF InInternetMode 
		FireEvent type = unfocus target = lobby_player_list_menu 
		DoScreenElementMorph id = user_list_up_arrow time = 0 scale = 0 
		DoScreenElementMorph id = user_list_down_arrow time = 0 scale = 0 
		DoScreenElementMorph id = game_list_up_arrow time = 0 scale = 0 
		DoScreenElementMorph id = game_list_down_arrow time = 0 scale = 0 
		DoScreenElementMorph id = player_list_anchor time = 0 scale = 1 
		DoScreenElementMorph id = chat_box_anchor time = 0 scale = 1 
		IF ObjectExists id = console_message_vmenu 
			DoScreenElementMorph id = console_message_vmenu time = 0 scale = 1 
		ENDIF 
		DoScreenElementMorph id = buddy_list_anchor time = 0 scale = 0 
	ENDIF 
ENDSCRIPT

SCRIPT refocus_gamelist_menu 
	SetScreenElementProps id = game_list_up_arrow alpha = 1 
	SetScreenElementProps id = game_list_down_arrow alpha = 1 
	FireEvent type = unfocus target = server_desc_menu 
	FireEvent type = focus target = server_list_menu 
ENDSCRIPT

SCRIPT back_from_internet_options 
	CleanUpTopStats 
	StatsLogOff 
	ProfileLogOff 
	SetNetworkMode 
	DestroyScreenElement id = current_menu_anchor 
	create_ss_menu no_animate 
ENDSCRIPT

SCRIPT create_profile_warning_dialog 
	create_dialog_box { title = "GameSpy Profile" 
		text = "Would you like to create a GameSpy profile? When logged in with a profile, you can find friends more easily and track high scores." 
		buttons = [ { text = "Yes" pad_choose_script = launch_profile_menu } 
			{ text = " No " pad_choose_script = create_internet_options } 
		] 
	} 
ENDSCRIPT

SCRIPT hide_internet_only_menus 
	IF InInternetMode 
		IF NOT GotParam keep_chat 
			IF ObjectExists id = console_message_vmenu 
				DoScreenElementMorph id = console_message_vmenu time = 0 scale = 0 
			ENDIF 
			DoScreenElementMorph id = chat_box_anchor time = 0 scale = 0 
		ENDIF 
		DoScreenElementMorph id = player_list_anchor time = 0 scale = 0 
	ENDIF 
ENDSCRIPT

SCRIPT restore_internet_only_menus 
	IF InInternetMode 
		DoScreenElementMorph id = player_list_anchor time = 0 scale = 1 
		DoScreenElementMorph id = chat_box_anchor time = 0 scale = 1 
		IF ObjectExists id = console_message_vmenu 
			DoScreenElementMorph id = console_message_vmenu time = 0 scale = 1 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT create_internet_options 
	ClearMemcardDataForUpload 
	dialog_box_exit 
	Skater : remove_skater_from_world 
	KillSkaterCamAnim all 
	PlaySkaterCamAnim Skater = 0 name = mainmenu_camera03 play_hold 
	GetPreferenceChecksum pref_type = network profile_warning_shown 
	IF ( <checksum> = boolean_false ) 
		set_preferences_from_ui prefs = network field = "profile_warning_shown" checksum = boolean_true string = "Yes" 
		create_profile_warning_dialog 
		RETURN 
	ENDIF 
	Change in_net_lobby = 0 
	Change has_accepted_dnas = 1 
	FormatText ChecksumName = title_icon "%i_online" i = ( THEME_PREFIXES [ current_theme_prefix ] ) 
	make_new_themed_sub_menu title = "INTERNET OPTIONS" title_icon = <title_icon> skateshop_pos = PAIR(355.00000000000, 78.00000000000) 
	FormatText ChecksumName = paused_icon "%i_paused_icon" i = ( THEME_PREFIXES [ current_theme_prefix ] ) 
	build_theme_box_icons icon_texture = <paused_icon> 
	build_top_bar pos = PAIR(-400.00000000000, 62.00000000000) static 
	SetScreenElementProps { id = sub_menu event_handlers = [ 
			{ pad_back generic_menu_pad_back params = { callback = back_from_internet_options } } 
		] 
	} 
	theme_menu_add_item { 
		text = "Play Online" 
		id = menu_play_online 
		pad_choose_script = play_online_chosen 
		centered 
		focus_script = internet_options_focus 
		focus_params = { texture = io_play } 
		unfocus_script = internet_options_unfocus 
	} 
	SetScreenElementProps { 
		id = menu_play_online 
		event_handlers = [ 
			{ focus PlayHelperDesc params = { play_online_helper_desc } } 
			{ unfocus StopHelperDesc } 
		] 
	} 
	IF NOT ProfileLoggedIn 
		IF IsTrue demo_build 
			theme_menu_add_item { 
				text = "Login/Create Profile" 
				id = menu_create_profile 
				not_focusable = not_focusable 
				centered 
			} 
		ELSE 
			theme_menu_add_item { 
				text = "Login/Create Profile" 
				id = menu_create_profile 
				pad_choose_script = launch_profile_menu 
				centered 
				focus_script = internet_options_focus 
				focus_params = { texture = io_login } 
				unfocus_script = internet_options_unfocus 
			} 
			SetScreenElementProps { 
				id = menu_create_profile 
				event_handlers = [ 
					{ focus PlayHelperDesc params = { login_profile_helper_desc } } 
					{ unfocus StopHelperDesc } 
				] 
			} 
		ENDIF 
	ELSE 
		theme_menu_add_item { 
			text = "Change GameSpy Login" 
			id = menu_create_profile 
			pad_choose_script = launch_profile_menu 
			centered 
			focus_script = internet_options_focus 
			focus_params = { texture = io_login } 
			unfocus_script = internet_options_unfocus 
		} 
		SetScreenElementProps { 
			id = menu_create_profile 
			event_handlers = [ 
				{ focus PlayHelperDesc params = { login_profile_helper_desc } } 
				{ unfocus StopHelperDesc } 
			] 
		} 
	ENDIF 
	IF IsTrue demo_build 
		theme_menu_add_item { 
			text = "Upload" 
			id = menu_upload 
			not_focusable = not_focusable 
			centered 
		} 
		theme_menu_add_item { 
			text = "Download" 
			id = menu_download 
			not_focusable = not_focusable 
			centered 
			last_menu_item = last_menu_item 
		} 
	ELSE 
		theme_menu_add_item { 
			text = "Save Settings" 
			id = menu_save 
			pad_choose_script = launch_save_internet_settings 
			centered 
			focus_script = internet_options_focus 
			focus_params = { texture = io_settings } 
			unfocus_script = internet_options_unfocus 
		} 
		SetScreenElementProps { 
			id = menu_save 
			event_handlers = [ 
				{ focus PlayHelperDesc params = { save_settings_helper_desc } } 
				{ unfocus StopHelperDesc } 
			] 
		} 
		theme_menu_add_item { 
			text = "Online Stats" 
			id = menu_stats 
			pad_choose_script = download_stats 
			centered 
			focus_script = internet_options_focus 
			focus_params = { texture = io_stats } 
			unfocus_script = internet_options_unfocus 
			last_menu_item = last_menu_item 
		} 
		SetScreenElementProps { 
			id = menu_stats 
			event_handlers = [ 
				{ focus PlayHelperDesc params = { online_stats_helper_desc } } 
				{ unfocus StopHelperDesc } 
			] 
		} 
	ENDIF 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		texture = satellite 
		scale = 1 
		pos = PAIR(80.00000000000, 120.00000000000) 
		just = [ center center ] 
		rot_angle = -10 
		alpha = 0.50000000000 
		rgba = <rgba> 
		z_priority = -1 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		id = internet_options_icon 
		texture = io_play 
		scale = 1.50000000000 
		pos = PAIR(210.00000000000, 275.00000000000) 
		just = [ center center ] 
		alpha = 0.40000000596 
		rgba = <rgba> 
		z_priority = -1 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		id = satellite_beam 
		texture = satellite_beam 
		scale = 3 
		pos = PAIR(130.00000000000, 130.00000000000) 
		just = [ left top ] 
		rot_angle = 10 
		alpha = 0.10000000149 
		rgba = <rgba> 
		z_priority = -1 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		id = globe 
		texture = globe 
		scale = 1.29999995232 
		pos = PAIR(320.00000000000, 560.00000000000) 
		just = [ center center ] 
		alpha = 0.30000001192 
		z_priority = -1 
	} 
	RunScriptOnScreenElement id = globe rotate_internet_options_globe 
	PauseMusicandStreams 
	finish_themed_sub_menu 
ENDSCRIPT

SCRIPT internet_options_focus 
	SetScreenElementProps id = internet_options_icon texture = <texture> 
	main_theme_focus <...> 
	DoScreenElementMorph id = internet_options_icon relative_scale scale = 0 alpha = 0.40000000596 pos = PAIR(130.00000000000, 130.00000000000) 
	DoScreenElementMorph id = satellite_beam relative_scale scale = 0 alpha = 0.10000000149 
	DoScreenElementMorph id = internet_options_icon relative_scale scale = 1 time = 0.20000000298 pos = PAIR(210.00000000000, 275.00000000000) 
	DoScreenElementMorph id = satellite_beam relative_scale scale = 1 time = 0.20000000298 
	RunScriptOnScreenElement id = satellite_beam satellite_beam_flicker 
ENDSCRIPT

SCRIPT internet_options_unfocus 
	KillSpawnedScript name = satellite_beam_flicker 
	DoScreenElementMorph id = internet_options_icon alpha = 0 
	DoScreenElementMorph id = satellite_beam alpha = 0 
	main_theme_unfocus <...> 
ENDSCRIPT

SCRIPT satellite_beam_flicker time = 0.05000000075 
	BEGIN 
		DoScreenElementMorph id = satellite_beam alpha = 0.10000000149 time = <time> 
		DoScreenElementMorph id = internet_options_icon alpha = 0.40000000596 time = <time> 
		wait <time> seconds 
		DoScreenElementMorph id = satellite_beam alpha = 0.07999999821 time = <time> 
		DoScreenElementMorph id = internet_options_icon alpha = 0.30000001192 time = <time> 
		wait <time> seconds 
	REPEAT 
ENDSCRIPT

SCRIPT rotate_internet_options_globe time = 60.00000000000 num_rots = 10 
	BEGIN 
		DoScreenElementMorph id = globe rot_angle = ( 360 * <num_rots> ) time = ( <time> * <num_rots> ) 
		wait ( <time> * <num_rots> ) seconds 
		DoScreenElementMorph id = globe rot_angle = 0 
		wait 1 gameframe 
	REPEAT 
ENDSCRIPT

SCRIPT get_upload_description 
	printf "script get_upload_description" 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	create_onscreen_keyboard { allow_cancel 
		keyboard_cancel_script = create_internet_options 
		keyboard_done_script = upload_content 
		type = <type> 
		filename = <filename> 
		keyboard_title = "ENTER DESCRIPTION" 
		text = "" 
		max_length = 50 
		text_block 
	} 
ENDSCRIPT

SCRIPT upload_content 
	printf "Uploading content" 
	IF ObjectExists id = keyboard_anchor 
		GetTextElementString id = keyboard_current_string 
		destroy_onscreen_keyboard 
	ENDIF 
	GetSummaryInfo <type> VaultData = 1 
	IF GotParam type 
		SWITCH <type> 
			CASE OptionsAndPros 
				typename = skaters 
			CASE cat 
				typename = tricks 
				calculate_cat_score get_values return_it 
			CASE createdgoals 
				typename = goals 
			CASE park 
				typename = parks 
			DEFAULT 
				printf "Bad upload file type" 
				printstruct <...> 
				RETURN 
		ENDSWITCH 
	ELSE 
		printf "Missing upload file type" 
		printstruct <...> 
		RETURN 
	ENDIF 
	create_dialog_box { title = "Uploading file" text = "Starting transfer..." } 
	GetMemcardDataForUpload 
	UploadFile { data = { <dataforupload> } description = <string> type = <typename> filename = <filename> score = <score> is_male = <is_male> 
		num_goals = <num_edited_goals> num_gaps = <num_gaps> num_pieces = <num_pieces> theme = <theme> TOD_Script = <TOD_Script> 
		width = <width> length = <length> 
	} 
	ClearMemcardDataForUpload 
ENDSCRIPT

SCRIPT LaunchUploadCompleteDialog 
	net_vault_menu_exit 
	dialog_box_exit 
	create_dialog_box { title = "Upload Complete" 
		text = "" 
		buttons = [ { text = "ok" pad_choose_script = back_from_transfer_dialog } 
		] 
	} 
ENDSCRIPT

SCRIPT back_from_directory_listing 
	DestroyScreenElement id = current_menu_anchor 
	create_internet_options 
ENDSCRIPT

SCRIPT LaunchDirectoryListing 
	dialog_box_exit 
	make_new_menu menu_id = directory_listing_menu vmenu_id = directory_listing_vmenu menu_title = "DIRECTORY CONTENTS" type = vscrollingmenu dims = PAIR(200.00000000000, 300.00000000000) vscroll_pos = PAIR(230.00000000000, 30.00000000000) internal_scale = 0.25000000000 allow_wrap = 0 
	SetScreenElementProps { id = directory_listing_menu event_handlers = [ 
			{ pad_back generic_menu_pad_back params = { callback = back_from_directory_listing } } 
		] 
	} 
	RunScriptOnScreenElement id = current_menu_anchor menu_onscreen 
ENDSCRIPT

SCRIPT play_online_chosen 
	CleanUpTopStats 
	spawn_lobby_list 
ENDSCRIPT

SCRIPT spawn_lobby_list 
	dialog_box_exit 
	FireEvent type = unfocus target = sub_menu 
	create_dialog_box { title = net_status_msg 
		text = "Connecting to GameSpy..." 
		no_animate 
		pos = PAIR(150.00000000000, 250.00000000000) 
	} 
	LobbyConnect 
ENDSCRIPT

SCRIPT back_from_internet_menu 
	console_destroy 
	LeaveLobby 
	StopServerList 
	FreeServerList 
	LobbyDisconnect 
	create_internet_options 
ENDSCRIPT

SCRIPT back_from_network_select_menu 
	SetNetworkMode 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
		wait 1 frame 
	ENDIF 
	IF NOT GotParam no_menu 
		launch_ss_menu 
	ENDIF 
ENDSCRIPT

SCRIPT disconnect_from_internet 
	IF ScreenElementExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	DisconnectFromInternet callback = failed_internet_connection 
ENDSCRIPT

SCRIPT show_disclaimer 
	PauseMusicandStreams 
	Skater : remove_skater_from_world 
	KillSkaterCamAnim all 
	PlaySkaterCamAnim Skater = 0 name = mainmenu_camera03 play_hold 
	dialog_box_exit 
	FormatText ChecksumName = on_rgba "%i_HIGHLIGHTED_TEXT_COLOR" i = ( THEME_COLOR_PREFIXES [ current_theme_prefix ] ) 
	FormatText ChecksumName = off_rgba "%i_UNHIGHLIGHTED_TEXT_COLOR" i = ( THEME_COLOR_PREFIXES [ current_theme_prefix ] ) 
	IF ScreenElementExists id = disclaimer_anchor 
		DestroyScreenElement id = disclaimer_anchor 
	ENDIF 
	SetScreenElementLock off id = root_window 
	CreateScreenElement { 
		type = ContainerElement 
		dims = PAIR(640.00000000000, 480.00000000000) 
		pos = PAIR(320.00000000000, 240.00000000000) 
		parent = root_window 
		id = disclaimer_anchor 
	} 
	AssignAlias alias = current_menu_anchor id = disclaimer_anchor 
	build_top_and_bottom_blocks parent = disclaimer_anchor 
	make_mainmenu_3d_plane parent = disclaimer_anchor 
	CreateScreenElement { 
		type = TextElement 
		parent = disclaimer_anchor 
		font = small 
		text = "Terms of Use" 
		pos = PAIR(320.00000000000, 40.00000000000) 
		scale = 2.00000000000 
		rgba = <on_rgba> 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = disclaimer_anchor 
		id = down_arrow 
		texture = down_arrow 
		pos = PAIR(320.00000000000, 350.00000000000) 
		scale = 1.00000000000 
		rgba = <off_rgba> 
	} 
	CreateScreenElement { 
		type = hmenu 
		parent = disclaimer_anchor 
		dims = PAIR(300.00000000000, 20.00000000000) 
		id = disclaimer_hmenu 
		pos = PAIR(360.00000000000, 350.00000000000) 
		z_priority = 20 
		event_handlers = [ 
			{ pad_back back_from_disclaimer } 
		] 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = disclaimer_hmenu 
		font = dialog 
		text = "Decline" 
		dims = PAIR(150.00000000000, 20.00000000000) 
		rgba = <off_rgba> 
		event_handlers = [ 
			{ focus disclaimer_focus } 
			{ unfocus disclaimer_unfocus } 
			{ pad_choose back_from_disclaimer } 
		] 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = disclaimer_hmenu 
		font = dialog 
		text = "Accept" 
		dims = PAIR(150.00000000000, 20.00000000000) 
		rgba = [ 50 50 50 50 ] 
		event_handlers = [ 
			{ focus disclaimer_focus } 
			{ unfocus disclaimer_unfocus } 
			{ pad_choose signed_disclaimer } 
		] 
	} 
	CreateScreenElement { 
		type = vscrollingmenu 
		parent = disclaimer_anchor 
		dims = PAIR(500.00000000000, 250.00000000000) 
		just = [ left top ] 
		internal_just = [ left top ] 
		pos = PAIR(25.00000000000, 80.00000000000) 
		id = disclaimer_scrolling_vmenu 
	} 
	CreateScreenElement { 
		type = Vmenu 
		parent = disclaimer_scrolling_vmenu 
		id = disclaimer_vmenu 
		pos = PAIR(0.00000000000, 0.00000000000) 
		just = [ left top ] 
		internal_just = [ left top ] 
		z_priority = 20 
		dont_allow_wrap 
	} 
	IF isPal 
		GetArraySize online_disclaimer_pal_en 
		IF Spanish 
			GetArraySize online_disclaimer_pal_sp 
		ENDIF 
		IF French 
			GetArraySize online_disclaimer_pal_fr 
		ENDIF 
		IF German 
			GetArraySize online_disclaimer_pal_gr 
		ENDIF 
		IF Italian 
			GetArraySize online_disclaimer_pal_it 
		ENDIF 
	ELSE 
		GetArraySize online_disclaimer 
	ENDIF 
	index = 0 
	BEGIN 
		IF isPal 
			IF English 
				text = ( online_disclaimer_pal_en [ <index> ] ) 
			ENDIF 
			IF Spanish 
				text = ( online_disclaimer_pal_sp [ <index> ] ) 
			ENDIF 
			IF French 
				text = ( online_disclaimer_pal_fr [ <index> ] ) 
			ENDIF 
			IF German 
				text = ( online_disclaimer_pal_gr [ <index> ] ) 
			ENDIF 
			IF Italian 
				text = ( online_disclaimer_pal_it [ <index> ] ) 
			ENDIF 
		ELSE 
			text = ( online_disclaimer [ <index> ] ) 
		ENDIF 
		CreateScreenElement { 
			type = TextElement 
			parent = disclaimer_vmenu 
			font = dialog 
			text = <text> 
			pos = PAIR(0.00000000000, 0.00000000000) 
			just = [ center top ] 
			dims = PAIR(100.00000000000, 15.00000000000) 
			scale = 0.80000001192 
			rgba = <off_rgba> 
		} 
		index = ( <index> + 1 ) 
	REPEAT <array_size> 
	create_helper_text helper_text_elements = [ { text = "\\b6/\\b5 = Select" } 
		{ text = "\\b4 = Scroll" } 
		{ text = "\\bn = Back" } 
		{ text = "\\bm = Accept" } 
	] 
	FireEvent type = focus target = disclaimer_hmenu 
	FireEvent type = focus target = disclaimer_vmenu 
	wait 2 gameframes 
	IF ScreenElementExists id = disclaimer_vmenu 
		BEGIN 
			FireEvent type = pad_down target = disclaimer_vmenu 
		REPEAT 15 
	ENDIF 
ENDSCRIPT

SCRIPT disclaimer_focus 
	GetTags 
	FormatText ChecksumName = rgba "%i_HIGHLIGHTED_TEXT_COLOR" i = ( THEME_COLOR_PREFIXES [ current_theme_prefix ] ) 
	DoScreenElementMorph id = <id> rgba = <rgba> scale = 1.20000004768 
ENDSCRIPT

SCRIPT disclaimer_unfocus 
	GetTags 
	DoScreenElementMorph id = <id> rgba = [ 50 50 50 50 ] scale = 1 
ENDSCRIPT

SCRIPT signed_disclaimer 
	IF ScreenElementExists id = disclaimer_anchor 
		DestroyScreenElement id = disclaimer_anchor 
	ENDIF 
	set_preferences_from_ui prefs = network field = "signed_disclaimer" string = "Yes" checksum = boolean_true 
	chose_internet 
ENDSCRIPT

SCRIPT back_from_disclaimer 
	dialog_box_exit 
	IF ScreenElementExists id = disclaimer_anchor 
		DestroyScreenElement id = disclaimer_anchor 
	ENDIF 
	create_ss_menu no_animate 
ENDSCRIPT

online_disclaimer = [ 
	"THUG Terms of Use for Online Play:" 
	"I have read the Terms of Use for THUG Online Play at" 
	"www.thugonline.com" 
	"and I agree to abide by these Terms of Use." 
	" " 
	"This Software uses \'DNAS\' (Dynamic Network Authentication" 
	"System), a proprietary authentication system created" 
	"by Sony Computer Entertainment Inc. (\'SCEI\'). \'DNAS\' retrieves" 
	"information about a user\'s hardware and software for" 
	"authentication, copy protection, account blocking, system, rules," 
	"or game management and other purposes. The information collected" 
	"does not identify the user personally. A PUBLISHER CAN COMBINE THIS" 
	"INFORMATION WITH PERSONALLY IDENTIFYING INFORMATION FROM THE" 
	"PUBLISHER\'S RECORDS IF THE USER PROVIDES THE PERSONALLY" 
	"IDENTIFYING INFORMATION. BEFORE PROVIDING ANY PERSONAL" 
	"INFORMATION TO A PUBLISHER PLEASE BE SURE TO REVIEW THE" 
	"PUBLISHERS\'S PRIVACY POLICY AND TERMS AND CONDITIONS OF USE." 
	"DO NOT PROVIDE PERSONALLY IDENTIFYING INFORMATION TO A" 
	"PUBLISHER UNLESS YOU ACCEPT THE CONDITIONS OF USE AND" 
	"TERMS OF THEIR PRIVACY POLICY." 
	"SCEI, Sony Computer Entertainment America (\'SCEA\') and their" 
	"affiliates cannot guarantee the continuous operation of the" 
	"\'DNAS\' servers. SCEA shall not be liable for any delay or failure" 
	"of the \'DNAS\' servers to perform. If you receive a message during" 
	"login identifying a \'DNAS\' authentication error, please contact" 
	"SCEA Consumer Services at 1-866-466-5333. For additional" 
	"information concerning \'DNAS\', visit www.us.playstation.com/DNAS." 
	"In the event of a systems incompatibility or inoperability with" 
	"DNAS, the sole liability of SCEI, SCEA and their affiliates shall" 
	"be limited to the repair or replacement of the user\'s affected," 
	"game software, console or peripherals at the option of SCEA." 
	"SCEA, its parents, affiliates, or licensed Publishers shall not" 
	"be liable for any delays, system failures, authentication" 
	"failures, or system outages, which may, from time to time," 
	"affect online game play or access thereto." 
] 
online_disclaimer_pal_en = [ 
	"THUG Terms of Use for Online Play:" 
	"I have read the Terms of Use for THUG Online Play at" 
	"www.thugonline.com" 
	"and I agree to abide by these Terms of Use." 
	" " 
	"This Software uses \'DNAS\' (Dynamic Network Authentication" 
	"System), a proprietary authentication system created" 
	"by Sony Computer Entertainment Inc. (\'SCEI\'). \'DNAS\' retrieves" 
	"information about a user\'s hardware and software for" 
	"authentication, copy protection, account blocking, system, rules," 
	"or game management and other purposes." 
	"SCEI, Sony Computer Entertainment Europe (\'SCEE\') and their" 
	"affiliates cannot guarantee the continuous operation of the" 
	"\'DNAS\' servers. SCEE shall not be liable for any delay or failure" 
	"of the \'DNAS\' servers to perform. If you receive a message during" 
	"login identifying a \'DNAS\' authentication error, please contact" 
	"your local PlayStation Customer Care line on the number provided" 
	"in the software manual. For additional information concerning" 
	"\'DNAS\', visit Central Station using the Network Access Disc" 
	"or refer to PlayStation.com.  In the event of a systems" 
	"incompatibility or inoperability with DNAS, the sole" 
	"liability of SCEI, SCEE and their affiliates shall" 
	"be limited to the repair or replacement of the user\'s affected," 
	"game software, console or peripherals at the option of SCEE." 
	"SCEE, its parents, affiliates, or licensed Publishers shall not" 
	"be liable for any delays, system failures, authentication" 
	"failures, or system outages, which may, from time to time," 
	"affect online game play or access thereto." 
] 
online_disclaimer_pal_fr = [ 
	"THUG Conditions d\'utilisation pour jeu en ligne :" 
	"J\'ai lu les conditions d\'utilisation de THUG en ligne" 
	"www.thugonline.com" 
	"et j\'accepte de les respecter." 
	" " 
	"Ce jeu utilise le \'DNAS\' (Dynamic Network Authentication" 
	"System), un syst\xE8me d\'authentification propi\xE9taire cr\xE9\xE9" 
	"par Sony Computer Entertainment Inc. (\'SCEI\'). Le \'DNAS\'" 
	"r\xE9cup\xE8re des informations sur le mat\xE9riel et le jeu d\'un" 
	"utilisateur pour l\'authentification, la protection contre" 
	"les copies, le bloquage de comptes, le syst\xE8me, le r\xE8glement," 
	"ou la gestion du jeu et autres. SCEI, Sony Computer Entertainment" 
	"Europe (\'SCEE\') et ses filiales ne peuvent pas garantir" 
	"le fonctionnement continu du serveur \'DNAS\'. SCEE ne pourra \xEAtre" 
	"poursuivi en cas de ralentissement ou d\'erreur d\'ex\xE9cution du" 
	"serveur \'DNAS\'. Si vous recevez un message durant l\'ouverture" 
	"de session d\xE9tectant une erreur d\'authentification \'DNAS\'," 
	"contactez votre service client PlayStation le plus proche au" 
	"num\xE9ro indiqu\xE9 dans le manuel du jeu. Pour plus d\'informations" 
	"concernant le \'DNAS\', visitez la Central Station en utilisant" 
	"le disque d\'acc\xE8s au r\xE9seau ou consultez Playstation.com. Dans" 
	"le cas d\'une incompatibilit\xE9 du syst\xE8me ou d\'une inop\xE9rabilit\xE9" 
	"avec le DNAS, la seule responsabilit\xE9 de SCEI, SCEE et de ses" 
	"filiales sera limit\xE9e \xE0 la r\xE9paration ou au remplacement des " 
	"produits de l\'utilisateur affect\xE9, jeu, console ou p\xE9riph\xE9riques," 
	"au gr\xE9 de SCEE. SCEE, ses soci\xE9t\xE9s, filiales, ou ses \xE9diteurs" 
	"sous license ne pourront \xEAtre poursuivis pour tous" 
	"ralentissements, \xE9checs du syst\xE8me, \xE9checs d\'authentification," 
	"ou coupures du syst\xE8me, qui pourraient, de temps en temps," 
	"affecter le jeu en ligne ainsi que son acc\xE8s." 
] 
online_disclaimer_pal_sp = [ 
	"Condiciones de uso para jugar THUG online:" 
	"He leido las condiciones de uso para jugar THUG online en" 
	"www.thugonline.com" 
	"y estoy de acuerdo en respetarlas." 
	" " 
	"Este software utiliza \'DNAS\' (Dynamic Network Authentication" 
	"System), un sistema de verificaci\xF3n patentado y creado por" 
	"Sony Computer Entertainment Inc. (\'SCEI\'). \'DNAS\' recupera" 
	"informaci\xF3n sobre el hardware y el software de un usuario para" 
	"la verificaci\xF3n, protecci\xF3n contra el pirateo, bloqueo de cuenta," 
	"sistema, normas o direcci\xF3n de juego y otros prop\xF3sitos. SCEI, " 
	"Sony Computer Entertainment Europe (\'SCEE\') y sus filiales no" 
	"garantizan el funcionamiento continuo de los servidores \'DNAS\'." 
	"SCEE no es responsable de cualquier retraso o fallo en el " 
	"funcionamiento de los servidores \'DNAS\'. Si recibes un mensaje" 
	"durante el inicio identificando un error de verificaci\xF3n en el" 
	"\'DNAS\', contacta con tu l\xEDnea de atenci\xF3n al cliente PlayStation" 
	"local en el n\xFAmero que aparece en el manual del software. Para" 
	"obtener m\xE1s informaci\xF3n relativa al \'DNAS\' visita Central Station" 
	"usando el Disco de Acceso a Red o en PlayStation.com. Si se" 
	"produjera una incompatibilidad de sistemas o inoperatividad con el" 
	"DNAS la responsabilidad de SCEI, SCEE y sus afiliados se limitar\xE1" 
	"a la reparaci\xF3n o sustituci\xF3n de los perif\xE9ricos, consola o software" 
	"del juego del usuario afectado seg\xFAn SCEE considere oportuno. SCEE," 
	"sus empresas matrices, afiliadas o editores con licencia no ser\xE1n" 
	"responsables de retrasos, fallos en el sistema, fallos de" 
	"verificaci\xF3n o cortes en el sistema que podr\xEDan afectar de vez en" 
	"cuando al juego online o acceso al mismo." 
] 
online_disclaimer_pal_gr = [ 
	"Nutzungsbedingungen f\xFCr das THUG-Onlinespiel:" 
	"Ich habe die Nutzungsbedingungen f\xFCr das THUG-Onlinespiel auf" 
	"www.thugonline.com" 
	"gelesen und erkl\xE4re mich damit einverstanden." 
	" " 
	"Diese Software benutzt \'DNAS\' (Dynamic Network Authentication" 
	"System), ein patentrechtlich gesch\xFCtztes Authentifikationssystem" 
	"von Sony Computer Entertainment Inc. (\'SCEI\'). \'DNAS\' sammelt" 
	"Informationen \xFCber die Hardware und Software des Benutzers zur" 
	"Authentifikation, Kopierschutz, Kontosperrung, System, Regeln, " 
	"Spielverwaltung und anderen Zwecken. SCEI, Sony Computer" 
	"Entertainment Europe (\'SCEE\') und ihre Tochtergesellschaften" 
	"k\xF6nnen den ununterbrochen Betrieb der \'DNAS\'-Server nicht" 
	"garantieren. SCEE kann nicht f\xFCr die Verz\xF6gerung oder Ausfall" 
	"der \'DNAS\'-Server haftbar gemacht werden. Sollten Sie w\xE4hrend" 
	"des Log-ins auf einen \'DNAS\'-Authentifikationsfehler sto\xDFen," 
	"setzen Sie sich bitte mit Ihrem PlayStation-Kundenservice unter" 
	"der in Ihrem Handbuch aufgef\xFChrten Nummer in Verbindung. Zu " 
	"zus\xE4tzlichen Informationen zum Thema \'DNAS\', besuchen Sie bitte" 
	"PlayStation.com oder mit Hilfe der NAD - Network Access Disc" 
	"(CD f\xFCr den Netzwerkzugang) die Central Station. Im Falle einer" 
	"System-Inkompatibilit\xE4t mit \'DNAS\', ist die Haftung der SCEI," 
	"SCEE und ihrer Tochtergesellschaften begrenzt auf die Reparatur" 
	"oder den Austausch der betroffenen Spiel-Software, Konsole oder" 
	"Peripherie nach dem freien Ermessen von SCEE. SCEE, ihre " 
	"Mutter- und Tochtergesellschaften und lizenzierte Verlage k\xF6nnen" 
	"nicht f\xFCr etwaige Verz\xF6gerungen, Systemausf\xE4lle und" 
	"Authentifizierungsfehler, welche von Zeit zu Zeit das Online-Spiel" 
	"und den Online-Zugang beeinflussen, haftbar gemacht werden." 
] 
online_disclaimer_pal_it = [ 
	"Termini di utilizzo online di THUG:" 
	"Ho letto i termini di utilizzo THUG Online all\'indirizzo" 
	"www.thugonline.com" 
	"e ne accetto i contenuti." 
	" " 
	"Questo software utilizza il \'DNAS\' (Dynamic Network Authentication" 
	"System), un sistema di autenticazione proprietario creato da Sony" 
	"Computer Entertainment Inc. (\'SCEI\').  Il \'DNAS\' recupera " 
	"informazioni sull\'hardware e sul software dell\'utente per " 
	"l\'autenticazione, la protezione dalla copia, il blocco dell\'account," 
	"la gestione del sistema, delle regole, del gioco e per altri" 
	"compiti. SCEI, Sony Computer Entertainment Europe (\'SCEE\') e i" 
	"loro affiliati non garantiscono la continua operativit\xE0 dei server" 
	"\'DNAS\'. SCEE non \xE8 responsabile per eventuali ritardi nella " 
	"risposta o malfunzionamenti dei server \'DNAS\'. Se, durante il login," 
	"ricevi un messaggio di errore per l\'autenticazione \'DNAS\', contatta" 
	"il Servizo Assistenza Clienti PlayStation locale usando il numero che" 
	"trovi nel manuale del software.  Per ulteriori informazioni riguardo" 
	"al \'DNAS\', visita Central Station utilizzando il disco di accesso alla" 
	"rete o collegati a PlayStation.com. Nell\'evenienza di un\'incompatibilit\xE0" 
	"di sistema o inoperabilit\xE0 con il \'DNAS\', l\'unica responsabilit\xE0 di " 
	"SCEI, SCEE e dei loro affiliati sar\xE0 limitata alla riparazione o alla" 
	"sostituzione del software di gioco, della console o delle periferiche" 
	"difettose, secondo la discrezione di SCEE." 
	"SCEE, la societ\xE0 madre, gli affiliati e i Produttori su licenza non" 
	"sono responsabili per eventuali ritardi o malfunzionamenti del " 
	"sistema, dell\'autenticazione o per blocchi del sistema che potrebbero " 
	"avere ripercussioni sul gioco online o sull\'accesso alla rete." 
] 
SCRIPT create_network_select_menu 
	printf "script create_network_select_menu" 
	make_new_menu menu_id = network_select_menu pos = PAIR(226.00000000000, 109.00000000000) vmenu_id = network_select_vmenu menu_title = "NETWORK" helper_text = generic_helper_text 
	kill_start_key_binding 
	KillSkaterCamAnim all 
	PlaySkaterCamAnim name = SS_MenuCam play_hold 
	SetScreenElementProps { id = network_select_vmenu event_handlers = [ 
			{ pad_back generic_menu_pad_back params = { callback = back_from_network_select_menu } } 
		] 
	} 
	main_menu_add_item { 
		text = "Internet" 
		id = menu_network_select_internet 
		pad_choose_script = network_select_menu_exit 
		pad_choose_params = { callback = show_disclaimer } 
	} 
	GetPreferenceChecksum pref_type = network device_type 
	SWITCH <checksum> 
		CASE device_sony_modem 
		CASE device_usb_modem 
			do_nothing 
		DEFAULT 
			main_menu_add_item { 
				text = "LAN" 
				id = menu_network_select_lan 
				pad_choose_script = network_select_menu_exit 
				pad_choose_params = { callback = launch_network_select_lan_games_menu } 
			} 
	ENDSWITCH 
	IF IsOnline 
		GetPreferenceChecksum pref_type = network device_type 
		SWITCH <checksum> 
			CASE device_sony_modem 
			CASE device_usb_modem 
				main_menu_add_item text = "Hang Up Modem" id = menu_network_select_hang_up pad_choose_script = disconnect_from_internet 
		ENDSWITCH 
	ENDIF 
	RunScriptOnScreenElement id = current_menu_anchor menu_onscreen 
	RunScriptOnScreenElement id = current_menu_anchor animate_in 
ENDSCRIPT

SCRIPT network_select_menu_exit 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
		wait 1 frame 
	ENDIF 
	<callback> 
ENDSCRIPT

SCRIPT make_server_list_menu 
	create_console 
	console_unhide 
	Skater : remove_skater_from_world 
	KillSkaterCamAnim all 
	PlaySkaterCamAnim Skater = 0 name = mainmenu_camera03 play_hold 
	SetScreenElementLock id = root_window off 
	Change in_net_lobby = 1 
	CreateScreenElement { 
		type = ContainerElement 
		parent = root_window 
		id = server_list_anchor 
		pos = PAIR(320.00000000000, 240.00000000000) 
		dims = PAIR(640.00000000000, 480.00000000000) 
		just = [ center center ] 
		scale = 0 
		focusable_child = actions_menu 
	} 
	FormatText ChecksumName = title_icon "%i_online" i = ( THEME_PREFIXES [ current_theme_prefix ] ) 
	build_theme_sub_title title = "ACTIONS" title_icon = <title_icon> parent = server_list_anchor 
	build_top_and_bottom_blocks parent = server_list_anchor 
	make_mainmenu_3d_plane parent = server_list_anchor 
	CreateScreenElement { 
		type = SpriteElement 
		parent = server_list_anchor 
		id = globe 
		texture = globe 
		scale = 1 
		pos = PAIR(550.00000000000, 240.00000000000) 
		just = [ center center ] 
		alpha = 0.20000000298 
		z_priority = -1 
	} 
	CreateScreenElement { 
		type = ContainerElement 
		parent = server_list_anchor 
		id = actions_menu_anchor 
		pos = PAIR(320.00000000000, 240.00000000000) 
		dims = PAIR(640.00000000000, 480.00000000000) 
		just = [ center center ] 
		internal_just = [ left top ] 
	} 
	theme_background width = 1 pos = PAIR(320.00000000000, 60.00000000000) num_parts = 5 parent = actions_menu_anchor 
	CreateScreenElement { 
		type = Vmenu 
		parent = actions_menu_anchor 
		id = actions_menu 
		font = small 
		just = [ left top ] 
		pos = PAIR(320.00000000000, 85.00000000000) 
		dims = PAIR(222.00000000000, 170.00000000000) 
		just = [ center top ] 
		internal_just = [ center top ] 
		event_handlers = [ { pad_up generic_menu_up_or_down_sound params = { up } } 
			{ pad_down generic_menu_up_or_down_sound params = { down } } 
			{ pad_back generic_menu_pad_back_sound } 
		] 
	} 
	CreateScreenElement { 
		type = ContainerElement 
		parent = server_list_anchor 
		id = game_list_menu_anchor 
		dims = PAIR(300.00000000000, 300.00000000000) 
		pos = PAIR(450.00000000000, 60.00000000000) 
		just = [ left top ] 
	} 
	theme_background width = 1.29999995232 pos = PAIR(70.00000000000, 0.00000000000) num_parts = 5 parent = game_list_menu_anchor id = bg_box_vmenu2 bg_rgba = [ 80 80 100 100 ] 
	CreateScreenElement { 
		type = SpriteElement 
		parent = game_list_menu_anchor 
		texture = white2 
		just = [ left top ] 
		pos = PAIR(-30.00000000000, 4.00000000000) 
		rgba = [ 0 0 0 80 ] 
		scale = PAIR(25.00000000000, 3.00000000000) 
	} 
	CreateScreenElement { 
		type = vscrollingmenu 
		parent = game_list_menu_anchor 
		id = server_list_scrolling_menu 
		just = [ left top ] 
		pos = PAIR(-15.00000000000, 40.00000000000) 
		dims = PAIR(440.00000000000, 130.00000000000) 
	} 
	CreateScreenElement { 
		type = Vmenu 
		parent = server_list_scrolling_menu 
		id = server_list_menu 
		scale = 0.89999997616 
		pos = PAIR(0.00000000000, 0.00000000000) 
		dims = PAIR(440.00000000000, 300.00000000000) 
		just = [ left top ] 
		internal_just = [ left top ] 
		event_handlers = [ 
			{ pad_up server_blink_up_arrow } 
			{ pad_down server_blink_down_arrow } 
			{ pad_up generic_menu_up_or_down_sound params = { up } } 
			{ pad_down generic_menu_up_or_down_sound params = { down } } 
			{ pad_back generic_menu_pad_back_sound } 
		] 
		dont_allow_wrap 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = game_list_menu_anchor 
		font = testtitle 
		text = "GAMES" 
		scale = 1.29999995232 
		pos = PAIR(-10.00000000000, 5.00000000000) 
		just = [ left top ] 
		not_focusable 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = game_list_menu_anchor 
		id = lobby_game_list_title 
		font = dialog 
		text = ": 0" 
		scale = 1.00000000000 
		pos = PAIR(110.00000000000, 5.00000000000) 
		just = [ left top ] 
		not_focusable 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = game_list_menu_anchor 
		id = game_list_up_arrow 
		texture = up_arrow 
		just = [ left top ] 
		pos = PAIR(140.00000000000, 10.00000000000) 
		not_focusable 
		scale = 0 
		z_priority = 4 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = game_list_menu_anchor 
		id = game_list_down_arrow 
		texture = down_arrow 
		just = [ left top ] 
		pos = PAIR(140.00000000000, 155.00000000000) 
		not_focusable 
		scale = 0 
	} 
	CreateScreenElement { 
		type = ContainerElement 
		parent = server_list_anchor 
		id = server_desc_menu_anchor 
		scale = 0 
		pos = PAIR(320.00000000000, 240.00000000000) 
		dims = PAIR(640.00000000000, 480.00000000000) 
		just = [ center center ] 
		internal_just = [ left top ] 
	} 
	theme_background width = 1 pos = PAIR(320.00000000000, 60.00000000000) num_parts = 5 parent = server_desc_menu_anchor id = bg_box_vmenu4 
	theme_background width = 1 pos = PAIR(130.00000000000, 60.00000000000) num_parts = 5 parent = server_desc_menu_anchor id = bg_box_vmenu5 
	CreateScreenElement { 
		type = SpriteElement 
		parent = server_desc_menu_anchor 
		texture = white2 
		just = [ left top ] 
		pos = PAIR(40.00000000000, 65.00000000000) 
		rgba = [ 0 0 0 80 ] 
		scale = PAIR(23.00000000000, 3.00000000000) 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = server_desc_menu_anchor 
		font = testtitle 
		text = "PLAYERS" 
		scale = 1.20000004768 
		pos = PAIR(45.00000000000, 68.00000000000) 
		just = [ left top ] 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = server_desc_menu_anchor 
		id = server_desc_player_number 
		font = dialog 
		text = ": 0/0" 
		scale = 1.00000000000 
		pos = PAIR(170.00000000000, 65.00000000000) 
		just = [ left top ] 
	} 
	CreateScreenElement { 
		type = Vmenu 
		parent = server_desc_menu_anchor 
		id = server_desc_menu 
		pos = PAIR(320.00000000000, 70.00000000000) 
		dims = PAIR(200.00000000000, 170.00000000000) 
		scale = 0.89999997616 
		just = [ left top ] 
		internal_just = [ left top ] 
		not_focusable 
	} 
	CreateScreenElement { 
		type = Vmenu 
		parent = server_desc_menu_anchor 
		id = server_player_menu 
		pos = PAIR(50.00000000000, 110.00000000000) 
		dims = PAIR(200.00000000000, 100.00000000000) 
		scale = 0.80000001192 
		just = [ left top ] 
		internal_just = [ left top ] 
		not_focusable 
	} 
	IF InInternetMode 
		CreateScreenElement { 
			type = SpriteElement 
			parent = game_list_menu_anchor 
			pos = PAIR(100.00000000000, -10.00000000000) 
			texture = gslogo scale = 1.10000002384 
			alpha = 0.30000001192 
		} 
		CreateScreenElement { 
			type = ContainerElement 
			parent = server_list_anchor 
			id = player_list_anchor 
			dims = PAIR(300.00000000000, 300.00000000000) 
			pos = PAIR(50.00000000000, 60.00000000000) 
			just = [ left top ] 
			internal_just = [ left top ] 
		} 
		theme_background width = 1 pos = PAIR(80.00000000000, 0.00000000000) num_parts = 5 parent = player_list_anchor id = bg_box_vmenu3 bg_rgba = [ 80 80 100 100 ] 
		CreateScreenElement { 
			type = SpriteElement 
			parent = player_list_anchor 
			texture = white2 
			just = [ left top ] 
			pos = PAIR(-12.00000000000, 4.00000000000) 
			rgba = [ 0 0 0 80 ] 
			scale = PAIR(23.00000000000, 3.00000000000) 
		} 
		CreateScreenElement { 
			type = vscrollingmenu 
			parent = player_list_anchor 
			id = player_list_scrolling_menu 
			pos = PAIR(0.00000000000, 50.00000000000) 
			dims = PAIR(200.00000000000, 110.00000000000) 
			just = [ left top ] 
		} 
		CreateScreenElement { 
			type = Vmenu 
			parent = player_list_scrolling_menu 
			id = lobby_player_list_menu 
			pos = PAIR(0.00000000000, 0.00000000000) 
			dims = PAIR(200.00000000000, 0.00000000000) 
			just = [ left top ] 
			internal_just = [ left top ] 
			scale = 0.80000001192 
			event_handlers = [ 
				{ pad_up user_blink_up_arrow } 
				{ pad_down user_blink_down_arrow } 
				{ pad_up generic_menu_up_or_down_sound params = { up } } 
				{ pad_down generic_menu_up_or_down_sound params = { down } } 
				{ pad_back generic_menu_pad_back_sound } 
			] 
			dont_allow_wrap 
		} 
		CreateScreenElement { 
			type = TextElement 
			parent = player_list_anchor 
			font = testtitle 
			text = "USERS" 
			scale = 1.29999995232 
			pos = PAIR(20.00000000000, 5.00000000000) 
			just = [ left top ] 
			not_focusable 
		} 
		CreateScreenElement { 
			type = TextElement 
			parent = player_list_anchor 
			id = lobby_player_list_title 
			font = dialog 
			text = ": 0" 
			scale = 1.00000000000 
			pos = PAIR(120.00000000000, 5.00000000000) 
			just = [ left top ] 
			not_focusable 
		} 
		CreateScreenElement { 
			type = SpriteElement 
			parent = player_list_anchor 
			id = user_list_up_arrow 
			texture = up_arrow 
			just = [ left top ] 
			pos = PAIR(-5.00000000000, 10.00000000000) 
			not_focusable 
			scale = 0 
			z_priority = 4 
		} 
		CreateScreenElement { 
			type = SpriteElement 
			parent = player_list_anchor 
			id = user_list_down_arrow 
			texture = down_arrow 
			just = [ left top ] 
			pos = PAIR(-5.00000000000, 155.00000000000) 
			not_focusable 
			scale = 0 
		} 
		GetStackedScreenElementPos X id = <id> offset = PAIR(-114.00000000000, 100.00000000000) 
		CreateScreenElement { 
			type = ContainerElement 
			parent = server_list_anchor 
			id = buddy_list_anchor 
			dims = PAIR(640.00000000000, 480.00000000000) 
			pos = <pos> 
			scale = 0 
		} 
		CreateScreenElement { 
			type = ContainerElement 
			parent = server_list_anchor 
			id = chat_box_anchor 
			dims = PAIR(640.00000000000, 480.00000000000) 
			pos = PAIR(320.00000000000, 240.00000000000) 
			just = [ center center ] 
		} 
		CreateScreenElement { 
			type = SpriteElement 
			parent = chat_box_anchor 
			texture = chat_bracket 
			just = [ left top ] 
			pos = PAIR(30.00000000000, 210.00000000000) 
			scale = PAIR(1.39999997616, 2.40000009537) 
		} 
	ENDIF 
	RunScriptOnScreenElement id = globe rotate_internet_options_globe 
	IF InInternetMode 
		DoScreenElementMorph id = player_list_anchor time = 0 scale = 1 
		FillPlayerList 
		FireEvent type = unfocus target = lobby_player_list_menu 
		DoScreenElementMorph id = chat_box_anchor time = 0 scale = 1 
		DoScreenElementMorph id = buddy_list_anchor time = 0 scale = 0 
	ENDIF 
	AssignAlias id = server_list_anchor alias = current_menu_anchor 
	AssignAlias id = actions_menu alias = current_menu 
ENDSCRIPT

SCRIPT server_list_menu_add_item 
	printf "script server_list_menu_add_item" 
	IF ObjectExists id = server_list_menu 
		highlight_bar_scale = PAIR(1.79999995232, 0.60000002384) 
		highlight_bar_pos = PAIR(96.00000000000, -6.00000000000) 
		focus_script = server_list_focus 
		<server_id> = <id> 
		SetScreenElementLock id = server_list_menu off 
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
		CreateScreenElement { 
			type = ContainerElement 
			parent = server_list_menu 
			id = <server_id> 
			dims = PAIR(200.00000000000, 20.00000000000) 
			event_handlers = [ { focus server_list_focus params = { id = <server_id> } } 
				{ unfocus server_list_unfocus } 
				{ pad_choose choose_selected_server params = { id = <server_id> } } 
			] 
			replace_handlers 
		} 
		<anchor_id> = <id> 
		FormatText ChecksumName = text_rgba "%i_UNHIGHLIGHTED_TEXT_COLOR" i = ( THEME_COLOR_PREFIXES [ current_theme_prefix ] ) 
		FormatText ChecksumName = icon_rgba "%i_ICON_ON_VALUE" i = ( THEME_COLOR_PREFIXES [ current_theme_prefix ] ) 
		CreateScreenElement { 
			type = TextElement 
			parent = <anchor_id> 
			font = small 
			text = <text> 
			scale = 1.00000000000 
			pos = PAIR(10.00000000000, -8.00000000000) 
			just = [ left center ] 
			rgba = <text_rgba> 
		} 
		<text_id> = <id> 
		truncate_string id = <text_id> max_width = 200 
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
			DEFAULT 
				FormatText ChecksumName = gametype_icon "2p_free" 
		ENDSWITCH 
		CreateScreenElement { 
			type = SpriteElement 
			parent = <text_id> 
			rgba = <icon_rgba> 
			texture = <gametype_icon> 
			scale = 0.69999998808 
			pos = PAIR(-14.00000000000, 10.00000000000) 
			just = [ center center ] 
		} 
		FormatText ChecksumName = bar_rgba "%i_HIGHLIGHT_BAR_COLOR" i = ( THEME_COLOR_PREFIXES [ current_theme_prefix ] ) 
		CreateScreenElement { 
			type = SpriteElement 
			parent = <anchor_id> 
			texture = de_highlight_bar 
			pos = <highlight_bar_pos> 
			scale = <highlight_bar_scale> 
			just = [ center center ] 
			rgba = <bar_rgba> 
			alpha = 0 
			z_priority = 3 
		} 
		SetScreenElementLock id = server_list_menu on 
		update_lobby_server_list 
	ENDIF 
ENDSCRIPT

SCRIPT player_list_add_item rank = 1 
	IF ObjectExists id = <id> 
		RETURN 
	ENDIF 
	IF ObjectExists id = lobby_player_list_menu 
		SetScreenElementLock id = lobby_player_list_menu off 
		main_menu_add_item { 
			parent = lobby_player_list_menu 
			highlight_bar_scale = PAIR(1.79999995232, 0.60000002384) 
			highlight_bar_pos = PAIR(97.00000000000, -6.00000000000) 
			text_just = [ left center ] 
			text_pos = PAIR(35.00000000000, -5.00000000000) 
			pad_choose_script = <pad_choose_script> 
			pad_choose_params = <pad_choose_params> 
			text = <text> 
			id = <id> 
		} 
		FormatText ChecksumName = rank_texture "rank_%i" i = <rank> 
		CreateScreenElement { 
			type = SpriteElement 
			parent = <id> 
			texture = <rank_texture> 
			scale = 0.69999998808 
			alpha = 0.80000001192 
			pos = PAIR(10.00000000000, -3.00000000000) 
		} 
		SetScreenElementLock id = lobby_player_list_menu on 
		update_lobby_player_list 
	ENDIF 
ENDSCRIPT

SCRIPT player_list_update_rank 
	IF ScreenElementExists id = <id> 
		IF GotParam rank 
			FormatText ChecksumName = rank_icon "rank_%i" i = <rank> 
			SetScreenElementProps id = { <id> child = 2 } texture = <rank_icon> 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT net_game_info_add_item parent = server_desc_menu dims = PAIR(300.00000000000, 16.00000000000) 
	IF ObjectExists id = <parent> 
		FormatText ChecksumName = rgba "%i_UNHIGHLIGHTED_TEXT_COLOR" i = ( THEME_COLOR_PREFIXES [ current_theme_prefix ] ) 
		SetScreenElementLock id = <parent> off 
		IF GotParam value 
			dims = PAIR(300.00000000000, 32.00000000000) 
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
			font = small 
			just = [ center top ] 
			pos = PAIR(0.00000000000, 0.00000000000) 
			rgba = <rgba> 
		} 
		IF GotParam value 
			CreateScreenElement { 
				type = SpriteElement 
				parent = <anchor_id> 
				texture = white2 
				just = [ center top ] 
				pos = PAIR(0.00000000000, 18.00000000000) 
				scale = PAIR(26.00000000000, 2.25000000000) 
				rgba = [ 0 0 0 80 ] 
			} 
			CreateScreenElement { 
				type = TextElement 
				parent = <anchor_id> 
				text = <value> 
				font = dialog 
				just = [ center top ] 
				pos = PAIR(0.00000000000, 15.00000000000) 
			} 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT net_game_info_add_player rank = 1 
	IF ObjectExists id = server_player_menu 
		FormatText ChecksumName = id "%a%b" a = <name> b = <value> 
		SetScreenElementLock id = server_player_menu off 
		main_menu_add_item { 
			parent = server_player_menu 
			text = <value> 
			highlight_bar_scale = PAIR(1.79999995232, 0.60000002384) 
			highlight_bar_pos = PAIR(97.00000000000, -6.00000000000) 
			<...> 
		} 
		FormatText ChecksumName = rank_texture "rank_%i" i = <rank> 
		CreateScreenElement { 
			type = SpriteElement 
			parent = <id> 
			texture = <rank_texture> 
			scale = 0.69999998808 
			alpha = 0.80000001192 
			pos = PAIR(10.00000000000, -3.00000000000) 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT net_game_info_update_player_title 
	SetScreenElementProps id = server_desc_player_number text = <text> 
ENDSCRIPT

SCRIPT update_lobby_player_list 
	IF ScreenElementExists id = lobby_player_list_menu 
		IF NOT ( current_lobby_focus = 2 ) 
			IF ScreenElementExists id = lobby_player_list_title 
				NumPlayersInLobby 
				FormatText textname = title_text ": %n" n = <num_players> 
				SetScreenElementProps id = lobby_player_list_title text = <title_text> 
			ENDIF 
			SetScreenElementProps id = player_list_scrolling_menu reset_window_top 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT update_lobby_server_list 
	printf "script update_lobby_server_list" 
	IF ScreenElementExists id = server_list_menu 
		IF NOT ( current_lobby_focus = 1 ) 
			IF ScreenElementExists id = lobby_game_list_title 
				NumServersInLobby 
				FormatText textname = title_text ": %n" n = <num_servers> 
				SetScreenElementProps id = lobby_game_list_title text = <title_text> 
			ENDIF 
			SetScreenElementProps id = server_list_scrolling_menu reset_window 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT return_current_lobby_focus 
	SWITCH current_lobby_focus 
		CASE 0 
			FireEvent type = focus target = actions_menu 
		CASE 1 
			FireEvent type = focus target = server_list_menu 
		CASE 2 
			FireEvent type = focus target = lobby_player_list_menu 
		DEFAULT 
			printf "return_current_lobby_focus This should never happen!" 
	ENDSWITCH 
ENDSCRIPT

SCRIPT server_list_focus 
	generic_menu_update_arrows menu_id = server_list_menu up_arrow_id = game_list_up_arrow down_arrow_id = game_list_down_arrow 
	printstruct <...> 
	main_menu_focus 
	IF RetrieveServerInfo <...> 
		describe_selected_server <...> 
	ENDIF 
ENDSCRIPT

SCRIPT server_list_unfocus 
	main_menu_unfocus 
ENDSCRIPT

SCRIPT player_list_focus 
	generic_menu_update_arrows menu_id = lobby_player_list_menu up_arrow_id = user_list_up_arrow down_arrow_id = user_list_down_arrow 
	main_menu_focus 
ENDSCRIPT

SCRIPT user_blink_up_arrow 
	RunScriptOnScreenElement id = user_list_up_arrow menu_blink_arrow 
ENDSCRIPT

SCRIPT user_blink_down_arrow 
	RunScriptOnScreenElement id = user_list_down_arrow menu_blink_arrow 
ENDSCRIPT

SCRIPT server_blink_up_arrow 
	RunScriptOnScreenElement id = game_list_up_arrow menu_blink_arrow 
ENDSCRIPT

SCRIPT server_blink_down_arrow 
	RunScriptOnScreenElement id = game_list_down_arrow menu_blink_arrow 
ENDSCRIPT

SCRIPT back_from_game_list 
	actions_menu_anchor : DoMorph scale = 1 
	server_desc_menu_anchor : DoMorph scale = 0 
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
SCRIPT create_network_select_games_menu 
	IF IsInternetGameHost 
		IF ( already_tried = 1 ) 
			QuitGame 
			RETURN 
		ENDIF 
	ENDIF 
	IF IsJoiningInternetGame 
		IF ( already_tried = 1 ) 
			IF NOT TryJoinServerIPSuccess 
				QuitGame 
				RETURN 
			ENDIF 
		ENDIF 
	ENDIF 
	Change already_tried = 1 
	KillSkaterCamAnim all 
	Skater : reset_model_lights 
	Skater : remove_skater_from_world 
	KillSkaterCamAnim all 
	PlaySkaterCamAnim Skater = 0 name = mainmenu_camera03 play_hold 
	IF GotParam play_cam 
		PlaySkaterCamAnim name = SS_MenuCam play_hold 
	ENDIF 
	dialog_box_exit 
	make_server_list_menu 
	create_helper_text generic_helper_text pos = PAIR(0.00000000000, 0.00000000000) 
	IF NOT OnXbox 
		SetNetworkMode LAN_MODE 
	ENDIF 
	IF IsInternetGameHost 
		host_net_chosen 
	ELSE 
		IF InInternetMode 
			SetScreenElementProps { id = actions_menu event_handlers = [ 
					{ pad_back generic_menu_pad_back params = { callback = back_from_internet_menu } } 
				] 
			} 
			SetScreenElementProps { id = lobby_player_list_menu event_handlers = [ 
					{ pad_back generic_menu_pad_back params = { callback = back_from_user_list } } 
				] 
			} 
		ELSE 
			IF NOT OnXbox 
				SetScreenElementProps { id = actions_menu event_handlers = [ 
						{ pad_back generic_menu_pad_back params = { callback = back_from_multiplayer_menu } } 
					] 
				} 
			ELSE 
				SetScreenElementProps { id = actions_menu event_handlers = [ 
						{ pad_back generic_menu_pad_back params = { callback = back_from_network_menu } } 
					] 
				} 
			ENDIF 
		ENDIF 
		SetScreenElementProps { id = server_list_menu event_handlers = [ 
				{ pad_back generic_menu_pad_back params = { callback = back_from_game_list } } 
			] 
		} 
		highlight_bar_scale = PAIR(1.50000000000, 0.60000002384) 
		IF InInternetMode 
			IF CanHostGame 
				main_menu_add_item text = "Host Game" parent = actions_menu id = menu_network_select_host pad_choose_script = host_chosen highlight_bar_scale = <highlight_bar_scale> focus_script = check_keyboard_focus unfocus_script = check_keyboard_unfocus 
			ELSE 
				main_menu_add_item text = "Host Game" parent = actions_menu id = menu_network_select_host pad_choose_script = host_chosen highlight_bar_scale = <highlight_bar_scale> not_focusable 
			ENDIF 
		ELSE 
			main_menu_add_item text = "Host Game" parent = actions_menu id = menu_network_select_host pad_choose_script = host_chosen highlight_bar_scale = <highlight_bar_scale> 
		ENDIF 
		IF InInternetMode 
			main_menu_add_item text = "Join Game" parent = actions_menu id = menu_network_select_join pad_choose_script = join_chosen highlight_bar_scale = <highlight_bar_scale> focus_script = check_keyboard_focus unfocus_script = check_keyboard_unfocus 
			main_menu_add_item text = "Observe Game" parent = actions_menu id = menu_network_select_observe pad_choose_script = observe_chosen highlight_bar_scale = <highlight_bar_scale> focus_script = check_keyboard_focus unfocus_script = check_keyboard_unfocus 
			main_menu_add_item text = "Refresh" parent = actions_menu id = menu_network_select_refresh pad_choose_script = refresh_chosen highlight_bar_scale = <highlight_bar_scale> focus_script = check_keyboard_focus unfocus_script = check_keyboard_unfocus 
		ELSE 
			main_menu_add_item text = "Join Game" parent = actions_menu id = menu_network_select_join pad_choose_script = join_chosen highlight_bar_scale = <highlight_bar_scale> 
			main_menu_add_item text = "Join IP" parent = actions_menu id = menu_network_select_join_ip pad_choose_script = create_network_menu_exit pad_choose_params = { new_menu_script = create_onscreen_keyboard text = "" allowed_characters = [ "1" "2" "3" "4" "5" "6" "7" "8" "9" "0" "." ] keyboard_title = "ENTER IP" min_length = 1 max_length = 15 keyboard_done_script = check_ip_from_keyboard keyboard_cancel_script = check_ip_from_keyboard keyboard_cancel_params = { cancel } allow_cancel } 
			main_menu_add_item text = "Refresh" parent = actions_menu id = menu_network_select_refresh pad_choose_script = refresh_chosen highlight_bar_scale = <highlight_bar_scale> 
		ENDIF 
		IF InInternetMode 
			main_menu_add_item text = "User List" parent = actions_menu id = menu_network_select_user_list pad_choose_script = user_list_chosen highlight_bar_scale = <highlight_bar_scale> focus_script = check_keyboard_focus unfocus_script = check_keyboard_unfocus 
			IF ProfileLoggedIn 
				pad_choose = launch_homie_list 
			ELSE 
				pad_choose = no_profile_homie_list_prompt 
			ENDIF 
			main_menu_add_item text = "Homie List" parent = actions_menu id = menu_network_select_buddy_list pad_choose_script = <pad_choose> pad_choose_params = { from_lobby } highlight_bar_scale = <highlight_bar_scale> focus_script = check_keyboard_focus unfocus_script = check_keyboard_unfocus 
			main_menu_add_item text = "Enter Message" parent = actions_menu id = menu_network_select_chat pad_choose_script = create_lobby_onscreen_kb highlight_bar_scale = <highlight_bar_scale> focus_script = check_keyboard_focus unfocus_script = check_keyboard_unfocus 
		ENDIF 
		add_no_servers_found_message refocus 
		RunScriptOnScreenElement id = current_menu_anchor menu_onscreen 
		SetScreenElementLock id = current_menu_anchor off 
		create_helper_text generic_helper_text 
		SetScreenElementLock id = current_menu_anchor on 
		FireEvent type = unfocus target = server_list_menu 
		FireEvent type = unfocus target = server_desc_menu 
		IF InInternetMode 
			FireEvent type = unfocus target = lobby_player_list_menu 
		ENDIF 
		FireEvent type = focus target = actions_menu 
		Change current_lobby_focus = 0 
		AssignAlias id = actions_menu alias = current_menu 
		Change check_for_unplugged_controllers = 1 
		IF GotParam focus_on_enter_message 
			RunScriptOnScreenElement id = current_menu_anchor set_enter_message_focus 
		ENDIF 
		PauseMusicandStreams 
		IF NOT TryJoinServerIPSuccess 
			IF IsJoiningInternetGame 
				check_join_internet_ip 
				RETURN 
			ENDIF 
			RefreshServerList force_refresh 
		ENDIF 
		Change check_for_unplugged_controllers = 1 
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
ENDSCRIPT

SCRIPT set_enter_message_focus 
	menu_onscreen <...> 
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
	SetScreenElementProps { id = remove_players_menu event_handlers = [ 
			{ pad_back generic_menu_pad_back params = { callback = create_pause_menu } } 
		] 
	} 
	FillRemovePlayersMenu 
	RunScriptOnScreenElement id = current_menu_anchor menu_onscreen 
ENDSCRIPT

SCRIPT create_xbox_online_menu 
	make_new_menu menu_id = xbox_online_menu vmenu_id = xbox_online_vmenu menu_title = "THUG Online Play" 
	SetScreenElementProps { id = xbox_online_menu event_handlers = [ 
			{ pad_back generic_menu_pad_back params = { callback = create_pause_menu } } 
		] 
	} 
	make_text_sub_menu_item text = "Play" id = menu_xonline_play_live pad_choose_script = do_nothing 
	make_text_sub_menu_item text = "Friends" id = menu_xonline_friends pad_choose_script = launch_buddy_list 
	make_text_sub_menu_item text = "Sign Out" id = menu_xonline_sign_out pad_choose_script = sign_out 
	make_text_sub_menu_item text = "Free More Blocks" id = menu_xonline_dashboard pad_choose_script = go_to_xbox_dashboard 
	RunScriptOnScreenElement id = current_menu_anchor menu_onscreen 
ENDSCRIPT

SCRIPT create_profile_menu 
	FormatText ChecksumName = rgba "%i_HIGHLIGHTED_TEXT_COLOR" i = ( THEME_COLOR_PREFIXES [ current_theme_prefix ] ) 
	build_top_and_bottom_blocks 
	make_mainmenu_3d_plane 
	SetScreenElementLock id = menu_parts_anchor off 
	CreateScreenElement { 
		type = ContainerElement 
		parent = menu_parts_anchor 
		id = profile_options_anchor 
		pos = PAIR(-5.00000000000, 800.00000000000) 
	} 
	make_new_menu { menu_id = profile_options_menu 
		vmenu_id = profile_options_vmenu 
		parent = profile_options_anchor 
		pos = PAIR(80.00000000000, 85.00000000000) 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = profile_options_anchor 
		font = testtitle 
		text = "LOGIN/PROFILE" 
		scale = 1.50000000000 
		pos = PAIR(37.00000000000, 86.00000000000) 
		just = [ left top ] 
		rgba = [ 128 128 128 98 ] 
		not_focusable 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = profile_options_anchor 
		texture = regions 
		scale = 1 
		pos = PAIR(39.00000000000, 82.00000000000) 
		just = [ left top ] 
		rgba = <rgba> 
		scale = PAIR(1.02499997616, 1.00000000000) 
		alpha = 0.60000002384 
		not_focusable 
	} 
	SetScreenElementProps { id = profile_options_menu event_handlers = [ { pad_back generic_menu_pad_back params = { callback = back_from_profile_options } } ] } 
	profile_options_add_item text = "" not_focusable = not_focusable 
	GetPreferenceString pref_type = network profile_email 
	profile_options_add_item text = "Email Address" id = network_profile_email pad_choose_script = launch_email_keyboard pad_choose_params = { field = "profile_email" text = <ui_string> title = "EMAIL ADDRESS" min_length = 1 max_length = 50 } 
	profile_options_add_item text = <ui_string> id = network_profile_email_string not_focusable = not_focusable font = dialog box_it_up = box_it_up ignore_width scale = 0.74000000954 
	GetPreferenceString pref_type = network profile_password 
	GetPreferencePassword pref_type = network profile_password 
	profile_options_add_item text = "Password" id = network_profile_password pad_choose_script = launch_onscreen_keyboard_from_profile_menu pad_choose_params = { field = "profile_password" text = <ui_string> title = "PROFILE PASSWORD" min_length = 1 max_length = 10 password } 
	profile_options_add_item text = <password_string> id = network_profile_password_string not_focusable = not_focusable font = dialog box_it_up = box_it_up ignore_width 
	GetPreferenceString pref_type = network profile_password_confirm 
	GetPreferencePassword pref_type = network profile_password_confirm 
	profile_options_add_item text = "Confirm Password" id = network_profile_password_confirm pad_choose_script = launch_onscreen_keyboard_from_profile_menu pad_choose_params = { field = "profile_password_confirm" text = <ui_string> title = "CONFIRM PASSWORD" min_length = 1 max_length = 10 password } 
	profile_options_add_item text = <password_string> id = network_profile_password_confirm_string not_focusable = not_focusable font = dialog box_it_up = box_it_up ignore_width 
	GetPreferenceString pref_type = network profile_email 
	IF ( <ui_string> = "" ) 
		profile_options_add_item text = "Login/Create" id = network_profile_create pad_choose_script = create_profile not_focusable last_menu_item = last_menu_item 
	ELSE 
		GetPreferenceString pref_type = network profile_password 
		IF ( <ui_string> = "" ) 
			profile_options_add_item text = "Login/Create" id = network_profile_create pad_choose_script = create_profile not_focusable last_menu_item = last_menu_item 
		ELSE 
			pw_string = <ui_string> 
			GetPreferenceString pref_type = network profile_password_confirm 
			IF ( <pw_string> = <ui_string> ) 
				profile_options_add_item text = "Login/Create" id = network_profile_create pad_choose_script = create_profile last_menu_item = last_menu_item 
			ELSE 
				profile_options_add_item text = "Login/Create" id = network_profile_create pad_choose_script = create_profile not_focusable last_menu_item = last_menu_item 
			ENDIF 
		ENDIF 
	ENDIF 
	RunScriptOnScreenElement lobby_list_animate_in id = profile_options_anchor params = { id = profile_options_anchor } 
	FireEvent type = unfocus target = sub_menu 
	FireEvent type = focus target = profile_options_menu 
	AssignAlias id = menu_parts_anchor alias = current_menu_anchor 
ENDSCRIPT

SCRIPT profile_options_add_item 
	theme_menu_add_item { parent = profile_options_vmenu centered <...> menu = 2 } 
ENDSCRIPT

SCRIPT launch_onscreen_keyboard_from_profile_menu 
	RunScriptOnScreenElement id = current_menu_anchor menu_offscreen callback = create_onscreen_keyboard callback_params = { allow_cancel in_profile_options keyboard_cancel_script = profile_setup_back_from_keyboard keyboard_done_script = set_profile_setting keyboard_title = <title> <...> } 
ENDSCRIPT

SCRIPT profile_setup_back_from_keyboard 
	destroy_onscreen_keyboard 
	launch_profile_menu 
ENDSCRIPT

SCRIPT set_profile_setting 
	GetTextElementString id = keyboard_current_string 
	set_preferences_from_ui prefs = network <...> 
	destroy_onscreen_keyboard 
	launch_profile_menu 
ENDSCRIPT

SCRIPT create_profile 
	DestroyScreenElement id = current_menu_anchor 
	CreateProfile 
	create_dialog_box { title = net_status_msg 
		text = "Please Wait..." 
		no_animate 
	} 
ENDSCRIPT

SCRIPT log_in_profile 
	dialog_box_exit 
	create_dialog_box { title = net_status_msg 
		text = "Logging in..." 
		no_animate 
	} 
ENDSCRIPT

SCRIPT stats_log_in_profile 
	dialog_box_exit 
	create_dialog_box { title = net_status_msg 
		text = "Connecting to stats server..." 
		no_animate 
	} 
ENDSCRIPT

SCRIPT back_to_profile_menu 
	dialog_box_exit 
	launch_profile_menu 
ENDSCRIPT

SCRIPT create_wrong_profile_password_dialog 
	dialog_box_exit 
	create_dialog_box { title = "WRONG PASSWORD" 
		text = "The password you have entered is invalid for this account." 
		buttons = [ { text = "ok" pad_choose_script = back_to_profile_menu } 
		] 
	} 
ENDSCRIPT

SCRIPT profile_logged_in 
	printf "script profile_logged_in" 
	set_preferences_from_ui prefs = network field = "profile_success" string = "Yes" checksum = boolean_true 
	dialog_box_exit 
	StatsLogIn 
ENDSCRIPT

SCRIPT stats_logged_in 
	dialog_box_exit 
	create_dialog_box { title = net_status_msg 
		text = "Retrieving stats..." 
		no_animate 
	} 
	RetrievePersonalStats 
ENDSCRIPT

SCRIPT stats_retrieved 
	dialog_box_exit 
	create_internet_options 
ENDSCRIPT

SCRIPT no_profile_homie_list_prompt 
	FireEvent type = unfocus target = actions_menu 
	IF ObjectExists id = console_message_vmenu 
		DoScreenElementMorph id = console_message_vmenu time = 0 scale = 0 
	ENDIF 
	FormatText textname = msg_text "Cannot access homie list without logging into Gamespy first." 
	create_dialog_box { title = "PLAYER NOT LOGGED IN" 
		text = <msg_text> 
		buttons = [ { text = "ok" pad_choose_script = cancel_view_homies } 
		] 
		text_dims = PAIR(260.00000000000, 0.00000000000) 
		no_bg = no_bg 
	} 
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

ped_profile_list = [ 
	{ 
		display_name = "Eric Sparrow" 
		ped_appearance_structure = Ped_Eric 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP1 
	} 
	{ 
		display_name = "Stacy Peralta" 
		ped_appearance_structure = Ped_Peralta 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP1 
	} 
	{ 
		display_name = "Todd the Manager" 
		ped_appearance_structure = Ped_Todd 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP1 
	} 
	{ 
		display_name = "Neversoft Chef" 
		ped_appearance_structure = ped_chef 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP3 
	} 
	{ 
		display_name = "Jersey Bum" 
		ped_appearance_structure = Ped_Bum_01 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP2 
	} 
	{ 
		display_name = "The Addict" 
		ped_appearance_structure = Ped_Crackhead_01 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP2 
	} 
	{ 
		display_name = "The Dealer" 
		ped_appearance_structure = Ped_Drugdealer_02 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP2 
	} 
	{ 
		display_name = "Factory Worker" 
		ped_appearance_structure = Ped_FactoryWorker_02 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP5 
	} 
	{ 
		display_name = "Security Guard" 
		ped_appearance_structure = Ped_Security_Train 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP4 
	} 
	{ 
		display_name = "Street Warrior" 
		ped_appearance_structure = Ped_Street_Warrior_01 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP4 
	} 
	{ 
		display_name = "Headstone Harry" 
		ped_appearance_structure = Ped_Tombstone 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP4 
	} 
	{ 
		display_name = "Business Man" 
		ped_appearance_structure = Ped_BusinessMan_01 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP5 
	} 
	{ 
		display_name = "Manhattan Cop" 
		ped_appearance_structure = Ped_M_NYPD_01 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP3 
	} 
	{ 
		display_name = "Construction Worker" 
		ped_appearance_structure = Ped_Construction_Jhammer 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP3 
	} 
	{ 
		display_name = "State Trooper" 
		ped_appearance_structure = Ped_Trooper 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP5 
	} 
	{ 
		display_name = "Hotel Desk Clerk" 
		ped_appearance_structure = Ped_Deskclerk_01 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP6 
	} 
	{ 
		display_name = "Hotel Doorman" 
		ped_appearance_structure = Ped_Doorman_01 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP6 
	} 
	{ 
		display_name = "DJ QBert" 
		ped_appearance_structure = Ped_QBert 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP7 
	} 
	{ 
		display_name = "Team Filmer" 
		ped_appearance_structure = Ped_Video 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP7 
	} 
	{ 
		display_name = "Leaf Blower" 
		ped_appearance_structure = Ped_Leafblower 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP7 
	} 
	{ 
		display_name = "Gardener" 
		ped_appearance_structure = Ped_Gardener_02 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP6 
	} 
	{ 
		display_name = "KGB Member" 
		ped_appearance_structure = Ped_KGB_02 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP8 
	} 
	{ 
		display_name = "Tank Guard" 
		ped_appearance_structure = Ped_RGuard_01 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP8 
	} 
	{ 
		display_name = "Paul from KISS" 
		ped_appearance_structure = skate_KISS_Paul 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP9 
	} 
	{ 
		display_name = "Peter from KISS" 
		ped_appearance_structure = skate_KISS_Peter 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP9 
	} 
	{ 
		display_name = "Ace from KISS" 
		ped_appearance_structure = skate_KISS_Ace 
		ped_group_flag = SKATER_UNLOCKED_PEDGROUP9 
	} 
] 
Cheat_Array_PS2 = [ 
	{ c1 = -1635329692 c2 = 562756314 CheatScript = cheat_unlock_always_special } , 
	{ c1 = -107077321 c2 = -442880115 CheatScript = cheat_unlock_perfect_rail } , 
	{ c1 = -2068539188 c2 = 1866307393 CheatScript = cheat_unlock_perfect_skitch } , 
	{ c1 = -628090015 c2 = 1977689421 CheatScript = cheat_unlock_perfect_manual } , 
	{ c1 = -2102285740 c2 = -507350932 CheatScript = cheat_unlock_moon_grav } , 
	{ c1 = 1380857305 c2 = -1088024478 CheatScript = cheat_unlock_pedgroup1 } , 
	{ c1 = -994715246 c2 = -648951614 CheatScript = cheat_unlock_pedgroup2 } , 
	{ c1 = 1503031045 c2 = -806750685 CheatScript = cheat_unlock_pedgroup3 } , 
	{ c1 = -294868555 c2 = 1866911522 CheatScript = cheat_unlock_pedgroup4 } , 
	{ c1 = -1027686609 c2 = -527447517 CheatScript = cheat_unlock_pedgroup5 } , 
	{ c1 = 393705811 c2 = -93711915 CheatScript = cheat_unlock_pedgroup6 } , 
	{ c1 = -1698585355 c2 = -1816007904 CheatScript = cheat_unlock_pedgroup7 } , 
	{ c1 = 1599086308 c2 = 207256401 CheatScript = cheat_unlock_pedgroup8 } , 
	{ c1 = -1074052774 c2 = -1764521747 CheatScript = cheat_unlock_pedgroup9 } , 
	{ c1 = -806439674 c2 = -388533228 CheatScript = cheat_select_shift } , 
	{ c1 = 200815098 c2 = 1302997763 CheatScript = unlock_all_cheat_codes } , 
	{ c1 = -202083292 c2 = -1183245838 CheatScript = unlock_all_sponsors } , 
	{ c1 = 1514866057 c2 = 1122108632 CheatScript = cheat_unlockmovies } , 
	{ c1 = -864864584 c2 = 1554455483 CheatScript = unlock_all_cutscenes } , 
	{ c1 = 1962502363 c2 = -663818524 CheatScript = cheat_reallygivelevels } , 
	{ c1 = -1621245333 c2 = -2126527034 CheatScript = cheat_give_im } , 
	{ c1 = -662498709 c2 = -1427360747 CheatScript = cheat_give_kiss } , 
	{ c1 = 392200873 c2 = -1719341740 CheatScript = cheat_give_thud } , 
	{ c1 = 945447491 c2 = -1991590705 CheatScript = unlock_all_cheats } , 
] 
Cheat_Array_Xbox = [ 
	{ c1 = -1635329692 c2 = 562756314 CheatScript = cheat_unlock_always_special } , 
	{ c1 = -107077321 c2 = -442880115 CheatScript = cheat_unlock_perfect_rail } , 
	{ c1 = -2068539188 c2 = 1866307393 CheatScript = cheat_unlock_perfect_skitch } , 
	{ c1 = -628090015 c2 = 1977689421 CheatScript = cheat_unlock_perfect_manual } , 
	{ c1 = -2102285740 c2 = -507350932 CheatScript = cheat_unlock_moon_grav } , 
	{ c1 = 1380857305 c2 = -1088024478 CheatScript = cheat_unlock_pedgroup1 } , 
	{ c1 = -994715246 c2 = -648951614 CheatScript = cheat_unlock_pedgroup2 } , 
	{ c1 = 1503031045 c2 = -806750685 CheatScript = cheat_unlock_pedgroup3 } , 
	{ c1 = -294868555 c2 = 1866911522 CheatScript = cheat_unlock_pedgroup4 } , 
	{ c1 = -1027686609 c2 = -527447517 CheatScript = cheat_unlock_pedgroup5 } , 
	{ c1 = 393705811 c2 = -93711915 CheatScript = cheat_unlock_pedgroup6 } , 
	{ c1 = -1698585355 c2 = -1816007904 CheatScript = cheat_unlock_pedgroup7 } , 
	{ c1 = 1599086308 c2 = 207256401 CheatScript = cheat_unlock_pedgroup8 } , 
	{ c1 = -1074052774 c2 = -1764521747 CheatScript = cheat_unlock_pedgroup9 } , 
	{ c1 = -806439674 c2 = -388533228 CheatScript = cheat_select_shift } , 
	{ c1 = -1341906245 c2 = -1445764669 CheatScript = unlock_all_cheat_codes } , 
	{ c1 = -218547029 c2 = -348688460 CheatScript = unlock_all_sponsors } , 
	{ c1 = -2095060509 c2 = -1947746046 CheatScript = cheat_unlockmovies } , 
	{ c1 = -141203914 c2 = -696772861 CheatScript = unlock_all_cutscenes } , 
	{ c1 = -1852778764 c2 = 1899369231 CheatScript = cheat_reallygivelevels } , 
	{ c1 = -194403881 c2 = -676371812 CheatScript = cheat_give_im } , 
	{ c1 = 1799809803 c2 = -1535229791 CheatScript = cheat_give_kiss } , 
	{ c1 = 1606426402 c2 = 1999384388 CheatScript = cheat_give_thud } , 
	{ c1 = -1056760664 c2 = 1666507356 CheatScript = unlock_all_cheats } , 
] 
Cheat_Array_Gamecube = [ 
	{ c1 = -1635329692 c2 = 562756314 CheatScript = cheat_unlock_always_special } , 
	{ c1 = -107077321 c2 = -442880115 CheatScript = cheat_unlock_perfect_rail } , 
	{ c1 = -2068539188 c2 = 1866307393 CheatScript = cheat_unlock_perfect_skitch } , 
	{ c1 = -628090015 c2 = 1977689421 CheatScript = cheat_unlock_perfect_manual } , 
	{ c1 = -2102285740 c2 = -507350932 CheatScript = cheat_unlock_moon_grav } , 
	{ c1 = 1380857305 c2 = -1088024478 CheatScript = cheat_unlock_pedgroup1 } , 
	{ c1 = -994715246 c2 = -648951614 CheatScript = cheat_unlock_pedgroup2 } , 
	{ c1 = 1503031045 c2 = -806750685 CheatScript = cheat_unlock_pedgroup3 } , 
	{ c1 = -294868555 c2 = 1866911522 CheatScript = cheat_unlock_pedgroup4 } , 
	{ c1 = -1027686609 c2 = -527447517 CheatScript = cheat_unlock_pedgroup5 } , 
	{ c1 = 393705811 c2 = -93711915 CheatScript = cheat_unlock_pedgroup6 } , 
	{ c1 = -1698585355 c2 = -1816007904 CheatScript = cheat_unlock_pedgroup7 } , 
	{ c1 = 1599086308 c2 = 207256401 CheatScript = cheat_unlock_pedgroup8 } , 
	{ c1 = -1074052774 c2 = -1764521747 CheatScript = cheat_unlock_pedgroup9 } , 
	{ c1 = -806439674 c2 = -388533228 CheatScript = cheat_select_shift } , 
	{ c1 = -1388147104 c2 = 1465560734 CheatScript = unlock_all_cheat_codes } , 
	{ c1 = -2078325183 c2 = -1180915252 CheatScript = unlock_all_sponsors } , 
	{ c1 = 363321702 c2 = 573124160 CheatScript = cheat_unlockmovies } , 
	{ c1 = -749604057 c2 = -1973365776 CheatScript = unlock_all_cutscenes } , 
	{ c1 = 1893465512 c2 = 553270147 CheatScript = cheat_reallygivelevels } , 
	{ c1 = -514997198 c2 = -343469748 CheatScript = cheat_give_im } , 
	{ c1 = -603350985 c2 = -372747995 CheatScript = cheat_give_kiss } , 
	{ c1 = -1628008952 c2 = 631405766 CheatScript = cheat_give_thud } , 
	{ c1 = 1675071111 c2 = -424120389 CheatScript = unlock_all_cheats } , 
] 
SCRIPT select_network_play_multi 
	dialog_box_exit 
	pulse_blur speed = 2 start = 255 
	IF GotParam change_gamemode 
		<change_gamemode> 
	ENDIF 
	make_new_menu { 
		pos = PAIR(120.00000000000, 100.00000000000) 
		internal_just = [ center center ] 
		menu_id = multiplayer_options_menu 
		vmenu_id = multiplayer_options_vmenu 
		menu_title = "" 
		helper_text = generic_helper_text 
	} 
	build_theme_sub_title title = "MULTIPLAYER" 
	build_top_and_bottom_blocks 
	make_mainmenu_3d_plane model = "mainmenu_bg\\mainmenu_bg.mdl" scale = PAIR(1.25000000000, 1.25000000000) pos = PAIR(360.00000000000, 217.00000000000) 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		id = mm_building 
		texture = mm_building 
		just = [ left top ] 
		pos = PAIR(0.00000000000, 62.00000000000) 
		scale = PAIR(1.20000004768, 1.25000000000) 
		z_priority = -3 
		alpha = 1 
	} 
	make_mainmenu_clouds 
	kill_start_key_binding 
	SetScreenElementProps { id = multiplayer_options_vmenu event_handlers = [ 
			{ pad_back generic_menu_pad_back params = { callback = create_main_menu } } 
		] 
	} 
	FormatText ChecksumName = bracket_texture "%i_sub_frame" i = ( THEME_PREFIXES [ current_theme_prefix ] ) 
	make_main_menu_item { text = #"Network Play" 
		id = mm_multi_play 
		pad_choose_script = career_options_menu_exit 
		pad_choose_params = { new_menu_script = select_xbox_multiplayer 
			change_gamemode = change_gamemode_net 
			hold_camera 
		} 
		mark_first_input 
		focus_params = { attract_timer } 
	} 
	SetScreenElementProps { 
		id = mm_multi_play 
		event_handlers = [ 
			{ focus PlayHelperDesc params = { systemlink_helper_desc } } 
			{ unfocus StopHelperDesc } 
		] 
	} 
	make_main_menu_item { text = #"THUG Online Play" 
		id = menu_net 
		pad_choose_script = career_options_menu_exit 
		pad_choose_params = { new_menu_script = select_network_play 
			change_gamemode = change_gamemode_net 
			hold_camera 
		} 
		mark_first_input 
		focus_params = { attract_timer } 
	} 
	SetScreenElementProps { 
		id = menu_net 
		event_handlers = [ 
			{ focus PlayHelperDesc params = { online_helper_desc } } 
			{ unfocus StopHelperDesc } 
		] 
	} 
	GetStackedScreenElementPos y id = <id> offset = PAIR(180.00000000000, 20.00000000000) 
	FireEvent type = focus target = current_menu_anchor 
	IF GotParam from_skater_select 
		SpawnScript shadow_skater_script2 params = { make_it_safe } 
	ENDIF 
ENDSCRIPT

SCRIPT create_network_menu_exit 
	console_hide 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	<new_menu_script> <...> 
ENDSCRIPT


