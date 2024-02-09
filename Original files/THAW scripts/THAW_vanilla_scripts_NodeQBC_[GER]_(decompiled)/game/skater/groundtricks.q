TRICK_PRELOAD_TIME = 160
Jumptricks0 = [
    {
        trigger = { PressAndRelease up x 300 }
        scr = NoComply
        params = { name = "No Comply" Score = 100 }
    }
]
Jumptricks = [
    {
        trigger = { TapTwiceRelease up x 500 }
        trickslot = JumpSlot
    }
]
Trick_Boneless = {
    scr = Boneless
    params = { name = "Boneless" anim = Boneless Score = 250 }
}
Trick_Fastplant = {
    scr = Boneless
    params = { name = "Fastplant" anim = Fastplant Score = 250 }
}
Trick_Beanplant = {
    scr = Boneless
    params = { name = "Beanplant" anim = Beanplant Score = 250 }
}
GroundTricks = [
    {
        trigger = {
            TripleInOrder
            a = down
            b = down
            r1
            500
        }
        scr = ToggleSwitchRegular
        params = { powerslide }
    }
    {
        trigger = { PressAndRelease up x 300 }
        scr = NoComply
        params = { name = "No Comply" Score = 100 }
    }
    {
        trigger = { Press l2 20 }
        scr = ToggleNollieRegular
        xbox_trigger = { Press white 20 }
        NGC_Trigger = { InOrder rightdown rightdown 400 }
    }
    {
        trigger = { release l2 20 }
        scr = ToggleNollieRegular
        xbox_trigger = { release white 20 }
        NGC_Trigger = { InOrder rightup rightup 400 }
        params = { Nollie = 1 }
    }
    {
        trigger = { Press r1 500 }
        scr = EnterBertStance
        xbox_trigger = { Press l1 500 }
        NGC_Trigger = { Press l1 500 }
    }
    {
        trigger = { Press r2 20 }
        scr = ToggleSwitchRegular
        xbox_trigger = { Press r1 20 }
        NGC_Trigger = { Press r1 20 }
    }
]
BertSlideLeftTricks = [
    {
        trigger = { Press l1 500 }
        scr = BertSlide540
        params = {}
        xbox_trigger = { Press r1 500 }
        NGC_Trigger = { Press r1 500 }
    }
]
BertSlideRightTricks = [
    {
        trigger = { Press l1 500 }
        scr = BertSlide540
        params = {}
        xbox_trigger = { Press r1 500 }
        NGC_Trigger = { Press r1 500 }
    }
]
WalkToSkateTransition_GroundTricks = [
    {
        trigger = { PressAndRelease up x 300 }
        scr = NoComply
        params = { name = "No Comply" Score = 100 }
    }
]
NoTricks = [
]
Reverts = [
    {
        trigger = { Press r2 200 }
        trickslot = ExtraSlot1
        NGC_Trigger = { Press r1 200 }
        xbox_trigger = { Press r1 200 }
    }
    {
        trigger = { Press l2 200 }
        trickslot = ExtraSlot2
        PC_Trigger = {}
    }
    {
        trigger = { PressTwoAnyOrder left r1 500 }
        scr = EnterBertStance
        NGC_Trigger = { PressTwoAnyOrder left l1 500 }
        xbox_trigger = { PressTwoAnyOrder left l1 500 }
    }
    {
        trigger = { PressTwoAnyOrder RIGHT r1 500 }
        scr = EnterBertStance
        NGC_Trigger = { PressTwoAnyOrder RIGHT l1 500 }
        xbox_trigger = { PressTwoAnyOrder RIGHT l1 500 }
    }
]

script SetExtraTricks_Reverts \{ duration = 20 }
    if NOT IsSkaterOnBike
        if AbilityEnabled \{ revert }
            if NOT GetGlobalFlag \{ flag = FLAG_EXPERT_MODE_NO_REVERTS }
                if NOT ((InNetGame)& (GetGlobalFlag flag = flag_g_expert_mode_no_reverts))
                    SetExtraTricks tricks = Reverts duration = <duration>
                endif
            endif
        endif
    endif
endscript
RevertBertTricks = [
    {
        trigger = { PressTwoAnyOrder left r1 500 }
        scr = EnterBertStance
    }
    {
        trigger = { PressTwoAnyOrder RIGHT r1 500 }
        scr = EnterBertStance
    }
]

