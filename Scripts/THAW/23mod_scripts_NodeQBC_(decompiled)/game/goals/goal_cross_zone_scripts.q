
script Z_SR_Disable_Skitch 
    GoalManager_GetGoalParams name = <goal_id>
    if NOT GotParam \{ just_won_goal_part }
        if NOT GotParam \{ just_won_goal }
            skater ::DisableAbility \{ skitch }
        endif
    endif
endscript

script Z_SR_CrossZone1_Success 
endscript

script Goal_Cross_Zone_Killskater_Cops 
    Sk3_KillSkater nodeName = <node>
endscript

script Goal_Cross_Zone_Checkpoint_Announce 
    announce_gap_start \{ text = 'Punkt kontrolny!' }
endscript

script M_ZELGAPS100_Heli_Dummy 
    ClearExceptionGroup \{ Heli_Dummy }
    printf \{ 'M_ZELGAPS100_Heli_Dummy' }
    WaitForEvent \{ type = HelicopterSpottedSkater }
    SpawnScriptLater \{ M_ZELGAPS100_LoseGoal }
endscript

script Z_EL_GOAL_Gaps100_Start 
    kill_heli
    wait 2 frames
    GoalManager_GetDifficultyLevel
    switch <difficulty_level>
        case 0
        create_heli {
            start_pos = (16855.69921875, 1883.0, 10509.7001953125)
            spot_count = 180
            velocity = 12
            spot_speed = 6
        }
        case 1
        create_heli {
            start_pos = (16855.69921875, 1883.0, 10509.7001953125)
            spot_count = 180
            velocity = 16
            spot_speed = 8
        }
        case 2
        create_heli {
            start_pos = (16855.69921875, 1883.0, 10509.7001953125)
            spot_count = 180
            velocity = 20
            spot_speed = 10
        }
    endswitch
endscript

script M_ZELGAPS100_LoseGoal 
    printf \{ 'M_ZELGAPS100_LoseGoal' }
    GoalManager_LoseGoal \{ name = Z_EL_Goal_Gaps100 }
endscript

script M_ZELGAPS100_Deactivate 
    kill_heli
    if NOT GoalManager_HasWonGoal \{ name = Z_EL_Goal_Gaps100 }
        skater ::TeleportSkaterToNode \{ nodeName = Z_EL_TRG_G_Gaps100_RESTARTNode }
        SpawnScriptLater \{ M_ZELGAPS100_ActivateGoal }
    endif
endscript

script M_ZELGAPS100_ActivateGoal 
    wait \{ 2 frames }
    GoalManager_ActivateGoal \{ name = Z_EL_Goal_Gaps100 }
endscript

script M_ZELGAPS100_Gameplay_WinGoal 
    SpawnScriptLater \{ M_ZELDTGAPS102_Init }
    kill_heli
    SpawnScriptLater \{ Goal_Cross_Zone_Checkpoint_Announce }
    GoalManager_WinGoal \{ name = Z_EL_Goal_Gaps100 }
endscript

script M_ZELDTGAPS102_Init 
    wait \{ 4 frames }
    if GoalManager_GoalExists \{ name = Z_ELDT_Goal_Gaps102 }
        GoalManager_ActivateGoal \{ name = Z_ELDT_Goal_Gaps102 }
    else
        Z_ELDT_ADDGOAL_Chopper_Chase
        init_goal_manager
        GoalManager_UnlockGoal \{ name = Z_ELDT_Goal_Gaps102 }
        GoalManager_EditGoal \{name = Z_ELDT_Goal_Gaps102 params = { passive_start }}
        GoalManager_ActivateGoal \{ name = Z_ELDT_Goal_Gaps102 }
    endif
endscript

script Z_ELDT_ADDGOAL_Chopper_Chase 
    AddGoal_Gaps {
        version = 102
        zone = 'z_eldt'
        cross_zone
        goal_text = 'Wróæ do Orodka'
        view_goals_text = 'Wróæ do Orodka'
        goal_description = 'Wróæ do Orodka'
        can_retry_goal
        skater = custom
        no_success_messages
        goal_flags = [ got_1
         ]
        pro = 'Murphy'
        full_name = 'Murphy'
        unlocked_by_another
        dont_move_skater_on_start
        trigger_obj_id = Z_EL_TRG_G_Gaps100_PRO
        restart_node = Z_ELDT_TRG_G_Gaps102_RESTARTNode
        start_skater_rolling
        show_goal_timer
        time = 30
        goal_deactivate_script = M_ZELDTGAPS102_Deactivate
        pak_info = {
            prefix = 'M_ZELDTGAPS102'
            gameplay
        }
    }
endscript

script M_ZELDTGAPS102_Deactivate 
    if NOT GoalManager_HasWonGoal \{ name = Z_ELDT_Goal_Gaps102 }
        printf \{ 'M_ZELDTGAPS102_LoseGoal' }
        skater ::TeleportSkaterToNode \{ nodeName = Z_ELDT_TRG_G_Gaps102_RESTARTNode }
        SpawnScriptLater \{ M_ZELDTGAPS102_Init }
    endif
endscript

script M_ZELDTGAPS102_Gameplay_WinGoal 
    printf \{ 'M_ZELDTGAPS102_Gameplay_WinGoal' }
    SpawnScriptLater \{ M_ZDTGAPS101_Init }
    if NOT cd
        FinishPendingZoneLoads
        ChangeNodeFlag \{ NODEFLAG_Z_DT_INITIALIZEGRAFFITIAREA_BEFORE 0 }
    endif
    SpawnScriptLater \{ Goal_Cross_Zone_Checkpoint_Announce }
    GoalManager_WinGoal \{ name = Z_ELDT_Goal_Gaps102 }
endscript

script M_ZDTGAPS101_Init 
    wait \{ 4 frames }
    if GoalManager_GoalExists \{ name = Z_DT_Goal_Gaps101 }
        GoalManager_ActivateGoal \{ name = Z_DT_Goal_Gaps101 }
    else
        Z_DT_ADDGOAL_Chopper_Chase
        init_goal_manager
        GoalManager_UnlockGoal \{ name = Z_DT_Goal_Gaps101 }
        GoalManager_EditGoal \{name = Z_DT_Goal_Gaps101 params = { passive_start }}
        GoalManager_ActivateGoal \{ name = Z_DT_Goal_Gaps101 }
    endif
