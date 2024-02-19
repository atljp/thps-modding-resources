MANUAL_DISPLAY_WAIT = 25
ROTATEY_TRIGGER_TIME = 300
TRIGGER_MANUAL_BRANCHFLIP = { InOrder a = square b = square 200 }
SpecialManualTricks = [
    {
        trigger = {
            TripleInOrder
            up
            RIGHT
            triangle
            400
        }
        duration = 700
        trickslot = SpMan_U_R_Triangle
    }
    {
        trigger = {
            TripleInOrder
            up
            down
            triangle
            400
        }
        duration = 700
        trickslot = SpMan_U_D_Triangle
    }
    {
        trigger = {
            TripleInOrder
            up
            left
            triangle
            400
        }
        duration = 700
        trickslot = SpMan_U_L_Triangle
    }
    {
        trigger = {
            TripleInOrder
            RIGHT
            up
            triangle
            400
        }
        duration = 700
        trickslot = SpMan_R_U_Triangle
    }
    {
        trigger = {
            TripleInOrder
            RIGHT
            down
            triangle
            400
        }
        duration = 700
        trickslot = SpMan_R_D_Triangle
    }
    {
        trigger = {
            TripleInOrder
            RIGHT
            left
            triangle
            400
        }
        duration = 700
        trickslot = SpMan_R_L_Triangle
    }
    {
        trigger = {
            TripleInOrder
            down
            up
            triangle
            400
        }
        duration = 700
        trickslot = SpMan_D_U_Triangle
    }
    {
        trigger = {
            TripleInOrder
            down
            RIGHT
            triangle
            400
        }
        duration = 700
        trickslot = SpMan_D_R_Triangle
    }
    {
        trigger = {
            TripleInOrder
            down
            left
            triangle
            400
        }
        duration = 700
        trickslot = SpMan_D_L_Triangle
    }
    {
        trigger = {
            TripleInOrder
            left
            up
            triangle
            400
        }
        duration = 700
        trickslot = SpMan_L_U_Triangle
    }
    {
        trigger = {
            TripleInOrder
            left
            RIGHT
            triangle
            400
        }
        duration = 700
        trickslot = SpMan_L_R_Triangle
    }
    {
        trigger = {
            TripleInOrder
            left
            down
            triangle
            400
        }
        duration = 700
        trickslot = SpMan_L_D_Triangle
    }
]
Trick_CrossFootCasper = {
    scr = Manual
    params = {
        name = "Crossfoot Casper"
        Score = 3500
        InitAnim = Special_Rodney_CrossCasper_Init
        FromWalkAnim = Special_Rodney_CrossCasper_Init
        FromAirAnim = Special_Rodney_CrossCasper_Init
        BalanceAnim = Special_Rodney_CrossCasper_Range
        OutAnim = Special_Rodney_CrossCasper_Out
        OffMeterTop = ManualBail
        OffMeterBottom = ManualLand
        ExtraTricks2 = ManualBranches
        ExtraTricks = FlatlandBranches
        Nollie
        IsSpecial
        ExtraWaitPercent = 40
    }
}
Trick_MikeVHandflip = {
    scr = Manual
    params = {
        name = "Handflip"
        Score = 3500
        InitAnim = Special_MikeV_HandFlip
        FromWalkAnim = Special_MikeV_HandFlip
        FromAirAnim = Special_MikeV_HandFlip
        BalanceIdle = Special_MikeV_HandFlip
        OffMeterTop = ManualLand
        OffMeterBottom = ManualBail
        ExtraTricks2 = ManualBranches
        ExtraTricks = FlatlandBranches
        IsSpecial
        ExtraWaitPercent = 40
    }
}
Trick_StageDive = {
    scr = Manual
    params = {
        name = "Stagedive"
        Score = 3500
        InitAnim = Special_BillyJoe_Stagedive_init
        FromWalkAnim = Special_BillyJoe_Stagedive_init
        FromAirAnim = Special_BillyJoe_Stagedive_init
        BalanceAnim = Special_BillyJoe_Stagedive_Range
        OutAnim = Special_BillyJoe_Stagedive_Out
        OffMeterTop = ManualLand
        OffMeterBottom = ManualBail
        ExtraTricks2 = ManualBranches
        ExtraTricks = FlatlandBranches
        IsSpecial
        ExtraWaitPercent = 40
    }
}
Trick_CrossfootNollieFlip = {
    scr = Manual
    params = {
        name = "360 Crossfoot Nollieflip"
        Score = 3500
        Nollie
        InitAnim = Special_Bam_360CrossFootNF_Init
        FromWalkAnim = Special_Bam_360CrossFootNF_Init
        FromAirAnim = Special_Bam_360CrossFootNF_Init
        BalanceAnim = Special_Bam_360CrossFootNF_Range
        OutAnim = Special_Bam_360CrossFootNF_Out
        OffMeterTop = NoseManualBail
        OffMeterBottom = ManualLand
        IsSpecial
        ExtraWaitPercent = 40
    }
}
Trick_SpaceWalkWave = {
    scr = Manual
    params = {
        name = "Spacewalk Wave"
        Score = 3500
        InitAnim = Manual
        FromAirAnim = ManualFromAir
        FromWalkAnim = JumpAirToManual
        BalanceIdle = Special_Tony_SpaceWave
        OffMeterTop = ManualLand
        OffMeterBottom = ManualBail
        ExtraTricks2 = ManualBranches
        ExtraTricks = FlatlandBranches
        IsSpecial
        ExtraWaitPercent = 40
    }
}
Trick_BluntBoard = {
    scr = Manual
    params = {
        name = "Blunt Board"
        Score = 3500
        InitAnim = Special_Rodriguez_BlntBrd_Init
        FromAirAnim = Special_Rodriguez_BlntBrd_Init
        FromWalkAnim = Special_Rodriguez_BlntBrd_Init
        BalanceAnim = Special_Rodriguez_BlntBrd_Range
        OutAnim = Special_Rodriguez_BlntBrd_Out
        OffMeterTop = ManualLand
        OffMeterBottom = ManualBail
        IsSpecial
        ExtraWaitPercent = 40
        specialitem_details = extraboard_details
    }
}
Trick_SlamSpinner = {
    scr = Manual
    params = {
        name = "Slam Spinner"
        Score = 3500
        InitAnim = SlamSpinner
        FromWalkAnim = SlamSpinner
        FromAirAnim = SlamSpinner
        BalanceAnim = Manual_Range
        OffMeterTop = ManualLand
        OffMeterBottom = ManualBail
        ExtraTricks2 = ManualBranches
        ExtraTricks = FlatlandBranches
        IsSpecial
        ExtraWaitPercent = 40
    }
}
Trick_YeahRight = {
    scr = Manual
    params = {
        name = "Yeah Right"
        Score = 3100
        InitAnim = YeahRight_Init
        FromWalkAnim = YeahRight_Init
        FromAirAnim = YeahRight_Init
        BalanceIdle = YeahRight_Idle
        OffMeterTop = ManualLand
        OffMeterBottom = ManualBail
        OutAnim = YeahRight_Out
        IsSpecial
        ExtraWaitPercent = 40
        OutAnimOnOllie
        specialitem_details = extraboard_details
    }
}
Trick_MixItUp = {
    scr = Manual
    params = {
        name = "Mix It Up"
        Score = 4500
        InitAnim = MixItUp_Init
        FromAirAnim = MixItUp_Init
        BalanceIdle = MixItUp_Idle
        Speed = 1.200
        OffMeterTop = ManualLand
        OffMeterBottom = ManualBail
        ExtraTricks2 = ManualBranches
        ExtraTricks = FlatlandBranches
        OutAnim = MixItUp_Out
        OutAnimOnOllie
        IsSpecial
        ExtraWaitPercent = 40
    }
}
Trick_KickflipSwitch = {
    scr = Manual
    params = {
        name = "Flip 2 Switch"
        Score = 4500
        InitAnim = KickFlipSwitchOneFootManual_Init
        FromAirAnim = KickFlipSwitchOneFootManual_Init
        BalanceAnim = KickFlipSwitchOneFootManual_Range
        OffMeterTop = ManualLand
        OffMeterBottom = ManualBail
        ExtraTricks2 = ManualBranches
        ExtraTricks = FlatlandBranches
        OutAnim = KickFlipSwitchOneFootManual_Out
        OutAnimOnOllie
        IsSpecial
        FlipAfter
        ExtraWaitPercent = 30
        NoOutAnimOnManualLand
    }
}
Trick_HandStandCasper = {
    scr = Manual
    params = {
        name = "Casper Handstand"
        Score = 4500
        InitAnim = HandStandCasper_Init
        FromAirAnim = HandStandCasper_Init
        BalanceAnim = HandStandCasper_Range
        OffMeterTop = ManualLand
        OffMeterBottom = ManualBail
        ExtraTricks = HandstandBranches
        OutAnim = HandStandCasper_Out
        OutAnimOnOllie
        IsSpecial
        ExtraWaitPercent = 40
    }
}
Trick_HoHoStreetPlant = {
    scr = Manual
    params = {
        name = "Ho Ho Street Plant"
        Score = 4500
        InitAnim = HoHoStreetPlant_Init
        FromAirAnim = HoHoStreetPlant_Init
        BalanceIdle = HoHoStreetPlant_Idle
        OutAnim = HoHoStreetPlant_Out
        OutAnimOnOllie
        OffMeterTop = ManualLand
        OffMeterBottom = NoseManualBail
        ExtraTricks = FlatlandBranches
        IsSpecial
        FlipAfter
        NoBlend
    }
}
Trick_NoComplyLate360 = {
    scr = Manual
    params = {
        name = "No Comply 360 Shove-It"
        Score = 4500
        InitAnim = NoComplyLate360
        FromAirAnim = NoComplyLate360
        BalanceAnim = Manual_Range
        OffMeterTop = ManualLand
        OffMeterBottom = ManualBail
        ExtraTricks = ManualBranches
        IsSpecial
        NoBlend
        ExtraTricks = FlatlandBranches
        ExtraWaitPercent = 40
    }
}
Trick_RustySlide = {
    scr = Manual
    params = {
        name = "Rusty Slide Manual"
        Score = 4500
        InitAnim = RustySlide_Init
        FromAirAnim = RustySlide_Init
        BalanceAnim = Primo_Range
        OutAnim = RustySlide_Out
        OffMeterTop = ManualLand
        OffMeterBottom = ManualBail
        friction = 0.5000
        IsSpecial
        boardrotate
        ExtraTricks = FlatlandBranches
        ExtraTricks2 = ToRail_Branches
        FlipGraphic
        NoBlend
    }
}
Trick_Sproing = {
    scr = Manual
    params = {
        name = "Sproing"
        Score = 4500
        InitAnim = Sproing
        FromAirAnim = Sproing
        BalanceAnim = Manual_Range
        OffMeterBottom = ManualBail
        OffMeterTop = ManualLand
        ExtraTricks2 = ManualBranches
        ExtraTricks = FlatlandBranches
        IsSpecial
        SproingFlip
        ExtraWaitPercent = 40
    }
}
Trick_PrimoSlide = {
    scr = Manual
    params = {
        name = "Primo"
        Score = 4000
        InitAnim = Primo_Init
        FromAirAnim = Primo_Init
        BalanceAnim = Primo_Range
        OutAnim = Primo_Out
        OffMeterTop = ManualLand
        OffMeterBottom = ManualBail
        friction = 0.3500
        IsSpecial
        ExtraTricks = FlatlandBranches
        ExtraTricks2 = ToRail_Branches
    }
}
Trick_OneFootOneWheel = {
    scr = Manual
    params = {
        name = "One Wheel Nosemanual"
        Score = 4100
        InitAnim = OneFootOneWheel_Init
        FromAirAnim = OneFootOneWheel_Init
        BalanceAnim = OneFootOneWheel_Range
        OutAnim = PutDownOneWheel
        OffMeterTop = NoseManualBail
        OffMeterBottom = ManualLand
        friction = 0.3500
        IsSpecial
        Nollie
        ExtraTricks2 = NoseManualBranches
        ExtraTricks = FlatlandBranches
    }
}
Trick_DanceParty = {
    scr = Manual
    params = {
        name = "Ahhh yeahhh!"
        Score = 4000
        InitAnim = DanceParty_Init
        FromAirAnim = DanceParty_Init
        BalanceIdle = DanceParty_Idle
        OffMeterTop = ManualLand
        OffMeterBottom = ManualBail
        friction = 20
        IsSpecial
        ExtraTricks = FlatlandBranches
    }
}
Trick_PrimoSpin = {
    scr = Manual
    params = {
        name = "Primo Spin"
        Score = 4500
        InitAnim = Special_Rodney_PrimoSpin_Init
        FromAirAnim = Special_Rodney_PrimoSpin_Init
        BalanceIdle = Special_Rodney_PrimoSpin_Idle
        OffMeterTop = ManualLand
        OffMeterBottom = ManualBail
        OutAnim = Special_Rodney_PrimoSpin_Out
        friction = 0.5000
        IsSpecial
        ExtraTricks = FlatlandBranches
        stream = Spec_Mullen02
    }
}
Trick_Boomerang = {
    scr = Manual
    params = {
        name = "Boomerang"
        Score = 4500
        InitAnim = Special_MikeV_Boomerang
        FromAirAnim = Special_MikeV_Boomerang
        BalanceAnim = NoseManual_range
        BalanceAnim2 = NoseManual_Range2
        Nollie
        OffMeterTop = NoseManualBail
        OffMeterBottom = ManualLand
        ExtraTricks2 = NoseManualBranches
        IsSpecial
        ExtraTricks = FlatlandBranches
        stream = Spec_Vallely02
    }
}
AIR_MANUAL_DURATION = 1000
AIR_MANUAL_TIMING = 400
manualtricks = [
    {
        trigger = { InOrder up down 400 }
        duration = 700
        Trick_Manual
    }
    {
        trigger = { InOrder down up 400 }
        duration = 700
        Trick_NoseManual
    }
]
GroundManualTricks = [
    {
        trigger = { InOrder up down 220 }
        Trick_Manual
    }
    {
        trigger = { InOrder down up 220 }
        Trick_NoseManual
    }
]
GroundRevertManualTricks = [
    {
        trigger = { InOrder up down 220 }
        Trick_Manual
    }
    {
        trigger = { InOrder down up 220 }
        Trick_Manual
    }
]
VehicleManualTricks = [
    {
        trigger = { InOrder up down 220 }
        Trick_Vehicle_Manual
    }
    {
        trigger = { InOrder down up 220 }
        Trick_Vehicle_Manual
    }
]
BikeManualTricks = [
    {
        trigger = { InOrder up down 220 }
        Trick_Bike_Manual
    }
    {
        trigger = { InOrder down up 220 }
        Trick_Bike_NoseManual
    }
]
Trick_Manual = {
    scr = Manual
    params = {
        name = "Manual"
        Score = 100
        InitAnim = Manual
        FromAirAnim = ManualFromAir
        FromWalkAnim = JumpAirToManual
        BalanceAnim = Manual_Range
        BalanceAnim2 = Manual_Range2
        BalanceAnim3 = Manual_Range3
        OffMeterTop = ManualLand
        OffMeterBottom = ManualBail
        ExtraTricks2 = ManualBranches
        ExtraTricks = FlatlandBranches
        CheckCheese
        AllowWallpush
    }
}
Trick_NoseManual = {
    scr = Manual
    params = {
        name = "Nose Manual"
        Score = 100
        InitAnim = NoseManual
        FromAirAnim = NoseManualFromAir
        FromWalkAnim = JumpAirToNoseManual
        BalanceAnim = NoseManual_range
        BalanceAnim2 = NoseManual_Range2
        Nollie
        OffMeterTop = NoseManualBail
        OffMeterBottom = ManualLand
        ExtraTricks2 = NoseManualBranches
        ExtraTricks = FlatlandBranches
        CheckCheese
        AllowWallpush
    }
}
Trick_OneWheeledManual = {
    scr = Manual
    params = {
        name = "One Wheeled Manual"
        Score = 100
        InitAnim = Manual
        FromAirAnim = ManualFromAir
        FromWalkAnim = JumpAirToManual
        BalanceAnim = Manual_Range
        BalanceAnim2 = Manual_Range2
        BalanceAnim3 = Manual_Range3
        OffMeterTop = ManualLand
        OffMeterBottom = ManualBail
        ExtraTricks2 = ManualBranches
        ExtraTricks = FlatlandBranches
        CheckCheese
        AllowWallpush
    }
}
Trick_OneWheeledNoseManual = {
    scr = Manual
    params = {
        name = "One Wheeled Nose Manual"
        Score = 100
        InitAnim = NoseManual
        FromAirAnim = NoseManualFromAir
        FromWalkAnim = JumpAirToNoseManual
        BalanceAnim = NoseManual_range
        BalanceAnim2 = NoseManual_Range2
        Nollie
        OffMeterTop = NoseManualBail
        OffMeterBottom = ManualLand
        ExtraTricks2 = NoseManualBranches
        ExtraTricks = FlatlandBranches
        CheckCheese
        AllowWallpush
    }
}
Trick_Vehicle_Manual = {
    scr = vehicle_manual
    params = {
        name = "Chainsaw Manual"
        Score = 100
        friction = -50
        InitAnim = Manual
        FromAirAnim = ManualFromAir
        FromWalkAnim = JumpAirToManual
        BalanceAnim = Manual_Range
        BalanceAnim2 = Manual_Range2
        BalanceAnim3 = Manual_Range3
        OffMeterTop = ManualLand
        OffMeterBottom = ManualBail
        CheckCheese
    }
}
Trick_OneFootNosemanual = {
    scr = Manual
    params = {
        name = "One Foot Nose Manual"
        Score = 1050
        InitAnim = OneFootNoseManual_Init
        FromAirAnim = OneFootNoseManual_Init
        BalanceAnim = OneFootNoseManual_Range
        Nollie
        OffMeterTop = NoseManualBail
        OffMeterBottom = ManualLand
        IsExtra
        ExtraTricks = NoseManualBranches
        ExtraTricks2 = FlatlandBranches
    }
}
Trick_OneFootManual = {
    scr = Manual
    params = {
        name = "One Foot Manual"
        Score = 1050
        InitAnim = OneFootManual_Init
        FromAirAnim = OneFootManual_Init
        BalanceAnim = OneFootManual_Range
        OffMeterTop = ManualLand
        OffMeterBottom = ManualBail
        ExtraTricks = ManualBranches
        ExtraTricks2 = FlatlandBranches
        IsExtra
    }
}
Trick_Spacewalk = {
    scr = Manual
    params = {
        name = "Spacewalk"
        Score = 1200
        InitAnim = Manual
        FromAirAnim = ManualFromAir
        FromWalkAnim = JumpAirToManual
        BalanceIdle = Spacewalk
        OffMeterTop = ManualLand
        OffMeterBottom = ManualBail
        ExtraTricks2 = ManualBranches
        ExtraTricks = FlatlandBranches
        AllowWallpush
        ExtraSpeedBoost = 250
    }
}
Trick_Handstand = {
    scr = Manual
    params = {
        name = "HandStand"
        Score = 1100
        InitAnim = HandstandHandFlip_Init
        FromAirAnim = HandstandHandFlip_Init
        BalanceAnim = HandstandHandFlip_Range
        OutAnim = HandstandHandFlip_Out
        OffMeterTop = ManualLand
        OffMeterBottom = ManualBail
        friction = 0.5000
        WaitOnOlliePercent = 10
        ExtraTricks = FlatlandBranches
        ExtraTricks2 = HandstandBranches
    }
}
Trick_Casper = {
    scr = Manual
    params = {
        name = "Casper"
        Score = 1100
        InitAnim = Casper_Init
        FromAirAnim = Casper_Init
        BalanceAnim = Casper_Range
        OutAnim = Casper_Out
        OffMeterTop = ManualLand
        OffMeterBottom = NoseManualBail
        friction = 0.5000
        boardrotate
        ExtraTricks = FlatlandBranches
        ExtraTricks2 = CasperBranches
    }
}
Trick_AntiCasper = {
    scr = Manual
    params = {
        name = "Anti Casper"
        Score = 1100
        Nollie
        InitAnim = AntiCasper_Init
        FromAirAnim = AntiCasper_Init
        BalanceAnim = AntiCasper_Range
        OutAnim = AntiCasper_Out
        OffMeterTop = ManualBail
        OffMeterBottom = ManualLand
        friction = 0.5000
        boardrotate
        Nollie
        ExtraTricks = FlatlandBranches
        ExtraTricks2 = AntiCasperBranches
    }
}
Trick_Truckstand = {
    scr = Manual
    params = {
        name = "Truckstand"
        Score = 800
        InitAnim = Truckstand_Init
        FromAirAnim = Truckstand_Init
        BalanceAnim = Truckstand_Range
        OutAnim = Truckstand_Out
        OffMeterTop = ManualLand
        OffMeterBottom = ManualBail
        friction = 1.500
        ExtraTricks = FlatlandBranches
        ExtraTricks2 = TruckstandBranches
    }
}
Trick_SwitchFootPogo = {
    scr = Manual
    params = {
        name = "Switch Foot Pogo"
        Score = 800
        InitAnim = TruckRun_Init
        FromAirAnim = TruckRun_Init
        BalanceIdle = TruckRun
        OutAnim = TruckRun_Out
        OffMeterTop = ManualLand
        OffMeterBottom = ManualBail
        friction = 1
        ExtraTricks = FlatlandBranches
        ExtraTricks2 = SwitchFootPogo_Branches
    }
}
Trick_Pogo = {
    scr = Manual
    params = {
        name = "Pogo"
        Score = 750
        InitAnim = Pogo_Init
        FromAirAnim = Pogo_Init
        BalanceIdle = Pogo_Bounce
        OutAnim = Pogo_Out
        OutSpeed = 1.500
        OffMeterTop = ManualLand
        OffMeterBottom = ManualBail
        friction = 1.500
        ExtraTricks = FlatlandBranches
        boardrotate
        ExtraTricks2 = PogoBranches
        BounceBoobs
    }
}
Trick_ToRail = {
    scr = Manual
    params = {
        name = "To Rail"
        Score = 1050
        InitAnim = Primo_Init
        FromAirAnim = Primo_Init
        BalanceAnim = Primo_Range
        OutAnim = Primo_Out
        OffMeterTop = ManualLand
        OffMeterBottom = ManualBail
        friction = 1.0
        ExtraTricks = FlatlandBranches
        ExtraTricks2 = ToRail_Branches
        IsExtra
    }
}
Trick_Gturn = {
    scr = ManualLink
    params = {
        name = "Nose Pivot"
        Score = 250
        anim = GTurn
        BalanceAnim = Manual
        FlipAfter
        BalanceAnim = Manual_Range
        trickslack = 0
        playcesssound
        extrapercent = 100
        ExtraTricks = FlatlandBranches
        ExtraTricks2 = ManualBranches
        TimeAdd = 1
        SpeedMult = 1.0
        OffMeterTop = ManualBail
        OffMeterBottom = ManualLand
        AllowWallpush
    }
}
Trick_Gturn2 = {
    scr = ManualLink
    params = {
        name = "Pivot"
        Score = 250
        anim = GTurn2
        BalanceAnim = Manual
        FlipAfter
        BalanceAnim = NoseManual_range
        trickslack = 0
        playcesssound
        extrapercent = 100
        ExtraTricks = FlatlandBranches
        ExtraTricks2 = NoseManualBranches
        Nollie
        TimeAdd = 1
        SpeedMult = 1.0
        OffMeterTop = ManualLand
        OffMeterBottom = NoseManualBail
        AllowWallpush
    }
}
Trick_HalfCabImpossible = {
    scr = ManualLink
    params = {
        name = "Half Cab Impossible"
        Score = 750
        anim = HalfCabImpossible
        BalanceAnim = Manual
        FlipAfter
        BoardFlipAfter
        BalanceAnim = Manual_Range
        trickslack = 0
        extrapercent = 100
        ExtraTricks = FlatlandBranches
        ExtraTricks2 = ManualBranches
        TimeAdd = 0
        SpeedMult = 1.0
        OffMeterTop = ManualBail
        IsExtra
        OffMeterBottom = ManualLand
    }
}
Trick_360FlipNoseManual = {
    scr = ManualLink
    params = {
        name = "360 Fingerflip"
        Nollie
        Score = 750
        anim = _360FlipNoseManual
        BalanceAnim = NoseManual
        BalanceAnim = NoseManual_range
        trickslack = 0
        extrapercent = 100
        ExtraTricks = FlatlandBranches
        ExtraTricks2 = NoseManualBranches
        TimeAdd = 0
        SpeedMult = 1.0
        OffMeterTop = ManualLand
        OffMeterBottom = NoseManualBail
    }
}
Trick_PogoFlip = {
    scr = ManualLink
    params = {
        name = "Wrap Around"
        Score = 500
        anim = Pogo_Kickfoot
        BalanceIdle = Pogo_Bounce
        Speed = 1.500
        OutAnim = Pogo_Out
        OutSpeed = 1.500
        ExtraTricks = FlatlandBranches
        ExtraTricks2 = PogoBranches
        parent = "Pogo"
        extrapercent = 100
        trickslack = 0
        IsExtra
    }
}
SwitchFootPogo_Branches = [
    {
        trigger = TRIGGER_MANUAL_BRANCHFLIP
        scr = ManualLink
        params = {
            name = "Half Wrap Truck Transfer"
            Score = 500
            anim = TruckRunFlip
            BalanceIdle = TruckRun
            ExtraTricks = FlatlandBranches
            ExtraTricks2 = SwitchFootPogo_Branches
            parent = "Switch Foot Pogo"
            BoardFlipAfter
            extrapercent = 100
            trickslack = 0
            IsExtra
        }
    }
    {
        trigger = { Press l2 ROTATEY_TRIGGER_TIME }
        scr = SwitchFootPogo_Setup
        params = { name = "Switch Foot Pogo Spin" spin_with_L2 = 1 }
        NGC_Trigger = { InOrder left r1 ROTATEY_TRIGGER_TIME }
        xbox_trigger = { InOrder left r1 ROTATEY_TRIGGER_TIME }
    }
    {
        trigger = { Press r2 ROTATEY_TRIGGER_TIME }
        scr = SwitchFootPogo_Setup
        params = { name = "Switch Foot Pogo Spin" }
        NGC_Trigger = { Press r1 ROTATEY_TRIGGER_TIME }
        xbox_trigger = { Press r1 ROTATEY_TRIGGER_TIME }
    }
]

