
thugpro_generic_save_info = [ 
	{ 
		Key = "PowerslideButton" 
		type = Checksum 
		load_func = thugpro_set_PowerslideButton 
		change_global = "powerslide_button" 
		default_value = Down_R2 
	} 
	{ 
		Key = "SwitchButton" 
		type = Checksum 
		load_func = thugpro_set_SwitchButton 
		change_global = "sc_button" 
		default_value = BLACK_WHITE 
	} 
	{ 
		Key = "ShoulderSpinButtons" 
		type = Checksum 
		change_global = "GLOBAL_ShoulderSpinButtons" 
		load_func = thugpro_set_ShoulderSpinButtons 
		default_value = L2_R2 
	} 
	{ 
		Key = "SpinTapsOn" 
		type = Int 
		change_global = "GLOBAL_SpinTapsOn" 
		default_value = 0 
		load_func = thugpro_set_spintaps 
	} 
	{ 
		Key = "SpinLagOn" 
		type = Int 
		change_global = "ENABLE_SPIN_LAG" 
		default_value = 1 
		load_func = thugpro_set_spinlag 
	} 
	{ 
		Key = "RailSpinOn" 
		type = Int 
		global_flag = FLAG_UG1RAILSPIN 
		default_value = 1 
	} 
	{ 
		Key = "StallsOn" 
		type = Int 
		global_flag = FLAG_STALLS 
		default_value = 1 
	} 
	{ 
		Key = "Walking_180FlipOn" 
		type = Int 
		change_global = "ENABLE_WALKING_180FLIP_SKATER" 
		default_value = 0 
	} 
	{ 
		Key = "LandPivotsOn" 
		type = Int 
		change_global = "LandPivotsOn" 
		default_value = 1 
	} 
	{ 
		Key = "Wallplant_OllieOn" 
		type = Int 
		change_global = "WALLPLANT_ALLOW_OLLIE" 
		default_value = 1 
	} 
	{ 
		Key = "BoostplantOn" 
		type = Int 
		change_global = "ENABLE_WALLRIDE_BOOSTPLANT" 
		default_value = 1 
	} 
	{ 
		Key = "DropDownDelayOn" 
		type = Int 
		change_global = "ENABLE_DROPDOWN_DELAY" 
		default_value = 0 
	} 
	{ 
		Key = "WallridePlantOn" 
		type = Int 
		change_global = "ENABLE_WALLRIDEPLANT" 
		default_value = 1 
	} 
	{ 
		Key = "ButtslapCounterOn" 
		type = Int 
		change_global = "ENABLE_BSCOUNTER" 
		default_value = 1 
	} 
	{ 
		Key = "PanelMessagesOn" 
		type = Int 
		change_global = "ENABLE_PANEL_MESSAGES" 
		default_value = 1 
	} 
	{ 
		Key = "NeuroplantCounterOn" 
		type = Int 
		change_global = "ENABLE_NEUROCOUNTER" 
		default_value = 1 
	} 
	{ 
		Key = "BoostplantCounterOn" 
		type = Int 
		change_global = "ENABLE_BPCOUNTER" 
		default_value = 1 
	} 
	{ 
		Key = "WRBMessageOn" 
		type = Int 
		change_global = "ENABLE_WRB_MESSAGE" 
		default_value = 1 
	} 
	{ 
		Key = "BonkMessageOn" 
		type = Int 
		change_global = "ENABLE_BONK_MESSAGE" 
		default_value = 1 
	} 
	{ 
		Key = "OneButtonSpineOn" 
		type = Int 
		load_func = THUGPRO_ToggleOneButtonSpine load_func_on_off 
		default_value = 0 
	} 
	{ 
		Key = "SpineKeyButtonA" 
		type = Checksum 
		load_func = thugpro_set_SpineKeyButtonA 
		default_value = L2 
	} 
	{ 
		Key = "SpineKeyButtonB" 
		type = Checksum 
		load_func = thugpro_set_SpineKeyButtonB 
		default_value = R2 
	} 
	{ 
		Key = "DriftEnabled" 
		type = Int 
		load_func = THUGPRO_ToggleDrift load_func_on_off 
		default_value = 1 
	} 
	{ 
		Key = "LadderGrabKey" 
		type = Checksum 
		load_func = set_ladder_grab_button 
		change_global = "ladder_grab_button" 
		default_value = R1 
	} 
	{ 
		Key = "CurrentTheme" 
		type = Checksum 
		load_func = thugpro_load_theme 
		default_value = thugpro 
	} 
	{ 
		Key = "consoleFontColor" 
		type = Checksum 
		change_global = "console_font_color" 
		default_value = text_color_c0 
	} 
	{ 
		Key = "consoleScale" 
		type = Float 
		change_global = "console_scale" 
		default_value = 0.60000002384 
	} 
	{ 
		Key = "consoleFontNew" 
		type = Checksum 
		change_global = "chat_font" 
		default_value = aventra 
	} 
	{ 
		Key = "consoleNumLines" 
		type = Int 
		change_global = "number_of_console_lines" 
		default_value = 6 
	} 
	{ 
		Key = "console_wait_time" 
		type = Int 
		change_global = "console_wait_time" 
		default_value = 50 
	} 
	{ 
		Key = "console_SpamFilter" 
		type = Int 
		change_global = "console_SpamFilter" 
		default_value = 1 
	} 
	{ 
		Key = "console_FormatFilter" 
		type = Int 
		change_global = "console_FormatFilter" 
		default_value = 1 
	} 
	{ 
		Key = "NO_DISPLAY_CHATWINDOW" 
		type = Int 
		global_flag = NO_DISPLAY_CHATWINDOW 
		default_value = 0 
	} 
	{ 
		Key = "UserSelectAction" 
		type = Int 
		load_func = thugpro_set_UserSelectAction 
		default_value = 0 
	} 
	{ 
		Key = "PressureStanceMode" 
		type = Int 
		load_func = thugpro_set_PressureStanceMode 
		change_global = "PressureStanceMode" 
		default_value = 1 
	} 
	{ 
		Key = "AirShuffleOn" 
		type = Int 
		change_global = "enable_air_shuffle" 
		default_value = 1 
	} 
	{ 
		Key = "ShowMultipliedScore" 
		type = Int 
		change_global = "display_multiplied_score" 
		default_value = 0 
		load_func = thugpro_set_ShowMultipliedScore 
	} 
	{ 
		Key = "ShowSpecialText" 
		type = Int 
		change_global = "display_SPECIAL_text" 
		default_value = 1 
		load_func = thugpro_set_ShowSpecialText 
	} 
	{ 
		Key = "WallplantOnly" 
		type = Int 
		change_global = "WALLPLANT_TRICK_OPTION" 
		default_value = 0 
		load_func = thugpro_set_wallplant_trick 
	} 
	{ 
		Key = "GameRunRespawns" 
		type = Int 
		change_global = "GameRunRespawns" 
		default_value = 1 
	} 
	{ 
		Key = "SkaterFlips" 
		type = Int 
		default_value = 1 
		load_func = THUGPRO_ToggleSkaterFlips load_func_on_off 
	} 
	{ 
		Key = "bs_enabled" 
		type = Int 
		default_value = 1 
		change_global = "THUGPRO_BS_Enabled" 
	} 
	{ 
		Key = "THUGWalkingPhysics" 
		type = Int 
		default_value = 0 
		load_func = THUGPRO_ToggleTHUGWalkingPhysics load_func_on_off 
	} 
	{ 
		Key = "WallplantWallrideCooldown" 
		type = Int 
		default_value = 1 
		load_func = THUGPRO_ToggleWallplantWallrideCooldown load_func_on_off 
	} 
	{ 
		Key = "CavemanWallrideCooldown" 
		type = Int 
		default_value = 1 
		load_func = THUGPRO_ToggleCavemanWallrideCooldown load_func_on_off 
	} 
	{ 
		Key = "CavemanWallplantCooldown" 
		type = Int 
		default_value = 1 
		load_func = THUGPRO_ToggleCavemanWallplantCooldown load_func_on_off 
	} 
	{ 
		Key = "WallrideSpinouts" 
		type = Int 
		change_global = "ENABLE_WALLRIDE_SPINS" 
		default_value = 0 
	} 
	{ 
		Key = "LipSpinouts" 
		type = Int 
		change_global = "ENABLE_LIP_SPINS" 
		default_value = 0 
	} 
	{ 
		Key = "LipTricks" 
		type = Int 
		change_global = "ENABLE_LIP_TRICKS" 
		default_value = 1 
		load_func = thugpro_set_lip_tricks 
	} 
	{ 
		Key = "NatasButtons" 
		type = Checksum 
		change_global = "natas_buttons" 
		default_value = L2_R2 
		load_func = thugpro_set_natas_buttons 
	} 
	{ 
		Key = "SpecialItems" 
		type = Int 
		change_global = "Toggle_Special_item" 
		default_value = 0 
	} 
	{ 
		Key = "grafftagon" 
		type = Int 
		change_global = "Toggle_Graffiti_Tags" 
		load_func = THUGPRO_ToggleTagging load_func_on_off 
		default_value = 1 
	} 
	{ 
		Key = "grafftagstyle" 
		type = Int 
		change_global = "Graffiti_Tag_style" 
		default_value = 0 
	} 
	{ 
		Key = "HighOlliesOn" 
		type = Int 
		change_global = "enable_high_ollies" 
		default_value = 1 
	} 
	{ 
		Key = "RevertButton" 
		type = Int 
		change_global = "skpro_revert_option_current" 
		load_func = thugpro_set_revert_button 
		default_value = 0 
	} 
	{ 
		Key = "AllowFocusMode" 
		type = Int 
		change_global = "skpro_bullettime_allowed" 
		default_value = 1 
	} 
	{ 
		Key = "DropdownButtonNew" 
		type = Int 
		change_global = "skpro_dropdown_option_current" 
		load_func = thugpro_set_dropdown_button 
		default_value = 1 
	} 
	{ 
		Key = "WallieplantInputMode" 
		type = Int 
		change_global = "WALLIEPLANT_INPUT_MODE" 
		default_value = 1 
	} 
	{ 
		Key = "BalanceIndicators" 
		type = Int 
		change_global = "display_balance_indicators" 
		default_value = 1 
	} 
	{ 
		Key = "ParkEdHacks" 
		type = Int 
		load_func = THUGPRO_ParkEdHacks load_func_on_off 
		default_value = 0 
	} 
	{ 
		Key = "HideObjectLabels" 
		type = Int 
		change_global = "GLOBAL_HideObjectLabels" 
		default_value = 0 
	} 
	{ 
		Key = "EnableBoardScuffs" 
		type = Int 
		change_global = "GLOBAL_EnableBoardScuffs" 
		default_value = 1 
	} 
	{ 
		Key = "NoBalanceMeters" 
		type = Int 
		global_flag = NO_DISPLAY_BALANCE 
		default_value = 0 
	} 
	{ 
		Key = "NoDisplayHud" 
		type = Int 
		global_flag = NO_DISPLAY_HUD 
		default_value = 0 
	} 
	{ 
		Key = "NoDisplayTrickString" 
		type = Int 
		global_flag = NO_DISPLAY_TRICKSTRING 
		default_value = 0 
	} 
	{ 
		Key = "NoDisplayBasescore" 
		type = Int 
		global_flag = NO_DISPLAY_BASESCORE 
		default_value = 0 
	} 
	{ 
		Key = "NoFreakout" 
		type = Int 
		global_flag = TANTRUM_OFF 
		default_value = 0 
	} 
	{ 
		Key = "NoNetNamesScores" 
		type = Int 
		global_flag = NO_DISPLAY_NET_SCORES 
		default_value = 0 
	} 
	{ 
		Key = "NoBlood" 
		type = Int 
		global_flag = BLOOD_OFF 
		default_value = 0 
	} 
	{ 
		Key = "TAP_BUTTONS_EXPLAINED" 
		type = Int 
		global_flag = TAP_BUTTONS_EXPLAINED 
		default_value = 0 
	} 
	{ 
		Key = "RECOVERY_BUTTONS_EXPLAINED" 
		type = Int 
		global_flag = RECOVERY_BUTTONS_EXPLAINED 
		default_value = 0 
	} 
	{ 
		Key = "VibrationOn" 
		type = Int 
		change_global = "GLOBAL_VibrationOn" 
		default_value = 1 
		load_func = thugpro_set_vibration 
	} 
	{ 
		Key = "AutoKickOn" 
		type = Int 
		change_global = "GLOBAL_AutoKickOn" 
		default_value = 1 
		load_func = thugpro_set_autokick 
	} 
	{ 
		Key = "AutoBrakeOn" 
		type = Int 
		change_global = "GLOBAL_AutoBrakeOn" 
		default_value = 1 
	} 
	{ 
		Key = "CtrlLayout" 
		type = Int_Settings 
		change_global = "GLOBAL_CtrlLayout" 
		default_value = 0 
	} 
	{ 
		Key = "StallButtonTrigger" 
		type = Checksum 
		load_func = thugpro_set_stall_button_trigger 
		default_value = R2 
	} 
	{ 
		Key = "ManualBoostplantOn" 
		type = Int 
		change_global = "ENABLE_MANUAL_BOOSTPLANT" 
		default_value = 1 
	} 
	{ 
		Key = "camera_angle" 
		type = Int 
		change_global = "skater_cam_0_mode" 
		default_value = 2 
		load_func = thugpro_set_cam_mode 
	} 
	{ 
		Key = "camera_fov_value" 
		type = Float 
		change_global = "camera_fov_value" 
		default_value = ( camera_fov_def ) 
		load_func = thugpro_set_cam_fov 
	} 
	{ 
		Key = "camera_aspect_mode" 
		type = Int 
		change_global = "camera_aspect_mode" 
		default_value = 0 
		load_func = thugpro_set_cam_aspect_mode 
	} 
	{ 
		Key = "Music_Mode" 
		type = Int 
		change_global = "GLOBAL_Music_Mode" 
		default_value = 0 
		load_func = thugpro_set_music_mode 
	} 
	{ 
		Key = "RandomSongOrder" 
		type = Int 
		global_flag = SOUNDS_SONGORDER_RANDOM 
		load_func = thugpro_set_song_order 
		default_value = 1 
	} 
	{ 
		Key = "SpecialSoundsOff" 
		type = Int 
		global_flag = SOUNDS_SPECIALSOUNDS_OFF 
		default_value = 0 
	} 
	{ 
		Key = "MusicBoxesOff" 
		type = Int 
		global_flag = SOUNDS_MUSICBOXES_OFF 
		default_value = 0 
	} 
	{ 
		Key = "MusicLevel" 
		type = Int 
		load_func = thugpro_set_sound_level 
		default_value = 50 
	} 
	{ 
		Key = "SoundLevel" 
		type = Int 
		load_func = thugpro_set_sound_level 
		default_value = 100 
	} 
	{ 
		Key = "SkaterVoiceOff" 
		type = Int 
		change_global = "GLOBAL_SkaterVoiceOff" 
		default_value = 1 
	} 
	{ 
		Key = "SkipTrackAtRuns" 
		type = Int 
		change_global = "GLOBAL_SkipTrackAtRuns" 
		default_value = 0 
	} 
	{ 
		Key = "MUSIC_IN_PAUSE_MENU" 
		type = Int 
		change_global = "MUSIC_IN_PAUSE_MENU" 
		default_value = 0 
	} 
	{ 
		Key = "ExtratrickSFX" 
		type = Checksum 
		change_global = "GLOBAL_ExtraTrickSFX" 
		load_func = thugpro_set_extratrick_sfx 
		default_value = THUG 
	} 
	{ 
		Key = "TP_GroundTerrainSFX" 
		type = Checksum 
		change_global = "GLOBAL_TP_GroundTerrainSFX" 
		load_func = thugpro_set_GroundTerrain_sfx 
		default_value = classic 
	} 
	{ 
		Key = "TP_RailSFX" 
		type = Checksum 
		change_global = "GLOBAL_TP_RailSFX" 
		load_func = thugpro_set_Rail_sfx 
		default_value = classic 
	} 
	{ 
		Key = "Taunt1" 
		type = String 
		default_value = "No Way" 
	} 
	{ 
		Key = "Taunt2" 
		type = String 
		default_value = "Who\'s your daddy?" 
	} 
	{ 
		Key = "Taunt3" 
		type = String 
		default_value = "Props" 
	} 
	{ 
		Key = "Taunt4" 
		type = String 
		default_value = "Come Get Some" 
	} 
] 
GLOBAL_VibrationOn = 1 
GLOBAL_SpinTapsOn = 0 
GLOBAL_ShoulderSpinButtons = L2_R2 
GLOBAL_AutoKickOn = 1 
GLOBAL_AutoBrakeOn = 1 
GLOBAL_HideObjectLabels = 0 
GLOBAL_CtrlLayout = 0 
GLOBAL_SkaterVoiceOff = 0 
GLOBAL_SkipTrackAtRuns = 0 
GLOBAL_EnableBoardScuffs = 1 
GLOBAL_ExtraTrickSFX = ExtraTrick 
GLOBAL_TP_GroundTerrainSFX = classic 
GLOBAL_TP_RailSFX = THUG 
SCRIPT thugpro_maybe_read_reg_key 
	IF GetRegKeyValue { Key = <Key> type = <type> } 
		thugpro_apply_read_reg_key <...> 
	ELSE 
		SetRegKeyValue { 
			Key = <Key> 
			type = <type> 
			value = <default_value> 
		} 
		wait 1 frames 
		thugpro_save_key_value { 
			Key = <Key> 
			type = <type> 
			value = <default_value> apply_changes 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_apply_read_reg_key 
	IF GotParam global_flag 
		IF ( <value> = 1 ) 
			SetGlobalFlag flag = <global_flag> 
		ELSE 
			UnSetGlobalFlag flag = <global_flag> 
		ENDIF 
	ENDIF 
	IF GotParam change_global 
		IF ( <type> = Int_Settings ) 
			SuperChange global = <change_global> value = <value> type = Int 
		ELSE 
			SuperChange global = <change_global> value = <value> type = <type> 
		ENDIF 
	ENDIF 
	IF GotParam load_func 
		IF GotParam load_func_flag 
			SpawnScript <load_func> params = { 
				Key = <Key> 
				<value> 
				<autoload> 
			} 
		ELSE 
			IF GotParam load_func_on_off 
				IF ( <value> = 1 ) 
					<load_func> on <autoload> 
				ELSE 
					<load_func> off <autoload> 
				ENDIF 
			ELSE 
				SpawnScript <load_func> params = { 
					Key = <Key> 
					value = <value> 
					<autoload> 
				} 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT GetKeyChecksum 
	FormatText ChecksumName = Checksum <...> 
	RETURN Key_Checksum = <Checksum> 
ENDSCRIPT

SCRIPT thugpro_save_key_value 
	IF GotParam dont_save 
		RETURN 
	ENDIF 
	IF RegKeyExist Key = <Key> 
		RemoveParameter index 
		GetIndexOfItemContainingInt { 
			array = thugpro_generic_save_info 
			name = Key 
			value = <Key> 
		} 
		wait 2 
		IF NOT GotParam index 
			RETURN 
		ENDIF 
		SetRegKeyValue { 
			Key = <Key> 
			type = ( ( thugpro_generic_save_info [ ( <index> ) ] ) . type ) 
			value = ( <value> ) 
		} 
		edmsg2 "%a, SAVED!! %v (%i)" a = <Key> v = <value> i = <index> 
		IF GotParam apply_changes 
			wait 2 
			SpawnScript thugpro_maybe_read_reg_key params = ( thugpro_generic_save_info [ <index> ] ) 
		ENDIF 
	ELSE 
		edmsg2 "key \'%a\' does not exist" a = <Key> 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_temp_key_value 
	IF RegKeyExist Key = <Key> 
		RemoveParameter index 
		GetIndexOfItemContainingInt { 
			array = thugpro_generic_save_info 
			name = Key 
			value = <Key> 
		} 
		wait 2 
		IF NOT GotParam index 
			RETURN 
		ENDIF 
		IF GotParam apply_changes 
			wait 2 
			SpawnScript thugpro_apply_read_reg_key params = { 
				( thugpro_generic_save_info [ <index> ] ) 
				value = <value> 
			} 
		ENDIF 
	ELSE 
		edmsg2 "key \'%a\' does not exist" a = <Key> 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_restore_key_value 
	IF RegKeyExist Key = <Key> 
		RemoveParameter index 
		GetIndexOfItemContainingInt { 
			array = thugpro_generic_save_info 
			name = Key 
			value = <Key> 
		} 
		wait 2 
		IF NOT GotParam index 
			RETURN 
		ENDIF 
		edmsg2 "%a, RESTORE!!(%i)" a = <Key> i = <index> 
		IF GotParam apply_changes 
			wait 2 
			SpawnScript thugpro_maybe_read_reg_key params = ( thugpro_generic_save_info [ <index> ] ) 
		ENDIF 
	ELSE 
		edmsg2 "key \'%a\' does not exist" a = <Key> 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_set_PressureStanceMode 
	IF GotParam value 
		set_pressure_stance_mode index = <value> 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_set_PowerslideButton 
	IF GotParam value 
		change_powerslide_assignment <value> no_menu dont_save 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_set_UserSelectAction 
	IF GotParam value 
		<userselect_options> = userselect_options 
		GetArraySize <userselect_options> 
		IF ( <value> > <array_size> ) 
			RemoveParameter value 
			<value> = 0 
		ENDIF 
		Change userselect_index = <value> 
		Change thugpro_userselect_action = ( ( ( <userselect_options> ) [ ( userselect_index ) ] ) . action ) 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_load_theme 
	IF GotParam value 
		thugpro_change_theme theme = <value> dont_save 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_set_SpineKeyButtonA 
	Change tp_c_spineButtonA = <value> 
	THUGPRO_BindSpineKeys buttonA = <value> buttonB = ( tp_c_spineButtonB ) 
ENDSCRIPT

SCRIPT thugpro_set_SpineKeyButtonB 
	Change tp_c_spineButtonB = <value> 
	THUGPRO_BindSpineKeys buttonA = ( tp_c_spineButtonA ) buttonB = <value> 
ENDSCRIPT

SCRIPT thugpro_set_SwitchButton 
	IF GotParam value 
		change_switch_control_assignment { <value> dont_save no_menu } 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_post_load_from_memory_card 
ENDSCRIPT

SCRIPT load_game_settings_from_memory_card 
ENDSCRIPT

thugpro_wait_test = 0 
SCRIPT thugpro_wait 
	BEGIN 
		IF IsTrue ( <ReadyVal> ) 
			BREAK 
		ENDIF 
		wait 1 gameframes 
	REPEAT 
ENDSCRIPT

SCRIPT thugpro_ControlOptions_back 
	dialog_box_exit 
	create_control_setup_menu 
ENDSCRIPT

SCRIPT thugpro_ControlOptions_UsePreset 
	dialog_box_exit 
	SWITCH <preset> 
		CASE default 
			edmsg2 "selected default preset" 
			Change tp_c_spineButtonA = L2 
			Change tp_c_spineButtonB = R2 
			thugpro_save_key_value Key = "ShoulderSpinButtons" value = L2_R2 apply_changes 
			thugpro_save_key_value Key = "OneButtonSpineOn" value = 0 apply_changes 
			thugpro_save_key_value Key = "SpineKeyButtonA" value = ( tp_c_spineButtonA ) apply_changes 
			thugpro_save_key_value Key = "SpineKeyButtonB" value = ( tp_c_spineButtonB ) apply_changes 
			thugpro_save_key_value Key = "SwitchButton" value = BLACK_WHITE apply_changes 
			thugpro_save_key_value Key = "SpinTapsON" value = 1 apply_changes 
		CASE ps2 
			edmsg2 "selected ps2 preset" 
			Change tp_c_spineButtonA = L2 
			Change tp_c_spineButtonB = R2 
			thugpro_save_key_value Key = "ShoulderSpinButtons" value = L1_R1 apply_changes 
			thugpro_save_key_value Key = "OneButtonSpineOn" value = 1 apply_changes 
			thugpro_save_key_value Key = "SpineKeyButtonA" value = ( tp_c_spineButtonA ) apply_changes 
			thugpro_save_key_value Key = "SpineKeyButtonB" value = ( tp_c_spineButtonB ) apply_changes 
			thugpro_save_key_value Key = "SwitchButton" value = L1_R1 apply_changes 
		DEFAULT 
	ENDSWITCH 
	Change thugpro_wait_test = 1 
	IF GotParam return_to_menu 
		create_control_setup_menu 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_set_ViewerMode 
ENDSCRIPT

SCRIPT thugpro_set_ShowMultipliedScore 
	IF ( display_multiplied_score = 0 ) 
		ShowMultipliedScore off 
	ELSE 
		ShowMultipliedScore on 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_set_ShowSpecialText 
	IF ScreenElementExists id = the_special_bar_special 
		IF IsTrue display_SPECIAL_text 
			SetScreenElementProps { id = the_special_bar_special alpha = ( ( THUGPRO_GlobalThemeInfo ) . SPECIAL_TEXT_ALPHA ) } 
		ELSE 
			SetScreenElementProps { id = the_special_bar_special alpha = 0.00000000000 } 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_set_wallplant_trick 
	SWITCH ( WALLPLANT_TRICK_OPTION ) 
		CASE 0 
			THUGPRO_SetWallPlantParams params = 0 
			Change Physics_Wallplant_Min_Approach_Angle = 50 
			Change Physics_Wallplant_Speed_Loss = 125 
			THUGPRO_ToggleSticker on 
		CASE 1 
			THUGPRO_SetWallPlantParams params = 1 
			Change Physics_Wallplant_Min_Approach_Angle = 20 
			Change Physics_Wallplant_Speed_Loss = 225 
			THUGPRO_ToggleSticker off 
		CASE 2 
			THUGPRO_SetWallPlantParams params = 2 
			Change Physics_Wallplant_Min_Approach_Angle = 20 
			Change Physics_Wallplant_Speed_Loss = 225 
			THUGPRO_ToggleSticker off 
		CASE 3 
			THUGPRO_SetWallPlantParams params = 3 
			Change Physics_Wallplant_Min_Approach_Angle = 50 
			Change Physics_Wallplant_Speed_Loss = 125 
			THUGPRO_ToggleSticker on 
		CASE 4 
			THUGPRO_SetWallPlantParams params = 4 
			Change Physics_Wallplant_Min_Approach_Angle = 50 
			Change Physics_Wallplant_Speed_Loss = 125 
			THUGPRO_ToggleSticker off 
	ENDSWITCH 
ENDSCRIPT

SCRIPT thugpro_set_sound_level 
	SWITCH <Key> 
		CASE "MusicLevel" 
			SetMusicVolume <value> 
			Change MusicVolOutsideBox = <value> 
			Change FadeTempMusicVol = <value> 
		CASE "SoundLevel" 
			SetSfxVolume <value> 
	ENDSWITCH 
ENDSCRIPT

SCRIPT thugpro_set_song_order 
	StopMusic 
	IF GetGlobalFlag flag = SOUNDS_SONGORDER_RANDOM 
		SetRandomMode 1 
	ELSE 
		SetRandomMode 0 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_set_vibration 
	get_skater_number 
	num = <skater_number> 
	IF IsTrue GLOBAL_VibrationOn 
		VibrationOn <num> 
	ELSE 
		VibrationOff <num> 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_set_ShoulderSpinButtons 
	IF GotParam value 
		SWITCH <value> 
			CASE L2_R2 
				THUGPRO_SetSkaterPhysicsParams { spin_button_left = L2 spin_button_right = R2 shoulder_spin_enabled = 1 } 
			CASE L1_R1 
				THUGPRO_SetSkaterPhysicsParams { spin_button_left = L1 spin_button_right = R1 shoulder_spin_enabled = 1 } 
			CASE R1_R2 
				THUGPRO_SetSkaterPhysicsParams { spin_button_left = R2 spin_button_right = R1 shoulder_spin_enabled = 1 } 
			CASE L1_L2 
				THUGPRO_SetSkaterPhysicsParams { spin_button_left = L2 spin_button_right = L1 shoulder_spin_enabled = 1 } 
			CASE disabled 
				THUGPRO_SetSkaterPhysicsParams { shoulder_spin_enabled = 0 } 
		ENDSWITCH 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_set_spintaps 
	IF GotParam value 
		THUGPRO_SetSkaterPhysicsParams spin_taps_enabled = <value> 
		Change GLOBAL_SpinTapsOn = <value> 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_set_spinlag 
	IF IsTrue ENABLE_Spin_Lag 
		Change skater_xbox_shoulder_turn_no_rotate_time = 500 
	ELSE 
		Change skater_xbox_shoulder_turn_no_rotate_time = 0 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_set_autokick 
	IF IsTrue GLOBAL_AutoKickOn 
		THUGPRO_AutoKick on 
	ELSE 
		THUGPRO_AutoKick off 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_set_cam_mode 
	IF ObjectExists id = skatercam0 
		skatercam0 : sc_setmode mode = <value> 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_set_cam_fov 
	IF GotParam value 
		THUGPRO_SetProxyGlobal global = gCameraFOV value = <value> 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_set_cam_aspect_mode 
	IF GotParam value 
		THUGPRO_SetProxyGlobal global = gAspectMode value = <value> 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_set_natas_buttons 
	THUGPRO_SetNatasSpinTriggers ( natas_buttons ) 
ENDSCRIPT

SCRIPT thugpro_set_lip_tricks 
	IF IsTrue ENABLE_LIP_TRICKS 
		THUGPRO_ToggleLipTricks on 
	ELSE 
		THUGPRO_ToggleLipTricks off 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_set_music_mode 
	IF IsTrue GLOBAL_Music_Mode 
		SetCDToMusic 
	ELSE 
		SetCDToAmbient 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_set_stall_button_trigger 
	IF GotParam value 
		IF ( <value> = R1 ) 
			Change GLOBAL_StallButtonTrigger = White 
		ELSE 
			Change GLOBAL_StallButtonTrigger = <value> 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_set_revert_button 
	IF GotParam value 
		set_revert_button index = <value> 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_set_dropdown_button 
	IF GotParam value 
		set_dropdown_button index = <value> 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_set_extratrick_sfx 
	IF GotParam value 
		SWITCH <value> 
			CASE THUG 
				Change GLOBAL_ExtraTrickSFX = ExtraTrick 
			CASE THPS4 
				Change GLOBAL_ExtraTrickSFX = extratrick_THPS4 
		ENDSWITCH 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_set_GroundTerrain_sfx 
	IF GotParam value 
		SWITCH <value> 
			CASE classic 
				Change GLOBAL_TP_GroundTerrainSFX = classic 
				Change TA_REVERT_CONC_UG2_CHANCE = 1 
				Change TA_REVERT_CONC_AW_CHANCE = 0 
				Change TA_LAND_CONC_UG2_CHANCE = 1 
				Change TA_LAND_CONC_AW_CHANCE = 0 
				Change TA_OLLIE_CONC_UG2_CHANCE = 8 
				Change TA_OLLIE_CONC19_UG2_CHANCE = 1 
				Change TA_OLLIE_CONC_AW_CHANCE = 0 
				Change TA_OLLIE_CONC19_AW_CHANCE = 0 
			CASE THAW 
				Change GLOBAL_TP_GroundTerrainSFX = THAW 
				Change TA_REVERT_CONC_UG2_CHANCE = 0 
				Change TA_REVERT_CONC_AW_CHANCE = 1 
				Change TA_LAND_CONC_UG2_CHANCE = 0 
				Change TA_LAND_CONC_AW_CHANCE = 1 
				Change TA_OLLIE_CONC_UG2_CHANCE = 0 
				Change TA_OLLIE_CONC19_UG2_CHANCE = 0 
				Change TA_OLLIE_CONC_AW_CHANCE = 8 
				Change TA_OLLIE_CONC19_AW_CHANCE = 1 
		ENDSWITCH 
	ENDIF 
ENDSCRIPT

SCRIPT thugpro_set_Rail_sfx 
	IF GotParam value 
		SWITCH <value> 
			CASE classic 
				Change ( ( GLOBAL_TP_RailSFX ) = classic ) 
				Change TA_GRIND_SFX_THUG_CHANCE = 0 
				Change TA_GRIND_SFX_CLASSIC_CHANCE = 1 
			CASE THAW 
				Change ( ( GLOBAL_TP_RailSFX ) = THUG ) 
				Change TA_GRIND_SFX_THUG_CHANCE = 1 
				Change TA_GRIND_SFX_CLASSIC_CHANCE = 0 
		ENDSWITCH 
	ENDIF 
ENDSCRIPT


