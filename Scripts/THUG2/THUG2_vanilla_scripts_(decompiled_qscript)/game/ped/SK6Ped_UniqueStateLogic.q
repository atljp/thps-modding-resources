
Ped_UniqueStateLogic_DefaultStates = [ 
	{ Tag = drummer State = BO_STATE_drummer_drumwalking Table = BO_StateLogic_Table } 
	{ Tag = rollerblader State = BO_STATE_rollerblading Table = BO_StateLogic_Table } 
	{ Tag = Paulie State = BO_STATE_Paulie_Waiting Table = BO_PaulieLogic_Table } 
	{ Tag = FluteGuy State = NO_STATE_fluteguy Table = NO_StateLogic_Table } 
	{ Tag = FluteGuy_playing State = NO_STATE_fluteguy_playing Table = NO_StateLogic_Table } 
	{ Tag = Jazzman State = NO_STATE_Jazzman Table = NO_StateLogic_Table } 
	{ Tag = Jazzman_playing State = NO_STATE_Jazzman_playing Table = NO_StateLogic_Table } 
	{ Tag = F_MardisGras_Dance State = NO_STATE_F_MardisGras_Dance Table = NO_MardisGras_F_Table } 
	{ Tag = Griller State = BE_STATE_Griller Table = BE_GrillerLogic_Table } 
	{ Tag = DJ State = BE_STATE_DJ Table = BE_StateLogic_Table } 
	{ Tag = Forklift State = BE_STATE_Forklift Table = BE_StateLogic_Table } 
	{ Tag = BE_Cop_Chase State = BE_STATE_Cop_Chase Table = BE_CopLogic_Table } 
	{ Tag = BE_Cop_Standing State = BE_STATE_Cop_Standing Table = BE_CopLogic_Table } 
	{ Tag = BE_Cop_Direct State = BE_STATE_Cop_Direct Table = BE_CopLogic_Table } 
	{ Tag = BE_Cop_OnFire State = BE_STATE_Cop_OnFire Table = BE_CopLogic_Table } 
	{ Tag = Mime State = BA_STATE_Mime Table = BA_StateLogic_Table } 
	{ Tag = MetalDetect State = AU_STATE_MetalDetect_Walking Table = AU_MetalDetectLogic_Table } 
	{ Tag = MiniKart State = AU_STATE_MiniKart Table = AU_Minikart_Table } 
	{ Tag = Rampkid State = AU_STATE_RampKid Table = AU_StateLogic_Table } 
	{ Tag = LifeGuard_Walking State = AU_STATE_LIfeGuard_Walking Table = AU_StateLogic_Table } 
	{ Tag = LifeGuard_Scanning State = AU_STATE_LIfeGuard_Scanning Table = AU_StateLogic_Table } 
	{ Tag = F_Bikini State = ALL_STATE_F_Bikini Table = ALL_StateLogic_Table } 
	{ Tag = F_Bikini_Front State = ALL_STATE_F_Bikini_Front Table = ALL_StateLogic_Table } 
	{ Tag = F_Bikini_Sit State = ALL_STATE_F_Bikini_Sit Table = ALL_StateLogic_Table } 
	{ Tag = Cop_ticketing State = ALL_STATE_Cop_Ticketing Table = ALL_StateLogic_Table } 
	{ Tag = Cop_pissed State = AU_STATE_Cop_pissed Table = AU_StateLogic_Table } 
	{ Tag = LoungeSinger_Laying State = SECRET_STATE_LoungeSinger_Laying Table = SECRET_StateLogic_Table } 
	{ Tag = LoungeSinger_Dance State = SECRET_STATE_LoungeSinger_Dance Table = SECRET_StateLogic_Table } 
	{ Tag = Alien State = SECRET_STATE_AlienIdle Table = SECRET_Alien_Table } 
	{ Tag = Dance State = ALL_STATE_Dance Table = ALL_StateLogic_Table } 
	{ Tag = Guitarist State = ALL_STATE_Guitarist Table = ALL_StateLogic_Table } 
	{ Tag = Guitarist_playing State = ALL_STATE_Guitarist_playing Table = ALL_StateLogic_Table } 
	{ Tag = SWKid_Sitting State = BO_STATE_SWKid_Sitting Table = BO_SWKidLogic_Table } 
	{ Tag = Graffiti State = ALL_STATE_Graffiti Table = ALL_StateLogic_Table } 
	{ Tag = pinkcat State = ST_STATE_IdleCat Table = ST_CatLogic_Table } 
] 
ALL_StateLogic_Table = { 
	ALL_STATE_Dance = { 
		ped_update_type = no_move_update 
		script_ped_state = ALL_STATECONTROL_Dance 
	} 
	ALL_STATE_Guitarist = { 
		script_ped_state = ALL_STATECONTROL_Guitarist 
		exit_state_action = wait_anim_finished 
	} 
	ALL_STATE_Guitarist_playing = { 
		script_ped_state = ALL_STATECONTROL_Guitarist_playing 
		exit_state_action = wait_anim_finished 
	} 
	ALL_STATE_Graffiti = { 
		script_ped_state = BE_STATECONTROL_Graffiti 
		exit_state_action = wait_anim_finished 
	} 
	ALL_STATE_Cop_Ticketing = { 
		ped_update_type = no_move_update 
		script_ped_state = ALL_STATECONTROL_Cop_ticketing 
	} 
	ALL_STATE_F_Bikini = { 
		ped_update_type = no_move_update 
		script_ped_state = AU_STATECONTROL_F_Bikini 
	} 
	ALL_STATE_F_Bikini_Front = { 
		ped_update_type = no_move_update 
		script_ped_state = AU_STATECONTROL_F_Bikini_Front 
	} 
	ALL_STATE_F_Bikini_Sit = { 
		ped_update_type = no_move_update 
		script_ped_state = AU_STATECONTROL_F_Bikini_Sit 
	} 
} 
BO_SWKidLogic_Table = { 
	BO_STATE_SWKid_Sitting = { 
		script_ped_state = BO_STATECONTROL_SWKid_Sitting 
		exit_state_action = wait_anim_finished 
	} 
	BO_STATE_SWKid_Force = { 
		script_ped_state = BO_STATECONTROL_SWKid_Force 
		exit_state_action = wait_anim_finished 
	} 
	STATE_getattention = { 
		script_ped_state = BO_STATECONTROL_SWKid_GetAttention 
		exit_state_action = wait_anim_finished 
	} 
} 
NO_StateLogic_Table = { 
	NO_STATE_fluteguy = { 
		script_ped_state = NO_STATECONTROL_fluteguy 
		exit_state_action = wait_anim_finished 
	} 
	NO_STATE_fluteguy_playing = { 
		script_ped_state = NO_STATECONTROL_fluteguy_playing 
		exit_state_action = wait_anim_finished 
	} 
	NO_STATE_Jazzman = { 
		script_ped_state = NO_STATECONTROL_Jazzman 
		exit_state_action = wait_anim_finished 
	} 
	NO_STATE_Jazzman_playing = { 
		script_ped_state = NO_STATECONTROL_Jazzman_playing 
		exit_state_action = wait_anim_finished 
	} 
} 
SCRIPT STATECONTROL_avoidstop_custom01 
	Obj_SetInnerAvoidRadius 4 
	SetEventHandler { 
		ex = ObjectInAvoidRadius 
		scr = Ped_Utils_EventHandler params = { SetState = STATE_avoidinit event = ObjectInAvoidRadius } 
	} 
	Obj_SetOuterAvoidRadius 10 
	SetEventHandler { 
		ex = ObjectOutofAvoidRadius 
		scr = Ped_Utils_EventHandler params = { SetState = STATE_RESET_EVENTS event = ObjectOutofAvoidRadius } 
	} 
	wait 1 gameframe 
	IF GetSingleTag should_look_at_skater 
		IF ( <should_look_at_skater> = 1 ) 
			ped_rotate_to_skater_from_idle 
		ENDIF 
	ENDIF 
	Ped_Utils_SetMiscEventHandlers 
	Ped_StateLogic_SetDefaultState 
