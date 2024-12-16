
SCRIPT options_menu_exit 
	dialog_box_exit 
	IF ScreenElementExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	<new_menu_script> <...> 
ENDSCRIPT

SCRIPT launch_setup_options_menu 
	pulse_blur 
	IF ScreenElementExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	create_setup_options_menu 
ENDSCRIPT

SCRIPT create_setup_options_menu 
	change_gamemode_singlesession 
	dialog_box_exit 
	change in_options_menu = 1 
	pulse_blur speed = 2 start = 255 
	play_no_skater_cam 
	make_new_roundbar_menu title = "GAME OPTIONS" pos = PAIR(130.00000000000, 100.00000000000) spacing = 6 pad_back_script = generic_menu_pad_back pad_back_params = { callback = create_main_menu } 
	add_roundbar_menu_item { 
		text = "SAVE GAME" 
		id = options_save 
		pad_choose_script = options_menu_exit 
		pad_choose_params = { 
			new_menu_script = launch_options_menu_save_game_sequence 
		} 
	} 
	IF GetGlobalFlag flag = CAREER_STARTED 
		add_roundbar_menu_item { 
			text = "LOAD GAME" 
			id = options_load 
			pad_choose_script = options_menu_exit 
			pad_choose_params = { 
				new_menu_script = prompt_launch_options_menu_load 
			} 
		} 
	ELSE 
		add_roundbar_menu_item { 
			text = "LOAD GAME" 
			id = options_load 
			pad_choose_script = options_menu_exit 
			pad_choose_params = { 
				new_menu_script = launch_options_menu_load_game_sequence 
			} 
		} 
	ENDIF 
	add_roundbar_menu_item { 
		text = "GAME SETTINGS" 
		id = options_gameoptions 
		pad_choose_script = options_menu_exit 
		pad_choose_params = { 
			new_menu_script = create_gamesettings_menu 
		} 
	} 
	IF NOT isTrue DEMO_BUILD 
		add_roundbar_menu_item { 
			text = "GAME PROGRESS" 
			id = options_progress 
			pad_choose_script = options_menu_exit 
			pad_choose_params = { 
				new_menu_script = game_progress_menu_create 
				from_options 
			} 
		} 
		add_roundbar_menu_item { 
			text = "HIGH SCORES" 
			id = options_records 
			pad_choose_script = options_menu_exit 
			pad_choose_params = { 
				new_menu_script = high_scores_menu_create 
				from_options = from_options 
				level = 1 
				level_name = "Boston" 
				no_load_textures 
			} 
		} 
		add_roundbar_menu_item { 
			text = "CHEAT CODES" 
			id = options_cheats 
			pad_choose_script = options_menu_exit 
			pad_choose_params = { 
				new_menu_script = create_onscreen_keyboard 
				text = "" 
				keyboard_title = "ENTER CHEAT" 
				min_length = 1 
				max_length = 15 
				keyboard_done_script = check_cheat_from_keyboard 
				keyboard_cancel_script = check_cheat_from_keyboard 
				keyboard_cancel_params = { cancel } 
				allow_cancel 
			} 
		} 
		add_roundbar_menu_item { 
			text = "GAME MOVIES" 
			id = options_movies 
			pad_choose_script = options_menu_exit 
			pad_choose_params = { 
				new_menu_script = create_gamemovies_menu 
				from_options = from_options 
			} 
		} 
	ENDIF 
	draw_menu_background options_mode 
	roundbar_menu_finish build_pause_parts = 0 
ENDSCRIPT

