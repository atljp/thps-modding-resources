
SCRIPT unlock_all_cutscenes 
ENDSCRIPT

SCRIPT add_view_cutscenes_to_menu 
	make_text_sub_menu_item text = "XXXXXX CINEMATICS XXXXXX" 
	make_select_view_cutscene_line text = "1A - New Jersey Streets" name = "cutscenes\\TR_1A.cut" 
	make_select_view_cutscene_line text = "1B - WareHouse Intro" name = "cutscenes\\TR_1B.cut" 
	make_select_view_cutscene_line text = "1C - WareHouse Picking Teams" name = "cutscenes\\TR_1C.cut" 
	make_select_view_cutscene_line text = "2A - Boston Paulie Scores" name = "cutscenes\\BO_2A.cut" 
	make_select_view_cutscene_line text = "2B - Bob gets BlackBalled" name = "cutscenes\\BO_2B.cut" 
	make_select_view_cutscene_line text = "3 - Barcelona Bull" name = "cutscenes\\BA_3.cut" 
	make_select_view_cutscene_line text = "3B - Barcelona Hotel" name = "cutscenes\\BA_3B.cut" 
	make_select_view_cutscene_line text = "4A - Berlin Sparrows a Weeinie" name = "cutscenes\\BE_4A.cut" 
	make_select_view_cutscene_line text = "4B - Berlin Scared Turtle" name = "cutscenes\\BE_4B.cut" 
	make_select_view_cutscene_line text = "5 - Australia Moustrap" name = "cutscenes\\AU_5.cut" 
	make_select_view_cutscene_line text = "6 - Australia Mystery Scene" name = "cutscenes\\AU_6.cut" 
	make_select_view_cutscene_line text = "7 - New Orleans Hurricane" name = "cutscenes\\NO_7.cut" 
	make_select_view_cutscene_line text = "8 - New Orleans Tony is IN" name = "cutscenes\\NO_8.cut" 
	make_select_view_cutscene_line text = "9 - SkaTopia Nigel is Exposed" name = "cutscenes\\SK_9.cut" 
	make_text_sub_menu_item text = "XXXXX LEVEL EVENTS XXXXX" 
	make_select_view_cutscene_line text = "BO_LevelEvent" name = "cutscenes\\BO_LevelEvent.cut" 
	make_select_view_cutscene_line text = "BO_SmallEvent_Billboard" name = "cutscenes\\BO_SmallEvent_Billboard.cut" 
	make_select_view_cutscene_line text = "BA_LevelEvent" name = "cutscenes\\BA_LevelEvent.cut" 
	make_select_view_cutscene_line text = "BA_SmallEvent_Billboard" name = "cutscenes\\BA_SmallEvent_Billboard.cut" 
	make_select_view_cutscene_line text = "BE_LevelEvent" name = "cutscenes\\BE_LevelEvent.cut" 
	make_select_view_cutscene_line text = "BE_SmallEvent_Billboard" name = "cutscenes\\BE_SmallEvent_Billboard.cut" 
	make_select_view_cutscene_line text = "AU_LevelEvent1" name = "cutscenes\\AU_LevelEvent1.cut" 
	make_select_view_cutscene_line text = "AU_LevelEvent2" name = "cutscenes\\AU_LevelEvent2.cut" 
	make_select_view_cutscene_line text = "AU_SmallEvent_Billboard" name = "cutscenes\\AU_SmallEvent_Billboard.cut" 
	make_select_view_cutscene_line text = "NO_LevelEvent1" name = "cutscenes\\NO_LevelEvent1.cut" 
	make_select_view_cutscene_line text = "NO_LevelEvent2" name = "cutscenes\\NO_LevelEvent2.cut" 
	make_select_view_cutscene_line text = "NO_SmallEvent_Billboard" name = "cutscenes\\NO_SmallEvent_Billboard.cut" 
	make_select_view_cutscene_line text = "ST_LevelEvent" name = "cutscenes\\ST_LevelEvent.cut" 
	make_select_view_cutscene_line text = "ST_SmallEvent_Billboard" name = "cutscenes\\ST_SmallEvent_Billboard.cut" 
	make_select_view_cutscene_line text = "SE_LevelEvent" name = "cutscenes\\SE_LevelEvent.cut" 
	make_select_view_cutscene_line text = "SE_SmallEvent_SpaceShip" name = "cutscenes\\SE_SmallEvent_SpaceShip.cut" 
	make_select_view_cutscene_line text = "SE_SmallEvent_Satan" name = "cutscenes\\SE_SmallEvent_Satan.cut" 
	make_select_view_cutscene_line text = "SE2_LevelEvent" name = "cutscenes\\SE2_LevelEvent.cut" 
	make_text_sub_menu_item text = "XXXXXXX TESTS XXXXXXX" 
	make_select_view_cutscene_line text = "TEST" name = "cutscenes\\Test.cut" 
	make_select_view_cutscene_line text = "TEST_SkinModel" name = "cutscenes\\Test_SkinModel.cut" 
	make_select_view_cutscene_line text = "TEST_MovingParticles" name = "cutscenes\\Test_MovingParticles.cut" 
	make_select_view_cutscene_line text = "TEST_Character" name = "cutscenes\\Test_Character.cut" 
	make_select_view_cutscene_line text = "TEST_Character_Face" name = "cutscenes\\Test_Character_Face.cut" 
	make_select_view_cutscene_line text = "TEST_2Characters" name = "cutscenes\\Test_2Characters.cut" 
	make_text_sub_menu_item text = "XXXXXXXX END XXXXXXXX" 
	IF NOT ( DEMO_BUILD ) 
	ENDIF 
	theme_menu_add_item centered = 1 text = "Done" id = menu_exit pad_choose_script = create_pause_menu last_menu_item = 1 
