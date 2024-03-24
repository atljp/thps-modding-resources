

script CreateRailEditor 
    CreateCompositeObject {
        Components = 
        [
            { Component = camera }
            {Component = Input controller = 0}
            {Component = editorcamera min_height = 20 min_radius = 10 max_radius = 1000 SimpleCollision}
            { Component = RailEditor }
        ]
        params = { name = RailEditor permanent }
    }
    RailEditor ::hide
    RailEditor ::Suspend
endscript


script SwitchOnRailEditor 
    RailEditor ::SetEditingMode mode = FreeRoaming
    Debounce x time = 0.2000 Clear = 1
    RailEditor ::unsuspend
    RailEditor ::unhide
    GetParkEditorCursorPos
    RailEditor ::EditorCam_Initialise position = <Pos> cursor_height = 20
    SetActiveCamera id = RailEditor
endscript


script SwitchOffRailEditor 
    if RailEditor ::GetEditedRailInfo CurrentRail
        if (<num_points> < 2)
            RailEditor ::DeleteRail rail_id = <rail_id>
        endif
    endif
    RailEditor ::hide
    RailEditor ::Suspend
    SetActiveCamera id = parked_cam
endscript

