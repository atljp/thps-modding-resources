
custom_decklogo_params = 
{ 
	logo_texture = "CS_NSN_board_default.png" 
	temp_texture = "images/CAGR/temp_replace_deck" 
	base_texture = "images/CAGR/base_deck_wood" 
	with = base_deck_wood 
	in = board 
	x_scale = 1.00000000000 
	y_scale = 1.00000000000 
	is_deck = 1 
} 
__cas_refresh_skater_parts = 
[ 
	board 
	griptape 
	deck_graphic 
	truck_texture 
	wheel_texture 
] 
common_wheel_texture_params = 
{ 
	replace = "CS_NSN_Skateboard_wheel.png" 
	replace1 = "CS_NH_wheel.png" 
	replace2 = "CS_NSN_wheel2.png" 
	replace3 = "CS_NN_Bananawheel.png" 
	replace4 = "SEC_NSN_Shrek_wheel.png" 
	in = board 
	in1 = board 
	in2 = board 
	in3 = board 
	in4 = board 
} 
wheel_texture = [ 
	{ 
		desc_id = None 
		part = board 
		material = skateboard_wheels 
		pass = 0 
		frontend_desc = #"Default" 
	} 
	{ 
		desc_id = __wheels01 
		frontend_desc = #"White" 
		with = "textures/board_textures/wheel_white" 
		common_wheel_texture_params 
	} 
	{ 
		desc_id = __wheels02 
		frontend_desc = #"Black" 
		with = "textures/board_textures/wheel_black" 
		common_wheel_texture_params 
	} 
	{ 
		desc_id = __wheels03 
		frontend_desc = #"THUG" 
		with = "textures/board_textures/wheel_thug" 
		common_wheel_texture_params 
	} 
	{ 
		desc_id = __wheels04 
		frontend_desc = #"Yellow" 
		with = "textures/board_textures/wheel_yellow" 
		common_wheel_texture_params 
	} 
	{ 
		desc_id = __wheels_crashtest 
		frontend_desc = #"Crash Test" 
		with = "textures/board_textures/wheel_crashtest" 
		common_wheel_texture_params 
	} 
	{ 
		desc_id = __wheels_cyber 
		frontend_desc = #"Cyber" 
		with = "textures/board_textures/wheel_cyber" 
		common_wheel_texture_params 
	} 
	{ 
		desc_id = __wheels_hypnotic 
		frontend_desc = #"Hypnotic" 
		with = "textures/board_textures/wheel_hypnotic" 
		common_wheel_texture_params 
	} 
	{ 
		desc_id = __wheels_doughnut 
		frontend_desc = #"Doughnut" 
		with = "textures/board_textures/wheel_doughnut" 
		common_wheel_texture_params 
	} 
	{ 
		desc_id = __wheels_heartagram_white 
		frontend_desc = #"Heartagram (White)" 
		with = "textures/board_textures/wheel_heartagram_white" 
		common_wheel_texture_params 
	} 
	{ 
		desc_id = __wheels_heartagram_black 
		frontend_desc = #"Heartagram (Black)" 
		with = "textures/board_textures/wheel_heartagram_black" 
		common_wheel_texture_params 
	} 
	{ 
		desc_id = __wheels_concrete_conspiracy_99 
		frontend_desc = #"Concrete Conspiracy \'99" 
		with = "textures/board_textures/wheel_concrete_conspiracy_99" 
		common_wheel_texture_params 
	} 
	{ 
		desc_id = __wheels_skiddles 
		frontend_desc = #"Skiddles" 
		with = "textures/board_textures/wheel_skiddles" 
		common_wheel_texture_params 
	} 
	{ 
		desc_id = __wheels_baker 
		frontend_desc = #"Baker" 
		with = "textures/board_textures/wheel_Baker" 
		common_wheel_texture_params 
	} 
	{ 
		desc_id = __wheels_Autobahn_Torus_AR 
		frontend_desc = #"Autobahn - Torus AR" 
		with = "textures/board_textures/wheel_Autobahn_Torus_AR" 
		common_wheel_texture_params 
	} 
	{ 
		desc_id = __wheels_Bones_100 
		frontend_desc = #"Bones - 100" 
		with = "textures/board_textures/wheel_Bones_100" 
		common_wheel_texture_params 
	} 
	{ 
		desc_id = __wheels_Bones_My_Little_Bartie 
		frontend_desc = #"Bones - My Little Bartie" 
		with = "textures/board_textures/wheel_Bones_MyLittleBartie" 
		common_wheel_texture_params 
	} 
	{ 
		desc_id = __wheels_Creature_Bloodsuckers 
		frontend_desc = #"Creature - Bloodsuckers" 
		with = "textures/board_textures/wheel_Creature_Bloodsuckers" 
		common_wheel_texture_params 
	} 
	{ 
		desc_id = __wheels_Earthwing_Superballs 
		frontend_desc = #"Earthwing - Superballs" 
		with = "textures/board_textures/wheel_Earthwing_Superballs" 
		common_wheel_texture_params 
	} 
	{ 
		desc_id = __wheels_Element_Section_AllTerrain 
		frontend_desc = #"Element - Section All Terrain" 
		with = "textures/board_textures/wheel_Element_Section_AllTerrain" 
		common_wheel_texture_params 
	} 
	{ 
		desc_id = __wheels_enjoi_cairo_slix 
		frontend_desc = #"Enjoi - Cairo Slix" 
		with = "textures/board_textures/wheel_enjoi_cairo_slix" 
		common_wheel_texture_params 
	} 
	{ 
		desc_id = __wheels_enjoi_cairo_slix_red 
		frontend_desc = #"Enjoi - Cairo Slix Red" 
		with = "textures/board_textures/wheel_enjoi_cairo_slix_red" 
		common_wheel_texture_params 
	} 
	{ 
		desc_id = __wheels_gold_williams_hope 
		frontend_desc = #"Gold - Williams Hope" 
		with = "textures/board_textures/wheel_gold_williams_hope" 
		common_wheel_texture_params 
	} 
	{ 
		desc_id = __wheels_ojiii_ditch_witch 
		frontend_desc = #"Ojiii - Ditch Witch" 
		with = "textures/board_textures/wheel_ojiii_ditch_witch" 
		common_wheel_texture_params 
	} 
	{ 
		desc_id = __wheels_pig_headswirls 
		frontend_desc = #"Pig - Head Swirls" 
		with = "textures/board_textures/wheel_pig_headswirls" 
		common_wheel_texture_params 
	} 
	{ 
		desc_id = __wheels_pig_headswirls_black 
		frontend_desc = #"Pig - Head Swirls Black" 
		with = "textures/board_textures/wheel_pig_headswirls_black" 
		common_wheel_texture_params 
	} 
	{ 
		desc_id = __wheels_portlandwheelco_tweesters 
		frontend_desc = #"Portland Wheel Co. - Tweesters" 
		with = "textures/board_textures/wheel_portlandwheelco_tweesters" 
		common_wheel_texture_params 
	} 
	{ 
		desc_id = __wheels_santacruz_slimeball_bigballs 
		frontend_desc = #"Santa Cruz - SlimeBall Big Balls" 
		with = "textures/board_textures/wheel_santacruz_slimeball_bigballs" 
		common_wheel_texture_params 
	} 
	{ 
		desc_id = __wheels_Spitfire 
		frontend_desc = #"Spitfire" 
		with = "textures/board_textures/wheel_spitfire" 
		common_wheel_texture_params 
	} 
	{ 
		desc_id = __wheels_Spitfire_tripper 
		frontend_desc = #"Spitfire - Tripper" 
		with = "textures/board_textures/wheel_Spitfire_Tripper" 
		common_wheel_texture_params 
	} 
	{ 
		desc_id = __wheels_Spitfire_hawaiian 
		frontend_desc = #"Spitfire - Hawaiian" 
		with = "textures/board_textures/wheel_Spitfire_Hawaiian" 
		common_wheel_texture_params 
	} 
	{ 
		desc_id = __wheels_Spitfire_Hypnoswirl 
		frontend_desc = #"Spitfire - Hypnoswirl" 
		with = "textures/board_textures/wheel_Spitfire_Hypnoswirl" 
		common_wheel_texture_params 
	} 
	{ 
		desc_id = __wheels_Spitfire_Bighead 
		frontend_desc = #"Spitfire - Bighead" 
		with = "textures/board_textures/wheel_Spitfire_Bighead" 
		common_wheel_texture_params 
	} 
	{ 
		desc_id = __wheels_Spitfire_Bighead_Blue 
		frontend_desc = #"Spitfire - Bighead Blue" 
		with = "textures/board_textures/wheel_Spitfire_Bighead_Blue" 
		common_wheel_texture_params 
	} 
	{ 
		desc_id = __wheels_Spitfire_Bighead_Green 
		frontend_desc = #"Spitfire - Bighead Green" 
		with = "textures/board_textures/wheel_Spitfire_Bighead_Green" 
		common_wheel_texture_params 
	} 
	{ 
		desc_id = __wheels_Spitfire_Classic 
		frontend_desc = #"Spitfire - Classic" 
		with = "textures/board_textures/wheel_Spitfire_Classic" 
		common_wheel_texture_params 
	} 
	{ 
		desc_id = __wheels_Spitfire_classic_02 
		frontend_desc = #"Spitfire - Classic (Alt)" 
		with = "textures/board_textures/wheel_Spitfire_Classic_02" 
		common_wheel_texture_params 
	} 
	{ 
		desc_id = __wheels_Spitfire_Classic_neon 
		frontend_desc = #"Spitfire - Classic Neon" 
		with = "textures/board_textures/wheel_Spitfire_Classic_Neon" 
		common_wheel_texture_params 
	} 
	{ 
		desc_id = __wheels_Spitfire_What_Me_Burn 
		frontend_desc = #"Spitfire - What Me Burn" 
		with = "textures/board_textures/wheel_Spitfire_What_Me_Burn" 
		common_wheel_texture_params 
	} 
	{ 
		desc_id = __wheels_Spitfire_F4 
		frontend_desc = #"Spitfire - Formula Four" 
		with = "textures/board_textures/wheel_Spitfire_F4" 
		common_wheel_texture_params 
	} 
] 
common_truck_texture_params = 
{ 
	replace = "CS_NSN_Skateboard_trucks.png" 
	in = board 
} 
truck_texture = [ 
	{ 
		desc_id = None 
		material = skateboard_truck 
		pass = 0 
		part = board 
		frontend_desc = #"Default" 
	} 
	{ 
		desc_id = __trucks01 
		frontend_desc = #"No Color" 
		with = "textures/board_textures/truck_default" 
		common_truck_texture_params 
	} 
	{ 
		desc_id = __trucks03 
		frontend_desc = #"Red" 
		with = "textures/board_textures/truck_red" 
		common_truck_texture_params 
	} 
	{ 
		desc_id = __trucks_orange 
		frontend_desc = #"Orange" 
		with = "textures/board_textures/truck_orange" 
		common_truck_texture_params 
	} 
	{ 
		desc_id = __trucks_green 
		frontend_desc = #"Green" 
		with = "textures/board_textures/truck_green" 
		common_truck_texture_params 
	} 
	{ 
		desc_id = __trucks02 
		frontend_desc = #"Blue" 
		with = "textures/board_textures/truck_blue" 
		common_truck_texture_params 
	} 
	{ 
		desc_id = __trucks_purple 
		frontend_desc = #"Purple" 
		with = "textures/board_textures/truck_purple" 
		common_truck_texture_params 
	} 
	{ 
		desc_id = __trucks_core_black_red 
		frontend_desc = #"Core - Red" 
		with = "textures/board_textures/truck_core_black_red" 
		common_truck_texture_params 
	} 
	{ 
		desc_id = __trucks_independent_black_black 
		frontend_desc = #"Independent - Black" 
		with = "textures/board_textures/truck_independent_black_black" 
		common_truck_texture_params 
	} 
	{ 
		desc_id = __trucks_independent_grey_yellow 
		frontend_desc = #"Independent - Yellow" 
		with = "textures/board_textures/truck_independent_grey_yellow" 
		common_truck_texture_params 
	} 
	{ 
		desc_id = __trucks_tensor_green_black 
		frontend_desc = #"Tensor - Green" 
		with = "textures/board_textures/truck_tensor_green_black" 
		common_truck_texture_params 
	} 
	{ 
		desc_id = __trucks_tensor_grey_black 
		frontend_desc = #"Tensor - Black" 
		with = "textures/board_textures/truck_tensor_grey_black" 
		common_truck_texture_params 
	} 
	{ 
		desc_id = __trucks_tensor_grey_grey 
		frontend_desc = #"Tensor - Grey" 
		with = "textures/board_textures/truck_tensor_grey_grey" 
		common_truck_texture_params 
	} 
	{ 
		desc_id = __trucks_thunder_black_green 
		frontend_desc = #"Thunder - Green" 
		with = "textures/board_textures/truck_thunder_black_green" 
		common_truck_texture_params 
	} 
	{ 
		desc_id = __trucks_thunder_grey_black 
		frontend_desc = #"Thunder - Black" 
		with = "textures/board_textures/truck_thunder_grey_black" 
		common_truck_texture_params 
	} 
] 
common_deck_graphic_params = 
{ 
	replace = "CS_NSN_board_default.png" 
	replace1 = "CS_NH_board_default.png" 
	in = board 
	in1 = board 
} 
deck_graphic = [ 
	{ 
		desc_id = None 
		frontend_desc = #"Default" 
	} 
	{ 
		desc_id = bh_hawk_mcsqueeb01 
		frontend_desc = #"McSqueeb 01" 
		common_deck_graphic_params 
		with = "textures/custom_boards/bh_hawk_mcsqueeb01" 
	} 
	{ 
		desc_id = bh_hawk_mcsqueeb02 
		frontend_desc = #"McSqueeb 02" 
		common_deck_graphic_params 
		with = "textures/custom_boards/bh_hawk_mcsqueeb02" 
	} 
	{ 
		desc_id = bh_hawk_green 
		frontend_desc = #"Green Hawk" 
		common_deck_graphic_params 
		with = "textures/custom_boards/bh_hawk_green" 
	} 
	{ 
		desc_id = bh_hawk_nfi 
		frontend_desc = #"Tony Hawk WTF" 
		common_deck_graphic_params 
		with = "textures/custom_boards/bh_hawk_nfi" 
	} 
	{ 
		desc_id = bh_team_01 
		frontend_desc = #"Birdhouse Rainbow" 
		common_deck_graphic_params 
		with = "textures/custom_boards/bh_team_01" 
	} 
	{ 
		desc_id = zero_green 
		frontend_desc = #"Zero Green / Purple" 
		common_deck_graphic_params 
		with = "textures/custom_boards/zero_green" 
	} 
	{ 
		desc_id = board_barbq 
		frontend_desc = #"Bar-B-Q" 
		common_deck_graphic_params 
		with = "textures/custom_boards/board_barbq" 
	} 
	{ 
		desc_id = board_birdhouse_man 
		frontend_desc = #"Birdhouse man" 
		common_deck_graphic_params 
		with = "textures/custom_boards/board_birdhouse_man" 
	} 
	{ 
		desc_id = board_girl_erick01 
		frontend_desc = #"Girl Eric Koston 1" 
		common_deck_graphic_params 
		with = "textures/custom_boards/board_girl_erick01" 
	} 
	{ 
		desc_id = board_girl_erick02 
		frontend_desc = #"Girl Eric Koston 2" 
		common_deck_graphic_params 
		with = "textures/custom_boards/board_girl_erick02" 
	} 
	{ 
		desc_id = board_gurl 
		frontend_desc = #"GURL" 
		common_deck_graphic_params 
		with = "textures/custom_boards/board_gurl" 
	} 
	{ 
		desc_id = board_hoopla 
		frontend_desc = #"hoopla" 
		common_deck_graphic_params 
		with = "textures/custom_boards/board_hoopla" 
	} 
	{ 
		desc_id = board_planb_none 
		frontend_desc = #"Plan-B None" 
		common_deck_graphic_params 
		with = "textures/custom_boards/board_planb_none" 
	} 
	{ 
		desc_id = board_rm_hover 
		frontend_desc = #"Rodney Hoverboard" 
		common_deck_graphic_params 
		with = "textures/custom_boards/board_rm_hover" 
	} 
	{ 
		desc_id = board_uber 
		frontend_desc = #"Uber" 
		common_deck_graphic_params 
		with = "textures/custom_boards/board_uber" 
	} 
	{ 
		desc_id = board_colohairgal 
		frontend_desc = #"Colors" 
		common_deck_graphic_params 
		with = "textures/custom_boards/board_colohairgal" 
	} 
	{ 
		desc_id = board_fur 
		frontend_desc = #"Fur" 
		common_deck_graphic_params 
		with = "textures/custom_boards/board_fur" 
	} 
	{ 
		desc_id = board_tiger 
		frontend_desc = #"Tiger" 
		common_deck_graphic_params 
		with = "textures/custom_boards/board_tiger" 
	} 
	{ 
		desc_id = board_zebra 
		frontend_desc = #"Zebra" 
		common_deck_graphic_params 
		with = "textures/custom_boards/board_zebra" 
	} 
	{ 
		desc_id = Enjoi_TiedyePanda 
		frontend_desc = #"Enjoi Tiedye Panda" 
		common_deck_graphic_params 
		with = "textures/custom_boards/Enjoi_TiedyePanda" 
	} 
	{ 
		desc_id = Element_MeltedBlue 
		frontend_desc = #"Element Melted Blue" 
		common_deck_graphic_params 
		with = "textures/custom_boards/Element_MeltedBlue" 
	} 
	{ 
		desc_id = Baker_ToxicCloud 
		frontend_desc = #"Baker Toxic Cloud" 
		common_deck_graphic_params 
		with = "textures/custom_boards/Baker_ToxicCloud" 
	} 
	{ 
		desc_id = Baker_Braydon 
		frontend_desc = #"Baker Braydon" 
		common_deck_graphic_params 
		with = "textures/custom_boards/Baker_Braydon" 
	} 
	{ 
		desc_id = deck_graphic_thug2 
		frontend_desc = #"THUG2" 
	} 
	{ 
		desc_id = board_thugpro 
		frontend_desc = #"THUG Pro" 
		common_deck_graphic_params 
		with = "textures/custom_boards/board_thugpro" 
	} 
	{ 
		desc_id = board_al_lewis 
		frontend_desc = #"Almost Lewis" 
		common_deck_graphic_params 
		with = "textures/custom_boards/board_al_lewis" 
	} 
	{ 
		desc_id = board_ho_bsch 
		frontend_desc = #"HookUps" 
		common_deck_graphic_params 
		with = "textures/custom_boards/board_ho_bsch" 
	} 
	{ 
		desc_id = board_flo 
		frontend_desc = #"FLO" 
		common_deck_graphic_params 
		with = "textures/custom_boards/board_flo" 
	} 
	{ 
		desc_id = board_jofswc 
		frontend_desc = #"jofswc" 
		common_deck_graphic_params 
		with = "textures/custom_boards/board_jofswc" 
	} 
	{ 
		desc_id = board_pb_skull01 
		frontend_desc = #"Plan B Skull 01" 
		common_deck_graphic_params 
		with = "textures/custom_boards/board_pb_skull01" 
	} 
	{ 
		desc_id = board_pb_skull02 
		frontend_desc = #"Plan B Skull 02" 
		common_deck_graphic_params 
		with = "textures/custom_boards/board_pb_skull02" 
	} 
	{ 
		desc_id = board_sup_royal 
		frontend_desc = #"Royal" 
		common_deck_graphic_params 
		with = "textures/custom_boards/board_sup_royal" 
	} 
	{ 
		desc_id = board_blvd 
		frontend_desc = #"BLVD." 
		common_deck_graphic_params 
		with = "textures/custom_boards/board_blvd" 
	} 
	{ 
		desc_id = board_kfd_zomb01 
		frontend_desc = #"KFD Zombie 1" 
		common_deck_graphic_params 
		with = "textures/custom_boards/board_kfd_zomb01" 
	} 
	{ 
		desc_id = board_kfd_zomb02 
		frontend_desc = #"KFD Zombie 2" 
		common_deck_graphic_params 
		with = "textures/custom_boards/board_kfd_zomb02" 
	} 
	{ 
		desc_id = board_kfd_zomb03 
		frontend_desc = #"KFD Zombie 3" 
		common_deck_graphic_params 
		with = "textures/custom_boards/board_kfd_zomb03" 
	} 
	{ 
		desc_id = board_enjoi_panda 
		frontend_desc = #"Enjoi Panda" 
		common_deck_graphic_params 
		with = "textures/custom_boards/board_enjoi_panda" 
	} 
	{ 
		desc_id = board_bh_jaws 
		frontend_desc = #"Birdhouse JAWS" 
		common_deck_graphic_params 
		with = "textures/custom_boards/board_bh_jaws" 
	} 
	{ 
		desc_id = board_blanbredblue 
		frontend_desc = #"Plan-B - White / Red / Blue" 
		common_deck_graphic_params 
		with = "textures/custom_boards/board_blanbredblue" 
	} 
	{ 
		desc_id = board_bk_figgy 
		frontend_desc = #"BAKER Figgy" 
		common_deck_graphic_params 
		with = "textures/custom_boards/board_bk_figgy" 
	} 
	{ 
		desc_id = board_el_wwfe 
		frontend_desc = #"Element HD" 
		common_deck_graphic_params 
		with = "textures/custom_boards/board_el_wwfe" 
	} 
	{ 
		desc_id = board_th4_eyefam 
		frontend_desc = #"Family" 
		common_deck_graphic_params 
		with = "textures/custom_boards/board_th4_eyefam" 
	} 
	{ 
		desc_id = %"AL Deck 1" 
		frontend_desc = #"Almost 1" 
		common_deck_graphic_params 
		with = "textures/boards/Al_Mullen01" 
	} 
	{ 
		desc_id = %"AL Deck 2" 
		frontend_desc = #"Almost 2" 
		common_deck_graphic_params 
		with = "textures/boards/Al_sheckler01" 
	} 
	{ 
		desc_id = %"AL Deck 3" 
		frontend_desc = #"Almost 3" 
		common_deck_graphic_params 
		with = "textures/boards/Al_team01" 
	} 
	{ 
		desc_id = %"AL Deck 4" 
		frontend_desc = #"Almost 4" 
		common_deck_graphic_params 
		with = "textures/boards/Al_team02" 
	} 
	{ 
		desc_id = %"AL Deck 5" 
		frontend_desc = #"Almost 5" 
		common_deck_graphic_params 
		with = "textures/boards/Al_team03" 
	} 
	{ 
		desc_id = %"AL Deck 6" 
		frontend_desc = #"Almost 6" 
		common_deck_graphic_params 
		with = "textures/boards/Al_team04" 
	} 
	{ 
		desc_id = %"BH Deck 1" 
		frontend_desc = #"Birdhouse 1" 
		common_deck_graphic_params 
		with = "textures/boards/BH_hawk01" 
	} 
	{ 
		desc_id = %"BH Deck 2" 
		frontend_desc = #"Birdhouse 2" 
		common_deck_graphic_params 
		with = "textures/boards/BH_team01" 
	} 
	{ 
		desc_id = %"BH Deck 3" 
		frontend_desc = #"Birdhouse 3" 
		common_deck_graphic_params 
		with = "textures/boards/BH_team02" 
	} 
	{ 
		desc_id = %"BH Deck 4" 
		frontend_desc = #"Birdhouse 4" 
		common_deck_graphic_params 
		with = "textures/boards/BH_team03" 
	} 
	{ 
		desc_id = %"BH Deck 5" 
		frontend_desc = #"Birdhouse 5" 
		common_deck_graphic_params 
		with = "textures/boards/BH_team04" 
	} 
	{ 
		desc_id = %"EL Deck 1" 
		frontend_desc = #"Element 1" 
		common_deck_graphic_params 
		with = "textures/boards/el_margera01" 
	} 
	{ 
		desc_id = %"EL Deck 2" 
		frontend_desc = #"Element 2" 
		common_deck_graphic_params 
		with = "textures/boards/el_vallely01" 
	} 
	{ 
		desc_id = %"EL Deck 3" 
		frontend_desc = #"Element 3" 
		common_deck_graphic_params 
		with = "textures/boards/el_team01" 
	} 
	{ 
		desc_id = %"EL Deck 4" 
		frontend_desc = #"Element 4" 
		common_deck_graphic_params 
		with = "textures/boards/el_team02" 
	} 
	{ 
		desc_id = %"EL Deck 5" 
		frontend_desc = #"Element 5" 
		common_deck_graphic_params 
		with = "textures/boards/el_team03" 
	} 
	{ 
		desc_id = %"EL Deck 6" 
		frontend_desc = #"Element 6" 
		common_deck_graphic_params 
		with = "textures/boards/el_team04" 
	} 
	{ 
		desc_id = %"GR Deck 1" 
		frontend_desc = #"Girl 1" 
		common_deck_graphic_params 
		with = "textures/boards/Gi_koston01" 
	} 
	{ 
		desc_id = %"GR Deck 2" 
		frontend_desc = #"Girl 2" 
		common_deck_graphic_params 
		with = "textures/boards/Gi_team01" 
	} 
	{ 
		desc_id = %"GR Deck 3" 
		frontend_desc = #"Girl 3" 
		common_deck_graphic_params 
		with = "textures/boards/Gi_team02" 
	} 
	{ 
		desc_id = %"GR Deck 4" 
		frontend_desc = #"Girl 4" 
		common_deck_graphic_params 
		with = "textures/boards/Gi_team03" 
	} 
	{ 
		desc_id = %"GR Deck 5" 
		frontend_desc = #"Girl 5" 
		common_deck_graphic_params 
		with = "textures/boards/Gi_team04" 
	} 
	{ 
		desc_id = %"OS Deck 1" 
		frontend_desc = #"Old Star 1" 
		common_deck_graphic_params 
		with = "textures/boards/os_weeman01" 
	} 
	{ 
		desc_id = %"OS Deck 2" 
		frontend_desc = #"Old Star 2" 
		common_deck_graphic_params 
		with = "textures/boards/os_team01" 
	} 
	{ 
		desc_id = %"RDS Deck 1" 
		frontend_desc = #"RDS 1" 
		common_deck_graphic_params 
		with = "textures/boards/rd_team01" 
	} 
	{ 
		desc_id = %"RDS Deck 2" 
		frontend_desc = #"RDS 2" 
		common_deck_graphic_params 
		with = "textures/boards/rd_team02" 
	} 
	{ 
		desc_id = %"RDS Deck 3" 
		frontend_desc = #"RDS 3" 
		common_deck_graphic_params 
		with = "textures/boards/rd_team03" 
	} 
	{ 
		desc_id = %"SH Deck 1" 
		frontend_desc = #"Shorty\'s 1" 
		common_deck_graphic_params 
		with = "textures/boards/sh_muska01" 
	} 
	{ 
		desc_id = %"SH Deck 2" 
		frontend_desc = #"Shorty\'s 2" 
		common_deck_graphic_params 
		with = "textures/boards/SH_team01" 
	} 
	{ 
		desc_id = %"SH Deck 3" 
		frontend_desc = #"Shorty\'s 3" 
		common_deck_graphic_params 
		with = "textures/boards/SH_team02" 
	} 
	{ 
		desc_id = %"SH Deck 4" 
		frontend_desc = #"Shorty\'s 4" 
		common_deck_graphic_params 
		with = "textures/boards/SH_team03" 
	} 
	{ 
		desc_id = %"SH Deck 5" 
		frontend_desc = #"Shorty\'s 5" 
		common_deck_graphic_params 
		with = "textures/boards/SH_team04" 
	} 
	{ 
		desc_id = %"Fi Deck 1" 
		frontend_desc = #"The Firm 1" 
		common_deck_graphic_params 
		with = "textures/boards/Fi_burnquist01" 
	} 
	{ 
		desc_id = %"Fi Deck 2" 
		frontend_desc = #"The Firm 2" 
		common_deck_graphic_params 
		with = "textures/boards/Fi_team01" 
	} 
	{ 
		desc_id = %"Do Deck 1" 
		frontend_desc = #"The Doors" 
		common_deck_graphic_params 
		with = "textures/boards/MU_doors01" 
	} 
	{ 
		desc_id = %"Me Deck 1" 
		frontend_desc = #"Metallica" 
		common_deck_graphic_params 
		with = "textures/boards/MU_metallica01" 
	} 
	{ 
		desc_id = bh_jole_cats 
		frontend_desc = #"Kitty Cats" 
		common_deck_graphic_params 
		with = "textures/custom_boards/board_cats" 
	} 
	{ 
		desc_id = bh_jole_bunny 
		frontend_desc = #"Bunny" 
		common_deck_graphic_params 
		with = "textures/custom_boards/board_bunny" 
	} 
] 
common_griptape_params = 
{ 
	replace = "CS_NSN_griptape_default.png" 
	replace1 = "OllieG01.png" 
	replace2 = "GenericG07.png" 
	in = board 
	in1 = board 
	in2 = board 
} 
griptape = [ 
	{ 
		desc_id = griptape_default 
		frontend_desc = #"Default" 
	} 
	{ 
		desc_id = tape_hd 
		frontend_desc = #"HD GripTape" 
		common_griptape_params 
		with = "textures/custom_boards/tape_hd" 
	} 
	{ 
		desc_id = tape_actualhd 
		frontend_desc = #"Actual HD GripTape" 
		common_griptape_params 
		with = "textures/custom_boards/tape_actualhd" 
	} 
	{ 
		desc_id = grip_generic04 
		frontend_desc = #"White" 
		common_griptape_params 
		with = "textures/custom_boards/grip_generic04" 
	} 
	{ 
		desc_id = %"Generic 1" 
		frontend_desc = #"Generic Cut" 
		common_griptape_params 
		with = "textures/boards/Tape_Generic_01" 
		is_a_deck = is_a_deck 
	} 
	{ 
		desc_id = %"Generic 2" 
		frontend_desc = #"Solid" 
		common_griptape_params 
		with = "textures/boards/Tape_Generic_02" 
	} 
	{ 
		desc_id = %"Generic 3" 
		frontend_desc = #"Razor\'s Edge" 
		common_griptape_params 
		with = "textures/boards/Tape_Generic_03" 
	} 
	{ 
		desc_id = %"Generic 4" 
		frontend_desc = #"Equal" 
		common_griptape_params 
		with = "textures/boards/Tape_Generic_04" 
	} 
	{ 
		desc_id = %"Generic 5" 
		frontend_desc = #"Slasher" 
		common_griptape_params 
		with = "textures/boards/Tape_Generic_05" 
	} 
	{ 
		desc_id = %"Generic 7" 
		frontend_desc = #"Ye Old School" 
		common_griptape_params 
		with = "textures/boards/Tape_Generic_07" 
	} 
	{ 
		desc_id = %"Generic 8" 
		frontend_desc = #"Striper" 
		common_griptape_params 
		with = "textures/boards/Tape_Generic_08" 
	} 
	{ 
		desc_id = %"Generic 9" 
		frontend_desc = #"Thrashed" 
		common_griptape_params 
		with = "textures/boards/Tape_Generic_09" 
	} 
	{ 
		desc_id = %"Generic 10" 
		frontend_desc = #"Colored Nuts" 
		common_griptape_params 
		with = "textures/boards/Tape_Generic_10" 
	} 
	{ 
		desc_id = %"Generic 11" 
		frontend_desc = #"Green Machine" 
		common_griptape_params 
		with = "textures/boards/Tape_Generic_11" 
	} 
	{ 
		desc_id = %"Generic 12" 
		frontend_desc = #"Blues" 
		common_griptape_params 
		with = "textures/boards/Tape_Generic_12" 
	} 
	{ 
		desc_id = %"Generic 13" 
		frontend_desc = #"Red Light" 
		common_griptape_params 
		with = "textures/boards/Tape_Generic_13" 
	} 
	{ 
		desc_id = %"Generic 14" 
		frontend_desc = #"Crack" 
		common_griptape_params 
		with = "textures/boards/Tape_Generic_14" 
	} 
	{ 
		desc_id = %"Generic 15" 
		frontend_desc = #"Eye Don\'t Know" 
		common_griptape_params 
		with = "textures/boards/Tape_Generic_15" 
	} 
	{ 
		desc_id = %"Generic 16" 
		frontend_desc = #"NS Single Eye" 
		common_griptape_params 
		with = "textures/boards/Tape_Generic_16" 
	} 
	{ 
		desc_id = %"Generic 17" 
		frontend_desc = #"The Bat" 
		common_griptape_params 
		with = "textures/boards/Tape_Generic_17" 
	} 
	{ 
		desc_id = %"Generic 18" 
		frontend_desc = #"Right Thrashed" 
		common_griptape_params 
		with = "textures/boards/Tape_Generic_18" 
	} 
	{ 
		desc_id = %"Hawk 1" 
		frontend_desc = #"Hawk" 
		common_griptape_params 
		with = "textures/boards/Tape_Hawk_01" 
	} 
	{ 
		desc_id = %"Koston 1" 
		frontend_desc = #"Koston" 
		common_griptape_params 
		with = "textures/boards/Tape_Koston_01" 
	} 
	{ 
		desc_id = %"Mullen 1" 
		frontend_desc = #"Mullen" 
		common_griptape_params 
		with = "textures/boards/Tape_Mullen_01" 
	} 
	{ 
		desc_id = %"Muska 1" 
		frontend_desc = #"Muska" 
		common_griptape_params 
		with = "textures/boards/Tape_Muska_01" 
	} 
	{ 
		desc_id = %"Sheckler 1" 
		frontend_desc = #"Sheckler" 
		common_griptape_params 
		with = "textures/boards/Tape_Sheckler_01" 
	} 
] 

