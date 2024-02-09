
script SetupSkaterCareer 
    CareerFunc \{ func = InitLevelTables params = SkaterCareerParams }
    chapter_info_register_structure
    CareerFunc \{ func = reset }
endscript
game_progress_block_triggers = 0

script game_progress_unblock_triggers 
    printf \{ 'Career unblocking triggers' }
    change \{ game_progress_block_triggers = 0 }
endscript

script game_progress_process_cutscene \{ unload = 1 reload = 1 skippable = 1 }
    UnPauseGame
    PauseMusic \{ 0 }
    if GotParam \{ intro_restart_node }
        ResetSkaters node_name = <intro_restart_node>
        ForceTransitionAreaUpdate
    endif
    PlayCutscene {
        <...> 
        unload_anims = <unload>
        unload_goals = <unload>
        reload_anims = <reload>
        reload_goals = <reload>
        skippable = <skippable>
        exitscript = game_progress_process_status
    }
endscript

script game_progress_process_goal_lock {
        lock = 0
        assert = {}
    }
    if (<lock> = 1)
        <func> = LockProgressionGoal
    else
        <func> = UnlockProgressionGoal
    endif
    if GotParam goal
        CareerFunc func = <func> params = {goal_id = <goal> <assert>}
    else
        if GotParam goals
            <i> = 0
            GetArraySize goals
            if (<array_size> > 0)
                begin 
                CareerFunc func = <func> params = {goal_id = (<goals> [ <i> ])<assert>}
                <i> = (<i> + 1)
                repeat <array_size>
            endif
        else
            scriptassert 'Expected \'goal\' or \'goals\' param'
        endif
    endif
    if (<lock> = 1)
        GoalManager_UninitializeAllGoals
    endif
    GoalManager_SyncGoalsWithCareer
    GoalManager_Initializeallgoals
endscript

script gane_progress_process_cheat 
    if GotParam lock_goals
        game_progress_process_goal_lock {
            lock = 1
            goals = <lock_goals>
            assert = { dont_assert }
        }
    endif
    if GotParam unlock_goals
        game_progress_process_goal_lock {
            lock = 0
            goals = <unlock_goals>
            assert = { dont_assert }
        }
    endif
    if GotParam abilities
        GetArraySize abilities
        if (<array_size> > 0)
            i = 0
            begin 
            skater ::EnableAbility (<abilities> [ <i> ])
            i = (<i> + 1)
            repeat <array_size>
        endif
    endif
    if GotParam nodeflags
        GetArraySize nodeflags
        if (<array_size> > 0)
            i = 0
            begin 
            ChangeNodeFlag (<nodeflags> [ <i> ])
            i = (<i> + 1)
            repeat <array_size>
        endif
    endif
    if GotParam atoms
        GetArraySize atoms
        if (<array_size> > 0)
            i = 0
            begin 
            CareerFunc func = ForceAtomUnlocked params = {name = (<atoms> [ <i> ])}
            i = (<i> + 1)
            repeat <array_size>
        endif
    endif
endscript

script Ped_Utils_SetupGameProgressTrigger \{ inner_radius = 8 outer_radius = 40 activation_script = game_progress_got_trigger }
    if GotParam \{ flag }
        if GetGlobalFlag flag = <flag>
            return 
        endif
    endif
    ClearEventHandler \{ anyobjectinradius }
    ClearEventHandler \{ objectoutofradius }
    obj_setinnerradius <inner_radius>
    seteventhandler Ex = anyobjectinradius scr = ped_speech_got_trigger params = { <...> activation_script_params = <...>  }
endscript

script game_progress_got_trigger 
    if GotParam flag
        SetGlobalFlag flag = <flag>
    else
        printstruct <...> 
        printf 'i don\'t know what to do!'
    endif
    if skater ::IsSkaterOnBike
        GoalManager_PauseAllGoals
        create_snazzy_dialog_box {
            Title = str_z_sr_6
            text = str_g_u_88
            text_dims = (400.0, 0.0)
            pad_back_script = thaw_skater_reject_cleanup
            no_bg
            buttons = [
                {text = str_g_u_76 pad_choose_script = thaw_skater_reject_cleanup}
            ]
        }
    else
        skater ::UnPause
        game_progress_process_status
    endif
endscript

