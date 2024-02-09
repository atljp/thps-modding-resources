Ped_StateLogic_UpdateTypes = {
    PEDMOTION_STAND
    PEDMOTION_NAVMESH
    PEDMOTION_WAYPOINT
    PEDMOTION_SKATER
    lip_trick_update
    PEDMOTION_BLOCKER
    chase_move_update
    gohome_move_update
}
Ped_StateLogic_DefaultStates = [
    { tag = sitting state = STATE_Sitting table = Ped_StateLogic_Table }
    { tag = Vending state = STATE_Vending table = Ped_StateLogic_Table }
    { tag = corner state = STATE_Corner table = Ped_StateLogic_Table }
    { tag = arcade state = STATE_Arcade table = Ped_StateLogic_Table }
    { tag = lookat state = STATE_LookAt table = Ped_StateLogic_Table }
    { tag = wait state = STATE_Wait table = Ped_StateLogic_Table }
    { tag = talk state = STATE_Talk table = Ped_StateLogic_Table }
    { tag = Chick state = STATE_Chick table = Ped_StateLogic_Table }
    { tag = skater state = STATE_skating table = SkaterPed_StateTable }
    { tag = stand state = STATE_standing table = Ped_StateLogic_Table }
]
Ped_StateLogic_EventHandlers = [
    { tag = GetAttention Hook_event = objectinattentionradius state = STATE_getattention scr = PedLogic_EventHandler }
    { tag = Blocker Hook_event = objectinattentionradius state = STATE_blockerwait scr = PedLogic_EventHandler }
    { tag = Blocker Hook_event = BlockerStand state = STATE_blockerStand scr = PedLogic_EventHandler }
    { tag = Blocker Hook_event = BlockerShuffle state = STATE_blockerShuffle scr = PedLogic_EventHandler }
    { tag = Blocker Hook_event = BlockerRun state = STATE_blockerRun scr = PedLogic_EventHandler }
    { tag = Blocker Hook_event = BlockerBumpPlayer state = STATE_blockerbump scr = PedLogic_EventHandler }
]
Ped_StateLogic_Table = {
    STATE_PASSIVE = { Navigation_mode = PEDMOTION_NAVMESH script_ped_state = STATESCRIPT_passive }
    STATE_PASSIVE_STAND = { Navigation_mode = PEDMOTION_STAND script_ped_state = STATESCRIPT_passive }
    STATE_DEFAULT = { script_ped_state = PedLogic_SetDefaultState }
    STATE_DELAY_waitanim = { script_ped_state = STATESCRIPT_DELAY_waitanim }
    STATE_walking = { Navigation_mode = PEDMOTION_WAYPOINT script_ped_state = STATESCRIPT_walking }
    STATE_walk_deadend = { Navigation_mode = PEDMOTION_STAND script_ped_state = STATESCRIPT_walk_deadend }
    STATE_standing = { Navigation_mode = PEDMOTION_STAND script_ped_state = STATESCRIPT_standidle }
    STATE_shot = { high_priority hide_boardgeom Navigation_mode = PEDMOTION_STAND script_ped_state = STATESCRIPT_shot }
    STATE_ProjectileInAvoidRadius = { high_priority hide_boardgeom Navigation_mode = PEDMOTION_STAND script_ped_state = STATESCRIPT_shot }
    STATE_whacked = { high_priority hide_boardgeom Navigation_mode = PEDMOTION_STAND script_ped_state = STATESCRIPT_whacked }
    STATE_WhackedMove = { high_priority Navigation_mode = PEDMOTION_STAND script_ped_state = STATESCRIPT_WhackedMove }
    STATE_fall = { high_priority hide_boardgeom Navigation_mode = PEDMOTION_STAND script_ped_state = STATESCRIPT_fall }
    autolaunch_cas_instrument = { hide_boardgeom Navigation_mode = PEDMOTION_STAND script_ped_state = STATESCRIPT_getup }
    STATE_disgust = { hide_boardgeom Navigation_mode = PEDMOTION_STAND script_ped_state = STATESCRIPT_disgust }
    STATE_knockdown = { hide_boardgeom Navigation_mode = PEDMOTION_STAND script_ped_state = STATESCRIPT_knockdown }
    STATE_BumpPlayer = { Navigation_mode = PEDMOTION_STAND script_ped_state = STATESCRIPT_BumpPlayer }
    STATE_avoidstop = { high_priority hide_boardgeom Navigation_mode = PEDMOTION_STAND script_ped_state = STATESCRIPT_avoidstop }
    STATE_avoidinit = { high_priority hide_boardgeom Navigation_mode = PEDMOTION_STAND script_ped_state = STATESCRIPT_avoidinit }
    STATE_avoidjump = { high_priority hide_boardgeom Navigation_mode = PEDMOTION_STAND script_ped_state = STATESCRIPT_avoidjump }
    STATE_avoidland = { high_priority hide_boardgeom Navigation_mode = PEDMOTION_STAND script_ped_state = STATESCRIPT_avoidland }
    STATE_avoidknockdown = { high_priority hide_boardgeom Navigation_mode = PEDMOTION_STAND script_ped_state = STATESCRIPT_avoidknockdown }
    STATE_trickpositive = { script_ped_state = STATESCRIPT_trickpositive }
    STATE_trickbail = { script_ped_state = STATESCRIPT_trickbail }
    STATE_getattention = { script_ped_state = STATESCRIPT_getattention exit_state_action = wait_anim_finished }
    STATE_ObjectInAttentionRadius = { script_ped_state = STATESCRIPT_getattention exit_state_action = wait_anim_finished }
    STATE_chase = { Navigation_mode = chase_move_update script_ped_state = STATESCRIPT_chase }
    STATE_chasepause = { Navigation_mode = chase_move_update script_ped_state = STATESCRIPT_chasepause }
    STATE_chasecatch = { script_ped_state = STATESCRIPT_chasecatch }
    STATE_gohome = { Navigation_mode = gohome_move_update script_ped_state = STATESCRIPT_gohome }
    STATE_Sitting = { Navigation_mode = PEDMOTION_STAND script_ped_state = STATESCRIPT_Sitting }
    STATE_Vending = { Navigation_mode = PEDMOTION_STAND script_ped_state = STATESCRIPT_Vending }
    STATE_Corner = { Navigation_mode = PEDMOTION_STAND script_ped_state = STATESCRIPT_Corner }
    STATE_Arcade = { Navigation_mode = PEDMOTION_STAND script_ped_state = STATESCRIPT_Arcade }
    STATE_LookAt = { Navigation_mode = PEDMOTION_STAND script_ped_state = STATESCRIPT_LookAt }
    STATE_Wait = { Navigation_mode = PEDMOTION_STAND script_ped_state = STATESCRIPT_Wait }
    STATE_Talk = { Navigation_mode = PEDMOTION_STAND script_ped_state = STATESCRIPT_Talk }
    STATE_Explode = { script_ped_state = STATESCRIPT_Explode }
    STATE_Leaning = { Navigation_mode = PEDMOTION_STAND script_ped_state = STATESCRIPT_Leaning }
}

