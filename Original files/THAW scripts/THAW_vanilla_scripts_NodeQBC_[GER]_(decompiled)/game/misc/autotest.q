LevelTestScripts = [
    {
        TestScript = Generic_TestLevel
        TestParams = { level = load_au }
    }
    {
        TestScript = Generic_TestLevel
        TestParams = { level = load_ba }
    }
    {
        TestScript = Generic_TestLevel
        TestParams = { level = load_be }
    }
    {
        TestScript = Generic_TestLevel
        TestParams = { level = load_bo }
    }
    {
        TestScript = Generic_TestLevel
        TestParams = { level = load_dj }
    }
    {
        TestScript = Generic_TestLevel
        TestParams = { level = load_la }
    }
    {
        TestScript = Generic_TestLevel
        TestParams = { level = load_NO }
    }
    {
        TestScript = Generic_TestLevel
        TestParams = { level = load_ph }
    }
    {
        TestScript = Generic_TestLevel
        TestParams = { level = load_sc }
    }
    {
        TestScript = Generic_TestLevel
        TestParams = { level = load_tr }
    }
    {
        TestScript = Generic_TestLevel
        TestParams = { level = load_ca }
    }
    {
        TestScript = Generic_TestLevel
        TestParams = { level = load_ap }
    }
    {
        TestScript = Generic_TestLevel
        TestParams = { level = load_st }
    }
    {
        TestScript = Generic_TestLevel
        TestParams = { level = load_se }
    }
    {
        TestScript = Generic_TestLevel
        TestParams = { level = load_se2 }
    }
    {
        TestScript = Generic_TestLevel
        TestParams = { level = Load_TestLevel }
    }
    {
        TestScript = Generic_TestLevel
        TestParams = { level = load_mainmenu }
    }
]

script Generic_TestLevel 
    if NOT GotParam \{ level }
        script_assert \{ 'where is the level name?' }
    endif
    ChangeLevel level = <level>
    wait \{ 5 gameframes }
    if GotParam \{ TestCommonGoals }
        TestCommonGoals
    endif
endscript

script CleanupAnyMenus 
    wait \{ 10 seconds }
endscript

script TestCommonGoals 
    GoalManager_UnlockAllGoals
    TestScoreGoal type = 'HighScore'
    CleanupAnyMenus
    TestScoreGoal type = 'ProScore'
    CleanupAnyMenus
    TestScoreGoal type = 'SickScore'
    CleanupAnyMenus
    TestSkateLettersGoal
    CleanupAnyMenus
    TestRaceGoal
    CleanupAnyMenus
    TestCollectGoal
    CleanupAnyMenus
    TestComboGoal type = 'AmateurComboLine'
    CleanupAnyMenus
    TestComboGoal type = 'ProCombo'
    CleanupAnyMenus
    GoalManager_UnBeatAllGoals
    wait 1 second
endscript

script TestLevels 
    DestroyAndRecreateMessageContainer
    begin 
    GetNextArrayElement LevelTestScripts index = <index>
    if GotParam \{ element }
        AddParams <element>
        <TestScript> <TestParams>
    else
        break 
    endif
    wait \{ 1 gameframes }
    repeat 
endscript
KenStylePos = (320.0, 405.0)

script KenStyle 
    setprops \{Scale = 2 Pos = KenStylePos just = [ center center ] rgba = [ 0 128 0 128 ]}
    DoMorph \{ time = 0 Pos = KenStylePos Scale = 0 }
    DoMorph \{ time = 0.2000 Pos = KenStylePos Scale = 1.200 }
    wait \{ 2 seconds }
    FireEvent \{ type = KenStyleMessageDied }
    Die
endscript

script DestroyAndRecreateMessageContainer 
    if ObjectExists \{ id = TestLevelMessagesContainer }
        DestroyScreenElement \{ id = TestLevelMessagesContainer }
    endif
    SetScreenElementLock \{ id = root_window Off }
    CreateScreenElement \{id = TestLevelMessagesContainer parent = root_window type = ContainerElement Pos = (320.0, 240.0) dims = (640.0, 480.0)}
endscript

script DisplayTestMessage 
    SetScreenElementLock \{ id = TestLevelMessagesContainer Off }
    CreateScreenElement {
        parent = TestLevelMessagesContainer
        type = TextElement
        font = small
        text = <text>
    }
    RunScriptOnScreenElement id = <id> KenStyle
    WaitForEvent \{ type = KenStyleMessageDied }
endscript

