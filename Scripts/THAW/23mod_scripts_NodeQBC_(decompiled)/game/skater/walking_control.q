
script SwitchToWalkingPhysics 
    flip_skater_if_180_off
    broadcastevent \{ type = SkaterExitSkating }
    KillSpawnedScript \{ name = wait_and_pause_runtimer }
    ClearTrickQueues
    SkaterPhysicsControl_SwitchSkatingToWalking
    SkaterLoopingSound_TurnOff
    enableinputevents
    broadcastevent \{ type = SkaterEnterWalking }
    KillExtraTricks
    pressureoff
    nollieoff
    obj_spawnscriptlater \{ ClearLipLock }
    SetTrickName \{ "" }
    SetTrickScore \{ 0 }
    display \{ Blockspin }
endscript

script ClearLipLock 
    clearallowlipnogrind
    wait \{ 15 frames }
    clearallowlipnogrind
endscript

script SwitchToSkatingPhysics 
    broadcastevent \{ type = SkaterExitWalking }
    ClearAllWalkingExceptions
    ClearTrickQueue
    obj_killspawnedscript \{ id = ComboRunOutTrickDisplayDelay }
    obj_killspawnedscript \{ id = ActivateGroundTricksDelay }
    setprops \{remove_tags = [ WalkingGroundTricksInactive ]}
    SetTrickName \{ "" }
    SetTrickScore \{ 0 }
    display \{ Blockspin }
    obj_spawnscriptlater \{ wait_and_pause_runtimer }
    SkaterPhysicsControl_SwitchWalkingToSkating
    broadcastevent \{ type = SkaterEnterSkating }
endscript

script wait_and_pause_runtimer 
    if NOT onrail
        Skater_WaitAnimFinished
    endif
    RunTimer_pause
endscript
WalkGroundTricks = [
    { SwitchControl_Trigger scr = WalkingRunToSkating }
    {
        trigger = { InOrder a = r2 b = r2 300 }
        xbox_trigger = { InOrder a = r1 b = r1 300 }
        NGC_Trigger = { InOrder a = r1 b = r1 300 }
        scr = walking_stance_toggle
    }
    {
        trigger = { Press Circle 500 }
        scr = boardsmack
    }
    {
        trigger = { Press square 500 }
        scr = walk_throw_projectile
    }
    {
        trigger = { Press triangle 500 }
        scr = graffiti_tag
        params = {}
    }
]
WalkNoBoardGroundTricks = [
    {
        trigger = { Press square 500 }
        scr = walk_throw_projectile
    }
    {
        trigger = { Press triangle 500 }
        scr = graffiti_tag
        params = {}
    }
]
WalkAirTricks = [
    { SwitchControl_Trigger scr = WalkingAirToSkating }
]
WalkHangTricks = [
    {
        trigger = { Press triangle 500 }
        scr = hanging_graffiti_tag
        params = {}
    }
]

script BeginWalkingGenericTrickInAir 
    if Walk_Air
        AirOrWall = 1
    endif
    if Walk_Wall
        AirOrWall = 1
    endif
    if GotParam \{ AirOrWall }
        if NOT IsBoardMissing
            BeginWalkingGenericTrick
        endif
    endif
    if GotParam \{ callback }
        <callback> <...> 
    endif
endscript

script BeginWalkingGenericTrick 
    CleanUp_WalkingtoSkating
    if NOT OnGround
        PerhapsAwardCaveman
    endif
endscript

script BeginWalkingManualTrick 
    Walk_ScaleAnimSpeed \{ Off }
    CleanUp_WalkingtoSkating
    PerhapsAwardCaveman
endscript

script WalkingToRailTrick 
    Walk_ScaleAnimSpeed \{ Off }
    Skater_Playanim \{ anim = JumpAirTo5050 from = 0 }
    SetException \{ Ex = PointRailSpin scr = PointRailSpin }
    PerhapsAwardCaveman \{ HaveNotSwitchedPhysicsStatesYet }
    SetTrickName \{ "" }
    SetTrickScore \{ 0 }
    display \{ Blockspin }
    CleanUp_WalkingtoSkating
endscript

script WalkingMountGhostBoard 
    if IsBoardMissing
        SwitchOnBoard
        UnsetBoardMissing
    else
        obj_getid
        ClientLaunchBoard owner_id = <ObjID> vel = (0.0, 0.0, 0.0)
    endif
    if GotParam add_speed
        getspeed
        Speed = (<Speed> + <add_speed>)
        SetSkaterVelocity <Speed>
    endif
    Walk_ScaleAnimSpeed Off
    Skater_Playanim anim = JumpAirTo5050
    SetTrickName 'Board Mount'
    SetTrickScore 3000
    display
    CleanUp_WalkingtoSkating
    SetSkaterAirManualTricks
    SetExtraTricks tricks = RevertBertTricks
    WaitAnimWhilstChecking AndManuals
    LandSkaterTricks
    goto ongroundai
endscript

script WalkingAirToTransitionTrick 
    ClearException \{ AcidDrop }
    Walk_ScaleAnimSpeed \{ Off }
    CleanUp_WalkingtoSkating
    Skater_Playanim \{ anim = JumpAirToAirIdle }
    WaitAnimWhilstChecking
    goto \{Airborne params = { NoSkateToWalkTricks }}
endscript

script WalkingRunToSkating 
    BeginWalkingGenericTrick
    SkaterLoopingSound_TurnOff
    OnExitRun WalkingRunToSkating_exit
    if (InNetGame)
        if NOT GetGlobalFlag flag = flag_g_expert_mode_no_walking
            if NOT GetGlobalFlag flag = FLAG_EXPERT_MODE_NO_WALKING
                SetQueueTricks Jumptricks WalkToSkateTransition_GroundTricks SkateToWalkTricks
            else
                SetQueueTricks Jumptricks WalkToSkateTransition_GroundTricks
            endif
        else
            SetQueueTricks Jumptricks WalkToSkateTransition_GroundTricks
        endif
    else
        if NOT GetGlobalFlag flag = FLAG_EXPERT_MODE_NO_WALKING
            SetQueueTricks Jumptricks WalkToSkateTransition_GroundTricks SkateToWalkTricks
        else
            SetQueueTricks Jumptricks WalkToSkateTransition_GroundTricks
        endif
    endif
    if Skater_AnimEquals [ SkateToWalk WSkateToRun SlowSkateToStand BrakeToStand ]
        Skater_Playanim anim = WRunToSkate synctoreversepreviousanim effectivepreviousanimduration = 0.5000
    else
        Skater_Playanim anim = WRunToSkate
    endif
    seteventhandler Ex = FlailHitWall scr = FlailVibrate
    seteventhandler Ex = FlailLeft scr = FlailVibrate
    seteventhandler Ex = FlailRight scr = FlailVibrate
    ClearException RunHasEnded
    ClearException GoalHasEnded
    ClearException Ollied
    wait CavemanBailDuration seconds
    SetException Ex = Ollied scr = ollie params = { OutAnim = JumpAirToAirIdle SyncOutAnimToPreviousAnim }
    WaitAnimWhilstChecking AndManuals
    LandSkaterTricks
    goto ongroundai
endscript

script WalkingRunToSkating_exit 
    SkaterLoopingSound_TurnOn
endscript

script WalkingAirToSkating 
    Walk_ScaleAnimSpeed \{ Off }
    Skater_Playanim \{ anim = JumpAirToAirIdle }
    wait \{ CavemanBailDuration seconds }
    WaitAnimWhilstChecking
    goto \{Airborne params = { NoSkateToWalkTricks }}
endscript

script ComboRunOutTrickDisplayDelay 
    obj_getid
    seteventhandler Ex = SkaterExitCombo scr = FilterSkaterExitComboEvent params = { ThisSkaterId = <ObjID> }
    SetTrickName \{ "Combo Run Out" }
    SetTrickScore \{ COMBO_RUNOUT_SCORE }
    display \{ Blockspin }
endscript

script FilterSkaterExitComboEvent 
    if (<skaterid> = <ThisSkaterId>)
        goto \{ NullScript }
    endif
endscript

script PerhapsAwardCaveman \{ name = "Caveman" }
    if NOT GotParam \{ HaveNotSwitchedPhysicsStatesYet }
        getpreviousphysicsstateduration
        if (<PreviousPhysicsStateDuration> > RunOutTrickDelay)
            SetTrickName <name>
            SetTrickScore \{ CAVEMAN_SCORE }
            display
        endif
    else
        gettimesincephysicsswitch
        if (<TimeSincePhysicsSwitch> > RunOutTrickDelay)
            SetTrickName <name>
            SetTrickScore \{ CAVEMAN_SCORE }
            display
        endif
    endif
endscript

script ActivateGroundTricksDelay 
    wait \{ CavemanBailDuration seconds }
    setprops \{remove_tags = [ WalkingGroundTricksInactive ]}
    if walk_ground
        SetWalkingGroundTricks
    endif
endscript

script SetWalkingGroundTricks 
    if NOT IsBoardMissing
        getsingletag \{ WalkingGroundTricksInactive }
        if NOT GotParam \{ WalkingGroundTricksInactive }
            SetQueueTricks \{ WalkGroundTricks }
        else
            SetQueueTricks \{ NoTricks }
        endif
    else
        SetQueueTricks \{ WalkNoBoardGroundTricks }
    endif
    SetExtraGrindTricks \{ NoTricks }
    SetManualTricks \{ NoTricks }
endscript

script SetWalkingAirTricks 
    if NOT IsBoardMissing
        if AbilityEnabled caveman
            SetQueueTricks special = SpecialTricks airtricks WalkAirTricks
            SetExtraGrindTricks special = SpecialGrindTricks grindtricks
            if NOT GetGlobalFlag flag = FLAG_EXPERT_MODE_NO_MANUALS
                if NOT ((InNetGame)& (GetGlobalFlag flag = flag_g_expert_mode_no_manuals))
                    SetManualTricks special = SpecialManualTricks GroundManualTricks
                else
                    SetManualTricks NoTricks
                endif
            else
                SetManualTricks NoTricks
            endif
        else
            SetQueueTricks special = SpecialTricks airtricks
            SetExtraGrindTricks NoTricks
            SetManualTricks NoTricks
        endif
    else
        SetQueueTricks NoTricks
        SetExtraGrindTricks NoTricks
        SetManualTricks NoTricks
    endif
