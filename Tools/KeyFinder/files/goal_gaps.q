
Goal_Gaps_genericParams = {
    goal_text = 'generic gaps text'
    view_goals_text = 'Gaps goal'
    time = 120
    init = goal_gaps_init
    uninit = goal_uninit
    activate = goal_gaps_activate
    active = goal_gaps_active
    deactivate = goal_gaps_deactivate
    expire = goal_gaps_expire
    success = goal_gaps_success
    fail = goal_gaps_fail
    trigger_obj_id = TRG_G_GAP_PRO
    restart_node = TRG_G_GAP_RESTARTNODE
    start_pad_id = G_GAP_StartPad
    record_type = Score
    gaps
}

script goal_gaps_init 
    goal_init goal_id = <goal_id>
endscript


script goal_gaps_activate 
    if GameModeEquals is_creategoals
        skater ::LandSkaterTricks
    endif
    if GotParam no_cam_anim
        goal_passive_start goal_id = <goal_id>
    else
        goal_start goal_id = <goal_id>
    endif
endscript


script goal_gaps_deactivate 
    GoalManager_ResetGoalTrigger name = <goal_id>
    goal_deactivate goal_id = <goal_id>
endscript


script goal_gaps_success 
    if ScreenElementExists id = goal_gaps_got_gap_message
        DestroyScreenElement id = goal_gaps_got_gap_message
    endif
    goal_success goal_id = <goal_id>
endscript


script goal_gaps_fail 
    goal_fail goal_id = <goal_id>
endscript


script goal_gaps_expire 
    goal_expire goal_id = <goal_id>
    GoalManager_LoseGoal name = <goal_id>
endscript


script goal_gaps_got_gap 
    if NOT GoalManager_AllFlagsSet name = <goal_id>
        if ScreenElementExists id = goal_gaps_got_gap_message
            DestroyScreenElement id = goal_gaps_got_gap_message
        endif
        if NOT GotParam collect_type
            <collect_type> = 'gaps'
        endif
        FormatText textname = got_gap_text '%c of %n %s' c = <num_flags_set> n = <num_flags> s = <collect_type>
        create_panel_message id = goal_gaps_got_gap_message text = <got_gap_text> style = goal_collect_text
    endif
endscript

