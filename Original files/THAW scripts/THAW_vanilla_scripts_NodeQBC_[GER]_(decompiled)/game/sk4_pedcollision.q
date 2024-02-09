
script ped_initialize_collision_exceptions 
    gettags
    switch <collision_mode>
        case fall
        obj_setinneravoidradius 4
        seteventhandler {
            Ex = objectinavoidradius
            scr = PedLogic_EventHandler params = {setstate = STATE_fall event = objectinavoidradius}
        }
        case knock
        obj_setinneravoidradius 2
        seteventhandler {
            Ex = objectinavoidradius
            scr = PedLogic_EventHandler params = {setstate = STATE_knockdown event = objectinavoidradius}
        }
        case avoid
        obj_setinneravoidradius 8
        seteventhandler {
            Ex = objectinavoidradius
            scr = PedLogic_EventHandler params = {setstate = STATE_avoidstop event = objectinavoidradius}
        }
        case bump
        obj_setinneravoidradius 2
        Obj_SetException {
            Ex = objectinavoidradius
            scr = goal_pro_bounce_skater
        }
        case shot
        obj_setinneravoidradius 8
        seteventhandler {
            Ex = objectinavoidradius
            scr = PedLogic_EventHandler params = {setstate = STATE_shot event = objectinavoidradius}
        }
        case explode
        obj_setinneravoidradius 4
        seteventhandler {
            Ex = objectinavoidradius
            scr = PedLogic_EventHandler params = {setstate = STATE_Explode event = objectinavoidradius}
        }
        case ignore
        Obj_ClearException objectinavoidradius
        default 
        Obj_ClearException objectinavoidradius
    endswitch
    ped_initialize_projectile_exceptions
endscript

script ped_initialize_projectile_exceptions 
    gettags
    if NOT GotParam \{ skater }
        seteventhandler \{Ex = ProjectileInAvoidRadius scr = PedLogic_EventHandler params = { setstate = STATE_shot event = ProjectileInAvoidRadius }}
    endif
endscript

script ped_return_to_precollision_state 
    settags \{ pissed = 0 }
    PedLogic_ResetEventHandlers
    ped_initialize_collision_exceptions
    if getsingletag \{ collision_exception_return_state }
        goto <collision_exception_return_state>
    else
        PedLogic_SetDefaultState
    endif
endscript
