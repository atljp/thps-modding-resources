
SCRIPT create_helper_text { anchor_id = helper_text_anchor 
		parent = current_menu_anchor 
		helper_text_anchor = <helper_text_anchor> 
		helper_pos = PAIR(320.00000000000, 426.00000000000) 
		spacing_between = 3 
		bg_rgba = [ 2 0 1 98 ] 
	} 
	IF ObjectExists id = <anchor_id> 
		DestroyScreenElement id = <anchor_id> 
	ENDIF 
	CreateScreenElement { 
		type = ContainerElement 
		parent = <parent> 
		id = <anchor_id> 
		pos = PAIR(320.00000000000, 240.00000000000) 
		dims = PAIR(640.00000000000, 480.00000000000) 
	} 
	IF NOT GotParam no_bar 
		CreateScreenElement { 
			type = SpriteElement 
			parent = <anchor_id> 
			texture = white2 
			pos = <helper_pos> 
			just = [ center bottom ] 
			rgba = <bg_rgba> 
			scale = PAIR(200.50000000000, 3.40000009537) 
		} 
		CreateScreenElement { 
			type = SpriteElement 
			parent = <anchor_id> 
			texture = white3 
			scale = PAIR(40.00000000000, 0.02999999933) 
			rgba = [ 13 56 82 80 ] 
			pos = ( <helper_pos> - PAIR(0.00000000000, 29.00000000000) ) 
		} 
		CreateScreenElement { 
			type = SpriteElement 
			parent = <anchor_id> 
			texture = white3 
			scale = PAIR(40.00000000000, 0.02999999933) 
			rgba = [ 13 56 82 80 ] 
			pos = ( <helper_pos> + PAIR(0.00000000000, 2.00000000000) ) 
		} 
	ENDIF 
	CreateScreenElement { 
		type = HMenu 
		parent = <anchor_id> 
		pos = ( <helper_pos> - PAIR(0.00000000000, 3.00000000000) ) 
		just = [ center bottom ] 
		internal_just = [ center center ] 
		padding_scale = 0.89999997616 
		spacing_between = <spacing_between> 
		scale = <scale> 
	} 
	<menu_id> = <id> 
	IF GotParam helper_text_elements 
		ForEachIn <helper_text_elements> do = helper_text_update_element params = { menu_id = <menu_id> } 
	ENDIF 
ENDSCRIPT

SCRIPT helper_text_update_element 
	IF GotParam id 
		IF ObjectExists <id> 
			SetScreenElementProps { 
				id = <id> 
				text = <text> 
			} 
			RETURN 
		ENDIF 
	ENDIF 
	CreateScreenElement { 
		type = TextElement 
		parent = <menu_id> 
		id = <id> 
		font = dialog 
		text = <text> 
		rgba = [ 70 70 70 108 ] 
		scale = 0.79000002146 
		z_priority = 100 
		not_focusable 
	} 
ENDSCRIPT

