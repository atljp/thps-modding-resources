WallRideExceptionTable = [
    {
        exception
        Ex = Landed
        scr = land
        params = { NoBlend IgnoreAirTime }
    }
    { exception Ex = Ollied scr = Wallie }
    { exception Ex = GroundGone scr = WallrideEnd }
    { exception Ex = PointRail scr = PointRail }
    { exception Ex = PointRailSpin scr = PointRailSpin }
    { exception Ex = SkaterCollideBail scr = SkaterCollideBail }
]

script wallride 
    OnExceptionRun
    ResetEventHandlersFromTable WallRideExceptionTable
    cancelrotatedisplay
    LaunchStateChangeEvent state = Skater_OnWall
    vibrate actuator = 1 percent = 40
    obj_clearflag FLAG_SKATER_MANUALCHEESE
    if GotParam left
        move x = 36
    else
        move x = -36
    endif
    if bailison
        setstate Air
        printf 'WallRide Bail'
        goto BailSmack params = {SmackAnim = Bail_Wall_FWD_Regular SmackFriction = 75}
    endif
    bailoff
    ClearTrickQueue
    SetQueueTricks WallRideTricks
    nollieoff
    pressureoff
    SetTrickScore 200
    playcesssound
    Skater_Playanim anim = WallRideBackTrans BlendPeriod = 0.0
    if GotParam left
        if Flipped
            BS_Wallride = 1
        endif
    else
        if NOT Flipped
            BS_Wallride = 1
        endif
    endif
    if backwards
        rotate
        flip
    endif
    if GotParam BS_Wallride
        SetTrickName 'BS Wallride'
        Skater_Playanim anim = WallRideBackTrans BlendPeriod = 0.0
    else
        SetTrickName 'FS Wallride'
        Skater_Playanim anim = WallRideFrontTrans BlendPeriod = 0.0
    endif
    if BoardIsRotated
        boardrotate normal
    endif
    begin 
    if Skater_AnimComplete
        break 
    endif
    WallrideTrail
    wait 1 frame
    repeat 
    if GotParam BS_Wallride
        Skater_Playanim anim = WallRideBackLoop BlendPeriod = 0.1000 Cycle
    else
        Skater_Playanim anim = WallRideFrontLoop BlendPeriod = 0.1000 Cycle
    endif
    display
    begin 
    tweaktrick 25
    WallrideTrail
    wait 1 frame
    DoNextTrick
    repeat 
endscript

script WallrideTrail 
    if ((IsXbox)|| (isPC))
        name = skidtrail
    else
        name = skidtrail_ps2
    endif
    texturesplat size = 6 Radius = 0 bone = Bone_Board_Tail name = <name> trail lifetime = 15
    texturesplat size = 6 Radius = 0 bone = Bone_Board_Nose name = <name> trail lifetime = 15
endscript

script WallrideEnd 
    BlendperiodOut \{ 0 }
    SetException \{ Ex = Landed scr = land }
    ClearExceptions
    if InAir
        goto \{ Airborne }
    endif
endscript

script Wallie 
    DoNextTrick
    vibrate \{ actuator = 1 percent = 50 duration = 0.1000 }
    Skater_Playanim \{ anim = ollie BlendPeriod = 0.0 }
    SetTrickName \{ "Wallie" }
    SetTrickScore \{ 250 }
    InAirExceptions
    display
    jump
    WaitAnimWhilstChecking
    goto \{Airborne params = { BlendPeriod = 0 }}
endscript
WallRideTricks = [
    {
        trigger = { PressAndRelease up x 500 }
        scr = Trick_WalliePlant
    }
    {
        trigger = { PressAndRelease left x 500 }
        scr = Trick_WallridePlant_left
    }
    {
        trigger = { PressAndRelease RIGHT x 500 }
        scr = Trick_WallridePlant_right
    }
]

script Trick_WalliePlant 
    ClearTrickQueue
    InAirExceptions
    vibrate \{ actuator = 1 percent = 50 duration = 0.1000 }
    Skater_Playanim \{ anim = Boneless BlendPeriod = 0.0 }
    SetTrickName \{ "WalliePlant" }
    SetTrickScore \{ 500 }
    display
    jump \{ BonelessHeight }
    WaitAnimWhilstChecking
    goto \{Airborne params = { BlendPeriod = 0 }}
endscript

script Trick_WallridePlant_left 
    if IsWallrideOnLeft
        goto \{ Wallie }
    endif
    Trick_WallridePlant
endscript

script Trick_WallridePlant_right 
    if NOT IsWallrideOnLeft
        goto \{ Wallie }
    endif
    Trick_WallridePlant
endscript

script Trick_WallridePlant 
    ClearTrickQueue
    InAirExceptions
    vibrate \{ actuator = 1 percent = 50 duration = 0.1000 }
    Skater_Playanim \{ anim = ollie BlendPeriod = 0.0 }
    SetTrickName \{ "WallridePlant" }
    SetTrickScore \{ 700 }
    display
    jump
    WallridePlantSidewaysBoost
    WaitAnimWhilstChecking
    goto \{Airborne params = { BlendPeriod = 0 }}
endscript
WALLPLANT_WINDOW = 280
Wallplant_Trick = [
    { PressTwoAnyOrder x down WALLPLANT_WINDOW }
    { Press x WALLPLANT_WINDOW }
]
bike_Wallplant_Trick = [
    { Press x WALLPLANT_WINDOW }
]
Post_Wallplant_No_Ollie_Window = 100
Post_Wallplant_Allow_Ollie_Window = 250
WallplantOllie = [
    {
        trigger = { tap x Post_Wallplant_Allow_Ollie_Window }
        scr = ollie
        params = { JumpSpeed = 200 }
    }
]