script SwitchFootPogo_Setup 
    ManualLink name = 'Switch Foot Pogo Spin' Score = 100 RotateY BalanceIdle = TruckRun OutAnim = TruckRun_Out ExtraTricks = FlatlandBranches ExtraTricks2 = SwitchFootPogo_Branches parent = 'Switch Foot Pogo' trickslack = 0 IsExtra spin_with_L2 = <spin_with_L2>
endscript
ToRail_Branches = [
    {
        trigger = TRIGGER_MANUAL_BRANCHFLIP
        scr = ManualLink
        params = {
            name = "Rail Flip"
            Score = 500
            anim = RailFlip
            BalanceAnim = Primo_Range
            ExtraTricks = FlatlandBranches
            ExtraTricks2 = ToRail_Branches
            parent = "To Rail"
            trickslack = 0
            extrapercent = 100
            IsExtra
        }
    }
    {
        trigger = { Press l2 ROTATEY_TRIGGER_TIME }
        scr = #"0xdee38176"
        params = { spin_with_L2 = 1 name = "ToRail Spin" }
        NGC_Trigger = { InOrder left r1 ROTATEY_TRIGGER_TIME }
        xbox_trigger = { InOrder left r1 ROTATEY_TRIGGER_TIME }
    }
    {
        trigger = { Press r2 ROTATEY_TRIGGER_TIME }
        scr = #"0xdee38176"
        params = { name = "ToRail Spin" }
        NGC_Trigger = { Press r1 ROTATEY_TRIGGER_TIME }
        xbox_trigger = { Press r1 ROTATEY_TRIGGER_TIME }
    }
]
CasperBranches = [
    {
        trigger = TRIGGER_MANUAL_BRANCHFLIP
        scr = ManualLink
        params = {
            name = "Casper Flip"
            Score = 500
            extrapercent = 100
            anim = CasperFlip
            Speed = 0.8500
            BalanceAnim = Casper_Range
            OutAnim = Casper_Out
            ExtraTricks = FlatlandBranches
            BoardFlipAfter
            ExtraTricks2 = CasperBranches
            parent = "Casper"
            Blend = 0.0
            trickslack = 0
            boardrotate = 1
            extrapercent = 100
            IsExtra
        }
    }
    {
        trigger = { Press l2 ROTATEY_TRIGGER_TIME }
        scr = CasperSpin_Setup
        params = { spin_with_L2 = 1 name = "Casper Spin" }
        NGC_Trigger = { InOrder left r1 ROTATEY_TRIGGER_TIME }
        xbox_trigger = { InOrder left r1 ROTATEY_TRIGGER_TIME }
    }
    {
        trigger = { Press r2 ROTATEY_TRIGGER_TIME }
        scr = CasperSpin_Setup
        params = { name = "Casper Spin" }
        NGC_Trigger = { Press r1 ROTATEY_TRIGGER_TIME }
        xbox_trigger = { Press r1 ROTATEY_TRIGGER_TIME }
    }
]

