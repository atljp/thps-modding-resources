
script SE2_setup 
    SE2_Initializer
endscript


script SE2_Initializer 
    if ((InMultiPlayerGame)|| (InNetGame))
        Kill prefix = 'Geo_PreEvent'
        Kill prefix = 'TRG_L_Missile'
        Kill name = missle01
        Kill name = 'Geo_MultiOff_UFO01'
        Create name = 'Geo_MultiOn_UFO01'
    endif
endscript


script SE2_Startup 
    LoadParticleTexture 'bits\CG_SE2_Shatter_Plane'
    LoadParticleTexture 'bits\CG_SE2_Shatter_Grate'
endscript


script SE2_goals 
    if NOT InMultiPlayerGame
    endif
    if InMultiPlayerGame
        add_multiplayer_mode_goals
    endif
    if NOT InSplitScreenGame
        if ((GameModeEquals is_classic)|| (InNetGame))
            AddGoal_HighScore {
                unlimited_time
                Score = SE2_Classic_HighScore
                goal_text = SE2_Classic_HighScore_Text
                view_goals_text = SE2_Classic_HighScore_Text
                difficulty_level_params = [
                    {
                        Score = SE2_Classic_Easy_HighScore
                        goal_text = SE2_Classic_Easy_HighScore_Text
                        view_goals_text = SE2_Classic_Easy_HighScore_Text
                    }
                    {
                        Score = SE2_Classic_HighScore
                        goal_text = SE2_Classic_HighScore_Text
                        view_goals_text = SE2_Classic_HighScore_Text
                    }
                ]
                view_goals_cameras = [
                    {
                        name = CAM_Classic_Intro01
                        frames = 301
                        skippable = 1
                    }
                ]
                classic_mode_goal}
            AddGoal_ProScore {
                unlimited_time
                Score = SE2_Classic_ProScore
                goal_text = SE2_Classic_ProScore_Text
                view_goals_text = SE2_Classic_ProScore_Text
                difficulty_level_params = [
                    {
                        Score = SE2_Classic_Easy_ProScore
                        goal_text = SE2_Classic_Easy_ProScore_Text
                        view_goals_text = SE2_Classic_Easy_ProScore_Text
                    }
                    {
                        Score = SE2_Classic_ProScore
                        goal_text = SE2_Classic_ProScore_Text
                        view_goals_text = SE2_Classic_ProScore_Text
                    }
                ]
                classic_mode_goal}
            AddGoal_SickScore {
                unlimited_time
                Score = SE2_Classic_SickScore
                goal_text = SE2_Classic_SickScore_Text
                view_goals_text = SE2_Classic_SickScore_Text
                difficulty_level_params = [
                    {
                        Score = SE2_Classic_Easy_SickScore
                        goal_text = SE2_Classic_Easy_SickScore_Text
                        view_goals_text = SE2_Classic_Easy_SickScore_Text
                    }
                    {
                        Score = SE2_Classic_SickScore
                        goal_text = SE2_Classic_SickScore_Text
                        view_goals_text = SE2_Classic_SickScore_Text
                    }
                ]
                classic_mode_goal}
            AddGoal_HighCombo {
                unlimited_time
                Score = SE2_Classic_HighCombo
                goal_text = SE2_Classic_HighCombo_Text
                view_goals_text = SE2_Classic_HighCombo_Text
                difficulty_level_params = [
                    {
                        Score = SE2_Classic_Easy_HighCombo
                        goal_text = SE2_Classic_Easy_HighCombo_Text
                        view_goals_text = SE2_Classic_Easy_HighCombo_Text
                    }
                    {
                        Score = SE2_Classic_HighCombo
                        goal_text = SE2_Classic_HighCombo_Text
                        view_goals_text = SE2_Classic_HighCombo_Text
                    }
                ]
                classic_mode_goal}
            AddGoal_Skate {
                unlimited_time
                S_obj_id = TRG_SKATE_S
                K_obj_id = TRG_SKATE_K
                A_obj_id = TRG_SKATE_A
                T_obj_id = TRG_SKATE_T
                E_obj_id = TRG_SKATE_E
                view_goals_cameras = [
                    {
                        virtual_cam
                        TargetID = world
                        targetOffset = (2869.39990234375, -4514.0, 13101.900390625)
                        positionOffset = (-4377.7001953125, 507.8999938964844, 8384.2001953125)
                        frames = 200
                        skippable = 1
                    }
                ]
                classic_mode_goal}
            AddGoal_Combo {
                unlimited_time
                letter_info = [
                    {obj_id = TRG_COMBO_C text = 'C'}
                    {obj_id = TRG_COMBO_O text = 'O'}
                    {obj_id = TRG_COMBO_M text = 'M'}
                    {obj_id = TRG_COMBO_B text = 'B'}
                    {obj_id = TRG_COMBO_O01 text = 'O'}
                ]
                view_goals_cameras = [{virtual_cam
                        TargetID = world
                        targetOffset = (2247.300048828125, -3515.699951171875, 9768.2001953125)
                        positionOffset = (-6344.10009765625, 276.29998779296875, 6332.0)
                        frames = 200
                        skippable = 1
                    }
                ]
                classic_mode_goal
            }
            AddGoal_Collect {
                unlimited_time
                collect_type = 'Treasure Chests'
                goal_text = 'Collect 5 Treasure Chests'
                view_goals_text = 'Collect 5 Treasure Chests'
                goal_description = 'Find and Collect 5 Treasure Chests'
                use_hud_counter
                hud_counter_caption = 'Treasure Chests'
                init_script = SE2_ClassicTreasure_Init
                goal_deactivate_script = SE2_ClassicTreasure_Deactivate
                goal_flags = [
                    got_1
                    got_2
                    got_3
                    got_4
                    got_5
                ]
                goal_collect_objects = [
                    {id = SE2_Classic_Treasure01 scr = goal_collect_got_object flag = got_1}
                    {id = SE2_Classic_Treasure02 scr = goal_collect_got_object flag = got_2}
                    {id = SE2_Classic_Treasure03 scr = goal_collect_got_object flag = got_3}
                    {id = SE2_Classic_Treasure04 scr = goal_collect_got_object flag = got_4}
                    {id = SE2_Classic_Treasure05 scr = goal_collect_got_object flag = got_5}
                ]
                view_goals_cameras = [
                    {
                        virtual_cam
                        TargetID = world
                        targetOffset = (-9120.2998046875, -1484.0999755859375, 12846.7001953125)
                        positionOffset = (-3215.5, 265.1000061035156, 4968.2001953125)
                        frames = 200
                        skippable = 1
                    }
                ]
                classic_mode_goal}
            AddGoal_SecretTape {
                goal_text = 'Find the secret tape'
                view_goals_text = 'Find the secret tape'
                goal_description = 'Find the secret tape'
                secret_tape_id = TRG_SecretTape
                view_goals_cameras = [{virtual_cam
                        TargetID = world
                        targetOffset = (5546.39990234375, 5682.2001953125, 4504.2001953125)
                        positionOffset = (-2136.699951171875, 403.3999938964844, 8123.89990234375)
                        frames = 200
                        skippable = 1
                    }
                ]
                classic_mode_goal
            }
            AddGoal_Gaps {
                unlimited_time
                goal_text = 'Activate the Triangles!'
                view_goals_text = 'Activate the Triangles!'
                goal_description = 'Activate the Triangles!'
                goal_flags = [
                    got_1
                    got_2
                    got_3
                ]
                view_goals_cameras = [{virtual_cam
                        TargetID = world
                        targetOffset = (-3836.800048828125, -7379.7001953125, 852.9000244140625)
                        positionOffset = (-3860.60009765625, 787.9000244140625, 6622.0)
                        frames = 200
                        skippable = 1
                    }
                ]
                no_gap_messages
                classic_mode_goal
            }
            AddGoal_Gaps {
                unlimited_time
                version = 2
                collect_type = 'UFO Lip!'
                use_hud_counter
                hud_counter_caption = 'UFO Lip!'
                goal_text = 'Bust a Lip Trick on the UFO!'
                view_goals_text = 'Bust a Lip Trick on the UFO!'
                goal_description = 'Bust a Lip Trick on the UFO!'
                goal_flags = [ got_1 ]
                view_goals_cameras = [{virtual_cam
                        TargetID = world
                        targetOffset = (-8055.10009765625, 3479.60009765625, -4844.7001953125)
                        positionOffset = (-3272.199951171875, 134.8000030517578, 3275.199951171875)
                        frames = 200
                        skippable = 1
                    }
                ]
                classic_mode_goal
            }
        else
            if NOT ((GameModeEquals is_singlesession)|| (GameModeEquals is_creategoals))
                if NOT InNetGame
                endif
            endif
        endif
    endif
