Goal_Gaps_genericParams = {
    goal_text = 'generic gaps text'
    view_goals_text = 'Gaps-Ziel'
    time = 120
    init = goal_gaps_init
    uninit = goal_uninit
    activate = goal_gaps_activate
    active = goal_gaps_active
    deactivate = goal_gaps_deactivate
    expire = goal_gaps_expire
    success = goal_gaps_success
    fail = goal_gaps_fail
    got_flag_script = goal_gaps_got_gap
    trigger_obj_id = 'TRG_G_GAP_Pro'
    restart_node = 'TRG_G_GAP_RestartNode'
    start_pad_id = 'G_GAP_StartPad'
    record_type = Score
    gaps
}

script goal_mini_combo_land_prompt 
    create_panel_block \{ text = 'Super Landung!' style = panel_message_landed id = goal_mini_combo_land_msg }
endscript

script AddGoal_Gaps 
    if GotParam version
        FormatText textname = goal_type 'GAps%v' v = <version>
        if NOT GotParam trigger_obj_id
            FormatText checksumname = trigger_obj_id '%z_TRG_G_GAP%v_Pro' z = <zone> v = <version>
        endif
        if NOT GotParam restart_node
            FormatText checksumname = restart_node '%z_TRG_G_GAP%v_RestartNode' z = <zone> v = <version>
        endif
    else
        <goal_type> = 'GAps'
        if NOT GotParam trigger_obj_id
            FormatText checksumname = trigger_obj_id '%z_TRG_G_GAP_Pro' z = <zone>
        endif
        if NOT GotParam restart_node
            FormatText checksumname = restart_node '%z_TRG_G_GAP_RestartNode' z = <zone>
        endif
    endif
    if GotParam classic_mode_goal
        <classic_mode_goal> = classic_mode_goal
    endif
    GoalManager_CreateGoalName goal_type = <goal_type> zone = <zone> classic_mode_goal = <classic_mode_goal>
    if ((GotParam score_battle)|| (GotParam contest))
        <dont_deactivate_upon_expiration> = dont_deactivate_upon_expiration
    endif
    GoalManager_AddGoal name = <goal_id> {
        params = {
            goal_text = 'generic gaps text'
            view_goals_text = 'Gaps-Ziel'
            time = 120
            record_type = Score
            got_flag_script = goal_gaps_got_gap
            init = goal_gaps_init
            uninit = goal_uninit
            activate = goal_gaps_activate
            active = goal_gaps_active
            deactivate = goal_gaps_deactivate
            expire = goal_gaps_expire
            success = goal_gaps_success
            fail = goal_gaps_fail
            <...> 
            gaps
        }
    }
endscript

script goal_gaps_init 
    goal_init goal_id = <goal_id>
endscript

script goal_gaps_activate 
    if GotParam no_cam_anim
        goal_passive_start goal_id = <goal_id>
    else
        goal_start goal_id = <goal_id>
    endif
    if GotParam hold_trick
        if GotParam on_level_node
            <on_level_node> = 1
        else
            <on_level_node> = 0
        endif
        if GotParam dont_require_land
            <land_required> = 0
        else
            <land_required> = 1
        endif
        SpawnScriptLater {
            goal_gaps_hold_trick_checker
            params = {
                trick_type = <trick_type>
                trick_time = <trick_time>
                goal_id = <goal_id>
                on_level_node = <on_level_node>
                land_required = <land_required>
                trick_text = <trick_text>
            }
        }
    endif
    if GotParam score_battle
        if GotParam quick_start
            <quick_start> = quick_start
        endif
        SpawnScriptLater score_battle_wait_activate params = {opponent_name = <full_name> quick_start = <quick_start>}
    endif
    if GotParam contest
        <wait> = 0
        if GotParam pak_info
            if StructureContains structure = <pak_info> start
                if NOT GotParam quick_start
                    <wait> = 1
                endif
            endif
        endif
        if (<wait> = 1)
            SpawnScriptLater goal_contest_wait_activate params = { goal_id = <goal_id> }
        else
            goal_contest_activate goal_id = <goal_id>
        endif
    endif
    if GotParam buy_goal
        <wait_igc> = 0
        if GotParam intro_scene
            if NOT GotParam quick_start
                <wait_igc> = 1
            endif
        endif
        if ChecksumEquals a = <goal_id> b = z_sv_goal_gaps68
            <wait_igc> = 1
        endif
        <wait_pak> = 0
        if GotParam pak_info
            if StructureContains structure = <pak_info> start
                if NOT GotParam quick_start
                    <wait_pak> = 1
                endif
            endif
        endif
        SpawnScriptLater goal_buy_wait_activate params = {goal_id = <goal_id> wait_igc = <wait_igc> wait_pak = <wait_pak>}
    endif
    if GotParam change_look
        <wait_igc> = 0
        if GotParam intro_scene
            if NOT GotParam quick_start
                <wait_igc> = 1
            endif
        endif
        <wait_pak> = 0
        if GotParam pak_info
            if StructureContains structure = <pak_info> start
                if NOT GotParam quick_start
                    <wait_pak> = 1
                endif
            endif
        endif
        if GotParam passive_start
            <wait_igc> = 0
            <wait_pak> = 0
        endif
        SpawnScriptLater goal_change_look_wait_activate params = {goal_id = <goal_id> wait_pak = <wait_pak> wait_igc = <wait_igc> specific_change = <specific_change>}
    endif
    if GotParam transfer_special
        <wait_igc> = 0
        if GotParam intro_scene
            if NOT GotParam quick_start
                <wait_igc> = 1
            endif
        endif
        <wait_pak> = 0
        if GotParam pak_info
            if StructureContains structure = <pak_info> start
                if NOT GotParam quick_start
                    <wait_pak> = 1
                endif
            endif
        endif
        SpawnScriptLater goal_transfer_special_wait_activate params = {goal_id = <goal_id> wait_igc = <wait_igc> wait_pak = <wait_pak>}
    endif
    if GotParam mini_combo
        GoalManager_EditGoal name = <goal_id> params = { got_gap = 0 }
    endif
endscript

script goal_gaps_deactivate 
    if GotParam \{ transfer_special }
        goal_transfer_special_cleanup trigger_obj_id = <trigger_obj_id>
    endif
    GoalManager_ResetGoalTrigger name = <goal_id>
    goal_deactivate goal_id = <goal_id>
    if GotParam \{ hold_trick }
        goal_gaps_hold_trick_cleanup
    endif
    if GotParam \{ contest }
        goal_contest_cleanup
    endif
    if GotParam \{ score_battle }
        score_battle_cleanup
    endif
endscript

script goal_gaps_success 
    if ScreenElementExists \{ id = goal_gaps_got_gap_message }
        DestroyScreenElement \{ id = goal_gaps_got_gap_message }
    endif
    goal_success goal_id = <goal_id>
endscript

script goal_gaps_fail 
    goal_fail goal_id = <goal_id>
endscript

script goal_gaps_expire 
    if GotParam \{ score_battle }
        score_battle_expire goal_id = <goal_id>
    else
        if GotParam \{ contest }
            goal_contest_expire goal_id = <goal_id>
        else
            if GotParam \{ transfer_special }
                goal_transfer_special_expire goal_id = <goal_id> trigger_obj_id = <trigger_obj_id>
            else
                goal_expire goal_id = <goal_id>
                GoalManager_LoseGoal name = <goal_id>
            endif
        endif
    endif
endscript

script goal_gaps_got_gap 
    if ScreenElementExists \{ id = goal_gaps_got_gap_message }
        DestroyScreenElement \{ id = goal_gaps_got_gap_message }
    endif
    if NOT GotParam \{ collect_type }
        <collect_type> = 'Gaps'
    endif
    FormatText textname = got_gap_text '%c von %n %s' c = <num_flags_set> n = <num_flags> s = <collect_type>
    create_panel_message id = goal_gaps_got_gap_message text = <got_gap_text> style = goal_collect_text
endscript

script goal_gaps_mini_combo_got_gap 
    GoalManager_EditGoal name = <name> params = { got_gap = 1 }
endscript

script goal_gaps_tag_it_trigger 
    if GoalManager_GoalIsActive name = <name>
        GoalManager_GetGoalParams name = <name>
        <set_flag> = 0
        switch <tag_type>
            case tag
            if triggertype graffiti onto
                <set_flag> = 1
            endif
            case wallplant
            if triggertype wallplant onto
                <set_flag> = 1
            endif
            case sticker
            if triggertype wallplant onto
                wait 1 frame
                if skater ::Skater_AnimEquals Wallplant_Sticker
                    <set_flag> = 1
                endif
            endif
            case whack
            if IsWhacking
                <set_flag> = 1
            endif
            case toss
            if triggertype projectile
                <set_flag> = 1
            endif
        endswitch
        if (<set_flag> = 1)
            if NOT GoalManager_GoalFlagSet name = <name> flag = <flag>
                GoalManager_SetGoalFlag name = <name> <flag> 1
            endif
        endif
    endif