endscript

script SetWalkingOffTricks 
    SetQueueTricks \{ NoTricks }
    SetExtraGrindTricks \{ NoTricks }
    SetManualTricks \{ NoTricks }
endscript

script SetWalkingTrickState NewWalkingTrickState = Ground WalkingTricksState = unset
    getsingletag WalkingTricksState
    ClearTrickQueues
    switch <NewWalkingTrickState>
        case Ground
        ClearExceptionGroup WalkingTransitionTrickExceptions
        SetException Ex = AcidDrop scr = WalkingAirToTransitionTrick group = WalkingTransitionTrickExceptions
        SetException Ex = Rail scr = WalkingToRailTrick group = WalkingTransitionTrickExceptions
        RunTimer_unpause
        seteventhandler Ex = RunTimerUp scr = Walk_LandSkaterTricks group = RunTimerEvents
        seteventhandler Ex = RunHasEnded scr = EndOfRun_WalkingEvent group = WalkingEndRunEvents
        seteventhandler Ex = GoalHasEnded scr = Goal_EndOfRun_WalkingEvent group = WalkingEndRunEvents
        resetlandedfromvert
        LaunchStateChangeEvent state = Skater_OnGround
        SetWalkingGroundTricks
        case Air
        ClearEventBuffer buttons = [ up down ] olderthan = 0
        ClearExceptionGroup WalkingTransitionTrickExceptions
        SetException Ex = AcidDrop scr = WalkingAirToTransitionTrick group = WalkingTransitionTrickExceptions
        SetException Ex = Rail scr = WalkingToRailTrick group = WalkingTransitionTrickExceptions
        ClearExceptionGroup WalkingEndRunEvents
        ClearExceptionGroup RunTimerEvents
        LaunchStateChangeEvent state = Skater_InAir
        SetWalkingAirTricks
        case Off
        ClearExceptionGroup WalkingTransitionTrickExceptions
        RunTimer_unpause
        seteventhandler Ex = RunTimerUp scr = Walk_LandSkaterTricks group = RunTimerEvents
        seteventhandler Ex = RunHasEnded scr = EndOfRun_WalkingEvent group = WalkingEndRunEvents
        seteventhandler Ex = GoalHasEnded scr = Goal_EndOfRun_WalkingEvent group = WalkingEndRunEvents
        resetlandedfromvert
        SetWalkingOffTricks
    endswitch
    settags WalkingTricksState = <NewWalkingTrickState>
endscript

script Walk_LandSkaterTricks 
    LandSkaterTricks
    obj_killspawnedscript \{ id = ComboRunOutTrickDisplayDelay }
endscript

script WaitAnimWalking 
    begin 
    DoNextManualTrick \{ ScriptToRunFirst = BeginWalkingManualTrick FromWalk }
    DoNextTrick
    if Skater_AnimComplete
        break 
    endif
    wait \{ 1 gameframe }
    repeat 
endscript

script WaitWalking 
    begin 
    DoNextManualTrick \{ ScriptToRunFirst = BeginWalkingManualTrick FromWalk }
    DoNextTrick
    wait \{ 1 gameframe }
    repeat 
endscript

script PlayWalkAnim 
    Skater_Playanim <...> 
    if IsBoardMissing
        if NOT IsForceWalkOn
            AppendSuffixToChecksum base = <anim> suffixstring = '_Partial'
            if anim_animexists anim = <appended_id> ReferenceChecksum = thps7_human
                Skater_PlayNoBoardOverlayAnim anim = <appended_id>
                return 
            endif
        endif
    endif
    Skater_NoBoardOverlayAnimOff
endscript
runningturnleftanim = FastRun_LeanLeft_D
runningturnrightanim = FastRun_LeanRight_D

script WaitWalkingFrame 
    DoNextManualTrick \{ ScriptToRunFirst = BeginWalkingManualTrick FromWalk }
    DoNextTrick
    wait \{ 1 gameframe }
endscript

script WaitAnimWalkingFrame 
    DoNextManualTrick \{ ScriptToRunFirst = BeginWalkingManualTrick FromWalk }
    DoNextTrick
    if Skater_AnimComplete
        return 
    endif
    wait \{ 1 gameframe }
endscript

script ClearAllWalkingExceptions 
    ClearExceptionGroup \{ WalkingStateExceptions }
    ClearExceptionGroup \{ WalkingEvents }
    ClearExceptionGroup \{ WalkingEndRunEvents }
    ClearExceptionGroup \{ WalkingTransitionTrickExceptions }
    ClearExceptionGroup \{ WalkingCollideEvents }
    ClearExceptionGroup \{ RunTimerEvents }
endscript
JustStoppedSkatingState_ExceptionTable = [
    { exception Ex = run scr = SkateToRunState }
    { exception Ex = stand scr = SkateToStandState }
    { exception Ex = skid scr = SkateToStandState }
    { exception Ex = LadderOntoBottom scr = LadderOntoBottomState }
    { exception Ex = LadderOntoTop scr = LadderOntoTopState }
    { exception Ex = land scr = LandState }
    { exception Ex = hang scr = AirToHangState }
    { exception Ex = Ladder scr = LadderMoveUpState }
    { exception Ex = Air scr = SkateToAirState }
    { exception Ex = jump scr = SkateToAirState }
    { exception Ex = WalkOffEdge scr = SkateToAirState }
    { exception Ex = droptohang scr = DropToHangState }
    { exception Ex = Rail scr = WalkingToRailTrick }
    { exception Ex = wallplant scr = WallplantState }
    { exception Ex = wallrunup scr = WallRunUpState }
    { exception Ex = WallRunRight scr = WallRunRightState }
    { exception Ex = WallRunLeft scr = WallRunLeftState }
]
JustStoppedSkatingState_Restart_ExceptionTable = [
    { exception Ex = run scr = StandState }
    { exception Ex = stand scr = StandState }
    { exception Ex = skid scr = StandState }
    { exception Ex = land scr = StandState }
    { exception Ex = LadderOntoBottom scr = LadderOntoBottomState }
    { exception Ex = LadderOntoTop scr = LadderOntoTopState }
    { exception Ex = hang scr = HangState }
    { exception Ex = Ladder scr = LadderMoveUpState }
    { exception Ex = Air scr = AirState }
    { exception Ex = jump scr = AirState }
    { exception Ex = WalkOffEdge scr = AirState }
    { exception Ex = droptohang scr = DropToHangState }
    { exception Ex = Rail scr = WalkingToRailTrick }
    { exception Ex = wallplant scr = WallplantState }
    { exception Ex = wallrunup scr = WallRunUpState }
    { exception Ex = WallRunRight scr = WallRunRightState }
    { exception Ex = WallRunLeft scr = WallRunLeftState }
]

script JustStoppedSkatingState 
    if NOT GotParam restart
        ResetEventHandlersFromTable JustStoppedSkatingState_ExceptionTable group = WalkingStateExceptions
        SetException Ex = AcidDrop scr = WalkingAirToTransitionTrick group = WalkingTransitionTrickExceptions
    else
        ResetEventHandlersFromTable JustStoppedSkatingState_Restart_ExceptionTable group = WalkingStateExceptions
        SetException Ex = AcidDrop scr = WalkingAirToTransitionTrick group = WalkingTransitionTrickExceptions
        PlayWalkAnim anim = WStand BlendPeriod = 0
        BlendperiodOut 0
        GetCameraId
        <cameraid> ::WalkCamera_Reset
    endif
    if IsNGC
        seteventhandler Ex = trigger_l1 scr = CameraFlushButton group = WalkingEvents
    else
        if ((IsXbox)|| (isPC))
            seteventhandler Ex = trigger_l1 scr = CameraFlushButton group = WalkingEvents
        else
            seteventhandler Ex = trigger_l2 scr = CameraFlushButton group = WalkingEvents
        endif
    endif
    seteventhandler Ex = release_x scr = JumpButton group = WalkingEvents
    seteventhandler Ex = MadeOtherSkaterBail scr = MadeOtherSkaterBailWalk group = WalkingCollideEvents
    SetException Ex = SkaterCollideBail scr = SkaterCollideBail group = WalkingCollideEvents
    settags WalkingGroundTricksInactive
    obj_spawnscriptlater ActivateGroundTricksDelay id = ActivateGroundTricksDelay
    SetWalkingTrickState NewWalkingTrickState = unset
    Walk_ResetPeakHeight
    if currentscorepotgreaterthan 0
        obj_spawnscriptlater ComboRunOutTrickDisplayDelay id = ComboRunOutTrickDisplayDelay
    endif
    WaitWalking
endscript
SkateToRunState_ExceptionTable = [
    {
        exception
        Ex = stand
        scr = SkateToStandState
        params = { synctopreviousanim }
    }
    {
        exception
        Ex = skid
        scr = SkateToStandState
        params = { synctopreviousanim }
    }
    { exception Ex = LadderOntoBottom scr = LadderOntoBottomState }
    { exception Ex = LadderOntoTop scr = LadderOntoTopState }
    { exception Ex = jump scr = RunJumpState }
    { exception Ex = HighHop scr = RunHighHopState }
    { exception Ex = WalkOffEdge scr = AirState }
    { exception Ex = droptohang scr = DropToHangState }
]

script SkateToRunState 
    ResetEventHandlersFromTable \{ SkateToRunState_ExceptionTable group = WalkingStateExceptions }
    seteventhandler \{ Ex = JumpRequested scr = JumpRequestedEvent group = WalkingEvents }
    SetWalkingTrickState \{ NewWalkingTrickState = Ground }
    Walk_ScaleAnimSpeed \{ Off }
    getspeed
    if (<Speed> > 10)
        Skater_Playanim anim = WSkateToRun norestart <...> 
    else
        Skater_Playanim anim = SkateToWalk norestart <...> 
    endif
    WaitAnimWalking
    goto \{ RunState }
endscript
SkateToStandState_ExceptionTable = [
    {
        exception
        Ex = run
        scr = SkateToRunState
        params = { synctopreviousanim }
    }
    { exception Ex = LadderOntoBottom scr = LadderOntoBottomState }
    { exception Ex = LadderOntoTop scr = LadderOntoTopState }
    { exception Ex = jump scr = RunJumpState }
    { exception Ex = HighHop scr = RunHighHopState }
    { exception Ex = WalkOffEdge scr = AirState }
    { exception Ex = droptohang scr = DropToHangState }
]

