bail_collision_limbs = [
    Bone_Ankle_R
    Bone_Ankle_L
    Bone_Palm_R
    Bone_Palm_L
    Bone_Head_Top_Scale
]

script DoingTrickBail 
    printf \{ 'TRICKBAIL' }
    goto \{ YawBail }
endscript

script YawBail 
    printf 'YawBail ---------------------------'
    if IsSkaterOnBike
        goto bike_bail
    endif
    if IsSkaterOnVehicle
        goto vehicle_bail
    endif
    dir = forward
    GetActualSpin
    if (0 > <spin>)
        spin = (<spin> * -1)
    endif
    if landedfromvert
        spin = (<spin> + 180)
    endif
    begin 
    if (<spin> > 360)
        spin = (<spin> - 360)
    else
        break 
    endif
    repeat 
    if (45 > <spin>)
        dir = nose
    else
        if (<spin> > 135 & 225 > <spin>)
            dir = tail
        else
            if YawingLeft
                printf 'left'
                if Flipped
                    dir = face
                else
                    dir = back
                endif
            else
                printf 'right'
                if Flipped
                    dir = back
                else
                    dir = face
                endif
            endif
        endif
    endif
    switch <dir>
        case nose
        printf 'nose'
        goto Bail_spin_FWD
        case tail
        printf 'tail'
        goto Bail_Spin_BCK
        case back
        printf 'Zurück'
        goto Bail_spin_CW
        case face
        printf 'face'
        goto Bail_spin_CCW
    endswitch
endscript

script Bail_spin_FWD 
    if landedfromvert
        printf 'Vert'
        if airtimelessthan 1.250 second
            printf 'Regular, Ramp_Ft'
            GotoRandomScript [ Bail_Ramp_Ft ]
        else
            printf 'Hard, Ramp_Ft_Hd'
            GotoRandomScript [ Bail_Ramp_Ft_Hd ]
        endif
    else
        if speedlessthan 500
            if airtimelessthan 1 second
                printf 'Runnout'
                goto Runout
            endif
        endif
        if speedlessthan 600
            printf 'Slow'
            if airtimelessthan 1 second
                printf 'Regular Forward'
                GotoRandomScript [ Bail_Spin_FWD_Regular ]
            else
                printf 'Hard Forward'
                GotoRandomScript [ Bail_Spin_FWD_Hard ]
            endif
        else
            printf 'Fast'
            if airtimelessthan 1 second
                printf 'Fast Forward'
                GotoRandomScript [ Bail_Spin_FWD_Fast ]
            else
                printf 'Hard Forward'
                GotoRandomScript [ Bail_Spin_FWD_Hard ]
            endif
        endif
    endif
endscript

script Bail_Spin_BCK 
    if landedfromvert
        printf 'Vert'
        if airtimelessthan 1.250 second
            printf 'Regular - Ramp_Bk'
            GotoRandomScript [ Bail_Ramp_Bk ]
        else
            printf 'Hard - Ramp_Bk_Hd'
            GotoRandomScript [ Bail_Ramp_Bk_Hd ]
        endif
    else
        if speedlessthan 500
            if airtimelessthan 1 second
                printf 'Runnout'
                goto Runout
            endif
        endif
        if speedlessthan 650
            printf 'Slow'
            if airtimelessthan 1 second
                printf 'Regular Back'
                GotoRandomScript [ Bail_Spin_BCK_Regular ]
            else
                printf 'Hard Back'
                GotoRandomScript [ Bail_Spin_BCK_Hard ]
            endif
        else
            printf 'Fast'
            if airtimelessthan 1 second
                printf 'Fast Back'
                GotoRandomScript [ Bail_Spin_BCK_Fast ]
            else
                printf 'Hard Back'
                GotoRandomScript [ Bail_Spin_BCK_Hard ]
            endif
        endif
    endif
endscript

script Bail_spin_CW 
    if landedfromvert
        printf 'Vert'
        if airtimelessthan 1.250 second
            printf 'Regular - ramp left or front'
            GotoRandomScript [ Bail_Ramp_Lt Bail_Ramp_Ft_Med ]
        else
            printf 'Hard - ramp left'
            GotoRandomScript [ Bail_Ramp_Lt_Med Bail_Ramp_Lt_Hd ]
        endif
    else
        if speedlessthan 500
            if airtimelessthan 1 second
                printf 'Runnout'
                goto Runout
            endif
        endif
        if speedlessthan 600
            printf 'Slow'
            if airtimelessthan 1 second
                printf 'Regular'
                Random (@*4 goto Bail_Spin_CW_Hard_A @ goto Nutsac)
            else
                printf 'Hard'
                GotoRandomScript [ Bail_Spin_CW_Hard_B ]
            endif
        else
            printf 'Fast'
            if airtimelessthan 1 second
                printf 'Regular'
                Random (@*4 goto Bail_Spin_CW_Hard @ goto Nutsac)
            else
                printf 'Hard'
                GotoRandomScript [ Bail_Spin_CW_Hard_B ]
            endif
        endif
    endif
endscript

script Bail_spin_CCW 
    if landedfromvert
        printf 'Vert'
        if airtimelessthan 1.250 second
            printf 'Regular - ramp front or right, or spin back regular'
            GotoRandomScript [ Bail_Ramp_Ft Bail_Ramp_Rt Bail_Spin_BCK_Regular ]
        else
            printf 'Hard - front or right'
            GotoRandomScript [ Bail_Ramp_Ft_Hd Bail_Ramp_Rt_Hd ]
        endif
    else
        if speedlessthan 500
            if airtimelessthan 1 second
                printf 'Runnout'
                goto Runout
            endif
        endif
        if speedlessthan 600
            printf 'Slow'
            if airtimelessthan 1 second
                printf 'Regular'
                Random (@*4 goto Bail_Spin_CCW_Hard @ goto Nutsac)
            else
                printf 'Hard'
                GotoRandomScript [ Bail_Spin_CCW_Hard_B ]
            endif
        else
            printf 'Fast'
            GotoRandomScript [ Bail_Spin_CCW_Hard_C ]
        endif
    endif
endscript