script revert FSName = 'FS Revert' BSName = 'BS Revert' FSAnim = RevertFS BSAnim = RevertBS Score = 100
    if IsSkaterOnVehicle
        goto vehicle_revert
    endif
    if NOT WasLastLandingVert
        FSName = 'FS Pivot'
        BSName = 'BS Pivot'
        FSAnim = GTurn
        BSAnim = GTurn
    endif
    OnExitRun ExitRevert
    InRevert
    ClearLipCombos
    KillExtraTricks
    SetTrickScore <Score>
    OnGroundExceptions NoEndRun
    LaunchStateChangeEvent state = Skater_InRevert
    if NOT GetGlobalFlag flag = CHEAT_HOVERBOARD
        obj_spawnscriptlater CessTrail params = { repeat_times = 10 }
        playcesssound
        vibrate actuator = 0 percent = 80 duration = 0.5000
        vibrate actuator = 1 percent = 80 duration = 0.1000
    endif
    ClearException Ollied
    if NOT GotParam no_special_friction
        setspecialfriction [0 , 0 , 5 , 10 , 15 , 25] duration = 0.6670
    endif
    cankickoff
    ClearTrickQueue
    SetQueueTricks SkateToWalkTricks
    if NOT WasLastLandingVert
        SetSkaterAirManualTricks NoNose
    else
        SetSkaterAirManualTricks
    endif
    SetExtraTricks tricks = RevertBertTricks
    nollieoff
    pressureoff
    if obj_flagset FLAG_SKATER_REVERTFS
        obj_clearflag FLAG_SKATER_REVERTFS
        Skater_Playanim anim = <FSAnim>
        SetTrickName <FSName>
    else
        if obj_flagset FLAG_SKATER_REVERTBS
            obj_clearflag FLAG_SKATER_REVERTBS
            Skater_Playanim anim = <BSAnim>
            SetTrickName <BSName>
        else
            if lastspinwas Frontside
                Skater_Playanim anim = <FSAnim>
                SetTrickName <FSName>
            else
                Skater_Playanim anim = <BSAnim>
                SetTrickName <BSName>
            endif
        endif
    endif
    display Blockspin
    if NOT IsOnMotoSkateboard
        FlipAfter
        BoardRotateAfter
    endif
    wait 0.1000 seconds
    SetException Ex = Ollied scr = ollie
    resetlandedfromvert
    Skater_WaitAnimFinished
    cankickon
    DoNextManualTrick FromAir FromRevert
    DoNextTrick
    OnGroundExceptions
    LandSkaterTricks
    ClearEventBuffer
    Skater_Playanim anim = CrouchIdle BlendPeriod = 0.3000
    WaitAnimWhilstChecking AndManuals
    goto ongroundai
endscript

script ExitRevert 
    OutRevert
    cankickon
    SetTrickName \{ "" }
    SetTrickScore \{ 0 }
    display \{ Blockspin }
endscript

