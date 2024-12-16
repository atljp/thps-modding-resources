SCRIPT CreateGoalEditor 
	CreateCompositeObject { 
		Components = 
		[ 
			{ component = camera } 
			{ component = input controller = 0 } 
			{ component = editorcamera max_radius = 2000 } 
			{ component = goaleditor } 
		] 
		Params = { Name = goaleditor permanent } 
	} 
	goaleditor : Hide 
	goaleditor : Suspend 
ENDSCRIPT

SCRIPT InitialiseCreatedGoals 
	goaleditor : GetMaxGoalsPerLevel 
	i = 0 
	BEGIN 
		FormatText ChecksumName = goal_id "CreatedGoal%d" d = <i> 
		IF GoalManager_GoalExists Name = <goal_id> 
			GoalManager_RemoveGoal Name = <goal_id> 
		ENDIF 
		i = ( <i> + 1 ) 
	REPEAT <max_goals> 
	GetCurrentLevel 
	IF ChecksumEquals a = <level> b = Load_Sk5Ed_gameplay 
		level = Load_Sk5Ed 
	ENDIF 
	goaleditor : GetEditedGoalsInfo level = <level> 
	IF gotparam EditedGoalsInfo 
		GetArraySize <EditedGoalsInfo> 
		IF ( <array_size> = 0 ) 
			RETURN 
		ENDIF 
		i = 0 
		BEGIN 
			safe_goal = 1 
			IF ( ( <EditedGoalsInfo> [ <i> ] . goal_type ) = gap ) 
				IF NOT StructureContains structure = ( <EditedGoalsInfo> [ <i> ] ) gaps 
					safe_goal = 0 
				ENDIF 
			ENDIF 
			IF ( <safe_goal> = 1 ) 
				goal_id = ( <EditedGoalsInfo> [ <i> ] . goal_id ) 
				pro_name = ( <EditedGoalsInfo> [ <i> ] . pro_name ) 
				goaleditor : AddEditedGoalToGoalManager goal_id = <goal_id> 
				goaleditor : WriteEditedGoalNodePositions goal_id = <goal_id> 
			ENDIF 
			i = ( <i> + 1 ) 
		REPEAT <array_size> 
		IF NOT gotparam DoNotCreateGoalPeds 
			GoalManager_InitializeAllGoals 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT ChooseRandomCreatedGoalPedModel 
	Obj_InitModelFromProfile { struct = random_male_profile 
		use_asset_manager = 1 
		texDictOffset = 0 
	} 
ENDSCRIPT

SCRIPT goal_editor_destroy_cursor 
	IF ObjectExists id = GoalEditorCursor 
		goal_editor_delete_marker_object Name = GoalEditorCursor 
		IF IsNGC 
			FinishRendering 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT goal_editor_create_checkpoint_marker pos = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) angle = 0 
	CreateCompositeObject { 
		Components = 
		[ 
			{ component = motion } 
			{ component = model model = <model> } 
		] 
		Params = { Name = <Name> } 
	} 
	<Name> : Obj_SetPosition Position = <pos> 
	<Name> : Obj_SetOrientation x = 0 y = <angle> z = 0 
	IF NOT gotparam no_hide 
		<Name> : Hide 
	ENDIF 
	goal_race_create_cones Name = <Name> 
ENDSCRIPT

SCRIPT goal_editor_create_cursor 
	goal_editor_destroy_cursor 
	SWITCH <Type> 
		CASE Ped 
			CreateCompositeObject { 
				Components = 
				[ 
					{ component = motion } 
					{ component = Suspend NeverSuspend } 
					{ component = skeleton SkeletonName = THPS6_human } 
					{ component = model } 
					{ component = animBlender SkeletonName = THPS6_human } 
				] 
				Params = { Name = GoalEditorCursor } 
			} 
			IF ( ( LevelIs Load_Sk5Ed ) | ( LevelIs Load_Sk5Ed_gameplay ) ) 
				GoalEditorCursor : ChooseRandomCreatedGoalPedModel 
			ELSE 
				GoalEditorCursor : Obj_InitModelFromProfile { 
					struct = random_male_profile 
					use_asset_manager = 1 
				texDictOffset = 0 } 
			ENDIF 
			GoalEditorCursor : Obj_SpawnScript cursor_ped_script 
		CASE Checkpoint 
			goal_editor_create_checkpoint_marker <...> Name = GoalEditorCursor no_hide 
		DEFAULT 
			CreateCompositeObject { 
				Components = 
				[ 
					{ component = motion } 
					{ component = model model = <model> } 
				] 
				Params = { Name = GoalEditorCursor } 
			} 
	ENDSWITCH 
ENDSCRIPT

