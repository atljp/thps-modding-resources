bike_ped_ids = [
    { level = z_ho id = Z_HO_TRG_Ped_BikeGuy }
    { level = z_dt id = Z_DT_TRG_Ped_BikeGuy }
    { level = z_bh id = Z_BH_TRG_Ped_BikeGuy }
    { level = z_el id = Z_EL_TRG_Ped_BikeGuy }
    { level = z_sm id = Z_SM_TRG_Ped_BikeGuy }
    { level = z_sr id = Z_SR_TRG_Ped_BikeGuy }
    { level = z_lv id = Z_LV_TRG_Ped_BikeGuy }
    { level = z_oi id = Z_OI_TRG_Ped_BikeGuy }
    { level = z_sv id = Z_SV_TRG_Ped_BikeGuy }
]
bike_pedaling = 0

script toggle_bike_on_off 
    if GotParam on
        if skater ::IsSkaterOnBike
            return 
        endif
        if GotParam bike_ped_id
            <bike_ped_id> ::obj_getposition
            if skater ::TriggerBetweenSkaterAndPoint <Pos>
                <bike_ped_id> ::Die
                UnpauseSkaters
                return 
            endif
            if skater ::CollisionBetweenSkaterAndPoint <Pos>
                UnpauseSkaters
                return 
            endif
        endif
        if NOT GotParam allow_while_goal_active
            goal_check_goal_already_active
        endif
    else
        if GotParam Off
            if NOT skater ::IsSkaterOnBike
                return 
            endif
            if skater ::HasMovableContact
                goto bike_onground
            endif
            goal_check_can_skater_exit_bike
            if (<can_exit> = 0)
                goto bike_onground
            endif
        endif
    endif
    if skater ::BikeInManual
        return 
    endif
    change dont_create_speech_boxes = 1
    speech_box_exit
    speech_box_exit anchor_id = ped_speech_dialog
    speech_box_exit anchor_id = goal_start_dialog
    MakeSkaterGoto toggle_bike_on_off2 params = <...> 
endscript

script cleanup_bike_for_change_level 
    TurnOffSpecialItem
    SkaterOffBike
    GetSkaterCam
    <skatercam> ::LookaroundOnDPad_Off
    SetAnalogStickActiveForMenus \{ 1 }
    swap_paks_for_bike \{ heap = unloadableanim a = 'bmx_anims' b = 'unloadable_anims' }
    skatercam0 ::sc_setmode \{ mode = 2 }
endscript

script skater_walk_to_bike 
    <id> ::obj_getposition
    <id> ::obj_getorientation
    <id> ::obj_getdistancetoobject skater
    Orientation = (<x> * (1.0, 0.0, 0.0) + <y> * (0.0, 1.0, 0.0) + <z> * (0.0, 0.0, 1.0))
    if (<objectdistance> > 1.0)
        obj_lookatpos <Pos> Speed = 360
        Obj_WaitRotate
        obj_stoprotating
        Skater_Playanim anim = WWalk Cycle
        obj_movetopos <Pos> Speed = 10 accel = 10
        Obj_WaitMove
        obj_stopmoving
    endif
    Skater_Playanim anim = WStand Cycle
    obj_setorientation dir = <Orientation>
endscript

script bmx_finish_on 
    if NOT IsCreated si_bike
        TurnOnSpecialItem specialitem_details = bike_details
    endif
    Skater_Playanim anim = BMX_Getup BlendPeriod = 0 no_restart
    switch_all_bike_peds Off
    if ObjectExists id = bikespot
        bikespot ::Die
    endif
    SkaterOnBike
    wait 1 gameframe
    skatercam0 ::sc_setmode mode = 2
    Skater_WaitAnimFinished
    UnPausePhysics
    enableplayerinput
    restore_start_key_binding
    goal_kill_bike_spot_floaters
    change dont_create_speech_boxes = 0
    if GameModeEquals is_career
        CareerFunc func = GetCurrentBikeTrainingGoal
        if (<current_bike_training_goal> = 0)
            goal_bike_goals_start_basics_goal
        else
            Bike_Start
        endif
    else
        Bike_Start
    endif
endscript

script bmx_finish_off 
    SkaterOffBike
    switch_all_bike_peds on
    KillSpawnedScript name = bike_play_looping_sounds
    StopBikeLoopingSounds
    obj_setboundingsphere 10000
    switchonatomic board
    UnsetBoardMissing
    Skater_Playanim anim = GetUp_S_RunJump BlendPeriod = 0.0 Speed = 1.200
    GetSkaterCam
    <skatercam> ::LookaroundOnDPad_Off
    SetAnalogStickActiveForMenus 1
    wait 1 gameframe
    skatercam0 ::sc_setmode mode = 2
    Skater_WaitAnim percent = 50
    obj_restoreboundingsphere
    UnPausePhysics
    enableplayerinput
    restore_start_key_binding
    change dont_create_speech_boxes = 0
    create_bike_spot
    goal_create_bike_spot_floaters
    SkaterLoopingSound_TurnOn
    MakeSkaterGoto ongroundai
endscript

script switch_all_bike_peds 
    GetArraySize bike_ped_ids
    index = 0
    begin 
    id = ((bike_ped_ids [ <index> ]).id)
    if GotParam Off
        if IsCreated <id>
            Kill name = <id>
        endif
    else
        GetLevelStructureName
        RemoveParameter level
        FormatText checksumname = current_level (<level_structure_name>.level)
        level = ((bike_ped_ids [ <index> ]).level)
        if (<level> = <current_level>)
            if NOT IsCreated <id>
                if IsInNodeArray <id>
                    Create name = <id>
                endif
            endif
        endif
    endif
    index = (<index> + 1)
    repeat <array_size>
endscript
BikeSpotComponents = [
    { Component = Suspend }
    { Component = motion }
    { Component = objectproximity }
    {
        Component = AnimTree
        SkeletonName = si_bmx
        ReferenceChecksum = si_bmx
        animEventTableName = PedAnimEventTable
        defaultcommandtarget = PedMainAnimParentNode
        DefaultWaitTarget = PedMainAnimParentNode
    }
    { Component = skeleton SkeletonName = si_bmx }
    { Component = ModelLightUpdate }
    { Component = Model usemodellights Model = 'specialitems/bmx/si_bmx.skin' }
    {
        Component = shadow
        ShadowType = volume
        ShadowVolumeModels = [ 'Models\volume_shadows\Volume_BMX_Shadow.shd' ]
    }
    { Component = compassblip compassbliptype = bike }
]

script create_bike_spot 
    obj_getid
    MangleChecksums a = bikespot b = <ObjID>
    if ObjectExists id = <mangled_id>
        <mangled_id> ::Die
    endif
    CreateCompositeObject {
        Components = BikeSpotComponents
        params = { name = <mangled_id> }
    }
    if IsCreated <mangled_id>
        <mangled_id> ::Ped_InitStaticAnimTree
        <mangled_id> ::Ped_PlayAnim anim = BMX_Getup Speed = 0 BlendPeriod = 0
        <mangled_id> ::obj_spawnscriptlater bike_spot_setup
    endif
endscript

script bike_spot_setup 
    orient_to_skater
    obj_getid
    Obj_ClearExceptions
    inner_radius = 12
    obj_setinnerradius <inner_radius>
    SetEventHandlerOnObject {
        Ex = anyobjectinradius
        object = <ObjID>
        exception
        scr = bike_speech_box
        params = {
            ped_id = <ObjID>
            inner_radius = <inner_radius>
        }
    }
    Block
endscript

