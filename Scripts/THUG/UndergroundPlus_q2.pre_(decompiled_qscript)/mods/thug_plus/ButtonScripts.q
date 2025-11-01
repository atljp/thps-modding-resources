
select_shift = 1 
memcard_screenshots = 0 
skater_cam_0_mode = 2 
skater_cam_1_mode = 2 
ksk_mode900 = 0 
ksk_slow_mo = 0 
SCRIPT UserSelectSelect 
	IF ( ksk_mode900 = 1 ) 
		ToggleViewMode 
	ELSE 
		IF NOT isngc 
			IF ObjectExists id = skatercam0 
				SWITCH skater_cam_0_mode 
					CASE 1 
						change skater_cam_0_mode = 2 
					CASE 2 
						change skater_cam_0_mode = 3 
					CASE 3 
						change skater_cam_0_mode = 4 
					CASE 4 
						change skater_cam_0_mode = 13 
					CASE 5 
						change skater_cam_0_mode = 6 
					CASE 6 
						change skater_cam_0_mode = 7 
					CASE 7 
						change skater_cam_0_mode = 8 
					CASE 8 
						change skater_cam_0_mode = 9 
					CASE 9 
						change skater_cam_0_mode = 10 
					CASE 10 
						change skater_cam_0_mode = 11 
					CASE 11 
						change skater_cam_0_mode = 12 
					CASE 12 
						change skater_cam_0_mode = 13 
					CASE 13 
						change skater_cam_0_mode = 14 
					CASE 14 
						change skater_cam_0_mode = 15 
					CASE 15 
						change skater_cam_0_mode = 16 
					CASE 16 
						change skater_cam_0_mode = 17 
					CASE 17 
						change skater_cam_0_mode = 18 
					CASE 18 
						change skater_cam_0_mode = 19 
					CASE 19 
						change skater_cam_0_mode = 20 
					CASE 20 
						change skater_cam_0_mode = 21 
					CASE 21 
						change skater_cam_0_mode = 0 
				ENDSWITCH 
				skatercam0 : sc_setmode mode = skater_cam_0_mode 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT UserSelectSelect2 
	IF NOT isngc 
		IF ObjectExists id = skatercam1 
			SWITCH skater_cam_1_mode 
				CASE 1 
					change skater_cam_1_mode = 2 
				CASE 2 
					change skater_cam_1_mode = 3 
				CASE 3 
					change skater_cam_1_mode = 4 
				CASE 4 
					change skater_cam_1_mode = 1 
				CASE 5 
					change skater_cam_0_mode = 1 
			ENDSWITCH 
			skatercam1 : sc_setmode mode = skater_cam_1_mode 
		ENDIF 
	ENDIF 
ENDSCRIPT

view_mode = 0 
render_mode = 0 
wireframe_mode = 0 
drop_in_car = 0 
drop_in_car_setup = MiniBajaCarSetup 
SCRIPT UserSelectTriangle 
	IF ObjectExists id = skatercam0 
		SWITCH skater_cam_0_mode 
			CASE 0 
				change skater_cam_0_mode = 1 
			CASE 1 
				change skater_cam_0_mode = 2 
			CASE 2 
				change skater_cam_0_mode = 3 
			CASE 3 
				change skater_cam_0_mode = 4 
			CASE 4 
				change skater_cam_0_mode = 13 
			CASE 5 
				change skater_cam_0_mode = 6 
			CASE 6 
				change skater_cam_0_mode = 7 
			CASE 7 
				change skater_cam_0_mode = 8 
			CASE 8 
				change skater_cam_0_mode = 9 
			CASE 9 
				change skater_cam_0_mode = 10 
			CASE 10 
				change skater_cam_0_mode = 11 
			CASE 11 
				change skater_cam_0_mode = 12 
			CASE 12 
				change skater_cam_0_mode = 13 
			CASE 13 
				change skater_cam_0_mode = 14 
			CASE 14 
				change skater_cam_0_mode = 15 
			CASE 15 
				change skater_cam_0_mode = 16 
			CASE 16 
				change skater_cam_0_mode = 17 
			CASE 17 
				change skater_cam_0_mode = 18 
			CASE 18 
				change skater_cam_0_mode = 19 
			CASE 19 
				change skater_cam_0_mode = 20 
			CASE 20 
				change skater_cam_0_mode = 21 
			CASE 21 
				change skater_cam_0_mode = 0 
		ENDSWITCH 
		skatercam0 : sc_setmode mode = skater_cam_0_mode 
	ENDIF 
ENDSCRIPT

SCRIPT Ksk_ShowPos 
	GetSkaterPosition 
	FormatText TextName = MessageText "x: %s y: %i z: %j" s = <x> i = <y> j = <z> 
	create_console_message text = <MessageText> 
ENDSCRIPT

SCRIPT UserSelectSquare 
	IF ControllerPressed Black 
		Skater : SkipToCustomRestart 
	ELSE 
		change viewer_rotation_angle = 0 
		SWITCH Viewer_move_mode 
			CASE 0 
				change Viewer_move_mode = 1 
				SetMovementVelocity 400 
				SetRotateVelocity 25 
				create_panel_message id = viewermovemode text = "Med cam" pos = PAIR(320.00000000000, 50.00000000000) 
			CASE 1 
				change Viewer_move_mode = 2 
				SetMovementVelocity 800 
				SetRotateVelocity 50 
				create_panel_message id = viewermovemode text = "Semi-fast cam" pos = PAIR(320.00000000000, 50.00000000000) 
			CASE 2 
				change Viewer_move_mode = 3 
				SetMovementVelocity 6000 
				SetRotateVelocity 300 
				create_panel_message id = viewermovemode text = "Fast cam" pos = PAIR(320.00000000000, 50.00000000000) 
			CASE 3 
				change Viewer_move_mode = 4 
				SetMovementVelocity 100 
				SetRotateVelocity 10 
				create_panel_message id = viewermovemode text = "Super Slow cam" pos = PAIR(320.00000000000, 50.00000000000) 
			CASE 4 
				change Viewer_move_mode = 0 
				SetMovementVelocity 1000 
				SetRotateVelocity 0 
				create_panel_message id = viewermovemode text = "No Rotation" pos = PAIR(320.00000000000, 50.00000000000) 
		ENDSWITCH 
	ENDIF 
