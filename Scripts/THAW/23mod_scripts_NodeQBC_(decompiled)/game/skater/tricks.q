excludefromscriptdebug = [
    WaitOneGameFrame
    Obj_WaitAnimFinished
    WaitAnimWhilstChecking
    WaitWhilstChecking
    just_coasting
    DoCrouch_slope
    PlayBrakeAnim
    CessBrake
    CheckforSwitchVehicles
    cheese_jump
    PlayTurnAnimOrTurnIdle
    SetException
    seteventhandler
    ClearException
    ClearExceptionGroup
    WaitWalking
    WaitAnimWalking
    WaitWalkingFrame
    WaitAnimWalkingFrame
    PlaySpeedChosenAnim
    RunSpeedChosenAnim
    CycleSpeedChosenAnim
    hide_run_timer_piece
    SetExceptionHandler
    PlayWalkAnim
    CheckforNetBrake
    get_projectile_controls
    TantrumOff
    Skater_AnimComplete
    Skater_AnimEquals
    vehicle_check_for_trick_input
    bike_OnGroundAI
    Skater_Playanim
    orient_vehicle
    SkaterParticles_CreateStepGfx
    Skater_NoBoardOverlayAnimOff
    Skater_Anim_Command
    Hero_ContinuousTerrainParticles_On
    Hero_ContinuousTerrainParticles_Off
    GetBikeLoopingPitch
    Skater_PlayBikeAnim
    Skater_SetAnimSpeed
    bike_getpedalanimspeed
    update_balance_meter_colors
]
CrouchIdles = [
    CrouchIdle
    CrouchIdle
    CrouchIdle2
    CrouchIdle2
    CrouchIdle4
    CrouchIdle4
    CrouchLookDown
    CrouchLookLeft
    CrouchLookRight
    CrouchShiftFoot
    CrouchIdleAdjustFeet
]
CrouchIdlesCrappy = [ CrouchIdle_Crappy ]
CrouchIdlesCool = [ CrouchIdle_Cool ]
CrouchTurnLeftAnims = [ CrouchTurnLeft CrouchTurnLeft2 ]
CrouchTurnLeftAnimsCrappy = [ CrouchTurnLeft_Crappy ]
CrouchTurnLeftAnimsCool = [ CrouchTurnLeft_Cool ]
CrouchTurnLeftIdles = [ CrouchTurnLeftIdle CrouchTurnLeftIdle2 ]
CrouchTurnLeftIdlesCrappy = [ CrouchTurnLeftIdle_Crappy ]
CrouchTurnLeftIdlesCool = [ CrouchTurnLeftIdle_Cool ]
CrouchTurnRightAnims = [ CrouchTurnRight CrouchTurnRight2 ]
CrouchTurnRightAnimsCrappy = [ CrouchTurnRight_Crappy ]
CrouchTurnRightAnimsCool = [ CrouchTurnRight_Cool ]
CrouchTurnRightIdles = [ CrouchTurnRightIdle CrouchTurnRightIdle2 ]
CrouchTurnRightIdlesCrappy = [ CrouchTurnRightIdle_Crappy ]
CrouchTurnRightIdlesCool = [ CrouchTurnRightIdle_Cool ]
TurnRightIdles = [ TurnRightIdle ]
TurnRightIdlesCrappy = [ TurnRightIdle_Crappy ]
TurnRightIdlesCool = [ TurnRightIdle_Cool ]
TurnLeftIdles = [ TurnLeftIdle ]
TurnLeftIdlesCrappy = [ TurnLeftIdle_Crappy ]
TurnLeftIdlesCool = [ TurnLeftIdle_Cool ]
TurnRightAnims = [ TurnRight ]
TurnRightAnimsCrappy = [ TurnRight_Crappy ]
TurnRightAnimsCool = [ TurnRight_Cool ]
TurnLeftAnims = [ TurnLeft ]
TurnLeftAnimsCrappy = [ TurnLeft_Crappy ]
TurnLeftAnimsCool = [ TurnLeft_Cool ]
CrouchKicks = [ Crouchkick_In Crouchkick_Idle Crouchkick_Out ]
EXPERT_MODE_NO_REVERTS = 0
EXPERT_MODE_NO_WALKING = 0
EXPERT_MODE_NO_MANUALS = 0
perfect_landing_slop = [ 11 8 5 ]

script DumpSkaterEventHandlerTable 
    PrintEventHandlerTable
endscript

script KillingSkater 
    ClearExceptions
    ClearExceptionGroup \{ group = RunTimerEvents }
    ClearExceptionGroup \{ group = WalkingEndRunEvents }
endscript
bigboard = 0

script SkaterInit 
    ClearAllExceptionGroups
    if NOT GotParam no_board
        SwitchOnBoard
    else
        SwitchOffBoard
    endif
    GetCurrentSkaterHeapId
    FormatText checksumname = heap_name 'SkaterHeap%i' i = <heapID>
    MemPushContext <heap_name>
    if IsLocalSkater
        init_skater_anim_tree
    else
        init_nonlocal_skater_anim_tree
    endif
    MemPopContext
    anim_command command = degenerateblend_setnextblendduration params = { 0.0 }
    obj_stopstream
    unhide
    UnPausePhysics
    notinbail
    bailoff
    BashOff
    ExitTantrum
    TantrumOff
    nollieoff
    pressureoff
    BertSlideOff
    NotifyBailDone
    obj_killspawnedscript name = BailBoardControl
    obj_killspawnedscript name = TantrumCheck
    ClearLipCombos
    allowrailtricks
    obj_killspawnedscript name = SetUpLipCombo
    ClearTrickQueues
    SetCurrentBailEndpose
    obj_killspawnedscript name = GetBonus_exit
    Walk_ResetPeakHeight
    Walk_ExitIndoors
    Walk_EndGroundTrick
    kill_cloth_anims
    BoardSmack_cleanup
    ProjectilesOn
    UnsetThrowingProjectile
    StatsManager_Reset
    resetlandedfromvert
    BlendperiodOut 0
    settags AcidDropCheese = 0 in_manual_land = 0
    pressureoff
    UnsetForceWalk
    ResetIsFlipping
    InitializeStateChangeEvent
    if NOT GotParam NoEndRun
        SetException Ex = RunHasEnded scr = EndOfRun
        SetException Ex = GoalHasEnded scr = Goal_EndOfRun
    endif
    stopbalancetrick
    if skitching
        stopskitch
        setstate Ground
    endif
    seteventhandler Ex = KillingSkater scr = KillingSkater group = KillingSkaterGroup
    seteventhandler Ex = DumpSkaterEventHandlerTable scr = DumpSkaterEventHandlerTable group = DebugSkaterGroup
    VibrateOff
    ClearSkaterFlags
    if NOT GotParam NoAnims
        if NOT (in_cinematic_sequence = 1)
            if NOT IsSkaterOnBike
                if walking
                    <walk> = 1
                    Skater_Playanim anim = WStand BlendPeriod = 0
                else
                    PlayStyleAnim anim = idle BlendPeriod = 0
                endif
            else
                Skater_Playanim anim = BMX_idle BlendPeriod = 0
            endif
        endif
    endif
    obj_killspawnedscript name = BloodSmall
    obj_killspawnedscript name = BloodSplat
    obj_killspawnedscript name = SkaterBloodOn
    RunTimerController_Reset
    ResetSkaterParticleSystems
    lockvelocitydirection Off
    canbrakeon
    restoreautokick
    overridelimits end
    setslomo 1
    kill_blur
    KillExtraTricks
    created_trick_cleanup
    ClearSkaterCamOverride
    LandSkaterTricks
    set_skater_anim_handlers
    set_skater_particle_handlers
    enableinputevents
    if GotParam ReturnControl
        return 
    endif
    anim_command command = degenerateblend_setnextblendduration params = { 0.0 }
    if IsSkaterOnBike
        goto Bike_Start
    endif
    if IsBoardMissing
        <walk> = 1
    endif
    if NOT GotParam walk
        goto Switch_OnGroundAI params = { NewScript = ongroundai restart }
    else
        Walk_SetState Ground
        goto Switch_OnGroundAI params = { NewScript = Walking_onGroundAi restart }
    endif
endscript

script ClientSkaterInit 
    switchoffatomic \{ special_item }
    GetCurrentSkaterHeapId
    FormatText checksumname = heap_name 'SkaterHeap%i' i = <heapID>
    MemPushContext <heap_name>
    init_nonlocal_skater_anim_tree
    MemPopContext
    anim_command \{command = degenerateblend_addbranch params = {tree = NonLocal_Skater_AnimBranch_Standard params = { my_timer_type = play my_anim = BrakeIdle }}}
endscript
OnGroundExceptionTable = [
    { exception Ex = GroundGone scr = GroundGone }
    { exception Ex = Ollied scr = ollie }
    { exception Ex = FlailHitWall scr = FlailHitWall }
    { exception Ex = FlailLeft scr = FlailLeft }
    { exception Ex = FlailRight scr = FlailRight }
    { exception Ex = Carplant scr = Carplant }
    { exception Ex = CarBail scr = CarBail }
    { exception Ex = SkaterCollideBail scr = SkaterCollideBail }
    { exception Ex = Skitched scr = skitch }
    { exception Ex = MadeOtherSkaterBail scr = MadeOtherSkaterBail }
    { exception Ex = WallPush scr = Ground_Wallpush }
]

script OnGroundExceptions 
    OnExceptionRun
    ResetEventHandlersFromTable OnGroundExceptionTable
    enableinputevents
    if NOT GotParam NoEndRun
        SetException Ex = RunHasEnded scr = EndOfRun
        SetException Ex = GoalHasEnded scr = Goal_EndOfRun
        if GoalManager_GoalShouldExpire
            ClearException Ollied
            ClearException GroundGone
            ClearException WallPush
        endif
    endif
    if NOT IsSkaterOnBike
        SwitchOnBoard
        SetSkaterGroundTricks
    endif
    LaunchStateChangeEvent state = Skater_OnGround
    VibrateOff
    enableplayerinput
    bailoff
    BashOff
    setrollingfriction default
    canspin
    allowrailtricks
    obj_clearflag FLAG_SKATER_MANUALCHEESE
    BloodParticlesOff
    if NOT GotParam NoEndRun
        resetlandedfromvert
    endif
endscript

