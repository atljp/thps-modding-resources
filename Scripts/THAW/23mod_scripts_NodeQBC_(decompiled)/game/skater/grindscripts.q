
script GetBoardGrindBone \{ ObjID = skater }
    <ObjID> ::GetSparksPos
    switch <SparksPos>
        case front
        if <ObjID> ::BoardIsRotated
            <bone> = Bone_Board_Tail
        else
            <bone> = Bone_Board_Nose
        endif
        case rear
        if <ObjID> ::BoardIsRotated
            <bone> = Bone_Board_Nose
        else
            <bone> = Bone_Board_Tail
        endif
        default 
        <bone> = Bone_Board_Root
    endswitch
    return bone = <bone>
endscript

script SkateInOrBail moveleft = 1 moveright = -1 movey = -5 grindbail = FiftyFiftyFall
    gettags
    if IsSkaterOnVehicle
        OutAnim = <grind_out_anim>
        grindbail = vehicle_bail
    endif
    norailtricks
    stopbalancetrick
    KillExtraTricks
    SetExtraTricks NoTricks
    if NOT IsSkaterOnVehicle
        OnGroundExceptions NoEndRun
    endif
    if NOT (<grindbail> = Airborne)
        OnExceptionRun SkateInOrBail_Out
    endif
    SetQueueTricks NoTricks
    ClearManualTrick
    SetLastLandingVert
    if GotParam FallingRight
        if backwards
            goto SkateIn_Left params = { <...>  }
        else
            goto SkateIn_Right params = { <...>  }
        endif
    endif
    if GotParam FallingLeft
        if backwards
            goto SkateIn_Right params = { <...>  }
        else
            goto SkateIn_Left params = { <...>  }
        endif
    endif
    if GotParam GrindRelease
        TriggerGrindOff
        if Held RIGHT
            goto SkateIn_Right params = { <...>  }
        endif
        if Held left
            goto SkateIn_Left params = { <...>  }
        endif
        if skateinable left
            if backwards
                goto SkateIn_Right params = { <...>  }
            else
                goto SkateIn_Left params = { <...>  }
            endif
        else
            if backwards
                goto SkateIn_Left params = { <...>  }
            else
                goto SkateIn_Right params = { <...>  }
            endif
        endif
    endif
    printf 'Missing a FallingLeft or FallingRight ?'
    if GotParam grindbail
        goto <grindbail>
    else
        goto FiftyFiftyFall
    endif
endscript

script OnGroundExceptions_NoOllieAfterEndofRun 
    OnGroundExceptions \{ NoEndRun }
    if GoalManager_GoalShouldExpire
        ClearException \{ Ollied }
        ClearException \{ GroundGone }
        ClearException \{ WallPush }
    endif
endscript

script SkateIn_Right 
    if skateinable RIGHT
        skatein = 1
    else
        if NearGround RIGHT
            skatein = 1
            params = { no_land_anim = 1 }
        endif
    endif
    if GotParam skatein
        printf 'SkateInable RIGHT >>>>>>>>>>>>>>>>>>>>>>>>'
        setlandedfromvert
        setstate Ground
        move y = -5
        move x = -1
        orienttonormal
        rotate y = -30 duration = 0.2000 seconds
        if NOT IsSkaterOnVehicle
            OnGroundExceptions_NoOllieAfterEndofRun
        endif
        ClearException GroundGone
        OnExceptionRun SkateInOrBail_Out
        SetQueueTricks NoTricks
        SetManualTricks NoTricks
        SetExtraTricks_Reverts
        norailtricks
        if IsSkaterOnBike
            goto bike_rail_exit params = { callback = bike_Land }
        else
            if IsSkaterOnVehicle
                goto vehicle_rail_exit params = { callback = vehicle_land }
            else
                if GotParam OutAnim
                    Skater_Playanim anim = <OutAnim> BlendPeriod = 0.3000
                else
                    Skater_Playanim anim = <InitAnim> backwards BlendPeriod = 0.3000
                endif
                WaitAnimWhilstChecking
                goto SkateInLand params = <params>
            endif
        endif
    else
        move y = <movey>
        move x = <moveright>
        if IsSkaterOnBike
            goto bike_rail_exit params = { callback = bike_bail }
        else
            if IsSkaterOnVehicle
                vehicle_rail_exit params = { callback = vehicle_bail }
            else
                SkateIn_Bail <...> dir = RIGHT
            endif
        endif
    endif
endscript

script SkateIn_Left 
    if skateinable left
        skatein = 1
    else
        if NearGround left
            skatein = 1
            params = { no_land_anim = 1 }
        endif
    endif
    if GotParam skatein
        setlandedfromvert
        printf 'SkateInable LEFT >>>>>>>>>>>>>>>>>>>>>>>>'
        setstate Ground
        move y = -5
        move x = 1
        orienttonormal
        rotate y = 30 duration = 0.2000 seconds
        setstate Ground
        if NOT IsSkaterOnVehicle
            OnGroundExceptions_NoOllieAfterEndofRun
        endif
        ClearException GroundGone
        OnExceptionRun SkateInOrBail_Out
        SetQueueTricks NoTricks
        SetManualTricks NoTricks
        SetExtraTricks_Reverts
        norailtricks
        if IsSkaterOnBike
            goto bike_rail_exit params = { callback = bike_Land }
        else
            if IsSkaterOnVehicle
                goto vehicle_rail_exit params = { callback = vehicle_land }
            else
                if GotParam OutAnim
                    Skater_Playanim anim = <OutAnim> BlendPeriod = 0.3000
                else
                    Skater_Playanim anim = <InitAnim> backwards BlendPeriod = 0.3000
                endif
                WaitAnimWhilstChecking
                goto SkateInLand params = <params>
            endif
        endif
    else
        printf 'Not skateinable left >>>>>>>>>>>>>>>>>>>>>>>>'
        move y = <movey>
        move x = <moveright>
        if IsSkaterOnBike
            goto bike_rail_exit params = { callback = bike_bail }
        else
            if IsSkaterOnVehicle
                vehicle_rail_exit params = { callback = vehicle_bail }
            else
                SkateIn_Bail <...> dir = left
            endif
        endif
    endif
endscript

script SkateIn_Bail 
    if OnStall
        LipBail <...> 
    endif
    if Flipped
        if (<dir> = left)
            dir = backward
        else
            dir = forward
        endif
    else
        if (<dir> = left)
            dir = forward
        else
            dir = backward
        endif
    endif
    if GotParam grindbail
        goto <grindbail> params = { dir = <dir> }
    else
        goto FiftyFiftyFall params = { dir = <dir> }
    endif
endscript

script SkateInLand 
    OnExceptionRun SkateInLandOut
    nollieoff
    pressureoff
    vibrate actuator = 1 percent = 80 duration = 0.1000
    if NOT GotParam no_land_anim
        if crouched
            Skater_Playanim anim = CrouchedLand BlendPeriod = 0.1000
        else
            Skater_Playanim anim = land BlendPeriod = 0.1000
        endif
    endif
    LandSkaterTricks
    OnGroundExceptions_NoOllieAfterEndofRun
    SetManualTricks NoTricks
    if NOT GotParam no_land_anim
        Skater_WaitAnim percent = 10
    endif
    OnGroundExceptions
    CheckforNetBrake
    if NOT GotParam no_land_anim
        WaitAnimWhilstChecking AndManuals
    endif
    goto ongroundai
endscript

script SkateInLandOut 
    allowrailtricks
    LandSkaterTricks
endscript

script SkateInOrBail_Out 
    KillExtraTricks
    if NOT InAir
        printf \{ ' =================================== LAND ==================================' }
        LandSkaterTricks
    endif
    resetlandedfromvert
    printf \{ ' =================================== NO VERT ==================================' }
endscript
Extra_FS_Grinds = [
    {
        trigger = { InOrder a = triangle b = triangle 300 }
        scr = Trick_5050_FS
        params = { name = "FS 50-50" IsExtra = yes }
    }
    {
        trigger = { InOrder triangle square 300 }
        scr = Trick_Noseslide_FS
        params = { name = "FS Noseslide" IsExtra = yes }
    }
    {
        trigger = { InOrder triangle Circle 300 }
        scr = Trick_NoseGrind_FS
        params = { name = "FS Nosegrind" IsExtra = yes }
    }
    {
        trigger = { InOrder a = Circle b = Circle 300 }
        scr = Trick_Crooked_FS
        params = { name = "FS Crooked" IsExtra = yes }
    }
    {
        trigger = { InOrder Circle square 300 }
        scr = Trick_Bluntslide_FS
        params = { name = "FS Bluntslide" IsExtra = yes }
    }
    {
        trigger = {
            TripleInOrderSloppy
            up
            b = up
            c = triangle
            500
        }
        scr = Trick_NoseBluntSlide_FS
        params = { name = "FS Nosebluntslide" IsExtra = yes }
    }
    {
        trigger = { InOrder a = square b = square 300 }
        scr = Trick_Smith_FS
        params = { name = "FS Smith" IsExtra = yes }
    }
    {
        trigger = { InOrder square Circle 300 }
        scr = Trick_5_0_FS
        params = { name = "FS 5-0" IsExtra = yes }
    }
    {
        trigger = { InOrder square triangle 300 }
        scr = Trick_Tailslide_FS
        params = { name = "FS Tailslide" IsExtra = yes }
    }
    {
        trigger = { InOrder Circle triangle 300 }
        scr = Trick_OneFooter
        params = { name = "FS One Footer" IsExtra = yes }
    }
]
Extra_BS_Grinds = [
    {
        trigger = { InOrder a = triangle b = triangle 300 }
        scr = Trick_5050_BS
        params = { name = "BS 50-50" IsExtra = yes }
    }
    {
        trigger = { InOrder triangle square 300 }
        scr = Trick_Noseslide_BS
        params = { name = "BS Noseslide" IsExtra = yes }
    }
    {
        trigger = { InOrder triangle Circle 300 }
        scr = Trick_NoseGrind_BS
        params = { name = "BS Nosegrind" IsExtra = yes }
    }
    {
        trigger = { InOrder a = Circle b = Circle 300 }
        scr = Trick_Crooked_BS
        params = { name = "BS Crooked" IsExtra = yes }
    }
    {
        trigger = { InOrder Circle square 300 }
        scr = Trick_Bluntslide_BS
        params = { name = "BS Bluntslide" IsExtra = yes }
    }
    {
        trigger = {
            TripleInOrderSloppy
            up
            b = up
            c = triangle
            500
        }
        scr = Trick_NoseBluntSlide_BS
        params = { name = "BS Nosebluntslide" IsExtra = yes }
    }
    {
        trigger = { InOrder square triangle 300 }
        scr = Trick_Tailslide_BS
        params = { name = "BS Tailslide" IsExtra = yes }
    }
    {
        trigger = { InOrder a = square b = square 300 }
        scr = Trick_Smith_BS
        params = { name = "BS Smith" IsExtra = yes }
    }
    {
        trigger = { InOrder square Circle 300 }
        scr = Trick_5_0_BS
        params = { name = "BS 5-0" IsExtra = yes }
    }
    {
        trigger = { InOrder Circle triangle 300 }
        scr = Trick_OneFooter
        params = { name = "BS One Footer" IsExtra = yes }
    }
]
GrindRelease = [
    {
        trigger = { Press r2 100 }
        scr = SkateInOrBail
        NGC_Trigger = { Press r1 100 }
        xbox_trigger = { AirTrickLogic l1 r1 200 }
        params = { GrindRelease grindbail = Airborne moveright = -5 movey = 5 }
    }
]
SPECIALGRIND_SCORE = 1250
GRINDTAP_TIME = 1000
GRINDTAP_SCORE = 400
GRINDTAP_TWEAK = 25
GrindTaps_FS = [
    {
        trigger = {
            TripleInOrderSloppy
            upright
            b = triangle
            c = triangle
            GRINDTAP_TIME
        }
        scr = Trick_CrailSlide_FS
        params = { IsExtra = 1 }
    }
    {
        trigger = {
            TripleInOrderSloppy
            downright
            b = triangle
            c = triangle
            GRINDTAP_TIME
        }
        scr = Trick_Darkslide_FS
        params = { IsExtra = 1 }
    }
    {
        trigger = {
            TripleInOrderSloppy
            downleft
            b = triangle
            c = triangle
            GRINDTAP_TIME
        }
        scr = Trick_DoubleBluntSlide2
        params = { IsExtra = 1 }
    }
    {
        trigger = {
            TripleInOrderSloppy
            upleft
            b = triangle
            c = triangle
            GRINDTAP_TIME
        }
        scr = Trick_HangTenNoseGrind_FS
        params = { IsExtra = 1 }
    }
    {
        trigger = {
            TripleInOrderSloppy
            up
            b = triangle
            c = triangle
            GRINDTAP_TIME
        }
        scr = Trick_NosegrindPivot_FS
        params = { IsExtra = 1 }
    }
    {
        trigger = {
            TripleInOrderSloppy
            RIGHT
            b = triangle
            c = triangle
            GRINDTAP_TIME
        }
        scr = Trick_Salad_FS
        params = { IsExtra = 1 }
    }
    {
        trigger = {
            TripleInOrderSloppy
            left
            b = triangle
            c = triangle
            GRINDTAP_TIME
        }
        scr = Trick_Hurricane_FS
        params = { IsExtra = 1 }
    }
    {
        trigger = {
            TripleInOrderSloppy
            down
            b = triangle
            c = triangle
            GRINDTAP_TIME
        }
        scr = Trick_GrindOverturn_FS
        params = { IsExtra = 1 }
    }
]
GrindTaps_BS = [
    {
        trigger = {
            TripleInOrderSloppy
            upright
            b = triangle
            c = triangle
            GRINDTAP_TIME
        }
        scr = Trick_CrailSlide_BS
        params = { IsExtra = 1 }
    }
    {
        trigger = {
            TripleInOrderSloppy
            downright
            b = triangle
            c = triangle
            GRINDTAP_TIME
        }
        scr = Trick_Darkslide_BS
        params = { IsExtra = 1 }
    }
    {
        trigger = {
            TripleInOrderSloppy
            downleft
            b = triangle
            c = triangle
            GRINDTAP_TIME
        }
        scr = Trick_DoubleBluntSlide2
        params = { IsExtra = 1 }
    }
    {
        trigger = {
            TripleInOrderSloppy
            upleft
            b = triangle
            c = triangle
            GRINDTAP_TIME
        }
        scr = Trick_HangTenNoseGrind_BS
        params = { IsExtra = 1 }
    }
    {
        trigger = {
            TripleInOrderSloppy
            up
            b = triangle
            c = triangle
            GRINDTAP_TIME
        }
        scr = Trick_NosegrindPivot_BS
        params = { IsExtra = 1 }
    }
    {
        trigger = {
            TripleInOrderSloppy
            RIGHT
            b = triangle
            c = triangle
            GRINDTAP_TIME
        }
        scr = Trick_Salad_BS
        params = { IsExtra = 1 }
    }
    {
        trigger = {
            TripleInOrderSloppy
            down
            b = triangle
            c = triangle
            GRINDTAP_TIME
        }
        scr = Trick_GrindOverturn_BS
        params = { IsExtra = 1 }
    }
    {
        trigger = {
            TripleInOrderSloppy
            left
            b = triangle
            c = triangle
            GRINDTAP_TIME
        }
        scr = Trick_Hurricane_BS
        params = { IsExtra = 1 }
    }
]

