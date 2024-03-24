
Tr_Goal_Intro_Cameras = [{virtual_cam
        TargetID = world
        targetOffset = (5726.10009765625, 40.20000076293945, -8804.099609375)
        positionOffset = (458.1000061035156, -213.6999969482422, -308.20001220703125)
        frames = 615
        skippable = 1
        text = TR_Intro_Text1
        time = 10000
        cam_start_script = Tr_Intro_Line1
    }
    {virtual_cam
        TargetID = world
        targetOffset = (-7966.7998046875, -805.2000122070312, -10238.599609375)
        positionOffset = (-758.5999755859375, -699.7999877929688, -3309.0)
        frames = 375
        skippable = 1
        text = TR_Intro_Text2
        cam_start_script = Tr_Intro_Line2
        time = 3000
    }
    {virtual_cam
        TargetID = world
        targetOffset = (-3760.39990234375, 251.89999389648438, -9298.5)
        positionOffset = (507.29998779296875, -206.60000610351562, -267.3999938964844)
        frames = 375
        skippable = 1
        text = TR_Intro_Text3
        cam_start_script = Tr_Intro_Line3
        time = 6000
    }
]

script Tr_Intro_Line1 
    TRG_G_Gap27_Pro ::obj_playfam TR_Intro_01_lip vol = 130 priority = StreamPriorityHighest
endscript


script Tr_Intro_Line2 
    TRG_G_Gap27_Pro ::obj_playfam TR_Intro_02_lip vol = 140 priority = StreamPriorityHighest
endscript


script Tr_Intro_Line3 
    TRG_G_Gap27_Pro ::obj_playfam TR_Intro_03_lip vol = 140 priority = StreamPriorityHighest
endscript


script TR_setup 
    TR_Initailizer
    TR_KillCreate_NetGeo
    TR_Initializer
endscript


script TR_Initializer 
    if GameModeEquals is_career
        if GoalManager_HasWonGoal name = TR_Goal_Gaps27
            Kill name = TRG_G_Gap27_Pro
            if NOT IsAlive name = TRG_Tony_Advance
                Create name = TRG_Tony_Advance
            endif
        endif
    endif
endscript


script TR_Startup 
    change tod_manager_inactive = 1
    LoadSkeleton name = 'skeletons/CS_Cardboard.ske' CS_Cardboard
endscript


script TR_KillCreate_NetGeo 
    if ((InMultiPlayerGame)|| (InNetGame))
        printf 'net geo getting kill created'
        Kill name = g_wall_break_pre
        Kill name = g_WareNew_Main_windows
        Kill name = g_WareNew_Main_windows_02
        Kill name = g_roll_door_LevelGeo
        Create name = g_wall_break_post
        Create prefix = 'trg_wallbreak_post_'
    endif
endscript


script TR_goals 
    if NOT InMultiPlayerGame
    endif
    if InMultiPlayerGame
        add_multiplayer_mode_goals
    endif
    if NOT InSplitScreenGame
        if ((GameModeEquals is_classic)|| (InNetGame))
            AddGoal_HighScore {
                unlimited_time
                classic_mode_goal
                difficulty_level_params = [
                    {Score = TR_Classic_Easy_HighScore
                        goal_text = TR_Classic_Easy_HighScore_Text
                        view_goals_text = TR_Classic_Easy_HighScore_Text
                    }
                    {Score = TR_Classic_HighScore
                        goal_text = TR_Classic_HighScore_Text
                        view_goals_text = TR_Classic_HighScore_Text
                    }
                ]
                view_goals_cameras = [{
                        name = CAM_TR_Classic_Intro01
                        frames = 1200
                        skippable = 1
                    }
                ]
            }
            AddGoal_ProScore {
                unlimited_time
                classic_mode_goal
                difficulty_level_params = [
                    {Score = TR_Classic_Easy_ProScore
                        goal_text = TR_Classic_Easy_ProScore_Text
                        view_goals_text = TR_Classic_Easy_ProScore_Text
                    }
                    {Score = TR_Classic_ProScore
                        goal_text = TR_Classic_ProScore_Text
                        view_goals_text = TR_Classic_ProScore_Text
                    }
                ]
            }
            AddGoal_SickScore {
                unlimited_time
                classic_mode_goal
                difficulty_level_params = [
                    {Score = TR_Classic_Easy_SickScore
                        goal_text = TR_Classic_Easy_SickScore_Text
                        view_goals_text = TR_Classic_Easy_SickScore_Text
                    }
                    {Score = TR_Classic_SickScore
                        goal_text = TR_Classic_SickScore_Text
                        view_goals_text = TR_Classic_SickScore_Text
                    }
                ]
            }
            AddGoal_HighCombo {
                unlimited_time
                classic_mode_goal
                difficulty_level_params = [
                    {Score = TR_Classic_Easy_HighCombo
                        goal_text = TR_Classic_Easy_HighCombo_Text
                        view_goals_text = TR_Classic_Easy_HighCombo_Text
                    }
                    {Score = TR_Classic_HighCombo
                        goal_text = TR_Classic_HighCombo_Text
                        view_goals_text = TR_Classic_HighCombo_Text
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
                        targetOffset = (5498.89990234375, 3762.0, 6304.0)
                        positionOffset = (-363.79998779296875, -253.89999389648438, -731.4000244140625)
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
                        targetOffset = (-10060.900390625, -1276.699951171875, -6229.2001953125)
                        positionOffset = (-597.2999877929688, -606.7000122070312, -3068.89990234375)
                        frames = 200
                        skippable = 1
                    }
                ]
            }
            AddGoal_SecretTape {
                classic_mode_goal
                goal_text = 'Get the secret tape'
                view_goals_text = 'Get the secret tape'
                goal_description = 'Get the secret tape'
                secret_tape_id = TRG_TR_Secret_Tape
                view_goals_cameras = [{virtual_cam
                        TargetID = world
                        targetOffset = (-10825.900390625, 1320.0, -1182.0)
                        positionOffset = (-1010.7999877929688, -160.39999389648438, -2393.60009765625)
                        frames = 200
                        skippable = 1
                    }
                ]
            }
            AddGoal_Collect {
                unlimited_time
                classic_mode_goal
                collect_type = 'Sprinklers busted'
                use_hud_counter
                hud_counter_caption = 'Sprinklers busted'
                goal_text = 'Break all the sprinklers'
                view_goals_text = 'Break all the sprinklers'
                goal_description = 'Break all the sprinklers'
                goal_flags = [got_1
                    got_2
                    got_3
                    got_4
                    got_5
                    got_6
                    got_7
                    got_8
                    got_9
                    got_10
                    got_11
                    got_12
                    got_13
                    got_14
                    got_15
                    got_16
                    got_17
                    got_18
                    got_19
                ]
                view_goals_cameras = [{virtual_cam
                        TargetID = world
                        targetOffset = (4326.5, -4743.7001953125, -8834.099609375)
                        positionOffset = (-931.4000244140625, -183.60000610351562, -1653.699951171875)
                        frames = 200
                        skippable = 1
                    }
                ]
            }
            AddGoal_Gaps {
                version = 30
                classic_mode_goal
                unlimited_time
                goal_text = '\t1 (\k1) over the half pipe'
                view_goals_text = '\t1 (\k1) over the half pipe'
                goal_description = '\t1 (\k1) over the half pipe'
                view_goals_cameras = [{virtual_cam
                        TargetID = world
                        targetOffset = (1247.699951171875, -3664.60009765625, -11264.599609375)
                        positionOffset = (323.5, -384.6000061035156, -1863.300048828125)
                        frames = 200
                        skippable = 1
                    }
                ]
                key_combos = [ Air_CircleDL ]
            }
            AddGoal_Collect {
                unlimited_time
                classic_mode_goal
                version = 2
                collect_type = 'Boards'
                use_hud_counter
                init_script = TR_Goals_Collect_Init
                goal_deactivate_script = TR_Goals_Collect_Deactivate
                hud_counter_caption = 'Boards'
                goal_text = 'Grab all the skateboards'
                view_goals_text = 'Grab all the skateboards'
                goal_description = 'Grab all the skateboards'
                goal_flags = [got_1
                    got_2
                    got_3
                    got_4
                    got_5
                ]
                view_goals_cameras = [{virtual_cam
                        TargetID = world
                        targetOffset = (-3187.199951171875, -244.89999389648438, -12150.5)
                        positionOffset = (-441.5, -221.39999389648438, -2535.0)
                        frames = 200
                        skippable = 1
                    }
                ]
            }
        else
            if NOT ((GameModeEquals is_singlesession)|| (GameModeEquals is_creategoals))
                if NOT InNetGame
                    TR_ADDGOAL_Ollie
                    TR_ADDGOAL_Manual
                    TR_ADDGOAL_Grind
                    TR_ADDGOAL_NoComply
                    TR_ADDGOAL_Boneless
                    TR_ADDGOAL_KickFlip
                    TR_ADDGOAL_Lip
                    TR_ADDGOAL_LipGrind
                    TR_ADDGOAL_Melon
                    TR_ADDGOAL_Spin
                    TR_ADDGOAL_BreakAir
                    TR_ADDGOAL_Transfer
                    TR_ADDGOAL_Wallplant
                    TR_ADDGOAL_WallBreak
                    TR_ADDGOAL_WallRide
                    TR_ADDGOAL_Wallie
                    TR_ADDGOAL_Spine
                    TR_ADDGOAL_Hip
                    TR_ADDGOAL_JumpGrind
                    TR_ADDGOAL_SideJump
                    TR_ADDGOAL_Skitchin
                    TR_ADDGOAL_RevertManual
                    TR_AddGoal_Special
                    TR_ADDGOAL_CaveMan
                    TR_ADDGOAL_Jump
                    TR_ADDGOAL_RunJump
                    TR_ADDGOAL_Ladder
                    TR_ADDGOAL_Shimmy
                    TR_ADDGOAL_AcidDrop
                    TR_ADDGOAL_BackFlip
                    TR_ADDGOAL_Roll
                    TR_ADDGOAL_VertWallPlant
                    TR_ADDGOAL_Projectiles
                    TR_ADDGOAL_Graf
                    TR_ADDGOAL_GrafHang
                    TR_ADDGOAL_Focus
                    TR_AddGoal_TimedScoreRun
                endif
            endif
        endif
    endif
endscript


script TR_LavaKill 
    SK3_KillSkater_Water nodeName = TRG_LavaKill_restart
endscript


script TR_WallBreakToggle 
    if IsAlive name = g_wall_break_pre
        Kill name = g_wall_break_pre
        Kill name = g_WareNew_Main_windows
        Kill name = g_WareNew_Main_windows_02
        Create name = g_wall_break_post
        Create prefix = 'trg_wallbreak_post_'
    else
        Create name = g_WareNew_Main_windows
        Create name = g_wall_break_pre
        Create name = g_WareNew_Main_windows_02
        Kill name = g_wall_break_post
        Kill prefix = 'trg_wallbreak_post'
    endif
endscript


script TR_Initailizer 
    if GameModeEquals is_career
        Kill prefix = 'WH_Classic_Sk8brd_'
        if GoalManager_HasWonGoal name = tr_goal_gaps12
            Kill name = g_wall_break_pre
            Kill name = g_WareNew_Main_windows
            Kill name = g_WareNew_Main_windows_02
            Create name = g_wall_break_post
            Create prefix = 'trg_wallbreak_post_'
            Kill name = g_roll_door01
            Kill name = g_roll_door_LevelGeo
        endif
        if GoalManager_HasWonGoal name = tr_goal_counter5
            Kill prefix = 'TR_Ware_2X4_'
            Kill prefix = 'TR_Ware_Dry_'
            Kill name = TR_Ware_Drywall_COL
            Kill name = g_g_wareNew_Funbox01_door01
            Kill name = g_g_wareNew_Funbox01_door02
            Kill name = g_g_wareNew_Funbox01_door03
        endif
    else
        Kill name = g_wall_break_pre
        Kill name = g_WareNew_Main_windows
        Kill name = g_WareNew_Main_windows_02
        Kill name = g_roll_door01
        Kill name = g_roll_door_LevelGeo
        Create name = g_wall_break_post
        Create prefix = 'trg_wallbreak_post_'
        Kill name = TR_Ware_Drywall_COL
        Kill prefix = 'TR_Ware_2X4_'
        Kill prefix = 'TR_Ware_2X4_'
        Kill prefix = 'TR_Ware_Dry_'
        Kill name = g_g_wareNew_Funbox01_door01
        Kill name = g_g_wareNew_Funbox01_door02
        Kill name = g_g_wareNew_Funbox01_door03
    endif
endscript


script TR_Classic_Mctwist_Start 
    if ((GameModeEquals is_classic)|| (InNetGame))
        if NOT GoalManager_HasWonGoal name = TR_classic_goal_Gaps30
            if GoalManager_GoalIsActive name = TR_classic_goal_Gaps30
                StartGap GapID = McTwista flags = [ PURE_AIR ] keycombo = Air_CircleDL TrickScript = TR_Classic_Mctwist_Win
                endgap GapID = McTwistb text = 'Over the Half Pipe' Score = 200
            endif
        endif
    else
        StartGap GapID = McTwista flags = [ PURE_AIR ]
        endgap GapID = McTwistb text = 'Over the Half Pipe' Score = 200
    endif
endscript


script TR_Classic_Mctwist_End 
    if ((GameModeEquals is_classic)|| (InNetGame))
        if NOT GoalManager_HasWonGoal name = TR_classic_goal_Gaps30
            if GoalManager_GoalIsActive name = TR_classic_goal_Gaps30
                StartGap GapID = McTwistb flags = [ PURE_AIR ] keycombo = Air_CircleDL TrickScript = TR_Classic_Mctwist_Win
                endgap GapID = McTwista text = 'Over the Half Pipe' Score = 200
            endif
        endif
    else
        StartGap GapID = McTwistb flags = [ PURE_AIR ]
        endgap GapID = McTwista text = 'Over the Half Pipe' Score = 200
    endif
endscript


script TR_Classic_Mctwist_Win 
    if ((GameModeEquals is_classic)|| (InNetGame))
        if NOT GoalManager_HasWonGoal name = TR_classic_goal_Gaps30
            GoalManager_WinGoal name = TR_classic_goal_Gaps30
        endif
    endif
endscript


script TR_Sprinklers 
    if NOT InNetGame
        if IsAlive name = <name>
        else
            Create name = <name>
            SpawnScript TR_SFX_BustPipe_WaterSpray params = { name = <name> }
        endif
    endif
    if ((GameModeEquals is_classic)|| (InNetGame))
        if GoalManager_GoalIsActive name = TR_classic_goal_collect
            switch <name>
                case Water_SprinklerA10
                printf 'Sprinkler 01'
                goal_collect_got_object goal_id = TR_classic_goal_collect flag = got_1
                case Water_SprinklerA28
                printf 'Sprinkler 02'
                goal_collect_got_object goal_id = TR_classic_goal_collect flag = got_2
                case Water_SprinklerA25
                printf 'Sprinkler 03'
                goal_collect_got_object goal_id = TR_classic_goal_collect flag = got_3
                case Water_SprinklerA07
                printf 'Sprinkler 04'
                goal_collect_got_object goal_id = TR_classic_goal_collect flag = got_4
                case Water_SprinklerA06
                printf 'Sprinkler 05'
                goal_collect_got_object goal_id = TR_classic_goal_collect flag = got_5
                case Water_SprinklerA16
                printf 'Sprinkler 06'
                goal_collect_got_object goal_id = TR_classic_goal_collect flag = got_6
                case Water_SprinklerA19
                printf 'Sprinkler 07'
                goal_collect_got_object goal_id = TR_classic_goal_collect flag = got_7
                case Water_SprinklerA13
                printf 'Sprinkler 08'
                goal_collect_got_object goal_id = TR_classic_goal_collect flag = got_8
                case Water_SprinklerA61_Start09
                printf 'Sprinkler 09'
                goal_collect_got_object goal_id = TR_classic_goal_collect flag = got_9
                case Water_SprinklerA60_Start08
                printf 'Sprinkler 10'
                goal_collect_got_object goal_id = TR_classic_goal_collect flag = got_10
                case Water_SprinklerA59_Start07
                printf 'Sprinkler 11'
                goal_collect_got_object goal_id = TR_classic_goal_collect flag = got_11
                case Water_SprinklerA56_Start04
                printf 'Sprinkler 12'
                goal_collect_got_object goal_id = TR_classic_goal_collect flag = got_12
                case Water_SprinklerA57_Start05
                printf 'Sprinkler 13'
                goal_collect_got_object goal_id = TR_classic_goal_collect flag = got_13
                case Water_SprinklerA58_Start06
                printf 'Sprinkler 14'
                goal_collect_got_object goal_id = TR_classic_goal_collect flag = got_14
                case Water_SprinklerA55_Start03
                printf 'Sprinkler 15'
                goal_collect_got_object goal_id = TR_classic_goal_collect flag = got_15
                case Water_SprinklerA53_Start01
                printf 'Sprinkler 16'
                goal_collect_got_object goal_id = TR_classic_goal_collect flag = got_16
                case Water_SprinklerA54_Start02
                printf 'Sprinkler 17'
                goal_collect_got_object goal_id = TR_classic_goal_collect flag = got_17
                case Water_SprinklerA52_Start
                printf 'Sprinkler 18'
                goal_collect_got_object goal_id = TR_classic_goal_collect flag = got_18
                case Water_SprinklerA22
                printf 'Sprinkler 19'
                goal_collect_got_object goal_id = TR_classic_goal_collect flag = got_19
            endswitch
        endif
    endif
endscript


script TR_Counter_Sk8Bds 
    obj_setinnerradius 10
    Obj_SetException Ex = objectinradius scr = TR_Counter_Sk8BdsGot params = { <...>  }group = CollectSk8Bds
    if NOT InNetGame
        obj_roty Speed = Random (@ 50 @ -150 @ 200 @ -250)
        obj_hover amp = Random (@ 5 @ 10 @ 15) freq = Random (@ 0.5000 @ 1 @ 2)
    endif
endscript


script TR_Counter_Sk8BdsGot 
    ClearExceptionGroup CollectSk8Bds
    switch <name>
        case Sk8Bds01
        goal_collect_got_object goal_id = tr_classic_goal_collect2 flag = got_1
        Die
        case Sk8Bds02
        goal_collect_got_object goal_id = tr_classic_goal_collect2 flag = got_2
        Die
        case Sk8Bds03
        goal_collect_got_object goal_id = tr_classic_goal_collect2 flag = got_3
        Die
        case Sk8Bds04
        goal_collect_got_object goal_id = tr_classic_goal_collect2 flag = got_4
        Die
        case Sk8Bds05
        goal_collect_got_object goal_id = tr_classic_goal_collect2 flag = got_5
        Die
    endswitch
endscript


script TR_Goals_Collect_Init 
    Create prefix = 'WH_Classic_Sk8brd_'
endscript


script TR_Goals_Collect_Deactivate 
    Kill prefix = 'WH_Classic_Sk8brd_'
endscript


script TR_ADDGOAL_Manual 
    AddGoal_Gaps {
        version = 7
        start_cam_anims = [
            {
                virtual_cam
                TargetID = world
                targetOffset = (-1498.9000244140625, -1435.4000244140625, -11871.900390625)
                positionOffset = (-266.70001220703125, -659.5999755859375, -1978.5)
                frames = 100
                cam_anim_text = Mullen_tr_goal_gaps7_camanim01
                skippable = 1
                Play_hold
            }
            {
                virtual_cam
                TargetID = world
                targetOffset = (-1498.9000244140625, -1435.4000244140625, -11871.900390625)
                positionOffset = (-266.70001220703125, -659.5999755859375, -1978.5)
                frames = 100
                cam_anim_text = ''
                skippable = 1
                Play_hold
            }
        ]
        intro_node = TRG_G_GAP7_RESTARTNODE
        goal_text = 'Manual (\b7 +\b4)'
        view_goals_text = 'Basics - Manual'
        goal_description = Mullen_tr_goal_gaps7
        skater = custom
        unlimited_time = 1
        goal_flags = [ got_1
         ]
        goal_intro_script = TR_ADDGOAL_Manual_Intro
        goal_start_script = TR_ADDGOAL_Manual_Start
        goal_deactivate_script = TR_ADDGOAL_Manual_Deactivate
        goal_success_script = TR_ADDGOAL_Manual_success
        pro = 'Mullen'
        full_name = 'Rodney Mullen'
        child = tr_goal_gaps3
    }
endscript


script TR_ADDGOAL_Manual_Intro 
    Create prefix = 'g_g_manual_cones'
    Create prefix = 'g_g_gaps7a_missed'
    Create name = g_g_gaps7a
    Create name = g_g_gaps7b
endscript


script TR_ADDGOAL_Manual_Start 
endscript


script TR_ADDGOAL_ManualGap01 
    if GoalManager_GoalIsActive name = tr_goal_gaps7
        GetTriggerArray through
        if triggertype <trigger_array>
            getsingletag state
            if (<state> = Skater_InManual)
                StartGap GapID = TeachManual flags = [ PURE_MANUAL ]
            else
                create_panel_message id = goal_message text = 'Not in Manual' style = panel_message_generic_loss
                skater ::KillSkater node = TRG_G_GAP7_RESTARTNODE
            endif
        endif
    endif
endscript


