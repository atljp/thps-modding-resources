

script unlock_all_cutscenes 
endscript


script add_view_cutscenes_to_menu 
    make_text_sub_menu_item text = 'XXXXXX CINEMATICS XXXXXX'
    make_select_view_cutscene_line text = '1A - New Jersey Streets' name = 'cutscenes\TR_1A.cut'
    make_select_view_cutscene_line text = '1B - WareHouse Intro' name = 'cutscenes\TR_1B.cut'
    make_select_view_cutscene_line text = '1C - WareHouse Picking Teams' name = 'cutscenes\TR_1C.cut'
    make_select_view_cutscene_line text = '2A - Boston Paulie Scores' name = 'cutscenes\BO_2A.cut'
    make_select_view_cutscene_line text = '2B - Bob gets BlackBalled' name = 'cutscenes\BO_2B.cut'
    make_select_view_cutscene_line text = '3 - Barcelona Bull' name = 'cutscenes\BA_3.cut'
    make_select_view_cutscene_line text = '3B - Barcelona Hotel' name = 'cutscenes\BA_3B.cut'
    make_select_view_cutscene_line text = '4A - Berlin Sparrows a Weeinie' name = 'cutscenes\BE_4A.cut'
    make_select_view_cutscene_line text = '4B - Berlin Scared Turtle' name = 'cutscenes\BE_4B.cut'
    make_select_view_cutscene_line text = '5 - Australia Moustrap' name = 'cutscenes\AU_5.cut'
    make_select_view_cutscene_line text = '6 - Australia Mystery Scene' name = 'cutscenes\AU_6.cut'
    make_select_view_cutscene_line text = '7 - New Orleans Hurricane' name = 'cutscenes\NO_7.cut'
    make_select_view_cutscene_line text = '8 - New Orleans Tony is IN' name = 'cutscenes\NO_8.cut'
    make_select_view_cutscene_line text = '9 - SkaTopia Nigel is Exposed' name = 'cutscenes\SK_9.cut'
    make_text_sub_menu_item text = 'XXXXX LEVEL EVENTS XXXXX'
    make_select_view_cutscene_line text = 'BO_LevelEvent' name = 'cutscenes\BO_LevelEvent.cut'
    make_select_view_cutscene_line text = 'BO_SmallEvent_Billboard' name = 'cutscenes\BO_SmallEvent_Billboard.cut'
    make_select_view_cutscene_line text = 'BA_LevelEvent' name = 'cutscenes\BA_LevelEvent.cut'
    make_select_view_cutscene_line text = 'BA_SmallEvent_Billboard' name = 'cutscenes\BA_SmallEvent_Billboard.cut'
    make_select_view_cutscene_line text = 'BE_LevelEvent' name = 'cutscenes\BE_LevelEvent.cut'
    make_select_view_cutscene_line text = 'BE_SmallEvent_Billboard' name = 'cutscenes\BE_SmallEvent_Billboard.cut'
    make_select_view_cutscene_line text = 'AU_LevelEvent1' name = 'cutscenes\AU_LevelEvent1.cut'
    make_select_view_cutscene_line text = 'AU_LevelEvent2' name = 'cutscenes\AU_LevelEvent2.cut'
    make_select_view_cutscene_line text = 'AU_SmallEvent_Billboard' name = 'cutscenes\AU_SmallEvent_Billboard.cut'
    make_select_view_cutscene_line text = 'NO_LevelEvent1' name = 'cutscenes\NO_LevelEvent1.cut'
    make_select_view_cutscene_line text = 'NO_LevelEvent2' name = 'cutscenes\NO_LevelEvent2.cut'
    make_select_view_cutscene_line text = 'NO_SmallEvent_Billboard' name = 'cutscenes\NO_SmallEvent_Billboard.cut'
    make_select_view_cutscene_line text = 'ST_LevelEvent' name = 'cutscenes\ST_LevelEvent.cut'
    make_select_view_cutscene_line text = 'ST_SmallEvent_Billboard' name = 'cutscenes\ST_SmallEvent_Billboard.cut'
    make_select_view_cutscene_line text = 'SE_LevelEvent' name = 'cutscenes\SE_LevelEvent.cut'
    make_select_view_cutscene_line text = 'SE_SmallEvent_SpaceShip' name = 'cutscenes\SE_SmallEvent_SpaceShip.cut'
    make_select_view_cutscene_line text = 'SE_SmallEvent_Satan' name = 'cutscenes\SE_SmallEvent_Satan.cut'
    make_select_view_cutscene_line text = 'SE2_LevelEvent' name = 'cutscenes\SE2_LevelEvent.cut'
    make_text_sub_menu_item text = 'XXXXXXX TESTS XXXXXXX'
    make_select_view_cutscene_line text = 'TEST' name = 'cutscenes\Test.cut'
    make_select_view_cutscene_line text = 'TEST_SkinModel' name = 'cutscenes\Test_SkinModel.cut'
    make_select_view_cutscene_line text = 'TEST_MovingParticles' name = 'cutscenes\Test_MovingParticles.cut'
    make_select_view_cutscene_line text = 'TEST_Character' name = 'cutscenes\Test_Character.cut'
    make_select_view_cutscene_line text = 'TEST_Character_Face' name = 'cutscenes\Test_Character_Face.cut'
    make_select_view_cutscene_line text = 'TEST_2Characters' name = 'cutscenes\Test_2Characters.cut'
    make_text_sub_menu_item text = 'XXXXXXXX END XXXXXXXX'
    if NOT (DEMO_BUILD)
    endif
    theme_menu_add_item centered = 1 text = 'Done' id = menu_exit pad_choose_script = create_pause_menu last_menu_item = 1