endscript


script SE2_ClassicTreasure_Init 
    Create prefix = 'SE2_Classic_Treasure'
endscript


script SE2_ClassicTreasure_Deactivate 
    Kill prefix = 'SE2_Classic_Treasure'
endscript


script SE2_Shark 
    obj_shadowoff
    obj_sticktoground Off
    obj_setpathvelocity 6 mph
    obj_setpathturndist 10
    obj_pathheading on
    obj_followpathlinked orient
    Obj_PlayAnim anim = Swim Cycle
endscript


script SE_CliffJump 
    trigger_speed_boost Speed = 3000 DefSkaterVO = 1
endscript


script SE_TeslaMove 
    GetTriggerArray grind onto
    if triggertype <trigger_array>
        if GetFlag flag = <Tesla>
        else
            SetFlag flag = <Tesla>
            Create prefix = <Tesla>
            SendException Tesla_Grind prefix = <Doors>
        endif
    endif
    if ((GameModeEquals is_classic)|| (InNetGame))
        <triangles> = 0
        if NOT GoalManager_GoalFlagSet name = SE2_Classic_Goal_Gaps flag = <flag>
            GoalManager_SetGoalFlag name = SE2_Classic_Goal_Gaps <flag> 1
            if GetFlag flag = Geo_Tesla01
                <triangles> = (<triangles> + 1)
            endif
            if GetFlag flag = Geo_Tesla02
                <triangles> = (<triangles> + 1)
            endif
            if GetFlag flag = Geo_Tesla03
                <triangles> = (<triangles> + 1)
            endif
            switch <triangles>
                case 0
                case 1
                create_panel_message {text = '1 of 3 Triangles Activated' style = goal_collect_text}
                case 2
                create_panel_message {text = '2 of 3 Triangles Activated' style = goal_collect_text}
                default 
            endswitch
        endif
    endif
    wait 5 seconds
    GotoPreserveParams SE_TeslaCheck
