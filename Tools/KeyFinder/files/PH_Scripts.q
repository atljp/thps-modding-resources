
script PH_setup 
    PH_Main_Initializer
    if IsCareerMode
    else
    endif
    create_panel_message style = panel_message_death text = ' '
endscript


script PH_Startup 
endscript


script PH_Main_Initializer 
    if ((GameModeEquals is_classic)|| (GameModeEquals is_career))
        Create name = PH_Invisible_Fence
        Create name = Obj_Phillyside_Fence
    endif
    if InMultiPlayerGame
        Kill name = dt_shaddy
        Kill name = PH_Love_Water_Surface
        Kill name = TRG_Fountain_natas02
        Create name = TRG_Fountain_natas03
        Kill name = PH_Love_Water_Surface01
        Kill name = PH_Love_Water_Surface02
    endif
endscript


script TRG_LA_Car01Script 
    Car_Generic01 StickToGround TurnDist = 70 DefaultSpeed = 35
endscript


script PH_KillPlane 
    Sk3_KillSkater bail nodeName = TRG_Restart01 Message1 = ' DENIED!' message2 = ' Good One?'
endscript


script PH_Tunnel_Kill01 
    Sk3_KillSkater nodeName = TRG_Restart_Tunnel02
endscript


script PH_Tunnel_Kill02 
    Sk3_KillSkater nodeName = TRG_Restart_Tunnel01
endscript


