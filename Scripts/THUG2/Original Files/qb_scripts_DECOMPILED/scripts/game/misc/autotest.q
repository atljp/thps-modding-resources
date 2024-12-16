LevelTestScripts = 
[ 
	{ TestScript = Generic_TestLevel TestParams = { Level = load_au } } 
	{ TestScript = Generic_TestLevel TestParams = { Level = load_ba } } 
	{ TestScript = Generic_TestLevel TestParams = { Level = load_be } } 
	{ TestScript = Generic_TestLevel TestParams = { Level = load_bo } } 
	{ TestScript = Generic_TestLevel TestParams = { Level = load_dj } } 
	{ TestScript = Generic_TestLevel TestParams = { Level = load_la } } 
	{ TestScript = Generic_TestLevel TestParams = { Level = load_no } } 
	{ TestScript = Generic_TestLevel TestParams = { Level = load_ph } } 
	{ TestScript = Generic_TestLevel TestParams = { Level = load_sc } } 
	{ TestScript = Generic_TestLevel TestParams = { Level = load_tr } } 
	{ TestScript = Generic_TestLevel TestParams = { Level = load_ca } } 
	{ TestScript = Generic_TestLevel TestParams = { Level = load_ap } } 
	{ TestScript = Generic_TestLevel TestParams = { Level = load_st } } 
	{ TestScript = Generic_TestLevel TestParams = { Level = load_se } } 
	{ TestScript = Generic_TestLevel TestParams = { Level = load_se2 } } 
	{ TestScript = Generic_TestLevel TestParams = { Level = load_testlevel } } 
	{ TestScript = Generic_TestLevel TestParams = { Level = Load_MainMenu } } 
] 
SCRIPT Generic_TestLevel 
	IF NOT gotparam Level 
		script_assert "where is the level name?" 
	ENDIF 
	changelevel Level = <Level> 
	wait 5 gameframes 
	IF gotparam TestCommonGoals 
		TestCommonGoals 
	ENDIF 
ENDSCRIPT

SCRIPT CleanupAnyMenus 
	wait 10 seconds 
ENDSCRIPT

SCRIPT TestCommonGoals 
	GoalManager_UnlockAllGoals 
	TestScoreGoal Type = "HighScore" 
	CleanupAnyMenus 
	TestScoreGoal Type = "ProScore" 
	CleanupAnyMenus 
	TestScoreGoal Type = "SickScore" 
	CleanupAnyMenus 
	TestSkateLettersGoal 
	CleanupAnyMenus 
	TestRaceGoal 
	CleanupAnyMenus 
	TestCollectGoal 
	CleanupAnyMenus 
	TestComboGoal Type = "AmateurComboLine" 
	CleanupAnyMenus 
	TestComboGoal Type = "ProCombo" 
	CleanupAnyMenus 
	GoalManager_UnbeatAllGoals 
	wait 1 second 
ENDSCRIPT

SCRIPT TestLevels 
	DestroyAndRecreateMessageContainer 
	BEGIN 
		GetNextArrayElement LevelTestScripts index = <index> 
		IF gotparam Element 
			AddParams <Element> 
			<TestScript> <TestParams> 
		ELSE 
			BREAK 
		ENDIF 
		wait 1 gameframes 
	REPEAT 
ENDSCRIPT

KenStylePos = PAIR(320.00000000000, 405.00000000000) 
SCRIPT KenStyle 
	SetProps Scale = 2 Pos = KenStylePos Just = [ CENTER CENTER ] rgba = [ 0 , 128 , 0 , 128 ] 
	DoMorph Time = 0 Pos = KenStylePos Scale = 0 
	DoMorph Time = 0.20000000298 Pos = KenStylePos Scale = 1.20000004768 
	wait 2 seconds 
	FireEvent Type = KenStyleMessageDied 
	Die 
ENDSCRIPT

SCRIPT DestroyAndRecreateMessageContainer 
	IF ObjectExists Id = TestLevelMessagesContainer 
		DestroyScreenElement Id = TestLevelMessagesContainer 
	ENDIF 
	SetScreenElementLock Id = root_window Off 
	CreateScreenElement { 
		Id = TestLevelMessagesContainer 
		Parent = root_window 
		Type = ContainerElement 
		Pos = PAIR(320.00000000000, 240.00000000000) 
		Dims = PAIR(640.00000000000, 480.00000000000) 
	} 
ENDSCRIPT

SCRIPT DisplayTestMessage 
	SetScreenElementLock Id = TestLevelMessagesContainer Off 
	CreateScreenElement { 
		Parent = TestLevelMessagesContainer 
		Type = TextElement 
		Font = Small 
		Text = <Text> 
	} 
	RunScriptOnScreenElement Id = <Id> KenStyle 
	WaitForEvent Type = KenStyleMessageDied 
ENDSCRIPT

