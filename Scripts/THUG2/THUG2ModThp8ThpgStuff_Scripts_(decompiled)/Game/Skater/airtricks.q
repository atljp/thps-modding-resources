
SpecialTricks = 
[
    {Trigger = {TripleInOrder , Up , Right , Square , 400}TrickSlot = SpAir_U_R_Square}
    {Trigger = {TripleInOrder , Up , Down , Square , 400}TrickSlot = SpAir_U_D_Square}
    {Trigger = {TripleInOrder , Up , Left , Square , 400}TrickSlot = SpAir_U_L_Square}
    {Trigger = {TripleInOrder , Right , Up , Square , 400}TrickSlot = SpAir_R_U_Square}
    {Trigger = {TripleInOrder , Right , Down , Square , 400}TrickSlot = SpAir_R_D_Square}
    {Trigger = {TripleInOrder , Right , Left , Square , 400}TrickSlot = SpAir_R_L_Square}
    {Trigger = {TripleInOrder , Down , Up , Square , 400}TrickSlot = SpAir_D_U_Square}
    {Trigger = {TripleInOrder , Down , Right , Square , 400}TrickSlot = SpAir_D_R_Square}
    {Trigger = {TripleInOrder , Down , Left , Square , 400}TrickSlot = SpAir_D_L_Square}
    {Trigger = {TripleInOrder , Left , Up , Square , 400}TrickSlot = SpAir_L_U_Square}
    {Trigger = {TripleInOrder , Left , Right , Square , 400}TrickSlot = SpAir_L_R_Square}
    {Trigger = {TripleInOrder , Left , Down , Square , 400}TrickSlot = SpAir_L_D_Square}
    {Trigger = {TripleInOrder , Up , Right , Circle , 400}TrickSlot = SpAir_U_R_Circle}
    {Trigger = {TripleInOrder , Up , Down , Circle , 400}TrickSlot = SpAir_U_D_Circle}
    {Trigger = {TripleInOrder , Up , Left , Circle , 400}TrickSlot = SpAir_U_L_Circle}
    {Trigger = {TripleInOrder , Right , Up , Circle , 400}TrickSlot = SpAir_R_U_Circle}
    {Trigger = {TripleInOrder , Right , Down , Circle , 400}TrickSlot = SpAir_R_D_Circle}
    {Trigger = {TripleInOrder , Right , Left , Circle , 400}TrickSlot = SpAir_R_L_Circle}
    {Trigger = {TripleInOrder , Down , Up , Circle , 400}TrickSlot = SpAir_D_U_Circle}
    {Trigger = {TripleInOrder , Down , Right , Circle , 400}TrickSlot = SpAir_D_R_Circle}
    {Trigger = {TripleInOrder , Down , Left , Circle , 400}TrickSlot = SpAir_D_L_Circle}
    {Trigger = {TripleInOrder , Left , Up , Circle , 400}TrickSlot = SpAir_L_U_Circle}
    {Trigger = {TripleInOrder , Left , Right , Circle , 400}TrickSlot = SpAir_L_R_Circle}
    {Trigger = {TripleInOrder , Left , Down , Circle , 400}TrickSlot = SpAir_L_D_Circle}
]
AerialFlips = 
[
    {button1 = Down button2 = Down angleX = -360 name = 'Backflip' score = 1000}
    {button1 = Up button2 = Up angleX = 360 name = 'Frontflip' score = 1000}
    {button1 = Left button2 = Left angleZ = -360 name = 'Roll' score = 1000}
    {button1 = Right button2 = Right angleZ = 360 name = 'Roll' score = 1000}
]

script display_flip_text 
    if (<name> = 'Roll')
        if (0 > <angleZ>)
            if flipped
                name = 'BS Roll'
            else
                name = 'FS Roll'
            endif
        else
            if flipped
                name = 'FS Roll'
            else
                name = 'BS Roll'
            endif
        endif
    endif
    SetTrickName <name>
    SetTrickScore <score>
    Display
endscript