script grind GrindTweak = 7 boardscuff = 0 InitSpeed = 1.0 SparksPos = rear
    obj_gettype
    if (<ObjType> = object_type_ped)
        goto Ped_Skater_BeginGrind params = <...> 
        return 
    endif
    if NOT onrail
        if NOT OnStall
            goto Airborne
        endif
    endif
    KillExtraTricks
    if LastWallrideLessThan 100
        NoBlend = NoBlend
    endif
    if bailison
        setstate Air
        goto DoingTrickBail
    endif
    if InNetGame
        if bailison
            setstate Air
            goto DoingTrickBail
        endif
    endif
    if ShouldRunStallScript
        GotoPreserveParams StallTrick
    endif
    if GotParam IsExtra
        if OnStall
            GotoPreserveParams StallTrick
        endif
    endif
    bailoff
    cancelrotatedisplay
    TurnOffSpecialItem
    LaunchStateChangeEvent state = Skater_OnRail
    if NOT GotParam IsATap
        if NOT GotParam IsExtra
            if AbilityEnabled extragrind
                if ChecksumEquals a = <ExtraTricks> b = Extra_BS_Grinds
                    SetExtraTricks GrindTaps_BS
                else
                    SetExtraTricks GrindTaps_FS
                endif
            endif
        endif
    endif
    settags OutAnim = <OutAnim> InitAnim = <InitAnim> InitSpeed = <InitSpeed> anim = <anim> OneFoot = <OneFoot>
    SetTrickName ''
    SetTrickScore 0
    display Blockspin
    obj_clearflag FLAG_SKATER_MANUALCHEESE
    obj_clearflag FLAG_SKATER_REVERTCHEESE
    if GotParam specialitem_details
        if StructureContains structure = <specialitem_details> force_unflipped
            if Flipped
                FlipAndRotate
                boardrotate
                NoBlend = 1
                settags SpecialItemUnflip = 1
            endif
        endif
        TurnOnSpecialItem specialitem_details = <specialitem_details>
    endif
    if GotParam SwitchBoardOff
        SwitchOffBoard
    endif
    if GotParam IsSpecial
        broadcastevent type = SkaterEnterSpecialTrick
        OnExitRun Exit_Special_Grind
    else
        OnExitRun Exit_Grind
    endif
    if GotParam SpecialSounds
        obj_spawnscriptlater <SpecialSounds>
    endif
    vibrate actuator = 1 percent = 50 duration = 0.2500
    vibrate actuator = 0 percent = 50
    ClearExceptions
    if GotParam Nollie
        SetException Ex = Ollied scr = NollieNoDisplay
        nollieon
    else
        if GotParam OutAnimOnOllie
            SetException Ex = Ollied scr = ollie params = { <...>  }
        else
            SetException Ex = Ollied scr = ollie
        endif
        nollieoff
    endif
    pressureoff
    <is_grind> = 0
    if GotParam type
        if (<type> = grind)
            <is_grind> = 1
        endif
    else
        script_assert 'No type specified on grind trick'
    endif
    SetSparksPos <SparksPos>
    if (<is_grind> = 1)
        TurnSparksOn
    else
        GetBoardScuff
        <boardscuff> = (<boardscuff> + 1)
        settags boardscuff = <boardscuff>
        DoBoardScuff boardscuff = <boardscuff>
        TurnSparksOff
        TurnSparksOn type = slide
    endif
    SetException Ex = OffRail scr = OffRail params = {KissedRail name = <name> InitAnim = <InitAnim> InitSpeed = <InitSpeed> OutAnim = <OutAnim> boardrotate = <boardrotate> OutAnimBackwards = <OutAnimBackwards>}
    SetException Ex = Landed scr = Grind_to_Land
    SetException Ex = OffMeterTop scr = SkateInOrBail params = { <...> FallingLeft }
    SetException Ex = OffMeterBottom scr = SkateInOrBail params = { <...> FallingRight }
    SetException Ex = SkaterCollideBail scr = SkaterCollideBail
    seteventhandler Ex = MadeOtherSkaterBail scr = MadeOtherSkaterBail_Called
    OnExceptionRun Grind_Kissed
    ClearTrickQueue
    ClearManualTrick
    ClearExtraGrindTrick
    SetQueueTricks NoTricks
    SetManualTricks NoTricks
    setrailsound <type>
    if GotParam IsSpecial
        setgrindtweak 36
        <Score> = SPECIALGRIND_SCORE
    else
        if GotParam IsATap
            setgrindtweak GRINDTAP_TWEAK
            <Score> = GRINDTAP_SCORE
        else
            setgrindtweak <GrindTweak>
        endif
    endif
    if GotParam IsExtra
        LaunchExtraMessage
    endif
    if GotParam profile
        if ProfileEquals is_named = <profile>
            switchonatomic special_item
            switchoffatomic special_item_2
        endif
    endif
    if GotParam FullScreenEffect
        <FullScreenEffect>
        OnExitRun Exit_FullscreenEffect
    endif
    if GotParam TrickSpawnscript
        settags spawn_to_kill = <TrickSpawnscript>
        obj_spawnscriptlater <TrickSpawnscript>
    endif
    if NOT Skater_AnimEquals JumpAirTo5050
        if GotParam NoBlend
            Skater_Playanim anim = <InitAnim> BlendPeriod = 0.0 Speed = <InitSpeed>
        else
            Skater_Playanim anim = <InitAnim> BlendPeriod = 0.3000 Speed = <InitSpeed>
        endif
    endif
    if GotParam IsATap
        dobalancetrick ButtonA = RIGHT ButtonB = left type = <type> DoFlipCheck ClearCheese IsATap = 1
    else
        if GotParam IsExtra
            dobalancetrick ButtonA = RIGHT ButtonB = left type = <type> DoFlipCheck ClearCheese IsATap = 1
        else
            dobalancetrick ButtonA = RIGHT ButtonB = left type = <type> DoFlipCheck
        endif
    endif
    getsingletag AcidDropCheese
    if GotParam AcidDropCheese
        if (<AcidDropCheese> > 0)
            printf 'ACID DROP CHEESE ================== %i' i = <AcidDropCheese>
            adjustbalance TimeAdd = 0 SpeedMult = 2 LeanMult = 3.200
            removetags tags = [ AcidDropCheese ]
        endif
    endif
    wait 15 frames
    SetExtraTricks GrindRelease
    wait 1 frame
    if GotParam stream
        if NOT IsStreamPlaying SFXSpecialStream
            PlayStream <stream> vol = 200 priority = StreamPriorityHigh id = SFXSpecialStream
        endif
    endif
    if GotParam IsSpecial
        LaunchSpecialMessage text = 'Special Grind'
    endif
    SetException Ex = OffRail scr = OffRail params = {InitAnim = <InitAnim> InitSpeed = <InitSpeed> OutAnim = <OutAnim> boardrotate = <boardrotate> OutAnimBackwards = <OutAnimBackwards>}
    OnExceptionRun Normal_Grind
    SetTrickName <name>
    printf '++++++++++++++++++++++++++++++++++++++++++ BASE SCORE FOR THIS GRIND = %s' s = <Score>
    SetTrickScore <Score>
    display Blockspin NoSpecial = <NoSpecial>
    if Skater_AnimEquals JumpAirTo5050
        Skater_WaitAnimFinished
        Skater_Playanim anim = <InitAnim> BlendPeriod = 0.3000 Speed = <InitSpeed>
    endif
    Skater_WaitAnimFinished
    if GotParam FlipAfterInit
        flip
        playbonksound
        boardrotate
        BlendperiodOut 0
    endif
    if GotParam idle
        Skater_Playanim anim = <anim> Cycle norestart
    else
        if GotParam Anim3
            if GotParam Anim2
                Skater_Playanim Random (@ anim = <anim> @ anim = <Anim2> @ anim = <Anim3>) Wobble wobbleparams = grindwobble_params
            else
                scriptassert 'Script Assert: Added Anim3 to a grind without a valid anim2...check grindscripts.q Problem Anim = %a' a = <anim>
            endif
        else
            if GotParam Anim2
                Skater_Playanim Random (@ anim = <anim> @ anim = <Anim2>) Wobble wobbleparams = grindwobble_params
            else
                Skater_Playanim anim = <anim> Wobble wobbleparams = grindwobble_params
            endif
        endif
    endif
    if GotParam FlipBeforeOutAnim
        BlendperiodOut 0.0
        FlipAfter
    endif
    if Skater_AnimEquals [ FiftyFifty_Range NoseGrind_Range TailGrind_Range ]
        wait 0.2500 seconds
    endif
    if AbilityEnabled extragrind
        if GotParam ExtraTricks
            SetExtraTricks <ExtraTricks> ignore = <name> GrindRelease
        else
            SetExtraTricks GrindRelease
        endif
    else
        SetExtraTricks GrindRelease
    endif
    if GotParam specialtrick_particles
        printf 'Going to emit particles .........................'
        Emit_SpecialTrickParticles specialitem_particles = <specialitem_particles>
    endif
    WaitWhilstChecking_ForPressure <...> 