endscript

script Z_DT_ADDGOAL_Chopper_Chase 
    AddGoal_Gaps {
        version = 101
        zone = 'z_dt'
        goal_text = 'Wróæ do Orodka'
        view_goals_text = 'Wróæ do Orodka'
        goal_description = 'Wróæ do Orodka'
        can_retry_goal
        skater = custom
        no_success_messages
        goal_flags = [ got_1
         ]
        pro = 'Murphy'
        full_name = 'Murphy'
        unlocked_by_another
        dont_move_skater_on_start
        trigger_obj_id = Z_DT_TRG_G_Gaps101_PRO
        restart_node = Z_DT_TRG_G_Gaps101_RESTARTNode
        start_skater_rolling
        dont_show_goal_text
        show_goal_timer
        time = 60
        goal_gameplay_start_script = Z_DT_GOAL_Gaps101_Start
        goal_deactivate_script = Z_DT_GOAL_Gaps101_Deactivate
        pak_info = {
            prefix = 'M_ZDTGAPS101'
            gameplay
        }
    }
endscript

script M_ZDTGAPS101_Gameplay_KillSkater 
    Sk3_KillSkater \{ nodeName = Z_DT_TRG_G_Gaps101_RESTARTNode }
endscript

script Z_DT_GOAL_Gaps101_Start 
    ChangeNodeFlag NODEFLAG_Z_DT_EL_BARRIER 0
    kill_heli
    printf 'Z_DT_GOAL_Gaps101_Start'
    wait 5 frames
    GoalManager_GetDifficultyLevel
    switch <difficulty_level>
        case 0
        create_heli {
            start_pos = (2293.0, 838.0, 13238.599609375)
            spot_count = 150
            velocity = 12
            spot_speed = 6
        }
        case 1
        create_heli {
            start_pos = (2293.0, 838.0, 13238.599609375)
            spot_count = 150
            velocity = 18
            spot_speed = 9
        }
        case 2
        create_heli {
            start_pos = (2293.0, 838.0, 13238.599609375)
            spot_count = 150
            velocity = 21
            spot_speed = 10.50
        }
    endswitch
endscript

script Z_DT_GOAL_Gaps101_Deactivate 
    kill_heli
    if NOT GoalManager_HasWonGoal \{ name = Z_DT_Goal_Gaps101 }
        skater ::TeleportSkaterToNode \{ nodeName = Z_DT_TRG_G_Gaps101_RESTARTNode }
        SpawnScriptLater \{ M_ZDTGAPS101_Init }
    endif
endscript

script M_ZDTGAPS101_LoseGoal 
    GoalManager_LoseGoal \{ name = Z_DT_Goal_Gaps101 }
endscript

script M_ZDTGAPS101_Gameplay_WinGoal 
    SpawnScriptLater \{ M_ZDTHOGAPS104_Init }
    kill_heli
    SpawnScriptLater \{ Goal_Cross_Zone_Checkpoint_Announce }
    GoalManager_WinGoal \{ name = Z_DT_Goal_Gaps101 }
endscript

script M_ZDTGAPS100_Heli_Dummy 
    ClearExceptionGroup \{ Heli_Dummy }
    WaitForEvent \{ type = HelicopterSpottedSkater }
    SpawnScriptLater \{ M_ZDTGAPS101_LoseGoal }
endscript

script M_ZDTHOGAPS104_Init 
    wait \{ 4 frames }
    if GoalManager_GoalExists \{ name = Z_DTHO_Goal_Gaps104 }
        GoalManager_ActivateGoal \{ name = Z_DTHO_Goal_Gaps104 }
    else
        Z_DTHO_ADDGOAL_Chopper_Chase
        init_goal_manager
        GoalManager_UnlockGoal \{ name = Z_DTHO_Goal_Gaps104 }
        GoalManager_EditGoal \{name = Z_DTHO_Goal_Gaps104 params = { passive_start }}
        GoalManager_ActivateGoal \{ name = Z_DTHO_Goal_Gaps104 }
    endif
endscript

script Z_DTHO_ADDGOAL_Chopper_Chase 
    AddGoal_Gaps {
        version = 104
        zone = 'z_dtho'
        cross_zone
        no_success_messages
        goal_text = 'Wróæ do Orodka'
        view_goals_text = 'Wróæ do Orodka'
        goal_description = 'Wróæ do Orodka'
        can_retry_goal
        skater = custom
        goal_flags = [ got_1
         ]
        pro = 'Murphy'
        full_name = 'Murphy'
        unlocked_by_another
        dont_move_skater_on_start
        trigger_obj_id = Z_DT_TRG_G_Gaps101_PRO
        restart_node = Z_DTHO_TRG_G_Gaps104_RESTARTNode
        start_skater_rolling
        show_goal_timer
        time = 30
        goal_deactivate_script = M_ZDTHOGAPS104_Deactivate
        pak_info = {
            prefix = 'M_ZDTHOGAPS104'
            gameplay
        }
    }
endscript

script M_ZDTHOGAPS104_Deactivate 
    if NOT GoalManager_HasWonGoal \{ name = Z_DTHO_Goal_Gaps104 }
        printf \{ 'M_ZDTHOGAPS104_Deactivate' }
        skater ::TeleportSkaterToNode \{ nodeName = Z_DTHO_TRG_G_Gaps104_RESTARTNode }
        SpawnScriptLater \{ M_ZDTHOGAPS104_Init }
    endif
endscript

script M_ZDTHOGAPS104_Gameplay_WinGoal 
    SpawnScriptLater \{ M_ZHOGAPS106_Init }
    if NOT cd
        FinishPendingZoneLoads
    endif
    ChangeNodeFlag \{ NODEFLAG_Z_HO_DT_EVENT 0 }
    GoalManager_WinGoal \{ name = Z_DTHO_Goal_Gaps104 }
endscript

script M_ZHOGAPS106_Init 
    wait \{ 4 frames }
    if GoalManager_GoalExists \{ name = Z_HO_Goal_Gaps106 }
        GoalManager_ActivateGoal \{ name = Z_HO_Goal_Gaps106 }
    else
        Z_HO_ADDGOAL_Chopper_Chase
        init_goal_manager
        GoalManager_UnlockGoal \{ name = Z_HO_Goal_Gaps106 }
        GoalManager_EditGoal \{name = Z_HO_Goal_Gaps106 params = { passive_start }}
        GoalManager_ActivateGoal \{ name = Z_HO_Goal_Gaps106 }
    endif
