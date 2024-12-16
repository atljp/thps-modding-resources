
SCRIPT create_helper_text { 
		anchor_id = helper_text_anchor 
		parent = current_menu_anchor 
		helper_pos = PAIR(320.00000000000, 465.00000000000) 
		helper_scale = 1 
		bg_rgba = [ 0 0 0 128 ] 
		bg_scale = PAIR(210.00000000000, 12.00000000000) 
		rot_angle = 0 
		spacing_between = 2 
	} 
	IF ObjectExists id = <anchor_id> 
		DestroyScreenElement id = <anchor_id> 
	ENDIF 
	IF GotParam left 
		helper_pos = PAIR(320.00000000000, 1200.00000000000) 
		bg_scale = PAIR(400.00000000000, 200.00000000000) 
		rot_angle = -2 
	ENDIF 
	IF GotParam right 
		helper_pos = PAIR(320.00000000000, 1200.00000000000) 
		bg_scale = PAIR(400.00000000000, 200.00000000000) 
		rot_angle = 2 
	ENDIF 
	IF CustomParkMode editing 
		helper_pos = PAIR(320.00000000000, 464.00000000000) 
	ELSE 
		IF GotParam helper_pos 
			helper_pos = <helper_pos> 
		ELSE 
			helper_pos = PAIR(320.00000000000, 464.00000000000) 
		ENDIF 
	ENDIF 
	IF NOT GotParam helper_text_pos 
		helper_text_pos = <helper_pos> 
	ENDIF 
	CreateScreenElement { 
		type = ContainerElement 
		parent = <parent> 
		id = <anchor_id> 
		pos = PAIR(320.00000000000, 240.00000000000) 
		dims = PAIR(640.00000000000, 480.00000000000) 
		scale = <helper_scale> 
		z_priority = 2000 
	} 
	<secondline_index> = 2 
	IF NOT GotParam no_bar 
		CreateScreenElement { 
			type = SpriteElement 
			parent = <anchor_id> 
			texture = white 
			pos = <helper_pos> 
			just = [ center bottom ] 
			rgba = <bg_rgba> 
			alpha = 0.89999997616 
			scale = <bg_scale> 
		} 
		<secondline_index> = 3 
	ENDIF 
	CreateScreenElement { 
		type = HMenu 
		parent = <anchor_id> 
		local_id = line1 
		pos = ( <helper_text_pos> - PAIR(0.00000000000, 20.00000000000) ) 
		just = [ center bottom ] 
		internal_just = [ center center ] 
		padding_scale = 0.89999997616 
		scale = 0.60000002384 
		spacing_between = <spacing_between> 
	} 
	IF ( ( GotParam helper_text_elements_2 ) | ( GotParam helper_text_elements_2_pc ) | ( GotParam helper_text_elements_2_console ) ) 
		CreateScreenElement { 
			type = HMenu 
			parent = <anchor_id> 
			local_id = line2 
			pos = ( <helper_text_pos> - PAIR(0.00000000000, 5.00000000000) ) 
			just = [ center bottom ] 
			internal_just = [ center center ] 
			padding_scale = 0.89999997616 
			scale = 0.60000002384 
			spacing_between = <spacing_between> 
		} 
	ENDIF 
	<menu_id> = <id> 
	IF GotParam helper_text_elements 
		ForEachIn <helper_text_elements> do = helper_text_update_element params = { menu_id = { <anchor_id> child = line1 } } 
		IF GotParam helper_text_elements_2 
			ForEachIn <helper_text_elements_2> do = helper_text_update_element params = { menu_id = { <anchor_id> child = line2 } } 
		ENDIF 
	ELSE 
		SWITCH ( GLOBAL_CtrlLayout ) 
			CASE 0 
				IF GotParam helper_text_elements_PC 
					ForEachIn <helper_text_elements_PC> do = helper_text_update_element params = { menu_id = { <anchor_id> child = line1 } } 
				ENDIF 
				IF GotParam helper_text_elements_2_pc 
					ForEachIn <helper_text_elements_2_pc> do = helper_text_update_element params = { menu_id = { <anchor_id> child = line2 } } 
				ENDIF 
			CASE 1 
				IF GotParam helper_text_elements_Console 
					ForEachIn <helper_text_elements_Console> do = helper_text_update_element params = { menu_id = { <anchor_id> child = line1 } } 
				ENDIF 
				IF GotParam helper_text_elements_2_console 
					ForEachIn <helper_text_elements_2_console> do = helper_text_update_element params = { menu_id = { <anchor_id> child = line2 } } 
				ENDIF 
			CASE 2 
				IF GotParam helper_text_elements_Console 
					ForEachIn <helper_text_elements_Console> do = helper_text_update_element params = { menu_id = { <anchor_id> child = line1 } } 
				ENDIF 
				IF GotParam helper_text_elements_2_console 
					ForEachIn <helper_text_elements_2_console> do = helper_text_update_element params = { menu_id = { <anchor_id> child = line2 } } 
				ENDIF 
			DEFAULT 
				ForEachIn <helper_text_elements_PC> do = helper_text_update_element params = { menu_id = { <anchor_id> child = line1 } } 
		ENDSWITCH 
	ENDIF 
