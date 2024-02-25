
TRICK_PRELOAD_TIME = 160
Jumptricks0 = 
[{Trigger = {PressAndRelease , Up , X , 300}Scr = NoComply Params = {Name = 'No Comply' Score = 100}}]
Jumptricks = 
[{Trigger = {TapTwiceRelease , Up , X , 500}TrickSlot = JumpSlot}]
Trick_Boneless = {Scr = Boneless Params = {Name = 'Boneless' Anim = Boneless Score = 250}}
Trick_Fastplant = {Scr = Boneless Params = {Name = 'Fastplant' Anim = Fastplant Score = 250}}
Trick_Beanplant = {Scr = Boneless Params = {Name = 'Beanplant' Anim = Beanplant Score = 250}}
GroundTricks = 
[
    {Trigger = {TripleInOrder , a = L1 , b = Up , Up , 500}Scr = AggroKick}
    {Trigger = {TripleInOrder , a = Triangle , b = Triangle , Triangle , 500}Scr = ForceBail}
    {Trigger = {TripleInOrder , a = Down , b = Down , R1 , 500}Scr = ToggleSwitchRegular Params = { PowerSlide }}
    {Trigger = {PressAndRelease , Up , X , 300}Scr = NoComply Params = {Name = 'No Comply' Score = 100}}
    {Trigger = {TripleInOrder , a = L1 , b = L1 , Triangle , 500}Scr = Props Params = { string_id = props_string }}
    {Trigger = {TripleInOrder , a = L1 , b = L1 , Square , 500}Scr = Taunt Params = {Anim = Taunt1 string_id = your_daddy_string}}
    {Trigger = {TripleInOrder , a = L1 , b = L1 , Circle , 500}Scr = Taunt Params = {Anim = Taunt2 string_id = no_way_string}}
    {Trigger = {TripleInOrder , a = L1 , b = L1 , X , 500}Scr = Taunt Params = {Anim = Taunt3 string_id = get_some_string}}
    {Trigger = {Press , L2 , 20}Scr = ToggleNollieRegular NGC_Trigger = {TripleInOrderSloppy , a = left , b = right , R1 , 400}}
    {Trigger = {Release , L2 , 20}Scr = ToggleNollieRegular NGC_Trigger = {TripleInOrderSloppy , a = Up , b = Up , R1 , 400}Params = { Nollie = 1 }}
    {Trigger = {Press , R2 , 20}Scr = ToggleSwitchRegular NGC_Trigger = {Press , R1 , 20}}
]
WalkToSkateTransition_GroundTricks = 
[
    {Trigger = {PressAndRelease , Up , X , 300}Scr = NoComply Params = {Name = 'No Comply' Score = 100}}
]
NoTricks = 
[ 
 ]
Reverts = 
[
    {Trigger = {Press , R2 , 200}TrickSlot = ExtraSlot1 NGC_Trigger = {Press , R1 , 200}}
    {Trigger = {Press , L2 , 200}TrickSlot = ExtraSlot2 NGC_Trigger = {Press , L1 , 200}}
]

script SetExtraTricks_Reverts duration = 20
    if NOT GetGlobalFlag flag = FLAG_EXPERT_MODE_NO_REVERTS
        if NOT ((inNetGame)& (GetGlobalFlag flag = FLAG_G_EXPERT_MODE_NO_REVERTS))
            SetExtraTricks tricks = Reverts duration = <duration>
        endif
    endif
endscript


