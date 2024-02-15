goal_counter_genericParams = {
    goal_text = str_g_c_0
    view_goals_text = str_g_c_1
    time = 120
    init = goal_counter_init
    uninit = goal_uninit
    activate = goal_counter_activate
    active = goal_counter_active
    success = goal_counter_success
    fail = goal_counter_fail
    deactivate = goal_counter_deactivate
    expire = goal_counter_expire
    trigger_obj_id = 'TRG_G_COUNTER_Pro'
    start_pad_id = 'G_COUNTER_StartPad'
    restart_node = 'TRG_G_COUNTER_RestartNode'
    got_object_script = goal_counter_got_object2
    number = 10
    number_collected = 0
    counter_objects = [
        { id = Sch_CounterSpot01 }
        { id = Sch_CounterSpot02 }
    ]
    goal_counter_object_init_script = goal_counter_init_object
    goal_counter_got_object_script = goal_counter_got_object
    record_type = time
}

script AddGoal_Counter 
    if GotParam version
        FormatText textname = goal_type 'COunter%v' v = <version>
        if NOT GotParam trigger_obj_id
            FormatText checksumname = trigger_obj_id '%z_TRG_G_COUNTER%v_Pro' z = <zone> v = <version>
        endif
        if NOT GotParam restart_node
            FormatText checksumname = restart_node '%z_TRG_G_COUNTER%v_RestartNode' z = <zone> v = <version>
        endif
    else
        <goal_type> = 'COunter'
        if NOT GotParam trigger_obj_id
            FormatText checksumname = trigger_obj_id '%z_TRG_G_COUNTER_Pro' z = <zone>
        endif
        if NOT GotParam restart_node
            FormatText checksumname = restart_node '%z_TRG_G_COUNTER_RestartNode' z = <zone>
        endif
    endif
    if GotParam classic_mode_goal
        <classic_mode_goal> = classic_mode_goal
    endif
    GoalManager_CreateGoalName goal_type = <goal_type> zone = <zone> classic_mode_goal = <classic_mode_goal>
    GoalManager_AddGoal name = <goal_id> {
        params = {
            goal_text = str_g_c_0
            view_goals_text = str_g_c_1
            time = 120
            got_object_script = goal_counter_got_object2
            number = 10
            number_collected = 0
            goal_counter_object_init_script = goal_counter_init_object
            goal_counter_got_object_script = goal_counter_got_object
            record_type = time
            counter_objects = [
                { id = Sch_CounterSpot01 }
                { id = Sch_CounterSpot02 }
            ]
            init = goal_counter_init
            uninit = goal_uninit
            activate = goal_counter_activate
            active = goal_counter_active
            success = goal_counter_success
            fail = goal_counter_fail
            deactivate = goal_counter_deactivate
            expire = goal_counter_expire
            <...> 
        }
    }
endscript

script goal_counter_init 
    goal_init goal_id = <goal_id>
endscript

script goal_counter_activate 
    goal_start goal_id = <goal_id>
    if GotParam quick_start
        <quick_start> = quick_start
    endif
    SpawnScriptLater goal_counter_init_objects params = {goal_id = <goal_id> quick_start = <quick_start>}
    if GotParam mod_tricks
        if GotParam on_level_node
            <on_level_node> = 1
        else
            <on_level_node> = 0
        endif
        if GotParam dont_allow_miss
            <dont_allow_miss> = 1
        else
            <dont_allow_miss> = 0
        endif
        if GotParam all_in_one_combo
            <all_in_one_combo> = 1
        else
            <all_in_one_combo> = 0
        endif
        SpawnScriptLater {
            mod_tricks_trick_checker
            params = {
                trick_type = <trick_type>
                goal_id = <goal_id>
                on_level_node = <on_level_node>
                dont_allow_miss = <dont_allow_miss>
                all_in_one_combo = <all_in_one_combo>
            }
        }
    endif
    if GotParam unique_tricks
        <unique_got_tricks> = []
        begin 
        <tmp_array> = [ None ]
        <unique_got_tricks> = (<unique_got_tricks> + <tmp_array>)
        repeat <number>
        GoalManager_EditGoal name = <goal_id> params = { unique_got_tricks = <unique_got_tricks> }
    endif