script PitchBail 
    if IsSkaterOnBike
        goto bike_bail
    endif
    if IsSkaterOnVehicle
        goto vehicle_bail
    endif
    tail_script = Bail_Pitch_Tail
    face_script = Bail_Pitch_Face
    back_script = Bail_Pitch_Back
    nose_script = Bail_Pitch_Nose
    if NOT InSplitScreenGame
        if GetGlobalFlag flag = TAP_BUTTONS_EXPLAINED
            if NOT GetGlobalFlag flag = RECOVERY_BUTTONS_EXPLAINED
                create_panel_message {text = 'Drück \ml in der Luft, um nicht zu stürzen.'
                    id = skater_hint
                    style = skater_hint_style
                    Pos = (320.0, 200.0)
                    rgba = [ 32 75 102 100 ]
                }
                SetGlobalFlag flag = RECOVERY_BUTTONS_EXPLAINED
            endif
        endif
    endif
    turntofacevelocity
    GetLastGroundHeading
    GetHeading
    dif = (<heading> - <last_heading>)
    begin 
    if (<dif> > 180)
        dif = (360 - <dif>)
    else
        if (-180 > <dif>)
            dif = (360 + <dif>)
        else
            break 
        endif
    endif
    repeat 
    printf 'heading=%i last_heading=%j' i = <heading> j = <last_heading>
    printf 'dif =============== %k' k = <dif>
    if Flipped
        if (0 > <dif>)
            printf 'flip1'
            flip
            flipped_skater = 1
        endif
    else
        if (<dif> > 0)
            printf 'flip2'
            flip
            flipped_skater = 1
        endif
    endif
    GetPitchBailDir
    switch <pitch_bail_dir>
        case nose
        pitch_script = <nose_script>
        case tail
        pitch_script = <tail_script>
        case left
        if Flipped
            pitch_script = <back_script>
        else
            pitch_script = <face_script>
        endif
        case RIGHT
        if Flipped
            pitch_script = <face_script>
        else
            pitch_script = <back_script>
        endif
        default 
        pitch_script = <face_script>
    endswitch
    if GotParam flipped_skater
        switch <pitch_script>
            case <back_script>
            pitch_script = <face_script>
            case <face_script>
            pitch_script = <back_script>
        endswitch
    endif
    if GotParam pitch_script
        MakeSkaterGoto <pitch_script>
    endif
endscript

script FiftyFiftyFall 
    printf \{ 'Grind Bail 50-50' }
    switch <dir>
        case forward
        printf \{ 'bailed Left' }
        GotoRandomScript \{[ Bail_Falling_LT ]}
        case backward
        printf \{ 'bailed Right' }
        GotoRandomScript \{[ Bail_Falling_RT ]}
        default 
        printf \{ 'Standard' }
        GotoRandomScript \{[ Bail_Falling_FWD ]}
    endswitch
endscript

script GrindFallLR 
    if obj_getcollision down distance = 0 height = 0 Length = 2.500 shift = 0.5000
        printf 'too low'
        no_nutter = 1
    endif
    if ledge
        printf 'Ledge'
        no_nutter = 1
    endif
    if GotParam no_nutter
        goto GrindBailFacingForwards params = { dir = <dir> }
    else
        Random (@ goto GrindBailFacingForwards params = { dir = <dir> }@*3 goto Nutter)
    endif
endscript

script GrindBailFacingForwards 
    printf \{ 'Grind Bail Forwards' }
    switch <dir>
        case forward
        printf \{ 'bailed left' }
        GotoRandomScript \{[ Bail_Falling_Slide_FWD_lt ]}
        case backward
        printf \{ 'bailed right' }
        GotoRandomScript \{[ Bail_Falling_Slide_FWD_rt ]}
        default 
        printf \{ 'Standard' }
        GotoRandomScript \{[ Bail_Falling_Slide_FWD_lt ]}
    endswitch
endscript

script BackwardsGrindBails 
    if obj_getcollision down distance = 0 height = 0 Length = 2.500 shift = 0.5000
        printf 'too low'
        no_nutter = 1
    endif
    if ledge
        printf 'Ledge'
        no_nutter = 1
    endif
    if GotParam no_nutter
        goto GrindBailFacingBackwards params = { dir = <dir> }
    else
        Random (@ goto GrindBailFacingBackwards params = { dir = <dir> }@*3 goto NutterBackwards)
    endif
endscript

script GrindBailFacingBackwards 
    printf \{ 'Grind Bail Backwards ' }
    switch <dir>
        case forward
        printf \{ 'bailed left' }
        GotoRandomScript \{[ Bail_Falling_Slide_BCK_lt ]}
        case backward
        printf \{ 'bailed right' }
        GotoRandomScript \{[ Bail_Falling_Slide_BCK_rt ]}
        default 
        printf \{ 'Standard' }
        GotoRandomScript \{[ Bail_Falling_Slide_BCK_lt ]}
    endswitch
endscript

script Nutter 
    printf \{ 'Nutter Forwards' }
    GotoRandomScript \{[ Bail_Nutter_FWD ]}
endscript

script NutterBackwards 
    printf \{ 'Nutter Backwards' }
    GotoRandomScript \{[ Bail_Nutter_BCK ]}
endscript

script Runout 
    if speedlessthan \{ 350 }
        printf \{ 'RunOut Quick' }
        GotoRandomScript \{[ RunOutQuick ]}
    else
        printf \{ 'RunOut Regular' }
        Random (@*2 goto \{ Bail_RunOut_New_A }
            @ goto \{ Bail_RunOut_Old })
    endif
endscript

script ManualBail 
    if speedlessthan \{ 600 }
        goto \{ ManualBailSlow }
    else
        goto \{ ManualBailFast }
    endif
endscript

script NoseManualBail 
    if speedlessthan \{ 550 }
        goto \{ NoseManualBailSlow }
    else
        goto \{ NoseManualBailFast }
    endif
endscript

