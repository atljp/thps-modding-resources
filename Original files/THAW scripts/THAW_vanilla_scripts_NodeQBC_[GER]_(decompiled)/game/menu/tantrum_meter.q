
script GetSkaterTantrumMeterAnchor 
    if NOT GotParam \{ ObjID }
        if NOT IsObjectScript
            script_assert \{ 'Needs to be an object script' }
        endif
        obj_getid
    endif
    if ChecksumEquals a = <ObjID> b = 0
        id = player1_tantrum_meter
    else
        id = player2_tantrum_meter
    endif
    return tantrum_meter_anchor = <id>
endscript

script TantrumMessageHide 
    if ScreenElementExists \{ id = player1_tantrum_meter }
        DoScreenElementMorph \{ id = player1_tantrum_meter Scale = 0 time = 0 relative_scale }
    endif
    if ScreenElementExists \{ id = player2_tantrum_meter }
        DoScreenElementMorph \{ id = player2_tantrum_meter Scale = 0 time = 0 relative_scale }
    endif
endscript

script TantrumMessageKill 
    if ScreenElementExists \{ id = player1_tantrum_meter }
        DestroyScreenElement \{ id = player1_tantrum_meter }
    endif
    if ScreenElementExists \{ id = player2_tantrum_meter }
        DestroyScreenElement \{ id = player2_tantrum_meter }
    endif
endscript

script TantrumMessageShow 
    if ScreenElementExists \{ id = player1_tantrum_meter }
        DoScreenElementMorph \{ id = player1_tantrum_meter Scale = 1 time = 0 relative_scale }
    endif
    if ScreenElementExists \{ id = player2_tantrum_meter }
        DoScreenElementMorph \{ id = player2_tantrum_meter Scale = 1 time = 0 relative_scale }
    endif
endscript

script tantrum_meter_update_tags 
    GetSkaterTantrumMeterAnchor
    if NOT ScreenElementExists id = <tantrum_meter_anchor>
        return 
    endif
    <tantrum_meter_anchor> ::settags {
        tantrum_heartbeat_frequency = 1
        tantrum_heartbeat_amplitude = ((<spazzfactor> * 0.1500)+ 1.500)
    }
endscript

