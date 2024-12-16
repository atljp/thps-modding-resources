
skater_f_head = [ 
	{ 
		desc_id = skin_white 
		frontend_desc = #"White" 
		hidden 
		skintone = light 
		multicolor = 1 
		default_h = 30 
		default_s = 10 
		default_v = 58 
	} 
	{ 
		desc_id = skin_dark 
		frontend_desc = #"Dark" 
		hidden 
		skintone = light 
		multicolor = 1 
		default_h = 40 
		default_s = 25 
		default_v = 26 
	} 
	{ 
		desc_id = skin_tan 
		frontend_desc = #"Tan" 
		hidden 
		skintone = light 
		multicolor = 1 
		default_h = 35 
		default_s = 25 
		default_v = 54 
	} 
	{ 
		desc_id = %"Light Skin 1" 
		frontend_desc = #"Light Skin 1" 
		mesh = "models/skater_female/head_Female_01.skin" 
		mesh_if_facemapped = "models/skater_female/Facemap_female_01.skin" 
		SCRIPT disqualify_script 
			SetPart part = body desc_id = FemaleBody 
		ENDSCRIPT

		skintone = light 
		default_h = 30 
		default_s = 35 
		default_v = 58 
		hidden 
	} 
	{ 
		desc_id = %"Light Head 1" 
		frontend_desc = #"Head A" 
		mesh = "models/skater_female/head_Female_01.skin" 
		replace = "CS_NSN_F_wht_Head01" 
		with = "textures/skater_male/CS_MBF_F_Gry_Head01.png" 
		mesh_if_facemapped = "models/skater_female/Facemap_female_01.skin" 
		SCRIPT disqualify_script 
			SetPart part = body desc_id = FemaleBody 
		ENDSCRIPT

		skintone = light 
		eyecolor = 1 
		default_h = 15 
		default_s = 23 
		default_v = 56 
		nose_bone_group = { x = 110 y = 116 z = 100 use_default_scale = 0 } 
		Jaw_bone_group = { x = 98 y = 100 z = 100 use_default_scale = 0 } 
		headtop_bone_group = { x = 104 y = 108 z = 100 use_default_scale = 0 } 
	} 
	{ 
		desc_id = %"Light Head 2" 
		frontend_desc = #"Head B" 
		mesh = "models/skater_female/head_Female_01.skin" 
		replace = "CS_NSN_F_wht_Head01" 
		with = "textures/skater_male/CS_MBF_F_Gry_Head02.png" 
		mesh_if_facemapped = "models/skater_female/Facemap_female_01.skin" 
		SCRIPT disqualify_script 
			SetPart part = body desc_id = FemaleBody 
		ENDSCRIPT

		skintone = light 
		eyecolor = 2 
		default_h = 15 
		default_s = 20 
		default_v = 56 
	} 
	{ 
		desc_id = %"Light Head 3" 
		frontend_desc = #"Head C" 
		mesh = "models/skater_female/head_Female_01.skin" 
		replace = "CS_NSN_F_wht_Head01" 
		with = "textures/skater_male/CS_MBF_F_Gry_Head03.png" 
		mesh_if_facemapped = "models/skater_female/Facemap_female_01.skin" 
		SCRIPT disqualify_script 
			SetPart part = body desc_id = FemaleBody 
		ENDSCRIPT

		skintone = light 
		eyecolor = 1 
		default_h = 15 
		default_s = 23 
		default_v = 56 
	} 
	{ 
		desc_id = %"Light Head 4" 
		frontend_desc = #"Head D" 
		mesh = "models/skater_female/head_Female_01.skin" 
		replace = "CS_NSN_F_wht_Head01" 
		with = "textures/skater_male/CS_MBF_F_Gry_Head04.png" 
		mesh_if_facemapped = "models/skater_female/Facemap_female_01.skin" 
		SCRIPT disqualify_script 
			SetPart part = body desc_id = FemaleBody 
		ENDSCRIPT

		skintone = light 
		eyecolor = 4 
		default_h = 15 
		default_s = 23 
		default_v = 56 
	} 
	{ 
		desc_id = %"Light Head 5" 
		frontend_desc = #"Head E" 
		mesh = "models/skater_female/head_Female_01.skin" 
		replace = "CS_NSN_F_wht_Head01" 
		with = "textures/skater_male/CS_MBF_F_Gry_Head05.png" 
		mesh_if_facemapped = "models/skater_female/Facemap_female_01.skin" 
		SCRIPT disqualify_script 
			SetPart part = body desc_id = FemaleBody 
		ENDSCRIPT

		skintone = light 
		eyecolor = 2 
		default_h = 15 
		default_s = 23 
		default_v = 56 
		head_bone_group = { x = 108 y = 107 z = 107 use_defaultault_scale = 0 } 
		nose_bone_group = { x = 95 y = 116 z = 106 use_default_scale = 0 } 
		Jaw_bone_group = { x = 102 y = 100 z = 104 use_default_scale = 0 } 
	} 
	{ 
		desc_id = %"Dark Head 1" 
		frontend_desc = #"Head F" 
		mesh = "models/skater_female/head_Female_01.skin" 
		replace = "CS_NSN_F_wht_Head01" 
		with = "textures/skater_male/CS_MBF_F_Gry_Head06.png" 
		mesh_if_facemapped = "models/skater_female/Facemap_female_01.skin" 
		SCRIPT disqualify_script 
			SetPart part = body desc_id = FemaleBody 
		ENDSCRIPT

		skintone = light 
		eyecolor = 2 
		default_h = 15 
		default_s = 20 
		default_v = 30 
		{ nose_bone_group = { x = 122 y = 116 z = 89 use_default_scale = 0 } 
			Jaw_bone_group = { x = 95 y = 107 z = 97 use_default_scale = 0 } 
			headtop_bone_group = { x = 104 y = 108 z = 100 use_default_scale = 0 } 
			head_bone_group = { x = 99 y = 97 z = 105 use_default_scale = 0 } 
		} 
	} 
	{ 
		desc_id = %"Dark Head 2" 
		frontend_desc = #"Head G" 
		mesh = "models/skater_female/head_Female_01.skin" 
		replace = "CS_NSN_F_wht_Head01" 
		with = "textures/skater_male/CS_MBF_F_Gry_Head07.png" 
		mesh_if_facemapped = "models/skater_female/Facemap_female_01.skin" 
		SCRIPT disqualify_script 
			SetPart part = body desc_id = FemaleBody 
		ENDSCRIPT

		skintone = light 
		eyecolor = 2 
		default_h = 5 
		default_s = 26 
		default_v = 30 
		nose_bone_group = { x = 120 y = 106 z = 129 use_default_scale = 0 } 
		Jaw_bone_group = { x = 98 y = 100 z = 104 use_default_scale = 0 } 
		headtop_bone_group = { x = 104 y = 96 z = 96 use_default_scale = 0 } 
	} 
	{ 
		desc_id = %"Dark Head 3" 
		frontend_desc = #"Head H" 
		mesh = "models/skater_female/head_Female_01.skin" 
		replace = "CS_NSN_F_wht_Head01" 
		with = "textures/skater_male/CS_MBF_F_Gry_Head08.png" 
		mesh_if_facemapped = "models/skater_female/Facemap_female_01.skin" 
		SCRIPT disqualify_script 
			SetPart part = body desc_id = FemaleBody 
		ENDSCRIPT

		skintone = light 
		eyecolor = 2 
		default_h = 10 
		default_s = 20 
		default_v = 30 
		skater_f_hair = { desc_id = Medium2 h = 20 s = 15 v = 12 use_default_hsv = 0 } 
		nose_bone_group = { x = 88 y = 112 z = 116 use_default_ 
		scale = 0 } 
		head_bone_group = { x = 95 y = 100 z = 99 use_default_scale = 0 } 
		Jaw_bone_group = { x = 100 y = 105 z = 94 use_default_scale = 0 } 
		headtop_bone_group = { x = 100 y = 107 z = 100 use_default_scale = 0 } 
	} 
	{ 
		desc_id = %"Dark Head 4" 
		frontend_desc = #"Head I" 
		mesh = "models/skater_female/head_Female_01.skin" 
		replace = "CS_NSN_F_wht_Head01" 
		with = "textures/skater_male/CS_MBF_F_Gry_Head09.png" 
		mesh_if_facemapped = "models/skater_female/Facemap_female_01.skin" 
		SCRIPT disqualify_script 
			SetPart part = body desc_id = FemaleBody 
		ENDSCRIPT

		skintone = light 
		eyecolor = 2 
		default_h = 10 
		default_s = 25 
		default_v = 25 
	} 
	{ 
		desc_id = %"Dark Head 5" 
		frontend_desc = #"Head J" 
		mesh = "models/skater_female/head_Female_01.skin" 
		replace = "CS_NSN_F_wht_Head01" 
		with = "textures/skater_male/CS_MBF_F_Gry_Head10.png" 
		mesh_if_facemapped = "models/skater_female/Facemap_female_01.skin" 
		SCRIPT disqualify_script 
			SetPart part = body desc_id = FemaleBody 
		ENDSCRIPT

		skintone = light 
		eyecolor = 2 
		default_h = 10 
		default_s = 20 
		default_v = 30 
		head_bone_group = { x = 103 y = 101 z = 98 use_default_scale = 0 } 
		nose_bone_group = { x = 117 y = 102 z = 110 use_default_scale = 0 } 
		Jaw_bone_group = { x = 92 y = 99 z = 92 use_default_scale = 0 } 
		headtop_bone_group = { x = 97 y = 99 z = 87 use_default_scale = 0 } 
	} 
	{ 
		desc_id = %"Tan Head 1" 
		frontend_desc = #"Head K" 
		mesh = "models/skater_female/head_Female_01.skin" 
		replace = "CS_NSN_F_wht_Head01" 
		with = "textures/skater_male/CS_MBF_F_Gry_Head11.png" 
		mesh_if_facemapped = "models/skater_female/Facemap_female_01.skin" 
		SCRIPT disqualify_script 
			SetPart part = body desc_id = FemaleBody 
		ENDSCRIPT

		skintone = light 
		eyecolor = 2 
		default_h = 25 
		default_s = 29 
		default_v = 40 
		nose_bone_group = { x = 110 y = 116 z = 100 use_default_scale = 0 } 
		Jaw_bone_group = { x = 98 y = 100 z = 100 use_default_scale = 0 } 
		headtop_bone_group = { x = 104 y = 108 z = 100 use_default_scale = 0 } 
	} 
	{ 
		desc_id = %"Tan Head 2" 
		frontend_desc = #"Head L" 
		mesh = "models/skater_female/head_Female_01.skin" 
		replace = "CS_NSN_F_wht_Head01" 
		with = "textures/skater_male/CS_MBF_F_Gry_Head12.png" 
		mesh_if_facemapped = "models/skater_female/Facemap_female_01.skin" 
		SCRIPT disqualify_script 
			SetPart part = body desc_id = FemaleBody 
		ENDSCRIPT

		skintone = light 
		eyecolor = 2 
		default_h = 25 
		default_s = 29 
		default_v = 40 
	} 
	{ 
		desc_id = %"Tan Head 3" 
		frontend_desc = #"Head M" 
		mesh = "models/skater_female/head_Female_01.skin" 
		replace = "CS_NSN_F_wht_Head01" 
		with = "textures/skater_male/CS_MBF_F_Gry_Head13.png" 
		mesh_if_facemapped = "models/skater_female/Facemap_female_01.skin" 
		SCRIPT disqualify_script 
			SetPart part = body desc_id = FemaleBody 
		ENDSCRIPT

		skintone = light 
		eyecolor = 2 
		default_h = 25 
		default_s = 29 
		default_v = 40 
		head_bone_group = { x = 107 y = 104 z = 108 use_defaultault_scale = 0 } 
		nose_bone_group = { x = 100 y = 88 z = 131 use_default_scale = 0 } 
		headtop_bone_group = { x = 112 y = 119 z = 113 use_default_scale = 0 } 
	} 
	{ 
		desc_id = %"Tan Head 4" 
		frontend_desc = #"Head N" 
		mesh = "models/skater_female/head_Female_01.skin" 
		replace = "CS_NSN_F_wht_Head01" 
		with = "textures/skater_male/CS_MBF_F_Gry_Head14.png" 
		mesh_if_facemapped = "models/skater_female/Facemap_female_01.skin" 
		SCRIPT disqualify_script 
			SetPart part = body desc_id = FemaleBody 
		ENDSCRIPT

		skintone = light 
		eyecolor = 2 
		default_h = 25 
		default_s = 29 
		default_v = 40 
		head_bone_group = { x = 105 y = 100 z = 114 use_default_scale = 0 } 
		nose_bone_group = { x = 100 y = 107 z = 131 use_default_scale = 0 } 
		headtop_bone_group = { x = 112 y = 98 z = 113 use_default_scale = 0 } 
	} 
	{ 
		desc_id = %"Tan Head 5" 
		frontend_desc = #"Head O" 
		mesh = "models/skater_female/head_Female_01.skin" 
		replace = "CS_NSN_F_wht_Head01" 
		with = "textures/skater_male/CS_MBF_F_Gry_Head15.png" 
		mesh_if_facemapped = "models/skater_female/Facemap_female_01.skin" 
		SCRIPT disqualify_script 
			SetPart part = body desc_id = FemaleBody 
		ENDSCRIPT

		skintone = light 
		eyecolor = 2 
		default_h = 25 
		default_s = 29 
		default_v = 40 
		head_bone_group = { use_defaultault_scale = 0 x = 98 y = 104 z = 98 use_default_scale = 0 } 
		nose_bone_group = { x = 101 y = 109 z = 109 use_default_scale = 0 } 
		Jaw_bone_group = { x = 107 y = 108 z = 93 use_default_scale = 0 } 
		headtop_bone_group = { x = 115 y = 103 z = 107 use_default_scale = 0 } 
	} 
	{ 
		desc_id = %"Old Lady" 
		frontend_desc = #"Head P" 
		mesh = "models/skater_female/head_Female_01.skin" 
		replace = "CS_NSN_F_wht_Head01" 
		with = "textures/skater_male/CS_MBF_F_Gry_Head16.png" 
		mesh_if_facemapped = "models/skater_female/Facemap_female_01.skin" 
		SCRIPT disqualify_script 
			SetPart part = body desc_id = FemaleBody 
		ENDSCRIPT

		skintone = light 
		eyecolor = 1 
		default_h = 15 
		default_s = 26 
		default_v = 56 
		nose_bone_group = { x = 110 y = 116 z = 100 use_default_scale = 0 } 
		Jaw_bone_group = { x = 98 y = 100 z = 100 use_default_scale = 0 } 
		headtop_bone_group = { x = 104 y = 108 z = 100 use_default_scale = 0 } 
	} 
	{ 
		desc_id = Goth 
		frontend_desc = #"Head Q" 
		mesh = "models/skater_female/head_Female_01.skin" 
		replace = "CS_NSN_F_wht_Head01" 
		with = "textures/skater_male/CS_MBF_F_Gry_Head17.png" 
		mesh_if_facemapped = "models/skater_female/Facemap_female_01.skin" 
		SCRIPT disqualify_script 
			SetPart part = body desc_id = FemaleBody 
		ENDSCRIPT

		skintone = light 
		eyecolor = 2 
		default_h = 15 
		default_s = 14 
		default_v = 56 
	} 
	{ 
		desc_id = %"Cat Girl" 
		frontend_desc = #"Head R" 
		mesh = "models/skater_female/head_Female_01.skin" 
		replace = "CS_NSN_F_wht_Head01" 
		with = "textures/skater_male/CS_MBF_F_Gry_Head18.png" 
		mesh_if_facemapped = "models/skater_female/Facemap_female_01.skin" 
		SCRIPT disqualify_script 
			SetPart part = body desc_id = FemaleBody 
		ENDSCRIPT

		skintone = light 
		eyecolor = 7 
		default_h = 25 
		default_s = 17 
		default_v = 56 
	} 
	{ 
		desc_id = Zombie 
		frontend_desc = #"Zombie" 
		mesh = "models/skater_female/head_Female_01.skin" 
		replace = "CS_NSN_F_wht_Head01" 
		with = "textures/skater_male/CS_MBF_F_Gry_Head19.png" 
		mesh_if_facemapped = "models/skater_female/Facemap_female_01.skin" 
		SCRIPT disqualify_script 
			SetPart part = body desc_id = FemaleBody 
		ENDSCRIPT

		skintone = light 
		eyecolor = 3 
		default_h = 170 
		default_s = 26 
		default_v = 46 
		head_bone_group = { x = 108 y = 107 z = 107 use_defaultault_scale = 0 } 
		nose_bone_group = { x = 95 y = 116 z = 106 use_default_scale = 0 } 
		Jaw_bone_group = { x = 102 y = 100 z = 104 use_default_scale = 0 } 
	} 
	{ 
		desc_id = Skull 
		frontend_desc = #"Skull" 
		mesh = "models/skater_male/Head_Skull01.skin" 
		mesh_if_facemapped = "models/skater_female/Facemap_female_01.skin" 
		no_color 
		SCRIPT disqualify_script 
			ClearPart part = eyes 
		ENDSCRIPT

		lockout_parts = [ eyes ] 
		NoCutsceneHead 
		skintone = light 
		default_h = 30 
		default_s = 35 
		default_v = 58 
	} 
	{ 
		desc_id = eyes 
		frontend_desc = #"Eyes" 
		mesh = "models/skater_male/Skin_Extra_eyes.skin" 
		mesh_if_facemapped = "models/skater_female/Facemap_female_01.skin" 
		SCRIPT disqualify_script 
			ClearPart part = eyes 
			ClearPart part = skater_f_hair 
		ENDSCRIPT

		lockout_parts = [ eyes skater_f_hair ] 
		no_color 
		NoCutsceneHead 
		skintone = light 
		default_h = 30 
		default_s = 35 
		default_v = 58 
	} 
	{ 
		desc_id = PaperBag 
		frontend_desc = #"Paper Bag" 
		mesh = "models/skater_male/Hat_PaperBag.skin" 
		mesh_if_facemapped = "models/skater_female/Facemap_female_01.skin" 
		SCRIPT disqualify_script 
			ClearPart part = skater_f_hair 
			ClearPart part = skater_f_hat_hair 
			ClearPart part = glasses 
			ClearPart part = eyes 
			ClearPart part = head_tattoo 
			ClearPart part = hat 
		ENDSCRIPT

		lockout_parts = [ skater_f_hair skater_f_hat_hair glasses eyes head_tattoo hat ] 
		NoCutsceneHead 
		skintone = light 
		default_h = 30 
		default_s = 35 
		default_v = 58 
	} 
	{ 
		desc_id = Bigfoot 
		frontend_desc = #"Bigfoot" 
		mesh = "models/skater_male/Head_bigfoot.skin" 
		mesh_if_facemapped = "models/skater_female/Facemap_female_01.skin" 
		SCRIPT disqualify_script 
			ClearPart part = skater_f_hair 
			ClearPart part = skater_f_hat_hair 
			ClearPart part = glasses 
			ClearPart part = eyes 
			ClearPart part = head_tattoo 
			ClearPart part = hat 
		ENDSCRIPT

		NoCutsceneHead 
		skintone = light 
		lockout_parts = [ skater_f_hair skater_f_hat_hair glasses head_tattoo eyes hat ] 
		default_h = 30 
		default_s = 35 
		default_v = 58 
	} 
	{ 
		desc_id = head_pumpkin 
		frontend_desc = #"Pumpkin Head" 
		mesh = "models/CAS_ITEMS/head_pumpkin.skin" 
		SCRIPT disqualify_script 
			ClearPart part = skater_f_hair 
			ClearPart part = skater_f_hat_hair 
			ClearPart part = glasses 
			ClearPart part = eyes 
			ClearPart part = head_tattoo 
			ClearPart part = hat 
		ENDSCRIPT

		NoCutsceneHead 
		skintone = light 
		lockout_parts = [ skater_f_hair skater_f_hat_hair glasses head_tattoo eyes hat ] 
		default_h = 30 
		default_s = 35 
		default_v = 58 
	} 
	{ 
		desc_id = Head_Octodad 
		frontend_desc = #"Octodad" 
		mesh = "models/CAS_ITEMS/head_octodad.skin" 
		SCRIPT disqualify_script 
			ClearPart part = skater_f_hair 
			ClearPart part = skater_f_hat_hair 
			ClearPart part = glasses 
			ClearPart part = eyes 
			ClearPart part = head_tattoo 
			ClearPart part = hat 
		ENDSCRIPT

		NoCutsceneHead 
		lockout_parts = [ skater_f_hair skater_f_hat_hair glasses head_tattoo eyes hat ] 
		default_h = 30 
		default_s = 35 
		default_v = 58 
	} 
	{ 
		desc_id = None 
		frontend_desc = #"None" 
		hidden 
	} 
] 
skater_f_hat_hair = [ 
	{ 
		desc_id = None 
		frontend_desc = #"None" 
	} 
	{ 
		desc_id = Hair_MediumHAT1 
		frontend_desc = #"Hair Medium 1" 
		mesh = "models/skater_female/Hair_F_MediumHAT1.skin" 
		default_h = 355 
		default_s = 50 
		default_v = 42 
	} 
	{ 
		desc_id = Hair_MediumHAT2 
		frontend_desc = #"Hair Medium 2" 
		mesh = "models/skater_female/Hair_F_MediumHAT3.skin" 
		default_h = 80 
		default_s = 23 
		default_v = 24 
	} 
	{ 
		desc_id = Hair_LongHAT 
		frontend_desc = #"Hair Long" 
		mesh = "models/skater_female/Hair_F_LongHAT.skin" 
		default_h = 45 
		default_s = 57 
		default_v = 48 
	} 
	{ 
		desc_id = Hair_PonytailHAT 
		frontend_desc = #"Hair Ponytail" 
		mesh = "models/skater_female/Hair_F_PonytailHAT1.skin" 
		default_h = 45 
		default_s = 57 
		default_v = 48 
	} 
] 
skater_f_hair = [ 
	{ 
		desc_id = Medium 
		frontend_desc = #"Bangs" 
		mesh = "models/skater_female/Hair_F_Bangs.skin" 
		hair_type = mohawk 
		default_h = 20 
		default_s = 32 
		default_v = 38 
	} 
	{ 
		desc_id = Short 
		frontend_desc = #"Short" 
		mesh = "models/skater_female/hair_F_short.skin" 
		hair_type = mohawk 
		default_h = 45 
		default_s = 38 
		default_v = 32 
	} 
	{ 
		desc_id = Cropped 
		frontend_desc = #"Cropped" 
		mesh = "models/skater_female/hair_cropped.skin" 
		hair_type = mohawk 
		default_h = 295 
		default_s = 21 
		default_v = 48 
	} 
	{ 
		desc_id = Bushy 
		frontend_desc = #"Bushy" 
		mesh = "models/skater_female/hair_bushy.skin" 
		hair_type = mohawk 
		replace = "CS_NSN_F_Hairline.png" 
		with = "textures/skater_male/CS_NSN_F_Hairline01.png" 
		in = all 
		default_h = 290 
		default_s = 86 
		default_v = 56 
	} 
	{ 
		desc_id = %"Long 1" 
		frontend_desc = #"Long 1" 
		mesh = "models/skater_female/hair_F_Long2.skin" 
		hair_type = mohawk 
		default_h = 45 
		default_s = 38 
		default_v = 32 
	} 
	{ 
		desc_id = %"Long 2" 
		frontend_desc = #"Long 2" 
		mesh = "models/skater_male/Hair_M_W_Longhair_A.skin" 
		hair_type = mohawk 
		default_h = 20 
		default_s = 32 
		default_v = 38 
	} 
	{ 
		desc_id = %"Long 3" 
		frontend_desc = #"Long 3" 
		mesh = "models/skater_female/hair_F_Long4.skin" 
		hair_type = mohawk 
		default_h = 5 
		default_s = 21 
		default_v = 60 
	} 
	{ 
		desc_id = Dreadlocks 
		frontend_desc = #"Dreadlocks" 
		mesh = "models/skater_female/hair_M_Ponytail2.skin" 
		hair_type = mohawk 
		default_h = 45 
		default_s = 38 
		default_v = 32 
	} 
	{ 
		desc_id = Pigtails 
		frontend_desc = #"Pigtails" 
		mesh = "models/skater_female/hair_pigtails.skin" 
		hair_type = mohawk 
		default_h = 45 
		default_s = 41 
		default_v = 50 
	} 
	{ 
		desc_id = %"Ponytail 1" 
		frontend_desc = #"Ponytail 1" 
		mesh = "models/skater_female/hair_ponytail.skin" 
		hair_type = mohawk 
		default_h = 35 
		default_s = 38 
		default_v = 22 
	} 
	{ 
		desc_id = %"Ponytail 2" 
		frontend_desc = #"Ponytail 2" 
		mesh = "models/skater_female/hair_f_ponytail1.skin" 
		hair_type = mohawk 
		default_h = 55 
		default_s = 35 
		default_v = 60 
	} 
	{ 
		desc_id = mohawk 
		frontend_desc = #"Mohawk 1" 
		mesh = "models/skater_male/Hair_M_W_Mohawk.skin" 
		replace = "CS_JB_Hair_MohawkD1.png" 
		with = "textures/skater_male/CS_JB_Hair_MohawkL1" 
		hair_type = mohawk 
	} 
	{ 
		desc_id = %"Mohawk 2" 
		frontend_desc = #"Mohawk 2" 
		mesh = "models/skater_female/Hair_F_Mohawk2.skin" 
		hair_type = mohawk 
		default_h = 345 
		default_s = 65 
		default_v = 56 
	} 
	{ 
		desc_id = %"Mohawk 3" 
		frontend_desc = #"Mohawk 3" 
		mesh = "models/skater_female/Hair_F_Mohawk.skin" 
		hair_type = mohawk 
		default_h = 100 
		default_s = 50 
		default_v = 50 
	} 
	{ 
		desc_id = %"Liberty Spikes" 
		frontend_desc = #"Liberty Spikes" 
		mesh = "models/skater_male/Hair_M_LibertySpikes.skin" 
		hair_type = mohawk 
		default_h = 285 
		default_s = 80 
		default_v = 52 
	} 
	{ 
		desc_id = hair_zss 
		frontend_desc = #"Samus" 
		mesh = "models/cas_items/hair_zss.skin" 
		hair_type = mohawk 
		default_h = 45 
		default_s = 0 
		default_v = 35 
	} 
	{ 
		desc_id = Bald 
		frontend_desc = #"Bald" 
		no_color 
	} 
	{ 
		desc_id = Hair_MediumHAT 
		frontend_desc = #"Hair MediumHAT" 
		mesh = "models/skater_female/Hair_F_MediumHAT.skin" 
		hidden 
	} 
	{ 
		desc_id = Hair_PonytailHAT 
		frontend_desc = #"Hair_PonytailHAT" 
		mesh = "models/skater_male/Hair_M_PonytailHAT.skin" 
		hidden 
	} 
	{ 
		desc_id = Hair_LongHAT 
		frontend_desc = #"Hair_LongHAT" 
		mesh = "models/skater_female/Hair_F_LongHAT.skin" 
		hidden 
	} 
] 
f_longsleeve_lockouts = [ 
	chest_tattoo 
	back_tattoo 
	left_sleeve_tattoo 
	left_bicep_tattoo 
	left_forearm_tattoo 
	right_sleeve_tattoo 
	right_bicep_tattoo 
	right_forearm_tattoo 
] 
skater_f_torso = [ 
	{ 
		desc_id = None 
		frontend_desc = #"Sport Bra" 
	} 
	{ 
		desc_id = Sleeveless 
		frontend_desc = #"Sleeveless" 
		mesh = "models/skater_female/shirt_sleeveless.skin" 
		supports_logo 
		multicolor = 1 h = 100 s = 38 v = 30 use_default_hsv = 0 
	} 
	{ 
		desc_id = %"Baseball-T" 
		frontend_desc = #"Baseball-T" 
		mesh = "models/skater_female/Shirt_baseball-t.skin" 
		supports_logo 
		multicolor = 1 
		default_h = 25 
		default_s = 59 
		default_v = 50 
	} 
	{ 
		desc_id = %"T-shirt" 
		frontend_desc = #"T-Shirt" 
		mesh = "models/skater_female/shirt_tshirt.skin" 
		replace = "CS_NSN_F_TShirt01.png" 
		with = "textures/skater_male/CS_NSN_Tshirt0" 
		replace1 = "CS_NSN_F_TSleeve01.png" 
		with1 = "textures/skater_male/CS_NSN_TSleeve0" 
		supports_logo 
		multicolor = 1 
		SCRIPT disqualify_script 
			ClearPart part = chest_tattoo 
			ClearPart part = back_tattoo 
		ENDSCRIPT

		lockout_parts = [ chest_tattoo back_tattoo ] 
	} 
	{ 
		desc_id = %"Shirt line" 
		frontend_desc = #"Shirt Line" 
		mesh = "models/skater_female/shirt_tshirt.skin" 
		supports_logo 
		multicolor = 1 
		SCRIPT disqualify_script 
			ClearPart part = chest_tattoo 
			ClearPart part = back_tattoo 
		ENDSCRIPT

		lockout_parts = [ chest_tattoo back_tattoo ] 
	} 
	{ 
		desc_id = %"Camo T-shirt" 
		frontend_desc = #"Camo T-Shirt" 
		mesh = "models/skater_female/shirt_tshirt.skin" 
		replace = "CS_NSN_F_TShirt01.png" 
		with = "textures/skater_male/CS_NSN_shirt_camo01" 
		replace1 = "CS_NSN_F_TSleeve01.png" 
		with1 = "textures/skater_male/CS_NSN_shirtslv_camo_short01" 
		supports_logo 
		multicolor = 1 
		SCRIPT disqualify_script 
			ClearPart part = chest_tattoo 
			ClearPart part = back_tattoo 
		ENDSCRIPT

		lockout_parts = [ chest_tattoo back_tattoo ] 
	} 
	{ 
		desc_id = %"Tie-Dye" 
		frontend_desc = #"Tie-Dye" 
		mesh = "models/skater_female/shirt_tshirt.skin" 
		replace = "CS_NSN_F_TShirt01.png" 
		with = "textures/skater_male/CS_JB_shirt_tiedye" 
		replace1 = "CS_NSN_F_TSleeve01.png" 
		with1 = "textures/skater_male/CS_JB_sleeve_short_tiedye" 
		supports_logo 
		multicolor = 1 
		SCRIPT disqualify_script 
			ClearPart part = chest_tattoo 
			ClearPart part = back_tattoo 
		ENDSCRIPT

		lockout_parts = [ chest_tattoo back_tattoo ] 
	} 
	{ 
		desc_id = %"Button SS" 
		frontend_desc = #"Button SS" 
		mesh = "models/skater_female/shirt_collar.skin" 
		replace = "CS_NSN_Shirt_Colur01.png" 
		with = "textures/skater_male/CS_NSN_Shirt_button03" 
		replace1 = "CS_NSN_TSleeve01.png" 
		with1 = "textures/skater_male/CS_NSN_TSleeve0" 
		SCRIPT disqualify_script 
			ClearPart part = chest_tattoo 
			ClearPart part = back_tattoo 
		ENDSCRIPT

		lockout_parts = [ chest_tattoo back_tattoo ] 
	} 
	{ 
		desc_id = %"Button Open SS" 
		frontend_desc = #"Button Open SS" 
		mesh = "models/skater_female/shirt_button_open_ss.skin" 
		replace = "CS_NSN_F_Wht_Torso.png" 
		with = "textures/skater_male/CS_NSN_f_gry_torso" 
		in = all 
		SCRIPT disqualify_script 
			ClearPart part = back_tattoo 
			ClearPart part = skater_f_backpack 
		ENDSCRIPT

		lockout_parts = [ back_tattoo skater_f_backpack ] 
	} 
	{ 
		desc_id = Collar 
		frontend_desc = #"Collar" 
		mesh = "models/skater_female/shirt_collar.skin" 
		default_h = 345 
		default_s = 29 
		default_v = 56 
		SCRIPT disqualify_script 
			ClearPart part = chest_tattoo 
			ClearPart part = back_tattoo 
		ENDSCRIPT

		lockout_parts = [ chest_tattoo back_tattoo ] 
	} 
	{ 
		desc_id = Jersey 
		frontend_desc = #"Jersey" 
		mesh = "models/skater_female/shirt_jersey.skin" 
		supports_logo 
		multicolor = 1 
		shows_panties 
		SCRIPT disqualify_script 
			ClearPart part = chest_tattoo 
			ClearPart part = back_tattoo 
		ENDSCRIPT

		lockout_parts = [ chest_tattoo back_tattoo ] 
		default_h = 70 
		default_s = 50 
		default_v = 50 
	} 
	{ 
		desc_id = %"V-Neck" 
		frontend_desc = #"V-Neck" 
		mesh = "models/skater_female/shirt_SSVneck.skin" 
		replace = "CS_NSN_F_Wht_Torso.png" 
		with = "textures/skater_male/CS_NSN_f_gry_torso" 
		in = all 
		multicolor = 1 
	} 
	{ 
		desc_id = %"Tanktop short" 
		frontend_desc = #"Tanktop Short" 
		mesh = "models/skater_female/shirt_tanktop_2.skin" 
		replace = "CS_NSN_F_Wht_Torso.png" 
		with = "textures/skater_male/CS_NSN_f_gry_torso" 
		in = all 
		supports_logo 
	} 
	{ 
		desc_id = Tanktop 
		frontend_desc = #"Tanktop" 
		mesh = "models/skater_female/shirt_tanktop.skin" 
		replace = "CS_NSN_F_Wht_Torso.png" 
		with = "textures/skater_male/CS_NSN_f_gry_torso" 
		in = all 
		supports_logo 
	} 
	{ 
		desc_id = %"Tie-Dye Tank" 
		frontend_desc = #"Tie-Dye Tank" 
		mesh = "models/skater_female/shirt_tanktop.skin" 
		replace = "CS_NSN_Shirt_Under01.png" 
		with = "textures/skater_male/CS_NSN_f_tanktop_dye" 
		replace1 = "CS_NSN_F_Wht_Torso.png" 
		with1 = "textures/skater_male/CS_NSN_f_gry_torso" 
		in1 = all 
		supports_logo 
	} 
	{ 
		desc_id = %"Floral Tank" 
		frontend_desc = #"Floral Tank" 
		mesh = "models/skater_female/shirt_tanktop.skin" 
		replace = "CS_NSN_Shirt_Under01.png" 
		with = "textures/skater_male/CS_NSN_f_tanktop_floral" 
		replace1 = "CS_NSN_F_Wht_Torso.png" 
		with1 = "textures/skater_male/CS_NSN_f_gry_torso" 
		in1 = all 
		supports_logo 
	} 
	{ 
		desc_id = Shirt_Knotted 
		frontend_desc = #"Knotted" 
		mesh = "models/skater_female/Shirt_Knotted.skin" 
		replace = "CS_NSN_F_Wht_Torso.png" 
		with = "textures/skater_male/CS_NSN_f_gry_torso" 
		replace = "CS_NSN_F_Wht_Torso.png" 
		with = "textures/skater_male/CS_NSN_f_gry_torso" 
		in = all 
		default_h = 320 
		default_s = 0 
		default_v = 54 
	} 
	{ 
		desc_id = %"Halter Top" 
		frontend_desc = #"Halter Top" 
		mesh = "models/skater_female/Shirt_haltertop.skin" 
		replace = "CS_NSN_F_Wht_Torso.png" 
		with = "textures/skater_male/CS_NSN_f_gry_torso" 
		in = all 
	} 
	{ 
		desc_id = Longsleeve 
		frontend_desc = #"Longsleeve" 
		mesh = "models/skater_female/Shirt_Longsleeve.skin" 
		supports_logo 
		SCRIPT disqualify_script 
			cas_temp_disq_remove_longsleeve_parts 
		ENDSCRIPT

		lockout_parts = f_longsleeve_lockouts 
	} 
	{ 
		desc_id = %"T-shirt Long Sleeve" 
		frontend_desc = #"T-shirt LS" 
		mesh = "models/skater_female/shirt_T_longsleeve.skin" 
		supports_logo 
		SCRIPT disqualify_script 
			cas_temp_disq_remove_longsleeve_parts 
		ENDSCRIPT

		lockout_parts = f_longsleeve_lockouts 
		multicolor = 1 
		default_h = 220 
		default_s = 50 
		default_v = 52 
	} 
	{ 
		desc_id = %"Button LS" 
		frontend_desc = #"Button LS" 
		mesh = "models/skater_female/shirt_button_ls.skin" 
		SCRIPT disqualify_script 
			cas_temp_disq_remove_longsleeve_parts 
		ENDSCRIPT

		lockout_parts = f_longsleeve_lockouts 
		default_h = 100 
		default_s = 42 
		default_v = 44 
	} 
	{ 
		desc_id = %"Button Open LS" 
		frontend_desc = #"Button Open LS" 
		mesh = "models/skater_female/Shirt_button_open_ls.skin" 
		SCRIPT disqualify_script 
			ClearPart part = back_tattoo 
			ClearPart part = left_sleeve_tattoo 
			ClearPart part = left_bicep_tattoo 
			ClearPart part = left_forearm_tattoo 
			ClearPart part = right_sleeve_tattoo 
			ClearPart part = right_bicep_tattoo 
			ClearPart part = right_forearm_tattoo 
			ClearPart part = skater_f_backpack 
		ENDSCRIPT

		lockout_parts = [ back_tattoo skater_f_backpack 
			left_sleeve_tattoo l 
			left_bicep_tattoo 
			left_forearm_tattoo 
			right_sleeve_tattoo 
			right_bicep_tattoo 
			right_forearm_tattoo 
		] 
	} 
	{ 
		desc_id = %"Baggy Vest" 
		frontend_desc = #"Baggy Vest" 
		mesh = "models/skater_female/shirt_baggyvest.skin" 
		replace = "CS_NSN_F_Wht_Torso.png" 
		with = "textures/skater_male/CS_NSN_f_gry_torso" 
		in = all 
		shows_panties 
		SCRIPT disqualify_script 
			ClearPart part = left_bicep_tattoo 
			ClearPart part = skater_f_backpack 
		ENDSCRIPT

		lockout_parts = [ left_bicep_tattoo skater_f_backpack ] 
	} 
	{ 
		desc_id = %"Leather Vest" 
		frontend_desc = #"Leather Vest" 
		mesh = "models/skater_female/shirt_baggyvest.skin" 
		replace = "CS_NH_baggyvest.png" 
		with = "textures/skater_male/CS_NH_leathervest" 
		replace1 = "CS_NSN_F_Wht_Torso.png" 
		with1 = "textures/skater_male/CS_NSN_f_gry_torso" 
		in1 = all 
		shows_panties 
		SCRIPT disqualify_script 
			ClearPart part = left_bicep_tattoo 
			ClearPart part = skater_f_backpack 
		ENDSCRIPT

		lockout_parts = [ left_bicep_tattoo skater_f_backpack ] 
	} 
	{ 
		desc_id = %"Hoody Up" 
		frontend_desc = #"Hoody Up" 
		mesh = "models/skater_female/shirt_F_Hoodyup.skin" 
		supports_logo 
		no_back_logo 
		SCRIPT disqualify_script 
			ClearPart part = chest_tattoo 
			ClearPart part = back_tattoo 
			ClearPart part = left_sleeve_tattoo 
			ClearPart part = left_bicep_tattoo 
			ClearPart part = left_forearm_tattoo 
			ClearPart part = right_sleeve_tattoo 
			ClearPart part = right_bicep_tattoo 
			ClearPart part = right_forearm_tattoo 
			ClearPart part = hat 
			ClearPart part = skater_f_hat_hair 
			ClearPart part = skater_f_hair 
		ENDSCRIPT

		lockout_parts = [ 
			chest_tattoo 
			back_tattoo 
			left_sleeve_tattoo 
			left_bicep_tattoo 
			left_forearm_tattoo 
			right_sleeve_tattoo 
			right_bicep_tattoo 
			right_forearm_tattoo 
			hat 
			skater_f_hat_hair 
			skater_f_hair 
		] 
		default_h = 15 
		default_s = 5 
		default_v = 26 
	} 
	{ 
		desc_id = %"Hoody Down" 
		frontend_desc = #"Hoody Down" 
		mesh = "models/skater_female/shirt_F_Hoodydown.skin" 
		supports_logo 
		not_with_backpack 
		SCRIPT disqualify_script 
			ClearPart part = chest_tattoo 
			ClearPart part = back_tattoo 
			ClearPart part = left_sleeve_tattoo 
			ClearPart part = left_bicep_tattoo 
			ClearPart part = left_forearm_tattoo 
			ClearPart part = right_sleeve_tattoo 
			ClearPart part = right_bicep_tattoo 
			ClearPart part = right_forearm_tattoo 
			ClearPart part = skater_f_backpack 
		ENDSCRIPT

		lockout_parts = [ 
			chest_tattoo 
			back_tattoo 
			left_sleeve_tattoo 
			left_bicep_tattoo 
			left_forearm_tattoo 
			right_sleeve_tattoo 
			right_bicep_tattoo 
			right_forearm_tattoo 
			skater_f_backpack 
		] 
		default_h = 20 
		default_s = 20 
		default_v = 34 
	} 
	{ 
		desc_id = %"Russian coat" 
		frontend_desc = #"Russian coat" 
		mesh = "models/skater_male/shirt_jacket_bomber.skin" 
		SCRIPT disqualify_script 
			ClearPart part = chest_tattoo 
			ClearPart part = back_tattoo 
			ClearPart part = left_sleeve_tattoo 
			ClearPart part = left_bicep_tattoo 
			ClearPart part = left_forearm_tattoo 
			ClearPart part = right_sleeve_tattoo 
			ClearPart part = right_bicep_tattoo 
			ClearPart part = right_forearm_tattoo 
			ClearPart part = backpack 
			ClearPart part = skater_f_backpack 
		ENDSCRIPT

		lockout_parts = [ 
			chest_tattoo 
			back_tattoo 
			left_sleeve_tattoo 
			left_bicep_tattoo 
			left_forearm_tattoo 
			right_sleeve_tattoo 
			right_bicep_tattoo 
			right_forearm_tattoo 
			elbowpads 
			backpack 
			skater_f_backpack 
		] 
		multicolor = 1 
	} 
	{ 
		desc_id = %"Denim Jacket" 
		frontend_desc = #"Denim Jacket" 
		mesh = "models/skater_female/shirt_denimjacket.skin" 
		shows_panties 
		SCRIPT disqualify_script 
			ClearPart part = left_bicep_tattoo 
			ClearPart part = skater_f_backpack 
			ClearPart part = backpack 
		ENDSCRIPT

		lockout_parts = [ skater_f_backpack 
			elbowpads 
		] 
	} 
	{ 
		desc_id = %"Jacket 1" 
		frontend_desc = #"Jogger Jacket" 
		mesh = "models/skater_female/shirt_jogger.skin" 
		default_h = 325 
		default_s = 50 
		default_v = 50 
		SCRIPT disqualify_script 
			ClearPart part = chest_tattoo 
			ClearPart part = back_tattoo 
			ClearPart part = left_sleeve_tattoo 
			ClearPart part = left_bicep_tattoo 
			ClearPart part = left_forearm_tattoo 
			ClearPart part = right_sleeve_tattoo 
			ClearPart part = right_bicep_tattoo 
			ClearPart part = right_forearm_tattoo 
			ClearPart part = backpack 
		ENDSCRIPT

		lockout_parts = [ 
			chest_tattoo 
			back_tattoo 
			left_sleeve_tattoo 
			left_bicep_tattoo 
			left_forearm_tattoo 
			right_sleeve_tattoo 
			right_bicep_tattoo 
			right_forearm_tattoo 
			elbowpads 
			backpack 
		] 
	} 
	{ 
		desc_id = %"Tube Top" 
		frontend_desc = #"Tube Top" 
		mesh = "models/skater_female/shirt_tube.skin" 
		replace = "CS_NSN_F_Wht_Torso.png" 
		with = "textures/skater_male/CS_NSN_f_gry_torso" 
		in = all 
	} 
	{ 
		desc_id = %"Coconut Bra" 
		frontend_desc = #"Coconut Bra" 
		mesh = "models/skater_female/shirt_coconutbra.skin" 
		replace = "CS_NSN_F_Wht_Torso.png" 
		with = "textures/skater_male/CS_NSN_f_gry_torso" 
		in = all 
		SCRIPT disqualify_script 
			ClearPart part = skater_f_backpack 
		ENDSCRIPT

		lockout_parts = [ skater_f_backpack ] 
	} 
	{ 
		desc_id = %"Butterfinger T" 
		frontend_desc = #"Butterfinger T" 
		mesh = "models/skater_female/Shirt_baseball-t.skin" 
		replace2 = "CS_NSN_logo_none.png" 
		with2 = "textures/logos/Sht_Butterfinger02" 
		multicolor = 1 h = 5 s = 45 v = 52 use_default_hsv = 0 
		default_h = 320 
		default_s = 0 
		default_v = 54 
	} 
] 
skater_f_legs = [ 
	{ 
		desc_id = None 
		frontend_desc = #"None" 
		SCRIPT disqualify_script 
			cas_temp_disq_set_lower_legs 
		ENDSCRIPT

		force_lower_legs_full 
		only_with = [ jenna ] 
		no_color 
		hidden 
	} 
	{ 
		desc_id = Shorts 
		frontend_desc = #"Shorts" 
		mesh = "models/skater_female/pant_shorts.skin" 
		SCRIPT disqualify_script 
			cas_temp_disq_set_lower_legs 
		ENDSCRIPT

		force_lower_legs_calves 
		shows_panties 
	} 
	{ 
		desc_id = %"Shorts Denim" 
		frontend_desc = #"Shorts Denim" 
		mesh = "models/skater_female/pant_shorts.skin" 
		SCRIPT disqualify_script 
			cas_temp_disq_set_lower_legs 
		ENDSCRIPT

		force_lower_legs_calves 
		replace = "CAS_CRS_Shorts_Cargo.png" 
		with = "textures/skater_male/CAS_CRS_Shorts_Denim02" 
		shows_panties 
	} 
	{ 
		desc_id = %"Short Shorts Denim" 
		frontend_desc = #"Short Shorts Denim" 
		mesh = "models/skater_female/pant_shortshorts.skin" 
		SCRIPT disqualify_script 
			cas_temp_disq_set_lower_legs 
		ENDSCRIPT

		force_lower_legs_calves 
		shows_panties 
	} 
	{ 
		desc_id = %"Short Flowers" 
		frontend_desc = #"Short Flowers" 
		mesh = "models/skater_female/pant_shortshorts.skin" 
		SCRIPT disqualify_script 
			cas_temp_disq_set_lower_legs 
		ENDSCRIPT

		force_lower_legs_calves 
		replace = "CAS_CRS_Shorts_Denim.png" 
		with = "textures/skater_male/CAS_CRS_Shorts_Pattern" 
		shows_panties 
	} 
	{ 
		desc_id = %"Shorts Daisy" 
		frontend_desc = #"Shorts Daisy" 
		mesh = "models/skater_female/pant_daisy.skin" 
		SCRIPT disqualify_script 
			cas_temp_disq_set_lower_legs 
		ENDSCRIPT

		force_lower_legs_full 
	} 
	{ 
		desc_id = %"Shorts Cargo" 
		frontend_desc = #"Shorts Cargo" 
		mesh = "models/skater_female/pants_shortcargo.skin" 
		SCRIPT disqualify_script 
			cas_temp_disq_set_lower_legs 
		ENDSCRIPT

		lockout_parts = [ kneepads ] 
		force_lower_legs_calves 
	} 
	{ 
		desc_id = %"Mini Skirt" 
		frontend_desc = #"Mini Skirt" 
		mesh = "models/skater_female/pant_miniskirt.skin" 
		SCRIPT disqualify_script 
			cas_temp_disq_set_lower_legs 
		ENDSCRIPT

		force_lower_legs_full 
		default_h = 200 
		default_s = 53 
		default_v = 36 
	} 
	{ 
		desc_id = %"Ankle Pants" 
		frontend_desc = #"Ankle Pants" 
		mesh = "models/skater_female/pant_ankle.skin" 
		SCRIPT disqualify_script 
			cas_temp_disq_set_lower_legs 
		ENDSCRIPT

		force_lower_legs_calves 
		shows_panties 
	} 
	{ 
		desc_id = Regular 
		frontend_desc = #"Regular" 
		mesh = "models/skater_female/pant_regular.skin" 
		SCRIPT disqualify_script 
			cas_temp_disq_set_lower_legs 
			ClearPart part = socks 
			ClearPart part = left_leg_tattoo 
			ClearPart part = right_leg_tattoo 
		ENDSCRIPT

		lockout_parts = [ socks left_leg_tattoo right_leg_tattoo ] 
		force_lower_legs_none 
	} 
	{ 
		desc_id = Tight 
		frontend_desc = #"Tight" 
		mesh = "models/skater_female/pant_tight.skin" 
		SCRIPT disqualify_script 
			cas_temp_disq_set_lower_legs 
			ClearPart part = socks 
			ClearPart part = left_leg_tattoo 
			ClearPart part = right_leg_tattoo 
		ENDSCRIPT

		lockout_parts = [ socks left_leg_tattoo right_leg_tattoo ] 
		force_lower_legs_none 
	} 
	{ 
		desc_id = Leather 
		frontend_desc = #"Leather" 
		mesh = "models/skater_female/pant_leather.skin" 
		SCRIPT disqualify_script 
			cas_temp_disq_set_lower_legs 
			ClearPart part = socks 
			ClearPart part = left_leg_tattoo 
			ClearPart part = right_leg_tattoo 
		ENDSCRIPT

		lockout_parts = [ socks left_leg_tattoo right_leg_tattoo ] 
		default_h = 210 
		default_s = 0 
		default_v = 12 
		force_lower_legs_calves 
	} 
	{ 
		desc_id = Baggy 
		frontend_desc = #"Baggy" 
		mesh = "models/skater_female/pant_baggy.skin" 
		SCRIPT disqualify_script 
			cas_temp_disq_set_lower_legs 
			ClearPart part = socks 
			ClearPart part = left_leg_tattoo 
			ClearPart part = right_leg_tattoo 
		ENDSCRIPT

		lockout_parts = [ socks left_leg_tattoo right_leg_tattoo kneepads ] 
		force_lower_legs_none 
		default_h = 55 
		default_s = 35 
		default_v = 34 
	} 
	{ 
		desc_id = %"Snow Pants" 
		frontend_desc = #"Snow Pants" 
		mesh = "models/skater_female/Pants_Snow.skin" 
		SCRIPT disqualify_script 
			cas_temp_disq_set_lower_legs 
			ClearPart part = socks 
			ClearPart part = left_leg_tattoo 
			ClearPart part = right_leg_tattoo 
		ENDSCRIPT

		lockout_parts = [ socks left_leg_tattoo right_leg_tattoo kneepads ] 
		force_lower_legs_none 
	} 
	{ 
		desc_id = %"Baggy Cargo" 
		frontend_desc = #"Baggy Cargo" 
		mesh = "models/skater_female/pants_cargolong.skin" 
		SCRIPT disqualify_script 
			cas_temp_disq_set_lower_legs 
			ClearPart part = socks 
			ClearPart part = left_leg_tattoo 
			ClearPart part = right_leg_tattoo 
		ENDSCRIPT

		lockout_parts = [ socks left_leg_tattoo right_leg_tattoo kneepads ] 
		force_lower_legs_none 
		default_h = 45 
		default_s = 9 
		default_v = 36 
	} 
	{ 
		desc_id = %"Baggy CargoCamo" 
		frontend_desc = #"Baggy CargoCamo" 
		mesh = "models/skater_female/pants_cargolong.skin" 
		replace = "CS_NSN_pants_cargo.png" 
		with = "textures/skater_male/CS_NSN_pants_cargocamo" 
		SCRIPT disqualify_script 
			cas_temp_disq_set_lower_legs 
			ClearPart part = socks 
			ClearPart part = left_leg_tattoo 
			ClearPart part = right_leg_tattoo 
		ENDSCRIPT

		lockout_parts = [ socks left_leg_tattoo right_leg_tattoo kneepads ] 
		force_lower_legs_none 
	} 
	{ 
		desc_id = Bellbottoms 
		frontend_desc = #"Bellbottoms" 
		mesh = "models/skater_female/pant_bellbottoms.skin" 
		SCRIPT disqualify_script 
			cas_temp_disq_set_lower_legs 
			ClearPart part = socks 
			ClearPart part = left_leg_tattoo 
			ClearPart part = right_leg_tattoo 
		ENDSCRIPT

		lockout_parts = [ socks left_leg_tattoo right_leg_tattoo kneepads ] 
		force_lower_legs_none 
	} 
	{ 
		desc_id = Jogger 
		frontend_desc = #"Jogger" 
		mesh = "models/skater_male/pants_jogger.skin" 
		default_h = 330 
		default_s = 47 
		default_v = 26 
		SCRIPT disqualify_script 
			cas_temp_disq_set_lower_legs 
			ClearPart part = socks 
			ClearPart part = left_leg_tattoo 
			ClearPart part = right_leg_tattoo 
		ENDSCRIPT

		lockout_parts = [ socks left_leg_tattoo right_leg_tattoo ] 
		force_lower_legs_none 
	} 
] 
skater_f_lower_legs = [ 
	{ 
		desc_id = None 
		frontend_desc = #"None" 
		no_color 
	} 
	{ 
		desc_id = Calves 
		mesh = "models/skater_female/Skater_F_Legs.skin" 
	} 
	{ 
		desc_id = %"Full Legs" 
		mesh = "models/skater_female/Skater_F_PVLegs.skin" 
	} 
] 
skater_f_backpack = [ 
	{ 
		desc_id = None 
		frontend_desc = #"None" 
		no_color 
	} 
	{ 
		desc_id = Backpack1 
		frontend_desc = #"Backpack 1" 
		mesh = "models/skater_male/extra_backpack.skin" 
		is_backpack 
	} 
	{ 
		desc_id = %"Backpack 2" 
		frontend_desc = #"Backpack 2" 
		mesh = "models/skater_male/extra_backpack.skin" 
		replace = "CAS_TZ_Backpack02.png" 
		with = "textures/skater_male/CAS_TZ_Backpack02a.png" 
		is_backpack 
	} 
	{ 
		desc_id = %"Backpack 3" 
		frontend_desc = #"Backpack 3" 
		mesh = "models/skater_male/extra_backpack02.skin" 
		is_backpack 
	} 
	{ 
		desc_id = %"Backpack 4" 
		frontend_desc = #"Backpack 4" 
		mesh = "models/skater_male/extra_backpack02.skin" 
		replace = "CAS_TZ_Backpack03.png" 
		with = "textures/skater_male/CAS_TZ_Backpack03a.png" 
		is_backpack 
	} 
	{ 
		desc_id = %"Backpack 5" 
		frontend_desc = #"Backpack 5" 
		mesh = "models/skater_male/extra_backpack03.skin" 
		is_backpack 
	} 
	{ 
		desc_id = %"Backpack 6" 
		frontend_desc = #"Backpack 6" 
		mesh = "models/skater_male/extra_backpack03.skin" 
		replace = "CAS_TZ_Backpack01.png" 
		with = "textures/skater_male/CAS_TZ_Backpack01a.png" 
		is_backpack 
	} 
	{ 
		desc_id = %"Backpack Matix" 
		frontend_desc = #"Backpack Matix" 
		mesh = "models/skater_male/extra_backpack_matix.skin" 
		is_backpack 
	} 
	{ 
		desc_id = %"Backpack 7" 
		frontend_desc = #"Backpack Paint" 
		mesh = "models/skater_male/extra_backpack_Graffiti.skin" 
		is_backpack 
	} 
] 
skater_f_hands = [ 
	{ 
		desc_id = Hands 
		frontend_desc = #"Hands" 
		mesh = "models/skater_female/Skater_F_Hands.skin" 
	} 
	{ 
		desc_id = Gloves 
		frontend_desc = #"Gloves 1" 
		mesh = "models/skater_male/extra_gloves.skin" 
	} 
	{ 
		desc_id = %"Gloves 2" 
		frontend_desc = #"Gloves 2" 
		mesh = "models/skater_male/extra_gloves.skin" 
		replace = "Pro_JDB_Muska_Glove.png" 
		with = "textures/skater_male/CS_NSN_Glove01" 
		default_h = 50 
		default_s = 65 
		default_v = 52 
	} 
	{ 
		desc_id = %"Skeleton Hands" 
		frontend_desc = #"Skeleton Hands" 
		mesh = "models/skater_male/Extra_SkeletonHand.skin" 
	} 
] 

