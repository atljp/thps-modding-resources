SkaterPed_StateTable = {
    STATE_skating = { script_ped_state = ped_skater_idle }
    STATE_stop = { script_ped_state = ped_skater_stop }
    STATE_bail = { Navigation_mode = PEDMOTION_BAIL script_ped_state = ped_skater_generic_bail }
    STATE_bailgrind = { Navigation_mode = PEDMOTION_BAIL script_ped_state = ped_skater_grind_bail }
    STATE_tricklip = { Navigation_mode = PEDMOTION_LIPTRICK script_ped_state = ped_skater_lip_trick }
    STATE_trickgrab = { script_ped_state = ped_skater_grab_trick }
    STATE_trickflip = { script_ped_state = ped_skater_flip_trick }
    STATE_grind = { script_ped_state = ped_skater_grind }
    STATE_grindoff = { script_ped_state = ped_skater_grind_off }
    STATE_land = { script_ped_state = ped_skater_land }
    STATE_manual = { script_ped_state = ped_skater_manual }
    STATE_manualdown = { script_ped_state = ped_skater_manual_down }
    STATE_jump = { script_ped_state = ped_skater_jump }
    STATE_jumpvert = { script_ped_state = ped_skater_vert_jump }
    STATE_jumpcrouch = { script_ped_state = ped_skater_crouch_for_jump }
    STATE_rolloff = { script_ped_state = ped_skater_roll_off }
}

script ped_skater_grind 
    obj_shadowshow \{ hide }
    Ped_ApplySpeedBoost \{ percent = 150 }
    PedLogic_GetAnimName \{ type = GrindStruct }
    goto (<AnimName>.TrickScript)
endscript

script Ped_Skater_BeginGrind 
    <init_anim> = <InitAnim>
    <range_anim> = <anim>
    <out_anim> = <OutAnim>
    <bail_script> = <grindbail>
    settags {
        grind_init_anim = <init_anim>
        grind_range_anim = <range_anim>
        grind_out_anim = <out_anim>
        bail_script = <bail_script>
    }
    Ped_PlayAnim anim = <init_anim>
    Ped_WaitAnimFinished
    <wobble_to> = Random (@ start @ end)
    Ped_PlayAnim anim = <range_anim> pingpong from = current to = <wobble_to> Speed = 0.9000 BlendPeriod = 0.4000
endscript

script ped_skater_grind_off 
    if getsingletag \{ grind_out_anim }
        Ped_PlayAnim anim = <grind_out_anim>
    else
        getsingletag \{ grind_init_anim }
        Ped_PlayAnim anim = <grind_init_anim> backwards
    endif
    Ped_SetLogicState \{ STATE_rolloff table = SkaterPed_StateTable }
endscript

script ped_skater_grind_bail 
    SpawnSound \{ Ped_Skater_Grind_Bail_Sound }
    if getsingletag \{ bail_script }
        settags \{ BailType = grind }
        goto <bail_script>
    endif
endscript

script Ped_Skater_BeginBail 
    <CrntBailAnim> = <anim1>
    <CrntGetUpAnim> = <Endpose>
    Ped_SetIsBailing 1
    if getsingletag BailType
        if (<BailType> = grind)
            Ped_SetIsBailing grind 1
        endif
    endif
    Ped_HideBoard 1
    Ped_StoreMaxVelocity
    obj_setpathdeceleration ped_skater_bail_deceleration
    obj_setpathvelocity 0
    Ped_PlayAnim anim = <CrntBailAnim> BlendPeriod = 0.3000
    Ped_WaitAnimFinished
    PedLogic_GetAnimName type = LayIdle
    Ped_PlayAnim anim = <AnimName> Cycle
    begin 
    if NOT obj_objectinradius type = skater Radius = 3
        break 
    endif
    wait 1 second
    repeat 
    Ped_PlayAnim anim = <CrntGetUpAnim> BlendPeriod = 0.4000
    Ped_WaitAnimFinished
    Ped_GetOriginalMaxVelocity
    obj_setpathvelocity <original_max_velocity> ips
    Ped_SetIsBailing 0
    if GotParam BailType
        if (<BailType> = grind)
            Ped_SetIsBailing grind 0
            Ped_SetIsGrinding 1
        endif
    endif
    Ped_HideBoard 0
    obj_setpathdeceleration 0
    Ped_SetLogicState STATE_skating table = SkaterPed_StateTable
endscript

script ped_skater_crouch_for_jump 
    PedLogic_GetAnimName \{ type = crouch }
    Ped_PlayAnim anim = <AnimName>
    Ped_WaitAnimFinished
    PedLogic_GetAnimName \{ type = CrouchIdle }
    Ped_PlayAnim anim = <AnimName> Cycle
endscript