script Revert FSName = 'FS Revert' BSName = 'BS Revert' FSAnim = RevertFS BSAnim = RevertBS
    if IsSkaterOnVehicle
        Goto vehicle_revert
    endif
    if IsOnMotoSkateboard
        FSAnim = RevertFS
        BSAnim = RevertBS
    endif
    OnExitRun ExitRevert
    InRevert
    ClearLipCombos
    KillExtraTricks
    SetTrickScore 100
    OnGroundExceptions NoEndRun
    LaunchStateChangeEvent State = Skater_InRevert
    if NOT GetGlobalFlag flag = CHEAT_HOVERBOARD
        Obj_SpawnScript CessTrail Params = { repeat_times = 10 }
        PlayCessSound
        Vibrate Actuator = 0 Percent = 80 duration = 0.5000
        Vibrate Actuator = 1 Percent = 80 duration = 0.1000
    endif
    ClearException Ollied
    SetSpecialFriction [0 , 0 , 5 , 10 , 15 , 25] duration = 0.6670
    CanKickOff
    SetQueueTricks SkateToWalkTricks
    SetSkaterAirManualTricks
    NollieOff
    PressureOff
    if Obj_FlagSet FLAG_SKATER_REVERTFS
        Obj_ClearFlag FLAG_SKATER_REVERTFS
        PlayAnim Anim = <FSAnim>
        SetTrickName <FSName>
    else
        if Obj_FlagSet FLAG_SKATER_REVERTBS
            Obj_ClearFlag FLAG_SKATER_REVERTBS
            PlayAnim Anim = <BSAnim>
            SetTrickName <BSName>
        else
            if LastSpinWas Frontside
                PlayAnim Anim = <FSAnim>
                SetTrickName <FSName>
            else
                PlayAnim Anim = <BSAnim>
                SetTrickName <BSName>
            endif
        endif
    endif
    Display Blockspin
    if NOT IsOnMotoSkateboard
        FlipAfter
        BoardRotateAfter
    endif
    BlendPeriodOut 0.0
    Wait 0.1000 seconds
    SetException Ex = Ollied Scr = Ollie
    ResetLandedFromVert
    Obj_WaitAnimFinished
    CanKickOn
    DoNextManualTrick FromAir
    DoNextTrick
    OnGroundExceptions
    LandSkaterTricks
    ClearEventBuffer
    PlayAnim Anim = CrouchIdle BlendPeriod = 0.3000
    WaitAnimWhilstChecking AndManuals
    Goto OnGroundAI
endscript


script ExitRevert 
    OutRevert
    CanKickOn
    SetTrickName ''
    SetTrickScore 0
    Display Blockspin
endscript


script ToggleSwitchRegular 
    if IsOnMotoSkateboard
        Goto OnGroundAI
    endif
    OnGroundExceptions
    SetQueueTricks NoTricks
    ClearTrickQueues
    GetSpeed
    start_speed = <speed>
    if NOT GoalManager_GoalShouldExpire
        SetException Ex = Ollied Scr = Ollie Params = { NoDoNextTrick }
    endif
    PressureOff
    NollieOff
    if NOT GetGlobalFlag flag = CHEAT_HOVERBOARD
        Obj_SpawnScript CessTrail Params = { delay = 3 }
        Vibrate Actuator = 0 Percent = 80 duration = 0.5000
        Vibrate Actuator = 1 Percent = 80 duration = 0.1000
    endif
    LandSkaterTricks DontKillFocus
    if GotParam PowerSlide
        Rotate y = 180 duration = 0.3000 seconds
        if LeftPressed
            if Flipped
                slide_anim = FSPowerslide
            else
                slide_anim = BSPowerslide
            endif
        else
            if RightPressed
                if Flipped
                    slide_anim = BSPowerslide
                else
                    slide_anim = FSPowerslide
                endif
            else
                slide_anim = FSPowerslide
            endif
        endif
    else
        if LeftPressed
            if Flipped
                if NOT crouched
                    slide_anim = Random (@ CessSlide180_FS @ CessSlide180_FS2)
                endif
            else
                backside = 1
                if NOT crouched
                    slide_anim = CessSlide180_BS
                endif
            endif
        else
            if RightPressed
                if Flipped
                    backside = 1
                    if NOT crouched
                        slide_anim = CessSlide180_BS
                    endif
                else
                    if NOT crouched
                        slide_anim = Random (@ CessSlide180_FS @ CessSlide180_FS2)
                    endif
                endif
            else
                if NOT crouched
                    slide_anim = Random (@ CessSlide180_FS @ CessSlide180_FS2)
                endif
            endif
        endif
    endif
    if NOT GotParam slide_anim
        if GotParam backside
            init = bs_powerslide_init
            idle = bs_powerslide_idle
            out = bs_powerslide_out
            out2 = bs_powerslide_180_out
        else
            init = fs_powerslide_init
            idle = fs_powerslide_idle
            out = fs_powerslide_out
            out2 = fs_powerslide_180_out
        endif
    endif
    if GotParam PowerSlide
        PlayAnim Anim = <slide_anim>
    else
        if NOT crouched
            PlayAnim Anim = <slide_anim>
        else
            PlayAnim Anim = <init>
            LockVelocityDirection On
            EnterPowerslide
            OnExitRun UnLockVelocityDirection
            count = 0
            if NOT (<start_speed> < 100)
                begin 
                button_held = 0
                if isNGC
                    if Held R1
                        button_held = 1
                    endif
                else
                    if Held R2
                        button_held = 1
                    endif
                endif
                if (<button_held> = 1)
                    Wait 1 frame
                    GetSpeed
                    if AnimFinished
                        SetRollingFriction 25
                        PlayAnim Anim = <idle> cycle
                    endif
                    if NOT (<speed> = 0)
                        CessTrail repeat_times = 1
                    endif
                    if (<speed> < 100)
                        break 
                    endif
                    count = (<count> + 1)
                else
                    break 
                endif
                repeat 
            endif
            ExitPowerslide
            Obj_StopSound RevertConc
            Obj_StopSound RevertConc
            if (<count> > 15)
                PlayAnim Anim = <out> blend = 0.1000
                Obj_WaitAnimFinished
                Goto OnGroundAI
            else
                UnLockVelocityDirection
                PlayAnim Anim = <out2>
            endif
        endif
    endif
    WaitAnim 30 Percent
    if NOT GetGlobalFlag flag = CHEAT_HOVERBOARD
        PlayCessSound
    endif
    WaitAnim 35 Percent
    SetSkaterGroundTricks
    FlipAfter
    BoardRotateAfter
    BlendPeriodOut 0.0
    WaitAnimWhilstChecking AndManuals
    if NOT GotParam PowerSlide
        if CanKick
            PlayAnim Anim = PushCycle cycle BlendPeriod = 0.0
        else
            if AnimFinished
                if NOT crouched
                    PlayAnim Anim = idle cycle BlendPeriod = 0.0
                else
                    if NOT AnimEquals [ CrouchCessSlide180_FS CrouchCessSlide180_BS ]
                        PlayAnim Anim = CrouchIdle cycle BlendPeriod = 0.2000
                    else
                        PlayAnim Anim = CrouchIdle cycle BlendPeriod = 0.0
                    endif
                endif
            endif
        endif
    else
        PlayAnim Anim = CrouchIdle cycle BlendPeriod = 0.0
    endif
    ClearTrickQueue
    Goto OnGroundAI