script Ped_StateLogic_SetDefaultState 
    gettags
    if GotParam TempDefaultState
        Ped_SetLogicState <TempDefaultState> table = <TempDefaultTable>
        return 
    endif
    GetArraySize (Ped_StateLogic_DefaultStates)
    <index> = 0
    begin 
    if GotParam (Ped_StateLogic_DefaultStates [ <index> ].tag)
        <state> = (Ped_StateLogic_DefaultStates [ <index> ].state)
        <table> = (Ped_StateLogic_DefaultStates [ <index> ].table)
        Ped_SetLogicState <state> table = <table>
        return 
    endif
    <index> = (<index> + 1)
    repeat <array_size>
    Ped_SetLogicState STATE_walking table = Ped_StateLogic_Table
endscript

script STATESCRIPT_passive 
endscript

script STATESCRIPT_DELAY_waitanim 
    Ped_SetAnimCycleMode \{ Off }
    Ped_WaitAnimFinished
    if getsingletag \{ DelayedState }
        getsingletag \{ DelayedTable }
        Ped_SetLogicState <DelayedState> table = <DelayedTable>
        removetags \{tags = [ DelayedState DelayedTable ]}
        return 
    endif
    PedLogic_SetDefaultState
endscript

script STATESCRIPT_walking 
    PedLogic_GetAnimName \{ type = StandToWalk }
    Ped_PlayAnim anim = <AnimName>
    Ped_WaitAnimFinished
    PedLogic_GetAnimName \{ type = walk }
    Ped_PlayAnim anim = <AnimName> Cycle
endscript

script STATESCRIPT_walk_deadend 
    Ped_PlayAnim \{ anim = Ped_M_LookAtWatch }
    Ped_WaitAnimFinished
    PedLogic_RotateToSkater
    PedLogic_SetDefaultState
endscript

script STATESCRIPT_standidle 
    if NOT getsingletag should_look_at_skater
        <should_look_at_skater> = 0
    endif
    if (<should_look_at_skater> = 1)
        PedLogic_RotateToSkater
    endif
    begin 
    getrandomvalue {name = Speed resolution = 0.1000 a = 0.7500 b = 1.250}
    PedLogic_GetAnimName type = stand
    Ped_PlayAnim {
        tree = Ped_AnimBranch_LookAt
        anim = <AnimName>
        Speed = <Speed>
        lookat_params = igc_lookat_defaultanims
        lookat_target = skater
    }
    Ped_WaitAnimFinished
    PedLogic_GetAnimName type = stand index = 0
    Ped_PlayAnim {
        tree = Ped_AnimBranch_LookAt
        anim = <AnimName>
        Cycle
        lookat_params = igc_lookat_defaultanims
        lookat_target = skater
    }
    wait randomrange (3.0, 6.0) seconds
    Ped_SetAnimCycleMode Off
    Ped_WaitAnimFinished
    repeat 
endscript