script Air_WallPlant 
    if IsSkaterOnBike
        goto bike_wallplant
    endif
    if IsSkaterOnVehicle
        goto vehicle_wallplant
    endif
    if GotParam StickerSlap
        name = 'Sticker Slap'
        Score = 750
        anim = Wallplant_Sticker
    else
        name = 'Wallplant'
        Score = 750
        anim = WallPlant_Ollie3
    endif
    if bailison
        setstate Air
        printf 'WallPlant Bail'
        setrollingfriction 100
        goto BailSmack params = {SmackAnim = Bail_Wall_FWD_Regular SmackFriction = 75}
    endif
    obj_clearflag FLAG_SKATER_MANUALCHEESE
    pressureoff
    nollieoff
    InAirExceptions
    ClearException Ollied
    LaunchStateChangeEvent state = Skater_InWallplant
    vibrate actuator = 1 percent = 100 duration = 0.1000
    flip
    Skater_Playanim anim = <anim> BlendPeriod = 0
    BlendperiodOut 0
    BoardRotateAfter
    SetTrickName <name>
    SetTrickScore <Score>
    display Blockspin
    SetTrickName ''
    SetTrickScore 0
    display SpinOnly
    if GotParam StickerSlap
        obj_playsound SK6_StickerSlap_01 vol = 150 pitch = randomrange (98.0, 105.0)
    endif
    GetStartTime
    begin 
    GetElapsedTime starttime = <starttime>
    if (<elapsedtime> > Post_Wallplant_No_Ollie_Window)
        break 
    endif
    DoNextTrick
    wait 1 gameframe
    repeat 
    ClearEventBuffer buttons = [ x ] olderthan = 0
    SetSkaterAirTricks AllowWallplantOllie
    SetSkaterAirTricks
    Skater_WaitAnim percent = 25
    WaitAnimWhilstChecking
    TurnOffSpecialItem
    goto Airborne
endscript

script Vert_WallPlant 
    LaunchStateChangeEvent state = Skater_InWallplant
    vibrate actuator = 1 percent = 100 duration = 0.1000
    SetTrickName ''
    SetTrickScore 0
    display Blockspin
    Skater_Playanim anim = VertPlant BlendPeriod = 0.0 Speed = 1.0
    OnExitRun TagClearFlagsScript
    SetTrickName 'Vert Wallplant'
    SetTrickScore 750
    display
    obj_spawnscriptlater SFX_Vert_Wallplant_with_wait
    GetStartTime
    begin 
    GetElapsedTime starttime = <starttime>
    if (<elapsedtime> > Post_Wallplant_No_Ollie_Window)
        break 
    endif
    DoNextTrick
    wait 1 gameframe
    repeat 
    ClearEventBuffer buttons = [ x ] olderthan = 0
    Skater_WaitAnim percent = 60
    goto Airborne
endscript

script SFX_Vert_Wallplant_with_wait 
    wait \{ 0.3000 seconds }
    obj_playsound SK6_StickerSlap_01 vol = 150 pitch = randomrange (98.0, 105.0)
endscript

script Ground_Wallpush 
    Init_Wallpush
    if crouched
        Skater_Playanim anim = WallPlant_Crouched BlendPeriod = 0
    else
        Skater_Playanim anim = WallPlant_Standing BlendPeriod = 0
    endif
    BlendperiodOut 0
    BoardRotateAfter
    FlipAfter
    SetTrickName 'Wallpush'
    SetTrickScore 10
    display Blockspin
    WaitWhilstChecking AndManuals duration = Physics_Disallow_Rewallpush_Duration
    LandSkaterTricks
    WaitAnimWhilstChecking AndManuals
    if Skater_AnimEquals WallPlant_Standing
        if crouched
            Skater_Playanim anim = idle
            DoNextTrick
            DoNextManualTrick
            wait 1 gameframe
        endif
    endif
    goto ongroundai
endscript

script Manual_CancelWallpushEvent 
    cancelwallpush
endscript
Wallpush_Trick = {
    name = "Wallpush"
    Score = 10
    NoBlend
    FlipAfter
    anim = WallPlant_NoseManual
    BalanceAnim = Manual_Range
    BalanceAnim2 = Manual_Range2
    BalanceAnim3 = Manual_Range3
    OffMeterTop = ManualBail
    OffMeterBottom = ManualLand
    ExtraTricks2 = ManualBranches
    ExtraTricks = FlatlandBranches
    AllowWallpush
}
NoseWallpush_Trick = {
    name = "Wallpush"
    Score = 10
    NoBlend
    FlipAfter
    anim = WallPlant_Manual
    BalanceAnim = NoseManual_range
    BalanceAnim2 = NoseManual_range
    Nollie
    OffMeterTop = ManualLand
    OffMeterBottom = NoseManualBail
    ExtraTricks2 = NoseManualBranches
    ExtraTricks = FlatlandBranches
    AllowWallpush
}

script Manual_Wallpush 
    getsingletag \{ in_manual_land }
    if GotParam \{ in_manual_land }
        if (<in_manual_land> = 1)
            Ground_Wallpush
            return 
        endif
    endif
    Init_Wallpush
    BlendperiodOut \{ 0 }
    if GotParam \{ ToNoseManual }
        goto \{ManualLink params = { NoseWallpush_Trick }}
    else
        goto \{ManualLink params = { Wallpush_Trick }}
    endif
endscript

script Init_Wallpush 
    broadcastevent \{ type = SkaterWallpush }
    vibrate \{ actuator = 1 percent = 50 duration = 0.1500 }
    BertSlideOff
endscript