endscript


script UnLockVelocityDirection 
    LockVelocityDirection off
    ExitPowerslide
    SetRollingFriction default
endscript


script CessTrail repeat_times = 20
    if SpeedGreaterThan 200
        if GotParam delay
            Wait <delay> frames
        endif
        begin 
        if NOT onground
            break 
        else
            if IsXbox
                TextureSplat size = 6 radius = 0 bone = Bone_Board_Tail Name = skidtrail trail lifetime = 15
                TextureSplat size = 6 radius = 0 bone = Bone_Board_Nose Name = skidtrail trail lifetime = 15
            else
                TextureSplat size = 6 radius = 0 bone = Bone_Board_Tail Name = skidtrail_ps2 trail lifetime = 15
                TextureSplat size = 6 radius = 0 bone = Bone_Board_Nose Name = skidtrail_ps2 trail lifetime = 15
            endif
        endif
        Wait 1 game frame
        repeat <repeat_times>
    endif
endscript


script ToggleNollieRegular 
    OnGroundExceptions
    ClearTrickQueues
    ApplyStanceToggle Nollie = <Nollie>
    if NOT InNollie
        if NOT InPressure
            if NOT GoalManager_GoalShouldExpire
                SetException Ex = Ollied Scr = Ollie
            endif
            if crouched
                PlayAnim Anim = CrouchToNollie BlendPeriod = 0.1000 Backwards
            else
                PlayAnim Anim = SkatingToNollie BlendPeriod = 0.1000 Backwards
            endif
        else
            if NOT GoalManager_GoalShouldExpire
                SetException Ex = Ollied Scr = Ollie
            endif
            if crouched
                PlayAnim Anim = CrouchToPressure BlendPeriod = 0.1000
            else
                PlayAnim Anim = SkateToPressure BlendPeriod = 0.1000
            endif
        endif
    else
        if NOT GoalManager_GoalShouldExpire
            SetException Ex = Ollied Scr = Nollie
        endif
        if crouched
            PlayAnim Anim = CrouchToNollie BlendPeriod = 0.1000
        else
            PlayAnim Anim = SkatingToNollie BlendPeriod = 0.1000
        endif
    endif
    WaitAnimWhilstChecking AndManuals
    if InNollie
        Goto OnGroundNollieAI
    else
        Goto OnGroundAI
    endif
endscript


