number_of_console_lines = 6

script create_console 
    if NOT ObjectExists id = console_message_vmenu
        SetScreenElementLock id = root_window Off
        if InFrontend
            Pos = (50.0, 240.0)
        else
            Pos = (20.0, 265.0)
        endif
        CreateScreenElement {
            type = vmenu
            parent = root_window
            id = console_message_vmenu
            padding_scale = 0.6500
            font = dialog
            just = [ left top ]
            internal_just = [ left center ]
            Pos = <Pos>
            z_priority = 0
        }
    endif
endscript

script hide_console_window 
    if ObjectExists \{ id = console_message_vmenu }
        DoScreenElementMorph \{ id = console_message_vmenu time = 0 Scale = 0 }
    endif
endscript

script unhide_console_window 
    if ObjectExists \{ id = console_message_vmenu }
        DoScreenElementMorph \{ id = console_message_vmenu time = 0 Scale = 1 }
    endif
endscript

script console_hide 
    if ObjectExists \{ id = console_message_vmenu }
        RunScriptOnScreenElement \{ id = console_message_vmenu console_hide2 }
    endif
endscript

script console_hide2 
    DoMorph \{ Scale = 0 }
endscript

script console_unhide 
    if ObjectExists \{ id = console_message_vmenu }
        RunScriptOnScreenElement \{ id = console_message_vmenu console_unhide2 }
    endif
endscript

script console_unhide2 
    DoMorph \{ Scale = 1 }
endscript

script console_clear 
    if ScreenElementExists \{ id = console_message_vmenu }
        DestroyScreenElement \{ id = console_message_vmenu preserve_parent }
    endif
endscript

script console_destroy 
    if ObjectExists \{ id = console_message_vmenu }
        DestroyScreenElement \{ id = console_message_vmenu }
    endif
endscript

script console_message_wait_and_die \{ time = 30 }
    wait <time> seconds
    DoMorph \{ time = 0.5000 alpha = 0 }
    Die
endscript
