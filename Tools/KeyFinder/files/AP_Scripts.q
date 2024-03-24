
script AP_Setup 
    AP_Initializer
endscript


script AP_startup 
endscript


script AP_Initializer 
endscript


script AP_Goals 
    if InMultiPlayerGame
        add_multiplayer_mode_goals
    endif
    if NOT InSplitScreenGame
        if ((GameModeEquals is_classic)|| (InNetGame))
            printf 'adding classic goals'
            AddGoal_HighScore {
                unlimited_time
                classic_mode_goal
                goal_text = AP_Classic_HighScore_Text
                view_goals_cameras = [{
                        name = Cam_score
                        frames = 1200
                        skippable = 1
                    }
                ]
                difficulty_level_params = [
                    {Score = AP_Classic_Easy_HighScore
                        goal_text = AP_Classic_Easy_HighScore_Text
                        view_goals_text = AP_Classic_Easy_HighScore_Text
                    }
                    {Score = AP_Classic_HighScore
                        goal_text = AP_Classic_HighScore_Text
                        view_goals_text = AP_Classic_HighScore_Text
                    }
                ]
            }
            AddGoal_ProScore {
                unlimited_time
                classic_mode_goal
                Score = AP_Classic_ProScore
                goal_text = AP_Classic_ProScore_Text
                view_goals_text = AP_Classic_ProScore_Text
                difficulty_level_params = [
                    {Score = AP_Classic_Easy_ProScore
                        goal_text = AP_Classic_Easy_ProScore_Text
                        view_goals_text = AP_Classic_Easy_ProScore_Text
                    }
                    {Score = AP_Classic_ProScore
                        goal_text = AP_Classic_ProScore_Text
                        view_goals_text = AP_Classic_ProScore_Text
                    }
                ]
            }
            AddGoal_SickScore {
                unlimited_time
                classic_mode_goal
                Score = AP_Classic_SickScore
                goal_text = AP_Classic_SickScore_Text
                view_goals_text = AP_Classic_SickScore_Text
                difficulty_level_params = [
                    {Score = AP_Classic_Easy_SickScore
                        goal_text = AP_Classic_Easy_SickScore_Text
                        view_goals_text = AP_Classic_Easy_SickScore_Text
                    }
                    {Score = AP_Classic_SickScore
                        goal_text = AP_Classic_SickScore_Text
                        view_goals_text = AP_Classic_SickScore_Text
                    }
                ]
            }
            AddGoal_HighCombo {
                unlimited_time
                classic_mode_goal
                Score = AP_Classic_HighCombo
                goal_text = AP_Classic_HighCombo_Text
                view_goals_text = AP_Classic_HighCombo_Text
                difficulty_level_params = [
                    {Score = AP_Classic_Easy_HighCombo
                        goal_text = AP_Classic_Easy_HighCombo_Text
                        view_goals_text = AP_Classic_Easy_HighCombo_Text
                    }
                    {Score = AP_Classic_HighCombo
                        goal_text = AP_Classic_HighCombo_Text
                        view_goals_text = AP_Classic_HighCombo_Text
                    }
                ]
            }
            AddGoal_Skate {
                unlimited_time
                classic_mode_goal
                S_obj_id = TRG_SKATE_S
                K_obj_id = TRG_SKATE_K
                A_obj_id = TRG_SKATE_A
                T_obj_id = TRG_SKATE_T
                E_obj_id = TRG_SKATE_E
                view_goals_cameras = [{virtual_cam
                        TargetID = world
                        targetOffset = (269.20001220703125, -676.0999755859375, 2630.699951171875)
                        positionOffset = (4852.7001953125, 358.70001220703125, -6196.5)
                        frames = 200
                        skippable = 1
                    }
                ]
            }
            AddGoal_Combo {
                unlimited_time
                classic_mode_goal
                letter_info = [
                    {obj_id = TRG_COMBO_C text = 'C'}
                    {obj_id = TRG_COMBO_O text = 'O'}
                    {obj_id = TRG_COMBO_M text = 'M'}
                    {obj_id = TRG_COMBO_B text = 'B'}
                    {obj_id = TRG_COMBO_O01 text = 'O'}
                ]
                view_goals_cameras = [{virtual_cam
                        TargetID = world
                        targetOffset = (6125.7001953125, -665.4000244140625, 4470.5)
                        positionOffset = (4429.2998046875, 99.0, -5354.7998046875)
                        frames = 200
                        skippable = 1
                    }
                ]
            }
            AddGoal_Collect {
                unlimited_time
                init_script = AP_SuitcaseCreate
                goal_deactivate_script = AP_SuitcaseKill
                classic_mode_goal
                version = 2
                collect_type = 'Suspicious Suitcases'
                goal_text = 'Crush The Suspicious Suitcases'
                view_goals_text = 'Crush The Suspicious Suitcases'
                use_hud_counter
                hud_counter_caption = 'Suspicious Suitcases Crushed!'
                goal_flags = [got_1
                    got_2
                    got_3
                    got_4
                    got_5
                ]
                view_goals_cameras = [{virtual_cam
                        TargetID = world
                        targetOffset = (-1484.5999755859375, -3696.39990234375, -12967.5)
                        positionOffset = (3113.199951171875, -218.60000610351562, -4797.10009765625)
                        frames = 200
                        skippable = 1
                    }
                ]
            }
            AddGoal_Gaps {
                unlimited_time
                classic_mode_goal
                version = 2
                goal_text = 'Nose Manual The Escalator Slope (\b4+\b7)'
                view_goals_text = 'Nose Manual The Escalator Slope (\b4+\b7)'
                goal_description = 'Nose Manual The Escalator Slope (\b4+\b7)'
                goal_flags = [ got_1
                 ]
                view_goals_cameras = [{virtual_cam
                        TargetID = world
                        targetOffset = (6544.60009765625, -2660.10009765625, 5120.2998046875)
                        positionOffset = (4549.7001953125, 126.5999984741211, -4274.0)
                        frames = 200
                        skippable = 1
                    }
                ]
            }
            AddGoal_Gaps {
                unlimited_time
                classic_mode_goal
                goal_text = '\t1 (\k1) Over The Copter!'
                view_goals_text = '\t1 (\k1) Over The Copter!'
                goal_description = '\t1 (\k1) Over The Copter!'
                goal_flags = [ got_1
                 ]
                view_goals_cameras = [{virtual_cam
                        TargetID = world
                        targetOffset = (11666.2998046875, -3159.0, -5260.7998046875)
                        positionOffset = (2590.0, 244.3000030517578, -7717.7001953125)
                        frames = 200
                        skippable = 1
                    }
                ]
                key_combos = [ Air_CircleU ]
            }
            AddGoal_SecretTape {
                goal_text = 'Get the secret tape'
                view_goals_text = 'Get the secret tape'
                classic_mode_goal
                goal_description = 'Get the secret tape'
                secret_tape_id = TRG_AP_SecretTape
                view_goals_cameras = [{virtual_cam
                        TargetID = world
                        targetOffset = (-10097.2998046875, -3626.300048828125, 6319.89990234375)
                        positionOffset = (-2416.5, -476.20001220703125, 745.0)
                        frames = 200
                        skippable = 1
                    }
                ]
            }
        endif
    endif
endscript


