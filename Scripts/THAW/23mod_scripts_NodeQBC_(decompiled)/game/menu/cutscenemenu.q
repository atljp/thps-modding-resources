
script unlock_all_cutscenes 
endscript

script cutscene_scale_object scale_obj = skater startscale = 1 endscale = 1 sframes = 0
    endscale = (<endscale> * 1000)
    printstruct <...> 
    if (<sframes> = 0)
        printf 'Time = 0'
        <scale_obj> ::obj_applyscaling endscale = (<endscale> / 1000.0)
    else
        printstruct <...> 
        printf 'over time'
        startscale = (<startscale> * 1000)
        <scale_obj> ::obj_applyscaling Scale = (<startscale> / 1000.0)
        begin 
        startscale = (<startscale> + ((<endscale> - <startscale>)/ <sframes>))
        printf '%s' s = (<startscale> / 1000.0)
        <scale_obj> ::obj_applyscaling Scale = (<startscale> / 1000.0)
        wait 1 gameframes
        repeat <sframes>
    endif
endscript

script add_view_cutscenes_to_menu 
    make_text_sub_menu_item text = 'XXXXXX CINEMATICS XXXXXX'
    make_select_view_cutscene_line text = 'HO_1A - Pocz¹tek' name = 'cutscenes\HO_1A.cut'
    make_select_view_cutscene_line text = 'HO_1B - The Bus Ride' name = 'cutscenes\HO_1B.cut'
    make_select_view_cutscene_line text = 'HO_1C - You Have Arrived' name = 'cutscenes\HO_1C.cut'
    make_select_view_cutscene_line text = 'HO_2 - Nowy Ty' name = 'cutscenes\HO_2.cut'
    make_select_view_cutscene_line text = 'HO_3 - Sketchy Mc Sketch' name = 'cutscenes\HO_3.cut'
    make_select_view_cutscene_line text = 'BH_4 - Pozwól wejæ' name = 'cutscenes\BH_4.cut'
    make_select_view_cutscene_line text = 'SR_5 - Wprowadzenie do Iggy' name = 'cutscenes\SR_5.cut'
    make_select_view_cutscene_line text = 'SR_6a - Zbuduj rampê' name = 'cutscenes\SR_6a.cut'
    make_select_view_cutscene_line text = 'SR_6 - Wyrampuj to' name = 'cutscenes\SR_6.cut'
    make_select_view_cutscene_line text = 'VP_7 - Tony Hawk' name = 'cutscenes\VP_7.cut'
    make_select_view_cutscene_line text = 'SR_8 - Incarciration' name = 'cutscenes\SR_8.cut'
    make_select_view_cutscene_line text = 'SM_9 - Os-ta-tecz-nie' name = 'cutscenes\SM_9.cut'
    make_select_view_cutscene_line text = 'OR_10A - Megga' name = 'cutscenes\OR_10A.cut'
    make_select_view_cutscene_line text = 'HO_10B - Wiêzienna mi³oæ' name = 'cutscenes\HO_10B.cut'
    make_select_view_cutscene_line text = 'BH_11a - Sza³ medialny' name = 'cutscenes\BH_11a.cut'
    make_select_view_cutscene_line text = 'BH_11 - W³aciciel ziemi' name = 'cutscenes\BH_11.cut'
    make_select_view_cutscene_line text = 'EL_12 - Stwórz film' name = 'cutscenes\EL_12.cut'
    make_select_view_cutscene_line text = 'SR_13a - Koniec, czêæ 1' name = 'cutscenes\SR_13a.cut'
    make_select_view_cutscene_line text = 'SR_13 - Koniec' name = 'cutscenes\SR_13.cut'
    make_text_sub_menu_item text = 'XXXXX LEVEL EVENTS XXXXX'
    make_select_view_cutscene_line text = 'HO_LevelEvent_Dino' name = 'cutscenes\HO_LevelEvent_Dino.cut'
    make_select_view_cutscene_line text = 'HO_LevelEvent_Rocket' name = 'cutscenes\HO_LevelEvent_Rocket.cut'
    make_select_view_cutscene_line text = 'DT_LevelEvent_Freeway' name = 'cutscenes\DT_LevelEvent_Freeway.cut'
    make_select_view_cutscene_line text = 'BH_LevelEvent' name = 'cutscenes\BH_LevelEvent.cut'
    make_select_view_cutscene_line text = 'BH_SmallEvent' name = 'cutscenes\BH_SmallEvent.cut'
    make_select_view_cutscene_line text = 'EL_LevelEvent' name = 'cutscenes\EL_LevelEvent.cut'
    make_select_view_cutscene_line text = 'SM_LevelEvent' name = 'cutscenes\SM_LevelEvent.cut'
    make_select_view_cutscene_line text = 'SR_LevelEvent' name = 'cutscenes\SR_LevelEvent.cut'
    make_text_sub_menu_item text = 'XXXXXXX TESTS XXXXXXX'
    make_select_view_cutscene_line text = 'TEST_Fade' name = 'cutscenes\Test_Fade.cut'
    make_select_view_cutscene_line text = 'TEST_Skin' name = 'cutscenes\Test_Skin.cut'
    make_select_view_cutscene_line text = 'TEST_MovingParticles' name = 'cutscenes\Test_MovingParticles.cut'
    make_select_view_cutscene_line text = 'TEST_Pedestrain' name = 'cutscenes\Test_Pedestrian.cut'
    make_select_view_cutscene_line text = 'TEST_Light' name = 'cutscenes\Test_Light.cut'
    make_select_view_cutscene_line text = 'TEST_Character_Face' name = 'cutscenes\Test_Character_Face.cut'
    make_select_view_cutscene_line text = 'TEST_Character' name = 'cutscenes\Test_Character.cut'
    make_select_view_cutscene_line text = 'TEST' name = 'cutscenes\Test.cut'
    make_text_sub_menu_item text = 'XXXXXXXX END XXXXXXXX'
    if NOT (DEMO_BUILD)
    endif
    theme_menu_add_item centered = 1 text = 'Zrobione' id = menu_exit pad_choose_script = create_pause_menu last_menu_item = 1