script ped_skater_jump 
    obj_shadowshow \{ hide }
    Ped_PlayJumpSound
    Ped_ActivateAuxScript \{name = ped_skater_play_midair_anim params = { anim = ollie }}
    Ped_WaitAnimFinished
    Ped_DeactivateAuxScript
    Ped_PlayLandSound
    Ped_RemoveSpeedBoost
    if GotParam \{ land_height }
        if GotParam \{ should_land }
            Ped_SetLogicState \{ STATE_land table = SkaterPed_StateTable }
        endif
        Ped_HitWaypoint
    else
        Ped_SetLogicState \{ STATE_land table = SkaterPed_StateTable }
    endif
endscript

script ped_skater_vert_jump 
    obj_shadowshow \{ hide }
    PedLogic_GetAnimName \{ type = ollie }
    Ped_PlayAnim anim = <AnimName>
    Ped_PlayJumpSound
    Ped_WaitAnimFinished
    PedLogic_GetAnimName \{ type = Air }
    Ped_PlayAnim anim = <AnimName> Cycle
    Ped_PlayLandSound
    if GotParam \{ should_flip }
        Ped_Flip
    endif
    PedLogic_GetAnimName \{ type = CrouchedLand }
    Ped_SetLogicState STATE_land table = SkaterPed_StateTable StateParams = { anim = <AnimName> }
endscript

script ped_skater_roll_off 
    obj_shadowshow \{ hide }
    Ped_GetCurrentVelocity
    Ped_WaitAnimFinished
    Ped_PlayLandSound
    Ped_SetLogicState \{ STATE_land table = SkaterPed_StateTable }
endscript

script ped_skater_grab_trick 
    obj_shadowshow hide
    if NOT GotParam anim
        PedLogic_GetAnimName type = GrabTrickStruct
        <anim> = (<AnimName>.anim)
        <idle_anim> = (<AnimName>.idle)
        if StructureContains structure = <AnimName> OutAnim
            <out_anim> = (<AnimName>.OutAnim)
        endif
    endif
    Ped_PlayJumpSound
    Ped_PlayAnim anim = <anim>
    Ped_ActivateAuxScript name = ped_skater_wait_and_stop_grab_anim params = <...> 
    Ped_WaitAnimFinished
    Ped_PlayLandSound
    Ped_DeactivateAuxScript
    if GotParam is_vert
        if GotParam should_flip
            Ped_Flip
        endif
        PedLogic_GetAnimName type = CrouchedLand
    else
        PedLogic_GetAnimName type = land
    endif
    Ped_SetLogicState STATE_land table = SkaterPed_StateTable StateParams = { anim = <AnimName> }
endscript

script ped_skater_stop 
    Ped_StoreMaxVelocity
    if NOT GotParam deceleration
        <deceleration> = ped_skater_stop_deceleration
    endif
    obj_setpathdeceleration <deceleration>
    obj_setpathvelocity 0
    begin 
    Ped_GetCurrentVelocity
    if (<velocity> = 0)
        break 
    endif
    wait 1 frame
    repeat 
    PedLogic_GetAnimName type = braking
    Ped_PlayAnim anim = <AnimName>
    Ped_WaitAnimFinished
    if GotParam RandomStopTime
        <StopTime> = randomrange (1.0, 30.0)
    endif
    if GotParam StopTime
        if (<StopTime> > 0)
            Ped_ActivateAuxScript name = ped_skater_wait_and_start_moving params = { StopTime = <StopTime> }
        endif
    endif
    begin 
    PedLogic_GetAnimName type = braking
    Ped_PlayAnim anim = <AnimName>
    Ped_WaitAnimFinished
    repeat 
endscript

script ped_skater_manual 
    if NOT GotParam <ManualType>
        <ManualType> = default
    endif
    PedLogic_GetAnimName \{ type = ManualStruct }
    <SubType> = (<AnimName>.<ManualType>)
    settags manual_out_anim = (<SubType>.manual_out_anim)
    Ped_PlayAnim anim = (<SubType>.init_anim)
    Ped_WaitAnimFinished
    Ped_PlayAnim anim = (<SubType>.range_anim)pingpong from = start to = end Speed = 1.100 BlendPeriod = 0.4000
    obj_shadowshow
endscript

script ped_skater_manual_down 
    obj_shadowshow
    if NOT getsingletag \{ manual_out_anim }
        PedLogic_GetAnimName \{ type = ManualStruct }
        <manual_out_anim> = (<AnimName>.default.manual_out_anim)
    endif
    Ped_PlayAnim anim = <manual_out_anim>
    Ped_WaitAnimFinished
    Ped_SetLogicState \{ STATE_skating table = SkaterPed_StateTable }
endscript

script ped_skater_lip_trick 
    obj_shadowshow \{ hide }
    PedLogic_GetAnimName \{ type = LipTrickStruct }
    Ped_PlayAnim anim = (<AnimName>.InitAnim)
    if NOT GotParam \{ HoldLipTime }
        <HoldLipTime> = randomrange (1.0, 3.0)
    endif
    wait <HoldLipTime> seconds
    Ped_PlayAnim anim = (<AnimName>.OutAnim)
    Ped_WaitAnimFinished
    Ped_SetLogicState \{ STATE_land table = SkaterPed_StateTable }
endscript

