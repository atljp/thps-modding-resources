
generic_pro_name = 'peds/PedPros/PedPro_Neversoft/PedPro_Neversoft.skin'
generic_pro_first_name = 'Neversoft'
generic_pro_full_name = 'Neversoft Skater'
goal_want_to_save_volume = 0
goal_bind_retry_to_select = 0
max_number_of_special_trickslots = 11
goal_utility_allow_end_goal_name = null

script goal_init 
    GoalManager_GetGoalParams name = <goal_id>
    if GotParam trigger_obj_id
        GoalManager_InitGoalTrigger name = <goal_id>
    endif
    if GotParam init_geo_prefix
        Create prefix = <init_geo_prefix>
    else
        if GotParam init_geo_prefixes
            GetArraySize <init_geo_prefixes>
            <index> = 0
            begin 
            Create prefix = (<init_geo_prefixes> [ <index> ])
            <index> = (<index> + 1)
            repeat <array_size>
        endif
    endif
    if GotParam init_script
        <init_script> <init_script_params>
    endif
endscript

cur_tod_cur_action = set_tod_day

script goal_passive_start 
    GoalManager_GetGoalParams name = <goal_id>
    GetCurrentLevel
    if ChecksumEquals a = <level> b = load_sk5ed
        GoalManager_EditGoal name = <goal_id> params = { testing_goal }
    endif
    if InNetGame
        GoalManager_AnnounceGoalStarted name = <goal_id>
    endif
    if GotParam custom_score_record
        GoalManager_EditGoal name = <goal_id> params = { custom_score_record = 0 }
    endif
    if GotParam edited_goal
        if GotParam control_type
            if NOT ((<control_type> = skate)|| (<control_type> = walk))
                GoalManager_GetLevelPrefix
                FormatText checksumname = ReadyLevelScript '%l_KillVehicles' l = <level_prefix>
                if ScriptExists <ReadyLevelScript>
                    <ReadyLevelScript>
                endif
            endif
        endif
    endif
    if GotParam use_hud_counter
        goal_create_counter goal_id = <goal_id> hud_counter_caption = <hud_counter_caption>
    endif
    if GotParam goal_start_script
        <goal_start_script> <goal_start_script_params>
    endif
    <trigger_exists> = 0
    if GotParam trigger_obj_id
        if NodeExists <trigger_obj_id>
            <trigger_exists> = 1
        endif
    endif
    if (<trigger_exists> = 1)
        if GotParam kill_radius
            <trigger_obj_id> ::obj_setouterradius <kill_radius>
            <trigger_obj_id> ::Obj_SetException Ex = objectoutofradius scr = goal_crossed_kill_radius params = { goal_id = <goal_id> }
        endif
    endif
endscript


script goal_start 
    GoalManager_GetGoalParams name = <goal_id>
    if GotParam play_goal_start_sound
        ALL_Levels_SFX_Start_Goal
    endif
    <trigger_exists> = 0
    if GotParam trigger_obj_id
        if NodeExists <trigger_obj_id>
            <trigger_exists> = 1
        endif
    endif
    GetCurrentLevel
    if ChecksumEquals a = <level> b = load_sk5ed
        GoalManager_EditGoal name = <goal_id> params = { testing_goal }
    endif
    if NOT GameModeEquals is_classic
        if GotParam reset_score
            ResetScore
        endif
        if ((GotParam start_cam_anim)|| (GotParam start_cam_anims))
            skater ::vibrate Off
            KillAllTextureSplats
        endif
        destroy_goal_panel_messages
    endif
    KillSpawnedScript name = goal_wait_and_show_key_combo_text
    KillSpawnedScript name = SK3_Killskater_Finish use_proper_version
    if (<trigger_exists> = 1)
        if NOT GotParam quick_start
            kill_start_key_binding
        endif
    endif
    if (<trigger_exists> = 1)
        if NOT IsAlive name = <trigger_obj_id>
            GoalManager_EditGoal name = <goal_id> params = { force_create_trigger = 1 }
            GoalManager_InitializeGoal name = <goal_id>
            GoalManager_EditGoal name = <goal_id> params = { force_create_trigger = 0 }
            GoalManager_GetGoalParams name = <goal_id>
        endif
    endif
    if InNetGame
        GoalManager_AnnounceGoalStarted name = <goal_id>
    endif
    if (<trigger_exists> = 1)
        <trigger_obj_id> ::Obj_ClearExceptions
        TerminateObjectsScripts id = <trigger_obj_id> script_name = goal_pro_wait_and_reset_avoid_exception
        TerminateObjectsScripts id = <trigger_obj_id> script_name = goal_set_trigger_exceptions
    endif
    if GotParam custom_score_record
        GoalManager_EditGoal name = <goal_id> params = { custom_score_record = 0 }
    endif
    if ObjectExists id = goal_start_dialog
        speech_box_exit anchor_id = goal_start_dialog
    endif
    if ObjectExists id = goal_retry_anchor
        DestroyScreenElement id = goal_retry_anchor
    endif
    FormatText checksumname = arrow_id '%s_ped_arrow' s = <goal_name>
    if ScreenElementExists id = <arrow_id>
        DestroyScreenElement id = <arrow_id>
    endif
    KillSpawnedScript name = goal_init_after_end_of_run
    if NOT IsObserving
        GetSkaterId
        KillSkaterCamAnim skaterid = <ObjID> all
    endif
    GoalManager_GetGoalParams name = <goal_id>
    if GotParam geo_prefix
        goal_create_geo_prefix geo_prefix = <geo_prefix>
    else
        if GotParam geo_prefixes
            GetArraySize <geo_prefixes>
            <index> = 0
            begin 
            goal_create_geo_prefix geo_prefix = (<geo_prefixes> [ <index> ])
            <index> = (<index> + 1)
            repeat <array_size>
        endif
    endif
    if NOT GameModeEquals is_classic
        if NOT IsObserving
            skater ::runstarted
        endif
        if ((GotParam quick_start)|| (GameModeEquals is_creategoals))
            goal_initialize_skater <...> 
            Debounce x time = 0.3000
        endif
    endif
    if GotParam goal_intro_script
        <goal_intro_script> <goal_intro_script_params>
    endif
    GoalManager_GetGoalParams name = <goal_id>
    if NOT InNetGame
        goal_create_proset_geom <...> 
    endif
    if GotParam edited_goal
        if GotParam control_type
            if NOT ((<control_type> = skate)|| (<control_type> = walk))
                GoalManager_GetLevelPrefix
                FormatText checksumname = ReadyLevelScript '%l_KillVehicles' l = <level_prefix>
                if ScriptExists <ReadyLevelScript>
                    <ReadyLevelScript>
                endif
            endif
        endif
    endif
    if (Inside_Light_Rain = 1)
        if issoundplaying TestLight01
            setsoundparams TestLight01 vol = LightRainVolume
        endif
        change Paused_Light_Rain = 0
        change Inside_Light_Rain = 0
    endif
    if (Inside_Heavy_Rain = 1)
        if issoundplaying TestLight02
            setsoundparams TestLight02 vol = LightRainVolume
        endif
        if issoundplaying TestMedium02
            setsoundparams TestMedium02 vol = MediumRainVolume
        endif
        change Paused_Heavy_Rain = 0
        change Inside_Heavy_Rain = 0
    endif
    if GotParam trigger_prefix
        Create prefix = <trigger_prefix>
    endif
    if GotParam quick_start
        if (<trigger_exists> = 1)
            if GotParam hide_goal_pro
                <trigger_obj_id> ::obj_invisible
            endif
        endif
        if GotParam use_hud_counter
            goal_create_counter goal_id = <goal_id> hud_counter_caption = <hud_counter_caption>
        endif
        if NOT GotParam dont_show_goal_text
            create_panel_block id = current_goal text = <goal_text> style = panel_message_goal parent = root_window
            if GotParam key_combo_text
                SpawnScript goal_wait_and_show_key_combo_text params = { text = <key_combo_text> }
            endif
        endif
        if GotParam goal_start_script
            <goal_start_script> <goal_start_script_params>
        endif
        if NOT GoalManager_HasWonGoal name = <goal_id>
            SpawnScript goal_show_tips params = { goal_id = <goal_id> }
        endif
        if (<trigger_exists> = 1)
            goal_pro_stop_anim_scripts <...> 
        endif
        if (<trigger_exists> = 1)
            if NOT GotParam trigger_wait_script
                <trigger_wait_script> = GenericProWaiting
            endif
            <trigger_obj_id> ::obj_spawnscript <trigger_wait_script> params = {type = 'midgoal' goal_id = <goal_id> pro = <pro>}
        endif
        FireEvent type = goal_cam_anim_post_start_done
    else
        if (<trigger_exists> = 1)
            goal_pro_stop_anim_scripts <...> 
            if GotParam trigger_start_script
                <trigger_obj_id> ::obj_spawnscript <trigger_start_script> params = {goal_id = <goal_id> type = 'talking' pro = <pro>}
            else
                <trigger_obj_id> ::obj_spawnscript GenericProTalking params = {goal_id = <goal_id> type = 'talking' pro = <pro>}
            endif
            if NOT GotParam trigger_wait_script
                <trigger_wait_script> = GenericProWaiting
            endif
            if GotParam goal_start_movie_script
                <goal_start_movie_script> <goal_start_movie_script_params>
            endif
            if GotParam no_play_hold
                <no_play_hold> = no_play_hold
            endif
            SpawnScript goal_cam_anim_play id = new_goal_cam_anim params = {goal_id = <goal_id>
                next_trigger_script = <trigger_wait_script>
                type = 'midgoal'
                <no_play_hold>
                dont_unpause = <dont_unpause>
            }
        else
            if GotParam goal_start_script
                <goal_start_script> <goal_start_script_params>
            endif
        endif
    endif
    if (<trigger_exists> = 1)
        if GotParam kill_radius
            <trigger_obj_id> ::obj_setouterradius <kill_radius>
            <trigger_obj_id> ::Obj_SetException Ex = objectoutofradius scr = goal_crossed_kill_radius params = { goal_id = <goal_id> }
        endif
    endif
endscript


script goal_create_geo_prefix 
    Create prefix = <geo_prefix>
    FormatText textname = geo_trigger_prefix 'TRG_%p' p = <geo_prefix>
    Create prefix = <geo_trigger_prefix>
    GoalManager_GetProsetNotPrefix <geo_prefix>
    Kill prefix = <proset_not_prefix>
    FormatText textname = geo_not_trigger_prefix 'TRG_%p' p = <proset_not_prefix>
    Kill prefix = <geo_not_trigger_prefix>
endscript


script goal_kill_geo_prefix 
    Kill prefix = <geo_prefix>
    FormatText textname = geo_trigger_prefix 'TRG_%p' p = <geo_prefix>
    Kill prefix = <geo_trigger_prefix>
    GoalManager_GetProsetNotPrefix <geo_prefix>
    Create prefix = <proset_not_prefix>
    FormatText textname = geo_not_trigger_prefix 'TRG_%p' p = <proset_not_prefix>
    Create prefix = <geo_not_trigger_prefix>
endscript


script goal_create_proset_geom 
    if GotParam proset_prefix
        FormatText checksumname = proset_flag 'FLAG_%pGEO_ON' p = <proset_prefix>
        SetFlag flag = <proset_flag>
        Create prefix = <proset_prefix>
        FormatText textname = proset_trigger_prefix 'TRG_%p' p = <proset_prefix>
        Create prefix = <proset_trigger_prefix>
        GoalManager_GetProsetNotPrefix <proset_prefix>
        Kill prefix = <proset_not_prefix>
        FormatText textname = proset_not_trigger_prefix 'TRG_%p' p = <proset_not_prefix>
        Kill prefix = <proset_not_trigger_prefix>
    endif
endscript


script goal_kill_proset_geom 
    if GotParam proset_prefix
        FormatText checksumname = proset_flag 'FLAG_%pGEO_ON' p = <proset_prefix>
        UnSetFlag flag = <proset_flag>
        Kill prefix = <proset_prefix>
        FormatText textname = proset_trigger_prefix 'TRG_%p' p = <proset_prefix>
        Kill prefix = <proset_trigger_prefix>
        GoalManager_GetProsetNotPrefix <proset_prefix>
        Create prefix = <proset_not_prefix>
        FormatText textname = proset_not_trigger_prefix 'TRG_%p' p = <proset_not_prefix>
        Create prefix = <proset_not_trigger_prefix>
    endif
endscript


script goal_crossed_kill_radius 
    create_panel_message id = goal_message text = 'You left the goal area!' style = panel_message_generic_loss
    Obj_ClearException objectoutofradius
    GoalManager_LoseGoal name = <goal_id>
endscript


script goal_expire 
    destroy_goal_panel_messages
    create_panel_message id = goal_message text = 'Out of time!' style = panel_message_generic_loss
    if GoalManager_EndRunCalled name = <goal_id>
        if GoalManager_StartedEndOfRun name = <goal_id>
            SpawnSkaterScript goal_init_after_end_of_run params = { goal_id = <goal_id> }
        else
            GoalManager_ClearEndRun name = <goal_id>
        endif
    endif
endscript