endscript

script goal_counter_init_objects 
    GoalManager_GetGoalParams name = <goal_id>
    if NOT GotParam quick_start
        if GotParam pak_info
            <skipping_intro> = 0
            if GotParam last_start_was_quick_start
                if (<last_start_was_quick_start> = 1)
                    <skipping_intro> = 1
                endif
            endif
            if (<skipping_intro> = 0)
                if StructureContains structure = <pak_info> start
                    Block type = goal_cam_anim_done
                    if StructureContains structure = <pak_info> gameplay
                        Block type = goal_load_pak_done
                    endif
                endif
            else
                if StructureContains structure = <pak_info> gameplay
                    Block type = goal_load_pak_done
                endif
            endif
        endif
    else
        if StructureContains structure = <pak_info> gameplay
            Block type = goal_load_pak_done
        endif
    endif
    ForEachIn <counter_objects> do = <goal_counter_object_init_script> params = {goal_id = <goal_id> goal_counter_got_object_script = <goal_counter_got_object_script>}
endscript

script goal_counter_init_object 
    RunScriptOnObject id = <id> goal_counter_init_object2 params = {id = <id> goal_id = <goal_id> goal_counter_got_object_script = <goal_counter_got_object_script>}
endscript

script goal_counter_init_object2 
    Obj_ClearExceptions
    obj_setinnerradius \{ 10 }
    Obj_SetException Ex = objectinradius scr = <goal_counter_got_object_script> params = {goal_id = <goal_id> id = <id>}
endscript

script goal_counter_got_object 
    Obj_ClearExceptions
    GoalManager_GetGoalParams name = <goal_id>
    GoalManager_GotCounterObject name = <goal_id>
    goal_got_flag_sound
    Die
endscript

script goal_counter_got_object2 
    if ScreenElementExists \{ id = goal_counter_got_object_message }
        DestroyScreenElement \{ id = goal_counter_got_object_message }
    endif
    if NOT GotParam \{ collect_type }
        <collect_type> = str_g_c_3
    endif
    FormatText textname = got_object_text '%c %a %n %s' a = str_g_c_2 c = <number_collected> n = <number> s = <collect_type>
    create_panel_message id = goal_counter_got_object_message text = <got_object_text> style = goal_collect_text
endscript

script goal_counter_active 
    if (<number_collected> > (<number> - 1))
        GoalManager_WinGoal name = <goal_id>
    endif
endscript

script goal_counter_success 
    goal_success goal_id = <goal_id>
endscript

script goal_counter_deactivate 
    if GotParam \{ mod_tricks }
        mod_tricks_cleanup
    endif
    GoalManager_EditGoal name = <goal_id> params = { number_collected = 0 }
    GoalManager_ResetGoalTrigger name = <goal_id>
    goal_deactivate goal_id = <goal_id>
endscript

script goal_counter_expire 
    goal_expire goal_id = <goal_id>
    GoalManager_LoseGoal name = <goal_id>
endscript

script goal_counter_update 
    DoMorph \{time = 0 Pos = (320.0, 50.0) Scale = 1 rgba = [ 128 128 128 128 ]}
    wait \{ 1 second }
    Die
endscript

script goal_counter_fail 
    goal_fail goal_id = <goal_id>
endscript

script count_tricks_set_on_level_node 
    if GoalManager_GoalExists name = <name>
        if GoalManager_GoalIsActive name = <name>
            GoalManager_EditGoal name = <name> params = { is_on_level_node = 1 }
        endif
    endif
endscript
mod_tricks_on_level_node = 0