script PH_goals 
    if InMultiPlayerGame
        add_multiplayer_mode_goals
    endif
    if NOT InSplitScreenGame
        if ((GameModeEquals is_classic)|| (InNetGame))
            printf 'adding classic goals'
            AddGoal_HighScore {
                unlimited_time
                classic_mode_goal
                goal_text = PH_Classic_HighScore_Text
                view_goals_cameras = [{
                        name = Cam_score
                        frames = 1200
                        skippable = 1
                    }
                ]
                difficulty_level_params = [
                    {Score = PH_Classic_Easy_HighScore
                        goal_text = PH_Classic_Easy_HighScore_Text
                        view_goals_text = PH_Classic_Easy_HighScore_Text
                    }
                    {Score = PH_Classic_HighScore
                        goal_text = PH_Classic_HighScore_Text
                        view_goals_text = PH_Classic_HighScore_Text
                    }
                ]
            }
            AddGoal_ProScore {
                unlimited_time
                classic_mode_goal
                Score = PH_Classic_ProScore
                goal_text = PH_Classic_ProScore_Text
                view_goals_text = PH_Classic_ProScore_Text
                difficulty_level_params = [
                    {Score = PH_Classic_Easy_ProScore
                        goal_text = PH_Classic_Easy_ProScore_Text
                        view_goals_text = PH_Classic_Easy_ProScore_Text
                    }
                    {Score = PH_Classic_ProScore
                        goal_text = PH_Classic_ProScore_Text
                        view_goals_text = PH_Classic_ProScore_Text
                    }
                ]
            }
            AddGoal_SickScore {
                unlimited_time
                classic_mode_goal
                Score = PH_Classic_SickScore
                goal_text = PH_Classic_SickScore_Text
                view_goals_text = PH_Classic_SickScore_Text
                difficulty_level_params = [
                    {Score = PH_Classic_Easy_SickScore
                        goal_text = PH_Classic_Easy_SickScore_Text
                        view_goals_text = PH_Classic_Easy_SickScore_Text
                    }
                    {Score = PH_Classic_SickScore
                        goal_text = PH_Classic_SickScore_Text
                        view_goals_text = PH_Classic_SickScore_Text
                    }
                ]
            }
            AddGoal_HighCombo {
                unlimited_time
                classic_mode_goal
                Score = PH_Classic_HighCombo
                goal_text = PH_Classic_HighCombo_Text
                view_goals_text = PH_Classic_HighCombo_Text
                difficulty_level_params = [
                    {Score = PH_Classic_Easy_HighCombo
                        goal_text = PH_Classic_Easy_HighCombo_Text
                        view_goals_text = PH_Classic_Easy_HighCombo_Text
                    }
                    {Score = PH_Classic_HighCombo
                        goal_text = PH_Classic_HighCombo_Text
                        view_goals_text = PH_Classic_HighCombo_Text
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
                        targetOffset = (-4132.89990234375, -2913.5, -7534.2998046875)
                        positionOffset = (-1680.199951171875, -1478.800048828125, 2053.300048828125)
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
                        targetOffset = (6336.0, -2712.699951171875, -4804.2998046875)
                        positionOffset = (-2431.0, -1489.0999755859375, -152.1999969482422)
                        frames = 200
                        skippable = 1
                    }
                ]
            }
            AddGoal_Collect {
                unlimited_time
                init_script = PH_TrashCreate
                goal_deactivate_script = PH_TrashKill
                classic_mode_goal
                collect_type = 'Smack The 5 Bags'
                goal_text = 'Smack All The Bags'
                view_goals_text = 'Smack All The Bags'
                use_hud_counter
                hud_counter_caption = 'Bags Destroyed!'
                goal_flags = [got_1
                    got_2
                    got_3
                    got_4
                    got_5
                ]
                view_goals_cameras = [{virtual_cam
                        TargetID = world
                        targetOffset = (-2627.10009765625, -3474.5, 5432.7001953125)
                        positionOffset = (900.4000244140625, -1533.5, -3720.800048828125)
                        frames = 200
                        skippable = 1
                    }
                ]
            }
            AddGoal_Collect {
                unlimited_time
                init_script = PH_HogeysCreate
                goal_deactivate_script = PH_HogeysKill
                classic_mode_goal
                version = 2
                collect_type = 'Hogeys'
                goal_text = 'Smash The 5 Hogeys'
                view_goals_text = 'Smash The 5 Hogeys'
                use_hud_counter
                hud_counter_caption = 'Smash The 5 Hogeys'
                goal_flags = [got_1
                    got_2
                    got_3
                    got_4
                    got_5
                ]
                view_goals_cameras = [{virtual_cam
                        TargetID = world
                        targetOffset = (-3715.699951171875, -3707.0, -8259.2001953125)
                        positionOffset = (-673.0999755859375, -1531.0999755859375, 1014.5)
                        frames = 200
                        skippable = 1
                    }
                ]
            }
            AddGoal_Gaps {
                unlimited_time
                classic_mode_goal
                version = 2
                goal_text = 'Triple Heelflip Over the THPS Sign'
                view_goals_text = 'Triple Heelflip Over the THPS Sign'
                goal_description = 'Triple Heelflip Over the THPS Sign'
                goal_flags = [ got_1
                 ]
                view_goals_cameras = [{virtual_cam
                        TargetID = world
                        targetOffset = (1970.800048828125, -2045.800048828125, 8356.400390625)
                        positionOffset = (-1962.4000244140625, -1471.300048828125, -819.5999755859375)
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
                secret_tape_id = TRG_PH_SecretTape
                view_goals_cameras = [{virtual_cam
                        TargetID = world
                        targetOffset = (4621.7998046875, -5167.7001953125, 1487.9000244140625)
                        positionOffset = (-4423.39990234375, -1090.0999755859375, 241.10000610351562)
                        frames = 200
                        skippable = 1
                    }
                ]
            }
        endif
    endif
endscript


script PH_HogeysCreate 
    Create prefix = 'PH_Hogey'
    Create prefix = 'PH_Trigger_Hogey'
endscript


script PH_HogeysKill 
    Kill prefix = 'PH_Hogey'
    Kill prefix = 'PH_Trigger_Hogey'
endscript


script PH_TrashCreate 
    Create prefix = 'TRG_TrashTrigger'
    Create prefix = 'trash'
    Create prefix = 'TRG_Trash_Box'
endscript


script PH_TrashKill 
    Kill prefix = 'trash'
    Kill prefix = 'TRG_Trash_Box'
    Kill prefix = 'TRG_TrashTrigger'
endscript

FLAG_BA_TRASHCAN_SPINNING = 0
FLAG_LA_LATTE1 = 100
FLAG_LA_LATTE2 = 101
FLAG_LA_LATTE3 = 102
FLAG_LA_LATTE4 = 103
FLAG_LA_LATTE5 = 104

script BA_TrashCan_Spinny1 
    printf 'BA_Trashcan_spinny1'
    obj_getid
    if IsAlive name = trash14
        Kill name = <name>
        obj_setflag FLAG_BA_TRASHCAN_SPINNING
        CreateFastParticleSystem name = JOW_Trash01 params_script = JOW_PH_Trash01_fast_particle_params
        trash01 ::rigidbody_kick vel = (5.0, 5.0, 0.0) rotvel = (10.0, 10.0, 10.0)
        trash02 ::rigidbody_kick vel = (0.0, 5.0, 0.0) rotvel = (10.0, -10.0, 10.0)
        trash03 ::rigidbody_kick vel = (0.0, 0.0, 0.0) rotvel = (-10.0, 10.0, 10.0)
        trash04 ::rigidbody_kick vel = (5.0, 15.0, 0.0) rotvel = (10.0, 10.0, -10.0)
        trash05 ::rigidbody_kick vel = (0.0, 15.0, 0.0) rotvel = (-10.0, -10.0, 10.0)
        trash06 ::rigidbody_kick vel = (0.0, 15.0, 5.0) rotvel = (10.0, -10.0, 10.0)
        trash07 ::rigidbody_kick vel = (0.0, 15.0, 0.0) rotvel = (10.0, 10.0, -10.0)
        trash08 ::rigidbody_kick vel = (0.0, 0.0, 0.0) rotvel = (-10.0, 10.0, -10.0)
        trash09 ::rigidbody_kick vel = (5.0, 1.0, 0.0) rotvel = (-10.0, -10.0, -10.0)
        trash10 ::rigidbody_kick vel = (5.0, 0.0, 0.0) rotvel = (10.0, -10.0, -10.0)
        trash11 ::rigidbody_kick vel = (0.0, 15.0, 0.0) rotvel = (10.0, 10.0, -10.0)
        trash12 ::rigidbody_kick vel = (0.0, 0.0, 0.0) rotvel = (-10.0, 10.0, -10.0)
        trash13 ::rigidbody_kick vel = (5.0, 1.0, 0.0) rotvel = (-10.0, -10.0, -10.0)
        trash14 ::rigidbody_kick vel = (5.0, 0.0, 0.0) rotvel = (10.0, -10.0, -10.0)
        Kill name = TRG_TrashTrigger01
        playsound Bouncy_UmbrellaHit01
        wait 10 frames
        playsound HitMetalCan
        obj_clearflag FLAG_BA_TRASHCAN_SPINNING
        goal_collect_got_object goal_id = PH_classic_goal_collect flag = got_1
        SetFlag flag = FLAG_LA_LATTE1
    endif
endscript


script BA_TrashCan_Spinny2 
    printf 'BA_Trashcan_spinny2'
    obj_getid
    printstruct <...> 
    if IsAlive name = trash28
        Kill name = <name>
        obj_setflag FLAG_BA_TRASHCAN_SPINNING
        CreateFastParticleSystem name = JOW_Trash02 params_script = JOW_PH_Trash02_fast_particle_params
        trash15 ::rigidbody_kick vel = (5.0, 5.0, 0.0) rotvel = (10.0, 10.0, 10.0)
        trash16 ::rigidbody_kick vel = (0.0, 5.0, 0.0) rotvel = (10.0, -10.0, 10.0)
        trash17 ::rigidbody_kick vel = (0.0, 0.0, 0.0) rotvel = (-10.0, 10.0, 10.0)
        trash18 ::rigidbody_kick vel = (5.0, 15.0, 0.0) rotvel = (10.0, 10.0, -10.0)
        trash19 ::rigidbody_kick vel = (0.0, 15.0, 0.0) rotvel = (-10.0, -10.0, 10.0)
        trash20 ::rigidbody_kick vel = (0.0, 15.0, 5.0) rotvel = (10.0, -10.0, 10.0)
        trash21 ::rigidbody_kick vel = (0.0, 15.0, 0.0) rotvel = (10.0, 10.0, -10.0)
        trash22 ::rigidbody_kick vel = (0.0, 0.0, 0.0) rotvel = (-10.0, 10.0, -10.0)
        trash23 ::rigidbody_kick vel = (5.0, 1.0, 0.0) rotvel = (-10.0, -10.0, -10.0)
        trash24 ::rigidbody_kick vel = (5.0, 0.0, 0.0) rotvel = (10.0, -10.0, -10.0)
        trash25 ::rigidbody_kick vel = (0.0, 15.0, 0.0) rotvel = (10.0, 10.0, -10.0)
        trash26 ::rigidbody_kick vel = (0.0, 0.0, 0.0) rotvel = (-10.0, 10.0, -10.0)
        trash27 ::rigidbody_kick vel = (5.0, 1.0, 0.0) rotvel = (-10.0, -10.0, -10.0)
        trash28 ::rigidbody_kick vel = (5.0, 0.0, 0.0) rotvel = (10.0, -10.0, -10.0)
        Kill name = TRG_TrashTrigger02
        playsound Bouncy_UmbrellaHit01
        wait 10 frames
        playsound HitMetalCan
        obj_clearflag FLAG_BA_TRASHCAN_SPINNING
        goal_collect_got_object goal_id = PH_classic_goal_collect flag = got_2
        SetFlag flag = FLAG_LA_LATTE2
    else
        printf 'trash28 is not alive'
    endif
endscript


script BA_TrashCan_Spinny3 
    printf 'BA_Trashcan_spinny3'
    obj_getid
    if IsAlive name = trash42
        Kill name = <name>
        obj_setflag FLAG_BA_TRASHCAN_SPINNING
        CreateFastParticleSystem name = JOW_Trash03 params_script = JOW_PH_Trash03_fast_particle_params
        trash29 ::rigidbody_kick vel = (5.0, 5.0, 0.0) rotvel = (10.0, 10.0, 10.0)
        trash31 ::rigidbody_kick vel = (0.0, 5.0, 0.0) rotvel = (10.0, -10.0, 10.0)
        trash32 ::rigidbody_kick vel = (0.0, 0.0, 0.0) rotvel = (-10.0, 10.0, 10.0)
        trash33 ::rigidbody_kick vel = (5.0, 15.0, 0.0) rotvel = (10.0, 10.0, -10.0)
        trash34 ::rigidbody_kick vel = (0.0, 15.0, 0.0) rotvel = (-10.0, -10.0, 10.0)
        trash35 ::rigidbody_kick vel = (0.0, 15.0, 5.0) rotvel = (10.0, -10.0, 10.0)
        trash36 ::rigidbody_kick vel = (0.0, 15.0, 0.0) rotvel = (10.0, 10.0, -10.0)
        trash37 ::rigidbody_kick vel = (0.0, 0.0, 0.0) rotvel = (-10.0, 10.0, -10.0)
        trash38 ::rigidbody_kick vel = (5.0, 1.0, 0.0) rotvel = (-10.0, -10.0, -10.0)
        trash39 ::rigidbody_kick vel = (5.0, 0.0, 0.0) rotvel = (10.0, -10.0, -10.0)
        trash40 ::rigidbody_kick vel = (0.0, 15.0, 0.0) rotvel = (10.0, 10.0, -10.0)
        trash41 ::rigidbody_kick vel = (0.0, 0.0, 0.0) rotvel = (-10.0, 10.0, -10.0)
        trash42 ::rigidbody_kick vel = (5.0, 1.0, 0.0) rotvel = (-10.0, -10.0, -10.0)
        trash43 ::rigidbody_kick vel = (5.0, 0.0, 0.0) rotvel = (10.0, -10.0, -10.0)
        Kill name = TRG_TrashTrigger03
        playsound Bouncy_UmbrellaHit01
        wait 10 frames
        playsound HitMetalCan
        obj_clearflag FLAG_BA_TRASHCAN_SPINNING
        goal_collect_got_object goal_id = PH_classic_goal_collect flag = got_3
        SetFlag flag = FLAG_LA_LATTE3
    endif
endscript


script BA_TrashCan_Spinny4 
    printf 'BA_Trashcan_spinny4'
    obj_getid
    if IsAlive name = trash57
        Kill name = <name>
        obj_setflag FLAG_BA_TRASHCAN_SPINNING
        CreateFastParticleSystem name = JOW_Trash04 params_script = JOW_PH_Trash04_fast_particle_params
        trash44 ::rigidbody_kick vel = (5.0, 5.0, 0.0) rotvel = (10.0, 10.0, 10.0)
        trash45 ::rigidbody_kick vel = (0.0, 5.0, 0.0) rotvel = (10.0, -10.0, 10.0)
        trash46 ::rigidbody_kick vel = (0.0, 0.0, 0.0) rotvel = (-10.0, 10.0, 10.0)
        trash47 ::rigidbody_kick vel = (5.0, 15.0, 0.0) rotvel = (10.0, 10.0, -10.0)
        trash48 ::rigidbody_kick vel = (0.0, 15.0, 0.0) rotvel = (-10.0, -10.0, 10.0)
        trash49 ::rigidbody_kick vel = (0.0, 15.0, 5.0) rotvel = (10.0, -10.0, 10.0)
        trash50 ::rigidbody_kick vel = (0.0, 15.0, 0.0) rotvel = (10.0, 10.0, -10.0)
        trash51 ::rigidbody_kick vel = (0.0, 0.0, 0.0) rotvel = (-10.0, 10.0, -10.0)
        trash52 ::rigidbody_kick vel = (5.0, 1.0, 0.0) rotvel = (-10.0, -10.0, -10.0)
        trash53 ::rigidbody_kick vel = (5.0, 0.0, 0.0) rotvel = (10.0, -10.0, -10.0)
        trash54 ::rigidbody_kick vel = (0.0, 15.0, 0.0) rotvel = (10.0, 10.0, -10.0)
        trash55 ::rigidbody_kick vel = (0.0, 0.0, 0.0) rotvel = (-10.0, 10.0, -10.0)
        trash56 ::rigidbody_kick vel = (5.0, 1.0, 0.0) rotvel = (-10.0, -10.0, -10.0)
        trash57 ::rigidbody_kick vel = (5.0, 0.0, 0.0) rotvel = (10.0, -10.0, -10.0)
        Kill name = TRG_TrashTrigger04
        playsound Bouncy_UmbrellaHit01
        wait 10 frames
        playsound HitMetalCan
        obj_clearflag FLAG_BA_TRASHCAN_SPINNING
        goal_collect_got_object goal_id = PH_classic_goal_collect flag = got_4
        SetFlag flag = FLAG_LA_LATTE4
    endif
endscript


script BA_TrashCan_Spinny5 
    printf 'BA_Trashcan_spinny5'
    obj_getid
    if IsAlive name = trash70
        Kill name = <name>
        obj_setflag FLAG_BA_TRASHCAN_SPINNING
        CreateFastParticleSystem name = JOW_Trash05 params_script = JOW_PH_Trash05_fast_particle_params
        trash58 ::rigidbody_kick vel = (5.0, 5.0, 0.0) rotvel = (10.0, 10.0, 10.0)
        trash59 ::rigidbody_kick vel = (0.0, 5.0, 0.0) rotvel = (10.0, -10.0, 10.0)
        trash60 ::rigidbody_kick vel = (0.0, 0.0, 0.0) rotvel = (-10.0, 10.0, 10.0)
        trash61 ::rigidbody_kick vel = (5.0, 15.0, 0.0) rotvel = (10.0, 10.0, -10.0)
        trash62 ::rigidbody_kick vel = (0.0, 15.0, 0.0) rotvel = (-10.0, -10.0, 10.0)
        trash63 ::rigidbody_kick vel = (0.0, 15.0, 5.0) rotvel = (10.0, -10.0, 10.0)
        trash64 ::rigidbody_kick vel = (0.0, 15.0, 0.0) rotvel = (10.0, 10.0, -10.0)
        trash65 ::rigidbody_kick vel = (0.0, 0.0, 0.0) rotvel = (-10.0, 10.0, -10.0)
        trash66 ::rigidbody_kick vel = (5.0, 1.0, 0.0) rotvel = (-10.0, -10.0, -10.0)
        trash67 ::rigidbody_kick vel = (5.0, 0.0, 0.0) rotvel = (10.0, -10.0, -10.0)
        trash68 ::rigidbody_kick vel = (0.0, 15.0, 0.0) rotvel = (10.0, 10.0, -10.0)
        trash69 ::rigidbody_kick vel = (0.0, 0.0, 0.0) rotvel = (-10.0, 10.0, -10.0)
        trash70 ::rigidbody_kick vel = (5.0, 1.0, 0.0) rotvel = (-10.0, -10.0, -10.0)
        Kill name = TRG_TrashTrigger05
        playsound Bouncy_UmbrellaHit01
        wait 10 frames
        playsound HitMetalCan
        obj_clearflag FLAG_BA_TRASHCAN_SPINNING
        goal_collect_got_object goal_id = PH_classic_goal_collect flag = got_5
        SetFlag flag = FLAG_LA_LATTE5
    endif
endscript


script PH_Secret_Tape 
endscript


script PH_GapStart_TripleLove 
    printf 'Start Gap'
    StartGap GapID = JapGrab flags = [ PURE_AIR ] TrickText = 'Triple Heelflip' TrickScript = PH_Classic_Gaps_Got1
endscript


script PH_GapEnd_TripleLove 
    printf 'End Gap'
    endgap GapID = JapGrab Score = 100 text = 'THPS Sign Gap'
endscript


script PH_Classic_Gaps_Got1 
    printf 'Win Gap'
    GoalManager_SetGoalFlag name = PH_classic_goal_gaps2 got_1 1
endscript


script PH_Hogeys 
    Kill name = <name>
    Kill name = <Trigg>
    playsound SmashCake
    switch <name>
        case PH_Hogey01
        goal_collect_got_object goal_id = ph_classic_goal_collect2 flag = got_1
        CreateGlobalFlexParticlesystem name = JOW_Hoagie01 params_script = JOW_PH_Hoagie01_particle_params
        JOW_Hoagie01 ::obj_setposition position = (-4908.009765625, -1182.760009765625, -1674.1800537109375)
        CreateFastParticleSystem name = JOW_Hoagie01a params_script = JOW_PH_Hoagie01_fast_particle_params
        case PH_Hogey02
        goal_collect_got_object goal_id = ph_classic_goal_collect2 flag = got_2
        CreateGlobalFlexParticlesystem name = JOW_Hoagie02 params_script = JOW_PH_Hoagie02_particle_params
        JOW_Hoagie02 ::obj_setposition position = (-3940.610107421875, -1542.75, 238.1999969482422)
        CreateFastParticleSystem name = JOW_Hoagie02a params_script = JOW_PH_Hoagie02_fast_particle_params
        case PH_Hogey03
        goal_collect_got_object goal_id = ph_classic_goal_collect2 flag = got_3
        CreateGlobalFlexParticlesystem name = JOW_Hoagie03 params_script = JOW_PH_Hoagie03_particle_params
        JOW_Hoagie03 ::obj_setposition position = (-705.0499877929688, -1559.93994140625, 932.052001953125)
        CreateFastParticleSystem name = JOW_Hoagie03a params_script = JOW_PH_Hoagie03_fast_particle_params
        case PH_Hogey04
        goal_collect_got_object goal_id = ph_classic_goal_collect2 flag = got_4
        CreateGlobalFlexParticlesystem name = JOW_Hoagie04 params_script = JOW_PH_Hoagie04_particle_params
        JOW_Hoagie04 ::obj_setposition position = (-1905.47998046875, -1411.25, -668.47998046875)
        CreateFastParticleSystem name = JOW_Hoagie04a params_script = JOW_PH_Hoagie04_fast_particle_params
        case PH_Hogey05
        goal_collect_got_object goal_id = ph_classic_goal_collect2 flag = got_5
        CreateGlobalFlexParticlesystem name = JOW_Hoagie05 params_script = JOW_PH_Hoagie05_particle_params
        JOW_Hoagie05 ::obj_setposition position = (-2562.679931640625, -1501.1099853515625, 2400.1201171875)
        CreateFastParticleSystem name = JOW_Hoagie05a params_script = JOW_PH_Hoagie05_fast_particle_params
    endswitch
endscript


script PH_PlantTHPS 
    GetTriggerArray wallplant onto
    if triggertype <trigger_array>
        GetGap text = 'Sticker Slap The THPS Sign' Score = 2000
    endif
endscript


script Scoreboard_small_style 
    Pos = (20.0, 10.0)
    DoMorph Scale = 2
    begin 
    DoMorph time = 0.1000 Pos = (320.0, 290.0)
    DoMorph time = 0.1000 Pos = (320.0, 280.0)
    DoMorph time = 0.1000 Pos = (340.0, 290.0)
    rgba = {255 , 255 , 255 , 128}
    repeat 150
endscript


script wait_and_kill_eq_text 
    wait 1 seconds
    DestroyScreenElement id = scoreboard
endscript


script PH_TreeSounds 
    playsound BonkBush
endscript


script PH_Fountain 
    GetTriggerArray grind onto
    if triggertype <trigger_array>
        playsound HitMetalCan volume = 100.0 pitch = 100.0
        Kill name = dt_shaddy
        Kill name = PH_Love_Water_Surface
        Kill prefix = 'TRG_drainfountain'
        Kill name = TRG_Fountain_natas02
        wait 1 second
        Create name = TRG_Fountain_natas03
        Kill name = PH_Love_Water_Surface01
        Kill name = PH_Love_Water_Surface02
        playsound FallWater volume = 100.0 pitch = 100.0
        create_panel_block {id = scoreboard
            text = 'FOUNTAIN DRAINED!'
            rgba = {0 , 132 , 255 , 128}
            dims = (640.0, 25.0)
            style = Scoreboard_small_style
            just = { left left }
            internal_just = { left left }
        }
        SpawnScript wait_and_kill_eq_text
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


script PH_MidStairManual 
    StartGap flags = [ PURE_MANUAL ]
    endgap text = 'Manual Mid Stair Ledge' Score = 1000
endscript


script PH_SmallStairManual 
    StartGap flags = [ PURE_MANUAL ]
    endgap text = 'Manual Small Stair Ledge' Score = 5000
endscript


script PH_BigStairManual 
    StartGap flags = [ PURE_MANUAL ]
    endgap text = 'Manual Big Stair Ledge' Score = 2500
endscript


script PH_TechinToStreetManual 
    StartGap flags = [ PURE_MANUAL ]
    endgap text = 'Flatland Techin\' To The Street!' Score = 1100
endscript


script PH_AirFunbox 
    StartGap flags = [ CANCEL_GROUND , REQUIRE_AIR ]
    endgap text = 'Air The Funbox' Score = 1100
endscript


script PH_LedgeToHandS 
    StartGap GapID = Ledge23 flags = [ CANCEL_GROUND CANCEL_WALK CANCEL_MANUAL ]
endscript


script PH_LedgeToHandE 
    endgap GapID = Ledge23 text = 'Ledge 2 Handrail' Score = 1100
endscript


script PH_ConcreteTrans 
    StartGap flags = [ REQUIRE_AIR CANCEL_GROUND CANCEL_WALK CANCEL_HANG ]
    endgap text = 'Concrete Transfer' Score = 500
endscript


script PH_Boob2Box 
    StartGap flags = [ REQUIRE_AIR , CANCEL_GROUND ]
    endgap text = 'Boob to Box' Score = 69
endscript


script PH_CoolQPTrans 
    StartGap flags = [ CANCEL_GROUND CANCEL_WALK CANCEL_MANUAL REQUIRE_AIR ]
    endgap text = 'Cool QP Transfer' Score = 800
endscript


script PH_BehindPillar 
    StartGap flags = [ CANCEL_GROUND REQUIRE_AIR ]
    endgap text = 'Behind The Pillar' Score = 2000
endscript


script kill_fence 
    if IsAlive name = Obj_Phillyside_Fence
        ShatterAndDie {name = Obj_Phillyside_Fence
            area = 5000
            texture_swap = cg_se2_shatter_grate
            variance = 4
            vel_x = 50
            vel_y = 50
            vel_z = 50
        }
        playsound HitGlassPane2x
        Kill name = kill_fence
        Kill name = NY_Const_Pole75
        Kill name = PH_Invisible_Fence
    endif
    KillAllTextureSplats box = {height = 25 dist = 300 width = 20 Offset = (108.0, -130.0, 110.0)}
endscript


script PH_EasyPost_Gap 
    StartGap flags = [ PURE_AIR ]
    endgap text = 'Easy Post Hop' Score = 10
endscript


script PH_Post_Gap 
    StartGap flags = [ PURE_AIR ]
    endgap text = 'Post Hop' Score = 50
endscript


script PH_PlantDouble_GapStart 
    StartGap GapID = Double1 flags = [ CANCEL_GROUND ]
    endgap GapID = Double2 text = 'Planter Double Pillar Gap' Score = 150
endscript


script PH_PlantDouble_GapEnd 
    StartGap GapID = Double2 flags = [ CANCEL_GROUND ]
    endgap GapID = Double1 text = 'Planter Double Pillar Gap' Score = 150
endscript


script PH_Corner_Gap 
    StartGap flags = [ CANCEL_GROUND ]
    endgap text = 'Little Corner Grind' Score = 500
endscript


script PH_PlantTransfer_GapStart 
    StartGap GapID = Plant1 flags = [ CANCEL_GROUND ]
    endgap GapID = Plant2 text = 'Planter Transfer' Score = 100
endscript


script PH_PlantTransfer_GapEnd 
    StartGap GapID = Plant2 flags = [ CANCEL_GROUND ]
    endgap GapID = Plant1 text = 'Planter Transfer' Score = 100
endscript


script PH_GrindFaith_GapStart 
    StartGap GapID = Faith1 flags = [ CANCEL_GROUND ]
    endgap GapID = Faith2 text = 'Grind Of Faith' Score = 1000
endscript


script PH_GrindFaith_GapEnd 
    StartGap GapID = Faith2 flags = [ CANCEL_GROUND ]
    endgap GapID = Faith1 text = 'Grind Of Faith' Score = 1000
endscript


script PH_GrindFaith1_GapStart 
    StartGap GapID = Faith11 flags = [ CANCEL_GROUND ]
    endgap GapID = Faith12 text = 'Grind Of Faith' Score = 1000
endscript


script PH_GrindFaith1_GapEnd 
    StartGap GapID = Faith12 flags = [ CANCEL_GROUND ]
    endgap GapID = Faith11 text = 'Grind Of Faith' Score = 1000
endscript


script PH_LongStair_Gap 
    StartGap flags = [ CANCEL_GROUND ]
    endgap text = 'Long Stair' Score = 250
endscript


script PH_MediumStair_Gap 
    StartGap flags = [ CANCEL_GROUND ]
    endgap text = 'Medium Stair' Score = 250
endscript


script PH_ShortStair_Gap 
    StartGap flags = [ CANCEL_GROUND ]
    endgap text = 'Short Stair' Score = 150
endscript


script PH_StatueHop_Gap 
    StartGap flags = [ CANCEL_GROUND ]
    endgap text = 'Statue Hop' Score = 50
endscript


script PH_Bench_Gap 
    StartGap flags = [ CANCEL_GROUND ]
    endgap text = 'Bench Gap' Score = 100
endscript


script PH_WorldsObv_Gap 
    StartGap flags = [ PURE_AIR ]
    endgap text = 'Worlds Most Obvious Gap' Score = 100
endscript


script PH_Stair_Gap 
    StartGap flags = [ PURE_AIR ]
    endgap text = 'StairSet' Score = 100
endscript


script PH_UpStair_GapStart 
    StartGap GapID = up1 flags = [ CANCEL_GROUND ]
    endgap GapID = Up2 text = 'Grind Up Dem Stairs' Score = 500
endscript


script PH_UpStair_GapEnd 
    StartGap GapID = Up2 flags = [ CANCEL_GROUND ]
    endgap GapID = up1 text = 'Grind Up Dem Stairs' Score = 500
endscript


script PH_WorldsObv2nd_GapStart 
    StartGap GapID = second1 flags = [ CANCEL_GROUND ]
endscript


script PH_WorldsObv2nd_GapEnd 
    endgap GapID = second1 text = 'Worlds Second Most Obvious Gap' Score = 750
endscript


script PH_UpSmall_Gap 
    StartGap flags = [ PURE_AIR ]
    endgap text = 'Up The Small Step Set' Score = 100
endscript


script PH_PhillyHop_Gap 
    StartGap flags = [ PURE_AIR ]
    endgap text = 'Phillyside Hop' Score = 100
endscript


script PH_HPTransfer_Gap 
    StartGap flags = [ PURE_AIR ]
    endgap text = 'Philly HP Transfer' Score = 250
endscript


script PH_PillarHop_Gap 
    StartGap flags = [ PURE_AIR ]
    endgap text = 'Pillar Hop' Score = 100
endscript


script PH_PillarFight_Gap 
    StartGap flags = [ PURE_AIR ]
    endgap text = 'Pillar Fight' Score = 500
endscript


script PH_thpsFountain_Gap 
    StartGap flags = [ PURE_AIR ]
    endgap text = 'THPS Fountain Gap' Score = 500
endscript


script PH_Chillin_Gap 
    StartGap flags = [ PURE_AIR ]
    endgap text = 'Chillin On The Balcony' Score = 500
endscript


script PH_TrackSmack_GapStart 
    StartGap GapID = smack1 flags = [ CANCEL_GROUND ]
    endgap GapID = smack2 text = 'Track Smack' Score = 50
endscript


script PH_TrackSmack_GapEnd 
    StartGap GapID = smack2 flags = [ CANCEL_GROUND ]
    endgap GapID = smack1 text = 'Track Smack' Score = 50
endscript


script PH_TrackSmack1_GapStart 
    StartGap GapID = smack11 flags = [ CANCEL_GROUND ]
    endgap GapID = smack12 text = 'Track Smack' Score = 50
endscript


script PH_TrackSmack1_GapEnd 
    StartGap GapID = smack12 flags = [ CANCEL_GROUND ]
    endgap GapID = smack11 text = 'Track Smack' Score = 50
endscript


script PH_TrackSmack2_GapStart 
    StartGap GapID = smack111 flags = [ CANCEL_GROUND ]
    endgap GapID = smack112 text = 'Track Smack' Score = 50
endscript


script PH_TrackSmack2_GapEnd 
    StartGap GapID = smack112 flags = [ CANCEL_GROUND ]
    endgap GapID = smack111 text = 'Track Smack' Score = 50
endscript


script PH_HoboGrind_Gap 
    StartGap flags = [ CANCEL_GROUND ]
    endgap text = 'Hobo Grind' Score = 100
endscript


script PH_Railing2Planter_Gap 
    StartGap flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_WALK ]
    endgap text = 'Railing To Planter' Score = 100
endscript


script PH_Visiting_GapStart 
    StartGap GapID = visiting1 flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_WALK ]
    endgap GapID = visiting2 text = 'Just Visiting' Score = 150