script orient_to_skater 
    skater ::obj_getorientation
    Orientation = (<x> * (1.0, 0.0, 0.0) + <y> * (0.0, 1.0, 0.0) + <z> * (0.0, 0.0, 1.0))
    obj_setorientation dir = <Orientation>
    skater ::obj_getposition
    obj_setposition position = <Pos>
endscript

script bike_speech_box 
    ClearEventHandler \{ anyobjectinradius }
    ClearException \{ anyobjectinradius }
    <ped_id> ::ped_speech_got_trigger {
        ped_id = <ped_id>
        colobjid = <colobjid>
        inner_radius = <inner_radius>
        set_script = SetEventHandlerOnObject
        set_script_scr = bike_speech_box
        accept_text = 'Wcinij \ms aby wsi¹æ na rower'
        activation_script = toggle_bike_on_off
        activation_script_params = {on bike_ped_id = <ped_id>}
        exception
        dont_deactivate_goals
    }
endscript
BikeWallRideExceptionTable = [
    {
        exception
        Ex = Landed
        scr = bike_Land
        params = { NoBlend IgnoreAirTime }
    }
    { exception Ex = Ollied scr = bike_Wallie }
    { exception Ex = GroundGone scr = bike_WallrideEnd }
]

script bike_wallride 
    OnExceptionRun
    ResetEventHandlersFromTable BikeWallRideExceptionTable
    ClearTrickQueue
    SetQueueTricks NoTricks
    cancelrotatedisplay
    LaunchStateChangeEvent state = Skater_OnWall
    vibrate actuator = 1 percent = 40
    bailoff
    OnExitRun bike_wallride_cleanup
    obj_clearflag FLAG_SKATER_MANUALCHEESE
    if GotParam left
        move x = 36
    else
        move x = -36
    endif
    if bailison
        setstate Air
        printf 'WallRide Bail'
        goto bike_bail
    endif
    bailoff
    ClearTrickQueue
    SetTrickScore 200
    if GotParam left
        flip
    endif
    if backwards
        SetBikeTrickName name = 'Backwards Wallride'
    else
        SetBikeTrickName name = 'Wallride'
    endif
    anim = BMX_WallRide
    Skater_PlayBikeAnim anim = <anim> BlendPeriod = 0.1000 Cycle
    if GotParam left
        FlipAfter
    endif
    display
    begin 
    tweaktrick 25
    WallrideTrail
    wait 1 frame
    DoNextTrick
    repeat 
endscript

script bike_wallride_cleanup 
    vibrate \{ actuator = 1 percent = 0 }
endscript

script bike_WallrideEnd 
    BlendperiodOut \{ 0 }
    SetException \{ Ex = Landed scr = bike_Land }
    ClearExceptions
    if InAir
        Skater_PlayBikeAnim \{ anim = BMX_AirIdle Cycle BlendPeriod = 0 }
        goto \{ bike_Airborne }
    endif
endscript

script bike_Wallie 
    DoNextTrick
    vibrate \{ actuator = 1 percent = 50 duration = 0.1000 }
    Skater_PlayBikeAnim \{ anim = BMX_idle BlendPeriod = 0.0 }
    SetBikeTrickName \{ name = "Wallie Hop" }
    SetTrickScore \{ 250 }
    ClearException \{ Ollied }
    display
    jump
    WaitAnimWhilstChecking
    goto \{bike_Airborne params = { BlendPeriod = 0 }}
endscript
BikeManualExceptionTable = [
    {
        exception
        Ex = GroundGone
        scr = bike_GroundGone
        params = { NoBoneless }
    }
    { exception Ex = FlailHitWall scr = bike_Flail }
    { exception Ex = FlailLeft scr = bike_Flail }
    { exception Ex = FlailRight scr = bike_Flail }
]
bike_backwards_ExceptionTable = [
    { exception Ex = Ollied scr = bike_Ollie }
    {
        exception
        Ex = OffMeterBottom
        scr = bike_backwards_revert
        params = { Manual = Manual }
    }
    {
        exception
        Ex = OffMeterTop
        scr = bike_backwards_revert
        params = { Manual = Manual }
    }
    { exception Ex = GroundGone scr = bike_GroundGone }
]

script bike_backwards_balance_trick 
    if NOT OnGround
        setstate Ground
    endif
    resetlandedfromvert
    ClearTrickQueue
    SetQueueTricks NoTricks
    dobalancetrick ButtonA = LeftRight ButtonB = LeftLeft type = Manual Tweak = 1
    ResetEventHandlersFromTable bike_backwards_ExceptionTable
    Skater_PlayBikeAnim anim = BMX_BackPedal Cycle
    if GotParam manual_balance_anim
        Skater_PlayBikeAnim anim = <manual_balance_anim> Wobble wobbleparams = Manual_wobble_params
    endif
    was_held = 0
    SetTrickName ''
    SetTrickScore 0
    display Blockspin
    begin 
    if NOT backwards
        stopbalancetrick
        bike_land2 no_anim
    endif
    if ((IsXbox)|| (isPC))
        if Held white
            bike_backwards_revert
        endif
    else
        if IsNGC
            if Held z
                bike_backwards_revert
            endif
        else
            if Held r2
                bike_backwards_revert
            endif
        endif
    endif
    DoNextTrick
    wait 1 gameframe
    repeat 
endscript

script bike_backwards_revert 
    stopbalancetrick
    rotate
    if lastspinwas \{ Frontside }
        flip
    endif
    Skater_PlayBikeAnim \{ anim = BMX_Pivot_FromBackwards BlendPeriod = 0 }
    if lastspinwas \{ Frontside }
        FlipAfter
    endif
    Skater_WaitAnimFinished
    MakeSkaterGoto \{bike_Land bike_Land params = { no_anim = 1 }}
endscript

script bail_bike_manual 
    MakeSkaterGoto \{bike_bail params = { Manual = Manual }}
endscript

script bail_bike_nosemanual 
    MakeSkaterGoto \{ bike_bail }
endscript

script bike_enter_manual 
    MakeSkaterGoto \{ bike_manual }
endscript

script bike_enter_nosemanual 
    MakeSkaterGoto bike_manual params = {nose endo = <endo>}
endscript
bike_manual_wobble_params = {
    wobbleampa = { (0.0, 0.0) STATS_MANUAL }
    wobbleampb = { (0.0, 0.0) STATS_MANUAL }
    wobblek1 = { (0.0, 0.0) STATS_MANUAL }
    wobblek2 = { (0.0, 0.0) STATS_MANUAL }
    spazfactor = { (1.0, 1.0) STATS_MANUAL }
    dont_propagate
}
bike_manual_ExceptionTable = [
    {
        exception
        Ex = Landed
        scr = bike_Land
        params = { no_anim exit_tiretap }
    }
    { exception Ex = Ollied scr = bike_Ollie }
    { exception Ex = GroundGone scr = bike_GroundGone }
]

