
script PedLogic_InitParams 
    if NOT GotParam STATE_DEFAULT
        printstruct <...> 
        script_assert 'pedlogic init requires a State_default setting.  Check the profile'
    endif
    removetags
    ClearEventHandler objectinattentionradius
    if NOT GotParam Navigation_mode
        <Navigation_mode> = PEDMOTION_STAND
    endif
    if NOT GotParam collision_mode
        <collision_mode> = ignore
    endif
    if NOT GotParam should_look_at_skater
        <should_look_at_skater> = 1
    endif
    <talking_mode> = friendly
    <talking_radius> = 30
    <collision_exception_return_state> = PedLogic_SetDefaultState
    <pissed> = 0
    settags <...> 
    obj_sticktoground distabove = 3 distbelow = 6
    obj_sticktoground Off
    PedLogic_InitMovement
    Ped_SetFlag PEDLOGIC_INITIALIZED
    Ped_SetFlag PEDLOGIC_RESET_EVENT_HANDLERS
endscript

script PedLogic_ResetParams 
    if Ped_IsFlagSet \{ PEDLOGIC_INITIALIZED }
        settags <...> 
        return 
    endif
    obj_getid
    printf 'WARNING: PedLogic_SetParams called on uninitialized Ped %s' s = <ObjID>
endscript

script PedLogic_InitMovement 
    if getsingletag \{ Navigation_mode }
        switch <Navigation_mode>
            case PEDMOTION_WAYPOINT
            obj_setpathturndist \{ 2.500 feet }
            if NOT getsingletag \{ Speed }
                Speed = randomrange (5.0, 10.0)
            endif
            obj_setpathvelocity <Speed> ips
            Ped_InitPath
            case PEDMOTION_SKATER
            Ped_SetIsSkater \{ 1 }
            obj_setpathturndist \{ 2.500 feet }
            if NOT getsingletag \{ Speed }
                Speed = 25
            endif
            obj_setpathvelocity <Speed> ips
            Ped_InitPath
        endswitch
    endif
endscript

script PedLogic_MatchSpeedtoAnim \{ anim = default }
    if GotParam \{ MovementSpeed }
        if getsingletag \{ Navigation_mode }
            switch <Navigation_mode>
                case PEDMOTION_WAYPOINT
                obj_setpathvelocity <MovementSpeed> ips
                case PEDMOTION_NAVMESH
            endswitch
        endif
    endif
endscript

script PedLogic_SetDefaultState 
    Ped_SetFlag PEDLOGIC_RESET_EVENT_HANDLERS
    if getsingletag TempDefaultState
        if getsingletag TempDefaultTable
            Ped_SetLogicState <TempDefaultState> table = <TempDefaultTable>
            return 
        endif
    endif
    if getsingletag STATE_DEFAULT
        Ped_SetLogicState <STATE_DEFAULT>
    else
        if getsingletag defaultanimname
            PedLogic_InitParams {STATE_DEFAULT = STATE_PASSIVE defaultanimname = <defaultanimname>}
            Ped_SetLogicState STATE_PASSIVE
            Ped_PlayAnim anim = <defaultanimname> Cycle
        else
            PedLogic_InitParams { STATE_DEFAULT = STATE_PASSIVE }
            Ped_SetLogicState STATE_PASSIVE
        endif
    endif
endscript

script PedLogic_RegisterTempDefaultState 
    if NOT GotParam \{ state }
        script_assert \{ 'Missing <State> param' }
    endif
    if NOT GotParam \{ table }
        script_assert \{ 'Missing <Table> param' }
    endif
    settags TempDefaultState = <state> TempDefaultTable = <table>
endscript

script PedLogic_UnregisterTempDefaultState 
    removetags \{tags = [ TempDefaultState TempDefaultTable ]}
endscript
