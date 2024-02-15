LIPTRICK_DISPLAY_WAIT = 15
DefaultLipTrick = {
    name = "Nose Stall"
    Score = 300
    CopingHit = 1
    InitAnim = NoseTailStall_Init
    anim = NoseTailStall_Range
    OutAnim = NoseTailStall_Out
    boardrotate
    RotateOnOllie
    FlipOnOllie
    ReleaseFrame = 20
    ComboLip
    ExtraTricks = LipTrickExtras
}
DefaultBikeLipTrick = {
    name = "Liptrick"
    Score = 300
    CopingHit = 1
    InitAnim = BMX_idle
    anim = BMX_idle
    OutAnim = BMX_idle
    RotateOnOllie
    FlipOnOllie
    ReleaseFrame = 20
    ComboLip
    noExtraTricks = LipTrickExtras
}
Trick_Blunt = {
    scr = LipMacro2
    params = {
        name = "Blunt to Fakie"
        CopingHit = 5
        Score = 500
        InitAnim = BluntToFakie_Init
        anim = BluntToFakie_Range
        OutAnim = BluntToFakie_Out
        boardrotate
        ExtraTricks = LipTrickExtras
    }
}
Trick_MuteInvert = {
    scr = LipMacro2
    params = {
        name = "Invert"
        Score = 500
        InitAnim = MuteInvert_Init
        anim = MuteInvert_Range
        OutAnim = MuteInvert_Out
        NoOllie
        boardrotate
        ExtraTricks = InvertExtras
    }
}
Trick_Eggplant = {
    scr = LipMacro2
    params = {
        name = "Eggplant"
        Score = 550
        InitAnim = EggPlant_Init
        anim = EggPlant_Range
        OutAnim = EggPlant_Out
        NoOllie
        FlipAfter
        RevertBS
        ExtraTricks = InvertExtras
    }
}
Trick_GymnastPlant = {
    scr = LipMacro2
    params = {
        name = "Gymnast Plant"
        Score = 575
        InitAnim = GymnastPlant_Init
        anim = GymnastPlant_Range
        OutAnim = GymnastPlant_Out
        NoOllie
        FlipAfter
        RevertBS
        ExtraTricks = InvertExtras
    }
}
Trick_RockToFakie = {
    scr = LipMacro2
    params = {
        name = "Rock to Fakie"
        Score = 500
        CopingHit = 1
        InitAnim = FakieRockAndRoll_Init
        anim = FakieRockAndRoll_Range
        OutAnim = FakieRockAndRoll_Out
        boardrotate
        ExtraTricks = LipTrickExtras
    }
}
Trick_Disaster = {
    scr = LipMacro2
    params = {
        name = "Disaster"
        Score = 600
        CopingHit = 20
        InitAnim = Disaster_Init
        anim = Disaster_Range
        OutAnim = Disaster_Out
        FlipAfter
        RotateOnOllie
        ExtraTricks = LipTrickExtras
    }
}
Trick_Invert = {
    scr = LipMacro2
    params = {
        name = "Varial Invert to Fakie"
        Score = 450
        InitAnim = Invert_Init
        anim = Invert_Range
        OutAnim = Invert_Out
        NoOllie
        boardrotate
        RevertBS
        ExtraTricks = InvertExtras
    }
}
Trick_OneFootInvert = {
    scr = LipMacro2
    params = {
        name = "One Foot Invert"
        Score = 500
        InitAnim = OneFootInvert_Init
        anim = OneFootInvert_Range
        OutAnim = OneFootInvert_Out
        NoOllie
        boardrotate
        ReleaseFrame = 30
        RevertBS
        ExtraTricks = InvertExtras
    }
}
Trick_BSFootplant = {
    scr = LipMacro2
    params = {
        name = "BS Boneless"
        Score = 550
        InitAnim = BSFootplant_Init
        anim = BSFootplant_Range
        OutAnim = BSFootplant_Out
        OllieOutAnim = BSFootplant_OllieOut
        FlipAfter
        UseBoneless
        ReleaseFrame = 20
        BAILSCRIPT = NoseManualBail
        RevertBS
        ExtraTricks = LipTrickExtras
    }
}
Trick_AxleStall = {
    scr = LipMacro2
    params = {
        name = "Axle Stall"
        Score = 400
        CopingHit = 8
        InitAnim = AxleStall_Init
        anim = AxleStall_Range
        OutAnim = AxleStall_Out
        OllieOutAnim = AxleStall_OllieOut
        FlipAfter
        ExtraTricks = LipTrickExtras
    }
}
Trick_Nosepick = {
    scr = LipMacro2
    params = {
        name = "FS Nosepick"
        Score = 550
        CopingHit = 15
        InitAnim = FSIndyNosePick_Init
        anim = FSIndyNosePick_Range
        OutAnim = FSIndyNosePick_Out
        FlipAfter
        RotateOnOllie
        ExtraTricks = LipTrickExtras
    }
}
Trick_Noseblunt = {
    scr = LipMacro2
    params = {
        name = "FS Noseblunt"
        Score = 550
        CopingHit = 20
        InitAnim = FS180Noseblunt_Init
        anim = FS180Noseblunt_Range
        OutAnim = FS180Noseblunt_Out
        FlipAfter
        RotateOnOllie
        ExtraTricks = LipTrickExtras
    }
}
Trick_AndrectInvert = {
    scr = LipMacro2
    params = {
        name = "Andrecht Invert"
        Score = 550
        InitAnim = AndrectInvert_Init
        anim = AndrectInvert_Range
        OutAnim = AndrectInvert_Out
        NoOllie
        FlipAfter
        boardrotate
        ExtraTricks = InvertExtras
        ReleaseFrame = 20
    }
}
Trick_Switcheroo = {
    scr = LipMacro2
    params = {
        name = "The Switcheroo"
        Score = 600
        InitAnim = Switcheroo_Init
        anim = Switcheroo_Range
        OutAnim = Switcheroo_Out
        NoOllie
        boardrotate
        FlipAfter
        ExtraTricks = InvertExtras
        ReleaseFrame = 30
    }
}
Trick_Russian = {
    scr = LipMacro2
    params = {
        name = "Russian Boneless"
        Score = 6500
        InitAnim = BSFootplant_Init
        pingpong
        anim = Russian_Idle
        OutAnim = Russian_Out
        OllieOutAnim = Russian_OllieOut
        FlipAfter
        UseBoneless
        ReleaseFrame = 20
        BAILSCRIPT = NoseManualBail
        RevertBS
        ExtraTricks = LipTrickExtras
        IsSpecial
    }
}
Trick_HoHoSadplant = {
    scr = LipMacro2
    params = {
        name = "Ho Ho Sad Plant"
        Score = 6750
        InitAnim = HoHoSadPlant_Init
        pingpong
        anim = HoHoSadPlant_Idle
        OutAnim = HoHoSadPlant_Out
        IsSpecial
        NoOllie
    }
}
Trick_HeelflipFSInvert = {
    scr = LipMacro2
    params = {
        name = "Heelflip FS Invert"
        Score = 6500
        InitAnim = HeelflipFSInvert_Init
        anim = HeelflipFSInvert_Range
        OutAnim = HeelflipFSInvert_Out
        NoOllie
        IsSpecial
        FlipAfter
        RevertBS
        ExtraTricks = InvertExtras
    }
}
Trick_Around = {
    scr = LipMacro2
    params = {
        name = "Around The World"
        Score = 7250
        Speed = 0.9500
        InitAnim = Special_MikeV_Around_Int
        anim = Special_MikeV_Around_Range
        OutAnim = Special_MikeV_Around_Out
        IsSpecial
        NoBalance
        ReleaseFrame = 15
        NoOllie
    }
}
Trick_BamLip = {
    scr = LipMacro2
    params = {
        name = "BAM"
        Score = 6750
        Speed = 0.8500
        InitAnim = Special_Bam_Lip_Init
        anim = Special_Bam_Lip_Idle
        OutAnim = Special_Bam_Lip_Out
        IsSpecial
        PlayBalanceAnimOnce
        ReleaseFrame = 20
        RotateOnOllie
        ExtraTricks = LipTrickExtras
    }
}
Trick_AlvaCrail = {
    scr = LipMacro2
    params = {
        name = "Crailspin"
        Score = 6750
        Speed = 1.0
        idle
        InitAnim = Special_Alva_CrailSpin_Init
        anim = Special_Alva_CrailSpin_Idle
        OutAnim = Special_Alva_CrailSpin_Out
        IsSpecial
        ReleaseFrame = 20
        ExtraTricks = LipTrickExtras
    }
}
SpecialLipTricks = [
    {
        trigger = {
            TripleInOrder
            up
            RIGHT
            triangle
            1000
        }
        trickslot = SpLip_U_R_Triangle
    }
    {
        trigger = {
            TripleInOrder
            up
            down
            triangle
            1000
        }
        trickslot = SpLip_U_D_Triangle
    }
    {
        trigger = {
            TripleInOrder
            up
            left
            triangle
            1000
        }
        trickslot = SpLip_U_L_Triangle
    }
    {
        trigger = {
            TripleInOrder
            RIGHT
            up
            triangle
            1000
        }
        trickslot = SpLip_R_U_Triangle
    }
    {
        trigger = {
            TripleInOrder
            RIGHT
            down
            triangle
            1000
        }
        trickslot = SpLip_R_D_Triangle
    }
    {
        trigger = {
            TripleInOrder
            RIGHT
            left
            triangle
            1000
        }
        trickslot = SpLip_R_L_Triangle
    }
    {
        trigger = {
            TripleInOrder
            down
            up
            triangle
            1000
        }
        trickslot = SpLip_D_U_Triangle
    }
    {
        trigger = {
            TripleInOrder
            down
            RIGHT
            triangle
            1000
        }
        trickslot = SpLip_D_R_Triangle
    }
    {
        trigger = {
            TripleInOrder
            down
            left
            triangle
            1000
        }
        trickslot = SpLip_D_L_Triangle
    }
    {
        trigger = {
            TripleInOrder
            left
            up
            triangle
            1000
        }
        trickslot = SpLip_L_U_Triangle
    }
    {
        trigger = {
            TripleInOrder
            left
            RIGHT
            triangle
            1000
        }
        trickslot = SpLip_L_R_Triangle
    }
    {
        trigger = {
            TripleInOrder
            left
            down
            triangle
            1000
        }
        trickslot = SpLip_L_D_Triangle
    }
    {
        trigger = {
            TripleInOrder
            a = up
            b = up
            triangle
            1000
        }
        trickslot = SpLip_U_U_Triangle
    }
]
liptricks = [
    {
        trigger = { Press upleft 500 }
        trickslot = Lip_TriangleUL
    }
    {
        trigger = { Press upright 500 }
        trickslot = Lip_TriangleUR
    }
    {
        trigger = { Press downleft 500 }
        trickslot = Lip_TriangleDL
    }
    {
        trigger = { Press downright 500 }
        trickslot = Lip_TriangleDR
    }
    {
        trigger = { Press left 500 }
        trickslot = Lip_TriangleL
    }
    {
        trigger = { Press RIGHT 500 }
        trickslot = Lip_TriangleR
    }
    {
        trigger = { Press down 500 }
        trickslot = Lip_TriangleD
    }
    {
        trigger = { Press up 500 }
        trickslot = Lip_TriangleU
    }
    {
        trigger = { Press triangle 1000 }
        scr = LipMacro2
        params = DefaultLipTrick
    }
]
ComboLipTricks = [
    {
        trigger = { Press upleft 500 }
        trickslot = Lip_TriangleUL
    }
    {
        trigger = { Press upright 500 }
        trickslot = Lip_TriangleUR
    }
    {
        trigger = { Press downleft 500 }
        trickslot = Lip_TriangleDL
    }
    {
        trigger = { Press downright 500 }
        trickslot = Lip_TriangleDR
    }
    {
        trigger = { Press left 500 }
        trickslot = Lip_TriangleL
    }
    {
        trigger = { Press RIGHT 500 }
        trickslot = Lip_TriangleR
    }
    {
        trigger = { Press down 500 }
        trickslot = Lip_TriangleD
    }
    {
        trigger = { Press up 500 }
        trickslot = Lip_TriangleU
    }
    {
        trigger = { Press triangle 500 }
        DefaultLipTrick
    }
]
LipTrickExtras = [
    {
        trigger = { InOrder a = Circle b = Circle 300 }
        Trick_AxleStall
    }
    {
        trigger = { InOrder Circle square 300 }
        Trick_BSFootplant
    }
    {
        trigger = { InOrder a = square b = square 300 }
        Trick_Disaster
    }
    {
        trigger = { InOrder square Circle 300 }
        Trick_RockToFakie
    }
    {
        trigger = { InOrder a = triangle b = triangle 300 }
        Trick_Noseblunt
    }
    {
        trigger = { InOrder triangle square 300 }
        Trick_Nosepick
    }
    {
        trigger = { InOrder triangle Circle 300 }
        Trick_Blunt
    }
]
InvertExtras = [
    {
        trigger = { InOrder a = square b = square 300 }
        Trick_OneFootInvert
    }
    {
        trigger = { InOrder a = triangle b = triangle 300 }
        Trick_MuteInvert
    }
    {
        trigger = { InOrder a = Circle b = Circle 300 }
        Trick_GymnastPlant
    }
    {
        trigger = { InOrder Circle square 300 }
        Trick_Invert
    }
    {
        trigger = { InOrder square Circle 300 }
        Trick_Eggplant
    }
    {
        trigger = { InOrder triangle Circle 300 }
        Trick_AndrectInvert
    }
]
AndrectExtras = [
    {
        trigger = { InOrder triangle triangle 500 }
        Trick_Switcheroo
    }
]

