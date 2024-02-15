coim_priority_permanent = 0
coim_priority_permanentcleanup = 1
COIM_Priority_NonPermanent = 2
coim_priority_droppedweapons = 3
COIM_Priority_PedLife_Actor = 4
COIM_Priority_PedLife = 5
COIM_Priority_PedlifeDead = 10
coim_priority_effects = 20
Generic_COIM_Size = 409600
Generic_XBox_COIM_Size = 1712128
Career_PedLife_COIM_Size = 0
NonCareer_PedLife_COIM_Size = 0
Career_PedLife_XBOX_COIM_Size = 256819
NonCareer_PedLife_XBOX_COIM_Size = 856064
Generic_COIM_BlockAlign = 4096
Generic_XBox_COIM_BlockAlign = 4096
coim_min_scratch_blocks = 9
Generic_COIM_Params = {
    coim_max_peds_remove_atonce = 2
    coim_kill_relevance = 0.1000
    coim_max_distance = 3000.0
    coim_kill_priority = COIM_Priority_NonPermanent
    coim_permanent_cleanup_relevance = 0.5000
    coim_type_id = generic
}
Spawner_Cleanup_Relevance_Amount = 0.4000
Spawner_Cleanup_Min_Count = 2

script COIM_PreAllocate 
    if ((IsXbox)|| (isPC))
        <blocks> = (<size> / Generic_XBox_COIM_BlockAlign)
    else
        <blocks> = (<size> / Generic_COIM_BlockAlign)
    endif
    if GameModeEquals \{ is_classic }
        ReserveCOIMBlocksForPermObjects (<blocks> / 3)
    else
        ReserveCOIMBlocksForPermObjects <blocks>
    endif
    wait \{ 1 gameframe }
endscript