script mod_tricks_set_on_level_node 
    if GoalManager_GoalExists name = <name>
        if GoalManager_GoalIsActive name = <name>
            change \{ mod_tricks_on_level_node = 1 }
        endif
    endif
endscript

script mod_tricks_trick_checker 
    change mod_tricks_on_level_node = 0
    ClearExceptionGroup goal_gaps_mod_tricks
    KillSpawnedScript name = mod_tricks_timer
    mod_tricks_cleanup_screen_elements
    switch <trick_type>
        case stall
        case spin
        case grind
        <exception> = SkaterEnterRail
        case invert
        case lip
        case lipOrInvert
        <exception> = SkaterEnterLip
        case Manual
        <exception> = SkaterEnterManual
        default 
        scriptassert 'mod_tricks_trick_checker got an unsupported trick type: %s' s = <trick_type>
    endswitch
    SetException {
        Ex = <exception>
        scr = mod_tricks_resolve
        params = {
            trick_type = <trick_type>
            goal_id = <goal_id>
            exception = <exception>
            on_level_node = <on_level_node>
            dont_allow_miss = <dont_allow_miss>
            all_in_one_combo = <all_in_one_combo>
        }
        group = goal_gaps_mod_tricks
    }
    Block
endscript

script mod_tricks_resolve 
    ClearExceptionGroup goal_gaps_mod_tricks
    <proceed_to_timer> = 1
    <invert_anims> = [
        Switcheroo_Init
        Switcheroo_Range
        Switcheroo_Out
        AndrectInvert_Init
        AndrectInvert_Range
        AndrectInvert_Out
        EggPlant_Init
        EggPlant_Range
        EggPlant_Out
        Invert_Init
        Invert_Range
        Invert_Out
        GymnastPlant_Init
        GymnastPlant_Range
        GymnastPlant_Out
        MuteInvert_Init
        MuteInvert_Range
        MuteInvert_Out
        OneFootInvert_Init
        OneFootInvert_Range
        OneFootInvert_Out
    ]
    if ChecksumEquals a = <exception> b = SkaterEnterRail
        <proceed_to_timer> = 0
        switch <trick_type>
            case grind
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
            case spin
            if skater ::IsInNatasSpin
                <proceed_to_timer> = 1
            endif
            case stall
            wait 15 frames
            if skater ::OnStall
                <proceed_to_timer> = 1
            endif
        endswitch
    endif
    if ChecksumEquals a = <exception> b = SkaterEnterLip
        <proceed_to_timer> = 0
        switch <trick_type>
            case lip
            wait 15 frames
            if NOT skater ::Skater_AnimEquals <invert_anims>
                <proceed_to_timer> = 1
            endif
            case invert
            wait 15 frames
            if skater ::Skater_AnimEquals <invert_anims>
                <proceed_to_timer> = 1
            endif
            case lipOrInvert
            <proceed_to_timer> = 1
        endswitch
    endif
    if ((<on_level_node> = 1)& ((mod_tricks_on_level_node)= 0))
        <proceed_to_timer> = 0
    endif
    if (<proceed_to_timer> = 1)
        SpawnScriptLater {
            mod_tricks_timer
            params = {
                trick_type = <trick_type>
                goal_id = <goal_id>
                on_level_node = <on_level_node>
                dont_allow_miss = <dont_allow_miss>
                all_in_one_combo = <all_in_one_combo>
            }
        }
    else
        SpawnScriptLater {
            mod_tricks_trick_checker
            params = {
                trick_type = <trick_type>
                goal_id = <goal_id>
                on_level_node = <on_level_node>
                dont_allow_miss = <dont_allow_miss>
                all_in_one_combo = <all_in_one_combo>
            }
        }
    endif
endscript

