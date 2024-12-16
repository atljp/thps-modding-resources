
Desc_Controls_CharLimit = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" 
Desc_Controls_AirShuffle = "Toggle AirShuffle. Get off board, up + up + jump. Performs an in-air jump." 
Desc_Controls_AutoBrake = "If the skater should brake automatically when you\'re in a game menu." 
Desc_Controls_AutoKick = "If disabled, you need to press flip (\\b1) to gain speed." 
Desc_Controls_BankDrop = "Allows you to drop onto angled surfaces like kickers and banks." 
Desc_Controls_Boostplant = "Enables the WalliePlant input buffer exploit." 
Desc_Controls_Buttslap = "Toggle trick late jump exploit. Performs a jump boost." 
Desc_Controls_Drift = "Toggle horizontal & vertical movement control in off-board air state." 
Desc_Controls_Dropdown = "Change control binding for rail dropdowns." 
Desc_Controls_DropDownSpinDelay = "Toggle spin delay for rail dropdowns." 
Desc_Controls_FlipRoll = "Toggle aerial flip controls." 
Desc_Controls_Freakouts = "Enable the freakout meter that appears after bailing." 
Desc_Controls_GraffitiTags = "Change graffiti tag style. In walking mode, press grind (\\b0) when near a wall to spray paint." 
Desc_Controls_HighOllie = "Allows you to perform a high ollie by quickly pressing jump after an ollie." 
Desc_Controls_LadderGrab = "Change control binding for grabbing rails or ladders in off-board state." 
Desc_Controls_LandPivot = "Allows you to do a pivot when you land from normal air state. Similar to the Revert." 
Desc_Controls_LipSpin = "Allows you continue your rotation when doing a lip trick." 
Desc_Controls_NatasSpin = "Change control binding for natas spinning on poles or hydrants." 
Desc_Controls_OffBoardButtons = "Change control binding for getting on and off the board/walking control." 
Desc_Controls_PowerSlide = "Change control binding for 180 powerslides. Performs a quick 180 while on ground." 
Desc_Controls_RailSpin = "Allows you continue your rotation when starting a new grind." 
Desc_Controls_Revert = "Change control binding for Revert. Allows you continue your combo when landing from vert air." 
Desc_Controls_ShoulderSpin = "Change control binding for shoulder spins/in air rotation." 
Desc_Controls_ShoulderSpinLag = "Toggle shoulder spin/in air rotation delay. The amount of time before rotation starts." 
Desc_Controls_ShoulderSpinTaps = "Toggle 180 degree shoulder spins/in air rotation." 
Desc_Controls_SpineDropButtons = "Change control binding for Spine Transfer and Acid Drop." 
Desc_Controls_StallButtons = "Toggle rail stall button controls." 
Desc_Controls_Stalls = "Toggle rail stalls." 
Desc_Controls_StanceToggleMode = "Change control binding for skater switch or regular stance." 
Desc_Controls_THUGWalkPhysics = "Enables THUG1-style walking physics." 
Desc_Controls_WalkSpin = "Allows you continue your rotation when switching to off-board state." 
Desc_Controls_Wallplant = "Change Wallplant & Sticker Slap control binding." 
Desc_Controls_WallSpin = "This lets you continue your rotation while performing a Wallride." 
Desc_Controls_Wallsuffle = "Enables the Wallride shuffle exploit." 
Desc_Controls_WPCavemanCooldown = "Toggle the Wallplant cooldown when going from off-board state to skating." 
Desc_Controls_WPLateOllie = "Allows you to do a late jump after Wallplants/Sticker Slap" 
Desc_Controls_WPWRCooldown = "Toggle the Wallride cooldown after doing a Wallplant." 
Desc_Controls_WRPlants = "Allows you to angled Wallride plants." 
Desc_Controls_WalliePlantInput = "Change input mode for WalliePlants and BoostPlants." 
Desc_Controls_LipTricks = "Toggle lip tricks." 
THUGPRO_PS2ButtonsOn = 0 
dd_button = R2 
sc_button = R1 
wp_button = X_button 
natas_buttons = L2_R2 
spinkey_button = L2_R2 
ENABLE_SPIN_LAG = 1 
spinekey_button = L2_and_R2 
tp_c_spineButtonA = l2 
tp_c_spineButtonB = R2 
ladder_grab_button_array = [ R1 , L1 , R2 , l2 , l3 ] 
ladder_grab_button = R1 
PressureStanceMode = 1 
ShoulderSpinButton_Options = [ L2_R2 L1_R1 R1_R2 L1_L2 Disabled ] 
powerslide_button = DownDown_R2 
landpivotson = 0 
enable_high_ollies = 1 
WALLIEPLANT_INPUT_MODE = 0 
skpro_toggle_stance_option_current = 1 
skpro_toggle_stance_options = [ 
	{ 
		text = "Toggle (\\be)" 
		triggers = [ 
			{ Trigger = { Press , l2 , 20 } Scr = ToggleNollieRegular } 
			{ } 
		] 
	} 
	{ 
		text = "Hold & Release (\\be)" 
		triggers = [ 
			{ Trigger = { Press , l2 , 20 } Scr = ToggleNollieRegular } 
			{ Trigger = { Release , l2 , 20 } Scr = ToggleNollieRegular Params = { Nollie = 1 } } 
		] 
	} 
	{ 
		text = "Disabled" 
		triggers = [ 
			{ } 
			{ } 
		] 
	} 
] 
skpro_revert_option_current = 0 
skpro_revert_options = [ 
	{ 
		text = "\\be / \\bf (L2 / R2)" 
		id = L2_R2 
		triggers = [ 
			{ Trigger = { Press , R2 , 200 } Scr = Revert } 
			{ Trigger = { Press , l2 , 200 } Scr = Revert } 
		] 
	} 
	{ 
		text = "\\bg / \\bh (L1 / R1)" 
		id = L1_R1 
		triggers = [ 
			{ Trigger = { Press , Black , 200 } Scr = Revert } 
			{ Trigger = { Press , White , 200 } Scr = Revert } 
		] 
	} 
	{ 
		text = "\\be + \\bf (L2 + R2)" 
		id = L2_and_R2 
		triggers = [ 
			{ Trigger = { PressTwoAnyOrder , R2 , l2 , 200 } Scr = Revert } 
			{ } 
		] 
	} 
	{ 
		text = "\\bg + \\bh (L1 + R1)" 
		id = L1_and_R1 
		triggers = [ 
			{ Trigger = { PressTwoAnyOrder , Black , White , 200 } Scr = Revert } 
			{ } 
		] 
	} 
	{ 
		text = "\\be (L2)" 
		id = l2 
		triggers = [ 
			{ Trigger = { Press , l2 , 200 } Scr = Revert } 
			{ } 
		] 
	} 
	{ 
		text = "\\bf (R2)" 
		id = R2 
		triggers = [ 
			{ Trigger = { Press , R2 , 200 } Scr = Revert } 
			{ } 
		] 
	} 
	{ 
		text = "\\bg (L1)" 
		id = L1 
		triggers = [ 
			{ Trigger = { Press , Black , 200 } Scr = Revert } 
			{ } 
		] 
	} 
	{ 
		text = "\\bh (R1)" 
		id = R1 
		triggers = [ 
			{ Trigger = { Press , White , 200 } Scr = Revert } 
			{ } 
		] 
	} 
	{ 
		text = "\\bl (Focus / L3)" 
		id = l3 
		triggers = [ 
			{ Trigger = { Press , l3 , 200 } Scr = Revert } 
			{ } 
		] 
	} 
	{ 
		text = "Custom (Swivel Lock / R3)" 
		id = R3 
		triggers = [ 
			{ Trigger = { Press , R3 , 200 } Scr = Revert } 
			{ } 
		] 
	} 
] 
skpro_dropdown_option_current = 0 
skpro_dropdown_options = [ 
	{ 
		text = "\\be (L2)" 
		id = l2 
		triggers = [ 
			{ Trigger = { Press , l2 , 100 } Scr = SkateInOrBail Params = { GrindRelease GrindBail = Airborne } } 
			{ } 
		] 
	} 
	{ 
		text = "\\bf (R2)" 
		id = R2 
		triggers = [ 
			{ Trigger = { Press , R2 , 100 } Scr = SkateInOrBail Params = { GrindRelease GrindBail = Airborne } } 
			{ } 
		] 
	} 
	{ 
		text = "\\bg (L1)" 
		id = L1 
		triggers = [ 
			{ Trigger = { Press , Black , 100 } Scr = SkateInOrBail Params = { GrindRelease GrindBail = Airborne } } 
			{ } 
		] 
	} 
	{ 
		text = "\\bh (R1)" 
		id = R1 
		triggers = [ 
			{ Trigger = { Press , White , 100 } Scr = SkateInOrBail Params = { GrindRelease GrindBail = Airborne } } 
			{ } 
		] 
	} 
	{ 
		text = "\\be / \\bf (L2 / R2)" 
		id = L2_R2 
		triggers = [ 
			{ Trigger = { Press , R2 , 100 } Scr = SkateInOrBail Params = { GrindRelease TriggerRight GrindBail = Airborne } } 
			{ Trigger = { Press , l2 , 100 } Scr = SkateInOrBail Params = { GrindRelease TriggerLeft GrindBail = Airborne } } 
		] 
	} 
	{ 
		text = "\\bg / \\bh (L1 / R1)" 
		id = L1_R1 
		triggers = [ 
			{ Trigger = { Press , Black , 100 } Scr = SkateInOrBail Params = { GrindRelease TriggerLeft GrindBail = Airborne } } 
			{ Trigger = { Press , White , 100 } Scr = SkateInOrBail Params = { GrindRelease TriggerRight GrindBail = Airborne } } 
		] 
	} 
	{ 
		text = "\\be + \\bf (L2 + R2)" 
		id = L2_and_R2 
		triggers = [ 
			{ Trigger = { PressTwoAnyOrder , R2 , l2 , 400 } Scr = SkateInOrBail Params = { GrindRelease GrindBail = Airborne } } 
			{ } 
		] 
	} 
	{ 
		text = "\\bg + \\bh (L1 + R1)" 
		id = L1_and_R1 
		triggers = [ 
			{ Trigger = { PressTwoAnyOrder , Black , White , 400 } Scr = SkateInOrBail Params = { GrindRelease GrindBail = Airborne } } 
			{ } 
		] 
	} 
] 
SCRIPT create_control_setup_menu 
	IF LevelIs Load_mainmenu 
		pad_back_script = create_setup_options_menu 
	ELSE 
		pad_back_script = create_options_menu 
	ENDIF 
	thugpro_menu_create { 
		menu_base_id = control_setup 
		menu_title = "Control Options" 
		menu_style = MENU_STYLE_LEFT 
		pad_back_script = <pad_back_script> 
		helper_text = generic_helper_text_toggle 
		show_description_panel 
		show_gradient 
	} 
	make_thugpro_menu_item { 
		id = in_air_menu_item 
		text = "In Air" 
		child_texture = icon_general 
		pad_choose_script = create_inair_setup_menu 
	} 
	make_thugpro_menu_item { 
		id = on_ground_menu_item 
		text = "On Ground" 
		child_texture = icon_general 
		pad_choose_script = create_onground_setup_menu 
	} 
	make_thugpro_menu_item { 
		id = grind_setup_menu_item 
		text = "On Rails" 
		pad_choose_script = create_grind_setup_menu 
		child_texture = icon_rail 
	} 
	make_thugpro_menu_item { 
		id = walltricks_setup_menu_item 
		text = "Wallplants & Wallrides" 
		child_texture = icon_wall 
		pad_choose_script = create_walltricks_setup_menu 
	} 
	make_thugpro_menu_item { 
		id = walking_setup_menu_item 
		text = "Walk & State Transition" 
		child_texture = icon_general 
		pad_choose_script = create_walking_setup_menu 
	} 
	make_thugpro_menu_item { 
		id = preset_setup_menu_item 
		text = "Presets" 
		child_texture = icon_gamepad 
		pad_choose_script = create_preset_menu 
		pad_choose_params = { return_to_menu } 
	} 
	thugpro_menu_finalize <...> 
