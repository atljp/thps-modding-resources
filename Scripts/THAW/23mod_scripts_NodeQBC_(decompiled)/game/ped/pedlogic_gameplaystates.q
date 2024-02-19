Blocker_StateLogic_Table = {
    STATE_ObjectInAttentionRadius = { Navigation_mode = PEDMOTION_BLOCKER script_ped_state = STATESCRIPT_blockerwait }
    STATE_ObjectOutOfAttentionRadius = { Navigation_mode = PEDMOTION_BLOCKER script_ped_state = STATESCRIPT_blockerstop }
    STATE_blockerStand = { Navigation_mode = PEDMOTION_BLOCKER script_ped_state = STATESCRIPT_blockerstand }
    STATE_blockerShuffle = { Navigation_mode = PEDMOTION_BLOCKER script_ped_state = STATESCRIPT_blockershuffle }
    STATE_blockerRun = { Navigation_mode = PEDMOTION_BLOCKER script_ped_state = STATESCRIPT_blockerrun }
    STATE_BlockerBumpPlayer = { script_ped_state = STATESCRIPT_blockerbump }
}

script STATESCRIPT_blockerwait 
    PedLogic_RegisterTempEventHandler {event = objectoutofattentionradius handler = STATE_ObjectOutOfAttentionRadius}
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

script STATESCRIPT_blockerstop 
    PedLogic_ClearAllEventHandlers
    Ped_SetFlag \{ PEDLOGIC_RESET_EVENT_HANDLERS }
    PedLogic_SetDefaultState
endscript

script STATESCRIPT_blockerstand 
    PedLogic_GetAnimName type = idleanims ReturnAll
    Ped_PlayAnim anim = (<AnimName> [ 0 ])Cycle
    <count> = 60
    <toggle> = 0
    begin 
    <count> = (<count> - 1)
    if (<count> = 0)
        <toggle> = (1 - <toggle>)
        if (<toggle> = 0)
            <count> = (randomrange (3.0, 6.0) * 60)
            Ped_PlayAnim anim = (<AnimName> [ 0 ])Cycle
        else
            <count> = (2 * 60)
            Ped_PlayAnim anim = (<AnimName> [ 1 ])Cycle
        endif
    endif
    wait 1 gameframe
    repeat 
endscript

script STATESCRIPT_blockershuffle 
    if (<dir> = left)
        if NOT Ped_AnimEquals \{ name = Ped_Blocker_ShuffleBlockLeft }
            Ped_PlayAnim \{ anim = Ped_Blocker_ShuffleBlockLeft Cycle BlendPeriod = 0.01000 Speed = 1.400 }
        endif
    else
        if NOT Ped_AnimEquals \{ name = Ped_Blocker_ShuffleBlockRight }
            Ped_PlayAnim \{ anim = Ped_Blocker_ShuffleBlockRight Cycle BlendPeriod = 0.01000 Speed = 1.400 }
        endif
    endif
endscript

script STATESCRIPT_blockerrun 
    PedLogic_GetAnimName \{ type = run }
    Ped_PlayAnim anim = <AnimName> Cycle BlendPeriod = 0.2000
endscript

script STATESCRIPT_blockerbump 
    broadcastevent \{ type = blockerbump }
    PedLogic_GetAnimName \{ type = attack }
    Ped_PlayAnim anim = <AnimName>
    MakeSkaterGoto PedKnockDown params = {SetVelDir = <VelDir> SetVelSpeed = 700}
    Ped_WaitAnimFinished
    PedLogic_ResetEventHandlers
    Ped_SetLogicState \{ STATE_blockerStand }
endscript
