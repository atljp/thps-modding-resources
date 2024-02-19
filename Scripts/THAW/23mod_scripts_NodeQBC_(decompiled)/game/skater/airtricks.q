SpecialTricks = [
    {
        trigger = {
            TripleInOrder
            up
            RIGHT
            square
            400
        }
        trickslot = SpAir_U_R_Square
    }
    {
        trigger = {
            TripleInOrder
            up
            down
            square
            400
        }
        trickslot = SpAir_U_D_Square
    }
    {
        trigger = {
            TripleInOrder
            up
            left
            square
            400
        }
        trickslot = SpAir_U_L_Square
    }
    {
        trigger = {
            TripleInOrder
            RIGHT
            up
            square
            400
        }
        trickslot = SpAir_R_U_Square
    }
    {
        trigger = {
            TripleInOrder
            RIGHT
            down
            square
            400
        }
        trickslot = SpAir_R_D_Square
    }
    {
        trigger = {
            TripleInOrder
            RIGHT
            left
            square
            400
        }
        trickslot = SpAir_R_L_Square
    }
    {
        trigger = {
            TripleInOrder
            down
            up
            square
            400
        }
        trickslot = SpAir_D_U_Square
    }
    {
        trigger = {
            TripleInOrder
            down
            RIGHT
            square
            400
        }
        trickslot = SpAir_D_R_Square
    }
    {
        trigger = {
            TripleInOrder
            down
            left
            square
            400
        }
        trickslot = SpAir_D_L_Square
    }
    {
        trigger = {
            TripleInOrder
            left
            up
            square
            400
        }
        trickslot = SpAir_L_U_Square
    }
    {
        trigger = {
            TripleInOrder
            left
            RIGHT
            square
            400
        }
        trickslot = SpAir_L_R_Square
    }
    {
        trigger = {
            TripleInOrder
            left
            down
            square
            400
        }
        trickslot = SpAir_L_D_Square
    }
    {
        trigger = {
            TripleInOrder
            up
            RIGHT
            Circle
            400
        }
        trickslot = SpAir_U_R_Circle
    }
    {
        trigger = {
            TripleInOrder
            up
            down
            Circle
            400
        }
        trickslot = SpAir_U_D_Circle
    }
    {
        trigger = {
            TripleInOrder
            up
            left
            Circle
            400
        }
        trickslot = SpAir_U_L_Circle
    }
    {
        trigger = {
            TripleInOrder
            RIGHT
            up
            Circle
            400
        }
        trickslot = SpAir_R_U_Circle
    }
    {
        trigger = {
            TripleInOrder
            RIGHT
            down
            Circle
            400
        }
        trickslot = SpAir_R_D_Circle
    }
    {
        trigger = {
            TripleInOrder
            RIGHT
            left
            Circle
            400
        }
        trickslot = SpAir_R_L_Circle
    }
    {
        trigger = {
            TripleInOrder
            down
            up
            Circle
            400
        }
        trickslot = SpAir_D_U_Circle
    }
    {
        trigger = {
            TripleInOrder
            down
            RIGHT
            Circle
            400
        }
        trickslot = SpAir_D_R_Circle
    }
    {
        trigger = {
            TripleInOrder
            down
            left
            Circle
            400
        }
        trickslot = SpAir_D_L_Circle
    }
    {
        trigger = {
            TripleInOrder
            left
            up
            Circle
            400
        }
        trickslot = SpAir_L_U_Circle
    }
    {
        trigger = {
            TripleInOrder
            left
            RIGHT
            Circle
            400
        }
        trickslot = SpAir_L_R_Circle
    }
    {
        trigger = {
            TripleInOrder
            left
            down
            Circle
            400
        }
        trickslot = SpAir_L_D_Circle
    }
]
AerialFlips = [
    {
        button1 = down
        button2 = down
        anglex = -360
        name = 'Backflip'
        Score = 1250
        extra = [ Flip_DoubleBack ]
    }
    {
        button1 = leftdown
        button2 = leftdown
        anglex = -360
        name = 'Backflip'
        Score = 1250
        extra = [ Flip_DoubleBack ]
    }
    {
        button1 = up
        button2 = up
        anglex = 360
        name = 'Frontflip'
        Score = 1250
        extra = [ Flip_DoubleFront ]
    }
    {
        button1 = leftup
        button2 = leftup
        anglex = 360
        name = 'Frontflip'
        Score = 1250
        extra = [ Flip_DoubleFront ]
    }
    {
        button1 = left
        button2 = left
        anglez = -360
        name = 'Roll'
        Score = 1250
        extra = [ Flip_DoubleRoll ]
    }
    {
        button1 = LeftLeft
        button2 = LeftLeft
        anglez = -360
        name = 'Roll'
        Score = 1250
        extra = [ Flip_DoubleRoll ]
    }
    {
        button1 = RIGHT
        button2 = RIGHT
        anglez = 360
        name = 'Roll'
        Score = 1250
        extra = [ Flip_DoubleRoll2 ]
    }
    {
        button1 = LeftRight
        button2 = LeftRight
        anglez = 360
        name = 'Roll'
        Score = 1250
        extra = [ Flip_DoubleRoll2 ]
    }
]
Flip_DoubleBack = { button = down anglex = -360 name = 'Double Backflip' Score = 2500 }
Flip_DoubleFront = { button = up anglex = 360 name = 'Double Frontflip' Score = 2500 }
Flip_DoubleRoll = { button = left anglez = -360 name = 'Double Roll' Score = 2500 }
Flip_DoubleRoll2 = { button = RIGHT anglez = 360 name = 'Double Roll' Score = 2500 }
Flip_Rodeo = { button = left angley = 180 name = 'Rodeo' Score = 1250 }
Flip_BSRodeo = { button = RIGHT angley = -180 name = 'BS Rodeo' Score = 1250 }
Flip_Misty = { button = left angley = 180 name = 'Misty Flip' Score = 1250 }
Flip_McTwist = { button = RIGHT angley = -180 name = 'McTwist' Score = 1250 }

script display_flip_text 
    SetTrickName <name>
    SetTrickScore <Score>
    display
