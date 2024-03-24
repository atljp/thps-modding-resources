
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
    {part = ped_m_head use_pedpre submenu = face_menu}
    {part = ped_m_torso use_pedpre submenu = shirt_style_menu}
    {part = ped_m_legs use_pedpre submenu = pants_menu}
    { part = ped_m_accessories use_pedpre }
    {part = ped_f_head use_pedpre submenu = face_menu}
    {part = ped_f_torso use_pedpre submenu = shirt_style_menu}
    {part = ped_f_legs use_pedpre submenu = pants_menu}
    { part = ped_f_accessories use_pedpre }
    {part = ped_body use_pedpre submenu = body_menu}
    {part = board use_pedpre submenu = deck_graphic_menu Male = 1 Female = 1 material = skateboard_wheels pass = 0 colormenu = wheel_color_menu}
    {part = Body Male = 0 Female = 0}
    {part = skater_m_head
        materials = [
            { cashead_head 0 }
            { cashead_head 1 }
            { cashead_head 2 }
            { cashead_neck 0 }
        ]
        Male = 1 Female = 0 submenu = face_menu colormenu = skin_color_menu}
    {part = skater_m_torso
        materials = [
            { tshirt_shirt 0 }
            { tshirt_shirt 1 }
            { tshirt_shirt 2 }
            { tshirt_sleeve 0 }
        ]
        Male = 1 Female = 0 submenu = shirt_style_menu colormenu = shirt_color_menu}
    {part = skater_m_legs Male = 1 Female = 0 submenu = pants_menu colormenu = pants_color_menu}
    {part = skater_m_lower_legs Male = 1 Female = 0}
    {part = skater_m_hair Male = 1 Female = 0 submenu = hair_menu colormenu = hair_color_menu}
    {part = skater_m_hat_hair Male = 1 Female = 0 submenu = hat_hair_menu colormenu = hat_hair_color_menu}
    {part = skater_m_backpack Male = 1 Female = 0 submenu = backpack_menu colormenu = pack_color_menu}
    {part = skater_m_hands Male = 1 Female = 0 submenu = hands_menu colormenu = hands_color_menu}
    {part = skater_m_jaw material = cashead_head pass = 2 Male = 1 Female = 0 submenu = jaw_menu colormenu = facial_hair_color_menu}
    {part = skater_f_head Male = 0 Female = 1 submenu = face_menu colormenu = skin_color_menu}
    {part = skater_f_torso
        materials = [
            { tshirt_shirt 0 }
            { tshirt_shirt 1 }
            { tshirt_shirt 2 }
            { tshirt_sleeve 0 }
        ]
        Male = 0 Female = 1 submenu = shirt_style_menu colormenu = shirt_color_menu}
    {part = skater_f_legs Male = 0 Female = 1 submenu = pants_menu colormenu = pants_color_menu}
    {part = skater_f_lower_legs Male = 0 Female = 1}
    {part = skater_f_hair Male = 0 Female = 1 submenu = hair_menu colormenu = hair_color_menu}
    {part = skater_f_hat_hair Male = 0 Female = 1 submenu = hat_hair_menu colormenu = hat_hair_color_menu}
    {part = skater_f_backpack Male = 0 Female = 1 submenu = backpack_menu colormenu = pack_color_menu}
    {part = skater_f_hands Male = 0 Female = 1 submenu = hands_menu colormenu = hands_color_menu}
    {part = bare_torso Male = 1 Female = 0}
    {part = sleeves material = tshirt_long pass = 0 Male = 1 Female = 1 colormenu = sleeve_color_menu}
    {part = kneepads Male = 1 Female = 1 submenu = kneepads_menu colormenu = kneepads_color_menu}
    {part = elbowpads Male = 1 Female = 1 submenu = elbowpads_menu colormenu = elbowpads_color_menu}
    {part = shoes
        materials = [
            { Shoes_shoe 0 }
            { Shoes_Laces 0 }
        ]
        Male = 1 Female = 1 submenu = shoes_menu colormenu = shoe_color_menu}
    {part = shoe_laces material = Shoes_Laces pass = 0 Male = 1 Female = 1 colormenu = shoe_laces_color_menu}
    {part = socks Male = 1 Female = 1 submenu = socks_menu colormenu = socks_color_menu}
    {part = socks_lower Male = 1 Female = 1}
    {part = front_logo Male = 1 Female = 1 submenu = front_logo_menu posmenu = front_logo_pos_menu}
    {part = back_logo Male = 1 Female = 1 submenu = back_logo_menu posmenu = back_logo_pos_menu}
    {part = glasses Male = 1 Female = 1 submenu = glasses_menu colormenu = glasses_color_menu}
    {part = Hat Male = 1 Female = 1 submenu = hats_menu colormenu = hat_color_menu}
    {part = Eyes Male = 1 Female = 1 submenu = eyes_menu}
    {part = accessory1 Male = 1 Female = 1 submenu = accessory1_menu colormenu = accessory1_color_menu accessory_lists = [ 2 , 3 ]}
    {part = accessory2 Male = 1 Female = 1 submenu = accessory2_menu colormenu = accessory2_color_menu accessory_lists = [ 1 , 3 ]}
    {part = accessory3 Male = 1 Female = 1 submenu = accessory3_menu colormenu = accessory3_color_menu accessory_lists = [ 1 , 2 ]}
    {part = hat_logo Male = 1 Female = 1 submenu = hat_logo_menu}
    {part = griptape Male = 1 Female = 1 submenu = grip_tape_style_menu}
    {part = deck_graphic Male = 1 Female = 1 submenu = deck_graphic_menu}
    {part = head_tattoo Male = 1 Female = 1 submenu = head_tattoo_menu posmenu = head_tattoo_pos_menu is_tattoo = 1}
    {part = left_sleeve_tattoo Male = 1 Female = 1 submenu = left_sleeve_tattoo_menu is_tattoo = 1}
    {part = left_bicep_tattoo Male = 1 Female = 1 submenu = left_bicep_tattoo_menu posmenu = left_bicep_tattoo_pos_menu is_tattoo = 1}
    {part = left_forearm_tattoo Male = 1 Female = 1 submenu = left_forearm_tattoo_menu posmenu = left_forearm_tattoo_pos_menu is_tattoo = 1}
    {part = right_sleeve_tattoo Male = 1 Female = 1 submenu = right_sleeve_tattoo_menu is_tattoo = 1}
    {part = right_bicep_tattoo Male = 1 Female = 1 submenu = right_bicep_tattoo_menu posmenu = right_bicep_tattoo_pos_menu is_tattoo = 1}
    {part = right_forearm_tattoo Male = 1 Female = 1 submenu = right_forearm_tattoo_menu posmenu = right_forearm_tattoo_pos_menu is_tattoo = 1}
    {part = chest_tattoo Male = 1 Female = 1 submenu = chest_tattoo_menu posmenu = chest_tattoo_pos_menu is_tattoo = 1}
    {part = back_tattoo Male = 1 Female = 1 submenu = back_tattoo_menu posmenu = back_tattoo_pos_menu is_tattoo = 1}
    {part = left_leg_tattoo Male = 1 Female = 1 submenu = left_leg_tattoo_menu posmenu = left_leg_tattoo_pos_menu is_tattoo = 1 no_rot = 1}
    {part = right_leg_tattoo Male = 1 Female = 1 submenu = right_leg_tattoo_menu posmenu = right_leg_tattoo_pos_menu is_tattoo = 1 no_rot = 1}
]
master_scaling_list = [
    {part = headtop_bone_group bone_scaling = 1 male_cas_part = skater_m_head female_cas_part = skater_f_head}
    {part = jaw_bone_group bone_scaling = 1 male_cas_part = skater_m_head female_cas_part = skater_f_head}
    {part = nose_bone_group bone_scaling = 1 male_cas_part = skater_m_head female_cas_part = skater_f_head}
    {part = head_bone_group bone_scaling = 1 male_cas_part = skater_m_head female_cas_part = skater_f_head}
    {part = torso_bone_group bone_scaling = 1}
    {part = stomach_bone_group bone_scaling = 1}
    {part = upper_arm_bone_group bone_scaling = 1}
    {part = lower_arm_bone_group bone_scaling = 1}
    {part = hands_bone_group bone_scaling = 1}
    {part = upper_leg_bone_group bone_scaling = 1}
    {part = lower_leg_bone_group bone_scaling = 1}
    {part = feet_bone_group bone_scaling = 1}
    {part = board_bone_group bone_scaling = 1}
    { part = object_scaling }
]
master_uv_list = [
    {part = front_logo material = tshirt_shirt pass = 1}
    {part = back_logo material = tshirt_shirt pass = 2}
    {part = head_tattoo material = head_head pass = 1}
    {part = chest_tattoo material = skater_torso pass = 1}
    {part = back_tattoo material = skater_torso pass = 2}
    {part = left_bicep_tattoo material = skater_ArmL pass = 1}
    {part = right_bicep_tattoo material = skater_ArmR pass = 1}
    {part = left_forearm_tattoo material = skater_ArmL pass = 2}
    {part = right_forearm_tattoo material = skater_ArmR pass = 2}
    {part = left_leg_tattoo material = skater_LegL pass = 1}
    {part = right_leg_tattoo material = skater_LegR pass = 1}
]
headtop_bone_group = [ 
Bone_Head_Top_Scale
 ]
