

script PED_DEBUGEVENT 
    if (DEBUG_PEDLOGIC = 1)
        Obj_GetID
        if (DEBUG_PED_OBJID = 0 || DEBUG_PED_OBJID = <objID>)
            printf ''
            printf '~~ EventHandler() for ID=%i' i = <objID>
            if GotParam params
                printf '~~~~~~ Event Params:'
                printstruct <params>
            endif
            printf '~~ EventHandler() end'
        endif
    endif
endscript

Ped_StateLogic_UpdateTypes = {
    no_move_update
    generic_move_update
    skater_move_update
    lip_trick_update
    blocker_move_update
    chase_move_update
    gohome_move_update
}
Ped_StateLogic_ExitActions = { 
wait_anim_finished
 }
Ped_StateLogic_DefaultStates = [
    {Tag = Sitting State = STATE_Sitting Table = Ped_StateLogic_Table}
    {Tag = Vending State = STATE_Vending Table = Ped_StateLogic_Table}
    {Tag = Corner State = STATE_Corner Table = Ped_StateLogic_Table}
    {Tag = Arcade State = STATE_Arcade Table = Ped_StateLogic_Table}
    {Tag = LookAt State = STATE_LookAt Table = Ped_StateLogic_Table}
    {Tag = Wait State = STATE_Wait Table = Ped_StateLogic_Table}
    {Tag = Talk State = STATE_Talk Table = Ped_StateLogic_Table}
    {Tag = Chick State = STATE_Chick Table = Ped_StateLogic_Table}
    {Tag = skater State = STATE_skating Table = SkaterPed_StateTable}
    {Tag = stand State = STATE_standing Table = Ped_StateLogic_Table}
]
Ped_StateLogic_CollisionTypes = [
    {Tag = avoid Set_mode = avoid}
    {Tag = fall Set_mode = fall}
    {Tag = shot Set_mode = shot}
    {Tag = knock Set_mode = knock}
    {Tag = bump Set_mode = bump}
    {Tag = ignore Set_mode = ignore}
]
Ped_StateLogic_EventHandlers = [
    {Tag = GetAttention Hook_event = ObjectInAttentionRadius State = STATE_getattention Scr = Ped_Utils_EventHandler}
    {Tag = Blocker Hook_event = ObjectInAttentionRadius State = STATE_blockerwait Scr = Ped_Utils_EventHandler}
    {Tag = Blocker Hook_event = BlockerStand State = STATE_blockerstand Scr = Ped_Utils_EventHandler}
    {Tag = Blocker Hook_event = BlockerShuffle State = STATE_blockershuffle Scr = Ped_Utils_EventHandler}
    {Tag = Blocker Hook_event = BlockerRun State = STATE_blockerrun Scr = Ped_Utils_EventHandler}
    {Tag = Blocker Hook_event = BlockerBumpPlayer State = STATE_blockerbump Scr = Ped_Utils_EventHandler}
]
Ped_StateLogic_Table = {
    STATE_DEFAULT = {
        script_ped_state = Ped_StateLogic_SetDefaultState
    }
    STATE_RESET_EVENTS = {
        script_ped_state = ped_return_to_precollision_state
    }
    STATE_DELAY_waitanim = {
        script_ped_state = STATECONTROL_DELAY_waitanim
    }
    STATE_walking = {
        ped_update_type = generic_move_update
        script_ped_state = STATECONTROL_walking
    }
    STATE_standing = {
        ped_update_type = no_move_update
        script_ped_state = STATECONTROL_standidle
    }
    STATE_Chick = {
        ped_update_type = no_move_update
        script_ped_state = STATECONTROL_chick
    }
    STATE_shot = {
        high_priority
        hide_boardgeom
        script_ped_state = STATECONTROL_shot
    }
    STATE_fall = {
        high_priority
        hide_boardgeom
        script_ped_state = STATECONTROL_fall
    }
    STATE_getup = {
        hide_boardgeom
        script_ped_state = STATECONTROL_getup
    }
    STATE_disgust = {
        hide_boardgeom
        script_ped_state = STATECONTROL_disgust
    }
    STATE_knockdown = {
        hide_boardgeom
        script_ped_state = STATECONTROL_knockdown
    }
    STATE_avoidstop = {
        high_priority
        hide_boardgeom
        script_ped_state = STATECONTROL_avoidstop
    }
    STATE_avoidinit = {
        high_priority
        hide_boardgeom
        script_ped_state = STATECONTROL_avoidinit
    }
    STATE_avoidjump = {
        high_priority
        hide_boardgeom
        script_ped_state = STATECONTROL_avoidjump
    }
    STATE_avoidland = {
        high_priority
        hide_boardgeom
        script_ped_state = STATECONTROL_avoidland
    }
    STATE_avoidknockdown = {
        high_priority
        hide_boardgeom
        script_ped_state = STATECONTROL_avoidknockdown
    }
    STATE_trickpositive = {
        script_ped_state = STATECONTROL_trickpositive
    }
    STATE_trickbail = {
        script_ped_state = STATECONTROL_trickbail
    }
    STATE_getattention = {
        script_ped_state = STATECONTROL_getattention
        exit_state_action = wait_anim_finished
    }
    STATE_blockerwait = {
        ped_update_type = blocker_move_update
        script_ped_state = STATECONTROL_blockerwait
    }
    STATE_blockerstand = {
        ped_update_type = blocker_move_update
        script_ped_state = STATECONTROL_blockerstand
    }
    STATE_blockershuffle = {
        ped_update_type = blocker_move_update
        script_ped_state = STATECONTROL_blockershuffle
    }
    STATE_blockerrun = {
        ped_update_type = blocker_move_update
        script_ped_state = STATECONTROL_blockerrun
    }
    STATE_blockerbump = {
        script_ped_state = STATECONTROL_blockerbump
    }
    STATE_chase = {
        ped_update_type = chase_move_update
        script_ped_state = STATECONTROL_chase
    }
    STATE_chasepause = {
        ped_update_type = chase_move_update
        script_ped_state = STATECONTROL_chasepause
    }
    STATE_chasecatch = {
        script_ped_state = STATECONTROL_chasecatch
    }
    STATE_gohome = {
        ped_update_type = gohome_move_update
        script_ped_state = STATECONTROL_gohome
    }
    STATE_Sitting = {
        ped_update_type = no_move_update
        script_ped_state = STATECONTROL_Sitting
    }
    STATE_Vending = {
        ped_update_type = no_move_update
        script_ped_state = STATECONTROL_Vending
    }
    STATE_Corner = {
        ped_update_type = no_move_update
        script_ped_state = STATECONTROL_Corner
    }
    STATE_Arcade = {
        ped_update_type = no_move_update
        script_ped_state = STATECONTROL_Arcade
    }
    STATE_LookAt = {
        ped_update_type = no_move_update
        script_ped_state = STATECONTROL_LookAt
    }
    STATE_Wait = {
        ped_update_type = no_move_update
        script_ped_state = STATECONTROL_Wait
    }
    STATE_Talk = {
        ped_update_type = no_move_update
        script_ped_state = STATECONTROL_Talk
    }
    STATE_Explode = {
        script_ped_state = STATECONTROL_Explode
    }
}

