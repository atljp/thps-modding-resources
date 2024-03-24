
script CreateGoalEditor 
    CreateCompositeObject {
        Components = 
        [
            { Component = camera }
            {Component = Input controller = 0}
            {Component = editorcamera max_radius = 2000}
            { Component = GoalEditor }
        ]
        params = { name = GoalEditor permanent }
    }
    GoalEditor ::hide
    GoalEditor ::Suspend
endscript


script InitialiseCreatedGoals 
    GoalEditor ::GetMaxGoalsPerLevel
    i = 0
    begin 
    FormatText checksumname = goal_id 'CreatedGoal%d' d = <i>
    if GoalManager_GoalExists name = <goal_id>
        GoalManager_RemoveGoal name = <goal_id>
    endif
    i = (<i> + 1)
    repeat <max_goals>
    GetCurrentLevel
    if ChecksumEquals a = <level> b = load_sk5ed_gameplay
        level = load_sk5ed
    endif
    GoalEditor ::GetEditedGoalsInfo level = <level>
    if GotParam EditedGoalsInfo
        GetArraySize <EditedGoalsInfo>
        if (<array_size> = 0)
            return 
        endif
        i = 0
        begin 
        safe_goal = 1
        if ((<EditedGoalsInfo> [ <i> ].goal_type)= gap)
            if NOT StructureContains structure = (<EditedGoalsInfo> [ <i> ])gaps
                safe_goal = 0
            endif
        endif
        if (<safe_goal> = 1)
            goal_id = (<EditedGoalsInfo> [ <i> ].goal_id)
            pro_name = (<EditedGoalsInfo> [ <i> ].pro_name)
            GoalEditor ::AddEditedGoalToGoalManager goal_id = <goal_id>
            GoalEditor ::WriteEditedGoalNodePositions goal_id = <goal_id>
        endif
        i = (<i> + 1)
        repeat <array_size>
        if NOT GotParam DoNotCreateGoalPeds
            GoalManager_Initializeallgoals
        endif
    endif
endscript


script ChooseRandomCreatedGoalPedModel 
    obj_initmodelfromprofile {struct = random_male_profile
        use_asset_manager = 1
        texDictOffset = 0
    }
endscript


script goal_editor_destroy_cursor 
    if ObjectExists id = GoalEditorCursor
        goal_editor_delete_marker_object name = GoalEditorCursor
        if IsNGC
            FinishRendering
        endif
    endif
endscript


script goal_editor_create_checkpoint_marker Pos = (0.0, 0.0, 0.0) Angle = 0
    CreateCompositeObject {
        Components = 
        [
            { Component = motion }
            {Component = Model Model = <Model>}
        ]
        params = { name = <name> }
    }
    <name> ::obj_setposition position = <Pos>
    <name> ::obj_setorientation x = 0 y = <Angle> z = 0
    if NOT GotParam no_hide
        <name> ::hide
    endif
    goal_race_create_cones name = <name>
endscript


script goal_editor_create_cursor 
    goal_editor_destroy_cursor
    switch <type>
        case ped
        CreateCompositeObject {
            Components = 
            [
                { Component = motion }
                { Component = Suspend neversuspend }
                {Component = skeleton SkeletonName = THPS6_human}
                { Component = Model }
                {Component = AnimBlender SkeletonName = THPS6_human}
            ]
            params = { name = GoalEditorCursor }
        }
        if ((LevelIs load_sk5ed)|| (LevelIs load_sk5ed_gameplay))
            GoalEditorCursor ::ChooseRandomCreatedGoalPedModel
        else
            GoalEditorCursor ::obj_initmodelfromprofile {
                struct = random_male_profile
                use_asset_manager = 1
                texDictOffset = 0}
        endif
        GoalEditorCursor ::obj_spawnscript cursor_ped_script
        case checkpoint
        goal_editor_create_checkpoint_marker <...> name = GoalEditorCursor no_hide
        default 
        CreateCompositeObject {
            Components = 
            [
                { Component = motion }
                {Component = Model Model = <Model>}
            ]
            params = { name = GoalEditorCursor }
        }
    endswitch
endscript


script goal_editor_update_cursor_position 
    if ObjectExists id = GoalEditorCursor
        GoalEditorCursor ::obj_setposition position = <Pos>
        Angle = (<Angle> * 180 / 3.142)
        GoalEditorCursor ::obj_setorientation y = <Angle>
    endif
endscript


script cursor_ped_script 
    begin 
    if ((LevelIs load_sk5ed)|| (LevelIs load_sk5ed_gameplay))
        Random (
            @ Obj_PlayAnim anim = Cheer1
            @*10 Obj_PlayAnim anim = NewBrakeIdle
        )
    else
        Random (
            @ Obj_PlayAnim anim = Ped_M_Cheering
            @ Obj_PlayAnim anim = Ped_M_ThumbUp
            @ Obj_PlayAnim anim = Ped_M_Clap
        )
    endif
    Obj_WaitAnimFinished
    repeat 