script TR_ADDGOAL_ManualGap02 
    if GoalManager_GoalIsActive name = tr_goal_gaps7
        GetTriggerArray through
        if triggertype <trigger_array>
            getsingletag state
            if (<state> = Skater_InManual)
                endgap GapID = TeachManual gapscript = TR_ADDGOAL_ManualGot_1
            else
                create_panel_message id = goal_message text = 'Not in Manual' style = panel_message_generic_loss
                skater ::KillSkater node = TRG_G_GAP7_RESTARTNODE
            endif
        endif
    endif
endscript


script TR_ADDGOAL_ManualMissed 
    create_panel_message id = goal_message text = 'Missed Cones' style = panel_message_generic_loss
    skater ::KillSkater node = TRG_G_GAP7_RESTARTNODE
endscript


script TR_ADDGOAL_ManualGot_1 
    if GoalManager_GoalIsActive name = tr_goal_gaps7
        GoalManager_SetGoalFlag name = tr_goal_gaps7 got_1 1
    endif
endscript


script TR_ADDGOAL_Manual_Deactivate 
    Kill prefix = 'g_g_manual_cones'
    Kill prefix = 'g_g_gaps7a_missed'
    Kill name = g_g_gaps7a
    Kill name = g_g_gaps7b
endscript


script TR_ADDGOAL_Manual_success 
    Kill prefix = 'g_g_manual_cones'
    Kill prefix = 'g_g_gaps7a_missed'
    Kill name = g_g_gaps7a
    Kill name = g_g_gaps7b
endscript


script TR_ADDGOAL_Ollie 
    AddGoal_Counter {
        start_cam_anims = [
            {
                virtual_cam
                TargetID = world
                targetOffset = (8249.7998046875, -1381.9000244140625, 291.5)
                positionOffset = (-981.5999755859375, -716.5, -3494.5)
                frames = 100
                cam_anim_text = ''
                skippable = 1
                Play_hold = 1}
        ]
        intro_node = TRG_G_COUNTER_RESTARTNODE
        goal_text = 'Ollie (\b3)'
        view_goals_text = 'Basics - Learn to Ollie'
        goal_description = Mullen_tr_goal_counter
        skater = custom
        number = 3
        goal_intro_script = TR_ADDGOAL_Ollie_intro
        goal_start_script = TR_ADDGOAL_Ollie_start
        goal_success_script = TR_ADDGOAL_Ollie_success
        goal_deactivate_script = TR_ADDGOAL_Ollie_Deactivate
        pro = 'Mullen'
        full_name = 'Rodney Mullen'
        use_hud_counter
        hud_counter_caption = 'Ollie\'s'
        child = tr_goal_gaps7
    }
endscript


script TR_ADDGOAL_Ollie_intro 
endscript


script TR_ADDGOAL_Ollie_start 
    SpawnScript TR_ADDGOAL_Ollie_Checker
endscript


script TR_ADDGOAL_Ollie_Checker 
    ClearExceptionGroup TR_ADDGOAL_Ollie01
    printf 'Jumping+++++++++++++++'
    SetException Ex = SkaterExitAir scr = TR_ADDGOAL_Ollie_SetFlags group = TR_ADDGOAL_Ollie01
    Block
endscript


script TR_ADDGOAL_Ollie_SetFlags 
    if NOT skater ::walking
        ClearExceptionGroup TR_ADDGOAL_Ollie01
        GoalManager_GotCounterObject name = tr_goal_counter
        printf '====Got Ollie'
    endif
    goto TR_ADDGOAL_Ollie_Checker
endscript


script TR_ADDGOAL_Ollie_success 
    KillSpawnedScript name = TR_ADDGOAL_Ollie_Checker
    KillSpawnedScript name = TR_ADDGOAL_Ollie_SetFlags
endscript


script TR_ADDGOAL_Ollie_Deactivate 
    KillSpawnedScript name = TR_ADDGOAL_Ollie_Checker
    KillSpawnedScript name = TR_ADDGOAL_Ollie_SetFlags
endscript


script TR_ADDGOAL_NoComply 
    AddGoal_Gaps {
        start_cam_anims = [
            {
                virtual_cam
                TargetID = world
                targetOffset = (9103.2998046875, -903.0999755859375, 281.8999938964844)
                positionOffset = (19.100000381469727, -719.4000244140625, -3894.5)
                frames = 100
                cam_anim_text = ''
                skippable = 1
                Play_hold}
        ]
        intro_node = TRG_G_GAP_RESTARTNODE
        goal_text = 'No Comply (\b7 + \b3) over the taxi'
        view_goals_text = 'Basics - No Comply over the taxi'
        goal_description = Mullen_tr_goal_gaps
        skater = custom
        unlimited_time = 1
        goal_flags = [ got_1
         ]
        goal_intro_script = TR_ADDGOAL_NoComply_Intro
        goal_start_script = TR_ADDGOAL_NoComply_Start
        goal_success_script = TR_ADDGOAL_NoComply_success
        goal_deactivate_script = TR_ADDGOAL_NoComply_Deactivate
        pro = 'Mullen'
        full_name = 'Rodney Mullen'
        child = TR_GOAL_Gaps2
    }
endscript


script TR_ADDGOAL_NoComply_Intro 
    SpawnScript TR_ADDGOAL_NoComply_Flash params = { ObjName = SkWare_Taxi01 }
    KillSpawnedScript name = TR_ADDGOAL_Ollie_Checker
    KillSpawnedScript name = TR_ADDGOAL_Ollie_SetFlags
endscript


script TR_ADDGOAL_NoComply_Flash 
    begin 
    setobjectcolor name = <ObjName> color = 10506320
    wait 10 frames
    setobjectcolor name = <ObjName> color = 9195600
    wait 10 frames
    setobjectcolor name = <ObjName> color = 7884880
    wait 10 frames
    setobjectcolor name = <ObjName> color = 6574160
    wait 10 frames
    setobjectcolor name = <ObjName> color = 5263440
    wait 10 frames
    setobjectcolor name = <ObjName> color = 6574160
    wait 10 frames
    setobjectcolor name = <ObjName> color = 7884880
    wait 10 frames
    setobjectcolor name = <ObjName> color = 9195600
    wait 10 frames
    repeat 
endscript


script TR_ADDGOAL_NoComply_Start 
endscript


script TR_NoComplyGap01 
    printf 'Trigger Poly here'
    StartGap GapID = TR_NoComplyGapA flags = [ PURE_AIR ] TrickText = 'No Comply' TrickScript = TR_NoComplyGapGot_1
endscript


script TR_NoComplyGap02 
    endgap GapID = TR_NoComplyGapA text = 'Car Hop' Score = 75
    SpawnScript TR_SFX_TaxiHop
endscript


script TR_NoComplyGapGot_1 
    if GoalManager_GoalIsActive name = tr_goal_gaps
        GoalManager_SetGoalFlag name = tr_goal_gaps got_1 1
    endif
endscript


script TR_ADDGOAL_NoComply_success 
    KillSpawnedScript name = TR_ADDGOAL_NoComply_Flash
endscript


script TR_ADDGOAL_NoComply_Deactivate 
    KillSpawnedScript name = TR_ADDGOAL_NoComply_Flash
endscript


script TR_ADDGOAL_Boneless 
    AddGoal_Gaps {
        version = 2
        start_cam_anims = [
            {
                virtual_cam
                TargetID = world
                targetOffset = (9103.2998046875, -903.0999755859375, 281.8999938964844)
                positionOffset = (19.100000381469727, -719.4000244140625, -3894.5)
                frames = 100
                cam_anim_text = ''
                skippable = 1
                Play_hold}
        ]
        intro_node = TRG_G_GAP2_RESTARTNODE
        goal_text = 'Boneless\n(\b7 + \b7 + \b3)\nover the taxi.'
        view_goals_text = 'Basics - Boneless over the taxi'
        goal_description = Mullen_tr_goal_gaps2
        skater = custom
        unlimited_time = 1
        goal_flags = [ got_1
         ]
        goal_intro_script = TR_ADDGOAL_Boneless_Intro
        goal_start_script = TR_ADDGOAL_Boneless_Start
        goal_success_script = TR_ADDGOAL_Boneless_success
        goal_deactivate_script = TR_ADDGOAL_Boneless_Deactivate
        pro = 'Mullen'
        full_name = 'Rodney Mullen'
        child = TR_Goal_Gaps5
    }
endscript


script TR_ADDGOAL_Boneless_Intro 
    Create name = g_g_Gaps02a
    Create name = g_g_Gaps02b
    Create name = g_g_Gaps02a01
    Create name = g_g_Gaps02b01
    SpawnScript TR_ADDGOAL_Boneless_Flash params = { ObjName = SkWare_Taxi01 }
    KillSpawnedScript name = TR_ADDGOAL_NoComply_Flash
endscript


script TR_ADDGOAL_Boneless_Flash 
    begin 
    setobjectcolor name = <ObjName> color = 10506320
    wait 10 frames
    setobjectcolor name = <ObjName> color = 9195600
    wait 10 frames
    setobjectcolor name = <ObjName> color = 7884880
    wait 10 frames
    setobjectcolor name = <ObjName> color = 6574160
    wait 10 frames
    setobjectcolor name = <ObjName> color = 5263440
    wait 10 frames
    setobjectcolor name = <ObjName> color = 6574160
    wait 10 frames
    setobjectcolor name = <ObjName> color = 7884880
    wait 10 frames
    setobjectcolor name = <ObjName> color = 9195600
    wait 10 frames
    repeat 
endscript


script TR_ADDGOAL_Boneless_Start 
endscript


script TR_BonelessGap01 
    StartGap GapID = TR_BonelessGapA flags = [ PURE_AIR ] TrickText = 'Boneless' TrickScript = TR_BonelessGapGot_1
endscript


script TR_BonelessGap02 
    endgap GapID = TR_BonelessGapA
endscript


script TR_BonelessGapGot_1 
    if GoalManager_GoalIsActive name = TR_GOAL_Gaps2
        GoalManager_SetGoalFlag name = TR_GOAL_Gaps2 got_1 1
    endif
endscript


script TR_ADDGOAL_Boneless_success 
    KillSpawnedScript name = TR_ADDGOAL_Boneless_Flash
    Kill name = g_g_Gaps02a
    Kill name = g_g_Gaps02a01
    Kill name = g_g_Gaps02b
    Kill name = g_g_Gaps02b01
endscript


script TR_ADDGOAL_Boneless_Deactivate 
    KillSpawnedScript name = TR_ADDGOAL_Boneless_Flash
endscript


script TR_ADDGOAL_KickFlip 
    AddGoal_Gaps {
        version = 5
        start_cam_anims = [
            {
                virtual_cam
                TargetID = world
                targetOffset = (6957.60009765625, -2861.800048828125, -7684.10009765625)
                positionOffset = (-1554.699951171875, -558.4000244140625, -2968.800048828125)
                frames = 100
                cam_anim_text = ''
                skippable = 1
                Play_hold}
        ]
        success_cam_anims = [
            {
                virtual_cam
                TargetID = world
                targetOffset = (7621.10009765625, -2094.699951171875, -7302.39990234375)
                positionOffset = (-763.7000122070312, -655.4000244140625, -2046.800048828125)
                frames = 100
                cam_anim_text = Mullen_tr_goal_gaps3_Success
                skippable = 1
                Play_hold}
        ]
        intro_node = TRG_G_GAP5_RESTARTNODE
        goal_text = '(\b6 + \b1) while in air'
        view_goals_text = 'Basics - KickFlip over the gap'
        goal_description = Mullen_tr_goal_gaps5
        skater = custom
        reward_goal = tr_goal_gaps4
        unlimited_time = 1
        goal_flags = [ got_1
         ]
        goal_intro_script = TR_ADDGOAL_KickFlip_Intro
        goal_start_script = TR_ADDGOAL_KickFlip_Start
        goal_success_script = TR_ADDGOAL_KickFlip_success
        goal_deactivate_script = TR_ADDGOAL_KickFlip_Deactivate
        pro = 'Mullen'
        full_name = 'Rodney Mullen'
    }
endscript


script TR_ADDGOAL_KickFlip_Intro 
    SetObjectColor_CurrentTOD name = SkWare_Taxi01
    KillSpawnedScript name = TR_ADDGOAL_Boneless_Flash
    SpawnScript TR_ADDGOAL_KickFlip_Flash params = { ObjName = SkWare_Kicker_Wood02a }
    SpawnScript TR_ADDGOAL_KickFlip_Flash params = { ObjName = SkWare_Kicker_Wood02b }
    SpawnScript TR_ADDGOAL_KickFlip_Flash params = { ObjName = SkWare_Kicker_Block01 }
endscript


script TR_ADDGOAL_KickFlip_Flash 
    begin 
    setobjectcolor name = <ObjName> color = 10506320
    wait 10 frames
    setobjectcolor name = <ObjName> color = 9195600
    wait 10 frames
    setobjectcolor name = <ObjName> color = 7884880
    wait 10 frames
    setobjectcolor name = <ObjName> color = 6574160
    wait 10 frames
    setobjectcolor name = <ObjName> color = 5263440
    wait 10 frames
    setobjectcolor name = <ObjName> color = 6574160
    wait 10 frames
    setobjectcolor name = <ObjName> color = 7884880
    wait 10 frames
    setobjectcolor name = <ObjName> color = 9195600
    wait 10 frames
    repeat 
endscript


script TR_ADDGOAL_KickFlip_Start 
endscript


script TR_ADDGOAL_KickFlipGap01 
    if GoalManager_GoalIsActive name = TR_Goal_Gaps5
        StartGap GapID = KickFlip flags = [ PURE_AIR ] TrickText = 'KickFlip' TrickScript = TR_ADDGOAL_KickFlipGot_1
    endif
endscript


script TR_ADDGOAL_KickFlipGap02 
    if GoalManager_GoalIsActive name = TR_Goal_Gaps5
        endgap GapID = KickFlip
    endif
endscript


script TR_ADDGOAL_KickFlipGot_1 
    printf 'WTF=============='
    if GoalManager_GoalIsActive name = TR_Goal_Gaps5
        GoalManager_SetGoalFlag name = TR_Goal_Gaps5 got_1 1
    endif
endscript


script TR_ADDGOAL_KickFlip_success 
    KillSpawnedScript name = TR_ADDGOAL_KickFlip_Flash
endscript


script TR_ADDGOAL_KickFlip_Deactivate 
    KillSpawnedScript name = TR_ADDGOAL_KickFlip_Flash
endscript


script TR_ADDGOAL_Grind 
    AddGoal_Gaps {
        version = 3
        start_cam_anims = [
            {
                virtual_cam
                TargetID = world
                targetOffset = (-4666.39990234375, -739.0999755859375, -11330.7998046875)
                positionOffset = (-522.5, -708.9000244140625, -2230.10009765625)
                frames = 100
                cam_anim_text = ''
                skippable = 1
                Play_hold}
        ]
        intro_node = TRG_G_GAP3_RESTARTNODE
        goal_text = 'Ollie (\b3)\n then Grind (\b0) near the rail.'
        view_goals_text = 'Basics - Grind the rail'
        goal_description = Muska_tr_goal_gaps3
        skater = custom
        unlimited_time = 1
        goal_flags = [ got_1
         ]
        goal_intro_script = TR_ADDGOAL_Grind_Intro
        goal_start_script = TR_ADDGOAL_Grind_Start
        goal_success_script = TR_ADDGOAL_Grind_success
        goal_deactivate_script = TR_ADDGOAL_Grind_Deactivate
        pro = 'Muska'
        full_name = 'Chad Muska'
        child = tr_goal_gaps
    }
endscript


script TR_ADDGOAL_Grind_Intro 
    KillSpawnedScript name = TR_ADDGOAL_NoseGrab_Flash
    SetObjectColor_CurrentTOD name = SkWare_Kicker_Wood02a
    SetObjectColor_CurrentTOD name = SkWare_Kicker_Wood02b
    SetObjectColor_CurrentTOD name = SkWare_Kicker_Block01
    Kill prefix = 'g_g_nosegrab'
    SpawnScript TR_ADDGOAL_Grind_Flash params = { ObjName = SkWare_Rail01 }
endscript


script TR_ADDGOAL_Grind_Flash 
    begin 
    setobjectcolor name = <ObjName> color = 10506320
    wait 10 frames
    setobjectcolor name = <ObjName> color = 9195600
    wait 10 frames
    setobjectcolor name = <ObjName> color = 7884880
    wait 10 frames
    setobjectcolor name = <ObjName> color = 6574160
    wait 10 frames
    setobjectcolor name = <ObjName> color = 5263440
    wait 10 frames
    setobjectcolor name = <ObjName> color = 6574160
    wait 10 frames
    setobjectcolor name = <ObjName> color = 7884880
    wait 10 frames
    setobjectcolor name = <ObjName> color = 9195600
    wait 10 frames
    repeat 
endscript


script TR_ADDGOAL_Grind_Start 
endscript


script TR_ADDGOAL_Grind_Active 
    GetTriggerArray grind Off
    if triggertype <trigger_array>
        if GoalManager_GoalIsActive name = tr_goal_gaps3
            GetGap gapscript = TR_GrindGapGot_1
        endif
    endif
endscript


script TR_GrindGapGot_1 
    printf 'WTF=============='
    if GoalManager_GoalIsActive name = tr_goal_gaps3
        GoalManager_SetGoalFlag name = tr_goal_gaps3 got_1 1
    endif
endscript


script TR_ADDGOAL_Grind_success 
    KillSpawnedScript name = TR_ADDGOAL_Grind_Flash
    SetObjectColor_CurrentTOD name = SkWare_Rail01
    Create prefix = 'TRG_RodneySkate_'
endscript


script TR_ADDGOAL_Grind_Deactivate 
    KillSpawnedScript name = TR_ADDGOAL_Grind_Flash
    SetObjectColor_CurrentTOD name = SkWare_Rail01
endscript


script TR_ADDGOAL_Lip 
    AddGoal_Gaps {
        version = 4
        start_cam_anims = [
            {
                virtual_cam
                TargetID = world
                targetOffset = (-4803.5, -386.20001220703125, -10655.900390625)
                positionOffset = (962.0999755859375, -797.7999877929688, -2495.699951171875)
                frames = 100
                cam_anim_text = ''
                skippable = 1
                Play_hold}
        ]
        goal_text = 'Go up the QP straight on and press (\b0) at the top to lip.'
        view_goals_text = 'Basics - Lip the QP'
        goal_description = Burnquist_tr_goal_gaps4
        skater = custom
        unlocked_by_another
        unlimited_time = 1
        goal_flags = [ got_1
         ]
        pro = 'Burnquist'
        full_name = 'Bob Burnquist'
        child = TR_Goal_gaps8
    }
endscript


script TR_ADDGOAL_LipGap01 
    StartGap GapID = TeachLip flags = [ REQUIRE_LIP ]
endscript


script TR_ADDGOAL_LipGap02 
    GetTriggerArray lip Off
    if triggertype <trigger_array>
        endgap GapID = TeachLip Score = 50 text = 'Half pipe lip' gapscript = TR_ADDGOAL_LipGapGot_1
    endif
endscript


script TR_ADDGOAL_LipGapGot_1 
    printf 'WTF=============='
    if GoalManager_GoalIsActive name = tr_goal_gaps4
        wait 1 second
        GoalManager_SetGoalFlag name = tr_goal_gaps4 got_1 1
    endif
endscript


script TR_ADDGOAL_LipGrind 
    AddGoal_Gaps {
        version = 8
        start_cam_anims = [
            {
                virtual_cam
                TargetID = world
                targetOffset = (-4803.5, -386.20001220703125, -10655.900390625)
                positionOffset = (962.0999755859375, -797.7999877929688, -2495.699951171875)
                skater_node = TRG_G_GAP8_RESTARTNODE
                frames = 100
                cam_anim_text = ''
                skippable = 1
                Play_hold}
        ]
        goal_text = 'Go up the QP at an angle and grind (\b0) at the top.'
        view_goals_text = 'Basics - QP grind'
        goal_description = Burnquist_tr_goal_gaps8
        skater = custom
        unlimited_time = 1
        goal_flags = [ got_1
         ]
        goal_intro_script = TR_ADDGOAL_LipGrind_Intro
        goal_start_script = TR_ADDGOAL_LipGrind_Start
        goal_success_script = TR_ADDGOAL_LipGrind_success
        goal_deactivate_script = TR_ADDGOAL_LipGrind_Deactivate
        pro = 'Burnquist'
        full_name = 'Bob Burnquist'
        child = TR_Goal_counter4
    }
endscript


script TR_ADDGOAL_LipGrind_Intro 
endscript


script TR_ADDGOAL_LipGrind_Flash 
    begin 
    setobjectcolor name = <ObjName> color = 10506320
    wait 10 frames
    setobjectcolor name = <ObjName> color = 9195600
    wait 10 frames
    setobjectcolor name = <ObjName> color = 7884880
    wait 10 frames
    setobjectcolor name = <ObjName> color = 6574160
    wait 10 frames
    setobjectcolor name = <ObjName> color = 5263440
    wait 10 frames
    setobjectcolor name = <ObjName> color = 6574160
    wait 10 frames
    setobjectcolor name = <ObjName> color = 7884880
    wait 10 frames
    setobjectcolor name = <ObjName> color = 9195600
    wait 10 frames
    repeat 
endscript


script TR_ADDGOAL_LipGrind_Start 
endscript


script TR_ADDGOAL_LipGrindGap01 
    StartGap GapID = TeachGrindLip flags = [ REQUIRE_RAIL ]
endscript