SCRIPT TestSkateLettersGoal 
	DisplayTestMessage Text = "About to test letters goal ..." 
	GoalManager_CreateGoalName Goal_Type = "Skate" 
	IF GoalManager_ActivateGoal Name = <Goal_Id> DontAssert 
		GoalManager_GetGoalParams Name = <Goal_Id> 
		wait 1 gameframe 
		wait 2 seconds 
		PlaySkaterCamAnim skater = 0 stop 
		wait 1 gameframe 
		JumpSkaterToNode NodeName = <s_obj_id> 
		wait 1 gameframe 
		JumpSkaterToNode NodeName = <k_obj_id> 
		wait 1 gameframe 
		JumpSkaterToNode NodeName = <a_obj_id> 
		wait 1 gameframe 
		JumpSkaterToNode NodeName = <t_obj_id> 
		wait 1 gameframe 
		JumpSkaterToNode NodeName = <e_obj_id> 
		wait 1 gameframe 
		wait 2 seconds 
		PlaySkaterCamAnim skater = 0 stop 
	ELSE 
		wait 1 seconds 
		DisplayTestMessage Text = "No SKATE letters goal to test ..." 
	ENDIF 
ENDSCRIPT

SCRIPT TestRaceGoal 
	DisplayTestMessage Text = "About to test race goal ..." 
	GoalManager_CreateGoalName Goal_Type = "Race" 
	IF GoalManager_ActivateGoal Name = <Goal_Id> DontAssert 
		GoalManager_GetGoalParams Name = <Goal_Id> 
		wait 1 gameframe 
		wait 2 seconds 
		PlaySkaterCamAnim skater = 0 stop 
		wait 1 gameframe 
		BEGIN 
			GetNextArrayElement <race_waypoints> 
			IF NOT gotparam Element 
				BREAK 
			ENDIF 
			AddParams <Element> 
			JumpSkaterToNode NodeName = <Id> 
			wait 1 gameframe 
		REPEAT 
		wait 2 seconds 
		PlaySkaterCamAnim skater = 0 stop 
	ELSE 
		wait 1 seconds 
		DisplayTestMessage Text = "No Race goal to test ..." 
	ENDIF 
ENDSCRIPT

SCRIPT TestCollectGoal 
	DisplayTestMessage Text = "About to test collect goal ..." 
	GoalManager_CreateGoalName Goal_Type = "Collect" 
	IF GoalManager_ActivateGoal Name = <Goal_Id> DontAssert 
		GoalManager_GetGoalParams Name = <Goal_Id> 
		wait 1 gameframe 
		wait 2 seconds 
		PlaySkaterCamAnim skater = 0 stop 
		wait 1 gameframe 
		PermuteArray Array = <goal_collect_objects> NewArrayName = PermutedArray 
		BEGIN 
			GetNextArrayElement <PermutedArray> 
			IF NOT gotparam Element 
				BREAK 
			ENDIF 
			AddParams <Element> 
			JumpSkaterToNode NodeName = <Id> 
			wait 2 seconds 
			PlaySkaterCamAnim skater = 0 stop 
		REPEAT 
		wait 2 seconds 
		PlaySkaterCamAnim skater = 0 stop 
	ELSE 
		wait 1 seconds 
		DisplayTestMessage Text = "No Collect goal to test ..." 
	ENDIF 
ENDSCRIPT

SCRIPT TestComboGoal 
	FormatText TextName = MessageText "About to test %s ..." s = <Type> 
	DisplayTestMessage Text = <MessageText> 
	GoalManager_CreateGoalName Goal_Type = <Type> 
	IF GoalManager_ActivateGoal Name = <Goal_Id> DontAssert 
		GoalManager_GetGoalParams Name = <Goal_Id> 
		wait 1 gameframe 
		wait 2 seconds 
		PlaySkaterCamAnim skater = 0 stop 
		wait 1 gameframe 
		JumpSkaterToNode NodeName = <c_obj_id> MoveUpABit 
		wait 1 gameframe 
		JumpSkaterToNode NodeName = <o_obj_id> MoveUpABit 
		wait 1 gameframe 
		JumpSkaterToNode NodeName = <m_obj_id> MoveUpABit 
		wait 1 gameframe 
		JumpSkaterToNode NodeName = <b_obj_id> MoveUpABit 
		wait 1 gameframe 
		JumpSkaterToNode NodeName = <o2_obj_id> MoveUpABit 
		wait 1 gameframe 
		wait 2 seconds 
		PlaySkaterCamAnim skater = 0 stop 
	ELSE 
		wait 1 seconds 
		FormatText TextName = MessageText "No %s to test ..." s = <Type> 
		DisplayTestMessage Text = <MessageText> 
	ENDIF 
ENDSCRIPT

SCRIPT TestScoreGoal 
	FormatText TextName = MessageText "About to test %s ..." s = <Type> 
	DisplayTestMessage Text = <MessageText> 
	GoalManager_CreateGoalName Goal_Type = <Type> 
	IF GoalManager_ActivateGoal Name = <Goal_Id> DontAssert 
		GoalManager_GetGoalParams Name = <Goal_Id> 
		wait 1 gameframe 
		wait 2 seconds 
		PlaySkaterCamAnim skater = 0 stop 
		MakeSkaterGoto MakeSkaterGetScore Params = { Score = <Score> } 
		wait 2 seconds 
		PlaySkaterCamAnim skater = 0 stop 
	ELSE 
		wait 1 seconds 
		FormatText TextName = MessageText "No %s to test ..." s = <Type> 
		DisplayTestMessage Text = <MessageText> 
	ENDIF 
ENDSCRIPT

SCRIPT MakeSkaterGetScore 
	SetTrickName #"Cheat Score" 
	SetTrickScore <Score> 
	Display 
	SetTrickName #"Cheat Score" 
	SetTrickScore <Score> 
	Display 
	ClearPanel_Landed 
	goto OnGroundAI 
ENDSCRIPT