script bike_manual Score = 100
    ClearExceptions
    stopbalancetrick
    ResetEventHandlersFromTable bike_manual_ExceptionTable
    LaunchStateChangeEvent state = Skater_InManual
    if GotParam endo
        anim = BMX_NoseWheelie_Init
        name = 'Endo'
        state = bike_nosemanual_state
        Blockspin = Blockspin
    else
        if GotParam nose
            if GotParam tire_tap
                name = 'Nose Pick'
                anim = BMX_NoseWheelie_Range
            else
                name = 'Nose Manual'
                anim = BMX_NoseWheelie_Init
                Blockspin = Blockspin
            endif
            state = bike_nosemanual_state
        else
            if GotParam tire_tap
                name = 'Tire Tap'
                anim = BMX_Wheelie_Init
            else
                name = 'Manual'
                anim = BMX_Wheelie_Init
                Blockspin = Blockspin
            endif
            state = bike_manual_state
        endif
    endif
    SetBikeTrickName name = ''
    SetTrickScore 0
    display Blockspin
    SetBikeTrickName name = <name>
    SetTrickScore <Score>
    display <Blockspin>
    setgrindtweak 1
    Skater_PlayBikeAnim anim = <anim> Wobble wobbleparams = bike_manual_wobble_params BlendPeriod = 0.1000
    goto <state>
endscript

script SetBikeTrickName 
    if backwards
    endif
    SetTrickName <name>
endscript

script bike_manual_state 
    create_bike_manual_meter
    OnExitRun destroy_bike_manual_meter
    SetQueueTricks Bike_ManualTricks
    begin 
    DoNextTrick
    GetBikeManualAngle
    if InTireTap
        <manual_angle> = (<manual_angle> - 50)
        if (<manual_angle> < 0)
            <manual_angle> = (-4 * <manual_angle>)
        else
            <manual_angle> = (4 * <manual_angle>)
        endif
    endif
    if (<manual_angle> < 0)
        <manual_angle> = -1 * <manual_angle>
    endif
    if (<manual_angle> > 99)
        <manual_angle> = 99
    endif
    vibrate actuator = 1 percent = <manual_angle>
    wait 1 gameframe
    repeat 
endscript

script bike_nosemanual_state 
    create_bike_manual_meter nose = nose
    OnExitRun destroy_bike_manual_meter
    SetQueueTricks Bike_NoseManualTricks
    begin 
    DoNextTrick
    GetBikeManualAngle
    if InTireTap
        <manual_angle> = (<manual_angle> - 50)
        if (<manual_angle> < 0)
            <manual_angle> = (-4 * <manual_angle>)
        else
            <manual_angle> = (4 * <manual_angle>)
        endif
    endif
    if (<manual_angle> < 0)
        <manual_angle> = -1 * <manual_angle>
    endif
    if (<manual_angle> > 99)
        <manual_angle> = 99
    endif
    vibrate actuator = 1 percent = <manual_angle>
    wait 1 gameframe
    repeat 
endscript

script bike_manual_pivot 
    create_bike_manual_meter nose = <nose>
    getspeed
    if (<Speed> > 10)
        rotatedisplay \{ y duration = 0.5000 seconds endangle = 180 }
        wait \{ 0.5000 seconds }
        rotate
        cancelrotatedisplay
        SetBikeTrickName name = <name>
        SetTrickScore <Score>
        display
    endif
    goto <state>
endscript

script create_bike_manual_meter 
    if GotParam nose
        texture = bike_nosemeter
        flip_v = flip_v
        arc_pos = (-25.0, 7.0)
        Pos = (415.0, 240.0)
    else
        texture = bike_tailmeter
        arc_pos = (25.0, 7.0)
        Pos = (380.0, 240.0)
    endif
    SetScreenElementLock Off id = player1_panel_container
    if ScreenElementExists id = bike_manual_meter
        DestroyScreenElement id = bike_manual_meter
    endif
    CreateScreenElement {
        id = bike_manual_meter
        type = ContainerElement
        parent = player1_panel_container
        just = [ center center ]
        Pos = <Pos>
        Scale = 1.200
    }
    CreateScreenElement {
        id = bike_manual_meter_part1
        type = ContainerElement
        parent = bike_manual_meter
        just = [ center center ]
        Pos = (0.0, 0.0)
    }
    CreateScreenElement {
        type = SpriteElement
        parent = bike_manual_meter_part1
        texture = <texture>
        Scale = (1.0, 1.0)
        just = [ center center ]
        Pos = (0.0, 0.0)
        rgba = [ 100 100 100 100 ]
        <flip_v>
    }
    CreateScreenElement {
        type = SpriteElement
        parent = bike_manual_meter_part1
        texture = <texture>
        Scale = (1.0, 1.0)
        just = [ center center ]
        Pos = (-1.0, 1.0)
        rgba = [ 0 0 0 100 ]
        <flip_v>
    }
    CreateScreenElement {
        id = bike_manual_meter_part2
        type = SpriteElement
        parent = bike_manual_meter
        texture = bike_arc
        Scale = (1.0, 1.0)
        just = [ center bottom ]
        Pos = <arc_pos>
        rgba = [ 128 128 128 128 ]
        <flip_v>
    }
    KillSpawnedScript name = update_bike_manual_meter
    obj_spawnscriptlater update_bike_manual_meter params = { nose = <nose> }
endscript

script destroy_bike_manual_meter 
    KillSpawnedScript \{ name = update_bike_manual_meter }
    if ScreenElementExists \{ id = bike_manual_meter }
        DestroyScreenElement \{ id = bike_manual_meter }
    endif
endscript

script update_bike_manual_meter 
    begin 
    if NOT ScreenElementExists \{ id = bike_manual_meter_part1 }
        return 
    endif
    GetBikeManualAngle
    if GotParam \{ nose }
        rot_angle = (0.9000 * <manual_angle>)
    else
        rot_angle = (-0.9000 * <manual_angle>)
    endif
    DoScreenElementMorph id = bike_manual_meter_part1 rot_angle = <rot_angle>
    wait \{ 1 gameframe }
    repeat 
endscript
Bike_ManualTricks = [
    {
        trigger = { Press Circle 50 }
        scr = bike_manual_xup
        params = { name = "Manual X-up" Score = 50 state = bike_manual_state }
    }
    {
        trigger = { BikePress rightup 50 }
        scr = bike_manual_crankflip
        params = { name = "Manual Crankflip" Score = 50 anim = BMX_Wheelie_CrankFlip state = bike_manual_state }
    }
    {
        trigger = { BikePress rightdown 50 }
        scr = bike_manual_barspin
        params = { name = "Manual Barspin" Score = 50 state = bike_manual_state }
    }
    {
        trigger = { BikePress rightleft 50 }
        scr = bike_flatland_decade
        params = { name = "Decade" Score = 50 state = bike_manual_state left }
    }
    {
        trigger = { BikePress rightright 50 }
        scr = bike_flatland_decade
        params = { name = "Decade" Score = 50 state = bike_manual_state }
    }
    {
        trigger = { Press r2 50 }
        scr = bike_manual_pivot
        xbox_trigger = { Press white 50 }
        NGC_Trigger = { Press z 50 }
        params = { name = "Manual Pivot" Score = 50 state = bike_manual_state }
    }
]
Bike_NoseManualTricks = [
    {
        trigger = { BikePress rightup 50 }
        scr = bike_manual_crankflip
        params = {
            name = "Nosemanual Crankflip"
            Score = 50
            anim = BMX_NoseWheelie_CrankFlip
            nose = nose
            state = bike_nosemanual_state
        }
    }
    {
        trigger = { BikePress rightright 50 }
        scr = bike_nosewheelie_whip
        params = { name = "Nosemanual Whip" Score = 50 state = bike_nosemanual_state }
    }
    {
        trigger = { BikePress rightleft 50 }
        scr = bike_nosewheelie_whip
        params = { name = "Nosemanual Whip" Score = 50 left state = bike_nosemanual_state }
    }
    {
        trigger = { Press r2 50 }
        scr = bike_manual_pivot
        xbox_trigger = { Press white 50 }
        NGC_Trigger = { Press z 50 }
        params = { name = "Nosemanual Pivot" Score = 50 state = bike_nosemanual_state nose = nose }
    }
]