script SkateToStandState 
    ResetEventHandlersFromTable SkateToStandState_ExceptionTable group = WalkingStateExceptions
    seteventhandler Ex = JumpRequested scr = JumpRequestedEvent group = WalkingEvents
    SetWalkingTrickState NewWalkingTrickState = Ground
    Walk_ScaleAnimSpeed Off
    if Skater_AnimEquals [SlowDownBrake NewBrakeIdle NewBrakeIdle3 NewBrakeIdle6 NewBrakeIdle7 NewBrakeIdle8]
        Skater_Playanim anim = BrakeToStand BlendPeriod = 0.3000
    else
        if Skater_AnimEquals WRunToSkate
            Skater_Playanim anim = SlowSkateToStand BlendPeriod = 0.3000 synctoreversepreviousanim effectivepreviousanimduration = 0.5000 <...> 
        else
            Skater_Playanim anim = SlowSkateToStand BlendPeriod = 0.1000 <...> 
        endif
    endif
    WaitAnimWalking
    goto StandState
endscript
SkateToAirState_ExceptionTable = [
    { exception Ex = land scr = LandState }
    { exception Ex = hang scr = AirToHangState }
    { exception Ex = Ladder scr = LadderMoveUpState }
    { exception Ex = wallplant scr = WallplantState }
    { exception Ex = WallRunRight scr = WallRunRightState }
    { exception Ex = WallRunLeft scr = WallRunLeftState }
]

script SkateToAirState 
    ResetEventHandlersFromTable \{ SkateToAirState_ExceptionTable group = WalkingStateExceptions }
    SetWalkingTrickState \{ NewWalkingTrickState = Air }
    Walk_ScaleAnimSpeed \{ Off }
    Skater_Playanim \{ anim = AirIdleToJumpAir BlendPeriod = 0.3000 }
    WaitAnimWalking
    goto \{ AirState }
endscript
RunState_ExceptionTable = [
    { exception Ex = stand scr = StandState }
    { exception Ex = LadderOntoBottom scr = LadderOntoBottomState }
    { exception Ex = LadderOntoTop scr = LadderOntoTopState }
    { exception Ex = jump scr = RunJumpState }
    { exception Ex = HighHop scr = RunHighHopState }
    { exception Ex = WalkOffEdge scr = AirState }
    { exception Ex = droptohang scr = DropToHangState }
    { exception Ex = ride scr = StandToRideState }
    { exception Ex = wallrunup scr = WallRunUpState }
    { exception Ex = WallRunRight scr = WallRunRightState }
    { exception Ex = WallRunLeft scr = WallRunLeftState }
    {
        exception
        Ex = MountBoard
        scr = WalkingMountGhostBoard
        params = { add_speed = 500 }
    }
]
RunStateIndoor_ExceptionTable = [
    {
        exception
        Ex = stand
        scr = StandState
        params = { indoor }
    }
]

script RunState 
    if NOT Walk_IsIndoors
        ResetEventHandlersFromTable RunState_ExceptionTable group = WalkingStateExceptions
        if GotParam NoSkid
            SetException Ex = skid scr = StandState group = WalkingStateExceptions
        else
            SetException Ex = skid scr = SkidState group = WalkingStateExceptions
        endif
        seteventhandler Ex = JumpRequested scr = JumpRequestedEvent group = WalkingEvents
        SetWalkingTrickState NewWalkingTrickState = Ground
        OnExitRun RunState_exit
    else
        ResetEventHandlersFromTable RunStateIndoor_ExceptionTable group = WalkingStateExceptions
    endif
    Walk_EndGroundTrick
    Skater_PlayWalkingAnim no_overlay norestart Cycle BlendPeriod = 0.1000 anim = WalkSlow
    if NOT Walk_IsIndoors
        Skater_RunningTurnAnimOn
    endif
    begin 
    WaitWalkingFrame
    repeat 
endscript

script RunState_exit 
    Skater_RunningTurnAnimOff
endscript

script walk_which_foot_is_forward 
    anim_command \{ target = bodytimer command = timer_getframefactor }
    if (<framefactor> < 0.3000 || <framefactor> > 0.8000)
        printf \{ 'right foot forward' }
        return \{ foot = RIGHT }
    else
        printf \{ 'left foot forward' }
        return \{ foot = left }
    endif
endscript
StandState_ExceptionTable = [
    { exception Ex = run scr = RunState }
    { exception Ex = LadderOntoBottom scr = LadderOntoBottomState }
    { exception Ex = LadderOntoTop scr = LadderOntoTopState }
    { exception Ex = jump scr = StandJumpState }
    { exception Ex = WalkOffEdge scr = AirState }
    { exception Ex = droptohang scr = DropToHangState }
    { exception Ex = ride scr = StandToRideState }
    { exception Ex = wallrunup scr = WallRunUpState }
    { exception Ex = WallRunRight scr = WallRunRightState }
    { exception Ex = WallRunLeft scr = WallRunLeftState }
    {
        exception
        Ex = MountBoard
        scr = WalkingMountGhostBoard
        params = { add_speed = 500 }
    }
]
StandStateIndoor_ExceptionTable = [
    {
        exception
        Ex = run
        scr = RunState
        params = { indoor }
    }
]

script StandState 
    if NOT Walk_IsIndoors
        ResetEventHandlersFromTable StandState_ExceptionTable group = WalkingStateExceptions
        seteventhandler Ex = JumpRequested scr = JumpRequestedEvent group = WalkingEvents
        SetWalkingTrickState NewWalkingTrickState = Ground
        Walk_EndGroundTrick
    else
        ResetEventHandlersFromTable StandStateIndoor_ExceptionTable group = WalkingStateExceptions
    endif
    getspeed
    setspeed (0.4500 * <Speed>)
    Walk_ScaleAnimSpeed Off
    if Skater_AnimEquals [ _180RunSkid SkateToSkid ]
        PlayWalkAnim anim = WStand norestart BlendPeriod = 0.3000
    else
        PlayWalkAnim anim = WStand norestart BlendPeriod = 0.1000
    endif
    WaitAnimWalking
    begin 
    PlayWalkAnim BlendPeriod = 0.1000 anim = Random (
        @*3 WStand
        @ RandomNoRepeat (
            @ WStandIdle1
            @ WStandIdle2
            @ WStandIdle3
            @ WStandIdle4
            @ WStandIdle5
            @ WStandIdle6
        )
    )
    WaitAnimWalking
    repeat 
endscript
SkidState_ExceptionTable = [
    { exception Ex = stand scr = StandState }
    { exception Ex = run scr = RunState }
    { exception Ex = LadderOntoBottom scr = LadderOntoBottomState }
    { exception Ex = LadderOntoTop scr = LadderOntoTopState }
    { exception Ex = jump scr = RunJumpState }
    { exception Ex = HighHop scr = RunHighHopState }
    { exception Ex = WalkOffEdge scr = AirState }
    { exception Ex = droptohang scr = DropToHangState }
    { exception Ex = ride scr = StandToRideState }
    { exception Ex = wallrunup scr = WallRunUpState }
    { exception Ex = WallRunRight scr = WallRunRightState }
    { exception Ex = WallRunLeft scr = WallRunLeftState }
]

script SkidState 
    ResetEventHandlersFromTable \{ SkidState_ExceptionTable group = WalkingStateExceptions }
    seteventhandler \{ Ex = JumpRequested scr = JumpRequestedEvent group = WalkingEvents }
    SetWalkingTrickState \{ NewWalkingTrickState = Ground }
    Walk_ScaleAnimSpeed \{ Off }
    PlayWalkAnim \{ anim = _180RunSkid norestart BlendPeriod = 0.1000 }
    WaitAnimWalking
    goto \{ StandState }
endscript
GroundPunchState_ExceptionTable = [
    { exception Ex = LadderOntoBottom scr = LadderOntoBottomState }
    { exception Ex = LadderOntoTop scr = LadderOntoTopState }
    { exception Ex = jump scr = RunJumpState }
    { exception Ex = WalkOffEdge scr = AirState }
    { exception Ex = droptohang scr = DropToHangState }
    { exception Ex = ride scr = StandToRideState }
]

script GroundPunchState 
    ResetEventHandlersFromTable \{ GroundPunchState_ExceptionTable group = WalkingStateExceptions }
    seteventhandler \{ Ex = JumpRequested scr = JumpRequestedEvent group = WalkingEvents }
    SetWalkingTrickState \{ NewWalkingTrickState = Ground }
    Walk_ScaleAnimSpeed \{ Off }
    PlayWalkAnim \{ anim = WalkingSlap BlendPeriod = 0.1000 }
    WaitAnimWalking
    goto \{ StandState }
endscript
AirPunchState_ExceptionTable = [
    { exception Ex = land scr = LandState }
    { exception Ex = hang scr = AirToHangState }
    { exception Ex = Ladder scr = LadderMoveUpState }
    { exception Ex = jump scr = RunJumpState }
    { exception Ex = wallplant scr = WallplantState }
    { exception Ex = wallrunup scr = WallRunUpState }
    { exception Ex = WallRunRight scr = WallRunRightState }
    { exception Ex = WallRunLeft scr = WallRunLeftState }
]

script AirPunchState 
    ResetEventHandlersFromTable \{ AirPunchState_ExceptionTable group = WalkingStateExceptions }
    SetWalkingTrickState \{ NewWalkingTrickState = Air }
    Walk_ScaleAnimSpeed \{ Off }
    PlayWalkAnim \{ anim = WalkingSlap BlendPeriod = 0.1000 }
    WaitAnimWalking
    goto \{ GroundOrAirWaitState }
endscript
RunJumpState_ExceptionTable = [
    { exception Ex = land scr = LandState }
    { exception Ex = hang scr = AirToHangState }
    { exception Ex = Ladder scr = LadderMoveUpState }
    { exception Ex = wallplant scr = WallplantState }
    { exception Ex = wallrunup scr = WallRunUpState }
    { exception Ex = WallRunRight scr = WallRunRightState }
    { exception Ex = WallRunLeft scr = WallRunLeftState }
]