script STATESCRIPT_shot 
    if GotParam IsBoardWhack
        Ped_SetLogicState STATE_WhackedMove
        return 
    endif
    Ped_Utils_PlayStream type = shot
    PedLogic_ClearAllEventHandlers
    Ped_ClearFlag PEDLOGIC_CAN_BE_SHOT
    PedLogic_GetAnimName type = FallDown
    Ped_PlayAnim anim = <AnimName>
    if GotParam index
        settags fallDownAnimIndex = <index>
    endif
    Ped_WaitAnimFinished
    obj_setouteravoidradius 10
    PedLogic_RegisterTempEventHandler {event = objectoutofavoidradius handler = autolaunch_cas_instrument}
    begin 
    wait Random (@ 10 @ 60 @ 90) frames
    if getsingletag fallDownAnimIndex
        PedLogic_GetAnimName type = LayIdle index = <fallDownAnimIndex>
    else
        PedLogic_GetAnimName type = LayIdle
    endif
    Ped_PlayAnim anim = <AnimName>
    Ped_WaitAnimFinished
    repeat 
endscript

script STATESCRIPT_WhackedMove 
    PedLogic_ClearAllEventHandlers
    Ped_ClearFlag PEDLOGIC_CAN_BE_SHOT
    PedLogic_GetAnimName type = WhackMove
    if NOT Ped_SelectAvoidPoint <AnimName>
        Ped_SetLogicState STATE_whacked table = Ped_StateLogic_Table
        return 
    endif
    index = 0
    if GotParam direction
        if (<direction> = 2)
            index = 1
        endif
        if (<direction> = 4 || <direction> = 0)
            index = 2
        endif
    endif
    settags fallDownAnimIndex = <index>
    begin 
    Ped_MoveTowardsAvoidPoint
    obj_sticktoground
    if Ped_AvoidPointReached
        break 
    endif
    wait 1 gameframe
    repeat 
    obj_setouteravoidradius 10
    PedLogic_RegisterTempEventHandler {event = objectoutofavoidradius handler = autolaunch_cas_instrument}
    RemoveParameter AnimName
    if getsingletag fallDownAnimIndex
        PedLogic_GetAnimName type = WhackMoveSet ReturnAll
        IdleToPlay = (<AnimName> [ <fallDownAnimIndex> ].idle)
    else
        PedLogic_GetAnimName type = LayIdle
        IdleToPlay = (<AnimName>)
    endif
    begin 
    wait Random (@ 10 @ 60 @ 90) frames
    Ped_PlayAnim anim = <IdleToPlay>
    Ped_WaitAnimFinished
    repeat 
endscript

script STATESCRIPT_whacked 
    PedLogic_ClearAllEventHandlers
    Ped_ClearFlag PEDLOGIC_CAN_BE_SHOT
    Ped_Utils_PlayStream type = Whacked
    PedLogic_GetAnimName type = WhackedSet
    Ped_PlayAnim anim = (<AnimName>.anim)
    if GotParam index
        settags fallDownAnimIndex = <index>
    endif
    Ped_WaitAnimFinished
    obj_setouteravoidradius 10
    PedLogic_RegisterTempEventHandler {event = objectoutofavoidradius handler = autolaunch_cas_instrument}
    begin 
    wait Random (@ 10 @ 60 @ 90) frames
    Ped_PlayAnim anim = (<AnimName>.idle)
    Ped_WaitAnimFinished
    repeat 
endscript

script STATESCRIPT_fall 
    if SkaterSpeedLessThan 1
        begin 
        Random (
            @*3 PedLogic_GetAnimName type = idle
            @ PedLogic_GetAnimName type = Disgust
        )
        Ped_PlayAnim anim = <AnimName>
        Ped_WaitAnimFinished
        obj_getdistancetoobject skater
        if (<objectdistance> < 3.0)
            break 
        endif
        if (<objectdistance> > 4.0)
            Ped_SetFlag PEDLOGIC_RESET_EVENT_HANDLERS
            PedLogic_SetDefaultState
            return 
        endif
        repeat 
    endif
    if GotParam colobjid
        <colobjid> ::obj_gettype
        if (<ObjType> = object_type_skater)
            <colobjid> ::vibrate port = 0 actuator = 1 percent = 100 duration = 0.1500
        endif
    endif
    getsingletag pissed
    <pissed> = (<pissed> + 1)
    if (<pissed> > 3)
        settags pissed = <pissed>
        Ped_SetLogicState STATE_knockdown table = Ped_StateLogic_Table
    endif
    Temp_Ped_Fall_Sound
    Ped_Utils_PlayStream type = avoid
    PedLogic_GetAnimName type = FallDown
    Ped_PlayAnim anim = <AnimName>
    if GotParam index
        settags fallDownAnimIndex = <index>
    endif
    Ped_WaitAnimFinished
    obj_setouteravoidradius 10
    PedLogic_RegisterTempEventHandler {event = objectoutofavoidradius handler = autolaunch_cas_instrument}
    begin 
    wait Random (@ 10 @ 60 @ 90) frames
    if getsingletag fallDownAnimIndex
        PedLogic_GetAnimName type = LayIdle index = <fallDownAnimIndex>
    else
        PedLogic_GetAnimName type = LayIdle
    endif
    Ped_PlayAnim anim = <AnimName>
    Ped_WaitAnimFinished
    repeat 
endscript