script Ped_StateLogic_SetDefaultState 
    GetTags
    if GotParam TempDefaultState
        Ped_SetLogicState <TempDefaultState> Table = <TempDefaultTable>
        return 
    endif
    GetArraySize (Ped_UniqueStateLogic_DefaultStates)
    <index> = 0
    begin 
    if GotParam (Ped_UniqueStateLogic_DefaultStates [ <index> ].Tag)
        <State> = (Ped_UniqueStateLogic_DefaultStates [ <index> ].State)
        <Table> = (Ped_UniqueStateLogic_DefaultStates [ <index> ].Table)
        SetTags UniqueStateTable = <Table>
        Ped_SetLogicState <State> Table = <Table>
        return 
    endif
    <index> = (<index> + 1)
    repeat <array_size>
    GetArraySize (Ped_StateLogic_DefaultStates)
    <index> = 0
    begin 
    if GotParam (Ped_StateLogic_DefaultStates [ <index> ].Tag)
        <State> = (Ped_StateLogic_DefaultStates [ <index> ].State)
        <Table> = (Ped_StateLogic_DefaultStates [ <index> ].Table)
        Ped_SetLogicState <State> Table = <Table>
        return 
    endif
    <index> = (<index> + 1)
    repeat <array_size>
    Ped_SetLogicState STATE_walking Table = Ped_StateLogic_Table
endscript


script Ped_StateLogic_RegisterTempDefaultState 
    if NOT GotParam State
        script_assert 'Missing <State> param'
    endif
    if NOT GotParam Table
        script_assert 'Missing <Table> param'
    endif
    SetTags TempDefaultState = <State> TempDefaultTable = <Table>
endscript


script Ped_StateLogic_UnregisterTempDefaultState 
    RemoveTags Tags = [ TempDefaultState TempDefaultTable ]
endscript


script STATECONTROL_null 
endscript


script STATECONTROL_DELAY_waitanim 
    Obj_SetAnimCycleMode off
    Obj_WaitAnimFinished
    if GetSingleTag DelayedState
        GetSingleTag DelayedTable
        Ped_SetLogicState <DelayedState> Table = <DelayedTable>
        RemoveTags Tags = [ DelayedState DelayedTable ]
        return 
    endif
    Ped_StateLogic_SetDefaultState
endscript


script STATECONTROL_walking 
    ped_initialize_collision_exceptions
    Ped_Utils_GetAnimName Type = IdleToWalk
    PlayAnimWithPartialAnimIfExists Anim = <AnimName>
    Obj_WaitAnimFinished
    Ped_Utils_GetAnimName Type = WalkAnims
    PlayAnimWithPartialAnimIfExists Anim = <AnimName> Cycle UseAnimTags
    if GetSingleTag animTags
        ped_adjust_speed_to_match_anim <animTags>
    endif
endscript


script STATECONTROL_standidle 
    printf 'I\'m standing now!!'
    if AnimEquals [Ped_M_FalldownA Ped_M_FalldownB Ped_M_FalldownC Ped_M_FalldownD Ped_M_FalldownE]
        printf 'Falling'
        Obj_WaitAnimFinished
        if AnimEquals Ped_M_FalldownA
            PlayAnimWithPartialAnimIfExists Anim = Ped_M_GetUpA
        else
            if AnimEquals Ped_M_FalldownB
                PlayAnimWithPartialAnimIfExists Anim = Ped_M_GetUpB
            else
                if AnimEquals Ped_M_FalldownC
                    PlayAnimWithPartialAnimIfExists Anim = Ped_M_GetUpC
                else
                    if AnimEquals Ped_M_FalldownD
                        PlayAnimWithPartialAnimIfExists Anim = Ped_M_GetUpD
                    else
                        PlayAnimWithPartialAnimIfExists Anim = Ped_M_GetUpE
                    endif
                endif
            endif
        endif
        Obj_WaitAnimFinished
    endif
    if AnimEquals [Ped_M_LayIdleA Ped_M_LayIdleB Ped_M_LayIdleC Ped_M_LayIdleD Ped_M_LayIdleE]
        printf 'On the Ground'
        if AnimEquals Ped_M_LayIdleA
            PlayAnimWithPartialAnimIfExists Anim = Ped_M_GetUpA
        else
            if AnimEquals Ped_M_LayIdleB
                PlayAnimWithPartialAnimIfExists Anim = Ped_M_GetUpB
            else
                if AnimEquals Ped_M_LayIdleC
                    PlayAnimWithPartialAnimIfExists Anim = Ped_M_GetUpC
                else
                    if AnimEquals Ped_M_LayIdleD
                        PlayAnimWithPartialAnimIfExists Anim = Ped_M_GetUpD
                    else
                        PlayAnimWithPartialAnimIfExists Anim = Ped_M_GetUpE
                    endif
                endif
            endif
        endif
        Obj_WaitAnimFinished
    endif
    if NOT GetSingleTag should_look_at_skater
        <should_look_at_skater> = 0
    endif
    if (<should_look_at_skater> = 1)
        ped_standing_look_at_skater
    endif
    begin 
    GetRandomValue {name = speed resolution = 0.1000 a = 0.7500 b = 1.250}
    Ped_Utils_GetAnimName Type = StandAnims
    PlayAnimWithPartialAnimIfExists Anim = <AnimName> speed = <speed>
    Obj_WaitAnimFinished
    Ped_Utils_GetAnimName Type = StandAnims index = 0
    PlayAnimWithPartialAnimIfExists Anim = <AnimName> Cycle
    Wait (3.0, 6.0) seconds
    Obj_SetAnimCycleMode off
    Obj_WaitAnimFinished
    repeat 