endscript
goal_gaps_hold_trick_on_level_node = 0
goal_gaps_hold_trick_flag_name = got_1

script goal_gaps_hold_trick_trigger 
    if GoalManager_GoalIsActive name = <name>
        if GotParam flag_name
            change goal_gaps_hold_trick_flag_name = <flag_name>
        endif
        GoalManager_GetGoalParams name = <name>
        switch <trick_type>
            case stall
            wait 15 frames
            if skater ::OnStall
                change goal_gaps_hold_trick_on_level_node = 1
            endif
            case slide
            if skater ::IsRailSliding
                change goal_gaps_hold_trick_on_level_node = 1
            endif
            case grind
            if triggertype grind onto
                change goal_gaps_hold_trick_on_level_node = 1
            endif
            case lip
            if triggertype lip onto
                change goal_gaps_hold_trick_on_level_node = 1
            endif
            case spin
            if triggertype spin onto
                change goal_gaps_hold_trick_on_level_node = 1
            endif
            case SlideOrGrind
            if skater ::IsRailSliding
                change goal_gaps_hold_trick_on_level_node = 1
            else
                if triggertype grind onto
                    change goal_gaps_hold_trick_on_level_node = 1
                endif
            endif
        endswitch
    endif
endscript

script goal_gaps_hold_trick_checker trick_time = 10
    change goal_gaps_hold_trick_on_level_node = 0
    KillSpawnedScript name = goal_gaps_hold_trick_check_specific
    if NOT GotParam trick_type
        scriptassert 'hold_trick style Goal_Gaps activated with no specified trick_type'
    endif
    if ScreenElementExists id = goal_gaps_trick_time_msg
        DestroyScreenElement id = goal_gaps_trick_time_msg
    endif
    ClearExceptionGroup goal_gaps_hold_trick
    switch <trick_type>
        case slide
        case stall
        case spin
        case grind
        case SlideOrGrind
        <exception> = SkaterEnterRail
        case lip
        <exception> = SkaterEnterLip
        case Manual
        <exception> = SkaterEnterManual
        case focus
        <exception> = SkaterEnterFocus
        case skitch
        <exception> = SkaterEnterSkitch
        default 
        scriptassert 'goal_gaps_hold_trick_checker got an unsupported trick type: %s' s = <trick_type>
    endswitch
    SetException {
        Ex = <exception>
        scr = goal_gaps_hold_trick_resolve
        params = {
            trick_type = <trick_type>
            trick_time = <trick_time>
            goal_id = <goal_id>
            exception = <exception>
            on_level_node = <on_level_node>
            land_required = <land_required>
            trick_text = <trick_text>
        }
        group = goal_gaps_hold_trick
    }
    Block
endscript

script goal_gaps_hold_trick_resolve 
    <proceed_to_timer> = 1
    if ChecksumEquals a = <exception> b = SkaterEnterRail
        <proceed_to_timer> = 0
        switch <trick_type>
            case grind
            case slide
            wait 15 frames
            <goal_trick_type> = <trick_type>
            skater ::GetBalanceTrickType
            if ChecksumEquals a = <goal_trick_type> b = <trick_type>
                <proceed_to_timer> = 1
            endif
            <trick_type> = <goal_trick_type>
            case SlideOrGrind
            wait 15 frames
            <goal_trick_type> = <trick_type>
            skater ::GetBalanceTrickType
            if ChecksumEquals a = grind b = <trick_type>
                <proceed_to_timer> = 1
            else
                if ChecksumEquals a = slide b = <trick_type>
                    <proceed_to_timer> = 1
                endif
            endif
            <trick_type> = <goal_trick_type>
            case stall
            wait 15 frames
            if skater ::OnStall
                <proceed_to_timer> = 1
            endif
            case spin
            if skater ::IsInNatasSpin
                <proceed_to_timer> = 1
            endif
        endswitch
    endif
    if ((<on_level_node> = 1)& ((goal_gaps_hold_trick_on_level_node)= 0))
        <proceed_to_timer> = 0
    endif
    if (<proceed_to_timer> = 1)
        if GotParam trick_text
            SpawnScriptLater {
                goal_gaps_hold_trick_wait_specific
                params = {
                    trick_type = <trick_type>
                    trick_time = <trick_time>
                    goal_id = <goal_id>
                    on_level_node = <on_level_node>
                    land_required = <land_required>
                    trick_text = <trick_text>
                }
            }
        else
            SpawnScriptLater {
                goal_gaps_hold_trick_timer
                params = {
                    trick_type = <trick_type>
                    trick_time = <trick_time>
                    goal_id = <goal_id>
                    on_level_node = <on_level_node>
                    land_required = <land_required>
                    trick_text = <trick_text>
                }
            }
        endif
    else
        SpawnScriptLater {
            goal_gaps_hold_trick_checker
            params = {
                trick_type = <trick_type>
                trick_time = <trick_time>
                goal_id = <goal_id>
                on_level_node = <on_level_node>
                land_required = <land_required>
                trick_text = <trick_text>
            }
        }
    endif
endscript

script goal_gaps_hold_trick_wait_specific 
    ClearExceptionGroup goal_gaps_hold_trick
    SetException {
        Ex = SkaterBailed
        scr = goal_gaps_hold_trick_checker
        params = {
            trick_type = <trick_type>
            trick_time = <trick_time>
            goal_id = <goal_id>
            on_level_node = <on_level_node>
            land_required = <land_required>
            trick_text = <trick_text>
        }
        group = goal_gaps_hold_trick
    }
    SetException {
        Ex = SkaterLanded
        scr = goal_gaps_hold_trick_checker
        params = {
            trick_type = <trick_type>
            trick_time = <trick_time>
            goal_id = <goal_id>
            on_level_node = <on_level_node>
            land_required = <land_required>
            trick_text = <trick_text>
        }
        group = goal_gaps_hold_trick
    }
    SetException {
        Ex = SkaterEnterAir
        scr = goal_gaps_hold_trick_checker
        params = {
            trick_type = <trick_type>
            trick_time = <trick_time>
            goal_id = <goal_id>
            on_level_node = <on_level_node>
            land_required = <land_required>
            trick_text = <trick_text>
        }
        group = goal_gaps_hold_trick
    }
    begin 
    if skater ::islatesttrick TrickText = <trick_text>
        break 
    endif
    wait 1 gameframe
    repeat 
    SpawnScriptLater {
        goal_gaps_hold_trick_timer
        params = {
            trick_type = <trick_type>
            trick_time = <trick_time>
            goal_id = <goal_id>
            on_level_node = <on_level_node>
            land_required = <land_required>
            trick_text = <trick_text>
        }
    }
endscript

script goal_gaps_hold_trick_timer 
    ClearExceptionGroup goal_gaps_hold_trick
    SetException {
        Ex = SkaterBailed
        scr = goal_gaps_hold_trick_checker
        params = {
            trick_type = <trick_type>
            trick_time = <trick_time>
            goal_id = <goal_id>
            on_level_node = <on_level_node>
            land_required = <land_required>
            trick_text = <trick_text>
        }
        group = goal_gaps_hold_trick
    }
    SetException {
        Ex = SkaterLanded
        scr = goal_gaps_hold_trick_checker
        params = {
            trick_type = <trick_type>
            trick_time = <trick_time>
            goal_id = <goal_id>
            on_level_node = <on_level_node>
            land_required = <land_required>
            trick_text = <trick_text>
        }
        group = goal_gaps_hold_trick
    }
    if ChecksumEquals a = <trick_type> b = focus
        SetException {
            Ex = SkaterExitFocus
            scr = goal_gaps_hold_trick_checker
            params = {
                trick_type = <trick_type>
                trick_time = <trick_time>
                goal_id = <goal_id>
                on_level_node = <on_level_node>
                land_required = <land_required>
                trick_text = <trick_text>
            }
            group = goal_gaps_hold_trick
        }
    else
        SetException {
            Ex = SkaterEnterAir
            scr = goal_gaps_hold_trick_checker
            params = {
                trick_type = <trick_type>
                trick_time = <trick_time>
                goal_id = <goal_id>
                on_level_node = <on_level_node>
                land_required = <land_required>
                trick_text = <trick_text>
            }
            group = goal_gaps_hold_trick
        }
    endif
    if GotParam trick_text
        SpawnScriptLater {
            goal_gaps_hold_trick_check_specific
            params = {
                trick_type = <trick_type>
                trick_time = <trick_time>
                goal_id = <goal_id>
                on_level_node = <on_level_node>
                land_required = <land_required>
                trick_text = <trick_text>
            }
        }
    endif
    <trick_time_left> = <trick_time>
    begin 
    if (<trick_time_left> < 1)
        KillSpawnedScript name = goal_gaps_hold_trick_check_specific
        if (<land_required> = 1)
            create_panel_block id = goal_gaps_trick_time_msg text = 'Super Landung!' style = panel_message_landed
            SpawnScriptLater {
                goal_gaps_hold_trick_wait_land
                params = {
                    trick_type = <trick_type>
                    trick_time = <trick_time>
                    goal_id = <goal_id>
                    on_level_node = <on_level_node>
                    land_required = <land_required>
                    trick_text = <trick_text>
                }
            }
        else
            goal_gaps_hold_trick_set_flag {
                goal_id = <goal_id>
                trick_type = <trick_type>
                trick_time = <trick_time>
                on_level_node = <on_level_node>
                land_required = <land_required>
                trick_text = <trick_text>
            }
        endif
        break 
    endif
    FormatText textname = time_left_text 'Noch %a Sekunden' a = <trick_time_left>
    create_panel_block id = goal_gaps_trick_time_msg text = <time_left_text> style = panel_message_countdown
    wait 1 second
    <trick_time_left> = (<trick_time_left> - 1)
    repeat 
