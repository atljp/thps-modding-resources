
pro_team_members = [
    {pro = Burnquist movie_text = 'Burnquis' text = 'Burnquist'}
    {pro = Hawk movie_text = 'Hawk' text = 'Hawk'}
    {pro = Koston movie_text = 'Koston' text = 'Koston'}
    {pro = lasek movie_text = 'Lasek' text = 'Lasek'}
    {pro = margera movie_text = 'Margera' text = 'Margera'}
    {pro = Mullen movie_text = 'Mullen' text = 'Mullen'}
    {pro = Muska movie_text = 'Muska' text = 'Muska'}
    {pro = reynolds movie_text = 'Reynolds' text = 'Reynolds'}
    {pro = rodriguez movie_text = 'Rodrigue' text = 'Rodriguez'}
    {pro = rowley movie_text = 'Rowley' text = 'Rowley'}
    {pro = saari movie_text = 'Saari' text = 'Saari'}
    {pro = thomas movie_text = 'Thomas' text = 'Thomas'}
    {pro = Vallely movie_text = 'Vallely' text = 'Vallely'}
]

script goal_team_select_init 
    if InNetGame
        return 
    endif
    GoalManager_GetGoalParams name = <goal_id>
    if GotParam team_pro
        if (<team_pro> = None)
            RemoveParameter team_pro
        endif
    endif
    if GotParam last_start_was_quick_start
        if (<last_start_was_quick_start> = 1)
            if GotParam team_pro
                return 
            endif
        endif
    endif
    GetCurrentChapter
    if (<chapter> > 25)
        return 
    endif
    skater ::hide
    pausegame
    PauseSkaters
    GoalManager_GetTeam
    if GoalManager_HasWonGoal name = <goal_id>
        if GotParam team_pro
            if ObjectExists id = pause_deck
                script_assert 'pause deck shouldn\'t exist'
                kill_pause_deck
                <deck_already_paused> = 1
            endif
            load_pro_skater name = <team_pro>
            if GotParam deck_already_paused
            endif
            UnPauseGame
            UnpauseSkaters
            return 
        endif
    endif
    if ((GotParam horse)|| (GotParam tour))
    endif
    GoalManager_PauseGoal name = <goal_id>
    PauseSkaters
    skater ::hide
    SetScreenElementLock id = root_window Off
    if ScreenElementExists id = team_menu
        DestroyScreenElement id = team_menu
    endif
    make_new_themed_sub_menu Title = 'SELECT TEAMMATE'
    pause_menu_gradient on
    GetArraySize pro_team_members
    <index> = 0
    <num_so_far> = 0
    begin 
    <pro_name> = ((pro_team_members [ <index> ]).pro)
    if StructureContains structure = <team> <pro_name>
        if (<team>.<pro_name> = 1)
            <not_focusable> = not_focusable
            <rgba> = [ 60 60 60 75 ]
        else
            RemoveParameter not_focusable
            RemoveParameter rgba
        endif
        if (<num_so_far> = 4)
            last_menu_item = last_menu_item
        endif
        theme_menu_add_item {
            text = ((pro_team_members [ <index> ]).text)
            pad_choose_script = goal_team_select_member_chosen
            pad_choose_params = {pro = <pro_name> goal_id = <goal_id> restart_node = <restart_node>}
            not_focusable = <not_focusable>
            rgba = <rgba>
            last_menu_item = <last_menu_item>
            centered
        }
        <num_so_far> = (<num_so_far> + 1)
    endif
    <index> = (<index> + 1)
    repeat <array_size>
    finish_themed_sub_menu time = 0.2000
    create_helper_text generic_helper_text_no_back
    GoalManager_HideGoalPoints
    GoalManager_HidePoints
    root_window ::settags menu_state = on
    WaitForEvent type = goal_select_team_member_done
    pause_menu_gradient Off
endscript


script goal_team_select_member_chosen 
    if ObjectExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    Debounce x time = 0.5000
    if GotParam goal_id
        GoalManager_EditGoal name = <goal_id> params = { team_pro = <pro> }
    endif
    skater ::statsmanager_deactivategoals
    load_pro_skater name = <pro>
    UnPauseGame
    ResetSkaters node_name = <restart_node>
    GoalManager_UnpauseGoal name = <goal_id>
    GoalManager_ShowGoalPoints
    GoalManager_ShowPoints
    root_window ::settags menu_state = Off
    restore_start_key_binding
    FireEvent type = goal_select_team_member_done
endscript


script goal_team_select_deactivate 
    if InNetGame
        return 
    endif
    GoalManager_GetGoalParams name = <goal_id>
    if GotParam quick_start
        return 
    endif
    skater ::vibrate Off
    if ObjectExists id = pause_deck
        script_assert 'pause deck shouldn\'t exist'
        kill_pause_deck
        <deck_already_paused> = 1
    endif
    load_pro_skater name = custom
    if GotParam deck_already_paused
    endif
    skater ::StatsManager_ActivateGoals
    ResetSkaters node_name = <restart_node>
    MakeSkaterGoto HandBrake
    if NOT GoalManager_HasWonGoal name = <goal_id>
        if NOT GotParam just_won_goal
            GoalManager_EditGoal name = <goal_id> params = { team_pro = None }
        endif
    endif
endscript


script goal_team_select_success 
    if GotParam goal_id
        GoalManager_GetGoalParams name = <goal_id>
        if GotParam team_pro
            GoalManager_SetTeamMember pro = <team_pro> mark_used
        endif
    endif
endscript