script ToggleSwitchRegular 
    if IsOnMotoSkateboard
        goto ongroundai
    endif
    if IsSkaterOnBike
        return 
    endif
    if IsSkaterOnVehicle
        return 
    endif
    OnGroundExceptions
    SetQueueTricks NoTricks
    ClearTrickQueues
    getspeed
    start_speed = <Speed>
    if NOT GoalManager_GoalShouldExpire
        SetException Ex = Ollied scr = ollie params = { NoDoNextTrick }
    endif
    pressureoff
    nollieoff
    if NOT GetGlobalFlag flag = CHEAT_HOVERBOARD
        obj_spawnscriptlater CessTrail params = { delay = 3 }
        vibrate actuator = 0 percent = 80 duration = 0.5000
        vibrate actuator = 1 percent = 80 duration = 0.1000
    endif
    LandSkaterTricks DontKillFocus
    if GotParam powerslide
        norailtricks
        rotate y = 180 duration = 0.3000 seconds
        if leftpressed
            if Flipped
                slide_anim = FSPowerslide
            else
                slide_anim = BSPowerslide
            endif
        else
            if rightpressed
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
        if leftpressed
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
            if rightpressed
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
            init = BS_PowerSlide_Init
            idle = BS_PowerSlide_Idle
            out = BS_PowerSlide_Out
            out2 = BS_PowerSlide_180_Out
        else
            init = FS_PowerSlide_Init
            idle = FS_PowerSlide_Idle
            out = FS_PowerSlide_Out
            out2 = FS_PowerSlide_180_Out
        endif
    endif
    if GotParam powerslide
        Skater_Playanim anim = <slide_anim>
    else
        if NOT crouched
            Skater_Playanim anim = <slide_anim>
        else
            Skater_Playanim anim = <init>
            lockvelocitydirection on
            EnterPowerslide
            OnExitRun UnLockVelocityDirection
            count = 0
            if NOT (<start_speed> < 100)
                if IsPs2
                    is_ps2_or_xenon = 1
                else
                    if IsXenon
                        is_ps2_or_xenon = 1
                    endif
                endif
                begin 
                button_held = 0
                if NOT GotParam is_ps2_or_xenon
                    if Held r1
                        button_held = 1
                    endif
                else
                    if Held r2
                        button_held = 1
                    endif
                endif
                if (<button_held> = 1)
                    wait 1 frame
                    getspeed
                    if Skater_AnimComplete
                        setrollingfriction 25
                        Skater_Playanim anim = <idle> Cycle
                    endif
                    if NOT (<Speed> = 0)
                        CessTrail repeat_times = 1
                    endif
                    if (<Speed> < 100)
                        break 
                    endif
                    count = (<count> + 1)
                else
                    break 
                endif
                repeat 
            endif
            ExitPowerslide
            obj_stopsound RevertConc
            obj_stopsound RevertConc
            if (<count> > 15)
                Skater_Playanim anim = <out> Blend = 0.1000
                Skater_WaitAnimFinished
                goto ongroundai
            else
                UnLockVelocityDirection
                Skater_Playanim anim = <out2>
            endif
        endif
    endif
    Skater_WaitAnim percent = 30
    if NOT GetGlobalFlag flag = CHEAT_HOVERBOARD
        playcesssound
    endif
    Skater_WaitAnim percent = 35
    SetSkaterGroundTricks
    FlipAfter
    BoardRotateAfter
    BlendperiodOut 0.0
    WaitAnimWhilstChecking AndManuals
    if NOT GotParam powerslide
        if cankick
            Skater_Playanim anim = PushCycle Cycle BlendPeriod = 0.0
        else
            if Skater_AnimComplete
                if NOT crouched
                    Skater_Playanim anim = idle Cycle BlendPeriod = 0.0
                else
                    if NOT Skater_AnimEquals [ CrouchCessSlide180_FS CrouchCessSlide180_BS ]
                        Skater_Playanim anim = CrouchIdleFromIdle norestart BlendPeriod = 0
                    else
                        Skater_Playanim anim = CrouchIdle Cycle BlendPeriod = 0.0
                    endif
                endif
            endif
        endif
    else
        Skater_Playanim anim = CrouchIdle Cycle BlendPeriod = 0.0
    endif
    ClearTrickQueue
    goto ongroundai
endscript

script EnterBertStance 
    if OnGround
        if AbilityEnabled bertslide
            OnGroundExceptions NoEndRun
            ClearException FlailHitWall
            ClearException FlailLeft
            ClearException FlailRight
            ClearException WallPush
            SetQueueTricks NoTricks
            ClearTrickQueues
            KillExtraTricks
            stopbalancetrick
            setspecialfriction [0 , 0 , 5 , 10 , 15 , 25] duration = 0.6670
            Skater_Playanim anim = Bert540_Middle Cycle norestart
            goto BertStanceState
        else
            goto ongroundai
        endif
    else
        goto Airborne
    endif
endscript