script ApplyStanceToggle 
    if isNGC
        if GotParam Nollie
            if InNollie
                NollieOff
                PressureOff
            else
                NollieOn
                PressureOff
            endif
        else
            if InPressure
                PressureOff
                NollieOff
            else
                PressureOn
                NollieOff
            endif
        endif
    else
        if InNollie
            if GotParam Nollie
                PressureOff
                NollieOff
            endif
        else
            if GotParam Nollie
                PressureOff
                NollieOn
            else
                NollieOff
                PressureOn
            endif
        endif
    endif
    if onground
        if CurrentScorePotGreaterThan 0
            LandSkaterTricks
        endif
    endif
endscript


script Nollie 
    if GotParam NoDoNextTrick
    else
        DoNextTrick
    endif
    ClearTrickQueue
    ClearEventBuffer Buttons = Dpad OlderThan = TRICK_PRELOAD_TIME
    Jump
    InAirExceptions
    Vibrate Actuator = 1 Percent = 50 duration = 0.05000
    NollieOn
    PlayAnim Anim = Nollie BlendPeriod = 0.1000
    if ProfileEquals stance = regular
        if Flipped
            SetTrickName 'Nollie'
            SetTrickScore 200
        else
            SetTrickName 'Fakie Ollie'
            SetTrickScore 200
        endif
    else
        if Flipped
            SetTrickName 'Fakie Ollie'
            SetTrickScore 200
        else
            SetTrickName 'Nollie'
            SetTrickScore 200
        endif
    endif
    Display
    BailOff
    WaitAnimWhilstChecking
    Goto Airborne
endscript


script NollieNoDisplay OutSpeed = 1
    StopBalanceTrick
    ClearTrickQueue
    ClearEventBuffer Buttons = Dpad OlderThan = TRICK_PRELOAD_TIME
    SetTrickName 'Nollie'
    SetTrickScore 100
    Display Deferred
    Jump
    InAirExceptions
    Vibrate Actuator = 1 Percent = 80 duration = 0.05000
    NollieOn
    if GotParam OutAnim
        PlayAnim Anim = <OutAnim> BlendPeriod = 0.3000 speed = <OutSpeed>
    else
        PlayAnim Anim = Nollie BlendPeriod = 0.1000
    endif
    if GotParam BoardRotate
        BlendPeriodOut 0
        BoardRotateAfter
    endif
    BailOff
    WaitAnimWhilstChecking
    Goto Airborne
endscript

Dpad = [Up Down left right Upright UpLeft DownRight DownLeft]

script Ollie OutSpeed = 1
    StopBalanceTrick
    StopSkitch
    if GotParam NoDoNextTrick
    else
        DoNextTrick
    endif
    ClearTrickQueue
    ClearEventBuffer Buttons = Dpad OlderThan = TRICK_PRELOAD_TIME
    ClearEventBuffer Buttons = [ X ] OlderThan = 0
    if NOT GotParam JumpSpeed
        Jump
    else
        Jump speed = <JumpSpeed>
    endif
    InAirExceptions
    if InPressure
        SetTrickName 'Pressure'
        SetTrickScore 200
        Display
    endif
    if InNollie
        if ProfileEquals stance = regular
            if Flipped
                SetTrickName 'Nollie'
                SetTrickScore 200
            else
                SetTrickName 'Fakie Ollie'
                SetTrickScore 200
            endif
        else
            if Flipped
                SetTrickName 'Fakie Ollie'
                SetTrickScore 200
            else
                SetTrickName 'Nollie'
                SetTrickScore 200
            endif
        endif
        Display
    else
        SetTrickName 'Ollie'
        SetTrickScore 75
        Display Deferred
    endif
    Vibrate Actuator = 1 Percent = 50 duration = 0.05000
    if GotParam FromLip
        printf 'came from lip=================='
        PlayAnim Anim = <OutAnim> BlendPeriod = 0.0
        BlendPeriodOut 0
    else
        if GotParam OutAnim
            if GotParam SyncOutAnimToPreviousAnim
                PlayAnim Anim = <OutAnim> BlendPeriod = 0.3000 speed = <OutSpeed> SyncToPreviousAnim
            else
                if GotParam NoBlend
                    PlayAnim Anim = <OutAnim> BlendPeriod = 0.0 speed = <OutSpeed>
                else
                    PlayAnim Anim = <OutAnim> BlendPeriod = 0.3000 speed = <OutSpeed>
                endif
            endif
        else
            if InNollie
                PlayAnim Anim = Nollie BlendPeriod = 0.1000
            else
                PlayAnim Anim = Ollie BlendPeriod = 0.0 NoRestart
            endif
        endif
    endif
    if GotParam BoardRotate
        BlendPeriodOut 0
        BoardRotateAfter
    endif
    if GotParam RotateAfter
        RotateAfter
    endif
    if GotParam FlipAfter
        printf '=========flipping the skater in Ollie'
        FlipAfter
    endif
    if GotParam NoBlend
        BlendPeriodOut 0
    endif
    if GotParam WaitOnOlliePercent
        BailOn
        WaitAnim <WaitOnOlliePercent> Percent
    endif
    BailOff
    WaitAnimWhilstChecking
    Goto Airborne