endscript

script M_ZHOGAPS106_Heli_Dummy 
    ClearExceptionGroup \{ Heli_Dummy }
    WaitForEvent \{ type = HelicopterSpottedSkater }
    SpawnScriptLater \{ M_ZHOGAPS106_LoseGoal }
endscript

script M_ZHOGAPS106_LoseGoal 
    GoalManager_LoseGoal \{ name = Z_HO_Goal_Gaps106 }
endscript

script Z_HO_ADDGOAL_Chopper_Chase 
    AddGoal_Gaps {
        version = 106
        zone = 'z_ho'
        no_success_messages
        goal_text = 'Wróæ do Orodka'
        view_goals_text = 'Wróæ do Orodka'
        goal_description = 'Wróæ do Orodka'
        can_retry_goal
        skater = custom
        goal_flags = [ got_1
         ]
        pro = 'Murphy'
        full_name = 'Murphy'
        unlocked_by_another
        dont_move_skater_on_start
        trigger_obj_id = Z_HO_TRG_G_Gaps106_PRO
        restart_node = Z_HO_TRG_G_Gaps106_RESTARTNode
        start_skater_rolling
        show_goal_timer
        time = 60
        goal_gameplay_start_script = Z_HO_GOAL_Gaps106_Start
        goal_deactivate_script = Z_HO_GOAL_Gaps106_Deactivate
        pak_info = {
            prefix = 'M_ZHOGAPS106'
            gameplay
        }
    }
endscript

script Z_HO_GOAL_Gaps106_Start 
    ChangeNodeFlag NODEFLAG_Z_HO_DINO_BEFORE 0
    kill_heli
    wait 5 frames
    GoalManager_GetDifficultyLevel
    switch <difficulty_level>
        case 0
        create_heli {
            start_pos = (996.5, 557.2000122070312, 2562.60009765625)
            spot_count = 140
            velocity = 13
            spot_speed = 6.500
        }
        case 1
        create_heli {
            start_pos = (996.5, 557.2000122070312, 2562.60009765625)
            spot_count = 140
            velocity = 18
            spot_speed = 9
        }
        case 2
        create_heli {
            start_pos = (996.5, 557.2000122070312, 2562.60009765625)
            spot_count = 140
            velocity = 22
            spot_speed = 11
        }
    endswitch
endscript

script M_ZHOGAPS106_Gameplay_WinGoal 
    printf \{ 'M_ZHOGAPS106_Gameplay_WinGoal' }
    SpawnScriptLater \{ M_ZHOBHGAPS105_Init }
    kill_heli
    SpawnScriptLater \{ Goal_Cross_Zone_Checkpoint_Announce }
    GoalManager_WinGoal \{ name = Z_HO_Goal_Gaps106 }
endscript

script Z_HO_GOAL_Gaps106_Deactivate 
    kill_heli
    if NOT GoalManager_HasWonGoal \{ name = Z_HO_Goal_Gaps106 }
        skater ::TeleportSkaterToNode \{ nodeName = Z_HO_TRG_G_Gaps106_RESTARTNode }
        SpawnScriptLater \{ M_ZHOGAPS106_Init }
    endif
endscript

script M_ZHOBHGAPS105_Init 
    wait \{ 4 frames }
    if GoalManager_GoalExists \{ name = Z_HOBH_Goal_Gaps105 }
        GoalManager_ActivateGoal \{ name = Z_HOBH_Goal_Gaps105 }
    else
        Z_HOBH_ADDGOAL_Chopper_Chase
        init_goal_manager
        GoalManager_UnlockGoal \{ name = Z_HOBH_Goal_Gaps105 }
        GoalManager_EditGoal \{name = Z_HOBH_Goal_Gaps105 params = { passive_start }}
        GoalManager_ActivateGoal \{ name = Z_HOBH_Goal_Gaps105 }
    endif
endscript

script Z_HOBH_ADDGOAL_Chopper_Chase 
    AddGoal_Gaps {
        version = 105
        zone = 'z_hobh'
        cross_zone
        goal_text = 'Wróæ do Orodka'
        view_goals_text = 'Wróæ do Orodka'
        goal_description = 'Wróæ do Orodka'
        can_retry_goal
        skater = custom
        goal_flags = [ got_1
         ]
        pro = 'Murphy'
        full_name = 'Murphy'
        unlocked_by_another
        no_success_messages
        dont_move_skater_on_start
        trigger_obj_id = Z_HO_TRG_G_Gaps106_PRO
        restart_node = Z_HOBH_TRG_G_Gaps105_RESTARTNode
        start_skater_rolling
        show_goal_timer
        time = 30
        goal_deactivate_script = Z_HOBH_GOAL_Gaps105_Deactivate
        pak_info = {
            prefix = 'M_ZHOBHGAPS105'
            gameplay
        }
    }
endscript

script Z_HOBH_GOAL_Gaps105_Deactivate 
    if NOT GoalManager_HasWonGoal \{ name = Z_HOBH_Goal_Gaps105 }
        printf \{ 'M_ZDTHOGAPS104_Deactivate' }
        skater ::TeleportSkaterToNode \{ nodeName = Z_HOBH_TRG_G_Gaps105_RESTARTNode }
        SpawnScriptLater \{ M_ZHOBHGAPS105_Init }
    endif
endscript

script M_ZHOBHGAPS105_Gameplay_WinGoal 
    if NOT cd
        FinishPendingZoneLoads
    endif
    ChangeNodeFlag \{ NODEFLAG_Z_BH_BHSRGATEPRE 0 }
    ChangeNodeFlag \{ NODEFLAG_Z_BH_BHSRGATEPOST 1 }
    SpawnScriptLater \{ M_ZBHGAPS103_Init }
    SpawnScriptLater \{ Goal_Cross_Zone_Checkpoint_Announce }
    GoalManager_WinGoal \{ name = Z_HOBH_Goal_Gaps105 }
endscript

script M_ZBHGAPS103_Init 
    wait \{ 4 frames }
    if GoalManager_GoalExists \{ name = Z_BH_Goal_Gaps103 }
        GoalManager_ActivateGoal \{ name = Z_BH_Goal_Gaps103 }
    else
        Z_BH_ADDGOAL_Chopper_Chase
        init_goal_manager
        GoalManager_UnlockGoal \{ name = Z_BH_Goal_Gaps103 }
        GoalManager_EditGoal \{name = Z_BH_Goal_Gaps103 params = { passive_start }}
        GoalManager_ActivateGoal \{ name = Z_BH_Goal_Gaps103 }
    endif
