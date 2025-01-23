
menu3d_disabled = 0 
menu3d_current_level_structure_name = none 
menu3d_subicon = spaceport 
SCRIPT menu3d_load_assets 
	IF ( menu3d_disabled = 1 ) 
		RETURN 
	ENDIF 
	IF NOT GotParam structure_name 
		script_assert "no level structure_name specified" 
		RETURN 
	ENDIF 
	change menu3d_current_level_structure_name = <structure_name> 
	PushMemProfile "Menu 3D" 
	IF StructureContains structure = ( menu3d_current_level_structure_name ) menu3d_sprites 
		load_array_of_textures textures = ( ( menu3d_current_level_structure_name ) . menu3d_sprites ) no_pre_file 
	ENDIF 
	IF StructureContains structure = ( menu3d_current_level_structure_name ) menu3d_name 
		PreloadModel name = ( ( menu3d_current_level_structure_name ) . menu3d_name ) 
	ENDIF 
	PopMemProfile 
ENDSCRIPT

SCRIPT menu3d_unload_assets 
	GetLevelStructureName 
	IF StructureContains structure = ( <level_structure_name> ) menu3d_sprites 
		load_array_of_textures textures = ( <level_structure_name> . menu3d_sprites ) unload dont_assert 
	ENDIF 
ENDSCRIPT

SCRIPT menu3d_show parent = root_window 
	KillSpawnedScript name = menu3d_animate_out 
	menu3d_hide 
	SetScreenElementLock id = <parent> off 
	CreateScreenElement { 
		type = ContainerElement 
		parent = <parent> 
		id = menu3d_anchor 
	} 
	GoalManager_GetLevelPrefix 
	FormatText ChecksumName = sign_element_script "%l_2d_sign_element_create" l = <level_prefix> 
	IF ScriptExists <sign_element_script> 
		<sign_element_script> parent = menu3d_anchor 
	ENDIF 
	menu3d_show_sign parent = menu3d_anchor 
ENDSCRIPT

SCRIPT menu3d_show1 parent = root_window 
	KillSpawnedScript name = menu3d_animate_out 
	menu3d_hide 
	SetScreenElementLock id = <parent> off 
	CreateScreenElement { 
		type = ContainerElement 
		parent = <parent> 
		id = menu3d_anchor 
	} 
	GoalManager_GetLevelPrefix 
	FormatText ChecksumName = sign_element_script "%l_2d_sign_element_create" l = <level_prefix> 
	IF ScriptExists <sign_element_script> 
		<sign_element_script> parent = menu3d_anchor 
	ENDIF 
	menu3d_show_sign1 parent = menu3d_anchor 
ENDSCRIPT

SCRIPT menu3d_show2 parent = root_window 
	KillSpawnedScript name = menu3d_animate_out 
	menu3d_hide 
	SetScreenElementLock id = <parent> off 
	CreateScreenElement { 
		type = ContainerElement 
		parent = <parent> 
		id = menu3d_anchor 
	} 
	GoalManager_GetLevelPrefix 
	FormatText ChecksumName = sign_element_script "%l_2d_sign_element_create" l = <level_prefix> 
	IF ScriptExists <sign_element_script> 
		<sign_element_script> parent = menu3d_anchor 
	ENDIF 
	menu3d_show_sign2 parent = menu3d_anchor 
ENDSCRIPT

SCRIPT menu3d_show3 parent = root_window 
	KillSpawnedScript name = menu3d_animate_out 
	menu3d_hide 
	SetScreenElementLock id = <parent> off 
	CreateScreenElement { 
		type = ContainerElement 
		parent = <parent> 
		id = menu3d_anchor 
	} 
	GoalManager_GetLevelPrefix 
	FormatText ChecksumName = sign_element_script "%l_2d_sign_element_create" l = <level_prefix> 
	IF ScriptExists <sign_element_script> 
		<sign_element_script> parent = menu3d_anchor 
	ENDIF 
	menu3d_show_sign3 parent = menu3d_anchor 
ENDSCRIPT

SCRIPT menu3d_show4 parent = root_window 
	KillSpawnedScript name = menu3d_animate_out 
	menu3d_hide 
	SetScreenElementLock id = <parent> off 
	CreateScreenElement { 
		type = ContainerElement 
		parent = <parent> 
		id = menu3d_anchor 
	} 
	GoalManager_GetLevelPrefix 
	FormatText ChecksumName = sign_element_script "%l_2d_sign_element_create" l = <level_prefix> 
	IF ScriptExists <sign_element_script> 
		<sign_element_script> parent = menu3d_anchor 
	ENDIF 
	menu3d_show_sign4 parent = menu3d_anchor 
ENDSCRIPT

SCRIPT menu3d_show5 parent = root_window 
	KillSpawnedScript name = menu3d_animate_out 
	menu3d_hide 
	SetScreenElementLock id = <parent> off 
	CreateScreenElement { 
		type = ContainerElement 
		parent = <parent> 
		id = menu3d_anchor 
	} 
	GoalManager_GetLevelPrefix 
	FormatText ChecksumName = sign_element_script "%l_2d_sign_element_create" l = <level_prefix> 
	IF ScriptExists <sign_element_script> 
		<sign_element_script> parent = menu3d_anchor 
	ENDIF 
	menu3d_show_sign5 parent = menu3d_anchor 