SCRIPT add_options_menu_items 
	IF GotParam copy 
		<id> = options_motox2 
	ELSE 
		<id> = options_motox 
	ENDIF 
	IF isPS2 
		make_spin_menu_item { 
			text1 = "          Game Demo" 
			highlight_text = "GAME DEMO" 
			id = <id> 
			pad_choose_script = options_menu_exit 
			pad_choose_params = { new_menu_script = confirm_demo } 
			helper_text = "Play a demo game..." 
			icon = mainicon_story 
		} 
	ENDIF 
	IF GotParam copy 
		<id> = options_motox2 
	ELSE 
		<id> = options_motox 
	ENDIF 
	IF isXbox 
		make_spin_menu_item { 
			text1 = "          Game Demo" 
			highlight_text = "GAME DEMO" 
			id = <id> 
			pad_choose_script = options_menu_exit 
			pad_choose_params = { 
				new_menu_script = create_options_movie 
				movie_file = "movies\\bik\\MotoX" 
			} 
			helper_text = "Play a demo game..." 
			icon = mainicon_story 
		} 
	ENDIF 
	IF GotParam copy 
		<id> = options_save2 
	ELSE 
		<id> = options_save 
	ENDIF 
	make_spin_menu_item { 
		text1 = "           Save or" 
		text2 = "           Load Game" 
		highlight_text = "SAVE OR LOAD GAME" 
		id = <id> 
		pad_choose_script = options_menu_exit 
		pad_choose_params = { new_menu_script = create_saveload_menu } 
		helper_text = "Save or load a game..." 
		icon = mainicon_story 
	} 
	IF GotParam copy 
		<id> = options_gameoptions2 
	ELSE 
		<id> = options_gameoptions 
	ENDIF 
	make_spin_menu_item { 
		text1 = "         Game Settings" 
		highlight_text = "GAME SETTINGS" 
		id = <id> 
		pad_choose_script = options_menu_exit 
		pad_choose_params = { new_menu_script = create_gamesettings_menu } 
		helper_text = "Modify the game settings..." 
		icon = mainicon_story 
	} 
	IF GotParam copy 
		<id> = options_progress2 
	ELSE 
		<id> = options_progress 
	ENDIF 
	make_spin_menu_item { 
		text1 = "        Game Progress" 
		highlight_text = "GAME PROGRESS" 
		id = <id> 
		pad_choose_script = options_menu_exit 
		pad_choose_params = { new_menu_script = game_progress_menu_create from_options } 
		helper_text = "View your progress in the game..." 
		icon = mainicon_story 
	} 
	IF NOT isTrue DEMO_BUILD 
		IF GotParam copy 
			<id> = options_records2 
		ELSE 
			<id> = options_records 
		ENDIF 
		make_spin_menu_item { 
			text1 = "          High Scores" 
			highlight_text = "HIGH SCORES" 
			id = <id> 
			pad_choose_script = options_menu_exit 
			pad_choose_params = { 
				new_menu_script = high_scores_menu_create 
				from_options = from_options 
				level = 1 
				level_name = "New Jersey" 
			} 
			helper_text = "View your high scores..." 
			icon = mainicon_story 
		} 
		IF GotParam copy 
			<id> = options_cheats2 
		ELSE 
			<id> = options_cheats 
		ENDIF 
		make_spin_menu_item { 
			text1 = "          Cheat Codes" 
			highlight_text = "CHEAT CODES" 
			id = <id> 
			pad_choose_script = options_menu_exit 
			pad_choose_params = { 
				new_menu_script = create_onscreen_keyboard 
				text = "" 
				keyboard_title = "ENTER CHEAT" 
				min_length = 1 
				max_length = 15 
				keyboard_done_script = check_cheat_from_keyboard 
				keyboard_cancel_script = check_cheat_from_keyboard 
				keyboard_cancel_params = { cancel } 
				allow_cancel 
			} 
			helper_text = "Go ahead, we\'re not looking..." 
			icon = mainicon_story 
		} 
		IF GotParam copy 
			<id> = options_movies2 
		ELSE 
			<id> = options_movies 
		ENDIF 
		make_spin_menu_item { 
			text1 = "          Game Movies" 
			highlight_text = "GAME MOVIES" 
			id = <id> 
			pad_choose_script = options_menu_exit 
			pad_choose_params = { 
				new_menu_script = create_gamemovies_menu 
				from_options = from_options 
			} 
			helper_text = "Watch movies from the game..." 
			icon = mainicon_story 
		} 
		IF NOT isPS2 
			IF NOT isXbox 
				make_spin_menu_item { 
					blank 
				} 
			ENDIF 
		ENDIF 
	ENDIF 
	make_spin_menu_item { 
		blank 
	} 
ENDSCRIPT

SCRIPT create_saveload_menu 
	make_new_themed_scrolling_menu title = "SAVE OR LOAD" dims = PAIR(300.00000000000, 252.00000000000) 
	create_helper_text { helper_text_elements = [ { text = "\\b7/\\b4 = Select" } 
			{ text = "\\bn = Back" } 
			{ text = "\\bm = Accept" } 
		] 
	} 
	SetScreenElementProps { id = sub_menu 
		event_handlers = [ 
			{ pad_back generic_menu_pad_back params = { callback = create_setup_options_menu } } 
		] 
	} 
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
	finish_themed_scrolling_menu 