script BertStanceState 
    count = 0
    scored = 0
    last_bert_rot = 0
    dir_changes = 0
    dir_mult = 0.3000
    if NOT GotParam new_bert
        new_bert = 1
    endif
    OnExitRun bert_slide_off
    BertSlideOn
    GetSpecialFrictionIndex
    if WasLastLandingVert
        <special_friction_index> = (5 * <special_friction_index>)
    endif
    if IsPs2
        is_ps2_or_xenon = 1
    else
        if IsXenon
            is_ps2_or_xenon = 1
        endif
    endif
    begin 
    DoNextTrick
    DoNextManualTrick
    CessTrail repeat_times = 1
    if NOT GotParam is_ps2_or_xenon
        if NOT Held l1
            break 
        endif
    else
        if NOT Held r1
            break 
        endif
    endif
    if NOT InBertSlide
        count = (<count> + 1)
        if (<count> > 10)
            break 
        endif
    endif
    getspeed
    if (<Speed> < 100)
        break 
    endif
    GetBertRot
    if ((<last_bert_rot> > 0)& (<bert_rot> < 0))
        dir_changes = (<dir_changes> + 1)
    else
        if ((<last_bert_rot> < 0)& (<bert_rot> > 0))
            dir_changes = (<dir_changes> + 1)
        endif
    endif
    if ((<bert_rot> > 0)|| (<bert_rot> = 0 & <new_bert> = 0))
        vibrate actuator = 1 percent = ((50 * <bert_rot>)+ 50)
        setrollingfriction ((-0.5000 + -0.5000 * <bert_rot>)+ (<bert_total_spin> / 180)+ (<dir_changes> * <dir_mult>)+ <special_friction_index>)
        scriptresult = 0
        new_bert = 0
        if Flipped
            init = Crouch2BertRight
            anim = BertRightIdle
            idle = Bert540_GroundedR_Idle
            out = BertRight2Crouch
            if Skater_AnimEquals [ BertRightIdle Bert540_GroundedR_Idle ]
                <scriptresult> = 1
            endif
        else
            init = Crouch2BertLeft
            anim = BertLeftIdle
            idle = Bert540_GroundedL_Idle
            out = BertLeft2Crouch
            if Skater_AnimEquals [ BertLeftIdle Bert540_GroundedL_Idle ]
                <scriptresult> = 1
            endif
        endif
        if NOT (<scriptresult> = 1)
            if Flipped
                name = 'FS Bert Slide'
                if NOT ((GetGlobalFlag flag = FLAG_EXPERT_MODE_NO_MANUALS)|| (GetGlobalFlag flag = flag_g_expert_mode_no_manuals))
                    SetQueueTricks BertSlideRightTricks manualtricks
                else
                    SetQueueTricks BertSlideRightTricks
                endif
            else
                name = 'BS Bert Slide'
                if NOT ((GetGlobalFlag flag = FLAG_EXPERT_MODE_NO_MANUALS)|| (GetGlobalFlag flag = flag_g_expert_mode_no_manuals))
                    SetQueueTricks BertSlideLeftTricks manualtricks
                else
                    SetQueueTricks BertSlideLeftTricks
                endif
            endif
            if (<scored> = 0)
                if NOT Skater_AnimEquals <init>
                    scored = 1
                    SetTrickName <name>
                    SetTrickScore 600
                    display Blockspin
                endif
            endif
            Skater_Playanim anim = <init> norestart
        endif
        if Skater_AnimEquals <init>
            if Skater_AnimComplete
                Skater_Playanim anim = <anim> Cycle norestart
            endif
        endif
    else
        if (<bert_rot> < 0)
            vibrate actuator = 0 percent = (-100 * <bert_rot>)
            setrollingfriction ((-0.5000 + 0.5000 * <bert_rot>)+ (<bert_total_spin> / 180)+ (<dir_changes> * <dir_mult>)+ <special_friction_index>)
            <scriptresult> = 0
            new_bert = 0
            if Flipped
                init = Crouch2BertLeft
                anim = BertLeftIdle
                idle = Bert540_GroundedL_Idle
                out = BertLeft2Crouch
                if Skater_AnimEquals [ BertLeftIdle Bert540_GroundedL_Idle ]
                    <scriptresult> = 1
                endif
            else
                init = Crouch2BertRight
                anim = BertRightIdle
                idle = Bert540_GroundedR_Idle
                out = BertRight2Crouch
                if Skater_AnimEquals [ BertRightIdle Bert540_GroundedR_Idle ]
                    <scriptresult> = 1
                endif
            endif
            if NOT (<scriptresult> = 1)
                if Flipped
                    name = 'BS Bert Slide'
                    if NOT ((GetGlobalFlag flag = FLAG_EXPERT_MODE_NO_MANUALS)|| (GetGlobalFlag flag = flag_g_expert_mode_no_manuals))
                        SetQueueTricks BertSlideLeftTricks manualtricks
                    else
                        SetQueueTricks BertSlideLeftTricks
                    endif
                else
                    name = 'FS Bert Slide'
                    if NOT ((GetGlobalFlag flag = FLAG_EXPERT_MODE_NO_MANUALS)|| (GetGlobalFlag flag = flag_g_expert_mode_no_manuals))
                        SetQueueTricks BertSlideRightTricks manualtricks
                    else
                        SetQueueTricks BertSlideRightTricks
                    endif
                endif
                if (<scored> = 0)
                    if NOT Skater_AnimEquals <init>
                        scored = 1
                        SetTrickName <name>
                        SetTrickScore 600
                        display Blockspin
                    endif
                endif
                Skater_Playanim anim = <init> norestart
            endif
            if Skater_AnimEquals <init>
                if Skater_AnimComplete
                    Skater_Playanim anim = <anim> Cycle norestart
                endif
            endif
        else
            vibrate actuator = 0 percent = 0
            vibrate actuator = 1 percent = 0
            setrollingfriction default
            SetQueueTricks NoTricks
            Skater_Playanim anim = Bert540_Middle Cycle norestart
        endif
    endif
    last_bert_rot = <bert_rot>
    wait 1 gameframe
    repeat 
    BertSlideFinish out = <out>