script CasperSpin_Setup 
    ManualLink name = 'Casper Spin' Score = 100 RotateY BalanceAnim = Casper_Range OutAnim = Casper_Out ExtraTricks = FlatlandBranches ExtraTricks2 = CasperBranches parent = 'Casper' trickslack = 0 boardrotate = 1 IsExtra spin_with_L2 = <spin_with_L2>
endscript
AntiCasperBranches = [
    {
        trigger = TRIGGER_MANUAL_BRANCHFLIP
        scr = ManualLink
        params = {
            name = "Anti Casper Flip"
            Score = 500
            extrapercent = 100
            anim = AntiCasperFlip
            Speed = 0.7000
            BalanceAnim = AntiCasper_Range
            OutAnim = AntiCasper_Out
            ExtraTricks = FlatlandBranches
            ExtraTricks2 = AntiCasperBranches
            parent = "Anti Casper"
            extrapercent = 100
            Blend = 0.0
            trickslack = 0
            boardrotate = 1
            IsExtra
            Nollie
        }
    }
    {
        trigger = { Press l2 ROTATEY_TRIGGER_TIME }
        scr = AntiCasperSpin_Setup
        params = { spin_with_L2 = 1 name = "Anti Casper Spin" }
        NGC_Trigger = { InOrder left r1 ROTATEY_TRIGGER_TIME }
        xbox_trigger = { InOrder left r1 ROTATEY_TRIGGER_TIME }
    }
    {
        trigger = { Press r2 ROTATEY_TRIGGER_TIME }
        scr = AntiCasperSpin_Setup
        params = { name = "Anti Casper Spin" }
        NGC_Trigger = { Press r1 ROTATEY_TRIGGER_TIME }
        xbox_trigger = { Press r1 ROTATEY_TRIGGER_TIME }
    }
]