endscript


script delete_goal_editor_marker_objects 
    i = 0
    begin 
    FormatText checksumname = object 'GoalEditorMarkerObject%d' d = <i>
    goal_editor_delete_marker_object name = <object>
    i = (<i> + 1)
    repeat 12
endscript


script goal_editor_delete_marker_object 
    if ObjectExists id = <name>
        <name> ::Die
    endif
    goal_race_kill_cones name = <name>
endscript


script goal_editor_create_marker_object 
    goal_editor_delete_marker_object name = <name>
    switch <type>
        case letter
        CreateCompositeObject {
            Components = 
            [
                { Component = motion }
                {Component = Model Model = <Model>}
            ]
            params = { name = <name> }
        }
        <name> ::obj_setposition position = <Pos>
        <name> ::obj_hover amp = 6 freq = 2
        <name> ::obj_roty Speed = 200
        case ped
        CreateCompositeObject {
            Components = 
            [
                { Component = motion }
                { Component = Suspend neversuspend }
                {Component = skeleton SkeletonName = THPS6_human}
                { Component = Model }
                {Component = AnimBlender SkeletonName = THPS6_human}
            ]
            params = { name = <name> }
        }
        if ((LevelIs load_sk5ed)|| (LevelIs load_sk5ed_gameplay))
            <name> ::ChooseRandomCreatedGoalPedModel
        else
            <name> ::obj_initmodelfromprofile {
                struct = random_male_profile
                use_asset_manager = 1
                texDictOffset = 0}
        endif
        <name> ::obj_setposition position = <Pos>
        <name> ::obj_setorientation x = 0 y = <Angle> z = 0
        <name> ::obj_spawnscript cursor_ped_script
        case checkpoint
        goal_editor_create_checkpoint_marker <...> 
        default 
        CreateCompositeObject {
            Components = 
            [
                { Component = motion }
                {Component = Model Model = <Model>}
            ]
            params = { name = <name> }
        }
        <name> ::obj_setposition position = <Pos>
        <name> ::obj_setorientation x = 0 y = <Angle> z = 0
    endswitch
endscript


script goal_editor_refresh_goal_object_position 
    if ObjectExists id = <name>
        <name> ::obj_setposition position = <Pos>
    endif
endscript


script goal_editor_play_placement_success_sound 
    generic_menu_pad_choose_sound
endscript


script goal_editor_play_placement_fail_sound 
    generic_menu_buzzer_sound
endscript


script goal_editor_play_backup_success_sound 
    generic_menu_pad_back_sound
endscript


script goal_editor_play_backup_fail_sound 
    generic_menu_buzzer_sound
endscript