script TR_ADDGOAL_LipGrindGap02 
    GetTriggerArray grind Off
    if triggertype <trigger_array>
        endgap GapID = TeachGrindLip gapscript = TR_ADDGOAL_LipGrindGot_1
    endif
endscript


script TR_ADDGOAL_LipGrindGot_1 
    if GoalManager_GoalIsActive name = TR_Goal_gaps8
        GoalManager_SetGoalFlag name = TR_Goal_gaps8 got_1 1
    endif
endscript


script TR_ADDGOAL_LipGrind_success 
    KillSpawnedScript name = TR_ADDGOAL_LipGrind_Flash
endscript


script TR_ADDGOAL_LipGrind_Deactivate 
    KillSpawnedScript name = TR_ADDGOAL_LipGrind_Flash
endscript


script TR_ADDGOAL_Melon 
    AddGoal_Counter {
        version = 4
        start_cam_anims = [
            {
                virtual_cam
                TargetID = world
                targetOffset = (-4803.5, -386.20001220703125, -10655.900390625)
                positionOffset = (962.0999755859375, -797.7999877929688, -2495.699951171875)
                skater_node = TRG_G_Counter4_RESTARTNODE
                frames = 100
                cam_anim_text = ''
                skippable = 1
                Play_hold}
        ]
        goal_text = 'Pull off a Melon (\b6 + \b2)\n while in the air'
        view_goals_text = 'Basics - Melon off a vert'
        goal_description = Burnquist_TR_Goal_Counter4
        skater = custom
        number = 1
        unlimited_time = 1
        goal_start_script = TR_ADDGOAL_Melon_Start
        goal_success_script = TR_ADDGOAL_Melon_success
        goal_deactivate_script = TR_ADDGOAL_Melon_Deactivate
        pro = 'Burnquist'
        full_name = 'Bob Burnquist'
        child = TR_Goal_counter2
    }
endscript


script TR_ADDGOAL_Melon_Start 
    SpawnScript TR_ADDGOAL_Melon_SpinChecker
endscript


script TR_ADDGOAL_Melon_SpinChecker 
    ClearExceptionGroup TR_Goal_counter4
    printf 'MelonChecker'
    SetException Ex = SkaterEnterAir scr = TR_ADDGOAL_MelonChecker_Air group = TR_Goal_counter4
    SetException Ex = SkaterEnterBail scr = TR_ADDGOAL_Melon_Start group = TR_Goal_counter4
    Block
endscript


script TR_ADDGOAL_MelonChecker_Air 
    ClearExceptionGroup TR_Goal_counter4
    printf 'MelonChecker Air'
    begin 
    wait 1 frame
    GetNumberOfTrickOccurrences TrickText = 'Melon'
    printstruct <...> 
    if (<number_of_occurrences> > 0)
        SetException Ex = SkaterLanded scr = TR_ADDGOAL_MelonChecker_Land group = TR_Goal_counter4
        SetException Ex = SkaterEnterBail scr = TR_ADDGOAL_Melon_Start group = TR_Goal_counter4
    endif
    repeat 
endscript


script TR_ADDGOAL_MelonChecker_Land 
    ClearExceptionGroup TR_Goal_counter4
    printf 'MelonChecker Land'
    GoalManager_GotCounterObject name = TR_Goal_counter4
endscript


script TR_ADDGOAL_Melon_success 
    ClearExceptionGroup TR_Goal_counter4
    KillSpawnedScript name = TR_ADDGOAL_Melon_SpinChecker
endscript


script TR_ADDGOAL_Melon_Deactivate 
    ClearExceptionGroup TR_Goal_counter4
    KillSpawnedScript name = TR_ADDGOAL_Melon_SpinChecker
endscript


script TR_ADDGOAL_Spin 
    AddGoal_Counter {
        version = 2
        start_cam_anims = [
            {
                virtual_cam
                TargetID = world
                targetOffset = (-4803.5, -386.20001220703125, -10655.900390625)
                positionOffset = (962.0999755859375, -797.7999877929688, -2495.699951171875)
                skater_node = TRG_G_Counter2_RESTARTNODE
                frames = 100
                cam_anim_text = ''
                skippable = 1
                Play_hold}
        ]
        goal_text = 'Land a trick with at least a 360 spin.\n(press and hold\n\b6 or \b5) to spin.'
        view_goals_text = 'Basics - Learn to spin'
        goal_description = Burnquist_TR_Goal_Counter2
        skater = custom
        number = 1
        unlimited_time = 1
        goal_intro_script = TR_ADDGOAL_Spin_Intro
        goal_start_script = TR_ADDGOAL_Spin_Start
        goal_success_script = TR_ADDGOAL_Spin_success
        goal_deactivate_script = TR_ADDGOAL_Spin_Deactivate
        pro = 'Burnquist'
        full_name = 'Bob Burnquist'
        child = TR_Goal_gaps10
    }
endscript


script TR_ADDGOAL_Spin_Intro 
endscript


script TR_ADDGOAL_Spin_Flash 
    begin 
    setobjectcolor name = <ObjName> color = 10506320
    wait 10 frames
    setobjectcolor name = <ObjName> color = 9195600
    wait 10 frames
    setobjectcolor name = <ObjName> color = 7884880
    wait 10 frames
    setobjectcolor name = <ObjName> color = 6574160
    wait 10 frames
    setobjectcolor name = <ObjName> color = 5263440
    wait 10 frames
    setobjectcolor name = <ObjName> color = 6574160
    wait 10 frames
    setobjectcolor name = <ObjName> color = 7884880
    wait 10 frames
    setobjectcolor name = <ObjName> color = 9195600
    wait 10 frames
    repeat 
endscript


script TR_ADDGOAL_Spin_Start 
    SpawnScript TR_ADDGOAL_Spin_SpinChecker
endscript


script TR_ADDGOAL_Spin_SpinChecker 
    ClearExceptionGroup TR_Counter2
    UnSetFlag flag = FLAG_SPIN
    printf 'SpinChecker'
    SetException Ex = SkaterEnterAir scr = TR_ADDGOAL_Spin_SpinChecker_Air group = TR_Counter2
    Block
endscript


script TR_ADDGOAL_Spin_SpinChecker_Air 
    ClearExceptionGroup TR_Counter2
    printf 'SpinChecker Air'
    SetException Ex = SkaterLanded scr = TR_ADDGOAL_Spin_SpinChecker_Land group = TR_Counter2
    SetException Ex = SkaterBailed scr = TR_ADDGOAL_Spin_SpinChecker group = TR_Counter2
    begin 
    wait 1 frame
    skater ::GetSpin
    if (<spin> = 360)
        SetFlag flag = FLAG_SPIN
    endif
    repeat 
endscript


script TR_ADDGOAL_Spin_SpinChecker_Land 
    ClearExceptionGroup TR_Counter2
    printf 'SpinChecker Land'
    if GetFlag flag = FLAG_SPIN
        printf '360'
        if SkaterLastScoreLandedGreaterThan 0
            printf 'set counter'
            GoalManager_GotCounterObject name = TR_Goal_counter2
        else
            goto TR_ADDGOAL_Spin_SpinChecker
            UnSetFlag flag = FLAG_SPIN
        endif
    else
        goto TR_ADDGOAL_Spin_SpinChecker
        UnSetFlag flag = FLAG_SPIN
    endif
    UnSetFlag flag = FLAG_SPIN
endscript


script TR_ADDGOAL_Spin_success 
    KillSpawnedScript name = TR_ADDGOAL_Spin_Flash
    ClearExceptionGroup TR_Counter2
endscript


script TR_ADDGOAL_Spin_Deactivate 
    ClearExceptionGroup TR_Counter2
    KillSpawnedScript name = TR_ADDGOAL_Spin_Flash
endscript

FLAG_SPIN = 1

script TR_ADDGOAL_BreakAir 
    AddGoal_Gaps {
        version = 10
        start_cam_anims = [
            {
                virtual_cam
                TargetID = world
                targetOffset = (6273.10009765625, -1139.199951171875, 5064.7998046875)
                positionOffset = (258.1000061035156, -786.5, -2916.10009765625)
                skater_node = TRG_G_GAP10_RESTARTNODE
                frames = 100
                cam_anim_text = ''
                skippable = 1
                Play_hold}
        ]
        goal_text = 'Get out of half pipe level out (\ml).'
        view_goals_text = 'Basics - Get out of a half pipe'
        goal_description = Burnquist_tr_goal_gaps10
        skater = custom
        unlimited_time = 1
        goal_flags = [ got_1
         ]
        goal_intro_script = TR_ADDGOAL_BreakAir_Intro
        goal_start_script = TR_ADDGOAL_BreakAir_Start
        goal_success_script = TR_ADDGOAL_BreakAir_success
        goal_deactivate_script = TR_ADDGOAL_BreakAir_Deactivate
        pro = 'Burnquist'
        full_name = 'Bob Burnquist'
        child = TR_Goal_gaps9
    }
endscript


script TR_ADDGOAL_BreakAir_Intro 
endscript


script TR_ADDGOAL_BreakAir_Flash 
    begin 
    setobjectcolor name = <ObjName> color = 10506320
    wait 10 frames
    setobjectcolor name = <ObjName> color = 9195600
    wait 10 frames
    setobjectcolor name = <ObjName> color = 7884880
    wait 10 frames
    setobjectcolor name = <ObjName> color = 6574160
    wait 10 frames
    setobjectcolor name = <ObjName> color = 5263440
    wait 10 frames
    setobjectcolor name = <ObjName> color = 6574160
    wait 10 frames
    setobjectcolor name = <ObjName> color = 7884880
    wait 10 frames
    setobjectcolor name = <ObjName> color = 9195600
    wait 10 frames
    repeat 
endscript


script TR_ADDGOAL_BreakAir_Start 
endscript


script TR_ADDGOAL_BreakAirGap01 
    printf 'start Gap'
    StartGap GapID = BreakAir flags = [ PURE_AIR ]
endscript


script TR_ADDGOAL_BreakAirGap02 
    printf 'end Gap'
    endgap GapID = BreakAir gapscript = TR_ADDGOAL_BreakAirGot_1
endscript


script TR_ADDGOAL_BreakAirGot_1 
    GoalManager_SetGoalFlag name = TR_Goal_gaps10 got_1 1
endscript


script TR_ADDGOAL_BreakAir_success 
    SetObjectColor_CurrentTOD name = SkWare_Main_8b
endscript


script TR_ADDGOAL_BreakAir_Deactivate 
    SetObjectColor_CurrentTOD name = SkWare_Main_8b
endscript


script TR_ADDGOAL_Transfer 
    AddGoal_Gaps {
        version = 9
        start_cam_anims = [
            {
                virtual_cam
                TargetID = world
                targetOffset = (3133.199951171875, -1336.0, 6855.7998046875)
                positionOffset = (-690.5, -654.0, -2359.10009765625)
                frames = 100
                cam_anim_text = ''
                skippable = 1
                Play_hold}
        ]
        intro_node = TRG_G_GAP9_RESTARTNODE
        goal_text = 'Transfer from one QP to the other.'
        view_goals_text = 'Basics - QP transfer'
        goal_description = Burnquist_tr_goal_gaps9
        skater = custom
        reward_goal = tr_goal_counter3
        unlimited_time = 1
        goal_flags = [ got_1
         ]
        goal_intro_script = TR_ADDGOAL_Transfer_Intro
        goal_start_script = TR_ADDGOAL_Transfer_Start
        goal_success_script = TR_ADDGOAL_Transfer_success
        goal_deactivate_script = TR_ADDGOAL_Transfer_Deactivate
        pro = 'Burnquist'
        full_name = 'Bob Burnquist'
    }
endscript


script TR_ADDGOAL_Transfer_Intro 
    KillSpawnedScript name = TR_ADDGOAL_BreakAir_Flash
    SpawnScript TR_ADDGOAL_Transfer_Flash params = { ObjName = g_bowl_Qp_front }
    SpawnScript TR_ADDGOAL_Transfer_Flash params = { ObjName = TB_QP_South_Lower_02 }
endscript


script TR_ADDGOAL_Transfer_Flash 
    begin 
    setobjectcolor name = <ObjName> color = 10506320
    wait 10 frames
    setobjectcolor name = <ObjName> color = 9195600
    wait 10 frames
    setobjectcolor name = <ObjName> color = 7884880
    wait 10 frames
    setobjectcolor name = <ObjName> color = 6574160
    wait 10 frames
    setobjectcolor name = <ObjName> color = 5263440
    wait 10 frames
    setobjectcolor name = <ObjName> color = 6574160
    wait 10 frames
    setobjectcolor name = <ObjName> color = 7884880
    wait 10 frames
    setobjectcolor name = <ObjName> color = 9195600
    wait 10 frames
    repeat 
endscript


script TR_ADDGOAL_Transfer_Start 
endscript


script TR_ADDGOAL_TransferGap01 
    printf 'start Gap'
    StartGap GapID = transferA flags = [ PURE_AIR ]
    endgap GapID = transferB text = 'Qp transfer' Score = 50 gapscript = TR_ADDGOAL_TransferGot_1
endscript


script TR_ADDGOAL_TransferGap02 
    printf 'end Gap'
    StartGap GapID = transferB flags = [ PURE_AIR ]
    endgap GapID = transferA text = 'Qp transfer' Score = 50 gapscript = TR_ADDGOAL_TransferGot_1
endscript


script TR_ADDGOAL_TransferGot_1 
    GoalManager_SetGoalFlag name = TR_Goal_gaps9 got_1 1
endscript


script TR_ADDGOAL_Transfer_success 
    KillSpawnedScript name = TR_ADDGOAL_Transfer_Flash
    SetObjectColor_CurrentTOD name = g_bowl_Qp_front
    SetObjectColor_CurrentTOD name = TB_QP_South_Lower_02
    SetObjectColor_CurrentTOD name = SkWare_Main_8b
endscript


script TR_ADDGOAL_Transfer_Deactivate 
    KillSpawnedScript name = TR_ADDGOAL_Transfer_Flash
    SetObjectColor_CurrentTOD name = g_bowl_Qp_front
    SetObjectColor_CurrentTOD name = TB_QP_South_Lower_02
    SetObjectColor_CurrentTOD name = SkWare_Main_8b
endscript


script TR_ADDGOAL_Wallplant 
    AddGoal_Counter {
        version = 3
        start_cam_anims = [
            {
                virtual_cam
                TargetID = world
                targetOffset = (9718.2001953125, -855.5, -2489.60009765625)
                positionOffset = (-266.70001220703125, -659.5999755859375, -1978.5)
                frames = 100
                cam_anim_text = ''
                skippable = 1
                Play_hold = 1}
        ]
        success_cam_anims = [
            {
                virtual_cam
                TargetID = world
                targetOffset = (4262.60009765625, -879.2999877929688, 5534.5)
                positionOffset = (-1599.4000244140625, -617.7000122070312, -2563.0)
                frames = 100
                cam_anim_text = Muska_tr_goal_counter3_Success
                skippable = 1
                Play_hold = 1}
        ]
        intro_node = TRG_G_Counter3_RESTARTNODE
        goal_text = 'Ollie (\b3) then Sticker Slap (\b3) when next to a wall'
        view_goals_text = 'Novice - Sticker Slap the walls'
        goal_description = Muska_tr_goal_counter3
        skater = custom
        unlocked_by_another
        reward_goal = [ tr_goal_gaps11 TR_Goal_TimedScoreRun ]
        number = 5
        goal_intro_script = TR_ADDGOAL_Wallplant_intro
        goal_start_script = TR_ADDGOAL_Wallplant_start
        goal_success_script = TR_ADDGOAL_Wallplant_success
        goal_deactivate_script = TR_ADDGOAL_Wallplant_Deactivate
        pro = 'Muska'
        full_name = 'Chad Muska'
        use_hud_counter
        hud_counter_caption = 'Sticker Slap\'s'
    }
endscript


script TR_ADDGOAL_Wallplant_intro 
endscript


script TR_ADDGOAL_Wallplant_start 
    SpawnScript TR_ADDGOAL_Wallplant_Checker
endscript


script TR_ADDGOAL_Wallplant_Checker 
    printf 'Jumping+++++++++++++++'
    ClearExceptionGroup TR_ADDGOAL_Ollie01
    SetException Ex = SkaterEnterWallplant scr = TR_ADDGOAL_Wallplant_SetFlags group = TR_ADDGOAL_Wallplant01
    Block
endscript


script TR_ADDGOAL_Wallplant_SetFlags 
    printf ' Set Flags=============='
    ClearExceptionGroup TR_ADDGOAL_Wallplant01
    GoalManager_GotCounterObject name = tr_goal_counter3
    goto TR_ADDGOAL_Wallplant_Checker
endscript


script TR_ADDGOAL_Wallplant_success 
    KillSpawnedScript name = TR_ADDGOAL_Wallplant_Checker
    KillSpawnedScript name = TR_ADDGOAL_Wallplant_SetFlags
endscript


script TR_ADDGOAL_Wallplant_Deactivate 
    KillSpawnedScript name = TR_ADDGOAL_Wallplant_Checker
    KillSpawnedScript name = TR_ADDGOAL_Wallplant_SetFlags
endscript


script TR_ADDGOAL_WallBreak 
    AddGoal_Gaps {
        version = 11
        start_cam_anims = [
            {
                virtual_cam
                TargetID = world
                targetOffset = (-9669.400390625, -291.3999938964844, -8195.7998046875)
                positionOffset = (-697.2999877929688, -666.5, -3795.89990234375)
                frames = 50
                cam_anim_text = Valley_tr_goal_gaps11_camanim01
                skippable = 1
                Play_hold
            }
            {
                virtual_cam
                TargetID = world
                targetOffset = (-9669.400390625, -291.3999938964844, -8195.7998046875)
                positionOffset = (-697.2999877929688, -666.5, -3795.89990234375)
                frames = 100
                cam_anim_text = ''
                skippable = 1
                Play_hold
            }
        ]
        success_cam_anims = [
            {
                virtual_cam
                TargetID = world
                targetOffset = (6788.2998046875, -2160.39990234375, 159.39999389648438)
                positionOffset = (-2106.199951171875, -488.8999938964844, -4094.300048828125)
                pre_anim_script = TR_Goal_Gaps11_Pre_Anim
                frames = 100
                cam_anim_text = Valley_tr_goal_gaps11_success
                skippable = 1
                Play_hold
            }
        ]
        intro_node = TRG_G_GAP11_RESTARTNODE
        goal_text = 'Grind (\b0) the top of this Qp towards the wall. When you\'re close to the wall Ollie (\b3) and Sticker Slap it (\b3).'
        view_goals_text = 'Novice - Tear down the wall'
        goal_description = Valley_tr_goal_gaps11
        skater = custom
        unlocked_by_another
        unlimited_time = 1
        goal_flags = [ got_1
         ]
        goal_intro_script = TR_ADDGOAL_WallBreak_Intro
        goal_start_script = TR_ADDGOAL_WallBreak_Start
        goal_success_script = TR_ADDGOAL_WallBreak_success
        goal_deactivate_script = TR_ADDGOAL_WallBreak_Deactivate
        pro = 'Vallely'
        full_name = 'Mike Vallely'
        child = tr_goal_gaps12
    }
endscript


script TR_ADDGOAL_WallBreak_Intro 
    if NOT IsAlive name = g_wall_break_pre
        Create name = g_WareNew_Main_windows
        Create name = g_wall_break_pre
        Create name = g_WareNew_Main_windows_02
        Kill name = g_wall_break_post
        Kill prefix = 'trg_wallbreak_post'
    endif
    SpawnScript TR_ADDGOAL_WallBreak_Flash params = { ObjName = g_wall_break_pre }
    SpawnScript TR_ADDGOAL_WallBreak_Flash params = { ObjName = TB_QP_North_Lower_01 }
endscript


script TR_ADDGOAL_WallBreak_Flash 
    begin 
    setobjectcolor name = <ObjName> color = 10506320
    wait 10 frames
    setobjectcolor name = <ObjName> color = 9195600
    wait 10 frames
    setobjectcolor name = <ObjName> color = 7884880
    wait 10 frames
    setobjectcolor name = <ObjName> color = 6574160
    wait 10 frames
    setobjectcolor name = <ObjName> color = 5263440
    wait 10 frames
    setobjectcolor name = <ObjName> color = 6574160
    wait 10 frames
    setobjectcolor name = <ObjName> color = 7884880
    wait 10 frames
    setobjectcolor name = <ObjName> color = 9195600
    wait 10 frames
    repeat 
endscript


script TR_ADDGOAL_WallBreak_Start 
endscript


script TR_ADDGOAL_WallBreakGap01 
    printf 'start Gap'
    StartGap GapID = WallBreak
endscript


script TR_ADDGOAL_WallBreakGap02 
    GetTriggerArray grind
    if triggertype <trigger_array>
        printf 'ContinueGap'
        endgap GapID = WallBreak continue = { GapID = WallBreak01 }
    endif
endscript


script TR_ADDGOAL_WallBreakGap03 
    GetTriggerArray wallplant onto
    if triggertype <trigger_array>
        if GoalManager_GoalIsActive name = tr_goal_gaps11
            printf 'EndGap'
            endgap GapID = WallBreak01 gapscript = TR_ADDGOAL_WallBreakGot_1
        endif
    endif
endscript


script TR_ADDGOAL_WallBreakGot_1 
    GoalManager_SetGoalFlag name = tr_goal_gaps11 got_1 1
    SpawnScript TR_WallBreakToggle