script goal_success goal_text = 'Default goal success text'
    if NOT InNetGame
        kill_start_key_binding
    endif
    goal_destroy_counter
    GoalManager_GetGoalParams name = <goal_id>
    <trigger_exists> = 0
    if GotParam trigger_obj_id
        if NodeExists <trigger_obj_id>
            <trigger_exists> = 1
        endif
    endif
    if NOT GotParam testing_goal
        GoalEditor ::FlagGoalAsWon goal_id = <goal_id>
    endif
    if GotParam goal_outro_script
        <goal_outro_script> <goal_outro_script_params>
    endif
    if ObjectExists id = goal_message
        RunScriptOnScreenElement id = goal_message kill_panel_message
    endif
    if (<trigger_exists> = 1)
        goal_pro_stop_anim_scripts <...> 
        if ObjectExists id = <trigger_obj_id>
            if GotParam trigger_success_script
                <trigger_obj_id> ::obj_spawnscript <trigger_success_script> params = {goal_id = <goal_id> pro = <pro> type = 'Success'}
            else
                <trigger_obj_id> ::obj_spawnscript GenericProSuccess params = {goal_id = <goal_id> pro = <pro> type = 'Success'}
            endif
        endif
        if NOT GotParam trigger_wait_script
            <trigger_wait_script> = GenericProWaiting
        endif
    endif
    <already_beat_goal> = 0
    if GoalManager_HasWonGoal name = <goal_id>
        <already_beat_goal> = 1
    endif
    if NOT (<already_beat_goal> = 1)
        if GotParam reward_trickslot
            if NOT GotParam already_added_trickslot
                GoalManager_EditGoal name = <goal_id> params = { just_added_trickslot = 1 }
                GetSkaterProfileInfoByName name = custom
                if (<max_specials> < max_number_of_special_trickslots)
                    AwardSpecialTrickslot
                endif
            endif
        endif
    endif
    SpawnScript goal_success_messages params = <...> 
    if GameModeEquals is_classic
        SpawnScript classic_mode_check_for_all_complete_message
    endif
    if NOT InMultiPlayerGame
        <played_success_movie> = 0
        if ((GotParam success_cam_anim)|| (GotParam success_cam_anims))
            <played_success_movie> = 1
            change check_for_unplugged_controllers = 0
            SpawnScript goal_cam_anim_play params = {goal_id = <goal_id>
                just_won_goal = 1
                gonna_show_message
                already_beat_goal = <already_beat_goal>
            }
        endif
        if (<played_success_movie> = 0)
            SpawnScript goal_success_no_anims params = <...> 
        endif
    else
        if NOT InNetGame
            restore_start_key_binding
        endif
        if GotParam goal_success_script
            <goal_success_script> <goal_success_params>
        endif
    endif
endscript


script goal_success_no_anims 
    goal_cam_anim_post_cleanup <...> 
    goal_cam_anim_post_success dont_kill_messages <...> 
endscript

goal_panel_total_messages_queued = 0
goal_panel_current_message = 1
goal_panel_queue_size = 0

script goal_panel_wait_and_reset_queue 
    wait 2 seconds
    change goal_panel_current_message = (goal_panel_current_message + 1)
    change goal_panel_queue_size = (goal_panel_queue_size -1)
    wait 5 seconds
    goal_panel_reset_queue
endscript


script goal_panel_reset_queue 
    change goal_panel_queue_size = 0
    change goal_panel_total_messages_queued = 0
    change goal_panel_current_message = 1
    KillSpawnedScript name = goal_panel_wait_for_my_turn
endscript


script goal_panel_wait_for_my_turn 
    if (goal_panel_queue_size > 9)
        goto NullScript
    endif
    change goal_panel_total_messages_queued = (goal_panel_total_messages_queued + 1)
    change goal_panel_queue_size = (goal_panel_queue_size + 1)
    my_turn = (goal_panel_total_messages_queued)
    begin 
    if (<my_turn> = goal_panel_current_message)
        break 
    endif
    wait 1 gameframes
    repeat 
    KillSpawnedScript name = goal_panel_wait_and_reset_queue
    SpawnScript goal_panel_wait_and_reset_queue
endscript


script goal_success_messages 
    goal_panel_wait_for_my_turn
    SpawnScript Goal_Success_Message_Sound
    if GotParam view_goals_text
        create_panel_block id = goal_complete text = <view_goals_text> style = panel_message_goalcomplete
    else
        create_panel_block id = goal_complete text = <goal_text> style = panel_message_goalcomplete
    endif
    create_panel_sprite id = goal_complete_sprite texture = go_done style = panel_sprite_goalcomplete
    create_panel_message id = goal_complete_line2 text = 'Complete!' style = panel_message_goalcompleteline2
    if GotParam reward_trickslot
        if GotParam just_added_trickslot
            if (<just_added_trickslot> = 1)
                GoalManager_EditGoal name = <goal_id> params = { just_added_trickslot = 0 }
                goal_got_trickslot
            endif
        endif
    endif
    if GoalManager_GoalExists name = <goal_id>
        if GoalManager_GetGoalRewardPoints name = <goal_id>
            SpawnScript points_total params = { points = <reward_points> }
        endif
    endif
endscript


script points_total 
    wait 0.7500 seconds
    FormatText textname = message '+%p POINTS' p = <points>
    create_panel_message {
        id = points_message
        text = <message>
        style = goal_points_animation
    }
    SpawnScript SK6_SFX_ShowPointsFromGoal
    update_goal_points_display refresh
endscript


script goal_points_animation 
    setprops rgba = [ 128 109 9 128 ]
    DoMorph time = 0 Pos = (320.0, 85.0) Scale = 5 alpha = 0
    DoMorph time = 0.1000 Scale = 1.800 alpha = 1 rot_angle = 0
    DoMorph time = 0.06000 Pos = (322.0, 88.0) rot_angle = 3
    DoMorph time = 0.06000 Pos = (318.0, 82.0) rot_angle = -2
    DoMorph time = 0.06000 Pos = (322.0, 88.0) rot_angle = 4
    DoMorph time = 0.05000 Pos = (318.0, 82.0) rot_angle = -3
    DoMorph time = 0.05000 Pos = (322.0, 88.0) rot_angle = 2
    DoMorph time = 0.05000 Pos = (318.0, 82.0) rot_angle = 0
    wait 0.2000 second
    DoMorph time = 0.5000 Pos = (320.0, 30.0) alpha = 0
    Die
endscript


script goal_fail_messages 
    goal_panel_wait_for_my_turn
    if NOT GoalManager_GoalExists name = <goal_id>
        return 
    endif
    playsound GoalFail vol = 200
    GoalManager_GetGoalParams name = <goal_id>
    if GotParam goal_fail_script
        <goal_fail_script> <goal_fail_script_params>
    endif
    create_panel_sprite id = goalfail_sprite texture = go_fail style = panel_sprite_goalfail
    if GotParam view_goals_text
        create_panel_block dims = (640.0, 0.0) id = GoalFail text = <view_goals_text> style = panel_message_goalfail
    else
        create_panel_block dims = (640.0, 0.0) id = GoalFail text = <goal_text> style = panel_message_goalfail
    endif
    create_panel_message id = goalfailedline2 text = 'Failed!' style = panel_message_goalfailline2
    if IsXbox
        retry_text = 'Press \b8 to retry goal'
    else
        retry_text = 'Press START (\b8) to retry goal'
    endif
endscript


script goal_lose_next_frame 
    
    wait 1 frame
    if GoalManager_GoalIsActive name = <goal_id>
        
        GoalManager_LoseGoal name = <goal_id>
    endif
endscript


script goal_fail 
    if GotParam no_fail_messages
        return 
    endif
    SpawnScript goal_fail_messages params = { <...>  }
endscript


script goal_uninit 
    GoalManager_GetGoalParams name = <goal_id>
    goal_kill_proset_geom <...> 
    <trigger_exists> = 0
    if GotParam trigger_obj_id
        if NodeExists <trigger_obj_id>
            <trigger_exists> = 1
        endif
    endif
    if NOT GotParam testing_goal
        if NOT GotParam dont_kill_trigger_on_success
            if (<trigger_exists> = 1)
                if IsAlive name = <trigger_obj_id>
                    GoalManager_StopLastStream name = <goal_id>
                    GoalManager_UnloadLastFam name = <goal_id>
                    Kill name = <trigger_obj_id>
                endif
            endif
        endif
    endif
    if GotParam init_geo_prefix
        Kill prefix = <init_geo_prefix>
    else
        if GotParam init_geo_prefixes
            GetArraySize <init_geo_prefixes>
            <index> = 0
            begin 
            Kill prefix = (<init_geo_prefixes> [ <index> ])
            <index> = (<index> + 1)
            repeat <array_size>
        endif
    endif
endscript


script goal_deactivate 
    GoalManager_GetGoalParams name = <goal_id>
    <trigger_exists> = 0
    if GotParam trigger_obj_id
        if NodeExists <trigger_obj_id>
            if IsAlive name = <trigger_obj_id>
                <trigger_exists> = 1
            endif
        endif
    endif
    if GameModeEquals is_goal_attack
        KillSpawnedScript name = goal_cam_anim_play
        KillSpawnedScript name = goal_cam_anim_play_single_element
        KillSpawnedScript name = TemporarilyDisableInput
        KillSkaterCamAnim all
        restore_skater_camera
        speech_box_exit anchor_id = goal_description_anchor no_pad_start
        if NOT IsObserving
            skater ::netenableplayerinput
        endif
        SetButtonEventMappings unblock_menu_input
        restore_start_key_binding
        if NOT IsObserving
            if NOT GoalManager_CanStartGoal
                MakeSkaterGoto ongroundai
            endif
        endif
        GoalManager_SetCanStartGoal 1
    endif
    KillAllTextureSplats
    KillSpawnedScript name = goal_show_tips
    KillSpawnedScript name = goal_wait_and_show_key_combo_text
    goal_destroy_counter
    if GoalManager_EndRunCalled name = <goal_id>
        if GoalManager_StartedEndOfRun name = <goal_id>
            SpawnSkaterScript goal_init_after_end_of_run params = { goal_id = <goal_id> }
        else
            GoalManager_ClearEndRun name = <goal_id>
        endif
    endif
    GoalManager_StopLastStream name = <goal_id>
    GoalManager_UnloadLastFam name = <goal_id>
    if GotParam quick_start
        GoalManager_EditGoal name = <goal_id> params = { last_start_was_quick_start = 1 }
    else
        GoalManager_EditGoal name = <goal_id> params = { last_start_was_quick_start = 0 }
    endif
    if GotParam goal_intro_script
        KillSpawnedScript name = goal_intro_script
    endif
    if GotParam goal_deactivate_script
        <goal_deactivate_script> <goal_deactivate_script_params>
    endif
    KillSpawnedScript name = goal_description_and_speech
    KillSpawnedScript name = goal_wait_for_cam_anim
    if ScreenElementExists id = current_goal
        DestroyScreenElement id = current_goal
    endif
    if ScreenElementExists id = current_goal_key_combo_text
        DestroyScreenElement id = current_goal_key_combo_text
    endif
    if ObjectExists id = current_goal_description
        DestroyScreenElement id = current_goal_description
    endif
    if NOT GotParam quick_start
        if (<trigger_exists> = 1)
            if NOT GotParam just_won_goal
                goal_pro_stop_anim_scripts <...> 
                if GotParam trigger_wait_script
                    <trigger_obj_id> ::obj_spawnscript <trigger_wait_script> params = {goal_id = <goal_id> pro = <pro>}
                else
                    <trigger_obj_id> ::obj_spawnscript GenericProWaiting params = {goal_id = <goal_id> type = 'wait' pro = <pro>}
                endif
            endif
        endif
    endif
    if GotParam control_type
        if NOT ((<control_type> = skate)|| (<control_type> = walk))
            if GotParam exit_node
                ResetSkaters node_name = <exit_node>
            else
                ResetSkaters node_name = <restart_node>
            endif
            MakeSkaterGoto HandBrake
            if GameIsPaused
                skater ::Pause
            endif
            if GotParam edited_goal
                GoalManager_GetLevelPrefix
                FormatText checksumname = ReadyLevelScript '%l_CreateVehicles' l = <level_prefix>
                if ScriptExists <ReadyLevelScript>
                    <ReadyLevelScript>
                endif
            endif
        endif
    endif
    if GotParam geo_prefix
        goal_kill_geo_prefix geo_prefix = <geo_prefix>
    else
        if GotParam geo_prefixes
            GetArraySize <geo_prefixes>
            <index> = 0
            begin 
            goal_kill_geo_prefix geo_prefix = (<geo_prefixes> [ <index> ])
            <index> = (<index> + 1)
            repeat <array_size>
        endif
    endif
    if GotParam trigger_prefix
        Kill prefix = <trigger_prefix>
    endif
    if NOT GotParam quick_start
        if (<trigger_exists> = 1)
            <trigger_obj_id> ::obj_visible
        endif
        GoalManager_ShowGoalPoints
        if NOT IsTrue ALWAYSPLAYMUSIC
            if NOT GoalManager_HasWonGoal name = <goal_id>
                PauseMusic 1
            endif
        endif
    endif
    if (<trigger_exists> = 1)
        if NOT GotParam just_won_goal
            if NOT GotParam quick_start
                if NOT GoalManager_HasWonGoal name = <goal_id>
                    goal_add_ped_arrow goal_id = <goal_id>
                endif
            endif
        endif
    endif
    if GoalManager_HasWonGoal name = <goal_id>
        if NOT GotParam quick_start
            if GotParam just_won_goal
            else
                GoalManager_UninitializeGoal name = <goal_id>
            endif
        endif
    endif
endscript


script goal_retry_select_handler 
    if (goal_bind_retry_to_select = 1)
        if GoalManager_CanStartGoal
            RetryCurrentGoal
        endif
    endif
endscript


script RetryCurrentGoal 
    if GoalManager_CanRetryGoal
        GoalManager_RestartLastGoal
    else
    endif
endscript


script end_current_goal_run 
    wait 1 gameframe
    if ObjectExists id = goal_message
        RunScriptOnScreenElement id = goal_message kill_panel_message
    endif
    if GoalManager_HasActiveGoals
        GoalManager_DeactivateAllGoals
    endif
endscript


script ready_skater_for_early_end_current_goal 
    if InNetGame
        if GotParam net
            return 
        endif
    endif
    if InSplitScreenGame
        return 
    endif
    if IsObserving
        return 
    endif
    if GameModeEquals is_classic
        return 
    endif
    if NOT ObjectExists id = skater
        return 
    endif
    if skater ::IsInEndOfRun
        ResetSkaters node_name = <restart_node>
    endif
endscript