script bike_exit_endo 
    KillManualVibration
    MakeSkaterGoto \{ bike_backwards_balance_trick }
endscript

script bike_empty_trick 
    SetBikeTrickName name = <name>
    SetTrickScore <Score>
    display
    if GotParam \{ state }
        goto <state>
    endif
endscript

script bike_partial_barspin {init_anim = BMX_BarSpin_Init idle_anim = BMX_BarSpin_Idle out_anim = BMX_BarSpin_Out}
    OnExitRun bike_partial_barspin_cleanup
    count = 1
    if InAir
        bailon
    endif
    if (<state> = bike_manual_state)
        create_bike_manual_meter
    endif
    Skater_PlayBarspinAnim anim = <init_anim> Speed = <Speed>
    Skater_WaitBarSpinAnimFinished
    SetBikeTrickName name = <name>
    SetTrickScore <Score>
    display
    begin 
    if Skater_BarSpinAnimComplete
        if (<count> > 1)
            bike_set_multiple_trick_text name = <name> count = <count>
            SetTrickScore (<Score> + (<count> - 1)* 100)
            display overwrite
        endif
        if NOT Held <button> buttons = <buttons>
            break 
        endif
        count = (<count> + 1)
        Skater_PlayBarspinAnim anim = <idle_anim> BlendPeriod = 0
    endif
    wait 1 gameframe
    repeat 
    if GotParam out_anim
        Skater_PlayBarspinAnim anim = <out_anim> Speed = <Speed>
    else
        Skater_PlayBarspinAnim anim = <init_anim> backwards Speed = <Speed>
    endif
    bailoff
    DoNextTrick
    Skater_WaitBarSpinAnimFinished
    if GotParam state
        goto <state>
    endif
endscript

script bike_manual_barspin 
    OnExitRun \{ bike_partial_barspin_cleanup }
    if InAir
        bailon
    endif
    if (<state> = bike_manual_state)
        create_bike_manual_meter
    endif
    Skater_PlayBarspinAnim \{ anim = BMX_BarSpin_Partial }
    SetBikeTrickName name = <name>
    SetTrickScore <Score>
    display
    wait \{ 15 gameframes }
    bailoff
    DoNextTrick
    Skater_WaitBarSpinAnimFinished
    if GotParam \{ state }
        goto <state>
    endif
endscript

script bike_partial_barspin_cleanup 
    Skater_BarspinAnimOff
endscript

script bike_nosewheelie_whip 
    create_bike_manual_meter \{ nose = nose }
    if GotParam \{ left }
        flip
    endif
    Skater_PlayBikeAnim \{ anim = BMX_NoseWheelie_Whip }
    if GotParam \{ left }
        FlipAfter
    endif
    Skater_WaitAnimFinished
    SetBikeTrickName \{ name = "Nosemanual Whip" }
    SetTrickScore \{ 50 }
    display
    Skater_PlayBikeAnim \{ anim = BMX_NoseWheelie_Init Wobble wobbleparams = bike_manual_wobble_params }
    goto <state>
endscript

script bike_flatland_decade 
    create_bike_manual_meter
    if GotParam \{ left }
        flip
    endif
    Skater_PlayBikeAnim \{ anim = BMX_Decade_Ground }
    if GotParam \{ left }
        FlipAfter
    endif
    Skater_WaitAnimFinished
    SetBikeTrickName \{ name = "Decade" }
    SetTrickScore \{ 50 }
    display
    Skater_PlayBikeAnim \{ anim = BMX_Wheelie_Init Wobble wobbleparams = bike_manual_wobble_params }
    goto <state>
endscript

script bike_manual_crankflip 
    create_bike_manual_meter nose = <nose>
    Skater_PlayBikeAnim anim = <anim>
    Skater_WaitAnimFinished
    SetBikeTrickName name = <name>
    SetTrickScore <Score>
    display
    if GotParam \{ nose }
        out_anim = BMX_NoseWheelie_Init
    else
        out_anim = BMX_Wheelie_Init
    endif
    Skater_PlayBikeAnim anim = <out_anim> Wobble wobbleparams = bike_manual_wobble_params
    goto <state>
endscript

script bike_partial_xup 
    if NOT BikeInXup
        if GotParam \{ state }
            if (<state> = bike_manual_state)
                create_bike_manual_meter
            endif
        endif
        BikeEnterXup
        ClearTrickQueue
        Skater_PlayBarspinAnim \{ anim = bmx_xup_init_partial }
        Skater_WaitBarSpinAnimFinished
        Skater_PlayBarspinAnim \{ anim = bmx_xup_idle_partial Cycle }
        SetBikeTrickName name = <name>
        SetTrickScore <Score>
        display
    endif
    if GotParam \{ state }
        goto <state>
    endif
endscript

script bike_xup 
    if NOT BikeInXup
        if InAir
            BikeEnterXup
            ClearTrickQueue
            Skater_Playanim \{ anim = BMX_Xup_Init }
            Skater_WaitAnimFinished
            SetBikeTrickName name = <name>
            SetTrickScore <Score>
            display
        endif
    endif
    if InAir
        goto \{ bike_air_state }
    else
        goto \{ bike_Land }
    endif
endscript

script bike_manual_xup 
    if NOT BikeInXup
        if GotParam \{ state }
            if (<state> = bike_manual_state)
                create_bike_manual_meter
            endif
        endif
        BikeEnterXup
        ClearTrickQueue
        Skater_PlayBikeAnim \{ anim = BMX_Wheelie_Init Wobble wobbleparams = bike_manual_wobble_params }
        SetBikeTrickName name = <name>
        SetTrickScore <Score>
        display
    endif
    if GotParam \{ state }
        goto <state>
    endif
endscript

script bike_release_partial_xup 
    if BikeInManual
        SetQueueTricks \{ Bike_ManualTricks }
        Skater_PlayBikeAnim \{ anim = BMX_Wheelie_Init Wobble wobbleparams = bike_manual_wobble_params }
    else
        Skater_Playanim \{ anim = BMX_Xup_Init backwards }
        Skater_WaitAnimFinished
        SetQueueTricks \{ Bike_AirTricks }
    endif
endscript

script Skater_PlayBikeAnim 
    if BikeInXup
        AppendSuffixToChecksum base = <anim> suffixstring = '_xup'
        if anim_animexists anim = <appended_id> ReferenceChecksum = thps7_human
            anim = <appended_id>
        else
            BikeExitXup
        endif
    endif
    Skater_Playanim <...> 
endscript

script bike_skidTrail 
    if ((IsXbox)|| (isPC))
        name = skidtrail
    else
        name = skidtrail_ps2
    endif
    texturesplat size = 6 Radius = 0 bone = Bone_Board_Tail name = <name> trail lifetime = 15
endscript

script bike_skid 
    if Held LeftRight
        must_unflip = 1
        flip
    endif
    if Held LeftLeft
        dir = left
    else
        if Held LeftRight
            dir = RIGHT
        else
            goto bike_onground_loop
        endif
    endif
    BikeEnterSkid
    Skater_PlayBikeAnim anim = BMX_Skid_Init
    Play_BikeSFX_Skid
    begin 
    getspeed
    if (<Speed> < 100)
        break 
    endif
    if (<Speed> > 50)
        bike_skidTrail
    endif
    if Skater_AnimComplete
        Skater_PlayBikeAnim anim = BMX_Skid_Idle Cycle
    endif
    if NOT Held r1
        break 
    endif
    if (<dir> = left)
        if NOT Held LeftLeft
            if NOT Held leftdownleft
                if NOT Held leftupleft
                    break 
                endif
            endif
        endif
    else
        if NOT Held LeftRight
            if NOT Held leftdownright
                if NOT Held leftupright
                    break 
                endif
            endif
        endif
    endif
    wait 1 gameframe
    repeat 
    Skater_PlayBikeAnim anim = BMX_Skid_Out
    if GotParam must_unflip
        FlipAfter
    endif
    BikeExitSkid
    Skater_WaitAnimFinished
    Skater_PlayBikeAnim anim = BMX_idle norestart
    goto bike_onground_loop