endscript
GRABTWEAK_SMALL = 15
GRABTWEAK_MEDIUM = 20
GRABTWEAK_LARGE = 25
GRABTWEAK_EXTRALARGE = 40
GRABTWEAK_SPECIAL = 30
Trick_DaewonChop = {
    scr = FlipTrick
    params = {
        name = "Daewon Chop"
        Score = 3500
        anim = Special_Daewon_DaewonChop
        trickslack = 20
        Speed = 1.0
        IsSpecial
        specialitem_details = eyeball_details
    }
}
Trick_OldSchoolKF = {
    scr = FlipTrick
    params = {
        name = "OldSchool Kickflip"
        Score = 2200
        anim = THPS7_Special_Tony_OldSchoolKF
        trickslack = 20
        Speed = 1.0
        IsSpecial
    }
}
Trick_TrujilloGuitar = {
    scr = GrabTrick
    params = {
        name = "Guitar"
        Score = 2000
        Speed = 1.0
        anim = Special_Trujillo_Guitar_Init
        idle = Special_Trujillo_Guitar_Idle
        OutAnim = Special_Trujillo_Guitar_Out
        IsSpecial
        ForceInit
        specialitem_details = Guitar_details
    }
}
Trick_EyeballGrab = {
    scr = GrabTrick
    params = {
        name = "Eyeball Grab"
        Score = 2000
        Speed = 1.0
        anim = Special_Jimbo_Init
        idle = Special_Jimbo_Idle
        OutAnim = Special_Jimbo_Out
        IsSpecial
        ForceInit
        specialitem_details = JimboEye_details
    }
}
Trick_Shifty360ShovitBSShifty = {
    scr = GrabTrick
    params = {
        name = "Shifty Shifty"
        Speed = 2.0
        Score = 2500
        anim = Shifty360ShovItBSShifty_Init
        ForceInit
        idle = Shifty360ShovItBSShifty_Idle
        idle
        OutAnim = Shifty360ShovItBSShifty_Out
        trickslack = 10
        IsSpecial
        boardrotate
    }
}
Trick_540varielheelfliplien = {
    scr = FlipTrick
    params = {
        name = "360 Varial Heelflip Lien"
        Score = 3500
        anim = _540VarielHeelflipLien
        Speed = 1.300
        IsSpecial
        boardrotate
        trickslack = 20
        Speed = 1.200
        maxspeed = 1.300
    }
}
Trick_FSFlipOneFootTailGrab = {
    scr = GrabTrick
    params = {
        name = "360 Flip Tail Grab"
        Score = 1750
        anim = FSFlipOneFootTailGrab_Init
        ForceInit
        InitSpeed = 1.500
        idle = FSFlipOneFootTailGrab_Idle
        idle
        OutAnim = FSFlipOneFootTailGrab_Out
        IsSpecial
        trickslack = 10
    }
}
Trick_BreakIn = {
    scr = FlipTrick
    params = {
        name = "Back Spin Air"
        Score = 3500
        anim = BreakIn_Init
        boardrotate
        trickslack = 20
        RotateAfter
        Speed = 1.800
        IsSpecial
    }
}
Trick_BigSpinShifty = {
    scr = GrabTrick
    params = {
        name = "BigSpin Shifty"
        Score = 2000
        Speed = 1.200
        anim = FSBigSpinShifty_Init
        idle = FSBigSpinShifty_Idle
        OutAnim = FSBigSpinShifty_Out
        IsSpecial
        ForceInit
        FlipAfter
    }
}
Trick_SambaFlip = {
    scr = GrabTrick
    params = {
        name = "Samba Flip"
        Score = 1850
        anim = SambaFlip
        idle = Indy_Idle
        BackwardsAnim = Indy
        trickslack = 10
        ForceInit
        IsSpecial
        Speed = 1.400
    }
}
Trick_360VarialMcTwist = {
    scr = FlipTrick
    params = {
        name = "360 Varial McTwist"
        Score = 5750
        anim = _360VarialMcTwist
        boardrotate
        IsSpecial
        RevertBS
        nospin
        trickslack = 10
        RotateAfter
        Speed = 1.300
        maxspeed = 1.100
        Spinslack = 20
    }
}
Trick_Indy900 = {
    scr = FlipTrick
    params = {
        name = "Indy 900"
        Score = 11000
        anim = Indy900
        IsSpecial
        boardrotate
        trickslack = 20
        RotateAfter
        nospin
        Speed = 1.300
        maxspeed = 1.400
    }
}
Trick_SitDownAir = {
    scr = GrabTrick
    params = {
        name = "Sit Down Air"
        Score = 1200
        anim = SitDownAir_Init
        idle = SitDownAir_Idle
        IsSpecial
        WaitPercent = 80
    }
}
Trick_GhettoBird = {
    scr = FlipTrick
    params = {
        name = "360 Ghetto Bird"
        Score = 3500
        anim = Ghettobird2
        IsSpecial
        boardrotate
        trickslack = 20
        nospin
        Speed = 1.0
    }
}
Trick_Flamingo = {
    scr = GrabTrick
    params = {
        name = "Flamingo"
        Score = 2000
        anim = Flamingo_Init
        idle = Flamingo_Idle
        OutAnim = Flamingo_Out
        Speed = 1.200
        IsSpecial
    }
}
Trick_The900 = {
    scr = FlipTrick
    params = {
        name = "The 900"
        Score = 9000
        anim = The900
        IsSpecial
        boardrotate
        trickslack = 20
        RotateAfter
        nospin
        Speed = 1.300
        maxspeed = 1.400
    }
}
Trick_KFBackflip = {
    scr = FlipTrick
    params = {
        name = "Kickflip Backflip"
        Score = 3750
        anim = KickFlipBodyBackFlip
        IsSpecial
        Speed = 1.0
        nospin
        trickslack = 15
        Spinslack = 25
    }
}
Trick_FS540 = {
    scr = FlipTrick
    params = {
        name = "FS 540"
        Score = 5500
        anim = FS540
        boardrotate
        IsSpecial
        trickslack = 10
        RevertBS
        RotateAfter
        nospin
        Speed = 0.9000
        Spinslack = 40
    }
}
Trick_McTwist = {
    scr = FlipTrick
    params = {
        name = "McTwist"
        Score = 5000
        anim = McTwist
        boardrotate
        IsSpecial
        RevertBS
        nospin
        trickslack = 10
        RotateAfter
        Speed = 1.0
        maxspeed = 1.100
        Spinslack = 20
    }
}
Trick_2KickMadonnaFlip = {
    scr = GrabTrick
    params = {
        name = "Double Kickflip Madonna"
        Score = 2250
        anim = _2KickMadonnaFlip_Init
        idle = Madonna_Idle
        OutAnim = _2KickMadonnaFlip_Out
        IsSpecial
        ForceInit
        trickslack = 15
        Speed = 1.150
    }
}
Trick_AirCasperFlip = {
    scr = GrabTrick
    params = {
        name = "Casper Flip 360 Flip"
        Score = 2500
        anim = AirCasperFlip_Init
        idle = AirCasperFlip_Idle
        OutAnim = AirCasperFlip_Out
        IsSpecial
        Speed = 1.100
        ForceInit
        trickslack = 20
    }
}
Trick_540TailWhip = {
    scr = FlipTrick
    params = {
        name = "540 TailWhip"
        Score = 2500
        anim = _540TailWhip
        IsSpecial
        boardrotate
        Speed = 1.100
        maxspeed = 1.200
        trickslack = 15
    }
}
Trick_Gazelle = {
    scr = FlipTrick
    params = {
        name = "Gazelle Underflip"
        Score = 3500
        anim = GazelleUnderflip
        IsSpecial
        boardrotate
        trickslack = 20
        nospin
    }
}
HIGHSPEED = 1.0
Trick_SemiFlip = {
    scr = FlipTrick
    params = {
        name = "Semi Flip"
        Score = 2500
        anim = SemiFlip
        boardrotate
        IsSpecial
        Speed = 1.100
        trickslack = 20
    }
}
Trick_FingerFlipAirWalk = {
    scr = FlipTrick
    params = {
        name = "Fingerflip Airwalk"
        Score = 2750
        anim = FingerFlipAirWalk
        IsSpecial
        boardrotate
        Speed = 1.0
        trickslack = 30
    }
}
Trick_1234 = {
    scr = FlipTrick
    params = {
        name = "1-2-3-4"
        Score = 2500
        anim = _1234
        IsSpecial
        Speed = 0.8000
        trickslack = 20
    }
}
Trick_DoubleKFindy = {
    scr = FlipTrick
    params = {
        name = "Double Kickflip Varial Indy"
        Score = 2500
        anim = DoubleKFVarialIndy
        maxspeed = 1.200
        trickslack = 20
        IsSpecial
        boardrotate
        HoldFrame = 15
    }
}
Trick_540Flip = {
    scr = FlipTrick
    params = {
        name = "540 Flip"
        Score = 2250
        anim = _540Flip
        boardrotate
        IsSpecial
        Speed = 1.100
        maxspeed = 1.200
        trickslack = 20
    }
}
Trick_HardFlipBackFootFlip = {
    scr = FlipTrick
    params = {
        name = "Hardflip Late Flip"
        Score = 2500
        anim = HardFlipBackFootFlip
        IsSpecial
        trickslack = 15
        Speed = 1.0
        boardrotate
    }
}
Trick_KickFlipUnderFlip = {
    scr = FlipTrick
    params = {
        name = "Kickflip Underflip"
        Score = 1750
        anim = KickFlipUnderFlip
        IsSpecial
        trickslack = 10
        maxspeed = 1.300
        Speed = 1.100
    }
}
Trick_QuadrupleHeelFlip = {
    scr = FlipTrick
    params = {
        name = "Quad Heelflip"
        Score = 3250
        anim = QuadrupleHeelFlip
        IsSpecial
        trickslack = 10
        Speed = 1.0
    }
}
Trick_BamBendAir = {
    scr = GrabTrick
    params = {
        name = "Bam Bend Air"
        Speed = 1.300
        Score = 1300
        anim = BamBendAir_Init
        idle = BamBendAir_Idle
        trickslack = 10
        IsSpecial
    }
}
Trick_HalfCabUnderFlip = {
    scr = FlipTrick
    params = {
        name = "HalfCab UnderFlip"
        Score = 3500
        anim = Special_Rodney_HlfcabUndrFlip
        IsSpecial
        trickslack = 10
        Speed = 0.6000
        FlipAfter
        stream = Spec_Mullen01
    }
}
Trick_EndlessKickflip = {
    scr = GrabTrick
    params = {
        name = "Endless Kickflip"
        Score = 1200
        anim = Special_Koston_EndlessFlip_Init
        idle = Special_Koston_EndlessFlip_Idle
        OutAnim = Special_Koston_EndlessFlip_Out
        IsSpecial
        stream = Spec_Koston02
    }
}
Trick_Koston900 = {
    scr = FlipTrick
    params = {
        name = "No Problem 900"
        Score = 1750
        anim = Special_Koston_900
        IsSpecial
        boardrotate
        trickslack = 20
        RotateAfter
        nospin
        Speed = 1.300
        maxspeed = 1.400
        stream = Spec_Koston01
    }
}
Trick_DarksideJapan = {
    scr = GrabTrick
    params = {
        name = "Darkslide Japan"
        Score = 1200
        anim = Special_Bob_DrksldJapan_Init
        idle = Special_Bob_DrksldJapan_Idle
        OutAnim = Special_Bob_DrksldJapan_Out
        IsSpecial
        stream = Spec_Burnquist01
    }
}
Trick_EndlessHandflip = {
    scr = GrabTrick
    params = {
        name = "Endless Handflip"
        Score = 1200
        anim = Special_Tony_Windmill_Init
        idle = Special_Tony_Windmill_Idle
        OutAnim = Special_Tony_Windmill_Out
        IsSpecial
        stream = Spec_Hawk01
    }
}
Trick_DoubleFistin = {
    scr = GrabTrick
    params = {
        name = "Double Fistin"
        unlockflag = GLOBALFLAG_PLACEHOLDER
        Score = 1450
        anim = Special_GrafPunk_Init
        idle = Special_GrafPunk_Idle
        OutAnim = Special_GrafPunk_Out
        IsSpecial
        specialitem_details = spraycanDouble_details
        stream = Spec_Tagger01
    }
}
Trick_ShecklerGrab = {
    scr = GrabTrick
    params = {
        name = "Sheckler Grab"
        unlockflag = GLOBALFLAG_PLACEHOLDER
        Score = 2000
        anim = Special_Sheckler_Grab_Init
        idle = Special_Sheckler_Grab_Idle
        OutAnim = Special_Sheckler_Grab_Out
        trickslack = 10
        IsSpecial
        stream = Spec_Sheckler01
    }
}
Trick_BigSpinFlip = {
    scr = FlipTrick
    params = {
        name = "Bigspin Flip"
        Score = 500
        anim = BigSpinFlip
        boardrotate
        FlipAfter
        Speed = 1.500
        maxspeed = 1.100
        ExtraTricks = Extra_VarialKickflipB
    }
}
Trick_FSFlip = {
    scr = FlipTrick
    params = {
        name = "FS Flip"
        Score = 500
        anim = FSFlip
        boardrotate
        FlipAfter
        maxspeed = 1.500
        ExtraTricks = Extra_VarialKickflipC
    }
}
Trick_BSFlip = {
    scr = FlipTrick
    params = {
        name = "BS Flip"
        Score = 500
        anim = BSFlip
        boardrotate
        FlipAfter
        maxspeed = 1.500
        ExtraTricks = Extra_VarialKickflipB
    }
}
Trick_FSBigSpin = {
    scr = FlipTrick
    params = {
        name = "BS Bigspin"
        Score = 500
        anim = BSBigSpin
        Speed = 1.200
        FlipAfter
        maxspeed = 2
        ExtraTricks = Extra540ShoveItB
    }
}
Trick_BSBigSpin = {
    scr = FlipTrick
    params = {
        name = "FS Bigspin"
        Score = 500
        anim = FSBigSpin
        Speed = 1.400
        FlipAfter
        maxspeed = 2
        ExtraTricks = ExtraFS540ShoveIt
    }
}
Trick_BackfootShoveIt = {
    scr = FlipTrick
    params = {
        name = "Back Foot Shove-It"
        Score = 150
        anim = NollieBSShoveIt
        Nollie = PopShoveIt
        ExtraTricks = Extra_360BackfootShoveIt
        boardrotate
    }
}
Extra_360BackfootShoveIt = [
    {
        trigger = { Press square 300 }
        scr = FlipTrick
        params = {
            name = "360 Back Foot Shove-It"
            boardrotate
            Score = 500
            anim = NollieBS360ShoveIt
            IsExtra
            UseCurrent
        }
    }
]
Trick_VarialKickflip = {
    scr = FlipTrick
    params = {
        name = "Varial Kickflip"
        Score = 300
        anim = VarialKickFlip
        boardrotate
        Nollie = NollieVarialKickFlip
        ExtraTricks = Extra_VarialKickflip
    }
}
Extra_VarialKickflip = [
    {
        trigger = { Press square 300 }
        scr = FlipTrick
        params = {
            name = "360 Flip"
            Score = 550
            boardrotate
            Speed = 0.9000
            anim = _360Flip
            Nollie = Nollie360Flip
            IsExtra
            UseCurrent
        }
    }
]
Extra_VarialKickflipB = [
    {
        trigger = { Press square 300 }
        scr = FlipTrick
        params = {
            name = "360 Bigspin Flip"
            Score = 550
            boardrotate
            Speed = 0.8000
            anim = _360BigSpinFlip
            Nollie = _360BigSpinFlip
            IsExtra
            UseCurrent
        }
    }
]
Extra_VarialKickflipC = [
    {
        trigger = { Press square 300 }
        scr = FlipTrick
        params = {
            name = "360 FS Flip"
            Score = 550
            boardrotate
            Speed = 0.8000
            anim = _360FSFlip
            Nollie = _360FSFlip
            IsExtra
            UseCurrent
        }
    }
]
Trick_VarialHeelflip = {
    scr = FlipTrick
    params = {
        name = "Varial Heelflip"
        Score = 300
        anim = VarialHeelFlip
        boardrotate
        Nollie = NollieVarialHeelflip
        ExtraTricks = Extra_VarialHeelflip
    }
}
Extra_VarialHeelflip = [
    {
        trigger = { Press square 300 }
        scr = FlipTrick
        params = {
            name = "360 Heelflip"
            boardrotate
            Score = 500
            anim = _360HeelFlip
            Speed = 1.300
            trickslack = 20
            IsExtra
            UseCurrent
        }
    }
]
Trick_Hardflip = {
    scr = FlipTrick
    params = {
        name = "Hardflip"
        Score = 300
        anim = HardFlip
        boardrotate
        Nollie = NollieHardFlip
        ExtraTricks = Extra_360Hardflip
    }
}
Extra_360Hardflip = [
    {
        Trigger_Extra_Flip
        params = {
            name = "360 Hardflip"
            boardrotate
            Score = 500
            anim = _360HardFlip
            IsExtra
            trickslack = 20
            Speed = 1.100
            UseCurrent
        }
    }
]
Trick_InwardHeelflip = {
    scr = FlipTrick
    params = {
        name = "Inward Heelflip"
        Score = 350
        anim = InwardHeelflip
        boardrotate
        Nollie = NollieInwardFlip
        trickslack = 15
        ExtraTricks = Extra_360InwardHeelflip
    }
}
Extra_360InwardHeelflip = [
    {
        Trigger_Extra_Flip
        params = {
            name = "360 Inward Heelflip"
            boardrotate
            Score = 500
            anim = _360InwardHeelflip
            IsExtra
            trickslack = 15
            Speed = 1.0
            UseCurrent
        }
    }
]
Trick_Impossible = {
    scr = FlipTrick
    params = {
        name = "Impossible"
        Score = 100
        anim = Impossible
        Nollie = NollieImpossible
        ExtraTricks = DoubleImpossible
    }
}
DoubleImpossible = [
    {
        trigger = { Press square 300 }
        scr = FlipTrick
        params = {
            name = "Double Impossible"
            Score = 500
            anim = DoubleImpossible
            ExtraTricks = TripleImpossible
            trickslack = 15
            Speed = 1.200
            IsExtra
            UseCurrent
        }
    }
]
TripleImpossible = [
    {
        trigger = { Press square 300 }
        scr = FlipTrick
        params = {
            name = "Triple Impossible"
            Score = 1000
            anim = TripleImpossible
            IsExtra
            UseCurrent
            Speed = 1.200
            trickslack = 15
        }
    }
]
Trick_PopShoveIt = {
    scr = FlipTrick
    params = {
        name = "Pop Shove-It"
        Score = 100
        anim = PopShoveitBS
        boardrotate
        Nollie = NollieBSShoveIt
        ExtraTricks = Extra360ShoveIt
    }
}
Extra360ShoveIt = [
    {
        trigger = { Press square 300 }
        scr = FlipTrick
        params = {
            name = "360 Shove-It"
            Score = 500
            anim = _360ShoveIt
            Nollie = NollieBS360ShoveIt
            boardrotate
            ExtraTricks = Extra540ShoveIt
            IsExtra
            UseCurrent
        }
    }
]
Extra540ShoveIt = [
    {
        trigger = { Press square 300 }
        scr = FlipTrick
        params = {
            name = "540 Shove-It"
            Score = 1000
            anim = _540ShoveIt
            IsExtra
            boardrotate
            UseCurrent
        }
    }
]
Extra540ShoveItB = [
    {
        trigger = { Press square 300 }
        scr = FlipTrick
        params = {
            name = "BS Bigspin 540"
            Score = 1000
            anim = _BSBigSpin540
            IsExtra
            boardrotate
            UseCurrent
        }
    }
]
Trick_FSShoveIt = {
    scr = FlipTrick
    params = {
        name = "FS Shove-It"
        Score = 100
        anim = PopShoveIt
        Nollie = NollieFSShoveIt
        boardrotate
        ExtraTricks = ExtraFS360ShoveIt
    }
}
ExtraFS360ShoveIt = [
    {
        trigger = { Press square 300 }
        scr = FlipTrick
        params = {
            name = "360 FS Shove-It"
            boardrotate
            Score = 500
            anim = FS360ShoveIt
            Nollie = Nollie360ShoveIt
            ExtraTricks = ExtraFS540ShoveIt
            IsExtra
            UseCurrent
        }
    }
]
ExtraFS540ShoveIt = [
    {
        trigger = { Press square 300 }
        scr = FlipTrick
        params = {
            name = "540 FS Shove-It"
            Score = 1000
            anim = FS540ShoveIt
            IsExtra
            boardrotate
            UseCurrent
        }
    }
]
Trick_BackfootKickflip = {
    scr = FlipTrick
    params = {
        name = "Back Foot Kickflip"
        Score = 150
        Speed = 0.9500
        anim = NollieKickflip
        Nollie = KickFlip
        ExtraTricks = Extra_DBackfootKickflip
    }
}
Extra_DBackfootKickflip = [
    {
        trigger = { Press square 300 }
        scr = FlipTrick
        params = {
            name = "Double Back Foot Flip"
            Score = 550
            Speed = 0.9000
            trickslack = 15
            anim = DoubleNollieKickflip
            IsExtra
            UseCurrent
        }
    }
]
Trick_BackfootHeelflip = {
    scr = FlipTrick
    params = {
        name = "Back Foot Heelflip"
        Score = 150
        Speed = 0.9500
        anim = NollieHeelflip
        Nollie = HeelFlip
        ExtraTricks = Extra_DBackfootHeelflip
    }
}
Extra_DBackfootHeelflip = [
    {
        trigger = { Press square 300 }
        scr = FlipTrick
        params = {
            name = "Double Back Foot Heelflip"
            Score = 550
            Speed = 0.9000
            trickslack = 15
            anim = DoubleNollieHeelflip
            IsExtra
            UseCurrent
        }
    }
]
Trick_Kickflip = {
    scr = FlipTrick
    params = {
        name = "Kickflip"
        Score = 100
        anim = KickFlip
        Nollie = NollieKickflip
        ExtraTricks = DoubleKickFlip
    }
}
DoubleKickFlip = [
    {
        trigger = { Press square 300 }
        scr = FlipTrick
        params = {
            name = "Double Kickflip"
            Score = 500
            anim = DoubleKickFlip
            Nollie = DoubleNollieKickflip
            ExtraTricks = TripleKickFlip
            IsExtra
            trickslack = 15
            UseCurrent
        }
    }
]
TripleKickFlip = [
    {
        trigger = { Press square 300 }
        scr = FlipTrick
        params = {
            name = "Triple Kickflip"
            Score = 1000
            anim = TripleKickFlip
            IsExtra
            Speed = 1
            UseCurrent
        }
    }
]
Trick_Heelflip = {
    scr = FlipTrick
    params = {
        name = "Heelflip"
        Score = 100
        anim = HeelFlip
        Nollie = NollieHeelflip
        ExtraTricks = DoubleHeelFlip
    }
}
DoubleHeelFlip = [
    {
        trigger = { Press square 300 }
        scr = FlipTrick
        params = {
            name = "Double Heelflip"
            Score = 500
            anim = DoubleHeelFlip
            Nollie = DoubleNollieHeelflip
            ExtraTricks = TripleHeelFlip
            trickslack = 15
            IsExtra
            UseCurrent
        }
    }
]
TripleHeelFlip = [
    {
        trigger = { Press square 300 }
        scr = FlipTrick
        params = {
            name = "Triple Heelflip"
            Score = 1000
            anim = TripleHeelFlip
            IsExtra
            UseCurrent
        }
    }
]
Trick_OllieAirwalk = {
    scr = FlipTrick
    params = {
        name = "Ollie Airwalk"
        Score = 500
        Speed = 1.0
        anim = OllieAirWalk
        ExtraTricks = Extra_OllieAirwalk
    }
}
Extra_OllieAirwalk = [
    {
        Trigger_Extra_Flip
        params = {
            name = "Ollie Airwalk Late Shove-it"
            Score = 1050
            anim = OllieAirwalkShoveIt
            boardrotate
            Speed = 1.0
            IsExtra
            UseCurrent
        }
    }
]
Trick_OllieNorth = {
    scr = FlipTrick
    params = {
        name = "Ollie North"
        Score = 169
        anim = OllieNorth
        Speed = 1.0
        trickslack = 15
        ExtraTricks = Extra_OllieNorth
        HoldFrame = 15
    }
}
Extra_OllieNorth = [
    {
        Trigger_Extra_Flip
        params = {
            name = "Ollie North Back Foot Flip"
            Score = 1050
            anim = OllieNorthBackFootFlip
            Speed = 1.0
            IsExtra
            UseCurrent
        }
    }
]
Trick_FFImpossible = {
    scr = FlipTrick
    params = {
        name = "Front Foot Impossible"
        Score = 525
        anim = FrontFootImposs
        trickslack = 25
        Speed = 1
        ExtraTricks = Extra_FFImpossible
    }
}
Extra_FFImpossible = [
    {
        Trigger_Extra_Flip
        params = {
            name = "Dbl. FF Impossible"
            Score = 1075
            anim = DoubleFrontFootImposs
            UseCurrent
            Speed = 1
            trickslack = 25
            IsExtra
        }
    }
]
Trick_HFVarialLien = {
    scr = FlipTrick
    params = {
        name = "Heelflip Varial Lien"
        Score = 800
        anim = HeelFlipVarialLien
        boardrotate
        trickslack = 15
    }
}
Trick_Fingerflip = {
    scr = FlipTrick
    params = {
        name = "Fingerflip"
        Score = 700
        anim = FingerFlipVert
        trickslack = 25
        Speed = 1.100
        ExtraTricks = Extra_DoubleFingerflip
    }
}
Extra_DoubleFingerflip = [
    {
        Trigger_Extra_Flip
        params = {
            name = "Double Fingerflip"
            Score = 1000
            anim = DoubleFingerFlipVert
            Speed = 1.100
            trickslack = 25
            IsExtra
            UseCurrent
        }
    }
]
Trick_SalFlip = {
    scr = FlipTrick
    params = {
        name = "Sal Flip"
        Score = 900
        anim = SalFlip
        trickslack = 25
        ExtraTricks = Extra_DoubleSalFlip
        Speed = 1.250
    }
}
Extra_DoubleSalFlip = [
    {
        Trigger_Extra_Flip
        params = {
            name = "360 Sal Flip"
            Score = 1150
            anim = DoubleSalFlip
            boardrotate
            trickslack = 25
            Speed = 1.250
            UseCurrent
        }
    }
]
Trick_180Varial = {
    scr = FlipTrick
    params = {
        name = "180 Varial"
        Score = 700
        anim = _180Varial
        boardrotate
        Speed = 1.150
        trickslack = 25
        ExtraTricks = Trick_360Varial
    }
}
Trick_360Varial = [
    {
        Trigger_Extra_Flip
        params = {
            name = "360 Varial"
            Score = 900
            anim = _360Varial
            Speed = 0.9000
            trickslack = 25
            boardrotate
            IsExtra
            UseCurrent
        }
    }
]
Trick_Japan = {
    scr = GrabTrick
    params = {
        name = "Japan"
        Score = 350
        anim = JapanAir
        idle = JapanAir_Idle
        ExtraTricks = Trick_OneFootJapan
    }
}
Trick_OneFootJapan = [
    {
        Trigger_Extra_Grab
        params = {
            name = "One Foot Japan"
            Score = 800
            tweaktrick = GRABTWEAK_LARGE
            anim = OneFootJapan
            Speed = 1.300
            idle = OneFootJapan_Idle
            WaitPercent = 70
            IsExtra
        }
    }
]
Trick_Crail = {
    scr = GrabTrick
    params = {
        name = "Crail Grab"
        Score = 350
        anim = Crail
        idle = Crail_Idle
        ExtraTricks = Extra_TuckKnee
    }
}
Extra_TuckKnee = [
    {
        Trigger_Extra_Grab
        params = {
            name = "TuckKnee"
            Score = 400
            anim = TuckKnee
            IsExtra
            idle = TuckKnee_Idle
        }
    }
]
Trick_SaranWrap = {
    scr = GrabTrick
    params = {
        name = "Wrap Around"
        Score = 450
        tweaktrick = GRABTWEAK_LARGE
        anim = SaranWrap
        idle = SaranWrap_Idle
        OutAnim = SaranWrap_Out
        ExtraTricks = Trick_BetweenTheLegs
    }
}
Trick_BetweenTheLegs = [
    {
        Trigger_Extra_Grab
        params = {
            name = "Body Wrap"
            Score = 600
            tweaktrick = GRABTWEAK_LARGE
            anim = BetweenTheLegs_In
            idle = BetweenTheLegs_Idle
            OutAnim = BetweenTheLegs_Out
            Speed = 1.200
            IsExtra
        }
    }
]
Trick_Cannonball = {
    scr = GrabTrick
    params = {
        name = "Cannonball"
        Score = 250
        tweaktrick = GRABTWEAK_SMALL
        anim = CannonBall
        idle = CannonBall_Idle
        Speed = 0.7500
        ExtraTricks = Extra_CannonballFingerflip
    }
}
Extra_CannonballFingerflip = [
    {
        Trigger_Extra_Grab
        params = {
            name = "Fingerflip Cannonball"
            Score = 500
            tweaktrick = GRABTWEAK_SMALL
            anim = CannonballFingerFlip
            BackwardsAnim = CannonBall
            idle = CannonBall_Idle
            Speed = 1.400
            IsExtra
        }
    }
]
Trick_Stalefish = {
    scr = GrabTrick
    params = {
        name = "Stalefish"
        Score = 350
        anim = Stalefish
        idle = Stalefish_Idle
        ExtraTricks = Trick_Stalefish_Layback
    }
}
Trick_Stalefish_Layback = [
    {
        Trigger_Extra_Grab
        params = {
            name = "Stalefish Tweak"
            Score = 400
            anim = Stalefish_Layback
            idle = Stalefish_Layback_Idle
            IsExtra
        }
    }
]
Trick_Benihana = {
    scr = GrabTrick
    params = {
        name = "Benihana"
        Score = 300
        anim = Benihana
        idle = Benihana_Idle
        OutAnim = Benihana_Out
        ExtraTricks = BenihanaFingerFlip
        ForceInit
        ExtraTricks = Trick_Sacktap
    }
}
Trick_Sacktap = [
    {
        Trigger_Extra_Grab
        params = {
            name = "Sacktap"
            Score = 1500
            anim = SackTap_Init
            idle = SackTap_Range
            OutAnim = SackTap_Out
            Speed = 1.500
            ForceInit
            trickslack = 20
            IsExtra
        }
    }
]
Trick_Crossbone = {
    scr = GrabTrick
    params = {
        name = "Crossbone"
        Score = 425
        anim = CrossBone
        idle = CrossBone_Idle
        ExtraTricks = Trick_CrookedCop
    }
}
Trick_CrookedCop = [
    {
        Trigger_Extra_Grab
        params = {
            name = "CrookedCop"
            Score = 550
            anim = CrookedCop
            idle = CrookedCop_Idle
            IsExtra
        }
    }
]
Trick_Airwalk = {
    scr = GrabTrick
    params = {
        name = "Airwalk"
        Score = 450
        anim = AirWalk
        idle = AirWalk_Idle2
        ExtraTricks = Trick_ChristAir
    }
}
Trick_ChristAir = [
    {
        Trigger_Extra_Grab
        params = {
            name = "Christ Air"
            Score = 550
            anim = ChristAir_Init
            idle = ChristAir_Idle
            OutAnim = ChristAir_Out
            ForceInit
            IsExtra
        }
    }
]
Trick_IndyNosebone = {
    scr = GrabTrick
    params = {
        name = "Indy Nosebone"
        Score = 350
        anim = Nosebone
        idle = Nosebone_Idle
        ExtraTricks = Trick_DelMarIndy
    }
}
Trick_DelMarIndy = [
    {
        Trigger_Extra_Grab
        params = {
            name = "Del Mar Indy"
            Score = 400
            anim = IndyDelMar
            idle = IndyDelMar_Idle
            IsExtra
        }
    }
]
Trick_Tailgrab = {
    scr = GrabTrick
    params = {
        name = "Tailgrab"
        Score = 300
        anim = TailGrab
        idle = TailGrab_Idle
        ExtraTricks = Trick_OneFootTailgrab
    }
}
Trick_OneFootTailgrab = [
    {
        Trigger_Extra_Grab
        params = {
            name = "One Foot Tailgrab"
            Score = 500
            anim = OneFootTailGrab
            idle = OneFootTailGrab_Idle
            IsExtra
        }
    }
]
Trick_Madonna = {
    scr = GrabTrick
    params = {
        name = "Madonna"
        Score = 750
        tweaktrick = GRABTWEAK_EXTRALARGE
        anim = Madonna
        idle = Madonna_Idle
        WaitPercent = 70
        ExtraTricks = Trick_Judo
    }
}
Trick_Judo = [
    {
        Trigger_Extra_Grab
        params = {
            name = "Judo"
            Score = 1150
            tweaktrick = 50
            anim = JudoGrab
            idle = JudoGrab_Idle
            Speed = 1.0
            IsExtra
        }
    }
]
Trick_FSShifty = {
    scr = GrabTrick
    params = {
        name = "FS Shifty"
        Score = 500
        anim = Shifty
        idle = Shifty_Idle
        ExtraTricks = Extra_BSShifty
    }
}
Extra_BSShifty = [
    {
        Trigger_Extra_Grab
        params = {
            name = "BS Shifty"
            Score = 800
            anim = BSShifty
            idle = BSShifty_Idle
            IsExtra
        }
    }
]
Trick_Melon = {
    scr = GrabTrick
    params = {
        name = "Melon"
        Score = 300
        anim = MelonGrab
        idle = MelonGrab_Idle
        ExtraTricks = Trick_Method
    }
}
Trick_Method = [
    {
        Trigger_Extra_Grab
        params = {
            name = "Method"
            Score = 400
            anim = method
            idle = Method_Idle
            Speed = 1.200
            IsExtra
        }
    }
]
Trick_Nosegrab = {
    scr = GrabTrick
    params = {
        name = "Nosegrab"
        Score = 300
        anim = NoseGrab
        idle = NoseGrab_Idle
        ExtraTricks = Trick_Rocket
    }
}
Trick_Rocket = [
    {
        Trigger_Extra_Grab
        params = {
            name = "Rocket Air"
            Score = 400
            anim = RocketAir
            idle = RocketAir_Idle
            IsExtra
        }
    }
]
Trick_Mute = {
    scr = GrabTrick
    params = {
        name = "Mute"
        Score = 350
        anim = MuteGrab
        idle = MuteGrab_Idle
        ExtraTricks = Trick_Seatbelt
    }
}
Trick_Seatbelt = [
    {
        Trigger_Extra_Grab
        params = {
            name = "Seatbelt Air"
            Score = 500
            anim = SeatBelt
            idle = SeatBelt_Idle
            Speed = 0.6000
            IsExtra
        }
    }
]
Trick_Indy = {
    scr = GrabTrick
    params = {
        name = "Indy"
        Score = 300
        anim = Indy
        idle = Indy_Idle
        ExtraTricks = Trick_Stiffy
    }
}
Trick_Stiffy = [
    {
        Trigger_Extra_Grab
        params = {
            name = "Stiffy"
            Score = 500
            anim = Stiffy
            idle = Stiffy_Idle
            Speed = 1.250
            ForceInit
            IsExtra
        }
    }
]
Trick_BarrelRoll = {
    scr = FlipTrick
    params = {
        name = "Barrel Roll"
        Score = 800
        anim = BarrelRoll
        nospin
        trickslack = 10
        boardrotate
        Speed = 1.0
        maxspeed = 1.100
        Spinslack = 10
    }
}
ScavengerF = {
    scr = FlipTrick
    params = { name = "\c4Obiekt umieszczony!\c0" Score = 0 anim = HeelFlip SH_Drop }
}
FireballF = {
    scr = FlipTrick
    params = {
        name = "\c4Strza³!\c0"
        Score = 100
        anim = HeelFlip
        skew_angle = 0.0
        fireball
        ExtraTricks = DoubleFireballF
    }
}
DoubleFireballF = [
    {
        trigger = { Press square 300 }
        scr = FlipTrick
        params = {
            name = "\c4Podwójny strza³!\c0"
            Score = 500
            anim = DoubleHeelFlip
            skew_angle = -5.0
            fireball
            ExtraTricks = TripleFireballF
            IsExtra
            trickslack = 15
            UseCurrent
        }
    }
]
TripleFireballF = [
    {
        trigger = { Press square 300 }
        scr = FlipTrick
        params = {
            name = "\c4Potrójny strza³!\c0"
            Score = 1000
            anim = TripleHeelFlip
            skew_angle = 5.0
            fireball
            ExtraTricks = QuadFireballF
            IsExtra
            UseCurrent
        }
    }
]
QuadFireballF = [
    {
        trigger = { Press square 300 }
        scr = FlipTrick
        params = {
            name = "\c4Poczwórny strza³!\c0"
            Score = 2000
            anim = QuadrupleHeelFlip
            skew_angle = 10.0
            fireball
            IsExtra
            Speed = 1
            UseCurrent
        }
    }
]
FireballB = {
    scr = FlipTrick
    params = {
        name = "\c4Strza³ w ty³!\c0"
        Score = 100
        anim = HeelFlip
        skew_angle = 180.0
        vel_scale = 0.5000
        fireball
        ExtraTricks = DoubleFireballB
    }
}
DoubleFireballB = [
    {
        trigger = { Press square 300 }
        scr = FlipTrick
        params = {
            name = "\c4Podwójny strza³ w ty³!\c0"
            Score = 500
            skew_angle = 185.0
            vel_scale = 0.5000
            fireball
            anim = DoubleHeelFlip
            ExtraTricks = TripleFireballB
            IsExtra
            UseCurrent
        }
    }
]
TripleFireballB = [
    {
        trigger = { Press square 300 }
        scr = FlipTrick
        params = {
            name = "\c4Potrójny strza³ w ty³!\c0"
            Score = 1000
            skew_angle = 175.0
            vel_scale = 0.5000
            fireball
            anim = TripleHeelFlip
            ExtraTricks = QuadFireballB
            IsExtra
            UseCurrent
        }
    }
]
QuadFireballB = [
    {
        trigger = { Press square 300 }
        scr = FlipTrick
        params = {
            name = "\c4Poczwórny strza³ w ty³!\c0"
            Score = 2000
            skew_angle = 190.0
            vel_scale = 0.5000
            fireball
            anim = QuadrupleHeelFlip
            IsExtra
            UseCurrent
        }
    }
]
Trick_Revert = { scr = revert }
airtricks = [
    {
        trigger = {
            TripleInOrder
            a = left
            b = left
            square
            300
        }
        trickslot = Air_L_L_Square
    }
    {
        trigger = {
            TripleInOrder
            a = RIGHT
            b = RIGHT
            square
            300
        }
        trickslot = Air_R_R_Square
    }
    {
        trigger = {
            TripleInOrder
            a = up
            b = up
            square
            300
        }
        trickslot = Air_U_U_Square
    }
    {
        trigger = {
            TripleInOrder
            a = down
            b = down
            square
            300
        }
        trickslot = Air_D_D_Square
    }
    {
        trigger = { AirTrickLogic square upleft 500 }
        trickslot = Air_SquareUL
    }
    {
        trigger = { AirTrickLogic square upright 500 }
        trickslot = Air_SquareUR
    }
    {
        trigger = { AirTrickLogic square downleft 500 }
        trickslot = Air_SquareDL
    }
    {
        trigger = { AirTrickLogic square downright 500 }
        trickslot = Air_SquareDR
    }
    {
        trigger = { AirTrickLogic square up 500 }
        trickslot = Air_SquareU
    }
    {
        trigger = { AirTrickLogic square down 500 }
        trickslot = Air_SquareD
    }
    {
        trigger = { AirTrickLogic square left 500 }
        trickslot = Air_SquareL
    }
    {
        trigger = { AirTrickLogic square RIGHT 500 }
        trickslot = Air_SquareR
    }
    {
        trigger = {
            TripleInOrder
            a = left
            b = left
            Circle
            300
        }
        trickslot = Air_L_L_Circle
    }
    {
        trigger = {
            TripleInOrder
            a = RIGHT
            b = RIGHT
            Circle
            300
        }
        trickslot = Air_R_R_Circle
    }
    {
        trigger = {
            TripleInOrder
            a = up
            b = up
            Circle
            300
        }
        trickslot = Air_U_U_Circle
    }
    {
        trigger = {
            TripleInOrder
            a = down
            b = down
            Circle
            300
        }
        trickslot = Air_D_D_Circle
    }
    {
        trigger = { AirTrickLogic Circle upleft 500 }
        trickslot = Air_CircleUL
    }
    {
        trigger = { AirTrickLogic Circle upright 500 }
        trickslot = Air_CircleUR
    }
    {
        trigger = { AirTrickLogic Circle downleft 500 }
        trickslot = Air_CircleDL
    }
    {
        trigger = { AirTrickLogic Circle downright 500 }
        trickslot = Air_CircleDR
    }
    {
        trigger = { AirTrickLogic Circle up 500 }
        trickslot = Air_CircleU
    }
    {
        trigger = { AirTrickLogic Circle down 500 }
        trickslot = Air_CircleD
    }
    {
        trigger = { AirTrickLogic Circle RIGHT 500 }
        trickslot = Air_CircleR
    }
    {
        trigger = { AirTrickLogic Circle left 500 }
        trickslot = Air_CircleL
    }
    {
        trigger = { AirTrickLogic Circle square 500 }
        scr = #"0xe75aaf4e"
    }
]
SkateToWalkTricks = [
    { SwitchControl_Trigger scr = CheckforSwitchVehicles }
]
Trigger_Extra_Grab_Tweak = {
    trigger = { ExtraGrabTrickLogic Circle 300 }
    scr = GrabTrick
}
Trigger_Extra_Grab = {
    trigger = { Press Circle 300 }
    scr = GrabTrick
}
Trigger_Extra_Flip = {
    trigger = { Press square 300 }
    scr = FlipTrick
}
KickflipExtras = [
    {
        trigger = { Press square 300 }
        scr = FlipTrick
        params = {
            name = "Double Kickflip"
            Score = 500
            anim = DoubleKickFlip
            ExtraTricks = TripleKickFlip
            Speed = 1
            IsExtra
            UseCurrent
        }
    }
    {
        trigger = { Press Circle 300 }
        scr = FlipGrabBlend
        params = {
            name = "Kickflip to Indy"
            Score = 400
            anim1 = KickFlipBlendFS
            Anim2 = Indy
            IsExtra
        }
    }
    {
        trigger = { AirTrickLogic Circle up 300 }
        scr = FlipGrabBlend
        params = {
            name = "Kickflip to Crail"
            Score = 400
            anim1 = KickFlipBlendFS
            Anim2 = Crail
            IsExtra
            GrabStart = 5
            Speed = 1
        }
    }
]
BenihanaFingerFlip = [
    {
        trigger = { AirTrickLogic square up 500 }
        scr = FlipTrick
        params = { name = "Beni Fingerflip" Score = 1000 anim = BenihanaFingerFlip IsExtra }
    }
]
COOL_SPECIAL_TRICKS = 0