endscript

script BertSlideFinish 
    BertSlideOff
    ClearTrickQueues
    if GotParam \{ out }
        Skater_Playanim anim = <out>
        Skater_WaitAnimFinished
    endif
    vibrate \{ actuator = 0 percent = 0 }
    vibrate \{ actuator = 1 percent = 0 }
    LandSkaterTricks
    goto \{ ongroundai }
endscript

script bert_slide_off 
    BertSlideOff
    vibrate \{ actuator = 0 percent = 0 }
    vibrate \{ actuator = 1 percent = 0 }
endscript

script BertSlide540 
    ClearTrickQueues
    OnExitRun bert_slide_off
    BertSlideOn
    if Skater_AnimEquals [ BertRightIdle Crouch2BertRight Bert540_GroundedR_Idle ]
        RIGHT = RIGHT
    else
        left = left
    endif
    if GotParam RIGHT
        name = 'FS Bert 180'
        anim = Bert540Right_Idle
        idle = BertLeftIdle
        percent_180 = 10
    else
        name = 'BS Bert 180'
        anim = Bert540Left_Idle
        idle = BertRightIdle
        percent_180 = 30
    endif
    EnterBert540
    setrollingfriction 5
    new_bert = 0
    Skater_Playanim anim = <anim>
    Skater_WaitAnim percent = <percent_180>
    getspeed
    if (<Speed> < 100)
        exit = 1
        finish = 1
    endif
    if NOT Held l1
        exit = 1
    endif
    if GotParam exit
        flip
        BoardRotateAfter
        SetTrickName <name>
        SetTrickScore 1000
        display
        Skater_Playanim anim = <idle> Cycle BlendPeriod = 0.3000 norestart
        ExitBert540
        if GotParam finish
            BertSlideFinish
            return 
        endif
        GotoPreserveParams BertStanceState
    endif
    if GotParam RIGHT
        name = 'FS Bert 360'
        idle = Bert540_GroundedR_Idle
        percent_360 = 60
    else
        name = 'BS Bert 360'
        idle = BertLeftIdle
        percent_360 = 50
    endif
    Skater_WaitAnim percent = <percent_360>
    if (<Speed> < 100)
        exit = 1
        finish = 1
    endif
    if NOT Held l1
        exit = 1
    endif
    if GotParam exit
        SetTrickName <name>
        SetTrickScore 2000
        display
        Skater_Playanim anim = <idle> Cycle BlendPeriod = 0.1000 norestart
        ExitBert540
        if GotParam finish
            BertSlideFinish
            return 
        endif
        GotoPreserveParams BertStanceState
    endif
    if GotParam RIGHT
        name = 'FS Bert 540'
        idle = BertLeftIdle
    else
        name = 'BS Bert 540'
        idle = BertRightIdle
    endif
    begin 
    if Skater_AnimComplete
        break 
    endif
    CessTrail repeat_times = 1
    wait 1 gameframe
    repeat 
    SetTrickName <name>
    SetTrickScore 3000
    display
    flip
    BoardRotateAfter
    Skater_Playanim anim = <idle> Cycle BlendPeriod = 0.3000 norestart
    ExitBert540
    GotoPreserveParams BertStanceState
endscript

script UnLockVelocityDirection 
    lockvelocitydirection \{ Off }
    ExitPowerslide
    setrollingfriction \{ default }
endscript

script CessTrail repeat_times = 20
    if speedgreaterthan 200
        if GotParam delay
            wait <delay> frames
        endif
        begin 
        if NOT OnGround
            break 
        else
            if ((IsXbox)|| (isPC))
                texturesplat size = 6 Radius = 0 bone = Bone_Board_Tail name = skidtrail trail lifetime = 15
                texturesplat size = 6 Radius = 0 bone = Bone_Board_Nose name = skidtrail trail lifetime = 15
            else
                texturesplat size = 6 Radius = 0 bone = Bone_Board_Tail name = skidtrail_ps2 trail lifetime = 15
                texturesplat size = 6 Radius = 0 bone = Bone_Board_Nose name = skidtrail_ps2 trail lifetime = 15
            endif
        endif
        wait 1 Game frame
        repeat <repeat_times>
    endif
endscript

