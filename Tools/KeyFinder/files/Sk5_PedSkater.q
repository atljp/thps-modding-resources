
SkaterPed_StateTable = {
    STATE_skating = {
        ped_update_type = skater_move_update
        script_ped_state = ped_skater_idle
    }
    STATE_stop = {
        script_ped_state = ped_skater_stop
    }
    STATE_bail = {
        ped_update_type = bail_move_update
        script_ped_state = ped_skater_generic_bail
    }
    STATE_bailgrind = {
        ped_update_type = bail_move_update
        script_ped_state = ped_skater_grind_bail
    }
    STATE_tricklip = {
        ped_update_type = lip_trick_update
        script_ped_state = ped_skater_lip_trick
    }
    STATE_trickgrab = {
        ped_update_type = skater_move_update
        script_ped_state = ped_skater_grab_trick
    }
    STATE_trickflip = {
        script_ped_state = ped_skater_flip_trick
    }
    STATE_grind = {
        ped_update_type = skater_move_update
        script_ped_state = ped_skater_grind
    }
    STATE_grindoff = {
        ped_update_type = skater_move_update
        script_ped_state = ped_skater_grind_off
    }
    STATE_land = {
        ped_update_type = skater_move_update
        script_ped_state = ped_skater_land
    }
    STATE_manual = {
        ped_update_type = skater_move_update
        script_ped_state = ped_skater_manual
    }
    STATE_manualdown = {
        ped_update_type = skater_move_update
        script_ped_state = ped_skater_manual_down
    }
    STATE_jump = {
        ped_update_type = skater_move_update
        script_ped_state = ped_skater_jump
    }
    STATE_jumpvert = {
        ped_update_type = skater_move_update
        script_ped_state = ped_skater_vert_jump
    }
    STATE_jumpcrouch = {
        ped_update_type = skater_move_update
        script_ped_state = ped_skater_crouch_for_jump
    }
    STATE_rolloff = {
        script_ped_state = ped_skater_roll_off
    }
}

script ped_skater_grind 
    obj_shadowoff
    Ped_ApplySpeedBoost percent = 135
    GetRandomArrayElement ped_skater_grind_tricks
    goto (<element>.TrickScript)
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
    Obj_PlayAnim anim = <init_anim>
    Obj_WaitAnimFinished
    <wobble_to> = Random (@ start @ end)
    Obj_PlayAnim anim = <range_anim> pingpong from = current to = <wobble_to> Speed = 0.9000 BlendPeriod = 0.4000
endscript


script ped_skater_grind_off 
    if getsingletag grind_out_anim
        Obj_PlayAnim anim = <grind_out_anim>
    else
        getsingletag grind_init_anim
        Obj_PlayAnim anim = <grind_init_anim> backwards
    endif
    Ped_SetLogicState STATE_rolloff table = SkaterPed_StateTable
endscript


script ped_skater_grind_bail 
    SpawnSound Ped_Skater_Grind_Bail_Sound
    if getsingletag bail_script
        settags BailType = grind
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
    Obj_PlayAnim anim = <CrntBailAnim> norestart BlendPeriod = 0.3000
    Obj_WaitAnimFinished
    Obj_PlayAnim anim = Ped_M_LayIdleE Cycle
    begin 
    if NOT obj_objectinradius type = skater Radius = 3
        break 
    endif
    wait 1 second
    repeat 
    Obj_PlayAnim anim = <CrntGetUpAnim> BlendPeriod = 0.4000
    Obj_WaitAnimFinished
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
    Obj_PlayAnim anim = crouch
    Obj_WaitAnimFinished
    Obj_PlayAnim anim = CrouchIdle Cycle
endscript