endscript

script goal_gaps_hold_trick_check_specific 
    begin 
    if NOT skater ::islatesttrick TrickText = <trick_text>
        KillSpawnedScript name = goal_gaps_hold_trick_timer
        if ScreenElementExists id = goal_gaps_trick_time_msg
            DestroyScreenElement id = goal_gaps_trick_time_msg
        endif
        switch <trick_type>
            case slide
            case stall
            case spin
            case grind
            case SlideOrGrind
            <exception> = SkaterEnterRail
            case lip
            <exception> = SkaterEnterLip
            case Manual
            <exception> = SkaterEnterManual
            case focus
            <exception> = SkaterEnterFocus
            case skitch
            <exception> = SkaterEnterSkitch
            default 
            scriptassert 'goal_gaps_hold_trick_checker got an unsupported trick type: %s' s = <trick_type>
        endswitch
        SpawnScriptLater {
            goal_gaps_hold_trick_resolve
            params = {
                trick_type = <trick_type>
                trick_time = <trick_time>
                goal_id = <goal_id>
                exception = <exception>
                on_level_node = <on_level_node>
                land_required = <land_required>
                trick_text = <trick_text>
            }
        }
        break 
    endif
    wait 1 gameframe
    repeat 
endscript

script goal_gaps_hold_trick_wait_land 
    ClearExceptionGroup goal_gaps_hold_trick
    SetException {
        Ex = SkaterBailed
        scr = goal_gaps_hold_trick_checker
        params = {
            trick_type = <trick_type>
            trick_time = <trick_time>
            goal_id = <goal_id>
            on_level_node = <on_level_node>
            land_required = <land_required>
            trick_text = <trick_text>
        }
        group = goal_gaps_hold_trick
    }
    SetException {
        Ex = SkaterEnterAir
        scr = goal_gaps_hold_trick_wait_land
        params = {
            trick_type = <trick_type>
            trick_time = <trick_time>
            goal_id = <goal_id>
            on_level_node = <on_level_node>
            land_required = <land_required>
            trick_text = <trick_text>
        }
        group = goal_gaps_hold_trick
    }
    SetException {
        Ex = SkaterLanded
        scr = goal_gaps_hold_trick_set_flag
        params = {
            trick_type = <trick_type>
            trick_time = <trick_time>
            goal_id = <goal_id>
            on_level_node = <on_level_node>
            land_required = <land_required>
            trick_text = <trick_text>
        }
        group = goal_gaps_hold_trick
    }
    Block
endscript

script goal_gaps_hold_trick_set_flag 
    SpawnScriptLater {
        goal_gaps_hold_trick_checker
        params = {
            trick_type = <trick_type>
            trick_time = <trick_time>
            goal_id = <goal_id>
            on_level_node = <on_level_node>
            land_required = <land_required>
            trick_text = <trick_text>
        }
    }
    ClearExceptionGroup \{ goal_gaps_hold_trick }
    GoalManager_GetGoalParams name = <goal_id>
    if GotParam \{ got_hold_trick_script }
        <got_hold_trick_script> flag = (goal_gaps_hold_trick_flag_name)
    endif
    GoalManager_SetGoalFlag name = <goal_id> (goal_gaps_hold_trick_flag_name)1
endscript

script goal_gaps_hold_trick_cleanup 
    ClearExceptionGroup \{ goal_gaps_hold_trick }
    KillSpawnedScript \{ name = goal_gaps_hold_trick_checker }
    KillSpawnedScript \{ name = goal_gaps_hold_trick_wait_specific }
    KillSpawnedScript \{ name = goal_gaps_hold_trick_check_specific }
    KillSpawnedScript \{ name = goal_gaps_hold_trick_timer }
    KillSpawnedScript \{ name = goal_gaps_hold_trick_wait_land }
    if ScreenElementExists \{ id = goal_gaps_trick_time_msg }
        DestroyScreenElement \{ id = goal_gaps_trick_time_msg }
    endif
    change \{ goal_gaps_hold_trick_flag_name = got_1 }
endscript

script hide_hold_trick_msg 
    if ScreenElementExists \{ id = goal_gaps_trick_time_msg }
        goal_gaps_trick_time_msg ::DoMorph \{ alpha = 0 }
    endif
endscript

script unhide_hold_trick_msg 
    if ScreenElementExists \{ id = goal_gaps_trick_time_msg }
        goal_gaps_trick_time_msg ::DoMorph \{ alpha = 1 }
    endif
endscript
score_battle_range_low = 0.1500
score_battle_range_medium = 0.5000
ahead_by_little_min_mult = 5.500
ahead_by_little_max_mult = 7.500
ahead_by_medium_min_mult = 0.5000
ahead_by_medium_max_mult = 1.500
ahead_by_lots_min_mult = 0.1500
ahead_by_lots_max_mult = 0.2500
behind_by_little_min_mult = 0.2500
behind_by_little_max_mult = 7.500
behind_by_medium_min_mult = 0.5000
behind_by_medium_max_mult = 0.7500
behind_by_lots_min_mult = 0.7500
behind_by_lots_max_mult = 0.9500
score_battle_min_bonus_low = 650.0
score_battle_min_bonus_high = 1500.0
score_battle_player_score = 0
score_battle_opponent_score = 0
score_battle_active = 0

script score_battle_wait_activate 
    change \{ score_battle_active = 0 }
    change \{ score_battle_player_score = 0 }
    change \{ score_battle_opponent_score = 0 }
    if GotParam \{ quick_start }
        score_battle_activate opponent_name = <opponent_name>
    else
        SetException Ex = goal_cam_anim_post_start_done scr = score_battle_activate params = { opponent_name = <opponent_name> }
        Block
    endif
endscript

script score_battle_activate 
    score_battle_create_scoreboard opponent_name = <opponent_name>
    KillSpawnedScript \{ name = score_battle_monitor_player }
    SpawnScriptLater \{ score_battle_monitor_player }
    change \{ score_battle_active = 1 }
endscript

script score_battle_expire 
    score_battle_cleanup
    create_panel_message \{ id = goal_message text = 'Zeit abgelaufen!' style = panel_message_generic_loss }
    if ((score_battle_player_score)> (score_battle_opponent_score))
        GoalManager_SetGoalFlag name = <goal_id> got_1 1
    else
        GoalManager_LoseGoal name = <goal_id>
    endif
endscript

script score_battle_cleanup 
    ClearExceptionGroup \{ score_battle_player_monitor }
    KillSpawnedScript \{ name = score_battle_monitor_player }
    KillSpawnedScript \{ name = score_battle_update_last_point }
    score_battle_destroy_scoreboard
endscript

script score_battle_monitor_player 
    SetException \{ Ex = SkaterLanded scr = score_battle_player_landed group = score_battle_player_monitor }
    Block
endscript

script score_battle_player_landed 
    ClearExceptionGroup \{ score_battle_player_monitor }
    KillSpawnedScript \{ name = score_battle_monitor_player }
    SkaterGetLastScoreLanded
    change score_battle_player_score = ((score_battle_player_score)+ <last_score_landed>)
    score_battle_update_scoreboard player = 0 recent_points = <last_score_landed>
    SpawnScriptLater \{ score_battle_monitor_player }