script ToggleNollieRegular 
    OnGroundExceptions
    ClearTrickQueues
    ApplyStanceToggle Nollie = <Nollie>
    if NOT innollie
        if NOT inpressure
            if NOT GoalManager_GoalShouldExpire
                SetException Ex = Ollied scr = ollie
            endif
            if crouched
                Skater_Playanim anim = CrouchToNollie BlendPeriod = 0.1000 backwards
            else
                Skater_Playanim anim = SkatingToNollie BlendPeriod = 0.1000 backwards
            endif
        else
            if NOT GoalManager_GoalShouldExpire
                SetException Ex = Ollied scr = ollie
            endif
            if crouched
                Skater_Playanim anim = CrouchToPressure BlendPeriod = 0.1000
            else
                Skater_Playanim anim = SkateToPressure BlendPeriod = 0.1000
            endif
        endif
    else
        if NOT GoalManager_GoalShouldExpire
            SetException Ex = Ollied scr = Nollie
        endif
        if crouched
            Skater_Playanim anim = CrouchToNollie BlendPeriod = 0.1000
        else
            Skater_Playanim anim = SkatingToNollie BlendPeriod = 0.1000
        endif
    endif
    WaitAnimWhilstChecking AndManuals
    if innollie
        goto OnGroundNollieAI
    else
        goto ongroundai
    endif
endscript

script ApplyStanceToggle 
    if IsNGC
        if GotParam Nollie
            if innollie
                nollieoff
                pressureoff
            else
                nollieon
                pressureoff
            endif
        else
            if inpressure
                pressureoff
                nollieoff
            else
                pressureon
                nollieoff
            endif
        endif
    else
        if innollie
            if GotParam Nollie
                pressureoff
                nollieoff
            endif
        else
            if GotParam Nollie
                pressureoff
                nollieon
            else
                nollieoff
                pressureon
            endif
        endif
    endif
    if innollie
        if NOT AbilityEnabled Nollie
            nollieoff
        endif
    endif
    if inpressure
        if NOT AbilityEnabled pressure
            pressureoff
        endif
    endif
    if OnGround
        if currentscorepotgreaterthan 0
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
    ClearEventBuffer buttons = dpad olderthan = TRICK_PRELOAD_TIME
    jump
    InAirExceptions
    vibrate actuator = 1 percent = 50 duration = 0.05000
    nollieon
    Skater_Playanim anim = Nollie BlendPeriod = 0.1000
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
    display Blockspin NoSwitch
    SetTrickName ''
    SetTrickScore 0
    display SpinOnly
    HighOllieCheck
    bailoff
    WaitAnimWhilstChecking
    goto Airborne
endscript

script NollieNoDisplay OutSpeed = 1
    stopbalancetrick
    ClearTrickQueue
    ClearEventBuffer buttons = dpad olderthan = TRICK_PRELOAD_TIME
    SetTrickName ''
    SetTrickScore 0
    display SpinOnly
    jump
    InAirExceptions
    vibrate actuator = 1 percent = 80 duration = 0.05000
    nollieon
    if GotParam OutAnim
        Skater_Playanim anim = <OutAnim> BlendPeriod = 0.3000 Speed = <OutSpeed>
    else
        Skater_Playanim anim = Nollie BlendPeriod = 0.1000
    endif
    if GotParam boardrotate
        BlendperiodOut 0
        BoardRotateAfter
    endif
    HighOllieCheck
    bailoff
    WaitAnimWhilstChecking
    goto Airborne
endscript
dpad = [
    up
    down
    left
    RIGHT
    upright
    upleft
    downright
    downleft
]

script ollie OutSpeed = 1 BlendOut = 0.3000
    stopbalancetrick
    stopskitch
    if GotParam NoDoNextTrick
    else
        DoNextTrick
    endif
    ClearTrickQueue
    SetQueueTricks NoTricks
    ClearEventBuffer buttons = dpad olderthan = TRICK_PRELOAD_TIME
    ClearEventBuffer buttons = [ x ] olderthan = 0
    if NOT GotParam JumpSpeed
        jump
    else
        jump Speed = <JumpSpeed>
    endif
    InAirExceptions
    if inpressure
        SetTrickName 'Pressure'
        SetTrickScore 200
        display Blockspin
    endif
    if innollie
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
        display Blockspin NoSwitch
    else
    endif
    SetTrickName ''
    SetTrickScore 0
    display SpinOnly
    vibrate actuator = 1 percent = 50 duration = 0.05000
    if GotParam FromLip
        printf 'came from lip=================='
        Skater_Playanim anim = <OutAnim> BlendPeriod = 0.0
        BlendperiodOut 0
    else
        if GotParam OutAnim
            if GotParam SyncOutAnimToPreviousAnim
                Skater_Playanim anim = <OutAnim> BlendPeriod = <BlendOut> Speed = <OutSpeed> synctopreviousanim
            else
                if GotParam NoBlend
                    Skater_Playanim anim = <OutAnim> BlendPeriod = 0.0 Speed = <OutSpeed>
                else
                    Skater_Playanim anim = <OutAnim> BlendPeriod = <BlendOut> Speed = <OutSpeed>
                endif
            endif
        else
            if innollie
                Skater_Playanim anim = Nollie BlendPeriod = 0.1000
            else
                Skater_Playanim anim = ollie BlendPeriod = 0.0 norestart
            endif
        endif
    endif
    if GotParam boardrotate
        BlendperiodOut 0
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
        BlendperiodOut 0
    endif
    if GotParam boost
        ExitStallBoost
    endif
    if GotParam WaitOnOlliePercent
        bailon
        Skater_WaitAnim percent = <WaitOnOlliePercent>
    endif
    HighOllieCheck
    bailoff
    WaitAnimWhilstChecking
    goto Airborne