endscript

script M_ZBHGAPS103_Heli_Dummy 
    ClearExceptionGroup \{ Heli_Dummy }
    WaitForEvent \{ type = HelicopterSpottedSkater }
    SpawnScriptLater \{ M_ZBHGAPS103_LoseGoal }
endscript

script M_ZBHGAPS103_LoseGoal 
    GoalManager_LoseGoal \{ name = Z_BH_Goal_Gaps103 }
endscript

script Z_BH_ADDGOAL_Chopper_Chase 
    AddGoal_Gaps {
        version = 103
        zone = 'z_bh'
        no_success_messages
        goal_text = 'Wróæ do Orodka'
        view_goals_text = 'Wróæ do Orodka'
        goal_description = 'Wróæ do Orodka'
        can_retry_goal
        skater = custom
        goal_flags = [ got_1
         ]
        pro = 'Murphy'
        full_name = 'Murphy'
        unlocked_by_another
        dont_move_skater_on_start
        trigger_obj_id = Z_BH_TRG_G_Gaps103_PRO
        restart_node = Z_BH_TRG_G_Gaps103_RESTARTNode
        start_skater_rolling
        show_goal_timer
        time = 60
        goal_gameplay_start_script = Z_BH_GOAL_Gaps103_Start
        goal_deactivate_script = Z_BH_GOAL_Gaps103_Deactivate
        pak_info = {
            prefix = 'M_ZBHGAPS103'
            gameplay
        }
    }
endscript

script Z_BH_GOAL_Gaps103_Start 
    kill_heli
    wait 5 frames
    GoalManager_GetDifficultyLevel
    switch <difficulty_level>
        case 0
        create_heli {
            start_pos = (-11872.5, 232.3000030517578, 2633.699951171875)
            spot_count = 130
            velocity = 14
            spot_speed = 7
        }
        case 1
        create_heli {
            start_pos = (-11872.5, 232.3000030517578, 2633.699951171875)
            spot_count = 130
            velocity = 18.20
            spot_speed = 9.100
        }
        case 2
        create_heli {
            start_pos = (-11872.5, 232.3000030517578, 2633.699951171875)
            spot_count = 130
            velocity = 22.50
            spot_speed = 11.25
        }
    endswitch
endscript

script Z_BH_GOAL_Gaps103_Deactivate 
    kill_heli
    if NOT GoalManager_HasWonGoal \{ name = Z_BH_Goal_Gaps103 }
        skater ::TeleportSkaterToNode \{ nodeName = Z_BH_TRG_G_Gaps103_RESTARTNode }
        SpawnScriptLater \{ M_ZBHGAPS103_Init }
    endif
endscript

script M_ZBHGAPS103_Gameplay_WinGoal 
    printf \{ 'M_ZBHGAPS103_Gameplay_WinGoal' }
    kill_heli
    SpawnScriptLater \{ M_ZBHSRGAPS107_Init }
    SpawnScriptLater \{ Goal_Cross_Zone_Checkpoint_Announce }
    GoalManager_WinGoal \{ name = Z_BH_Goal_Gaps103 }
endscript

script M_ZBHSRGAPS107_Init 
    wait \{ 4 frames }
    if GoalManager_GoalExists \{ name = Z_BHSR_Goal_Gaps107 }
        GoalManager_ActivateGoal \{ name = Z_BHSR_Goal_Gaps107 }
    else
        Z_BHSR_ADDGOAL_Chopper_Chase
        init_goal_manager
        GoalManager_UnlockGoal \{ name = Z_BHSR_Goal_Gaps107 }
        GoalManager_EditGoal \{name = Z_BHSR_Goal_Gaps107 params = { passive_start }}
        GoalManager_ActivateGoal \{ name = Z_BHSR_Goal_Gaps107 }
    endif
endscript

script Z_BHSR_ADDGOAL_Chopper_Chase 
    AddGoal_Gaps {
        version = 107
        zone = 'z_bhsr'
        cross_zone
        goal_text = 'Wróæ do Orodka'
        view_goals_text = 'Wróæ do Orodka'
        goal_description = 'Wróæ do Orodka'
        can_retry_goal
        skater = custom
        goal_flags = [ got_1
         ]
        pro = 'Murphy'
        full_name = 'Murphy'
        unlocked_by_another
        dont_move_skater_on_start
        trigger_obj_id = Z_BH_TRG_G_Gaps103_PRO
        restart_node = Z_BHSR_TRG_G_Gaps107_RESTARTNode
        success_restart_node = Z_SR_restart_default
        start_skater_rolling
        show_goal_timer
        time = 30
        goal_gameplay_start_script = Z_BHSR_GOAL_Gaps107_Start
        goal_deactivate_script = Z_BHSR_GOAL_Gaps107_Deactivate
        goal_post_success_script = Z_BHSR_GOAL_Gaps107_PostSuccess
        pak_info = {
            prefix = 'M_ZBHSRGAPS107'
            gameplay
        }
    }
endscript

script Z_BHSR_GOAL_Gaps107_PostSuccess 
    ChangeNodeFlag \{ NODEFLAG_FINAL_GOAL 1 }
    tod_manager_el_force_night_off
endscript

script M_ZBHSRGAPS107_Heli_Dummy 
    ClearExceptionGroup \{ Heli_Dummy }
    WaitForEvent \{ type = HelicopterSpottedSkater }
    SpawnScriptLater \{ M_ZBHSRGAPS107_LoseGoal }
endscript

script M_ZBHSRGAPS107_LoseGoal 
    GoalManager_LoseGoal \{ name = Z_BHSR_Goal_Gaps107 }
endscript

script Z_BHSR_GOAL_Gaps107_Start 
    kill_heli
    wait 5 frames
    GoalManager_GetDifficultyLevel
    switch <difficulty_level>
        case 0
        create_heli {
            start_pos = (-18134.900390625, 964.0, 3233.5)
            spot_count = 140
            velocity = 15
            spot_speed = 7.500
        }
        case 1
        create_heli {
            start_pos = (-18134.900390625, 964.0, 3233.5)
            spot_count = 140
            velocity = 18.50
            spot_speed = 9.0
        }
        case 2
        create_heli {
            start_pos = (-18134.900390625, 964.0, 3233.5)
            spot_count = 140
            velocity = 23
            spot_speed = 11.50
        }
    endswitch
