Ped_RoamStates_Table = {
    STATE_roamingPOI = { Navigation_mode = PEDMOTION_NAVMESH script_ped_state = STATESCRIPT_roamingPOI }
    STATE_roamingPOI_bum = { Navigation_mode = PEDMOTION_NAVMESH script_ped_state = STATESCRIPT_roamingPOI_bum }
    STATE_roamingPOI_chick = { Navigation_mode = PEDMOTION_NAVMESH script_ped_state = STATESCRIPT_roamingPOI_chick }
}

script STATESCRIPT_roamingPOI 
    Ped_StopMoving
    PedLogic_GetAnimName type = stand
    Ped_PlayAnim anim = <AnimName> Cycle
    wait 3 seconds
    begin 
    Ped_GetWaypointNodePos type = POI
    if (GotParam Pos)
        Ped_MoveToPos <Pos> Speed = 5
        wait 2 gameframes
        if Ped_IsMoving
            PedLogic_GetAnimName type = walk
            Ped_PlayAnim anim = <AnimName> Cycle
            Ped_WaitMove
            PedLogic_GetAnimName type = WalkToStand
            Ped_PlayAnim anim = <AnimName>
            Ped_WaitAnimFinished
        else
            PedLogic_RotateToSkater
        endif
    endif
    PedLogic_GetAnimName type = stand
    Ped_PlayAnim anim = <AnimName> Cycle
    wait randomrange (3.0, 5.0) seconds
    Random (
        @ 
        PedLogic_GetAnimName type = Bored
        Ped_PlayAnim anim = <AnimName>
        Ped_WaitAnimFinished
        @ 
        if obj_objectinattentionradius
            PedLogic_RotateToSkater
            PedLogic_GetAnimName type = Wave
            Ped_PlayAnim anim = <AnimName>
            Ped_WaitAnimFinished
        endif
        PedLogic_GetAnimName type = stand
        Ped_PlayAnim anim = <AnimName>
        Ped_WaitAnimFinished
        @ 
        wait 3 seconds
    )
    repeat 
endscript

script STATESCRIPT_roamingPOI_bum 
    Ped_StopMoving
    PedLogic_GetAnimName type = stand
    Ped_PlayAnim anim = <AnimName> Cycle
    wait 3 seconds
    begin 
    Ped_GetWaypointNodePos type = POI
    if (GotParam Pos)
        Ped_MoveToPos <Pos> Speed = 5
        wait 2 gameframes
        if Ped_IsMoving
            PedLogic_GetAnimName type = walk
            Ped_PlayAnim anim = <AnimName> Cycle
            Ped_WaitMove
            PedLogic_GetAnimName type = WalkToStand
            Ped_PlayAnim anim = <AnimName>
            Ped_WaitAnimFinished
        else
            PedLogic_RotateToSkater
        endif
    endif
    PedLogic_GetAnimName type = stand
    Ped_PlayAnim anim = <AnimName> Cycle
    wait randomrange (3.0, 5.0) seconds
    Random (
        @ 
        PedLogic_GetAnimName type = StandToSit
        Ped_PlayAnim anim = <AnimName>
        Ped_WaitAnimFinished
        PedLogic_GetAnimName type = sitting
        Ped_PlayAnim anim = <AnimName> Cycle
        wait randomrange (3.0, 5.0) seconds
        if (randomrange (0.0, 1.0) > 0)
            PedLogic_GetAnimName type = Sitting_special
            Ped_PlayAnim anim = <AnimName>
            Ped_WaitAnimFinished
            PedLogic_GetAnimName type = sitting
            Ped_PlayAnim anim = <AnimName> Cycle
            wait randomrange (1.0, 3.0) seconds
        endif
        if (randomrange (0.0, 1.0) > 0)
            PedLogic_GetAnimName type = SitToSleep
            Ped_PlayAnim anim = <AnimName>
            Ped_WaitAnimFinished
            PedLogic_GetAnimName type = sleeping
            Ped_PlayAnim anim = <AnimName> Cycle
            wait randomrange (3.0, 6.0) seconds
            PedLogic_GetAnimName type = SleepToSit
            Ped_PlayAnim anim = <AnimName>
            Ped_WaitAnimFinished
        endif
        PedLogic_GetAnimName type = SitToStand
        Ped_PlayAnim anim = <AnimName>
        Ped_WaitAnimFinished
        @ 
        PedLogic_GetAnimName type = Stand_special
        Ped_PlayAnim anim = <AnimName>
        Ped_WaitAnimFinished
        @ 
        wait 3 seconds
    )
    repeat 
endscript

script STATESCRIPT_roamingPOI_chick 
    Ped_StopMoving
    PedLogic_GetAnimName type = idle
    Ped_PlayAnim anim = <AnimName> Cycle
    wait 3 seconds
    begin 
    Ped_GetWaypointNodePos type = POI
    if (GotParam Pos)
        Ped_MoveToPos <Pos> Speed = 5
        wait 2 gameframes
        if Ped_IsMoving
            PedLogic_GetAnimName type = walk
            Ped_PlayAnim anim = <AnimName> Cycle
            Ped_WaitMove
        else
            PedLogic_RotateToSkater
        endif
    endif
    PedLogic_GetAnimName type = idle
    Ped_PlayAnim anim = <AnimName> Cycle
    wait randomrange (3.0, 5.0) seconds
    Random (
        @ 
        PedLogic_GetAnimName type = IdleToStand
        Ped_PlayAnim anim = <AnimName>
        Ped_WaitAnimFinished
        PedLogic_GetAnimName type = stand
        Ped_PlayAnim anim = <AnimName> Cycle
        wait randomrange (3.0, 5.0) seconds
        if (randomrange (0.0, 1.0) > 0)
            PedLogic_GetAnimName type = Stand_special
            Ped_PlayAnim anim = <AnimName>
            Ped_WaitAnimFinished
            PedLogic_GetAnimName type = stand
            Ped_PlayAnim anim = <AnimName> Cycle
            wait randomrange (1.0, 3.0) seconds
        endif
        PedLogic_GetAnimName type = StandToIdle
        Ped_PlayAnim anim = <AnimName>
        Ped_WaitAnimFinished
        @ 
        wait 3 seconds
    )
    repeat 
endscript