ENDSCRIPT

SCRIPT create_preset_menu 
	dialog_box_exit 
	generic_menu_cleanup 
	IF GotParam dialog 
		create_snazzy_dialog_box { 
			title = #"Presets" 
			text = #"Select control setup" 
			buttons = [ 
				{ 
					text = #"Default Setup" 
					pad_choose_script = thugpro_ControlOptions_UsePreset 
					pad_choose_params = { preset = default } 
				} 
				{ 
					text = #"PS2 Setup" 
					pad_choose_script = thugpro_ControlOptions_UsePreset 
					pad_choose_params = { preset = PS2 } 
				} 
			] 
		} 
	ELSE 
		thugpro_menu_create { 
			menu_name = control_prese 
			menu_title = "Select Preset" 
			menu_style = MENU_STYLE_LEFT 
			pad_back_script = thugpro_controloptions_back 
			helper_text = generic_helper_text 
			show_description_panel 
			show_gradient 
			boxed 
		} 
		make_thugpro_menu_item { 
			text = "Default Setup" 
			description_text = "Default THUG Pro setup. All options enabled..." 
			pad_choose_script = thugpro_ControlOptions_UsePreset 
			pad_choose_params = { preset = default <...> } 
		} 
		make_thugpro_menu_item { 
			text = "PS2 Setup" 
			description_text = "Setup for PS2 controls. THUG options enabled by default..." 
			pad_choose_script = thugpro_ControlOptions_UsePreset 
			pad_choose_params = { preset = PS2 <...> } 
		} 
		thugpro_menu_finalize <...> 
	ENDIF 
ENDSCRIPT

SCRIPT create_inair_setup_menu 
	thugpro_menu_create { 
		menu_name = in_air_setup 
		menu_title = "In Air Options" 
		menu_style = MENU_STYLE_LEFT 
		pad_back_script = create_control_setup_menu 
		helper_text = generic_helper_text_toggle 
		show_description_panel 
		show_gradient 
		boxed 
	} 
	get_spinkey_menu_text 
	make_thugpro_menu_item { 
		id = spin_button_assign_menu 
		text = "Shoulder Spin" 
		extra_text = <menu_text> 
		description_text = ( Desc_Controls_ShoulderSpin ) 
		option_arrows_callback = toggle_spinkey_assignment 
		option_arrows 
		pad_choose 
	} 
	IF IsTrue ENABLE_SPIN_LAG 
		spin_lag_text = "On" 
	ELSE 
		spin_lag_text = "Off" 
	ENDIF 
	make_thugpro_menu_item { 
		id = Spin_lag_id 
		text = "Spin Lag" 
		extra_text = <spin_lag_text> 
		description_text = ( Desc_Controls_ShoulderSpinLag ) 
		option_arrows_callback = toggle_Spin_Lag 
		option_arrows 
		pad_choose 
	} 
	IF ( ENABLE_DROPDOWN_DELAY = 1 ) 
		dropdown_delay_text = "On" 
	ELSE 
		dropdown_delay_text = "Off" 
	ENDIF 
	make_thugpro_menu_item { 
		id = dropdown_delay_id 
		text = "Dropdown Spin Lag" 
		extra_text = <dropdown_delay_text> 
		description_text = ( Desc_Controls_DropDownSpinDelay ) 
		option_arrows_callback = toggle_dropdown_delay 
		option_arrows 
		pad_choose 
	} 
	IF IsTrue GLOBAL_SpinTapsOn 
		spintaps_text = "On" 
	ELSE 
		spintaps_text = "Off" 
	ENDIF 
	make_thugpro_menu_item { 
		id = menu_spintaps 
		text = "180 Spin Taps" 
		extra_text = <spintaps_text> 
		description_text = ( Desc_Controls_ShoulderSpinTaps ) 
		option_arrows_callback = change_basic_control_options 
		option_arrows_callback_params = { spintaps } 
		option_arrows 
		pad_choose 
	} 
	IF GetGlobalFlag flag = SERVER_CHEAT_DISABLE_AIRSHUFFLE 
		as_focusable = not_focusable 
		as_text = "Off" 
	ELSE 
		IF ( enable_air_shuffle = 1 ) 
			as_text = "On" 
		ELSE 
			as_text = "Off" 
		ENDIF 
	ENDIF 
	make_thugpro_menu_item { 
		id = ProCrastination_menu_enable_air_shuffle 
		text = "Air Shuffle" 
		extra_text = <as_text> 
		description_text = ( Desc_Controls_AirShuffle ) 
		option_arrows_callback = Toggle_Air_Shuffle 
		option_arrows 
		pad_choose 
		<as_focusable> 
	} 
	IF THUGPRO_DriftOn 
		drift_text = "On" 
	ELSE 
		drift_text = "Off" 
	ENDIF 
	make_thugpro_menu_item { 
		id = drift_toggle_id 
		text = "Air Drift" 
		extra_text = <drift_text> 
		description_text = ( Desc_Controls_Drift ) 
		option_arrows_callback = toggle_drift 
		option_arrows 
		pad_choose 
	} 
	SWITCH ( tp_c_spineButtonA ) 
		CASE l2 
			IF ( ( tp_c_spineButtonB ) = R2 ) 
				IF THUGPRO_OneButtonSpineOn 
					change spinekey_button = l2_or_r2 
				ELSE 
					change spinekey_button = L2_and_R2 
				ENDIF 
			ENDIF 
		CASE R2 
			change spinekey_button = R2 
		CASE l3 
			change spinekey_button = l3 
	ENDSWITCH 
	SWITCH ( spinekey_button ) 
		CASE L2_and_R2 
			spinekey_text = "\\be + \\bf (L2 + R2)" 
		CASE l2_or_r2 
			spinekey_text = "\\be or \\bf (L2 or R2)" 
		CASE R2 
			spinekey_text = "\\bf (R2)" 
		CASE l3 
			spinekey_text = "\\bl (Focus)" 
		DEFAULT 
			spinekey_text = "\\c2ERROR!" 
	ENDSWITCH 
	make_thugpro_menu_item { 
		id = spine_transfer_assignment_id 
		text = "Drop & Transfer" 
		extra_text = <spinekey_text> 
		description_text = ( Desc_Controls_SpineDropButtons ) 
		option_arrows_callback = toggle_spinekey_assignment 
		option_arrows 
		pad_choose 
	} 
	IF SkaterFlipsOn 
		<aerialflips_text> = "On" 
	ELSE 
		<aerialflips_text> = "Off" 
	ENDIF 
	make_thugpro_menu_item { 
		id = menu_skaterflip 
		text = "Flip & Roll" 
		extra_text = <aerialflips_text> 
		description_text = ( Desc_Controls_FlipRoll ) 
		option_arrows_callback = toggle_skaterflipping 
		option_arrows 
		pad_choose 
	} 
	IF GetGlobalFlag flag = SERVER_CHEAT_DISABLE_BUTTSLAP 
		bs_focusable = not_focusable 
		bs_text = "Off" 
	ELSE 
		IF IsTrue THUGPRO_BS_Enabled 
			bs_text = "On" 
		ELSE 
			bs_text = "Off" 
		ENDIF 
	ENDIF 
	make_thugpro_menu_item { 
		id = menu_bstoggle 
		text = "Buttslap" 
		extra_text = <bs_text> 
		description_text = ( Desc_Controls_Buttslap ) 
		option_arrows_callback = toggle_buttslap 
		option_arrows 
		pad_choose 
		<bs_focusable> 
	} 
	IF GetGlobalFlag flag = SERVER_CHEAT_DISABLE_HIGH_OLLIE 
		high_ollie_focusable = not_focusable 
		high_ollie_text = "Off" 
	ELSE 
		IF ( enable_high_ollies = 1 ) 
			high_ollie_text = "On" 
		ELSE 
			high_ollie_text = "Off" 
		ENDIF 
	ENDIF 
	make_thugpro_menu_item { 
		id = menu_highollietoggle 
		text = "Boned Ollie" 
		extra_text = <high_ollie_text> 
		description_text = ( Desc_Controls_HighOllie ) 
		option_arrows_callback = Toggle_High_Ollies 
		option_arrows 
		pad_choose 
		<high_ollie_focusable> 
	} 
	thugpro_menu_finalize <...> 