endscript


script TR_1b_begin 
    if LevelIs load_tr
        if IsAlive name = Wh_TB_Cut_FireGlow_01
            Kill name = Wh_TB_Cut_FireGlow_01
        endif
        FakeLights percent = 0 prefix = 'TRG_TR_Level_Light' time = 0
        FakeLights percent = 0 id = TRG_TR_Level_Lightcut_57 time = 0
    endif
endscript


script TR_1b_end 
    if LevelIs load_tr
        Create name = Wh_TB_Cut_FireGlow_01
        
        SpawnScript TR_Restore_FakeLights
    endif
endscript


script TR_Restore_FakeLights 
    wait 1 frame
    FakeLights percent = 100 prefix = 'TRG_TR_Level_Light' time = 0
endscript


script TR_1c_begin 
    if LevelIs load_tr
        FakeLights percent = 0 prefix = 'TRG_TR_Level_Light' time = 0
    endif
endscript


script TR_1c_end 
    if LevelIs load_tr
        SpawnScript TR_Restore_FakeLights
    endif
endscript


script BO_2A_begin 
    if LevelIs load_bo
        if IsAlive prefix = 'BO_tz_Boat'
            Kill prefix = 'BO_tz_Boat'
        endif
        if IsAlive prefix = 'BO_TB_Boat'
            Kill prefix = 'BO_TB_Boat'
        endif
        if IsAlive prefix = 'BO_Boat'
            Kill prefix = 'BO_Boat'
        endif
        if IsAlive prefix = 'BO_Barrel'
            Kill prefix = 'BO_Barrel'
        endif
        if IsAlive name = BO_TeaPartyLadder
            Kill name = BO_TeaPartyLadder
        endif
        if IsAlive name = BO_TeaParty_CrowsNest
            Kill name = BO_TeaParty_CrowsNest
        endif
        if IsAlive name = JG_BO_BoatLights
            Kill name = JG_BO_BoatLights
        endif
        if IsAlive name = BO_tz_boat_acces
            Kill name = BO_tz_boat_acces
        endif
        if IsAlive name = NightOn_03_BO_TZ_Boat_Body_Curtains01
            Kill name = NightOn_03_BO_TZ_Boat_Body_Curtains01
        endif
        if IsAlive name = NightOff_03_BO_TZ_Boat_Body_Curtains
            Kill name = NightOff_03_BO_TZ_Boat_Body_Curtains
        endif
        if IsAlive name = BO_BarrierQP02
            Kill name = BO_BarrierQP02
        endif
        if IsAlive name = BO_ShatterMast
            Kill name = BO_ShatterMast
        endif
        if IsAlive name = BO_BoatMast_Lights
            Kill name = BO_BoatMast_Lights
        endif
    endif
endscript


script BO_2A_end 
    if LevelIs load_bo
        Create prefix = 'BO_tz_Boat'
        Create prefix = 'BO_TB_Boat'
        Create prefix = 'BO_Barrel'
        Create prefix = 'BO_Boat'
        Create name = BO_TeaPartyLadder
        Create name = BO_TeaParty_CrowsNest
        Create name = JG_BO_BoatLights
        Create name = BO_tz_boat_acces
        Create name = NightOn_03_BO_TZ_Boat_Body_Curtains01
        Create name = NightOff_03_BO_TZ_Boat_Body_Curtains
        Create name = BO_BarrierQP02
        Create name = BO_ShatterMast
        Create name = BO_BoatMast_Lights
    endif