endscript


script SE_TeslaRing 
    obj_movetonode name = <Wypt> Speed = 5
    obj_rotz Speed = <Speed> flag_max_coords
endscript


script SE_TeslaPole 
    obj_movetonode name = <Wypt> Speed = 5
    Obj_WaitMove
    Create prefix = <particle>
    Create name = <Settle>
    Die
endscript


script SE2_TeslaBase_Door 
    Obj_SetException Ex = Tesla_Grind scr = SE2_TeslaDoor_Open params = <...> 
endscript


script SE2_TeslaDoor_Open 
    obj_movetonode name = <down> Speed = 5
    Obj_WaitMove
    wait 0.5000 seconds
    obj_movetonode name = <up> Speed = 5
    Obj_WaitMove
    GotoPreserveParams SE2_TeslaBase_Door
endscript


script SE_TeslaCheck 
    if IsAlive name = Geo_Static_Tesla01_Pole
        if IsAlive name = Geo_Static_Tesla02_Pole
            if IsAlive name = Geo_Static_Tesla03_Pole
                Kill prefix = 'TRG_TeslaBeam_A'
                Kill prefix = 'TRG_TeslaBeam_B'
                Kill prefix = 'TRG_TeslaBeam_C'
                Create prefix = 'TRG_TeslaBeam_D'
                if NOT IsAlive name = Geo_TeslaLine01
                    Create name = Geo_TeslaLine01
                endif
                if NOT IsAlive name = Geo_TeslaLine02
                    Create name = Geo_TeslaLine02
                endif
                if NOT IsAlive name = Geo_TeslaLine03
                    Create name = Geo_TeslaLine03
                endif
            else
                Kill prefix = 'TRG_TeslaBeam_B'
                Kill prefix = 'TRG_TeslaBeam_C'
                Kill prefix = 'TRG_TeslaBeam_D'
                Create prefix = 'TRG_TeslaBeam_A'
                if NOT IsAlive name = Geo_TeslaLine01
                    Create name = Geo_TeslaLine01
                endif
            endif
        else
            if IsAlive name = Geo_Static_Tesla03_Pole
                Kill prefix = 'TRG_TeslaBeam_A'
                Kill prefix = 'TRG_TeslaBeam_B'
                Kill prefix = 'TRG_TeslaBeam_D'
                Create prefix = 'TRG_TeslaBeam_C'
                if NOT IsAlive name = Geo_TeslaLine03
                    Create name = Geo_TeslaLine03
                endif
            endif
        endif
    else
        if IsAlive name = Geo_Static_Tesla02_Pole
            if IsAlive name = Geo_Tesla03_Pole
                Kill prefix = 'TRG_TeslaBeam_A'
                Kill prefix = 'TRG_TeslaBeam_C'
                Kill prefix = 'TRG_TeslaBeam_D'
                Create prefix = 'TRG_TeslaBeam_B'
                if NOT IsAlive name = Geo_TeslaLine02
                    Create name = Geo_TeslaLine02
                endif
            endif
        endif
    endif