script STATESCRIPT_getup 
    <type> = Getup
    Ped_GetLastLogicState
    switch (<LastLogicState>)
        case STATE_whacked
        PedLogic_GetAnimName type = WhackedSet ReturnAll
        if getsingletag fallDownAnimIndex
            Ped_PlayAnim anim = (<AnimName> [ <fallDownAnimIndex> ].OutAnim)
        else
            Ped_PlayAnim anim = (<AnimName> [ 0 ].OutAnim)
        endif
        case STATE_WhackedMove
        PedLogic_GetAnimName type = WhackMoveSet ReturnAll
        if getsingletag fallDownAnimIndex
            Ped_PlayAnim anim = (<AnimName> [ <fallDownAnimIndex> ].OutAnim)
        else
            Ped_PlayAnim anim = (<AnimName> [ 0 ].OutAnim)
        endif
        default 
        PedLogic_GetAnimName type = Getup ReturnAll
        if getsingletag fallDownAnimIndex
            Ped_PlayAnim anim = (<AnimName> [ <fallDownAnimIndex> ])
        else
            Ped_PlayAnim anim = (<AnimName> [ 0 ])
        endif
    endswitch
    Ped_WaitAnimFinished
    Ped_SetLogicState STATE_disgust table = Ped_StateLogic_Table
endscript

script STATESCRIPT_disgust 
    getsingletag \{ should_look_at_skater }
    if (<should_look_at_skater> = 1)
        PedLogic_RotateToSkater
    endif
    PedLogic_GetAnimName \{ type = Disgust }
    Ped_PlayAnim anim = <AnimName>
    Ped_WaitAnimFinished
    PedLogic_InitMovement
    Ped_SetFlag \{ PEDLOGIC_RESET_EVENT_HANDLERS }
    PedLogic_SetDefaultState
endscript

script STATESCRIPT_knockdown 
    if skater ::IsSkaterOnBike
        Ped_SetLogicState \{ STATE_disgust table = Ped_StateLogic_Table }
        return 
    endif
    Obj_LookAtObject \{ type = skater time = 0.05000 }
    PedLogic_GetAnimName \{ type = attack }
    Ped_PlayAnim anim = <AnimName>
    wait \{ 10 gameframes }
    if GoalManager_CanStartGoal
        Ped_Utils_GetVectorToPlayer
        MakeSkaterGoto PedKnockDown params = {SetVelDir = <VecToPlayer> SetVelSpeed = 350}
    endif
    Ped_WaitAnimFinished
    PedLogic_RotateToSkater
    Ped_SetLogicState \{ STATE_disgust table = Ped_StateLogic_Table }
endscript

script STATESCRIPT_BumpPlayer 
    goal_pro_bounce_skater
    if GotParam \{ did_bounce_skater }
        if (did_bounce_skater = 0)
            Ped_SetLogicState \{ STATE_fall }
            return 
        endif
    endif
    wait \{ 10 gameframes }
    PedLogic_SetDefaultState
endscript

script STATESCRIPT_avoidstop 
    obj_setinneravoidradius 4
    PedLogic_RegisterTempEventHandler {event = objectinavoidradius handler = STATE_avoidinit}
    PedLogic_GetAnimName type = stand
    Ped_PlayAnim anim = <AnimName> Cycle
    wait 1 gameframe
    getsingletag should_look_at_skater
    if (<should_look_at_skater> = 0)
        PedLogic_SetDefaultState
        return 
    endif
    begin 
    PedLogic_RotateToSkater
    Random (
        @*3 PedLogic_GetAnimName type = idle
        @ PedLogic_GetAnimName type = Wave
    )
    Ped_PlayAnim anim = <AnimName>
    Ped_WaitAnimFinished
    obj_getdistancetoobject skater
    if (<objectdistance> > 12.0)
        PedLogic_InitMovement
        Ped_SetFlag PEDLOGIC_RESET_EVENT_HANDLERS
        PedLogic_SetDefaultState
        return 
    endif
    wait 1 second
    repeat 
endscript

script STATESCRIPT_avoidinit 
    ClearEventHandler \{ objectinattentionradius }
    settags \{ pissed = 0 }
    Ped_RememberNextWaypoint
    Ped_RememberCurrentPosition
    obj_storepos
    Ped_RememberStickToGround
    Ped_SetLogicState \{ STATE_avoidjump }
endscript

script STATESCRIPT_avoidjump 
    getsingletag \{ pissed }
    settags pissed = (<pissed> + 1)
    PedLogic_GetAnimName \{ type = avoid }
    if NOT Ped_SelectAvoidPoint <AnimName>
        getsingletag \{ Navigation_mode }
        if NOT (<Navigation_mode> = PEDMOTION_STAND)
            Ped_SetLogicState \{ STATE_avoidknockdown table = Ped_StateLogic_Table }
        endif
    endif
    Ped_Utils_PlayStream \{ type = avoid }
    begin 
    Ped_MoveTowardsAvoidPoint
    obj_sticktoground
    if Ped_AvoidPointReached
        break 
    endif
    wait \{ 1 gameframe }
    repeat 
    Ped_SetLogicState \{ STATE_avoidland }
endscript

