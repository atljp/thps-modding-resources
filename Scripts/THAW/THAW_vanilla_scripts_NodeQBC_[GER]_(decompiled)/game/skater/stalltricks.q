StallRelease = [
    {
        trigger = { release r2 100 }
        scr = SkateInOrBail
        NGC_Trigger = { release r1 100 }
        xbox_trigger = { AirTrickLogic l2 r2 200 }
        params = { GrindRelease grindbail = Airborne moveright = -5 movey = 5 }
    }
]

script StallTrick Speed = 1.0 type = grind
    ClearStallScriptFlag
    if bailison
        setstate Air
        goto LipBail
    endif
    KillExtraTricks
    bailoff
    ClearExceptions
    ClearTrickQueue
    SetQueueTricks NoTricks
    SetException Ex = OffMeterTop scr = SkateInOrBail params = { <...> FallingLeft }
    SetException Ex = OffMeterBottom scr = SkateInOrBail params = { <...> FallingRight }
    SetException Ex = SkaterCollideBail scr = SkaterCollideBail
    seteventhandler Ex = MadeOtherSkaterBail scr = MadeOtherSkaterBail_Called
    SetQueueTricks NoTricks
    SetException Ex = Ollied scr = StallOllieOut params = { <...>  }
    settags OutAnim = <OutAnim> InitAnim = <InitAnim> InitSpeed = <InitSpeed> anim = <anim> OneFoot = <OneFoot>
    GetTerrain
    if GotParam CopingHit
        obj_spawnscriptlater CopingHit params = { <...>  }
    endif
    if GotParam IsSpecial
        broadcastevent type = SkaterEnterSpecialTrick
        OnExitRun Exit_Special
    endif
    LaunchStateChangeEvent state = Skater_OnRail
    if IsSkaterOnBike
        ButtonA = LeftRight
        ButtonB = LeftLeft
    else
        ButtonA = RIGHT
        ButtonB = left
    endif
    dobalancetrick ButtonA = <ButtonA> ButtonB = <ButtonB> type = <type> PlayRangeAnimBackwards
    if NOT GotParam stall_name
        FormatText textname = stall_name '%n Stall' n = <name>
    endif
    SetTrickName <stall_name>
    SetTrickScore <Score>
    if GotParam IsExtra
        LaunchExtraMessage
        Skater_Playanim anim = <InitAnim> Speed = <Speed>
    else
        if GotParam InitAnim
            Skater_Playanim anim = <InitAnim> Speed = <Speed>
            wait LIPTRICK_DISPLAY_WAIT frames
        endif
    endif
    if skateinable RIGHT
        can_skate_in = 1
    else
        if skateinable left
            can_skate_in = 1
        endif
    endif
    if GotParam can_skate_in
        if NOT Held r2
            SkateInOrBail GrindRelease grindbail = Airborne moveright = -5 movey = 5
            return 
        else
            SetExtraTricks StallRelease
        endif
    endif
    display Blockspin
    Skater_WaitAnimFinished
    if NOT OnStall
        if NOT onrail
            stopbalancetrick
            goto Airborne
        endif
    endif
    Skater_Playanim anim = <anim> Wobble from = end to = start Speed = <Speed>
    if GotParam idle
        Skater_Playanim anim = <anim> Cycle Speed = <Speed>
    endif
    if GotParam ExtraTricks
        SetExtraTricks tricks = <ExtraTricks> ignore = <name>
    endif
    begin 
    tweaktrick 10
    wait 1 gameframe
    if NOT OnStall
        if NOT onrail
            stopbalancetrick
            if OnGround
                goto ongroundai
            else
                goto Airborne
            endif
        endif
    endif
    repeat 
endscript

script PlayStallBalancingAnim 
    if IsSkaterOnBike
        ButtonA = LeftRight
        ButtonB = LeftLeft
    else
        ButtonA = RIGHT
        ButtonB = left
    endif
    dobalancetrick ButtonA = <ButtonA> ButtonB = <ButtonB> type = <type> PlayRangeAnimBackwards
    Skater_Playanim anim = <anim> Wobble from = end to = start Speed = <Speed>
    if GotParam \{ idle }
        Skater_Playanim anim = <anim> Cycle Speed = <Speed>
    endif
endscript

script StallOllieOut 
    stopbalancetrick
    KillExtraTricks
    norailtricks
    move \{ z = 1 }
    move \{ y = 6 }
    if GotParam \{ boardrotate }
        BoardRotateAfter
    endif
    if GotParam \{ FlipOnOllie }
        FlipAfter
    endif
    if GotParam \{ RotateOnOllie }
        RotateAfter
    endif
    if handlelipolliedirection
        ClearLipCombos
        allowrailtricks
        resetlandedfromvert
    else
        ClearLipCombos
        allowrailtricks
        resetlandedfromvert
    endif
    ExitPointRailSpin \{ stall }