endscript


script TR_ADDGOAL_WallBreak_success 
    KillSpawnedScript name = TR_ADDGOAL_WallBreak_Flash
    KillSpawnedScript name = TR_WallBreakToggle
    SetObjectColor_CurrentTOD name = TB_QP_North_Lower_01
    Kill name = TRG_SFX_TrigBox_WarehouseHum_02
    Create name = TRG_SFX_TrigBox_WarehouseHum_02
endscript


script TR_ADDGOAL_WallBreak_Deactivate 
    KillSpawnedScript name = TR_ADDGOAL_WallBreak_Flash
    KillSpawnedScript name = TR_WallBreakToggle
    SetObjectColor_CurrentTOD name = TB_QP_North_Lower_01
endscript


script TR_Goal_Gaps11_Pre_Anim 
    SpawnScript TR_SFX_BreakStoneWall
endscript


script TR_ADDGOAL_WallRide 
    AddGoal_Gaps {
        version = 12
        start_cam_anims = [
            {
                virtual_cam
                TargetID = world
                targetOffset = (7341.7001953125, -593.5, -513.7999877929688)
                positionOffset = (-2246.10009765625, -649.5, -3354.10009765625)
                frames = 100
                cam_anim_text = ''
                skippable = 1
                Play_hold
            }
        ]
        success_cam_anims = [
            {
                virtual_cam
                TargetID = world
                targetOffset = (6551.10009765625, 688.7999877929688, -8133.10009765625)
                positionOffset = (-2196.60009765625, -649.2000122070312, -3476.199951171875)
                frames = 100
                pre_anim_script = TR_Goal_Gaps12_Pre_Anim
                skippable = 1
                Play_hold
            }
        ]
        intro_node = TRG_G_GAP12_RESTARTNODE
        goal_text = 'Approch the wall at an angle Ollie (\b3) and Wallride (\b0).'
        view_goals_text = 'Novice - Open the door'
        goal_description = Valley_tr_goal_gaps12
        skater = custom
        reward_goal = tr_goal_counter5
        unlimited_time = 1
        goal_flags = [ got_1
         ]
        goal_intro_script = TR_ADDGOAL_WallRide_Intro
        goal_start_script = TR_ADDGOAL_WallRide_Start
        goal_success_script = TR_ADDGOAL_WallRide_success
        goal_deactivate_script = TR_ADDGOAL_WallRide_Deactivate
        pro = 'Vallely'
        full_name = 'Mike Vallely'
    }
endscript


script TR_ADDGOAL_WallRide_Intro 
    KillSpawnedScript name = TR_ADDGOAL_WallBreak_Flash
    SetObjectColor_CurrentTOD name = TB_QP_North_Lower_01
    SpawnScript TR_ADDGOAL_WallRide_Flash params = { ObjName = g_wall_break_pre }
endscript


script TR_ADDGOAL_WallRide_Flash 
    begin 
    setobjectcolor name = <ObjName> color = 10506320
    wait 10 frames
    setobjectcolor name = <ObjName> color = 9195600
    wait 10 frames
    setobjectcolor name = <ObjName> color = 7884880
    wait 10 frames
    setobjectcolor name = <ObjName> color = 6574160
    wait 10 frames
    setobjectcolor name = <ObjName> color = 5263440
    wait 10 frames
    setobjectcolor name = <ObjName> color = 6574160
    wait 10 frames
    setobjectcolor name = <ObjName> color = 7884880
    wait 10 frames
    setobjectcolor name = <ObjName> color = 9195600
    wait 10 frames
    repeat 
endscript


script TR_ADDGOAL_WallRide_Start 
endscript


script TR_ADDGOAL_WallRideGap01 
    printf 'start Gap'
    StartGap GapID = wallride
endscript


script TR_ADDGOAL_WallRideGap02 
    GetTriggerArray through
    if triggertype <trigger_array>
        getsingletag state
        printf 'EndGap---01'
        if (<state> = Skater_OnWall)
            printf 'EndGap---02'
            if GoalManager_GoalIsActive name = tr_goal_gaps12
                printf 'EndGap---03'
                endgap GapID = wallride gapscript = TR_ADDGOAL_WallRideGot_1
            else
                endgap GapID = wallride text = 'Red Button wallride' Score = 50
            endif
        endif
    endif
endscript


script TR_ADDGOAL_WallRideGot_1 
    GoalManager_SetGoalFlag name = tr_goal_gaps12 got_1 1
endscript


script TR_ADDGOAL_WallRide_success 
    KillSpawnedScript name = TR_ADDGOAL_WallRide_Flash
endscript


script TR_ADDGOAL_WallRide_Deactivate 
    KillSpawnedScript name = TR_ADDGOAL_WallRide_Flash
endscript


script TR_Goal_Gaps12_Pre_Anim 
    Kill name = g_roll_door_LevelGeo
    Create name = g_roll_door01
    g_roll_door01 ::obj_movetorelpos (0.0, 295.0, 0.0) time = 3.500 seconds
    TR_SFX_GarageOpening
    skater ::GetGap text = 'Red Button wallride' Score = 50
endscript


script TR_ADDGOAL_Wallie 
    AddGoal_Counter {
        version = 5
        start_cam_anims = [
            {
                virtual_cam
                targetOffset = (-7647.2001953125, -1241.800048828125, 5437.39990234375)
                positionOffset = (-2974.800048828125, -640.0, -3383.39990234375)
                TargetID = world
                cam_anim_text = Margera_tr_goal_counter5_camanim01
                skippable = 1
                Play_hold}
            {
                virtual_cam
                TargetID = world
                targetOffset = (-7647.2001953125, -1241.800048828125, 5437.39990234375)
                positionOffset = (-2974.800048828125, -640.0, -3383.39990234375)
                frames = 100
                cam_anim_text = ''
                skippable = 1
                Play_hold}
        ]
        intro_node = TRG_G_COUNTER5_RESTARTNODE
        goal_text = 'Wallie (\b3) and grind (\b0) the rail'
        view_goals_text = 'Novice - Wallie and grind the rail'
        goal_description = Margera_tr_goal_counter5
        skater = custom
        unlocked_by_another
        reward_goal = [ TR_Goal_counter7 TR_Goal_Counter6 ]
        number = 1
        unlimited_time = 1
        goal_flags = [ got_1
         ]
        goal_intro_script = TR_ADDGOAL_Wallie_Intro
        goal_start_script = TR_ADDGOAL_Wallie_Start
        goal_success_script = TR_ADDGOAL_Wallie_success
        goal_deactivate_script = TR_ADDGOAL_Wallie_Deactivate
        pro = 'Margera'
        full_name = 'Bam Margera'
    }
endscript


script TR_ADDGOAL_Wallie_Intro 
    KillSpawnedScript name = TR_ADDGOAL_WallRide_Flash
    SetObjectColor_CurrentTOD name = TB_QP_North_Lower_01
    Kill name = SkWare_Kicker_Wood02a03
    Kill name = SkWare_Kicker_Wood02a04
    SpawnScript TR_ADDGOAL_Wallie_Flash params = { ObjName = Geo_Demo_BoxBar05 }
endscript


script TR_ADDGOAL_Wallie_Flash 
    begin 
    setobjectcolor name = <ObjName> color = 10506320
    wait 10 frames
    setobjectcolor name = <ObjName> color = 9195600
    wait 10 frames
    setobjectcolor name = <ObjName> color = 7884880
    wait 10 frames
    setobjectcolor name = <ObjName> color = 6574160
    wait 10 frames
    setobjectcolor name = <ObjName> color = 5263440
    wait 10 frames
    setobjectcolor name = <ObjName> color = 6574160
    wait 10 frames
    setobjectcolor name = <ObjName> color = 7884880
    wait 10 frames
    setobjectcolor name = <ObjName> color = 9195600
    wait 10 frames
    repeat 
endscript


script TR_ADDGOAL_Wallie_Start 
    SpawnScript TR_ADDGOAL_WallieChecker
endscript


script TR_ADDGOAL_WallieChecker 
    ClearExceptionGroup tr_goal_counter5
    printf 'WallieChecker'
    SetException Ex = SkaterEnterAir scr = TR_ADDGOAL_WallieChecker_Air group = tr_goal_counter5
    Block
endscript


script TR_ADDGOAL_WallieChecker_Air 
    ClearExceptionGroup tr_goal_counter5
    printf 'WallieChecker Air'
    begin 
    wait 1 frame
    GetNumberOfTrickOccurrences TrickText = 'Wallie'
    printstruct <...> 
    if (<number_of_occurrences> > 0)
        SetException Ex = SkaterEnterRail scr = TR_ADDGOAL_WallieChecker_Rail group = tr_goal_counter5
        SetException Ex = SkaterExitCombo scr = TR_ADDGOAL_WallieChecker_Fail group = tr_goal_counter5
    endif
    repeat 
endscript


script TR_ADDGOAL_WallieChecker_Fail 
    create_panel_block id = current_goal text = 'Try that again\nWallie (\b3) and grind (\b0) the rail' style = panel_message_goal
    goto TR_ADDGOAL_WallieChecker
endscript


script TR_ADDGOAL_WallieChecker_Rail 
    ClearExceptionGroup tr_goal_counter5
    printf 'WallieChecker Rail'
    GoalManager_GotCounterObject name = tr_goal_counter5
    goto TR_ADDGOAL_WallieChecker
endscript


script TR_ADDGOAL_Wallie_success 
    KillSpawnedScript name = TR_ADDGOAL_Wallie_Flash
    KillSpawnedScript name = TR_ADDGOAL_WallieChecker
    SetObjectColor_CurrentTOD name = Geo_Demo_BoxBar05
    Kill name = TR_Ware_Drywall_COL
    Kill name = g_g_wareNew_Funbox01_door03
    Kill prefix = 'TR_Ware_2X4_03_'
    Kill prefix = 'TR_Ware_Dry_03'
    Create name = TB_WH_Drywall_Broke_03
    Create name = SkWare_Kicker_Wood02a03
    Create name = SkWare_Kicker_Wood02a04
endscript


script TR_ADDGOAL_Wallie_Deactivate 
    KillSpawnedScript name = TR_ADDGOAL_Wallie_Flash
    KillSpawnedScript name = TR_ADDGOAL_WallieChecker
    SetObjectColor_CurrentTOD name = Geo_Demo_BoxBar05
    Create name = SkWare_Kicker_Wood02a03
    Create name = SkWare_Kicker_Wood02a04
endscript


script TR_ADDGOAL_Projectiles 
    AddGoal_Counter {
        version = 6
        start_cam_anims = [
            {
                virtual_cam
                TargetID = world
                targetOffset = (-2153.39990234375, -1842.4000244140625, 7902.2998046875)
                positionOffset = (-2944.5, -646.9000244140625, -1994.4000244140625)
                frames = 100
                cam_anim_text = ''
                skippable = 1
                Play_hold}
        ]
        intro_node = TRG_G_COUNTER6_RESTARTNODE
        goal_text = 'Hit him five times with these tomatoes. Just aim and Throw (\b1).'
        view_goals_text = 'New School - Fun with tomatoes'
        goal_description = Koston_tr_goal_counter6
        skater = custom
        unlocked_by_another
        number = 5
        unlimited_time = 1
        goal_intro_script = TR_ADDGOAL_Projectiles_Intro
        goal_start_script = TR_ADDGOAL_Projectiles_Start
        goal_success_script = TR_ADDGOAL_Projectiles_success
        goal_deactivate_script = TR_ADDGOAL_Projectiles_Deactivate
        pro = 'Koston'
        full_name = 'Eric Koston'
        use_hud_counter
        hud_counter_caption = 'Times hit'
    }
endscript


script TR_ADDGOAL_Projectiles_Intro 
    Create prefix = 'TRG_g_pedWay_counter'
    Create name = TRG_g_ped_counter6
endscript


script TR_ADDGOAL_Projectiles_Start 
    ClearExceptionGroup projectile
    SpawnScript TR_ADDGOAL_Projectiles_Checker
endscript


script TR_ADDGOAL_Projectiles_Checker 
    ClearExceptionGroup projectile
    KillSpawnedScript name = TR_ADDGOAL_Projectiles_Checker_Hit
    SetException Ex = PedHitByProjectile scr = TR_Projectile_Check group = projectile
    Block
endscript


script TR_Projectile_Check 
    ClearExceptionGroup projectile
    printf 'BE_Projectile_Check'
    switch projectile_last_ped_id
        case TRG_g_ped_counter6
        GoalManager_GotCounterObject name = TR_Goal_Counter6
        create_panel_block id = current_goal text = 'Got him!!' style = panel_message_goal
        SpawnScript TR_SFX_Koston_Hitting_PhilM
    endswitch
    goto TR_ADDGOAL_Projectiles_Checker
endscript


script TR_ADDGOAL_Projectiles_Checker_Hit 
    if projectile_last_ped_id = TRG_g_ped_counter6
        create_panel_block id = current_goal text = 'Got him!!' style = panel_message_goal
        GoalManager_GotCounterObject name = TR_Goal_Counter6
        goto TR_ADDGOAL_Projectiles_Checker
    endif
endscript


script TR_ADDGOAL_Projectiles_success 
    printf 'Don\'t get ran success'
    Kill prefix = 'TRG_g_pedWay_counter'
    Kill name = TRG_g_ped_counter6
    ClearExceptionGroup projectile
endscript


script TR_ADDGOAL_Projectiles_Deactivate 
    printf 'Don\'t get ran ceacitvate'
    Kill prefix = 'TRG_g_pedWay_counter'
    Kill name = TRG_g_ped_counter6
    ClearExceptionGroup projectile
endscript


script TR_Ammo 
    Obj_ClearExceptions
    setup_ped_speech {ped_id = <name>
        accept_text = 'Press \m5 to pick up tomatoes'
        activation_script = TR_Ammo_Got
        dont_deactivate_goals
    }
endscript


script TR_Ammo_Got 
    give_skater_ammo num = 10 type = tomato
    if ScreenElementExists id = ped_speech_dialog
        DestroyScreenElement id = ped_speech_dialog
    endif
    UnpauseSkaters
endscript


script TR_ADDGOAL_Spine 
    AddGoal_Gaps {
        version = 13
        start_cam_anims = [
            {
                virtual_cam
                TargetID = world
                targetOffset = (-1190.699951171875, -5000.2001953125, 5158.60009765625)
                positionOffset = (-2893.0, -317.1000061035156, -3511.5)
                frames = 100
                cam_anim_text = ''
                skippable = 1
                Play_hold}
        ]
        intro_node = TRG_G_GAP13_RESTARTNODE
        goal_text = 'Spine Transfer\n(\ml) into the pool.'
        view_goals_text = 'Novice - Spine transfer the fun box'
        goal_description = Margera_tr_goal_gaps13
        skater = custom
        unlocked_by_another
        unlimited_time = 1
        goal_flags = [ got_1
         ]
        goal_intro_script = TR_ADDGOAL_Spine_Intro
        goal_start_script = TR_ADDGOAL_Spine_Start
        goal_success_script = TR_ADDGOAL_Spine_success
        goal_deactivate_script = TR_ADDGOAL_Spine_Deactivate
        pro = 'Margera'
        full_name = 'Bam Margera'
        child = TR_Goal_gaps14
    }
endscript


script TR_ADDGOAL_Spine_Intro 
    SpawnScript TR_ADDGOAL_Spine_Flash params = { ObjName = g_g_wareNew_Funbox }
endscript


script TR_ADDGOAL_Spine_Flash 
    begin 
    setobjectcolor name = <ObjName> color = 10506320
    wait 10 frames
    setobjectcolor name = <ObjName> color = 9195600
    wait 10 frames
    setobjectcolor name = <ObjName> color = 7884880
    wait 10 frames
    setobjectcolor name = <ObjName> color = 6574160
    wait 10 frames
    setobjectcolor name = <ObjName> color = 5263440
    wait 10 frames
    setobjectcolor name = <ObjName> color = 6574160
    wait 10 frames
    setobjectcolor name = <ObjName> color = 7884880
    wait 10 frames
    setobjectcolor name = <ObjName> color = 9195600
    wait 10 frames
    repeat 
endscript


script TR_ADDGOAL_Spine_Start 
endscript


script TR_ADDGOAL_SpineGap01 
    StartGap GapID = spinea flags = [ PURE_AIR ] TrickText = 'Spine Transfer' TrickScript = TR_ADDGOAL_SpineGot_1
    endgap GapID = spineb text = 'Funbox spine' Score = 75
endscript


script TR_ADDGOAL_SpineGap02 
    StartGap GapID = spineb flags = [ PURE_AIR ] TrickText = 'Spine Transfer' TrickScript = TR_ADDGOAL_SpineGot_1
    endgap GapID = spinea text = 'Funbox spine' Score = 75
endscript


script TR_ADDGOAL_SpineGot_1 
    if GoalManager_GoalIsActive name = tr_goal_gaps13
        GoalManager_SetGoalFlag name = tr_goal_gaps13 got_1 1
    endif
endscript


script TR_ADDGOAL_Spine_success 
    KillSpawnedScript name = TR_ADDGOAL_Spine_Flash
    SetObjectColor_CurrentTOD name = g_g_wareNew_Funbox
endscript


script TR_ADDGOAL_Spine_Deactivate 
    KillSpawnedScript name = TR_ADDGOAL_Spine_Flash
    SetObjectColor_CurrentTOD name = g_g_wareNew_Funbox
endscript


script TR_ADDGOAL_Hip 
    AddGoal_Gaps {
        version = 14
        start_cam_anims = [
            {
                virtual_cam
                TargetID = world
                targetOffset = (5999.5, -675.9000244140625, -4679.0)
                positionOffset = (-3388.800048828125, -680.7999877929688, -1235.199951171875)
                frames = 100
                cam_anim_text = ''
                skippable = 1
                Play_hold}
        ]
        intro_node = TRG_G_GAP14_RESTARTNODE
        goal_text = 'Hip Transfer (\ml)'
        view_goals_text = 'Novice - Hip Transfer'
        goal_description = Margera_tr_goal_gaps14
        skater = custom
        unlimited_time = 1
        goal_flags = [ got_1
         ]
        goal_intro_script = TR_ADDGOAL_Hip_Intro
        goal_start_script = TR_ADDGOAL_Hip_Start
        goal_success_script = TR_ADDGOAL_Hip_success
        goal_deactivate_script = TR_ADDGOAL_Hip_Deactivate
        reward_goal = TR_Goal_Counter8
        pro = 'Margera'
        full_name = 'Bam Margera'
    }
endscript


script TR_ADDGOAL_Hip_Intro 
    SpawnScript TR_ADDGOAL_Hip_Flash params = { ObjName = g_spine_qp05 }
    SpawnScript TR_ADDGOAL_Hip_Flash params = { ObjName = g_spine_qp07 }
endscript


script TR_ADDGOAL_Hip_Flash 
    begin 
    setobjectcolor name = <ObjName> color = 10506320
    wait 10 frames
    setobjectcolor name = <ObjName> color = 9195600
    wait 10 frames
    setobjectcolor name = <ObjName> color = 7884880
    wait 10 frames
    setobjectcolor name = <ObjName> color = 6574160
    wait 10 frames
    setobjectcolor name = <ObjName> color = 5263440
    wait 10 frames
    setobjectcolor name = <ObjName> color = 6574160
    wait 10 frames
    setobjectcolor name = <ObjName> color = 7884880
    wait 10 frames
    setobjectcolor name = <ObjName> color = 9195600
    wait 10 frames
    repeat 
endscript


script TR_ADDGOAL_Hip_Start 
endscript


script TR_ADDGOAL_HipGap01 
    printf 'Start'
    StartGap GapID = hip flags = [ PURE_AIR ] TrickText = 'Hip Transfer' TrickScript = TR_ADDGOAL_HipGot_1
    endgap GapID = hipa text = 'Hippin' Score = 100
endscript


script TR_ADDGOAL_HipGap02 
    printf 'End'
    StartGap GapID = hipa flags = [ PURE_AIR ] TrickText = 'Hip Transfer' TrickScript = TR_ADDGOAL_HipGot_1
    endgap GapID = hip text = 'Hippin' Score = 100
endscript


script TR_ADDGOAL_HipGot_1 
    if GoalManager_GoalIsActive name = TR_Goal_gaps14
        printf 'Got 1'
        GoalManager_SetGoalFlag name = TR_Goal_gaps14 got_1 1
    endif
endscript


script TR_ADDGOAL_Hip_success 
    KillSpawnedScript name = TR_ADDGOAL_Hip_Flash
    SetObjectColor_CurrentTOD name = g_spine_qp05
    SetObjectColor_CurrentTOD name = g_spine_qp07
endscript


script TR_ADDGOAL_Hip_Deactivate 
    KillSpawnedScript name = TR_ADDGOAL_Hip_Flash
    SetObjectColor_CurrentTOD name = g_spine_qp05
    SetObjectColor_CurrentTOD name = g_spine_qp07
endscript