script game_progress_process_status level_startup = 0
    if NOT GameModeEquals is_career
        return 
    endif
    if InFrontend
        return 
    endif
    if LevelIs viewer
        return 
    endif
    if LevelIs load_sk5ed
        return 
    endif
    if LevelIs load_sk5ed_gameplay
        return 
    endif
    if GetGlobalFlag flag = CAREER_ONETIMEINTRO
        return 
    endif
    if (<level_startup> = 1)
        SetGlobalFlag flag = CAREER_LEVEL_STARTUP
        if NOT GetGlobalFlag flag = NO_DISPLAY_COMPASS
            CompassManager_Refresh
        endif
        skater ::StatsManager_Activate
    endif
    if GotParam wait_time
        printf 'Career blocking triggers temporarily...'
        change game_progress_block_triggers = 1
        OnExitRun game_progress_unblock_triggers
        printf 'MPS: Waiting %d seconds' d = <wait_time>
        wait <wait_time> seconds
        if IsTrue igc_playing
            printf 'MPS: I think IGC is playing'
            Block type = igc_scene_finished
        endif
    endif
    fadetoblack Off
    CareerFunc func = UpdateAtoms
endscript

script game_progress_process_igc heap = GoalHeap
    FinishPendingZoneLoads
    if GotParam pak
        FlushPedsFromHeap heap = <heap>
        FormatText textname = pak_path_noext '%f/%p' f = <folder> p = <pak>
        printf 'LOADING: %s.pak' s = <pak_path_noext>
        LoadPak (<pak_path_noext> + '.pak')heap = <heap>
        printf 'LOADING: %s_text.pak' s = <pak_path_noext>
        LoadPak (<pak_path_noext> + '_text.pak')heap = <heap> localized
        FormatText checksumname = editable_list '%p_editable_list' p = <pak>
        if globalexists name = <editable_list> type = array
            AddEditableList <editable_list>
        endif
        FormatText checksumname = array_name '%p_NodeArray' p = <pak>
        MemPushContext <heap>
        ParseNodeArray array_name = <array_name> zone_name = <pak> no_vclight_buffers
        MemPopContext
    endif
    PlayIGCScene <scene>
    if GotParam pak
        igc_temporarily_disable_rendering 3 gameframes
        StartDelaySystemUI
        BeginUnloadPak (<pak_path_noext> + '.pak')
        wait 2 gameframes
        GoalManager_RemoveOrphanRails
        EndUnloadPak (<pak_path_noext> + '.pak')
        BeginUnloadPak (<pak_path_noext> + '_text.pak')localized
        EndUnloadPak (<pak_path_noext> + '_text.pak')localized
        RemoveEditableList <editable_list>
        StopDelaySystemUI
    endif
endscript

script game_progress_set_completion_flag 
    if GotParam \{ Game }
        ProcessGameRewards
    endif
    if GotParam \{ goals }
        ProcessGoalRewards
    endif
    if GotParam \{ pieces }
        ProcessPieceGoalRewards
    endif
endscript

script game_progress_process_cleanup 
    if NOT GameModeEquals \{ is_career }
        return 
    endif
    CareerFunc \{ func = ClearIncidentalAtoms }
endscript

script game_progress_unlock_level 
    SetFlag level = <level> flag = LEVEL_UNLOCKED_STORY
    game_progress_change_nodeflags <...> 
endscript

script game_progress_change_nodeflags 
    if GotParam \{ nodeflags }
        GetArraySize \{ nodeflags }
        i = 0
        begin 
        ChangeNodeFlag (<nodeflags> [ <i> ])
        i = (<i> + 1)
        repeat <array_size>
    endif
endscript

script game_progress_save_prompt 
    if IsTrue \{ game_progress_debug_active }
        return 
    endif
    if IsTrue \{ sysnotify_wait_in_progress }
        return 
    endif
    if IsXenon
        if NOT CheckForSignin \{ local }
            return 
        endif
    endif
    spawnscriptnow \{ game_progress_save_prompt_display }
    Block \{ type = ingame_save_finished }
    printf \{ 'SAVE SEQUENCE FINISHED' }
endscript

script game_progress_save_prompt_display 
    pausegame
    PauseMusicAndStreams
    hide_all_hud_items
    Debounce \{ x time = 0.3000 }
    igc_immediately_start_rendering
    ingame_confirm_save \{ no_script = ingame_save_return_to_game yes_script = launch_ingame_menu_save_game_sequence }
endscript

script game_progress_move_skater_to_node 
    ResetSkaters node_name = <name>
endscript

script game_progress_start_goal 
    if GoalManager_GoalExists name = <name>
        GoalManager_ActivateGoal name = <name>
    endif
endscript

script game_progress_process_post_goal_wait 
    Block {
        alltypes = [
            { type = goal_deactivated }
            {type = goal_marked_beaten Details = { goal_id = <goal_id> }}
        ]
    }
    Block \{ type = goal_finished_success_sequence }
    game_progress_process_status
