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

SCRIPT create_panel_stuff 
	IF InSplitScreenGame 
		ScriptGetScreenMode 
		SWITCH <screen_mode> 
			CASE horse1 
			CASE horse2 
			CASE split_vertical 
			CASE one_camera 
				timer_pos = PAIR(285.00000000000, 20.00000000000) 
				timer_scale = 1.00000000000 
				IF GameModeEquals is_horse 
					trick_text_dims = PAIR(575.00000000000, 70.00000000000) 
					trick_text_pos = PAIR(287.00000000000, 2.00000000000) 
					player1_panel_dims = PAIR(640.00000000000, 448.00000000000) 
					player1_panel_pos = PAIR(0.00000000000, 0.00000000000) 
					player2_panel_dims = PAIR(640.00000000000, 448.00000000000) 
					player2_panel_pos = PAIR(0.00000000000, 0.00000000000) 
				ELSE 
					trick_text_dims = PAIR(240.00000000000, 70.00000000000) 
					trick_text_pos = PAIR(120.00000000000, 2.00000000000) 
					player1_panel_dims = PAIR(320.00000000000, 448.00000000000) 
					player1_panel_pos = PAIR(0.00000000000, 0.00000000000) 
					player2_panel_dims = PAIR(320.00000000000, 448.00000000000) 
					player2_panel_pos = PAIR(333.00000000000, 0.00000000000) 
				ENDIF 
				CreateScreenElement { 
					id = player1_panel_container 
					type = ContainerElement 
					parent = root_window 
					scale = 1.00000000000 
					dims = PAIR(320.00000000000, 448.00000000000) 
					pos = PAIR(0.00000000000, 0.00000000000) 
					just = [ top left ] 
				} 
				CreateScreenElement { 
					id = player2_panel_container 
					type = ContainerElement 
					parent = root_window 
					scale = 1.00000000000 
					dims = <player2_panel_dims> 
					pos = <player2_panel_pos> 
					just = [ top left ] 
				} 
			CASE split_horizontal 
				trick_text_dims = PAIR(575.00000000000, 30.00000000000) 
				trick_text_pos = PAIR(287.00000000000, 2.00000000000) 
				timer_pos = PAIR(300.00000000000, 20.00000000000) 
				timer_scale = 1.00000000000 
				CreateScreenElement { 
					id = player1_panel_container 
					type = ContainerElement 
					parent = root_window 
					scale = 1.00000000000 
					dims = <player1_panel_dims> 
					pos = <player1_panel_pos> 
					just = [ top left ] 
				} 
				CreateScreenElement { 
					id = player2_panel_container 
					type = ContainerElement 
					parent = root_window 
					scale = 1.00000000000 
					dims = PAIR(640.00000000000, 224.00000000000) 
					pos = PAIR(0.00000000000, 224.00000000000) 
					just = [ top left ] 
				} 
		ENDSWITCH 
	ELSE 
		trick_text_dims = PAIR(575.00000000000, 70.00000000000) 
		trick_text_pos = PAIR(287.00000000000, 2.00000000000) 
		timer_pos = PAIR(300.00000000000, 20.00000000000) 
		timer_scale = 1.00000000000 
		CreateScreenElement { 
			id = player1_panel_container 
			type = ContainerElement 
			parent = root_window 
			scale = 1.00000000000 
			dims = PAIR(640.00000000000, 448.00000000000) 
			pos = PAIR(0.00000000000, 0.00000000000) 
			just = [ top left ] 
		} 
	ENDIF 
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
	CreateScreenElement { 
		id = the_time 
		type = textelement 
		parent = root_window 
		font = newtimerfont 
		text = "" 
		scale = <timer_scale> 
		pos = <timer_pos> 
		just = [ center top ] 
		rgba = [ 128 128 128 68 ] 
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
		id = the_score 
		type = textelement 
		parent = player1_panel_container 
		font = testtitle 
		text = "0" 
		scale = ( 1.00000000000 ) 
		pos = PAIR(136.00000000000, 15.00000000000) 
		just = [ left top ] 
		rgba = [ 105 105 105 128 ] 
	} 
	Theme_GetHUDColor return_value = score_color 
	Theme_GetHUDSpecialColor return_value = special_color 
	CreateScreenElement { 
		id = the_score_sprite 
		type = spriteelement 
		parent = the_score 
		texture = score_small 
		scale = PAIR(1.20000004768, 0.85000002384) 
		pos = PAIR(-17.00000000000, 23.00000000000) 
		rgba = <score_color> 
	} 
	CreateScreenElement { 
		id = the_special_bar_special 
		type = spriteelement 
		parent = the_score_sprite 
		texture = special 
		scale = PAIR(1.73000001907, 0.87000000477) 
		pos = PAIR(10.00000000000, 34.00000000000) 
		just = [ left top ] 
		rgba = <special_color> 
		z_priority = 5000 
	} 
	CreateScreenElement { 
		id = the_special_bar_sprite 
		type = spriteelement 
		parent = the_score_sprite 
		texture = specialbar 
		scale = PAIR(1.00000000000, 1.10000002384) 
		pos = PAIR(9.00000000000, 36.00000000000) 
		just = [ left top ] 
		rgba = [ 128 128 128 100 ] 
	} 
	CreateScreenElement { 
		id = the_boardstance_sprite 
		type = spriteelement 
		parent = the_score_sprite 
		texture = nollie_icon 
		scale = PAIR(0.75000000000, 1.29999995232) 
		just = [ left top ] 
		pos = PAIR(123.00000000000, 45.00000000000) 
		rot_angle = 90 
		rgba = [ 128 128 128 128 ] 
	} 
	FormatText ChecksumName = sponsor_texture "%i_sponsor" i = ( THEME_COLOR_PREFIXES [ current_theme_prefix ] ) 
	CreateScreenElement { 
		id = generic_sponsor_logo 
		type = spriteelement 
		parent = the_score_sprite 
		texture = <sponsor_texture> 
		scale = PAIR(1.00000000000, 1.00000000000) 
		just = [ left top ] 
		pos = PAIR(-28.00000000000, 8.00000000000) 
		rgba = [ 128 128 128 128 ] 
		z_priority = 0 
	} 
	CreateScreenElement { 
		id = trick_text_container 
		type = ContainerElement 
		parent = player1_panel_container 
		scale = 1.00000000000 
		dims = <trick_text_dims> 
		just = [ center center ] 
		alpha = 0.00000000000 
	} 
	CreateScreenElement { 
		id = the_trick_text 
		type = TextBlockElement 
		parent = trick_text_container 
		scale = 1.00000000000 
		pos = { PAIR(0.50000000000, 0.00000000000) proportional } 
		dims = <trick_text_dims> 
		just = [ center top ] 
		internal_just = [ center top ] 
		font = newtrickfont 
		text = " " 
		internal_scale = 0.69999998808 
		alpha = 1.00000000000 
		tags = { tag_state = inactive } 
		shadow 
		shadow_offs = PAIR(1.00000000000, 1.00000000000) 
		shadow_rgba = [ 30 30 30 75 ] 
		z_priority = 0 
	} 
	CreateScreenElement { 
		id = the_score_pot_text 
		type = textelement 
		parent = trick_text_container 
		scale = ( 1.00000000000 ) 
		pos = { PAIR(0.50000000000, 0.00000000000) proportional } 
		just = [ center bottom ] 
		font = testtitle 
		text = " " 
		alpha = 1.00000000000 
		z_priority = 0 
	} 
	reset_trick_text_appearance the_score_pot_text_id = the_score_pot_text the_trick_text_id = the_trick_text trick_text_container_id = trick_text_container 
	CreateScreenElement { 
		id = the_balance_meter 
		type = spriteelement 
		parent = player1_panel_container 
		texture = balancemeter 
		scale = 1.00000000000 
		just = [ center center ] 
		rgba = [ 128 128 128 0 ] 
		tags = { tag_turned_on = 0 tag_mode = balance } 
	} 
	CreateScreenElement { 
		type = spriteelement 
		parent = the_balance_meter 
		texture = balancearrow_glow 
		scale = 1.20000004768 
		pos = PAIR(0.00000000000, 0.00000000000) 
		just = [ center center ] 
		rgba = [ 128 128 128 0 ] 
		z_priority = 3 
	} 
	IF InSplitScreenGame 
		ScriptGetScreenMode 
		ScriptGetScreenMode 
		SWITCH <screen_mode> 
			CASE split_vertical 
				CreateScreenElement { 
					id = the_run_timer 
					type = spriteelement 
					parent = player1_panel_container 
					texture = watch 
					scale = 1.00000000000 
					just = [ center center ] 
					pos = PAIR(240.00000000000, 240.00000000000) 
					alpha = 0 
					rgba = [ 128 128 128 90 ] 
					tags = { tag_turned_on = 0 tag_mode = balance } 
				} 
			CASE split_horizontal 
				CreateScreenElement { 
					id = the_run_timer 
					type = spriteelement 
					parent = player1_panel_container 
					texture = watch 
					scale = 1.00000000000 
					just = [ center center ] 
					pos = PAIR(500.00000000000, 120.00000000000) 
					alpha = 0 
					rgba = [ 128 128 128 90 ] 
					tags = { tag_turned_on = 0 tag_mode = balance } 
				} 
			DEFAULT 
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
		ENDSWITCH 
	ELSE 
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
	ENDIF 
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
	IF InSplitScreenGame 
		CreateScreenElement { 
			id = ( the_score + 1 ) 
			type = textelement 
			parent = player2_panel_container 
			font = testtitle 
			text = "0" 
			scale = ( 1.00000000000 ) 
			pos = PAIR(136.00000000000, 15.00000000000) 
			just = [ left top ] 
			rgba = [ 105 105 105 128 ] 
		} 
		Theme_GetHUDColor return_value = score_color 
		Theme_GetHUDSpecialColor return_value = special_color 
		CreateScreenElement { 
			id = ( the_score_sprite + 1 ) 
			type = spriteelement 
			parent = ( the_score + 1 ) 
			texture = score_small 
			scale = PAIR(1.20000004768, 0.85000002384) 
			pos = PAIR(-17.00000000000, 23.00000000000) 
			rgba = <score_color> 
		} 
		CreateScreenElement { 
			id = ( the_special_bar_special + 1 ) 
			type = spriteelement 
			parent = ( the_score_sprite + 1 ) 
			texture = special 
			scale = PAIR(1.73000001907, 0.87000000477) 
			pos = PAIR(10.00000000000, 34.00000000000) 
			just = [ left top ] 
			rgba = <special_color> 
			z_priority = 5000 
		} 
		CreateScreenElement { 
			id = ( the_special_bar_sprite + 1 ) 
			type = spriteelement 
			parent = ( the_score_sprite + 1 ) 
			texture = specialbar 
			scale = PAIR(1.00000000000, 1.20000004768) 
			pos = PAIR(9.00000000000, 35.00000000000) 
			just = [ left top ] 
			rgba = [ 128 128 128 100 ] 
		} 
		CreateScreenElement { 
			id = ( the_boardstance_sprite + 1 ) 
			type = spriteelement 
			parent = ( the_score_sprite + 1 ) 
			texture = nollie_icon 
			scale = PAIR(0.75000000000, 1.29999995232) 
			just = [ left top ] 
			pos = PAIR(123.00000000000, 45.00000000000) 
			rot_angle = 90 
			rgba = [ 128 128 128 78 ] 
		} 
		CreateScreenElement { 
			id = ( generic_sponsor_logo + 1 ) 
			type = spriteelement 
			parent = ( the_score_sprite + 1 ) 
			texture = <sponsor_texture> 
			scale = 1 
			just = [ left top ] 
			pos = PAIR(-28.00000000000, 8.00000000000) 
			rgba = [ 128 128 128 108 ] 
			z_priority = 3 
		} 
		CreateScreenElement { 
			id = ( trick_text_container + 1 ) 
			type = ContainerElement 
			parent = player2_panel_container 
			scale = 1.00000000000 
			dims = <trick_text_dims> 
			just = [ center center ] 
			alpha = 0.00000000000 
		} 
		CreateScreenElement { 
			id = ( the_trick_text + 1 ) 
			type = TextBlockElement 
			parent = ( trick_text_container + 1 ) 
			scale = 1.00000000000 
			pos = { PAIR(0.50000000000, 0.00000000000) proportional } 
			dims = <trick_text_dims> 
			just = [ center top ] 
			internal_just = [ center top ] 
			font = newtrickfont 
			text = " " 
			internal_scale = 0.69999998808 
			alpha = 1.00000000000 
			tags = { tag_state = inactive } 
			shadow 
			shadow_offs = PAIR(1.00000000000, 1.00000000000) 
			shadow_rgba = [ 30 30 30 75 ] 
			z_priority = 0 
		} 
		CreateScreenElement { 
			id = ( the_score_pot_text + 1 ) 
			type = textelement 
			parent = ( trick_text_container + 1 ) 
			scale = 1.00000000000 
			pos = <trick_text_pos> 
			just = [ center bottom ] 
			font = small 
			text = " " 
			alpha = 1.00000000000 
			z_priority = 0 
		} 
		reset_trick_text_appearance the_score_pot_text_id = ( the_score_pot_text + 1 ) the_trick_text_id = ( the_trick_text + 1 ) trick_text_container_id = ( trick_text_container + 1 ) 
		CreateScreenElement { 
			id = ( the_balance_meter + 1 ) 
			type = spriteelement 
			parent = player2_panel_container 
			texture = balancemeter 
			scale = 1.00000000000 
			just = [ center center ] 
			rgba = [ 128 128 128 0 ] 
			tags = { tag_turned_on = 0 tag_mode = balance } 
		} 
		CreateScreenElement { 
			type = spriteelement 
			parent = ( the_balance_meter + 1 ) 
			texture = balancearrow_glow 
			scale = 1.20000004768 
			pos = PAIR(0.00000000000, 0.00000000000) 
			just = [ center center ] 
			rgba = [ 128 128 128 0 ] 
		} 
		ScriptGetScreenMode 
		SWITCH <screen_mode> 
			CASE split_vertical 
				CreateScreenElement { 
					id = ( the_run_timer + 1 ) 
					type = spriteelement 
					parent = player2_panel_container 
					texture = watch 
					scale = 1.00000000000 
					just = [ center center ] 
					pos = PAIR(240.00000000000, 240.00000000000) 
					alpha = 0 
					rgba = [ 128 128 128 90 ] 
					tags = { tag_turned_on = 0 tag_mode = balance } 
				} 
			CASE split_horizontal 
				CreateScreenElement { 
					id = ( the_run_timer + 1 ) 
					type = spriteelement 
					parent = player2_panel_container 
					texture = watch 
					scale = 1.00000000000 
					just = [ center center ] 
					pos = PAIR(500.00000000000, 120.00000000000) 
					alpha = 0 
					rgba = [ 128 128 128 90 ] 
					tags = { tag_turned_on = 0 tag_mode = balance } 
				} 
			DEFAULT 
				CreateScreenElement { 
					id = ( the_run_timer + 1 ) 
					type = spriteelement 
					parent = player2_panel_container 
					texture = watch 
					scale = 1.00000000000 
					just = [ center center ] 
					pos = PAIR(400.00000000000, 240.00000000000) 
					alpha = 0 
					rgba = [ 128 128 128 90 ] 
					tags = { tag_turned_on = 0 tag_mode = balance } 
				} 
		ENDSWITCH 
		CreateScreenElement { 
			id = ( the_run_timer_hand + 1 ) 
			type = spriteelement 
			parent = ( the_run_timer + 1 ) 
			texture = hand 
			scale = 1.00000000000 
			pos = PAIR(24.00000000000, 24.00000000000) 
			just = [ center center ] 
			rgba = [ 128 128 128 128 ] 
			z_priority = 5 
		} 
		CreateScreenElement { 
			type = spriteelement 
			parent = ( the_run_timer + 1 ) 
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
			parent = ( the_run_timer + 1 ) 
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
			parent = ( the_run_timer + 1 ) 
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
			parent = ( the_run_timer + 1 ) 
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
			parent = ( the_run_timer + 1 ) 
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
			parent = ( the_run_timer + 1 ) 
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
			parent = ( the_run_timer + 1 ) 
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
			parent = ( the_run_timer + 1 ) 
			texture = time_8 
			scale = 1.00000000000 
			pos = <pos> 
			just = [ left top ] 
			rgba = [ 128 128 128 128 ] 
			z_priority = 3 
		} 
	ENDIF 
	IF GetGlobalFlag flag = NO_DISPLAY_HUD 
		GoalManager_HidePoints 
		GoalManager_HideGoalPoints 
	ELSE 
		update_goal_points_display create 
		update_pager_icon create 
	ENDIF 
	IF InNetGame 
		IF IsObserving 
			hide_panel_stuff 
		ENDIF 
		update_pager_icon create 
		create_score_menu 
	ENDIF 
