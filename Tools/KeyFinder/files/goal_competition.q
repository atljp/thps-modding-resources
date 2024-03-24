
Goal_Comp_GenericParams = {
    goal_text = 'Competition test...'
    goal_description = '3 Runs\nYou lose points for bailing\nBest two runs wins'
    view_goals_text = 'Medal the Competition'
    time = 30
    init = goal_comp_init
    uninit = goal_uninit
    activate = goal_comp_activate
    deactivate = goal_comp_deactivate
    expire = goal_comp_expire
    success = goal_comp_success
    trigger_obj_id = TRG_G_JUDGE_COMP
    geo_prefix = 'G_COMP_'
    restart_node = TRG_G_COMP_RestartNode
    start_pad_id = G_COMP_StartPad
    already_ended_run = 0
    competition
    record_type = Score
}

script goal_comp_init 
    goal_init goal_id = <goal_id>
endscript


script goal_comp_activate 
    GoalManager_EditGoal name = <goal_id> params = { already_ended_run = 0 }
    goal_start goal_id = <goal_id>
    GoalManager_PauseCompetition name = <goal_id>
    if NOT CompetitionEnded
        EndCompetition
    endif
    if GotParam leader_board_names
        PermuteArray newarrayname = leader_board_names array = <leader_board_names>
    endif
    StartCompetition {
        gold = <gold>
        silver = <silver>
        bronze = <bronze>
        gold_score = <gold_score>
        silver_score = <silver_score>
        bronze_score = <bronze_score>
        bail = <bail>
        extra_params = {
            leader_board_names = <leader_board_names>
            first_place_name = <first_place_name>
        }
    }
    SetScoreAccumulation 1
    StartCompetitionRun
    skater ::runstarted
    KillSpawnedScript name = KillNixonTimer
    wait 0.1000 seconds
    if ObjectExists id = nixon_timer_box
        DestroyScreenElement id = nixon_timer_box
        wait 0.1000 seconds
    endif
    CreateScreenElement {
        type = ContainerElement
        id = nixon_timer_box
        parent = root_window
        Pos = (311.0, 35.0)
    }
endscript


script goal_comp_expire 
    kill_start_key_binding
    GoalManager_GetGoalParams name = <goal_id>
    GoalManager_EditGoal name = <goal_id> params = { already_ended_run = 1 }
    pause_trick_text
    GoalManager_PauseCompetition name = <goal_id>
    if NOT RoundIs 3
        GoalManager_SetGoalTimer name = <goal_id>
    endif
    SpawnSkaterScript goal_comp_expire2 params = <...> 
endscript


script goal_comp_expire2 
    root_window ::settags giving_rewards = 1
    root_window ::settags showing_comp_results = 1
    if ObjectExists id = goal_comp_out_of_bounds_warning
        DestroyScreenElement id = goal_comp_out_of_bounds_warning
    endif
    wait 1 frame
    PauseSkaters
    if RoundIs 3
        EndCompetitionRun
        WaitForEvent type = comp_continue
        goal_comp_show_results goal_id = <goal_id>
        WaitForEvent type = comp_continue
        GoalManager_UnPauseCompetition name = <goal_id>
        GoalManager_DeactivateGoal name = <goal_id>
    else
        EndCompetitionRun
        ResetScore
        WaitForEvent type = comp_continue
        if ObjectExists id = goal_comp_out_of_bounds_warning
            DestroyScreenElement id = goal_comp_out_of_bounds_warning
        endif
        if ObjectExists id = comp_root_anchor
            DestroyScreenElement id = comp_root_anchor
        endif
        ResetSkaters node_name = <restart_node>
        GoalManager_EditGoal name = <goal_id> params = { already_ended_run = 0 }
        SetScoreAccumulation 1
        StartCompetitionRun
        Debounce x time = 0.3000 Clear = 1
        wait 1 frame
        GoalManager_UnPauseCompetition name = <goal_id>
        runstarted
    endif
    root_window ::settags giving_rewards = 0
    root_window ::settags showing_comp_results = 0
endscript