endscript

script HO_1A_begin 
    PushShadowVolumeDrawPriority \{ priority = 0.0 }
    cutscene_set_temp_tod \{bloom_on = 0 bloom1 = 5 bloom2 = 40 bloom_strength = [ 105 95 75 ] bloom_color = [ 120 120 120 ]}
endscript

script HO_1A_end 
    PopShadowVolumeDrawPriority
endscript

script HO_1B_begin 
    PushShadowVolumeDrawPriority \{ priority = 0.0 }
    cutscene_set_temp_tod \{bloom_on = 0 bloom1 = 5 bloom2 = 40 bloom_strength = [ 105 95 75 ] bloom_color = [ 120 120 120 ]}
endscript

script HO_1B_end 
    PopShadowVolumeDrawPriority
endscript

script HO_1C_begin 
    PushShadowVolumeDrawPriority \{ priority = 0.0 }
    cutscene_set_temp_tod \{bloom_on = 0 bloom1 = 5 bloom2 = 40 bloom_strength = [ 105 95 75 ] bloom_color = [ 120 120 120 ]}
endscript

script HO_1C_end 
    PopShadowVolumeDrawPriority
endscript

script HO_2_begin 
    PushShadowVolumeDrawPriority \{ priority = 0.0 }
    cutscene_set_temp_tod \{bloom_on = 0 bloom1 = 5 bloom2 = 40 bloom_strength = [ 105 95 75 ] bloom_color = [ 120 120 120 ]}
    ChangeNodeFlag \{ NODEFLAG_Z_HO_CUTSCENELIGHTS 0 }
endscript

script HO_2_end 
    ChangeNodeFlag \{ NODEFLAG_Z_HO_CUTSCENELIGHTS 1 }
    PopShadowVolumeDrawPriority
endscript

script HO_3_begin 
    PushShadowVolumeDrawPriority \{ priority = 0.0 }
    cutscene_set_temp_tod \{bloom_on = 0 bloom1 = 5 bloom2 = 40 bloom_strength = [ 105 95 75 ] bloom_color = [ 120 120 120 ]}
    if IsCreated \{ Z_HO_HO_KodakRail06 }
        Kill \{ name = Z_HO_HO_KodakRail06 }
    endif
    if IsCreated \{ Z_HO_HO_KodakRail05 }
        Kill \{ name = Z_HO_HO_KodakRail05 }
    endif
endscript