goal_cam_anim_offsets = [
    {targetOffset = (0.0, 46.79999923706055, 0.0) positionOffset = (9.600000381469727, 10.800000190734863, 75.5999984741211)}
    {targetOffset = (1.2000000476837158, 62.400001525878906, 0.0) positionOffset = (-2.4000000953674316, 0.0, 26.399999618530273)}
    {targetOffset = (3.5999999046325684, 57.599998474121094, 0.0) positionOffset = (-7.199999809265137, -31.200000762939453, 70.80000305175781)}
    {targetOffset = (8.399999618530273, 49.20000076293945, 1.2000000476837158) positionOffset = (-8.399999618530273, 30.0, 63.599998474121094)}
    {targetOffset = (-24.0, 58.79999923706055, 13.199999809265137) positionOffset = (51.599998474121094, -2.4000000953674316, 91.19999694824219)}
    {targetOffset = (30.0, 58.79999923706055, 20.399999618530273) positionOffset = (-56.400001525878906, -2.4000000953674316, 85.19999694824219)}
    {targetOffset = (30.0, 58.79999923706055, 20.399999618530273) positionOffset = (-56.400001525878906, -2.4000000953674316, 85.19999694824219)}
    {targetOffset = (-20.399999618530273, 43.20000076293945, 32.400001525878906) positionOffset = (100.80000305175781, 6.0, 63.599998474121094)}
    {targetOffset = (30.0, -14.399999618530273, 2.4000000953674316) positionOffset = (-36.0, 148.8000030517578, 446.3999938964844)}
    {targetOffset = (12.0, -25.200000762939453, -9.600000381469727) positionOffset = (312.0, 159.60000610351562, 366.0)}
    {targetOffset = (7.199999809265137, 4.800000190734863, 21.600000381469727) positionOffset = (-420.0, 128.39999389648438, 129.60000610351562)}
]

script goal_cam_anim_play 
    GoalManager_GetGoalParams name = <goal_id>
    goal_cam_anim_pre_cleanup <...> 
    if GotParam just_won_goal
        if GotParam success_cam_anim
            <anim> = <success_cam_anim>
        else
            if GotParam success_cam_anims
                <anims> = <success_cam_anims>
            else
                <virtual_cam> = virtual_cam
            endif
        endif
        goal_cam_anim_pre_success <...> 
        just_won_goal = just_won_goal
    else
        if GotParam start_cam_anim
            <anim> = <start_cam_anim>
        else
            if GotParam start_cam_anims
                <anims> = <start_cam_anims>
            else
                if ((GotParam pro)& (GotParam view_goals_cameras))
                    if StringEquals a = 'Arcade Machine' b = <pro>
                        use_view_goals_cameras_for_intro = 1
                    endif
                    if StringEquals a = 'Boombox' b = <pro>
                        use_view_goals_cameras_for_intro = 1
                    endif
                endif
                <virtual_cam> = virtual_cam
            endif
        endif
        goal_cam_anim_pre_start <...> 
    endif
    hide_speech_boxes
    GetSkaterId
    <skaterid> = <ObjID>
    if NOT GotParam no_cam_anim
        if GotParam anims
            GetArraySize <anims>
            <index> = 0
            begin 
            if (<index> = (<array_size> - 1))
                <last_anim> = 1
            else
                <last_anim> = 0
            endif
            goal_cam_anim_play_single_element {(<anims> [ <index> ])
                goal_id = <goal_id>
                anim_index = <index>
                last_anim = <last_anim>
                <just_won_goal>
                cam_anim_index = <index>
            }
            <index> = (<index> + 1)
            repeat <array_size>
        else
            goal_cam_anim_play_single_element <...> last_anim = 1 cam_anim_index = 0
        endif
    endif
    goal_cam_anim_post_cleanup <...> 
    if GotParam just_won_goal
        goal_cam_anim_post_success <...> 
    else
        goal_cam_anim_post_start <...> 
    endif
endscript


script goal_cam_anim_pre_cleanup 
    GoalManager_PauseAllGoals
    GetValueFromVolume cdvol
    if NOT InNetGame
        if (<value> > 0)
            <volume> = <value>
            SetMusicVolume 20
        endif
    endif
    if GotParam TrickBeat
        PauseMusic 1
    endif
    if GotParam edited_goal
        skater ::PausePhysics
    endif
    change check_for_unplugged_controllers = 0
    skater ::statsmanager_deactivategoals
    if InNetGame
        skater ::netdisableplayerinput
    else
        skater ::disableplayerinput
    endif
    GoalManager_SetCanStartGoal 0
    <trigger_exists> = 0
    if GotParam trigger_obj_id
        if NodeExists <trigger_obj_id>
            <trigger_exists> = 1
        endif
    endif
    if (<trigger_exists> = 1)
        if GotParam trigger_obj_id
            if IsAlive name = <trigger_obj_id>
                TerminateObjectsScripts id = <trigger_obj_id> script_name = GenericPro_LookAtSkater use_proper_version
                <trigger_obj_id> ::obj_stoprotating
                <trigger_obj_id> ::Obj_LookAtObject type = skater anglethreshold = 15 Speed = 500 time = 0
            endif
        endif
    endif
    pause_trick_text
    if ScreenElementExists id = the_time
        SetScreenElementProps {
            id = the_time
            hide
        }
    endif
    if GotParam letterbox
        change last_screen_mode = (current_screen_mode)
        if NOT (current_screen_mode = letterbox_screen_mode)
            screen_setup_letterbox
        endif
    endif
    SetButtonEventMappings block_menu_input
    GetSkaterId
    if InNetGame
        <ObjID> ::netdisableplayerinput
    else
        <ObjID> ::disableplayerinput
    endif
    kill_start_key_binding
    SpawnScript TemporarilyDisableInput
    return volume = <volume>
endscript


script goal_cam_anim_post_cleanup 
    change check_for_unplugged_controllers = 1
    restore_start_key_binding
    if GotParam edited_goal
        skater ::UnPausePhysics
    endif
    if InNetGame
        skater ::netenableplayerinput
    else
        skater ::enableplayerinput
    endif
    if NOT GotParam dont_unpause
        GoalManager_UnPauseAllGoals
    endif
    GoalManager_SetCanStartGoal
    skater ::StatsManager_ActivateGoals
    if NOT GotParam TrickBeat
        PauseMusic 0
    endif
    if GotParam volume
        SetMusicVolume (<volume> * 10)
    endif
    speech_box_exit
    if NOT skater ::driving
        UnpauseSkaters
    endif
    unpause_trick_text
    if ScreenElementExists id = the_time
        SetScreenElementProps {
            id = the_time
            unhide
        }
    endif
    <trigger_exists> = 0
    if GotParam trigger_obj_id
        if NodeExists <trigger_obj_id>
            <trigger_exists> = 1
        endif
    endif
    if (<trigger_exists> = 1)
        if GotParam trigger_obj_id
            if IsAlive name = <trigger_obj_id>
                if NOT InNetGame
                    RunScriptOnObject {
                        id = <trigger_obj_id>
                        goal_trigger_reset_avoid_radius_exception
                        params = { goal_id = <goal_id> }
                    }
                endif
                GoalManager_StopLastStream name = <goal_id>
                GoalManager_UnloadLastFam name = <goal_id>
            endif
        endif
        if GotParam next_trigger_script
            goal_pro_stop_anim_scripts <...> 
            if ObjectExists id = <trigger_obj_id>
                <trigger_obj_id> ::obj_spawnscript <next_trigger_script> params = {type = <type> goal_id = <goal_id> pro = <pro>}
            endif
        endif
    endif
    restore_start_key_binding
    FireEvent type = goal_cam_anim_done
    unhide_speech_boxes
    if GotParam letterbox
        if NOT (last_screen_mode = current_screen_mode)
            switch (last_screen_mode)
                case standard_screen_mode
                screen_setup_standard
                case widescreen_screen_mode
                screen_setup_widescreen
                case letterbox_screen_mode
                screen_setup_letterbox
            endswitch
        endif
    endif
    if GotParam show_movie
        if (<show_movie> = 1)
            if GotParam movie_file
                ingame_play_movie <movie_file>
            endif
        endif
    endif
endscript


script goal_cam_anim_pre_success 
    if NOT InMultiPlayerGame
        SetButtonEventMappings block_menu_input
        GetSkaterId
        <ObjID> ::disableplayerinput
        SetScreenElementProps {
            id = root_window
            event_handlers = [{ pad_start NullScript }]
            replace_handlers
        }
        SpawnScript TemporarilyDisableInput
        PauseSkaters
    endif
    skater ::obj_setflag FLAG_SKATER_INGOALINIT
    if GotParam success_node
        ResetSkaters node_name = <success_node>
    endif
    PauseSkaters
    if NOT GotParam dont_hide_skater
        skater ::RemoveSkaterFromWorld
    endif
    if GotParam success_movie_wait_frames
        wait <success_movie_wait_frames> gameframe
    endif
    root_window ::settags giving_rewards = 1
endscript


script goal_cam_anim_post_success 
    skater ::obj_clearflag FLAG_SKATER_INGOALINIT
    if NOT GotParam dont_hide_skater
        skater ::AddSkaterToWorld
    endif
    KillSpawnedScript name = TemporarilyDisableInput
    SetButtonEventMappings unblock_menu_input
    skater ::enableplayerinput
    root_window ::settags giving_rewards = 0
    if NOT GotParam dont_kill_messages
        KillSpawnedScript name = goal_success_messages
        if ScreenElementExists id = goal_complete_sprite
            DestroyScreenElement id = goal_complete_sprite
        endif
        if ScreenElementExists id = goal_complete
            DestroyScreenElement id = goal_complete
        endif
        if ScreenElementExists id = goal_complete_line2
            DestroyScreenElement id = goal_complete_line2
        endif
        if ScreenElementExists id = goal_new_record
            DestroyScreenElement id = goal_new_record
        endif
        if ScreenElementExists id = goal_current_reward
            DestroyScreenElement id = goal_current_reward
        endif
    endif
    if NOT GoalManager_GoalExists name = <goal_id>
        return 
    endif
    goal_uninit goal_id = <goal_id> <...> 
    if GotParam goal_success_script
        <goal_success_script> <goal_success_params>
    endif
    GoalManager_GetNumberOfGoalPoints total
    if (<goal_points> = 129)
        if NOT GetGlobalFlag flag = GOT_ALL_GOALS
        endif
    endif
    if GotParam create_a_trick
        goal_cat_create_menu goal_id = <goal_id>
    endif
endscript


script goal_stage_script_done 
    restore_start_key_binding
endscript


script show_all_goals_done_dlg 
    wait 2 seconds
    pausegame
    SetGlobalFlag flag = GOT_ALL_GOALS
    goal_got_all_goals
    WaitForEvent type = goal_got_all_goals_done
    UnPauseGame
    KillSpawnedScript name = show_all_goals_done_dlg
endscript


script goal_cam_anim_pre_start 
    MakeSkaterGoto Skater_GoalInit
    KillSpawnedScript name = goal_description_and_speech
    KillSpawnedScript name = goal_description_and_speech2
endscript


script goal_cam_anim_post_start 
    if NOT GoalManager_GoalIsActive name = <goal_id>
        FireEvent type = goal_cam_anim_post_start_done
        return 
    endif
    if GotParam use_hud_counter
        goal_create_counter goal_id = <goal_id> hud_counter_caption = <hud_counter_caption>
    endif
    goal_initialize_skater <...> 
    if GotParam goal_start_script
        <goal_start_script> <goal_start_script_params>
    endif
    if GotParam hide_goal_pro
        <trigger_obj_id> ::obj_invisible
    endif
    Debounce x time = 0.3000
    FireEvent type = goal_cam_anim_post_start_done
    broadcastevent type = goal_cam_anim_post_start_done
endscript


script hide_loading_screen 
    hideloadingscreen
endscript