ENDSCRIPT

SCRIPT create_gamesettings_menu 
	play_no_skater_cam 
	IF ScreenElementExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	make_new_themed_sub_menu title = "GAME SETTINGS" 
	create_helper_text { helper_text_elements = [ { text = "\\b7/\\b4 = Select" } 
			{ text = "\\bn = Back" } 
			{ text = "\\bm = Accept" } 
		] 
	} 
	SetScreenElementProps { id = sub_menu 
		event_handlers = [ 
			{ pad_back generic_menu_pad_back params = { callback = create_setup_options_menu } } 
		] 
	} 
	theme_menu_add_item { text = #"Control Setup" 
		id = options_controller 
		pad_choose_script = options_menu_exit 
		pad_choose_params = { new_menu_script = create_controller_config_menu } 
		centered 
	} 
	theme_menu_add_item { text = #"Sound Options" 
		pad_choose_script = options_menu_exit 
		pad_choose_params = { new_menu_script = create_sound_options_menu } 
		centered 
	} 
	IF NOT isXbox 
		theme_menu_add_item { text = #"Screen Mode" 
			pad_choose_script = options_menu_exit 
			pad_choose_params = { new_menu_script = create_screen_menu callback_script = create_setup_options_menu } 
			centered 
		} 
	ENDIF 
	IF isXbox 
		theme_menu_add_item { text = #"Taunt Options" 
			pad_choose_script = options_menu_exit 
			pad_choose_params = { new_menu_script = create_taunt_options_menu } 
			centered 
		} 
	ENDIF 
	IF GetGlobalFlag flag = NO_DISPLAY_CUTSCENE_SUBTITLES 
		<hud_text> = "Off" 
	ELSE 
		<hud_text> = "On" 
	ENDIF 
	theme_menu_add_item { 
		text = "Cutscene Subtitles:" 
		text_pos = PAIR(151.00000000000, -5.00000000000) 
		extra_text = <hud_text> 
		id = menu_display_cutscene_subtitles 
		pad_choose_script = toggle_cutscene_subtitles 
		ignore_width 
	} 
	theme_menu_add_flag_item { text = "Blood:" 
		id = blood_text 
		flag = BLOOD_OFF 
		reverse 
		last_menu_item = last_menu_item 
	} 
	add_options_menu_sign_element icon = game_icon 
	finish_themed_sub_menu 
ENDSCRIPT

SCRIPT create_gamemovies_menu 
	make_new_themed_sub_menu title = "GAME MOVIES" dims = PAIR(300.00000000000, 252.00000000000) 
	create_helper_text { helper_text_elements = [ { text = "\\b7/\\b4 = Select" } 
			{ text = "\\bn = Back" } 
			{ text = "\\bm = Accept" } 
		] 
	} 
	SetScreenElementProps { id = sub_menu 
		event_handlers = [ 
			{ pad_back generic_menu_pad_back params = { callback = create_setup_options_menu } } 
		] 
	} 
	theme_menu_add_item { text = #"THUG 2 Movies" 
		id = options_movies 
		pad_choose_script = options_menu_exit 
		pad_choose_params = { new_menu_script = create_movies_menu from_options = from_options } 
		centered 
	} 
	theme_menu_add_item { text = #"Teaser Movies" 
		id = options_teasers 
		pad_choose_script = options_menu_exit 
		pad_choose_params = { new_menu_script = create_teaser_menu from_options = from_options } 
		centered 
	} 
	theme_menu_add_item { text = #"PC Credits" 
		id = options_pccredits 
		pad_choose_script = options_menu_exit 
		pad_choose_params = { new_menu_script = create_options_movie movie_file = "movies\\pccredits" } 
		centered 
	} 
	theme_menu_add_item { text = #"Credits" 
		id = options_credits 
		pad_choose_script = options_menu_exit 
		pad_choose_params = { new_menu_script = create_options_movie movie_file = "movies\\credits" } 
		centered 
		last_menu_item = last_menu_item 
	} 
	IF LevelIs Load_MainMenu 
		add_options_menu_sign_element icon = movie_icon icon_pos = PAIR(553.00000000000, 140.00000000000) icon_scale = 1 
	ENDIF 
	finish_themed_sub_menu 