script ped_skater_flip_trick 
    obj_shadowshow hide
    if GotParam is_vert
    endif
    if (<is_jumping> = 0)
        PedLogic_GetAnimName type = ollie
        Ped_PlayAnim anim = <AnimName>
        Ped_PlayJumpSound
        wait 8 frame
    endif
    if NOT GotParam anim
        PedLogic_GetAnimName type = FlipTrick
        <anim> = (<AnimName>)
    endif
    Ped_ActivateAuxScript name = ped_skater_play_midair_anim params = { anim = <anim> }
    Ped_WaitAnimFinished
    Ped_DeactivateAuxScript
    Ped_PlayLandSound
    if GotParam is_vert
        PedLogic_GetAnimName type = CrouchedLand
    else
        PedLogic_GetAnimName type = land
    endif
    if GotParam land_height
        Ped_HitWaypoint
    endif
    Ped_SetLogicState STATE_land table = SkaterPed_StateTable StateParams = { anim = <AnimName> }
endscript

script ped_skater_land 
    obj_shadowshow
    if NOT GotParam \{ anim }
        PedLogic_GetAnimName \{ type = land }
        <anim> = <AnimName>
    endif
    Ped_PlayAnim anim = <anim>
    Ped_WaitAnimFinished
    Ped_SetLogicState \{ STATE_skating table = SkaterPed_StateTable }
endscript

script ped_skater_idle 
    getsingletag skater_override_anim
    if GotParam skater_override_anim
        Ped_PlayAnim anim = <skater_override_anim> Cycle dontinterrupt
    endif
    begin 
    PedLogic_GetAnimName type = SkateIdle
    <anim_struct> = <AnimName>
    RemoveParameter init_anim
    RemoveParameter anim
    RemoveParameter Cycle
    RemoveParameter out_anim
    if StructureContains structure = <anim_struct> init_anim
        <init_anim> = (<anim_struct>.init_anim)
    endif
    <anim> = (<anim_struct>.anim)
    if StructureContains structure = <anim_struct> Cycle
        <Cycle> = (<anim_struct>.Cycle)
    else
        <Cycle> = 1
    endif
    if StructureContains structure = <anim_struct> out_anim
        <out_anim> = (<anim_struct>.out_anim)
    endif
    if (GotParam init_anim)
        Ped_PlayAnim anim = <init_anim>
        Ped_WaitAnimFinished
    endif
    begin 
    Ped_PlayAnim anim = <anim>
    Ped_WaitAnimFinished
    repeat <Cycle>
    if GotParam out_anim
        Ped_PlayAnim anim = <out_anim>
        Ped_WaitAnimFinished
    endif
    repeat 
endscript

script ped_skater_generic_bail 
    getsingletag grind_bail_anim
    if NOT GotParam grind_bail_anim
        PedLogic_GetAnimName type = BailDefault
        <grind_bail_anim> = <AnimName>
        PedLogic_GetAnimName type = BailGetupDefault
        <grind_get_up_anim> = <AnimName>
    else
        getsingletag grind_get_up_anim
    endif
    Ped_SetIsBailing 1
    Ped_StoreMaxVelocity
    obj_setpathdeceleration ped_skater_bail_deceleration
    obj_setpathvelocity 0
    Ped_PlayAnim anim = <grind_bail_anim> BlendPeriod = 0.3000
    Ped_WaitAnimFinished
    Ped_PlayAnim anim = <grind_get_up_anim> BlendPeriod = 0.1000
    Ped_WaitAnimFinished
    Ped_GetOriginalMaxVelocity
    obj_setpathvelocity <original_max_velocity> ips
    Ped_SetIsBailing 0
    Ped_SetLogicState STATE_skating table = SkaterPed_StateTable
endscript

script ped_skater_start_moving 
    getsingletag \{ ped_skater_acceleration }
    if GotParam \{ ped_skater_acceleration }
        obj_setpathacceleration <ped_skater_acceleration>
    endif
    Ped_GetOriginalMaxVelocity
    obj_setpathvelocity <original_max_velocity> ips
    PedLogic_GetAnimName \{ type = braking }
    Ped_PlayAnim anim = <AnimName>
    Ped_WaitAnimFinished
endscript

script ped_skater_play_midair_anim 
    Ped_PlayAnim anim = <anim>
    Ped_WaitAnimFinished
    PedLogic_GetAnimName \{ type = Air }
    Ped_PlayAnim anim = <AnimName> Cycle
endscript

script ped_skater_wait_and_stop_grab_anim 
    if GotParam \{ jumpTime }
        wait (<jumpTime> * 0.5000)seconds
        if GotParam \{ out_anim }
            Ped_PlayAnim anim = <out_anim>
            Ped_WaitAnimFinished
        else
            Ped_PlayAnim anim = <anim> backwards
            Ped_WaitAnimFinished
        endif
        PedLogic_GetAnimName \{ type = Air }
        Ped_PlayAnim anim = <AnimName> Cycle
    endif
endscript

script ped_skater_wait_and_start_moving 
    wait <StopTime> seconds
    Ped_SetLogicState \{ STATE_skating table = SkaterPed_StateTable }
endscript