jaw_bone_group = [ 
Bone_Chin_Scale
 ]
nose_bone_group = [ 
Bone_Nose_Scale
 ]
head_bone_group = [ 
Bone_Head
 ]
stomach_bone_group = [
    Bone_Pelvis
    Bone_Stomach_Upper
    Bone_Stomach_Lower
    Cloth_Shirt_C
    Cloth_Shirt_L
    Cloth_Shirt_R
]
torso_bone_group = [
    Bone_Collar_L
    Bone_Collar_R
    Bone_Chest
    Cloth_Breast
]
upper_arm_bone_group = [
    Bone_Bicep_L
    Bone_Bicep_R
]
lower_arm_bone_group = [
    Bone_Forearm_L
    Bone_Wrist_L
    Bone_Forearm_R
    Bone_Wrist_R
]
hands_bone_group = [
    Bone_Palm_L
    Bone_Thumb_L
    Bone_Forefinger_Base_L
    Bone_Forefinger_Tip_L
    Bone_Fingers_Base_L
    Bone_Fingers_Tip_L
    Bone_Palm_R
    Bone_Thumb_R
    Bone_Forefinger_Base_R
    Bone_Forefinger_Tip_R
    Bone_Fingers_Base_R
    Bone_Fingers_Tip_R
]
upper_leg_bone_group = [
    Bone_Thigh_L
    Bone_Thigh_R
]
lower_leg_bone_group = [
    Bone_Knee_L
    Bone_Knee_R
]
feet_bone_group = [
    Bone_Ankle_L
    Bone_Toe_L
    Bone_Ankle_R
    Bone_Toe_R
    Bone_Board_Root
]
board_bone_group = [
    Bone_Board_Root
    Bone_Board_Nose
    Bone_Trucks_Nose
    Bone_Board_Tail
    Bone_Trucks_Tail
]

script cas_reset_tattoo 
    if GotParam is_tattoo
        if (<is_tattoo> = 1)
            GetCurrentSkaterProfileIndex
            EditPlayerAppearance {
                profile = <currentSkaterProfileIndex>
                target = clearpart
                targetParams = { part = <part> }
            }
        endif
    endif
endscript

