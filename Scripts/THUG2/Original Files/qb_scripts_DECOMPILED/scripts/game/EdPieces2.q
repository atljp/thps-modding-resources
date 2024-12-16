Ed_Resources_Info = { 
	anim_set_mem = { 
		ON_PS2 = 0 
		ON_NGC = 0 
		ON_XBOX = 0 
	} 
	park_heap_size = { 
		ON_PS2 = 900000 
		ON_NGC = 700000 
		ON_XBOX = 900000 
	} 
	in_railpoint_pool = 3000 
	in_railstring_pool = 2400 
	out_railpoint_pool = 4000 
	out_railstring_pool = 2000 
	main_heap_base = { 
		ON_PS2 = 8100000 
		ON_NGC = 15505000 
		ON_XBOX = 13976108 
	} 
	main_heap_pad = { 
		ON_PS2 = -495000 
		ON_NGC = -115000 
		ON_XBOX = -837664 
	} 
	theme_pad = { 
		ON_PS2 = [ 
			478720 
			462368 
			0 
			241296 
			316800 
		] 
		ON_NGC = [ 
			583728 
			451824 
			0 
			297424 
			408736 
		] 
		ON_XBOX = [ 
			563040 
			509984 
			0 
			263856 
			381584 
		] 
	} 
	park_heap_base = 823728 
	park_heap_pad = 10000 
	top_down_required = 1000000 
	component_use_base = 500 
	vector_use_base = 100 
	CArray_use_base = 100 
	max_dma_pieces = 3336 
	floor_piece_size_main = { 
		ON_PS2 = 1400 
		ON_NGC = 1000 
		ON_XBOX = 1400 
	} 
	floor_piece_size_park = 200 
} 
SCRIPT ParkEd_GetResourceValue 
	IF NOT GotParam key 
		script_assert "No <key> parameter" 
	ENDIF 
	<size> = 0 
	IF NOT StructureContains ( <key> ) structure = ( Ed_Resources_Info ) 
		
		RETURN 
	ENDIF 
	GetPlatform 
	SWITCH <Platform> 
		CASE PS2 
			<subkey> = ON_PS2 
		CASE NGC 
			<subkey> = ON_NGC 
		CASE XBox 
			<subkey> = ON_XBOX 
	ENDSWITCH 
	IF ( <Platform> = NGC ) 
		IF ( <key> = main_heap_base ) 
			<size> = ( 4654800 + ( ( 2 * 1024 * 1024 ) -900000 ) ) 
			RETURN 
		ENDIF 
	ENDIF 
	IF StructureContains ( <subkey> ) structure = ( Ed_Resources_Info . <key> ) 
		IF GotParam index 
			<size> = ( Ed_Resources_Info . <key> . <subkey> [ <index> ] ) 
		ELSE 
			<size> = ( Ed_Resources_Info . <key> . <subkey> ) 
		ENDIF 
	ELSE 
		IF GotParam index 
			<size> = ( Ed_Resources_Info . <key> [ <index> ] ) 
		ELSE 
			<size> = ( Ed_Resources_Info . <key> ) 
		ENDIF 
	ENDIF 
ENDSCRIPT