GRABTWEAK_SMALL = 15
GRABTWEAK_MEDIUM = 20
GRABTWEAK_LARGE = 25
GRABTWEAK_EXTRALARGE = 40
GRABTWEAK_SPECIAL = 30
Trick_BeaverBlast = {Scr = FlipTrick Params = {name = 'Beaver Blast' UnlockFlag = TRICK_UNLOCKED_BEAVERBLAST score = 1000 Anim = BeaverBlast IsSpecial trickslack = 30 Speed = 2.0 Holdframe = 20}}
Trick_Shifty360ShovitBSShifty = {Scr = GrabTrick Params = {name = 'Shifty Shifty' Speed = 2.0 score = 2500 Anim = Shifty360ShovitBSShifty_Init ForceInit Idle = Shifty360ShovitBSShifty_Idle Idle OutAnim = Shifty360ShovitBSShifty_Out trickslack = 100 IsSpecial boardrotate}}
Trick_540varielheelfliplien = {Scr = FlipTrick Params = {name = '360 Varial Heelflip Lien' score = 3500 Anim = _540varielheelfliplien Speed = 1.300 IsSpecial boardrotate trickslack = 20 Speed = 1.200 maxspeed = 1.300}}
Trick_FSFlipOneFootTailGrab = {Scr = GrabTrick Params = {name = '360 Flip Tail Grab' score = 1750 Anim = FSFlipOneFootTailGrab_Init ForceInit InitSpeed = 1.500 Idle = FSFlipOneFootTailGrab_Idle Idle OutAnim = FSFlipOneFootTailGrab_Out IsSpecial trickslack = 10}}
Trick_BreakIn = {Scr = FlipTrick Params = {name = 'Back Spin Air' score = 3500 Anim = BreakIn_Init boardrotate trickslack = 20 RotateAfter Speed = 1.800 IsSpecial}}
Trick_BigSpinShifty = {Scr = GrabTrick Params = {name = 'BigSpin Shifty' score = 2000 Speed = 1.200 Anim = FSBigSpinShifty_Init Idle = FSBigSpinShifty_Idle OutAnim = FSBigSpinShifty_Out IsSpecial ForceInit FlipAfter}}
Trick_SambaFlip = {Scr = GrabTrick Params = {name = 'Samba Flip' score = 1850 Anim = SambaFlip Idle = Indy_Idle BackwardsAnim = Indy trickslack = 10 ForceInit IsSpecial Speed = 1.400}}
Trick_360VarialMcTwist = {Scr = FlipTrick Params = {name = '360 Varial McTwist' score = 5750 Anim = _360VarialMcTwist boardrotate IsSpecial RevertBS NoSpin trickslack = 10 RotateAfter Speed = 1.300 maxspeed = 1.100 Spinslack = 20}}
Trick_Indy900 = {Scr = FlipTrick Params = {name = 'Indy 900' score = 11000 Anim = Indy900 IsSpecial boardrotate trickslack = 20 RotateAfter NoSpin Speed = 1.300 maxspeed = 1.400}}
Trick_SitDownAir = {Scr = GrabTrick Params = {name = 'Sit Down Air' score = 1200 Anim = SitDownAir_Init Idle = SitDownAir_Idle IsSpecial WaitPercent = 80}}
Trick_GhettoBird = {Scr = FlipTrick Params = {name = '360 Ghetto Bird' score = 3500 Anim = GhettoBird2 IsSpecial boardrotate trickslack = 20 NoSpin Speed = 1.0}}
Trick_Flamingo = {Scr = GrabTrick Params = {name = 'Flamingo' score = 2000 Anim = Flamingo_Init Idle = Flamingo_Idle OutAnim = Flamingo_Out Speed = 1.200 IsSpecial}}
Trick_The900 = {Scr = FlipTrick Params = {name = 'The 900' score = 9000 Anim = The900 IsSpecial boardrotate trickslack = 20 RotateAfter NoSpin Speed = 1.300 maxspeed = 1.400}}
Trick_KFBackflip = {Scr = FlipTrick Params = {name = 'Kickflip Backflip' score = 3750 Anim = KickFlipBodyBackFlip IsSpecial Speed = 1.0 NoSpin trickslack = 15 Spinslack = 25}}
Trick_FS540 = {Scr = FlipTrick Params = {name = 'FS 540' score = 5500 Anim = FS540 boardrotate IsSpecial trickslack = 10 RevertBS RotateAfter NoSpin Speed = 0.9000 Spinslack = 40}}
Trick_McTwist = {Scr = FlipTrick Params = {name = 'McTwist' score = 5000 Anim = McTwist boardrotate IsSpecial RevertBS NoSpin trickslack = 10 RotateAfter Speed = 1.0 maxspeed = 1.100 Spinslack = 20}}
Trick_2KickMadonnaFlip = {Scr = GrabTrick Params = {name = 'Double Kickflip Madonna' score = 2250 Anim = _2KickMadonnaFlip_Init Idle = Madonna_Idle OutAnim = _2KickMadonnaFlip_Out IsSpecial ForceInit trickslack = 15 Speed = 1.150}}
Trick_AirCasperFlip = {Scr = GrabTrick Params = {name = 'Casper Flip 360 Flip' score = 2500 Anim = AirCasperFlip_Init Idle = AirCasperFlip_Idle OutAnim = AirCasperFlip_Out IsSpecial Speed = 1.100 ForceInit trickslack = 20}}
Trick_540TailWhip = {Scr = FlipTrick Params = {name = '540 TailWhip' score = 2500 Anim = _540TailWhip IsSpecial boardrotate Speed = 1.100 maxspeed = 1.200 trickslack = 15}}
Trick_Gazelle = {Scr = FlipTrick Params = {name = 'Gazelle Underflip' score = 3500 Anim = GazelleUnderflip IsSpecial boardrotate trickslack = 20 NoSpin}}
HIGHSPEED = 1.0
Trick_SemiFlip = {Scr = FlipTrick Params = {name = 'Semi Flip' score = 2500 Anim = SemiFlip boardrotate IsSpecial Speed = 1.100 trickslack = 20}}
Trick_FingerFlipAirWalk = {Scr = FlipTrick Params = {name = 'Fingerflip Airwalk' score = 2750 Anim = FingerFlipAirWalk IsSpecial boardrotate Speed = 1.0 trickslack = 30}}
Trick_1234 = {Scr = FlipTrick Params = {name = '1-2-3-4' score = 2500 Anim = _1234 IsSpecial Speed = 0.8000 trickslack = 20}}
Trick_DoubleKFindy = {Scr = FlipTrick Params = {name = 'Double Kickflip Varial Indy' score = 2500 Anim = DoubleKFVarialIndy maxspeed = 1.200 trickslack = 20 IsSpecial boardrotate Holdframe = 15}}
Trick_540Flip = {Scr = FlipTrick Params = {name = '540 Flip' score = 2250 Anim = _540flip boardrotate IsSpecial Speed = 1.100 maxspeed = 1.200 trickslack = 20}}
Trick_HardFlipBackFootFlip = {Scr = FlipTrick Params = {name = 'Hardflip Late Flip' score = 2500 Anim = HardFlipBackFootFlip IsSpecial trickslack = 15 Speed = 1.0 boardrotate}}
Trick_KickFlipUnderFlip = {Scr = FlipTrick Params = {name = 'Kickflip Underflip' score = 1750 Anim = KickFlipUnderFlip IsSpecial trickslack = 10 maxspeed = 1.300 Speed = 1.100}}
Trick_QuadrupleHeelFlip = {Scr = FlipTrick Params = {name = 'Quad Heelflip' score = 3250 Anim = QuadrupleHeelFlip IsSpecial trickslack = 10 Speed = 1.0}}
Trick_BamBendAir = {Scr = GrabTrick Params = {name = 'Bam Bend Air' Speed = 1.300 score = 1300 Anim = BamBendAir_Init Idle = BamBendAir_Idle trickslack = 100 IsSpecial}}
Trick_HeadKickBackFlip = {Scr = FlipTrick Params = {name = 'HeadKick BackFlip' score = 2550 Anim = Special_Weeman_KickHead IsSpecial trickslack = 10 Speed = 0.8000 trickslack = 18 stream = Spec_Weeman01}}
Trick_HalfCabUnderFlip = {Scr = FlipTrick Params = {name = 'HalfCab UnderFlip' score = 3500 Anim = Special_Rodney_HlfcabUndrFlip IsSpecial trickslack = 10 Speed = 0.6000 FlipAfter stream = Spec_Mullen01}}
Trick_EndlessKickflip = {Scr = GrabTrick Params = {name = 'Endless Kickflip' score = 1200 Anim = Special_Koston_EndlessFlip_Init Idle = Special_Koston_EndlessFlip_Idle OutAnim = Special_Koston_EndlessFlip_out IsSpecial stream = Spec_Koston02}}
Trick_Koston900 = {Scr = FlipTrick Params = {name = 'No Problem 900' score = 1750 Anim = Special_Koston_900 IsSpecial boardrotate trickslack = 20 RotateAfter NoSpin Speed = 1.300 maxspeed = 1.400 stream = Spec_Koston01}}
Trick_DarksideJapan = {Scr = GrabTrick Params = {name = 'Darkside Japan' score = 1200 Anim = Special_Bob_DrksldJapan_Init Idle = Special_Bob_DrksldJapan_Idle OutAnim = Special_Bob_DrksldJapan_out IsSpecial stream = Spec_Burnquist01}}
Trick_EndlessHandflip = {Scr = GrabTrick Params = {name = 'Endless Handflip' score = 1200 Anim = Special_Tony_Windmill_Init Idle = Special_Tony_Windmill_Idle OutAnim = Special_Tony_Windmill_out IsSpecial stream = Spec_Hawk01}}
Trick_DoubleFistin = {Scr = GrabTrick Params = {name = 'Double Fistin' UnlockFlag = SKATER_UNLOCKED_GRAFFITITAGGER score = 1450 Anim = Special_GrafPunk_Init Idle = Special_GrafPunk_Idle OutAnim = Special_GrafPunk_Out IsSpecial SpecialItem_details = spraycanDouble_details stream = Spec_Tagger01}}
Trick_HoagieGrab = {Scr = GrabTrick Params = {name = 'Dont Feed Phil' UnlockFlag = SKATER_UNLOCKED_PHIL score = 1800 Anim = Special_Phil_Hoagie_Init Idle = Special_Phil_Hoagie_Idle OutAnim = Special_Phil_Hoagie_Out IsSpecial SpecialItem_details = hoagie_details stream = Spec_Phil01}}
Trick_ShecklerGrab = {Scr = GrabTrick Params = {name = 'Sheckler Grab' UnlockFlag = SKATER_UNLOCKED_SHECKLER score = 2000 Anim = Special_Sheckler_Grab_Init Idle = Special_Sheckler_Grab_Idle OutAnim = Special_Sheckler_Grab_Out trickslack = 10 IsSpecial stream = Spec_Sheckler01}}
Trick_Solute = {Scr = FlipTrick Params = {name = 'Salute' UnlockFlag = SKATER_UNLOCKED_SOLDIER score = 1000 Anim = Special_Soldier_Solute IsSpecial stream = Spec_CallOfDuty01 Holdframe = 40 Speed = 1.200 trickslack = 15}}
Trick_Rotisserie = {Scr = FlipTrick Params = {name = 'Rotisserie' UnlockFlag = SKATER_UNLOCKED_SHRIMPVENDOR score = 2500 Anim = Special_Shrimp_Rotisserie IsSpecial trickslack = 10 Speed = 1.0 stream = Spec_ShrimpGuy01}}
Trick_BoardSnap = {Scr = FlipTrick Params = {name = 'Board Snap' UnlockFlag = SKATER_UNLOCKED_SHREK score = 2750 Anim = Special_Shrek_BoardSnap IsSpecial trickslack = 10 Speed = 1.0 stream = Spec_Shrek01}}
Trick_OldSkoolKickflip = {Scr = FlipTrick Params = {name = 'Old Sk00l Kickflip' score = 300 Speed = 1.200 Anim = KickFlipOldSkool FlipAfter Nollie = NollieKickflip ExtraTricks = DoubleKickflip}}
Trick_BigSpinFlip = {Scr = FlipTrick Params = {name = 'Bigspin Flip' score = 500 Anim = BigSpinFlip boardrotate FlipAfter Speed = 1.500 maxspeed = 1.500 ExtraTricks = Extra_VarialKickflip}}
Trick_FSFlip = {Scr = FlipTrick Params = {name = 'FS Flip' score = 500 Anim = FSFlip boardrotate FlipAfter maxspeed = 1.500 ExtraTricks = Extra_VarialKickflip}}
Trick_BSFlip = {Scr = FlipTrick Params = {name = 'BS Flip' score = 500 Anim = BSFlip boardrotate FlipAfter maxspeed = 1.500 ExtraTricks = Extra_VarialKickflip}}
Trick_FSBigSpin = {Scr = FlipTrick Params = {name = 'BS Bigspin' score = 500 Anim = FSBigSpin Speed = 1.200 FlipAfter maxspeed = 2 ExtraTricks = Extra540ShoveIt}}
Trick_BSBigSpin = {Scr = FlipTrick Params = {name = 'FS Bigspin' score = 500 Anim = BSBigSpin Speed = 1.400 FlipAfter maxspeed = 2 ExtraTricks = ExtraFS540ShoveIt}}
Trick_BackfootShoveIt = {Scr = FlipTrick Params = {name = 'Back Foot Shove-It' score = 150 Anim = NollieBSShoveIt Nollie = PopShoveIt ExtraTricks = Extra_360BackfootShoveIt boardrotate}}
Extra_360BackfootShoveIt = [{Trigger = {Press , Square , 300}Scr = FlipTrick Params = {name = '360 Back Foot Shove-It' boardrotate score = 500 Anim = NollieBS360ShoveIt IsExtra UseCurrent}}]
Trick_VarialKickflip = {Scr = FlipTrick Params = {name = 'Varial Kickflip' score = 300 Anim = VarialKickflip boardrotate Nollie = NollieVarialKickflip ExtraTricks = Extra_VarialKickflip}}
Extra_VarialKickflip = [{Trigger = {Press , Square , 300}Scr = FlipTrick Params = {name = '360 Flip' score = 550 boardrotate Speed = 0.9000 Anim = _360Flip Nollie = Nollie360Flip IsExtra UseCurrent}}]
Trick_VarialHeelflip = {Scr = FlipTrick Params = {name = 'Varial Heelflip' score = 300 Anim = VarialHeelflip boardrotate Nollie = NollieVarialHeelflip ExtraTricks = Extra_VarialHeelflip}}
Extra_VarialHeelflip = [{Trigger = {Press , Square , 300}Scr = FlipTrick Params = {name = '360 Heelflip' boardrotate score = 500 Anim = laserflip Speed = 1.300 trickslack = 20 IsExtra UseCurrent}}]
Trick_Hardflip = {Scr = FlipTrick Params = {name = 'Hardflip' score = 300 Anim = Hardflip boardrotate Nollie = NollieHardflip ExtraTricks = Extra_360Hardflip}}
Extra_360Hardflip = [{Trigger_Extra_Flip Params = {name = '360 Hardflip' boardrotate score = 500 Anim = _360Hardflip IsExtra trickslack = 20 Speed = 1.100 UseCurrent}}]
Trick_InwardHeelflip = {Scr = FlipTrick Params = {name = 'Inward Heelflip' score = 350 Anim = InwardHeelflip boardrotate Nollie = NollieInwardFlip trickslack = 15 ExtraTricks = Extra_360InwardHeelflip}}
Extra_360InwardHeelflip = [{Trigger_Extra_Flip Params = {name = '360 Inward Heelflip' boardrotate score = 500 Anim = _360InwardHeelFlip IsExtra trickslack = 15 Speed = 1.0 UseCurrent}}]
Trick_Impossible = {Scr = FlipTrick Params = {name = 'Impossible' score = 100 Anim = Impossible Nollie = NollieImpossible ExtraTricks = DoubleImpossible}}
DoubleImpossible = [{Trigger = {Press , Square , 300}Scr = FlipTrick Params = {name = 'Double Impossible' score = 500 Anim = DoubleImpossible ExtraTricks = TripleImpossible trickslack = 15 Speed = 1.200 IsExtra UseCurrent}}]
TripleImpossible = [{Trigger = {Press , Square , 300}Scr = FlipTrick Params = {name = 'Triple Impossible' score = 1000 Anim = TripleImpossible IsExtra UseCurrent Speed = 1.200 trickslack = 15}}]
Trick_PopShoveIt = {Scr = FlipTrick Params = {name = 'Pop Shove-It' score = 100 Anim = PopShoveItBS boardrotate Nollie = NollieBSShoveIt ExtraTricks = Extra360ShoveIt}}
Extra360ShoveIt = [{Trigger = {Press , Square , 300}Scr = FlipTrick Params = {name = '360 Shove-It' score = 500 Anim = _360ShoveIt Nollie = NollieBS360ShoveIt boardrotate ExtraTricks = Extra540ShoveIt IsExtra UseCurrent}}]
Extra540ShoveIt = [{Trigger = {Press , Square , 300}Scr = FlipTrick Params = {name = '540 Shove-It' score = 1000 Anim = _540ShoveIt IsExtra boardrotate UseCurrent}}]
Trick_FSShoveIt = {Scr = FlipTrick Params = {name = 'FS Shove-It' score = 100 Anim = PopShoveIt Nollie = NollieFSShoveIt boardrotate ExtraTricks = ExtraFS360ShoveIt}}
ExtraFS360ShoveIt = [{Trigger = {Press , Square , 300}Scr = FlipTrick Params = {name = '360 FS Shove-It' boardrotate score = 500 Anim = FS360ShoveIt Nollie = Nollie360ShoveIt ExtraTricks = ExtraFS540ShoveIt IsExtra UseCurrent}}]
ExtraFS540ShoveIt = [{Trigger = {Press , Square , 300}Scr = FlipTrick Params = {name = '540 FS Shove-It' score = 1000 Anim = FS540ShoveIt IsExtra boardrotate UseCurrent}}]
Trick_BackfootKickflip = {Scr = FlipTrick Params = {name = 'Back Foot Kickflip' score = 150 Speed = 0.9500 Anim = NollieKickflip Nollie = Kickflip ExtraTricks = Extra_DBackfootKickflip}}
Extra_DBackfootKickflip = [{Trigger = {Press , Square , 300}Scr = FlipTrick Params = {name = 'Double Back Foot Flip' score = 550 Speed = 0.9000 trickslack = 15 Anim = DoubleNollieKickflip IsExtra UseCurrent}}]
Trick_BackfootHeelflip = {Scr = FlipTrick Params = {name = 'Back Foot Heelflip' score = 150 Speed = 0.9500 Anim = NollieHeelflip Nollie = Heelflip ExtraTricks = Extra_DBackfootHeelflip}}
Extra_DBackfootHeelflip = [{Trigger = {Press , Square , 300}Scr = FlipTrick Params = {name = 'Double Back Foot Heelflip' score = 550 Speed = 0.9000 trickslack = 15 Anim = DoubleNollieHeelflip IsExtra UseCurrent}}]
Trick_Kickflip = {Scr = FlipTrick Params = {name = 'Kickflip' score = 100 Anim = Kickflip Nollie = NollieKickflip ExtraTricks = DoubleKickflip}}
DoubleKickflip = [{Trigger = {Press , Square , 300}Scr = FlipTrick Params = {name = 'Double Kickflip' score = 500 Anim = DoubleKickflip Nollie = DoubleNollieKickflip ExtraTricks = TripleKickflip IsExtra trickslack = 15 UseCurrent}}]
TripleKickflip = [{Trigger = {Press , Square , 300}Scr = FlipTrick Params = {name = 'Triple Kickflip' score = 1000 Anim = TripleKickflip IsExtra Speed = 1 UseCurrent}}]
Trick_Heelflip = {Scr = FlipTrick Params = {name = 'Heelflip' score = 100 Anim = Heelflip Nollie = NollieHeelflip ExtraTricks = DoubleHeelflip}}
DoubleHeelflip = [{Trigger = {Press , Square , 300}Scr = FlipTrick Params = {name = 'Double Heelflip' score = 500 Anim = DoubleHeelflip Nollie = DoubleNollieHeelflip ExtraTricks = TripleHeelflip trickslack = 15 IsExtra UseCurrent}}]
TripleHeelflip = [{Trigger = {Press , Square , 300}Scr = FlipTrick Params = {name = 'Triple Heelflip' score = 1000 Anim = TripleHeelflip IsExtra UseCurrent}}]
Trick_OllieAirwalk = {Scr = FlipTrick Params = {name = 'Ollie Airwalk' score = 500 Speed = 1.0 Anim = OllieAirwalk ExtraTricks = Extra_OllieAirwalk}}
Extra_OllieAirwalk = [{Trigger_Extra_Flip Params = {name = 'Ollie Airwalk Late Shove-it' score = 1050 Anim = OllieAirWalkShoveIt boardrotate Speed = 1.0 IsExtra UseCurrent}}]
Trick_OllieNorth = {Scr = FlipTrick Params = {name = 'Ollie North' score = 169 Anim = OllieNorth Speed = 1.0 trickslack = 15 ExtraTricks = Extra_OllieNorth Holdframe = 15}}
Extra_OllieNorth = [{Trigger_Extra_Flip Params = {name = 'Ollie North Back Foot Flip' score = 1050 Anim = OllieNorthBackFootFlip Speed = 1.0 IsExtra UseCurrent}}]
Trick_FFImpossible = {Scr = FlipTrick Params = {name = 'Front Foot Impossible' score = 525 Anim = FrontFootImposs trickslack = 25 Speed = 1 ExtraTricks = Extra_FFImpossible}}
Extra_FFImpossible = [{Trigger_Extra_Flip Params = {name = 'Dbl. FF Impossible' score = 1075 Anim = doublefrontfootimposs UseCurrent Speed = 0.9000 trickslack = 25 IsExtra}}]
Trick_HFVarialLien = {Scr = FlipTrick Params = {name = 'Heelflip Varial Lien' score = 800 Anim = HeelflipVarialLien boardrotate trickslack = 15}}
Trick_Fingerflip = {Scr = FlipTrick Params = {name = 'Fingerflip' score = 700 Anim = FingerFlipVert trickslack = 25 Speed = 1.100 ExtraTricks = Extra_DoubleFingerflip}}
Extra_DoubleFingerflip = [{Trigger_Extra_Flip Params = {name = 'Double Fingerflip' score = 1000 Anim = DoubleFingerFlipVert Speed = 1.100 trickslack = 25 IsExtra UseCurrent}}]
Trick_SalFlip = {Scr = FlipTrick Params = {name = 'Sal Flip' score = 900 Anim = SalFlip trickslack = 25 ExtraTricks = Extra_DoubleSalFlip Speed = 1.250}}
Extra_DoubleSalFlip = [{Trigger_Extra_Flip Params = {name = '360 Sal Flip' score = 1150 Anim = DoubleSalFlip boardrotate trickslack = 25 Speed = 1.250 UseCurrent}}]
Trick_180Varial = {Scr = FlipTrick Params = {name = '180 Varial' score = 700 Anim = _180Varial boardrotate Speed = 1.150 trickslack = 25 ExtraTricks = Trick_360Varial}}
Trick_360Varial = [{Trigger_Extra_Flip Params = {name = '360 Varial' score = 900 Anim = _360Varial Speed = 0.9000 trickslack = 25 boardrotate IsExtra UseCurrent}}]
Trick_Japan = {Scr = GrabTrick Params = {name = 'Japan' score = 350 Anim = JapanAir Idle = JapanAir_Idle ExtraTricks = Trick_OneFootJapan}}
Trick_OneFootJapan = [{Trigger_Extra_Grab Params = {name = 'One Foot Japan' score = 800 TweakTrick = GRABTWEAK_LARGE Anim = OneFootJapan Speed = 1.300 Idle = OneFootJapan_Idle WaitPercent = 70 IsExtra}}]
Trick_Crail = {Scr = GrabTrick Params = {name = 'Crail Grab' score = 350 Anim = Crail Idle = Crail_Idle ExtraTricks = Extra_TuckKnee}}
Extra_TuckKnee = [{Trigger_Extra_Grab Params = {name = 'TuckKnee' score = 400 Anim = TuckKnee IsExtra Idle = TuckKnee_Idle}}]
Trick_SaranWrap = {Scr = GrabTrick Params = {name = 'Wrap Around' score = 450 TweakTrick = GRABTWEAK_LARGE Anim = SaranWrap Idle = SaranWrap_Idle OutAnim = SaranWrap_Out ExtraTricks = Trick_BetweenTheLegs}}
Trick_BetweenTheLegs = [{Trigger_Extra_Grab Params = {name = 'Body Wrap' score = 600 TweakTrick = GRABTWEAK_LARGE Anim = BetweenTheLegs_In Idle = BetweenTheLegs_Idle OutAnim = BetweenTheLegs_Out Speed = 1.200 IsExtra}}]
Trick_Cannonball = {Scr = GrabTrick Params = {name = 'Cannonball' score = 250 TweakTrick = GRABTWEAK_SMALL Anim = Cannonball Idle = Cannonball_Idle Speed = 0.7500 ExtraTricks = Extra_CannonballFingerflip}}
Extra_CannonballFingerflip = [{Trigger_Extra_Grab Params = {name = 'Fingerflip Cannonball' score = 500 TweakTrick = GRABTWEAK_SMALL Anim = Cannonballfingerflip BackwardsAnim = Cannonball Idle = Cannonball_Idle Speed = 1.400 IsExtra}}]
Trick_Stalefish = {Scr = GrabTrick Params = {name = 'Stalefish' score = 350 Anim = Stalefish Idle = Stalefish_Idle ExtraTricks = Trick_Stalefish_Layback}}
Trick_Stalefish_Layback = [{Trigger_Extra_Grab Params = {name = 'Stalefish Tweak' score = 400 Anim = Stalefish_Layback Idle = Stalefish_Layback_Idle IsExtra}}]
Trick_Benihana = {Scr = GrabTrick Params = {name = 'Benihana' score = 300 Anim = Benihana Idle = Benihana_Idle OutAnim = Benihana_Out ExtraTricks = BenihanaFingerflip ForceInit ExtraTricks = Trick_Sacktap}}
Trick_Sacktap = [{Trigger_Extra_Grab Params = {name = 'Sacktap' score = 1500 Anim = Sacktap_Init Idle = Sacktap_Range OutAnim = Sacktap_out Speed = 1.500 ForceInit trickslack = 20 IsExtra}}]
Trick_Crossbone = {Scr = GrabTrick Params = {name = 'Crossbone' score = 425 Anim = Crossbone Idle = Crossbone_Idle ExtraTricks = Trick_CrookedCop}}
Trick_CrookedCop = [{Trigger_Extra_Grab Params = {name = 'CrookedCop' score = 550 Anim = CrookedCop Idle = CrookedCop_Idle IsExtra}}]
Trick_Airwalk = {Scr = GrabTrick Params = {name = 'Airwalk' score = 450 Anim = Airwalk Idle = Airwalk_Idle2 ExtraTricks = Trick_ChristAir}}
Trick_ChristAir = [{Trigger_Extra_Grab Params = {name = 'Christ Air' score = 550 Anim = ChristAir_Init Idle = ChristAir_Idle OutAnim = ChristAir_Out ForceInit IsExtra}}]
Trick_IndyNosebone = {Scr = GrabTrick Params = {name = 'Indy Nosebone' score = 350 Anim = Nosebone Idle = Nosebone_Idle ExtraTricks = Trick_DelMarIndy}}
Trick_DelMarIndy = [{Trigger_Extra_Grab Params = {name = 'Del Mar Indy' score = 400 Anim = IndyDelMar Idle = IndyDelMar_Idle IsExtra}}]
Trick_Tailgrab = {Scr = GrabTrick Params = {name = 'Tailgrab' score = 300 Anim = Tailgrab Idle = Tailgrab_Idle ExtraTricks = Trick_OneFootTailgrab}}
Trick_OneFootTailgrab = [{Trigger_Extra_Grab Params = {name = 'One Foot Tailgrab' score = 500 Anim = OneFootTailgrab Idle = OneFootTailgrab_Idle IsExtra}}]
Trick_Madonna = {Scr = GrabTrick Params = {name = 'Madonna' score = 750 TweakTrick = GRABTWEAK_EXTRALARGE Anim = Madonna Idle = Madonna_Idle WaitPercent = 70 ExtraTricks = Trick_Judo}}
Trick_Judo = [{Trigger_Extra_Grab Params = {name = 'Judo' score = 1150 TweakTrick = 50 Anim = JudoGrab Idle = JudoGrab_Idle Speed = 1.0 IsExtra}}]
Trick_FSShifty = {Scr = GrabTrick Params = {name = 'FS Shifty' score = 500 Anim = Shifty Idle = Shifty_Idle ExtraTricks = Extra_BSShifty}}
Extra_BSShifty = [{Trigger_Extra_Grab Params = {name = 'BS Shifty' score = 800 Anim = BSShifty Idle = BSShifty_Idle IsExtra}}]
Trick_Melon = {Scr = GrabTrick Params = {name = 'Melon' score = 300 Anim = MelonGrab Idle = MelonGrab_Idle ExtraTricks = Trick_Method}}
Trick_Method = [{Trigger_Extra_Grab Params = {name = 'Method' score = 400 Anim = Method Idle = Method_Idle Speed = 1.200 IsExtra}}]
Trick_Nosegrab = {Scr = GrabTrick Params = {name = 'Nosegrab' score = 300 Anim = Nosegrab Idle = Nosegrab_Idle ExtraTricks = Trick_Rocket}}
Trick_Rocket = [{Trigger_Extra_Grab Params = {name = 'Rocket Air' score = 400 Anim = RocketAir Idle = RocketAir_Idle IsExtra}}]
Trick_Mute = {Scr = GrabTrick Params = {name = 'Mute' score = 350 Anim = MuteGrab Idle = MuteGrab_Idle ExtraTricks = Trick_Seatbelt}}
Trick_Seatbelt = [{Trigger_Extra_Grab Params = {name = 'Seatbelt Air' score = 500 Anim = Seatbelt Idle = SeatBelt_Idle Speed = 0.6000 IsExtra}}]
Trick_Indy = {Scr = GrabTrick Params = {name = 'Indy' score = 300 Anim = Indy Idle = Indy_Idle ExtraTricks = Trick_Stiffy}}
Trick_Stiffy = [{Trigger_Extra_Grab Params = {name = 'Stiffy' score = 500 Anim = Stiffy Idle = Stiffy_Idle Speed = 1.250 ForceInit IsExtra}}]
Trick_BarrelRoll = {Scr = FlipTrick Params = {name = 'Barrel Roll' score = 800 Anim = BarrelRoll NoSpin trickslack = 10 boardrotate Speed = 1.0 maxspeed = 1.100 Spinslack = 10}}
ScavengerF = {Scr = FlipTrick Params = {name = '\c4Object Placed!\c0' score = 0 Anim = Heelflip SH_Drop}}
FireballF = {Scr = FlipTrick Params = {name = '\c4Fire!\c0' score = 100 Anim = Heelflip Skew_Angle = 0.0 Fireball ExtraTricks = DoubleFireballF}}
DoubleFireballF = [{Trigger = {Press , Square , 300}Scr = FlipTrick Params = {name = '\c4Double Fire!\c0' score = 500 Anim = DoubleHeelflip Skew_Angle = -5.0 Fireball ExtraTricks = TripleFireballF IsExtra trickslack = 15 UseCurrent}}]
TripleFireballF = [{Trigger = {Press , Square , 300}Scr = FlipTrick Params = {name = '\c4Triple Fire!\c0' score = 1000 Anim = TripleHeelflip Skew_Angle = 5.0 Fireball ExtraTricks = QuadFireballF IsExtra UseCurrent}}]
QuadFireballF = [{Trigger = {Press , Square , 300}Scr = FlipTrick Params = {name = '\c4Quad Fire!\c0' score = 2000 Anim = QuadrupleHeelFlip Skew_Angle = 10.0 Fireball IsExtra Speed = 1 UseCurrent}}]
FireballB = {Scr = FlipTrick Params = {name = '\c4Reverse Fire!\c0' score = 100 Anim = Heelflip Skew_Angle = 180.0 vel_scale = 0.5000 Fireball ExtraTricks = DoubleFireballB}}
DoubleFireballB = [{Trigger = {Press , Square , 300}Scr = FlipTrick Params = {name = '\c4Double Reverse Fire!\c0' score = 500 Skew_Angle = 185.0 vel_scale = 0.5000 Fireball Anim = DoubleHeelflip ExtraTricks = TripleFireballB IsExtra UseCurrent}}]
TripleFireballB = [{Trigger = {Press , Square , 300}Scr = FlipTrick Params = {name = '\c4Triple Reverse Fire!\c0' score = 1000 Skew_Angle = 175.0 vel_scale = 0.5000 Fireball Anim = TripleHeelflip ExtraTricks = QuadFireballB IsExtra UseCurrent}}]
QuadFireballB = [{Trigger = {Press , Square , 300}Scr = FlipTrick Params = {name = '\c4Quad Reverse Fire!\c0' score = 2000 Skew_Angle = 190.0 vel_scale = 0.5000 Fireball Anim = QuadrupleHeelFlip IsExtra UseCurrent}}]
Trick_Revert = { Scr = Revert }
AirTricks = 
[
    {Trigger = {TripleInOrder , a = Triangle , b = Triangle , Triangle , 500}Scr = ForceBail}
    {Trigger = {TripleInOrder , a = Left , b = Left , Square , 300}TrickSlot = Air_L_L_Square}
    {Trigger = {TripleInOrder , a = Right , b = Right , Square , 300}TrickSlot = Air_R_R_Square}
    {Trigger = {TripleInOrder , a = Up , b = Up , Square , 300}TrickSlot = Air_U_U_Square}
    {Trigger = {TripleInOrder , a = Down , b = Down , Square , 300}TrickSlot = Air_D_D_Square}
    {Trigger = {AirTrickLogic , Square , UpLeft , 500}TrickSlot = Air_SquareUL}
    {Trigger = {AirTrickLogic , Square , UpRight , 500}TrickSlot = Air_SquareUR}
    {Trigger = {AirTrickLogic , Square , DownLeft , 500}TrickSlot = Air_SquareDL}
    {Trigger = {AirTrickLogic , Square , DownRight , 500}TrickSlot = Air_SquareDR}
    {Trigger = {AirTrickLogic , Square , Up , 500}TrickSlot = Air_SquareU}
    {Trigger = {AirTrickLogic , Square , Down , 500}TrickSlot = Air_SquareD}
    {Trigger = {AirTrickLogic , Square , Left , 500}TrickSlot = Air_SquareL}
    {Trigger = {AirTrickLogic , Square , Right , 500}TrickSlot = Air_SquareR}
    {Trigger = {TripleInOrder , a = Left , b = Left , Circle , 300}TrickSlot = Air_L_L_Circle}
    {Trigger = {TripleInOrder , a = Right , b = Right , Circle , 300}TrickSlot = Air_R_R_Circle}
    {Trigger = {TripleInOrder , a = Up , b = Up , Circle , 300}TrickSlot = Air_U_U_Circle}
    {Trigger = {TripleInOrder , a = Down , b = Down , Circle , 300}TrickSlot = Air_D_D_Circle}
    {Trigger = {AirTrickLogic , Circle , UpLeft , 500}TrickSlot = Air_CircleUL}
    {Trigger = {AirTrickLogic , Circle , UpRight , 500}TrickSlot = Air_CircleUR}
    {Trigger = {AirTrickLogic , Circle , DownLeft , 500}TrickSlot = Air_CircleDL}
    {Trigger = {AirTrickLogic , Circle , DownRight , 500}TrickSlot = Air_CircleDR}
    {Trigger = {AirTrickLogic , Circle , Up , 500}TrickSlot = Air_CircleU}
    {Trigger = {AirTrickLogic , Circle , Down , 500}TrickSlot = Air_CircleD}
    {Trigger = {AirTrickLogic , Circle , Right , 500}TrickSlot = Air_CircleR}
    {Trigger = {AirTrickLogic , Circle , Left , 500}TrickSlot = Air_CircleL}
]
SkateToWalkTricks = [
    { SwitchControl_Trigger Scr = CheckforSwitchVehicles }
]
Trigger_Extra_Grab_Tweak = {Trigger = {ExtraGrabTrickLogic , Circle , 300}Scr = GrabTrick}
Trigger_Extra_Grab = {Trigger = {Press , Circle , 300}Scr = GrabTrick}
Trigger_Extra_Flip = {Trigger = {Press , Square , 300}Scr = FlipTrick}
KickflipExtras = 
[{Trigger = {Press , Square , 300}Scr = FlipTrick Params = {name = 'Double Kickflip' score = 500 Anim = DoubleKickflip ExtraTricks = TripleKickflip Speed = 1 IsExtra UseCurrent}}
    {Trigger = {Press , Circle , 300}Scr = FlipGrabBlend Params = {name = 'Kickflip to Indy' score = 400 Anim1 = KickFlipBlendFS Anim2 = Indy IsExtra}}
    {Trigger = {AirTrickLogic , Circle , Up , 300}Scr = FlipGrabBlend Params = {name = 'Kickflip to Crail' score = 400 Anim1 = KickFlipBlendFS Anim2 = Crail IsExtra GrabStart = 5 Speed = 1}}
]
BenihanaFingerflip = 
[{Trigger = {AirTrickLogic , Square , Up , 500}Scr = FlipTrick Params = {name = 'Beni Fingerflip' score = 1000 Anim = BenihanaFingerflip IsExtra}}]
COOL_SPECIAL_TRICKS = 0