script GeneralBail friction = 18 Friction2 = 20 HeavyFriction = 100
    obj_gettype
    if (<ObjType> = object_type_ped)
        goto Ped_Skater_BeginBail params = <...> 
        return 
    endif
    obj_setboundingsphere 100
    if GotParam UnrotateBoardFirst
        if BoardIsRotated
            boardrotate
        endif
    endif
    if GotParam NoBailBoard
        NoBailBoard = 1
    endif
    nollieoff
    pressureoff
    KillSpecial
    created_trick_cleanup
    BertSlideOff
    clearallowlipnogrind
    HandleDoubleCanOff
    if NOT GotParam NoScuff
        PlaySkaterStream type = 'bail'
    endif
    inbail
    LaunchStateChangeEvent state = Skater_InBail
    setextrapush Radius = 48 Speed = 100 rotate = 6
    if NOT GotParam dont_face_vel
        turntofacevelocity
    endif
    if NOT GotParam BoardAlwaysOn
        if NOT (nobails = 1)
            obj_spawnscriptlater BailBoardControl params = {BoardOffFrame = <BoardOffFrame> BoardVel = <BoardVel> BoardRotVel = <BoardRotVel> BoardSkaterVel = <BoardSkaterVel> NoBailBoard = <NoBailBoard>}
        endif
    endif
    TurnSparksOff
    VibrateOff
    ClearExceptions
    disableplayerinput AllowCameraControl
    BailSkaterTricks
    stopbalancetrick
    SetException Ex = CarBail scr = CarBail
    if (nobails = 1)
        goto Baildone
    endif
    if GotParam Endpose
        SetCurrentBailEndpose <Endpose>
    else
        SetCurrentBailEndpose
    endif
    if GotParam GroundGoneBail
        SetException Ex = GroundGone scr = <GroundGoneBail> params = { <...>  }
    endif
    if GotParam SmackAnim
        SetException Ex = FlailHitWall scr = BailSmack params = { SmackAnim = <SmackAnim> }
        SetException Ex = FlailLeft scr = BailSmack params = { SmackAnim = <SmackAnim> }
        SetException Ex = FlailRight scr = BailSmack params = { SmackAnim = <SmackAnim> }
    endif
    if InSlapGame
        SetException Ex = SkaterCollideBail scr = SkaterCollideBail
    else
        if GameModeEquals is_firefight
            seteventhandler Ex = SkaterCollideBail scr = Bail_FireFight_SkaterCollideBail
        endif
    endif
    if GotParam sound
    else
        playbonksound
    endif
    if GotParam NoBlending
        Skater_Playanim anim = <anim1> norestart BlendPeriod = 0.0
    else
        Skater_Playanim anim = <anim1> norestart BlendPeriod = 0.3000
    endif
    if NOT InSplitScreenGame
        if NOT GetGlobalFlag flag = TAP_BUTTONS_EXPLAINED
            create_panel_message {text = 'Tipp: Drück Tasten, um schneller aufzustehen.'
                id = skater_hint
                style = skater_hint_style
                Pos = (320.0, 170.0)
                rgba = [ 32 75 102 100 ]
            }
            SetGlobalFlag flag = TAP_BUTTONS_EXPLAINED
        endif
    endif
    if onrail
        obj_spawnscriptlater FallOffRail params = {xmove = <xmove> moveframes = <moveframes>}
        wait <intoairframe> frames
        ClearException GroundGone
        vibrate actuator = 1 percent = 100 duration = 0.2000
        if GotParam BonkSound
            playbonksound
        endif
        if GotParam Nutter
            GetSidewaysVector
            setspeed 0
            begin 
            if NOT onrail
                setstate Air
                goto GroundGoneBail params = { <...>  }
            endif
            wait 1 gameframe
            repeat 20
            if Flipped
                boost = -100
            else
                boost = 100
            endif
            SetSkaterVelocity vel_x = (<vel_x> * <boost>)vel_y = <vel_y> vel_z = (<vel_z> * <boost>)
        endif
        setstate Air
        move y = 2.0
        rotate y = randomrange (1.0, 20.0)
        if GotParam ForceFall
            goto GroundGoneBail params = { <...>  }
        endif
    endif
    WaitOnGround
    if NOT GetGlobalFlag flag = BLOOD_OFF
        if NOT GotParam NoScuff
            Scuff_skater
        endif
        if GotParam BloodFrame
            wait <BloodFrame> frames
            obj_spawnscriptlater BloodSmall
            playsound Random (@ hitblood01 @ hitblood02 @ hitblood03)
        endif
    endif
    vibrate actuator = 1 percent = 100 duration = 0.2000
    setrollingfriction <HeavyFriction>
    if GotParam HitBody
        SpawnScriptLater HitBody params = { <...>  }
    endif
    if NOT GotParam BashOff
        BashOn
        if NOT GoalManager_GoalShouldExpire
            TantrumOn
        endif
    endif
    wait 3 frames
    setrollingfriction <friction>
    Skater_WaitAnim percent = 30
    SpeedCheckStop
    setrollingfriction <Friction2>
    Skater_WaitAnim percent = 50
    SpeedCheckStop
    if GotParam BoardEarlyOn
        boardrotate normal
        SwitchOnBoard
    endif
    Skater_WaitAnim percent = 75
    SpeedCheckStop
    if GotParam FoleySound
    endif
    Skater_WaitAnimFinished
    SpeedCheckStop
    NoQuickGetup
    if GotParam Endpose
        gettags
        if GotParam waitfortantrum
            removetags tags = [ waitfortantrum ]
            return 
        endif
        printf 'No tantrum detected heading to endpose'
        TantrumOff
        goto <Endpose>
    endif
    goto Baildone
endscript

script GetSidewaysVector 
    GetSkaterVelocity
    if NOT (<vel_x> = 0)
        atan ((<vel_z> * 1.0)/ (<vel_x> * 1.0))
        Angle = <atan>
        sin (90.0 - <Angle>)
        new_z = <sin>
        cos (90.0 - <Angle>)
        new_x = <cos>
    else
        if NOT (<vel_z> = 0)
            new_z = 0.0
            new_x = 1.0
        else
            new_z = 0.0
            new_x = 0.0
        endif
    endif
    printstruct <...> 
    return {vel_z = <new_z> vel_x = <new_x> vel_y = <vel_y>}
endscript

script bail_quick_getup 
    obj_spawnscriptlater \{ bail_quick_getup2 }
endscript

script bail_quick_getup2 
    setrollingfriction \{ 20 }
    Skater_WaitAnimFinished
    GetCurrentBailEndpose
    if NOT (<current_bail_endpose> = None)
        SetCurrentBailEndpose
        MakeSkaterGoto <current_bail_endpose> params = { quick = true }
    endif
endscript

script GetUp_HK_Ft 
    printf 'Get up from HK_FT'
    NoQuickGetup
    if GotParam quick
        printf 'Got a Quick Getup Signal'
        goto startskate params = {quick = GetUp_HK_Ft_Q rolling_Fr = 3 wait_percent = 50}
    endif
    if GotParam tantrum
        Choose_Tantrum Getup = Ft spazzfactor = <spazzfactor> Score = <Score>
    endif
    printf 'No Tantrum Signal'
    Skater_Playanim anim = GetUp_HK_Ft BlendPeriod = 0.0
    Skater_WaitAnimFinished
    goto startskate
endscript

script GetUp_HK_Bk 
    printf 'Get up from HK_BK'
    NoQuickGetup
    if GotParam quick
        printf 'Got a Quick Getup Signal'
        goto startskate params = {quick = GetUp_HK_Bk_Q rolling_Fr = 3 wait_percent = 50}
    endif
    if GotParam tantrum
        Choose_Tantrum Getup = Bk spazzfactor = <spazzfactor> Score = <Score>
    endif
    printf 'No Tantrum Signal'
    Skater_Playanim anim = GetUp_HK_Bk BlendPeriod = 0.0
    Skater_WaitAnimFinished
    goto startskate
endscript