endscript

script score_battle_update_opponent_score 
    if GoalManager_GoalIsActive name = <name>
        if ((score_battle_active)= 1)
            SkaterGetScoreInfo
            <player_score> = (<ScorePot> + (score_battle_player_score))
            <opponent_score> = (score_battle_opponent_score)
            if (<player_score> = 0)
                <player_score> = 1
            endif
            if (<opponent_score> = 0)
                <opponent_score> = 1
            endif
            if (<player_score> = <opponent_score>)
                <opponent_score> = (<opponent_score> + 1)
            endif
            if (<opponent_score> > <player_score>)
                <diff> = (<opponent_score> - <player_score>)
                <delta> = (<opponent_score> / <player_score>)
                if (<delta> < (score_battle_range_low))
                    getrandomvalue name = multiplier a = (ahead_by_little_min_mult)b = (ahead_by_little_max_mult)
                else
                    if (<delta> < (score_battle_range_medium))
                        getrandomvalue name = multiplier a = (ahead_by_medium_min_mult)b = (ahead_by_medium_max_mult)
                    else
                        getrandomvalue name = multiplier a = (ahead_by_lots_min_mult)b = (ahead_by_lots_max_mult)
                    endif
                endif
            else
                if (<opponent_score> < <player_score>)
                    <diff> = (<player_score> - <opponent_score>)
                    <delta> = (<player_score> / <opponent_score>)
                    if (<delta> < (score_battle_range_low))
                        getrandomvalue name = multiplier a = (behind_by_little_min_mult)b = (behind_by_little_max_mult)
                    else
                        if (<delta> < (score_battle_range_medium))
                            getrandomvalue name = multiplier a = (behind_by_medium_min_mult)b = (behind_by_medium_max_mult)
                        else
                            getrandomvalue name = multiplier a = (behind_by_lots_min_mult)b = (behind_by_lots_max_mult)
                        endif
                    endif
                endif
            endif
            <opponent_bonus> = (<multiplier> * <diff>)
            if (<opponent_bonus> < (score_battle_min_bonus_low))
                getrandomvalue name = opponent_min a = (score_battle_min_bonus_low)b = (score_battle_min_bonus_high)
                <opponent_bonus> = (<opponent_bonus> + <opponent_min>)
            endif
            <opponent_score> = (<opponent_score> + <opponent_bonus>)
            CastToInteger opponent_score
            change score_battle_opponent_score = <opponent_score>
            score_battle_update_scoreboard player = 1 recent_points = <opponent_bonus>
        endif
    endif
endscript
score_battle_winning_score_rgba = [ 50 128 50 128 ]
score_battle_losing_score_rgba = [ 128 50 50 128 ]

script score_battle_create_scoreboard name_font = small name_rgba = [ 128 128 128 128 ] opponent_name = 'Anderer Typ'
    if ScreenElementExists id = score_battle_scoreboard_anchor
        DestroyScreenElement id = score_battle_scoreboard_anchor
    endif
    SetScreenElementLock id = root_window Off
    CreateScreenElement {
        type = ContainerElement
        parent = root_window
        id = score_battle_scoreboard_anchor
        just = [ center top ]
        Pos = (300.0, 85.0)
    }
    FormatText textname = name '%a :' a = <opponent_name>
    CreateScreenElement {
        type = TextElement
        parent = score_battle_scoreboard_anchor
        id = score_battle_scoreboard_opponent_name
        just = [ RIGHT top ]
        Pos = (0.0, 0.0)
        text = <name>
        font = <name_font>
        rgba = <rgba>
        shadow
        shadow_rgba = UI_text_shadow_color
        shadow_offs = UI_text_shadow_offset
    }
    CreateScreenElement {
        type = TextElement
        parent = score_battle_scoreboard_anchor
        id = score_battle_scoreboard_opponent_score
        just = [ left top ]
        Pos = (0.0, 0.0)
        text = '0'
        font = newtimerfont
        Scale = 0.7000
        rgba = (score_battle_winning_score_rgba)
    }
    CreateScreenElement {
        type = TextElement
        parent = score_battle_scoreboard_anchor
        id = score_battle_scoreboard_opponent_last_point
        just = [ center center ]
        Pos = (0.0, 0.0)
        text = ''
        font = <name_font>
        Scale = 1.0
        rgba = [ 80 80 128 128 ]
        shadow
        shadow_rgba = UI_text_shadow_color
        shadow_offs = UI_text_shadow_offset
        z_priority = 300
    }
    CreateScreenElement {
        type = TextElement
        parent = score_battle_scoreboard_anchor
        id = score_battle_scoreboard_player_name
        just = [ RIGHT top ]
        Pos = (0.0, 0.0)
        text = 'Du:'
        font = <name_font>
        rgba = <rgba>
        shadow
        shadow_rgba = UI_text_shadow_color
        shadow_offs = UI_text_shadow_offset
    }
    CreateScreenElement {
        type = TextElement
        parent = score_battle_scoreboard_anchor
        id = score_battle_scoreboard_player_score
        just = [ left top ]
        Pos = (0.0, 0.0)
        text = '0'
        font = newtimerfont
        Scale = 0.7000
        rgba = (score_battle_winning_score_rgba)
    }
    CreateScreenElement {
        type = TextElement
        parent = score_battle_scoreboard_anchor
        id = score_battle_scoreboard_player_last_point
        just = [ center center ]
        Pos = (0.0, 0.0)
        text = ''
        font = <name_font>
        Scale = 1.0
        rgba = [ 80 80 128 128 ]
        shadow
        shadow_rgba = UI_text_shadow_color
        shadow_offs = UI_text_shadow_offset
        z_priority = 300
    }
    GetScreenElementDims id = score_battle_scoreboard_opponent_name
    <new_pos> = ((0.0, 1.0) * <height>)
    SetScreenElementProps {
        id = score_battle_scoreboard_player_name
        Pos = <new_pos>
    }
    SetScreenElementProps {
        id = score_battle_scoreboard_player_score
        Pos = <new_pos>
    }
endscript

script score_battle_update_scoreboard 
    if ScreenElementExists id = score_battle_scoreboard_anchor
        if ((score_battle_player_score)> (score_battle_opponent_score))
            <player_rgba> = (score_battle_winning_score_rgba)
            <opponent_rgba> = (score_battle_losing_score_rgba)
        else
            <player_rgba> = (score_battle_losing_score_rgba)
            <opponent_rgba> = (score_battle_winning_score_rgba)
        endif
        FormatText textname = new_score '%a' a = (score_battle_player_score)
        SetScreenElementProps {
            id = score_battle_scoreboard_player_score
            text = <new_score>
            rgba = <player_rgba>
        }
        FormatText textname = new_score '%a' a = (score_battle_opponent_score)
        SetScreenElementProps {
            id = score_battle_scoreboard_opponent_score
            text = <new_score>
            rgba = <opponent_rgba>
        }
        score_battle_update_last_point player = <player> recent_points = <recent_points>
    endif
endscript

script score_battle_update_last_point 
    if ScreenElementExists id = score_battle_scoreboard_anchor
        KillSpawnedScript name = score_battle_last_point_morph
        KillSpawnedScript name = score_battle_last_point_pulse
        DoScreenElementMorph id = score_battle_scoreboard_opponent_last_point Scale = 1.0 alpha = 0.0 time = 0.0 rot_angle = 0.0 Pos = (0.0, 0.0)
        DoScreenElementMorph id = score_battle_scoreboard_player_last_point Scale = 1.0 alpha = 0.0 time = 0.0 rot_angle = 0.0 Pos = (0.0, 0.0)
        DoScreenElementMorph id = score_battle_scoreboard_opponent_score Scale = 0.7000 time = 0.0
        DoScreenElementMorph id = score_battle_scoreboard_player_score Scale = 0.7000 time = 0.0
        DoScreenElementMorph id = score_battle_scoreboard_opponent_name Scale = 1.0 time = 0.0
        DoScreenElementMorph id = score_battle_scoreboard_player_name Scale = 1.0 time = 0.0
        if (<recent_points> > 0)
            if (<player> = 0)
                <last_point_element> = score_battle_scoreboard_player_last_point
                <score_element> = score_battle_scoreboard_player_score
                <y_offset> = 27
            else
                <last_point_element> = score_battle_scoreboard_opponent_last_point
                <score_element> = score_battle_scoreboard_opponent_score
                <y_offset> = 9
            endif
            CastToInteger recent_points
            FormatText textname = point_text '%a' a = <recent_points>
            SetScreenElementProps {
                id = <last_point_element>
                text = <point_text>
                Scale = 1.0
            }
            GetScreenElementDims id = <last_point_element>
            <last_point_width> = (<width> * 4)
            GetScreenElementDims id = <score_element>
            <score_width> = <width>
            <new_pos> = ((1.0, 0.0) * (<score_width> + (<last_point_width> / 2.0)))
            <new_pos> = (<new_pos> + ((0.0, 1.0) * <y_offset>))
            SetScreenElementProps {
                id = <last_point_element>
                Pos = <new_pos>
            }
            SpawnScriptLater score_battle_last_point_morph params = { last_point_element = <last_point_element> }
            SpawnScriptLater score_battle_last_point_pulse params = { player = <player> }
        endif
    endif