SCRIPT goal_editor_update_cursor_position 
	IF ObjectExists id = GoalEditorCursor 
		GoalEditorCursor : Obj_SetPosition Position = <pos> 
		angle = ( <angle> * 180 / 3.14159274101 ) 
		GoalEditorCursor : Obj_SetOrientation y = <angle> 
	ENDIF 
ENDSCRIPT

SCRIPT cursor_ped_script 
	BEGIN 
		IF ( ( LevelIs Load_Sk5Ed ) | ( LevelIs Load_Sk5Ed_gameplay ) ) 
			RANDOM(1, 10) 
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
	REPEAT 
ENDSCRIPT

SCRIPT delete_goal_editor_marker_objects 
	i = 0 
	BEGIN 
		FormatText ChecksumName = object "GoalEditorMarkerObject%d" d = <i> 
		goal_editor_delete_marker_object Name = <object> 
		i = ( <i> + 1 ) 
	REPEAT 12 
ENDSCRIPT

SCRIPT goal_editor_delete_marker_object 
	IF ObjectExists id = <Name> 
		<Name> : Die 
	ENDIF 
	goal_race_kill_cones Name = <Name> 
ENDSCRIPT

SCRIPT goal_editor_create_marker_object 
	goal_editor_delete_marker_object Name = <Name> 
	SWITCH <Type> 
		CASE Letter 
			CreateCompositeObject { 
				Components = 
				[ 
					{ component = motion } 
					{ component = model model = <model> } 
				] 
				Params = { Name = <Name> } 
			} 
			<Name> : Obj_SetPosition Position = <pos> 
			<Name> : Obj_Hover Amp = 6 Freq = 2 
			<Name> : Obj_RotY speed = 200 
		CASE Ped 
			CreateCompositeObject { 
				Components = 
				[ 
					{ component = motion } 
					{ component = Suspend NeverSuspend } 
					{ component = skeleton SkeletonName = THPS6_human } 
					{ component = model } 
					{ component = animBlender SkeletonName = THPS6_human } 
				] 
				Params = { Name = <Name> } 
			} 
			IF ( ( LevelIs Load_Sk5Ed ) | ( LevelIs Load_Sk5Ed_gameplay ) ) 
				<Name> : ChooseRandomCreatedGoalPedModel 
			ELSE 
				<Name> : Obj_InitModelFromProfile { 
					struct = random_male_profile 
					use_asset_manager = 1 
				texDictOffset = 0 } 
			ENDIF 
			<Name> : Obj_SetPosition Position = <pos> 
			<Name> : Obj_SetOrientation x = 0 y = <angle> z = 0 
			<Name> : Obj_SpawnScript cursor_ped_script 
		CASE Checkpoint 
			goal_editor_create_checkpoint_marker <...> 
		DEFAULT 
			CreateCompositeObject { 
				Components = 
				[ 
					{ component = motion } 
					{ component = model model = <model> } 
				] 
				Params = { Name = <Name> } 
			} 
			<Name> : Obj_SetPosition Position = <pos> 
			<Name> : Obj_SetOrientation x = 0 y = <angle> z = 0 
	ENDSWITCH 
ENDSCRIPT

SCRIPT goal_editor_refresh_goal_object_position 
	IF ObjectExists id = <Name> 
		<Name> : Obj_SetPosition Position = <pos> 
	ENDIF 
ENDSCRIPT

SCRIPT goal_editor_play_placement_success_sound 
	generic_menu_pad_choose_sound 
ENDSCRIPT

SCRIPT goal_editor_play_placement_fail_sound 
	generic_menu_buzzer_sound 
ENDSCRIPT

SCRIPT goal_editor_play_backup_success_sound 
	generic_menu_pad_back_sound 
ENDSCRIPT

SCRIPT goal_editor_play_backup_fail_sound 
	generic_menu_buzzer_sound 
ENDSCRIPT

