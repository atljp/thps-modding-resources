BikeGrindTrickList = [
    [ Trick_Bike_DoublePeg_left Trick_Bike_DoublePeg_right Trick_Bike_DoublePeg_left Trick_Bike_DoublePeg_right ]
    [ Trick_Bike_Smith_left Trick_Bike_Smith_right Trick_Bike_Smith_left Trick_Bike_Smith_right ]
    [ Trick_Bike_Toothpick_left Trick_Bike_Toothpick_right Trick_Bike_Toothpick_left Trick_Bike_Toothpick_right ]
    [ Trick_Bike_Feeble_left Trick_Bike_Feeble_right Trick_Bike_Feeble_left Trick_Bike_Feeble_right ]
    [ Trick_Bike_IcePick_left Trick_Bike_IcePick_right Trick_Bike_IcePick_left Trick_Bike_IcePick_right ]
]
bike_grind_ExceptionTable = [
    {
        exception
        Ex = Ollied
        scr = bike_rail_exit
        params = { callback = bike_Ollie }
    }
    { exception Ex = OffRail scr = bike_OffRail }
    {
        exception
        Ex = Landed
        scr = bike_rail_exit
        params = { callback = bike_Land }
    }
    {
        exception
        Ex = SkaterCollideBail
        scr = bike_rail_exit
        params = { callback = bike_bail }
    }
    { event Ex = MadeOtherSkaterBail scr = MadeOtherSkaterBail_Called }
]

script bike_grind ButtonA = LeftRight ButtonB = LeftLeft
    if BikeInXup
        Skater_BarspinAnimOff
        AppendSuffixToChecksum base = <InitAnim> suffixstring = '_xup'
        if anim_animexists anim = <appended_id> ReferenceChecksum = thps7_human
            InitAnim = <appended_id>
        endif
        AppendSuffixToChecksum base = <anim> suffixstring = '_xup'
        if anim_animexists anim = <appended_id> ReferenceChecksum = thps7_human
            anim = <appended_id>
        endif
        AppendSuffixToChecksum base = <OutAnim> suffixstring = '_xup'
        if anim_animexists anim = <appended_id> ReferenceChecksum = thps7_human
            OutAnim = <appended_id>
        endif
    endif
    settags OutAnim = <OutAnim> InitAnim = <InitAnim> InitSpeed = <InitSpeed> anim = <anim>
    gettags
    if bailison
        setstate Air
        goto bike_bail
    endif
    if DisplayPitchGreaterThan 90
        printf 'bail: display pitch'
        goto bike_bail
    endif
    if GotParam flip_anim
        if NOT Flipped
            flip
        endif
    else
        if Flipped
            flip
        endif
    endif
    if ShouldRunStallScript
        GotoPreserveParams BikeStallTrick
    endif
    bailoff
    cancelrotatedisplay
    if GotParam land_sound
        playsound <land_sound> vol = 120 pitch = Random (@ 110 @ 113 @ 115 @ 118 @ 120)
    endif
    if GotParam grind_sound
        obj_stopsound <grind_sound>
        obj_playsound <grind_sound> vol = 150
    endif
    LaunchStateChangeEvent state = Skater_OnRail
    KillExtraTricks
    SetTrickName ''
    SetTrickScore 0
    display Blockspin
    obj_clearflag FLAG_SKATER_MANUALCHEESE
    obj_clearflag FLAG_SKATER_REVERTCHEESE
    vibrate actuator = 1 percent = 50 duration = 0.2500
    vibrate actuator = 0 percent = 50
    ResetEventHandlersFromTable bike_grind_ExceptionTable
    OffTopScript = bike_rail_exit
    OffBottomScript = bike_rail_exit
    SetException Ex = OffMeterTop scr = SkateInOrBail params = { <...> FallingLeft }
    SetException Ex = OffMeterBottom scr = SkateInOrBail params = { <...> FallingRight }
    OnExceptionRun Grind_Kissed
    ClearTrickQueue
    ClearManualTrick
    ClearExtraGrindTrick
    SetQueueTricks NoTricks
    SetManualTricks NoTricks
    setrailsound grind
    setgrindtweak 10
    if GotParam InitAnim
        Skater_Playanim anim = <InitAnim> BlendPeriod = 0
    endif
    if GotParam IsExtra
        dobalancetrick ButtonA = <ButtonA> ButtonB = <ButtonB> type = grind DoFlipCheck ClearCheese IsATap = 1
    else
        dobalancetrick ButtonA = <ButtonA> ButtonB = <ButtonB> type = grind DoFlipCheck
    endif
    wait 15 frames
    if IsPs2
    endif
    wait 1 frame
    if BikeIsInOverGrind
    endif
    if BikeInXup
        FormatText textname = name 'X-up %i' i = <name>
    endif
    if backwards
        FormatText textname = name 'Backwards %i' i = <name>
    endif
    SetTrickName <name>
    SetTrickScore <Score>
    display Blockspin
    Skater_WaitAnimFinished
    if GotParam anim
        Skater_Playanim anim = <anim> Wobble wobbleparams = grindwobble_params
    endif
    begin 
    DoNextTrick
    orient_vehicle
    if GotParam allow_barspin
        if RightAnalogHeld up
            bike_partial_barspin
        endif
        if Held l2
            bike_partial_xup
        endif
    endif
    wait 1 gameframe
    repeat 