ENDSCRIPT

newtrickfont_colors = [ 
	[ 0 128 230 60 ] 
	[ 200 90 11 60 ] 
	[ 0 128 0 60 ] 
	[ 128 0 0 60 ] 
	[ 88 105 112 128 ] 
] 
SCRIPT UpdateScorepot 
	IF GetGlobalFlag flag = NO_DISPLAY_BASESCORE 
		DoScreenElementMorph id = the_score_pot_text alpha = 0.00000000000 remember_alpha 
		IF InSplitScreenGame 
			IF ScreenElementExists id = ( the_score_pot_text + 1 ) 
				DoScreenElementMorph id = ( the_score_pot_text + 1 ) alpha = 0.00000000000 remember_alpha 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT UpdateTrickText 
	IF GetGlobalFlag flag = NO_DISPLAY_TRICKSTRING 
		DoScreenElementMorph id = the_trick_text alpha = 0.00000000000 remember_alpha 
		SetScreenElementProps id = the_trick_text override_encoded_rgba remember_override_rgba_state 
		IF InSplitScreenGame 
			IF ScreenElementExists id = ( the_trick_text + 1 ) 
				DoScreenElementMorph id = ( the_trick_text + 1 ) alpha = 0.00000000000 remember_alpha 
				SetScreenElementProps id = ( the_trick_text + 1 ) override_encoded_rgba remember_override_rgba_state 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT pause_trick_text 
	SetScreenElementProps id = the_trick_text hide 
	IF InSplitScreenGame 
		IF ScreenElementExists id = ( the_trick_text + 1 ) 
			SetScreenElementProps id = ( the_trick_text + 1 ) hide 
		ENDIF 
	ENDIF 
	SetScreenElementProps id = the_score_pot_text hide 
	IF InSplitScreenGame 
		IF ScreenElementExists id = ( the_score_pot_text + 1 ) 
			SetScreenElementProps id = ( the_score_pot_text + 1 ) hide 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT unpause_trick_text 
	IF NOT GetGlobalFlag flag = NO_DISPLAY_TRICKSTRING 
		SetScreenElementProps id = the_trick_text unhide 
		IF InSplitScreenGame 
			IF ScreenElementExists id = ( the_trick_text + 1 ) 
				SetScreenElementProps id = ( the_trick_text + 1 ) unhide 
			ENDIF 
		ENDIF 
	ENDIF 
	IF NOT GetGlobalFlag flag = NO_DISPLAY_BASESCORE 
		SetScreenElementProps id = the_score_pot_text unhide 
		IF InSplitScreenGame 
			IF ScreenElementExists id = ( the_score_pot_text + 1 ) 
				SetScreenElementProps id = ( the_score_pot_text + 1 ) unhide 
			ENDIF 
		ENDIF 
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