script RunJumpState anim = RunJump_rt_foot Hopspeed = 1.0
    ResetEventHandlersFromTable RunJumpState_ExceptionTable group = WalkingStateExceptions
    SetWalkingTrickState NewWalkingTrickState = Air
    OnExitRun cleanup_double_jump
    seteventhandler Ex = trigger_x scr = WalkingDoubleJump group = WalkingEvents
    if NOT GotParam vault
        walk_which_foot_is_forward
        if GotParam foot
            if (<foot> = RIGHT)
                anim = RunJump_rt_foot
            else
                anim = RunJump_lt_foot
            endif
        endif
    endif
    Walk_ScaleAnimSpeed Off
    PlayWalkAnim anim = <anim> BlendPeriod = 0.01000 Speed = <Hopspeed>
    WaitAnimWalking
    goto AirState
endscript

script RunHighHopState 
    ClearException \{ HighHop }
    broadcastevent \{ type = RunVault }
    RunJumpState <...> anim = W_Vault vault = vault Hopspeed = 1.300
endscript
StandJumpState_ExceptionTable = [
    { exception Ex = land scr = LandState }
    { exception Ex = hang scr = AirToHangState }
    { exception Ex = Ladder scr = LadderMoveUpState }
    { exception Ex = wallplant scr = WallplantState }
    { exception Ex = wallrunup scr = WallRunUpState }
    { exception Ex = WallRunRight scr = WallRunRightState }
    { exception Ex = WallRunLeft scr = WallRunLeftState }
]

script StandJumpState 
    ResetEventHandlersFromTable \{ StandJumpState_ExceptionTable group = WalkingStateExceptions }
    SetWalkingTrickState \{ NewWalkingTrickState = Air }
    OnExitRun \{ cleanup_double_jump }
    seteventhandler \{Ex = trigger_x scr = WalkingDoubleJump group = WalkingEvents params = { standing }}
    Walk_ScaleAnimSpeed \{ Off }
    PlayWalkAnim \{ anim = StandToJump BlendPeriod = 0.1000 }
    WaitAnimWalking
    goto \{ AirState }
endscript

script cleanup_double_jump 
    ClearEventHandler \{ trigger_x }
endscript
WallplantState_ExceptionTable = [
    { exception Ex = land scr = LandState }
    { exception Ex = hang scr = AirToHangState }
    { exception Ex = Ladder scr = LadderMoveUpState }
    { exception Ex = wallplant scr = WallplantState }
    { exception Ex = wallrunup scr = WallRunUpState }
    { exception Ex = WallRunRight scr = WallRunRightState }
    { exception Ex = WallRunLeft scr = WallRunLeftState }
]

script WallplantState 
    ResetEventHandlersFromTable \{ WallplantState_ExceptionTable group = WalkingStateExceptions }
    SetWalkingTrickState \{ NewWalkingTrickState = Air }
    broadcastevent \{ type = SkaterWallplant }
    if currentscorepotgreaterthan \{ 0 }
        SetTrickName \{ "Wall Jump" }
        SetTrickScore \{ 100 }
        display
    endif
    Walk_ScaleAnimSpeed \{ Off }
    PlayWalkAnim \{ anim = Jump_DoubleJump BlendPeriod = 0.02000 }
    WaitAnimWalking
    goto \{ AirState }
endscript
WallflipState_ExceptionTable = [
    { exception Ex = land scr = LandState }
]

script WallflipState 
    ResetEventHandlersFromTable \{ WallflipState_ExceptionTable group = WalkingStateExceptions }
    SetWalkingTrickState \{ NewWalkingTrickState = Air }
    broadcastevent \{ type = SkaterWallplant }
    SetTrickName \{ "Wall Flip" }
    SetTrickScore \{ 100 }
    display
    OnExitRun \{ WallflipState_exit }
    Walk_SetForwardControlLock \{ on }
    broadcastevent \{ type = wallflip }
    Walk_ScaleAnimSpeed \{ Off }
    PlayWalkAnim \{ anim = Walking_WallFlip BlendPeriod = 0.0 }
    Skater_WaitAnim \{ percent = 50 }
    SetWalkingAirTricks
    WaitAnimWalking
    goto \{ AirState }
endscript

script WallflipState_exit 
    Walk_SetForwardControlLock \{ Off }
    RunTimer_AddTime \{ 1.0 }
endscript
WallRunUpState_ExceptionTable = [
    { exception Ex = hang scr = AirToHangState }
    { exception Ex = Ladder scr = LadderMoveUpState }
    { exception Ex = jump scr = AirState }
    { exception Ex = wallflip scr = WallflipState }
    { exception Ex = GroundGone scr = AirState }
]

script WallRunUpState 
    ResetEventHandlersFromTable WallRunUpState_ExceptionTable group = WalkingStateExceptions
    seteventhandler Ex = JumpRequested scr = JumpRequestedEvent group = WalkingEvents
    SetWalkingTrickState NewWalkingTrickState = Off
    LaunchStateChangeEvent state = Skater_OnWall
    Walk_SetForwardControlLock on
    OnExitRun WallRunUpState_exit
    broadcastevent type = EnterWallRunUp
    Walk_ScaleAnimSpeed Off
    PlayWalkAnim anim = Walking_wallRunUp BlendPeriod = 0.02000 Speed = 0.8000
    SetTrickName 'Wall Run-up'
    SetTrickScore 100
    display
    Walk_LandSkaterTricks
    WaitAnimWalking
    Walk_EndWallRunUp
endscript

script WallRunUpState_exit 
    Walk_SetForwardControlLock \{ Off }
endscript
AirState_ExceptionTable = [
    { exception Ex = land scr = LandState }
    { exception Ex = hang scr = AirToHangState }
    { exception Ex = Ladder scr = LadderMoveUpState }
    { exception Ex = jump scr = RunJumpState }
    { exception Ex = wallplant scr = WallplantState }
    { exception Ex = wallrunup scr = WallRunUpState }
    { exception Ex = WallRunRight scr = WallRunRightState }
    { exception Ex = WallRunLeft scr = WallRunLeftState }
    { exception Ex = wallflip scr = WallflipState }
]

script AirState 
    ResetEventHandlersFromTable \{ AirState_ExceptionTable group = WalkingStateExceptions }
    SetWalkingTrickState \{ NewWalkingTrickState = Air }
    BlockTaggingOff
    Walk_ScaleAnimSpeed \{ Off }
    PlayWalkAnim \{ anim = JumpAirToJumpAirStretch norestart BlendPeriod = 0.1000 }
    WaitWalking
    PlayWalkAnim \{ anim = JumpAirStretch Cycle norestart BlendPeriod = 0.1000 }
    WaitWalking
endscript
LandState_ExceptionTable = [
    { exception Ex = stand scr = StandLandState }
    { exception Ex = run scr = RunLandState }
    { exception Ex = skid scr = SkidState }
    { exception Ex = LadderOntoBottom scr = LadderOntoBottomState }
    { exception Ex = LadderOntoTop scr = LadderOntoTopState }
    { exception Ex = jump scr = RunJumpState }
    { exception Ex = HighHop scr = RunHighHopState }
    { exception Ex = WalkOffEdge scr = AirState }
    { exception Ex = droptohang scr = DropToHangState }
    { exception Ex = wallrunup scr = WallRunUpState }
    { exception Ex = WallRunRight scr = WallRunRightState }
    { exception Ex = WallRunLeft scr = WallRunLeftState }
]

script LandState 
    index = 5
    begin 
    FormatText checksumname = name 'projectile_%i' i = <index>
    if ObjectExists id = <name>
        GetDistance objecta = skater objectb = <name>
        if (60.0 > <dist_atob>)
            <name> ::Die
            WalkingMountGhostBoard
            return 
        endif
    endif
    if (<index> = 9)
        break 
    endif
    index = (<index> + 1)
    repeat 
    ResetEventHandlersFromTable LandState_ExceptionTable group = WalkingStateExceptions
    SetWalkingTrickState NewWalkingTrickState = Ground
    seteventhandler Ex = JumpRequested scr = JumpRequestedEvent group = WalkingEvents
    WaitWalking
endscript
StandLandState_ExceptionTable = [
    { exception Ex = run scr = RunState }
    { exception Ex = skid scr = SkidState }
    { exception Ex = LadderOntoBottom scr = LadderOntoBottomState }
    { exception Ex = LadderOntoTop scr = LadderOntoTopState }
    { exception Ex = jump scr = StandJumpState }
    { exception Ex = WalkOffEdge scr = AirState }
    { exception Ex = droptohang scr = DropToHangState }
    { exception Ex = wallrunup scr = WallRunUpState }
    { exception Ex = WallRunRight scr = WallRunRightState }
    { exception Ex = WallRunLeft scr = WallRunLeftState }
]

script StandLandState 
    ResetEventHandlersFromTable \{ StandLandState_ExceptionTable group = WalkingStateExceptions }
    SetWalkingTrickState \{ NewWalkingTrickState = Ground }
    Walk_ScaleAnimSpeed \{ Off }
    Walk_GetHeightDrop
    if (<height_drop> < 50)
        Skater_Playanim \{ anim = JumpLandToStand BlendPeriod = 0.05000 norestart Speed = 1.200 }
    else
        Skater_Playanim \{ anim = BigJumpLandToStand BlendPeriod = 0.05000 norestart Speed = 2 }
    endif
    WaitAnimWalking
    Walk_ResetPeakHeight
    goto \{ StandState }
endscript
RunLandState_ExceptionTable = [
    { exception Ex = stand scr = StandState }
    { exception Ex = skid scr = SkidState }
    { exception Ex = LadderOntoBottom scr = LadderOntoBottomState }
    { exception Ex = LadderOntoTop scr = LadderOntoTopState }
    { exception Ex = jump scr = RunJumpState }
    { exception Ex = HighHop scr = RunHighHopState }
    { exception Ex = WalkOffEdge scr = AirState }
    { exception Ex = droptohang scr = DropToHangState }
    { exception Ex = wallrunup scr = WallRunUpState }
    { exception Ex = WallRunRight scr = WallRunRightState }
    { exception Ex = WallRunLeft scr = WallRunLeftState }
]

