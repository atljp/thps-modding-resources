kickflip_test_anim = 0
debug_skater_anims = 0
Skater_StaticAnimTree = {
    type = partialswitch
    id = ClothSwitch
    [
        { type = degenerateblend id = cloth }
        {
            type = partialswitch
            id = ThrowSwitch
            [
                { type = degenerateblend id = Throw }
                {
                    type = partialswitch
                    id = SteerSwitch
                    [
                        { type = degenerateblend id = steer }
                        {
                            type = partialswitch
                            id = FrontWheelSwitch
                            [
                                { type = degenerateblend id = FrontWheel }
                                {
                                    type = partialswitch
                                    id = BackWheelSwitch
                                    [
                                        { type = degenerateblend id = BackWheel }
                                        {
                                            type = partialswitch
                                            id = BarspinSwitch
                                            [
                                                { type = degenerateblend id = Barspin }
                                                { type = degenerateblend id = Body }
                                            ]
                                        }
                                    ]
                                }
                            ]
                        }
                    ]
                }
            ]
        }
    ]
}
NonLocal_Skater_StaticAnimTree = { type = degenerateblend id = Body }
Skater_AnimBranch_Standard = {
    id = BodyWalkSpeed
    type = walkspeed
    [
        {
            type = my_timer_type
            id = bodytimer
            Speed = my_speed
            start = my_start
            end = my_end
            anim = my_anim
            enable_anim_events
            [
                {
                    type = WalkMonitor
                    id = BodyMonitor
                    [
                        {
                            id = NoBoardOverlay
                            type = overlay
                            [
                                {
                                    id = BoardRotateOverlay
                                    type = BoardRotateOverlay
                                    [
                                        {
                                            id = OneFootDifference
                                            type = DifferenceToggle
                                            anim = my_onefoot_anim
                                            [
                                                { id = BodySource type = source anim = my_anim }
                                            ]
                                        }
                                    ]
                                }
                            ]
                        }
                    ]
                }
            ]
        }
    ]
}
NonLocal_Skater_AnimBranch_Standard = {
    type = my_timer_type
    id = bodytimer
    Speed = my_speed
    start = my_start
    end = my_end
    anim = my_anim
    [
        {
            id = BoardRotateOverlay
            type = BoardRotateOverlay
            [
                { id = BodySource type = source anim = my_anim }
            ]
        }
    ]
}
Nonlocal_Skater_AnimBranch_Flipped = {
    type = flip
    id = BodyFlip
    [
        { NonLocal_Skater_AnimBranch_Standard }
    ]
}
Skater_AnimBranch_Flipped = {
    type = flip
    id = BodyFlip
    [
        { Skater_AnimBranch_Standard }
    ]
}
Skater_AnimBranch_LookAt = {
    type = DifferenceLookAt
    id = LookAtController
    params = param_lookat_params
    target = param_lookat_target
    [
        { Skater_AnimBranch_Standard }
    ]
}
Skater_AnimBranch_WalkingSpeedBlend = {
    type = WalkingTimer
    id = bodytimer
    anim = Wrun
    start = my_start
    end = my_end
    enable_anim_events
    [
        {
            id = BoardRotateOverlay
            type = BoardRotateOverlay
            [
                {
                    id = RunningTurnDifference
                    type = RunningTurn
                    anim = my_runningturn_anim
                    [
                        {
                            type = WalkingSpeedBlend
                            [
                                { id = BodySource type = WalkingSource parity = even anim_mapping = forward }
                                { id = BodySource2 type = WalkingSource parity = odd anim_mapping = forward }
                            ]
                        }
                    ]
                }
            ]
        }
    ]
}
Skater_AnimBranch_WalkingSpeedBlend_Flipped = {
    type = flip
    id = BodyFlip
    [
        { Skater_AnimBranch_WalkingSpeedBlend }
    ]
}
Skater_AnimBranch_Turn = {
    id = BodyWalkSpeed
    type = walkspeed
    [
        {
            type = my_timer_type
            id = bodytimer
            Speed = my_speed
            start = my_start
            end = my_end
            anim = my_anim
            enable_anim_events
            [
                {
                    id = NoBoardOverlay
                    type = overlay
                    [
                        {
                            id = BoardRotateOverlay
                            type = BoardRotateOverlay
                            [
                                {
                                    type = turnBlend
                                    [
                                        { id = BodySource type = source anim = my_anim }
                                        { id = TurnSource type = source anim = my_turn_anim }
                                    ]
                                }
                            ]
                        }
                    ]
                }
            ]
        }
    ]
}
Skater_AnimBranch_Turn_Flipped = {
    type = flip
    id = BodyFlip
    [
        { Skater_AnimBranch_Turn }
    ]
}
Skater_AnimBranch_Cloth = {
    type = my_timer_type
    id = ClothTimer
    Speed = my_speed
    start = my_start
    end = my_end
    anim = my_anim
    enable_anim_events
    [
        { id = ClothSource type = source anim = my_anim }
    ]
}
Skater_AnimBranch_Cloth_Flipped = {
    type = flip
    id = ClothFlip
    [
        { Skater_AnimBranch_Cloth }
    ]
}
Skater_AnimBranch_Throw = {
    type = my_timer_type
    id = ThrowTimer
    Speed = my_speed
    start = my_start
    end = my_end
    anim = my_anim
    enable_anim_events
    [
        { id = ThrowSource type = source anim = my_anim }
    ]
}
Skater_AnimBranch_Throw_Flipped = {
    type = flip
    id = ThrowFlip
    [
        { Skater_AnimBranch_Throw }
    ]
}
Skater_AnimBranch_FrontWheel = {
    id = FrontWheelSpeed
    type = WheelSpeed
    position = front
    [
        {
            type = my_timer_type
            id = FrontWheelTimer
            Speed = my_speed
            start = my_start
            end = my_end
            anim = my_anim
            enable_anim_events
            [
                { id = FrontWheelSource type = source anim = my_anim }
            ]
        }
    ]
}
Skater_AnimBranch_BackWheel = {
    id = BackWheelSpeed
    type = WheelSpeed
    position = back
    [
        {
            type = my_timer_type
            id = BackWheelTimer
            Speed = my_speed
            start = my_start
            end = my_end
            anim = my_anim
            enable_anim_events
            [
                { id = BackWheelSource type = source anim = my_anim }
            ]
        }
    ]
}
Skater_AnimBranch_FrontWheel_Flipped = {
    type = flip
    id = FrontWheelFlip
    [
        { Skater_AnimBranch_FrontWheel }
    ]
}
Skater_AnimBranch_BackWheel_Flipped = {
    type = flip
    id = BackWheelFlip
    [
        { Skater_AnimBranch_BackWheel }
    ]
}
Skater_AnimBranch_Steer = {
    type = my_timer_type
    id = SteerTimer
    Speed = my_speed
    start = my_start
    end = my_end
    anim = my_anim
    enable_anim_events
    [
        { id = SteerSource type = source anim = my_anim }
    ]
}
Skater_AnimBranch_Steer_Flipped = {
    type = flip
    id = SteerFlip
    [
        { Skater_AnimBranch_Steer }
    ]
}
Skater_AnimBranch_Barspin = {
    type = my_timer_type
    id = BarspinTimer
    Speed = my_speed
    start = my_start
    end = my_end
    anim = my_anim
    enable_anim_events
    [
        { id = BarspinSource type = source anim = my_anim }
    ]
}
Skater_AnimBranch_Barspin_Flipped = {
    type = flip
    id = BarspinFlip
    [
        { Skater_AnimBranch_Barspin }
    ]
}

