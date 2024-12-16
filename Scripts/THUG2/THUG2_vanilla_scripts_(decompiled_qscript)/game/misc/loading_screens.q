
SCRIPT startup_loading_screen 
	intro_movie = "movies\\intro" 
	IF IsPal 
		IF NOT English 
			intro_movie = "movies\\introf" 
		ENDIF 
	ENDIF 
	IF NOT Bootstrap 
		IF IsPS2 
			IF CD 
				Displayloadingscreen blank 
				PlayMovie "movies\\atvi" 
				PlayMovie "movies\\nslogo" 
				PlayMovie "movies\\Beenox_Shift" 
				PlayMovie <intro_movie> 
			ENDIF 
		ENDIF 
	ENDIF 
	IF IsXbox 
		IF CD 
			IF NOT IsInternetGameHost 
				IF NOT IsJoiningInternetGame 
					PlayMovie "movies\\Intel_intro" 
					PlayMovie "movies\\Dolby_Digital" 
					PlayMovie "movies\\atvi" 
					PlayMovie "movies\\nslogo" 
					PlayMovie "movies\\Beenox_Shift" 
					PlayMovie <intro_movie> 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	IF IsNgc 
		IF CD 
			PlayMovie "movies\\atvi" 
			PlayMovie "movies\\nslogo" 
			PlayMovie "movies\\Beenox_Shift" 
			PlayMovie <intro_movie> 
		ENDIF 
	ENDIF 
	IF Bootstrap 
		Displayloadingscreen "loadscrn_demo" 
	ELSE 
		IF IsXbox 
			Displayloadingscreen "loadscrn" 
		ENDIF 
		IF IsNgc 
			Displayloadingscreen "loadscrn_ngc" 
		ENDIF 
		IF IsPS2 
		ENDIF 
	ENDIF 
ENDSCRIPT

ANY_LEVEL_LOADED_YET = 0 
loadscreen_last_game_mode = career 
parked_loading_screen_in_use = 0 
SCRIPT parked_loading_screen_show 
	IF NOT IsXbox 
		RETURN 
	ENDIF 
	IF NOT LevelIs load_sk5ed 
		IF NOT LevelIs load_sk5ed_gameplay 
			RETURN 
		ENDIF 
	ENDIF 
	SWITCH <level> 
		CASE load_tr 
			level_struct = level_tr 
		CASE load_bo 
			level_struct = level_bo 
		CASE load_ba 
			level_struct = level_ba 
		CASE load_be 
			level_struct = level_be 
		CASE load_au 
			level_struct = level_au 
		CASE load_no 
			level_struct = level_no 
		CASE load_st 
			level_struct = level_st 
		CASE load_se 
			level_struct = level_se 
		CASE load_se2 
			level_struct = level_se2 
		CASE load_dj 
			level_struct = level_dj 
		CASE load_ap 
			level_struct = level_ap 
		CASE load_ca 
			level_struct = level_ca 
		CASE load_ph 
			level_struct = level_ph 
		CASE load_la 
			level_struct = level_la 
		CASE load_sc 
			level_struct = level_sc 
		CASE load_mainmenu 
			level_struct = level_mainmenu 
		CASE load_sk5ed 
		CASE load_sk5ed_gameplay 
			GetEditorTheme 
			GenerateLevelStructureNameFromTheme theme = <theme> 
			level_struct = <structure_name> 
			IF ChecksumEquals a = <level> b = load_sk5ed 
				screen = "loadscrn_editor_x" 
			ELSE 
				screen = "loadscrn_created" 
			ENDIF 
		DEFAULT 
			printstruct <...> 
			script_assert "UPDATE THE SWITCH IN parked_loading_screen_show!" 
			screen = "loadscrn_generic" 
	ENDSWITCH 
	IF NOT GotParam screen 
		screen = ( <level_struct> . loading_screen ) 
		IF NOT GotParam screen 
			screen = "loadscrn_editor_x" 
		ENDIF 
	ENDIF 
	time = ( <level_struct> . loading_time_xbox ) 
	IF NOT GotParam time 
		time = ( ( <level_struct> . loading_time ) * 0.60000002384 ) 
	ENDIF 
	Sk6Ed_GetParkEdExtraLoadtime 
	printstruct <...> 
	Displayloadingscreen <screen> ( <time> + <ExtraTime> ) 
	change parked_loading_screen_in_use = 1 