script AP_SuitcaseCreate 
    Create prefix = 'AP_Suitcase'
    Create prefix = 'AP_SuitcaseTrigger'
    change kg_timesround = 0
    ClearExceptionGroup AP_CircBench_grindcheck
    kill_panel_message_if_it_exists id = message_circbench
endscript


script AP_SuitcaseKill 
    Kill prefix = 'AP_Suitcase'
    Kill prefix = 'AP_SuitcaseTrigger'
endscript

kg_circlebench = 0
kg_timesround = 0

script AP_circlebench 
    GetTriggerArray through
    if triggertype <trigger_array>
        if onrail
            change kg_circlebench = (kg_circlebench + 1)
            switch kg_circlebench
                case 4
                KillSpawnedScript name = AP_circbench_off
                ClearExceptionGroup AP_CircBench_grindcheck
                SpawnScript AP_circbench_off
                playsound HitPotty
                change kg_circlebench = 0
                change kg_timesround = (kg_timesround + 1)
                FormatText textname = circbench_text 'Circular Bench Grind %a Times!' a = kg_timesround
                create_panel_message id = message_circbench text = <circbench_text> style = goal_collect_text
                printf ' bench '
            endswitch
        endif
    endif
endscript


script AP_circbench_off 
    ClearExceptionGroup AP_CircBench_grindcheck
    seteventhandler Ex = SkaterExitRail scr = AP_circbench_reset group = AP_CircBench_grindcheck
    Block
endscript


script AP_circbench_reset 
    change kg_timesround = 0
    ClearExceptionGroup AP_CircBench_grindcheck
    kill_panel_message_if_it_exists id = message_circbench
endscript


script AP_Secret_Tape 
endscript


script AP_Secret_Tape_Got 
endscript


script AP_Suitcase 
    Kill name = <name>
    Kill name = <suitcase>
    playsound HitFlag
    switch <name>
        case AP_Suitcase01
        goal_collect_got_object goal_id = ap_classic_goal_collect2 flag = got_1
        CreateGlobalFlexParticlesystem name = JOW_Suitcase01 params_script = JOW_AP_Suitcase01_particle_params
        JOW_Suitcase01 ::obj_setposition position = (2992.1201171875, 27.553499221801758, -8545.76953125)
        CreateFastParticleSystem name = JOW_Suitcase01a params_script = JOW_AP_Suitcase01_fast_particle_params
        case AP_Suitcase02
        goal_collect_got_object goal_id = ap_classic_goal_collect2 flag = got_2
        CreateGlobalFlexParticlesystem name = JOW_Suitcase02 params_script = JOW_AP_Suitcase02_particle_params
        JOW_Suitcase02 ::obj_setposition position = (3004.010009765625, -383.4020080566406, -4987.009765625)
        CreateFastParticleSystem name = JOW_Suitcase02a params_script = JOW_AP_Suitcase02_fast_particle_params
        case AP_Suitcase03
        goal_collect_got_object goal_id = ap_classic_goal_collect2 flag = got_3
        CreateGlobalFlexParticlesystem name = JOW_Suitcase03 params_script = JOW_AP_Suitcase03_particle_params
        JOW_Suitcase03 ::obj_setposition position = (3200.469970703125, -469.60400390625, -520.6090087890625)
        CreateFastParticleSystem name = JOW_Suitcase03a params_script = JOW_AP_Suitcase03_fast_particle_params
        case AP_Suitcase04
        goal_collect_got_object goal_id = ap_classic_goal_collect2 flag = got_4
        CreateGlobalFlexParticlesystem name = JOW_Suitcase04 params_script = JOW_AP_Suitcase04_particle_params
        JOW_Suitcase04 ::obj_setposition position = (-1120.3199462890625, -1350.6800537109375, 4910.93017578125)
        CreateFastParticleSystem name = JOW_Suitcase04a params_script = JOW_AP_Suitcase04_fast_particle_params
        case AP_Suitcase05
        goal_collect_got_object goal_id = ap_classic_goal_collect2 flag = got_5
        CreateGlobalFlexParticlesystem name = JOW_Suitcase05 params_script = JOW_AP_Suitcase05_particle_params
        JOW_Suitcase05 ::obj_setposition position = (4103.41015625, -467.4410095214844, 3001.919921875)
        CreateFastParticleSystem name = JOW_Suitcase05a params_script = JOW_AP_Suitcase05_fast_particle_params
    endswitch
endscript


script AP_GapStart_ToRail 
    StartGap GapID = CommonStairs flags = [ PURE_MANUAL CANCEL_HANG ] TrickScript = AP_Classic_Gaps_Got1
endscript


script AP_GapEnd_ToRail 
    endgap GapID = CommonStairs Score = 5000 text = 'Manual The Slope!'
endscript


script AP_Classic_Gaps_Got1 
    GoalManager_SetGoalFlag name = AP_classic_goal_gaps2 got_1 1
endscript

Flag_HeliDone = 0

script AP_Heli_Move_Start2 
    StartGap GapID = helicopter flags = [ PURE_AIR CANCEL_HANG ] keycombo = Air_CircleU TrickScript = AP_Classic_Gaps_Got2
endscript


script AP_Heli_Move_End2 
    endgap GapID = helicopter Score = 2000 text = 'Helicopter Hop!'
endscript


script AP_Classic_Gaps_Got2 
    if GoalManager_SetGoalFlag name = AP_classic_goal_gaps got_1 1
        Kill name = EO_Chopper01
        Kill name = EO_Chopper01a
        Kill name = EO_Chopper04
        Kill name = EO_Chopper03
        Kill name = EO_Chopper02a
        Kill name = GO_Chopper02a
        Kill name = Heli_Shadow01
        Kill name = EO_Chopper01b
        Kill name = heliGap_01
        Kill name = heliGap_02
        Kill name = TRG_RailChopper_01
        Kill name = TRG_RailChopper_02
        Kill name = TRG_RailChopper_03
        Kill name = TRG_RailChopper_04
        Kill name = TRG_RailChopper_05
        Kill name = TRG_RailChopper_06
        Create name = GO_Chopper01
        Create name = GO_Chopper_propeller02
        GO_Chopper01 ::obj_movetonode name = TRG_Heli_01 Speed = 10
        GO_Chopper_propeller02 ::obj_movetonode name = TRG_Heli_01 Speed = 10
        GO_Chopper_propeller02 ::obj_roty Speed = 1600
        playsound HitPotty volume = 100.0 pitch = 100.0
        wait 1 seconds
        GO_Chopper01 ::obj_rotate absolute = (0.0, 25.0, 0.0) time = 2 flag_max_coords
        wait 1 seconds
        GO_Chopper01 ::obj_rotate absolute = (0.0, -15.0, 0.0) time = 2 flag_max_coords
        wait 1 seconds
        GO_Chopper01 ::obj_rotate absolute = (0.0, 20.0, 0.0) time = 2 flag_max_coords
        wait 1 second
        GO_Chopper01 ::obj_rotate absolute = (0.0, -15.0, 0.0) time = 1 flag_max_coords
        wait 1 second
        GO_Chopper01 ::obj_rotate absolute = (0.0, 25.0, 0.0) time = 5 flag_max_coords
        GO_Chopper01 ::obj_rotate absolute = (0.0, -5.0, 0.0) time = 5 flag_max_coords
        GO_Chopper01 ::obj_rotate absolute = (0.0, 5.0, 0.0) time = 3 flag_max_coords
        GO_Chopper01 ::obj_rotate absolute = (0.0, -25.0, 0.0) time = 3 flag_max_coords
        GO_Chopper01 ::obj_movetonode name = TRG_Heli_02 Speed = 25
        GO_Chopper_propeller02 ::obj_movetonode name = TRG_Heli_02 Speed = 25
        GO_Chopper_propeller02 ::obj_roty Speed = 1600
        wait 25 seconds
        Kill name = GO_Chopper01
        Kill name = GO_Chopper_propeller02
    endif