endscript


script PH_Visiting_GapEnd 
    StartGap GapID = visiting2 flags = [ CANCEL_GROUND ]
    endgap GapID = visiting1 text = 'Just Visiting' Score = 150
endscript


script PH_TeleCo_GapStart 
    StartGap GapID = Tele1 flags = [ CANCEL_GROUND ]
    endgap GapID = Tele2 text = 'Telephone Co. Gap' Score = 250
endscript


script PH_TeleCo_GapEnd 
    StartGap GapID = Tele2 flags = [ CANCEL_GROUND ]
    endgap GapID = Tele1 text = 'Telephone Co. Gap' Score = 250
endscript


script PH_Funbox_GapStart 
    StartGap GapID = Fun1 flags = [ CANCEL_GROUND ]
endscript


script PH_Funbox_GapEnd 
    endgap GapID = Fun1 text = 'Funbox Transfer' Score = 250
endscript


script PH_Awning_GapStart 
    StartGap GapID = aw1 flags = [ CANCEL_GROUND CANCEL_HANG ]
    endgap GapID = aw2 text = 'Awning Grind' Score = 500
endscript


script PH_Awning_GapEnd 
    StartGap GapID = aw2 flags = [ CANCEL_GROUND CANCEL_HANG ]
    endgap GapID = aw1 text = 'Awning Grind' Score = 500