ENDSCRIPT

SCRIPT menu3d_show6 parent = root_window 
	KillSpawnedScript name = menu3d_animate_out 
	menu3d_hide 
	SetScreenElementLock id = <parent> off 
	CreateScreenElement { 
		type = ContainerElement 
		parent = <parent> 
		id = menu3d_anchor 
	} 
	GoalManager_GetLevelPrefix 
	FormatText ChecksumName = sign_element_script "%l_2d_sign_element_create" l = <level_prefix> 
	IF ScriptExists <sign_element_script> 
		<sign_element_script> parent = menu3d_anchor 
	ENDIF 
	menu3d_show_sign6 parent = menu3d_anchor 
ENDSCRIPT

SCRIPT menu3d_show7 parent = root_window 
	KillSpawnedScript name = menu3d_animate_out 
	menu3d_hide 
	SetScreenElementLock id = <parent> off 
	CreateScreenElement { 
		type = ContainerElement 
		parent = <parent> 
		id = menu3d_anchor 
	} 
	GoalManager_GetLevelPrefix 
	FormatText ChecksumName = sign_element_script "%l_2d_sign_element_create" l = <level_prefix> 
	IF ScriptExists <sign_element_script> 
		<sign_element_script> parent = menu3d_anchor 
	ENDIF 
	menu3d_show_sign7 parent = menu3d_anchor 
ENDSCRIPT

SCRIPT menu3d_show8 parent = root_window 
	KillSpawnedScript name = menu3d_animate_out 
	menu3d_hide 
	SetScreenElementLock id = <parent> off 
	CreateScreenElement { 
		type = ContainerElement 
		parent = <parent> 
		id = menu3d_anchor 
	} 
	GoalManager_GetLevelPrefix 
	FormatText ChecksumName = sign_element_script "%l_2d_sign_element_create" l = <level_prefix> 
	IF ScriptExists <sign_element_script> 
		<sign_element_script> parent = menu3d_anchor 
	ENDIF 
	menu3d_show_sign8 parent = menu3d_anchor 
ENDSCRIPT

SCRIPT menu3d_show9 parent = root_window 
	KillSpawnedScript name = menu3d_animate_out 
	menu3d_hide 
	SetScreenElementLock id = <parent> off 
	CreateScreenElement { 
		type = ContainerElement 
		parent = <parent> 
		id = menu3d_anchor 
	} 
	GoalManager_GetLevelPrefix 
	FormatText ChecksumName = sign_element_script "%l_2d_sign_element_create" l = <level_prefix> 
	IF ScriptExists <sign_element_script> 
		<sign_element_script> parent = menu3d_anchor 
	ENDIF 
	menu3d_show_sign9 parent = menu3d_anchor 
ENDSCRIPT

SCRIPT menu3d_show10 parent = root_window 
	KillSpawnedScript name = menu3d_animate_out 
	menu3d_hide 
	SetScreenElementLock id = <parent> off 
	CreateScreenElement { 
		type = ContainerElement 
		parent = <parent> 
		id = menu3d_anchor 
	} 
	GoalManager_GetLevelPrefix 
	FormatText ChecksumName = sign_element_script "%l_2d_sign_element_create" l = <level_prefix> 
	IF ScriptExists <sign_element_script> 
		<sign_element_script> parent = menu3d_anchor 
	ENDIF 
	menu3d_show_sign10 parent = menu3d_anchor 
ENDSCRIPT

SCRIPT menu3d_show11 parent = root_window 
	KillSpawnedScript name = menu3d_animate_out 
	menu3d_hide 
	SetScreenElementLock id = <parent> off 
	CreateScreenElement { 
		type = ContainerElement 
		parent = <parent> 
		id = menu3d_anchor 
	} 
	GoalManager_GetLevelPrefix 
	FormatText ChecksumName = sign_element_script "%l_2d_sign_element_create" l = <level_prefix> 
	IF ScriptExists <sign_element_script> 
		<sign_element_script> parent = menu3d_anchor 
	ENDIF 
	menu3d_show_sign11 parent = menu3d_anchor 
ENDSCRIPT

SCRIPT menu3d_show12 parent = root_window 
	KillSpawnedScript name = menu3d_animate_out 
	menu3d_hide 
	SetScreenElementLock id = <parent> off 
	CreateScreenElement { 
		type = ContainerElement 
		parent = <parent> 
		id = menu3d_anchor 
	} 
	GoalManager_GetLevelPrefix 
	FormatText ChecksumName = sign_element_script "%l_2d_sign_element_create" l = <level_prefix> 
	IF ScriptExists <sign_element_script> 
		<sign_element_script> parent = menu3d_anchor 
	ENDIF 
	menu3d_show_sign12 parent = menu3d_anchor 
ENDSCRIPT

SCRIPT menu3d_animate_in 
	IF NOT ScreenElementExists id = menu3d_anchor 
		RETURN 
	ENDIF 
	GetScreenElementPosition id = menu3d_anchor 
	DoScreenElementMorph id = menu3d_anchor pos = ( <ScreenElementPos> + PAIR(-640.00000000000, 0.00000000000) ) time = 0 
	DoScreenElementMorph id = menu3d_anchor pos = <ScreenElementPos> time = 0.15000000596 
