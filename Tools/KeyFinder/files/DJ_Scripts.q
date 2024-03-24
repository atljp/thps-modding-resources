
script DJ_Setup 
    DJ_manualcheck_init
endscript


script DJ_startup 
endscript


script DJ_Goals 
    if InMultiPlayerGame
        add_multiplayer_mode_goals
    endif
    if NOT InSplitScreenGame
        if ((GameModeEquals is_classic)|| (InNetGame))
            printf 'adding classic goals'
            AddGoal_HighScore {
                unlimited_time
                classic_mode_goal
                goal_text = DJ_Classic_HighScore_Text
                view_goals_cameras = [{
                        name = Cam_score
                        frames = 1200
                        skippable = 1
                    }
                ]
                difficulty_level_params = [
                    {Score = DJ_Classic_Easy_HighScore
                        goal_text = DJ_Classic_Easy_HighScore_Text
                        view_goals_text = DJ_Classic_Easy_HighScore_Text
                    }
                    {Score = DJ_Classic_HighScore
                        goal_text = DJ_Classic_HighScore_Text
                        view_goals_text = DJ_Classic_HighScore_Text
                    }
                ]
            }
            AddGoal_ProScore {
                unlimited_time
                classic_mode_goal
                Score = DJ_Classic_ProScore
                goal_text = DJ_Classic_ProScore_Text
                view_goals_text = DJ_Classic_ProScore_Text
                difficulty_level_params = [
                    {Score = DJ_Classic_Easy_ProScore
                        goal_text = DJ_Classic_Easy_ProScore_Text
                        view_goals_text = DJ_Classic_Easy_ProScore_Text
                    }
                    {Score = DJ_Classic_ProScore
                        goal_text = DJ_Classic_ProScore_Text
                        view_goals_text = DJ_Classic_ProScore_Text
                    }
                ]
            }
            AddGoal_SickScore {
                unlimited_time
                classic_mode_goal
                Score = DJ_Classic_SickScore
                goal_text = DJ_Classic_SickScore_Text
                view_goals_text = DJ_Classic_SickScore_Text
                difficulty_level_params = [
                    {Score = DJ_Classic_Easy_SickScore
                        goal_text = DJ_Classic_Easy_SickScore_Text
                        view_goals_text = DJ_Classic_Easy_SickScore_Text
                    }
                    {Score = DJ_Classic_SickScore
                        goal_text = DJ_Classic_SickScore_Text
                        view_goals_text = DJ_Classic_SickScore_Text
                    }
                ]
            }
            AddGoal_HighCombo {
                unlimited_time
                classic_mode_goal
                Score = DJ_Classic_HighCombo
                goal_text = DJ_Classic_HighCombo_Text
                view_goals_text = DJ_Classic_HighCombo_Text
                difficulty_level_params = [
                    {Score = DJ_Classic_Easy_HighCombo
                        goal_text = DJ_Classic_Easy_HighCombo_Text
                        view_goals_text = DJ_Classic_Easy_HighCombo_Text
                    }
                    {Score = DJ_Classic_HighCombo
                        goal_text = DJ_Classic_HighCombo_Text
                        view_goals_text = DJ_Classic_HighCombo_Text
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
                        targetOffset = (-3558.39990234375, -2528.300048828125, 10577.7001953125)
                        positionOffset = (3494.5, -235.6999969482422, 3869.60009765625)
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
                        targetOffset = (7455.39990234375, -2808.800048828125, -2486.39990234375)
                        positionOffset = (1638.0, -615.2999877929688, 5345.89990234375)
                        frames = 200
                        skippable = 1
                    }
                ]
            }
            AddGoal_Collect {
                unlimited_time
                init_script = DJ_CratesCreate
                goal_deactivate_script = DJ_CratesKill
                classic_mode_goal
                collect_type = 'Crates'
                goal_text = 'Smash 5 Crates'
                view_goals_text = 'Smash 5 Crates'
                use_hud_counter
                hud_counter_caption = 'Crates smashed'
                goal_flags = [got_1
                    got_2
                    got_3
                    got_4
                    got_5
                ]
                view_goals_cameras = [{virtual_cam
                        TargetID = world
                        targetOffset = (2696.300048828125, -3475.199951171875, 6789.5)
                        positionOffset = (-1254.800048828125, -2035.5999755859375, -2283.10009765625)
                        frames = 200
                        skippable = 1
                    }
                ]
            }
            AddGoal_Gaps {
                unlimited_time
                classic_mode_goal
                version = 2
                goal_text = '\t1 (\k1) Over The Giant Grate'
                view_goals_text = '\t1 (\k1) Over The Giant Grate'
                goal_description = '\t1 (\k1) Over The Giant Grate'
                goal_flags = [ got_1
                 ]
                view_goals_cameras = [{virtual_cam
                        TargetID = world
                        targetOffset = (-5941.89990234375, -6558.10009765625, -15006.2998046875)
                        positionOffset = (-120.9000015258789, -4459.89990234375, -7150.5)
                        frames = 200
                        skippable = 1
                    }
                ]
                key_combos = [ Air_CircleUL ]
            }
            AddGoal_Collect {
                unlimited_time
                init_script = DJ_PuddlesCreate
                goal_deactivate_script = DJ_PuddlesKill
                classic_mode_goal
                version = 2
                collect_type = 'Manual (\b7+\b4) Through The Puddles'
                use_hud_counter
                hud_counter_caption = 'Manual (\b7+\b4) Through The Puddles'
                goal_text = 'Manual (\b7+\b4) Through The Puddles'
                view_goals_text = 'Manual (\b7+\b4) Through The Puddles'
                goal_description = 'Small Puddles'
                goal_flags = [got_1
                    got_2
                    got_3
                    got_4
                    got_5
                ]
                view_goals_cameras = [{virtual_cam
                        TargetID = world
                        targetOffset = (-986.2999877929688, -5344.10009765625, -6098.2001953125)
                        positionOffset = (-506.3999938964844, -1613.9000244140625, 3167.60009765625)
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
                secret_tape_id = TRG_DJ_SecretTape
                view_goals_cameras = [{virtual_cam
                        TargetID = world
                        targetOffset = (2510.89990234375, -1899.699951171875, 8216.099609375)
                        positionOffset = (-508.3999938964844, -1986.9000244140625, -1316.800048828125)
                        frames = 200
                        skippable = 1
                    }
                ]
            }
        endif
    endif
endscript


script DJ_CratesCreate 
    Create prefix = 'DJ_Classic_Crate'
    Create prefix = 'DJ_Goal'
endscript


script DJ_CratesKill 
    printf 'dj_crateskill'
    Kill prefix = 'DJ_Classic_Crate'
    Kill prefix = 'DJ_Goal'
endscript


script DJ_PuddlesCreate 
    Create prefix = 'CLAS_ManualPuddle'
    Create prefix = 'CLAS_Trig_ManualPuddle'
endscript


script DJ_PuddlesKill 
    Kill prefix = 'CLAS_ManualPuddle'
    Kill prefix = 'CLAS_Trig_ManualPuddle'
endscript


script DJ_Crate 
    ShatterAndDie name = <object> area = 5000 texture_swap = jow_dj_crateshatter01 variance = 4 vel_x = 15 vel_y = 15 vel_z = 15
    Kill name = <name>
    if NOT issoundplaying HitWoodPlanks
        playsound HitWoodPlanks vol = 120
    endif
    switch <name>
        case DJ_Classic_Crate01
        goal_collect_got_object goal_id = dj_classic_goal_collect flag = got_1
        CreateFastParticleSystem name = JOW_DJ_Crates01 params_script = JOW_DJ_Crates01_fast_particle_params
        case DJ_Classic_Crate02
        goal_collect_got_object goal_id = dj_classic_goal_collect flag = got_2
        CreateFastParticleSystem name = JOW_DJ_Crates02 params_script = JOW_DJ_Crates02_fast_particle_params
        case DJ_Classic_Crate03
        goal_collect_got_object goal_id = dj_classic_goal_collect flag = got_3
        CreateFastParticleSystem name = JOW_DJ_Crates03 params_script = JOW_DJ_Crates03_fast_particle_params
        case DJ_Classic_Crate04
        goal_collect_got_object goal_id = dj_classic_goal_collect flag = got_4
        CreateFastParticleSystem name = JOW_DJ_Crates04 params_script = JOW_DJ_Crates04_fast_particle_params
        case DJ_Classic_Crate05
        goal_collect_got_object goal_id = dj_classic_goal_collect flag = got_5
        CreateFastParticleSystem name = JOW_DJ_Crates05 params_script = JOW_DJ_Crates05_fast_particle_params
    endswitch
endscript


script DJ_Secret_Tape 
endscript


script DJ_Secret_Tape_Got 
endscript


script DJ_GapStart_JapanGrabPuddle 
    StartGap GapID = JapGrab flags = [ PURE_AIR CANCEL_HANG ] keycombo = Air_CircleUL TrickScript = DJ_Classic_Gaps_Got1
endscript


script DJ_GapEnd_JapanGrabPuddle 
    endgap GapID = JapGrab Score = 100 text = 'Over The Giant Grate!'
endscript


script DJ_Classic_Gaps_Got1 
    GoalManager_SetGoalFlag name = DJ_classic_goal_gaps2 got_1 1
endscript

FLAG_DJ_RAIL1 = 25
FLAG_DJ_RAIL2 = 26
FLAG_DJ_RAIL3 = 27
FLAG_DJ_RAIL4 = 28
FLAG_DJ_RAIL5 = 29
FLAG_MANUAL = 30

script DJ_manualcheck_init 
    SpawnScript DJ_skater_manual
endscript


script DJ_skater_manual 
    ClearExceptionGroup DJ_inmanual
    UnSetFlag flag = FLAG_MANUAL
    SetExceptionHandler Ex = SkaterEnterManual scr = DJ_manual_active group = DJ_inmanual
    Block
endscript


script DJ_manual_active 
    ClearExceptionGroup DJ_inmanual
    SetFlag flag = FLAG_MANUAL
    SetExceptionHandler Ex = SkaterExitManual scr = DJ_skater_manual group = DJ_inmanual
    Block
endscript


script DJ_Manual_Puddle1 
    if NOT GetFlag flag = FLAG_DJ_RAIL1
        if GetFlag flag = FLAG_MANUAL
            Kill name = CLAS_ManualPuddle01
            Kill name = CLAS_Trig_ManualPuddle01
            playsound FallWater
            goal_collect_got_object goal_id = dj_classic_goal_collect2 flag = got_1
            SetFlag flag = FLAG_DJ_RAIL1
        endif
    endif
endscript


script DJ_Manual_Puddle2 
    if NOT GetFlag flag = FLAG_DJ_RAIL2
        if GetFlag flag = FLAG_MANUAL
            Kill name = CLAS_ManualPuddle02
            Kill name = CLAS_Trig_ManualPuddle02
            playsound FallWater
            goal_collect_got_object goal_id = dj_classic_goal_collect2 flag = got_2
            SetFlag flag = FLAG_DJ_RAIL2
        endif
    endif
endscript


script DJ_Manual_Puddle3 
    if NOT GetFlag flag = FLAG_DJ_RAIL3
        if GetFlag flag = FLAG_MANUAL
            Kill name = CLAS_ManualPuddle03
            Kill name = CLAS_Trig_ManualPuddle03
            playsound FallWater
            goal_collect_got_object goal_id = dj_classic_goal_collect2 flag = got_3
            SetFlag flag = FLAG_DJ_RAIL3
        endif
    endif
endscript


script DJ_Manual_Puddle4 
    if NOT GetFlag flag = FLAG_DJ_RAIL4
        if GetFlag flag = FLAG_MANUAL
            Kill name = CLAS_ManualPuddle04
            Kill name = CLAS_Trig_ManualPuddle04
            playsound FallWater
            goal_collect_got_object goal_id = dj_classic_goal_collect2 flag = got_4
            SetFlag flag = FLAG_DJ_RAIL4
        endif
    endif
endscript


script DJ_Manual_Puddle5 
    if NOT GetFlag flag = FLAG_DJ_RAIL5
        if GetFlag flag = FLAG_MANUAL
            Kill name = CLAS_ManualPuddle05
            Kill name = CLAS_Trig_ManualPuddle05
            playsound FallWater
            goal_collect_got_object goal_id = dj_classic_goal_collect2 flag = got_5
            SetFlag flag = FLAG_DJ_RAIL5
        endif
    endif
endscript


script DJ_Kill_Rocks 
    Sk3_KillSkater bail nodeName = TRG_Restart_03 Message1 = ' DENIED!' message2 = ' Good One?' message3 = ' Crunch!' message4 = ' Smack!'
endscript


script DJ_Kill_Rocks1 
    Sk3_KillSkater bail nodeName = TRG_Restart_04 Message1 = ' DENIED!' message2 = ' Good One?' message3 = ' Ding!' message4 = ' Sucker!'
endscript


script DJ_Boost01 
    if NOT walking
        trigger_speed_boost Speed = 1600
    endif
endscript


script ALC_Televator 
    TeleportSkaterToNode nodeName = TRG_Restart_05
    if NOT GotParam cut
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
    endif
    if GotParam sound
        playsound <sound>
    endif
    playsound LA_Skid_11
    if GotParam node
        SK3_TeleportToNode nodeName = <node>
    else
    endif
endscript


script ALC_Televator1 
    TeleportSkaterToNode nodeName = TRG_Restart_01
    if NOT GotParam cut
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
    endif
    if GotParam sound
        playsound <sound>
    endif
    playsound LA_Skid_11
    if GotParam node
        SK3_TeleportToNode nodeName = <node>
    else
    endif
endscript


script Box_Break_01 
    ShatterAndDie name = DMT_Crate01 area = 5000 variance = 4 vel_x = 50 vel_y = 50 vel_z = 50
    spread = 1
    if NOT issoundplaying HitWoodPlanks
        playsound HitWoodPlanks vol = 120
    endif
    Kill name = DMT_Crate05_shatter
endscript


script Box_Break_02 
    ShatterAndDie name = DMT_Crate03 area = 5000 variance = 4 vel_x = 50 vel_y = 50 vel_z = 50
    spread = 1
    if NOT issoundplaying HitWoodPlanks
        playsound HitWoodPlanks vol = 120
    endif
    Kill name = DMT_Crate05_shatter01
endscript


script Box_Break_03 
    ShatterAndDie name = DMT_Crate02 area = 5000 variance = 4 vel_x = 50 vel_y = 50 vel_z = 50
    spread = 1
    Kill name = DMT_Crate05_shatter02
    if NOT issoundplaying HitWoodPlanks
        playsound HitWoodPlanks vol = 120
    endif
endscript


script Box_Break_04 
    ShatterAndDie name = DMT_Crate04 area = 5000 variance = 4 vel_x = 50 vel_y = 50 vel_z = 50
    spread = 1
    Kill name = DMT_Crate05_shatter03
    if NOT issoundplaying HitWoodPlanks
        playsound HitWoodPlanks vol = 120
    endif
endscript


script DJ_Spray 
    playsound HitMetalCan volume = 100.0 pitch = 100.0
    Kill name = spray_01
    ShatterAndDie name = Jam_GOAL_Valve01 area = 288.0 variance = 0.0 spread = 1.0 life = 4.0 Bounce = -10 , 0 Scale = 1.0
    TRG_SFX_Ghost_Water01 ::obj_playsound SK6_BO_RiverLoop01_11 vol = 150 dropoff = 250 pitch = 200 dropoff_function = exponential
    wait 1 second
    CreateFastParticleSystem name = JOW_DJ_ValveSpurt01 params_script = JOW_DJ_ValveSpurt01_fast_particle_params
    CreateFastParticleSystem name = JOW_DJ_ValveSpurt01a params_script = JOW_DJ_ValveSpurt01a_fast_particle_params
endscript


script DJ_Spray1 
    Kill name = spray_02
    Kill name = Jam_GOAL_Valve_Flat_03
    ShatterAndDie name = Jam_GOAL_Valve02 area = 288.0 variance = 0.0 spread = 1.0 life = 4.0 Bounce = -10 , 0 Scale = 1.0
    playsound HitMetalCan volume = 100.0 pitch = 100.0
    TRG_SFX_Ghost_Water02 ::obj_playsound SK6_BO_RiverLoop01_11 vol = 150 dropoff = 250 pitch = 200 dropoff_function = exponential
    wait 1 second
    CreateFastParticleSystem name = JOW_DJ_ValveSpurt03 params_script = JOW_DJ_ValveSpurt03_fast_particle_params
    CreateFastParticleSystem name = JOW_DJ_ValveSpurt03a params_script = JOW_DJ_ValveSpurt03a_fast_particle_params
    CreateFastParticleSystem name = JOW_DJ_ValveSpurt03b params_script = JOW_DJ_ValveSpurt03b_fast_particle_params
    CreateFastParticleSystem name = JOW_DJ_ValveSpurt04 params_script = JOW_DJ_ValveSpurt04_fast_particle_params
    CreateFastParticleSystem name = JOW_DJ_ValveSpurt04a params_script = JOW_DJ_ValveSpurt04a_fast_particle_params
    CreateFastParticleSystem name = JOW_DJ_ValveSpurt04b params_script = JOW_DJ_ValveSpurt04b_fast_particle_params
endscript


script DJ_Spray2 
    Kill name = Spray_03
    ShatterAndDie name = Jam_GOAL_Valve03 area = 288.0 variance = 0.0 spread = 1.0 life = 4.0 Bounce = -10 , 0 Scale = 1.0
    playsound HitMetalCan volume = 100.0 pitch = 100.0
    TRG_SFX_Ghost_Water03 ::obj_playsound SK6_BO_RiverLoop01_11 vol = 150 dropoff = 400 pitch = 200 dropoff_function = exponential
    wait 1 second
    CreateFastParticleSystem name = JOW_DJ_DamSpurt01 params_script = JOW_DJ_DamSpurt01_fast_particle_params
    CreateFastParticleSystem name = JOW_DJ_DamSpurt01a params_script = JOW_DJ_DamSpurt01a_fast_particle_params
    CreateFastParticleSystem name = JOW_DJ_DamSpurt02 params_script = JOW_DJ_DamSpurt02_fast_particle_params
    CreateFastParticleSystem name = JOW_DJ_DamSpurt03 params_script = JOW_DJ_DamSpurt03_fast_particle_params
    CreateFastParticleSystem name = JOW_DJ_DamSpurt04 params_script = JOW_DJ_DamSpurt04_fast_particle_params
    CreateFastParticleSystem name = JOW_DJ_DamSpurt05 params_script = JOW_DJ_DamSpurt05_fast_particle_params
    CreateFastParticleSystem name = JOW_DJ_DamSpurt06 params_script = JOW_DJ_DamSpurt06_fast_particle_params
    CreateFastParticleSystem name = JOW_DJ_DamSpurt07 params_script = JOW_DJ_DamSpurt07_fast_particle_params
    CreateFastParticleSystem name = JOW_DJ_DamSpurt07a params_script = JOW_DJ_DamSpurt07a_fast_particle_params
    CreateFastParticleSystem name = JOW_DJ_DamFoam01 params_script = JOW_DJ_DamFoam01_fast_particle_params
endscript


script DJ_Spray3 
    Kill name = spray_04
    Kill name = Jam_GOAL_Valve_Flat_02
    ShatterAndDie name = Jam_GOAL_Valve05 area = 288.0 variance = 0.0 spread = 1.0 life = 4.0 Bounce = -10 , 0 Scale = 1.0
    playsound HitMetalCan volume = 100.0 pitch = 100.0
    TRG_SFX_Ghost_Water06 ::obj_playsound SK6_BO_RiverLoop01_11 vol = 150 dropoff = 200 pitch = 200 dropoff_function = exponential
    wait 1 second
    CreateFastParticleSystem name = JOW_DJ_ValveSpurt05 params_script = JOW_DJ_ValveSpurt05_fast_particle_params
    CreateFastParticleSystem name = JOW_DJ_ValveSpurt05a params_script = JOW_DJ_ValveSpurt05a_fast_particle_params
    CreateFastParticleSystem name = JOW_DJ_ValveSpurt06 params_script = JOW_DJ_ValveSpurt06_fast_particle_params
    CreateFastParticleSystem name = JOW_DJ_ValveSpurt06a params_script = JOW_DJ_ValveSpurt06a_fast_particle_params
endscript


script DJ_Spray4 
    Kill name = Spray_05
    Kill name = Jam_GOAL_flat_01
    ShatterAndDie name = Jam_GOAL_Valve06 area = 288.0 variance = 0.0 spread = 1.0 life = 4.0 Bounce = -10 , 0 Scale = 1.0
    playsound HitMetalCan volume = 100.0 pitch = 100.0
    TRG_SFX_Ghost_Water07 ::obj_playsound SK6_BO_RiverLoop01_11 vol = 150 dropoff = 250 pitch = 200 dropoff_function = exponential
    wait 1 second
    CreateFastParticleSystem name = JOW_DJ_EndSpurt01 params_script = JOW_DJ_EndSpurt01_fast_particle_params
    CreateFastParticleSystem name = JOW_DJ_EndSpurt02 params_script = JOW_DJ_EndSpurt02_fast_particle_params
    CreateFastParticleSystem name = JOW_DJ_EndFoam01 params_script = JOW_DJ_EndFoam01_fast_particle_params
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


script DJ_Hazard_GapS 
    StartGap GapID = Hazard flags = [ PURE_AIR CANCEL_HANG ]
endscript


script DJ_Hazard_GapE 
    endgap GapID = Hazard text = 'Huge Water Hazard Gap' Score = 1000
endscript


script DJ_co_Gap 
    StartGap flags = [ CANCEL_GROUND CANCEL_HANG ]
    endgap text = 'Neversoft Elec. Co. Gap' Score = 500
endscript


script DJ_25_Gap 
    StartGap flags = [ PURE_AIR CANCEL_HANG ]
    endgap text = '25ft' Score = 25
endscript


script DJ_50_Gap 
    StartGap flags = [ PURE_AIR CANCEL_HANG ]
    endgap text = '50ft' Score = 150
endscript


script DJ_75_Gap 
    StartGap flags = [ PURE_AIR CANCEL_HANG ]
    endgap text = '75ft' Score = 450
endscript


script DJ_100_Gap 
    StartGap flags = [ PURE_AIR CANCEL_HANG ]
    endgap text = '100ft' Score = 1000
endscript


script LA_Rail2RailS 
    StartGap GapID = fire flags = [ REQUIRE_AIR CANCEL_GROUND CANCEL_WALLRIDE CANCEL_HANG ]
endscript


script LA_Rail2RailE 
    endgap GapID = fire text = 'Rail 2 Rail' Score = 250
endscript


script LA_Rail2RailS1 
    StartGap GapID = rail1 flags = [ REQUIRE_AIR CANCEL_GROUND CANCEL_WALLRIDE CANCEL_HANG ]
endscript


script LA_Rail2RailE1 
    endgap GapID = rail1 text = 'Rail 2 Rail' Score = 250
endscript


script LA_Kick2RailS 
    StartGap GapID = kick1 flags = [ REQUIRE_AIR CANCEL_GROUND CANCEL_WALLRIDE CANCEL_HANG ]
endscript


script LA_Kick2RailE 
    endgap GapID = kick1 text = 'Rail 2 Rail' Score = 250
endscript


script LA_Rail2TraingleS 
    StartGap GapID = traingle1 flags = [ REQUIRE_AIR CANCEL_GROUND CANCEL_WALLRIDE CANCEL_HANG ]
endscript


script LA_Rail2TraingleE 
    endgap GapID = traingle1 text = 'Pipe 2 Triangle' Score = 500
endscript


script LA_QP2PipeS 
    StartGap GapID = qp1 flags = [ REQUIRE_AIR CANCEL_GROUND CANCEL_WALLRIDE CANCEL_HANG ]
endscript


script LA_QP2PipeE 
    endgap GapID = qp1 text = 'QP 2 Pipe' Score = 4000
endscript


script LA_LipBarS 
    StartGap GapID = lip1 flags = [ REQUIRE_LIP CANCEL_GROUND CANCEL_HANG ]
endscript


script LA_LipBarE 
    endgap GapID = lip1 text = 'Lip Bar' Score = 250
endscript


script DJ_Pipe_StartGap0 
    StartGap GapID = GAP4_EasyStart flags = [ CANCEL_GROUND REQUIRE_AIR CANCEL_HANG ]
endscript


script DJ_Pipe_ContinueGap1 
    endgap GapID = GAP4_EasyStart continue = {GapID = GAP4_EasyContinue
        flags = [ CANCEL_GROUND REQUIRE_AIR CANCEL_HANG ]}
endscript


script DJ_Pipe_ContinueGap2 
    endgap GapID = GAP4_EasyStart continue = {GapID = GAP4_EasyContinue
        flags = [ CANCEL_GROUND REQUIRE_AIR CANCEL_HANG ]}
endscript


script DJ_Pipe_EndGap3 
    endgap GapID = GAP4_EasyContinue text = 'Kicker 2 Pipe 2 Pipe 2 Pipe!!' Score = 10000
endscript


script DJ_HigUpTransfer 
    StartGap flags = [ PURE_AIR CANCEL_HANG ]
    endgap text = 'High Up Transfer' Score = 800
endscript


script LA_ManualHPS 
    StartGap GapID = Man1 flags = [PURE_MANUAL CANCEL_GROUND CANCEL_WALLRIDE CANCEL_AIR CANCEL_HANG]
endscript


script LA_ManualHPE 
    endgap GapID = Man1 text = 'Manual Through The HP!' Score = 100
endscript


script LA_Box2BoxS 
    StartGap GapID = Box1 flags = [ CANCEL_GROUND CANCEL_HANG ]
endscript


script LA_Box2BoxE 
    endgap GapID = Box1 text = 'Box 2 Box' Score = 6969
endscript


script LA_SmackPoleS 
    StartGap GapID = pole1 flags = [ CANCEL_GROUND CANCEL_WALLRIDE CANCEL_HANG ]
endscript


script LA_SmackPoleE 
    endgap GapID = pole1 text = 'Smack The Pole' Score = 1112
endscript


script LA_HitLedgeRightS 
    StartGap GapID = ledgeR1 flags = [CANCEL_GROUND CANCEL_WALLRIDE CANCEL_MANUAL CANCEL_WALK CANCEL_HANG]
endscript


script LA_HitLedgeRightE 
    endgap GapID = ledgeR1 text = 'Hit Ledge Right' Score = 800
endscript


script LA_HitLedgeLeftS 
    StartGap GapID = ledgeL1 flags = [ CANCEL_GROUND CANCEL_WALLRIDE CANCEL_HANG ]
endscript


script LA_HitLedgeLeftE 
    endgap GapID = ledgeL1 text = 'Hit Ledge Left' Score = 800
endscript


script DJ_2d_sign_element_create parent = menu3d_anchor
    if GetGlobalFlag flag = SCREEN_MODE_WIDE
        <Offset> = (-8.0, 0.0)
    else
        <Offset> = (0.0, 0.0)
    endif
    Theme_GetPauseBarColor return_value = warning_color
    CreateScreenElement {
        type = ContainerElement
        parent = <parent>
        id = DJ_warning
        Pos = (0.0, 0.0)
        z_priority = -53
    }
    CreateScreenElement {
        type = SpriteElement
        parent = DJ_warning
        texture = DJ_icon_1
        id = DJ_quad1
        Scale = (0.800000011920929, 3.200000047683716)
        rgba = <warning_color>
        Pos = ((138.0, 180.0) + <Offset>)
        rot_angle = 0
        just = [ left top ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = DJ_warning
        texture = DJ_icon_1
        id = DJ_quad2
        Scale = (0.800000011920929, 3.200000047683716)
        rgba = <warning_color>
        Pos = ((84.0, 252.0) + <Offset>)
        rot_angle = 0
        just = [ left top ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = DJ_warning
        texture = DJ_icon_1
        id = DJ_quad3
        Scale = (0.800000011920929, 3.200000047683716)
        rgba = <warning_color>
        Pos = ((29.0, 284.0) + <Offset>)
        rot_angle = 0
        just = [ left top ]
        flip_v
    }
    CreateScreenElement {
        type = SpriteElement
        parent = DJ_warning
        texture = DJ_icon_1
        id = DJ_quad4
        Scale = (0.800000011920929, 3.200000047683716)
        rgba = <warning_color>
        Pos = ((-24.0, 218.0) + <Offset>)
        rot_angle = 0
        just = [ left top ]
        flip_v
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <parent>
        texture = DJ_icon_2
        id = DJ_chevron1
        Scale = (1.7999999523162842, 3.5999999046325684)
        rgba = [ 128 128 128 100 ]
        Pos = ((59.0, 220.0) + <Offset>)
        rot_angle = 0
        just = [ center center ]
        z_priority = -51
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <parent>
        texture = DJ_icon_2
        id = DJ_chevron2
        Scale = (1.2000000476837158, 2.4000000953674316)
        rgba = [ 128 128 128 40 ]
        Pos = ((59.0, 170.0) + <Offset>)
        rot_angle = 0
        just = [ center center ]
        z_priority = -51
    }
    RunScriptOnScreenElement id = <parent> DJ_chevron_anim
endscript


script DJ_chevron_anim 
    begin 
    RunScriptOnScreenElement id = DJ_chevron2 DJ_chevron_flash_anim
    wait 0.5000 seconds
    RunScriptOnScreenElement id = DJ_chevron1 DJ_chevron_flash_anim
    wait 0.5000 seconds
    RunScriptOnScreenElement id = DJ_warning DJ_warning_anim
    repeat 
endscript


script DJ_chevron_flash_anim 
    DoMorph time = 0 alpha = 0
    DoMorph time = 0.5000 alpha = 1
    wait 0.2000 seconds
    DoMorph time = 0.5000 alpha = 0
endscript


script DJ_warning_anim 
    DoMorph time = 0 alpha = 0
    DoMorph time = 0.2500 alpha = 0.5000
    wait 0.2000 seconds
    DoMorph time = 0.2500 alpha = 0
endscript

