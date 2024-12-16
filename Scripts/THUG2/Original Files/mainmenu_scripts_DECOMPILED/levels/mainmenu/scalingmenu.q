
scalingmenu_bar_scale = PAIR(4.40000009537, 2.00000000000) 
scalingmenu_bar_focus_rgba = [ 128 128 128 128 ] 
scalingmenu_bar_unfocus_rgba = [ 40 40 40 128 ] 
scalingmenu_bar_pos = PAIR(12.00000000000, 0.00000000000) 
scalingmenu_text_pos = PAIR(-95.00000000000, 0.00000000000) 
scalingmenu_spacing_between = 1 
scalingmenu_arrow_pos_up = PAIR(0.00000000000, 7.00000000000) 
scalingmenu_arrow_pos_down = PAIR(0.00000000000, -7.00000000000) 
scalingmenu_arrow_rgba = [ 128 128 128 128 ] 
scalingmenu_arrow_scale = 0.69999998808 
scalingmenu_arrow_left = -49.00000000000 
scalingmenu_arrow_right = 76.00000000000 
scalingmenu_scale_increment = 1 
scalingmenu_min_scale = 0.00000000000 
scalingmenu_max_scale = 100.00000000000 
scalingmenu_constraints = [ 
	{ part = object_scaling male_min = 90.00000000000 male_max = 120.00000000000 female_min = 90.00000000000 female_max = 120.00000000000 } 
	{ part = headtop_bone_group male_min = 80.00000000000 male_max = 130.00000000000 female_min = 80.00000000000 female_max = 130.00000000000 } 
	{ part = head_bone_group male_min = 85.00000000000 male_max = 115.00000000000 female_min = 85.00000000000 female_max = 115.00000000000 } 
	{ part = nose_bone_group male_min = 20.00000000000 male_max = 150.00000000000 female_min = 20.00000000000 female_max = 150.00000000000 } 
	{ part = Jaw_bone_group male_min = 60.00000000000 male_max = 130.00000000000 female_min = 60.00000000000 female_max = 130.00000000000 } 
	{ part = torso_bone_group male_min = 90.00000000000 male_max = 130.00000000000 female_min = 90.00000000000 female_max = 150.00000000000 } 
	{ part = stomach_bone_group male_min = 90.00000000000 male_max = 130.00000000000 female_min = 90.00000000000 female_max = 100.00000000000 } 
	{ part = upper_arm_bone_group male_min = 90.00000000000 male_max = 130.00000000000 female_min = 90.00000000000 female_max = 120.00000000000 } 
	{ part = lower_arm_bone_group male_min = 90.00000000000 male_max = 130.00000000000 female_min = 90.00000000000 female_max = 120.00000000000 } 
	{ part = hands_bone_group male_min = 90.00000000000 male_max = 130.00000000000 female_min = 90.00000000000 female_max = 120.00000000000 } 
	{ part = upper_leg_bone_group male_min = 90.00000000000 male_max = 150.00000000000 female_min = 90.00000000000 female_max = 120.00000000000 } 
	{ part = lower_leg_bone_group male_min = 90.00000000000 male_max = 150.00000000000 female_min = 90.00000000000 female_max = 120.00000000000 } 
	{ part = feet_bone_group male_min = 90.00000000000 male_max = 150.00000000000 female_min = 90.00000000000 female_max = 120.00000000000 } 
] 
skateshop_scaling_options = [ 
	{ 
		group_title = "SCALE OPTIONS" 
		text = #"Body" 
		submenu = face_scale_menu 
		should_add_scaling_options 
		scaling_params = { affectXYZ } 
		bone_group = object_scaling 
	} 
	{ 
		text = #"Head Top" 
		submenu = face_scale_menu 
		should_add_scaling_options 
		scaling_params = { affectX affectY affectZ } 
		bone_group = headtop_bone_group 
		cam_anim_sub = head 
		male_part = skater_m_head 
		female_part = skater_f_head 
	} 
	{ 
		text = #"Face" 
		submenu = face_scale_menu 
		should_add_scaling_options 
		scaling_params = { affectX affectY affectZ } 
		bone_group = head_bone_group 
		cam_anim_sub = head 
		male_part = skater_m_head 
		female_part = skater_f_head 
	} 
	{ 
		text = #"Nose" 
		submenu = face_scale_menu 
		should_add_scaling_options 
		scaling_params = { affectX affectY affectZ } 
		bone_group = nose_bone_group 
		cam_anim_sub = head 
		male_part = skater_m_head 
		female_part = skater_f_head 
	} 
	{ 
		text = #"jaw" 
		submenu = face_scale_menu 
		should_add_scaling_options 
		scaling_params = { affectX affectY affectZ } 
		bone_group = Jaw_bone_group 
		cam_anim_sub = head 
		male_part = skater_m_head 
		female_part = skater_f_head 
	} 
	{ 
		text = #"Chest" 
		submenu = torso_scale_menu 
		scaling_params = { affectXY } 
		should_add_scaling_options 
		bone_group = torso_bone_group 
		cam_anim_sub = adjtorso 
	} 
	{ 
		text = #"Waist" 
		submenu = stomach_scale_menu 
		scaling_params = { affectXY } 
		should_add_scaling_options 
		bone_group = stomach_bone_group 
		cam_anim_sub = waist 
	} 
	{ 
		text = #"Biceps" 
		submenu = upper_arm_scale_menu 
		scaling_params = { affectXY } 
		should_add_scaling_options 
		bone_group = upper_arm_bone_group 
		cam_anim_sub = adjtorso 
	} 
	{ 
		text = #"Forearms" 
		submenu = lower_arm_scale_menu 
		scaling_params = { affectXY } 
		should_add_scaling_options 
		bone_group = lower_arm_bone_group 
		cam_anim_sub = adjtorso 
	} 
	{ 
		text = #"Hands" 
		submenu = hands_scale_menu 
		scaling_params = { affectXY } 
		should_add_scaling_options 
		bone_group = hands_bone_group 
		cam_anim_sub = legs 
	} 
	{ 
		text = #"Thighs" 
		submenu = upper_leg_scale_menu 
		scaling_params = { affectXY } 
		should_add_scaling_options 
		bone_group = upper_leg_bone_group 
		cam_anim_sub = legs 
	} 
	{ 
		text = #"Calves" 
		submenu = lower_leg_scale_menu 
		scaling_params = { affectXY } 
		should_add_scaling_options 
		bone_group = lower_leg_bone_group 
		cam_anim_sub = calves 
	} 
	{ 
		text = #"Feet" 
		submenu = feet_scale_menu 
		scaling_params = { affectXY } 
		should_add_scaling_options 
		bone_group = feet_bone_group 
		cam_anim_sub = Feet 
	} 
] 
SCRIPT scalingmenu_refresh_skaters 
	IF InNetGame 
		script_assert "scalingmenu_refresh_skaters should not be called in net games!" 
	ENDIF 
	GetCurrentSkaterProfileIndex 
	RefreshSkaterScale skater = 0 profile = <currentSkaterProfileIndex> 