endscript


script CA_CreateCars 
endscript


script CA_CreatePeds 
endscript


script CA_KillCars 
endscript


script CA_KillPeds 
endscript


script AP_Shatter 
    Shatter name = <name> area = 5000 variance = 4 vel_x = 50 vel_y = 50 vel_z = 50
    playsound SmashWoodQP
    Kill name = <name>
endscript


script AP_Door_Alarm 
    if NOT InMultiPlayerGame
        skater ::Vibrate_Controller_Safe actuator = 1 percent = 35
        wait 0.2000 seconds
        pulse_blur start = 180 Speed = 3
        skater ::Vibrate_Controller_Safe actuator = 1 percent = 0
        playsound VC_HockeyBuzzer01
        Kill name = g_ug_goalB_light_Off
        Create name = g_ug_goalB_light_On
        wait 3 seconds
        Kill name = g_ug_goalB_light_On
        Create name = g_ug_goalB_light_Off
    endif
endscript


script AP_Light_Spin 
    obj_rotz Speed = 400 flag_max_coords
endscript


script AP_TeleTrigger 
    if NOT (GameModeEquals is_ctf)
        Create prefix = 'AP_NotCTF'
        Kill prefix = 'AP_YesCTF'
    endif
endscript


script TRG_TeleDown01 
    TeleportSkaterToNode nodeName = TRG_TeleDown01 orient
    trigger_speed_boost Speed = 2500 DefSkaterVO = 1
    playsound SK6_Menu_Fly_In
    if NOT GotParam cut
        create_panel_message {
            id = leaving_message
            text = 'Airport Drop'
            Pos = (320.0, 180.0)
            rgba = [118 , 110 , 14 , 128]
            pulse_blur
            start = 200
            Speed = 1
            Scale = 1.0
        }
    endif
endscript


script tod_script 
    switch <current_tod>
        case Morning
        case day
        case Evening
        case Night
        default 
        printf '### no tod set ###'
    endswitch
endscript


script CPF_GapSound 
endscript


script CPF_AP_GotTicket 
endscript


script CPF_LightPopGap 
endscript


script AP_Palms01 
    if IsAlive name = Palms_01
        GetTriggerArray spin onto
        if triggertype <trigger_array>
            GetBonus Score = 10000 text = 'Shredded Palm Tree!'
            playsound SmashWoodQP
            ShatterAndDie name = <palm> area = 500 variance = 4 vel_x = 50 vel_y = 50 vel_z = 50 spread = 1 texture_swap = BA_cp_grass_mow_particle
            Kill name = <palm>
        endif
    endif
endscript


script AP_Palms02 
    if IsAlive name = Palms_02
        GetTriggerArray spin onto
        if triggertype <trigger_array>
            GetBonus Score = 10000 text = 'Shredded Palm Tree!'
            playsound SmashWoodQP
            ShatterAndDie name = <palm> area = 500 variance = 4 vel_x = 50 vel_y = 50 vel_z = 50 spread = 1 texture_swap = BA_cp_grass_mow_particle
            Kill name = <palm>
        endif
    endif
endscript


script AP_Palms03 
    if IsAlive name = Palms_03
        GetTriggerArray spin onto
        if triggertype <trigger_array>
            GetBonus Score = 10000 text = 'Shredded Palm Tree!'
            playsound SmashWoodQP
            ShatterAndDie name = <palm> area = 500 variance = 4 vel_x = 50 vel_y = 50 vel_z = 50 spread = 1 texture_swap = BA_cp_grass_mow_particle
            Kill name = <palm>
        endif
    endif
endscript


script AP_Esc_Move 
    begin 
    obj_movetonode name = TRG_Move_Escalator03 time = 1
    Obj_WaitMove
    obj_movetonode name = TRG_Move_Escalator01
    repeat 
endscript


script AP_Esc_Move1 
    begin 
    obj_movetonode name = TRG_Move_Escalator02 time = 1
    Obj_WaitMove
    obj_movetonode name = TRG_Move_Escalator01
    repeat 
endscript


script AP_Esc_Move2 
    begin 
    obj_movetonode name = TRG_Move_Escalator04 time = 1
    Obj_WaitMove
    obj_movetonode name = TRG_Move_Escalator06
    repeat 
endscript


script AP_Esc_Move3 
    begin 
    obj_movetonode name = TRG_Move_Escalator05 time = 1
    Obj_WaitMove
    obj_movetonode name = TRG_Move_Escalator06
    repeat 
endscript


script AP_Esc_Move4 
    begin 
    obj_movetonode name = TRG_Move_Escalator08 time = 1
    Obj_WaitMove
    obj_movetonode name = TRG_Move_Escalator07
    repeat 
endscript


script AP_Esc_Move5 
    begin 
    obj_movetonode name = TRG_Move_Escalator09 time = 1
    Obj_WaitMove
    obj_movetonode name = TRG_Move_Escalator07
    repeat 
endscript


script AP_Gap_Xray_Start 
    StartGap GapID = AP_Gap_Id_Xray1 flags = [ PURE_MANUAL CANCEL_HANG ]
endscript


script AP_Gap_Xray_End 
    endgap GapID = AP_Gap_Id_Xray1 text = 'X-Ray' Score = 100
endscript


script AP_Gap_walkwayhop_Start 
    StartGap GapID = AP_Gap_Id_walkwayhop1 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script AP_Gap_walkwayhop_End 
    endgap GapID = AP_Gap_Id_walkwayhop1 text = 'Walkway Hop' Score = 50
endscript


script AP_Gap_walkwayhop_Start1 
    StartGap GapID = AP_Gap_Id_walkwayhop2 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script AP_Gap_walkwayhop_End1 
    endgap GapID = AP_Gap_Id_walkwayhop2 text = 'Walkway Hop' Score = 50
endscript


script AP_Gap_walkwayride_Start 
    StartGap GapID = AP_Gap_Id_walkwayride1 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script AP_Gap_walkwayride_End 
    endgap GapID = AP_Gap_Id_walkwayride1 text = 'Walkway Ride1!' Score = 100
endscript


script AP_Gap_local_Start 
    StartGap GapID = AP_Gap_Id_Local1 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script AP_Gap_local_End 
    endgap GapID = AP_Gap_Id_Local1 text = 'Local Call' Score = 100
endscript


script AP_Gap_Illuminatin_Start 
    StartGap GapID = AP_Gap_Id_Illuminatin1 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script AP_Gap_Illuminatin_End 
    endgap GapID = AP_Gap_Id_Illuminatin1 text = 'Illuminatin\'' Score = 100
endscript


script AP_Gap_HardWay_Start 
    StartGap GapID = AP_Gap_Id_HardWay1 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script AP_Gap_HardWay_End 
    endgap GapID = AP_Gap_Id_HardWay1 text = 'The Hard Way Up!' Score = 200