script init_nonlocal_skater_anim_tree \{ tree = NonLocal_Skater_StaticAnimTree }
    anim_uninittree
    anim_inittree tree = <tree> nodeiddeclaration = [
        ClothSwitch
        cloth
        ThrowSwitch
        Throw
        SteerSwitch
        steer
        FrontWheelSwitch
        FrontWheel
        BackWheelSwitch
        BackWheel
        BarspinSwitch
        Barspin
        BodyMonitor
        BodyFlip
        bodytimer
        BodyReverse
        Body
        BodySource
        BodySource2
        OneFootDifference
        BoardRotateOverlay
        NoBoardOverlay
    ]
endscript

script init_skater_anim_tree tree = Skater_StaticAnimTree
    anim_uninittree
    anim_inittree tree = <tree> nodeiddeclaration = [
        ClothSwitch
        ClothTimer
        ClothFlip
        ClothReverse
        cloth
        ClothSource
        ThrowSwitch
        ThrowTimer
        ThrowFlip
        ThrowReverse
        Throw
        ThrowSource
        SteerSwitch
        SteerTimer
        SteerFlip
        SteerReverse
        steer
        SteerSource
        FrontWheelSwitch
        FrontWheelSpeed
        FrontWheelTimer
        FrontWheelFlip
        FrontWheelReverse
        FrontWheel
        FrontWheelSource
        BackWheelSwitch
        BackWheelSpeed
        BackWheelTimer
        BackWheelFlip
        BackWheelReverse
        BackWheel
        BackWheelSource
        BarspinSwitch
        BarspinTimer
        BarspinFlip
        BarspinReverse
        Barspin
        BarspinSource
        BodyMonitor
        BodyFlip
        bodytimer
        BodyReverse
        Body
        BodySource
        BodySource2
        BodyWalkSpeed
        NoBoardOverlay
        OneFootDifference
        BoardRotateOverlay
        RunningTurnDifference
        turnBlend
        TurnSource
        LookAtController
    ]