ENDSCRIPT

SCRIPT create_onground_setup_menu 
	thugpro_menu_create { 
		menu_name = on_ground_setup 
		menu_title = "On Ground Options" 
		menu_style = MENU_STYLE_LEFT 
		pad_back_script = create_control_setup_menu 
		helper_text = generic_helper_text_toggle 
		show_description_panel 
		show_gradient 
		boxed 
	} 
	get_skater_number 
	num = <skater_number> 
	IF InNetGame 
		IF NOT IsHost 
			<focusable> = not_focusable 
		ENDIF 
	ENDIF 
	IF IsTrue GLOBAL_AutoKickOn 
		autokick_value = "On" 
	ELSE 
		autokick_value = "Off" 
	ENDIF 
	make_thugpro_menu_item { 
		id = menu_autokick 
		text = "Auto-Kick" 
		extra_text = <autokick_value> 
		description_text = ( Desc_Controls_AutoKick ) 
		option_arrows_callback = change_basic_control_options 
		option_arrows_callback_params = { autokick } 
		option_arrows 
		pad_choose 
	} 
	IF InNetGame 
		IF IsTrue GLOBAL_AutoBrakeOn 
			AutoBrake_toggle_text = "On" 
		ELSE 
			AutoBrake_toggle_text = "Off" 
		ENDIF 
		make_thugpro_menu_item { 
			id = menu_auto_brake 
			text = "Auto-Brake" 
			extra_text = <AutoBrake_toggle_text> 
			description_text = ( Desc_Controls_AutoBrake ) 
			option_arrows_callback = toggle_auto_brake_option_new 
			option_arrows 
			pad_choose 
		} 
	ENDIF 
	SWITCH ( powerslide_button ) 
		CASE DownDown_R2 
			powerslide_button_text = "2x \\b4  + \\bf (Down + Down + R2)" 
		CASE Down_R2 
			powerslide_button_text = "\\b4  + \\bf (Down + R2)" 
		CASE Down_R1 
			powerslide_button_text = "\\b4  + \\bh (Down + R1)" 
		CASE DownDown_R1 
			powerslide_button_text = "2x \\b4  + \\bh (Down + Down + R1)" 
		CASE Down_R2_Fancy 
			powerslide_button_text = "\\bf + Direction (R2)" 
		CASE R1_R1 
			powerslide_button_text = "\\bh + \\bh (R1 x2)" 
		DEFAULT 
			powerslide_button_text = "\\c2ERROR!" 
	ENDSWITCH 
	make_thugpro_menu_item { 
		id = power_button_assign_menu 
		text = "Powerslide" 
		extra_text = <powerslide_button_text> 
		description_text = ( Desc_Controls_PowerSlide ) 
		option_arrows_callback = toggle_powerslide_assignment 
		option_arrows 
		pad_choose 
	} 
	revert_button_text = ( ( ( skpro_revert_options ) [ ( skpro_revert_option_current ) ] ) . text ) 
	make_thugpro_menu_item { 
		id = revert_button_assign_menu 
		text = "Revert" 
		extra_text = <revert_button_text> 
		description_text = ( Desc_Controls_Revert ) 
		option_arrows_callback = revert_button_assignment 
		option_arrows 
		pad_choose 
	} 
	IF ( landpivotson = 1 ) 
		landpivot_text = "On" 
	ELSE 
		landpivot_text = "Off" 
	ENDIF 
	make_thugpro_menu_item { 
		id = landpivot_toggle_id 
		text = "Land Pivot" 
		extra_text = <landpivot_text> 
		description_text = ( Desc_Controls_LandPivot ) 
		option_arrows_callback = toggle_landpivots 
		option_arrows 
		pad_choose 
	} 
	<pressuremode_text> = ( ( ( skpro_toggle_stance_options ) [ ( skpro_toggle_stance_option_current ) ] ) . text ) 
	make_thugpro_menu_item { 
		id = pressuremode_toggle_id 
		text = "Change Stance" 
		extra_text = <pressuremode_text> 
		description_text = ( Desc_Controls_StanceToggleMode ) 
		option_arrows_callback = toggle_pressurestancemode 
		option_arrows 
		pad_choose 
	} 
	IF GetGlobalFlag flag = TANTRUM_OFF 
		freakout_text = "Off" 
	ELSE 
		freakout_text = "On" 
	ENDIF 
	make_thugpro_menu_item { 
		id = menu_tantrum 
		text = "Freak Out" 
		extra_text = <freakout_text> 
		description_text = ( Desc_Controls_Freakouts ) 
		option_arrows_callback = toggle_display_tantrum 
		option_arrows 
		pad_choose 
	} 
	thugpro_menu_finalize <...> 
ENDSCRIPT

SCRIPT create_grind_setup_menu 
	thugpro_menu_create { 
		menu_name = grind_setup 
		menu_title = "On Rail Options" 
		menu_style = MENU_STYLE_LEFT 
		pad_back_script = create_control_setup_menu 
		helper_text = generic_helper_text_toggle 
		show_description_panel 
		show_gradient 
		boxed 
	} 
	dropdown_button_text = ( ( ( skpro_dropdown_options ) [ ( skpro_dropdown_option_current ) ] ) . text ) 
	make_thugpro_menu_item { 
		id = dropdown_assignment_menu 
		text = "Dropdown" 
		extra_text = <dropdown_button_text> 
		description_text = ( Desc_Controls_Dropdown ) 
		option_arrows_callback = dropdown_button_assignment 
		option_arrows 
		pad_choose 
	} 
	IF ( GetGlobalFlag flag = FLAG_STALLS ) 
		stall_enabled_text = "On" 
	ELSE 
		stall_enabled_text = "Off" 
	ENDIF 
	make_thugpro_menu_item { 
		id = ac_stalls_menu 
		text = "Rail Stall" 
		extra_text = <stall_enabled_text> 
		description_text = ( Desc_Controls_Stalls ) 
		option_arrows_callback = m_toggle_stall 
		option_arrows 
		pad_choose 
	} 
	get_stall_button_text value = ( GLOBAL_StallButtonTrigger ) 
	make_thugpro_menu_item { 
		id = stall_buttons_menu 
		text = "Rail Stall Control" 
		extra_text = <stall_button_text> 
		description_text = ( Desc_Controls_StallButtons ) 
		option_arrows_callback = toggle_stall_buttons 
		option_arrows 
		pad_choose 
	} 
	IF ( GetGlobalFlag flag = FLAG_UG1RAILSPIN ) 
		railspin_enabled_text = "On" 
	ELSE 
		railspin_enabled_text = "Off" 
	ENDIF 
	make_thugpro_menu_item { 
		id = ac_railspin_menu 
		text = "Rail Spin" 
		extra_text = <railspin_enabled_text> 
		description_text = ( Desc_Controls_RailSpin ) 
		option_arrows_callback = m_toggle_railspin 
		option_arrows 
		pad_choose 
	} 
	IF IsTrue ENABLE_LIP_SPINS 
		lipspin_text = "On" 
	ELSE 
		lipspin_text = "Off" 
	ENDIF 
	make_thugpro_menu_item { 
		id = menu_lipspin_id 
		text = "Lip Spin" 
		extra_text = <lipspin_text> 
		description_text = ( Desc_Controls_LipSpin ) 
		option_arrows_callback = toggle_lipspin 
		option_arrows 
		pad_choose 
	} 
	SWITCH natas_buttons 
		CASE L2_R2 
			natas_buttons_text = "\\b0 + \\be / \\bf (L2 or R2)" 
		CASE L1_R1 
			natas_buttons_text = "\\b0 + \\bg / \\bh (L1 or R1)" 
		DEFAULT 
			natas_buttons_text = "\\c2ERROR" 
	ENDSWITCH 
	make_thugpro_menu_item { 
		id = natas_buttons_menu 
		text = "Natas Spin Control" 
		extra_text = <natas_buttons_text> 
		description_text = ( Desc_Controls_NatasSpin ) 
		option_arrows_callback = toggle_natas_buttons 
		option_arrows 
		pad_choose 
	} 
	IF IsTrue ENABLE_LIP_TRICKS 
		lip_tricks_text = "On" 
	ELSE 
		lip_tricks_text = "Off" 
	ENDIF 
	make_thugpro_menu_item { 
		id = lip_tricks_menu 
		text = "Lip Tricks" 
		extra_text = <lip_tricks_text> 
		description_text = ( Desc_Controls_LipTricks ) 
		option_arrows_callback = toggle_lip_tricks 
		option_arrows 
		pad_choose 
	} 
	thugpro_menu_finalize <...> 