endscript

script Grind_to_Land 
    stopbalancetrick
    goto \{ land }
endscript

script Exit_FullscreenEffect 
    <skaterlights_target> = (tod_skaterlights)
    SetFogColor \{ r = fog_red b = fog_blue g = fog_green a = fog_alpha }
    SetFogDistance \{ distance = fog_dist }
    KillManualVibration
    Exit_Grind
endscript

script Exit_FullScreenEffect_and_Special 
    broadcastevent \{ type = SkaterExitSpecialTrick }
    Exit_FullscreenEffect
endscript

script Exit_Grind 
    SwitchOnBoard
    CleanUp_SpecialTrickParticles
    TurnOffSpecialItem
    getsingletag \{ SpecialItemUnflip }
    if GotParam \{ SpecialItemUnflip }
        removetags \{tags = [ SpecialItemUnflip ]}
        FlipAndRotate
        boardrotate
        NoBlend = 1
    endif
    getsingletag \{ spawn_to_kill }
    if GotParam \{ spawn_to_kill }
        obj_killspawnedscript name = <spawn_to_kill>
    endif
endscript

script Exit_Special_Grind 
    Exit_Special
    Exit_Grind
endscript

script Exit_Special 
    broadcastevent \{ type = SkaterExitSpecialTrick }
endscript

script GetBoardScuff \{ ManualName = "none" }
    gettags
    return boardscuff = <boardscuff>
endscript

script Grind_ScreenShake 
    BloodSplat
    playsound \{ BailSlap03 }
    ShakeCamera \{duration = 0.5000 vert_amp = 9.0 horiz_amp = 3.0 vert_vel = 10.27 horiz_vel = 5.920}
endscript
grindwobble_params = {
    wobbleampa = { (0.10000000149011612, 0.10000000149011612) STATS_RAILBALANCE }
    wobbleampb = { (0.03999999910593033, 0.03999999910593033) STATS_RAILBALANCE }
    wobblek1 = { (0.002199999988079071, 0.002199999988079071) STATS_RAILBALANCE }
    wobblek2 = { (0.0017000000225380063, 0.0017000000225380063) STATS_RAILBALANCE }
    spazfactor = { (1.5, 1.5) STATS_RAILBALANCE }
}

script Grind_Kissed 
    if GotParam \{ MadeOtherSkaterBail }
    else
        KillExtraTricks
    endif
    SetTrickName \{ '' }
    SetTrickScore \{ 0 }
    display \{ Blockspin }
    obj_killspawnedscript \{ name = CheckForShuffle }
    obj_spawnscriptlater \{ CheckForShuffle }
endscript

script CheckForShuffle 
    SetException \{ Ex = SkaterEnterRail scr = Awardshuffle }
    wait \{ 15 frames }
endscript

script Awardshuffle 
    SetTrickName ''
    SetTrickScore 100
    display Blockspin NoDegrade
    if NOT InSplitScreenGame
        create_panel_message text = 'Shuffle Bonus' id = perfect rgba = [ 50 120 200 128 ] Pos = (110.0, 340.0) style = perfect_style
        create_panel_message text = '+100 Points' id = perfect2 rgba = [ 50 120 200 100 ] Pos = (110.0, 360.0) style = perfect_style
    else
        PerfectSloppy_2p text = 'Shuffle!' rgb = [ 50 120 50 128 ]
    endif
endscript

script Normal_Grind 
    if GotParam \{ MadeOtherSkaterBail }
    else
        KillExtraTricks
    endif
    switchoffatomic \{ special_item }
    switchonatomic \{ special_item_2 }
endscript

script OffRail InitSpeed = 1.0
    if GotParam KissedRail
        Random (@*5 suffix = 'bonk' @*5 suffix = 'tap' @ suffix = 'kiss' @ suffix = 'clip' @ suffix = 'ding')
        FormatText textname = new_name '%n %s' n = <name> s = <suffix>
        SetTrickScore 50
        SetTrickName <new_name>
        display Blockspin NoMult
    endif
    stopbalancetrick
    KillExtraTricks
    vibrate actuator = 0 percent = 0
    setstate Air
    SetException Ex = Landed scr = land
    SetException Ex = WallRideLeft scr = wallride params = { left }
    SetException Ex = WallRideRight scr = wallride params = { RIGHT }
    SetException Ex = wallplant scr = Air_WallPlant
    DoNextTrick
    if GotParam EarlyOut
        Skater_Playanim anim = <EarlyOut> BlendPeriod = 0.1000 backwards
    else
        if GotParam OutAnim
            if GotParam OutAnimBackwards
                printf 'Playing OutAnim Backwards'
                Skater_Playanim anim = <OutAnim> backwards BlendPeriod = 0.1000 Speed = <InitSpeed>
            else
                Skater_Playanim anim = <OutAnim> BlendPeriod = 0.1000 Speed = <InitSpeed>
            endif
        else
            Skater_Playanim anim = <InitAnim> BlendPeriod = 0.1000 backwards Speed = <InitSpeed>
        endif
    endif
    if GotParam boardrotate
        printf 'Setting blendperiod out..................'
        BlendperiodOut 0
        BoardRotateAfter
    endif
    if GotParam FlipAfter
        printf 'flipping..................'
        FlipAfter
    endif
    if NOT GotParam dont_wait
        Skater_WaitAnimFinished
    endif
    goto Airborne
endscript

script Trick_5050_BS \{ name = "BS 50-50" }
    grind {name = <name> Score = 100 InitAnim = Init_FiftyFifty anim = FiftyFifty2_Range Anim2 = FiftyFifty_Range Anim3 = FiftyFifty3_Range type = grind NoBlend = <NoBlend>
        grindbail = FiftyFiftyFall ExtraTricks = Extra_BS_Grinds IsExtra = <IsExtra>
        SparkPos = rear OneFoot = front}
endscript

script Trick_5050_FS \{ name = "FS 50-50" }
    grind {name = <name> Score = 100 InitAnim = Init_FiftyFifty anim = FiftyFifty2_Range Anim2 = FiftyFifty_Range Anim3 = FiftyFifty3_Range type = grind NoBlend = <NoBlend>
        grindbail = FiftyFiftyFall ExtraTricks = Extra_FS_Grinds IsExtra = <IsExtra> OneFoot = front}
endscript

script Trick_5050_BS_180 
    FlipAndRotate
    BoardRotateAfter
    goto \{Trick_5050_BS params = { NoBlend = yes }}
endscript

script Trick_5050_FS_180 
    FlipAndRotate
    BoardRotateAfter
    goto \{Trick_5050_FS params = { NoBlend = yes }}
endscript

script Trick_BoardSlide_FS \{ name = "FS Boardslide" stall_name = 'FS Board Stall' }
    rotate
    grind {name = <name> stall_name = <stall_name> Score = 200 GrindTweak = 14 InitAnim = Init_FSBoardSlide anim = FSBoardSlide_Range OutAnim = FSBoardSlide_Out NoBlend = yes
        grindbail = BackwardsGrindBails ExtraTricks = Extra_FS_Grinds IsExtra = <IsExtra>
        type = slide SparkPos = front OneFoot = FSBoard}
endscript

script Trick_Boardslide_BS \{ name = "BS Boardslide" stall_name = 'BS Board Stall' }
    grind {name = <name> stall_name = <stall_name> Score = 200 GrindTweak = 14 InitAnim = Init_BSBoardSlide anim = BSBoardSlide_Range OutAnim = BSBoardslide_Out NoBlend = yes
        grindbail = GrindFallLR ExtraTricks = Extra_BS_Grinds IsExtra = <IsExtra>
        type = slide SparkPos = rear OneFoot = board}
endscript

script Trick_LipSlide_FS \{ name = "FS Lipslide" stall_name = 'FS Lip Stall' }
    grind {name = <name> stall_name = <stall_name> Score = 200 GrindTweak = 14 InitAnim = Init_FSLipSlide anim = BSBoardSlide_Range OutAnim = BSBoardslide_Out NoBlend = yes
        grindbail = GrindFallLR ExtraTricks = Extra_FS_Grinds IsExtra = <IsExtra>
        type = slide SparkPos = front OneFoot = board}
endscript

script Trick_LipSlide_BS \{ name = "BS Lipslide" stall_name = 'BS Lip Stall' }
    rotate
    grind {name = <name> stall_name = <stall_name> Score = 200 GrindTweak = 14 InitAnim = Init_BSLipSlide anim = FSBoardSlide_Range OutAnim = FSBoardSlide_Out NoBlend = yes
        grindbail = BackwardsGrindBails ExtraTricks = Extra_BS_Grinds IsExtra = <IsExtra>
        type = slide SparkPos = rear OneFoot = FSBoard}
endscript

script Trick_Tailslide_FS 
    if badledge
        goto Trick_NoseSlide_BS_ok params = {IsExtra = <IsExtra> NoBlend = <NoBlend>}
    else
        goto Trick_Tailslide_FS_ok params = {IsExtra = <IsExtra> NoBlend = <NoBlend>}
    endif
endscript

script Trick_Tailslide_FS_ok \{ name = "FS Tailslide" stall_name = 'FS Tail Stall' }
    grind {name = <name> stall_name = <stall_name> Score = 150 GrindTweak = 11 InitAnim = Init_FSTailSlide InitSpeed = 1.500 anim = FSTailSlide_Range OutAnim = FSTailSlide_Out type = slide NoBlend = <NoBlend>
        grindbail = GrindFallLR ExtraTricks = Extra_FS_Grinds IsExtra = <IsExtra> OneFoot = front}
endscript

script Trick_Tailslide_BS 
    if badledge
        goto Trick_NoseSlide_FS_ok params = {IsExtra = <IsExtra> NoBlend = <NoBlend>}
    else
        goto Trick_Tailslide_BS_ok params = {IsExtra = <IsExtra> NoBlend = <NoBlend>}
    endif
endscript

script Trick_Tailslide_BS_ok \{ name = "BS Tailslide" stall_name = 'BS Tail Stall' }
    grind {name = <name> stall_name = <stall_name> Score = 150 GrindTweak = 11 InitAnim = Init_TailSlide InitSpeed = 1.500 anim = TailSlide_Range OutAnim = BSTailSlide_Out type = slide NoBlend = <NoBlend>
        grindbail = BackwardsGrindBails ExtraTricks = Extra_BS_Grinds IsExtra = <IsExtra> OneFoot = front}
endscript

script Trick_TailSlide_FS_180 
    FlipAndRotate
    BoardRotateAfter
    goto \{Trick_Tailslide_BS params = { NoBlend = yes }}
endscript

script Trick_Tailslide_BS_180 
    FlipAndRotate
    BoardRotateAfter
    goto \{Trick_Tailslide_FS params = { NoBlend = yes }}
endscript

script Trick_Noseslide_FS 
    if badledge
        goto Trick_Tailslide_BS_ok params = {IsExtra = <IsExtra> NoBlend = <NoBlend>}
    else
        goto Trick_NoseSlide_FS_ok params = {IsExtra = <IsExtra> NoBlend = <NoBlend>}
    endif
endscript

script Trick_NoseSlide_FS_ok \{ name = "FS Noseslide" stall_name = 'FS Nose Stall' }
    grind {name = <name> stall_name = <stall_name> Score = 150 GrindTweak = 11 InitAnim = Init_FSNoseSlide InitSpeed = 1.500 anim = FSNoseSlide_Range type = slide Nollie = yes OutAnim = FSNoseSlide_Out NoBlend = <NoBlend>
        grindbail = BackwardsGrindBails ExtraTricks = Extra_FS_Grinds IsExtra = <IsExtra> OneFoot = back}
endscript

script Trick_Noseslide_BS 
    if badledge
        goto Trick_Tailslide_FS_ok params = {IsExtra = <IsExtra> NoBlend = <NoBlend>}
    else
        goto Trick_NoseSlide_BS_ok params = {IsExtra = <IsExtra> NoBlend = <NoBlend>}
    endif