endscript

script init_cat_skater_anim_tree 
    anim_uninittree
    anim_inittree \{tree = CatSkater_StaticAnimTree nodeiddeclaration = [BodyFlip bodytimer BodyReverse Body BodySource]}
endscript
CatSkater_StaticAnimTree = { type = degenerateblend id = Body }
CatSkater_AnimBranch_Standard = {
    type = my_timer_type
    id = bodytimer
    Speed = my_speed
    start = my_start
    end = my_end
    anim = my_anim
    enable_anim_events
    [
        { id = BodySource type = source anim = my_anim }
    ]
}
CatSkater_AnimBranch_Flipped = {
    type = flip
    id = BodyFlip
    [
        { CatSkater_AnimBranch_Standard }
    ]
}

script Skater_Playanim target = Body tree = Skater_AnimBranch_Standard timer = bodytimer source = BodySource
    obj_getid
    if (<ObjID> = cat_skater)
        tree = CatSkater_AnimBranch_Standard
        is_catskater = 1
    endif
    if NOT GotParam not_a_skater
        if GotParam norestart
            if anim_command target = <source> command = source_animequals params = { <anim> }
                return 
            endif
        endif
        HandleFlipOrBoardRotateAfter
    endif
    if GotParam Cycle
        timer_type = Cycle
    else
        if GotParam Wobble
            timer_type = Wobble
            setwobbledetails <...> 
        else
            timer_type = play
        endif
    endif
    if GotParam from
        if (<from> = current)
            synctopreviousanim = 1
        else
            if (<from> = start)
                start = 0
            else
                if (<from> = end)
                    start = 1
                else
                    if (1 > <from>)
                        start = <from>
                    else
                        printf 'skater_playanim received invalid value for param from'
                        printstruct <...> 
                    endif
                endif
            endif
        endif
    endif
    if GotParam to
        if ((<to> < 1)|| (<to> = 1))
            end = <to>
        endif
    endif
    if GotParam backwards
        if GotParam Speed
            Speed = (-1 * <Speed>)
        else
            Speed = -1
        endif
        if NOT GotParam start
            start = 1
        else
            if NOT GotParam to
                start = 1
            else
                temp = <start>
                start = <to>
                to = <temp>
            endif
        endif
    endif
    if GotParam synctopreviousanim
        anim_command target = <timer> command = timer_getframefactor
        start = <framefactor>
    endif
    if NOT GotParam is_catskater
        if GotParam not_a_skater
            if IsCreated skater
                if skater ::Flipped
                    obj_is_flipped = 1
                endif
            endif
        else
            if Flipped
                obj_is_flipped = 1
            endif
        endif
        if GotParam obj_is_flipped
            switch <tree>
                case Skater_AnimBranch_Standard
                tree = Skater_AnimBranch_Flipped
                case Skater_AnimBranch_Cloth
                tree = Skater_AnimBranch_Cloth_Flipped
                case Skater_AnimBranch_Throw
                tree = Skater_AnimBranch_Throw_Flipped
                case Skater_AnimBranch_Turn
                tree = Skater_AnimBranch_Turn_Flipped
                case Skater_AnimBranch_WalkingSpeedBlend
                tree = Skater_AnimBranch_WalkingSpeedBlend_Flipped
                case Skater_AnimBranch_Barspin
                tree = Skater_AnimBranch_Barspin_Flipped
                case Skater_AnimBranch_Front_Wheel
                tree = Skater_AnimBranch_Front_Wheel_Flipped
                case Skater_AnimBranch_Back_Wheel
                tree = Skater_AnimBranch_Back_Wheel_Flipped
                case CatSkater_AnimBranch_Standard
                tree = CatSkater_AnimBranch_Flipped
            endswitch
        endif
    endif
    if NOT (kickflip_test_anim = 0)
        if GotParam anim
            if (<anim> = KickFlip)
                anim = (kickflip_test_anim + 0)
            endif
        endif
    endif
    if NOT (debug_skater_anims = 0)
        printf '***************************************'
        printf 'Anim ========================= %a' a = <anim>
        printf '***************************************'
    endif
    Skater_Anim_Command {
        not_a_skater = <not_a_skater>
        target = <target>
        command = degenerateblend_addbranch
        params = {
            blendduration = <BlendPeriod>
            tree = <tree>
            params = {
                my_timer_type = <timer_type>
                my_anim = <anim>
                my_speed = <Speed>
                my_start = <start>
                my_end = <end>
                my_turn_anim = <turn_anim>
            }
        }
    }