ENDSCRIPT

SCRIPT STATECONTROL_avoidland_custom01 
	Obj_SetInnerAvoidRadius 4 
	SetEventHandler { 
		ex = ObjectInAvoidRadius 
		scr = Ped_Utils_EventHandler params = { SetState = STATE_avoidinit event = ObjectInAvoidRadius } 
	} 
	Ped_Utils_SetMiscEventHandlers 
ENDSCRIPT

SCRIPT ALL_STATECONTROL_Dance 
	BEGIN 
		PlayAnimWithPartialAnimIfExists anim = Ped_Suit_Dance 
		OBJ_waitanimfinished 
	REPEAT 
ENDSCRIPT

SCRIPT BO_STATECONTROL_SWKid_Sitting 
	IF Obj_AnimEquals Ped_Starwarskid_Clip01 
		SpawnSound BO_SFX_MusicPed_NerdKid_Music_Stop 
		PlayAnimWithPartialAnimIfExists anim = Ped_Starwarskid_sitdown blendperiod = 1 
		OBJ_waitanimfinished 
	ENDIF 
	IF Obj_AnimEquals Ped_Starwarskid_Clip02 
		SpawnSound BO_SFX_MusicPed_NerdKid_Music_Stop 
		PlayAnimWithPartialAnimIfExists anim = Ped_Starwarskid_sitdown blendperiod = 1 
		OBJ_waitanimfinished 
	ENDIF 
	IF ScreenElementExists id = ped_speech_dialog 
		speech_box_exit anchor_id = ped_speech_dialog 
	ENDIF 
	IF ( BO_SFX_NerdKidMusicStatus = 1 ) 
		SpawnSound BO_SFX_MusicPed_NerdKid_Music_Stop_02 
	ENDIF 
	setup_ped_speech { ped_id = TRG_Ped_SW_On 
		inner_radius = 7 
		outer_radius = 8 
		accept_text = "Press \\m5 to feel the power!" 
		activation_script = BO_SW_MusicPlay 
		dont_deactivate_goals 
	} 
	Ped_Utils_SetMiscEventHandlers 
	BEGIN 
		RANDOM(1, 1, 1) 
			RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Ped_Starwarskid_Idle_sit01 
			RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Ped_Starwarskid_Idle_sit02 
			RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Ped_Starwarskid_Idle_sit03 
		RANDOMEND 
		OBJ_waitanimfinished 
	REPEAT 