endscript


script SE2_UFO_RayGun 
    obj_sticktoground Off
    obj_setpathvelocity 1.800 mph
    obj_pathheading Off
    obj_followpathlinked
    begin 
    obj_rotz Angle = -130 Speed = 75 flag_max_coords
    Obj_WaitRotate
    Create name = <Spark02>
    Create name = <Beam02>
    wait 3 seconds
    Kill name = <Spark02>
    Kill name = <Beam02>
    obj_rotz Angle = 130 Speed = 75 flag_max_coords
    Obj_WaitRotate
    Create name = <Spark01>
    Create name = <Beam01>
    wait 3 seconds
    Kill name = <Spark01>
    Kill name = <Beam01>
    repeat 
endscript


script SE_UFO_Spin 
    obj_sticktoground Off
    obj_setpathvelocity 1.800 mph
    obj_pathheading Off
    obj_followpathlinked
    obj_rotz Speed = 250 flag_max_coords
endscript


script SE_UFO_Still 
    obj_sticktoground Off
    obj_setpathvelocity 1.800 mph
    obj_pathheading Off
    obj_followpathlinked
endscript

UFO_01_Params = {
    Spark01 = Geo_UFO01_Spark01
    Spark02 = Geo_UFO01_Spark02
    Beam01 = Geo_UFO01_Beam01
    Beam02 = Geo_UFO01_Beam02}
UFO_02_Params = {
    Spark01 = Geo_UFO02_Spark01
    Spark02 = Geo_UFO02_Spark02
    Beam01 = Geo_UFO02_Beam01
    Beam02 = Geo_UFO02_Beam02}

script SE2_AlienBlocker 
    obj_shadowoff
    begin 
    Obj_CycleAnim anim = Ped_Blocker_idle numCycles = Random (@ 1 @ 2)
    Obj_CycleAnim anim = Ped_Blocker_idletoBlockA
    Obj_CycleAnim anim = Ped_Blocker_BlockA_idle numCycles = Random (@ 1 @ 3 @ 5)
    Obj_CycleAnim anim = Ped_Blocker_BlockA2BlockB
    Obj_CycleAnim anim = Ped_Blocker_BlockB_idle numCycles = Random (@ 1 @ 3 @ 5)
    Obj_CycleAnim anim = Ped_Blocker_BlockB2idle
    repeat 
endscript


script TableKid 
    Ped_SetLogicState BO_STATE_SWKid_Force table = BO_StateLogic_Table
endscript


script SE2_Radar 
    begin 
    obj_rotz Angle = <to> Speed = 30 flag_max_coords
    Obj_WaitRotate
    obj_rotz Angle = <from> Speed = 30 flag_max_coords
    Obj_WaitRotate
    repeat 
endscript


script SE2_Treasure 
    Obj_ClearExceptions
    Obj_SetException Ex = objectinradius scr = SE2_Treasure_Got params = <...> 
    obj_setinnerradius 5
endscript