endscript
Bike_Start_ExceptionTable = [
    { exception Ex = GroundGone scr = bike_GroundGone }
    { exception Ex = FlailHitWall scr = bike_Flail }
    { exception Ex = FlailLeft scr = bike_Flail }
    { exception Ex = FlailRight scr = bike_Flail }
    { exception Ex = RunHasEnded scr = EndOfRun }
    { exception Ex = GoalHasEnded scr = Goal_EndOfRun }
]

script Bike_Start 
    if NOT IsCreated si_bike
        skater ::TurnOnSpecialItem specialitem_details = bike_details
    endif
    skater ::switchoffatomic board
    skater ::switchoffatomic ped_board
    GetSkaterCam
    <skatercam> ::LookaroundOnDPad_On
    SetAnalogStickActiveForMenus 0
    bailoff
    SetCurrentBailEndpose
    OnExceptionRun
    ResetEventHandlersFromTable Bike_Start_ExceptionTable
    orient_vehicle
    remove_all_anim_subsets
    SkaterLoopingSound_TurnOn
    KillSpawnedScript name = bike_play_looping_sounds
    obj_spawnscript bike_play_looping_sounds
    if walking
        SwitchToSkatingPhysics
    endif
    canbrakeon
    forceautokickon
    SwitchOffBoard
    allowrailtricks
    if BoardIsRotated
        boardrotate
    endif
    VibrateOff
    obj_killspawnedscript name = BailBoardControl
    ClearEventBuffer
    enableplayerinput
    bailoff
    BashOff
    setrollingfriction default
    setspeed 0
    BlendperiodOut 0
    if IsCreated si_bike
        si_bike ::Skater_PlayFrontWheelAnim anim = BMX_Front_Tire_Rotate Cycle not_a_skater = 1 Speed = 1.0
        si_bike ::Skater_PlayBackWheelAnim anim = BMX_Rear_Tire_Rotate Cycle not_a_skater = 1 Speed = 1.0
    endif
    UnpauseSkaters
    goto bike_onground
endscript

script bike_onground 
    SetException \{ Ex = RunHasEnded scr = EndOfRun }
    SetException \{ Ex = GoalHasEnded scr = Goal_EndOfRun }
    stopbalancetrick
    vibrate \{ actuator = 0 percent = 0 }
    ResetBikeManualAngle
    cancelrotatedisplay
    resetlandedfromvert
    if NOT OnGround
        setstate \{ Ground }
    endif
    SetManualTricks \{ NoTricks }
    if backwards
        goto \{ bike_backwards_balance_trick }
    endif
    orient_vehicle
    Skater_PlayBikeAnim \{ anim = BMX_idle Cycle norestart }
    bike_onground_loop
endscript
Bike_OnGroundExceptionTable = [
    { exception Ex = GroundGone scr = bike_GroundGone }
    { exception Ex = Ollied scr = bike_Ollie }
    { exception Ex = RunHasEnded scr = EndOfRun }
    { exception Ex = GoalHasEnded scr = Goal_EndOfRun }
]
BikeToWalkTricks = [
    {
        SwitchControl_Trigger
        scr = toggle_bike_on_off
        params = { Off }
    }
]

script bike_onground_loop 
    SetAnalogStickActiveForMenus \{ 0 }
    ResetEventHandlersFromTable \{ Bike_OnGroundExceptionTable }
    SetQueueTricks \{ BikeToWalkTricks }
    begin 
    if NOT IsSkaterOnBike
        MakeSkaterGoto \{ ongroundai }
    endif
    orient_vehicle
    DoNextTrick
    bike_OnGroundAI
    wait \{ 1 gameframe }
    repeat 
endscript

script bike_OnGroundAI Coasting = 0 Pushes = 0 PressureTimer = 0
    getspeed
    pedaling = 0
    if (<Speed> < 100)
        if leftleftpressed
            if NOT Flipped
                flip
            endif
            Skater_PlayBikeAnim anim = BMX_Stopped_TurnR Cycle norestart
        else
            if leftrightpressed
                if Flipped
                    flip
                endif
                Skater_PlayBikeAnim anim = BMX_Stopped_TurnR Cycle norestart
            else
                Skater_PlayBikeAnim anim = BMX_Stopped Cycle norestart Speed = 0.3000
            endif
        endif
    else
        if leftleftpressed
            if crouched
                bike_playturnanim TurnIdle = BMX_TurnL_Pedaling turnAnim = BMX_TurnL_Coasting_Idle dir = left
            else
                bike_playturnanim TurnIdle = BMX_TurnL_Coasting turnAnim = BMX_TurnL_Coasting_Idle dir = left
            endif
        else
            if leftrightpressed
                if crouched
                    bike_playturnanim TurnIdle = BMX_TurnR_Pedaling turnAnim = BMX_TurnR_Coasting_Idle dir = RIGHT
                else
                    bike_playturnanim TurnIdle = BMX_TurnR_Coasting turnAnim = BMX_TurnR_Coasting_Idle dir = RIGHT
                endif
            else
                if braking
                    getspeed
                    if (<Speed> > 50)
                        Skater_PlayBikeAnim anim = BMX_idle norestart
                    else
                        if heldlongerthan button = leftdown 2 second
                            goto bike_handbrake
                        else
                            Skater_PlayBikeAnim anim = BMX_idle Cycle norestart
                        endif
                    endif
                else
                    pedaling = 1
                    if crouched
                        if speedlessthan 300
                            Skater_PlayBikeAnim anim = BMX_Accel norestart
                            Skater_WaitAnimFinished
                        else
                            Skater_PlayBikeAnim anim = BMX_Idle_Pedaling Cycle norestart
                            bike_getpedalanimspeed
                            Skater_SetAnimSpeed Speed = <animspeed>
                        endif
                    else
                        Skater_PlayBikeAnim anim = BMX_idle Cycle
                    endif
                endif
            endif
        endif
    endif
    change bike_pedaling = <pedaling>
endscript

script bike_getpedalanimspeed \{ max = 1.200 min = 0.3000 }
    getspeed
    animspeed = (<min> + <Speed> / 600)
    if (<animspeed> > <max>)
        <animspeed> = <max>
    endif
    return animspeed = <animspeed>
endscript

script bike_playturnanim controller = 0
    getspeed
    anim = BMX_idle
    OnExitRun bike_blenturnanims_exit
    if leftleftpressed
        lefty = 1
    endif
    if BikeInXup
        AppendSuffixToChecksum base = <turnAnim> suffixstring = '_xup'
        if anim_animexists anim = <appended_id> ReferenceChecksum = thps7_human
            turnAnim = <appended_id>
            anim = BMX_idle_Xup
        else
            BikeExitXup
        endif
    endif
    Skater_PlayTurnAnim anim = <anim> turn_anim = <turnAnim> Cycle synctopreviousanim BlendPeriod = 0.4000
    wait 1 gameframe
    begin 
    if GotParam lefty
        if NOT leftleftpressed
            break 
        endif
    else
        if NOT leftrightpressed
            break 
        endif
    endif
    if Held r1
        if BikeCanSkid
            goto bike_skid
        endif
    endif
    wait 1 gameframe
    repeat 
    goto bike_onground_loop
