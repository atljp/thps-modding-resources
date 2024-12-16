
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

SKATER_SELECT_MENUS = 
[ 
	{ 
		menu_name = pro 
		menu_array = new_skater_select_list 
		menu_title = "PRO SKATERS (1/4)" 
	} 
	{ 
		menu_name = story 
		menu_array = story_skater_select_list 
		menu_title = "STORY SKATERS (2/4)" 
	} 
	{ 
		menu_name = secret 
		menu_array = secret_skater_select_list 
		menu_title = "SECRET SKATERS (3/4)" 
	} 
	{ 
		menu_name = ped 
		menu_array = ped_skater_select_list 
		menu_title = "PEDESTRIANS / MISC (4/4)" 
	} 
] 
story_skater_select_list = 
[ 
	{ 
		new_display_name = "Eric Sparrow" 
		skater_index = 29 
		sub_menu = [ 
			{ 
				display_name = "Eric Sparrow" 
				default_appearance = appearance_sparrow 
				skater_index = 29 
			} 
			{ 
				display_name = "Eric Sparrow (THUG)" 
				default_appearance = appearance_sparrow_thug 
			} 
		] 
	} 
	{ 
		new_display_name = "Todd" 
		new_name = Todd 
		new_default_appearance = Ped_Todd 
		tag_texture = "tags\\tag_thugpro" 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_behavior_script = SS_Behavior_GenericPed 
		no_board 
		skater_index = 30 
	} 
	{ 
		new_display_name = "Paulie Ryan" 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_behavior_script = SS_Behavior_GenericPed 
		no_board 
		skater_index = 18 
	} 
	{ 
		new_display_name = "Nigel Beaverhausen" 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_behavior_script = SS_Behavior_FatGuy 
		no_board 
		skater_index = 21 
	} 
	{ 
		new_display_name = "Jesse James" 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_behavior_script = SS_Behavior_GenericPed 
		no_board 
		skater_index = 12 
	} 
	{ 
		new_display_name = "Steve-O" 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_behavior_script = SS_Behavior_GenericPed 
		no_board 
		skater_index = 15 
	} 
	{ 
		new_display_name = "Phil Margera" 
		new_name = PhilGagged 
		new_default_appearance = Phil_FULL 
		tag_texture = "tags\\phil_01" 
		new_board_type = default 
		new_deck_graphic = %"EL Deck 4" 
		skater_behavior_script = SS_Behavior_FatGuy 
		no_board 
		skater_index = 30 
		sub_menu = [ 
			{ 
				display_name = "Phil Margera" 
				default_appearance = Phil_FULL 
				tag_texture = "tags\\phil_01" 
				new_board_type = default 
				new_deck_graphic = %"EL Deck 4" 
				no_board 
			} 
			{ 
				display_name = "Phil Margera" 
				default_appearance = Phil_Gagged 
				tag_texture = "tags\\phil_01" 
				new_board_type = default 
				new_deck_graphic = %"EL Deck 4" 
				no_board 
			} 
		] 
	} 
	{ 
		new_display_name = "Ben Franklin" 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_behavior_script = SS_Behavior_GenericPed 
		no_board 
		skater_index = 10 
	} 
	{ 
		new_display_name = "Bullfighter" 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_behavior_script = SS_Behavior_GenericPed 
		no_board 
		skater_index = 13 
	} 
	{ 
		new_display_name = "Graffiti Tagger" 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_behavior_script = SS_Behavior_GenericPed 
		no_board 
		skater_index = 16 
	} 
	{ 
		new_display_name = "Shrimp Vendor" 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_behavior_script = SS_Behavior_GenericPed 
		no_board 
		skater_index = 19 
		sub_menu = [ 
			{ 
				display_name = "Shrimp Vendor" 
				default_appearance = Ped_ShrimpVendor 
				tag_texture = "tags\\shr_01" 
				new_board_type = default 
				new_deck_graphic = board_thugpro 
				skater_behavior_script = SS_Behavior_GenericPed 
				no_board 
			} 
			{ 
				display_name = "Wiener Vendor" 
				default_appearance = Ped_Wienerman 
				tag_texture = "tags\\wiener_man" 
				new_board_type = default 
				new_deck_graphic = board_thugpro 
				skater_behavior_script = SS_Behavior_GenericPed 
				no_board 
			} 
			{ 
				display_name = "Bratwurst Vendor" 
				default_appearance = Ped_Bratwurst 
				tag_texture = "tags\\brat_vendor" 
				new_board_type = default 
				new_deck_graphic = board_thugpro 
				skater_behavior_script = SS_Behavior_GenericPed 
				no_board 
			} 
			{ 
				display_name = "Corn Vendor" 
				default_appearance = Ped_Corn_Vendor_01 
				tag_texture = "tags\\corn_vendor" 
				new_board_type = default 
				new_deck_graphic = board_thugpro 
				skater_behavior_script = SS_Behavior_GenericPed 
				no_board 
			} 
		] 
	} 
	{ 
		new_display_name = "Aborigine" 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_behavior_script = SS_Behavior_GenericPed 
		no_board 
		skater_index = 20 
	} 
	{ 
		new_display_name = "Jester" 
		skater_index = 22 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_behavior_script = SS_Behavior_Jester 
		no_board 
	} 
	{ 
		new_display_name = "Voodoo Doctor" 
		skater_index = 23 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_behavior_script = SS_Behavior_GenericPed 
		no_board 
	} 
	{ 
		new_display_name = "Bigfoot" 
		new_board_type = chainsaw 
		skater_index = 24 
		skater_behavior_script = SS_Behavior_GenericPed 
		no_board 
		sub_menu = [ 
			{ 
				display_name = "Bigfoot" 
				default_appearance = Ped_Bigfoot 
				tag_texture = "tags\\bigfoot" 
				new_board_type = chainsaw 
			} 
			{ 
				display_name = "Bigfoot One" 
				default_appearance = Ped_Bigfoot_graf 
				tag_texture = "tags\\bigfoot_1" 
				new_board_type = chainsaw 
			} 
		] 
	} 
] 
secret_skater_select_list = 
[ 
	{ 
		new_display_name = "Shrek" 
		skater_index = 27 
		new_deck_graphic = board_thugpro 
		skater_behavior_script = SS_Behavior_GenericPed 
	} 
	{ 
		new_display_name = "C.o.D. Soldier" 
		no_board 
		skater_index = 28 
		new_deck_graphic = board_thugpro 
		skater_behavior_script = SS_Behavior_GenericPed 
	} 
	{ 
		new_display_name = "The Hand" 
		no_board 
		skater_index = 26 
		new_deck_graphic = board_thugpro 
		skater_behavior_script = SS_Behavior_GenericPed 
	} 
	{ 
		new_display_name = "Nick" 
		new_name = NickSecretGuy 
		new_default_appearance = appearance_Nick_SecretGuy 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_behavior_script = SS_Behavior_GenericPed 
		no_board 
		skater_index = 30 
	} 
	{ 
		new_display_name = "Price" 
		new_name = PriceSecretGuy 
		new_default_appearance = appearance_Price_SecretGuy 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_behavior_script = SS_Behavior_GenericPed 
		no_board 
		tag_texture = "tags\\tag_thugpro" 
		skater_index = 30 
	} 
	{ 
		new_display_name = "" 
		is_separator 
	} 
	{ 
		new_display_name = "Gene Simmons" 
		skater_index = 31 
		skater_behavior_script = SS_Behavior_GeneSimmons 
		no_board 
	} 
	{ 
		new_display_name = "Iron Man" 
		skater_index = 32 
		skater_behavior_script = SS_Behavior_IronMan 
		no_board 
	} 
	{ 
		new_display_name = "T.H.U.D." 
		skater_index = 33 
		skater_behavior_script = SS_Behavior_GenericPed 
		no_board 
	} 
	{ 
		new_display_name = "" 
		is_separator 
	} 
	{ 
		new_display_name = "Eddie" 
		new_name = Eddie 
		new_default_appearance = appearance_Eddie 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_behavior_script = SS_Behavior_GenericPed 
		no_board 
		tag_texture = "tags\\tag_thugpro" 
		skater_index = 30 
	} 
	{ 
		new_display_name = "Jango" 
		new_name = Jango 
		new_default_appearance = appearance_Jango 
		new_board_type = Jango 
		new_deck_graphic = board_thugpro 
		skater_behavior_script = SS_Behavior_GenericPed 
		tag_texture = "tags\\tag_thugpro" 
		skater_index = 30 
	} 
	{ 
		new_display_name = "Daisy" 
		new_name = Daisy 
		new_default_appearance = appearance_Daisy 
		new_board_type = banana 
		tag_texture = "tags\\tag_thugpro" 
		is_female = 1 
		skater_index = 30 
		skater_behavior_script = SS_Behavior_Daisy 
	} 
	{ 
		new_display_name = "" 
		is_separator 
	} 
	{ 
		new_display_name = "Darth Maul" 
		new_name = %"Darth Maul" 
		new_board_type = hover 
		new_deck_graphic = board_thugpro 
		skater_behavior_script = SS_Behavior_GenericPed 
		no_board 
		tag_texture = "tags\\tag_thugpro" 
		skater_index = 44 
	} 
	{ 
		new_display_name = "Wolverine" 
		new_name = Wolverine 
		new_default_appearance = appearance_Wolverine 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_behavior_script = SS_Behavior_GenericPed 
		no_board 
		tag_texture = "tags\\tag_thugpro" 
		skater_index = 30 
	} 
	{ 
		new_display_name = "Officer Dick" 
		new_name = %"Officer Dick" 
		new_default_appearance = appearance_OfficerDick 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_behavior_script = SS_Behavior_Cop 
		no_board 
		tag_texture = "tags\\tag_thugpro" 
		skater_index = 30 
	} 
	{ 
		new_display_name = "Private Carrera" 
		new_name = %"Private Carrera" 
		new_default_appearance = appearance_PrivateCarrera 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_behavior_script = SS_Behavior_GenericPed 
		tag_texture = "tags\\tag_thugpro" 
		is_female = 1 
		skater_index = 30 
		skater_behavior_script = SS_Behavior_Daisy 
	} 
	{ 
		new_display_name = "Ollie The Magic Bum" 
		new_name = %"Ollie The Magic Bum" 
		new_default_appearance = appearance_OllieTheMagicBum 
		new_board_type = board_ollie 
		tag_texture = "tags\\tag_thugpro" 
		skater_behavior_script = SS_Behavior_GenericPed 
		skater_index = 30 
	} 
	{ 
		new_display_name = "Kelly Slater" 
		new_name = KellySlater 
		new_default_appearance = appearance_KellySlater 
		new_board_type = board_slater 
		skater_behavior_script = SS_Behavior_GenericPed 
		tag_texture = "tags\\tag_thugpro" 
		skater_index = 30 
	} 
	{ 
		new_display_name = "Demoness" 
		new_name = Demoness 
		new_default_appearance = appearance_Demoness 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_behavior_script = SS_Behavior_GenericPed 
		no_board 
		tag_texture = "tags\\tag_thugpro" 
		is_female = 1 
		skater_index = 30 
	} 
	{ 
		new_display_name = "Neversoft Eyeball" 
		new_name = %"Neversoft Eyeball" 
		new_default_appearance = appearance_NeversoftEyeball 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		tag_texture = "tags\\tag_thugpro" 
		skater_behavior_script = SS_Behavior_GenericPed 
		no_board 
		skater_index = 30 
	} 
	{ 
		new_display_name = "Doom Guy" 
		new_name = %"Doom Guy" 
		new_default_appearance = appearance_DoomGuy 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_behavior_script = SS_Behavior_GenericPed 
		no_board 
		tag_texture = "tags\\doo_01" 
		skater_index = 30 
	} 
	{ 
		new_display_name = "X Ray" 
		new_name = %"X Ray" 
		new_default_appearance = appearance_xray 
		new_board_type = board_xray 
		tag_texture = "tags\\tag_thugpro" 
		skater_behavior_script = SS_Behavior_GenericPed 
		skater_index = 30 
	} 
] 
ped_skater_select_list = 
[ 
	{ 
		new_display_name = "Alien" 
		new_name = Alien 
		new_default_appearance = Ped_Alien 
		tag_texture = "tags\\alien" 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_behavior_script = SS_Behavior_GenericPed 
		no_board 
		skater_index = 30 
		sub_menu = [ 
			{ 
				display_name = "Alien" 
				default_appearance = Ped_Alien 
				tag_texture = "tags\\alien" 
				new_board_type = default 
				new_deck_graphic = board_thugpro 
				skater_behavior_script = SS_Behavior_GenericPed 
				no_board 
			} 
			{ 
				display_name = "Alien Doctor" 
				default_appearance = Ped_AlienDoctor 
				tag_texture = "tags\\alien_dr" 
				new_board_type = default 
				new_deck_graphic = board_thugpro 
				skater_behavior_script = SS_Behavior_GenericPed 
				no_board 
			} 
			{ 
				display_name = "Alien Leader" 
				default_appearance = Ped_AlienLeader 
				tag_texture = "tags\\alien_leader" 
				new_board_type = default 
				new_deck_graphic = board_thugpro 
				skater_behavior_script = SS_Behavior_GenericPed 
				no_board 
			} 
		] 
	} 
	{ 
		new_display_name = "Australian Cop" 
		new_name = copaussie 
		new_default_appearance = Ped_copaussie 
		tag_texture = "tags\\OZ_cop" 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_behavior_script = SS_Behavior_Cop 
		no_board 
		skater_index = 30 
	} 
	{ 
		new_display_name = "Beach Goer" 
		new_name = beachgoer 
		new_default_appearance = Ped_BeachGoer01 
		tag_texture = "tags\\tag_thugpro" 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_behavior_script = SS_Behavior_FatGuy 
		no_board 
		skater_index = 30 
	} 
	{ 
		new_display_name = "Boat Captain" 
		new_name = boatcaptain 
		new_default_appearance = Ped_boatcaptain 
		tag_texture = "tags\\boat_capt" 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_behavior_script = SS_Behavior_GenericPed 
		no_board 
		skater_index = 30 
	} 
	{ 
		new_display_name = "Bodyguard" 
		new_name = Bodyguard 
		new_default_appearance = Ped_Bodyguard 
		tag_texture = "tags\\tag_thugpro" 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_behavior_script = SS_Behavior_Cop 
		no_board 
		skater_index = 30 
	} 
	{ 
		new_display_name = "Boston Guy" 
		new_name = BostonGuy 
		new_default_appearance = Ped_BostonGuy 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_behavior_script = SS_Behavior_FatGuy 
		no_board 
		skater_index = 30 
	} 
	{ 
		new_display_name = "Boxer" 
		new_name = Boxer 
		new_default_appearance = Ped_Boxer 
		tag_texture = "tags\\boxer" 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_behavior_script = SS_Behavior_GenericPed 
		no_board 
		skater_index = 30 
	} 
	{ 
		new_display_name = "Camera Man" 
		new_name = CameraMan 
		new_default_appearance = Ped_CameraMan 
		tag_texture = "tags\\camera_man" 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_behavior_script = SS_Behavior_GenericPed 
		no_board 
		skater_index = 30 
		sub_menu = [ 
			{ 
				display_name = "Camera Man" 
				default_appearance = Ped_CameraMan 
				tag_texture = "tags\\camera_man" 
				new_board_type = default 
				new_deck_graphic = board_thugpro 
				skater_behavior_script = SS_Behavior_GenericPed 
				no_board 
			} 
			{ 
				display_name = "Camera Man" 
				default_appearance = Ped_Video 
				tag_texture = "tags\\camera_man" 
				new_board_type = default 
				new_deck_graphic = board_thugpro 
				skater_behavior_script = SS_Behavior_GenericPed 
				no_board 
			} 
		] 
	} 
	{ 
		new_display_name = "Construction Worker" 
		new_name = Construction_Worker_01 
		new_default_appearance = Ped_Construction_Worker_01 
		tag_texture = "tags\\construction_worker" 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_behavior_script = SS_Behavior_FatGuy 
		no_board 
		skater_index = 30 
	} 
	{ 
		new_display_name = "Cut Chemist" 
		new_name = CutChemist 
		new_default_appearance = Ped_CutChemist 
		tag_texture = "tags\\cut_chemist" 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_behavior_script = SS_Behavior_GenericPed 
		no_board 
		skater_index = 30 
	} 
	{ 
		new_display_name = "Flute Player" 
		new_name = FluteGuy 
		new_default_appearance = Ped_FluteGuy 
		tag_texture = "tags\\flute_player" 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_behavior_script = SS_Behavior_FatGuy 
		no_board 
		skater_index = 30 
	} 
	{ 
		new_display_name = "Geeky Kid" 
		new_name = Nerdkid 
		new_default_appearance = Ped_Nerdkid 
		tag_texture = "tags\\geeky_kid" 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_behavior_script = SS_Behavior_StarWars 
		no_board 
		skater_index = 30 
	} 
	{ 
		new_display_name = "German Cop" 
		new_name = germancop 
		new_default_appearance = Ped_germancop 
		tag_texture = "tags\\german_cop" 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_behavior_script = SS_Behavior_FatGuy 
		no_board 
		skater_index = 30 
	} 
	{ 
		new_display_name = "German Drunk" 
		new_name = germandrunk 
		new_default_appearance = Ped_germandrunk 
		tag_texture = "tags\\german_drunk_1" 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_behavior_script = SS_Behavior_GenericPed 
		no_board 
		skater_index = 30 
		sub_menu = [ 
			{ 
				display_name = "German Drunk" 
				default_appearance = Ped_germandrunk 
				tag_texture = "tags\\german_drunk_1" 
				new_board_type = default 
				new_deck_graphic = board_thugpro 
				skater_behavior_script = SS_Behavior_GenericPed 
				no_board 
			} 
			{ 
				display_name = "German Drunk 2" 
				default_appearance = Ped_germandrunk01 
				tag_texture = "tags\\german_drunk_2" 
				new_board_type = default 
				new_deck_graphic = board_thugpro 
				skater_behavior_script = SS_Behavior_GenericPed 
				no_board 
			} 
			{ 
				display_name = "German Drunk 3" 
				default_appearance = Ped_germandrunk02 
				tag_texture = "tags\\german_drunk_3" 
				new_board_type = default 
				new_deck_graphic = board_thugpro 
				skater_behavior_script = SS_Behavior_GenericPed 
				no_board 
			} 
		] 
	} 
	{ 
		new_display_name = "Graffiti Punk" 
		new_name = Grafiti_Punker_01 
		new_default_appearance = Ped_Grafiti_Punker_01 
		tag_texture = "tags\\graffiti_punk" 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_behavior_script = SS_Behavior_GenericPed 
		no_board 
		skater_index = 30 
	} 
	{ 
		new_display_name = "Guitar Player" 
		new_name = guitarist 
		new_default_appearance = Ped_guitarist 
		tag_texture = "tags\\guitarist" 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_behavior_script = SS_Behavior_GenericPed 
		no_board 
		skater_index = 30 
	} 
	{ 
		new_display_name = "Horn Player" 
		new_name = jazzman1 
		new_default_appearance = Ped_jazzman1 
		tag_texture = "tags\\horn_player" 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_behavior_script = SS_Behavior_FatGuy 
		no_board 
		skater_index = 30 
	} 
	{ 
		new_display_name = "Hospital Attendant" 
		new_name = attendant 
		new_default_appearance = Ped_attendant 
		tag_texture = "tags\\attendant" 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_behavior_script = SS_Behavior_GenericPed 
		no_board 
		skater_index = 30 
	} 
	{ 
		new_display_name = "Imp" 
		new_name = Imp 
		new_default_appearance = Ped_Imp 
		tag_texture = "tags\\imp" 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_behavior_script = SS_Behavior_GenericPed 
		no_board 
		skater_index = 30 
	} 
	{ 
		new_display_name = "Inline Skater" 
		new_name = rollerblader 
		new_default_appearance = Ped_rollerblader 
		tag_texture = "tags\\inline_skater" 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_behavior_script = SS_Behavior_GenericPed 
		no_board 
		skater_index = 30 
	} 
	{ 
		new_display_name = "Johnny Turbo" 
		new_name = Johnny_Turbo 
		new_default_appearance = Ped_JohnnyTurbo 
		tag_texture = "tags\\jam_01" 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_behavior_script = SS_Behavior_GenericPed 
		no_board 
		skater_index = 30 
	} 
	{ 
		new_display_name = "Judge" 
		new_name = Judge 
		new_default_appearance = Ped_Judge 
		tag_texture = "tags\\tag_thugpro" 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_behavior_script = SS_Behavior_GenericPed 
		no_board 
		skater_index = 30 
	} 
	{ 
		new_display_name = "Kenny" 
		new_name = Kenny 
		new_default_appearance = Ped_Kenny 
		tag_texture = "tags\\tag_thugpro" 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_behavior_script = SS_Behavior_GenericPed 
		no_board 
		skater_index = 30 
	} 
	{ 
		new_display_name = "Lifeguard" 
		new_name = Lifeguard 
		new_default_appearance = Ped_Lifeguard 
		tag_texture = "tags\\lifeguard" 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_behavior_script = SS_Behavior_GenericPed 
		no_board 
		skater_index = 30 
	} 
	{ 
		new_display_name = "Lounge Singer" 
		new_name = loungesinger 
		new_default_appearance = Ped_loungesinger 
		tag_texture = "tags\\lounge_singer" 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_behavior_script = SS_Behavior_GenericPed 
		no_board 
		skater_index = 30 
	} 
	{ 
		new_display_name = "Lost Soul" 
		new_name = LostSoul01 
		new_default_appearance = Ped_LostSoul01 
		tag_texture = "tags\\lost_soul_1" 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_behavior_script = SS_Behavior_GenericPed 
		no_board 
		skater_index = 30 
		sub_menu = [ 
			{ 
				display_name = "Lost Soul" 
				default_appearance = Ped_LostSoul01 
				tag_texture = "tags\\lost_soul_1" 
				new_board_type = default 
				new_deck_graphic = board_thugpro 
				skater_behavior_script = SS_Behavior_GenericPed 
				no_board 
			} 
			{ 
				display_name = "Lost Soul 2" 
				default_appearance = Ped_LostSoul02 
				tag_texture = "tags\\lost_soul_2" 
				new_board_type = default 
				new_deck_graphic = board_thugpro 
				skater_behavior_script = SS_Behavior_GenericPed 
				no_board 
			} 
			{ 
				display_name = "Lost Soul 3" 
				default_appearance = Ped_LostSoul03 
				tag_texture = "tags\\lost_soul_3" 
				new_board_type = default 
				new_deck_graphic = board_thugpro 
				skater_behavior_script = SS_Behavior_GenericPed 
				no_board 
			} 
		] 
	} 
	{ 
		new_display_name = "Mayan" 
		new_name = Mayan 
		new_default_appearance = Ped_Mayan 
		tag_texture = "tags\\mayan" 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_behavior_script = SS_Behavior_GenericPed 
		no_board 
		skater_index = 30 
		sub_menu = [ 
			{ 
				display_name = "Mayan" 
				default_appearance = Ped_Mayan 
				tag_texture = "tags\\mayan" 
				new_board_type = default 
				new_deck_graphic = board_thugpro 
				skater_behavior_script = SS_Behavior_GenericPed 
				no_board 
			} 
			{ 
				display_name = "Mayan Tiki Mask" 
				default_appearance = Ped_TikiMan 
				tag_texture = "tags\\mayan_mask" 
				new_board_type = default 
				new_deck_graphic = board_thugpro 
				skater_behavior_script = SS_Behavior_GenericPed 
				no_board 
			} 
		] 
	} 
	{ 
		new_display_name = "Metal Detector Guy" 
		new_name = metaldetector 
		new_default_appearance = Ped_metaldetector 
		tag_texture = "tags\\metal_detector" 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_behavior_script = SS_Behavior_FatGuy 
		no_board 
		skater_index = 30 
	} 
	{ 
		new_display_name = "Mime" 
		new_name = mime 
		new_default_appearance = Ped_mime 
		tag_texture = "tags\\mime" 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_behavior_script = SS_Behavior_GenericPed 
		no_board 
		skater_index = 30 
	} 
	{ 
		new_display_name = "Nurse" 
		new_name = Nurse 
		new_default_appearance = Ped_Nurse_TP 
		tag_texture = "tags\\tag_thugpro" 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_behavior_script = SS_Behavior_GenericPed 
		no_board 
		is_female = 1 
		skater_index = 30 
	} 
	{ 
		new_display_name = "Paramedic" 
		new_name = Paramedic_01 
		new_default_appearance = Ped_Paramedic_01 
		tag_texture = "tags\\paramedic" 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_behavior_script = SS_Behavior_GenericPed 
		no_board 
		skater_index = 30 
	} 
	{ 
		new_display_name = "Pirate" 
		new_name = Pirate 
		new_default_appearance = Ped_Pirate 
		tag_texture = "tags\\pirate" 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_behavior_script = SS_Behavior_GenericPed 
		no_board 
		skater_index = 30 
	} 
	{ 
		new_display_name = "Ramp Kid" 
		new_name = Ramp_Kid_01 
		new_default_appearance = Ped_Ramp_Kid_01 
		tag_texture = "tags\\ramp_kid" 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_behavior_script = SS_Behavior_GenericPed 
		no_board 
		skater_index = 30 
	} 
	{ 
		new_display_name = "Rastapopolous" 
		new_name = Rastapopolous 
		new_default_appearance = appearance_rasta 
		tag_texture = "tags\\tag_thugpro" 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_behavior_script = SS_Behavior_GenericPed 
		no_board 
		skater_index = 30 
	} 
	{ 
		new_display_name = "Revolutionary Soldier" 
		new_name = Soldier_01 
		new_default_appearance = Ped_Soldier_01 
		tag_texture = "tags\\soldier" 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_behavior_script = SS_Behavior_GenericPed 
		no_board 
		skater_index = 30 
	} 
	{ 
		new_display_name = "Security Guard" 
		new_name = Security_Guard_01 
		new_default_appearance = Ped_Security_Guard_01 
		tag_texture = "tags\\security_guard" 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_behavior_script = SS_Behavior_Cop 
		no_board 
		skater_index = 30 
	} 
	{ 
		new_display_name = "Skaboto" 
		new_name = Skaboto 
		new_default_appearance = Ped_Skaboto 
		tag_texture = "tags\\skaboto" 
		new_board_type = board_skaboto 
		skater_behavior_script = SS_Behavior_GenericPed 
		skater_index = 30 
	} 
	{ 
		new_display_name = "Skatopia Punk" 
		new_name = Skatopiaguy 
		new_default_appearance = Ped_Skatopiaguy 
		tag_texture = "tags\\skatopia_punk" 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_behavior_script = SS_Behavior_GenericPed 
		no_board 
		skater_index = 30 
	} 
	{ 
		new_display_name = "Space Monkey (Green)" 
		new_name = dalek 
		new_default_appearance = Ped_dalek 
		tag_texture = "tags\\dalek_1" 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_behavior_script = SS_Behavior_GenericPed 
		no_board 
		skater_index = 30 
		sub_menu = [ 
			{ 
				display_name = "Space Monkey (Green)" 
				default_appearance = Ped_dalek 
				tag_texture = "tags\\dalek_1" 
				new_board_type = default 
				new_deck_graphic = board_thugpro 
				skater_behavior_script = SS_Behavior_GenericPed 
				no_board 
			} 
			{ 
				display_name = "Space Monkey (Pink)" 
				default_appearance = Ped_dalekPink 
				tag_texture = "tags\\dalek_2" 
				new_board_type = default 
				new_deck_graphic = board_thugpro 
				skater_behavior_script = SS_Behavior_GenericPed 
				no_board 
			} 
			{ 
				display_name = "Space Monkey (Blue)" 
				default_appearance = Ped_dalekBlue 
				tag_texture = "tags\\dalek_3" 
				new_board_type = default 
				new_deck_graphic = board_thugpro 
				skater_behavior_script = SS_Behavior_GenericPed 
				no_board 
			} 
		] 
	} 
	{ 
		new_display_name = "Trooper" 
		new_name = Trooper 
		new_default_appearance = Ped_Trooper 
		tag_texture = "tags\\tag_thugpro" 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_behavior_script = SS_Behavior_Cop 
		no_board 
		skater_index = 30 
	} 
	{ 
		new_display_name = "Zombie" 
		new_name = zombie 
		new_default_appearance = Ped_zombiemale01 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_behavior_script = SS_Behavior_GenericPed 
		no_board 
		tag_texture = "tags\\zombie1" 
		skater_index = 30 
		sub_menu = [ 
			{ 
				display_name = "Zombie" 
				default_appearance = Ped_zombiemale01 
				new_board_type = default 
				new_deck_graphic = board_thugpro 
				skater_behavior_script = SS_Behavior_GenericPed 
				no_board 
				tag_texture = "tags\\zombie1" 
			} 
			{ 
				display_name = "Zombie 2" 
				default_appearance = Ped_zombiemale02 
				new_board_type = default 
				new_deck_graphic = board_thugpro 
				skater_behavior_script = SS_Behavior_GenericPed 
				no_board 
				tag_texture = "tags\\zombie2" 
			} 
			{ 
				display_name = "Zombie 3" 
				default_appearance = Ped_zombiefem01 
				new_board_type = default 
				new_deck_graphic = board_thugpro 
				skater_behavior_script = SS_Behavior_GenericPed 
				no_board 
				tag_texture = "tags\\zombie1" 
				is_female = 1 
			} 
		] 
	} 
] 
new_skater_select_list = 
[ 
	{ 
		new_display_name = "Custom Skater" 
		skater_index = 0 
	} 
	{ 
		new_display_name = "Tony Hawk" 
		tag_texture = "tags\\tony_01" 
		skater_index = 1 
		sub_menu = [ 
			{ 
				display_name = "Tony Hawk" 
				default_appearance = appearance_hawk 
				tag_texture = "tags\\tony_01" 
			} 
			{ 
				display_name = "Tony Hawk (THUG)" 
				default_appearance = appearance_hawk_thug 
				tag_texture = "tags\\tony_01" 
			} 
			{ 
				display_name = "Tony Hawk (THPS)" 
				default_appearance = appearance_THPS_Hawk 
				tag_texture = "tags\\thps_01" 
			} 
		] 
	} 
	{ 
		new_display_name = "Bob Burnquist" 
		skater_index = 2 
		sub_menu = [ 
			{ 
				display_name = "Bob Burnquist" 
				default_appearance = appearance_burnquist 
			} 
			{ 
				display_name = "Bob Burnquist (THUG)" 
				default_appearance = appearance_burnquist_thug 
			} 
		] 
	} 
	{ 
		new_display_name = "Steve Caballero" 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_index = 34 
	} 
	{ 
		new_display_name = "Kareem Campbell" 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_index = 35 
	} 
	{ 
		new_display_name = "Rune Glifberg" 
		new_name = Glifberg 
		new_default_appearance = appearance_glifberg_thug 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_index = 36 
	} 
	{ 
		new_display_name = "Natas Kaupas" 
		new_name = kaupas 
		new_default_appearance = Ped_Natas 
		new_board_type = oldschool 
		new_deck_graphic = board_thugpro 
		skater_index = 30 
	} 
	{ 
		new_display_name = "Eric Koston" 
		skater_index = 3 
		sub_menu = [ 
			{ 
				display_name = "Eric Koston" 
				default_appearance = appearance_Koston 
			} 
			{ 
				display_name = "Eric Koston (THUG)" 
				default_appearance = appearance_koston_thug 
			} 
		] 
	} 
	{ 
		new_display_name = "Bucky Lasek" 
		new_name = Lasek 
		new_default_appearance = appearance_lasek_thug 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_index = 37 
	} 
	{ 
		new_display_name = "Bam Margera" 
		skater_index = 4 
		sub_menu = [ 
			{ 
				display_name = "Bam Margera" 
				default_appearance = appearance_margera 
			} 
			{ 
				display_name = "Bam Margera (Masked)" 
				default_appearance = appearance_margera_masked 
			} 
			{ 
				display_name = "Bam Margera (THUG)" 
				default_appearance = appearance_margera_thug 
			} 
		] 
	} 
	{ 
		new_display_name = "Rodney Mullen" 
		skater_index = 5 
		sub_menu = [ 
			{ 
				display_name = "Rodney Mullen" 
				default_appearance = appearance_mullen 
			} 
			{ 
				display_name = "Rodney Mullen (Cutscene)" 
				default_appearance = appearance_mullen_cut 
			} 
			{ 
				display_name = "Rodney Mullen (THUG)" 
				default_appearance = appearance_mullen_thug 
			} 
		] 
	} 
	{ 
		new_display_name = "Chad Muska" 
		skater_index = 6 
		sub_menu = [ 
			{ 
				display_name = "Chad Muska" 
				default_appearance = appearance_muska 
			} 
			{ 
				display_name = "Chad Muska (THUG)" 
				default_appearance = appearance_muska_thug 
			} 
		] 
	} 
	{ 
		new_display_name = "Stacy Peralta" 
		new_name = Peralta 
		new_default_appearance = Ped_Peralta 
		tag_texture = "tags\\tag_thugpro" 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_index = 30 
	} 
	{ 
		new_display_name = "Andrew Reynolds" 
		new_name = Reynolds 
		new_default_appearance = appearance_reynolds_thug 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_index = 38 
	} 
	{ 
		new_display_name = "Paul Rodriguez" 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_index = 39 
	} 
	{ 
		new_display_name = "Geoff Rowley" 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_index = 40 
	} 
	{ 
		new_display_name = "Arto Saari" 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_index = 41 
	} 
	{ 
		new_display_name = "Ryan Sheckler" 
		skater_index = 7 
	} 
	{ 
		new_display_name = "Elissa Steamer" 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		is_female = 1 
		skater_index = 42 
	} 
	{ 
		new_display_name = "Jamie Thomas" 
		new_board_type = default 
		new_deck_graphic = board_thugpro 
		skater_index = 43 
	} 
	{ 
		new_display_name = "Mike Vallely" 
		skater_index = 8 
		sub_menu = [ 
			{ 
				display_name = "Mike Vallely" 
				default_appearance = appearance_vallely 
			} 
			{ 
				display_name = "Mike Vallely (Cutscene)" 
				default_appearance = appearance_vallely_cutscene 
			} 
			{ 
				display_name = "Mike Vallely (THUG)" 
				default_appearance = appearance_vallely_thug 
			} 
		] 
	} 
	{ 
		new_display_name = "Wee-Man" 
		skater_index = 9 
		skater_behavior_script = SS_Behavior_WeeMan 
	} 
] 
SCRIPT SS_Behavior_FatGuy 
	ss_temp_hide_skater 
	<objid> : obj_PlayAnim Anim = Ped_FatGuy_HandsWaistIdle Cycle Speed = 0.20000000298 