endscript

script Trick_NoseSlide_BS_ok \{ name = "BS Noseslide" stall_name = 'BS Nose Stall' }
    grind {name = <name> stall_name = <stall_name> Score = 150 GrindTweak = 11 InitAnim = Init_NoseSlide InitSpeed = 1.500 anim = NoseSlide_Range OutAnim = BSNoseSlide_Out type = slide Nollie = yes NoBlend = <NoBlend>
        grindbail = GrindFallLR ExtraTricks = Extra_BS_Grinds IsExtra = <IsExtra> OneFoot = back}
endscript

script Trick_Noseslide_FS_180 
    FlipAndRotate
    BoardRotateAfter
    goto \{Trick_Noseslide_BS params = { NoBlend = yes }}
endscript

script Trick_Noseslide_BS_180 
    FlipAndRotate
    BoardRotateAfter
    goto \{Trick_Noseslide_FS params = { NoBlend = yes }}
endscript

script Trick_NoseGrind_FS \{ name = "FS Nosegrind" }
    grind {name = <name> Score = 100 InitAnim = Init_NoseGrind InitSpeed = 1.500 anim = NoseGrind_Range type = grind Nollie = yes NoBlend = <NoBlend>
        grindbail = FiftyFiftyFall ExtraTricks = Extra_FS_Grinds IsExtra = <IsExtra>
        SparksPos = front OneFoot = back}
endscript

script Trick_NoseGrind_BS \{ name = "BS Nosegrind" }
    grind {name = <name> Score = 100 InitAnim = Init_NoseGrind InitSpeed = 1.500 anim = NoseGrind_Range type = grind Nollie = yes NoBlend = <NoBlend>
        grindbail = FiftyFiftyFall ExtraTricks = Extra_BS_Grinds IsExtra = <IsExtra>
        SparksPos = front OneFoot = back}
endscript

script Trick_NoseGrind_BS_180 
    FlipAndRotate
    BoardRotateAfter
    goto \{Trick_5_0_FS params = { NoBlend = yes }}
endscript

script Trick_NoseGrind_FS_180 
    FlipAndRotate
    BoardRotateAfter
    goto \{Trick_5_0_BS params = { NoBlend = yes }}
endscript

script Trick_5_0_FS \{ name = "FS 5-0" }
    grind {name = <name> Score = 100 InitAnim = Init_TailGrind InitSpeed = 1.500 anim = TailGrind_Range type = grind NoBlend = <NoBlend>
        grindbail = FiftyFiftyFall ExtraTricks = Extra_FS_Grinds IsExtra = <IsExtra> OneFoot = front}
endscript

script Trick_5_0_BS \{ name = "BS 5-0" }
    grind {name = <name> Score = 100 InitAnim = Init_TailGrind InitSpeed = 1.500 anim = TailGrind_Range type = grind NoBlend = <NoBlend>
        grindbail = FiftyFiftyFall ExtraTricks = Extra_BS_Grinds IsExtra = <IsExtra> OneFoot = front}
endscript

script Trick_5_0_FS_180 
    FlipAndRotate
    BoardRotateAfter
    goto \{Trick_NoseGrind_BS params = { NoBlend = yes }}
endscript

script Trick_5_0_BS_180 
    FlipAndRotate
    BoardRotateAfter
    goto \{Trick_NoseGrind_BS params = { NoBlend = yes }}
endscript

script Trick_Crooked_FS \{ name = "FS Crooked" }
    grind {name = <name> Score = 125 GrindTweak = 9 InitAnim = Init_FSCrooked InitSpeed = 1.500 anim = FSCrooked_Range Nollie = yes NoBlend = <NoBlend>
        grindbail = FiftyFiftyFall ExtraTricks = Extra_FS_Grinds IsExtra = <IsExtra>
        type = grind SparksPos = front OneFoot = back}
endscript

script Trick_Crooked_FS_rot 
    rotate
    goto \{ Trick_Crooked_FS }
endscript

script Trick_Crooked_BS \{ name = "BS Crooked" }
    grind {name = <name> Score = 125 GrindTweak = 9 InitAnim = Init_BSCrooked InitSpeed = 1.500 anim = BSCrooked_Range Nollie = yes NoBlend = <NoBlend>
        grindbail = FiftyFiftyFall ExtraTricks = Extra_BS_Grinds IsExtra = <IsExtra>
        type = grind SparksPos = front OneFoot = back}
endscript

script Trick_Crooked_FS_180 
    if backwards
        printf \{ 'I\'m backwards............' }
    endif
    FlipAndRotate
    BoardRotateAfter
    goto \{Trick_Crooked_BS params = { NoBlend = yes }}
endscript

script Trick_Crooked_BS_180 
    FlipAndRotate
    BoardRotateAfter
    goto \{Trick_Crooked_FS params = { NoBlend = yes }}
endscript

script Trick_Overcrook_FS_rot 
    rotate
    printf \{ 'fixed it bitches................................' }
    goto \{ Trick_Overcrook_FS }
endscript

script Trick_Overcrook_FS \{ name = "FS Overcrook" }
    grind {name = <name> Score = 125 GrindTweak = 9 InitAnim = Init_FSOverCrook InitSpeed = 1.500 anim = FSOverCrook_Range type = grind Nollie = yes NoBlend = <NoBlend>
        grindbail = FiftyFiftyFall ExtraTricks = Extra_FS_Grinds IsExtra = <IsExtra>
        SparksPos = front OneFoot = back}
endscript

script Trick_Overcrook_BS \{ name = "BS Overcrook" }
    grind {name = <name> Score = 125 GrindTweak = 9 InitAnim = Init_BSOverCrook InitSpeed = 1.500 anim = BSOverCrook_Range type = grind Nollie = yes NoBlend = <NoBlend>
        grindbail = FiftyFiftyFall ExtraTricks = Extra_BS_Grinds IsExtra = <IsExtra>
        SparksPos = front OneFoot = back}
endscript

script Trick_Overcrook_FS_180 
    FlipAndRotate
    goto \{Trick_Overcrook_BS params = { NoBlend = yes }}
endscript

script Trick_Overcrook_BS_180 
    FlipAndRotate
    goto \{Trick_Overcrook_FS params = { NoBlend = yes }}
endscript

script Trick_Smith_FS \{ name = "FS Smith" }
    grind {name = <name> Score = 125 GrindTweak = 9 InitAnim = Init_FSSmith InitSpeed = 1.500 anim = FSSmith_Range type = grind NoBlend = <NoBlend>
        grindbail = FiftyFiftyFall ExtraTricks = Extra_FS_Grinds IsExtra = <IsExtra>
        SparksPos = front OneFoot = front}
endscript

script Trick_Smith_FS_rot 
    rotate
    goto \{ Trick_Smith_FS }
endscript

script Trick_Smith_BS \{ name = "BS Smith" }
    grind {name = <name> Score = 125 GrindTweak = 9 InitAnim = Init_BSSmith InitSpeed = 1.500 anim = BSSmith_Range type = grind NoBlend = <NoBlend>
        grindbail = FiftyFiftyFall ExtraTricks = Extra_BS_Grinds IsExtra = <IsExtra>
        SparksPos = front OneFoot = front}
endscript

script Trick_Smith_FS_180 
    FlipAndRotate
    goto \{Trick_Smith_BS params = { NoBlend = yes }}
endscript

script Trick_Smith_BS_180 
    FlipAndRotate
    goto \{Trick_Smith_FS params = { NoBlend = yes }}
endscript

script Trick_Feeble_FS \{ name = "FS Feeble" }
    grind {name = <name> Score = 125 GrindTweak = 9 InitAnim = Init_FSFeeble InitSpeed = 1.500 anim = FSFeeble_Range type = grind NoBlend = <NoBlend>
        grindbail = FiftyFiftyFall ExtraTricks = Extra_FS_Grinds IsExtra = <IsExtra>
        SparksPos = front OneFoot = front}
endscript

script Trick_Feeble_FS_rot 
    rotate
    goto \{ Trick_Feeble_FS }
endscript

script Trick_Feeble_BS \{ name = "BS Feeble" }
    grind {name = <name> Score = 125 GrindTweak = 9 InitAnim = Init_BSFeeble InitSpeed = 1.500 anim = BSFeeble_Range type = grind NoBlend = <NoBlend>
        grindbail = FiftyFiftyFall ExtraTricks = Extra_BS_Grinds IsExtra = <IsExtra>
        SparksPos = rear OneFoot = front}
endscript

script Trick_Feeble_FS_180 
    FlipAndRotate
    goto \{Trick_Feeble_BS params = { NoBlend = yes }}
endscript

script Trick_Feeble_BS_180 
    FlipAndRotate
    goto \{Trick_Feeble_FS params = { NoBlend = yes }}
endscript

script Trick_Bluntslide_BS \{ name = "BS Bluntslide" stall_name = 'BS Blunt Stall' }
    grind {name = <name> stall_name = <stall_name> Score = 250 GrindTweak = 18 InitAnim = Init_BSBluntSlide InitSpeed = 1.500 anim = BSBluntSlide_Range type = slide NoBlend = <NoBlend>
        grindbail = GrindFallLR ExtraTricks = Extra_BS_Grinds IsExtra = <IsExtra>
        SparksPos = rear}
endscript

script Trick_Bluntslide_FS \{ name = "FS Bluntslide" stall_name = 'FS Blunt Stall' }
    grind {name = <name> stall_name = <stall_name> Score = 250 GrindTweak = 18 InitAnim = Init_FSBluntSlide InitSpeed = 1.500 anim = FSBluntSlide_Range type = slide NoBlend = <NoBlend>
        grindbail = BackwardsGrindBails ExtraTricks = Extra_FS_Grinds IsExtra = <IsExtra>
        SparksPos = front}
endscript

script Trick_NoseBluntSlide_BS \{ name = "BS Nosebluntslide" stall_name = 'BS Noseblunt Stall' }
    grind {name = <name> stall_name = <stall_name> Score = 250 GrindTweak = 18 InitAnim = Init_BSNoseBlunt InitSpeed = 1.500 anim = BSNoseBlunt_Range type = slide NoBlend = <NoBlend>
        grindbail = BackwardsGrindBails ExtraTricks = Extra_BS_Grinds IsExtra = <IsExtra> Nollie = yes
        SparksPos = rear}
endscript

script Trick_NoseBluntSlide_FS \{ name = "FS Nosebluntslide" stall_name = 'FS Noseblunt Stall' }
    grind {name = <name> stall_name = <stall_name> Score = 250 GrindTweak = 18 InitAnim = Init_FSNoseBlunt InitSpeed = 1.500 anim = FSNoseBlunt_Range type = slide NoBlend = <NoBlend>
        grindbail = GrindFallLR Nollie = yes IsExtra = <IsExtra> ExtraTricks = Extra_FS_Grinds
        SparksPos = front}
endscript

script Trick_Bluntslide_BS_180 
    FlipAndRotate
    BoardRotateAfter
    goto \{Trick_Bluntslide_BS params = { NoBlend = yes }}
endscript

script Trick_Bluntslide_FS_180 
    rotate
    BoardRotateAfter
    goto \{Trick_Bluntslide_FS params = { NoBlend = yes }}
endscript

script Trick_Nosebluntslide_BS_180 
    rotate
    BoardRotateAfter
    goto \{Trick_NoseBluntSlide_BS params = { NoBlend = yes }}
endscript

script Trick_Nosebluntslide_FS_180 
    rotate
    BoardRotateAfter
    goto \{Trick_NoseBluntSlide_FS params = { NoBlend = yes }}
endscript

script Trick_DoubleBluntSlide2 
    grind {name = 'Double Blunt Slide' Score = GRINDTAP_SCORE InitAnim = DoubleBlunt_Init InitSpeed = 1.500 anim = DoubleBlunt_Idle idle type = slide NoBlend = <NoBlend>
        grindbail = BackwardsGrindBails ExtraTricks = Extra_FS_Grinds IsATap IsExtra = <IsExtra>}
endscript