DMA_Usage = 
{ 
	Sk3Ed_MLa_20x20 = 15 
	Sk5ed_lava1square = 15 
	Sk3Ed_MWa_20x20 = 15 
	Sk5ed_Water1square = 15 
	sk5ed_speedboostG = 15 
	sk5ed_speedboostGS = 15 
	Sk6ed_qp_cornerB = 15 
	sk6ed_qp_MidB = 15 
	sk6ed_Kick_HighB = 15 
	sk6ed_Kick_MidB = 15 
	sk6ed_LaunchSB = 15 
	sk6ed_LaunchBB = 15 
	sk6ed_fountainLA = 15 
	sk6ed_WallBoost = 15 
	sk6ed_SSroundkicker = 15 
	sk6ed_SSrampmidBooster = 15 
	Sk5Ed_QPshortMid_01B = 15 
	Sk6ed_Acid = 15 
	Sk3Ed_Gb_10x10 = 6 
	Sk3Ed_Gt_20x20 = 15 
	sk6ed_BAGlass = 166 
	BO_Classic_Barrel = 166 
	sk6ed_Graffiti_Ammo = 166 
	sk6ed_crate = 166 
	sk6ed_Welcome = 166 
	sk6ed_GarbageLA = 166 
} 
ClipboardTitle = #"Clipboard" 
Ed_max_dim = 40 
Ed_default_inner_dim = 24 
Ed_piece_sets = [ 
	{ 
		name = "RESTARTS" 
		first = Sk3Ed_RS_1p 
	} 
	{ 
		name = "TEAM FLAGS" 
		first = Sk4Ed_Team_Blue 
		no_gamecube 
	} 
	{ 
		name = "TOOLS" 
		first = Sk5Ed_Sel_01 
	} 
	{ 
		name = "CLIPBOARD" 
		clipboard_set 
	} 
	{ 
		name = "TABLES / BENCHES" 
		first = Sk3Ed_Bs_01 
	} 
	{ 
		name = "FUNBOXES / KICKERS" 
		first = Sk3Ed_FB_Tok02 
	} 
	{ 
		name = "PIPES / TUNNELS" 
		first = sk6ed_HP_AU 
	} 
	{ 
		name = "WALLS" 
		first = sk5ed_shortwall 
	} 
	{ 
		name = "QUARTER PIPES" 
		first = Sk3Ed_QPd_10x10x8 
	} 
	{ 
		name = "POOLS" 
		first = Sk3Ed_P_10x10x8 
	} 
	{ 
		name = "LIGHTS / WIRES" 
		first = sk6ed_Lamp 
	} 
	{ 
		name = "RAILS" 
		first = Sk3Ed_RA_10x10x4 
	} 
	{ 
		name = "SLOPES" 
		first = Sk3Ed_S_10x10x4 
	} 
	{ 
		name = "SLOPES HUGE" 
		first = Sk3Ed_S_10x10x09 
	} 
	{ 
		name = "STAIRS" 
		first = Sk3Ed_ST_10x10x2 
	} 
	{ 
		name = "GROUND PIECES" 
		first = Sk3Ed_MWa_20x20 
	} 
	{ 
		name = "BUILDINGS / VEHICLES" 
		first = sk5ed_hut 
	} 
	{ 
		name = "SMALL STUFF" 
		first = sk6ed_sign_nono01 
	} 
	{ 
		name = "HUGEYS" 
		first = sk6ed_hugepoolP12 
	} 
	{ 
		name = "FLOORS" 
		first = floor_wall_block1 
		hidden 
	} 
	{ 
		name = "RISERS" 
		first = riser_below 
		hidden 
	} 
] 
Ed_standard_metapieces = [ 
	{ 
		single = Sk3Ed_RS_1p 
		text_name = #"Player 1 Restart" 
		special_type = restart_1 
	} 
	{ 
		single = Sk3Ed_RS_Mp 
		text_name = #"Player 2 Restart" 
		special_type = restart_multi 
	} 
	{ 
		single = Sk3Ed_Rs_Ho 
		text_name = #"Multiplayer / Horse Restart" 
		special_type = restart_horse 
	} 
	{ 
		single = Sk3Ed_Rs_KOTH 
		text_name = #"King of the Hill Crown Restart" 
		special_type = king_of_hill 
	} 
	{ 
		single = Sk4Ed_Team_Blue 
		text_name = #"Blue Team / CTF Base" 
		special_type = blue_flag 
	} 
	{ 
		single = Sk4Ed_Team_Red 
		text_name = #"Red Team / CTF Base" 
		special_type = red_flag 
	} 
	{ 
		single = Sk4Ed_Team_Green 
		text_name = #"Green Team / CTF Base" 
		special_type = green_flag 
	} 
	{ 
		single = Sk4Ed_Team_Yellow 
		text_name = #"Yellow Team / CTF Base" 
		special_type = yellow_flag 
	} 
	{ 
		single = Sk5Ed_Sel_01 
		text_name = #"Area Selection" 
		special_type = area_selection 
	} 
	{ 
		single = Sk3Ed_GAP_01 
		text_name = #"Gap Placement Piece" 
		special_type = gap_placement 
	} 
	{ 
		single = Sk3Ed_RAi_10x10x4 
		name = rail_placement 
		text_name = #"Rail Placement" 
		special_type = rail_placement 
	} 
	{ 
		single = Sk3Ed_Bs_01 
		text_name = #"Table" 
	} 
	{ 
		single = Sk3Ed_Bs_02 
		text_name = #"Table Bench" 
	} 
	{ 
		single = Sk3Ed_Bs_03 
		text_name = #"Corner Table" 
	} 
	{ 
		single = Sk3Ed_Bs_04 
		text_name = #"Corner Table Bench" 
	} 
	{ 
		single = Sk3Ed_Bs_05 
		text_name = #"Table On Dumpster" 
	} 
	{ 
		single = Sk3Ed_Bp_01 
		text_name = #"Park Bench" 
	} 
	{ 
		single = Sk3Ed_Bp_02 
		text_name = #"Corner Park Bench" 
	} 
	{ 
		single = Sk4Ed_SF2_Bench 
		text_name = #"Conc Bench" 
	} 
	{ 
		single = Sk4Ed_Alc_CrustyBench 
		text_name = #"Crusty Bench" 
	} 
	{ 
		single = sk5ed_sdBench 
		text_name = #"SD Bench" 
	} 
	{ 
		single = Sk4Ed_Alc_Bench 
		text_name = #"Alcatraz Bench" 
	} 
	{ 
		single = sk6ed_Bench_BA_short 
		text_name = #"BA Bench Short" 
	} 
	{ 
		single = sk6ed_Bench_BA_med 
		text_name = #"BA Bench Mid" 
	} 
	{ 
		single = sk6ed_Bench_BA_long 
		text_name = #"BA Bench Long" 
	} 
	{ 
		single = sk6ed_BusStop 
		text_name = #"AU Bus Stop" 
	} 
	{ 
		single = sk5ed_veniceBench 
		text_name = #"Venice Bench" 
	} 
	{ 
		single = sk6ed_crypt 
		text_name = #"Crypt" 
	} 
	{ 
		single = Sk3Ed_FB_Tok02 
		text_name = #"Tokyo Low Wall" 
	} 
	{ 
		single = Sk3Ed_FB_Rio01 
		text_name = #"Rio Quiksilver Box" 
	} 
	{ 
		single = Sk3Ed_FB_Sub02 
		text_name = #"Suburbia Hump" 
	} 
	{ 
		single = Sk3Ed_FB_Sub03 
		text_name = #"Suburbia Box" 
	} 
	{ 
		single = Sk3Ed_FB_30x30x4_01 
		text_name = #"Low Med" 
	} 
	{ 
		single = Sk3Ed_FB_30x30x4_02 
		text_name = #"Low Oct" 
	} 
	{ 
		single = Sk3Ed_FB_30x30x4_03 
		text_name = #"Low Long Med" 
	} 
	{ 
		single = Sk3Ed_FB_30x30x4_04 
		text_name = #"Low Long Oct" 
	} 
	{ 
		single = Sk3Ed_FB_30x30x8_01 
		text_name = #"High Med" 
	} 
	{ 
		single = Sk3Ed_FB_30x30x8_02 
		text_name = #"High Oct" 
	} 
	{ 
		single = Sk3Ed_FB_30x30x8_03 
		text_name = #"High Long Med" 
	} 
	{ 
		single = Sk3Ed_FB_30x30x8_04 
		text_name = #"High Long Oct" 
	} 
	{ 
		single = Sk3Ed_FB_30x30x8_05 
		text_name = #"High Long Med Steep" 
	} 
	{ 
		single = Sk3Ed_FB_30x30x8_06 
		text_name = #"High Long Oct Steep" 
	} 
	{ 
		single = Sk3Ed_FB_30x30x8_07 
		text_name = #"High Long Med Steeper" 
	} 
	{ 
		single = sk6ed_LaunchBB 
		text_name = #"Box Booster Big" 
	} 
	{ 
		single = Sk3Ed_FB_30x30x8_08 
		text_name = #"High Long Oct Steeper" 
	} 
	{ 
		single = sk6ed_LaunchSB 
		text_name = #"Box Booster Small" 
	} 
	{ 
		single = sk6ed_SSrailbox 
		text_name = #"Rail Box Skatestreet" 
	} 
	{ 
		single = sk6ed_SSbigkicker 
		text_name = #"Outside Skatestreet" 
	} 
	{ 
		single = Sk4Ed_SF2_TnAKicker01 
		text_name = #"Kicker 1" 
	} 
	{ 
		single = Sk4Ed_Alc_Kicker 
		text_name = #"Kicker 2" 
	} 
	{ 
		single = sk5ed_Tightkicker 
		text_name = #"Tight Kicker" 
	} 
	{ 
		single = sk5ed_KickerWall 
		text_name = #"Kicker Wall" 
	} 
	{ 
		single = sk6ed_Kick_MidB 
		text_name = #"Kick Mid Boost" 
	} 
	{ 
		single = sk6ed_Kick_HighB 
		text_name = #"Kick High Boost" 
	} 
	{ 
		single = sk6ed_doubelsidedKick 
		text_name = #"Double Sided Kick" 
	} 
	{ 
		single = sk6ed_SSrampmid 
		text_name = #"Ramp Mid Skatestreet" 
	} 
	{ 
		single = sk6ed_SSrampmidBooster 
		text_name = #"Mid Skatestreet Booster" 
	} 
	{ 
		single = sk6ed_SSmidpiece 
		text_name = #"Mid Piece Skatestreet" 
	} 
	{ 
		single = sk6ed_SSrampsmall 
		text_name = #"Small Kicker Skatestreet" 
	} 
	{ 
		single = sk6ed_SSrampwide 
		text_name = #"Wide Kicker Skatestreet" 
	} 
	{ 
		single = sk6ed_SSroundkicker 
		text_name = #"Round Kicker Skatestreet" 
	} 
	{ 
		single = sk6ed_venice_triangle 
		text_name = #"Venice Triangle" 
	} 
	{ 
		single = Sk5ED_BoobB_03 
		text_name = #"Small Boob" 
	} 
	{ 
		single = Sk5ED_BoobB_02 
		text_name = #"Medium Boob" 
	} 
	{ 
		single = Sk5ED_BoobB_01 
		text_name = #"Big Boob" 
	} 
	{ 
		single = sk6ed_HP_AU 
		text_name = #"Halfpipe Australia" 
	} 
	{ 
		single = Sk5Ed_HPTunnel_01 
		text_name = #"HP Tunnel" 
	} 
	{ 
		single = sk5ed_Underground 
		text_name = #"Underground" 
	} 
	{ 
		single = sk5ed_UndergroundRailed 
		text_name = #"Underground Railed" 
	} 
	{ 
		single = sk5ed_undergroundStraight 
		text_name = #"Underground Straight" 
	} 
	{ 
		single = sk5ed_undergroundStraightRailed 
		text_name = #"Underground Railed Straight" 
	} 
	{ 
		single = sk5ed_UndergroundCurved 
		text_name = #"Underground Curved" 
	} 
	{ 
		single = sk5ed_shortwall 
		text_name = #"Low" 
	} 
	{ 
		single = sk5ed_Shortwall01 
		text_name = #"Short Wall" 
	} 
	{ 
		single = Sk3Ed_W_10x10x2 
		text_name = #"Mid" 
	} 
	{ 
		single = Sk3Ed_W_10x10x5 
		text_name = #"High" 
	} 
	{ 
		single = Sk5Ed_W_10x10x06_01 
		text_name = #"Higher" 
	} 
	{ 
		single = Sk5Ed_W_10x10x06_02 
		text_name = #"Highest" 
	} 
	{ 
		single = Sk5Ed_W_Slated_01 
		text_name = #"Slanted" 
	} 
	{ 
		single = Sk5Ed_SideWall 
		text_name = #"Side Wall" 
	} 
	{ 
		single = Sk5Ed_BigSideWall 
		text_name = #"Big Side Wall" 
	} 
	{ 
		single = Sk5Ed_90Wall 
		text_name = #"90 Wall" 
	} 
	{ 
		single = Sk5Ed_RA_10x10x15_04 
		text_name = #"Low With Rail" 
	} 
	{ 
		single = Sk5Ed_RA_10x10x15_03 
		text_name = #"Mid With Rail" 
	} 
	{ 
		single = Sk5Ed_RA_10x10x15_02 
		text_name = #"High With Rail" 
	} 
	{ 
		single = sk5ed_curvedLedge 
		text_name = #"Curved Ledge Short" 
	} 
	{ 
		single = sk5ed_curvedLedge04 
		text_name = #"Curved Ledge Low" 
	} 
	{ 
		single = sk5ed_curvedLedge01 
		text_name = #"Curved Ledge Mid" 
	} 
	{ 
		single = sk5ed_curvedLedge02 
		text_name = #"Curved Ledge High" 
	} 
	{ 
		single = sk5ed_curvedLedge03 
		text_name = #"Curved Ledge Highest" 
	} 
	{ 
		single = Sk5ed_LAcurve 
		text_name = #"LA Curve" 
	} 
	{ 
		single = Sk5ed_LAstraight 
		text_name = #"LA Straight" 
	} 
	{ 
		single = Sk3Ed_We_10x10x5 
		text_name = #"High End" 
	} 
	{ 
		single = Sk3Ed_We_10x10x2 
		text_name = #"Low Connector" 
	} 
	{ 
		single = sk6ed_fence 
		text_name = #"Link Fence" 
	} 
	{ 
		single = sk6ed_fencefiller 
		text_name = #"Link Fence Mid" 
	} 
	{ 
		single = sk6ed_fenceedge 
		text_name = #"Link Fence Edge" 
	} 
	{ 
		single = sk6ed_fencefilleredge 
		text_name = #"Link Fence Mid Edge" 
	} 
	{ 
		single = sk5ed_Billboard_Med 
		text_name = #"Med Billboard" 
	} 
	{ 
		single = sk5ed_Billboard_big 
		text_name = #"Big Billboard" 
	} 
	{ 
		single = sk5ed_Billboard_Med45 
		text_name = #"Med Billboard 45" 
	} 
	{ 
		single = sk5ed_Billboard_big45 
		text_name = #"Big Billboard 45" 
	} 
	{ 
		single = sk6ed_handicap_AU 
		text_name = #"AU Walkway" 
	} 
	{ 
		single = sk6ed_ps2 
		text_name = #"Concrete Piece" 
	} 
	{ 
		single = sk6ed_greatwall 
		text_name = #"Ancient Wall" 
	} 
	{ 
		single = sk6ed_greatwallmid 
		text_name = #"Ancient Wall Center" 
	} 
	{ 
		single = sk6ed_greatwallCurved 
		text_name = #"Ancient Wall Curved" 
	} 
	{ 
		single = sk6ed_WallBoost 
		text_name = #"Wall Booster" 
	} 
	{ 
		single = Sk3Ed_QPd_10x10x8 
		text_name = #"Low Short" 
	} 
	{ 
		multiple = [ 
			{ Sk3Ed_QPd_10x10x8 [ 0 0 0 ] } 
			{ Sk3Ed_QPd_10x10x8 [ 1 0 0 ] } 
		] 
		name = Low_Med 
		text_name = #"Low Med" 
	} 
	{ 
		multiple = [ 
			{ Sk3Ed_QPd_10x10x8 [ 0 0 0 ] } 
			{ Sk3Ed_QPd_10x10x8 [ 1 0 0 ] } 
			{ Sk3Ed_QPd_10x10x8 [ 2 0 0 ] } 
			{ Sk3Ed_QPd_10x10x8 [ 3 0 0 ] } 
		] 
		name = Low_Long 
		text_name = #"Low Long" 
	} 
	{ 
		single = Sk3Ed_QPi_10x10x8 
		text_name = #"Low Inside Corner" 
	} 
	{ 
		single = Sk6ed_qp_cornerB 
		text_name = #"QP Corner Boost" 
	} 
	{ 
		single = Sk3Ed_QPo_10x10x8 
		text_name = #"Low Outside Corner" 
	} 
	{ 
		single = Sk3Ed_QPdi_10x10x8 
		text_name = #"Low Inside Corner Deck" 
	} 
	{ 
		single = Sk3Ed_QPdo_10x10x8 
		text_name = #"Low Outside Corner Deck" 
	} 
	{ 
		single = Sk3Ed_QPd_10x10x12 
		text_name = #"High Short" 
	} 
	{ 
		multiple = [ 
			{ Sk3Ed_QPd_10x10x12 [ 0 0 0 ] } 
			{ Sk3Ed_QPd_10x10x12 [ 1 0 0 ] } 
		] 
		name = High_Med 
		text_name = #"High Med" 
	} 
	{ 
		multiple = [ 
			{ Sk3Ed_QPd_10x10x12 [ 0 0 0 ] } 
			{ Sk3Ed_QPd_10x10x12 [ 1 0 0 ] } 
			{ Sk3Ed_QPd_10x10x12 [ 2 0 0 ] } 
			{ Sk3Ed_QPd_10x10x12 [ 3 0 0 ] } 
		] 
		name = High_Long 
		text_name = #"High Long" 
	} 
	{ 
		single = Sk3Ed_QPi_10x10x12 
		text_name = #"High Inside Corner" 
	} 
	{ 
		single = Sk3Ed_QPo_10x10x12 
		text_name = #"High Outside Corner" 
	} 
	{ 
		single = Sk3Ed_QPdi_10x10x12 
		text_name = #"High Inside Corner Deck" 
	} 
	{ 
		single = Sk3Ed_QPdo_10x10x12 
		text_name = #"High Outside Corner Deck" 
	} 
	{ 
		single = Sk3Ed_QPdR_10x10x4 
		text_name = #"4ft Rollin" 
	} 
	{ 
		single = Sk3Ed_QPdR_10x10x8 
		text_name = #"8ft Rollin" 
	} 
	{ 
		single = Sk3Ed_QPdR_10x10x12 
		text_name = #"12ft Rollin" 
	} 
	{ 
		single = Sk3Ed_QPdR_10x10x16 
		text_name = #"16ft Rollin" 
	} 
	{ 
		single = Sk4Ed_Sch_Spine 
		text_name = #"School Spine" 
	} 
	{ 
		single = Sk5Ed_QPshortMid_01 
		text_name = #"Short QP" 
	} 
	{ 
		single = Sk5Ed_QPshortMid_01B 
		text_name = #"Short QP Booster" 
	} 
	{ 
		single = sk6ed_pyramidqpbig 
		text_name = #"Pyramid QP" 
	} 
	{ 
		single = sk6ed_Marsqps 
		text_name = #"QPs Marseille" 
	} 
	{ 
		single = sk6ed_cashsign 
		text_name = #"Cash Sign" 
	} 
	{ 
		single = sk6ed_NYqpledge 
		text_name = #"Coffee Shop NY" 
	} 
	{ 
		single = sk6ed_tinyqp 
		text_name = #"Tiny QP" 
	} 
	{ 
		single = sk5ed_HP_Skatestreet 
		text_name = #"HP Skatestreet" 
	} 
	{ 
		single = sk6ed_hugeSticker 
		text_name = #"Huge Sticker" 
	} 
	{ 
		single = Sk3Ed_P_10x10x8 
		text_name = #"Short" 
	} 
	{ 
		single = sk6ed_qp_MidB 
		text_name = #"Pool Mid Boost" 
	} 
	{ 
		multiple = [ 
			{ Sk3Ed_P_10x10x8 [ 0 0 0 ] } 
			{ Sk3Ed_P_10x10x8 [ 1 0 0 ] } 
		] 
		name = Med 
		text_name = #"Med" 
	} 
	{ 
		multiple = [ 
			{ Sk3Ed_P_10x10x8 [ 0 0 0 ] } 
			{ Sk3Ed_P_10x10x8 [ 1 0 0 ] } 
			{ Sk3Ed_P_10x10x8 [ 2 0 0 ] } 
			{ Sk3Ed_P_10x10x8 [ 3 0 0 ] } 
		] 
		name = Long 
		text_name = #"Long" 
	} 
	{ 
		single = Sk3Ed_Pi_10x10x8 
		text_name = #"Small Inside Corner" 
	} 
	{ 
		single = Sk3Ed_Pi_20x20x8 
		text_name = #"Large Inside Corner" 
	} 
	{ 
		single = Sk3Ed_Po_10x10x8 
		text_name = #"Outside Corner" 
	} 
	{ 
		single = sk6ed_fountainLA 
		text_name = #"Fountain LA" 
	} 
	{ 
		single = sk5ed_ShipPool 
		text_name = #"Cruise Ship Pool" 
	} 
	{ 
		single = Sk3Ed_Pdp_01 
		text_name = #"Diving Platform" 
	} 
	{ 
		single = Sk3Ed_Pdb_01 
		text_name = #"Diving Block" 
	} 
	{ 
		single = sk6ed_Lamp 
		text_name = #"Australia Light" 
	} 
	{ 
		single = sk6ed_lamp_half 
		text_name = #"Australia Half" 
	} 
	{ 
		single = sk6ed_MarsLamp 
		text_name = #"Lamp Marseille" 
	} 
	{ 
		single = sk6ed_HILamp 
		text_name = #"HI Lamp" 
	} 
	{ 
		single = sk5ed_bigtraffic 
		text_name = #"Traffic Light 1" 
	} 
	{ 
		single = sk5ed_smalltraffic 
		text_name = #"Traffic Light 2" 
	} 
	{ 
		single = Sk3Ed_RA_10x10x4 
		text_name = #"Rail 1" 
	} 
	{ 
		single = Sk3Ed_RA_10x10x8 
		text_name = #"Rail 2" 
	} 
	{ 
		single = Sk3Ed_RA_10x10x12 
		text_name = #"Rail 3" 
	} 
	{ 
		single = Sk3Ed_RA_10x10x4_8 
		text_name = #"Rail 4" 
	} 
	{ 
		single = Sk3Ed_RA_10x10x8_12 
		text_name = #"Rail 5" 
	} 
	{ 
		single = Sk3Ed_RA_10x10x4_12 
		text_name = #"Rail 6" 
	} 
	{ 
		single = Sk3Ed_RA_10x10x12_8 
		text_name = #"Rail 7" 
	} 
	{ 
		single = Sk3Ed_RAsi_10x10x4 
		text_name = #"Rail 8" 
	} 
	{ 
		single = Sk3Ed_RAsi_10x10x8 
		text_name = #"Rail 9" 
	} 
	{ 
		single = Sk3Ed_RAsi_10x10x12 
		text_name = #"Rail 10" 
	} 
	{ 
		single = Sk3Ed_RAsi_20x20x4 
		text_name = #"Rail 11" 
	} 
	{ 
		single = Sk3Ed_RAsi_20x20x8 
		text_name = #"Rail 12" 
	} 
	{ 
		single = Sk3Ed_RAi_10x10x4 
		text_name = #"Low Tight Corner" 
	} 
	{ 
		single = Sk3Ed_RAi_10x10x8 
		text_name = #"Med Tight Corner" 
	} 
	{ 
		single = Sk3Ed_RAi_10x10x12 
		text_name = #"High Tight Corner" 
	} 
	{ 
		single = Sk3Ed_RAi_20x20x4 
		text_name = #"Low Corner" 
	} 
	{ 
		single = Sk3Ed_RAi_20x20x8 
		text_name = #"Med Corner" 
	} 
	{ 
		single = Sk3Ed_RAi_20x20x12 
		text_name = #"High Corner" 
	} 
	{ 
		single = sk5ed_Railroad 
		text_name = #"Railroad" 
	} 
	{ 
		single = sk5ed_Railroad90 
		text_name = #"Railroad 90" 
	} 
	{ 
		single = sk5ed_Srail 
		text_name = #"S Rail" 
	} 
	{ 
		single = sk5ed_Srailcenter 
		text_name = #"S Rail Center" 
	} 
	{ 
		single = sk5ed_SDRail 
		text_name = #"SD Rail" 
	} 
	{ 
		single = Sk4Ed_SF2_TnAPipe01 
		text_name = #"3rd Piping 1" 
	} 
	{ 
		single = Sk4Ed_SF2_TnAPipe03 
		text_name = #"3rd Piping 2" 
	} 
	{ 
		single = sk5ed_wavysmall 
		text_name = #"Wavy Concrete" 
	} 
	{ 
		single = sk5ed_wavyconcretebig 
		text_name = #"Wavy Concrete Big" 
	} 
	{ 
		single = sk5ed_curveconcrete 
		text_name = #"Wavy Concrete Curved" 
	} 
	{ 
		single = sk5ed_upcurve 
		text_name = #"Wavy Concrete Up" 
	} 
	{ 
		single = sk5ed_Swingrail 
		text_name = #"Swing Rail" 
	} 
	{ 
		single = sk6ed_log_med 
		text_name = #"Log Mid" 
	} 
	{ 
		single = sk6ed_BOrail 
		text_name = #"Rail Boston" 
	} 
	{ 
		single = Sk3Ed_S_10x10x4 
		text_name = #"Low" 
	} 
	{ 
		single = Sk3Ed_Si_10x10x4 
		text_name = #"Low Inside Corner" 
	} 
	{ 
		single = Sk3Ed_Si2_10x10x4 
		text_name = #"Low Inside Decked Corner" 
	} 
	{ 
		single = Sk3Ed_So_10x10x4 
		text_name = #"Low Outside Pyramid Corner" 
	} 
	{ 
		single = Sk3Ed_So2_10x10x4 
		text_name = #"Low Outside Corner" 
	} 
	{ 
		single = Sk3Ed_S_10x10x8 
		text_name = #"High" 
	} 
	{ 
		single = Sk3Ed_Si_10x10x8 
		text_name = #"High Inside Corner" 
	} 
	{ 
		single = Sk3Ed_Si2_10x10x8 
		text_name = #"High Inside Decked Corner" 
	} 
	{ 
		single = Sk3Ed_So_10x10x8 
		text_name = #"High Outside Pyramid Corner" 
	} 
	{ 
		single = Sk3Ed_So2_10x10x8 
		text_name = #"High Outside Corner" 
	} 
	{ 
		single = Sk3Ed_S_10x20x4 
		text_name = #"Low Long" 
	} 
	{ 
		single = Sk3Ed_Si_20x20x4 
		text_name = #"Low Long Inside Corner" 
	} 
	{ 
		single = Sk3Ed_Si2_20x20x4 
		text_name = #"Low Long Inside Decked Corner" 
	} 
	{ 
		single = Sk3Ed_So_20x20x4 
		text_name = #"Low Long Outside Pyramid Corner" 
	} 
	{ 
		single = Sk3Ed_So2_20x20x4 
		text_name = #"Low Long Outside Corner" 
	} 
	{ 
		single = Sk3Ed_S_10x20x8 
		text_name = #"High Long" 
	} 
	{ 
		single = Sk3Ed_Si_20x20x8 
		text_name = #"High Long Inside Corner" 
	} 
	{ 
		single = Sk3Ed_Si2_20x20x8 
		text_name = #"High Long Inside Decked Corner" 
	} 
	{ 
		single = Sk3Ed_So_20x20x8 
		text_name = #"High Long Outside Pyramid Corner" 
	} 
	{ 
		single = Sk3Ed_So2_20x20x8 
		text_name = #"High Long Outside Corner" 
	} 
	{ 
		single = sk5ed_45Launch 
		text_name = #"45 Launch Ramp" 
	} 
	{ 
		single = sk5ed_45LaunchMed 
		text_name = #"45 Launch Ramp Med" 
	} 
	{ 
		single = sk5ed_45LaunchLow 
		text_name = #"45 Short Launch Ramp" 
	} 
	{ 
		single = sk5ed_45LaunchMed01 
		text_name = #"45 Mid Launch Ramp" 
	} 
	{ 
		single = sk5ed_SlantedSmall 
		text_name = #"Slanted Small Ramp" 
	} 
	{ 
		single = sk5ed_SlantedBig 
		text_name = #"Slanted Big Ramp" 
	} 
	{ 
		single = sk5ed_SlantedTall01 
		text_name = #"Slanted Tall Ramp" 
	} 
	{ 
		single = sk5ed_SlantedTall02 
		text_name = #"Slanted Tall Corner Ramp" 
	} 
	{ 
		single = sk6ed_RailSlanted01 
		text_name = #"Rail Slanted 1" 
	} 
	{ 
		single = sk6ed_RailSlanted02 
		text_name = #"Rail Slanted 2" 
	} 
	{ 
		single = sk6ed_RailSlanted03 
		text_name = #"Rail Slanted 3" 
	} 
	{ 
		single = sk6ed_RailSlanted04 
		text_name = #"Rail Slanted 4" 
	} 
	{ 
		single = sk6ed_RailSlanted05 
		text_name = #"Rail Slanted 5" 
	} 
	{ 
		single = sk6ed_RailSlanted06 
		text_name = #"Rail Slanted 6" 
	} 
	{ 
		single = sk6ed_RailSlanted07 
		text_name = #"Rail Slanted 7" 
	} 
	{ 
		single = sk6ed_RailSlanted08 
		text_name = #"Rail Slanted 8" 
	} 
	{ 
		single = sk6ed_RailSlanted09 
		text_name = #"Rail Slanted 9" 
	} 
	{ 
		single = sk6ed_RailSlanted010 
		text_name = #"Rail Slanted 10" 
	} 
	{ 
		single = sk6ed_RailSlanted011 
		text_name = #"Rail Slanted 11" 
	} 
	{ 
		single = sk6ed_RailSlanted012 
		text_name = #"Rail Slanted 12" 
	} 
	{ 
		single = Sk3Ed_S_10x10x09 
		text_name = #"Low Huge Slope" 
	} 
	{ 
		single = Sk3Ed_Si_10x10x09 
		text_name = #"Low Inside Huge Corner" 
	} 
	{ 
		single = Sk3Ed_Si2_10x10x09 
		text_name = #"Low Inside Huge Decked Corner" 
	} 
	{ 
		single = Sk3Ed_So_10x10x11 
		text_name = #"Low Outside Huge Pyramid Corner" 
	} 
	{ 
		single = Sk3Ed_So2_10x10x09 
		text_name = #"Low Outside Huge Corner" 
	} 
	{ 
		single = Sk3Ed_S_10x10x11 
		text_name = #"High Huge Slope" 
	} 
	{ 
		single = Sk3Ed_Si_10x10x10 
		text_name = #"High Inside Huge Corner" 
	} 
	{ 
		single = Sk3Ed_Si2_10x10x10 
		text_name = #"High Inside Huge Decked Corner" 
	} 
	{ 
		single = Sk3Ed_So_10x10x10 
		text_name = #"High Outside Big Pyramid Corner" 
	} 
	{ 
		single = Sk3Ed_So2_10x10x10 
		text_name = #"High Outside Huge Corner" 
	} 
	{ 
		single = Sk3Ed_S_10x20x09 
		text_name = #"Low Huge Long Slope" 
	} 
	{ 
		single = Sk3Ed_Si_20x20x09 
		text_name = #"Low Long Inside Huge Corner" 
	} 
	{ 
		single = Sk3Ed_Si2_20x20x10 
		text_name = #"Low Long Inside Huge Decked Corner" 
	} 
	{ 
		single = Sk3Ed_So_20x20x09 
		text_name = #"Low Long Outside Huge Pyramid Corner" 
	} 
	{ 
		single = Sk3Ed_So2_20x20x09 
		text_name = #"Low Long Outside Huge Corner" 
	} 
	{ 
		single = Sk3Ed_S_10x20x10 
		text_name = #"High Huge Long Slope" 
	} 
	{ 
		single = Sk3Ed_Si_20x20x10 
		text_name = #"High Long Inside Huge Corner" 
	} 
	{ 
		single = Sk3Ed_Si2_20x20x09 
		text_name = #"High Long Inside Huge Decked Corner" 
	} 
	{ 
		single = Sk3Ed_So_20x20x10 
		text_name = #"High Long Outside Huge Pyramid Corner" 
	} 
	{ 
		single = Sk3Ed_So2_20x20x10 
		text_name = #"High Long Outside Huge Corner" 
	} 
	{ 
		single = Sk3Ed_ST_10x10x2 
		text_name = #"Double" 
	} 
	{ 
		single = Sk3Ed_STi_10x10x2 
		text_name = #"Double Inside Corner" 
	} 
	{ 
		single = Sk3Ed_STi2_10x10x2 
		text_name = #"Double Inside Decked Corner" 
	} 
	{ 
		single = Sk3Ed_STo_10x10x2 
		text_name = #"Double Outside Pyramid Corner" 
	} 
	{ 
		single = Sk3Ed_STo2_10x10x2 
		text_name = #"Double Outside Corner" 
	} 
	{ 
		single = Sk3Ed_STio_10x10x2 
		text_name = #"Double Inside/Outside Corner" 
	} 
	{ 
		single = Sk3Ed_ST_10x10x4 
		text_name = #"Quad" 
	} 
	{ 
		single = Sk3Ed_STi_10x10x4 
		text_name = #"Quad Inside Corner" 
	} 
	{ 
		single = Sk3Ed_STi2_10x10x4 
		text_name = #"Quad Inside Decked Corner" 
	} 
	{ 
		single = Sk3Ed_STo_10x10x4 
		text_name = #"Quad Outside Pyramid Corner" 
	} 
	{ 
		single = Sk3Ed_STo2_10x10x4 
		text_name = #"Quad Outside Corner" 
	} 
	{ 
		single = Sk3Ed_STio_10x10x4 
		text_name = #"Quad Inside/Outside Corner" 
	} 
	{ 
		single = sk6ed_RailStair01 
		text_name = #"Rail Stair 1" 
	} 
	{ 
		single = sk6ed_RailStair02 
		text_name = #"Rail Stair 2" 
	} 
	{ 
		single = sk6ed_RailStair03 
		text_name = #"Rail Stair 3" 
	} 
	{ 
		single = sk6ed_RailStair04 
		text_name = #"Rail Stair 4" 
	} 
	{ 
		single = sk6ed_RailStair05 
		text_name = #"Rail Stair 5" 
	} 
	{ 
		single = sk6ed_RailStair06 
		text_name = #"Rail Stair 6" 
	} 
	{ 
		single = Sk4Ed_Sch_BigStairs 
		text_name = #"Big School Stair/Ramp" 
	} 
	{ 
		single = Sk5Ed_SF2_24Stair01 
		text_name = #"24 Set" 
	} 
	{ 
		single = Sk3Ed_PB_Stairs01 
		text_name = #"Bleachers" 
	} 
	{ 
		single = Sk3Ed_MWa_20x20 
		text_name = #"Water" 
	} 
	{ 
		single = Sk5ed_Water1square 
		text_name = #"Water Square" 
	} 
	{ 
		single = Sk3Ed_MLa_20x20 
		text_name = #"Lava" 
	} 
	{ 
		single = Sk5ed_lava1square 
		text_name = #"Lava Square" 
	} 
	{ 
		single = Sk6ed_Acid 
		text_name = #"Acid Pit" 
	} 
	{ 
		single = Sk3Ed_MPu_20x20x8 
		text_name = #"Pungee Pit" 
	} 
	{ 
		single = Sk5ed_Concrete 
		text_name = #"Concrete" 
	} 
	{ 
		single = Sk5ed_Concretesquare 
		text_name = #"Concrete Square" 
	} 
	{ 
		single = sk5ed_Grass 
		text_name = #"Grass" 
	} 
	{ 
		single = sk5ed_Grass1square 
		text_name = #"Grass Square" 
	} 
	{ 
		single = sk5ed_sand 
		text_name = #"Sand" 
	} 
	{ 
		single = sk5ed_sand01 
		text_name = #"Sand Square" 
	} 
	{ 
		single = sk5ed_speedboostGS 
		text_name = #"Speed Booster Small" 
	} 
	{ 
		single = sk5ed_speedboostG 
		text_name = #"Speed Booster" 
	} 
	{ 
		single = sk6ed_lidsmall 
		text_name = #"Lid Small" 
	} 
	{ 
		single = sk6ed_lidsquare 
		text_name = #"Lid Square" 
	} 
	{ 
		single = sk6ed_lidround 
		text_name = #"Lid Round" 
	} 
	{ 
		single = sk5ed_street 
		text_name = #"Street" 
	} 
	{ 
		single = sk5ed_street_Mid 
		text_name = #"Street Mid" 
	} 
	{ 
		single = sk5ed_street_curve 
		text_name = #"Street Curved" 
	} 
	{ 
		single = sk5ed_straightcurbShort 
		text_name = #"Curb Short" 
	} 
	{ 
		single = sk5ed_curvedcurb 
		text_name = #"Curved Curb" 
	} 
	{ 
		single = sk5ed_straightcurb 
		text_name = #"Curb" 
	} 
	{ 
		single = sk5ed_curvedcurbQuarter 
		text_name = #"Curved Curb Quarter" 
	} 
	{ 
		single = sk5ed_curvedcurbHalf 
		text_name = #"Curved Curb Half" 
	} 
	{ 
		single = sk5ed_curvedcurbFull 
		text_name = #"Curved Curb Full" 
	} 
	{ 
		single = Sk4Ed_SF2_Planter01 
		text_name = #"Short Flower Planter Blue" 
	} 
	{ 
		single = Sk4Ed_SF2_Planter02 
		text_name = #"Short Flower Planter Pink" 
	} 
	{ 
		single = Sk3Ed_Gb_10x10 
		text_name = #"Small Bush Planter" 
	} 
	{ 
		single = Sk3Ed_Gb_20x10 
		text_name = #"Long Bush Planter" 
	} 
	{ 
		single = Sk3Ed_Gt_20x20 
		text_name = #"Tree Planter" 
	} 
	{ 
		single = sk6ed_bushsmall 
		text_name = #"Bush Small" 
	} 
	{ 
		single = sk6ed_bushmid 
		text_name = #"Bush Mid" 
	} 
	{ 
		single = sk5ed_treetall 
		text_name = #"Tree Tall" 
	} 
	{ 
		single = sk5ed_hut 
		text_name = #"Hut" 
	} 
	{ 
		single = sk6ed_electricbox 
		text_name = #"Electric Box" 
	} 
	{ 
		single = sk6ed_house_small 
		text_name = #"Metal Hut" 
	} 
	{ 
		single = sk6ed_smallhouse 
		text_name = #"House Small" 
	} 
	{ 
		single = sk5ed_Ghetto 
		text_name = #"House Projects" 
	} 
	{ 
		single = sk6ed_NYsnack 
		text_name = #"NY Snack Shack" 
	} 
	{ 
		single = sk6ed_church 
		text_name = #"Church" 
	} 
	{ 
		single = sk6ed_Pyramidsmall 
		text_name = #"Pyramid Small" 
	} 
	{ 
		single = sk6ed_Pyramidmid 
		text_name = #"Pyramid Mid" 
	} 
	{ 
		single = sk6ed_Pyramidbig 
		text_name = #"Pyramid Big" 
	} 
	{ 
		single = sk6ed_HugePyra 
		text_name = #"Huge Pyramid" 
	} 
	{ 
		single = sk5ed_Rooftop 
		text_name = #"SC2 Building" 
	} 
	{ 
		single = sk5ed_BigSkyscraper 
		text_name = #"Big Skyscraper" 
	} 
	{ 
		single = sk6ed_hpcar 
		text_name = #"HP Car" 
	} 
	{ 
		single = sk6ed_jeep 
		text_name = #"Jeep Wrangler" 
	} 
	{ 
		single = sk6ed_sign_nono01 
		text_name = #"Sign Handicap" 
	} 
	{ 
		single = sk6ed_sign_nono 
		text_name = #"Sign No Entry" 
	} 
	{ 
		single = sk6ed_sign_nobeyond 
		text_name = #"Sign Beyond Point" 
	} 
	{ 
		single = sk6ed_pole 
		text_name = #"Pole" 
	} 
	{ 
		single = sk6ed_PoleBE 
		text_name = #"Pole Berlin" 
	} 
	{ 
		single = sk6ed_tombstone 
		text_name = #"Tombstone" 
	} 
	{ 
		single = Sk4Ed_SF2_TrashBox 
		text_name = #"Trash Can" 
	} 
	{ 
		single = sk5ed_Mailbox 
		text_name = #"Mailbox" 
	} 
	{ 
		single = sk6ed_hydrant 
		text_name = #"Hydrant" 
	} 
	{ 
		single = Sk3Ed_Dumpster01 
		text_name = #"Dumpster" 
	} 
	{ 
		single = Sk3Ed_Dumpster02 
		text_name = #"Corner Dumpster" 
	} 
	{ 
		single = Sk4Ed_SF2_Newsstands 
		text_name = #"Newsstands" 
	} 
	{ 
		single = sk5ed_bbhoop 
		text_name = #"Basketball Hoop" 
	} 
	{ 
		single = sk5ed_candy 
		text_name = #"Candy Machine" 
	} 
	{ 
		single = sk6ed_Porta 
		text_name = #"Porta Potty" 
	} 
	{ 
		single = sk6ed_whitepicketfence 
		text_name = #"White Picket" 
	} 
	{ 
		single = sk6ed_whitepicketfence_edge 
		text_name = #"White Picket Edge" 
	} 
	{ 
		single = sk6ed_Welcome 
		text_name = #"Welcome Mat" 
	} 
	{ 
		single = sk6ed_IndianRug 
		text_name = #"Asian Rug" 
	} 
	{ 
		single = sk6ed_couch 
		text_name = #"Couch" 
	} 
	{ 
		single = sk5ed_dinnertable 
		text_name = #"Coffee Table" 
	} 
	{ 
		single = sk6ed_Fridge 
		text_name = #"Huge Fridge" 
	} 
	{ 
		single = Sk3Ed_MFo_01 
		text_name = #"Fountain" 
	} 
	{ 
		single = sk6ed_ladderSmall 
		text_name = #"Ladder Small" 
	} 
	{ 
		single = sk6ed_ladderMid 
		text_name = #"Ladder Mid" 
	} 
	{ 
		single = sk6ed_ladderTall 
		text_name = #"Ladder Tall" 
	} 
	{ 
		single = sk6ed_GarbageLA 
		text_name = #"Garbage LA" 
	} 
	{ 
		single = TRGP_ArcoWindow 
		text_name = #"Window" 
	} 
	{ 
		single = sk6ed_crate 
		text_name = #"Crate" 
	} 
	{ 
		single = sk6ed_BAGlass 
		text_name = #"BA Glass" 
	} 
	{ 
		single = sk6ed_Graffiti_Ammo 
		text_name = #"Ammo Graffiti Box" 
	} 
	{ 
		single = BO_Classic_Barrel 
		text_name = #"BO Classic Barrel" 
	} 
	{ 
		single = sk6ed_hugepoolP12 
		text_name = #"Huge Drop-In Lowest" 
	} 
	{ 
		single = sk6ed_hugedropin 
		text_name = #"Huge Drop-In Low" 
	} 
	{ 
		single = sk6ed_hugepoolP10 
		text_name = #"Huge Drop-In Med" 
	} 
	{ 
		single = sk6ed_hugepoolP11 
		text_name = #"Huge Drop-In High" 
	} 
	{ 
		single = sk6ed_qppieceCorner 
		text_name = #"Huge QP Corner Small" 
	} 
	{ 
		single = sk6ed_qppiececorner1 
		text_name = #"Huge QP Corner Med" 
	} 
	{ 
		single = sk6ed_qppiececornerB 
		text_name = #"Huge QP Corner Big" 
	} 
	{ 
		single = Sk3Ed_P_10x10x09 
		text_name = #"Huge Low Pool" 
	} 
	{ 
		multiple = [ 
			{ Sk3Ed_P_10x10x09 [ 0 0 0 ] } 
			{ Sk3Ed_P_10x10x09 [ 3 0 0 ] } 
		] 
		name = Huge_Med_Pool 
		text_name = #"Huge Med Pool" 
	} 
	{ 
		multiple = [ 
			{ Sk3Ed_P_10x10x09 [ 0 0 0 ] } 
			{ Sk3Ed_P_10x10x09 [ 3 0 0 ] } 
			{ Sk3Ed_P_10x10x09 [ 6 0 0 ] } 
			{ Sk3Ed_P_10x10x09 [ 9 0 0 ] } 
		] 
		name = Huge_Long_Pool 
		text_name = #"Huge Long Pool" 
	} 
	{ 
		single = Sk3Ed_QPd_10x10x13 
		text_name = #"Huge Low" 
	} 
	{ 
		multiple = [ 
			{ Sk3Ed_QPd_10x10x13 [ 0 0 0 ] } 
			{ Sk3Ed_QPd_10x10x13 [ 3 0 0 ] } 
		] 
		name = Huge_Mid 
		text_name = #"Huge Med" 
	} 
	{ 
		multiple = [ 
			{ Sk3Ed_QPd_10x10x13 [ 0 0 0 ] } 
			{ Sk3Ed_QPd_10x10x13 [ 3 0 0 ] } 
			{ Sk3Ed_QPd_10x10x13 [ 6 0 0 ] } 
			{ Sk3Ed_QPd_10x10x13 [ 9 0 0 ] } 
		] 
		name = Huge_Long 
		text_name = #"Huge Long" 
	} 
	{ 
		single = sk6ed_hugepoolP01 
		text_name = #"Huge Pool Corner In" 
	} 
	{ 
		single = sk6ed_hugepoolP02 
		text_name = #"Huge Pool Corner Out" 
	} 
	{ 
		single = sk6ed_hugepoolP03 
		text_name = #"Huge Pool Deck In" 
	} 
	{ 
		single = sk6ed_hugepoolP04 
		text_name = #"Huge Pool Deck Out" 
	} 
	{ 
		single = sk6ed_hugepoolP06 
		text_name = #"Huge Pool Deck Tall" 
	} 
	{ 
		single = sk6ed_hugepoolP07 
		text_name = #"Huge Pool Corner" 
	} 
	{ 
		single = sk6ed_hugepoolP08 
		text_name = #"Huge Pool Corner Inverted" 
	} 
	{ 
		single = sk6ed_hugepoolP09 
		text_name = #"Huge Pool Piece" 
	} 
	{ single = Sk3Ed_QPd_10x10x09 
		text_name = #"Huge Lower" 
	} 
	{ 
		multiple = [ 
			{ Sk3Ed_QPd_10x10x09 [ 0 0 0 ] } 
			{ Sk3Ed_QPd_10x10x09 [ 3 0 0 ] } 
		] 
		name = Low_Med_Huge 
		text_name = #"Huge Low Med" 
	} 
	{ 
		multiple = [ 
			{ Sk3Ed_QPd_10x10x09 [ 0 0 0 ] } 
			{ Sk3Ed_QPd_10x10x09 [ 3 0 0 ] } 
			{ Sk3Ed_QPd_10x10x09 [ 6 0 0 ] } 
			{ Sk3Ed_QPd_10x10x09 [ 9 0 0 ] } 
		] 
		name = Low_Long_Huge 
		text_name = #"Huge Low Long" 
	} 
	{ 
		single = sk6ed_hugebench 
		text_name = #"Huge Bench" 
	} 
	{ 
		multiple = [ 
			{ Sk3Ed_Fd1_10x10 [ 0 1 0 ] } 
		] 
		name = floor_wall_block1 
		is_riser 
	} 
	{ 
		single = Sk3Ed_Fd1_10x10 
		pos = [ 0 1 0 ] 
		name = floor_block1 
		is_riser 
		no_rails 
	} 
	{ 
		multiple = [ 
			{ Sk3Ed_Fd1_10x10 [ 0 1 0 ] } 
		] 
		name = floor_wall_block2 
		is_riser 
	} 
	{ 
		single = Sk3Ed_Fd1_10x10 
		pos = [ 0 1 0 ] 
		name = floor_block2 
		is_riser 
		no_rails 
	} 
	{ 
		multiple = [ 
			{ Sk3Ed_F_10x10 [ 0 1 0 ] } 
		] 
		name = floor_wall_block3 
		is_riser 
	} 
	{ 
		single = Sk3Ed_F_10x10 
		pos = [ 0 1 0 ] 
		name = floor_block3 
		is_riser 
		no_rails 
	} 
	{ 
		multiple = [ 
			{ Sk3Ed_F_10x10 [ 0 1 0 ] } 
		] 
		name = floor_wall_block4 
		is_riser 
	} 
	{ 
		single = Sk3Ed_F_10x10 
		pos = [ 0 1 0 ] 
		name = floor_block4 
		is_riser 
		no_rails 
	} 
	{ 
		single = Sk4Ed_Fence_20x20 
		text_name = #"Big fence" 
	} 
	{ 
		single = sk5ed_Matttest 
		name = riser_below 
		pos = [ 0 0 0 ] 
		is_riser 
		text_name = #"Underground" 
	} 
	{ 
		single = sk5ed_Matttest01 
		name = riser_above0 
		pos = [ 0 0 0 ] 
		is_riser 
		text_name = #"4ft" 
	} 
	{ 
		single = sk5ed_Matttest02 
		name = riser_above1 
		pos = [ 0 0 0 ] 
		is_riser 
		text_name = #"8ft" 
	} 
	{ 
		single = sk5ed_Matttest03 
		name = riser_above2 
		pos = [ 0 0 0 ] 
		is_riser 
		text_name = #"12ft" 
	} 
	{ 
		single = sk5ed_Matttest04 
		name = riser_above3 
		pos = [ 0 0 0 ] 
		is_riser 
		text_name = #"16ft" 
	} 
	{ 
		single = sk5ed_Matttest05 
		name = riser_above4 
		pos = [ 0 0 0 ] 
		is_riser 
		text_name = #"20ft" 
	} 
	{ 
		single = sk5ed_Matttest06 
		name = riser_above5 
		pos = [ 0 0 0 ] 
		is_riser 
		text_name = #"24ft" 
	} 
	{ 
		single = sk5ed_Matttest07 
		name = riser_above6 
		pos = [ 0 0 0 ] 
		is_riser 
		text_name = #"28ft" 
	} 
	{ 
		single = sk5ed_Matttest08 
		name = riser_above7 
		pos = [ 0 0 0 ] 
		is_riser 
		text_name = #"32ft" 
	} 
	{ 
		single = sk5ed_Matttest09 
		name = riser_above8 
		pos = [ 0 0 0 ] 
		is_riser 
		text_name = #"36ft" 
	} 
	{ 
		single = sk5ed_Matttest10 
		name = riser_above9 
		pos = [ 0 0 0 ] 
		is_riser 
		text_name = #"40ft" 
	} 
	{ 
		single = sk5ed_Matttest11 
		name = riser_above10 
		pos = [ 0 0 0 ] 
		is_riser 
		text_name = #"44ft" 
	} 
	{ 
		single = sk5ed_Matttest12 
		name = riser_above11 
		pos = [ 0 0 0 ] 
		is_riser 
		text_name = #"48ft" 
	} 
	{ 
		single = sk5ed_Matttest13 
		name = riser_above12 
		pos = [ 0 0 0 ] 
		is_riser 
		text_name = #"52ft" 
	} 
	{ 
		single = sk5ed_Matttest14 
		name = riser_above13 
		pos = [ 0 0 0 ] 
		is_riser 
		text_name = #"56ft" 
	} 
	{ 
		single = sk5ed_Matttest15 
		name = riser_above14 
		pos = [ 0 0 0 ] 
		is_riser 
		text_name = #"60ft" 
	} 
	{ 
		single = Sk3Ed_F_10x10 
		name = riser_floor 
		pos = [ 0 1 0 ] 
		is_riser 
		no_rails 
	} 
	{ 
		single = Sk3Ed_F_10x10 
		pos = [ 0 0 0 ] 
		name = riser_floor_below 
		is_riser 
		no_rails 
	} 
] 
Ed_Save_Map = [ 
	Sk3Ed_RS_1p 
	Sk3Ed_RS_Mp 
	Sk3Ed_Rs_Ho 
	Sk3Ed_Rs_KOTH 
	Sk3Ed_GAP_01 
	Sk6Ed_dead 
	Sk6Ed_dead 
	Sk6Ed_dead 
	Sk3Ed_PB_Stairs01 
	Sk6Ed_dead 
	Sk6Ed_dead 
	Sk6Ed_dead 
	Sk6Ed_dead 
	Sk6Ed_dead 
	Sk6Ed_dead 
	Sk6Ed_dead 
	Sk3Ed_FB_Tok02 
	Sk3Ed_FB_Rio01 
	Sk6Ed_dead 
	Sk6Ed_dead 
	Sk3Ed_FB_Sub02 
	Sk3Ed_FB_Sub03 
	Sk3Ed_FB_30x30x4_01 
	Sk3Ed_FB_30x30x4_02 
	Sk3Ed_FB_30x30x4_03 
	Sk3Ed_FB_30x30x4_04 
	Sk3Ed_FB_30x30x8_01 
	Sk3Ed_FB_30x30x8_02 
	Sk3Ed_FB_30x30x8_03 
	Sk3Ed_FB_30x30x8_04 
	Sk3Ed_Bs_01 
	Sk3Ed_Bs_02 
	Sk3Ed_Bs_03 
	Sk3Ed_Bs_04 
	Sk3Ed_Bs_05 
	Sk3Ed_Bp_01 
	Sk3Ed_Bp_02 
	Sk3Ed_W_10x10x5 
	Sk3Ed_We_10x10x5 
	Sk3Ed_W_10x10x2 
	Sk3Ed_We_10x10x2 
	Sk3Ed_QPd_10x10x8 
	Sk6Ed_dead 
	Low_Med 
	Sk6Ed_dead 
	Low_Long 
	Sk6Ed_dead 
	Sk3Ed_QPdi_10x10x8 
	Sk3Ed_QPdo_10x10x8 
	Sk3Ed_QPd_10x10x12 
	Sk6Ed_dead 
	High_Med 
	Sk6Ed_dead 
	High_Long 
	Sk6Ed_dead 
	Sk3Ed_QPdi_10x10x12 
	Sk3Ed_QPdo_10x10x12 
	Sk3Ed_QPdR_10x10x4 
	Sk3Ed_QPdR_10x10x8 
	Sk3Ed_QPdR_10x10x12 
	Sk3Ed_QPdR_10x10x16 
	Low_QP_Low_rail 
	Low_QP_Med_rail 
	Low_QP_High_rail 
	Low_QP_Low_side_rail 
	Low_QP_Med_side_rail 
	Low_QP_High_side_rail 
	High_QP_Low_rail 
	High_QP_Med_rail 
	High_QP_High_rail 
	High_QP_Low_side_rail 
	High_QP_Med_side_rail 
	High_QP_High_side_rail 
	Sk3Ed_P_10x10x8 
	Med 
	Long 
	Sk3Ed_Pi_10x10x8 
	Sk3Ed_Pi_20x20x8 
	Sk3Ed_Po_10x10x8 
	Sk3Ed_Pdp_01 
	Sk3Ed_Pdb_01 
	Sk3Ed_RAi_10x10x4 
	Sk3Ed_RAi_10x10x8 
	Sk3Ed_RAi_10x10x12 
	Sk3Ed_RAi_20x20x4 
	Sk3Ed_RAi_20x20x8 
	Sk3Ed_RAi_20x20x12 
	Sk3Ed_S_10x10x4 
	Sk3Ed_Si_10x10x4 
	Sk3Ed_Si2_10x10x4 
	Sk3Ed_So_10x10x4 
	Sk3Ed_So2_10x10x4 
	Sk3Ed_S_10x10x8 
	Sk3Ed_Si_10x10x8 
	Sk3Ed_Si2_10x10x8 
	Sk3Ed_So_10x10x8 
	Sk3Ed_So2_10x10x8 
	Sk3Ed_S_10x20x4 
	Sk3Ed_Si_20x20x4 
	Sk3Ed_Si2_20x20x4 
	Sk3Ed_So_20x20x4 
	Sk3Ed_So2_20x20x4 
	Sk3Ed_S_10x20x8 
	Sk3Ed_Si_20x20x8 
	Sk3Ed_Si2_20x20x8 
	Sk3Ed_So_20x20x8 
	Sk3Ed_So2_20x20x8 
	Sk3Ed_ST_10x10x2 
	Sk3Ed_STi_10x10x2 
	Sk3Ed_STi2_10x10x2 
	Sk3Ed_STo_10x10x2 
	Sk3Ed_STo2_10x10x2 
	Sk3Ed_STio_10x10x2 
	Sk3Ed_ST_10x10x4 
	Sk3Ed_STi_10x10x4 
	Sk3Ed_STi2_10x10x4 
	Sk3Ed_STo_10x10x4 
	Sk3Ed_STo2_10x10x4 
	Sk3Ed_STio_10x10x4 
	Sk3Ed_Gt_20x20 
	Sk3Ed_Gb_20x10 
	Sk3Ed_Gb_10x10 
	Sk4Ed_Fence_10x10 
	Sk3Ed_Dumpster01 
	Sk3Ed_Dumpster02 
	Sk3Ed_MFo_01 
	Sk3Ed_MPu_20x20x8 
	Sk3Ed_MLa_20x20 
	Sk3Ed_MWa_20x20 
	floor_wall_block 
	wall_block 
	floor_block 
	Sk6Ed_dead 
	Sk4Ed_Sch_BigStairs 
	Sk4Ed_Sch_Spine 
	Sk6Ed_dead 
	Sk4Ed_SF2_Bench 
	Sk6Ed_dead 
	Sk6Ed_dead 
	Sk6Ed_dead 
	Sk4Ed_SF2_Newsstands 
	Sk6Ed_dead 
	Sk4Ed_SF2_Planter01 
	Sk4Ed_SF2_Planter02 
	Sk6Ed_dead 
	Sk4Ed_SF2_TnAKicker01 
	Sk4Ed_SF2_TnAPipe01 
	Sk6Ed_dead 
	Sk4Ed_SF2_TnAPipe03 
	Sk4Ed_SF2_TrashBox 
	Sk4Ed_Alc_Kicker 
	Sk4Ed_Alc_CrustyBench 
	Sk4Ed_Alc_Bench 
	Sk4Ed_Team_Blue 
	Sk4Ed_Team_Red 
	Sk4Ed_Team_Green 
	Sk4Ed_Team_Yellow 
	Sk3Ed_QPi_10x10x8 
	Sk3Ed_QPo_10x10x8 
	Sk3Ed_QPo_10x10x12 
	Sk3Ed_QPi_10x10x12 
	Sk5Ed_Sel_01 
	Sk5Ed_HPTunnel_01 
	Sk5Ed_QPshortMid_01 
	Sk5Ed_W_10x10x06_01 
	Sk5Ed_W_10x10x06_02 
	Sk5Ed_RA_10x10x15_03 
	Sk5Ed_RA_10x10x15_04 
	Sk5ED_BoobB_01 
	Sk5ED_BoobB_02 
	Sk5ED_BoobB_03 
	Sk5Ed_SF2_24Stair01 
	sk5ed_Billboard_big 
	sk5ed_Billboard_big45 
	sk5ed_Billboard_Med 
	sk5ed_Billboard_Med45 
	sk5ed_Railroad 
	sk5ed_Railroad90 
	Sk6Ed_dead 
	Sk6Ed_dead 
	sk3ed_AP_walkway 
	Sk5ed_LAcurve 
	Sk5ed_LAstraight 
	sk5ed_ShipPool 
	sk5ed_deal 
	Sk5Ed_W_Slated_01 
	Sk6Ed_dead 
	Sk6Ed_dead 
	sk5ed_Rooftop 
	Sk5Ed_SideWall 
	Sk5Ed_BigSideWall 
	Sk5Ed_90Wall 
	Sk6Ed_dead 
	sk5ed_Swingrail 
	Sk6Ed_dead 
	Sk6Ed_dead 
	sk5ed_KickerWall 
	sk5ed_Tightkicker 
	sk5ed_Srail 
	sk5ed_Srailcenter 
	sk5ed_wavysmall 
	sk5ed_wavyconcretebig 
	sk5ed_curveconcrete 
	sk5ed_upcurve 
	Sk6Ed_dead 
	sk5ed_curvedLedge 
	sk5ed_curvedLedge01 
	sk5ed_curvedLedge02 
	sk5ed_curvedLedge03 
	sk5ed_shortwall 
	Sk6Ed_dead 
	Sk6Ed_dead 
	Sk6Ed_dead 
	Sk6Ed_dead 
	Sk6Ed_dead 
	Sk6Ed_dead 
	sk5ed_BigSkyscraper 
	sk5ed_curvedcurbQuarter 
	sk5ed_curvedcurbHalf 
	sk5ed_curvedcurbFull 
	sk5ed_straightcurb 
	sk5ed_bigtraffic 
	sk5ed_smalltraffic 
	sk5ed_straightcurbShort 
	Sk6Ed_dead 
	Sk6Ed_dead 
	sk5ed_hut 
	Sk6Ed_dead 
	sk5ed_Ghetto 
	Sk6Ed_dead 
	Sk6Ed_dead 
	Sk6Ed_dead 
	sk5ed_street 
	sk5ed_Grass 
	sk5ed_Mailbox 
	Sk5ed_Water1square 
	Sk5ed_lava1square 
	sk5ed_45Launch 
	sk5ed_45LaunchMed 
	sk5ed_45LaunchLow 
	sk5ed_45LaunchMed01 
	sk5ed_SlantedBig 
	sk5ed_SlantedSmall 
	sk5ed_SlantedTall01 
	sk5ed_SlantedTall02 
	Sk6Ed_dead 
	sk5ed_UndergroundRailed 
	sk5ed_undergroundStraightRailed 
	sk5ed_undergroundStraight 
	sk5ed_UndergroundCurved 
	Sk6Ed_dead 
	Sk6Ed_dead 
	Sk6Ed_dead 
	Sk6Ed_dead 
	Sk6Ed_dead 
	sk5ed_Shortwall01 
	sk5ed_Grass1square 
	sk5ed_SDRail 
	sk5ed_sdBench 
	sk5ed_bbhoop 
	sk5ed_sand 
	sk5ed_candy 
	Sk6Ed_dead 
	Sk6Ed_dead 
	Sk6Ed_dead 
	sk5ed_sand01 
	sk5ed_street_curve 
	Sk6Ed_dead 
	Sk5Ed_RA_10x10x15_02 
	sk5ed_curvedLedge04 
	sk5ed_Underground 
	Sk6Ed_dead 
	sk6ed_sign_nono01 
	sk6ed_sign_nono 
	sk5ed_treetall 
	sk5ed_treetall 
	sk6ed_bushmid 
	sk6ed_bushsmall 
	sk6ed_tombstone 
	sk6ed_sign_nobeyond 
	sk6ed_lidsquare 
	sk6ed_lidround 
	sk6ed_lidsmall 
	sk6ed_fence 
	sk6ed_fencefiller 
	Sk6Ed_dead 
	Sk6Ed_dead 
	sk6ed_Bouy 
	sk6ed_church 
	sk6ed_whitepicketfence 
	sk6ed_whitepicketfence_edge 
	sk6ed_pyramidqpbig 
	sk6ed_Pyramidbig 
	sk6ed_Pyramidmid 
	sk6ed_Pyramidsmall 
	sk6ed_greatwall 
	sk6ed_greatwallmid 
	sk6ed_hpcar 
	Sk5ed_Concrete 
	Sk5ed_Concretesquare 
	sk5ed_street_Mid 
	sk6ed_Bench_BA_long 
	sk6ed_Bench_BA_med 
	sk6ed_Bench_BA_short 
	Sk6Ed_dead 
	sk6ed_log_med 
	Sk6Ed_dead 
	sk6ed_electricbox 
	Sk6Ed_dead 
	sk6ed_crypt 
	sk6ed_pole 
	sk6ed_BusStop 
	sk6ed_handicap_AU 
	sk6ed_house_small 
	Sk6Ed_dead 
	sk6ed_smallhouse 
	sk6ed_Lamp 
	Sk6Ed_dead 
	sk6ed_lamp_half 
	Sk6Ed_dead 
	Sk6Ed_dead 
	Sk6Ed_dead 
	Sk6Ed_dead 
	Sk6Ed_dead 
	Sk6Ed_dead 
	Sk6Ed_dead 
	Sk3Ed_FB_30x30x8_05 
	Sk3Ed_FB_30x30x8_06 
	Sk3Ed_FB_30x30x8_07 
	Sk3Ed_FB_30x30x8_08 
	Sk3Ed_RA_10x10x12_8 
	Sk6Ed_dead 
	Sk3Ed_RA_10x10x8_12 
	Sk6Ed_dead 
	Sk3Ed_RA_10x10x4_12 
	Sk3Ed_RA_10x10x4_8 
	Sk3Ed_RA_10x10x4 
	Sk3Ed_RA_10x10x8 
	Sk3Ed_RA_10x10x12 
	Sk3Ed_RAsi_10x10x4 
	Sk3Ed_RAsi_10x10x8 
	Sk3Ed_RAsi_10x10x12 
	Sk3Ed_RAsi_20x20x4 
	Sk3Ed_RAsi_20x20x8 
	Sk6Ed_dead 
	Sk6Ed_dead 
	sk6ed_HugePyra 
	Sk6Ed_dead 
	sk6ed_hugedropin 
	sk6ed_fencefilleredge 
	sk6ed_fenceedge 
	sk6ed_hugebench 
	sk6ed_qppiececornerB 
	sk6ed_qppiececorner1 
	sk6ed_qppieceCorner 
	sk6ed_qppiecemid 
	sk6ed_hugepoolP01 
	sk6ed_hugepoolP02 
	sk6ed_hugepoolP03 
	sk6ed_hugepoolP04 
	sk6ed_hugepoolP05 
	sk6ed_hugepoolP06 
	sk6ed_hugepoolP07 
	sk6ed_hugepoolP08 
	sk6ed_hugepoolP09 
	sk6ed_hugepoolP10 
	sk6ed_hugepoolP11 
	sk6ed_hugepoolP12 
	sk6ed_ladderSmall 
	sk6ed_ladderMid 
	sk6ed_ladderTall 
	sk6ed_ps2 
	sk6ed_cashsign 
	sk5ed_veniceBench 
	Sk6Ed_dead 
	sk6ed_HP_AU 
	sk6ed_couch 
	sk6ed_Welcome 
	sk5ed_dinnertable 
	sk6ed_PoleBE 
	Sk6Ed_dead 
	sk6ed_Fridge 
	sk6ed_IndianRug 
	sk6ed_BOrail 
	sk6ed_Porta 
	Sk6Ed_dead 
	sk6ed_SubwayRamp 
	sk6ed_venice_triangle 
	sk6ed_doubelsidedKick 
	sk5ed_HP_Skatestreet 
	sk6ed_fountainLA 
	sk6ed_GarbageLA 
	sk6ed_hugeSticker 
	sk6ed_MarsLamp 
	sk6ed_Marsqps 
	sk6ed_NYqpledge 
	sk6ed_NYsnack 
	Sk6Ed_dead 
	sk6ed_SSbigkicker 
	sk6ed_SSmidpiece 
	Sk6Ed_dead 
	sk6ed_SSrampmid 
	sk6ed_SSrampsmall 
	sk6ed_SSrampwide 
	sk6ed_SSroundkicker 
	sk6ed_SSrailbox 
	Sk6Ed_dead 
	Sk6Ed_dead 
	sk6ed_tinyqp 
	sk6ed_hydrant 
	sk6ed_greatwallCurved 
	sk6ed_RailSlanted01 
	sk6ed_RailSlanted02 
	sk6ed_RailSlanted03 
	sk6ed_RailSlanted04 
	sk6ed_RailSlanted05 
	sk6ed_RailSlanted06 
	sk6ed_RailSlanted07 
	sk6ed_RailSlanted08 
	sk6ed_RailSlanted09 
	sk6ed_RailSlanted010 
	sk6ed_RailSlanted011 
	sk6ed_RailSlanted012 
	sk6ed_RailStair01 
	sk6ed_RailStair02 
	sk6ed_RailStair03 
	sk6ed_RailStair04 
	sk6ed_RailStair05 
	sk6ed_RailStair06 
	sk5ed_speedboostG 
	sk5ed_speedboostGS 
	Sk6Ed_dead 
	Sk6Ed_dead 
	Sk6Ed_dead 
	Sk6Ed_dead 
	TRGP_ArcoWindow 
	sk6ed_crate 
	sk6ed_BAGlass 
	Sk6Ed_dead 
	BO_Classic_Barrel 
	sk6ed_HILamp 
	Sk6Ed_dead 
	Sk6ed_Acid 
	sk6ed_Kick_HighB 
	sk6ed_Kick_MidB 
	Sk6ed_qp_cornerB 
	sk6ed_qp_MidB 
	sk6ed_WallBoost 
	sk6ed_LaunchSB 
	sk6ed_LaunchBB 
	sk6ed_SSrampmidBooster 
	Sk5Ed_QPshortMid_01B 
	sk5ed_Matttest 
	sk5ed_Matttest01 
	sk5ed_Matttest02 
	sk5ed_Matttest03 
	sk5ed_Matttest04 
	sk5ed_Matttest05 
	sk5ed_Matttest06 
	sk5ed_Matttest07 
	sk5ed_Matttest08 
	sk5ed_Matttest09 
	sk5ed_Matttest10 
	sk5ed_Matttest11 
	sk5ed_Matttest12 
	sk5ed_Matttest13 
	sk5ed_Matttest14 
	sk5ed_Matttest15 
	sk6ed_jeep 
	Sk6Ed_dead 
	Sk6Ed_dead 
	Sk6Ed_dead 
	Sk6Ed_dead 
	sk5ed_curvedcurb 
	Sk3Ed_P_10x10x09 
	Huge_Med_Pool 
	Huge_Long_Pool 
	Sk3Ed_QPd_10x10x13 
	Huge_Mid 
	Huge_Long 
	Sk3Ed_S_10x10x09 
	Sk3Ed_Si_10x10x09 
	Sk3Ed_Si2_10x10x09 
	Sk3Ed_So_10x10x11 
	Sk3Ed_So2_10x10x09 
	Sk3Ed_S_10x10x11 
	Sk3Ed_Si_10x10x10 
	Sk3Ed_Si2_10x10x10 
	Sk3Ed_So_10x10x10 
	Sk3Ed_So2_10x10x10 
	Sk3Ed_S_10x20x09 
	Sk3Ed_Si_20x20x09 
	Sk3Ed_Si2_20x20x10 
	Sk3Ed_So_20x20x09 
	Sk3Ed_So2_20x20x09 
	Sk3Ed_S_10x20x10 
	Sk3Ed_Si_20x20x10 
	Sk3Ed_Si2_20x20x09 
	Sk3Ed_So_20x20x10 
	Sk3Ed_So2_20x20x10 
	sk6ed_Graffiti_Ammo 
	Sk3Ed_QPd_10x10x09 
	Low_Med_Huge 
	Low_Long_Huge 
	Sk6Ed_dead 
] 
Ed_Roadmask = [ 
] 
Ed_Light_Info = [ 
	[ 
		{ 
			ambient_const = 0.50000000000 
			ambient_rgb = VECTOR(1.00000000000, 1.00000000000, 0.95999997854) 
			falloff_const = 160000.00000000000 
			falloff_rgb = VECTOR(0.38999998569, 0.37999999523, 0.31999999285) 
			cursor_ambience = 1.50000000000 
			pos = [ 
				VECTOR(6.00000000000, 10.00000000000, 6.00000000000) 
				VECTOR(6.00000000000, 10.00000000000, -6.00000000000) 
				VECTOR(-6.00000000000, 10.00000000000, -6.00000000000) 
				VECTOR(-6.00000000000, 10.00000000000, 6.00000000000) 
			] 
		} 
		{ 
			ambient_const = 1.00000000000 
			ambient_rgb = VECTOR(1.00000000000, 1.00000000000, 0.95999997854) 
			falloff_const = 160000.00000000000 
			falloff_rgb = VECTOR(0.38999998569, 0.37999999523, 0.31999999285) 
			cursor_ambience = 1.50000000000 
			pos = [ 
				VECTOR(4.00000000000, 10.00000000000, 4.00000000000) 
				VECTOR(12.00000000000, 10.00000000000, 4.00000000000) 
				VECTOR(4.00000000000, 10.00000000000, 12.00000000000) 
				VECTOR(12.00000000000, 10.00000000000, 12.00000000000) 
			] 
		} 
		{ 
			ambient_const = 1.00000000000 
			ambient_rgb = VECTOR(1.00000000000, 1.00000000000, 0.95999997854) 
			falloff_const = 215000.00000000000 
			falloff_rgb = VECTOR(0.38999998569, 0.37999999523, 0.31999999285) 
			cursor_ambience = 1.50000000000 
			pos = [ 
				VECTOR(6.00000000000, 12.00000000000, 6.00000000000) 
				VECTOR(18.00000000000, 12.00000000000, 6.00000000000) 
				VECTOR(6.00000000000, 12.00000000000, 18.00000000000) 
				VECTOR(18.00000000000, 12.00000000000, 18.00000000000) 
			] 
		} 
		{ 
			ambient_const = 1.00000000000 
			ambient_rgb = VECTOR(1.00000000000, 1.00000000000, 0.95999997854) 
			falloff_const = 270000.00000000000 
			falloff_rgb = VECTOR(0.38999998569, 0.37999999523, 0.31999999285) 
			cursor_ambience = 1.50000000000 
			pos = [ 
				VECTOR(8.00000000000, 12.00000000000, 8.00000000000) 
				VECTOR(22.00000000000, 12.00000000000, 8.00000000000) 
				VECTOR(8.00000000000, 12.00000000000, 22.00000000000) 
				VECTOR(22.00000000000, 12.00000000000, 22.00000000000) 
			] 
		} 
		{ 
			ambient_const = 1.00000000000 
			ambient_rgb = VECTOR(1.00000000000, 1.00000000000, 0.95999997854) 
			falloff_const = 235000.00000000000 
			falloff_rgb = VECTOR(0.38999998569, 0.37999999523, 0.31999999285) 
			cursor_ambience = 1.50000000000 
			pos = [ 
				VECTOR(5.00000000000, 12.00000000000, 8.00000000000) 
				VECTOR(5.00000000000, 12.00000000000, 22.00000000000) 
				VECTOR(13.00000000000, 12.00000000000, 8.00000000000) 
				VECTOR(13.00000000000, 12.00000000000, 22.00000000000) 
			] 
		} 
		{ 
			ambient_const = 1.00000000000 
			ambient_rgb = VECTOR(1.00000000000, 1.00000000000, 0.95999997854) 
			falloff_const = 235000.00000000000 
			falloff_rgb = VECTOR(0.38999998569, 0.37999999523, 0.31999999285) 
			cursor_ambience = 1.50000000000 
			pos = [ 
				VECTOR(3.00000000000, 12.00000000000, 5.00000000000) 
				VECTOR(3.00000000000, 12.00000000000, 15.00000000000) 
				VECTOR(3.00000000000, 12.00000000000, 25.00000000000) 
				VECTOR(3.00000000000, 12.00000000000, 35.00000000000) 
				VECTOR(3.00000000000, 12.00000000000, 45.00000000000) 
				VECTOR(3.00000000000, 12.00000000000, 55.00000000000) 
				VECTOR(3.00000000000, 12.00000000000, 65.00000000000) 
				VECTOR(3.00000000000, 12.00000000000, 75.00000000000) 
			] 
		} 
	] 
	[ 
		{ 
			ambient_const = 0.89999997616 
			ambient_rgb = VECTOR(0.89999997616, 0.89999997616, 1.00000000000) 
			falloff_const = 90000.00000000000 
			falloff_rgb = VECTOR(0.44999998808, 0.44999998808, 0.31999999285) 
			cursor_ambience = 1.50000000000 
			pos = [ 
				VECTOR(4.00000000000, 10.00000000000, 4.00000000000) 
				VECTOR(12.00000000000, 10.00000000000, 4.00000000000) 
				VECTOR(4.00000000000, 10.00000000000, 12.00000000000) 
				VECTOR(12.00000000000, 10.00000000000, 12.00000000000) 
			] 
		} 
		{ 
			ambient_const = 0.89999997616 
			ambient_rgb = VECTOR(0.89999997616, 0.89999997616, 1.00000000000) 
			falloff_const = 160000.00000000000 
			falloff_rgb = VECTOR(0.44999998808, 0.44999998808, 0.31999999285) 
			cursor_ambience = 1.50000000000 
			pos = [ 
				VECTOR(6.00000000000, 12.00000000000, 6.00000000000) 
				VECTOR(18.00000000000, 12.00000000000, 6.00000000000) 
				VECTOR(6.00000000000, 12.00000000000, 18.00000000000) 
				VECTOR(18.00000000000, 12.00000000000, 18.00000000000) 
			] 
		} 
		{ 
			ambient_const = 0.89999997616 
			ambient_rgb = VECTOR(0.89999997616, 0.89999997616, 1.00000000000) 
			falloff_const = 200000.00000000000 
			falloff_rgb = VECTOR(0.44999998808, 0.44999998808, 0.31999999285) 
			cursor_ambience = 1.50000000000 
			pos = [ 
				VECTOR(8.00000000000, 12.00000000000, 8.00000000000) 
				VECTOR(22.00000000000, 12.00000000000, 8.00000000000) 
				VECTOR(8.00000000000, 12.00000000000, 22.00000000000) 
				VECTOR(22.00000000000, 12.00000000000, 22.00000000000) 
			] 
		} 
		{ 
			ambient_const = 0.89999997616 
			ambient_rgb = VECTOR(0.89999997616, 0.89999997616, 1.00000000000) 
			falloff_const = 150000.00000000000 
			falloff_rgb = VECTOR(0.44999998808, 0.44999998808, 0.31999999285) 
			cursor_ambience = 1.50000000000 
			pos = [ 
				VECTOR(5.00000000000, 12.00000000000, 8.00000000000) 
				VECTOR(5.00000000000, 12.00000000000, 22.00000000000) 
				VECTOR(13.00000000000, 12.00000000000, 8.00000000000) 
				VECTOR(13.00000000000, 12.00000000000, 22.00000000000) 
			] 
		} 
		{ 
			ambient_const = 0.89999997616 
			ambient_rgb = VECTOR(0.89999997616, 0.89999997616, 1.00000000000) 
			falloff_const = 120000.00000000000 
			falloff_rgb = VECTOR(0.44999998808, 0.44999998808, 0.31999999285) 
			cursor_ambience = 1.50000000000 
			pos = [ 
				VECTOR(3.00000000000, 10.00000000000, 5.00000000000) 
				VECTOR(3.00000000000, 10.00000000000, 15.00000000000) 
				VECTOR(3.00000000000, 10.00000000000, 25.00000000000) 
				VECTOR(3.00000000000, 10.00000000000, 35.00000000000) 
				VECTOR(3.00000000000, 10.00000000000, 45.00000000000) 
				VECTOR(3.00000000000, 10.00000000000, 55.00000000000) 
				VECTOR(3.00000000000, 10.00000000000, 65.00000000000) 
				VECTOR(3.00000000000, 10.00000000000, 75.00000000000) 
			] 
		} 
	] 
	[ 
		{ 
			ambient_const = 1.29999995232 
			ambient_rgb = VECTOR(0.95999997854, 0.95999997854, 1.00000000000) 
			falloff_const = 150000.00000000000 
			falloff_rgb = VECTOR(0.30000001192, 0.30000001192, 0.30000001192) 
			cursor_ambience = 1.50000000000 
			pos = [ 
				VECTOR(4.00000000000, 10.00000000000, 4.00000000000) 
				VECTOR(12.00000000000, 10.00000000000, 4.00000000000) 
				VECTOR(4.00000000000, 10.00000000000, 12.00000000000) 
				VECTOR(12.00000000000, 10.00000000000, 12.00000000000) 
			] 
		} 
		{ 
			ambient_const = 1.29999995232 
			ambient_rgb = VECTOR(0.95999997854, 0.95999997854, 1.00000000000) 
			falloff_const = 200000.00000000000 
			falloff_rgb = VECTOR(0.30000001192, 0.30000001192, 0.30000001192) 
			cursor_ambience = 1.50000000000 
			pos = [ 
				VECTOR(6.00000000000, 12.00000000000, 6.00000000000) 
				VECTOR(18.00000000000, 12.00000000000, 6.00000000000) 
				VECTOR(6.00000000000, 12.00000000000, 18.00000000000) 
				VECTOR(18.00000000000, 12.00000000000, 18.00000000000) 
			] 
		} 
		{ 
			ambient_const = 1.29999995232 
			ambient_rgb = VECTOR(0.95999997854, 0.95999997854, 1.00000000000) 
			falloff_const = 250000.00000000000 
			falloff_rgb = VECTOR(0.30000001192, 0.30000001192, 0.30000001192) 
			cursor_ambience = 1.50000000000 
			pos = [ 
				VECTOR(8.00000000000, 12.00000000000, 8.00000000000) 
				VECTOR(22.00000000000, 12.00000000000, 8.00000000000) 
				VECTOR(8.00000000000, 12.00000000000, 22.00000000000) 
				VECTOR(22.00000000000, 12.00000000000, 22.00000000000) 
			] 
		} 
		{ 
			ambient_const = 1.29999995232 
			ambient_rgb = VECTOR(0.95999997854, 0.95999997854, 1.00000000000) 
			falloff_const = 220000.00000000000 
			falloff_rgb = VECTOR(0.30000001192, 0.30000001192, 0.30000001192) 
			cursor_ambience = 1.50000000000 
			pos = [ 
				VECTOR(5.00000000000, 12.00000000000, 8.00000000000) 
				VECTOR(5.00000000000, 12.00000000000, 22.00000000000) 
				VECTOR(13.00000000000, 12.00000000000, 8.00000000000) 
				VECTOR(13.00000000000, 12.00000000000, 22.00000000000) 
			] 
		} 
		{ 
			ambient_const = 1.29999995232 
			ambient_rgb = VECTOR(0.95999997854, 0.95999997854, 1.00000000000) 
			falloff_const = 220000.00000000000 
			falloff_rgb = VECTOR(0.30000001192, 0.30000001192, 0.30000001192) 
			cursor_ambience = 1.50000000000 
			pos = [ 
				VECTOR(3.00000000000, 10.00000000000, 5.00000000000) 
				VECTOR(3.00000000000, 10.00000000000, 15.00000000000) 
				VECTOR(3.00000000000, 10.00000000000, 25.00000000000) 
				VECTOR(3.00000000000, 10.00000000000, 35.00000000000) 
				VECTOR(3.00000000000, 10.00000000000, 45.00000000000) 
				VECTOR(3.00000000000, 10.00000000000, 55.00000000000) 
				VECTOR(3.00000000000, 10.00000000000, 65.00000000000) 
				VECTOR(3.00000000000, 10.00000000000, 75.00000000000) 
			] 
		} 
	] 
] 
SCRIPT EditorTrgGap0 
	FireCustomParkGap gap_index = 0 