ENDSCRIPT

SCRIPT BO_STATECONTROL_SWKid_GetAttention 
	IF ( RANDOM_RANGE PAIR(1.00000000000, 100.00000000000) > 62 ) 
		Ped_Utils_PlayStream type = Far 
	ENDIF 
	BEGIN 
		IF NOT Obj_ObjectInAttentionRadius 
			BREAK 
		ENDIF 
		PlayAnimWithPartialAnimIfExists anim = Ped_Starwarskid_ComeHere 
		OBJ_waitanimfinished 
	REPEAT 2 
	Ped_Utils_SetMiscEventHandlers 
	Ped_StateLogic_SetDefaultState 
ENDSCRIPT

SCRIPT BO_STATECONTROL_SWKid_Force 
	SpawnSound BO_SFX_MusicPed_NerdKid_Music_Start 
	PlayAnimWithPartialAnimIfExists anim = Ped_Starwarskid_stand blendperiod = 1 
	OBJ_waitanimfinished 
	IF ScreenElementExists id = ped_speech_dialog 
		speech_box_exit anchor_id = ped_speech_dialog 
	ENDIF 
	setup_ped_speech { ped_id = TRG_Ped_SW_On 
		inner_radius = 7 
		outer_radius = 8 
		accept_text = "Press \\m5 to stop." 
		activation_script = BO_SW_MusicStop 
		dont_deactivate_goals 
	} 
	IF ( BO_SFX_NerdKidMusicStatus = 0 ) 
		SpawnSound BO_SFX_MusicPed_NerdKid_Music_Start_02 
	ENDIF 
	BEGIN 
		RANDOM(1, 1) 
			RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Ped_Starwarskid_Clip01 
			SpawnSound BO_SFX_NerdKid_Moves01 
			RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Ped_Starwarskid_Clip02 
			SpawnSound BO_SFX_NerdKid_Moves02 
		RANDOMEND 
		OBJ_waitanimfinished 
	REPEAT 
ENDSCRIPT