script SE2_Treasure_Got 
    Obj_ClearExceptions
    goal_collect_got_object goal_id = SE2_Classic_Goal_Collect flag = <flag>
    switch <flag>
        case got_1
        CreateGlobalFlexParticlesystem name = JOW_SE2_Treasure01 params_script = JOW_SE2_Treasure01_particle_params
        JOW_SE2_Treasure01 ::obj_setposition position = (-2414.510009765625, 211.99899291992188, 3617.469970703125)
        CreateFastParticleSystem name = JOW_SE2_Treasure01a params_script = JOW_SE2_Treasure01_fast_particle_params
        case got_2
        CreateGlobalFlexParticlesystem name = JOW_SE2_Treasure02 params_script = JOW_SE2_Treasure02_particle_params
        JOW_SE2_Treasure02 ::obj_setposition position = (-6531.77978515625, 19.976999282836914, 3474.780029296875)
        CreateFastParticleSystem name = JOW_SE2_Treasure02a params_script = JOW_SE2_Treasure02_fast_particle_params
        case got_3
        CreateGlobalFlexParticlesystem name = JOW_SE2_Treasure03 params_script = JOW_SE2_Treasure03_particle_params
        JOW_SE2_Treasure03 ::obj_setposition position = (-5410.009765625, 197.75100708007812, 8808.150390625)
        CreateFastParticleSystem name = JOW_SE2_Treasure03a params_script = JOW_SE2_Treasure03_fast_particle_params
        case got_4
        CreateGlobalFlexParticlesystem name = JOW_SE2_Treasure04 params_script = JOW_SE2_Treasure04_particle_params
        JOW_SE2_Treasure04 ::obj_setposition position = (-984.9910278320312, 19.93000030517578, 6818.1298828125)
        CreateFastParticleSystem name = JOW_SE2_Treasure04a params_script = JOW_SE2_Treasure04_fast_particle_params
        case got_5
        CreateGlobalFlexParticlesystem name = JOW_SE2_Treasure05 params_script = JOW_SE2_Treasure05_particle_params
        JOW_SE2_Treasure05 ::obj_setposition position = (-3307.669921875, 230.93699645996094, 5112.27001953125)
        CreateFastParticleSystem name = JOW_SE2_Treasure05a params_script = JOW_SE2_Treasure05_fast_particle_params
    endswitch
    Die
endscript


script SE2_Missile_Event 
    GetTriggerArray grind onto
    if triggertype <trigger_array>
        if GetFlag flag = Ignited
        else
            wait 0.5000 seconds
            SetFlag flag = Ignited
            KillAllTextureSplats box = {height = 40 dist = 20 width = 40 Offset = (-500.0, 13.0, 366.0)}
            KillAllTextureSplats box = {height = 40 dist = 20 width = 40 Offset = (-315.0, 13.0, 433.0)}
            play_cutscene name = 'Cutscenes\SE2_LevelEvent.Cut' RestartNode = TRG_Restart_BlackHawk
        endif
    endif
endscript


script SE2_Missile_Event_Out 
    Kill prefix = 'Geo_PreEvent'
    Kill name = TRG_SFX_TrigBox_TurbineVent
    Kill name = TRG_SFX_TrigBox_TurbineVent01
endscript


script SE2_Hatch_Wait 
    Obj_ClearExceptions
    Obj_SetException Ex = GotJump scr = SE2_Hatch_Open
endscript


script SE2_Hatch_Open 
    obj_rotx Angle = -70 Speed = 250 flag_max_coords
    Obj_WaitRotate
    obj_rotx Angle = 70 Speed = 225 flag_max_coords
    Obj_WaitRotate
    goto SE2_Hatch_Wait
endscript


script SE2_Hatch_Signal 
    GetTriggerArray jump Off
    if triggertype <trigger_array>
        SendException GotJump name = Geo_FortHatch01
    endif
endscript


script SE2_Grate 
    GetBonus Score = 50 text = 'Destruction Bonus'
    Shatter {name = <name>
        area = 2000
        texture_swap = cg_se2_shatter_grate
        variance = 1.0
        spread = 1.500
        life = 6
        Bounce = 0.5000
        Scale = 0.4000
        vel_x = 0
        vel_y = 60
        vel_z = 0
        use_skater_vel}
    Kill name = <name>
    PlayStream SK6_BreakMetalFence vol = 200
    playsound HitGlassPane2x pitch = 50
endscript


script SE2_PlaneTailBreak 
    GetBonus Score = 50 text = 'Destruction Bonus'
    Shatter {name = <name>
        area = 2000
        texture_swap = cg_se2_shatter_plane
        variance = 1.0
        spread = 1.500
        life = 6
        Bounce = 0.5000
        Scale = 0.4000
        vel_x = 0
        vel_y = 60
        vel_z = 0
        use_skater_vel}
    Kill name = <name>
    PlayStream SK6_BreakMetalFence vol = 180
    playsound HitGlassPane2x pitch = 50
