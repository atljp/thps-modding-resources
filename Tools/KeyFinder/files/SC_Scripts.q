
script SC_setup 
    if IsCareerMode
    else
    endif
    create_panel_message style = panel_message_death text = ' '
endscript


script SC_Startup 
endscript


script TRG_SC_Car01 
    Car_Generic01 StickToGround TurnDist = 70 DefaultSpeed = 10
endscript


script SC_goals 
    if InMultiPlayerGame
        add_multiplayer_mode_goals
    endif
    if NOT InSplitScreenGame
        if ((GameModeEquals is_classic)|| (InNetGame))
            printf 'adding classic goals'
            AddGoal_HighScore {
                unlimited_time
                classic_mode_goal
                goal_text = SC_Classic_HighScore_Text
                view_goals_cameras = [{
                        name = Cam_score
                        frames = 1200
                        skippable = 1
                    }
                ]
                difficulty_level_params = [
                    {Score = SC_Classic_Easy_HighScore
                        goal_text = SC_Classic_Easy_HighScore_Text
                        view_goals_text = SC_Classic_Easy_HighScore_Text
                    }
                    {Score = SC_Classic_HighScore
                        goal_text = SC_Classic_HighScore_Text
                        view_goals_text = SC_Classic_HighScore_Text
                    }
                ]
            }
            AddGoal_ProScore {
                unlimited_time
                classic_mode_goal
                Score = SC_Classic_ProScore
                goal_text = SC_Classic_ProScore_Text
                view_goals_text = SC_Classic_ProScore_Text
                difficulty_level_params = [
                    {Score = SC_Classic_Easy_ProScore
                        goal_text = SC_Classic_Easy_ProScore_Text
                        view_goals_text = SC_Classic_Easy_ProScore_Text
                    }
                    {Score = SC_Classic_ProScore
                        goal_text = SC_Classic_ProScore_Text
                        view_goals_text = SC_Classic_ProScore_Text
                    }
                ]
            }
            AddGoal_SickScore {
                unlimited_time
                classic_mode_goal
                Score = SC_Classic_SickScore
                goal_text = SC_Classic_SickScore_Text
                view_goals_text = SC_Classic_SickScore_Text
                difficulty_level_params = [
                    {Score = SC_Classic_Easy_SickScore
                        goal_text = SC_Classic_Easy_SickScore_Text
                        view_goals_text = SC_Classic_Easy_SickScore_Text
                    }
                    {Score = SC_Classic_SickScore
                        goal_text = SC_Classic_SickScore_Text
                        view_goals_text = SC_Classic_SickScore_Text
                    }
                ]
            }
            AddGoal_HighCombo {
                unlimited_time
                classic_mode_goal
                Score = SC_Classic_HighCombo
                goal_text = SC_Classic_HighCombo_Text
                view_goals_text = SC_Classic_HighCombo_Text
                difficulty_level_params = [
                    {Score = SC_Classic_Easy_HighCombo
                        goal_text = SC_Classic_Easy_HighCombo_Text
                        view_goals_text = SC_Classic_Easy_HighCombo_Text
                    }
                    {Score = SC_Classic_HighCombo
                        goal_text = SC_Classic_HighCombo_Text
                        view_goals_text = SC_Classic_HighCombo_Text
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
                        targetOffset = (3407.60009765625, -3013.60009765625, 6918.0)
                        positionOffset = (-1470.699951171875, -353.5, -1396.0)
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
                        targetOffset = (6477.89990234375, -1804.9000244140625, 7037.5)
                        positionOffset = (-301.29998779296875, -678.5, -226.89999389648438)
                        frames = 200
                        skippable = 1
                    }
                ]
            }
            AddGoal_Collect {
                unlimited_time
                init_script = SC_AlarmsCreate
                goal_deactivate_script = SC_AlarmsKill
                classic_mode_goal
                collect_type = 'Fire Alarms'
                goal_text = 'Set Off 5 Fire Alarms'
                view_goals_text = 'Set Off 5 Fire Alarms'
                use_hud_counter
                hud_counter_caption = '5 Fire Alrams Set Off!'
                goal_flags = [got_1
                    got_2
                    got_3
                    got_4
                    got_5
                ]
                view_goals_cameras = [{virtual_cam
                        TargetID = world
                        targetOffset = (-5087.10009765625, -3160.800048828125, -7619.2998046875)
                        positionOffset = (-1366.5999755859375, -609.4000244140625, 1305.199951171875)
                        frames = 200
                        skippable = 1
                    }
                ]
            }
            AddGoal_Collect {
                unlimited_time
                init_script = SC_BooksCreate
                goal_deactivate_script = SC_BooksKill
                classic_mode_goal
                version = 2
                collect_type = 'School Books'
                goal_text = 'Smash The 5 School Books'
                view_goals_text = 'Smash The 5 School Books'
                use_hud_counter
                hud_counter_caption = 'Smash The 5 School Books'
                goal_flags = [got_1
                    got_2
                    got_3
                    got_4
                    got_5
                ]
                view_goals_cameras = [{virtual_cam
                        TargetID = world
                        targetOffset = (1934.800048828125, -3379.800048828125, -8602.7001953125)
                        positionOffset = (5037.60009765625, -583.2999877929688, 483.1000061035156)
                        frames = 200
                        skippable = 1
                    }
                ]
            }
            AddGoal_Gaps {
                unlimited_time
                classic_mode_goal
                version = 2
                goal_text = 'Double Kickflip The Kicker Gap'
                view_goals_text = 'Double Kickflip The Kicker Gap'
                goal_description = 'Double Kickflip The Kicker Gap'
                goal_flags = [ got_1
                 ]
                view_goals_cameras = [{virtual_cam
                        TargetID = world
                        targetOffset = (8564.900390625, -1512.5999755859375, 30.0)
                        positionOffset = (-1372.199951171875, -604.0, 684.4000244140625)
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
                secret_tape_id = TRG_SC_SecretTape
                view_goals_cameras = [{virtual_cam
                        TargetID = world
                        targetOffset = (6603.60009765625, -4163.10009765625, 3116.0)
                        positionOffset = (-1907.0999755859375, -28.399999618530273, -119.9000015258789)
                        frames = 200
                        skippable = 1
                    }
                ]
            }
        endif
    endif
endscript


script SC_BooksCreate 
    Create prefix = 'SC_School_Books_Pile'
    Create prefix = 'SC_School_BooksTrigger'
endscript


script SC_BooksKill 
    Kill prefix = 'SC_School_Books_Pile'
    Kill prefix = 'SC_School_BooksTrigger'
endscript


script SC_AlarmsCreate 
    Create prefix = 'SC_Alarms_trigger'
    Create prefix = 'SC_Alarms'
endscript


script SC_AlarmsKill 
    Kill prefix = 'SC_Alarms'
    if IsAlive name = SC_Alarms_trigger01
        Kill prefix = 'SC_Alarms_trigger'
    endif
endscript


script SC_Secret_Tape 
endscript


script SC_Books 
    Kill name = <name>
    Kill name = <Book>
    playsound SmashCake
    switch <name>
        case SC_School_Books_Pile01
        goal_collect_got_object goal_id = sc_classic_goal_collect2 flag = got_1
        CreateGlobalFlexParticlesystem name = JOW_Books01 params_script = JOW_SC_Books01_particle_params
        JOW_Books01 ::obj_setposition position = (-2322.5400390625, -701.4310302734375, 219.11099243164062)
        CreateFastParticleSystem name = JOW_Books01a params_script = JOW_SC_Books01_fast_particle_params
        case SC_School_Books_Pile02
        goal_collect_got_object goal_id = sc_classic_goal_collect2 flag = got_2
        CreateGlobalFlexParticlesystem name = JOW_Books02 params_script = JOW_SC_Books02_particle_params
        JOW_Books02 ::obj_setposition position = (2903.639892578125, -699.656982421875, -1260.449951171875)
        CreateFastParticleSystem name = JOW_Books02a params_script = JOW_SC_Books02_fast_particle_params
        case SC_School_Books_Pile03
        goal_collect_got_object goal_id = sc_classic_goal_collect2 flag = got_3
        CreateGlobalFlexParticlesystem name = JOW_Books03 params_script = JOW_SC_Books03_particle_params
        JOW_Books03 ::obj_setposition position = (-2621.9599609375, 115.21260070800781, -3446.89990234375)
        CreateFastParticleSystem name = JOW_Books03a params_script = JOW_SC_Books03_fast_particle_params
        case SC_School_Books_Pile04
        goal_collect_got_object goal_id = sc_classic_goal_collect2 flag = got_4
        CreateGlobalFlexParticlesystem name = JOW_Books04 params_script = JOW_SC_Books04_particle_params
        JOW_Books04 ::obj_setposition position = (4997.8701171875, -630.1929931640625, 376.2179870605469)
        CreateFastParticleSystem name = JOW_Books04a params_script = JOW_SC_Books04_fast_particle_params
        case SC_School_Books_Pile05
        goal_collect_got_object goal_id = sc_classic_goal_collect2 flag = got_5
        CreateGlobalFlexParticlesystem name = JOW_Books05 params_script = JOW_SC_Books05_particle_params
        JOW_Books05 ::obj_setposition position = (-674.4669799804688, -184.06900024414062, -2481.219970703125)
        CreateFastParticleSystem name = JOW_Books05a params_script = JOW_SC_Books05_fast_particle_params
    endswitch
endscript


script SC_Alarms 
    Kill name = <name>
    Kill name = <part>
    Kill name = <Trig>
    playsound SmashCake
    switch <name>
        case SC_Alarms01
        goal_collect_got_object goal_id = sc_classic_goal_collect flag = got_1
        CreateGlobalFlexParticlesystem name = JOW_Alarm01 params_script = JOW_SC_Alarm01_particle_params
        CreateGlobalFlexParticlesystem name = JOW_Alarm01a params_script = JOW_SC_Alarm01a_particle_params
        JOW_Alarm01 ::obj_setposition position = (6744.18994140625, -671.301025390625, -1023.260009765625)
        JOW_Alarm01a ::obj_setposition position = (6744.18994140625, -671.301025390625, -1023.260009765625)
        case SC_Alarms02
        goal_collect_got_object goal_id = sc_classic_goal_collect flag = got_2
        CreateGlobalFlexParticlesystem name = JOW_Alarm02 params_script = JOW_SC_Alarm02_particle_params
        CreateGlobalFlexParticlesystem name = JOW_Alarm02a params_script = JOW_SC_Alarm02a_particle_params
        JOW_Alarm02 ::obj_setposition position = (2004.050048828125, -660.6530151367188, 3661.469970703125)
        JOW_Alarm02a ::obj_setposition position = (2004.050048828125, -660.6530151367188, 3661.469970703125)
        case SC_Alarms03
        goal_collect_got_object goal_id = sc_classic_goal_collect flag = got_3
        CreateGlobalFlexParticlesystem name = JOW_Alarm03 params_script = JOW_SC_Alarm03_particle_params
        CreateGlobalFlexParticlesystem name = JOW_Alarm03a params_script = JOW_SC_Alarm03a_particle_params
        JOW_Alarm03 ::obj_setposition position = (2739.239990234375, -607.4959716796875, -819.8380126953125)
        JOW_Alarm03a ::obj_setposition position = (2739.239990234375, -607.4959716796875, -819.8380126953125)
        case SC_Alarms04
        goal_collect_got_object goal_id = sc_classic_goal_collect flag = got_4
        CreateGlobalFlexParticlesystem name = JOW_Alarm04 params_script = JOW_SC_Alarm04_particle_params
        CreateGlobalFlexParticlesystem name = JOW_Alarm04a params_script = JOW_SC_Alarm04a_particle_params
        JOW_Alarm04 ::obj_setposition position = (-2298.25, -154.8730010986328, -3834.969970703125)
        JOW_Alarm04a ::obj_setposition position = (-2298.25, -154.8730010986328, -3834.969970703125)
        case SC_Alarms05
        goal_collect_got_object goal_id = sc_classic_goal_collect flag = got_5
        CreateGlobalFlexParticlesystem name = JOW_Alarm05 params_script = JOW_SC_Alarm05_particle_params
        CreateGlobalFlexParticlesystem name = JOW_Alarm05a params_script = JOW_SC_Alarm05a_particle_params
        JOW_Alarm05 ::obj_setposition position = (-1417.4200439453125, -662.9390258789062, 1186.7900390625)
        JOW_Alarm05a ::obj_setposition position = (-1417.4200439453125, -662.9390258789062, 1186.7900390625)
    endswitch
endscript


script ALC_Televator { text = 'Asshole!' }
    if NOT GotParam cut
        create_panel_message {
            id = leaving_message
            text = <text>
            Pos = (320.0, 150.0)
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
        create_panel_message id = death_message text = 'You forgot node=<nodename>!!' Pos = (320.0, 200.0)
    endif
endscript


script whatever 
    bouncy
    wait 4 second
    Die
endscript


script Basket 
    GetBonus Score = 1000 text = 'Gym Backboard Shattered!!'
    ShatterAndDie name = School_Gym_Backboard area = 100 variance = 0.0 vel_x = 50 vel_y = 50 vel_z = 50 spread = 0.5000
    playsound HitGlassPane2x volume = 100.0 pitch = 100.0
    Kill name = School_Gym_Backboard01
endscript


script SC_Secret_Entrance 
    GetBonus Score = 1000 text = 'Crack!'
    Create name = SC_BreakeableGate_02
    ShatterAndDie name = SC_BreakeableGate_02 area = 100 variance = 0.0 vel_x = 50 vel_y = 50 vel_z = 50 spread = 0.5000 texture_swap = cg_se2_shatter_grate
    ShatterAndDie name = SC_BreakeableGate area = 100 variance = 0.0 vel_x = 50 vel_y = 50 vel_z = 50 spread = 0.5000 texture_swap = cg_se2_shatter_grate
    playsound HitGlassPane2x volume = 100.0 pitch = 100.0
    Kill name = SC_BreakeableGate
    Kill name = SC_BreakeableGateTrigg
    Kill name = SC_BreakeableGate_02
endscript


script SC_WoodPlank 
    ShatterAndDie name = skylight001 area = 5000 variance = 4 vel_x = 50 vel_y = 50 vel_z = 50 spread = 1 playsound HitGlassPane2x volume = 100.0 pitch = 100.0
    Kill name = Plank_TriggerBox01
    Kill name = Plank_TriggerBox02
endscript


script SC_gymdoor_move 
    Gym_Door ::obj_movetonode name = TRG_MoveGymDoor Speed = 65
endscript


script SC_gymdoor_move1 
    Gym_Door ::obj_movetonode name = TRG_615 Speed = 65
endscript


script Scoreboard_small_style 
    Pos = (20.0, 10.0)
    DoMorph Scale = 1.200
    begin 
    DoMorph time = 0.1000 Pos = (320.0, 290.0)
    DoMorph time = 0.1000 Pos = (320.0, 280.0)
    rgba = {255 , 50 , 50 , 128}
    repeat 10
endscript


script wait_and_kill_eq_text 
    wait 1 seconds
    DestroyScreenElement id = scoreboard
endscript


script NO_neon_burst 
    playsound HitVideoGame1 pitch = randomrange (90.0, 120.0)
    nightvision_hud
    wait 1 frames
    really_kill_flicker_nightvision_hud
endscript


script Light_Alley_Break1 
    printf 'ShatterandDie lights'
    ShatterAndDie name = <name> area = 5000 variance = 4 vel_x = 50 vel_y = 50 vel_z = 50
    spread = 1
    playsound HitGlassPane2x volume = 100.0 pitch = 100.0
endscript


script sc_glass_rotate 
    if NOT IsAlive name = skylight08
        Create name = skylight08
    endif
    Kill name = skylight001
    GetBonus Score = 1000 text = 'Glass Broken!'
    skylight08 ::obj_rotate absolute = (0.0, -42.0, 0.0) time = 2.500 flag_max_coords
    Kill name = Plank_TriggerBox01
    ShatterAndDie name = Plank_TriggerBox01 area = 5000 variance = 4 vel_x = 50 vel_y = 50 vel_z = 50
    spread = 1
    obj_playsound HitMetalCan vol = 120
    wait 2 second
    Kill name = skylight08
    Create name = skylight09
    ShatterAndDie name = skylight09 area = 5000 variance = 4 vel_x = 50 vel_y = 50 vel_z = 50
    spread = 1
    obj_playsound HitGlassPane2x vol = 150
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


script SC_SickTrans_Gap 
    StartGap flags = [ CANCEL_GROUND CANCEL_HANG ]
    endgap text = 'Sick Hip Transfer' Score = 5000
endscript


script SC_AirConTrans_Gap 
    StartGap flags = [ CANCEL_GROUND CANCEL_HANG ]
    endgap text = 'Air Conditioner Hip' Score = 750
endscript


script SC_ManualSlope_Gap 
    StartGap flags = [ PURE_MANUAL CANCEL_GROUND CANCEL_HANG ]
    endgap text = 'Manual The Big Slope' Score = 2000
endscript


script SC_SmallTrans_GapS 
    StartGap GapID = smalltrans flags = [ CANCEL_GRIND CANCEL_GROUND CANCEL_HANG ]
endscript


script SC_SmallTrans_GapE 
    endgap GapID = smalltrans text = 'Small Transfer' Score = 200
endscript


script SC_ManualHandi_Gap 
    StartGap flags = [PURE_MANUAL , CANCEL_GROUND CANCEL_GRIND CANCEL_AIR CANCEL_HANG]
    endgap text = 'Manual The Handicap Slope' Score = 1000
endscript


script SC_StrangeTrans_GapS 
    StartGap GapID = Starnge5 flags = [ REQUIRE_AIR CANCEL_WALK CANCEL_HANG ]
endscript


script SC_StrangeTrans_GapE 
    endgap GapID = Starnge5 text = 'Strange Transfer' Score = 123
endscript


script SC_ToBrick_GapS 
    StartGap GapID = Starnge flags = [ REQUIRE_AIR CANCEL_HANG ]
endscript


script SC_ToBrick_GapE 
    endgap GapID = Starnge text = '2 Brick!' Score = 1750
endscript


script SC_BombDrop_Gap 
    StartGap flags = [ CANCEL_GROUND REQUIRE_AIR CANCEL_HANG ]
    endgap text = 'Roof Bomb' Score = 500
endscript


script SC_MtheAir_GapS 
    StartGap GapID = Air flags = [ REQUIRE_MANUAL CANCEL_HANG ]
endscript


script SC_MtheAir_GapE 
    endgap GapID = Air text = 'M To The Air' Score = 750
endscript


script SC_LipDiver_GapS 
    StartGap GapID = manroof flags = [ REQUIRE_LIP CANCEL_GROUND CANCEL_HANG ]
endscript


script SC_LipDiver_GapE 
    endgap GapID = manroof text = 'Lip Diver' Score = 1500
endscript


script SC_FlatRoofDrop_GapS 
    StartGap GapID = flat1 flags = [ CANCEL_GROUND REQUIRE_AIR CANCEL_HANG ]
endscript


script SC_FlatRoofDrop_GapE 
    endgap GapID = flat1 text = 'Flat Roof Drop' Score = 800
endscript


script SC_Planter2Bench_GapS 
    StartGap GapID = flat3 flags = [ CANCEL_GROUND CANCEL_WALK CANCEL_HANG ]
endscript


script SC_Planter2Bench_GapE 
    endgap GapID = flat3 text = 'Planter 2 Bench' Score = 200
endscript


script SC_Brick2Metal_GapS 
    StartGap GapID = flat3 flags = [ CANCEL_GROUND CANCEL_WALK CANCEL_HANG ]
endscript


script SC_Brick2Metal_GapE 
    endgap GapID = flat3 text = 'Brick 2 Metal' Score = 150
endscript


script SC_QP2Metal_GapS 
    StartGap GapID = flat4 flags = [ CANCEL_GROUND REQUIRE_AIR CANCEL_HANG ]
endscript


script SC_QP2Metal_GapE 
    endgap GapID = flat4 text = 'QP 2 Metal' Score = 400
endscript


script SC_Traingle_GapS 
    StartGap GapID = flat6 flags = [ CANCEL_GROUND CANCEL_WALK CANCEL_HANG ]
endscript


script SC_Traingle_GapE 
    endgap GapID = flat6 text = 'Triangle 2 Triangle' Score = 400
endscript


script SC_Traingle_GapS1 
    StartGap GapID = flat7 flags = [ CANCEL_GROUND CANCEL_WALK CANCEL_HANG ]
endscript


script SC_Traingle_GapE1 
    endgap GapID = flat7 text = 'Triangle 2 Triangle' Score = 400
endscript


script SC_LipKicker_GapS 
    StartGap GapID = flat8 flags = [ CANCEL_GROUND REQUIRE_LIP CANCEL_HANG ]
endscript


script SC_LipKicker_GapE 
    endgap GapID = flat8 text = 'Lip The Kicker Edge' Score = 800
endscript


script SC_AirBridge_GapS 
    StartGap GapID = flat9 flags = [ REQUIRE_AIR CANCEL_GROUND CANCEL_RAIL CANCEL_HANG ]
endscript


script SC_AirBridge_GapE 
    endgap GapID = flat9 text = 'Air Bridge' Score = 300
endscript


script SC_Rail2Rail_GapS 
    StartGap GapID = flat10 flags = [ CANCEL_GROUND CANCEL_HANG ]
endscript


script SC_Rail2Rail_GapE 
    endgap GapID = flat10 text = 'Rail 2 Rail' Score = 300
endscript


script SC_Rail2Rail_GapS1 
    StartGap GapID = flat10 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_HANG ]
endscript


script SC_Rail2Rail_GapE1 
    endgap GapID = flat10 text = 'Rail 2 Rail' Score = 300
endscript


script SC_HugeRail2High_GapS 
    StartGap GapID = flat11 flags = [ CANCEL_GROUND CANCEL_WALK CANCEL_HANG ]
endscript


script SC_HugeRail2High_GapE 
    endgap GapID = flat11 text = 'Huge Ledge 2 High Rail' Score = 1100
endscript


script SC_WallCorner_Gap 
    StartGap flags = [ CANCEL_GROUND REQUIRE_WALLRIDE CANCEL_HANG ]
    endgap text = 'Ride The Corner' Score = 400
endscript


script SC_QP2PoolEdge_GapS 
    StartGap GapID = flat10 flags = [ CANCEL_GROUND CANCEL_HANG ]
endscript


script SC_QP2PoolEdge_GapE 
    endgap GapID = flat10 text = 'QP 2 Pool Edge' Score = 1000
endscript


script SC_TLaunch2T_GapS 
    StartGap GapID = flat10 flags = [ CANCEL_GROUND CANCEL_HANG ]
endscript


script SC_TLaunch2T_GapE 
    endgap GapID = flat10 text = 'T Launch 2 T' Score = 1250
endscript


script SC_ManualBridge_GapS 
    StartGap GapID = flat10 flags = [ PURE_MANUAL CANCEL_HANG ]
endscript


script SC_ManualBridge_GapE 
    endgap GapID = flat10 text = 'Manual The Bridge' Score = 350
endscript


script SC_GiganticBomb_GapS 
    StartGap GapID = flat10 flags = [ CANCEL_GROUND REQUIRE_AIR CANCEL_HANG ]
endscript


script SC_GiganticBomb_GapE 
    endgap GapID = flat10 text = 'Drop The Giant Bomb!' Score = 6000
endscript


script SC_T2Bar_GapS 
    StartGap GapID = flat10 flags = [ CANCEL_GROUND REQUIRE_RAIL CANCEL_HANG ]
endscript


script SC_T2Bar_GapE 
    endgap GapID = flat10 text = 'T 2 Bar' Score = 350
endscript


script SC_MetalTransfer_Gap 
    StartGap flags = [ REQUIRE_AIR CANCEL_GROUND CANCEL_HANG ]
    endgap text = 'Metal Transfer' Score = 500
endscript


script SC_WallButter_GapS 
    StartGap GapID = flat10 flags = [ REQUIRE_WALL CANCEL_GROUND CANCEL_HANG ]
endscript


script SC_WallButter_GapE 
    endgap GapID = flat10 text = 'Wallride Over Butterfinger!' Score = 1250
endscript


script SC_T2Ditch_GapS 
    StartGap GapID = flat10 flags = [ REQUIRE_AIR CANCEL_GROUND CANCEL_HANG ]
endscript


script SC_T2Ditch_GapE 
    endgap GapID = flat10 text = 'T 2 Ditch' Score = 1250
endscript


script SC_BigKick2Metal_GapS 
    StartGap GapID = flat10 flags = [ REQUIRE_AIR CANCEL_GROUND CANCEL_HANG ]
endscript


script SC_BigKick2Metal_GapE 
    endgap GapID = flat10 text = 'Big Kick 2 Metal!' Score = 1420
endscript


script SC_Handi_Gap 
    StartGap flags = [ CANCEL_GROUND CANCEL_HANG ]
    endgap text = 'Handicap Rail' Score = 500
endscript


script SC_Gimme_GapStart 
    StartGap GapID = gimme1 flags = [ CANCEL_GROUND CANCEL_HANG ]
endscript


script SC_Gimme_GapEnd 
    endgap GapID = gimme1 text = 'Gimme Gap' Score = 50
endscript


script SC_Dumpster_GapStart 
    StartGap GapID = Dump1 flags = [ CANCEL_GROUND CANCEL_HANG ]
    endgap GapID = Dump2 text = 'Dumpster Rail Gap' Score = 250
endscript


script SC_Dumpster_GapEnd 
    StartGap GapID = Dump2 flags = [ CANCEL_GROUND CANCEL_HANG ]
    endgap GapID = Dump1 text = 'Dumpster Rail Gap' Score = 250
endscript


script SC_Dumpster1_GapStart 
    StartGap GapID = dump11 flags = [ CANCEL_GROUND CANCEL_HANG ]
    endgap GapID = dump12 text = 'Dumpster Rail Gap' Score = 250
endscript


script SC_Dumpster1_GapEnd 
    StartGap GapID = dump12 flags = [ CANCEL_GROUND CANCEL_HANG ]
    endgap GapID = dump11 text = 'Dumpster Rail Gap' Score = 250
endscript


script SC_Planter_GapStart 
    StartGap GapID = Plant1 flags = [ CANCEL_GROUND CANCEL_HANG ]
endscript


script SC_Planter_GapEnd 
    endgap GapID = Plant1 text = 'Planter Gap' Score = 100
endscript


script SC_Planter1_GapStart 
    StartGap GapID = plant11 flags = [ CANCEL_GROUND CANCEL_HANG ]
endscript


script SC_Planter1_GapEnd 
    endgap GapID = plant11 text = 'Planter Gap' Score = 100
endscript


script SC_AC_Gap 
    StartGap flags = [ CANCEL_GROUND PURE_AIR CANCEL_HANG ]
    endgap text = 'Over The Air Conditioner' Score = 750
endscript


script SC_Planter2_GapStart 
    StartGap GapID = plant22 flags = [ CANCEL_GROUND CANCEL_HANG ]
endscript


script SC_Planter2_GapEnd 
    endgap GapID = plant22 text = 'Planter Gap' Score = 100
endscript


script SC_RoofAwning_GapS 
    StartGap GapID = RoofA flags = [ CANCEL_GROUND CANCEL_WALK CANCEL_HANG ]
endscript


script SC_RoofAwning_GapE 
    endgap GapID = RoofA text = 'Roof 2 Awning' Score = 750
endscript


script SC_Ditch_GapS 
    StartGap GapID = ditch flags = [ CANCEL_WALK CANCEL_GROUND CANCEL_HANG ]
endscript


script SC_Ditch_GapE 
    endgap GapID = ditch text = 'Ditch Slap' Score = 250
endscript


script SC_Bridge_Gap 
    StartGap flags = [ PURE_AIR CANCEL_HANG ]
    endgap text = 'Over A Footbridge' Score = 1000
endscript


script SC_Swim_Gap 
    StartGap flags = [ PURE_AIR CANCEL_HANG ]
    endgap text = 'Swim Team Gap' Score = 1000
endscript


script SC_Park_Gap 
    StartGap flags = [ PURE_AIR CANCEL_GROUND CANCEL_HANG ]
    endgap text = 'Park Gap' Score = 500
endscript


script SC_GapStart_KickerGap 
    StartGap GapID = CommonStairs flags = [ PURE_AIR CANCEL_HANG ] TrickText = 'Double Kickflip' TrickScript = SC_Classic_Gaps_Got1
endscript


script SC_GapEnd_KickerGap 
    endgap GapID = CommonStairs Score = 100 text = 'Kicker Gap'
endscript


script SC_Classic_Gaps_Got1 
    GoalManager_SetGoalFlag name = SC_classic_goal_gaps2 got_1 1
endscript


script SC_Mini_GapStart 
    StartGap GapID = mini1 flags = [ CANCEL_GROUND CANCEL_HANG ]
    endgap GapID = mini2 text = 'Mini Gap' Score = 250
endscript


script SC_Mini_GapEnd 
    StartGap GapID = mini2 flags = [ CANCEL_GROUND CANCEL_HANG ]
    endgap GapID = mini1 text = 'Mini Gap' Score = 250
endscript


script SC_Mini1_GapStart 
    StartGap GapID = mini11 flags = [ CANCEL_GROUND CANCEL_HANG ]
    endgap GapID = mini12 text = 'Mini Gap' Score = 250
endscript


script SC_Mini1_GapEnd 
    StartGap GapID = mini12 flags = [ CANCEL_GROUND CANCEL_HANG ]
    endgap GapID = mini11 text = 'Mini Gap' Score = 250
endscript


script SC_Mini_Gap 
    StartGap flags = [ PURE_AIR , CANCEL_GROUND CANCEL_HANG ]
    endgap text = 'Mini Gap' Score = 250
endscript


script SC_Mini2_GapStart 
    StartGap GapID = mini21 flags = [ CANCEL_GROUND CANCEL_HANG ]
    endgap GapID = mini22 text = 'Mini Gap' Score = 250
endscript


script SC_Mini2_GapEnd 
    StartGap GapID = mini22 flags = [ CANCEL_GROUND CANCEL_HANG ]
    endgap GapID = mini21 text = 'Mini Gap' Score = 250
endscript


script SC_Long_Gap 
    StartGap flags = [ CANCEL_GROUND CANCEL_HANG ]
    endgap text = 'Long Ass Rail' Score = 2500
endscript


script SC_Play_Gap 
    StartGap flags = [ CANCEL_GROUND CANCEL_HANG ]
    endgap text = 'Playground Rail' Score = 500
endscript


script SC_Huge_GapS 
    StartGap GapID = HugeG flags = [ CANCEL_GROUND CANCEL_WALK CANCEL_HANG ]
endscript


script SC_Huge_GapE 
    endgap GapID = HugeG text = 'Huge Rail' Score = 1000
endscript


script sc_f2r_gapstart 
    StartGap GapID = FR1 flags = [ CANCEL_GROUND CANCEL_HANG ]
    endgap GapID = FR2 text = 'Funbox To Rail Transfer' Score = 250
endscript


script SC_F2R_GapEnd 
    StartGap GapID = FR2 flags = [ CANCEL_GROUND CANCEL_HANG ]
    endgap GapID = FR1 text = 'Funbox To Rail Transfer' Score = 250
endscript


script SC_2Table_Gapstart 
    StartGap GapID = t1 flags = [ CANCEL_GROUND CANCEL_HANG ]
    endgap GapID = t2 text = 'Funbox To Table Transfer' Score = 250
endscript


script SC_2Table_GapEnd 
    StartGap GapID = t2 flags = [ CANCEL_GROUND CANCEL_HANG ]
    endgap GapID = t1 text = 'Funbox To Table Transfer' Score = 250
endscript


script SC_Rail2Rail_GapStart 
    StartGap GapID = r1 flags = [ CANCEL_GROUND CANCEL_HANG ]
    endgap GapID = r2 text = 'Rail To Rail Transfer' Score = 750
endscript


script SC_Rail2Rail_GapEnd 
    StartGap GapID = r2 flags = [ CANCEL_GROUND CANCEL_HANG ]
    endgap GapID = r1 text = 'Rail To Rail Transfer' Score = 750
endscript


script SC_Rail2Rail1_GapStart 
    StartGap GapID = r11 flags = [ CANCEL_GROUND CANCEL_HANG ]
    endgap GapID = r12 text = 'Rail To Rail Transfer' Score = 750
endscript


script SC_Rail2Rail1_GapEnd 
    StartGap GapID = r12 flags = [ CANCEL_GROUND CANCEL_HANG ]
    endgap GapID = r11 text = 'Rail To Rail Transfer' Score = 750
endscript


script SC_garbage_GapStart 
    StartGap GapID = go flags = [ CANCEL_GROUND CANCEL_HANG ]
    endgap GapID = go text = 'Garbage Ollie' Score = 50
endscript


script SC_garbage_GapEnd 
    StartGap GapID = go flags = [ CANCEL_GROUND CANCEL_HANG ]
    endgap GapID = go text = 'Garbage Ollie' Score = 50
endscript


script SC_Hall_GapStart 
    StartGap GapID = hp flags = [ CANCEL_MANUAL CANCEL_GROUND CANCEL_HANG ]
endscript


script SC_Hall_GapEnd 
    endgap GapID = hp text = 'Hall Pass' Score = 1000
endscript


script SC_2d_sign_element_create parent = menu3d_anchor
    if GetGlobalFlag flag = SCREEN_MODE_WIDE
        <Offset> = (-8.0, 0.0)
    else
        <Offset> = (0.0, 0.0)
    endif
    CreateScreenElement {
        type = SpriteElement
        parent = <parent>
        texture = SC_icon_1
        id = SC_skull
        Scale = 2.400
        rgba = [ 128 128 128 100 ]
        Pos = ((62.0, 235.0) + <Offset>)
        rot_angle = 0
        just = [ left top ]
        z_priority = -51
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <parent>
        texture = SC_icon_2
        id = SC_flame
        Scale = 2.600
        rgba = [ 128 128 128 80 ]
        Pos = ((54.0, 160.0) + <Offset>)
        rot_angle = -90
        just = [ center center ]
        z_priority = -51
    }
    RunScriptOnScreenElement id = SC_skull SC_skull_anim
    RunScriptOnScreenElement id = SC_skull do_random_effect_paused params = { id = <id> }
    RunScriptOnScreenElement id = SC_flame do_random_effect_paused params = { id = <id> }
endscript


script SC_skull_anim 
    begin 
    DoMorph time = 0 rot_angle = 0
    DoMorph time = 0.1000 rot_angle = Random (@ -3 @ 0 @ 3)
    wait 0.1000 seconds
    repeat 
endscript