endscript


script NoComply 
    ClearTrickQueue
    ClearEventBuffer Buttons = Dpad OlderThan = TRICK_PRELOAD_TIME
    Jump
    NollieOff
    PressureOff
    InAirExceptions
    Vibrate Actuator = 1 Percent = 80 duration = 0.05000
    SetTrickName <Name>
    SetTrickScore <Score>
    Display
    BailOff
    PlayAnim Anim = NoComply BlendPeriod = 0.2000
    WaitAnimWhilstChecking
    Goto Airborne
endscript


script Beanplant 
    ClearTrickQueue
    ClearEventBuffer Buttons = Dpad OlderThan = TRICK_PRELOAD_TIME
    Jump BonelessHeight
    InAirExceptions
    Vibrate Actuator = 1 Percent = 80 duration = 0.1000
    PlaySound boneless09 pitch = 85
    SetTrickName <Name>
    SetTrickScore <Score>
    Display
    PlayAnim Anim = Beanplant BlendPeriod = 0.2000
    WaitAnimWhilstChecking
    Goto Airborne
endscript


script Fastplant 
    ClearTrickQueue
    ClearEventBuffer Buttons = Dpad OlderThan = TRICK_PRELOAD_TIME
    Jump BonelessHeight
    InAirExceptions
    Vibrate Actuator = 1 Percent = 80 duration = 0.1000
    SetTrickName <Name>
    SetTrickScore <Score>
    Display
    PlayAnim Anim = Fastplant BlendPeriod = 0.2000
    BailOff
    WaitAnimWhilstChecking
    Goto Airborne
endscript


script Boneless Anim = Boneless Name = 'Boneless' Score = 250
    ClearTrickQueue
    ClearEventBuffer Buttons = Dpad OlderThan = TRICK_PRELOAD_TIME
    Jump BonelessHeight
    NollieOff
    PressureOff
    InAirExceptions
    Vibrate Actuator = 1 Percent = 80 duration = 0.1000
    PlaySound boneless09 pitch = 85
    SetTrickName <Name>
    SetTrickScore <Score>
    if NOT SkaterIsNamed vallely
        PlayAnim Anim = <Anim> BlendPeriod = 0.2000
    else
        PlayAnim Anim = _540Boneless BlendPeriod = 0.1000 speed = 1.250 from = 10
        SetTrickScore 300
        SetTrickName 'MikeV Boneless'
        FlipAfter
    endif
    Display
    BailOff
    WaitAnimWhilstChecking
    Goto Airborne
endscript


script SendTauntMessage 
    GetPreferenceString pref_type = Taunt <string_id>
    SendChatMessage string = <ui_string>
endscript


script Taunt 
    LandSkaterTricks
    ClearException Ollied
    PlayAnim Anim = <Anim> BlendPeriod = 0.3000
    GetPreferenceString pref_type = Taunt <string_id>
    if inNetGame
        SendChatMessage string = <ui_string>
    endif
    Wait 10 game frame
    OnGroundExceptions
    if SpeedLessThan 1
        SetRollingFriction 100
        WaitAnimWhilstChecking AndManuals
        Goto Handbrake
    else
        WaitAnimWhilstChecking AndManuals
        Goto OnGroundAI
    endif
endscript


script Props 
    LandSkaterTricks
    OnGroundExceptions
    PlayAnim Random (@ Anim = Prop @ Anim = Cheer1) BlendPeriod = 0.3000
    GetPreferenceString pref_type = Taunt <string_id>
    if inNetGame
        SendChatMessage string = <ui_string>
    endif
    if SpeedLessThan 1
        SetRollingFriction 100
        WaitAnimWhilstChecking AndManuals
        Goto Handbrake
    else
        WaitAnimWhilstChecking AndManuals
        Goto OnGroundAI
    endif