script GetUp_HK_Rt 
    printf 'Get up from HK_RT'
    NoQuickGetup
    if GotParam quick
        printf 'Got a Quick Getup Signal'
        goto startskate params = {quick = GetUp_HK_Rt_Q rolling_Fr = 3 wait_percent = 50}
    endif
    if GotParam tantrum
        Choose_Tantrum Getup = RT spazzfactor = <spazzfactor> Score = <Score>
    else
        printf 'No Tantrum Signal'
        Skater_Playanim anim = GetUp_HK_Rt BlendPeriod = 0.0
        Skater_WaitAnimFinished
        goto startskate
    endif
endscript

script GetUp_HK_Lt 
    printf 'Get up from HK_LT'
    NoQuickGetup
    if GotParam quick
        printf 'Got a Quick Getup Signal'
        goto startskate params = {quick = GetUp_HK_Lt_Q rolling_Fr = 3 wait_percent = 50}
    endif
    if GotParam tantrum
        Choose_Tantrum Getup = LT spazzfactor = <spazzfactor> Score = <Score>
    else
        printf 'No Tantrum Signal'
        Skater_Playanim anim = GetUp_HK_Lt BlendPeriod = 0.0
        Skater_WaitAnimFinished
        goto startskate
    endif
endscript

script GetUp_Sit_Ft 
    printf 'Get up from Sit_Ft'
    NoQuickGetup
    if GotParam quick
        printf 'Got a Quick Getup Signal'
        goto startskate params = {quick = GetUp_Sit_Ft_Q rolling_Fr = 3 wait_percent = 50}
    endif
    if GotParam tantrum
        Choose_Tantrum Getup = Sit_Ft spazzfactor = <spazzfactor> Score = <Score>
    else
        printf 'No Tantrum Signal'
        Skater_Playanim anim = GetUp_Sit_Ft BlendPeriod = 0.0
        Skater_WaitAnimFinished
        goto startskate
    endif
endscript
StartSkateExceptionTable = [
    { exception Ex = FlailHitWall scr = FlailHitWall }
    { exception Ex = GroundGone scr = BailGroundGone }
]

script startskate 
    printf 'StartSkating'
    NoQuickGetup
    TantrumOff
    ExitTantrum
    SwitchOnBoard
    boardrotate normal
    if ObjectExists id = BurnMoFo
        BurnMoFo ::unhide
    endif
    if ObjectExists id = SmokeyMoFo
        SmokeyMoFo ::unhide
    endif
    OnExceptionRun
    ResetEventHandlersFromTable StartSkateExceptionTable
    if IsFacingWall
        printf 'Facing Wall'
        Wall = 1
        gotoBrake = gotoBrake
    else
        if obj_getcollision side height = 3 Length = 3
            printf 'Wall to side'
            Wall = 1
            gotoBrake = gotoBrake
        endif
    endif
    if NOT obj_getcollision down distance = 6 height = 1 Length = 3
        printf 'Facing Dropoff'
        Drop = 1
        gotoBrake = gotoBrake
    endif
    if ControllerPressed down
        printf 'User Braking'
        Skater_Playanim anim = GetUp_S_NoPushOff BlendPeriod = 0.1000
        rolling_Fr = 100
        enableplayerinput
        gotoBrake = gotoBrake
    else
        if GotParam quick
            printf 'Starting Quick'
            Skater_Playanim anim = <quick> BlendPeriod = 0.0
            wait_percent = <wait_percent>
            rolling_Fr = <rolling_Fr>
        else
            if GotParam Wall
                Skater_Playanim anim = GetUp_S_NoPushOff BlendPeriod = 0.0
                rolling_Fr = 15
                wait_percent = 66
            else
                if GotParam Drop
                    Skater_Playanim anim = GetUp_S_NoPushOff BlendPeriod = 0.0
                    rolling_Fr = 15
                else
                    if IsFacingVert
                        printf 'Facing Vert'
                        Skater_Playanim anim = GetUp_S_RunJump BlendPeriod = 0.0
                        wait_percent = 30
                        rolling_Fr = 6
                    else
                        printf 'Starting Regular'
                        RandomNoRepeat (
                            @ Skater_Playanim anim = GetUp_S_RunJump BlendPeriod = 0.0
                            wait_percent = 40
                            rolling_Fr = 6
                            @ Skater_Playanim anim = GetUp_S_BoardFlip1 BlendPeriod = 0.0
                            wait_percent = 95
                            rolling_Fr = 6
                            @ Skater_Playanim anim = GetUp_S_BoardCatch1 BlendPeriod = 0.0
                            wait_percent = 66
                            rolling_Fr = 6
                        )
                    endif
                endif
            endif
        endif
    endif
    if GotParam wait_percent
        printf 'Start Waiting wait_percent = %i' i = <wait_percent>
        Skater_WaitAnim percent = <wait_percent>
        printf 'End Waiting'
    else
        if GotParam wait_frames
            animfinished_or_waitedframes frames = <wait_frames>
        else
            Skater_WaitAnimFinished
        endif
    endif
    if GotParam rolling_Fr
        printf 'Rolling_FR'
        setrollingfriction <rolling_Fr>
    else
        setrollingfriction default
    endif
    VibrateOff
    enableplayerinput
    Skater_WaitAnimFinished
    if GotParam tantrum_score
        tantrum_maybe_force_land Score = <tantrum_score>
    endif
    goto Baildone params = { gotoBrake = <gotoBrake> }
endscript

script animfinished_or_waitedframes 
    begin 
    if Skater_AnimComplete
        break 
    endif
    wait \{ 1 gameframe }
    repeat <frames>
endscript

script FallOffRail xmove = 5 moveframes = 0
    begin 
    if Flipped
        Length = (<xmove> / 12)
    else
        Length = (-1 * (<xmove> / 12))
    endif
    if NOT obj_getcollision height = 3 Length = <Length> side
        if NOT obj_getcollision height = 0.5000 Length = <Length> side
            break 
        endif
    endif
    xmove = (<xmove> / 2)
    if (12 > <xmove>)
        return 
    endif
    repeat 
    movetime = (<moveframes> * 1.0)
    if (<moveframes> > 0)
        slicedmove = (<xmove> / <movetime>)
        if NOT Flipped
            slicedmove = (<slicedmove> * -1.0)
        endif
        begin 
        move x = <slicedmove>
        wait 1 frame
        repeat <moveframes>
    else
        move x = <xmove>
    endif
endscript