ENDSCRIPT

SCRIPT create_walltricks_setup_menu 
	thugpro_menu_create { 
		menu_name = walltricks_setup 
		menu_title = "Walltrick Options" 
		menu_style = MENU_STYLE_LEFT 
		pad_back_script = create_control_setup_menu 
		helper_text = generic_helper_text_toggle 
		show_description_panel 
		show_gradient 
		boxed 
		width_ajustment = 1.25000000000 
	} 
	get_wallplant_trick_string 
	make_thugpro_menu_item { 
		id = menu_wallplant_trick_id 
		text = "WallPlant Controls" 
		extra_text = <wallplant_trick_string> 
		description_text = ( Desc_Controls_Wallplant ) 
		option_arrows_callback = toggle_wallplant_trick 
		option_arrows 
		pad_choose 
	} 
	IF ( WALLPLANT_ALLOW_OLLIE = 1 ) 
		ac_wpollie_text = "On" 
	ELSE 
		ac_wpollie_text = "Off" 
	ENDIF 
	make_thugpro_menu_item { 
		id = ac_wpollie_menu 
		text = "WallPlant Late Ollie" 
		extra_text = <ac_wpollie_text> 
		description_text = ( Desc_Controls_WPLateOllie ) 
		option_arrows_callback = m_toggle_wpollie 
		option_arrows 
		pad_choose 
	} 
	IF THUGPRO_CavemanWallplantCooldown 
		drift_wp_cooldown_text = "On" 
	ELSE 
		drift_wp_cooldown_text = "Off" 
	ENDIF 
	make_thugpro_menu_item { 
		id = menu_drift_wp_cooldown_id 
		text = "Walk 2 Wallplant Cooldown" 
		extra_text = <drift_wp_cooldown_text> 
		description_text = ( Desc_Controls_WPCavemanCooldown ) 
		option_arrows_callback = toggle_drift_wp_cooldown 
		option_arrows 
		pad_choose 
	} 
	IF ( WALLIEPLANT_INPUT_MODE = 0 ) 
		wallieplant_input_text = "Single Tap" 
	ELSE 
		wallieplant_input_text = "Double Tap" 
	ENDIF 
	make_thugpro_menu_item { 
		id = menu_wallieplant_input 
		text = "WalliePlant Controls" 
		extra_text = <wallieplant_input_text> 
		description_text = ( Desc_Controls_WalliePlantInput ) 
		option_arrows_callback = toggle_wallieplant_input 
		option_arrows 
		pad_choose 
	} 
	IF THUGPRO_WallplantWallrideCooldown 
		wp_wr_cooldown_text = "On" 
	ELSE 
		wp_wr_cooldown_text = "Off" 
	ENDIF 
	make_thugpro_menu_item { 
		id = menu_wp_wr_cooldown_id 
		text = "WallPlant 2 wallride Cooldown " 
		extra_text = <wp_wr_cooldown_text> 
		description_text = ( Desc_Controls_WPWRCooldown ) 
		option_arrows_callback = toggle_wp_wr_cooldown 
		option_arrows 
		pad_choose 
	} 
	IF THUGPRO_CavemanWallrideCooldown 
		wallshuffle_text = "Off" 
	ELSE 
		wallshuffle_text = "On" 
	ENDIF 
	make_thugpro_menu_item { 
		id = menu_wallshuffle_id 
		text = "WallShuffle" 
		extra_text = <wallshuffle_text> 
		description_text = ( Desc_Controls_Wallsuffle ) 
		option_arrows_callback = toggle_wallshuffle 
		option_arrows 
		pad_choose 
	} 
	IF ( ENABLE_WALLRIDEPLANT = 1 ) 
		enable_wallrideplant_text = "On" 
	ELSE 
		enable_wallrideplant_text = "Off" 
	ENDIF 
	make_thugpro_menu_item { 
		id = enable_wallrideplant_id 
		text = "WallridePlant" 
		extra_text = <enable_wallrideplant_text> 
		description_text = ( Desc_Controls_WRPlants ) 
		option_arrows_callback = toggle_wallrideplant 
		option_arrows 
		pad_choose 
	} 
	IF GetGlobalFlag flag = SERVER_CHEAT_DISABLE_BOOSTPLANT 
		bp_focusable = not_focusable 
		bp_text = "Off" 
	ELSE 
		IF ( ENABLE_WALLRIDE_BOOSTPLANT = 1 ) 
			bp_text = "On" 
		ELSE 
			bp_text = "Off" 
		ENDIF 
	ENDIF 
	make_thugpro_menu_item { 
		id = ac_bp_menu 
		text = "BoostPlant" 
		extra_text = <bp_text> 
		description_text = ( Desc_Controls_Boostplant ) 
		option_arrows_callback = m_toggle_bp 
		option_arrows 
		<bp_focusable> 
		pad_choose 
	} 
	IF IsTrue ENABLE_WALLRIDE_SPINS 
		wallspin_text = "On" 
	ELSE 
		wallspin_text = "Off" 
	ENDIF 
	make_thugpro_menu_item { 
		id = menu_wallspin_id 
		text = "Wallride Spin" 
		extra_text = <wallspin_text> 
		description_text = ( Desc_Controls_WallSpin ) 
		option_arrows_callback = toggle_wallspin 
		option_arrows 
		pad_choose 
	} 
	IF ( Toggle_Graffiti_Tags = 0 ) 
		graff_tags_text = "Off" 
	ELSE 
		IF ( Graffiti_Tag_style = 0 ) 
			graff_tags_text = "Spray" 
		ELSE 
			graff_tags_text = "Burp" 
		ENDIF 
	ENDIF 
	make_thugpro_menu_item { 
		id = graff_tags_toggle_id 
		text = "Graffiti Tagging" 
		extra_text = <graff_tags_text> 
		description_text = ( Desc_Controls_GraffitiTags ) 
		option_arrows_callback = func_toggle_graffiti_tags 
		option_arrows 
		pad_choose 
	} 
	thugpro_menu_finalize <...> focus_target = menu_wallplant_trick_id 
ENDSCRIPT

SCRIPT create_walking_setup_menu 
	thugpro_menu_create { 
		menu_name = walking_setup 
		menu_title = "On Foot Options" 
		menu_style = MENU_STYLE_LEFT 
		pad_back_script = create_control_setup_menu 
		helper_text = generic_helper_text_toggle 
		show_description_panel 
		show_gradient 
		boxed 
		width_ajustment = 1.25000000000 
	} 
	SWITCH ( sc_button ) 
		CASE R1 
			sc_button_text = "\\bh (R1)" 
		CASE L1 
			sc_button_text = "\\bg (L1)" 
		CASE BLACK_WHITE 
			sc_button_text = "\\bg or \\bh (L1 or R1)" 
		CASE L1_R1 
			sc_button_text = "\\bg + \\bh (L1 + R1)" 
		DEFAULT 
			sc_button_text = "\\c2ERROR!" 
	ENDSWITCH 
	make_thugpro_menu_item { 
		id = sc_button_assign_menu 
		text = "Switch Skating / Walking" 
		extra_text = <sc_button_text> 
		description_text = ( Desc_Controls_OffBoardButtons ) 
		option_arrows_callback = toggle_switch_control_assignment 
		option_arrows 
		pad_choose 
	} 
	ladder_grab_get_string 
	make_thugpro_menu_item { 
		id = ladder_button_assign_menu 
		text = "Rail & Ladder Grab" 
		extra_text = <extra_text> 
		description_text = ( Desc_Controls_LadderGrab ) 
		option_arrows_callback = toggle_ladder_grab_button 
		option_arrows 
		pad_choose 
	} 
	RemoveParameter extra_text 
	IF ( ENABLE_WALKING_180FLIP_SKATER = 1 ) 
		flip_180_text = "On" 
	ELSE 
		flip_180_text = "Off" 
	ENDIF 
	make_thugpro_menu_item { 
		id = flip_180_toggle_id 
		text = "Walk Spin" 
		extra_text = <flip_180_text> 
		description_text = ( Desc_Controls_WalkSpin ) 
		option_arrows_callback = toggle_walking_180flip 
		option_arrows 
		pad_choose 
	} 
	IF THUGPRO_THUGWalkingPhysicsOn 
		extra_text = "On" 
	ELSE 
		extra_text = "Off" 
	ENDIF 
	make_thugpro_menu_item { 
		id = menu_thug_walk_physics_id 
		text = "THUG1 Walk Physics" 
		extra_text = <extra_text> 
		text_desc = ( Desc_Controls_THUGWalkPhysics ) 
		option_arrows_callback = toggle_thug_walk_physics 
		option_arrows 
		pad_choose 
	} 
	thugpro_menu_finalize <...> 
ENDSCRIPT

SCRIPT set_revert_button index = 0 
	<tmpArray> = Reverts 
	SetArrayElement { 
		arrayname = tmpArray 
		index = 0 
		newvalue = ( ( ( skpro_revert_options ) [ <index> ] ) . triggers [ 0 ] ) 
	} 
	SetArrayElement { 
		arrayname = tmpArray 
		index = 1 
		newvalue = ( ( ( skpro_revert_options ) [ <index> ] ) . triggers [ 1 ] ) 
	} 
	change skpro_revert_option_current = <index> 
ENDSCRIPT