script AntiCasperSpin_Setup 
    ManualLink name = 'Anti Casper Spin' Score = 100 RotateY BalanceAnim = AntiCasper_Range OutAnim = AntiCasper_Out ExtraTricks = FlatlandBranches ExtraTricks2 = AntiCasperBranches parent = 'Anti Casper' trickslack = 0 boardrotate = 1 IsExtra spin_with_L2 = <spin_with_L2> Nollie
endscript
TruckstandBranches = [
    {
        trigger = TRIGGER_MANUAL_BRANCHFLIP
        scr = ManualLink
        params = {
            name = "Truckstand Flip"
            Score = 500
            anim = Truckstand_Flip
            BalanceAnim = Truckstand_Range
            OutAnim = Truckstand_Out
            ExtraTricks = FlatlandBranches
            ExtraTricks2 = TruckstandBranches
            parent = "TruckStand"
            extrapercent = 100
            trickslack = 0
            IsExtra
        }
    }
    {
        trigger = { InOrder a = Circle b = Circle 400 }
        scr = ManualLink
        params = {
            name = "Pogo to Hair Flip"
            Score = 1500
            anim = Sweet
            BalanceAnim = Truckstand_Range
            OutAnim = Truckstand_Out
            ExtraTricks2 = FlatlandBranches
            ExtraTricks = TruckstandBranches
            parent = "TruckStand"
            trickslack = 0
            IsExtra
        }
    }
    {
        trigger = { Press l2 ROTATEY_TRIGGER_TIME }
        scr = TruckSpin_Setup
        params = { spin_with_L2 = 1 name = "TruckSpin" }
        NGC_Trigger = { InOrder left r1 ROTATEY_TRIGGER_TIME }
        xbox_trigger = { InOrder left r1 ROTATEY_TRIGGER_TIME }
    }
    {
        trigger = { Press r2 ROTATEY_TRIGGER_TIME }
        scr = TruckSpin_Setup
        params = { name = "TruckSpin" }
        NGC_Trigger = { Press r1 ROTATEY_TRIGGER_TIME }
        xbox_trigger = { Press r1 ROTATEY_TRIGGER_TIME }
    }
]