script HO_3_end 
    if NOT IsCreated \{ Z_HO_HO_KodakRail06 }
        Create \{ name = Z_HO_HO_KodakRail06 }
    endif
    if NOT IsCreated \{ Z_HO_HO_KodakRail05 }
        Create \{ name = Z_HO_HO_KodakRail05 }
    endif
    PopShadowVolumeDrawPriority
    wait \{ 1 seconds }
    SpawnScriptLater \{goal_got_abilities params = {got_abilities = [{ ability = 'Whack and Throw' control = str_z_ho_45 }]}}
endscript

script BH_4_begin 
    PushShadowVolumeDrawPriority \{ priority = 0.0 }
    cutscene_set_temp_tod \{bloom_on = 0 bloom1 = 5 bloom2 = 40 bloom_strength = [ 105 95 75 ] bloom_color = [ 120 120 120 ]}
    ChangeNodeFlag \{ NODEFLAG_Z_BH_BUSHES 0 }
endscript

script BH_4_end 
    PopShadowVolumeDrawPriority
    ChangeNodeFlag \{ NODEFLAG_Z_BH_BUSHES 1 }
endscript

script SR_5_begin 
    PushShadowVolumeDrawPriority \{ priority = 0.0 }
    cutscene_set_temp_tod \{bloom_on = 0 bloom1 = 5 bloom2 = 40 bloom_strength = [ 105 95 75 ] bloom_color = [ 120 120 120 ]}
endscript

script SR_5_end 
    PopShadowVolumeDrawPriority
endscript

script SR_6a_begin 
    PushShadowVolumeDrawPriority \{ priority = 0.0 }
    cutscene_set_temp_tod \{fog_on = 0 fog_red = 85 fog_green = 100 fog_blue = 105 fog_alpha = 108 fog_dist = 350 bloom_on = 0 bloom1 = 5 bloom2 = 40 bloom_strength = [ 105 95 75 ] bloom_color = [ 120 120 120 ]}
endscript

script SR_6a_end 
    PopShadowVolumeDrawPriority
    ChangeNodeFlag \{ NODEFLAG_Z_SR_RAMP_START 0 }
    ChangeNodeFlag \{ NODEFLAG_Z_SR_RAMP_COMPLETE 1 }
    ChangeNodeFlag \{ NODEFLAG_Z_SR_RAMP_DEF_FREEWAY 1 }
endscript

script SR_6_begin 
    PushShadowVolumeDrawPriority \{ priority = 0.0 }
    cutscene_set_temp_tod \{bloom_on = 0 bloom1 = 5 bloom2 = 40 bloom_strength = [ 105 95 75 ] bloom_color = [ 120 120 120 ]}
    if IsCreated \{ z_sr_g_bh_def_foliage_tree07 }
        Kill \{ name = z_sr_g_bh_def_foliage_tree07 }
    endif
endscript

script SR_6_end 
    if NOT IsCreated \{ z_sr_g_bh_def_foliage_tree07 }
        Create \{ name = z_sr_g_bh_def_foliage_tree07 }
    endif
    PopShadowVolumeDrawPriority
endscript

script VP_7_begin 
    PushShadowVolumeDrawPriority \{ priority = 0.0 }
    cutscene_set_temp_tod \{bloom_on = 0 bloom1 = 5 bloom2 = 40 bloom_strength = [ 105 95 75 ] bloom_color = [ 120 120 120 ]}
endscript

script VP_7_end 
    PopShadowVolumeDrawPriority
endscript

script SR_8_begin 
    PushShadowVolumeDrawPriority \{ priority = 0.0 }
    cutscene_set_temp_tod \{bloom_on = 0 bloom1 = 5 bloom2 = 40 bloom_strength = [ 105 95 75 ] bloom_color = [ 120 120 120 ]}
endscript

script SR_8_end 
    PopShadowVolumeDrawPriority
endscript

script SM_9_begin 
    PushShadowVolumeDrawPriority \{ priority = 0.0 }
    cutscene_set_temp_tod \{bloom_on = 0 bloom1 = 5 bloom2 = 40 bloom_strength = [ 105 95 75 ] bloom_color = [ 120 120 120 ]}
endscript

script SM_9_end 
    PopShadowVolumeDrawPriority
endscript

script OR_10_begin 
    PushShadowVolumeDrawPriority \{ priority = 0.0 }
    cutscene_set_temp_tod \{bloom_on = 0 bloom1 = 5 bloom2 = 40 bloom_strength = [ 105 95 75 ] bloom_color = [ 120 120 120 ]}
