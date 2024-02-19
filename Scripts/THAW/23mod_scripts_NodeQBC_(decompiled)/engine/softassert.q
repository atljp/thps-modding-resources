enable_soft_asserts = 1
soft_assert_active = 0

script soft_assert 
    DumpHeaps
    printstruct <...> 
    if IsTrue enable_soft_asserts
        if IsTrue soft_assert_active
            printf 'Soft Assert already active, ignorning!'
        else
            pause_game = 1
            if globalexists type = integer name = view_mode
                if ((view_mode)> 0)
                    pause_game = 0
                endif
            endif
            if (<pause_game> = 1)
                if GameIsPaused
                    scriptassert 'Soft Assertion fired when game was paused!  The full information for the original soft assert can be found above this assert.'
                endif
                PauseMusic 1
                PauseStream 1
                pausegame
            endif
            change soft_assert_active = 1
            hideloadingscreen
            ScreenShot filename = 'Assert'
            soft_assert_message <...> 
        endif
    endif
endscript

script soft_assert_keep_player_paused 
    MangleChecksums \{ a = 0 b = 0 }
    begin 
    if CompositeObjectExists name = <mangled_id>
        <mangled_id> ::Pause
    endif
    wait \{ 1 gameframes }
    repeat 
endscript

script soft_assert_confirm 
    unpause_game = 1
    if globalexists \{ type = integer name = view_mode }
        if ((view_mode)> 0)
            unpause_game = 0
        endif
    endif
    if (<unpause_game> = 1)
        UnPauseGame
        PauseMusic \{ 0 }
        PauseStream \{ 0 }
    endif
    change \{ soft_assert_active = 0 }
    DestroyScreenElement \{ id = soft_assert_anchor }
endscript

script soft_assert_message message = ''
    if GotParam file
        FormatText textname = message '%m\c2File:\c0 %f\n' m = <message> f = <file>
    endif
    if GotParam Line
        FormatText textname = message '%m\c2Line:\c0 %l\n' m = <message> l = <Line>
    endif
    if GotParam sig
        FormatText textname = message '%m\c2Signature:\c0 %s\n' m = <message> s = <sig>
    endif
    if GotParam reason
        FormatText textname = message '%m\n\c2Message:\c0 %r\n' m = <message> r = <reason>
    endif
    if ScreenElementExists id = soft_assert_anchor
        DestroyScreenElement id = soft_assert_anchor
    endif
    SetScreenElementLock id = root_window Off
    top = (0.0, 40.0)
    CreateScreenElement {
        type = ContainerElement
        id = soft_assert_anchor
        parent = root_window
        z_priority = 10000
    }
    CreateScreenElement {
        type = SpriteElement
        parent = soft_assert_anchor
        rgba = [ 0 0 0 70 ]
        dims = (640.0, 480.0)
        Pos = (0.0, 0.0)
        just = [ left top ]
    }
    CreateScreenElement {
        type = TextElement
        parent = soft_assert_anchor
        font = small
        text = '\C2zapewnienie:'
        rgba = [ 128 128 128 128 ]
        alpha = 1
        Scale = 1.500
        Pos = ((320.0, 0.0) + <top>)
        just = [ center top ]
        z_priority = 10002
    }
    CreateScreenElement {
        type = TextBlockElement
        parent = soft_assert_anchor
        font = small
        text = <message>
        rgba = [ 128 128 128 128 ]
        alpha = 1
        Scale = 1
        Pos = ((100.0, 50.0) + <top>)
        dims = (440.0, 0.0)
        allow_expansion
        just = [ left top ]
        internal_just = [ left top ]
    }
    GetScreenElementDims id = <id>
    if GotParam callstack
        dim_h = (325 - <height>)
        if (<dim_h> < 100)
            dim_h = 100
        endif
        CreateScreenElement {
            type = vscrollingmenu
            parent = soft_assert_anchor
            id = soft_assert_callstack_v
            just = [ left top ]
            Pos = ((120.0, 90.0) + (<height> * (0.0, 0.8500000238418579)))
            dims = ((420.0, 0.0) + (<dim_h> * (0.0, 1.0)))
            z_priority = 10005
        }
        CreateScreenElement {
            type = vmenu
            id = soft_assert_callstack
            parent = soft_assert_callstack_v
            internal_just = [ left top ]
            dont_allow_wrap
        }
        GetArraySize <callstack>
        i = 0
        begin 
        CreateScreenElement {
            type = TextBlockElement
            parent = soft_assert_callstack
            font = small
            text = (<callstack> [ <i> ])
            rgba = [ 80 80 128 128 ]
            Scale = 0.9000
            just = [ left top ]
            dims = (440.0, 0.0)
            allow_expansion
            internal_just = [ left top ]
        }
        i = (<i> + 1)
        repeat <array_size>
        height = 330
        FireEvent type = focus target = soft_assert_callstack
    endif
    CreateScreenElement {
        type = SpriteElement
        parent = soft_assert_anchor
        rgba = [ 0 0 0 70 ]
        dims = ((450.0, 30.0) + (<height> * (0.0, 1.0)))
        Pos = ((320.0, 0.0) + <top>)
        just = [ center top ]
    }
    create_helper_text helper_text_elements = [{ text = '\be - \bf - \be = Kontynuuj' }] parent = soft_assert_anchor z_priority = 10004
    soft_assert_input
    FireEvent type = focus target = soft_assert_anchor
    RunScriptOnScreenElement id = soft_assert_anchor soft_assert_keep_player_paused
endscript

script soft_assert_input step = 0
    steps = [
        {event_name = pad_l1 button_name = l1}
        {event_name = pad_r1 button_name = r1}
        {event_name = pad_l1 button_name = l1}
    ]
    if GotParam wait
        wait <wait> seconds
    endif
    GetArraySize <steps>
    if NOT (<step> < <array_size>)
        i = 0
        begin 
        Debounce (<steps> [ <i> ].button_name)
        ControllerDebounce (<steps> [ <i> ].button_name)
        i = (<i> + 1)
        repeat <array_size>
        goto soft_assert_confirm
    endif
    i = 0
    begin 
    if (<step> = <i>)
        event_handlers = [{(<steps> [ <i> ].event_name)soft_assert_input params = {step = (<step> + 1)}}]
    else
        event_handlers = [{(<steps> [ <i> ].event_name)NullScript}]
    endif
    soft_assert_anchor ::setprops event_handlers = <event_handlers> replace_handlers
    i = (<i> + 1)
    if GotParam reset
        if NOT (<i> < <array_size>)
            goto soft_assert_input
        endif
    else
        if (<i> > <step>)
            break 
        endif
    endif
    repeat 
    soft_assert_anchor ::obj_killspawnedscript name = soft_assert_input
    soft_assert_anchor ::obj_spawnscriptlater soft_assert_input params = { wait = 0.3000 reset }
endscript