SCRIPT revert_button_assignment 
	GetTags 
	<button_index> = ( skpro_revert_option_current ) 
	IF GotParam left 
		array_previous_wraparound index = <button_index> array = ( skpro_revert_options ) 
	ELSE 
		array_next_wraparound index = <button_index> array = ( skpro_revert_options ) 
	ENDIF 
	thugpro_save_key_value Key = "RevertButton" value = <index> apply_changes 
	thugpro_menu_item_update_extra_text id = <id> text = ( ( ( skpro_revert_options ) [ <index> ] ) . text ) 
ENDSCRIPT

SCRIPT Toggle_High_Ollies 
	GetTags 
	IF ( enable_high_ollies = 1 ) 
		thugpro_menu_item_update_extra_text id = <id> off 
		thugpro_save_key_value Key = "HighOlliesOn" value = 0 apply_changes 
	ELSE 
		IF ( enable_high_ollies = 0 ) 
			thugpro_menu_item_update_extra_text id = <id> on 
			thugpro_save_key_value Key = "HighOlliesOn" value = 1 apply_changes 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT toggle_buttslap 
	GetTags 
	IF IsTrue THUGPRO_BS_Enabled 
		thugpro_menu_item_update_extra_text id = <id> off 
		thugpro_save_key_value Key = "bs_enabled" value = 0 apply_changes 
	ELSE 
		thugpro_menu_item_update_extra_text id = <id> on 
		thugpro_save_key_value Key = "bs_enabled" value = 1 apply_changes 
	ENDIF 
ENDSCRIPT

SCRIPT toggle_thug_walk_physics 
	GetTags 
	IF THUGPRO_THUGWalkingPhysicsOn 
		thugpro_menu_item_update_extra_text id = <id> off 
		thugpro_save_key_value Key = "THUGWalkingPhysics" value = 0 apply_changes 
	ELSE 
		thugpro_menu_item_update_extra_text id = <id> on 
		thugpro_save_key_value Key = "THUGWalkingPhysics" value = 1 apply_changes 
	ENDIF 
ENDSCRIPT

SCRIPT toggle_auto_brake_option_new 
	GetTags 
	IF NOT IsTrue GLOBAL_AutoBrakeOn 
		thugpro_menu_item_update_extra_text id = <id> on 
		thugpro_save_key_value Key = "AutoBrakeOn" value = 1 apply_changes 
	ELSE 
		thugpro_menu_item_update_extra_text id = <id> off 
		thugpro_save_key_value Key = "AutoBrakeOn" value = 0 apply_changes 
	ENDIF 
ENDSCRIPT

SCRIPT toggle_onebuttonspine 
	GetTags 
	IF NOT THUGPRO_OneButtonSpineOn 
		thugpro_menu_item_update_extra_text id = <id> on 
		THUGPRO_ToggleOneButtonSpine on 
		thugpro_save_key_value Key = "OneButtonSpineOn" value = 1 
	ELSE 
		thugpro_menu_item_update_extra_text id = <id> off 
		THUGPRO_ToggleOneButtonSpine off 
		thugpro_save_key_value Key = "OneButtonSpineOn" value = 0 
	ENDIF 
ENDSCRIPT

SCRIPT THUGPRO_HandleKeybindButton 
	IF GotParam a 
		change tp_c_spineButtonA = ( <button> ) 
	ELSE 
		IF GotParam b 
			change tp_c_spineButtonB = ( <button> ) 
		ENDIF 
	ENDIF 
	THUGPRO_BindSpineKeys buttonA = ( tp_c_spineButtonA ) buttonB = ( tp_c_spineButtonB ) 
ENDSCRIPT

SCRIPT toggle_ps2_buttons 
	GetTags 
	IF ( THUGPRO_PS2ButtonsOn = 0 ) 
		thugpro_menu_item_update_extra_text id = <id> on 
		change THUGPRO_PS2ButtonsOn = 1 
		THUGPRO_PatchTogglePS2Buttons on 
		THUGPRO_BindSpineKeys buttonA = ( tp_c_spineButtonA ) buttonB = ( tp_c_spineButtonB ) 
		thugpro_save_key_value Key = "PS2ButtonsOn" value = 1 
		thugpro_save_key_value Key = "SpineKeyButtonA" value = ( tp_c_spineButtonA ) 
		thugpro_save_key_value Key = "SpineKeyButtonB" value = ( tp_c_spineButtonB ) 
	ELSE 
		thugpro_menu_item_update_extra_text id = <id> off 
		change THUGPRO_PS2ButtonsOn = 0 
		THUGPRO_PatchTogglePS2Buttons off 
		THUGPRO_BindSpineKeys buttonA = ( tp_c_spineButtonA ) buttonB = ( tp_c_spineButtonB ) 
		thugpro_save_key_value Key = "PS2ButtonsOn" value = 0 
		thugpro_save_key_value Key = "SpineKeyButtonA" value = ( tp_c_spineButtonA ) 
		thugpro_save_key_value Key = "SpineKeyButtonB" value = ( tp_c_spineButtonB ) 
	ENDIF 
ENDSCRIPT

SCRIPT ladder_grab_get_string 
	SWITCH ( ladder_grab_button ) 
		CASE R1 
			RETURN extra_text = "\\bh (R1)" 
		CASE L1 
			RETURN extra_text = "\\bg (L1)" 
		CASE R2 
			RETURN extra_text = "\\bf (R2)" 
		CASE l2 
			RETURN extra_text = "\\be (L2)" 
		CASE l3 
			RETURN extra_text = "\\bl (Focus)" 
		DEFAULT 
			RETURN extra_text = "\\c2ERROR!" 
	ENDSWITCH 
ENDSCRIPT

SCRIPT toggle_ladder_grab_button 
	GetTags 
	get_index_of_item_in_array item = ( ladder_grab_button ) array = ( ladder_grab_button_array ) 
	IF GotParam left 
		IF GotParam item_index 
			array_previous_wraparound index = <item_index> array = ( ladder_grab_button_array ) 
		ENDIF 
	ELSE 
		IF GotParam item_index 
			array_next_wraparound index = <item_index> array = ( ladder_grab_button_array ) 
		ENDIF 
	ENDIF 
	IF GotParam index 
		change ladder_grab_button = ( ( ladder_grab_button_array ) [ <index> ] ) 
	ENDIF 
	RemoveParameter extra_text 
	ladder_grab_get_string 
	IF NOT GotParam no_menu 
		thugpro_menu_item_update_extra_text id = <id> text = <extra_text> 
	ENDIF 
	IF NOT GotParam dont_save 
		thugpro_save_key_value Key = "LadderGrabKey" value = ( ladder_grab_button ) 
	ENDIF 
	set_ladder_grab_button 
ENDSCRIPT

SCRIPT set_ladder_grab_button 
	THUGPRO_BindLadderGrabKey button = ( ladder_grab_button ) 
ENDSCRIPT

SCRIPT toggle_wallplant_trick 
	GetTags 
	new_index = ( WALLPLANT_TRICK_OPTION ) 
	IF GotParam left 
		IF ( ( WALLPLANT_TRICK_OPTION ) = 0 ) 
			new_index = 4 
		ELSE 
			new_index = ( ( WALLPLANT_TRICK_OPTION ) - 1 ) 
		ENDIF 
	ELSE 
		IF ( ( WALLPLANT_TRICK_OPTION ) = 4 ) 
			new_index = 0 
		ELSE 
			new_index = ( ( WALLPLANT_TRICK_OPTION ) + 1 ) 
		ENDIF 
	ENDIF 
	get_wallplant_trick_string index = <new_index> 
	thugpro_menu_item_update_extra_text id = <id> text = <wallplant_trick_string> 
	thugpro_save_key_value Key = "WallplantOnly" value = <new_index> apply_changes 
ENDSCRIPT

SCRIPT get_wallplant_trick_string 
	IF NOT GotParam index 
		index = ( WALLPLANT_TRICK_OPTION ) 
	ENDIF 
	extra_text = "\\c2error" 
	SWITCH <index> 
		CASE 0 
			extra_text = "WP & SS" 
		CASE 1 
			extra_text = "WP only ( \\b3 + \\b4 )" 
		CASE 2 
			extra_text = "WP only ( \\b3 )" 
		CASE 3 
			extra_text = "SS only" 
		CASE 4 
			extra_text = "Off" 
		DEFAULT 
			extra_text = "\\c2ERROR!" 
	ENDSWITCH 
	RETURN wallplant_trick_string = <extra_text> 
ENDSCRIPT

SCRIPT toggle_wallspin 
	GetTags 
	IF IsTrue ENABLE_WALLRIDE_SPINS 
		thugpro_menu_item_update_extra_text id = <id> off 
		thugpro_save_key_value Key = "WallrideSpinouts" value = 0 apply_changes 
	ELSE 
		thugpro_menu_item_update_extra_text id = <id> on 
		thugpro_save_key_value Key = "WallrideSpinouts" value = 1 apply_changes 
	ENDIF 
ENDSCRIPT

SCRIPT toggle_drift_wp_cooldown 
	GetTags 
	IF THUGPRO_CavemanWallplantCooldown 
		thugpro_menu_item_update_extra_text id = <id> off 
		thugpro_save_key_value Key = "CavemanWallplantCooldown" value = 0 apply_changes 
	ELSE 
		thugpro_menu_item_update_extra_text id = <id> on 
		thugpro_save_key_value Key = "CavemanWallplantCooldown" value = 1 apply_changes 
	ENDIF 
ENDSCRIPT