ENDSCRIPT

SCRIPT TR_1b_begin 
	IF Levelis load_tr 
		IF IsAlive name = Wh_TB_Cut_FireGlow_01 
			Kill name = Wh_TB_Cut_FireGlow_01 
		ENDIF 
		Fakelights percent = 0 prefix = "TRG_TR_Level_Light" time = 0 
		Fakelights percent = 0 id = TRG_TR_Level_Lightcut_57 time = 0 
	ENDIF 
ENDSCRIPT

SCRIPT TR_1b_end 
	IF Levelis load_tr 
		create name = Wh_TB_Cut_FireGlow_01 
		printf "calling fakelights" 
		SpawnScript TR_Restore_FakeLights 
	ENDIF 
ENDSCRIPT

SCRIPT TR_Restore_FakeLights 
	wait 1 frame 
	Fakelights percent = 100 prefix = "TRG_TR_Level_Light" time = 0 
ENDSCRIPT

SCRIPT TR_1c_begin 
	IF Levelis load_tr 
		Fakelights percent = 0 prefix = "TRG_TR_Level_Light" time = 0 
	ENDIF 
ENDSCRIPT

SCRIPT TR_1c_end 
	IF Levelis load_tr 
		SpawnScript TR_Restore_FakeLights 
	ENDIF 
ENDSCRIPT

SCRIPT BO_2A_begin 
	IF Levelis load_bo 
		IF IsAlive prefix = "BO_tz_Boat" 
			Kill prefix = "BO_tz_Boat" 
		ENDIF 
		IF IsAlive prefix = "BO_TB_Boat" 
			Kill prefix = "BO_TB_Boat" 
		ENDIF 
		IF IsAlive prefix = "BO_Boat" 
			Kill prefix = "BO_Boat" 
		ENDIF 
		IF IsAlive prefix = "BO_Barrel" 
			Kill prefix = "BO_Barrel" 
		ENDIF 
		IF IsAlive name = BO_TeaPartyLadder 
			Kill name = BO_TeaPartyLadder 
		ENDIF 
		IF IsAlive name = BO_TeaParty_CrowsNest 
			Kill name = BO_TeaParty_CrowsNest 
		ENDIF 
		IF IsAlive name = JG_BO_BoatLights 
			Kill name = JG_BO_BoatLights 
		ENDIF 
		IF IsAlive name = BO_tz_boat_acces 
			Kill name = BO_tz_boat_acces 
		ENDIF 
		IF IsAlive name = NightOn_03_BO_TZ_Boat_Body_Curtains01 
			Kill name = NightOn_03_BO_TZ_Boat_Body_Curtains01 
		ENDIF 
		IF IsAlive name = NightOff_03_BO_TZ_Boat_Body_Curtains 
			Kill name = NightOff_03_BO_TZ_Boat_Body_Curtains 
		ENDIF 
		IF IsAlive name = BO_BarrierQP02 
			Kill name = BO_BarrierQP02 
		ENDIF 
		IF IsAlive name = BO_ShatterMast 
			Kill name = BO_ShatterMast 
		ENDIF 
		IF IsAlive name = BO_BoatMast_Lights 
			Kill name = BO_BoatMast_Lights 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT BO_2A_end 
	IF Levelis load_bo 
		create prefix = "BO_tz_Boat" 
		create prefix = "BO_TB_Boat" 
		create prefix = "BO_Barrel" 
		create prefix = "BO_Boat" 
		create name = BO_TeaPartyLadder 
		create name = BO_TeaParty_CrowsNest 
		create name = JG_BO_BoatLights 
		create name = BO_tz_boat_acces 
		create name = NightOn_03_BO_TZ_Boat_Body_Curtains01 
		create name = NightOff_03_BO_TZ_Boat_Body_Curtains 
		create name = BO_BarrierQP02 
		create name = BO_ShatterMast 
		create name = BO_BoatMast_Lights 
	ENDIF 
ENDSCRIPT