endscript

script score_battle_last_point_morph 
    getrandomvalue name = Angle a = -45.0 b = 45.0
    if ScreenElementExists id = <last_point_element>
        DoScreenElementMorph id = <last_point_element> Scale = 3.0 alpha = 0.5000 time = 0.1250 rot_angle = <Angle>
        wait 0.1250 seconds
    endif
    if ScreenElementExists id = <last_point_element>
        DoScreenElementMorph id = <last_point_element> Scale = 2.0 alpha = 0.7500 time = 0.1250 rot_angle = (<Angle> * -1)
        wait 0.1250 seconds
    endif
    if ScreenElementExists id = <last_point_element>
        DoScreenElementMorph id = <last_point_element> Scale = 4.0 alpha = 1.0 time = 0.1250 rot_angle = 0.0
        wait 0.1250 seconds
    endif
    if ScreenElementExists id = <last_point_element>
        DoScreenElementMorph id = <last_point_element> Scale = 0.2500 alpha = 0.0 time = 1.200
        wait 1.200 seconds
    endif
endscript

script score_battle_last_point_pulse 
    if (<player> = 0)
        <score_element> = score_battle_scoreboard_player_score
        <name_element> = score_battle_scoreboard_player_name
    else
        <score_element> = score_battle_scoreboard_opponent_score
        <name_element> = score_battle_scoreboard_opponent_name
    endif
    if ((ScreenElementExists id = <score_element>)& (ScreenElementExists id = <name_element>))
        DoScreenElementMorph id = <score_element> Scale = 1.0 time = 0.4000
        DoScreenElementMorph id = <name_element> Scale = 1.400 time = 0.4000
        wait 0.4000 seconds
    endif
    if ((ScreenElementExists id = <score_element>)& (ScreenElementExists id = <name_element>))
        DoScreenElementMorph id = <score_element> Scale = 0.7000 time = 0.7500
        DoScreenElementMorph id = <name_element> Scale = 1.0 time = 0.7500
        wait 0.7500 seconds
    endif
endscript

script score_battle_destroy_scoreboard 
    if ScreenElementExists \{ id = score_battle_scoreboard_anchor }
        DestroyScreenElement \{ id = score_battle_scoreboard_anchor }
    endif
endscript

script hide_score_battle_scoreboard 
    if ScreenElementExists \{ id = score_battle_scoreboard_anchor }
        score_battle_scoreboard_anchor ::DoMorph \{ alpha = 0 }
    endif
endscript

script unhide_score_battle_scoreboard 
    if ScreenElementExists \{ id = score_battle_scoreboard_anchor }
        score_battle_scoreboard_anchor ::DoMorph \{ alpha = 1 }
    endif
endscript

script goal_contest_wait_activate 
    printf \{ 'goal_contest_wait_activate' }
    GoalManager_GetGoalParams name = <goal_id>
    Block \{alltypes = [{ type = goal_cam_anim_post_start_done }{ type = goal_unload_pak_done }]}
    goal_contest_activate goal_id = <goal_id>
endscript

script goal_contest_activate 
    printf 'goal_contest_activate'
    GoalManager_GetGoalParams name = <goal_id>
    GetArraySize opponents
    <num_opponents> = <array_size>
    <opponent_status> = []
    <index> = 0
    begin 
    <tmp_array> = [ 1 ]
    <opponent_status> = (<opponent_status> + <tmp_array>)
    <index> = (<index> + 1)
    repeat <num_opponents>
    <opponent_scores> = []
    <index> = 0
    begin 
    <tmp_array> = [ 0 ]
    <opponent_scores> = (<opponent_scores> + <tmp_array>)
    <index> = (<index> + 1)
    repeat <num_opponents>
    GoalManager_EditGoal {
        name = <goal_id>
        params = {
            num_opponents = <num_opponents>
            num_opponents_remaining = <num_opponents>
            opponent_status = <opponent_status>
            opponent_scores = <opponent_scores>
            player_score = 0
        }
    }
    goal_contest_scoreboard_create opponents = <opponents>
    SpawnScriptLater {
        goal_contest_run
        params = {
            goal_id = <goal_id>
            opponents = <opponents>
            num_opponents = <num_opponents>
            opponent_status = <opponent_status>
            opponent_scores = <opponent_scores>
            opponent_update_range = <opponent_update_range>
            opponent_score_range = <opponent_score_range>
            player_score = 0
            restart_node = <restart_node>
        }
    }
endscript

script goal_contest_run 
    printf 'goal_contest_run'
    goal_initialize_skater control_type = skate restart_node = <restart_node>
    SpawnScriptLater goal_contest_monitor_player params = {goal_id = <goal_id> player_score = <player_score>}
    getrandomvalue name = opponent_update_time a = (<opponent_update_range> [ 0 ])b = (<opponent_update_range> [ 1 ])integer
    goal_contest_get_opponent num_opponents = <num_opponents> opponent_status = <opponent_status>
    <seconds> = 0
    begin 
    if (<opponent_update_time> = <seconds>)
        goal_contest_update_opponent {
            goal_id = <goal_id>
            opponent_index = <opponent_index>
            opponents = <opponents>
            opponent_scores = <opponent_scores>
            opponent_score_range = <opponent_score_range>
        }
        getrandomvalue name = opponent_update_time a = (<opponent_update_range> [ 0 ])b = (<opponent_update_range> [ 1 ])integer
        goal_contest_get_opponent num_opponents = <num_opponents> opponent_status = <opponent_status>
        <seconds> = 0
    endif
    <seconds> = (<seconds> + 1)
    wait 1 second
    repeat 
endscript

script goal_contest_get_opponent 
    printf 'goal_contest_get_opponent'
    <found_opponent> = 0
    begin 
    getrandomvalue name = opponent_index a = 0 b = (<num_opponents> -1)integer
    if ((<opponent_status> [ <opponent_index> ])= 1)
        <found_opponent> = 1
        break 
    endif
    repeat 50
    if (<found_opponent> = 0)
        <index> = 0
        begin 
        if ((<opponent_status> [ <index> ])= 1)
            <opponent_index> = <index>
        endif
        <index> = (<index> + 1)
        repeat <num_opponents>
    endif
    return opponent_index = <opponent_index>
endscript

script goal_contest_update_opponent 
    printf 'goal_contest_update_opponent'
    getrandomvalue name = last_score_landed a = (<opponent_score_range> [ 0 ])b = (<opponent_score_range> [ 1 ])integer
    SetArrayElement {
        arrayName = opponent_scores
        index = <opponent_index>
        newValue = ((<opponent_scores> [ <opponent_index> ])+ <last_score_landed>)
    }
    GoalManager_EditGoal {
        name = <goal_id>
        params = { opponent_scores = <opponent_scores> }
    }
    goal_contest_scoreboard_update goal_id = <goal_id>
    return opponent_scores = <opponent_scores>
endscript

script goal_contest_monitor_player 
    printf \{ 'goal_contest_monitor_player' }
    SetException {
        Ex = SkaterLanded
        scr = goal_contest_player_landed
        params = {goal_id = <goal_id> player_score = <player_score>}
    }
    Block
endscript

script goal_contest_player_landed 
    printf \{ 'goal_contest_player_landed' }
    ClearException \{ SkaterLanded }
    SkaterGetLastScoreLanded
    <player_score> = (<player_score> + <last_score_landed>)
    GoalManager_EditGoal {
        name = <goal_id>
        params = { player_score = <player_score> }
    }
    goal_contest_scoreboard_update goal_id = <goal_id>
    SpawnScriptLater goal_contest_monitor_player params = {goal_id = <goal_id> player_score = <player_score>}
endscript

