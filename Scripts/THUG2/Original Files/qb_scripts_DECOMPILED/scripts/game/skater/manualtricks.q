
MANUAL_DISPLAY_WAIT = 25 
ROTATEY_TRIGGER_TIME = 300 
TRIGGER_MANUAL_BRANCHFLIP = { InOrder , a = Square , b = Square , 200 } 
SpecialManualTricks = 
[ 
	{ Trigger = { TripleInOrder , Up , Right , Triangle , 400 } Duration = 700 TrickSlot = SpMan_U_R_Triangle } 
	{ Trigger = { TripleInOrder , Up , Down , Triangle , 400 } Duration = 700 TrickSlot = SpMan_U_D_Triangle } 
	{ Trigger = { TripleInOrder , Up , Left , Triangle , 400 } Duration = 700 TrickSlot = SpMan_U_L_Triangle } 
	{ Trigger = { TripleInOrder , Right , Up , Triangle , 400 } Duration = 700 TrickSlot = SpMan_R_U_Triangle } 
	{ Trigger = { TripleInOrder , Right , Down , Triangle , 400 } Duration = 700 TrickSlot = SpMan_R_D_Triangle } 
	{ Trigger = { TripleInOrder , Right , Left , Triangle , 400 } Duration = 700 TrickSlot = SpMan_R_L_Triangle } 
	{ Trigger = { TripleInOrder , Down , Up , Triangle , 400 } Duration = 700 TrickSlot = SpMan_D_U_Triangle } 
	{ Trigger = { TripleInOrder , Down , Right , Triangle , 400 } Duration = 700 TrickSlot = SpMan_D_R_Triangle } 
	{ Trigger = { TripleInOrder , Down , Left , Triangle , 400 } Duration = 700 TrickSlot = SpMan_D_L_Triangle } 
	{ Trigger = { TripleInOrder , Left , Up , Triangle , 400 } Duration = 700 TrickSlot = SpMan_L_U_Triangle } 
	{ Trigger = { TripleInOrder , Left , Right , Triangle , 400 } Duration = 700 TrickSlot = SpMan_L_R_Triangle } 
	{ Trigger = { TripleInOrder , Left , Down , Triangle , 400 } Duration = 700 TrickSlot = SpMan_L_D_Triangle } 
] 
Trick_SlamSpinner = { Scr = Manual Params = { Name = #"Slam Spinner" Score = 3500 InitAnim = SlamSpinner FromWalkAnim = SlamSpinner FromAirAnim = SlamSpinner BalanceAnim = Manual_Range OffMeterTop = ManualLand OffMeterBottom = ManualBail ExtraTricks2 = ManualBranches ExtraTricks = FlatLandBranches IsSpecial ExtraWaitPercent = 40 } } 
Trick_YeahRight = { Scr = Manual Params = { Name = #"Yeah Right" Score = 3100 InitAnim = YeahRight_Init FromWalkAnim = YeahRight_Init FromAirAnim = YeahRight_Init balanceIdle = yeahright_idle OffMeterTop = ManualBail OffMeterBottom = ManualBail ExtraTricks2 = ManualBranches ExtraTricks = FlatLandBranches OutAnim = YeahRight_Out IsSpecial ExtraWaitPercent = 40 OutAnimOnOllie specialitem_details = extraboard_details } } 
Trick_MixItUp = { Scr = Manual Params = { Name = #"Mix It Up" Score = 4500 InitAnim = MixItUp_Init FromAirAnim = MixItUp_Init balanceIdle = MixItUp_Idle Speed = 1.20000004768 OffMeterTop = ManualBail OffMeterBottom = ManualBail ExtraTricks2 = ManualBranches ExtraTricks = FlatLandBranches OutAnim = MixItUp_Out OutAnimOnOllie IsSpecial ExtraWaitPercent = 40 } } 
Trick_KickflipSwitch = { Scr = Manual Params = { Name = #"Flip 2 Switch" Score = 4500 InitAnim = KickflipSwitchOnefootManual_Init FromAirAnim = KickflipSwitchOnefootManual_Init BalanceAnim = KickflipSwitchOnefootManual_range OffMeterTop = ManualBail OffMeterBottom = ManualBail ExtraTricks2 = ManualBranches ExtraTricks = FlatLandBranches OutAnim = KickflipSwitchOnefootManual_Out OutAnimOnOllie IsSpecial FlipAfter ExtraWaitPercent = 30 } } 
Trick_HandStandCasper = { Scr = Manual Params = { Name = #"Casper Handstand" Score = 4500 InitAnim = HandstandCasper_Init FromAirAnim = HandstandCasper_Init BalanceAnim = HandstandCasper_range OffMeterTop = ManualBail OffMeterBottom = ManualBail ExtraTricks = HandstandBranches OutAnim = HandstandCasper_Out OutAnimOnOllie IsSpecial ExtraWaitPercent = 40 } } 
Trick_HoHoStreetPlant = { Scr = Manual Params = { Name = #"Ho Ho Street Plant" Score = 4500 InitAnim = HoHoStreetPlant_init FromAirAnim = HoHoStreetPlant_init balanceIdle = HoHoStreetPlant_idle OutAnim = HoHoStreetPlant_out OutAnimOnOllie OffMeterTop = NoseManualBail OffMeterBottom = NoseManualBail ExtraTricks = FlatLandBranches IsSpecial FlipAfter NoBlend } } 
Trick_NoComplyLate360 = { Scr = Manual Params = { Name = #"No Comply 360 Shove-It" Score = 4500 InitAnim = NoComplyLate360 FromAirAnim = NoComplyLate360 BalanceAnim = Manual_Range OffMeterTop = ManualBail OffMeterBottom = ManualLand ExtraTricks = ManualBranches IsSpecial NoBlend ExtraTricks = FlatLandBranches ExtraWaitPercent = 40 } } 
Trick_RustySlide = { Scr = Manual Params = { Name = #"Rusty Slide Manual" Score = 4500 InitAnim = RustySlide_Init FromAirAnim = RustySlide_Init BalanceAnim = Primo_Range OutAnim = RustySlide_out OffMeterTop = NoseManualBail OffMeterBottom = ManualBail Friction = 0.50000000000 IsSpecial BoardRotate ExtraTricks = FlatLandBranches ExtraTricks2 = ToRail_Branches FlipGraphic NoBlend } } 
Trick_Sproing = { Scr = Manual Params = { Name = #"Sproing" Score = 4500 InitAnim = Sproing FromAirAnim = Sproing BalanceAnim = Manual_Range OffMeterTop = ManualBail OffMeterBottom = ManualLand ExtraTricks2 = ManualBranches ExtraTricks = FlatLandBranches IsSpecial SproingFlip ExtraWaitPercent = 40 } } 
Trick_PrimoSlide = { Scr = Manual Params = { Name = #"Primo" Score = 4000 InitAnim = Primo_Init FromAirAnim = Primo_Init BalanceAnim = Primo_Range OutAnim = Primo_out OffMeterTop = NoseManualBail OffMeterBottom = ManualBail Friction = 0.34999999404 IsSpecial ExtraTricks = FlatLandBranches ExtraTricks2 = ToRail_Branches } } 
Trick_OneFootOneWheel = { Scr = Manual Params = { Name = #"One Wheel Nosemanual" Score = 4100 InitAnim = OneFootOneWheel_Init FromAirAnim = OneFootOneWheel_Init BalanceAnim = OneFootOneWheel_Range OutAnim = PutDownOneWheel OffMeterTop = NoseManualBail OffMeterBottom = ManualLand Friction = 0.34999999404 IsSpecial Nollie ExtraTricks2 = NoseManualBranches ExtraTricks = FlatLandBranches PutDownAnim = PutDownOneWheel } } 
Trick_DanceParty = { Scr = Manual Params = { Name = #"Ahhh yeahhh!" Score = 4000 InitAnim = DanceParty_Init FromAirAnim = DanceParty_Init balanceIdle = DanceParty_Idle OffMeterTop = ManualBail OffMeterBottom = NoseManualBail Friction = 20 IsSpecial ExtraTricks = FlatLandBranches } } 
Trick_PrimoSpin = { Scr = Manual Params = { Name = #"Primo Spin" Score = 4500 InitAnim = Special_Rodney_PrimoSpin_Init FromAirAnim = Special_Rodney_PrimoSpin_Init balanceIdle = Special_Rodney_PrimoSpin_Idle OffMeterTop = ManualBail OffMeterBottom = NoseManualBail OutAnim = Special_Rodney_PrimoSpin_Out Friction = 0.50000000000 IsSpecial ExtraTricks = FlatLandBranches stream = Spec_Mullen02 } } 
Trick_Butt_Manual = { Scr = Manual Params = { Name = #"Paulie Butt Manual" UnlockFlag = SKATER_UNLOCKED_PAULIE Score = 4000 InitAnim = Special_Paulie_ButtMan_Init FromAirAnim = Special_Paulie_ButtMan_Init balanceIdle = Special_Paulie_ButtMan_Range OffMeterTop = ManualBail OffMeterBottom = NoseManualBail OutAnim = Special_Paulie_ButtMan_Out Friction = -5 IsSpecial ExtraTricks = FlatLandBranches stream = Spec_Paulie01 } } 
Trick_JesterJuggle = { Scr = Manual Params = { Name = #"Manual Entertainer" UnlockFlag = SKATER_UNLOCKED_JESTER Score = 4500 InitAnim = Special_Jester_Juggle_Init FromAirAnim = Special_Jester_Juggle_Init balanceIdle = Special_Jester_Juggle_idle OffMeterTop = ManualBail OffMeterBottom = NoseManualBail OutAnim = Special_Jester_Juggle_Out Friction = 0.34999999404 IsSpecial ExtraTricks = FlatLandBranches specialitem_details = JugglingBalls_details stream = Spec_Jester01 } } 
Trick_HotRod = { Scr = Manual Params = { Name = #"Hot Rod" Score = 4250 UnlockFlag = SKATER_UNLOCKED_JESSEJAMES InitAnim = Special_Jesse_HotRod_Init FromAirAnim = Special_Jesse_HotRod_Init BalanceAnim = Special_Jesse_HotRod_Range OffMeterTop = ManualLand OffMeterBottom = NoseManualBail OutAnim = Special_Jesse_HotRod_Out Friction = -5 IsSpecial ExtraTricks = FlatLandBranches specialitem_details = DragTires_details stream = Spec_JesseJ01 } } 
Trick_TonySurfer = { Scr = Manual Params = { Name = #"Surfer" Score = 4500 InitAnim = Special_Tony_Surfer_Init FromAirAnim = Special_Tony_Surfer_Init balanceIdle = Special_Tony_Surfer_Idle OffMeterTop = ManualBail OffMeterBottom = NoseManualBail OutAnim = Special_Tony_Surfer_Out Friction = 0.34999999404 IsSpecial ExtraTricks = FlatLandBranches stream = Spec_Hawk02 } } 
Trick_RunningMan = { Scr = Manual Params = { Name = #"Running Manual" Score = 4500 InitAnim = Special_Eric_RnngMan_Init FromAirAnim = Special_Eric_RnngMan_Init balanceIdle = Special_Eric_RnngMan_Idle OffMeterTop = ManualBail OffMeterBottom = NoseManualBail Friction = 0.34999999404 IsSpecial ExtraTricks = FlatLandBranches stream = Spec_Sparrow01 } } 
Trick_Boomerang = { Scr = Manual Params = { Name = #"Boomerang" Score = 4500 InitAnim = Special_MikeV_Boomerang FromAirAnim = Special_MikeV_Boomerang BalanceAnim = NoseManual_Range BalanceAnim2 = NoseManual_Range2 Nollie OffMeterTop = NoseManualBail OffMeterBottom = ManualLand ExtraTricks2 = NoseManualBranches IsSpecial ExtraTricks = FlatLandBranches stream = Spec_Vallely02 } } 
AIR_MANUAL_DURATION = 1000 
AIR_MANUAL_TIMING = 400 
ManualTricks = 
[ 
	{ Trigger = { InOrder , Up , Down , 400 } Duration = 700 Trick_Manual } 
	{ Trigger = { InOrder , Down , Up , 400 } Duration = 700 Trick_NoseManual } 
] 
GroundManualTricks = 
[ 
	{ Trigger = { InOrder , Up , Down , 220 } Trick_Manual } 
	{ Trigger = { InOrder , Down , Up , 220 } Trick_NoseManual } 
] 
VehicleManualTricks = 
[ 
	{ Trigger = { InOrder , Up , Down , 220 } Trick_Vehicle_Manual } 
	{ Trigger = { InOrder , Down , Up , 220 } Trick_Vehicle_Manual } 
] 
Trick_Manual = { Scr = Manual Params = { Name = #"Manual" Score = 100 InitAnim = Manual FromAirAnim = ManualFromAir FromWalkAnim = JumpAirToManual BalanceAnim = Manual_Range BalanceAnim2 = Manual_Range2 BalanceAnim3 = Manual_Range3 OffMeterTop = ManualLand OffMeterBottom = ManualBail ExtraTricks2 = ManualBranches ExtraTricks = FlatLandBranches CheckCheese AllowWallpush } } 
Trick_NoseManual = { Scr = Manual Params = { Name = #"Nose Manual" Score = 100 InitAnim = Nosemanual FromAirAnim = NoseManualFromAir FromWalkAnim = JumpAirToNoseManual BalanceAnim = NoseManual_Range BalanceAnim2 = NoseManual_Range2 Nollie OffMeterTop = NoseManualBail OffMeterBottom = ManualLand ExtraTricks2 = NoseManualBranches ExtraTricks = FlatLandBranches CheckCheese AllowWallpush } } 
Trick_Vehicle_Manual = { Scr = Manual Params = { Name = #"Chainsaw Manual" Score = 100 Friction = -50 InitAnim = Manual FromAirAnim = ManualFromAir FromWalkAnim = JumpAirToManual BalanceAnim = Manual_Range BalanceAnim2 = Manual_Range2 BalanceAnim3 = Manual_Range3 OffMeterTop = ManualLand OffMeterBottom = ManualBail CheckCheese } } 
Trick_OneFootNosemanual = { Scr = Manual Params = { Name = #"One Foot Nose Manual" Score = 1050 InitAnim = OneFootNosemanual_Init FromAirAnim = OneFootNosemanual_Init BalanceAnim = OneFootNoseManual_Range Nollie OffMeterTop = NoseManualBail OffMeterBottom = ManualLand IsExtra ExtraTricks = NoseManualBranches ExtraTricks2 = FlatLandBranches } } 
Trick_OneFootManual = { Scr = Manual Params = { Name = #"One Foot Manual" Score = 1050 InitAnim = OneFootManual_init FromAirAnim = OneFootManual_init BalanceAnim = OneFootManual_Range OffMeterTop = ManualLand OffMeterBottom = ManualBail ExtraTricks = ManualBranches ExtraTricks2 = FlatLandBranches IsExtra } } 
Trick_Spacewalk = { Scr = Manual Params = { Name = #"Spacewalk" Score = 1200 InitAnim = Manual FromAirAnim = ManualFromAir FromWalkAnim = JumpAirToManual balanceIdle = Spacewalk OffMeterTop = ManualLand OffMeterBottom = ManualBail ExtraTricks2 = ManualBranches ExtraTricks = FlatLandBranches AllowWallpush ExtraSpeedBoost = 250 } } 
Trick_Handstand = { Scr = Manual Params = { Name = #"HandStand" Score = 1100 InitAnim = HandstandHandFlip_Init FromAirAnim = HandstandHandFlip_Init BalanceAnim = HandstandHandFlip_Range OutAnim = HandstandHandFlip_out OffMeterTop = ManualLand OffMeterBottom = ManualBail Friction = 0.50000000000 WaitOnOlliePercent = 10 ExtraTricks = FlatLandBranches ExtraTricks2 = HandstandBranches } } 
Trick_Casper = { Scr = Manual Params = { Name = #"Casper" Score = 1100 InitAnim = Casper_Init FromAirAnim = Casper_Init BalanceAnim = Casper_Range OutAnim = Casper_out OffMeterTop = ManualLand OffMeterBottom = NoseManualBail Friction = 0.50000000000 BoardRotate ExtraTricks = FlatLandBranches ExtraTricks2 = CasperBranches } } 
Trick_AntiCasper = { Scr = Manual Params = { Name = #"Anti Casper" Score = 1100 InitAnim = AntiCasper_Init FromAirAnim = AntiCasper_Init BalanceAnim = AntiCasper_Range OutAnim = AntiCasper_out OffMeterTop = ManualBail OffMeterBottom = ManualLand Friction = 0.50000000000 BoardRotate Nollie ExtraTricks = FlatLandBranches ExtraTricks2 = AntiCasperBranches } } 
Trick_Truckstand = { Scr = Manual Params = { Name = #"Truckstand" Score = 800 InitAnim = Truckstand_Init FromAirAnim = Truckstand_Init BalanceAnim = Truckstand_Range OutAnim = Truckstand_Out OffMeterTop = ManualLand OffMeterBottom = ManualBail Friction = 1.50000000000 ExtraTricks = FlatLandBranches ExtraTricks2 = TruckstandBranches } } 
Trick_SwitchFootPogo = { Scr = Manual Params = { Name = #"Switch Foot Pogo" Score = 800 InitAnim = Truckrun_Init FromAirAnim = Truckrun_Init balanceIdle = TruckRun OutAnim = Truckrun_Out OffMeterTop = ManualLand OffMeterBottom = ManualBail Friction = 1 ExtraTricks = FlatLandBranches ExtraTricks2 = SwitchFootPogo_Branches } } 
Trick_Pogo = { Scr = Manual Params = { Name = #"Pogo" Score = 750 InitAnim = Pogo_Init FromAirAnim = Pogo_Init balanceIdle = Pogo_Bounce OutAnim = Pogo_Out OutSpeed = 1.50000000000 OffMeterTop = ManualLand OffMeterBottom = ManualBail Friction = 1.50000000000 ExtraTricks = FlatLandBranches BoardRotate ExtraTricks2 = PogoBranches BounceBoobs } } 
Trick_ToRail = { Scr = Manual Params = { Name = #"To Rail" Score = 1050 InitAnim = Primo_Init FromAirAnim = Primo_Init BalanceAnim = Primo_Range OutAnim = Primo_out OffMeterTop = NoseManualBail OffMeterBottom = ManualLand Friction = 1.00000000000 ExtraTricks = FlatLandBranches ExtraTricks2 = ToRail_Branches IsExtra } } 
Trick_Gturn = { Scr = ManualLink Params = { Name = #"Nose Pivot" Score = 250 Anim = GTurn BalanceAnim = Manual FlipAfter BalanceAnim = Manual_Range Trickslack = 0 PlayCessSound extrapercent = 100 ExtraTricks = FlatLandBranches ExtraTricks2 = ManualBranches TimeAdd = 1 SpeedMult = 1.00000000000 OffMeterTop = ManualBail OffMeterBottom = ManualLand AllowWallpush } } 
Trick_Gturn2 = { Scr = ManualLink Params = { Name = #"Pivot" Score = 250 Anim = GTurn2 BalanceAnim = Manual FlipAfter BalanceAnim = NoseManual_Range Trickslack = 0 PlayCessSound extrapercent = 100 ExtraTricks = FlatLandBranches ExtraTricks2 = NoseManualBranches Nollie TimeAdd = 1 SpeedMult = 1.00000000000 OffMeterTop = ManualLand OffMeterBottom = NoseManualBail AllowWallpush } } 
Trick_HalfCabImpossible = { Scr = ManualLink Params = { Name = #"Half Cab Impossible" Score = 750 Anim = HalfCabImpossible BalanceAnim = Manual FlipAfter BoardFlipAfter BalanceAnim = Manual_Range Trickslack = 0 extrapercent = 100 ExtraTricks = FlatLandBranches ExtraTricks2 = ManualBranches TimeAdd = 0 SpeedMult = 1.00000000000 OffMeterTop = ManualBail IsExtra OffMeterBottom = ManualLand } } 
Trick_360FlipNoseManual = { Scr = ManualLink Params = { Name = #"360 Fingerflip" Score = 750 Anim = _360FlipNosemanual BalanceAnim = Nosemanual BalanceAnim = NoseManual_Range Trickslack = 0 extrapercent = 100 ExtraTricks = FlatLandBranches ExtraTricks2 = NoseManualBranches TimeAdd = 0 SpeedMult = 1.00000000000 OffMeterTop = ManualLand OffMeterBottom = NoseManualBail } } 
Trick_PogoFlip = { Scr = ManualLink Params = { Name = #"Wrap Around" Score = 500 Anim = Pogo_Kickfoot balanceIdle = Pogo_Bounce Speed = 1.50000000000 OutAnim = Pogo_Out OutSpeed = 1.50000000000 ExtraTricks = FlatLandBranches ExtraTricks2 = PogoBranches Parent = #"Pogo" extrapercent = 100 Trickslack = 0 IsExtra } } 
SwitchFootPogo_Branches = 
[ { Trigger = TRIGGER_MANUAL_BRANCHFLIP Scr = ManualLink Params = { Name = #"Half Wrap Truck Transfer" Score = 500 Anim = TruckRunFlip balanceIdle = TruckRun ExtraTricks = FlatLandBranches ExtraTricks2 = SwitchFootPogo_Branches Parent = #"Switch Foot Pogo" BoardFlipAfter extrapercent = 100 Trickslack = 0 IsExtra } } 
	{ Trigger = { Press , L2 , ROTATEY_TRIGGER_TIME } Scr = SwitchFootPogo_Setup Params = { Name = #"Switch Foot Pogo Spin" spin_with_L2 = 1 } NGC_Trigger = { InOrder , Left , R1 , ROTATEY_TRIGGER_TIME } } 
	{ Trigger = { Press , R2 , ROTATEY_TRIGGER_TIME } Scr = SwitchFootPogo_Setup Params = { Name = #"Switch Foot Pogo Spin" } NGC_Trigger = { Press , R1 , ROTATEY_TRIGGER_TIME } } 
] 
SCRIPT SwitchFootPogo_Setup 
	ManualLink Name = #"Switch Foot Pogo Spin" Score = 100 RotateY balanceIdle = TruckRun OutAnim = Truckrun_Out ExtraTricks = FlatLandBranches ExtraTricks2 = SwitchFootPogo_Branches Parent = #"Switch Foot Pogo" Trickslack = 0 IsExtra spin_with_L2 = <spin_with_L2> 
ENDSCRIPT

ToRail_Branches = 
[ { Trigger = TRIGGER_MANUAL_BRANCHFLIP Scr = ManualLink Params = { Name = #"Rail Flip" Score = 500 Anim = RailFlip BalanceAnim = Primo_Range ExtraTricks = FlatLandBranches ExtraTricks2 = ToRail_Branches Parent = #"To Rail" Trickslack = 0 extrapercent = 100 IsExtra } } ] 
CasperBranches = 
[ { Trigger = TRIGGER_MANUAL_BRANCHFLIP Scr = ManualLink Params = { Name = #"Casper Flip" Score = 500 extrapercent = 100 Anim = CasperFlip Speed = 0.85000002384 BalanceAnim = Casper_Range OutAnim = Casper_out ExtraTricks = FlatLandBranches BoardFlipAfter ExtraTricks2 = CasperBranches Parent = #"Casper" Blend = 0.00000000000 Trickslack = 0 BoardRotate = 1 extrapercent = 100 IsExtra } } 
	{ Trigger = { Press , L2 , ROTATEY_TRIGGER_TIME } Scr = CasperSpin_Setup Params = { spin_with_L2 = 1 Name = #"Casper Spin" } NGC_Trigger = { InOrder , Left , R1 , ROTATEY_TRIGGER_TIME } } 
	{ Trigger = { Press , R2 , ROTATEY_TRIGGER_TIME } Scr = CasperSpin_Setup Params = { Name = #"Casper Spin" } NGC_Trigger = { Press , R1 , ROTATEY_TRIGGER_TIME } } 
] 
SCRIPT CasperSpin_Setup 
	ManualLink Name = #"Casper Spin" Score = 100 RotateY BalanceAnim = Casper_Range OutAnim = Casper_out ExtraTricks = FlatLandBranches ExtraTricks2 = CasperBranches Parent = #"Casper" Trickslack = 0 BoardRotate = 1 IsExtra spin_with_L2 = <spin_with_L2> 
ENDSCRIPT

AntiCasperBranches = 
[ { Trigger = TRIGGER_MANUAL_BRANCHFLIP Scr = ManualLink Params = { Name = #"Anti Casper Flip" Score = 500 extrapercent = 100 Anim = AntiCasperFlip Speed = 0.69999998808 BalanceAnim = AntiCasper_Range OutAnim = AntiCasper_out ExtraTricks = FlatLandBranches ExtraTricks2 = AntiCasperBranches Parent = #"Anti Casper" extrapercent = 100 Blend = 0.00000000000 Trickslack = 0 BoardRotate = 1 IsExtra } } 
	{ Trigger = { Press , L2 , ROTATEY_TRIGGER_TIME } Scr = AntiCasperSpin_Setup Params = { spin_with_L2 = 1 Name = #"Anti Casper Spin" } NGC_Trigger = { InOrder , Left , R1 , ROTATEY_TRIGGER_TIME } } 
	{ Trigger = { Press , R2 , ROTATEY_TRIGGER_TIME } Scr = AntiCasperSpin_Setup Params = { Name = #"Anti Casper Spin" } NGC_Trigger = { Press , R1 , ROTATEY_TRIGGER_TIME } } 
] 
SCRIPT AntiCasperSpin_Setup 
	ManualLink Name = #"Anti Casper Spin" Score = 100 RotateY BalanceAnim = AntiCasper_Range OutAnim = AntiCasper_out ExtraTricks = FlatLandBranches ExtraTricks2 = AntiCasperBranches Parent = #"Anti Casper" Trickslack = 0 BoardRotate = 1 IsExtra spin_with_L2 = <spin_with_L2> 
ENDSCRIPT

TruckstandBranches = 
[ { Trigger = TRIGGER_MANUAL_BRANCHFLIP Scr = ManualLink Params = { Name = #"Truckstand Flip" Score = 500 Anim = Truckstand_Flip BalanceAnim = Truckstand_Range OutAnim = Truckstand_Out ExtraTricks = FlatLandBranches ExtraTricks2 = TruckstandBranches Parent = #"TruckStand" extrapercent = 100 Trickslack = 0 IsExtra } } 
	{ Trigger = { InOrder , a = Circle , b = Circle , 400 } Scr = ManualLink Params = { Name = #"Pogo to Hair Flip" Score = 1500 Anim = Sweet BalanceAnim = Truckstand_Range OutAnim = Truckstand_Out ExtraTricks2 = FlatLandBranches ExtraTricks = TruckstandBranches Parent = #"TruckStand" Trickslack = 0 IsExtra } } 
	{ Trigger = { Press , L2 , ROTATEY_TRIGGER_TIME } Scr = TruckSpin_Setup Params = { spin_with_L2 = 1 Name = #"TruckSpin" } NGC_Trigger = { InOrder , Left , R1 , ROTATEY_TRIGGER_TIME } } 
	{ Trigger = { Press , R2 , ROTATEY_TRIGGER_TIME } Scr = TruckSpin_Setup Params = { Name = #"TruckSpin" } NGC_Trigger = { Press , R1 , ROTATEY_TRIGGER_TIME } } 
] 
SCRIPT TruckSpin_Setup 
	ManualLink Name = #"TruckSpin" Score = 100 RotateY BalanceAnim = Truckstand_Range OutAnim = Truckstand_Out ExtraTricks = FlatLandBranches ExtraTricks2 = TruckstandBranches Parent = #"TruckStand" Trickslack = 0 IsExtra spin_with_L2 = <spin_with_L2> 
ENDSCRIPT

HandstandBranches = 
[ { Trigger = TRIGGER_MANUAL_BRANCHFLIP Scr = ManualLink Params = { Name = #"Handflip" Score = 500 Anim = HStandFliptoHStand BalanceAnim = HandstandHandFlip_Range OutAnim = HandstandHandFlip_out ExtraTricks = FlatLandBranches ExtraTricks2 = HandstandBranches Parent = #"HandStand" extrapercent = 100 Trickslack = 0 IsExtra } } ] 
FlatLandBranches = 
[ 
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
	{ Trigger = { InOrder , Triangle , Square , 300 } Trick_ Manual } 
	{ Trigger = { InOrder , Triangle , Circle , 300 } Trick_SwitchFootPogo } 
	{ Trigger = { InOrder , Triangle , Circle , 300 } Trick_Manual } 
	{ Trigger = { InOrder , a = Circle , b = Circle , 300 } Trick_Manual } 
] 
SCRIPT PogoSpin_Setup 
	ManualLink Name = #"Pogo Spin" Score = 100 RotateY balanceIdle = Pogo_Bounce BoardRotate = 1 OutAnim = Pogo_Out ExtraTricks = FlatLandBranches ExtraTricks2 = PogoBranches Parent = #"Pogo" Trickslack = 0 IsExtra spin_with_L2 = <spin_with_L2> 
ENDSCRIPT

PogoBranches = 
[ 
	{ Trigger = TRIGGER_MANUAL_BRANCHFLIP Trick_PogoFlip } 
	{ Trigger = { Press , L2 , ROTATEY_TRIGGER_TIME } Scr = PogoSpin_Setup Params = { spin_with_L2 = 1 Name = #"Pogo Spin" } NGC_Trigger = { InOrder , Left , R1 , ROTATEY_TRIGGER_TIME } } 
	{ Trigger = { Press , R2 , ROTATEY_TRIGGER_TIME } Scr = PogoSpin_Setup Params = { Name = #"Pogo Spin" } NGC_Trigger = { Press , R1 , ROTATEY_TRIGGER_TIME } } 
] 
NoseManualBranches = 
[ { Trigger = { Press , R2 , 200 } Trick_Gturn NGC_Trigger = { Press , R1 , 200 } } 
	{ Trigger = TRIGGER_MANUAL_BRANCHFLIP Trick_HalfCabImpossible } 
	{ Trigger = { InOrder , Circle , Triangle , 300 } Trick_OneFootNosemanual } 
] 
ManualBranches = 
[ { Trigger = { Press , R2 , 200 } Trick_Gturn2 NGC_Trigger = { Press , R1 , 200 } } 
	{ Trigger = TRIGGER_MANUAL_BRANCHFLIP Trick_360FlipNoseManual } 
	{ Trigger = { InOrder , Circle , Triangle , 300 } Trick_OneFootManual } 
] 
SCRIPT WalkAir_Manual 
	InAirExceptions 
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
SCRIPT Manual BlendPeriod = 0.30000001192 Speed = 1.00000000000 
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
	IF GotParam Nollie 
		SetException Ex = Ollied Scr = NollieNoDisplay Params = { <...> } 
		NollieOn 
	ELSE 
		NollieOff 
		SetException Ex = Ollied Scr = Ollie Params = { <...> } 
	ENDIF 
	SetException Ex = OffMeterTop Scr = <OffMeterBottom> Params = { <...> } 
	SetException Ex = OffMeterBottom Scr = <OffMeterTop> Params = { <...> } 
	OnExceptionRun CheckForNewTrick_ManualOut 
	LaunchStateChangeEvent State = Skater_InManual 
	ClearTrickQueue 
	IF NOT GetGlobalFlag Flag = FLAG_EXPERT_MODE_NO_WALKING 
		IF NOT ( ( inNetGame ) & ( GetGlobalFlag Flag = FLAG_G_EXPERT_MODE_NO_WALKING ) ) 
			SetQueueTricks SkateToWalkTricks 
		ELSE 
			SetQueueTricks NoTricks 
		ENDIF 
	ELSE 
		SetQueueTricks NoTricks 
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
			IF ( EXPERT_MODE_NO_MANUALS = 0 ) 
				IF IsOnMotoSkateboard 
					SetManualTricks NoTricks 
				ELSE 
					SetManualTricks NoTricks Special = SpecialManualTricks 
				ENDIF 
			ELSE 
				SetManualTricks NoTricks 
			ENDIF 
		ENDIF 
	ENDIF 
	IF GotParam specialitem_details 
		TurnOnSpecialItem specialitem_details = <specialitem_details> 
	ENDIF 
	StartBalanceTrick 
	IF NOT IsNGC 
		Vibrate Actuator = 1 Percent = 25 
		OnExitRun KillManualVibration 
	ENDIF 
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
	IF GotParam stream 
		IF NOT IsStreamPlaying SFXSpecialStream 
			PlayStream <stream> vol = 200 priority = StreamPriorityHigh id = SFXSpecialStream 
		ENDIF 
	ENDIF 
	IF GotParam Friction 
		SetRollingFriction <Friction> 
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
	IF GotParam FromAir 
		IF backwards 
			FlipAndRotate 
			
			PlayAnim Anim = <FromAirAnim> BlendPeriod = 0.00000000000 Speed = <Speed> 
		ELSE 
			PlayAnim Anim = <FromAirAnim> BlendPeriod = 0.00000000000 Speed = <Speed> 
		ENDIF 
	ELSE 
		
		IF AnimEquals HandstandHandFlip_Range 
			PlayAnim Anim = HandstandHandFlip_out 
			Obj_WaitAnimFinished 
		ENDIF 
		PlayAnim Anim = <InitAnim> BlendPeriod = 0.30000001192 Speed = <Speed> 
	ENDIF 
	IF Obj_FlagSet FLAG_SKATER_MANUALCHEESE 
		IF GotParam CheckCheese 
			GetManualCheese 
			ManualCheese = ( <ManualCheese> + 1 ) 
			SetTags ManualCheese = <ManualCheese> 
			
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
	SetTrickName <Name> 
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
	IF GotParam balanceIdle 
		PlayAnim Anim = <balanceIdle> cycle BlendPeriod = <BlendPeriod> Speed = <Speed> 
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
	WaitWhilstChecking_ForPressure <...> 
ENDSCRIPT

SCRIPT SpacewalkBoost ExtraSpeedBoost = 200 
	GetSpeed 
	IF ( <Speed> < <ExtraSpeedBoost> ) 
		SetSpeed <ExtraSpeedBoost> 
	ENDIF 
	
ENDSCRIPT

SCRIPT WaitWhilstChecking_ForPressure 
	IF NOT IsNGC 
		Button = L2 
	ELSE 
		Button = L1 
	ENDIF 
	BEGIN 
		IF held <Button> 
			IF GotParam Nollie 
				Toggle_Nollie_Pressure_States Nollie 
			ELSE 
				Toggle_Nollie_Pressure_States 
			ENDIF 
			BEGIN 
				IF released <Button> 
					PressureOff 
					IF GotParam Nollie 
						NollieOn 
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
			IF GotParam Nollie 
				PressureOff 
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
	IF NOT IsNGC 
		Vibrate Actuator = 1 Percent = 25 
		OnExitRun KillManualVibration 
	ENDIF 
	IF GotParam RodneyOnly 
		IF ProfileEquals is_named = mullen 
		ELSE 
			Goto ManualLink Params = { Name = #"Truck Spin" Score = 1000 Anim = Truckstand_Init BalanceAnim = Truckstand_Range OutAnim = Truckstand_Out ExtraTricks = FlatLandBranches ExtraTricks2 = TruckstandBranches Trickslack = 0 IsExtra } 
		ENDIF 
	ENDIF 
	IF GotParam Nollie 
		NollieOn 
		SetException Ex = Ollied Scr = NollieNoDisplay 
	ELSE 
		NollieOff 
		SetException Ex = Ollied Scr = Ollie Params = { Anim = <Anim> OutAnim = <OutAnim> BoardRotate = <BoardRotate> BoardFlipAfter = <BoardFlipAfter> FlipAfter = <FlipAfter> NoBlend = <NoBlend> } 
	ENDIF 
	IF GotParam OffMeterTop 
		SetException Ex = OffMeterTop Scr = <OffMeterTop> Params = { <...> } 
		SetException Ex = OffMeterBottom Scr = <OffMeterBottom> Params = { <...> } 
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
		PlaySound foleymove01 pitch = 110 vol = 100 
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
	IF GotParam NoDisplay 
	ELSE 
		IF GotParam RotateY 
			Display AddSpin = 360 
		ELSE 
			Display Blockspin 
		ENDIF 
	ENDIF 
	IF GotParam Anim 
		IF GotParam extrapercent 
			
			WaitAnim <extrapercent> Percent 
		ENDIF 
	ENDIF 
	
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
		WaitAnim <extrapercent> Percent 
	ENDIF 
	Bailoff 
	IF GotParam Anim 
		Obj_WaitAnimFinished 
	ENDIF 
	PlayManualBalanceAnim <...> 
	WaitWhilstChecking_ForPressure <...> 
ENDSCRIPT

SCRIPT PlayManualBalanceAnim 
	IF NOT GotParam Anim 
		BlendPeriod = 0.00000000000 
	ENDIF 
	IF GotParam balanceIdle 
		PlayAnim Anim = <balanceIdle> cycle BlendPeriod = <BlendPeriod> 
	ELSE 
		PlayAnim Anim = <BalanceAnim> cycle from = middle to = middle BlendPeriod = <BlendPeriod> 
		DoNextTrick 
		Wait 1 GameFrame 
		PlayAnim Anim = <BalanceAnim> wobble BlendPeriod = 0.30000001192 
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