endscript

script OR_10_end 
    PopShadowVolumeDrawPriority
endscript

script BH_11A_begin 
    PushShadowVolumeDrawPriority \{ priority = 0.0 }
    cutscene_set_temp_tod \{bloom_on = 0 bloom1 = 5 bloom2 = 40 bloom_strength = [ 105 95 75 ] bloom_color = [ 120 120 120 ]}
endscript

script BH_11A_end 
    PopShadowVolumeDrawPriority
endscript

script BH_11_begin 
    PushShadowVolumeDrawPriority \{ priority = 0.0 }
    cutscene_set_temp_tod \{bloom_on = 0 bloom1 = 5 bloom2 = 40 bloom_strength = [ 105 95 75 ] bloom_color = [ 120 120 120 ]}
    ChangeNodeFlag \{ NODEFLAG_Z_BH_BHSRGATEPRE 0 }
    ChangeNodeFlag \{ NODEFLAG_Z_BH_BHSRGATEPOST 0 }
endscript

script BH_11_end 
    PopShadowVolumeDrawPriority
    ChangeNodeFlag \{ NODEFLAG_Z_BH_BHSRGATEPRE 1 }
endscript

script EL_12_begin 
    PushShadowVolumeDrawPriority \{ priority = 0.0 }
    cutscene_set_temp_tod \{bloom_on = 0 bloom1 = 5 bloom2 = 40 bloom_strength = [ 105 95 75 ] bloom_color = [ 120 120 120 ]}
endscript

script EL_12_end 
    PopShadowVolumeDrawPriority
endscript

script SR_13A_begin 
    PushShadowVolumeDrawPriority \{ priority = 0.0 }
    cutscene_set_temp_tod \{bloom_on = 0 bloom1 = 5 bloom2 = 40 bloom_strength = [ 105 95 75 ] bloom_color = [ 120 120 120 ]}
endscript

script SR_13A_end 
    PopShadowVolumeDrawPriority
endscript

script SR_13_begin 
    PushShadowVolumeDrawPriority \{ priority = 0.0 }
    cutscene_set_temp_tod \{bloom_on = 0 bloom1 = 5 bloom2 = 40 bloom_strength = [ 105 95 75 ] bloom_color = [ 120 120 120 ]}
endscript

script SR_13_end 
    PopShadowVolumeDrawPriority
endscript

script HO_LevelEvent_Dino_begin 
    PushShadowVolumeDrawPriority priority = 0.0
    cutscene_set_temp_tod {
        bloom_on = 0
        bloom1 = 5
        bloom2 = 40
        bloom_strength = [105 , 95 , 75]
        bloom_color = [120 , 120 , 120]
    }
    ChangeNodeFlag NODEFLAG_Z_HO_DINO_BEFORE 0
    ChangeNodeFlag NODEFLAG_Z_HO_DINO_AFTER 0
    ChangeNodeFlag NODEFLAG_Z_HO_DINO_HEAD 0
    ChangeNodeFlag NODEFLAG_Z_HO_DINO_BLDG_AFTER 1
    if IsCreated z_ho_streetlight01
        Kill name = z_ho_streetlight01
    endif
    if IsCreated z_ho_streetlight01_dark
        Kill name = z_ho_streetlight01_dark
    endif
endscript

script HO_LevelEvent_Dino_end 
    PopShadowVolumeDrawPriority
    ChangeNodeFlag \{ NODEFLAG_Z_HO_DINO_AFTER 1 }
    ChangeNodeFlag \{ NODEFLAG_Z_HO_DINO_HEAD 1 }
    ChangeNodeFlag \{ NODEFLAG_Z_HO_DINO_BLDG_AFTER 1 }
    if NOT IsCreated \{ z_ho_streetlight01 }
        Create \{ name = z_ho_streetlight01 }
    endif
    if NOT IsCreated \{ z_ho_streetlight01_dark }
        Create \{ name = z_ho_streetlight01_dark }
    endif
endscript

