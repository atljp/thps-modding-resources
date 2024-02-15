compass_debug = 0
compass_max_blips = 64
compass_max_displays = 2
compass_bliptypes = {
    skater_arrow = {
        z_priority = 12
        rgba = [ 123 63 6 108 ]
        texture = bike_arrow
        pulse = 1
        legend_desc = 'Du'
    }
    goal_important = {
        z_priority = 12
        rgba = [ 128 0 0 128 ]
        texture = hud_comp_goal
        pulse = 1
        style = compass_pulse
        use_height_indicator
    }
    goal = {
        z_priority = 11
        rgba = [ 128 28 88 128 ]
        texture = hud_comp_goal
        pulse = 0
        legend_desc = 'Mission'
        use_height_indicator
    }
    bonus_goal = {
        z_priority = 11
        rgba = [ 88 28 128 128 ]
        texture = hud_comp_goal
        pulse = 0
        use_height_indicator
    }
    cash = {
        z_priority = 10
        rgba = [ 10 113 17 128 ]
        texture = HUD_comp_cash
        pulse = 0
        legend_desc = 'Geld'
        use_height_indicator
    }
    tagger = {
        z_priority = 9
        rgba = [ 121 82 9 128 ]
        texture = HUD_comp_graf
        pulse = 0
        legend_desc = 'Sprüher'
        use_height_indicator
    }
    bike = {
        z_priority = 8
        rgba = [ 128 128 128 108 ]
        texture = HUD_comp_bike
        pulse = 0
        legend_desc = 'BMX'
    }
    bike_training = {
        z_priority = 8
        rgba = [ 60 60 110 108 ]
        texture = HUD_comp_bike
        pulse = 0
        legend_desc = 'BMX-Fahren'
        use_height_indicator
    }
    CAT = {
        z_priority = 7
        rgba = [ 123 119 4 128 ]
        texture = HUD_comp_bulb
        pulse = 0
        legend_desc = 'Trickidee'
    }
    cas = {
        z_priority = 6
        rgba = [ 128 128 128 108 ]
        texture = HUD_comp_cas
        pulse = 0
        legend_desc = 'Outfit'
    }
    skateshop = {
        z_priority = 5
        rgba = [ 128 128 128 108 ]
        texture = HUD_comp_skateshop
        pulse = 0
        legend_desc = 'Skateshop'
    }
    barbershop = {
        z_priority = 5
        rgba = [ 30 40 113 108 ]
        texture = HUD_comp_cas
        pulse = 0
        legend_desc = 'Friseur'
    }
    accshop = {
        z_priority = 5
        rgba = [ 80 40 9 108 ]
        texture = HUD_comp_cas
        pulse = 0
        legend_desc = 'Accessories'
    }
    tattooshop = {
        z_priority = 5
        rgba = [ 55 10 70 108 ]
        texture = HUD_comp_cas
        pulse = 0
        legend_desc = 'Tattoos'
    }
    bus = {
        z_priority = 4
        rgba = [ 128 128 128 108 ]
        texture = HUD_comp_bus
        pulse = 0
        legend_desc = 'Bus'
    }
    transition = {
        z_priority = 3
        rgba = [ 125 22 5 128 ]
        texture = HUD_comp_transition
        pulse = 0
    }
    transition_locked = {
        z_priority = 3
        rgba = [ 125 22 5 128 ]
        texture = HUD_comp_transition
    }
    transition_unlocked = {
        z_priority = 3
        rgba = [ 38 121 9 128 ]
        texture = HUD_comp_transition
        pulse = 0
        legend_desc = 'Ausgang'
    }
}
compass_display_params = {
    on = 1
    width = 110.0
    minscale = 0.4000
    lr_flip = 0
    Angle = alpha
    mode = depth
    FOV = 270.0
    maxDist = 6000.0
    height = -18.0
    distance = Scale
}
compass_directions = [
    { name = NORTH Pos = (0.0, 0.0, -1.0) texture = HUD_comp_north }
    { name = east Pos = (1.0, 0.0, 0.0) texture = HUD_comp_east }
    { name = SOUTH Pos = (0.0, 0.0, 1.0) texture = HUD_comp_south }
    { name = west Pos = (-1.0, 0.0, 0.0) texture = HUD_comp_west }
]