endscript

script bike_blenturnanims_exit 
    Skater_SteerAnimOff
endscript

script bike_handbrake 
    ClearEventBuffer
    OnExceptionRun \{ BrakeDone }
    setrollingfriction \{ 100 }
    ClearTrickQueue
    Skater_PlayBikeAnim \{ anim = BMX_idle norestart Cycle }
    begin 
    wait \{ 1 gameframe }
    if Held \{ leftup }
        break 
    endif
    if crouched
        break 
    endif
    repeat 
    setrollingfriction \{ default }
    goto \{ bike_onground_loop }
endscript

script Bike_Bail_Cleanup 
    printf \{ 'restoring original bounding sphere for bail' }
    obj_restoreboundingsphere
    notinbail
    restoreautokick
    enableplayerinput
    setrollingfriction \{ default }
endscript

script force_bike_bail 
    MakeSkaterGoto \{ bike_bail }
endscript

script bike_bail BoardOffFrame = 1 BoardVel = (0.0, 0.0, 100.0) BoardRotVel = (0.0, 0.0, 0.0) BoardSkaterVel = 1
    printf 'bike bail'
    ClearExceptions
    ClearTrickQueue
    bailoff
    obj_setboundingsphere 10000
    OnExitRun Bike_Bail_Cleanup
    Skater_SteerAnimOff
    destroy_bike_manual_meter
    inbail
    LaunchStateChangeEvent state = Skater_InBail
    KillManualVibration
    disableplayerinput AllowCameraControl
    norailtricks
    SetExtraTricks NoTricks
    BailSkaterTricks
    stopbalancetrick
    BikeExitTireTap
    BikeExitXup
    cancelrotatedisplay
    if NOT landedfromvert
        setrollingfriction 20
    else
        setrollingfriction 1000
    endif
    canbrakeon
    overridelimits max = 10000 friction = 0 time = 0
    restoreautokick
    ClearSkaterCamOverride
    Play_BikeSFX_Bike_Fall
    if onrail
        obj_spawnscriptlater FallOffRail params = {xmove = <xmove> moveframes = <moveframes>}
        ClearException GroundGone
        vibrate actuator = 1 percent = 100 duration = 0.2000
        setstate Air
        move y = 2.0
        rotate y = randomrange (1.0, 20.0)
    endif
    forceautokickoff
    if GotParam Manual
        Skater_Playanim anim = Bail_Manual_BK
    else
        Skater_Playanim anim = Bail_Manual_FT
    endif
    KillSpecial
    ClearExceptions
    BailSkaterTricks
    stopbalancetrick
    obj_spawnscriptlater BailBoardControl params = {BoardOffFrame = <BoardOffFrame> BoardVel = <BoardVel> BoardRotVel = <BoardRotVel> BoardSkaterVel = <BoardSkaterVel> NoBailBoard = <NoBailBoard>}
    Skater_WaitAnimFinished
    kill_bail_bike
    Skater_Playanim anim = BMX_Getup
    Skater_WaitAnimFinished
    printf 'bike bail done'
    Bike_Start params = <struct>
endscript

script kill_bail_bike 
    obj_getid
    MangleChecksums a = BailBike b = <ObjID>
    if ObjectExists id = <mangled_id>
        <mangled_id> ::Die
    endif
    if IsCreated \{ si_bike }
        si_bike ::unhide
    endif
endscript

script bike_Flail \{ Speed = 0 bailspeed = 999 }
    getspeed
    if (<Speed> > <bailspeed>)
        goto \{ bike_bail }
    else
        Skater_PlayBikeAnim \{ anim = BMX_Bump }
        Skater_WaitAnimFinished
        goto \{ bike_onground }
    endif
endscript

script bike_Ollie \{ jumpheight = 380 }
    ClearException \{ Ollied }
    stopbalancetrick
    stopskitch
    Skater_PlayBikeAnim \{ anim = BMX_BunnyHop }
    if GotParam \{ jumpheight }
        jump Speed = <jumpheight>
    else
        jump
    endif
    if GotParam \{ boost }
        ExitStallBoost
    endif
    SetTrickName \{ "" }
    SetTrickScore \{ 0 }
    display \{ Blockspin }
    SetTrickName \{ "" }
    SetTrickScore \{ 0 }
    display \{ SpinOnly }
    goto \{ bike_Airborne }
endscript
Bike_InAirExceptionTable = [
    { exception Ex = Landed scr = bike_Land }
    { exception Ex = wallplant scr = bike_wallplant }
    {
        exception
        Ex = WallRideLeft
        scr = bike_wallride
        params = { left }
    }
    {
        exception
        Ex = WallRideRight
        scr = bike_wallride
        params = { RIGHT }
    }
]

script bike_GroundGone 
    setstate \{ Air }
    LaunchStateChangeEvent \{ state = Skater_InAir }
    stopbalancetrick
    SetException \{ Ex = Ollied scr = bike_Ollie }
    ResetEventHandlersFromTable \{ Bike_InAirExceptionTable }
    ClearTrickQueue
    SetQueueTricks \{ NoTricks }
    WaitAnimWhilstCheckingLateOllie
    SetSkaterAirTricks
    ClearException \{ Ollied }
    SetTrickName \{ "" }
    SetTrickScore \{ 0 }
    display \{ Blockspin }
    SetTrickName \{ "" }
    SetTrickScore \{ 0 }
    display \{ SpinOnly }
    goto \{ bike_Airborne }
endscript

script bike_Airborne 
    setstate \{ Air }
    LaunchStateChangeEvent \{ state = Skater_InAir }
    stopbalancetrick
    ResetEventHandlersFromTable \{ Bike_InAirExceptionTable }
    Skater_SteerAnimOff
    SetManualTricks \{ NoTricks }
    allowrailtricks
    SetQueueTricks \{ Bike_AirTricks }
    if Skater_AnimEquals \{ BMX_BunnyHop }
        WaitAnimFinishedOrBikeTrick
    endif
    goto \{ bike_air_state }
endscript
BikeAirAnimParams = { hold BlendPeriod = 0.1000 norestart }

script bike_air_state 
    SetQueueTricks Bike_AirTricks
    begin 
    RemoveParameter frontflip
    RemoveParameter backflip
    if Held l2
        if Held leftdown
            backflip = 1
        else
            if Held leftdownleft
                backflip = 1
            else
                if Held leftdownright
                    backflip = 1
                else
                    if Held leftup
                        frontflip = 1
                    else
                        if Held leftupleft
                            frontflip = 1
                        else
                            if Held leftupright
                                frontflip = 1
                            endif
                        endif
                    endif
                endif
            endif
        endif
    endif
    if GotParam backflip
        Skater_PlayBikeAnim anim = BMX_Air_backflip BikeAirAnimParams
    else
        if GotParam frontflip
            Skater_PlayBikeAnim anim = BMX_Air_frontflip BikeAirAnimParams
        else
            if Held LeftLeft
                if Flipped
                    Skater_PlayBikeAnim anim = BMX_Air_LeanRight BikeAirAnimParams
                else
                    Skater_PlayBikeAnim anim = BMX_Air_LeanLeft BikeAirAnimParams
                endif
            else
                if Held LeftRight
                    if Flipped
                        Skater_PlayBikeAnim anim = BMX_Air_LeanLeft BikeAirAnimParams
                    else
                        Skater_PlayBikeAnim anim = BMX_Air_LeanRight BikeAirAnimParams
                    endif
                else
                    Skater_PlayBikeAnim anim = BMX_AirIdle Cycle norestart
                endif
            endif
        endif
    endif
    DoNextTrick
    wait 1 gameframe
    repeat 