script LipMacro2 Speed = 1.0
    if bailison
        setstate Air
        goto LipBail
    endif
    KillExtraTricks
    bailoff
    setstate lip
    ClearExceptions
    ClearTrickQueue
    SetQueueTricks NoTricks
    if obj_flagset FLAG_SKATER_LIPTRICK_CAM_REVERSED
        SetException Ex = OffMeterTop scr = LipOut params = { <...>  }
        if skateinable lip
            SetException Ex = OffMeterBottom scr = LipOut params = {spine y = -24 <...> }
        else
            SetException Ex = OffMeterBottom scr = LipBail params = { <...>  }
        endif
    else
        SetException Ex = OffMeterBottom scr = LipOut params = { <...>  }
        if skateinable lip
            SetException Ex = OffMeterTop scr = LipOut params = {spine y = -24 <...> }
        else
            SetException Ex = OffMeterTop scr = LipBail params = { <...>  }
        endif
    endif
    SetException Ex = SkaterCollideBail scr = SkaterCollideBail
    seteventhandler Ex = MadeOtherSkaterBail scr = MadeOtherSkaterBail_Called
    LaunchStateChangeEvent state = Skater_OnLip
    SetQueueTricks NoTricks
    if GotParam NoOllie
        SetException Ex = Ollied scr = LipOut params = { <...>  }
    else
        SetException Ex = Ollied scr = OllieLipOut params = { <...>  }
    endif
    GetTerrain
    if GotParam CopingHit
        obj_spawnscriptlater CopingHit params = { <...>  }
    endif
    SetTrickName <name>
    SetTrickScore <Score>
    if GotParam IsSpecial
        broadcastevent type = SkaterEnterSpecialTrick
        OnExitRun Exit_Special
    endif
    if GotParam BloodFrame
        obj_spawnscriptlater LipBlood params = { <...>  }
    endif
    if obj_flagset FLAG_SKATER_LIPCOMBO
        BlendperiodOut 0.0
        if GotParam ComboLip
            flip
            boardrotate
        endif
        dobalancetrick ButtonA = RIGHT ButtonB = left type = lip PlayRangeAnimBackwards
        if GotParam NoOllie
            if GotParam InitAnim
                if NOT GotParam IsExtra
                    Skater_Playanim anim = <InitAnim> Speed = <Speed>
                    Skater_WaitAnimFinished
                else
                    BlendperiodOut 0.3000
                    wait LIPTRICK_DISPLAY_WAIT frames
                endif
            else
                wait LIPTRICK_DISPLAY_WAIT frames
            endif
        else
            if GotParam InitAnim
                if GotParam IsExtra
                    BlendperiodOut 0.2000
                endif
                Skater_Playanim anim = <InitAnim> Speed = <Speed>
                Skater_WaitAnimFinished
            else
                wait LIPTRICK_DISPLAY_WAIT frames
            endif
        endif
        if GotParam IsExtra
            LaunchExtraMessage
        endif
        PlayLipBalancingAnim <...> 
        display Blockspin
    else
        if GotParam IsExtra
            LaunchExtraMessage
            if GotParam NoOllie
                PlayLipBalancingAnim <...> 
                display Blockspin
                wait 40 frames
            else
                Skater_Playanim anim = <InitAnim> Speed = <Speed>
                display Blockspin
                Skater_WaitAnimFinished
                PlayLipBalancingAnim <...> 
            endif
        else
            if GotParam InitAnim
                Skater_Playanim anim = <InitAnim> Speed = <Speed>
                wait LIPTRICK_DISPLAY_WAIT frames
                display Blockspin
                Skater_WaitAnimFinished
            endif
            PlayLipBalancingAnim <...> 
        endif
    endif
    if GotParam IsSpecial
        LaunchSpecialMessage
    endif
    if GotParam RevertFS
        obj_setflag FLAG_SKATER_REVERTFS
    endif
    if GotParam RevertBS
        obj_setflag FLAG_SKATER_REVERTBS
    endif
    if GotParam ExtraTricks
        SetExtraTricks tricks = <ExtraTricks> ignore = <name>
    endif
    if NOT GotParam NoBalance
        begin 
        tweaktrick 10
        wait 1 gameframe
        repeat 
    else
        if GotParam PlayBalanceAnimOnce
            Skater_WaitAnimFinished
        endif
        goto LipOut params = { <...>  }
    endif