ENDSCRIPT

SCRIPT SS_Behavior_GeneSimmons 
	ss_temp_hide_skater 
	<objid> : obj_PlayAnim Anim = FrontEnd_Gene 
	OBJ_waitanimfinished 
	<objid> : obj_PlayAnim Anim = Ped_M_Idle1 Cycle 
ENDSCRIPT

SCRIPT SS_Behavior_IronMan 
	ss_temp_hide_skater 
	<objid> : obj_PlayAnim Anim = FrontEnd_Ironman 
	OBJ_waitanimfinished 
	<objid> : obj_PlayAnim Anim = Ped_M_Idle1 Cycle 
ENDSCRIPT

SCRIPT SS_Behavior_WeeMan 
	ss_temp_hide_skater 
	<objid> : obj_PlayAnim Anim = Pro_Idle02 Cycle 
ENDSCRIPT

SCRIPT SS_Behavior_Jester 
	ss_temp_hide_skater 
	<objid> : obj_PlayAnim Anim = Special_Jester_Juggle_Idle Cycle 
	TurnOnSpecialItem specialitem_details = JugglingBalls_details 
ENDSCRIPT

SCRIPT SS_Behavior_GenericPed 
	ss_temp_hide_skater 
	<objid> : obj_PlayAnim Anim = Ped_M_Idle1 Cycle 