endscript


script SE2_NerdKid_Defend 
    begin 
    Obj_CycleAnim anim = Ped_StarWarsKid_Clip01 numCycles = Random (@ 1 @ 2)
    Obj_WaitAnimFinished
    Obj_CycleAnim anim = Ped_StarWarsKid_Clip02 numCycles = Random (@ 1 @ 2)
    Obj_WaitAnimFinished
    repeat 
endscript

Geo_Tesla01 = 0
Geo_Tesla02 = 1
Geo_Tesla03 = 2
Ignited = 3

script SE2_Gap_BackWallCross_Start 
    StartGap GapID = <id1> flags = [ PURE_AIR ]
endscript


script SE2_Gap_BackWallCross_End 
    endgap GapID = <id1> Score = 50 text = 'Wall Crossing'
endscript


script SE_Gap_GovHiLo_Start 
    StartGap GapID = GovHiLo flags = [ PURE_AIR ]
endscript


script SE_Gap_GovHiLo_End 
    endgap GapID = GovHiLo Score = 50 text = 'High to Low'
endscript


script SE_Gap_GovLoHi_Start 
    StartGap GapID = GovLoHi flags = [ PURE_AIR ]
endscript


script SE_Gap_GovLoHi_End 
    endgap GapID = GovLoHi Score = 100 text = 'Low to High'
endscript


script SE2_Gap_K2B_Start 
    StartGap GapID = K2B flags = [ PURE_AIR ]
endscript


script SE2_Gap_K2B_End 
    endgap GapID = K2B Score = 25 text = 'Kick 2 Blade'
endscript


script SE2_Gap_WeeChannel_Start 
    StartGap GapID = <id1> flags = [ PURE_AIR ]
endscript


script SE2_Gap_WeeChannel_End 
    endgap GapID = <id1> Score = 25 text = 'Wee Channel Gap'
endscript


script SE_Gap_Canyon_Start 
    StartGap GapID = canyon flags = [ PURE_AIR ]
endscript


script SE_Gap_Canyon_End 
    endgap GapID = canyon Score = 75 text = 'Canyon Jump'
endscript


script SE_Gap_B2L_Start 
    StartGap GapID = B2L flags = [ PURE_AIR ]
endscript


script SE_Gap_B2L_End 
    endgap GapID = B2L Score = 50 text = 'Blade 2 Ledge'
endscript


script SE_Gap_L2B_Start 
    StartGap GapID = L2B flags = [ PURE_AIR ]
endscript


script SE_Gap_L2B_End 
    endgap GapID = L2B Score = 50 text = 'Ledge 2 Blade'
endscript


script SE2_Gap_ChinHole_Start 
endscript


script SE2_Gap_ChinHole_End 
endscript


script SE2_Gap_ChinWide_Start 
    StartGap GapID = <id1> flags = [ PURE_AIR ]
endscript


script SE2_Gap_ChinWide_End 
    endgap GapID = <id1> Score = 100 text = 'Wide Chin Gap'
endscript


script SE_Gap_ChinWLedge_Start 
    StartGap GapID = <id1> flags = [ PURE_AIR ]
endscript


script SE_Gap_ChinWLedge_End 
    endgap GapID = <id1> Score = 50 text = 'Crossing Your Rock Fingers!'
endscript


script SE2_Gap_ChinHip_Start 
    StartGap GapID = <id1> flags = [ PURE_AIR ]
endscript


script SE2_Gap_ChinHip_End 
    endgap GapID = <id1> Score = 50 text = 'Mini Hip!'
endscript


script SE_Gap_WingLedge_Start 
    StartGap GapID = WL flags = [ PURE_AIR ]
endscript


script SE_Gap_WingLedge_End 
    endgap GapID = WL Score = 50 text = 'Wing 2 Rock Hop!'
endscript


script SE_Gap_LedgeWing_Start 
    StartGap GapID = LW flags = [ PURE_AIR ]
endscript


script SE_Gap_LedgeWing_End 
    endgap GapID = LW Score = 50 text = 'Wingin\' It!'
endscript


script SE2_Gap_Core_Start 
    StartGap GapID = core flags = [ PURE_AIR ]
endscript


script SE2_Gap_Core_End 
    endgap GapID = core Score = 50 text = 'Into the CORE!'
endscript