ENDSCRIPT

SCRIPT menu3d_animate_out 
	IF NOT ScreenElementExists id = menu3d_anchor 
		RETURN 
	ENDIF 
	GetScreenElementPosition id = menu3d_anchor 
	DoScreenElementMorph id = menu3d_anchor pos = ( <ScreenElementPos> + PAIR(-640.00000000000, 0.00000000000) ) time = 0.15000000596 
	IF GotParam die 
		wait 0.20000000298 seconds 
		menu3d_hide 
	ENDIF 
ENDSCRIPT

SCRIPT menu3d_hide 
	IF ScreenElementExists id = menu3d_anchor 
		DestroyScreenElement id = menu3d_anchor 
	ENDIF 
ENDSCRIPT

SCRIPT menu3d_zoom_options 
ENDSCRIPT

SCRIPT menu3d_morph 
	GetTags 
	IF ObjectExists id = <id> 
		IF GotParam pos 
			IF GotParam pos_time 
				<time> = <pos_time> 
			ELSE 
				<time> = 0 
			ENDIF 
			DoScreenElementMorph id = <id> time = <time> pos = <pos> 
		ENDIF 
		IF GotParam scale 
			IF GotParam scale_time 
				<time> = <scale_time> 
			ELSE 
				<time> = 0 
			ENDIF 
			DoScreenElementMorph id = <id> time = <time> scale = <scale> 
		ENDIF 
		GetScreenElementProps id = <id> 
		IF GotParam rot_x 
			<rot_x> = ( ( <rot_x> * 3.14000010490 ) / 180.00000000000 ) 
			IF GotParam rot_x_time 
				<rel_rot_x> = ( <rot_x> - ( <anglex> + 1.57000005245 ) ) 
				<rot_x_frames> = ( <rot_x_time> * 60 ) 
				<rot_x_diff> = ( <rel_rot_x> / <rot_x_frames> ) 
			ELSE 
				<rot_x_frames> = 1 
				<rot_x_diff> = <rot_x> 
			ENDIF 
			<cur_x_frame> = 0 
			<next_rot_x> = ( <anglex> + <rot_x_diff> ) 
			<should_rot_x> = 1 
		ELSE 
			<should_rot_x> = 0 
		ENDIF 
		IF GotParam rot_y 
			<rot_y> = ( ( <rot_y> * 3.14000010490 ) / 180.00000000000 ) 
			IF GotParam rot_y_time 
				<rel_rot_y> = ( <rot_y> - <angley> ) 
				<rot_y_frames> = ( <rot_y_time> * 60 ) 
				<rot_y_diff> = ( <rel_rot_y> / <rot_y_frames> ) 
			ELSE 
				<rot_y_frames> = 1 
				<rot_y_diff> = <rot_y> 
			ENDIF 
			<cur_y_frame> = 0 
			<next_rot_y> = ( <angley> + <rot_y_diff> ) 
			<should_rot_y> = 1 
		ELSE 
			<should_rot_y> = 0 
		ENDIF 
		IF GotParam rot_z 
			<rot_z> = ( ( <rot_z> * -3.14000010490 ) / 180.00000000000 ) 
			IF GotParam rot_z_time 
				<rel_rot_z> = ( <rot_z> - <anglez> ) 
				<rot_z_frames> = ( <rot_z_time> * 60 ) 
				<rot_z_diff> = ( <rel_rot_z> / <rot_z_frames> ) 
			ELSE 
				<rot_z_frames> = 1 
				<rot_z_diff> = <rot_z> 
			ENDIF 
			<cur_z_frame> = 0 
			<next_rot_z> = ( <anglez> + <rot_z_diff> ) 
			<should_rot_z> = 1 
		ELSE 
			<should_rot_z> = 0 
		ENDIF 
		BEGIN 
			IF NOT ObjectExists id = <id> 
				RETURN 
			ENDIF 
			IF ( <should_rot_x> | <should_rot_y> | <should_rot_z> ) 
				IF ( <should_rot_x> ) 
					IF ( ( <cur_x_frame> < <rot_x_frames> ) | ( GotParam rot_x_loop ) ) 
						SetScreenElementProps id = <id> anglex = <next_rot_x> 
						<next_rot_x> = ( <next_rot_x> + <rot_x_diff> ) 
						<cur_x_frame> = ( <cur_x_frame> + 1 ) 
					ELSE 
						<should_rot_x> = 0 
					ENDIF 
				ENDIF 
				IF ( <should_rot_y> ) 
					IF ( ( <cur_y_frame> < <rot_y_frames> ) | ( GotParam rot_y_loop ) ) 
						SetScreenElementProps id = <id> angley = <next_rot_y> 
						<next_rot_y> = ( <next_rot_y> + <rot_y_diff> ) 
						<cur_y_frame> = ( <cur_y_frame> + 1 ) 
					ELSE 
						<should_rot_y> = 0 
					ENDIF 
				ENDIF 
				IF ( <should_rot_z> ) 
					IF ( ( <cur_z_frame> < <rot_z_frames> ) | ( GotParam rot_z_loop ) ) 
						SetScreenElementProps id = <id> anglez = <next_rot_z> 
						<next_rot_z> = ( <next_rot_z> + <rot_z_diff> ) 
						<cur_z_frame> = ( <cur_z_frame> + 1 ) 
					ELSE 
						<should_rot_z> = 0 
					ENDIF 
				ENDIF 
				wait 1 gameframes 
			ELSE 
				RETURN 
			ENDIF 
		REPEAT 
	ENDIF 