endscript

script game_progress_send_pager_message \{ send_delay = 2 }
    wait <send_delay> seconds
    skater ::SendPagerMessage <text>
endscript
current_progress_audio_clip = null

script fade_play_audio_clip 
    SK6_Music_Fade_Out
    StopMusic
    printstruct <...> 
    PlayStream <wav> vol = 125 priority = 103
    change current_progress_audio_clip = <wav>
    begin 
    if NOT (IsStreamPlaying <wav>)
        break 
    endif
    wait \{ 1 second }
    repeat 
    change \{ current_progress_audio_clip = null }
    SkipMusicTrack
    SK6_Music_Fade_In
endscript

script game_progress_play_audio_clip 
    SpawnScriptLater fade_play_audio_clip params = <...> 
endscript

script game_progress_add_cash 
    CareerFunc func = AddCash params = { cash = <cash> }
endscript

script WaitUntilScreenClear pass = 0
    begin 
    wait 1 gameframes
    if skater ::OnGround
        root_window ::getsingletag menu_state
        if (<menu_state> = Off)
            if NOT ScreenElementExists id = speech_box_anchor
                if NOT ScreenElementExists id = current_menu_anchor
                    if NOT IsTrue igc_playing
                        if (<pass> = 2)
                            wait 1 gameframes
                            RemoveParameter pass
                            SafeCallback <...> 
                            return 
                        else
                            break 
                        endif
                    endif
                endif
            endif
        endif
    endif
    pass = 0
    repeat 
    pass = (<pass> + 1)
    GotoPreserveParams WaitUntilScreenClear
endscript

script SetUpChapterMenu 
    change \{ dont_restore_start_key_binding = 1 }
    skater ::PausePhysics
    skater ::RemoveSkaterFromWorld
    if ObjectExists \{ id = current_menu_anchor }
        DestroyScreenElement \{ id = current_menu_anchor }
    endif
    hide_all_hud_items \{ dont_restore_input }
    kill_start_key_binding
    PauseMusic \{ 1 }
    root_window ::settags \{ menu_state = on }
    SafeCallback <...> 
endscript

script KillChapterMenu 
    dialog_box_exit
    if ScreenElementExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    if GotParam need_unpause_streams
        PauseStream 0
    endif
    if GotParam inside_run
        UnPauseGame
        UnpauseSkaters
        show_all_hud_items
    else
        if GotParam mark_first_input
            mark_first_input_received <...> 
        endif
        if ScreenElementExists id = current_menu_anchor
            DestroyScreenElement id = current_menu_anchor
        endif
        root_window ::settags menu_state = Off
        change dont_restore_start_key_binding = 0
        restore_start_key_binding
        PauseMusic 0
        skater ::UnPausePhysics
        skater ::AddSkaterToWorld
        show_all_hud_items
    endif
    SafeCallback <...> 
endscript

script ingame_confirm_save \{ no_script = create_pause_menu yes_script = launch_ingame_menu_save_game_sequence }
    create_snazzy_dialog_box {
        Title = 'Speichern'
        text = 'Möchtest du jetzt deinen Fortschritt speichern?'
        text_dims = (400.0, 0.0)
        no_bg
        buttons = [{font = small text = 'Nein' pad_choose_script = <no_script>
            }
            {font = small text = 'Ja' pad_choose_script = <yes_script>
            }
        ]
    }
endscript

script ingame_save_return_to_game 
    Debounce \{ x time = 0.3000 }
    dialog_box_exit
    UnPauseGame
    UnpauseMusicAndStreams
    show_all_hud_items
    broadcastevent \{ type = ingame_save_finished }
endscript

script career_post_load 
    set_default_temporary_profiles
    SetNodeFlagMultiplayerBlock \{ disable_multiplayer_check_hack }
    CareerFunc \{ func = SetAppropriateNodeFlags }
    TODManager_SetTODInstant \{ Afternoon }
    SetNodeFlagMultiplayerBlock \{ enable_multiplayer_check_hack }
endscript
game_progress_debug_active = 0

script game_progress_debug_menu_kill 
    if ScreenElementExists \{ id = progress_debug_anchor }
        DestroyScreenElement \{ id = progress_debug_anchor }
    endif
    change \{ game_progress_debug_active = 0 }
    show_all_hud_sprites
    skater ::enableplayerinput
endscript