script RunLandState 
    SetWalkingTrickState NewWalkingTrickState = Ground
    Walk_GetHeightDrop
    getspeed
    if (<height_drop> < 150 || <Speed> < 100)
        ResetEventHandlersFromTable RunLandState_ExceptionTable group = WalkingStateExceptions
        getspeed
        if (<Speed> > 10)
            Walk_ScaleAnimSpeed Off
            if (<height_drop> < 60)
                setspeed (<Speed> / 1.100)
                Skater_Playanim anim = JumpLandToRun BlendPeriod = 0.05000 norestart Speed = 1.600
            else
                setspeed (<Speed> / 2.500)
                Skater_Playanim anim = BigJumpLandToRun BlendPeriod = 0.05000 norestart Speed = 1.350
            endif
        else
            setspeed 0
            if (<height_drop> < 60)
                Skater_Playanim anim = JumpLandToStand BlendPeriod = 0.05000 norestart Speed = 1.200
            else
                Skater_Playanim anim = BigJumpLandToStand BlendPeriod = 0.05000 norestart Speed = 2
            endif
        endif
        Walk_ResetPeakHeight
    else
        setspeed (<Speed> / 2)
        ClearExceptionGroup WalkingStateExceptions
        Walk_ResetPeakHeight
        broadcastevent type = GroundRoll
        Walk_StartGroundTrick
        Walk_SetForwardControlLock on
        RunTimer_pause
        OnExitRun GroundRollCleanup
        Skater_Playanim anim = Vault_Roll BlendPeriod = 0.1000 norestart Speed = 2.0
        Skater_WaitAnim percent = 30
        Walk_SetForwardControlLock Off
        Walk_EndGroundTrick
        RunTimer_unpause
        ResetEventHandlersFromTable RunLandState_ExceptionTable group = WalkingStateExceptions
        seteventhandler Ex = JumpRequested scr = JumpRequestedEvent group = WalkingEvents
    endif
    WaitAnimWalking
    goto RunState
endscript

script GroundRollCleanup 
    Walk_SetForwardControlLock \{ Off }
endscript
HangState_ExceptionTable = [
    { exception Ex = hangmoveleft scr = HangMoveLeftState }
    { exception Ex = hangmoveright scr = HangMoveRightState }
    { exception Ex = Air scr = HangDropState }
    { exception Ex = jump scr = HangJumpState }
    { exception Ex = pullupfromhang scr = PullUpFromHangState }
]

script HangState 
    ResetEventHandlersFromTable HangState_ExceptionTable group = WalkingStateExceptions
    seteventhandler Ex = JumpRequested scr = JumpRequestedEvent group = WalkingEvents
    SetQueueTricks WalkHangTricks
    LaunchStateChangeEvent state = Skater_InHang
    Walk_ScaleAnimSpeed Off
    if Skater_AnimEquals [ JumpToSwingHang JumpToWallHang Walking_wallGrab_FromJumpAir ]
        WaitAnimWalking
    endif
    if NOT Walk_IsHangingFromWall
        printf 'no wall'
        anim = HangIdle
    else
        printf 'wall'
        anim = Walking_WallGrab_Idle
    endif
    PlayWalkAnim anim = <anim> Cycle norestart BlendPeriod = <Blend>
    Walk_GetState
    if (<state> = walking_hang)
        walk_gethangangle
        diff_anim_strength = (<hangangle> / 40)
        if (<diff_anim_strength> < 0)
            diff_anim_strength = (0 - <diff_anim_strength>)
        endif
        if (<diff_anim_strength> > 1)
            diff_anim_strength = 1
        endif
        if ((<hangangle> < 5)& (<hangangle> > -5))
            diff_anim = NoOverlay
            diff_anim_strength = 0
        else
            if (<hangangle> > 0)
                if NOT Walk_IsHangingFromWall
                    if Flipped
                        diff_anim = HangIdle_Diff_right
                    else
                        diff_anim = HangIdle_Diff_left
                    endif
                else
                    if Flipped
                        diff_anim = Walking_WallGrab_Idle_Diff_right
                    else
                        diff_anim = Walking_WallGrab_Idle_Diff_left
                    endif
                endif
            else
                if NOT Walk_IsHangingFromWall
                    if Flipped
                        diff_anim = HangIdle_Diff_left
                    else
                        diff_anim = HangIdle_Diff_right
                    endif
                else
                    if Flipped
                        diff_anim = Walking_WallGrab_Idle_Diff_left
                    else
                        diff_anim = Walking_WallGrab_Idle_Diff_right
                    endif
                endif
            endif
        endif
        if anim_animexists anim = <diff_anim> ReferenceChecksum = thps7_human
            Skater_PlayOneFooterAnim anim = <diff_anim> strength = <diff_anim_strength>
        else
            Skater_OneFooterAnimOff
        endif
    else
        Skater_OneFooterAnimOff
    endif
    WaitWalking
endscript
AirToHangState_ExceptionTable = [
    { exception Ex = hangmoveleft scr = HangMoveLeftState }
    { exception Ex = hangmoveright scr = HangMoveRightState }
    { exception Ex = Air scr = HangDropState }
    { exception Ex = jump scr = HangJumpState }
    { exception Ex = pullupfromhang scr = PullUpFromHangState }
]

script AirToHangState 
    ResetEventHandlersFromTable AirToHangState_ExceptionTable group = WalkingStateExceptions
    seteventhandler Ex = JumpRequested scr = JumpRequestedEvent group = WalkingEvents
    SetWalkingTrickState NewWalkingTrickState = Off
    LaunchStateChangeEvent state = Skater_InHang
    Walk_ScaleAnimSpeed Off
    Walk_GetHangInitAnimType
    switch <HangInitAnimType>
        case swing
        anim = JumpToSwingHang
        SetTrickName 'Wire Grab'
        case Wall
        anim = Walking_wallGrab_FromJumpAir
        SetTrickName 'Wall Grab'
    endswitch
    if currentscorepotgreaterthan 0
        SetTrickScore 100
        display
    endif
    PlayWalkAnim anim = <anim> BlendPeriod = 0
    WaitAnimWalking
    goto HangState
endscript

script PlayHangMoveAnimCycle 
    BlendperiodOut 0.3000
    prev_diff_anim = UndeterminedOverlay
    prev_angle = 0
    OnExitRun PlayHangMoveAnimCycle_cleanup
    begin 
    walk_gethangangle
    diff_anim_strength = (<hangangle> / 40)
    if (<diff_anim_strength> < 0)
        diff_anim_strength = (0 - <diff_anim_strength>)
    endif
    if (<diff_anim_strength> > 1)
        diff_anim_strength = 1
    endif
    if ((<hangangle> < 5)& (<hangangle> > -5))
        diff_anim = NoOverlay
        diff_anim_strength = 0
    else
        if (<hangangle> > 0)
            switch <hanganim>
                case Walking_Wallgrab_Shimmy_Left
                case Walking_Wallgrab_Shimmy_Right
                if Flipped
                    diff_anim = Walking_WallGrab_Idle_Diff_right
                else
                    diff_anim = Walking_WallGrab_Idle_Diff_left
                endif
                case hangleft
                case hangright
                if Flipped
                    diff_anim = HangIdle_Diff_right
                else
                    diff_anim = HangIdle_Diff_left
                endif
            endswitch
        else
            switch <hanganim>
                case Walking_Wallgrab_Shimmy_Left
                case Walking_Wallgrab_Shimmy_Right
                if Flipped
                    diff_anim = Walking_WallGrab_Idle_Diff_left
                else
                    diff_anim = Walking_WallGrab_Idle_Diff_right
                endif
                case hangleft
                case hangright
                if Flipped
                    diff_anim = HangIdle_Diff_left
                else
                    diff_anim = HangIdle_Diff_right
                endif
            endswitch
        endif
    endif
    if NOT (<prev_diff_anim> = <diff_anim>)
        Skater_Playanim anim = <hanganim> Cycle <synctopreviousanim> BlendPeriod = 0.1000
        if (<diff_anim> = NoOverlay)
            Skater_OneFooterAnimOff
        else
            if anim_animexists anim = <diff_anim> ReferenceChecksum = thps7_human
                Skater_PlayOneFooterAnim anim = <diff_anim> strength = <diff_anim_strength>
            else
                Skater_OneFooterAnimOff
            endif
        endif
    endif
    if NOT (<hangangle> = 0)
        if NOT (<prev_angle> = <hangangle>)
            anim_command target = OneFootDifference command = Difference_SetStrength params = { strength = <diff_anim_strength> }
        endif
    endif
    prev_diff_anim = <diff_anim>
    prev_angle = <hangangle>
    synctopreviousanim = synctopreviousanim
    DoNextManualTrick ScriptToRunFirst = BeginWalkingManualTrick FromWalk
    DoNextTrick
    wait 1 gameframe
    repeat 
endscript

script PlayHangMoveAnimCycle_cleanup 
    Skater_OneFooterAnimOff
endscript
HangMoveLeftState_ExceptionTable = [
    { exception Ex = hang scr = HangState }
    { exception Ex = hangmoveright scr = HangMoveRightState }
    { exception Ex = Air scr = HangDropState }
    { exception Ex = jump scr = HangJumpState }
    { exception Ex = pullupfromhang scr = PullUpFromHangState }
]

script HangMoveLeftState 
    ResetEventHandlersFromTable HangMoveLeftState_ExceptionTable group = WalkingStateExceptions
    seteventhandler Ex = JumpRequested scr = JumpRequestedEvent group = WalkingEvents
    SetWalkingTrickState NewWalkingTrickState = Off
    LaunchStateChangeEvent state = Skater_InHang
    Walk_ScaleAnimSpeed HangMove
    if NOT Walk_IsHangingFromWall
        if Flipped
            anim = hangleft
        else
            anim = hangright
        endif
    else
        if Flipped
            anim = Walking_Wallgrab_Shimmy_Left
        else
            anim = Walking_Wallgrab_Shimmy_Right
        endif
    endif
    PlayHangMoveAnimCycle hanganim = <anim> ReverseAngle
endscript
HangMoveRightState_ExceptionTable = [
    { exception Ex = hang scr = HangState }
    { exception Ex = hangmoveleft scr = HangMoveLeftState }
    { exception Ex = Air scr = HangDropState }
    { exception Ex = jump scr = HangJumpState }
    { exception Ex = pullupfromhang scr = PullUpFromHangState }
]