SCRIPT ALL_STATECONTROL_Guitarist 
	IF LevelIs load_bo 
		IF ( BO_SFX_SubwayMusicStatus = 1 ) 
			SpawnSound BO_SFX_MusicPed_Subway_Music_Stop 
		ENDIF 
	ENDIF 
	IF LevelIs load_no 
		IF ( NO_DixieMusicStatus = 1 ) 
			SpawnSound NO_SFX_Dixie_Stop 
		ENDIF 
	ENDIF 
	PlayAnimWithPartialAnimIfExists anim = PED_Guitarist_Back2idle 
	OBJ_waitanimfinished 
	IF ScreenElementExists id = ped_speech_dialog 
		speech_box_exit anchor_id = ped_speech_dialog 
	ENDIF 
	IF LevelIs load_bo 
		IF ( BO_SFX_SubwayMusicStatus = 1 ) 
			SpawnSound BO_SFX_MusicPed_Subway_Music_Stop02 
		ENDIF 
		setup_ped_speech { ped_id = TRG_MusicPed_On 
			inner_radius = 7 
			outer_radius = 8 
			accept_text = "Press \\m5 to start the music!" 
			activation_script = BO_MusicPlay 
			dont_deactivate_goals 
		} 
	ENDIF 
	IF LevelIs load_no 
		IF ( NO_DixieMusicStatus = 1 ) 
			SpawnSound NO_SFX_Dixie_Stop02 
		ENDIF 
		setup_ped_speech { ped_id = trg_ped_jazz_01 
			inner_radius = 7 
			outer_radius = 8 
			accept_text = "Press \\m5 to start the music!" 
			activation_script = NO_MusicPlay 
			dont_deactivate_goals 
		} 
	ENDIF 
	BEGIN 
		PlayAnimWithPartialAnimIfExists anim = PED_Guitarist_idle 
		OBJ_waitanimfinished 
	REPEAT 
ENDSCRIPT

SCRIPT ALL_STATECONTROL_Guitarist_playing 
	IF LevelIs load_bo 
		IF ( BO_SFX_SubwayMusicStatus = 0 ) 
			SpawnSound BO_SFX_MusicPed_Subway_Music_Start 
		ENDIF 
	ENDIF 
	IF LevelIs load_no 
		IF ( NO_DixieMusicStatus = 0 ) 
			SpawnSound NO_SFX_Dixie_Start 
		ENDIF 
	ENDIF 
	PlayAnimWithPartialAnimIfExists anim = PED_Guitarist_GrabGuitar 
	OBJ_waitanimfinished 
	IF ScreenElementExists id = ped_speech_dialog 
		speech_box_exit anchor_id = ped_speech_dialog 
	ENDIF 
	IF LevelIs load_bo 
		IF ( BO_SFX_SubwayMusicStatus = 0 ) 
			SpawnSound BO_SFX_MusicPed_Subway_Music_Start02 
		ENDIF 
		setup_ped_speech { ped_id = TRG_MusicPed_On 
			inner_radius = 7 
			outer_radius = 8 
			accept_text = "Press \\m5 to stop!" 
			activation_script = BO_MusicStop 
			dont_deactivate_goals 
		} 
	ENDIF 
	IF LevelIs load_no 
		IF ( NO_DixieMusicStatus = 0 ) 
			SpawnSound NO_SFX_Dixie_Start02 
		ENDIF 
		setup_ped_speech { ped_id = trg_ped_jazz_01 
			inner_radius = 7 
			outer_radius = 8 
			accept_text = "Press \\m5 to stop!" 
			activation_script = NO_MusicStop 
			dont_deactivate_goals 
		} 
	ENDIF 
	IF LevelIs load_bo 
		BEGIN 
			GetRandomValue name = randomspeedvalue a = 0.60000002384 b = 1 resolution = 4 
			PlayAnimWithPartialAnimIfExists anim = PED_Guitarist_Play_pick speed = <randomspeedvalue> 
			OBJ_waitanimfinished 
		REPEAT 
	ELSE 
		BEGIN 
			RANDOM(1, 1, 1) 
				RANDOMCASE PlayAnimWithPartialAnimIfExists anim = PED_Guitarist_Play01 
				RANDOMCASE PlayAnimWithPartialAnimIfExists anim = PED_Guitarist__Play02 
				RANDOMCASE PlayAnimWithPartialAnimIfExists anim = PED_Guitarist_Play03 
			RANDOMEND 
			OBJ_waitanimfinished 
		REPEAT 
	ENDIF 
ENDSCRIPT

SCRIPT NO_STATECONTROL_fluteguy 
	IF LevelIs load_BE 
		IF ( BE_SFX_SaxManMusicStatus = 1 ) 
			SpawnSound BE_SFX_SaxManStop 
		ENDIF 
		setup_ped_speech { ped_id = TRG_ped_saxman01 
			inner_radius = 7 
			outer_radius = 8 
			accept_text = "Press \\m5 to start the music!" 
			activation_script = BE_MusicPlay 
			dont_deactivate_goals 
		} 
	ENDIF 
	PlayAnimWithPartialAnimIfExists anim = Fluteguy_BackToidle 
	OBJ_waitanimfinished 
	IF LevelIs load_BE 
		IF ( BE_SFX_SaxManMusicStatus = 1 ) 
			SpawnSound BE_SFX_SaxManStop02 
		ENDIF 
	ENDIF 
	BEGIN 
		PlayAnimWithPartialAnimIfExists anim = Fluteguy_idle 
		OBJ_waitanimfinished 
	REPEAT 