script HoldAbleFlipTrick 
    Skater_WaitAnim framesfromend = <HoldFrame>
    begin 
    if Released Circle
        if Released square
            break 
        endif
    endif
    Skater_Playanim anim = <anim> from = current to = current BlendPeriod = 0.0
    WaitOneGameFrame
    tweaktrick GRABTWEAK_MEDIUM
    repeat 
    Skater_Playanim anim = <anim> from = current
    if GotParam boardrotate
        BlendperiodOut 0
        BoardRotateAfter
    endif
    if GotParam RotateAfter
        BlendperiodOut 0
        RotateAfter
    endif
    if GotParam FlipAfter
        BlendperiodOut 0
        FlipAfter
    endif
endscript

script ExitFlipTrick 
    LaunchSubStateExitEvent \{ substate = flip }
    CleanUp_SpecialTrickParticles
endscript

script ExitFliptrick_FullScreenEffect 
    Exit_FullscreenEffect
    ExitFlipTrick
endscript

script GrabTrick Speed = 1.0 x = -180 duration = 1.0 GrabTweak = GRABTWEAK_MEDIUM WaitPercent = 60 button = Circle
    ClearTricksFrom Jumptricks Jumptricks0 Jumptricks
    KillExtraTricks
    ClearExtraGrindTrick
    TurnOffSpecialItem
    if GotParam FromGroundGone
        seteventhandler Ex = Ollied scr = TrickOllie
    else
        ClearException Ollied
    endif
    bailon
    LaunchStateChangeEvent state = Skater_InAir
    LaunchSubStateEntryEvent substate = Grab
    OnExitRun ExitGrabTrick
    if GotParam FullScreenEffect
        <FullScreenEffect>
        OnExitRun ExitGrab_FullScreenEffect
    endif
    if GotParam SpecialSounds
        obj_spawnscriptlater <SpecialSounds>
    endif
    if AbilityEnabled doubletapgrab
        if GotParam ExtraTricks
            SetExtraTricks tricks = <ExtraTricks> duration = 15
        endif
    endif
    BlendPeriod = 0.3000
    if GotParam specialitem_details
        if StructureContains structure = <specialitem_details> force_unflipped
            if Flipped
                flip
                rotate
                boardrotate
                BlendPeriod = 0
            endif
        endif
        TurnOnSpecialItem specialitem_details = <specialitem_details>
    endif
    if GotParam IsExtra
        Skater_Playanim anim = <anim> BlendPeriod = <BlendPeriod> from = current to = end Speed = <Speed>
    else
        Skater_Playanim anim = <anim> BlendPeriod = <BlendPeriod> Speed = <Speed>
    endif
    if GotParam JumpJets
        obj_killspawnedscript name = JumpJets
        obj_spawnscriptlater JumpJets
    endif
    if GotParam stream
        if NOT IsStreamPlaying SFXSpecialStream
            PlayStream <stream> vol = 200 priority = StreamPriorityHigh id = SFXSpecialStream
        endif
    endif
    if GotParam BloodFrame
        wait <BloodFrame> frames
        if GotParam GutsSound
            playsound Random (@ hitblood01 @ hitblood02 @ hitblood03)
        else
            obj_playsound Random (@ BailSlap01 @ BailSlap02 @ BailSlap03)
        endif
        BloodSplat
        obj_spawnscriptlater BloodJackAss
        wait 1 frame
        playsound BailSlap02
    endif
    if GotParam FromGroundGone
        WaitFramesLateOllie frames = 15
        ClearException Ollied
    endif
    Skater_WaitAnim percent = 50
    SetTrickName <name>
    SetTrickScore <Score>
    display
    if GotParam IsSpecial
        LaunchSpecialMessage Cool
        broadcastevent type = SkaterEnterSpecialTrick
    endif
    if GotParam IsExtra
        LaunchExtraMessage
    endif
    if GotParam ForceInit
        Skater_WaitAnimFinished
    else
        Skater_WaitAnim percent = <WaitPercent>
    endif
    if NOT Held Circle
        if Held square
            button = square
        endif
    endif
    begin 
    if Released <button>
        break 
    endif
    if Skater_AnimComplete
        Skater_Playanim anim = <idle> Cycle Speed = <Speed>
        break 
    endif
    WaitOneGameFrame
    repeat 
    begin 
    if Released <button>
        IfReleased_SquareOrCircle <...> 
        break 
    endif
    WaitOneGameFrame
    if GotParam IsSpecial
        tweaktrick GRABTWEAK_SPECIAL
    else
        tweaktrick <GrabTweak>
    endif
    repeat 
    if GotParam boardrotate
        BlendperiodOut 0
        BoardRotateAfter
    endif
    if GotParam trickslack
        Skater_WaitAnim framesfromend = <trickslack>
    endif
    bailoff
    if GotParam IsSpecial
        EndSpecial
    endif
    if GotParam FlipAfter
        FlipAfter
        BlendperiodOut 0
    endif
    if GotParam RotateAfter
        BlendperiodOut 0
        RotateAfter
    endif
    WaitAnimWhilstChecking
    TurnOffSpecialItem
    goto Airborne