ENDSCRIPT

SCRIPT scalingmenu_increment_uniform 
	scalingmenu_increment affectX = 1 affectY = 1 affectZ = 1 <...> 
ENDSCRIPT

SCRIPT scalingmenu_decrement_uniform 
	scalingmenu_decrement affectX = 1 affectY = 1 affectZ = 1 <...> 
ENDSCRIPT

SCRIPT scalingmenu_get_limits 
	GetCurrentSkaterProfileIndex 
	GetSkaterProfileInfo player = <currentSkaterProfileIndex> 
	GetArraySize scalingmenu_constraints 
	<index> = 0 
	BEGIN 
		IF ChecksumEquals a = ( ( scalingmenu_constraints [ <index> ] ) . part ) b = <part> 
			IF ( <is_male> = 1 ) 
				<min> = ( ( scalingmenu_constraints [ <index> ] ) . male_min ) 
				<max> = ( ( scalingmenu_constraints [ <index> ] ) . male_max ) 
			ELSE 
				<min> = ( ( scalingmenu_constraints [ <index> ] ) . female_min ) 
				<max> = ( ( scalingmenu_constraints [ <index> ] ) . female_max ) 
			ENDIF 
			BREAK 
		ENDIF 
		<index> = ( <index> + 1 ) 
	REPEAT <array_size> 
	IF NOT gotParam min 
		<min> = 90.00000000000 
	ENDIF 
	IF NOT gotParam max 
		<max> = 150.00000000000 
	ENDIF 
	RETURN min = <min> max = <max> 