endscript


script STATECONTROL_chick 
    begin 
    GetRandomValue {name = speed resolution = 0.1000 a = 0.7500 b = 1.250}
    PlayAnimWithPartialAnimIfExists Anim = Ped_F_Idle1 speed = <speed>
    Obj_WaitAnimFinished
    Random (
        @ printf 'Idle'
        PlayAnimWithPartialAnimIfExists Anim = Ped_F_Idle1 speed = <speed>
        @ printf 'Idle2'
        PlayAnimWithPartialAnimIfExists Anim = Ped_F_Idle1ToIdle2 speed = <speed>
        Obj_WaitAnimFinished
        GetRandomValue name = RepeatCount a = 1 b = 4 resolution = 4 Integer
        begin 
        PlayAnimWithPartialAnimIfExists Anim = Ped_F_Idle2 speed = <speed>
        Obj_WaitAnimFinished
        repeat <RepeatCount>
        PlayAnimWithPartialAnimIfExists Anim = Ped_F_Idle2ToIdle1 speed = <speed>
        @ printf 'Idle3'
        PlayAnimWithPartialAnimIfExists Anim = Ped_F_Idle1ToIdle3 speed = <speed>
        Obj_WaitAnimFinished
        GetRandomValue name = RepeatCount a = 1 b = 4 resolution = 4 Integer
        begin 
        PlayAnimWithPartialAnimIfExists Anim = Ped_F_Idle3 speed = <speed>
        Obj_WaitAnimFinished
        repeat <RepeatCount>
        PlayAnimWithPartialAnimIfExists Anim = Ped_F_Idle1ToIdle3 speed = <speed> backwards
    )
    Obj_WaitAnimFinished
    repeat 
endscript


script STATECONTROL_shot 
    ped_play_falldown_anim
    Obj_SetOuterAvoidRadius 10
    SetEventHandler {
        ex = ObjectOutofAvoidRadius
        Scr = Ped_Utils_EventHandler params = {SetState = STATE_getup event = ObjectOutofAvoidRadius}
    }
    begin 
    Wait Random (@ 10 @ 60 @ 90) frames
    ped_play_layidle_anim
    repeat 
endscript


script STATECONTROL_fall 
    if SkaterSpeedLessThan 1
        begin 
        Random (
            @*3 ped_play_idle_anim
            @ ped_play_disgust_anim no_block
        )
        Obj_WaitAnimFinished
        Obj_GetDistanceToObject skater
        if (<objectDistance> < 3.0)
            break 
        endif
        if (<objectDistance> > 4.0)
            goto ped_return_to_precollision_state
        endif
        repeat 
    endif
    if GotParam colObjId
        <colObjId> ::Obj_GetType
        if (<ObjType> = OBJECT_TYPE_SKATER)
            <colObjId> ::Vibrate port = 0 actuator = 1 percent = 100 duration = 0.1500
        endif
    endif
    GetSingleTag pissed
    <pissed> = (<pissed> + 1)
    if (<pissed> > 3)
        SetTags pissed = <pissed>
        Ped_SetLogicState STATE_knockdown Table = Ped_StateLogic_Table
    endif
    Temp_Ped_Fall_Sound
    Ped_Utils_PlayStream Type = avoid
    ped_play_falldown_anim
    Obj_SetOuterAvoidRadius 10
    SetEventHandler {
        ex = ObjectOutofAvoidRadius
        Scr = Ped_Utils_EventHandler params = {SetState = STATE_getup event = ObjectOutofAvoidRadius}
    }
    begin 
    Wait Random (@ 10 @ 60 @ 90) frames
    ped_play_layidle_anim
    repeat 
endscript


script STATECONTROL_getup 
    printf 'Getting Up STATE'
    ped_play_getup_anim
    Ped_SetLogicState STATE_disgust Table = Ped_StateLogic_Table
endscript


script STATECONTROL_disgust 
    ped_initialize_projectile_exceptions
    GetSingleTag should_look_at_skater
    if (<should_look_at_skater> = 1)
        ped_rotate_to_skater_from_idle
    endif
    ped_play_disgust_anim
    ped_initialize_movement
    Ped_SetLogicState STATE_chase Table = Ped_StateLogic_Table
    goto ped_return_to_precollision_state
endscript


script STATECONTROL_knockdown 
    Obj_LookAtObject Type = skater time = 0.05000
    ped_play_attack_anim no_block
    Wait 10 gameframes
    if GoalManager_CanStartGoal
        Ped_Utils_GetVectorToPlayer
        MakeSkaterGoto PedKnockDown params = {SetVelDir = <VecToPlayer> SetVelSpeed = 350}
    endif
    Obj_WaitAnimFinished
    ped_rotate_to_skater_from_idle
    Ped_SetLogicState STATE_disgust Table = Ped_StateLogic_Table
endscript