script Scuff_skater 
    return 
    <scuffspot> = randomrange (0.0, 4.0)
    if (<scuffspot> > 3)
    else
        if (<scuffspot> = 3)
            Scuff_DoReplacement src = 'CS_NSN_scar_armR.png' scuffspot = <scuffspot>
        else
            if (<scuffspot> = 2)
                Scuff_DoReplacement src = 'CS_NSN_scar_armL.png' scuffspot = <scuffspot>
            else
                if (<scuffspot> = 1)
                    Scuff_DoReplacement src = 'CS_NSN_scar_legR.png' src2 = 'CS_NSN_scuff_legR.png' scuffspot = <scuffspot>
                else
                    Scuff_DoReplacement src = 'CS_NSN_scar_legL.png' src2 = 'CS_NSN_scuff_legL.png' scuffspot = <scuffspot>
                endif
            endif
        endif
    endif
endscript

script Scuff_DoReplacement leftknee = 0 rightknee = 0 rightelbow = 0 leftelbow = 0
    return 
    gettags
    switch <scuffspot>
        case 0
        leftknee = (<leftknee> + 1)
        bailcount = <leftknee>
        case 1
        rightknee = (<rightknee> + 1)
        bailcount = <rightknee>
        case 2
        leftelbow = (<leftelbow> + 1)
        bailcount = <leftelbow>
        case 3
        rightelbow = (<rightelbow> + 1)
        bailcount = <rightelbow>
    endswitch
    settags leftknee = <leftknee> rightknee = <rightknee> leftelbow = <leftelbow> rightelbow = <rightelbow>
    if GetGlobalFlag flag = CHEAT_SUPER_BLOOD
        bailcount = (<bailcount> + 5)
    endif
    if GotParam src2
        if (<bailcount> > 4)
            obj_replacetexture src = <src> dest = 'textures/scuffs/CS_NSN_scar_06'
        else
            if (<bailcount> > 10)
                obj_replacetexture src = <src> dest = 'textures/scuffs/CS_NSN_scar_05'
            else
                if (<bailcount> > 9)
                    obj_replacetexture src = <src> dest = 'textures/scuffs/CS_NSN_scar_04'
                    obj_replacetexture src = <src2> dest = 'textures/scuffs/CS_NSN_scuff_05'
                else
                    if (<bailcount> > 7)
                        obj_replacetexture src = <src> dest = 'textures/scuffs/CS_NSN_scar_03'
                    else
                        if (<bailcount> > 6)
                            obj_replacetexture src = <src2> dest = 'textures/scuffs/CS_NSN_scar_02'
                        else
                            if (<bailcount> > 5)
                                obj_replacetexture src = <src2> dest = 'textures/scuffs/CS_NSN_scuff_04'
                                obj_replacetexture src = <src> dest = 'textures/scuffs/CS_NSN_scar_01'
                            else
                                if (<bailcount> > 3)
                                    obj_replacetexture src = <src2> dest = 'textures/scuffs/CS_NSN_scuff_03'
                                else
                                    if (<bailcount> > 1)
                                        obj_replacetexture src = <src2> dest = 'textures/scuffs/CS_NSN_scuff_02'
                                    else
                                        obj_replacetexture src = <src2> dest = 'textures/scuffs/CS_NSN_scuff_01'
                                    endif
                                endif
                            endif
                        endif
                    endif
                endif
            endif
        endif
    else
        if (<bailcount> > 11)
            obj_replacetexture src = <src> dest = 'textures/scuffs/CS_NSN_scar_06'
        else
            if (<bailcount> > 9)
                obj_replacetexture src = <src> dest = 'textures/scuffs/CS_NSN_scar_05'
            else
                if (<bailcount> > 7)
                    obj_replacetexture src = <src> dest = 'textures/scuffs/CS_NSN_scar_04'
                else
                    if (<bailcount> > 5)
                        obj_replacetexture src = <src> dest = 'textures/scuffs/CS_NSN_scar_03'
                    else
                        if (<bailcount> > 3)
                            obj_replacetexture src = <src> dest = 'textures/scuffs/CS_NSN_scar_02'
                        else
                            obj_replacetexture src = <src> dest = 'textures/scuffs/CS_NSN_scar_01'
                        endif
                    endif
                endif
            endif
        endif
    endif
endscript

script CleanUp_Scuffs 
    return 
    obj_replacetexture src = 'CS_NSN_scar_armR.png' dest = 'textures/scuffs/CS_NSN_scar_armR'
    obj_replacetexture src = 'CS_NSN_scar_armL.png' dest = 'textures/scuffs/CS_NSN_scar_armL'
    obj_replacetexture src = 'CS_NSN_scar_legR.png' dest = 'textures/scuffs/CS_NSN_scar_legR'
    obj_replacetexture src = 'CS_NSN_scar_legL.png' dest = 'textures/scuffs/CS_NSN_scar_legL'
    obj_replacetexture src = 'CS_NSN_scuff_legR.png' dest = 'textures/scuffs/CS_NSN_scuff_legR'
    obj_replacetexture src = 'CS_NSN_scuff_legL.png' dest = 'textures/scuffs/CS_NSN_scuff_legL'
    obj_replacetexture src = 'CS_NN_board_trans01.png' dest = 'textures/scuffs/CS_NN_board_trans01'
    settags leftknee = 0 rightknee = 0 rightelbow = 0 leftelbow = 0
endscript

script DoBoardScuff 
    return 
    switch <boardscuff>
        case 10
        obj_replacetexture src = 'CS_NN_board_trans01.png' dest = 'textures/scuffs/CS_NN_boardscuff_01'
        case 20
        obj_replacetexture src = 'CS_NN_board_trans01.png' dest = 'textures/scuffs/CS_NN_boardscuff_02'
        case 30
        obj_replacetexture src = 'CS_NN_board_trans01.png' dest = 'textures/scuffs/CS_NN_boardscuff_03'
        case 40
        obj_replacetexture src = 'CS_NN_board_trans01.png' dest = 'textures/scuffs/CS_NN_boardscuff_04'
        default 
    endswitch
endscript

script BailBoardControl \{ BoardOffFrame = 5 }
    wait <BoardOffFrame> frames
    SwitchOffBoard
    switchoffatomic \{ vehicle }
    if IsCreated \{ si_bike }
        si_bike ::hide
    endif
    if ObjectExists \{ id = BurnMoFo }
        BurnMoFo ::hide
    endif
    if ObjectExists \{ id = SmokeyMoFo }
        SmokeyMoFo ::hide
    endif
    if NOT GotParam \{ NoBailBoard }
        CreateBailBoard vel = <BoardVel> rotvel = <BoardRotVel> object_vel_factor = <BoardSkaterVel> tantrum = <tantrum>
    endif
endscript

script SpeedCheckStop 
    if speedlessthan \{ 300 }
        setrollingfriction \{ 100 }
    endif
endscript