ENDSCRIPT

SCRIPT menu3d_show_sign active_viewport = 0 parent = root_window 
	IF NOT ScreenElementExists id = <parent> 
		printf "WARNING: menu3d_show_sign couldn\'t find parent %s" s = <parent> 
		RETURN 
	ENDIF 
	SetScreenElementLock id = <parent> off 
	IF GotParam no_slide 
		pos = PAIR(360.00000000000, 220.00000000000) 
	ELSE 
		pos = PAIR(800.00000000000, 220.00000000000) 
	ENDIF 
	GetPausePosByResolution 
	<menu3d_name> = "Board_default\\Board_default.mdl" 
	CreateScreenElement { 
		parent = <parent> 
		type = Element3d 
		id = menu3d_sign 
		Model = <menu3d_name> 
		pos = <pos> 
		CameraZ = -6 
		scale = 0.11999999732 
		Tilt = 0 
		PivotPoint = VECTOR(0.00000000000, 4.11999988556, 0.00000000000) 
		active_viewport = <active_viewport> 
		AngleOrderXYZ 
		anglex = -1.57000005245 
		angley = 0 
		anglez = 0.40000000596 
		just = [ Right center ] 
	} 
	spawnscript rotate_pause_deck <no_slide> 
ENDSCRIPT

SCRIPT menu3d_show_sign1 active_viewport = 0 parent = root_window 
	IF NOT ScreenElementExists id = <parent> 
		printf "WARNING: menu3d_show_sign couldn\'t find parent %s" s = <parent> 
		RETURN 
	ENDIF 
	SetScreenElementLock id = <parent> off 
	GetPausePosByResolution 
	CreateScreenElement { 
		parent = <parent> 
		type = Element3d 
		id = menu3d_sign1 
		Model = "Mdl_Cone\\Mdl_Cone.mdl" 
		pos = PAIR(150.00000000000, 280.00000000000) 
		CameraZ = -6 
		scale = 0.07999999821 
		Tilt = 0 
		PivotPoint = VECTOR(0.00000000000, 4.11999988556, 0.00000000000) 
		active_viewport = <active_viewport> 
		AngleOrderXYZ 
		anglex = 0.00000000000 
		angley = 90 
		anglez = 0.00000000000 
		just = [ Right center ] 
	} 
	spawnscript rotate_pause_deck1 <no_slide> 
ENDSCRIPT

SCRIPT menu3d_show_sign2 active_viewport = 0 parent = root_window 
	IF NOT ScreenElementExists id = <parent> 
		printf "WARNING: menu3d_show_sign couldn\'t find parent %s" s = <parent> 
		RETURN 
	ENDIF 
	SetScreenElementLock id = <parent> off 
	GetPausePosByResolution 
	CreateScreenElement { 
		parent = <parent> 
		type = Element3d 
		id = menu3d_sign2 
		Model = "veh\\veh_custom\\veh_custom.mdl" 
		SkeletonName = car 
		Class = Vehicle 
		pos = PAIR(150.00000000000, 280.00000000000) 
		CameraZ = -6 
		scale = 0.01999999955 
		PivotPoint = VECTOR(0.00000000000, 4.11999988556, 0.00000000000) 
		active_viewport = <active_viewport> 
		AngleOrderXYZ 
		anglex = -1.57000005245 
		angley = 0 
		anglez = 0.00000000000 
		just = [ Left center ] 
	} 
	spawnscript rotate_pause_deck2 <no_slide> 
ENDSCRIPT

SCRIPT menu3d_show_sign3 active_viewport = 0 parent = root_window 
	IF NOT ScreenElementExists id = <parent> 
		printf "WARNING: menu3d_show_sign couldn\'t find parent %s" s = <parent> 
		RETURN 
	ENDIF 
	SetScreenElementLock id = <parent> off 
	GetPausePosByResolution 
	CreateScreenElement { 
		parent = <parent> 
		type = Element3d 
		id = menu3d_sign3 
		Model = "Veh\\Veh_ATV\\Veh_ATV.mdl" 
		SkeletonName = car 
		Class = Vehicle 
		pos = PAIR(150.00000000000, 280.00000000000) 
		CameraZ = -6 
		scale = 0.01999999955 
		PivotPoint = VECTOR(0.00000000000, 4.11999988556, 0.00000000000) 
		active_viewport = <active_viewport> 
		AngleOrderXYZ 
		anglex = -1.57000005245 
		angley = 0 
		anglez = 0.00000000000 
		just = [ Left center ] 
	} 
	spawnscript rotate_pause_deck3 <no_slide> 
ENDSCRIPT