endscript

script bike_OffRail 
    gettags
    if GotParam grind_sound
        obj_stopsound <grind_sound>
    endif
    if GotParam KissedRail
        SetTrickScore 50
        SetTrickName 'Kissed the Rail'
        display Blockspin NoMult
    endif
    stopbalancetrick
    KillExtraTricks
    vibrate actuator = 0 percent = 0
    setstate Air
    SetException Ex = Landed scr = bike_Land
    if GotParam canwallplant
        SetException Ex = wallplant scr = Air_WallPlant
    endif
    DoNextTrick
    if GotParam grind_out_anim
        Skater_Playanim anim = <grind_out_anim> BlendPeriod = 0.1000
    else
        if GotParam grind_init_anim
            Skater_Playanim anim = <grind_init_anim> BlendPeriod = 0.1000 backwards
        endif
    endif
    if GotParam canmanual
        DoNextManualTrick
    endif
    Skater_WaitAnimFinished
    if Flipped
        flip
    endif
    goto bike_Airborne
endscript

script bike_rail_exit 
    stopbalancetrick
    KillExtraTricks
    vibrate \{ actuator = 0 percent = 0 }
    setstate \{ Air }
    allowrailtricks
    if GotParam \{ grind_sound }
        obj_stopsound <grind_sound>
    endif
    if Flipped
        flip
    endif
    if GotParam \{ callback }
        goto <callback>
    endif
endscript

script BikeStallTrick Speed = 1.0 type = grind
    if BikeInXup
        Skater_BarspinAnimOff
        AppendSuffixToChecksum base = <InitAnim> suffixstring = '_xup'
        if anim_animexists anim = <appended_id> ReferenceChecksum = thps7_human
            InitAnim = <appended_id>
        endif
        AppendSuffixToChecksum base = <anim> suffixstring = '_xup'
        if anim_animexists anim = <appended_id> ReferenceChecksum = thps7_human
            anim = <appended_id>
        endif
        AppendSuffixToChecksum base = <OutAnim> suffixstring = '_xup'
        if anim_animexists anim = <appended_id> ReferenceChecksum = thps7_human
            OutAnim = <appended_id>
        endif
    endif
    ClearStallScriptFlag
    if bailison
        setstate Air
        goto bike_bail
    endif
    if DisplayPitchGreaterThan 90
        printf 'bail: display pitch'
        goto bike_bail
    endif
    cancelrotatedisplay
    KillExtraTricks
    bailoff
    ClearExceptions
    ClearTrickQueue
    SetQueueTricks NoTricks
    SetException Ex = OffMeterTop scr = SkateInOrBail params = { <...> FallingLeft }
    SetException Ex = OffMeterBottom scr = SkateInOrBail params = { <...> FallingRight }
    SetQueueTricks NoTricks
    SetException Ex = Ollied scr = StallOllieOut params = { <...>  }
    GetTerrain
    if GotParam CopingHit
        obj_spawnscriptlater CopingHit params = { <...>  }
    endif
    if NOT GotParam stall_name
        FormatText textname = stall_name '%n Stall' n = <name>
    endif
    SetTrickName <stall_name>
    SetTrickScore <Score>
    if GotParam IsSpecial
        broadcastevent type = SkaterEnterSpecialTrick
        OnExitRun Exit_Special
    endif
    if GotParam IsExtra
        LaunchExtraMessage
        Skater_Playanim anim = <InitAnim> Speed = <Speed>
        display Blockspin
        Skater_WaitAnimFinished
    else
        if GotParam InitAnim
            Skater_Playanim anim = <InitAnim> Speed = <Speed>
            wait LIPTRICK_DISPLAY_WAIT frames
            display Blockspin
            Skater_WaitAnimFinished
        endif
    endif
    if NOT OnStall
        if NOT onrail
            stopbalancetrick
            goto bike_Airborne
        endif
    endif
    PlayStallBalancingAnim <...> 
    begin 
    if NOT OnStall
        if NOT onrail
            stopbalancetrick
            goto bike_Airborne
        endif
    endif
    tweaktrick 10
    wait 1 gameframe
    repeat 
endscript