EditorCam_TurnSpeed = 0.03999999911 
EditorCam_TiltSpeed = 0.02999999933 
EditorCam_TiltMin = 0.50000000000 
EditorCam_TiltMax = 1.57070004940 
EditorCam_InOutSpeed = 0.02999999933 
EditorCam_MoveSpeedMin = 5 
EditorCam_MoveSpeedMax = 25 
EditorCam_UpDownSpeedMin = 1 
EditorCam_UpDownSpeedMax = 16 
EditorCam_MaxHeight = 1000 
EditorCam_MaxY = 2500 
EditorCam_CursorCollisionFirstUpOffset = 100 
EditorCam_CursorCollisionDownOffset = -10000 
EditorCam_YCatchUpFactor = 0.05000000075 
EditedGoal_ExtraParams_Combo = 
{ 
	goal_type = "CreatedCombo" 
	pro = "Kenzo" 
	no_stream 
	full_name = "Created Goal" 
	goal_description = "Get the C-O-M-B-O letters in one combo" 
} 
EditedGoal_ExtraParams_Skate = 
{ 
	goal_type = "CreatedSkate" 
	pro = "Kenzo" 
	no_stream 
	full_name = "Created Goal" 
	goal_description = "Collect the S-K-A-T-E letters" 
} 
EditedGoal_ExtraParams_HighScore = 
{ 
	goal_text = "High Score" 
	goal_type = "CreatedHighScore" 
	pro = "Kenzo" 
	no_stream 
	full_name = "Created Goal" 
	goal_description = "Get a high score" 
} 
edited_high_score_goal_text = "Get a High Score: %d Points" 
EditedGoal_ExtraParams_HighCombo = 
{ 
	goal_text = "High Combo" 
	goal_type = "CreatedHighCombo" 
	pro = "Kenzo" 
	no_stream 
	full_name = "Created Goal" 
	goal_description = "Get a high combo" 
} 
edited_high_combo_goal_text = "Get a High Combo: %d Points" 
EditedGoal_ExtraParams_SkateTris = 
{ 
	goal_text = "Skate-Tricks" 
	goal_type = "CreatedSkate-Tricks" 
	pro = "Kenzo" 
	no_stream 
	full_name = "Created Goal" 
	goal_description = "Nail the tricks as they come up." 
	view_goals_text = "Skate-Tricks" 
} 
EditedGoal_ExtraParams_ComboSkateTris = 
{ 
	goal_text = "Combo Skate-Tricks" 
	goal_type = "CreatedComboSkate-Tricks" 
	pro = "Kenzo" 
	no_stream 
	full_name = "Created Goal" 
	goal_description = "Nail the combos as they come up." 
	view_goals_text = "Combo Skate-Tricks" 
} 
EditedGoal_ExtraParams_TrickTris = 
{ 
	goal_text = "TrickTris" 
	goal_type = "CreatedComboTrickTris" 
	pro = "Kenzo" 
	no_stream 
	full_name = "Created Goal" 
	goal_description = "Nail the tricks as they come up." 
	view_goals_text = "Tricktris" 
} 
EditedGoal_ExtraParams_Gap = 
{ 
	goal_text = "Gaps goal" 
	goal_type = "CreatedGap" 
	pro = "Kenzo" 
	no_stream 
	full_name = "Created Goal" 
	goal_description = "See if you can get this gap." 
	goal_flags = [ got_1 ] 
} 
EditedGoal_ExtraParams_Race = 
{ 
	goal_text = "Race goal" 
	goal_type = "CreatedRace" 
	pro = "Kenzo" 
	no_stream 
	full_name = "Created Goal" 
	goal_description = "See if you can get through the race." 
	goal_flags = [ got_1 ] 
} 
EditedGoal_ExtraParams_TrickBeat = 
{ 
	goal_text = "Trick to the beat goal" 
	goal_type = "CreatedTrickBeat" 
	pro = "Kenzo" 
	no_stream 
	full_name = "Created Goal" 
	goal_description = "Trick to the Beat!" 
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
SCRIPT goal_editor_get_beat_pattern 
	beat_pattern = [ 
		{ sounds = [ { BailBodyPunch02_11 vol = ( 100 + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( 100 + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) } ] 
		} 
		{ } 
		{ sounds = [ { BailBoard02 vol = ( 100 + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( 200 + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) } 
				{ DE_PauseFlyIn vol = ( 75 + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( 150 + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) } 
			] 
		} 
		{ } 
		{ pulse 
			sounds = [ { BailBodyFall01 vol = ( 100 + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( 200 + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) } 
				{ BailBodyFall04 vol = ( 100 + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( 140 + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) } 
			] 
		} 
		{ } 
		{ sounds = [ { BailBoard02 vol = ( 100 + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( 200 + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) } ] 
		} 
		{ 
		} 
		{ 
		} 
		{ } 
		{ sounds = [ { BailBoard02 vol = ( 100 + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( 200 + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) } 
			] 
		} 
		{ } 
		{ pulse 
			sounds = [ { BailBodyFall01 vol = ( 100 + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( 200 + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) } 
				{ BailBodyFall04 vol = ( 100 + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( 140 + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) } 
			] 
		} 
		{ } 
		{ sounds = [ { BailBoard02 vol = ( 100 + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( 200 + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) } 
				{ BailBodyPunch02_11 vol = ( 100 + RANDOM_RANGE PAIR(0.10000000149, 4.00000000000) ) pitch = ( 100 + RANDOM_RANGE PAIR(0.10000000149, 3.00000000000) ) } 
			] 
		} 
		{ } 
	] 
	RETURN beat_pattern = <beat_pattern> 
ENDSCRIPT

cag_key_combos = 
[ 
	{ 
		text = "Basic Flip Tricks" 
		key_combos = 
		[ 
			Air_SquareU 
			Air_SquareD 
			Air_SquareL 
			Air_SquareR 
		] 
	} 
	{ 
		text = "Diagonal Flip Tricks" 
		key_combos = 
		[ 
			Air_SquareUL 
			Air_SquareUR 
			Air_SquareDL 
			Air_SquareDR 
		] 
	} 
	{ 
		text = "Basic Grab Tricks" 
		key_combos = 
		[ 
			Air_CircleU 
			Air_CircleD 
			Air_CircleL 
			Air_CircleR 
		] 
	} 
	{ 
		text = "Diagonal Grab Tricks" 
		key_combos = 
		[ 
			Air_CircleUL 
			Air_CircleUR 
			Air_CircleDL 
			Air_CircleDR 
		] 
	} 
	{ 
		text = "Double Tap Basic Flips" 
		key_combos = 
		[ 
			{ key_combo = Air_SquareD num_taps = 2 } 
			{ key_combo = Air_SquareU num_taps = 2 } 
			{ key_combo = Air_SquareL num_taps = 2 } 
			{ key_combo = Air_SquareR num_taps = 2 } 
		] 
	} 
	{ 
		text = "Double Tap Diagonal Flips" 
		key_combos = 
		[ 
			{ key_combo = Air_SquareUL num_taps = 2 } 
			{ key_combo = Air_SquareUR num_taps = 2 } 
			{ key_combo = Air_SquareDL num_taps = 2 } 
			{ key_combo = Air_SquareDR num_taps = 2 } 
		] 
	} 
	{ 
		text = "Double Tap Basic Grabs" 
		key_combos = 
		[ 
			{ key_combo = Air_CircleD num_taps = 2 } 
			{ key_combo = Air_CircleU num_taps = 2 } 
			{ key_combo = Air_CircleL num_taps = 2 } 
			{ key_combo = Air_CircleR num_taps = 2 } 
		] 
	} 
	{ 
		text = "Double Tap Diagonal Grabs" 
		key_combos = 
		[ 
			{ key_combo = Air_CircleUL num_taps = 2 } 
			{ key_combo = Air_CircleUR num_taps = 2 } 
			{ key_combo = Air_CircleDL num_taps = 2 } 
			{ key_combo = Air_CircleDR num_taps = 2 } 
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
EditorCam_CameraCatchUpFactor = 0.30000001192 
GoalEditor_ObjectHeight = 27 
GoalEditor_DefaultMinDistBetweenPositions = 50 
GoalEditor_MinDistBetweenObjectsandSkater = 100 
EditedGoal_Pro_Node = 
{ 
	pos = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
	Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
	Class = Pedestrian 
	Type = Ped_From_Profile 
	SkeletonName = THPS6_human 
	DefaultAnimName = WStandIdle1 
	PedAI_Type = Stand 
	AnimName = animload_THPS6_human 
	profile = random_male_profile 
	SuspendDistance = 3000 
	lod_dist1 = 200 
	lod_dist2 = 400 
} 
EditedGoal_Restart_Node = 
{ 
	pos = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
	Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
	Class = Restart 
	Type = Player1 
	CreatedAtStart 
	RestartName = "Edited goal: Restart" 
	restart_types = [ Player1 ] 
} 
EditedGoal_Object_Node = 
{ 
	pos = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
	Angles = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
	Class = GameObject 
	SuspendDistance = 0 
	lod_dist1 = 400 
	lod_dist2 = 401 
} 
EditedGoal_success_cam_anims = 
[ 
	{ 
		virtual_cam 
		targetOffset = VECTOR(1.20000004768, 62.40000152588, 0.00000000000) positionOffset = VECTOR(-2.40000009537, 0.00000000000, 26.39999961853) 
		frames = 120 
		skippable = 1 
		play_hold 
	} 
] 
SCRIPT CountNumCreatedGoalsWon 
	goaleditor : GetEditedGoalsInfo level = <level> 
	num_goals = 0 
	num_goals_won = 0 
	IF gotparam EditedGoalsInfo 
		GetArraySize <EditedGoalsInfo> 
		IF gotparam array_size 
			IF ( <array_size> > 0 ) 
				BEGIN 
					IF ( <EditedGoalsInfo> [ <num_goals> ] . won_goal ) 
						num_goals_won = ( <num_goals_won> + 1 ) 
					ENDIF 
					num_goals = ( <num_goals> + 1 ) 
				REPEAT <array_size> 
			ENDIF 
		ENDIF 
	ENDIF 
	RETURN num_goals = <num_goals> num_goals_won = <num_goals_won> 
ENDSCRIPT

SCRIPT goal_editor_finished_placing_objects 
	Change goal_editor_placement_mode = 0 
	goaleditor : Hide 
	goaleditor : Suspend 
	create_edit_goal_menu 
ENDSCRIPT