SCRIPT BO_LevelEvent_begin 
	IF Levelis load_bo 
		IF IsAlive prefix = "BO_VentHouse" 
			Kill prefix = "BO_VentHouse" 
		ENDIF 
		IF IsAlive name = CANNON_VentHouse 
			Kill name = CANNON_VentHouse 
		ENDIF 
		IF IsAlive name = BO_Cannon01 
			Kill name = BO_Cannon01 
		ENDIF 
		IF IsAlive name = BO_Cannon02 
			Kill name = BO_Cannon02 
		ENDIF 
		IF IsAlive name = BO_ConstFence08 
			Kill name = BO_ConstFence08 
		ENDIF 
		IF IsAlive name = BO_ConstFence09 
			Kill name = BO_ConstFence09 
		ENDIF 
		IF IsAlive name = BO_ConstFence10 
			Kill name = BO_ConstFence10 
		ENDIF 
		IF IsAlive name = TRG_Rail_Normal01 
			Kill name = TRG_Rail_Normal01 
		ENDIF 
		IF IsAlive name = JG_BD_SideMiscBefore 
			Kill name = JG_BD_SideMiscBefore 
		ENDIF 
		IF IsAlive name = JG_BD_Woodstacks 
			Kill name = JG_BD_Woodstacks 
		ENDIF 
		IF IsAlive prefix = "NORMAL_Girder" 
			Kill prefix = "NORMAL_Girder" 
		ENDIF 
		IF IsAlive prefix = "CANNON_SmokeA" 
			Kill prefix = "CANNON_SmokeA" 
		ENDIF 
		IF IsAlive prefix = "CANNON_SmokeB" 
			Kill prefix = "CANNON_SmokeB" 
		ENDIF 
		IF IsAlive prefix = "CANNON_SmokeC" 
			Kill prefix = "CANNON_SmokeC" 
		ENDIF 
		IF IsAlive prefix = "CANNON_SmokeD" 
			Kill prefix = "CANNON_SmokeD" 
		ENDIF 
		IF IsAlive prefix = "CANNON_FireA" 
			Kill prefix = "CANNON_FireA" 
		ENDIF 
		IF IsAlive name = ParticleBox_Smoke01A 
			Kill name = ParticleBox_Smoke01A 
		ENDIF 
		IF IsAlive name = ParticleBox_Smoke02A 
			Kill name = ParticleBox_Smoke02A 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT BO_LevelEvent_end 
	IF Levelis load_bo 
		create name = BO_Cannon01 
		create name = BO_Cannon02 
		BO_Cannon_Event_Out 
	ENDIF 
ENDSCRIPT

SCRIPT BO_SmallEvent_Billboard_begin 
	IF Levelis load_bo 
		IF IsAlive name = BO_AS_MasterPiece_final01 
			Kill name = BO_AS_MasterPiece_final01 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT BO_SmallEvent_Billboard_end 
	IF Levelis load_bo 
		IF NOT IsAlive name = BO_AS_MasterPiece_final01 
			create name = BO_AS_MasterPiece_final01 
		ENDIF 
		IF IsAlive name = BO_AS_MasterPiece_part01 
			printf "!!!!!!! Its Alive !!!!!!!" 
		ENDIF 
		Kill prefix = "BO_AS_MasterPiece_part" 
	ENDIF 
ENDSCRIPT

SCRIPT BA_LevelEvent_begin 
	IF Levelis load_ba 
		IF IsAlive name = BA_Bull_Truck 
			Kill name = BA_Bull_Truck 
		ENDIF 
		IF IsAlive prefix = "BA_BullBefore" 
			Kill prefix = "BA_BullBefore" 
		ENDIF 
	ENDIF 
	IF NOT ( ( BA_BRIDGE_STATE = passable ) | ( GoalManager_HasWonGoal name = ba_goal_gaps2 ) ) 
		forced_create prefix = "TRG_BA_Bridge_Impassable_Tram" 
	ENDIF 
ENDSCRIPT

SCRIPT BA_LevelEvent_end 
	IF Levelis load_ba 
		BA_Event_BullAfter 
		Kill prefix = "TRG_BA_Bridge_Impassable_Tram05" 
		forced_create name = BA_Bull_Truck 
	ENDIF 
ENDSCRIPT

SCRIPT BA_SmallEvent_Billboard_begin 
	IF Levelis load_ba 
		IF IsAlive name = BA_AS_MasterPiece_final01 
			Kill name = BA_AS_MasterPiece_final01 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT BA_SmallEvent_Billboard_end 
	IF Levelis load_ba 
		IF NOT IsAlive name = BA_AS_MasterPiece_final01 
			create name = BA_AS_MasterPiece_final01 
		ENDIF 
		Kill prefix = "BA_AS_MasterPiece_part" 
	ENDIF 
ENDSCRIPT

