
script LA_Setup 
    LA_CreateCars
    LA_CreatePeds all
    LA_Main_Initializer
    LA_Initializer
    LA_manualcheck_init
endscript


script LA_startup 
endscript


script LA_Initializer 
    change kg_variable_X = 0
    change kg_variable_Y = 0
    change kg_variable_Z = 0
    change kg_variable_A = 0
    UnSetFlag flag = FLAG_LA_RAIL1
    UnSetFlag flag = FLAG_LA_RAIL2
    UnSetFlag flag = FLAG_LA_RAIL3
    UnSetFlag flag = FLAG_LA_RAIL4
    UnSetFlag flag = FLAG_LA_DID_EARTHQUAKE
    UnSetFlag flag = FLAG_LA_RAIL1
    UnSetFlag flag = FLAG_LA_RAIL2
    UnSetFlag flag = FLAG_LA_RAIL3
    UnSetFlag flag = FLAG_LA_RAIL4
    UnSetFlag flag = FLAG_LA_TEXT1
    UnSetFlag flag = FLAG_LA_TEXT2
    UnSetFlag flag = FLAG_LA_TEXT3
    UnSetFlag flag = FLAG_LA_TEXT4
endscript


script LA_Main_Initializer 
    if InMultiPlayerGame
        Create name = Car_Wash_BreakGO
        Kill name = Overpass_Good_06
        Kill name = GO_WireWest_Good
        Kill prefix = 'TRG_GO_MoveTo'
        Create name = carwash_destroyed_04
        Create name = carwash_destroyed_05
        Create name = carwash_destroyed_06
        Create name = carwash_destroyed_07
        Create name = carwash_destroyed_08
        Create name = carwash_destroyed_01
        Kill name = Car_Wash_BreakGO
        Kill name = Overpass_Good_01
        Kill name = Overpass_Good_03
        Kill name = Overpass_Good_04
        Kill name = Overpass_Good_05
        Kill name = Overpass_Good_07
        Kill name = Overpass_Good_09
        Kill name = carwash_good_02
        Kill name = carwash_good_03
        Kill name = carwash_good_01
        Create name = ADestroyed_01
        Create name = ADestroyed_02
        Create name = ADestroyed_03
        Create name = ADestroyed_04
        Create name = ADestroyed_06
        Create name = ADestroyed_07
        Create name = ADestroyed_08
        Create name = carwash_destroyed_09
        Create name = carwash_destroyed_02
        Create name = carwash_destroyed_03
        Kill name = ADestroyed_01
        Kill name = ADestroyed_02
        Kill name = ADestroyed_03
        Kill name = ADestroyed_04
        Kill name = ADestroyed_06
        Kill name = ADestroyed_07
        Kill name = ADestroyed_08
        Create name = Overpass_Destroyed_01
        Create name = Overpass_Destroyed_04
        Create name = Overpass_Destroyed_05
        Create name = Overpass_Destroyed_06
        Create name = Overpass_Destroyed_07
        Create name = Overpass_Destroyed_10_Car
        Create name = Overpass_Destroyed_11
        Create name = Overpass_Destroyed_12
        Create name = Overpass_Destroyed_13
        Create prefix = 'Rubble01_'
        Create name = Overpass_Car_Rocking
        Create name = TRG_Rail_KenCar
        Create prefix = 'TRG_Rail_Overpass'
        Kill prefix = 'Rail_Freeway_'
        Create name = DestroyedCar_Geometry_07
        Create prefix = 'TRG_Rail_Overpass'
        Create name = TRGP_CarFall_E01
        Create name = TRGP_CarFall_E02
        Create name = TRGP_CarFall_E03
        Create name = GO_WireWest
        Kill name = GO_FallingSign2
        Kill name = FallingSign_Rocking
        Kill name = GO_FallingSign03
        Kill name = GO_FallingSign
        Kill name = GO_WireEast_Hang
        Kill name = GO_WireEast
        Kill name = FallingSign01
        change kg_timesround = 0
        ClearExceptionGroup AP_CircBench_grindcheck
        kill_panel_message_if_it_exists id = message_circbench
        change kg_timesroundwall = 0
        change kg_circlewall = 0
        ClearExceptionGroup LA_CircWall_grindcheck
        kill_panel_message_if_it_exists id = message_circwall
    endif
endscript


script LA_Goals 
    if InMultiPlayerGame
        add_multiplayer_mode_goals
    endif
    if NOT InSplitScreenGame
        if ((GameModeEquals is_classic)|| (InNetGame))
            printf 'adding classic goals'
            AddGoal_HighScore {
                unlimited_time
                classic_mode_goal
                goal_text = LA_Classic_HighScore_Text
                view_goals_cameras = [{
                        name = Cam_score
                        frames = 1200
                        skippable = 1
                    }
                ]
                difficulty_level_params = [
                    {Score = LA_Classic_Easy_HighScore
                        goal_text = LA_Classic_Easy_HighScore_Text
                        view_goals_text = LA_Classic_Easy_HighScore_Text
                    }
                    {Score = LA_Classic_HighScore
                        goal_text = LA_Classic_HighScore_Text
                        view_goals_text = LA_Classic_HighScore_Text
                    }
                ]
            }
            AddGoal_ProScore {
                unlimited_time
                classic_mode_goal
                Score = LA_Classic_ProScore
                goal_text = LA_Classic_ProScore_Text
                view_goals_text = LA_Classic_ProScore_Text
                difficulty_level_params = [
                    {Score = LA_Classic_Easy_ProScore
                        goal_text = LA_Classic_Easy_ProScore_Text
                        view_goals_text = LA_Classic_Easy_ProScore_Text
                    }
                    {Score = LA_Classic_ProScore
                        goal_text = LA_Classic_ProScore_Text
                        view_goals_text = LA_Classic_ProScore_Text
                    }
                ]
            }
            AddGoal_SickScore {
                unlimited_time
                classic_mode_goal
                Score = LA_Classic_SickScore
                goal_text = LA_Classic_SickScore_Text
                view_goals_text = LA_Classic_SickScore_Text
                difficulty_level_params = [
                    {Score = LA_Classic_Easy_SickScore
                        goal_text = LA_Classic_Easy_SickScore_Text
                        view_goals_text = LA_Classic_Easy_SickScore_Text
                    }
                    {Score = LA_Classic_SickScore
                        goal_text = LA_Classic_SickScore_Text
                        view_goals_text = LA_Classic_SickScore_Text
                    }
                ]
            }
            AddGoal_HighCombo {
                unlimited_time
                classic_mode_goal
                Score = LA_Classic_HighCombo
                goal_text = LA_Classic_HighCombo_Text
                view_goals_text = LA_Classic_HighCombo_Text
                difficulty_level_params = [
                    {Score = LA_Classic_Easy_HighCombo
                        goal_text = LA_Classic_Easy_HighCombo_Text
                        view_goals_text = LA_Classic_Easy_HighCombo_Text
                    }
                    {Score = LA_Classic_HighCombo
                        goal_text = LA_Classic_HighCombo_Text
                        view_goals_text = LA_Classic_HighCombo_Text
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
                        targetOffset = (-5154.89990234375, -2697.800048828125, 9817.599609375)
                        positionOffset = (-829.0, 274.6000061035156, 1305.800048828125)
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
                        targetOffset = (4170.89990234375, -1275.699951171875, 5492.2998046875)
                        positionOffset = (-4948.7998046875, 195.89999389648438, 1662.5999755859375)
                        frames = 200
                        skippable = 1
                    }
                ]
            }
            AddGoal_Collect {
                unlimited_time
                init_script = LA_LatteCreate
                goal_deactivate_script = LA_LatteKill
                classic_mode_goal
                version = 2
                collect_type = 'Ice Latte'
                goal_text = 'Blow Up The 5 Ice Lattes'
                view_goals_text = 'Blow Up The 5 Ice Lattes'
                use_hud_counter
                hud_counter_caption = 'Blew Up The 5 Ice Lattes!'
                goal_flags = [got_1
                    got_2
                    got_3
                    got_4
                    got_5
                ]
                view_goals_cameras = [{virtual_cam
                        TargetID = world
                        targetOffset = (9041.099609375, -1377.5, 2632.699951171875)
                        positionOffset = (-328.79998779296875, 153.5, -507.3999938964844)
                        frames = 200
                        skippable = 1
                    }
                ]
            }
            AddGoal_Gaps {
                unlimited_time
                classic_mode_goal
                version = 2
                goal_text = '(\b2+\b6+\b6) Roll The Purple Gap'
                view_goals_text = '(\b2+\b6+\b6) Roll The Purple Gap'
                goal_description = 'Roll The Purple Gap'
                goal_flags = [ got_1
                 ]
                view_goals_cameras = [{virtual_cam
                        TargetID = world
                        targetOffset = (-4914.0, -1705.800048828125, 12952.7001953125)
                        positionOffset = (479.29998779296875, -67.0999984741211, 4692.7998046875)
                        frames = 200
                        skippable = 1
                    }
                ]
            }
            AddGoal_Collect {
                unlimited_time
                init_script = LA_CarbCreate
                goal_deactivate_script = LA_CarbKill
                classic_mode_goal
                collect_type = 'Low Carb Dishes'
                goal_text = 'Crush 5 Low Carb Dishes'
                view_goals_text = 'Crush 5 Low Carb Dishes'
                use_hud_counter
                hud_counter_caption = 'Crushed 5 Low Carb Dishes'
                goal_flags = [got_1
                    got_2
                    got_3
                    got_4
                    got_5
                ]
                view_goals_cameras = [{virtual_cam
                        TargetID = world
                        targetOffset = (4044.0, -5407.7001953125, 9052.5)
                        positionOffset = (-2957.0, -196.6999969482422, 4170.89990234375)
                        frames = 200
                        skippable = 1
                    }
                ]
            }
            AddGoal_SecretTape {
                goal_text = 'Get the secret tape'
                view_goals_text = 'Get the secret tape'
                classic_mode_goal
                goal_description = 'Get the secret tape'
                secret_tape_id = TRG_LA_SECRETTAPE
                view_goals_cameras = [{virtual_cam
                        TargetID = world
                        targetOffset = (-6200.10009765625, -2637.89990234375, 8734.2001953125)
                        positionOffset = (174.1999969482422, 1143.800048828125, 2021.0999755859375)
                        frames = 200
                        skippable = 1
                    }
                ]
            }
        endif
    endif
endscript


script LA_LatteCreate 
    Create prefix = 'LA_Trigger_IceLatte'
    Create prefix = 'LA_IceLatte'
endscript


script LA_LatteKill 
    Kill prefix = 'LA_Trigger_IceLatte'
    Kill prefix = 'LA_IceLatte'
endscript


script LA_CarbCreate 
    Create prefix = 'LA_LowcarbPlatter'
    Create prefix = 'LA_Trigger_LowCarb'
endscript


script LA_CarbKill 
    Kill prefix = 'LA_LowcarbPlatter'
    Kill prefix = 'LA_Trigger_LowCarb'
endscript


script LA_Lattes 
    ShatterAndDie name = <name> area = 5000 variance = 4 vel_x = 50 vel_y = 50 vel_z = 50
    Kill name = <Trigg>
    Kill name = <name>
    playsound SmashCake
    switch <name>
        case LA_IceLatte01
        goal_collect_got_object goal_id = la_classic_goal_collect2 flag = got_1
        case LA_IceLatte02
        goal_collect_got_object goal_id = la_classic_goal_collect2 flag = got_2
        case LA_IceLatte03
        goal_collect_got_object goal_id = la_classic_goal_collect2 flag = got_3
        case LA_IceLatte04
        goal_collect_got_object goal_id = la_classic_goal_collect2 flag = got_4
        case LA_IceLatte05
        goal_collect_got_object goal_id = la_classic_goal_collect2 flag = got_5
    endswitch
    if NOT IsAlive name = <part>
        Create name = <part>
    endif
    wait 0.05000 seconds
    if IsAlive name = <part>
        StopParticleObject name = <part>
    endif
endscript