endscript


script AP_Gap_Draining_Start 
    StartGap GapID = AP_Gap_Id_Draining1 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script AP_Gap_Draining_End 
    endgap GapID = AP_Gap_Id_Draining1 text = 'Draining The Vein' Score = 100
endscript


script AP_Gap_HighRoad_Start 
    StartGap GapID = AP_Gap_Id_HighRoad1 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script AP_Gap_HighRoad_End 
    endgap GapID = AP_Gap_Id_HighRoad1 text = 'Takin\' The High Road' Score = 100
endscript


script AP_Gap_ClaimHop_Start 
    StartGap GapID = ClaimHop1 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script AP_Gap_ClaimHop_End 
    endgap GapID = ClaimHop1 text = 'Claim Hop!' Score = 50
endscript


script AP_Gap_ClaimHop_Start1 
    StartGap GapID = ClaimHop2 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script AP_Gap_ClaimHop_End1 
    endgap GapID = ClaimHop2 text = 'Claim Hop!' Score = 50
endscript


script AP_Gap_Baggage_Start 
    StartGap GapID = AP_Gap_Id_Baggage1 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script AP_Gap_Baggage_End 
    endgap GapID = AP_Gap_Id_Baggage1 text = 'Grind Baggage Claim' Score = 100
endscript


script AP_Gap_Spotted_Start 
    StartGap GapID = AP_Gap_Id_Spotted1 flags = [ REQUIRE_LIP CANCEL_HANG ]
endscript


script AP_Gap_Spotted_End 
    endgap GapID = AP_Gap_Id_Spotted1 text = 'Spotted Bags' Score = 100
endscript


script AP_Gap_Situation_Start 
    StartGap GapID = AP_Gap_Id_Situation1 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script AP_Gap_Situation_End 
    endgap GapID = AP_Gap_Id_Situation1 text = 'Escalatin\' The Situation' Score = 100
endscript


script AP_Gap_Situation_Start1 
    StartGap GapID = AP_Gap_Id_Situation2 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script AP_Gap_Situation_End1 
    endgap GapID = AP_Gap_Id_Situation2 text = 'Escalatin\' The Situation' Score = 100
endscript


script AP_Gap_Pad_Start 
    StartGap GapID = AP_Gap_Id_Pad1 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script AP_Gap_Pad_End 
    endgap GapID = AP_Gap_Id_Pad1 text = 'Through The Pad!' Score = 100
endscript


script AP_Gap_Heliport_Start 
    StartGap GapID = AP_Gap_Id_Heliport1 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script AP_Gap_Heliport_End 
    endgap GapID = AP_Gap_Id_Heliport1 text = 'Heliport Baggage' Score = 50
endscript


script AP_Gap_Heliport_Start1 
    StartGap GapID = AP_Gap_Id_Heliport2 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script AP_Gap_Heliport_End1 
    endgap GapID = AP_Gap_Id_Heliport2 text = 'Heliport Baggage' Score = 50
endscript


script AP_Gap_Flying_Start 
    StartGap GapID = AP_Gap_Id_Flying1 flags = [ CANCEL_MANUAL REQUIRE_LIP CANCEL_HANG ]
endscript


script AP_Gap_Flying_End 
    endgap GapID = AP_Gap_Id_Flying1 text = 'Flying High In The Sky' Score = 200
endscript


script AP_Gap_Mulin_Start 
    StartGap GapID = AP_Gap_Id_Mulin1 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script AP_Gap_Mulin_End 
    endgap GapID = AP_Gap_Id_Mulin1 text = 'Mulin\'' Score = 100
endscript


script AP_Gap_LookOut_Start 
    StartGap GapID = AP_Gap_Id_LookOut1 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script AP_Gap_LookOut_End 
    endgap GapID = AP_Gap_Id_LookOut1 text = 'Look Out!!' Score = 100
endscript


script AP_Gap_SLookOut_Start 
    StartGap GapID = AP_Gap_Id_SLookOut1 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script AP_Gap_SLookOut_End 
    endgap GapID = AP_Gap_Id_SLookOut1 text = 'S Look Out!!' Score = 100
endscript


script AP_Gap_Droppin_Start 
    StartGap GapID = AP_Gap_Id_Droppin1 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script AP_Gap_Droppin_End 
    endgap GapID = AP_Gap_Id_Droppin1 text = 'Droppin\' Science!' Score = 100
endscript


script AP_Gap_Lighten_Start 
    StartGap GapID = AP_Gap_Id_Lighten1 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script AP_Gap_Lighten_End 
    endgap GapID = AP_Gap_Id_Lighten1 text = 'Lighten Up!' Score = 100
endscript


script AP_Gap_Long_Start 
    StartGap GapID = AP_Gap_Id_Long1 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script AP_Gap_Long_End 
    endgap GapID = AP_Gap_Id_Long1 text = 'Long Distance' Score = 100
endscript


script AP_Gap_walkwayride2_Start 
    StartGap GapID = AP_Gap_Id_walkwayride2 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script AP_Gap_walkwayride2_End 
    endgap GapID = AP_Gap_Id_walkwayride2 text = 'Walkway Ride2!' Score = 100
endscript


script AP_Gap_OA_Start 
    StartGap GapID = AP_Gap_Id_OA1 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script AP_Gap_OA_End 
    endgap GapID = AP_Gap_Id_OA1 text = 'O The S' Score = 100
endscript


script AP_Gap_Last_Start 
    StartGap GapID = AP_Gap_Id_Last1 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script AP_Gap_Last_End 
    endgap GapID = AP_Gap_Id_Last1 text = 'Last High Light!' Score = 100
endscript


script AP_Gap_GateHop_Start 
    StartGap GapID = AP_Gap_Id_GateHop1 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script AP_Gap_GateHop_End 
    endgap GapID = AP_Gap_Id_GateHop1 text = 'Gate Hop!' Score = 100
endscript


script AP_Gap_GateHop_Start1 
    StartGap GapID = AP_Gap_Id_GateHop2 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script AP_Gap_GateHop_End1 
    endgap GapID = AP_Gap_Id_GateHop2 text = 'Gate Hop!' Score = 100
endscript


script AP_Gap_GateHop_Start2 
    StartGap GapID = AP_Gap_Id_GateHop22 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script AP_Gap_GateHop_End2 
    endgap GapID = AP_Gap_Id_GateHop22 text = 'Gate Hop!' Score = 100
endscript


script AP_Gap_GateHop_Start3 
    StartGap GapID = AP_Gap_Id_GateHop3 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script AP_Gap_GateHop_End3 
    endgap GapID = AP_Gap_Id_GateHop3 text = 'Gate Hop!' Score = 100
endscript


script AP_Gap_GateHop_Start4 
    StartGap GapID = AP_Gap_Id_GateHop4 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script AP_Gap_GateHop_End4 
    endgap GapID = AP_Gap_Id_GateHop4 text = 'Gate Hop!' Score = 100
endscript


script AP_Gap_GateHop_Start5 
    StartGap GapID = AP_Gap_Id_GateHop5 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script AP_Gap_GateHop_End5 
    endgap GapID = AP_Gap_Id_GateHop5 text = 'Gate Hop!' Score = 100
endscript