script TruckSpin_Setup 
    ManualLink name = 'TruckSpin' Score = 100 RotateY BalanceAnim = Truckstand_Range OutAnim = Truckstand_Out ExtraTricks = FlatlandBranches ExtraTricks2 = TruckstandBranches parent = 'TruckStand' trickslack = 0 IsExtra spin_with_L2 = <spin_with_L2>
endscript
HandstandBranches = [
    {
        trigger = TRIGGER_MANUAL_BRANCHFLIP
        scr = ManualLink
        params = {
            name = "Handflip"
            Score = 500
            anim = HStandFliptoHstand
            BalanceAnim = HandstandHandFlip_Range
            OutAnim = HandstandHandFlip_Out
            ExtraTricks = FlatlandBranches
            ExtraTricks2 = HandstandBranches
            parent = "HandStand"
            extrapercent = 100
            trickslack = 0
            IsExtra
        }
    }
    {
        trigger = { Press l2 ROTATEY_TRIGGER_TIME }
        scr = #"0x610c1e95"
        params = { spin_with_L2 = 1 name = "HandStand Spin" }
        NGC_Trigger = { InOrder left r1 ROTATEY_TRIGGER_TIME }
        xbox_trigger = { InOrder left r1 ROTATEY_TRIGGER_TIME }
    }
    {
        trigger = { Press r2 ROTATEY_TRIGGER_TIME }
        scr = #"0x610c1e95"
        params = { name = "HandStand Spin" }
        NGC_Trigger = { Press r1 ROTATEY_TRIGGER_TIME }
        xbox_trigger = { Press r1 ROTATEY_TRIGGER_TIME }
    }
]
FlatlandBranches = [
    {
        trigger = { InOrder square Circle 300 }
        Trick_AntiCasper
    }
    {
        trigger = { InOrder square Circle 300 }
        Trick_NoseManual
    }
    {
        trigger = { InOrder square triangle 300 }
        Trick_Casper
    }
    {
        trigger = { InOrder square triangle 300 }
        Trick_Manual
    }
    {
        trigger = { InOrder Circle square 300 }
        Trick_ToRail
    }
    {
        trigger = { InOrder Circle square 300 }
        Trick_Manual
    }
    {
        trigger = { InOrder Circle triangle 300 }
        Trick_OneFootManual
    }
    {
        trigger = { InOrder Circle triangle 300 }
        Trick_OneFootNosemanual
    }
    {
        trigger = {
            TripleInOrder
            left
            RIGHT
            triangle
            500
        }
        #"0x1bff4f47"
    }
    {
        trigger = { InOrder a = Circle b = Circle 300 }
        Trick_Handstand
    }
    {
        trigger = { InOrder a = triangle b = triangle 300 }
        Trick_Pogo
    }
    {
        trigger = { InOrder a = triangle b = triangle 300 }
        Trick_Manual
    }
    {
        trigger = { InOrder triangle square 300 }
        Trick_Truckstand
    }
    {
        trigger = { InOrder triangle square 300 }
        Trick_Manual
    }
    {
        trigger = { InOrder triangle Circle 300 }
        Trick_SwitchFootPogo
    }
    {
        trigger = { InOrder triangle Circle 300 }
        Trick_Manual
    }
    {
        trigger = { InOrder a = Circle b = Circle 300 }
        Trick_Manual
    }
]

script PogoSpin_Setup 
    ManualLink name = 'Pogo Spin' Score = 100 RotateY BalanceIdle = Pogo_Bounce boardrotate = 1 OutAnim = Pogo_Out ExtraTricks = FlatlandBranches ExtraTricks2 = PogoBranches parent = 'Pogo' trickslack = 0 IsExtra spin_with_L2 = <spin_with_L2>