ENDSCRIPT

SCRIPT scalingmenu_increment 
	scalingmenu_get_xyz part = <part> 
	scalingmenu_get_limits part = <part> <...> 
	IF gotParam affectX 
		IF ( <affectX> = 1 ) 
			<x> = ( <x> + scalingmenu_scale_increment ) 
			IF ( <x> > <max> ) 
				<x> = <max> 
			ENDIF 
		ENDIF 
	ENDIF 
	IF gotParam affectY 
		IF ( <affectY> = 1 ) 
			<y> = ( <y> + scalingmenu_scale_increment ) 
			IF ( <y> > <max> ) 
				<y> = <max> 
			ENDIF 
		ENDIF 
	ENDIF 
	IF gotParam affectZ 
		IF ( <affectZ> = 1 ) 
			<z> = ( <z> + scalingmenu_scale_increment ) 
			IF ( <z> > <max> ) 
				<z> = <max> 
			ENDIF 
		ENDIF 
	ENDIF 
	scalingmenu_set_xyz part = <part> x = <x> y = <y> z = <z> 
	scalingmenu_refresh_arrows <...> <handler_params> 
	scalingmenu_refresh_skaters 
ENDSCRIPT

SCRIPT scalingmenu_decrement 
	scalingmenu_get_xyz part = <part> 
	scalingmenu_get_limits part = <part> <...> 
	IF gotParam affectX 
		IF ( <affectX> = 1 ) 
			<x> = ( <x> - scalingmenu_scale_increment ) 
			IF ( <x> < <min> ) 
				<x> = <min> 
			ENDIF 
		ENDIF 
	ENDIF 
	IF gotParam affectY 
		IF ( <affectY> = 1 ) 
			<y> = ( <y> - scalingmenu_scale_increment ) 
			IF ( <y> < <min> ) 
				<y> = <min> 
			ENDIF 
		ENDIF 
	ENDIF 
	IF gotParam affectZ 
		IF ( <affectZ> = 1 ) 
			<z> = ( <z> - scalingmenu_scale_increment ) 
			IF ( <z> < <min> ) 
				<z> = <min> 
			ENDIF 
		ENDIF 
	ENDIF 
	scalingmenu_set_xyz part = <part> x = <x> y = <y> z = <z> 
	scalingmenu_refresh_arrows <...> <handler_params> 
	scalingmenu_refresh_skaters 
ENDSCRIPT