endscript

script NonSkater_PlayAnim \{ tree = CatSkater_AnimBranch_Standard }
    Skater_Playanim <...> not_a_skater = 1
endscript

script Skater_Anim_Command 
    obj_getid
    getsingletag \{ specialItemId }
    if GotParam \{ specialItemId }
        if IsCreated <specialItemId>
            if NOT GotParam \{ not_a_skater }
                if BoardIsRotated
                    boardrotate
                endif
                <specialItemId> ::anim_command <...> 
            endif
        endif
    endif
    anim_command <...> 
endscript

script Skater_PlayClothAnim \{tree = Skater_AnimBranch_Cloth timer = ClothTimer target = cloth source = ClothSource blendduration = 0.2000 blendweight = 1.0}
    anim_command target = ClothSwitch command = partialswitch_setstate params = {on blendduration = <blendduration> blendweight = <blendweight>}
    Skater_Playanim <...> 
endscript

script Skater_PlayThrowAnim \{tree = Skater_AnimBranch_Throw timer = ThrowTimer target = Throw source = ThrowSource blendduration = 0.2000 blendweight = 1.0}
    if NOT anim_command \{ target = ThrowSwitch command = partialswitch_ison }
        anim_command target = ThrowSwitch command = partialswitch_setstate params = {on blendduration = <blendduration> blendweight = <blendweight>}
    endif
    Skater_Playanim <...> 
endscript

script Skater_PlayFrontWheelAnim \{tree = Skater_AnimBranch_FrontWheel timer = FrontWheelTimer target = FrontWheel source = FrontWheelSource blendduration = 0.2000 blendweight = 1.0}
    anim_command target = FrontWheelSwitch command = partialswitch_setstate params = {on blendduration = <blendduration> blendweight = <blendweight>}
    Skater_Playanim <...> 
endscript

script Skater_PlayBackWheelAnim \{tree = Skater_AnimBranch_BackWheel timer = BackWheelTimer target = BackWheel source = BackWheelSource blendduration = 0.2000 blendweight = 1.0}
    anim_command target = BackWheelSwitch command = partialswitch_setstate params = {on blendduration = <blendduration> blendweight = <blendweight>}
    Skater_Playanim <...> 
endscript