endscript

script HighOllieCheck 
    if AbilityEnabled \{ highollie }
        HighOllieCheckStart \{ frames = 10 }
        SetException \{ scr = highollie Ex = highollie }
    endif
endscript

script highollie 
    LaunchStateChangeEvent state = Skater_InAir
    InAirExceptions
    EnterHighOllie
    OnExitRun high_ollie_exit
    jump no_sound Speed = 100
    Skater_Playanim anim = THPS7_OllieEx_In Speed = 1.500
    Skater_WaitAnimFinished
    SetTrickName 'Boned Ollie'
    SetTrickScore 50
    display
    begin 
    if NOT Held x
        break 
    endif
    Skater_Playanim anim = THPS7_OllieEx_Idle Cycle norestart
    DoNextTrick
    tweaktrick 10
    wait 1 gameframe
    repeat 
    ExitHighOllie
    OnExitRun
    Skater_Playanim anim = THPS7_OllieEx_Out Speed = 1.500
    WaitAnimWhilstChecking
    goto Airborne
endscript

script high_ollie_exit 
    ExitHighOllie
endscript

script NoComply 
    if NOT AbilityEnabled Boneless
        ollie
    endif
    if IsSkaterOnBike
        return 
    endif
    if IsSkaterOnVehicle
        return 
    endif
    ClearTrickQueue
    ClearEventBuffer buttons = dpad olderthan = TRICK_PRELOAD_TIME
    jump
    nollieoff
    pressureoff
    InAirExceptions
    vibrate actuator = 1 percent = 80 duration = 0.05000
    SetTrickName <name>
    SetTrickScore <Score>
    display
    bailoff
    Skater_Playanim anim = NoComply BlendPeriod = 0.2000
    WaitAnimWhilstChecking
    goto Airborne
endscript

script Beanplant 
    ClearTrickQueue
    ClearEventBuffer \{ buttons = dpad olderthan = TRICK_PRELOAD_TIME }
    jump \{ BonelessHeight }
    InAirExceptions
    vibrate \{ actuator = 1 percent = 80 duration = 0.1000 }
    playsound \{ boneless09 pitch = 85 }
    SetTrickName <name>
    SetTrickScore <Score>
    display
    Skater_Playanim \{ anim = Beanplant BlendPeriod = 0.2000 }
    WaitAnimWhilstChecking
    goto \{ Airborne }
endscript

script Fastplant 
    ClearTrickQueue
    ClearEventBuffer \{ buttons = dpad olderthan = TRICK_PRELOAD_TIME }
    jump \{ BonelessHeight }
    InAirExceptions
    vibrate \{ actuator = 1 percent = 80 duration = 0.1000 }
    SetTrickName <name>
    SetTrickScore <Score>
    display
    Skater_Playanim \{ anim = Fastplant BlendPeriod = 0.2000 }
    bailoff
    WaitAnimWhilstChecking
    goto \{ Airborne }
endscript

script Boneless anim = Boneless name = 'Boneless' Score = 250
    if NOT AbilityEnabled Boneless
        ollie
    endif
    if IsSkaterOnBike
        return 
    endif
    if IsSkaterOnVehicle
        return 
    endif
    ClearTrickQueue
    ClearEventBuffer buttons = dpad olderthan = TRICK_PRELOAD_TIME
    jump BonelessHeight
    nollieoff
    pressureoff
    InAirExceptions
    vibrate actuator = 1 percent = 80 duration = 0.1000
    playsound boneless09 pitch = 85
    SetTrickName <name>
    SetTrickScore <Score>
    if NOT SkaterIsNamed Vallely
        Skater_Playanim anim = <anim> BlendPeriod = 0.2000
    else
        OnExitRun mikevboneless_exit
        Skater_Playanim anim = _540Boneless BlendPeriod = 0.1000 Speed = 1.250 from = 10
        SetTrickScore 300
        SetTrickName 'MikeV Boneless'
    endif
    display
    bailoff
    WaitAnimWhilstChecking
    goto Airborne