SCRIPT scalingmenu_reset_to_default 
	GetCurrentSkaterProfileIndex 
	IF gotParam cas_part 
		GetActualPlayerAppearancePart player = <currentSkaterProfileIndex> part = <cas_part> 
		IF gotParam headtop_bone_group 
			IF ChecksumEquals a = <part> b = headtop_bone_group 
				<x> = ( <headtop_bone_group> . x ) 
				<y> = ( <headtop_bone_group> . y ) 
				<z> = ( <headtop_bone_group> . z ) 
			ENDIF 
		ENDIF 
		IF gotParam head_bone_group 
			IF ChecksumEquals a = <part> b = head_bone_group 
				<x> = ( <head_bone_group> . x ) 
				<y> = ( <head_bone_group> . y ) 
				<z> = ( <head_bone_group> . z ) 
			ENDIF 
		ENDIF 
		IF gotParam nose_bone_group 
			IF ChecksumEquals a = <part> b = nose_bone_group 
				<x> = ( <nose_bone_group> . x ) 
				<y> = ( <nose_bone_group> . y ) 
				<z> = ( <nose_bone_group> . z ) 
			ENDIF 
		ENDIF 
		IF gotParam Jaw_bone_group 
			IF ChecksumEquals a = <part> b = Jaw_bone_group 
				<x> = ( <Jaw_bone_group> . x ) 
				<y> = ( <Jaw_bone_group> . y ) 
				<z> = ( <Jaw_bone_group> . z ) 
			ENDIF 
		ENDIF 
		<use_default_scale> = 0 
	ENDIF 
	IF NOT gotParam x 
		<x> = 100 
		<y> = 100 
		<z> = 100 
		<use_default_scale> = 1 
	ENDIF 
	SetPlayerAppearanceScale player = <currentSkaterProfileIndex> part = <part> x = <x> y = <y> z = <z> use_default_scale = <use_default_scale> 
	scalingmenu_refresh_skaters 
ENDSCRIPT

SCRIPT scalingmenu_set_xyz 
	GetCurrentSkaterProfileIndex 
	SetPlayerAppearanceScale player = <currentSkaterProfileIndex> part = <part> x = <x> y = <y> z = <z> use_default_scale = 0 
ENDSCRIPT

SCRIPT scalingmenu_refresh_arrows 
	scalingmenu_get_xyz part = <part> 
	<v> = 0 
	IF gotParam affectX 
		IF ( <affectX> = 1 ) 
			<v> = <x> 
		ENDIF 
	ENDIF 
	IF gotParam affectY 
		IF ( <affectY> = 1 ) 
			<v> = <y> 
		ENDIF 
	ENDIF 
	IF gotParam affectZ 
		IF ( <affectZ> = 1 ) 
			<v> = <z> 
		ENDIF 
	ENDIF 
	scalingmenu_get_limits part = <part> <...> 
	sliderbar_rescale_to_bar min = <min> max = <max> value = <v> left = scalingmenu_arrow_left right = scalingmenu_arrow_right 
	SetScreenElementProps { 
		id = <up_arrow_id> 
		pos = ( PAIR(1.00000000000, 0.00000000000) * <x_val> ) 
	} 
	SetScreenElementProps { 
		id = <down_arrow_id> 
		pos = ( PAIR(1.00000000000, 0.00000000000) * <x_val> ) 
	} 
ENDSCRIPT

SCRIPT scalingmenu_focus rgba = [ 128 128 128 50 ] 
	GetTags 
	SetScreenElementProps { 
		id = { <id> child = 0 } 
		rgba = [ 0 , 0 , 0 , 128 ] 
		shadow_rgba = [ 0 , 0 , 0 , 0 ] 
	} 
	DoScreenElementMorph id = { <id> child = 2 } alpha = 1 time = 0 
	IF gotParam pad_left_handler 
		SetScreenElementProps { 
			id = <id> 
			event_handlers = [ 
				{ pad_left <pad_left_handler> params = <handler_params> } 
			] 
			replace_handlers 
		} 
	ENDIF 
	IF gotParam pad_right_handler 
		SetScreenElementProps { 
			id = <id> 
			event_handlers = [ 
				{ pad_right <pad_right_handler> params = <handler_params> } 
			] 
			replace_handlers 
		} 
	ENDIF 
	SetScreenElementProps { 
		id = <scaling_bar_id> 
		rgba = scalingmenu_bar_focus_rgba 
	} 
	DoScreenElementMorph { 
		id = <down_arrow_id> 
		scale = scalingmenu_arrow_scale 
	} 
	DoScreenElementMorph { 
		id = <up_arrow_id> 
		scale = scalingmenu_arrow_scale 
	} 
	scalingmenu_refresh_arrows <...> <handler_params> 
	generic_menu_update_arrows { 
		up_arrow_id = edit_skater_menu_up_arrow 
		down_arrow_id = edit_skater_menu_down_arrow 
	} 