ENDSCRIPT

SCRIPT NO_STATECONTROL_fluteguy_playing 
	IF LevelIs load_BE 
		setup_ped_speech { ped_id = TRG_ped_saxman01 
			inner_radius = 7 
			outer_radius = 8 
			accept_text = "Press \\m5 to stop!" 
			activation_script = BE_MusicStop 
			dont_deactivate_goals 
		} 
	ENDIF 
	IF LevelIs load_BE 
		SpawnSound BE_SFX_SaxManStart 
	ENDIF 
	PlayAnimWithPartialAnimIfExists anim = Fluteguy_GrabFlute 
	OBJ_waitanimfinished 
	IF LevelIs load_BE 
		IF ( BE_SFX_SaxManMusicStatus = 0 ) 
			SpawnSound BE_SFX_SaxManStart02 
		ENDIF 
	ENDIF 
	BEGIN 
		RANDOM(3, 1, 1) 
			RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Fluteguy_Play 
			RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Fluteguy_Play1toPLay2 
			OBJ_waitanimfinished 
			GetRandomValue name = RepeatCount a = 1 b = 3 resolution = 3 Integer 
			BEGIN 
				PlayAnimWithPartialAnimIfExists anim = Fluteguy_Play2 
				OBJ_waitanimfinished 
			REPEAT <RepeatCount> 
			PlayAnimWithPartialAnimIfExists anim = Fluteguy_Play2toGrabFlute 
			RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Fluteguy_Play3 
		RANDOMEND 
		OBJ_waitanimfinished 
	REPEAT 
ENDSCRIPT

SCRIPT NO_STATECONTROL_Jazzman 
	PlayAnimWithPartialAnimIfExists anim = Ped_Jazzman_Back2Idle blendperiod = 1 
	OBJ_waitanimfinished 
	BEGIN 
		PlayAnimWithPartialAnimIfExists anim = Ped_Jazzman_idle_01 
		OBJ_waitanimfinished 
	REPEAT 
ENDSCRIPT

SCRIPT NO_STATECONTROL_Jazzman_playing 
	PlayAnimWithPartialAnimIfExists anim = Ped_jazzman_GrabTuba 
	OBJ_waitanimfinished 
	BEGIN 
		GetRandomValue name = RepeatCount a = 1 b = 2 resolution = 2 Integer 
		BEGIN 
			RANDOM(1, 1) 
				RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Ped_Jazzman_Play_01 
				RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Ped_Jazzman_Play_02 
			RANDOMEND 
			OBJ_waitanimfinished 
		REPEAT <RepeatCount> 
	REPEAT 
ENDSCRIPT

SCRIPT ALL_STATECONTROL_Cop_ticketing 
	obj_getID 
	<objid> : SwitchOnAtomic ped_Board 
	<objid> : SwitchOffAtomic ped_m_accessories 
	BEGIN 
		RANDOM(1, 1, 1, 1, 1) 
			RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Ped_CopClipboard1 speed = 0.69999998808 
			RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Ped_CopClipboard2 speed = 0.69999998808 
			RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Ped_CopClipboard4 speed = 0.69999998808 
			RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Ped_CopClipboard3 speed = 0.69999998808 
			RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Ped_CopClipboard_Stand2Idle backwards 
			OBJ_waitanimfinished 
			GetRandomValue name = RepeatCount a = 3 b = 10 resolution = 7 Integer 
			BEGIN 
				PlayAnimWithPartialAnimIfExists anim = Ped_CopClipboard_Stand 
				OBJ_waitanimfinished 
			REPEAT <RepeatCount> 
			PlayAnimWithPartialAnimIfExists anim = Ped_CopClipboard_Stand2Idle 
		RANDOMEND 
		OBJ_waitanimfinished 
	REPEAT 
ENDSCRIPT