SCRIPT BE_LevelEvent_begin 
	IF Levelis load_be 
		IF IsAlive name = g_train_sign_lip03 
			Kill name = g_train_sign_lip03 
		ENDIF 
		IF IsAlive name = g_Tunnel_lightpole01 
			Kill name = g_Tunnel_lightpole01 
		ENDIF 
		IF IsAlive name = g_event_After_13 
			Kill name = g_event_After_13 
		ENDIF 
		IF IsAlive name = g_event_After_14 
			Kill name = g_event_After_14 
		ENDIF 
		IF IsAlive name = g_event_After_15 
			Kill name = g_event_After_15 
		ENDIF 
		IF IsAlive name = g_event_After_18 
			Kill name = g_event_After_18 
		ENDIF 
		IF IsAlive name = g_event_After_20 
			Kill name = g_event_After_20 
		ENDIF 
		IF IsAlive name = g_event_Before03 
			Kill name = g_event_Before03 
		ENDIF 
		IF IsAlive name = g_event_Before06 
			Kill name = g_event_Before06 
		ENDIF 
		IF IsAlive name = g_event_Before08 
			Kill name = g_event_Before08 
		ENDIF 
		IF IsAlive name = g_pub_shadow_03 
			Kill name = g_pub_shadow_03 
		ENDIF 
		IF IsAlive name = g_pub_sign_01_shadow 
			Kill name = g_pub_sign_01_shadow 
		ENDIF 
		IF IsAlive name = g_pub_sign_02_shadow 
			Kill name = g_pub_sign_02_shadow 
		ENDIF 
		IF NOT IsAlive name = g_destroyed_int_pub_01 
			create name = g_destroyed_int_pub_01 
		ENDIF 
		IF IsAlive name = NightOn_05_g_train_sign_light 
			printf "Kill billboards" 
			Kill name = NightOn_05_g_train_sign_light 
			Kill name = NightOn_05_g_train_sign_light_01 
			Kill name = NightOn_05_g_train_sign_light_02 
			Kill name = NightOn_05_g_train_sign_light_03 
			TODManager_MarkPermanentlyDead name = NightOn_05_g_train_sign_light 
			TODManager_MarkPermanentlyDead name = NightOn_05_g_train_sign_light_01 
			TODManager_MarkPermanentlyDead name = NightOn_05_g_train_sign_light_02 
			TODManager_MarkPermanentlyDead name = NightOn_05_g_train_sign_light_03 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT BE_LevelEvent_end 
	IF Levelis load_be 
		BE_Train_Event_out 
		IF IsAlive name = g_pub_bier_sign_01 
			Kill name = g_pub_bier_sign_01 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT BE_SmallEvent_Billboard_begin 
	IF Levelis load_be 
		IF IsAlive name = BE_AS_MasterPiece_final01 
			Kill name = BE_AS_MasterPiece_final01 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT BE_SmallEvent_Billboard_end 
	IF Levelis load_be 
		BE_Goal_Gaps12_Geo 
		Kill prefix = "BE_AS_MasterPiece_part" 
	ENDIF 
ENDSCRIPT

SCRIPT BE_4A_begin 
	IF Levelis load_be 
		IF IsAlive name = g_phil_qp09 
			Kill name = g_phil_qp09 
		ENDIF 
		IF IsAlive name = g_phil_BulbShatter01 
			Kill name = g_phil_BulbShatter01 
		ENDIF 
		IF IsAlive name = g_phil_BulbShatter02 
			Kill name = g_phil_BulbShatter02 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT BE_4A_end 
	IF Levelis load_be 
		IF NOT IsAlive name = g_phil_qp09 
			create name = g_phil_qp09 
		ENDIF 
		IF NOT IsAlive name = g_phil_BulbShatter01 
			create name = g_phil_BulbShatter01 
		ENDIF 
		IF NOT IsAlive name = g_phil_BulbShatter02 
			create name = g_phil_BulbShatter02 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT AU_5_begin 
ENDSCRIPT

SCRIPT AU_5_end 
	clear_temporary_nude_appearance 
ENDSCRIPT