script ped_skater_jump 
    obj_shadowoff
    if NOT GotParam JumpSpeed
        <JumpSpeed> = ped_skater_jump_speed
    endif
    Ped_PlayJumpSound
    if GotParam land_height
        obj_jump {Speed = <JumpSpeed>
            gravity = ped_skater_jump_gravity
            heading = <heading>
            land_height = <land_height>
        }
    else
        obj_jump {
            Speed = <JumpSpeed>
            gravity = ped_skater_jump_gravity
        }
    endif
    Ped_ActivateAuxScript name = ped_skater_play_midair_anim params = { anim = ollie }
    obj_waitjumpfinished
    Ped_DeactivateAuxScript
    Ped_PlayLandSound
    Ped_RemoveSpeedBoost
    if GotParam land_height
        if GotParam should_land
            Ped_SetLogicState STATE_land table = SkaterPed_StateTable
        endif
        Ped_StartMoving
        Ped_HitWaypoint
    else
        Ped_SetLogicState STATE_land table = SkaterPed_StateTable
    endif
endscript


script ped_skater_vert_jump 
    obj_shadowoff
    Ped_StopMoving
    if NOT GotParam JumpSpeed
        <JumpSpeed> = ped_skater_jump_speed
    endif
    Obj_PlayAnim anim = ollie
    Ped_PlayJumpSound
    obj_jump heading = <heading> Speed = (<JumpSpeed> * ped_skater_vert_jump_speed_slop)gravity = ped_skater_jump_gravity
    Obj_WaitAnimFinished
    Obj_PlayAnim anim = AirIdle Cycle
    obj_waitjumpfinished
    Ped_PlayLandSound
    if GotParam should_flip
        Obj_Flip
    endif
    Ped_StartMoving
    Ped_Utils_GetAnimName type = CrouchedLandAnims
    Ped_SetLogicState STATE_land table = SkaterPed_StateTable StateParams = { anim = <AnimName> }
endscript


script ped_skater_roll_off 
    obj_shadowoff
    Ped_StopMoving
    Ped_GetCurrentVelocity
    obj_jump use_current_heading Speed = <velocity> gravity = ped_skater_jump_gravity
    obj_waitjumpfinished
    Ped_PlayLandSound
    Ped_StartMoving
    Ped_SetLogicState STATE_land table = SkaterPed_StateTable
endscript


script ped_skater_grab_trick 
    obj_shadowoff
    if NOT GotParam JumpSpeed
        <JumpSpeed> = ped_skater_jump_speed
    endif
    if GotParam is_vert
        Ped_StopMoving
    endif
    if NOT GotParam anim
        GetConfigurableTricksFromType type = GrabTrick
        GetRandomArrayElement <ConfigurableTricks>
        <trick_params> = (<element>.params)
        <anim> = (<trick_params>.anim)
        <idle_anim> = (<trick_params>.idle)
        if StructureContains structure = <trick_params> OutAnim
            <out_anim> = (<trick_params>.OutAnim)
        endif
    endif
    Ped_PlayJumpSound
    if GotParam is_vert
        obj_jump heading = <heading> Speed = <JumpSpeed> gravity = ped_skater_jump_gravity
    else
        if (<is_jumping> = 0)
            obj_jump Speed = <JumpSpeed> gravity = ped_skater_jump_gravity
        endif
    endif
    Obj_PlayAnim anim = <anim>
    Ped_ActivateAuxScript name = ped_skater_wait_and_stop_grab_anim params = <...> 
    obj_waitjumpfinished
    Ped_PlayLandSound
    Ped_DeactivateAuxScript
    if GotParam is_vert
        if GotParam should_flip
            Obj_Flip
        endif
        Ped_StartMoving
        Ped_Utils_GetAnimName type = CrouchedLandAnims
    else
        Ped_Utils_GetAnimName type = LandAnims
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
        Ped_StopMoving
        break 
    endif
    wait 1 frame
    repeat 
    Obj_PlayAnim anim = NewBrake
    Obj_WaitAnimFinished
    if GotParam RandomStopTime
        <StopTime> = randomrange (1.0, 30.0)
    endif
    if GotParam StopTime
        if (<StopTime> > 0)
            Ped_ActivateAuxScript name = ped_skater_wait_and_start_moving params = { StopTime = <StopTime> }
        endif
    endif
    getsingletag brake_idle_anims
    if NOT GotParam brake_idle_anims
        <brake_idle_anims> = ped_skater_brake_idle_anims
    endif
    begin 
    GetRandomArrayElement <brake_idle_anims>
    Obj_PlayAnim anim = <element>
    Obj_WaitAnimFinished
    repeat 