endscript


script BO_LevelEvent_begin 
    if LevelIs load_bo
        if IsAlive prefix = 'BO_VentHouse'
            Kill prefix = 'BO_VentHouse'
        endif
        if IsAlive name = CANNON_VentHouse
            Kill name = CANNON_VentHouse
        endif
        if IsAlive name = BO_Cannon01
            Kill name = BO_Cannon01
        endif
        if IsAlive name = BO_Cannon02
            Kill name = BO_Cannon02
        endif
        if IsAlive name = BO_ConstFence08
            Kill name = BO_ConstFence08
        endif
        if IsAlive name = BO_ConstFence09
            Kill name = BO_ConstFence09
        endif
        if IsAlive name = BO_ConstFence10
            Kill name = BO_ConstFence10
        endif
        if IsAlive name = TRG_Rail_Normal01
            Kill name = TRG_Rail_Normal01
        endif
        if IsAlive name = JG_BD_SideMiscBefore
            Kill name = JG_BD_SideMiscBefore
        endif
        if IsAlive name = JG_BD_WoodStacks
            Kill name = JG_BD_WoodStacks
        endif
        if IsAlive prefix = 'NORMAL_Girder'
            Kill prefix = 'NORMAL_Girder'
        endif
        if IsAlive prefix = 'CANNON_SmokeA'
            Kill prefix = 'CANNON_SmokeA'
        endif
        if IsAlive prefix = 'CANNON_SmokeB'
            Kill prefix = 'CANNON_SmokeB'
        endif
        if IsAlive prefix = 'CANNON_SmokeC'
            Kill prefix = 'CANNON_SmokeC'
        endif
        if IsAlive prefix = 'CANNON_SmokeD'
            Kill prefix = 'CANNON_SmokeD'
        endif
        if IsAlive prefix = 'CANNON_FireA'
            Kill prefix = 'CANNON_FireA'
        endif
        if IsAlive name = ParticleBox_Smoke01A
            Kill name = ParticleBox_Smoke01A
        endif
        if IsAlive name = ParticleBox_Smoke02A
            Kill name = ParticleBox_Smoke02A
        endif
    endif
endscript


script BO_LevelEvent_end 
    if LevelIs load_bo
        Create name = BO_Cannon01
        Create name = BO_Cannon02
        BO_Cannon_Event_Out
    endif
endscript


script BO_SmallEvent_Billboard_begin 
    if LevelIs load_bo
        if IsAlive name = BO_AS_MasterPiece_final01
            Kill name = BO_AS_MasterPiece_final01
        endif
    endif
endscript


script BO_SmallEvent_Billboard_end 
    if LevelIs load_bo
        if NOT IsAlive name = BO_AS_MasterPiece_final01
            Create name = BO_AS_MasterPiece_final01
        endif
        if IsAlive name = BO_AS_MasterPiece_part01
            
        endif
        Kill prefix = 'BO_AS_MasterPiece_part'
    endif
endscript


script BA_LevelEvent_begin 
    if LevelIs load_ba
        if IsAlive name = BA_Bull_Truck
            Kill name = BA_Bull_Truck
        endif
        if IsAlive prefix = 'BA_BullBefore'
            Kill prefix = 'BA_BullBefore'
        endif
    endif
    if NOT ((BA_BRIDGE_STATE = passable)|| (GoalManager_HasWonGoal name = BA_Goal_Gaps2))
        forced_create prefix = 'TRG_BA_Bridge_Impassable_Tram'
    endif
endscript


script BA_LevelEvent_end 
    if LevelIs load_ba
        BA_Event_BullAfter
        Kill prefix = 'TRG_BA_Bridge_Impassable_Tram05'
        forced_create name = BA_Bull_Truck
    endif
endscript


script BA_SmallEvent_Billboard_begin 
    if LevelIs load_ba
        if IsAlive name = BA_AS_MasterPiece_final01
            Kill name = BA_AS_MasterPiece_final01
        endif
    endif
endscript


script BA_SmallEvent_Billboard_end 
    if LevelIs load_ba
        if NOT IsAlive name = BA_AS_MasterPiece_final01
            Create name = BA_AS_MasterPiece_final01
        endif
        Kill prefix = 'BA_AS_MasterPiece_part'
    endif
endscript