script HangMoveRightState 
    ResetEventHandlersFromTable HangMoveRightState_ExceptionTable group = WalkingStateExceptions
    seteventhandler Ex = JumpRequested scr = JumpRequestedEvent group = WalkingEvents
    SetWalkingTrickState NewWalkingTrickState = Off
    LaunchStateChangeEvent state = Skater_InHang
    Walk_ScaleAnimSpeed HangMove
    if NOT Walk_IsHangingFromWall
        if Flipped
            anim = hangright
        else
            anim = hangleft
        endif
    else
        if Flipped
            printf 'WAH!'
            anim = Walking_Wallgrab_Shimmy_Right
        else
            anim = Walking_Wallgrab_Shimmy_Left
        endif
    endif
    PlayHangMoveAnimCycle hanganim = <anim>
endscript
HangToAirState_ExceptionTable = [
    { exception Ex = land scr = LandState }
    { exception Ex = hang scr = AirToHangState }
    { exception Ex = Ladder scr = LadderMoveUpState }
    { exception Ex = wallplant scr = WallplantState }
    { exception Ex = wallrunup scr = WallRunUpState }
    { exception Ex = WallRunRight scr = WallRunRightState }
    { exception Ex = WallRunLeft scr = WallRunLeftState }
]

script HangDropState 
    ResetEventHandlersFromTable \{ HangToAirState_ExceptionTable group = WalkingStateExceptions }
    ClearException \{ JumpRequested }
    SetWalkingTrickState \{ NewWalkingTrickState = Air }
    Walk_ScaleAnimSpeed \{ Off }
    PlayWalkAnim \{ anim = HangIdleToDrop BlendPeriod = 0.05000 }
    WaitAnimWalking
    goto \{ AirState }
endscript

script HangJumpState 
    ResetEventHandlersFromTable \{ HangToAirState_ExceptionTable group = WalkingStateExceptions }
    ClearException \{ JumpRequested }
    SetWalkingTrickState \{ NewWalkingTrickState = Air }
    Walk_ScaleAnimSpeed \{ Off }
    if Walk_IsHangingFromWall
        goto \{ HangJumpOutState }
    endif
    PlayWalkAnim \{ anim = HangIdleToDrop BlendPeriod = 0.05000 }
    WaitAnimWalking
    goto \{ AirState }
endscript

script HangJumpOutState 
    rotate
    PlayWalkAnim \{ anim = Walking_WallGrab_JumpBack BlendPeriod = 0 }
    Walk_Jump
    Walk_ForwardBoost \{ 200 }
    WaitAnimWalking
    goto \{ AirState }
endscript
PullUpFromHangState_ExceptionTable = [
    { exception Ex = jump scr = AirState }
]

script PullUpFromHangState 
    ResetEventHandlersFromTable \{ PullUpFromHangState_ExceptionTable group = WalkingStateExceptions }
    seteventhandler \{ Ex = JumpRequested scr = JumpRequestedEvent group = WalkingEvents }
    SetWalkingTrickState \{ NewWalkingTrickState = Off }
    LaunchStateChangeEvent \{ state = Skater_InHang }
    if NOT Walk_IsHangingFromWall
        anim = HangOntoTheTop
    else
        anim = Walking_Wallgrab_OntoTheTop
    endif
    Walk_ScaleAnimSpeed \{ Off }
    PlayWalkAnim anim = <anim> BlendPeriod = 0.05000 Speed = (walk_parameters.hang_anim_wait_speed)
    WaitAnimWalking
    Walk_AnimWaitComplete
    goto \{ GroundOrAirWaitState }
endscript
DropToHangState_ExceptionTable = [
    { exception Ex = jump scr = AirState }
]

script DropToHangState 
    ResetEventHandlersFromTable \{ DropToHangState_ExceptionTable group = WalkingStateExceptions }
    SetWalkingTrickState \{ NewWalkingTrickState = Off }
    LaunchStateChangeEvent \{ state = Skater_InHang }
    if NOT Walk_IsHangingFromWall
        anim = StandToHang
    else
        anim = Walking_Wallgrab_FromStand
    endif
    Walk_ScaleAnimSpeed \{ Off }
    PlayWalkAnim anim = <anim> BlendPeriod = 0.3000 Speed = (walk_parameters.hang_anim_wait_speed)
    WaitAnimWalking
    Walk_AnimWaitComplete
    HangState \{ Blend = 0.0 }
endscript
LadderOntoBottomState_ExceptionTable = [
    { exception Ex = jump scr = AirState }
]

script LadderOntoBottomState 
    ResetEventHandlersFromTable \{ LadderOntoBottomState_ExceptionTable group = WalkingStateExceptions }
    SetWalkingTrickState \{ NewWalkingTrickState = Off }
    LaunchStateChangeEvent \{ state = Skater_OnLadder }
    Walk_ScaleAnimSpeed \{ Off }
    PlayWalkAnim anim = LadderClimbFromStandIdle BlendPeriod = 0.3000 Speed = (walk_parameters.ladder_anim_wait_speed)
    WaitAnimWalking
    Walk_AnimWaitComplete
    goto \{ LadderMoveUpState }
endscript
LadderOntoTopState_ExceptionTable = [
    { exception Ex = jump scr = AirState }
]

script LadderOntoTopState 
    ResetEventHandlersFromTable \{ LadderOntoTopState_ExceptionTable group = WalkingStateExceptions }
    SetWalkingTrickState \{ NewWalkingTrickState = Off }
    LaunchStateChangeEvent \{ state = Skater_OnLadder }
    Walk_ScaleAnimSpeed \{ Off }
    PlayWalkAnim anim = LadderOntoTheTop backwards BlendPeriod = 0.3000 Speed = (walk_parameters.ladder_anim_wait_speed)
    WaitAnimWalking
    Walk_AnimWaitComplete
    goto \{ LadderMoveDownState }
endscript
LadderMoveUpState_ExceptionTable = [
    {
        exception
        Ex = laddermovedown
        scr = LadderMoveDownState
        params = { synctopreviousanim }
    }
    {
        exception
        Ex = LadderSlideDown
        scr = LadderSlideDownState
        params = { synctopreviousanim }
    }
    { exception Ex = LadderOffBottom scr = LadderOffBottomState }
    { exception Ex = LadderOffTop scr = LadderOffTopState }
    { exception Ex = jump scr = AirState }
]

script LadderMoveUpState 
    ResetEventHandlersFromTable \{ LadderMoveUpState_ExceptionTable group = WalkingStateExceptions }
    seteventhandler \{ Ex = JumpRequested scr = JumpRequestedEvent group = WalkingEvents }
    SetWalkingTrickState \{ NewWalkingTrickState = Off }
    LaunchStateChangeEvent \{ state = Skater_OnLadder }
    Walk_ScaleAnimSpeed \{ LadderMove }
    PlayWalkAnim anim = LadderFastClimb Cycle BlendPeriod = 0.3000 <...> 
    WaitAnimWalking
endscript
LadderMoveDownState_ExceptionTable = [
    {
        exception
        Ex = laddermoveup
        scr = LadderMoveUpState
        params = { synctopreviousanim }
    }
    {
        exception
        Ex = LadderSlideDown
        scr = LadderSlideDownState
        params = { synctopreviousanim }
    }
    { exception Ex = LadderOffBottom scr = LadderOffBottomState }
    { exception Ex = LadderOffTop scr = LadderOffTopState }
    { exception Ex = jump scr = AirState }
]

script LadderMoveDownState 
    ResetEventHandlersFromTable \{ LadderMoveDownState_ExceptionTable group = WalkingStateExceptions }
    seteventhandler \{ Ex = JumpRequested scr = JumpRequestedEvent group = WalkingEvents }
    SetWalkingTrickState \{ NewWalkingTrickState = Off }
    LaunchStateChangeEvent \{ state = Skater_OnLadder }
    Walk_ScaleAnimSpeed \{ LadderMove }
    PlayWalkAnim anim = LadderFastClimb Cycle backwards BlendPeriod = 0.3000 <...> 
    WaitAnimWalking
endscript
LadderSlideDownState_ExceptionTable = [
    { exception Ex = LadderOffBottom scr = LadderSlideOffBottomState }
    { exception Ex = jump scr = AirState }
]

script LadderSlideDownState 
    ResetEventHandlersFromTable LadderSlideDownState_ExceptionTable group = WalkingStateExceptions
    seteventhandler Ex = JumpRequested scr = JumpRequestedEvent group = WalkingEvents
    SetWalkingTrickState NewWalkingTrickState = Off
    LaunchStateChangeEvent state = Skater_OnLadder
    Walk_ScaleAnimSpeed Off
    PlayWalkAnim anim = LadderSlide_climb2slide BlendPeriod = 0.0 Speed = 4.0
    WaitAnimWalking
    PlayWalkAnim anim = LadderSlide_loop BlendPeriod = 0.0 Cycle
    begin 
    if Skater_AnimComplete
        break 
    endif
    if NOT Held Circle
        LadderSlideDownExitState
    endif
    wait 1 gameframe
    repeat 
endscript

script LadderSlideDownExitState 
    ResetEventHandlersFromTable \{ LadderSlideDownState_ExceptionTable group = WalkingStateExceptions }
    PlayWalkAnim \{ anim = LadderSlide_climb2slide backwards Speed = 3.0 }
    WaitAnimWalking
    if NOT GotParam \{ down }
        LadderMoveUpState
    else
        LadderMoveDownState
    endif
endscript
LadderOffBottomState_ExceptionTable = [
    { exception Ex = jump scr = AirState }
]

script LadderOffBottomState 
    ResetEventHandlersFromTable \{ LadderOffBottomState_ExceptionTable group = WalkingStateExceptions }
    SetWalkingTrickState \{ NewWalkingTrickState = Off }
    LaunchStateChangeEvent \{ state = Skater_OnLadder }
    Walk_ScaleAnimSpeed \{ Off }
    PlayWalkAnim anim = LadderClimbFromStandIdle backwards BlendPeriod = 0.3000 Speed = (walk_parameters.ladder_anim_wait_speed)
    WaitAnimWalking
    Walk_AnimWaitComplete
    PlayWalkAnim \{ anim = WStand Cycle BlendPeriod = 0.3000 }
    goto \{ GroundOrAirWaitState }
endscript

script LadderSlideOffBottomState 
    ResetEventHandlersFromTable \{ LadderOffBottomState_ExceptionTable group = WalkingStateExceptions }
    SetWalkingTrickState \{ NewWalkingTrickState = Off }
    LaunchStateChangeEvent \{ state = Skater_OnLadder }
    Walk_ScaleAnimSpeed \{ Off }
    PlayWalkAnim anim = LadderSlide_slide2stand BlendPeriod = 0.3000 Speed = (walk_parameters.ladder_anim_wait_speed)
    WaitAnimWalking
    Walk_AnimWaitComplete
    rotate
    PlayWalkAnim \{ anim = WStand Cycle BlendPeriod = 0 }
    goto \{ GroundOrAirWaitState }