script HO_LevelEvent_Rocket_begin 
    PushShadowVolumeDrawPriority priority = 0.0
    cutscene_set_temp_tod {
        bloom_on = 0
        bloom1 = 5
        bloom2 = 40
        bloom_strength = [105 , 95 , 75]
        bloom_color = [120 , 120 , 120]
    }
    ChangeNodeFlag NODEFLAG_Z_HO_DT_EVENT 0
    if IsCreated Z_HO_ho_jad_catnfid_sign
        Kill name = Z_HO_ho_jad_catnfid_sign
    endif
    if IsCreated Z_HO_ho_jad_catnfid_planter01
        Kill name = Z_HO_ho_jad_catnfid_planter01
    endif
    if IsCreated Z_HO_ho_jad_catnfid_veg02
        Kill name = Z_HO_ho_jad_catnfid_veg02
    endif
endscript

script HO_LevelEvent_Rocket_end 
    PopShadowVolumeDrawPriority
    if IsCreated \{ Z_HO_ho_jad_catnfid_sign }
        Kill \{ name = Z_HO_ho_jad_catnfid_sign }
    endif
    if NOT IsCreated \{ Z_HO_ho_jad_catnfid_planter01 }
        Create \{ name = Z_HO_ho_jad_catnfid_planter01 }
    endif
    if IsCreated \{ Z_HO_ho_jad_catnfid_veg02 }
        Kill \{ name = Z_HO_ho_jad_catnfid_veg02 }
    endif
endscript

script DT_LevelEvent_Freeway_begin 
    PushShadowVolumeDrawPriority \{ priority = 0.0 }
    cutscene_set_temp_tod \{bloom_on = 0 bloom1 = 5 bloom2 = 40 bloom_strength = [ 105 95 75 ] bloom_color = [ 120 120 120 ]}
    ChangeNodeFlag \{ NODEFLAG_Z_DT_FREEWAY_KILLED 0 }
    ChangeNodeFlag \{ NODEFLAG_Z_DT_FREEWAY_CREATED 0 }
    ChangeNodeFlag \{ NODEFLAG_Z_DT_FREEWAY_PRECREATED 1 }
endscript

script DT_LevelEvent_Freeway_end 
    PopShadowVolumeDrawPriority
    ChangeNodeFlag \{ NODEFLAG_Z_DT_FREEWAY_CREATED 1 }
    ChangeNodeFlag \{ NODEFLAG_Z_SR_DT_FREEWAY 1 }
    ChangeNodeFlag \{ NODEFLAG_Z_SR_RAMP_DEF_FREEWAY 0 }
    ChangeNodeFlag \{ NODEFLAG_Z_DT_FREEWAY_DEF 0 }
endscript

script BH_LevelEvent_begin 
    PushShadowVolumeDrawPriority \{ priority = 0.0 }
    cutscene_set_temp_tod \{bloom_on = 0 bloom1 = 5 bloom2 = 40 bloom_strength = [ 105 95 75 ] bloom_color = [ 120 120 120 ]}
    ChangeNodeFlag \{ NODEFLAG_Z_BH_HOTELPRE 0 }
    ChangeNodeFlag \{ NODEFLAG_Z_BH_HOTELPOST 0 }
endscript

script BH_LevelEvent_end 
    PopShadowVolumeDrawPriority
    ChangeNodeFlag \{ NODEFLAG_Z_BH_HOTELPOST 1 }
endscript

script BH_SmallEvent_begin 
    PushShadowVolumeDrawPriority priority = 0.0
    cutscene_set_temp_tod {
        bloom_on = 0
        bloom1 = 5
        bloom2 = 40
        bloom_strength = [105 , 95 , 75]
        bloom_color = [120 , 120 , 120]
    }
    ChangeNodeFlag NODEFLAG_Z_BH_CITYHALLPRE 0
    ChangeNodeFlag NODEFLAG_Z_BH_CITYHALLPOST 0
    ChangeNodeFlag NODEFLAG_Z_BH_CITYHALLDURING 1
    ChangeNodeFlag NODEFLAG_Z_BH_CH_FLOOR_RIGHT 0
    ChangeNodeFlag NODEFLAG_Z_BH_STAR_RIGHT 0
    ChangeNodeFlag NODEFLAG_Z_BH_CH_FLOOR_LEFT 0
    ChangeNodeFlag NODEFLAG_Z_BH_STAR_LEFT 0
    ChangeNodeFlag NODEFLAG_Z_BH_GASROOF 0
    if IsCreated z_bh_g_cityhall_veg01
        Kill name = z_bh_g_cityhall_veg01
    endif
    if IsCreated z_bh_g_lightpost_wire_05
        Kill name = z_bh_g_lightpost_wire_05
    endif
    if IsCreated z_bh_g_cityhall_stuff_09
        Kill name = z_bh_g_cityhall_stuff_09
    endif
