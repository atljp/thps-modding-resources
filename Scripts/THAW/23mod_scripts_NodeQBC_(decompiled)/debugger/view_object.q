MouseZoomFactor = 8
MouseRotationUpDownFactor = -0.01333
MouseRotationLeftRightFactor = 0.01000

script EnableObjViewer 
    if NOT ScreenElementExists id = view_dot
        SetScreenElementLock id = root_window Off
        CreateScreenElement {
            id = view_dot
            type = SpriteElement
            texture = white
            rgba = [ 255 0 0 128 ]
            Scale = 1.0
            Pos = (320.0, 240.0)
            parent = root_window
        }
    endif
    if ScreenElementExists id = obj_viewer_anchor
        DestroyScreenElement id = obj_viewer_anchor
    endif
    SetScreenElementLock id = root_window Off
    CreateScreenElement {
        type = ContainerElement
        parent = root_window
        id = obj_viewer_anchor
        Pos = (30.0, 190.0)
        just = [ center center ]
        internal_just = [ left center ]
    }
    CreateScreenElement {
        type = TextElement
        parent = obj_viewer_anchor
        id = view_obj_text1
        Pos = (0.0, 15.0)
        text = 'Brak'
        font = dialog
        rgba = [ 60 60 100 100 ]
        just = [ left center ]
        Scale = 0.8000
    }
    CreateScreenElement {
        type = TextElement
        parent = obj_viewer_anchor
        id = view_obj_text2
        Pos = (0.0, 30.0)
        text = 'Brak'
        font = dialog
        rgba = [ 58 108 58 100 ]
        just = [ left center ]
        Scale = 0.8000
    }
    CreateScreenElement {
        type = TextElement
        parent = obj_viewer_anchor
        id = view_obj_text3
        Pos = (0.0, 45.0)
        text = 'Brak'
        font = dialog
        rgba = [ 58 108 58 100 ]
        just = [ left center ]
        Scale = 0.8000
    }
    CreateScreenElement {
        type = TextElement
        parent = obj_viewer_anchor
        id = view_obj_text4
        Pos = (0.0, 60.0)
        text = 'Brak'
        font = dialog
        rgba = [ 58 108 58 100 ]
        just = [ left center ]
        Scale = 0.8000
    }
    CreateScreenElement {
        type = TextElement
        parent = obj_viewer_anchor
        id = view_obj_text5
        Pos = (0.0, 75.0)
        text = 'Brak'
        font = dialog
        rgba = [ 58 108 58 100 ]
        just = [ left center ]
        Scale = 0.8000
    }
    CreateScreenElement {
        type = TextElement
        parent = obj_viewer_anchor
        id = view_obj_text6
        Pos = (0.0, 90.0)
        text = 'Brak'
        font = dialog
        rgba = [ 58 108 58 100 ]
        just = [ left center ]
        Scale = 0.8000
    }
    CreateScreenElement {
        type = TextElement
        parent = obj_viewer_anchor
        id = view_obj_text7
        Pos = (0.0, 115.0)
        text = 'Brak'
        font = dialog
        rgba = [ 58 108 58 100 ]
        just = [ left center ]
        Scale = 0.8000
    }
endscript

script UpdateObjViewer 
    SetScreenElementProps id = view_obj_text2 text = <ObjName>
    SetScreenElementProps id = view_obj_text1 text = <ObjType>
    SetScreenElementProps id = view_obj_text3 text = <PolyStat0>
    SetScreenElementProps id = view_obj_text4 text = <PolyStat1>
    SetScreenElementProps id = view_obj_text5 text = <PolyStat2>
    SetScreenElementProps id = view_obj_text6 text = <PolyStat3>
    SetScreenElementProps id = view_obj_text7 text = <PolyStat4>
endscript

script DisableObjViewer 
    if ScreenElementExists id = view_dot
        DestroyScreenElement id = view_dot
    endif
    if ScreenElementExists id = view_obj_text1
        DestroyScreenElement id = view_obj_text1
    endif
    if ScreenElementExists id = view_obj_text2
        DestroyScreenElement id = view_obj_text2
    endif
    if ScreenElementExists id = view_obj_text3
        DestroyScreenElement id = view_obj_text3
    endif
    if ScreenElementExists id = view_obj_text4
        DestroyScreenElement id = view_obj_text4
    endif
    if ScreenElementExists id = view_obj_text5
        DestroyScreenElement id = view_obj_text5
    endif
    if ScreenElementExists id = view_obj_text6
        DestroyScreenElement id = view_obj_text6
    endif
    if ScreenElementExists id = view_obj_text7
        DestroyScreenElement id = view_obj_text7
    endif
endscript