endscript
PogoBranches = [
    { trigger = TRIGGER_MANUAL_BRANCHFLIP Trick_PogoFlip }
    {
        trigger = { Press l2 ROTATEY_TRIGGER_TIME }
        scr = PogoSpin_Setup
        params = { spin_with_L2 = 1 name = "Pogo Spin" }
        NGC_Trigger = { InOrder left r1 ROTATEY_TRIGGER_TIME }
        xbox_trigger = { InOrder left r1 ROTATEY_TRIGGER_TIME }
    }
    {
        trigger = { Press r2 ROTATEY_TRIGGER_TIME }
        scr = PogoSpin_Setup
        params = { name = "Pogo Spin" }
        NGC_Trigger = { Press r1 ROTATEY_TRIGGER_TIME }
        xbox_trigger = { Press r1 ROTATEY_TRIGGER_TIME }
    }
]
NoseManualBranches = [
    {
        trigger = { PressTwoAnyOrder left r1 500 }
        scr = EnterBertStance
        xbox_trigger = { PressTwoAnyOrder left l1 500 }
        NGC_Trigger = { PressTwoAnyOrder left l1 500 }
    }
    {
        trigger = { PressTwoAnyOrder RIGHT r1 500 }
        scr = EnterBertStance
        xbox_trigger = { PressTwoAnyOrder RIGHT l1 500 }
        NGC_Trigger = { PressTwoAnyOrder RIGHT l1 500 }
    }
    {
        trigger = { Press r2 200 }
        Trick_Gturn
        xbox_trigger = { Press r1 200 }
        NGC_Trigger = { Press r1 200 }
    }
    { trigger = TRIGGER_MANUAL_BRANCHFLIP Trick_HalfCabImpossible }
    {
        trigger = { InOrder Circle triangle 300 }
        Trick_OneFootNosemanual
    }
]
ManualBranches = [
    {
        trigger = { PressTwoAnyOrder left r1 500 }
        scr = EnterBertStance
        xbox_trigger = { PressTwoAnyOrder left l1 500 }
        NGC_Trigger = { PressTwoAnyOrder left l1 500 }
    }
    {
        trigger = { PressTwoAnyOrder RIGHT r1 500 }
        scr = EnterBertStance
        xbox_trigger = { PressTwoAnyOrder RIGHT l1 500 }
        NGC_Trigger = { PressTwoAnyOrder RIGHT l1 500 }
    }
    {
        trigger = { Press r2 200 }
        Trick_Gturn2
        xbox_trigger = { Press r1 200 }
        NGC_Trigger = { Press r1 200 }
    }
    { trigger = TRIGGER_MANUAL_BRANCHFLIP Trick_360FlipNoseManual }
    {
        trigger = { InOrder Circle triangle 300 }
        Trick_OneFootManual
    }
]

script WalkAir_Manual 
    InAirExceptions
    RemoveParameter \{ FromWalk }
    SetException Ex = Landed scr = Manual params = { SkipInitAnim <...>  }
    KillExtraTricks
    ClearTrickQueue
    SetQueueTricks \{ NoTricks }
    if GotParam \{ FromWalkAnim }
        Skater_Playanim anim = <FromWalkAnim>
    else
        if GotParam \{ Nollie }
            Skater_Playanim \{ anim = JumpAirToNoseManual }
        else
            Skater_Playanim \{ anim = JumpAirToManual }
        endif
    endif
    Block
endscript
ManualExceptionTable = [
    {
        exception
        Ex = GroundGone
        scr = GroundGone
        params = { NoBoneless }
    }
    { event Ex = MadeOtherSkaterBail scr = MadeOtherSkaterBail_Called }
    { exception Ex = FlailHitWall scr = FlailHitWall }
    { exception Ex = FlailLeft scr = FlailLeft }
    { exception Ex = FlailRight scr = FlailRight }
    { exception Ex = Carplant scr = Carplant }
    { exception Ex = CarBail scr = CarBail }
    { exception Ex = SkaterCollideBail scr = SkaterCollideBail }
    { exception Ex = Skitched scr = skitch }
]