script FlipTrick Speed = 1.0 trickslack = 10 grindslack = 25 flip_stat_mod = 1.0
    if GotParam Fireball
        if GameModeEquals is_firefight
            if HasPowerup Fireball
                LaunchFireball Skew_Angle = <Skew_Angle> vel_scale = <vel_scale>
            endif
        endif
    else
        if GotParam SH_Drop
            if GameModeEquals is_scavenger_hunt
                Vibrate Actuator = 1 Percent = 80 Duration = 0.2500
                ClientDropSHObject
            endif
        endif
    endif
    TurnOffSpecialItem
    LaunchStateChangeEvent State = Skater_InAir
    LaunchSubStateEntryEvent SubState = Flip
    OnExitRun ExitFlipTrick
    if GotParam FullScreenEffect
        <FullScreenEffect>
        OnExitRun ExitFliptrick_FullScreenEffect
    endif
    GetScriptedStat Skater_Flip_Speed_Stat
    Speed = (<Speed> * <stat_value>)
    if GotParam maxspeed
        if (<Speed> > <maxspeed>)
            <Speed> = <maxspeed>
        endif
    else
        if (<Speed> > 1.300)
            Speed = 1.300
        endif
    endif
    ClearTricksFrom Jumptricks Jumptricks0 Jumptricks
    if GotParam FromGroundGone
        SetEventHandler Ex = Ollied Scr = TrickOllie
    else
        ClearException Ollied
    endif
    KillExtraTricks
    BailOn
    if InPressure
        PressureOff
        SetSkaterAirTricks
    endif
    if GotParam NoSpin
        NoSpin
    endif
    if GotParam RevertFS
        Obj_SetFlag FLAG_SKATER_REVERTFS
    endif
    if GotParam RevertBS
        Obj_SetFlag FLAG_SKATER_REVERTBS
    endif
    GetAnimLength Anim = <Anim>
    if InNollie
        if GotParam Nollie
            if GotParam IsExtra
                PlayAnim Anim = <Nollie> From = Current BlendPeriod = 0.2000 Speed = <Speed>
            else
                PlayAnim Anim = <Nollie> BlendPeriod = 0.2000 Speed = <Speed>
            endif
            GetAnimLength Anim = <Nollie>
        else
            if GotParam IsExtra
                PlayAnim Anim = <Anim> From = Current BlendPeriod = 0.2000 Speed = <Speed>
            else
                PlayAnim Anim = <Anim> BlendPeriod = 0.2000 Speed = <Speed>
            endif
        endif
    else
        if GotParam UseCurrent
            printf 'USING THE CURRENT FRAME'
            PlayAnim Anim = <Anim> From = Current BlendPeriod = 0.2000 Speed = <Speed>
        else
            PlayAnim Anim = <Anim> BlendPeriod = 0.2000 Speed = <Speed>
        endif
    endif
    if GotParam Projectile
        printf 'Shooting projectile'
        GetAmmo
        SetAmmo (<ammo> - 1)
        if ((<ammo> -1)= 0)
            text = 'You\'re out of ammo!'
            SpawnSound SK6_SFX_OutOfAmmoBuzzer
            BroadcastEvent type = SkaterOutOfAmmo
            create_console_message text = <text> rgba = [ 122 45 7 100 ] wait_and_die = 1 time = 3
        endif
    endif
    if NOT GotParam Holdframe
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
    endif
    if GotParam ExtraTricks
        SetExtraTricks tricks = <ExtraTricks> Duration = 14
    endif
    if GotParam FromGroundGone
        WaitFramesLateOllie Frames = 15
        ClearException Ollied
        if NOT (<Frames> = 0)
            Wait <Frames> Frames
        endif
    else
        Wait 15 Frames
    endif
    NollieOff
    SetTrickName <name>
    SetTrickScore <score>
    Display
    if GotParam IsExtra
        LaunchExtraMessage
    endif
    if GotParam IsSpecial
        LaunchSpecialMessage Cool
        BroadcastEvent type = SkaterEnterSpecialTrick
    endif
    if GotParam BloodFrame
        Wait <BloodFrame> Frames
        if GotParam GutsSound
            Playsound Random (@ hitblood01 @ hitblood02 @ hitblood03)
        else
            Obj_PlaySound Random (@ BailSlap01 @ BailSlap02 @ BailSlap03)
        endif
        Bloodsplat
        Obj_SpawnScript BloodJackAss
        Wait 1 frame
        Playsound BailSlap02
    endif
    if GotParam Spinslack
        if (<length> > <Spinslack>)
            WaitAnim <Spinslack> Frames fromend
            Canspin
        endif
    endif
    if GotParam Holdframe
        HoldAbleFlipTrick <...> 
    endif
    if GotParam grindslack
        if (<length> * 60 > <grindslack>)
            WaitAnim <grindslack> Frames fromend
        endif
    endif
    Bailoff
    if (<length> * 60 > <trickslack>)
        WaitAnim <trickslack> Frames fromend
    else
        WaitAnim 10 Frames fromend
    endif
    if GotParam IsSpecial
        EndSpecial
    endif
    Canspin
    DoNextTrick
    WaitAnimWhilstChecking
    goto Airborne