script goal_contest_expire 
    printf 'goal_contest_expire'
    GoalManager_GetGoalParams name = <goal_id>
    KillSpawnedScript name = goal_contest_run
    KillSpawnedScript name = goal_contest_monitor_player
    <lowest_score> = 999999999
    <lowest_index> = -1
    <index> = 0
    begin 
    if ((<opponent_status> [ <index> ])= 1)
        if ((<opponent_scores> [ <index> ])< <lowest_score>)
            <lowest_score> = (<opponent_scores> [ <index> ])
            <lowest_index> = <index>
        endif
    endif
    <index> = (<index> + 1)
    repeat <num_opponents>
    if (<player_score> < <lowest_score>)
        GoalManager_LoseGoal name = <goal_id>
    else
        SetArrayElement {
            arrayName = opponent_status
            index = <lowest_index>
            newValue = 0
        }
        if IsInNodeArray (<opponents> [ <lowest_index> ].id)
            Kill name = (<opponents> [ <lowest_index> ].id)
        endif
        <num_opponents_remaining> = (<num_opponents_remaining> - 1)
        if (<num_opponents_remaining> = 0)
            GoalManager_WinGoal name = <goal_id>
        else
            goal_contest_eliminate name = (<opponents> [ <lowest_index> ].name)
            if GotParam reset_scores_each_round
                <player_score> = 0
                ResetScore
                <opponent_scores> = []
                <index> = 0
                begin 
                <tmp_array> = [ 0 ]
                <opponent_scores> = (<opponent_scores> + <tmp_array>)
                <index> = (<index> + 1)
                repeat <num_opponents>
            endif
            GoalManager_EditGoal {
                name = <goal_id>
                params = {
                    opponent_status = <opponent_status>
                    num_opponents_remaining = <num_opponents_remaining>
                    opponent_scores = <opponent_scores>
                    player_score = <player_score>
                }
            }
            goal_contest_scoreboard_update goal_id = <goal_id>
            GoalManager_AddTime name = <goal_id> <round_length>
            goal_contest_next_round
            SpawnScriptLater {
                goal_contest_run
                params = {
                    goal_id = <goal_id>
                    opponents = <opponents>
                    num_opponents = <num_opponents>
                    opponent_status = <opponent_status>
                    opponent_scores = <opponent_scores>
                    opponent_update_range = <opponent_update_range>
                    opponent_score_range = <opponent_score_range>
                    player_score = <player_score>
                    restart_node = <restart_node>
                }
            }
        endif
    endif
endscript

script goal_contest_cleanup 
    goal_contest_scoreboard_destroy
    KillSpawnedScript \{ name = goal_contest_run }
    KillSpawnedScript \{ name = goal_contest_monitor_player }
    KillSpawnedScript \{ name = score_battle_last_point_morph }
    KillSpawnedScript \{ name = score_battle_last_point_pulse }
endscript
goal_contest_scoreboard_in_rgba = [ 70 70 128 128 ]
goal_contest_scoreboard_out_rgba = [ 60 60 60 60 ]
goal_contest_scoreboard_highest_rgba = [ 70 128 70 128 ]
goal_contest_scoreboard_lowest_rgba = [ 128 70 70 128 ]

script goal_contest_scoreboard_create 
    if ScreenElementExists id = goal_contest_scoreboard
        DestroyScreenElement id = goal_contest_scoreboard
    endif
    SetScreenElementLock id = root_window Off
    <Pos> = (420.0, 60.0)
    CreateScreenElement {
        type = ContainerElement
        parent = root_window
        id = goal_contest_scoreboard
        just = [ left top ]
        Pos = <Pos>
    }
    <Pos> = (0.0, 0.0)
    CreateScreenElement {
        type = TextElement
        parent = goal_contest_scoreboard
        local_id = player_name
        just = [ left top ]
        Pos = <Pos>
        font = dialog
        text = 'DU :'
        rgba = (goal_contest_scoreboard_in_rgba)
        Scale = 0.7500
    }
    CreateScreenElement {
        type = TextElement
        parent = goal_contest_scoreboard
        local_id = player_score
        just = [ left top ]
        Pos = (<Pos> + (140.0, 0.0))
        font = dialog
        text = '0'
        rgba = (goal_contest_scoreboard_in_rgba)
        Scale = 0.7500
    }
    GetArraySize opponents
    <index> = 0
    begin 
    <Pos> = (<Pos> + (0.0, 14.0))
    FormatText textname = text '%s : ' s = (<opponents> [ <index> ].name)
    FormatText checksumname = name_id 'name%n' n = <index>
    FormatText checksumname = score_id 'score%n' n = <index>
    CreateScreenElement {
        type = TextElement
        parent = goal_contest_scoreboard
        local_id = <name_id>
        just = [ left top ]
        Pos = <Pos>
        font = dialog
        text = <text>
        rgba = (goal_contest_scoreboard_in_rgba)
        Scale = 0.7500
    }
    CreateScreenElement {
        type = TextElement
        parent = goal_contest_scoreboard
        local_id = <score_id>
        just = [ left top ]
        Pos = (<Pos> + (140.0, 0.0))
        font = dialog
        text = '0'
        rgba = (goal_contest_scoreboard_in_rgba)
        Scale = 0.7500
    }
    <index> = (<index> + 1)
    repeat <array_size>
endscript

script goal_contest_scoreboard_update 
    GoalManager_GetGoalParams name = <goal_id>
    FormatText textname = Score '%n' n = <player_score>
    SetScreenElementProps {
        id = { goal_contest_scoreboard child = player_score }
        text = <Score>
        rgba = (goal_contest_scoreboard_in_rgba)
    }
    SetScreenElementProps {
        id = { goal_contest_scoreboard child = player_name }
        rgba = (goal_contest_scoreboard_in_rgba)
    }
    GetArraySize opponents
    <lowest> = 999999999
    <lowest_index> = -1
    <highest> = -1
    <highest_index> = -1
    <index> = 0
    begin 
    <is_in> = 1
    if ((<opponent_status> [ <index> ])= 0)
        <Score> = '------'
        <rgba> = (goal_contest_scoreboard_out_rgba)
        <is_in> = 0
    else
        FormatText textname = Score '%n' n = (<opponent_scores> [ <index> ])
        <rgba> = (goal_contest_scoreboard_in_rgba)
    endif
    FormatText checksumname = score_id 'score%n' n = <index>
    FormatText checksumname = name_id 'name%n' n = <index>
    SetScreenElementProps {
        id = {goal_contest_scoreboard child = <score_id>}
        text = <Score>
        rgba = <rgba>
    }
    SetScreenElementProps {
        id = {goal_contest_scoreboard child = <name_id>}
        rgba = <rgba>
    }
    if (<is_in>)
        if ((<opponent_scores> [ <index> ])< <lowest>)
            <lowest> = (<opponent_scores> [ <index> ])
            <lowest_index> = <index>
        endif
        if ((<opponent_scores> [ <index> ])> <highest>)
            <highest> = (<opponent_scores> [ <index> ])
            <highest_index> = <index>
        endif
    endif
    <index> = (<index> + 1)
    repeat <array_size>
    if (<player_score> < <lowest>)
        <name_id> = player_name
        <score_id> = player_score
    else
        FormatText checksumname = name_id 'name%n' n = <lowest_index>
        FormatText checksumname = score_id 'score%n' n = <lowest_index>
    endif
    SetScreenElementProps {
        id = {goal_contest_scoreboard child = <name_id>}
        rgba = (goal_contest_scoreboard_lowest_rgba)
    }
    SetScreenElementProps {
        id = {goal_contest_scoreboard child = <score_id>}
        rgba = (goal_contest_scoreboard_lowest_rgba)
    }
    if (<player_score> > <highest>)
        <name_id> = player_name
        <score_id> = player_score
    else
        FormatText checksumname = name_id 'name%n' n = <highest_index>
        FormatText checksumname = score_id 'score%n' n = <highest_index>
    endif
    SetScreenElementProps {
        id = {goal_contest_scoreboard child = <name_id>}
        rgba = (goal_contest_scoreboard_highest_rgba)
    }
    SetScreenElementProps {
        id = {goal_contest_scoreboard child = <score_id>}
        rgba = (goal_contest_scoreboard_highest_rgba)
    }
endscript

script goal_contest_scoreboard_destroy 
    if ScreenElementExists \{ id = goal_contest_scoreboard }
        DestroyScreenElement \{ id = goal_contest_scoreboard }
    endif
endscript

script goal_contest_next_round 
    create_panel_message \{ id = goal_contest_next_round_msg text = 'Nächste Runde!' style = panel_message_goalcompleteline2 }
    PlayStream \{ VansTakeLead vol = 160 priority = StreamPriorityHigh }
endscript