EditorCam_TurnSpeed = 0.04000
EditorCam_TiltSpeed = 0.03000
EditorCam_TiltMin = 0.5000
EditorCam_TiltMax = 1.571
EditorCam_InOutSpeed = 0.03000
EditorCam_MoveSpeedMin = 5
EditorCam_MoveSpeedMax = 25
EditorCam_UpDownSpeedMin = 1
EditorCam_UpDownSpeedMax = 16
EditorCam_MaxHeight = 1000
EditorCam_MaxY = 2500
EditorCam_CursorCollisionFirstUpOffset = 100
EditorCam_CursorCollisionDownOffset = -10000
EditorCam_YCatchUpFactor = 0.05000
EditedGoal_ExtraParams_Combo = 
{
    goal_type = 'CreatedCombo'
    pro = 'Kenzo'
    no_stream
    full_name = 'Created Goal'
    goal_description = 'Get the C-O-M-B-O letters in one combo'
}
EditedGoal_ExtraParams_Skate = 
{
    goal_type = 'CreatedSkate'
    pro = 'Kenzo'
    no_stream
    full_name = 'Created Goal'
    goal_description = 'Collect the S-K-A-T-E letters'
}
EditedGoal_ExtraParams_HighScore = 
{
    goal_text = 'High Score'
    goal_type = 'CreatedHighScore'
    pro = 'Kenzo'
    no_stream
    full_name = 'Created Goal'
    goal_description = 'Get a high score'
}
edited_high_score_goal_text = 'Get a High Score: %d Points'
EditedGoal_ExtraParams_HighCombo = 
{
    goal_text = 'High Combo'
    goal_type = 'CreatedHighCombo'
    pro = 'Kenzo'
    no_stream
    full_name = 'Created Goal'
    goal_description = 'Get a high combo'
}
edited_high_combo_goal_text = 'Get a High Combo: %d Points'
EditedGoal_ExtraParams_SkateTris = 
{
    goal_text = 'Skate-Tricks'
    goal_type = 'CreatedSkate-Tricks'
    pro = 'Kenzo'
    no_stream
    full_name = 'Created Goal'
    goal_description = 'Nail the tricks as they come up.'
    view_goals_text = 'Skate-Tricks'
}
EditedGoal_ExtraParams_ComboSkateTris = 
{
    goal_text = 'Combo Skate-Tricks'
    goal_type = 'CreatedComboSkate-Tricks'
    pro = 'Kenzo'
    no_stream
    full_name = 'Created Goal'
    goal_description = 'Nail the combos as they come up.'
    view_goals_text = 'Combo Skate-Tricks'
}
EditedGoal_ExtraParams_TrickTris = 
{
    goal_text = 'TrickTris'
    goal_type = 'CreatedComboTrickTris'
    pro = 'Kenzo'
    no_stream
    full_name = 'Created Goal'
    goal_description = 'Nail the tricks as they come up.'
    view_goals_text = 'Tricktris'
}
EditedGoal_ExtraParams_Gap = 
{
    goal_text = 'Gaps goal'
    goal_type = 'CreatedGap'
    pro = 'Kenzo'
    no_stream
    full_name = 'Created Goal'
    goal_description = 'See if you can get this gap.'
    goal_flags = [ got_1 ]
}
EditedGoal_ExtraParams_Race = 
{
    goal_text = 'Race goal'
    goal_type = 'CreatedRace'
    pro = 'Kenzo'
    no_stream
    full_name = 'Created Goal'
    goal_description = 'See if you can get through the race.'
    goal_flags = [ got_1 ]
}
EditedGoal_ExtraParams_TrickBeat = 
{
    goal_text = 'Trick to the beat goal'
    goal_type = 'CreatedTrickBeat'
    pro = 'Kenzo'
    no_stream
    full_name = 'Created Goal'
    goal_description = 'Trick to the Beat!'
    beat_window_time = 255
    total_to_win = 10
    block_size = 1
    goal_trick_beat_key_combos = [
        Air_SquareD
        Air_SquareR
        Air_SquareL
        Air_SquareU
    ]
    tempo = 105
}

script goal_editor_get_beat_pattern 
    beat_pattern = [
        {sounds = [{BailBodyPunch02_11 vol = (100 + randomrange (0.10000000149011612, 4.0))pitch = (100 + randomrange (0.10000000149011612, 3.0))}]
        }
        {}
        {sounds = [{BailBoard02 vol = (100 + randomrange (0.10000000149011612, 4.0))pitch = (200 + randomrange (0.10000000149011612, 3.0))}
                {DE_PauseFlyIn vol = (75 + randomrange (0.10000000149011612, 4.0))pitch = (150 + randomrange (0.10000000149011612, 3.0))}
            ]
        }
        {}
        {pulse
            sounds = [{BailBodyFall01 vol = (100 + randomrange (0.10000000149011612, 4.0))pitch = (200 + randomrange (0.10000000149011612, 3.0))}
                {BailBodyFall04 vol = (100 + randomrange (0.10000000149011612, 4.0))pitch = (140 + randomrange (0.10000000149011612, 3.0))}
            ]
        }
        {}
        {sounds = [{BailBoard02 vol = (100 + randomrange (0.10000000149011612, 4.0))pitch = (200 + randomrange (0.10000000149011612, 3.0))}]
        }
        { 
         }
        { 
         }
        {}
        {sounds = [{BailBoard02 vol = (100 + randomrange (0.10000000149011612, 4.0))pitch = (200 + randomrange (0.10000000149011612, 3.0))}
            ]
        }
        {}
        {pulse
            sounds = [{BailBodyFall01 vol = (100 + randomrange (0.10000000149011612, 4.0))pitch = (200 + randomrange (0.10000000149011612, 3.0))}
                {BailBodyFall04 vol = (100 + randomrange (0.10000000149011612, 4.0))pitch = (140 + randomrange (0.10000000149011612, 3.0))}
            ]
        }
        {}
        {sounds = [{BailBoard02 vol = (100 + randomrange (0.10000000149011612, 4.0))pitch = (200 + randomrange (0.10000000149011612, 3.0))}
                {BailBodyPunch02_11 vol = (100 + randomrange (0.10000000149011612, 4.0))pitch = (100 + randomrange (0.10000000149011612, 3.0))}
            ]
        }
        {}
    ]
    return beat_pattern = <beat_pattern>
endscript

