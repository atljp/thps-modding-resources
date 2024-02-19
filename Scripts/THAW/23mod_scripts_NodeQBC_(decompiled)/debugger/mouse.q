
script updatedebuggermouseposition 
    if NOT ScreenElementExists id = mouse_cursor
        SetScreenElementLock id = root_window Off
        CreateScreenElement {
            type = SpriteElement
            parent = root_window
            id = mouse_cursor
            texture = mouse_cursor
            rgba = [ 128 128 128 85 ]
            just = [ left top ]
            z_priority = 3000003
            tags = { hide_from_debugger }
        }
    endif
    DoScreenElementMorph id = mouse_cursor Pos = ((1.0, 0.0) * <x> + (0.0, 1.0) * <y>)
endscript

script destroymousecursor 
    if ScreenElementExists \{ id = mouse_cursor }
        DestroyScreenElement \{ id = mouse_cursor }
    endif
    destroymousetext
    KillSpriteHighlightEffect
endscript

script destroymousetext 
    if ScreenElementExists \{ id = mouse_text }
        DestroyScreenElement \{ id = mouse_text }
    endif
endscript

script setmousetext 
    if NOT ScreenElementExists id = mouse_text
        SetScreenElementLock id = root_window Off
        CreateScreenElement {
            id = mouse_text
            parent = root_window
            type = TextElement
            just = [ center top ]
            Pos = (0.0, 0.0)
            font = small
            Scale = 1
            text = ''
            rgba = [ 80 128 128 128 ]
            z_priority = 3000002
            tags = { hide_from_debugger }
        }
    endif
    SetScreenElementProps id = mouse_text text = <text>
    DoScreenElementMorph id = mouse_text Pos = ((1.0, 0.0) * <x> + (0.0, 1.0) * <y> + (8.0, 16.0))
endscript

script MouseClickEffect 
    DoMorph \{ id = mouse_text Scale = 1.100 time = 0 }
    wait \{ 2 gameframes }
    DoMorph \{ id = mouse_text Scale = 1 time = 0 }
endscript

script domouseclickeffect 
    if ScreenElementExists \{ id = mouse_text }
        RunScriptOnScreenElement \{ id = mouse_text MouseClickEffect }
    endif
endscript