endscript
LadderOffTopState_ExceptionTable = [
    { exception Ex = jump scr = AirState }
]

script LadderOffTopState 
    ResetEventHandlersFromTable \{ LadderOffTopState_ExceptionTable group = WalkingStateExceptions }
    SetWalkingTrickState \{ NewWalkingTrickState = Off }
    LaunchStateChangeEvent \{ state = Skater_OnLadder }
    Walk_ScaleAnimSpeed \{ Off }
    PlayWalkAnim anim = LadderOntoTheTop BlendPeriod = 0.3000 Speed = (walk_parameters.ladder_anim_wait_speed)
    WaitAnimWalking
    Walk_AnimWaitComplete
    PlayWalkAnim \{ anim = WStand Cycle BlendPeriod = 0.3000 }
    goto \{ GroundOrAirWaitState }
endscript

script WalkBailState 
    ClearTrickQueue
    ClearExceptionGroup WalkingStateExceptions
    BailSkaterTricks
    disableplayerinput AllowCameraControl
    inbail
    BashOn
    if NOT IsBoardMissing
        obj_spawnscriptlater BailBoardControl params = {BoardOffFrame = 10 BoardVel = (0.0, 0.0, 200.0) BoardRotVel = (0.0, 0.0, 0.0) BoardSkaterVel = 1}
    endif
    Walk_ScaleAnimSpeed Off
    PlayWalkAnim anim = WalkingBail
    Skater_WaitAnimFinished
    PlayWalkAnim anim = WalkingBail pingpong from = end Speed = 0.8000 BlendPeriod = 0.1000
    WaitForEvent type = stand
    PlayWalkAnim anim = WalkingBailGetUp
    Skater_WaitAnimFinished
    SwitchOnBoard
    Baildone
    goto StandState
endscript
GroundOrAirWaitState_ExceptionTable = [
    { exception Ex = run scr = RunState }
    { exception Ex = stand scr = StandState }
    { exception Ex = skid scr = SkidState }
    { exception Ex = hang scr = AirToHangState }
    { exception Ex = Ladder scr = LadderMoveUpState }
    { exception Ex = LadderOntoBottom scr = LadderOntoBottomState }
    { exception Ex = LadderOntoTop scr = LadderOntoTopState }
    { exception Ex = land scr = LandState }
    { exception Ex = Air scr = AirState }
    { exception Ex = jump scr = StandJumpState }
    { exception Ex = WalkOffEdge scr = AirState }
    { exception Ex = droptohang scr = DropToHangState }
    { exception Ex = Rail scr = WalkingToRailTrick }
    { exception Ex = wallplant scr = WallplantState }
    { exception Ex = wallrunup scr = WallRunUpState }
    { exception Ex = WallRunRight scr = WallRunRightState }
    { exception Ex = WallRunLeft scr = WallRunLeftState }
]

script GroundOrAirWaitState 
    ResetEventHandlersFromTable \{ GroundOrAirWaitState_ExceptionTable group = WalkingStateExceptions }
    SetException \{ Ex = AcidDrop scr = WalkingAirToTransitionTrick group = WalkingTransitionTrickExceptions }
    WaitWalking
endscript

script StandToRideState 
    ClearAllWalkingExceptions
    goto \{ RideState }
endscript

script RideState 
    ClearExceptionGroup \{ WalkingStateExceptions }
    SetException \{ Ex = stand scr = RideToStandState group = WalkingStateExceptions }
    begin 
    wait \{ 1 gameframe }
    repeat 
endscript

script RideToStandState 
    ClearExceptionGroup \{ WalkingStateExceptions }
    goto \{ StandState }
endscript

script CameraFlushButton 
    GetCameraId
    <cameraid> ::WalkCamera_FlushRequest
endscript

script JumpButton 
    LaunchEvent \{ type = JumpRequested }
endscript

script JumpRequestedEvent 
    ClearEventHandler JumpRequested
    if NOT walking
        return 
    endif
    if IsTagging
        seteventhandler Ex = JumpRequested scr = JumpRequestedEvent group = WalkingEvents
        return 
    endif
    Walk_GetState
    switch <state>
        case WALKING_GROUND
        Walk_Jump
        LaunchEvent type = jump
        case WALKING_WALL
        Walk_Jump
        LaunchEvent type = jump
        case WALKING_AIR
        Walk_GetStateTime
        if (<StateTime> < Skater_Late_Jump_Slop)
            Walk_Jump
            LaunchEvent type = jump
        endif
        case walking_hang
        walk_getstateduration
        if (<stateduration> > 0.5000)
            Walk_Jump
            LaunchEvent type = jump
        else
            walk_getpreviousstate
            if NOT (<previousstate> = WALKING_AIR)
                Walk_Jump
                LaunchEvent type = jump
            else
                seteventhandler Ex = JumpRequested scr = JumpRequestedEvent group = WalkingEvents
            endif
        endif
        case WALKING_LADDER
        Walk_Jump
        LaunchEvent type = jump
        case WALKING_ANIMWAIT
        Walk_Jump
        LaunchEvent type = jump
    endswitch
endscript

script WalkingDoubleJump 
    ClearEventHandler \{ JumpRequested }
    ClearEventHandler \{ trigger_x }
    if NOT walking
        return 
    endif
    Walk_Jump
    if NOT GotParam \{ standing }
        if AbilityEnabled \{ walkingflip }
            walk_frontflip
        else
            Skater_WaitAnimFinished
            PlayWalkAnim \{ anim = JumpAirToJumpAirStretch BlendPeriod = 0.0 Speed = 2 }
        endif
        Walk_ForwardBoost \{ 300 }
    else
        if AbilityEnabled \{ walkingflip }
            walk_backflip
        endif
    endif
    LaunchEvent \{ type = jump }
endscript

script walk_backflip 
    SetTrickName \{ "Back Tuck" }
    SetTrickScore \{ 100 }
    display
    PlayWalkAnim \{ anim = W_BackFlip BlendPeriod = 0.1000 Speed = 1.100 }
endscript

script walk_frontflip 
    SetTrickName \{ "Front Tuck" }
    SetTrickScore \{ 100 }
    display
    PlayWalkAnim \{ anim = W_FrontFlip BlendPeriod = 0.1000 Speed = 1.100 }
endscript

script flip_skater_if_180_off 
    if invertair
        return 
    endif
    if InManual
        return 
    endif
    GetActualSpin
    begin 
    if ((<spin> > 360)|| (<spin> = 360))
        spin = (<spin> - 360)
    else
        break 
    endif
    repeat 
    if (<spin> < 270)
        if (<spin> > 90)
            FlipAfter
            RotateAfter
            BlendperiodOut \{ 0 }
        endif
    endif
endscript
max_sticker_streak_angle = 60.0
max_graffiti_streak_angle = 60.0

script do_tag_sfx 
    obj_spawnscriptlater \{ THUG2_SFX_Tag_Spray_Wallplant }
endscript

script spawned_wall_tag anim = Standing_Tag2
    ClearTrickQueue
    OnExitRun TagClearFlagsScript
    ProjectilesOff
    EnterTagging
    Walk_StartGroundTrick
    ClearExceptionGroup WalkingStateExceptions
    SetException Ex = SkaterCollideBail scr = SkaterCollideBail
    Walk_ScaleAnimSpeed Off
    TurnOnSpecialItem specialitem_details = spraycan_details
    Skater_Playanim anim = <anim> BlendPeriod = 0.0
    begin 
    if NOT Held triangle
        break 
    endif
    if Skater_AnimComplete
        broadcastevent type = GraffitiTag
        break 
    endif
    wait 1 gameframe
    repeat 
    if GotParam is_hanging
        goto HangState
    else
        goto GroundOrAirWaitState
    endif
endscript

script TagClearFlagsScript 
    ProjectilesOn
    ExitTagging
    Walk_EndGroundTrick
    TagClearFlags
    TurnOffSpecialItem
    obj_spawnscriptlater \{ SpawnedPaintCleanup }
endscript

script SpawnedPaintCleanup 
    SprayPaintOff
    wait \{ 10 gameframes }
    SprayPaintOff
endscript
graffitiTag_ExceptionTable = [
    {
        exception
        Ex = tag_ground
        scr = spawned_wall_tag
        params = { anim = Standing_Tag_Ground }
    }
    { exception Ex = tag_wall scr = spawned_wall_tag }
]

script graffiti_tag 
    if NOT Walk_IsIndoors
        setspeed \{ 0 }
        ClearExceptionGroup \{ WalkingStateExceptions }
        ResetEventHandlersFromTable \{ graffitiTag_ExceptionTable group = WalkingStateExceptions }
        AttemptTag
    endif
    goto \{ StandState }
endscript
hangingTag_ExceptionTable = [
    {
        exception
        Ex = tag_wall
        scr = spawned_wall_tag
        params = { anim = Wallgrab_Tag is_hanging }
    }
]

script hanging_graffiti_tag 
    ClearExceptionGroup \{ WalkingStateExceptions }
    ResetEventHandlersFromTable \{ hangingTag_ExceptionTable group = WalkingStateExceptions }
    AttemptTag
    goto \{ HangState }
endscript

script GraffitiTagTrick 
    printf \{ 'graffiti tag' }
    switch <tag_size>
        case 100
        Score = 3000
        case 75
        Score = 2000
        default 
        Score = 1000
    endswitch
    SetTrickScore <Score>
    SetTrickName \{ 'Graffiti Tag' }
    display
    RunTimer_AddTime \{ 0.5000 }
endscript

script walking_stance_toggle 
    ClearTrickQueues
    SetQueueTricks \{ NoTricks }
    Walk_StartGroundTrick
    getspeed
    if (<Speed> > 10)
        MakeSkaterGoto \{StanceToggleRunning params = { BlendPeriod = 0 }}
    else
        MakeSkaterGoto \{StanceToggleStanding params = { BlendPeriod = 0 }}
    endif