ENDSCRIPT

SCRIPT EditorTrgGap1 
	FireCustomParkGap gap_index = 1 
ENDSCRIPT

SCRIPT EditorTrgGap2 
	FireCustomParkGap gap_index = 2 
ENDSCRIPT

SCRIPT EditorTrgGap3 
	FireCustomParkGap gap_index = 3 
ENDSCRIPT

SCRIPT EditorTrgGap4 
	FireCustomParkGap gap_index = 4 
ENDSCRIPT

SCRIPT EditorTrgGap5 
	FireCustomParkGap gap_index = 5 
ENDSCRIPT

SCRIPT EditorTrgGap6 
	FireCustomParkGap gap_index = 6 
ENDSCRIPT

SCRIPT EditorTrgGap7 
	FireCustomParkGap gap_index = 7 
ENDSCRIPT

SCRIPT EditorTrgGap8 
	FireCustomParkGap gap_index = 8 
ENDSCRIPT

SCRIPT EditorTrgGap9 
	FireCustomParkGap gap_index = 9 
ENDSCRIPT

SCRIPT EditorTrgGap10 
	FireCustomParkGap gap_index = 10 
ENDSCRIPT

SCRIPT EditorTrgGap11 
	FireCustomParkGap gap_index = 11 
ENDSCRIPT