SCRIPT AU_STATECONTROL_F_Bikini 
	OBJ_cycleanim anim = Ped_Bikini_LyingBack numcycles = 2 
	BEGIN 
		RANDOM(1, 1, 1) 
			RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Ped_Bikini_LyingFrontFromBack 
			OBJ_waitanimfinished 
			Ped_SetLogicState AU_STATE_F_Bikini_Front Table = AU_StateLogic_Table 
			RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Ped_Bikini_LyingBackToSit1 
			OBJ_waitanimfinished 
			Ped_SetLogicState AU_STATE_F_Bikini_Sit Table = AU_StateLogic_Table 
			RANDOMCASE GetRandomValue name = RepeatCount a = 1 b = 3 resolution = 3 Integer 
			BEGIN 
				PlayAnimWithPartialAnimIfExists anim = Ped_Bikini_LyingBack 
				OBJ_waitanimfinished 
			REPEAT <RepeatCount> 
		REPEAT 
	RANDOMEND 
ENDSCRIPT

SCRIPT AU_STATECONTROL_F_Bikini_Front 
	GetRandomValue name = RepeatCount a = 1 b = 5 resolution = 5 Integer 
	BEGIN 
		PlayAnimWithPartialAnimIfExists anim = Ped_Bikini_LyingFront 
		OBJ_waitanimfinished 
	REPEAT <RepeatCount> 
	PlayAnimWithPartialAnimIfExists anim = Ped_Bikini_LyingFrontToBack 
	OBJ_waitanimfinished 
	Ped_SetLogicState AU_STATE_F_Bikini Table = AU_StateLogic_Table 
ENDSCRIPT

SCRIPT AU_STATECONTROL_F_Bikini_Sit 
	GetRandomValue name = RepeatCount a = 1 b = 5 resolution = 5 Integer 
	BEGIN 
		RANDOM(1, 1, 1, 1) 
			RANDOMCASE 
			PlayAnimWithPartialAnimIfExists anim = Ped_Bikini_Sit1 
			RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Ped_Bikini_Sit1ToSit2 
			OBJ_waitanimfinished 
			PlayAnimWithPartialAnimIfExists anim = Ped_Bikini_Sit2 
			OBJ_waitanimfinished 
			PlayAnimWithPartialAnimIfExists anim = Ped_Bikini_Sit1FromSit2 
			RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Ped_Bikini_Sit1ToSit3 
			OBJ_waitanimfinished 
			PlayAnimWithPartialAnimIfExists anim = Ped_Bikini_Sit3 
			OBJ_waitanimfinished 
			PlayAnimWithPartialAnimIfExists anim = Ped_Bikini_Sit1FromSit3 
			RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Ped_Bikini_Sit1ToSunblock 
			OBJ_waitanimfinished 
			PlayAnimWithPartialAnimIfExists anim = Ped_Bikini_Sunblock 
			OBJ_waitanimfinished 
			PlayAnimWithPartialAnimIfExists anim = Ped_Bikini_Sit1FromSunblock 
		RANDOMEND 
		OBJ_waitanimfinished 
	REPEAT <RepeatCount> 
	PlayAnimWithPartialAnimIfExists anim = Ped_Bikini_LyingBackFromSit1 
	OBJ_waitanimfinished 
	Ped_SetLogicState AU_STATE_F_Bikini Table = AU_StateLogic_Table 
ENDSCRIPT

SCRIPT BE_STATECONTROL_Graffiti 
	Ped_TurnToCurrentWaypointOrientation 
	PlayAnimWithPartialAnimIfExists anim = Ped_Graffiti_Step2Tag 
	SwitchOnAtomic Board 
	SwitchOffAtomic ped_m_accessories 
	BEGIN 
		BEGIN 
			GetRandomValue name = RepeatCount a = 1 b = 5 resolution = 5 Integer 
			RANDOM(1, 1, 1) 
				RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Ped_Graffiti_Idle 
				RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Ped_Graffiti_LookAround 
				RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Ped_Graffiti_ShakeCan 
			RANDOMEND 
			OBJ_waitanimfinished 
		REPEAT <RepeatCount> 
		PlayAnimWithPartialAnimIfExists anim = Ped_Graffiti_Step2BigTag 
		OBJ_waitanimfinished 
		BEGIN 
			GetRandomValue name = RepeatCount a = 1 b = 3 resolution = 3 Integer 
			RANDOM(1, 1) 
				RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Ped_Graffiti_BigTag01 
				RANDOMCASE PlayAnimWithPartialAnimIfExists anim = Ped_Graffiti_BigTag02 
			RANDOMEND 
			OBJ_waitanimfinished 
		REPEAT <RepeatCount> 
		SwitchOnAtomic ped_m_accessories 
		SwitchOffAtomic Board 
		PlayAnimWithPartialAnimIfExists anim = Ped_Graffiti_BigTagStepBack 
		OBJ_waitanimfinished 
	REPEAT 
ENDSCRIPT