script HitBody \{ hitbodyframe = 15 }
    wait <hitbodyframe> frames
endscript

script BailSmack SmackAnim = Bail_Wall_FWD_Regular SmackFriction = 55
    printf 'Bail Smack'
    if InSlapGame
        SetException Ex = SkaterCollideBail scr = SkaterCollideBail
    else
        if GameModeEquals is_firefight
            seteventhandler Ex = SkaterCollideBail scr = Bail_FireFight_SkaterCollideBail
        endif
    endif
    SwitchOffBoard
    setrollingfriction <SmackFriction>
    Skater_Playanim anim = <SmackAnim> BlendPeriod = 0.1000
    obj_spawnscriptlater BloodTiny
    vibrate actuator = 1 percent = 100 duration = 0.2000
    Skater_WaitAnimFinished
    switch <SmackAnim>
        case Bail_Wall_FWD_Regular
        printf 'WallSmack FWD'
        goto GetUp_Sit_Ft
        case Bail_Wall_FWD_Low
        printf 'WallSmack FWD_Low'
        goto GetUp_HK_Rt
        case Bail_Wall_BCK_Regular
        printf 'WallSmack BCK'
        goto GetUp_HK_Bk
        case Bail_Wall_BCK_Low
        printf 'WallSmack BCK_Low'
        goto GetUp_HK_Bk
        case Bail_Wall_LT_Low
        printf 'WallSmack LT'
        goto GetUp_HK_Lt
        case Bail_Wall_RT_Low
        printf 'WallSmack RT'
        goto GetUp_HK_Rt
    endswitch
    printf '*******************If you see this Tell Jason G YOu got an Old Smack Wall Anim**********************'
    if Skater_AnimEquals Smackwall
        Skater_Playanim anim = GetUpFaceSmash BlendPeriod = 0.1000
    else
        if Skater_AnimEquals Smackwallupright
            Skater_Playanim anim = GetUpBackwards BlendPeriod = 0.1000
        else
            Skater_Playanim anim = GetUpFacing BlendPeriod = 0.1000
        endif
    endif
    setrollingfriction 15
    Skater_WaitAnim percent = 80
    SwitchOnBoard
    boardrotate normal
    Skater_WaitAnimFinished
    goto Baildone
endscript

script GroundGoneBail SplatFriction = 100 FallBlendPeriod = 0.3000
    if NOT GotParam AnimFall1
        AnimFall1 = Bail_Falling_Idle_FWD
    endif
    if NOT GotParam AnimFall2
        AnimFall2 = Bail_Falling_Hit_Med_FWD
    endif
    inbail
    ClearExceptions
    if InSlapGame
        SetException Ex = SkaterCollideBail scr = SkaterCollideBail
    else
        if GameModeEquals is_firefight
            seteventhandler Ex = SkaterCollideBail scr = Bail_FireFight_SkaterCollideBail
        endif
    endif
    disableplayerinput AllowCameraControl
    setextrapush Radius = 48 Speed = 100 rotate = 6
    SwitchOffBoard
    Skater_Playanim anim = <AnimFall1> norestart BlendPeriod = <FallBlendPeriod>
    begin 
    if Skater_AnimComplete
        Skater_Playanim anim = <AnimFall1> pingpong from = end to = 20 Speed = 0.5000 BlendPeriod = 0.1000
    endif
    if OnGround
        break 
    endif
    WaitOneGameFrame
    repeat 
    vibrate actuator = 1 percent = 100 duration = 0.2000
    setrollingfriction <SplatFriction>
    if airtimelessthan 0.8500 second
        printf 'Soft Landing'
        Skater_Playanim anim = <AnimFall2> norestart BlendPeriod = 0.1000
        vibrate actuator = 1 percent = 100 duration = 0.2000
        if NOT GetGlobalFlag flag = BLOOD_OFF
            if GotParam splatBloodFrame
                wait <splatBloodFrame> frames
            endif
            obj_spawnscriptlater BloodSmall
            playsound Random (@ hitblood01 @ hitblood02 @ hitblood03)
        endif
    else
        printf 'Hard Landing'
        if GotParam AnimFall2Hard
            Skater_Playanim anim = <AnimFall2Hard> norestart BlendPeriod = 0.1000
        else
            Skater_Playanim anim = <AnimFall2> norestart BlendPeriod = 0.1000
        endif
        vibrate actuator = 1 percent = 100 duration = 0.3000
        if NOT GetGlobalFlag flag = BLOOD_OFF
            if GotParam splatBloodFrame
                wait <splatBloodFrame> frames
            endif
            obj_spawnscriptlater BloodSmall
            playsound Random (@ hitblood01 @ hitblood02 @ hitblood03)
        endif
    endif
    BashOn
    if GotParam AnimFallEnd
        Skater_WaitAnimFinished
        goto <AnimFallEnd>
    endif
    if GotParam AnimFall3
        printf '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>--- If you see this tell Jason G you got an AnimFall3!!! ---<<<<<<<<<<<<<<<<<<<<<<<<<<<<'
        Skater_WaitAnimFinished
        Skater_Playanim anim = <AnimFall3> norestart BlendPeriod = 0.1000
    endif
    Skater_WaitAnim framesfromend = 20
    boardrotate normal
    SwitchOnBoard
    Skater_WaitAnimFinished
    goto Baildone
endscript

script Baildone 
    printf 'BailDone'
    obj_restoreboundingsphere
    ClearLipCombos
    NotifyBailDone
    setextrapush Radius = 0
    setrollingfriction default
    ClearTrickQueue
    ClearEventBuffer
    ClearManualTrick
    BashOff
    ClearQuickGetup
    TantrumOff
    KillExtraTricks
    enableplayerinput
    notinbail
    ClearGapTricks
    ClearSkaterFlags
    lockvelocitydirection Off
    restoreautokick
    canbrakeon
    FireEvent type = finished_bailing
    if NOT walking
        if GotParam gotoBrake
            if NOT OnGround
                setstate Ground
            endif
            OnGroundExceptions
            goto HandBrake params = { gotoBrake = <gotoBrake> }
        else
            goto ongroundai
        endif
    endif
endscript

script BloodOn \{ size = 1 Radius = 1 name = blood_01 }
    texturesplat Radius = randomrange (1.0, 40.0) size = <size> bone = Bone_Head name = <name> lifetime = 20
endscript

script BloodOn_Down \{ size = 1 Radius = 1 name = blood_01 }
    texturesplat Radius = randomrange (10.0, 300.0) size = <size> bone = Bone_Head name = <name> dropdown_length = 100 dropdown_vertical lifetime = 20
endscript