script AP_Gap_GateHop_Start6 
    StartGap GapID = AP_Gap_Id_GateHop6 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script AP_Gap_GateHop_End6 
    endgap GapID = AP_Gap_Id_GateHop6 text = 'Gate Hop!' Score = 100
endscript


script AP_Gap_GateHop_Start7 
    StartGap GapID = AP_Gap_Id_GateHop7 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script AP_Gap_GateHop_End7 
    endgap GapID = AP_Gap_Id_GateHop7 text = 'Gate Hop!' Score = 100
endscript


script AP_Gap_GateHop_Start8 
    StartGap GapID = AP_Gap_Id_GateHop8 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script AP_Gap_GateHop_End8 
    endgap GapID = AP_Gap_Id_GateHop8 text = 'Gate Hop!' Score = 100
endscript


script AP_Gap_GateHop_Start9 
    StartGap GapID = AP_Gap_Id_GateHop9 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script AP_Gap_GateHop_End9 
    endgap GapID = AP_Gap_Id_GateHop9 text = 'Gate Hop!' Score = 100
endscript


script AP_Gap_GateTrans_Start 
    StartGap GapID = AP_Gap_Id_GateTrans1 flags = [ CANCEL_GROUND REQUIRE_GRIND CANCEL_HANG ]
endscript


script AP_Gap_GateTrans_End 
    endgap GapID = AP_Gap_Id_GateTrans1 text = 'Gate Transfer!' Score = 300
endscript


script AP_Gap_GateTrans_Start1 
    StartGap GapID = AP_Gap_Id_GateTrans2 flags = [ CANCEL_GROUND REQUIRE_GRIND CANCEL_HANG ]
endscript


script AP_Gap_GateTrans_End1 
    endgap GapID = AP_Gap_Id_GateTrans2 text = 'Gate Transfer!' Score = 300
endscript


script AP_Gap_GateTrans_Start2 
    StartGap GapID = AP_Gap_Id_GateTrans22 flags = [ CANCEL_GROUND REQUIRE_GRIND CANCEL_HANG ]
endscript


script AP_Gap_GateTrans_End2 
    endgap GapID = AP_Gap_Id_GateTrans22 text = 'Gate Transfer!' Score = 300
endscript


script AP_Gap_GateTrans_Start3 
    StartGap GapID = AP_Gap_Id_GateTrans3 flags = [ CANCEL_GROUND REQUIRE_GRIND CANCEL_HANG ]
endscript


script AP_Gap_GateTrans_End3 
    endgap GapID = AP_Gap_Id_GateTrans3 text = 'Gate Transfer!' Score = 300
endscript


script AP_Gap_GateTrans_Start4 
    StartGap GapID = AP_Gap_Id_GateTrans4 flags = [ CANCEL_GROUND REQUIRE_GRIND CANCEL_HANG ]
endscript


script AP_Gap_GateTrans_End4 
    endgap GapID = AP_Gap_Id_GateTrans4 text = 'Gate Transfer!' Score = 300
endscript


script AP_Gap_GateTrans_Start5 
    StartGap GapID = AP_Gap_Id_GateTrans5 flags = [ CANCEL_GROUND REQUIRE_GRIND CANCEL_HANG ]
endscript


script AP_Gap_GateTrans_End5 
    endgap GapID = AP_Gap_Id_GateTrans5 text = 'Gate Transfer!' Score = 300
endscript


script AP_Gap_GateTrans_Start6 
    StartGap GapID = AP_Gap_Id_GateTrans6 flags = [ CANCEL_GROUND REQUIRE_GRIND CANCEL_HANG ]
endscript


script AP_Gap_GateTrans_End6 
    endgap GapID = AP_Gap_Id_GateTrans6 text = 'Gate Transfer!' Score = 300
endscript


script AP_Gap_Musical_Start 
    StartGap GapID = AP_Gap_Id_Musical1 flags = [ CANCEL_GROUND REQUIRE_MANUAL CANCEL_HANG ]
endscript


script AP_Gap_Musical_End 
    endgap GapID = AP_Gap_Id_Musical1 text = 'Musical Chairs' Score = 100
endscript


script AP_Gap_Musical_Start1 
    StartGap GapID = AP_Gap_Id_Musical2 flags = [ CANCEL_GROUND REQUIRE_MANUAL CANCEL_HANG ]
endscript


script AP_Gap_Musical_End1 
    endgap GapID = AP_Gap_Id_Musical2 text = 'Musical Chairs' Score = 100
endscript


script BO_OfficeWindowScript 
endscript


script AP_Gap_English_EndGap 
    GetBonus Score = 200 text = 'Destruction Bonus'
    Kill name = TRGP_EndArea_Flag_England
    CreateGlobalFlexParticlesystem name = JOW_EnglishScraps01 params_script = JOW_AP_FlagScraps01_particle_params
    JOW_EnglishScraps01 ::obj_setposition position = (-469.1610107421875, -920.2999877929688, 7287.68017578125)
    create_panel_block {id = InteriorTest text = 'Football? Soccer?' rgba = {144 , 144 , 144 , 128}Pos = (320.0, 380.0)
        dims = (160.0, 140.0)
        time = 1000
        just = { left left }
        internal_just = { left left }
    }
    playsound HitPotty volume = 100.0 pitch = 100.0
    Kill name = TRGP_EndArea_Flag_Trig06
    Kill name = TRGP_EndArea_Flag_Trig08
endscript


script AP_Gap_Russia_EndGap 
    GetBonus Score = 200 text = 'Destruction Bonus'
    Kill name = TRGP_EndArea_Russia
    CreateGlobalFlexParticlesystem name = JOW_RussiaScraps01 params_script = JOW_AP_FlagScraps01_particle_params
    JOW_RussiaScraps01 ::obj_setposition position = (-890.0759887695312, -920.2999877929688, 7909.81005859375)
    create_panel_block {id = InteriorTest
        text = 'Welcome To Mother Russia'
        rgba = {144 , 144 , 144 , 128}
        Pos = (320.0, 340.0)
        dims = (640.0, 25.0)
        time = 1000
        just = { left left }
        internal_just = { left left }
    }
    playsound HitPotty volume = 100.0 pitch = 100.0
    Kill name = TRGP_EndArea_Flag_Trig09
    Kill name = TRGP_EndArea_Flag_Trig11
endscript


script AP_Gap_Mex_EndGap 
    GetBonus Score = 200 text = 'Destruction Bonus'
    Kill name = TRGP_EndArea_Mexico
    CreateGlobalFlexParticlesystem name = JOW_MexicoScraps01 params_script = JOW_AP_FlagScraps01_particle_params
    JOW_MexicoScraps01 ::obj_setposition position = (-1602.489990234375, -920.2999877929688, 8693.66015625)
    create_panel_block {id = InteriorTest
        text = 'South Of The Border'
        rgba = {144 , 144 , 144 , 128}
        Pos = (320.0, 340.0)
        dims = (640.0, 25.0)
        time = 1000
        just = { left left }
        internal_just = { left left }
    }
    playsound HitPotty volume = 100.0 pitch = 100.0
    Kill name = TRGP_EndArea_Flag_Trig14
    Kill name = TRGP_EndArea_Flag_Trig16
endscript