SCRIPT set_temporary_nude_appearance 
	GetCurrentSkaterProfileIndex 
	RememberTemporaryAppearance player = <currentSkaterProfileIndex> name = au_5_temp_profile NoFaceTexture 
	GetSkaterProfileInfo player = <currentSkaterProfileIndex> 
	IF ( <is_male> = 1 ) 
		check_for_non_standard_parts player = <currentSkaterProfileIndex> part = skater_m_torso 
		IF ( <clear_ok> ) 
			EditPlayerAppearance profile = <currentSkaterProfile> target = ClearPart targetParams = { part = skater_m_torso } 
			EditPlayerAppearance profile = <currentSkaterProfile> target = SetPart targetParams = { part = bare_torso desc_id = %"Bare Torso" } 
		ENDIF 
		check_for_non_standard_parts player = <currentSkaterProfileIndex> part = skater_m_legs 
		IF ( <clear_ok> ) 
			EditPlayerAppearance profile = <currentSkaterProfile> target = SetPart targetParams = { part = skater_m_legs desc_id = Briefs } 
		ENDIF 
		check_for_non_standard_parts player = <currentSkaterProfileIndex> part = skater_m_hands 
		IF ( <clear_ok> ) 
			EditPlayerAppearance profile = <currentSkaterProfile> target = SetPart targetParams = { part = skater_m_hands desc_id = Hands } 
		ENDIF 
		EditPlayerAppearance profile = <currentSkaterProfile> target = SetPart targetParams = { part = skater_m_backpack desc_id = None } 
	ELSE 
		EditPlayerAppearance profile = <currentSkaterProfile> target = SetPart targetParams = { part = skater_f_torso desc_id = None } 
		EditPlayerAppearance profile = <currentSkaterProfile> target = SetPart targetParams = { part = skater_f_legs desc_id = None } 
		check_for_non_standard_parts player = <currentSkaterProfileIndex> part = skater_f_hands 
		IF ( <clear_ok> ) 
			EditPlayerAppearance profile = <currentSkaterProfile> target = SetPart targetParams = { part = skater_f_hands desc_id = Hands } 
		ENDIF 
		EditPlayerAppearance profile = <currentSkaterProfile> target = SetPart targetParams = { part = skater_f_backpack desc_id = None } 
	ENDIF 
	EditPlayerAppearance profile = <currentSkaterProfile> target = SetPart targetParams = { part = sleeves desc_id = None } 
	check_for_non_standard_parts player = <currentSkaterProfileIndex> part = skater_m_legs 
	IF ( <clear_ok> ) 
		EditPlayerAppearance profile = <currentSkaterProfile> target = SetPart targetParams = { part = shoes desc_id = BareFeet } 
	ENDIF 
	EditPlayerAppearance profile = <currentSkaterProfile> target = ClearPart targetParams = { part = socks } 
	EditPlayerAppearance profile = <currentSkaterProfile> target = ClearPart targetParams = { part = socks_lower } 
	EditPlayerAppearance profile = <currentSkaterProfile> target = ClearPart targetParams = { part = kneepads } 
	EditPlayerAppearance profile = <currentSkaterProfile> target = ClearPart targetParams = { part = elbowpads } 
	check_for_non_standard_parts player = <currentSkaterProfileIndex> part = accessory1 side = left 
	IF ( <clear_ok> ) 
		EditPlayerAppearance profile = <currentSkaterProfile> target = ClearPart targetParams = { part = accessory1 } 
	ENDIF 
	check_for_non_standard_parts player = <currentSkaterProfileIndex> part = accessory2 side = right 
	IF ( <clear_ok> ) 
		EditPlayerAppearance profile = <currentSkaterProfile> target = ClearPart targetParams = { part = accessory2 } 
	ENDIF 
	refresh_skater_model 
ENDSCRIPT

SCRIPT clear_temporary_nude_appearance 
	GetCurrentSkaterProfileIndex 
	RestoreTemporaryAppearance player = <currentSkaterProfileIndex> name = au_5_temp_profile NoFaceTexture 
	refresh_skater_model 
ENDSCRIPT

SCRIPT AU_LevelEvent1_begin 
	IF Levelis load_au 
		IF IsAlive name = NightOff_01_Street_lamp_06 
			Kill name = NightOff_01_Street_lamp_06 
		ENDIF 
		IF IsAlive name = NightOn_01_Street_lamp_03_Globe01 
			Kill name = NightOn_01_Street_lamp_03_Globe01 
		ENDIF 
		IF IsAlive name = NightOn_01_Street_lamp_06 
			Kill name = NightOn_01_Street_lamp_06 
		ENDIF 
		IF IsAlive name = NightOff_01_Street_lamp_03_Globe 
			Kill name = NightOff_01_Street_lamp_03_Globe 
		ENDIF 
		IF IsAlive name = Geo_Street_Hydrant01 
			Kill name = Geo_Street_Hydrant01 
		ENDIF 
		IF IsAlive name = Geo_Street_Hydrant01_Bolt 
			Kill name = Geo_Street_Hydrant01_Bolt 
		ENDIF 
		IF IsAlive name = Geo_PreEvent_A_Wall01 
			Kill name = Geo_PreEvent_A_Wall01 
		ENDIF 
		IF IsAlive name = Geo_PreEvent_A_Wall02 
			Kill name = Geo_PreEvent_A_Wall02 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT AU_LevelEvent1_end 
	IF Levelis load_au 
		AU_Event_A_Out 
	ENDIF 
ENDSCRIPT

SCRIPT AU_LevelEvent2_begin 
	IF Levelis load_au 
		IF IsAlive prefix = "Geo_PostEvent_B" 
			Kill prefix = "Geo_PostEvent_B" 
		ENDIF 
		IF IsAlive name = Geo_PreEvent_B_Stairs01 
			Kill name = Geo_PreEvent_B_Stairs01 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT AU_LevelEvent2_end 
	IF Levelis load_au 
		AU_Event_B_Out 
	ENDIF 