endscript

script Z_BHSR_GOAL_Gaps107_Deactivate 
    kill_heli
    if NOT GoalManager_HasWonGoal \{ name = Z_BHSR_Goal_Gaps107 }
        skater ::TeleportSkaterToNode \{ nodeName = Z_BHSR_TRG_G_Gaps107_RESTARTNode }
        SpawnScriptLater \{ M_ZBHSRGAPS107_Init }
    endif
endscript

script M_ZBHSRGAPS107_Gameplay_WinGoal 
    kill_heli
    if NOT cd
        FinishPendingZoneLoads
    endif
    GoalManager_WinGoal \{ name = Z_BHSR_Goal_Gaps107 }
endscript

script CrossZone_ADDGOAL_Chopper_Chase 
    AddGoal_Gaps {
        version = 100
        zone = 'z_el'
        cross_zone
        goal_text = str_z_el_goal_gaps100
        view_goals_text = str_z_el_goal_gaps100
        goal_description = str_z_el_goal_gaps100
        can_retry_goal
        skater = custom
        goal_flags = [ got_1
         ]
        pro = 'Murphy'
        full_name = 'Murphy'
        intro_scene = M_ZELGAPS100_Start_IGC_Scene
        no_success_messages
        trigger_obj_id = Z_EL_TRG_G_Gaps100_PRO
        restart_node = Z_EL_TRG_G_Gaps100_RESTARTNode
        show_goal_timer
        time = 60
        goal_gameplay_start_script = CrossZone_ChopperChase_Start
        goal_deactivate_script = CrossZone_ChopperChase_Deactivate
        goal_start_script = CrossZone_ChopperChase_SetNodeFlags
        goal_post_success_script = CrossZone_ChopperChase_Post_Success
        pak_info = {
            prefix = 'M_ZELGAPS100'
            start
            gameplay
        }
        ped_floater = (story_goals_ped_floater)
    }
endscript

script CrossZone_ChopperChase_WinGoal 
    printf \{ 'CrossZone_ChopperChase_WinGoal' }
    GoalManager_WinGoal \{ name = Z_EL_Goal_Gaps100 }
endscript

script CrossZone_ChopperChase_Post_Success 
    ChangeNodeFlag \{ NODEFLAG_FINAL_GOAL 1 }
    tod_manager_el_force_night_off
endscript

script CrossZone_ChopperChase_SetNodeFlags 
    ChangeNodeFlag NODEFLAG_Z_DT_INITIALIZEGRAFFITIAREA_BEFORE 0
    ChangeNodeFlag NODEFLAG_Z_DT_EL_BARRIER 0
    ChangeNodeFlag NODEFLAG_Z_HO_DT_EVENT 0
    ChangeNodeFlag NODEFLAG_Z_HO_DINO_BEFORE 0
    ChangeNodeFlag NODEFLAG_Z_BH_BHSRGATEPRE 0
    ChangeNodeFlag NODEFLAG_Z_BH_BHSRGATEPOST 1
    ChangeNodeFlag NODEFLAG_Z_SR_CREW_UNLOCKSR 0
    ChangeNodeFlag NODEFLAG_Z_SR_CREW_SKITCH 0
    ChangeNodeFlag NODEFLAG_Z_SR_CREW_SR5 0
    ChangeNodeFlag NODEFLAG_Z_SR_CREW_SR6 0
    ChangeNodeFlag NODEFLAG_Z_SR_CREW_DINOIGC 0
    ChangeNodeFlag NODEFLAG_Z_SR_CREW_BUYDINO 1
    ChangeNodeFlag NODEFLAG_Z_SR_CRANE 0
    ChangeNodeFlag NODEFLAG_Z_SR_CRANE_DEF 1
    ChangeNodeFlag NODEFLAG_Z_SR_CRANE_TOP 0
    ChangeNodeFlag NODEFLAG_Z_SR_CRANE_SNAKE 0
    ChangeNodeFlag NODEFLAG_Z_SR_SNAKE 1
    ChangeNodeFlag NODEFLAG_Z_SR_SNAKE_DEF 0
endscript

script CrossZone_ChopperChase_Start 
    kill_heli
    printf 'CrossZone_ChopperChase_Start'
    GetCurrentZoneName
    switch <zone_name>
        case 'z_el'
        printf 'Z_EL'
        SpawnScriptLater CrossZone_Chopper_CreateHeli_EL
        case 'z_eldt'
        Kill name = M_ZELGAPS100_Gameplay_TRGP_WinGoalGaps_TransELDT
        SpawnScriptLater CrossZone_Chopper_CreatePeds_ELDT
        case 'z_dtel'
        Kill name = M_ZELGAPS100_Gameplay_TRGP_WinGoalGaps_TransDTEL
        SpawnScriptLater CrossZone_Chopper_CreatePeds_DTEL
        case 'z_dt'
        printf 'Z_DT'
        Kill name = M_ZELGAPS100_Gameplay_TRGP_WinGoalGaps_DT
        SpawnScriptLater CrossZone_Chopper_CreatePeds_DT
        SpawnScriptLater CrossZone_Chopper_CreateHeli_DT
        case 'z_dtho'
        printf 'Z_DTHO'
        Kill name = M_ZELGAPS100_Gameplay_TRGP_WinGoalGaps_DTHO
        SpawnScriptLater CrossZone_Chopper_CreatePeds_DTHO
        case 'z_hodt'
        printf 'Z_HODT'
        Kill name = M_ZELGAPS100_Gameplay_TRGP_WinGoalGaps_HODT
        SpawnScriptLater CrossZone_Chopper_CreatePeds_HODT
        case 'z_ho'
        printf 'Z_HO'
        Kill name = M_ZELGAPS100_Gameplay_TRGP_WinGoalGaps_HO
        SpawnScriptLater CrossZone_Chopper_CreatePeds_HO
        SpawnScriptLater CrossZone_Chopper_CreateHeli_HO
        case 'z_hobh'
        Kill name = M_ZELGAPS100_Gameplay_TRGP_WinGoalGaps_HOBH
        SpawnScriptLater CrossZone_Chopper_CreatePeds_HOBH
        case 'z_bhho'
        Kill name = M_ZELGAPS100_Gameplay_TRGP_WinGoalGaps_BHHO
        SpawnScriptLater CrossZone_Chopper_CreatePeds_BHHO
        case 'z_bh'
        Kill name = M_ZELGAPS100_Gameplay_TRGP_WinGoalGaps_BH
        SpawnScriptLater CrossZone_Chopper_CreatePeds_BH
        SpawnScriptLater CrossZone_Chopper_CreateHeli_BH
        case 'z_bhsr'
        printf 'Z_BHSR'
        Kill name = M_ZELGAPS100_Gameplay_TRGP_WinGoalGaps_BHSR
        SpawnScriptLater CrossZone_Chopper_CreatePeds_BHSR
        SpawnScriptLater CrossZone_Chopper_CreateHeli_BHSR
        case 'z_srbh'
        printf 'Z_SRBH'
        Kill name = M_ZELGAPS100_Gameplay_TRGP_WinGoalGaps_SRBH
        SpawnScriptLater CrossZone_Chopper_CreatePeds_SRBH
        SpawnScriptLater CrossZone_Chopper_CreateHeli_SRBH
    endswitch