script goal_contest_eliminate 
    FormatText textname = text '%s eliminiert!' s = <name>
    create_panel_message {
        id = goal_contest_eliminate_msg
        text = <text>
        style = panel_message_goalfailline2
    }
endscript

script goal_buy_wait_activate 
    GoalManager_GetGoalParams name = <goal_id>
    if (<wait_igc> = 1)
        Block \{ type = goal_cam_anim_done }
    endif
    if (<wait_pak> = 1)
        Block \{ type = goal_unload_pak_done }
    endif
    goal_buy_activate goal_id = <goal_id>
endscript

script goal_buy_activate 
    printf 'goal_buy_activate'
    GoalManager_GetGoalParams name = <goal_id>
    speech_box_exit
    hide_all_hud_items
    skater ::disableplayerinput
    skater ::PausePhysics
    SpawnScriptLater goal_buy_skater_stand
    CareerFunc func = GetCash
    if ((<cash> > <buy_goal_cost>)|| (<cash> = <buy_goal_cost>))
        <buttons> = [
            {
                text = 'Okay, hier ist das Geld.'
                pad_choose_script = goal_buy_pay_now
                pad_choose_params = {buy_goal_cost = <buy_goal_cost> goal_id = <goal_id>}
            }
            {
                text = 'Nein, danke.'
                pad_choose_script = goal_buy_pay_later
            }
        ]
    else
        <buttons> = [
            {
                text = 'Ich komme mit mehr Geld zurück.'
                pad_choose_script = goal_buy_pay_later
            }
        ]
    endif
    FormatText textname = text 'Du musst zahlen: $%a\nDu hast: $%b' a = <buy_goal_cost> b = <cash>
    create_snazzy_dialog_box {
        Title = <buy_goal_title>
        text = <text>
        text_dims = (400.0, 0.0)
        no_bg
        buttons = <buttons>
    }
endscript

script goal_buy_skater_stand 
    printf \{ 'goal_buy_skater_stand' }
    begin 
    skater ::Skater_Playanim \{ anim = WStand }
    skater ::Skater_WaitAnimFinished
    repeat 
endscript

script goal_buy_pay_now 
    printf \{ 'goal_buy_pay_now' }
    CareerFunc func = AddCash params = {cash = (<buy_goal_cost> * -1)}
    GoalManager_WinGoal name = <goal_id>
    goal_buy_exit
endscript

script goal_buy_pay_later 
    printf \{ 'goal_buy_pay_later' }
    goal_quit_current_goal
    goal_buy_exit
endscript

script goal_buy_exit 
    printf \{ 'goal_buy_exit' }
    dialog_box_exit
    KillSpawnedScript \{ name = goal_buy_skater_stand }
    skater ::Skater_Playanim \{ anim = WRunToSkate }
    skater ::UnPausePhysics
    skater ::input_debounce \{ x }
    skater ::enableplayerinput
    show_all_hud_items
endscript

script goal_change_look_wait_activate 
    GoalManager_GetGoalParams name = <goal_id>
    if (<wait_igc> = 1)
        Block \{ type = goal_cam_anim_done }
    endif
    if (<wait_pak> = 1)
        Block \{ type = goal_unload_pak_done }
    endif
    goal_change_look_activate goal_id = <goal_id> specific_change = <specific_change>
endscript

script goal_change_look_activate 
    if NOT GotParam \{ specific_change }
        GetPlayerAppearance
        GoalManager_EditGoal {
            name = <goal_id>
            params = {
                pre_profile = <profile>
            }
        }
    endif
endscript

script goal_change_look_check_change 
    if GoalManager_GoalIsActive name = <name>
        GoalManager_GetGoalParams name = <name>
        GetPlayerAppearance
        if NOT GotParam profile
            return 
        endif
        <result> = 0
        if GotParam specific_change
            if AppearanceChangedSpecific profile = <profile> specific_change = <specific_change>
                <result> = 1
            else
                <result> = 0
            endif
        else
            if NOT GotParam pre_profile
                return 
            endif
            if AppearanceChanged a = <pre_profile> b = <profile>
                <result> = 1
            else
                <result> = 0
            endif
        endif
        if (<result> = 1)
            GoalManager_WinGoal name = <name>
        else
            GoalManager_LoseGoal name = <name>
        endif
    endif
endscript

script goal_transfer_special_wait_activate 
    GoalManager_GetGoalParams name = <goal_id>
    if (<wait_igc> = 1)
        Block \{ type = goal_cam_anim_done }
    endif
    if (<wait_pak> = 1)
        Block \{ type = goal_unload_pak_done }
    endif
    goal_transfer_special_activate {
        goal_id = <goal_id>
        trigger_obj_id = <trigger_obj_id>
        ped_special_value = <ped_special_value>
        ped_special_drop_rate = <ped_special_drop_rate>
        warning_time = <warning_time>
    }
endscript

script goal_transfer_special_activate 
    goal_transfer_special_create_meter ped_special_value = <ped_special_value>
    SpawnScriptLater {
        goal_transfer_special_consume_meter
        params = {
            goal_id = <goal_id>
            ped_special_drop_rate = <ped_special_drop_rate>
            warning_time = <warning_time>
        }
    }
    RunScriptOnObject {
        id = <trigger_obj_id>
        goal_transfer_special_set_in_exception
        params = {
            goal_id = <goal_id>
            ped_special_drop_rate = <ped_special_drop_rate>
            warning_time = <warning_time>
            trigger_obj_id = <trigger_obj_id>
        }
    }
endscript

script goal_transfer_special_set_in_exception 
    obj_setinnerradius \{ 16 }
    obj_getid
    SetEventHandlerOnObject {
        object = <ObjID>
        exception
        Ex = objectinradius
        scr = goal_transfer_special_trigger
        params = {
            goal_id = <goal_id>
            ped_special_drop_rate = <ped_special_drop_rate>
            warning_time = <warning_time>
            trigger_obj_id = <trigger_obj_id>
        }
    }
endscript

script goal_transfer_special_set_out_exception 
    Obj_ClearException \{ objectinradius }
    obj_setouterradius \{ 20 }
    obj_getid
    SetEventHandlerOnObject {
        object = <ObjID>
        exception
        Ex = objectoutofradius
        scr = goal_transfer_special_reset_in_exception
        params = {
            goal_id = <goal_id>
            ped_special_drop_rate = <ped_special_drop_rate>
            warning_time = <warning_time>
            trigger_obj_id = <trigger_obj_id>
        }
    }
endscript

script goal_transfer_special_reset_in_exception 
    Obj_ClearException \{ objectoutofradius }
    speech_box_exit \{ anchor_id = goal_transfer_special_speech_box }
    RunScriptOnObject {
        id = <trigger_obj_id>
        goal_transfer_special_set_in_exception
        params = {
            goal_id = <goal_id>
            ped_special_drop_rate = <ped_special_drop_rate>
            warning_time = <warning_time>
            trigger_obj_id = <trigger_obj_id>
        }
    }
endscript

script goal_transfer_special_trigger 
    if NOT skater ::IsInBail
        if NOT SkaterCurrentScorePotGreaterThan 0
            RunScriptOnObject {
                id = <trigger_obj_id>
                goal_transfer_special_set_out_exception
                params = {
                    goal_id = <goal_id>
                    ped_special_drop_rate = <ped_special_drop_rate>
                    warning_time = <warning_time>
                    trigger_obj_id = <trigger_obj_id>
                }
            }
            create_speech_box {
                anchor_id = goal_transfer_special_speech_box
                text = 'Drück \ms für einen Spezial-Transfer.'
                no_pad_choose
                no_pad_start
                pad_option_script = goal_transfer_special_transfer
                pad_option_params = {
                    goal_id = <goal_id>
                    ped_special_drop_rate = <ped_special_drop_rate>
                    warning_time = <warning_time>
                    trigger_obj_id = <trigger_obj_id>
                }
                bg_rgba = [ 100 100 100 128 ]
                text_rgba = [ 128 128 128 128 ]
                z_priority = 5
            }
        endif
    endif
endscript