script Skater_PlaySteerAnim \{tree = Skater_AnimBranch_Steer timer = SteerTimer target = steer source = SteerSource blendduration = 0.2000 blendweight = 1.0}
    Skater_Anim_Command target = SteerSwitch command = partialswitch_setstate params = {on blendduration = <blendduration> blendweight = <blendweight>}
    Skater_Playanim <...> 
endscript

script Skater_PlayBarspinAnim \{tree = Skater_AnimBranch_Barspin timer = BarspinTimer target = Barspin source = BarspinSource blendduration = 0.0 blendweight = 1.0}
    Skater_Anim_Command target = BarspinSwitch command = partialswitch_setstate params = {on blendduration = <blendduration> blendweight = <blendweight>}
    Skater_Playanim <...> 
endscript

script Skater_PlayNoBoardOverlayAnim 
    anim_command target = NoBoardOverlay command = overlay_setanim params = { anim = <anim> }
    anim_command \{target = NoBoardOverlay command = overlay_setstate params = { on }}
endscript

script Skater_PlayOneFooterAnim 
    anim_command target = OneFootDifference command = Difference_SetAnim params = {anim = <anim> Blend = <blendtime> strength = <strength>}
    anim_command \{target = OneFootDifference command = Difference_SetState params = { on }}
endscript

script Skater_PlayTurnAnim 
    tree = Skater_AnimBranch_Turn
    Skater_Playanim <...> 
endscript

script Skater_PlayWalkingAnim 
    Skater_Playanim <...> tree = Skater_AnimBranch_WalkingSpeedBlend
    if NOT GotParam \{ no_overlay }
        if IsBoardMissing
            if NOT IsForceWalkOn
                AppendSuffixToChecksum base = <anim> suffixstring = '_Partial'
                if anim_animexists anim = <appended_id> ReferenceChecksum = thps7_human
                    Skater_PlayNoBoardOverlayAnim <...> anim = <appended_id>
                    return 
                endif
            endif
        endif
    endif
    if anim_animnodeexists \{ id = NoBoardOverlay }
        Skater_NoBoardOverlayAnimOff
    endif
endscript

script Skater_PlayLookAtAnim target = Body tree = Skater_AnimBranch_LookAt
    if IsSkaterOnBike
        return 
    endif
    if GotParam Cycle
        timer_type = Cycle
    else
        timer_type = play
    endif
    anim_command {
        target = <target>
        command = degenerateblend_addbranch
        params = {
            blendduration = <BlendPeriod>
            tree = <tree>
            params = {
                my_timer_type = <timer_type>
                my_anim = <anim>
                param_lookat_params = <lookat_params>
                param_lookat_target = <lookat_target>
            }
        }
    }
endscript

script Skater_WaitAnimFinished \{ timer = bodytimer }
    anim_command target = <timer> command = timer_wait
endscript

script Skater_WaitAnim \{ timer = bodytimer }
    anim_command target = <timer> command = timer_wait params = { <...>  }
endscript

script Skater_AnimComplete \{ timer = bodytimer }
    if anim_command target = <timer> command = timer_isanimcomplete
        return \{ true }
    else
        return \{ false }
    endif
endscript

script Skater_AnimEquals 
    if anim_command target = BodySource command = source_animequals params = { <...>  }
        return \{ true }
    else
        return \{ false }
    endif
endscript

script Skater_WaitClothAnimFinished 
    return 
    Skater_WaitAnimFinished \{ timer = ClothTimer }
endscript

script Skater_WaitThrowAnimFinished 
    Skater_WaitAnimFinished \{ timer = ThrowTimer }
endscript

script Skater_WaitThrowAnim 
    Skater_WaitAnim timer = ThrowTimer <...> 
endscript

script Skater_ThrowAnimComplete 
    if Skater_AnimComplete \{ timer = ThrowTimer }
        return \{ true }
    else
        return \{ false }
    endif
endscript

script Skater_WaitFrontWheelAnimFinished 
    Skater_WaitAnimFinished \{ timer = FrontWheelTimer }
endscript

script Skater_WaitBackWheelAnimFinished 
    Skater_WaitAnimFinished \{ timer = BackWheelTimer }
