

script create_ammo_meter 
    if NOT IsObjectScript
        script_assert 'Needs to be an object script'
    endif
    obj_getid
    if ChecksumEquals a = <ObjID> b = 0
        id = 0
    else
        id = 1
    endif
    Pos = (145.0, 45.0)
    Scale = (0.8299999833106995, 1.1799999475479126)
    parent = (the_score_sprite + <id>)
    if NOT ScreenElementExists id = <parent>
        return 
    endif
    get_ammo_meter_name
    if ScreenElementExists id = <ammo_meter_name>
        DestroyScreenElement id = <ammo_meter_name>
    endif
    SetScreenElementLock id = <parent> Off
    get_ammo_texture type = <type>
    CreateScreenElement {
        type = SpriteElement
        parent = <parent>
        id = <ammo_meter_name>
        texture = <ammo_texture>
        Pos = <Pos>
        just = [ center center ]
        Scale = <Scale>
        rgba = [ 128 128 128 128 ]
    }
    GetScreenElementDims id = <id>
    CreateScreenElement {
        type = TextElement
        parent = <ammo_meter_name>
        local_id = counter
        text = '0'
        font = testtitle
        Pos = (<width> * (0.6200000047683716, 0.0) + <height> * (0.0, 0.5))
        just = [ center center ]
        Scale = 0.9000
        rgba = [ 128 128 128 128 ]
    }
    DoScreenElementMorph id = <ammo_meter_name> alpha = 0 time = 0
endscript


script get_ammo_meter_name 
    if NOT IsObjectScript
        script_assert 'Needs to be an object script'
    endif
    obj_getid
    if ChecksumEquals a = <ObjID> b = 0
        id = player1_ammo_display
    else
        id = player2_ammo_display
    endif
    return ammo_meter_name = <id>
endscript


script get_ammo_texture 
    switch <type>
        case apple
        ammo_texture = pickup_apple
        case tomato
        ammo_texture = pickup_tomato
        case paintcan
        ammo_texture = pickup_spraycan
        case shrimp
        ammo_texture = pickup_shrimp
        case beads
        ammo_texture = pickup_beads
        case cocktail
        case smokebomb
        ammo_texture = pickup_cocktail
        default 
        ammo_texture = white2
    endswitch
    return ammo_texture = <ammo_texture>
endscript


script ammo_meter_change 
    if NOT GotParam count
        return 
    endif
    if (<count> = 0)
        return 
    endif
    if (<count> < 0)
        abscount = (<count> * -1)
        dir = -1
    else
        abscount = <count>
        dir = 1
    endif
    GetAmmo
    index = (<Ammo> - <count>)
    timer = (1.200 / <abscount>)
    get_ammo_meter_name
    begin 
    if NOT ScreenElementExists id = <ammo_meter_name>
        return 
    endif
    index = (<index> + <dir>)
    if (<index> < 0)
        return 
    endif
    FormatText textname = Ammo '%a' a = <index>
    TerminateObjectsScripts id = <ammo_meter_name> script_name = ammo_meter_increase
    TerminateObjectsScripts id = <ammo_meter_name> script_name = ammo_meter_decrease
    if (<count> < 0)
        RunScriptOnScreenElement id = <ammo_meter_name> ammo_meter_decrease params = {text = <Ammo> index = <index>}
    else
        RunScriptOnScreenElement id = <ammo_meter_name> ammo_meter_increase params = { text = <Ammo> }
    endif
    wait <timer> seconds
    repeat <abscount>
endscript


script ammo_meter_increase 
    gettags
    SetScreenElementProps id = {<id> child = counter}text = <text>
    DoMorph Scale = 0 alpha = 1 relative_scale
    DoMorph Scale = 1.500 relative_scale time = 0.2000
    DoMorph Scale = 1 relative_scale time = 0.1500
endscript


script ammo_meter_decrease 
    gettags
    DoMorph Scale = 1 alpha = 1 relative_scale
    DoMorph Scale = 0 relative_scale time = 0.1500
    if NOT (<index> = 0)
        SetScreenElementProps id = {<id> child = counter}text = <text>
        DoMorph Scale = 1 relative_scale time = 0
    endif
endscript

