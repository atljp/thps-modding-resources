
EditorCam_MaxHeight = 5000 
le_rail_terrain = [ 
	{ name = "Random Male" profile = random_male_profile skeleton = THPS5_human } 
	{ name = "Random Female" profile = random_female_profile skeleton = Ped_Female } 
	{ name = "Skateboard" profile = Ped_Skateboard_a skeleton = THPS5_human } 
	{ name = "Skateboard Kid" profile = Ped_Kid_Skateboard_a skeleton = THPS5_human } 
	{ name = "Official 1" profile = Ped_Official_SC_01 skeleton = THPS5_human } 
	{ name = "Official 2" profile = Ped_Official_SC_02 skeleton = THPS5_human } 
	{ name = "Video" profile = Ped_Video skeleton = THPS5_human } 
	{ name = "Photo" profile = Ped_Photo skeleton = THPS5_human } 
	{ name = "SCJ Worker" profile = Ped_SCJ_Worker skeleton = THPS5_human } 
	{ name = "SCJ Judge 1" profile = Ped_SCJ_Judge_01 skeleton = THPS5_human } 
	{ name = "SCJ Judge 2" profile = Ped_SCJ_Judge_02 skeleton = THPS5_human } 
	{ name = "SCJ Judge 3" profile = Ped_SCJ_Judge_03 skeleton = THPS5_human } 
	{ name = "SCJ Judge 4" profile = Ped_SCJ_Judge_04 skeleton = THPS5_human } 
	{ name = "SCJ Judge 5" profile = Ped_SCJ_Judge_05 skeleton = THPS5_human } 
	{ name = "SCJ Judge 6" profile = Ped_SCJ_Judge_06 skeleton = THPS5_human } 
	{ name = "Businessman 1" profile = Ped_BusinessMan_01 skeleton = THPS5_human } 
	{ name = "Businessman 2" profile = Ped_BusinessMan_02 skeleton = THPS5_human } 
	{ name = "Businessman 3" profile = Ped_BusinessMan_03 skeleton = THPS5_human } 
	{ name = "Businesswoman" profile = Ped_Businesswoman_01 skeleton = THPS5_human } 
	{ name = "Security 1" profile = Ped_Security_01 skeleton = THPS5_human } 
	{ name = "Security 2" profile = Ped_Security_02 skeleton = THPS5_human } 
	{ name = "Security 3" profile = Ped_Security_03 skeleton = THPS5_human } 
	{ name = "Security F" profile = Ped_F_Security skeleton = Ped_Female } 
	{ name = "NYPD 1" profile = Ped_M_NYPD_01 skeleton = THPS5_human } 
	{ name = "NYPD 2" profile = Ped_F_NYPD_01 skeleton = THPS5_human } 
	{ name = "Cameraman" profile = Ped_Cameraman skeleton = THPS5_human } 
	{ name = "Bikini 1" profile = Ped_Bikini_1 skeleton = Ped_Female } 
	{ name = "Bikini 2" profile = Ped_Bikini_2 skeleton = Ped_Female } 
	{ name = "Bikini 3" profile = Ped_Bikini_3 skeleton = Ped_Female } 
	{ name = "Surfer" profile = Ped_Surfer skeleton = THPS5_human } 
	{ name = "Skater 1" profile = Ped_Skater_NY1 skeleton = THPS5_human } 
	{ name = "Skater 2" profile = Ped_Skater_NY2 skeleton = THPS5_human } 
	{ name = "Desk Clerk 1" profile = Ped_Deskclerk_01 skeleton = THPS5_human } 
	{ name = "Desk Clerk F" profile = Ped_F_Deskclerk_01 skeleton = Ped_Female } 
] 
le_ped_logic = [ 
	{ name = "Test1" ai_script = TestLevel_Skater_Spectator } 
	{ name = "Test2" ai_script = TestLevel_Skater_Spectator2 } 
	{ name = "Test3" ai_script = TestLevel_Skater_Spectator2 } 
] 
le_rail_cur_terrain = 0 
le_ped_cur_mode = 0 
SCRIPT LevelEditor_Rail_Init 
	SetEditingMode mode = FreeRoaming 
	leveleditor_cursor : die 
	CreateCompositeObject { 
		Components = 
		[ 
			{ component = motion } 
			{ component = Suspend NeverSuspend } 
			{ component = skeleton SkeletonName = THPS5_human } 
			{ component = model } 
			{ component = Animation AnimName = animload_THPS5_human } 
		] 
		Params = { name = leveleditor_cursor } 
	} 
	leveleditor_cursor : ChooseRandomCreatedGoalPedModel 
	leveleditor_cursor : Obj_SpawnScript cursor_ped_script 
ENDSCRIPT

SCRIPT LevelEditor_Rail_Close 
	LevelEditor_SetCursorModel model_name = "none" 
	leveleditor_rail_icon : die 
ENDSCRIPT