script goal_transfer_special_create_meter 
    SetScreenElementLock id = root_window Off
    CreateScreenElement {
        type = ContainerElement
        parent = root_window
        id = goal_transfer_special_anchor
        Pos = (560.0, 380.0)
        just = [ left top ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = goal_transfer_special_anchor
        id = goal_transfer_special_bg_border
        texture = white2
        Pos = (-2.0, 4.0)
        just = [ left bottom ]
        Scale = (4.5, 17.0)
        rgba = [ 15 15 15 128 ]
        z_priority = 7
    }
    CreateScreenElement {
        type = SpriteElement
        parent = goal_transfer_special_anchor
        id = goal_transfer_special_bg
        texture = white2
        Pos = (4.0, 0.0)
        just = [ left bottom ]
        Scale = (3.0, 16.0)
        rgba = [ 30 30 30 128 ]
        z_priority = 8
    }
    CreateScreenElement {
        type = SpriteElement
        parent = goal_transfer_special_anchor
        id = goal_transfer_special_meter
        texture = white2
        Pos = (8.0, 0.0)
        just = [ left bottom ]
        Scale = (2.5, 16.0)
        rgba = [ 128 28 88 128 ]
        z_priority = 9
    }
    CreateScreenElement {
        type = SpriteElement
        parent = goal_transfer_special_anchor
        id = goal_transfer_special_mark4
        texture = white2
        Pos = (0.0, -100.0)
        just = [ left bottom ]
        Scale = (4.0, 0.5)
        rgba = [ 60 60 60 128 ]
        z_priority = 10
    }
    CreateScreenElement {
        type = SpriteElement
        parent = goal_transfer_special_anchor
        id = goal_transfer_special_mark3
        texture = white2
        Pos = (0.0, -75.0)
        just = [ left bottom ]
        Scale = (4.0, 0.5)
        rgba = [ 60 60 60 128 ]
        z_priority = 10
    }
    CreateScreenElement {
        type = SpriteElement
        parent = goal_transfer_special_anchor
        id = goal_transfer_special_mark2
        texture = white2
        Pos = (0.0, -50.0)
        just = [ left bottom ]
        Scale = (4.0, 0.5)
        rgba = [ 60 60 60 128 ]
        z_priority = 10
    }
    CreateScreenElement {
        type = SpriteElement
        parent = goal_transfer_special_anchor
        id = goal_transfer_special_mark1
        texture = white2
        Pos = (0.0, -25.0)
        just = [ left bottom ]
        Scale = (4.0, 0.5)
        rgba = [ 60 60 60 128 ]
        z_priority = 10
    }
    CreateScreenElement {
        type = SpriteElement
        parent = goal_transfer_special_anchor
        id = goal_transfer_special_highlight
        texture = white2
        Pos = (8.0, -4.0)
        just = [ left bottom ]
        Scale = (0.25, 15.0)
        rgba = [ 90 90 90 40 ]
        z_priority = 11
    }
    CreateScreenElement {
        type = TextElement
        parent = goal_transfer_special_anchor
        id = goal_transfer_special_text
        font = small
        text = 'KRAFT'
        Pos = (-20.0, 20.0)
        just = [ left bottom ]
        Scale = (1.0, 1.0)
        rgba = [ 70 70 70 128 ]
        z_priority = 11
        shadow
        shadow_rgba = UI_text_shadow_color
        shadow_offs = UI_text_shadow_offset
    }
    goal_transfer_special_anchor ::settags val = <ped_special_value> warning_set = 0
endscript

script goal_transfer_special_destroy_meter 
    if ScreenElementExists \{ id = goal_transfer_special_anchor }
        DestroyScreenElement \{ id = goal_transfer_special_anchor }
    endif
endscript

script goal_transfer_special_consume_meter 
    begin 
    goal_transfer_special_anchor ::getsingletag val
    if (<val> > 0.0)
        <val> = (<val> - 0.01000)
        goal_transfer_special_anchor ::settags val = <val>
        <Scale> = (((0.0, 1.0) * (16.0 * <val>))+ (2.5, 0.0))
        goal_transfer_special_meter ::DoMorph Scale = <Scale>
    else
        goal_transfer_special_anchor ::getsingletag warning_set
        if (<warning_set> = 0)
            SpawnScriptLater goal_transfer_special_warning_start params = {goal_id = <goal_id> warning_time = <warning_time>}
        endif
    endif
    wait <ped_special_drop_rate> gameframes
    repeat 
endscript

script goal_transfer_special_warning_start 
    goal_transfer_special_anchor ::settags warning_set = 1
    goal_transfer_special_warn_msg goal_id = <goal_id>
    <time> = (<warning_time> + 1)
    SetScreenElementLock id = root_window Off
    CreateScreenElement {
        type = ContainerElement
        parent = root_window
        id = goal_transfer_special_warning
        Pos = (560.0, 220.0)
        just = [ left top ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = goal_transfer_special_warning
        id = goal_transfer_special_warning_bg
        texture = white2
        Pos = (0.0, 0.0)
        just = [ left top ]
        Scale = (4.0, 4.0)
        rgba = [ 128 10 10 128 ]
        z_priority = 7
    }
    FormatText textname = text '%n' n = <time>
    CreateScreenElement {
        type = TextElement
        parent = goal_transfer_special_warning
        id = goal_transfer_special_warning_num
        Pos = (3.0, -3.0)
        just = [ left top ]
        Scale = (1.5, 1.5)
        rgba = [ 128 128 128 128 ]
        font = newtrickfont
        text = <text>
        z_priority = 8
    }
    begin 
    <time> = (<time> - 1)
    if (<time> < 0)
        GoalManager_LoseGoal name = <goal_id>
    endif
    FormatText textname = text '%n' n = <time>
    SetScreenElementProps {
        id = goal_transfer_special_warning_num
        text = <text>
    }
    wait 1 second
    repeat 
endscript

script goal_transfer_special_warn_msg 
    GoalManager_GetGoalParams name = <goal_id>
    FormatText textname = message '%s nur bei gefüllter Spezialanzeige! ' s = <full_name>
    create_panel_message {
        id = goal_current_reward
        text = <message>
        style = panel_message_red_big_midscreen
    }
endscript

script goal_transfer_special_warning_end 
    if ScreenElementExists \{ id = goal_transfer_special_anchor }
        goal_transfer_special_anchor ::settags \{ warning_set = 0 }
    endif
    KillSpawnedScript \{ name = goal_transfer_special_warning_start }
    if ScreenElementExists \{ id = goal_transfer_special_warning }
        DestroyScreenElement \{ id = goal_transfer_special_warning }
    endif
endscript

script goal_transfer_special_transfer 
    if NOT SkaterCurrentScorePotGreaterThan 0
        Debounce Circle time = 0.5000
        speech_box_exit anchor_id = goal_start_dialog
        skater ::GetSpecialValue
        if (<value> > 0)
            goal_transfer_special_warning_end
            KillSpawnedScript name = goal_transfer_special_consume_meter
            skater ::GetSpecialValue
            <value> = (<value> / 3000.0)
            skater ::SetSpecialValue value = -1
            goal_transfer_special_anchor ::getsingletag val
            <new_val> = (<val> + <value>)
            if (<new_val> > 1.0)
                <new_val> = 1.0
            endif
            goal_transfer_special_anchor ::settags val = <new_val>
            SpawnScriptLater {
                goal_transfer_special_consume_meter
                params = {
                    goal_id = <goal_id>
                    ped_special_drop_rate = <ped_special_drop_rate>
                    warning_time = <warning_time>
                }
            }
            goal_transfer_special_transfer_msg
        else
            goal_transfer_special_no_transfer_msg
        endif
        RunScriptOnObject {
            id = <trigger_obj_id>
            goal_transfer_special_set_in_exception
            params = {
                goal_id = <goal_id>
                ped_special_drop_rate = <ped_special_drop_rate>
                warning_time = <warning_time>
                trigger_obj_id = <trigger_obj_id>
            }
        }
    endif
endscript

script goal_transfer_special_transfer_msg 
    create_panel_message \{ id = goal_current_reward text = 'Danke! Mach weiter so!' style = goal_message_bouncy_blue_midscreen }
endscript

script goal_transfer_special_no_transfer_msg 
    create_panel_message \{ id = goal_current_reward text = 'Deine Spezialanzeige ist nicht gefüllt!' style = goal_message_bouncy_blue_midscreen }
endscript

script goal_transfer_special_expire 
    goal_transfer_special_cleanup trigger_obj_id = <trigger_obj_id>
    GoalManager_WinGoal name = <goal_id>
endscript

script goal_transfer_special_cleanup 
    KillSpawnedScript \{ name = goal_transfer_special_consume_meter }
    goal_transfer_special_warning_end
    goal_transfer_special_destroy_meter
    if IsCreated <trigger_obj_id>
        RunScriptOnObject {
            id = <trigger_obj_id>
            goal_transfer_special_clear_exceptions
        }
    endif
    speech_box_exit \{ anchor_id = goal_transfer_special_speech_box }
endscript

script goal_transfer_special_clear_exceptions 
    Obj_ClearException \{ objectinradius }
    Obj_ClearException \{ objectoutofradius }
endscript
