
ped_editable_list = [ 
	{ part = ped_m_head use_pedpre } 
	{ part = ped_m_torso use_pedpre } 
	{ part = ped_m_legs use_pedpre } 
	{ part = ped_m_accessories use_pedpre } 
	{ part = ped_f_head use_pedpre } 
	{ part = ped_f_torso use_pedpre } 
	{ part = ped_f_legs use_pedpre } 
	{ part = ped_f_accessories use_pedpre } 
	{ part = ped_body use_pedpre } 
	{ part = board use_pedpre } 
] 
master_editable_list = [ 
	{ part = ped_m_head use_pedpre submenu = face_menu } 
	{ part = ped_m_torso use_pedpre submenu = shirt_style_menu } 
	{ part = ped_m_legs use_pedpre submenu = pants_menu } 
	{ part = ped_m_accessories use_pedpre } 
	{ part = ped_f_head use_pedpre submenu = face_menu } 
	{ part = ped_f_torso use_pedpre submenu = shirt_style_menu } 
	{ part = ped_f_legs use_pedpre submenu = pants_menu } 
	{ part = ped_f_accessories use_pedpre } 
	{ part = ped_body use_pedpre submenu = body_menu } 
	{ part = board use_pedpre submenu = deck_graphic_menu male = 1 female = 1 material = skateboard_wheels pass = 0 colormenu = wheel_color_menu } 
	{ part = body male = 0 female = 0 } 
	{ part = skater_m_head 
		materials = [ 
			{ cashead_head 0 } 
			{ cashead_head 1 } 
			{ cashead_head 2 } 
			{ cashead_neck 0 } 
		] 
	male = 1 female = 0 submenu = face_menu colormenu = skin_color_menu } 
	{ part = skater_m_torso 
		materials = [ 
			{ tshirt_shirt 0 } 
			{ tshirt_shirt 1 } 
			{ tshirt_shirt 2 } 
			{ tshirt_sleeve 0 } 
		] 
	male = 1 female = 0 submenu = shirt_style_menu colormenu = shirt_color_menu } 
	{ part = skater_m_legs male = 1 female = 0 submenu = pants_menu colormenu = pants_color_menu } 
	{ part = skater_m_lower_legs male = 1 female = 0 } 
	{ part = skater_m_hair male = 1 female = 0 submenu = hair_menu colormenu = hair_color_menu } 
	{ part = skater_m_hat_hair male = 1 female = 0 submenu = hat_hair_menu colormenu = hat_hair_color_menu } 
	{ part = skater_m_backpack male = 1 female = 0 submenu = backpack_menu colormenu = pack_color_menu } 
	{ part = skater_m_hands male = 1 female = 0 submenu = hands_menu colormenu = hands_color_menu } 
	{ part = skater_m_jaw material = cashead_head pass = 2 male = 1 female = 0 submenu = jaw_menu colormenu = facial_hair_color_menu } 
	{ part = skater_f_head male = 0 female = 1 submenu = face_menu colormenu = skin_color_menu } 
	{ part = skater_f_torso 
		materials = [ 
			{ tshirt_shirt 0 } 
			{ tshirt_shirt 1 } 
			{ tshirt_shirt 2 } 
			{ tshirt_sleeve 0 } 
		] 
	male = 0 female = 1 submenu = shirt_style_menu colormenu = shirt_color_menu } 
	{ part = skater_f_legs male = 0 female = 1 submenu = pants_menu colormenu = pants_color_menu } 
	{ part = skater_f_lower_legs male = 0 female = 1 } 
	{ part = skater_f_hair male = 0 female = 1 submenu = hair_menu colormenu = hair_color_menu } 
	{ part = skater_f_hat_hair male = 0 female = 1 submenu = hat_hair_menu colormenu = hat_hair_color_menu } 
	{ part = skater_f_backpack male = 0 female = 1 submenu = backpack_menu colormenu = pack_color_menu } 
	{ part = skater_f_hands male = 0 female = 1 submenu = hands_menu colormenu = hands_color_menu } 
	{ part = bare_torso male = 1 female = 0 } 
	{ part = sleeves material = tshirt_long pass = 0 male = 1 female = 1 colormenu = sleeve_color_menu } 
	{ part = kneepads male = 1 female = 1 submenu = kneepads_menu colormenu = kneepads_color_menu } 
	{ part = elbowpads male = 1 female = 1 submenu = elbowpads_menu colormenu = elbowpads_color_menu } 
	{ part = shoes 
		materials = [ 
			{ Shoes_shoe 0 } 
			{ Shoes_Laces 0 } 
		] 
	male = 1 female = 1 submenu = shoes_menu colormenu = shoe_color_menu } 
	{ part = shoe_laces material = Shoes_Laces pass = 0 male = 1 female = 1 colormenu = shoe_laces_color_menu } 
	{ part = socks male = 1 female = 1 submenu = socks_menu colormenu = socks_color_menu } 
	{ part = socks_lower male = 1 female = 1 } 
	{ part = front_logo male = 1 female = 1 submenu = front_logo_menu posmenu = front_logo_pos_menu } 
	{ part = back_logo male = 1 female = 1 submenu = back_logo_menu posmenu = back_logo_pos_menu } 
	{ part = glasses male = 1 female = 1 submenu = glasses_menu colormenu = glasses_color_menu } 
	{ part = hat male = 1 female = 1 submenu = hats_menu colormenu = hat_color_menu } 
	{ part = eyes male = 1 female = 1 submenu = eyes_menu } 
	{ part = accessory1 male = 1 female = 1 submenu = accessory1_menu colormenu = accessory1_color_menu accessory_lists = [ 2 , 3 ] } 
	{ part = accessory2 male = 1 female = 1 submenu = accessory2_menu colormenu = accessory2_color_menu accessory_lists = [ 1 , 3 ] } 
	{ part = accessory3 male = 1 female = 1 submenu = accessory3_menu colormenu = accessory3_color_menu accessory_lists = [ 1 , 2 ] } 
	{ part = hat_logo male = 1 female = 1 submenu = hat_logo_menu } 
	{ part = griptape male = 1 female = 1 submenu = grip_tape_style_menu } 
	{ part = deck_graphic male = 1 female = 1 submenu = deck_graphic_menu } 
	{ part = head_tattoo male = 1 female = 1 submenu = head_tattoo_menu posmenu = head_tattoo_pos_menu is_tattoo = 1 } 
	{ part = left_sleeve_tattoo male = 1 female = 1 submenu = left_sleeve_tattoo_menu is_tattoo = 1 } 
	{ part = left_bicep_tattoo male = 1 female = 1 submenu = left_bicep_tattoo_menu posmenu = left_bicep_tattoo_pos_menu is_tattoo = 1 } 
	{ part = left_forearm_tattoo male = 1 female = 1 submenu = left_forearm_tattoo_menu posmenu = left_forearm_tattoo_pos_menu is_tattoo = 1 } 
	{ part = right_sleeve_tattoo male = 1 female = 1 submenu = right_sleeve_tattoo_menu is_tattoo = 1 } 
	{ part = right_bicep_tattoo male = 1 female = 1 submenu = right_bicep_tattoo_menu posmenu = right_bicep_tattoo_pos_menu is_tattoo = 1 } 
	{ part = right_forearm_tattoo male = 1 female = 1 submenu = right_forearm_tattoo_menu posmenu = right_forearm_tattoo_pos_menu is_tattoo = 1 } 
	{ part = chest_tattoo male = 1 female = 1 submenu = chest_tattoo_menu posmenu = chest_tattoo_pos_menu is_tattoo = 1 } 
	{ part = back_tattoo male = 1 female = 1 submenu = back_tattoo_menu posmenu = back_tattoo_pos_menu is_tattoo = 1 } 
	{ part = left_leg_tattoo male = 1 female = 1 submenu = left_leg_tattoo_menu posmenu = left_leg_tattoo_pos_menu is_tattoo = 1 no_rot = 1 } 
	{ part = right_leg_tattoo male = 1 female = 1 submenu = right_leg_tattoo_menu posmenu = right_leg_tattoo_pos_menu is_tattoo = 1 no_rot = 1 } 
] 
master_scaling_list = [ 
	{ part = headtop_bone_group bone_scaling = 1 male_cas_part = skater_m_head female_cas_part = skater_f_head } 
	{ part = Jaw_bone_group bone_scaling = 1 male_cas_part = skater_m_head female_cas_part = skater_f_head } 
	{ part = nose_bone_group bone_scaling = 1 male_cas_part = skater_m_head female_cas_part = skater_f_head } 
	{ part = head_bone_group bone_scaling = 1 male_cas_part = skater_m_head female_cas_part = skater_f_head } 
	{ part = torso_bone_group bone_scaling = 1 } 
	{ part = stomach_bone_group bone_scaling = 1 } 
	{ part = upper_arm_bone_group bone_scaling = 1 } 
	{ part = lower_arm_bone_group bone_scaling = 1 } 
	{ part = hands_bone_group bone_scaling = 1 } 
	{ part = upper_leg_bone_group bone_scaling = 1 } 
	{ part = lower_leg_bone_group bone_scaling = 1 } 
	{ part = feet_bone_group bone_scaling = 1 } 
	{ part = board_bone_group bone_scaling = 1 } 
	{ part = object_scaling } 
] 
master_uv_list = [ 
	{ part = front_logo material = tshirt_shirt pass = 1 } 
	{ part = back_logo material = tshirt_shirt pass = 2 } 
	{ part = head_tattoo material = head_head pass = 1 } 
	{ part = chest_tattoo material = skater_torso pass = 1 } 
	{ part = back_tattoo material = skater_torso pass = 2 } 
	{ part = left_bicep_tattoo material = skater_ArmL pass = 1 } 
	{ part = right_bicep_tattoo material = skater_ArmR pass = 1 } 
	{ part = left_forearm_tattoo material = skater_ArmL pass = 2 } 
	{ part = right_forearm_tattoo material = skater_ArmR pass = 2 } 
	{ part = left_leg_tattoo material = skater_LegL pass = 1 } 
	{ part = right_leg_tattoo material = skater_LegR pass = 1 } 
] 
headtop_bone_group = [ 
	Bone_Head_Top_Scale 
] 
Jaw_bone_group = [ 
	Bone_Chin_Scale 
] 
nose_bone_group = [ 
	Bone_Nose_Scale 
] 
head_bone_group = [ 
	Bone_head 
] 
stomach_bone_group = [ 
	Bone_pelvis 
	Bone_Stomach_Upper 
	Bone_Stomach_Lower 
	Cloth_Shirt_C 
	Cloth_Shirt_L 
	Cloth_Shirt_R 
] 
torso_bone_group = [ 
	Bone_Collar_L 
	Bone_Collar_R 
	Bone_chest 
	Cloth_breast 
] 
upper_arm_bone_group = [ 
	Bone_bicep_L 
	Bone_bicep_R 
] 
lower_arm_bone_group = [ 
	Bone_forearm_L 
	Bone_wrist_L 
	Bone_forearm_R 
	Bone_wrist_R 
] 
hands_bone_group = [ 
	Bone_palm_L 
	Bone_thumb_L 
	Bone_forefinger_base_L 
	Bone_forefinger_tip_L 
	Bone_fingers_Base_L 
	Bone_fingers_tip_L 
	Bone_palm_R 
	Bone_thumb_R 
	Bone_forefinger_base_R 
	Bone_forefinger_tip_R 
	Bone_fingers_Base_R 
	Bone_fingers_tip_R 
] 
upper_leg_bone_group = [ 
	Bone_Thigh_L 
	Bone_Thigh_R 
] 
lower_leg_bone_group = [ 
	Bone_knee_L 
	Bone_knee_R 
] 
feet_bone_group = [ 
	Bone_ankle_L 
	Bone_toe_L 
	Bone_ankle_R 
	Bone_toe_R 
	Bone_Board_Root 
] 
board_bone_group = [ 
	Bone_Board_Root 
	Bone_Board_Nose 
	Bone_Trucks_Nose 
	Bone_Board_Tail 
	Bone_Trucks_Tail 
] 
SCRIPT cas_reset_tattoo 
	IF GotParam is_tattoo 
		IF ( <is_tattoo> = 1 ) 
			GetCurrentSkaterProfileIndex 
			EditPlayerAppearance { 
				profile = <currentSkaterProfileIndex> 
				target = ClearPart 
				targetParams = { part = <part> } 
			} 
		ENDIF 
	ENDIF 
ENDSCRIPT