endscript


script HoldAbleFlipTrick 
    WaitAnim <Holdframe> Frames fromend
    begin 
    if Released Circle
        if Released Square
            break 
        endif
    endif
    PlayAnim Anim = <Anim> From = Current To = Current BlendPeriod = 0.0
    WaitOneGameFrame
    TweakTrick GRABTWEAK_MEDIUM
    repeat 
    PlayAnim Anim = <Anim> From = Current
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
    LaunchSubStateExitEvent SubState = Flip
    CleanUp_SpecialTrickParticles
endscript


script ExitFliptrick_FullScreenEffect 
    Exit_FullscreenEffect
    ExitFlipTrick
endscript


script GrabTrick Speed = 1.0 x = -180 Duration = 1.0 GrabTweak = GRABTWEAK_MEDIUM WaitPercent = 60 button = Circle
    ClearTricksFrom Jumptricks Jumptricks0 Jumptricks
    KillExtraTricks
    ClearExtraGrindTrick
    TurnOffSpecialItem
    if GotParam FromGroundGone
        SetEventHandler Ex = Ollied Scr = TrickOllie
    else
        ClearException Ollied
    endif
    BailOn
    LaunchStateChangeEvent State = Skater_InAir
    LaunchSubStateEntryEvent SubState = Grab
    OnExitRun ExitGrabTrick
    if GotParam FullScreenEffect
        <FullScreenEffect>
        OnExitRun ExitGrab_FullScreenEffect
    endif
    if GotParam SpecialSounds
        Obj_SpawnScript <SpecialSounds>
    endif
    if GotParam ExtraTricks
        SetExtraTricks tricks = <ExtraTricks> Duration = 15
    endif
    if GotParam SpecialItem_details
        TurnOnSpecialItem SpecialItem_details = <SpecialItem_details>
    endif
    if GotParam IsExtra
        PlayAnim Anim = <Anim> BlendPeriod = 0.3000 From = Current To = end Speed = <Speed>
    else
        PlayAnim Anim = <Anim> BlendPeriod = 0.3000 Speed = <Speed>
    endif
    if GotParam JumpJets
        Obj_KillSpawnedScript name = JumpJets
        Obj_SpawnScript JumpJets
    endif
    if GotParam stream
        if NOT IsStreamPlaying SFXSpecialStream
            PlayStream <stream> vol = 200 priority = StreamPriorityHigh id = SFXSpecialStream
        endif
    endif
    if GotParam BloodFrame
        Wait <BloodFrame> Frames
        if GotParam GutsSound
            Playsound Random (@ hitblood01 @ hitblood02 @ hitblood03)
        else
            Obj_PlaySound Random (@ BailSlap01 @ BailSlap02 @ BailSlap03)
        endif
        Bloodsplat
        Obj_SpawnScript BloodJackAss
        Wait 1 frame
        Playsound BailSlap02
    endif
    if GotParam FromGroundGone
        WaitFramesLateOllie Frames = 15
        ClearException Ollied
    endif
    WaitAnim 50 Percent
    SetTrickName <name>
    SetTrickScore <score>
    Display
    if GotParam IsSpecial
        LaunchSpecialMessage Cool
        BroadcastEvent type = SkaterEnterSpecialTrick
    endif
    if GotParam IsExtra
        LaunchExtraMessage
    endif
    if GotParam ForceInit
        Obj_WaitAnimFinished
    else
        WaitAnim <WaitPercent> Percent
    endif
    if NOT Held Circle
        if Held Square
            button = Square
        endif
    endif
    begin 
    if Released <button>
        break 
    endif
    if AnimFinished
        PlayAnim Anim = <Idle> cycle Speed = <Speed>
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
        TweakTrick GRABTWEAK_SPECIAL
    else
        TweakTrick <GrabTweak>
    endif
    repeat 
    if GotParam boardrotate
        BlendperiodOut 0
        BoardRotateAfter
    endif
    if GotParam trickslack
        WaitAnim <trickslack> Frames fromend
    endif
    Bailoff
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
    goto Airborne
