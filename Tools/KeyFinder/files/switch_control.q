
SwitchControl_Trigger = {trigger = {PressTwoAnyOrder , l1 , r1 , 400}xbox_trigger = {Press , black , 10}NGC_Trigger = {Press , z , 10}alt_trigger = {Press , white , 10}}
CAVEMAN_SCORE = 750
COMBO_RUNOUT_SCORE = 50
CavemanBailDuration = 0.3000
RunOutTrickDelay = 0.7500

script RunTimerController_Reset 
    RunTimer_GetRunTimerControllerId
    obj_killspawnedscript id = <RunTimerControllerId>
    obj_spawnscript RunTimerController_Start id = <RunTimerControllerId> pausewithobject
    RunTimer_GetRunTimerId
    obj_killspawnedscript id = (<RunTimerId> + 2)
    hide_run_timer id = <RunTimerId>
endscript


script RunTimerController_Start 
    ClearExceptionGroup RunTimeController
    SetExceptionHandler Ex = ShowRunTimer scr = RunTimerController_Displayed group = RunTimeController
    Block
endscript


script RunTimerController_Displayed 
    ClearExceptionGroup RunTimeController
    SetExceptionHandler Ex = HideRunTimer scr = RunTimerController_Hidden group = RunTimeController
    RunTimer_GetRunTimerId
    FadingSpawned = 0
    SoundCounter = 0
    SoundWait = 4
    SoundType = 0
    RunTimer_GetFactorComplete
    RotationAngle = (360 * <FactorComplete>)
    show_run_timer id = <RunTimerId> rot_angle = <RotationAngle>
    begin 
    DoScreenElementMorph id = {<RunTimerId> child = 0}rot_angle = (180 - <RotationAngle>)
    hide_run_timer_piece id = <RunTimerId> rot_angle = <RotationAngle>
    if (<FadingSpawned> = 0)
        if (<RotationAngle> < 140)
            obj_spawnscript blink_run_timer id = (<RunTimerId> + 2)params = { id = <RunTimerId> }pausewithobject
            FadingSpawned = 1
        endif
    endif
    if (<SoundCounter> > <SoundWait>)
        if (<SoundType> = 0)
            playsound ClockTickDown
            SoundType = 1
        else
            playsound ClockTickUp vol = 150
            SoundType = 0
        endif
        SoundCounter = 0
    else
        SoundCounter = (<SoundCounter> + 1)
    endif
    if (<RotationAngle> < 270)
        if (<RotationAngle> < 180)
            if (<RotationAngle> < 90)
                SoundWait = 1
            else
                SoundWait = 2
            endif
        else
            SoundWait = 3
        endif
    endif
    wait 1 gameframe
    RunTimer_GetFactorComplete
    RotationAngle = (360 * <FactorComplete>)
    repeat 
endscript


script RunTimerController_Hidden 
    ClearExceptionGroup RunTimeController
    SetExceptionHandler Ex = ShowRunTimer scr = RunTimerController_Displayed group = RunTimeController
    RunTimer_GetRunTimerId
    obj_killspawnedscript id = (<RunTimerId> + 2)
    soft_hide_run_timer id = <RunTimerId>
    Block
endscript


script CleanUp_WalkingtoSkating 
    allowrailtricks
    gettags
    if NOT GotParam animtags
        SkaterLoopingSound_TurnOn
    else
        if NOT StructureContains WalkToSkateTransition structure = <animtags>
            SkaterLoopingSound_TurnOn
        endif
    endif
    SetException Ex = PointRail scr = PointRailWalkingToSkating
    SwitchToSkatingPhysics
    if InAir
        SetQueueTricks NoTricks
        InAirExceptions NoSkateToWalkTricks
    else
        OnGroundExceptions
    endif
endscript


script PointRailWalkingToSkating 
    SetQueueTricks NoTricks
    goto PointRail
endscript


script Switch_OnGroundAI NewScript = land
    if SkaterIsFlipping
        dont_switch = 1
    endif
    if IsOnMotoSkateboard
        dont_switch = 1
    endif
    if IsThrowingProjectile
        if walking
            dont_switch = 1
        endif
    endif
    if GotParam dont_switch
        if walking
            goto GroundOrAirWaitState
        else
            if InAir
                goto Airborne
            else
                goto ongroundai
            endif
        endif
    endif
    unhide
    ClearExceptions
    ClearTrickQueues
    stopbalancetrick
    notinbail
    if driving
        ToggleUserControlledVehicleMode
    endif
    switch <NewScript>
        case ongroundai
        setrollingfriction default
        DestroyAllSpecialItems
        SwitchOnBoard
        CleanUp_WalkingtoSkating
        if InAir
            goto Airborne
        else
            goto ongroundai
        endif
        case Walking_onGroundAi
        DestroyAllSpecialItems
        SwitchOnBoard
        SwitchToWalkingPhysics
        allowrailtricks
        if GotParam restart
            goto JustStoppedSkatingState params = { restart }
        else
            goto JustStoppedSkatingState
        endif
        case TransAm
        goto ToggleUserControlledVehicleMode params = { <...>  }
        default 
        scriptassert 'Bad NewScript passed to Switch_OnGroundAi'
    endswitch
endscript


script CheckforSwitchVehicles NewScript = ongroundai
    if walking
        goto Switch_OnGroundAI params = { NewScript = ongroundai }
    else
        goto Switch_OnGroundAI params = { NewScript = Walking_onGroundAi }
    endif
endscript