endscript
StallTrickList = [
    [
        Trick_Boardslide_BS
        Trick_LipSlide_FS
        Trick_5050_BS
        Trick_5050_FS
        Trick_LipSlide_BS
        Trick_BoardSlide_FS
        Trick_5050_FS_180
        Trick_5050_BS_180
        Trick_LipSlide_FS
        Trick_Boardslide_BS
        Trick_5050_FS
        Trick_5050_BS
        Trick_BoardSlide_FS
        Trick_LipSlide_BS
        Trick_5050_FS_180
        Trick_5050_BS_180
    ]
    [
        Trick_NoseGrind_BS
        Trick_NoseGrind_FS
        Trick_NoseGrind_BS
        Trick_NoseGrind_FS
        Trick_NoseGrind_BS_180
        Trick_NoseGrind_FS_180
        Trick_NoseGrind_BS_180
        Trick_NoseGrind_FS_180
        Trick_NoseGrind_FS
        Trick_NoseGrind_BS
        Trick_NoseGrind_FS
        Trick_NoseGrind_BS
        Trick_NoseGrind_FS_180
        Trick_NoseGrind_BS_180
        Trick_NoseGrind_FS_180
        Trick_NoseGrind_BS_180
    ]
    [
        Trick_5_0_BS
        Trick_5_0_FS
        Trick_5_0_BS
        Trick_5_0_FS
        Trick_5_0_BS_180
        Trick_5_0_FS_180
        Trick_5_0_BS_180
        Trick_5_0_FS_180
        Trick_5_0_FS
        Trick_5_0_BS
        Trick_5_0_FS
        Trick_5_0_BS
        Trick_5_0_FS_180
        Trick_5_0_BS_180
        Trick_5_0_FS_180
        Trick_5_0_BS_180
    ]
    [
        Trick_Boardslide_BS
        Trick_LipSlide_FS
        Trick_Tailslide_BS
        Trick_Noseslide_FS
        Trick_LipSlide_BS
        Trick_BoardSlide_FS
        Trick_Tailslide_BS_180
        Trick_Noseslide_FS_180
        Trick_LipSlide_FS
        Trick_Boardslide_BS
        Trick_Tailslide_FS
        Trick_Noseslide_BS
        Trick_BoardSlide_FS
        Trick_LipSlide_BS
        Trick_TailSlide_FS_180
        Trick_Noseslide_BS_180
    ]
    [
        Trick_Boardslide_BS
        Trick_LipSlide_FS
        Trick_Noseslide_BS
        Trick_Tailslide_FS
        Trick_LipSlide_BS
        Trick_BoardSlide_FS
        Trick_Noseslide_BS_180
        Trick_TailSlide_FS_180
        Trick_LipSlide_FS
        Trick_Boardslide_BS
        Trick_Noseslide_FS
        Trick_Tailslide_BS
        Trick_BoardSlide_FS
        Trick_LipSlide_BS
        Trick_Noseslide_FS_180
        Trick_Tailslide_BS_180
    ]
    [
        Trick_Overcrook_BS
        Trick_Crooked_FS
        Trick_Overcrook_BS
        Trick_Crooked_FS
        Trick_Overcrook_BS_180
        Trick_Crooked_FS_rot
        Trick_Overcrook_BS_180
        Trick_Crooked_FS_180
        Trick_Overcrook_FS
        Trick_Crooked_BS
        Trick_Overcrook_FS
        Trick_Crooked_BS
        Trick_Overcrook_FS_rot
        Trick_Crooked_BS_180
        Trick_Overcrook_FS_180
        Trick_Crooked_BS_180
    ]
    [
        Trick_Crooked_BS
        Trick_Overcrook_FS
        Trick_Crooked_BS
        Trick_Overcrook_FS
        Trick_Crooked_BS_180
        Trick_Overcrook_FS_rot
        Trick_Crooked_BS_180
        Trick_Overcrook_FS_180
        Trick_Crooked_FS
        Trick_Overcrook_BS
        Trick_Crooked_FS
        Trick_Overcrook_BS
        Trick_Crooked_FS_rot
        Trick_Overcrook_BS_180
        Trick_Crooked_FS_180
        Trick_Overcrook_BS_180
    ]
    [
        Trick_Smith_BS
        Trick_Feeble_FS
        Trick_Smith_BS
        Trick_Feeble_FS
        Trick_Smith_BS_180
        Trick_Feeble_FS_rot
        Trick_Smith_BS_180
        Trick_Feeble_FS_180
        Trick_Smith_FS
        Trick_Feeble_BS
        Trick_Smith_FS
        Trick_Feeble_BS
        Trick_Smith_FS_rot
        Trick_Feeble_BS_180
        Trick_Smith_FS_180
        Trick_Feeble_BS_180
    ]
    [
        Trick_Feeble_BS
        Trick_Smith_FS
        Trick_Feeble_BS
        Trick_Smith_FS
        Trick_Feeble_BS_180
        Trick_Smith_FS_rot
        Trick_Feeble_BS_180
        Trick_Smith_FS_180
        Trick_Feeble_FS
        Trick_Smith_BS
        Trick_Feeble_FS
        Trick_Smith_BS
        Trick_Feeble_FS_rot
        Trick_Smith_BS_180
        Trick_Feeble_FS_180
        Trick_Smith_BS_180
    ]
]