endscript
StanceToggleRunning_ExceptionTable = [
    {
        exception
        Ex = stand
        scr = StanceToggleStanding
        params = { synctopreviousanim }
    }
    {
        exception
        Ex = skid
        scr = StanceToggleStanding
        params = { synctopreviousanim }
    }
    { exception Ex = WalkOffEdge scr = AirState }
]

script StanceToggleRunning 
    ResetEventHandlersFromTable \{ StanceToggleRunning_ExceptionTable group = WalkingStateExceptions }
    if GotParam \{ synctopreviousanim }
        from = current
    endif
    Skater_Playanim anim = W_Boardswitch_Running from = <from> Speed = <Speed> BlendPeriod = <BlendPeriod>
    Skater_WaitAnimFinished
    flip
    SetWalkingGroundTricks
    Walk_EndGroundTrick
    MakeSkaterGoto \{ RunState }
endscript
StanceToggleStanding_ExceptionTable = [
    {
        exception
        Ex = run
        scr = StanceToggleRunning
        params = { synctopreviousanim }
    }
    { exception Ex = WalkOffEdge scr = AirState }
]

script StanceToggleStanding 
    ResetEventHandlersFromTable \{ StanceToggleStanding_ExceptionTable group = WalkingStateExceptions }
    if GotParam \{ synctopreviousanim }
        from = current
    endif
    Skater_Playanim anim = W_Boardswitch_Standing from = <from> Speed = <Speed> BlendPeriod = <BlendPeriod>
    Skater_WaitAnimFinished
    flip
    SetWalkingGroundTricks
    Walk_EndGroundTrick
    MakeSkaterGoto \{ StandState }
endscript

script boardsmack 
    if NOT ScreenElementExists \{ id = ped_speech_dialog }
        if NOT IsBoardMissing
            if NOT anim_command \{ target = ThrowSwitch command = partialswitch_ison }
                ClearTrickQueues
                SetQueueTricks \{ NoTricks }
                getspeed
                if (<Speed> > 10)
                    MakeSkaterGoto \{BoardSmackRunning params = { BlendPeriod = 0 }}
                else
                    MakeSkaterGoto \{BoardSmackStanding params = { BlendPeriod = 0 }}
                endif
            endif
        endif
    endif
    goto \{ GroundOrAirWaitState }
endscript
BoardSmackRunning_ExceptionTable = [
    {
        exception
        Ex = stand
        scr = BoardSmackStanding
        params = { synctopreviousanim }
    }
    {
        exception
        Ex = skid
        scr = BoardSmackStanding
        params = { synctopreviousanim }
    }
    { exception Ex = WalkOffEdge scr = AirState }
    { exception Ex = BoardSmack_exit scr = BoardSmack_exit }
    { exception Ex = GroundGone scr = BoardSmackGroundGone }
    { exception Ex = WalkOffEdge scr = BoardSmackGroundGone }
]
BoardSmackBackwardsRunning_ExceptionTable = [
    {
        exception
        Ex = stand
        scr = BoardSmackStanding
        params = { synctopreviousanim backwards = backwards }
    }
    {
        exception
        Ex = skid
        scr = BoardSmackStanding
        params = { synctopreviousanim backwards = backwards }
    }
    { exception Ex = WalkOffEdge scr = AirState }
    { exception Ex = GroundGone scr = BoardSmackGroundGone }
    { exception Ex = WalkOffEdge scr = BoardSmackGroundGone }
]

script BoardSmackRunning 
    OnExitRun \{ BoardSmack_cleanup }
    Walk_StartGroundTrick
    if GotParam \{ backwards }
        ResetEventHandlersFromTable \{ BoardSmackBackwardsRunning_ExceptionTable group = WalkingStateExceptions }
    else
        ResetEventHandlersFromTable \{ BoardSmackRunning_ExceptionTable group = WalkingStateExceptions }
        obj_spawnscriptlater \{ BoardSmack_spawn }
    endif
    if GotParam \{ synctopreviousanim }
        from = current
    endif
    Skater_Playanim anim = THPS7_RunBoardSmack from = <from> backwards = <backwards> Speed = <Speed> BlendPeriod = <BlendPeriod>
    Skater_WaitAnimFinished
    SetWalkingGroundTricks
    WhackingOff
    Walk_EndGroundTrick
    MakeSkaterGoto \{ RunState }
endscript

script BoardSmackGroundGone 
    WhackingOff
    Walk_EndGroundTrick
    AirState
endscript
BoardSmackStanding_ExceptionTable = [
    {
        exception
        Ex = run
        scr = BoardSmackRunning
        params = { synctopreviousanim }
    }
    { exception Ex = WalkOffEdge scr = AirState }
    { exception Ex = BoardSmack_exit scr = BoardSmack_exit }
]
BoardSmackBackwardsStanding_ExceptionTable = [
    {
        exception
        Ex = run
        scr = BoardSmackRunning
        params = { synctopreviousanim backwards = backwards }
    }
    { exception Ex = WalkOffEdge scr = AirState }
]

script BoardSmackStanding 
    OnExitRun \{ BoardSmack_cleanup }
    Walk_StartGroundTrick
    if GotParam \{ backwards }
        ResetEventHandlersFromTable \{ BoardSmackBackwardsStanding_ExceptionTable group = WalkingStateExceptions }
    else
        ResetEventHandlersFromTable \{ BoardSmackStanding_ExceptionTable group = WalkingStateExceptions }
        obj_spawnscriptlater \{ BoardSmack_spawn }
    endif
    if GotParam \{ synctopreviousanim }
        from = current
    endif
    Skater_Playanim anim = THPS7_StandBoardSmack from = <from> backwards = <backwards> Speed = <Speed> BlendPeriod = <BlendPeriod>
    Skater_WaitAnimFinished
    SetWalkingGroundTricks
    WhackingOff
    Walk_EndGroundTrick
    MakeSkaterGoto \{ StandState }
endscript

script BoardSmack_spawn 
    wait \{ 5 gameframes }
    WhackingOn
endscript

script BoardSmack_exit 
    KillSpawnedScript \{ name = BoardSmack_spawn }
    WhackingOff
    SpawnSound \{ Hit_Wall_With_Board_SFX }
    if currentscorepotgreaterthan \{ 0 }
        SetTrickScore \{ 900 }
        SetTrickName \{ 'Whack!' }
        display
    endif
    MakeSkaterGoto \{BoardSmackStanding params = { backwards = backwards synctopreviousanim Speed = 0.5000 BlendPeriod = 0 }}
endscript

script BoardSmack_cleanup 
    Walk_EndGroundTrick
    WhackingOff
    KillSpawnedScript \{ name = BoardSmack_spawn }
endscript

script walking_wallplant_switch 
    MakeSkaterGoto \{ walking_wallplant_switch2 }
endscript

script walking_wallplant_switch2 
    Walk_ScaleAnimSpeed \{ Off }
    Skater_Playanim \{ anim = JumpAirToAirIdle Speed = 3.0 }
    CleanUp_WalkingtoSkating
    WaitAnimWhilstChecking
    rotate \{ y Angle = 180 }
    WalkingWallplant
    goto \{Airborne params = { NoSkateToWalkTricks }}
endscript
WallRunState_ExceptionTable = [
    { exception Ex = land scr = LandState }
    { exception Ex = hang scr = AirToHangState }
    { exception Ex = Ladder scr = LadderMoveUpState }
    { exception Ex = jump scr = WallRunJumpState }
]

script WallRunLeftState 
    WallRunRightState \{ left }
endscript

script WallRunRightState 
    ResetEventHandlersFromTable WallRunState_ExceptionTable group = WalkingStateExceptions
    seteventhandler Ex = JumpRequested scr = JumpRequestedEvent group = WalkingEvents
    SetWalkingTrickState NewWalkingTrickState = Off
    LaunchStateChangeEvent state = Skater_OnWall
    Walk_ScaleAnimSpeed Off
    armanim = WallRun_Partial
    if GotParam left
        printf 'wallrun left'
        if NOT Flipped
            flip
            unflip = 1
            armanim = WallRun_Partial_Flipped
        endif
    else
        printf 'wallrun right'
        if Flipped
            flip
            unflip = 1
            armanim = WallRun_Partial_Flipped
        endif
    endif
    if GotParam left
        if NOT Flipped
            inanim = WallRunLeft_In
            loopanim = WallRunLeftLoop
        else
            inanim = WallRunRight_In
            loopanim = WallRunRightLoop
        endif
    else
        if Flipped
            inanim = WallRunLeft_In
            loopanim = WallRunLeftLoop
        else
            inanim = WallRunRight_In
            loopanim = WallRunRightLoop
        endif
    endif
    PlayWalkAnim anim = <loopanim> Cycle BlendPeriod = 0
    Skater_PlayThrowAnim anim = <armanim>
    if GotParam unflip
        OnExitRun WallRun_exit_unflip
    else
        OnExitRun WallRun_exit
    endif
    if currentscorepotgreaterthan 0
        SetTrickName 'Wall Run'
        SetTrickScore 100
        display
    endif
    WaitAnimWalking
endscript

script WallRun_exit 
    Skater_ThrowAnimOff
endscript

script WallRun_exit_unflip 
    flip
    Skater_ThrowAnimOff
endscript

script WallRunJumpState 
    ResetEventHandlersFromTable \{ RunJumpState_ExceptionTable group = WalkingStateExceptions }
    SetWalkingTrickState \{ NewWalkingTrickState = Air }
    Walk_ScaleAnimSpeed \{ Off }
    PlayWalkAnim \{ anim = WallRunJump BlendPeriod = 0.1000 }
    WaitAnimWalking
    goto \{ AirState }
endscript
WalkIndoorState_ExceptionTable = [
    {
        exception
        Ex = run
        scr = RunState
        params = { indoor }
    }
    {
        exception
        Ex = stand
        scr = StandState
        params = { indoor }
    }
]

script WalkIndoorState 
    ClearTrickQueues
    SetQueueTricks \{ NoTricks }
    ClearAllWalkingExceptions
    Walk_EnterIndoors
    ResetEventHandlersFromTable \{ WalkIndoorState_ExceptionTable group = WalkingStateExceptions }
endscript

script show_wallrun_prompt 
    if NOT InSplitScreenGame
        create_panel_message \{text = str_w_c_0 id = skater_hint style = skater_hint_style Pos = (320.0, 200.0) rgba = [ 32 75 102 100 ]}
    endif
endscript