endscript


script ExitGrabTrick 
    LaunchSubStateExitEvent SubState = Grab
    CleanUp_SpecialTrickParticles
endscript


script ExitGrab_FullScreenEffect 
    Exit_FullscreenEffect
    ExitGrabTrick
endscript


script IfReleased_SquareOrCircle 
    if GotParam OutAnim
        Obj_PlayAnim Anim = <OutAnim> BlendPeriod = 0.2000 Speed = <Speed>
    else
        if GotParam BackwardsAnim
            Obj_PlayAnim Anim = <BackwardsAnim> Backwards BlendPeriod = 0.2000 Speed = <Speed>
        else
            if AnimEquals Airwalk
                Obj_PlayAnim Anim = <Anim> From = Current To = 0 BlendPeriod = 0.2000 Speed = <Speed>
            else
                Obj_PlayAnim Anim = <Anim> Backwards BlendPeriod = 0.2000 Speed = <Speed>
            endif
        endif
    endif
endscript


script JumpJets 
    Obj_GetID
    if NOT Obj_FlagSet FLAG_SKATER_JUMPJETSON
        if NOT InNetGame
            if NOT GameModeEquals Is_SingleSession
                begin 
                Skater ::Jump
                Wait 1 game frame
                repeat 2
                Obj_SpawnScript JumpJetTracker Params = { <...>  }
            endif
        endif
    endif
endscript


script JumpJetTracker 
    Obj_SetFlag FLAG_SKATER_JUMPJETSON
    Wait 2 seconds
    Obj_ClearFlag FLAG_SKATER_JUMPJETSON
endscript


script _ReplayJumpJets 
    SpawnSkaterScript ReplayJumpJets
endscript


script ReplayJumpJets 
    Obj_GetID
endscript