spazz_out_text = "\\c4FREAK OUT!\\c0" 
SCRIPT do_trick_text_pulse 
	reset_trick_text_appearance <...> 
	IF NOT GetGlobalFlag flag = NO_DISPLAY_TRICKSTRING 
		GetTextElementString id = <the_trick_text_id> 
		IF StringEquals a = <string> b = ( ( spazz_out_text ) + " " ) 
			do_trick_text_spazz <...> 
		ELSE 
			IF InSplitScreenGame 
				ScriptGetScreenMode 
				IF ( <screen_mode> = split_vertical ) 
					DoMorph scale = 1.00000000000 time = 0.20000000298 
					DoMorph scale = 0.60000002384 time = 0.30000001192 
					DoMorph scale = 0.94999998808 time = 0.40000000596 
				ELSE 
					DoMorph scale = 1.20000004768 time = 0.20000000298 
					DoMorph scale = 0.89999997616 time = 0.30000001192 
					DoMorph scale = 1.00000000000 time = 0.40000000596 
				ENDIF 
			ELSE 
				DoMorph scale = 1.20000004768 time = 0.20000000298 
				DoMorph scale = 0.89999997616 time = 0.30000001192 
				DoMorph scale = 1.00000000000 time = 0.40000000596 
			ENDIF 
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
		IF InSplitScreenGame 
			ScriptGetScreenMode 
			IF ( <screen_mode> = split_vertical ) 
				DoMorph scale = 0 time = 0 
				DoMorph scale = 1.79999995232 time = 0.20000000298 
				DoMorph scale = 0.50000000000 time = 0.07999999821 
				DoMorph scale = 1.00000000000 time = 0.05000000075 
				DoMorph scale = 0.80000001192 time = 0.03999999911 
				DoMorph scale = 1.00000000000 time = 0.03999999911 
			ELSE 
				DoMorph scale = 0 time = 0 
				DoMorph scale = 1.39999997616 time = 0.20000000298 
				DoMorph scale = 0.80000001192 time = 0.07999999821 
				DoMorph scale = 1.20000004768 time = 0.05000000075 
				DoMorph scale = 0.89999997616 time = 0.03999999911 
				DoMorph scale = 1.00000000000 time = 0.03999999911 
			ENDIF 
		ELSE 
			DoMorph scale = 0 time = 0 
			DoMorph scale = 1.39999997616 time = 0.20000000298 
			DoMorph scale = 0.80000001192 time = 0.07999999821 
			DoMorph scale = 1.20000004768 time = 0.05000000075 
			DoMorph scale = 0.89999997616 time = 0.03999999911 
			DoMorph scale = 1.00000000000 time = 0.03999999911 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT do_score_pot_text_landed 
	IF NOT GetGlobalFlag flag = NO_DISPLAY_BASESCORE 
		wait 1 gameframe 
		SetScreenElementProps id = <the_score_pot_text_id> rgba = [ 42 80 128 120 ] 
		SetScreenElementProps id = <the_score_pot_text_id> override_encoded_rgba 
		IF InSplitScreenGame 
			ScriptGetScreenMode 
			IF ( <screen_mode> = split_vertical ) 
				DoMorph scale = 0 time = 0 
				DoMorph scale = 1.29999995232 time = 0.20000000298 
				DoMorph scale = 0.50000000000 time = 0.07999999821 
				DoMorph scale = 1.00000000000 time = 0.05000000075 
				DoMorph scale = 0.80000001192 time = 0.03999999911 
				DoMorph scale = 1.20000004768 time = 0.03999999911 
			ELSE 
				DoMorph scale = 0 time = 0.05000000075 
				DoMorph scale = 1.79999995232 time = 0.11999999732 
				DoMorph scale = 0.80000001192 time = 0.10000000149 
				DoMorph scale = 1.50000000000 time = 0.07000000030 
				DoMorph scale = 0.89999997616 time = 0.07000000030 
				DoMorph scale = 1.29999995232 time = 0.05000000075 
				DoMorph scale = 1.00000000000 time = 0.05000000075 
				DoMorph scale = 1.25000000000 time = 0.03999999911 
				DoMorph scale = 1.10000002384 time = 0.02999999933 
				DoMorph scale = 1.20000004768 time = 0.01999999955 
			ENDIF 
		ELSE 
			DoMorph scale = 0 time = 0.05000000075 
			DoMorph scale = 1.79999995232 time = 0.11999999732 
			DoMorph scale = 0.80000001192 time = 0.10000000149 
			DoMorph scale = 1.50000000000 time = 0.07000000030 
			DoMorph scale = 0.89999997616 time = 0.07000000030 
			DoMorph scale = 1.29999995232 time = 0.05000000075 
			DoMorph scale = 1.00000000000 time = 0.05000000075 
			DoMorph scale = 1.25000000000 time = 0.03999999911 
			DoMorph scale = 1.10000002384 time = 0.02999999933 
			DoMorph scale = 1.20000004768 time = 0.01999999955 
		ENDIF 
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
	IF InSplitScreenGame 
		ScriptGetScreenMode 
		IF ( <screen_mode> = split_vertical ) 
			DoMorph alpha = 0 scale = 0 time = 0 
			DoMorph pos = { PAIR(0.00000000000, 25.00000000000) relative } scale = PAIR(0.40000000596, 0.69999998808) alpha = 1 time = 0.05000000075 
			DoMorph pos = { PAIR(0.00000000000, -25.00000000000) relative } scale = 0.40000000596 time = 0.10000000149 
			DoMorph pos = { PAIR(0.00000000000, 20.00000000000) relative } scale = 0.80000001192 time = 0.05999999866 
			DoMorph pos = { PAIR(0.00000000000, -20.00000000000) relative } scale = 0.60000002384 time = 0.05999999866 
			DoMorph pos = { PAIR(0.00000000000, 10.00000000000) relative } scale = 0.80000001192 time = 0.05000000075 
		ELSE 
			DoMorph alpha = 0 scale = 0 time = 0 
			DoMorph pos = { PAIR(0.00000000000, 25.00000000000) relative } scale = PAIR(0.69999998808, 1.79999995232) alpha = 1 time = 0.05000000075 
			DoMorph pos = { PAIR(0.00000000000, -25.00000000000) relative } scale = 0.89999997616 time = 0.10000000149 
			DoMorph pos = { PAIR(0.00000000000, 20.00000000000) relative } scale = 1.14999997616 time = 0.05999999866 
			DoMorph pos = { PAIR(0.00000000000, -20.00000000000) relative } scale = 1.12000000477 time = 0.05999999866 
			DoMorph pos = { PAIR(0.00000000000, 10.00000000000) relative } scale = 1.10000002384 time = 0.05000000075 
		ENDIF 
	ELSE 
		DoMorph alpha = 0 scale = 0 time = 0 
		DoMorph pos = { PAIR(0.00000000000, 25.00000000000) relative } scale = PAIR(0.69999998808, 1.79999995232) alpha = 1 time = 0.05000000075 
		DoMorph pos = { PAIR(0.00000000000, -25.00000000000) relative } scale = 0.89999997616 time = 0.10000000149 
		DoMorph pos = { PAIR(0.00000000000, 20.00000000000) relative } scale = 1.14999997616 time = 0.05999999866 
		DoMorph pos = { PAIR(0.00000000000, -20.00000000000) relative } scale = 1.12000000477 time = 0.05999999866 
		DoMorph pos = { PAIR(0.00000000000, 10.00000000000) relative } scale = 1.10000002384 time = 0.05000000075 
	ENDIF 
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
	DoMorph pos = { PAIR(0.00000000000, 0.00000000000) relative } time = 0.10000000149 scale = 1.89999997616 fast_in 
	DoMorph pos = { PAIR(0.00000000000, 0.00000000000) relative } time = 0.30000001192 scale = 3.00000000000 alpha = 0 fast_in 
	DoMorph pos = { PAIR(0.00000000000, 0.00000000000) relative } scale = 1.00000000000 alpha = 0 fast_in 