script Trick_DoubleBluntSlide2_180 
    BackwardsGrind \{ grind = Trick_DoubleBluntSlide2 }
endscript

script Trick_Salad_FS \{ name = "FS Salad" }
    grind {name = <name> InitAnim = FSSaladGrind_Init InitSpeed = 1.500 anim = FSSaladGrind_Range type = grind NoBlend = <NoBlend>
        grindbail = BackwardsGrindBails ExtraTricks = Extra_FS_Grinds IsATap IsExtra = <IsExtra> OneFoot = front}
endscript

script Trick_Salad_BS \{ name = "BS Salad" }
    grind {name = <name> InitAnim = BSSaladGrind_Init InitSpeed = 1.500 anim = BSSaladGrind_Range type = grind NoBlend = <NoBlend>
        grindbail = GrindFallLR ExtraTricks = Extra_BS_Grinds IsATap IsExtra = <IsExtra> OneFoot = front}
endscript

script Trick_Salad_FS_180 
    FlipAndRotate
    goto \{Trick_Salad_BS params = { NoBlend = yes }}
endscript

script Trick_Salad_BS_180 
    FlipAndRotate
    goto \{Trick_Salad_FS params = { NoBlend = yes }}
endscript

script Trick_Hurricane_BS 
    grind {name = 'BS Hurricane' InitAnim = BSHurricaneGrind_Init InitSpeed = 1.500 anim = BSHurricaneGrind_Range OutAnim = Init_TailGrind OutAnimBackwards = 1 NoBlend = <NoBlend>
        grindbail = GrindFallLR Nollie = yes FlipBeforeOutAnim OutAnimOnOllie ExtraTricks = Extra_BS_Grinds IsATap IsExtra = <IsExtra>
        type = grind SparksPos = rear}
endscript

script Trick_Hurricane_FS 
    grind {name = 'FS Hurricane' InitAnim = FSHurricaneGrind_Init InitSpeed = 1.500 anim = FSHurricaneGrind_Range OutAnim = Nollie type = grind NoBlend = NoBlend
        grindbail = BackwardsGrindBails FlipBeforeOutAnim OutAnimOnOllie ExtraTricks = Extra_BS_Grinds IsATap IsExtra = <IsExtra>}
endscript

script Trick_Hurricane_BS_180 
    rotate
    BoardRotateAfter
    goto \{Trick_Hurricane_BS params = { NoBlend = yes }}
endscript

script Trick_Hurricane_FS_180 
    rotate
    BoardRotateAfter
    goto \{Trick_Hurricane_FS params = { NoBlend = yes }}
endscript

script Trick_Darkslide_BS 
    grind {name = 'BS Darkslide' InitAnim = DarkSlide_Init InitSpeed = 1.500 anim = DarkSlide_Range OutAnim = DarkSlide_Out type = slide NoBlend = <NoBlend>
        grindbail = BackwardsGrindBails OutAnimOnOllie boardrotate = yes ExtraTricks = Extra_BS_Grinds IsATap IsExtra = <IsExtra>}
endscript

script Trick_Darkslide_FS 
    grind {name = 'FS Darkslide' InitAnim = FSDarkSlide_Init InitSpeed = 1.500 anim = FSDarkSlide_Range OutAnim = FSDarkSlide_Out type = slide NoBlend = <NoBlend>
        grindbail = BackwardsGrindBails OutAnimOnOllie boardrotate = yes ExtraTricks = Extra_BS_Grinds IsATap IsExtra = <IsExtra>}
endscript

script Trick_Darkslide_BS_180 
    rotate
    BoardRotateAfter
    goto \{Trick_Darkslide_BS params = { NoBlend = yes }}
endscript

script Trick_Darkslide_FS_180 
    rotate
    BoardRotateAfter
    goto \{Trick_Darkslide_FS params = { NoBlend = yes }}
endscript

script Trick_CrailSlide_BS 
    grind {name = 'BS Crail Slide' InitAnim = CrailSlide_Init anim = CrailSlide_Range OutAnim = CrailSlide_Out type = grind NoBlend = <NoBlend>
        grindbail = FiftyFiftyFall ExtraTricks = Extra_BS_Grinds OutAnimOnOllie ExtraTricks = Extra_BS_Grinds IsATap IsExtra = <IsExtra>}
endscript

script Trick_CrailSlide_FS 
    grind {name = 'FS Crail Slide' InitAnim = CrailSlide_Init anim = CrailSlide_Range OutAnim = CrailSlide_Out type = grind NoBlend = <NoBlend>
        grindbail = FiftyFiftyFall ExtraTricks = Extra_FS_Grinds OutAnimOnOllie ExtraTricks = Extra_BS_Grinds IsATap IsExtra = <IsExtra>}
endscript

script Trick_CrailSlide_BS_180 
    rotate
    BoardRotateAfter
    goto \{Trick_CrailSlide_BS params = { NoBlend = yes }}
endscript

script Trick_CrailSlide_FS_180 
    rotate
    BoardRotateAfter
    goto \{Trick_CrailSlide_FS params = { NoBlend = yes }}
endscript

script Trick_GrindOverturn_BS 
    grind {name = 'BS 5-0 Overturn' InitAnim = GrindOverturn_Init anim = GrindOverturn_Range OutAnim = Init_NoseGrind OutAnimBackwards = 1 NoBlend = <NoBlend>
        grindbail = FiftyFiftyFall FlipBeforeOutAnim ExtraTricks = Extra_BS_Grinds Nollie = 1 ExtraTricks = Extra_BS_Grinds IsATap IsExtra = <IsExtra>
        type = grind SparksPos = rear}
endscript

script Trick_GrindOverturn_FS 
    grind {name = 'FS 5-0 Overturn' InitAnim = GrindOverturn_Init anim = GrindOverturn_Range OutAnim = Init_NoseGrind OutAnimBackwards = 1 NoBlend = <NoBlend>
        grindbail = FiftyFiftyFall FlipBeforeOutAnim ExtraTricks = Extra_FS_Grinds Nollie = 1 ExtraTricks = Extra_BS_Grinds IsATap IsExtra = <IsExtra>
        type = grind SparksPos = rear}
endscript

script Trick_GrindOverturn_BS_180 
    rotate
    BoardRotateAfter
    goto \{Trick_GrindOverturn_BS params = { NoBlend = yes }}
endscript

script Trick_GrindOverturn_FS_180 
    rotate
    BoardRotateAfter
    goto \{Trick_GrindOverturn_FS params = { NoBlend = yes }}
endscript

script Trick_HangTenNoseGrind_BS 
    grind {name = 'Hang Ten Nosegrind' InitAnim = HangTenNoseGrind_Init InitSpeed = 1.500 anim = HangTenNoseGrind_Range OutAnim = HangTenNoseGrind_Out type = grind NoBlend = <NoBlend>
        grindbail = FiftyFiftyFall ExtraTricks = Extra_BS_Grinds Nollie ExtraTricks = Extra_BS_Grinds IsATap IsExtra = <IsExtra>}
endscript

script Trick_HangTenNoseGrind_FS 
    grind {name = 'Hang Ten Nosegrind' InitAnim = HangTenNoseGrind_Init InitSpeed = 1.500 anim = HangTenNoseGrind_Range OutAnim = HangTenNoseGrind_Out type = grind NoBlend = <NoBlend>
        grindbail = FiftyFiftyFall ExtraTricks = Extra_FS_Grinds Nollie ExtraTricks = Extra_BS_Grinds IsATap IsExtra = <IsExtra>}
endscript

script Trick_HangTenNoseGrind_BS_180 
    rotate
    BoardRotateAfter
    goto \{Trick_HangTenNoseGrind_BS params = { NoBlend = yes }}
endscript

script Trick_HangTenNoseGrind_FS_180 
    rotate
    BoardRotateAfter
    goto \{Trick_HangTenNoseGrind_FS params = { NoBlend = yes }}
endscript

script Trick_NosegrindPivot_BS 
    grind {name = 'Nosegrind to Pivot' InitAnim = NosegrindPivot_Init InitSpeed = 1.750 anim = NosegrindPivot_Range OutAnim = Init_TailGrind OutAnimBackwards = 1 NoBlend = NoBlend
        grindbail = FiftyFiftyFall boardrotate = yes FlipBeforeOutAnim EarlyOut = Init_TailGrind ExtraTricks = Extra_BS_Grinds IsATap IsExtra = <IsExtra>
        type = grind SparksPos = front}
endscript

script Trick_NosegrindPivot_FS 
    goto \{Trick_NosegrindPivot_BS params = { IsExtra = IsExtra }}
endscript

script Trick_NosegrindPivot_BS_180 
    rotate
    BoardRotateAfter
    goto \{Trick_NosegrindPivot_BS params = { NoBlend = yes }}
endscript

script Trick_NosegrindPivot_FS_180 
    goto \{ Trick_NosegrindPivot_BS_180 }
endscript

script Trick_RocketTail2 \{ name = "Rockettail Shove" }
    grind {name = <name> Score = 600 InitAnim = Special_Bob_RocketShoveIt_Init idle anim = Special_Bob_RocketShoveIt_Idle type = slide NoBlend = <NoBlend>
        grindbail = GrindFallLR IsSpecial ExtraTricks = Extra_FS_Grinds IsExtra = <IsExtra>
        SparkPos = rear}
endscript

script Trick_OvercrookToTail2 \{ name = "Overcrook Nollieflip to Tail" }
    grind {name = <name> Score = 600 InitAnim = Special_Sheckler_OCNOFLtoTail_In anim = FSTailSlide_Range OutAnim = FSTailSlide_Out type = slide NoBlend = <NoBlend>
        grindbail = GrindFallLR IsSpecial ExtraTricks = Extra_FS_Grinds IsExtra = <IsExtra>
    }
endscript

script Trick_BluntTrip2 \{ name = "Blunt Trip" }
    grind {name = <name> Score = 600 InitAnim = Init_BSBluntSlide InitSpeed = 1.500 anim = BSBluntSlide_Range type = slide NoBlend = <NoBlend>
        grindbail = GrindFallLR IsSpecial ExtraTricks = Extra_FS_Grinds IsExtra = <IsExtra> TrickSpawnscript = AndrewRTripy
        SparkPos = rear}
endscript

script Trick_ComboGrind2 \{ name = "5-0 K" }
    grind {name = <name> Score = 600 InitAnim = Special_Williams_ComboGrind_Init idle anim = Special_Williams_ComboGrind_Idle type = grind NoBlend = <NoBlend>
        grindbail = FiftyFiftyFall IsSpecial ExtraTricks = Extra_FS_Grinds IsExtra = <IsExtra>
        SparkPos = rear}
endscript

script Trick_HulaHoop2 
    grind {name = 'Hula Hoopin' Score = 500 InitAnim = HulaHoopGrind_Init anim = HulaHoopGrind_Idle idle OutAnim = HulaHoopGrind_Out type = grind NoBlend = <NoBlend> OutAnimOnOllie
        grindbail = FiftyFiftyFall IsSpecial specialitem_details = Hulahoop_details}
endscript

script Trick_RobotGrind2 
    grind {name = 'RobotGrind' Score = 500 InitAnim = Special_LiLJon_Robot_Init anim = Special_LiLJon_Robot_Idle idle type = grind NoBlend = <NoBlend> OutAnimOnOllie
        grindbail = FiftyFiftyFall IsSpecial}
endscript

script Trick_HulaHoop2_180 
    rotate
    BoardRotateAfter
    goto \{Trick_HulaHoop2 params = { NoBlend = yes }}
endscript

script Trick_Muska_Burn_BS \{ name = "BS Muska 5-0 Flames" }
    grind {name = <name> Score = 600 InitAnim = Special_Muska_Burn_init anim = Special_Muska_Burn_Range OutAnim = Special_Muska_Burn_Out type = grind NoBlend = <NoBlend>
        grindbail = FiftyFiftyFall IsSpecial ExtraTricks = Extra_BS_Grinds IsExtra = <IsExtra>
        SparkPos = rear stream = Spec_Muska01}
endscript