script Manual BlendPeriod = 0.3000 Speed = 1.0
    if GotParam FromWalk
        goto WalkAir_Manual params = { <...>  }
    endif
    KillExtraTricks
    SetTrickName ''
    SetTrickScore 0
    display Blockspin
    NatasResetRotation
    if landedfromvert
        if NOT LandedOnBank
            goto land
        endif
    endif
    ClearLipCombos
    resetlandedfromvert
    BertSlideOff
    ResetEventHandlersFromTable ManualExceptionTable
    if DoingBalanceTrick
        if GotParam Nollie
            SetBalanceTrickType NoseManual
        else
            SetBalanceTrickType Manual
        endif
    endif
    if GotParam Nollie
        SetException Ex = Ollied scr = NollieNoDisplay params = { <...>  }
        nollieon
    else
        nollieoff
        SetException Ex = Ollied scr = ollie params = { <...>  }
    endif
    SetException Ex = OffMeterTop scr = <OffMeterBottom> params = { <...>  }
    SetException Ex = OffMeterBottom scr = <OffMeterTop> params = { <...>  }
    OnExceptionRun CheckForNewTrick_ManualOut
    LaunchStateChangeEvent state = Skater_InManual
    ClearTrickQueue
    if NOT GetGlobalFlag flag = FLAG_EXPERT_MODE_NO_WALKING
        if NOT ((InNetGame)& (GetGlobalFlag flag = flag_g_expert_mode_no_walking))
            SetQueueTricks SkateToWalkTricks
        else
            SetQueueTricks NoTricks
        endif
    else
        SetQueueTricks NoTricks
    endif
    if GotParam AllowWallpush
        if GotParam Nollie
            SetException Ex = WallPush scr = Manual_Wallpush
        else
            SetException Ex = WallPush scr = Manual_Wallpush params = { ToNoseManual }
        endif
    else
        seteventhandler Ex = WallPush scr = Manual_CancelWallpushEvent
    endif
    if GotParam IsSpecial
        broadcastevent type = SkaterEnterSpecialTrick
        SetManualTricks NoTricks
    else
        if GotParam IsExtra
            SetManualTricks NoTricks
        else
            if (EXPERT_MODE_NO_MANUALS = 0)
                if IsOnMotoSkateboard
                    SetManualTricks NoTricks
                else
                    SetManualTricks NoTricks special = SpecialManualTricks
                endif
            else
                SetManualTricks NoTricks
            endif
        endif
    endif
    if GotParam specialitem_details
        TurnOnSpecialItem specialitem_details = <specialitem_details>
    endif
    startbalancetrick
    if NOT IsNGC
        vibrate actuator = 1 percent = 25
        OnExitRun KillManualVibration
    endif
    if GotParam FullScreenEffect
        <FullScreenEffect>
        if GotParam IsSpecial
            OnExitRun Exit_FullScreenEffect_and_Special
        else
            OnExitRun Exit_FullscreenEffect
        endif
    else
        if GotParam IsSpecial
            OnExitRun Exit_Special_Manual
        endif
    endif
    if GotParam stream
        if NOT IsStreamPlaying SFXSpecialStream
            PlayStream <stream> vol = 200 priority = StreamPriorityHigh id = SFXSpecialStream
        endif
    endif
    if GotParam friction
        setrollingfriction <friction>
    else
        setrollingfriction default
    endif
    if GotParam IsSpecial
        if GotParam Nollie
            dobalancetrick ButtonA = up ButtonB = down type = NoseManual Tweak = 5
        else
            dobalancetrick ButtonA = up ButtonB = down type = Manual Tweak = 5
        endif
    else
        if GotParam Nollie
            dobalancetrick ButtonA = up ButtonB = down type = NoseManual Tweak = 1
        else
            dobalancetrick ButtonA = up ButtonB = down type = Manual Tweak = 1
        endif
    endif
    if GotParam FromAir
        BlendPeriod = 0.0
        if GotParam FromRevert
            BlendPeriod = 0.3000
        endif
        if backwards
            FlipAndRotate
            printf 'PLAYING FLIPPED FROM MANUAL SCRIPT ======================================='
            Skater_Playanim anim = <FromAirAnim> BlendPeriod = <BlendPeriod> Speed = <Speed>
        else
            Skater_Playanim anim = <FromAirAnim> BlendPeriod = <BlendPeriod> Speed = <Speed>
        endif
    else
        printf ' PLAYING INIT ANIM >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
        if Skater_AnimEquals HandstandHandFlip_Range
            Skater_Playanim anim = HandstandHandFlip_Out
            Skater_WaitAnimFinished
        endif
        Skater_Playanim anim = <InitAnim> BlendPeriod = 0.3000 Speed = <Speed>
    endif
    if obj_flagset FLAG_SKATER_MANUALCHEESE
        if NOT GotParam IsExtra
            GetManualCheese
            ManualCheese = (<ManualCheese> + 1)
            settags ManualCheese = <ManualCheese>
            printf '::::::::::::::::::::Cheese= %c' c = <ManualCheese>
            if (<ManualCheese> > 1)
                adjustbalance TimeAdd = 2 SpeedMult = 2 LeanMult = 1.200
            endif
        endif
    else
        obj_setflag FLAG_SKATER_MANUALCHEESE
        settags ManualCheese = 0
    endif
    if AbilityEnabled freestyle
        if GotParam ExtraTricks2
            SetExtraTricks <ExtraTricks2> <ExtraTricks> ignore = <name>
        else
            if GotParam ExtraTricks
                SetExtraTricks <ExtraTricks> ignore = <name>
            endif
        endif
    endif
    if GotParam CheckCheese
        if GotParam IsExtra
            wait MANUAL_DISPLAY_WAIT frames
        else
            wait 13 frames
        endif
    else
        wait MANUAL_DISPLAY_WAIT frames
    endif
    if GotParam ExtraWaitPercent
        Skater_WaitAnim percent = <ExtraWaitPercent>
    endif
    if GotParam IsSpecial
    else
        if GotParam IsExtra
        else
            DoNextManualTrick
        endif
    endif
    SetTrickName <name>
    SetTrickScore <Score>
    display Blockspin
    if GotParam IsSpecial
        LaunchSpecialMessage
    endif
    if GotParam IsExtra
        LaunchExtraMessage
    endif
    Skater_WaitAnimFinished
    if GotParam ExtraSpeedBoost
        SpacewalkBoost ExtraSpeedBoost = <ExtraSpeedBoost>
    endif
    if GotParam FlipGraphic
        boardrotate
    endif
    if GotParam SproingFlip
        BlendperiodOut 0
        FlipAfter
    endif
    if GotParam NoBlend
        BlendperiodOut 0
    endif
    if GotParam BalanceIdle
        Skater_Playanim anim = <BalanceIdle> Cycle BlendPeriod = <BlendPeriod> Speed = <Speed>
    else
        if GotParam BalanceAnim3
            Skater_Playanim Random (@ anim = <BalanceAnim> @ anim = <BalanceAnim2> @ anim = <BalanceAnim3>) Wobble wobbleparams = Manual_wobble_params Speed = <Speed>
        else
            if GotParam BalanceAnim2
                Skater_Playanim Random (@ anim = <BalanceAnim> @ anim = <BalanceAnim2>) Wobble wobbleparams = Manual_wobble_params Speed = <Speed>
            else
                Skater_Playanim anim = <BalanceAnim> Wobble wobbleparams = Manual_wobble_params Speed = <Speed>
            endif
        endif
    endif
    if GotParam SpawnScript
        obj_killspawnedscript name = <SpawnScript>
        obj_spawnscriptlater <SpawnScript>
    endif
    WaitWhilstChecking_ForPressure <...> 
endscript

script SpacewalkBoost \{ ExtraSpeedBoost = 200 }
    getspeed
    if (<Speed> < <ExtraSpeedBoost>)
        setspeed <ExtraSpeedBoost>
    endif
    printf 'Speed=%s' s = <Speed>
endscript

script WaitWhilstChecking_ForPressure 
    if NOT IsNGC
        button = l2
    else
        button = l1
    endif
    begin 
    if Held <button>
        if GotParam Nollie
            Toggle_Nollie_Pressure_States Nollie
        else
            Toggle_Nollie_Pressure_States
        endif
        begin 
        if Released <button>
            pressureoff
            if GotParam Nollie
                nollieon
            endif
            break 
        endif
        DoNextTrick
        wait 1 Game frame
        repeat 
    endif
    DoNextTrick
    wait 1 Game frame
    repeat 
endscript

script Toggle_Nollie_Pressure_States 
    if innollie
        nollieoff
        pressureon
        SetException Ex = Ollied scr = ollie params = { <...>  }
    else
        if inpressure
            if GotParam \{ Nollie }
                pressureoff
                nollieon
                SetException Ex = Ollied scr = NollieNoDisplay params = { <...>  }
            else
                nollieoff
            endif
        else
            pressureon
        endif
    endif
endscript

script CheckForNewTrick_ManualOut 
    printf \{ 'give the events back!!!!!!!' }
    RestoreEvents \{ usedby = extra duration = 100 }
    ManualOut
endscript

script Exit_Special_Manual 
    KillManualVibration
    Exit_Special
endscript

script KillManualVibration 
    vibrate \{ actuator = 1 percent = 0 }
endscript
Manual_wobble_params = {
    wobbleampa = { (0.05000000074505806, 0.05000000074505806) STATS_MANUAL }
    wobbleampb = { (0.03999999910593033, 0.03999999910593033) STATS_MANUAL }
    wobblek1 = { (0.002199999988079071, 0.002199999988079071) STATS_MANUAL }
    wobblek2 = { (0.0017000000225380063, 0.0017000000225380063) STATS_MANUAL }
    spazfactor = { (1.0, 1.0) STATS_MANUAL }
}

script ManualOut 
    if GotParam \{ MadeOtherSkaterBail }
    else
        KillExtraTricks
    endif
    TurnOffSpecialItem
    SetTrickName \{ "" }
    SetTrickScore \{ 0 }
    display \{ Blockspin }
endscript
in_manual_land = 0
flip_backwards_dont_blend = 0

script ManualLand_Cleanup 
    settags \{ in_manual_land = 0 }
endscript

script ManualLand 
    settags in_manual_land = 1
    change flip_backwards_dont_blend = 0
    OnExitRun ManualLand_Cleanup
    VibrateOff
    SetException Ex = RunHasEnded scr = EndOfRun
    SetException Ex = GoalHasEnded scr = Goal_EndOfRun
    if GoalManager_GoalShouldExpire
        ClearException Ollied
    endif
    LandSkaterTricks
    ClearEventBuffer
    ClearTrickQueue
    KillExtraTricks
    SetException Ex = WallPush scr = Ground_Wallpush
    stopbalancetrick
    if NOT GotParam NoOutAnimOnManualLand
        if GotParam OutAnim
            Skater_Playanim anim = <OutAnim> BlendPeriod = 0.2000
        else
            if GotParam Nollie
                Skater_Playanim anim = PutDownNoseManual BlendPeriod = 0.2000
            else
                Skater_Playanim anim = PutDownManual BlendPeriod = 0.2000
            endif
        endif
        if CancelRotateDisplayandUpdateMatrix
            change flip_backwards_dont_blend = 1
        endif
        WaitAnimWhilstChecking
    endif
    change flip_backwards_dont_blend = 0
    settags in_manual_land = 0
    goto ongroundai
