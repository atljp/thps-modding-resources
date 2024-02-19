
script Vehicle_Start 
    skater ::removetags tags = [ #"0x954e708c" ]
    skater ::settags {<params> #"0xff71b9df" = 0}
    MakeSkaterGoto #"0x316ca7c5"
endscript
#"0x209a7a55" = [
    { exception Ex = GroundGone scr = #"0x122e8663" }
    { exception Ex = FlailHitWall scr = #"0x85de1ed2" }
    { exception Ex = FlailLeft scr = #"0x85de1ed2" }
    { exception Ex = FlailRight scr = #"0x85de1ed2" }
    { exception Ex = RunHasEnded scr = EndOfRun }
    { exception Ex = GoalHasEnded scr = Goal_EndOfRun }
]

script #"0x316ca7c5" 
    gettags
    if GotParam grind_sound
        skater ::obj_stopsound <grind_sound>
    endif
    SetCurrentBailEndpose
    OnExceptionRun
    ResetEventHandlersFromTable #"0x209a7a55"
    skatervehicleon
    setskatervehicle <#"0x3055ec54">
    orient_vehicle
    if GotParam #"0x2d44cb35"
        remove_all_anim_subsets #"0x50c3e029"
    else
        remove_all_anim_subsets
    endif
    if walking
        SwitchToSkatingPhysics
    endif
    if GotParam #"0x3a571a77"
        if NOT obj_animsubsetexists subsetid = second
            obj_addanimsubset subsetid = second
        endif
        obj_setanimsubsetweight subsetid = second blendweight = 0.0
    endif
    if (<#"0x0b866423"> = 1)
        canbrakeon
    else
        canbrakeoff
    endif
    if (<autokick> = 1)
        forceautokickon
    else
        forceautokickoff
    endif
    if (<board> = 1)
        SwitchOnBoard
    else
        SwitchOffBoard
    endif
    if (<#"0xc7057e38"> = 1)
        allowrailtricks
    else
        norailtricks
    endif
    if GotParam #"0xd8a80f74"
        setskatervehiclesounds <#"0xd8a80f74">
    else
        noskatervehiclesounds
    endif
    if BoardIsRotated
        boardrotate
    endif
    VibrateOff
    obj_killspawnedscript name = BailBoardControl
    ClearEventBuffer
    enableplayerinput
    bailoff
    BashOff
    setrollingfriction 0
    setspeed <#"0x92451cd0">
    BlendperiodOut 0
    skater ::SkaterLoopingSound_TurnOff
    if GotParam sound
        gettags
        if (<#"0x3055ec54"> = #"0xd8d2d646")
            skater ::obj_stopsound #"0x491944a7"
            skater ::obj_playsound #"0x491944a7"
        else
            skater ::obj_stopsound <sound>
            skater ::obj_playsound <sound>
        endif
    endif
    UnpauseSkaters
    if GotParam start_script
        <start_script>
    endif
    goto vehicle_onground
endscript

script vehicle_onground 
    gettags
    if GotParam grind_sound
        skater ::obj_stopsound <grind_sound>
    endif
    if GotParam #"0x441757ec"
        ClearPanel_Landed
    endif
    SetException Ex = RunHasEnded scr = EndOfRun
    SetException Ex = GoalHasEnded scr = Goal_EndOfRun
    stopbalancetrick
    vibrate actuator = 0 percent = 0
    settags #"0x85232bbe" = 0
    SetException Ex = Ollied scr = Vehicle_ollie
    resetlandedfromvert
    if NOT OnGround
        setstate Ground
    endif
    if GotParam canmanual
        SetManualTricks VehicleManualTricks
    else
        SetManualTricks NoTricks
    endif
    orient_vehicle
    Skater_Playanim anim = <idle_anim> Cycle norestart
    #"0xd137b349"
endscript

script #"0xd137b349" 
    gettags
    if GotParam grind_sound
        skater ::obj_stopsound <grind_sound>
    endif
    if GotParam sound
        if (<#"0x3055ec54"> = #"0xd8d2d646")
            skater ::obj_stopsound #"0x491944a7"
            skater ::obj_playsound #"0x491944a7"
        else
            skater ::obj_stopsound <sound>
            skater ::obj_playsound <sound>
        endif
    endif
    begin 
    if NOT IsSkaterOnVehicle
        MakeSkaterGoto ongroundai
    endif
    if GotParam canmanual
        DoNextManualTrick
    endif
    if (<#"0x3055ec54"> = #"0xd8d2d646")
        if SkaterSpeedGreaterThan 0
            if NOT issoundplaying #"0x491944a7"
                if (LevelIs load_bo)
                    printf 'vehicle_onground_loop - QuicklyStopping, then starting ShoppingCartLoopSound'
                    skater ::obj_stopsound #"0x491944a7"
                    skater ::obj_playsound #"0x491944a7"
                    setsoundparams #"0x491944a7" vol = 0 pitch = 0
                endif
            endif
        else
            if (LevelIs load_bo)
                if issoundplaying #"0x491944a7"
                    skater ::obj_stopsound #"0x491944a7"
                endif
            endif
        endif
    endif
    orient_vehicle
    <#"0xa9bf0430">
    wait 1 gameframe
    repeat 
endscript

script #"0x102e28e6" 
    gettags
    if GotParam grind_sound
        skater ::obj_stopsound <grind_sound>
    endif
    begin 
    if (<#"0x3055ec54"> = #"0xd8d2d646")
        if SkaterSpeedGreaterThan 0
            if NOT issoundplaying #"0x491944a7"
                if (LevelIs load_bo)
                    printf 'vehicle_accel_ground_sound_loop - Quickly Stopping, then starting ShoppingCartLoop sound'
                    skater ::obj_stopsound #"0x491944a7"
                    skater ::obj_playsound #"0x491944a7"
                    setsoundparams #"0x491944a7" vol = 0 pitch = 0
                endif
            endif
        else
            if issoundplaying #"0x491944a7"
                skater ::obj_stopsound #"0x491944a7"
            endif
        endif
    endif
    wait 1 gameframe
    repeat 2
endscript

script #"0xeb86fb1f" 
    gettags
    if GotParam #"0x3a571a77"
        obj_setanimsubsetweight blendweight = 1.0 blendduration = 0.1000
        obj_setanimsubsetweight subsetid = second blendweight = 0.0 blendduration = 0.1000
    endif
    if leftpressed
        if crouched
            #"0x409f4461" TurnIdle = <#"0x3e6b3c60"> turnAnim = <#"0x8b640fd0"> dir = left
        else
            #"0x409f4461" TurnIdle = <#"0xdf127ac2"> turnAnim = <left_anim> dir = left
        endif
    else
        if rightpressed
            if crouched
                #"0x409f4461" TurnIdle = <#"0x91878f67"> turnAnim = <#"0x4ce62f90"> dir = RIGHT
            else
                #"0x409f4461" TurnIdle = <#"0xa9be34e5"> turnAnim = <right_anim> dir = RIGHT
            endif
        else
            if braking
                getspeed
                if (<Speed> > 50)
                    Skater_Playanim anim = <#"0x26576d19"> norestart
                else
                    if heldlongerthan button = down 2 second
                        goto #"0x9b75987f"
                    else
                        Skater_Playanim anim = <idle_anim> Cycle norestart
                    endif
                endif
            else
                if crouched
                    if speedlessthan 300
                        SpawnSound #"0x102e28e6"
                        Skater_Playanim anim = <#"0x43ceadc0"> norestart
                        Skater_WaitAnimFinished
                    else
                        Skater_Playanim anim = <crouch_anim> Cycle norestart
                    endif
                else
                    if GotParam #"0x319ffbe7"
                        getspeed
                        if (<Speed> > 50)
                            Skater_Playanim anim = <crouch_anim> Cycle norestart Speed = 0.7000
                        else
                            Skater_Playanim anim = <idle_anim> Cycle norestart
                        endif
                    else
                        Skater_Playanim anim = <idle_anim> Cycle norestart
                    endif
                endif
            endif
        endif
    endif
endscript

script #"0x409f4461" 
    gettags
    if GotParam #"0x3a571a77"
        #"0xfa59059c" <...> 
        return 
    endif
    if NOT animequals <TurnIdle>
        if NOT animequals <turnAnim>
            if (<turnAnim> = <TurnIdle>)
                Skater_Playanim anim = <TurnIdle> Cycle norestart
            else
                Skater_Playanim anim = <turnAnim> norestart
            endif
        endif
        if animfinished
            Skater_Playanim anim = <TurnIdle> Cycle norestart
        endif
    endif
endscript

script #"0xfa59059c" 
    gettags
    if NOT obj_animsubsetexists subsetid = second
        obj_addanimsubset subsetid = second
        obj_setanimsubsetweight subsetid = second blendweight = 0.0
    endif
    #"0x22660f9a" = <crouch_anim>
    Skater_Playanim anim = <#"0x22660f9a"> Cycle synctopreviousanim
    Skater_Playanim subsetid = second anim = <turnAnim> Cycle synctopreviousanim
    obj_setanimsubsetweight blendweight = 0.2000 blendduration = 1.0
    obj_setanimsubsetweight subsetid = second blendweight = 0.8000 blendduration = 1.0
    wait 1 gameframe
    if (<dir> = RIGHT)
        #"0x3129ea15" = downright
        #"0x263a64c3" = upright
    else
        #"0x3129ea15" = downleft
        #"0x263a64c3" = upleft
    endif
    begin 
    if Held <dir>
    else
        if Held <#"0x3129ea15">
        else
            if Held <#"0x263a64c3">
            else
                break 
            endif
        endif
    endif
    wait 1 gameframe
    repeat 
    #"0x49663d99" = 0.1000
    obj_setanimsubsetweight blendweight = 1.0 blendduration = <#"0x49663d99">
    obj_setanimsubsetweight subsetid = second blendweight = 0.0 blendduration = <#"0x49663d99">
    wait <#"0x49663d99"> seconds
    goto #"0xd137b349"
endscript

script #"0xf4847828" 
    if obj_animsubsetexists subsetid = second
        obj_removeanimsubset subsetid = second
    endif
endscript

script #"0xbde788e8" 
    gettags
    OnExitRun #"0xc2810712"
    last_speed = -99
    begin 
    if NOT IsSkaterOnVehicle
        break 
    endif
    if NOT obj_animsubsetexists subsetid = wheels
        #"0xbe61a1a3"
        wait 1 gameframe
    else
        getspeed
        animate = 0
        if (<Speed> > 0)
            animate = 1
        endif
        if NOT OnGround
            animate = 0
        endif
        if (<animate> = 1)
            if (<Speed> > 50)
                #"0x7764b28b" = 1
            else
                #"0x7764b28b" = (<Speed> / 50)
            endif
            if NOT (<#"0x7764b28b"> = <last_speed>)
                Skater_Playanim subsetid = wheels anim = <#"0x2d44cb35"> Speed = <#"0x7764b28b"> Cycle
                last_speed = <#"0x7764b28b">
            endif
        else
            if NOT (<last_speed> = 0)
                Skater_Playanim subsetid = wheels anim = <#"0x2d44cb35"> Speed = 0 from = current
                last_speed = 0
            endif
        endif
        wait 10 gameframe
    endif
    repeat 
endscript

script #"0xbe61a1a3" 
    obj_addanimsubset subsetid = wheels stage = 1
    obj_setanimsubsetweight subsetid = wheels blendweight = 1
    if Obj_AnimationFlipped
        Obj_Flip subsetid = wheels
    endif
endscript

script #"0xc2810712" 
    if obj_animsubsetexists subsetid = wheels
        obj_removeanimsubset subsetid = wheels
    endif
endscript

script #"0xdae9cdbf" 
    gettags
    if Held left
        setrollingfriction <#"0x858acfbf">
        Skater_Playanim anim = <left_anim> norestart
    else
        if Held RIGHT
            setrollingfriction <#"0x858acfbf">
            Skater_Playanim anim = <right_anim> norestart
        else
            if Held down
                if GotParam #"0x26576d19"
                    Skater_Playanim anim = <#"0x26576d19"> norestart
                endif
            else
                Skater_Playanim anim = <idle_anim> Cycle norestart
                setrollingfriction 0
                getspeed
                if (<Speed> < <#"0xe9cd1249">)
                    Speed = (<Speed> + <acceleration>)
                endif
                setspeed <Speed>
            endif
        endif
    endif
endscript

script #"0x9b75987f" 
    gettags
    ClearEventBuffer
    OnExceptionRun BrakeDone
    setrollingfriction 100
    ClearTricksFrom GroundTricks
    Skater_Playanim anim = <idle_anim> norestart Cycle
    begin 
    wait 1 gameframe
    if Held up
        break 
    endif
    if crouched
        break 
    endif
    repeat 
    setrollingfriction default
    goto #"0xd137b349"
endscript

script #"0x24763a4c" 
    printf 'restoring original bounding sphere for bail'
    obj_restoreboundingsphere
endscript

script vehicle_bail 
    gettags
    if GotParam #"0xc8caca99"
        setstate Ground
        ClearPanel_Landed
        bailoff
        if landedfromspine
            setspeed 0
        endif
        goto vehicle_onground
    endif
    obj_setboundingsphere 10000
    OnExitRun #"0x24763a4c"
    if GotParam #"0x3a571a77"
        obj_setanimsubsetweight blendweight = 1.0
        obj_setanimsubsetweight subsetid = second blendweight = 0.0
    endif
    PlaySkaterStream type = 'bail'
    inbail
    LaunchStateChangeEvent state = Skater_InBail
    skater ::obj_stopsound <sound>
    skater ::SkaterLoopingSound_TurnOn
    ClearExceptions
    ClearTrickQueue
    disableplayerinput AllowCameraControl
    norailtricks
    SetExtraTricks NoTricks
    BailSkaterTricks
    stopbalancetrick
    if NOT landedfromvert
        setrollingfriction 20
        if (<#"0x84f03e36"> = 0)
            jump BonelessHeight
        endif
    else
        setrollingfriction 1000
    endif
    canbrakeon
    overridelimits max = 10000 friction = 0 time = 0
    restoreautokick
    ClearSkaterCamOverride
    if GotParam #"0x7af34b62"
    endif
    gettags
    if GotParam #"0xc2b9c599"
        skater ::obj_playsound <#"0xc2b9c599"> vol = 200 pitch = Random (@ 90 @ 100 @ 110)
    endif
    if onrail
        obj_spawnscript FallOffRail params = {xmove = <xmove> moveframes = <moveframes>}
        ClearException GroundGone
        vibrate actuator = 1 percent = 100 duration = 0.2000
        setstate Air
        move y = 2.0
        rotate y = (1.0, 20.0)
    endif
    if GotParam bail_script
        <bail_script> <Manual>
    else
        ManualBail
    endif
    notinbail
endscript

script #"0x85de1ed2" 
    gettags
    getspeed
    if (<Speed> > <bailspeed>)
        goto vehicle_bail
    else
        if GotParam #"0xfb2e1461"
            Skater_Playanim anim = <#"0xfb2e1461">
            Skater_WaitAnimFinished
        endif
        goto vehicle_onground
    endif
endscript

script Vehicle_ollie 
    ClearException Ollied
    gettags
    Skater_Playanim anim = <#"0xbb317bb2">
    SetTrickName <#"0x106ca67b">
    SetTrickScore <#"0xce619a85">
    display
    if GotParam jumpheight
        jump no_sound Speed = <jumpheight>
    else
        if GotParam BonelessHeight
            jump BonelessHeight no_sound
        else
            jump no_sound
        endif
    endif
    gettags
    if GotParam #"0xf386ecca"
        printf '################  OLLIE SOUND!!!!! '
        playsound <#"0xf386ecca"> pitch = Random (@ 95 @ 98 @ 100 @ 103 @ 105) vol = 150
    endif
    goto #"0x122e8663"
endscript

script #"0x122e8663" 
    gettags
    setstate Air
    LaunchStateChangeEvent state = Skater_InAir
    gettags
    SetException Ex = Landed scr = vehicle_land
    if GotParam canwallplant
        SetException Ex = wallplant scr = Air_WallPlant
    endif
    SetException Ex = PointRailSpin scr = #"0x8d538b1c"
    skater ::obj_stopsound <sound>
    if GotParam canmanual
        SetManualTricks VehicleManualTricks
    else
        SetManualTricks NoTricks
    endif
    Skater_Playanim anim = <air_idle_anim>
    if (<#"0x3055ec54"> = #"0x8c7873d0")
        begin 
        if airtimegreaterthan 1.250 seconds
            Skater_Playanim anim = FlailingFall BlendPeriod = 0.3000 Cycle
            SetException Ex = Landed scr = vehicle_bail params = { #"0x7af34b62" }
            break 
        endif
        wait 1 gameframe
        repeat 
    else
        begin 
        if Held Circle
            if GotParam #"0xfe8ab1ea"
                goto #"0x97ebf586"
            endif
        endif
        if Held square
            if GotParam #"0xb8b812ef"
                goto #"0x3f8f9109"
            endif
        endif
        if GotParam canmanual
            DoNextManualTrick
        endif
        wait 1 gameframe
        repeat 
    endif
endscript

script #"0x5aaabcc2" 
    gettags
    begin 
    if animfinished
        break 
    endif
    if Held Circle
        if GotParam #"0xfe8ab1ea"
            goto #"0x97ebf586"
        endif
    endif
    if Held square
        if GotParam #"0xb8b812ef"
            goto #"0x3f8f9109"
        endif
    endif
    if GotParam canmanual
        DoNextManualTrick
    endif
    wait 1 gameframe
    repeat 
endscript

script #"0x97ebf586" 
    gettags
    settags #"0xff71b9df" = 1
    LaunchStateChangeEvent state = Skater_InAir
    LaunchSubStateEntryEvent substate = Grab
    OnExitRun #"0x0f590f3c"
    Skater_Playanim anim = <#"0xfe8ab1ea"> Speed = <#"0xe73a21f7">
    Skater_WaitAnimFinished
    SetTrickName <trick_name>
    SetTrickScore <trick_score>
    display
    if Held Circle
        Skater_Playanim anim = <#"0xe4dae08b"> Cycle norestart
        begin 
        if NOT Held Circle
            break 
        endif
        getsingletag state
        if (<state> = Ground)
            break 
        endif
        wait 1 gameframe
        repeat 
    endif
    if GotParam #"0x9017471d"
        Skater_Playanim anim = <#"0x9017471d"> Speed = <#"0xe73a21f7">
    else
        Skater_Playanim anim = <#"0xfe8ab1ea"> backwards Speed = <#"0xe73a21f7">
    endif
    waitanim 50 percent
    settags #"0xff71b9df" = 0
    Skater_WaitAnimFinished
    goto #"0x122e8663"
endscript

script #"0x0f590f3c" 
    LaunchSubStateExitEvent substate = Grab
endscript

script #"0x3f8f9109" 
    gettags
    settags #"0xff71b9df" = 1
    LaunchStateChangeEvent state = Skater_InAir
    LaunchSubStateEntryEvent substate = flip
    OnExitRun #"0x0ce2d591"
    Skater_Playanim anim = <#"0xb8b812ef"> Speed = <#"0xda6517a1">
    wait 10 frames
    SetTrickName <#"0xc738c706">
    SetTrickScore <#"0xa26138ba">
    display
    waitanim 50 percent
    settags #"0xff71b9df" = 0
    Skater_WaitAnimFinished
    goto #"0x122e8663"
endscript

script #"0x0ce2d591" 
    LaunchSubStateExitEvent substate = flip
endscript

script vehicle_land 
    gettags
    setstate Ground
    settags #"0xff71b9df" = 0
    LaunchStateChangeEvent state = Skater_OnGround
    if NOT GotParam #"0xfd29faa2"
        #"0xfd29faa2" = (45.0, 155.0)
    endif
    if (<#"0xff71b9df"> = 1)
        settags #"0xff71b9df" = 0
        goto vehicle_bail
    endif
    if PitchGreaterThan 60
        goto vehicle_bail
    endif
    if RollGreaterThan 50
        goto vehicle_bail
    endif
    if NOT GotParam #"0xcc144646"
        getspeed
        if (<Speed> > 0)
            if YawBetween <#"0xfd29faa2">
                goto vehicle_bail
            endif
            if backwards
                if landedfromvert
                    manual_turnaround
                endif
                if (<#"0xc571483a"> = 0)
                else
                endif
            endif
        endif
    else
    endif
    GotoPreserveParams #"0x0f259b2d"
endscript

script #"0x0f259b2d" 
    if landedfromvert
        if (<#"0x84f03e36"> = 0)
            goto vehicle_bail
        endif
        overridecancelground
        obj_clearflag FLAG_SKATER_MANUALCHEESE
        if GotParam #"0x9523ab41"
            getspeed
            if (<Speed> > 250)
                SetExtraTricks_Reverts duration = <RevertTime>
            endif
        endif
    else
        if GotParam canmanual
            DoNextManualTrick
        endif
    endif
    OnExceptionRun LandSkaterTricks
    SetException Ex = Ollied scr = Vehicle_ollie
    SetException Ex = RunHasEnded scr = EndOfRun
    SetException Ex = GoalHasEnded scr = Goal_EndOfRun
    gettags
    if GotParam land_sound
        playsound <land_sound> vol = 150 pitch = Random (@ 95 @ 98 @ 100 @ 103 @ 105)
    endif
    if GotParam #"0x421461ad"
        if airtimegreaterthan 1 seconds
            Skater_Playanim anim = <land_anim> BlendPeriod = 0.1000
        else
            if airtimegreaterthan 0.1000 seconds
                Skater_Playanim anim = <#"0x421461ad"> BlendPeriod = 0.1000
            endif
        endif
    else
        Skater_Playanim anim = <land_anim> BlendPeriod = 0.1000
    endif
    gettags
    if (<#"0x3055ec54"> = #"0xd8d2d646")
        if SkaterSpeedGreaterThan 0
            if NOT issoundplaying #"0x491944a7"
                if (LevelIs load_bo)
                    printf 'vehicle_land2 - Quickly Stopping then starting shoppingcartloop sound'
                    skater ::obj_stopsound #"0x491944a7"
                    skater ::obj_playsound #"0x491944a7"
                    setsoundparams #"0x491944a7" vol = 0 pitch = 0
                endif
            endif
        endif
    endif
    if GotParam spin_time
        wait <spin_time> seconds
        cancelrotatedisplay
    endif
    if GotParam #"0x9523ab41"
        if landedfromvert
            resetlandedfromvert
            begin 
            wait 1 gameframe
            repeat <RevertTime>
        else
            begin 
            DoNextManualTrick FromAir
            wait 1 gameframe
            repeat 10
        endif
    endif
    LandSkaterTricks
    if (<#"0x3055ec54"> = wheelchair)
        Paulie_TalkShit
    endif
    Skater_WaitAnimFinished
    goto vehicle_onground
endscript

script vehicle_play_land_sound 
    gettags
    if GotParam land_sound
        playsound <land_sound> vol = 150 pitch = Random (@ 95 @ 98 @ 100 @ 103 @ 105)
    endif
endscript

script #"0x3ae0f9c2" 
    GetActualSpin
    if NOT landedfromspine
        if landedfromvert
            spin = (<spin> + 180)
        endif
    endif
    begin 
    if (360 > <spin>)
        break 
    else
        spin = (<spin> - 360)
    endif
    repeat 
    return spin = <spin>
endscript
#"0x6f25fa2c" = [
    {
        exception
        Ex = Ollied
        scr = vehicle_rail_exit
        params = { callback = Vehicle_ollie }
    }
    { exception Ex = OffRail scr = #"0xb0d91bd5" }
    {
        exception
        Ex = Landed
        scr = vehicle_rail_exit
        params = { callback = vehicle_land }
    }
    {
        exception
        Ex = OffMeterTop
        scr = vehicle_rail_exit
        params = { callback = vehicle_bail }
    }
    {
        exception
        Ex = OffMeterBottom
        scr = vehicle_rail_exit
        params = { callback = vehicle_bail }
    }
    {
        exception
        Ex = SkaterCollideBail
        scr = vehicle_rail_exit
        params = { callback = vehicle_bail }
    }
    { event Ex = MadeOtherSkaterBail scr = MadeOtherSkaterBail_Called }
]

script #"0x47f15883" 
    gettags
    if (<#"0xff71b9df"> = 1)
        settags #"0xff71b9df" = 0
        goto vehicle_bail
    endif
    if backwards
        settags #"0x85232bbe" = 1
        rotatenoflip
    else
        #"0x3ae0f9c2"
        if ((<spin> > 90)& (270 > <spin>))
            if (<#"0x85232bbe"> = 0)
                settags #"0x85232bbe" = 1
                rotatenoflip
            else
                settags #"0x85232bbe" = 0
            endif
        else
            if (<#"0x85232bbe"> = 1)
                rotatenoflip
            endif
        endif
    endif
    if bailison
        setstate Air
        goto vehicle_bail
    endif
    bailoff
    cancelrotatedisplay
    gettags
    if GotParam land_sound
        playsound <land_sound> vol = 120 pitch = Random (@ 110 @ 113 @ 115 @ 118 @ 120)
    endif
    if GotParam grind_sound
        skater ::obj_stopsound <grind_sound>
        skater ::obj_playsound <grind_sound> vol = 150
    endif
    LaunchStateChangeEvent state = Skater_OnRail
    KillExtraTricks
    SetTrickName ''
    SetTrickScore 0
    display Blockspin
    obj_clearflag FLAG_SKATER_MANUALCHEESE
    obj_clearflag FLAG_SKATER_REVERTCHEESE
    vibrate actuator = 1 percent = 50 duration = 0.2500
    vibrate actuator = 0 percent = 50
    ResetEventHandlersFromTable #"0x6f25fa2c"
    OnExceptionRun Grind_Kissed
    ClearTrickQueue
    ClearManualTrick
    ClearExtraGrindTrick
    SetQueueTricks NoTricks
    SetManualTricks NoTricks
    setrailsound grind
    setgrindtweak 10
    if GotParam grind_init_anim
        Skater_Playanim anim = <grind_init_anim> BlendPeriod = 0
    endif
    dobalancetrick ButtonA = RIGHT ButtonB = left type = grind DoFlipCheck
    orient_vehicle
    wait 15 frames
    if IsPs2
        SetExtraTricks GrindRelease
    endif
    wait 1 frame
    OnExceptionRun Normal_Grind
    SetTrickName <grind_trick>
    SetTrickScore <#"0x5c100fe3">
    display Blockspin
    Skater_WaitAnimFinished
    if GotParam grind_idle_anim
        Skater_Playanim anim = <grind_idle_anim> Wobble wobbleparams = grindwobble_params
    endif
    begin 
    DoNextTrick
    orient_vehicle
    wait 1 gameframe
    repeat 
endscript

script #"0xb0d91bd5" 
    gettags
    if GotParam grind_sound
        skater ::obj_stopsound <grind_sound>
    endif
    if GotParam KissedRail
        SetTrickScore 50
        SetTrickName 'Kissed the Rail'
        display Blockspin NoMult
    endif
    stopbalancetrick
    KillExtraTricks
    vibrate actuator = 0 percent = 0
    setstate Air
    SetException Ex = Landed scr = vehicle_land
    if GotParam canwallplant
        SetException Ex = wallplant scr = Air_WallPlant
    endif
    DoNextTrick
    if GotParam grind_out_anim
        Skater_Playanim anim = <grind_out_anim> BlendPeriod = 0.1000
    else
        if GotParam grind_init_anim
            Skater_Playanim anim = <grind_init_anim> BlendPeriod = 0.1000 backwards
        endif
    endif
    if GotParam canmanual
        DoNextManualTrick
    endif
    Skater_WaitAnimFinished
    goto #"0x122e8663"
endscript

script vehicle_rail_exit 
    stopbalancetrick
    KillExtraTricks
    vibrate actuator = 0 percent = 0
    setstate Air
    allowrailtricks
    if GotParam grind_sound
        skater ::obj_stopsound <grind_sound>
    endif
    if NOT GotParam callback
        return 
    else
        goto <callback>
    endif
endscript

script #"0x8d538b1c" 
    gettags
    SetException Ex = Ollied scr = #"0xe0101b67"
    SetException Ex = OffMeterTop scr = #"0xdd318e4e"
    SetException Ex = OffMeterBottom scr = #"0xdd318e4e"
    setrailsound slide
    dobalancetrick ButtonA = RIGHT ButtonB = left type = grind
    Skater_Playanim anim = <idle_anim> Wobble
    SetTrickName ''
    SetTrickScore 0
    display Blockspin
    SetTrickName 'Spin'
    SetTrickScore 50
    display Natas
endscript

script #"0xe0101b67" 
    skater ::setspeed 300
    Vehicle_ollie
endscript

script #"0xdd318e4e" 
    stopbalancetrick
    setspeed 200
    vehicle_bail
endscript
#"0xda68c8a7" = [
    { exception Ex = Ollied scr = Vehicle_ollie }
    {
        exception
        Ex = OffMeterBottom
        scr = vehicle_onground
        params = { #"0x441757ec" = #"0x441757ec" }
    }
    {
        exception
        Ex = OffMeterTop
        scr = vehicle_bail
        params = { Manual = Manual }
    }
    { exception Ex = GroundGone scr = #"0x122e8663" }
]

script vehicle_manual 
    if NOT OnGround
        SetException Ex = Landed scr = Manual params = { <...>  }
        return 
    endif
    gettags
    if GotParam grind_sound
        skater ::obj_stopsound <grind_sound>
    endif
    KillExtraTricks
    SetTrickName ''
    SetTrickScore 0
    display Blockspin
    if landedfromvert
        goto vehicle_land
    endif
    ClearLipCombos
    resetlandedfromvert
    nollieoff
    ResetEventHandlersFromTable #"0xda68c8a7"
    OnExceptionRun #"0x049b3243"
    LaunchStateChangeEvent state = Skater_InManual
    ClearTrickQueue
    SetQueueTricks NoTricks
    SetManualTricks NoTricks
    startbalancetrick
    if NOT IsNGC
        vibrate actuator = 1 percent = 25
        OnExitRun KillManualVibration
    endif
    setrollingfriction default
    dobalancetrick ButtonA = up ButtonB = down type = Manual Tweak = 1
    if GotParam #"0xdea129d6"
        Skater_Playanim anim = <#"0xdea129d6"> BlendPeriod = 0.3000
    endif
    if obj_flagset FLAG_SKATER_MANUALCHEESE
        if GotParam CheckCheese
            GetManualCheese
            ManualCheese = (<ManualCheese> + 1)
            settags ManualCheese = <ManualCheese>
            if (<ManualCheese> > 1)
                adjustbalance TimeAdd = 2 SpeedMult = 2 LeanMult = 1.200
            endif
        endif
    else
        obj_setflag FLAG_SKATER_MANUALCHEESE
        settags ManualCheese = 0
    endif
    SetTrickName <#"0x65cacd42">
    SetTrickScore <#"0x8fa3530d">
    display Blockspin
    Skater_WaitAnimFinished
    #"0x6640c18a"
endscript

script #"0x049b3243" 
    printf 'give the events back!!!!!!!'
    RestoreEvents usedby = extra duration = 100
    ManualOut
    stopbalancetrick
endscript

script #"0x6640c18a" 
    gettags
    if GotParam grind_sound
        skater ::obj_stopsound <grind_sound>
    endif
    if GotParam manual_balance_anim
        Skater_Playanim anim = <manual_balance_anim> Wobble wobbleparams = Manual_wobble_params
    endif
    was_held = 0
    begin 
    if GotParam #"0x6234f482"
        if (<was_held> = 1)
            if Released r2
                goto #"0xdc222236"
            endif
        else
            if Held r2
                was_held = 1
            endif
        endif
    endif
    DoNextTrick
    wait 1 gameframe
    repeat 
endscript

script #"0xdc222236" 
    gettags
    if GotParam grind_sound
        skater ::obj_stopsound <grind_sound>
    endif
    Skater_Playanim anim = <#"0x09a2131d">
    Skater_WaitAnimFinished
    SetTrickName <#"0x6234f482">
    SetTrickScore <#"0x885d6acd">
    display
    goto #"0x6640c18a"
endscript

script vehicle_revert 
    gettags
    if GotParam grind_sound
        skater ::obj_stopsound <grind_sound>
    endif
    if NOT GotParam #"0x09a2131d"
        goto vehicle_land
    endif
    OnExitRun #"0x8e08f195"
    InRevert
    gettags
    ClearLipCombos
    KillExtraTricks
    SetTrickScore 100
    LaunchStateChangeEvent state = Skater_InRevert
    if NOT GetGlobalFlag flag = CHEAT_HOVERBOARD
        obj_spawnscript CessTrail params = { repeat_times = 10 }
        playcesssound
        vibrate actuator = 0 percent = 80 duration = 0.5000
        vibrate actuator = 1 percent = 80 duration = 0.1000
    endif
    ClearException Ollied
    setspecialfriction [0 , 0 , 5 , 10 , 15 , 25] duration = 0.6670
    SetQueueTricks NoTricks
    nollieoff
    pressureoff
    Skater_Playanim anim = <#"0x09a2131d">
    SetTrickName <#"0x9523ab41">
    display Blockspin
    BlendperiodOut 0.0
    wait 0.1000 seconds
    SetException Ex = Ollied scr = Vehicle_ollie
    resetlandedfromvert
    Skater_WaitAnimFinished
    if GotParam canmanual
        DoNextManualTrick
    endif
    LandSkaterTricks
    ClearEventBuffer
    goto #"0xeb86fb1f"
endscript

script #"0x8e08f195" 
    OutRevert
    SetTrickName ''
    SetTrickScore 0
    display Blockspin
endscript

script vehicle_wallplant 
    gettags
    if GotParam grind_sound
        skater ::obj_stopsound <grind_sound>
    endif
    if NOT GotParam canwallplant
        return 
    endif
    pressureoff
    nollieoff
    ClearException Ollied
    LaunchStateChangeEvent state = Skater_InWallplant
    vibrate actuator = 1 percent = 100 duration = 0.1000
    SetTrickName ''
    SetTrickScore 0
    display Blockspin
    Skater_Playanim anim = <wallplant_anim> BlendPeriod = 0
    BlendperiodOut 0
    BoardRotateAfter
    SetTrickName 'Sticker Slap'
    SetTrickScore 750
    display
    skater ::obj_playsound SK6_StickerSlap_01 vol = 150 pitch = (98.0, 105.0)
    GetStartTime
    begin 
    GetElapsedTime starttime = <starttime>
    if (<elapsedtime> > Post_Wallplant_No_Ollie_Window)
        break 
    endif
    wait 1 gameframe
    repeat 
    ClearEventBuffer buttons = [ x ] olderthan = 0
    GetStartTime
    begin 
    GetElapsedTime starttime = <starttime>
    if (<elapsedtime> > Post_Wallplant_Allow_Ollie_Window)
        break 
    endif
    wait 1 gameframe
    repeat 
    Skater_WaitAnimFinished
    boardrotate
    goto #"0x122e8663"
endscript

script #"0x552548e1" 
    Obj_PlayAnim anim = (<params>.idle_anim)
endscript
#"0x954e708c" = {
    struct = #"0x954e708c"
    #"0x3055ec54" = #"0xea15aa54"
    #"0x92451cd0" = 900
    #"0x858acfbf" = 4
    #"0xe9cd1249" = 800
    acceleration = 10
    #"0x0b866423" = 1
    autokick = 1
    board = 1
    #"0x84f03e36" = 1
    #"0xc571483a" = 0
    jumpheight = 700
    #"0xc8caca99" = 1
    #"0x106ca67b" = "Luge Hop"
    #"0xce619a85" = 100
    start_script = #"0x27f2c02e"
    #"0xa9bf0430" = #"0xdae9cdbf"
    bail_script = #"0x35187a60"
    idle_anim = CoffinGrind_Range
    #"0x26576d19" = CoffinGrind_Range
    left_anim = CoffinGrind_Range
    right_anim = CoffinGrind_Range
    #"0xdf127ac2" = CoffinGrind_Range
    #"0xa9be34e5" = CoffinGrind_Range
    #"0x8b640fd0" = CoffinGrind_Range
    #"0x4ce62f90" = CoffinGrind_Range
    #"0x3e6b3c60" = CoffinGrind_Range
    #"0x91878f67" = CoffinGrind_Range
    #"0xfb2e1461" = CoffinGrind_Range
    #"0xbb317bb2" = CoffinGrind_Range
    air_idle_anim = CoffinGrind_Range
    land_anim = CoffinGrind_Range
}
#"0x6cb3ea47" = {
    struct = #"0x6cb3ea47"
    #"0x3055ec54" = #"0xa101bd8d"
    #"0x92451cd0" = 900
    #"0x858acfbf" = 4
    #"0xe9cd1249" = 800
    acceleration = 10
    #"0x0b866423" = 1
    autokick = 1
    board = 1
    #"0x84f03e36" = 1
    #"0xc571483a" = 0
    jumpheight = 740
    #"0xc8caca99" = 1
    #"0x106ca67b" = "SitDown Hop"
    #"0xce619a85" = 125
    start_script = #"0x097297cd"
    #"0xa9bf0430" = #"0xdae9cdbf"
    bail_script = #"0x10e392b0"
    idle_anim = SitDownAir_Idle
    #"0x26576d19" = SitDownAir_Idle
    left_anim = SitDownAir_Idle
    right_anim = SitDownAir_Idle
    #"0xdf127ac2" = SitDownAir_Idle
    #"0xa9be34e5" = SitDownAir_Idle
    #"0x8b640fd0" = SitDownAir_Idle
    #"0x4ce62f90" = SitDownAir_Idle
    #"0x3e6b3c60" = SitDownAir_Idle
    #"0x91878f67" = SitDownAir_Idle
    #"0xfb2e1461" = SitDownAir_Idle
    #"0xbb317bb2" = SitDownAir_Idle
    air_idle_anim = SitDownAir_Idle
    land_anim = SitDownAir_Idle
}

script #"0x27f2c02e" 
    Skater_Playanim anim = CoffinGrind_Init
    Skater_WaitAnimFinished
endscript

script #"0x953c51fc" 
    skater ::#"0x2c4cd0fb"
    exit_pause_menu menu_id = #"0xb73b5702"
endscript

script #"0x2c4cd0fb" 
    if Vehicle_Start params = #"0x954e708c"
    endif
endscript

script #"0x35187a60" 
    if notinbail
        Vehicle_Start params = #"0x954e708c"
    endif
endscript

script #"0xf1d2a06d" 
    skater ::#"0x072f8528"
    exit_pause_menu menu_id = #"0xb73b5702"
endscript

script #"0x072f8528" 
    if IsSkaterOnVehicle
        skatervehicleoff
        remove_all_anim_subsets
        gettags
    endif
endscript

script orient_vehicle 
    if Flipped
        flip
    endif
    if BoardIsRotated
        boardrotate
    endif
endscript

script remove_all_anim_subsets 
    Skater_ClothAnimOff
    Skater_ThrowAnimOff
    Skater_SteerAnimOff
endscript

script #"0x2578769b" 
    skater ::#"0x5c812a33"
    exit_pause_menu menu_id = #"0xb73b5702"
endscript

script #"0x5c812a33" 
    if Vehicle_Start params = #"0x6cb3ea47"
    endif
endscript

script #"0x10e392b0" 
    if notinbail
        Vehicle_Start params = #"0x6cb3ea47"
    endif
endscript

script #"0x097297cd" 
    Skater_Playanim anim = SitDownAir_Init
    Skater_WaitAnimFinished
endscript