script Trick_Bike_DoublePeg_left \{ name = "Double Peg Grind" stall_name = 'Double Peg Stall' }
    bike_grind {
        name = <name> stall_name = <stall_name> Score = 200 GrindTweak = 14 InitAnim = BMX_Grind_Init anim = BMX_Grind_Idle OutAnim = BMX_Grind_Out NoBlend = yes
        grindbail = GrindFallLR
        type = grind SparkPos = rear
    }
endscript

script Trick_Bike_DoublePeg_right \{ name = "Double Peg Grind" stall_name = 'Double Peg Stall' }
    bike_grind {
        name = <name> stall_name = <stall_name> Score = 200 GrindTweak = 14 InitAnim = BMX_Grind_Init anim = BMX_Grind_Idle OutAnim = BMX_Grind_Out NoBlend = yes
        grindbail = GrindFallLR
        type = grind SparkPos = rear
        flip_anim = flip_anim
    }
endscript

script Trick_Bike_IcePick_left \{ name = "Icepick Grind" stall_name = 'Icepick Stall' }
    bike_grind {
        name = <name>
        stall_name = <stall_name>
        Score = 200
        GrindTweak = 14
        InitAnim = BMX_Icepick_Init
        anim = BMX_Icepick_Range
        OutAnim = BMX_Icepick_Out
        NoBlend = yes
        grindbail = GrindFallLR
        type = grind SparkPos = rear
    }
endscript

script Trick_Bike_IcePick_right \{ name = "Icepick Grind" stall_name = 'Icepick Stall' }
    bike_grind {
        name = <name>
        stall_name = <stall_name>
        Score = 200
        GrindTweak = 14
        InitAnim = BMX_Icepick_Init
        anim = BMX_Icepick_Range
        OutAnim = BMX_Icepick_Out
        NoBlend = yes
        grindbail = GrindFallLR
        type = grind SparkPos = rear
        flip_anim = flip_anim
    }
endscript

script Trick_Bike_Toothpick_left \{ name = "Toothpick Grind" stall_name = 'Toothpick Stall' }
    bike_grind {
        name = <name>
        stall_name = <stall_name>
        Score = 200
        GrindTweak = 14
        InitAnim = BMX_Toothpick_Init
        anim = BMX_Toothpick_Range
        OutAnim = BMX_Toothpick_Out
        NoBlend = yes
        grindbail = GrindFallLR
        type = grind SparkPos = rear
    }
endscript

script Trick_Bike_Toothpick_right \{ name = "Toothpick Grind" stall_name = 'Toothpick Stall' }
    bike_grind {
        name = <name>
        stall_name = <stall_name>
        Score = 200
        GrindTweak = 14
        InitAnim = BMX_Toothpick_Init
        anim = BMX_Toothpick_Range
        OutAnim = BMX_Toothpick_Out
        NoBlend = yes
        grindbail = GrindFallLR
        type = grind SparkPos = rear
        flip_anim = flip_anim
    }
endscript

script Trick_Bike_Feeble_left \{ name = "Feeble Grind" stall_name = 'Feeble Stall' }
    bike_grind {
        name = <name>
        stall_name = <stall_name>
        Score = 200
        GrindTweak = 14
        InitAnim = BMX_Feeble_Init
        anim = BMX_Feeble_Range
        OutAnim = BMX_Feeble_Out
        NoBlend = yes
        grindbail = GrindFallLR
        type = grind SparkPos = rear
    }
endscript

script Trick_Bike_Feeble_right \{ name = "Feeble Grind" stall_name = 'Feeble Stall' }
    bike_grind {
        name = <name>
        stall_name = <stall_name>
        Score = 200
        GrindTweak = 14
        InitAnim = BMX_Feeble_Init
        anim = BMX_Feeble_Range
        OutAnim = BMX_Feeble_Out
        NoBlend = yes
        grindbail = GrindFallLR
        type = grind SparkPos = rear
        flip_anim = flip_anim
    }
endscript

script Trick_Bike_Smith_left \{ name = "Smith Grind" stall_name = 'Smith Stall' }
    bike_grind {
        name = <name>
        stall_name = <stall_name>
        Score = 200
        GrindTweak = 14
        InitAnim = BMX_Smith_Init
        anim = BMX_Smith_Range
        OutAnim = BMX_Smith_Out
        NoBlend = yes
        grindbail = GrindFallLR
        type = grind SparkPos = rear
    }
endscript

script Trick_Bike_Smith_right \{ name = "Smith Grind" stall_name = 'Smith Stall' }
    bike_grind {
        name = <name>
        stall_name = <stall_name>
        Score = 200
        GrindTweak = 14
        InitAnim = BMX_Smith_Init
        anim = BMX_Smith_Range
        OutAnim = BMX_Smith_Out
        NoBlend = yes
        grindbail = GrindFallLR
        type = grind SparkPos = rear
        flip_anim = flip_anim
    }
endscript