endscript

script PlayLipBalancingAnim 
    if NOT GotParam NoBalance
        dobalancetrick ButtonA = RIGHT ButtonB = left type = lip PlayRangeAnimBackwards
        if GotParam pingpong
            Skater_Playanim anim = <anim> pingpong Speed = <Speed>
        else
            Skater_Playanim anim = <anim> Wobble from = end to = start Speed = <Speed>
        endif
        if GotParam idle
            Skater_Playanim anim = <anim> Cycle Speed = <Speed>
        endif
    else
        if GotParam PlayBalanceAnimOnce
            Skater_Playanim anim = <anim> Speed = <Speed>
        endif
    endif
endscript

script CopingHit \{ CopingHit = 1 }
    wait <CopingHit> frames
    if ((<terrain> = 3)|| (<terrain> = 4))
        playsound copinghit3_11 Random (@ pitch = 90 @ pitch = 100 @ pitch = 110) vol = 80
    else
        playbonksound
    endif
endscript

script LipBlood 
    wait <BloodFrame> frames
    obj_playsound Random (@ BailSlap01 @ BailSlap02 @ BailSlap03)
    BloodParticlesOn \{name = 'breath.png' start_col = -1 end_col = 587202559 num = 2 emit_w = 2.0 emit_h = 2.0 Angle = 50 size = 4.0 bone = Head growth = 2 time = 0.5000 Speed = 250 grav = -1000 life = 0.5000}
    obj_spawnscriptlater \{ BloodSuperTiny }
    wait \{ 1 frame }
