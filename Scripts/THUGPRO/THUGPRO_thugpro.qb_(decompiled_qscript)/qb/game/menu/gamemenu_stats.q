
helper_text_change_elements = [ 
	{ text = "\\b6/\\b5 = Change" } 
	{ text = "\\bn/\\bm = Done" } 
] 
helper_text_select_elements = [ 
	{ text = "\\b7/\\b4/\\b6/\\b5 = Select" } 
	{ text = "\\bn = Back" } 
	{ text = "\\bm = Change" } 
] 
helper_text_select_elements_no_change = [ 
	{ text = "\\b7/\\b4/\\b6/\\b5 = Select" } 
	{ text = "\\bn = Back" } 
] 
helper_text_classic_elements = [ 
	{ text = "\\b7/\\b4 = Select" } 
	{ text = "\\b6/\\b5 = Change" } 
	{ text = "\\bn = Back" } 
] 
SCRIPT create_thugpro_style_test_menu_stats 
	IF GotParam edit 
		<menu_title> = "EDIT STATS" 
		<menu_anchor_alias> = current_menu_anchor 
		<menu_alias> = current_menu 
		<menu_parent> = root_window 
		<show_gradient> = show_gradient 
		<show_description_panel> = show_description_panel 
		<helper_text> = helper_text_classic_elements 
	ELSE 
		<no_cleanup> = no_cleanup 
		<no_focus> = no_focus 
		<menu_title> = "" 
		<menu_anchor_alias> = stats_block_menu_anchor 
		<menu_alias> = stats_block_menu 
		<menu_parent> = select_skater_anchor 
		<show_gradient> = show_gradient 
	ENDIF 
	thugpro_menu_create { 
		menu_name = style_test_stats 
		menu_title = <menu_title> 
		menu_style = MENU_STYLE_RIGHT_SKATER_SELECT 
		menu_parent = <menu_parent> 
		menu_anchor_alias = <menu_anchor_alias> 
		menu_alias = <menu_alias> 
		pad_back_script = <callback_script> 
		helper_text = <helper_text> 
		<show_description_panel> 
		<show_gradient> 
		boxed 
		<no_cleanup> 
		<no_menu_title> 
	} 
	GetCurrentSkaterProfileIndex 
	GetArraySize stat_names 
	<index> = 0 
	BEGIN 
		GetStatValue ( stat_names [ <index> ] . name ) 
		IF ( <stat_value> > 10 ) 
			<stat_value> = 10 
			SetClassicStat ( stat_names [ <index> ] . name ) <stat_value> 
			SetSkaterProfileProperty player = <currentSkaterProfileIndex> ( stat_names [ <index> ] . name ) <stat_value> 
		ENDIF 
		make_thugpro_menu_stats_item { 
			parent_id = <menu_alias> 
			name = ( stat_names [ <index> ] . name ) 
			text = ( stat_names [ <index> ] . string ) 
			description_text = ( stat_names [ <index> ] . description ) 
		} 
		<index> = ( <index> + 1 ) 
	REPEAT <array_size> 
	thugpro_menu_finalize { 
		parent = <menu_alias> 
		<...> 
	} 
ENDSCRIPT