script LA_LowCarb 
    Kill name = <name>
    Kill name = <carb>
    playsound SmashCake
    switch <name>
        printf 'VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVvv'
        case LA_LowcarbPlatter01
        goal_collect_got_object goal_id = la_classic_goal_collect flag = got_1
        case LA_LowcarbPlatter02
        goal_collect_got_object goal_id = la_classic_goal_collect flag = got_2
        case LA_LowcarbPlatter03
        goal_collect_got_object goal_id = la_classic_goal_collect flag = got_3
        case LA_LowcarbPlatter04
        goal_collect_got_object goal_id = la_classic_goal_collect flag = got_4
        case LA_LowcarbPlatter05
        goal_collect_got_object goal_id = la_classic_goal_collect flag = got_5
    endswitch
    if NOT IsAlive name = <part>
        Create name = <part>
    endif
    wait 0.05000 seconds
    if IsAlive name = <part>
        StopParticleObject name = <part>
    endif
endscript


script LA_GapStart_PurpleGap 
    StartGap GapID = PurpGrab flags = [ REQUIRE_AIR CANCEL_GROUND ]
    StartGap GapID = PurpGrab2 flags = [ REQUIRE_AIR CANCEL_GROUND ] TrickText = 'BS Roll' TrickScript = LA_Classic_Gaps_Got1
    StartGap GapID = PurpGrab3 flags = [ REQUIRE_AIR CANCEL_GROUND ] TrickText = 'FS Roll' TrickScript = LA_Classic_Gaps_Got1
endscript


script LA_GapEnd_PurpleGap 
    endgap GapID = PurpGrab Score = 100 text = 'Purple Skippin\''
    endgap GapID = PurpGrab2
    endgap GapID = PurpGrab3
endscript


script LA_Classic_Gaps_Got1 
    GoalManager_SetGoalFlag name = LA_classic_goal_gaps2 got_1 1
endscript


script LA_Secret_Tape 
endscript

kg_whorecombo = 0

script LA_TeleHigh01 
    GetGap Score = 500 text = 'Production Drop'
    TeleportSkaterToNode nodeName = TRG_TeleHigh01 orient
    if GetFlag flag = FLAG_COMBO
        change kg_whorecombo = (kg_whorecombo + 1)
        if (kg_whorecombo = 1)
            FormatText textname = wcombo_text ' First Whoring '
            create_panel_message id = message_wcombo text = <wcombo_text> style = goal_collect_text
        else
            FormatText textname = wcombo_text ' Whored it %a Times' a = kg_whorecombo
            create_panel_message id = message_wcombo text = <wcombo_text> style = goal_collect_text
        endif
    endif
    SpawnScript LA_incombo
    if NOT GotParam cut
        create_panel_message {
            id = leaving_message
            text = 'Production Drop!'
            Pos = (320.0, 180.0)
            rgba = [118 , 110 , 14 , 128]
            pulse_blur
            start = 200
            Speed = 1
            Scale = 1.0
        }
    endif
    wait 5 seconds
    kill_panel_message_if_it_exists id = message_wcombo
endscript


script LA_Boost01 
    if NOT walking
        trigger_speed_boost Speed = 1300 DefSkaterVO = 1
    endif
endscript

FLAG_COMBO = 50

script LA_combo_check 
    printf 'lost combo'
    ClearExceptionGroup LA_skaterincombo
    UnSetFlag flag = FLAG_COMBO
    KillSpawnedScript name = LA_incombo
    change kg_whorecombo = 0
endscript


script LA_incombo 
    printf 'la in combo'
    SetFlag flag = FLAG_COMBO
    ClearExceptionGroup LA_skaterincombo
    SetException Ex = SkaterExitCombo scr = LA_combo_check group = LA_skaterincombo
    Block
endscript


script Ball_Nocomply 
    if NOT walking
        skater ::Boneless
        MakeSkaterGoto SkaterInit
    endif
endscript


script LA_Palms 
    if IsAlive name = <palm>
        GetTriggerArray spin onto
        if triggertype <trigger_array>
            GetBonus Score = 10000 text = 'Shredded Palm Tree!'
            ShatterAndDie name = <palm> area = 500 variance = 4 vel_x = 50 vel_y = 50 vel_z = 50 spread = 1 texture_swap = BA_cp_grass_mow_particle
            Kill name = <palm>
        endif
    endif
endscript

kg_circlebench = 0
kg_timesround = 0

script AP_circlebench 
    GetTriggerArray through
    if triggertype <trigger_array>
        change kg_circlebench = (kg_circlebench + 1)
        switch kg_circlebench
            case 4
            KillSpawnedScript name = AP_circbench_off
            ClearExceptionGroup AP_CircBench_grindcheck
            SpawnScript AP_circbench_off
            playsound HitPotty
            change kg_circlebench = 0
            change kg_timesround = (kg_timesround + 1)
            FormatText textname = circbench_text ' Around The Fountain %a Times' a = kg_timesround
            create_panel_message id = message_circbench text = <circbench_text> style = goal_collect_text
            printf ' bench '
        endswitch
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

kg_circlewall = 0
kg_timesroundwall = 0

script LA_circlewall 
    GetTriggerArray through
    if triggertype <trigger_array>
        if NOT InMultiPlayerGame
            PlaySkaterCamAnim {virtual_cam
                TargetID = world
                focus_skater
                targetOffset = (8815.5, -1541.4000244140625, 8563.2998046875)
                positionOffset = (340.29998779296875, -62.400001525878906, 3465.89990234375)
                frames = 24
                skippable = 0}
            change kg_circlewall = (kg_circlewall + 1)
            switch kg_circlewall
                case 4
                KillSpawnedScript name = LA_circwall_off
                ClearExceptionGroup LA_CircWall_grindcheck
                SpawnScript LA_circwall_off
                playsound HitPotty
                change kg_circlewall = 0
                change kg_timesroundwall = (kg_timesroundwall + 1)
                FormatText textname = circwall_text ' Around The Pillar %a Times' a = kg_timesroundwall
                create_panel_message id = message_circwall text = <circwall_text> style = goal_collect_text
                printf ' wall '
            endswitch
        endif
    endif
endscript


script LA_circwall_off 
    ClearExceptionGroup LA_CircWall_grindcheck
    seteventhandler Ex = SkaterJump scr = LA_circwall_reset group = LA_CircWall_grindcheck
    seteventhandler Ex = SkaterEnterBail scr = LA_circwall_reset group = LA_CircWall_grindcheck
    seteventhandler Ex = SkaterExitWall scr = LA_circwall_reset group = LA_CircWall_grindcheck
    seteventhandler Ex = SkaterEnterGround scr = LA_circwall_reset group = LA_CircWall_grindcheck
    seteventhandler Ex = SkaterEnterWalking scr = LA_circwall_reset group = LA_CircWall_grindcheck
    Block
endscript


script LA_circwall_reset 
    pulse_blur
    start = 100
    PlaySkaterCamAnim skater = 0 stop
    change kg_timesroundwall = 0
    ClearExceptionGroup LA_CircWall_grindcheck
    kill_panel_message_if_it_exists id = message_circwall
endscript


script LA_Flame 
    SpawnSkaterScript BO_FireParticlesOn
    SpawnSkaterScript BO_SmokeParticlesOn
    wait 5 seconds
    SpawnSkaterScript BO_FireParticlesOff
    SpawnSkaterScript BO_SmokeParticlesOff
endscript


script BO_FireParticlesOn 
    printf 'Fire'
    CreateFlexibleParticleSystem name = BurnMoFo params_script = APM_flamingBOARD_particle_params
endscript


script BO_FireParticlesOff 
    DestroyFlexibleParticleSystem name = BurnMoFo
endscript


script BO_SmokeParticlesOn 
    printf 'Smoke'
    CreateFlexibleParticleSystem name = SmokeyMoFo params_script = apm_OILYsmoke_particle_params
endscript


script BO_SmokeParticlesOff 
    DestroyFlexibleParticleSystem name = SmokeyMoFo
endscript


script LA_EasterEgg 
    GetTriggerArray wallplant onto
    if triggertype <trigger_array>
        GetGap text = 'Oh Yeahh! You Are Good!' Score = 10000
        playsound HitVideoGame1 pitch = randomrange (90.0, 120.0)
        nightvision_hud
        wait 20 frames
        really_kill_flicker_nightvision_hud
    endif
endscript

FLAG_MANUAL = 40

script LA_manualcheck_init 
    SpawnScript LA_skater_manual
endscript


script LA_skater_manual 
    ClearExceptionGroup LA_inmanual
    UnSetFlag flag = FLAG_MANUAL
    SetExceptionHandler Ex = SkaterEnterManual scr = LA_manual_active group = LA_inmanual
    Block
endscript


script LA_manual_active 
    ClearExceptionGroup LA_inmanual
    SetFlag flag = FLAG_MANUAL
    SetExceptionHandler Ex = SkaterExitManual scr = LA_skater_manual group = LA_inmanual
    Block
endscript

FLAG_ANDYTHPSDONE = 70
andythps_variable_X = 0

script LA_AndyManualS 
    StartGap GapID = Fuckoff flags = [ PURE_MANUAL CANCEL_AIR ]
    printf 'FFFFFFUUUUCCCCCKKKKK22222'
endscript


script LA_AndyManualE 
    endgap GapID = Fuckoff gapscript = LA_ANDYDONE
    printf 'FFFFFFUUUUCCCCCKKKKK111'
endscript


script LA_ANDYDONE 
    create_panel_block {id = Earthquake_text1
        text = 'YOU MANUALED THE ANDYTHPS BUNKER LEDGE!!!!'
        rgba = {255 , 157 , 157 , 253}
        style = earthquake_small_style3
        dims = (640.0, 25.0)
        time = 1000
        just = { RIGHT RIGHT }
        internal_just = { left left }
    }
    playsound Pcrowd16
    wait 60 frames
    playsound Pcrowd11
    wait 2 seconds
    DestroyScreenElement id = Earthquake_text1
endscript


script CPF_LA_BURN 
    if NOT InMultiPlayerGame
        skater ::KillSkater node = TRG_LA_Restart_Horse01 Message1 = 'Yowee!' message2 = 'Burnin\' Up' message3 = 'Too Hot' message4 = 'Burnt' r = 250 g = 0 b = 0
        playsound fire01 vol = 100 pitch = 100
        SetLightAmbientColor r = 0 g = 0 b = 0
        wait 3 seconds
        SetLightAmbientColor r = 50 g = 50 b = 50
        StopSound fire01
    endif
endscript


script TRG_LA_Car01Script 
    Car_Generic01
endscript


script LA_Car 
    Car_Generic01 StickToGround TurnDist = 40 DefaultSpeed = 35
endscript


script LA_Bushes 
    playsound BonkBush volume = 100 pitch = 100 dropoff = 5
endscript


script LA_Vibrate 
    if NOT InMultiPlayerGame
        begin 
        skater ::Vibrate_Controller_Safe actuator = 1 percent = 100
        wait 1 frames
        repeat 300
        skater ::Vibrate_Controller_Safe actuator = 1 percent = 0
    endif
endscript

FLAG_LA_DID_CAR_FALL = 23