ENDSCRIPT

SCRIPT prompt_launch_options_menu_load 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	skater : hide 
	create_dialog_box { title = "Load Game" 
		text = #"Warning !\\nAny unsaved changes to your current Game Progress will be lost.\\nContinue ?" 
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
	skater : unhide 
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

SCRIPT create_movies_menu 
	focus_index = 0 
	IF NOT GotParam from_options 
		skater : AddSkatertoWorld 
		skater : RemoveSkaterFromWorld 
	ENDIF 
	skater : pausephysics 
	make_new_themed_scrolling_menu title = "MOVIES" 
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
	SetScreenElementProps { id = sub_scrolling_menu 
		pos = PAIR(98.00000000000, 90.00000000000) 
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
		pad_choose_params = { callback = movie_menu_exit } 
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
	spawnscript rotate_projector_wheels 
	IF LevelIs Load_MainMenu 
		add_options_menu_sign_element icon = movie_icon no_animate icon_pos = PAIR(553.00000000000, 140.00000000000) icon_scale = 1 
	ENDIF 
	finish_themed_scrolling_menu force_end_pos pos = PAIR(188.00000000000, 83.00000000000) 
	IF ( <focus_index> > 0 ) 
		BEGIN 
			FireEvent type = pad_down target = current_menu 
		REPEAT <focus_index> 
	ENDIF 
ENDSCRIPT

SCRIPT create_teaser_menu focus_index = 0 
	IF NOT GotParam from_options 
		skater : AddSkatertoWorld 
		skater : RemoveSkaterFromWorld 
	ENDIF 
	skater : pausephysics 
	make_new_themed_scrolling_menu title = "TEASERS" 
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
	SetScreenElementProps { id = sub_scrolling_menu 
		pos = PAIR(98.00000000000, 90.00000000000) 
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
		pad_choose_params = { callback = movie_menu_exit } 
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
	IF LevelIs Load_MainMenu 
		add_options_menu_sign_element icon = movie_icon no_animate icon_pos = PAIR(553.00000000000, 140.00000000000) icon_scale = 1 
	ENDIF 
	finish_themed_scrolling_menu force_end_pos pos = PAIR(188.00000000000, 83.00000000000) 
	IF ( <focus_index> > 0 ) 
		BEGIN 
			FireEvent type = pad_down target = current_menu 
		REPEAT <focus_index> 
	ENDIF 
	wait 2 gameframes 
	IF ScreenElementExists id = sub_scrolling_menu 
		SetScreenElementProps id = sub_scrolling_menu reset_window_bottom 
	ENDIF 
ENDSCRIPT

SCRIPT teaser_menu_play_movie 
	
	IF NOT GotParam movie_file 
		
	ENDIF 
	PauseMusicandStreams 1 
	KillSpawnedScript name = rotate_projector_wheels 
	KillSpawnedScript name = shake_projector 
	IF ScreenElementExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	playmovie_script <movie_file> 
	create_teaser_menu focus_index = <index> 
ENDSCRIPT

SCRIPT teaser_menu_exit 
	KillSpawnedScript name = rotate_projector_wheels 
	KillSpawnedScript name = shake_projector 
	controller_config_exit from_movies 
ENDSCRIPT

teaser_info = [ 
	{ name = "Adio" file = "teasers\\adio" } 
	{ name = "Element" file = "teasers\\element" } 
	{ name = "eS" file = "teasers\\es" } 
	{ name = "Etnies" file = "teasers\\etnies" } 
	{ name = "Hawk Clothing" file = "teasers\\hawk" } 
	{ name = "Hurley" file = "teasers\\hurley" } 
	{ name = "Metallica" file = "teasers\\metal" } 
	{ name = "Quiksilver" file = "teasers\\quik" } 
	{ name = "Shorty\'s" file = "teasers\\shortys" } 
	{ name = "Volcom" file = "teasers\\volcom" } 
] 
SCRIPT movie_menu_exit 
	KillSpawnedScript name = rotate_projector_wheels 
	KillSpawnedScript name = shake_projector 
	controller_config_exit from_movies 
ENDSCRIPT

SCRIPT movie_menu_graphic 
	CreateScreenElement { 
		type = containerElement 
		parent = current_menu_anchor 
		id = projector_anchor 
		dims = PAIR(320.00000000000, 240.00000000000) 
		pos = PAIR(360.00000000000, -20.00000000000) 
		just = [ left top ] 
	} 
	wheel1_pos = PAIR(81.00000000000, 88.00000000000) 
	wheel2_pos = PAIR(242.00000000000, 168.00000000000) 
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
					
					wheel1_dif = -100 
					wheel2_dif = -80 
					rewind = 1 
					end_of_tape = 0 
					wait 1.20000004768 seconds 
					spawnscript shake_projector 
				ENDIF 
			ELSE 
				IF ( <end_of_tape> = 0 ) 
					IF ( <rewind> = 0 ) 
						IF ( ( ( <max_angle> * -1 ) / 2 ) > <wheel2_angle> ) 
							
							wheel1_dif = 0 
							wheel2_dif = 80 
							end_of_tape = 1 
						ENDIF 
					ENDIF 
				ENDIF 
			ENDIF 
			IF ( <wheel1_angle> > 51 & <rewind> = 1 ) 
				
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
	
	IF NOT GotParam movie_file 
		
	ENDIF 
	IF StringEquals a = <movie_file> b = "movies\\intro" 
		IF IsForeignLanguage 
			movie_file = "movies\\introf" 
		ENDIF 
	ENDIF 
	PauseMusicandStreams 1 
	KillSpawnedScript name = rotate_projector_wheels 
	KillSpawnedScript name = shake_projector 
	IF ScreenElementExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	playmovie_script <movie_file> 
	create_movies_menu focus_index = <index> 
ENDSCRIPT

movie_info = [ 
	{ name = "THUG2 Intro" file = "movies\\intro" flag = LEVEL_UNLOCKED_BO first_name = "" } 
	{ name = "Neversoft Intro" file = "movies\\nslogo" flag = LEVEL_UNLOCKED_BO first_name = "" } 
	{ name = "Activision Intro" file = "movies\\atvi" flag = LEVEL_UNLOCKED_BO first_name = "" } 
	{ name = "Beenox Shift Intro" file = "movies\\beenox_shift" flag = LEVEL_UNLOCKED_BO first_name = "" } 
	{ name = "Intel Intro" file = "movies\\Intel_intro" flag = LEVEL_UNLOCKED_BO first_name = "" } 
	{ name = "Dolby Digital Intro" file = "movies\\Dolby_Digital" flag = LEVEL_UNLOCKED_BO first_name = "" } 
	{ name = "World Destruction Tour" file = "movies\\wdt" flag = MOVIE_UNLOCKED_WDT first_name = "" } 
	{ name = "Pro Bails 1" file = "movies\\probail1" flag = MOVIE_UNLOCKED_PRO_BAILS first_name = "" } 
	{ name = "Pro Bails 2" file = "movies\\probail2" flag = MOVIE_UNLOCKED_PRO_BAILS2 first_name = "" } 
	{ name = "Neversoft" file = "movies\\nsbails" flag = MOVIE_UNLOCKED_NS_BAILS first_name = "" } 
	{ name = "Skatopia" file = "movies\\skatopia" flag = LEVEL_UNLOCKED_BO first_name = "" } 
] 
SCRIPT create_options_movie 
	PauseMusicandStreams 1 
	IF ScreenElementExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	playmovie_script <movie_file> 
	create_gamemovies_menu 
ENDSCRIPT

SCRIPT create_taunt_options_menu 
	IF ScreenElementExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	make_new_themed_sub_menu title = "TAUNT OPTIONS" 
	build_top_and_bottom_blocks 
	create_helper_text = generic_helper_text 
	SetScreenElementProps { id = sub_vmenu event_handlers = [ 
			{ pad_back generic_menu_pad_back params = { callback = create_gamesettings_menu } } 
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
		focus_params = { anim = taunt2 } 
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
		focus_params = { anim = taunt1 } 
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
		focus_params = { anim = taunt3 } 
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
	finish_themed_sub_menu 
	unpauseskaters 
	MakeSkaterGoto TauntAI 
	change cas_cam_angle = 154 
	cas_setup_rotating_camera 
ENDSCRIPT

SCRIPT taunt_options_focus 
	GetTags 
	main_theme_focus <...> 
	DoScreenElementMorph id = { <id> child = 3 } time = 0 rgba = [ 128 128 128 128 ] 
	KillSpawnedScript name = display_taunt 
	IF GotParam props 
		RANDOM(1, 1) RANDOMCASE anim = Prop RANDOMCASE anim = Cheer1 RANDOMEND 
	ENDIF 
	spawnscript display_taunt params = { <...> } 
ENDSCRIPT

SCRIPT taunt_options_unfocus 
	GetTags 
	main_theme_unfocus <...> 
	DoScreenElementMorph id = { <id> child = 3 } time = 0 scale = 0.80000001192 
ENDSCRIPT

SCRIPT display_taunt 
	IF GotParam anim 
		skater : SwitchOnBoard 
		wait 10 gameframes 
		skater : PlayAnim anim = <anim> 
		MakeSkaterGoto TauntAI params = { no_init } 
	ENDIF 
ENDSCRIPT

SCRIPT TauntAI 
	IF NOT GotParam no_init 
		SkaterInit NoEndRun ReturnControl NoAnims no_board = no_board 
		TurnOffSpecialItem 
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
		Obj_SetLightDirection index = 0 heading = 60 pitch = 350 
		Obj_SetLightDirection index = 1 heading = -190 pitch = 270 
		CancelRotateDisplay 
		DisablePlayerInput 
		SetRollingFriction 10000 
		SetSpeed 0 
		Rotate y = 190 
	ELSE 
		Obj_WaitAnimFinished 
	ENDIF 
	PlayAnim Blendperiod = 0.20000000298 anim = idle cycle 
ENDSCRIPT

SCRIPT set_taunt_preference 
	GetTextElementString id = keyboard_current_string 
	SetPreferencesFromUI prefs = taunt <...> 
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
	skater : RemoveSkaterFromWorld 
	generic_menu_pad_choose_sound 
	RunScriptOnScreenElement id = current_menu_anchor menu_offscreen callback = pre_create_onscreen_keyboard callback_params = { allow_cancel keyboard_cancel_script = taunt_back_from_keyboard keyboard_done_script = set_taunt_preference keyboard_title = <title> <...> } 
ENDSCRIPT

SCRIPT pre_create_onscreen_keyboard 
	create_onscreen_keyboard allow_cancel keyboard_cancel_script = taunt_back_from_keyboard keyboard_done_script = set_taunt_preference keyboard_title = <title> <...> 
ENDSCRIPT

SCRIPT control_options_graphic 
	CreateScreenElement { 
		type = containerElement 
		parent = current_menu_anchor 
		id = joystick_anchor 
		dims = PAIR(320.00000000000, 240.00000000000) 
		pos = PAIR(340.00000000000, 30.00000000000) 
		just = [ left top ] 
	} 
ENDSCRIPT

SCRIPT animate_joystick 
	IF NOT ScreenElementExists id = joystick_stick 
		RETURN 
	ENDIF 
	IF ( joystick_pushed = 1 ) 
		RETURN 
	ENDIF 
	change joystick_pushed = 1 
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
	change joystick_pushed = 0 
ENDSCRIPT

SCRIPT add_options_menu_sign_element icon_pos = PAIR(560.00000000000, 130.00000000000) icon_scale = 1.16999995708 icon_angle = 0.00000000000 
	IF NOT GotParam icon 
		
		RETURN 
	ENDIF 
	add_options_menu_sign_element 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		id = sign 
		texture = menu_sign 
		pos = PAIR(640.00000000000, 70.00000000000) 
		just = [ right top ] 
		rgba = [ 128 128 128 128 ] 
		z_priority = 0.50000000000 
		scale = 1.16999995708 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = current_menu_anchor 
		id = sign_icon 
		rot_angle = <icon_angle> 
		texture = <icon> 
		pos = <icon_pos> 
		just = [ right top ] 
		rgba = [ 128 128 128 128 ] 
		z_priority = 1 
		scale = <icon_scale> 
	} 
	IF NOT GotParam no_animate 
		generic_menu_animate_in force pos = PAIR(640.00000000000, 70.00000000000) menu = sign no_wait 
		generic_menu_animate_in force pos = <icon_pos> menu = sign_icon no_wait 
	ENDIF 
ENDSCRIPT