script Trick_Muska_Burn_FS \{ name = "FS Muska 5-0 Flames" }
    grind {name = <name> Score = 600 InitAnim = Special_Muska_Burn_init anim = Special_Muska_Burn_Range OutAnim = Special_Muska_Burn_Out type = grind NoBlend = <NoBlend>
        grindbail = FiftyFiftyFall IsSpecial ExtraTricks = Extra_FS_Grinds IsExtra = <IsExtra> stream = Spec_Muska01}
endscript

script Trick_Muska_Burn_BS_180 
    FlipAndRotate
    BoardRotateAfter
    goto \{Trick_Muska_Burn_BS params = { NoBlend = yes }}
endscript

script Trick_Muska_Burn_FS_180 
    FlipAndRotate
    BoardRotateAfter
    goto \{Trick_Muska_Burn_FS params = { NoBlend = yes }}
endscript

script Trick_Worm_BS \{ name = "BS Worm" }
    grind {name = <name> Score = 600 InitAnim = Special_Muska_Worm_Init anim = Special_Muska_Worm_Idle idle OutAnim = Special_Muska_Worm_Out type = grind NoBlend = <NoBlend>
        grindbail = FiftyFiftyFall IsSpecial ExtraTricks = Extra_BS_Grinds IsExtra = <IsExtra>
        SparkPos = rear stream = Spec_Muska02}
endscript

script Trick_Worm_FS \{ name = "FS Worm" }
    grind {name = <name> Score = 600 InitAnim = Special_Muska_Worm_Init anim = Special_Muska_Worm_Idle idle OutAnim = Special_Muska_Worm_Out type = grind NoBlend = <NoBlend>
        grindbail = FiftyFiftyFall IsSpecial ExtraTricks = Extra_FS_Grinds IsExtra = <IsExtra> stream = Spec_Muska02}
endscript

script Trick_Worm_BS_180 
    FlipAndRotate
    BoardRotateAfter
    goto \{Trick_Worm_BS params = { NoBlend = yes }}
endscript

script Trick_Worm_FS_180 
    FlipAndRotate
    BoardRotateAfter
    goto \{Trick_Worm_FS params = { NoBlend = yes }}
endscript

script Trick_Bam_Chainsaw_BS \{ name = "BS Chainsaw Rocker" }
    grind {name = <name> Score = 600 InitAnim = Special_Bam_Chainsaw_Init anim = Special_Bam_Chainsaw_Idle idle OutAnim = Special_Bam_Chainsaw_Out type = slide NoBlend = <NoBlend>
        grindbail = GrindFallLR IsSpecial IsExtra = <IsExtra> SparkPos = rear specialitem_details = Chainsaw_details stream = Spec_Margera02}
endscript

script Trick_Bam_Chainsaw_FS \{ name = "FS Chainsaw Rocker" }
    grind {name = <name> Score = 600 InitAnim = Special_Bam_Chainsaw_Init anim = Special_Bam_Chainsaw_Idle idle OutAnim = Special_Bam_Chainsaw_Out type = slide NoBlend = <NoBlend>
        grindbail = GrindFallLR IsSpecial IsExtra = <IsExtra> specialitem_details = Chainsaw_details stream = Spec_Margera02}
endscript

script Trick_Bam_Chainsaw_BS_180 
    FlipAndRotate
    BoardRotateAfter
    goto \{Trick_Bam_Chainsaw_BS params = { NoBlend = yes }}
endscript

script Trick_Bam_Chainsaw_FS_180 
    FlipAndRotate
    BoardRotateAfter
    goto \{Trick_Bam_Chainsaw_FS params = { NoBlend = yes }}
endscript

script Trick_ShecklerPrimo_BS \{ name = "BS Shark" }
    grind {name = <name> Score = 600 InitAnim = Special_Sheckler_Primo_Init anim = Special_Sheckler_Primo_Range OutAnim = Special_Sheckler_Primo_Out type = grind NoBlend = <NoBlend>
        grindbail = FiftyFiftyFall IsSpecial IsExtra = <IsExtra> SparkPos = rear specialitem_details = Shark_details stream = Spec_Sheckler02}
endscript

script Trick_ShecklerPrimo_FS \{ name = "FS Shark" }
    grind {name = <name> Score = 600 InitAnim = Special_Sheckler_Primo_Init anim = Special_Sheckler_Primo_Range OutAnim = Special_Sheckler_Primo_Out type = grind NoBlend = <NoBlend>
        grindbail = FiftyFiftyFall IsSpecial IsExtra = <IsExtra> specialitem_details = Shark_details stream = Spec_Sheckler02}
endscript

script Trick_ShecklerPrimo_BS_180 
    FlipAndRotate
    BoardRotateAfter
    goto \{Trick_ShecklerPrimo_BS params = { NoBlend = yes }}
endscript

script Trick_ShecklerPrimo_FS_180 
    FlipAndRotate
    BoardRotateAfter
    goto \{Trick_ShecklerPrimo_FS params = { NoBlend = yes }}
endscript

script Trick_Hero_BS \{ name = "BS Hero" }
    grind {name = <name> Score = 600 InitAnim = Special_Soldier_AmerHero2_Init anim = Special_Soldier_AmerHero2_Idle idle OutAnim = Special_Soldier_AmerHero2_Out type = grind NoBlend = <NoBlend>
        grindbail = FiftyFiftyFall IsSpecial ExtraTricks = Extra_BS_Grinds IsExtra = <IsExtra> SparkPos = rear specialitem_details = flag_Details stream = Spec_CallofDuty02}
endscript

script Trick_Hero_FS \{ name = "FS Hero" }
    grind {name = <name> Score = 600 InitAnim = Special_Soldier_AmerHero2_Init anim = Special_Soldier_AmerHero2_Idle idle OutAnim = Special_Soldier_AmerHero2_Out type = grind NoBlend = <NoBlend>
        grindbail = FiftyFiftyFall IsSpecial ExtraTricks = Extra_FS_Grinds IsExtra = <IsExtra> specialitem_details = flag_Details stream = Spec_CallofDuty02}
endscript

script Trick_Hero_BS_180 
    FlipAndRotate
    BoardRotateAfter
    goto \{Trick_Hero_BS params = { NoBlend = yes }}
endscript

script Trick_Hero_FS_180 
    FlipAndRotate
    BoardRotateAfter
    goto \{Trick_Hero_FS params = { NoBlend = yes }}
endscript

script Trick_RockNRollSwitch_BS \{ name = "BS Lip Bodyvarial" }
    grind {name = <name> Score = 600 InitAnim = Special_Bob_RockNRollswitch_Init anim = Special_Bob_RockNRollswitch_Idle idle OutAnim = Special_Bob_RockNRollswitch_Out type = slide NoBlend = <NoBlend>
        grindbail = GrindFallLR IsSpecial ExtraTricks = Extra_BS_Grinds IsExtra = <IsExtra> SparkPos = rear stream = Spec_Burnquist02}
endscript

script Trick_RockNRollSwitch_FS \{ name = "FS Board Bodyvarial" }
    grind {name = <name> Score = 600 InitAnim = Special_Bob_RockNRollswitch_Init anim = Special_Bob_RockNRollswitch_Idle idle OutAnim = Special_Bob_RockNRollswitch_Out type = slide NoBlend = <NoBlend>
        grindbail = GrindFallLR IsSpecial ExtraTricks = Extra_FS_Grinds IsExtra = <IsExtra> stream = Spec_Burnquist02}
endscript

script Trick_RockNRollSwitch_BS_180 
    FlipAndRotate
    BoardRotateAfter
    goto \{Trick_RockNRollSwitch_BS params = { NoBlend = yes }}
endscript

script Trick_RockNRollSwitch_FS_180 
    FlipAndRotate
    BoardRotateAfter
    goto \{Trick_RockNRollSwitch_FS params = { NoBlend = yes }}
endscript

script Trick_Shortbus2 
    grind {name = 'Stupid Grind' Score = 500 InitAnim = Shortbus_Init anim = Shortbus_Idle idle OutAnim = Shortbus_Out type = grind NoBlend = <NoBlend>
        grindbail = FiftyFiftyFall Nollie = yes IsSpecial OutAnimOnOllie ExtraTricks = Extra_BS_Grinds ExtraTricks = Extra_BS_Grinds IsExtra = <IsExtra>}
endscript

script Trick_Shortbus2_180 
    rotate
    BoardRotateAfter
    goto \{Trick_Shortbus2 params = { NoBlend = yes }}
endscript

script Trick_RodneyGrind2 
    grind {name = 'Rodney Primo' Score = 500 InitAnim = RodneyGrind_Init anim = RodneyGrind_Range OutAnim = RodneyGrind_Out type = grind boardrotate = yes
        grindbail = FiftyFiftyFall Nollie = yes IsSpecial InitSpeed = 0.7000 OutAnimOnOllie ExtraTricks = Extra_BS_Grinds IsExtra = <IsExtra>}
endscript

script Trick_GrindNBarf2 
    grind {name = 'Grind N Barf' InitSpeed = 1.500 Score = 500 InitAnim = GrindNBarf_Init anim = GrindNBarf_Range OutAnim = GrindNBarf_Out type = grind boardrotate = yes
        grindbail = FiftyFiftyFall Nollie = yes IsSpecial OutAnimOnOllie stream = DryHeaveSpecial ExtraTricks = Extra_BS_Grinds IsExtra = <IsExtra>}
endscript

script Trick_RowleyDarkSlideHandStand2 
    grind {name = 'Darkslide Handstand' Score = 700 InitAnim = RowleyDarkSlideHandStand_Init anim = RowleyDarkSlideHandStand_Range OutAnim = RowleyDarkSlideHandStand_Out type = slide NoBlend = yes
        grindbail = FiftyFiftyFall IsSpecial OutAnimOnOllie ExtraTricks = Extra_BS_Grinds IsExtra = <IsExtra>}
endscript

script Trick_RowleyDarkSlideHandStand2_180 
    rotate
    BoardRotateAfter
    goto \{Trick_RowleyDarkSlideHandStand2 params = { NoBlend = yes }}
endscript

script Trick_PrimoHandStand2 
    grind {name = 'Primo Handstand' Score = 700 InitAnim = PrimoHandStand_Init anim = PrimoHandStand_Range OutAnim = PrimoHandStand_Out type = slide NoBlend = yes
        grindbail = FiftyFiftyFall IsSpecial OutAnimOnOllie IsSpecial stream = nj_pipeignite ExtraTricks = Extra_BS_Grinds IsExtra = <IsExtra>}
endscript

script Trick_PrimoHandStand2_180 
    rotate
    BoardRotateAfter
    goto \{Trick_PrimoHandStand2 params = { NoBlend = yes }}
endscript

script Trick_OneFootDarkSlide2 
    grind {name = 'One Foot Darkslide' Score = 600 InitAnim = OneFootDarkslide_Init anim = OneFootDarkslide_Range OutAnim = OneFootDarkslide_Out type = slide NoBlend = yes
        grindbail = GrindFallLR IsSpecial OutAnimOnOllie ExtraTricks = Extra_BS_Grinds IsExtra = <IsExtra>}
endscript

script Trick_OneFootDarkslide2_180 
    rotate
    BoardRotateAfter
    goto \{Trick_OneFootDarkSlide2 params = { NoBlend = yes }}
endscript

script Trick_FiftyFiftySwitcheroo2 
    grind {name = '5050 Switcheroo' Score = 600 InitAnim = FiftyFiftySwitcheroo_Init anim = FiftyFiftySwitcheroo_Idle idle type = grind
        grindbail = FiftyFiftyFall IsSpecial Speed = 3 ExtraTricks = Extra_BS_Grinds IsExtra = <IsExtra>}
endscript

script Trick_HCNHDF2 
    grind {name = 'Crooks DarkSlide' Score = 700 InitAnim = HCNHDF_Init anim = HCNHDF_Range OutAnim = HCNHDF_Out InitSpeed = 1.500 type = slide NoBlend = yes
        grindbail = BackwardsGrindBails IsSpecial OutAnimOnOllie ExtraTricks = Extra_BS_Grinds IsExtra = <IsExtra>}
endscript