SCRIPT rotate_pause_deck3 
	IF NOT ObjectExists id = menu3d_sign3 
		RETURN 
	ENDIF 
	rot_angle = 0 
	DoScreenElementMorph time = 0.25000000000 id = menu3d_sign3 pos = PAIR(150.00000000000, 280.00000000000) 
	BEGIN 
		IF NOT ObjectExists id = menu3d_sign3 
			RETURN 
		ENDIF 
		SetScreenElementProps id = menu3d_sign3 angley = <rot_angle> 
		rot_angle = ( <rot_angle> + 0.06250000000 ) 
		wait 1 gameframes 
	REPEAT 
ENDSCRIPT

SCRIPT menu3d_show_sign4 active_viewport = 0 parent = root_window 
	IF NOT ScreenElementExists id = <parent> 
		printf "WARNING: menu3d_show_sign couldn\'t find parent %s" s = <parent> 
		RETURN 
	ENDIF 
	SetScreenElementLock id = <parent> off 
	GetPausePosByResolution 
	CreateScreenElement { 
		parent = <parent> 
		type = Element3d 
		id = menu3d_sign4 
		Model = "Veh\\Veh_Blimp\\Veh_Blimp.mdl" 
		SkeletonName = car 
		Class = Vehicle 
		pos = PAIR(150.00000000000, 280.00000000000) 
		CameraZ = -6 
		scale = 0.01999999955 
		PivotPoint = VECTOR(0.00000000000, 4.11999988556, 0.00000000000) 
		active_viewport = <active_viewport> 
		AngleOrderXYZ 
		anglex = -1.57000005245 
		angley = 0 
		anglez = 0.00000000000 
		just = [ Left center ] 
	} 
	spawnscript rotate_pause_deck4 <no_slide> 
ENDSCRIPT

SCRIPT rotate_pause_deck4 
	IF NOT ObjectExists id = menu3d_sign4 
		RETURN 
	ENDIF 
	rot_angle = 0 
	DoScreenElementMorph time = 0.25000000000 id = menu3d_sign4 pos = PAIR(150.00000000000, 280.00000000000) 
	BEGIN 
		IF NOT ObjectExists id = menu3d_sign4 
			RETURN 
		ENDIF 
		SetScreenElementProps id = menu3d_sign4 angley = <rot_angle> 
		rot_angle = ( <rot_angle> + 0.06250000000 ) 
		wait 1 gameframes 
	REPEAT 
ENDSCRIPT

SCRIPT menu3d_show_sign5 active_viewport = 0 parent = root_window 
	IF NOT ScreenElementExists id = <parent> 
		printf "WARNING: menu3d_show_sign couldn\'t find parent %s" s = <parent> 
		RETURN 
	ENDIF 
	SetScreenElementLock id = <parent> off 
	GetPausePosByResolution 
	CreateScreenElement { 
		parent = <parent> 
		type = Element3d 
		id = menu3d_sign5 
		Model = "veh\\Veh_SDKart_Gardens\\Veh_SDKart_Gardens.mdl" 
		SkeletonName = car 
		Class = Vehicle 
		pos = PAIR(150.00000000000, 280.00000000000) 
		CameraZ = -6 
		scale = 0.01999999955 
		PivotPoint = VECTOR(0.00000000000, 4.11999988556, 0.00000000000) 
		active_viewport = <active_viewport> 
		AngleOrderXYZ 
		anglex = -1.57000005245 
		angley = 0 
		anglez = 0.00000000000 
		just = [ Left center ] 
	} 
	spawnscript rotate_pause_deck5 <no_slide> 
ENDSCRIPT

SCRIPT rotate_pause_deck5 
	IF NOT ObjectExists id = menu3d_sign5 
		RETURN 
	ENDIF 
	rot_angle = 0 
	DoScreenElementMorph time = 0.25000000000 id = menu3d_sign5 pos = PAIR(150.00000000000, 280.00000000000) 
	BEGIN 
		IF NOT ObjectExists id = menu3d_sign5 
			RETURN 
		ENDIF 
		SetScreenElementProps id = menu3d_sign5 angley = <rot_angle> 
		rot_angle = ( <rot_angle> + 0.06250000000 ) 
		wait 1 gameframes 
	REPEAT 
ENDSCRIPT

SCRIPT menu3d_show_sign6 active_viewport = 0 parent = root_window 
	IF NOT ScreenElementExists id = <parent> 
		printf "WARNING: menu3d_show_sign couldn\'t find parent %s" s = <parent> 
		RETURN 
	ENDIF 
	SetScreenElementLock id = <parent> off 
	GetPausePosByResolution 
	CreateScreenElement { 
		parent = <parent> 
		type = Element3d 
		id = menu3d_sign6 
		Model = "veh\\Veh_SDKart_Security\\Veh_SDKart_Security.mdl" 
		SkeletonName = car 
		Class = Vehicle 
		pos = PAIR(150.00000000000, 280.00000000000) 
		CameraZ = -6 
		scale = 0.01999999955 
		PivotPoint = VECTOR(0.00000000000, 4.11999988556, 0.00000000000) 
		active_viewport = <active_viewport> 
		AngleOrderXYZ 
		anglex = -1.57000005245 
		angley = 0 
		anglez = 0.00000000000 
		just = [ Left center ] 
	} 
	spawnscript rotate_pause_deck6 <no_slide> 
