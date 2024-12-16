
sp_str_unassigned = #"Unassigned" 
appearance_init_structure = { 
	sleeves = { desc_id = None } 
	shoe_laces = { desc_id = None } 
	skater_m_lower_legs = { desc_id = None } 
	skater_f_lower_legs = { desc_id = None } 
	bare_torso = { desc_id = None } 
} 
SCRIPT init_pro_skaters 
	ForEachIn master_skater_list do = AddSkaterProfile 
	AddTemporaryProfile name = au_5_temp_profile 
	AddTemporaryProfile name = fake_nigel_temp_profile 
	AddTemporaryProfile name = fake_nigel_temp_profile_save 
ENDSCRIPT

SCRIPT set_default_temporary_profiles 
ENDSCRIPT

SCRIPT get_skater_index_from_name 
	GetArraySize master_skater_list 
	<index> = 0 
	BEGIN 
		IF ( <name> = ( ( master_skater_list [ <index> ] ) . name ) ) 
			RETURN skater_index = <index> 
		ENDIF 
		<index> = ( <index> + 1 ) 
	REPEAT <array_size> 
	script_assert "Couldn\'t find profile with name %n in master_skater_list" n = <name> 
ENDSCRIPT

SCRIPT get_num_visible_profiles 
	GetArraySize master_skater_list 
	<count> = 0 
	<index> = 0 
	BEGIN 
		IF NOT StructureContains structure = ( master_skater_list [ <index> ] ) not_in_frontend 
			<count> = ( <count> + 1 ) 
		ENDIF 
		<index> = ( <index> + 1 ) 
	REPEAT <array_size> 
	RETURN num_visible_profiles = <count> 
ENDSCRIPT