cag_key_combos = 
[
    {
        text = 'Basic Flip Tricks'
        key_combos = 
        [
            Air_SquareU
            Air_SquareD
            Air_SquareL
            Air_SquareR
        ]
    }
    {
        text = 'Diagonal Flip Tricks'
        key_combos = 
        [
            Air_SquareUL
            Air_SquareUR
            Air_SquareDL
            Air_SquareDR
        ]
    }
    {
        text = 'Basic Grab Tricks'
        key_combos = 
        [
            Air_CircleU
            Air_CircleD
            Air_CircleL
            Air_CircleR
        ]
    }
    {
        text = 'Diagonal Grab Tricks'
        key_combos = 
        [
            Air_CircleUL
            Air_CircleUR
            Air_CircleDL
            Air_CircleDR
        ]
    }
    {
        text = 'Double Tap Basic Flips'
        key_combos = 
        [
            {key_combo = Air_SquareD num_taps = 2}
            {key_combo = Air_SquareU num_taps = 2}
            {key_combo = Air_SquareL num_taps = 2}
            {key_combo = Air_SquareR num_taps = 2}
        ]
    }
    {
        text = 'Double Tap Diagonal Flips'
        key_combos = 
        [
            {key_combo = Air_SquareUL num_taps = 2}
            {key_combo = Air_SquareUR num_taps = 2}
            {key_combo = Air_SquareDL num_taps = 2}
            {key_combo = Air_SquareDR num_taps = 2}
        ]
    }
    {
        text = 'Double Tap Basic Grabs'
        key_combos = 
        [
            {key_combo = Air_CircleD num_taps = 2}
            {key_combo = Air_CircleU num_taps = 2}
            {key_combo = Air_CircleL num_taps = 2}
            {key_combo = Air_CircleR num_taps = 2}
        ]
    }
    {
        text = 'Double Tap Diagonal Grabs'
        key_combos = 
        [
            {key_combo = Air_CircleUL num_taps = 2}
            {key_combo = Air_CircleUR num_taps = 2}
            {key_combo = Air_CircleDL num_taps = 2}
            {key_combo = Air_CircleDR num_taps = 2}
        ]
    }
]
emergency_key_combos = [
    Air_CircleU
    Air_CircleD
    Air_CircleL
    Air_CircleR
    Air_CircleUL
    Air_CircleUR
    Air_CircleDL
    Air_CircleDR
    Air_SquareU
    Air_SquareD
    Air_SquareL
    Air_SquareR
    Air_SquareUL
    Air_SquareUR
    Air_SquareDL
    Air_SquareDR
]
EditorCam_CursorCollisionEnableDistMax = 3000
EditorCam_CameraCatchUpFactor = 0.3000
GoalEditor_ObjectHeight = 27
GoalEditor_DefaultMinDistBetweenPositions = 50
GoalEditor_MinDistBetweenObjectsandSkater = 100
EditedGoal_Pro_Node = 
{
    Pos = (0.0, 0.0, 0.0)
    angles = (0.0, 0.0, 0.0)
    class = pedestrian
    type = Ped_From_Profile
    SkeletonName = THPS6_human
    defaultanimname = WStandIdle1
    PedAI_Type = stand
    AnimName = animload_THPS6_human
    profile = random_male_profile
    suspenddistance = 3000
    lod_dist1 = 200
    lod_dist2 = 400
}
EditedGoal_Restart_Node = 
{
    Pos = (0.0, 0.0, 0.0)
    angles = (0.0, 0.0, 0.0)
    class = restart
    type = player1
    createdatstart
    RestartName = 'Edited goal: Restart'
    restart_types = [ player1 ]
}
EditedGoal_Object_Node = 
{
    Pos = (0.0, 0.0, 0.0)
    angles = (0.0, 0.0, 0.0)
    class = gameobject
    suspenddistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
}
EditedGoal_success_cam_anims = 
[
    {
        virtual_cam
        targetOffset = (1.2000000476837158, 62.400001525878906, 0.0) positionOffset = (-2.4000000953674316, 0.0, 26.399999618530273)
        frames = 120
        skippable = 1
        Play_hold
    }
]

script CountNumCreatedGoalsWon 
    GoalEditor ::GetEditedGoalsInfo level = <level>
    num_goals = 0
    num_goals_won = 0
    if GotParam EditedGoalsInfo
        GetArraySize <EditedGoalsInfo>
        if GotParam array_size
            if (<array_size> > 0)
                begin 
                if (<EditedGoalsInfo> [ <num_goals> ].won_goal)
                    num_goals_won = (<num_goals_won> + 1)
                endif
                num_goals = (<num_goals> + 1)
                repeat <array_size>
            endif
        endif
    endif
    return num_goals = <num_goals> num_goals_won = <num_goals_won>
endscript


script goal_editor_finished_placing_objects 
    change goal_editor_placement_mode = 0
    GoalEditor ::hide
    GoalEditor ::Suspend
    create_edit_goal_menu
endscript

