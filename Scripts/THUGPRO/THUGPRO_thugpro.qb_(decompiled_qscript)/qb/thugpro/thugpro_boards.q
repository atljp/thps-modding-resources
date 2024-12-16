
g_current_skater_board_type = default 
SCRIPT GetBoardTypeAndRevert 
	SWITCH ( g_current_skater_board_type ) 
		CASE hover 
		CASE board_hoverboard02 
		CASE board_ironman 
		CASE jango 
			IF NOT GotParam no_sound 
				play_hoverboard_sfx 
			ENDIF 
			RETURN is_using_hoverboard = 1 
		DEFAULT 
			IF NOT GotParam no_sound 
				Default_PlayRevertSound <...> 
			ENDIF 
	ENDSWITCH 
ENDSCRIPT

SCRIPT Default_PlayRevertSound 
	IF NOT GetGlobalFlag flag = CHEAT_HOVERBOARD 
		SWITCH <type> 
			CASE revert 
				Obj_SpawnScript CessTrail Params = { repeat_times = 10 } 
				PlayCessSound 
				Vibrate Actuator = 0 Percent = 80 duration = 0.50000000000 
				Vibrate Actuator = 1 Percent = 80 duration = 0.10000000149 
			CASE manuallink 
				PlaySound foleymove01 pitch = 110 vol = 100 
				Obj_SpawnScript CessTrail Params = { repeat_times = 10 } 
				PlayCessSound 
				Vibrate Actuator = 0 Percent = 80 duration = 0.50000000000 
				Vibrate Actuator = 1 Percent = 80 duration = 0.10000000149 
			CASE brake 
				PlayCessSound 
			CASE Wallride 
				IF ( ( GLOBAL_TP_GroundTerrainSFX ) = Classic ) 
					Obj_PlaySound revertconc 
				ELSE 
					Obj_PlaySound revertconc_thaw 
				ENDIF 
			CASE toggleswitchregular 
				PlayCessSound 
				Obj_SpawnScript CessTrail Params = { delay = 3 } 
				Vibrate Actuator = 0 Percent = 80 duration = 0.50000000000 
				Vibrate Actuator = 1 Percent = 80 duration = 0.10000000149 
			DEFAULT 
				PlayCessSound 
		ENDSWITCH 
	ENDIF 
ENDSCRIPT

SKATER_BOARD_IS_SPINNING = 0 
board_allow_break = [ 
	default 
	board_gold 
] 
board_allow_griptape = [ 
	default 
	oldschool 
	board_ollie 
	board_joleHD 
	board_xray 
] 
board_allow_griptape_color = [ 
	default 
] 
board_allow_graphic = [ 
	default 
	oldschool 
	hover 
	jango 
	board_gold 
	board_joleHD 
	board_slater 
	board_xray 
] 
board_allow_truck_texture = [ 
	default 
	board_joleHD 
] 
board_allow_truck_color = [ 
	default 
] 
board_allow_wheel_texture = [ 
	default 
	oldschool 
	banana 
	board_ollie 
	Shrek_board 
	board_Creature 
	board_joleHD 
	board_xray 
] 
board_allow_wheel_color = [ 
	default 
	oldschool 
] 
board_allow_wheel_scale = [ 
	default 
	board_gold 
	oldschool 
	chainsaw 
	Board_THPS_Hawk 
	banana 
] 
board_allow_wheel_rotation = [ 
	default 
	oldschool 
	banana 
	board_ollie 
	board_Creature 
] 
SCRIPT cas_handle_board_stuff 
	GetCurrentSkaterProfileIndex 
	GetPlayerAppearancePart player = 0 part = board 
	board_array = [ 
		segway 
		Jackhammer 
		Tuba 
		metaldetectorobj 
		baton 
		clipboard 
		lifesaver 
		witchdoctorcane 
		flute 
		guitar 
		banjo 
		tricycle 
		minikart 
		mechbull 
		long 
		tennis_racket 
		spraycan 
		stroller 
	stroller_zure ] 
	IF ArrayContains array = <board_array> contains = <desc_id> 
		EditPlayerAppearance { 
			profile = <currentSkaterProfileIndex> 
			target = SetPart targetParams = { part = board desc_id = default } 
		} 
		<desc_id> = default 
	ENDIF 
	IF GotParam RefreshSkaterModel 
		IF IsTrue LAST_SELECTED_SKATER_HIDE_BOARD 
			RefreshSkaterModel profile = <currentSkaterProfileIndex> skater = 0 no_board = no_board 
		ELSE 
			RefreshSkaterModel profile = <currentSkaterProfileIndex> skater = 0 
		ENDIF 
	ENDIF 
	Change g_current_skater_board_type = <desc_id> 