SCRIPT toggle_wallshuffle 
	GetTags 
	IF THUGPRO_CavemanWallrideCooldown 
		thugpro_menu_item_update_extra_text id = <id> on 
		thugpro_save_key_value Key = "CavemanWallrideCooldown" value = 0 apply_changes 
	ELSE 
		thugpro_menu_item_update_extra_text id = <id> off 
		thugpro_save_key_value Key = "CavemanWallrideCooldown" value = 1 apply_changes 
	ENDIF 
ENDSCRIPT

SCRIPT toggle_wp_wr_cooldown 
	GetTags 
	IF THUGPRO_WallplantWallrideCooldown 
		thugpro_menu_item_update_extra_text id = <id> off 
		thugpro_save_key_value Key = "WallplantWallrideCooldown" value = 0 apply_changes 
	ELSE 
		thugpro_menu_item_update_extra_text id = <id> on 
		thugpro_save_key_value Key = "WallplantWallrideCooldown" value = 1 apply_changes 
	ENDIF 
ENDSCRIPT

SCRIPT toggle_wallieplant_input 
	GetTags 
	IF IsTrue WALLIEPLANT_INPUT_MODE 
		thugpro_menu_item_update_extra_text id = <id> text = "Single Tap" 
		thugpro_save_key_value Key = "WallieplantInputMode" value = 0 apply_changes 
	ELSE 
		thugpro_menu_item_update_extra_text id = <id> text = "Double Tap" 
		thugpro_save_key_value Key = "WallieplantInputMode" value = 1 apply_changes 
	ENDIF 
ENDSCRIPT

SCRIPT set_dropdown_button index = 0 
	<tmpArray> = GrindRelease 
	SetArrayElement { 
		arrayname = tmpArray 
		index = 0 
		newvalue = ( ( ( skpro_dropdown_options ) [ <index> ] ) . triggers [ 0 ] ) 
	} 
	SetArrayElement { 
		arrayname = tmpArray 
		index = 1 
		newvalue = ( ( ( skpro_dropdown_options ) [ <index> ] ) . triggers [ 1 ] ) 
	} 
	change skpro_dropdown_option_current = <index> 
ENDSCRIPT

SCRIPT dropdown_button_assignment 
	GetTags 
	<button_index> = ( skpro_dropdown_option_current ) 
	IF GotParam left 
		array_previous_wraparound index = <button_index> array = ( skpro_dropdown_options ) 
	ELSE 
		array_next_wraparound index = <button_index> array = ( skpro_dropdown_options ) 
	ENDIF 
	thugpro_save_key_value Key = "DropdownButtonNew" value = <index> apply_changes 
	thugpro_menu_item_update_extra_text id = <id> text = ( ( ( skpro_dropdown_options ) [ <index> ] ) . text ) 
ENDSCRIPT

SCRIPT toggle_switch_control_assignment 
	IF GotParam left 
		SWITCH ( sc_button ) 
			CASE L1 
				change_switch_control_assignment { R1 } 
			CASE R1 
				change_switch_control_assignment { BLACK_WHITE } 
			CASE BLACK_WHITE 
				change_switch_control_assignment { L1_R1 } 
			CASE L1_R1 
				change_switch_control_assignment { L1 } 
		ENDSWITCH 
	ELSE 
		SWITCH ( sc_button ) 
			CASE L1 
				change_switch_control_assignment { L1_R1 } 
			CASE R1 
				change_switch_control_assignment { L1 } 
			CASE BLACK_WHITE 
				change_switch_control_assignment { R1 } 
			CASE L1_R1 
				change_switch_control_assignment { BLACK_WHITE } 
		ENDSWITCH 
	ENDIF 
ENDSCRIPT

SCRIPT change_switch_control_assignment 
	IF GotParam L1 
		change sc_button = L1 
		change SwitchControl_Trigger = { Trigger = { Press , Black , 10 } } 
		save_value = L1 
		menu_text = "\\bg (L1)" 
	ENDIF 
	IF GotParam R1 
		change sc_button = R1 
		change SwitchControl_Trigger = { Trigger = { Press , White , 10 } } 
		save_value = R1 
		menu_text = "\\bh (R1)" 
	ENDIF 
	IF GotParam BLACK_WHITE 
		change sc_button = BLACK_WHITE 
		change SwitchControl_Trigger = { Trigger = { Press , Black , 10 } Alt_Trigger = { Press , White , 10 } } 
		save_value = BLACK_WHITE 
		menu_text = "\\bg or \\bh (L1 or R1)" 
	ENDIF 
	IF GotParam L1_R1 
		change sc_button = L1_R1 
		change SwitchControl_Trigger = { Trigger = { PressTwoAnyOrder , White , Black , 400 } } 
		save_value = L1_R1 
		menu_text = "\\bg + \\bh (L1 + R1)" 
	ENDIF 
	IF NOT GotParam dont_save 
		thugpro_save_key_value Key = "SwitchButton" value = <save_value> 
	ENDIF 
	IF NOT GotParam no_menu 
		GetTags 
		thugpro_menu_item_update_extra_text id = <id> text = <menu_text> 
	ENDIF 
ENDSCRIPT

SCRIPT toggle_powerslide_assignment 
	IF GotParam left 
		SWITCH ( powerslide_button ) 
			CASE DownDown_R2 
				change_powerslide_assignment { R1_R1 } 
			CASE Down_R2 
				change_powerslide_assignment { DownDown_R2 } 
			CASE Down_R1 
				change_powerslide_assignment { Down_R2 } 
			CASE DownDown_R1 
				change_powerslide_assignment { Down_R1 } 
			CASE R1_R1 
				change_powerslide_assignment { DownDown_R1 } 
		ENDSWITCH 
	ELSE 
		SWITCH ( powerslide_button ) 
			CASE DownDown_R2 
				change_powerslide_assignment { Down_R2 } 
			CASE Down_R2 
				change_powerslide_assignment { Down_R1 } 
			CASE Down_R1 
				change_powerslide_assignment { DownDown_R1 } 
			CASE DownDown_R1 
				change_powerslide_assignment { R1_R1 } 
			CASE R1_R1 
				change_powerslide_assignment { DownDown_R2 } 
		ENDSWITCH 
	ENDIF 
ENDSCRIPT

SCRIPT change_powerslide_assignment 
	<tmpArray> = GroundTricks 
	IF GotParam DownDown_R2 
		change powerslide_button = DownDown_R2 
		SetArrayElement { 
			arrayname = tmpArray 
			index = 0 
			newvalue = { Trigger = { TripleInOrder , a = down , b = down , R2 , 400 } Scr = ToggleSwitchRegular Params = { PowerSlide } } 
		} 
		menu_text = "2x \\b4 + \\bf (Down + Down + R2)" 
		save_value = DownDown_R2 
	ENDIF 
	IF GotParam Down_R2 
		change powerslide_button = Down_R2 
		SetArrayElement { 
			arrayname = tmpArray 
			index = 0 
			newvalue = { Trigger = { InOrder , a = down , b = R2 , 400 } Scr = ToggleSwitchRegular Params = { PowerSlide } } 
		} 
		menu_text = "\\b4 + \\bf (Down + R2)" 
		save_value = Down_R2 
	ENDIF 
	IF GotParam DownDown_R1 
		change powerslide_button = DownDown_R1 
		SetArrayElement { 
			arrayname = tmpArray 
			index = 0 
			newvalue = { Trigger = { TripleInOrder , a = down , b = down , White , 400 } Scr = ToggleSwitchRegular Params = { PowerSlide } } 
		} 
		menu_text = "2x \\b4 + \\bh (Down + Down + R1)" 
		save_value = DownDown_R1 
	ENDIF 
	IF GotParam Down_R1 
		change powerslide_button = Down_R1 
		SetArrayElement { 
			arrayname = tmpArray 
			index = 0 
			newvalue = { Trigger = { InOrder , a = down , b = White , 400 } Scr = ToggleSwitchRegular Params = { PowerSlide } } 
		} 
		menu_text = "\\b4 + \\bh (Down + R1)" 
		save_value = Down_R1 
	ENDIF 
	IF GotParam R1_R1 
		change powerslide_button = R1_R1 
		SetArrayElement { 
			arrayname = tmpArray 
			index = 0 
			newvalue = { Trigger = { InOrder , a = White , b = White , 400 } Scr = ToggleSwitchRegular Params = { PowerSlide } } 
		} 
		menu_text = "2x \\bh (2x R1)" 
		save_value = R1_R1 
	ENDIF 
	IF NOT GotParam dont_save 
		thugpro_save_key_value Key = "PowerslideButton" value = <save_value> 
	ENDIF 
	IF NOT GotParam no_menu 
		GetTags 
		thugpro_menu_item_update_extra_text id = <id> text = <menu_text> 
	ENDIF 
ENDSCRIPT

SCRIPT toggle_spinkey_assignment 
	GetTags 
	get_index_of_item_in_array item = ( GLOBAL_ShoulderSpinButtons ) array = ( ShoulderSpinButton_Options ) 
	IF GotParam item_index 
		IF GotParam left 
			array_previous_wraparound index = <item_index> array = ( ShoulderSpinButton_Options ) 
		ELSE 
			array_next_wraparound index = <item_index> array = ( ShoulderSpinButton_Options ) 
		ENDIF 
		IF GotParam index 
			thugpro_save_key_value Key = "ShoulderSpinButtons" value = ( ( ShoulderSpinButton_Options ) [ <index> ] ) apply_changes 
			change GLOBAL_ShoulderSpinButtons = ( ( ShoulderSpinButton_Options ) [ <index> ] ) 
		ENDIF 
		get_spinkey_menu_text 
	ENDIF 
	IF GotParam menu_text 
		thugpro_menu_item_update_extra_text id = <id> text = <menu_text> 
	ENDIF 
