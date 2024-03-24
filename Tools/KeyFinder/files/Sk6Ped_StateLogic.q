

script PED_DEBUGEVENT 
    if (DEBUG_PEDLOGIC = 1)
        obj_getid
        if (DEBUG_PED_OBJID = 0 || DEBUG_PED_OBJID = <ObjID>)
            
            
            if GotParam params
                
                
            endif
            
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
    {tag = sitting state = STATE_Sitting table = Ped_StateLogic_Table}
    {tag = Vending state = STATE_Vending table = Ped_StateLogic_Table}
    {tag = corner state = STATE_Corner table = Ped_StateLogic_Table}
    {tag = arcade state = STATE_Arcade table = Ped_StateLogic_Table}
    {tag = lookat state = STATE_LookAt table = Ped_StateLogic_Table}
    {tag = wait state = STATE_Wait table = Ped_StateLogic_Table}
    {tag = talk state = STATE_Talk table = Ped_StateLogic_Table}
    {tag = Chick state = STATE_Chick table = Ped_StateLogic_Table}
    {tag = skater state = STATE_skating table = SkaterPed_StateTable}
    {tag = stand state = STATE_standing table = Ped_StateLogic_Table}
]
Ped_StateLogic_CollisionTypes = [
    {tag = avoid Set_mode = avoid}
    {tag = fall Set_mode = fall}
    {tag = shot Set_mode = shot}
    {tag = knock Set_mode = knock}
    {tag = bump Set_mode = bump}
    {tag = ignore Set_mode = ignore}
]
Ped_StateLogic_EventHandlers = [
    {tag = GetAttention Hook_event = objectinattentionradius state = STATE_getattention scr = Ped_Utils_EventHandler}
    {tag = Blocker Hook_event = objectinattentionradius state = STATE_blockerwait scr = Ped_Utils_EventHandler}
    {tag = Blocker Hook_event = BlockerStand state = STATE_blockerStand scr = Ped_Utils_EventHandler}
    {tag = Blocker Hook_event = BlockerShuffle state = STATE_blockerShuffle scr = Ped_Utils_EventHandler}
    {tag = Blocker Hook_event = BlockerRun state = STATE_blockerRun scr = Ped_Utils_EventHandler}
    {tag = Blocker Hook_event = BlockerBumpPlayer state = STATE_blockerbump scr = Ped_Utils_EventHandler}
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
    autolaunch_cas_instrument = {
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
    STATE_blockerStand = {
        ped_update_type = blocker_move_update
        script_ped_state = STATECONTROL_blockerstand
    }
    STATE_blockerShuffle = {
        ped_update_type = blocker_move_update
        script_ped_state = STATECONTROL_blockershuffle
    }
    STATE_blockerRun = {
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
    gettags
    if GotParam TempDefaultState
        Ped_SetLogicState <TempDefaultState> table = <TempDefaultTable>
        return 
    endif
    GetArraySize (Ped_UniqueStateLogic_DefaultStates)
    <index> = 0
    begin 
    if GotParam (Ped_UniqueStateLogic_DefaultStates [ <index> ].tag)
        <state> = (Ped_UniqueStateLogic_DefaultStates [ <index> ].state)
        <table> = (Ped_UniqueStateLogic_DefaultStates [ <index> ].table)
        settags UniqueStateTable = <table>
        Ped_SetLogicState <state> table = <table>
        return 
    endif
    <index> = (<index> + 1)
    repeat <array_size>
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


script Ped_StateLogic_RegisterTempDefaultState 
    if NOT GotParam state
        script_assert 'Missing <State> param'
    endif
    if NOT GotParam table
        script_assert 'Missing <Table> param'
    endif
    settags TempDefaultState = <state> TempDefaultTable = <table>
endscript


script Ped_StateLogic_UnregisterTempDefaultState 
    removetags tags = [ TempDefaultState TempDefaultTable ]
endscript


script STATECONTROL_null 
endscript


script STATECONTROL_DELAY_waitanim 
    obj_setanimcyclemode Off
    Obj_WaitAnimFinished
    if getsingletag DelayedState
        getsingletag DelayedTable
        Ped_SetLogicState <DelayedState> table = <DelayedTable>
        removetags tags = [ DelayedState DelayedTable ]
        return 
    endif
    Ped_StateLogic_SetDefaultState
endscript


script STATECONTROL_walking 
    ped_initialize_collision_exceptions
    Ped_Utils_GetAnimName type = IdleToWalk
    PlayAnimWithPartialAnimIfExists anim = <AnimName>
    Obj_WaitAnimFinished
    Ped_Utils_GetAnimName type = WalkAnims
    PlayAnimWithPartialAnimIfExists anim = <AnimName> Cycle UseAnimTags
    if getsingletag animtags
        ped_adjust_speed_to_match_anim <animtags>
    endif
endscript


script STATECONTROL_standidle 
    
    if animequals [Ped_M_FalldownA Ped_M_FalldownB Ped_M_FalldownC Ped_M_FalldownD Ped_M_FalldownE]
        
        Obj_WaitAnimFinished
        if animequals Ped_M_FalldownA
            PlayAnimWithPartialAnimIfExists anim = Ped_M_GetUpA
        else
            if animequals Ped_M_FalldownB
                PlayAnimWithPartialAnimIfExists anim = Ped_M_GetUpB
            else
                if animequals Ped_M_FalldownC
                    PlayAnimWithPartialAnimIfExists anim = Ped_M_GetUpC
                else
                    if animequals Ped_M_FalldownD
                        PlayAnimWithPartialAnimIfExists anim = Ped_M_GetUpD
                    else
                        PlayAnimWithPartialAnimIfExists anim = Ped_M_GetUpE
                    endif
                endif
            endif
        endif
        Obj_WaitAnimFinished
    endif
    if animequals [Ped_M_LayIdleA Ped_M_LayIdleB Ped_M_LayIdleC Ped_M_LayIdleD Ped_M_LayIdleE]
        
        if animequals Ped_M_LayIdleA
            PlayAnimWithPartialAnimIfExists anim = Ped_M_GetUpA
        else
            if animequals Ped_M_LayIdleB
                PlayAnimWithPartialAnimIfExists anim = Ped_M_GetUpB
            else
                if animequals Ped_M_LayIdleC
                    PlayAnimWithPartialAnimIfExists anim = Ped_M_GetUpC
                else
                    if animequals Ped_M_LayIdleD
                        PlayAnimWithPartialAnimIfExists anim = Ped_M_GetUpD
                    else
                        PlayAnimWithPartialAnimIfExists anim = Ped_M_GetUpE
                    endif
                endif
            endif
        endif
        Obj_WaitAnimFinished
    endif
    if NOT getsingletag should_look_at_skater
        <should_look_at_skater> = 0
    endif
    if (<should_look_at_skater> = 1)
        ped_standing_look_at_skater
    endif
    begin 
    getrandomvalue {name = Speed resolution = 0.1000 a = 0.7500 b = 1.250}
    Ped_Utils_GetAnimName type = StandAnims
    PlayAnimWithPartialAnimIfExists anim = <AnimName> Speed = <Speed>
    Obj_WaitAnimFinished
    Ped_Utils_GetAnimName type = StandAnims index = 0
    PlayAnimWithPartialAnimIfExists anim = <AnimName> Cycle
    wait randomrange (3.0, 6.0) seconds
    obj_setanimcyclemode Off
    Obj_WaitAnimFinished
    repeat 
endscript


script STATECONTROL_chick 
    begin 
    getrandomvalue {name = Speed resolution = 0.1000 a = 0.7500 b = 1.250}
    PlayAnimWithPartialAnimIfExists anim = Ped_F_Idle1 Speed = <Speed>
    Obj_WaitAnimFinished
    Random (
        @ printf 'Idle'
        PlayAnimWithPartialAnimIfExists anim = Ped_F_Idle1 Speed = <Speed>
        @ printf 'Idle2'
        PlayAnimWithPartialAnimIfExists anim = Ped_F_Idle1ToIdle2 Speed = <Speed>
        Obj_WaitAnimFinished
        getrandomvalue name = RepeatCount a = 1 b = 4 resolution = 4 integer
        begin 
        PlayAnimWithPartialAnimIfExists anim = Ped_F_Idle2 Speed = <Speed>
        Obj_WaitAnimFinished
        repeat <RepeatCount>
        PlayAnimWithPartialAnimIfExists anim = Ped_F_Idle2ToIdle1 Speed = <Speed>
        @ printf 'Idle3'
        PlayAnimWithPartialAnimIfExists anim = Ped_F_Idle1ToIdle3 Speed = <Speed>
        Obj_WaitAnimFinished
        getrandomvalue name = RepeatCount a = 1 b = 4 resolution = 4 integer
        begin 
        PlayAnimWithPartialAnimIfExists anim = Ped_F_Idle3 Speed = <Speed>
        Obj_WaitAnimFinished
        repeat <RepeatCount>
        PlayAnimWithPartialAnimIfExists anim = Ped_F_Idle1ToIdle3 Speed = <Speed> backwards
    )
    Obj_WaitAnimFinished
    repeat 
endscript


script STATECONTROL_shot 
    ped_play_falldown_anim
    obj_setouteravoidradius 10
    seteventhandler {
        Ex = objectoutofavoidradius
        scr = Ped_Utils_EventHandler params = {setstate = autolaunch_cas_instrument event = objectoutofavoidradius}
    }
    begin 
    wait Random (@ 10 @ 60 @ 90) frames
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
        obj_getdistancetoobject skater
        if (<objectdistance> < 3.0)
            break 
        endif
        if (<objectdistance> > 4.0)
            goto ped_return_to_precollision_state
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
    ped_play_falldown_anim
    obj_setouteravoidradius 10
    seteventhandler {
        Ex = objectoutofavoidradius
        scr = Ped_Utils_EventHandler params = {setstate = autolaunch_cas_instrument event = objectoutofavoidradius}
    }
    begin 
    wait Random (@ 10 @ 60 @ 90) frames
    ped_play_layidle_anim
    repeat 
endscript


script STATECONTROL_getup 
    
    ped_play_getup_anim
    Ped_SetLogicState STATE_disgust table = Ped_StateLogic_Table
endscript


script STATECONTROL_disgust 
    ped_initialize_projectile_exceptions
    getsingletag should_look_at_skater
    if (<should_look_at_skater> = 1)
        ped_rotate_to_skater_from_idle
    endif
    ped_play_disgust_anim
    ped_initialize_movement
    goto ped_return_to_precollision_state
endscript


script STATECONTROL_knockdown 
    Obj_LookAtObject type = skater time = 0.05000
    ped_play_attack_anim no_block
    wait 10 gameframes
    if GoalManager_CanStartGoal
        Ped_Utils_GetVectorToPlayer
        MakeSkaterGoto PedKnockDown params = {SetVelDir = <VecToPlayer> SetVelSpeed = 350}
    endif
    Obj_WaitAnimFinished
    ped_rotate_to_skater_from_idle
    Ped_SetLogicState STATE_disgust table = Ped_StateLogic_Table
endscript


script STATECONTROL_avoidstop 
    obj_setinneravoidradius 4
    seteventhandler {
        Ex = objectinavoidradius
        scr = Ped_Utils_EventHandler params = {setstate = STATE_avoidinit event = objectinavoidradius}
    }
    Ped_Utils_GetAnimName type = StandAnims
    PlayAnimWithPartialAnimIfExists anim = <AnimName> Cycle
    wait 1 gameframe
    getsingletag should_look_at_skater
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
    obj_getdistancetoobject skater
    if (<objectdistance> > 12.0)
        ped_initialize_movement
        goto ped_return_to_precollision_state
    endif
    repeat 
endscript


script STATECONTROL_avoidinit 
    ClearEventHandler objectinattentionradius
    settags pissed = 0
    Ped_RememberNextWaypoint
    Ped_RememberCurrentPosition
    obj_storepos
    Ped_RememberStickToGround
    Ped_SetLogicState STATE_avoidjump
endscript


script STATECONTROL_avoidjump 
    getsingletag pissed
    settags pissed = (<pissed> + 1)
    Ped_Utils_GetAnimName type = AvoidAnims
    if NOT Ped_SelectAvoidPoint <AnimName>
        getsingletag move_type
        if NOT (move_type = stand)
            Ped_SetLogicState STATE_avoidknockdown table = Ped_StateLogic_Table
        endif
    endif
    Ped_Utils_PlayStream type = avoid
    begin 
    Ped_MoveTowardsAvoidPoint
    obj_sticktoground
    if Ped_AvoidPointReached
        break 
    endif
    wait 1 gameframe
    repeat 
    Ped_SetLogicState STATE_avoidland
endscript


script STATECONTROL_avoidland 
    <maxPissedCount> = randomrange (2.0, 4.0)
    getsingletag pissed
    if (<pissed> > <maxPissedCount>)
        obj_setinneravoidradius 4
        seteventhandler {
            Ex = objectinavoidradius
            scr = Ped_Utils_EventHandler params = {setstate = STATE_avoidknockdown event = objectinavoidradius}
        }
    else
        obj_setinneravoidradius 4
        seteventhandler {
            Ex = objectinavoidradius
            scr = Ped_Utils_EventHandler params = {setstate = STATE_avoidjump event = objectinavoidradius}
        }
    endif
    if SkaterSpeedLessThan 1
        <stopped> = 1
    else
        <stopped> = 0
    endif
    getsingletag move_type
    begin 
    obj_getdistancetoobject skater
    if (<objectdistance> > 6.0)
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
    obj_getdistancetoobject skater
    if (<objectdistance> > 20.0)
        
        break 
    endif
    wait 1 gameframe
    repeat 
    ped_initialize_movement
    Ped_RestoreStickToGround
    goto ped_return_to_precollision_state
endscript


script STATECONTROL_avoidknockdown 
    ped_rotate_to_skater_from_idle
    ped_play_attack_anim no_block
    wait 10 gameframes
    obj_getorientationtoobject skater
    if (<dotprod> < 0.5000)
        if (<dotprod> > -0.5000)
            obj_getdistancetoobject skater
            if (<objectdistance> < 6.0)
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
    
    if animequals [Ped_M_FalldownA Ped_M_FalldownB Ped_M_FalldownC Ped_M_FalldownD Ped_M_FalldownE]
        
        Obj_WaitAnimFinished
        if animequals Ped_M_FalldownA
            PlayAnimWithPartialAnimIfExists anim = Ped_M_GetUpA
        else
            if animequals Ped_M_FalldownB
                PlayAnimWithPartialAnimIfExists anim = Ped_M_GetUpB
            else
                if animequals Ped_M_FalldownC
                    PlayAnimWithPartialAnimIfExists anim = Ped_M_GetUpC
                else
                    if animequals Ped_M_FalldownD
                        PlayAnimWithPartialAnimIfExists anim = Ped_M_GetUpD
                    else
                        PlayAnimWithPartialAnimIfExists anim = Ped_M_GetUpE
                    endif
                endif
            endif
        endif
        Obj_WaitAnimFinished
    endif
    if animequals [Ped_M_LayIdleA Ped_M_LayIdleB Ped_M_LayIdleC Ped_M_LayIdleD Ped_M_LayIdleE]
        
        if animequals Ped_M_LayIdleA
            PlayAnimWithPartialAnimIfExists anim = Ped_M_GetUpA
        else
            if animequals Ped_M_LayIdleB
                PlayAnimWithPartialAnimIfExists anim = Ped_M_GetUpB
            else
                if animequals Ped_M_LayIdleC
                    PlayAnimWithPartialAnimIfExists anim = Ped_M_GetUpC
                else
                    if animequals Ped_M_LayIdleD
                        PlayAnimWithPartialAnimIfExists anim = Ped_M_GetUpD
                    else
                        PlayAnimWithPartialAnimIfExists anim = Ped_M_GetUpE
                    endif
                endif
            endif
        endif
        Obj_WaitAnimFinished
    endif
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
        Ped_Utils_SetMiscEventHandlers
        Ped_StateLogic_SetDefaultState
        return 
    endif
    getsingletag should_look_at_skater
    if NOT (<should_look_at_skater> = 0)
        Obj_LookAtObject type = skater time = 0.3000
    endif
    Ped_Utils_PlayStream type = far
    Ped_Utils_GetAnimName type = GetAttentionAnims
    PlayAnimWithPartialAnimIfExists anim = <AnimName>
    Obj_WaitAnimFinished
    begin 
    Ped_Utils_GetAnimName type = idleanims
    PlayAnimWithPartialAnimIfExists anim = <AnimName>
    Obj_WaitAnimFinished
    repeat randomrange (1.0, 3.0)
    repeat 
endscript


script STATECONTROL_trickpositive 
    if obj_objectinattentionradius
        Ped_Utils_PlayStream type = trickpositive
        ped_rotate_to_skater_from_idle
        getrandomvalue name = RepeatCount a = 4 b = 10 integer
        begin 
        Obj_LookAtObject type = skater time = 0.3000
        Obj_WaitRotate
        Ped_Utils_GetAnimName type = ImpressedAnims
        PlayAnimWithPartialAnimIfExists anim = <AnimName>
        Obj_WaitAnimFinished
        repeat <RepeatCount>
    endif
    Ped_Utils_SetMiscEventHandlers
    Ped_StateLogic_SetDefaultState
endscript


script STATECONTROL_trickbail 
    if obj_objectinattentionradius
        Ped_Utils_PlayStream type = trickbail
        ped_rotate_to_skater_from_idle
        Ped_Utils_GetAnimName type = DisgustAnims
        PlayAnimWithPartialAnimIfExists anim = <AnimName>
        Obj_WaitAnimFinished
    endif
    Ped_Utils_SetMiscEventHandlers
    Ped_StateLogic_SetDefaultState
endscript


script Ped_TrickPos_EventHandler 
    if SkaterLastScoreLandedGreaterThan ped_min_notice_TrickScore
        if (randomrange (0.0, 100.0) > -1)
            Ped_SetLogicState STATE_trickpositive
            return 
        endif
    endif
    seteventhandler {
        Ex = SkaterLanded
        scr = Ped_TrickPos_EventHandler
    }
endscript


script Ped_TrickBail_EventHandler 
    if (randomrange (0.0, 100.0) > -1)
        Ped_SetLogicState STATE_trickbail
        return 
    endif
    seteventhandler {
        Ex = SkaterBailed
        scr = Ped_TrickBail_EventHandler
    }
endscript


script STATECONTROL_blockerwait 
    obj_enableanimblending enabled = 1
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
            obj_playstream <stream> vol = 200 dropoff = 160 priority = StreamPriorityHigh id = BostonDoctorStream
        endif
    endif
endscript


script STATECONTROL_blockerstand 
    wait 10 gameframes
    obj_setanimcyclemode Off
    Obj_WaitAnimFinished
    Ped_Utils_SetMiscEventHandlers
    ClearEventHandler BlockerStand
    ClearEventHandler objectinattentionradius
    PlayAnimWithPartialAnimIfExists anim = Ped_Blocker_BlockA_idle Cycle BlendPeriod = 0.01000
    <count> = 60
    <toggle> = 0
    begin 
    if NOT obj_objectinattentionradius
        Ped_Utils_SetMiscEventHandlers
        Ped_StateLogic_SetDefaultState
        return 
    endif
    <count> = (<count> - 1)
    if (<count> = 0)
        <toggle> = (1 - <toggle>)
        if (<toggle> = 0)
            <count> = (randomrange (3.0, 6.0) * 60)
            PlayAnimWithPartialAnimIfExists anim = Ped_Blocker_BlockA_idle Cycle
        else
            <count> = (2 * 60)
            PlayAnimWithPartialAnimIfExists anim = Ped_Blocker_BlockB_idle Cycle
        endif
    endif
    wait 1 gameframe
    repeat 
endscript


script STATECONTROL_blockershuffle 
    Ped_Utils_SetMiscEventHandlers
    ClearEventHandler BlockerShuffle
    ClearEventHandler objectinattentionradius
    if (<dir> = left)
        if obj_animequals name = Ped_Blocker_ShuffleBlockLeft
            obj_setanimcyclemode on
        else
            PlayAnimWithPartialAnimIfExists anim = Ped_Blocker_ShuffleBlockLeft Cycle BlendPeriod = 0.01000 Speed = 1.400
        endif
    else
        if obj_animequals name = Ped_Blocker_ShuffleBlockRight
            obj_setanimcyclemode on
        else
            PlayAnimWithPartialAnimIfExists anim = Ped_Blocker_ShuffleBlockRight Cycle BlendPeriod = 0.01000 Speed = 1.400
        endif
    endif
    begin 
    if NOT obj_objectinattentionradius
        Ped_Utils_SetMiscEventHandlers
        Ped_StateLogic_SetDefaultState
        return 
    endif
    wait 1 gameframe
    repeat 
endscript


script STATECONTROL_blockerrun 
    Ped_Utils_SetMiscEventHandlers
    ClearEventHandler BlockerRun
    ClearEventHandler objectinattentionradius
    Ped_Utils_GetAnimName type = RunAnims
    PlayAnimWithPartialAnimIfExists anim = <AnimName> Cycle BlendPeriod = 0.2000
    begin 
    if NOT obj_objectinattentionradius
        Ped_Utils_SetMiscEventHandlers
        Ped_StateLogic_SetDefaultState
        return 
    endif
    wait 1 gameframe
    repeat 
endscript


script STATECONTROL_blockerbump 
    ped_play_attack_anim no_block
    MakeSkaterGoto PedKnockDown params = {SetVelDir = <VelDir> SetVelSpeed = 700}
    Obj_WaitAnimFinished
    Ped_Utils_SetMiscEventHandlers
    Ped_SetLogicState STATE_blockerStand
endscript


script STATECONTROL_chase 
    Ped_Utils_GetAnimName type = RunAnims
    PlayAnimWithPartialAnimIfExists anim = <AnimName> Cycle
endscript


script STATECONTROL_chasepause 
    begin 
    Ped_Utils_GetAnimName type = StandAnims index = 0
    getrandomvalue name = RepeatCount a = 1 b = 3 integer
    begin 
    ped_rotate_to_skater_from_idle
    PlayAnimWithPartialAnimIfExists anim = <AnimName>
    Obj_WaitAnimFinished
    repeat <RepeatCount>
    ped_rotate_to_skater_from_idle
    Ped_Utils_GetAnimName type = DisgustAnims
    PlayAnimWithPartialAnimIfExists anim = <AnimName>
    Obj_WaitAnimFinished
    repeat 
endscript


script STATECONTROL_chasecatch 
    ped_play_attack_anim no_block
    
    if getsingletag CatchScript
        goto <CatchScript>
    else
        wait 3 seconds
        Ped_SetLogicState STATE_chase
    endif
endscript


script STATECONTROL_gohome 
    Ped_StateLogic_RegisterTempDefaultState {state = STATE_gohome table = Ped_StateLogic_Table}
    Ped_Utils_GetAnimName type = WalkAnims
    PlayAnimWithPartialAnimIfExists anim = <AnimName> Cycle UseAnimTags
endscript


script PEDAI_Sitting_StopWayPoint 
    Ped_StopMoving
    Ped_GetCurrentNodeNames
    obj_movetonode name = <node_from> Speed = 5 mph
    Obj_WaitMove
    Ped_StartMoving
    Ped_SetLogicState STATE_Sitting table = Ped_StateLogic_Table
endscript


script STATECONTROL_Sitting 
    
    Ped_TurnToCurrentWaypointOrientation time = 0.7500
    Ped_Utils_GetAnimName type = TurnAnims
    PlayAnimWithPartialAnimIfExists anim = <AnimName> Cycle
    Obj_WaitRotate
    PlayAnimWithPartialAnimIfExists anim = PED_STND2SIT
    Obj_WaitAnimFinished
    begin 
    getrandomvalue name = RepeatCount a = 5 b = 15 resolution = 10 integer
    Random (
        @ getrandomvalue name = RepeatIdle a = 5 b = 50 resolution = 45 integer
        Obj_CycleAnim anim = PED_SIT_Idle numCycles = <ReapeatIdle>
        @ PlayAnimWithPartialAnimIfExists anim = PED_SIT_Tap
        @ PlayAnimWithPartialAnimIfExists anim = PED_SIT_LookR
        @ PlayAnimWithPartialAnimIfExists anim = PED_SIT_LookL
        @ PlayAnimWithPartialAnimIfExists anim = PED_SIT2SITB
        Obj_WaitAnimFinished
        begin 
        Random (
            @ getrandomvalue name = RepeatIdleB a = 2 b = 10 resolution = 8 integer
            Obj_CycleAnim anim = PED_SITB_Idle numCycles = <ReapeatIdleB>
            @ PlayAnimWithPartialAnimIfExists anim = PED_SITB_LookL
            @ PlayAnimWithPartialAnimIfExists anim = PED_SITB_LookR
        )
        Obj_WaitAnimFinished
        repeat 5
        PlayAnimWithPartialAnimIfExists anim = PED_SITB2SITBL
        Obj_WaitAnimFinished
        begin 
        Random (
            @ getrandomvalue name = RepeatIdleBL a = 2 b = 10 resolution = 8 integer
            Obj_CycleAnim anim = PED_SITBL_Idle numCycles = <ReapeatIdleBL>
            @ PlayAnimWithPartialAnimIfExists anim = PED_SITBL_LookL
            @ PlayAnimWithPartialAnimIfExists anim = PED_SITBL_Shake
            @ PlayAnimWithPartialAnimIfExists anim = PED_SITBL_Shake
            @ PlayAnimWithPartialAnimIfExists anim = PED_SITBL_Tap
        )
        Obj_WaitAnimFinished
        repeat 5
        PlayAnimWithPartialAnimIfExists anim = PED_SITBL2SIT
    )
    Obj_WaitAnimFinished
    repeat <RepeatCount>
    PlayAnimWithPartialAnimIfExists anim = PED_SIT2STND
    Obj_WaitAnimFinished
    Ped_StateLogic_SetDefaultState
endscript


script PEDAI_Vending_StopWayPoint 
    Ped_StopMoving
    Ped_GetCurrentNodeNames
    obj_movetonode name = <node_from> Speed = 5 mph
    Obj_WaitMove
    Ped_StartMoving
    Ped_SetLogicState STATE_Vending table = Ped_StateLogic_Table
endscript


script STATECONTROL_Vending 
    Ped_GetGender
    Ped_TurnToCurrentWaypointOrientation time = 0.7500
    if (<gender> = Male)
        PlayAnimWithPartialAnimIfExists anim = Ped_M_Walk1ToIdle
        Obj_WaitAnimFinished
        PlayAnimWithPartialAnimIfExists anim = Ped_M_IdletoATM
        Obj_WaitAnimFinished
        begin 
        Random (
            @ PlayAnimWithPartialAnimIfExists anim = Ped_M_ATM1
            @ PlayAnimWithPartialAnimIfExists anim = Ped_M_ATM2
        )
        Obj_WaitAnimFinished
        repeat 5
        PlayAnimWithPartialAnimIfExists anim = Ped_M_ATMtoIdle
        Obj_WaitAnimFinished
        PlayAnimWithPartialAnimIfExists anim = Ped_M_Walk1FromIdle
        Obj_WaitAnimFinished
    else
        PEDAI_Female_StopWayPoint
    endif
    Ped_StateLogic_SetDefaultState
endscript


script PEDAI_Corner_StopWayPoint 
    Ped_StopMoving
    Ped_GetCurrentNodeNames
    obj_movetonode name = <node_from> Speed = 5 mph
    Obj_WaitMove
    Ped_StartMoving
    Ped_SetLogicState STATE_Corner table = Ped_StateLogic_Table
endscript


script STATECONTROL_Corner 
    Ped_TurnToCurrentWaypointOrientation time = 0.7500
    Ped_GetGender
    if (<gender> = Male)
        begin 
        PlayAnimWithPartialAnimIfExists anim = Ped_M_LookLeftDown
        Obj_WaitAnimFinished
        PlayAnimWithPartialAnimIfExists anim = Ped_M_Lookright
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
    obj_movetonode name = <node_from> Speed = 5 mph
    Obj_WaitMove
    Ped_StartMoving
    Ped_SetLogicState STATE_Arcade table = Ped_StateLogic_Table
endscript


script STATECONTROL_Arcade 
    Ped_GetGender
    Ped_TurnToCurrentWaypointOrientation time = 0.7500
    if (<gender> = Male)
        PlayAnimWithPartialAnimIfExists anim = Ped_M_Walk1ToIdle
        Obj_WaitAnimFinished
        PlayAnimWithPartialAnimIfExists anim = Ped_M_Idle1toArcade
        Obj_WaitAnimFinished
        begin 
        Random (
            @ PlayAnimWithPartialAnimIfExists anim = Ped_M_ArcadeIdle
            @ PlayAnimWithPartialAnimIfExists anim = Ped_M_Arcade1
            @ PlayAnimWithPartialAnimIfExists anim = Ped_M_Arcade2
        )
        Obj_WaitAnimFinished
        repeat 5
        PlayAnimWithPartialAnimIfExists anim = Ped_M_ArcadetoIdle
        Obj_WaitAnimFinished
        PlayAnimWithPartialAnimIfExists anim = Ped_M_Walk1FromIdle
        Obj_WaitAnimFinished
        Ped_StateLogic_SetDefaultState
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
    Ped_SetLogicState STATE_LookAt table = Ped_StateLogic_Table
endscript


script STATECONTROL_LookAt 
    Ped_GetGender
    Ped_TurnToCurrentWaypointOrientation time = 0.7500
    if (<gender> = Male)
        PlayAnimWithPartialAnimIfExists anim = Ped_M_Walk1ToIdle
        Obj_WaitAnimFinished
        PlayAnimWithPartialAnimIfExists anim = Ped_M_IdletoObserve
        Obj_WaitAnimFinished
        begin 
        Random (
            @ PlayAnimWithPartialAnimIfExists anim = Ped_M_ObserveIdle
            @ PlayAnimWithPartialAnimIfExists anim = Ped_M_ObserveScratch
            @ PlayAnimWithPartialAnimIfExists anim = Ped_M_ObserveWipe
            @ PlayAnimWithPartialAnimIfExists anim = Ped_M_Observe02
        )
        Obj_WaitAnimFinished
        repeat 5
        PlayAnimWithPartialAnimIfExists anim = Ped_M_ObservetoIdle
        Obj_WaitAnimFinished
        PlayAnimWithPartialAnimIfExists anim = Ped_M_Walk1FromIdle
        Obj_WaitAnimFinished
    else
        PEDAI_Female_StopWayPoint
    endif
    Ped_StateLogic_SetDefaultState
endscript


script PEDAI_Wait_StopWayPoint 
    Ped_StopMoving
    Ped_GetCurrentNodeNames
    obj_movetonode name = <node_from> Speed = 5 mph
    Obj_WaitMove
    Ped_StartMoving
    Ped_SetLogicState STATE_Wait table = Ped_StateLogic_Table
endscript


script STATECONTROL_Wait 
    Ped_GetGender
    Ped_TurnToCurrentWaypointOrientation time = 0.7500
    if (<gender> = Male)
        PlayAnimWithPartialAnimIfExists anim = Ped_M_Walk1ToIdle
        Obj_WaitAnimFinished
        begin 
        Random (
            @ PlayAnimWithPartialAnimIfExists anim = Ped_M_LookAtWatch
            @ PlayAnimWithPartialAnimIfExists anim = Ped_M_LookAtWatch2
        )
        Obj_WaitAnimFinished
        repeat 5
        PlayAnimWithPartialAnimIfExists anim = Ped_M_Walk1FromIdle
        Obj_WaitAnimFinished
    else
        PEDAI_Female_StopWayPoint
    endif
    Ped_StateLogic_SetDefaultState
endscript


script PEDAI_TALK_StopWayPoint 
    Ped_StopMoving
    Ped_GetCurrentNodeNames
    obj_movetonode name = <node_from> Speed = 5 mph
    Obj_WaitMove
    Ped_StartMoving
    Ped_SetLogicState STATE_Talk table = Ped_StateLogic_Table
endscript


script STATECONTROL_Talk 
    
    Ped_TurnToCurrentWaypointOrientation time = 0.7500
    begin 
    Random (
        @ PlayAnimWithPartialAnimIfExists anim = Ped_M_Talk2_Idle
        @ PlayAnimWithPartialAnimIfExists anim = Ped_M_Talk2_Idle2
        @ PlayAnimWithPartialAnimIfExists anim = Ped_M_Talk2_RightHere
        @ PlayAnimWithPartialAnimIfExists anim = Ped_M_Talk2_MixIt
        @ PlayAnimWithPartialAnimIfExists anim = Ped_M_Talk2_SureThing
        @ PlayAnimWithPartialAnimIfExists anim = Ped_M_Talk2_Maybe
        @ PlayAnimWithPartialAnimIfExists anim = Ped_M_Talk2_WhatDoYouThink
        @ PlayAnimWithPartialAnimIfExists anim = Ped_M_Talk2_OfCourse
        @ PlayAnimWithPartialAnimIfExists anim = Ped_M_Talk2_BackThere
        @ PlayAnimWithPartialAnimIfExists anim = Ped_M_Talk2_RoundAndRound
        @ PlayAnimWithPartialAnimIfExists anim = Ped_M_Talk2_UpAbove
        @ PlayAnimWithPartialAnimIfExists anim = Ped_M_Talk2_KnowWhatIMean
        @ PlayAnimWithPartialAnimIfExists anim = Ped_M_Talk2_GoAhead
        @ PlayAnimWithPartialAnimIfExists anim = Ped_M_Talk2_TheyllTellYou
    )
    Obj_WaitAnimFinished
    repeat 
endscript


script PEDAI_Female_StopWayPoint 
    PlayAnimWithPartialAnimIfExists anim = Ped_F_WalkToIdle1
    Obj_WaitAnimFinished
    begin 
    Random (
        @ PlayAnimWithPartialAnimIfExists anim = Ped_F_Idle1
        @ PlayAnimWithPartialAnimIfExists anim = Ped_F_Idle1ToIdle2
        Obj_WaitAnimFinished
        begin 
        PlayAnimWithPartialAnimIfExists anim = Ped_F_Idle2
        Obj_WaitAnimFinished
        repeat 3
        PlayAnimWithPartialAnimIfExists anim = Ped_F_Idle2ToIdle1
    )
    Obj_WaitAnimFinished
    repeat 5
    PlayAnimWithPartialAnimIfExists anim = Ped_F_WalkFromIdle1
    Obj_WaitAnimFinished
    Ped_StateLogic_SetDefaultState
endscript


script STATECONTROL_Explode 
    if LevelIs load_NO
        Zombie_SFX_Die
    endif
    broadcastevent type = Zombie_Explode
    PlayAnimWithPartialAnimIfExists anim = default
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