script BloodCar 
    wait \{ 30 frames }
    texturesplat \{Radius = 2 size = 20 bone = Bone_Head name = blood_01 lifetime = 20}
endscript

script BloodJackAss 
    if NOT GetGlobalFlag flag = BLOOD_OFF
        wait 30 frames
        printf 'MAKING SOME BIG BLOOD...............'
        BloodOn_Down size = randomrange (8.0, 15.0)
        BloodOn_Down size = randomrange (8.0, 15.0)
        wait randomrange (1.0, 8.0) frames
        BloodOn_Down <...> size = randomrange (6.0, 12.0)
        BloodOn_Down <...> size = randomrange (6.0, 12.0)
        wait randomrange (1.0, 8.0) frames
        BloodOn_Down <...> size = randomrange (4.0, 8.0)
        BloodOn_Down <...> size = randomrange (4.0, 8.0)
        wait randomrange (1.0, 8.0) frames
        BloodOn_Down size = randomrange (2.0, 6.0)
    endif
endscript

script BloodSmall 
    if NOT GetGlobalFlag flag = BLOOD_OFF
        if NOT GetGlobalFlag flag = CHEAT_SUPER_BLOOD
            if OnGround
                obj_spawnscriptlater BloodSplat
            endif
            wait 14 frames
            BloodOn <...> size = randomrange (8.0, 12.0) freq = 2.0 rnd_radius = 36
            wait randomrange (1.0, 3.0) frames
            BloodOn <...> size = randomrange (6.0, 10.0) freq = 2.0 rnd_radius = 36
            wait randomrange (1.0, 3.0) frames
            BloodOn <...> size = randomrange (4.0, 8.0) freq = 0.8000 rnd_radius = 36
            wait randomrange (1.0, 3.0) frames
            BloodOn size = randomrange (2.0, 6.0)
        else
            obj_spawnscriptlater BloodSplat
            wait 14 frames
            obj_spawnscriptlater BloodSplat
            texturesplat Radius = randomrange (20.0, 40.0) size = randomrange (30.0, 40.0) bone = Bone_Head name = blood_01 lifetime = 20
            wait 5 frame
            BloodOn <...> size = randomrange (15.0, 20.0)
            wait 4 frame
            BloodOn <...> size = randomrange (10.0, 15.0)
            wait 4 frame
            BloodOn <...> size = randomrange (10.0, 15.0)
            wait 3 frames
            BloodOn size = randomrange (6.0, 10.0)
            wait 2 frame
            BloodOn size = randomrange (6.0, 10.0)
            wait 1 frame
            BloodOn size = randomrange (6.0, 10.0)
        endif
    endif
endscript

script BloodTiny 
    if NOT GetGlobalFlag \{ flag = BLOOD_OFF }
        obj_spawnscriptlater \{ BloodSplat }
        BloodOn <...> size = 5.0 freq = 2.0 rnd_radius = 12
        wait \{ 4 frames }
        BloodOn <...> size = 2.0 freq = 0.8000 rnd_radius = 12
        wait \{ 3 frames }
    endif
endscript

script BloodSuperTiny 
    obj_spawnscriptlater \{ BloodSplat }
    BloodOn <...> size = 1.0 freq = 2.0 rnd_radius = 12
    wait \{ 4 frames }
    BloodOn <...> size = 0.5000 freq = 0.8000 rnd_radius = 12
    wait \{ 3 frames }
endscript

script BloodSplat 
    if NOT GetGlobalFlag \{ flag = BLOOD_OFF }
        BloodParticlesOn \{name = 'blood_1.png' start_col = -16777046 end_col = 570425514 num = 10 emit_w = 2.0 emit_h = 2.0 Angle = 10 size = 2.0 bone = Bone_Head growth = 1.500 time = 0.3000 Speed = 250 grav = -900 life = 0.3000}
    endif
endscript

script SwitchOnBoard 
    if NOT IsLocalSkater
        return 
    endif
    if IsForceWalkOn
        switchonatomic \{ board }
    else
        if NOT IsBoardMissing
            if atomicishidden \{ board }
                switchonatomic \{ board }
            endif
        else
            SwitchOffBoard
        endif
    endif
    obj_getid
    MangleChecksums a = bailboard b = <ObjID>
    if ObjectExists id = <mangled_id>
        <mangled_id> ::Die
    endif
endscript
BailBoardComponents = [
    { Component = Suspend }
    {
        Component = rigidbody
        coeff_friction = 0.7000
        coeff_restitution = 0.1500
        const_acc = -500
        mass_over_moment = 0.007000
        center_of_mass = (0.0, 3.0, 0.0)
        spring_const = 10
        linear_velocity_sleep_point = 3
        angular_velocity_sleep_point = 0.1000
        skater_collision_radius = 28
        skater_collision_application_radius = 8
        skater_collision_impulse_factor = 1.0
        contacts = [
            (6.0, 7.0, 18.0)
            (6.0, 7.0, -18.0)
            (-6.0, 7.0, 18.0)
            (-6.0, 7.0, -18.0)
            (6.0, 0.0, 13.0)
            (6.0, 0.0, -13.0)
            (-6.0, 0.0, 13.0)
            (-6.0, 0.0, -13.0)
        ]
        directed_friction = [
            { None }
            { None }
            { None }
            { None }
            { (1.0, 0.0, 0.0) }
            { (1.0, 0.0, 0.0) }
            { (1.0, 0.0, 0.0) }
            { (1.0, 0.0, 0.0) }
        ]
        SoundType = SkaterBoardWhenBail
    }
    { Component = skeleton SkeletonName = thps7_human }
    { Component = Model usemodellights Model = 'board_default/board_default.mdl' }
    { Component = ModelLightUpdate }
    { Component = sound }
    {
        Component = shadow
        ShadowType = volume
        ShadowVolumeModels = [ 'Models\volume_shadows\volume_board_shadow.shd' ]
    }
]
BailBikeComponents = [
    { Component = motion }
    { Component = Suspend }
    { Component = skeleton SkeletonName = thps7_human }
    { Component = Model usemodellights Model = 'specialitems/bmx/si_bmx.skin' }
    {
        Component = rigidbody
        coeff_friction = 0.7000
        coeff_restitution = 0.1500
        const_acc = -500
        mass_over_moment = 0.007000
        center_of_mass = (0.0, 20.0, 0.0)
        spring_const = 10
        linear_velocity_sleep_point = 0.1000
        angular_velocity_sleep_point = 0.1000
        skater_collision_radius = 28
        skater_collision_application_radius = 8
        skater_collision_impulse_factor = 1.0
        contacts = [
            (15.0, 40.0, 28.0)
            (1.0, 40.0, -28.0)
            (-15.0, 40.0, 28.0)
            (-1.0, 40.0, -28.0)
            (1.0, 0.0, 23.0)
            (1.0, 0.0, -23.0)
            (-1.0, 0.0, 23.0)
            (-1.0, 0.0, -23.0)
            (8.0, 10.0, 20.0)
            (-8.0, 10.0, 20.0)
            (8.0, 10.0, -20.0)
            (-8.0, 10.0, -20.0)
        ]
        directed_friction = [
            { None }
            { None }
            { None }
            { None }
            { (1.0, 0.0, 0.0) }
            { (1.0, 0.0, 0.0) }
            { (1.0, 0.0, 0.0) }
            { (1.0, 0.0, 0.0) }
            { None }
            { None }
            { None }
            { None }
        ]
        SoundType = SkaterBikeWhenBail
    }
    { Component = ModelLightUpdate }
    { Component = sound }
    {
        Component = shadow
        ShadowType = volume
        ShadowVolumeModels = [ 'Models\volume_shadows\Volume_BMX_Shadow.shd' ]
    }
]