script STATESCRIPT_avoidland 
    <maxPissedCount> = randomrange (2.0, 4.0)
    getsingletag pissed
    if (<pissed> > <maxPissedCount>)
        obj_setinneravoidradius 4
        PedLogic_RegisterTempEventHandler {event = objectinavoidradius handler = STATE_avoidknockdown}
    else
        obj_setinneravoidradius 4
        PedLogic_RegisterTempEventHandler {event = objectinavoidradius handler = STATE_avoidjump}
    endif
    if SkaterSpeedLessThan 1
        <stopped> = 1
    else
        <stopped> = 0
    endif
    getsingletag Navigation_mode
    begin 
    obj_getdistancetoobject skater
    if (<objectdistance> > 6.0)
        <stopped> = 0
        break 
    endif
    if (<stopped> = 1)
        PedLogic_RotateToSkater
        Random (
            @*2 PedLogic_GetAnimName type = idle
            @ PedLogic_GetAnimName type = Disgust
        )
        Ped_PlayAnim anim = <AnimName>
    endif
    wait 1 gameframe
    repeat 
    begin 
    obj_getdistancetoobject skater
    if (<objectdistance> > 20.0)
        break 
    endif
    wait 1 gameframe
    repeat 
    PedLogic_InitMovement
    Ped_RestoreStickToGround
    Ped_SetFlag PEDLOGIC_RESET_EVENT_HANDLERS
    PedLogic_SetDefaultState
endscript

script STATESCRIPT_avoidknockdown 
    if skater ::IsSkaterOnBike
        Ped_SetLogicState STATE_disgust table = Ped_StateLogic_Table
        return 
    endif
    PedLogic_RotateToSkater
    PedLogic_GetAnimName type = attack
    Ped_PlayAnim anim = <AnimName>
    wait 10 gameframes
    obj_getorientationtoobject skater
    if (<dotprod> < 0.5000)
        if (<dotprod> > -0.5000)
            obj_getdistancetoobject skater
            if (<objectdistance> < 4.0)
                Ped_Utils_GetVectorToPlayer
                MakeSkaterGoto PedKnockDown params = {SetVelDir = <VecToPlayer> SetVelSpeed = 350}
                Ped_WaitAnimFinished
            endif
        endif
    endif
    PedLogic_InitMovement
    Ped_RestoreStickToGround
    PedLogic_GetAnimName type = stand
    Ped_PlayAnim anim = <AnimName> Cycle
    wait 1 second
    Ped_SetLogicState STATE_disgust table = Ped_StateLogic_Table
endscript

script STATESCRIPT_getattention 
    seteventhandler {
        Ex = SkaterLanded
        scr = Ped_TrickPos_EventHandler
    }
    seteventhandler {
        Ex = SkaterBailed
        scr = Ped_TrickBail_EventHandler
    }
    begin 
    if NOT obj_objectinattentionradius
        Ped_SetFlag PEDLOGIC_RESET_EVENT_HANDLERS
        PedLogic_SetDefaultState
        return 
    endif
    if getsingletag should_look_at_skater
        if (<should_look_at_skater> = 1)
            PedLogic_RotateToSkater
        endif
    endif
    Ped_Utils_PlayStream type = far
    PedLogic_GetAnimName type = GetAttention
    Ped_PlayAnim {
        tree = Ped_AnimBranch_LookAt
        anim = <AnimName>
        lookat_params = igc_lookat_defaultanims
        lookat_target = skater
    }
    Ped_WaitAnimFinished
    begin 
    PedLogic_GetAnimName type = idle
    Ped_PlayAnim {
        tree = Ped_AnimBranch_LookAt
        anim = <AnimName>
        lookat_params = igc_lookat_defaultanims
        lookat_target = skater
    }
    Ped_WaitAnimFinished
    repeat randomrange (1.0, 3.0)
    repeat 
endscript

script STATESCRIPT_trickpositive 
    if obj_objectinattentionradius
        Ped_Utils_PlayStream \{ type = trickpositive }
        PedLogic_RotateToSkater
        getrandomvalue \{ name = RepeatCount a = 4 b = 10 integer }
        begin 
        Obj_LookAtObject \{ type = skater time = 0.3000 }
        Obj_WaitRotate
        PedLogic_GetAnimName \{ type = impressed }
        Ped_PlayAnim anim = <AnimName>
        Ped_WaitAnimFinished
        repeat <RepeatCount>
    endif
    PedLogic_ResetEventHandlers
    PedLogic_SetDefaultState
endscript

script STATESCRIPT_trickbail 
    if obj_objectinattentionradius
        Ped_Utils_PlayStream \{ type = trickbail }
        PedLogic_RotateToSkater
        PedLogic_GetAnimName \{ type = Disgust }
        Ped_PlayAnim anim = <AnimName>
        Ped_WaitAnimFinished
    endif
    PedLogic_ResetEventHandlers
    PedLogic_SetDefaultState
endscript

script Ped_TrickPos_EventHandler 
    if SkaterLastScoreLandedGreaterThan \{ ped_min_notice_TrickScore }
        if (randomrange (0.0, 100.0) > -1)
            Ped_SetLogicState \{ STATE_trickpositive }
            return 
        endif
    endif
    seteventhandler \{ Ex = SkaterLanded scr = Ped_TrickPos_EventHandler }
endscript

script Ped_TrickBail_EventHandler 
    if (randomrange (0.0, 100.0) > -1)
        Ped_SetLogicState \{ STATE_trickbail }
        return 
    endif
    seteventhandler \{ Ex = SkaterBailed scr = Ped_TrickBail_EventHandler }
endscript