script LA_Freeway_Break 
    SetFlag flag = FLAG_LA_DID_EARTHQUAKE
    playsound FenceBreak
    ShakeCamera duration = 5 vert_amp = 10 horiz_amp = 10 vert_vel = 2 horiz_vel = 4
    SpawnScript LA_Vibrate
    Create name = GO_FallingSign04
    Create prefix = 'Destroyed'
    Create name = Ground_Smoke_A30_UP
    Create name = Ground_Smoke_A30_UP01
    Create name = Ground_Smoke_A30_UP02
    Create name = Ground_Smoke_A30_UP03
    Create name = Ground_Smoke_A30_UP04
    Create name = Ground_Smoke_A30_UP05
    Create name = Ground_Smoke_A30_UP06
    Create name = Ground_Smoke_A30_UP07
    Create name = Ground_Smoke_A30_UP08
    Create name = Ground_Smoke_A30_UP09
    Create name = Ground_Smoke_A30_UP10
    Create name = Ground_Smoke_A30_UP11
    Create name = Ground_Smoke_A30_UP12
    Create name = Ground_Smoke_A30_UP13
    Create name = Ground_Smoke_A30_UP14
    Create name = Ground_Smoke_A30_UP15
    Create name = Ground_Smoke_A30_UP16
    Create name = Ground_Smoke_A30_UP17
    Create name = Ground_Smoke_A30_UP18
    Create name = Ground_Smoke_A30_UP19
    Create name = Ground_Smoke_A30_UP20
    Create name = Ground_Smoke_A30_UP21
    Create name = Ground_Smoke_A30_UP22
    Create name = Ground_Smoke_A30_UP23
    Create name = Ground_Smoke_A30_UP24
    Create name = Ground_Smoke_A30_UP25
    Create name = Ground_Smoke_A30_UP26
    Create name = Ground_Smoke_A30_UP27
    Create name = Ground_Smoke_A30_UP28
    Create name = Ground_Smoke_A30_UP29
    Create name = Ground_Smoke_A30_UP30
    Create name = Ground_Smoke_A30_UP31
    Create name = Ground_Smoke_A30_UP32
    Create name = Ground_Smoke_A30_UP33
    Create name = Ground_Smoke_A30_UP34
    Create name = Ground_Smoke_A30_UP35
    Create name = Ground_Smoke_A30_UP36
    Create name = Ground_Smoke_A30_UP37
    Create name = Ground_Smoke_A30_UP38
    Create name = Ground_Smoke_A30_UP39
    Create name = Ground_Smoke_A30_UP40
    Create name = Ground_Smoke_A30_UP41
    Create name = Ground_Smoke_A30_UP42
    Create name = Ground_Smoke_A30_UP43
    Create name = Ground_Smoke_A30_UP44
    Create name = Ground_Smoke_A30_UP45
    Create name = Ground_Smoke_A30_UP46
    Create name = Ground_Smoke_A30_UP47
    Create name = Ground_Smoke_A30_UP48
    Create name = Ground_Smoke_A30_UP49
    Create name = Ground_Smoke_A30_UP50
    Create name = Ground_Smoke_A30_UP51
    Create name = Ground_Smoke_A30_UP52
    Create name = Ground_Smoke_A30_UP53
    Create name = Car_Wash_BreakGO
    Create name = Ground_Smoke_A
    Create name = Ground_Smoke_A01
    Create name = Ground_Smoke_A02
    Create name = Ground_Smoke_A03
    Create name = Ground_Smoke_A04
    Create name = Ground_Smoke_A05
    Create name = Ground_Smoke_A06
    Create name = Ground_Smoke_A07
    Create name = Ground_Smoke_A08
    Create name = Ground_Smoke_A09
    Create name = Ground_Smoke_A10
    Create name = Ground_Smoke_A11
    Create name = Ground_Smoke_A12
    Create name = Ground_Smoke_A13
    Create name = Ground_Smoke_A14
    Create name = Ground_Smoke_A15
    Create name = Ground_Smoke_A16
    Create name = Ground_Smoke_A17
    Create name = Ground_Smoke_A18
    Create name = Ground_Smoke_A19
    Create name = Ground_Smoke_A20
    Create name = Ground_Smoke_A21
    Create name = Ground_Smoke_A22
    Create name = Ground_Smoke_A23
    Create name = Ground_Smoke_A24
    Create name = Ground_Smoke_A25
    Create name = Ground_Smoke_A26
    Create name = Ground_Smoke_A27
    Create name = Ground_Smoke_A28
    Create name = Ground_Smoke_A29
    VibrateOff
    Kill name = Overpass_Good_06
    Kill name = GO_WireWest_Good
    Kill prefix = CAR_DC_Shoe_Truck
    playsound HitLeaveWall
    create_panel_block {id = Earthquake_text
        font = dialog
        text = 'Earthquake'
        style = earthquake_style
        dims = (640.0, 25.0)
        time = 1000
        just = { left left }
        internal_just = { left left }
    }
    create_panel_block {id = Earthquake_text11
        text = 'Start The Earthquake Complete'
        rgba = {255 , 50 , 50 , 253}
        style = earthquake_small_style3
        dims = (640.0, 25.0)
        time = 1000
        just = { left left }
        internal_just = { left left }
    }
    Car_Wash_BreakGO ::obj_movetonode name = TRG_MOVE_CWGO02 time = 2
    Car_Wash_BreakGO ::obj_rotate absolute = (0.0, -20.0, 0.0) time = 1 flag_max_coords
    printf 'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF-----1'
    SpawnScript LA_Sign_Fall
    Create name = carwash_destroyed_04
    Create name = carwash_destroyed_05
    Create name = carwash_destroyed_06
    Create name = carwash_destroyed_07
    Create name = carwash_destroyed_08
    wait_and_kill_eq_text
    wait_and_kill_eq_text11
    Create name = carwash_destroyed_01
    Kill name = Car_Wash_BreakGO
    Kill name = Overpass_Good_01
    Kill name = Overpass_Good_03
    Kill name = Overpass_Good_04
    Kill name = Overpass_Good_05
    Kill name = Overpass_Good_07
    Kill name = Overpass_Good_09
    Kill name = carwash_good_02
    Kill name = carwash_good_03
    Kill name = carwash_good_01
    Create name = ADestroyed_01
    Create name = ADestroyed_02
    Create name = ADestroyed_03
    Create name = ADestroyed_04
    Create name = ADestroyed_06
    Create name = ADestroyed_07
    Create name = ADestroyed_08
    Create name = carwash_destroyed_09
    Create name = carwash_destroyed_02
    Create name = carwash_destroyed_03
    ADestroyed_08 ::obj_movetonode name = FREEWAY_MOVE_01 time = 2
    ADestroyed_08 ::obj_rotate absolute = (0.0, -45.0, 0.0) time = 3 flag_max_coords
    ADestroyed_03 ::obj_rotate absolute = (0.0, -0.699999988079071, 0.0) time = 6.500 flag_max_coords
    ADestroyed_04 ::obj_rotate absolute = (-10.0, -10.0, 0.0) time = 2.500 flag_max_coords
    ADestroyed_04 ::obj_movetonode name = Go_Earthquake_ADestroyed_04 time = 6
    ADestroyed_07 ::obj_rotate absolute = (-5.0, -25.0, 17.0) time = 2 flag_max_coords
    ADestroyed_07 ::obj_movetonode name = FREEWAY_MOVE_Back_01 time = 6
    wait 1 seconds
    Kill name = ADestroyed_01
    Kill name = ADestroyed_02
    Kill name = ADestroyed_03
    Kill name = ADestroyed_04
    Kill name = ADestroyed_06
    Kill name = ADestroyed_07
    Kill name = ADestroyed_08
    Create name = Overpass_Destroyed_01
    Create name = Overpass_Destroyed_04
    Create name = Overpass_Destroyed_05
    Create name = Overpass_Destroyed_06
    Create name = Overpass_Destroyed_07
    Create name = Overpass_Destroyed_10_Car
    Create name = Overpass_Destroyed_11
    Create name = Overpass_Destroyed_12
    Create name = Overpass_Destroyed_13
    Create prefix = 'Rubble01_'
    Create name = Overpass_Car_Rocking
    Create name = TRG_Rail_KenCar
    Create prefix = 'TRG_Rail_Overpass'
    Kill prefix = 'Rail_Freeway_'
    Create name = DestroyedCar_Geometry_07
    Create prefix = 'TRG_Rail_Overpass'
    Create name = TRGP_CarFall_E01
    Create name = TRGP_CarFall_E02
    Create name = TRGP_CarFall_E03
    Create name = GO_WireWest
    SpawnScript LA_Car_Rocking
    Kill prefix = 'falling_rocks'
    wait 5 seconds
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A30_UP }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A30_UP01 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A30_UP02 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A30_UP03 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A30_UP04 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A30_UP05 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A30_UP06 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A30_UP07 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A30_UP08 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A30_UP09 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A30_UP10 }
    wait 1 seconds
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A30_UP11 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A30_UP12 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A30_UP13 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A30_UP14 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A30_UP15 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A30_UP16 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A30_UP17 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A30_UP18 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A30_UP19 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A30_UP20 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A30_UP21 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A30_UP22 }
    wait 1 seconds
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A30_UP23 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A30_UP24 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A30_UP25 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A30_UP26 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A30_UP27 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A30_UP28 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A30_UP29 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A30_UP30 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A30_UP31 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A30_UP32 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A30_UP33 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A30_UP34 }
    wait 1 seconds
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A30_UP35 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A30_UP36 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A30_UP37 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A30_UP38 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A30_UP39 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A30_UP40 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A30_UP41 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A30_UP42 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A30_UP43 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A30_UP44 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A30_UP45 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A30_UP46 }
    wait 1 seconds
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A30_UP47 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A30_UP48 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A30_UP49 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A30_UP50 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A30_UP51 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A30_UP52 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A30_UP53 }
    wait 1 seconds
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A01 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A02 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A03 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A05 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A06 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A09 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A10 }
    wait 1 seconds
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A11 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A12 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A14 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A17 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A18 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A19 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A20 }
    wait 1 seconds
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A21 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A22 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A23 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A24 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A27 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A28 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A29 }
    wait 1 seconds
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A16 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A13 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A04 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A07 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A15 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A08 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A26 }
    SpawnScript StopParticleObject params = { name = Ground_Smoke_A25 }
endscript


script LA_Rocks_Falling 
    obj_setpathvelocity 7 mph
    obj_pathheading Off
    obj_followpathlinked
    wait 5 seconds
    printf 'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1'
    Die
endscript


script LA_Rocks_Falling1 
    obj_setpathvelocity 10 mph
    obj_pathheading Off
    obj_followpathlinked
    wait 5 seconds
    printf 'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1'
    Die
endscript


script LA_Rocks_Falling2 
    obj_setpathvelocity 12 mph
    obj_pathheading Off
    obj_followpathlinked
    wait 5 seconds
    printf 'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1'
    Die
endscript


script LA_Rocks_Falling3 
    obj_setpathvelocity 14 mph
    obj_pathheading Off
    obj_followpathlinked
    wait 5 seconds
    printf 'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1'
    Die
endscript


script LA_Car_Rocking 
    begin 
    if IsAlive name = Overpass_Car_Falling0001
        break 
    endif
    Overpass_Car_Rocking ::obj_rotate absolute = (-20.0, 0.0, 0.0) time = 1.200 flag_max_coords
    Overpass_Car_Rocking ::Obj_WaitMove
    wait 1.210 seconds
    if IsAlive name = Overpass_Car_Falling0001
        break 
    endif
    Overpass_Car_Rocking ::obj_rotate absolute = (-20.0, 0.0, 0.0) time = 1.200 flag_max_coords
    Overpass_Car_Rocking ::Obj_WaitMove
    wait 1.210 seconds
    repeat 
endscript


script TRG_Rail_Overpass69 
endscript


script extra_gay_style 
    setprops rgba = [ 255 55 55 255 ]
    DoMorph time = 0.1000 Pos = (320.0, 250.0)
    DoMorph time = 0.1000 Pos = (320.0, 120.0)
    Scale = 1
endscript


script earthquake_style 
    DoMorph Scale = 5
    begin 
    DoMorph time = 0.4000 Pos = (320.0, 250.0)
    DoMorph time = 0.4000 Pos = (320.0, 240.0)
    rgba = {255 , 0 , 0 , 128}
    repeat 5
endscript


script earthquake_small_style 
    Pos = (20.0, 10.0)
    DoMorph Scale = 1.200
    begin 
    DoMorph time = 0.3000 Pos = (280.0, 300.0)
    DoMorph time = 0.3000 Pos = (320.0, 280.0)
    rgba = {255 , 50 , 50 , 128}
    repeat 10
endscript


script earthquake_small_style1 
    Pos = (20.0, 10.0)
    DoMorph Scale = 1.200
    begin 
    DoMorph time = 0.1000 Pos = (320.0, 290.0)
    DoMorph time = 0.1000 Pos = (320.0, 280.0)
    rgba = {255 , 50 , 50 , 128}
    repeat 10
endscript


script earthquake_small_style2 
    Pos = (40.0, 10.0)
    DoMorph Scale = 1.200
    begin 
    DoMorph time = 0.1000 Pos = (320.0, 290.0)
    DoMorph time = 0.1000 Pos = (320.0, 280.0)
    rgba = {255 , 50 , 50 , 128}
    repeat 10
endscript


script earthquake_small_style3 
    Pos = (40.0, 10.0)
    DoMorph Scale = 1.200
    begin 
    DoMorph time = 0.1000 Pos = (320.0, 310.0)
    DoMorph time = 0.1000 Pos = (320.0, 300.0)
    rgba = {255 , 50 , 50 , 128}
    repeat 10