script CreateBailBoard vel = (0.0, 0.0, 0.0) rotvel = (0.0, 0.0, 0.0) object_vel_factor = 1
    obj_getid
    if IsSkaterOnBike
        MangleChecksums a = BailBike b = <ObjID>
        board_ok = 1
    else
        if GotParam tantrum
            MangleChecksums a = TantrumBoard b = <ObjID>
        else
            MangleChecksums a = bailboard b = <ObjID>
        endif
    endif
    if ObjectExists id = <mangled_id>
        <mangled_id> ::Die
    endif
    if GetPlayerAppearancePart player = <ObjID> part = board
        board_ok = 1
    endif
    if GotParam board_ok
        if IsSkaterOnBike
            skeleton_spawncompositeobject <...> Offset = (0.0, -3.0, 2.0) bone = Bone_Board_Root Components = BailBikeComponents params = {name = <mangled_id> XcloneFrom = <ObjID> Xgeoms = [ board ] neversuspend}
            if NOT ObjectExists id = <mangled_id>
                return 
            else
            endif
        else
            skeleton_spawncompositeobject <...> Offset = (0.0, -3.0, 2.0) bone = Bone_Board_Root Components = BailBoardComponents params = {name = <mangled_id> CloneFrom = <ObjID> geoms = [ board ] neversuspend}
            if NOT ObjectExists id = <mangled_id>
                return 
            endif
        endif
        <mangled_id> ::rigidbody_ignoreskater 15 frames
        <mangled_id> ::rigidbody_wake
        if GotParam tantrum
            SpawnScriptLater waitandkilltantrumboard params = { id = <mangled_id> }
        endif
    endif
endscript

script waitandkilltantrumboard 
    wait \{ 6 seconds }
    BailBoard_cleanup id = <id>
endscript

script BailBoard_cleanup \{ id = bailboard }
    if ObjectExists id = <id>
        <id> ::Die
    endif
endscript

script SwitchOffBoard 
    switchoffatomic \{ board }
    switchoffatomic \{ ped_board }
endscript

script CleanUpSpecialItems 
    switchoffatomic \{ special_item }
    switchonatomic \{ special_item_2 }
endscript

script skater_play_bail_stream 
    obj_playstream <stream_checksum> vol = 200 priority = 49
endscript

script skater_hint_style 
    DoMorph time = 0 Scale = (0.0, 0.0)
    DoMorph time = 0.1000 Scale = (2.5, 2.5)
    DoMorph time = 0.1000 Scale = (0.75, 0.75)
    DoMorph time = 0.1000 Scale = (1.2999999523162842, 1.2999999523162842)
    DoMorph time = 0.1000 Scale = (1.100000023841858, 1.100000023841858)
    DoMorph time = 0.05000 alpha = 0.6000
    DoMorph time = 0.05000 alpha = 1
    DoMorph time = 0.05000 alpha = 0.6000
    DoMorph time = 0.05000 alpha = 1
    DoMorph time = 0.05000 alpha = 0.6000
    DoMorph time = 0.05000 alpha = 1
    DoMorph time = 0.05000 alpha = 0.6000
    DoMorph time = 0.05000 alpha = 1
    DoMorph time = 0.05000 alpha = 0.6000
    DoMorph time = 0.05000 alpha = 1
    DoMorph time = 0.05000 alpha = 0.6000
    DoMorph time = 0.05000 alpha = 1
    DoMorph time = 0.05000 alpha = 0.6000
    DoMorph time = 0.05000 alpha = 1
    DoMorph time = 0.05000 alpha = 0.6000
    DoMorph time = 0.05000 alpha = 1
    DoMorph time = 0.05000 alpha = 0.6000
    DoMorph time = 0.05000 alpha = 1
    DoMorph time = 0.05000 alpha = 0.6000
    DoMorph time = 0.05000 alpha = 1
    DoMorph time = 0.05000 alpha = 0.6000
    DoMorph time = 0.05000 alpha = 1
    DoMorph time = 0.05000 alpha = 0.6000
    DoMorph time = 0.05000 alpha = 1
    DoMorph time = 0.05000 alpha = 0.6000
    DoMorph time = 0.05000 alpha = 1
    DoMorph time = 0.05000 alpha = 0.6000
    DoMorph time = 0.05000 alpha = 1
    DoMorph time = 0.05000 alpha = 0.6000
    DoMorph time = 0.05000 alpha = 1
    DoMorph time = 0.05000 alpha = 0.6000
    DoMorph time = 0.05000 alpha = 1
    DoMorph time = 0.05000 alpha = 0.6000
    DoMorph time = 0.05000 alpha = 1
    DoMorph time = 0.05000 alpha = 0.6000
    DoMorph time = 0.05000 alpha = 1
    DoMorph time = 0.05000 alpha = 0.6000
    DoMorph time = 0.05000 alpha = 1
    DoMorph time = 0.05000 alpha = 0.6000
    DoMorph time = 0.05000 alpha = 1
    DoMorph time = 0.05000 alpha = 0.6000
    DoMorph time = 0.05000 alpha = 1
    DoMorph time = 0.05000 alpha = 0.6000
    DoMorph time = 0.05000 alpha = 1
    DoMorph time = 0.05000 alpha = 0.6000
    DoMorph time = 0.05000 alpha = 1
    DoMorph time = 0.05000 alpha = 0.6000
    DoMorph time = 0.05000 alpha = 1
    DoMorph time = 0.05000 alpha = 0.6000
    DoMorph time = 0.05000 alpha = 1
    DoMorph time = 0.1000 Scale = (2.5, 2.5)
    DoMorph time = 0.2000 Scale = (12.0, 0.0) alpha = 0
    Die
endscript