script BE_LevelEvent_begin 
    if LevelIs load_be
        if IsAlive name = g_train_sign_lip03
            Kill name = g_train_sign_lip03
        endif
        if IsAlive name = g_Tunnel_lightpole01
            Kill name = g_Tunnel_lightpole01
        endif
        if IsAlive name = g_event_After_13
            Kill name = g_event_After_13
        endif
        if IsAlive name = g_event_After_14
            Kill name = g_event_After_14
        endif
        if IsAlive name = g_event_After_15
            Kill name = g_event_After_15
        endif
        if IsAlive name = g_event_After_18
            Kill name = g_event_After_18
        endif
        if IsAlive name = g_event_After_20
            Kill name = g_event_After_20
        endif
        if IsAlive name = g_event_Before03
            Kill name = g_event_Before03
        endif
        if IsAlive name = g_event_Before06
            Kill name = g_event_Before06
        endif
        if IsAlive name = g_event_Before08
            Kill name = g_event_Before08
        endif
        if IsAlive name = g_pub_shadow_03
            Kill name = g_pub_shadow_03
        endif
        if IsAlive name = g_pub_sign_01_shadow
            Kill name = g_pub_sign_01_shadow
        endif
        if IsAlive name = g_pub_sign_02_shadow
            Kill name = g_pub_sign_02_shadow
        endif
        if NOT IsAlive name = g_destroyed_int_pub_01
            Create name = g_destroyed_int_pub_01
        endif
        if IsAlive name = NightOn_05_g_train_sign_light
            
            Kill name = NightOn_05_g_train_sign_light
            Kill name = NightOn_05_g_train_sign_light_01
            Kill name = NightOn_05_g_train_sign_light_02
            Kill name = NightOn_05_g_train_sign_light_03
            TODManager_MarkPermanentlyDead name = NightOn_05_g_train_sign_light
            TODManager_MarkPermanentlyDead name = NightOn_05_g_train_sign_light_01
            TODManager_MarkPermanentlyDead name = NightOn_05_g_train_sign_light_02
            TODManager_MarkPermanentlyDead name = NightOn_05_g_train_sign_light_03
        endif
    endif
endscript


script BE_LevelEvent_end 
    if LevelIs load_be
        BE_Train_Event_out
        if IsAlive name = g_pub_bier_sign_01
            Kill name = g_pub_bier_sign_01
        endif
    endif
endscript


script BE_SmallEvent_Billboard_begin 
    if LevelIs load_be
        if IsAlive name = BE_AS_MasterPiece_final01
            Kill name = BE_AS_MasterPiece_final01
        endif
    endif
endscript


script BE_SmallEvent_Billboard_end 
    if LevelIs load_be
        BE_Goal_Gaps12_Geo
        Kill prefix = 'BE_AS_MasterPiece_part'
    endif
endscript


script BE_4A_begin 
    if LevelIs load_be
        if IsAlive name = g_phil_qp09
            Kill name = g_phil_qp09
        endif
        if IsAlive name = g_phil_BulbShatter01
            Kill name = g_phil_BulbShatter01
        endif
        if IsAlive name = g_phil_BulbShatter02
            Kill name = g_phil_BulbShatter02
        endif
    endif
endscript


script BE_4A_end 
    if LevelIs load_be
        if NOT IsAlive name = g_phil_qp09
            Create name = g_phil_qp09
        endif
        if NOT IsAlive name = g_phil_BulbShatter01
            Create name = g_phil_BulbShatter01
        endif
        if NOT IsAlive name = g_phil_BulbShatter02
            Create name = g_phil_BulbShatter02
        endif
    endif
endscript


script AU_5_begin 
endscript


script AU_5_end 
    clear_temporary_nude_appearance
endscript