script tantrum_draw_meter 
    GetSkaterTantrumMeterAnchor
    if GotParam Die
        if ScreenElementExists id = <tantrum_meter_anchor>
            if NOT <tantrum_meter_anchor> ::getsingletag dead
                <tantrum_meter_anchor> ::settags dead
                if <tantrum_meter_anchor> ::getsingletag in_the_zone
                    SFX_KILL_HEART_BEAT
                endif
                DoScreenElementMorph id = <tantrum_meter_anchor> alpha = 0 time = 0.4000
                RunScriptOnScreenElement id = <tantrum_meter_anchor> panel_message_wait_and_die params = { time = 500 }
            endif
        endif
        return 
    endif
    if ScreenElementExists id = <tantrum_meter_anchor>
        DestroyScreenElement id = <tantrum_meter_anchor>
    endif
    SetScreenElementLock id = root_window Off
    Scale = 1
    Pos = (224.5, 130.0)
    if InSplitScreenGame
        obj_getid
        ScriptGetScreenMode
        switch <screen_mode>
            case split_vertical
            Pos = (240.0, 130.0)
            if ChecksumEquals a = <ObjID> b = 0
                Pos = (<Pos> - (150.0, 0.0))
            else
                Pos = (<Pos> + (160.0, 0.0))
            endif
            Scale = 0.8000
            case split_horizontal
            Pos = (240.0, 130.0)
            if ChecksumEquals a = <ObjID> b = 0
                Pos = (<Pos> - (0.0, 60.0))
            else
                Pos = (<Pos> + (0.0, 160.0))
            endif
            Scale = 0.8000
        endswitch
    endif
    CreateScreenElement {
        type = ContainerElement
        parent = root_window
        id = <tantrum_meter_anchor>
        Pos = <Pos>
        Scale = <Scale>
        just = [ left center ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <tantrum_meter_anchor>
        rgba = [ 128 128 128 128 ]
        Pos = (0.0, 0.0)
        just = [ left center ]
        Scale = (12.0, 1.0)
        texture = spazzbody
        z_priority = 4
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <tantrum_meter_anchor>
        rgba = [ 128 128 128 128 ]
        Pos = (191.0, 0.0)
        just = [ left center ]
        Scale = 1
        texture = spazztip
        z_priority = 4
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <tantrum_meter_anchor>
        rgba = [ 128 128 128 128 ]
        Pos = (-4.0, -14.0)
        just = [ center center ]
        Scale = (1.5, 1.600000023841858)
        texture = heart
        z_priority = 5
        rot_angle = 3
    }
    if ((IsXbox)|| (isPC))
        freak_text = 'DRÜCK \m2 FÜR EINEN FREAK OUT'
    else
        freak_text = '\m2 FÜR EINEN \'Freak Out\''
    endif
    CreateScreenElement {
        type = TextElement
        parent = <tantrum_meter_anchor>
        text = <freak_text>
        rgba = [ 128 128 128 100 ]
        Pos = (18.0, 18.0)
        just = [ left center ]
        Scale = (0.75, 0.8500000238418579)
        font = dialog
        z_priority = 6
        shadow
        shadow_rgba = UI_text_shadow_color
        shadow_offs = UI_text_shadow_offset
    }
    DoScreenElementMorph id = <tantrum_meter_anchor> alpha = 0 time = 0
    DoScreenElementMorph id = <tantrum_meter_anchor> alpha = 1 time = 0.1000
    <tantrum_meter_anchor> ::settags {
        tantrum_heartbeat_amplitude = 1.500
        tantrum_heartbeat_frequency = 0
    }
    RunScriptOnScreenElement id = <tantrum_meter_anchor> tantrum_heartbeat
endscript

script tantrum_meter_maybe_play_sound 
    GetSkaterTantrumMeterAnchor
    if ScreenElementExists id = <tantrum_meter_anchor>
        if NOT <tantrum_meter_anchor> ::getsingletag dead
            if NOT <tantrum_meter_anchor> ::getsingletag in_the_zone
                <tantrum_meter_anchor> ::getsingletag sound_pitch
                playsound SK6_Menu_Move vol = 150 pitch = <sound_pitch>
            endif
        endif
    endif
endscript

script tantrum_heartbeat_beat 
    DoMorph \{ alpha = 0 time = 0 }
    DoMorph alpha = 0.5000 Scale = <tantrum_heartbeat_amplitude> relative_scale time = 0.3000 Pos = (0.0, -20.0)
    DoMorph \{ alpha = 0 Scale = 1 relative_scale time = 0.2000 }
    Die
endscript

script tantrum_heartbeat 
    obj_getid
    id = <ObjID>
    anchor = <id>
    counter = 0
    begin 
    getsingletag tantrum_heartbeat_frequency
    tantrum_heartbeat_frequency = (<tantrum_heartbeat_frequency> + 1)
    if (<tantrum_heartbeat_frequency> > 40)
        tantrum_heartbeat_frequency = 40
    endif
    if (<tantrum_heartbeat_frequency> < 5)
        tantrum_heartbeat_frequency = 5
    endif
    settags tantrum_heartbeat_frequency = <tantrum_heartbeat_frequency>
    if (<counter> > <tantrum_heartbeat_frequency>)
        counter = 0
        SetScreenElementLock id = <anchor> Off
        CreateScreenElement {
            type = SpriteElement
            parent = <anchor>
            rgba = [ 128 128 128 128 ]
            Pos = (0.0, -14.0)
            just = [ center center ]
            Scale = (1.5, 1.600000023841858)
            texture = heart
            z_priority = 15
        }
        getsingletag tantrum_heartbeat_amplitude
        RunScriptOnScreenElement id = <id> tantrum_heartbeat_beat params = { tantrum_heartbeat_amplitude = <tantrum_heartbeat_amplitude> }
    endif
    counter = (<counter> + 1)
    wait 1 gameframes
    repeat 
endscript

script tantrum_explosion_explode 
    DoMorph \{ alpha = 0 time = 0 }
    DoMorph \{alpha = 0.5000 Scale = 2.500 relative_scale time = 0.05000 rot_angle = 0}
    DoMorph \{alpha = 0.3000 Scale = 3.500 relative_scale time = 0.3000 rot_angle = 25}
    DoMorph \{ alpha = 0 time = 0.2000 Scale = 4 rot_angle = 40 }
    Die
endscript

script tantrum_explosion 
    GetSkaterTantrumMeterAnchor
    if NOT ScreenElementExists id = <tantrum_meter_anchor>
        return 
    endif
    SetScreenElementLock id = <tantrum_meter_anchor> Off
    CreateScreenElement {
        type = SpriteElement
        parent = <tantrum_meter_anchor>
        rgba = [ 128 128 30 128 ]
        Pos = (191.0, 0.0)
        just = [ center center ]
        Scale = 1
        texture = spazzburst
        z_priority = -10
    }
    RunScriptOnScreenElement id = <id> tantrum_explosion_explode
    wait 0.2000 seconds
    if NOT ScreenElementExists id = <tantrum_meter_anchor>
        return 
    endif
    SetScreenElementLock id = <tantrum_meter_anchor> Off
    CreateScreenElement {
        type = SpriteElement
        parent = <tantrum_meter_anchor>
        rgba = [ 128 128 30 128 ]
        Pos = (191.0, 0.0)
        just = [ center center ]
        Scale = 1
        texture = spazzburst
        z_priority = -10
    }
    RunScriptOnScreenElement id = <id> tantrum_explosion_explode
endscript

script tantrum_draw_and_update_spazzfactors {min = 3.0
        max = 7.500
        start_pos = (0.0, 0.0)
        end_pos = (200.0, 0.0)
    }
    GetSkaterTantrumMeterAnchor
    GetArraySize tantrum_array
    spazz_interval = ((<max> - <min>)/ (<array_size> -1.0))
    begin_pos = ((<end_pos> / <max>)* <min>)
    draw_interval = ((<end_pos> - <begin_pos>)/ (<array_size> -1.0))
    <local_array> = tantrum_array
    index = 0
    begin 
    SetArrayElement arrayName = local_array index = <index> newValue = {name = ((tantrum_array [ <index> ]).name)
        spazzfactor = (<index> * <spazz_interval> + <min>)
    }
    if NOT (<index> = (<array_size> -1))
        CreateScreenElement {
            type = SpriteElement
            parent = <tantrum_meter_anchor>
            rgba = [ 128 128 128 128 ]
            Pos = (<index> * <draw_interval> + <begin_pos>)
            just = [ center center ]
            Scale = 1
            texture = spazznotch
            z_priority = 30
        }
    endif
    index = (<index> + 1)
    repeat <array_size>
endscript

script GetHighestTantrumReached 
    if NOT GotParam \{ spazzfactor }
        return 
    endif
    GetArraySize \{ tantrum_array }
    index = (<array_size> -1)
    begin 
    if NOT (<spazzfactor> < ((tantrum_array [ <index> ]).spazzfactor))
        return tantrum = <index>
    endif
    index = (<index> - 1)
    repeat <array_size>
    return \{ tantrum = -1 }
endscript

script tantrum_update_meter current = 5 max = 10
    GetSkaterTantrumMeterAnchor
    if NOT ScreenElementExists id = <tantrum_meter_anchor>
        return 
    endif
    if <tantrum_meter_anchor> ::getsingletag dead
        return 
    endif
    percent = ((<current> / <max>)* 100)
    if NOT ScreenElementExists id = {<tantrum_meter_anchor> child = spazz_blood}
        SetScreenElementLock id = <tantrum_meter_anchor> Off
        CreateScreenElement {
            type = SpriteElement
            parent = <tantrum_meter_anchor>
            local_id = spazz_blood
            rgba = [ 110 11 11 110 ]
            Pos = (0.0, 0.0)
            just = [ left center ]
            Scale = 1
            texture = blood
            z_priority = 10
        }
        CreateScreenElement {
            type = SpriteElement
            parent = <tantrum_meter_anchor>
            local_id = spazz_blood_tip
            rgba = [ 110 11 11 110 ]
            Pos = (191.0, 0.0)
            just = [ RIGHT center ]
            Scale = (1.0, 0.8999999761581421)
            texture = bloodtip
            z_priority = 11
        }
    endif
    if (<current> > (tantrum_array [ 0 ].spazzfactor))
        if NOT <tantrum_meter_anchor> ::getsingletag in_the_zone
            <tantrum_meter_anchor> ::obj_spawnscriptlater SFX_TANTRUM_THERM_RANGE
            <tantrum_meter_anchor> ::settags in_the_zone
        endif
    else
        if <tantrum_meter_anchor> ::getsingletag in_the_zone
            <tantrum_meter_anchor> ::SFX_KILL_HEART_BEAT
        endif
        <tantrum_meter_anchor> ::removetags tags = [ in_the_zone ]
        <tantrum_meter_anchor> ::settags sound_pitch = ((<current> * 8)+ 80)
    endif
    if GotParam maxedOut
        percent = 100
        if NOT <tantrum_meter_anchor> ::getsingletag tantrum_explosion_tripped
            <tantrum_meter_anchor> ::settags tantrum_explosion_tripped
            tantrum_explosion
        endif
    else
        <tantrum_meter_anchor> ::removetags tags = [ tantrum_explosion_tripped ]
        if (<percent> < 0)
            percent = 0
        endif
    endif
    DoScreenElementMorph id = {<tantrum_meter_anchor> child = spazz_blood}Scale = (<percent> * (0.12200000137090683, 0.0) + (0.0, 0.8999999761581421))time = 0
    DoScreenElementMorph id = {<tantrum_meter_anchor> child = spazz_blood_tip}Pos = (<percent> * (2.0299999713897705, 0.0))time = 0
endscript

script SFX_TANTRUM_THERM_RANGE 
    printf \{ 'Playing Heart Beat while above spazz line!' }
    begin 
    playsound \{ SK6_BulletHeart_11 pitch = 150 vol = 150 }
    wait \{ 0.3500 seconds }
    repeat 
endscript

script SFX_KILL_HEART_BEAT 
    printf \{ 'Killing Heart Beat - dropped below, or ended animation' }
    obj_killspawnedscript \{ name = SFX_TANTRUM_THERM_RANGE }
endscript