endscript

script ExitGrabTrick 
    LaunchSubStateExitEvent \{ substate = Grab }
    CleanUp_SpecialTrickParticles
endscript

script ExitGrab_FullScreenEffect 
    Exit_FullscreenEffect
    ExitGrabTrick
endscript

script IfReleased_SquareOrCircle 
    if GotParam OutAnim
        Skater_Playanim anim = <OutAnim> BlendPeriod = 0.2000 Speed = <Speed>
    else
        if GotParam BackwardsAnim
            Skater_Playanim anim = <BackwardsAnim> backwards BlendPeriod = 0.2000 Speed = <Speed>
        else
            if Skater_AnimEquals AirWalk
                Skater_Playanim anim = <anim> from = current to = 0 BlendPeriod = 0.2000 Speed = <Speed>
            else
                Skater_Playanim anim = <anim> backwards BlendPeriod = 0.2000 Speed = <Speed>
            endif
        endif
    endif
endscript

script Air_To_Tail 
    KillExtraTricks
    ClearTrickQueue
    nospin
    ClearException \{ AirToTail }
    Skater_Playanim \{ anim = Air2Tail Speed = 1.0 BlendPeriod = 0.0 }
    wait \{ 10 gameframes }
    EnterAirToTail
    SetException \{ Ex = ExitAirToTail scr = Air_To_Tail_exit_in_air }
    Skater_WaitAnimFinished
    Skater_Playanim \{ anim = Tailidle Cycle BlendPeriod = 0.0 }
    Skater_WaitAnimFinished