ENDSCRIPT

SCRIPT helper_text_update_element 
	IF GotParam enabled 
		IF ( ( <enabled> ) = 0 ) 
			RETURN 
		ENDIF 
	ENDIF 
	IF GotParam id 
		IF ObjectExists <id> 
			SetScreenElementProps { 
				id = <id> 
				text = <text> 
			} 
			RETURN 
		ENDIF 
	ENDIF 
	<pos> = PAIR(0.00000000000, 0.00000000000) 
	CreateScreenElement { 
		type = TextElement 
		parent = <menu_id> 
		id = <id> 
		font = dialog 
		text = <text> 
		rgba = [ 70 70 70 108 ] 
		scale = 0.75000000000 
		z_priority = 2100 
		pos = <pos> 
		not_focusable 
	} 
ENDSCRIPT

Desc_SS_PlayOnline = "Host or join a game online" 
Desc_SS_Freeskate = "Explore levels and start a high score session" 
Desc_SS_EditSkater = "Edit your skater" 
Desc_SS_ParkEditor = "Create your own skate park" 
Desc_SS_Options = "Change display, control, sound, and gameplay options" 
Desc_SS_Quit = "Quit the game" 
generic_helper_text_trick_list = { 
	helper_text_elements_PC = [ 
		{ text = "\\b7/\\b4 = Select" } 
		{ text = "\\bn = Back" } 
		{ text = "\\bm = Accept" } 
		{ text = "\\bp = Unassign trick" } 
	] 
	helper_text_elements_Console = [ 
		{ text = "\\b7/\\b4 = Select" } 
		{ text = "\\m1 = Back" } 
		{ text = "\\m0 = Accept" } 
		{ text = "\\b0 = Unassign trick" } 
	] 
} 
generic_helper_text = { 
	helper_text_elements_PC = [ { text = "\\b7/\\b4 = Select" } { text = "\\bn = Back" } { text = "\\bm = Accept" } ] 
	helper_text_elements_Console = [ { text = "\\b7/\\b4 = Select" } { text = "\\m1 = Back" } { text = "\\m0 = Accept" } ] 
} 
generic_helper_text_back_only = { 
	helper_text_elements_PC = [ { text = "\\bn = Back" } ] 
	helper_text_elements_Console = [ { text = "\\m1 = Back" } ] 
} 
generic_helper_text_no_back = { 
	helper_text_elements_PC = [ { text = "\\b7/\\b4 = Select" } { text = "\\bm = Accept" } ] 
	helper_text_elements_Console = [ { text = "\\b7/\\b4 = Select" } { text = "\\m0 = Accept" } ] 
} 
generic_helper_text_no_accept = { 
	helper_text_elements_PC = [ { text = "\\b7/\\b4 = Select" } { text = "\\bn = Back" } ] 
	helper_text_elements_Console = [ { text = "\\b7/\\b4 = Select" } { text = "\\m1 = Back" } ] 
} 
generic_helper_text_cas = { 
	helper_text_elements_PC = [ { text = "\\b7/\\b4 = Select" } { text = "\\bn = Back" } { text = "\\bm = Accept" } { text = "\\bq/\\br = Rotate" } ] 
	helper_text_elements_Console = [ { text = "\\b7/\\b4 = Select" } { text = "\\m1 = Back" } { text = "\\m0 = Accept" } { text = "\\bg/\\bh = Rotate" } ] 
} 
generic_helper_text_cas_no_back = { 
	helper_text_elements_PC = [ { text = "\\b7/\\b4 = Select" } { text = "\\bm = Accept" } { text = "\\bq/\\br = Rotate" } ] 
	helper_text_elements_Console = [ { text = "\\b7/\\b4 = Select" } { text = "\\m0 = Accept" } { text = "\\bg/\\bh = Rotate" } ] 
} 
generic_helper_text_cas_z = { 
	helper_text_elements_PC = [ { text = "\\b7/\\b4 = Select" } { text = "\\bn = Back" } { text = "\\bm = Accept" } { text = "\\bq/\\br = Rotate" } { text = "\\bq = Zoom" } ] 
	helper_text_elements_Console = [ { text = "\\b7/\\b4 = Select" } { text = "\\m1 = Back" } { text = "\\m0 = Accept" } { text = "\\bg/\\bh = Rotate" } { text = "\\b9 = Zoom" } ] 
} 
generic_helper_text_left_right = { 
	helper_text_elements_PC = [ { text = "\\b6/\\b5 = Select" } { text = "\\bn = Back" } { text = "\\bm = Accept" } ] 
	helper_text_elements_Console = [ { text = "\\b6/\\b5 = Select" } { text = "\\m1 = Back" } { text = "\\m0 = Accept" } ] 
} 
generic_helper_text_up_down_left_right = { 
	helper_text_elements_PC = [ { text = "\\b7/\\b4/\\b6/\\b5 = Select" } { text = "\\bn = Back" } { text = "\\bm = Accept" } ] 
	helper_text_elements_Console = [ { text = "\\b7/\\b4/\\b6/\\b5 = Select" } { text = "\\m1 = Back" } { text = "\\m0 = Accept" } ] 
} 
generic_helper_text_up_down_adjust = { 
	helper_text_elements_PC = [ { text = "\\b7/\\b4 = Select" } { text = "\\b6/\\b5 = Adjust" } { text = "\\bn = Back" } { text = "\\bm = Accept" } ] 
	helper_text_elements_Console = [ { text = "\\b7/\\b4 = Select" } { text = "\\b6/\\b5 = Adjust" } { text = "\\m1 = Back" } { text = "\\m0 = Accept" } ] 
} 
generic_helper_text_left_right_l_r = { 
	helper_text_elements_PC = [ { text = "\\b6/\\b5 = Select" } { text = "\\bn = Back" } { text = "\\bm = Accept" } { text = "\\bq/\\br = Rotate" } ] 
	helper_text_elements_Console = [ { text = "\\b6/\\b5 = Select" } { text = "\\m1 = Back" } { text = "\\m0 = Accept" } { text = "\\bg/\\bh = Rotate" } ] 
} 
generic_helper_text_left_right_up_down = { 
	helper_text_elements_PC = [ { text = "\\b7/\\b4 = Select" } { text = "\\b6/\\b5 = Adjust" } { text = "\\bn = Back" } { text = "\\bm = Accept" } ] 
	helper_text_elements_Console = [ { text = "\\b7/\\b4 = Select" } { text = "\\b6/\\b5 = Adjust" } { text = "\\m1 = Back" } { text = "\\m0 = Accept" } ] 
} 
generic_helper_text_color_menu = { 
	helper_text_elements_PC = [ { text = "\\b7/\\b4 = Select" } { text = "\\b6/\\b5 = Adjust" } { text = "\\bn = Back" } { text = "\\bm = Accept" } { text = "\\bq/\\br = Rotate" } ] 
	helper_text_elements_Console = [ { text = "\\b7/\\b4 = Select" } { text = "\\b6/\\b5 = Adjust" } { text = "\\m1 = Back" } { text = "\\m0 = Accept" } { text = "\\bg/\\bh = Rotate" } ] 
} 
generic_helper_text_color_menu_z = { 
	helper_text_elements_PC = [ { text = "\\b7/\\b4 = Select" } { text = "\\b6/\\b5 = Adjust" } { text = "\\bn = Back" } { text = "\\bm = Accept" } { text = "\\bq/\\br = Rotate" } { text = "\\bq = Zoom" } ] 
	helper_text_elements_Console = [ { text = "\\b7/\\b4 = Select" } { text = "\\b6/\\b5 = Adjust" } { text = "\\m1 = Back" } { text = "\\m0 = Accept" } { text = "\\bg/\\bh = Rotate" } { text = "\\b9 = Zoom" } ] 
} 
generic_helper_text_color_menu_reset = { 
	helper_text_elements_PC = [ { text = "\\bn = Back" } { text = "\\bq/\\br = Rotate" } { text = "\\br = Reset" } ] 
	helper_text_elements_Console = [ { text = "\\m1 = Back" } { text = "\\bg/\\bh = Rotate" } { text = "\\b8 = Reset" } ] 
} 
cag_helper_text = { 
	helper_text_elements_PC = [ { text = "\\b8 = Quit" } { text = "\\bp = Back" } { text = "\\bm = Place" } { text = "\\bs/\\bt = Lower/Raise" } { text = "\\bq/\\br = Zoom" } ] 
	helper_text_elements_Console = [ { text = "\\b8 = Quit" } { text = "\\b0 = Back" } { text = "\\m0 = Place" } { text = "\\be/\\bf = Lower/Raise" } { text = "\\bg/\\bh = Zoom" } ] 
} 
cag_helper_text_no_back = { 
	helper_text_elements_PC = [ { text = "\\b8 = Quit" } { text = "\\bm = Place" } { text = "\\bs/\\bt = Lower/Raise" } { text = "\\bq/\\br = Zoom" } ] 
	helper_text_elements_Console = [ { text = "\\b8 = Quit" } { text = "\\m0 = Place" } { text = "\\be/\\bf = Raise/Lower" } { text = "\\bg/\\bh = Zoom" } ] 
} 
rail_editor_free_roam_helper_text = { 
	helper_text_elements_PC = [ { text = "\\b0 = Delete" } { text = "\\m0 = Place" } { text = "\\b1 = Snap" } { text = "\\b2 = Grab" } { text = "\\be/\\bf = Lower/Raise" } { text = "\\bg/\\bh = Zoom" } ] 
	helper_text_elements_2_pc = [ { text = "\\bk = Toggle Post" } { text = "\\bl = Toggle Grid" } ] 
	helper_text_elements_Console = [ { text = "\\b0 = Delete" } { text = "\\m0 = Place" } { text = "\\b1 = Snap" } { text = "\\b2 = Grab" } { text = "\\be/\\bf = Lower/Raise" } { text = "\\bg/\\bh = Zoom" } ] 
	helper_text_elements_2_console = [ { text = "\\bk = Toggle Post" } { text = "\\bl = Toggle Grid" } ] 
} 
rail_editor_layout_helper_text = { 
	helper_text_elements_PC = [ { text = "\\b0 = Cancel" } { text = "\\m0 = Place" } { text = "\\b1 = Snap" } { text = "\\be/\\bf = Lower/Raise" } { text = "\\bg/\\bh = Zoom" } ] 
	helper_text_elements_2_pc = [ { text = "\\bk = Toggle Post" } { text = "\\bl = Toggle Grid" } ] 
	helper_text_elements_Console = [ { text = "\\b0 = Cancel" } { text = "\\m0 = Place" } { text = "\\b1 = Snap" } { text = "\\be/\\bf = Lower/Raise" } { text = "\\bg/\\bh = Zoom" } ] 
	helper_text_elements_2_console = [ { text = "\\bk = Toggle Post" } { text = "\\bl = Toggle Grid" } ] 
} 
rail_editor_grab_helper_text = { 
	helper_text_elements_PC = [ { text = "\\b0 = Undo" } { text = "\\m0 = Place" } { text = "\\b1 = Snap" } { text = "\\be/\\bf = Lower/Raise" } { text = "\\bg/\\bh = Zoom" } ] 
	helper_text_elements_2_pc = [ { text = "\\bk = Toggle Post" } { text = "\\bl = Toggle Grid" } ] 
	helper_text_elements_Console = [ { text = "\\m1 = Undo" } { text = "\\m0 = Place" } { text = "\\b1 = Snap" } { text = "\\be/\\bf = Lower/Raise" } { text = "\\bg/\\bh = Zoom" } ] 
	helper_text_elements_2_console = [ { text = "\\bk = Toggle Post" } { text = "\\bl = Toggle Grid" } ] 
} 
park_editor_helper_text = { 
	helper_text_elements_PC = [ { text = "\\b0 = Delete" } { text = "\\m0 = Place" } { text = "\\b1/\\b2 = Rotate" } { text = "\\be/\\bg = Raise/Lower" } { text = "\\bf/\\bh = Zoom" } ] 
	helper_text_elements_Console = [ { text = "\\b0 = Delete" } { text = "\\m0 = Accept" } { text = "\\b1/\\b2 = Rotate" } { text = "\\be/\\bf = Lower/Raise" } { text = "\\bg/\\bh = Zoom" } ] 
} 
gap_regular_helper_text = { 
	helper_text_elements_PC = [ { text = "\\b0 = Delete" } { text = "\\m0 = Accept" } ] 
	helper_text_elements_Console = [ { text = "\\m1 = Delete" } { text = "\\m0 = Accept" } ] 
} 
gap_adjust_helper_text = { 
	helper_text_elements_PC = [ { text = "\\b0 = Delete" } { text = "\\b1/\\b2 = Rotate" } { text = "\\be/\\bf/\\bg/\\bh = Adjust" } ] 
	helper_text_elements_Console = [ { text = "\\b0 = Delete" } { text = "\\b1/\\b2 = Rotate" } { text = "\\be/\\bf/\\bg/\\bh = Adjust" } ] 
} 
resize_park_helper_text_lr = { 
	helper_text_elements_PC = [ { text = "\\b6/\\b5 = Adjust" } { text = "\\bm = Side" } { text = "\\bp = Expand" } { text = "\\bo = Contract" } { text = "\\bn = Back" } ] 
	helper_text_elements_Console = [ { text = "\\b6/\\b5 = Adjust" } { text = "\\m0 = Side" } { text = "\\b0 = Expand" } { text = "\\b1 = Contract" } { text = "\\m1 = Back" } ] 
} 
resize_park_helper_text_ud = { 
	helper_text_elements_PC = [ { text = "\\b7/\\b4 = Adjust" } { text = "\\bm = Side" } { text = "\\bp = Expand" } { text = "\\bo = Contract" } { text = "\\bn = Back" } ] 
	helper_text_elements_Console = [ { text = "\\b7/\\b4 = Adjust" } { text = "\\m0 = Side" } { text = "\\b0 = Expand" } { text = "\\b1 = Contract" } { text = "\\m1 = Back" } ] 
} 
generic_dialog_helper_text = { 
	helper_text_elements_PC = [ { text = "\\bm = Accept" } ] 
	helper_text_elements_Console = [ { text = "\\m0 = Accept" } ] 
} 
generic_dialog_helper_text2 = { 
	helper_text_elements_PC = [ { text = "\\b7/\\b4 = Select" } { text = "\\bm = Accept" } ] 
	helper_text_elements_Console = [ { text = "\\b7/\\b4 = Select" } { text = "\\m0 = Accept" } ] 
} 
generic_dialog_helper_text3 = { 
	helper_text_elements_PC = [ { text = "\\bn = Back" } { text = "\\bm = Accept" } ] 
	helper_text_elements_Console = [ { text = "\\m1 = Back" } { text = "\\m0 = Accept" } ] 
} 
generic_helper_text_toggle = { 
	helper_text_elements_PC = [ { text = "\\b7/\\b4 = Select" } { text = "\\b6/\\b5 or \\bm = Toggle" } { text = "\\bn = Back" } ] 
	helper_text_elements_Console = [ { text = "\\b7/\\b4 = Select" } { text = "\\b6/\\b5 or \\m0 = Toggle" } { text = "\\m1 = Back" } ] 
} 
generic_helper_text_view_menu = { 
	helper_text_elements_PC = [ { text = "\\b7/\\b4 = Select" } { text = "\\bn = Back" } ] 
	helper_text_elements_Console = [ { text = "\\b7/\\b4 = Select" } { text = "\\m1 = Back" } ] 
} 
helper_text_skater_select = { 
	helper_text_elements_PC = [ 
		{ text = "\\b6/\\b5 = Skaters" } 
		{ text = "\\b7/\\b4 = Skins" } 
		{ text = "\\bs/\\bt = Categories" } 
		{ text = "\\bq/\\br = Rotate" } 
	] 
	helper_text_elements_2_pc = [ 
		{ text = "\\bm = Select" } 
		{ text = "\\bn = Back" } 
		{ text = "\\bo = Load Skater" } 
		{ text = "\\bp = Make Custom Skater" } 
	] 
	helper_text_elements_Console = [ 
		{ text = "\\b6/\\b5 = Skaters" } 
		{ text = "\\b7/\\b4 = Skins" } 
		{ text = "\\be/\\bf = Categories" } 
		{ text = "\\bg/\\bh = Rotate" } 
	] 
	helper_text_elements_2_console = [ 
		{ text = "\\m0 = Select" } 
		{ text = "\\m1 = Back" } 
		{ text = "\\me = Load Skater" } 
		{ text = "\\b0 = Make Custom Skater" } 
	] 
} 
generic_helper_text_thugpro_levelselect = { 
	helper_text_elements = [ 
		{ enabled = 0 text = "\\b6/\\b5 = Games" } 
		{ enabled = 0 text = "\\b7/\\b4 = Change Level" } 
		{ enabled = 0 text = "\\m0 = Choose Level" } 
		{ enabled = 0 text = "\\b2 = Back" } 
	] 
} 
save_files_menu_helper_text = { 
	helper_text_elements_PC = [ 
		{ text = "\\b7/\\b4 = Select" } 
		{ text = "\\bn = Back" } 
		{ text = "\\bm = Accept" } 
		{ text = "\\bo = Delete" } 
	] 
	helper_text_elements_Console = [ 
		{ text = "\\b7/\\b4 = Select" } 
		{ text = "\\m1 = Back" } 
		{ text = "\\m0 = Accept" } 
		{ text = "\\me = Delete" } 
	] 
} 
load_files_menu_helper_text = { 
	helper_text_elements_PC = [ 
		{ text = "\\b7/\\b4 = Select" } 
		{ text = "\\bn = Back" } 
		{ text = "\\bm = Accept" } 
	] 
	helper_text_elements_Console = [ 
		{ text = "\\b7/\\b4 = Select" } 
		{ text = "\\m1 = Back" } 
		{ text = "\\m0 = Accept" } 
	] 
} 