endscript

script CrossZone_ChopperChase_Deactivate 
    printf \{ 'CrossZone_ChopperChase_Deactivate' }
    kill_heli
    <continue> = 1
    GoalManager_GetGoalParams \{ name = Z_EL_Goal_Gaps100 }
    if GotParam \{ just_won_goal }
        <continue> = 0
    endif
    if GoalManager_HasWonGoal \{ name = Z_EL_Goal_Gaps100 }
        <continue> = 0
    endif
    GetCurrentZoneName
    if (<zone_name> = 'z_sr')
        <continue> = 0
    endif
    if (<continue> = 1)
        SpawnScriptLater \{ CrossZone_ChopperChase_Activate }
    endif
endscript

script CrossZone_ChopperChase_Activate 
    printf 'CrossZone_ChopperChase_Activate'
    wait 4 frames
    if NOT GoalManager_GoalExists name = Z_EL_Goal_Gaps100
        return 
    endif
    begin 
    if NOT GoalManager_GoalIsActive name = Z_EL_Goal_Gaps100
        break 
    endif
    wait 1 frame
    repeat 
    if NOT GoalManager_GoalExists name = Z_EL_Goal_Gaps100
        return 
    endif
    GetCurrentZoneName
    if (<zone_name> = 'z_sr')
        printf 'Hey, you are in the skate ranch'
        return 
    else
        printf 'Not in skate ranch'
    endif
    GoalManager_EditGoal name = Z_EL_Goal_Gaps100 params = { passive_start }
    GoalManager_ActivateGoal name = Z_EL_Goal_Gaps100
endscript

script CrossZone_Chopper_NextZone 
    kill_heli
    if GotParam checkpoint
        SpawnScriptLater Goal_Cross_Zone_Checkpoint_Announce
    endif
    GetCurrentZoneName
    switch <zone_name>
        case 'z_eldt'
        printf 'Create Blocker peds'
        printf 'Create Kill planes'
        CrossZone_Chopper_CreatePeds_ELDT
        GoalManager_EditGoal name = Z_EL_Goal_Gaps100 params = {passive_start
            restart_node = Z_ELDT_TRG_G_Gaps102_RESTARTNode
            time = 30
        }
        GoalManager_SetGoalTimer name = Z_EL_Goal_Gaps100 time = 30
        case 'z_dtel'
        printf 'Create Blocker peds'
        printf 'Create Kill planes'
        CrossZone_Chopper_CreatePeds_DTEL
        GoalManager_EditGoal name = Z_EL_Goal_Gaps100 params = {passive_start
            restart_node = Z_DTEL_TRG_Restart_ChopperChase
            time = 30
        }
        case 'z_dt'
        printf 'Create Blocker peds'
        printf 'Create Kill planes'
        CrossZone_Chopper_CreatePeds_DT
        CrossZone_Chopper_CreateHeli_DT
        GoalManager_EditGoal name = Z_EL_Goal_Gaps100 params = {passive_start
            restart_node = Z_DT_TRG_G_Gaps101_RESTARTNode
            time = 60
        }
        GoalManager_SetGoalTimer name = Z_EL_Goal_Gaps100 time = 60
        case 'z_dtho'
        CrossZone_Chopper_CreatePeds_DTHO
        GoalManager_EditGoal name = Z_EL_Goal_Gaps100 params = {passive_start
            restart_node = Z_DTHO_TRG_G_Gaps104_RESTARTNode
            time = 30
        }
        GoalManager_SetGoalTimer name = Z_EL_Goal_Gaps100 time = 30
        case 'z_hodt'
        printf 'Create Blocker peds'
        printf 'Create Kill planes'
        CrossZone_Chopper_CreatePeds_HODT
        GoalManager_EditGoal name = Z_EL_Goal_Gaps100 params = {passive_start
            restart_node = Z_HODT_TRG_HODT_ChopperChase_Restart
            time = 30
        }
        case 'z_ho'
        printf 'Create Blocker peds'
        printf 'Create Kill planes'
        CrossZone_Chopper_CreatePeds_HO
        CrossZone_Chopper_CreateHeli_HO
        GoalManager_EditGoal name = Z_EL_Goal_Gaps100 params = {passive_start
            restart_node = Z_HO_TRG_G_Gaps106_RESTARTNode
            time = 60
        }
        GoalManager_SetGoalTimer name = Z_EL_Goal_Gaps100 time = 60
        case 'z_hobh'
        CrossZone_Chopper_CreatePeds_HOBH
        GoalManager_EditGoal name = Z_EL_Goal_Gaps100 params = {passive_start
            restart_node = Z_HOBH_TRG_G_Gaps105_RESTARTNode
            time = 30
        }
        GoalManager_SetGoalTimer name = Z_EL_Goal_Gaps100 time = 30
        case 'z_bhho'
        CrossZone_Chopper_CreatePeds_BHHO
        GoalManager_EditGoal name = Z_EL_Goal_Gaps100 params = {passive_start
            restart_node = Z_BHHO_TRG_BHHO_ChopperChase_Restart
            time = 30
        }
        case 'z_bh'
        CrossZone_Chopper_CreatePeds_BH
        CrossZone_Chopper_CreateHeli_BH
        GoalManager_EditGoal name = Z_EL_Goal_Gaps100 params = {passive_start
            restart_node = Z_BH_TRG_G_Gaps103_RESTARTNode
            time = 60
        }
        GoalManager_SetGoalTimer name = Z_EL_Goal_Gaps100 time = 60
        case 'z_bhsr'
        CrossZone_Chopper_CreatePeds_BHSR
        CrossZone_Chopper_CreateHeli_BHSR
        GoalManager_EditGoal name = Z_EL_Goal_Gaps100 params = {passive_start
            restart_node = Z_BHSR_TRG_G_Gaps107_RESTARTNode
            time = 30
        }
        GoalManager_SetGoalTimer name = Z_EL_Goal_Gaps100 time = 30
        case 'z_srbh'
        CrossZone_Chopper_CreatePeds_SRBH
        CrossZone_Chopper_CreateHeli_SRBH
        GoalManager_EditGoal name = Z_EL_Goal_Gaps100 params = {passive_start
            restart_node = Z_SRBH_TRG_Restart_chopperchase
            time = 30
        }
    endswitch
    Kill name = <name>