script TR_ADDGOAL_CaveMan 
    AddGoal_Counter {
        version = 7
        start_cam_anims = [
            {
                virtual_cam
                TargetID = world
                targetOffset = (5855.89990234375, -626.0, 2419.699951171875)
                positionOffset = (-2513.800048828125, -721.7000122070312, -3052.0)
                frames = 100
                cam_anim_text = Vallely_tr_goal_counter7_camanim01
                skippable = 1
                Play_hold = 1
            }
            {
                virtual_cam
                TargetID = world
                targetOffset = (5855.89990234375, -626.0, 2419.699951171875)
                positionOffset = (-2513.800048828125, -721.7000122070312, -3052.0)
                frames = 100
                cam_anim_text = ''
                skippable = 1
                Play_hold = 1
            }
        ]
        intro_node = TRG_G_Couter7_RESTARTNODE
        goal_text = 'Get off your board (\mm). When off your board jump up and Caveman (\mm).'
        view_goals_text = 'Off board - Caveman time'
        goal_description = Vallely_tr_goal_counter7
        skater = custom
        unlocked_by_another
        number = 3
        goal_intro_script = TR_ADDGOAL_CaveMan_intro
        goal_start_script = TR_ADDGOAL_CaveMan_start
        goal_success_script = TR_ADDGOAL_CaveMan_success
        goal_deactivate_script = TR_ADDGOAL_CaveMan_Deactivate
        pro = 'Vallely'
        full_name = 'Mike Vallely'
        use_hud_counter
        hud_counter_caption = 'Caveman'
        child = tr_goal_gaps15
    }
endscript


script TR_ADDGOAL_CaveMan_intro 
endscript


script TR_ADDGOAL_CaveMan_start 
    SpawnScript TR_ADDGOAL_CaveMan_Checker
endscript


script TR_ADDGOAL_CaveMan_Checker 
    ClearExceptionGroup TR_Goal_counter7
    begin 
    GetNumberOfTrickOccurrences TrickText = 'CaveMan'
    printstruct <...> 
    if (<number_of_occurrences> > 0)
        printf 'Jumping+++++++++++++++'
        goto TR_ADDGOAL_CaveMan_Landed
    endif
    wait 10 gameframes
    repeat 
endscript


script TR_ADDGOAL_CaveMan_Landed 
    ClearExceptionGroup TR_Goal_counter7
    printf 'Set Exception'
    SetException Ex = SkaterLanded scr = TR_ADDGOAL_CaveMan_SetFlag group = TR_Goal_counter7
    SetException Ex = SkaterBailed scr = TR_ADDGOAL_CaveMan_DontSetFlag group = TR_Goal_counter7
    Block
endscript


script TR_ADDGOAL_CaveMan_SetFlag 
    ClearExceptionGroup TR_Goal_counter7
    printf ' Set Flags=============='
    GoalManager_GotCounterObject name = TR_Goal_counter7
    goto TR_ADDGOAL_CaveMan_Checker
endscript


script TR_ADDGOAL_CaveMan_DontSetFlag 
    ClearExceptionGroup TR_Goal_counter7
    goto TR_ADDGOAL_CaveMan_Checker
endscript


script TR_ADDGOAL_CaveMan_success 
    ClearExceptionGroup TR_Goal_counter7
    KillSpawnedScript name = TR_ADDGOAL_CaveMan_Checker
endscript


script TR_ADDGOAL_CaveMan_Deactivate 
    ClearExceptionGroup TR_Goal_counter7
    KillSpawnedScript name = TR_ADDGOAL_CaveMan_Checker
endscript


script TR_ADDGOAL_Jump 
    AddGoal_Gaps {
        version = 15
        start_cam_anims = [
            {
                virtual_cam
                TargetID = world
                targetOffset = (7136.2001953125, -2431.300048828125, -1.2999999523162842)
                positionOffset = (-2301.800048828125, -688.7000122070312, -2810.0)
                frames = 100
                cam_anim_text = Vallely_tr_goal_gaps15_camanim01
                skippable = 1
                Play_hold}
            {
                virtual_cam
                TargetID = world
                targetOffset = (7828.7998046875, -905.9000244140625, -3542.39990234375)
                positionOffset = (-2152.60009765625, -691.5999755859375, -2971.39990234375)
                frames = 100
                cam_anim_text = Vallely_tr_goal_gaps15_camanim02
                skippable = 1
                Play_hold}
            {
                virtual_cam
                TargetID = world
                targetOffset = (7699.10009765625, -778.9000244140625, -3692.800048828125)
                positionOffset = (-2217.10009765625, -645.7000122070312, -2408.300048828125)
                frames = 100
                cam_anim_text = ''
                skippable = 1
                Play_hold}
        ]
        intro_node = TRG_G_GAP15_RESTARTNODE
        goal_text = 'Get off your board (\mm).'
        view_goals_text = 'Off board - Jump on the crates'
        goal_description = Vallely_tr_goal_gaps15
        skater = custom
        unlimited_time = 1
        goal_flags = [ got_1
        got_2
         ]
        goal_intro_script = TR_ADDGOAL_Jump_Intro
        goal_start_script = TR_ADDGOAL_Jump_Start
        pro = 'Vallely'
        full_name = 'Mike Vallely'
        child = TR_Goal_gaps18
    }
endscript


script TR_ADDGOAL_Jump_Intro 
    ClearExceptionGroup TR_Goal_counter7
    KillSpawnedScript name = TR_ADDGOAL_CaveMan_Checker
endscript


script TR_ADDGOAL_Jump_Start 
    create_panel_block id = current_goal text = 'Get off your board (\mm).' style = panel_message_goal
    WaitForEvent type = SkaterEnterWalking
    create_panel_block id = current_goal text = 'Then get near this one and jump (\b3) and (\b7) to jump on it.' style = panel_message_goal
endscript


script TR_ADDGOAL_JumpGap02A 
    printf 'Got 1'
    StartGap GapID = Jump02 flags = [ CANCEL_GROUND ]
endscript


script TR_ADDGOAL_JumpGap02B 
    printf 'Got 2'
    endgap GapID = Jump02 gapscript = TR_ADDGOAL_JumpGot_1
endscript


script TR_ADDGOAL_JumpGap03A 
    printf 'Got 1'
    StartGap GapID = Jump03 flags = [ CANCEL_GROUND ]
endscript


script TR_ADDGOAL_JumpGap03B 
    printf 'Got 3'
    endgap GapID = Jump03 gapscript = TR_ADDGOAL_JumpGot_2
endscript


script TR_ADDGOAL_JumpGot_1 
    if GoalManager_GoalIsActive name = tr_goal_gaps15
        GoalManager_SetGoalFlag name = tr_goal_gaps15 got_1 1
        create_panel_block id = current_goal text = 'Ok one more. Jump down and do a double jump up on the next one.' style = panel_message_goal
    endif
endscript


script TR_ADDGOAL_JumpGot_2 
    if GoalManager_GoalIsActive name = tr_goal_gaps15
        GoalManager_SetGoalFlag name = tr_goal_gaps15 got_2 1
    endif
endscript


script TR_ADDGOAL_RunJump 
    AddGoal_Gaps {
        version = 18
        start_cam_anims = [
            {
                virtual_cam
                TargetID = world
                targetOffset = (6854.7998046875, -4331.5, -2720.699951171875)
                positionOffset = (-2319.39990234375, -397.5, -2122.89990234375)
                frames = 100
                cam_anim_text = ''
                skippable = 1
                Play_hold
            }
        ]
        intro_node = TRG_G_GAP18_RESTARTNODE
        goal_text = 'Jump and hang on (\bf) to the ledge.'
        view_goals_text = 'Off board - Jump and hang'
        goal_description = Vallely_tr_goal_gaps18
        skater = custom
        unlimited_time = 1
        goal_flags = [ got_1
         ]
        goal_intro_script = TR_ADDGOAL_RunJump_Intro
        goal_start_script = TR_ADDGOAL_RunJump_Start
        goal_success_script = TR_ADDGOAL_RunJump_success
        goal_deactivate_script = TR_ADDGOAL_RunJump_Deactivate
        pro = 'Vallely'
        full_name = 'Mike Vallely'
        child = TR_Goal_gaps19
    }
endscript


script TR_ADDGOAL_RunJump_Intro 
    SpawnScript TR_ADDGOAL_RunJump_Flash params = { ObjName = g_g_warenew_island }
endscript


script TR_ADDGOAL_RunJump_Flash 
    begin 
    setobjectcolor name = <ObjName> color = 10506320
    wait 10 frames
    setobjectcolor name = <ObjName> color = 9195600
    wait 10 frames
    setobjectcolor name = <ObjName> color = 7884880
    wait 10 frames
    setobjectcolor name = <ObjName> color = 6574160
    wait 10 frames
    setobjectcolor name = <ObjName> color = 5263440
    wait 10 frames
    setobjectcolor name = <ObjName> color = 6574160
    wait 10 frames
    setobjectcolor name = <ObjName> color = 7884880
    wait 10 frames
    setobjectcolor name = <ObjName> color = 9195600
    wait 10 frames
    repeat 
endscript


script TR_ADDGOAL_RunJump_Start 
    skater ::ForceToWalk
endscript


script TR_ADDGOAL_RunJumpGap02 
    printf 'Continue gap'
    if GoalManager_GoalIsActive name = TR_Goal_gaps18
        create_panel_message {
            id = current_goal
            text = 'Now pull (\b7) yourself up.'
            style = panel_message_goal
        }
        GetTriggerArray climb Off
        if triggertype <trigger_array>
            printf 'Hang ON'
            StartGap GapID = runjump01 flags = [ CANCEL_GROUND CANCEL_MANUAL ]
        endif
    endif
endscript


script TR_ADDGOAL_RunJumpGap03 
    if GoalManager_GoalIsActive name = TR_Goal_gaps18
        printf 'ENDGAP++++++++++++___01'
        GetTriggerArray through
        if triggertype <trigger_array>
            printf 'ENDGAP++++++++++++___02'
            endgap GapID = runjump01 gapscript = TR_ADDGOAL_RunJumpGot_1
            goto TR_ADDGOAL_RunJumpGot_1
        endif
    endif
endscript


script TR_ADDGOAL_RunJumpGot_1 
    printf 'Pre_goalManager'
    if GoalManager_GoalIsActive name = TR_Goal_gaps18
        printf 'Got_Gap'
        GoalManager_SetGoalFlag name = TR_Goal_gaps18 got_1 1
    endif
endscript


script TR_ADDGOAL_RunJump_success 
    KillSpawnedScript name = TR_ADDGOAL_RunJump_Flash
    SetObjectColor_CurrentTOD name = g_g_warenew_island
endscript


script TR_ADDGOAL_RunJump_Deactivate 
    KillSpawnedScript name = TR_ADDGOAL_RunJump_Flash
    SetObjectColor_CurrentTOD name = g_g_warenew_island
    skater ::KillForceToWalk
endscript


script TR_ADDGOAL_Ladder 
    AddGoal_Gaps {
        version = 19
        start_cam_anims = [
            {
                virtual_cam
                TargetID = world
                targetOffset = (-2915.0, -9917.599609375, -1850.0999755859375)
                positionOffset = (-1775.699951171875, 17.100000381469727, -1874.0999755859375)
                frames = 100
                cam_anim_text = ''
                skippable = 1
                Play_hold
            }
        ]
        intro_node = TRG_G_GAP19_RESTARTNODE
        goal_text = 'Walk towards the ladder and push (\b7) to climb.'
        view_goals_text = 'Off board - Climb the ladder'
        goal_description = Vallely_tr_goal_gaps19
        skater = custom
        unlimited_time = 1
        goal_flags = [ got_1
         ]
        goal_intro_script = TR_ADDGOAL_Ladder_Intro
        goal_start_script = TR_ADDGOAL_Ladder_Start
        goal_success_script = TR_ADDGOAL_Ladder_success
        goal_deactivate_script = TR_ADDGOAL_Ladder_Deactivate
        pro = 'Vallely'
        full_name = 'Mike Vallely'
        child = TR_Goal_gaps25
    }
endscript


script TR_ADDGOAL_Ladder_Intro 
    SpawnScript TR_ADDGOAL_Ladder_Flash params = { ObjName = g_WareNew_MainLadder }
endscript


script TR_ADDGOAL_Ladder_Flash 
    begin 
    setobjectcolor name = <ObjName> color = 10506320
    wait 10 frames
    setobjectcolor name = <ObjName> color = 9195600
    wait 10 frames
    setobjectcolor name = <ObjName> color = 7884880
    wait 10 frames
    setobjectcolor name = <ObjName> color = 6574160
    wait 10 frames
    setobjectcolor name = <ObjName> color = 5263440
    wait 10 frames
    setobjectcolor name = <ObjName> color = 6574160
    wait 10 frames
    setobjectcolor name = <ObjName> color = 7884880
    wait 10 frames
    setobjectcolor name = <ObjName> color = 9195600
    wait 10 frames
    repeat 
endscript


script TR_ADDGOAL_Ladder_Start 
    skater ::ForceToWalk
endscript


script TR_ADDGOAL_LadderGap01 
    printf 'Start gap'
    StartGap GapID = Ladder
endscript


script TR_ADDGOAL_LadderGap02 
    printf 'Continue gap'
    if GoalManager_GoalIsActive name = TR_Goal_gaps19
        endgap GapID = Ladder gapscript = TR_ADDGOAL_LadderGot_1
    endif
endscript


script TR_ADDGOAL_LadderGot_1 
    if GoalManager_GoalIsActive name = TR_Goal_gaps19
        GoalManager_SetGoalFlag name = TR_Goal_gaps19 got_1 1
    endif
endscript


script TR_ADDGOAL_Ladder_success 
    KillSpawnedScript name = TR_ADDGOAL_Ladder_Flash
    SetObjectColor_CurrentTOD name = g_WareNew_MainLadder
    skater ::KillForceToWalk
endscript


script TR_ADDGOAL_Ladder_Deactivate 
    KillSpawnedScript name = TR_ADDGOAL_Ladder_Flash
    SetObjectColor_CurrentTOD name = g_WareNew_MainLadder
    skater ::KillForceToWalk
endscript


script TR_ADDGOAL_Shimmy 
    AddGoal_Gaps {
        version = 25
        start_cam_anims = [
            {
                virtual_cam
                TargetID = world
                targetOffset = (7685.5, 533.7000122070312, -1214.9000244140625)
                positionOffset = (-2284.39990234375, -112.4000015258789, -1644.0)
                frames = 100
                cam_anim_text = Vallely_tr_goal_gaps25_camanim01
                skippable = 1
                Play_hold
            }
            {
                virtual_cam
                TargetID = world
                targetOffset = (7685.5, 533.7000122070312, -1214.9000244140625)
                positionOffset = (-2284.39990234375, -112.4000015258789, -1644.0)
                frames = 100
                cam_anim_text = ''
                skippable = 1
                Play_hold
            }
        ]
        intro_node = TRG_G_GAP25_RESTARTNODE
        goal_text = 'Walk slowly to the edge.\nShimmy (\b5 and \b6) to the opening.'
        view_goals_text = 'Off board - Shimmy to the opening'
        goal_description = Vallely_tr_goal_gaps25
        skater = custom
        unlimited_time = 1
        goal_flags = [ got_1
         ]
        goal_intro_script = TR_ADDGOAL_Shimmy_Intro
        goal_start_script = TR_ADDGOAL_Shimmy_Start
        goal_success_script = TR_ADDGOAL_Shimmy_success
        goal_deactivate_script = TR_ADDGOAL_Shimmy_Deactivate
        pro = 'Vallely'
        full_name = 'Mike Vallely'
        child = TR_Goal_gaps22
    }
endscript


script TR_ADDGOAL_Shimmy_Intro 
    KillSpawnedScript name = TR_ADDGOAL_Ladder_Flash
    SetObjectColor_CurrentTOD name = g_WareNew_MainLadder
endscript


script TR_ADDGOAL_Shimmy_Flash 
    begin 
    setobjectcolor name = <ObjName> color = 10506320
    wait 10 frames
    setobjectcolor name = <ObjName> color = 9195600
    wait 10 frames
    setobjectcolor name = <ObjName> color = 7884880
    wait 10 frames
    setobjectcolor name = <ObjName> color = 6574160
    wait 10 frames
    setobjectcolor name = <ObjName> color = 5263440
    wait 10 frames
    setobjectcolor name = <ObjName> color = 6574160
    wait 10 frames
    setobjectcolor name = <ObjName> color = 7884880
    wait 10 frames
    setobjectcolor name = <ObjName> color = 9195600
    wait 10 frames
    repeat 
endscript


script TR_ADDGOAL_Shimmy_Start 
    skater ::ForceToWalk
endscript


script TR_ADDGOAL_ShimmyGap01 
    StartGap GapID = Shimmy flags = [ CANCEL_GROUND CANCEL_MANUAL ]
endscript


script TR_ADDGOAL_ShimmyGap02 
    if GoalManager_GoalIsActive name = TR_Goal_gaps25
        endgap GapID = Shimmy gapscript = TR_ADDGOAL_ShimmyGot_1
    endif
endscript


script TR_ADDGOAL_ShimmyGot_1 
    if GoalManager_GoalIsActive name = TR_Goal_gaps25
        GoalManager_SetGoalFlag name = TR_Goal_gaps25 got_1 1
    endif
endscript


script TR_ADDGOAL_Shimmy_success 
    KillSpawnedScript name = TR_ADDGOAL_Shimmy_Flash
    SetObjectColor_CurrentTOD name = g_WareNew_MainLadder
    skater ::KillForceToWalk
endscript


script TR_ADDGOAL_Shimmy_Deactivate 
    KillSpawnedScript name = TR_ADDGOAL_Shimmy_Flash
    SetObjectColor_CurrentTOD name = g_WareNew_MainLadder
    skater ::KillForceToWalk
endscript


script TR_ADDGOAL_JumpGrind 
    AddGoal_Gaps {
        version = 16
        start_cam_anims = [
            {
                virtual_cam
                TargetID = world
                targetOffset = (-12953.5, -1322.800048828125, -1720.300048828125)
                positionOffset = (-3156.800048828125, -657.5, -3612.89990234375)
                frames = 100
                cam_anim_text = Muska_tr_goal_gaps16_camanim01
                skippable = 1
                Play_hold
            }
            {
                virtual_cam
                TargetID = world
                targetOffset = (-9543.7001953125, -1911.0, 4451.10009765625)
                positionOffset = (-3633.300048828125, -496.1000061035156, -3490.199951171875)
                frames = 100
                cam_anim_text = Muska_tr_goal_gaps16_camanim02
                skippable = 1
                Play_hold
            }
            {
                virtual_cam
                TargetID = world
                targetOffset = (-5685.39990234375, -2268.0, 7129.89990234375)
                positionOffset = (-3727.800048828125, -472.6000061035156, -2510.800048828125)
                frames = 100
                cam_anim_text = ''
                skippable = 1
                Play_hold
            }
        ]
        intro_node = TRG_G_GAP16_RESTARTNODE
        goal_text = 'My first combo'
        view_goals_text = 'Novice - My first combo'
        goal_description = Muska_tr_goal_gaps16
        skater = custom
        unlocked_by_another
        unlimited_time = 1
        goal_flags = [ got_1
         ]
        goal_intro_script = TR_ADDGOAL_JumpGrind_Intro
        goal_start_script = TR_ADDGOAL_JumpGrind_Start
        goal_success_script = TR_ADDGOAL_JumpGrind_success
        goal_deactivate_script = TR_ADDGOAL_JumpGrind_Deactivate
        pro = 'Muska'
        full_name = 'Chad Muska'
        child = TR_Goal_gaps17
    }
endscript


script TR_ADDGOAL_JumpGrind_Intro 
    SpawnScript TR_ADDGOAL_JumpGrind_Flash params = { ObjName = g_g_wareNew_qp }
    SpawnScript TR_ADDGOAL_JumpGrind_Flash params = { ObjName = SkWare_Rail12 }
    SpawnScript TR_ADDGOAL_JumpGrind_Flash params = { ObjName = g_spine_qp07 }
endscript


script TR_ADDGOAL_JumpGrind_Flash 
    begin 
    setobjectcolor name = <ObjName> color = 10506320
    wait 10 frames
    setobjectcolor name = <ObjName> color = 9195600
    wait 10 frames
    setobjectcolor name = <ObjName> color = 7884880
    wait 10 frames
    setobjectcolor name = <ObjName> color = 6574160
    wait 10 frames
    setobjectcolor name = <ObjName> color = 5263440
    wait 10 frames
    setobjectcolor name = <ObjName> color = 6574160
    wait 10 frames
    setobjectcolor name = <ObjName> color = 7884880
    wait 10 frames
    setobjectcolor name = <ObjName> color = 9195600
    wait 10 frames
    repeat 
endscript


script TR_ADDGOAL_JumpGrind_Start 
endscript


script TR_ADDGOAL_JumpGrindGap01 
    printf 'Start gap'
    StartGap GapID = jumpgrind flags = [ CANCEL_GROUND CANCEL_MANUAL ]
endscript


script TR_ADDGOAL_JumpGrindGap02 
    printf 'Continue gap'
    endgap GapID = jumpgrind continue = {GapID = jumpgrind01 flags = [ CANCEL_GROUND CANCEL_MANUAL ]}
endscript


script TR_ADDGOAL_JumpGrindGap03 
    printf 'End gap'
    endgap GapID = jumpgrind01 gapscript = TR_ADDGOAL_JumpGrindGot_1
endscript


script TR_ADDGOAL_JumpGrindGot_1 
    if GoalManager_GoalIsActive name = tr_goal_gaps16
        GoalManager_SetGoalFlag name = tr_goal_gaps16 got_1 1
    endif
endscript


script TR_ADDGOAL_JumpGrindGap01a 
    printf 'Start gap'
    StartGap GapID = jumpgrinda flags = [ CANCEL_GROUND CANCEL_MANUAL ]