endscript


script LA_Bye_Gap 
    create_panel_block {id = Earthquake_text
        text = 'Bye-Bye!'
        rgba = {144 , 144 , 144 , 128}
        Pos = (320.0, 340.0)
        dims = (640.0, 25.0)
        time = 1000
        just = { left left }
        internal_just = { left left }
        style = earthquake_small_style
    }
    SpawnScript LA_Car_Wobble
    SpawnScript LA_Sign_Fall_Low
    SpawnScript wait_and_kill_eq_text
endscript


script LA_Car_Wobble 
    printf 'FUUUUCCKKKYOUUUUU1'
    printf 'FUUUUCCKKKYOUUUUU2'
    Create name = Overpass_Car_Falling0001
    Kill name = Overpass_Car_Rocking
    wait 0.1000 seconds
    Kill name = TRGP_CarFall_W
    Overpass_Car_Falling0001 ::obj_movetonode name = TRG_FallinCar_Nav04 time = 3
    wait 1 seconds
    Overpass_Car_Falling0001 ::obj_rotate absolute = (0.0, 0.0, -160.0) time = 1 flag_max_coords
    Overpass_Car_Falling0001 ::obj_movetonode name = TRG_FallinCar_Nav04 time = 3
    wait 0.1000 seconds
    Overpass_Car_Falling0001 ::obj_movetonode name = TRG_FallinCar_Nav05 time = 2
    wait 2 seconds
    Kill name = Overpass_Car_Falling0001
    Create name = DestroyedCar_Geometry_01
    Create name = DestroyedCar_Geometry_04
    Create name = DestroyedCar_Geometry_05
    Create name = DestroyedCar_Geometry_06
    Create name = DestroyedCar_Geometry_03
    Kill name = DestroyedCar_Geometry_07
    printf 'FUUUUCCKKKYOUUUUU3'
    Create name = DestroyedCar_Geometry_02
    Kill name = TRGP_CarFall_E01
    Kill name = TRGP_CarFall_E02
    Kill name = TRGP_CarFall_E03
    wait 2 seconds
    Kill name = TRG_Rail_KenCar
    Kill name = TRG_Rail_Overpass25
    Kill name = TRG_Rail_Overpass26
    Kill name = TRG_Rail_Overpass27
    Kill name = TRG_Rail_Overpass68
    Kill name = TRG_Rail_Overpass69
    Kill name = TRG_Rail_Overpass70
    Kill name = TRG_Rail_Overpass76
    printf 'FUUUUCCKKKYOUUUUU4'
    Create name = EARTHQUAKE04
    Create name = EARTHQUAKE05
    Create name = EARTHQUAKE06
    Create name = EARTHQUAKE07
    Create name = EARTHQUAKE08
    Create name = EARTHQUAKE09
    Create name = EARTHQUAKE10
    Create name = EARTHQUAKE11
endscript


script LA_Sign_Fall 
    Kill name = FallingSign
    Create name = GO_FallingSign
    Kill name = GO_WireEast_Start
    GO_FallingSign ::obj_movetonode name = TRG_FallinSign_Nav01 time = 2
    Kill name = GO_WireWest
    wait 1.600 seconds
    playsound HitLeaveWall
    Kill name = GO_FallingSign
    Create name = GO_FallingSign2
    Create name = FREEWAY_SIGN_TRIGER02
    Create name = FREEWAY_SIGN_TRIGER03
    Create name = FREEWAY_SIGN_TRIGER04
    Create name = FREEWAY_SIGN_TRIGER05
    Create name = TRG_SignGetToRail
    Create name = GO_WireEast_Hang
    Create name = GO_WireEast
    Kill name = GO_FallingSign04
    begin 
    if IsAlive name = GO_FallingSign03
        break 
    endif
    GO_FallingSign2 ::obj_rotate absolute = (60.0, 0.0, 0.0) time = 1.300 flag_max_coords
    GO_FallingSign2 ::Obj_WaitMove
    wait 1.310 seconds
    if IsAlive name = GO_FallingSign03
        break 
    endif
    GO_FallingSign2 ::obj_rotate absolute = (-60.0, 0.0, 0.0) time = 1.300 flag_max_coords
    GO_FallingSign2 ::Obj_WaitMove
    wait 1.310 seconds
    if IsAlive name = GO_FallingSign03
        break 
    endif
    repeat 1000
endscript


script wait_and_kill_eq_text 
    if NOT IsAlive name = Northern
        wait 1 seconds
        DestroyScreenElement id = Earthquake_text
    endif
    if IsAlive name = Northern
        DestroyScreenElement id = Earthquake_text
    endif
endscript


script wait_and_kill_eq_text1 
    if NOT IsAlive name = Northern
        wait 1 seconds
        DestroyScreenElement id = Earthquake_text1
    endif
    if IsAlive name = Northern
        DestroyScreenElement id = Earthquake_text1
    endif
endscript


script wait_and_kill_eq_text11 
    if NOT IsAlive name = Northern
        wait 1 seconds
        DestroyScreenElement id = Earthquake_text11
    endif
    if IsAlive name = Northern
        DestroyScreenElement id = Earthquake_text11
    endif
endscript


script wait_and_kill_eq_text2 
    if NOT IsAlive name = Northern
        wait 1 seconds
        DestroyScreenElement id = Earthquake_text2
    endif
    if IsAlive name = Northern
        DestroyScreenElement id = Earthquake_text2
    endif
endscript


script LA_Sign_Fall_Low 
    SpawnScript CarCam_01
    PauseSkaters
    if NOT IsAlive name = GO_FallingSign03
        if IsAlive name = TRG_Rail_Overpass80
        endif
        Create name = GO_FallingSign03
        Kill name = GO_FallingSign2
        Kill name = GO_WireEast_Hang
        Kill name = GO_WireEast
        wait 0.1000 seconds
        GO_FallingSign03 ::obj_rotate absolute = (110.0, 0.0, 0.0) time = 1 flag_max_coords
        GO_FallingSign03 ::obj_movetonode name = TRG_FallinSign2_Nav01 time = 2
        wait 2 seconds
        Kill name = GO_FallingSign03
        Create name = FallingSign01
        Create name = TRG_Looter_Rails01
        Create name = TRG_Looter_Rails02
        Create name = TRG_Looter_Rails03
        Create name = TRG_Looter_Rails04
        Create name = TRG_Sign_Fall_Low02
        Create name = TRG_Sign_Fall_Low03
        Create name = TRG_Sign_Fall_Low07
        Create name = TRG_Sign_Fall_Low08
        Create name = TRG_Sign_Fall_Low09
        Create name = TRG_Sign_Fall_Low22
        Create name = TRG_Sign_Fall_Low23
        Create name = TRG_Sign_Fall_Low24
        Create name = TRG_Sign_Fall_Low25
        Create name = TRG_Sign_Fall_Low26
        Create name = EARTHQUAKE13
        wait 2.500 seconds
        UnpauseSkaters
    endif
endscript


script CarCam_01 
    PlaySkaterCamAnim name = Cam_carfall
    printf 'wait'
    begin 
    if SkaterCamAnimFinished name = Cam_carfall
        break 
    endif
    wait 2 frames
    repeat 
endscript

FLAG_LA_RAIL1 = 25
FLAG_LA_RAIL2 = 26
FLAG_LA_RAIL3 = 27
FLAG_LA_RAIL4 = 28
FLAG_LA_DID_EARTHQUAKE = 30
FLAG_LA_TEXT1 = 31
FLAG_LA_TEXT2 = 32
FLAG_LA_TEXT3 = 33
FLAG_LA_TEXT4 = 35