endscript

script LipOut y = 1
    ClearException Ollied
    ClearLipCombos
    stopbalancetrick
    KillExtraTricks
    SetException Ex = Landed scr = LipLand params = { <...>  }
    if GotParam OutAnim
        Skater_Playanim anim = <OutAnim> BlendPeriod = 0.0 Speed = <Speed>
        BlendperiodOut 0.3000
    else
        if GotParam InitAnim
            Skater_Playanim anim = <InitAnim> backwards Speed = <Speed>
        else
        endif
    endif
    if GotParam boardrotate
        BoardRotateAfter
    endif
    if NOT GotParam spine
        if GotParam ReleaseFrame
            Skater_WaitAnim framesfromend = <ReleaseFrame>
        else
        endif
    endif
    setstate Air
    move z = 1
    move y = <y>
    if GotParam spine
        rotate z = 180
        flip
        SetTrickName 'Spine Transfer'
        SetTrickScore TRANSFER_POINTS
        display
    endif
    DoNextTrick
    norailtricks
    InAirExceptions
    SetException Ex = Landed scr = LipLand params = { <...>  }
    BlendperiodOut 0
    Skater_WaitAnimFinished
    SetException Ex = GroundGone scr = GroundGone
    if OnGround
        LandSkaterTricks
        DoNextManualTrick
    else
        ClearManualTrick
    endif
    if InAir
        if GotParam FlipAfter
        else
            FlipAfter
        endif
        RotateAfter
        setlandedfromvert
        goto Airborne
    else
        LandSkaterTricks
        goto ongroundai
    endif