endscript


script TR_ADDGOAL_JumpGrindGap02a 
    printf 'Continue gap'
    endgap GapID = jumpgrinda continue = {GapID = jumpgrindb flags = [ CANCEL_GROUND CANCEL_MANUAL ]}
endscript


script TR_ADDGOAL_JumpGrindGap03a 
    printf 'End gap'
    endgap GapID = jumpgrindb gapscript = TR_ADDGOAL_JumpGrindGot_1
endscript


script TR_ADDGOAL_JumpGrind_success 
    KillSpawnedScript name = TR_ADDGOAL_JumpGrind_Flash
    SetObjectColor_CurrentTOD name = SkWare_Rail12
    SetObjectColor_CurrentTOD name = g_g_wareNew_qp
    SetObjectColor_CurrentTOD name = g_spine_qp07
endscript


script TR_ADDGOAL_JumpGrind_Deactivate 
    KillSpawnedScript name = TR_ADDGOAL_JumpGrind_Flash
    SetObjectColor_CurrentTOD name = SkWare_Rail12
    SetObjectColor_CurrentTOD name = g_g_wareNew_qp
    SetObjectColor_CurrentTOD name = g_spine_qp07
endscript


script TR_ADDGOAL_SideJump 
    AddGoal_Gaps {
        version = 17
        start_cam_anims = [
            {
                virtual_cam
                TargetID = world
                targetOffset = (-12953.5, -1322.800048828125, -1720.300048828125)
                positionOffset = (-3156.800048828125, -657.5, -3612.89990234375)
                frames = 100
                cam_anim_text = Muska_tr_goal_gaps17_camanim01
                skippable = 1
                Play_hold
            }
            {
                virtual_cam
                TargetID = world
                targetOffset = (-2169.199951171875, -2991.800048828125, 5977.0)
                positionOffset = (-3768.300048828125, -480.0, -3569.300048828125)
                frames = 100
                cam_anim_text = Muska_tr_goal_gaps17_camanim02
                skippable = 1
                Play_hold
            }
            {
                virtual_cam
                TargetID = world
                targetOffset = (-2490.800048828125, -2985.699951171875, 7116.2998046875)
                positionOffset = (-3710.10009765625, -473.8999938964844, -2485.89990234375)
                frames = 100
                cam_anim_text = ''
                skippable = 1
                Play_hold
            }
        ]
        intro_node = TRG_G_GAP17_RESTARTNODE
        goal_text = 'Side jump to the rail then to the QP.'
        view_goals_text = 'Novice - Side jumping combo'
        goal_description = Muska_tr_goal_gaps17
        skater = custom
        reward_goal = [ tr_goal_gaps13 tr_goal_gaps21 ]
        unlimited_time = 1
        goal_flags = [ got_1
         ]
        goal_intro_script = TR_ADDGOAL_SideJump_Intro
        goal_start_script = TR_ADDGOAL_SideJump_Start
        goal_success_script = TR_ADDGOAL_SideJump_success
        goal_deactivate_script = TR_ADDGOAL_SideJump_Deactivate
        pro = 'Muska'
        full_name = 'Muska'
    }
endscript


script TR_ADDGOAL_SideJump_Intro 
    SpawnScript TR_ADDGOAL_SideJump_Flash params = { ObjName = g_g_wareNew_qp }
    SpawnScript TR_ADDGOAL_SideJump_Flash params = { ObjName = g_spine_qp07 }
    SpawnScript TR_ADDGOAL_SideJump_Flash params = { ObjName = Geo_Demo_BoxBar09 }
endscript


script TR_ADDGOAL_SideJump_Flash 
    begin 
    setobjectcolor name = <ObjName> color = 10506320
    wait 10 frames
    setobjectcolor name = <ObjName> color = 9195600
    wait 10 frames
    setobjectcolor name = <ObjName> color = 7884880
    wait 10 frames
    setobjectcolor name = <ObjName> color = 6574160
    wait 10 frames
    setobjectcolor name = <ObjName> color = 5263440
    wait 10 frames
    setobjectcolor name = <ObjName> color = 6574160
    wait 10 frames
    setobjectcolor name = <ObjName> color = 7884880
    wait 10 frames
    setobjectcolor name = <ObjName> color = 9195600
    wait 10 frames
    repeat 
endscript


script TR_ADDGOAL_SideJump_Start 
endscript


script TR_ADDGOAL_SideJumpGap01 
    printf 'Start gap'
    StartGap GapID = sidejump flags = [ CANCEL_GROUND CANCEL_MANUAL ]
endscript


script TR_ADDGOAL_SideJumpGap02 
    printf 'Continue gap'
    endgap GapID = sidejump continue = {GapID = sidejump01 flags = [ CANCEL_GROUND CANCEL_MANUAL ]}
endscript


script TR_ADDGOAL_SideJumpGap03 
    printf 'End gap'
    endgap GapID = sidejump01 gapscript = TR_ADDGOAL_SideJumpGot_1
endscript


script TR_ADDGOAL_SideJumpGot_1 
    if GoalManager_GoalIsActive name = TR_Goal_gaps17
        GoalManager_SetGoalFlag name = TR_Goal_gaps17 got_1 1
    endif
endscript


script TR_ADDGOAL_SideJumpGap01a 
    printf 'Start gap'
    StartGap GapID = sidejumpa flags = [ CANCEL_GROUND CANCEL_MANUAL ]
endscript


script TR_ADDGOAL_SideJumpGap02a 
    printf 'Continue gap'
    endgap GapID = sidejumpa continue = {GapID = sidejumpb flags = [ CANCEL_GROUND CANCEL_MANUAL ]}
endscript


script TR_ADDGOAL_SideJumpGap03a 
    printf 'End gap'
    endgap GapID = sidejumpb gapscript = TR_ADDGOAL_SideJumpGot_1
endscript


script TR_ADDGOAL_SideJump_success 
    printf 'Success'
    KillSpawnedScript name = TR_ADDGOAL_SideJump_Flash
    SetObjectColor_CurrentTOD name = g_g_wareNew_qp
    SetObjectColor_CurrentTOD name = Geo_Demo_BoxBar09
    SetObjectColor_CurrentTOD name = g_spine_qp07
endscript


script TR_ADDGOAL_SideJump_Deactivate 
    KillSpawnedScript name = TR_ADDGOAL_SideJump_Flash
    SetObjectColor_CurrentTOD name = g_g_wareNew_qp
    SetObjectColor_CurrentTOD name = Geo_Demo_BoxBar09
    SetObjectColor_CurrentTOD name = g_spine_qp07
endscript


script TR_ADDGOAL_RevertManual 
    AddGoal_Gaps {
        version = 26
        start_cam_anims = [
            {
                virtual_cam
                TargetID = world
                targetOffset = (-3538.39990234375, -757.7000122070312, -13557.400390625)
                positionOffset = (-3051.60009765625, -669.0999755859375, -3569.60009765625)
                frames = 100
                cam_anim_text = Margera_tr_goal_gaps26_camanim01
                skippable = 1
                Play_hold
            }
            {
                virtual_cam
                TargetID = world
                targetOffset = (-3538.39990234375, -757.7000122070312, -13557.400390625)
                positionOffset = (-3051.60009765625, -669.0999755859375, -3569.60009765625)
                frames = 100
                cam_anim_text = ''
                skippable = 1
                Play_hold
            }
        ]
        intro_node = TRG_G_GAP26_RESTARTNODE
        goal_text = 'Go up the QP and do a grab move.'
        view_goals_text = 'Novice - Do a real combo'
        goal_description = Margera_tr_goal_gaps26
        reward_goal = TR_Goal_Special
        skater = custom
        unlocked_by_another
        unlimited_time = 1
        goal_flags = [ got_1
         ]
        goal_intro_script = TR_ADDGOAL_RevertManual_Intro
        goal_start_script = TR_ADDGOAL_RevertManual_Start
        goal_success_script = TR_ADDGOAL_RevertManual_success
        goal_deactivate_script = TR_ADDGOAL_RevertManual_Deactivate
        pro = 'Margera'
        full_name = 'Bam Margera'
    }
endscript


script TR_ADDGOAL_RevertManual_Intro 
endscript


script TR_ADDGOAL_RevertManual_Start 
    SpawnScript TR_TrickChecker_GoalStart
endscript


script TR_TrickChecker_GoalStart 
    ClearExceptionGroup TR_TrickChecker
    SetException Ex = SkaterEnterVertAir scr = TR_TrickChecker_InVertAir group = TR_TrickChecker
    Block
endscript


script TR_TrickChecker_InVertAir 
    create_panel_block id = current_goal text = 'Pull a grab trick!' style = panel_message_goal
    ClearExceptionGroup TR_TrickChecker
    SetException Ex = SkaterExitVertAir scr = TR_TrickChecker_GoalStart group = TR_TrickChecker
    SetException Ex = SkaterEnterGrab scr = TR_TrickChecker_TriggeredGrab group = TR_TrickChecker
    Block
endscript


script TR_TrickChecker_TriggeredGrab 
    create_panel_block id = current_goal text = 'Great! Now Revert (\mk) to a Manual(\b7 +\b4)!' style = panel_message_goal
    ClearExceptionGroup TR_TrickChecker
    SetException Ex = SkaterExitCombo scr = TR_TrickChecker_Restart group = TR_TrickChecker
    SetException Ex = SkaterEnterRevert scr = TR_TrickChecker_InRevert group = TR_TrickChecker
    Block
endscript


script TR_TrickChecker_InRevert 
    ClearExceptionGroup TR_TrickChecker
    SetException Ex = SkaterExitCombo scr = TR_TrickChecker_Restart group = TR_TrickChecker
    SetException Ex = SkaterEnterManual scr = TR_TrickChecker_InManual group = TR_TrickChecker
    Block
endscript


script TR_TrickChecker_InManual 
    create_panel_block id = current_goal text = 'OK!  Now land the combo!' style = panel_message_goal
    ClearExceptionGroup TR_TrickChecker
    SetException Ex = SkaterBailed scr = TR_TrickChecker_Restart group = TR_TrickChecker
    SetException Ex = SkaterLanded scr = TR_TrickChecker_Win group = TR_TrickChecker
    Block
endscript


script TR_TrickChecker_Win 
    ClearExceptionGroup TR_TrickChecker
    GoalManager_SetGoalFlag name = tr_goal_gaps26 got_1 1
endscript


script TR_TrickChecker_Restart 
    create_panel_block id = current_goal text = 'Crap!  You didn\'t quite pull it off.  Try again!' style = panel_message_goal
    goto TR_TrickChecker_GoalStart
endscript


script TR_ADDGOAL_RevertManual_success 
    KillSpawnedScript name = TR_TrickChecker_GoalStart
endscript


script TR_ADDGOAL_RevertManual_Deactivate 
    KillSpawnedScript name = TR_TrickChecker_GoalStart
endscript


script TR_ADDGOAL_AcidDrop 
    AddGoal_Gaps {
        version = 22
        start_cam_anims = [
            {
                virtual_cam
                TargetID = world
                targetOffset = (8097.60009765625, -1314.5999755859375, -841.0999755859375)
                positionOffset = (-1812.5, -103.0999984741211, -1408.5)
                frames = 100
                cam_anim_text = Vallely_tr_goal_gaps22_camanim01
                skippable = 1
                Play_hold
            }
            {
                virtual_cam
                TargetID = world
                targetOffset = (-7760.2001953125, -5237.7998046875, 2976.5)
                positionOffset = (-674.2999877929688, 78.9000015258789, -1662.5)
                frames = 100
                cam_anim_text = ''
                skippable = 1
                Play_hold
            }
        ]
        intro_node = TRG_G_GAP22_RESTARTNODE
        goal_text = 'Skate to the edge then jump and Acid drop (\ml) and you will Acid drop into the pool.'
        view_goals_text = 'Off board - Acid Drop'
        goal_description = Vallely_tr_goal_gaps22
        skater = custom
        reward_goal = tr_goal_gaps16
        unlimited_time = 1
        goal_flags = [ got_1
         ]
        goal_intro_script = TR_ADDGOAL_AcidDrop_Intro
        goal_start_script = TR_ADDGOAL_AcidDrop_Start
        goal_success_script = TR_ADDGOAL_AcidDrop_success
        goal_deactivate_script = TR_ADDGOAL_AcidDrop_Deactivate
        pro = 'Vallely'
        full_name = 'Mike Vallely'
    }
endscript


script TR_ADDGOAL_AcidDrop_Intro 
    SpawnScript TR_ADDGOAL_AcidDrop_Flash params = { ObjName = g_bowl }
    Create name = TRGP_AcidDrop
endscript


script TR_ADDGOAL_AcidDrop_Flash 
    begin 
    setobjectcolor name = <ObjName> color = 10506320
    wait 10 frames
    setobjectcolor name = <ObjName> color = 9195600
    wait 10 frames
    setobjectcolor name = <ObjName> color = 7884880
    wait 10 frames
    setobjectcolor name = <ObjName> color = 6574160
    wait 10 frames
    setobjectcolor name = <ObjName> color = 5263440
    wait 10 frames
    setobjectcolor name = <ObjName> color = 6574160
    wait 10 frames
    setobjectcolor name = <ObjName> color = 7884880
    wait 10 frames
    setobjectcolor name = <ObjName> color = 9195600
    wait 10 frames
    repeat 
endscript


script TR_ADDGOAL_AcidDrop_Start 
endscript


script TR_AcidDrop_Kill 
    Sk3_KillSkater nodeName = TRG_G_GAP22_RESTARTNODE
endscript


script tr_addgoal_aciddrop_missed 
    if GoalManager_GoalIsActive name = TR_Goal_gaps22
        GetNumberOfTrickOccurrences TrickText = 'Acid Drop'
        printstruct <...> 
        if (<number_of_occurrences> = 0)
            TeleportSkaterToNode nodeName = TRG_G_GAP22_RESTARTNODE
            create_panel_block id = current_goal text = 'Skate to the edge then jump and Acid drop (\ml) into the pool.' style = panel_message_goal
        endif
    endif
endscript


script TR_ADDGOAL_AcidDrop01 
    if GoalManager_GoalIsActive name = TR_Goal_gaps22
        printf 'Start Gap'
        StartGap GapID = AcidDrop flags = [ PURE_AIR ] TrickText = 'Acid Drop' TrickScript = TR_ADDGOAL_AcidDropGot1
    endif
endscript


script TR_ADDGOAL_AcidDrop02 
    if GoalManager_GoalIsActive name = TR_Goal_gaps22
        printf 'End Gap'
        endgap GapID = AcidDrop
    endif
endscript


script TR_ADDGOAL_AcidDropGot1 
    if GoalManager_GoalIsActive name = TR_Goal_gaps22
        printf 'Got Gap'
        GoalManager_SetGoalFlag name = TR_Goal_gaps22 got_1 1
    endif
endscript


script TR_ADDGOAL_AcidDrop_success 
    KillSpawnedScript name = TR_ADDGOAL_AcidDrop_Flash
    SetObjectColor_CurrentTOD name = g_bowl
    Create prefix = 'TRG_MikeSkate_'
    Kill name = TRGP_AcidDrop
    if ScreenElementExists id = panel_message_goal
        DestroyScreenElement id = panel_message_goal
    endif
endscript


script TR_ADDGOAL_AcidDrop_Deactivate 
    KillSpawnedScript name = TR_ADDGOAL_AcidDrop_Flash
    SetObjectColor_CurrentTOD name = g_bowl
    Kill name = TRGP_AcidDrop
    if ScreenElementExists id = panel_message_goal
        DestroyScreenElement id = panel_message_goal
    endif
endscript


script TR_ADDGOAL_Graf 
    AddGoal_Gaps {
        version = 21
        start_cam_anims = [
            {
                virtual_cam
                TargetID = world
                targetOffset = (-2966.10009765625, -1787.5, -13090.900390625)
                positionOffset = (-2304.800048828125, -680.0999755859375, -3174.39990234375)
                frames = 100
                cam_anim_text = Muska_tr_goal_gaps21_camanim01
                skippable = 1
                Play_hold
            }
            {
                virtual_cam
                TargetID = world
                targetOffset = (-12394.900390625, -5029.5, -3022.60009765625)
                positionOffset = (-3495.89990234375, -474.1000061035156, -3258.800048828125)
                frames = 100
                cam_anim_text = ''
                skippable = 1
                Play_hold
            }
        ]
        intro_node = TRG_G_GAP21_RESTARTNODE
        goal_text = 'Walk up to the blank posters and Tag (\b0) to make the poster pretty.'
        view_goals_text = 'New School - Tag the place'
        goal_description = Muska_tr_goal_gaps21
        skater = custom
        unlocked_by_another
        unlimited_time = 1
        goal_flags = [got_1
            got_2
            got_3
            got_4
            got_5
        ]
        goal_intro_script = TR_ADDGOAL_Graf_Intro
        goal_start_script = TR_ADDGOAL_Graf_Start
        goal_success_script = TR_ADDGOAL_Graf_success
        goal_deactivate_script = TR_ADDGOAL_Graf_Deactivate
        use_hud_counter
        hud_counter_caption = 'Tagged Spots'
        pro = 'Muska'
        full_name = 'Chad Muska'
        child = TR_Goal_gaps28
    }
endscript


script TR_ADDGOAL_Graf_Intro 
    SpawnScript TR_ADDGOAL_Graf_Flash params = { ObjName = g_wareNew_graf01 }
    SpawnScript TR_ADDGOAL_Graf_Flash params = { ObjName = g_wareNew_graf02 }
    SpawnScript TR_ADDGOAL_Graf_Flash params = { ObjName = g_wareNew_graf03 }
    SpawnScript TR_ADDGOAL_Graf_Flash params = { ObjName = g_wareNew_graf04 }
    SpawnScript TR_ADDGOAL_Graf_Flash params = { ObjName = g_wareNew_graf05 }
endscript


script TR_ADDGOAL_Graf_Flash 
    begin 
    setobjectcolor name = <ObjName> color = 10506320
    wait 10 frames
    setobjectcolor name = <ObjName> color = 9195600
    wait 10 frames
    setobjectcolor name = <ObjName> color = 7884880
    wait 10 frames
    setobjectcolor name = <ObjName> color = 6574160
    wait 10 frames
    setobjectcolor name = <ObjName> color = 5263440
    wait 10 frames
    setobjectcolor name = <ObjName> color = 6574160
    wait 10 frames
    setobjectcolor name = <ObjName> color = 7884880
    wait 10 frames
    setobjectcolor name = <ObjName> color = 9195600
    wait 10 frames
    repeat 
endscript


script TR_ADDGOAL_Graf_Start 
endscript


script TR_ADDGOAL_GrafGap01 
    printf 'Got ============1'
    if GoalManager_GoalIsActive name = tr_goal_gaps21
        GetTriggerArray graffiti onto
        if triggertype <trigger_array>
            printf 'Tag 1'
            GetGap gapscript = TR_ADDGOAL_GrafGot_1
        endif
    endif
endscript


script TR_ADDGOAL_GrafGap02 
    printf 'Got ============2'
    if GoalManager_GoalIsActive name = tr_goal_gaps21
        GetTriggerArray graffiti onto
        if triggertype <trigger_array>
            printf 'Tag 2'
            GetGap gapscript = TR_ADDGOAL_GrafGot_2
        endif
    endif
endscript


script TR_ADDGOAL_GrafGap03 
    printf 'Got ============3'
    if GoalManager_GoalIsActive name = tr_goal_gaps21
        GetTriggerArray graffiti onto
        if triggertype <trigger_array>
            printf 'Tag 3'
            GetGap gapscript = TR_ADDGOAL_GrafGot_3
        endif
    endif
endscript


script TR_ADDGOAL_GrafGap04 
    printf 'Got ============4'
    if GoalManager_GoalIsActive name = tr_goal_gaps21
        GetTriggerArray graffiti onto
        if triggertype <trigger_array>
            printf 'Tag 4'
            GetGap gapscript = TR_ADDGOAL_GrafGot_4
        endif
    endif
endscript


script TR_ADDGOAL_GrafGap05 
    printf 'Got ============5'
    if GoalManager_GoalIsActive name = tr_goal_gaps21
        GetTriggerArray graffiti onto
        if triggertype <trigger_array>
            printf 'Tag 5'
            GetGap gapscript = TR_ADDGOAL_GrafGot_5
        endif
    endif
endscript


script TR_ADDGOAL_GrafGot_1 
    if GoalManager_GoalIsActive name = tr_goal_gaps21
        GoalManager_SetGoalFlag name = tr_goal_gaps21 got_1 1
    endif
endscript


script TR_ADDGOAL_GrafGot_2 
    if GoalManager_GoalIsActive name = tr_goal_gaps21
        GoalManager_SetGoalFlag name = tr_goal_gaps21 got_2 1
    endif
endscript


script TR_ADDGOAL_GrafGot_3 
    if GoalManager_GoalIsActive name = tr_goal_gaps21
        GoalManager_SetGoalFlag name = tr_goal_gaps21 got_3 1
    endif
endscript


script TR_ADDGOAL_GrafGot_4 
    if GoalManager_GoalIsActive name = tr_goal_gaps21
        GoalManager_SetGoalFlag name = tr_goal_gaps21 got_4 1
    endif
endscript


script TR_ADDGOAL_GrafGot_5 
    if GoalManager_GoalIsActive name = tr_goal_gaps21
        GoalManager_SetGoalFlag name = tr_goal_gaps21 got_5 1
    endif