script STATESCRIPT_chase 
    PedLogic_GetAnimName \{ type = run }
    Ped_PlayAnim anim = <AnimName> Cycle
endscript

script STATESCRIPT_chasepause 
    begin 
    PedLogic_GetAnimName \{ type = stand index = 0 }
    getrandomvalue \{ name = RepeatCount a = 1 b = 3 integer }
    begin 
    PedLogic_RotateToSkater
    Ped_PlayAnim anim = <AnimName>
    Ped_WaitAnimFinished
    repeat <RepeatCount>
    PedLogic_RotateToSkater
    PedLogic_GetAnimName \{ type = Disgust }
    Ped_PlayAnim anim = <AnimName>
    Ped_WaitAnimFinished
    repeat 
endscript

script STATESCRIPT_chasecatch 
    PedLogic_GetAnimName \{ type = attack }
    Ped_PlayAnim anim = <AnimName>
    if getsingletag \{ CatchScript }
        goto <CatchScript>
    else
        wait \{ 3 seconds }
        Ped_SetLogicState \{ STATE_chase }
    endif
endscript

script STATESCRIPT_gohome 
    PedLogic_RegisterTempDefaultState \{ state = STATE_gohome table = Ped_StateLogic_Table }
    PedLogic_GetAnimName \{ type = walk }
    Ped_PlayAnim anim = <AnimName> Cycle UseAnimTags
endscript

script PEDAI_Sitting_StopWayPoint 
    Ped_StopMoving
    Ped_GetCurrentNodeNames
    obj_movetonode name = <node_from> Speed = 5 mph
    Obj_WaitMove
    Ped_StartMoving
    Ped_SetLogicState \{ STATE_Sitting table = Ped_StateLogic_Table }
endscript

script STATESCRIPT_Sitting 
    printf 'SITTING'
    Ped_TurnToCurrentWaypointOrientation time = 0.7500
    PedLogic_GetAnimName type = Turn
    Ped_PlayAnim anim = <AnimName> Cycle
    Obj_WaitRotate
    Ped_PlayAnim anim = PED_STND2SIT
    Ped_WaitAnimFinished
    begin 
    getrandomvalue name = RepeatCount a = 5 b = 15 resolution = 10 integer
    Random (
        @ getrandomvalue name = RepeatIdle a = 5 b = 50 resolution = 45 integer
        Obj_CycleAnim anim = PED_SIT_Idle numCycles = <ReapeatIdle>
        @ Ped_PlayAnim anim = PED_SIT_Tap
        @ Ped_PlayAnim anim = PED_SIT_LookR
        @ Ped_PlayAnim anim = PED_SIT_LookL
        @ Ped_PlayAnim anim = PED_SIT2SITB
        Ped_WaitAnimFinished
        begin 
        Random (
            @ getrandomvalue name = RepeatIdleB a = 2 b = 10 resolution = 8 integer
            Obj_CycleAnim anim = PED_SITB_Idle numCycles = <ReapeatIdleB>
            @ Ped_PlayAnim anim = PED_SITB_LookL
            @ Ped_PlayAnim anim = PED_SITB_LookR
        )
        Ped_WaitAnimFinished
        repeat 5
        Ped_PlayAnim anim = PED_SITB2SITBL
        Ped_WaitAnimFinished
        begin 
        Random (
            @ getrandomvalue name = RepeatIdleBL a = 2 b = 10 resolution = 8 integer
            Obj_CycleAnim anim = PED_SITBL_Idle numCycles = <ReapeatIdleBL>
            @ Ped_PlayAnim anim = PED_SITBL_LookL
            @ Ped_PlayAnim anim = PED_SITBL_Shake
            @ Ped_PlayAnim anim = PED_SITBL_Shake
            @ Ped_PlayAnim anim = PED_SITBL_Tap
        )
        Ped_WaitAnimFinished
        repeat 5
        Ped_PlayAnim anim = PED_SITBL2SIT
    )
    Ped_WaitAnimFinished
    repeat <RepeatCount>
    Ped_PlayAnim anim = PED_SIT2STND
    Ped_WaitAnimFinished
    PedLogic_SetDefaultState
endscript

script PEDAI_Vending_StopWayPoint 
    Ped_StopMoving
    Ped_GetCurrentNodeNames
    obj_movetonode name = <node_from> Speed = 5 mph
    Obj_WaitMove
    Ped_StartMoving
    Ped_SetLogicState \{ STATE_Vending table = Ped_StateLogic_Table }
endscript

script STATESCRIPT_Vending 
    Ped_GetGender
    Ped_TurnToCurrentWaypointOrientation time = 0.7500
    if (<gender> = Male)
        Ped_PlayAnim anim = Ped_M_Walk1ToIdle
        Ped_WaitAnimFinished
        Ped_PlayAnim anim = Ped_M_IdletoATM
        Ped_WaitAnimFinished
        begin 
        Random (
            @ Ped_PlayAnim anim = Ped_M_ATM1
            @ Ped_PlayAnim anim = Ped_M_ATM2
        )
        Ped_WaitAnimFinished
        repeat 5
        Ped_PlayAnim anim = Ped_M_ATMtoIdle
        Ped_WaitAnimFinished
        Ped_PlayAnim anim = Ped_M_Walk1FromIdle
        Ped_WaitAnimFinished
    else
        PEDAI_Female_StopWayPoint
    endif
    PedLogic_SetDefaultState