script mod_tricks_loop_breakout 
    if ((<dont_allow_miss> = 1)& ((mod_tricks_trick_mod_prompted)= 1))
        GoalManager_LoseGoal name = <goal_id>
    else
        if ((<all_in_one_combo> = 1)& (<dont_allow_miss> = 0)& ((mod_tricks_trick_mod_prompted)= 1))
            GoalManager_LoseGoal name = <goal_id>
        else
            mod_tricks_trick_checker {
                trick_type = <trick_type>
                goal_id = <goal_id>
                on_level_node = <on_level_node>
                dont_allow_miss = <dont_allow_miss>
                all_in_one_combo = <all_in_one_combo>
            }
        endif
    endif
endscript
mod_tricks_trick_mod_prompted = 0

script mod_tricks_timer 
    ClearExceptionGroup goal_gaps_mod_tricks
    change mod_tricks_trick_mod_prompted = 0
    SetException {
        Ex = SkaterBailed
        scr = mod_tricks_loop_breakout
        params = {
            trick_type = <trick_type>
            goal_id = <goal_id>
            on_level_node = <on_level_node>
            dont_allow_miss = <dont_allow_miss>
            all_in_one_combo = <all_in_one_combo>
        }
        group = goal_gaps_mod_tricks
    }
    SetException {
        Ex = SkaterLanded
        scr = mod_tricks_loop_breakout
        params = {
            trick_type = <trick_type>
            goal_id = <goal_id>
            on_level_node = <on_level_node>
            dont_allow_miss = <dont_allow_miss>
            all_in_one_combo = <all_in_one_combo>
        }
        group = goal_gaps_mod_tricks
    }
    SetException {
        Ex = SkaterEnterAir
        scr = mod_tricks_loop_breakout
        params = {
            trick_type = <trick_type>
            goal_id = <goal_id>
            on_level_node = <on_level_node>
            dont_allow_miss = <dont_allow_miss>
            all_in_one_combo = <all_in_one_combo>
        }
        group = goal_gaps_mod_tricks
    }
    wait 1 second
    <mod_tricks_manual_mods> = [
        {
            buttons = [ '\b0' '\b0' ]
            trick_text = 'pogo'
        }
        {
            buttons = [ '\b2' '\b2' ]
            trick_text = 'handstand'
        }
        {
            buttons = [ '\b1' '\b1' ]
            trick_text = ['360 fingerflip' 'half cab impossible' 'handflip' 'wrap around' 'rail flip' 'truckstand flip' 'casper flip']
        }
        {
            buttons = [ '\b0' '\b2' ]
            trick_text = 'switch foot pogo'
        }
        {
            buttons = [ '\b0' '\b1' ]
            trick_text = 'truckstand'
        }
        {
            buttons = [ '\b1' '\b0' ]
            trick_text = 'casper'
        }
        {
            buttons = [ '\b2' '\b0' ]
            trick_text = [ 'one foot manual' 'one foot nose manual' ]
        }
        {
            buttons = [ '\b1' '\b2' ]
            trick_text = 'anti casper'
        }
        {
            buttons = [ '\b2' '\b1' ]
            trick_text = 'to rail'
        }
    ]
    <mod_tricks_spin_mods> = [
        {
            buttons = [ '\b0' '\b0' ]
            trick_text = 'l spin'
        }
        {
            buttons = [ '\b2' '\b2' ]
            trick_text = 'handstand spin'
        }
        {
            buttons = [ '\b1' '\b1' ]
            trick_text = 'one foot spin'
        }
    ]
    <mod_tricks_lip_mods> = [
        {
            buttons = [ '\b0' '\b0' ]
            trick_text = 'fs noseblunt'
        }
        {
            buttons = [ '\b2' '\b2' ]
            trick_text = 'axle stall'
        }
        {
            buttons = [ '\b1' '\b1' ]
            trick_text = 'disaster'
        }
        {
            buttons = [ '\b0' '\b2' ]
            trick_text = 'blunt to fakie'
        }
        {
            buttons = [ '\b0' '\b1' ]
            trick_text = 'fs nosepick'
        }
        {
            buttons = [ '\b1' '\b2' ]
            trick_text = 'rock to fakie'
        }
        {
            buttons = [ '\b2' '\b1' ]
            trick_text = 'bs boneless'
        }
    ]
    <mod_tricks_grind_mods> = [
        {
            buttons = [ '\b2' '\b0' ]
            trick_text = [
                'one footed fs 50-50'
                'one footed bs 50-50'
                'one footed fs crooked'
                'one footed bs crooked'
                'one footed fs smith'
                'one footed bs smith'
                'one footed fs nosegrind'
                'one footed bs nosegrind'
                'one footed fs noseslide'
                'one footed bs noseslide'
                'one footed fs tailslide'
                'one footed bs tailslide'
                'one footed fs 5-0'
                'one footed bs 5-0'
                'one footed fs bluntslide'
                'one footed bs bluntslide'
                'one footed fs boardslide'
                'one footed bs boardslide'
                'one footed fs lipslide'
                'one footed bs lipslide'
            ]
        }
        {
            buttons = [ '\b0' '\b0' ]
            trick_text = [ 'fs 50-50' 'bs 50-50' ]
        }
        {
            buttons = [ '\b2' '\b2' ]
            trick_text = [ 'fs crooked' 'bs crooked' ]
        }
        {
            buttons = [ '\b1' '\b1' ]
            trick_text = [ 'fs smith' 'bs smith' ]
        }
        {
            buttons = [ '\b0' '\b2' ]
            trick_text = [ 'fs nosegrind' 'bs nosegrind' ]
        }
        {
            buttons = [ '\b0' '\b1' ]
            trick_text = [ 'fs noseslide' 'bs noseslide' ]
        }
        {
            buttons = [ '\b1' '\b0' ]
            trick_text = [ 'fs tailslide' 'bs tailslide' ]
        }
        {
            buttons = [ '\b1' '\b2' ]
            trick_text = [ 'fs 5-0' 'bs 5-0' ]
        }
        {
            buttons = [ '\b2' '\b1' ]
            trick_text = [ 'fs bluntslide' 'bs bluntslide' ]
        }
    ]
    <mod_tricks_stall_mods> = [
        {
            buttons = [ '\b0' '\b0' ]
            trick_text = [ 'fs 50-50 stall' 'bs 50-50 stall' ]
        }
        {
            buttons = [ '\b2' '\b2' ]
            trick_text = [ 'fs crooked stall' 'bs crooked stall' ]
        }
        {
            buttons = [ '\b1' '\b1' ]
            trick_text = [ 'fs smith stall' 'bs smith stall' ]
        }
        {
            buttons = [ '\b0' '\b2' ]
            trick_text = [ 'fs nosegrind stall' 'bs nosegrind stall' ]
        }
        {
            buttons = [ '\b0' '\b1' ]
            trick_text = [ 'fs nose stall' 'bs nose stall' ]
        }
        {
            buttons = [ '\b1' '\b0' ]
            trick_text = [ 'fs tail stall' 'bs tail stall' ]
        }
        {
            buttons = [ '\b1' '\b2' ]
            trick_text = [ 'fs 5-0 stall' 'bs 5-0 stall' ]
        }
        {
            buttons = [ '\b2' '\b1' ]
            trick_text = [ 'fs blunt stall' 'bs blunt stall' ]
        }
    ]
    <mod_tricks_invert_mods> = [
        {
            buttons = [ '\b0' '\b0' ]
            trick_text = 'invert'
        }
        {
            buttons = [ '\b2' '\b2' ]
            trick_text = 'gymnast plant'
        }
        {
            buttons = [ '\b1' '\b1' ]
            trick_text = 'one foot invert'
        }
        {
            buttons = [ '\b0' '\b2' ]
            trick_text = 'andrecht invert'
        }
        {
            buttons = [ '\b1' '\b2' ]
            trick_text = 'eggplant'
        }
        {
            buttons = [ '\b2' '\b1' ]
            trick_text = 'varial invert to fakie'
        }
    ]
    <invert_anims> = [
        Switcheroo_Init
        Switcheroo_Range
        Switcheroo_Out
        AndrectInvert_Init
        AndrectInvert_Range
        AndrectInvert_Out
        EggPlant_Init
        EggPlant_Range
        EggPlant_Out
        Invert_Init
        Invert_Range
        Invert_Out
        GymnastPlant_Init
        GymnastPlant_Range
        GymnastPlant_Out
        MuteInvert_Init
        MuteInvert_Range
        MuteInvert_Out
        OneFootInvert_Init
        OneFootInvert_Range
        OneFootInvert_Out
    ]
    switch <trick_type>
        case Manual
        <trick_mods> = <mod_tricks_manual_mods>
        case spin
        <trick_mods> = <mod_tricks_spin_mods>
        case lip
        <trick_mods> = <mod_tricks_lip_mods>
        case stall
        <trick_mods> = <mod_tricks_stall_mods>
        case grind
        <trick_mods> = <mod_tricks_grind_mods>
        case invert
        <trick_mods> = <mod_tricks_invert_mods>
        case lipOrInvert
        if skater ::Skater_AnimEquals <invert_anims>
            <trick_mods> = <mod_tricks_invert_mods>
        else
            <trick_mods> = <mod_tricks_lip_mods>
        endif
    endswitch
    GetArraySize <trick_mods>
    <num_trick_mods> = (<array_size> - 1)
    begin 
    begin 
    if ChecksumEquals a = <trick_type> b = lipOrInvert
        if skater ::Skater_AnimEquals <invert_anims>
            <trick_mods> = <mod_tricks_invert_mods>
        else
            <trick_mods> = <mod_tricks_lip_mods>
        endif
        GetArraySize <trick_mods>
        <num_trick_mods> = (<array_size> - 1)
    endif
    getrandomvalue name = trick_mod_index a = 0 b = <num_trick_mods> integer
    <trick_mod> = (<trick_mods> [ <trick_mod_index> ])
    <same_as_last_trick> = 0
    if IsArray (<trick_mod>.trick_text)
        GetArraySize (<trick_mod>.trick_text)
        <trick_text_index> = 0
        begin 
        if skater ::islatesttrick TrickText = (<trick_mod>.trick_text [ <trick_text_index> ])
            <same_as_last_trick> = 1
        endif
        <trick_text_index> = (<trick_text_index> + 1)
        repeat <array_size>
    else
        if skater ::islatesttrick TrickText = (<trick_mod>.trick_text)
            <same_as_last_trick> = 1
        endif
    endif
    if (<same_as_last_trick> = 0)
        break 
    endif
    repeat 
    ResetScorePot
    GetArraySize (<trick_mod>.buttons)
    <index> = 0
    <Pos> = (50.0, 185.0)
    begin 
    change mod_tricks_trick_mod_prompted = 1
    SetScreenElementLock id = root_window Off
    FormatText checksumname = button_id 'mod_tricks_button%i' i = <index>
    CreateScreenElement {
        type = TextElement
        parent = root_window
        id = <button_id>
        text = (<trick_mod>.buttons [ <index> ])
        font = small
        rgba = [ 128 128 128 128 ]
        just = [ center center ]
        Pos = (0.0, 0.0)
        Scale = 1.0
    }
    spawnscriptnow mod_tricks_show_button params = {id = <button_id> Pos = <Pos>}
    wait 15 frames
    <Pos> = (<Pos> + (50.0, 0.0))
    <index> = (<index> + 1)
    repeat <array_size>
    <got_trick> = 0
    begin 
    if (<got_trick> = 1)
        break 
    else
        if IsArray (<trick_mod>.trick_text)
            GetArraySize (<trick_mod>.trick_text)
            <trick_text_index> = 0
            begin 
            if skater ::islatesttrick TrickText = (<trick_mod>.trick_text [ <trick_text_index> ])
                <got_trick> = 1
                break 
            endif
            <trick_text_index> = (<trick_text_index> + 1)
            repeat <array_size>
        else
            if skater ::islatesttrick TrickText = (<trick_mod>.trick_text)
                <got_trick> = 1
            endif
        endif
    endif
    wait 1 frames
    repeat 105
    if (<got_trick> = 1)
        mod_tricks_got_mod goal_id = <goal_id>
    else
        create_panel_block id = mod_tricks_got_it_msg text = str_g_c_4 style = panel_message_countdown
        if (<dont_allow_miss> = 1)
            GoalManager_LoseGoal name = <goal_id>
        endif
    endif
    if (<all_in_one_combo> = 0)
        change mod_tricks_trick_mod_prompted = 0
    endif
    mod_tricks_cleanup_screen_elements
    if (<all_in_one_combo> = 0)
        wait 0.7500 seconds
    else
        wait 30 frames
    endif
    repeat 