script LA_Gap_Net_NG_Start 
    StartGap flags = [ REQUIRE_RAIL CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
    endgap text = 'NorthernTremor!' Score = 100
endscript


script LA_Gap_Net_SG_Start 
    StartGap flags = [ REQUIRE_RAIL CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
    endgap text = 'SouthernTremor!' Score = 100
endscript


script LA_Gap_Net_EG_Start 
    StartGap flags = [ REQUIRE_RAIL CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
    endgap text = 'EasternTremor!' Score = 100
endscript


script LA_Gap_Net_WG_Start 
    StartGap flags = [ REQUIRE_RAIL CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
    endgap text = 'WesternTremor!' Score = 100
endscript


script LA_Gap_NG_Start 
    StartGap GapID = ng_Start1 flags = [ REQUIRE_RAIL CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript

kg_variable_X = 0

script LA_Gap_NG_End 
    endgap GapID = ng_Start1 text = 'NorthernTremor!' Score = 100
    if NOT InMultiPlayerGame
        GetBonus Score = 1000 text = 'CRUNCH!'
        printstruct <...> 
        switch kg_variable_X
            case 0
            printf 'WHORE1!!!!!!!!!!!!'
            PlayStream La_quake1_rumble vol = 200 priority = StreamPriorityHigh
            printf 'WHORE2!!!!!!!!!!!!'
            SetFlag flag = FLAG_LA_RAIL4
            ShakeCamera duration = 1.300 vert_amp = 8 horiz_amp = 8 vert_vel = 2 horiz_vel = 4
            skater ::vibrate percent = 75 duration = 1000 actuator = 1
            create_panel_block {id = Earthquake_text2
                text = 'Northern Quake Rail!'
                rgba = {255 , 50 , 50 , 253}
                style = earthquake_small_style
                dims = (640.0, 25.0)
                time = 1000
                just = { left left }
                internal_just = { left left }
            }
            wait 1 seconds
            VibrateOff
            SpawnScript wait_and_kill_eq_text2
            change kg_variable_X = 1
        endswitch
        if NOT GetFlag flag = FLAG_LA_DID_EARTHQUAKE
            if GetFlag flag = FLAG_LA_RAIL1
                if GetFlag flag = FLAG_LA_RAIL2
                    if GetFlag flag = FLAG_LA_RAIL3
                        if GetFlag flag = FLAG_LA_RAIL4
                            LA_Freeway_Break
                        endif
                    endif
                endif
            endif
        endif
    endif
endscript

kg_variable_Y = 0

script LA_Gap_SG_Start 
    StartGap GapID = sg_Start1 flags = [ REQUIRE_RAIL CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script LA_Gap_SG_End 
    endgap GapID = sg_Start1 text = 'SouthernTremor!' Score = 100
    if NOT InMultiPlayerGame
        GetBonus Score = 1000 text = 'CRUNCH!'
        printstruct <...> 
        switch kg_variable_Y
            case 0
            PlayStream La_quake1_rumble vol = 200 priority = StreamPriorityHigh
            SetFlag flag = FLAG_LA_RAIL1
            ShakeCamera duration = 1.300 vert_amp = 8 horiz_amp = 8 vert_vel = 2 horiz_vel = 4
            skater ::vibrate percent = 75 duration = 1000 actuator = 1
            create_panel_block {id = Earthquake_text1
                text = 'Southern Quake Rail!'
                rgba = {255 , 50 , 50 , 253}
                style = earthquake_small_style
                dims = (640.0, 25.0)
                time = 1000
                just = { left left }
                internal_just = { left left }
            }
            wait 1 seconds
            VibrateOff
            SpawnScript wait_and_kill_eq_text1
            change kg_variable_Y = 1
        endswitch
        if NOT GetFlag flag = FLAG_LA_DID_EARTHQUAKE
            if GetFlag flag = FLAG_LA_RAIL1
                if GetFlag flag = FLAG_LA_RAIL2
                    if GetFlag flag = FLAG_LA_RAIL3
                        if GetFlag flag = FLAG_LA_RAIL4
                            LA_Freeway_Break
                        endif
                    endif
                endif
            endif
        endif
    endif
endscript

kg_variable_Z = 0

script LA_Gap_EG_Start 
    StartGap GapID = eg_Start1 flags = [ REQUIRE_RAIL CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script LA_Gap_EG_End 
    endgap GapID = eg_Start1 text = 'EasternTremor!' Score = 100
    if NOT InMultiPlayerGame
        GetBonus Score = 1000 text = 'CRUNCH!'
        printstruct <...> 
        switch kg_variable_Z
            case 0
            PlayStream La_quake1_rumble vol = 200 priority = StreamPriorityHigh
            SetFlag flag = FLAG_LA_RAIL2
            ShakeCamera duration = 1.300 vert_amp = 8 horiz_amp = 8 vert_vel = 2 horiz_vel = 4
            skater ::vibrate percent = 75 duration = 1000 actuator = 1
            create_panel_block {id = Earthquake_text1
                text = 'Eastern Quake Rail!'
                rgba = {255 , 50 , 50 , 253}
                style = earthquake_small_style
                dims = (640.0, 25.0)
                time = 1000
                just = { left left }
                internal_just = { left left }
            }
            wait 1 seconds
            VibrateOff
            SpawnScript wait_and_kill_eq_text1
            change kg_variable_Z = 1
        endswitch
        if NOT GetFlag flag = FLAG_LA_DID_EARTHQUAKE
            if GetFlag flag = FLAG_LA_RAIL1
                if GetFlag flag = FLAG_LA_RAIL2
                    if GetFlag flag = FLAG_LA_RAIL3
                        if GetFlag flag = FLAG_LA_RAIL4
                            LA_Freeway_Break
                        endif
                    endif
                endif
            endif
        endif
    endif
endscript

kg_variable_A = 0

script LA_Gap_WG_Start 
    StartGap GapID = wg_Start1 flags = [ REQUIRE_RAIL CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script LA_Gap_WG_End 
    endgap GapID = wg_Start1 text = 'WesternTremor!' Score = 100
    if NOT InMultiPlayerGame
        GetBonus Score = 1000 text = 'CRUNCH!'
        switch kg_variable_A
            case 0
            PlayStream La_quake1_rumble vol = 200 priority = StreamPriorityHigh
            SetFlag flag = FLAG_LA_RAIL3
            ShakeCamera duration = 1.300 vert_amp = 8 horiz_amp = 8 vert_vel = 2 horiz_vel = 4
            skater ::vibrate percent = 75 duration = 1000 actuator = 1
            create_panel_block {id = Earthquake_text1
                text = 'Western Quake Rail!'
                rgba = {255 , 50 , 50 , 253}
                style = earthquake_small_style
                dims = (640.0, 25.0)
                time = 1000
                just = { left left }
                internal_just = { left left }
            }
            wait 1 seconds
            VibrateOff
            SpawnScript wait_and_kill_eq_text1
            change kg_variable_A = 1
        endswitch
        if NOT GetFlag flag = FLAG_LA_DID_EARTHQUAKE
            if GetFlag flag = FLAG_LA_RAIL1
                if GetFlag flag = FLAG_LA_RAIL2
                    if GetFlag flag = FLAG_LA_RAIL3
                        if GetFlag flag = FLAG_LA_RAIL4
                            LA_Freeway_Break
                        endif
                    endif
                endif
            endif
        endif
    endif
endscript


script LA_Trash_Blown01 
    Kill name = Blown_TRG_01
    playsound BonkBush volume = 100 pitch = 100 dropoff = 5
    Create name = GO_BlownTrash34
    Create name = GO_BlownTrash37
    Create name = GO_BlownTrash38
    Create name = GO_BlownTrash41
    Create name = GO_BlownTrash42
    Create name = GO_BlownTrash43
    GO_BlownTrash34 ::obj_movetorelpos (0.0, 30.0, 0.0) Speed = 5
    GO_BlownTrash37 ::obj_movetorelpos (0.0, 30.0, 0.0) Speed = 5
    GO_BlownTrash38 ::obj_movetorelpos (0.0, 30.0, 0.0) Speed = 5
    GO_BlownTrash41 ::obj_movetorelpos (0.0, 30.0, 0.0) Speed = 5
    GO_BlownTrash42 ::obj_movetorelpos (0.0, 30.0, 0.0) Speed = 5
    GO_BlownTrash43 ::obj_movetorelpos (0.0, 30.0, 0.0) Speed = 5
    GO_BlownTrash34 ::obj_rotate absolute = (0.0, 120.0, 0.0) time = 1 flag_max_coords
    GO_BlownTrash37 ::obj_rotate absolute = (0.0, -120.0, 0.0) time = 1 flag_max_coords
    GO_BlownTrash38 ::obj_rotate absolute = (0.0, 120.0, 0.0) time = 1 flag_max_coords
    GO_BlownTrash41 ::obj_rotate absolute = (0.0, -90.0, 0.0) time = 1 flag_max_coords
    GO_BlownTrash42 ::obj_rotate absolute = (0.0, 120.0, 0.0) time = 1 flag_max_coords
    GO_BlownTrash43 ::obj_rotate absolute = (0.0, 65.0, 0.0) time = 1 flag_max_coords
    wait 0.5000 seconds
    GO_BlownTrash34 ::obj_rotate absolute = (0.0, 240.0, 0.0) time = 1 flag_max_coords
    GO_BlownTrash37 ::obj_rotate absolute = (0.0, -240.0, 0.0) time = 1 flag_max_coords
    GO_BlownTrash38 ::obj_rotate absolute = (0.0, 240.0, 0.0) time = 1 flag_max_coords
    GO_BlownTrash41 ::obj_rotate absolute = (0.0, -180.0, 0.0) time = 1 flag_max_coords
    GO_BlownTrash42 ::obj_rotate absolute = (0.0, 240.0, 0.0) time = 1 flag_max_coords
    GO_BlownTrash43 ::obj_rotate absolute = (0.0, 130.0, 0.0) time = 1 flag_max_coords
    GO_BlownTrash34 ::obj_movetorelpos (0.0, -60.0, 0.0) Speed = 5
    GO_BlownTrash37 ::obj_movetorelpos (0.0, -60.0, 0.0) Speed = 5
    GO_BlownTrash38 ::obj_movetorelpos (0.0, -60.0, 0.0) Speed = 5
    GO_BlownTrash41 ::obj_movetorelpos (0.0, -60.0, 0.0) Speed = 5
    GO_BlownTrash42 ::obj_movetorelpos (0.0, -60.0, 0.0) Speed = 5
    GO_BlownTrash43 ::obj_movetorelpos (0.0, -60.0, 0.0) Speed = 5
    wait 1 seconds
    Kill name = GO_BlownTrash34
    Kill name = GO_BlownTrash37
    Kill name = GO_BlownTrash38
    Kill name = GO_BlownTrash41
    Kill name = GO_BlownTrash42
    Kill name = GO_BlownTrash43
    Create name = Blown_TRG_01
endscript


script LA_Trash_Blown03 
    playsound BonkBush volume = 100 pitch = 100 dropoff = 5
    Kill name = Blown_TRG_03
    Create name = GO_BlownTrash08
    Create name = GO_BlownTrash09
    Create name = GO_BlownTrash11
    Create name = GO_BlownTrash12
    GO_BlownTrash08 ::obj_movetorelpos (0.0, 30.0, 0.0) Speed = 5
    GO_BlownTrash09 ::obj_movetorelpos (0.0, 30.0, 0.0) Speed = 5
    GO_BlownTrash11 ::obj_movetorelpos (0.0, 30.0, 0.0) Speed = 5
    GO_BlownTrash12 ::obj_movetorelpos (0.0, 30.0, 0.0) Speed = 5
    GO_BlownTrash08 ::obj_rotate absolute = (0.0, 120.0, 0.0) time = 1 flag_max_coords
    GO_BlownTrash09 ::obj_rotate absolute = (0.0, -120.0, 0.0) time = 1 flag_max_coords
    GO_BlownTrash11 ::obj_rotate absolute = (0.0, 120.0, 0.0) time = 1 flag_max_coords
    GO_BlownTrash12 ::obj_rotate absolute = (0.0, -90.0, 0.0) time = 1 flag_max_coords
    wait 0.5000 seconds
    GO_BlownTrash08 ::obj_rotate absolute = (0.0, 240.0, 0.0) time = 1 flag_max_coords
    GO_BlownTrash09 ::obj_rotate absolute = (0.0, -240.0, 0.0) time = 1 flag_max_coords
    GO_BlownTrash11 ::obj_rotate absolute = (0.0, 240.0, 0.0) time = 1 flag_max_coords
    GO_BlownTrash12 ::obj_rotate absolute = (0.0, -180.0, 0.0) time = 1 flag_max_coords
    GO_BlownTrash08 ::obj_movetorelpos (0.0, -60.0, 0.0) Speed = 5
    GO_BlownTrash09 ::obj_movetorelpos (0.0, -60.0, 0.0) Speed = 5
    GO_BlownTrash11 ::obj_movetorelpos (0.0, -60.0, 0.0) Speed = 5
    GO_BlownTrash12 ::obj_movetorelpos (0.0, -60.0, 0.0) Speed = 5
    wait 1 seconds
    Kill name = GO_BlownTrash08
    Kill name = GO_BlownTrash09
    Kill name = GO_BlownTrash11
    Kill name = GO_BlownTrash12
    Create name = Blown_TRG_03
endscript


script LA_Trash_Blown04 
    playsound BonkBush volume = 100 pitch = 100 dropoff = 5
    Kill name = Blown_TRG_04
    Create name = GO_BlownTrash47
    Create name = GO_BlownTrash50
    GO_BlownTrash47 ::obj_movetorelpos (0.0, 30.0, 0.0) Speed = 5
    GO_BlownTrash50 ::obj_movetorelpos (0.0, 30.0, 0.0) Speed = 5
    GO_BlownTrash47 ::obj_rotate absolute = (0.0, 120.0, 0.0) time = 1 flag_max_coords
    GO_BlownTrash50 ::obj_rotate absolute = (0.0, -120.0, 0.0) time = 1 flag_max_coords
    wait 0.5000 seconds
    GO_BlownTrash47 ::obj_rotate absolute = (0.0, 240.0, 0.0) time = 1 flag_max_coords
    GO_BlownTrash50 ::obj_rotate absolute = (0.0, -240.0, 0.0) time = 1 flag_max_coords
    GO_BlownTrash47 ::obj_movetorelpos (0.0, -60.0, 0.0) Speed = 5
    GO_BlownTrash50 ::obj_movetorelpos (0.0, -60.0, 0.0) Speed = 5
    wait 1 seconds
    Kill name = GO_BlownTrash47
    Kill name = GO_BlownTrash50
    Create name = Blown_TRG_04
endscript


script LA_Trash_Blown08 
    playsound BonkBush volume = 100 pitch = 100 dropoff = 5
    Kill name = Blown_TRG_08
    Create name = GO_BlownTrash01
    GO_BlownTrash01 ::obj_movetorelpos (0.0, 30.0, 0.0) Speed = 5
    GO_BlownTrash01 ::obj_rotate absolute = (0.0, 120.0, 0.0) time = 1 flag_max_coords
    wait 0.5000 seconds
    GO_BlownTrash01 ::obj_rotate absolute = (0.0, 240.0, 0.0) time = 1 flag_max_coords
    GO_BlownTrash01 ::obj_movetorelpos (0.0, -60.0, 0.0) Speed = 5
    wait 1 seconds
    Kill name = GO_BlownTrash01
    Create name = Blown_TRG_08
endscript


script LA_Trash_Blown05 
    playsound BonkBush volume = 100 pitch = 100 dropoff = 5
    Kill name = Blown_TRG_05
    Create name = GO_BlownTrash53
    Create name = GO_BlownTrash55
    Create name = GO_BlownTrash56
    Create name = GO_BlownTrash57
    Create name = GO_BlownTrash58
    Create name = GO_BlownTrash59
    GO_BlownTrash53 ::obj_movetorelpos (0.0, 30.0, 0.0) Speed = 5
    GO_BlownTrash55 ::obj_movetorelpos (0.0, 30.0, 0.0) Speed = 5
    GO_BlownTrash56 ::obj_movetorelpos (0.0, 30.0, 0.0) Speed = 5
    GO_BlownTrash57 ::obj_movetorelpos (0.0, 30.0, 0.0) Speed = 5
    GO_BlownTrash58 ::obj_movetorelpos (0.0, 30.0, 0.0) Speed = 5
    GO_BlownTrash59 ::obj_movetorelpos (0.0, 30.0, 0.0) Speed = 5
    GO_BlownTrash53 ::obj_rotate absolute = (0.0, 120.0, 0.0) time = 1 flag_max_coords
    GO_BlownTrash55 ::obj_rotate absolute = (0.0, -120.0, 0.0) time = 1 flag_max_coords
    GO_BlownTrash56 ::obj_rotate absolute = (0.0, 120.0, 0.0) time = 1 flag_max_coords
    GO_BlownTrash57 ::obj_rotate absolute = (0.0, -90.0, 0.0) time = 1 flag_max_coords
    GO_BlownTrash58 ::obj_rotate absolute = (0.0, 120.0, 0.0) time = 1 flag_max_coords
    GO_BlownTrash59 ::obj_rotate absolute = (0.0, 65.0, 0.0) time = 1 flag_max_coords
    wait 0.5000 seconds
    GO_BlownTrash53 ::obj_rotate absolute = (0.0, 240.0, 0.0) time = 1 flag_max_coords
    GO_BlownTrash55 ::obj_rotate absolute = (0.0, -240.0, 0.0) time = 1 flag_max_coords
    GO_BlownTrash56 ::obj_rotate absolute = (0.0, 240.0, 0.0) time = 1 flag_max_coords
    GO_BlownTrash57 ::obj_rotate absolute = (0.0, -180.0, 0.0) time = 1 flag_max_coords
    GO_BlownTrash58 ::obj_rotate absolute = (0.0, 240.0, 0.0) time = 1 flag_max_coords
    GO_BlownTrash59 ::obj_rotate absolute = (0.0, 130.0, 0.0) time = 1 flag_max_coords
    GO_BlownTrash53 ::obj_movetorelpos (0.0, -60.0, 0.0) Speed = 5
    GO_BlownTrash55 ::obj_movetorelpos (0.0, -60.0, 0.0) Speed = 5
    GO_BlownTrash56 ::obj_movetorelpos (0.0, -60.0, 0.0) Speed = 5
    GO_BlownTrash57 ::obj_movetorelpos (0.0, -60.0, 0.0) Speed = 5
    GO_BlownTrash58 ::obj_movetorelpos (0.0, -60.0, 0.0) Speed = 5
    GO_BlownTrash59 ::obj_movetorelpos (0.0, -60.0, 0.0) Speed = 5
    wait 1 seconds
    Kill name = GO_BlownTrash53
    Kill name = GO_BlownTrash55
    Kill name = GO_BlownTrash56
    Kill name = GO_BlownTrash57
    Kill name = GO_BlownTrash58
    Kill name = GO_BlownTrash59
    Create name = Blown_TRG_05
endscript


script LA_Trash_Blown06 
    playsound BonkBush volume = 100 pitch = 100 dropoff = 5
    Kill name = Blown_TRG_06
    Create name = GO_BlownTrash64
    Create name = GO_BlownTrash65
    Create name = GO_BlownTrash67
    Create name = GO_BlownTrash68
    Create name = GO_BlownTrash74
    Create name = GO_BlownTrash75
    GO_BlownTrash64 ::obj_movetorelpos (0.0, 30.0, 0.0) Speed = 5
    GO_BlownTrash65 ::obj_movetorelpos (0.0, 30.0, 0.0) Speed = 5
    GO_BlownTrash67 ::obj_movetorelpos (0.0, 30.0, 0.0) Speed = 5
    GO_BlownTrash68 ::obj_movetorelpos (0.0, 30.0, 0.0) Speed = 5
    GO_BlownTrash74 ::obj_movetorelpos (0.0, 30.0, 0.0) Speed = 5
    GO_BlownTrash75 ::obj_movetorelpos (0.0, 30.0, 0.0) Speed = 5
    GO_BlownTrash64 ::obj_rotate absolute = (0.0, 120.0, 0.0) time = 1 flag_max_coords
    GO_BlownTrash65 ::obj_rotate absolute = (0.0, -120.0, 0.0) time = 1 flag_max_coords
    GO_BlownTrash67 ::obj_rotate absolute = (0.0, 120.0, 0.0) time = 1 flag_max_coords
    GO_BlownTrash68 ::obj_rotate absolute = (0.0, -90.0, 0.0) time = 1 flag_max_coords
    GO_BlownTrash74 ::obj_rotate absolute = (0.0, 120.0, 0.0) time = 1 flag_max_coords
    GO_BlownTrash75 ::obj_rotate absolute = (0.0, 65.0, 0.0) time = 1 flag_max_coords
    wait 0.5000 seconds
    GO_BlownTrash64 ::obj_rotate absolute = (0.0, 240.0, 0.0) time = 1 flag_max_coords
    GO_BlownTrash65 ::obj_rotate absolute = (0.0, -240.0, 0.0) time = 1 flag_max_coords
    GO_BlownTrash67 ::obj_rotate absolute = (0.0, 240.0, 0.0) time = 1 flag_max_coords
    GO_BlownTrash68 ::obj_rotate absolute = (0.0, -180.0, 0.0) time = 1 flag_max_coords
    GO_BlownTrash74 ::obj_rotate absolute = (0.0, 240.0, 0.0) time = 1 flag_max_coords
    GO_BlownTrash75 ::obj_rotate absolute = (0.0, 130.0, 0.0) time = 1 flag_max_coords
    GO_BlownTrash64 ::obj_movetorelpos (0.0, -60.0, 0.0) Speed = 5
    GO_BlownTrash65 ::obj_movetorelpos (0.0, -60.0, 0.0) Speed = 5
    GO_BlownTrash67 ::obj_movetorelpos (0.0, -60.0, 0.0) Speed = 5
    GO_BlownTrash68 ::obj_movetorelpos (0.0, -60.0, 0.0) Speed = 5
    GO_BlownTrash74 ::obj_movetorelpos (0.0, -60.0, 0.0) Speed = 5
    GO_BlownTrash75 ::obj_movetorelpos (0.0, -60.0, 0.0) Speed = 5
    wait 1 seconds
    Kill name = GO_BlownTrash64
    Kill name = GO_BlownTrash65
    Kill name = GO_BlownTrash67
    Kill name = GO_BlownTrash68
    Kill name = GO_BlownTrash74
    Kill name = GO_BlownTrash75
    Create name = Blown_TRG_06
endscript


script LA_Trash_Blown07 
    playsound BonkBush volume = 100 pitch = 100 dropoff = 5
    Kill name = Blown_TRG_07
    Create name = GO_BlownTrash81
    Create name = GO_BlownTrash83
    GO_BlownTrash81 ::obj_movetorelpos (0.0, 30.0, 0.0) Speed = 5
    GO_BlownTrash83 ::obj_movetorelpos (0.0, 30.0, 0.0) Speed = 5
    GO_BlownTrash81 ::obj_rotate absolute = (0.0, 120.0, 0.0) time = 1 flag_max_coords
    GO_BlownTrash83 ::obj_rotate absolute = (0.0, -120.0, 0.0) time = 1 flag_max_coords
    wait 0.5000 seconds
    GO_BlownTrash81 ::obj_rotate absolute = (0.0, 240.0, 0.0) time = 1 flag_max_coords
    GO_BlownTrash83 ::obj_rotate absolute = (0.0, -240.0, 0.0) time = 1 flag_max_coords
    GO_BlownTrash81 ::obj_movetorelpos (0.0, -60.0, 0.0) Speed = 5
    GO_BlownTrash83 ::obj_movetorelpos (0.0, -60.0, 0.0) Speed = 5
    wait 1 seconds
    Kill name = GO_BlownTrash81
    Kill name = GO_BlownTrash83
    Create name = Blown_TRG_07
endscript


script LA_Trash_Blown02 
    playsound BonkBush volume = 100 pitch = 100 dropoff = 5
    Kill name = Blown_TRG_02
    Create name = GO_BlownTrash13
    Create name = GO_BlownTrash15
    Create name = GO_BlownTrash17
    Create name = GO_BlownTrash18
    Create name = GO_BlownTrash20
    Create name = GO_BlownTrash25
    Create name = GO_BlownTrash26
    GO_BlownTrash13 ::obj_movetorelpos (0.0, 30.0, 0.0) Speed = 5
    GO_BlownTrash15 ::obj_movetorelpos (0.0, 30.0, 0.0) Speed = 5
    GO_BlownTrash17 ::obj_movetorelpos (0.0, 30.0, 0.0) Speed = 5
    GO_BlownTrash18 ::obj_movetorelpos (0.0, 30.0, 0.0) Speed = 5
    GO_BlownTrash20 ::obj_movetorelpos (0.0, 30.0, 0.0) Speed = 5
    GO_BlownTrash25 ::obj_movetorelpos (0.0, 30.0, 0.0) Speed = 5
    GO_BlownTrash26 ::obj_movetorelpos (0.0, 30.0, 0.0) Speed = 5
    GO_BlownTrash13 ::obj_rotate absolute = (0.0, 120.0, 0.0) time = 1 flag_max_coords
    GO_BlownTrash15 ::obj_rotate absolute = (0.0, -120.0, 0.0) time = 1 flag_max_coords
    GO_BlownTrash17 ::obj_rotate absolute = (0.0, 120.0, 0.0) time = 1 flag_max_coords
    GO_BlownTrash18 ::obj_rotate absolute = (0.0, -90.0, 0.0) time = 1 flag_max_coords
    GO_BlownTrash20 ::obj_rotate absolute = (0.0, 65.0, 0.0) time = 1 flag_max_coords
    GO_BlownTrash25 ::obj_rotate absolute = (0.0, -130.0, 0.0) time = 1 flag_max_coords
    GO_BlownTrash26 ::obj_rotate absolute = (0.0, 65.0, 0.0) time = 1 flag_max_coords
    wait 0.5000 seconds
    GO_BlownTrash13 ::obj_rotate absolute = (0.0, 240.0, 0.0) time = 1 flag_max_coords
    GO_BlownTrash15 ::obj_rotate absolute = (0.0, -240.0, 0.0) time = 1 flag_max_coords
    GO_BlownTrash17 ::obj_rotate absolute = (0.0, 240.0, 0.0) time = 1 flag_max_coords
    GO_BlownTrash18 ::obj_rotate absolute = (0.0, -180.0, 0.0) time = 1 flag_max_coords
    GO_BlownTrash20 ::obj_rotate absolute = (0.0, 130.0, 0.0) time = 1 flag_max_coords
    GO_BlownTrash25 ::obj_rotate absolute = (0.0, -260.0, 0.0) time = 1 flag_max_coords
    GO_BlownTrash26 ::obj_rotate absolute = (0.0, 130.0, 0.0) time = 1 flag_max_coords
    GO_BlownTrash13 ::obj_movetorelpos (0.0, -60.0, 0.0) Speed = 5
    GO_BlownTrash15 ::obj_movetorelpos (0.0, -60.0, 0.0) Speed = 5
    GO_BlownTrash17 ::obj_movetorelpos (0.0, -60.0, 0.0) Speed = 5
    GO_BlownTrash18 ::obj_movetorelpos (0.0, -60.0, 0.0) Speed = 5
    GO_BlownTrash20 ::obj_movetorelpos (0.0, -60.0, 0.0) Speed = 5
    GO_BlownTrash25 ::obj_movetorelpos (0.0, -60.0, 0.0) Speed = 5
    GO_BlownTrash26 ::obj_movetorelpos (0.0, -60.0, 0.0) Speed = 5
    wait 1 seconds
    Kill name = GO_BlownTrash13
    Kill name = GO_BlownTrash15
    Kill name = GO_BlownTrash17
    Kill name = GO_BlownTrash18
    Kill name = GO_BlownTrash20
    Kill name = GO_BlownTrash25
    Kill name = GO_BlownTrash26
    Create name = Blown_TRG_02
endscript


script LA_Bristle_Spin 
    obj_setpathvelocity 5 mph
    obj_pathheading Off
    obj_followpathlinked
    obj_roty Speed = 1500
endscript


script CPF_GrateOpenStart 
    StartGap GapID = Open1 flags = [ REQUIRE_RAIL CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script CPF_GrateOpenEnd 
    endgap GapID = Open1 text = 'They\'re GRATE!' Score = 100
    Create name = Gap_VentFrus_01
    Create prefix = 'TRG_Ledge_Grates'
    if IsAlive name = GrateClosed01
        SpawnScript CPF_GrateOpenCreate_Start
    endif
endscript


script CPF_GrateOpenCreate_Start 
    playsound HitPotty volume = 100.0 pitch = 100.0
    ShatterAndDie name = GrateClosed01 area = 288.0 variance = 0.0 spread = 1.0 life = 4.0 Bounce = -10 , 0 Scale = 1.0
    ShatterAndDie name = GrateClosed02 area = 288.0 variance = 0.0 spread = 1.0 life = 4.0 Bounce = -10 , 0 Scale = 1.0
    ShatterAndDie name = GrateClosed03 area = 288.0 variance = 0.0 spread = 1.0 life = 4.0 Bounce = -10 , 0 Scale = 1.0
    ShatterAndDie name = GrateClosed04 area = 288.0 variance = 0.0 spread = 1.0 life = 4.0 Bounce = -10 , 0 Scale = 1.0
endscript


script CPF_GrateOpenStart12 
    StartGap GapID = Open1 flags = [ REQUIRE_RAIL CANCEL_GROUND CANCEL_MANUAL ]
endscript


script CPF_GrateOpenEnd12 
    endgap GapID = Open1 text = 'They\'re GRATE!' Score = 100
endscript


script LA_FromPurple 
    StartGap flags = [REQUIRE_AIR , CANCEL_GROUND , CANCEL_RAIL , CANCEL_MANUAL , CANCEL_HANG]
    endgap text = 'From Purple To Street!' Score = 500
endscript


script LA_ManualUpBunk 
    StartGap flags = [ PURE_MANUAL CANCEL_HANG ]
    endgap text = 'Manual Up The Bunker!' Score = 1000
endscript


script LA_ManualDownBunk 
    StartGap flags = [ PURE_MANUAL CANCEL_HANG ]
    endgap text = 'Manual Down The Bunker!' Score = 500
endscript


script LA_HugeLaunch 
    StartGap flags = [REQUIRE_AIR CANCEL_WALK CANCEL_GROUND CANCEL_WALLRIDE CANCEL_HANG]
    endgap text = 'Huge Launch!!!' Score = 10000
endscript


script LA_FiretruckStompS 
    StartGap GapID = fire flags = [ REQUIRE_AIR CANCEL_GROUND CANCEL_WALLRIDE CANCEL_HANG ]
endscript


script LA_FiretruckStompE 
    endgap GapID = fire text = 'Firetruck Stomp!!' Score = 10069
endscript


script LA_Post2WireS 
    StartGap GapID = fire flags = [ REQUIRE_AIR CANCEL_GROUND CANCEL_WALLRIDE CANCEL_HANG ]
endscript


script LA_Post2WireE 
    endgap GapID = fire text = 'Post To Wire!' Score = 5000
endscript


script LA_Post2StairS 
    StartGap GapID = fire flags = [ REQUIRE_AIR CANCEL_GROUND CANCEL_WALLRIDE CANCEL_HANG ]
endscript


script LA_Post2StairE 
    endgap GapID = fire text = 'Post To Stair!' Score = 2500
endscript


script LA_Kill_Plane 
    Sk3_KillSkater nodeName = TRG_LA_Restart_Mult_11 Message1 = 'Street Pizza' message2 = 'Road Kill' message3 = 'Road Kill' message4 = 'Road Kill' r = 250 g = 0 b = 0
endscript


script CPF_GrateOpenStart1 
    StartGap flags = [ REQUIRE_RAIL CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
    endgap text = 'They\'re GRATE!' Score = 100
endscript


script CPF_LA_Shoots 
    StartGap flags = [ REQUIRE_RAIL CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
    endgap text = 'Shoots n\' Ladders!' Score = 200
endscript


script CPF_LA_hothot 
    StartGap GapID = LA_Fire flags = [ PURE_AIR CANCEL_HANG ]
    endgap GapID = LA_Fire text = 'Hot, hot, hot!' Score = 200
endscript


script CPF_LA_Illin 
    StartGap flags = [ CANCEL_GROUND CANCEL_MANUAL REQUIRE_RAIL CANCEL_HANG ]
    endgap text = 'Grind Illin\'' Score = 100
endscript


script CPF_LA_Burrito 
    StartGap flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
    endgap text = 'Burrito Carnitas' Score = 100
endscript


script CPF_LA_Learnin 
    StartGap flags = [ REQUIRE_RAIL CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
    endgap text = 'Gettin a Learn On!' Score = 100
endscript


script CPF_LA_LibStairs 
    StartGap flags = [ PURE_AIR CANCEL_HANG ]
    endgap text = 'Down the Stairs' Score = 100
endscript


script CPF_LA_WireRidin1_Start 
    StartGap GapID = one flags = [ REQUIRE_RAIL CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script CPF_LA_WireRidin1_End 
    endgap GapID = one text = 'WireRidin 1!' Score = 100
endscript


script CPF_LA_WireRidin2_Start 
    StartGap GapID = two flags = [ REQUIRE_RAIL CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script CPF_LA_WireRidin2_End 
    endgap GapID = two text = 'WireRidin 2!!' Score = 200
endscript


script CPF_LA_WireRidin3_Start 
    StartGap GapID = three flags = [ REQUIRE_RAIL CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script CPF_LA_WireRidin3_End 
    endgap GapID = three text = 'WireRidin 3!!!' Score = 300
endscript


script LA_BreakGlass 
    BloodSplat
    GetBonus Score = 100 text = 'Glass Broken'
    playsound HitGlassPane2x vol = 100 pitch = Random (@ 75 @ 85 @ 100 @ 115 @ 125)
    Kill name = <name>
    ShatterAndDie name = <name> area = Random (@ 588 @ 1000 @ 4000) vibrate variance = 4.600 vel_x = Random (@ 0.0 @ 30 @ -30) vel_y = Random (@ 10 @ 30 @ 50) vel_z = Random (@ 0 @ 30 @ -30) spread = 1.0
endscript


script CPF_LA_hungoverS 
    StartGap flags = [ CANCEL_GROUND PURE_AIR CANCEL_WALK CANCEL_HANG ]
    endgap text = 'Hung Over' Score = 100
endscript


script CPF_LA_AllTheWayStart 
    StartGap GapID = all1 flags = [ PURE_AIR CANCEL_HANG ]
endscript


script CPF_LA_AllTheWayEnd 
    endgap GapID = all1 text = 'All The Way' Score = 300
endscript


script CPF_LA_NoseBleedStart 
    StartGap GapID = NoseBleed1 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script CPF_LA_NoseBleedEnd 
    endgap GapID = NoseBleed1 text = 'NoseBleed Time' Score = 100
endscript


script CPF_LA_TowerpopStart 
    StartGap GapID = Towerpop1 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script CPF_LA_TowerpopEnd 
    endgap GapID = Towerpop1 text = 'Tower Poppin\'' Score = 100
endscript


script CPF_LA_TowerpopStart1 
    StartGap GapID = Towerpop11 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script CPF_LA_TowerpopEnd1 
    endgap GapID = Towerpop11 text = 'Tower Poppin\'' Score = 100
endscript


script CPF_LA_TowerLockStart 
    StartGap GapID = TowerLock1 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script CPF_LA_TowerLockEnd 
    endgap GapID = TowerLock1 text = 'Tower Lockin\'' Score = 100
endscript


script CPF_LA_TowerLockStart1 
    StartGap GapID = TowerLock11 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script CPF_LA_TowerLockEnd1 
    endgap GapID = TowerLock11 text = 'Tower Lockin\'' Score = 100
endscript


script CPF_LA_BallisticStart 
    StartGap GapID = Ballistic1 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script CPF_LA_BallisticEnd 
    endgap GapID = Ballistic1 text = 'Goin\' Ballistic' Score = 100
endscript


script CPF_LA_RailSkipStart 
    StartGap GapID = RailSkip1 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script CPF_LA_RailSkipEnd 
    endgap GapID = RailSkip1 text = 'Rail Skip!' Score = 100
endscript


script CPF_LA_Bunker 
    StartGap flags = [ PURE_AIR CANCEL_HANG ]
    endgap text = 'Bunker' Score = 200
endscript


script CPF_LA_Washin_Start 
    StartGap GapID = WLip1 flags = [ REQUIRE_RAIL CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script CPF_LA_Washin_End 
    endgap GapID = WLip1 text = 'Washin\' Windows' Score = 200
endscript


script CPF_LA_WashinSLip_Start 
    StartGap GapID = swLip1 flags = [ REQUIRE_LIP CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script CPF_LA_WashinSLip_End 
    endgap GapID = swLip1 text = 'Southern Washer Lip' Score = 100
endscript


script CPF_LA_WashinNLip_Start 
    StartGap GapID = NwLip1 flags = [ REQUIRE_LIP CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script CPF_LA_WashinNLip_End 
    endgap GapID = NwLip1 text = 'Northern Washer Lip' Score = 100
endscript


script CPF_LA_Pure 
    StartGap flags = [ PURE_AIR CANCEL_HANG ]
    endgap text = 'Pure Air!' Score = 100
endscript


script CPF_LA_West 
    StartGap flags = [ PURE_AIR CANCEL_HANG ]
    endgap text = 'West Side!\'' Score = 100
endscript


script CPF_LA_East 
    StartGap flags = [ PURE_AIR CANCEL_HANG ]
    endgap text = 'East Side!\'' Score = 100
endscript


script CPF_LA_WireDrop_Start 
    StartGap GapID = WireDrop1 flags = [ REQUIRE_RAIL CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script CPF_LA_WireDrop_End 
    endgap GapID = WireDrop1 text = 'Wire Drop' Score = 300
endscript


script CPF_LA_TowerRailS 
    StartGap flags = [ REQUIRE_RAIL CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
    endgap text = 'Tower South' Score = 100
endscript


script CPF_TowerRailSwapSouth_Start 
    StartGap GapID = SwapS1 flags = [ REQUIRE_RAIL CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script CPF_TowerRailSwapSouth_End 
    endgap GapID = SwapS1 text = 'Tower Rail Swap!' Score = 100
endscript


script CPF_LA_TowerRailSGap 
    StartGap flags = [ REQUIRE_RAIL CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
    endgap text = 'Tower Rails Gap' Score = 200
endscript


script CPF_LA_Electric_Start 
    StartGap GapID = Electric1 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script CPF_LA_Electric_End 
    endgap GapID = Electric1 text = 'Electrified!' Score = 300
endscript


script CPF_LA_OverFoun_Start 
    StartGap GapID = OverFoun1 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script CPF_LA_OverFoun_End 
    endgap GapID = OverFoun1 text = 'Over The Fountain!' Score = 200
endscript


script CPF_LA_OverFounHop_Start 
    StartGap GapID = OverFounHop1 flags = [ REQUIRE_RAIL CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script CPF_LA_OverFounHop_End 
    endgap GapID = OverFounHop1 text = 'Fountain Hop' Score = 400
endscript


script CPF_LA_OverFounHop_Start1 
    StartGap GapID = OverFounHop11 flags = [ REQUIRE_RAIL CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script CPF_LA_OverFounHop_End1 
    endgap GapID = OverFounHop11 text = 'Fountain Hop' Score = 400
endscript


script CPF_LA_KioskGap 
    StartGap flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
    endgap text = 'Kiosk!' Score = 100
endscript


script CPF_LA_Doorway 
    StartGap flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
    endgap text = 'Doorway Hop' Score = 50
endscript


script CPF_LA_VFrus_Start 
    StartGap GapID = Venting Frustration1 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script CPF_LA_VFrus_End 
    endgap GapID = Venting Frustration1 text = 'Venting Frustration' Score = 200
endscript


script CPF_LA_ToLadd_Start 
    StartGap GapID = ToLadd1 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script CPF_LA_ToLadd_End 
    endgap GapID = ToLadd1 text = 'To The Ladder' Score = 200
endscript


script CPF_LA_NiceMove_Start 
    StartGap GapID = NiceMove1 flags = [ REQUIRE_RAIL CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script CPF_LA_NiceMove_End 
    endgap GapID = NiceMove1 text = 'Nice Move!' Score = 300
endscript


script CPF_LA_LipWash_Start 
    StartGap GapID = LipWash1 flags = [ REQUIRE_LIP CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script CPF_LA_LipWash_End 
    endgap GapID = LipWash1 text = 'Lip Wash' Score = 100
endscript


script CPF_LA_Squeek_Start 
    StartGap GapID = Squeek1 flags = [ REQUIRE_RAIL CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script CPF_LA_Squeek_End 
    endgap GapID = Squeek1 text = 'Squeaky Clean!' Score = 100
endscript


script CPF_LA_Squeek_Start1 
    StartGap GapID = Squeek11 flags = [ REQUIRE_RAIL CANCEL_HANG ]
endscript


script CPF_LA_Squeek_End1 
    endgap GapID = Squeek11 text = 'Squeaky Clean!' Score = 100
endscript


script CPF_LA_Squeak_Start 
    StartGap GapID = Squeak1 flags = [ REQUIRE_RAIL CANCEL_HANG ]
endscript


script CPF_LA_Squeak_End 
    endgap GapID = Squeak1 text = 'Squeaky Clean!' Score = 100
endscript


script CPF_LA_Chillin_Start 
    StartGap GapID = fuckyou flags = [ PURE_AIR CANCEL_HANG ]
endscript


script CPF_LA_Chillin_End 
    endgap GapID = fuckyou text = 'Cold Chillin\'' Score = 100
endscript


script CPF_LA_Chillin_Start1 
    StartGap GapID = fuckyou1 flags = [ PURE_AIR CANCEL_HANG ]
endscript


script CPF_LA_Chillin_End1 
    endgap GapID = fuckyou1 text = 'Cold Chillin\'' Score = 100
endscript


script CPF_LA_BGrande_Start 
    StartGap GapID = BGrande1 flags = [ PURE_AIR CANCEL_HANG ]
endscript


script CPF_LA_BGrande_End 
    endgap GapID = BGrande1 text = 'Burrito Grande' Score = 100
endscript


script CPF_LA_BGrande_Start1 
    StartGap GapID = BGrande11 flags = [ PURE_AIR CANCEL_RAIL CANCEL_HANG ]
endscript


script CPF_LA_BGrande_End1 
    endgap GapID = BGrande11 text = 'Burrito Grande' Score = 100
endscript


script CPF_LA_Gas_Start 
    StartGap GapID = Gas1 flags = [ REQUIRE_WALLRIDE CANCEL_HANG ]
endscript


script CPF_LA_Gas_End 
    endgap GapID = Gas1 text = 'Passin\' Gas' Score = 200
endscript


script CPF_LA_XXXr_Start 
    StartGap GapID = XXXr1 flags = [ REQUIRE_GRIND CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script CPF_LA_XXXr_End 
    endgap GapID = XXXr1 text = 'Ridin\' The XXX!' Score = 200
endscript


script CPF_LA_XXX_Start 
    StartGap GapID = XXX1 flags = [ REQUIRE_GRIND CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script CPF_LA_XXX_End 
    endgap GapID = XXX1 text = 'Triple X Hop!' Score = 100
endscript


script CPF_LA_Leap 
    StartGap flags = [ CANCEL_MANUAL CANCEL_HANG ]
    endgap text = 'Overpass Leap' Score = 200
endscript


script CPF_LA_YelCutGap 
    StartGap flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
    endgap text = 'Yellow Cutter!' Score = 100
endscript


script CPF_LA_BustinC 
    StartGap flags = [ PURE_AIR CANCEL_HANG ]
    endgap text = 'Bustin Cherries!' Score = 100
endscript


script CPF_LA_fall_Start 
    StartGap GapID = fall1 flags = [ REQUIRE_GRIND CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script CPF_LA_fall_End 
    endgap GapID = fall1 text = 'Don\'t Fall!!!' Score = 200
endscript


script CPF_LA_Pershing1 
    StartGap flags = [ REQUIRE_RAIL CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
    endgap text = 'Pershing Ramp' Score = 100
endscript


script CPF_LA_Purple_T1 
    StartGap flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
    endgap text = 'Purple Transfer' Score = 100
endscript


script CPF_LA_HotelLip_Start 
    StartGap GapID = HotelLip1 flags = [ REQUIRE_LIP CANCEL_GROUND CANCEL_HANG ]
endscript


script CPF_LA_HotelLip_End 
    endgap GapID = HotelLip1 text = 'Hotel Lip Smackin\'' Score = 100
endscript


script CPF_LA_YellShack 
    StartGap flags = [ PURE_AIR CANCEL_HANG ]
    endgap text = 'Over the Yellow Stone Shack' Score = 100
endscript


script CPF_LA_YellFall_Start 
    StartGap GapID = YellFall1 flags = [ PURE_AIR CANCEL_HANG ]
endscript


script CPF_LA_YellFall_End 
    endgap GapID = YellFall1 text = 'Yellow Fall!' Score = 100
endscript


script LA_Rubble_Vibration 
    if NOT InMultiPlayerGame
        begin 
        skater ::Vibrate_Controller_Safe actuator = 1 percent = 50
        wait 1 frames
        repeat 10
        skater ::Vibrate_Controller_Safe actuator = 1 percent = 0
    endif
endscript


script LA_Indiana_Start 
    StartGap GapID = Indiana1 flags = [ PURE_MANUAL ]
endscript


script LA_Indiana_End 
    endgap GapID = Indiana1 text = 'Indiana Style!' Score = 100
endscript


script LA_Indiana_Start1 
    StartGap GapID = Indiana2 flags = [ PURE_MANUAL ]
endscript


script LA_Indiana_End1 
    endgap GapID = Indiana2 text = 'Indiana Style!' Score = 100
endscript


script LA_ManualCutLedge_Gap 
    StartGap flags = [ REQUIRE_MANUAL CANCEL_GROUND CANCEL_HANG ]
    endgap text = 'Manual Cut Ledge' Score = 500
endscript


script LA_RollHump_Gap 
    StartGap flags = [ CANCEL_GROUND REQUIRE_AIR CANCEL_HANG ]
    endgap text = 'Roll Hump Jump' Score = 420
endscript


script LA_ManualLedgeOverPillars_Gap 
    StartGap flags = [REQUIRE_MANUAL , CANCEL_GROUND , CANCEL_RAIL CANCEL_HANG]
    endgap text = 'Manual Deck Over Pillars' Score = 2150
endscript


script LA_OrangeWallie_Start 
    StartGap GapID = YellFall11 flags = [REQUIRE_WALLRIDE , CANCEL_GROUND , CANCEL_RAIL CANCEL_HANG]
endscript


script LA_OrangeWallie_End 
    endgap GapID = YellFall11 text = 'Orange Wallie 2 Street' Score = 1500
endscript


script LA_RediculousSpine_Gap 
    StartGap flags = [ cancel Ground CANCEL_HANG CANCEL_WALK ]
    endgap text = 'Ridiculous Spine' Score = 800
endscript


script LA_NachosNQueso_Gap 
    StartGap flags = [REQUIRE_AIR , cancel Ground CANCEL_HANG]
    endgap text = 'Nachos \'n Queso y\'all' Score = 500
endscript


script LA_ManualTheLedge_Start 
    StartGap GapID = ManualLedge flags = [ REQUIRE_MANUAL CANCEL_HANG ]
endscript


script LA_ManualTheLedge_End 
    endgap GapID = ManualLedge text = 'Morehead Ledge' Score = 3000
endscript


script LA_CreateCars 
endscript


script CPF_TowerTest1 
endscript


script LA_CreatePeds 
endscript


script CPF_LA_BlownLeaf 
endscript


script CPF_QuakeChecker 
endscript


script CPF_Quake_North 
endscript


script CPF_Quake_West 
endscript


script CPF_Quake_South 
endscript


script CPF_Quake_East 
endscript


script CPF_LA_FallingCar 
endscript


script CPF_LA_RockingCar 
endscript


script CPF_LA_ArcoLockin 
endscript


script CPF_LA_ArcoCHUD 
endscript


script CPF_LA_ArcoPoppin 
endscript


script CPF_LA_Spinning_Bristles 
endscript


script CPF_LA_Fire 
endscript


script CPF_LA_WireWest 
endscript


script CPF_LA_WireEast 
endscript


script CPF_LA_Ball01 
endscript


script CPF_LA_Ball02 
endscript


script CPF_PershingRamp1 
endscript


script CPF_CloseOneWest 
endscript


script CPF_PershingRamp2 
endscript


script CPF_CarwashNorth 
endscript


script CPF_CarwashSouth 
endscript


script CPF_TowerRailSwapNorth 
endscript


script CPF_RailWest 
endscript


script CPF_RailEast 
endscript


script CPF_LA_North_Peds 
endscript


script CPF_LA_South_Peds 
endscript


script CPF_OverpassRumble1 
endscript


script CPF_OverpassRumble2 
endscript


script CPF_StartWesternQuake 
endscript


script CPF_StartNorthernQuake 
endscript


script CPF_StartSouthernQuake 
endscript


script CPF_StartEasternQuake 
endscript


script CPF_LA_KillOverCars 
endscript


script CPF_LA_CreateOverCars 
endscript


script CPF_StopThieves 
endscript


script CPF_CloseOneEast 
endscript


script CPF_FroggerSouth 
endscript


script CPF_FroggerNorth 
endscript


script CPF_Fountain1 
endscript


script CPF_Fountain2 
endscript


script CPF_TowerTest2 
endscript


script CPF_TowerRailSwapSouth 
endscript


script CPF_TowerDoor1 
endscript


script CPF_TowerDoor2 
endscript


script CPF_GapKiosk 
endscript


script CPF_LA_LoadingScript 
endscript


script CPF_LA_FallingSign2 
endscript


script CPF_LA_FallingSign 
endscript


script CPF_LA_QuakeStart 
endscript


script CPF_LA_TheaterSound 
endscript


script SK3_TrafficLight01 
endscript


script LA_2d_sign_element_create parent = menu3d_anchor
    if GetGlobalFlag flag = SCREEN_MODE_WIDE
        <Offset> = (-8.0, 0.0)
    else
        <Offset> = (0.0, 0.0)
    endif
    CreateScreenElement {
        type = ContainerElement
        parent = <parent>
        id = LA_holder
        Pos = (0.0, 0.0)
        z_priority = -53
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <parent>
        texture = LA_icon_1
        id = LA_ping
        Scale = 1
        rgba = [ 128 128 128 100 ]
        Pos = ((180.0, 320.0) + <Offset>)
        rot_angle = 0
        just = [ center center ]
        z_priority = -51
    }
    CreateScreenElement {
        type = SpriteElement
        parent = LA_holder
        texture = LA_icon_2
        id = LA_richter
        Scale = 5
        rgba = [ 128 128 128 100 ]
        Pos = ((120.0, 300.0) + <Offset>)
        rot_angle = -30
        just = [ center center ]
    }
    RunScriptOnScreenElement id = LA_holder LA_main_anim
    RunScriptOnScreenElement id = LA_richter LA_richter_anim
endscript


script LA_richter_anim orig_pos = (120.0, 300.0)
    begin 
    x_off = Random (@ (-30.0, 0.0) @ (-10.0, 0.0) @ (0.0, 0.0) @ (10.0, 0.0) @ (30.0, 0.0))
    y_off = Random (@ (0.0, -30.0) @ (0.0, -10.0) @ (0.0, 0.0) @ (0.0, 10.0) @ (0.0, 30.0))
    DoMorph time = 0 Pos = (120.0, 300.0)
    DoMorph time = 0.05000 Pos = ((120.0, 300.0) + <x_off> + <y_off>)
    repeat 
endscript


script LA_ping_anim 
    x_off = Random (@ (10.0, 0.0) @ (60.0, 0.0) @ (110.0, 0.0) @ (140.0, 0.0) @ (180.0, 0.0))
    y_off = Random (@ (0.0, 160.0) @ (0.0, 192.0) @ (0.0, 224.0) @ (0.0, 256.0) @ (0.0, 288.0) @ (0.0, 320.0))
    DoMorph time = 0 Pos = (<x_off> + <y_off>)alpha = 1 Scale = 0
    DoMorph time = 0.5000 Scale = 1.500
    DoMorph time = 2.0 alpha = 0 Scale = 4
endscript


script LA_fade_in_out 
    wait 0.1000 seconds
    DoMorph time = 0 alpha = 0
    DoMorph time = 0.05000 alpha = 1
    wait 1.500 seconds
    DoMorph time = 0.5000 alpha = 0
endscript


script LA_main_anim 
    begin 
    RunScriptOnScreenElement id = LA_ping LA_ping_anim
    RunScriptOnScreenElement id = LA_holder LA_fade_in_out
    wait Random (@ 5 @ 7 @ 9) seconds
    repeat 
endscript