ENDSCRIPT

SCRIPT bail2 
	DoMorph pos = { PAIR(0.00000000000, -5.00000000000) relative } time = 0.40000000596 
	DoMorph pos = { PAIR(0.00000000000, 448.00000000000) relative } time = 0.69999998808 fast_in 
	DoMorph alpha = 0.00000000000 
	DoMorph pos = { PAIR(0.00000000000, -443.00000000000) relative } scale = 1.00000000000 alpha = 0 fast_in 
ENDSCRIPT

SCRIPT bail3 
	wait 0.10000000149 second 
	DoMorph pos = { PAIR(0.00000000000, -5.00000000000) relative } time = 0.20000000298 
	DoMorph pos = { PAIR(3.00000000000, 0.00000000000) relative } time = 0.05000000075 
	DoMorph pos = { PAIR(-3.00000000000, 0.00000000000) relative } time = 0.05000000075 
	DoMorph pos = { PAIR(4.00000000000, 0.00000000000) relative } time = 0.05000000075 
	DoMorph pos = { PAIR(-4.00000000000, 0.00000000000) relative } time = 0.05000000075 
	DoMorph pos = { PAIR(0.00000000000, 448.00000000000) relative } time = 0.50000000000 fast_in 
	DoMorph alpha = 0.00000000000 
	DoMorph pos = { PAIR(0.00000000000, -443.00000000000) relative } scale = 1.00000000000 alpha = 0 fast_in 