ENDSCRIPT

SCRIPT rotate_pause_deck6 
	IF NOT ObjectExists id = menu3d_sign6 
		RETURN 
	ENDIF 
	rot_angle = 0 
	DoScreenElementMorph time = 0.25000000000 id = menu3d_sign6 pos = PAIR(150.00000000000, 280.00000000000) 
	BEGIN 
		IF NOT ObjectExists id = menu3d_sign6 
			RETURN 
		ENDIF 
		SetScreenElementProps id = menu3d_sign6 angley = <rot_angle> 
		rot_angle = ( <rot_angle> + 0.06250000000 ) 
		wait 1 gameframes 
	REPEAT 
ENDSCRIPT

SCRIPT menu3d_show_sign7 active_viewport = 0 parent = root_window 
	IF NOT ScreenElementExists id = <parent> 
		printf "WARNING: menu3d_show_sign couldn\'t find parent %s" s = <parent> 
		RETURN 
	ENDIF 
	SetScreenElementLock id = <parent> off 
	GetPausePosByResolution 
	CreateScreenElement { 
		parent = <parent> 
		type = Element3d 
		id = menu3d_sign7 
		Model = "Veh\\Veh_Chevy_Impala\\Veh_Chevy_Impala.mdl" 
		SkeletonName = car 
		Class = Vehicle 
		pos = PAIR(150.00000000000, 280.00000000000) 
		CameraZ = -6 
		scale = 0.01999999955 
		PivotPoint = VECTOR(0.00000000000, 4.11999988556, 0.00000000000) 
		active_viewport = <active_viewport> 
		AngleOrderXYZ 
		anglex = -1.57000005245 
		angley = 0 
		anglez = 0.00000000000 
		just = [ Left center ] 
	} 
	spawnscript rotate_pause_deck7 <no_slide> 
ENDSCRIPT

SCRIPT rotate_pause_deck7 
	IF NOT ObjectExists id = menu3d_sign7 
		RETURN 
	ENDIF 
	rot_angle = 0 
	DoScreenElementMorph time = 0.25000000000 id = menu3d_sign7 pos = PAIR(150.00000000000, 280.00000000000) 
	BEGIN 
		IF NOT ObjectExists id = menu3d_sign7 
			RETURN 
		ENDIF 
		SetScreenElementProps id = menu3d_sign7 angley = <rot_angle> 
		rot_angle = ( <rot_angle> + 0.06250000000 ) 
		wait 1 gameframes 
	REPEAT 
ENDSCRIPT

SCRIPT menu3d_show_sign8 active_viewport = 0 parent = root_window 
	IF NOT ScreenElementExists id = <parent> 
		printf "WARNING: menu3d_show_sign couldn\'t find parent %s" s = <parent> 
		RETURN 
	ENDIF 
	SetScreenElementLock id = <parent> off 
	GetPausePosByResolution 
	CreateScreenElement { 
		parent = <parent> 
		type = Element3d 
		id = menu3d_sign8 
		Model = "veh\\fl\\veh_policecar_fl\\veh_policecar_fl.mdl" 
		SkeletonName = car 
		Class = Vehicle 
		pos = PAIR(150.00000000000, 280.00000000000) 
		CameraZ = -6 
		scale = 0.01999999955 
		PivotPoint = VECTOR(0.00000000000, 4.11999988556, 0.00000000000) 
		active_viewport = <active_viewport> 
		AngleOrderXYZ 
		anglex = -1.57000005245 
		angley = 0 
		anglez = 0.00000000000 
		just = [ Left center ] 
	} 
	spawnscript rotate_pause_deck8 <no_slide> 
ENDSCRIPT

SCRIPT rotate_pause_deck8 
	IF NOT ObjectExists id = menu3d_sign8 
		RETURN 
	ENDIF 
	rot_angle = 0 
	DoScreenElementMorph time = 0.25000000000 id = menu3d_sign8 pos = PAIR(150.00000000000, 280.00000000000) 
	BEGIN 
		IF NOT ObjectExists id = menu3d_sign8 
			RETURN 
		ENDIF 
		SetScreenElementProps id = menu3d_sign8 angley = <rot_angle> 
		rot_angle = ( <rot_angle> + 0.06250000000 ) 
		wait 1 gameframes 
	REPEAT 
ENDSCRIPT

SCRIPT menu3d_show_sign9 active_viewport = 0 parent = root_window 
	IF NOT ScreenElementExists id = <parent> 
		printf "WARNING: menu3d_show_sign couldn\'t find parent %s" s = <parent> 
		RETURN 
	ENDIF 
	SetScreenElementLock id = <parent> off 
	GetPausePosByResolution 
	CreateScreenElement { 
		parent = <parent> 
		type = Element3d 
		id = menu3d_sign9 
		Model = "veh\\veh_camino\\veh_camino.mdl" 
		SkeletonName = car 
		Class = Vehicle 
		pos = PAIR(150.00000000000, 280.00000000000) 
		CameraZ = -6 
		scale = 0.01999999955 
		PivotPoint = VECTOR(0.00000000000, 4.11999988556, 0.00000000000) 
		active_viewport = <active_viewport> 
		AngleOrderXYZ 
		anglex = -1.57000005245 
		angley = 0 
		anglez = 0.00000000000 
		just = [ Left center ] 
	} 
	spawnscript rotate_pause_deck9 <no_slide> 