ENDSCRIPT

SCRIPT scalingmenu_unfocus rgba = [ 128 128 128 0 ] 
	GetTags 
	SetScreenElementProps { 
		id = { <id> child = 0 } 
		rgba = [ 128 , 128 , 128 , 128 ] 
		shadow_rgba = UI_text_shadow_color 
	} 
	DoScreenElementMorph id = { <id> child = 2 } alpha = 0 time = 0 
	SetScreenElementProps { 
		id = <scaling_bar_id> 
		rgba = scalingmenu_bar_unfocus_rgba 
	} 
	DoScreenElementMorph { 
		id = <down_arrow_id> 
		scale = 0.00000000000 
	} 
	DoScreenElementMorph { 
		id = <up_arrow_id> 
		scale = 0.00000000000 
	} 
ENDSCRIPT

SCRIPT scalingmenu_addslider text = #"XYZ" affectX = 0 affectY = 0 affectZ = 0 id = default_slider_bar 
	MangleChecksums a = <id> b = up_arrow 
	<up_arrow_id> = <mangled_id> 
	MangleChecksums a = <id> b = down_arrow 
	<down_arrow_id> = <mangled_id> 
	MangleChecksums a = <id> b = slider_bar 
	<slider_bar_id> = <mangled_id> 
	MangleChecksums a = <id> b = anchor 
	<anchor_id> = <mangled_id> 
	sliderbar_add_item { 
		text = <text> 
		focus_script = scalingmenu_focus 
		focus_params = { 
			pad_left_handler = scalingmenu_decrement_uniform 
			pad_right_handler = scalingmenu_increment_uniform 
			handler_params = <...> 
			up_arrow_id = <up_arrow_id> 
			down_arrow_id = <down_arrow_id> 
			part = <part> 
			scaling_bar_id = <slider_bar_id> 
			affectX = <affectX> 
			affectY = <affectY> 
			affectZ = <affectZ> 
		} 
		unfocus_script = scalingmenu_unfocus 
		unfocus_params = { 
			up_arrow_id = <up_arrow_id> 
			down_arrow_id = <down_arrow_id> 
			scaling_bar_id = <slider_bar_id> 
		} 
		pad_choose_script = nullscript 
		child_texture = bw_slider 
		icon_id = <slider_bar_id> 
		icon_scale = scalingmenu_bar_scale 
		icon_rgba = scalingmenu_bar_unfocus_rgba 
		icon_pos = scalingmenu_bar_pos 
		text_pos = scalingmenu_text_pos 
		text_just = [ left center ] 
		tab = tab3 
		anchor_id = <anchor_id> 
		up_arrow_id = <up_arrow_id> 
		down_arrow_id = <down_arrow_id> 
		arrow_pos_up = scalingmenu_arrow_pos_up 
		arrow_pos_down = scalingmenu_arrow_pos_down 
		arrow_rgba = scalingmenu_arrow_rgba 
		up_arrow_texture = up_arrow 
		down_arrow_texture = down_arrow 
	} 
ENDSCRIPT

SCRIPT scalingmenu_resolve_head_bone_scale 
	GetCurrentSkaterProfileIndex 
	IF NOT GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = <part> 
		ResolveHeadBoneScale player = <currentSkaterProfileIndex> 
	ENDIF 
ENDSCRIPT