script AP_Gap_Repu_EndGap 
    GetBonus Score = 200 text = 'Destruction Bonus'
    Kill name = TRGP_EndArea_Republic
    CreateGlobalFlexParticlesystem name = JOW_RepublicScraps01 params_script = JOW_AP_FlagScraps01_particle_params
    JOW_RepublicScraps01 ::obj_setposition position = (-2677.0400390625, -920.2999877929688, 8412.48046875)
    create_panel_block {id = InteriorTest
        text = 'Republique Du Tchad'
        rgba = {144 , 144 , 144 , 128}
        Pos = (320.0, 340.0)
        dims = (640.0, 25.0)
        time = 1000
        just = { left left }
        internal_just = { left left }
    }
    playsound HitPotty volume = 100.0 pitch = 100.0
    Kill name = TRGP_EndArea_Flag_Trig17
    Kill name = TRGP_EndArea_Flag_Trig19
endscript


script AP_Gap_Where_EndGap 
    GetBonus Score = 200 text = 'Destruction Bonus'
    Kill name = TRGP_EndArea_RandomFlag
    CreateGlobalFlexParticlesystem name = JOW_RandomScraps01 params_script = JOW_AP_FlagScraps01_particle_params
    JOW_RandomScraps01 ::obj_setposition position = (-2205.010009765625, -920.2999877929688, 7387.169921875)
    create_panel_block {id = InteriorTest
        text = 'Where Are We?'
        rgba = {144 , 144 , 144 , 128}
        Pos = (320.0, 340.0)
        dims = (640.0, 25.0)
        time = 1000
        just = { left left }
        internal_just = { left left }
    }
    playsound HitPotty volume = 100.0 pitch = 100.0
    Kill name = TRGP_EndArea_Flag_Trig22
    Kill name = TRGP_EndArea_Flag_Trig24
endscript


script AP_Gap_French_EndGap 
    GetBonus Score = 200 text = 'Destruction Bonus'
    Kill name = TRGP_EndArea_France
    CreateGlobalFlexParticlesystem name = JOW_FranceScraps01 params_script = JOW_AP_FlagScraps01_particle_params
    JOW_FranceScraps01 ::obj_setposition position = (-2205.02001953125, -920.2999877929688, 2130.27001953125)
    create_panel_block {id = InteriorTest
        text = 'Mon Dieu!'
        rgba = {144 , 144 , 144 , 128}
        Pos = (320.0, 340.0)
        dims = (640.0, 25.0)
        time = 1000
        just = { left left }
        internal_just = { left left }
    }
    playsound HitPotty volume = 100.0 pitch = 100.0
    Kill name = TRGP_EndArea_Flag_Trig25
    Kill name = TRGP_EndArea_Flag_Trig27
endscript


script AP_Gap_Aussie_EndGap 
    GetBonus Score = 200 text = 'Destruction Bonus'
    Kill name = TRGP_EndArea_Australia
    CreateGlobalFlexParticlesystem name = JOW_AustraliaScraps01 params_script = JOW_AP_FlagScraps01_particle_params
    JOW_AustraliaScraps01 ::obj_setposition position = (-2677.050048828125, -920.2999877929688, 1104.9599609375)
    create_panel_block {id = InteriorTest
        text = 'Australian For Kick Ass Game, Mate!'
        rgba = {144 , 144 , 144 , 128}
        Pos = (320.0, 340.0)
        dims = (640.0, 25.0)
        time = 1000
        just = { left left }
        internal_just = { left left }
    }
    playsound HitPotty volume = 100.0 pitch = 100.0
    Kill name = TRGP_EndArea_Flag_Trig30
    Kill name = TRGP_EndArea_Flag_Trig32
endscript


script AP_Gap_USA_EndGap 
    GetBonus Score = 200 text = 'Destruction Bonus'
    Kill name = TRGP_EndArea_USA
    CreateGlobalFlexParticlesystem name = JOW_USAScraps01 params_script = JOW_AP_FlagScraps01_particle_params
    JOW_USAScraps01 ::obj_setposition position = (-1604.010009765625, -920.2999877929688, 824.6519775390625)
    create_panel_block {id = InteriorTest
        text = 'Don\'t Mess With Texas'
        rgba = {144 , 144 , 144 , 128}
        Pos = (320.0, 340.0)
        dims = (640.0, 25.0)
        time = 1000
        just = { left left }
        internal_just = { left left }
    }
    playsound HitPotty volume = 100.0 pitch = 100.0
    Kill name = TRGP_EndArea_Flag_Trig34
    Kill name = TRGP_EndArea_Flag_Trig36
endscript


script AP_Gap_Can_EndGap 
    GetBonus Score = 200 text = 'Destruction Bonus'
    Kill name = TRGP_EndArea_Canada
    CreateGlobalFlexParticlesystem name = JOW_CanadaScraps01 params_script = JOW_AP_FlagScraps01_particle_params
    JOW_CanadaScraps01 ::obj_setposition position = (-890.9000244140625, -920.2999877929688, 1608.4100341796875)
    create_panel_block {id = InteriorTest
        text = 'Bonjour. Eh?'
        rgba = {144 , 144 , 144 , 128}
        Pos = (320.0, 340.0)
        dims = (640.0, 25.0)
        time = 1000
        just = { left left }
        internal_just = { left left }
    }
    playsound HitPotty volume = 100.0 pitch = 100.0
    Kill name = TRGP_EndArea_Flag_Trig37
    Kill name = TRGP_EndArea_Flag_Trig39
endscript


script AP_Gap_Bahama_EndGap 
    GetBonus Score = 200 text = 'Destruction Bonus'
    Kill name = TRGP_EndArea_TheBahamas
    CreateGlobalFlexParticlesystem name = JOW_BahamasScraps01 params_script = JOW_AP_FlagScraps01_particle_params
    JOW_BahamasScraps01 ::obj_setposition position = (-467.5039978027344, -920.2999877929688, 2228.409912109375)
    create_panel_block {id = InteriorTest
        text = 'Bahamas... Beautiful'
        rgba = {144 , 144 , 144 , 128}
        Pos = (320.0, 340.0)
        dims = (640.0, 25.0)
        time = 1000
        just = { left left }
        internal_just = { left left }
    }
    playsound HitPotty volume = 100.0 pitch = 100.0
    Kill name = TRGP_EndArea_Flag_Trig41
    Kill name = TRGP_EndArea_Flag_Trig43
endscript


script TRG_AP_Car01 
    Car_Generic01 StickToGround TurnDist = 70 DefaultSpeed = 10
endscript


script AP_TELE_Bottom 
    if NOT (GameModeEquals is_ctf)
        TeleportSkaterToNode nodeName = TRG_Restart_Start01
        GetBonus Score = 5000
        text = 'Rewind Bonus'
        create_panel_message {
            id = leaving_message
            text = 'Rewind!'
            Pos = (320.0, 180.0)
            rgba = [118 , 110 , 14 , 128]
            pulse_blur
            start = 200
            Speed = 1
            Scale = 1.0
        }
        playsound LA_Skid_11 vol = 50
    endif
endscript


script ESC_Ground 
    obj_setpathvelocity 0.5000 mph
    obj_pathheading Off
    obj_followpathlinked
endscript


script AP_GO_Baggage 
    EO_LowArea_43 ::obj_rotz Speed = 50 flag_max_coords
    GO_LowArea_42 ::obj_rotz Speed = 30 flag_max_coords
    LowArea_reflection01 ::obj_rotz Speed = 30 flag_max_coords
endscript