endscript

script ClearLipCombos 
    clearallowlipnogrind
    obj_clearflag \{ FLAG_SKATER_LIPCOMBO }
endscript

script LipLand 
    overridecancelground
    ClearTrickQueue
    SetQueueTricks \{ NoTricks }
    land \{ ReturnBacktoLipLand }
    allowrailtricks
    rotate
    enabledisplayflip
    if GotParam \{ FlipAfter }
    else
        FlipAfter
    endif
    SetExtraTricks_Reverts
    Skater_WaitAnimFinished
    setlandedfromvert
    goto \{ land }
endscript

script LipBail 
    stopbalancetrick
    move \{ z = 1 }
    move \{ y = 6 }
    setstate \{ Air }
    if GotParam \{ FlipOnOllie }
        FlipAfter
    endif
    if GotParam \{ RotateOnOllie }
        RotateAfter
    endif
    if GotParam \{ BAILSCRIPT }
        goto <BAILSCRIPT>
    else
        GotoRandomScript \{[ NoseManualBail ManualBail ]}
    endif
endscript

script OllieLipOut 
    stopbalancetrick
    KillExtraTricks
    norailtricks
    move z = 1
    move y = 6
    if GotParam boardrotate
        BoardRotateAfter
    endif
    if GotParam FlipOnOllie
        FlipAfter
    endif
    if GotParam RotateOnOllie
        RotateAfter
    endif
    setlandedfromvert
    rotate x = 90
    rotate x = -45
    if handlelipolliedirection
        ClearLipCombos
        allowrailtricks
        resetlandedfromvert
    else
        obj_spawnscriptlater SetUpLipCombo
    endif
    if GotParam OllieOutAnim
        ollie OutAnim = <OllieOutAnim> RotateAfter = yes FromLip boost = <boost>
    else
        ollie boost = <boost>
    endif
endscript

script SetUpLipCombo 
    wait \{ 0.3000 seconds }
    obj_setflag \{ FLAG_SKATER_LIPCOMBO }
    allowrailtricks
    allowlipnogrind
    wait \{ 0.3000 seconds }
    if InAir
        clearallowlipnogrind
        obj_clearflag \{ FLAG_SKATER_LIPCOMBO }
        norailtricks
    endif
endscript

script LipTrick params = DefaultLipTrick
    if IsSkaterOnBike
        goto bike_liptrick
    endif
    ClearExceptions
    SetException Ex = SkaterCollideBail scr = SkaterCollideBail
    ClearTrickQueue
    KillExtraTricks
    cancelrotatedisplay
    if obj_flagset FLAG_SKATER_LIPCOMBO
        SetQueueTricks special = SpecialLipTricks ComboLipTricks
    else
        SetQueueTricks special = SpecialLipTricks liptricks
    endif
    UseGrindEvents
    wait 2 gameframe
    DoNextTrick
    ClearExceptions
    SetException Ex = SkaterCollideBail scr = SkaterCollideBail
    ClearTrickQueue
    SetQueueTricks NoTricks
    goto LipMacro2 params = { <params> }
endscript