ENDSCRIPT

SCRIPT AU_SmallEvent_Billboard_begin 
	IF Levelis load_au 
		IF IsAlive name = AU_AS_MasterPiece_final01 
			Kill name = AU_AS_MasterPiece_final01 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT AU_SmallEvent_Billboard_end 
	IF Levelis load_au 
		IF NOT IsAlive name = AU_AS_MasterPiece_final01 
			create name = AU_AS_MasterPiece_final01 
		ENDIF 
		Kill prefix = "AU_AS_MasterPiece_part" 
	ENDIF 
ENDSCRIPT

SCRIPT AU_6_begin 
	IF Levelis load_au 
		IF IsAlive name = NBP_LowRV 
			Kill name = NBP_LowRV 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT NO_LevelEvent1_begin 
	IF Levelis load_no 
		TODManager_SetTODInstant evening 
		IF NOT IsAlive name = g_vortex_cone 
			create name = g_vortex_cone 
		ENDIF 
		IF NOT IsAlive name = g_grv_event_bowl 
			create name = g_grv_event_bowl 
		ENDIF 
		IF IsAlive name = g_grv_event_dome 
			Kill name = g_grv_event_dome 
			Kill name = g_grv_dome_invis 
			Kill name = g_funkhole_cover 
		ENDIF 
		IF IsAlive name = g_vortex_base 
			Kill name = g_vortex_base 
		ENDIF 
		IF IsAlive name = g_vortex_base01 
			Kill name = g_vortex_base01 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT NO_LevelEvent1_BloomFlash holdTime = 0.20000000298 restoreTime = 0.50000000000 stepTime = 0.05000000075 minColor = 0 bloom1 = 50 bloom2 = 100 maxStrength = 255 
	SetScreenEffectsOn 
	newColor = [ 0 0 0 ] 
	castToInteger minColor 
	setArrayElement arrayName = newColor index = 0 newValue = <minColor> 
	setArrayElement arrayName = newColor index = 1 newValue = <minColor> 
	setArrayElement arrayName = newColor index = 2 newValue = <minColor> 
	newStrength = [ 255 255 255 ] 
	castToInteger maxStrength 
	setArrayElement arrayName = newStrength index = 0 newValue = <maxStrength> 
	setArrayElement arrayName = newStrength index = 1 newValue = <maxStrength> 
	setArrayElement arrayName = newStrength index = 2 newValue = <maxStrength> 
	maxStrength = ( <maxStrength> + 0.00000000000 ) 
	TODManager_SetTempBloomParams on = 1 color = <newColor> bloom1 = <bloom1> bloom2 = <bloom2> strength = <newStrength> 
	wait <holdTime> seconds 
	restoreTime = ( <restoreTime> + 0.00000000000 ) 
	numSteps = ( <restoreTime> / <stepTime> ) 
	stepSize = ( <maxStrength> / <numSteps> ) 
	time = 1 
	BEGIN 
		val = ( <maxStrength> - ( <time> * <stepSize> ) ) 
		castToInteger val 
		IF ( <val> < 0 ) 
			<val> = 0 
		ENDIF 
		setArrayElement arrayName = newStrength index = 0 newValue = <val> 
		setArrayElement arrayName = newStrength index = 1 newValue = <val> 
		setArrayElement arrayName = newStrength index = 2 newValue = <val> 
		TODManager_SetTempBloomParams on = 1 color = <newColor> bloom1 = <bloom1> bloom2 = <bloom2> strength = <newStrength> 
		<time> = ( <time> + 1 ) 
		wait <stepTime> seconds 
		IF ( <time> > <numSteps> ) 
			BREAK 
		ENDIF 
	REPEAT 
	TODManager_SetTempBloomParams on = 0 
ENDSCRIPT

SCRIPT NO_LevelEvent1_end 
	IF Levelis load_no 
		Kill prefix = "trg_zomb_ped_" 
		NO_voodoo_vortex 
	ENDIF 
	KillSpawnedScript name = NO_LevelEvent1_BloomFlash 
ENDSCRIPT

SCRIPT NO_SmallEvent_Billboard_begin 
	IF Levelis load_no 
		IF IsAlive name = NO_AS_MasterPiece_final01 
			Kill name = NO_AS_MasterPiece_final01 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT NO_SmallEvent_Billboard_end 
	IF Levelis load_no 
		IF NOT IsAlive name = NO_AS_MasterPiece_final01 
			create name = NO_AS_MasterPiece_final01 
		ENDIF 
		Kill prefix = "NO_AS_MasterPiece_part" 
	ENDIF 
ENDSCRIPT