script SetSkaterGroundTricks 
    if IsSkaterOnBike
        ClearTricksFrom Jumptricks Jumptricks0 Jumptricks
        SetQueueTricks NoTricks
    else
        if IsSkaterOnVehicle
            ClearTricksFrom Jumptricks Jumptricks0 Jumptricks
            SetQueueTricks NoTricks
        else
            if GotParam NoSkateToWalkTricks
                SetQueueTricks Jumptricks GroundTricks
            else
                if InNetGame
                    if NOT GetGlobalFlag flag = flag_g_expert_mode_no_walking
                        if NOT GetGlobalFlag flag = FLAG_EXPERT_MODE_NO_WALKING
                            SetQueueTricks Jumptricks SkateToWalkTricks GroundTricks
                        else
                            SetQueueTricks Jumptricks GroundTricks
                        endif
                    else
                        SetQueueTricks Jumptricks GroundTricks
                    endif
                else
                    if NOT GetGlobalFlag flag = FLAG_EXPERT_MODE_NO_WALKING
                        SetQueueTricks Jumptricks SkateToWalkTricks GroundTricks
                    else
                        SetQueueTricks Jumptricks GroundTricks
                    endif
                endif
            endif
        endif
    endif
    SetExtraGrindTricks special = SpecialGrindTricks grindtricks
    if NOT GetGlobalFlag flag = FLAG_EXPERT_MODE_NO_MANUALS
        if NOT ((InNetGame)& (GetGlobalFlag flag = flag_g_expert_mode_no_manuals))
            SetManualTricks special = SpecialManualTricks GroundManualTricks
        endif
    endif
endscript
InAirExceptionTable = [
    { exception Ex = Landed scr = land }
    {
        exception
        Ex = WallRideLeft
        scr = wallride
        params = { left }
    }
    {
        exception
        Ex = WallRideRight
        scr = wallride
        params = { RIGHT }
    }
    { exception Ex = wallplant scr = Air_WallPlant }
    {
        exception
        Ex = StickerSlap
        scr = Air_WallPlant
        params = { StickerSlap }
    }
    { exception Ex = Vert_WallPlant scr = Vert_WallPlant }
    { exception Ex = PointRail scr = PointRail }
    { exception Ex = PointRailSpin scr = PointRailSpin }
    { exception Ex = CarBail scr = CarBail }
    { exception Ex = SkaterCollideBail scr = SkaterCollideBail }
    { event Ex = Carplant scr = Carplant }
    { event Ex = MadeOtherSkaterBail scr = MadeOtherSkaterBailAir }
    { event Ex = AirToTail scr = Air_To_Tail }
]

script InAirExceptions 
    OnExceptionRun
    ResetEventHandlersFromTable \{ InAirExceptionTable }
    SetSkaterAirTricks NoSkateToWalkTricks = <NoSkateToWalkTricks>
    LaunchStateChangeEvent \{ state = Skater_InAir }
    if NOT GotParam \{ AllowVibration }
        VibrateOff
    endif
    enableplayerinput
    bailoff
    BashOff
    setrollingfriction \{ default }
    setstate \{ Air }
    canspin
    overridecancelground \{ Off }
endscript

script SetSkaterAirManualTricks 
    if NOT GetGlobalFlag \{ flag = FLAG_EXPERT_MODE_NO_MANUALS }
        if NOT ((InNetGame)& (GetGlobalFlag flag = flag_g_expert_mode_no_manuals))
            if GotParam \{ NoNose }
                SetManualTricks \{ GroundRevertManualTricks }
            else
                SetManualTricks \{ special = SpecialManualTricks manualtricks }
            endif
        endif
    endif
endscript

script SetSkaterAirTricks 
    if NOT AbilityEnabled caveman
        NoSkateToWalkTricks = 1
    endif
    if IsSkaterOnBike
        SetQueueTricks Bike_AirTricks
    else
        if inpressure
            if NOT GotParam NoSkateToWalkTricks
                if ((GetGlobalFlag flag = FLAG_EXPERT_MODE_NO_WALKING)|| ((InNetGame)& (GetGlobalFlag flag = flag_g_expert_mode_no_walking)))
                    if NOT GotParam AllowWallplantOllie
                        SetQueueTricks special = SpecialTricks PressureTricks2 airtricks
                    else
                        SetQueueTricks special = SpecialTricks PressureTricks2 airtricks WallplantOllie
                    endif
                else
                    if NOT GotParam AllowWallplantOllie
                        SetQueueTricks special = SpecialTricks PressureTricks2 airtricks SkateToWalkTricks
                    else
                        SetQueueTricks special = SpecialTricks PressureTricks2 airtricks SkateToWalkTricks WallplantOllie
                    endif
                endif
            else
                if NOT GotParam AllowWallplantOllie
                    SetQueueTricks special = SpecialTricks PressureTricks2 airtricks
                else
                    SetQueueTricks special = SpecialTricks PressureTricks2 airtricks WallplantOllie
                endif
            endif
        else
            if NOT GotParam NoSkateToWalkTricks
                if ((GetGlobalFlag flag = FLAG_EXPERT_MODE_NO_WALKING)|| ((InNetGame)& (GetGlobalFlag flag = flag_g_expert_mode_no_walking)))
                    if NOT GotParam AllowWallplantOllie
                        SetQueueTricks special = SpecialTricks airtricks
                    else
                        SetQueueTricks special = SpecialTricks airtricks WallplantOllie
                    endif
                else
                    if NOT GotParam AllowWallplantOllie
                        SetQueueTricks special = SpecialTricks airtricks SkateToWalkTricks
                    else
                        SetQueueTricks special = SpecialTricks airtricks SkateToWalkTricks WallplantOllie
                    endif
                endif
            else
                if NOT GotParam AllowWallplantOllie
                    SetQueueTricks special = SpecialTricks airtricks
                else
                    SetQueueTricks special = SpecialTricks airtricks WallplantOllie
                endif
            endif
        endif
        SetExtraGrindTricks special = SpecialGrindTricks grindtricks
        SetSkaterAirManualTricks
    endif
endscript

script ClearTrickQueues 
    ClearTrickQueue
    ClearManualTrick
    ClearExtraGrindTrick
endscript