ENDSCRIPT

SCRIPT bail4 
	DoMorph pos = { PAIR(-15.00000000000, 0.00000000000) relative } time = 0.10000000149 
	DoMorph pos = { PAIR(0.00000000000, 4.00000000000) relative } time = 0.01999999955 
	DoMorph pos = { PAIR(0.00000000000, -4.00000000000) relative } time = 0.01999999955 
	DoMorph pos = { PAIR(0.00000000000, 2.00000000000) relative } time = 0.01999999955 
	DoMorph pos = { PAIR(0.00000000000, -2.00000000000) relative } time = 0.01999999955 
	DoMorph pos = { PAIR(150.00000000000, 0.00000000000) relative } time = 0.05999999866 alpha = 0.69999998808 
	DoMorph pos = { PAIR(200.00000000000, 0.00000000000) relative } scale = PAIR(2.00000000000, 0.10000000149) time = 0.05999999866 alpha = 0 fast_in 
	DoMorph pos = { PAIR(200.00000000000, 0.00000000000) relative } time = 0 
	DoMorph pos = { PAIR(-535.00000000000, 0.00000000000) relative } scale = 1.00000000000 alpha = 0 fast_in 
ENDSCRIPT

SCRIPT bail5 
	DoMorph pos = { PAIR(15.00000000000, 0.00000000000) relative } time = 0.10000000149 
	DoMorph pos = { PAIR(0.00000000000, 4.00000000000) relative } time = 0.01999999955 
	DoMorph pos = { PAIR(0.00000000000, -4.00000000000) relative } time = 0.01999999955 
	DoMorph pos = { PAIR(0.00000000000, 2.00000000000) relative } time = 0.01999999955 
	DoMorph pos = { PAIR(0.00000000000, -2.00000000000) relative } time = 0.01999999955 
	DoMorph pos = { PAIR(-150.00000000000, 0.00000000000) relative } time = 0.05999999866 alpha = 0.69999998808 
	DoMorph pos = { PAIR(-200.00000000000, 0.00000000000) relative } scale = PAIR(2.00000000000, 0.10000000149) time = 0.05999999866 alpha = 0 fast_in 
	DoMorph pos = { PAIR(-200.00000000000, 0.00000000000) relative } time = 0 
	DoMorph pos = { PAIR(535.00000000000, 0.00000000000) relative } scale = 1.00000000000 alpha = 0 fast_in 