endscript


script PH_Flyin_GapStart 
    StartGap flags = [ CANCEL_GROUND ]
endscript


script PH_Flyin_GapEnd 
    endgap text = 'Fly By Wire' Score = 500
endscript


script PH_Death_GapStart 
    StartGap GapID = DEATH flags = [ CANCEL_GROUND CANCEL_WALK CANCEL_MANUAL ]
endscript


script PH_Death_GapEnd 
    endgap GapID = DEATH text = 'Death From Above' Score = 500
endscript


script PH_Train_Gap 
    StartGap flags = [ CANCEL_GROUND ]
    endgap text = 'Train Hard' Score = 500
endscript


script PH_Ping_GapStart 
    StartGap GapID = ping1 flags = [ CANCEL_GROUND ]
    endgap GapID = ping2 text = 'Fountain Ping' Score = 750
endscript


script PH_Ping_GapEnd 
    StartGap GapID = ping2 flags = [ CANCEL_GROUND ]
    endgap GapID = ping1 text = 'Fountain Ping' Score = 750
endscript


script PH_FunWheelie_Gap 
    StartGap flags = [ CANCEL_AIR , REQUIRE_MANUAL ]
    endgap text = 'Funbox Wheelie' Score = 100
endscript


script PH_Techin_Gapstart 
    StartGap GapID = tech1 flags = [ PURE_MANUAL ]
    endgap GapID = tech2 text = 'Flatland Techin\'' Score = 500