endscript

script CrossZone_Chopper_CreatePeds_ELDT 
    wait \{ 5 frames }
    if NOT IsCreated \{ M_ZELGAPS100_Gameplay_TRG_Ped_Cop_Blocker_ELDT }
        Create \{ name = M_ZELGAPS100_Gameplay_TRG_Ped_Cop_Blocker_ELDT }
    endif
    if NOT IsCreated \{ M_ZELGAPS100_Gameplay_TRGP_KillskaterCops_ELDT }
        Create \{ name = M_ZELGAPS100_Gameplay_TRGP_KillskaterCops_ELDT }
    endif
endscript

script CrossZone_Chopper_CreatePeds_DTEL 
    wait \{ 5 frames }
    if NOT IsCreated \{ M_ZELGAPS100_Gameplay_TRG_Ped_Cop_Blocker_DTEL }
        Create \{ name = M_ZELGAPS100_Gameplay_TRG_Ped_Cop_Blocker_DTEL }
    endif
    if NOT IsCreated \{ M_ZELGAPS100_Gameplay_TRGP_KillskaterCops_DTEL }
        Create \{ name = M_ZELGAPS100_Gameplay_TRGP_KillskaterCops_DTEL }
    endif
endscript

script CrossZone_Chopper_CreatePeds_DT 
    wait \{ 5 frames }
    if NOT IsCreated \{ M_ZELGAPS100_Gameplay_TRG_Ped_Cop_Blocker_DT }
        Create \{ name = M_ZELGAPS100_Gameplay_TRG_Ped_Cop_Blocker_DT }
    endif
    if NOT IsCreated \{ M_ZELGAPS100_Gameplay_TRGP_KillskaterCops_DT }
        Create \{ name = M_ZELGAPS100_Gameplay_TRGP_KillskaterCops_DT }
    endif
endscript

script CrossZone_Chopper_CreatePeds_DTHO 
    wait \{ 5 frames }
    if NOT IsCreated \{ M_ZELGAPS100_Gameplay_TRG_Ped_Cop_Blocker_DTHO }
        Create \{ name = M_ZELGAPS100_Gameplay_TRG_Ped_Cop_Blocker_DTHO }
    endif
    if NOT IsCreated \{ M_ZELGAPS100_Gameplay_TRGP_KillskaterCops_DTHO }
        Create \{ name = M_ZELGAPS100_Gameplay_TRGP_KillskaterCops_DTHO }
    endif
endscript

script CrossZone_Chopper_CreatePeds_HODT 
    wait \{ 5 frames }
    if NOT IsCreated \{ M_ZELGAPS100_Gameplay_TRG_Ped_Cop_Blocker_HODT }
        Create \{ name = M_ZELGAPS100_Gameplay_TRG_Ped_Cop_Blocker_HODT }
    endif
    if NOT IsCreated \{ M_ZELGAPS100_Gameplay_TRGP_KillskaterCops_HODT }
        Create \{ name = M_ZELGAPS100_Gameplay_TRGP_KillskaterCops_HODT }
    endif
endscript

script CrossZone_Chopper_CreatePeds_HO 
    wait \{ 5 frames }
    if NOT IsCreated \{ M_ZELGAPS100_Gameplay_TRG_Ped_Cop_Blocker_HO }
        Create \{ name = M_ZELGAPS100_Gameplay_TRG_Ped_Cop_Blocker_HO }
    endif
    if NOT IsCreated \{ M_ZELGAPS100_Gameplay_TRGP_KillskaterCops_HO }
        Create \{ name = M_ZELGAPS100_Gameplay_TRGP_KillskaterCops_HO }
    endif
endscript

script CrossZone_Chopper_CreatePeds_HOBH 
    wait \{ 5 frames }
    if NOT IsCreated \{ M_ZELGAPS100_Gameplay_TRG_Ped_Cop_Blocker_HOBH }
        Create \{ name = M_ZELGAPS100_Gameplay_TRG_Ped_Cop_Blocker_HOBH }
    endif
    if NOT IsCreated \{ M_ZELGAPS100_Gameplay_TRGP_KillskaterCops_HOBH }
        Create \{ name = M_ZELGAPS100_Gameplay_TRGP_KillskaterCops_HOBH }
    endif
endscript

script CrossZone_Chopper_CreatePeds_BHHO 
    wait \{ 5 frames }
    if NOT IsCreated \{ M_ZELGAPS100_Gameplay_TRG_Ped_Cop_Blocker_BHHO }
        Create \{ name = M_ZELGAPS100_Gameplay_TRG_Ped_Cop_Blocker_BHHO }
    endif
    if NOT IsCreated \{ M_ZELGAPS100_Gameplay_TRGP_KillskaterCops_BHHO }
        Create \{ name = M_ZELGAPS100_Gameplay_TRGP_KillskaterCops_BHHO }
    endif
endscript

script CrossZone_Chopper_CreatePeds_BH 
    wait \{ 5 frames }
    if NOT IsCreated \{ M_ZELGAPS100_Gameplay_TRG_Ped_Cop_Blocker_BH }
        Create \{ name = M_ZELGAPS100_Gameplay_TRG_Ped_Cop_Blocker_BH }
    endif
    if NOT IsCreated \{ M_ZELGAPS100_Gameplay_TRGP_KillskaterCops_BH }
        Create \{ name = M_ZELGAPS100_Gameplay_TRGP_KillskaterCops_BH }
    endif