script STATECONTROL_avoidstop 
    Obj_SetInnerAvoidRadius 4
    SetEventHandler {
        ex = ObjectInAvoidRadius
        Scr = Ped_Utils_EventHandler params = {SetState = STATE_avoidinit event = ObjectInAvoidRadius}
    }
    Ped_Utils_GetAnimName Type = StandAnims
    PlayAnimWithPartialAnimIfExists Anim = <AnimName> Cycle
    Wait 1 gameframe
    GetSingleTag should_look_at_skater
    if (<should_look_at_skater> = 0)
        Ped_StateLogic_SetDefaultState
        return 
    endif
    begin 
    ped_rotate_to_skater_from_idle
    Random (
        @ ped_play_idle_anim
        @ ped_play_idle_anim
        @ ped_play_idle_anim
        @ ped_play_wave_anim
    )
    Obj_WaitAnimFinished
    Obj_GetDistanceToObject skater
    if (<objectDistance> > 12.0)
        ped_initialize_movement
        goto ped_return_to_precollision_state
    endif
    repeat 
endscript


script STATECONTROL_avoidinit 
    ClearEventHandler ObjectInAttentionRadius
    SetTags pissed = 0
    Ped_RememberNextWaypoint
    Ped_RememberCurrentPosition
    Obj_StorePos
    Ped_RememberStickToGround
    Ped_SetLogicState STATE_avoidjump
endscript


script STATECONTROL_avoidjump 
    GetSingleTag pissed
    SetTags pissed = (<pissed> + 1)
    Ped_Utils_GetAnimName Type = AvoidAnims
    if NOT Ped_SelectAvoidPoint <AnimName>
        GetSingleTag move_type
        if NOT (move_type = stand)
            Ped_SetLogicState STATE_avoidknockdown Table = Ped_StateLogic_Table
        endif
    endif
    Ped_Utils_PlayStream Type = avoid
    begin 
    Ped_MoveTowardsAvoidPoint
    Obj_StickToGround
    if Ped_AvoidPointReached
        break 
    endif
    Wait 1 gameframe
    repeat 
    Ped_SetLogicState STATE_avoidland
endscript


script STATECONTROL_avoidland 
    <maxPissedCount> = (2.0, 4.0)
    GetSingleTag pissed
    if (<pissed> > <maxPissedCount>)
        Obj_SetInnerAvoidRadius 4
        SetEventHandler {
            ex = ObjectInAvoidRadius
            Scr = Ped_Utils_EventHandler params = {SetState = STATE_avoidknockdown event = ObjectInAvoidRadius}
        }
    else
        Obj_SetInnerAvoidRadius 4
        SetEventHandler {
            ex = ObjectInAvoidRadius
            Scr = Ped_Utils_EventHandler params = {SetState = STATE_avoidjump event = ObjectInAvoidRadius}
        }
    endif
    if SkaterSpeedLessThan 1
        <stopped> = 1
    else
        <stopped> = 0
    endif
    GetSingleTag move_type
    begin 
    Obj_GetDistanceToObject skater
    if (<objectDistance> > 6.0)
        <stopped> = 0
    endif
    if (<stopped> = 1)
        ped_rotate_to_skater_from_idle
        Random (
            @ ped_play_disgust_anim
            @ ped_play_idle_anim
            @ ped_play_idle_anim
        )
    else
        if NOT (<move_type> = stand)
            ped_rotate_to_node_from_idle
        endif
        break 
    endif
    repeat 
    begin 
    Obj_GetDistanceToObject skater
    if (<objectDistance> > 20.0)
        printf 'returning to idle'
        break 
    endif
    Wait 1 gameframe
    repeat 
    ped_initialize_movement
    Ped_RestoreStickToGround
    goto ped_return_to_precollision_state
endscript


script STATECONTROL_avoidknockdown 
    ped_rotate_to_skater_from_idle
    ped_play_attack_anim no_block
    Wait 10 gameframes
    Obj_GetOrientationToObject skater
    if (<dotProd> < 0.5000)
        if (<dotProd> > -0.5000)
            Obj_GetDistanceToObject skater
            if (<objectDistance> < 6.0)
                Ped_Utils_GetVectorToPlayer
                MakeSkaterGoto PedKnockDown params = {SetVelDir = <VecToPlayer> SetVelSpeed = 350}
                Obj_WaitAnimFinished
            endif
        endif
    endif
    ped_initialize_movement
    Ped_RestoreStickToGround
    goto ped_return_to_precollision_state
endscript


script STATECONTROL_getattention 
    printf 'I\'m in get attention!'
    if AnimEquals [Ped_M_FalldownA Ped_M_FalldownB Ped_M_FalldownC Ped_M_FalldownD Ped_M_FalldownE]
        printf 'Falling'
        Obj_WaitAnimFinished
        if AnimEquals Ped_M_FalldownA
            PlayAnimWithPartialAnimIfExists Anim = Ped_M_GetUpA
        else
            if AnimEquals Ped_M_FalldownB
                PlayAnimWithPartialAnimIfExists Anim = Ped_M_GetUpB
            else
                if AnimEquals Ped_M_FalldownC
                    PlayAnimWithPartialAnimIfExists Anim = Ped_M_GetUpC
                else
                    if AnimEquals Ped_M_FalldownD
                        PlayAnimWithPartialAnimIfExists Anim = Ped_M_GetUpD
                    else
                        PlayAnimWithPartialAnimIfExists Anim = Ped_M_GetUpE
                    endif
                endif
            endif
        endif
        Obj_WaitAnimFinished
    endif
    if AnimEquals [Ped_M_LayIdleA Ped_M_LayIdleB Ped_M_LayIdleC Ped_M_LayIdleD Ped_M_LayIdleE]
        printf 'On the Ground'
        if AnimEquals Ped_M_LayIdleA
            PlayAnimWithPartialAnimIfExists Anim = Ped_M_GetUpA
        else
            if AnimEquals Ped_M_LayIdleB
                PlayAnimWithPartialAnimIfExists Anim = Ped_M_GetUpB
            else
                if AnimEquals Ped_M_LayIdleC
                    PlayAnimWithPartialAnimIfExists Anim = Ped_M_GetUpC
                else
                    if AnimEquals Ped_M_LayIdleD
                        PlayAnimWithPartialAnimIfExists Anim = Ped_M_GetUpD
                    else
                        PlayAnimWithPartialAnimIfExists Anim = Ped_M_GetUpE
                    endif
                endif
            endif
        endif
        Obj_WaitAnimFinished
    endif
    SetEventHandler {
        ex = SkaterLanded
        Scr = Ped_TrickPos_EventHandler
    }
    SetEventHandler {
        ex = SkaterBailed
        Scr = Ped_TrickBail_EventHandler
    }
    begin 
    if NOT Obj_ObjectInAttentionRadius
        Ped_Utils_SetMiscEventHandlers
        Ped_StateLogic_SetDefaultState
        return 
    endif
    GetSingleTag should_look_at_skater
    if NOT (<should_look_at_skater> = 0)
        Obj_LookAtObject Type = skater time = 0.3000
    endif
    Ped_Utils_PlayStream Type = Far
    Ped_Utils_GetAnimName Type = GetAttentionAnims
    PlayAnimWithPartialAnimIfExists Anim = <AnimName>
    Obj_WaitAnimFinished
    begin 
    Ped_Utils_GetAnimName Type = IdleAnims
    PlayAnimWithPartialAnimIfExists Anim = <AnimName>
    Obj_WaitAnimFinished
    repeat (1.0, 3.0)
    repeat 