endscript

script WaitAnimFinishedOrBikeTrick 
    begin 
    if Skater_AnimComplete
        break 
    endif
    DoNextTrick
    wait \{ 1 gameframe }
    repeat 
endscript
Bike_AirTricks = [
    {
        trigger = { InOrder leftdown square 500 }
        scr = bike_grab_trick2
        params = {
            name = "Superman Seatgrab"
            Score = 100
            buttons = [ square ]
            state = bike_air_state
            init_anim = BMX_SupermanSeat_Init
            idle_anim = BMX_SupermanSeat_Idle
            out_anim = BMX_SupermanSeat_Out
        }
    }
    {
        trigger = { Press square 500 }
        scr = bike_grab_trick2
        params = {
            name = "Tabletop"
            Score = 100
            button = square
            init_anim = BMX_TableTop_Init
            idle_anim = BMX_TableTop_Idle
            Speed = 1.0
            state = bike_air_state
            update_side
        }
    }
    {
        trigger = { Press Circle 50 }
        scr = bike_xup
        params = { name = "X-up" Score = 50 }
    }
    {
        trigger = { BikePress rightright 50 }
        scr = bike_grab_trick
        params = {
            name = "Tailwhip"
            Score = 100
            buttons = [ rightright rightupright rightdownright ]
            state = bike_air_state
            init_anim = BMX_TailWhip_Init
            idle_anim = BMX_TailWhip_Idle
            out_anim = BMX_TailWhip_Out
            idle_speed = 0.7500
            Speed = 1.250
        }
    }
    {
        trigger = { BikePress rightleft 50 }
        scr = bike_grab_trick
        params = {
            name = "Tailwhip"
            Score = 100
            buttons = [ rightleft rightupleft rightdownleft ]
            flip_anim
            state = bike_air_state
            init_anim = BMX_TailWhip_Init
            idle_anim = BMX_TailWhip_Idle
            out_anim = BMX_TailWhip_Out
            idle_speed = 0.7500
            Speed = 1.250
        }
    }
    {
        trigger = { BikePress rightdown 50 }
        scr = bike_partial_barspin
        params = {
            name = "Barspin"
            Score = 50
            buttons = [ rightdown rightdownright rightdownleft ]
            state = bike_air_state
        }
    }
    {
        trigger = { BikePress rightup 50 }
        scr = bike_grab_trick
        params = {
            name = "Crankflip"
            Score = 50
            buttons = [ rightup rightupright rightupleft ]
            init_anim = BMX_CrankFlip_Air_Init
            idle_anim = BMX_CrankFlip_Air_Idle
            out_anim = BMX_CrankFlip_Air_Out
            BlendPeriod = 0
            state = bike_air_state
        }
    }
]

script bike_grab_trick Speed = 1.0
    bailon
    count = 1
    LaunchStateChangeEvent state = Skater_InAir
    LaunchSubStateEntryEvent substate = Grab
    OnExitRun bike_ExitGrabTrick
    if GotParam update_side
        if Held LeftLeft
            wallride_left = 1
            flip_anim = 1
            side = left
        else
            wallride_right = 1
            side = RIGHT
        endif
    endif
    if GotParam flip_anim
        OnExitRun bike_ExitGrabTrick_flip
        flip
    endif
    Skater_PlayBikeAnim anim = <init_anim> Speed = <Speed>
    SetBikeTrickName name = <name>
    SetTrickScore <Score>
    display
    begin 
    if Skater_AnimComplete
        if (<count> > 1)
            bike_set_multiple_trick_text name = <name> count = <count>
            SetTrickScore (<Score> + (<count> - 1)* 100)
            display overwrite
        endif
        if NOT Held <button> buttons = <buttons>
            break 
        endif
        count = (<count> + 1)
        Skater_PlayBikeAnim anim = <idle_anim> BlendPeriod = 0 Speed = <idle_speed>
    endif
    wait 1 gameframe
    repeat 
    if GotParam out_anim
        Skater_PlayBikeAnim anim = <out_anim> Speed = <Speed> BlendPeriod = 0
    else
        Skater_PlayBikeAnim anim = <init_anim> backwards Speed = <Speed> BlendPeriod = 0
    endif
    if GotParam flip_anim
        FlipAfter
    endif
    bailoff
    WaitAnimFinishedOrBikeTrick
    goto bike_Airborne
endscript

script bike_grab_trick2 Speed = 1.0
    bailon
    LaunchStateChangeEvent state = Skater_InAir
    LaunchSubStateEntryEvent substate = Grab
    OnExitRun bike_ExitGrabTrick
    if GotParam update_side
        if Held LeftLeft
            wallride_left = 1
            flip_anim = 1
            side = left
        else
            wallride_right = 1
            side = RIGHT
        endif
    endif
    if GotParam flip_anim
        OnExitRun bike_ExitGrabTrick_flip
        flip
    endif
    Skater_PlayBikeAnim anim = <init_anim> Speed = <Speed>
    wait 10 gameframes
    SetBikeTrickName name = <name>
    SetTrickScore <Score>
    display
    Skater_WaitAnimFinished
    if GotParam wallride_left
        SetException Ex = WallRideLeft scr = bike_wallride params = { left }
        SetException Ex = wallplant scr = bike_wallplant params = { left }
    endif
    if GotParam wallride_right
        SetException Ex = WallRideRight scr = bike_wallride params = { RIGHT }
        SetException Ex = wallplant scr = bike_wallplant params = { RIGHT }
    endif
    if Held <button> buttons = <buttons>
        Skater_PlayBikeAnim anim = <idle_anim> BlendPeriod = 0 Speed = <idle_speed> Cycle
        begin 
        if NOT Held <button> buttons = <buttons>
            break 
        endif
        if GotParam update_side
            if Held LeftLeft
                if (<side> = RIGHT)
                    side = left
                    flip
                    RemoveParameter flip_anim
                    ClearException WallRideRight
                    SetException Ex = WallRideLeft scr = bike_wallride params = { left }
                    SetException Ex = wallplant scr = bike_wallplant params = { left }
                    Skater_PlayBikeAnim anim = <idle_anim> Cycle
                endif
            else
                if Held LeftRight
                    if (<side> = left)
                        side = RIGHT
                        flip
                        flip_anim = 1
                        ClearException WallRideLeft
                        SetException Ex = WallRideRight scr = bike_wallride params = { RIGHT }
                        SetException Ex = wallplant scr = bike_wallplant params = { RIGHT }
                        Skater_PlayBikeAnim anim = <idle_anim> Cycle
                    endif
                endif
            endif
        endif
        wait 1 gameframe
        repeat 
    endif
    if GotParam out_anim
        Skater_PlayBikeAnim anim = <out_anim> Speed = <Speed> BlendPeriod = 0
    else
        Skater_PlayBikeAnim anim = <init_anim> backwards Speed = <Speed> BlendPeriod = 0
    endif
    if GotParam flip_anim
        FlipAfter
    endif
    bailoff
    WaitAnimFinishedOrBikeTrick
    goto bike_Airborne
endscript

script bike_ExitGrabTrick_flip 
    flip
    bike_ExitGrabTrick
endscript