script goal_cam_anim_play_single_element 
    GoalManager_GetGoalParams name = <goal_id>
    KillSpawnedScript name = TemporarilyDisableInput
    SpawnScript TemporarilyDisableInput params = { time = 1000 }
    GetSkaterId
    <skaterid> = <ObjID>
    if GotParam pre_anim_script
        <pre_anim_script> <pre_anim_script_params>
    endif
    if GotParam skater_node
        ResetSkaters node_name = <skater_node>
        MakeSkaterGoto Skater_GoalInit
    endif
    if GotParam walk_into_frame
        if NOT GotParam walk_into_frame_distance
            <walk_into_frame_distance> = 120
        endif
        MakeSkaterGoto Skater_GoalInit params = {walk walk_distance = <walk_into_frame_distance>}
    endif
    <trigger_exists> = 0
    if GotParam trigger_obj_id
        if NodeExists <trigger_obj_id>
            <trigger_exists> = 1
        endif
    endif
    if (<trigger_exists> = 1)
        if GotParam ped_node
            if GotParam trigger_obj_id
                <trigger_obj_id> ::obj_movetonode name = <ped_node> orient
            endif
        endif
        if GotParam trigger_obj_id
            if IsAlive name = <trigger_obj_id>
                <trigger_obj_id> ::obj_stoprotating
                <trigger_obj_id> ::Obj_LookAtObject type = skater anglethreshold = 15 Speed = 50600 time = 0
            endif
        endif
        if GotParam ped_script
            if GotParam trigger_obj_id
                goal_pro_stop_anim_scripts <...> 
                <trigger_obj_id> ::obj_spawnscript <ped_script> params = { goal_id = <goal_id> }
            endif
        endif
    endif
    if NOT GotParam no_play_hold
        <Play_hold> = Play_hold
    endif
    if NOT GotParam skippable
        <skippable> = 1
    endif
    if (<last_anim> = 1)
        if NOT GotParam just_won_goal
            <skippable> = 0
        endif
        <Play_hold> = Play_hold
    endif
    if GotParam virtual_cam
        <anim> = <goal_id>
        <virtual_cam> = virtual_cam
        if (<trigger_exists> = 1)
            if NOT GotParam TargetID
                <trigger_obj_id> ::obj_getid
                <TargetID> = <ObjID>
            endif
        endif
        if NOT ((GotParam targetOffset)& (GotParam positionOffset))
            if GotParam use_view_goals_cameras_for_intro
                RemoveParameter skaterid
                TargetID = world
                element = (<view_goals_cameras> [ 0 ])
            else
                GetRandomArrayElement goal_cam_anim_offsets
            endif
            <targetOffset> = (<element>.targetOffset)
            <positionOffset> = (<element>.positionOffset)
        endif
        if NOT GotParam frames
            <frames> = 120
        endif
    else
        if NOT GotParam anim
            
            script_assert 'No anim specified and no virtual_cam flag present'
        endif
    endif
    DisplayLoadingScreen freeze
    PlaySkaterCamAnim {name = <anim>
        skaterid = <skaterid>
        TargetID = <TargetID>
        targetOffset = <targetOffset>
        positionOffset = <positionOffset>
        frames = <frames>
        <Play_hold>
        skippable = <skippable>
        <virtual_cam>
    }
    Debounce x time = 0.3000
    if GotParam null_goal
        if (<last_anim> = 1)
            <cam_anim_index> = -2
        endif
        <last_anim> = 0
        <skippable> = 1
    endif
    if ((GotParam edited_goal)& (GotParam just_won_goal))
        <last_anim> = 0
        <skippable> = 1
    endif
    <should_use_cam_anim_text> = 1
    if (<last_anim> = 1)
        if NOT GotParam just_won_goal
            <should_use_cam_anim_text> = 0
        endif
    endif
    if (<should_use_cam_anim_text> = 0)
        SpawnScript goal_description_and_speech params = <...> 
    else
        if GotParam cam_anim_text
            if ((GotParam trigger_obj_id)|| (GotParam speaker_obj_id))
                if GotParam just_won_goal
                    GoalManager_PlayGoalWinStream {
                        name = <goal_id>
                        speaker_obj_id = <speaker_obj_id>
                        speaker_name = <speaker_name>
                        cam_anim_index = (<cam_anim_index> + 1)
                    }
                else
                    GoalManager_PlayGoalStartStream {
                        name = <goal_id>
                        speaker_obj_id = <speaker_obj_id>
                        speaker_name = <speaker_name>
                        cam_anim_index = (<cam_anim_index> + 1)
                    }
                endif
            endif
        endif
        if GotParam cam_anim_text
            <display_cam_anim_text> = ''
            if GotParam cam_anim_speaker_name
                FormatText textname = display_cam_anim_text '\ca%s :\c0\n' s = <cam_anim_speaker_name>
            else
                if GotParam full_name
                    FormatText textname = display_cam_anim_text '\ca%s :\c0\n' s = <full_name>
                else
                    if GotParam pro
                        FormatText checksumname = pro_checksum '%s' s = <pro>
                        goal_get_last_name pro = <pro>
                        if GetSkaterLastNameString <pro_checksum>
                            FormatText textname = pro_name_text '\ca%s %l :\c0\n' s = <pro> l = <last_name>
                        endif
                    endif
                endif
            endif
            if IsArray <cam_anim_text>
                GetArraySize <cam_anim_text>
                <index> = 0
                begin 
                FormatText textname = display_cam_anim_text '%s%n' s = <display_cam_anim_text> n = (<cam_anim_text> [ <index> ])
                <index> = (<index> + 1)
                repeat <array_size>
            else
                FormatText textname = display_cam_anim_text '%s%n' s = <display_cam_anim_text> n = <cam_anim_text>
            endif
            if NOT (<skippable> = 0)
                SetSkaterCamAnimSkippable skaterid = <skaterid> name = <anim> skippable = 0
                FormatText textname = display_cam_anim_text '%s\nPress \m0 to continue.' s = <display_cam_anim_text>
                <pad_choose_script> = goal_description_and_speech_continue
                <pad_choose_params> = {no_pad_start anim = <anim> skippable = <skippable>}
            endif
            if ScreenElementExists id = speech_box_anchor
                DestroyScreenElement id = speech_box_anchor
            endif
            kill_start_key_binding
            create_speech_box {
                anchor_id = goal_description_anchor
                text = <display_cam_anim_text>
                Pos = <text_anchor_pos>
                style = speech_box_style
                bg_x_scale = 1.300
                pad_choose_script = <pad_choose_script>
                pad_choose_params = <pad_choose_params>
            }
        else
            <pad_choose_script> = goal_description_and_speech_continue
            <pad_choose_params> = {no_pad_start anim = <anim> skippable = <skippable>}
            create_speech_box {
                anchor_id = goal_description_anchor
                text = 'Press \m0 to continue.'
                Pos = <text_anchor_pos>
                style = speech_box_style
                bg_x_scale = 1.300
                pad_choose_script = <pad_choose_script>
                pad_choose_params = <pad_choose_params>
            }
        endif
    endif
    begin 
    if SkaterCamAnimFinished skaterid = <skaterid> name = <anim>
        if ScreenElementExists id = goal_description_anchor
            DestroyScreenElement id = goal_description_anchor
        endif
        GoalManager_StopLastStream name = <goal_id>
        GoalManager_UnloadLastFam name = <goal_id>
        Debounce x time = 0.3000
        break 
    endif
    wait 1 gameframe
    repeat 
    if GotParam post_anim_script
        <post_anim_script> goal_id = <goal_id> <post_anim_script_params>
    endif
    DisplayLoadingScreen freeze
    wait 1 gameframe
    hideloadingscreen
endscript


script goal_initialize_skater 
    skater ::runstarted
    if NOT GotParam control_type
        NonVehicleControlType = 1
    else
        if ((<control_type> = skate)|| (<control_type> = walk))
            NonVehicleControlType = 1
        endif
    endif
    if GotParam NonVehicleControlType
        switch <control_type>
            case walk
            if GotParam restart_node
                ResetSkaters node_name = <restart_node> RestartWalking
            endif
            case skate
            if GotParam restart_node
                ResetSkaters node_name = <restart_node>
            endif
            if GotParam start_skater_standing
                MakeSkaterGoto HandBrake
            endif
            default 
            if GotParam restart_node
                ResetSkaters node_name = <restart_node>
            endif
            if GotParam start_skater_standing
                MakeSkaterGoto HandBrake
            endif
        endswitch
    else
        GetVehicleSetup control_type = <control_type>
        if NOT GotParam exitable
            if GotParam edited_goal
                MakeSkaterGoto Switch_OnGroundAI params = {NewScript = TransAm VehicleSetup = <VehicleSetup> edited_goal}
            else
                MakeSkaterGoto Switch_OnGroundAI params = {NewScript = TransAm VehicleSetup = <VehicleSetup>}
            endif
        else
            if GotParam edited_goal
                MakeSkaterGoto Switch_OnGroundAI params = {NewScript = TransAm VehicleSetup = <VehicleSetup> exitable edited_goal}
            else
                MakeSkaterGoto Switch_OnGroundAI params = {NewScript = TransAm VehicleSetup = <VehicleSetup> exitable}
            endif
        endif
        if GotParam restart_node
            PlayerVehicle ::Vehicle_MoveToRestart <restart_node>
        endif
        PlayerVehicleCamera ::VehicleCamera_Reset
        SetActiveCamera id = PlayerVehicleCamera
        if GotParam edited_goal
            PlayerVehicle ::Vehicle_Wake
        endif
        if GotParam goal_id
            GoalManager_SetEndRunType name = <goal_id> None
        endif
    endif
endscript


script TemporarilyDisableInput time = 1500
    SetButtonEventMappings block_menu_input
    wait <time>
    SetButtonEventMappings unblock_menu_input
endscript


script goal_wait_and_show_key_combo_text 
    WaitForEvent type = panel_message_goal_done2
    SetScreenElementLock id = current_goal on
    SetScreenElementLock id = current_goal Off
    SetScreenElementLock id = root_window Off
    GetScreenElementPosition id = current_goal
    <screenelementpos> = (<screenelementpos> + (120.0, 0.0))
    GetScreenElementDims id = current_goal
    if ScreenElementExists id = current_goal_key_combo_text
        DestroyScreenElement id = current_goal_key_combo_text
    endif
    CreateScreenElement {
        type = TextBlockElement
        parent = root_window
        id = current_goal_key_combo_text
        dims = (300.0, 0.0)
        allow_expansion
        z_priority = -5
        font = small
        Scale = 1
        rgba = [ 128 128 128 110 ]
        text = <text>
        Pos = (<screenelementpos> + ((0.0, 1.0) * <height> / 0.7800))
        just = [ center top ]
        internal_just = [ center top ]
        Scale = 0.7500
    }
endscript


script hide_key_combo_text 
    if ObjectExists id = current_goal_key_combo_text
        DoScreenElementMorph id = current_goal_key_combo_text time = 0 Scale = 0
    endif
endscript


script unhide_key_combo_text 
    if ObjectExists id = current_goal_key_combo_text
        DoScreenElementMorph id = current_goal_key_combo_text time = 0 Scale = 0.7500
    endif
endscript


script goal_description_and_speech 
    GoalManager_GetGoalParams name = <goal_id>
    if ScreenElementExists id = current_goal
        DestroyScreenElement id = current_goal
    endif
    if ScreenElementExists id = current_goal_key_combo_text
        DestroyScreenElement id = current_goal_key_combo_text
    endif
    if NOT GotParam null_goal
        SpawnScript goal_wait_for_cam_anim params = <...> 
    endif
    <pro_name_text> = ''
    if GotParam cam_anim_speaker_name
        FormatText textname = pro_name_text '\ca%s :\c0\n' s = <cam_anim_speaker_name>
    else
        if GotParam full_name
            FormatText textname = pro_name_text '\ca%s :\c0\n' s = <full_name>
        else
            if GotParam pro
                FormatText checksumname = pro_checksum '%s' s = <pro>
                if GetSkaterLastNameString <pro_checksum>
                    FormatText textname = pro_name_text '\ca%s %l :\c0\n' s = <pro> l = <last_name>
                endif
                if StringEquals a = 'Arcade machine' b = <pro>
                    if GotParam goal_text
                        goal_description = <goal_text>
                    endif
                endif
                if StringEquals a = 'Boombox' b = <pro>
                    if GotParam view_goals_tip
                        goal_description = <view_goals_tip>
                    endif
                endif
            endif
        endif
    endif
    if GotParam goal_description
        if IsArray <goal_description>
            GetArraySize <goal_description>
            <index> = 0
            begin 
            FormatText textname = pro_name_text '%s%n' s = <pro_name_text> n = (<goal_description> [ <index> ])
            <index> = (<index> + 1)
            repeat <array_size>
        else
            FormatText textname = pro_name_text '%s%n' s = <pro_name_text> n = <goal_description>
        endif
        FormatText textname = pro_name_text '%s\nPress \m0 to continue.' s = <pro_name_text>
    endif
    if NOT GotParam just_won_goal
        if GotParam goal_description
            GetSkaterId
            if NOT SkaterCamAnimFinished skaterid = <ObjID> name = <anim>
                if ObjectExists id = speech_box_anchor
                    DestroyScreenElement id = speech_box_anchor
                endif
                create_speech_box {
                    anchor_id = goal_description_anchor
                    text = <pro_name_text>
                    Pos = <text_anchor_pos>
                    style = speech_box_style
                    bg_x_scale = 1.300
                    pad_choose_script = goal_description_and_speech_continue
                    pad_choose_params = {no_pad_start anim = <anim> skippable = 0}
                }
                goal_description_anchor ::settags anim = <anim>
                AssignAlias id = goal_description_anchor alias = current_goal_description
                wait 60 frame
                if NOT SkaterCamAnimFinished skaterid = <ObjID> name = <anim>
                    GoalManager_PlayGoalStartStream {
                        name = <goal_id>
                        speaker_obj_id = <speaker_obj_id>
                        speaker_name = <speaker_name>
                        last_anim
                    }
                endif
            endif
        endif
    endif
endscript


script goal_description_and_speech_continue 
    Debounce x time = 0.3000
    Debounce start time = 0.3000
    <should_kill_anim> = 1
    if ((GotParam anim)& (<should_kill_anim> = 1))
        GetSkaterId
        KillSkaterCamAnim skaterid = <ObjID> name = <anim>
    endif
    if GotParam no_pad_start
        speech_box_exit anchor_id = goal_description_anchor no_pad_start
    else
        speech_box_exit anchor_id = goal_description_anchor
    endif
    FireEvent type = goal_description_and_speech_continue
endscript


script goal_wait_for_cam_anim 
    GetSkaterId
    begin 
    if SkaterCamAnimFinished skaterid = <ObjID> name = <anim>
        SpawnScript goal_show_tips params = { goal_id = <goal_id> }
        if NOT GotParam dont_show_goal_text
            create_panel_block id = current_goal text = <goal_text> style = panel_message_goal parent = root_window params = <...> 
            if GotParam key_combo_text
                SpawnScript goal_wait_and_show_key_combo_text params = { text = <key_combo_text> }
            endif
        endif
        break 
    endif
    wait 10 one_per_frame
    repeat 
endscript


script goal_description_and_speech2 blink_time = 0.05000
    setprops just = [ center top ] internal_just = [ center center ] rgba = [ 128 128 128 128 ]
    DoMorph Pos = (320.0, 114.0) Scale = 0
    DoMorph Pos = (320.0, 114.0) Scale = 1.200 time = 0.1000
    DoMorph Pos = (320.0, 114.0) Scale = 0.8000 time = 0.1000
    DoMorph Pos = (320.0, 114.0) Scale = 1 time = 0.1000
    DoMorph Pos = (320.0, 114.0) Scale = 0.9000 time = 0.05000
    DoMorph Pos = (321.0, 116.0) time = 0.1000
    DoMorph Pos = (319.0, 113.0) time = 0.1000
    DoMorph Pos = (321.0, 115.0) time = 0.1000
    DoMorph Pos = (318.0, 113.0) time = 0.1000
    DoMorph Pos = (321.0, 115.0) time = 0.1000
    DoMorph Pos = (319.0, 113.0) time = 0.1000
    DoMorph Pos = (321.0, 117.0) time = 0.1000
    DoMorph Pos = (319.0, 113.0) time = 0.1000
    DoMorph Pos = (320.0, 120.0) Scale = 1.250 time = 0.1000
    setprops internal_just = [ center top ] rgba = [ 128 128 128 110 ] just = [ RIGHT top ]
    DoMorph Pos = (625.0, 15.0) Scale = 0.7800 time = 0.05000
    RunScriptOnScreenElement id = current_goal blink_current_goal params = { blink_time = <blink_time> }
