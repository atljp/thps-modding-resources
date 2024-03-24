
number_of_console_lines = 6

script create_console 
    if NOT ObjectExists id = console_message_vmenu
        SetScreenElementLock id = root_window Off
        if LevelIs load_mainmenu
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


script create_console_message text = 'Default console message' rgba = [ 113 121 127 80 ]
    if NOT GetGlobalFlag flag = NO_DISPLAY_CHATWINDOW
        root_window ::getsingletag menu_state
        if NOT ObjectExists id = console_message_vmenu
            create_console
        endif
        if NOT (<menu_state> = on)
            unhide_console_window
        endif
        SetScreenElementLock id = console_message_vmenu Off
        if ScreenElementExists id = {console_message_vmenu child = (number_of_console_lines - 1)}
            DestroyScreenElement id = { console_message_vmenu child = 0 }
        endif
        if LevelIs load_mainmenu
            dims = (750.0, 10.0)
            Pos = (50.0, 280.0)
            change number_of_console_lines = 5
            max_chat_height = 150
        else
            dims = (750.0, 10.0)
            Pos = (20.0, 265.0)
            change number_of_console_lines = 6
            max_chat_height = 96
        endif
        if GotParam join
            rgba = [ 0 80 0 80 ]
        else
            if GotParam left
                rgba = [ 80 0 0 80 ]
            endif
        endif
        SetScreenElementProps id = console_message_vmenu Pos = <Pos>
        CreateScreenElement {
            type = TextBlockElement
            parent = console_message_vmenu
            font = dialog
            text = <text>
            internal_just = [ left top ]
            rgba = <rgba>
            Scale = 0.8000
            not_focusable
            dims = <dims>
            allow_expansion
            z_priority = 5
        }
        begin 
        total_height = 0
        index = number_of_console_lines
        begin 
        if ScreenElementExists id = {console_message_vmenu child = (number_of_console_lines - <index>)}
            GetScreenElementDims id = {console_message_vmenu child = (number_of_console_lines - <index>)}
            <total_height> = (<total_height> + <height>)
            <index> = (<index> - 1)
        else
            break 
        endif
        repeat 
        if (<total_height> > <max_chat_height>)
            DestroyScreenElement id = { console_message_vmenu child = 0 }
        else
            break 
        endif
        repeat 
        if GotParam wait_and_die
            RunScriptOnScreenElement id = <id> console_message_wait_and_die params = { time = <time> }
            return 
        endif
        if NOT LevelIs load_mainmenu
            if NOT GotParam dont_die
                RunScriptOnScreenElement id = <id> console_message_wait_and_die
            endif
        endif
    endif
endscript


script hide_console_window 
    if ObjectExists id = console_message_vmenu
        DoScreenElementMorph id = console_message_vmenu time = 0 Scale = 0
    endif
endscript


script unhide_console_window 
    if ObjectExists id = console_message_vmenu
        DoScreenElementMorph id = console_message_vmenu time = 0 Scale = 1
    endif
endscript


script console_hide 
    if ObjectExists id = console_message_vmenu
        RunScriptOnScreenElement id = console_message_vmenu console_hide2
    endif
endscript


script console_hide2 
    DoMorph Scale = 0
endscript


script console_unhide 
    if ObjectExists id = console_message_vmenu
        RunScriptOnScreenElement id = console_message_vmenu console_unhide2
    endif
endscript


script console_unhide2 
    DoMorph Scale = 1
endscript


script console_clear 
    if ScreenElementExists id = console_message_vmenu
        DestroyScreenElement id = console_message_vmenu preserve_parent
    endif
endscript


script console_destroy 
    if ObjectExists id = console_message_vmenu
        DestroyScreenElement id = console_message_vmenu
    endif
endscript


script console_message_wait_and_die time = 30
    wait <time> seconds
    DoMorph time = 0.5000 alpha = 0
    Die
endscript