endscript

script Air_To_Tail_exit_in_air 
    ClearException \{ ExitAirToTail }
    ClearTrickQueue
    Air_To_Tail_score
    Skater_Playanim \{ anim = Tail2Air BlendPeriod = 0.0 Speed = 1.500 }
    WaitAnimWhilstChecking
    canspin
    SetException \{ Ex = AirToTail scr = Air_To_Tail }
    goto \{ Airborne }
endscript

script Air_To_Tail_score 
    SetTrickName \{ 'To Tail' }
    SetTrickScore \{ 500 }
    display
    playsound ollieconc Random (@ pitch = 70 @ pitch = 60 @ pitch = 80) vol = 100
endscript

script JumpJets 
    obj_getid
    if NOT obj_flagset \{ FLAG_SKATER_JUMPJETSON }
        if NOT InNetGame
            if NOT GameModeEquals \{ is_singlesession }
                begin 
                skater ::jump
                wait \{ 1 Game frame }
                repeat 2
                obj_spawnscriptlater JumpJetTracker params = { <...>  }
            endif
        endif
    endif
endscript

script JumpJetTracker 
    obj_setflag \{ FLAG_SKATER_JUMPJETSON }
    wait \{ 2 seconds }
    obj_clearflag \{ FLAG_SKATER_JUMPJETSON }
endscript

script _ReplayJumpJets 
    SpawnSkaterScript \{ ReplayJumpJets }
endscript

script ReplayJumpJets 
    obj_getid
endscript