script ongroundai Coasting = 0 Pushes = 0 PressureTimer = 0
    if NOT OnGround
        setstate Ground
    endif
    OnGroundExceptions
    OnExitRun kill_cloth_anims
    obj_killspawnedscript name = on_ground_cloth_anims
    nollieoff
    begin 
    if GotParam #"0xcce74cca"
        skater ::getspeed
        if (<Speed> > <#"0xc80fa78b">)
            #"0x09150a30" = (<#"0x09150a30"> - 5)
            skater ::setspeed <#"0x09150a30">
        endif
    endif
    if leftpressed
        if crouched
            if Flipped
                PlayTurnAnimOrTurnIdle TurnAnims = CrouchTurnRight
            else
                PlayTurnAnimOrTurnIdle TurnAnims = CrouchTurnLeft
            endif
        else
            if Flipped
                PlayTurnAnimOrTurnIdle TurnAnims = TurnRight
            else
                PlayTurnAnimOrTurnIdle TurnAnims = TurnLeft
            endif
        endif
    else
        if rightpressed
            if crouched
                if Flipped
                    PlayTurnAnimOrTurnIdle TurnAnims = CrouchTurnLeft
                else
                    PlayTurnAnimOrTurnIdle TurnAnims = CrouchTurnRight
                endif
            else
                if Flipped
                    PlayTurnAnimOrTurnIdle TurnAnims = TurnLeft
                else
                    PlayTurnAnimOrTurnIdle TurnAnims = TurnRight
                endif
            endif
        else
            GetSlope
            if crouched
                DoCrouch_slope slope = <slope> ChangeInSlope = <ChangeInSlope>
            else
                if braking
                    if speedlessthan 1
                        PlayBrakeAnim
                        if heldlongerthan button = down 2 second
                            if NOT IsInBail
                                goto HandBrake
                            endif
                        endif
                    else
                        if heldlongerthan button = down 0.2000 second
                            CessBrake
                        else
                            PlayBrakeAnim
                        endif
                    endif
                else
                    if (<slope> > PUSH_IF_SLOPE)
                        if autokickisoff
                            OnGround_AutoKickOff_UpHill
                        else
                            DoAPush
                        endif
                    else
                        if autokickisoff
                            OnGround_AutoKickOff_Flat
                        else
                            just_coasting
                        endif
                    endif
                endif
            endif
        endif
    endif
    DoNextTrick
    DoNextManualTrick
    WaitOneGameFrame
    if InNetGame
        CheckforNetBrake
    endif
    repeat 
endscript

script on_ground_cloth_anims 
    OnExitRun \{ on_ground_cloth_anims_exit }
    begin 
    if speedgreaterthan \{ 100 }
        Skater_PlayClothAnim \{ anim = Cloth_AIrFlow_Partial norestart BlendPeriod = 0 }
        Skater_WaitClothAnimFinished
    endif
    wait \{ 1 gameframe }
    repeat 
endscript

script on_ground_cloth_anims_exit 
    Skater_ClothAnimOff
endscript

script kill_cloth_anims 
    obj_killspawnedscript \{ name = on_ground_cloth_anims }
endscript
crouch_wobble_params = {
    wobbleampa = { (10.100000381469727, 10.100000381469727) STATS_RAILBALANCE }
    wobbleampb = { (10.100000381469727, 10.100000381469727) STATS_RAILBALANCE }
    wobblek1 = { (20.0, 20.0) STATS_RAILBALANCE }
    wobblek2 = { (10.0, 10.0) STATS_RAILBALANCE }
    spazfactor = { (1.0, 1.0) STATS_RAILBALANCE }
}

script PlayTurnAnimOrTurnIdle 
    GetTurnAnimArrays TurnAnims = <TurnAnims>
    if NOT Skater_AnimEquals <TurnIdles>
        if NOT Skater_AnimEquals <TurnAnims>
            GetRandomArrayElement <TurnAnims>
            printf 'I have chosen the anim %a' a = <element>
            Skater_Playanim anim = <element> norestart
            settags TurnAnimIndex = <index>
            obj_spawnscriptlater handle_turning_cloth_anim params = {anim = (<TurnAnims> [ <index> ])idle = (<TurnIdles> [ <index> ])}
            Skater_PlayClothAnim anim = Cloth_AIrFlow_Partial Cycle BlendPeriod = 0
        endif
        if Skater_AnimComplete
            getsingletag TurnAnimIndex
            index = <TurnAnimIndex>
            PlayStyleAnim anim = (<TurnIdles> [ <index> ])Cycle norestart
        endif
    endif
endscript

script handle_turning_cloth_anim 
    begin 
    if NOT Skater_AnimEquals <anim>
        if NOT Skater_AnimEquals <idle>
            Skater_ClothAnimOff
            break 
        endif
    endif
    wait \{ 1 gameframe }
    repeat 
endscript

script DoCrouch_slope 
    if ((<ChangeInSlope> > 5)|| (<ChangeInSlope> < -5))
        if Skater_AnimEquals [CrouchBumpUp CrouchBumpDown CrouchBumpUp_Crappy CrouchBumpDown_Crappy CrouchBumpUp_Cool CrouchBumpDown_Cool]
            if Skater_AnimComplete
                if (<ChangeInSlope> > 5)
                    PlayStyleAnim anim = CrouchBumpUp BlendPeriod = 0.3000
                else
                    PlayStyleAnim anim = CrouchBumpDown BlendPeriod = 0.3000
                endif
            endif
        else
            if (<ChangeInSlope> > 5)
                PlayStyleAnim anim = CrouchBumpUp BlendPeriod = 0.3000
            else
                PlayStyleAnim anim = CrouchBumpDown BlendPeriod = 0.3000
            endif
        endif
    else
        if speedlessthan 100
            if Released down
                if NOT autokickisoff
                    Skater_Playanim anim = CrouchPush1 norestart
                endif
            endif
        endif
        if autokickisoff
            if speedlessthan 600
                if Held square
                    Skater_Playanim anim = CrouchPush1 norestart
                endif
            endif
        endif
        if NOT Skater_AnimEquals CrouchIdles CrouchPush1 CrouchBumpUp CrouchBumpDown CrouchBumpUp_Crappy CrouchBumpDown_Crappy CrouchBumpUp_Cool CrouchBumpDown_Cool
            GetCrouchIdle
            if Skater_AnimEquals idle
                Skater_Playanim anim = CrouchIdleFromIdle norestart BlendPeriod = 0
            endif
            Skater_Playanim anim = <element> norestart Cycle
        else
            if Skater_AnimComplete
                RandomNoRepeat (@ PlayCrouchIdle @ DoCrouchKick)
            endif
        endif
    endif
endscript

script PlayCrouchIdle 
    GetCrouchIdle
    Skater_Playanim anim = <element> norestart Cycle
endscript

script DoCrouchKick 
    num_kicks = RandomNoRepeat (@ 0 @ 1 @ 2)
    Skater_Playanim \{ anim = Crouchkick_In }
    WaitAnimWhilstChecking \{ AndManuals }
    if NOT (<num_kicks> = 0)
        begin 
        Skater_Playanim \{ anim = Crouchkick_Idle }
        WaitAnimWhilstChecking \{ AndManuals }
        repeat <num_kicks>
    endif
    Skater_Playanim \{ anim = Crouchkick_Out }
    WaitAnimWhilstChecking \{ AndManuals }
endscript
SLOPE_CUTOFF = 40
PUSH_IF_SLOPE = 2

script just_coasting 
    if speedlessthan 100
        DoApushFromBrake
    endif
    if Skater_AnimEquals [NolliePushCycle MongoPushCycle PushCycle PushCycleArms1 PushCycleArms2 PushCycleArms3 PushCycleArms4 PushCycleArms5]
        if innollie
            Skater_Playanim anim = NolliePushOut
        else
            if ShouldMongo
                Skater_Playanim anim = MongoPush backwards
            else
                Skater_Playanim anim = push backwards
            endif
        endif
        Skater_WaitAnimFinished
        PlayStyleAnim anim = idle norestart Cycle
    else
        if Skater_AnimEquals idle
            if Skater_AnimComplete
                RandomPush = randomrange (1.0, 3.0)
                if (<RandomPush> < 2)
                    DoAPush
                else
                    PlayStyleAnim anim = idle
                endif
            endif
        else
            PlayStyleAnim anim = idle norestart Cycle
        endif
    endif
endscript

script DoAPush 
    <scriptresult> = 0
    if NOT Skater_AnimEquals [ TurnRight TurnLeft ]
        if Skater_AnimComplete
            <scriptresult> = 1
        endif
    endif
    if NOT (<scriptresult> = 1)
        if NOT Skater_AnimEquals [ SlowDownBrake SlowDownBrake_Mongo ]
            return 
        endif
    endif
    if innollie
        if Skater_AnimEquals NolliePushCycle
            printf 'additonal Nollie push'
            Skater_Playanim anim = NolliePushCycle norestart
            WaitAnimWhilstChecking AndManuals
        else
            printf 'Start Nollie push'
            Skater_Playanim anim = NolliePush norestart
            WaitAnimWhilstChecking AndManuals
            begin 
            Skater_Playanim anim = NolliePushCycle
            WaitAnimWhilstChecking AndManuals
            repeat 2
        endif
    else
        if ShouldMongo
            if Skater_AnimEquals MongoPushCycle
                printf 'additonal Mongo push'
                Skater_Playanim anim = MongoPushCycle norestart
                WaitAnimWhilstChecking AndManuals
            else
                printf 'Start Mongo push'
                Skater_Playanim anim = MongoPush norestart
                WaitAnimWhilstChecking AndManuals
                begin 
                Skater_Playanim anim = MongoPushCycle
                WaitAnimWhilstChecking AndManuals
                repeat 2
            endif
        else
            if Skater_AnimEquals [PushCycle PushCycleArms1 PushCycleArms2 PushCycleArms3 PushCycleArms4 PushCycleArms5]
                printf 'additonal Push'
                Skater_Playanim Random (@ anim = PushCycle @ anim = PushCycleArms1 @ anim = PushCycleArms2 @ anim = PushCycleArms3 @ anim = PushCycleArms4 @ anim = PushCycleArms5) norestart
                WaitAnimWhilstChecking AndManuals
            else
                printf 'Start Push'
                Skater_Playanim anim = push norestart
                WaitAnimWhilstChecking AndManuals
                begin 
                Skater_Playanim Random (@ anim = PushCycle @ anim = PushCycleArms1 @ anim = PushCycleArms2 @ anim = PushCycleArms3 @ anim = PushCycleArms4 @ anim = PushCycleArms5) norestart
                WaitAnimWhilstChecking AndManuals
                repeat 2
            endif
        endif
    endif
endscript

script DoApushFromBrake 
    setrollingfriction \{ 10 }
    if ShouldMongo
        Skater_Playanim \{ anim = BrakeIdle_Start_Mongo norestart }
        wait \{ 18 frames }
    else
        Skater_Playanim \{ anim = BrakeIdle_Start norestart }
        wait \{ 18 frames }
    endif
    setrollingfriction \{ default }
    WaitAnimWhilstChecking
endscript

script CheckforNetBrake 
    if InNetGame
        GetPreferenceChecksum pref_type = network auto_brake
        if (<checksum> = boolean_true)
            if ScreenElementExists id = current_menu_anchor
                goto NetBrake
            endif
            if ScreenElementExists id = dialog_box_anchor
                goto NetBrake
            endif
            if ScreenElementExists id = quit_dialog_anchor
                goto NetBrake
            endif
            if ScreenElementExists id = controller_unplugged_dialog_anchor
                goto NetBrake
            endif
            if IsTrue paused_for_hardware
                goto NetBrake
            endif
        endif
    endif
endscript

script PlayBrakeAnim 
    if ShouldMongo
        Skater_Playanim \{ anim = SlowDownBrake_Mongo norestart }
    else
        Skater_Playanim \{ anim = SlowDownBrake norestart }
    endif
endscript

script CessBrake 
    ClearEventBuffer
    if speedgreaterthan \{ 300 }
        Skater_Playanim \{ anim = CessSlide180_FS from = start Speed = 1.200 }
        wait \{ 5 gameframes }
        playcesssound
        Skater_WaitAnim \{ percent = 40 }
        Skater_SetAnimSpeed \{ Speed = 0 }
        wait \{ 20 gameframes }
        Skater_SetAnimSpeed \{ Speed = -1.200 }
        Skater_WaitAnimFinished
    endif
    PlayBrakeAnim
endscript

script OnGround_AutoKickOff_UpHill 
    if innollie
        if Held square
            Skater_Playanim anim = NolliePush norestart
            Skater_WaitAnimFinished
            Skater_Playanim anim = NolliePushCycle norestart
            Skater_WaitAnimFinished
        endif
        PlayStyleAnim anim = idle Cycle norestart
    else
        if ShouldMongo
            if Held square
                Skater_Playanim anim = MongoPush norestart
                Skater_WaitAnimFinished
                Skater_Playanim anim = MongoPushCycle norestart
                Skater_WaitAnimFinished
            endif
            PlayStyleAnim anim = idle Cycle norestart
        else
            if Held square
                Skater_Playanim Random (@ anim = PushCycle @ anim = PushCycleArms1 @ anim = PushCycleArms2 @ anim = PushCycleArms3 @ anim = PushCycleArms4 @ anim = PushCycleArms5) norestart
                Skater_WaitAnimFinished
            endif
            PlayStyleAnim anim = idle Cycle norestart
        endif
    endif
endscript

script OnGround_AutoKickOff_Flat 
    if Held square
        if innollie
            Skater_Playanim anim = NolliePushCycle Cycle norestart
        else
            if ShouldMongo
                Skater_Playanim anim = MongoPushCycle Cycle norestart
            else
                Skater_Playanim Random (@ anim = PushCycle @ anim = PushCycleArms1 @ anim = PushCycleArms2 @ anim = PushCycleArms3 @ anim = PushCycleArms4 @ anim = PushCycleArms5) norestart
                Skater_WaitAnimFinished
                PlayStyleAnim anim = idle Cycle norestart
            endif
        endif
    else
        if NOT Skater_AnimEquals [PushCycle MongoPushCycle MongoPush NolliePush NolliePushCycle]
            PlayStyleAnim anim = idle Cycle norestart
        endif
    endif
endscript

script NetBrake 
    setrollingfriction 20
    OnExceptionRun NetBrake_out
    CessBrake
    begin 
    if speedlessthan 5
        HandBrake
        if ShouldMongo
            Skater_Playanim anim = MongoBrakeIdle Cycle norestart
        else
            Skater_Playanim anim = BrakeIdle Cycle norestart
        endif
    endif
    if ObjectExists id = current_menu_anchor
        WaitOneGameFrame
    else
        if ObjectExists id = dialog_box_anchor
            WaitOneGameFrame
        else
            if ObjectExists id = controller_unplugged_dialog_anchor
                WaitOneGameFrame
            else
                if IsTrue paused_for_hardware
                    WaitOneGameFrame
                else
                    break 
                endif
            endif
        endif
    endif
    repeat 
    setrollingfriction default
    if speedlessthan 5
        goto HandBrake
    else
        if innollie
            goto OnGroundNollieAI
        else
            goto ongroundai
        endif
    endif
endscript

script NetBrake_out 
    setrollingfriction \{ default }
endscript

script HandBrake 
    if IsSkaterOnBike
        goto Bike_Start
    endif
    ClearEventBuffer
    OnExceptionRun BrakeDone
    setrollingfriction 100
    ClearTricksFrom GroundTricks
    if NOT GotParam gotoBrake
        if ShouldMongo
            Skater_Playanim anim = NewBrake_Mongo
        else
            PlayStyleBrakeAnim anim = NewBrake
        endif
    endif
    begin 
    DoNextTrick
    if Skater_AnimComplete
        break 
    endif
    if crouched
        break 
    endif
    wait 1 Game frame
    repeat 
    if ShouldMongo
        flip
        BlendperiodOut 0.2000
    endif
    begin 
    if autokickisoff
        if Held square
            WaitOneGameFrame
            break 
        endif
    else
        if Held up
            break 
        endif
        if crouched
            break 
        endif
    endif
    if rightpressed
        if Flipped
            Skater_Playanim anim = NewBrakeTurnLeft Cycle norestart
        else
            Skater_Playanim anim = NewBrakeTurnRight Cycle norestart
        endif
    else
        if leftpressed
            if Flipped
                Skater_Playanim anim = NewBrakeTurnRight Cycle norestart
            else
                Skater_Playanim anim = NewBrakeTurnLeft Cycle norestart
            endif
        else
            <inbrakeidle> = 0
            if Skater_AnimEquals [
                    NewBrakeIdle NewBrakeIdle3 NewBrakeIdle6 NewBrakeIdle7 NewBrakeIdle8
                    NewBrakeIdle_Female NewBrakeIdle2_Female NewBrakeIdle3_Female NewBrakeIdle4_Female NewBrakeIdle5_Female NewBrakeIdle6_Female NewBrakeIdle7_Female NewBrakeIdle8_Female
                    NewBrakeIdle_Fat NewBrakeIdle2_Fat NewBrakeIdle3_Fat NewBrakeIdle4_Fat NewBrakeIdle5_Fat NewBrakeIdle6_Fat NewBrakeIdle7_Fat NewBrakeIdle8_Fat
                ]
                if Skater_AnimComplete
                    PlayBrakeIdle
                endif
            else
                PlayBrakeIdle
            endif
        endif
    endif
    WaitOneGameFrame
    DoNextTrick
    DoNextManualTrick
    repeat 
    Skater_Playanim anim = NewBrakeIdleToIdle
    wait 0.2500 seconds
    setrollingfriction default
    WaitAnimWhilstChecking
    if innollie
        goto OnGroundNollieAI
    else
        goto ongroundai
    endif
endscript

script PlayBrakeIdle 
    if ProfileEquals style = Fat
        anim = RandomNoRepeat (@ NewBrakeIdle_Fat
            @ NewBrakeIdle2_Fat
            @ NewBrakeIdle3_Fat
            @ NewBrakeIdle4_Fat
            @ NewBrakeIdle5_Fat
            @ NewBrakeIdle6_Fat
            @ NewBrakeIdle7_Fat
            @ NewBrakeIdle8_Fat
        )
    endif
    if NOT GotParam anim
        if ProfileEquals is_female
            anim = RandomNoRepeat (@ NewBrakeIdle_Female
                @ NewBrakeIdle2_Female
                @ NewBrakeIdle3_Female
                @ NewBrakeIdle4_Female
                @ NewBrakeIdle6_Female
                @ NewBrakeIdle7_Female
                @ NewBrakeIdle8_Female
            )
        endif
    endif
    if NOT GotParam anim
        anim = RandomNoRepeat (@ NewBrakeIdle
            @ NewBrakeIdle
            @ NewBrakeIdle
            @ NewBrakeIdle
            @ NewBrakeIdle2
            @ NewBrakeIdle
            @ NewBrakeIdle3
            @ NewBrakeIdle
            @ NewBrakeIdle4
            @ NewBrakeIdle
            @ NewBrakeIdle
            @ NewBrakeIdle
            @ NewBrakeIdle
            @ NewBrakeIdle
            @ NewBrakeIdle6
            @ NewBrakeIdle7
            @ NewBrakeIdle8
            @ NewBrakeIdle
            @ NewBrakeIdle
        )
    endif
    Skater_Playanim anim = <anim>
endscript

script BrakeDone 
    setrollingfriction \{ default }
endscript

script OnGroundNollieAI 
    setstate Ground
    OnGroundExceptions
    if NOT GoalManager_GoalShouldExpire
        SetException Ex = Ollied scr = Nollie
    endif
    nollieon
    begin 
    if leftpressed
        if crouched
            if Flipped
                Skater_Playanim anim = NollieCrouchTurnRight norestart
            else
                Skater_Playanim anim = NollieCrouchTurnLeft norestart
            endif
        else
            if Flipped
                Skater_Playanim anim = NollieSkatingTurnRight norestart
            else
                Skater_Playanim anim = NollieSkatingTurnLeft norestart
            endif
        endif
    else
        if rightpressed
            if crouched
                if Flipped
                    Skater_Playanim anim = NollieCrouchTurnLeft norestart
                else
                    Skater_Playanim anim = NollieCrouchTurnRight norestart
                endif
            else
                if Flipped
                    Skater_Playanim anim = NollieSkatingTurnLeft norestart
                else
                    Skater_Playanim anim = NollieSkatingTurnRight norestart
                endif
            endif
        else
            if crouched
                Skater_Playanim anim = NollieCrouchIdle Cycle norestart
            else
                if braking
                    if speedlessthan 1
                        Skater_Playanim anim = NollieSkatingIdle norestart
                        if heldlongerthan button = down 2 second
                            if NOT IsInBail
                                goto HandBrake
                            endif
                        endif
                    else
                        if heldlongerthan button = down 0.2000 second
                            CessBrake
                        else
                            PlayBrakeAnim
                        endif
                    endif
                else
                    if cankick
                        if autokickisoff
                            if ShouldMongo
                                if Skater_AnimEquals MongoPushCycle
                                    Skater_Playanim anim = MongoPushCycle norestart
                                else
                                    Skater_Playanim anim = MongoPush norestart
                                    Skater_WaitAnimFinished
                                    Skater_Playanim anim = MongoPushCycle norestart
                                endif
                            else
                                Skater_Playanim anim = NolliePushCycle norestart
                            endif
                        else
                            if Skater_AnimEquals [ idle NollieSkatingIdle ]
                                if Skater_AnimComplete
                                    RandomPush = randomrange (1.0, 3.0)
                                    if (<RandomPush> < 2)
                                        DoAPush
                                    else
                                        Skater_Playanim anim = NollieSkatingIdle norestart
                                    endif
                                endif
                            else
                                Skater_Playanim anim = NollieSkatingIdle norestart Cycle
                            endif
                        endif
                    else
                        if Skater_AnimComplete
                            Skater_Playanim anim = NollieSkatingIdle Cycle norestart
                        endif
                    endif
                endif
            endif
        endif
    endif
    DoNextTrick
    DoNextManualTrick
    CheckforNetBrake
    WaitOneGameFrame
    repeat 
endscript

script FlailExceptions 
    SetException \{ Ex = CarBail scr = CarBail }
    SetException \{ Ex = SkaterCollideBail scr = SkaterCollideBail }
    SetException \{ Ex = RunHasEnded scr = EndOfRun }
    SetException \{ Ex = GoalHasEnded scr = Goal_EndOfRun }
    if GoalManager_GoalShouldExpire
        ClearException \{ Ollied }
        ClearException \{ GroundGone }
    endif
    ClearException \{ WallPush }
    ClearTrickQueue
    ClearManualTrick
    ClearEventBuffer
    LandSkaterTricks
endscript

script FlailHitWall 
    Baildone
    goto \{ FlailLeft }
endscript

script FlailLeft 
    stopbalancetrick
    FlailExceptions
    FlailVibrate
    BertSlideOff
    if CancelRotateDisplayandUpdateMatrix
        change flip_backwards_dont_blend = 1
    endif
    if IsSkaterOnBike
        goto bike_onground
    endif
    if IsSkaterOnVehicle
        goto vehicle_onground
    endif
    if crouched
        if speedgreaterthan 400
            Skater_Playanim Random (@ anim = FlailLeftCrouched_Small @ anim = FlailLeftCrouched2) BlendPeriod = 0.03000
        else
            Skater_Playanim Random (@ anim = FlailLeftCrouched2 @ anim = FlailLeftCrouched3) BlendPeriod = 0.03000
        endif
    else
        Skater_Playanim Random (@ anim = FlailLeft @ anim = FlailLeft2) BlendPeriod = 0.03000
    endif
    WaitAnimWhilstChecking
    change flip_backwards_dont_blend = 0
    if innollie
        goto OnGroundNollieAI
    else
        if IsPs2
            if Held r1
                goto EnterBertStance
            endif
        else
            if Held l1
                goto EnterBertStance
            endif
        endif
    endif
    goto ongroundai
endscript

script FlailRight 
    stopbalancetrick
    FlailExceptions
    FlailVibrate
    BertSlideOff
    if CancelRotateDisplayandUpdateMatrix
        change flip_backwards_dont_blend = 1
    endif
    if IsSkaterOnBike
        goto bike_onground
    endif
    if IsSkaterOnVehicle
        goto vehicle_onground
    endif
    if crouched
        if speedgreaterthan 400
            Skater_Playanim Random (@ anim = FlailRightCrouched_Small @ anim = FlailRightCrouched2) BlendPeriod = 0.03000
        else
            Skater_Playanim Random (@ anim = FlailRightCrouched2 @ anim = FlailRightCrouched3) BlendPeriod = 0.03000
        endif
    else
        Skater_Playanim Random (@ anim = FlailRight @ anim = FlailRight2) BlendPeriod = 0.03000
    endif
    WaitAnimWhilstChecking
    change flip_backwards_dont_blend = 0
    if innollie
        goto OnGroundNollieAI
    else
        if IsPs2
            if Held r1
                goto EnterBertStance
            endif
        else
            if Held l1
                goto EnterBertStance
            endif
        endif
    endif
    goto ongroundai
endscript

script FlailVibrate 
    if speedgreaterthan \{ 600 }
        vibrate \{ actuator = 1 percent = 80 duration = 0.2500 }
    else
        vibrate \{ actuator = 1 percent = 50 duration = 0.1500 }
    endif
endscript

script BailGroundGone 
    Baildone
    GroundGone
endscript

script GroundGone 
    InAirExceptions
    stopbalancetrick
    SetException Ex = Ollied scr = ollie
    ClearTricksFrom GroundTricks
    if IsSkaterOnBike
        ClearTricksFrom Jumptricks Jumptricks0 Jumptricks
        SetQueueTricks NoTricks
    else
        if IsSkaterOnVehicle
            ClearTricksFrom Jumptricks Jumptricks0 Jumptricks
            SetQueueTricks NoTricks
        else
            if GotParam NoBoneless
                SetSkaterAirTricks
            else
                if ((GetGlobalFlag flag = FLAG_EXPERT_MODE_NO_WALKING)|| ((InNetGame)& (GetGlobalFlag flag = flag_g_expert_mode_no_walking)))
                    SetQueueTricks special = SpecialTricks airtricks Jumptricks Jumptricks0
                else
                    SetQueueTricks special = SpecialTricks airtricks Jumptricks Jumptricks0 SkateToWalkTricks
                endif
            endif
        endif
    endif
    if crouched
        Skater_Playanim anim = Crouch2InAir
    else
        Skater_Playanim anim = Idle2InAir
    endif
    WaitAnimWhilstCheckingLateOllie
    SetSkaterAirTricks
    ClearException Ollied
    SetTrickName ''
    SetTrickScore 0
    display SpinOnly
    goto Airborne
endscript

script WaitAnimWhilstCheckingLateOllie 
    begin 
    if airtimegreaterthan \{ Skater_Late_Jump_Slop }
        return 
    endif
    DoNextTrick \{TrickParams = { FromGroundGone }}
    if Skater_AnimComplete
        return 
    endif
    wait \{ 1 gameframe }
    repeat 
endscript

script WaitFramesLateOllie 
    begin 
    if (<frames> = 0)
        return \{ frames = 0 }
    endif
    if airtimegreaterthan \{ Skater_Late_Jump_Slop }
        return frames = <frames>
    endif
    frames = (<frames> - 1)
    wait \{ 1 gameframe }
    repeat 
endscript

script TrickOllie 
    jump
endscript
AirAnimParams = { hold BlendPeriod = 0.3000 norestart }

script Airborne BlendPeriod = 0.3000
    InAirExceptions <...> 
    begin 
    DoNextTrick
    getairtimeleft
    if (<AirTimeLeft> < 0.4000)
        Skater_Playanim anim = StretchLegsInit BlendPeriod = <BlendPeriod> norestart
        break 
    else
        if leftpressed
            if Flipped
                Skater_Playanim anim = AirTurnRight AirAnimParams
            else
                Skater_Playanim anim = AirTurnLeft AirAnimParams
            endif
        else
            if rightpressed
                if Flipped
                    Skater_Playanim anim = AirTurnLeft AirAnimParams
                else
                    Skater_Playanim anim = AirTurnRight AirAnimParams
                endif
            else
                if Held r2
                    Skater_Playanim anim = SpineTransfer BlendPeriod = 0.3000 norestart
                else
                    if Held l2
                        Skater_Playanim anim = SpineTransfer BlendPeriod = 0.3000 norestart
                    else
                        Skater_Playanim anim = AirIdle Cycle BlendPeriod = <BlendPeriod> norestart
                    endif
                endif
            endif
        endif
    endif
    WaitOneGameFrame
    repeat 
    WaitAnimWhilstChecking
    begin 
    DoNextTrick
    WaitOneGameFrame
    repeat 
endscript

script land 
    easy_no_bail = 0
    SetLandedPerfect false
    TurnOffSpecialItem
    if (<easy_no_bail> = 1)
        ClearTrickQueue
        KillExtraTricks
    else
        GoalManager_GetDifficultyLevel
        if GameModeEquals is_classic
            if (<difficulty_level> = 0)
                <difficulty_level> = (<difficulty_level> + 1)
            endif
        endif
        if (<difficulty_level> = 0)
            if speedgreaterthan 500
                if YawBetween (80.0, 100.0)
                    goto YawBail
                endif
            endif
        else
            if speedgreaterthan 500
                if YawBetween (60.0, 120.0)
                    goto YawBail
                endif
            endif
        endif
        if AbsolutePitchGreaterThan 60
            if PitchGreaterThan 60
                goto PitchBail
            endif
        endif
        if landedfromspine
            getmatrixnormal
            if (<y> > 0.9500)
                printf 'Bailing due to landing from spine onto flat ground'
                goto PitchBail
            endif
        endif
        if RollGreaterThan 50
            goto DoingTrickBail
        endif
        if DoingTrick
            printf 'DOING A TRICK'
            goto DoingTrickBail
        endif
        if DoingFlip
            printf 'DOING A FLIP'
            goto PitchBail
        endif
    endif
    if GotParam NoBlend
        BlendperiodOut 0
    endif
    if GotParam ReturnBacktoLipLand
    else
        if GotParam IgnoreAirTime
            goto Land2 params = { IgnoreAirTime }
        else
            if airtimelessthan 0.2000 seconds
                goto Land2 params = { LittleAir }
            else
                Land2 <...> 
            endif
        endif
    endif
endscript

script Land2 RevertTime = 5
    if NOT SkaterIsFlipping
        DoPerfectCheck
    endif
    allowrailtricks
    nollieoff
    pressureoff
    ClearLipCombos
    DoAirToFakieCheck
    if LandedOnBank
        SetLastLandingGround
        DoNextManualTrick FromAir
    else
        if NOT landedfromvert
            SetLastLandingGround
            DoNextManualTrick FromAir
        else
            SetLastLandingVert
        endif
    endif
    overridecancelground
    obj_clearflag FLAG_SKATER_MANUALCHEESE
    getspeed
    if (<Speed> > 250)
        SetExtraTricks_Reverts duration = <RevertTime>
    endif
    if InAirToTail
        Air_To_Tail_score
    endif
    getairtime
    if crouched
        if GotParam LittleAir
            Skater_Playanim anim = CrouchedLand_Tiny BlendPeriod = 0.1000
        else
            if backwards
                FlipAndRotate
                BoardRotateAfter
                Skater_Playanim RandomNoRepeat (@ anim = CrouchedLandTurn4 @ anim = CrouchedLandTurn5) BlendPeriod = 0.0
            else
                if YawBetween (45.0, 60.0)
                    if airtimegreaterthan 0.7500 second
                        Skater_Playanim Random (@ anim = SketchyCrouchLand @ anim = SketchyLand1) BlendPeriod = 0.1000
                        if InSplitScreenGame
                        else
                            LaunchPanelMessage '&C1Sketchy' properties = panelcombo
                        endif
                    else
                        PlayLandAnim <...> 
                    endif
                else
                    PlayLandAnim <...> 
                endif
            endif
        endif
    else
        if GotParam LittleAir
            Skater_Playanim anim = StandingLand_Tiny BlendPeriod = 0.1000
        else
            if backwards
                FlipAndRotate
                BoardRotateAfter
                Skater_Playanim Random (@ anim = StandingLandTurn @ anim = StandingLandTurn1) BlendPeriod = 0
            else
                if YawBetween (45.0, 60.0)
                    if airtimegreaterthan 0.5000 second
                        printf 'Standing Sketchy Landing 2'
                        Skater_Playanim Random (@ anim = SketchyLand @ anim = SketchyLand1) BlendPeriod = 0.1000
                        if InSplitScreenGame
                        else
                            LaunchPanelMessage '&C1Sketchy' properties = panelcombo
                        endif
                    else
                        PlayLandAnim <...> 
                    endif
                else
                    PlayLandAnim <...> 
                endif
            endif
        endif
    endif
    ClearTrickQueue
    ClearEventBuffer buttons = [ x ]
    SetSkaterAirManualTricks
    OnGroundExceptions NoEndRun
    OnExceptionRun LandSkaterTricks
    if GoalManager_GoalShouldExpire
        no_ollies = 1
    endif
    if GotParam no_ollies
        ClearException Ollied
        ClearException GroundGone
        ClearException WallPush
        SetQueueTricks NoTricks
    endif
    if GotParam NoReverts
    else
        if landedfromvert
            if LandedOnBank
                resetlandedfromvert
                begin 
                DoNextManualTrick FromAir
                wait 1
                repeat 10
            else
                resetlandedfromvert
                begin 
                wait 1
                repeat <RevertTime>
            endif
        else
            begin 
            DoNextManualTrick FromAir
            wait 1
            repeat 10
        endif
    endif
    KillExtraTricks
    LandSkaterTricks
    OnExceptionRun
    OnGroundExceptions
    CheckforNetBrake
    WaitAnimWhilstChecking AndManuals
    if innollie
        goto OnGroundNollieAI
    else
        goto ongroundai
    endif
endscript

script DoAirToFakieCheck 
    if ProfileEquals stance = regular
        if NOT Flipped
            return 
        endif
    else
        if Flipped
            return 
        endif
    endif
    if landedfromvert
        if NOT LandedOnBank
            if NOT landedfromspine
                GetSpin
                if (<spin> = 0)
                    if currentscorepotgreaterthan 0
                        SetTrickName 'to Fakie'
                        SetTrickScore 0
                    else
                        SetTrickName 'Air to Fakie'
                        SetTrickScore 100
                    endif
                    display
                    nollieon
                endif
            endif
        endif
    endif
endscript

script PlayLandAnim 
    if InAirToTail
        Skater_Playanim anim = Tail2Air BlendPeriod = 0.1000
    else
        if GotParam IgnoreAirTime
            Skater_Playanim RandomNoRepeat (@ anim = CrouchedLand4 @ anim = CrouchedLand5 @ anim = CrouchedLand6) BlendPeriod = 0.1000
        else
            if airtimelessthan 0.5000 seconds
                Skater_Playanim anim = CrouchedLand_Tiny BlendPeriod = 0.1000
            else
                if airtimelessthan 0.7500 seconds
                    Skater_Playanim RandomNoRepeat (@ anim = CrouchedLand4_Small @ anim = CrouchedLand5_Small) BlendPeriod = 0.1000
                else
                    Skater_Playanim RandomNoRepeat (@ anim = CrouchedLand4 @ anim = CrouchedLand5 @ anim = CrouchedLand6) BlendPeriod = 0.1000
                endif
            endif
        endif
    endif
    if NOT IsThrowingProjectile
        Skater_PlayClothAnim anim = Cloth_Land_Partial BlendPeriod = 0
    endif
endscript

script LandSkaterTricks 
    GetSkaterNumber
    GetBonusValue skater = <skaternumber>
    if GotParam bonus
        if (<bonus> > 0)
            SetTrickName ''
            SetTrickScore <bonus>
            display Blockspin NoDegrade NoSwitch
        endif
    endif
    if currentscorepotgreaterthan 1500
        SpawnScriptLater LandPointsSound
    endif
    CheckGapTricks
    ClearGapTricks NotInSameFrame
    ClearPanel_Landed
    ClearManualTrick
    overridecancelground Off
    ResetSpin
    obj_clearflag FLAG_SKATER_REVERTCHEESE
    if NOT GotParam DontKillFocus
        KillSpecial
    endif
endscript

script BailSkaterTricks 
    ClearGapTricks
    ClearPanel_Bailed
endscript

script DoPerfectCheck 
    DoPerfectCheck2
    switch <perfect>
        case 1
        SetLandedPerfect \{ true }
        AwardPerfect
        case 2
        AwardSloppy
        default 
    endswitch
endscript

script DoPerfectCheck2 
    perfect = 0
    if currentscorepotgreaterthan 1
        GoalManager_GetDifficultyLevel
        if GameModeEquals is_classic
            if (<difficulty_level> = 0)
                difficulty_level = 1
            endif
        endif
        GetActualSpin
        <achieved_min_spin> = 0
        if landedfromvert
            if (<spin> > (359.0 - (skater_physics.spin_count_slop)))
                <achieved_min_spin> = 1
            endif
        else
            if (<spin> > (179.0 - (skater_physics.spin_count_slop)))
                <achieved_min_spin> = 1
            endif
        endif
        if (<achieved_min_spin> = 1)
            CastToInteger spin
            if ((<spin> < 180)& (<spin> > (179 - ((perfect_landing_slop)[ <difficulty_level> ]))))
                <perfect> = 1
            else
                mod a = <spin> b = 180
                if (<mod> > 90)
                    <mod> = (180 - <mod>)
                endif
                if (<mod> < (((perfect_landing_slop)[ <difficulty_level> ])+ 1))
                    <perfect> = 1
                else
                    if (<mod> > 46)
                        <perfect> = 2
                    endif
                endif
            endif
        endif
    endif
    return perfect = <perfect>
endscript

script AwardPerfect 
    if NOT InSplitScreenGame
        create_panel_message text = 'Czyste!' id = perfect rgba = [ 50 150 50 128 ] Pos = (110.0, 340.0) style = perfect_style
        create_panel_message text = ' +1,000 punktów' id = perfect2 rgba = [ 40 140 40 100 ] Pos = (110.0, 360.0) style = perfect_style
    else
        PerfectSloppy_2p text = 'Czyste!' rgb = [ 50 150 50 128 ]
    endif
    broadcastevent type = SkaterLandedClean
    SetTrickName ''
    SetTrickScore 1000
    display Blockspin NoDegrade
    obj_spawnscriptlater PlayPerfectSound params = {sound = PerfectLanding_11 wait = 0.2000 pitch = 80}
endscript

script AwardSloppy 
    if currentscorepotgreaterthan 750
        GetSpin
        if (<spin> > 359.0)
            if NOT InSplitScreenGame
                create_panel_message text = 'Nieczyste l¹dowanie' id = perfect rgba = [ 200 50 50 128 ] Pos = (110.0, 340.0) style = sloppy_style
                create_panel_message text = ' -500 punktów' id = perfect2 rgba = [ 107 51 27 100 ] Pos = (110.0, 360.0) style = sloppy_style
            else
                PerfectSloppy_2p text = 'Niezgrabnie!' rgb = [ 200 50 50 128 ]
            endif
            SetTrickName ''
            SetTrickScore -500
            display Blockspin NoDegrade
            obj_spawnscriptlater PlayPerfectSound params = {sound = HUDtrickslopC pitch = 150 wait = 0.1200}
        endif
    endif
endscript

script GetBonus Score = 100 text = 'Bonus!' rgba = [ 50 150 50 128 ]
    if NOT InSplitScreenGame
        create_panel_message text = <text> id = perfect rgba = <rgba> Pos = (110.0, 340.0) style = perfect_style
        FormatText textname = text2 '%i punktów' i = <Score>
        create_panel_message text = <text2> id = perfect2 rgba = <rgba> Pos = (110.0, 360.0) style = perfect_style
    else
        PerfectSloppy_2p text = <text> rgba = <rgba>
    endif
    GetSkaterNumber
    AddBonus <Score> skater = <skaternumber>
    obj_spawnscriptlater GetBonus_exit params = { <...>  }
endscript

script GetBonus_exit 
    if OnGround
        if NOT DoingBalanceTrick
            if NOT currentscorepotgreaterthan \{ 0 }
                SetTrickName <text>
                SetTrickScore <Score>
                display \{ Blockspin NoDegrade NoSwitch }
                ClearPanel_Landed
            endif
        endif
    endif
endscript

script PlayPerfectSound 
    wait <wait> seconds
    playsound <sound> pitch = <pitch>
endscript

script PerfectSloppy_2p style = perfect_style
    ScriptGetScreenMode
    GetSkaterNumber
    switch <screen_mode>
        case split_vertical
        switch <skaternumber>
            case 0
            create_panel_message text = <text> id = perfect rgba = <rgb> Pos = (147.0, 340.0) style = <style> parent = player1_panel_container
            case 1
            create_panel_message text = <text> id = perfect_p2 rgba = <rgb> Pos = (147.0, 340.0) style = <style> parent = player2_panel_container
        endswitch
        case split_horizontal
        switch <skaternumber>
            case 0
            create_panel_message text = <text> id = perfect rgba = <rgb> Pos = (307.0, 154.0) style = <style> parent = player1_panel_container
            case 1
            create_panel_message text = <text> id = perfect_p2 rgba = <rgb> Pos = (307.0, 375.0) style = <style> parent = player2_panel_container
        endswitch
    endswitch
endscript

script perfect_style 
    DoMorph time = 0 Scale = (0.0, 0.0)
    DoMorph time = 0.1000 Scale = (0.949999988079071, 0.949999988079071)
    DoMorph time = 0.1000 Scale = (0.75, 0.75)
    DoMorph time = 0.1000 Scale = (0.800000011920929, 0.800000011920929)
    DoMorph time = 0.05000 alpha = 0
    DoMorph time = 0.05000 alpha = 1
    DoMorph time = 0.05000 alpha = 0
    DoMorph time = 0.05000 alpha = 1
    DoMorph time = 0.05000 alpha = 0
    DoMorph time = 0.05000 alpha = 1
    DoMorph time = 1.200 alpha = 0
    Die
endscript

script sloppy_style 
    DoMorph time = 0 Scale = (0.0, 0.0)
    DoMorph time = 0.1000 Scale = (0.800000011920929, 0.800000011920929)
    DoMorph time = 0.02000 alpha = 0
    DoMorph time = 0.05000 alpha = 1
    DoMorph time = 0.05000 alpha = 0
    DoMorph time = 0.03000 alpha = 1
    DoMorph time = 0.05000 alpha = 0
    DoMorph time = 0.05000 alpha = 1
    DoMorph time = 0.04000 alpha = 0
    DoMorph time = 0.05000 alpha = 1
    DoMorph time = 0.05000 alpha = 0
    DoMorph time = 0.02000 alpha = 1
    DoMorph time = 1 alpha = 0
    Die
endscript

script focustimelimit_style 
    setprops rgba = [ 50 128 50 128 ]
    DoMorph time = 0 Pos = (320.0, 150.0) Scale = (0.0, 0.0)
    DoMorph time = 0.1000 Scale = (1.2000000476837158, 1.0)
    DoMorph time = 0.02000 alpha = 0
    DoMorph time = 0.05000 alpha = 1
    DoMorph time = 0.05000 alpha = 0
    DoMorph time = 0.03000 alpha = 1
    DoMorph time = 0.05000 alpha = 0
    DoMorph time = 0.05000 alpha = 1
    DoMorph time = 0.04000 alpha = 0
    DoMorph time = 0.05000 alpha = 1
    DoMorph time = 0.05000 alpha = 0
    DoMorph time = 0.03000 alpha = 1
    DoMorph time = 0.05000 alpha = 0
    DoMorph time = 0.05000 alpha = 1
    DoMorph time = 0.04000 alpha = 0
    DoMorph time = 0.05000 alpha = 1
    DoMorph time = 0.05000 alpha = 0
    DoMorph time = 0.02000 alpha = 1
    DoMorph time = 1 alpha = 0
    Die
endscript

script WaitOnGround 
    begin 
    if OnGround
        break 
    endif
    WaitOneGameFrame
    repeat 
endscript

script VibrateOff 
    vibrate \{ Off }
endscript

script EndOfRun_WalkingEvent 
    if currentscorepotgreaterthan \{ 0 }
        return 
    endif
    MakeSkaterGoto \{ EndOfRun }
endscript

script Goal_EndOfRun_WalkingEvent 
    if currentscorepotgreaterthan \{ 0 }
        return 
    endif
    Goal_EndOfRun
endscript

script SlowSkaterToStop 
    MakeSkaterGoto \{ EndOfRun }
    WaitForEvent \{ type = EndofRunDone }
endscript

script EndOfRun 
    ClearExceptions
    if walking
        ClearAllWalkingExceptions
    endif
    OnExitRun script_ClearEndofRunStarted
    EndOfRunStarted
    CleanUpSpecialItems
    stopbalancetrick
    LandSkaterTricks
    ClearEventBuffer
    LaunchStateChangeEvent state = Skater_EndOfRun
    SetException Ex = lostgame scr = lostgame
    disableplayerinput AllowCameraControl
    ProjectilesOff
    if InNetGame
        SetException Ex = wongame scr = wongame
        SetException Ex = lostgame scr = lostgame
    endif
    if skating
        setstate Ground
        if NOT GotParam NoBrake
            SetException Ex = SkaterCollideBail scr = EndBail
            WaitOnGround
            setrollingfriction 19
            wait 10 frames
            WaitOnGround
            if speedgreaterthan 250
                playcesssound
                Skater_Playanim anim = CessSlide180_FS
                Skater_WaitAnim percent = 40
                Skater_SetAnimSpeed Speed = -1
                Skater_WaitAnimFinished
            else
                Skater_Playanim anim = Brake BlendPeriod = 0.3000
                Skater_WaitAnimFinished
            endif
            Skater_Playanim anim = BrakeIdle BlendPeriod = 0.3000 Cycle
            begin 
            setrollingfriction 19
            if speedlessthan 40
                if OnGround
                    break 
                endif
            endif
            WaitOneGameFrame
            repeat 
        endif
    else
        if walking
            if NOT GotParam NoBrake
                if walk_ground
                    Walk_ScaleAnimSpeed Off
                    if speedgreaterthan (walk_parameters.max_slow_walk_speed)
                        Skater_Playanim anim = _180RunSkid norestart BlendPeriod = 0.0
                        Skater_WaitAnimFinished
                    endif
                    Skater_Playanim anim = WStand norestart Cycle BlendPeriod = 0.3000
                else
                    if Walk_Air
                        Skater_Playanim anim = JumpLandToStand norestart BlendPeriod = 0.3000
                        Skater_WaitAnimFinished
                        Skater_Playanim anim = WStand Cycle BlendPeriod = 0.3000
                    endif
                endif
            endif
        endif
    endif
    wait 1 seconds
    FireEvent type = EndofRunDone
    if NOT GotParam FromTaxiGuy
        OnExitRun
        EndofRunDone
    endif
    if InNetGame
        if NOT GameIsOver
            if NOT GameModeEquals is_king
                if NOT GameModeEquals is_score_challenge
                    if NOT GotParam FromTaxiGuy
                        if NOT GameModeEquals is_goal_attack
                            wait 1 seconds
                            if GameModeEquals is_firefight
                                if NOT IsObserving
                                    skater ::remove_skater_from_world
                                endif
                                EliminatedYou
                            else
                                wait 1 seconds
                                create_panel_message id = goal_message text = 'Oczekiwanie na koniec przejazdów pozosta³ych graczy. Aby obserwowaæ, wcinij \m0' style = panel_message_generic_loss time = 2000
                                if NOT IsObserving
                                    EnterSurveyorMode
                                endif
                            endif
                        endif
                    endif
                endif
            endif
        endif
    endif
endscript

script script_ClearEndofRunStarted 
    ClearEndofRunStarted
endscript

script Goal_EndOfRun 
    ClearExceptions
    ClearExceptionGroup WalkingEndRunEvents
    Goal_EndOfRunStarted
    CleanUpSpecialItems
    stopbalancetrick
    LandSkaterTricks
    ClearEventBuffer
    FireEvent type = EndofRunDone
    if NOT GotParam FromTaxiGuy
        Goal_EndOfRunDone
    endif
    if InNetGame
        if GameIsOver
        else
            if GameModeEquals is_king
            else
                if NOT GotParam FromTaxiGuy
                    if NOT GameModeEquals is_goal_attack
                        create_panel_message id = goal_message text = 'Oczekiwanie na koniec przejazdów pozosta³ych graczy...' style = panel_message_generic_loss
                    endif
                endif
            endif
        endif
    endif
endscript

script ForceEndOfRun 
    VibrateOff
    MakeSkaterGoto \{ EndOfRun }
endscript

script wongame 
    if skating
        Skater_Playanim Random (@ anim = prop @ anim = Cheer1) BlendPeriod = 0.3000
        EndofRunDone
        Skater_WaitAnimFinished
        if ShouldMongo
            Skater_Playanim \{ anim = MongoBrakeIdle Cycle }
        else
            Skater_Playanim \{ anim = BrakeIdle Cycle }
        endif
    else
        EndofRunDone
    endif
endscript

script lostgame 
    if skating
        Skater_Playanim \{ anim = BrakeDefeat }
        Skater_WaitAnimFinished
        EndofRunDone
        if ShouldMongo
            Skater_Playanim \{ anim = MongoBrakeIdle Cycle }
        else
            Skater_Playanim \{ anim = BrakeIdle Cycle }
        endif
        Skater_WaitAnimFinished
    else
        EndofRunDone
    endif
endscript

script EndBail 
    EndofRunDone
    ClearExceptions
    inbail
    turntofacevelocity
    VibrateOff
    Skater_Playanim anim = Bail_Spin_FWD_Regular norestart BlendPeriod = 0.3000
    wait 10 frames
    SwitchOffBoard
    wait 10 frame
    wait 10 frames
    setrollingfriction 18
    vibrate actuator = 1 percent = 100 duration = 0.2000
    if NOT GetGlobalFlag flag = BLOOD_OFF
        obj_spawnscriptlater BloodSmall
    endif
    Skater_WaitAnim percent = 75
    Skater_WaitAnimFinished
    Skater_Playanim anim = GetUp_Sit_Ft BlendPeriod = 0.1000
    setrollingfriction 20
    wait 50 frames
    SwitchOnBoard
    boardrotate normal
    Skater_WaitAnimFinished
    NotifyBailDone
    notinbail
    goto EndOfRun
endscript

script Carplant 
    stopbalancetrick
    ClearExceptions
    InAirExceptions
    ClearException \{ Carplant }
    playsound GrindMetalOn Random (@ pitch = 80 @ pitch = 90 @ pitch = 85)
    obj_spawnscriptlater \{ CarSparks }
    docarplantboost
    SetTrickName \{ 'Car Plant' }
    SetTrickScore \{ 400 }
    display
    if DoingTrick
    else
        Skater_Playanim \{ anim = Beanplant BlendPeriod = 0.3000 }
        WaitAnimWhilstChecking
        goto \{ Airborne }
    endif
endscript

script CarSparks 
    SetSparksTruckFromNollie
    TurnSparksOn
    wait \{ 0.3330 seconds }
    SetException \{ Ex = Carplant scr = Carplant }
    wait \{ 3 seconds }
    TurnSparksOff
endscript

script freezeskater 
    SwitchOnBoard
    ClearExceptions
    SetQueueTricks \{ NoTricks }
    disableplayerinput
    setrollingfriction \{ 10000 }
    Skater_Playanim \{ anim = current from = 0 to = 1 }
endscript

script CarBail 
    stopbalancetrick
    inbail
    obj_spawnscriptlater \{ BloodCar }
    playsound \{ BonkMetal_11 }
    playsound Random (@ hitblood01 @ hitblood02 @ hitblood03)
    goto \{ NoseManualBail }
endscript

script FlailingFall 
    inbail
    ClearExceptions
    SetQueueTricks \{ NoTricks }
    disableplayerinput \{ AllowCameraControl }
    Skater_Playanim \{ anim = StretchtoFlailingFall BlendPeriod = 0.3000 }
    BailSkaterTricks
    Skater_WaitAnim \{ percent = 90 }
    SwitchOffBoard
    Skater_WaitAnimFinished
    Skater_Playanim \{ anim = FlailingFall Cycle }
endscript

script DropIn DropInAnim = DropIn
    printf 'DropIn'
    if GameModeEquals is_horse
        printf '**** IN DROPIN ****'
        GetCurrentSkaterId
        KenTest1
        printstruct <...> 
        if NOT IsCurrentHorseSkater <ObjID>
            printf '**** WASN\'T CURRENT HORSE PLAYER ****'
            return 
        endif
    endif
    ResetSkaterParticleSystems
    PausePhysics
    RestartSkaterExceptions
    SetSkaterCamOverride heading = 0 tilt = -0.7500 time = 0.000001000 Zoom = 5
    OnExitRun DropIn_Cleanup
    setrollingfriction 10000
    disableplayerinput
    Skater_Playanim anim = <DropInAnim> BlendPeriod = 0.0
    Skater_WaitAnim percent = 60
    ClearSkaterCamOverride
    Skater_WaitAnim percent = 85
    UnPausePhysics
    setstate Ground
    setrollingfriction 0
    Skater_WaitAnimFinished
    enableplayerinput
    OnGroundExceptions
    WaitOneGameFrame
    setlandedfromvert
    goto land
endscript

script DropIn_Cleanup 
    ClearSkaterCamOverride
    enableplayerinput
    setrollingfriction \{ default }
endscript

script StartSkating1 
    RestartSkaterExceptions
    setrollingfriction default
    disableplayerinput AllowCameraControl
    if ProfileEquals is_named = Mullen
        setrollingfriction 10000
        Skater_Playanim anim = MullenStart BlendPeriod = 0.0
        Skater_WaitAnim percent = 40
        playsound boneless09 pitch = 110
        playbonksound
        BlendperiodOut 0
        Skater_WaitAnim percent = 60
        setrollingfriction default
    else
        if NOT Flipped
            flip
        endif
        if autokickisoff
            if ShouldMongo
                Skater_Playanim anim = MongoBrakeIdle
            else
                Skater_Playanim anim = BrakeIdle
            endif
        else
            Skater_Playanim anim = StartSkating1 BlendPeriod = 0.0
            Skater_WaitAnim percent = 75
        endif
    endif
    ClearSkaterCamOverride
    enableplayerinput
    OnGroundExceptions
    Skater_WaitAnimFinished
    goto ongroundai
endscript

script RestartSkaterExceptions 
    allowrailtricks
    boardrotate \{ normal }
    ClearExceptions
    ClearTrickQueue
    SetQueueTricks \{ NoTricks }
    ClearManualTrick
    ClearEventBuffer
    SwitchOnBoard
endscript

script LaunchSpecialMessage text = 'Trick Specjalny' vol = 100 pitch = 100
    if InMultiPlayerGame
        if NOT GetGlobalFlag flag = SOUNDS_SPECIALSOUNDS_OFF
            playsound HUD_specialtrickAA vol = <vol> pitch = <pitch>
        endif
    else
        if (GetGlobalFlag flag = CHEAT_COOL_SPECIAL_TRICKS)
            if GotParam Cool
                setslomo 0.6000
                pulse_blur start = 0 end = 150 Speed = 10
                if NOT GetGlobalFlag flag = SOUNDS_SPECIALSOUNDS_OFF
                    playsound HUD_specialtrickAA vol = 200 pitch = 75
                endif
                OnExceptionRun KillSpecial
            else
                if NOT GetGlobalFlag flag = SOUNDS_SPECIALSOUNDS_OFF
                    playsound HUD_specialtrickAA vol = <vol> pitch = <pitch>
                endif
            endif
        else
            if NOT GetGlobalFlag flag = SOUNDS_SPECIALSOUNDS_OFF
                playsound HUD_specialtrickAA vol = <vol> pitch = <pitch>
            endif
        endif
    endif
endscript

script EndSpecial 
    broadcastevent \{ type = SkaterExitSpecialTrick }
    if (GetGlobalFlag flag = CHEAT_COOL_SPECIAL_TRICKS)
        pulse_blur \{ start = 150 end = 0 time = 10 }
        setslomo \{ 1 }
    endif
endscript

script KillSpecial 
    SetGlobalPitchModulation 1.0
    if IsSkaterFocused
        turn_off = 1
    else
        if GotParam force
            turn_off = 1
        endif
    endif
    if GotParam turn_off
        KillSpawnedScript id = SFX_SlowMo
        SpawnScriptLater SK6_SFX_BulletTime_Out id = SFX_SlowMo_Return
        if NOT GotParam keep_decreasespecial
            KillSpawnedScript name = bullettimedecreasespecial
        endif
        broadcastevent type = SkaterExitFocus
        FocusOff
        SpawnScriptLater EndBloom
        if GotParam timelimit
            if NOT GetGlobalFlag flag = NO_DISPLAY_HUD
                create_panel_message text = 'Osi¹gniêto maksymalny czas skupienia!' id = maxfocus style = focustimelimit_style
            endif
            printf 'time limit...........................'
        endif
    endif
    kill_blur
    setslomo 1
    ClearSkaterCamOverride
endscript

script LaunchExtraMessage \{ text = 'Ukryte combo!' }
    if NOT GetGlobalFlag \{ flag = SOUNDS_SPECIALSOUNDS_OFF }
        playsound \{ ExtraTrick vol = 70 }
    endif
endscript

script toggle_focus 
    if NOT InNetGame
        if NOT InMultiPlayerGame
            skater ::toggle_focus2
        endif
    endif
endscript

script toggle_focus2 slomo = 0.5000
    if IsSkaterOnBike
        return 
    endif
    if IsSkaterFocused
        if NOT GotParam leveltrigger
            KillSpecial
            return 
        endif
    endif
    if NOT gotspecial
        return 
    endif
    if NOT AbilityEnabled focus
        return 
    endif
    GetFocusTimeLeft
    if (0 > <focus_time>)
        return 
    endif
    GetFocusTimesAllowed
    if (<focus_allowed> > 0)
        SetFocusTimesAllowed (<focus_allowed> - 1)
    else
        return 
    endif
    FocusOn
    broadcastevent type = SkaterEnterFocus
    PulseBloom
    setslomo <slomo>
    printf '**************GLOBALPITCHMODULATION slomo VALUE = %s' s = <slomo>
    SetGlobalPitchModulation <slomo>
    pulse_blur start = 0 end = 100 Speed = 10
    KillSpawnedScript id = SFX_SlowMo_Return
    SpawnScriptLater SK6_SFX_BulletTime_In id = SFX_SlowMo
    SpawnScriptLater bullettimedecreasespecial
    if GotParam leveltrigger
        return 
    endif
    toggle_focus_exit
endscript

script bullettimedecreasespecial 
    begin 
    skater ::GetSpecialValue
    value = (<value> - 10)
    skater ::SetSpecialValue value = <value>
    if (<value> < 1)
        break 
    endif
    wait \{ 1 gameframe }
    repeat 
    skater ::KillSpecial \{ keep_decreasespecial }
endscript

script toggle_focus_exit 
    if InAir
        SetSkaterCamOverride \{ heading = 0 tilt = 0 time = 0.01000 Zoom = 0.7500 }
    else
        SetSkaterCamOverride \{ heading = 0 tilt = 0 time = 0.01000 Zoom = 0.5000 }
        if OnGround
        endif
    endif
endscript

script PedKnockDown 
    if ObjectExists id = speech_box_anchor
        DestroyScreenElement id = speech_box_anchor
    endif
    if ObjectExists id = goal_start_dialog
        DestroyScreenElement id = goal_start_dialog
    endif
    obj_spawnscriptlater BloodSmall
    if GotParam SetVelDir
        SetSkaterVelocity vel_x = (<SetVelDir>.(1.0, 0.0, 0.0))vel_y = 0 vel_z = (<SetVelDir>.(0.0, 0.0, 1.0))
        turntofacevelocity
    endif
    if GotParam SetVelSpeed
        skater ::setspeed <SetVelSpeed>
    endif
    if skating
        setrollingfriction 0
        stopbalancetrick
        if OnStall
            on_lip_or_stall = 1
        else
            if onlip
                on_lip_or_stall = 1
            endif
        endif
        if GotParam on_lip_or_stall
            stopbalancetrick
            setstate Air
            move z = 1
            move y = 1
        endif
        if GotParam jump
            setspeed -150
            wait 1 Game frame
            jump
            FlipAndRotate
            GotoRandomScript [ YawBail ]
        endif
        if IsSkaterOnBike
            goto bike_bail
        else
            if IsSkaterOnVehicle
                goto vehicle_bail
            else
                if onrail
                    goto FiftyFiftyFall
                else
                    GotoRandomScript [ ManualBailSlow ManualBailFast NoseManualBailSlow NoseManualBailFast ]
                endif
            endif
        endif
    else
        goto WalkBailState
    endif
endscript

script SkaterAvoidGoalPed 
    if GotParam SetVelDir
        SetSkaterVelocity vel_x = (<SetVelDir>.(1.0, 0.0, 0.0))vel_y = 0 vel_z = (<SetVelDir>.(0.0, 0.0, 1.0))
        turntofacevelocity
    endif
    if GotParam SetVelSpeed
        skater ::setspeed <SetVelSpeed>
    endif
    SetException Ex = CarBail scr = CarBail
    SetException Ex = SkaterCollideBail scr = SkaterCollideBail
    FlailVibrate
    nollieoff
    stopbalancetrick
    obj_playsound Random (@ ) BailSlap03
    if NOT walking
        if NOT IsSkaterOnBike
            MakeSkaterGoto FlailHitWall
        endif
    endif
endscript
TRANSFER_POINTS = 250
ACID_DROP_POINTS = 250
ACID_BOMB_POINTS = 350

script SkaterAwardTransfer \{ name = 'Spine Transfer' }
    SetTrickName <name>
    SetTrickScore \{ TRANSFER_POINTS }
    display \{ NoDegrade }
    LaunchSubStateEntryEvent \{ substate = Transfer }
    if NOT DoingTrick
        if NOT IsSkaterOnBike
            setstate \{ Air }
            InAirExceptions
            Skater_Playanim \{ anim = SpineTransfer }
        endif
    endif
endscript

script SkaterAwardHipTransfer 
    SkaterAwardTransfer \{ name = 'Hip Transfer' }
endscript

script SkaterAwardTransferToBank 
    SkaterAwardTransfer \{ name = 'Przenie na brzeg' }
endscript

script bank_pop_script 
    create_panel_message \{text = 'Bank Pop!' rgba = [ 250 0 200 128 ]}
endscript

script SkaterAcidDropTriggered 
    LaunchSubStateEntryEvent \{ substate = AcidDrop }
    if NOT GotParam \{ auto_drop }
        if NOT GotParam \{ bank_drop }
            SetTrickName \{ "Acid Drop" }
        else
            SetTrickName \{ "Bank Drop" }
        endif
        if (<DropHeight> < 350)
            SetTrickScore \{ ACID_DROP_POINTS }
        else
            SetTrickScore \{ ACID_BOMB_POINTS }
        endif
        display \{ NoDegrade }
    else
    endif
    obj_spawnscriptlater \{ AcidParticlesOn }
    obj_killspawnedscript \{ name = HandleAcidDropCheese }
    obj_spawnscriptlater \{ HandleAcidDropCheese }
endscript

script HandleAcidDropCheese 
    settags \{ AcidDropCheese = 1 }
    wait \{ 1 second }
    settags \{ AcidDropCheese = 0 }
endscript

script button_mash_control mash_up = 5 mash_down = 3 max = 200 success_script = button_mash_default_success
    ClearExceptions
    ClearTrickQueues
    setrollingfriction 1000
    Skater_Playanim anim = idle norestart Cycle
    value = 0
    OnExitRun cleanup_mash_meter
    SetScreenElementLock Off id = root_window
    CreateScreenElement {
        type = ContainerElement
        parent = root_window
        id = mash_meter
        texture = white2
        Pos = (0.0, 0.0)
        dims = (640.0, 480.0)
        just = [ left top ]
        internal_just = [ left top ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = mash_meter
        texture = white2
        Scale = (2.0, 1.0)
        Pos = (280.0, 240.0)
        rgba = [ 0 0 100 100 ]
        just = [ center bottom ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = mash_meter
        texture = white2
        Scale = (2.0, 11.0)
        Pos = (280.0, 240.0)
        rgba = [ 0 0 0 50 ]
        just = [ center bottom ]
    }
    begin 
    GetButtonMashFactor
    printf 'mash = %s value = %v' s = <mashfactor> v = <value>
    if (<mashfactor> > <mash_up>)
        value = (<value> + 1)
    else
        if (<mashfactor> < <mash_down>)
            if (<value> > 0)
                value = (<value> - 1)
            endif
        endif
    endif
    if (<mashfactor> = 0)
        Skater_Playanim anim = idle norestart Cycle
    else
        new_anim = 0
        if Skater_AnimComplete
            new_anim = 1
        else
            if Skater_AnimEquals idle
                new_anim = 1
            endif
        endif
        if (<new_anim> = 1)
            Skater_Playanim Random (@ anim = PushCycle @ anim = PushCycleArms1 @ anim = PushCycleArms2 @ anim = PushCycleArms3 @ anim = PushCycleArms4 @ anim = PushCycleArms5) norestart Speed = 0
        endif
        Skater_SetAnimSpeed Speed = (<mashfactor> / 2.500)
    endif
    if ScreenElementExists id = mash_meter
        DoScreenElementMorph id = { mash_meter child = 0 }Scale = ((2.0, 0.0) + ((0.0, 0.05000000074505806) * <value>)+ (0.0, 1.0))
    endif
    if (<value> > <max>)
        break 
    endif
    wait 1 gameframe
    repeat 
    setrollingfriction default
    Skater_Playanim anim = idle norestart Cycle
    SpawnScriptLater <success_script>
    MakeSkaterGoto ongroundai
endscript

script cleanup_mash_meter 
    if ScreenElementExists \{ id = mash_meter }
        DestroyScreenElement \{ id = mash_meter }
    endif
endscript

script button_mash_default_success 
    printf \{ 'button_mash_default_success' }
endscript

script get_style_anim 
    if NOT GotParam anim
        printf 'get_style_anim missing anim param'
    endif
    if NOT GotParam brakeanim
        if ProfileEquals style = crappy
            style_suffix = '_crappy'
        else
            if ProfileEquals style = Cool
                style_suffix = '_cool'
            endif
        endif
    else
        if ProfileEquals style = Fat
            style_suffix = '_fat'
        else
            if ProfileEquals is_female
                style_suffix = '_female'
            endif
        endif
    endif
    if GotParam style_suffix
        AppendSuffixToChecksum base = <anim> suffixstring = <style_suffix>
        if anim_animexists anim = <appended_id> ReferenceChecksum = thps7_human
            return anim = <appended_id>
        endif
    endif
    return anim = <anim>
endscript

script PlayStyleAnim 
    get_style_anim anim = <anim>
    Skater_Playanim <...> 
endscript

script PlayStyleBrakeAnim 
    get_style_anim anim = <anim> brakeanim
    Skater_Playanim <...> 
endscript

script GetCrouchIdle 
    if ProfileEquals \{ style = crappy }
        GetRandomArrayElement \{ CrouchIdlesCrappy }
    else
        if ProfileEquals \{ style = Cool }
            GetRandomArrayElement \{ CrouchIdlesCool }
        else
            GetRandomArrayElement \{ CrouchIdles }
        endif
    endif
    return element = <element>
endscript

script GetTurnAnimArrays 
    if ProfileEquals style = crappy
        switch <TurnAnims>
            case CrouchTurnRight
            new_turnanims = CrouchTurnRightAnimsCrappy
            new_turnidles = CrouchTurnRightIdlesCrappy
            case CrouchTurnLeft
            new_turnanims = CrouchTurnLeftAnimsCrappy
            new_turnidles = CrouchTurnLeftIdlesCrappy
            case TurnLeft
            new_turnanims = TurnLeftAnimsCrappy
            new_turnidles = TurnLeftIdlesCrappy
            case TurnRight
            new_turnanims = TurnRightAnimsCrappy
            new_turnidles = TurnRightIdlesCrappy
        endswitch
    else
        if ProfileEquals style = Cool
            switch <TurnAnims>
                case CrouchTurnRight
                new_turnanims = CrouchTurnRightAnimsCool
                new_turnidles = CrouchTurnRightIdlesCool
                case CrouchTurnLeft
                new_turnanims = CrouchTurnLeftAnimsCool
                new_turnidles = CrouchTurnLeftIdlesCool
                case TurnLeft
                new_turnanims = TurnLeftAnimsCool
                new_turnidles = TurnLeftIdlesCool
                case TurnRight
                new_turnanims = TurnRightAnimsCool
                new_turnidles = TurnRightIdlesCool
            endswitch
        else
            switch <TurnAnims>
                case CrouchTurnRight
                new_turnanims = CrouchTurnRightAnims
                new_turnidles = CrouchTurnRightIdles
                case CrouchTurnLeft
                new_turnanims = CrouchTurnLeftAnims
                new_turnidles = CrouchTurnLeftIdles
                case TurnLeft
                new_turnanims = TurnLeftAnims
                new_turnidles = TurnLeftIdles
                case TurnRight
                new_turnanims = TurnRightAnims
                new_turnidles = TurnRightIdles
            endswitch
        endif
    endif
    return TurnAnims = <new_turnanims> TurnIdles = <new_turnidles>
endscript