ENDSCRIPT

SCRIPT SS_Behavior_StarWars 
	ss_temp_hide_skater 
	BEGIN 
		RANDOM(1, 1) 
			RANDOMCASE PlayAnimWithPartialAnimIfExists Anim = Ped_Starwarskid_Clip01 
			RANDOMCASE PlayAnimWithPartialAnimIfExists Anim = Ped_Starwarskid_Clip02 
		RANDOMEND 
		OBJ_waitanimfinished 
	REPEAT 
ENDSCRIPT

SCRIPT SS_Behavior_Daisy 
	ss_temp_hide_skater 
	BEGIN 
		PlayBrakeIdle 
		OBJ_waitanimfinished 
	REPEAT 
ENDSCRIPT

SCRIPT SS_Behavior_Cop 
	ss_temp_hide_skater 
	BEGIN 
		<objid> : obj_PlayAnim Anim = Pro_Idle02 
		OBJ_waitanimfinished 
	REPEAT 
ENDSCRIPT

SCRIPT ss_temp_hide_skater 
	<objid> : BlendPeriodOut 0 
	<objid> : hide 
	wait 9 
	<objid> : unhide 
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
		sticker_texture = "thugpro\\stickers\\sticker_thugpro" 
		skater_family = family_custom 
		is_pro = 0 
		is_male = 1 
		is_head_locked = 0 
		is_locked = 0 
		age = 20 
		hometown = "Los Angeles, CA" 
		points_available = 0 
		air = 10 
		run = 10 
		ollie = 10 
		Speed = 10 
		spin = 10 
		switch = 10 
		flip_speed = 10 
		rail_balance = 10 
		lip_balance = 10 
		manual_balance = 10 
		sponsors = [ ] 
		trick_mapping = { } 
		default_trick_mapping = CustomTricks 
		max_specials = 12 
		voice = male1 
		specials = { 
			[ 
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
				{ trickslot = Unassigned trickname = Unassigned } 
			] 
		} 
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
		Speed = 10 
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
				{ trickslot = SpAir_R_U_Circle trickname = Trick_The900 } 
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
		Speed = 10 
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
		default_appearance = appearance_Koston 
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
		Speed = 8 
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
		Speed = 8 
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
				{ trickslot = SpAir_D_U_Square trickname = Trick_Jackass } 
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
		Speed = 6 
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
		Speed = 8 
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
				{ trickslot = SpMan_R_L_Triangle trickname = Trick_MuskaManual } 
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
		Speed = 8 
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
		Speed = 10 
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
				{ trickslot = SpGrind_L_R_Triangle trickname = Trick_ElbowSmash } 
				{ trickslot = SpMan_D_U_Triangle trickname = Trick_RunningMan } 
				{ trickslot = SpMan_L_R_Triangle trickname = Trick_SlamSpinner } 
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
		Speed = 10 
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
		Speed = 5 
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
		Speed = 5 
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
		Speed = 11 
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
		Speed = 7 
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
		Speed = 5 
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
		Speed = 7 
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
		Speed = 8 
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
		Speed = 5 
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
		Speed = 10 
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
		Speed = 8 
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
		Speed = 5 
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
		skater_family = family_pro 
		is_pro = 1 
		is_head_locked = 1 
		is_locked = 1 
		is_hidden = 1 
		is_male = 1 
		points_available = 0 
		air = 8 
		run = 2 
		ollie = 8 
		Speed = 8 
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
		Speed = 9 
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
		Speed = 10 
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
		Speed = 11 
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
		default_appearance = appearance_THPS_Hawk 
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
		Speed = 10 
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
				{ trickslot = SpMan_U_D_Triangle trickname = Trick_TonySurfer } 
				{ trickslot = SpAir_L_D_Circle trickname = Trick_EndlessHandflip } 
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
		Speed = 10 
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
		Speed = 10 
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
		tag_texture = "tags\\tag_thugpro" 
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
		Speed = 10 
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
		Speed = 9 
		spin = 6 
		switch = 8 
		flip_speed = 8 
		rail_balance = 8 
		lip_balance = 8 
		manual_balance = 8 
		sponsors = [ vallely etnies mike ] 
		trick_mapping = { } 
		default_trick_mapping = PedTricks 
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
	{ 
		display_name = "Secret Skaters" 
		first_name = "Secret" 
		last_name = "Skaters" 
		select_icon = ss_questionmark 
		default_appearance = appearance_sparrow 
		name = ped 
		profile_list = ped_profile_list 
		stance = regular 
		pushstyle = never_mongo 
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
		Speed = 10 
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
	{ 
		display_name = "Gene Simmons" 
		first_name = "Gene" 
		default_appearance = appearance_gene 
		name = Gene 
		stance = regular 
		pushstyle = never_mongo 
		trickstyle = street 
		is_pro = 1 
		is_head_locked = 1 
		is_locked = 1 
		is_hidden = 1 
		is_secret 
		is_male = 1 
		age = -1 
		hometown = "hell" 
		points_available = 0 
		air = 10 
		run = 10 
		ollie = 10 
		Speed = 10 
		spin = 10 
		switch = 10 
		flip_speed = 10 
		rail_balance = 10 
		lip_balance = 11 
		manual_balance = 10 
		sponsors = [ ] 
		trick_mapping = { } 
		default_trick_mapping = PedTricks 
		no_edit 
		no_edit_groups = [ 
			secret_options 
		] 
		max_specials = 11 
		specials = { 
			[ 
				{ trickslot = SpAir_D_R_Circle trickname = Trick_LickItUp } 
				{ trickslot = SpGrind_L_R_Triangle trickname = Trick_Flames } 
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
		display_name = "Iron Man" 
		first_name = "Iron" 
		default_appearance = appearance_Ironman 
		name = Iron_Man 
		stance = regular 
		pushstyle = never_mongo 
		trickstyle = street 
		is_pro = 1 
		is_head_locked = 1 
		is_locked = 1 
		is_hidden = 1 
		is_secret 
		is_male = 1 
		age = -1 
		hometown = "West coast" 
		points_available = 0 
		air = 11 
		run = 11 
		ollie = 11 
		Speed = 11 
		spin = 11 
		switch = 11 
		flip_speed = 11 
		rail_balance = 11 
		lip_balance = 11 
		manual_balance = 11 
		sponsors = [ ] 
		trick_mapping = { } 
		default_trick_mapping = PedTricks 
		no_edit 
		no_edit_groups = [ 
			secret_options 
		] 
		max_specials = 11 
		specials = { 
			[ 
				{ trickslot = SpMan_D_U_Triangle trickname = Trick_Scanning } 
				{ trickslot = SpAir_L_R_Circle trickname = Trick_BootBurst } 
				{ trickslot = SpGrind_R_D_Triangle trickname = Trick_BlastGrind } 
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
		display_name = "T.H.U.D." 
		first_name = "Creature" 
		default_appearance = appearance_creature 
		name = Creature 
		stance = regular 
		pushstyle = always_mongo 
		trickstyle = street 
		is_pro = 1 
		is_head_locked = 1 
		is_locked = 1 
		is_hidden = 1 
		is_secret 
		is_male = 1 
		age = -1 
		hometown = "the sewer" 
		points_available = 0 
		air = 10 
		run = 10 
		ollie = 10 
		Speed = 10 
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
		max_specials = 11 
		specials = { 
			[ 
				{ trickslot = SpAir_U_R_circle trickname = Trick_3DSwimAir } 
				{ trickslot = SpGrind_D_L_Triangle trickname = Trick_3DScaryGrind } 
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
		display_name = "Steve Caballero" 
		first_name = "Steve" 
		default_appearance = appearance_caballero_thug 
		name = caballero 
		stance = goofy 
		pushstyle = never_mongo 
		trickstyle = street 
		is_pro = 1 
		is_head_locked = 1 
		is_locked = 1 
		is_male = 1 
		age = 36 
		hometown = "Campbell, CA" 
		points_available = 0 
		air = 10 
		run = 8 
		ollie = 8 
		Speed = 8 
		spin = 9 
		switch = 8 
		flip_speed = 8 
		rail_balance = 9 
		lip_balance = 9 
		manual_balance = 8 
		sponsors = [ brigade sessions faction vans steve ] 
		trick_mapping = { } 
		default_trick_mapping = CaballeroTricks 
		max_specials = 11 
		specials = { 
			[ 
				{ trickslot = SpLip_R_U_Triangle trickname = Trick_HoHoSadplant } 
				{ trickslot = SpAir_L_D_Circle trickname = Trick_FS540 } 
				{ trickslot = Spgrind_D_U_Triangle trickname = Trick_GuitarSlide } 
				{ trickslot = SpGrind_U_D_Triangle trickname = Trick_DaffyBrokenGrind } 
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
			is_cab 
		] 
		no_edit_groups = [ 
			head_options 
		] 
	} 
	{ 
		display_name = "Kareem Campbell" 
		first_name = "Kareem" 
		default_appearance = appearance_campbell_thug 
		name = campbell 
		stance = regular 
		pushstyle = never_mongo 
		trickstyle = street 
		is_pro = 1 
		is_head_locked = 1 
		is_locked = 1 
		is_male = 1 
		age = 30 
		hometown = "N.Y. / L.A." 
		points_available = 0 
		air = 7 
		run = 8 
		ollie = 9 
		Speed = 8 
		spin = 9 
		switch = 8 
		flip_speed = 9 
		rail_balance = 9 
		lip_balance = 8 
		manual_balance = 10 
		sponsors = [ axion citystars ricta kareem ] 
		trick_mapping = { } 
		default_trick_mapping = CampbellTricks 
		max_specials = 11 
		specials = { 
			[ 
				{ trickslot = SpAir_U_R_Square trickname = Trick_GhettoBird } 
				{ trickslot = SpAir_L_D_Circle trickname = Trick_KFBackflip } 
				{ trickslot = SpAir_R_D_Square trickname = Trick_QuadrupleHeelFlip } 
				{ trickslot = SpAir_D_U_Circle trickname = Trick_SitDownAir } 
				{ trickslot = SpMan_D_L_Triangle trickname = Trick_ReemoSlide } 
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
			is_campbell 
		] 
	} 
	{ 
		display_name = "Rune Glifberg" 
		first_name = "Rune" 
		default_appearance = appearance_glifberg_thug 
		name = Glifberg 
		stance = regular 
		pushstyle = never_mongo 
		trickstyle = vert 
		is_pro = 1 
		is_head_locked = 1 
		is_locked = 1 
		is_male = 1 
		age = 27 
		hometown = "Copenhagen, Denmark" 
		points_available = 0 
		air = 11 
		run = 7 
		ollie = 7 
		Speed = 9 
		spin = 9 
		switch = 8 
		flip_speed = 8 
		rail_balance = 9 
		lip_balance = 9 
		manual_balance = 8 
		sponsors = [ flip axion volcom rune ] 
		trick_mapping = { } 
		default_trick_mapping = GlifbergTricks 
		max_specials = 11 
		specials = { 
			[ 
				{ trickslot = SpAir_R_U_Circle trickname = Trick_DoubleKFindy } 
				{ trickslot = SpAir_L_R_Circle trickname = Trick_FingerFlipAirwalk } 
				{ trickslot = SpAir_R_D_Circle trickname = Trick_540TailWhip } 
				{ trickslot = SpAir_L_D_Circle trickname = Trick_2KickMadonnaFlip } 
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
			is_glifberg 
		] 
	} 
	{ 
		display_name = "Bucky Lasek" 
		first_name = "Bucky" 
		default_appearance = appearance_lasek_thug 
		name = Lasek 
		stance = regular 
		pushstyle = never_mongo 
		trickstyle = vert 
		is_pro = 1 
		is_head_locked = 1 
		is_locked = 1 
		is_male = 1 
		age = 28 
		hometown = "Baltimore, MD" 
		points_available = 0 
		air = 10 
		run = 7 
		ollie = 7 
		Speed = 9 
		spin = 11 
		switch = 8 
		flip_speed = 8 
		rail_balance = 8 
		lip_balance = 10 
		manual_balance = 7 
		sponsors = [ birdhouse genetic billabong bucky ] 
		trick_mapping = { } 
		default_trick_mapping = LasekTricks 
		max_specials = 11 
		specials = { 
			[ 
				{ trickslot = SpLip_L_D_Triangle trickname = Trick_1990Invert } 
				{ trickslot = SpLip_R_L_Triangle trickname = Trick_HeelflipFSInvert } 
				{ trickslot = SpAir_R_D_Circle trickname = Trick_BreakIn } 
				{ trickslot = SpGrind_U_L_Triangle trickname = Trick_BigHitter } 
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
			is_lasek 
		] 
	} 
	{ 
		display_name = "Andrew Reynolds" 
		first_name = "Andrew" 
		default_appearance = appearance_reynolds_thug 
		name = Reynolds 
		stance = regular 
		pushstyle = never_mongo 
		trickstyle = street 
		is_pro = 1 
		is_head_locked = 1 
		is_locked = 1 
		is_male = 1 
		age = 25 
		hometown = "Lakeland, FL" 
		points_available = 0 
		air = 7 
		run = 7 
		ollie = 11 
		Speed = 8 
		spin = 8 
		switch = 9 
		flip_speed = 8 
		rail_balance = 10 
		lip_balance = 8 
		manual_balance = 9 
		sponsors = [ baker emerica independent andrew ] 
		trick_mapping = { } 
		default_trick_mapping = ReynoldsTricks 
		max_specials = 11 
		specials = { 
			[ 
				{ trickslot = SpGrind_L_R_Triangle trickname = Trick_FiftyfiftySwitcheroo } 
				{ trickslot = SpAir_L_R_Circle trickname = Trick_BigSpinShifty } 
				{ trickslot = SpAir_R_D_Circle trickname = Trick_KFBackflip } 
				{ trickslot = SpAir_U_D_Circle trickname = Trick_FSFlipOneFootTailGrab } 
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
			is_reynolds 
		] 
		no_edit_groups = [ 
		] 
		no_edit_groups = [ 
			head_options 
			helmet_items 
		] 
	} 
	{ 
		display_name = "Paul Rodriguez" 
		first_name = "Paul" 
		default_appearance = appearance_rodriguez_thug 
		name = rodriguez 
		stance = goofy 
		pushstyle = never_mongo 
		trickstyle = street 
		is_pro = 1 
		is_head_locked = 0 
		is_locked = 0 
		is_male = 1 
		age = 18 
		hometown = "Northridge, CA" 
		points_available = 0 
		air = 6 
		run = 8 
		ollie = 8 
		Speed = 8 
		spin = 8 
		switch = 9 
		flip_speed = 10 
		rail_balance = 10 
		lip_balance = 8 
		manual_balance = 10 
		sponsors = [ es girl paul ] 
		trick_mapping = { } 
		default_trick_mapping = RodriguezTricks 
		max_specials = 11 
		specials = { 
			[ 
				{ trickslot = SpGrind_L_D_Triangle trickname = Trick_FSNollie360FlipCrook } 
				{ trickslot = Spgrind_D_U_Triangle trickname = Trick_YeaRightSlide } 
				{ trickslot = SpAir_R_D_Circle trickname = Trick_NollieFlipUnderflip } 
				{ trickslot = SpLip_U_D_Triangle trickname = Trick_Russian } 
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
		display_name = "Geoff Rowley" 
		first_name = "Geoff" 
		default_appearance = appearance_rowley_thug 
		name = rowley 
		stance = regular 
		pushstyle = never_mongo 
		trickstyle = street 
		is_pro = 1 
		is_head_locked = 1 
		is_locked = 1 
		is_male = 1 
		age = 25 
		hometown = "Liverpool, England" 
		points_available = 0 
		air = 7 
		run = 8 
		ollie = 9 
		Speed = 9 
		spin = 8 
		switch = 8 
		flip_speed = 10 
		rail_balance = 11 
		lip_balance = 7 
		manual_balance = 8 
		sponsors = [ flip volcom vans geoff ] 
		trick_mapping = { } 
		default_trick_mapping = RowleyTricks 
		max_specials = 11 
		specials = { 
			[ 
				{ trickslot = SpAir_U_R_circle trickname = Trick_flipflip } 
				{ trickslot = SpAir_D_R_Square trickname = Trick_AirCasperFlip } 
				{ trickslot = SpGrind_R_L_Triangle trickname = Trick_RowleyDarkSlideHandStand } 
				{ trickslot = SpMan_U_D_Triangle trickname = Trick_Sproing } 
				{ trickslot = SpGrind_L_R_Triangle trickname = Trick_RowleyDarkSlide } 
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
			is_rowley 
		] 
	} 
	{ 
		display_name = "Arto Saari" 
		first_name = "Arto" 
		default_appearance = appearance_saari_thug 
		name = saari 
		stance = regular 
		pushstyle = never_mongo 
		trickstyle = street 
		is_pro = 1 
		is_head_locked = 0 
		is_locked = 0 
		is_male = 1 
		age = -1 
		hometown = "Edison, NJ" 
		points_available = 0 
		air = 8 
		run = 8 
		ollie = 8 
		Speed = 10 
		spin = 8 
		switch = 8 
		flip_speed = 9 
		rail_balance = 11 
		lip_balance = 7 
		manual_balance = 8 
		sponsors = [ flip es ] 
		trick_mapping = { } 
		default_trick_mapping = SaariTricks 
		max_specials = 11 
		specials = { 
			[ 
				{ trickslot = SpMan_L_R_Triangle trickname = Trick_HeadStandManual } 
				{ trickslot = SpMan_D_U_Triangle trickname = Trick_MixItUp } 
				{ trickslot = SpGrind_D_R_Triangle trickname = Trick_OneFootDarkSlide } 
				{ trickslot = SpAir_L_R_Square trickname = Trick_HardFlipBackFootFlip } 
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
		display_name = "Elissa Steamer" 
		first_name = "Elissa" 
		default_appearance = appearance_steamer_thug 
		name = steamer 
		stance = regular 
		pushstyle = never_mongo 
		trickstyle = street 
		is_pro = 1 
		is_head_locked = 1 
		is_locked = 1 
		is_male = 0 
		age = -1 
		hometown = "Fort Myers, FL" 
		points_available = 0 
		air = 9 
		run = 8 
		ollie = 9 
		Speed = 8 
		spin = 8 
		switch = 8 
		flip_speed = 9 
		rail_balance = 9 
		lip_balance = 8 
		manual_balance = 9 
		sponsors = [ bootleg etnies tsa elissa ] 
		trick_mapping = { } 
		default_trick_mapping = SteamerTricks 
		max_specials = 11 
		specials = { 
			[ 
				{ trickslot = SpMan_R_D_Triangle trickname = Trick_NoComplyLate360 } 
				{ trickslot = SpMan_R_L_Triangle trickname = Trick_HoHoStreetPlant } 
				{ trickslot = SpGrind_L_R_Triangle trickname = Trick_Coffin } 
				{ trickslot = SpAir_D_U_Circle trickname = Trick_SemiFlip } 
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
			shows_panties 
			not_with_elissa 
		] 
		no_edit_groups = [ 
			head_options 
			backpack_items 
			helmet_items 
			socks_items 
		] 
	} 
	{ 
		display_name = "Jamie Thomas" 
		first_name = "Jamie" 
		default_appearance = appearance_thomas_thug 
		name = thomas 
		stance = regular 
		pushstyle = never_mongo 
		trickstyle = street 
		is_pro = 1 
		is_head_locked = 1 
		is_locked = 1 
		is_male = 1 
		age = 26 
		hometown = "Dotham, AL" 
		points_available = 0 
		air = 8 
		run = 10 
		ollie = 8 
		Speed = 10 
		spin = 8 
		switch = 8 
		flip_speed = 8 
		rail_balance = 11 
		lip_balance = 7 
		manual_balance = 7 
		sponsors = [ zero circa monster jamie ] 
		trick_mapping = { } 
		default_trick_mapping = ThomasTricks 
		max_specials = 11 
		specials = { 
			[ 
				{ trickslot = SpGrind_R_D_Triangle trickname = Trick_CrookedBigSpinFlip } 
				{ trickslot = Spgrind_D_U_Triangle trickname = Trick_PrimoHandStand } 
				{ trickslot = SpGrind_L_D_Triangle trickname = Trick_AmericanHeroGrind } 
				{ trickslot = SpGrind_U_D_Triangle trickname = Trick_CrookedSkull } 
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
		no_edit_groups = [ 
			head_options 
			pad_options 
		] 
	} 
	{ display_name = "Darth Maul" 
		default_appearance = appearance_DarthMaul 
		name = Maul 
		stance = regular 
		pushstyle = never_mongo 
		trickstyle = street 
		is_pro = 1 
		is_head_locked = 1 
		is_locked = 1 
		is_male = 1 
		age = 26 
		hometown = "A galaxy, far far away..." 
		points_available = 0 
		air = 8 
		run = 10 
		ollie = 8 
		Speed = 10 
		spin = 8 
		switch = 8 
		flip_speed = 8 
		rail_balance = 11 
		lip_balance = 7 
		manual_balance = 7 
		sponsors = [ zero circa monster jamie ] 
		trick_mapping = { } 
		default_trick_mapping = ThomasTricks 
		max_specials = 11 
		specials = { 
			[ 
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
				{ trickslot = Unassigned trickname = Unassigned } 
			] 
		} 
		no_edit_groups = [ 
			head_options 
			pad_options 
		] 
	} 
] 
default_classic_stats = 
{ 
	air = 3 
	run = 3 
	ollie = 3 
	Speed = 3 
	spin = 3 
	switch = 3 
	flip_speed = 3 
	rail_balance = 3 
	lip_balance = 3 
	manual_balance = 3 
	points_available = 0 
} 