script SE2_Gap_OverBoard_Start 
    StartGap GapID = <id1> flags = [ PURE_AIR ]
endscript


script SE2_Gap_OverBoard_End 
    endgap GapID = <id1> Score = 50 text = 'MAN OVERBOARD!'
endscript


script SE2_Gap_LogLedge_Start 
    StartGap GapID = LoLe flags = [ PURE_AIR ]
endscript


script SE2_Gap_LogLedge_End 
    endgap GapID = LoLe Score = 25 text = 'Log 2 Ledge'
endscript


script SE2_Gap_LedgeLog_Start 
    StartGap GapID = LeLo flags = [ PURE_AIR ]
endscript


script SE2_Gap_LedgeLog_End 
    endgap GapID = LeLo Score = 25 text = 'Ledge 2 Log!'
endscript


script SE2_Gap_Le2Le_Start 
    StartGap GapID = <id1> flags = [ PURE_AIR ]
endscript


script SE2_Gap_Le2Le_End 
    endgap GapID = <id1> Score = 25 text = 'Ledge 2 Ledge'
endscript


script SE2_Gap_L2Boat_Start 
    StartGap GapID = <id1> flags = [ PURE_AIR ]
endscript


script SE2_Gap_L2Boat_End 
    endgap GapID = <id1> Score = 25 text = 'Lifeboat Gap'
endscript


script SE2_Gap_CoreLoop_Start 
    StartGap GapID = <id1> flags = [ PURE_RAIL ]
endscript


script SE2_Gap_CoreLoop_End 
    endgap GapID = <id1> Score = 100 text = 'AROUND the CORE!'
endscript


script SE2_Gap_FloorVent_Start 
endscript


script SE2_Gap_FloorVent_End 
endscript


script SE2_Gap_ShipLedge_Start 
endscript


script SE2_Gap_ShipLedge_End 
endscript


script SE2_Gap_PowerTap_Start 
    StartGap GapID = PT flags = [ PURE_AIR ]
endscript


script SE2_Gap_PowerTap_End 
    endgap GapID = PT Score = 150 text = 'Power Tap!'
endscript


script SE2_Gap_UFOLip_Start 
    StartGap GapID = UFOLip [ PURE_AIR ]
endscript


script SE2_Gap_UFOLip_End 
    GetTriggerArray lip onto
    if triggertype <trigger_array>
        endgap GapID = UFOLip Score = 250 text = 'Mother Ship Lip' gapscript = SE2_UFOLip_Got
    endif
endscript


script SE2_UFOLip_Got 
    if ((GameModeEquals is_classic)|| (InNetGame))
        if NOT GoalManager_GoalFlagSet name = SE2_Classic_Goal_gaps2 flag = got_1
            printf 'CR CR CR --- GOAL FLAG 01 NOT SET...so setting'
            GoalManager_SetGoalFlag name = SE2_Classic_Goal_gaps2 got_1 1
        endif
    endif
endscript


script SE2_Gap_ShipLip_Start 
    StartGap GapID = ShipLip [ PURE_AIR ]
endscript


script SE2_Gap_ShipLip_End 
    GetTriggerArray lip onto
    if triggertype <trigger_array>
        endgap GapID = ShipLip Score = 100 text = 'Pirate Ship Lip'
    endif
endscript


script SE2_2d_sign_element_create parent = menu3d_anchor
    if GetGlobalFlag flag = SCREEN_MODE_WIDE
        <Offset> = (-8.0, 0.0)
    else
        <Offset> = (0.0, 0.0)
    endif
    CreateScreenElement {
        type = SpriteElement
        parent = <parent>
        texture = SE2_icon_1
        id = SE2_plane
        Scale = 3.500
        rgba = [ 128 128 128 110 ]
        Pos = ((150.0, 220.0) + <Offset>)
        rot_angle = 0
        just = [ left top ]
        z_priority = -51
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <parent>
        texture = SE2_icon_2
        id = SE2_alien
        Scale = 2.0
        rgba = [ 128 128 128 100 ]
        Pos = ((42.0, 235.0) + <Offset>)
        rot_angle = -90
        just = [ center center ]
        z_priority = -51
    }
    RunScriptOnScreenElement id = SE2_alien do_random_effect_paused params = { id = <id> }
    RunScriptOnScreenElement id = SE2_plane do_random_effect_paused params = { id = <id> }
endscript