generic_helper_text = { helper_text_elements = [ { text = "\\b7/\\b4 = Selecionar" } 
		{ text = "\\bn = Voltar" } 
		{ text = "\\bm = Aceitar" } 
	] 
} 
generic_helper_text_no_back = { helper_text_elements = [ { text = "\\b7/\\b4 = Selecionar" } 
		{ text = "\\bm = Aceitar" } 
	] 
} 
generic_helper_text_no_accept = { helper_text_elements = [ { text = "\\b7/\\b4 = Selecionar" } 
		{ text = "\\bn = Voltar" } 
	] 
} 
generic_helper_text_cas = { helper_text_elements = [ { text = "\\b7/\\b4 = Selecionar" } 
		{ text = "\\bn = Voltar" } 
		{ text = "\\bm = Aceitar" } 
		{ text = "\\bs/\\bt = Girar" } 
	] 
} 
generic_helper_text_cas_no_back = { helper_text_elements = [ { text = "\\b7/\\b4 = Selecionar" } 
		{ text = "\\bm = Aceitar" } 
		{ text = "\\bs/\\bt = Girar" } 
	] 
} 
generic_helper_text_cas_z = { helper_text_elements = [ { text = "\\b7/\\b4 = Selecionar" } 
		{ text = "\\bn = Voltar" } 
		{ text = "\\bm = Aceitar" } 
		{ text = "\\bs/\\bt = Girar" } 
		{ text = "\\bq = Zoom" } 
	] 
} 
generic_helper_text_left_right = { helper_text_elements = [ { text = "\\b6/\\b5 = Selecionar" } 
		{ text = "\\bn = Voltar" } 
		{ text = "\\bm = Aceitar" } 
	] 
} 
generic_helper_text_up_down_left_right = { helper_text_elements = [ { text = "\\b7/\\b4/\\b6/\\b5 = Selecionar" } 
		{ text = "\\bn = Voltar" } 
		{ text = "\\bm = Aceitar" } 
	] 
} 
generic_helper_text_up_down_adjust = { helper_text_elements = [ { text = "\\b7/\\b4 = Selecionar" } 
		{ text = "\\b6/\\b5 = Ajustar" } 
		{ text = "\\bn = Voltar" } 
		{ text = "\\bm = Aceitar" } 
	] 
} 
generic_helper_text_left_right_l_r = { helper_text_elements = [ { text = "\\b6/\\b5 = Selecionar" } 
		{ text = "\\bn = Voltar" } 
		{ text = "\\bm = Aceitar" } 
		{ text = "\\bs/\\bt = Girar" } 
	] 
} 
generic_helper_text_left_right_up_down = { helper_text_elements = [ { text = "\\b7/\\b4 = Selecionar" } 
		{ text = "\\b6/\\b5=Ajustar" } 
		{ text = "\\bn = Voltar" } 
		{ text = "\\bm = Aceitar" } 
	] 
} 
generic_helper_text_color_menu = { helper_text_elements = [ { text = "\\b7/\\b4=Selecionar" } 
		{ text = "\\b6/\\b5=Ajustar" } 
		{ text = "\\bn=Voltar" } 
		{ text = "\\bm=Aceitar" } 
		{ text = "\\bs/\\bt=Girar" } 
	] 
} 
generic_helper_text_color_menu_z = { helper_text_elements = [ { text = "\\b7/\\b4=Selecionar" } 
		{ text = "\\b6/\\b5=Ajustar" } 
		{ text = "\\bn=Voltar" } 
		{ text = "\\bm=Aceitar" } 
		{ text = "\\bs/\\bt=Girar" } 
		{ text = "\\bq=Zoom" } 
	] 
} 
generic_helper_text_color_menu_reset = { helper_text_elements = [ 
		{ text = "\\bn=Voltar" } 
		{ text = "\\bs/\\bt=Girar" } 
		{ text = "\\br=Resetar" } 
		{ } 
	] 
} 
generic_helper_text_color_menu_reset_ngc = { helper_text_elements = [ 
		{ text = "\\bn=Voltar" } 
		{ text = "\\bs/\\bt=Girar" } 
		{ text = "\\be+\\bf=Resetar" } 
		{ text = "\\bq=Zoom" } 
	] 
} 
cag_helper_text = 
{ 
	helper_text_elements = 
	[ 
		{ text = "\\b8=Sair" } 
		{ text = "\\bn=Voltar" } 
		{ text = "\\bm=Colocar" } 
		{ text = "\\be/\\bg=Aumentar/Diminuir" } 
		{ text = "\\bf/\\bh=Zoom" } 
	] 
} 
cag_helper_text_xbox = 
{ 
	helper_text_elements = 
	[ 
		{ text = "\\b8=Sair" } 
		{ text = "\\bp=Voltar" } 
		{ text = "\\bm=Colocar" } 
		{ text = "\\bs/\\bt=Diminuir/Aumentar" } 
		{ text = "\\bq/\\br=Zoom" } 
	] 
} 
cag_helper_text_ngc = 
{ 
	helper_text_elements = 
	[ 
		{ text = "\\b8=Sair" } 
		{ text = "\\b0=Voltar" } 
		{ text = "\\m0=Colocar" } 
		{ text = "\\be/\\bf=Aumentar/Diminuir" } 
		{ text = "\\b9+\\bs/\\bt=Zoom" } 
	] 
} 
cag_helper_text_no_back = 
{ 
	helper_text_elements = 
	[ 
		{ text = "\\b8 = Sair" } 
		{ text = "\\m0 = Colocar" } 
		{ text = "\\be/\\bg = Aumentar/Diminuir" } 
		{ text = "\\bf/\\bh = Zoom" } 
	] 
} 
cag_helper_text_no_back_xbox = 
{ 
	helper_text_elements = 
	[ 
		{ text = "\\b8 = Sair" } 
		{ text = "\\bm = Colocar" } 
		{ text = "\\bs/\\bt = Diminuir/Aumentar" } 
		{ text = "\\bq/\\br = Zoom" } 
	] 
} 
cag_helper_text_no_back_ngc = 
{ 
	helper_text_elements = 
	[ 
		{ text = "\\b8 = Sair" } 
		{ text = "\\m0 = Colocar" } 
		{ text = "\\bs/\\bt=Aumentar/Diminuir" } 
		{ text = "\\bq+\\br/\\bf=Zoom" } 
	] 
} 
rail_editor_free_roam_helper_text = 
{ 
	helper_text_elements = 
	[ 
		{ text = "\\m1 = Deletar" } 
		{ text = "\\m0 = Colocar" } 
		{ text = "\\b1 = Snap" } 
		{ text = "\\b2 = Grab" } 
		{ text = "\\be/\\bg = Aumentar/Diminuir" } 
		{ text = "\\bf/\\bh = Zoom" } 
	] 
} 
rail_editor_layout_helper_text = 
{ 
	helper_text_elements = 
	[ 
		{ text = "\\m1 = Fim" } 
		{ text = "\\m0 = Colocar" } 
		{ text = "\\b1 = Snap" } 
		{ text = "\\be/\\bg = Aumentar/Diminuir" } 
		{ text = "\\bf/\\bh = Zoom" } 
	] 
} 
rail_editor_grab_helper_text = 
{ 
	helper_text_elements = 
	[ 
		{ text = "\\m1 = Desfazer" } 
		{ text = "\\m0 = Colocar" } 
		{ text = "\\b1 = Snap" } 
		{ text = "\\be/\\bg = Aumentar/Diminuir" } 
		{ text = "\\bf/\\bh = Zoom" } 
	] 
} 
rail_editor_free_roam_helper_text_xbox = 
{ 
	helper_text_elements = 
	[ 
		{ text = "\\b0 = Deletar" } 
		{ text = "\\m0 = Colocar" } 
		{ text = "\\b1 = Snap" } 
		{ text = "\\b2 = Grab" } 
		{ text = "\\be/\\bf = Diminuir/Aumentar" } 
		{ text = "\\bg/\\bh = Zoom" } 
	] 
} 
rail_editor_layout_helper_text_xbox = 
{ 
	helper_text_elements = 
	[ 
		{ text = "\\b0 = Fim" } 
		{ text = "\\m0 = Colocar" } 
		{ text = "\\b1 = Snap" } 
		{ text = "\\be/\\bf = Diminuir/Aumentar" } 
		{ text = "\\bg/\\bh = Zoom" } 
	] 
} 
rail_editor_grab_helper_text_xbox = 
{ 
	helper_text_elements = 
	[ 
		{ text = "\\b0 = Desfazer" } 
		{ text = "\\m0 = Colocar" } 
		{ text = "\\b1 = Snap" } 
		{ text = "\\be/\\bf = Diminuir/Aumentar" } 
		{ text = "\\bg/\\bh = Zoom" } 
	] 
} 
rail_editor_free_roam_helper_text_ngc = 
{ 
	helper_text_elements = 
	[ 
		{ text = "\\b1=Deletar" } 
		{ text = "\\m0=Colocar" } 
		{ text = "\\b0=Snap" } 
		{ text = "\\b2= Grab" } 
		{ text = "\\be/\\bf=Aumentar/Diminuir" } 
		{ text = "\\b9+\\bs/\\bt=Zoom" } 
	] 
} 
rail_editor_layout_helper_text_ngc = 
{ 
	helper_text_elements = 
	[ 
		{ text = "\\b1=Fim" } 
		{ text = "\\m0=Colocar" } 
		{ text = "\\b0=Snap" } 
		{ text = "\\be/\\bf=Aumentar/Diminuir" } 
		{ text = "\\b9+\\bs/\\bt=Zoom" } 
	] 
} 
rail_editor_grab_helper_text_ngc = 
{ 
	helper_text_elements = 
	[ 
		{ text = "\\b1=Desfazer" } 
		{ text = "\\m0=Colocar" } 
		{ text = "\\b0=Snap" } 
		{ text = "\\be/\\bf=Aumentar/Diminuir" } 
		{ text = "\\b9+\\bs/\\bt=Zoom" } 
	] 
} 
park_editor_helper_text = { helper_text_elements = [ { text = "\\bo = Deletar" } 
		{ text = "\\bm = Aceitar" } 
		{ text = "\\bs/\\bt = Girar" } 
		{ text = "\\be/\\bg = Aumentar/Diminuir" } 
		{ text = "\\bf/\\bh = Zoom" } 
	] 
} 
park_editor_helper_text_xbox = { helper_text_elements = [ { text = "\\b0 = Deletar" } 
		{ text = "\\m0 = Aceitar" } 
		{ text = "\\b1/\\b2 = Girar" } 
		{ text = "\\be/\\bf = Aumentar/Diminuir" } 
		{ text = "\\bg/\\bh = Zoom" } 
	] 
} 
park_editor_helper_text_ngc = { helper_text_elements = [ { text = "\\b1=Deletar" } 
		{ text = "\\m0 = Aceitar" } 
		{ text = "\\b0/\\b2 = Girar" } 
		{ text = "\\be/\\bf = Aumentar/Diminuir" } 
		{ text = "\\b9+\\be/\\bf = Zoom" } 
	] 
} 
gap_regular_helper_text = { helper_text_elements = [ { text = "\\bn = Deletar" } 
		{ text = "\\bm = Aceitar" } 
	] 
} 
gap_regular_helper_text_xbox = { helper_text_elements = [ { text = "\\b0 = Deletar" } 
		{ text = "\\bm = Aceitar" } 
	] 
} 
gap_regular_helper_text_ngc = { helper_text_elements = [ { text = "\\b1 = Deletar" } 
		{ text = "\\bm = Aceitar" } 
	] 
} 
gap_adjust_helper_text = { helper_text_elements = [ { text = "\\m1=Deletar \\b1/\\b2=Girar \\be/\\bg=Ajustar Esquerda \\bf/\\bh=Ajustar Direita" } 
	] 
} 
gap_adjust_helper_text_xbox = { helper_text_elements = [ { text = "\\b0 = Deletar" } 
		{ text = "\\bs/\\bt = Girar" } 
		{ text = "\\be/\\bf/\\bg/\\bh = Ajustar" } 
	] 
} 
gap_adjust_helper_text_ngc = { helper_text_elements = [ { text = "\\b1 = Deletar" } 
		{ text = "\\bs/\\bt = Girar" } 
		{ text = "\\be/\\bf + \\b7/\\b4  = Ajustar" } 
	] 
} 
resize_park_helper_text_lr = 
{ 
	helper_text_elements = 
	[ 
		{ text = "\\b6/\\b5 = Ajustar" } 
		{ text = "\\m0 = Side" } 
		{ text = "\\b2 = Expandir" } 
		{ text = "\\b1 = Contratar" } 
		{ text = "\\m1 = Voltar" } 
	] 
} 
resize_park_helper_text_ud = 
{ 
	helper_text_elements = 
	[ 
		{ text = "\\b7/\\b4 = Ajustar" } 
		{ text = "\\m0 = Side" } 
		{ text = "\\b2 = Expandir" } 
		{ text = "\\b1 = Contratar" } 
		{ text = "\\m1 = Voltar" } 
	] 
} 
resize_park_helper_text_lr_xbox = 
{ 
	helper_text_elements = 
	[ 
		{ text = "\\b6/\\b5 = Ajustar" } 
		{ text = "\\bm = Side" } 
		{ text = "\\bp = Expandir" } 
		{ text = "\\bo = Contratar" } 
		{ text = "\\bn = Voltar" } 
	] 
} 
resize_park_helper_text_ud_xbox = 
{ 
	helper_text_elements = 
	[ 
		{ text = "\\b7/\\b4 = Ajustar" } 
		{ text = "\\bm = Side" } 
		{ text = "\\bp = Expandir" } 
		{ text = "\\bo = Contratar" } 
		{ text = "\\bn = Voltar" } 
	] 
} 
resize_park_helper_text_lr_ngc = 
{ 
	helper_text_elements = 
	[ 
		{ text = "\\b6/\\b5 = Ajustar" } 
		{ text = "\\m0 = Side" } 
		{ text = "\\b2 = Expandir" } 
		{ text = "\\b0 = Contratar" } 
		{ text = "\\m1 = Voltar" } 
	] 
} 
resize_park_helper_text_ud_ngc = 
{ 
	helper_text_elements = 
	[ 
		{ text = "\\b7/\\b4 = Ajustar" } 
		{ text = "\\m0 = Side" } 
		{ text = "\\b2 = Expandir" } 
		{ text = "\\b0 = Contratar" } 
		{ text = "\\m1 = Voltar" } 
	] 
} 
generic_dialog_helper_text = { helper_text_elements = [ { text = "\\bm = Aceitar" } ] } 
generic_dialog_helper_text2 = { helper_text_elements = [ { text = "\\b7/\\b4 = Selecionar" } 
		{ text = "\\bm = Aceitar" } 
	] 
} 
generic_dialog_helper_text3 = { helper_text_elements = [ { text = "\\bn = Voltar" } 
		{ text = "\\bm = Aceitar" } 
	] 
} 
generic_helper_text_toggle = { helper_text_elements = [ { text = "\\b7/\\b4 = Selecionar" } 
		{ text = "\\bn = Voltar" } 
		{ text = "\\bm = Toggle" } 
	] 
} 
eye_toy_helper_text = { 
	helper_text_elements = [ 
		{ text = "\\m9 = Toggle Low Light" } 
		{ text = "\\m0 = Capturar" } 
		{ text = "\\m1 = Voltar" } 
	] 
} 