endscript

script Skater_WaitSteerAnimFinished 
    Skater_WaitAnimFinished \{ timer = SteerTimer }
endscript

script Skater_WaitBarSpinAnimFinished 
    Skater_WaitAnimFinished \{ timer = BarspinTimer }
endscript

script Skater_BarSpinAnimComplete 
    if Skater_AnimComplete \{ timer = BarspinTimer }
        return \{ true }
    else
        return \{ false }
    endif
endscript

script Skater_WaitBarspinAnim 
    Skater_WaitAnim \{ timer = BarspinTimer }
endscript

script Skater_ClothAnimOff 
    anim_command \{target = ClothSwitch command = partialswitch_setstate params = { Off blendduration = 0.2000 }}
endscript

script Skater_ThrowAnimOff 
    anim_command \{target = ThrowSwitch command = partialswitch_setstate params = { Off blendduration = 0.2000 }}
endscript

script Skater_FrontWheelAnimOff 
    Skater_Anim_Command \{target = FrontWheelSwitch command = partialswitch_setstate params = { Off blendduration = 0.2000 }}
endscript

script Skater_BackWheelAnimOff 
    Skater_Anim_Command \{target = BackWheelSwitch command = partialswitch_setstate params = { Off blendduration = 0.2000 }}
endscript

script Skater_SteerAnimOff 
    Skater_Anim_Command \{target = SteerSwitch command = partialswitch_setstate params = { Off blendduration = 0.2000 }}
endscript

script Skater_BarspinAnimOff 
    Skater_Anim_Command \{target = BarspinSwitch command = partialswitch_setstate params = { Off blendduration = 0.2000 }}
endscript

script Skater_NoBoardOverlayAnimOff 
    anim_command \{target = NoBoardOverlay command = overlay_setstate params = { Off }}
endscript

script Skater_OneFooterAnimOff 
    anim_command \{target = OneFootDifference command = Difference_SetState params = { Off }}
endscript

script Skater_RunningTurnAnimOn 
    anim_command \{ target = RunningTurnDifference command = Difference_GetState }
    if (<difference_state> = 1)
        anim_command \{target = RunningTurnDifference command = Difference_SetState params = { on }}
    endif
endscript

script Skater_RunningTurnAnimOff 
    anim_command \{target = RunningTurnDifference command = Difference_SetState params = { Off }}
endscript

script BlendperiodOut 
    anim_command command = degenerateblend_setnextblendduration params = { <...>  }
endscript

script GetCurrentAnimLength 
    anim_command \{ target = BodySource command = timer_getanimduration }
    return Length = <duration>
endscript

script GetAnimLength 
    anim_getanimlength anim = <anim> ReferenceChecksum = thps7_human
    return Length = <Length>
endscript

script Obj_GetAnimSpeed 
    anim_command \{ target = bodytimer command = timer_getspeed }
    return Speed = <Speed>
endscript

script Skater_SetAnimSpeed 
    Skater_Anim_Command target = bodytimer command = timer_setspeed params = { Speed = <Speed> }
endscript
Skater_WalkingAnimSpeeds = [
    {
        level = stand
        Speed = 0
        forward_cycle_length = 3
        speed_lerp_speed = 10
        forward_anim = WStand
    }
    {
        level = WalkSlow_Lower
        Speed = 1
        forward_cycle_length = 1.100
        speed_lerp_speed = 10
        forward_anim = WalkSlow
    }
    {
        level = WalkSlow
        Speed = 10
        forward_cycle_length = 1.100
        speed_lerp_speed = 10
        forward_anim = WalkSlow
    }
    {
        level = WalkFast
        Speed = 193
        forward_cycle_length = 0.8330
        speed_lerp_speed = 10
        forward_anim = WalkFast
    }
    {
        level = Jog
        Speed = 326
        forward_cycle_length = 0.7330
        speed_lerp_speed = 15
        forward_anim = Wrun
    }
    {
        level = RunFast
        Speed = 518
        forward_cycle_length = 0.5333
        speed_lerp_speed = 15
        forward_anim = FastRun
    }
]