endscript


script blink_current_goal 
    begin 
    DoMorph alpha = 0
    wait <blink_time> seconds
    DoMorph alpha = 1
    wait <blink_time> seconds
    repeat 6
endscript


script GoalManager_InitGoalTrigger 
    GoalManager_GetGoalParams name = <name>
    if NOT NodeExists <trigger_obj_id>
        return 
    endif
    if NOT IsAlive name = <trigger_obj_id>
        Create name = <trigger_obj_id>
    endif
    <trigger_obj_id> ::settags goal_id = <goal_id>
    if NOT GotParam quick_start
        goal_add_ped_arrow goal_id = <goal_id>
    endif
    goal_pro_stop_anim_scripts <...> 
    <trigger_obj_id> ::obj_spawnscript goal_set_trigger_exceptions params = { goal_id = <goal_id> }
    if GotParam trigger_wait_script
        <trigger_obj_id> ::obj_spawnscript <trigger_wait_script> params = {goal_id = <goal_id> pro = <pro>}
    else
        <trigger_obj_id> ::obj_spawnscript GenericProWaiting params = {goal_id = <goal_id> type = 'wait' pro = <pro>}
    endif
endscript


script goal_add_ped_arrow 
    return 
endscript


script goal_ped_kill_arrow 
    GoalManager_GetGoalParams name = <goal_id>
    FormatText checksumname = arrow_id '%s_ped_arrow' s = <goal_name>
    if ScreenElementExists id = <arrow_id>
        DestroyScreenElement id = <arrow_id>
    endif
endscript


script goal_trigger_wait_and_set_exceptions 
    wait 20 gameframe
    goal_set_trigger_exceptions <...> 
endscript


script goal_set_trigger_exceptions trigger_radius = 16
    if ObjectExists id = goal_start_dialog
        speech_box_exit anchor_id = goal_start_dialog
    endif
    Obj_ClearException objectoutofradius
    obj_setinnerradius <trigger_radius>
    if NOT GotParam dont_bounce_skater
        obj_getid
        SetEventHandlerOnObject {
            object = <ObjID>
            exception
            Ex = objectinradius
            scr = goal_got_trigger
            params = { goal_id = <goal_id> }
        }
    endif
    GoalManager_GetGoalParams name = <goal_id>
    if NOT InNetGame
        if NOT GotParam dont_bounce_skater
            if NOT InNetGame
                obj_spawnscript goal_trigger_reset_avoid_radius_exception params = { goal_id = <goal_id> }
            endif
        endif
    endif
endscript


script goal_pro_bounce_skater Speed = 88
    if NOT SkaterCamAnimFinished
        return 
    endif
    if InNetGame
        return 
    endif
    
    if NOT GotParam ped_id
        obj_getid
        <ped_id> = <ObjID>
    endif
    GetSkaterId
    <skaterid> = <ObjID>
    if NOT <skaterid> ::IsLocalSkater
        return 
    endif
    if <skaterid> ::driving
        return 
    endif
    if (cutscene_is_playing = 1)
        return 
    endif
    if NOT SkaterCamAnimFinished
        return 
    endif
    if SkaterCurrentScorePotGreaterThan 0
        return 
    endif
    <skaterid> ::GetSkaterState
    if NOT (<state> = Skater_OnGround)
        return 
    endif
    if <ped_id> ::ishidden
        return 
    endif
    root_window ::gettags
    if GotParam giving_rewards
        if (<giving_rewards> = 1)
            return 
        endif
    endif
    if <skaterid> ::speedgreaterthan 200
        if GotParam goal_id
            GoalManager_PlayGoalStream name = <goal_id> type = 'avoid' play_random
        endif
        <ped_id> ::Obj_ClearException objectinavoidradius
        <ped_id> ::obj_spawnscript {
            <reset_script>
            params = <...> 
        }
        return 
    endif
    <skaterid> ::gettags
    if NOT (<racemode> = None)
        return 
    endif
    <ped_id> ::Obj_ClearException objectinavoidradius
    <ped_id> ::obj_spawnscript {
        <reset_script>
        params = <...> 
    }
    <should_bounce_skater> = 1
    <ped_id> ::gettags
    <skaterid> ::obj_getorientationtoobject <id>
    if (<dotprod> < 0.0)
        if (<dotprod> > -0.1000)
            <Speed> = 500
            <heading> = 180
        else
            <heading> = 90.0
        endif
    else
        if (<dotprod> < 0.1000)
            <Speed> = 500
            <heading> = 180
        else
            <heading> = -90
        endif
    endif
    <skaterid> ::SkaterAvoidGoalPed heading = <heading> Speed = <Speed>
    if GotParam collision_exception_return_state
        goto <collision_exception_return_state>
    endif
endscript


script goal_pro_wait_and_reset_avoid_exception 
    if InNetGame
        return 
    endif
    wait 20 gameframe
    goal_trigger_reset_avoid_radius_exception <...> 
endscript


script goal_trigger_reset_avoid_radius_exception 
    if InNetGame
        return 
    endif
    GoalManager_GetGoalParams name = <goal_id>
    if GotParam dont_bounce_skater
        return 
    endif
    obj_setinneravoidradius 3
    obj_getid
    SetEventHandlerOnObject {
        object = <ObjID>
        exception
        Ex = objectinavoidradius
        scr = goal_pro_bounce_skater
        params = {
            ped_id = <ObjID>
            goal_id = <goal_id>
            reset_script = goal_pro_wait_and_reset_avoid_exception
        }
    }
endscript


script goal_got_trigger 
    GetSkaterId
    <skaterid> = <ObjID>
    if GoalManager_HasWonGoal name = <goal_id>
        GoalManager_GetGoalParams name = <goal_id>
        if NOT GotParam dont_kill_trigger_on_success
            return 
        endif
    endif
    if GoalManager_GoalIsActive name = <goal_id>
        return 
    endif
    if GoalManager_GoalIsLocked name = <goal_id>
        return 
    endif
    if skater ::IsSkaterOnVehicle
        return 
    endif
    if CustomParkMode editing
        return 
    endif
    if ObjectExists id = goal_start_dialog
        <should_destroy> = 0
        if <skaterid> ::IsInBail
            <should_destroy> = 1
        endif
        if SkaterCurrentScorePotGreaterThan 0
            <should_destroy> = 1
        endif
        if <skaterid> ::driving
            <should_destroy> = 1
        endif
        if NOT GoalManager_CanStartGoal
            <should_destroy> = 1
        endif
        if (<should_destroy> = 1)
            DestroyScreenElement id = goal_start_dialog
        endif
    else
        if ObjectExists id = root_window
            root_window ::gettags
            if GotParam menu_state
                if (<menu_state> = on)
                    return 
                endif
            endif
        endif
        if GoalManager_CanStartGoal name = <goal_id>
            <skater_ready_for_goal> = 0
            if NOT <skaterid> ::driving
                if <skaterid> ::skating
                    if <skaterid> ::OnGround
                        <skater_ready_for_goal> = 1
                    endif
                else
                    if <skaterid> ::walk_ground
                        <skater_ready_for_goal> = 1
                    endif
                endif
            endif
            if (<skater_ready_for_goal> = 1)
                if NOT <skaterid> ::IsInBail
                    if NOT SkaterCurrentScorePotGreaterThan 0
                        GoalManager_GetGoalParams name = <goal_id>
                        <trigger_obj_id> ::obj_setouterradius 20
                        <trigger_obj_id> ::Obj_SetException Ex = objectoutofradius scr = goal_trigger_refuse params = { goal_id = <goal_id> }
                        if (InNetGame)
                            <quick_start_text> = '\n\m7 to quick start.'
                            <pad_square_script> = goal_accept_trigger
                            <pad_square_params> = {goal_id = <goal_id> quick_start}
                        else
                            <quick_start_text> = ''
                        endif
                        if NOT GotParam trigger_action_text
                            trigger_action_text = 'talk'
                        endif
                        if GotParam full_name
                            FormatText textname = accept_text '%f: \m5 to %a.%q' f = <full_name> q = <quick_start_text> a = <trigger_action_text>
                        else
                            if GotParam pro
                                if StringEquals a = 'Arcade machine' b = <pro>
                                    trigger_action_text = 'play'
                                else
                                    if StringEquals a = 'Boombox' b = <pro>
                                        trigger_action_text = 'start the music'
                                    endif
                                endif
                                FormatText checksumname = name_checksum '%s' s = <pro>
                                GetSkaterLastNameString <name_checksum>
                                if GotParam last_name
                                    FormatText textname = accept_text '%s %l: \m5 to %a.%q' s = <pro> l = <last_name> q = <quick_start_text> a = <trigger_action_text>
                                else
                                    FormatText textname = accept_text '%s: \m5 to %a.%q' s = <pro> q = <quick_start_text> a = <trigger_action_text>
                                endif
                            else
                                FormatText textname = accept_text '\m5 to %a.%q' q = <quick_start_text> a = <trigger_action_text>
                            endif
                        endif
                        create_speech_box {
                            anchor_id = goal_start_dialog
                            text = <accept_text>
                            no_pad_choose
                            no_pad_start
                            pad_circle_script = goal_accept_trigger
                            pad_circle_params = { goal_id = <goal_id> }
                            pad_square_script = <pad_square_script>
                            pad_square_params = <pad_square_params>
                            bg_rgba = [ 100 100 100 128 ]
                            text_rgba = [ 128 128 128 128 ]
                            z_priority = 5
                        }
                    endif
                endif
            endif
        endif
    endif
endscript


script goal_trigger_refuse anchor_id = goal_start_dialog
    Obj_ClearException objectoutofradius
    speech_box_exit anchor_id = <anchor_id>
    GoalManager_ResetGoalTrigger name = <goal_id>
endscript


script goal_accept_trigger 
    Debounce x time = 0.5000
    speech_box_exit anchor_id = goal_start_dialog
    goal_check_for_required_tricks goal_id = <goal_id>
    <trigger_exists> = 0
    if GotParam trigger_obj_id
        if NodeExists <trigger_obj_id>
            <trigger_exists> = 1
        endif
    endif
    if GotParam force_start
        if NOT GoalManager_GoalInitialized name = <goal_id>
            GoalManager_InitializeGoal name = <goal_id>
        endif
        if (<trigger_exists> = 1)
            GoalManager_ResetGoalTrigger name = <goal_id> no_new_exceptions
            if IsAlive name = <trigger_obj_id>
                <trigger_obj_id> ::Obj_ClearException objectinradius
            endif
        endif
        GoalManager_DeactivateAllGoals
        GoalManager_ActivateGoal name = <goal_id> <...> 
        return 
    endif
    if NOT SkaterCurrentScorePotGreaterThan 0
        if GoalManager_CanStartGoal name = <goal_id>
            GetSkaterId
            if <ObjID> ::OnGround
                if SkaterCurrentScorePotLessThan 1
                    if <ObjID> ::OnGround
                        GoalManager_GetGoalParams name = <goal_id>
                        if (<trigger_exists> = 1)
                            GoalManager_ResetGoalTrigger name = <goal_id> no_new_exceptions
                            if IsAlive name = <trigger_obj_id>
                                <trigger_obj_id> ::Obj_ClearException objectinradius
                            endif
                        endif
                        GoalManager_DeactivateAllGoals
                        if GotParam quick_start
                            GoalManager_QuickStartGoal name = <goal_id>
                        else
                            GoalManager_ActivateGoal name = <goal_id> <...> 
                        endif
                    else
                        if NOT <ObjID> ::rightpressed
                            if NOT <ObjID> ::leftpressed
                                if NOT <ObjID> ::uppressed
                                    if NOT <ObjID> ::downpressed
                                        GoalManager_GetGoalParams name = <goal_id>
                                        if (<trigger_exists> = 1)
                                            GoalManager_ResetGoalTrigger name = <goal_id> no_new_exceptions
                                            if IsAlive name = <trigger_obj_id>
                                                <trigger_obj_id> ::Obj_ClearException objectinradius
                                            endif
                                        endif
                                        GoalManager_DeactivateAllGoals
                                        if GotParam quick_start
                                            GoalManager_QuickStartGoal name = <goal_id>
                                        else
                                            GoalManager_ActivateGoal name = <goal_id> <...> 
                                        endif
                                    endif
                                endif
                            endif
                        endif
                    endif
                endif
            else
                if NOT <ObjID> ::rightpressed
                    if NOT <ObjID> ::leftpressed
                        if NOT <ObjID> ::uppressed
                            if NOT <ObjID> ::downpressed
                                GoalManager_GetGoalParams name = <goal_id>
                                if (<trigger_exists> = 1)
                                    GoalManager_ResetGoalTrigger name = <goal_id> no_new_exceptions
                                    if IsAlive name = <trigger_obj_id>
                                        <trigger_obj_id> ::Obj_ClearException objectinradius
                                    endif
                                endif
                                GoalManager_DeactivateAllGoals
                                if GotParam quick_start
                                    GoalManager_QuickStartGoal name = <goal_id>
                                else
                                    GoalManager_ActivateGoal name = <goal_id> <...> 
                                endif
                            endif
                        endif
                    endif
                endif
            endif
        endif
    endif
endscript