script Trick_HCNHDF2_180 
    rotate
    BoardRotateAfter
    goto \{Trick_HCNHDF2 params = { NoBlend = yes }}
endscript

script Trick_FSNollie360FlipCrook2 
    grind {name = 'Nollie 360flip Crook' Score = 600 InitAnim = FSNollie360FlipCrook_Init anim = FSNollie360FlipCrook_Range OutAnim = FSNollie360FlipCrook_Out type = grind NoBlend = yes
        grindbail = FiftyFiftyFall IsSpecial OutAnimOnOllie ExtraTricks = Extra_BS_Grinds IsExtra = <IsExtra>}
endscript

script Trick_FSNollie360FlipCrook2_180 
    rotate
    BoardRotateAfter
    goto \{Trick_FSNollie360FlipCrook2 params = { NoBlend = yes }}
endscript

script Trick_MoonwalkGrind2 
    grind {name = 'Moonwalk Five-O' Score = 600 InitAnim = MoonwalkGrind_Init anim = MoonwalkGrind_Idle idle OutAnim = MoonwalkGrind_Out type = grind NoBlend = yes
        grindbail = BackwardsGrindBails IsSpecial OutAnimOnOllie ExtraTricks = Extra_BS_Grinds IsExtra = <IsExtra>}
endscript

script Trick_MoonwalkGrind2_180 
    rotate
    BoardRotateAfter
    goto \{Trick_MoonwalkGrind2 params = { NoBlend = yes }}
endscript

script Trick_360ShovitNoseGrind2 
    grind {name = '360 Shove-It NoseGrind' Score = 600 InitAnim = _360ShovItNoseGrind_Init anim = _360ShovItNoseGrind_Range InitSpeed = 2.0 OutAnim = _360ShovItNoseGrind_Out type = grind NoBlend = yes
        grindbail = FiftyFiftyFall IsSpecial OutAnimOnOllie ExtraTricks = Extra_BS_Grinds IsExtra = <IsExtra>}
endscript

script Trick_360ShovitNoseGrind2_180 
    rotate
    BoardRotateAfter
    goto \{Trick_360ShovitNoseGrind2 params = { NoBlend = yes }}
endscript

script Trick_Coffin_BS 
    grind {name = 'BS Coffin' Score = 500 InitAnim = CoffinGrind_Init anim = CoffinGrind_Range OutAnim = CoffinGrind_Out type = grind NoBlend = <NoBlend>
        grindbail = FiftyFiftyFall IsSpecial OutAnimOnOllie ExtraTricks = Extra_BS_Grinds IsExtra = <IsExtra>}
endscript

script Trick_Coffin_FS 
    grind {name = 'FS Coffin' Score = 500 InitAnim = CoffinGrind_Init anim = CoffinGrind_Range OutAnim = CoffinGrind_Out type = grind NoBlend = <NoBlend>
        grindbail = FiftyFiftyFall IsSpecial OutAnimOnOllie ExtraTricks = Extra_BS_Grinds IsExtra = <IsExtra>}
endscript

script Trick_Coffin_BS_180 
    rotate
    BoardRotateAfter
    goto \{Trick_Coffin_BS params = { NoBlend = yes }}
endscript

script Trick_Coffin_FS_180 
    rotate
    BoardRotateAfter
    goto \{Trick_Coffin_FS params = { NoBlend = yes }}
endscript

script Trick_fandangle_BS 
    grind {name = 'BS Fandangle' Score = 500 InitAnim = Fandangle_Init anim = Fandangle_Range OutAnim = Fandangle_Out type = grind NoBlend = <NoBlend>
        grindbail = FiftyFiftyFall IsSpecial ExtraTricks = Extra_BS_Grinds OutAnimOnOllie boardrotate = yes ExtraTricks = Extra_FS_Grinds IsExtra = <IsExtra>}
endscript

script Trick_fandangle_FS 
    grind {name = 'FS Fandangle' Score = 500 InitAnim = Fandangle_Init anim = Fandangle_Range OutAnim = Fandangle_Out type = grind NoBlend = <NoBlend>
        grindbail = FiftyFiftyFall IsSpecial ExtraTricks = Extra_FS_Grinds OutAnimOnOllie boardrotate = yes ExtraTricks = Extra_FS_Grinds IsExtra = <IsExtra>}
endscript

script Trick_fandangle_BS_180 
    rotate
    BoardRotateAfter
    goto \{Trick_fandangle_BS params = { NoBlend = yes }}
endscript

script Trick_fandangle_FS_180 
    rotate
    BoardRotateAfter
    goto \{Trick_fandangle_FS params = { NoBlend = yes }}
endscript

script Trick_BigHitter_BS \{ ExtraTricks = Extra_BS_Grinds }
    grind {name = 'Big Hitter II' Score = 500 InitAnim = BigHitter_Init anim = BigHitter_Range OutAnim = BigHitter_Out type = slide NoBlend = <NoBlend>
        grindbail = GrindFallLR IsSpecial ExtraTricks = <ExtraTricks> OutAnimOnOllie}
endscript

script Trick_BigHitter_FS 
    goto \{Trick_BigHitter_BS params = { ExtraTricks = Extra_FS_Grinds }}
endscript

script Trick_BigHitter_BS_180 
    rotate
    BoardRotateAfter
    goto \{Trick_BigHitter_BS params = { NoBlend = yes }}
endscript

script Trick_BigHitter_FS_180 
    goto \{ Trick_BigHitter_BS_180 }
endscript

script Trick_TailblockSlide_BS 
    grind {name = 'BS Tailblock Slide' Score = 500 InitAnim = TailblockSlide_Init anim = TailblockSlide_Range OutAnim = TailblockSlide_Init type = slide NoBlend = <NoBlend>
        grindbail = FiftyFiftyFall IsSpecial ExtraTricks = Extra_BS_Grinds}
endscript

script Trick_TailblockSlide_FS 
    grind {name = 'FS Tailblock Slide' Score = 500 InitAnim = TailblockSlide_Init anim = TailblockSlide_Range OutAnim = TailblockSlide_Init type = slide NoBlend = <NoBlend>
        grindbail = FiftyFiftyFall IsSpecial ExtraTricks = Extra_FS_Grinds}
endscript

script Trick_TailblockSlide_BS_180 
    rotate
    BoardRotateAfter
    goto \{Trick_TailblockSlide_BS params = { NoBlend = yes }}
endscript

script Trick_TailblockSlide_FS_180 
    goto \{ Trick_TailblockSlide_BS_180 }
endscript

script Trick_NoseSlideLipSlide_FS 
    if badledge
        goto \{ Trick_NoseSlideLipSlide_BS_ok }
    else
        goto \{ Trick_NoseSlideLipSlide_FS_ok }
    endif
endscript

script Trick_NoseSlideLipSlide_FS_ok \{ name = "FS Noseslide LipSlide" }
    grind {name = <name> Score = 500 InitAnim = FSNoseSlideLipSlide anim = BSBoardSlide_Range Nollie = yes NoBlend = <NoBlend>
        grindbail = FiftyFiftyFall ExtraTricks = Extra_FS_Grinds IsSpecial IsExtra = <IsExtra>
        type = slide SparkPos = front}
endscript

script Trick_NoseSlideLipSlide_BS 
    if badledge
        goto \{ Trick_NoseSlideLipSlide_FS_ok }
    else
        goto \{ Trick_NoseSlideLipSlide_BS_ok }
    endif
endscript

script Trick_NoseSlideLipSlide_BS_ok \{ name = "BS NoseSlide LipSlide" }
    grind {name = <name> Score = 500 InitAnim = BSNoseSlideLipSlide anim = FSBoardSlide_Range Nollie = yes NoBlend = <NoBlend>
        grindbail = FiftyFiftyFall ExtraTricks = Extra_BS_Grinds IsSpecial IsExtra = <IsExtra>
        type = slide SparkPos = rear}
endscript

script Trick_NoseSlideLipSlide_FS_180 
    FlipAndRotate
    BoardRotateAfter
    goto \{Trick_NoseSlideLipSlide_BS params = { NoBlend = yes }}
endscript

script Trick_NoseSlideLipSlide_BS_180 
    FlipAndRotate
    BoardRotateAfter
    goto \{Trick_NoseSlideLipSlide_FS params = { NoBlend = yes }}
endscript

script Trick_CrookedBigSpin_BS 
    grind {name = 'Crook BigSpinFlip Switch FS Crook' Score = 500 special_item InitAnim = CrookBigSpinFlipCrook anim = FSCrooked_Range OutAnim = Init_FSCrooked OutAnimBackwards type = grind NoBlend = <NoBlend>
        grindbail = BackwardsGrindBails IsSpecial FlipAfterInit ExtraTricks = Extra_FS_Grinds IsExtra = <IsExtra>}
endscript

script Trick_CrookedBigSpin_FS 
    goto \{Trick_CrookedBigSpin_BS params = { NoBlend = yes name = "Overcrook BigSpinFlip Overcrook" }}
endscript

script Trick_CrookedBigSpin_BS_180 
    rotate
    BoardRotateAfter
    goto \{Trick_CrookedBigSpin_BS params = { NoBlend = yes }}
endscript

script Trick_CrookedBigSpin_FS_180 
    goto \{ Trick_CrookedBigSpin_BS_180 }
endscript

script Trick_50Fingerflip2 
    grind {name = '5-0 Fingerflip Nosegrind' Score = 500 InitAnim = TailGrindFingerFlip anim = NoseGrind_Range type = grind NoBlend = <NoBlend>
        grindbail = FiftyFiftyFall IsSpecial ExtraTricks = Extra_BS_Grinds}
endscript

script Trick_50Fingerflip2_180 
    BackwardsGrind \{ grind = Trick_50Fingerflip2 }
endscript

script Trick_ElbowSmash2 
    grind {name = 'Elbow Smash' Score = 500 InitAnim = ElbowSmash_Init anim = ElbowSmash_Idle idle OutAnim = ElbowSmash_Out OutAnimOnOllie type = slide NoBlend = <NoBlend> idle
        grindbail = FiftyFiftyFall IsSpecial}
endscript

script Trick_ElbowSmash2_180 
    rotate
    BoardRotateAfter
    goto \{Trick_ElbowSmash2 params = { NoBlend = yes }}
endscript

script Trick_OneFootSmith_FS \{ name = "FS One Foot Smith" }
    grind {name = <name> Score = 500 InitAnim = SmithFS_Init anim = SmithFS_Range type = slide NoBlend = <NoBlend>
        grindbail = GrindFallLR ExtraTricks = Extra_FS_Grinds IsSpecial IsExtra = <IsExtra>}
endscript

script Trick_OneFootSmith_BS \{ name = "BS One Foot Smith" }
    grind {name = <name> Score = 500 InitAnim = Smith_Init anim = Smith_Range type = grind NoBlend = <NoBlend>
        grindbail = FiftyFiftyFall ExtraTricks = Extra_BS_Grinds IsSpecial IsExtra = <IsExtra>}
endscript

script Trick_OneFootSmith_FS_180 
    FlipAndRotate
    goto \{Trick_OneFootSmith_BS params = { NoBlend = yes }}
endscript

script Trick_OneFootSmith_BS_180 
    FlipAndRotate
    goto \{Trick_OneFootSmith_FS params = { NoBlend = yes }}
endscript

script Trick_OneFooter 
    gettags
    if NOT onrail
        if NOT OnStall
            goto Airborne
        endif
    endif
    switch <OneFoot>
        case front
        anim = FiftyFifty_FrontFootUp
        blendtime = 0.3000
        case back
        anim = FiftyFifty_BackFootUp
        blendtime = 0.3000
        case board
        anim = BSBoardslide_RightFootUp
        blendtime = 0.1000
        case FSBoard
        anim = FSBoardslide_RightFootUp
        blendtime = 0.1000
        default 
        printf 'no onefoot tag'
        return 
    endswitch
    removetags tags = [ OneFoot ]
    Skater_PlayOneFooterAnim anim = <anim> Cycle blendtime = <blendtime>
    GetTrickName
    FormatText textname = trick_text 'One Footed %t' t = <trick_name>
    setgrindtweak GRINDTAP_TWEAK
    SetTrickName <trick_text>
    SetTrickScore 100
    display
    LaunchExtraMessage
    SpawnSkaterScript wait_for_onefooter
