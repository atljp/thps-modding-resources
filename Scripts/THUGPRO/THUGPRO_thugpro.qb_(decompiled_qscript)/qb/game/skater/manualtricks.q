
MANUAL_DISPLAY_WAIT = 25 
ROTATEY_TRIGGER_TIME = 300 
TRIGGER_MANUAL_BRANCHFLIP = { InOrder , a = Square , b = Square , 200 } 
ALT_TRIGGER_MANUAL_BRANCHFLIP = { InOrder , a = Circle , b = Circle , 200 } 
ENABLE_MANUAL_BOOSTPLANT = 1 
SpMan_TriggerType = TripleInOrderSloppy 
SpecialManualTricks = [ 
	{ Trigger = { ( SpMan_TriggerType ) , Up , Right , Triangle , 400 } Duration = 700 TrickSlot = SpMan_U_R_Triangle } 
	{ Trigger = { ( SpMan_TriggerType ) , Up , Down , Triangle , 400 } Duration = 700 TrickSlot = SpMan_U_D_Triangle } 
	{ Trigger = { ( SpMan_TriggerType ) , Up , Left , Triangle , 400 } Duration = 700 TrickSlot = SpMan_U_L_Triangle } 
	{ Trigger = { ( SpMan_TriggerType ) , Right , Up , Triangle , 400 } Duration = 700 TrickSlot = SpMan_R_U_Triangle } 
	{ Trigger = { ( SpMan_TriggerType ) , Right , Down , Triangle , 400 } Duration = 700 TrickSlot = SpMan_R_D_Triangle } 
	{ Trigger = { ( SpMan_TriggerType ) , Right , Left , Triangle , 400 } Duration = 700 TrickSlot = SpMan_R_L_Triangle } 
	{ Trigger = { ( SpMan_TriggerType ) , Down , Up , Triangle , 400 } Duration = 700 TrickSlot = SpMan_D_U_Triangle } 
	{ Trigger = { ( SpMan_TriggerType ) , Down , Right , Triangle , 400 } Duration = 700 TrickSlot = SpMan_D_R_Triangle } 
	{ Trigger = { ( SpMan_TriggerType ) , Down , Left , Triangle , 400 } Duration = 700 TrickSlot = SpMan_D_L_Triangle } 
	{ Trigger = { ( SpMan_TriggerType ) , Left , Up , Triangle , 400 } Duration = 700 TrickSlot = SpMan_L_U_Triangle } 
	{ Trigger = { ( SpMan_TriggerType ) , Left , Right , Triangle , 400 } Duration = 700 TrickSlot = SpMan_L_R_Triangle } 
	{ Trigger = { ( SpMan_TriggerType ) , Left , Down , Triangle , 400 } Duration = 700 TrickSlot = SpMan_L_D_Triangle } 
] 
Trick_SlamSpinner = { 
	Scr = Manual 
	Params = { 
		Name = #"Slam Spinner" 
		Score = 3500 
		InitAnim = SlamSpinner 
		FromWalkAnim = SlamSpinner 
		FromAirAnim = SlamSpinner 
		BalanceAnim = Manual_Range 
		OffMeterTop = ManualLand 
		OffMeterBottom = ManualBail 
		ExtraTricks2 = ManualBranches 
		ExtraTricks = FlatLandBranches 
		IsSpecial 
		ExtraWaitPercent = 40 
	} 
} 
Trick_YeahRight = { 
	Scr = Manual 
	Params = { 
		Name = #"Yeah Right" 
		Score = 3100 
		InitAnim = YeahRight_Init 
		FromWalkAnim = YeahRight_Init 
		FromAirAnim = YeahRight_Init 
		BalanceIdle = yeahright_idle 
		OffMeterBail 
		OffMeterTop = ManualBail 
		OffMeterBottom = ManualBail 
		ExtraTricks2 = ManualBranches 
		ExtraTricks = FlatLandBranches 
		OutAnim = YeahRight_Out 
		IsSpecial 
		ExtraWaitPercent = 40 
		OutAnimOnOllie 
		SpecialItem_Details = extraboard_details 
	} 
} 
Trick_MixItUp = { 
	Scr = Manual 
	Params = { 
		Name = #"Mix It Up" 
		Score = 4500 
		InitAnim = MixItUp_Init 
		FromAirAnim = MixItUp_Init 
		BalanceIdle = MixItUp_Idle 
		Speed = 1.20000004768 
		OffMeterBail 
		OffMeterTop = ManualBail 
		OffMeterBottom = ManualBail 
		ExtraTricks2 = ManualBranches 
		ExtraTricks = FlatLandBranches 
		OutAnim = MixItUp_Out 
		OutAnimOnOllie 
		IsSpecial 
		ExtraWaitPercent = 40 
	} 
} 
Trick_KickflipSwitch = { 
	Scr = Manual 
	Params = { 
		Name = #"Flip 2 Switch" 
		Score = 4500 
		InitAnim = KickflipSwitchOnefootManual_Init 
		FromAirAnim = KickflipSwitchOnefootManual_Init 
		BalanceAnim = KickflipSwitchOnefootManual_range 
		OffMeterBail 
		OffMeterTop = ManualBail 
		OffMeterBottom = ManualBail 
		ExtraTricks2 = ManualBranches 
		ExtraTricks = FlatLandBranches 
		OutAnim = KickflipSwitchOnefootManual_Out 
		OutAnimOnOllie 
		IsSpecial 
		FlipAfter 
		ExtraWaitPercent = 30 
	} 
} 
Trick_HandStandCasper = { 
	Scr = Manual 
	Params = { 
		Name = #"Casper Handstand" 
		Score = 4500 
		InitAnim = HandstandCasper_Init 
		FromAirAnim = HandstandCasper_Init 
		BalanceAnim = HandstandCasper_range 
		OffMeterBail 
		OffMeterTop = ManualBail 
		OffMeterBottom = ManualBail 
		ExtraTricks = HandstandBranches 
		OutAnim = HandstandCasper_Out 
		OutAnimOnOllie 
		IsSpecial 
		ExtraWaitPercent = 40 
	} 
} 
Trick_HoHoStreetPlant = { 
	Scr = Manual 
	Params = { 
		Name = #"Ho Ho Street Plant" 
		Score = 4500 
		InitAnim = HoHoStreetPlant_init 
		FromAirAnim = HoHoStreetPlant_init 
		BalanceIdle = HoHoStreetPlant_idle 
		OutAnim = HoHoStreetPlant_out 
		OutAnimOnOllie 
		OffMeterTop = NoseManualBail 
		OffMeterBottom = NoseManualBail 
		ExtraTricks = FlatLandBranches 
		IsSpecial 
		FlipAfter 
		NoBlend 
	} 
} 
Trick_NoComplyLate360 = { 
	Scr = Manual 
	Params = { 
		Name = #"No Comply 360 Shove-It" 
		Score = 4500 
		InitAnim = NoComplyLate360 
		FromAirAnim = NoComplyLate360 
		BalanceAnim = Manual_Range 
		OffMeterTop = ManualBail 
		OffMeterBottom = ManualLand 
		ExtraTricks = ManualBranches 
		IsSpecial 
		NoBlend 
		ExtraTricks = FlatLandBranches 
		ExtraWaitPercent = 40 
	} 
} 
Trick_RustySlide = { 
	Scr = Manual 
	Params = { 
		Name = #"Rusty Slide Manual" 
		Score = 4500 
		InitAnim = RustySlide_Init 
		FromAirAnim = RustySlide_Init 
		BalanceAnim = Primo_Range 
		OutAnim = RustySlide_out 
		OffMeterBail 
		OffMeterTop = NoseManualBail 
		OffMeterBottom = ManualBail 
		Friction = 0.50000000000 
		IsSpecial BoardRotate 
		ExtraTricks = FlatLandBranches 
		ExtraTricks2 = ToRail_Branches 
		FlipGraphic 
		NoBlend 
	} 
} 
Trick_Sproing = { 
	Scr = Manual 
	Params = { 
		Name = #"Sproing" 
		Score = 4500 
		InitAnim = Sproing 
		FromAirAnim = Sproing 
		BalanceAnim = Manual_Range 
		OffMeterTop = ManualBail 
		OffMeterBottom = ManualLand 
		ExtraTricks2 = ManualBranches 
		ExtraTricks = FlatLandBranches 
		IsSpecial SproingFlip 
		ExtraWaitPercent = 40 
	} 
} 
Trick_PrimoSlide = { 
	Scr = Manual 
	Params = { 
		Name = #"Primo" 
		Score = 4000 
		InitAnim = Primo_Init 
		FromAirAnim = Primo_Init 
		BalanceAnim = Primo_Range 
		OutAnim = Primo_out 
		OffMeterBail 
		OffMeterTop = NoseManualBail 
		OffMeterBottom = ManualBail 
		Friction = 0.34999999404 
		IsSpecial 
		ExtraTricks = FlatLandBranches 
		ExtraTricks2 = ToRail_Branches 
	} 
} 
Trick_OneFootOneWheel = { 
	Scr = Manual 
	Params = { 
		Name = #"One Wheel Nosemanual" 
		Score = 4100 
		InitAnim = OneFootOneWheel_Init 
		FromAirAnim = OneFootOneWheel_Init 
		BalanceAnim = OneFootOneWheel_Range 
		OutAnim = PutDownOneWheel 
		OffMeterTop = NoseManualBail 
		OffMeterBottom = ManualLand 
		Friction = 0.34999999404 
		IsSpecial Nollie 
		ExtraTricks2 = NoseManualBranches 
		ExtraTricks = FlatLandBranches 
		PutDownAnim = PutDownOneWheel 
	} 
} 
Trick_DanceParty = { 
	Scr = Manual 
	Params = { 
		Name = #"Ahhh yeahhh!" 
		Score = 4000 
		InitAnim = DanceParty_Init 
		FromAirAnim = DanceParty_Init 
		BalanceIdle = DanceParty_Idle 
		OffMeterBail 
		OffMeterTop = ManualBail 
		OffMeterBottom = NoseManualBail 
		Friction = 20 
		IsSpecial 
		ExtraTricks = FlatLandBranches 
	} 
} 
Trick_PrimoSpin = { 
	Scr = Manual 
	Params = { 
		Name = #"Primo Spin" 
		Score = 4500 
		InitAnim = Special_Rodney_PrimoSpin_Init 
		FromAirAnim = Special_Rodney_PrimoSpin_Init 
		BalanceIdle = Special_Rodney_PrimoSpin_Idle 
		OffMeterBail 
		OffMeterTop = ManualBail 
		OffMeterBottom = NoseManualBail 
		OutAnim = Special_Rodney_PrimoSpin_Out 
		Friction = 0.50000000000 
		IsSpecial 
		ExtraTricks = FlatLandBranches 
		Stream = Spec_Mullen02 
	} 
} 
Trick_Butt_Manual = { 
	Scr = Manual 
	Params = { 
		Name = #"Paulie Butt Manual" 
		Score = 4000 
		InitAnim = Special_Paulie_ButtMan_Init 
		FromAirAnim = Special_Paulie_ButtMan_Init 
		BalanceIdle = Special_Paulie_ButtMan_Range 
		OffMeterBail 
		OffMeterTop = ManualBail 
		OffMeterBottom = NoseManualBail 
		OutAnim = Special_Paulie_ButtMan_Out 
		Friction = -5 
		IsSpecial 
		ExtraTricks = FlatLandBranches 
		Stream = Spec_Paulie01 
	} 
} 
Trick_JesterJuggle = { 
	Scr = Manual 
	Params = { 
		Name = #"Manual Entertainer" 
		Score = 4500 
		InitAnim = Special_Jester_Juggle_Init 
		FromAirAnim = Special_Jester_Juggle_Init 
		BalanceIdle = Special_Jester_Juggle_idle 
		OffMeterBail 
		OffMeterTop = ManualBail 
		OffMeterBottom = NoseManualBail 
		OutAnim = Special_Jester_Juggle_Out 
		Friction = 0.34999999404 
		IsSpecial 
		ExtraTricks = FlatLandBranches 
		SpecialItem_Details = JugglingBalls_details 
		Stream = Spec_Jester01 
	} 
} 
Trick_WormManual = { 
	Scr = Manual 
	Params = { 
		Name = #"The Worm" 
		Score = 4500 
		InitAnim = Special_Muska_Worm_init 
		FromAirAnim = Special_Muska_Worm_init 
		BalanceIdle = Special_Muska_Worm_idle 
		Speed = 1.20000004768 
		OffMeterBail 
		OffMeterTop = ManualBail 
		OffMeterBottom = ManualBail 
		ExtraTricks2 = ManualBranches 
		ExtraTricks = FlatLandBranches 
		OutAnim = Special_Muska_Worm_out 
		OutAnimOnOllie 
		IsSpecial 
		ExtraWaitPercent = 40 
		Stream = Spec_Muska02 
	} 
} 
Trick_HotRod = { 
	Scr = Manual 
	Params = { 
		Name = #"Hot Rod" 
		Score = 4250 
		InitAnim = Special_Jesse_HotRod_Init 
		FromAirAnim = Special_Jesse_HotRod_Init 
		BalanceAnim = Special_Jesse_HotRod_Range 
		OffMeterTop = ManualLand 
		OffMeterBottom = NoseManualBail 
		OutAnim = Special_Jesse_HotRod_Out 
		Friction = -5 
		IsSpecial 
		ExtraTricks = FlatLandBranches 
		SpecialItem_Details = DragTires_details 
		Stream = Spec_JesseJ01 
	} 
} 
Trick_TonySurfer = { 
	Scr = Manual 
	Params = { 
		Name = #"Surfer" 
		Score = 4500 
		InitAnim = Special_Tony_Surfer_Init 
		FromAirAnim = Special_Tony_Surfer_Init 
		BalanceIdle = Special_Tony_Surfer_Idle 
		OffMeterBail 
		OffMeterTop = ManualBail 
		OffMeterBottom = NoseManualBail 
		OutAnim = Special_Tony_Surfer_Out 
		Friction = 0.34999999404 
		IsSpecial 
		ExtraTricks = FlatLandBranches 
		Stream = Spec_Hawk02 
	} 
} 
Trick_RunningMan = { 
	Scr = Manual 
	Params = { 
		Name = #"Running Manual" 
		Score = 4500 
		InitAnim = Special_Eric_RnngMan_Init 
		FromAirAnim = Special_Eric_RnngMan_Init 
		BalanceIdle = Special_Eric_RnngMan_Idle 
		OffMeterBail 
		OffMeterTop = ManualBail 
		OffMeterBottom = NoseManualBail 
		Friction = 0.34999999404 
		IsSpecial 
		ExtraTricks = FlatLandBranches 
		Stream = Spec_Sparrow01 
	} 
} 
Trick_Boomerang = { 
	Scr = Manual 
	Params = { 
		Name = #"Boomerang" 
		Score = 4500 
		InitAnim = Special_MikeV_Boomerang 
		FromAirAnim = Special_MikeV_Boomerang 
		BalanceAnim = NoseManual_Range 
		BalanceAnim2 = NoseManual_Range2 Nollie 
		OffMeterTop = NoseManualBail 
		OffMeterBottom = ManualLand 
		ExtraTricks2 = NoseManualBranches 
		IsSpecial 
		ExtraTricks = FlatLandBranches 
		Stream = Spec_Vallely02 
	} 
} 
AIR_MANUAL_DURATION = 1000 
AIR_MANUAL_TIMING = 400 
ManualTricks = [ 
	{ Trigger = { InOrder , Up , Down , 400 } Duration = 700 Trick_Manual } 
	{ Trigger = { InOrder , Down , Up , 400 } Duration = 700 Trick_NoseManual } 
] 
LandPivotManualTricks = [ 
	{ Trigger = { InOrder , Up , Down , 220 } Trick_Manual } 
	{ Trigger = { InOrder , Down , Up , 220 } Trick_Manual } 
] 
GroundManualTricks = [ 
	{ Trigger = { InOrder , Up , Down , 220 } Trick_Manual } 
	{ Trigger = { InOrder , Down , Up , 220 } Trick_NoseManual } 
] 
VehicleManualTricks = [ 
	{ Trigger = { InOrder , Up , Down , 220 } Trick_Vehicle_Manual } 
	{ Trigger = { InOrder , Down , Up , 220 } Trick_Vehicle_Manual } 
] 
Trick_Manual = { 
	Scr = Manual 
	Params = { 
		Name = #"Manual" 
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
		ExtraTricks = FlatLandBranches 
		CheckCheese 
		AllowWallpush 
	} 
} 
Trick_NoseManual = { 
	Scr = Manual 
	Params = { 
		Name = #"Nose Manual" 
		Score = 100 
		InitAnim = Nosemanual 
		FromAirAnim = NoseManualFromAir 
		FromWalkAnim = JumpAirToNoseManual 
		BalanceAnim = NoseManual_Range 
		BalanceAnim2 = NoseManual_Range2 
		Nollie 
		OffMeterTop = NoseManualBail 
		OffMeterBottom = ManualLand 
		ExtraTricks2 = NoseManualBranches 
		ExtraTricks = FlatLandBranches 
		CheckCheese 
		AllowWallpush 
	} 
} 
Trick_Vehicle_Manual = { 
	Scr = Manual 
	Params = { 
		Name = #"Chainsaw Manual" 
		Score = 100 
		Friction = -50 
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
	Scr = Manual 
	Params = { 
		Name = #"One Foot Nose Manual" 
		Score = 1050 
		InitAnim = OneFootNosemanual_Init 
		FromAirAnim = OneFootNosemanual_Init 
		BalanceAnim = OneFootNoseManual_Range 
		Nollie 
		OffMeterTop = NoseManualBail 
		OffMeterBottom = ManualLand 
		IsExtra 
		ExtraTricks = NoseManualBranches 
		ExtraTricks2 = FlatLandBranches 
	} 
} 
Trick_OneFootManual = { 
	Scr = Manual 
	Params = { 
		Name = #"One Foot Manual" 
		Score = 1050 
		InitAnim = OneFootManual_init 
		FromAirAnim = OneFootManual_init 
		BalanceAnim = OneFootManual_Range 
		OffMeterTop = ManualLand 
		OffMeterBottom = ManualBail 
		ExtraTricks = ManualBranches 
		ExtraTricks2 = FlatLandBranches 
		IsExtra 
	} 
} 
Trick_Spacewalk = { 
	Scr = Manual 
	Params = { 
		Name = #"Spacewalk" 
		Score = 1200 
		InitAnim = Manual 
		FromAirAnim = ManualFromAir 
		FromWalkAnim = JumpAirToManual 
		BalanceIdle = Spacewalk 
		OffMeterTop = ManualLand 
		OffMeterBottom = ManualBail 
		ExtraTricks2 = ManualBranches 
		ExtraTricks = FlatLandBranches 
		AllowWallpush ExtraSpeedBoost = 250 
	} 
} 
Trick_Handstand = { 
	Scr = Manual 
	Params = { 
		Name = #"HandStand" 
		Score = 1100 
		InitAnim = HandstandHandFlip_Init 
		FromAirAnim = HandstandHandFlip_Init 
		BalanceAnim = HandstandHandFlip_Range 
		OutAnim = HandstandHandFlip_out 
		OffMeterTop = ManualLand 
		OffMeterBottom = ManualBail 
		Friction = 0.50000000000 
		WaitOnOlliePercent = 10 
		ExtraTricks = FlatLandBranches 
		ExtraTricks2 = HandstandBranches 
	} 
} 
Trick_Casper = { 
	Scr = Manual 
	Params = { 
		Name = #"Casper" 
		Score = 1100 
		InitAnim = Casper_Init 
		FromAirAnim = Casper_Init 
		BalanceAnim = Casper_Range 
		OutAnim = Casper_out 
		OffMeterTop = ManualLand 
		OffMeterBottom = NoseManualBail 
		Friction = 0.50000000000 
		BoardRotate 
		ExtraTricks = FlatLandBranches 
		ExtraTricks2 = CasperBranches 
	} 
} 
Trick_AntiCasper = { 
	Scr = Manual 
	Params = { 
		Name = #"Anti Casper" 
		Score = 1100 
		InitAnim = AntiCasper_Init 
		FromAirAnim = AntiCasper_Init 
		BalanceAnim = AntiCasper_Range 
		OutAnim = AntiCasper_out 
		OffMeterTop = NoseManualBail 
		OffMeterBottom = ManualLand 
		Friction = 0.50000000000 
		BoardRotate 
		Nollie 
		ExtraTricks = FlatLandBranches 
		ExtraTricks2 = AntiCasperBranches 
	} 
} 
Trick_Truckstand = { 
	Scr = Manual 
	Params = { 
		Name = #"Truckstand" 
		Score = 800 
		InitAnim = Truckstand_Init 
		FromAirAnim = Truckstand_Init 
		BalanceAnim = Truckstand_Range 
		OutAnim = Truckstand_Out 
		OffMeterTop = ManualLand 
		OffMeterBottom = ManualBail 
		Friction = 1.50000000000 
		ExtraTricks = FlatLandBranches 
		ExtraTricks2 = TruckstandBranches 
	} 
} 
Trick_SwitchFootPogo = { 
	Scr = Manual 
	Params = { 
		Name = #"Switch Foot Pogo" 
		Score = 800 
		InitAnim = Truckrun_Init 
		FromAirAnim = Truckrun_Init 
		BalanceIdle = TruckRun 
		OutAnim = Truckrun_Out 
		OffMeterTop = ManualLand 
		OffMeterBottom = ManualBail 
		Friction = 1 
		ExtraTricks = FlatLandBranches 
		ExtraTricks2 = SwitchFootPogo_Branches 
	} 
} 
Trick_Pogo = { 
	Scr = Manual 
	Params = { 
		Name = #"Pogo" 
		Score = 750 
		InitAnim = Pogo_Init 
		FromAirAnim = Pogo_Init 
		BalanceIdle = Pogo_Bounce 
		OutAnim = Pogo_Out 
		OutSpeed = 1.50000000000 
		OffMeterTop = ManualLand 
		OffMeterBottom = ManualBail 
		Friction = 1.50000000000 
		ExtraTricks = FlatLandBranches 
		BoardRotate 
		ExtraTricks2 = PogoBranches 
		BounceBoobs 
	} 
} 
Trick_ToRail = { 
	Scr = Manual 
	Params = { 
		Name = #"To Rail" 
		Score = 1050 
		InitAnim = Primo_Init 
		FromAirAnim = Primo_Init 
		BalanceAnim = Primo_Range 
		OutAnim = Primo_out 
		OffMeterBail 
		OffMeterTop = NoseManualBail 
		OffMeterBottom = ManualBail 
		Friction = 1.00000000000 
		ExtraTricks = FlatLandBranches 
		ExtraTricks2 = ToRail_Branches 
		IsExtra 
	} 
} 
Trick_Gturn = { 
	Scr = ManualLink 
	Params = { 
		Name = #"Nose Pivot" 
		Score = 250 
		Anim = GTurn 
		BalanceAnim = Manual 
		FlipAfter 
		BalanceAnim = Manual_Range 
		Trickslack = 0 
		PlayCessSound 
		ExtraPercent = 100 
		ExtraTricks = FlatLandBranches 
		ExtraTricks2 = ManualBranches 
		TimeAdd = 1 
		SpeedMult = 1.00000000000 
		OffMeterTop = ManualBail 
		OffMeterBottom = ManualLand 
		AllowWallpush 
	} 
} 
Trick_Gturn2 = { 
	Scr = ManualLink 
	Params = { 
		Name = #"Pivot" 
		Score = 250 
		Anim = GTurn2 
		BalanceAnim = Manual 
		FlipAfter 
		BalanceAnim = NoseManual_Range 
		Trickslack = 0 
		PlayCessSound 
		ExtraPercent = 100 
		ExtraTricks = FlatLandBranches 
		ExtraTricks2 = NoseManualBranches 
		Nollie 
		TimeAdd = 1 
		SpeedMult = 1.00000000000 
		OffMeterTop = ManualLand 
		OffMeterBottom = NoseManualBail 
		AllowWallpush 
	} 
} 
Trick_HalfCabImpossible = { 
	Scr = ManualLink 
	Params = { 
		Name = #"Half Cab Impossible" 
		Score = 750 
		Anim = HalfCabImpossible 
		BalanceAnim = Manual 
		FlipAfter 
		BoardFlipAfter 
		BalanceAnim = Manual_Range 
		Trickslack = 0 
		ExtraPercent = 100 
		ExtraTricks = FlatLandBranches 
		ExtraTricks2 = ManualBranches 
		TimeAdd = 0 
		SpeedMult = 1.00000000000 
		OffMeterTop = ManualBail 
		IsExtra 
		OffMeterBottom = ManualLand 
	} 
} 
Trick_360FlipNoseManual = { 
	Scr = ManualLink 
	Params = { 
		Name = #"360 Fingerflip" 
		Score = 750 
		Anim = _360FlipNosemanual 
		BalanceAnim = Nosemanual 
		BalanceAnim = NoseManual_Range 
		Trickslack = 0 
		ExtraPercent = 100 
		ExtraTricks = FlatLandBranches 
		ExtraTricks2 = NoseManualBranches 
		TimeAdd = 0 
		SpeedMult = 1.00000000000 
		OffMeterTop = ManualLand 
		OffMeterBottom = NoseManualBail 
		Nollie 
	} 
} 
Trick_PogoFlip = { 
	Scr = ManualLink 
	Params = { 
		Name = #"Wrap Around" 
		Score = 500 
		Anim = Pogo_Kickfoot 
		BalanceIdle = Pogo_Bounce 
		Speed = 1.50000000000 
		OutAnim = Pogo_Out 
		OutSpeed = 1.50000000000 
		ExtraTricks = FlatLandBranches 
		ExtraTricks2 = PogoBranches 
		Parent = #"Pogo" 
		ExtraPercent = 100 
		Trickslack = 0 
		IsExtra 
	} 
} 
SwitchFootPogo_Branches = [ 
	{ 
		Trigger = TRIGGER_MANUAL_BRANCHFLIP 
		Scr = ManualLink 
		Params = { 
			Name = #"Half Wrap Truck Transfer" 
			Score = 500 
			Anim = TruckRunFlip 
			BalanceIdle = TruckRun 
			ExtraTricks = FlatLandBranches 
			ExtraTricks2 = SwitchFootPogo_Branches 
			Parent = #"Switch Foot Pogo" 
			BoardFlipAfter 
			ExtraPercent = 100 
			Trickslack = 0 
			IsExtra 
		} 
	} 
	{ 
		Trigger = { Press , L2 , ROTATEY_TRIGGER_TIME } 
		Scr = SwitchFootPogo_Setup 
		Params = { 
			Name = #"Switch Foot Pogo Spin" 
			spin_with_L2 = 1 
		} 
	} 
	{ 
		Trigger = { Press , R2 , ROTATEY_TRIGGER_TIME } 
		Scr = SwitchFootPogo_Setup 
		Params = { 
			Name = #"Switch Foot Pogo Spin" 
		} 
	} 
] 
SCRIPT SwitchFootPogo_Setup 
	ManualLink { 
		Name = #"Switch Foot Pogo Spin" 
		Score = 100 
		RotateY 
		BalanceIdle = TruckRun 
		OutAnim = Truckrun_Out 
		ExtraTricks = FlatLandBranches 
		ExtraTricks2 = SwitchFootPogo_Branches 
		Parent = #"Switch Foot Pogo" 
		Trickslack = 0 
		IsExtra 
		spin_with_L2 = <spin_with_L2> 
	} 
ENDSCRIPT

ToRail_Branches = [ 
	{ 
		Trigger = TRIGGER_MANUAL_BRANCHFLIP 
		Scr = ManualLink 
		Params = { 
			Name = #"Rail Flip" 
			Score = 500 
			Anim = RailFlip 
			BalanceAnim = Primo_Range 
			ExtraTricks = FlatLandBranches 
			ExtraTricks2 = ToRail_Branches 
			Parent = #"To Rail" 
			Trickslack = 0 
			ExtraPercent = 100 
			IsExtra 
			OffMeterBail 
		} 
	} 
	{ 
		Trigger = ALT_TRIGGER_MANUAL_BRANCHFLIP 
		Scr = ManualLink 
		Params = { 
			Name = #"Primo Spin" 
			Score = 500 
			Anim = Special_Rodney_PrimoSpin_Idle 
			BalanceAnim = Primo_Range 
			ExtraTricks = FlatLandBranches 
			ExtraTricks2 = ToRail_Branches 
			Parent = #"To Rail" 
			Trickslack = 0 
			ExtraPercent = 100 
			IsExtra 
			OffMeterBail 
		} 
	} 
	{ 
		Trigger = { Press , R2 , ROTATEY_TRIGGER_TIME } 
		Scr = RailSpin_Setup 
		Params = { 
			Name = #"Rail Spin" 
		} 
	} 
] 
SCRIPT RailSpin_Setup 
	ManualLink { 
		Name = #"Reemo Spin" 
		Score = 100 
		Anim = Primo_Turn 
		Speed = 0.60000002384 
		BalanceAnim = Primo_Range 
		OutAnim = Primo_out 
		ReemoSpinFix 
		FlipAfter 
		OffMeterBail 
		ExtraTricks = FlatLandBranches 
		ExtraTricks2 = ToRail_Branches 
		Parent = #"ToRail" 
		Trickslack = 0 
		BoardRotate = 1 
		IsExtra 
		spin_with_L2 = <spin_with_L2> 
		ExtraPercent = 93.50000000000 
	} 
ENDSCRIPT

CasperBranches = [ 
	{ 
		Trigger = TRIGGER_MANUAL_BRANCHFLIP 
		Scr = ManualLink 
		Params = { 
			Name = #"Casper Flip" 
			Score = 500 
			ExtraPercent = 100 
			Anim = CasperFlip 
			Speed = 0.85000002384 
			BalanceAnim = Casper_Range 
			OutAnim = Casper_out 
			ExtraTricks = FlatLandBranches 
			BoardFlipAfter 
			ExtraTricks2 = CasperBranches 
			Parent = #"Casper" 
			Blend = 0.00000000000 
			Trickslack = 0 
			BoardRotate = 1 
			ExtraPercent = 100 
			IsExtra 
		} 
	} 
	{ 
		Trigger = { Press , L2 , ROTATEY_TRIGGER_TIME } 
		Scr = CasperSpin_Setup 
		Params = { 
			spin_with_L2 = 1 
			Name = #"Casper Spin" 
		} 
	} 
	{ 
		Trigger = { Press , R2 , ROTATEY_TRIGGER_TIME } 
		Scr = CasperSpin_Setup 
		Params = { 
			Name = #"Casper Spin" 
		} 
	} 
] 
SCRIPT CasperSpin_Setup 
	ManualLink { 
		Name = #"Casper Spin" 
		Score = 100 
		RotateY 
		BalanceAnim = Casper_Range 
		OutAnim = Casper_out 
		ExtraTricks = FlatLandBranches 
		ExtraTricks2 = CasperBranches 
		Parent = #"Casper" 
		Trickslack = 0 
		BoardRotate = 1 
		IsExtra 
		spin_with_L2 = <spin_with_L2> 
	} 
ENDSCRIPT

AntiCasperBranches = [ 
	{ 
		Trigger = TRIGGER_MANUAL_BRANCHFLIP 
		Scr = ManualLink 
		Params = { 
			Name = #"Anti Casper Flip" 
			Score = 500 
			ExtraPercent = 100 
			Anim = AntiCasperFlip 
			Speed = 0.69999998808 
			BalanceAnim = AntiCasper_Range 
			OutAnim = AntiCasper_out 
			ExtraTricks = FlatLandBranches 
			ExtraTricks2 = AntiCasperBranches 
			Parent = #"Anti Casper" 
			ExtraPercent = 100 
			Blend = 0.00000000000 
			Trickslack = 0 
			BoardRotate = 1 
			Nollie 
			IsExtra 
		} 
	} 
	{ 
		Trigger = { Press , L2 , ROTATEY_TRIGGER_TIME } 
		Scr = AntiCasperSpin_Setup 
		Params = { 
			spin_with_L2 = 1 
			Name = #"Anti Casper Spin" 
		} 
	} 
	{ 
		Trigger = { Press , R2 , ROTATEY_TRIGGER_TIME } 
		Scr = AntiCasperSpin_Setup 
		Params = { 
			Name = #"Anti Casper Spin" 
		} 
	} 
] 
SCRIPT AntiCasperSpin_Setup 
	ManualLink { 
		Name = #"Anti Casper Spin" 
		Score = 100 
		RotateY 
		BalanceAnim = AntiCasper_Range 
		OutAnim = AntiCasper_out 
		ExtraTricks = FlatLandBranches 
		ExtraTricks2 = AntiCasperBranches 
		Parent = #"Anti Casper" 
		Trickslack = 0 
		BoardRotate = 1 
		IsExtra 
		Nollie 
		spin_with_L2 = <spin_with_L2> 
	} 
ENDSCRIPT

TruckstandBranches = [ 
	{ 
		Trigger = TRIGGER_MANUAL_BRANCHFLIP 
		Scr = ManualLink 
		Params = { 
			Name = #"Truckstand Flip" 
			Score = 500 
			Anim = Truckstand_Flip 
			BalanceAnim = Truckstand_Range 
			OutAnim = Truckstand_Out 
			ExtraTricks = FlatLandBranches 
			ExtraTricks2 = TruckstandBranches 
			Parent = #"TruckStand" 
			ExtraPercent = 100 
			Trickslack = 0 
			IsExtra 
		} 
	} 
	{ 
		Trigger = { InOrder , a = Circle , b = Circle , 400 } 
		Scr = ManualLink 
		Params = { 
			IsSpooky 
			Name = #"Pogo to Hair Flip" 
			Score = 1500 
			Anim = Sweet 
			BalanceAnim = Truckstand_Range 
			OutAnim = Truckstand_Out 
			ExtraTricks2 = FlatLandBranches 
			ExtraTricks = TruckstandBranches 
			Parent = #"TruckStand" 
			Trickslack = 0 
			IsExtra 
		} 
	} 
	{ 
		Trigger = { Press , L2 , ROTATEY_TRIGGER_TIME } 
		Scr = TruckSpin_Setup 
		Params = { 
			spin_with_L2 = 1 
			Name = #"TruckSpin" 
		} 
	} 
	{ 
		Trigger = { Press , R2 , ROTATEY_TRIGGER_TIME } 
		Scr = TruckSpin_Setup 
		Params = { 
			Name = #"TruckSpin" 
		} 
	} 
] 
SCRIPT TruckSpin_Setup 
	ManualLink { 
		Name = #"TruckSpin" 
		Score = 100 
		RotateY 
		BalanceAnim = Truckstand_Range 
		OutAnim = Truckstand_Out 
		ExtraTricks = FlatLandBranches 
		ExtraTricks2 = TruckstandBranches 
		Parent = #"TruckStand" 
		Trickslack = 0 
		IsExtra 
		spin_with_L2 = <spin_with_L2> 
	} 
ENDSCRIPT

HandstandBranches = [ 
	{ 
		Trigger = TRIGGER_MANUAL_BRANCHFLIP 
		Scr = ManualLink 
		Params = { 
			Name = #"Handflip" 
			Score = 500 
			Anim = HStandFliptoHStand 
			BalanceAnim = HandstandHandFlip_Range 
			OutAnim = HandstandHandFlip_out 
			ExtraTricks = FlatLandBranches 
			ExtraTricks2 = HandstandBranches 
			Parent = #"HandStand" 
			ExtraPercent = 100 
			Trickslack = 0 
			IsExtra 
		} 
	} 
] 
FlatLandBranches = [ 
	{ Trigger = { InOrder , Square , Circle , 300 } Trick_AntiCasper } 
	{ Trigger = { InOrder , Square , Circle , 300 } Trick_NoseManual } 
	{ Trigger = { InOrder , Square , Triangle , 300 } Trick_Casper } 
	{ Trigger = { InOrder , Square , Triangle , 300 } Trick_Manual } 
	{ Trigger = { InOrder , Circle , Square , 300 } Trick_ToRail } 
	{ Trigger = { InOrder , Circle , Square , 300 } Trick_Manual } 
	{ Trigger = { InOrder , Circle , Triangle , 300 } Trick_OneFootManual } 
	{ Trigger = { InOrder , Circle , Triangle , 300 } Trick_OneFootNosemanual } 
	{ Trigger = { TripleInOrder , Left , Right , Square , 500 } Trick_Spacewalk } 
	{ Trigger = { InOrder , a = Circle , b = Circle , 300 } Trick_Handstand } 
	{ Trigger = { InOrder , a = Triangle , b = Triangle , 300 } Trick_Pogo } 
	{ Trigger = { InOrder , a = Triangle , b = Triangle , 300 } Trick_Manual } 
	{ Trigger = { InOrder , Triangle , Square , 300 } Trick_Truckstand } 
	{ Trigger = { InOrder , Triangle , Square , 300 } Trick_Manual } 
	{ Trigger = { InOrder , Triangle , Circle , 300 } Trick_SwitchFootPogo } 
	{ Trigger = { InOrder , Triangle , Circle , 300 } Trick_Manual } 
	{ Trigger = { InOrder , a = Circle , b = Circle , 300 } Trick_Manual } 
] 
SCRIPT PogoSpin_Setup 
	ManualLink { 
		Name = #"Pogo Spin" 
		Score = 100 
		RotateY 
		BalanceIdle = Pogo_Bounce 
		BoardRotate = 1 
		OutAnim = Pogo_Out 
		ExtraTricks = FlatLandBranches 
		ExtraTricks2 = PogoBranches 
		Parent = #"Pogo" 
		Trickslack = 0 
		IsExtra 
		spin_with_L2 = <spin_with_L2> 
	} 
ENDSCRIPT

PogoBranches = [ 
	{ 
		Trigger = TRIGGER_MANUAL_BRANCHFLIP 
		Trick_PogoFlip 
	} 
	{ 
		Trigger = { Press , L2 , ROTATEY_TRIGGER_TIME } 
		Scr = PogoSpin_Setup Params = { 
			spin_with_L2 = 1 
			Name = #"Pogo Spin" 
		} 
	} 
	{ 
		Trigger = { Press , R2 , ROTATEY_TRIGGER_TIME } 
		Scr = PogoSpin_Setup 
		Params = { 
			Name = #"Pogo Spin" 
		} 
	} 
] 
NoseManualBranches = [ 
	{ 
		Trigger = { Press , R2 , 200 } 
		Trick_Gturn 
	} 
	{ 
		Trigger = TRIGGER_MANUAL_BRANCHFLIP 
		Trick_HalfCabImpossible 
	} 
	{ 
		Trigger = { InOrder , Circle , Triangle , 300 } 
		Trick_OneFootNosemanual 
	} 
] 
ManualBranches = [ 
	{ 
		Trigger = { Press , R2 , 200 } 
		Trick_Gturn2 
	} 
	{ 
		Trigger = TRIGGER_MANUAL_BRANCHFLIP 
		Trick_360FlipNoseManual 
	} 
	{ 
		Trigger = { InOrder , Circle , Triangle , 300 } 
		Trick_OneFootManual 
	} 
] 
SCRIPT WalkAir_Manual { 
		Name = "Manual" 
		Score = 100 
	} 
	InAirExceptions 
	Obj_SetFlag FLAG_SKATER_IN_AIR_MANUAL 
	RemoveParameter FromWalk 
	SetException Ex = Landed Scr = Manual Params = { SkipInitAnim <...> } 
	KillExtraTricks 
	ClearTrickQueue 
	SetQueueTricks NoTricks 
	IF GotParam FromWalkAnim 
		PlayAnim Anim = <FromWalkAnim> 
	ELSE 
		IF GotParam Nollie 
			PlayAnim Anim = JumpAirToNoseManual 
		ELSE 
			PlayAnim Anim = JumpAirToManual 
		ENDIF 
	ENDIF 
	Block 
ENDSCRIPT

ManualExceptionTable = [ 
	{ Exception Ex = GroundGone Scr = GroundGone Params = { NoBoneless } } 
	{ Event Ex = MadeOtherSkaterBail Scr = MadeOtherSkaterBail_Called } 
	{ Exception Ex = FlailHitWall Scr = FlailHitWall } 
	{ Exception Ex = FlailLeft Scr = FlailLeft } 
	{ Exception Ex = FlailRight Scr = FlailRight } 
	{ Exception Ex = Carplant Scr = Carplant } 
	{ Exception Ex = CarBail Scr = CarBail } 
	{ Exception Ex = SkaterCollideBail Scr = SkaterCollideBail } 
	{ Exception Ex = Skitched Scr = Skitch } 
] 
SCRIPT Manual { 
		BlendPeriod = 0.30000001192 
		Speed = 1.00000000000 
	} 
	GetSingleTag State 
	IF GotParam State 
		IF ( <State> = Skater_OnWall ) 
			ManualFromWallride = 1 
		ENDIF 
	ENDIF 
	Obj_GetType 
	ResetAirStateCounters 
	IF IsSkaterOnVehicle 
		Goto vehicle_manual 
	ENDIF 
	IF GotParam FromWalk 
		Goto WalkAir_Manual Params = { <...> } 
	ENDIF 
	KillExtraTricks 
	SetTrickName "" 
	SetTrickScore 0 
	Display Blockspin 
	IF LandedFromVert 
		Goto Land 
	ENDIF 
	ClearLipCombos 
	ResetLandedFromVert 
	ResetEventHandlersFromTable ManualExceptionTable 
	IF DoingBalanceTrick 
		IF GotParam Nollie 
			SetBalanceTrickType Nosemanual 
		ELSE 
			SetBalanceTrickType Manual 
		ENDIF 
	ENDIF 
	IF GotParam Nollie 
		SetException Ex = Ollied Scr = NollieNoDisplay Params = { <...> } 
		NollieOn 
	ELSE 
		NollieOff 
		SetException Ex = Ollied Scr = Ollie Params = { <...> } 
	ENDIF 
	SetException Ex = OffMeterTop Scr = <OffMeterBottom> Params = { <...> } 
	SetException Ex = OffMeterBottom Scr = <OffMeterTop> Params = { <...> } 
	IF GotParam OffMeterBail 
		SetTags OffMeterBail 
	ELSE 
		RemoveTags [ OffMeterBail ] 
	ENDIF 
	OnExceptionRun CheckForNewTrick_ManualOut 
	LaunchStateChangeEvent State = Skater_InManual 
	IF GotParam ManualFromWallride 
		IF NOT ( ENABLE_MANUAL_BOOSTPLANT ) 
			ClearTrickQueue 
		ENDIF 
	ELSE 
		ClearTrickQueue 
	ENDIF 
	IF ( ( GetGlobalFlag Flag = FLAG_EXPERT_MODE_NO_WALKING ) | ( GetGlobalFlag Flag = FLAG_G_EXPERT_MODE_NO_WALKING ) ) 
		SetQueueTricks NoTricks 
	ELSE 
		SetQueueTricks SkateToWalkTricks 
	ENDIF 
	ResetProjectileInput 
	IF GotParam AllowWallpush 
		IF GotParam Nollie 
			SetException Ex = WallPush Scr = Manual_Wallpush 
		ELSE 
			SetException Ex = WallPush Scr = Manual_Wallpush Params = { ToNoseManual } 
		ENDIF 
	ELSE 
		SetEventHandler Ex = WallPush Scr = Manual_CancelWallpushEvent 
	ENDIF 
	IF GotParam IsSpecial 
		BroadcastEvent type = SkaterEnterSpecialTrick 
		SetManualTricks NoTricks 
	ELSE 
		IF GotParam IsExtra 
			SetManualTricks NoTricks 
		ELSE 
			IF ( ( GetGlobalFlag Flag = FLAG_EXPERT_MODE_NO_MANUALS ) | ( GetGlobalFlag Flag = FLAG_G_EXPERT_MODE_NO_MANUALS ) ) 
				SetManualTricks NoTricks 
			ELSE 
				SetManualTricks NoTricks Special = SpecialManualTricks 
			ENDIF 
		ENDIF 
	ENDIF 
	IF GotParam SpecialItem_Details 
		TurnOnSpecialItem SpecialItem_Details = <SpecialItem_Details> 
	ENDIF 
	StartBalanceTrick 
	Vibrate Actuator = 1 Percent = 25 
	OnExitRun KillManualVibration 
	IF GotParam FullScreenEffect 
		<FullScreenEffect> 
		IF GotParam IsSpecial 
			OnExitRun Exit_FullScreenEffect_and_Special 
		ELSE 
			OnExitRun Exit_FullScreenEffect 
		ENDIF 
	ELSE 
		IF GotParam IsSpecial 
			OnExitRun Exit_Special_Manual 
		ENDIF 
	ENDIF 
	IF GotParam Stream 
		IF NOT IsStreamPlaying SFXSpecialStream 
			PlayStream <Stream> vol = 200 priority = StreamPriorityHigh id = SFXSpecialStream 
		ENDIF 
	ENDIF 
	IF GotParam Friction 
		IF GetGlobalFlag Flag = SERVER_NO_WHORE 
			IF ( ( <Friction> = -5 ) | <Friction> = -50 ) 
				SetRollingFriction default 
			ELSE 
				SetRollingFriction <Friction> 
			ENDIF 
		ELSE 
			SetRollingFriction <Friction> 
		ENDIF 
	ELSE 
		SetRollingFriction default 
	ENDIF 
	IF GotParam IsSpecial 
		IF GotParam Nollie 
			DoBalanceTrick ButtonA = Up ButtonB = Down type = Nosemanual Tweak = 5 
		ELSE 
			DoBalanceTrick ButtonA = Up ButtonB = Down type = Manual Tweak = 5 
		ENDIF 
	ELSE 
		IF GotParam Nollie 
			DoBalanceTrick ButtonA = Up ButtonB = Down type = Nosemanual Tweak = 1 
		ELSE 
			DoBalanceTrick ButtonA = Up ButtonB = Down type = Manual Tweak = 1 
		ENDIF 
	ENDIF 
	IF GotParam LandPivotManual 
		printf "==== LAND PIVOT MANUAL" 
		Obj_ClearFlag FLAG_SKATER_IN_LAND_PIVOT 
	ENDIF 
	IF NOT GotParam SkipInitAnim 
		IF GotParam FromAir 
			IF backwards 
				FlipAndRotate 
				printf "PLAYING FLIPPED FROM MANUAL SCRIPT =======================================" 
				PlayAnim Anim = <FromAirAnim> BlendPeriod = 0.00000000000 Speed = <Speed> 
			ELSE 
				PlayAnim Anim = <FromAirAnim> BlendPeriod = 0.00000000000 Speed = <Speed> 
			ENDIF 
		ELSE 
			printf " PLAYING INIT ANIM >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" 
			IF AnimEquals HandstandHandFlip_Range 
				PlayAnim Anim = HandstandHandFlip_out 
				Obj_WaitAnimFinished 
			ENDIF 
			PlayAnim Anim = <InitAnim> BlendPeriod = 0.30000001192 Speed = <Speed> 
		ENDIF 
	ENDIF 
	IF Obj_FlagSet FLAG_SKATER_MANUALCHEESE 
		IF GotParam CheckCheese 
			GetManualCheese 
			ManualCheese = ( <ManualCheese> + 1 ) 
			SetTags ManualCheese = <ManualCheese> 
			printf "::::::::::::::::::::Cheese= %c" c = <ManualCheese> 
			IF ( <ManualCheese> > 1 ) 
				AdjustBalance TimeAdd = 2 SpeedMult = 2 LeanMult = 1.20000004768 
			ENDIF 
		ENDIF 
	ELSE 
		Obj_SetFlag FLAG_SKATER_MANUALCHEESE 
		SetTags ManualCheese = 0 
	ENDIF 
	IF GotParam ExtraTricks2 
		SetExtraTricks <ExtraTricks2> <ExtraTricks> ignore = <Name> 
	ELSE 
		IF GotParam ExtraTricks 
			SetExtraTricks <ExtraTricks> ignore = <Name> 
		ENDIF 
	ENDIF 
	IF GotParam CheckCheese 
		IF GotParam IsExtra 
			WaitAnim MANUAL_DISPLAY_WAIT frames 
		ELSE 
			WaitAnim 13 frames 
		ENDIF 
	ELSE 
		WaitAnim MANUAL_DISPLAY_WAIT frames 
	ENDIF 
	IF GotParam ExtraWaitPercent 
		WaitAnim <ExtraWaitPercent> Percent 
	ENDIF 
	IF GotParam IsSpecial 
	ELSE 
		IF GotParam IsExtra 
		ELSE 
			donextmanualtrick 
		ENDIF 
	ENDIF 
	<TrickName> = <Name> 
	IF InAir 
		IF Obj_FlagSet FLAG_SKATER_IN_AIR_MANUAL 
			RemoveParameter TrickName 
			FormatText TextName = TrickName "Air %a" a = <Name> 
		ENDIF 
	ENDIF 
	Obj_ClearFlag FLAG_SKATER_IN_AIR_MANUAL 
	SetTrickName <TrickName> 
	SetTrickScore <Score> 
	Display Blockspin 
	IF GotParam IsSpecial 
		LaunchSpecialMessage 
	ENDIF 
	IF GotParam IsExtra 
		LaunchExtraMessage 
	ENDIF 
	Obj_WaitAnimFinished 
	IF GotParam ExtraSpeedBoost 
		SpacewalkBoost ExtraSpeedBoost = <ExtraSpeedBoost> 
	ENDIF 
	IF GotParam FlipGraphic 
		BoardRotate 
	ENDIF 
	IF GotParam SproingFlip 
		BlendPeriodOut 0 
		FlipAfter 
	ENDIF 
	IF GotParam NoBlend 
		BlendPeriodOut 0 
	ENDIF 
	IF GotParam BalanceIdle 
		PlayAnim Anim = <BalanceIdle> cycle BlendPeriod = <BlendPeriod> Speed = <Speed> 
	ELSE 
		IF GotParam BalanceAnim3 
			PlayAnim RANDOM(1, 1, 1) RANDOMCASE Anim = <BalanceAnim> RANDOMCASE Anim = <BalanceAnim2> RANDOMCASE Anim = <BalanceAnim3> RANDOMEND wobble wobbleparams = Manual_wobble_params Speed = <Speed> 
		ELSE 
			IF GotParam BalanceAnim2 
				PlayAnim RANDOM(1, 1) RANDOMCASE Anim = <BalanceAnim> RANDOMCASE Anim = <BalanceAnim2> RANDOMEND wobble wobbleparams = Manual_wobble_params Speed = <Speed> 
			ELSE 
				PlayAnim Anim = <BalanceAnim> wobble wobbleparams = Manual_wobble_params Speed = <Speed> 
			ENDIF 
		ENDIF 
	ENDIF 
	IF GotParam SpawnScript 
		Obj_KillSpawnedScript Name = <SpawnScript> 
		Obj_SpawnScript <SpawnScript> 
	ENDIF 
	IF NOT ( ENABLE_MANUAL_BOOSTPLANT ) 
		WaitWhilstChecking_ForPressure <...> 
	ELSE 
		IF NOT GotParam ManualFromWallride 
			WaitWhilstChecking_ForPressure <...> 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT SpacewalkBoost ExtraSpeedBoost = 200 
	GetSpeed 
	IF ( <Speed> < <ExtraSpeedBoost> ) 
		SetSpeed <ExtraSpeedBoost> 
	ENDIF 
	printf "Speed=%s" s = <Speed> 
ENDSCRIPT

SCRIPT WaitWhilstChecking_ForPressure 
	BEGIN 
		IF held L2 
			IF GotParam Nollie 
				Toggle_Nollie_Pressure_States Nollie 
			ELSE 
				Toggle_Nollie_Pressure_States 
			ENDIF 
			BEGIN 
				IF released L2 
					IF ( PressureStanceMode = 1 ) 
						PressureOff 
						IF GotParam Nollie 
							NollieOn 
						ENDIF 
					ENDIF 
					BREAK 
				ENDIF 
				DoNextTrick 
				Wait 1 game frame 
			REPEAT 
		ENDIF 
		DoNextTrick 
		Wait 1 game frame 
	REPEAT 
ENDSCRIPT

SCRIPT Toggle_Nollie_Pressure_States 
	IF InNollie 
		NollieOff 
		PressureOn 
		SetException Ex = Ollied Scr = Ollie Params = { <...> } 
	ELSE 
		IF InPressure 
			PressureOff 
			IF GotParam Nollie 
				NollieOn 
				SetException Ex = Ollied Scr = NollieNoDisplay Params = { <...> } 
			ELSE 
				NollieOff 
			ENDIF 
		ELSE 
			PressureOn 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT CheckForNewTrick_ManualOut 
	printf "give the events back!!!!!!!" 
	RestoreEvents UsedBy = Extra Duration = 100 
	ManualOut 
ENDSCRIPT

SCRIPT Exit_Special_Manual 
	KillManualVibration 
	Exit_Special 
ENDSCRIPT

SCRIPT KillManualVibration 
	Vibrate Actuator = 1 Percent = 0 
ENDSCRIPT

Manual_wobble_params = { 
	WobbleAmpA = { PAIR(0.05000000075, 0.05000000075) STATS_MANUAL } 
	WobbleAmpB = { PAIR(0.03999999911, 0.03999999911) STATS_MANUAL } 
	WobbleK1 = { PAIR(0.00219999999, 0.00219999999) STATS_MANUAL } 
	WobbleK2 = { PAIR(0.00170000002, 0.00170000002) STATS_MANUAL } 
	SpazFactor = { PAIR(1.00000000000, 1.00000000000) STATS_MANUAL } 
} 
SCRIPT ManualOut 
	IF GotParam MadeOtherSkaterBail 
	ELSE 
		KillExtraTricks 
	ENDIF 
	SetTrickName #"" 
	SetTrickScore 0 
	Display Blockspin 
ENDSCRIPT

in_manual_land = 0 
flip_backwards_dont_blend = 0 
SCRIPT ManualLand_Cleanup 
	SetTags in_manual_land = 0 
ENDSCRIPT

SCRIPT ManualLand 
	SetTags in_manual_land = 1 
	change flip_backwards_dont_blend = 0 
	OnExitRun ManualLand_Cleanup 
	VibrateOff 
	SetException Ex = RunHasEnded Scr = EndOfRun 
	SetException Ex = GoalHasEnded Scr = Goal_EndOfRun 
	IF GoalManager_GoalShouldExpire 
		ClearException Ollied 
	ENDIF 
	LandSkaterTricks 
	ClearEventBuffer 
	ClearTrickQueue 
	KillExtraTricks 
	SetException Ex = WallPush Scr = Ground_Wallpush 
	StopBalanceTrick 
	IF GotParam PutDownAnim 
		PlayAnim Anim = <PutDownAnim> BlendPeriod = 0.20000000298 
	ELSE 
		IF GotParam Nollie 
			PlayAnim Anim = PutDownNosemanual BlendPeriod = 0.20000000298 
		ELSE 
			PlayAnim Anim = PutDownManual BlendPeriod = 0.20000000298 
		ENDIF 
	ENDIF 
	IF CancelRotateDisplayandUpdateMatrix 
		change flip_backwards_dont_blend = 1 
	ENDIF 
	WaitAnimWhilstChecking 
	change flip_backwards_dont_blend = 0 
	SetTags in_manual_land = 0 
	Goto OnGroundAi 
ENDSCRIPT

SCRIPT ManualLink grindslack = 25 Trickslack = 10 displaypercent = 50 TimeAdd = 0 SpeedMult = 1 Speed = 1.00000000000 Blend = 0.30000001192 
	ResetProjectileInput 
	Vibrate Actuator = 1 Percent = 25 
	OnExitRun KillManualVibration 
	IF GotParam IsSpooky 
		IF DateEquals { 
				day_from = ( global_day_from ) 
				day_to = ( global_day_to ) 
				month_from = ( global_month_from ) 
				month_to = ( global_month_to ) 
			} 
			SpecialItem_Details = spooky_details 
		ENDIF 
	ENDIF 
	IF GotParam Nollie 
		NollieOn 
		SetException Ex = Ollied Scr = NollieNoDisplay 
		SetBalanceTrickType Nosemanual 
	ELSE 
		NollieOff 
		SetException Ex = Ollied Scr = Ollie Params = { Anim = <Anim> OutAnim = <OutAnim> BoardRotate = <BoardRotate> BoardFlipAfter = <BoardFlipAfter> FlipAfter = <FlipAfter> NoBlend = <NoBlend> } 
		SetBalanceTrickType Manual 
	ENDIF 
	IF GotParam OffMeterTop 
		SetException Ex = OffMeterTop Scr = <OffMeterTop> Params = { <...> } 
		SetException Ex = OffMeterBottom Scr = <OffMeterBottom> Params = { <...> } 
	ENDIF 
	IF GotParam OffMeterBail 
		SetTags OffMeterBail 
	ELSE 
		RemoveTags [ OffMeterBail ] 
	ENDIF 
	IF GotParam AllowWallpush 
		IF GotParam Nollie 
			SetException Ex = WallPush Scr = Manual_Wallpush 
		ELSE 
			SetException Ex = WallPush Scr = Manual_Wallpush Params = { ToNoseManual } 
		ENDIF 
	ELSE 
		SetEventHandler Ex = WallPush Scr = Manual_CancelWallpushEvent 
	ENDIF 
	KillExtraTricks 
	OnExceptionRun ManualOut 
	BailOn 
	SetTrickName <Name> 
	SetTrickScore <Score> 
	AdjustBalance TimeAdd = <TimeAdd> SpeedMult = <SpeedMult> 
	IF GotParam Anim 
		PlayAnim Anim = <Anim> BlendPeriod = <Blend> Speed = <Speed> 
	ENDIF 
	IF GotParam SpecialItem_Details 
		TurnOnSpecialItem SpecialItem_Details = <SpecialItem_Details> 
	ENDIF 
	IF GotParam RotateY 
		IF flipped 
			IF GotParam spin_with_L2 
				RotateDisplay Y Duration = 0.75000000000 seconds StartAngle = 0.00000000000 EndAngle = 360.00000000000 SinePower = 0 RotationOffset = VECTOR(0.00000000000, 30.00000000000, 0.00000000000) 
			ELSE 
				RotateDisplay Y Duration = 0.75000000000 seconds StartAngle = 0.00000000000 EndAngle = -360.00000000000 SinePower = 0 RotationOffset = VECTOR(0.00000000000, 30.00000000000, 0.00000000000) 
			ENDIF 
		ELSE 
			IF GotParam spin_with_L2 
				RotateDisplay Y Duration = 0.75000000000 seconds StartAngle = 0.00000000000 EndAngle = 360.00000000000 SinePower = 0 RotationOffset = VECTOR(0.00000000000, 30.00000000000, 0.00000000000) 
			ELSE 
				RotateDisplay Y Duration = 0.75000000000 seconds StartAngle = 0.00000000000 EndAngle = -360.00000000000 SinePower = 0 RotationOffset = VECTOR(0.00000000000, 30.00000000000, 0.00000000000) 
			ENDIF 
		ENDIF 
		Wait 0.69999998808 seconds 
		PlayManualBalanceAnim <...> 
	ENDIF 
	IF GotParam Anim 
		Wait 5 frames 
	ENDIF 
	IF GotParam PlayCessSound 
		GetBoardTypeAndRevert type = ManualLink 
	ENDIF 
	IF GotParam IsExtra 
		IF NOT GotParam RotateY 
			IF NOT GotParam PlayCessSound 
				LaunchExtraMessage 
			ENDIF 
		ENDIF 
	ENDIF 
	IF GotParam IsSpecial 
		LaunchSpecialMessage 
	ENDIF 
	IF GotParam Anim 
		IF NOT GotParam RotateY 
			WaitAnim MANUAL_DISPLAY_WAIT frames 
		ENDIF 
	ENDIF 
	IF NOT GotParam NoDisplay 
		IF GotParam RotateY 
			Display AddSpin = 360 
		ELSE 
			Display Blockspin 
		ENDIF 
	ENDIF 
	IF GotParam Anim 
		IF GotParam ExtraPercent 
			printf "waiting an ExtraPercent" 
			WaitAnim <ExtraPercent> Percent 
		ENDIF 
	ENDIF 
	printf "Setting extra tricks active" 
	SetManualExtraTricks <...> 
	IF GotParam FlipAfter 
		FlipAfter 
		BlendPeriodOut 0 
		BoardRotateAfter 
	ENDIF 
	IF GotParam BoardFlipAfter 
		BlendPeriodOut 0 
		BoardRotateAfter 
	ENDIF 
	IF GotParam Anim 
		WaitAnim <ExtraPercent> Percent 
	ENDIF 
	Bailoff 
	IF NOT GotParam ReemoSpinFix 
		IF GotParam Anim 
			Obj_WaitAnimFinished 
		ENDIF 
	ENDIF 
	PlayManualBalanceAnim <...> 
	WaitWhilstChecking_ForPressure <...> 
ENDSCRIPT

SCRIPT PlayManualBalanceAnim 
	IF NOT GotParam Anim 
		BlendPeriod = 0.00000000000 
	ENDIF 
	IF GotParam BalanceIdle 
		PlayAnim Anim = <BalanceIdle> cycle BlendPeriod = <BlendPeriod> 
	ELSE 
		PlayAnim Anim = <BalanceAnim> cycle from = middle to = middle BlendPeriod = <BlendPeriod> 
		DoNextTrick 
		Wait 1 GameFrame 
		PlayAnim Anim = <BalanceAnim> wobble BlendPeriod = 0.30000001192 
		IF GotParam SetExtraTricksDuringIdleAnim 
			Wait 0.50000000000 seconds 
			SetManualExtraTricks <...> 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT SetManualExtraTricks Parent = #"none" 
	IF GotParam ExtraTricks2 
		SetExtraTricks <ExtraTricks2> <ExtraTricks> ignore = <Parent> 
	ELSE 
		IF GotParam ExtraTricks 
			IF GotParam NoDisplay 
				SetExtraTricks tricks = <ExtraTricks> 
			ELSE 
				SetExtraTricks tricks = <ExtraTricks> 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT GetManualCheese 
	Gettags 
	RETURN ManualCheese = <ManualCheese> 
ENDSCRIPT

SCRIPT manual_turnaround 
	Obj_SpawnScript manual_turnaround2 Params = { <...> } 
ENDSCRIPT

SCRIPT manual_turnaround2 time = 0.40000000596 
	TurnToFaceVelocity 
	IF YawingRight 
		angle = 180 
	ELSE 
		IF YawingLeft 
			angle = -180 
		ELSE 
			angle = RANDOM(1, 1) RANDOMCASE 180 RANDOMCASE -180 RANDOMEND 
		ENDIF 
	ENDIF 
	RotateDisplay Y Duration = <time> seconds StartAngle = <angle> EndAngle = 0 
	Wait ( <time> + 0.50000000000 ) seconds 
	EndManualTurnaround 
ENDSCRIPT

Trick_Scanning = { 
	Scr = Manual 
	Params = { 
		Name = #"The Scanner" 
		Skater = Iron_Man 
		Score = 3000 
		InitAnim = Scanning_Init 
		FullScreenEffect = IronManEffect 
		FromAirAnim = Scanning_Init 
		BalanceIdle = Scanning_Idle 
		OffMeterBail 
		OffMeterTop = ManualBail 
		OffMeterBottom = ManualBail 
		ExtraTricks2 = ManualBranches 
		ExtraTricks = FlatLandBranches 
		OutAnim = Scanning_Out 
		OutAnimOnOllie 
		IsSpecial 
		ExtraWaitPercent = 40 
	} 
} 
Trick_HeadStandManual = { 
	Scr = Manual 
	Params = { 
		Name = #"Head Balancer" 
		Score = 3100 
		InitAnim = HeadStandManual_Init 
		FromAirAnim = HeadStandManual_Init 
		BalanceAnim = HeadStandManual_range 
		OffMeterBail 
		OffMeterTop = ManualBail 
		OffMeterBottom = ManualBail 
		ExtraTricks2 = ManualBranches 
		ExtraTricks = FlatLandBranches 
		OutAnim = HeadStandManual_Out 
		IsSpecial 
		ExtraWaitPercent = 40 
	} 
} 
Trick_MuskaManual = { 
	Scr = Manual 
	Params = { 
		Name = #"Muska Manual" 
		Score = 3100 
		InitAnim = MuskaManual_Init 
		FromAirAnim = MuskaManual_Init 
		Stream = GhettoBlastin 
		BalanceIdle = MuskaManual_Idle 
		OffMeterBail 
		OffMeterTop = ManualBail 
		OffMeterBottom = ManualBail 
		ExtraTricks2 = ManualBranches 
		ExtraTricks = FlatLandBranches 
		OutAnim = MuskaManual_Out 
		OutAnimOnOllie 
		IsSpecial 
		ExtraWaitPercent = 40 
		SpecialItem_Details = boombox_details 
	} 
} 
Trick_PogoHandstand = { 
	Scr = Manual 
	Params = { 
		Name = #"Pogo Handstand" 
		Score = 4500 
		InitAnim = PogoHandstand_Init 
		FromAirAnim = PogoHandstand_Init 
		BalanceIdle = PogoHandstand_Idle 
		OffMeterBail 
		OffMeterTop = ManualBail 
		OffMeterBottom = ManualBail 
		ExtraTricks = HandstandBranches 
		OutAnim = PogoHandstand_Out 
		OutAnimOnOllie 
		IsSpecial 
		ExtraWaitPercent = 40 
	} 
} 
Trick_ReemoSlide = { 
	Scr = Manual 
	Params = { 
		Name = #"Reemo Slide" 
		Score = 3200 
		InitAnim = ReemoSlide_Init 
		FromAirAnim = ReemoSlide_Init 
		BalanceAnim = ReemoSlide_Range 
		OutAnim = ReemoSlide_out 
		OffMeterBail 
		OffMeterTop = NoseManualBail 
		OffMeterBottom = ManualBail 
		Friction = 1 
		IsSpecial 
		BoardRotate 
		ExtraTricks = FlatLandBranches 
	} 
} 
Trick_HangTenManual = { 
	Scr = Manual 
	Params = { 
		Name = #"Hang Ten Manual" 
		Score = 3200 
		InitAnim = HangTenNoseGrind_Init 
		FromAirAnim = HangTenNoseGrind_Init 
		BalanceAnim = HangTenNoseGrind_Range 
		OutAnim = HangTenNoseGrind_Out 
		OutAnimOnOllie 
		OffMeterTop = NoseManualBail 
		OffMeterBottom = ManualLand 
		Nollie 
		IsSpecial 
		ExtraTricks = FlatLandBranches 
	} 
} 
SCRIPT IronManEffect 
ENDSCRIPT