script compass_create 
    obj_getid
    if NOT ScreenElementExists id = compass_anchor
        SetScreenElementLock id = root_window Off
        CreateScreenElement {
            type = ContainerElement
            parent = root_window
            id = compass_anchor
            not_focusable
        }
    endif
    SetScreenElementLock id = compass_anchor Off
    CreateScreenElement {
        type = ContainerElement
        parent = compass_anchor
        local_id = <ObjID>
        not_focusable
        just = [ center top ]
        Pos = (320.0, 42.0)
    }
    compass_create_bg id = <id>
endscript

script compass_create_bg \{texture = HUD_comp_background_2 id = { compass_anchor child = 0 }Scale = (4.0, 2.0)}
    SetScreenElementLock id = <id> Off
    CreateScreenElement {
        type = SpriteElement
        parent = <id>
        local_id = bG
        texture = <texture>
        Pos = (0.0, 0.0)
        just = [ center center ]
        Scale = <Scale>
        alpha = 0.7000
        rgba = [ 128 128 128 128 ]
        z_priority = 2
    }
endscript

script compass_create_item z_priority = 1 rgba = [ 128 128 128 0 ]
    obj_getid
    compass_id = {compass_anchor child = <ObjID>}
    if GotParam compassbliptype
        z_priority = (compass_bliptypes.<compassbliptype>.z_priority)
        rgba = (compass_bliptypes.<compassbliptype>.rgba)
        texture = (compass_bliptypes.<compassbliptype>.texture)
        pulse = (compass_bliptypes.<compassbliptype>.pulse)
        if StructureContains structure = (compass_bliptypes.<compassbliptype>)use_height_indicator
            use_height_indicator = 1
        endif
        if StructureContains structure = (compass_bliptypes.<compassbliptype>)style
            style = (compass_bliptypes.<compassbliptype>.style)
        endif
    endif
    SetScreenElementLock id = <compass_id> Off
    CreateScreenElement {
        type = ContainerElement
        parent = <compass_id>
        z_priority = <z_priority>
        Pos = (0.0, 0.0)
        alpha = 0
        not_focusable
    }
    anchor = <id>
    CreateScreenElement {
        type = SpriteElement
        parent = <anchor>
        texture = <texture>
        Pos = (0.0, 0.0)
        just = [ center center ]
        Scale = (1.0, 1.0)
        rgba = <rgba>
        alpha = 1
        not_focusable
    }
    if GotParam style
        RunScriptOnScreenElement id = <id> <style>
    endif
    if GotParam use_height_indicator
        CreateScreenElement {
            type = SpriteElement
            parent = <anchor>
            texture = up_arrow
            Pos = (0.0, 0.0)
            just = [ center center ]
            Scale = (0.6000000238418579, 0.5)
            rgba = [ 128 128 128 128 ]
            alpha = 0
            not_focusable
        }
        arrow_id = <id>
    endif
    return {id = <anchor> arrow_id = <arrow_id>}
endscript

script hide_compass_anchor 
    if GetGlobalFlag \{ flag = NO_DISPLAY_COMPASS }
        return 
    endif
    if ScreenElementExists \{ id = compass_anchor }
        compass_anchor ::DoMorph \{ alpha = 0 }
    endif
endscript

script show_compass_anchor 
    if GetGlobalFlag \{ flag = NO_DISPLAY_COMPASS }
        return 
    endif
    if ScreenElementExists \{ id = compass_anchor }
        compass_anchor ::DoMorph \{ alpha = 1 }
    endif
endscript

script compass_pulse 
    begin 
    DoMorph \{ Scale = 0.8000 time = 0.4000 }
    DoMorph Scale = 1.300 time = 0.3000 rot_angle = randomrange (-10.0, 10.0)
    repeat 
endscript