endscript


script PH_Techin_GapEnd 
    StartGap GapID = tech2 flags = [ PURE_MANUAL ]
    endgap GapID = tech1 text = 'Flatland Techin\'' Score = 500
endscript


script PH_Stimulation_Gap 
    StartGap flags = [ PURE_MANUAL ]
    endgap text = 'Manual Stimulation' Score = 500
endscript


script PH_Gap_Start_Mid 
    StartGap GapID = mid flags = [ CANCEL_GROUND ]
endscript


script PH_Gap_End_Mid 
    GetTriggerArray lip onto
    if triggertype <trigger_array>
        endgap GapID = mid text = 'Phillyside Mid Bowl Lip' Score = 100
    endif
endscript


script PH_Gap_Start_big 
    StartGap GapID = big flags = [ CANCEL_GROUND ]
endscript


script PH_Gap_End_big 
    GetTriggerArray lip onto
    if triggertype <trigger_array>
        endgap GapID = big text = 'Phillyside Big Bowl Lip' Score = 100
    endif
endscript


script PH_Gap_Start_new 
    StartGap GapID = new1 flags = [ CANCEL_GROUND ]
endscript


script PH_Gap_End_new 
    GetTriggerArray lip onto
    if triggertype <trigger_array>
        endgap GapID = new1 text = 'Phillyside New Bowl Lip' Score = 100
    endif