endscript


script ped_skater_manual 
    obj_shadowon
    switch <ManualType>
        case Manual
        settags manual_out_anim = PutDownManual
        init_anim = Manual
        range_anim = Manual_Range
        case Handstand
        settags manual_out_anim = RustySlide_Out
        init_anim = RustySlide_Init
        range_anim = Primo_Range
        default 
        settags manual_out_anim = PutDownManual
        init_anim = Manual
        range_anim = Manual_Range
    endswitch
    Obj_PlayAnim anim = <init_anim>
    Obj_WaitAnimFinished
    Obj_PlayAnim anim = <range_anim> pingpong from = start to = end Speed = 1.100 BlendPeriod = 0.4000
endscript


script ped_skater_manual_down 
    obj_shadowon
    if NOT getsingletag manual_out_anim
        <manual_out_anim> = PutDownManual
    endif
    Obj_PlayAnim anim = <manual_out_anim>
    Obj_WaitAnimFinished
    Ped_SetLogicState STATE_skating table = SkaterPed_StateTable
endscript


script ped_skater_lip_trick 
    obj_shadowoff
    Ped_StopMoving
    if NOT GotParam anim
        GetConfigurableTricksFromType type = LipMacro2
        GetRandomArrayElement <ConfigurableTricks>
        <trick_params> = (<element>.params)
        <init_anim> = (<trick_params>.InitAnim)
        <anim> = (<trick_params>.anim)
        <out_anim> = (<trick_params>.OutAnim)
    endif
    Obj_PlayAnim anim = <init_anim> BlendPeriod = 0.4000
    Obj_WaitAnimFinished
    if NOT GotParam HoldLipTime
        <HoldLipTime> = randomrange (1.0, 3.0)
    endif
    Obj_PlayAnim anim = <anim> pingpong from = current to = start Speed = 0.9000 BlendPeriod = 0.4000
    wait <HoldLipTime> seconds
    Obj_PlayAnim anim = <out_anim> BlendPeriod = 0.4000
    if NOT StructureContains structure = <trick_params> FlipAfter
        Obj_Flip
    endif
    Obj_WaitAnimFinished
    Ped_StartMoving
    Ped_SetLogicState STATE_land table = SkaterPed_StateTable
endscript


script ped_skater_flip_trick 
    obj_shadowoff
    if GotParam is_vert
        Ped_StopMoving
    endif
    if (<is_jumping> = 0)
        Obj_PlayAnim anim = ollie
        if GotParam is_vert
            <JumpSpeed> = (<JumpSpeed> * ped_skater_vert_jump_speed_slop)
        endif
        Ped_PlayJumpSound
        if GotParam land_height
            obj_jump {Speed = <JumpSpeed>
                gravity = ped_skater_jump_gravity
                heading = <heading>
                land_height = <land_height>
            }
        else
            obj_jump {
                Speed = <JumpSpeed>
                heading = <heading>
                gravity = ped_skater_jump_gravity
            }
        endif
        wait 8 frame
    endif
    if NOT GotParam anim
        GetConfigurableTricksFromType type = FlipTrick
        GetRandomArrayElement <ConfigurableTricks>
        <trick_params> = (<element>.params)
        <anim> = (<trick_params>.anim)
    endif
    Ped_ActivateAuxScript name = ped_skater_play_midair_anim params = { anim = <anim> }
    obj_waitjumpfinished
    Ped_DeactivateAuxScript
    Ped_PlayLandSound
    if GotParam is_vert
        Ped_StartMoving
        Ped_Utils_GetAnimName type = CrouchedLandAnims
    else
        Ped_Utils_GetAnimName type = LandAnims
    endif
    if GotParam land_height
        Ped_HitWaypoint
    endif
    Ped_SetLogicState STATE_land table = SkaterPed_StateTable StateParams = { anim = <AnimName> }