script GoalManager_ResetGoalTrigger 
    if GotParam goal_id
        GoalManager_GetGoalParams name = <goal_id>
    else
        GoalManager_GetGoalParams name = <name>
    endif
    if NOT GotParam trigger_obj_id
        return 
    endif
    if NOT NodeExists <trigger_obj_id>
        return 
    endif
    if IsAlive name = <trigger_obj_id>
        <trigger_obj_id> ::Obj_ClearException objectinradius
        if NOT GotParam no_new_exceptions
            if NOT GotParam just_won_goal
                <trigger_obj_id> ::obj_spawnscript goal_trigger_wait_and_set_exceptions params = { goal_id = <goal_id> }
            endif
        endif
    endif
endscript


script goal_check_for_required_tricks 
    <found_unmapped_trick> = 0
    GoalManager_GetGoalParams name = <goal_id>
    if GotParam required_tricks
        FormatText textname = warning_string 'You do not have all the tricks you will need to complete this goal. You will need to assign:'
        GetArraySize <required_tricks>
        <index> = 0
        begin 
        if NOT GetKeyComboBoundToTrick Trick = (<required_tricks> [ <index> ])
            if NOT GetKeyComboBoundToTrick Trick = (<required_tricks> [ <index> ])special
                <trick_name> = (<required_tricks> [ <index> ])
                <trick_params> = (<trick_name>.params)
                <trick_string> = (<trick_params>.name)
                if (<found_unmapped_trick> = 0)
                    FormatText textname = warning_string '%s\n%t' s = <warning_string> t = <trick_string>
                else
                    FormatText textname = warning_string '%s, %t' s = <warning_string> t = <trick_string>
                endif
                <found_unmapped_trick> = 1
            endif
        endif
        <index> = (<index> + 1)
        repeat <array_size>
    endif
    if (<found_unmapped_trick> = 1)
        pausegame
        create_error_box {Title = 'WARNING!'
            text = <warning_string>
            text_dims = (400.0, 0.0)
            bg_scale = 1.200
            buttons = [{text = 'Edit Tricks' pad_choose_script = goal_unmapped_tricks_box_accept}
                {text = 'Skip this challenge' pad_choose_script = goal_unmapped_tricks_box_exit pad_choose_params = { goal_id = <goal_id> }}
            ]
        }
    endif
    return found_unmapped_trick = <found_unmapped_trick>
endscript


script goal_unmapped_tricks_box_accept 
    dialog_box_exit
    create_edit_tricks_menu
endscript


script goal_unmapped_tricks_box_exit 
    GoalManager_ResetGoalTrigger name = <goal_id>
    dialog_box_exit
    UnPauseGame
endscript


script goal_got_trickslot 
    create_panel_message {
        id = goal_current_reward
        text = 'You got a new special trick slot'
        style = goal_message_got_trickslot
    }
endscript


script goal_got_all_goals 
    StopStream
    PlayStream FoundAllGaps vol = 150
    unlock_all_cheat_codes
    unlock_all_gameplay_cheat_codes
    StopStream
    PlayStream FoundAllGaps vol = 150
    <text> = 'Way to go back and clean out the story goals. \n\nYou\'ve unlocked \c3new cheats\c0 to help you take it further. Access them from the Pause menu under Options. Good luck!'
    create_dialog_box {Title = 'All Goals'
        text = <text>
        Pos = (310.0, 225.0)
        just = [ center center ]
        text_rgba = [ 88 105 112 128 ]
        text_dims = (400.0, 0.0)
        buttons = [{font = small text = 'OK' pad_choose_script = goal_got_all_goals_accept}]
        delay_input
    }
endscript


script goal_got_all_goals_accept 
    dialog_box_exit
    FireEvent type = goal_got_all_goals_done
endscript


script goal_play_stream 
    if GotParam streamId
        begin 
        if PreLoadStreamDone <streamId>
            break 
        endif
        wait 1 frame
        repeat 
    endif
    if GotParam play_anim
        addanimcontroller {
            type = partialanim
            id = jawrotation
            AnimName = <stream_checksum>
            from = start
            to = end
            Speed = 1.0
        }
    endif
    if GotParam streamId
        StartPreLoadedStream {
            streamId = <streamId>
            volume = 190
        }
    else
        obj_playstream {
            <stream_checksum>
            vol = 120
            dropoff = 300
            use_pos_info = <use_pos_info>
        }
    endif
endscript


script goal_init_after_end_of_run 
    if NOT GoalManager_GoalExists name = <goal_id>
        return 
    endif
    GoalManager_GetGoalParams name = <goal_id>
    if GotParam competition
        return 
    endif
    GetSkaterId
    begin 
    if GoalManager_GoalExists name = <goal_id>
        if GoalManager_FinishedEndOfRun name = <goal_id>
            GoalManager_ClearEndRun name = <goal_id>
            if NOT GameModeEquals is_classic
                if <ObjID> ::IsSkaterOnVehicle
                    GetCurrentSkaterProfileIndex
                    GetSkaterProfileInfo player = <currentSkaterProfileIndex>
                    if GotParam vehicle_params
                        Vehicle_Start params = <vehicle_params>
                    endif
                else
                    if <ObjID> ::skating
                        MakeSkaterGoto ongroundai
                    endif
                endif
            endif
            if InNetGame
                <ObjID> ::netenableplayerinput
            else
                if NOT GameModeEquals is_classic
                    <ObjID> ::enableplayerinput
                endif
            endif
            break 
        endif
    else
        break 
    endif
    wait 1 frame
    repeat 
endscript


script goal_new_level_reject 
    dialog_box_exit
    if ObjectExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    SetScreenElementProps {
        id = root_window
        tags = { menu_state = Off }
    }
    FireEvent type = goal_new_level_unlocked_done
endscript


script goal_want_to_save 
    GetValueFromVolume cdvol
    root_window ::settags menu_state = on
    hide_console_window
    pause_trick_text
    destroy_goal_panel_messages
    GoalManager_SetCanStartGoal 0
    pause_rain
    Debounce x time = 0.3000
    pausegame
    kill_start_key_binding
    FormatText textname = dialog_box_text 'Do you want to save now?'
    create_snazzy_dialog_box {text = <dialog_box_text>
        Title = ''
        buttons = [{text = 'Yes' pad_choose_script = goal_save_accept}
            {text = 'No' pad_choose_script = goal_save_reject}
        ]
        pad_back_script = goal_save_reject
    }
    AssignAlias id = dialog_box_anchor alias = current_menu_anchor
    create_helper_text generic_helper_text
endscript


script goal_save_accept 
    dialog_box_exit
    kill_start_key_binding
    launch_beat_goal_save_game_sequence pad_back_script = goal_save_reject no_cam_anim
endscript


script goal_save_reject 
    UnPauseGame
    GoalManager_SetCanStartGoal 1
    restore_start_key_binding
    dialog_box_exit
    if ObjectExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    SetScreenElementProps {
        id = root_window
        tags = { menu_state = Off }
    }
    root_window ::settags menu_state = Off
    unpause_rain
    unhide_console_window
    unpause_trick_text
    FireEvent type = goal_wait_for_save
endscript


script goal_create_counter 
    SetScreenElementLock id = root_window Off
    goal_destroy_counter
    CreateScreenElement {
        type = ContainerElement
        parent = root_window
        id = goal_counter_anchor
        dims = (640.0, 480.0)
        Pos = (305.0, 320.0)
    }
    <root_pos> = (550.0, 90.0)
    Theme_GetUnhighlightedTextColor return_value = rgba_off
    Theme_GetHighlightedTextColor return_value = rgba_on
    CreateScreenElement {
        type = TextElement
        parent = goal_counter_anchor
        id = goal_counter_number_collected
        font = small
        text = '0'
        Pos = <root_pos>
        just = [ center top ]
        Scale = 0.9000
        rgba = <rgba_on>
    }
    if GoalManager_GetNumberOfFlags name = <goal_id>
        <total_number> = <number_of_flags>
    else
        GoalManager_GetGoalParams name = <goal_id>
        if GotParam number
            <total_number> = <number>
        else
            if GotParam num_gaps_to_find
                <total_number> = <num_gaps_to_find>
            else
                script_assert 'Couldn\'t find number param.  Are the params for the hud counter setup?'
            endif
        endif
    endif
    FormatText textname = total_number '%i' i = <total_number>
    CreateScreenElement {
        type = TextElement
        parent = goal_counter_anchor
        id = goal_counter_number_total
        rgba = <rgba_off>
        font = small
        text = <total_number>
        Pos = (<root_pos> + (47.0, 0.0))
        just = [ center top ]
        Scale = 0.9000
    }
    Theme_GetSpeechBoxColor return_value = bg_rgba
    CreateScreenElement {
        type = SpriteElement
        parent = goal_counter_anchor
        id = mini_score_hud_box
        texture = mini_score_hud
        Pos = (<root_pos> - (25.0, 6.0))
        just = [ left top ]
        Scale = (1.4700000286102295, 1.0)
        rgba = <bg_rgba>
    }
    if GotParam hud_counter_caption
        GetStackedScreenElementPos y id = <id> Offset = (48.0, -12.0)
        CreateScreenElement {
            type = TextBlockElement
            parent = goal_counter_anchor
            id = goal_counter_caption
            font = small
            text = <hud_counter_caption>
            rgba = [ 128 128 128 108 ]
            Pos = <Pos>
            just = [ center top ]
            Scale = 0.8000
            line_spacing = 0.6000
            dims = (117.5, 0.0)
            allow_expansion
        }
    endif
    goal_update_counter <...> 
endscript


script goal_update_counter 
    GoalManager_GetNumberCollected name = <goal_id>
    if NOT ScreenElementExists id = goal_counter_number_collected
        return 
    endif
    FormatText textname = new_number_collected '%i' i = <number_collected>
    SetScreenElementProps {
        id = goal_counter_number_collected
        text = <new_number_collected>
    }
    GoalManager_GetGoalParams name = <goal_id>
    if GotParam hud_counter_caption
        if ScreenElementExists id = goal_counter_caption
            SetScreenElementProps {
                id = goal_counter_caption
                text = <hud_counter_caption>
            }
        endif
    endif
    KillSpawnedScript name = mini_hud_anim
    RunScriptOnScreenElement id = goal_counter_number_collected mini_hud_anim
endscript


script goal_destroy_counter 
    if ObjectExists id = goal_counter_anchor
        DestroyScreenElement id = goal_counter_anchor
    endif
endscript


script mini_hud_anim 
    DoMorph time = 0.08000 Scale = 0 alpha = 0
    DoMorph time = 0.1200 Scale = 1.300 alpha = 1
    DoMorph time = 0.1400 Scale = 0.7000
    DoMorph time = 0.1600 Scale = 0.9000
endscript


script goal_got_flag_sound 
    playsound GoalMidGood vol = 200
endscript

goal_panel_message_ids = [
    goal_complete
    goal_complete_line2
    goal_complete_sprite
    trick_beat_menu_anchor
    goal_description_anchor
    points_message
    current_goal
    goal_message
    GoalFail
    goalfail_sprite
    goalfailedline2
    goal_tip
    new_goal_message
    new_goal_sprite
    tetris_menu_anchor
    current_horse_spot
    goal_counter_anchor
    goal_instruction1
    skater_hint
    death_message
    perfect
    perfect2
    goal_current_reward
    Eric_Text
    race_lap_message
    race_checkpoint_message
    race_time_message
]

script hide_goal_panel_messages 
    GetArraySize goal_panel_message_ids
    <index> = 0
    begin 
    if NOT ((goal_panel_message_ids [ <index> ])= current_goal)
        hide_panel_message id = (goal_panel_message_ids [ <index> ])
    endif
    <index> = (<index> + 1)
    repeat <array_size>
endscript


script show_goal_panel_messages 
    GetArraySize goal_panel_message_ids
    <index> = 0
    begin 
    show_panel_message id = (goal_panel_message_ids [ <index> ])
    <index> = (<index> + 1)
    repeat <array_size>
endscript


script destroy_goal_panel_messages 
    GetArraySize goal_panel_message_ids
    if GotParam all
        <index> = 0
    else
        <index> = 4
        <array_size> = (<array_size> - 4)
    endif
    if (<index> < <array_size>)
        begin 
        destroy_panel_message id = (goal_panel_message_ids [ <index> ])
        <index> = (<index> + 1)
        repeat <array_size>
    endif
endscript


script GoalManager_HidePoints 
    DoScreenElementMorph {
        id = the_score_sprite
        alpha = 0
    }
    DoScreenElementMorph {
        id = the_score
        alpha = 0
    }
    if ScreenElementExists id = player2_panel_container
        DoScreenElementMorph id = player2_panel_container time = 0 Scale = 0
    endif
    update_goal_points_display hide
    update_pager_icon hide
endscript


script GoalManager_ShowPoints 
    if NOT GetGlobalFlag flag = NO_DISPLAY_HUD
        if CustomParkMode editing
        else
            DoScreenElementMorph {
                id = the_score_sprite
                alpha = 1
            }
            DoScreenElementMorph {
                id = the_score
                alpha = 1
            }
            if ScreenElementExists id = player2_panel_container
                DoScreenElementMorph id = player2_panel_container time = 0 Scale = 1
            endif
            update_goal_points_display show
            update_pager_icon show
        endif
    endif
endscript


script GoalManager_HideGoalPoints 
    DoScreenElementMorph {
        id = goal_points_text
        alpha = 0
    }
endscript


script GoalManager_ShowGoalPoints 
    if CustomParkMode editing
        return 
    endif
    if InMultiPlayerGame
        return 
    endif
    if GameModeEquals is_singlesession
        return 
    endif
    if GameModeEquals is_freeskate
        return 
    endif
    GoalManager_GetNumberOfGoalPoints total
    FormatText textname = goal_points '%i' i = <goal_points>
    SetScreenElementProps {
        id = goal_points_text
        text = <goal_points>
    }
    DoScreenElementMorph {
        id = goal_points_text
        alpha = 1
    }
endscript


