
panel_message_perfect_line1_pos = PAIR(20.00000000000, 340.00000000000) 
panel_message_perfect_line2_pos = PAIR(20.00000000000, 360.00000000000) 
panel_message_tech_line1_pos = PAIR(610.00000000000, 340.00000000000) 
panel_message_tech_line2_pos = PAIR(610.00000000000, 360.00000000000) 
new_gap_message_pos = PAIR(-40.00000000000, 90.00000000000) 
panel_block_goal_desc_pos = PAIR(696.00000000000, 14.00000000000) 
panel_block_goal_desc_pos1 = PAIR(610.00000000000, 14.00000000000) 
panel_block_goal_desc_pos2 = PAIR(610.00000000000, 34.00000000000) 
net_panel_message_pos = PAIR(300.00000000000, 127.00000000000) 
combo_letter_panel_message_pos1 = PAIR(765.00000000000, 150.00000000000) 
combo_letter_panel_message_pos2 = PAIR(680.00000000000, 150.00000000000) 
skate_panel_message_pos1 = PAIR(795.00000000000, 150.00000000000) 
skate_panel_message_pos2 = PAIR(695.00000000000, 150.00000000000) 
net_score_menu_pos = PAIR(-40.00000000000, 80.00000000000) 
the_score_pot_scale = 0.80000001192 
the_time_scale = 0.21999999881 
the_time_alpha = 0.60000002384 
balance_meter_info = { 
	bar_positions = [ 
		PAIR(320.00000000000, 165.00000000000) 
		PAIR(250.00000000000, 224.00000000000) 
	] 
	bar_positions_mp_h = [ 
		PAIR(320.00000000000, 70.00000000000) 
		PAIR(250.00000000000, 130.00000000000) 
	] 
	bar_positions_mp_v = [ 
		PAIR(140.00000000000, 130.00000000000) 
		PAIR(80.00000000000, 224.00000000000) 
	] 
	arrow_positions = [ 
		PAIR(0.00000000000, -17.00000000000) 
		PAIR(10.00000000000, -17.00000000000) 
		PAIR(20.00000000000, -15.00000000000) 
		PAIR(30.00000000000, -11.00000000000) 
		PAIR(40.00000000000, -6.00000000000) 
		PAIR(50.00000000000, 1.00000000000) 
		PAIR(60.00000000000, 12.00000000000) 
	] 
} 
indicator_props_classic_top = { pos = PAIR(261.00000000000, 170.00000000000) just = [ center center ] } 
indicator_props_classic_bot = { pos = PAIR(261.00000000000, 278.00000000000) just = [ center center ] } 
indicator_props_classic_left = { pos = PAIR(266.00000000000, 176.00000000000) just = [ center center ] } 
indicator_props_classic_right = { pos = PAIR(374.00000000000, 176.00000000000) just = [ center center ] } 
indicator_props_modern_top = { pos = PAIR(250.00000000000, 224.00000000000) just = [ left center ] } 
indicator_props_modern_bot = { pos = PAIR(250.00000000000, 224.00000000000) just = [ right center ] } 
indicator_props_modern_left = { pos = PAIR(320.00000000000, 165.00000000000) just = [ right center ] } 
indicator_props_modern_right = { pos = PAIR(320.00000000000, 165.00000000000) just = [ left center ] } 
special_bar_colors = default_bar_colors 
default_bar_colors = [ 
	[ 128 0 9 128 ] 
	[ 81 107 128 128 ] 
	[ 128 0 9 128 ] 
] 
special_bar_interpolator_rate = 0.10000000149 
SCRIPT hide_panel_stuff 
	printf "*************** HIDING PANEL STUFF *********************" 
	IF ObjectExists id = player1_panel_container 
		printf "*************** HIDING PANEL STUFF 2 *********************" 
		DoScreenElementMorph { 
			id = player1_panel_container 
			alpha = 0 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT show_panel_stuff 
	printf "*************** SHOWING PANEL STUFF *********************" 
	IF ObjectExists id = player1_panel_container 
		printf "*************** SHOWING PANEL STUFF 2 *********************" 
		DoScreenElementMorph { 
			id = player1_panel_container 
			alpha = 1 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT destroy_panel_stuff 
	IF ScreenElementExists id = player1_panel_container 
		DestroyScreenElement id = player1_panel_container 
	ENDIF 
	IF ScreenElementExists id = player2_panel_container 
		DestroyScreenElement id = player2_panel_container 
	ENDIF 
	IF ScreenElementExists id = the_time 
		DestroyScreenElement id = the_time 
	ENDIF 
	IF ScreenElementExists id = current_goal 
		DestroyScreenElement id = current_goal 
	ENDIF 
	IF ScreenElementExists id = current_goal_key_combo_text 
		DestroyScreenElement id = current_goal_key_combo_text 
	ENDIF 
	IF ScreenElementExists id = goal_points_text 
		DestroyScreenElement id = goal_points_text 
	ENDIF 
	IF ScreenElementExists id = net_score_menu 
		DestroyScreenElement id = net_score_menu 
	ENDIF 
	update_goal_points_display kill 
	update_pager_icon kill 
	TantrumMessageKill 
ENDSCRIPT

SCRIPT create_player1_panel_container 
	IF ScreenElementExists id = player1_panel_container 
		DestroyScreenElement id = player1_panel_container 
	ENDIF 
	CreateScreenElement { 
		id = player1_panel_container 
		type = ContainerElement 
		parent = root_window 
		scale = 1.00000000000 
		dims = PAIR(640.00000000000, 448.00000000000) 
		pos = PAIR(0.00000000000, 0.00000000000) 
		just = [ top left ] 
	} 
ENDSCRIPT

SCRIPT create_panel_stuff 
	GetCurrentSkaterProfileIndex 
	GetSkaterProfileInfo player = <currentSkaterProfileIndex> 
	trick_text_dims = PAIR(580.00000000000, 60.00000000000) 
	trick_text_pos = PAIR(287.00000000000, 2.00000000000) 
	timer_pos = PAIR(315.00000000000, 34.00000000000) 
	timer_rgba = [ 128 128 128 128 ] 
	create_player1_panel_container 
	IF ScreenElementExists id = goal_retry_pad_select 
		DestroyScreenElement id = goal_retry_pad_select 
	ENDIF 
	CreateScreenElement { 
		type = ContainerElement 
		parent = root_window 
		id = goal_retry_pad_select 
		pos = PAIR(0.00000000000, 0.00000000000) 
		dims = PAIR(0.00000000000, 0.00000000000) 
		event_handlers = [ 
			{ pad_select goal_retry_select_handler } 
		] 
	} 
	FireEvent type = focus target = goal_retry_pad_select 
	IF InNetGame 
		IF NOT GameModeEquals is_goal_attack 
			GoalManager_GetTimeLeftInNetGame 
			IF GotParam time_left 
				IF ( <time_left> < 11000 ) 
					timer_rgba = [ 128 0 0 128 ] 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	CreateScreenElement { 
		id = the_time 
		type = textelement 
		parent = root_window 
		font = fake 
		text = "" 
		scale = ( the_time_scale ) 
		pos = <timer_pos> 
		just = [ center center ] 
		rgba = <timer_rgba> 
		alpha = ( the_time_alpha ) 
		shadow 
		shadow_offs = PAIR(1.00000000000, 1.00000000000) 
		shadow_rgba = [ 30 30 30 100 ] 
		z_priority = -1 
	} 
	CreateScreenElement { 
		id = current_goal 
		type = TextBlockElement 
		parent = root_window 
		font = small 
		internal_scale = 0.80000001192 
		text = " " 
		pos = PAIR(620.00000000000, 10.00000000000) 
		just = [ right top ] 
		internal_just = [ center top ] 
		dims = PAIR(250.00000000000, 100.00000000000) 
		rgba = [ 128 128 128 110 ] 
		shadow 
		shadow_offs = PAIR(0.50000000000, 0.50000000000) 
		shadow_rgba = [ 30 30 30 100 ] 
	} 
	CreateScreenElement { 
		type = textelement 
		parent = root_window 
		id = goal_points_text 
		font = small 
		pos = PAIR(585.00000000000, 40.00000000000) 
		just = [ left top ] 
		scale = 0 
		rgba = [ 105 105 105 128 ] 
		text = " " 
	} 
	CreateScreenElement { 
		id = special_meter_root_element 
		type = ContainerElement 
		parent = player1_panel_container 
		pos = ( ( THUGPRO_GlobalThemeInfo ) . SPECIAL_METER_ROOT_POS ) 
		just = [ left top ] 
		tags = [ hidden ] 
		alpha = 0 
	} 
	CreateScreenElement { 
		id = the_score 
		type = textelement 
		parent = special_meter_root_element 
		font = ( ( THUGPRO_GlobalThemeInfo ) . SCORE_FONT ) 
		text = "0" 
		scale = ( ( THUGPRO_GlobalThemeInfo ) . SCORE_SCALE ) 
		pos = ( ( THUGPRO_GlobalThemeInfo ) . SCORE_POS ) 
		just = [ left top ] 
		rgba = ( ( THUGPRO_GlobalThemeInfo ) . SCORE_RGBA ) 
	} 
	CreateScreenElement { 
		id = the_score_sprite 
		type = spriteelement 
		parent = special_meter_root_element 
		texture = ( ( THUGPRO_GlobalThemeInfo ) . SPECIAL_SCORE_SPRITE ) 
		scale = ( ( THUGPRO_GlobalThemeInfo ) . SPECIAL_SCORE_SPRITE_SCALE ) 
		pos = ( ( THUGPRO_GlobalThemeInfo ) . SPECIAL_SCORE_SPRITE_POS ) 
		rgba = ( ( THUGPRO_GlobalThemeInfo ) . SPECIAL_SCORE_COLOR ) 
	} 
	IF ( ( THUGPRO_GlobalThemeInfo ) . USE_SCORE_STRING = 1 ) 
		CreateScreenElement { 
			id = the_score_string_text 
			type = textelement 
			parent = special_meter_root_element 
			scale = 0.20000000298 
			just = [ left top ] 
			pos = PAIR(-90.00000000000, 10.50000000000) 
			font = bebas 
			text = "SCORE:" 
			rgba = ( ( THUGPRO_GlobalThemeInfo ) . SPECIAL_TEXT_COLOR ) 
		} 
	ENDIF 
	IF IsTrue display_SPECIAL_text 
		special_sprite_alpha = ( ( THUGPRO_GlobalThemeInfo ) . SPECIAL_TEXT_ALPHA ) 
	ELSE 
		special_sprite_alpha = 0.00000000000 
	ENDIF 
	CreateScreenElement { 
		id = the_special_bar_special 
		type = spriteelement 
		parent = the_score_sprite 
		texture = ( ( THUGPRO_GlobalThemeInfo ) . SPECIAL_TEXT_SPRITE ) 
		scale = ( ( THUGPRO_GlobalThemeInfo ) . SPECIAL_TEXT_SCALE ) 
		pos = ( ( THUGPRO_GlobalThemeInfo ) . SPECIAL_TEXT_POS ) 
		alpha = ( <special_sprite_alpha> ) 
		just = [ left top ] 
		rgba = ( ( THUGPRO_GlobalThemeInfo ) . SPECIAL_TEXT_COLOR ) 
		z_priority = 10 
	} 
	CreateScreenElement { 
		id = the_special_bar_sprite 
		type = spriteelement 
		parent = the_score_sprite 
		texture = ( ( THUGPRO_GlobalThemeInfo ) . SPECIAL_BAR_SPRITE ) 
		scale = ( ( THUGPRO_GlobalThemeInfo ) . SPECIAL_BAR_SPRITE_SCALE ) 
		pos = ( ( THUGPRO_GlobalThemeInfo ) . SPECIAL_BAR_SPRITE_POS ) 
		just = [ left top ] 
		rgba = [ 128 128 128 100 ] 
	} 
	CreateScreenElement { 
		id = the_boardstance_sprite 
		type = spriteelement 
		parent = the_score_sprite 
		texture = ( ( THUGPRO_GlobalThemeInfo ) . BOARDSTANCE_SPRITE ) 
		scale = ( ( THUGPRO_GlobalThemeInfo ) . BOARDSTANCE_SPRITE_SCALE ) 
		just = [ right top ] 
		pos = ( ( THUGPRO_GlobalThemeInfo ) . BOARDSTANCE_SPRITE_POS ) 
		rot_angle = ( ( THUGPRO_GlobalThemeInfo ) . BOARDSTANCE_SPRITE_ROT ) 
		rgba = [ 128 128 128 128 ] 
		alpha = 0.00000000000 
	} 
	CreateScreenElement { 
		id = the_boardstance_text 
		type = textelement 
		parent = the_score_sprite 
		text = "" 
		font = bebas 
		scale = 0.60000002384 
		just = [ right top ] 
		pos = ( ( THUGPRO_GlobalThemeInfo ) . BOARDSTANCE_SPRITE_POS ) 
		rgba = ( ( THUGPRO_GlobalThemeInfo ) . SPECIAL_TEXT_COLOR ) 
		alpha = 0.00000000000 
	} 
	CreateScreenElement { 
		id = generic_sponsor_logo 
		type = spriteelement 
		parent = the_score_sprite 
		texture = ( ( THUGPRO_GlobalThemeInfo ) . SPONSOR_TEXTURE ) 
		scale = ( ( THUGPRO_GlobalThemeInfo ) . SPONSOR_TEXTURE_SCALE ) 
		just = [ left top ] 
		pos = ( ( THUGPRO_GlobalThemeInfo ) . SPONSOR_TEXTURE_POS ) 
		rgba = [ 128 128 128 128 ] 
		alpha = ( ( THUGPRO_GlobalThemeInfo ) . SPONSOR_TEXTURE_ALPHA ) 
		z_priority = 0 
	} 
	CreateScreenElement { 
		id = trick_text_container 
		type = ContainerElement 
		parent = player1_panel_container 
		scale = 0.40000000596 
		dims = <trick_text_dims> 
		just = [ center center ] 
		alpha = 0.00000000000 
	} 
	CreateScreenElement { 
		id = the_trick_text 
		type = TextBlockElement 
		parent = trick_text_container 
		scale = 2.00000000000 
		pos = { PAIR(0.50000000000, 0.00000000000) proportional } 
		dims = <trick_text_dims> 
		just = [ center top ] 
		internal_just = [ center top ] 
		font = ( ( THUGPRO_GlobalThemeInfo ) . TRICK_TEXT_FONT ) 
		text = " " 
		internal_scale = 0.17249999940 
		alpha = 1.00000000000 
		tags = { tag_state = inactive } 
		shadow 
		shadow_offs = PAIR(0.80000001192, 0.60000002384) 
		shadow_rgba = [ 10 10 10 90 ] 
		z_priority = 0 
	} 
	CreateScreenElement { 
		id = the_score_pot_text 
		type = textelement 
		parent = trick_text_container 
		scale = 0.25000000000 
		pos = { PAIR(0.50000000000, 0.00000000000) proportional } 
		just = [ center bottom ] 
		font = ( ( THUGPRO_GlobalThemeInfo ) . HUD_FONT ) 
		text = " " 
		alpha = 1.00000000000 
		z_priority = 0 
		shadow 
		shadow_offs = PAIR(0.30000001192, 0.30000001192) 
		shadow_rgba = [ 30 30 30 100 ] 
	} 
	reset_trick_text_appearance the_score_pot_text_id = the_score_pot_text the_trick_text_id = the_trick_text trick_text_container_id = trick_text_container 
	CreateScreenElement { 
		id = the_balance_meter 
		type = spriteelement 
		parent = player1_panel_container 
		texture = ( ( THUGPRO_GlobalThemeInfo ) . BALANCE_METER_SPRITE ) 
		scale = ( ( THUGPRO_GlobalThemeInfo ) . BALANCE_METER_SCALE ) 
		just = [ center center ] 
		rgba = [ 128 128 128 0 ] 
		tags = { tag_turned_on = 0 tag_mode = balance } 
	} 
	CreateScreenElement { 
		id = the_balance_arrow 
		type = spriteelement 
		parent = player1_panel_container 
		texture = ( ( THUGPRO_GlobalThemeInfo ) . BALANCE_ARROW_SPRITE ) 
		scale = ( ( THUGPRO_GlobalThemeInfo ) . BALANCE_ARROW_SCALE ) 
		just = [ center center ] 
		rgba = [ 128 128 128 0 ] 
		z_priority = 11 
	} 
	CreateScreenElement { 
		type = spriteelement 
		parent = player1_panel_container 
		id = balance_indicator_top 
		texture = ( ( THUGPRO_GlobalThemeInfo ) . BALANCE_INDICATOR_B_SPRITE ) 
		scale = ( ( THUGPRO_GlobalThemeInfo ) . BALANCE_METER_SCALE ) 
		rot_angle = -90 
		just = ( ( indicator_props_modern_top ) . just ) 
		pos = ( ( indicator_props_modern_top ) . pos ) 
		rgba = [ 128 0 0 128 ] 
		alpha = 0 
		z_priority = 7 
	} 
	CreateScreenElement { 
		type = spriteelement 
		parent = player1_panel_container 
		id = balance_indicator_bot 
		texture = ( ( THUGPRO_GlobalThemeInfo ) . BALANCE_INDICATOR_A_SPRITE ) 
		scale = ( ( THUGPRO_GlobalThemeInfo ) . BALANCE_METER_SCALE ) 
		rot_angle = -90 
		just = ( ( indicator_props_modern_bot ) . just ) 
		pos = ( ( indicator_props_modern_bot ) . pos ) 
		rgba = [ 128 0 0 128 ] 
		alpha = 0 
		z_priority = 7 
	} 
	CreateScreenElement { 
		type = spriteelement 
		parent = player1_panel_container 
		id = balance_indicator_left 
		texture = ( ( THUGPRO_GlobalThemeInfo ) . BALANCE_INDICATOR_A_SPRITE ) 
		scale = ( ( THUGPRO_GlobalThemeInfo ) . BALANCE_METER_SCALE ) 
		just = ( ( indicator_props_modern_left ) . just ) 
		pos = ( ( indicator_props_modern_left ) . pos ) 
		rgba = [ 128 0 0 128 ] 
		alpha = 0 
		z_priority = 7 
	} 
	CreateScreenElement { 
		type = spriteelement 
		parent = player1_panel_container 
		id = balance_indicator_right 
		texture = ( ( THUGPRO_GlobalThemeInfo ) . BALANCE_INDICATOR_B_SPRITE ) 
		scale = ( ( THUGPRO_GlobalThemeInfo ) . BALANCE_METER_SCALE ) 
		just = ( ( indicator_props_modern_right ) . just ) 
		pos = ( ( indicator_props_modern_right ) . pos ) 
		rgba = [ 128 0 0 128 ] 
		alpha = 0 
		z_priority = 7 
	} 
	CreateScreenElement { 
		id = the_run_timer 
		type = spriteelement 
		parent = player1_panel_container 
		texture = watch 
		scale = 1.00000000000 
		just = [ center center ] 
		pos = PAIR(400.00000000000, 240.00000000000) 
		alpha = 0 
		rgba = [ 128 128 128 90 ] 
		tags = { tag_turned_on = 0 tag_mode = balance } 
	} 
	CreateScreenElement { 
		id = the_run_timer_hand 
		type = spriteelement 
		parent = the_run_timer 
		texture = hand 
		scale = 1.00000000000 
		pos = PAIR(24.00000000000, 24.00000000000) 
		just = [ center center ] 
		rgba = [ 128 128 128 128 ] 
		z_priority = 5 
	} 
	CreateScreenElement { 
		type = spriteelement 
		parent = the_run_timer 
		texture = time_1 
		scale = 1.00000000000 
		pos = PAIR(7.00000000000, 8.00000000000) 
		just = [ left top ] 
		rgba = [ 128 128 128 128 ] 
		z_priority = 3 
	} 
	GetStackedScreenElementPos Y id = <id> 
	CreateScreenElement { 
		type = spriteelement 
		parent = the_run_timer 
		texture = time_2 
		scale = 1.00000000000 
		pos = <pos> 
		just = [ left top ] 
		rgba = [ 128 128 128 128 ] 
		z_priority = 3 
	} 
	GetStackedScreenElementPos Y id = <id> 
	CreateScreenElement { 
		type = spriteelement 
		parent = the_run_timer 
		texture = time_3 
		scale = 1.00000000000 
		pos = <pos> 
		just = [ left top ] 
		rgba = [ 128 128 128 128 ] 
		z_priority = 3 
	} 
	GetStackedScreenElementPos Y id = <id> 
	CreateScreenElement { 
		type = spriteelement 
		parent = the_run_timer 
		texture = time_4 
		scale = 1.00000000000 
		pos = <pos> 
		just = [ left top ] 
		rgba = [ 128 128 128 128 ] 
		z_priority = 3 
	} 
	GetStackedScreenElementPos Y id = <id> 
	CreateScreenElement { 
		type = spriteelement 
		parent = the_run_timer 
		texture = time_5 
		scale = 1.00000000000 
		pos = <pos> 
		just = [ left top ] 
		rgba = [ 128 128 128 128 ] 
		z_priority = 3 
	} 
	GetStackedScreenElementPos Y id = <id> 
	CreateScreenElement { 
		type = spriteelement 
		parent = the_run_timer 
		texture = time_6 
		scale = 1.00000000000 
		pos = <pos> 
		just = [ left top ] 
		rgba = [ 128 128 128 128 ] 
		z_priority = 3 
	} 
	GetStackedScreenElementPos Y id = <id> 
	CreateScreenElement { 
		type = spriteelement 
		parent = the_run_timer 
		texture = time_7 
		scale = 1.00000000000 
		pos = <pos> 
		just = [ left top ] 
		rgba = [ 128 128 128 128 ] 
		z_priority = 3 
	} 
	GetStackedScreenElementPos Y id = <id> 
	CreateScreenElement { 
		type = spriteelement 
		parent = the_run_timer 
		texture = time_8 
		scale = 1.00000000000 
		pos = <pos> 
		just = [ left top ] 
		rgba = [ 128 128 128 128 ] 
		z_priority = 3 
	} 
	IF GetGlobalFlag flag = NO_DISPLAY_HUD 
		GoalManager_HidePoints 
		GoalManager_HideGoalPoints 
	ELSE 
		update_goal_points_display create 
	ENDIF 
	IF InNetGame 
		IF IsObserving 
			hide_panel_stuff 
		ENDIF 
		create_score_menu 
		create_net_panel_message_menu 
	ENDIF 
ENDSCRIPT

newtrickfont_colors = [ 
	[ 0 128 230 120 ] 
	[ 200 90 11 120 ] 
	[ 0 128 0 120 ] 
	[ 128 0 0 120 ] 
	[ 128 128 128 128 ] 
	[ 128 128 128 128 ] 
	[ 128 128 128 128 ] 
	[ 128 128 128 128 ] 
	[ 128 128 128 128 ] 
	[ 128 128 128 128 ] 
	[ 128 128 128 128 ] 
	[ 128 128 128 128 ] 
	[ 128 128 128 128 ] 
	[ 128 128 128 128 ] 
	[ 128 128 128 128 ] 
	[ 128 128 128 128 ] 
] 
SCRIPT UpdateScorepot 
	IF GetGlobalFlag flag = NO_DISPLAY_BASESCORE 
		DoScreenElementMorph id = the_score_pot_text alpha = 0.00000000000 remember_alpha 
	ENDIF 
ENDSCRIPT

SCRIPT UpdateTrickText 
	IF GetGlobalFlag flag = NO_DISPLAY_TRICKSTRING 
		DoScreenElementMorph id = the_trick_text alpha = 0.00000000000 remember_alpha 
		SetScreenElementProps id = the_trick_text override_encoded_rgba remember_override_rgba_state 
	ENDIF 
ENDSCRIPT

SCRIPT pause_trick_text 
	SetScreenElementProps id = the_trick_text hide 
	SetScreenElementProps id = the_score_pot_text hide 
ENDSCRIPT

SCRIPT unpause_trick_text 
	IF NOT GetGlobalFlag flag = NO_DISPLAY_TRICKSTRING 
		SetScreenElementProps id = the_trick_text unhide 
	ENDIF 
	IF NOT GetGlobalFlag flag = NO_DISPLAY_BASESCORE 
		SetScreenElementProps id = the_score_pot_text unhide 
	ENDIF 
ENDSCRIPT

SCRIPT trick_text_pulse 
	IF NOT GetGlobalFlag flag = NO_DISPLAY_TRICKSTRING 
		TerminateObjectsScripts id = <trick_text_container_id> 
		TerminateObjectsScripts id = <the_trick_text_id> 
		RunScriptOnScreenElement id = <the_trick_text_id> do_trick_text_pulse params = { <...> } 
	ENDIF 
	IF NOT GetGlobalFlag flag = NO_DISPLAY_BASESCORE 
		TerminateObjectsScripts id = <the_score_pot_text_id> script_name = do_score_pot_text_landed 
		RunScriptOnScreenElement id = <the_trick_text_id> do_trick_text_pulse params = { <...> } 
	ENDIF 
ENDSCRIPT

spazz_out_text = "\\cgFREAK OUT!\\c0" 
SCRIPT do_trick_text_pulse 
	reset_trick_text_appearance <...> 
	IF NOT GetGlobalFlag flag = NO_DISPLAY_TRICKSTRING 
		GetTextElementString id = <the_trick_text_id> 
		IF StringEquals a = <string> b = ( ( spazz_out_text ) + " " ) 
			do_trick_text_spazz <...> 
		ELSE 
			DoMorph scale = 1.00000000000 time = 0.20000000298 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT do_trick_text_spazz 
	BEGIN 
		rot_angle = 0 
		DoMorph scale = 2.29999995232 time = 0.10000000149 alpha = 0.69999998808 
		DoMorph scale = 0.89999997616 time = 0.10000000149 alpha = 1 
		DoMorph scale = 1.29999995232 time = 0.10000000149 alpha = 0.60000002384 
		DoMorph scale = 1.10000002384 time = 0.10000000149 alpha = 0.89999997616 
	REPEAT 
ENDSCRIPT

SCRIPT trick_text_landed 
	IF NOT GetGlobalFlag flag = NO_DISPLAY_TRICKSTRING 
		TerminateObjectsScripts id = <trick_text_container_id> 
		TerminateObjectsScripts id = <the_trick_text_id> 
	ENDIF 
	IF NOT GetGlobalFlag flag = NO_DISPLAY_BASESCORE 
		TerminateObjectsScripts id = <the_score_pot_text_id> 
	ENDIF 
	RunScriptOnScreenElement id = <the_score_pot_text_id> do_score_pot_text_landed params = { <...> } 
	RunScriptOnScreenElement id = <the_trick_text_id> do_trick_text_landed params = { <...> } 
ENDSCRIPT

SCRIPT do_trick_text_landed 
	reset_trick_text_appearance <...> 
	IF NOT GetGlobalFlag flag = NO_DISPLAY_TRICKSTRING 
		DoMorph scale = 0 time = 0 
		DoMorph scale = 1.39999997616 time = 0.20000000298 
		DoMorph scale = 0.80000001192 time = 0.07999999821 
		DoMorph scale = 1.20000004768 time = 0.05000000075 
		DoMorph scale = 0.89999997616 time = 0.03999999911 
		DoMorph scale = 1.00000000000 time = 0.03999999911 
	ENDIF 
ENDSCRIPT

SCRIPT do_score_pot_text_landed 
	IF NOT GetGlobalFlag flag = NO_DISPLAY_BASESCORE 
		wait 1 gameframe 
		SetScreenElementProps id = <the_score_pot_text_id> rgba = ( ( THUGPRO_GlobalThemeInfo ) . BG_PARTS_COLOR ) 
		SetScreenElementProps id = <the_score_pot_text_id> override_encoded_rgba 
		DoMorph relative_scale scale = 0 time = 0.05000000075 
		DoMorph relative_scale scale = 1.79999995232 time = 0.11999999732 
		DoMorph relative_scale scale = 0.80000001192 time = 0.10000000149 
		DoMorph relative_scale scale = 1.50000000000 time = 0.07000000030 
		DoMorph relative_scale scale = 0.89999997616 time = 0.07000000030 
		DoMorph relative_scale scale = 1.29999995232 time = 0.05000000075 
		DoMorph relative_scale scale = 1.00000000000 time = 0.05000000075 
		DoMorph relative_scale scale = 1.25000000000 time = 0.03999999911 
		DoMorph relative_scale scale = 1.10000002384 time = 0.02999999933 
		DoMorph relative_scale scale = 1.20000004768 time = 0.01999999955 
	ENDIF 
ENDSCRIPT

SCRIPT trick_text_countdown 
	IF NOT GetGlobalFlag flag = NO_DISPLAY_TRICKSTRING 
		TerminateObjectsScripts id = <trick_text_container_id> 
		TerminateObjectsScripts id = <the_trick_text_id> 
	ENDIF 
	RunScriptOnScreenElement id = <the_trick_text_id> do_trick_text_countdown params = { <...> } 
ENDSCRIPT

SCRIPT do_trick_text_countdown 
	IF NOT GetGlobalFlag flag = NO_DISPLAY_TRICKSTRING 
		DoMorph scale = 0.00000000000 time = 0.50000000000 
		DoMorph alpha = 0.00000000000 
	ENDIF 
ENDSCRIPT

SCRIPT trick_text_bail 
	IF NOT GetGlobalFlag flag = NO_DISPLAY_TRICKSTRING 
		TerminateObjectsScripts id = <trick_text_container_id> 
		TerminateObjectsScripts id = <the_trick_text_id> 
	ENDIF 
	RunScriptOnScreenElement id = <trick_text_container_id> do_trick_text_bail params = { <...> } 
ENDSCRIPT

SCRIPT do_trick_text_bail 
	reset_trick_text_appearance <...> 
	IF NOT GetGlobalFlag flag = NO_DISPLAY_BASESCORE 
		SetScreenElementProps id = <the_score_pot_text_id> rgba = [ 128 32 32 80 ] 
	ENDIF 
	IF NOT GetGlobalFlag flag = NO_DISPLAY_TRICKSTRING 
		GetTextElementString id = <the_trick_text_id> 
		SetScreenElementProps id = <the_trick_text_id> rgba = [ 128 32 32 80 ] text = <string> 
		SetScreenElementProps id = <the_trick_text_id> override_encoded_rgba 
	ENDIF 
	wait 0.05000000075 seconds 
	DoMorph alpha = 0 scale = 0 time = 0 
	DoMorph pos = { PAIR(0.00000000000, 25.00000000000) relative } scale = PAIR(0.69999998808, 1.79999995232) alpha = 1 time = 0.05000000075 
	DoMorph pos = { PAIR(0.00000000000, -25.00000000000) relative } scale = 0.89999997616 time = 0.10000000149 
	DoMorph pos = { PAIR(0.00000000000, 20.00000000000) relative } scale = 1.14999997616 time = 0.05999999866 
	DoMorph pos = { PAIR(0.00000000000, -20.00000000000) relative } scale = 1.12000000477 time = 0.05999999866 
	DoMorph pos = { PAIR(0.00000000000, 10.00000000000) relative } scale = 1.10000002384 time = 0.05000000075 
	DoMorph pos = { PAIR(0.00000000000, -10.00000000000) relative } time = 0.05000000075 
	DoMorph pos = { PAIR(0.00000000000, 5.00000000000) relative } time = 0.03999999911 
	DoMorph pos = { PAIR(0.00000000000, -5.00000000000) relative } time = 0.03999999911 
	wait 1.29999995232 seconds 
	DoMorph pos = { PAIR(-2.00000000000, 4.00000000000) relative } time = 0.05000000075 
	DoMorph pos = { PAIR(-3.00000000000, 6.00000000000) relative } time = 0.05000000075 
	DoMorph pos = { PAIR(5.00000000000, 1.00000000000) relative } time = 0.05000000075 
	DoMorph pos = { PAIR(-3.00000000000, -4.00000000000) relative } time = 0.05000000075 
	DoMorph pos = { PAIR(2.00000000000, -5.00000000000) relative } time = 0.05000000075 
	DoMorph pos = { PAIR(4.00000000000, -1.00000000000) relative } time = 0.05000000075 
	DoMorph pos = { PAIR(-3.00000000000, 2.00000000000) relative } time = 0.05000000075 
	DoMorph pos = { PAIR(4.00000000000, -5.00000000000) relative } time = 0.05000000075 
	DoMorph pos = { PAIR(-1.00000000000, 2.00000000000) relative } time = 0.05000000075 
	DoMorph pos = { PAIR(-3.00000000000, -4.00000000000) relative } time = 0.05000000075 
	DoMorph pos = { PAIR(2.00000000000, -4.00000000000) relative } time = 0.05000000075 
	DoMorph pos = { PAIR(3.00000000000, -6.00000000000) relative } time = 0.05000000075 
	DoMorph pos = { PAIR(-5.00000000000, -1.00000000000) relative } time = 0.05000000075 
	DoMorph pos = { PAIR(3.00000000000, 4.00000000000) relative } time = 0.05000000075 
	DoMorph pos = { PAIR(-2.00000000000, 5.00000000000) relative } time = 0.05000000075 
	DoMorph pos = { PAIR(-4.00000000000, 1.00000000000) relative } time = 0.05000000075 
	DoMorph pos = { PAIR(3.00000000000, -2.00000000000) relative } time = 0.05000000075 
	DoMorph pos = { PAIR(-4.00000000000, 5.00000000000) relative } time = 0.05000000075 
	DoMorph pos = { PAIR(1.00000000000, -2.00000000000) relative } time = 0.05000000075 
	DoMorph pos = { PAIR(3.00000000000, 4.00000000000) relative } time = 0.05000000075 
	RANDOM(1, 1, 1, 1, 1, 1, 1, 1, 1, 1) RANDOMCASE runtwoscripts script_text = bail1 script_score = bail1 <...> 
		RANDOMCASE runtwoscripts script_text = bail1 script_score = bail1 <...> 
		RANDOMCASE runtwoscripts script_text = bail2 script_score = bail3 <...> 
		RANDOMCASE runtwoscripts script_text = bail4 script_score = bail5 <...> 
		RANDOMCASE runtwoscripts script_text = bail5 script_score = bail4 <...> 
		RANDOMCASE runtwoscripts script_text = bail1 script_score = bail6 <...> 
		RANDOMCASE runtwoscripts script_text = bail6 script_score = bail6 <...> 
		RANDOMCASE runtwoscripts script_text = bail4 script_score = bail4 <...> 
		RANDOMCASE runtwoscripts script_text = bail5 script_score = bail5 <...> 
		RANDOMCASE runtwoscripts script_text = bail2 script_score = bail1 <...> 
	RANDOMEND 
ENDSCRIPT

SCRIPT runtwoscripts 
	IF NOT GetGlobalFlag flag = NO_DISPLAY_TRICKSTRING 
		RunScriptOnScreenElement id = <the_trick_text_id> <script_text> 
	ENDIF 
	IF NOT GetGlobalFlag flag = NO_DISPLAY_BASESCORE 
		RunScriptOnScreenElement id = <the_score_pot_text_id> <script_score> 
	ENDIF 
ENDSCRIPT

SCRIPT bail1 
	DoMorph pos = { PAIR(0.00000000000, 0.00000000000) relative } time = 0.10000000149 relative_scale scale = 1.89999997616 anim = fast_in 
	DoMorph pos = { PAIR(0.00000000000, 0.00000000000) relative } time = 0.30000001192 relative_scale scale = 3.00000000000 alpha = 0 anim = fast_in 
	DoMorph pos = { PAIR(0.00000000000, 0.00000000000) relative } relative_scale scale = 1.00000000000 alpha = 0 anim = fast_in 
ENDSCRIPT

SCRIPT bail2 
	DoMorph pos = { PAIR(0.00000000000, -5.00000000000) relative } time = 0.40000000596 
	DoMorph pos = { PAIR(0.00000000000, 448.00000000000) relative } time = 0.69999998808 anim = fast_in 
	DoMorph alpha = 0.00000000000 
	DoMorph pos = { PAIR(0.00000000000, -443.00000000000) relative } relative_scale scale = 1.00000000000 alpha = 0 anim = fast_in 
ENDSCRIPT

SCRIPT bail3 
	wait 0.10000000149 second 
	DoMorph pos = { PAIR(0.00000000000, -5.00000000000) relative } time = 0.20000000298 
	DoMorph pos = { PAIR(3.00000000000, 0.00000000000) relative } time = 0.05000000075 
	DoMorph pos = { PAIR(-3.00000000000, 0.00000000000) relative } time = 0.05000000075 
	DoMorph pos = { PAIR(4.00000000000, 0.00000000000) relative } time = 0.05000000075 
	DoMorph pos = { PAIR(-4.00000000000, 0.00000000000) relative } time = 0.05000000075 
	DoMorph pos = { PAIR(0.00000000000, 448.00000000000) relative } time = 0.50000000000 anim = fast_in 
	DoMorph alpha = 0.00000000000 
	DoMorph pos = { PAIR(0.00000000000, -443.00000000000) relative } relative_scale scale = 1.00000000000 alpha = 0 anim = fast_in 
ENDSCRIPT

SCRIPT bail4 
	DoMorph pos = { PAIR(-15.00000000000, 0.00000000000) relative } time = 0.10000000149 
	DoMorph pos = { PAIR(0.00000000000, 4.00000000000) relative } time = 0.01999999955 
	DoMorph pos = { PAIR(0.00000000000, -4.00000000000) relative } time = 0.01999999955 
	DoMorph pos = { PAIR(0.00000000000, 2.00000000000) relative } time = 0.01999999955 
	DoMorph pos = { PAIR(0.00000000000, -2.00000000000) relative } time = 0.01999999955 
	DoMorph pos = { PAIR(150.00000000000, 0.00000000000) relative } time = 0.05999999866 alpha = 0.69999998808 
	DoMorph pos = { PAIR(200.00000000000, 0.00000000000) relative } relative_scale scale = PAIR(2.00000000000, 0.10000000149) time = 0.05999999866 alpha = 0 anim = fast_in 
	DoMorph pos = { PAIR(200.00000000000, 0.00000000000) relative } time = 0 
	DoMorph pos = { PAIR(-535.00000000000, 0.00000000000) relative } relative_scale scale = 1.00000000000 alpha = 0 anim = fast_in 
ENDSCRIPT

SCRIPT bail5 
	DoMorph pos = { PAIR(15.00000000000, 0.00000000000) relative } time = 0.10000000149 
	DoMorph pos = { PAIR(0.00000000000, 4.00000000000) relative } time = 0.01999999955 
	DoMorph pos = { PAIR(0.00000000000, -4.00000000000) relative } time = 0.01999999955 
	DoMorph pos = { PAIR(0.00000000000, 2.00000000000) relative } time = 0.01999999955 
	DoMorph pos = { PAIR(0.00000000000, -2.00000000000) relative } time = 0.01999999955 
	DoMorph pos = { PAIR(-150.00000000000, 0.00000000000) relative } time = 0.05999999866 alpha = 0.69999998808 
	DoMorph pos = { PAIR(-200.00000000000, 0.00000000000) relative } relative_scale scale = PAIR(2.00000000000, 0.10000000149) time = 0.05999999866 alpha = 0 anim = fast_in 
	DoMorph pos = { PAIR(-200.00000000000, 0.00000000000) relative } time = 0 
	DoMorph pos = { PAIR(535.00000000000, 0.00000000000) relative } relative_scale scale = 1.00000000000 alpha = 0 anim = fast_in 
ENDSCRIPT

SCRIPT bail6 
	DoMorph pos = { PAIR(0.00000000000, 0.00000000000) relative } time = 0.20000000298 relative_scale scale = 1.29999995232 alpha = 0.60000002384 anim = fast_in 
	wait 0.20000000298 second 
	DoMorph pos = { PAIR(0.00000000000, 0.00000000000) relative } time = 0.15000000596 relative_scale scale = 0 alpha = 0 anim = fast_in 
ENDSCRIPT

SCRIPT reset_just_trick_text_appearance 
	IF NOT GetGlobalFlag flag = NO_DISPLAY_TRICKSTRING 
		DoScreenElementMorph { 
			id = <trick_text_container_id> 
			alpha = 1.00000000000 
			pos = PAIR(320.00000000000, 410.00000000000) 
			scale = 1.00000000000 
		} 
		DoScreenElementMorph { 
			id = <the_trick_text_id> 
			scale = 1.00000000000 
			pos = { PAIR(0.50000000000, 0.00000000000) proportional } 
			just = [ center top ] 
			internal_just = [ center top ] 
			internal_scale = 0.69999998808 
			alpha = 1.00000000000 
		} 
		SetScreenElementProps id = <the_trick_text_id> dont_override_encoded_rgba 
		SetScreenElementProps id = <the_trick_text_id> rgba = [ 128 128 128 80 ] 
	ELSE 
		DoScreenElementMorph { 
			id = <trick_text_container_id> 
			alpha = 1.00000000000 
			pos = PAIR(320.00000000000, 410.00000000000) 
			scale = 1.00000000000 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT reset_trick_text_appearance 
	TerminateObjectsScripts id = <the_trick_text_id> script_name = bail1 
	TerminateObjectsScripts id = <the_trick_text_id> script_name = bail2 
	TerminateObjectsScripts id = <the_trick_text_id> script_name = bail3 
	TerminateObjectsScripts id = <the_trick_text_id> script_name = bail4 
	TerminateObjectsScripts id = <the_trick_text_id> script_name = bail5 
	TerminateObjectsScripts id = <the_trick_text_id> script_name = bail6 
	TerminateObjectsScripts id = <the_trick_text_id> script_name = do_trick_text_spazz 
	reset_just_trick_text_appearance <...> 
	IF NOT GetGlobalFlag flag = NO_DISPLAY_BASESCORE 
		TerminateObjectsScripts id = <the_score_pot_text_id> script_name = bail1 
		TerminateObjectsScripts id = <the_score_pot_text_id> script_name = bail2 
		TerminateObjectsScripts id = <the_score_pot_text_id> script_name = bail3 
		TerminateObjectsScripts id = <the_score_pot_text_id> script_name = bail4 
		TerminateObjectsScripts id = <the_score_pot_text_id> script_name = bail5 
		TerminateObjectsScripts id = <the_score_pot_text_id> script_name = bail6 
		SetScreenElementProps id = <the_score_pot_text_id> rgba = ( ( THUGPRO_GlobalThemeInfo ) . HIGHLIGHTED_TEXT_COLOR ) 
		SetScreenElementProps id = <the_score_pot_text_id> dont_override_encoded_rgba 
		DoScreenElementMorph { 
			id = <the_score_pot_text_id> 
			scale = 0.25000000000 
			pos = PAIR(287.00000000000, 2.00000000000) 
			just = [ center bottom ] 
			alpha = 1.00000000000 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT HideClock 
	KillSpawnedScript name = clock_morph 
	DoScreenElementMorph { id = the_time alpha = 0 } 
ENDSCRIPT

SCRIPT ShowClock 
	DoScreenElementMorph { id = the_time alpha = ( the_time_alpha ) } 
ENDSCRIPT

SCRIPT pause_special_meter 
	RunScriptOnScreenElement id = special_meter_root_element hide_special_meter 
ENDSCRIPT

SCRIPT unpause_special_meter 
	RunScriptOnScreenElement id = special_meter_root_element unhide_special_meter 
ENDSCRIPT

SCRIPT hide_special_meter 
	IF ScreenElementExists id = special_meter_root_element 
		DoScreenElementMorph id = special_meter_root_element alpha = 0 
		special_meter_root_element : SetTags hidden 
	ENDIF 
	IF ScreenElementExists id = the_score_string_text 
		SetScreenElementProps id = the_score_string_text hide 
	ENDIF 
ENDSCRIPT

SCRIPT unhide_special_meter 
	IF ScreenElementExists id = special_meter_root_element 
		DoScreenElementMorph id = special_meter_root_element alpha = 1 
		special_meter_root_element : RemoveTags tags = [ hidden ] 
	ENDIF 
	IF ScreenElementExists id = the_score_string_text 
		SetScreenElementProps id = the_score_string_text unhide 
	ENDIF 
ENDSCRIPT

SCRIPT hide_balance_meter 
	SetScreenElementProps id = <id> tags = { tag_turned_on = 0 } 
	RunScriptOnScreenElement id = <id> do_hide_balance_meter params = { id = <id> } 
ENDSCRIPT

SCRIPT pause_balance_meter 
	RunScriptOnScreenElement id = the_balance_meter do_hide_balance_meter params = { id = the_balance_meter } 
ENDSCRIPT

SCRIPT do_hide_balance_meter 
	SetScreenElementProps id = the_balance_meter rgba = [ 128 128 128 0 ] 
	SetScreenElementProps id = the_balance_arrow rgba = [ 128 128 128 0 ] 
	SetScreenElementProps id = balance_indicator_top alpha = 0 
	SetScreenElementProps id = balance_indicator_left alpha = 0 
	SetScreenElementProps id = balance_indicator_right alpha = 0 
	SetScreenElementProps id = balance_indicator_bot alpha = 0 
ENDSCRIPT

SCRIPT show_balance_meter 
	IF NOT GetGlobalFlag flag = NO_DISPLAY_BALANCE 
		IF NOT ( ( InNetGame ) & ( GetGlobalFlag flag = NO_G_DISPLAY_BALANCE ) ) 
			SetScreenElementProps id = <id> tags = { tag_turned_on = 1 } 
			RunScriptOnScreenElement id = <id> do_show_balance_meter params = { id = <id> } 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT unpause_balance_meter 
	RunScriptOnScreenElement id = the_balance_meter do_show_balance_meter params = { id = the_balance_meter } 
ENDSCRIPT

SCRIPT do_show_balance_meter 
	IF NOT GetGlobalFlag flag = NO_DISPLAY_BALANCE 
		IF NOT ( ( InNetGame ) & ( GetGlobalFlag flag = NO_G_DISPLAY_BALANCE ) ) 
			GetTags 
			IF IntegerEquals a = <tag_turned_on> b = 1 
				SetScreenElementProps id = the_balance_meter rgba = ( ( THUGPRO_GlobalThemeInfo ) . BALANCE_METER_COLOR ) 
				SetScreenElementProps id = the_balance_arrow rgba = ( ( THUGPRO_GlobalThemeInfo ) . BALANCE_ARROW_COLOR ) 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT update_balance_meter_indicator 
	root_window : GetSingleTag menu_state 
	IF ( <menu_state> = on ) 
		value = 0 
	ENDIF 
	IF NOT IsTrue display_balance_indicators 
		value = 0 
	ENDIF 
	IF GetGlobalFlag flag = NO_DISPLAY_BALANCE 
		value = 0 
	ENDIF 
	IF ( ( InNetGame ) & ( GetGlobalFlag flag = NO_G_DISPLAY_BALANCE ) ) 
		value = 0 
	ENDIF 
	rgba_bail = [ 128 0 0 128 ] 
	rgba_land = [ 0 128 0 128 ] 
	IF ( ( ( THUGPRO_GlobalThemeInfo ) . BALANCE_INDICATOR_B_SPRITE ) = BALANCE_GLOW_THUG2_B ) 
		rgba_bail = ( ( THUGPRO_GlobalThemeInfo ) . BALANCE_ARROW_COLOR ) 
		rgba_land = ( ( THUGPRO_GlobalThemeInfo ) . BALANCE_ARROW_COLOR ) 
	ENDIF 
	IF GotParam vertical 
		<SkaterId> : GetSingleTag OffMeterBail 
		IF GotParam OffMeterBail 
			rgba_top = <rgba_bail> 
			rgba_bot = <rgba_bail> 
		ELSE 
			IF ( <BalanceTrickType> = NoseManual ) 
				rgba_top = <rgba_bail> 
				rgba_bot = <rgba_land> 
			ELSE 
				IF ( <BalanceTrickType> = Manual ) 
					rgba_top = <rgba_land> 
					rgba_bot = <rgba_bail> 
				ENDIF 
			ENDIF 
		ENDIF 
		IF ( ( ( THUGPRO_GlobalThemeInfo ) . BALANCE_INDICATOR_A_SPRITE ) = circle ) 
			rgba_top = ( ( THUGPRO_GlobalThemeInfo ) . HIGHLIGHTED_TEXT_COLOR ) 
			rgba_bot = ( ( THUGPRO_GlobalThemeInfo ) . HIGHLIGHTED_TEXT_COLOR ) 
			<scaled_value> = ( <value> * 0.50000000000 ) 
			IF ScreenElementExists id = balance_indicator_top 
				SetScreenElementProps { 
					id = balance_indicator_top 
					pos = ( ( indicator_props_classic_top ) . pos ) 
					just = ( ( indicator_props_classic_top ) . just ) 
				} 
				IF NOT ( ( <value> ) = 0.00000000000 ) 
					DoScreenElementMorph id = balance_indicator_top alpha = 1 
				ELSE 
					DoScreenElementMorph id = balance_indicator_top alpha = 0 
				ENDIF 
				DoScreenElementMorph id = balance_indicator_top scale = ( 0.50000000000 + <scaled_value> ) 
				DoScreenElementMorph id = balance_indicator_top rgba = <rgba_top> 
			ENDIF 
			IF ScreenElementExists id = balance_indicator_bot 
				SetScreenElementProps { 
					id = balance_indicator_bot 
					pos = ( ( indicator_props_classic_bot ) . pos ) 
					just = ( ( indicator_props_classic_bot ) . just ) 
				} 
				IF NOT ( ( <value> ) = 0.00000000000 ) 
					DoScreenElementMorph id = balance_indicator_bot alpha = 1 
				ELSE 
					DoScreenElementMorph id = balance_indicator_bot alpha = 0 
				ENDIF 
				DoScreenElementMorph id = balance_indicator_bot scale = ( 0.50000000000 + ( -1 * <scaled_value> ) ) 
				DoScreenElementMorph id = balance_indicator_bot rgba = <rgba_bot> 
			ENDIF 
		ELSE 
			IF ScreenElementExists id = balance_indicator_top 
				SetScreenElementProps { 
					id = balance_indicator_top 
					pos = ( ( indicator_props_modern_top ) . pos ) 
					just = ( ( indicator_props_modern_top ) . just ) 
				} 
				DoScreenElementMorph id = balance_indicator_top alpha = <value> 
				DoScreenElementMorph id = balance_indicator_top rgba = <rgba_top> 
			ENDIF 
			IF ScreenElementExists id = balance_indicator_bot 
				SetScreenElementProps { 
					id = balance_indicator_bot 
					pos = ( ( indicator_props_modern_bot ) . pos ) 
					just = ( ( indicator_props_modern_bot ) . just ) 
				} 
				DoScreenElementMorph id = balance_indicator_bot alpha = ( -1 * <value> ) 
				DoScreenElementMorph id = balance_indicator_bot rgba = <rgba_bot> 
			ENDIF 
		ENDIF 
	ELSE 
		SWITCH <BalanceTrickType> 
			CASE Slide 
			CASE Grind 
				IF <SkaterId> : SkateInAble right 
					rgba_right = <rgba_land> 
				ELSE 
					rgba_right = <rgba_bail> 
				ENDIF 
				IF <SkaterId> : SkateInAble left 
					rgba_left = <rgba_land> 
				ELSE 
					rgba_left = <rgba_bail> 
				ENDIF 
			CASE Lip 
				rgba_right = <rgba_land> 
				rgba_left = <rgba_bail> 
			DEFAULT 
				IF <SkaterId> : Skitching 
					rgba_right = <rgba_land> 
					rgba_left = <rgba_land> 
				ELSE 
					rgba_right = [ 0 128 128 128 ] 
					rgba_left = [ 0 128 128 128 ] 
				ENDIF 
		ENDSWITCH 
		IF ( ( ( THUGPRO_GlobalThemeInfo ) . BALANCE_INDICATOR_A_SPRITE ) = circle ) 
			rgba_right = ( ( THUGPRO_GlobalThemeInfo ) . HIGHLIGHTED_TEXT_COLOR ) 
			rgba_left = ( ( THUGPRO_GlobalThemeInfo ) . HIGHLIGHTED_TEXT_COLOR ) 
			<scaled_value> = ( <value> * 0.50000000000 ) 
			IF ScreenElementExists id = balance_indicator_left 
				SetScreenElementProps { 
					id = balance_indicator_left 
					pos = ( ( indicator_props_classic_left ) . pos ) 
					just = ( ( indicator_props_classic_left ) . just ) 
				} 
				IF NOT ( ( <value> ) = 0.00000000000 ) 
					DoScreenElementMorph id = balance_indicator_left alpha = 1 
				ELSE 
					DoScreenElementMorph id = balance_indicator_left alpha = 0 
				ENDIF 
				DoScreenElementMorph id = balance_indicator_left scale = ( 0.50000000000 + ( -1 * <scaled_value> ) ) 
				DoScreenElementMorph id = balance_indicator_left rgba = <rgba_left> 
			ENDIF 
			IF ScreenElementExists id = balance_indicator_right 
				SetScreenElementProps { 
					id = balance_indicator_right 
					pos = ( ( indicator_props_classic_right ) . pos ) 
					just = ( ( indicator_props_classic_right ) . just ) 
				} 
				IF NOT ( ( <value> ) = 0.00000000000 ) 
					DoScreenElementMorph id = balance_indicator_right alpha = 1 
				ELSE 
					DoScreenElementMorph id = balance_indicator_right alpha = 0 
				ENDIF 
				DoScreenElementMorph id = balance_indicator_right scale = ( 0.50000000000 + <scaled_value> ) 
				DoScreenElementMorph id = balance_indicator_right rgba = <rgba_right> 
			ENDIF 
		ELSE 
			IF ScreenElementExists id = balance_indicator_left 
				SetScreenElementProps { 
					id = balance_indicator_left 
					pos = ( ( indicator_props_modern_left ) . pos ) 
					just = ( ( indicator_props_modern_left ) . just ) 
				} 
				DoScreenElementMorph id = balance_indicator_left alpha = ( -1 * <value> ) 
				DoScreenElementMorph id = balance_indicator_left rgba = <rgba_left> 
			ENDIF 
			IF ScreenElementExists id = balance_indicator_right 
				SetScreenElementProps { 
					id = balance_indicator_right 
					pos = ( ( indicator_props_modern_right ) . pos ) 
					just = ( ( indicator_props_modern_right ) . just ) 
				} 
				DoScreenElementMorph id = balance_indicator_right alpha = <value> 
				DoScreenElementMorph id = balance_indicator_right rgba = <rgba_right> 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT hide_run_timer 
	IF ObjectExists id = <id> 
		SetScreenElementProps id = <id> tags = { tag_turned_on = 0 } 
		RunScriptOnScreenElement id = <id> do_hide_run_timer params = { id = <id> } 
	ENDIF 
ENDSCRIPT

SCRIPT pause_run_timer 
	RunScriptOnScreenElement id = the_run_timer do_hide_run_timer params = { id = the_run_timer } 
	IF ScreenElementExists id = ( the_run_timer + 1 ) 
		RunScriptOnScreenElement id = ( the_run_timer + 1 ) do_hide_run_timer params = { id = ( the_run_timer + 1 ) } 
	ENDIF 
ENDSCRIPT

SCRIPT do_hide_run_timer 
	DoScreenElementMorph id = <id> alpha = 0 
ENDSCRIPT

SCRIPT show_run_timer 
	GetScreenElementPosition id = <id> 
	SetScreenElementProps id = <id> tags = { tag_turned_on = 1 } 
	RunScriptOnScreenElement id = <id> do_show_run_timer params = { id = <id> } 
	DoScreenElementMorph id = { <id> child = 1 } alpha = 0 
	DoScreenElementMorph id = { <id> child = 2 } alpha = 0 
	DoScreenElementMorph id = { <id> child = 3 } alpha = 0 
	DoScreenElementMorph id = { <id> child = 4 } alpha = 0 
	DoScreenElementMorph id = { <id> child = 5 } alpha = 0 
	DoScreenElementMorph id = { <id> child = 6 } alpha = 0 
	DoScreenElementMorph id = { <id> child = 7 } alpha = 0 
	DoScreenElementMorph id = { <id> child = 8 } alpha = 0 
	IF ( <rot_angle> > 320 ) 
		DoScreenElementMorph id = { <id> child = 1 } alpha = 1 
	ENDIF 
	IF ( <rot_angle> > 280 ) 
		DoScreenElementMorph id = { <id> child = 2 } alpha = 1 
	ENDIF 
	IF ( <rot_angle> > 240 ) 
		DoScreenElementMorph id = { <id> child = 3 } alpha = 1 
	ENDIF 
	IF ( <rot_angle> > 200 ) 
		DoScreenElementMorph id = { <id> child = 4 } alpha = 1 
	ENDIF 
	IF ( <rot_angle> > 160 ) 
		DoScreenElementMorph id = { <id> child = 5 } alpha = 1 
	ENDIF 
	IF ( <rot_angle> > 120 ) 
		DoScreenElementMorph id = { <id> child = 6 } alpha = 1 
	ENDIF 
	IF ( <rot_angle> > 80 ) 
		DoScreenElementMorph id = { <id> child = 7 } alpha = 1 
	ENDIF 
	IF ( <rot_angle> > 40 ) 
		DoScreenElementMorph id = { <id> child = 8 } alpha = 1 
	ENDIF 
ENDSCRIPT

SCRIPT soft_hide_run_timer 
	SetScreenElementProps id = <id> tags = { tag_turned_on = 0 } 
	RunScriptOnScreenElement id = <id> do_soft_hide_run_timer params = { id = <id> } 
ENDSCRIPT

SCRIPT do_soft_hide_run_timer 
	DoScreenElementMorph id = <id> alpha = 0 time = 0.30000001192 
ENDSCRIPT

SCRIPT unpause_run_timer 
	RunScriptOnScreenElement id = the_run_timer do_show_run_timer params = { id = the_run_timer } 
ENDSCRIPT

SCRIPT do_show_run_timer 
	GetTags 
	IF IntegerEquals a = <tag_turned_on> b = 1 
		DoScreenElementMorph id = <id> alpha = 1 
	ENDIF 
ENDSCRIPT

SCRIPT hide_run_timer_piece 
	IF ( 320 > <rot_angle> ) 
		DoScreenElementMorph id = { <id> child = 1 } alpha = 0 
	ENDIF 
	IF ( 280 > <rot_angle> ) 
		DoScreenElementMorph id = { <id> child = 2 } alpha = 0 
	ENDIF 
	IF ( 240 > <rot_angle> ) 
		DoScreenElementMorph id = { <id> child = 3 } alpha = 0 
	ENDIF 
	IF ( 200 > <rot_angle> ) 
		DoScreenElementMorph id = { <id> child = 4 } alpha = 0 
	ENDIF 
	IF ( 160 > <rot_angle> ) 
		DoScreenElementMorph id = { <id> child = 5 } alpha = 0 
	ENDIF 
	IF ( 120 > <rot_angle> ) 
		DoScreenElementMorph id = { <id> child = 6 } alpha = 0 
	ENDIF 
	IF ( 80 > <rot_angle> ) 
		DoScreenElementMorph id = { <id> child = 7 } alpha = 0 
	ENDIF 
	IF ( 40 > <rot_angle> ) 
		DoScreenElementMorph id = { <id> child = 8 } alpha = 0 
	ENDIF 
ENDSCRIPT

SCRIPT blink_run_timer 
	BEGIN 
		DoScreenElementMorph id = <id> alpha = 0.30000001192 time = 0.05000000075 
		wait 5 gameframes 
		DoScreenElementMorph id = <id> alpha = 1 time = 0.05000000075 
		wait 5 gameframes 
	REPEAT 
ENDSCRIPT

SCRIPT update_goal_points_display 
	IF NOT GameModeEquals is_career 
		RETURN 
	ENDIF 
	pos = PAIR(0.00000000000, 80.00000000000) 
	GoalManager_GetActiveRewardPoints 
	IF GotParam create 
		IF ScreenElementExists id = goal_points_display 
			RETURN 
		ENDIF 
		SetScreenElementLock id = root_window off 
		CreateScreenElement { 
			type = ContainerElement 
			parent = root_window 
			id = goal_points_display 
			pos = <pos> 
		} 
		CreateScreenElement { 
			type = spriteelement 
			parent = goal_points_display 
			local_id = bar 
			texture = roundbar_middle 
			pos = PAIR(0.00000000000, -1.00000000000) 
			just = [ left center ] 
			scale = PAIR(5.50000000000, 0.60000002384) 
			rgba = [ 0 0 0 110 ] 
			z_priority = 1 
		} 
		CreateScreenElement { 
			type = spriteelement 
			parent = goal_points_display 
			local_id = edge 
			texture = roundbar_tip_right 
			pos = PAIR(170.00000000000, -1.00000000000) 
			just = [ left center ] 
			scale = 0.60000002384 
			rgba = [ 0 0 0 110 ] 
			z_priority = 1 
		} 
		CreateScreenElement { 
			type = textelement 
			parent = goal_points_display 
			local_id = points 
			text = " " 
			font = small 
			pos = PAIR(185.00000000000, 0.00000000000) 
			just = [ right center ] 
			scale = PAIR(0.80000001192, 0.85000002384) 
			rgba = [ 128 128 128 128 ] 
			z_priority = 2 
		} 
		need_text = 1 
	ENDIF 
	IF GotParam kill 
		DestroyScreenElement id = goal_points_display 
	ENDIF 
	IF NOT ScreenElementExists id = goal_points_display 
		RETURN 
	ENDIF 
	IF GotParam show 
		DoScreenElementMorph id = goal_points_display alpha = 1 time = 0 
	ENDIF 
	IF GotParam hide 
		DoScreenElementMorph id = goal_points_display alpha = 0 time = 0 
	ENDIF 
	IF GotParam need_text 
		FormatText TextName = points "%a / %b GOAL PTS." a = <active_points> b = <total_points> 
		SetScreenElementProps id = { goal_points_display child = points } text = <points> 
	ENDIF 
	IF GotParam refresh 
		IF goal_points_display : GetSingleTag animating_off 
			RETURN 
		ENDIF 
		spawnscript update_goal_points_display_slide_wait params = <...> 
	ENDIF 
ENDSCRIPT

SCRIPT update_goal_points_display_slide_wait 
	goal_points_display : SetTags animating_off 
	DoScreenElementMorph id = goal_points_display pos = ( <pos> + PAIR(-300.00000000000, 0.00000000000) ) time = 0.20000000298 
	wait 0.30000001192 seconds 
	update_goal_points_display need_text 
	goal_points_display : RemoveTags tags = [ animating_off ] 
	IF ( <total_points> > 0 ) 
		DoScreenElementMorph id = goal_points_display pos = <pos> time = 0.20000000298 
	ENDIF 
ENDSCRIPT


