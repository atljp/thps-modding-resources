
SCRIPT playmovie_script_temp 
ENDSCRIPT

play_mainmenu_attract_movie = 1 
SCRIPT playmovie_script 
	<anims_unloaded> = 0 
	<parts_pre_unloaded> = 0 
	<temp_pre_unloaded> = 0 
	IF LevelIs Load_MainMenu 
		IF ( play_mainmenu_attract_movie = 0 ) 
			RETURN 
		ENDIF 
		PauseObjects 
		<anims_unloaded> = 1 
		
		IF isNGC 
			IF InPreFile "skaterparts_temp.pre" 
				UnloadPreFile "skaterparts_temp.pre" 
				<temp_pre_unloaded> = 1 
			ENDIF 
		ELSE 
			IF InPreFile "skaterparts.pre" 
				UnloadPreFile "skaterparts.pre" 
				<parts_pre_unloaded> = 1 
			ENDIF 
			IF InPreFile "skaterparts_temp.pre" 
				UnloadPreFile "skaterparts_temp.pre" 
				<temp_pre_unloaded> = 1 
			ENDIF 
		ENDIF 
	ENDIF 
	mempushcontext 0 
	playmovie <...> 
	IF isXbox 
		<time> = 6.00000000000 
	ELSE 
		<time> = 4.50000000000 
	ENDIF 
	IF NOT isNGC 
		IF LevelIs Load_MainMenu 
			DisplayLoadingScreen "loadscrn_generic" <time> 
		ENDIF 
	ENDIF 
	mempopcontext 
	IF ( <anims_unloaded> = 1 ) 
		
		UnpauseObjects 
	ENDIF 
	IF ( <parts_pre_unloaded> = 1 ) 
		IF NOT LevelIs Load_MainMenu 
			script_assert "Can only unload skaterparts/play movies from skateshop (mainmenu) level" 
		ENDIF 
		IF NOT isNGC 
			LoadPreFile "skaterparts.pre" 
		ENDIF 
	ENDIF 
	IF ( <temp_pre_unloaded> = 1 ) 
		IF NOT isNGC 
			LoadPreFile "skaterparts_temp.pre" 
		ENDIF 
	ENDIF 
	IF ( <temp_pre_unloaded> = 1 ) 
		IF isNGC 
			LoadPreFile "skaterparts_temp.pre" use_bottom_up_heap 
		ENDIF 
	ENDIF 
	IF LevelIs Load_MainMenu 
		HideLoadingScreen 
	ENDIF 
ENDSCRIPT

SCRIPT ingame_play_movie 
	ingame_pre_movie_cleanup 
	mempushcontext 0 
	IF GotParam movies 
		GetArraySize <movies> 
		index = 0 
		BEGIN 
			playmovie ( <movies> [ <index> ] ) 
			index = ( <index> + 1 ) 
		REPEAT <array_size> 
	ELSE 
		playmovie <...> 
	ENDIF 
	mempopcontext 
	ingame_post_movie_cleanup <...> 
ENDSCRIPT

SCRIPT ingame_pre_movie_cleanup 
	DisplayLoadingScreen blank 
	goalmanager_levelunload 
	cleanup preserve_skaters 
	KillMessages 
ENDSCRIPT

SCRIPT ingame_post_movie_cleanup loading_screen = blank 
	mempushcontext 0 
	DisplayLoadingScreen <loading_screen> 
	mempopcontext 
	IF NOT GotParam level 
		GetCurrentLevel 
	ENDIF 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	change_level level = <level> 
	restore_start_key_binding 
ENDSCRIPT