endscript


script TR_ADDGOAL_Graf_success 
    KillSpawnedScript name = TR_ADDGOAL_Graf_Flash
    SetObjectColor_CurrentTOD name = g_wareNew_graf01
    SetObjectColor_CurrentTOD name = g_wareNew_graf02
    SetObjectColor_CurrentTOD name = g_wareNew_graf03
    SetObjectColor_CurrentTOD name = g_wareNew_graf04
    SetObjectColor_CurrentTOD name = g_wareNew_graf05
endscript


script TR_ADDGOAL_Graf_Deactivate 
    KillSpawnedScript name = TR_ADDGOAL_Graf_Flash
    SetObjectColor_CurrentTOD name = g_wareNew_graf01
    SetObjectColor_CurrentTOD name = g_wareNew_graf02
    SetObjectColor_CurrentTOD name = g_wareNew_graf03
    SetObjectColor_CurrentTOD name = g_wareNew_graf04
    SetObjectColor_CurrentTOD name = g_wareNew_graf05
endscript


script TR_AddGoal_TimedScoreRun 
    AddGoal_TimedScoreRun {
        view_goals_text = 'New School - Arcade machine high score'
        goal_text = 'Arcade machine high score'
        goal_description = 'Set the high score.'
        time = 60
        skater = custom
        dont_kill_trigger_on_success
        trigger_obj_id = TRG_Arcade_Machine
        pro = 'Arcade machine'
        trigger_wait_script = NullScript
        trigger_start_script = arcade_machine_start_goal
        trigger_success_script = NullScript
        restart_node = TRG_Restart_HighScore
        unlocked_by_another
    }
endscript


script TR_TonyTalk 
    Obj_ClearExceptions
    setup_ped_speech {ped_id = TRG_Tony_Advance
        accept_text = 'Press \m5 to Talk to Tony.'
        activation_script = TR_Exit_level_TR
    }
    Ped_InitAI stand Cop_Ticketing
endscript


script TR_Exit_level_TR 
    TR_1_MoveOnDialog
endscript


script TR_ADDGOAL_BackFlip 
    AddGoal_Gaps {
        version = 23
        start_cam_anims = [
            {
                virtual_cam
                TargetID = world
                targetOffset = (-3538.39990234375, -757.7000122070312, -13557.400390625)
                positionOffset = (-3051.60009765625, -669.0999755859375, -3569.60009765625)
                frames = 100
                cam_anim_text = ''
                skippable = 1
                Play_hold
            }
        ]
        intro_node = TRG_G_GAP23_RESTARTNODE
        goal_text = 'Back flip\n(hold \b2 then press \b4 + \b4)'
        view_goals_text = 'New School - Do a Backflip'
        goal_description = Margera_tr_goal_gaps23
        skater = custom
        unlimited_time = 1
        goal_flags = [ got_1
         ]
        goal_intro_script = TR_ADDGOAL_BackFlip_Intro
        goal_start_script = TR_ADDGOAL_BackFlip_Start
        goal_success_script = TR_ADDGOAL_BackFlip_success
        goal_deactivate_script = TR_ADDGOAL_BackFlip_Deactivate
        reset_score
        pro = 'Margera'
        full_name = 'Bam Margera'
        child = TR_Goal_gaps24
    }
endscript


script TR_ADDGOAL_BackFlip_Intro 
endscript


script TR_ADDGOAL_BackFlip_Start 
    SpawnScript TR_ADDGOAL_BackFlipChecker
endscript


script TR_ADDGOAL_BackFlipChecker 
    ClearExceptionGroup TR_Goal_Gaps23
    printf 'Backfilp_Checker'
    SetException Ex = SkaterEnterAir scr = TR_ADDGOAL_BackFlipChecker_Air group = TR_Goal_Gaps23
    Block
endscript


script TR_ADDGOAL_BackFlipChecker_Air 
    ClearExceptionGroup TR_Goal_Gaps23
    printf 'Backfilp_Checker Air'
    begin 
    wait 1 frame
    GetNumberOfTrickOccurrences TrickText = 'BackFlip'
    printstruct <...> 
    if (<number_of_occurrences> > 0)
        SetException Ex = SkaterBailed scr = TR_ADDGOAL_BackFlipChecker group = TR_Goal_Gaps23
        SetException Ex = SkaterLanded scr = TR_ADDGOAL_BackFlipChecker_Land group = TR_Goal_Gaps23
    endif
    repeat 
endscript


script TR_ADDGOAL_BackFlipChecker_Land 
    ClearExceptionGroup TR_Goal_Gaps23
    printf 'Backfilp_Checker Land'
    if GoalManager_GoalIsActive name = TR_Goal_Gaps23
        GoalManager_SetGoalFlag name = TR_Goal_Gaps23 got_1 1
    endif
endscript


script TR_ADDGOAL_BackFlip_success 
    ClearExceptionGroup TR_Goal_Gaps23
    KillSpawnedScript name = TR_ADDGOAL_BackFlip_Checker
endscript


script TR_ADDGOAL_BackFlip_Deactivate 
    ClearExceptionGroup TR_Goal_Gaps23
    KillSpawnedScript name = TR_ADDGOAL_BackFlip_Checker
endscript


script TR_ADDGOAL_Roll 
    AddGoal_Gaps {
        version = 24
        start_cam_anims = [
            {
                virtual_cam
                TargetID = world
                targetOffset = (-3538.39990234375, -757.7000122070312, -13557.400390625)
                positionOffset = (-3051.60009765625, -669.0999755859375, -3569.60009765625)
                frames = 100
                cam_anim_text = ''
                skippable = 1
                Play_hold
            }
        ]
        intro_node = TRG_G_GAP24_RESTARTNODE
        goal_text = 'Roll\n(hold \b2 then press \b5 + \b5'
        view_goals_text = 'New School - Do a Roll'
        goal_description = Margera_tr_goal_gaps24
        skater = custom
        reset_score
        unlimited_time = 1
        goal_flags = [ got_1
         ]
        goal_intro_script = TR_ADDGOAL_FrontFlip_Intro
        goal_start_script = TR_ADDGOAL_FrontFlip_Start
        goal_success_script = TR_ADDGOAL_FrontFlip_success
        goal_deactivate_script = TR_ADDGOAL_FrontFlip_Deactivate
        reward_goal = TR_Goal_Counter8
        pro = 'Margera'
        full_name = 'Bam Margera'
    }
endscript


script TR_ADDGOAL_FrontFlip_Intro 
endscript


script TR_ADDGOAL_FrontFlip_Start 
    SpawnScript TR_ADDGOAL_FrontFlipChecker
endscript


script TR_ADDGOAL_FrontFlipChecker 
    ClearExceptionGroup TR_Goal_gaps24
    printf 'Frontfilp_Checker'
    SetException Ex = SkaterEnterAir scr = TR_ADDGOAL_FrontFlipChecker_Air group = TR_Goal_gaps24
    Block
endscript


script TR_ADDGOAL_FrontFlipChecker_Air 
    ClearExceptionGroup TR_Goal_gaps24
    printf 'Frontfilp_Checker Air'
    begin 
    wait 1 frame
    GetNumberOfTrickOccurrences TrickText = 'FS Roll'
    printstruct <...> 
    if (<number_of_occurrences> > 0)
        SetException Ex = SkaterBailed scr = TR_ADDGOAL_FrontFlipChecker group = TR_Goal_gaps24
        SetException Ex = SkaterLanded scr = TR_ADDGOAL_FrontFlipChecker_Land group = TR_Goal_gaps24
    else
        GetNumberOfTrickOccurrences TrickText = 'BS Roll'
        printstruct <...> 
        if (<number_of_occurrences> > 0)
            SetException Ex = SkaterBailed scr = TR_ADDGOAL_FrontFlipChecker group = TR_Goal_gaps24
            SetException Ex = SkaterLanded scr = TR_ADDGOAL_FrontFlipChecker_Land group = TR_Goal_gaps24
        endif
    endif
    repeat 
endscript


script TR_ADDGOAL_FrontFlipChecker_Land 
    ClearExceptionGroup TR_Goal_gaps24
    printf 'Frontfilp_Checker Land'
    if GoalManager_GoalIsActive name = TR_Goal_gaps24
        GoalManager_SetGoalFlag name = TR_Goal_gaps24 got_1 1
    endif
endscript


script TR_ADDGOAL_FrontFlip_success 
    ClearExceptionGroup TR_Goal_gaps24
    KillSpawnedScript name = TR_ADDGOAL_FrontFlip_Checker
    Create prefix = 'TRG_BobSkate_'
endscript


script TR_ADDGOAL_FrontFlip_Deactivate 
    ClearExceptionGroup TR_Goal_gaps24
    KillSpawnedScript name = TR_ADDGOAL_FrontFlip_Checker
endscript


script TR_ADDGOAL_VertWallPlant 
    AddGoal_Counter {
        version = 8
        start_cam_anims = [
            {
                virtual_cam
                TargetID = world
                targetOffset = (7348.7001953125, -48.400001525878906, -3853.300048828125)
                positionOffset = (-2273.0, -675.9000244140625, -1201.800048828125)
                frames = 100
                cam_anim_text = ''
                skippable = 1
                Play_hold = 1}
        ]
        intro_node = TRG_G_Counter8_RESTARTNODE
        goal_text = 'Vert WallPlant (\b3) on the flat wall.'
        view_goals_text = 'New School - Vert WallPlant session'
        goal_description = Burnquist_tr_goal_counter8
        skater = custom
        unlocked_by_another
        reward_goal = tr_goal_gaps26
        number = 3
        goal_intro_script = TR_ADDGOAL_VertWallPlant_intro
        goal_start_script = TR_ADDGOAL_VertWallPlant_start
        goal_success_script = TR_ADDGOAL_VertWallPlant_success
        goal_deactivate_script = TR_ADDGOAL_VertWallPlant_Deactivate
        pro = 'Burnquist'
        full_name = 'Bob Burnquist'
        use_hud_counter
        hud_counter_caption = 'Vert WallPlants'
    }
endscript


script TR_ADDGOAL_VertWallPlant_intro 
endscript


script TR_ADDGOAL_VertWallPlant_start 
    SpawnScript TR_ADDGOAL_VertWallPlant_Air
endscript


script TR_ADDGOAL_VertWallPlant_Air 
    SetException Ex = SkaterEnterAir scr = TR_ADDGOAL_VertWallPlant_PlantChecker group = TR_Goal_Counter8
    Block
endscript


script TR_ADDGOAL_VertWallPlant_PlantChecker 
    ClearExceptionGroup TR_Goal_Counter8
    printf 'MelonChecker Air'
    begin 
    wait 1 frame
    GetNumberOfTrickOccurrences TrickText = 'Vert WallPlant'
    printstruct <...> 
    if (<number_of_occurrences> > 0)
        SetException Ex = SkaterLanded scr = TR_ADDGOAL_VertWallPlant_PlantChecker_Land group = TR_Goal_Counter8
    endif
    repeat 
endscript


script TR_ADDGOAL_VertWallPlant_PlantChecker_Land 
    ClearExceptionGroup TR_Goal_Counter8
    if GoalManager_GoalIsActive name = TR_Goal_Counter8
        GoalManager_GotCounterObject name = TR_Goal_Counter8
        goto TR_ADDGOAL_VertWallPlant_Air
    endif
endscript


script TR_ADDGOAL_VertWallPlant_success 
    KillSpawnedScript name = TR_ADDGOAL_VertWallPlant_Air
endscript


script TR_ADDGOAL_VertWallPlant_Deactivate 
    KillSpawnedScript name = TR_ADDGOAL_VertWallPlant_Air
endscript


script TR_ADDGOAL_Focus 
    AddGoal_Gaps {
        version = 27
        start_cam_anims = [
            {
                virtual_cam
                TargetID = world
                targetOffset = (10144.7001953125, -244.39999389648438, -225.8000030517578)
                positionOffset = (145.89999389648438, -194.5, -365.70001220703125)
                frames = 100
                cam_anim_text = Hawk_tr_goal_gaps27
                skippable = 1
                Play_hold
            }
        ]
        intro_node = TRG_G_Gap27_Restartnode
        goal_text = 'Get Special.'
        view_goals_text = 'New School - Keep the Focus'
        goal_description = Hawk_tr_goal_gaps27
        skater = custom
        reset_score
        unlimited_time = 1
        goal_flags = [ got_1
         ]
        goal_intro_script = TR_ADDGOAL_Focus_Intro
        goal_start_script = TR_ADDGOAL_Focus_Start
        goal_success_script = TR_ADDGOAL_Focus_success
        goal_deactivate_script = TR_ADDGOAL_Focus_Deactivate
        pro = 'Hawk'
        full_name = 'Tony Hawk'
    }
endscript


script TR_ADDGOAL_Focus_Intro 
endscript


script TR_ADDGOAL_Focus_Start 
    ClearExceptionGroup TR_Goal_Gaps27
    create_panel_block id = current_goal text = 'Get Special' style = panel_message_goal
    printf 'Waiting for Special'
    SetException Ex = SkaterEnterSpecial scr = TR_ADDGOAL_Focus_Got1 group TR_Goal_Gaps27
    Block
endscript


script TR_ADDGOAL_Focus_Got1 
    printf 'Got 1'
    ClearExceptionGroup TR_Goal_Gaps27
    if GoalManager_GoalIsActive name = TR_Goal_Gaps27
        printf 'goal flag 1 set'
        if GetFlag flag = FLAG_FOCUS
            printf 'Going to focus checker'
        else
            printf 'SetTags and going to focus checker'
            skater ::settags InFocus = 6
        endif
        goto TR_ADDGOAL_Focus_Checker
    endif
endscript


script TR_ADDGOAL_Focus_Checker 
    printf 'in Focus checker'
    ClearExceptionGroup TR_Goal_Gaps27
    create_panel_block id = current_goal text = 'Now get Focus (\mq)' style = panel_message_goal
    SetException Ex = SkaterEnterFocus scr = TR_ADDGOAL_Focus_counter group TR_Goal_Gaps27
    SetException Ex = SkaterExitSpecial scr = TR_ADDGOAL_Focus_Start group TR_Goal_Gaps27
    SetException Ex = SkaterEnterBail scr = TR_ADDGOAL_Focus_Start group TR_Goal_Gaps27
    Block
endscript


script TR_ADDGOAL_Focus_counter 
    SetFlag flag = FLAG_FOCUS
    create_panel_block id = current_goal text = 'Stay Focused' style = panel_message_goal
    ClearExceptionGroup TR_Goal_Gaps27
    SetException Ex = SkaterExitFocus scr = TR_ADDGOAL_Focus_Checker group TR_Goal_Gaps27
    SetException Ex = SkaterExitSpecial scr = TR_ADDGOAL_Focus_Start group TR_Goal_Gaps27
    SetException Ex = SkaterEnterBail scr = TR_ADDGOAL_Focus_Start group TR_Goal_Gaps27
    begin 
    skater ::gettags
    printstruct <...> 
    InFocus = (<InFocus> - 1)
    if (<InFocus> < 1)
        if GoalManager_GoalIsActive name = TR_Goal_Gaps27
            ClearExceptionGroup TR_Goal_Gaps27
            create_panel_block id = current_goal text = 'Now land it' style = panel_message_goal
            SetException Ex = SkaterLanded scr = TR_ADDGOAL_Focus_Got2 group TR_Goal_Gaps27
            SetException Ex = SkaterEnterBail scr = TR_ADDGOAL_Focus_Start group TR_Goal_Gaps27
            Block
        endif
    else
        FormatText textname = InFocusTime '%a seconds left' a = <InFocus>
        create_panel_block id = current_goal text = <InFocusTime> style = panel_message_goal
        skater ::settags InFocus = <InFocus>
    endif
    wait 1 second
    repeat 
endscript


script TR_ADDGOAL_Focus_Got2 
    ClearExceptionGroup TR_Goal_Gaps27
    if GoalManager_GoalIsActive name = TR_Goal_Gaps27
        GoalManager_SetGoalFlag name = TR_Goal_Gaps27 got_1 1
    endif
endscript


script TR_ADDGOAL_Focus_success 
    ClearExceptionGroup TR_Goal_Gaps27
    TR_1_MoveOnDialog
    Create name = TRG_Tony_Advance
    TODManager_SetTempBloomParams on = 0
endscript


script TR_ADDGOAL_Focus_Deactivate 
    ClearExceptionGroup TR_Goal_Gaps27
    TODManager_SetTempBloomParams on = 0
endscript

FLAG_FOCUS = 2

script TR_ADDGOAL_GrafHang 
    AddGoal_Gaps {
        version = 28
        start_cam_anims = [
            {
                virtual_cam
                TargetID = world
                targetOffset = (7284.5, 738.4000244140625, -2001.9000244140625)
                positionOffset = (-2619.10009765625, -620.4000244140625, -1733.0)
                frames = 100
                cam_anim_text = ''
                skippable = 1
                Play_hold
            }
        ]
        intro_node = TRG_G_GAP28_RESTARTNODE
        goal_text = 'Tag (\b0) over the hanging poster'
        view_goals_text = 'New School - Hang\'n Tag'
        goal_description = Muska_tr_goal_gaps28
        skater = custom
        unlimited_time = 1
        goal_flags = [ got_1
         ]
        goal_intro_script = TR_ADDGOAL_GrafHang_Intro
        goal_start_script = TR_ADDGOAL_GrafHang_Start
        goal_success_script = TR_ADDGOAL_GrafHang_success
        goal_deactivate_script = TR_ADDGOAL_GrafHang_Deactivate
        reward_goal = TR_Goal_Gaps29
        pro = 'Muska'
        full_name = 'Chad Muska'
    }
endscript


script TR_ADDGOAL_GrafHang_Intro 
    SpawnScript TR_ADDGOAL_GrafHang_Flash params = { ObjName = g_g_warenew_island }
    SpawnScript TR_ADDGOAL_GrafHang_Flash params = { ObjName = g_WareNew_Main_poster }
    SpawnScript TR_ADDGOAL_GrafHang_Flash params = { ObjName = g_WareNew_shelves03 }
    SpawnScript TR_ADDGOAL_GrafHang_Flash params = { ObjName = g_WareNew_MainLadder }
endscript


script TR_ADDGOAL_GrafHang_Flash 
    begin 
    setobjectcolor name = <ObjName> color = 10506320
    wait 10 frames
    setobjectcolor name = <ObjName> color = 9195600
    wait 10 frames
    setobjectcolor name = <ObjName> color = 7884880
    wait 10 frames
    setobjectcolor name = <ObjName> color = 6574160
    wait 10 frames
    setobjectcolor name = <ObjName> color = 5263440
    wait 10 frames
    setobjectcolor name = <ObjName> color = 6574160
    wait 10 frames
    setobjectcolor name = <ObjName> color = 7884880
    wait 10 frames
    setobjectcolor name = <ObjName> color = 9195600
    wait 10 frames
    repeat 
endscript


script TR_ADDGOAL_GrafHang_Start 
endscript


script TR_ADDGOAL_GrafHangGap01 
    printf 'Got ============1'
    if GoalManager_GoalIsActive name = TR_Goal_gaps28
        GetTriggerArray graffiti onto
        if triggertype <trigger_array>
            printf 'Tag 1'
            GetGap gapscript = TR_ADDGOAL_GrafHangGot_1
        endif
    endif
endscript


script TR_ADDGOAL_GrafHangGot_1 
    if GoalManager_GoalIsActive name = TR_Goal_gaps28
        Create name = g_WareNew_Main_poster_layer01
        GoalManager_SetGoalFlag name = TR_Goal_gaps28 got_1 1
    endif
endscript


script TR_ADDGOAL_GrafHang_success 
    KillSpawnedScript name = TR_ADDGOAL_GrafHang_Flash
    SetObjectColor_CurrentTOD name = g_g_warenew_island
    SetObjectColor_CurrentTOD name = g_WareNew_Main_poster
    skater ::disableplayerinput AllowCameraControl
    wait 1 second
    KillAllTextureSplats box = {height = 10 dist = 40 width = 10 Offset = (-146.0, -18.0, -134.0)}
endscript


script TR_ADDGOAL_GrafHang_Deactivate 
    KillSpawnedScript name = TR_ADDGOAL_GrafHang_Flash
    SetObjectColor_CurrentTOD name = g_g_warenew_island
    SetObjectColor_CurrentTOD name = g_WareNew_shelves03
    SetObjectColor_CurrentTOD name = g_WareNew_Main_poster
    SetObjectColor_CurrentTOD name = g_WareNew_MainLadder
endscript


script TR_ADDGOAL_Skitchin 
    AddGoal_Gaps {
        version = 29
        start_cam_anims = [
            {
                virtual_cam
                TargetID = world
                targetOffset = (8582.099609375, -2061.699951171875, -3395.699951171875)
                positionOffset = (-1251.699951171875, -684.5, -2213.5)
                frames = 100
                cam_anim_text = ''
                skippable = 1
                Play_hold
            }
        ]
        intro_node = TRG_G_Gap29_RESTARTNODE
        goal_text = 'Skitch (\b7) the forklift for 10 seconds.'
        view_goals_text = 'Novice - Skitch the forklift'
        goal_description = Muska_tr_goal_gaps29
        skater = custom
        unlocked_by_another
        unlimited_time = 1
        goal_flags = [ got_1
         ]
        goal_intro_script = TR_ADDGOAL_Skitchin_Intro
        goal_start_script = TR_ADDGOAL_Skitchin_Start
        goal_success_script = TR_ADDGOAL_Skitchin_success
        goal_deactivate_script = TR_ADDGOAL_Skitchin_Deactivate
        pro = 'Muska'
        full_name = 'Chad Muska'
    }
