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

script CreateRailEditor 
    CreateCompositeObject \{Components = [{ Component = camera }{ Component = Input controller = 0 }{Component = editorcamera min_height = 20 min_radius = 10 max_radius = 1000 SimpleCollision}{ Component = RailEditor }] params = { name = RailEditor permanent }}
    RailEditor ::hide
    RailEditor ::Suspend
endscript

script SwitchOnRailEditor 
    RailEditor ::SetEditingMode \{ mode = FreeRoaming }
    Debounce \{ x time = 0.2000 Clear = 1 }
    RailEditor ::unsuspend
    RailEditor ::unhide
    GetParkEditorCursorPos
    RailEditor ::EditorCam_Initialise position = <Pos> cursor_height = 20
    SetActiveCamera \{ id = RailEditor }
endscript

script SwitchOffRailEditor 
    if RailEditor ::GetEditedRailInfo \{ CurrentRail }
        if (<num_points> < 2)
            RailEditor ::DeleteRail rail_id = <rail_id>
        endif
    endif
    RailEditor ::hide
    RailEditor ::Suspend
    SetActiveCamera \{ id = parked_cam }
endscript