endscript

script mod_tricks_got_mod 
    create_panel_block \{ id = mod_tricks_got_it_msg text = str_g_c_5 style = panel_message_countdown }
    GoalManager_GotCounterObject name = <goal_id>
    GoalManager_GetGoalParams name = <goal_id>
    if GotParam \{ got_mod_script }
        <got_mod_script> <got_mod_params>
    endif
endscript

script mod_tricks_show_button 
    if ScreenElementExists id = <id>
        DoScreenElementMorph id = <id> Pos = (640.0, 185.0) alpha = 0 Scale = 20.0
        DoScreenElementMorph id = <id> Pos = <Pos> alpha = 0.8000 Scale = 2.0 time = 0.1500
        wait 0.1500 seconds
        DoScreenElementMorph id = <id> Scale = 4.0 rot_angle = -15 alpha = 1.0 time = 0.07500
        wait 0.07500 seconds
        DoScreenElementMorph id = <id> Scale = 1.0 rot_angle = 8 time = 0.07500
        wait 0.07500 seconds
        DoScreenElementMorph id = <id> Scale = 2.0 rot_angle = 0 time = 0.07500
    endif
endscript

script mod_tricks_cleanup_screen_elements 
    KillSpawnedScript \{ name = mod_tricks_show_button }
    <index> = 0
    begin 
    FormatText checksumname = screen_element 'mod_tricks_button%i' i = <index>
    if ScreenElementExists id = <screen_element>
        DestroyScreenElement id = <screen_element>
    endif
    <index> = (<index> + 1)
    repeat 3