SCRIPT make_thugpro_menu_stats_item { 
		parent_id = current_menu 
	} 
	<option_arrows_callback> = thugpro_menu_stats_value_update 
	<option_arrows_callback_params> = { name = <name> } 
	<option_arrows> = option_arrows 
	make_thugpro_menu_item <...> 
	IF NOT GotParam menu_item_id 
		printf "ERROR: no <menu_item_id> returned???" 
		RETURN 
	ENDIF 
	IF GameModeEquals is_classic 
		texture = logo_13 
		scale = 0.21999999881 
	ELSE 
		texture = logo_25 
		scale = 0.21999999881 
	ENDIF 
	<pos> = PAIR(170.00000000000, 0.00000000000) 
	<shadow_pos> = ( <pos> + PAIR(1.00000000000, 1.00000000000) ) 
	<index> = 0 
	BEGIN 
		FormatText ChecksumName = local_id "star_%i" i = <index> 
		FormatText ChecksumName = shadow_id "star_shadow_%i" i = <index> 
		CreateScreenElement { 
			type = SpriteElement 
			parent = <menu_item_id> 
			texture = <texture> 
			scale = <scale> 
			rgba = stats_menu_star_lowlight 
			pos = <pos> 
			just = [ center center ] 
			local_id = <local_id> 
			z_priority = 1006 
		} 
		GetScreenElementDims id = <id> 
		CreateScreenElement { 
			type = SpriteElement 
			parent = <menu_item_id> 
			texture = <texture> 
			scale = <scale> 
			rgba = [ 10 10 10 90 ] 
			pos = <shadow_pos> 
			just = [ center center ] 
			local_id = <shadow_id> 
			z_priority = 1005 
		} 
		<pos> = ( <pos> + ( PAIR(1.00000000000, 0.00000000000) * <width> ) ) 
		<shadow_pos> = ( <shadow_pos> + ( PAIR(1.00000000000, 0.00000000000) * <width> ) ) 
		<index> = ( <index> + 1 ) 
	REPEAT 10 
	thugpro_menu_stats_item_update { 
		name = <name> 
		pro_name = <pro_name> 
		id = <menu_item_id> 
	} 
ENDSCRIPT

SCRIPT thugpro_menu_stats_item_update 
	IF ScreenElementExists id = sub_menu 
		sub_menu : GetSingleTag skater_name 
		GetStatValue <name> skater = <skater_name> 
	ELSE 
		IF GotParam pro_name 
			GetStatValue <name> skater = <pro_name> 
		ELSE 
			GetStatValue <name> 
		ENDIF 
	ENDIF 
	IF ( <stat_value> > 10 ) 
		<stat_value> = 10 
	ENDIF 
	<count> = <stat_value> 
	<index> = 0 
	BEGIN 
		FormatText ChecksumName = local_id "star_%i" i = <index> 
		<alpha> = 1 
		IF ( <index> < <count> ) 
			<color> = ( ( THUGPRO_GlobalThemeInfo ) . HIGHLIGHTED_TEXT_COLOR ) 
			IF NOT ( <index> < <stat_value> ) 
				<alpha> = 0.30000001192 
			ENDIF 
		ELSE 
			<color> = [ 10 , 10 , 10 , 128 ] 
		ENDIF 
		SetScreenElementProps { 
			id = { <id> child = <local_id> } 
			rgba = <color> 
		} 
		DoScreenElementMorph id = { <id> child = <local_id> } alpha = <alpha> 
		<index> = ( <index> + 1 ) 
	REPEAT 10 
ENDSCRIPT

SCRIPT thugpro_menu_stats_value_update 
	GetTags 
	GetStatValue <name> 
	IF GotParam right 
		IF ( <stat_value> < 10 ) 
			PlaySound menu03 vol = 40 
			stat_menu_change_stat name = <name> value = ( <stat_value> + 1 ) 
		ELSE 
			PlaySound menu06a vol = 30 
		ENDIF 
	ELSE 
		value = <stat_value> 
		IF ( <value> > 0 ) 
			PlaySound menu03 vol = 40 
			stat_menu_change_stat name = points_available value = ( <stat_value> + 1 ) 
			stat_menu_change_stat name = <name> value = ( <value> -1 ) 
		ELSE 
			PlaySound menu06a vol = 30 
		ENDIF 
	ENDIF 
	thugpro_menu_stats_item_update { 
		name = <name> 
		id = <id> 
	} 
ENDSCRIPT

SCRIPT stat_menu_change_stat 
	GetCurrentSkaterProfileIndex 
	SetSkaterProfileProperty player = <currentSkaterProfileIndex> <name> <value> 
ENDSCRIPT

SCRIPT stats_menu_get_skater_name_and_family 
	GetCurrentSkaterProfileIndex 
	GetSkaterProfileInfo player = <currentSkaterProfileIndex> 
	RETURN { skater_name = <name> skater_family = <skater_family> } 
ENDSCRIPT