master_skater_list = [ 
	{ 
		display_name = "Custom Skater" 
		select_icon = ss_custom 
		first_name = "Custom" 
		file_name = "Unimplemented" 
		default_appearance = appearance_custom_skater_male 
		name = custom 
		stance = regular 
		pushstyle = never_mongo 
		trickstyle = street 
		has_custom_tag = 0 
		tag_texture = "tags\\cas_01" 
		sticker_texture = "CAGR/Corporate/corp_1" 
		skater_family = family_custom 
		is_pro = 0 
		is_male = 1 
		is_head_locked = 0 
		is_locked = 0 
		age = 16 
		hometown = "Los Angeles, CA" 
		points_available = 0 
		air = 3 
		run = 3 
		ollie = 3 
		speed = 3 
		spin = 3 
		switch = 3 
		flip_speed = 3 
		rail_balance = 3 
		lip_balance = 3 
		manual_balance = 3 
		sponsors = [ ] 
		trick_mapping = { } 
		default_trick_mapping = CustomTricks 
		max_specials = 4 
		specials = { 
			[ 
				{ trickslot = SpAir_R_D_Circle trickname = Trick_McTwist } 
				{ trickslot = SpAir_U_R_Square trickname = Trick_KickFlipUnderFlip } 
				{ trickslot = SpGrind_R_D_Triangle trickname = Trick_tailblockslide } 
				{ trickslot = SpMan_D_U_Triangle trickname = Trick_OneFootOneWheel } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
			] 
		} 
		voice = male1 
	} 
	{ 
		display_name = "Tony Hawk" 
		select_icon = ss_hawk 
		first_name = "Tony" 
		last_name = "Hawk" 
		default_appearance = appearance_hawk 
		name = hawk 
		teammate_pro_appearance_name = pedpro_hawk_skateboard 
		stance = goofy 
		pushstyle = never_mongo 
		tag_texture = "tags\\tony_01" 
		skater_family = family_pro 
		is_pro = 1 
		is_head_locked = 1 
		is_locked = 1 
		is_male = 1 
		points_available = 0 
		air = 11 
		run = 6 
		ollie = 7 
		speed = 10 
		spin = 11 
		switch = 8 
		flip_speed = 7 
		rail_balance = 9 
		lip_balance = 9 
		manual_balance = 7 
		sponsors = [ birdhouse hawkshoes quiksilver hawkapp tony ] 
		trick_mapping = { } 
		default_trick_mapping = HawkTricks 
		max_specials = 4 
		specials = { 
			[ 
				{ trickslot = SpAir_R_L_Circle trickname = Trick_360VarialMcTwist } 
				{ trickslot = SpAir_R_D_Circle trickname = Trick_Indy900 } 
				{ trickslot = SpAir_L_D_Circle trickname = Trick_EndlessHandflip } 
				{ trickslot = SpMan_U_D_Triangle trickname = Trick_TonySurfer } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
			] 
		} 
		lockout_flags = [ 
			is_hawk 
		] 
	} 
	{ 
		display_name = "Bob Burnquist" 
		select_icon = ss_burnquist 
		first_name = "Bob" 
		last_name = "Burnquist" 
		default_appearance = appearance_burnquist 
		name = burnquist 
		teammate_pro_appearance_name = pedpro_burnquist 
		stance = regular 
		pushstyle = never_mongo 
		tag_texture = "tags\\bob_01" 
		skater_family = family_pro 
		is_pro = 1 
		is_head_locked = 1 
		is_locked = 1 
		is_male = 1 
		points_available = 0 
		air = 8 
		run = 7 
		ollie = 7 
		speed = 10 
		spin = 9 
		switch = 11 
		flip_speed = 8 
		rail_balance = 9 
		lip_balance = 9 
		manual_balance = 7 
		sponsors = [ firm hurley burnquist organics oakley ogio ] 
		trick_mapping = { } 
		default_trick_mapping = BurnquistTricks 
		max_specials = 4 
		specials = { 
			[ 
				{ trickslot = SpAir_U_D_Circle trickname = Trick_Shifty360ShovitBSShifty } 
				{ trickslot = SpAir_L_R_Circle trickname = Trick_SambaFlip } 
				{ trickslot = SpAir_L_D_Circle trickname = Trick_DarksideJapan } 
				{ trickslot = SpGrind_L_R_Triangle trickname = Trick_RockNRollSwitch } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
			] 
		} 
		lockout_flags = [ 
			is_burnquist 
		] 
	} 
	{ 
		display_name = "Eric Koston" 
		select_icon = ss_koston 
		first_name = "Eric" 
		last_name = "Koston" 
		default_appearance = appearance_koston 
		name = koston 
		teammate_pro_appearance_name = pedpro_koston 
		stance = goofy 
		pushstyle = mongo_when_switch 
		tag_texture = "tags\\kos_01" 
		skater_family = family_pro 
		is_pro = 1 
		is_head_locked = 1 
		is_locked = 1 
		is_male = 1 
		points_available = 0 
		air = 7 
		run = 8 
		ollie = 9 
		speed = 8 
		spin = 7 
		switch = 11 
		flip_speed = 8 
		rail_balance = 11 
		lip_balance = 6 
		manual_balance = 10 
		sponsors = [ girl es fourstar eric ] 
		trick_mapping = { } 
		default_trick_mapping = KostonTricks 
		max_specials = 4 
		specials = { 
			[ 
				{ trickslot = SpGrind_U_R_Triangle trickname = Trick_Fandangle } 
				{ trickslot = SpMan_R_L_Triangle trickname = Trick_YeahRight } 
				{ trickslot = SpAir_L_R_Circle trickname = Trick_EndlessKickflip } 
				{ trickslot = SpAir_R_U_Circle trickname = Trick_Koston900 } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
			] 
		} 
	} 
	{ 
		display_name = "Bam Margera" 
		select_icon = ss_margera 
		first_name = "Bam" 
		last_name = "Margera" 
		default_appearance = appearance_margera 
		name = margera 
		teammate_pro_appearance_name = pedpro_margera 
		stance = goofy 
		pushstyle = never_mongo 
		tag_texture = "tags\\bam_01" 
		skater_family = family_pro 
		is_pro = 1 
		is_head_locked = 1 
		is_locked = 1 
		is_male = 1 
		points_available = 0 
		air = 8 
		run = 10 
		ollie = 8 
		speed = 8 
		spin = 8 
		switch = 9 
		flip_speed = 8 
		rail_balance = 9 
		lip_balance = 9 
		manual_balance = 8 
		sponsors = [ element adio cky bam ] 
		trick_mapping = { } 
		default_trick_mapping = MargeraTricks 
		max_specials = 4 
		specials = { 
			[ 
				{ trickslot = SpAir_U_R_circle trickname = Trick_BamBendAir } 
				{ trickslot = Splip_D_U_Triangle trickname = Trick_BamLip } 
				{ trickslot = SpGrind_L_R_Triangle trickname = Trick_GrindNBarf } 
				{ trickslot = SpGrind_D_R_Triangle trickname = Trick_Bam_Chainsaw } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
			] 
		} 
		lockout_flags = [ 
			is_margera 
		] 
		no_edit_groups = [ 
			head_options 
		] 
	} 
	{ 
		display_name = "Rodney Mullen" 
		select_icon = ss_mullen 
		first_name = "Rodney" 
		last_name = "Mullen" 
		default_appearance = appearance_mullen 
		name = mullen 
		teammate_pro_appearance_name = pedpro_mullen 
		stance = regular 
		pushstyle = never_mongo 
		tag_texture = "tags\\rod_01" 
		skater_family = family_pro 
		is_pro = 1 
		is_head_locked = 1 
		is_locked = 1 
		is_male = 1 
		points_available = 0 
		air = 7 
		run = 7 
		ollie = 8 
		speed = 6 
		spin = 9 
		switch = 10 
		flip_speed = 10 
		rail_balance = 10 
		lip_balance = 7 
		manual_balance = 11 
		sponsors = [ enjoi globe tensor rodney ] 
		trick_mapping = { } 
		default_trick_mapping = MullenTricks 
		max_specials = 4 
		specials = { 
			[ 
				{ trickslot = SpGrind_R_L_Triangle trickname = Trick_50Fingerflip } 
				{ trickslot = SpGrind_R_D_Triangle trickname = Trick_RodneyGrind } 
				{ trickslot = SpAir_U_D_Square trickname = Trick_HalfCabUnderFlip } 
				{ trickslot = SpMan_L_R_Triangle trickname = Trick_PrimoSpin } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
			] 
		} 
		lockout_flags = [ 
			is_mullen 
		] 
		no_edit_groups = [ 
			head_options 
		] 
	} 
	{ 
		display_name = "Chad Muska" 
		select_icon = ss_muska 
		first_name = "Chad" 
		last_name = "Muska" 
		default_appearance = appearance_muska 
		name = muska 
		teammate_pro_appearance_name = pedpro_muska 
		stance = regular 
		pushstyle = never_mongo 
		tag_texture = "tags\\mus_01" 
		skater_family = family_pro 
		is_pro = 1 
		is_head_locked = 1 
		is_locked = 1 
		is_male = 1 
		points_available = 0 
		air = 7 
		run = 8 
		ollie = 11 
		speed = 8 
		spin = 8 
		switch = 8 
		flip_speed = 9 
		rail_balance = 10 
		lip_balance = 7 
		manual_balance = 9 
		sponsors = [ shortys circa muskabeatz chad ] 
		trick_mapping = { } 
		default_trick_mapping = MuskaTricks 
		max_specials = 4 
		specials = { 
			[ 
				{ trickslot = SpGrind_R_D_Triangle trickname = Trick_MoonwalkGrind } 
				{ trickslot = SpMan_L_R_Triangle trickname = Trick_RustySlide } 
				{ trickslot = SpGrind_L_R_Triangle trickname = Trick_Muska_Burn } 
				{ trickslot = Spgrind_D_U_Triangle trickname = Trick_Worm } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
			] 
		} 
		no_edit 
	} 
	{ 
		display_name = "Ryan Sheckler" 
		select_icon = ss_sheckler 
		first_name = "Ryan" 
		last_name = "Sheckler" 
		default_appearance = appearance_Sheckler 
		name = sheckler 
		stance = regular 
		pushstyle = never_mongo 
		tag_texture = "tags\\ryn_01" 
		skater_family = family_guest 
		is_pro = 1 
		is_head_locked = 1 
		is_locked = 1 
		is_hidden = 1 
		is_male = 1 
		is_secret 
		points_available = 0 
		air = 10 
		run = 4 
		ollie = 7 
		speed = 8 
		spin = 8 
		switch = 8 
		flip_speed = 10 
		rail_balance = 10 
		lip_balance = 10 
		manual_balance = 10 
		sponsors = [ ] 
		trick_mapping = { } 
		default_trick_mapping = PedTricks 
		found_flag = GUEST_FOUND_SHECKLER 
		unlock_flag = SKATER_UNLOCKED_SHECKLER 
		no_edit 
		no_edit_groups = [ 
			secret_options 
		] 
		max_specials = 2 
		specials = { 
			[ 
				{ trickslot = SpGrind_U_D_Triangle trickname = Trick_ShecklerPrimo } 
				{ trickslot = SpAir_U_R_circle trickname = Trick_ShecklerGrab } 
				{ trickslot = SpAir_R_D_Circle trickname = Trick_McTwist } 
				{ trickslot = SpMan_D_R_Triangle trickname = Trick_PrimoSlide } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
			] 
		} 
	} 
	{ 
		display_name = "Mike Vallely" 
		select_icon = ss_vallely 
		first_name = "Mike" 
		last_name = "Vallely" 
		default_appearance = appearance_vallely 
		name = vallely 
		teammate_pro_appearance_name = pedpro_vallely 
		stance = regular 
		pushstyle = never_mongo 
		tag_texture = "tags\\val_01" 
		skater_family = family_pro 
		is_pro = 1 
		is_head_locked = 1 
		is_locked = 1 
		is_male = 1 
		points_available = 0 
		air = 8 
		run = 11 
		ollie = 9 
		speed = 10 
		spin = 8 
		switch = 7 
		flip_speed = 8 
		rail_balance = 8 
		lip_balance = 8 
		manual_balance = 8 
		sponsors = [ vallely etnies mike ] 
		trick_mapping = { } 
		default_trick_mapping = VallelyTricks 
		max_specials = 4 
		specials = { 
			[ 
				{ trickslot = SpMan_D_U_Triangle trickname = Trick_KickflipSwitch } 
				{ trickslot = SpAir_D_R_Circle trickname = Trick_Flamingo } 
				{ trickslot = SpLip_U_R_Triangle trickname = Trick_Around } 
				{ trickslot = SpMan_R_L_Triangle trickname = Trick_Boomerang } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
			] 
		} 
	} 
	{ 
		display_name = "Wee-Man" 
		select_icon = ss_weeman 
		first_name = "Wee" 
		last_name = "man" 
		default_appearance = appearance_weeman 
		name = weeman 
		stance = goofy 
		pushstyle = never_mongo 
		tag_texture = "tags\\wee_01" 
		skater_family = family_pro 
		is_pro = 1 
		is_head_locked = 1 
		is_locked = 1 
		is_male = 1 
		points_available = 0 
		air = 8 
		run = 10 
		ollie = 9 
		speed = 10 
		spin = 5 
		switch = 10 
		flip_speed = 5 
		rail_balance = 8 
		lip_balance = 10 
		manual_balance = 10 
		sponsors = [ vallely etnies mike ] 
		trick_mapping = { } 
		default_trick_mapping = VallelyTricks 
		max_specials = 4 
		specials = { 
			[ 
				{ trickslot = SpGrind_L_R_Triangle trickname = Trick_ElbowSmash } 
				{ trickslot = SpAir_D_U_Circle trickname = Trick_HeadKickBackFlip } 
				{ trickslot = SpAir_D_R_Circle trickname = Trick_Flamingo } 
				{ trickslot = SpMan_L_R_Triangle trickname = Trick_SlamSpinner } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
			] 
		} 
	} 
	{ 
		display_name = "Ben Franklin" 
		select_icon = ss_benfranklin 
		first_name = "Ben" 
		last_name = "Franklin" 
		default_appearance = Ped_benfranklin 
		name = benfranklin 
		stance = regular 
		pushstyle = never_mongo 
		skatestyle = crappy 
		tag_texture = "tags\\indy_01" 
		skater_family = family_guest 
		is_pro = 1 
		is_head_locked = 1 
		is_locked = 1 
		is_hidden = 1 
		is_male = 1 
		is_secret 
		points_available = 0 
		air = 6 
		run = 2 
		ollie = 1 
		speed = 5 
		spin = 5 
		switch = 6 
		flip_speed = 6 
		rail_balance = 6 
		lip_balance = 4 
		manual_balance = 6 
		sponsors = [ ] 
		trick_mapping = { } 
		default_trick_mapping = PedTricks 
		found_flag = GUEST_FOUND_BENFRANKLIN 
		unlock_flag = SKATER_UNLOCKED_BENFRANKLIN 
		no_edit 
		no_edit_groups = [ 
			secret_options 
		] 
		max_specials = 2 
		specials = { 
			[ 
				{ trickslot = Spgrind_D_U_Triangle trickname = Trick_Franklin_grind } 
				{ trickslot = SpAir_R_D_Circle trickname = Trick_McTwist } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
			] 
		} 
	} 
	{ 
		display_name = "Jesse James - Vehicle" 
		first_name = "Jesse" 
		last_name = "James" 
		default_appearance = Ped_segwayrider 
		name = segwayrider 
		not_in_frontend 
		stance = regular 
		pushstyle = never_mongo 
		tag_texture = "tags\\jam_01" 
		skater_family = family_flavor 
		is_pro = 1 
		is_head_locked = 1 
		is_locked = 1 
		is_hidden = 1 
		is_male = 1 
		points_available = 0 
		air = 1 
		run = 1 
		ollie = 1 
		speed = 5 
		spin = 10 
		switch = 10 
		flip_speed = 10 
		rail_balance = 10 
		lip_balance = 11 
		manual_balance = 10 
		sponsors = [ ] 
		trick_mapping = { } 
		default_trick_mapping = PedTricks 
		found_flag = GUEST_FOUND_JESSEJAMES 
		no_edit 
		no_edit_groups = [ 
			secret_options 
		] 
		max_specials = 2 
		vehicle_params = segway_params 
		specials = { 
			[ 
				{ trickslot = SpMan_D_U_Triangle trickname = Trick_HotRod } 
				{ trickslot = SpAir_R_D_Circle trickname = Trick_McTwist } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
			] 
		} 
	} 
	{ 
		display_name = "Jesse James - Skater" 
		first_name = "Jesse" 
		last_name = "Ped_JesseJames" 
		default_appearance = Ped_segwayrider 
		name = JesseJamesSkater 
		not_in_frontend 
		stance = regular 
		pushstyle = never_mongo 
		tag_texture = "tags\\jam_01" 
		skater_family = family_flavor 
		is_pro = 1 
		is_head_locked = 1 
		is_locked = 1 
		is_hidden = 1 
		is_male = 1 
		points_available = 0 
		air = 8 
		run = 9 
		ollie = 9 
		speed = 11 
		spin = 10 
		switch = 6 
		flip_speed = 5 
		rail_balance = 7 
		lip_balance = 6 
		manual_balance = 6 
		sponsors = [ ] 
		trick_mapping = { } 
		default_trick_mapping = PedTricks 
		found_flag = GUEST_FOUND_JESSEJAMES 
		no_edit 
		no_edit_groups = [ 
			secret_options 
		] 
		max_specials = 2 
		vehicle_params = segway_params 
		specials = { 
			[ 
				{ trickslot = SpMan_D_U_Triangle trickname = Trick_HotRod } 
				{ trickslot = SpAir_R_D_Circle trickname = Trick_McTwist } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
			] 
		} 
	} 
	{ 
		display_name = "Bull Fighter" 
		select_icon = ss_bullfighter 
		first_name = "Bull" 
		last_name = "Fighter" 
		default_appearance = Ped_bullfighter 
		name = bullfighter 
		stance = regular 
		pushstyle = never_mongo 
		skatestyle = crappy 
		tag_texture = "tags\\bull_01" 
		skater_family = family_guest 
		is_pro = 1 
		is_head_locked = 1 
		is_locked = 1 
		is_hidden = 1 
		is_male = 1 
		is_secret 
		points_available = 0 
		air = 6 
		run = 9 
		ollie = 3 
		speed = 7 
		spin = 9 
		switch = 8 
		flip_speed = 3 
		rail_balance = 9 
		lip_balance = 9 
		manual_balance = 9 
		sponsors = [ ] 
		trick_mapping = { } 
		default_trick_mapping = PedTricks 
		found_flag = GUEST_FOUND_BULLFIGHTER 
		unlock_flag = SKATER_UNLOCKED_BULLFIGHTER 
		no_edit 
		no_edit_groups = [ 
			secret_options 
		] 
		max_specials = 2 
		specials = { 
			[ 
				{ trickslot = SpGrind_D_L_Triangle trickname = Trick_BullF_Sword } 
				{ trickslot = SpAir_R_D_Circle trickname = Trick_McTwist } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
			] 
		} 
	} 
	{ 
		display_name = "Steve-O - Vehicle" 
		first_name = "Mech" 
		last_name = "BullRider" 
		default_appearance = Ped_mechbull 
		name = mechbullrider 
		not_in_frontend 
		stance = goofy 
		pushstyle = never_mongo 
		tag_texture = "tags\\stv_01" 
		skater_family = family_flavor 
		is_pro = 1 
		is_head_locked = 1 
		is_locked = 1 
		is_hidden = 1 
		is_male = 1 
		points_available = 0 
		air = 10 
		run = 1 
		ollie = 1 
		speed = 5 
		spin = 10 
		switch = 10 
		flip_speed = 10 
		rail_balance = 10 
		lip_balance = 11 
		manual_balance = 10 
		sponsors = [ ] 
		trick_mapping = { } 
		default_trick_mapping = PedTricks 
		found_flag = GUEST_FOUND_STEVEO 
		no_edit 
		no_edit_groups = [ 
			secret_options 
		] 
		max_specials = 2 
		vehicle_params = mechbull_params 
		specials = { 
			[ 
				{ trickslot = SpAir_L_U_Triangle trickname = Trick_BiteBoard } 
				{ trickslot = SpAir_R_D_Circle trickname = Trick_McTwist } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
			] 
		} 
	} 
	{ 
		display_name = "Steve-O - Skater" 
		first_name = "Steve" 
		last_name = "Bullrider" 
		default_appearance = Ped_mechbull 
		name = SteveoSkater 
		not_in_frontend 
		stance = goofy 
		pushstyle = never_mongo 
		tag_texture = "tags\\stv_01" 
		skater_family = family_flavor 
		is_pro = 1 
		is_head_locked = 1 
		is_locked = 1 
		is_hidden = 1 
		is_male = 1 
		points_available = 0 
		air = 10 
		run = 10 
		ollie = 6 
		speed = 7 
		spin = 9 
		switch = 5 
		flip_speed = 8 
		rail_balance = 6 
		lip_balance = 5 
		manual_balance = 4 
		sponsors = [ ] 
		trick_mapping = { } 
		default_trick_mapping = PedTricks 
		found_flag = GUEST_FOUND_STEVEO 
		no_edit 
		no_edit_groups = [ 
			secret_options 
		] 
		max_specials = 2 
		vehicle_params = mechbull_params 
		specials = { 
			[ 
				{ trickslot = SpAir_L_U_Triangle trickname = Trick_BiteBoard } 
				{ trickslot = SpAir_R_D_Circle trickname = Trick_McTwist } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
			] 
		} 
	} 
	{ 
		display_name = "Graffiti Tagger" 
		select_icon = ss_graffititagger 
		first_name = "Graffiti" 
		last_name = "Tagger" 
		default_appearance = Ped_graffitiSkater 
		name = graffititagger 
		stance = regular 
		pushstyle = never_mongo 
		tag_texture = "tags\\tag_01" 
		skater_family = family_guest 
		is_pro = 1 
		is_head_locked = 1 
		is_locked = 1 
		is_hidden = 1 
		is_male = 1 
		is_secret 
		points_available = 0 
		air = 8 
		run = 10 
		ollie = 7 
		speed = 8 
		spin = 7 
		switch = 6 
		flip_speed = 8 
		rail_balance = 6 
		lip_balance = 7 
		manual_balance = 6 
		sponsors = [ ] 
		trick_mapping = { } 
		default_trick_mapping = PedTricks 
		found_flag = GUEST_FOUND_GRAFFITITAGGER 
		unlock_flag = SKATER_UNLOCKED_GRAFFITITAGGER 
		no_edit 
		no_edit_groups = [ 
			secret_options 
		] 
		max_specials = 2 
		specials = { 
			[ 
				{ trickslot = SpAir_D_L_Circle trickname = Trick_DoubleFistin } 
				{ trickslot = SpAir_R_D_Circle trickname = Trick_McTwist } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
			] 
		} 
	} 
	{ 
		display_name = "Paulie - Vehicle" 
		first_name = "Paulie" 
		last_name = "Paulie" 
		default_appearance = paulie_full 
		name = paulie 
		not_in_frontend 
		stance = goofy 
		pushstyle = never_mongo 
		tag_texture = "tags\\paul_01" 
		skater_family = family_flavor 
		is_pro = 1 
		is_head_locked = 1 
		is_locked = 1 
		is_hidden = 1 
		is_male = 1 
		points_available = 0 
		air = 10 
		run = 1 
		ollie = 1 
		speed = 5 
		spin = 10 
		switch = 10 
		flip_speed = 10 
		rail_balance = 10 
		lip_balance = 11 
		manual_balance = 10 
		sponsors = [ ] 
		trick_mapping = { } 
		default_trick_mapping = PedTricks 
		found_flag = GUEST_FOUND_PAULIE 
		no_edit 
		no_edit_groups = [ 
			secret_options 
		] 
		max_specials = 2 
		vehicle_params = wheelchair_params 
		specials = { 
			[ 
				{ trickslot = SpMan_U_D_Triangle trickname = Trick_Butt_Manual } 
				{ trickslot = SpAir_R_D_Circle trickname = Trick_McTwist } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
			] 
		} 
	} 
	{ 
		display_name = "Paulie - Skater" 
		first_name = "Paulie" 
		last_name = "Paulie" 
		default_appearance = paulie_full 
		name = PaulieSkater 
		not_in_frontend 
		stance = goofy 
		pushstyle = never_mongo 
		tag_texture = "tags\\paul_01" 
		skater_family = family_flavor 
		is_pro = 1 
		is_head_locked = 1 
		is_locked = 1 
		is_hidden = 1 
		is_male = 1 
		points_available = 0 
		air = 10 
		run = 1 
		ollie = 10 
		speed = 10 
		spin = 10 
		switch = 10 
		flip_speed = 10 
		rail_balance = 10 
		lip_balance = 10 
		manual_balance = 10 
		sponsors = [ ] 
		trick_mapping = { } 
		default_trick_mapping = PedTricks 
		found_flag = GUEST_FOUND_PAULIE 
		no_edit 
		no_edit_groups = [ 
			secret_options 
		] 
		max_specials = 2 
		vehicle_params = wheelchair_params 
		specials = { 
			[ 
				{ trickslot = SpMan_U_D_Triangle trickname = Trick_Butt_Manual } 
				{ trickslot = SpAir_R_D_Circle trickname = Trick_McTwist } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
			] 
		} 
	} 
	{ 
		display_name = "Shrimp Vendor" 
		select_icon = ss_shrimpvendor 
		first_name = "Shrimp" 
		last_name = "Vendor" 
		default_appearance = Ped_ShrimpVendor 
		name = shrimpvendor 
		stance = regular 
		pushstyle = never_mongo 
		tag_texture = "tags\\shr_01" 
		skater_family = family_guest 
		is_pro = 1 
		is_head_locked = 1 
		is_locked = 1 
		is_hidden = 1 
		is_male = 1 
		is_secret 
		points_available = 0 
		air = 8 
		run = 9 
		ollie = 8 
		speed = 8 
		spin = 8 
		switch = 7 
		flip_speed = 8 
		rail_balance = 8 
		lip_balance = 8 
		manual_balance = 8 
		sponsors = [ ] 
		trick_mapping = { } 
		default_trick_mapping = PedTricks 
		found_flag = GUEST_FOUND_SHRIMPVENDOR 
		unlock_flag = SKATER_UNLOCKED_SHRIMPVENDOR 
		no_edit 
		no_edit_groups = [ 
			secret_options 
		] 
		max_specials = 2 
		specials = { 
			[ 
				{ trickslot = SpAir_L_D_Circle trickname = Trick_Rotisserie } 
				{ trickslot = SpAir_R_D_Circle trickname = Trick_McTwist } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
			] 
		} 
	} 
	{ 
		display_name = "Minikart Driver" 
		first_name = "Minikart" 
		last_name = "MiniKartGuy" 
		default_appearance = MiniKartGuy 
		name = minikartdriver 
		not_in_frontend 
		stance = goofy 
		pushstyle = never_mongo 
		tag_texture = "tags\\cas_01" 
		skater_family = family_flavor 
		is_pro = 1 
		is_head_locked = 1 
		is_locked = 1 
		is_hidden = 1 
		is_male = 1 
		points_available = 0 
		air = 10 
		run = 1 
		ollie = 1 
		speed = 5 
		spin = 10 
		switch = 10 
		flip_speed = 10 
		rail_balance = 10 
		lip_balance = 11 
		manual_balance = 10 
		sponsors = [ ] 
		trick_mapping = { } 
		default_trick_mapping = PedTricks 
		found_flag = GUEST_FOUND_ABORIGINE 
		no_edit 
		no_edit_groups = [ 
			secret_options 
		] 
		max_specials = 2 
		vehicle_params = minikart_params 
		specials = { 
			[ 
				{ trickslot = SpAir_R_D_Circle trickname = Trick_McTwist } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
			] 
		} 
	} 
	{ 
		display_name = "Nigel Beaverhausen" 
		first_name = "Nigel" 
		last_name = "Beaverhausen" 
		default_appearance = Nigel_Costume 
		name = nigel 
		not_in_frontend 
		stance = regular 
		pushstyle = never_mongo 
		tag_texture = "tags\\bev_01" 
		skater_family = family_custom 
		is_pro = 1 
		is_head_locked = 1 
		is_locked = 1 
		is_hidden = 1 
		is_male = 1 
		points_available = 0 
		air = 8 
		run = 2 
		ollie = 8 
		speed = 8 
		spin = 8 
		switch = 8 
		flip_speed = 7 
		rail_balance = 8 
		lip_balance = 8 
		manual_balance = 8 
		sponsors = [ ] 
		trick_mapping = { } 
		default_trick_mapping = PedTricks 
		no_edit 
		no_edit_groups = [ 
			secret_options 
		] 
		max_specials = 2 
		specials = { 
			[ 
				{ trickslot = SpAir_L_R_Square trickname = Trick_BeaverBlast } 
				{ trickslot = SpAir_R_D_Circle trickname = Trick_McTwist } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
			] 
		} 
	} 
	{ 
		display_name = "Jester" 
		select_icon = ss_jester 
		first_name = "Jester" 
		last_name = "Jester" 
		default_appearance = Ped_jester 
		name = jester 
		stance = regular 
		pushstyle = never_mongo 
		skatestyle = crappy 
		tag_texture = "tags\\jes_01" 
		skater_family = family_guest 
		is_pro = 1 
		is_head_locked = 1 
		is_locked = 1 
		is_hidden = 1 
		is_male = 1 
		is_secret 
		points_available = 0 
		air = 11 
		run = 9 
		ollie = 9 
		speed = 9 
		spin = 10 
		switch = 9 
		flip_speed = 9 
		rail_balance = 9 
		lip_balance = 9 
		manual_balance = 9 
		sponsors = [ ] 
		trick_mapping = { } 
		default_trick_mapping = PedTricks 
		found_flag = GUEST_FOUND_JESTER 
		unlock_flag = SKATER_UNLOCKED_JESTER 
		no_edit 
		no_edit_groups = [ 
			secret_options 
		] 
		max_specials = 2 
		specials = { 
			[ 
				{ trickslot = SpMan_U_D_Triangle trickname = Trick_JesterJuggle } 
				{ trickslot = SpAir_R_D_Circle trickname = Trick_McTwist } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
			] 
		} 
	} 
	{ 
		display_name = "VooDoo" 
		first_name = "Voo" 
		last_name = "Ped_Witchdoctor" 
		default_appearance = Ped_witchdoctor 
		name = voodoo 
		not_in_frontend 
		stance = regular 
		pushstyle = never_mongo 
		tag_texture = "tags\\cas_01" 
		skater_family = family_flavor 
		is_pro = 1 
		is_head_locked = 1 
		is_locked = 1 
		is_hidden = 1 
		is_male = 1 
		points_available = 0 
		air = 10 
		run = 10 
		ollie = 10 
		speed = 10 
		spin = 10 
		switch = 10 
		flip_speed = 10 
		rail_balance = 10 
		lip_balance = 10 
		manual_balance = 10 
		sponsors = [ ] 
		trick_mapping = { } 
		default_trick_mapping = PedTricks 
		found_flag = GUEST_FOUND_VOODOO 
		no_edit 
		no_edit_groups = [ 
			secret_options 
		] 
		max_specials = 2 
		vehicle_params = tricycle_params 
		specials = { 
			[ 
				{ trickslot = SpAir_R_D_Circle trickname = Trick_McTwist } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
			] 
		} 
	} 
	{ 
		display_name = "Chainsaw Skater" 
		first_name = "Chainsaw" 
		last_name = "Ped_Bigfoot" 
		default_appearance = Ped_Bigfoot 
		name = chainsawskater 
		not_in_frontend 
		stance = goofy 
		pushstyle = never_mongo 
		tag_texture = "tags\\cas_01" 
		skater_family = family_flavor 
		is_pro = 1 
		is_head_locked = 1 
		is_locked = 1 
		is_hidden = 1 
		is_male = 1 
		points_available = 0 
		air = 11 
		run = 10 
		ollie = 10 
		speed = 11 
		spin = 10 
		switch = 10 
		flip_speed = 10 
		rail_balance = 10 
		lip_balance = 10 
		manual_balance = 10 
		sponsors = [ ] 
		trick_mapping = { } 
		default_trick_mapping = PedTricks 
		found_flag = GUEST_FOUND_BIGFOOT 
		no_edit 
		no_edit_groups = [ 
			secret_options 
		] 
		max_specials = 2 
		motoskateboard 
		specials = { 
			[ 
				{ trickslot = SpAir_R_D_Circle trickname = Trick_McTwist } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
			] 
		} 
	} 
	{ 
		display_name = "THPS Hawk" 
		first_name = "Tony" 
		last_name = "Hawk" 
		default_appearance = appearance_thps_hawk 
		name = THPS_hawk 
		not_in_frontend 
		stance = goofy 
		pushstyle = never_mongo 
		tag_texture = "tags\\thps_01" 
		skater_family = family_pro 
		is_pro = 1 
		is_head_locked = 1 
		is_locked = 1 
		is_hidden = 1 
		is_male = 1 
		points_available = 0 
		air = 10 
		run = 5 
		ollie = 10 
		speed = 10 
		spin = 10 
		switch = 10 
		flip_speed = 10 
		rail_balance = 10 
		lip_balance = 10 
		manual_balance = 10 
		sponsors = [ birdhouse hawkshoes quiksilver hawkapp tony ] 
		trick_mapping = { } 
		default_trick_mapping = HawkTricks 
		max_specials = 4 
		specials = { 
			[ 
				{ trickslot = SpAir_R_L_Circle trickname = Trick_360VarialMcTwist } 
				{ trickslot = SpAir_R_D_Circle trickname = Trick_Indy900 } 
				{ trickslot = SpAir_L_D_Circle trickname = Trick_EndlessHandflip } { trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = SpMan_U_D_Triangle trickname = Trick_TonySurfer } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
			] 
		} 
		lockout_flags = [ 
			is_hawk 
		] 
	} 
	{ 
		display_name = "The Hand" 
		first_name = "Tony" 
		last_name = "Ped_Bigfoot" 
		default_appearance = appearance_hand 
		name = Hand 
		not_in_frontend 
		stance = goofy 
		pushstyle = never_mongo 
		tag_texture = "tags\\hnd_01" 
		skater_family = family_pro 
		is_pro = 1 
		is_head_locked = 1 
		is_locked = 1 
		is_hidden = 1 
		is_male = 1 
		points_available = 0 
		air = 10 
		run = 11 
		ollie = 10 
		speed = 10 
		spin = 10 
		switch = 10 
		flip_speed = 10 
		rail_balance = 10 
		lip_balance = 10 
		manual_balance = 10 
		sponsors = [ birdhouse hawkshoes quiksilver hawkapp tony ] 
		trick_mapping = { } 
		default_trick_mapping = HawkTricks 
		max_specials = 4 
		specials = { 
			[ 
				{ trickslot = SpAir_R_L_Circle trickname = Trick_360VarialMcTwist } 
				{ trickslot = SpGrind_L_D_Triangle trickname = Trick_TheBird } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
			] 
		} 
		lockout_flags = [ 
			is_hawk 
		] 
	} 
	{ 
		display_name = "Shrek" 
		select_icon = ss_shrek 
		first_name = "Tony" 
		last_name = "Shrek" 
		default_appearance = appearance_shrek 
		name = skater_shrek 
		stance = goofy 
		pushstyle = mongo_when_switch 
		tag_texture = "tags\\srk_01" 
		skater_family = family_pro 
		is_pro = 1 
		is_head_locked = 1 
		is_locked = 1 
		is_hidden = 1 
		is_secret 
		is_male = 1 
		points_available = 0 
		air = 10 
		run = 10 
		ollie = 10 
		speed = 10 
		spin = 10 
		switch = 10 
		flip_speed = 10 
		rail_balance = 10 
		lip_balance = 10 
		manual_balance = 10 
		sponsors = [ birdhouse hawkshoes quiksilver hawkapp tony ] 
		trick_mapping = { } 
		default_trick_mapping = HawkTricks 
		unlock_flag = SKATER_UNLOCKED_SHREK 
		max_specials = 4 
		specials = { 
			[ 
				{ trickslot = SpAir_R_L_Circle trickname = Trick_BoardSnap } 
				{ trickslot = SpGrind_L_D_Triangle trickname = Trick_WaxSlide } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
			] 
		} 
		lockout_flags = [ 
			is_hawk 
		] 
	} 
	{ 
		display_name = "C.o.D. Soldier" 
		select_icon = ss_soldier 
		first_name = "CoD" 
		last_name = "Soldier" 
		default_appearance = appearance_COD 
		name = cod_soldier 
		stance = goofy 
		pushstyle = never_mongo 
		tag_texture = "tags\\doo_01" 
		skater_family = family_pro 
		is_pro = 1 
		is_head_locked = 1 
		is_locked = 1 
		is_hidden = 1 
		is_secret 
		is_male = 1 
		points_available = 0 
		air = 10 
		run = 10 
		ollie = 10 
		speed = 10 
		spin = 10 
		switch = 10 
		flip_speed = 10 
		rail_balance = 10 
		lip_balance = 10 
		manual_balance = 10 
		sponsors = [ birdhouse hawkshoes quiksilver hawkapp tony ] 
		trick_mapping = { } 
		default_trick_mapping = HawkTricks 
		unlock_flag = SKATER_UNLOCKED_SOLDIER 
		max_specials = 4 
		specials = { 
			[ 
				{ trickslot = SpAir_R_L_Circle trickname = Trick_360VarialMcTwist } 
				{ trickslot = SpAir_R_D_Circle trickname = Trick_Solute } 
				{ trickslot = SpGrind_U_D_Triangle trickname = Trick_Hero } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
			] 
		} 
		lockout_flags = [ 
			is_hawk 
		] 
	} 
	{ 
		display_name = "Eric Sparrow" 
		first_name = "Eric" 
		last_name = "Sparrow" 
		default_appearance = appearance_sparrow 
		name = sparrow 
		not_in_frontend 
		stance = regular 
		pushstyle = never_mongo 
		tag_texture = "tags\\spr_01" 
		skater_family = family_pro 
		is_pro = 1 
		is_head_locked = 0 
		is_locked = 1 
		is_hidden = 1 
		is_male = 1 
		points_available = 0 
		air = 8 
		run = 6 
		ollie = 8 
		speed = 9 
		spin = 6 
		switch = 8 
		flip_speed = 8 
		rail_balance = 8 
		lip_balance = 8 
		manual_balance = 8 
		sponsors = [ vallely etnies mike ] 
		trick_mapping = { } 
		default_trick_mapping = VallelyTricks 
		max_specials = 4 
		specials = { 
			[ 
				{ trickslot = SpGrind_L_R_Triangle trickname = Trick_ElbowSmash } 
				{ trickslot = SpMan_D_U_Triangle trickname = Trick_RunningMan } 
				{ trickslot = SpAir_D_R_Circle trickname = Trick_Flamingo } 
				{ trickslot = SpMan_L_R_Triangle trickname = Trick_SlamSpinner } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
			] 
		} 
	} 
	{ 
		display_name = "Secret Skaters" 
		first_name = "Secret" 
		last_name = "Skaters" 
		select_icon = ss_questionmark 
		default_appearance = appearance_sparrow 
		name = Ped 
		profile_list = ped_profile_list 
		stance = regular 
		pushstyle = mongo_when_switch 
		trickstyle = street 
		tag_texture = "tags\\thps_01" 
		skater_family = family_flavor 
		is_pro = 1 
		is_head_locked = 1 
		is_locked = 1 
		is_hidden = 1 
		is_male = 1 
		age = -1 
		hometown = "hell" 
		points_available = 0 
		air = 10 
		run = 10 
		ollie = 10 
		speed = 10 
		spin = 10 
		switch = 10 
		flip_speed = 10 
		rail_balance = 10 
		lip_balance = 10 
		manual_balance = 10 
		sponsors = [ ] 
		trick_mapping = { } 
		default_trick_mapping = PedTricks 
		no_edit 
		no_edit_groups = [ 
			secret_options 
		] 
		max_specials = 4 
		specials = { 
			[ 
				{ trickslot = SpAir_L_D_Circle trickname = Trick_1234 } 
				{ trickslot = SpAir_R_U_Circle trickname = Trick_The900 } 
				{ trickslot = SpMan_U_D_Triangle trickname = Trick_SlamSpinner } 
				{ trickslot = SpMan_L_R_Triangle trickname = Trick_OneFootOneWheel } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
				{ trickslot = Unassigned trickname = Unassigned } 
			] 
		} 
	} 
] 
default_classic_stats = 
{ 
	air = 3 
	run = 3 
	ollie = 3 
	speed = 3 
	spin = 3 
	switch = 3 
	flip_speed = 3 
	rail_balance = 3 
	lip_balance = 3 
	manual_balance = 3 
	points_available = 0 
} 

