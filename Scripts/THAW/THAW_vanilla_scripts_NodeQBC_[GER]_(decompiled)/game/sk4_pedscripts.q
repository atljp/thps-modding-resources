
script Ped_SetDefaults 
    ClearEventHandler objectinattentionradius
    settags collision_mode = ignore
    settags talking_mode = friendly
    settags move_type = walk
    settags is_goal_ped = 0
    settags talking_radius = 30
    settags collision_exception_return_state = Ped_StateLogic_SetDefaultState
    settags pissed = 0
    settags should_look_at_skater = 1
    settags ped_init = 1
    if GotParam skater
        settags { move_type = skate }
        settags {Navigation_mode = PEDMOTION_SKATER STATE_DEFAULT = STATE_skating}
        Ped_SetIsSkater 1
    else
        if GotParam stand
            settags { move_type = stand }
            settags {Navigation_mode = PEDMOTION_STAND STATE_DEFAULT = STATE_standing}
        else
            settags move_type = walk
        endif
    endif
endscript

script Ped_InitAI 
    if Ped_IsFlagSet \{ PEDLOGIC_INITIALIZED }
        return 
    endif
    SK4_PedScript <...> 
endscript

script SK4_PedScript 
    Ped_SetDefaults <...> 
    settags <...> 
    if GotParam avoid
        settags collision_mode = avoid
    endif
    if GotParam fall
        settags collision_mode = fall
    endif
    if GotParam shot
        settags collision_mode = shot
    endif
    if GotParam knock
        settags collision_mode = knock
    endif
    if GotParam bump
        settags collision_mode = bump
    endif
    if GotParam ignore
        settags collision_mode = ignore
    endif
    if GotParam friendly
        settags talking_mode = friendly
    endif
    if GotParam mean
        settags talking_mode = mean
    endif
    if GotParam explode
        settags collision_mode = explode
    endif
    if GotParam goalped
        settags is_goal_ped = 1
    endif
    obj_sticktoground distabove = 3 distbelow = 6
    obj_sticktoground Off
    ped_initialize_movement <...> 
    if NOT GotParam stand
        Ped_InitPath
    endif
    Ped_SetFlag PEDLOGIC_INITIALIZED
    Ped_StateLogic_SetDefaultState
endscript

script ped_initialize_movement 
    if getsingletag \{ move_type }
        if NOT (<move_type> = stand)
            obj_setpathturndist \{ 2.500 feet }
            getsingletag \{ Speed }
            if (<move_type> = skate)
                if NOT GotParam \{ Speed }
                    Speed = 25
                endif
            else
                if NOT GotParam \{ Speed }
                    Speed = randomrange (5.0, 10.0)
                endif
            endif
            obj_setpathvelocity <Speed> ips
        endif
    endif
endscript