script goal_show_tips 
    WaitForEvent type = panel_message_goal_done
    GoalManager_GetGoalParams name = <goal_id>
    <tip_pos> = (320.0, 140.0)
    if NOT GotParam goal_tips
        return 
    endif
    if NOT GotParam goal_tip_interval
        goal_tip_interval = 5
    endif
    GoalManager_GetNumberOfTimesGoalStarted name = <goal_id>
    GetArraySize <goal_tips>
    if (<array_size> = 0)
        return 
    endif
    tips_index = (<array_size> - 1)
    current_multiple = (<goal_tip_interval> * <array_size>)
    if (<times_started> = 0)
        return 
    endif
    if NOT (((<times_started> / <goal_tip_interval>)* <goal_tip_interval>)= <times_started>)
        return 
    endif
    times_started = (<times_started> - (<times_started> / <current_multiple>)* <current_multiple>)
    begin 
    if (((<times_started> / <current_multiple>)* <current_multiple>)= <times_started>)
        create_panel_block id = goal_tip text = (<goal_tips> [ <tips_index> ])Pos = <tip_pos> style = panel_message_tips just = [ center top ]
        break 
    else
        tips_index = (<tips_index> - 1)
        current_multiple = (<current_multiple> - <goal_tip_interval>)
    endif
    repeat <array_size>
endscript


script goal_no_valid_key_combos 
    create_panel_message text = 'You don\'t know enough tricks!  Come back when you\'ve learned something.'
    GoalManager_DeactivateGoal name = <goal_id>
endscript


script AddGoal_Combo 
    if GotParam version
        FormatText textname = goal_type 'Combo%v' v = <version>
        if NOT GotParam letter_info
            FormatText checksumname = c_obj_id 'TRG_Goal_COMBO_C%v' v = <version>
            FormatText checksumname = o_obj_id 'TRG_Goal_COMBO_O%v' v = <version>
            FormatText checksumname = m_obj_id 'TRG_Goal_COMBO_M%v' v = <version>
            FormatText checksumname = b_obj_id 'TRG_Goal_COMBO_B%v' v = <version>
            FormatText checksumname = o2_obj_id 'TRG_Goal_COMBO_O2%v' v = <version>
            letter_info = [
                {obj_id = <c_obj_id> text = 'C'}
                {obj_id = <o_obj_id> text = 'O'}
                {obj_id = <m_obj_id> text = 'M'}
                {obj_id = <b_obj_id> text = 'B'}
                {obj_id = <o2_obj_id> text = 'O'}
            ]
        endif
        if NOT GotParam trigger_obj_id
            FormatText checksumname = trigger_obj_id 'TRG_G_COMBO%v_Pro' v = <version>
        endif
        if NOT GotParam restart_node
            FormatText checksumname = restart_node 'TRG_G_COMBO%v_RestartNode' v = <version>
        endif
    else
        <goal_type> = 'Combo'
    endif
    GoalManager_CreateGoalName <...> 
    GoalManager_AddGoal name = <goal_id> {
        params = { Goal_amateurCOMBOline_genericParams
        <...> 
         }
    }
endscript


script AddGoal_Skate 
    if GotParam version
        FormatText textname = goal_type 'Skate%v' v = <version>
        FormatText checksumname = trigger_obj_id 'TRG_G_SKATE%v_Pro' v = <version>
        FormatText checksumname = S_obj_id 'TRG_Goal_Letter_S%v' v = <version>
        FormatText checksumname = K_obj_id 'TRG_Goal_Letter_K%v' v = <version>
        FormatText checksumname = A_obj_id 'TRG_Goal_Letter_A%v' v = <version>
        FormatText checksumname = T_obj_id 'TRG_Goal_Letter_T%v' v = <version>
        FormatText checksumname = E_obj_id 'TRG_Goal_Letter_E%v' v = <version>
        if NOT GotParam restart_node
            FormatText checksumname = restart_node 'TRG_G_SKATE%v_RestartNode' v = <version>
        endif
    else
        <goal_type> = 'Skate'
    endif
    GoalManager_CreateGoalName <...> 
    GoalManager_AddGoal name = <goal_id> {
        params = { Goal_SkateLetters_genericParams
        <...> 
         }
    }
endscript


script AddGoal_HighScore 
    GoalManager_CreateGoalName <...> goal_type = 'HighScore'
    GoalManager_AddGoal name = <goal_id> {
        params = { Goal_HighScore_genericParams
        <...> 
         }
    }
endscript


script AddGoal_ProScore 
    GoalManager_CreateGoalName <...> goal_type = 'ProScore'
    GoalManager_AddGoal name = <goal_id> {
        params = { Goal_ProScore_GenericParams
        <...> 
         }
    }
endscript


script AddGoal_SickScore 
    GoalManager_CreateGoalName <...> goal_type = 'SickScore'
    GoalManager_AddGoal name = <goal_id> {
        params = { Goal_SickScore_GenericParams
        <...> 
         }
    }
endscript


script AddGoal_Collect 
    if GotParam version
        FormatText textname = goal_type 'Collect%v' v = <version>
        if NOT GotParam restart_node
            FormatText checksumname = restart_node 'TRG_G_Collect%v_RestartNode' v = <version>
        endif
        if NOT GotParam trigger_obj_id
            FormatText checksumname = trigger_obj_id 'TRG_G_Collect%v_Pro' v = <version>
        endif
    else
        <goal_type> = 'Collect'
    endif
    if GotParam career_only
        if InNetGame
            return 
        endif
    endif
    GoalManager_CreateGoalName <...> 
    GoalManager_AddGoal name = <goal_id> {
        params = { Goal_Collect_GenericParams
        <...> 
         }
    }
endscript


script AddGoal_Gaps 
    if GotParam version
        FormatText textname = goal_type 'GAps%v' v = <version>
        if NOT GotParam trigger_obj_id
            FormatText checksumname = trigger_obj_id 'TRG_G_GAP%v_Pro' v = <version>
        endif
        if NOT GotParam restart_node
            FormatText checksumname = restart_node 'TRG_G_GAP%v_RestartNode' v = <version>
        endif
    else
        <goal_type> = 'GAps'
    endif
    GoalManager_CreateGoalName <...> 
    GoalManager_AddGoal name = <goal_id> {
        params = { Goal_Gaps_genericParams
        <...> 
         }
    }
endscript


script AddGoal_HighCombo 
    if GotParam version
        FormatText textname = goal_type 'HIghCombo%v' v = <version>
        if NOT GotParam trigger_obj_id
            FormatText checksumname = trigger_obj_id 'TRG_G_HIGHCOMBO%v_Pro' v = <version>
        endif
        if NOT GotParam restart_node
            FormatText checksumname = restart_node 'TRG_G_HIGHCOMBO%v_RestartNode' v = <version>
        endif
    else
        <goal_type> = 'HIghCombo'
    endif
    GoalManager_CreateGoalName <...> 
    GoalManager_AddGoal name = <goal_id> {
        params = { goal_highcombo_genericParams
        <...> 
         }
    }
endscript


script AddGoal_Special 
    if GotParam version
        FormatText textname = goal_type 'SPecial%v' v = <version>
        if NOT GotParam trigger_obj_id
            FormatText checksumname = trigger_obj_id 'TRG_G_SPECIAL%v_Pro' v = <version>
        endif
        if NOT GotParam restart_node
            FormatText checksumname = restart_node 'TRG_G_SPECIAL%v_RestartNode' v = <version>
        endif
    else
        <goal_type> = 'SPecial'
    endif
    GoalManager_CreateGoalName <...> 
    GoalManager_AddGoal name = <goal_id> {
        params = { Goal_Special_GenericParams
        <...> 
         }
    }
endscript


script AddGoal_Counter 
    if GotParam version
        FormatText textname = goal_type 'COunter%v' v = <version>
        if NOT GotParam trigger_obj_id
            FormatText checksumname = trigger_obj_id 'TRG_G_COUNTER%v_Pro' v = <version>
        endif
        if NOT GotParam restart_node
            FormatText checksumname = restart_node 'TRG_G_COUNTER%v_RestartNode' v = <version>
        endif
    else
        <goal_type> = 'COunter'
    endif
    GoalManager_CreateGoalName <...> 
    GoalManager_AddGoal name = <goal_id> {
        params = { goal_counter_genericParams
        <...> 
         }
    }
endscript


script AddGoal_TrickTheObjects 
    if GotParam version
        FormatText textname = goal_type 'TRICKOBJECTS%v' v = <version>
        if NOT GotParam trigger_obj_id
            FormatText checksumname = trigger_obj_id 'TRG_G_TRICKOBJECTS%v_Pro' v = <version>
        endif
        if NOT GotParam restart_node
            FormatText checksumname = restart_node 'TRG_G_TRICKOBJECTS%v_RestartNode' v = <version>
        endif
    else
        <goal_type> = 'TRICKOBJECTS'
    endif
    GoalManager_CreateGoalName <...> 
    GoalManager_AddGoal name = <goal_id> {
        params = { Goal_TrickObjects_GenericParams
        <...> 
         }
    }
endscript


script AddGoal_SkateTheLine 
    if GotParam version
        FormatText textname = goal_type 'SkateTheLine%v' v = <version>
        if NOT GotParam trigger_obj_id
            FormatText checksumname = trigger_obj_id 'TRG_G_SKATETHELINE%v_Pro' v = <version>
        endif
        if NOT GotParam restart_node
            FormatText checksumname = restart_node 'TRG_G_SKATETHELINE%v_RestartNode' v = <version>
        endif
    else
        <goal_type> = 'SkateTheLine'
    endif
    GoalManager_CreateGoalName <...> 
    GoalManager_AddGoal name = <goal_id> {
        params = { Goal_SkateTheLine_GenericParams
        <...> 
         }
    }
endscript


script AddGoal_TimedScoreRun 
    if GotParam version
        FormatText textname = goal_type 'TimedScoreRun%v' v = <version>
        if NOT GotParam trigger_obj_id
            FormatText checksumname = trigger_obj_id 'TRG_G_TIMEDSCORERUN%v_Pro' v = <version>
        endif
        if NOT GotParam restart_node
            FormatText checksumname = restart_node 'TRG_G_TIMEDSCORERUN%v_RestartNode' v = <version>
        endif
    else
        <goal_type> = 'TimedScoreRun'
    endif
    GoalManager_CreateGoalName <...> 
    GoalManager_AddGoal name = <goal_id> {
        params = { Goal_TimedScoreRun_GenericParams
        <...> 
         }
    }
endscript


script AddGoal_TrickBeat 
    if GotParam version
        FormatText textname = goal_type 'TrickBeat%v' v = <version>
        if NOT GotParam trigger_obj_id
            FormatText checksumname = trigger_obj_id 'TRG_G_TRICKBEAT%v_Pro' v = <version>
        endif
        if NOT GotParam restart_node
            FormatText checksumname = restart_node 'TRG_G_TRICKBEAT%v_RestartNode' v = <version>
        endif
    else
        <goal_type> = 'TrickBeat'
    endif
    GoalManager_CreateGoalName <...> 
    GoalManager_AddGoal name = <goal_id> {
        params = { Goal_TrickBeat_GenericParams
        <...> 
         }
    }
endscript


script AddGoal_SecretTape 
    if GotParam version
        FormatText textname = goal_type 'SecretTape%v' v = <version>
    else
        <goal_type> = 'SecretTape'
    endif
    GoalManager_CreateGoalName <...> 
    GoalManager_AddGoal name = <goal_id> {
        params = { Goal_SecretTape_GenericParams
        <...> 
         }
    }
endscript


script panel_message_goalfail 
    Theme_GetPauseBarColor return_value = goal_fail_color
    setprops just = [ center bottom ] rgba = <goal_fail_color>
    RunScriptOnScreenElement id = <id> panel_message_wait_and_die params = { time = 4000 }
    DoMorph Pos = (320.0, 149.0) time = 0 Scale = 0 alpha = 0
    DoMorph Scale = 1.300 time = 0.3000 alpha = 1
    wait 1.300 second
    DoMorph alpha = 1.0 time = 0.2000 Scale = 1.800
    DoMorph alpha = 0 time = 0.1500 Scale = 0
endscript


script panel_sprite_goalfail time = 4000
    setprops just = [ center center ] rgba = [ 128 30 12 108 ]
    RunScriptOnScreenElement id = <id> panel_message_wait_and_die params = { time = <time> }
    DoMorph time = 0 Scale = 0 Pos = (320.0, 175.0) alpha = 0
    DoMorph time = 0.3000 Scale = (3.299999952316284, 2.5) alpha = 0.5000
    wait 0.4000 second
    DoMorph time = 1 Scale = (3.299999952316284, 7.5) Pos = (320.0, 300.0) alpha = 0
endscript


script panel_message_goalfailline2 time = 4000
    setprops font = testtitle just = [ center center ] rgba = [ 128 30 12 108 ]
    RunScriptOnScreenElement id = <id> panel_message_wait_and_die params = { time = <time> }
    DoMorph Pos = (320.0, 163.0) time = 0 alpha = 0 Scale = 20
    DoMorph Pos = (320.0, 163.0) Scale = 2.0 time = 0.3000 alpha = 1 rot_angle = 0
    wait 0.9000 second
    DoMorph time = 0.4000 Pos = (320.0, 663.0) rot_angle = -90 alpha = 0
endscript


script panel_message_goalcomplete time = 1500
    gettags
    Theme_GetPauseBarColor return_value = goal_color
    RunScriptOnScreenElement id = <id> panel_message_wait_and_die params = { time = <time> }
    setprops just = [ center bottom ] rgba = <goal_color>
    DoMorph Pos = (320.0, 149.0) time = 0 Scale = 0 alpha = 0
    DoMorph Pos = (320.0, 149.0) Scale = 1.600 time = 0.3000 alpha = 1
    wait 1.200 second
    DoMorph time = 0.1000 DoMorph alpha = 0 time = 0.2000 Scale = 0 rgba = [ 0 0 0 128 ]
endscript