ENDSCRIPT

SCRIPT rotate_pause_deck9 
	IF NOT ObjectExists id = menu3d_sign9 
		RETURN 
	ENDIF 
	rot_angle = 0 
	DoScreenElementMorph time = 0.25000000000 id = menu3d_sign9 pos = PAIR(150.00000000000, 280.00000000000) 
	BEGIN 
		IF NOT ObjectExists id = menu3d_sign9 
			RETURN 
		ENDIF 
		SetScreenElementProps id = menu3d_sign9 angley = <rot_angle> 
		rot_angle = ( <rot_angle> + 0.06250000000 ) 
		wait 1 gameframes 
	REPEAT 
ENDSCRIPT

SCRIPT menu3d_show_sign10 active_viewport = 0 parent = root_window 
	IF NOT ScreenElementExists id = <parent> 
		printf "WARNING: menu3d_show_sign couldn\'t find parent %s" s = <parent> 
		RETURN 
	ENDIF 
	SetScreenElementLock id = <parent> off 
	GetPausePosByResolution 
	CreateScreenElement { 
		parent = <parent> 
		type = Element3d 
		id = menu3d_sign10 
		Model = "veh\\veh_limo\\veh_limo.mdl" 
		SkeletonName = car 
		Class = Vehicle 
		pos = PAIR(150.00000000000, 280.00000000000) 
		CameraZ = -6 
		scale = 0.01999999955 
		PivotPoint = VECTOR(0.00000000000, 4.11999988556, 0.00000000000) 
		active_viewport = <active_viewport> 
		AngleOrderXYZ 
		anglex = -1.57000005245 
		angley = 0 
		anglez = 0.00000000000 
		just = [ Left center ] 
	} 
	spawnscript rotate_pause_deck10 <no_slide> 
ENDSCRIPT

SCRIPT rotate_pause_deck10 
	IF NOT ObjectExists id = menu3d_sign10 
		RETURN 
	ENDIF 
	rot_angle = 0 
	DoScreenElementMorph time = 0.25000000000 id = menu3d_sign10 pos = PAIR(150.00000000000, 280.00000000000) 
	BEGIN 
		IF NOT ObjectExists id = menu3d_sign10 
			RETURN 
		ENDIF 
		SetScreenElementProps id = menu3d_sign10 angley = <rot_angle> 
		rot_angle = ( <rot_angle> + 0.06250000000 ) 
		wait 1 gameframes 
	REPEAT 
ENDSCRIPT

SCRIPT menu3d_show_sign11 active_viewport = 0 parent = root_window 
	IF NOT ScreenElementExists id = <parent> 
		printf "WARNING: menu3d_show_sign couldn\'t find parent %s" s = <parent> 
		RETURN 
	ENDIF 
	SetScreenElementLock id = <parent> off 
	GetPausePosByResolution 
	CreateScreenElement { 
		parent = <parent> 
		type = Element3d 
		id = menu3d_sign11 
		Model = "veh\\veh_minibaja\\veh_minibaja.mdl" 
		SkeletonName = car 
		Class = Vehicle 
		pos = PAIR(150.00000000000, 280.00000000000) 
		CameraZ = -6 
		scale = 0.01999999955 
		PivotPoint = VECTOR(0.00000000000, 4.11999988556, 0.00000000000) 
		active_viewport = <active_viewport> 
		AngleOrderXYZ 
		anglex = -1.57000005245 
		angley = 0 
		anglez = 0.00000000000 
		just = [ Left center ] 
	} 
	spawnscript rotate_pause_deck11 <no_slide> 
ENDSCRIPT

SCRIPT rotate_pause_deck11 
	IF NOT ObjectExists id = menu3d_sign11 
		RETURN 
	ENDIF 
	rot_angle = 0 
	DoScreenElementMorph time = 0.25000000000 id = menu3d_sign11 pos = PAIR(150.00000000000, 280.00000000000) 
	BEGIN 
		IF NOT ObjectExists id = menu3d_sign11 
			RETURN 
		ENDIF 
		SetScreenElementProps id = menu3d_sign11 angley = <rot_angle> 
		rot_angle = ( <rot_angle> + 0.06250000000 ) 
		wait 1 gameframes 
	REPEAT 
ENDSCRIPT

SCRIPT menu3d_show_sign12 active_viewport = 0 parent = root_window 
	IF NOT ScreenElementExists id = <parent> 
		printf "WARNING: menu3d_show_sign couldn\'t find parent %s" s = <parent> 
		RETURN 
	ENDIF 
	SetScreenElementLock id = <parent> off 
	GetPausePosByResolution 
	CreateScreenElement { 
		parent = <parent> 
		type = Element3d 
		id = menu3d_sign12 
		Model = "veh\\veh_lada\\veh_lada.mdl" 
		SkeletonName = car 
		Class = Vehicle 
		pos = PAIR(150.00000000000, 280.00000000000) 
		CameraZ = -6 
		scale = 0.01999999955 
		PivotPoint = VECTOR(0.00000000000, 4.11999988556, 0.00000000000) 
		active_viewport = <active_viewport> 
		AngleOrderXYZ 
		anglex = -1.57000005245 
		angley = 0 
		anglez = 0.00000000000 
		just = [ Left center ] 
	} 
	spawnscript rotate_pause_deck12 <no_slide> 