endscript

script mikevboneless_exit 
    flip
endscript

script SendTauntMessage 
    GetPreferenceString pref_type = taunt <string_id>
    SendChatMessage string = <ui_string>
endscript

script taunt 
    LandSkaterTricks
    ClearException \{ Ollied }
    Skater_Playanim anim = <anim> BlendPeriod = 0.3000
    GetPreferenceString pref_type = taunt <string_id>
    if InNetGame
        SendChatMessage string = <ui_string>
    endif
    wait \{ 10 Game frame }
    OnGroundExceptions
    if speedlessthan \{ 1 }
        setrollingfriction \{ 100 }
        WaitAnimWhilstChecking \{ AndManuals }
        goto \{ HandBrake }
    else
        WaitAnimWhilstChecking \{ AndManuals }
        goto \{ ongroundai }
    endif
endscript

script props 
    LandSkaterTricks
    OnGroundExceptions
    Skater_Playanim Random (@ anim = prop @ anim = Cheer1) BlendPeriod = 0.3000
    GetPreferenceString pref_type = taunt <string_id>
    if InNetGame
        SendChatMessage string = <ui_string>
    endif
    if speedlessthan \{ 1 }
        setrollingfriction \{ 100 }
        WaitAnimWhilstChecking \{ AndManuals }
        goto \{ HandBrake }
    else
        WaitAnimWhilstChecking \{ AndManuals }
        goto \{ ongroundai }
    endif
endscript
SkitchExceptionTable = [
    { event Ex = MadeOtherSkaterBail scr = MadeOtherSkaterBail_Called }
    { exception Ex = OffMeterTop scr = SkitchOut }
    { exception Ex = OffMeterBottom scr = SkitchOut }
    { exception Ex = CarBail scr = CarBail }
    { exception Ex = SkaterCollideBail scr = SkaterCollideBail }
]

script skitch 
    stopbalancetrick
    resetlandedfromvert
    KillExtraTricks
    if CancelRotateDisplayandUpdateMatrix
        change flip_backwards_dont_blend = 1
    endif
    OnExceptionRun
    ResetEventHandlersFromTable SkitchExceptionTable
    SetException Ex = Ollied scr = ollie params = { <...>  }
    LaunchStateChangeEvent state = Skater_Skitching
    ClearTrickQueue
    SetQueueTricks NoTricks
    ClearManualTrick
    SetManualTricks NoTricks
    startskitch
    startbalancetrick
    Skater_Playanim anim = SkitchInit
    Skater_WaitAnimFinished
    change flip_backwards_dont_blend = 0
    playsound Hud_jumpgap
    SetTrickName '\c2Skitchin\C0'
    SetTrickScore 500
    display Blockspin
    dobalancetrick ButtonA = RIGHT ButtonB = left type = skitch Tweak = 5
    Skater_Playanim anim = SkitchRange Wobble
    seteventhandler Ex = SkitchLeft scr = SkitchAnimLeft
    seteventhandler Ex = SkitchRight scr = SkitchAnimRight
    begin 
    overridelimits max = 1750 friction = 0 time = 5 gravity = 0
    if Skater_AnimComplete
        Skater_Playanim anim = SkitchRange Wobble norestart
    endif
    if Held down
        obj_spawnscriptlater NoBrake_Timer
        goto SkitchOut
    endif
    WaitOneGameFrame
    repeat 
endscript

script SkitchAnimLeft 
    Skater_Playanim \{anim = SkitchMoveLeft from = 20 norestart Speed = 2 BlendPeriod = 0.1000}
endscript

script SkitchAnimRight 
    Skater_Playanim \{anim = SkitchMoveRight from = 20 norestart Speed = 2 BlendPeriod = 0.1000}
endscript

script SkitchOut 
    stopskitch
    stopbalancetrick
    Skater_Playanim \{ anim = SkitchInit backwards }
    OnGroundExceptions
    ClearException \{ Skitched }
    LandSkaterTricks
    Skater_WaitAnimFinished
    goto \{ ongroundai }
endscript

script NoBrake_Timer 
    canbrakeoff
    wait \{ 0.5000 seconds }
    canbrakeon
endscript