endscript


script PH_Gap_Start_HP 
    StartGap GapID = hp1 flags = [ CANCEL_GROUND ]
endscript


script PH_Gap_End_HP 
    GetTriggerArray lip onto
    if triggertype <trigger_array>
        endgap GapID = hp1 text = 'Phillyside HP Lip' Score = 100
    endif
endscript


script PH_Rockin_GapStart 
    StartGap GapID = r1 flags = [ REQUIRE_MANUAL , CANCEL_GROUND ]
    endgap GapID = r2 text = 'Rockin\' The Stairs' Score = 2500
endscript


script PH_Rockin_GapEnd 
    StartGap GapID = r2 flags = [ REQUIRE_MANUAL , CANCEL_GROUND ]
    endgap GapID = r1 text = 'Rockin\' The Stairs' Score = 2500
endscript


script PH_2d_sign_element_create parent = menu3d_anchor
    if GetGlobalFlag flag = SCREEN_MODE_WIDE
        <Offset> = (-8.0, 0.0)
    else
        <Offset> = (0.0, 0.0)
    endif
    CreateScreenElement {
        type = SpriteElement
        parent = <parent>
        texture = PH_icon_1
        id = PH_tag
        Scale = 2.500
        rgba = [ 128 128 128 100 ]
        Pos = ((20.0, 80.0) + <Offset>)
        rot_angle = 0
        just = [ left top ]
        z_priority = -51
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <parent>
        texture = PH_icon_2
        id = PH_bandaid
        Scale = 1.800
        rgba = [ 128 128 128 100 ]
        Pos = ((72.0, 320.0) + <Offset>)
        rot_angle = -90
        just = [ center center ]
        z_priority = -51
    }
    RunScriptOnScreenElement id = PH_tag PH_tag_anim
    RunScriptOnScreenElement id = PH_bandaid do_random_effect_paused params = { id = <id> }
endscript


script PH_tag_anim 
    begin 
    start_pos = (20.0, 80.0)
    DoMorph time = 0 Pos = (<start_pos> - (100.0, 0.0))Scale = 2.500 rot_angle = 0
    wait 2 seconds
    DoMorph time = 0.3000 Pos = <start_pos>
    wait Random (@ 2 @ 3 @ 4) seconds
    DoMorph time = 0.2000 Pos = (<start_pos> - (100.0, 0.0))
    wait Random (@ 5 @ 8 @ 3) seconds
    repeat 
endscript