SCRIPT scalingmenu_add_options_to_menu 
	IF gotParam cas_part 
		scalingmenu_resolve_head_bone_scale part = <part> cas_part = <cas_part> 
	ENDIF 
	SetScreenElementProps { 
		id = current_menu 
		spacing_between = scalingmenu_spacing_between 
	} 
	IF gotParam affectX 
		scalingmenu_addslider { 
			text = #"X" 
			affectX = 1 
			id = scalingmenu_x_slider 
			part = <part> 
			min = <min> 
			max = <max> 
		} 
	ENDIF 
	IF gotParam affectZ 
		scalingmenu_addslider { 
			text = #"Y" 
			affectZ = 1 
			id = scalingmenu_z_slider 
			part = <part> 
			min = <min> 
			max = <max> 
		} 
	ENDIF 
	IF gotParam affectY 
		scalingmenu_addslider { 
			text = #"Z" 
			affectY = 1 
			id = scalingmenu_y_slider 
			part = <part> 
			min = <min> 
			max = <max> 
		} 
	ENDIF 
	IF gotParam affectXY 
		scalingmenu_addslider { 
			text = #"XZ" 
			affectX = 1 
			affectY = 1 
			id = scalingmenu_xyz_slider 
			part = <part> 
			min = <min> 
			max = <max> 
		} 
	ENDIF 
	IF gotParam affectXYZ 
		scalingmenu_addslider { 
			text = #"XYZ" 
			affectX = 1 
			affectY = 1 
			affectZ = 1 
			id = scalingmenu_xyz_slider 
			part = <part> 
			min = <min> 
			max = <max> 
		} 
	ENDIF 
	sliderbar_add_text_item { 
		text = "RESET TO DEFAULT" 
		pad_choose_script = scalingmenu_reset_to_default 
		pad_choose_params = { part = <part> cas_part = <cas_part> } 
	} 
	create_helper_text generic_helper_text_color_menu 
ENDSCRIPT

SCRIPT cas_reset_all_scaling 
	FireEvent type = unfocus target = current_menu 
	IF ScreenElementExists id = cas_category_menu 
		FireEvent type = unfocus target = cas_category_menu 
	ENDIF 
	create_dialog_box { 
		title = "Reset All?" 
		text = "Are you sure you want to reset all character scalings?" 
		no_bg 
		pad_back_script = cas_cancel_reset_all_scaling 
		buttons = [ 
			{ text = "No" pad_choose_script = cas_cancel_reset_all_scaling } 
			{ text = "Yes" pad_choose_script = cas_really_reset_all_scaling } 
		] 
	} 
ENDSCRIPT

SCRIPT cas_cancel_reset_all_scaling 
	dialog_box_exit 
	FireEvent type = focus target = current_menu 
	IF ScreenElementExists id = cas_category_menu 
		FireEvent type = focus target = cas_category_menu 
	ENDIF 
	SetScreenElementLock off id = edit_skater_menu 
	create_helper_text generic_helper_text_cas parent = edit_skater_menu 
ENDSCRIPT

SCRIPT cas_really_reset_all_scaling 
	cas_cancel_reset_all_scaling 
	process_cas_command cas_command = cas_reset_scale editable_list = master_scaling_list 
	GetCurrentSkaterProfileIndex 
	RefreshSkaterModel profile = <currentSkaterProfileIndex> skater = 0 no_board = no_board 
ENDSCRIPT

SCRIPT cas_reset_scale 
	GetCurrentSkaterProfileIndex 
	IF gotParam male_cas_part 
		GetSkaterSex player = <currentSkaterProfileIndex> 
		IF gotParam is_male 
			IF ( <is_male> ) 
				<cas_part> = <male_cas_part> 
			ELSE 
				<cas_part> = <female_cas_part> 
			ENDIF 
			scalingmenu_reset_to_default part = <part> cas_part = <cas_part> 
			RETURN 
		ENDIF 
	ENDIF 
	<x> = 100 
	<y> = 100 
	<z> = 100 
	GetCurrentSkaterProfileIndex 
	SetPlayerAppearanceScale player = <currentSkaterProfileIndex> part = <part> x = <x> y = <y> z = <z> use_default_scale = 1 
ENDSCRIPT


