

script pedanim_init 
    settags <...> 
endscript


script ped_play_wave_anim 
    Ped_Utils_GetAnimName type = idle
    if obj_animequals <AnimName>
        Ped_Utils_GetAnimName type = Wave
        PlayAnimWithPartialAnimIfExists anim = <AnimName>
        if NOT GotParam no_block
            Obj_WaitAnimFinished
        endif
    endif
endscript


script ped_play_idle_anim 
    Ped_Utils_GetAnimName type = idleanims
    PlayAnimWithPartialAnimIfExists anim = <AnimName>
    if NOT GotParam no_block
        Obj_WaitAnimFinished
    endif
endscript


script ped_play_disgust_anim 
    Ped_Utils_GetAnimName type = DisgustAnims
    PlayAnimWithPartialAnimIfExists anim = <AnimName>
    if NOT GotParam no_block
        Obj_WaitAnimFinished
    endif
endscript


script ped_play_attack_anim 
    Ped_Utils_GetAnimName type = AttackAnims
    PlayAnimWithPartialAnimIfExists anim = <AnimName>
    if NOT GotParam no_block
        Obj_WaitAnimFinished
    endif
endscript


script ped_play_falldown_anim 
    Ped_Utils_GetAnimName type = FallDownAnims
    PlayAnimWithPartialAnimIfExists anim = <AnimName>
    if GotParam index
        settags fallDownAnimIndex = <index>
    endif
    if NOT GotParam no_block
        Obj_WaitAnimFinished
    endif
endscript


script ped_play_layidle_anim 
    if getsingletag fallDownAnimIndex
        Ped_Utils_GetAnimName type = LayIdleAnims index = <fallDownAnimIndex>
    else
        Ped_Utils_GetAnimName type = LayIdleAnims
    endif
    PlayAnimWithPartialAnimIfExists anim = <AnimName>
    if NOT GotParam no_block
        Obj_WaitAnimFinished
    endif
endscript


script ped_play_getup_anim 
    if getsingletag fallDownAnimIndex
        Ped_Utils_GetAnimName type = GetupAnims index = <fallDownAnimIndex>
    else
        Ped_Utils_GetAnimName type = GetupAnims
    endif
    PlayAnimWithPartialAnimIfExists anim = <AnimName>
    if NOT GotParam no_block
        Obj_WaitAnimFinished
    endif
endscript


script ped_play_walking_wave_anim 
    ped_in_front_of_skater
    if (<in_front>)
        Random (
            @ 
            Ped_Utils_GetAnimName type = WalkingWave
            PlayAnimWithPartialAnimIfExists anim = <AnimName>
            @*4 
            Ped_Utils_GetAnimName type = WalkAnims
            PlayAnimWithPartialAnimIfExists anim = <AnimName>
        )
    else
        Ped_Utils_GetAnimName type = WalkAnims
        PlayAnimWithPartialAnimIfExists anim = <AnimName>
    endif
    Obj_WaitAnimFinished
endscript


script ped_mode_play_wave_anim 
    ped_rotate_to_skater_from_idle
    switch <talking_mode>
        case friendly
        Ped_Utils_GetAnimName type = WalkAnims
        PlayAnimWithPartialAnimIfExists anim = <AnimName>
        Obj_WaitAnimFinished
        case mean
        ped_play_disgust_anim
    endswitch
endscript


script ped_start_movement 
    getsingletag move_type
    if (<move_type> = stand)
        Ped_Utils_GetAnimName type = idle
        PlayAnimWithPartialAnimIfExists anim = <AnimName> Cycle
    else
        Ped_Utils_GetAnimName type = WalkAnims index = 0
        if NOT obj_animequals <AnimName>
            obj_setanimcyclemode Off
            Obj_WaitAnimFinished
            ped_rotate_to_node_from_idle
            obj_setanimcyclemode Off
            Ped_Utils_GetAnimName type = IdleToWalk
            PlayAnimWithPartialAnimIfExists anim = <AnimName>
            Obj_WaitAnimFinished
        else
        endif
        Ped_Utils_GetAnimName type = WalkAnims
        PlayAnimWithPartialAnimIfExists anim = <AnimName> Cycle
    endif
endscript


script ped_stop_movement 
    <playing_walk_anim> = 0
    Ped_Utils_GetAnimName type = WalkAnims index = 0
    if obj_animequals <AnimName>
        <playing_walk_anim> = 1
    endif
    Ped_Utils_GetAnimName type = WalkingWave
    if obj_animequals <AnimName>
        <playing_walk_anim> = 1
    endif
    if (<playing_walk_anim> = 1)
        obj_setanimcyclemode Off
        Obj_WaitAnimFinished
        Ped_Utils_GetAnimName type = WalkToIdle
        PlayAnimWithPartialAnimIfExists anim = <AnimName>
        Obj_WaitAnimFinished
    endif
endscript


script ped_rotate_to_skater_from_idle time = 0.3000
    if obj_angletonearestskatergreaterthan 15
        if Obj_LookAtObject type = skater time = <time>
            Ped_Utils_GetAnimName type = RotateFromIdle1
            PlayAnimWithPartialAnimIfExists anim = <AnimName>
            Obj_WaitRotate
            obj_setanimcyclemode Off
            Obj_WaitAnimFinished
        endif
    endif
endscript


script ped_rotate_to_node_from_idle time = 0.3000
    if obj_lookatnodelinked time = <time>
        Ped_Utils_GetAnimName type = RotateFromIdle1
        PlayAnimWithPartialAnimIfExists anim = <AnimName>
        Obj_WaitRotate
        obj_setanimcyclemode Off
        Obj_WaitAnimFinished
    endif
endscript


script ped_in_front_of_skater 
    <retVal> = 0
    obj_getorientationtoobject skater
    if (<dotprod> < 0.5000)
        if (<dotprod> > -0.5000)
            <retVal> = 1
        endif
    endif
    return in_front = <retVal>
endscript