endscript

script BH_SmallEvent_end 
    PopShadowVolumeDrawPriority
    ChangeNodeFlag \{ NODEFLAG_Z_BH_CITYHALLPOST 1 }
    ChangeNodeFlag \{ NODEFLAG_Z_BH_GASROOF 1 }
    if NOT IsCreated \{ z_bh_g_cityhall_veg01 }
        Create \{ name = z_bh_g_cityhall_veg01 }
    endif
    if NOT IsCreated \{ z_bh_g_lightpost_wire_05 }
        Create \{ name = z_bh_g_lightpost_wire_05 }
    endif
    if NOT IsCreated \{ z_bh_g_cityhall_stuff_09 }
        Create \{ name = z_bh_g_cityhall_stuff_09 }
    endif
endscript

script EL_LevelEvent_begin 
    PushShadowVolumeDrawPriority \{ priority = 0.0 }
    cutscene_set_temp_tod \{bloom_on = 0 bloom1 = 5 bloom2 = 40 bloom_strength = [ 105 95 75 ] bloom_color = [ 120 120 120 ]}
    ChangeNodeFlag \{ NODEFLAG_Z_EL_SPEAR_BEFORE 0 }
    ChangeNodeFlag \{ NODEFLAG_Z_EL_SPEAR_AFTER 0 }
    ChangeNodeFlag \{ NODEFLAG_Z_EL_SPEAR_AFTER2 0 }
    ChangeNodeFlag \{ NODEFLAG_Z_EL_SPEAR_PIPECOVER 0 }
    if IsCreated \{ z_el_g_andy_r_spring01 }
        Kill \{ name = z_el_g_andy_r_spring01 }
    endif
endscript

script EL_LevelEvent_end 
    PopShadowVolumeDrawPriority
    ChangeNodeFlag \{ NODEFLAG_Z_EL_SPEAR_AFTER 1 }
    ChangeNodeFlag \{ NODEFLAG_Z_EL_SPEAR_AFTER2 1 }
    ChangeNodeFlag \{ NODEFLAG_Z_EL_SPEAR_PIPECOVER 1 }
endscript

script SM_LevelEvent_begin 
    PushShadowVolumeDrawPriority \{ priority = 0.0 }
    cutscene_set_temp_tod \{bloom_on = 0 bloom1 = 5 bloom2 = 40 bloom_strength = [ 105 95 75 ] bloom_color = [ 120 120 120 ]}
    ChangeNodeFlag \{ NODEFLAG_Z_SM_FERRISAFRAME_BEFORE 0 }
    ChangeNodeFlag \{ NODEFLAG_Z_SM_FERRISAFRAME_AFTER 0 }
    ChangeNodeFlag \{ NODEFLAG_SMOI_Boat_After 0 }
endscript

script SM_LevelEvent_end 
    PopShadowVolumeDrawPriority
    ChangeNodeFlag \{ NODEFLAG_Z_SM_FERRISAFRAME_AFTER 1 }
    ChangeNodeFlag \{ NODEFLAG_SMOI_Boat_After 1 }
endscript

script SR_LevelEvent_begin 
    PushShadowVolumeDrawPriority \{ priority = 0.0 }
    cutscene_set_temp_tod \{bloom_on = 0 bloom1 = 5 bloom2 = 40 bloom_strength = [ 105 95 75 ] bloom_color = [ 120 120 120 ]}
    ChangeNodeFlag \{ NODEFLAG_Z_SR_HO_DINO_DEF 1 }
    ChangeNodeFlag \{ NODEFLAG_Z_SR_HO_DINO 0 }
    ChangeNodeFlag \{ NODEFLAG_Z_SR_CRANE 0 }
    ChangeNodeFlag \{ NODEFLAG_Z_SR_CRANE_DEF 1 }
    ChangeNodeFlag \{ NODEFLAG_Z_SR_CRANE_TOP 0 }
endscript