endscript


script STATECONTROL_trickpositive 
    if Obj_ObjectInAttentionRadius
        Ped_Utils_PlayStream Type = trickpositive
        ped_rotate_to_skater_from_idle
        GetRandomValue name = RepeatCount a = 4 b = 10 Integer
        begin 
        Obj_LookAtObject Type = skater time = 0.3000
        Obj_WaitRotate
        Ped_Utils_GetAnimName Type = ImpressedAnims
        PlayAnimWithPartialAnimIfExists Anim = <AnimName>
        Obj_WaitAnimFinished
        repeat <RepeatCount>
    endif
    Ped_Utils_SetMiscEventHandlers
    Ped_StateLogic_SetDefaultState
endscript


script STATECONTROL_trickbail 
    if Obj_ObjectInAttentionRadius
        Ped_Utils_PlayStream Type = trickbail
        ped_rotate_to_skater_from_idle
        Ped_Utils_GetAnimName Type = DisgustAnims
        PlayAnimWithPartialAnimIfExists Anim = <AnimName>
        Obj_WaitAnimFinished
    endif
    Ped_Utils_SetMiscEventHandlers
    Ped_StateLogic_SetDefaultState
endscript


script Ped_TrickPos_EventHandler 
    if SkaterLastScoreLandedGreaterThan ped_min_notice_TrickScore
        if ((0.0, 100.0) > -1)
            Ped_SetLogicState STATE_trickpositive
            return 
        endif
    endif
    SetEventHandler {
        ex = SkaterLanded
        Scr = Ped_TrickPos_EventHandler
    }
endscript


script Ped_TrickBail_EventHandler 
    if ((0.0, 100.0) > -1)
        Ped_SetLogicState STATE_trickbail
        return 
    endif
    SetEventHandler {
        ex = SkaterBailed
        Scr = Ped_TrickBail_EventHandler
    }
endscript


script STATECONTROL_blockerwait 
    OBJ_EnableAnimBlending enabled = 1
    if LevelIs load_bo
        <stream> = Random (
            @ Ped_Attendant_Gap7_Block01
            @ Ped_Attendant_Gap7_Block02
            @ Ped_Attendant_Gap7_Block03
            @ Ped_Attendant_Gap7_Block04
            @ Ped_Attendant_Gap7_Block05
            @ Ped_Attendant_Gap7_Block06
            @ Ped_Attendant_Gap7_Block07
        )
        if NOT IsStreamPlaying BostonDoctorStream
            Obj_PlayStream <stream> vol = 200 dropoff = 160 priority = StreamPriorityHigh id = BostonDoctorStream
        endif
    endif
endscript


script STATECONTROL_blockerstand 
    Wait 10 gameframes
    Obj_SetAnimCycleMode off
    Obj_WaitAnimFinished
    Ped_Utils_SetMiscEventHandlers
    ClearEventHandler BlockerStand
    ClearEventHandler ObjectInAttentionRadius
    PlayAnimWithPartialAnimIfExists Anim = Ped_Blocker_BlockA_idle Cycle BlendPeriod = 0.01000
    <count> = 60
    <toggle> = 0
    begin 
    if NOT Obj_ObjectInAttentionRadius
        Ped_Utils_SetMiscEventHandlers
        Ped_StateLogic_SetDefaultState
        return 
    endif
    <count> = (<count> - 1)
    if (<count> = 0)
        <toggle> = (1 - <toggle>)
        if (<toggle> = 0)
            <count> = ((3.0, 6.0) * 60)
            PlayAnimWithPartialAnimIfExists Anim = Ped_Blocker_BlockA_idle Cycle
        else
            <count> = (2 * 60)
            PlayAnimWithPartialAnimIfExists Anim = Ped_Blocker_BlockB_idle Cycle
        endif
    endif
    Wait 1 gameframe
    repeat 
endscript


script STATECONTROL_blockershuffle 
    Ped_Utils_SetMiscEventHandlers
    ClearEventHandler BlockerShuffle
    ClearEventHandler ObjectInAttentionRadius
    if (<Dir> = left)
        if Obj_AnimEquals name = Ped_Blocker_ShuffleBlockLeft
            Obj_SetAnimCycleMode on
        else
            PlayAnimWithPartialAnimIfExists Anim = Ped_Blocker_ShuffleBlockLeft Cycle BlendPeriod = 0.01000 speed = 1.400
        endif
    else
        if Obj_AnimEquals name = Ped_Blocker_ShuffleBlockRight
            Obj_SetAnimCycleMode on
        else
            PlayAnimWithPartialAnimIfExists Anim = Ped_Blocker_ShuffleBlockRight Cycle BlendPeriod = 0.01000 speed = 1.400
        endif
    endif
    begin 
    if NOT Obj_ObjectInAttentionRadius
        Ped_Utils_SetMiscEventHandlers
        Ped_StateLogic_SetDefaultState
        return 
    endif
    Wait 1 gameframe
    repeat 