endscript

script mod_tricks_cleanup 
    ClearExceptionGroup \{ goal_gaps_mod_tricks }
    KillSpawnedScript \{ name = mod_tricks_loop_breakout }
    KillSpawnedScript \{ name = mod_tricks_trick_checker }
    KillSpawnedScript \{ name = mod_tricks_resolve }
    KillSpawnedScript \{ name = mod_tricks_timer }
    mod_tricks_cleanup_screen_elements
    change \{ mod_tricks_trick_mod_prompted = 0 }
endscript

script goal_unique_tricks_trigger 
    skater ::GetLatestTrickChecksum
    if NOT (<latest_trick> = 0)
        GoalManager_GetGoalParams name = <name>
        <new_trick> = None
        <new_trick_index> = -1
        <index> = 0
        begin 
        if ChecksumEquals a = (<unique_got_tricks> [ <index> ])b = None
            <new_trick> = <latest_trick>
            <new_trick_index> = <index>
            break 
        else
            if ChecksumEquals a = (<unique_got_tricks> [ <index> ])b = <latest_trick>
                break 
            endif
        endif
        <index> = (<index> + 1)
        repeat <number>
        if NOT ChecksumEquals a = <new_trick> b = None
            SetArrayElement {
                arrayName = unique_got_tricks
                index = <index>
                newValue = <latest_trick>
            }
            GoalManager_EditGoal name = <name> params = { unique_got_tricks = <unique_got_tricks> }
            GoalManager_GotCounterObject name = <name>
        endif
    endif
endscript