endscript

script wait_for_onefooter 
    Skater_WaitAnimFinished
    Skater_OneFooterAnimOff
endscript

script BackwardsGrind 
    rotate
    BoardRotateAfter
    goto <grind> params = { NoBlend = yes }
endscript

script PointRail 
    if bailison
        setstate Air
        goto DoingTrickBail
    endif
    vibrate actuator = 0 percent = 50 duration = 0.1000
    obj_spawnscriptlater PointRailSparks
    broadcastevent type = SkaterPointRail
    Random (@*5 suffix = 'bonked' @*5 suffix = 'tapped' @ suffix = 'kissed' @ suffix = 'cliped' @ suffix = 'dinged')
    FormatText textname = new_name '%s the rail' s = <suffix>
    SetTrickScore 50
    SetTrickName <new_name>
    SetTrickScore 50
    display NoMult
    goto Airborne params = { AllowVibration }
endscript

script PointRailSpin init_anim = Natas_Spin_Init range_anim = Natas_Spin_Range
    if bailison
        setstate Air
        goto DoingTrickBail
    endif
    ClearExceptions
    SetException Ex = Ollied scr = ExitPointRailSpin
    SetException Ex = OffMeterTop scr = PointRailSpinBail
    SetException Ex = OffMeterBottom scr = PointRailSpinBail
    SetException Ex = SkaterCollideBail scr = SkaterCollideBail
    setrailsound slide
    ClearTrickQueues
    if AbilityEnabled ExtraNatas
        SetQueueTricks NatasTricks
    else
        SetQueueTricks NoTricks
    endif
    if SkaterIsNamed Natas
        init_anim = Special_Natas_spin_init
        range_anim = Special_Natas_Spin_Range
    endif
    Skater_Playanim anim = <init_anim>
    Skater_WaitAnimFinished
    if NOT onrail
        goto Airborne
    endif
    LaunchStateChangeEvent state = Skater_OnRail
    dobalancetrick ButtonA = RIGHT ButtonB = left type = grind
    Skater_Playanim anim = <range_anim> Wobble
    SetTrickName ''
    SetTrickScore 0
    display Blockspin
    SetTrickName 'Natas Spin'
    SetTrickScore 50
    display Natas
    vibrate actuator = 1 percent = 50 duration = 0.2500
    vibrate actuator = 0 percent = 50
    OnExitRun Natas_Exit
    begin 
    DoNextTrick
    wait 1 gameframe
    repeat 
endscript
NatasTricks = [
    {
        trigger = { InOrder a = Circle b = Circle 300 }
        scr = Trick_Natas_1
    }
    {
        trigger = { InOrder a = square b = square 300 }
        scr = Trick_Natas_2
    }
    {
        trigger = { InOrder a = triangle b = triangle 300 }
        scr = Trick_Natas_3
    }
]
NatasExitTricks1 = [
    {
        trigger = { InOrder a = Circle b = Circle 300 }
        scr = Trick_Natas_1_exit
    }
    {
        trigger = { InOrder a = square b = square 300 }
        scr = Trick_Natas_1_exit
        params = { callback = Trick_Natas_2 }
    }
    {
        trigger = { InOrder a = triangle b = triangle 300 }
        scr = Trick_Natas_1_exit
        params = { callback = Trick_Natas_3 }
    }
]
NatasExitTricks2 = [
    {
        trigger = { InOrder a = square b = square 300 }
        scr = Trick_Natas_2_exit
    }
    {
        trigger = { InOrder a = Circle b = Circle 300 }
        scr = Trick_Natas_2_exit
        params = { callback = Trick_Natas_1 }
    }
    {
        trigger = { InOrder a = triangle b = triangle 300 }
        scr = Trick_Natas_2_exit
        params = { callback = Trick_Natas_3 }
    }
]
NatasExitTricks3 = [
    {
        trigger = { InOrder a = triangle b = triangle 300 }
        scr = Trick_Natas_3_exit
    }
    {
        trigger = { InOrder a = Circle b = Circle 300 }
        scr = Trick_Natas_3_exit
        params = { callback = Trick_Natas_1 }
    }
    {
        trigger = { InOrder a = square b = square 300 }
        scr = Trick_Natas_3_exit
        params = { callback = Trick_Natas_2 }
    }
]

script Trick_Natas_1 
    Trick_Natas_General \{init_anim = Natas_Hstand_In idle_anim = Natas_Hstand_Range name = "Handstand Spin" Score = 300 exit_tricks = NatasExitTricks1}
endscript

script Trick_Natas_1_exit 
    Trick_Natas_General_exit {
        out_anim = Natas_Hstand_Out
        callback = <callback>
    }
endscript

script Trick_Natas_2 
    Trick_Natas_General \{init_anim = Natas_OneFoot_In idle_anim = Natas_OneFoot_Range name = "One Foot Spin" Score = 300 exit_tricks = NatasExitTricks2}
endscript

script Trick_Natas_2_exit 
    Trick_Natas_General_exit {
        out_anim = Natas_OneFoot_Out
        callback = <callback>
    }
endscript

script Trick_Natas_3 
    Trick_Natas_General \{init_anim = Natas_Lhold_In idle_anim = Natas_Lhold_Range name = "L Spin" Score = 300 exit_tricks = NatasExitTricks3}
endscript

script Trick_Natas_3_exit 
    Trick_Natas_General_exit {
        out_anim = Natas_Lhold_Out
        callback = <callback>
    }
endscript

script Trick_Natas_General 
    if NOT onrail
        goto ongroundai
    endif
    vibrate actuator = 1 percent = 50 duration = 0.2500
    vibrate actuator = 0 percent = 50
    OnExitRun Natas_Exit
    Skater_Playanim anim = <init_anim>
    Skater_WaitAnimFinished
    SetTrickName ''
    SetTrickScore 0
    display Blockspin
    NatasResetRotation
    Skater_Playanim anim = <idle_anim> Wobble
    SetTrickName <name>
    SetTrickScore <Score>
    display Natas
    ClearTrickQueues
    SetQueueTricks <exit_tricks>
    LaunchExtraMessage
    begin 
    DoNextTrick
    wait 1 gameframe
    repeat 
endscript

script Trick_Natas_General_exit 
    vibrate actuator = 1 percent = 50 duration = 0.2500
    vibrate actuator = 0 percent = 50
    OnExitRun Natas_Exit
    NatasResetRotation
    Skater_Playanim anim = <out_anim>
    Skater_WaitAnimFinished
    if GotParam callback
        goto <callback>
    endif
    SetTrickName ''
    SetTrickScore 0
    display Blockspin
    Skater_Playanim anim = Natas_Spin_Range Wobble
    SetTrickName 'Natas Spin'
    SetTrickScore 300
    display Natas
    ClearTrickQueues
    SetQueueTricks NatasTricks
    begin 
    DoNextTrick
    wait 1 gameframe
    repeat 
endscript

script Natas_Exit 
    vibrate \{ actuator = 0 percent = 0 }
    SetTrickName \{ "" }
    SetTrickScore \{ 0 }
    display \{ Blockspin }
endscript
natas_exit_speed = 300

script ExitPointRailSpin 
    stopbalancetrick
    norailtricks
    ClearTrickQueues
    obj_killspawnedscript name = turn_on_rail_tricks
    obj_spawnscriptlater turn_on_rail_tricks
    if uppressed
        if rightpressed
            CheckNatasExitDirection dir = upright
        else
            if leftpressed
                CheckNatasExitDirection dir = upleft
            else
                CheckNatasExitDirection dir = up
            endif
        endif
    else
        if downpressed
            if rightpressed
                CheckNatasExitDirection dir = downright
            else
                if leftpressed
                    CheckNatasExitDirection dir = downleft
                else
                    CheckNatasExitDirection dir = down
                endif
            endif
        else
            if rightpressed
                CheckNatasExitDirection dir = RIGHT
            else
                if leftpressed
                    CheckNatasExitDirection dir = left
                else
                    if GotParam stall
                    endif
                endif
            endif
        endif
    endif
    setspeed natas_exit_speed
    jump
    DoNextTrick
    if IsSkaterOnBike
        bike_Ollie jumpheight = 0
    else
        if IsSkaterOnVehicle
            Vehicle_ollie jumpheight = 0
        else
            ollie OutAnim = Natas_Spin_Out JumpSpeed = 0 BlendOut = 0.1000
        endif
    endif
endscript

script turn_on_rail_tricks \{ time = 10 }
    wait <time> frames
    allowrailtricks
endscript

script PointRailSpinBail 
    setspeed \{ 200 }
    PitchBail
endscript

script PointRailSparks 
    SetSparksPos \{ rear }
    TurnSparksOn \{ RailNotRequired }
    wait \{ 0.2000 seconds }
    TurnSparksOff
endscript

script AndrewRTripy 
    if NOT InMultiPlayerGame
        OnExitRun AndrewRTripy_exit
        SetScreenEffectsBlurParams {
            focus_center = 
            [
                0.5000
                0.5000
            ]
            scales = 
            [
                1.500
                0.0
            ]
            angles = 
            [
                0.0
                1.0
            ]
            inner_color = 
            [
                0.0
                0.0
                0.0
            ]
            inner_alpha = 0.0
            outer_color = 
            [
                1.0
                1.0
                1.0
            ]
            outer_alpha = 0.0
        }
        wait 0.2000 seconds
        begin 
        SetScreenEffectsBlurParams {
            focus_center = 
            [
                0.5000
                0.5000
            ]
            scales = 
            [
                1.500
                0.0
            ]
            angles = 
            [
                240.0
                120.0
            ]
            inner_color = 
            [
                5.0
                0.0
                0.0
            ]
            inner_alpha = 0.0
            outer_color = 
            [
                5.0
                0.0
                0.0
            ]
            outer_alpha = 1.250
            time = 0.2000
        }
        wait 0.2000 seconds
        SetScreenEffectsBlurParams {
            focus_center = 
            [
                0.5000
                0.5000
            ]
            scales = 
            [
                1.500
                0.0
            ]
            angles = 
            [
                120.0
                240.0
            ]
            inner_color = 
            [
                0.0
                5.0
                0.0
            ]
            inner_alpha = 0.0
            outer_color = 
            [
                0.0
                5.0
                0.0
            ]
            outer_alpha = 1.250
            time = 0.2000
        }
        wait 0.2000 seconds
        SetScreenEffectsBlurParams {
            focus_center = 
            [
                0.5000
                0.5000
            ]
            scales = 
            [
                1.500
                0.0
            ]
            angles = 
            [
                0.0
                360.0
            ]
            inner_color = 
            [
                0.0
                0.0
                5.0
            ]
            inner_alpha = 0.0
            outer_color = 
            [
                0.0
                0.0
                5.0
            ]
            outer_alpha = 1.250
            time = 0.2000
        }
        wait 0.2000 seconds
        SetScreenEffectsBlurParams {
            focus_center = 
            [
                0.5000
                0.5000
            ]
            scales = 
            [
                1.500
                0.0
            ]
            angles = 
            [
                120.0
                240.0
            ]
            inner_color = 
            [
                5.0
                0.0
                0.0
            ]
            inner_alpha = 0.0
            outer_color = 
            [
                5.0
                0.0
                0.0
            ]
            outer_alpha = 1.250
            time = 0.2000
        }
        wait 0.2000 seconds
        SetScreenEffectsBlurParams {
            focus_center = 
            [
                0.5000
                0.5000
            ]
            scales = 
            [
                1.500
                0.0
            ]
            angles = 
            [
                240.0
                120.0
            ]
            inner_color = 
            [
                0.0
                5.0
                0.0
            ]
            inner_alpha = 0.0
            outer_color = 
            [
                0.0
                5.0
                0.0
            ]
            outer_alpha = 1.250
            time = 0.2000
        }
        wait 0.2000 seconds
        repeat 
    endif
endscript

script AndrewRTripy_exit 
    SpawnScriptLater \{ global_fx_zoomblur_clear }
endscript