ENDSCRIPT

SCRIPT bail6 
	DoMorph pos = { PAIR(0.00000000000, 0.00000000000) relative } time = 0.20000000298 scale = 1.29999995232 alpha = 0.60000002384 fast_in 
	wait 0.20000000298 second 
	DoMorph pos = { PAIR(0.00000000000, 0.00000000000) relative } time = 0.15000000596 scale = 0 alpha = 0 fast_in 
ENDSCRIPT

SCRIPT reset_just_trick_text_appearance 
	IF NOT GetGlobalFlag flag = NO_DISPLAY_TRICKSTRING 
		IF InSplitScreenGame 
			IF GameModeEquals is_horse 
				trick_text_pos = PAIR(320.00000000000, 410.00000000000) 
				text_scale = 1.00000000000 
			ELSE 
				ScriptGetScreenMode 
				SWITCH <screen_mode> 
					CASE split_vertical 
					CASE one_camera 
						trick_text_pos = PAIR(142.00000000000, 410.00000000000) 
						text_scale = 0.94999998808 
					CASE split_horizontal 
						trick_text_pos = PAIR(320.00000000000, 200.00000000000) 
						text_scale = 1.00000000000 
				ENDSWITCH 
			ENDIF 
			DoScreenElementMorph { 
				id = <trick_text_container_id> 
				alpha = 1.00000000000 
				pos = <trick_text_pos> 
				just = [ center top ] 
				scale = <text_scale> 
			} 
			DoScreenElementMorph { 
				id = <the_trick_text_id> 
				scale = <text_scale> 
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
		ENDIF 
	ELSE 
		IF InSplitScreenGame 
			IF GameModeEquals is_horse 
				trick_text_pos = PAIR(320.00000000000, 410.00000000000) 
				text_scale = 1.00000000000 
			ELSE 
				ScriptGetScreenMode 
				SWITCH <screen_mode> 
					CASE split_vertical 
					CASE one_camera 
						trick_text_pos = PAIR(142.00000000000, 410.00000000000) 
						text_scale = 0.94999998808 
					CASE split_horizontal 
						trick_text_pos = PAIR(320.00000000000, 200.00000000000) 
						text_scale = 1.00000000000 
				ENDSWITCH 
			ENDIF 
			DoScreenElementMorph { 
				id = <trick_text_container_id> 
				alpha = 1.00000000000 
				pos = <trick_text_pos> 
				just = [ center top ] 
				scale = <text_scale> 
			} 
		ELSE 
			DoScreenElementMorph { 
				id = <trick_text_container_id> 
				alpha = 1.00000000000 
				pos = PAIR(320.00000000000, 410.00000000000) 
				scale = 1.00000000000 
			} 
		ENDIF 
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
		SetScreenElementProps id = <the_score_pot_text_id> rgba = [ 127 102 0 85 ] 
		SetScreenElementProps id = <the_score_pot_text_id> dont_override_encoded_rgba 
		IF InSplitScreenGame 
			IF GameModeEquals is_horse 
				DoScreenElementMorph { 
					id = <the_score_pot_text_id> 
					scale = 1.00000000000 
					pos = PAIR(287.00000000000, 2.00000000000) 
					just = [ center bottom ] 
					alpha = 1.00000000000 
				} 
			ELSE 
				ScriptGetScreenMode 
				SWITCH <screen_mode> 
					CASE split_vertical 
					CASE one_camera 
						DoScreenElementMorph { 
							id = <the_score_pot_text_id> 
							scale = 1.00000000000 
							pos = PAIR(120.00000000000, 2.00000000000) 
							just = [ center bottom ] 
							alpha = 1.00000000000 
						} 
					CASE split_horizontal 
						DoScreenElementMorph { 
							id = <the_score_pot_text_id> 
							scale = 1.00000000000 
							pos = PAIR(287.00000000000, 2.00000000000) 
							just = [ center bottom ] 
							alpha = 1.00000000000 
						} 
				ENDSWITCH 
			ENDIF 
		ELSE 
			DoScreenElementMorph { 
				id = <the_score_pot_text_id> 
				scale = 1.00000000000 
				pos = PAIR(287.00000000000, 2.00000000000) 
				just = [ center bottom ] 
				alpha = 1.00000000000 
			} 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT HideClock 
	KillSpawnedScript name = clock_morph 
	DoScreenElementMorph { id = the_time alpha = 0 } 
ENDSCRIPT

SCRIPT ShowClock 
	DoScreenElementMorph { id = the_time alpha = 1 } 
ENDSCRIPT

SCRIPT hide_balance_meter 
	SetScreenElementProps id = <id> tags = { tag_turned_on = 0 } 
	RunScriptOnScreenElement id = <id> do_hide_balance_meter params = { id = <id> } 
ENDSCRIPT

SCRIPT pause_balance_meter 
	RunScriptOnScreenElement id = the_balance_meter do_hide_balance_meter params = { id = the_balance_meter } 
	IF InSplitScreenGame 
		RunScriptOnScreenElement id = ( the_balance_meter + 1 ) do_hide_balance_meter params = { id = ( the_balance_meter + 1 ) } 
	ENDIF 
ENDSCRIPT

SCRIPT do_hide_balance_meter 
	SetScreenElementProps id = <id> rgba = [ 128 128 128 0 ] 
	SetScreenElementProps id = { <id> child = 0 } rgba = [ 128 128 128 0 ] 
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
	IF InSplitScreenGame 
		RunScriptOnScreenElement id = ( the_balance_meter + 1 ) do_show_balance_meter params = { id = ( the_balance_meter + 1 ) } 
	ENDIF 
ENDSCRIPT

SCRIPT do_show_balance_meter 
	IF NOT GetGlobalFlag flag = NO_DISPLAY_BALANCE 
		IF NOT ( ( InNetGame ) & ( GetGlobalFlag flag = NO_G_DISPLAY_BALANCE ) ) 
			GetTags 
			Theme_GetBalanceMeterColor return_value = balance_meter_color 
			Theme_GetBalanceArrowColor return_value = balance_arrow_color 
			IF IntegerEquals a = <tag_turned_on> b = 1 
				SetScreenElementProps id = <id> rgba = <balance_meter_color> 
				SetScreenElementProps id = { <id> child = 0 } rgba = <balance_arrow_color> 
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
	IF InSplitScreenGame 
		RunScriptOnScreenElement id = ( the_run_timer + 1 ) do_show_run_timer params = { id = ( the_run_timer + 1 ) } 
	ENDIF 
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