script bike_ExitGrabTrick 
    vibrate \{ actuator = 0 percent = 0 }
    LaunchSubStateExitEvent \{ substate = Grab }
endscript

script bike_set_multiple_trick_text 
    switch <count>
        case 1
        name_text = <name>
        case 2
        FormatText textname = name_text 'double %n' n = <name>
        case 3
        FormatText textname = name_text 'triple %n' n = <name>
        default 
        FormatText textname = name_text '%n x %c' n = <name> c = <count>
    endswitch
    SetBikeTrickName name = <name_text>
endscript

script bike_ExitFlipTrick 
    LaunchSubStateExitEvent \{ substate = flip }
endscript

script bike_Land 
    getspeed
    LaunchStateChangeEvent state = Skater_OnGround
    ClearException Landed
    ClearTrickQueue
    if GotParam exit_tiretap
        BikeExitTireTap
    endif
    destroy_bike_manual_meter
    KillManualVibration
    if bailison
        printf 'bail: airtrick'
        goto bike_bail
    endif
    if DisplayPitchGreaterThan 100
        printf 'bail: display pitch'
        goto bike_bail
    endif
    if DisplayPitchGreaterThan 0
        cancelrotatedisplay
    endif
    if PitchGreaterThan 90
        printf 'bail: pitch'
        goto bike_bail
    endif
    if RollGreaterThan 50
        printf 'bail: roll'
        goto bike_bail
    endif
    if DoingFlip
        printf 'DOING A FLIP'
        goto bike_bail
    endif
    if speedgreaterthan 500
        if YawBetween (60.0, 120.0)
            printf 'bail: yaw'
            goto bike_bail
        endif
    endif
    GotoPreserveParams bike_land2
endscript

script bike_land2 RevertTime = 5
    bike_DoFakieCheck
    if landedfromvert
        overridecancelground
        obj_clearflag FLAG_SKATER_MANUALCHEESE
    endif
    if BikeInTireTap
        if GotParam nose
            EnterWheelieFromAir nose
            MakeSkaterGoto bike_manual params = { nose from_air tire_tap }
        else
            EnterWheelieFromAir
            MakeSkaterGoto bike_manual params = { from_air tire_tap }
        endif
    else
        if PitchGreaterThan 0
            if PitchingBackward
                if Held leftdown
                    EnterWheelieFromAir
                    MakeSkaterGoto bike_manual params = { from_air }
                endif
            else
                if PitchingForward
                    if Held leftup
                        EnterWheelieFromAir nose
                        MakeSkaterGoto bike_manual params = { nose from_air }
                    endif
                endif
            endif
        endif
    endif
    if NOT GotParam no_anim
        Skater_PlayBikeAnim anim = BMX_Land BlendPeriod = 0.1000
    endif
    SetException Ex = Ollied scr = bike_Ollie
    if backwards
        if NOT GotParam no_anim
            Skater_WaitAnimFinished
        endif
        MakeSkaterGoto bike_backwards_balance_trick
        return 
    endif
    OnExceptionRun LandSkaterTricks
    SetException Ex = RunHasEnded scr = EndOfRun
    SetException Ex = GoalHasEnded scr = Goal_EndOfRun
    ClearTrickQueue
    SetQueueTricks NoTricks
    SetManualTricks NoTricks
    LandSkaterTricks
    if NOT GotParam no_anim
        Skater_WaitAnimFinished
    endif
    goto bike_onground
endscript

script bike_DoFakieCheck 
    if NOT backwards
        return 
    endif
    if NOT currentscorepotgreaterthan \{ 0 }
        return 
    endif
    if NOT LandedFromTireTap
        if NOT landedfromvert
            if NOT landedfromspine
                return 
            endif
        endif
    endif
    SetTrickName \{ "to Fakie" }
    SetTrickScore \{ 0 }
    display \{ Blockspin }
    nollieon
endscript

script bike_wallplant Score = 750
    bailoff
    obj_clearflag FLAG_SKATER_MANUALCHEESE
    pressureoff
    nollieoff
    ClearException Ollied
    LaunchStateChangeEvent state = Skater_InWallplant
    vibrate actuator = 1 percent = 100 duration = 0.1000
    if GotParam left
        name = 'wall plant'
        wallplant_anim = BMX_TableTop_Init
        anim_backwards = 1
    else
        if GotParam RIGHT
            name = 'wall plant'
            wallplant_anim = BMX_TableTop_Init
            anim_backwards = 1
            flip
            unflip = 1
        else
            if backwards
                rotate
                wallplant_anim = BMX_WallPlant_Backwards
                name = 'tail tap'
            else
                name = 'wall plant'
                wallplant_anim = BMX_Wallplant
            endif
        endif
    endif
    if GotParam anim_backwards
        Skater_PlayBikeAnim anim = <wallplant_anim> Speed = 1.0 BlendPeriod = 0 backwards
    else
        Skater_PlayBikeAnim anim = <wallplant_anim> Speed = 1.0 BlendPeriod = 0
    endif
    if GotParam unflip
        FlipAfter
    endif
    SetTrickName <name>
    SetTrickScore <Score>
    display Blockspin
    SetTrickName ''
    SetTrickScore 0
    display SpinOnly
    ClearEventBuffer buttons = [ x ] olderthan = 0
    SetQueueTricks Bike_AirTricks
    begin 
    if Skater_AnimComplete
        break 
    endif
    DoNextTrick
    wait 1 gameframe
    repeat 
    goto bike_Airborne
endscript
bike_SkitchExceptionTable = [
    { event Ex = MadeOtherSkaterBail scr = MadeOtherSkaterBail_Called }
    { exception Ex = OffMeterTop scr = bike_SkitchOut }
    { exception Ex = OffMeterBottom scr = bike_SkitchOut }
    { exception Ex = CarBail scr = CarBail }
    { exception Ex = SkaterCollideBail scr = SkaterCollideBail }
]

script bike_skitch 
    stopbalancetrick
    goto bike_OnGroundAI
    resetlandedfromvert
    KillExtraTricks
    CancelRotateDisplayandUpdateMatrix
    OnExceptionRun
    ResetEventHandlersFromTable bike_SkitchExceptionTable
    SetException Ex = Ollied scr = bike_Ollie params = { <...>  }
    LaunchStateChangeEvent state = Skater_Skitching
    ClearTrickQueue
    SetQueueTricks NoTricks
    ClearManualTrick
    SetManualTricks NoTricks
    startskitch
    startbalancetrick
    Skater_Playanim anim = BMX_Grind_Init
    Skater_WaitAnimFinished
    playsound Hud_jumpgap
    SetTrickName '\c2Skitchin\c0'
    SetTrickScore 500
    display Blockspin
    dobalancetrick ButtonA = LeftRight ButtonB = LeftLeft type = skitch Tweak = 5
    Skater_Playanim anim = BMX_Grind_Idle Wobble
    begin 
    overridelimits max = 1750 friction = 0 time = 5 gravity = 0
    if Skater_AnimComplete
        Skater_Playanim anim = BMX_Grind_Idle Wobble norestart
    endif
    if Held down
        obj_spawnscriptlater NoBrake_Timer
        goto bike_SkitchOut
    endif
    WaitOneGameFrame
    repeat 
endscript

script bike_SkitchOut 
    stopskitch
    stopbalancetrick
    Skater_Playanim \{ anim = BMX_Grind_Out }
    OnGroundExceptions
    ClearException \{ Skitched }
    LandSkaterTricks
    Skater_WaitAnimFinished
    goto \{ bike_OnGroundAI }
endscript