ENDSCRIPT

SCRIPT rotate_pause_deck12 
	IF NOT ObjectExists id = menu3d_sign12 
		RETURN 
	ENDIF 
	rot_angle = 0 
	DoScreenElementMorph time = 0.25000000000 id = menu3d_sign12 pos = PAIR(150.00000000000, 280.00000000000) 
	BEGIN 
		IF NOT ObjectExists id = menu3d_sign12 
			RETURN 
		ENDIF 
		SetScreenElementProps id = menu3d_sign12 angley = <rot_angle> 
		rot_angle = ( <rot_angle> + 0.06250000000 ) 
		wait 1 gameframes 
	REPEAT 
ENDSCRIPT

SCRIPT rotate_pause_deck2 
	IF NOT ObjectExists id = menu3d_sign2 
		RETURN 
	ENDIF 
	rot_angle = 0 
	DoScreenElementMorph time = 0.25000000000 id = menu3d_sign2 pos = PAIR(150.00000000000, 280.00000000000) 
	BEGIN 
		IF NOT ObjectExists id = menu3d_sign2 
			RETURN 
		ENDIF 
		SetScreenElementProps id = menu3d_sign2 angley = <rot_angle> 
		rot_angle = ( <rot_angle> + 0.06250000000 ) 
		wait 1 gameframes 
	REPEAT 
ENDSCRIPT

SCRIPT rotate_pause_deck1 
	IF NOT ObjectExists id = menu3d_sign1 
		RETURN 
	ENDIF 
	rot_angle = 0 
	DoScreenElementMorph time = 0.25000000000 id = menu3d_sign1 pos = PAIR(150.00000000000, 280.00000000000) 
	BEGIN 
		IF NOT ObjectExists id = menu3d_sign1 
			RETURN 
		ENDIF 
		SetScreenElementProps id = menu3d_sign1 angley = <rot_angle> 
		rot_angle = ( <rot_angle> + 0.06250000000 ) 
		wait 1 gameframes 
	REPEAT 
ENDSCRIPT

SCRIPT rotate_pause_deck 
	IF NOT ObjectExists id = menu3d_sign 
		RETURN 
	ENDIF 
	rot_angle = 0 
	DoScreenElementMorph time = 0.25000000000 id = menu3d_sign pos = PAIR(360.00000000000, 220.00000000000) 
	BEGIN 
		IF NOT ObjectExists id = menu3d_sign 
			RETURN 
		ENDIF 
		SetScreenElementProps id = menu3d_sign angley = <rot_angle> 
		rot_angle = ( <rot_angle> + 0.06250000000 ) 
		wait 1 gameframes 
	REPEAT 
ENDSCRIPT

SCRIPT element3d_add_components 
	IF GotParam animName 
		IF NOT GotParam animEventTableName 
			GetAnimEventTableName animType = <type> 
		ENDIF 
		IF ChecksumEquals a = <animName> b = default 
			IF ChecksumEquals a = <SkeletonName> b = thps6_human 
				<defaultAnimName> = Ped_M_Idle1 
			ENDIF 
		ELSE 
			defaultAnimName = <animName> 
		ENDIF 
		CreateComponentFromStructure component = Suspend 
		CreateComponentFromStructure component = animblender animEventTableName = <animEventTableName> <...> 
	ENDIF 
	IF GotParam SkeletonName 
		PushMemProfile "Element3d Skeletons" 
		CreateComponentFromStructure component = skeleton <...> skeleton = <SkeletonName> 
		PopMemProfile 
	ENDIF 
	IF GotParam animName 
		CreateComponentFromStructure component = Model usemodellights max_scene_lights = 0 <...> scale = 1 
	ELSE 
		CreateComponentFromStructure component = Model <...> scale = 1 
	ENDIF 
ENDSCRIPT

SCRIPT element3d_init_model 
	IF GotParam animName 
		Obj_SetBoneScale bone = bone_board_root scale = 0 propogate 
		IF GotParam blackout_model 
			Obj_SetLightAmbientColor r = 0 g = 0 b = 0 
			Obj_SetLightDiffuseColor index = 0 r = 0 g = 0 b = 0 
			Obj_SetLightDiffuseColor index = 1 r = 0 g = 0 b = 0 
			Obj_SetLightAmbientColor r = 0 g = 0 b = 0 
			Obj_SetLightDiffuseColor index = 0 r = 0 g = 0 b = 0 
			Obj_SetLightDiffuseColor index = 1 r = 0 g = 0 b = 0 
		ELSE 
			Obj_SetLightAmbientColor r = 128 g = 128 b = 128 
			Obj_SetLightDiffuseColor index = 0 r = 110 g = 125 b = 155 
			Obj_SetLightDiffuseColor index = 1 r = 10 g = 3 b = 5 
		ENDIF 
		Obj_ForceUpdate 
	ENDIF 
ENDSCRIPT