script TestSkateLettersGoal 
    DisplayTestMessage text = 'About to test letters goal ...'
    GoalManager_CreateGoalName goal_type = 'Skate'
    if GoalManager_ActivateGoal name = <goal_id> dontassert
        GoalManager_GetGoalParams name = <goal_id>
        wait 1 gameframe
        wait 2 seconds
        PlaySkaterCamAnim skater = 0 stop
        wait 1 gameframe
        JumpSkaterToNode nodeName = <S_obj_id>
        wait 1 gameframe
        JumpSkaterToNode nodeName = <K_obj_id>
        wait 1 gameframe
        JumpSkaterToNode nodeName = <A_obj_id>
        wait 1 gameframe
        JumpSkaterToNode nodeName = <T_obj_id>
        wait 1 gameframe
        JumpSkaterToNode nodeName = <E_obj_id>
        wait 1 gameframe
        wait 2 seconds
        PlaySkaterCamAnim skater = 0 stop
    else
        wait 1 seconds
        DisplayTestMessage text = 'No SKATE letters goal to test ...'
    endif
endscript

script TestRaceGoal 
    DisplayTestMessage text = 'About to test race goal ...'
    GoalManager_CreateGoalName goal_type = 'Rennen'
    if GoalManager_ActivateGoal name = <goal_id> dontassert
        GoalManager_GetGoalParams name = <goal_id>
        wait 1 gameframe
        wait 2 seconds
        PlaySkaterCamAnim skater = 0 stop
        wait 1 gameframe
        begin 
        GetNextArrayElement <race_waypoints>
        if NOT GotParam element
            break 
        endif
        AddParams <element>
        JumpSkaterToNode nodeName = <id>
        wait 1 gameframe
        repeat 
        wait 2 seconds
        PlaySkaterCamAnim skater = 0 stop
    else
        wait 1 seconds
        DisplayTestMessage text = 'No Race goal to test ...'
    endif
endscript

script TestCollectGoal 
    DisplayTestMessage text = 'About to test collect goal ...'
    GoalManager_CreateGoalName goal_type = 'Collect'
    if GoalManager_ActivateGoal name = <goal_id> dontassert
        GoalManager_GetGoalParams name = <goal_id>
        wait 1 gameframe
        wait 2 seconds
        PlaySkaterCamAnim skater = 0 stop
        wait 1 gameframe
        PermuteArray array = <goal_collect_objects> newarrayname = PermutedArray
        begin 
        GetNextArrayElement <PermutedArray>
        if NOT GotParam element
            break 
        endif
        AddParams <element>
        JumpSkaterToNode nodeName = <id>
        wait 2 seconds
        PlaySkaterCamAnim skater = 0 stop
        repeat 
        wait 2 seconds
        PlaySkaterCamAnim skater = 0 stop
    else
        wait 1 seconds
        DisplayTestMessage text = 'No Collect goal to test ...'
    endif
endscript

script TestComboGoal 
    FormatText textname = MessageText 'About to test %s ...' s = <type>
    DisplayTestMessage text = <MessageText>
    GoalManager_CreateGoalName goal_type = <type>
    if GoalManager_ActivateGoal name = <goal_id> dontassert
        GoalManager_GetGoalParams name = <goal_id>
        wait 1 gameframe
        wait 2 seconds
        PlaySkaterCamAnim skater = 0 stop
        wait 1 gameframe
        JumpSkaterToNode nodeName = <c_obj_id> MoveUpABit
        wait 1 gameframe
        JumpSkaterToNode nodeName = <o_obj_id> MoveUpABit
        wait 1 gameframe
        JumpSkaterToNode nodeName = <m_obj_id> MoveUpABit
        wait 1 gameframe
        JumpSkaterToNode nodeName = <b_obj_id> MoveUpABit
        wait 1 gameframe
        JumpSkaterToNode nodeName = <o2_obj_id> MoveUpABit
        wait 1 gameframe
        wait 2 seconds
        PlaySkaterCamAnim skater = 0 stop
    else
        wait 1 seconds
        FormatText textname = MessageText 'No %s to test ...' s = <type>
        DisplayTestMessage text = <MessageText>
    endif
endscript

script TestScoreGoal 
    FormatText textname = MessageText 'About to test %s ...' s = <type>
    DisplayTestMessage text = <MessageText>
    GoalManager_CreateGoalName goal_type = <type>
    if GoalManager_ActivateGoal name = <goal_id> dontassert
        GoalManager_GetGoalParams name = <goal_id>
        wait 1 gameframe
        wait 2 seconds
        PlaySkaterCamAnim skater = 0 stop
        MakeSkaterGoto MakeSkaterGetScore params = { Score = <Score> }
        wait 2 seconds
        PlaySkaterCamAnim skater = 0 stop
    else
        wait 1 seconds
        FormatText textname = MessageText 'No %s to test ...' s = <type>
        DisplayTestMessage text = <MessageText>
    endif
endscript

script MakeSkaterGetScore 
    SetTrickName \{ "Cheat Score" }
    SetTrickScore <Score>
    display
    SetTrickName \{ "Cheat Score" }
    SetTrickScore <Score>
    display
    ClearPanel_Landed
    goto \{ ongroundai }
endscript