SCRIPT LevelEditor_Rail_EveryFrame 
	leveleditor : GetCursorPosition 
	leveleditor_cursor : Obj_SetPosition position = <Pos> 
	leveleditor_cursor : Obj_Rotate absolute = ( <Angle> * VECTOR(0.00000000000, 1.00000000000, 0.00000000000) ) 
ENDSCRIPT

SCRIPT LevelEditor_Rail_SetTerrain index = 0 
	GetArraySize le_rail_terrain 
	IF ( <index> = <array_size> ) 
		change le_rail_cur_terrain = 0 
	ELSE 
		change le_rail_cur_terrain = <index> 
	ENDIF 
	GetElement le_rail_terrain index = le_rail_cur_terrain 
	SetScreenElementProps { 
		id = leveleditor_piece 
		text = ( <Element> . name ) 
	} 
ENDSCRIPT

SCRIPT LevelEditor_Rail_SwapMode index = 0 
	GetArraySize le_ped_logic 
	IF ( <index> = <array_size> ) 
		change le_ped_cur_mode = 0 
	ELSE 
		change le_ped_cur_mode = <index> 
	ENDIF 
	GetElement le_ped_logic index = le_ped_cur_mode 
	SetScreenElementProps { 
		id = leveleditor_desc 
		text = ( <Element> . name ) 
	} 
ENDSCRIPT

SCRIPT LevelEditor_Rail_PlaceRail 
	leveleditor : GetCursorPosition 
	CreateCompositeObject { 
		Components = 
		[ 
			{ component = motion } 
			{ component = Suspend NeverSuspend } 
			{ component = skeleton SkeletonName = ( le_rail_terrain [ le_rail_cur_terrain ] . skeleton ) } 
			{ component = model } 
			{ component = Animation AnimName = animload_THPS5_human } 
			{ component = collision } 
			{ component = avoid } 
			{ component = pedlogic } 
			{ component = skaterproximity } 
			{ component = shadow ShadowType = simple } 
		] 
		Params = { name = ksk_ped_test } 
	} 
	ksk_ped_test : Obj_InitModelFromProfile { 
		struct = ( le_rail_terrain [ le_rail_cur_terrain ] . profile ) 
		use_asset_manager = 1 
	texDictOffset = 0 } 
	ksk_ped_test : Obj_SetPosition position = <Pos> 
	ksk_ped_test : RotateDisplay StartAngle = <Angle> EndAngle = <Angle> y HoldOnLastAngle 
	ksk_ped_test : Obj_SpawnScript ( le_ped_logic [ le_ped_cur_mode ] . ai_script ) 
ENDSCRIPT

SCRIPT TestLevel_Skater_Spectator 
	BEGIN 
		IF ( ( LevelIs Load_Sk5Ed ) | ( LevelIs Load_Sk5Ed_gameplay ) ) 
			RANDOM(1, 1) 
				RANDOMCASE Obj_PlayAnim Anim = Cheer1 
				RANDOMCASE Obj_PlayAnim Anim = NewBrakeIdle 
			RANDOMEND 
		ELSE 
			RANDOM(1, 1, 1) 
				RANDOMCASE Obj_PlayAnim Anim = Ped_M_Cheering 
				RANDOMCASE Obj_PlayAnim Anim = Ped_M_ThumbUp 
				RANDOMCASE Obj_PlayAnim Anim = Ped_M_Clap 
			RANDOMEND 
		ENDIF 
		Obj_WaitAnimFinished 
		Obj_LookAtObject type = skater time = 0.30000001192 
	REPEAT 
ENDSCRIPT

SCRIPT TestLevel_Skater_Spectator2 
	BEGIN 
		Obj_PlayAnim Anim = Ped_F_Idle1 
		Obj_WaitAnimFinished 
		Obj_PlayAnim Anim = Ped_F_Idle2 
		Obj_WaitAnimFinished 
		Obj_PlayAnim Anim = Ped_F_Wave 
		Obj_WaitAnimFinished 
		Obj_LookAtObject type = skater time = 0.30000001192 
	REPEAT 
ENDSCRIPT

SCRIPT LevelEditor_Rail_X 
	LevelEditor_Rail_PlaceRail 
	ControllerDebounce X time = 0.89999997616 clear = 1 
ENDSCRIPT

SCRIPT LevelEditor_Rail_Square 
	increment = ( le_rail_cur_terrain + 1 ) 
	LevelEditor_Rail_SetTerrain index = <increment> 
	IF ( LAUNCHER_SETTING_OBSHACK = 1 ) 
		ControllerDebounce Black time = 0.20000000298 clear = 1 
	ELSE 
		ControllerDebounce Square time = 0.20000000298 clear = 1 
	ENDIF 
ENDSCRIPT

SCRIPT LevelEditor_Rail_Circle 
	increment = ( le_ped_cur_mode + 1 ) 
	LevelEditor_Rail_SwapMode index = <increment> 
	ControllerDebounce Circle time = 0.10000000149 clear = 1 
ENDSCRIPT