endscript


script STATECONTROL_blockerrun 
    Ped_Utils_SetMiscEventHandlers
    ClearEventHandler BlockerRun
    ClearEventHandler ObjectInAttentionRadius
    Ped_Utils_GetAnimName Type = RunAnims
    PlayAnimWithPartialAnimIfExists Anim = <AnimName> Cycle BlendPeriod = 0.2000
    begin 
    if NOT Obj_ObjectInAttentionRadius
        Ped_Utils_SetMiscEventHandlers
        Ped_StateLogic_SetDefaultState
        return 
    endif
    Wait 1 gameframe
    repeat 
endscript


script STATECONTROL_blockerbump 
    ped_play_attack_anim no_block
    MakeSkaterGoto PedKnockDown params = {SetVelDir = <VelDir> SetVelSpeed = 700}
    Obj_WaitAnimFinished
    Ped_Utils_SetMiscEventHandlers
    Ped_SetLogicState STATE_blockerstand
endscript


script STATECONTROL_chase 
    Ped_Utils_GetAnimName Type = RunAnims
    PlayAnimWithPartialAnimIfExists Anim = <AnimName> Cycle
endscript


script STATECONTROL_chasepause 
    begin 
    Ped_Utils_GetAnimName Type = StandAnims index = 0
    GetRandomValue name = RepeatCount a = 1 b = 3 Integer
    begin 
    ped_rotate_to_skater_from_idle
    PlayAnimWithPartialAnimIfExists Anim = <AnimName>
    Obj_WaitAnimFinished
    repeat <RepeatCount>
    ped_rotate_to_skater_from_idle
    Ped_Utils_GetAnimName Type = DisgustAnims
    PlayAnimWithPartialAnimIfExists Anim = <AnimName>
    Obj_WaitAnimFinished
    repeat 
endscript

Ped_chase_count = 0

script STATECONTROL_chasecatch 
    ped_play_attack_anim no_block
    MakeSkaterGoto PedKnockDown params = {SetVelDir = <VelDir> SetVelSpeed = 700}
    Ped_chase_count (<Ped_chase_count> + 1)
    printf 'I gotcha!'
    FormatText textname = text 'You suck!\n%a Knock dows? ' a = <Ped_chase_count>
    create_console_message text = <text> rgba = [ 45 45 128 100 ] wait_and_die = 1 time = 3
    Wait 3 seconds
    Ped_SetLogicState STATE_DEFAULT
    if GetSingleTag CatchScript
        goto <CatchScript>
    else
        Wait 3 seconds
        Ped_SetLogicState STATE_gohome
    endif
endscript


script STATECONTROL_gohome 
    Ped_StateLogic_RegisterTempDefaultState {State = STATE_gohome Table = Ped_StateLogic_Table}
    Ped_Utils_GetAnimName Type = WalkAnims
    PlayAnimWithPartialAnimIfExists Anim = <AnimName> Cycle UseAnimTags
endscript


script PEDAI_Sitting_StopWayPoint 
    Ped_StopMoving
    Ped_GetCurrentNodeNames
    Obj_MoveToNode name = <node_from> speed = 5 mph
    Obj_WaitMove
    Ped_StartMoving
    Ped_SetLogicState STATE_Sitting Table = Ped_StateLogic_Table
endscript


script STATECONTROL_Sitting 
    printf 'SITTING'
    Ped_TurnToCurrentWaypointOrientation time = 0.7500
    Ped_Utils_GetAnimName Type = TurnAnims
    PlayAnimWithPartialAnimIfExists Anim = <AnimName> Cycle
    Obj_WaitRotate
    PlayAnimWithPartialAnimIfExists Anim = Ped_STND2SIT
    Obj_WaitAnimFinished
    begin 
    GetRandomValue name = RepeatCount a = 5 b = 15 resolution = 10 Integer
    Random (
        @ GetRandomValue name = RepeatIdle a = 5 b = 50 resolution = 45 Integer
        OBJ_cycleanim Anim = Ped_SIT_Idle NumCycles = <ReapeatIdle>
        @ PlayAnimWithPartialAnimIfExists Anim = PED_SIT_Tap
        @ PlayAnimWithPartialAnimIfExists Anim = PED_SIT_LookR
        @ PlayAnimWithPartialAnimIfExists Anim = PED_SIT_LookL
        @ PlayAnimWithPartialAnimIfExists Anim = Ped_SIt2SITB
        Obj_WaitAnimFinished
        begin 
        Random (
            @ GetRandomValue name = RepeatIdleB a = 2 b = 10 resolution = 8 Integer
            OBJ_cycleanim Anim = Ped_sitB_idle NumCycles = <ReapeatIdleB>
            @ PlayAnimWithPartialAnimIfExists Anim = Ped_sitB_lookL
            @ PlayAnimWithPartialAnimIfExists Anim = Ped_sitB_LookR
        )
        Obj_WaitAnimFinished
        repeat 5
        PlayAnimWithPartialAnimIfExists Anim = Ped_SItB2SITBL
        Obj_WaitAnimFinished
        begin 
        Random (
            @ GetRandomValue name = RepeatIdleBL a = 2 b = 10 resolution = 8 Integer
            OBJ_cycleanim Anim = Ped_sitBL_idle NumCycles = <ReapeatIdleBL>
            @ PlayAnimWithPartialAnimIfExists Anim = Ped_sitBL_lookL
            @ PlayAnimWithPartialAnimIfExists Anim = Ped_sitBL_Shake
            @ PlayAnimWithPartialAnimIfExists Anim = Ped_sitBL_Shake
            @ PlayAnimWithPartialAnimIfExists Anim = Ped_sitBL_Tap
        )
        Obj_WaitAnimFinished
        repeat 5
        PlayAnimWithPartialAnimIfExists Anim = Ped_SITBL2SIT
    )
    Obj_WaitAnimFinished
    repeat <RepeatCount>
    PlayAnimWithPartialAnimIfExists Anim = Ped_SIT2STND
    Obj_WaitAnimFinished
    Ped_StateLogic_SetDefaultState