script SR_LevelEvent_end 
    PopShadowVolumeDrawPriority
    ChangeNodeFlag \{ NODEFLAG_Z_SR_HO_DINO_DEF 0 }
    ChangeNodeFlag \{ NODEFLAG_Z_SR_HO_DINO 1 }
    ChangeNodeFlag \{ NODEFLAG_Z_SR_CRANE 1 }
    ChangeNodeFlag \{ NODEFLAG_Z_SR_CRANE_DEF 0 }
    ChangeNodeFlag \{ NODEFLAG_Z_SR_CRANE_TOP 1 }
    ChangeNodeFlag \{ NODEFLAG_Z_SR_CRANE_SNAKE 1 }
endscript

script launch_view_cutscenes_menu 
    RunScriptOnScreenElement id = current_menu_anchor animate_out callback = create_view_cutscenes_menu callback_params = { <...>  }
endscript

script make_select_view_cutscene_line 
    make_text_sub_menu_item text = <text> pad_choose_script = view_cutscene pad_choose_params = <...> 
endscript

script create_view_cutscenes_menu 
    make_new_menu \{menu_id = view_cutscenes_menu vmenu_id = view_cutscenes_vmenu menu_title = 'PRZERYWNIKI' type = vscrollingmenu dims = (320.0, 200.0) Pos = (500.0, 300.0)}
    SetScreenElementProps \{id = view_cutscenes_menu event_handlers = [{ pad_back create_test_menu }]}
    add_view_cutscenes_to_menu <...> 
    RunScriptOnScreenElement \{ id = current_menu_anchor animate_in }
endscript

script view_cutscene 
    UnPauseGame
    PauseMusic \{ 0 }
    PlayCutscene <...> exitscript = view_cutscene_done
    RunScriptOnScreenElement \{ id = current_menu_anchor menu_offscreen }
endscript

script view_cutscene_done 
    pausegame
    PauseMusic \{ 1 }
    startrendering
    create_view_cutscenes_menu
endscript

script cutscene_zine_test 
    if ScreenElementExists id = bo_2a_zine_anchor
        DestroyScreenElement id = bo_2a_zine_anchor
    endif
    cutscene_bo_2a_load_textures unload
    cutscene_bo_2a_load_textures
    SetScreenElementLock id = root_window Off
    CreateScreenElement {
        type = ContainerElement
        parent = root_window
        id = bo_2a_zine_anchor
        Pos = (0.0, 0.0)
        Scale = 0.6500
    }
    CreateScreenElement {
        type = SpriteElement
        parent = bo_2a_zine_anchor
        id = bo_2a_panel_one
        texture = frame_1_med
        Pos = (0.0, 0.0)
        just = [ left top ]
    }
    GetStackedScreenElementPos x id = bo_2a_panel_one
    CreateScreenElement {
        type = SpriteElement
        parent = bo_2a_zine_anchor
        id = bo_2a_panel_two
        texture = frame_2_med
        Pos = <Pos>
        just = [ left top ]
    }
    GetStackedScreenElementPos y id = bo_2a_panel_one
    CreateScreenElement {
        type = SpriteElement
        parent = bo_2a_zine_anchor
        id = bo_2a_panel_three
        texture = frame_3_med
        Pos = <Pos>
        just = [ left top ]
    }
    GetStackedScreenElementPos y id = bo_2a_panel_two
    CreateScreenElement {
        type = SpriteElement
        parent = bo_2a_zine_anchor
        id = bo_2a_panel_four
        texture = frame_4_med
        Pos = <Pos>
        just = [ left top ]
    }
    wait 3.200 seconds
    DoScreenElementMorph id = bo_2a_zine_anchor Scale = 1.350 time = 0.2000 Pos = (-45.0, -240.0)
    wait 2.300 seconds
    DoScreenElementMorph id = bo_2a_zine_anchor time = 0.2000 Pos = (-685.0, -240.0)
    wait 2.800 seconds
    DoScreenElementMorph id = bo_2a_zine_anchor time = 0.2000 Pos = (-45.0, -660.0)
    wait 2.800 seconds
    DoScreenElementMorph id = bo_2a_zine_anchor time = 0.2000 Pos = (-685.0, -660.0)
    wait 5.300 seconds
    DoScreenElementMorph id = bo_2a_zine_anchor alpha = 0 time = 0.5000
    wait 0.5000 seconds
    if ScreenElementExists id = bo_2a_zine_anchor
        DestroyScreenElement id = bo_2a_zine_anchor
    endif
    cutscene_bo_2a_load_textures unload
endscript