ENDSCRIPT

SCRIPT get_spinkey_menu_text 
	SWITCH ( GLOBAL_ShoulderSpinButtons ) 
		CASE L2_R2 
			extra_text = "\\be + \\bf (L2 + R2)" 
		CASE L1_R1 
			extra_text = "\\bg + \\bh (L1 + R1)" 
		CASE R1_R2 
			extra_text = "\\bh + \\bf (R1 + R2)" 
		CASE L1_L2 
			extra_text = "\\bg + \\be (L1 + L2)" 
		CASE Disabled 
			extra_text = "Off" 
		DEFAULT 
			extra_text = "\\c2ERROR!" 
	ENDSWITCH 
	RETURN menu_text = <extra_text> 
ENDSCRIPT

SCRIPT toggle_spinekey_assignment 
	IF GotParam left 
		SWITCH ( spinekey_button ) 
			CASE L2_and_R2 
				change_spinekey_assignment buttons = l3 
			CASE l2_or_r2 
				change_spinekey_assignment buttons = L2_and_R2 
			CASE R2 
				change_spinekey_assignment buttons = l2_or_r2 
			CASE l3 
				change_spinekey_assignment buttons = R2 
		ENDSWITCH 
	ELSE 
		SWITCH ( spinekey_button ) 
			CASE L2_and_R2 
				change_spinekey_assignment buttons = l2_or_r2 
			CASE l2_or_r2 
				change_spinekey_assignment buttons = R2 
			CASE R2 
				change_spinekey_assignment buttons = l3 
			CASE l3 
				change_spinekey_assignment buttons = L2_and_R2 
		ENDSWITCH 
	ENDIF 
ENDSCRIPT

SCRIPT change_spinekey_assignment 
	IF NOT GotParam no_menu 
		GetTags 
	ENDIF 
	SWITCH <buttons> 
		CASE L2_and_R2 
			change spinekey_button = L2_and_R2 
			change tp_c_spineButtonA = l2 
			change tp_c_spineButtonB = R2 
			<extra_text> = "\\be + \\bf (L2 + R2)" 
		CASE l2_or_r2 
			change spinekey_button = l2_or_r2 
			change tp_c_spineButtonA = l2 
			change tp_c_spineButtonB = R2 
			AddParams { OneButton } 
			<extra_text> = "\\be or \\bf (L2 or R2)" 
		CASE R2 
			change spinekey_button = R2 
			change tp_c_spineButtonA = R2 
			change tp_c_spineButtonB = R2 
			AddParams { OneButton } 
			<extra_text> = "\\bf (R2)" 
		CASE l3 
			change spinekey_button = l3 
			change tp_c_spineButtonA = l3 
			change tp_c_spineButtonB = l3 
			AddParams { OneButton } 
			<extra_text> = "\\bl (Focus)" 
	ENDSWITCH 
	IF GotParam OneButton 
		thugpro_save_key_value Key = "OneButtonSpineOn" value = 1 apply_changes 
	ELSE 
		thugpro_save_key_value Key = "OneButtonSpineOn" value = 0 apply_changes 
	ENDIF 
	thugpro_save_key_value Key = "SpineKeyButtonA" value = ( tp_c_spineButtonA ) apply_changes 
	thugpro_save_key_value Key = "SpineKeyButtonB" value = ( tp_c_spineButtonB ) apply_changes 
	IF NOT GotParam no_menu 
		thugpro_menu_item_update_extra_text id = <id> text = <extra_text> 
	ENDIF 
ENDSCRIPT

SCRIPT m_toggle_railspin 
	GetTags 
	IF ( GetGlobalFlag flag = FLAG_UG1RAILSPIN ) 
		UnsetGlobalFlag flag = FLAG_UG1RAILSPIN 
		thugpro_menu_item_update_extra_text id = <id> off 
		thugpro_save_key_value Key = "RailSpinOn" value = 0 
	ELSE 
		SetGlobalFlag flag = FLAG_UG1RAILSPIN 
		thugpro_menu_item_update_extra_text id = <id> on 
		thugpro_save_key_value Key = "RailSpinOn" value = 1 
	ENDIF 
ENDSCRIPT

SCRIPT m_toggle_stall 
	GetTags 
	IF ( GetGlobalFlag flag = FLAG_STALLS ) 
		UnsetGlobalFlag flag = FLAG_STALLS 
		thugpro_menu_item_update_extra_text id = <id> off 
		thugpro_save_key_value Key = "StallsOn" value = 0 
	ELSE 
		SetGlobalFlag flag = FLAG_STALLS 
		thugpro_menu_item_update_extra_text id = <id> on 
		thugpro_save_key_value Key = "StallsOn" value = 1 
	ENDIF 
ENDSCRIPT

SCRIPT toggle_drift 
	GetTags 
	IF THUGPRO_DriftOn 
		THUGPRO_ToggleDrift off 
		thugpro_menu_item_update_extra_text id = <id> off 
		thugpro_save_key_value Key = "DriftEnabled" value = 0 
	ELSE 
		THUGPRO_ToggleDrift on 
		thugpro_menu_item_update_extra_text id = <id> on 
		thugpro_save_key_value Key = "DriftEnabled" value = 1 
	ENDIF 
ENDSCRIPT

SCRIPT toggle_walking_180flip 
	GetTags 
	IF ( ENABLE_WALKING_180FLIP_SKATER = 1 ) 
		change ENABLE_WALKING_180FLIP_SKATER = 0 
		thugpro_menu_item_update_extra_text id = <id> off 
		thugpro_save_key_value Key = "Walking_180FlipOn" value = 0 
	ELSE 
		change ENABLE_WALKING_180FLIP_SKATER = 1 
		thugpro_menu_item_update_extra_text id = <id> on 
		thugpro_save_key_value Key = "Walking_180FlipOn" value = 1 
	ENDIF 
ENDSCRIPT

SCRIPT toggle_landpivots 
	GetTags 
	IF ( landpivotson = 1 ) 
		change landpivotson = 0 
		thugpro_menu_item_update_extra_text id = <id> off 
		thugpro_save_key_value Key = "landpivotson" value = 0 
	ELSE 
		change landpivotson = 1 
		thugpro_menu_item_update_extra_text id = <id> on 
		thugpro_save_key_value Key = "landpivotson" value = 1 
	ENDIF 
ENDSCRIPT

SCRIPT func_toggle_graffiti_tags 
	IF GotParam right 
		IF ( Toggle_Graffiti_Tags = 0 ) 
			change Toggle_Graffiti_Tags = 1 
			thugpro_save_key_value Key = "grafftagon" value = 1 apply_changes 
			change Graffiti_Tag_style = 0 
			thugpro_save_key_value Key = "grafftagstyle" value = 0 
			thugpro_menu_item_update_extra_text id = graff_tags_toggle_id text = "Spray" 
		ELSE 
			IF ( Graffiti_Tag_style = 0 ) 
				change Graffiti_Tag_style = 1 
				thugpro_save_key_value Key = "grafftagstyle" value = 1 
				change Toggle_Graffiti_Tags = 1 
				thugpro_save_key_value Key = "grafftagon" value = 1 apply_changes 
				thugpro_menu_item_update_extra_text id = graff_tags_toggle_id text = "Burp" 
			ELSE 
				change Toggle_Graffiti_Tags = 0 
				thugpro_save_key_value Key = "grafftagon" value = 0 apply_changes 
				change Graffiti_Tag_style = 0 
				thugpro_save_key_value Key = "grafftagstyle" value = 0 
				thugpro_menu_item_update_extra_text id = graff_tags_toggle_id text = "Off" 
			ENDIF 
		ENDIF 
	ELSE 
		IF GotParam left 
			IF ( Toggle_Graffiti_Tags = 0 ) 
				change Toggle_Graffiti_Tags = 1 
				thugpro_save_key_value Key = "grafftagon" value = 1 apply_changes 
				change Graffiti_Tag_style = 1 
				thugpro_save_key_value Key = "grafftagstyle" value = 1 
				thugpro_menu_item_update_extra_text id = graff_tags_toggle_id text = "Burp" 
			ELSE 
				IF ( Graffiti_Tag_style = 1 ) 
					change Toggle_Graffiti_Tags = 1 
					thugpro_save_key_value Key = "grafftagon" value = 1 apply_changes 
					change Graffiti_Tag_style = 0 
					thugpro_save_key_value Key = "grafftagstyle" value = 0 
					thugpro_menu_item_update_extra_text id = graff_tags_toggle_id text = "Spray" 
				ELSE 
					change Toggle_Graffiti_Tags = 0 
					thugpro_save_key_value Key = "grafftagon" value = 0 apply_changes 
					change Graffiti_Tag_style = 0 
					thugpro_save_key_value Key = "grafftagstyle" value = 0 
					thugpro_menu_item_update_extra_text id = graff_tags_toggle_id text = "Off" 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT m_toggle_wpollie 
	GetTags 
	IF ( WALLPLANT_ALLOW_OLLIE = 1 ) 
		change WALLPLANT_ALLOW_OLLIE = 0 
		thugpro_menu_item_update_extra_text id = <id> off 
		thugpro_save_key_value Key = "Wallplant_OllieOn" value = 0 
	ELSE 
		change WALLPLANT_ALLOW_OLLIE = 1 
		thugpro_menu_item_update_extra_text id = <id> on 
		thugpro_save_key_value Key = "Wallplant_OllieOn" value = 1 
	ENDIF 