endscript

script PEDAI_Corner_StopWayPoint 
    Ped_StopMoving
    Ped_GetCurrentNodeNames
    obj_movetonode name = <node_from> Speed = 5 mph
    Obj_WaitMove
    Ped_StartMoving
    Ped_SetLogicState \{ STATE_Corner table = Ped_StateLogic_Table }
endscript

script STATESCRIPT_Corner 
    Ped_TurnToCurrentWaypointOrientation \{ time = 0.7500 }
    Ped_GetGender
    if (<gender> = Male)
        begin 
        Ped_PlayAnim \{ anim = Ped_M_LookLeftDown }
        Ped_WaitAnimFinished
        Ped_PlayAnim \{ anim = Ped_M_Lookright }
        Ped_WaitAnimFinished
        repeat 2
    else
        PEDAI_Female_StopWayPoint
    endif
    PedLogic_SetDefaultState
endscript

script PEDAI_Arcade_StopWayPoint 
    Ped_StopMoving
    Ped_GetCurrentNodeNames
    obj_movetonode name = <node_from> Speed = 5 mph
    Obj_WaitMove
    Ped_StartMoving
    Ped_SetLogicState \{ STATE_Arcade table = Ped_StateLogic_Table }
endscript

script STATESCRIPT_Arcade 
    Ped_GetGender
    Ped_TurnToCurrentWaypointOrientation time = 0.7500
    if (<gender> = Male)
        Ped_PlayAnim anim = Ped_M_Walk1ToIdle
        Ped_WaitAnimFinished
        Ped_PlayAnim anim = Ped_M_Idle1toArcade
        Ped_WaitAnimFinished
        begin 
        Random (
            @ Ped_PlayAnim anim = Ped_M_ArcadeIdle
            @ Ped_PlayAnim anim = Ped_M_Arcade1
            @ Ped_PlayAnim anim = Ped_M_Arcade2
        )
        Ped_WaitAnimFinished
        repeat 5
        Ped_PlayAnim anim = Ped_M_ArcadetoIdle
        Ped_WaitAnimFinished
        Ped_PlayAnim anim = Ped_M_Walk1FromIdle
        Ped_WaitAnimFinished
        PedLogic_SetDefaultState
    else
        PEDAI_Female_StopWayPoint
    endif
endscript

script PEDAI_LookAt_StopWayPoint 
    Ped_StopMoving
    Ped_GetCurrentNodeNames
    obj_movetonode name = <node_from> Speed = 5 mph
    Obj_WaitMove
    Ped_StartMoving
    Ped_SetLogicState \{ STATE_LookAt table = Ped_StateLogic_Table }
endscript

script STATESCRIPT_LookAt 
    Ped_GetGender
    Ped_TurnToCurrentWaypointOrientation time = 0.7500
    if (<gender> = Male)
        Ped_PlayAnim anim = Ped_M_Walk1ToIdle
        Ped_WaitAnimFinished
        Ped_PlayAnim anim = Ped_M_IdletoObserve
        Ped_WaitAnimFinished
        begin 
        Random (
            @ Ped_PlayAnim anim = Ped_M_ObserveIdle
            @ Ped_PlayAnim anim = Ped_M_ObserveScratch
            @ Ped_PlayAnim anim = Ped_M_ObserveWipe
            @ Ped_PlayAnim anim = Ped_M_Observe02
        )
        Ped_WaitAnimFinished
        repeat 5
        Ped_PlayAnim anim = Ped_M_ObservetoIdle
        Ped_WaitAnimFinished
        Ped_PlayAnim anim = Ped_M_Walk1FromIdle
        Ped_WaitAnimFinished
    else
        PEDAI_Female_StopWayPoint
    endif
    PedLogic_SetDefaultState
endscript

script PEDAI_Wait_StopWayPoint 
    Ped_StopMoving
    Ped_GetCurrentNodeNames
    obj_movetonode name = <node_from> Speed = 5 mph
    Obj_WaitMove
    Ped_StartMoving
    Ped_SetLogicState \{ STATE_Wait table = Ped_StateLogic_Table }
endscript

script STATESCRIPT_Wait 
    Ped_GetGender
    Ped_TurnToCurrentWaypointOrientation \{ time = 0.7500 }
    if (<gender> = Male)
        Ped_PlayAnim \{ anim = Ped_M_Walk1ToIdle }
        Ped_WaitAnimFinished
        begin 
        Random (
            @ Ped_PlayAnim \{ anim = Ped_M_LookAtWatch }
            @ Ped_PlayAnim \{ anim = Ped_M_LookAtWatch2 }
        )
        Ped_WaitAnimFinished
        repeat 5
        Ped_PlayAnim \{ anim = Ped_M_Walk1FromIdle }
        Ped_WaitAnimFinished
    else
        PEDAI_Female_StopWayPoint
    endif
    PedLogic_SetDefaultState
endscript

script PEDAI_TALK_StopWayPoint 
    Ped_StopMoving
    Ped_GetCurrentNodeNames
    obj_movetonode name = <node_from> Speed = 5 mph
    Obj_WaitMove
    Ped_StartMoving
    Ped_SetLogicState \{ STATE_Talk table = Ped_StateLogic_Table }