script AP_Vent_Shatter1 
    GetBonus Score = 5000 text = 'Roof Shattered!'
    ShatterAndDie name = TRGP_BustVent02 area = 500 variance = 4 vel_x = 50 vel_y = 50 vel_z = 50 spread = 1
    playsound SmashWoodQP vol = 100
endscript


script AP_Vent_Shatter2 
    GetBonus Score = 5000 text = 'Roof Shattered!'
    ShatterAndDie name = TRGP_BustVent12 area = 500 variance = 4 vel_x = 50 vel_y = 50 vel_z = 50 spread = 1
    playsound SmashWoodQP vol = 100
endscript


script AP_Roof_Shatter1 
    GetBonus Score = 5000 text = 'Roof Shattered!'
    ShatterAndDie name = AP_Shatter_Roof_03 area = 500 variance = 4 vel_x = 50 vel_y = 50 vel_z = 50 spread = 1
    Kill name = AP_Shatter_Roof_01
    playsound SmashWoodQP vol = 100
endscript


script AP_Roof_Shatter2 
    GetBonus Score = 5000 text = 'Roof Shattered!'
    ShatterAndDie name = AP_Shatter_Roof_04 area = 500 variance = 4 vel_x = 50 vel_y = 50 vel_z = 50 spread = 1
    Kill name = AP_Shatter_Roof_02
    playsound SmashWoodQP vol = 100
endscript


script AP_Roof_Shatter3 
    GetBonus Score = 5000 text = 'Roof Shattered!'
    ShatterAndDie name = AP_Break01 area = 500 variance = 4 vel_x = 50 vel_y = 50 vel_z = 50 spread = 1
    playsound SmashWoodQP vol = 100
    Kill name = AP_Break01
endscript


script AP_Roof_Shatter4 
    GetBonus Score = 5000 text = 'Roof Shattered!'
    ShatterAndDie name = AP_Break03 area = 500 variance = 4 vel_x = 50 vel_y = 50 vel_z = 50 spread = 1
    playsound SmashWoodQP vol = 100
    Kill name = AP_Break03
endscript


script AP_Roof_Shatter5 
    GetBonus Score = 5000 text = 'Roof Shattered!'
    ShatterAndDie name = AP_Break02 area = 500 variance = 4 vel_x = 50 vel_y = 50 vel_z = 50 spread = 1
    playsound SmashWoodQP vol = 100
    Kill name = AP_Break02
endscript


script AP_Police_Shatter1 
    GetBonus Score = 500 text = 'Police Tape Broken!'
    ShatterAndDie name = Police_Line01 area = 500 variance = 4 vel_x = 50 vel_y = 50 vel_z = 50 spread = 1 texture_swap = police_line2
    Create name = Police_Line07
    ShatterAndDie name = Police_Line07 area = 500 variance = 4 vel_x = 50 vel_y = 50 vel_z = 50 spread = 1 texture_swap = police_line2
    playsound HitFlag vol = 100
endscript


script AP_Police_Shatter2 
    GetBonus Score = 500 text = 'Police Tape Broken!'
    ShatterAndDie name = Police_Line02 area = 500 variance = 4 vel_x = 50 vel_y = 50 vel_z = 50 spread = 1 texture_swap = police_line2
    Create name = Police_Line07
    ShatterAndDie name = Police_Line07 area = 500 variance = 4 vel_x = 50 vel_y = 50 vel_z = 50 spread = 1 texture_swap = police_line2
    playsound HitFlag vol = 100
endscript


script AP_Police_Shatter3 
    GetBonus Score = 500 text = 'Police Tape Broken!'
    ShatterAndDie name = Police_Line03 area = 500 variance = 4 vel_x = 50 vel_y = 50 vel_z = 50 spread = 1 texture_swap = police_line2
    Create name = Police_Line07
    ShatterAndDie name = Police_Line07 area = 500 variance = 4 vel_x = 50 vel_y = 50 vel_z = 50 spread = 1 texture_swap = police_line2
    playsound HitFlag vol = 100
endscript


script AP_Police_Shatter4 
    GetBonus Score = 500 text = 'Police Tape Broken!'
    ShatterAndDie name = Police_Line04 area = 500 variance = 4 vel_x = 50 vel_y = 50 vel_z = 50 spread = 1 texture_swap = police_line2
    Create name = Police_Line07
    ShatterAndDie name = Police_Line07 area = 500 variance = 4 vel_x = 50 vel_y = 50 vel_z = 50 spread = 1 texture_swap = police_line2
    playsound HitFlag vol = 100
endscript


script AP_Police_Shatter5 
    GetBonus Score = 500 text = 'Police Tape Broken!'
    ShatterAndDie name = Police_Line05 area = 500 variance = 4 vel_x = 50 vel_y = 50 vel_z = 50 spread = 1 texture_swap = police_line2
    Create name = Police_Line07
    ShatterAndDie name = Police_Line07 area = 500 variance = 4 vel_x = 50 vel_y = 50 vel_z = 50 spread = 1 texture_swap = police_line2
    playsound HitFlag vol = 100
endscript


script AP_Police_Shatter6 
    GetBonus Score = 500 text = 'Police Tape Broken!'
    ShatterAndDie name = Police_Line06 area = 500 variance = 4 vel_x = 50 vel_y = 50 vel_z = 50 spread = 1 texture_swap = police_line2
    Create name = Police_Line07
    ShatterAndDie name = Police_Line07 area = 500 variance = 4 vel_x = 50 vel_y = 50 vel_z = 50 spread = 1 texture_swap = police_line2
    playsound HitFlag vol = 100
endscript


script AP_Gap_RailHop_Start 
    StartGap GapID = AP_Gap_Id_RailHop1 flags = [ CANCEL_GROUND REQUIRE_GRIND CANCEL_HANG ]
endscript


script AP_Gap_RailHop_End 
    endgap GapID = AP_Gap_Id_RailHop1 text = 'Rail Hop' Score = 50
endscript


script AP_Gap_SpiralN_Start 
    StartGap GapID = AP_Gap_Id_SpiralN1 flags = [ CANCEL_GROUND REQUIRE_GRIND CANCEL_HANG ]
endscript


script AP_Gap_SpiralN_End 
    endgap GapID = AP_Gap_Id_SpiralN1 text = 'Spiral Stairs North' Score = 100
endscript


script AP_Gap_SpiralS_Start 
    StartGap GapID = AP_Gap_Id_SpiralS1 flags = [ CANCEL_GROUND REQUIRE_GRIND CANCEL_HANG ]
endscript


script AP_Gap_SpiralS_End 
    endgap GapID = AP_Gap_Id_SpiralS1 text = 'Spiral Stairs South' Score = 100
endscript


script AP_Gap_EconLip_Start 
    StartGap GapID = AP_Gap_Id_EconLip1 flags = [ REQUIRE_LIP CANCEL_GROUND CANCEL_HANG ]
endscript


script AP_Gap_EconLip_End 
    endgap GapID = AP_Gap_Id_EconLip1 text = 'Economy Class Lip' Score = 250
endscript


script AP_Gap_BusLip_Start 
    StartGap GapID = AP_Gap_Id_BusLip1 flags = [ REQUIRE_LIP CANCEL_GROUND CANCEL_HANG ]
endscript


script AP_Gap_BusLip_End 
    endgap GapID = AP_Gap_Id_BusLip1 text = 'Business Class Lip!' Score = 500