endscript

script ManualLink grindslack = 25 trickslack = 10 displaypercent = 50 TimeAdd = 0 SpeedMult = 1 Speed = 1.0 Blend = 0.3000
    if NOT IsNGC
        vibrate actuator = 1 percent = 25
        OnExitRun KillManualVibration
    endif
    if GotParam RodneyOnly
        if ProfileEquals is_named = Mullen
        else
            goto ManualLink params = {name = 'Truck Spin' Score = 1000 anim = Truckstand_Init BalanceAnim = Truckstand_Range OutAnim = Truckstand_Out ExtraTricks = FlatlandBranches ExtraTricks2 = TruckstandBranches trickslack = 0 IsExtra}
        endif
    endif
    if GotParam Nollie
        nollieon
        SetException Ex = Ollied scr = NollieNoDisplay
        SetBalanceTrickType NoseManual
    else
        nollieoff
        SetException Ex = Ollied scr = ollie params = {anim = <anim> OutAnim = <OutAnim> boardrotate = <boardrotate> BoardFlipAfter = <BoardFlipAfter> FlipAfter = <FlipAfter> NoBlend = <NoBlend>}
        SetBalanceTrickType Manual
    endif
    if GotParam OffMeterTop
        SetException Ex = OffMeterTop scr = <OffMeterTop> params = { <...>  }
        SetException Ex = OffMeterBottom scr = <OffMeterBottom> params = { <...>  }
    endif
    if GotParam AllowWallpush
        if GotParam Nollie
            SetException Ex = WallPush scr = Manual_Wallpush
        else
            SetException Ex = WallPush scr = Manual_Wallpush params = { ToNoseManual }
        endif
    else
        seteventhandler Ex = WallPush scr = Manual_CancelWallpushEvent
    endif
    KillExtraTricks
    OnExceptionRun ManualOut
    bailon
    SetTrickName <name>
    SetTrickScore <Score>
    adjustbalance TimeAdd = <TimeAdd> SpeedMult = <SpeedMult>
    if GotParam anim
        Skater_Playanim anim = <anim> BlendPeriod = <Blend> Speed = <Speed>
    endif
    if GotParam RotateY
        if Flipped
            if GotParam spin_with_L2
                rotatedisplay y duration = 0.7500 seconds startangle = 0.0 endangle = 360.0 sinepower = 0 rotationoffset = (0.0, 30.0, 0.0)
            else
                rotatedisplay y duration = 0.7500 seconds startangle = 0.0 endangle = -360.0 sinepower = 0 rotationoffset = (0.0, 30.0, 0.0)
            endif
        else
            if GotParam spin_with_L2
                rotatedisplay y duration = 0.7500 seconds startangle = 0.0 endangle = 360.0 sinepower = 0 rotationoffset = (0.0, 30.0, 0.0)
            else
                rotatedisplay y duration = 0.7500 seconds startangle = 0.0 endangle = -360.0 sinepower = 0 rotationoffset = (0.0, 30.0, 0.0)
            endif
        endif
        wait 0.7000 seconds
        PlayManualBalanceAnim <...> 
    endif
    if GotParam anim
        wait 5 frames
    endif
    if GotParam playcesssound
        playsound foleymove01 pitch = 110 vol = 100
    endif
    if GotParam IsExtra
        if NOT GotParam RotateY
            if NOT GotParam playcesssound
                LaunchExtraMessage
            endif
        endif
    endif
    if GotParam IsSpecial
        LaunchSpecialMessage
    endif
    if GotParam anim
        if NOT GotParam RotateY
            wait MANUAL_DISPLAY_WAIT frames
        endif
    endif
    if GotParam NoDisplay
    else
        if GotParam RotateY
            display AddSpin = 360
        else
            display Blockspin
        endif
    endif
    if GotParam anim
        if GotParam extrapercent
            printf 'waiting an extrapercent'
            Skater_WaitAnim percent = <extrapercent>
        endif
    endif
    printf 'Setting extra tricks active'
    SetManualExtraTricks <...> 
    if GotParam FlipAfter
        FlipAfter
        BoardRotateAfter
    endif
    if GotParam BoardFlipAfter
        BlendperiodOut 0
        BoardRotateAfter
    endif
    if GotParam anim
        Skater_WaitAnim percent = <extrapercent>
    endif
    bailoff
    if GotParam anim
        Skater_WaitAnimFinished
    endif
    PlayManualBalanceAnim <...> 
    WaitWhilstChecking_ForPressure <...> 
endscript

script PlayManualBalanceAnim 
    if NOT GotParam \{ anim }
        BlendPeriod = 0.0
    endif
    if GotParam \{ BalanceIdle }
        Skater_Playanim anim = <BalanceIdle> Cycle BlendPeriod = <BlendPeriod>
    else
        Skater_Playanim anim = <BalanceAnim> Wobble BlendPeriod = <BlendPeriod>
        DoNextTrick
        wait \{ 1 gameframe }
        Skater_Playanim anim = <BalanceAnim> Wobble BlendPeriod = 0.3000
    endif
endscript

script SetManualExtraTricks \{ parent = "none" }
    if AbilityEnabled \{ freestyle }
        if GotParam \{ ExtraTricks2 }
            SetExtraTricks <ExtraTricks2> <ExtraTricks> ignore = <parent>
        else
            if GotParam \{ ExtraTricks }
                if GotParam \{ NoDisplay }
                    SetExtraTricks tricks = <ExtraTricks>
                else
                    SetExtraTricks tricks = <ExtraTricks>
                endif
            endif
        endif
    endif
endscript

script GetManualCheese 
    gettags
    return ManualCheese = <ManualCheese>
endscript

script manual_turnaround 
    gettags
    obj_spawnscriptlater manual_turnaround2 params = { <...>  }
endscript

script manual_turnaround2 \{ time = 0.4000 }
    turntofacevelocity
    if YawingRight
        Angle = 180
    else
        if YawingLeft
            Angle = -180
        else
            Angle = Random (@ 180 @ -180)
        endif
    endif
    rotatedisplay y duration = <time> seconds startangle = <Angle> endangle = 0
    wait (<time> + 0.5000)seconds
    EndManualTurnaround
endscript

script #"0x610c1e95" 
    ManualLink name = 'HandStand Spin' Score = 100 RotateY BalanceAnim = HandstandHandFlip_Range boardrotate = 1 OutAnim = HandstandHandFlip_Out ExtraTricks = FlatlandBranches ExtraTricks2 = HandstandBranches parent = 'HandStand' trickslack = 0 IsExtra spin_with_L2 = <spin_with_L2>
endscript

script #"0xdee38176" 
    ManualLink name = 'ToRail Spin' Score = 100 RotateY BalanceAnim = Primo_Range boardrotate = 1 OutAnim = Primo_Out ExtraTricks = FlatlandBranches ExtraTricks2 = ToRail_Branches parent = 'ToRail' trickslack = 0 IsExtra spin_with_L2 = <spin_with_L2>
endscript