endscript


script PEDAI_Vending_StopWayPoint 
    Ped_StopMoving
    Ped_GetCurrentNodeNames
    Obj_MoveToNode name = <node_from> speed = 5 mph
    Obj_WaitMove
    Ped_StartMoving
    Ped_SetLogicState STATE_Vending Table = Ped_StateLogic_Table
endscript


script STATECONTROL_Vending 
    Ped_GetGender
    Ped_TurnToCurrentWaypointOrientation time = 0.7500
    if (<Gender> = male)
        PlayAnimWithPartialAnimIfExists Anim = Ped_M_Walk1ToIdle
        Obj_WaitAnimFinished
        PlayAnimWithPartialAnimIfExists Anim = Ped_M_IdletoATM
        Obj_WaitAnimFinished
        begin 
        Random (
            @ PlayAnimWithPartialAnimIfExists Anim = Ped_M_ATM1
            @ PlayAnimWithPartialAnimIfExists Anim = Ped_M_ATM2
        )
        Obj_WaitAnimFinished
        repeat 5
        PlayAnimWithPartialAnimIfExists Anim = Ped_M_ATMtoIdle
        Obj_WaitAnimFinished
        PlayAnimWithPartialAnimIfExists Anim = Ped_M_Walk1FromIdle
        Obj_WaitAnimFinished
    else
        PEDAI_Female_StopWayPoint
    endif
    Ped_StateLogic_SetDefaultState
endscript


script PEDAI_Corner_StopWayPoint 
    Ped_StopMoving
    Ped_GetCurrentNodeNames
    Obj_MoveToNode name = <node_from> speed = 5 mph
    Obj_WaitMove
    Ped_StartMoving
    Ped_SetLogicState STATE_Corner Table = Ped_StateLogic_Table
endscript


script STATECONTROL_Corner 
    Ped_TurnToCurrentWaypointOrientation time = 0.7500
    Ped_GetGender
    if (<Gender> = male)
        begin 
        PlayAnimWithPartialAnimIfExists Anim = Ped_M_LookLeftDown
        Obj_WaitAnimFinished
        PlayAnimWithPartialAnimIfExists Anim = Ped_M_Lookright
        Obj_WaitAnimFinished
        repeat 2
    else
        PEDAI_Female_StopWayPoint
    endif
    Ped_StateLogic_SetDefaultState
endscript


script PEDAI_Arcade_StopWayPoint 
    Ped_StopMoving
    Ped_GetCurrentNodeNames
    Obj_MoveToNode name = <node_from> speed = 5 mph
    Obj_WaitMove
    Ped_StartMoving
    Ped_SetLogicState STATE_Arcade Table = Ped_StateLogic_Table
endscript


script STATECONTROL_Arcade 
    Ped_GetGender
    Ped_TurnToCurrentWaypointOrientation time = 0.7500
    if (<Gender> = male)
        PlayAnimWithPartialAnimIfExists Anim = Ped_M_Walk1ToIdle
        Obj_WaitAnimFinished
        PlayAnimWithPartialAnimIfExists Anim = Ped_M_Idle1toArcade
        Obj_WaitAnimFinished
        begin 
        Random (
            @ PlayAnimWithPartialAnimIfExists Anim = Ped_M_ArcadeIdle
            @ PlayAnimWithPartialAnimIfExists Anim = Ped_M_Arcade1
            @ PlayAnimWithPartialAnimIfExists Anim = Ped_M_Arcade2
        )
        Obj_WaitAnimFinished
        repeat 5
        PlayAnimWithPartialAnimIfExists Anim = Ped_M_ArcadetoIdle
        Obj_WaitAnimFinished
        PlayAnimWithPartialAnimIfExists Anim = Ped_M_Walk1FromIdle
        Obj_WaitAnimFinished
        Ped_StateLogic_SetDefaultState
    else
        PEDAI_Female_StopWayPoint
    endif
endscript


script PEDAI_LookAt_StopWayPoint 
    Ped_StopMoving
    Ped_GetCurrentNodeNames
    Obj_MoveToNode name = <node_from> speed = 5 mph
    Obj_WaitMove
    Ped_StartMoving
    Ped_SetLogicState STATE_LookAt Table = Ped_StateLogic_Table
endscript


script STATECONTROL_LookAt 
    Ped_GetGender
    Ped_TurnToCurrentWaypointOrientation time = 0.7500
    if (<Gender> = male)
        PlayAnimWithPartialAnimIfExists Anim = Ped_M_Walk1ToIdle
        Obj_WaitAnimFinished
        PlayAnimWithPartialAnimIfExists Anim = Ped_M_IdletoObserve
        Obj_WaitAnimFinished
        begin 
        Random (
            @ PlayAnimWithPartialAnimIfExists Anim = Ped_M_ObserveIdle
            @ PlayAnimWithPartialAnimIfExists Anim = Ped_M_ObserveScratch
            @ PlayAnimWithPartialAnimIfExists Anim = Ped_M_ObserveWipe
            @ PlayAnimWithPartialAnimIfExists Anim = Ped_M_Observe02
        )
        Obj_WaitAnimFinished
        repeat 5
        PlayAnimWithPartialAnimIfExists Anim = Ped_M_ObservetoIdle
        Obj_WaitAnimFinished
        PlayAnimWithPartialAnimIfExists Anim = Ped_M_Walk1FromIdle
        Obj_WaitAnimFinished
    else
        PEDAI_Female_StopWayPoint
    endif
    Ped_StateLogic_SetDefaultState