endscript


script AP_Gap_LightPop_Start 
    StartGap GapID = AP_Gap_Id_LightPop1 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script AP_Gap_LightPop_End 
    endgap GapID = AP_Gap_Id_LightPop1 text = 'Light Pop!' Score = 100
endscript


script AP_Gap_LightHop_Start 
    StartGap GapID = AP_Gap_Id_LightHop1 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script AP_Gap_LightHop_End 
    endgap GapID = AP_Gap_Id_LightHop1 text = 'Light Hop!' Score = 100
endscript


script AP_Gap_LightHop_Start1 
    StartGap GapID = AP_Gap_Id_LightHop11 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script AP_Gap_LightHop_End1 
    endgap GapID = AP_Gap_Id_LightHop11 text = 'Light Hop!' Score = 100
endscript


script AP_Gap_LightHop_Start2 
    StartGap GapID = AP_Gap_Id_LightHop12 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script AP_Gap_LightHop_End2 
    endgap GapID = AP_Gap_Id_LightHop12 text = 'Light Hop!' Score = 100
endscript


script AP_Gap_LightHop_Start3 
    StartGap GapID = AP_Gap_Id_LightHop13 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script AP_Gap_LightHop_End3 
    endgap GapID = AP_Gap_Id_LightHop13 text = 'Light Hop!' Score = 100
endscript


script AP_Gap_LightHop_Start4 
    StartGap GapID = AP_Gap_Id_LightHop14 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script AP_Gap_LightHop_End4 
    endgap GapID = AP_Gap_Id_LightHop14 text = 'Light Hop!' Score = 100
endscript


script AP_Gap_LightHop_Start5 
    StartGap GapID = AP_Gap_Id_LightHop15 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script AP_Gap_LightHop_End5 
    endgap GapID = AP_Gap_Id_LightHop15 text = 'Light Hop!' Score = 100
endscript


script AP_Gap_LightHop_Start6 
    StartGap GapID = AP_Gap_Id_LightHop16 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script AP_Gap_LightHop_End6 
    endgap GapID = AP_Gap_Id_LightHop16 text = 'Light Hop!' Score = 100
endscript


script AP_Gap_LightHop_Start7 
    StartGap GapID = AP_Gap_Id_LightHop17 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script AP_Gap_LightHop_End7 
    endgap GapID = AP_Gap_Id_LightHop17 text = 'Light Hop!' Score = 100
endscript


script AP_Gap_LightHop_Start8 
    StartGap GapID = AP_Gap_Id_LightHop18 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script AP_Gap_LightHop_End8 
    endgap GapID = AP_Gap_Id_LightHop18 text = 'Light Hop!' Score = 100
endscript


script AP_Gap_LightHop_Start9 
    StartGap GapID = AP_Gap_Id_LightHop19 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script AP_Gap_LightHop_End9 
    endgap GapID = AP_Gap_Id_LightHop19 text = 'Light Hop!' Score = 100
endscript


script AP_Gap_LightHop_Start10 
    StartGap GapID = AP_Gap_Id_LightHop10 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script AP_Gap_LightHop_End10 
    endgap GapID = AP_Gap_Id_LightHop10 text = 'Light Hop!' Score = 100
endscript


script AP_Gap_LightHop_Start11 
    StartGap GapID = AP_Gap_Id_LightHop111 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script AP_Gap_LightHop_End11 
    endgap GapID = AP_Gap_Id_LightHop111 text = 'Light Hop!' Score = 100
endscript


script AP_Gap_LightHop_Start12 
    StartGap GapID = AP_Gap_Id_LightHop112 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script AP_Gap_LightHop_End12 
    endgap GapID = AP_Gap_Id_LightHop112 text = 'Light Hop!' Score = 100
endscript


script AP_Gap_LightHop_Start13 
    StartGap GapID = AP_Gap_Id_LightHop113 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script AP_Gap_LightHop_End13 
    endgap GapID = AP_Gap_Id_LightHop113 text = 'Light Hop!' Score = 100
endscript


script AP_Gap_LightHop_Start14 
    StartGap GapID = AP_Gap_Id_LightHop114 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script AP_Gap_LightHop_End14 
    endgap GapID = AP_Gap_Id_LightHop114 text = 'Light Hop!' Score = 100
endscript


script AP_Gap_LightHop_Start15 
    StartGap GapID = AP_Gap_Id_LightHop115 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script AP_Gap_LightHop_End15 
    endgap GapID = AP_Gap_Id_LightHop115 text = 'Light Hop!' Score = 100
endscript


script AP_Gap_LightHop_Start16 
    StartGap GapID = AP_Gap_Id_LightHop116 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script AP_Gap_LightHop_End16 
    endgap GapID = AP_Gap_Id_LightHop116 text = 'Light Hop!' Score = 100
endscript


script AP_Gap_Off_Start 
    StartGap GapID = AP_Gap_Id_Off1 flags = [ CANCEL_GROUND REQUIRE_MANUAL CANCEL_HANG ]
endscript


script AP_Gap_Off_End 
    endgap GapID = AP_Gap_Id_Off1 text = 'Off The Couch' Score = 100
endscript


script AP_Gap_Start_Start 
    StartGap GapID = AP_Gap_Id_Start1 flags = [ CANCEL_GROUND CANCEL_HANG ]
endscript


script AP_Gap_Start_End 
    endgap GapID = AP_Gap_Id_Start1 text = 'Start To Finish!!!' Score = 600
endscript


script AP_2d_sign_element_create parent = menu3d_anchor
    if GetGlobalFlag flag = SCREEN_MODE_WIDE
        <Offset> = (-8.0, 0.0)
    else
        <Offset> = (0.0, 0.0)
    endif
    CreateScreenElement {
        type = SpriteElement
        parent = <parent>
        texture = AP_icon_1
        id = AP_guy
        Scale = 2.700
        rgba = [ 128 128 128 128 ]
        Pos = ((18.0, 104.0) + <Offset>)
        rot_angle = 0
        just = [ left top ]
        z_priority = -51
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <parent>
        texture = AP_icon_2
        id = AP_arrow
        Scale = 1.800
        rgba = [ 128 128 128 100 ]
        Pos = ((70.0, 120.0) + <Offset>)
        rot_angle = 0
        just = [ center top ]
        alpha = 0
        z_priority = -51
    }
    RunScriptOnScreenElement id = <parent> AP_icon_anim
endscript


script AP_icon_anim 
    begin 
    RunScriptOnScreenElement id = AP_guy AP_guy_anim
    wait 0.8000 seconds
    RunScriptOnScreenElement id = AP_arrow AP_arrow_anim
    wait Random (@ 5 @ 7 @ 9) seconds
    repeat 
endscript


script AP_guy_anim 
    start_pos = (14.0, 104.0)
    DoMorph time = 0 Pos = (<start_pos> - (250.0, 0.0))
    DoMorph time = 1 Pos = <start_pos>
    wait 1.500 seconds
    DoMorph time = 0.3000 Pos = (<start_pos> - (250.0, 0.0))
endscript


script AP_arrow_anim 
    DoMorph time = 0 alpha = 0 rot_angle = 0
    DoMorph time = 0.5000 alpha = 1
    DoMorph time = 0.5000 rot_angle = -200
    DoMorph time = 0.5000 alpha = 0
endscript