ENDSCRIPT

SCRIPT UserSelectCircle 
	IF ControllerPressed Black 
		Skater : SetCustomRestart Set 
	ELSE 
		IF NOT NotCD 
			IF ( render_mode ) 
				SWITCH wireframe_mode 
					CASE 0 
						change wireframe_mode = 1 
					CASE 1 
						change wireframe_mode = 2 
					CASE 2 
						change wireframe_mode = 3 
					CASE 3 
						change wireframe_mode = 4 
					CASE 4 
						change wireframe_mode = 5 
					CASE 5 
						change wireframe_mode = 6 
					CASE 6 
						change wireframe_mode = 0 
				ENDSWITCH 
				setwireframemode mode = wireframe_mode 
				show_wireframe_mode 
			ELSE 
				IF Skater : Driving 
					ToggleUserControlledVehicleMode 
				ENDIF 
				IF ( drop_in_car = 0 ) 
					Skater : PlaceBeforeCamera 
					Restore_skater_camera 
					change view_mode = 0 
					ToggleViewMode 
					ToggleViewMode 
					ToggleViewMode 
				ELSE 
					MakeSkaterGoto Switch_OnGroundAI Params = { NewScript = TransAm VehicleSetup = drop_in_car_setup edited_goal } 
					SetActiveCamera id = viewer_cam 
					PlayerVehicle : Vehicle_PlaceBeforeCamera 
					change view_mode = 0 
					ToggleViewMode 
					ToggleViewMode 
					ToggleViewMode 
					SetActiveCamera id = PlayerVehicleCamera 
					Skater : PausePhysics 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT UserSelectStart 
	SWITCH ksk_slow_mo 
		CASE 0 
			change ksk_slow_mo = 1 
			SetSlomo 0.60000002384 
			pulse_blur Start = 0 End = 120 time = 10 
		CASE 1 
			change ksk_slow_mo = 2 
			pulse_blur Start = 120 End = 200 time = 20 
			SetSlomo 0.40000000596 
		CASE 2 
			change ksk_slow_mo = 3 
			pulse_blur Start = 0 End = 50 time = 20 
			SetSlomo 0.20000000298 
		CASE 3 
			change ksk_slow_mo = 4 
			pulse_blur Start = 0 End = 50 time = 20 
			SetSlomo 0.80000001192 
		CASE 4 
			change ksk_slow_mo = 0 
			kill_blur 
			SetSlomo 1 
	ENDSWITCH 
ENDSCRIPT

SCRIPT ToggleViewMode 
	SWITCH view_mode 
		CASE 0 
			change view_mode = 1 
		CASE 1 
			change view_mode = 2 
		CASE 2 
			change view_mode = 0 
	ENDSWITCH 
	SetViewMode view_mode 
ENDSCRIPT

SCRIPT ToggleMode900 
	IF ( select_shift = 0 ) 
		change select_shift = 1 
	ELSE 
		change select_shift = 0 
	ENDIF 
ENDSCRIPT

SCRIPT UserSelectX 
	IF ControllerPressed Black 
		CreateLevelEditor 
		SwitchOnLevelEditor 
	ELSE 
		change viewer_rotation_angle = 0 
		ToggleViewMode 
	ENDIF 
ENDSCRIPT

viewer_rotation_angle = 0 
SCRIPT UserViewerX 
ENDSCRIPT

SCRIPT UserViewerSquare 
ENDSCRIPT

Viewer_move_mode = 0 
SCRIPT UserViewerCircle 
ENDSCRIPT

SCRIPT UserViewerTriangle 
ENDSCRIPT

SCRIPT show_wireframe_mode 
	SWITCH wireframe_mode 
		CASE 0 
			wireframe_message text = "Wireframe : Face Flags" 
		CASE 1 
			wireframe_message text = "Wireframe : Poly Density" 
		CASE 2 
			wireframe_message text = "Wireframe : Low Poly Highlight" 
		CASE 3 
			wireframe_message text = "Wireframe : Unique object colors" 
		CASE 4 
			wireframe_message text = "Wireframe : Renderable Unique MESH colors" 
		CASE 5 
			wireframe_message text = "Wireframe : Renderable MESH vertex density" 
		CASE 6 
			wireframe_message text = "Wireframe : Occlusion Map" 
	ENDSWITCH 
ENDSCRIPT

SCRIPT wireframe_message text = "wireframe" 
	create_panel_message text = <text> id = wireframe_mess rgba = [ 200 128 128 128 ] pos = PAIR(20.00000000000, 340.00000000000) just = [ left center ] scale = 5 style = wireframe_style 
ENDSCRIPT

SCRIPT wireframe_style 
	DoMorph time = 0 scale = PAIR(1.00000000000, 1.00000000000) 
	DoMorph time = 3 scale = PAIR(1.00000000000, 1.00000000000) 
	DoMorph time = 1 alpha = 0 
	die 
ENDSCRIPT