SCRIPT NO_8_begin 
	IF Levelis load_no 
		IF IsAlive name = g_grv_sign_lightglo02 
			Kill name = g_grv_sign_lightglo02 
		ENDIF 
		IF IsAlive name = g_grv_sign_lightglo01 
			Kill name = g_grv_sign_lightglo01 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT NO_8_end 
	IF Levelis load_no 
		IF NOT IsAlive name = g_grv_sign_lightglo02 
			create name = g_grv_sign_lightglo02 
		ENDIF 
		IF NOT IsAlive name = g_grv_sign_lightglo01 
			create name = g_grv_sign_lightglo01 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT ST_SmallEvent_Billboard_begin 
	IF Levelis load_st 
		IF IsAlive name = ST_AS_MasterPiece_final01 
			Kill name = ST_AS_MasterPiece_final01 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT ST_SmallEvent_Billboard_end 
	IF Levelis load_st 
		IF NOT IsAlive name = ST_AS_MasterPiece_final01 
			create name = ST_AS_MasterPiece_final01 
		ENDIF 
		Kill prefix = "ST_AS_MasterPiece_part" 
	ENDIF 
ENDSCRIPT

SCRIPT SE_LevelEvent_begin 
	IF Levelis load_se 
		IF IsAlive name = GEO_PreEvent_Boulder_Temple_BoulderGlow_01 
			Kill name = GEO_PreEvent_Boulder_Temple_BoulderGlow_01 
		ENDIF 
		IF IsAlive name = CG_0530_544 
			Kill name = CG_0530_544 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT SE_LevelEvent_end 
	IF Levelis load_se 
		IF NOT IsAlive name = GEO_PreEvent_Boulder_Temple_BoulderGlow_01 
			create name = GEO_PreEvent_Boulder_Temple_BoulderGlow_01 
		ENDIF 
		IF NOT IsAlive name = CG_0530_544 
			create name = CG_0530_544 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT SE_SmallEvent_SpaceShip_begin 
	IF Levelis load_se 
		AllowBoneLOD allow = 0 
		IF IsAlive name = GEO_PreEvent_Spaceship_Spaceport_HangarDoorClosed_Top 
			Kill name = GEO_PreEvent_Spaceship_Spaceport_HangarDoorClosed_Top 
		ENDIF 
		IF IsAlive name = GEO_PreEvent_Spaceship_Spaceport_HangarDoorClosed_Bottom 
			Kill name = GEO_PreEvent_Spaceship_Spaceport_HangarDoorClosed_Bottom 
		ENDIF 
		IF IsAlive name = GEO_PreEvent_Spaceship_Engine_01 
			Kill name = GEO_PreEvent_Spaceship_Engine_01 
		ENDIF 
		IF IsAlive name = GEO_PreEvent_Spaceship_Engine_02 
			Kill name = GEO_PreEvent_Spaceship_Engine_02 
		ENDIF 
		IF IsAlive name = TRG_PreEvent_Spaceship_EngineSmoke_01_Start 
			Kill name = TRG_PreEvent_Spaceship_EngineSmoke_01_Start 
		ENDIF 
		IF IsAlive name = TRG_PreEvent_Spaceship_EngineSmoke_02_Start 
			Kill name = TRG_PreEvent_Spaceship_EngineSmoke_02_Start 
		ENDIF 
		destroyfastparticlesystem name = SP_Shiphover 
		destroyfastparticlesystem name = thrusterR1 attachobjid = GEO_PreEvent_SpaceShip_Ship_01 
		destroyfastparticlesystem name = thrusterL1 attachobjid = GEO_PreEvent_SpaceShip_Ship_01 
		destroyfastparticlesystem name = thrusterR2 attachobjid = GEO_PreEvent_SpaceShip_Ship_01 
		destroyfastparticlesystem name = thrusterL2 attachobjid = GEO_PreEvent_SpaceShip_Ship_01 
	ENDIF 
ENDSCRIPT

SCRIPT SE_SpaceShip_BloomFlash holdTime = 0.20000000298 restoreTime = 0.50000000000 stepTime = 0.05000000075 minColor = 0 bloom1 = 50 bloom2 = 100 maxStrength = 255 
	SetScreenEffectsOn 
	newColor = [ 0 0 0 ] 
	castToInteger minColor 
	setArrayElement arrayName = newColor index = 0 newValue = <minColor> 
	setArrayElement arrayName = newColor index = 1 newValue = <minColor> 
	setArrayElement arrayName = newColor index = 2 newValue = <minColor> 
	newStrength = [ 255 255 255 ] 
	castToInteger maxStrength 
	setArrayElement arrayName = newStrength index = 0 newValue = <maxStrength> 
	setArrayElement arrayName = newStrength index = 1 newValue = <maxStrength> 
	setArrayElement arrayName = newStrength index = 2 newValue = <maxStrength> 
	maxStrength = ( <maxStrength> + 0.00000000000 ) 
	TODManager_SetTempBloomParams on = 1 color = <newColor> bloom1 = <bloom1> bloom2 = <bloom2> strength = <newStrength> 
	wait <holdTime> seconds 
	restoreTime = ( <restoreTime> + 0.00000000000 ) 
	numSteps = ( <restoreTime> / <stepTime> ) 
	stepSize = ( <maxStrength> / <numSteps> ) 
	time = 1 
	BEGIN 
		val = ( <maxStrength> - ( <time> * <stepSize> ) ) 
		castToInteger val 
		IF ( <val> < 0 ) 
			<val> = 0 
		ENDIF 
		setArrayElement arrayName = newStrength index = 0 newValue = <val> 
		setArrayElement arrayName = newStrength index = 1 newValue = <val> 
		setArrayElement arrayName = newStrength index = 2 newValue = <val> 
		TODManager_SetTempBloomParams on = 1 color = <newColor> bloom1 = <bloom1> bloom2 = <bloom2> strength = <newStrength> 
		<time> = ( <time> + 1 ) 
		wait <stepTime> seconds 
		IF ( <time> > <numSteps> ) 
			BREAK 
		ENDIF 
	REPEAT 
	TODManager_SetTempBloomParams on = 0 