ENDSCRIPT

SCRIPT parked_loading_screen_clear 
	change parked_loading_screen_in_use = 0 
ENDSCRIPT

SCRIPT load_level_handle_loading_screen 
	IF IsTrue parked_loading_screen_in_use 
		parked_loading_screen_clear 
		RETURN 
	ENDIF 
	IF IsXbox 
		IF GotParam loading_time_xbox 
			<loading_time> = <loading_time_xbox> 
		ELSE 
			<loading_time> = ( <loading_time> * 0.60000002384 ) 
		ENDIF 
	ELSE 
		IF ( ANY_LEVEL_LOADED_YET = 0 ) 
			<loading_time> = ( <loading_time> + 0 ) 
		ENDIF 
	ENDIF 
	GetGameMode 
	IF IsTrue Bootstrap_build 
		<loading_screen> = "loadscrn_demo_controls" 
		<loading_time> = 27 
	ELSE 
		IF GotParam loading_screen 
			IF EnteringNetGame 
				<GameMode> = net 
				IF OnServer 
					IF IsXbox 
						<loading_screen> = "loadscrn_system_link_x" 
					ELSE 
						<loading_screen> = "loadscrn_Online" 
					ENDIF 
				ELSE 
					IF IsXbox 
						<loading_screen> = "loadscrn_system_x" 
					ELSE 
						<loading_screen> = "loadscrn_Online2" 
					ENDIF 
				ENDIF 
			ELSE 
				IF InSplitScreenGame 
					<loading_screen> = "loadscrn_2player" 
				ELSE 
					SWITCH <load_script> 
						CASE load_mainmenu 
							IF ( ANY_LEVEL_LOADED_YET = 1 ) 
								IF IsPS2 
									SWITCH ( loadscreen_last_game_mode ) 
										CASE career 
											<random_screen_num> = RANDOM(1, 1, 1, 1, 1, 1) RANDOMCASE 1 RANDOMCASE 3 RANDOMCASE 4 RANDOMCASE 5 RANDOMCASE 6 RANDOMCASE 7 RANDOMEND 
										CASE classic 
											<random_screen_num> = RANDOM(1, 1, 1, 1, 1, 1) RANDOMCASE 1 RANDOMCASE 2 RANDOMCASE 3 RANDOMCASE 4 RANDOMCASE 5 RANDOMCASE 6 RANDOMEND 
										CASE singlesession 
											<random_screen_num> = RANDOM(1, 1, 1, 1, 1, 1, 1) RANDOMCASE 1 RANDOMCASE 2 RANDOMCASE 3 RANDOMCASE 4 RANDOMCASE 5 RANDOMCASE 6 RANDOMCASE 7 RANDOMEND 
										CASE net 
											<random_screen_num> = RANDOM(1, 1, 1, 1, 1, 1) RANDOMCASE 1 RANDOMCASE 2 RANDOMCASE 3 RANDOMCASE 5 RANDOMCASE 6 RANDOMCASE 7 RANDOMEND 
										CASE creategoals 
											<random_screen_num> = RANDOM(1, 1, 1, 1) RANDOMCASE 2 RANDOMCASE 3 RANDOMCASE 4 RANDOMCASE 7 RANDOMEND 
									ENDSWITCH 
								ELSE 
									SWITCH ( loadscreen_last_game_mode ) 
										CASE career 
											<random_screen_num> = RANDOM(1, 1, 1, 1, 1) RANDOMCASE 1 RANDOMCASE 3 RANDOMCASE 5 RANDOMCASE 6 RANDOMCASE 7 RANDOMEND 
										CASE classic 
											<random_screen_num> = RANDOM(1, 1, 1, 1, 1) RANDOMCASE 1 RANDOMCASE 2 RANDOMCASE 3 RANDOMCASE 5 RANDOMCASE 6 RANDOMEND 
										CASE singlesession 
											<random_screen_num> = RANDOM(1, 1, 1, 1, 1, 1) RANDOMCASE 1 RANDOMCASE 2 RANDOMCASE 3 RANDOMCASE 5 RANDOMCASE 6 RANDOMCASE 7 RANDOMEND 
										CASE net 
											<random_screen_num> = RANDOM(1, 1, 1, 1, 1, 1) RANDOMCASE 1 RANDOMCASE 2 RANDOMCASE 3 RANDOMCASE 5 RANDOMCASE 6 RANDOMCASE 7 RANDOMEND 
										CASE creategoals 
											<random_screen_num> = RANDOM(1, 1, 1) RANDOMCASE 2 RANDOMCASE 3 RANDOMCASE 7 RANDOMEND 
									ENDSWITCH 
								ENDIF 
								IF GotParam random_screen_num 
									FormatText textname = loading_screen "loadscrn_generic_%i" i = <random_screen_num> 
								ENDIF 
							ENDIF 
						CASE Load_Default 
						CASE Load_EmptyDefault 
						CASE Load_TestLevel 
							printf "Generic loading screen" 
						DEFAULT 
							IF NOT StringEquals a = <loading_screen> b = "loadscrn_generic" 
								SWITCH <GameMode> 
									CASE career 
										GetCurrentChapterInfo 
										IF ( <load_script> = load_se ) 
											level = load_se 
										ENDIF 
										IF ( <load_script> = <level> ) 
											<loading_screen> = ( <loading_screen> + "_story" ) 
										ENDIF 
									CASE classic 
										<loading_screen> = ( <loading_screen> + "_classic" ) 
									DEFAULT 
								ENDSWITCH 
							ENDIF 
					ENDSWITCH 
					IF ( launch_to_createatrick = 1 ) 
						IF IsXbox 
							<loading_screen> = "loadscrn_trick_x" 
						ELSE 
							IF IsNgc 
								<loading_screen> = "loadscrn_trick_ngc" 
							ELSE 
								<loading_screen> = "loadscrn_trick" 
							ENDIF 
						ENDIF 
					ENDIF 
				ENDIF 
			ENDIF 
		ELSE 
			<loading_screen> = "loadscrn_generic" 
			RemoveParameter loading_time 
		ENDIF 
	ENDIF 
	Displayloadingscreen <loading_screen> <loading_time> 
	change ANY_LEVEL_LOADED_YET = 1 
	change loadscreen_last_game_mode = <GameMode> 
ENDSCRIPT

SCRIPT Bootstrap_displayscreen screen = "loadscrn_demo_controls" 
	IF ObjectExists id = startup_menu 
		DestroyScreenElement id = startup_menu 
	ENDIF 
	IF ObjectExists id = ns_rules 
		DestroyScreenElement id = ns_rules 
	ENDIF 
	make_new_menu menu_id = screen_menu 
	SetScreenElementProps { 
		id = root_window 
		event_handlers = [ { pad_start exit_screen_menu } ] 
		replace_handlers 
	} 
	SetScreenElementProps { 
		id = screen_menu 
		event_handlers = [ { pad_start exit_screen_menu } 
			{ pad_choose exit_screen_menu } 
			{ pad_back exit_screen_menu } 
			{ pad_circle exit_screen_menu } 
			{ pad_square exit_screen_menu } 
		] 
		replace_handlers 
	} 
	FireEvent type = focus target = screen_menu 
	Displayloadingscreen <screen> 
ENDSCRIPT