endscript

script STATESCRIPT_Talk 
    printf 'Talk'
    Ped_TurnToCurrentWaypointOrientation time = 0.7500
    begin 
    Random (
        @ Ped_PlayAnim anim = Ped_M_Talk2_Idle
        @ Ped_PlayAnim anim = Ped_M_Talk2_Idle2
        @ Ped_PlayAnim anim = Ped_M_Talk2_RightHere
        @ Ped_PlayAnim anim = Ped_M_Talk2_MixIt
        @ Ped_PlayAnim anim = Ped_M_Talk2_SureThing
        @ Ped_PlayAnim anim = Ped_M_Talk2_Maybe
        @ Ped_PlayAnim anim = Ped_M_Talk2_WhatDoYouThink
        @ Ped_PlayAnim anim = Ped_M_Talk2_OfCourse
        @ Ped_PlayAnim anim = Ped_M_Talk2_BackThere
        @ Ped_PlayAnim anim = Ped_M_Talk2_RoundAndRound
        @ Ped_PlayAnim anim = Ped_M_Talk2_UpAbove
        @ Ped_PlayAnim anim = Ped_M_Talk2_KnowWhatIMean
        @ Ped_PlayAnim anim = Ped_M_Talk2_GoAhead
        @ Ped_PlayAnim anim = Ped_M_Talk2_TheyllTellYou
    )
    Ped_WaitAnimFinished
    repeat 
endscript

script PEDAI_Female_StopWayPoint 
    Ped_PlayAnim \{ anim = Ped_F_WalkToIdle1 }
    Ped_WaitAnimFinished
    begin 
    Random (
        @ Ped_PlayAnim \{ anim = Ped_F_Idle1 }
        @ Ped_PlayAnim \{ anim = Ped_F_Idle1ToIdle2 }
        Ped_WaitAnimFinished
        begin 
        Ped_PlayAnim \{ anim = Ped_F_Idle2 }
        Ped_WaitAnimFinished
        repeat 3
        Ped_PlayAnim \{ anim = Ped_F_Idle2ToIdle1 }
    )
    Ped_WaitAnimFinished
    repeat 5
    Ped_PlayAnim \{ anim = Ped_F_WalkFromIdle1 }
    Ped_WaitAnimFinished
    PedLogic_SetDefaultState
endscript

script STATESCRIPT_Explode 
    if LevelIs load_NO
        Zombie_SFX_Die
    endif
    broadcastevent type = Zombie_Explode
    Ped_PlayAnim anim = default
    dismember bone = Bone_Head maxVel = 50 maxrotvel = 2
    CreateFlexibleParticleSystem name = ZombieFlareUp params_script = JEG_Zombie_FlareUp_particle_params
    CreateFlexibleParticleSystem name = ZombieBurst params_script = JEG_Zombie_burst_particle_params
    wait 2 gameframes
    dismember bone = Bone_Knee_R maxVel = 40 maxrotvel = 6
    dismember bone = Bone_Knee_L maxVel = 50 maxrotvel = 5
    dismember bone = Bone_Forearm_R maxVel = 30 maxrotvel = 4
    dismember bone = Bone_Forearm_L maxVel = 50 maxrotvel = 3
    wait 1 gameframes
    dismember bone = Bone_Bicep_R maxVel = 40 maxrotvel = 6
    dismember bone = Bone_Bicep_L maxVel = 50 maxrotvel = 5
    dismember bone = Bone_Thigh_R maxVel = 30 maxrotvel = 4
    dismember bone = Bone_Thigh_L maxVel = 50 maxrotvel = 3
    wait 1 gameframes
    dismember bone = Bone_Pelvis
    wait 180 gameframes
    DestroyFlexibleParticleSystem name = ZombieFlareUp
    DestroyFlexibleParticleSystem name = ZombieBurst
    obj_getid
    <ObjID> ::Die
endscript

script PEDAI_Leaning_StopWayPoint 
    Ped_StopMoving
    Ped_GetCurrentNodeNames
    obj_movetonode name = <node_from> Speed = 5 mph
    Obj_WaitMove
    Ped_StartMoving
    Ped_SetLogicState \{ STATE_Leaning table = Ped_StateLogic_Table }
endscript

script STATESCRIPT_Leaning 
    printf 'LEANING'
    Ped_TurnToCurrentWaypointOrientation time = 0.7500
    PedLogic_GetAnimName type = Turn
    Ped_PlayAnim anim = <AnimName> Cycle
    Obj_WaitRotate
    Ped_PlayAnim anim = Ped_Lean_01
    Ped_WaitAnimFinished
    begin 
    Random (
        @ ) Ped_PlayAnim anim = Ped_LeanIdle_01
    Ped_WaitAnimFinished
    Ped_PlayAnim anim = Ped_LeanIdle_01
    Ped_WaitAnimFinished
    Ped_PlayAnim anim = Ped_LeanIdle_01
    
    Ped_WaitAnimFinished
    repeat <RepeatCount>
    Ped_PlayAnim anim = Ped_Lean_02
    Ped_WaitAnimFinished
    PedLogic_SetDefaultState
endscript