SCRIPT EditorTrgGap12 
	FireCustomParkGap gap_index = 12 
ENDSCRIPT

SCRIPT EditorTrgGap13 
	FireCustomParkGap gap_index = 13 
ENDSCRIPT

SCRIPT EditorTrgGap14 
	FireCustomParkGap gap_index = 14 
ENDSCRIPT

SCRIPT EditorTrgGap15 
	FireCustomParkGap gap_index = 15 
ENDSCRIPT

SCRIPT EditorTrgGap16 
	FireCustomParkGap gap_index = 16 
ENDSCRIPT

SCRIPT EditorTrgGap17 
	FireCustomParkGap gap_index = 17 
ENDSCRIPT

SCRIPT EditorTrgGap18 
	FireCustomParkGap gap_index = 18 
ENDSCRIPT

SCRIPT EditorTrgGap19 
	FireCustomParkGap gap_index = 19 
ENDSCRIPT

SCRIPT EditorTrgGap20 
	FireCustomParkGap gap_index = 20 
ENDSCRIPT

SCRIPT EditorTrgGap21 
	FireCustomParkGap gap_index = 21 
ENDSCRIPT

SCRIPT EditorTrgGap22 
	FireCustomParkGap gap_index = 22 
ENDSCRIPT

SCRIPT EditorTrgGap23 
	FireCustomParkGap gap_index = 23 
ENDSCRIPT

SCRIPT EditorTrgGap24 
	FireCustomParkGap gap_index = 24 
ENDSCRIPT

SCRIPT EditorTrgGap25 
	FireCustomParkGap gap_index = 25 
ENDSCRIPT

SCRIPT EditorTrgGap26 
	FireCustomParkGap gap_index = 26 
ENDSCRIPT

SCRIPT EditorTrgGap27 
	FireCustomParkGap gap_index = 27 
ENDSCRIPT

SCRIPT EditorTrgGap28 
	FireCustomParkGap gap_index = 28 
ENDSCRIPT

SCRIPT EditorTrgGap29 
	FireCustomParkGap gap_index = 29 
ENDSCRIPT

SCRIPT EditorTrgGap30 
	FireCustomParkGap gap_index = 30 
ENDSCRIPT

SCRIPT EditorTrgGap31 
	FireCustomParkGap gap_index = 31 
ENDSCRIPT