script panel_sprite_goalcomplete time = 1500
    setprops just = [ center center ] rgba = [ 125 120 26 128 ]
    DoMorph time = 0 Scale = 0 Pos = (320.0, 125.0) alpha = 0 time = 0
    DoMorph time = 0 Scale = 11 Pos = (320.0, 125.0) alpha = 0.5000 time = 0.6500 rot_angle = 0
    DoMorph time = 0 Scale = 14 Pos = (320.0, 125.0) alpha = 0 time = 0.2500 rot_angle = 180
    FireEvent type = panel_sprite_goalcomplete_done
endscript


script panel_message_goalcompleteline2 time = 1600
    setprops font = testtitle just = [ center center ] rgba = [ 7 122 87 128 ]
    DoMorph Pos = (320.0, 163.0) time = 0 alpha = 0
    DoMorph Pos = (320.0, 163.0) time = 0.3000 alpha = 0 Scale = 0 rot_angle = 0
    DoMorph Pos = (320.0, 163.0) time = 0.05000 alpha = 1 Scale = 2.500 rot_angle = -2
    DoMorph Pos = (318.0, 165.0) time = 0.05000 alpha = 1 rot_angle = 2
    DoMorph Pos = (322.0, 161.0) time = 0.05000 alpha = 1 rot_angle = -1
    DoMorph Pos = (320.0, 165.0) time = 0.05000 alpha = 1 rot_angle = 1
    DoMorph Pos = (318.0, 161.0) time = 0.05000 alpha = 1 rot_angle = -2
    DoMorph Pos = (320.0, 163.0) time = 0.05000 alpha = 1 rot_angle = 2
    DoMorph Pos = (318.0, 165.0) time = 0.05000 alpha = 1 rot_angle = -2
    DoMorph Pos = (322.0, 161.0) time = 0.05000 alpha = 1 rot_angle = 2
    DoMorph Pos = (320.0, 165.0) time = 0.05000 alpha = 1 rot_angle = -3
    DoMorph Pos = (318.0, 161.0) time = 0.05000 alpha = 1 rot_angle = 3
    DoMorph Pos = (320.0, 163.0) time = 0.05000 alpha = 1 rot_angle = -2
    DoMorph Pos = (318.0, 165.0) time = 0.05000 alpha = 1 rot_angle = 2
    DoMorph Pos = (322.0, 161.0) time = 0.05000 alpha = 1 rot_angle = -1
    DoMorph Pos = (320.0, 165.0) time = 0.05000 alpha = 1 rot_angle = 1
    DoMorph Pos = (318.0, 161.0) time = 0.05000 alpha = 1 rot_angle = -2
    DoMorph Pos = (320.0, 163.0) time = 0.05000 alpha = 1 rot_angle = 2
    DoMorph Pos = (318.0, 165.0) time = 0.05000 alpha = 1 rot_angle = -2
    DoMorph Pos = (322.0, 161.0) time = 0.05000 alpha = 1 rot_angle = 2
    DoMorph Pos = (320.0, 165.0) time = 0.05000 alpha = 1 rot_angle = -3
    DoMorph Pos = (318.0, 161.0) time = 0.05000 alpha = 1 rot_angle = 3
    DoMorph Pos = (318.0, 165.0) time = 0.05000 alpha = 1 rot_angle = -2
    DoMorph Pos = (322.0, 161.0) time = 0.05000 alpha = 1 rot_angle = 2
    DoMorph Pos = (320.0, 165.0) time = 0.05000 alpha = 1 rot_angle = -3
    DoMorph Pos = (318.0, 161.0) time = 0.05000 alpha = 1 rot_angle = 3
    DoMorph Pos = (318.0, 161.0) time = 0.05000 alpha = 1 Scale = 2.600 rot_angle = -2
    DoMorph alpha = 1.0 time = 0.2000 Scale = 2.700 rot_angle = 2
    DoMorph alpha = 0 time = 0.3500 Scale = 0 rgba = [ 128 128 128 128 ] rot_angle = -360
    Die
    FireEvent type = panel_message_goalcompleteline2_done
endscript


script panel_message_goal blink_time = 0.1000 final_pos = (620.0, 27.0)
    if NOT GotParam dont_animate
        setprops just = [ center top ] internal_just = [ center center ] rgba = [ 128 128 128 128 ]
        DoMorph Pos = (320.0, 120.0) Scale = 0 alpha = 0
        DoMorph Pos = (320.0, 120.0) Scale = 1.100 time = 0.3000 alpha = 0.3500
        wait 0.2000 second
    endif
    setprops internal_just = [ center top ] rgba = [ 128 128 128 110 ] just = [ RIGHT top ]
    DoMorph Pos = <final_pos> Scale = 0.8300 time = 0.09000 alpha = 1
    FireEvent type = panel_message_goal_done
    FireEvent type = panel_message_goal_done2
endscript


script panel_message_found_secret time = 1500
    setprops just = [ center center ] rgba = [ 115 116 13 128 ]
    DoMorph Pos = (320.0, 157.0) Scale = 6 alpha = 0 time = 0
    DoMorph Pos = (320.0, 157.0) Scale = 0.7500 alpha = 1 time = 0.1000
    wait 1 frame
    DoMorph Pos = (320.0, 157.0) Scale = 1.600 alpha = 1 time = 0.1000
    wait 1 frame
    DoMorph Pos = (320.0, 157.0) Scale = 1.300 alpha = 1 time = 0.1000
    wait 1 frame
    setprops blur_effect
    do_blur_effect
    setprops no_blur_effect
    DoMorph time = 0.1000 alpha = 0.4000
    DoMorph time = 0.1000 alpha = 1
    DoMorph time = 0.1000 alpha = 0.4000
    DoMorph time = 0.1000 alpha = 1
    DoMorph time = 0.1000 alpha = 0.4000
    DoMorph time = 0.1000 alpha = 1
    DoMorph time = 0.1000 alpha = 0.4000
    DoMorph time = 0.1000 alpha = 1
    DoMorph time = 0.1000 alpha = 0.4000
    DoMorph time = 0.1000 alpha = 1
    DoMorph time = 0.1000 alpha = 0.4000
    DoMorph time = 0.1000 alpha = 1
    DoMorph alpha = 0 time = 0.05000 Scale = (10.0, 0.0) rgba = [ 0 0 0 128 ]
    Die
    FireEvent type = panel_message_found_secret_done
endscript


script panel_message_generic_loss 
    setprops just = [ center center ] rgba = [ 128 128 128 100 ]
    RunScriptOnScreenElement id = <id> panel_message_wait_and_die params = { time = 1500 }
    DoMorph Pos = (320.0, 185.0) time = 0 Scale = 0
    DoMorph time = 0.3000 Scale = 1.300
    DoMorph time = 0.2000 Scale = 1.0
    DoMorph Pos = (319.0, 184.0) time = 0.1000
    DoMorph Pos = (321.0, 186.0) time = 0.1000
    DoMorph Pos = (319.0, 184.0) time = 0.1000
    DoMorph Pos = (322.0, 186.0) time = 0.1000
    DoMorph Pos = (319.0, 184.0) time = 0.1000
    DoMorph Pos = (321.0, 186.0) time = 0.1000
    DoMorph Pos = (319.0, 182.0) time = 0.1000
    DoMorph Pos = (321.0, 186.0) time = 0.1000
    DoMorph Pos = (319.0, 184.0) time = 0.1000
    DoMorph Pos = (321.0, 186.0) time = 0.1000
    DoMorph Pos = (318.0, 184.0) time = 0.1000
    DoMorph Pos = (321.0, 187.0) time = 0.1000
endscript


script panel_message_tips blink_time = 0.05000
    setprops just = [ center top ] internal_just = [ center center ] rgba = [ 127 102 0 100 ]
    DoMorph Scale = 0
    DoMorph Scale = 1.200 time = 0.1000
    DoMorph Scale = 0.8000 time = 0.1000
    DoMorph Scale = 1 time = 0.1000
    DoMorph Scale = 0.9000 time = 0.1000
    DoMorph Pos = { (1.0, 2.0) relative }time = 0.1000
    DoMorph Pos = { (-2.0, -3.0) relative }time = 0.1000
    DoMorph Pos = { (2.0, 2.0) relative }time = 0.1000
    DoMorph Pos = { (-3.0, -2.0) relative }time = 0.1000
    DoMorph Pos = { (3.0, 2.0) relative }time = 0.1000
    DoMorph Pos = { (-2.0, -2.0) relative }time = 0.1000
    DoMorph Pos = { (2.0, 4.0) relative }time = 0.1000
    DoMorph Pos = { (-2.0, -4.0) relative }time = 0.1000
    DoMorph Pos = { (1.0, 7.0) relative }Scale = 1.250 time = 0.1000
    setprops internal_just = [ center top ] rgba = [ 127 102 0 90 ] just = [ RIGHT top ]
    DoMorph Pos = { (155.0, -40.0) relative }Scale = 0.7800 time = 0.05000
    begin 
    DoMorph alpha = 0
    wait <blink_time> seconds
    DoMorph alpha = 1
    wait <blink_time> seconds
    repeat 6
endscript


script clock_morph 
    DoMorph Scale = 0 alpha = 0 time = 0.1000
    DoMorph Scale = 1.0 alpha = 1 time = 0.3000
endscript


script goal_message_got_trickslot 
    setprops rgba = [ 43 95 53 128 ]
    DoMorph time = 0 Pos = (320.0, 214.0) Scale = 0 alpha = 0
    DoMorph time = 0.5000 alpha = 1
    if GotParam sound
        playsound <sound> vol = 150
    endif
    DoMorph time = 0.1000 Scale = 2.500
    DoMorph time = 0.1000 Scale = 1.500
    DoMorph time = 0.1000 Scale = 2.0
    DoMorph time = 0.1000 Scale = 1.400
    DoMorph Pos = (321.0, 215.0) time = 0.1000
    DoMorph Pos = (319.0, 213.0) time = 0.1000
    DoMorph Pos = (321.0, 215.0) time = 0.1000
    DoMorph Pos = (319.0, 213.0) time = 0.1000
    DoMorph Pos = (321.0, 215.0) time = 0.1000
    DoMorph Pos = (319.0, 213.0) time = 0.1000
    DoMorph Pos = (321.0, 215.0) time = 0.1000
    DoMorph Pos = (319.0, 213.0) time = 0.1000
    DoMorph Pos = (321.0, 215.0) time = 0.1000
    DoMorph Pos = (319.0, 213.0) time = 0.1000
    DoMorph Pos = (321.0, 215.0) time = 0.1000
    DoMorph Pos = (319.0, 213.0) time = 0.1000
    DoMorph Pos = (321.0, 215.0) time = 0.1000
    DoMorph Pos = (319.0, 213.0) time = 0.1000
    DoMorph time = 0.1000 Scale = 1.400
    DoMorph time = 0.1500 Scale = 0 alpha = 0
    Die
    FireEvent type = goal_got_reward_done
endscript


script goal_message_stat_up 
    setprops rgba = [ 33 112 15 128 ]
    DoMorph time = 0 Pos = (320.0, 195.0) Scale = 0 alpha = 0
    DoMorph time = 0.2000 alpha = 1
    if GotParam sound
        playsound <sound> vol = 150
    endif
    DoMorph time = 0.1000 Scale = 2.500
    DoMorph time = 0.1000 Scale = 1.500
    DoMorph time = 0.1000 Scale = 2.0
    DoMorph time = 0.1000 Scale = 1.400
    DoMorph Pos = (321.0, 196.0) time = 0.1000
    DoMorph Pos = (319.0, 194.0) time = 0.1000
    DoMorph time = 0.1000 Scale = 1.400
    DoMorph time = 0.1500 Scale = 0 alpha = 0
    Die
endscript


script new_ammo_message_up 
    DoMorph time = 0 Scale = 0 alpha = 0
    DoMorph time = 0.2000 alpha = 1
    if GotParam sound
        playsound <sound> vol = 150
    endif
    DoMorph time = 0.1000 Scale = 2.500
    DoMorph time = 0.1000 Scale = 1.500
    DoMorph time = 0.1000 Scale = 2.0
    DoMorph time = 0.1000 Scale = 1.200
    DoMorph time = 1.200 Scale = 1.200
    DoMorph time = 0.1000 Scale = 1.800
    DoMorph time = 0.1500 Scale = 0 alpha = 0
    Die
endscript


script goal_message_got_gap 
    setprops rgba = [ 20 98 114 108 ]
    DoMorph time = 0.1000 alpha = 1
    DoMorph time = 0.1000 Scale = 1.900
    DoMorph time = 0.1000 Scale = 0.9000
    DoMorph time = 0.1000 Scale = 1.200
    DoMorph time = 0.1000 Scale = 0.9500
    DoMorph time = 0.1000 Scale = 1.0
    DoMorph alpha = 0.4000 time = 0.07000
    DoMorph alpha = 1 time = 0.07000
    DoMorph alpha = 0.6000 time = 0.07000
    DoMorph alpha = 1 time = 0.07000
    DoMorph alpha = 0.3000 time = 0.07000
    DoMorph alpha = 0.6000 time = 0.07000
    DoMorph alpha = 1 time = 0.07000
    DoMorph alpha = 0.3000 time = 0.07000
    DoMorph alpha = 1 time = 0.07000
    DoMorph alpha = 0.3000 time = 0.07000
    DoMorph alpha = 0.6000 time = 0.07000
    DoMorph alpha = 1 time = 0.07000
    DoMorph alpha = 0.3000 time = 0.07000
    DoMorph alpha = 1 time = 0.07000
    DoMorph alpha = 0.3000 time = 0.07000
    DoMorph alpha = 0.6000 time = 0.07000
    DoMorph alpha = 1 time = 0.07000
    DoMorph alpha = 0.3000 time = 0.07000
    DoMorph alpha = 1 time = 0.07000
    DoMorph alpha = 0.6000 time = 0.07000
    DoMorph alpha = 1 time = 0.07000 Scale = 1.0
    DoMorph time = 0.1000 Scale = 1.700
    DoMorph time = 0.1000 Scale = 0 alpha = 0
    Die
endscript


script spawned_safe_goal_win 
    GoalManager_WinGoal name = <goal_id>
endscript