endscript


script PEDAI_Wait_StopWayPoint 
    Ped_StopMoving
    Ped_GetCurrentNodeNames
    Obj_MoveToNode name = <node_from> speed = 5 mph
    Obj_WaitMove
    Ped_StartMoving
    Ped_SetLogicState STATE_Wait Table = Ped_StateLogic_Table
endscript


script STATECONTROL_Wait 
    Ped_GetGender
    Ped_TurnToCurrentWaypointOrientation time = 0.7500
    if (<Gender> = male)
        PlayAnimWithPartialAnimIfExists Anim = Ped_M_Walk1ToIdle
        Obj_WaitAnimFinished
        begin 
        Random (
            @ PlayAnimWithPartialAnimIfExists Anim = Ped_M_LookAtWatch
            @ PlayAnimWithPartialAnimIfExists Anim = Ped_M_LookAtWatch2
        )
        Obj_WaitAnimFinished
        repeat 5
        PlayAnimWithPartialAnimIfExists Anim = Ped_M_Walk1FromIdle
        Obj_WaitAnimFinished
    else
        PEDAI_Female_StopWayPoint
    endif
    Ped_StateLogic_SetDefaultState
endscript


script PEDAI_TALK_StopWayPoint 
    Ped_StopMoving
    Ped_GetCurrentNodeNames
    Obj_MoveToNode name = <node_from> speed = 5 mph
    Obj_WaitMove
    Ped_StartMoving
    Ped_SetLogicState STATE_Talk Table = Ped_StateLogic_Table
endscript


script STATECONTROL_Talk 
    printf 'Talk'
    Ped_TurnToCurrentWaypointOrientation time = 0.7500
    begin 
    Random (
        @ PlayAnimWithPartialAnimIfExists Anim = Ped_M_Talk2_Idle
        @ PlayAnimWithPartialAnimIfExists Anim = Ped_M_Talk2_Idle2
        @ PlayAnimWithPartialAnimIfExists Anim = Ped_M_Talk2_RightHere
        @ PlayAnimWithPartialAnimIfExists Anim = Ped_M_Talk2_MixIt
        @ PlayAnimWithPartialAnimIfExists Anim = Ped_M_Talk2_SureThing
        @ PlayAnimWithPartialAnimIfExists Anim = Ped_M_Talk2_Maybe
        @ PlayAnimWithPartialAnimIfExists Anim = Ped_M_Talk2_WhatDoYouThink
        @ PlayAnimWithPartialAnimIfExists Anim = Ped_M_Talk2_OfCourse
        @ PlayAnimWithPartialAnimIfExists Anim = Ped_M_Talk2_BackThere
        @ PlayAnimWithPartialAnimIfExists Anim = Ped_M_Talk2_RoundAndRound
        @ PlayAnimWithPartialAnimIfExists Anim = Ped_M_Talk2_UpAbove
        @ PlayAnimWithPartialAnimIfExists Anim = Ped_M_Talk2_KnowWhatIMean
        @ PlayAnimWithPartialAnimIfExists Anim = Ped_M_Talk2_GoAhead
        @ PlayAnimWithPartialAnimIfExists Anim = Ped_M_Talk2_TheyllTellYou
    )
    Obj_WaitAnimFinished
    repeat 
endscript


script PEDAI_Female_StopWayPoint 
    PlayAnimWithPartialAnimIfExists Anim = Ped_F_WalkToIdle1
    Obj_WaitAnimFinished
    begin 
    Random (
        @ PlayAnimWithPartialAnimIfExists Anim = Ped_F_Idle1
        @ PlayAnimWithPartialAnimIfExists Anim = Ped_F_Idle1ToIdle2
        Obj_WaitAnimFinished
        begin 
        PlayAnimWithPartialAnimIfExists Anim = Ped_F_Idle2
        Obj_WaitAnimFinished
        repeat 3
        PlayAnimWithPartialAnimIfExists Anim = Ped_F_Idle2ToIdle1
    )
    Obj_WaitAnimFinished
    repeat 5
    PlayAnimWithPartialAnimIfExists Anim = Ped_F_WalkFromIdle1
    Obj_WaitAnimFinished
    Ped_StateLogic_SetDefaultState
endscript


script STATECONTROL_Explode 
    if LevelIs load_no
        Zombie_SFX_Die
    endif
    BroadcastEvent Type = Zombie_Explode
    PlayAnimWithPartialAnimIfExists Anim = default
    dismember bone = bone_head MaxVel = 50 MaxRotVel = 2
    CreateFlexibleParticleSystem name = ZombieFlareUp params_script = JEG_Zombie_FlareUp_particle_params
    CreateFlexibleParticleSystem name = ZombieBurst params_script = JEG_Zombie_burst_particle_params
    Wait 2 gameframes
    dismember bone = Bone_Knee_R MaxVel = 40 MaxRotVel = 6
    dismember bone = Bone_Knee_L MaxVel = 50 MaxRotVel = 5
    dismember bone = Bone_Forearm_R MaxVel = 30 MaxRotVel = 4
    dismember bone = Bone_Forearm_L MaxVel = 50 MaxRotVel = 3
    Wait 1 gameframes
    dismember bone = bone_bicep_R MaxVel = 40 MaxRotVel = 6
    dismember bone = bone_bicep_L MaxVel = 50 MaxRotVel = 5
    dismember bone = Bone_Thigh_R MaxVel = 30 MaxRotVel = 4
    dismember bone = Bone_Thigh_L MaxVel = 50 MaxRotVel = 3
    Wait 1 gameframes
    dismember bone = bone_pelvis
    Wait 180 gameframes
    DestroyFlexibleParticleSystem name = ZombieFlareUp
    DestroyFlexibleParticleSystem name = ZombieBurst
    Obj_GetID
    <objID> ::Die
endscript