endscript

script CrossZone_Chopper_CreatePeds_BHSR 
    wait \{ 5 frames }
    if NOT IsCreated \{ M_ZELGAPS100_Gameplay_TRG_Ped_Cop_Blocker_BHSR }
        Create \{ name = M_ZELGAPS100_Gameplay_TRG_Ped_Cop_Blocker_BHSR }
    endif
    if NOT IsCreated \{ M_ZELGAPS100_Gameplay_TRGP_KillskaterCops_BHSR }
        Create \{ name = M_ZELGAPS100_Gameplay_TRGP_KillskaterCops_BHSR }
    endif
endscript

script CrossZone_Chopper_CreatePeds_SRBH 
    wait \{ 5 frames }
    if NOT IsCreated \{ M_ZELGAPS100_Gameplay_TRG_Ped_Cop_Blocker_SRBH }
        Create \{ name = M_ZELGAPS100_Gameplay_TRG_Ped_Cop_Blocker_SRBH }
    endif
    if NOT IsCreated \{ M_ZELGAPS100_Gameplay_TRGP_KillskaterCops_SRBH }
        Create \{ name = M_ZELGAPS100_Gameplay_TRGP_KillskaterCops_SRBH }
    endif
endscript

script CrossZone_Chopper_CreateHeli_EL 
    kill_heli
    wait 5 frames
    printf 'CrossZone_Chopper_CreateHeli_EL'
    GoalManager_GetDifficultyLevel
    switch <difficulty_level>
        case 0
        create_heli {
            start_pos = (16855.69921875, 1883.0, 10509.7001953125)
            spot_count = 180
            velocity = 12
            spot_speed = 6
        }
        case 1
        create_heli {
            start_pos = (16855.69921875, 1883.0, 10509.7001953125)
            spot_count = 180
            velocity = 16
            spot_speed = 8
        }
        case 2
        create_heli {
            start_pos = (16855.69921875, 1883.0, 10509.7001953125)
            spot_count = 180
            velocity = 20
            spot_speed = 10
        }
    endswitch
endscript

script CrossZone_Chopper_CreateHeli_DT 
    kill_heli
    wait 5 frames
    printf 'CrossZone_Chopper_CreateHeli_DT'
    GoalManager_GetDifficultyLevel
    switch <difficulty_level>
        case 0
        create_heli {
            start_pos = (2293.0, 838.0, 13238.599609375)
            spot_count = 150
            velocity = 12
            spot_speed = 6
        }
        case 1
        create_heli {
            start_pos = (2293.0, 838.0, 13238.599609375)
            spot_count = 150
            velocity = 18
            spot_speed = 9
        }
        case 2
        create_heli {
            start_pos = (2293.0, 838.0, 13238.599609375)
            spot_count = 150
            velocity = 21
            spot_speed = 10.50
        }
    endswitch
endscript

script CrossZone_Chopper_CreateHeli_HO 
    kill_heli
    wait 5 frames
    printf 'CrossZone_Chopper_CreateHeli_HO'
    GoalManager_GetDifficultyLevel
    switch <difficulty_level>
        case 0
        create_heli {
            start_pos = (996.5, 557.2000122070312, 2562.60009765625)
            spot_count = 140
            velocity = 13
            spot_speed = 6.500
        }
        case 1
        create_heli {
            start_pos = (996.5, 557.2000122070312, 2562.60009765625)
            spot_count = 140
            velocity = 18
            spot_speed = 9
        }
        case 2
        create_heli {
            start_pos = (996.5, 557.2000122070312, 2562.60009765625)
            spot_count = 140
            velocity = 22
            spot_speed = 11
        }
    endswitch
endscript

script CrossZone_Chopper_CreateHeli_BH 
    kill_heli
    wait 5 frames
    printf 'CrossZone_Chopper_CreateHeli_BH'
    GoalManager_GetDifficultyLevel
    switch <difficulty_level>
        case 0
        create_heli {
            start_pos = (-11872.5, 232.3000030517578, 2633.699951171875)
            spot_count = 130
            velocity = 14
            spot_speed = 7
        }
        case 1
        create_heli {
            start_pos = (-11872.5, 232.3000030517578, 2633.699951171875)
            spot_count = 130
            velocity = 18.20
            spot_speed = 9.100
        }
        case 2
        create_heli {
            start_pos = (-11872.5, 232.3000030517578, 2633.699951171875)
            spot_count = 130
            velocity = 22.50
            spot_speed = 11.25
        }
    endswitch
endscript

script CrossZone_Chopper_CreateHeli_BHSR 
    kill_heli
    wait 5 frames
    printf 'CrossZone_Chopper_CreateHeli_BHSR'
    GoalManager_GetDifficultyLevel
    switch <difficulty_level>
        case 0
        create_heli {
            start_pos = (-18134.900390625, 964.0, 3233.5)
            spot_count = 140
            velocity = 15
            spot_speed = 7.500
        }
        case 1
        create_heli {
            start_pos = (-18134.900390625, 964.0, 3233.5)
            spot_count = 140
            velocity = 18.50
            spot_speed = 9.0
        }
        case 2
        create_heli {
            start_pos = (-18134.900390625, 964.0, 3233.5)
            spot_count = 140
            velocity = 20
            spot_speed = 10
        }
    endswitch
endscript

script CrossZone_Chopper_CreateHeli_SRBH 
    kill_heli
    wait 5 frames
    printf 'CrossZone_Chopper_CreateHeli_SRBH'
    GoalManager_GetDifficultyLevel
    switch <difficulty_level>
        case 0
        create_heli {
            start_pos = (-22965.19921875, 1406.300048828125, 9215.5)
            spot_count = 140
            velocity = 15
            spot_speed = 7.500
        }
        case 1
        create_heli {
            start_pos = (-22965.19921875, 1406.300048828125, 9215.5)
            spot_count = 140
            velocity = 18.50
            spot_speed = 9.0
        }
        case 2
        create_heli {
            start_pos = (-22965.19921875, 1406.300048828125, 9215.5)
            spot_count = 140
            velocity = 20
            spot_speed = 10
        }
    endswitch
endscript