ENDSCRIPT

board = [ 
	{ 
		desc_id = default 
		frontend_desc = #"Default" 
		mesh = "models/boards/board_default.skin" 
		multicolor = 1 
		part = board 
		material = skateboard_wheels 
		pass = 0 
	} 
	{ 
		desc_id = board_joleHD 
		frontend_desc = #"High Res" 
		mesh = "models/boards/board_JoleHD.skin" 
		no_random 
	} 
	{ 
		desc_id = board_gold 
		frontend_desc = #"Golden Board" 
		mesh = "models/boards/board_gold.skin" 
		no_random 
	} 
	{ 
		desc_id = Board_THPS_Hawk 
		frontend_desc = #"Low Res \'99" 
		mesh = "models/skater_secret/Board_THPS_Hawk.skin" 
	} 
	{ 
		desc_id = segway 
		frontend_desc = #"Segway" 
		mesh = "models/veh/veh_segmotor/segmotor.skin" 
		hidden 
	} 
	{ 
		desc_id = None 
		hidden 
	} 
	{ 
		desc_id = Skateboard 
		mesh = "models/ped_male/Ped_Skateboard.skin" 
		no_random 
		hidden 
	} 
	{ 
		desc_id = Hawk_board 
		mesh = "models/ped_male/Ped_hawk_board.skin" 
		no_random 
		hidden 
	} 
	{ 
		desc_id = Burnquist_board 
		mesh = "models/ped_male/Ped_burnquist_board.skin" 
		no_random 
		hidden 
	} 
	{ 
		desc_id = Koston_board 
		mesh = "models/ped_male/Ped_koston_board.skin" 
		no_random 
		hidden 
	} 
	{ 
		desc_id = Margera_board 
		mesh = "models/ped_male/Ped_Margera_board.skin" 
		no_random 
		hidden 
	} 
	{ 
		desc_id = Mullen_board 
		mesh = "models/ped_male/Ped_mullen_board.skin" 
		no_random 
		hidden 
	} 
	{ 
		desc_id = Muska_board 
		mesh = "models/ped_male/Ped_Muska_board.skin" 
		no_random 
		hidden 
	} 
	{ 
		desc_id = Wee_man_board 
		mesh = "models/ped_male/Ped_Weeman_board.skin" 
		no_random 
		hidden 
	} 
	{ 
		desc_id = Vallely_board 
		mesh = "models/ped_male/Ped_Vallely_board.skin" 
		no_random 
		hidden 
	} 
	{ 
		desc_id = Sheckler_board 
		mesh = "models/ped_male/Ped_Sheckler_board.skin" 
		no_random 
		hidden 
	} 
	{ 
		desc_id = Jester_board 
		mesh = "models/ped_male/Ped_jester_board.skin" 
		no_random 
		hidden 
	} 
	{ 
		desc_id = Ben_Franklin_board 
		mesh = "models/ped_male/Ped_Benfranklin_Board.skin" 
		no_random 
		hidden 
	} 
	{ 
		desc_id = Graffiti_board 
		mesh = "models/ped_male/Ped_graffitipunk_board.skin" 
		no_random 
		hidden 
	} 
	{ 
		desc_id = Bull_Fighter_board 
		mesh = "models/ped_male/Ped_bullfighter_board.skin" 
		no_random 
		hidden 
	} 
	{ 
		desc_id = Skateboard_Character 
		mesh = "models/boards/board_default.skin" 
		no_random 
		hidden 
	} 
	{ 
		desc_id = Jackhammer 
		mesh = "models/peds/Ped_ConstructionWorkers/Ped_Worker_Jhammer.skin" 
		no_random 
		hidden 
	} 
	{ 
		desc_id = Tuba 
		mesh = "models/peds/ped_jazzman1/ped_tuba.skin" 
		no_random 
		hidden 
	} 
	{ 
		desc_id = spraycan 
		mesh = "models/peds/ped_graffiti02/ped_spraycan.skin" 
		no_random 
		hidden 
	} 
	{ 
		desc_id = metaldetectorobj 
		mesh = "models/peds/ped_metaldetectorguy/ped_metaldetectorobj.skin" 
		no_random 
		hidden 
	} 
	{ 
		desc_id = baton 
		mesh = "models/peds/ped_germancop/ped_baton.skin" 
		no_random 
		hidden 
	} 
	{ 
		desc_id = clipboard 
		mesh = "models/ped_male/Ped_Clipboard.skin" 
		no_random 
		hidden 
	} 
	{ 
		desc_id = lifesaver 
		mesh = "models/peds/ped_lifeguard/ped_lifesaver.skin" 
		no_random 
		hidden 
	} 
	{ 
		desc_id = witchdoctorcane 
		mesh = "models/peds/ped_voodoo/ped_witchdoctorcane.skin" 
		no_random 
		hidden 
	} 
	{ 
		desc_id = flute 
		mesh = "models/peds/ped_fluteguy/ped_flute.skin" 
		no_random 
		hidden 
	} 
	{ 
		desc_id = Wheelchair 
		mesh = "models/veh/veh_wheelchair/veh_wheelchair.skin" 
		no_random 
		hidden 
	} 
	{ 
		desc_id = guitar 
		mesh = "models/peds/ped_guitarist/ped_guitar.skin" 
		no_random 
		hidden 
	} 
	{ 
		desc_id = banjo 
		mesh = "models/peds/ped_guitarist/ped_banjo.skin" 
		no_random 
		hidden 
	} 
	{ 
		desc_id = tricycle 
		mesh = "models/veh/veh_tricycle/veh_tricycle_skin.skin" 
		no_random 
		hidden 
	} 
	{ 
		desc_id = minikart 
		mesh = "models/veh/veh_minikart/veh_minikart.skin" 
		no_random 
		hidden 
	} 
	{ 
		desc_id = mechbull 
		mesh = "models/veh/veh_bull/veh_bull.skin" 
		no_random 
		hidden 
	} 
	{ 
		desc_id = chainsaw 
		frontend_desc = #"Bigfoot" 
		mesh = "models/veh/Veh_MotoSkateboard/Veh_motoSkateboard.skin" 
		no_random 
	} 
	{ 
		desc_id = banana 
		frontend_desc = #"Banana Board" 
		mesh = "models/boards/board_banana.skin" 
		no_random 
	} 
	{ 
		desc_id = hover 
		frontend_desc = #"Hoverboard" 
		mesh = "models/boards/board_hover.skin" 
		no_random 
	} 
	{ 
		desc_id = jango 
		frontend_desc = #"Jango" 
		mesh = "models/boards/board_jango.skin" 
		no_random 
	} 
	{ 
		desc_id = oldschool 
		frontend_desc = #"Old Skool" 
		mesh = "models/boards/board_oldschool.skin" 
		no_random 
	} 
	{ 
		desc_id = board_ollie 
		frontend_desc = #"Ollie The Magic Bum" 
		mesh = "models/boards/board_ollie.skin" 
	} 
	{ 
		desc_id = Shrek_board 
		frontend_desc = #"Shrek" 
		mesh = "models\\Skater_Secret\\board_Shrek.skin" 
		no_random 
	} 
	{ 
		desc_id = board_Creature 
		frontend_desc = #"T.H.U.D." 
		mesh = "models/boards/board_Creature.skin" 
	} 
	{ 
		desc_id = board_Gene 
		frontend_desc = #"KISS" 
		mesh = "models/boards/board_Gene.skin" 
	} 
	{ 
		desc_id = board_ironman 
		frontend_desc = #"Ironman" 
		mesh = "models/boards/board_Ironman.skin" 
	} 
	{ 
		desc_id = board_surf 
		frontend_desc = #"Surfboard" 
		mesh = "models/boards/board_surf.skin" 
	} 
	{ 
		desc_id = board_xray 
		frontend_desc = #"X-Ray" 
		mesh = "models/boards/board_xray.skin" 
	} 
	{ 
		desc_id = board_slater 
		frontend_desc = #"Surfboard (THPS3)" 
		mesh = "models/boards/board_slater.skin" 
	} 
	{ 
		desc_id = board_hoverboard02 
		frontend_desc = #"Anti-Gravity Board" 
		mesh = "models/boards/board_hoverboard02.skin" 
	} 
	{ 
		desc_id = board_skaboto 
		frontend_desc = #"Skaboto" 
		mesh = "models/skater_secret/board_skaboto.skin" 
	} 
] 