endscript


script TR_ADDGOAL_Skitchin_Intro 
    Create prefix = 'TRG_SkitchWaypoint'
    Create name = TRG_SkitchATV
    Create name = TRG_SkitchATVDriver
endscript


script TR_SkitchDriver 
    obj_locktoobject objectname = TRG_SkitchATV (0.0, 0.0, 55.0)
    PlayAnim anim = Ped_Driver_Forklift Cycle
endscript


script TR_ADDGOAL_Skitchin_Start 
    wait 1 frame
    TRG_SkitchATV ::obj_followpath name = TRG_SkitchWaypoint18
    TRG_SkitchATV ::obj_setpathvelocity 0 fps
    TRG_SkitchATV ::obj_setpathacceleration 20 fps
    TRG_SkitchATV ::obj_setpathdeceleration 30 fps
    TRG_SkitchATV ::obj_sticktoground DisAbove = 3 distbelow = 6
    skater ::settags ATVSkitchTimeLeft = 11
    skater ::StartGap GapID = Skitchin flags = []
    ClearExceptionGroup TR_Goal_Gaps29
    WaitForEvent type = SkaterEnterSkitch
    goto TR_ADDGOAL_Skitchin_InSkitch
endscript


script TR_ADDGOAL_Skitchin_InSkitch 
    create_panel_block id = current_goal text = 'Hold on!' style = panel_message_goal
    TRG_SkitchATV ::obj_setpathvelocity 80 fps
    ClearExceptionGroup TR_Goal_Gaps29
    SetException Ex = SkaterExitSkitch scr = TR_ADDGOAL_Skitchin_OutOfSkitch group TR_Goal_Gaps29
    begin 
    skater ::gettags
    printstruct <...> 
    ATVSkitchTimeLeft = (<ATVSkitchTimeLeft> - 1)
    if (<ATVSkitchTimeLeft> < 1)
        skater ::endgap GapID = Skitchin gapscript = TR_ADDGOAL_Skitchin_Wim
        return 
    endif
    FormatText textname = ATVSkitchTime '%a seconds left' a = <ATVSkitchTimeLeft>
    create_panel_block id = current_goal text = <ATVSkitchTime> style = panel_message_goal
    skater ::settags ATVSkitchTimeLeft = <ATVSkitchTimeLeft>
    wait 1 second
    repeat 
endscript


script TR_ADDGOAL_Skitchin_OutOfSkitch 
    create_panel_block id = current_goal text = 'Get that Forklift' style = panel_message_goal
    TRG_SkitchATV ::obj_setpathvelocity 15 fps
    ClearExceptionGroup TR_Goal_Gaps29
    WaitForEvent type = SkaterEnterSkitch
    goto TR_ADDGOAL_Skitchin_InSkitch
endscript


script TR_ADDGOAL_Skitchin_Wim 
    GoalManager_SetGoalFlag name = TR_Goal_Gaps29 got_1 1
endscript


script TR_ADDGOAL_Skitchin_success 
    Kill prefix = 'TRG_SkitchWaypoint'
    Kill name = TRG_SkitchATV
    Kill name = TRG_SkitchATVDriver
    Create prefix = 'TRG_MuskaSkate_'
endscript


script TR_ADDGOAL_Skitchin_Deactivate 
    Kill prefix = 'TRG_SkitchWaypoint'
    Kill name = TRG_SkitchATV
    Kill name = TRG_SkitchATVDriver
endscript


script TR_BigRail01 
    StartGap GapID = TR_GrindGapA flags = [ PURE_RAIL ]
    endgap GapID = TR_GrindGapB text = 'Big Rail' Score = 200
endscript


script TR_BigRail02 
    StartGap GapID = TR_GrindGapB flags = [ PURE_RAIL ]
    endgap GapID = TR_GrindGapA text = 'Big Rail' Score = 200
endscript


script TR_DryWallBreak01 
    if GoalManager_HasWonGoal name = tr_goal_counter5
        GetTriggerArray through
        if triggertype <trigger_array>
            printf 'Break Wall============'
            SpawnScript TR_SFX_BreakDryWall
            Shatter {name = g_g_wareNew_Funbox01_door01
                area = 2000
                texture_swap = tb_wh_drywall_pieces_01
                variance = 1.0
                spread = 1.0
                life = 6
                Bounce = 1
                Scale = 1.0
                vel_x = 30
                vel_y = 30
                vel_z = 30
            }
            Kill name = g_g_wareNew_Funbox01_door01
            Create name = TB_WH_Drywall_Dust_00_Start
            Create prefix = 'TR_Ware_2X4_01_'
            TR_Ware_2X4_01_01 ::rigidbody_kick vel = (0.0, 1.0, -5.0) rotvel = (1.0, 1.0, 1.0)
            TR_Ware_2X4_01_02 ::rigidbody_kick vel = (0.0, 1.0, -5.0) rotvel = (1.0, 1.0, 1.0)
            TR_Ware_2X4_01_03 ::rigidbody_kick vel = (0.0, 1.0, -5.0) rotvel = (1.0, 1.0, 1.0)
            TR_Ware_2X4_01_04 ::rigidbody_kick vel = (0.0, 1.0, -5.0) rotvel = (1.0, 1.0, 1.0)
            TR_Ware_2X4_01_05 ::rigidbody_kick vel = (0.0, 1.0, -5.0) rotvel = (1.0, 1.0, 1.0)
            TR_Ware_2X4_01_06 ::rigidbody_kick vel = (0.0, 1.0, -5.0) rotvel = (1.0, 1.0, 1.0)
            TR_Ware_2X4_01_07 ::rigidbody_kick vel = (0.0, 1.0, -5.0) rotvel = (1.0, 1.0, 1.0)
            TR_Ware_2X4_01_08 ::rigidbody_kick vel = (0.0, 1.0, -5.0) rotvel = (1.0, 1.0, 1.0)
            TR_Ware_2X4_01_09 ::rigidbody_kick vel = (0.0, 1.0, -5.0) rotvel = (1.0, 1.0, 1.0)
            Create prefix = 'TR_Ware_Dry_01_'
            TR_Ware_Dry_01_01 ::rigidbody_kick vel = (0.0, 1.0, -5.0) rotvel = (1.0, 1.0, 1.0)
            TR_Ware_Dry_01_02 ::rigidbody_kick vel = (0.0, 1.0, -5.0) rotvel = (1.0, 1.0, 1.0)
            TR_Ware_Dry_01_03 ::rigidbody_kick vel = (0.0, 1.0, -5.0) rotvel = (1.0, 1.0, 1.0)
            TR_Ware_Dry_01_04 ::rigidbody_kick vel = (0.0, 1.0, -5.0) rotvel = (1.0, 1.0, 1.0)
            TR_Ware_Dry_01_05 ::rigidbody_kick vel = (0.0, 1.0, -5.0) rotvel = (1.0, 1.0, 1.0)
            TR_Ware_Dry_01_06 ::rigidbody_kick vel = (0.0, 1.0, -5.0) rotvel = (1.0, 1.0, 1.0)
            TR_Ware_Dry_01_07 ::rigidbody_kick vel = (0.0, 1.0, -5.0) rotvel = (1.0, 1.0, 1.0)
            Create name = TB_WH_Drywall_Broke_01
            wait 2 seconds
            Kill name = TB_WH_Drywall_Dust_00_Start
        else
        endif
    endif
endscript


script TR_DryWallBreak02 
    if GoalManager_HasWonGoal name = tr_goal_counter5
        GetTriggerArray through
        if triggertype <trigger_array>
            printf 'Break Wall============'
            SpawnScript TR_SFX_BreakDryWall
            Shatter {name = g_g_wareNew_Funbox01_door02
                area = 2000
                texture_swap = tb_wh_drywall_pieces_01
                variance = 1.0
                spread = 1.0
                life = 6
                Bounce = 1
                Scale = 1.0
                vel_x = 30
                vel_y = 30
                vel_z = 30
            }
            Kill name = g_g_wareNew_Funbox01_door02
            Create name = TB_WH_Drywall_Dust_02_Start01
            Create prefix = 'TR_Ware_2X4_02_'
            TR_Ware_2X4_02_01 ::rigidbody_kick vel = (0.0, 1.0, -5.0) rotvel = (1.0, 1.0, 1.0)
            TR_Ware_2X4_02_02 ::rigidbody_kick vel = (0.0, 1.0, -5.0) rotvel = (1.0, 1.0, 1.0)
            TR_Ware_2X4_02_03 ::rigidbody_kick vel = (0.0, 1.0, -5.0) rotvel = (1.0, 1.0, 1.0)
            TR_Ware_2X4_02_04 ::rigidbody_kick vel = (0.0, 1.0, -5.0) rotvel = (1.0, 1.0, 1.0)
            TR_Ware_2X4_02_05 ::rigidbody_kick vel = (0.0, 1.0, -5.0) rotvel = (1.0, 1.0, 1.0)
            TR_Ware_2X4_02_10 ::rigidbody_kick vel = (0.0, 1.0, -5.0) rotvel = (1.0, 1.0, 1.0)
            TR_Ware_2X4_02_07 ::rigidbody_kick vel = (0.0, 1.0, -5.0) rotvel = (1.0, 1.0, 1.0)
            TR_Ware_2X4_02_08 ::rigidbody_kick vel = (0.0, 1.0, -5.0) rotvel = (1.0, 1.0, 1.0)
            TR_Ware_2X4_02_09 ::rigidbody_kick vel = (0.0, 1.0, -5.0) rotvel = (1.0, 1.0, 1.0)
            Create prefix = 'TR_Ware_Dry_02_'
            TR_Ware_Dry_02_01 ::rigidbody_kick vel = (0.0, 1.0, -5.0) rotvel = (1.0, 1.0, 1.0)
            TR_Ware_Dry_02_02 ::rigidbody_kick vel = (0.0, 1.0, -5.0) rotvel = (1.0, 1.0, 1.0)
            TR_Ware_Dry_02_03 ::rigidbody_kick vel = (0.0, 1.0, -5.0) rotvel = (1.0, 1.0, 1.0)
            TR_Ware_Dry_02_04 ::rigidbody_kick vel = (0.0, 1.0, -5.0) rotvel = (1.0, 1.0, 1.0)
            TR_Ware_Dry_02_05 ::rigidbody_kick vel = (0.0, 1.0, -5.0) rotvel = (1.0, 1.0, 1.0)
            TR_Ware_Dry_02_06 ::rigidbody_kick vel = (0.0, 1.0, -5.0) rotvel = (1.0, 1.0, 1.0)
            TR_Ware_Dry_02_07 ::rigidbody_kick vel = (0.0, 1.0, -5.0) rotvel = (1.0, 1.0, 1.0)
            Create name = TB_WH_Drywall_Broke_02
            wait 2 seconds
            Kill name = TB_WH_Drywall_Dust_02_Start01
        else
        endif
    endif
endscript


script TR_Glass_Shatter 
    SpawnScript TR_SFX_GlassShatter
    Shatter {name = <name>
        area = 2000
        texture_swap = ba_apm_brokenglass01
        variance = 1.0
        spread = 1.0
        life = 6
        Bounce = 1
        Scale = 1.0
        vel_x = 30
        vel_y = 30
        vel_z = 30
    }
    Kill name = <name>
endscript


script TR_Electrical_Smash 
    if NOT InNetGame
        GetTriggerArray wallplant onto
        if triggertype <trigger_array>
            Kill name = TB_Electrical_Upper_02
            Create name = TB_Electrical_Upper_02_destroyed
            Create name = ATM_SparkA01
            Create name = ATM_SmokeA01
            SpawnScript TR_SFX_Break_Switch
        endif
    endif
endscript


script TR_Lights_01 
    if NOT InNetGame
        if IsAlive name = Fluoresent_SparkA01_Start01a
        else
            Kill name = g_ware_light_01_glow_01a
            Kill name = g_ware_light_01_glow_01b
            Create name = g_ware_light_glow_01_flicker_01a
            Create name = g_ware_light_01_glow_flicker_01b
            Create name = Fluoresent_SparkA01_Start01a
            Create name = Fluoresent_SparkA01_Start01b
            Create name = g_ware_light_25_flicker01
            wait 10 seconds
            Kill name = g_ware_light_25_flicker01
            Kill name = g_ware_light_glow_01_flicker_01a
            Kill name = g_ware_light_01_glow_flicker_01b
        endif
    endif
endscript


script TR_Lights_02 
    if NOT InNetGame
        if IsAlive name = Fluoresent_SparkA01_Start02a
        else
            Kill name = g_ware_light_02_glow_02a
            Kill name = g_ware_light_02_glow_02b
            Create name = g_ware_light_glow_02_flicker_02a
            Create name = g_ware_light_glow_02_flicker_02b
            Create name = Fluoresent_SparkA01_Start02a
            Create name = Fluoresent_SparkA01_Start02b
            Create name = g_ware_light_25_flicker02
            wait 10 seconds
            Kill name = g_ware_light_25_flicker02
            Kill name = g_ware_light_glow_02_flicker_02a
            Kill name = g_ware_light_glow_02_flicker_02b
        endif
    endif
endscript


script TR_Lights_03 
    if NOT InNetGame
        if IsAlive name = Fluoresent_SparkA01_Start03a
        else
            Kill name = g_ware_light_03_glow_03a
            Kill name = g_ware_light_03_glow_03b
            Create name = g_ware_light_glow_03_flicker_03a
            Create name = g_ware_light_glow_03_flicker_03b
            Create name = Fluoresent_SparkA01_Start03a
            Create name = Fluoresent_SparkA01_Start03b
            Create name = g_ware_light_25_flicker03
            wait 10 seconds
            Kill name = g_ware_light_glow_03_flicker_03a
            Kill name = g_ware_light_glow_03_flicker_03b
            Kill name = g_ware_light_25_flicker03
        endif
    endif
endscript


script TR_Fan01 
    obj_rotx Speed = 250
endscript


script TR_RailJump01 
    StartGap GapID = RailJump flags = [ PURE_AIR ]
endscript


script TR_RailJump02 
    endgap GapID = RailJump text = 'Upper Rail' Score = 100
endscript


script TR_BeamLip01 
    StartGap GapID = beamlip flags = [ REQUIRE_LIP CANCEL_GROUND CANCEL_MANUAL ]
endscript


script TR_BeamLip02 
    endgap GapID = beamlip text = 'Beam Lip' Score = 50
endscript


script TR_Recessed01 
    StartGap GapID = recesssedA flags = [ PURE_AIR ]
    endgap GapID = recesssedB text = 'Recessed transfer' Score = 100
endscript


script TR_Recessed02 
    StartGap GapID = recesssedB flags = [ PURE_AIR ]
    endgap GapID = recesssedA text = 'Recessed transfer' Score = 100
endscript


script TR_Goingup01 
    StartGap GapID = goingup flags = [ PURE_AIR ]
endscript


script TR_Goingup02 
    endgap GapID = goingup text = 'Going up' Score = 75
endscript


script TR_Passage01 
    StartGap GapID = Passage flags = [ PURE_AIR ]
endscript


script TR_Passage02 
    endgap GapID = Passage text = 'Passage hop' Score = 150
endscript


script TR_Otherside01 
    StartGap GapID = othersidea flags = [ PURE_AIR ]
    endgap GapID = othersideb text = 'OtherSide 1' Score = 150
endscript


script TR_Otherside02 
    StartGap GapID = othersideb flags = [ PURE_AIR ]
    endgap GapID = othersidea text = 'OtherSide 1' Score = 150
endscript


script TR_Otherside01a 
    StartGap GapID = othersidec flags = [ PURE_AIR ]
    endgap GapID = othersided text = 'OtherSide 2' Score = 150
endscript


script TR_Otherside02a 
    StartGap GapID = othersided flags = [ PURE_AIR ]
    endgap GapID = othersidec text = 'OtherSide 2' Score = 150
endscript


script TR_SprinklerLip01 
    StartGap GapID = SprinklerLip flags = [ PURE_AIR ]
endscript


script TR_SprinklerLip02 
    endgap GapID = SprinklerLip text = 'Sprinkler Lip' Score = 100
endscript


script TR_LightHop01 
    StartGap GapID = lighthopa flags = [ PURE_AIR ]
    endgap GapID = lighthopb text = 'Light Hop' Score = 75
    SpawnScript TR_SFX_OnLight_Gap
endscript


script TR_LightHop02 
    StartGap GapID = lighthopb flags = [ PURE_AIR ]
    endgap GapID = lighthopa text = 'Light Hop' Score = 75
    SpawnScript TR_SFX_OnLight_Gap
endscript


script TR_RailHop01 
    StartGap GapID = RailHop flags = [ PURE_AIR ]
endscript


script TR_RailHop02 
    endgap GapID = RailHop text = 'Rail Pop' Score = 25
endscript


script TR_HighLip01 
    StartGap GapID = highlip flags = [ PURE_AIR ]
endscript


script TR_HighLip02 
    endgap GapID = highlip text = 'High wire' Score = 150
endscript


script TR_Rail2Light01 
    StartGap GapID = Rail2light flags = [ PURE_AIR ]
endscript


script TR_Rail2Light02 
    endgap GapID = Rail2light text = 'Rail 2 Light' Score = 50
    SpawnScript TR_SFX_OnLight_Gap
endscript


script TR_Pool2pool01 
    StartGap GapID = pool2poolA flags = [ PURE_AIR ]
    endgap GapID = pool2poolB text = 'Pool 2 Pool' Score = 50
endscript


script TR_Pool2pool02 
    StartGap GapID = pool2poolB flags = [ PURE_AIR ]
    endgap GapID = pool2poolA text = 'Pool 2 Pool' Score = 50
endscript


script TR_Manual01 
    StartGap GapID = Manual flags = [ PURE_MANUAL ]
endscript


script TR_Manual02 
    endgap GapID = Manual text = 'Downward Manual' Score = 300
endscript


script TR_BigLip01 
    StartGap GapID = BigLip flags = [ PURE_AIR ]
endscript


script TR_BigLip02 
    endgap GapID = BigLip text = 'Big ole lip' Score = 200
endscript


script TR_RampHop01 
    Gap_Gen_Transfer start GapID = Ramp01
endscript


script TR_RampHop02 
    Gap_Gen_Transfer end GapID = Ramp01 text = 'Ramp Hop' Score = 50
endscript


script TR_AddGoal_Special 
    AddGoal_Special {
        goal_text = ' Get SPECIAL then\n \'McTwist\'\n ( \k1 )'
        view_goals_text = 'Novice - Do a McTwist'
        goal_description = Margera_tr_goal_Special
        start_cam_anims = [
            {
                virtual_cam
                frames = 100
                TargetID = world
                targetOffset = (-3538.39990234375, -757.7000122070312, -13557.400390625)
                positionOffset = (-3051.60009765625, -669.0999755859375, -3569.60009765625)
                cam_anim_text = Margera_tr_goal_Special_camanim01
                skippable = 1
                Play_hold
            }
            {
                virtual_cam
                TargetID = world
                targetOffset = (-3538.39990234375, -757.7000122070312, -13557.400390625)
                positionOffset = (-3051.60009765625, -669.0999755859375, -3569.60009765625)
                frames = 100
                cam_anim_text = Margera_tr_goal_Special_camanim02
                skippable = 1
                Play_hold
            }
            {
                virtual_cam
                TargetID = world
                targetOffset = (-3538.39990234375, -757.7000122070312, -13557.400390625)
                positionOffset = (-3051.60009765625, -669.0999755859375, -3569.60009765625)
                frames = 100
                cam_anim_text = ''
                skippable = 1
                Play_hold
            }
        ]
        trick_name = Trick_McTwist
        trick_type = Air
        skater = custom
        unlocked_by_another
        pro = 'Margera'
        full_name = 'Bam Margera'
        child = TR_Goal_Gaps23
    }
endscript


script TR_2d_sign_element_create parent = menu3d_anchor
    if GetGlobalFlag flag = SCREEN_MODE_WIDE
        <Offset> = (-8.0, 0.0)
    else
        <Offset> = (0.0, 0.0)
    endif
    CreateScreenElement {
        type = ContainerElement
        parent = <parent>
        id = TR_eye_holder
        Pos = ((0.0, 230.0) + <Offset>)
        z_priority = -53
    }
    CreateScreenElement {
        type = SpriteElement
        parent = TR_eye_holder
        texture = TR_icon_1
        Scale = 1.400
        rgba = [ 128 128 128 80 ]
        Pos = (-12.0, 0.0)
        rot_angle = 0
        just = [ left top ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = TR_eye_holder
        texture = TR_icon_1
        Scale = 1.400
        rgba = [ 128 128 128 80 ]
        Pos = (65.0, 0.0)
        rot_angle = 0
        just = [ left top ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <parent>
        texture = TR_icon_2
        id = TR_dynomite
        Scale = 1.800
        rgba = [ 128 128 128 100 ]
        Pos = ((100.0, 300.0) + <Offset>)
        rot_angle = -55
        just = [ left top ]
        z_priority = -51
    }
    RunScriptOnScreenElement id = TR_eye_holder do_random_effect_paused params = { id = <id> }
    RunScriptOnScreenElement id = TR_dynomite do_random_effect_paused params = { id = <id> }
endscript