endscript


script ped_skater_land 
    obj_shadowon
    if NOT GotParam anim
        <anim> = land
    endif
    Obj_PlayAnim anim = <anim>
    Obj_WaitAnimFinished
    Ped_SetLogicState STATE_skating table = SkaterPed_StateTable
endscript


script ped_skater_idle 
    obj_enableanimblending enabled = 1
    getsingletag skater_override_anim
    if GotParam skater_override_anim
        Obj_PlayAnim anim = <skater_override_anim> Cycle dontinterrupt
    endif
    begin 
    if ped_nearvertnode
        <anim_struct> = Random (@*10 { anim = idle }@ {init_anim = crouch anim = CrouchIdle out_anim = CrouchIdleToIdle Cycle = 10})
    else
        <anim_struct> = Random (@*5 { anim = idle }@*10 { anim = PushIdle }@ {init_anim = crouch anim = CrouchIdle out_anim = CrouchIdleToIdle Cycle = 10})
    endif
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
        Obj_PlayAnim anim = <init_anim>
        Obj_WaitAnimFinished
    endif
    begin 
    Obj_PlayAnim anim = <anim>
    Obj_WaitAnimFinished
    repeat <Cycle>
    if GotParam out_anim
        Obj_PlayAnim anim = <out_anim>
        Obj_WaitAnimFinished
    endif
    repeat 
endscript


script ped_skater_generic_bail 
    getsingletag grind_bail_anim
    if NOT GotParam grind_bail_anim
        <grind_bail_anim> = FaceFall
        <grind_get_up_anim> = GetUpFaceSmash
    else
        getsingletag grind_get_up_anim
    endif
    Ped_SetIsBailing 1
    Ped_StoreMaxVelocity
    obj_setpathdeceleration ped_skater_bail_deceleration
    obj_setpathvelocity 0
    Obj_PlayAnim anim = <grind_bail_anim> norestart BlendPeriod = 0.3000
    Obj_WaitAnimFinished
    Obj_PlayAnim anim = <grind_get_up_anim> BlendPeriod = 0.1000
    Obj_WaitAnimFinished
    Ped_GetOriginalMaxVelocity
    obj_setpathvelocity <original_max_velocity> ips
    Ped_SetIsBailing 0
    Ped_SetLogicState STATE_skating table = SkaterPed_StateTable
endscript


script ped_skater_start_moving 
    getsingletag ped_skater_acceleration
    if GotParam ped_skater_acceleration
        obj_setpathacceleration <ped_skater_acceleration>
    endif
    Ped_GetOriginalMaxVelocity
    obj_setpathvelocity <original_max_velocity> ips
    Obj_PlayAnim anim = NewBrakeIdleToIdle
    Obj_WaitAnimFinished
endscript


script ped_skater_play_midair_anim 
    Obj_PlayAnim anim = <anim>
    Obj_WaitAnimFinished
    Obj_PlayAnim anim = AirIdle Cycle
endscript


script ped_skater_wait_and_stop_grab_anim 
    if GotParam jumpTime
        wait (<jumpTime> * 0.5000)seconds
        if GotParam out_anim
            Obj_PlayAnim anim = <out_anim>
            Obj_WaitAnimFinished
        else
            Obj_PlayAnim anim = <anim> backwards
            Obj_WaitAnimFinished
        endif
        Obj_PlayAnim anim = AirIdle Cycle
    endif
endscript


script ped_skater_wait_and_start_moving 
    wait <StopTime> seconds
    Ped_SetLogicState STATE_skating table = SkaterPed_StateTable
endscript