script game_progress_debug_menu_create 
    change game_progress_debug_active = 1
    if NOT GotParam previously_selected_index
        exit_pause_menu
    endif
    skater ::disableplayerinput
    SetScreenElementLock id = root_window Off
    CreateScreenElement {
        type = ContainerElement
        parent = root_window
        id = progress_debug_anchor
    }
    AssignAlias id = progress_debug_anchor alias = current_menu_anchor
    hide_all_hud_sprites
    pause_menu_gradient parent = current_menu_anchor
    CreateScreenElement {
        type = vscrollingmenu
        parent = progress_debug_anchor
        id = progress_debug_menu
        dims = (200.0, 320.0)
        Pos = (50.0, 80.0)
        just = [ left top ]
        internal_just = [ left top ]
    }
    CreateScreenElement {
        type = vmenu
        parent = progress_debug_menu
        id = progress_debug_vmenu
        font = small
        just = [ left top ]
        padding_scale = 0.9000
        internal_scale = 1
        internal_just = [ left top ]
    }
    CreateScreenElement {
        type = TextElement
        parent = progress_debug_anchor
        font = testtitle
        text = 'Atom debug unlocking'
        just = [ left top ]
        Scale = 1.600
        rgba = [ 4 45 120 128 ]
        not_focusable
        Pos = (80.0, 50.0)
    }
    AssignAlias id = progress_debug_vmenu alias = current_menu
    SetScreenElementProps {
        id = current_menu
        event_handlers = [
            { pad_back game_progress_debug_menu_kill }
        ]
        replace_handlers
    }
    create_helper_text helper_text_elements = [{ text = '\m0 = Freischalten' }{ text = '\m1 = Zurück' }]
    CareerFunc func = GetStoryAtomUIParams
    ForEachIn <atom_ui_params> do = game_progress_debug_menu_add_item pass_index
    FireEvent type = focus target = current_menu Data = { grid_index = <previously_selected_index> }
endscript

script game_progress_debug_menu_focus 
    GetProps
    settags \{old_rgba = [ 88 105 112 128 ]}
    obj_getid
    SetScreenElementProps id = {<ObjID> child = 0}rgba = [ 127 102 0 100 ]
    if ScreenElementExists id = {<ObjID> child = 1}
        SetScreenElementProps id = {<ObjID> child = 1}rgba = [ 127 102 0 100 ]
    endif
endscript

script game_progress_debug_menu_unfocus 
    getsingletag \{ old_rgba }
    obj_getid
    SetScreenElementProps id = {<ObjID> child = 0}rgba = <old_rgba>
    if ScreenElementExists id = {<ObjID> child = 1}
        SetScreenElementProps id = {<ObjID> child = 1}rgba = <old_rgba>
    endif
endscript

script game_progress_debug_menu_add_item 
    if GotParam debug_menu_text
        CreateScreenElement {
            type = ContainerElement
            parent = current_menu
            dims = (500.0, 20.0)
            just = [ left top ]
            event_handlers = [
                { focus game_progress_debug_menu_focus }
                { unfocus game_progress_debug_menu_unfocus }
                {pad_choose game_progress_debug_menu_choose params = <...> }
            ]
            tags = {
                tag_grid_x = <foreachin_index>
            }
        }
        container = <id>
        CreateScreenElement {
            type = TextElement
            parent = <container>
            text = <debug_menu_text>
            font = small
            rgba = [ 88 105 112 128 ]
            Scale = 1
            just = [ left top ]
            Pos = (0.0, 0.0)
        }
        FormatText textname = status_text '- %s' s = <state> DontAssertForChecksums
        CreateScreenElement {
            type = TextElement
            parent = <container>
            text = <status_text>
            font = small
            rgba = [ 88 105 112 128 ]
            Scale = 1
            just = [ left top ]
            Pos = (300.0, 0.0)
        }
    endif
endscript

script game_progress_debug_menu_choose 
    getsingletag tag_grid_x
    disassociatefromobject
    game_progress_debug_menu_kill
    change game_progress_debug_active = 1
    switch <state>
        case locked
        if GotParam debug_require_level
            if NOT LevelIs <debug_require_level>
                FormatText textname = error 'Um dieses Atom freizuspielen, musst du in %s sein!' s = <debug_require_level> DontAssertForChecksums
                block_action = 1
            endif
        endif
        if NOT GotParam block_action
            CareerFunc func = ForceAtomUnlocked params = { name = <name> }
        endif
        default 
        printf 'can\'t do anything with this atom'
    endswitch
    game_progress_debug_menu_create previously_selected_index = <tag_grid_x>
    if GotParam error
        create_panel_message text = <error> Pos = (320.0, 40.0) time = 2000 parent = current_menu_anchor
    endif
endscript