ENDSCRIPT

SCRIPT SE_SmallEvent_Satan_begin 
	IF Levelis load_se 
		IF IsAlive name = GEO_PreEvent_Rib_Mouth 
			Kill name = GEO_PreEvent_Rib_Mouth 
		ENDIF 
		IF IsAlive name = GEO_PostEvent_Rib_Mouth 
			Kill name = GEO_PostEvent_Rib_Mouth 
		ENDIF 
		IF IsAlive name = GEO_PostEvent_Rib_Tongue 
			Kill name = GEO_PostEvent_Rib_Tongue 
		ENDIF 
		IF IsAlive name = GEO_PreEvent_Rib_LoungeQP_001 
			Kill name = GEO_PreEvent_Rib_LoungeQP_001 
		ENDIF 
		IF IsAlive name = JG_0602_41 
			Kill name = JG_0602_41 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT SE_SmallEvent_Satan_end 
	IF Levelis load_se 
		IF NOT IsAlive name = JG_0602_41 
			create name = JG_0602_41 
		ENDIF 
		IF NOT IsAlive name = GEO_PostEvent_Rib_Mouth 
			create name = GEO_PostEvent_Rib_Mouth 
		ENDIF 
		IF NOT IsAlive name = GEO_PostEvent_Rib_Tongue 
			create name = GEO_PostEvent_Rib_Tongue 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT SE2_LevelEvent_begin 
	IF Levelis load_se2 
		IF IsAlive name = missle01 
			Kill name = missle01 
		ENDIF 
		IF IsAlive name = missle02 
			Kill name = missle02 
		ENDIF 
		IF IsAlive name = missle03 
			Kill name = missle03 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT SE2_LevelEvent_end 
	IF Levelis load_se2 
		SE2_Missile_Event_Out 
	ENDIF 
ENDSCRIPT

SCRIPT Sk_9_begin 
	IF Levelis load_st 
		IF IsAlive name = g_periph_frontlogs_cut 
			Kill name = g_periph_frontlogs_cut 
		ENDIF 
		IF NOT IsAlive name = apm_fireridge01 
			create name = apm_fireridge01 
		ENDIF 
		IF IsAlive name = g_endgoal_lowrv 
			Kill name = g_endgoal_lowrv 
		ENDIF 
		IF IsAlive name = TRG_Ped_Escape_Bam 
			Kill name = TRG_Ped_Escape_Bam 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT Sk_9_end 
	IF Levelis load_st 
		IF NOT IsAlive name = g_periph_frontlogs_cut 
			create name = g_periph_frontlogs_cut 
		ENDIF 
		IF IsAlive name = apm_fireridge01 
			Kill name = apm_fireridge01 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT launch_view_cutscenes_menu 
	RunScriptOnScreenElement id = current_menu_anchor animate_out callback = create_view_cutscenes_menu callback_params = { <...> } 
ENDSCRIPT

SCRIPT make_select_view_cutscene_line 
	make_text_sub_menu_item text = <text> pad_choose_script = view_cutscene pad_choose_params = <...> 
ENDSCRIPT

SCRIPT create_view_cutscenes_menu 
	make_new_menu menu_id = view_cutscenes_menu vmenu_id = view_cutscenes_vmenu menu_title = "CUTSCENES" type = vscrollingmenu dims = PAIR(320.00000000000, 200.00000000000) 
	SetScreenElementProps { id = view_cutscenes_menu event_handlers = [ 
			{ pad_back create_test_menu } 
		] 
	} 
	add_view_cutscenes_to_menu <...> 
	RunScriptOnScreenElement id = current_menu_anchor animate_in 
ENDSCRIPT

SCRIPT view_cutscene 
	UnpauseGame 
	PauseMusic 0 
	PlayCutscene <...> exitScript = view_cutscene_done 
	RunScriptOnScreenElement id = current_menu_anchor menu_offscreen 
ENDSCRIPT

SCRIPT view_cutscene_done 
	PauseGame 
	PauseMusic 1 
	create_view_cutscenes_menu 
ENDSCRIPT