ENDSCRIPT

SCRIPT set_pressure_stance_mode index = 0 
	<tmpArray> = GroundTricks 
	SetArrayElement { 
		arrayname = tmpArray 
		index = 2 
		newvalue = ( ( ( skpro_toggle_stance_options ) [ <index> ] ) . triggers [ 0 ] ) 
	} 
	SetArrayElement { 
		arrayname = tmpArray 
		index = 3 
		newvalue = ( ( ( skpro_toggle_stance_options ) [ <index> ] ) . triggers [ 1 ] ) 
	} 
	change skpro_toggle_stance_option_current = <index> 
	change PressureStanceMode = <index> 
ENDSCRIPT

SCRIPT toggle_pressurestancemode 
	GetTags 
	<button_index> = ( skpro_toggle_stance_option_current ) 
	IF GotParam left 
		array_previous_wraparound index = <button_index> array = ( skpro_toggle_stance_options ) 
	ELSE 
		array_next_wraparound index = <button_index> array = ( skpro_toggle_stance_options ) 
	ENDIF 
	thugpro_save_key_value Key = "PressureStanceMode" value = <index> apply_changes 
	thugpro_menu_item_update_extra_text id = <id> text = ( ( ( skpro_toggle_stance_options ) [ <index> ] ) . text ) 
ENDSCRIPT

SCRIPT toggle_wallrideplant 
	GetTags 
	IF ( ENABLE_WALLRIDEPLANT = 1 ) 
		change ENABLE_WALLRIDEPLANT = 0 
		thugpro_menu_item_update_extra_text id = <id> off 
		thugpro_save_key_value Key = "WallridePlantOn" value = 0 
	ELSE 
		change ENABLE_WALLRIDEPLANT = 1 
		thugpro_menu_item_update_extra_text id = <id> on 
		thugpro_save_key_value Key = "WallridePlantOn" value = 1 
	ENDIF 
ENDSCRIPT

SCRIPT m_toggle_bp 
	GetTags 
	IF ( ENABLE_WALLRIDE_BOOSTPLANT = 1 ) 
		change ENABLE_WALLRIDE_BOOSTPLANT = 0 
		thugpro_menu_item_update_extra_text id = <id> off 
		thugpro_save_key_value Key = "BoostplantOn" value = 0 
	ELSE 
		change ENABLE_WALLRIDE_BOOSTPLANT = 1 
		thugpro_menu_item_update_extra_text id = <id> on 
		thugpro_save_key_value Key = "BoostplantOn" value = 1 
	ENDIF 
ENDSCRIPT

SCRIPT toggle_dropdown_delay 
	GetTags 
	IF ( ENABLE_DROPDOWN_DELAY = 1 ) 
		thugpro_menu_item_update_extra_text id = <id> off 
		change ENABLE_DROPDOWN_DELAY = 0 
		IF NOT GotParam no_menu 
			thugpro_save_key_value Key = "DropDownDelayOn" value = 0 
		ENDIF 
	ELSE 
		thugpro_menu_item_update_extra_text id = <id> on 
		change ENABLE_DROPDOWN_DELAY = 1 
		IF NOT GotParam no_menu 
			thugpro_save_key_value Key = "DropDownDelayOn" value = 1 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT toggle_Spin_Lag 
	GetTags 
	IF IsTrue ENABLE_SPIN_LAG 
		thugpro_menu_item_update_extra_text id = <id> off 
		thugpro_save_key_value Key = "SpinLagOn" value = 0 apply_changes 
	ELSE 
		thugpro_menu_item_update_extra_text id = <id> on 
		thugpro_save_key_value Key = "SpinLagOn" value = 1 apply_changes 
	ENDIF 
ENDSCRIPT

SCRIPT toggle_skaterflipping 
	GetTags 
	IF SkaterFlipsOn 
		thugpro_menu_item_update_extra_text id = <id> off 
		thugpro_save_key_value Key = "SkaterFlips" value = 0 apply_changes 
	ELSE 
		thugpro_menu_item_update_extra_text id = <id> on 
		thugpro_save_key_value Key = "SkaterFlips" value = 1 apply_changes 
	ENDIF 
ENDSCRIPT

SCRIPT change_basic_control_options 
	GetTags 
	IF GotParam vibration 
		get_skater_number 
		IF VibrationIsOn <skater_number> 
			thugpro_save_key_value Key = "VibrationOn" value = 0 apply_changes 
			thugpro_menu_item_update_extra_text id = menu_vibration off 
		ELSE 
			thugpro_save_key_value Key = "VibrationOn" value = 1 apply_changes 
			thugpro_menu_item_update_extra_text id = menu_vibration on 
		ENDIF 
		RETURN 
	ENDIF 
	IF GotParam autokick 
		IF IsTrue GLOBAL_AutoKickOn 
			thugpro_save_key_value Key = "AutoKickOn" value = 0 apply_changes 
			thugpro_menu_item_update_extra_text id = menu_autokick off 
		ELSE 
			thugpro_save_key_value Key = "AutoKickOn" value = 1 apply_changes 
			thugpro_menu_item_update_extra_text id = menu_autokick on 
		ENDIF 
		RETURN 
	ENDIF 
	IF GotParam spintaps 
		IF IsTrue GLOBAL_SpinTapsOn 
			thugpro_menu_item_update_extra_text id = menu_spintaps off 
			thugpro_save_key_value Key = "SpinTapsOn" value = 0 apply_changes 
		ELSE 
			thugpro_menu_item_update_extra_text id = menu_spintaps on 
			thugpro_save_key_value Key = "SpinTapsOn" value = 1 apply_changes 
		ENDIF 
		RETURN 
	ENDIF 
ENDSCRIPT

SCRIPT toggle_wallplant_only 
	GetTags 
	IF ( StickerSlapDisabled = 1 ) 
		thugpro_menu_item_update_extra_text id = <id> off 
		thugpro_save_key_value Key = "WallplantOnly" value = 0 apply_changes 
	ELSE 
		thugpro_menu_item_update_extra_text id = <id> on 
		thugpro_save_key_value Key = "WallplantOnly" value = 1 apply_changes 
	ENDIF 
ENDSCRIPT

SCRIPT toggle_stall_buttons 
	GetTags 
	tmp_new_value = ( GLOBAL_StallButtonTrigger ) 
	IF GotParam left 
		SWITCH ( GLOBAL_StallButtonTrigger ) 
			CASE Black 
				tmp_new_value = l2 
			CASE l2 
				tmp_new_value = White 
			CASE White 
				tmp_new_value = R2 
			CASE R2 
				tmp_new_value = Black 
		ENDSWITCH 
	ELSE 
		SWITCH ( GLOBAL_StallButtonTrigger ) 
			CASE l2 
				tmp_new_value = Black 
			CASE Black 
				tmp_new_value = R2 
			CASE R2 
				tmp_new_value = White 
			CASE White 
				tmp_new_value = l2 
		ENDSWITCH 
	ENDIF 
	thugpro_save_key_value Key = "StallButtonTrigger" value = <tmp_new_value> apply_changes 
	wait 1 frames 
	get_stall_button_text value = <tmp_new_value> 
	wait 1 frames 
	thugpro_menu_item_update_extra_text id = <id> text = <stall_button_text> 
ENDSCRIPT

SCRIPT get_stall_button_text 
	SWITCH ( <value> ) 
		CASE Black 
			extra_text = "\\b0 + \\bh (L1)" 
		CASE R2 
			extra_text = "\\b0 + \\bf (R2)" 
		CASE White 
			extra_text = "\\b0 + \\bg (R1)" 
		CASE l2 
			extra_text = "\\b0 + \\be (L2)" 
		DEFAULT 
			extra_text = "\\c2error" 
	ENDSWITCH 
	RETURN stall_button_text = <extra_text> 
ENDSCRIPT

SCRIPT toggle_natas_buttons 
	GetTags 
	natas_buttons_text = "\\c2ERROR" 
	IF CheckSumEquals a = ( natas_buttons ) b = L2_R2 
		natas_buttons_text = "\\b0 + \\bg / \\bh (L1 or R1)" 
		thugpro_save_key_value Key = "NatasButtons" value = L1_R1 apply_changes 
	ELSE 
		IF CheckSumEquals a = ( natas_buttons ) b = L1_R1 
			natas_buttons_text = "\\b0 + \\be / \\bf (L2 or R2)" 
			thugpro_save_key_value Key = "NatasButtons" value = L2_R2 apply_changes 
		ENDIF 
	ENDIF 
	thugpro_menu_item_update_extra_text id = <id> text = <natas_buttons_text> 
ENDSCRIPT

SCRIPT toggle_lipspin 
	GetTags 
	IF IsTrue ENABLE_LIP_SPINS 
		thugpro_menu_item_update_extra_text id = <id> off 
		thugpro_save_key_value Key = "LipSpinouts" value = 0 apply_changes 
	ELSE 
		thugpro_menu_item_update_extra_text id = <id> on 
		thugpro_save_key_value Key = "LipSpinouts" value = 1 apply_changes 
	ENDIF 
ENDSCRIPT

SCRIPT toggle_lip_tricks 
	GetTags 
	IF IsTrue ENABLE_LIP_TRICKS 
		thugpro_menu_item_update_extra_text id = <id> off 
		thugpro_save_key_value Key = "LipTricks" value = 0 apply_changes 
	ELSE 
		thugpro_menu_item_update_extra_text id = <id> on 
		thugpro_save_key_value Key = "LipTricks" value = 1 apply_changes 
	ENDIF 
ENDSCRIPT