endscript

SkitchExceptionTable = [
    {Event Ex = MadeOtherSkaterBail Scr = MadeOtherSkaterBail_Called}
    {Exception Ex = OffMeterTop Scr = SkitchOut}
    {Exception Ex = OffMeterBottom Scr = SkitchOut}
    {Exception Ex = CarBail Scr = CarBail}
    {Exception Ex = SkaterCollideBail Scr = SkaterCollideBail}
]

script Skitch 
    StopBalanceTrick
    ResetLandedFromVert
    KillExtraTricks
    if CancelRotateDisplayandUpdateMatrix
        change flip_backwards_dont_blend = 1
    endif
    OnExceptionRun
    ResetEventHandlersFromTable SkitchExceptionTable
    SetException Ex = Ollied Scr = Ollie Params = { <...>  }
    LaunchStateChangeEvent State = Skater_Skitching
    ClearTrickQueue
    SetQueueTricks NoTricks
    ClearManualTrick
    SetManualTricks NoTricks
    StartSkitch
    StartBalanceTrick
    PlayAnim Anim = SkitchInit
    Obj_WaitAnimFinished
    change flip_backwards_dont_blend = 0
    PlaySound Hud_jumpgap
    SetTrickName '\c2Skitchin\C0'
    SetTrickScore 500
    Display Blockspin
    DoBalanceTrick ButtonA = right ButtonB = left Type = Skitch Tweak = 5
    PlayAnim Anim = SkitchRange wobble
    SetEventHandler Ex = SkitchLeft Scr = SkitchAnimLeft
    SetEventHandler Ex = SkitchRight Scr = SkitchAnimRight
    begin 
    overridelimits max = 1750 friction = 0 time = 5 gravity = 0
    if AnimFinished
        PlayAnim Anim = SkitchRange wobble NoRestart
    endif
    if Held Down
        Obj_SpawnScript NoBrake_Timer
        Goto SkitchOut
    endif
    Waitonegameframe
    repeat 
endscript


script SkitchAnimLeft 
    PlayAnim Anim = SkitchMoveLeft from = 20 NoRestart speed = 2 BlendPeriod = 0.1000
endscript


script SkitchAnimRight 
    PlayAnim Anim = SkitchMoveRight from = 20 NoRestart speed = 2 BlendPeriod = 0.1000
endscript


script SkitchOut 
    StopSkitch
    StopBalanceTrick
    PlayAnim Anim = SkitchInit Backwards
    OnGroundExceptions
    ClearException Skitched
    LandSkaterTricks
    Obj_WaitAnimFinished
    Goto OnGroundAI
endscript


script NoBrake_Timer 
    CanBrakeOff
    Wait 0.5000 seconds
    CanBrakeOn
endscript


script AggroKick 
    skater ::GetSpeed
    SetSpeed (<speed> + 9000)
    PlayAnim Anim = PushIdle duration = 2
    Obj_WaitAnimFinished
    skater ::GetSpeed
    FormatText textname = text 'AggroKick!\n\c4Speed: %a\n\n\n' a = <speed>
    create_console_message text = <text> rgba = [ 122 45 7 100 ] wait_and_die = 1 time = 3
    Goto OnGroundAI
endscript


script ForceBail 
    SwitchOffBoard
    InBail
    SplatFriction = 800
    VibrateOff
    ClearPanel_Bailed
    ClearExceptions
    if InAir
        PlayAnim Anim = RunOut_Drop_Idle duration = 2 BlendPeriod = 0.3000
        if NOT onground
            Wait 0.2000 seconds
        endif
        if NOT onground
            PlayAnim Anim = RunOut_Drop_Idle duration = 2 BlendPeriod = 0.3000
            Wait 0.2000 seconds
        endif
    else
        ScreenShake = 60
        ShakeCamera {
            duration = 0.5000
            vert_amp = 9.0
            horiz_amp = 7.0
            vert_vel = 10.27
            horiz_vel = 5.920
        }
        PlayAnim Anim = Bail_RunOut_New_A duration = 2 BlendPeriod = 0.3000
    endif
    SetRollingFriction 0
    ClearExceptions
    NotifyBailDone
    SetRollingFriction default
    ClearTrickQueue
    ClearEventBuffer
    ClearManualTrick
    ClearGapTricks
    KillExtraTricks
    WaitOnGround
    RunOut_Drop_Land_Med
endscript