script goal_comp_deactivate 
    KillSkaterCamAnim all
    KillSpawnedScript name = goal_comp_expire2
    KillSpawnedScript name = goal_comp_end_current_run
    EndCompetition
    GoalManager_ResetGoalTrigger name = <goal_id>
    goal_deactivate goal_id = <goal_id>
    if ObjectExists id = comp_root_anchor
        DestroyScreenElement id = comp_root_anchor
    endif
    if ObjectExists id = goal_comp_out_of_bounds_warning
        DestroyScreenElement id = goal_comp_out_of_bounds_warning
    endif
    if ObjectExists id = comp_leader_board_anchor
        DestroyScreenElement id = comp_leader_board_anchor
    endif
    if ObjectExists id = comp_scores_anchor
        DestroyScreenElement id = comp_scores_anchor
    endif
    unpause_trick_text
    KillSpawnedScript name = KillNixonTimer
    wait 0.1000 seconds
    SpawnScript KillNixonTimer
    ResetSkaters node_name = <restart_node>
    MakeSkaterGoto HandBrake
endscript


script KillNixonTimer 
    if ObjectExists nixon_timer_box
        DoScreenElementMorph id = nixon_timer_sprite time = 0.3000 Scale = (0.0, 0.0) alpha = 0
        RunScriptOnScreenElement id = the_time clock_morph
        wait 0.5000 seconds
        DestroyScreenElement id = nixon_timer_box
    endif
    KillSpawnedScript name = KillNixonTimer
endscript


script goal_comp_leave_area 
    if GoalManager_GoalIsActive name = <goal_id>
        create_panel_message id = goal_comp_out_of_bounds_warning text = 'You\'re out of the competition area!' style = goal_comp_out_of_bounds_text
        ResetScorePot usebailstyle
        SetScoreAccumulation 0 freeze_score
    endif
endscript


script goal_comp_enter_area 
    if GoalManager_GoalIsActive name = <goal_id>
        if ObjectExists id = goal_comp_out_of_bounds_warning
            DestroyScreenElement id = goal_comp_out_of_bounds_warning
        endif
        ResetScorePot
        SetScoreAccumulation 1
    endif
endscript


script goal_comp_continue 
    KillSpawnedScript name = goal_comp_show_run_scores
    KillSpawnedScript name = goal_comp_add_leader_board
    restore_start_key_binding
    if ObjectExists id = comp_root_anchor
        DestroyScreenElement id = comp_root_anchor
    endif
    unpause_trick_text
    UnpauseSkaters
    Debounce x time = 0.3000 Clear = 1
    FireEvent type = comp_continue
    speech_box_exit
endscript


script goal_comp_success 
    goal_success goal_id = <goal_id>
endscript