script set_temporary_nude_appearance 
    GetCurrentSkaterProfileIndex
    RememberTemporaryAppearance player = <currentSkaterProfileIndex> name = au_5_temp_profile nofacetexture
    GetSkaterProfileInfo player = <currentSkaterProfileIndex>
    if (<is_male> = 1)
        check_for_non_standard_parts player = <currentSkaterProfileIndex> part = skater_m_torso
        if (<clear_ok>)
            EditPlayerAppearance profile = <currentSkaterProfile> target = clearpart targetParams = { part = skater_m_torso }
            EditPlayerAppearance profile = <currentSkaterProfile> target = setpart targetParams = {part = bare_torso desc_id = #"bare torso"}
        endif
        check_for_non_standard_parts player = <currentSkaterProfileIndex> part = skater_m_legs
        if (<clear_ok>)
            EditPlayerAppearance profile = <currentSkaterProfile> target = setpart targetParams = {part = skater_m_legs desc_id = Briefs}
        endif
        check_for_non_standard_parts player = <currentSkaterProfileIndex> part = skater_m_hands
        if (<clear_ok>)
            EditPlayerAppearance profile = <currentSkaterProfile> target = setpart targetParams = {part = skater_m_hands desc_id = Hands}
        endif
        EditPlayerAppearance profile = <currentSkaterProfile> target = setpart targetParams = {part = skater_m_backpack desc_id = None}
    else
        EditPlayerAppearance profile = <currentSkaterProfile> target = setpart targetParams = {part = skater_f_torso desc_id = None}
        EditPlayerAppearance profile = <currentSkaterProfile> target = setpart targetParams = {part = skater_f_legs desc_id = None}
        check_for_non_standard_parts player = <currentSkaterProfileIndex> part = skater_f_hands
        if (<clear_ok>)
            EditPlayerAppearance profile = <currentSkaterProfile> target = setpart targetParams = {part = skater_f_hands desc_id = Hands}
        endif
        EditPlayerAppearance profile = <currentSkaterProfile> target = setpart targetParams = {part = skater_f_backpack desc_id = None}
    endif
    EditPlayerAppearance profile = <currentSkaterProfile> target = setpart targetParams = {part = sleeves desc_id = None}
    check_for_non_standard_parts player = <currentSkaterProfileIndex> part = skater_m_legs
    if (<clear_ok>)
        EditPlayerAppearance profile = <currentSkaterProfile> target = setpart targetParams = {part = shoes desc_id = BareFeet}
    endif
    EditPlayerAppearance profile = <currentSkaterProfile> target = clearpart targetParams = { part = socks }
    EditPlayerAppearance profile = <currentSkaterProfile> target = clearpart targetParams = { part = socks_lower }
    EditPlayerAppearance profile = <currentSkaterProfile> target = clearpart targetParams = { part = kneepads }
    EditPlayerAppearance profile = <currentSkaterProfile> target = clearpart targetParams = { part = elbowpads }
    check_for_non_standard_parts player = <currentSkaterProfileIndex> part = accessory1 side = left
    if (<clear_ok>)
        EditPlayerAppearance profile = <currentSkaterProfile> target = clearpart targetParams = { part = accessory1 }
    endif
    check_for_non_standard_parts player = <currentSkaterProfileIndex> part = accessory2 side = RIGHT
    if (<clear_ok>)
        EditPlayerAppearance profile = <currentSkaterProfile> target = clearpart targetParams = { part = accessory2 }
    endif
    refresh_skater_model
endscript


script clear_temporary_nude_appearance 
    GetCurrentSkaterProfileIndex
    RestoreTemporaryAppearance player = <currentSkaterProfileIndex> name = au_5_temp_profile nofacetexture
    refresh_skater_model
endscript


script AU_LevelEvent1_begin 
    if LevelIs load_au
        if IsAlive name = NightOff_01_Street_lamp_06
            Kill name = NightOff_01_Street_lamp_06
        endif
        if IsAlive name = NightOn_01_Street_lamp_03_Globe01
            Kill name = NightOn_01_Street_lamp_03_Globe01
        endif
        if IsAlive name = NightOn_01_Street_lamp_06
            Kill name = NightOn_01_Street_lamp_06
        endif
        if IsAlive name = NightOff_01_Street_lamp_03_Globe
            Kill name = NightOff_01_Street_lamp_03_Globe
        endif
        if IsAlive name = Geo_Street_Hydrant01
            Kill name = Geo_Street_Hydrant01
        endif
        if IsAlive name = Geo_Street_Hydrant01_Bolt
            Kill name = Geo_Street_Hydrant01_Bolt
        endif
        if IsAlive name = Geo_PreEvent_A_Wall01
            Kill name = Geo_PreEvent_A_Wall01
        endif
        if IsAlive name = Geo_PreEvent_A_Wall02
            Kill name = Geo_PreEvent_A_Wall02
        endif
    endif
endscript


script AU_LevelEvent1_end 
    if LevelIs load_au
        AU_Event_A_Out
    endif
endscript


script AU_LevelEvent2_begin 
    if LevelIs load_au
        if IsAlive prefix = 'Geo_PostEvent_B'
            Kill prefix = 'Geo_PostEvent_B'
        endif
        if IsAlive name = Geo_PreEvent_B_Stairs01
            Kill name = Geo_PreEvent_B_Stairs01
        endif
    endif
endscript


script AU_LevelEvent2_end 
    if LevelIs load_au
        AU_Event_B_Out
    endif
endscript


script AU_SmallEvent_Billboard_begin 
    if LevelIs load_au
        if IsAlive name = AU_AS_MasterPiece_final01
            Kill name = AU_AS_MasterPiece_final01
        endif
    endif
endscript


script AU_SmallEvent_Billboard_end 
    if LevelIs load_au
        if NOT IsAlive name = AU_AS_MasterPiece_final01
            Create name = AU_AS_MasterPiece_final01
        endif
        Kill prefix = 'AU_AS_MasterPiece_part'
    endif
endscript


script AU_6_begin 
    if LevelIs load_au
        if IsAlive name = NBP_LowRV
            Kill name = NBP_LowRV
        endif
    endif
endscript


script NO_LevelEvent1_begin 
    if LevelIs load_NO
        TODManager_SetTODInstant Evening
        if NOT IsAlive name = g_vortex_cone
            Create name = g_vortex_cone
        endif
        if NOT IsAlive name = G_grv_event_bowl
            Create name = G_grv_event_bowl
        endif
        if IsAlive name = G_grv_event_dome
            Kill name = G_grv_event_dome
            Kill name = g_grv_dome_invis
            Kill name = g_funkhole_cover
        endif
        if IsAlive name = g_vortex_base
            Kill name = g_vortex_base
        endif
        if IsAlive name = g_vortex_base01
            Kill name = g_vortex_base01
        endif
    endif
endscript


script NO_LevelEvent1_BloomFlash holdtime = 0.2000 restoreTime = 0.5000 stepTime = 0.05000 minColor = 0 bloom1 = 50 bloom2 = 100 maxStrength = 255
    SetScreenEffectsOn
    newColor = [ 0 0 0 ]
    CastToInteger minColor
    SetArrayElement arrayName = newColor index = 0 newValue = <minColor>
    SetArrayElement arrayName = newColor index = 1 newValue = <minColor>
    SetArrayElement arrayName = newColor index = 2 newValue = <minColor>
    newStrength = [ 255 255 255 ]
    CastToInteger maxStrength
    SetArrayElement arrayName = newStrength index = 0 newValue = <maxStrength>
    SetArrayElement arrayName = newStrength index = 1 newValue = <maxStrength>
    SetArrayElement arrayName = newStrength index = 2 newValue = <maxStrength>
    maxStrength = (<maxStrength> + 0.0)
    TODManager_SetTempBloomParams on = 1 color = <newColor> bloom1 = <bloom1> bloom2 = <bloom2> strength = <newStrength>
    wait <holdtime> seconds
    restoreTime = (<restoreTime> + 0.0)
    numsteps = (<restoreTime> / <stepTime>)
    stepSize = (<maxStrength> / <numsteps>)
    time = 1
    begin 
    val = (<maxStrength> - (<time> * <stepSize>))
    CastToInteger val
    if (<val> < 0)
        <val> = 0
    endif
    SetArrayElement arrayName = newStrength index = 0 newValue = <val>
    SetArrayElement arrayName = newStrength index = 1 newValue = <val>
    SetArrayElement arrayName = newStrength index = 2 newValue = <val>
    TODManager_SetTempBloomParams on = 1 color = <newColor> bloom1 = <bloom1> bloom2 = <bloom2> strength = <newStrength>
    <time> = (<time> + 1)
    wait <stepTime> seconds
    if (<time> > <numsteps>)
        break 
    endif
    repeat 
    TODManager_SetTempBloomParams on = 0
endscript


script NO_LevelEvent1_end 
    if LevelIs load_NO
        Kill prefix = 'trg_zomb_ped_'
        NO_voodoo_vortex
    endif
    KillSpawnedScript name = NO_LevelEvent1_BloomFlash
endscript


script NO_SmallEvent_Billboard_begin 
    if LevelIs load_NO
        if IsAlive name = NO_AS_MasterPiece_final01
            Kill name = NO_AS_MasterPiece_final01
        endif
    endif
endscript


script NO_SmallEvent_Billboard_end 
    if LevelIs load_NO
        if NOT IsAlive name = NO_AS_MasterPiece_final01
            Create name = NO_AS_MasterPiece_final01
        endif
        Kill prefix = 'NO_AS_MasterPiece_part'
    endif
endscript


script NO_8_begin 
    if LevelIs load_NO
        if IsAlive name = g_grv_sign_lightglo02
            Kill name = g_grv_sign_lightglo02
        endif
        if IsAlive name = g_grv_sign_lightglo01
            Kill name = g_grv_sign_lightglo01
        endif
    endif
endscript


script NO_8_end 
    if LevelIs load_NO
        if NOT IsAlive name = g_grv_sign_lightglo02
            Create name = g_grv_sign_lightglo02
        endif
        if NOT IsAlive name = g_grv_sign_lightglo01
            Create name = g_grv_sign_lightglo01
        endif
    endif
endscript


script ST_SmallEvent_Billboard_begin 
    if LevelIs load_st
        if IsAlive name = ST_AS_MasterPiece_final01
            Kill name = ST_AS_MasterPiece_final01
        endif
    endif
endscript


script ST_SmallEvent_Billboard_end 
    if LevelIs load_st
        if NOT IsAlive name = ST_AS_MasterPiece_final01
            Create name = ST_AS_MasterPiece_final01
        endif
        Kill prefix = 'ST_AS_MasterPiece_part'
    endif
endscript


script SE_LevelEvent_begin 
    if LevelIs load_se
        if IsAlive name = GEO_PreEvent_Boulder_Temple_BoulderGlow_01
            Kill name = GEO_PreEvent_Boulder_Temple_BoulderGlow_01
        endif
        if IsAlive name = CG_0530_544
            Kill name = CG_0530_544
        endif
    endif
endscript


script SE_LevelEvent_end 
    if LevelIs load_se
        if NOT IsAlive name = GEO_PreEvent_Boulder_Temple_BoulderGlow_01
            Create name = GEO_PreEvent_Boulder_Temple_BoulderGlow_01
        endif
        if NOT IsAlive name = CG_0530_544
            Create name = CG_0530_544
        endif
    endif
endscript


script SE_SmallEvent_SpaceShip_begin 
    if LevelIs load_se
        AllowBoneLOD allow = 0
        if IsAlive name = GEO_PreEvent_Spaceship_SpacePort_HangarDoorClosed_Top
            Kill name = GEO_PreEvent_Spaceship_SpacePort_HangarDoorClosed_Top
        endif
        if IsAlive name = GEO_PreEvent_Spaceship_SpacePort_HangarDoorClosed_Bottom
            Kill name = GEO_PreEvent_Spaceship_SpacePort_HangarDoorClosed_Bottom
        endif
        if IsAlive name = GEO_PreEvent_Spaceship_Engine_01
            Kill name = GEO_PreEvent_Spaceship_Engine_01
        endif
        if IsAlive name = GEO_PreEvent_Spaceship_Engine_02
            Kill name = GEO_PreEvent_Spaceship_Engine_02
        endif
        if IsAlive name = TRG_PreEvent_Spaceship_EngineSmoke_01_Start
            Kill name = TRG_PreEvent_Spaceship_EngineSmoke_01_Start
        endif
        if IsAlive name = TRG_PreEvent_Spaceship_EngineSmoke_02_Start
            Kill name = TRG_PreEvent_Spaceship_EngineSmoke_02_Start
        endif
        DestroyFastParticleSystem name = SP_shiphover
        DestroyFastParticleSystem name = thrusterR1 attachobjid = GEO_PreEvent_SpaceShip_Ship_01
        DestroyFastParticleSystem name = thrusterL1 attachobjid = GEO_PreEvent_SpaceShip_Ship_01
        DestroyFastParticleSystem name = thrusterR2 attachobjid = GEO_PreEvent_SpaceShip_Ship_01
        DestroyFastParticleSystem name = thrusterL2 attachobjid = GEO_PreEvent_SpaceShip_Ship_01
    endif
endscript


script SE_SpaceShip_BloomFlash holdtime = 0.2000 restoreTime = 0.5000 stepTime = 0.05000 minColor = 0 bloom1 = 50 bloom2 = 100 maxStrength = 255
    SetScreenEffectsOn
    newColor = [ 0 0 0 ]
    CastToInteger minColor
    SetArrayElement arrayName = newColor index = 0 newValue = <minColor>
    SetArrayElement arrayName = newColor index = 1 newValue = <minColor>
    SetArrayElement arrayName = newColor index = 2 newValue = <minColor>
    newStrength = [ 255 255 255 ]
    CastToInteger maxStrength
    SetArrayElement arrayName = newStrength index = 0 newValue = <maxStrength>
    SetArrayElement arrayName = newStrength index = 1 newValue = <maxStrength>
    SetArrayElement arrayName = newStrength index = 2 newValue = <maxStrength>
    maxStrength = (<maxStrength> + 0.0)
    TODManager_SetTempBloomParams on = 1 color = <newColor> bloom1 = <bloom1> bloom2 = <bloom2> strength = <newStrength>
    wait <holdtime> seconds
    restoreTime = (<restoreTime> + 0.0)
    numsteps = (<restoreTime> / <stepTime>)
    stepSize = (<maxStrength> / <numsteps>)
    time = 1
    begin 
    val = (<maxStrength> - (<time> * <stepSize>))
    CastToInteger val
    if (<val> < 0)
        <val> = 0
    endif
    SetArrayElement arrayName = newStrength index = 0 newValue = <val>
    SetArrayElement arrayName = newStrength index = 1 newValue = <val>
    SetArrayElement arrayName = newStrength index = 2 newValue = <val>
    TODManager_SetTempBloomParams on = 1 color = <newColor> bloom1 = <bloom1> bloom2 = <bloom2> strength = <newStrength>
    <time> = (<time> + 1)
    wait <stepTime> seconds
    if (<time> > <numsteps>)
        break 
    endif
    repeat 
    TODManager_SetTempBloomParams on = 0
endscript


script SE_SmallEvent_Satan_begin 
    if LevelIs load_se
        if IsAlive name = GEO_PreEvent_Rib_Mouth
            Kill name = GEO_PreEvent_Rib_Mouth
        endif
        if IsAlive name = GEO_PostEvent_Rib_Mouth
            Kill name = GEO_PostEvent_Rib_Mouth
        endif
        if IsAlive name = GEO_PostEvent_Rib_Tongue
            Kill name = GEO_PostEvent_Rib_Tongue
        endif
        if IsAlive name = GEO_PreEvent_Rib_LoungeQP_001
            Kill name = GEO_PreEvent_Rib_LoungeQP_001
        endif
        if IsAlive name = JG_0602_41
            Kill name = JG_0602_41
        endif
    endif
endscript


script SE_SmallEvent_Satan_end 
    if LevelIs load_se
        if NOT IsAlive name = JG_0602_41
            Create name = JG_0602_41
        endif
        if NOT IsAlive name = GEO_PostEvent_Rib_Mouth
            Create name = GEO_PostEvent_Rib_Mouth
        endif
        if NOT IsAlive name = GEO_PostEvent_Rib_Tongue
            Create name = GEO_PostEvent_Rib_Tongue
        endif
    endif
endscript


script SE2_LevelEvent_begin 
    if LevelIs load_se2
        if IsAlive name = missle01
            Kill name = missle01
        endif
        if IsAlive name = missle02
            Kill name = missle02
        endif
        if IsAlive name = missle03
            Kill name = missle03
        endif
    endif
endscript


script SE2_LevelEvent_end 
    if LevelIs load_se2
        SE2_Missile_Event_Out
    endif
endscript


script Sk_9_begin 
    if LevelIs load_st
        if IsAlive name = g_periph_frontlogs_cut
            Kill name = g_periph_frontlogs_cut
        endif
        if NOT IsAlive name = apm_fireridge01
            Create name = apm_fireridge01
        endif
        if IsAlive name = g_endgoal_lowrv
            Kill name = g_endgoal_lowrv
        endif
        if IsAlive name = TRG_Ped_Escape_Bam
            Kill name = TRG_Ped_Escape_Bam
        endif
    endif
endscript


script Sk_9_end 
    if LevelIs load_st
        if NOT IsAlive name = g_periph_frontlogs_cut
            Create name = g_periph_frontlogs_cut
        endif
        if IsAlive name = apm_fireridge01
            Kill name = apm_fireridge01
        endif
    endif
endscript


script launch_view_cutscenes_menu 
    RunScriptOnScreenElement id = current_menu_anchor animate_out callback = create_view_cutscenes_menu callback_params = { <...>  }
endscript


script make_select_view_cutscene_line 
    make_text_sub_menu_item text = <text> pad_choose_script = view_cutscene pad_choose_params = <...> 
endscript


script create_view_cutscenes_menu 
    make_new_menu menu_id = view_cutscenes_menu vmenu_id = view_cutscenes_vmenu menu_title = 'CUTSCENES' type = vscrollingmenu dims = (320.0, 200.0)
    SetScreenElementProps {id = view_cutscenes_menu event_handlers = [
            { pad_back create_test_menu }
        ]
    }
    add_view_cutscenes_to_menu <...> 
    RunScriptOnScreenElement id = current_menu_anchor animate_in
endscript


script view_cutscene 
    UnPauseGame
    PauseMusic 0
    PlayCutscene <...> exitscript = view_cutscene_done
    RunScriptOnScreenElement id = current_menu_anchor menu_offscreen
endscript


script view_cutscene_done 
    pausegame
    PauseMusic 1
    create_view_cutscenes_menu
endscript