script goal_comp_show_run_scores 
    SetScreenElementLock id = root_window Off
    CreateScreenElement {
        type = ContainerElement
        parent = root_window
        id = comp_root_anchor
        dims = (640.0, 480.0)
        Pos = (340.0, 250.0)
    }
    PauseSkaters
    SetScreenElementProps {
        id = root_window
        event_handlers = [{ pad_start NullScript }]
        replace_handlers
    }
    CreateScreenElement {
        type = ContainerElement
        parent = comp_root_anchor
        id = comp_scores_anchor
        Pos = (330.0, 250.0)
        dims = (640.0, 480.0)
    }
    CreateScreenElement {
        type = hmenu
        parent = comp_scores_anchor
        id = scores_hmenu
        Pos = (400.0, 117.0)
        just = [ RIGHT top ]
        padding_scale = 1.300
        regular_space_amount = 40
    }
    FormatText textname = score_text '%i' i = (<total_score>)
    CreateScreenElement {
        type = TextElement
        id = goal_comp_average_score
        Scale = (1.0)
        parent = comp_scores_anchor
        Pos = (460.0, 117.0)
        just = [ RIGHT top ]
        font = dialog
        text = <score_text>
        rgba = [ 0 0 0 0 ]
        not_focusable
        z_priority = 10
    }
    CreateScreenElement {
        type = TextElement
        parent = comp_scores_anchor
        id = comp_scores_judges
        font = small
        text = 'Judges'
        rgba = [ 128 128 128 108 ]
        Pos = (128.0, 98.0)
        just = [ left top ]
        Scale = 0.9000
    }
    CreateScreenElement {
        type = TextElement
        parent = comp_scores_anchor
        id = comp_scores_judge1
        font = small
        text = '1'
        rgba = [ 88 105 112 128 ]
        Pos = (215.0, 98.0)
        just = [ left top ]
        Scale = 0.9000
    }
    CreateScreenElement {
        type = TextElement
        parent = comp_scores_anchor
        id = comp_scores_judge2
        font = small
        text = '2'
        rgba = [ 88 105 112 128 ]
        Pos = (253.0, 98.0)
        just = [ left top ]
        Scale = 0.9000
    }
    CreateScreenElement {
        type = TextElement
        parent = comp_scores_anchor
        id = comp_scores_judge3
        font = small
        text = '3'
        rgba = [ 88 105 112 128 ]
        Pos = (293.0, 98.0)
        just = [ left top ]
        Scale = 0.9000
    }
    CreateScreenElement {
        type = TextElement
        parent = comp_scores_anchor
        id = comp_scores_judge4
        font = small
        text = '4'
        rgba = [ 88 105 112 128 ]
        Pos = (333.0, 98.0)
        just = [ left top ]
        Scale = 0.9000
    }
    CreateScreenElement {
        type = TextElement
        parent = comp_scores_anchor
        id = comp_scores_judge5
        font = small
        text = '5'
        rgba = [ 88 105 112 128 ]
        Pos = (374.0, 98.0)
        just = [ left top ]
        Scale = 0.9000
    }
    CreateScreenElement {
        type = TextElement
        parent = comp_scores_anchor
        id = comp_scores_average
        font = small
        text = 'Average'
        rgba = [ 128 128 128 108 ]
        Pos = (414.0, 98.0)
        just = [ left top ]
        Scale = 0.9000
    }
    CreateScreenElement {
        type = SpriteElement
        parent = comp_scores_anchor
        texture = comp_tall_line
        Pos = (115.0, 92.0)
        Scale = (1.2000000476837158, 0.699999988079071)
        just = [ center top ]
        rgba = [ 128 128 128 110 ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = comp_scores_anchor
        texture = comp_tall_line
        Pos = (200.0, 92.0)
        Scale = (1.2000000476837158, 0.699999988079071)
        just = [ center top ]
        rgba = [ 128 128 128 110 ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = comp_scores_anchor
        texture = comp_tall_line
        Pos = (400.0, 92.0)
        Scale = (1.2000000476837158, 0.699999988079071)
        just = [ center top ]
        rgba = [ 128 128 128 110 ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = comp_scores_anchor
        texture = comp_tall_line
        Pos = (238.0, 92.0)
        Scale = (1.2000000476837158, 0.699999988079071)
        just = [ center top ]
        rgba = [ 128 128 128 110 ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = comp_scores_anchor
        texture = comp_tall_line
        Pos = (280.0, 92.0)
        Scale = (1.2000000476837158, 0.699999988079071)
        just = [ center top ]
        rgba = [ 128 128 128 110 ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = comp_scores_anchor
        texture = comp_tall_line
        Pos = (318.0, 92.0)
        Scale = (1.2000000476837158, 0.699999988079071)
        just = [ center top ]
        rgba = [ 128 128 128 110 ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = comp_scores_anchor
        texture = comp_tall_line
        Pos = (358.0, 92.0)
        Scale = (1.2000000476837158, 0.699999988079071)
        just = [ center top ]
        rgba = [ 128 128 128 110 ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = comp_scores_anchor
        texture = comp_fill
        Pos = (288.0, 91.0)
        Scale = (58.5, 1.0)
        just = [ center top ]
        rgba = [ 80 80 80 110 ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = comp_scores_anchor
        texture = comp_end_cap
        Pos = (484.0, 91.0)
        Scale = (1.2999999523162842, 0.9800000190734863)
        just = [ center top ]
        rgba = [ 80 80 80 110 ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = comp_scores_anchor
        texture = options_bg
        Pos = (309.0, 118.0)
        Scale = (1.6699999570846558, 0.699999988079071)
        just = [ center top ]
        rgba = [ 15 15 15 80 ]
    }
    GetArraySize <scores>
    index = 0
    begin 
    FormatText checksumname = score_id 'score%i' i = <index>
    goal_comp_add_score_to_hmenu (<scores> [ <index> ])id = <score_id>
    index = (<index> + 1)
    repeat <array_size>
    RunScriptOnScreenElement id = comp_scores_anchor goal_comp_animate_scores
    create_speech_box text = 'Press \m0 to continue' Pos = (320.0, 400.0) pad_choose_script = goal_comp_skip_scores pad_choose_params = { scores = <scores> }
    WaitForEvent type = goal_comp_scores_done
    SetScreenElementProps {
        id = goal_comp_average_score
        rgba = [ 117 14 14 100 ]
    }
endscript


script goal_comp_animate_scores 
    DoMorph time = 0 Scale = 1.0 alpha = 0 Pos = (305.0, 0.0)
    wait 1 frame
    DoMorph time = 0.2000 Scale = 1.0 alpha = 1 Pos = (305.0, 232.0)
endscript


script goal_comp_add_score_to_hmenu 
    FormatText textname = score_text '%i' i = (<Score>)
    CreateScreenElement {
        type = TextElement
        parent = scores_hmenu
        font = dialog
        text = <score_text>
        not_focusable
    }
    if NOT GotParam top_judge
        RunScriptOnScreenElement id = <id> goal_comp_fade_lower_score
    endif
endscript


script goal_comp_fade_lower_score 
    wait 1 second
    DoMorph time = 1.200 alpha = 0.3000
    FireEvent type = goal_comp_scores_done
endscript


script goal_comp_skip_scores 
    GetArraySize <scores>
    index = 0
    begin 
    FormatText checksumname = score_id 'score%i' i = <index>
    if NOT StructureContains structure = (<scores> [ <index> ])top_judge
        if ObjectExists id = <score_id>
            DoScreenElementMorph id = <score_id> alpha = 0.3000
        endif
    endif
    index = (<index> + 1)
    repeat <array_size>
    SetScreenElementProps {
        id = goal_comp_average_score
        rgba = [ 127 102 0 128 ]
    }
    if RoundIs 3
    endif
    FireEvent type = goal_comp_scores_done
endscript


script goal_comp_end_current_run 
    if ObjectExists id = current_menu_anchor
        exit_pause_menu
    endif
    if GoalManager_IsInCompetition
        GoalManager_EditGoal name = <goal_id> params = { already_ended_run = 1 }
        GoalManager_PauseCompetition name = <goal_id>
        KillSpawnedScript name = SK3_Killskater_Finish
        GoalManager_GetGoalParams name = <goal_id>
        ResetSkaters node_name = <restart_node>
        goal_comp_expire goal_id = <goal_id>
    else
        printf 'WARNING: you\'re not in a competition!!!'
    endif
endscript


script goal_comp_add_leader_board 
    WaitForEvent type = goal_comp_scores_done
    SpawnScript TemporarilyDisableInput params = { time = 1500 }
    if ObjectExists id = speech_box_anchor
        SetScreenElementProps {
            id = speech_box_anchor
            event_handlers = [{ pad_choose goal_comp_continue }]
            replace_handlers
        }
    endif
    wait 20 frame
    if NOT ObjectExists id = comp_root_anchor
        return 
    endif
    SetScreenElementProps {
        id = root_window
        event_handlers = [{ pad_start goal_comp_continue }]
        replace_handlers
    }
    SetScreenElementLock id = comp_root_anchor Off
    CreateScreenElement {
        type = ContainerElement
        parent = comp_root_anchor
        id = comp_leader_board_anchor
        Pos = (300.0, 232.0)
        dims = (640.0, 480.0)
    }
    CreateScreenElement {
        type = vmenu
        parent = comp_leader_board_anchor
        id = comp_leader_board_vmenu
        Pos = (208.0, 169.0)
        internal_just = [ left center ]
        just = [ center top ]
        z_priority = 20
    }
    CreateScreenElement {
        type = TextElement
        parent = comp_leader_board_vmenu
        id = comp_leader_board_vmenu_title
        font = testtitle
        text = 'STANDINGS'
        rgba = [ 128 128 128 75 ]
        just = [ left top ]
        Scale = 1.370
        not_focusable
    }
    if RoundIs 1
        FormatText textname = round_info '(AFTER 1 ROUND)'
    else
        if RoundIs 2
            FormatText textname = round_info '(AFTER 2 ROUNDS)'
        else
            FormatText textname = round_info '(BEST 2 ROUNDS)'
        endif
    endif
    CreateScreenElement {
        type = TextElement
        parent = comp_leader_board_vmenu_title
        font = dialog
        text = <round_info>
        rgba = [ 117 14 14 90 ]
        Pos = (264.0, 0.0)
        Scale = 0.6500
        just = [ RIGHT top ]
        not_focusable
    }
    if LevelIs load_fl
    else
        CreateScreenElement {
            type = SpriteElement
            parent = comp_leader_board_anchor
            texture = PA_goals
            Pos = (100.0, 132.0)
            Scale = (1.200)
            just = [ center top ]
            setprops rgba = [ 128 128 128 110 ]
            z_priority = 100
        }
    endif
    CreateScreenElement {
        type = SpriteElement
        parent = comp_leader_board_anchor
        texture = options_bg
        Pos = (315.0, 160.0)
        Scale = (1.7000000476837158, 1.0)
        just = [ center top ]
        rgba = [ 80 80 80 128 ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = comp_leader_board_anchor
        texture = comp_hori_lines
        Pos = (316.0, 186.0)
        Scale = (55.5, 0.9599999785423279)
        just = [ center top ]
        rgba = [ 128 128 128 90 ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = comp_leader_board_anchor
        texture = comp_tall_line
        Pos = (120.0, 165.0)
        Scale = (1.2000000476837158, 2.25)
        just = [ center top ]
        rgba = [ 0 0 0 108 ]
        z_priority = 30
    }
    CreateScreenElement {
        type = SpriteElement
        parent = comp_leader_board_anchor
        texture = comp_tall_line
        Pos = (512.0, 165.0)
        Scale = (1.2000000476837158, 2.25)
        just = [ center top ]
        rgba = [ 0 0 0 108 ]
        z_priority = 30
    }
    ForEachIn <leader_board> do = goal_comp_add_leader_board_entry
    RunScriptOnScreenElement id = comp_leader_board_anchor goal_comp_animate_leaderboard
endscript


script goal_comp_animate_leaderboard 
    DoMorph time = 0 Scale = 0.0 alpha = 0
    wait 20 frame
    playsound BailSlap01
    DoMorph time = 0.2000 Scale = 1.0 alpha = 1
endscript


script goal_comp_add_leader_board_entry 
    CreateScreenElement {
        type = TextElement
        parent = comp_leader_board_vmenu
        font = small
        text = <name>
        rgba = [ 128 128 128 128 ]
        not_focusable
        just = [ left top ]
    }
    <leader_board_name_id> = <id>
    FormatText textname = score_text '%i' i = (<Score>)
    CreateScreenElement {
        type = TextElement
        parent = <leader_board_name_id>
        font = dialog
        text = <score_text>
        Pos = (320.0, 0.0)
        just = [ RIGHT top ]
    }
    if GotParam player
        SetScreenElementProps {
            id = <leader_board_name_id>
            rgba = [ 127 102 0 128 ]
        }
        SetScreenElementProps {
            id = <id>
            rgba = [ 127 102 0 128 ]
        }
    endif
endscript


script goal_comp_show_results 
    if PlaceIs 1
        create_speech_box text = 'You got gold!' no_pad_start pad_choose_script = NullScript style = goal_comp_speech_box_style
        GoalManager_WinGoal name = <goal_id>
    else
        if PlaceIs 2
            create_speech_box text = 'You got silver!' no_pad_start pad_choose_script = NullScript style = goal_comp_speech_box_style
            GoalManager_WinGoal name = <goal_id>
        else
            if PlaceIs 3
                create_speech_box text = 'You got bronze!' no_pad_start pad_choose_script = NullScript style = goal_comp_speech_box_style
                GoalManager_WinGoal name = <goal_id>
            else
                create_speech_box text = 'You didn\'t get a medal' no_pad_start pad_choose_script = null_script style = goal_comp_speech_box_style
                GoalManager_LoseGoal name = <goal_id>
            endif
        endif
    endif
endscript


script goal_comp_out_of_bounds_text 
    DoMorph time = 0 Pos = (320.0, 140.0)
endscript


script goal_comp_speech_box_style 
    wait 2000
    Die
endscript

